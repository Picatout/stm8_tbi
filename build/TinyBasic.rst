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
                           000040    23         F_IFUNC=0x40 ; integer function keyword
                           000080    24         F_CFUNC=0x80 ; character function keyword
                           0000C0    25         F_CONST=0xC0 ; function keyword that return a constant
                                     26 
                           00008C    27 	STACK_SIZE=140
                           0017FF    28 	STACK_EMPTY=RAM_SIZE-1  
                           000003    29         CELL_SIZE=3
                           00003C    30         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
                           001773    31         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    32 	FRUN=0 ; flags run code in variable flags
                           000001    33 	FTRAP=1 ; inside trap handler 
                           000002    34 	FLOOP=2 ; FOR loop in preparation 
                           000003    35 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    36 	FBREAK=4 ; break point flag 
                           000005    37 	FCOMP=5  ; compiling flags 
                                     38 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
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
                           000084    70         TK_INTGR=132    ; 16 bits integer 
                           000085    71         TK_VAR=133
                           000086    72         TK_FLOAT=134    ; float32 
                           000000    73         TK_NONE=0       ; not a token 
                           000002    74         TK_QSTR=2       ; quoted string  
                           000003    75         TK_LABEL=3      ; used for defined, constants, variables
                           000004    76         TK_CHAR=4       ; ASCII character 
                           000005    77         TK_ARRAY=5     ; array variable '@' 
                           000006    78         TK_LPAREN=6     ; left parenthesis '('
                           000007    79         TK_RPAREN=7     ; right parenthesis ')'
                           000008    80         TK_COMMA=8     ; item separator ',' 
                           000009    81         TK_SHARP=9     ; print colon width '#' 
                           00000A    82         TK_COLON=0xa      ; command separator ':' 
                                     83         
                           000010    84         TK_PLUS=0x10    ; addition operator '+'
                           000011    85         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    86         TK_MULT=0x20    ; multiplication operator '*'
                           000021    87         TK_DIV=0x21     ; division operator '/'
                           000022    88         TK_MOD=0x22     ; modulo operator '%'
                                     89 
                                     90         ; don't change these token values 
                                     91         ; values chosen to be used as a mask.
                                     92         ; bit 7   1 for dictionary words else 0 
                                     93         ; bits 6  always 0 
                                     94         ; bits 5:4 identify group 
                                     95         ; bits 3:0 token identifier inside group  
                           000031    96         TK_GT=0x31      ; relation operator '>'
                           000032    97         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033    98         TK_GE=0x33      ; relation operator '>='
                           000034    99         TK_LT=0x34      ; relation operator '<'
                           000036   100         TK_LE=0x36      ; relation operator '<='
                           000035   101         TK_NE=0x35      ; relation operator '<>' not equal 
                                    102         ; token groups 
                           000030   103         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   104         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   105         TK_GRP_ADD=0x10  ; additive operators
                           000020   106         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   107         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   108         CMD_END=2 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                    110 ;--------------------------------------
                                    111 ;   error codes 
                                    112 ;--------------------------------------
                           000000   113     ERR_NONE=0
                           000001   114     ERR_MEM_FULL=1 
                           000002   115     ERR_SYNTAX=2
                           000003   116     ERR_MATH_OVF=3
                           000004   117     ERR_DIV0=4 
                           000005   118     ERR_NO_LINE=5
                           000006   119     ERR_RUN_ONLY=6
                           000007   120     ERR_CMD_ONLY=7
                           000008   121     ERR_DUPLICATE=8
                           000009   122     ERR_NOT_FILE=9
                           00000A   123     ERR_BAD_VALUE=10
                           00000B   124     ERR_NO_ACCESS=11
                           00000C   125     ERR_NO_DATA=12 
                           00000D   126     ERR_NO_PROG=13
                           00000E   127     ERR_NO_FSPACE=14
                           00000F   128     ERR_BUF_FULL=15
                           000010   129     ERR_OVERFLOW=16 
                                    130 
                                    131 ;--------------------------------------
                                    132 ;   assembler flags 
                                    133 ;-------------------------------------
                                    134 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    135 
                                    136      .macro _usec_dly n 
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
                                    157 
                                    158 ;---------------------------------------
                                    159 ;    xtack manipulation macros 
                                    160 ;    Y is used as xstack pointer  
                                    161 ;----------------------------------------
                                    162     ; pop in A:X from XSTACK 
                                    163     .macro _xpop 
                                    164     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     ldw x,y 
                                    166     ldw x,(1,x)
                                    167     addw y,#CELL_SIZE 
                                    168     .endm 
                                    169 
                                    170     ; push A:X  to XSTACK 
                                    171     .macro _xpush 
                                    172     subw y,#CELL_SIZE
                                    173     ld (y),a 
                                    174     ldw (1,y),x 
                                    175     .endm 
                                    176 
                                    177     ; drop from XSTACK 
                                    178     .macro _xdrop 
                                    179     addw y,#CELL_SIZE 
                                    180     .endm 
                                    181 
                                    182     ; @T fetch top xstack 
                                    183     .macro _at_top
                                    184     ld a,(y)
                                    185     ldw x,y 
                                    186     ldw x,(1,x)
                                    187     .endm 
                                    188 
                                    189     ; @N  fetch next on xstack 
                                    190     .macro _at_next 
                                    191     ld a,(3,y)
                                    192     ldw x,y 
                                    193     ldw x,(4,x)
                                    194     .endm 
                                    195 
                                    196     ; !T put on top of xtack 
                                    197     .macro _store_top 
                                    198     ld (y),a 
                                    199     ldw (1,y),x     
                                    200     .endm 
                                    201 
                                    202     ; !N put next on xstack 
                                    203     .macro _store_next 
                                    204     ld (3,y),a 
                                    205     ldw (4,y),x 
                                    206     .endm 
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
                                     68 ;    MULDIV_IDX=LSHIFT_IDX+2
                           000056    69     NEXT_IDX=LSHIFT_IDX+2
                           000058    70     NEW_IDX=NEXT_IDX+2
                           00005A    71     NOT_IDX=NEW_IDX+2
                           00005C    72     ODR_IDX=NOT_IDX+2
                           00005E    73     OR_IDX=ODR_IDX+2
                           000060    74     PAD_IDX=OR_IDX+2
                           000062    75     PAUSE_IDX=PAD_IDX+2
                           000064    76     PMODE_IDX=PAUSE_IDX+2
                           000066    77     PEEK_IDX=PMODE_IDX+2
                           000068    78     PINP_IDX=PEEK_IDX+2
                           00006A    79     POKE_IDX=PINP_IDX+2
                           00006C    80     POUT_IDX=POKE_IDX+2
                           00006E    81    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000070    82     PRTA_IDX=PRT_IDX+2
                           000072    83     PRTB_IDX=PRTA_IDX+2
                           000074    84     PRTC_IDX=PRTB_IDX+2
                           000076    85     PRTD_IDX=PRTC_IDX+2
                           000078    86     PRTE_IDX=PRTD_IDX+2
                           00007A    87     PRTF_IDX=PRTE_IDX+2
                           00007C    88     PRTG_IDX=PRTF_IDX+2
                           00007E    89     PRTH_IDX=PRTG_IDX+2
                           000080    90     PRTI_IDX=PRTH_IDX+2
                           000082    91     QKEY_IDX=PRTI_IDX+2
                           000084    92     READ_IDX=QKEY_IDX+2
                           000086    93     RBT_IDX=READ_IDX+2  ; REBOOT
                           000088    94 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           00008A    95     REST_IDX=REM_IDX+2 ; RESTORE
                           00008C    96     RET_IDX=REST_IDX+2  ; RETURN 
                           00008E    97     RND_IDX=RET_IDX+2 ; RANDOM 
                           000090    98     RSHIFT_IDX=RND_IDX+2
                           000092    99     RUN_IDX=RSHIFT_IDX+2
                           000094   100     SHOW_IDX=RUN_IDX+2
                           000096   101     FREE_IDX=SHOW_IDX+2
                           000098   102     SLEEP_IDX=FREE_IDX+2
                           00009A   103     SPIRD_IDX=SLEEP_IDX+2
                           00009C   104     SPIEN_IDX=SPIRD_IDX+2
                           00009E   105     SPISEL_IDX=SPIEN_IDX+2
                           0000A0   106     SPIWR_IDX=SPISEL_IDX+2
                           0000A2   107     STEP_IDX=SPIWR_IDX+2
                           0000A4   108     STOP_IDX=STEP_IDX+2
                           0000A6   109     TICKS_IDX=STOP_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000A8   110     TIMER_IDX=TICKS_IDX+2
                           0000AA   111     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000AC   112     TO_IDX=TMROUT_IDX+2
                           0000AE   113     TONE_IDX=TO_IDX+2
                           0000B0   114     UBOUND_IDX=TONE_IDX+2
                           0000B2   115     UFLASH_IDX=UBOUND_IDX+2
                           0000B4   116     UNTIL_IDX=UFLASH_IDX+2
                           0000B6   117     USR_IDX=UNTIL_IDX+2
                           0000B8   118     WAIT_IDX=USR_IDX+2
                           0000BA   119     WORDS_IDX=WAIT_IDX+2
                           0000BC   120     WRITE_IDX=WORDS_IDX+2
                           0000BE   121     XOR_IDX=WRITE_IDX+2
                           0000C0   122     SIZE_IDX=XOR_IDX+2 
                           0000C2   123     ON_IDX=SIZE_IDX+2 
                           0000C4   124     GET_IDX=ON_IDX+2
                           0000C6   125     CONST_IDX=GET_IDX+2
                           0000C8   126     EEFREE_IDX=CONST_IDX+2 
                                    127      
                                    128         
                                    129 
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
      008000 82 00 81 32             55     int cold_start			; RESET vector 
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
      008024 82 00 80 B3             68 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008050 82 00 89 0B             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             80 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             81 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             82 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             83 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 9E             84 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
      008092 72 12 00 22      [ 1]  119 	bset flags,#FTRAP 
      008096 CD 85 03         [ 4]  120 	call print_registers
                                    121 ;	call cmd_itf
      008099 72 13 00 22      [ 1]  122 	bres flags,#FTRAP 	
      00809D 80               [11]  123 	iret
                                    124 .endif 
                                    125 
                                    126 ;------------------------------
                                    127 ; TIMER 4 is used to maintain 
                                    128 ; a milliseconds 'ticks' counter
                                    129 ; and decrement 'timer' varaiable
                                    130 ;--------------------------------
      00809E                        131 Timer4UpdateHandler:
      00809E 72 5F 53 42      [ 1]  132 	clr TIM4_SR 
      0080A2 CE 00 10         [ 2]  133 	ldw x,ticks
      0080A5 5C               [ 1]  134 	incw x
      0080A6 CF 00 10         [ 2]  135 	ldw ticks,x 
      0080A9 CE 00 12         [ 2]  136 	ldw x,timer
                                    137 ;	tnzw x 
      0080AC 27 04            [ 1]  138 	jreq 1$
      0080AE 5A               [ 2]  139 	decw x 
      0080AF CF 00 12         [ 2]  140 	ldw timer,x 
      0080B2                        141 1$:	
      0080B2 80               [11]  142 	iret 
                                    143 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                    144 ;------------------------------------
                                    145 ; Triggered by pressing USER UserButton 
                                    146 ; on NUCLEO card.
                                    147 ; This is used to abort a progam lock 
                                    148 ; in infinite loop. 
                                    149 ;------------------------------------
      0080B3                        150 UserButtonHandler:
                                    151 ; wait button release
      0080B3 5F               [ 1]  152 	clrw x
      0080B4 5A               [ 2]  153 1$: decw x 
      0080B5 26 FD            [ 1]  154 	jrne 1$
      0080B7 72 09 50 15 F8   [ 2]  155 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    156 ; if MCU suspended by SLEEP resume program
      0080BC 72 07 00 22 05   [ 2]  157     btjf flags,#FSLEEP,2$
      0080C1 72 17 00 22      [ 1]  158 	bres flags,#FSLEEP 
      0080C5 80               [11]  159 	iret
      0080C6                        160 2$:	
      0080C6                        161 user_interrupted:
      0080C6 72 00 00 22 02   [ 2]  162     btjt flags,#FRUN,4$
      0080CB 20 0A            [ 2]  163 	jra UBTN_Handler_exit 
      0080CD                        164 4$:	; program interrupted by user 
      0080CD 72 11 00 22      [ 1]  165 	bres flags,#FRUN 
      0080D1 AE 80 DF         [ 2]  166 	ldw x,#USER_ABORT
      0080D4 CD 89 DA         [ 4]  167 	call puts 
      0080D7                        168 UBTN_Handler_exit:
      0080D7 AE 17 FF         [ 2]  169     ldw x,#STACK_EMPTY 
      0080DA 94               [ 1]  170     ldw sp,x
      0080DB 9A               [ 1]  171 	rim 
      0080DC CC 97 52         [ 2]  172 5$:	jp warm_start
                                    173 
      0080DF 0A 50 72 6F 67 72 61   174 USER_ABORT: .asciz "\nProgram aborted by user.\n"
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
      0080FA                        188 clock_init:	
      0080FA C1 50 C3         [ 1]  189 	cp a,CLK_CMSR 
      0080FD 27 0C            [ 1]  190 	jreq 2$ ; no switching required 
                                    191 ; select clock source 
      0080FF 72 12 50 C5      [ 1]  192 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008103 C7 50 C4         [ 1]  193 	ld CLK_SWR,a
      008106 C1 50 C3         [ 1]  194 1$:	cp a,CLK_CMSR
      008109 26 FB            [ 1]  195 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      00810B                        196 2$: 	
                                    197 ; HSI and cpu clock divisor 
      00810B 9F               [ 1]  198 	ld a,xl 
      00810C C7 50 C6         [ 1]  199 	ld CLK_CKDIVR,a  
      00810F 81               [ 4]  200 	ret
                                    201 
                                    202 ;----------------------------------
                                    203 ; TIMER2 used as audio tone output 
                                    204 ; on port D:5.
                                    205 ; channel 1 configured as PWM mode 1 
                                    206 ;-----------------------------------  
                                    207 
      008110                        208 timer2_init:
      008110 72 1A 50 C7      [ 1]  209 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008114 35 60 53 05      [ 1]  210  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008118 35 08 53 0C      [ 1]  211 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00811C 81               [ 4]  212 	ret 
                                    213 
                                    214 ;---------------------------------
                                    215 ; TIM4 is configured to generate an 
                                    216 ; interrupt every millisecond 
                                    217 ;----------------------------------
      00811D                        218 timer4_init:
      00811D 72 18 50 C7      [ 1]  219 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008121 35 07 53 45      [ 1]  220 	mov TIM4_PSCR,#7 ; prescale 128  
      008125 35 7D 53 46      [ 1]  221 	mov TIM4_ARR,#125 ; set for 1msec.
      008129 35 05 53 40      [ 1]  222 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00812D 72 10 53 41      [ 1]  223 	bset TIM4_IER,#TIM4_IER_UIE
      008131 81               [ 4]  224 	ret
                                    225 
                                    226 ;-------------------------------------
                                    227 ;  initialization entry point 
                                    228 ;-------------------------------------
      008132                        229 cold_start:
                                    230 ;set stack 
      008132 AE 17 FF         [ 2]  231 	ldw x,#STACK_EMPTY
      008135 94               [ 1]  232 	ldw sp,x
                                    233 ; clear all ram 
      008136 7F               [ 1]  234 0$: clr (x)
      008137 5A               [ 2]  235 	decw x 
      008138 26 FC            [ 1]  236 	jrne 0$
                                    237 ; activate pull up on all inputs 
      00813A A6 FF            [ 1]  238 	ld a,#255 
      00813C C7 50 03         [ 1]  239 	ld PA_CR1,a 
      00813F C7 50 08         [ 1]  240 	ld PB_CR1,a 
      008142 C7 50 0D         [ 1]  241 	ld PC_CR1,a 
      008145 C7 50 12         [ 1]  242 	ld PD_CR1,a 
      008148 C7 50 17         [ 1]  243 	ld PE_CR1,a 
      00814B C7 50 1C         [ 1]  244 	ld PF_CR1,a 
      00814E C7 50 21         [ 1]  245 	ld PG_CR1,a 
      008151 C7 50 2B         [ 1]  246 	ld PI_CR1,a
                                    247 ; set LD2 pin as output 
      008154 72 1A 50 0D      [ 1]  248     bset PC_CR1,#LED2_BIT
      008158 72 1A 50 0E      [ 1]  249     bset PC_CR2,#LED2_BIT
      00815C 72 1A 50 0C      [ 1]  250     bset PC_DDR,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008160 72 1B 50 0A      [ 1]  251 	bres PC_ODR,#LED2_BIT 
                                    252 ; disable schmitt triggers on Arduino CN4 analog inputs
      008164 55 00 3F 54 07   [ 1]  253 	mov ADC_TDRL,0x3f
                                    254 ; disable peripherals clocks
                                    255 ;	clr CLK_PCKENR1 
                                    256 ;	clr CLK_PCKENR2
      008169 72 5F 50 F2      [ 1]  257 	clr AWU_TBR 
      00816D 72 14 50 CA      [ 1]  258 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    259 ; select internal clock no divisor: 16 Mhz 	
      008171 A6 E1            [ 1]  260 	ld a,#CLK_SWR_HSI 
      008173 5F               [ 1]  261 	clrw x  
      008174 CD 80 FA         [ 4]  262     call clock_init 
      008177 CD 81 1D         [ 4]  263 	call timer4_init
      00817A CD 81 10         [ 4]  264 	call timer2_init
                                    265 ; UART1 at 115200 BAUD
      00817D CD 89 38         [ 4]  266 	call uart1_init
                                    267 ; activate PE_4 (user button interrupt)
      008180 72 18 50 18      [ 1]  268     bset PE_CR2,#USR_BTN_BIT 
                                    269 ; display system information
      008184 9A               [ 1]  270 	rim ; enable interrupts 
      008185 72 5C 00 17      [ 1]  271 	inc seedy+1 
      008189 72 5C 00 15      [ 1]  272 	inc seedx+1 
      00818D CD 9C E7         [ 4]  273 	call func_eefree 
      008190 CD 9C 23         [ 4]  274 	call ubound 
      008193 CD 95 24         [ 4]  275 	call clear_basic
      008196 CD A5 0F         [ 4]  276 	call beep_1khz  
      008199 CD 94 D1         [ 4]  277 	call system_information
      00819C                        278 2$:	
                                    279 ; check for application in flash memory 
      00819C CE B6 00         [ 2]  280 	ldw x,app_sign 
      00819F C3 A8 05         [ 2]  281 	cpw x,SIGNATURE 
      0081A2 27 03            [ 1]  282 	jreq run_app
      0081A4 CC 97 52         [ 2]  283 	jp warm_start 
      0081A7                        284 run_app:
                                    285 ; run application in FLASH|EEPROM 
      0081A7 CD 95 02         [ 4]  286 	call warm_init
      0081AA AE B6 04         [ 2]  287 	ldw x,#app 
      0081AD CF 00 1B         [ 2]  288 	ldw txtbgn,x
      0081B0 72 BB B6 02      [ 2]  289 	addw x,app_size 
      0081B4 CF 00 1D         [ 2]  290 	ldw txtend,x 
      0081B7 AE 81 C5         [ 2]  291 	ldw x,#AUTO_RUN 
      0081BA CD 89 DA         [ 4]  292 	call puts 
      0081BD CD 9E 0B         [ 4]  293 	call program_info 
      0081C0 CC A4 B3         [ 2]  294 	jp run_it_02  
      0081C3 20 FE            [ 2]  295     jra .  
                                    296 
      0081C5 20 61 75 74 6F 20 72   297 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    298 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
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
      0081D8                         35 add24: ; ( i1 i2 -- i1 + i2 )
      000158                         36     _xpop 
      0081D8 90 F6            [ 1]    1     ld a,(y)
      0081DA 93               [ 1]    2     ldw x,y 
      0081DB EE 01            [ 2]    3     ldw x,(1,x)
      0081DD 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081E1 89               [ 2]   37     pushw x  
      0081E2 88               [ 1]   38     push a  
      000163                         39     _xpop 
      0081E3 90 F6            [ 1]    1     ld a,(y)
      0081E5 93               [ 1]    2     ldw x,y 
      0081E6 EE 01            [ 2]    3     ldw x,(1,x)
      0081E8 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081EC 72 FB 02         [ 2]   40     addw x,(2,sp)
      0081EF 19 01            [ 1]   41     adc a, (1,sp)
      000171                         42     _xpush 
      0081F1 72 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      0081F5 90 F7            [ 1]    2     ld (y),a 
      0081F7 90 EF 01         [ 2]    3     ldw (1,y),x 
      00017A                         43     _drop 3 
      0081FA 5B 03            [ 2]    1     addw sp,#3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      0081FC 81               [ 4]   44     ret 
                                     45 
                                     46 ;-------------------------------
                                     47 ; sub24 A:X-acc24 
                                     48 ; subtract 24 bits integers 
                                     49 ;------------------------------
      0081FD                         50 sub24: ; (i1 i2 -- i1-i2 ) 
      00017D                         51     _xpop 
      0081FD 90 F6            [ 1]    1     ld a,(y)
      0081FF 93               [ 1]    2     ldw x,y 
      008200 EE 01            [ 2]    3     ldw x,(1,x)
      008202 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008206 89               [ 2]   52     pushw x 
      008207 88               [ 1]   53     push  a
      000188                         54     _at_top  
      008208 90 F6            [ 1]    1     ld a,(y)
      00820A 93               [ 1]    2     ldw x,y 
      00820B EE 01            [ 2]    3     ldw x,(1,x)
      00820D 72 F0 02         [ 2]   55     subw x,(2,sp) 
      008210 12 01            [ 1]   56     sbc a, (1,sp)
      000192                         57     _store_top  
      008212 90 F7            [ 1]    1     ld (y),a 
      008214 90 EF 01         [ 2]    2     ldw (1,y),x     
      000197                         58     _drop 3 
      008217 5B 03            [ 2]    1     addw sp,#3 
      008219 81               [ 4]   59     ret 
                                     60 
                                     61 ;------------------------------
                                     62 ; cp24 
                                     63 ; compare acc24 with A:X 
                                     64 ;-------------------------------
      00821A                         65 cp24:
      00821A C1 00 0D         [ 1]   66     cp a,acc24 
      00821D 26 03            [ 1]   67     jrne 9$ 
      00821F C3 00 0E         [ 2]   68     cpw x,acc16
      008222                         69 9$: 
      008222 81               [ 4]   70     ret 
                                     71 
                                     72 
                                     73 ;-------------------------------
                                     74 ; abs24 
                                     75 ; abolute value of top  
                                     76 ;-------------------------------
      008223                         77 abs24: ; ( i -- u )
      008223 90 F6            [ 1]   78     ld a,(y)
      008225 A1 80            [ 1]   79     cp a,#0x80 
      008227 2A 0E            [ 1]   80     jrpl neg24 ; negative integer
      008229 81               [ 4]   81     ret  
                                     82 
                                     83 ;----------------------------
                                     84 ;  one's compleement 
                                     85 ;----------------------------
      00822A                         86 cpl24:  ; i -- ~i 
      0001AA                         87     _at_top 
      00822A 90 F6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      00822C 93               [ 1]    2     ldw x,y 
      00822D EE 01            [ 2]    3     ldw x,(1,x)
      00822F 43               [ 1]   88     cpl a 
      008230 53               [ 2]   89     cplw x 
      0001B1                         90     _store_top 
      008231 90 F7            [ 1]    1     ld (y),a 
      008233 90 EF 01         [ 2]    2     ldw (1,y),x     
      008236 81               [ 4]   91     ret 
                                     92 
                                     93 ;----------------------------    
                                     94 ; two'2 complement of top  
                                     95 ;---------------------------
      008237                         96 neg24: ; (i -- -i )
      0001B7                         97     _at_top
      008237 90 F6            [ 1]    1     ld a,(y)
      008239 93               [ 1]    2     ldw x,y 
      00823A EE 01            [ 2]    3     ldw x,(1,x)
      00823C 43               [ 1]   98     cpl  a  
      00823D 53               [ 2]   99     cplw x 
      00823E 1C 00 01         [ 2]  100     addw x,#1
      008241 A9 00            [ 1]  101     adc a,#0
      0001C3                        102     _store_top  
      008243 90 F7            [ 1]    1     ld (y),a 
      008245 90 EF 01         [ 2]    2     ldw (1,y),x     
      008248 81               [ 4]  103 9$: ret 
                                    104 
                                    105 ;-----------------------------
                                    106 ; negate integer in A:X 
                                    107 ;----------------------------
      008249                        108 neg_ax:
      008249 43               [ 1]  109     cpl  a  
      00824A 53               [ 2]  110     cplw x 
      00824B 1C 00 01         [ 2]  111     addw x,#1
      00824E A9 00            [ 1]  112     adc a,#0
      008250 81               [ 4]  113     ret 
                                    114 
                                    115 ;------------------------------------
                                    116 ;  two's complement of acc24 
                                    117 ;-------------------------------------
      008251                        118 neg_acc24: ; 
      008251 72 53 00 0D      [ 1]  119     cpl acc24 
      008255 72 53 00 0E      [ 1]  120     cpl acc16 
      008259 72 53 00 0F      [ 1]  121     cpl acc8
      00825D 72 5C 00 0F      [ 1]  122     inc acc8 
      008261 26 0A            [ 1]  123     jrne 9$
      008263 72 5C 00 0E      [ 1]  124     inc acc16 
      008267 26 04            [ 1]  125     jrne 9$
      008269 72 5C 00 0D      [ 1]  126     inc acc24 
      00826D 81               [ 4]  127 9$: ret 
                                    128 
                                    129 
                                    130 ;--------------------------------------
                                    131 ; unsigned multiply uint24_t by uint8_t
                                    132 ; input:
                                    133 ;	acc24	uint24_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                    134 ;   A		uint8_t
                                    135 ; output:
                                    136 ;   acc24   A*acc24
                                    137 ;      A    overflow, bits 31..24 
                                    138 ;-------------------------------------
                                    139 ; local variables offset  on sp
                           000001   140 	U8   = 1   ; A pushed on stack
                           000001   141 	VSIZE = 1 
      00826E                        142 mulu24_8:
      00826E 89               [ 2]  143 	pushw x    ; save X
                                    144 	; local variable
      00826F 88               [ 1]  145 	push a     ; U8
      008270 72 5F 00 0C      [ 1]  146 	clr acc32 
                                    147 ; multiply bits 7..0 * U8   	
      008274 97               [ 1]  148 	ld xl,a 
      008275 C6 00 0F         [ 1]  149 	ld a,acc8 
      008278 42               [ 4]  150 	mul x,a 
      008279 C6 00 0E         [ 1]  151 	ld a, acc16 
      00827C CF 00 0E         [ 2]  152 	ldw acc16,x
                                    153 ; multiply middle byte, bits 15..8 * U8  	
      00827F 97               [ 1]  154 	ld xl,a 
      008280 7B 01            [ 1]  155 	ld a,(U8,sp)
      008282 42               [ 4]  156 	mul x,a 
      008283 C6 00 0D         [ 1]  157 	ld a,acc24
      008286 72 5F 00 0D      [ 1]  158 	clr acc24  
      00828A 72 BB 00 0D      [ 2]  159 	addw x,acc24
      00828E CF 00 0D         [ 2]  160 	ldw acc24,x 
                                    161 ; multiply  MSB, bits 23..16 * U8 
      008291 97               [ 1]  162 	ld xl,a 
      008292 7B 01            [ 1]  163 	ld a,(U8,sp)
      008294 42               [ 4]  164 	mul x,a
      008295 72 BB 00 0C      [ 2]  165 	addw x,acc32  
      008299 CF 00 0C         [ 2]  166 	ldw acc32,x 
      00829C 9E               [ 1]  167 	ld a,xh 
      00021D                        168 	_drop VSIZE  
      00829D 5B 01            [ 2]    1     addw sp,#VSIZE 
      00829F 85               [ 2]  169 	popw x 
      0082A0 81               [ 4]  170 	ret 
                                    171 
                                    172 
                                    173 ;-------------------------------
                                    174 ; mul24 i1 i2 -- i1*i2  
                                    175 ; multiply 24 bits integers 
                                    176 ;------------------------------
                           000001   177     PROD=1 
                           000004   178     N1=4
                           000007   179     N2=7
                           00000A   180     PROD_SIGN=10
                           00000A   181     VSIZE=10 
      0082A1                        182 mul24:
      000221                        183     _vars VSIZE
      0082A1 52 0A            [ 2]    1     sub sp,#VSIZE 
      0082A3 0F 0A            [ 1]  184     clr (PROD_SIGN,sp)
      000225                        185     _xpop 
      0082A5 90 F6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      0082A7 93               [ 1]    2     ldw x,y 
      0082A8 EE 01            [ 2]    3     ldw x,(1,x)
      0082AA 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0082AE 4D               [ 1]  186     tnz a 
      0082AF 2A 05            [ 1]  187     jrpl 0$
      0082B1 03 0A            [ 1]  188     cpl (PROD_SIGN,sp)
      0082B3 CD 82 49         [ 4]  189     call neg_ax 
      0082B6                        190 0$:    
      0082B6 6B 04            [ 1]  191     ld (N1,sp),a 
      0082B8 1F 05            [ 2]  192     ldw (N1+1,sp),x
      00023A                        193     _at_top 
      0082BA 90 F6            [ 1]    1     ld a,(y)
      0082BC 93               [ 1]    2     ldw x,y 
      0082BD EE 01            [ 2]    3     ldw x,(1,x)
      0082BF 4D               [ 1]  194     tnz a 
      0082C0 2A 09            [ 1]  195     jrpl 2$ 
      0082C2 03 0A            [ 1]  196     cpl (PROD_SIGN,sp) 
      0082C4 CD 82 49         [ 4]  197     call neg_ax
      0082C7 6B 07            [ 1]  198     ld (N2,sp),a 
      0082C9 1F 08            [ 2]  199     ldw (N2+1,sp),x   
      0082CB                        200 2$: 
      0082CB C7 00 0D         [ 1]  201     ld acc24,a 
      0082CE CF 00 0E         [ 2]  202     ldw acc16,x 
      0082D1 7B 06            [ 1]  203     ld a,(N1+2,sp); least byte     
      0082D3 27 12            [ 1]  204     jreq 4$
      0082D5 CD 82 6E         [ 4]  205     call mulu24_8
      0082D8 4D               [ 1]  206     tnz a 
      0082D9 26 61            [ 1]  207     jrne 8$ ; overflow 
      0082DB CE 00 0E         [ 2]  208     ldw x,acc16  
      0082DE C6 00 0D         [ 1]  209     ld a,acc24
      0082E1 2B 59            [ 1]  210     jrmi 8$ ; overflow  
      0082E3 6B 01            [ 1]  211     ld (PROD,sp),a
      0082E5 1F 02            [ 2]  212     ldw (PROD+1,sp),x 
      0082E7                        213 4$:
      0082E7 7B 07            [ 1]  214     ld a,(N2,sp) 
      0082E9 1E 08            [ 2]  215     ldw x,(N2+1,sp)
      0082EB C7 00 0D         [ 1]  216     ld acc24,a 
      0082EE CF 00 0E         [ 2]  217     ldw acc16,x 
      0082F1 7B 05            [ 1]  218     ld a,(N1+1,sp); middle byte     
      0082F3 27 1F            [ 1]  219     jreq 5$
      0082F5 CD 82 6E         [ 4]  220     call mulu24_8
      0082F8 4D               [ 1]  221     tnz a 
      0082F9 26 41            [ 1]  222     jrne 8$ ; overflow 
      0082FB C6 00 0D         [ 1]  223     ld a,acc24 
      0082FE 26 3C            [ 1]  224     jrne 8$  ; overflow 
      008300 CE 00 0E         [ 2]  225     ldw x,acc16  
      008303 72 FB 01         [ 2]  226     addw x,(PROD,sp)
      008306 29 34            [ 1]  227     jrv 8$ ; overflow
      008308 1F 01            [ 2]  228     ldw (PROD,sp),x 
      00830A 7B 07            [ 1]  229     ld a,(N2,sp)
      00830C 1E 08            [ 2]  230     ldw x,(N2+1,sp)
      00830E C7 00 0D         [ 1]  231     ld acc24,a 
      008311 CF 00 0E         [ 2]  232     ldw acc16,x 
      008314                        233 5$:
      008314 7B 04            [ 1]  234     ld a,(N1,sp) ; high byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008316 27 16            [ 1]  235     jreq 6$
      008318 CD 82 6E         [ 4]  236     call mulu24_8
      00831B 4D               [ 1]  237     tnz a 
      00831C 26 1E            [ 1]  238     jrne 8$ ; overflow 
      00831E CE 00 0D         [ 2]  239     ldw x,acc24 
      008321 26 19            [ 1]  240     jrne 8$ ; overflow 
      008323 C6 00 0F         [ 1]  241     ld a,acc8 
      008326 2B 14            [ 1]  242     jrmi 8$ ; overflow 
      008328 1B 01            [ 1]  243     add a,(PROD,sp)
      00832A 6B 01            [ 1]  244     ld (PROD,sp),a 
      00832C 29 0E            [ 1]  245     jrv 8$ ; overflow 
      00832E                        246 6$:
      00832E 7B 01            [ 1]  247     ld a,(PROD,sp)
      008330 1E 02            [ 2]  248     ldw x,(PROD+1,sp)
      008332 0D 0A            [ 1]  249     tnz (PROD_SIGN,sp)
      008334 27 03            [ 1]  250     jreq 7$
      008336 CD 82 49         [ 4]  251     call neg_ax 
      008339                        252 7$:
      008339 98               [ 1]  253     rcf ; C=0 means no overflow 
      00833A 20 03            [ 2]  254     jra 9$
      00833C                        255 8$: ; overflow 
      00833C 4F               [ 1]  256     clr a 
      00833D 5F               [ 1]  257     clrw x 
      00833E 99               [ 1]  258     scf ; C=1 means overflow 
      00833F                        259 9$:    
      0002BF                        260     _store_top 
      00833F 90 F7            [ 1]    1     ld (y),a 
      008341 90 EF 01         [ 2]    2     ldw (1,y),x     
      0002C4                        261     _drop VSIZE 
      008344 5B 0A            [ 2]    1     addw sp,#VSIZE 
      008346 81               [ 4]  262     ret 
                                    263 
                                    264 ;-------------------------------------
                                    265 ; divide uint24_t by uint8_t
                                    266 ; input:
                                    267 ;	acc24	dividend
                                    268 ;   A 		divisor
                                    269 ; output:
                                    270 ;   acc24	quotient
                                    271 ;   A		remainder
                                    272 ;------------------------------------- 
                                    273 ; offset  on sp of arguments and locals
                           000001   274 	U8   = 1   ; divisor on stack
                           000001   275 	VSIZE =1
      008347                        276 divu24_8:
      008347 89               [ 2]  277 	pushw x ; save x
      008348 88               [ 1]  278 	push a 
                                    279 	; ld dividend UU:MM bytes in X
      008349 CE 00 0D         [ 2]  280 	ldw x,acc24
      00834C 7B 01            [ 1]  281 	ld a,(U8,SP) ; divisor
      00834E 62               [ 2]  282 	div x,a ; UU:MM/U8
      00834F 88               [ 1]  283 	push a  ;save remainder
      008350 CF 00 0D         [ 2]  284     ldw acc24,x ; quotient 
      008353 84               [ 1]  285 	pop a
      008354 95               [ 1]  286 	ld xh,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008355 C6 00 0F         [ 1]  287 	ld a,acc8
      008358 97               [ 1]  288 	ld xl,a
      008359 7B 01            [ 1]  289 	ld a,(U8,sp) ; divisor
      00835B 62               [ 2]  290 	div x,a  ; R:LL/U8
      00835C 6B 01            [ 1]  291 	ld (U8,sp),a ; save remainder
      00835E 9F               [ 1]  292 	ld a,xl
      00835F C7 00 0F         [ 1]  293 	ld acc8,a
      008362 84               [ 1]  294 	pop a
      008363 85               [ 2]  295 	popw x
      008364 81               [ 4]  296 	ret
                                    297 
                                    298 
                                    299 ;-------------------------------
                                    300 ; div24 N/T   
                                    301 ; divide 24 bits integers
                                    302 ;  i1 i2 -- i1/i2 
                                    303 ;------------------------------
                           000001   304     DIVISOR=1
                           000004   305     CNTR=4
                           000005   306     QSIGN=5
                           000006   307     RSIGN=6 
                           000006   308     VSIZE=6 
      008365                        309 div24:
      0002E5                        310     _vars VSIZE 
      008365 52 06            [ 2]    1     sub sp,#VSIZE 
      008367 0F 06            [ 1]  311     clr (RSIGN,sp)
      008369 0F 05            [ 1]  312     clr (QSIGN,sp)
      0002EB                        313     _xpop 
      00836B 90 F6            [ 1]    1     ld a,(y)
      00836D 93               [ 1]    2     ldw x,y 
      00836E EE 01            [ 2]    3     ldw x,(1,x)
      008370 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008374 4D               [ 1]  314     tnz a 
      008375 2A 05            [ 1]  315     jrpl 0$ 
      008377 03 05            [ 1]  316     cpl (QSIGN,sp)
      008379 CD 82 49         [ 4]  317     call neg_ax
      00837C                        318 0$:
      00837C 6B 01            [ 1]  319     ld  (DIVISOR,sp),a
      00837E 1F 02            [ 2]  320     ldw (DIVISOR+1,sp),x
      008380 1A 02            [ 1]  321     or a,(DIVISOR+1,sp)
      008382 1A 03            [ 1]  322     or a,(DIVISOR+2,sp)
      008384 26 05            [ 1]  323     jrne 1$ 
      008386 A6 04            [ 1]  324     ld a,#ERR_DIV0 
      008388 CC 96 CA         [ 2]  325     jp tb_error 
      00838B                        326 1$: 
      00030B                        327     _at_top
      00838B 90 F6            [ 1]    1     ld a,(y)
      00838D 93               [ 1]    2     ldw x,y 
      00838E EE 01            [ 2]    3     ldw x,(1,x)
      008390 4D               [ 1]  328     tnz a 
      008391 2A 07            [ 1]  329     jrpl 2$
      008393 CD 82 49         [ 4]  330     call neg_ax
      008396 03 05            [ 1]  331     cpl (QSIGN,sp)
      008398 03 06            [ 1]  332     cpl (RSIGN,sp)
      00839A                        333 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00839A C7 00 0D         [ 1]  334     ld acc24,a 
      00839D CF 00 0E         [ 2]  335     ldw acc16,x 
      0083A0 A6 18            [ 1]  336     ld a,#24 
      0083A2 6B 04            [ 1]  337     ld (CNTR,sp),a
      0083A4 7B 01            [ 1]  338     ld a,(DIVISOR,sp)
      0083A6 1E 02            [ 2]  339     ldw x,(DIVISOR+1,sp)
      0083A8 CD 82 1A         [ 4]  340     call cp24 ; A:X-acc24 ?
      0083AB 23 14            [ 2]  341     jrule 22$ 
                                    342 ; quotient=0, remainder=divisor      
      0083AD C6 00 0D         [ 1]  343     ld a,acc24 
      0083B0 CE 00 0E         [ 2]  344     ldw x,acc16 
      0083B3 72 5F 00 0D      [ 1]  345     clr acc24 
      0083B7 72 5F 00 0E      [ 1]  346     clr acc16 
      0083BB 72 5F 00 0F      [ 1]  347     clr acc8 
      0083BF 20 2E            [ 2]  348     jra 6$
      0083C1                        349 22$:     
      0083C1 4F               [ 1]  350     clr a 
      0083C2 5F               [ 1]  351     clrw x 
      0083C3 98               [ 1]  352     rcf  
      0083C4                        353 3$: 
      0083C4 72 59 00 0F      [ 1]  354     rlc acc8 
      0083C8 72 59 00 0E      [ 1]  355     rlc acc16
      0083CC 72 59 00 0D      [ 1]  356     rlc acc24 
      0083D0 59               [ 2]  357     rlcw x  
      0083D1 49               [ 1]  358     rlc a
      0083D2 72 F0 02         [ 2]  359 4$: subw x,(DIVISOR+1,sp) 
      0083D5 12 01            [ 1]  360     sbc a,(DIVISOR,sp)
      0083D7 24 05            [ 1]  361     jrnc 5$
      0083D9 72 FB 02         [ 2]  362     addw x,(DIVISOR+1,sp)
      0083DC 19 01            [ 1]  363     adc a,(DIVISOR,sp)
      0083DE                        364 5$: ; shift carry in QUOTIENT 
      0083DE 8C               [ 1]  365     ccf
      0083DF 0A 04            [ 1]  366     dec (CNTR,sp)
      0083E1 26 E1            [ 1]  367     jrne 3$ 
      0083E3 72 59 00 0F      [ 1]  368     rlc acc8 
      0083E7 72 59 00 0E      [ 1]  369     rlc acc16 
      0083EB 72 59 00 0C      [ 1]  370     rlc acc32 
      0083EF                        371 6$:    
      0083EF 6B 01            [ 1]  372     ld (DIVISOR,sp),a 
      0083F1 1F 02            [ 2]  373     ldw (DIVISOR+1,sp),x 
      0083F3 C6 00 0D         [ 1]  374     ld a,acc24 
      0083F6 CE 00 0E         [ 2]  375     ldw x,acc16 
      0083F9 0D 05            [ 1]  376     tnz (QSIGN,sp)
      0083FB 27 03            [ 1]  377     jreq 8$
      0083FD CD 82 49         [ 4]  378     call neg_ax 
      008400                        379 8$: 
      000380                        380     _store_top 
      008400 90 F7            [ 1]    1     ld (y),a 
      008402 90 EF 01         [ 2]    2     ldw (1,y),x     
      008405 7B 01            [ 1]  381     ld a,(DIVISOR,sp)
      008407 1E 02            [ 2]  382     ldw x,(DIVSOR+1,sp)
      008409                        383 81$:
      008409 0D 06            [ 1]  384     tnz (RSIGN,sp)
      00840B 27 03            [ 1]  385     jreq 9$
      00840D CD 82 49         [ 4]  386     call neg_ax       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000390                        387 9$: _drop VSIZE 
      008410 5B 06            [ 2]    1     addw sp,#VSIZE 
      008412 81               [ 4]  388     ret 
                                    389 
                                    390 
                                    391 ;-------------------------------
                                    392 ; mod24 A:X % acc24 
                                    393 ; remainder 24 bits integers 
                                    394 ; input:
                                    395 ;    acc24   dividend 
                                    396 ;    A:X     divisor 
                                    397 ; output:
                                    398 ;    acc24   acc24 % A:X 
                                    399 ;------------------------------
      008413                        400 mod24:
      008413 CD 83 65         [ 4]  401     call div24 
      000396                        402     _store_top  ; replace quotient by remainder 
      008416 90 F7            [ 1]    1     ld (y),a 
      008418 90 EF 01         [ 2]    2     ldw (1,y),x     
      00841B 81               [ 4]  403     ret 
                                    404 
                                    405 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
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
      00841C                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      00039C                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      00039C                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      00039C                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      00039C                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      00039C                         37 prt_regs::
      00841C AE 84 5F         [ 2]   38 	ldw x,#regs_state 
      00841F CD 89 DA         [ 4]   39 	call puts
                                     40 ; register PC
      008422 16 01            [ 2]   41 	ldw y,(1,sp)
      008424 AE 85 93         [ 2]   42 	ldw x,#REG_EPC 
      008427 CD 84 E4         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      00842A 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      00842C AE 85 A4         [ 2]   46 	ldw x,#REG_CC 
      00842F CD 84 C2         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      008432 7B 07            [ 1]   49 	ld a,(R_A,sp)
      008434 AE 85 A0         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008437 CD 84 C2         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      00843A 16 05            [ 2]   53 	ldw y,(R_X,sp)
      00843C AE 85 9C         [ 2]   54 	ldw x,#REG_X 
      00843F CD 84 E4         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      008442 16 03            [ 2]   57 	ldw y,(R_Y,sp)
      008444 AE 85 98         [ 2]   58 	ldw x,#REG_Y 
      008447 CD 84 E4         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      00844A 90 96            [ 1]   61 	ldw y,sp
      00844C 72 A9 00 08      [ 2]   62 	addw y,#6+ARG_OFS  
      008450 AE 85 A9         [ 2]   63 	ldw x,#REG_SP
      008453 CD 84 E4         [ 4]   64 	call prt_reg16
      008456 A6 0D            [ 1]   65 	ld a,#CR 
      008458 CD 89 7D         [ 4]   66 	call putc
      00845B CD 89 7D         [ 4]   67 	call putc   
      00845E 81               [ 4]   68 	ret 
                                     69 
                                     70 
      00845F 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      008486                         81 prt_peek::
      008486 89               [ 2]   82 	pushw x 
      008487 35 10 00 0B      [ 1]   83 	mov base,#16 
      00848B CD 98 1D         [ 4]   84 	call prt_i16  
      00848E A6 3A            [ 1]   85 	ld a,#': 
      008490 CD 89 7D         [ 4]   86 	call putc 
      008493 A6 20            [ 1]   87 	ld a,#SPACE 
      008495 CD 89 7D         [ 4]   88 	call putc 
      008498 85               [ 2]   89 	popw x 
      008499 F6               [ 1]   90 	ld a,(x)
      00849A 5F               [ 1]   91 	clrw x 
      00849B 97               [ 1]   92 	ld xl,a 
      00849C 35 0A 00 0B      [ 1]   93 	mov base,#10 
      0084A0 CD 98 1D         [ 4]   94 	call prt_i16 
      0084A3 81               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      0084A4                        102 ledon:
      0084A4 72 1A 50 0A      [ 1]  103     bset PC_ODR,#LED2_BIT
      0084A8 81               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      0084A9                        107 ledoff:
      0084A9 72 1B 50 0A      [ 1]  108     bres PC_ODR,#LED2_BIT 
      0084AD 81               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      0084AE                        112 ledtoggle:
      0084AE A6 20            [ 1]  113     ld a,#LED2_MASK
      0084B0 C8 50 0A         [ 1]  114     xor a,PC_ODR
      0084B3 C7 50 0A         [ 1]  115     ld PC_ODR,a
      0084B6 81               [ 4]  116     ret 
                                    117 
      0084B7                        118 left_paren:
      0084B7 A6 20            [ 1]  119 	ld a,#SPACE 
      0084B9 CD 89 7D         [ 4]  120 	call putc
      0084BC A6 28            [ 1]  121 	ld a,#'( 
      0084BE CD 89 7D         [ 4]  122 	call putc 	
      0084C1 81               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      0084C2                        133 prt_reg8:
      0084C2 88               [ 1]  134 	push a 
      0084C3 CD 89 DA         [ 4]  135 	call puts 
      0084C6 7B 01            [ 1]  136 	ld a,(1,sp) 
      0084C8 5F               [ 1]  137 	clrw x 
      0084C9 97               [ 1]  138 	ld xl,a 
      0084CA 35 10 00 0B      [ 1]  139 	mov base,#16
      0084CE CD 98 1D         [ 4]  140 	call prt_i16  
      0084D1 CD 84 B7         [ 4]  141 	call left_paren 
      0084D4 84               [ 1]  142 	pop a 
      0084D5 5F               [ 1]  143 	clrw x 
      0084D6 97               [ 1]  144 	ld xl,a 
      0084D7 35 0A 00 0B      [ 1]  145 	mov base,#10 
      0084DB CD 98 1D         [ 4]  146 	call prt_i16  
      0084DE A6 29            [ 1]  147 	ld a,#') 
      0084E0 CD 89 7D         [ 4]  148 	call putc
      0084E3 81               [ 4]  149 	ret
                                    150 
                                    151 ;--------------------------------
                                    152 ; print 16 bits register 
                                    153 ; input:
                                    154 ;   X   point register name 
                                    155 ;   Y   register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    156 ; output:
                                    157 ;  none
                                    158 ;--------------------------------
      0084E4                        159 prt_reg16: 
      0084E4 90 89            [ 2]  160 	pushw y 
      0084E6 CD 89 DA         [ 4]  161 	call puts 
      0084E9 1E 01            [ 2]  162 	ldw x,(1,sp) 
      0084EB 35 10 00 0B      [ 1]  163 	mov base,#16 
      0084EF CD 98 1D         [ 4]  164 	call prt_i16  
      0084F2 CD 84 B7         [ 4]  165 	call left_paren 
      0084F5 85               [ 2]  166 	popw x 
      0084F6 35 0A 00 0B      [ 1]  167 	mov base,#10 
      0084FA CD 98 1D         [ 4]  168 	call prt_i16  
      0084FD A6 29            [ 1]  169 	ld a,#') 
      0084FF CD 89 7D         [ 4]  170 	call putc
      008502 81               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      008503                        177 print_registers:
      008503 AE 85 56         [ 2]  178 	ldw x,#STATES
      008506 CD 89 DA         [ 4]  179 	call puts
                                    180 ; print EPC 
      008509 AE 85 93         [ 2]  181 	ldw x, #REG_EPC
      00850C CD 89 DA         [ 4]  182 	call puts 
      00850F 7B 0B            [ 1]  183 	ld a, (11,sp)
      008511 C7 00 0F         [ 1]  184 	ld acc8,a 
      008514 7B 0A            [ 1]  185 	ld a, (10,sp) 
      008516 C7 00 0E         [ 1]  186 	ld acc16,a 
      008519 7B 09            [ 1]  187 	ld a,(9,sp) 
      00851B C7 00 0D         [ 1]  188 	ld acc24,a
      00851E 5F               [ 1]  189 	clrw x  
      00851F A6 10            [ 1]  190 	ld a,#16
      008521 CD 98 2D         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      008524 AE 85 9C         [ 2]  193 	ldw x,#REG_X
      008527 16 05            [ 2]  194 	ldw y,(5,sp)
      008529 CD 84 E4         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      00852C AE 85 98         [ 2]  197 	ldw x,#REG_Y
      00852F 16 07            [ 2]  198 	ldw y, (7,sp)
      008531 CD 84 E4         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      008534 AE 85 A0         [ 2]  201 	ldw x,#REG_A
      008537 7B 04            [ 1]  202 	ld a, (4,sp) 
      008539 CD 84 C2         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      00853C AE 85 A4         [ 2]  205 	ldw x,#REG_CC 
      00853F 7B 03            [ 1]  206 	ld a, (3,sp) 
      008541 CD 84 C2         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      008544 AE 85 A9         [ 2]  209 	ldw x,#REG_SP
      008547 90 96            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008549 72 A9 00 0C      [ 2]  211 	addw y,#12
      00854D CD 84 E4         [ 4]  212 	call prt_reg16  
      008550 A6 0A            [ 1]  213 	ld a,#'\n' 
      008552 CD 89 7D         [ 4]  214 	call putc
      008555 81               [ 4]  215 	ret
                                    216 
      008556 0A 52 65 67 69 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008593 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      008598 0A 59 3A 00            219 REG_Y:   .asciz "\nY:" 
      00859C 0A 58 3A 00            220 REG_X:   .asciz "\nX:"
      0085A0 0A 41 3A 00            221 REG_A:   .asciz "\nA:" 
      0085A4 0A 43 43 3A 00         222 REG_CC:  .asciz "\nCC:"
      0085A9 0A 53 50 3A 00         223 REG_SP:  .asciz "\nSP:"
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
      0085AE                        235 cmd_itf:
      0085AE 52 01            [ 2]  236 	sub sp,#VSIZE 
      0085B0 72 5F 00 18      [ 1]  237 	clr farptr 
      0085B4 72 5F 00 19      [ 1]  238 	clr farptr+1 
      0085B8 72 5F 00 1A      [ 1]  239 	clr farptr+2  
      0085BC                        240 repl:
      0085BC A6 0D            [ 1]  241 	ld a,#CR 
      0085BE CD 89 7D         [ 4]  242 	call putc 
      0085C1 A6 3F            [ 1]  243 	ld a,#'? 
      0085C3 CD 89 7D         [ 4]  244 	call putc
      0085C6 72 5F 00 01      [ 1]  245 	clr in.w 
      0085CA 72 5F 00 02      [ 1]  246 	clr in 
      0085CE CD 8A DF         [ 4]  247 	call readln
      0085D1 90 AE 16 68      [ 2]  248 	ldw y,#tib  
      0085D5 90 F6            [ 1]  249 	ld a,(y)
      0085D7 27 E3            [ 1]  250 	jreq repl  
      0085D9 72 5C 00 02      [ 1]  251 	inc in 
      0085DD CD 98 AC         [ 4]  252 	call to_upper 
      0085E0 A1 51            [ 1]  253 	cp a,#'Q 
      0085E2 26 17            [ 1]  254 	jrne test_p
      0085E4                        255 repl_exit:
      0085E4 72 5F 16 68      [ 1]  256 	clr tib 
      0085E8 72 5F 00 04      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0085EC 72 5F 00 02      [ 1]  258 	clr in 
      000570                        259 	_drop #VSIZE 	
      0085F0 5B 01            [ 2]    1     addw sp,##VSIZE 
      0085F2 81               [ 4]  260 	ret  
      0085F3                        261 invalid:
      0085F3 AE 86 74         [ 2]  262 	ldw x,#invalid_cmd 
      0085F6 CD 89 DA         [ 4]  263 	call puts 
      0085F9 20 C1            [ 2]  264 	jra repl 
      0085FB                        265 test_p:	
      0085FB A1 50            [ 1]  266     cp a,#'P 
      0085FD 27 11            [ 1]  267 	jreq mem_peek
      0085FF A1 53            [ 1]  268     cp a,#'S 
      008601 26 F0            [ 1]  269 	jrne invalid 
      008603                        270 print_string:	
      008603 CD 8F 47         [ 4]  271 	call get_token
      008606 A1 84            [ 1]  272 	cp a,#TK_INTGR 
      008608 26 E9            [ 1]  273 	jrne invalid 
      00860A CD 89 DA         [ 4]  274 	call puts
      00860D CC 85 BC         [ 2]  275 	jp repl 	
      008610                        276 mem_peek:
      008610 A6 20            [ 1]  277 	ld a,#SPACE 
      008612 CD 8F 34         [ 4]  278 	call skip  	 
      008615 72 B9 00 01      [ 2]  279 	addw y,in.w 
      008619 AE 16 B8         [ 2]  280 	ldw x,#pad 
      00861C CD 94 28         [ 4]  281 	call strcpy
      00861F AE 16 B8         [ 2]  282 	ldw x,#pad
      008622 CD 98 B8         [ 4]  283 	call atoi24 	
      008625 C6 00 0D         [ 1]  284 	ld a, acc24 
      008628 CA 00 0E         [ 1]  285 	or a,acc16 
      00862B CA 00 0F         [ 1]  286 	or a,acc8 
      00862E 26 02            [ 1]  287 	jrne 1$ 
      008630 20 0C            [ 2]  288 	jra peek_byte  
      008632 CE 00 0D         [ 2]  289 1$:	ldw x,acc24 
      008635 CF 00 18         [ 2]  290 	ldw farptr,x 
      008638 C6 00 0F         [ 1]  291 	ld a,acc8 
      00863B C7 00 1A         [ 1]  292 	ld farptr+2,a 
      00863E                        293 peek_byte:
      00863E CD 86 83         [ 4]  294 	call print_farptr 
      008641 A6 08            [ 1]  295 	ld a,#8 
      008643 6B 01            [ 1]  296 	ld (PSIZE,sp),a 
      008645 5F               [ 1]  297 	clrw x 
      008646 CD 86 9E         [ 4]  298 1$:	call fetchc  
      008649 89               [ 2]  299 	pushw x 
      00864A C7 00 0F         [ 1]  300 	ld acc8,a 
      00864D 5F               [ 1]  301 	clrw x 
      00864E CF 00 0D         [ 2]  302 	ldw acc24,x 
      008651 A6 90            [ 1]  303 	ld a,#16+128
      008653 CD 98 2D         [ 4]  304 	call prt_acc24
      008656 85               [ 2]  305 	popw x 
      008657 0A 01            [ 1]  306 	dec (PSIZE,sp)
      008659 26 EB            [ 1]  307 	jrne 1$ 
      00865B A6 08            [ 1]  308 	ld a,#8 
      00865D CB 00 1A         [ 1]  309 	add a,farptr+2 
      008660 C7 00 1A         [ 1]  310 	ld farptr+2,a
      008663 4F               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008664 C9 00 19         [ 1]  312 	adc a,farptr+1 
      008667 C7 00 19         [ 1]  313 	ld farptr+1,a 
      00866A 4F               [ 1]  314 	clr a 
      00866B C9 00 18         [ 1]  315 	adc a,farptr 
      00866E C7 00 18         [ 1]  316 	ld farptr,a 
      008671 CC 85 BC         [ 2]  317 	jp repl  
                                    318 
      008674 6E 6F 74 20 61 20 63   319 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      008683                        324 print_farptr:
      008683 C6 00 1A         [ 1]  325 	ld a ,farptr+2 
      008686 C7 00 0F         [ 1]  326 	ld acc8,a 
      008689 CE 00 18         [ 2]  327 	ldw x,farptr 
      00868C CF 00 0D         [ 2]  328 	ldw acc24,x 
      00868F 5F               [ 1]  329 	clrw x 
      008690 A6 10            [ 1]  330 	ld a,#16 
      008692 CD 98 2D         [ 4]  331 	call prt_acc24
      008695 A6 20            [ 1]  332 	ld a,#SPACE 
      008697 CD 89 7D         [ 4]  333 	call putc 
      00869A CD 89 7D         [ 4]  334 	call putc 
      00869D 81               [ 4]  335 	ret
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
      00869E                        346 fetchc: ; @C
      00869E 92 AF 00 18      [ 5]  347 	ldf a,([farptr],x)
      0086A2 5C               [ 1]  348 	incw x
      0086A3 81               [ 4]  349 	ret
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
      0086A4                        360 number:
      0086A4 CD 8F 47         [ 4]  361 	call get_token
      0086A7 A1 84            [ 1]  362 	cp a,#TK_INTGR
      0086A9 27 03            [ 1]  363 	jreq 1$
      0086AB CC 96 C8         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0086AE 81               [ 4]  365 1$:	ret
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
      0086AF                        380 show_row:
      0086AF 4D               [ 1]  381 	tnz a 
      0086B0 26 01            [ 1]  382 	jrne 1$
      0086B2 81               [ 4]  383 	ret 
      0086B3                        384 1$:	
      0086B3 89               [ 2]  385 	pushw x  
      0086B4 88               [ 1]  386 	push a 
      0086B5 35 04 00 23      [ 1]  387 	mov tab_width,#4 
      0086B9 CD 98 1D         [ 4]  388 	call prt_i16 
      0086BC A6 20            [ 1]  389 	ld a,#SPACE  
      0086BE CD 89 7D         [ 4]  390 	call putc
      0086C1                        391 row_loop:
      0086C1 1E 02            [ 2]  392 	ldw x,(ADR,sp)
      0086C3 F6               [ 1]  393 	ld a,(x)
      0086C4 5F               [ 1]  394 	clrw x 
      0086C5 97               [ 1]  395 	ld xl,a 
      0086C6 CD 98 1D         [ 4]  396 	call prt_i16 
      0086C9 1E 02            [ 2]  397 	ldw x,(ADR,sp)
      0086CB 5C               [ 1]  398 	incw x 
      0086CC 1F 02            [ 2]  399 	ldw (ADR,sp),x 
      0086CE 0A 01            [ 1]  400 	dec (CNT,sp)
      0086D0 26 EF            [ 1]  401 	jrne row_loop
      000652                        402 	_drop VSIZE  		
      0086D2 5B 03            [ 2]    1     addw sp,#VSIZE 
      0086D4 35 04 00 23      [ 1]  403 	mov tab_width,#4
      0086D8 A6 0D            [ 1]  404 	ld a,#CR 
      0086DA CD 89 7D         [ 4]  405 	call putc 
      0086DD 81               [ 4]  406 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0086DE                        419 hex_dump:
      0086DE 88               [ 1]  420 	push a 
      00065F                        421 	_vars VSIZE
      0086DF 52 04            [ 2]    1     sub sp,#VSIZE 
      0086E1 C6 00 0B         [ 1]  422 	ld a,base
      0086E4 6B 03            [ 1]  423 	ld (BASE,sp),a 
      0086E6 35 10 00 0B      [ 1]  424 	mov base,#16
      0086EA C6 00 23         [ 1]  425 	ld a,tab_width 
      0086ED 6B 04            [ 1]  426 	ld (TABW,sp),a
      0086EF A6 0D            [ 1]  427 	ld a,#CR 
      0086F1 CD 89 7D         [ 4]  428 	call putc 
      0086F4 17 01            [ 2]  429 1$: ldw (BCNT,sp),y
      0086F6 A6 10            [ 1]  430 	ld a,#16
      0086F8 90 A3 00 10      [ 2]  431 	cpw y,#16
      0086FC 2A 02            [ 1]  432 	jrpl 2$
      0086FE 90 9F            [ 1]  433 	ld a,yl
      008700                        434 2$: 	
      008700 CD 86 AF         [ 4]  435 	call show_row 
      008703 16 01            [ 2]  436 	ldw y,(BCNT,sp) 
      008705 72 A2 00 10      [ 2]  437 	subw y,#16 
      008709 90 A3 00 01      [ 2]  438 	cpw y,#1
      00870D 2A E5            [ 1]  439 	jrpl 1$
      00870F 7B 03            [ 1]  440 	ld a,(BASE,sp)
      008711 C7 00 0B         [ 1]  441 	ld base,a
      008714 7B 04            [ 1]  442 	ld a,(TABW,sp)
      008716 C7 00 23         [ 1]  443 	ld tab_width,a 
      000699                        444 	_drop VSIZE
      008719 5B 04            [ 2]    1     addw sp,#VSIZE 
      00871B 84               [ 1]  445 	pop a 
      00871C 81               [ 4]  446 	ret 
                                    447 
                                    448 .endif ; DEBUG 
                                    449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
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
      00871D                         45 unlock_eeprom:
      00871D 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008722 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008726 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      00872A 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00872E 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008732 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008737 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      008738                         62 unlock_flash:
      008738 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00873D 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008741 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008745 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008749 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00874D 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008752 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008753                         76 row_erase:
      008753 88               [ 1]   77 	push a 
      008754 90 89            [ 2]   78 	pushw y 
      008756 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00875A 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00875E 4F               [ 1]   81 	clr a 
      00875F 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      008761 91 A7 00 18      [ 1]   83 	ldf ([farptr],y),a
      008765 90 5C            [ 1]   84     incw y
      008767 91 A7 00 18      [ 1]   85 	ldf ([farptr],y),a
      00876B 90 5C            [ 1]   86     incw y
      00876D 91 A7 00 18      [ 1]   87 	ldf ([farptr],y),a
      008771 90 5C            [ 1]   88     incw y
      008773 91 A7 00 18      [ 1]   89 	ldf ([farptr],y),a
      008777 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00877C 90 85            [ 2]   91 	popw y 
      00877E 84               [ 1]   92 	pop a 
      00877F 81               [ 4]   93 	ret
      008780                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      008780                         97 move_erase_to_ram:
      008780 89               [ 2]   98 	pushw x 
      008781 90 89            [ 2]   99 	pushw y 
      008783 AE 87 80         [ 2]  100 	ldw x,#row_erase_end 
      008786 1D 87 53         [ 2]  101 	subw x,#row_erase
      008789 CF 00 0E         [ 2]  102 	ldw acc16,x 
      00878C AE 16 68         [ 2]  103 	ldw x,#tib 
      00878F 90 AE 87 53      [ 2]  104 	ldw y,#row_erase 
      008793 CD 94 38         [ 4]  105 	call move
      008796 90 85            [ 2]  106 	popw y
      008798 85               [ 2]  107 	popw x
      008799 81               [ 4]  108 	ret 
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
      00879A                        123 program_row:
      00879A 88               [ 1]  124 	push a 
      00879B 90 89            [ 2]  125 	pushw y 
      00879D 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      00879F 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0087A3 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0087A7 90 5F            [ 1]  130 	clrw y 
      0087A9 F6               [ 1]  131 1$:	ld a,(x)
      0087AA 91 A7 00 18      [ 1]  132 	ldf ([farptr],y),a
      0087AE 5C               [ 1]  133 	incw x 
      0087AF 90 5C            [ 1]  134 	incw y 
      0087B1 0A 01            [ 1]  135 	dec (BCNT,sp)
      0087B3 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0087B5 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00073A                        139 	_drop 1 
      0087BA 5B 01            [ 2]    1     addw sp,#1 
      0087BC 90 85            [ 2]  140 	popw y 
      0087BE 84               [ 1]  141 	pop a 
      0087BF 81               [ 4]  142 	ret 
      0087C0                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      0087C0                        149 move_prg_to_ram:
      0087C0 89               [ 2]  150 	pushw x 
      0087C1 90 89            [ 2]  151 	pushw y 
      0087C3 AE 87 C0         [ 2]  152 	ldw x,#program_row_end 
      0087C6 1D 87 9A         [ 2]  153 	subw x,#program_row 
      0087C9 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0087CC AE 16 68         [ 2]  155 	ldw x,#tib ; destination address 
      0087CF 90 AE 87 9A      [ 2]  156 	ldw y,#program_row ; source address 
      0087D3 CD 94 38         [ 4]  157 	call move
      0087D6 90 85            [ 2]  158 	popw y 
      0087D8 85               [ 2]  159 	popw x  
      0087D9 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0087DA                        169 write_buffer:
      0087DA 89               [ 2]  170 	pushw x 
      0087DB 72 5D 00 18      [ 1]  171 	tnz farptr 
      0087DF 26 0D            [ 1]  172 	jrne to_flash 
      0087E1 CE 00 19         [ 2]  173 	ldw x,farptr+1 
      0087E4 A3 B6 00         [ 2]  174 	cpw x,#app_space  
      0087E7 24 05            [ 1]  175 	jruge to_flash 
      0087E9                        176 to_eeprom:
      0087E9 CD 87 1D         [ 4]  177 	call unlock_eeprom
      0087EC 20 03            [ 2]  178 	jra do_programming
      0087EE                        179 to_flash:
      0087EE CD 87 38         [ 4]  180 	call unlock_flash
      0087F1                        181 do_programming:
      0087F1 85               [ 2]  182 	popw x 
      0087F2 CD 16 68         [ 4]  183 	call tib
      0087F5 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0087F9 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0087FD 81               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      0087FE                        197 block_erase:
      0087FE 89               [ 2]  198 	pushw x 
      0087FF CE 00 19         [ 2]  199 	ldw x,farptr+1
      008802 A3 B6 00         [ 2]  200 	cpw x,#app_space 
      008805 24 0C            [ 1]  201 	jruge erase_flash 
                                    202 ; erase eeprom block
      008807 CD 87 1D         [ 4]  203 	call unlock_eeprom 
      00880A CD 16 68         [ 4]  204 	call tib 
      00880D 72 17 50 5F      [ 1]  205 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008811 20 0A            [ 2]  206 	jra erase_exit  
                                    207 ; erase flash block:
      008813                        208 erase_flash:
      008813 CD 87 38         [ 4]  209 	call unlock_flash 
      008816 CD 16 68         [ 4]  210 	call tib 
      008819 72 13 50 5F      [ 1]  211     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00881D                        212 erase_exit: 
      00881D 85               [ 2]  213 	popw x 
      00881E 81               [ 4]  214 	ret 
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
      00881F                        230 write_byte:
      00881F 90 89            [ 2]  231 	pushw y
      0007A1                        232 	_vars VSIZE
      008821 52 02            [ 2]    1     sub sp,#VSIZE 
      008823 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      008825 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
                                    235 ; put addr[15:0] in Y, for bounds check.
      008827 90 CE 00 19      [ 2]  236 	ldw y,farptr+1   ; Y=addr15:0
                                    237 ; check addr[23:16], if <> 0 then it is extened flash memory
      00882B 72 5D 00 18      [ 1]  238 	tnz farptr 
      00882F 26 14            [ 1]  239 	jrne write_flash
      008831 90 A3 B6 00      [ 2]  240     cpw y,#app_space 	 
      008835 24 0E            [ 1]  241     jruge write_flash
      008837 90 A3 40 00      [ 2]  242 	cpw y,#EEPROM_BASE  
      00883B 25 57            [ 1]  243     jrult write_exit
      00883D 90 A3 48 7F      [ 2]  244 	cpw y,#OPTION_END 
      008841 22 51            [ 1]  245 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      008843 20 16            [ 2]  246 	jra write_eeprom 
                                    247 ; write program memory
      008845                        248 write_flash:
      008845 CD 87 38         [ 4]  249 	call unlock_flash 
      008848 9B               [ 1]  250 1$:	sim 
      008849 7B 01            [ 1]  251 	ld a,(BTW,sp)
      00884B 92 A7 00 18      [ 4]  252 	ldf ([farptr],x),a ; farptr[x]=A
      00884F 72 05 50 5F FB   [ 2]  253 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008854 9A               [ 1]  254     rim 
      008855 72 13 50 5F      [ 1]  255     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008859 20 39            [ 2]  256     jra write_exit
                                    257 ; write eeprom and option
      00885B                        258 write_eeprom:
      00885B CD 87 1D         [ 4]  259 	call unlock_eeprom
                                    260 	; check for data eeprom or option eeprom
      00885E 90 A3 48 00      [ 2]  261 	cpw y,#OPTION_BASE
      008862 2B 08            [ 1]  262 	jrmi 1$
      008864 90 A3 48 80      [ 2]  263 	cpw y,#OPTION_END+1
      008868 2A 02            [ 1]  264 	jrpl 1$
      00886A 03 02            [ 1]  265 	cpl (OPT,sp)
      00886C                        266 1$: 
      00886C 0D 02            [ 1]  267     tnz (OPT,sp)
      00886E 27 08            [ 1]  268     jreq 2$
                                    269 	; pour modifier une option il faut modifier ces 2 bits
      008870 72 1E 50 5B      [ 1]  270     bset FLASH_CR2,#FLASH_CR2_OPT
      008874 72 1F 50 5C      [ 1]  271     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008878                        272 2$: 
      008878 7B 01            [ 1]  273     ld a,(BTW,sp)
      00887A 92 A7 00 18      [ 4]  274     ldf ([farptr],x),a
      00887E 0D 02            [ 1]  275     tnz (OPT,sp)
      008880 27 08            [ 1]  276     jreq 3$
      008882 5C               [ 1]  277     incw x
      008883 7B 01            [ 1]  278     ld a,(BTW,sp)
      008885 43               [ 1]  279     cpl a
      008886 92 A7 00 18      [ 4]  280     ldf ([farptr],x),a
      00888A 72 05 50 5F FB   [ 2]  281 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00888F 72 0D 50 5F FB   [ 2]  282 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      008894                        283 write_exit:
      000814                        284 	_drop VSIZE 
      008894 5B 02            [ 2]    1     addw sp,#VSIZE 
      008896 90 85            [ 2]  285 	popw y
      008898 81               [ 4]  286     ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                    300 ;  farptr   point after block
                                    301 ;---------------------------------------------
      008899                        302 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000819                        303 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    304 	; local var 
                           000001   305 	XSAVE=1 
                           000002   306 	VSIZE=2 
      000819                        307 write_block::
      008899 88               [ 1]  308 	push a 
      00081A                        309 	_vars VSIZE
      00889A 52 02            [ 2]    1     sub sp,#VSIZE 
      00889C 1F 01            [ 2]  310 	ldw (XSAVE,sp),x 
      00889E 1E 06            [ 2]  311 	ldw x,(BSIZE,sp) 
      0088A0 27 13            [ 1]  312 	jreq 9$
      0088A2 1E 01            [ 2]  313 1$:	ldw x,(XSAVE,sp)
      0088A4 90 F6            [ 1]  314 	ld a,(y)
      0088A6 CD 88 1F         [ 4]  315 	call write_byte 
      0088A9 5C               [ 1]  316 	incw x 
      0088AA 90 5C            [ 1]  317 	incw y 
      0088AC 1F 01            [ 2]  318 	ldw (XSAVE,sp),x
      0088AE 1E 06            [ 2]  319 	ldw x,(BSIZE,sp)
      0088B0 5A               [ 2]  320 	decw x
      0088B1 1F 06            [ 2]  321 	ldw (BSIZE,sp),x 
      0088B3 26 ED            [ 1]  322 	jrne 1$
      0088B5                        323 9$:
      0088B5 1E 01            [ 2]  324 	ldw x,(XSAVE,sp)
      0088B7 CD 88 EF         [ 4]  325 	call incr_farptr
      00083A                        326 	_drop VSIZE
      0088BA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088BC 84               [ 1]  327 	pop a 
      0088BD 81               [ 4]  328 	ret 
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
      0088BE                        345 write_nbytes:
      0088BE 90 89            [ 2]  346 	pushw y
      0088C0 88               [ 1]  347 	push a 
      0088C1 90 93            [ 1]  348 	ldw y,x
      0088C3 5F               [ 1]  349 	clrw x 
      0088C4                        350 1$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0088C4 90 F6            [ 1]  351 	ld a,(y)
      0088C6 90 5C            [ 1]  352 	incw y
      0088C8 CD 88 1F         [ 4]  353 	call write_byte 
      0088CB 5C               [ 1]  354 	incw x 
      0088CC 0A 01            [ 1]  355 	dec (1,sp)  
      0088CE 26 F4            [ 1]  356 	jrne 1$ 
      0088D0 84               [ 1]  357 9$: pop a 
      0088D1 90 85            [ 2]  358 	popw y 
      0088D3 81               [ 4]  359 	ret 
                                    360 
                                    361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    362 ;;;  flash memory operations
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 
                                    365 ;--------------------------
                                    366 ; align farptr to BLOCK_SIZE 
                                    367 ;---------------------------
      0088D4                        368 row_align:
      0088D4 A6 7F            [ 1]  369 	ld a,#0x7f 
      0088D6 C4 00 1A         [ 1]  370 	and a,farptr+2 
      0088D9 27 13            [ 1]  371 	jreq 1$ 
      0088DB CE 00 19         [ 2]  372 	ldw x,farptr+1 
      0088DE 1C 00 80         [ 2]  373 	addw x,#BLOCK_SIZE 
      0088E1 24 04            [ 1]  374 	jrnc 0$
      0088E3 72 5C 00 18      [ 1]  375 	inc farptr 
      0088E7 9F               [ 1]  376 0$: ld a,xl 
      0088E8 A4 80            [ 1]  377 	and a,#0x80
      0088EA 97               [ 1]  378 	ld xl,a
      0088EB CF 00 19         [ 2]  379 	ldw farptr+1,x  	
      0088EE 81               [ 4]  380 1$:	ret
                                    381 
                                    382 ;--------------------
                                    383 ; input:
                                    384 ;   X     increment 
                                    385 ; output:
                                    386 ;   farptr  incremented 
                                    387 ;---------------------
      0088EF                        388 incr_farptr:
      0088EF 72 BB 00 19      [ 2]  389 	addw x,farptr+1 
      0088F3 24 04            [ 1]  390 	jrnc 1$
      0088F5 72 5C 00 18      [ 1]  391 	inc farptr 
      0088F9 CF 00 19         [ 2]  392 1$:	ldw farptr+1,x  
      0088FC 81               [ 4]  393 	ret 
                                    394 
                                    395 ;-----------------------------------
                                    396 ; scan block for non zero byte 
                                    397 ; block are 128 bytes 
                                    398 ; input:
                                    399 ;    farptr     address block  
                                    400 ; output:
                                    401 ;     A     0 cleared, other not cleared  
                                    402 ;-----------------------------------
      0088FD                        403 scan_block:
      0088FD 5F               [ 1]  404 	clrw x 
      0088FE 92 AF 00 18      [ 5]  405 1$: ldf a,([farptr],x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      008902 26 06            [ 1]  406 	jrne 2$
      008904 5C               [ 1]  407 	incw x 
      008905 A3 00 80         [ 2]  408 	cpw x,#BLOCK_SIZE 
      008908 25 F4            [ 1]  409 	jrult 1$ 
      00890A 81               [ 4]  410 2$:	ret 
                                    411 
                                    412 
                                    413 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
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
      00890B                         66 Uart1RxHandler: ; console receive char 
      00890B 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      008910 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      008913 A1 03            [ 1]   69 	cp a,#CTRL_C 
      008915 26 06            [ 1]   70 	jrne 2$
      008917 CD 89 7D         [ 4]   71 	call putc 
      00891A CC 80 C6         [ 2]   72 	jp user_interrupted
      00891D                         73 2$:
      00891D A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      00891F 26 03            [ 1]   75 	jrne 3$
      008921 CC 81 32         [ 2]   76 	jp cold_start 	
      008924 88               [ 1]   77 3$:	push a 
      008925 A6 26            [ 1]   78 	ld a,#rx1_queue 
      008927 CB 00 2F         [ 1]   79 	add a,rx1_tail 
      00892A 5F               [ 1]   80 	clrw x 
      00892B 97               [ 1]   81 	ld xl,a 
      00892C 84               [ 1]   82 	pop a 
      00892D F7               [ 1]   83 	ld (x),a 
      00892E C6 00 2F         [ 1]   84 	ld a,rx1_tail 
      008931 4C               [ 1]   85 	inc a 
      008932 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008934 C7 00 2F         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      008937 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008938                         97 uart1_init:
      008938 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00893C 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008940 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008944 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008948                        103 uart1_set_baud: 
      008948 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008949 A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      00894B C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      00894E 27 0A            [ 1]  109 	jreq 2$ 
      008950                        110 1$: ; 8 Mhz 	
      008950 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008954 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008958 20 08            [ 2]  113 	jra 3$
      00895A                        114 2$: ; 16 Mhz 	
      00895A 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00895E 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008962                        117 3$:
      008962 72 5F 52 31      [ 1]  118     clr UART1_DR
      008966 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00896A 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00896E 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008973 72 5F 00 2E      [ 1]  122     clr rx1_head 
      008977 72 5F 00 2F      [ 1]  123 	clr rx1_tail
      00897B 84               [ 1]  124 	pop a  
      00897C 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      00897D                        133 putc:: ; console output always on UART1
      00897D                        134 uart1_putc:: 
      00897D 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008982 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008985 81               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      008986                        148 qgetc::
      008986                        149 uart1_qgetc::
      008986 C6 00 2E         [ 1]  150 	ld a,rx1_head 
      008989 C0 00 2F         [ 1]  151 	sub a,rx1_tail 
      00898C 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      00898D                        161 getc:: ;console input
      00898D                        162 uart1_getc::
      00898D CD 89 86         [ 4]  163 	call uart1_qgetc
      008990 27 FB            [ 1]  164 	jreq uart1_getc 
      008992 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008993 A6 26            [ 1]  167 	ld a,#rx1_queue
      008995 CB 00 2E         [ 1]  168 	add a,rx1_head 
      008998 5F               [ 1]  169 	clrw x  
      008999 97               [ 1]  170 	ld xl,a 
      00899A F6               [ 1]  171 	ld a,(x)
      00899B 88               [ 1]  172 	push a
      00899C C6 00 2E         [ 1]  173 	ld a,rx1_head 
      00899F 4C               [ 1]  174 	inc a 
      0089A0 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0089A2 C7 00 2E         [ 1]  176 	ld rx1_head,a 
      0089A5 84               [ 1]  177 	pop a  
      0089A6 85               [ 2]  178 	popw x
      0089A7 81               [ 4]  179 	ret 
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
      0089A8 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
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
      0089B4                        207 get_escape:
      0089B4 CD 89 8D         [ 4]  208     call getc 
      0089B7 A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0089B9 27 02            [ 1]  210     jreq 1$
      0089BB 4F               [ 1]  211     clr a
      0089BC 81               [ 4]  212     ret
      0089BD CD 89 8D         [ 4]  213 1$: call getc 
      0089C0 AE 89 A8         [ 2]  214     ldw x,#convert_table
      0089C3                        215 2$:
      0089C3 F1               [ 1]  216     cp a,(x)
      0089C4 27 08            [ 1]  217     jreq 4$
      0089C6 1C 00 02         [ 2]  218     addw x,#2
      0089C9 7D               [ 1]  219     tnz (x)
      0089CA 26 F7            [ 1]  220     jrne 2$
      0089CC 4F               [ 1]  221     clr a
      0089CD 81               [ 4]  222     ret 
      0089CE 5C               [ 1]  223 4$: incw x 
      0089CF F6               [ 1]  224     ld a,(x)
      0089D0 A1 84            [ 1]  225     cp a,#SUP
      0089D2 26 05            [ 1]  226     jrne 5$
      0089D4 88               [ 1]  227     push a 
      0089D5 CD 89 8D         [ 4]  228     call getc
      0089D8 84               [ 1]  229     pop a 
      0089D9                        230 5$:
      0089D9 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089DA                        241 puts::
      0089DA F6               [ 1]  242     ld a,(x)
      0089DB 27 06            [ 1]  243 	jreq 1$
      0089DD CD 89 7D         [ 4]  244 	call putc 
      0089E0 5C               [ 1]  245 	incw x 
      0089E1 20 F7            [ 2]  246 	jra puts 
      0089E3 81               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0089E4                        258 bksp:
      0089E4 A6 08            [ 1]  259 	ld a,#BS 
      0089E6 CD 89 7D         [ 4]  260 	call putc 
      0089E9 A6 20            [ 1]  261 	ld a,#SPACE 
      0089EB CD 89 7D         [ 4]  262 	call putc 
      0089EE A6 08            [ 1]  263 	ld a,#BS 
      0089F0 CD 89 7D         [ 4]  264 	call putc 
      0089F3 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0089F4                        274 delete_nchar:
      0089F4 88               [ 1]  275 	push a 
      0089F5 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0089F7 27 07            [ 1]  277 	jreq 1$
      0089F9 CD 89 E4         [ 4]  278 	call bksp 
      0089FC 0A 01            [ 1]  279 	dec (1,sp)
      0089FE 20 F5            [ 2]  280 	jra 0$
      008A00 84               [ 1]  281 1$:	pop a 
      008A01 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      008A02                        290 send_escape:
      008A02 A6 1B            [ 1]  291 	ld a,#ESC 
      008A04 CD 89 7D         [ 4]  292 	call putc 
      008A07 A6 5B            [ 1]  293 	ld a,#'[
      008A09 CD 89 7D         [ 4]  294 	call putc 
      008A0C 81               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      008A0D                        311 send_parameter:
      008A0D 89               [ 2]  312 	pushw x 
      008A0E 5F               [ 1]  313 	clrw x 
      008A0F 97               [ 1]  314 	ld xl,a 
      008A10 A6 0A            [ 1]  315 	ld a,#10 
      008A12 62               [ 2]  316 	div x,a 
      008A13 95               [ 1]  317 	ld xh,a 
      008A14 9F               [ 1]  318 	ld a,xl
      008A15 4D               [ 1]  319     tnz a 
      008A16 27 0B            [ 1]  320     jreq 2$
      008A18 A1 09            [ 1]  321 	cp a,#9 
      008A1A 23 02            [ 2]  322 	jrule 1$
      008A1C A6 39            [ 1]  323 	ld a,#'9
      008A1E                        324 1$:
      008A1E AB 30            [ 1]  325 	add a,#'0 
      008A20 CD 89 7D         [ 4]  326 	call putc
      008A23 9E               [ 1]  327 2$:	ld a,xh 
      008A24 AB 30            [ 1]  328 	add a,#'0
      008A26 CD 89 7D         [ 4]  329 	call putc 
      008A29 85               [ 2]  330 	popw x 
      008A2A 81               [ 4]  331 	ret 
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
      008A2B                        344 move_left:
      008A2B 88               [ 1]  345 	push a 
      008A2C CD 8A 02         [ 4]  346 	call send_escape
      008A2F 84               [ 1]  347     pop a
      008A30 CD 8A 0D         [ 4]  348 	call send_parameter 
      008A33 A6 44            [ 1]  349 	ld a,#'D 
      008A35 CD 89 7D         [ 4]  350 	call putc 
      008A38 81               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008A39                        362 move_right:
      008A39 88               [ 1]  363 	push a 
      008A3A CD 8A 02         [ 4]  364 	call send_escape
      008A3D 84               [ 1]  365     pop a
      008A3E CD 8A 0D         [ 4]  366 	call send_parameter 
      008A41 A6 43            [ 1]  367 	ld a,#'C 
      008A43 CD 89 7D         [ 4]  368 	call putc 
      008A46 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A47                        379 spaces::
      008A47 A6 20            [ 1]  380 	ld a,#SPACE 
      008A49 5D               [ 2]  381 1$:	tnzw x
      008A4A 27 06            [ 1]  382 	jreq 9$
      008A4C CD 89 7D         [ 4]  383 	call putc 
      008A4F 5A               [ 2]  384 	decw x
      008A50 20 F7            [ 2]  385 	jra 1$
      008A52                        386 9$: 
      008A52 81               [ 4]  387 	ret 
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
      008A53                        404 insert_char: 
      0009D3                        405 	_vars VSIZE 
      008A53 52 02            [ 2]    1     sub sp,#VSIZE 
      008A55 6B 02            [ 1]  406     ld (KCHAR,sp),a 
      008A57 9E               [ 1]  407     ld a,xh 
      008A58 6B 01            [ 1]  408 	ld (IPOS,sp),a
      008A5A 9F               [ 1]  409     ld a,xl 
      008A5B 6B 03            [ 1]  410     ld (LLEN,sp),a  
      008A5D 93               [ 1]  411     ldw x,y
      008A5E 5C               [ 1]  412     incw x 
      008A5F 7B 03            [ 1]  413     ld a,(LLEN,sp)
      008A61 10 01            [ 1]  414     sub a,(IPOS,sp)
      008A63 4C               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008A64 C7 00 0F         [ 1]  416     ld acc8,a 
      008A67 72 5F 00 0E      [ 1]  417     clr acc16
      008A6B CD 94 38         [ 4]  418     call move
      008A6E 90 AE 16 68      [ 2]  419     ldw y,#tib 
      008A72 7B 01            [ 1]  420     ld a,(IPOS,sp)
      008A74 C7 00 0F         [ 1]  421     ld acc8,a 
      008A77 72 B9 00 0E      [ 2]  422     addw y,acc16 
      008A7B 7B 02            [ 1]  423     ld a,(KCHAR,sp)
      008A7D 90 F7            [ 1]  424     ld (y),a
      008A7F 90 5C            [ 1]  425     incw y  
      008A81 7B 01            [ 1]  426     ld a,(IPOS,sp)
      008A83 CD 8A 2B         [ 4]  427     call move_left
      008A86 AE 16 68         [ 2]  428     ldw x,#tib 
      008A89 CD 89 DA         [ 4]  429     call puts 
      008A8C 7B 03            [ 1]  430     ld a,(LLEN,sp)
      008A8E 10 01            [ 1]  431     sub a,(IPOS,sp) 
      008A90 CD 8A 2B         [ 4]  432     call move_left 
      000A13                        433 	_drop VSIZE 
      008A93 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A95 81               [ 4]  434 	ret 
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
      008A96                        447 delete_under:
      000A16                        448 	_vars VSIZE 
      008A96 52 02            [ 2]    1     sub sp,#VSIZE 
      008A98 6B 02            [ 1]  449     ld (LLEN,sp),a 
      008A9A 9F               [ 1]  450     ld a,xl 
      008A9B 6B 01            [ 1]  451     ld (CPOS,sp),a 
      008A9D 93               [ 1]  452     ldw x,y ; move destination
      008A9E 90 5C            [ 1]  453     incw y  ; move source 
      008AA0 7B 02            [ 1]  454     ld a,(LLEN,sp)
      008AA2 10 01            [ 1]  455     sub a,(CPOS,sp)
      008AA4 4C               [ 1]  456     inc a ; move including zero at end.
      008AA5 C7 00 0F         [ 1]  457     ld acc8,a 
      008AA8 72 5F 00 0E      [ 1]  458     clr acc16 
      008AAC CD 94 38         [ 4]  459 	call move 
      008AAF 90 AE 16 68      [ 2]  460     ldw y,#tib 
      008AB3 7B 01            [ 1]  461     ld a,(CPOS,sp)
      008AB5 C7 00 0F         [ 1]  462     ld acc8,a 
      008AB8 72 B9 00 0E      [ 2]  463     addw y,acc16 
      008ABC 93               [ 1]  464     ldw x,y 
      008ABD CD 89 DA         [ 4]  465     call puts 
      008AC0 A6 20            [ 1]  466     ld a,#SPACE  
      008AC2 CD 89 7D         [ 4]  467     call putc
      008AC5 7B 02            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008AC7 10 01            [ 1]  469     sub a,(CPOS,sp)
      008AC9 CD 8A 2B         [ 4]  470     call move_left 
      008ACC 0A 02            [ 1]  471     dec (LLEN,sp)
      000A4E                        472 	_drop VSIZE 
      008ACE 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AD0 81               [ 4]  473 	ret 
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
      008AD1                        485 delete_line:
      008AD1 CD 8A 02         [ 4]  486     call send_escape
      008AD4 A6 32            [ 1]  487 	ld a,#'2
      008AD6 CD 89 7D         [ 4]  488 	call putc 
      008AD9 A6 4B            [ 1]  489 	ld a,#'K 
      008ADB CD 89 7D         [ 4]  490 	call putc 
      008ADE 81               [ 4]  491 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008ADF                        523 readln::
      000A5F                        524 	_vars VSIZE 
      008ADF 52 04            [ 2]    1     sub sp,#VSIZE 
      008AE1 5F               [ 1]  525 	clrw x 
      008AE2 1F 02            [ 2]  526 	ldw (LL,sp),x 
      008AE4 1F 03            [ 2]  527 	ldw (CPOS,sp),x 
      008AE6 03 04            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      008AE8 90 AE 16 68      [ 2]  529  	ldw y,#tib ; input buffer
      008AEC                        530 readln_loop:
      008AEC CD 89 8D         [ 4]  531 	call getc
      008AEF 6B 01            [ 1]  532 	ld (RXCHAR,sp),a
      008AF1 A1 1B            [ 1]  533     cp a,#ESC 
      008AF3 26 05            [ 1]  534     jrne 0$
      008AF5 CD 89 B4         [ 4]  535     call get_escape 
      008AF8 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      008AFA A1 0D            [ 1]  537 0$:	cp a,#CR
      008AFC 26 03            [ 1]  538 	jrne 1$
      008AFE CC 8C 88         [ 2]  539 	jp readln_quit
      008B01 A1 0A            [ 1]  540 1$:	cp a,#LF 
      008B03 26 03            [ 1]  541 	jrne 2$ 
      008B05 CC 8C 88         [ 2]  542 	jp readln_quit
      008B08                        543 2$:
      008B08 A1 08            [ 1]  544 	cp a,#BS
      008B0A 26 12            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      008B0C 0D 03            [ 1]  547     tnz (CPOS,sp)
      008B0E 27 DC            [ 1]  548     jreq readln_loop 
      008B10 A6 01            [ 1]  549     ld a,#1 
      008B12 CD 8A 2B         [ 4]  550     call move_left
      008B15 0A 03            [ 1]  551     dec (CPOS,sp)
      008B17 90 5A            [ 2]  552     decw y 
      008B19 7B 03            [ 1]  553     ld a,(CPOS,sp) 
      008B1B CC 8C 34         [ 2]  554     jp 12$
      008B1E                        555 3$:
      008B1E A1 04            [ 1]  556 	cp a,#CTRL_D
      008B20 26 1A            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      008B22 CD 8A D1         [ 4]  559 	call delete_line 
      008B25 7B 03            [ 1]  560     ld a,(CPOS,sp)
      008B27 4C               [ 1]  561     inc a 
      008B28 CD 8A 2B         [ 4]  562     call move_left 
      008B2B A6 3E            [ 1]  563 	ld a,#'> 
      008B2D CD 89 7D         [ 4]  564 	call putc 
      008B30 90 AE 16 68      [ 2]  565 	ldw y,#tib
      008B34 90 7F            [ 1]  566 	clr (y)
      008B36 0F 02            [ 1]  567 	clr (LL,sp)
      008B38 0F 03            [ 1]  568 	clr (CPOS,sp)
      008B3A 20 B0            [ 2]  569 	jra readln_loop
      008B3C                        570 4$:
      008B3C A1 12            [ 1]  571 	cp a,#CTRL_R 
      008B3E 26 21            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      008B40 0D 02            [ 1]  574 	tnz (LL,sp)
      008B42 26 A8            [ 1]  575 	jrne readln_loop
      008B44 AE 16 68         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008B47 CD 94 0C         [ 4]  577 	call strlen 
      008B4A 90 AE 16 68      [ 2]  578 	ldw y,#tib 
      008B4E 27 9C            [ 1]  579 	jreq readln_loop
      008B50 6B 02            [ 1]  580 	ld (LL,sp),a 
      008B52 6B 03            [ 1]  581     ld (CPOS,sp),a
      008B54 AE 16 68         [ 2]  582 	ldw x,#tib 
      008B57 CD 89 DA         [ 4]  583 	call puts
      008B5A 0F 01            [ 1]  584 	clr (LL_HB,sp)
      008B5C 72 F9 01         [ 2]  585 	addw y,(LL_HB,sp)
      008B5F 20 8B            [ 2]  586 	jra readln_loop 
      008B61                        587 5$:
      008B61 A1 05            [ 1]  588 	cp a,#CTRL_E 
      008B63 26 49            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      008B65 AE 16 68         [ 2]  591 	ldw x,#tib 
      008B68 CD 98 B8         [ 4]  592 	call atoi24
      008B6B CE 00 0E         [ 2]  593 	ldw x,acc16
      008B6E CD 8C C2         [ 4]  594 	call search_lineno
      008B71 5D               [ 2]  595 	tnzw x 
      008B72 26 0B            [ 1]  596 	jrne 51$
      008B74 0F 02            [ 1]  597 	clr (LL,sp)
      008B76 90 AE 16 68      [ 2]  598 	ldw y,#tib
      008B7A 90 7F            [ 1]  599     clr (y) 	
      008B7C CC 8C 88         [ 2]  600 	jp readln_quit  
      008B7F                        601 51$:
      008B7F CF 00 05         [ 2]  602 	ldw basicptr,x
      008B82 E6 02            [ 1]  603 	ld a,(2,x)
      008B84 C7 00 04         [ 1]  604 	ld count,a 
      008B87 90 AE 16 68      [ 2]  605 	ldw y,#tib 
      008B8B CD 92 30         [ 4]  606 	call decompile 
      008B8E 0F 01            [ 1]  607 	clr (LL_HB,sp)
      008B90 A6 0D            [ 1]  608 	ld a,#CR 
      008B92 CD 89 7D         [ 4]  609 	call putc 
      008B95 A6 3E            [ 1]  610 	ld a,#'>
      008B97 CD 89 7D         [ 4]  611 	call putc
      008B9A AE 16 68         [ 2]  612     ldw x,#tib  
      008B9D CD 94 0C         [ 4]  613 	call strlen 
      008BA0 6B 02            [ 1]  614 	ld (LL,sp),a 
      008BA2 CD 89 DA         [ 4]  615 	call puts 
      008BA5 90 93            [ 1]  616 	ldw y,x
      008BA7 7B 02            [ 1]  617     ld a,(LL,sp)
      008BA9 6B 03            [ 1]  618     ld (CPOS,sp),a  
      008BAB CC 8A EC         [ 2]  619 	jp readln_loop
      008BAE                        620 6$:
      008BAE A1 81            [ 1]  621 	cp a,#ARROW_RIGHT
      008BB0 26 15            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      008BB2 7B 03            [ 1]  624 	ld a,(CPOS,sp)
      008BB4 11 02            [ 1]  625     cp a,(LL,sp)
      008BB6 2B 03            [ 1]  626     jrmi 61$
      008BB8 CC 8A EC         [ 2]  627     jp readln_loop 
      008BBB                        628 61$:
      008BBB A6 01            [ 1]  629     ld a,#1 
      008BBD CD 8A 39         [ 4]  630 	call move_right 
      008BC0 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008BC2 90 5C            [ 1]  632     incw y 
      008BC4 CC 8A EC         [ 2]  633     jp readln_loop 
      008BC7 A1 80            [ 1]  634 7$: cp a,#ARROW_LEFT  
      008BC9 26 13            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      008BCB 0D 03            [ 1]  637 	tnz (CPOS,sp)
      008BCD 26 03            [ 1]  638 	jrne 71$
      008BCF CC 8A EC         [ 2]  639 	jp readln_loop
      008BD2                        640 71$:
      008BD2 A6 01            [ 1]  641     ld a,#1 
      008BD4 CD 8A 2B         [ 4]  642 	call move_left 
      008BD7 0A 03            [ 1]  643 	dec (CPOS,sp)
      008BD9 90 5A            [ 2]  644     decw y 
      008BDB CC 8A EC         [ 2]  645 	jp readln_loop 
      008BDE A1 82            [ 1]  646 8$: cp a,#HOME  
      008BE0 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      008BE2 7B 03            [ 1]  649     ld a,(CPOS,sp)
      008BE4 CD 8A 2B         [ 4]  650     call move_left 
      008BE7 0F 03            [ 1]  651 	clr (CPOS,sp)
      008BE9 90 AE 16 68      [ 2]  652     ldw y,#tib 
      008BED CC 8A EC         [ 2]  653 	jp readln_loop  
      008BF0 A1 83            [ 1]  654 9$: cp a,#KEY_END  
      008BF2 26 26            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      008BF4 7B 03            [ 1]  657 	ld a,(CPOS,sp)
      008BF6 11 02            [ 1]  658 	cp a,(LL,sp)
      008BF8 26 03            [ 1]  659 	jrne 91$
      008BFA CC 8A EC         [ 2]  660 	jp readln_loop 
      008BFD                        661 91$:
      008BFD 7B 02            [ 1]  662 	ld a,(LL,sp)
      008BFF 10 03            [ 1]  663 	sub a,(CPOS,sp)
      008C01 CD 8A 39         [ 4]  664 	call move_right 
      008C04 7B 02            [ 1]  665 	ld a,(LL,sp)
      008C06 6B 03            [ 1]  666 	ld (CPOS,sp),a
      008C08 90 AE 16 68      [ 2]  667     ldw y,#tib
      008C0C 72 5F 00 0E      [ 1]  668     clr acc16 
      008C10 C7 00 0F         [ 1]  669     ld acc8,a 
      008C13 72 B9 00 0E      [ 2]  670     addw y,acc16  
      008C17 CC 8A EC         [ 2]  671 	jp readln_loop 
      008C1A A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      008C1C 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008C1E 03 04            [ 1]  675 	cpl (OVRWR,sp)
      008C20 90 89            [ 2]  676 	pushw y 
      008C22 CD A5 0F         [ 4]  677 	call beep_1khz
      008C25 90 85            [ 2]  678 	popw y 
      008C27 CC 8A EC         [ 2]  679 	jp readln_loop 
      008C2A A1 84            [ 1]  680 11$: cp a,#SUP 
      008C2C 26 11            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      008C2E 7B 03            [ 1]  683     ld a,(CPOS,sp)
      008C30 11 02            [ 1]  684     cp a,(LL,sp)
      008C32 2A 08            [ 1]  685     jrpl 13$
      008C34                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008C34 97               [ 1]  687     ld xl,a    ; cursor position 
      008C35 7B 02            [ 1]  688     ld a,(LL,sp)  ; line length
      008C37 CD 8A 96         [ 4]  689     call delete_under
      008C3A 0A 02            [ 1]  690     dec (LLEN,sp)
      008C3C                        691 13$:
      008C3C CC 8A EC         [ 2]  692     jp readln_loop 
      008C3F                        693 final_test:
      008C3F A1 20            [ 1]  694 	cp a,#SPACE
      008C41 2A 03            [ 1]  695 	jrpl accept_char
      008C43 CC 8A EC         [ 2]  696 	jp readln_loop
      008C46                        697 accept_char:
      008C46 A6 4F            [ 1]  698 	ld a,#TIB_SIZE-1
      008C48 11 02            [ 1]  699 	cp a, (LL,sp)
      008C4A 2A 03            [ 1]  700 	jrpl 1$
      008C4C CC 8A EC         [ 2]  701 	jp readln_loop
      008C4F 0D 04            [ 1]  702 1$:	tnz (OVRWR,sp)
      008C51 26 18            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008C53 7B 03            [ 1]  705     ld a,(CPOS,sp)
      008C55 11 02            [ 1]  706     cp a,(LL,sp)
      008C57 27 12            [ 1]  707     jreq overwrite
      008C59 7B 02            [ 1]  708     ld a,(LL,sp)
      008C5B 97               [ 1]  709     ld xl,a 
      008C5C 7B 03            [ 1]  710     ld a,(CPOS,sp)
      008C5E 95               [ 1]  711     ld xh,a
      008C5F 7B 01            [ 1]  712     ld a,(RXCHAR,sp)
      008C61 CD 8A 53         [ 4]  713     call insert_char
      008C64 0C 02            [ 1]  714     inc (LLEN,sp)
      008C66 0C 03            [ 1]  715     inc (CPOS,sp)
      008C68 CC 8A EC         [ 2]  716     jp readln_loop 
      008C6B                        717 overwrite:
      008C6B 7B 01            [ 1]  718 	ld a,(RXCHAR,sp)
      008C6D 90 F7            [ 1]  719 	ld (y),a
      008C6F 90 5C            [ 1]  720     incw y
      008C71 CD 89 7D         [ 4]  721     call putc 
      008C74 7B 03            [ 1]  722 	ld a,(CPOS,sp)
      008C76 11 02            [ 1]  723 	cp a,(LL,sp)
      008C78 2B 09            [ 1]  724 	jrmi 1$
      008C7A 90 7F            [ 1]  725 	clr (y)
      008C7C 0C 02            [ 1]  726 	inc (LL,sp)
      008C7E 0C 03            [ 1]  727     inc (CPOS,sp)
      008C80 CC 8A EC         [ 2]  728 	jp readln_loop 
      008C83                        729 1$:	
      008C83 0C 03            [ 1]  730 	inc (CPOS,sp)
      008C85 CC 8A EC         [ 2]  731 	jp readln_loop 
      008C88                        732 readln_quit:
      008C88 90 AE 16 68      [ 2]  733 	ldw y,#tib
      008C8C 0F 01            [ 1]  734     clr (LL_HB,sp) 
      008C8E 72 F9 01         [ 2]  735     addw y,(LL_HB,sp)
      008C91 90 7F            [ 1]  736     clr (y)
      008C93 7B 02            [ 1]  737 	ld a,(LL,sp)
      008C95 C7 00 04         [ 1]  738 	ld count,a 
      008C98 A6 0D            [ 1]  739 	ld a,#CR
      008C9A CD 89 7D         [ 4]  740 	call putc
      000C1D                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008C9D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C9F 81               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      008CA0                        750 print_hex::
      008CA0 88               [ 1]  751 	push a 
      008CA1 4E               [ 1]  752 	swap a 
      008CA2 CD 8C B7         [ 4]  753 	call to_hex_char 
      008CA5 CD 89 7D         [ 4]  754 	call putc 
      008CA8 7B 01            [ 1]  755     ld a,(1,sp) 
      008CAA CD 8C B7         [ 4]  756 	call to_hex_char
      008CAD CD 89 7D         [ 4]  757 	call putc
      008CB0 A6 20            [ 1]  758 	ld a,#SPACE 
      008CB2 CD 89 7D         [ 4]  759 	call putc 
      008CB5 84               [ 1]  760 	pop a 
      008CB6 81               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      008CB7                        770 to_hex_char::
      008CB7 A4 0F            [ 1]  771 	and a,#15 
      008CB9 A1 09            [ 1]  772 	cp a,#9 
      008CBB 23 02            [ 2]  773 	jrule 1$ 
      008CBD AB 07            [ 1]  774 	add a,#7
      008CBF AB 30            [ 1]  775 1$: add a,#'0 
      008CC1 81               [ 4]  776 	ret 
                                    777 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
      008CC2                         51 search_lineno::
      000C42                         52 	_vars VSIZE
      008CC2 52 02            [ 2]    1     sub sp,#VSIZE 
      008CC4 0F 01            [ 1]   53 	clr (LL,sp)
      008CC6 90 CE 00 1B      [ 2]   54 	ldw y,txtbgn
      008CCA 4D               [ 1]   55 	tnz a 
      008CCB 27 04            [ 1]   56 	jreq search_ln_loop
      008CCD 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008CD1                         58 search_ln_loop:
      008CD1 90 C3 00 1D      [ 2]   59 	cpw y,txtend 
      008CD5 2A 10            [ 1]   60 	jrpl 8$
      008CD7 90 F3            [ 1]   61 	cpw x,(y)
      008CD9 27 0E            [ 1]   62 	jreq 9$
      008CDB 2B 0A            [ 1]   63 	jrmi 8$ 
      008CDD 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CE0 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CE2 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008CE5 20 EA            [ 2]   67 	jra search_ln_loop 
      008CE7                         68 8$: 
      008CE7 5F               [ 1]   69 	clrw x 	
      008CE8 51               [ 1]   70 	exgw x,y 
      000C69                         71 9$: _drop VSIZE
      008CE9 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CEB 51               [ 1]   72 	exgw x,y   
      008CEC 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008CED                         83 del_line: 
      000C6D                         84 	_vars VSIZE 
      008CED 52 04            [ 2]    1     sub sp,#VSIZE 
      008CEF E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008CF1 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008CF3 0F 01            [ 1]   87 	clr (LLEN,sp)
      008CF5 90 93            [ 1]   88 	ldw y,x  
      008CF7 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008CFA 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008CFC 90 CE 00 1D      [ 2]   91 	ldw y,txtend 
      008D00 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008D03 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008D07 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008D09 CD 94 38         [ 4]   95 	call move
      008D0C 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008D10 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008D13 90 CF 00 1D      [ 2]   98 	ldw txtend,y  
      000C97                         99 	_drop VSIZE     
      008D17 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D19 81               [ 4]  100 	ret 
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
      008D1A                        115 create_gap:
      000C9A                        116 	_vars VSIZE
      008D1A 52 06            [ 2]    1     sub sp,#VSIZE 
      008D1C 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008D1E 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008D20 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008D24 90 93            [ 1]  120 	ldw y,x ; SRC
      008D26 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008D2A 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008D2C CE 00 1D         [ 2]  124 	ldw x,txtend 
      008D2F 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008D32 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D35 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D37 CD 94 38         [ 4]  128 	call move
      008D3A CE 00 1D         [ 2]  129 	ldw x,txtend
      008D3D 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D40 CF 00 1D         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      000CC3                        132 9$:	_drop VSIZE 
      008D43 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D45 81               [ 4]  133 	ret 
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
      008D46                        150 insert_line:
      000CC6                        151 	_vars VSIZE 
      008D46 52 08            [ 2]    1     sub sp,#VSIZE 
      008D48 CE 00 1D         [ 2]  152 	ldw x,txtend  
      008D4B C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008D4E 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D50 AE 00 02         [ 2]  156 	ldw x,#2 
      008D53 72 D6 00 19      [ 4]  157 	ld a,([ptr16],x)
      008D57 A1 03            [ 1]  158 	cp a,#3
      008D59 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D5B 5F               [ 1]  160 	clrw x 
      008D5C 97               [ 1]  161 	ld xl,a
      008D5D 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D5F CE 00 1B         [ 2]  163 	ldw x,txtbgn
      008D62 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D64 CE 00 1D         [ 2]  165 	ldw x,txtend 
      008D67 20 38            [ 2]  166 	jra 4$
      008D69 72 CE 00 19      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D6D 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D6F AE 00 02         [ 2]  170 	ldw x,#2 
      008D72 72 D6 00 19      [ 4]  171 	ld a,([ptr16],x)
      008D76 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D77 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D79 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D7B 4F               [ 1]  177 	clr a 
      008D7C CD 8C C2         [ 4]  178 	call search_lineno 
      008D7F 5D               [ 2]  179 	tnzw x 
      008D80 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D82 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D84 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008D86 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008D88 CD 8C ED         [ 4]  188 	call del_line
      008D8B                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008D8B A6 03            [ 1]  192 	ld a,#3
      008D8D 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008D8F 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008D91 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008D93 C3 00 1D         [ 2]  198 	cpw x,txtend 
      008D96 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008D98 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008D9A 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008D9C CD 8D 1A         [ 4]  204 	call create_gap
      008D9F 20 06            [ 2]  205 	jra 5$
      008DA1                        206 4$: 
      008DA1 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008DA4 CF 00 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008DA7 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008DA9 CF 00 0E         [ 2]  211 	ldw acc16,x 
      008DAC 90 AE 16 B8      [ 2]  212 	ldw y,#pad ;SRC 
      008DB0 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008DB2 CD 94 38         [ 4]  214 	call move 
      008DB5                        215 insert_ln_exit:	
      000D35                        216 	_drop VSIZE
      008DB5 5B 08            [ 2]    1     addw sp,#VSIZE 
      008DB7 81               [ 4]  217 	ret
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
      008DB8                        233 parse_quote: 
      000D38                        234 	_vars VSIZE 
      008DB8 52 02            [ 2]    1     sub sp,#VSIZE 
      008DBA 4F               [ 1]  235 	clr a
      008DBB 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008DBD                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008DBD 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008DC0 27 24            [ 1]  239 	jreq 6$
      008DC2 72 5C 00 02      [ 1]  240 	inc in 
      008DC6 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008DC8 A6 5C            [ 1]  242 	ld a,#'\
      008DCA 11 01            [ 1]  243 	cp a, (PREV,sp)
      008DCC 26 0A            [ 1]  244 	jrne 3$
      008DCE 0F 01            [ 1]  245 	clr (PREV,sp)
      008DD0 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008DD2 AD 1C            [ 4]  247 	callr convert_escape
      008DD4 F7               [ 1]  248 	ld (x),a 
      008DD5 5C               [ 1]  249 	incw x 
      008DD6 20 E5            [ 2]  250 	jra 2$
      008DD8                        251 3$:
      008DD8 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DDA A1 5C            [ 1]  253 	cp a,#'\'
      008DDC 27 DD            [ 1]  254 	jreq 1$
      008DDE A1 22            [ 1]  255 	cp a,#'"
      008DE0 27 04            [ 1]  256 	jreq 6$ 
      008DE2 F7               [ 1]  257 	ld (x),a 
      008DE3 5C               [ 1]  258 	incw x 
      008DE4 20 D7            [ 2]  259 	jra 2$
      008DE6                        260 6$:
      008DE6 7F               [ 1]  261 	clr (x)
      008DE7 5C               [ 1]  262 	incw x 
      008DE8 90 93            [ 1]  263 	ldw y,x 
      008DEA 5F               [ 1]  264 	clrw x 
      008DEB A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D6D                        266 	_drop VSIZE
      008DED 5B 02            [ 2]    1     addw sp,#VSIZE 
      008DEF 81               [ 4]  267 	ret 
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
      008DF0                        278 convert_escape:
      008DF0 89               [ 2]  279 	pushw x 
      008DF1 AE 8E 05         [ 2]  280 	ldw x,#escaped 
      008DF4 F1               [ 1]  281 1$:	cp a,(x)
      008DF5 27 06            [ 1]  282 	jreq 2$
      008DF7 7D               [ 1]  283 	tnz (x)
      008DF8 27 09            [ 1]  284 	jreq 3$
      008DFA 5C               [ 1]  285 	incw x 
      008DFB 20 F7            [ 2]  286 	jra 1$
      008DFD 1D 8E 05         [ 2]  287 2$: subw x,#escaped 
      008E00 9F               [ 1]  288 	ld a,xl 
      008E01 AB 07            [ 1]  289 	add a,#7
      008E03 85               [ 2]  290 3$:	popw x 
      008E04 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    292 
      008E05 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008E0D                        310 parse_integer: ; { -- n }
      008E0D 89               [ 2]  311 	pushw x 	
      008E0E 4B 00            [ 1]  312 	push #0 ; TCHAR
      008E10 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008E12 A1 24            [ 1]  314 	cp a,#'$
      008E14 26 04            [ 1]  315 	jrne 2$ 
      000D96                        316     _drop #1
      008E16 5B 01            [ 2]    1     addw sp,##1 
      008E18 4B 10            [ 1]  317 	push #16  ; BASE=16
      008E1A F7               [ 1]  318 2$:	ld (x),a 
      008E1B 5C               [ 1]  319 	incw x 
      008E1C 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008E1F 72 5C 00 02      [ 1]  321 	inc in 
      008E23 CD 98 AC         [ 4]  322 	call to_upper 
      008E26 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008E28 CD 8E AE         [ 4]  324 	call is_digit 
      008E2B 25 ED            [ 1]  325 	jrc 2$
      008E2D A6 10            [ 1]  326 	ld a,#16 
      008E2F 11 01            [ 1]  327 	cp a,(BASE,sp)
      008E31 26 0A            [ 1]  328 	jrne 3$ 
      008E33 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E35 A1 41            [ 1]  330 	cp a,#'A 
      008E37 2B 04            [ 1]  331 	jrmi 3$ 
      008E39 A1 47            [ 1]  332 	cp a,#'G 
      008E3B 2B DD            [ 1]  333 	jrmi 2$ 
      008E3D 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E41 7F               [ 1]  335     clr (x)
      008E42 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E44 CD 98 B8         [ 4]  337 	call atoi24
      008E47 90 93            [ 1]  338 	ldw y,x
      008E49 C6 00 0D         [ 1]  339 	ld a,acc24 
      008E4C 90 F7            [ 1]  340 	ld (y),a 
      008E4E 72 A9 00 01      [ 2]  341 	addw y,#1  
      008E52 CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E55 90 FF            [ 2]  343 	ldw (y),x 
      008E57 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      008E5B A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DDD                        346 	_drop VSIZE  
      008E5D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E5F 81               [ 4]  347 	ret 	
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
      008E60                        364 parse_binary: ; { -- n }
      008E60 4B 00            [ 1]  365 	push #0
      008E62 4B 00            [ 1]  366 	push #0
      008E64 4B 00            [ 1]  367 	push #0
      008E66                        368 2$:	
      008E66 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E69 72 5C 00 02      [ 1]  370 	inc in 
      008E6D A1 30            [ 1]  371 	cp a,#'0 
      008E6F 27 06            [ 1]  372 	jreq 3$
      008E71 A1 31            [ 1]  373 	cp a,#'1 
      008E73 27 02            [ 1]  374 	jreq 3$ 
      008E75 20 0B            [ 2]  375 	jra bin_exit 
      008E77 A0 30            [ 1]  376 3$: sub a,#'0 
      008E79 46               [ 1]  377 	rrc a
      008E7A 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E7C 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E7E 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E80 20 E4            [ 2]  381 	jra 2$  
      008E82                        382 bin_exit:
      008E82 72 5A 00 02      [ 1]  383 	dec in 
      008E86 90 93            [ 1]  384 	ldw y,x
      008E88 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008E8A C7 00 0D         [ 1]  386 	ld acc24,a 
      008E8D 1E 02            [ 2]  387 	ldw x,(BINARY+1,sp)
      008E8F CF 00 0E         [ 2]  388 	ldw acc16,x
      008E92 90 FF            [ 2]  389 	ldw (y),x 
      008E94 72 A9 00 02      [ 2]  390 	addw y,#2  
      008E98 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000E1A                        392 	_drop VSIZE 
      008E9A 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E9C 81               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      008E9D                        402 is_alpha::
      008E9D A1 41            [ 1]  403 	cp a,#'A 
      008E9F 8C               [ 1]  404 	ccf 
      008EA0 24 0B            [ 1]  405 	jrnc 9$ 
      008EA2 A1 5B            [ 1]  406 	cp a,#'Z+1 
      008EA4 25 07            [ 1]  407 	jrc 9$ 
      008EA6 A1 61            [ 1]  408 	cp a,#'a 
      008EA8 8C               [ 1]  409 	ccf 
      008EA9 24 02            [ 1]  410 	jrnc 9$
      008EAB A1 7B            [ 1]  411 	cp a,#'z+1
      008EAD 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008EAE                        421 is_digit::
      008EAE A1 30            [ 1]  422 	cp a,#'0
      008EB0 25 03            [ 1]  423 	jrc 1$
      008EB2 A1 3A            [ 1]  424     cp a,#'9+1
      008EB4 8C               [ 1]  425 	ccf 
      008EB5 8C               [ 1]  426 1$:	ccf 
      008EB6 81               [ 4]  427     ret
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
      008EB7                        438 is_alnum::
      008EB7 CD 8E AE         [ 4]  439 	call is_digit
      008EBA 25 03            [ 1]  440 	jrc 1$ 
      008EBC CD 8E 9D         [ 4]  441 	call is_alpha
      008EBF 81               [ 4]  442 1$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008EC0                        453 is_symbol_char: 
      008EC0 A1 5F            [ 1]  454 	cp a,#'_ 
      008EC2 26 03            [ 1]  455 	jrne 1$
      008EC4 99               [ 1]  456 	scf 
      008EC5 20 03            [ 2]  457 	jra 9$ 
      008EC7 CD 8E B7         [ 4]  458 1$:	call is_alnum 
      008ECA 81               [ 4]  459 9$: ret 
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
      008ECB                        473 parse_symbol:
      008ECB 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008ECC                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008ECC CD 98 AC         [ 4]  477 	call to_upper  
      008ECF F7               [ 1]  478 	ld (x), a 
      008ED0 5C               [ 1]  479 	incw x
      008ED1 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008ED4 72 5C 00 02      [ 1]  481 	inc in 
      008ED8 CD 8E C0         [ 4]  482 	call is_symbol_char 
      008EDB 25 EF            [ 1]  483 	jrc symb_loop 
      008EDD 7F               [ 1]  484 	clr (x)
      008EDE 72 5A 00 02      [ 1]  485 	dec in  
      008EE2 81               [ 4]  486 	ret 
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
                                    497 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    498 ;   pad 	keyword|var_name  
                                    499 ;--------------------------  
                           000001   500 	XFIRST=1
                           000002   501 	VSIZE=2
      008EE3                        502 parse_keyword: 
      008EE3 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EE4 CD 8E CB         [ 4]  504 	call parse_symbol
      008EE7 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008EE9 E6 02            [ 1]  506 	ld a,(2,x)
      008EEB 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008EED E6 01            [ 1]  509 	ld a,(1,x) 
      008EEF A0 41            [ 1]  510 	sub a,#'A 
      008EF1 AE 00 03         [ 2]  511 	ldw x,#3 
      008EF4 42               [ 4]  512 	mul x,a 
      008EF5 1C 00 30         [ 2]  513 	addw x,#vars 
      008EF8 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008EFA 20 24            [ 2]  515 	jra 4$ 
      008EFC                        516 2$: ; check for keyword, otherwise syntax error.
      000E7C                        517 	_ldx_dict kword_dict ; dictionary entry point
      008EFC AE B3 70         [ 2]    1     ldw x,#kword_dict+2
      008EFF 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008F01 90 5C            [ 1]  519 	incw y 
      008F03 CD 99 22         [ 4]  520 	call search_dict
      008F06 4D               [ 1]  521 	tnz a
      008F07 26 17            [ 1]  522 	jrne 4$ 
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008F09 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008F0B A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008F0D 90 F7            [ 1]  527 	ld (y),a 
      008F0F 90 5C            [ 1]  528 	incw y
      008F11                        529 24$:	
      008F11 90 F6            [ 1]  530     ld a,(y)
      008F13 27 04            [ 1]  531 	jreq 3$
      008F15 90 5C            [ 1]  532 	incw y 
      008F17 20 F8            [ 2]  533 	jra 24$ 
      008F19 90 5C            [ 1]  534 3$: incw y 
      008F1B A6 03            [ 1]  535 	ld a,#TK_LABEL 
      008F1D 5F               [ 1]  536 	clrw x 	
      008F1E 20 11            [ 2]  537 	jra 5$ 
      008F20                        538 4$:	
      008F20 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008F22 A3 00 4E         [ 2]  540 	cpw x,#LET_IDX 
      008F25 27 0A            [ 1]  541 	jreq 5$  ; don't compile LET command 
      008F27 90 F7            [ 1]  542 	ld (y),a 
      008F29 90 5C            [ 1]  543 	incw y 
      008F2B 90 FF            [ 2]  544 	ldw (y),x
      008F2D 72 A9 00 02      [ 2]  545 	addw y,#2  
      000EB1                        546 5$:	_drop VSIZE 
      008F31 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F33 81               [ 4]  547 	ret  	
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
      008F34                        558 skip:
      008F34 88               [ 1]  559 	push a
      008F35 91 D6 01         [ 4]  560 1$:	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008F38 27 0A            [ 1]  561 	jreq 2$
      008F3A 11 01            [ 1]  562 	cp a,(C,sp)
      008F3C 26 06            [ 1]  563 	jrne 2$
      008F3E 72 5C 00 02      [ 1]  564 	inc in
      008F42 20 F1            [ 2]  565 	jra 1$
      000EC4                        566 2$: _drop 1 
      008F44 5B 01            [ 2]    1     addw sp,#1 
      008F46 81               [ 4]  567 	ret
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
      008F47                        592 get_token:: 
      000EC7                        593 	_vars VSIZE
      008F47 52 02            [ 2]    1     sub sp,#VSIZE 
                                    594 ;	ld a,in 
                                    595 ;	sub a,count
                                    596 ;   jrmi 0$
                                    597 ;	clr a 
                                    598 ;	ret 
      008F49                        599 0$: 
      008F49 90 AE 16 68      [ 2]  600 	ldw y,#tib    	
      008F4D A6 20            [ 1]  601 	ld a,#SPACE
      008F4F CD 8F 34         [ 4]  602 	call skip
      008F52 55 00 02 00 03   [ 1]  603 	mov in.saved,in 
      008F57 91 D6 01         [ 4]  604 	ld a,([in.w],y)
      008F5A 26 05            [ 1]  605 	jrne 1$
      008F5C 90 93            [ 1]  606 	ldw y,x 
      008F5E CC 91 03         [ 2]  607 	jp token_exit ; end of line 
      008F61 72 5C 00 02      [ 1]  608 1$:	inc in 
      008F65 CD 98 AC         [ 4]  609 	call to_upper 
      008F68 6B 01            [ 1]  610 	ld (TCHAR,sp),a 
                                    611 ; check for quoted string
      008F6A                        612 str_tst:  	
      000EEA                        613 	_case '"' nbr_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008F6A A6 22            [ 1]    1 	ld a,#'"' 
      008F6C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F6E 26 0A            [ 1]    3 	jrne nbr_tst
      008F70 A6 02            [ 1]  614 	ld a,#TK_QSTR
      008F72 F7               [ 1]  615 	ld (x),a 
      008F73 5C               [ 1]  616 	incw x 
      008F74 CD 8D B8         [ 4]  617 	call parse_quote
      008F77 CC 91 03         [ 2]  618 	jp token_exit
      008F7A                        619 nbr_tst:
                                    620 ; check for hexadecimal number 
      008F7A A6 24            [ 1]  621 	ld a,#'$'
      008F7C 11 01            [ 1]  622 	cp a,(TCHAR,sp) 
      008F7E 27 17            [ 1]  623 	jreq 1$
                                    624 ;check for binary number 
      008F80 A6 26            [ 1]  625 	ld a,#'&
      008F82 11 01            [ 1]  626 	cp a,(TCHAR,sp)
      008F84 26 0A            [ 1]  627 	jrne 0$
      008F86 A6 84            [ 1]  628 	ld a,#TK_INTGR
      008F88 F7               [ 1]  629 	ld (x),a 
      008F89 5C               [ 1]  630 	incw x 
      008F8A CD 8E 60         [ 4]  631 	call parse_binary ; expect binary integer 
      008F8D CC 91 03         [ 2]  632 	jp token_exit 
                                    633 ; check for decimal number 	
      008F90 7B 01            [ 1]  634 0$:	ld a,(TCHAR,sp)
      008F92 CD 8E AE         [ 4]  635 	call is_digit
      008F95 24 0C            [ 1]  636 	jrnc 3$
      008F97 A6 84            [ 1]  637 1$:	ld a,#TK_INTGR 
      008F99 F7               [ 1]  638 	ld (x),a 
      008F9A 5C               [ 1]  639 	incw x 
      008F9B 7B 01            [ 1]  640 	ld a,(TCHAR,sp)
      008F9D CD 8E 0D         [ 4]  641 	call parse_integer 
      008FA0 CC 91 03         [ 2]  642 	jp token_exit 
      008FA3                        643 3$: 
      000F23                        644 	_case '(' bkslsh_tst 
      008FA3 A6 28            [ 1]    1 	ld a,#'(' 
      008FA5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FA7 26 05            [ 1]    3 	jrne bkslsh_tst
      008FA9 A6 06            [ 1]  645 	ld a,#TK_LPAREN
      008FAB CC 90 FF         [ 2]  646 	jp token_char   	
      008FAE                        647 bkslsh_tst: ; character token 
      000F2E                        648 	_case '\',rparnt_tst
      008FAE A6 5C            [ 1]    1 	ld a,#'\' 
      008FB0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FB2 26 16            [ 1]    3 	jrne rparnt_tst
      008FB4 A6 04            [ 1]  649 	ld a,#TK_CHAR 
      008FB6 F7               [ 1]  650 	ld (x),a 
      008FB7 5C               [ 1]  651 	incw x 
      008FB8 91 D6 01         [ 4]  652 	ld a,([in.w],y)
      008FBB F7               [ 1]  653 	ld (x),a 
      008FBC 5C               [ 1]  654 	incw x
      008FBD 90 93            [ 1]  655 	ldw y,x 	 
      008FBF 72 5C 00 02      [ 1]  656 	inc in  
      008FC3 5F               [ 1]  657 	clrw x 
      008FC4 97               [ 1]  658 	ld xl,a 
      008FC5 A6 04            [ 1]  659 	ld a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008FC7 CC 91 03         [ 2]  660 	jp token_exit 
      008FCA                        661 rparnt_tst:		
      000F4A                        662 	_case ')' colon_tst 
      008FCA A6 29            [ 1]    1 	ld a,#')' 
      008FCC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FCE 26 05            [ 1]    3 	jrne colon_tst
      008FD0 A6 07            [ 1]  663 	ld a,#TK_RPAREN 
      008FD2 CC 90 FF         [ 2]  664 	jp token_char
      008FD5                        665 colon_tst:
      000F55                        666 	_case ':' comma_tst 
      008FD5 A6 3A            [ 1]    1 	ld a,#':' 
      008FD7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FD9 26 05            [ 1]    3 	jrne comma_tst
      008FDB A6 0A            [ 1]  667 	ld a,#TK_COLON 
      008FDD CC 90 FF         [ 2]  668 	jp token_char  
      008FE0                        669 comma_tst:
      000F60                        670 	_case COMMA sharp_tst 
      008FE0 A6 2C            [ 1]    1 	ld a,#COMMA 
      008FE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE4 26 05            [ 1]    3 	jrne sharp_tst
      008FE6 A6 08            [ 1]  671 	ld a,#TK_COMMA
      008FE8 CC 90 FF         [ 2]  672 	jp token_char
      008FEB                        673 sharp_tst:
      000F6B                        674 	_case SHARP dash_tst 
      008FEB A6 23            [ 1]    1 	ld a,#SHARP 
      008FED 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FEF 26 05            [ 1]    3 	jrne dash_tst
      008FF1 A6 09            [ 1]  675 	ld a,#TK_SHARP
      008FF3 CC 90 FF         [ 2]  676 	jp token_char  	 	 
      008FF6                        677 dash_tst: 	
      000F76                        678 	_case '-' at_tst 
      008FF6 A6 2D            [ 1]    1 	ld a,#'-' 
      008FF8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FFA 26 05            [ 1]    3 	jrne at_tst
      008FFC A6 11            [ 1]  679 	ld a,#TK_MINUS  
      008FFE CC 90 FF         [ 2]  680 	jp token_char 
      009001                        681 at_tst:
      000F81                        682 	_case '@' qmark_tst 
      009001 A6 40            [ 1]    1 	ld a,#'@' 
      009003 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009005 26 05            [ 1]    3 	jrne qmark_tst
      009007 A6 05            [ 1]  683 	ld a,#TK_ARRAY 
      009009 CC 90 FF         [ 2]  684 	jp token_char
      00900C                        685 qmark_tst:
      000F8C                        686 	_case '?' tick_tst 
      00900C A6 3F            [ 1]    1 	ld a,#'?' 
      00900E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009010 26 12            [ 1]    3 	jrne tick_tst
      009012 A6 80            [ 1]  687 	ld a,#TK_CMD  
      009014 F7               [ 1]  688 	ld (x),a 
      009015 5C               [ 1]  689 	incw x 
      009016 90 93            [ 1]  690 	ldw y,x 
      009018 AE 00 6E         [ 2]  691 	ldw x,#PRT_IDX 
      00901B 90 FF            [ 2]  692 	ldw (y),x 
      00901D 72 A9 00 02      [ 2]  693 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009021 CC 91 03         [ 2]  694 	jp token_exit
      009024                        695 tick_tst: ; comment 
      000FA4                        696 	_case TICK plus_tst 
      009024 A6 27            [ 1]    1 	ld a,#TICK 
      009026 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009028 26 35            [ 1]    3 	jrne plus_tst
      00902A A6 80            [ 1]  697 	ld a,#TK_CMD
      00902C F7               [ 1]  698 	ld (x),a 
      00902D 5C               [ 1]  699 	incw x
      00902E 90 AE 00 88      [ 2]  700 	ldw y,#REM_IDX
      009032 FF               [ 2]  701 	ldw (x),y 
      009033 1C 00 02         [ 2]  702 	addw x,#2  
      009036                        703 copy_comment:
      009036 90 AE 16 68      [ 2]  704 	ldw y,#tib 
      00903A 72 B9 00 01      [ 2]  705 	addw y,in.w
      00903E 90 89            [ 2]  706 	pushw y
      009040 CD 94 28         [ 4]  707 	call strcpy
      009043 72 F2 01         [ 2]  708     subw y,(1,sp)
      009046 90 9F            [ 1]  709 	ld a,yl 
      009048 CB 00 02         [ 1]  710 	add a,in
      00904B C7 00 02         [ 1]  711 	ld in,a 
      00904E 1F 01            [ 2]  712 	ldw (1,sp),x
      009050 72 F9 01         [ 2]  713 	addw y,(1,sp)
      009053 90 5C            [ 1]  714 	incw y 
      000FD5                        715 	_drop 2 
      009055 5B 02            [ 2]    1     addw sp,#2 
      009057 AE 00 88         [ 2]  716 	ldw x,#REM_IDX 
      00905A A6 80            [ 1]  717 	ld a,#TK_CMD 
      00905C CC 91 03         [ 2]  718 	jp token_exit 
      00905F                        719 plus_tst:
      000FDF                        720 	_case '+' star_tst 
      00905F A6 2B            [ 1]    1 	ld a,#'+' 
      009061 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009063 26 05            [ 1]    3 	jrne star_tst
      009065 A6 10            [ 1]  721 	ld a,#TK_PLUS  
      009067 CC 90 FF         [ 2]  722 	jp token_char 
      00906A                        723 star_tst:
      000FEA                        724 	_case '*' slash_tst 
      00906A A6 2A            [ 1]    1 	ld a,#'*' 
      00906C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00906E 26 05            [ 1]    3 	jrne slash_tst
      009070 A6 20            [ 1]  725 	ld a,#TK_MULT 
      009072 CC 90 FF         [ 2]  726 	jp token_char 
      009075                        727 slash_tst: 
      000FF5                        728 	_case '/' prcnt_tst 
      009075 A6 2F            [ 1]    1 	ld a,#'/' 
      009077 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009079 26 05            [ 1]    3 	jrne prcnt_tst
      00907B A6 21            [ 1]  729 	ld a,#TK_DIV 
      00907D CC 90 FF         [ 2]  730 	jp token_char 
      009080                        731 prcnt_tst:
      001000                        732 	_case '%' eql_tst 
      009080 A6 25            [ 1]    1 	ld a,#'%' 
      009082 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009084 26 05            [ 1]    3 	jrne eql_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009086 A6 22            [ 1]  733 	ld a,#TK_MOD
      009088 CC 90 FF         [ 2]  734 	jp token_char  
                                    735 ; 1 or 2 character tokens 	
      00908B                        736 eql_tst:
      00100B                        737 	_case '=' gt_tst 		
      00908B A6 3D            [ 1]    1 	ld a,#'=' 
      00908D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00908F 26 05            [ 1]    3 	jrne gt_tst
      009091 A6 32            [ 1]  738 	ld a,#TK_EQUAL
      009093 CC 90 FF         [ 2]  739 	jp token_char 
      009096                        740 gt_tst:
      001016                        741 	_case '>' lt_tst 
      009096 A6 3E            [ 1]    1 	ld a,#'>' 
      009098 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00909A 26 23            [ 1]    3 	jrne lt_tst
      00909C A6 31            [ 1]  742 	ld a,#TK_GT 
      00909E 6B 02            [ 1]  743 	ld (ATTRIB,sp),a 
      0090A0 91 D6 01         [ 4]  744 	ld a,([in.w],y)
      0090A3 72 5C 00 02      [ 1]  745 	inc in 
      0090A7 A1 3D            [ 1]  746 	cp a,#'=
      0090A9 26 04            [ 1]  747 	jrne 1$
      0090AB A6 33            [ 1]  748 	ld a,#TK_GE 
      0090AD 20 50            [ 2]  749 	jra token_char  
      0090AF A1 3C            [ 1]  750 1$: cp a,#'<
      0090B1 26 04            [ 1]  751 	jrne 2$
      0090B3 A6 35            [ 1]  752 	ld a,#TK_NE 
      0090B5 20 48            [ 2]  753 	jra token_char 
      0090B7 72 5A 00 02      [ 1]  754 2$: dec in
      0090BB 7B 02            [ 1]  755 	ld a,(ATTRIB,sp)
      0090BD 20 40            [ 2]  756 	jra token_char 	 
      0090BF                        757 lt_tst:
      00103F                        758 	_case '<' other
      0090BF A6 3C            [ 1]    1 	ld a,#'<' 
      0090C1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090C3 26 23            [ 1]    3 	jrne other
      0090C5 A6 34            [ 1]  759 	ld a,#TK_LT 
      0090C7 6B 02            [ 1]  760 	ld (ATTRIB,sp),a 
      0090C9 91 D6 01         [ 4]  761 	ld a,([in.w],y)
      0090CC 72 5C 00 02      [ 1]  762 	inc in 
      0090D0 A1 3D            [ 1]  763 	cp a,#'=
      0090D2 26 04            [ 1]  764 	jrne 1$
      0090D4 A6 36            [ 1]  765 	ld a,#TK_LE 
      0090D6 20 27            [ 2]  766 	jra token_char 
      0090D8 A1 3E            [ 1]  767 1$: cp a,#'>
      0090DA 26 04            [ 1]  768 	jrne 2$
      0090DC A6 35            [ 1]  769 	ld a,#TK_NE 
      0090DE 20 1F            [ 2]  770 	jra token_char 
      0090E0 72 5A 00 02      [ 1]  771 2$: dec in 
      0090E4 7B 02            [ 1]  772 	ld a,(ATTRIB,sp)
      0090E6 20 17            [ 2]  773 	jra token_char 	
      0090E8                        774 other: ; not a special character 	 
      0090E8 7B 01            [ 1]  775 	ld a,(TCHAR,sp)
      0090EA CD 8E 9D         [ 4]  776 	call is_alpha 
      0090ED 25 03            [ 1]  777 	jrc 30$ 
      0090EF CC 96 C8         [ 2]  778 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      0090F2                        779 30$: 
      0090F2 CD 8E E3         [ 4]  780 	call parse_keyword
      0090F5 A3 A0 D3         [ 2]  781 	cpw x,#remark 
      0090F8 26 09            [ 1]  782 	jrne token_exit 
      0090FA 90 93            [ 1]  783 	ldw y,x 
      0090FC CC 90 36         [ 2]  784 	jp copy_comment 
      0090FF                        785 token_char:
      0090FF F7               [ 1]  786 	ld (x),a 
      009100 5C               [ 1]  787 	incw x
      009101 90 93            [ 1]  788 	ldw y,x 
      009103                        789 token_exit:
      001083                        790 	_drop VSIZE 
      009103 5B 02            [ 2]    1     addw sp,#VSIZE 
      009105 81               [ 4]  791 	ret
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
      009106                        811 compile::
      009106 90 89            [ 2]  812 	pushw y 
      001088                        813 	_vars VSIZE 
      009108 52 02            [ 2]    1     sub sp,#VSIZE 
      00910A 55 00 1B 00 05   [ 1]  814 	mov basicptr,txtbgn
      00910F 72 1A 00 22      [ 1]  815 	bset flags,#FCOMP 
      009113 A6 00            [ 1]  816 	ld a,#0
      009115 AE 00 00         [ 2]  817 	ldw x,#0
      009118 CF 16 B8         [ 2]  818 	ldw pad,x ; destination buffer 
      00911B C7 16 BA         [ 1]  819 	ld pad+2,a ; count 
      00911E AE 16 BB         [ 2]  820 	ldw x,#pad+3
      009121 72 5F 00 02      [ 1]  821 	clr in 
      009125 CD 8F 47         [ 4]  822 	call get_token
      009128 A1 84            [ 1]  823 	cp a,#TK_INTGR
      00912A 26 11            [ 1]  824 	jrne 2$
      00912C A3 00 01         [ 2]  825 	cpw x,#1 
      00912F 2A 05            [ 1]  826 	jrpl 1$
      009131 A6 0A            [ 1]  827 	ld a,#ERR_BAD_VALUE
      009133 CC 96 CA         [ 2]  828 	jp tb_error
      009136 CF 16 B8         [ 2]  829 1$:	ldw pad,x 
      009139 90 AE 16 BB      [ 2]  830 	ldw y,#pad+3 
      00913D 90 A3 17 74      [ 2]  831 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009141 25 05            [ 1]  832 	jrult 3$
      009143 A6 0F            [ 1]  833 	ld a,#ERR_BUF_FULL 
      009145 CC 96 CA         [ 2]  834 	jp tb_error 
      009148                        835 3$:	
      009148 93               [ 1]  836 	ldw x,y 
      009149 CD 8F 47         [ 4]  837 	call get_token 
      00914C A1 00            [ 1]  838 	cp a,#TK_NONE 
      00914E 26 ED            [ 1]  839 	jrne 2$ 
                                    840 ; compilation completed  
      009150 72 A2 16 B8      [ 2]  841 	subw y,#pad
      009154 90 9F            [ 1]  842     ld a,yl
      009156 AE 16 B8         [ 2]  843 	ldw x,#pad 
      009159 CF 00 19         [ 2]  844 	ldw ptr16,x 
      00915C E7 02            [ 1]  845 	ld (2,x),a 
      00915E FE               [ 2]  846 	ldw x,(x)
      00915F 27 09            [ 1]  847 	jreq 10$
      009161 CD 8D 46         [ 4]  848 	call insert_line
      009164 72 5F 00 04      [ 1]  849 	clr  count 
      009168 20 0F            [ 2]  850 	jra  11$ 
      00916A                        851 10$: ; line# is zero 
      00916A CE 00 19         [ 2]  852 	ldw x,ptr16  
      00916D CF 00 05         [ 2]  853 	ldw basicptr,x 
      009170 E6 02            [ 1]  854 	ld a,(2,x)
      009172 C7 00 04         [ 1]  855 	ld count,a 
      009175 35 03 00 02      [ 1]  856 	mov in,#3 
      009179                        857 11$:
      0010F9                        858 	_drop VSIZE 
      009179 5B 02            [ 2]    1     addw sp,#VSIZE 
      00917B 72 1B 00 22      [ 1]  859 	bres flags,#FCOMP 
      00917F 90 85            [ 2]  860 	popw y 
      009181 81               [ 4]  861 	ret 
                                    862 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
      009182                         48 cpy_cmd_name:
      009182 F6               [ 1]   49 	ld a,(x)
      009183 5C               [ 1]   50 	incw x
      009184 A4 0F            [ 1]   51 	and a,#15  
      009186 88               [ 1]   52 	push a 
      009187 0D 01            [ 1]   53     tnz (1,sp) 
      009189 27 0A            [ 1]   54 	jreq 9$
      00918B F6               [ 1]   55 1$:	ld a,(x)
      00918C 90 F7            [ 1]   56 	ld (y),a  
      00918E 5C               [ 1]   57 	incw x
      00918F 90 5C            [ 1]   58 	incw y 
      009191 0A 01            [ 1]   59 	dec (1,sp)	 
      009193 26 F6            [ 1]   60 	jrne 1$
      009195 84               [ 1]   61 9$: pop a 
      009196 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      009197                         72 add_space:
      009197 90 5A            [ 2]   73 	decw y 
      009199 90 F6            [ 1]   74 	ld a,(y)
      00919B 90 5C            [ 1]   75 	incw y
      00919D A1 29            [ 1]   76 	cp a,#') 
      00919F 27 05            [ 1]   77 	jreq 0$
      0091A1 CD 8E B7         [ 4]   78 	call is_alnum 
      0091A4 24 06            [ 1]   79 	jrnc 1$
      0091A6                         80 0$: 
      0091A6 A6 20            [ 1]   81 	ld a,#SPACE 
      0091A8 90 F7            [ 1]   82 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      0091AA 90 5C            [ 1]   83 	incw y 
      0091AC 81               [ 4]   84 1$: ret 
                                     85 
                                     86 ;--------------------------
                                     87 ;  align text in buffer 
                                     88 ;  to tab_width padding 
                                     89 ;  left with  SPACE 
                                     90 ; input:
                                     91 ;   X      str*
                                     92 ;   A      str_length 
                                     93 ; output:
                                     94 ;   X      ajusted
                                     95 ;--------------------------
      0091AD                         96 right_align::
      0091AD 88               [ 1]   97 	push a 
      0091AE 7B 01            [ 1]   98 0$: ld a,(1,sp)
      0091B0 C1 00 23         [ 1]   99 	cp a,tab_width 
      0091B3 2A 08            [ 1]  100 	jrpl 1$
      0091B5 A6 20            [ 1]  101 	ld a,#SPACE 
      0091B7 5A               [ 2]  102 	decw x
      0091B8 F7               [ 1]  103 	ld (x),a  
      0091B9 0C 01            [ 1]  104 	inc (1,sp)
      0091BB 20 F1            [ 2]  105 	jra 0$ 
      0091BD 84               [ 1]  106 1$: pop a 	
      0091BE 81               [ 4]  107 	ret 
                                    108 
                                    109 ;--------------------------
                                    110 ; print TK_QSTR
                                    111 ; converting control character
                                    112 ; to backslash sequence
                                    113 ; input:
                                    114 ;   X        char *
                                    115 ;   Y        dest. buffer 
                                    116 ; output:
                                    117 ;   X        moved forward 
                                    118 ;   Y        moved forward 
                                    119 ;-----------------------------
      0091BF                        120 cpy_quote:
      0091BF A6 22            [ 1]  121 	ld a,#'"
      0091C1 90 F7            [ 1]  122 	ld (y),a 
      0091C3 90 5C            [ 1]  123 	incw y 
      0091C5 89               [ 2]  124 	pushw x 
      0091C6 CD 97 EE         [ 4]  125 	call skip_string 
      0091C9 85               [ 2]  126 	popw x 
      0091CA F6               [ 1]  127 1$:	ld a,(x)
      0091CB 27 30            [ 1]  128 	jreq 9$
      0091CD 5C               [ 1]  129 	incw x 
      0091CE A1 20            [ 1]  130 	cp a,#SPACE 
      0091D0 25 0E            [ 1]  131 	jrult 3$
      0091D2 90 F7            [ 1]  132 	ld (y),a
      0091D4 90 5C            [ 1]  133 	incw y 
      0091D6 A1 5C            [ 1]  134 	cp a,#'\ 
      0091D8 26 F0            [ 1]  135 	jrne 1$ 
      0091DA                        136 2$:
      0091DA 90 F7            [ 1]  137 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0091DC 90 5C            [ 1]  138 	incw y  
      0091DE 20 EA            [ 2]  139 	jra 1$
      0091E0 88               [ 1]  140 3$: push a 
      0091E1 A6 5C            [ 1]  141 	ld a,#'\
      0091E3 90 F7            [ 1]  142 	ld (y),a 
      0091E5 90 5C            [ 1]  143 	incw y  
      0091E7 84               [ 1]  144 	pop a 
      0091E8 A0 07            [ 1]  145 	sub a,#7
      0091EA C7 00 0F         [ 1]  146 	ld acc8,a 
      0091ED 72 5F 00 0E      [ 1]  147 	clr acc16
      0091F1 89               [ 2]  148 	pushw x
      0091F2 AE 8E 05         [ 2]  149 	ldw x,#escaped 
      0091F5 72 BB 00 0E      [ 2]  150 	addw x,acc16 
      0091F9 F6               [ 1]  151 	ld a,(x)
      0091FA 85               [ 2]  152 	popw x
      0091FB 20 DD            [ 2]  153 	jra 2$
      0091FD A6 22            [ 1]  154 9$: ld a,#'"
      0091FF 90 F7            [ 1]  155 	ld (y),a 
      009201 90 5C            [ 1]  156 	incw y  
      009203 5C               [ 1]  157 	incw x 
      009204 81               [ 4]  158 	ret
                                    159 
                                    160 ;--------------------------
                                    161 ; return variable name 
                                    162 ; from its address.
                                    163 ; input:
                                    164 ;   X    variable address
                                    165 ; output:
                                    166 ;   A     variable letter
                                    167 ;--------------------------
      009205                        168 var_name::
      009205 1D 00 30         [ 2]  169 		subw x,#vars 
      009208 A6 03            [ 1]  170 		ld a,#3
      00920A 62               [ 2]  171 		div x,a 
      00920B 9F               [ 1]  172 		ld a,xl 
      00920C AB 41            [ 1]  173 		add a,#'A 
      00920E 81               [ 4]  174 		ret 
                                    175 
                                    176 ;-----------------------------
                                    177 ; return cmd  idx from its 
                                    178 ; code address 
                                    179 ; input:
                                    180 ;   X      code address 
                                    181 ; output:
                                    182 ;   X      cmd_idx
                                    183 ;-----------------------------
      00920F                        184 get_cmd_idx:
      00920F 90 89            [ 2]  185 	pushw y
      009211 90 AE B3 76      [ 2]  186 	ldw y,#code_addr 
      009215 90 CF 00 19      [ 2]  187 	ldw ptr16,y 
      009219 90 5F            [ 1]  188 	clrw y 
      00921B 91 D3 19         [ 5]  189 1$:	cpw x,([ptr16],y)
      00921E 27 0C            [ 1]  190 	jreq 3$ 
      009220 90 5C            [ 1]  191 	incw y 
      009222 91 D6 19         [ 4]  192 	ld a,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009225 90 5C            [ 1]  193 	incw y
      009227 91 DA 19         [ 4]  194 	or a,([ptr16],y)	
      00922A 26 EF            [ 1]  195 	jrne 1$
      00922C 93               [ 1]  196 3$: ldw x,y 
      00922D 90 85            [ 2]  197 	popw y 
      00922F 81               [ 4]  198 	ret
                                    199 
                                    200 
                                    201 ;-------------------------------------
                                    202 ; decompile tokens list 
                                    203 ; to original text line 
                                    204 ; input:
                                    205 ;   [basicptr]  pointer at line 
                                    206 ;   Y           output buffer
                                    207 ; output:
                                    208 ;   A           length 
                                    209 ;   Y           after string  
                                    210 ;------------------------------------
                           000001   211 	BASE_SAV=1
                           000002   212 	WIDTH_SAV=2
                           000003   213 	STR=3
                           000004   214 	VSIZE=4 
      009230                        215 decompile::
      0011B0                        216 	_vars VSIZE
      009230 52 04            [ 2]    1     sub sp,#VSIZE 
      009232 C6 00 0B         [ 1]  217 	ld a,base
      009235 6B 01            [ 1]  218 	ld (BASE_SAV,sp),a  
      009237 C6 00 23         [ 1]  219 	ld a,tab_width 
      00923A 6B 02            [ 1]  220 	ld (WIDTH_SAV,sp),a 
      00923C 17 03            [ 2]  221 	ldw (STR,sp),y   
      00923E 72 CE 00 05      [ 5]  222 	ldw x,[basicptr] ; line number 
      009242 35 0A 00 0B      [ 1]  223 	mov base,#10
      009246 35 05 00 23      [ 1]  224 	mov tab_width,#5
      00924A 72 5F 00 0D      [ 1]  225 	clr acc24 
      00924E CF 00 0E         [ 2]  226 	ldw acc16,x
      009251 4F               [ 1]  227 	clr a ; unsigned conversion 
      009252 CD 98 53         [ 4]  228 	call itoa  
      009255 CD 91 AD         [ 4]  229 	call right_align 
      009258 88               [ 1]  230 	push a 
      009259 90 93            [ 1]  231 1$:	ldw y,x ; source
      00925B 1E 04            [ 2]  232 	ldw x,(STR+1,sp) ; destination
      00925D CD 94 28         [ 4]  233 	call strcpy 
      009260 90 5F            [ 1]  234 	clrw y 
      009262 84               [ 1]  235 	pop a 
      009263 90 97            [ 1]  236 	ld yl,a 
      009265 72 F9 03         [ 2]  237 	addw y,(STR,sp)
      009268 A6 20            [ 1]  238 	ld a,#SPACE 
      00926A 90 F7            [ 1]  239 	ld (y),a 
      00926C 90 5C            [ 1]  240 	incw y 
      00926E 72 5F 00 23      [ 1]  241 	clr tab_width
      009272 AE 00 03         [ 2]  242 	ldw x,#3
      009275 CF 00 01         [ 2]  243 	ldw in.w,x 
      009278                        244 decomp_loop:
      009278 90 89            [ 2]  245 	pushw y
      00927A CD 97 C7         [ 4]  246 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00927D 90 85            [ 2]  247 	popw y 
      00927F 4D               [ 1]  248 	tnz a  
      009280 26 03            [ 1]  249 	jrne 1$
      009282 CC 93 9F         [ 2]  250 	jp 20$
      009285 2B 03            [ 1]  251 1$:	jrmi 2$
      009287 CC 93 10         [ 2]  252 	jp 6$
      00928A                        253 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00928A A1 85            [ 1]  254 	cp a,#TK_VAR 
      00928C 26 0F            [ 1]  255 	jrne 3$
                                    256 ;; TK_VAR 
      00928E CD 91 97         [ 4]  257 	call add_space
      009291 CD 97 FD         [ 4]  258 	call get_addr   
      009294 CD 92 05         [ 4]  259 	call var_name
      009297 90 F7            [ 1]  260 	ld (y),a 
      009299 90 5C            [ 1]  261 	incw y  
      00929B 20 DB            [ 2]  262 	jra decomp_loop
      00929D                        263 3$:
      00929D A1 84            [ 1]  264 	cp a,#TK_INTGR
      00929F 26 26            [ 1]  265 	jrne 4$
                                    266 ;; TK_INTGR
      0092A1 CD 98 07         [ 4]  267 	call get_int24 
      0092A4 C7 00 0D         [ 1]  268 	ld acc24,a 
      0092A7 CF 00 0E         [ 2]  269 	ldw acc16,x 
      0092AA CD 91 97         [ 4]  270 	call add_space
      0092AD 90 89            [ 2]  271 	pushw y 
      0092AF A6 FF            [ 1]  272 	ld a,#255 ; signed conversion 
      0092B1 CD 98 53         [ 4]  273 	call itoa  
      0092B4 16 01            [ 2]  274 	ldw y,(1,sp) 
      0092B6 88               [ 1]  275 	push a 
      0092B7 51               [ 1]  276 	exgw x,y 
      0092B8 CD 94 28         [ 4]  277 	call strcpy 
      0092BB 90 5F            [ 1]  278 	clrw y
      0092BD 84               [ 1]  279 	pop a  
      0092BE 90 97            [ 1]  280 	ld yl,a 
      0092C0 72 F9 01         [ 2]  281 	addw y,(1,sp)
      001243                        282 	_drop 2 
      0092C3 5B 02            [ 2]    1     addw sp,#2 
      0092C5 20 B1            [ 2]  283 	jra decomp_loop
      0092C7                        284 4$: ; dictionary keyword 
      0092C7 FE               [ 2]  285 	ldw x,(x)
      0092C8 72 5C 00 02      [ 1]  286 	inc in 
      0092CC 72 5C 00 02      [ 1]  287 	inc in 
      0092D0 A3 00 88         [ 2]  288 	cpw x,#REM_IDX
      0092D3 26 23            [ 1]  289 	jrne 5$
      0092D5 CE 00 05         [ 2]  290 	ldw x,basicptr 
                                    291 ; copy comment to buffer 
      0092D8 CD 91 97         [ 4]  292 	call add_space
      0092DB A6 27            [ 1]  293 	ld a,#''
      0092DD 90 F7            [ 1]  294 	ld (y),a 
      0092DF 90 5C            [ 1]  295 	incw y 
      0092E1                        296 46$:
      0092E1 72 D6 00 01      [ 4]  297 	ld a,([in.w],x)
      0092E5 72 5C 00 02      [ 1]  298 	inc in  
      0092E9 90 F7            [ 1]  299 	ld (y),a 
      0092EB 90 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      0092ED C6 00 02         [ 1]  301 	ld a,in 
      0092F0 C1 00 04         [ 1]  302 	cp a,count 
      0092F3 2B EC            [ 1]  303 	jrmi 46$
      0092F5 CC 93 9F         [ 2]  304 	jp 20$  
      0092F8 A3 00 4E         [ 2]  305 5$: cpw x,#LET_IDX 
      0092FB 26 03            [ 1]  306 	jrne 51$
      0092FD CC 92 78         [ 2]  307 	jp decomp_loop ; down display LET 	
      009300                        308 51$: ; insert command name 
      009300 CD 91 97         [ 4]  309 	call add_space  
      009303 90 89            [ 2]  310 	pushw y
      009305 CD 93 DA         [ 4]  311 	call cmd_name
      009308 90 85            [ 2]  312 	popw y 
      00930A CD 91 82         [ 4]  313 	call cpy_cmd_name
      00930D CC 92 78         [ 2]  314 	jp decomp_loop 
      009310                        315 6$:
                                    316 ; label?
      009310 A1 03            [ 1]  317 	cp a,#TK_LABEL 
      009312 26 1E            [ 1]  318 	jrne 64$
                                    319 ; copy label string to output buffer   	
      009314 A6 20            [ 1]  320 	ld a,#32 
      009316 90 F7            [ 1]  321 	ld (y),a 
      009318 90 5C            [ 1]  322 	incw y 
      00931A                        323 61$:
      00931A 89               [ 2]  324 	pushw x 
      00931B CD 97 EE         [ 4]  325 	call skip_string 
      00931E 85               [ 2]  326 	popw x 
      00931F                        327 62$:	
      00931F F6               [ 1]  328 	ld a,(x)
      009320 27 07            [ 1]  329 	jreq 63$ 
      009322 5C               [ 1]  330 	incw x  
      009323 90 F7            [ 1]  331 	ld (y),a 
      009325 90 5C            [ 1]  332 	incw y 
      009327 20 F6            [ 2]  333 	jra 62$ 
      009329                        334 63$: 
      009329 A6 20            [ 1]  335 	ld a,#32 
      00932B 90 F7            [ 1]  336 	ld (y),a 
      00932D 90 5C            [ 1]  337 	incw y 
      00932F CC 92 78         [ 2]  338 	jp decomp_loop
      009332                        339 64$:
      009332 A1 02            [ 1]  340 	cp a,#TK_QSTR 
      009334 26 09            [ 1]  341 	jrne 7$
                                    342 ;; TK_QSTR
      009336 CD 91 97         [ 4]  343 	call add_space
      009339 CD 91 BF         [ 4]  344 	call cpy_quote  
      00933C CC 92 78         [ 2]  345 	jp decomp_loop
      00933F                        346 7$:
      00933F A1 04            [ 1]  347 	cp a,#TK_CHAR 
      009341 26 10            [ 1]  348 	jrne 8$
                                    349 ;; TK_CHAR
      009343 CD 91 97         [ 4]  350 	call add_space 
      009346 A6 5C            [ 1]  351 	ld a,#'\ 
      009348 90 F7            [ 1]  352 	ld (y),a 
      00934A 90 5C            [ 1]  353 	incw y
      00934C F6               [ 1]  354 	ld a,(x)
      00934D 72 5C 00 02      [ 1]  355 	inc in  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009351 20 06            [ 2]  356 	jra 81$
      009353 A1 0A            [ 1]  357 8$: cp a,#TK_COLON 
      009355 26 09            [ 1]  358 	jrne 9$
      009357 A6 3A            [ 1]  359 	ld a,#':
      009359                        360 81$:
      009359 90 F7            [ 1]  361 	ld (y),a 
      00935B 90 5C            [ 1]  362 	incw y 
      00935D                        363 82$:
      00935D CC 92 78         [ 2]  364 	jp decomp_loop
      009360                        365 9$: 
      009360 A1 09            [ 1]  366 	cp a,#TK_SHARP
      009362 22 0A            [ 1]  367 	jrugt 10$ 
      009364 A0 05            [ 1]  368 	sub a,#TK_ARRAY 
      009366 5F               [ 1]  369 	clrw x 
      009367 97               [ 1]  370 	ld xl,a
      009368 1C 93 B5         [ 2]  371 	addw x,#single_char 
      00936B F6               [ 1]  372 	ld a,(x)
      00936C 20 EB            [ 2]  373 	jra 81$ 
      00936E                        374 10$: 
      00936E A1 11            [ 1]  375 	cp a,#TK_MINUS 
      009370 22 0A            [ 1]  376 	jrugt 11$
      009372 A0 10            [ 1]  377 	sub a,#TK_PLUS 
      009374 5F               [ 1]  378 	clrw x 
      009375 97               [ 1]  379 	ld xl,a 
      009376 1C 93 BA         [ 2]  380 	addw x,#add_char 
      009379 F6               [ 1]  381 	ld a,(x)
      00937A 20 DD            [ 2]  382 	jra 81$
      00937C                        383 11$:
      00937C A1 22            [ 1]  384     cp a,#TK_MOD 
      00937E 22 0A            [ 1]  385 	jrugt 12$
      009380 A0 20            [ 1]  386 	sub a,#TK_MULT
      009382 5F               [ 1]  387 	clrw x 
      009383 97               [ 1]  388 	ld xl,a 
      009384 1C 93 BC         [ 2]  389 	addw x,#mul_char
      009387 F6               [ 1]  390 	ld a,(x)
      009388 20 CF            [ 2]  391 	jra 81$
      00938A                        392 12$:
      00938A A0 31            [ 1]  393 	sub a,#TK_GT  
      00938C 48               [ 1]  394 	sll a 
      00938D 5F               [ 1]  395 	clrw x 
      00938E 97               [ 1]  396 	ld xl,a 
      00938F 1C 93 BF         [ 2]  397 	addw x,#relop_str 
      009392 FE               [ 2]  398 	ldw x,(x)
      009393 F6               [ 1]  399 	ld a,(x)
      009394 5C               [ 1]  400 	incw x 
      009395 90 F7            [ 1]  401 	ld (y),a
      009397 90 5C            [ 1]  402 	incw y 
      009399 F6               [ 1]  403 	ld a,(x)
      00939A 26 BD            [ 1]  404 	jrne 81$
      00939C CC 92 78         [ 2]  405 	jp decomp_loop 
      00939F                        406 20$: 
      00939F 90 7F            [ 1]  407 	clr (y)
      0093A1 1E 03            [ 2]  408 	ldw x,(STR,sp)
      0093A3 7B 01            [ 1]  409 	ld a,(BASE_SAV,sp)
      0093A5 C7 00 0B         [ 1]  410 	ld base,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0093A8 7B 02            [ 1]  411 	ld a,(WIDTH_SAV,sp)
      0093AA C7 00 23         [ 1]  412 	ld tab_width,a
      0093AD 72 F2 03         [ 2]  413 	subw y,(STR,sp) 
      0093B0 90 9F            [ 1]  414 	ld a,yl 
      001332                        415 	_drop VSIZE 
      0093B2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093B4 81               [ 4]  416 	ret 
                                    417 
      0093B5 40 28 29 2C 23         418 single_char: .byte '@','(',')',',','#'
      0093BA 2B 2D                  419 add_char: .byte '+','-'
      0093BC 2A 2F 25               420 mul_char: .byte '*','/','%'
      0093BF 93 CB 93 CD 93 CF 93   421 relop_str: .word gt,equal,ge,lt,le,ne 
             D2 93 D4 93 D7
      0093CB 3E 00                  422 gt: .asciz ">"
      0093CD 3D 00                  423 equal: .asciz "="
      0093CF 3E 3D 00               424 ge: .asciz ">="
      0093D2 3C 00                  425 lt: .asciz "<"
      0093D4 3C 3D 00               426 le: .asciz "<="
      0093D7 3C 3E 00               427 ne:  .asciz "<>"
                                    428 
                                    429 ;----------------------------------
                                    430 ; search in kword_dict name
                                    431 ; from its execution address 
                                    432 ; input:
                                    433 ;   X       	cmd_index 
                                    434 ; output:
                                    435 ;   X 			cstr*  | 0 
                                    436 ;--------------------------------
                           000001   437 	CMDX=1 
                           000003   438 	LINK=3 
                           000004   439 	VSIZE=4
      0093DA                        440 cmd_name:
      00135A                        441 	_vars VSIZE 
      0093DA 52 04            [ 2]    1     sub sp,#VSIZE 
      0093DC 72 5F 00 0E      [ 1]  442 	clr acc16 
      0093E0 1F 01            [ 2]  443 	ldw (CMDX,sp),x  
      0093E2 AE B3 6E         [ 2]  444 	ldw x,#kword_dict	
      0093E5 1F 03            [ 2]  445 1$:	ldw (LINK,sp),x
      0093E7 E6 02            [ 1]  446 	ld a,(2,x)
      0093E9 A4 0F            [ 1]  447 	and a,#15 
      0093EB C7 00 0F         [ 1]  448 	ld acc8,a 
      0093EE 1C 00 03         [ 2]  449 	addw x,#3
      0093F1 72 BB 00 0E      [ 2]  450 	addw x,acc16
      0093F5 FE               [ 2]  451 	ldw x,(x) ; command index  
      0093F6 13 01            [ 2]  452 	cpw x,(CMDX,sp)
      0093F8 27 0A            [ 1]  453 	jreq 2$
      0093FA 1E 03            [ 2]  454 	ldw x,(LINK,sp)
      0093FC FE               [ 2]  455 	ldw x,(x) 
      0093FD 1D 00 02         [ 2]  456 	subw x,#2  
      009400 26 E3            [ 1]  457 	jrne 1$
      009402 20 05            [ 2]  458 	jra 9$
      009404 1E 03            [ 2]  459 2$: ldw x,(LINK,sp)
      009406 1C 00 02         [ 2]  460 	addw x,#2 	
      001389                        461 9$:	_drop VSIZE
      009409 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00940B 81               [ 4]  462 	ret
                                    463 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
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
      000001                         64 in.w::  .blkb 1 ; parser position in text line high-byte 
      000002                         65 in::    .blkb 1 ; low byte of in.w 
      000003                         66 in.saved:: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         67 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         68 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         69 data_ptr:  .blkw 1  ; point to DATA address
      000009                         70 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         71 data_len:  .blkb 1  ; length of data line 
      00000B                         72 base::  .blkb 1 ; nemeric base used to print integer 
      00000C                         73 acc32:: .blkb 1 ; 32 bit accumalator upper-byte 
      00000D                         74 acc24:: .blkb 1 ; 24 bits accumulator upper-byte 
      00000E                         75 acc16:: .blkb 1 ; 16 bits accumulator, acc24 high-byte
      00000F                         76 acc8::  .blkb 1 ;  8 bits accumulator, acc24 low-byte  
      000010                         77 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
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
      00940C                        116 strlen::
      00940C 89               [ 2]  117 	pushw x 
      00940D 4F               [ 1]  118 	clr a
      00940E 7D               [ 1]  119 1$:	tnz (x) 
      00940F 27 04            [ 1]  120 	jreq 9$ 
      009411 4C               [ 1]  121 	inc a 
      009412 5C               [ 1]  122 	incw x 
      009413 20 F9            [ 2]  123 	jra 1$ 
      009415 85               [ 2]  124 9$:	popw x 
      009416 81               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      009417                        135 strcmp:
      009417 F6               [ 1]  136 	ld a,(x)
      009418 27 0B            [ 1]  137 	jreq 5$ 
      00941A 90 F1            [ 1]  138 	cp a,(y) 
      00941C 26 05            [ 1]  139 	jrne 4$ 
      00941E 5C               [ 1]  140 	incw x 
      00941F 90 5C            [ 1]  141 	incw y 
      009421 20 F4            [ 2]  142 	jra strcmp 
      009423                        143 4$: ; not same  
      009423 4F               [ 1]  144 	clr a 
      009424 81               [ 4]  145 	ret 
      009425                        146 5$: ; same 
      009425 A6 01            [ 1]  147 	ld a,#1 
      009427 81               [ 4]  148 	ret 
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
      009428                        159 strcpy::
      009428 88               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009429 89               [ 2]  161 	pushw x 
      00942A 90 F6            [ 1]  162 1$: ld a,(y)
      00942C 27 06            [ 1]  163 	jreq 9$ 
      00942E F7               [ 1]  164 	ld (x),a 
      00942F 5C               [ 1]  165 	incw x 
      009430 90 5C            [ 1]  166 	incw y 
      009432 20 F6            [ 2]  167 	jra 1$ 
      009434 7F               [ 1]  168 9$:	clr (x)
      009435 85               [ 2]  169 	popw x 
      009436 84               [ 1]  170 	pop a 
      009437 81               [ 4]  171 	ret 
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
                           000001   182 	INCR=1 ; increament high byte 
                           000002   183 	LB=2 ; increament low byte 
                           000002   184 	VSIZE=2
      009438                        185 move::
      009438 88               [ 1]  186 	push a 
      0013B9                        187 	_vars VSIZE 
      009439 52 02            [ 2]    1     sub sp,#VSIZE 
      00943B 0F 01            [ 1]  188 	clr (INCR,sp)
      00943D 0F 02            [ 1]  189 	clr (LB,sp)
      00943F 90 89            [ 2]  190 	pushw y 
      009441 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009443 90 85            [ 2]  192 	popw y 
      009445 27 31            [ 1]  193 	jreq move_exit ; x==y 
      009447 2B 0E            [ 1]  194 	jrmi move_down
      009449                        195 move_up: ; start from top address with incr=-1
      009449 72 BB 00 0E      [ 2]  196 	addw x,acc16
      00944D 72 B9 00 0E      [ 2]  197 	addw y,acc16
      009451 03 01            [ 1]  198 	cpl (INCR,sp)
      009453 03 02            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009455 20 05            [ 2]  200 	jra move_loop  
      009457                        201 move_down: ; start from bottom address with incr=1 
      009457 5A               [ 2]  202     decw x 
      009458 90 5A            [ 2]  203 	decw y
      00945A 0C 02            [ 1]  204 	inc (LB,sp) ; incr=1 
      00945C                        205 move_loop:	
      00945C C6 00 0E         [ 1]  206     ld a, acc16 
      00945F CA 00 0F         [ 1]  207 	or a, acc8
      009462 27 14            [ 1]  208 	jreq move_exit 
      009464 72 FB 01         [ 2]  209 	addw x,(INCR,sp)
      009467 72 F9 01         [ 2]  210 	addw y,(INCR,sp) 
      00946A 90 F6            [ 1]  211 	ld a,(y)
      00946C F7               [ 1]  212 	ld (x),a 
      00946D 89               [ 2]  213 	pushw x 
      00946E CE 00 0E         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009471 5A               [ 2]  215 	decw x 
      009472 CF 00 0E         [ 2]  216 	ldw acc16,x 
      009475 85               [ 2]  217 	popw x 
      009476 20 E4            [ 2]  218 	jra move_loop
      009478                        219 move_exit:
      0013F8                        220 	_drop VSIZE
      009478 5B 02            [ 2]    1     addw sp,#VSIZE 
      00947A 84               [ 1]  221 	pop a 
      00947B 81               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      00947C                        231 clear_vars:
      00947C 89               [ 2]  232 	pushw x 
      00947D 88               [ 1]  233 	push a  
      00947E AE 00 30         [ 2]  234 	ldw x,#vars 
      009481 A6 4E            [ 1]  235 	ld a,#CELL_SIZE*26 
      009483 7F               [ 1]  236 1$:	clr (x)
      009484 5C               [ 1]  237 	incw x 
      009485 4A               [ 1]  238 	dec a 
      009486 26 FB            [ 1]  239 	jrne 1$
      009488 84               [ 1]  240 	pop a 
      009489 85               [ 2]  241 	popw x 
      00948A 81               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      00948B 0A 0A 54 69 6E 79 20   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      0094D1                        253 system_information:
      0094D1 AE 94 8B         [ 2]  254 	ldw x,#software 
      0094D4 CD 89 DA         [ 4]  255 	call puts 
      0094D7 A6 02            [ 1]  256 	ld a,#MAJOR 
      0094D9 C7 00 0F         [ 1]  257 	ld acc8,a 
      0094DC 5F               [ 1]  258 	clrw x 
      0094DD CF 00 0D         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0094E0 72 5F 00 23      [ 1]  260 	clr tab_width  
      0094E4 35 0A 00 0B      [ 1]  261 	mov base, #10 
      0094E8 CD 98 2D         [ 4]  262 	call prt_acc24 
      0094EB A6 2E            [ 1]  263 	ld a,#'.
      0094ED CD 89 7D         [ 4]  264 	call putc 
      0094F0 A6 00            [ 1]  265 	ld a,#MINOR 
      0094F2 C7 00 0F         [ 1]  266 	ld acc8,a 
      0094F5 5F               [ 1]  267 	clrw x 
      0094F6 CF 00 0D         [ 2]  268 	ldw acc24,x 
      0094F9 CD 98 2D         [ 4]  269 	call prt_acc24
      0094FC A6 0D            [ 1]  270 	ld a,#CR 
      0094FE CD 89 7D         [ 4]  271 	call putc
                                    272 ;call test 
      009501 81               [ 4]  273 	ret
                                    274 
      009502                        275 warm_init:
      009502 90 AE 17 73      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      009506 72 5F 00 22      [ 1]  277 	clr flags 
      00950A 72 5F 00 1F      [ 1]  278 	clr loop_depth 
      00950E 35 04 00 23      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009512 35 0A 00 0B      [ 1]  280 	mov base,#10 
      009516 AE 00 00         [ 2]  281 	ldw x,#0 
      009519 CF 00 05         [ 2]  282 	ldw basicptr,x 
      00951C CF 00 01         [ 2]  283 	ldw in.w,x 
      00951F 72 5F 00 04      [ 1]  284 	clr count
      009523 81               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      009524                        291 clear_basic:
      009524 89               [ 2]  292 	pushw x 
      009525 72 5F 00 04      [ 1]  293 	clr count
      009529 72 5F 00 02      [ 1]  294 	clr in  
      00952D AE 00 80         [ 2]  295 	ldw x,#free_ram 
      009530 CF 00 1B         [ 2]  296 	ldw txtbgn,x 
      009533 CF 00 1D         [ 2]  297 	ldw txtend,x 
      009536 CD 94 7C         [ 4]  298 	call clear_vars 
      009539 85               [ 2]  299 	popw x
      00953A 81               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00953B                        305 err_msg:
      00953B 00 00 95 5D 95 6A 95   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             78 95 91 95 A0
      009547 95 B6 95 CC 95 E6 95   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             F7 96 08
      009551 96 14 96 47 96 57 96   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             6B 96 7E
      00955B 96 8B                  309 	.word err_overflow 
                                    310 
      00955D 4D 65 6D 6F 72 79 20   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal  66-Bits]



             66 75 6C 6C 0A 00
      009565 75 6C 6C 0A 00 73 79   312 err_syntax: .asciz "syntax error\n" 
             6E 74 61 78 20 65 72
      009573 72 6F 72 0A 00 6D 61   313 err_math_ovf: .asciz "math operation overflow\n"
             74 68 20 6F 70 65 72
             61 74 69 6F 6E 20 6F
             76 65 72 66
      00958C 6C 6F 77 0A 00 64 69   314 err_div0: .asciz "division by 0\n" 
             76 69 73 69 6F 6E 20
             62
      00959B 79 20 30 0A 00 69 6E   315 err_no_line: .asciz "invalid line number.\n"
             76 61 6C 69 64 20 6C
             69 6E 65 20 6E 75 6D
             62
      0095B1 65 72 2E 0A 00 72 75   316 err_run_only: .asciz "run time only usage.\n" 
             6E 20 74 69 6D 65 20
             6F 6E 6C 79 20 75 73
             61
      0095C7 67 65 2E 0A 00 63 6F   317 err_cmd_only: .asciz "command line only usage.\n"
             6D 6D 61 6E 64 20 6C
             69 6E 65 20 6F 6E 6C
             79 20 75 73 61
      0095E1 67 65 2E 0A 00 64 75   318 err_duplicate: .asciz "duplicate name.\n"
             70 6C 69 63 61 74 65
             20 6E 61
      0095F2 6D 65 2E 0A 00 46 69   319 err_not_file: .asciz "File not found.\n"
             6C 65 20 6E 6F 74 20
             66 6F 75
      009603 6E 64 2E 0A 00 62 61   320 err_bad_value: .asciz "bad value.\n"
             64 20 76 61 6C
      00960F 75 65 2E 0A 00 46 69   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6C 65 20 69 6E 20 65
             78 74 65 6E 64 65 64
             20 6D 65 6D 6F 72 79
             2C 20 63 61 6E 27 74
             20 62 65 20 72 75 6E
             20 66 72 6F 6D 20 74
             68 65
      009642 72 65 2E 0A 00 4E 6F   322 err_no_data: .asciz "No data found.\n"
             20 64 61 74 61 20 66
             6F 75
      009652 6E 64 2E 0A 00 4E 6F   323 err_no_prog: .asciz "No program in RAM!\n"
             20 70 72 6F 67 72 61
             6D 20 69 6E 20 52
      009666 41 4D 21 0A 00 46 69   324 err_no_fspace: .asciz "File system full.\n" 
             6C 65 20 73 79 73 74
             65 6D 20 66 75
      009679 6C 6C 2E 0A 00 42 75   325 err_buf_full: .asciz "Buffer full\n"
             66 66 65 72 20 66
      009686 75 6C 6C 0A 00 6F 76   326 err_overflow: .asciz "overflow\n" 
             65 72 66
                                    327 
      009690 6C 6F 77 0A 00 0A 72   328 rt_msg: .asciz "\nrun time error, "
             75 6E 20 74 69 6D 65
             20 65 72 72
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      0096A2 6F 72 2C 20 00 0A 63   329 comp_msg: .asciz "\ncompile error, "
             6F 6D 70 69 6C 65 20
             65 72 72
      0096B3 6F 72 2C 20 00 6C 61   330 tk_id: .asciz "last token id: "
             73 74 20 74 6F 6B 65
             6E 20
                                    331 
      001648                        332 syntax_error::
      0096C3 69 64            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      00164A                        335 tb_error::
      0096C5 3A 20 00 21 4A   [ 2]  336 	btjt flags,#FCOMP,1$
      0096C8 88               [ 1]  337 	push a 
      0096C8 A6 02 15         [ 2]  338 	ldw x, #rt_msg 
      0096CA CD 09 5A         [ 4]  339 	call puts 
      0096CA 72               [ 1]  340 	pop a 
      0096CB 0A 00 22         [ 2]  341 	ldw x, #err_msg 
      0096CE 4A 88 AE 96      [ 1]  342 	clr acc16 
      0096D2 95               [ 1]  343 	sll a
      0096D3 CD 89 DA 84      [ 1]  344 	rlc acc16  
      0096D7 AE 95 3B         [ 1]  345 	ld acc8, a 
      0096DA 72 5F 00 0E      [ 2]  346 	addw x,acc16 
      0096DE 48               [ 2]  347 	ldw x,(x)
      0096DF 72 59 00         [ 4]  348 	call puts
      0096E2 0E C7 00         [ 2]  349 	ldw x,basicptr 
      0096E5 0F 72 BB         [ 1]  350 ld a,count 
      0096E8 00 0E            [ 1]  351 clrw y 
      0096EA FE CD            [ 1]  352 rlwa y  
      0096EC 89 DA CE         [ 4]  353 call hex_dump
      0096EF 00 05 C6         [ 2]  354 ldw x,basicptr
      0096F2 00 04 90         [ 1]  355 	ld a,in 
      0096F5 5F 90 02         [ 4]  356 	call prt_basic_line
      0096F8 CD 86 DE         [ 2]  357 	ldw x,#tk_id 
      0096FB CE 00 05         [ 4]  358 	call puts 
      0096FE C6 00 02         [ 1]  359 	ld a,in.saved 
      009701 CD               [ 1]  360 	clrw x 
      009702 9F               [ 1]  361 	ld xl,a 
      009703 7D AE 96 B8      [ 2]  362 	addw x,basicptr 
      009707 CD               [ 1]  363 	ld a,(x)
      009708 89               [ 1]  364 	clrw x 
      009709 DA               [ 1]  365 	ld xl,a 
      00970A C6 00 03         [ 4]  366 	call prt_i16
      001699                        367 1$:	
      00970D 5F               [ 1]  368 	push a 
      00970E 97 72 BB         [ 2]  369 	ldw x,#comp_msg
      009711 00 05 F6         [ 4]  370 	call puts 
      009714 5F               [ 1]  371 	pop a 
      009715 97 CD 98         [ 2]  372 	ldw x, #err_msg 
      009718 1D 5F 00 0D      [ 1]  373 	clr acc16 
      009719 48               [ 1]  374 	sll a
      009719 88 AE 96 A7      [ 1]  375 	rlc acc16  
      00971D CD 89 DA         [ 1]  376 	ld acc8, a 
      009720 84 AE 95 3B      [ 2]  377 	addw x,acc16 
      009724 72               [ 2]  378 	ldw x,(x)
      009725 5F 00 0E         [ 4]  379 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009728 48 72 59         [ 2]  380 	ldw x,#tib
      00972B 00 0E C7         [ 4]  381 	call puts 
      00972E 00 0F            [ 1]  382 	ld a,#CR 
      009730 72 BB 00         [ 4]  383 	call putc
      009733 0E FE CD         [ 2]  384 	ldw x,in.w
      009736 89 DA AE         [ 4]  385 	call spaces
      009739 16 68            [ 1]  386 	ld a,#'^
      00973B CD 89 DA         [ 4]  387 	call putc 
      00973E A6 0D CD         [ 2]  388 6$: ldw x,#STACK_EMPTY 
      009741 89               [ 1]  389     ldw sp,x
                                    390 
      0016D2                        391 warm_start:
      009742 7D CE 00         [ 4]  392 	call warm_init
                                    393 ;----------------------------
                                    394 ;   BASIC interpreter
                                    395 ;----------------------------
      0016D5                        396 cmd_line: ; user interface 
      009745 01 CD            [ 1]  397 	ld a,#CR 
      009747 8A 47 A6         [ 4]  398 	call putc 
      00974A 5E CD            [ 1]  399 	ld a,#'> 
      00974C 89 7D AE         [ 4]  400 	call putc
      00974F 17 FF 94         [ 4]  401 	call readln
      009752 72 5D 00 03      [ 1]  402 	tnz count 
      009752 CD 95            [ 1]  403 	jreq cmd_line
      009754 02 10 86         [ 4]  404 	call compile
                                    405 ;pushw y 
                                    406 ;ldw x,txtbgn  
                                    407 ;ldw y,txtend
                                    408 ;ldw acc16,x   
                                    409 ;subw y,acc16 
                                    410 ;call hex_dump
                                    411 ;popw y 
                                    412 ; if text begin with a line number
                                    413 ; the compiler set count to zero    
                                    414 ; so code is not interpreted
      009755 72 5D 00 03      [ 1]  415 	tnz count 
      009755 A6 0D            [ 1]  416 	jreq cmd_line
                                    417 	
                                    418 ; if direct command 
                                    419 ; it's ready to interpret 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    421 ;; This is the interpreter loop
                                    422 ;; for each BASIC code line. 
                                    423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016F1                        424 interpreter: 
      009757 CD 89 7D         [ 1]  425 	ld a,in 
      00975A A6 3E CD         [ 1]  426 	cp a,count 
      00975D 89 7D            [ 1]  427 	jrmi interp_loop
      0016F9                        428 next_line:
      00975F CD 8A DF 72 5D   [ 2]  429 	btjf flags, #FRUN, cmd_line
      009764 00 04 27         [ 2]  430 	ldw x,basicptr
      009767 ED CD 91 06      [ 2]  431 	addw x,in.w 
      00976B 72 5D 00         [ 2]  432 	cpw x,txtend 
      00976E 04 27            [ 1]  433 	jrpl warm_start
      009770 E4 00 04         [ 2]  434 	ldw basicptr,x ; start of next line  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009771 E6 02            [ 1]  435 	ld a,(2,x)
      009771 C6 00 02         [ 1]  436 	ld count,a 
      009774 C1 00 04 2B      [ 1]  437 	mov in,#3 ; skip first 3 bytes of line 
      001716                        438 interp_loop:
      009778 1D 17 47         [ 4]  439 	call next_token
      009779 A1 00            [ 1]  440 	cp a,#TK_NONE 
      009779 72 01            [ 1]  441 	jreq next_line 
      00977B 00 22            [ 1]  442 	cp a,#TK_CMD
      00977D D7 CE            [ 1]  443 	jrne 1$
      00977F 00 05 72         [ 4]  444 	call get_code_addr
      009782 BB               [ 4]  445 	call (x) 
      009783 00 01            [ 2]  446 	jra interp_loop 
      001727                        447 1$:	 
      009785 C3 00            [ 1]  448 	cp a,#TK_VAR
      009787 1D 2A            [ 1]  449 	jrne 2$
      009789 C8 CF 00         [ 4]  450 	call let_var  
      00978C 05 E6            [ 2]  451 	jra interp_loop 
      001730                        452 2$:	
      00978E 02 C7            [ 1]  453 	cp a,#TK_ARRAY 
      009790 00 04            [ 1]  454 	jrne 3$
      009792 35 03 00         [ 4]  455 	call let_array 
      009795 02 DD            [ 2]  456 	jra interp_loop
      009796                        457 3$:	
      009796 CD 97            [ 1]  458 	cp a,#TK_COLON 
      009798 C7 A1            [ 1]  459 	jreq interp_loop
      00979A 00 27            [ 1]  460 4$: cp a,#TK_LABEL
      00979C DC A1 80         [ 4]  461 	call skip_string 
      00979F 26 06            [ 2]  462 	jra interp_loop 
      0097A1 CD 97 E1         [ 2]  463 5$:	jp syntax_error 
                                    464 
                                    465 ;--------------------------
                                    466 ; extract next token from
                                    467 ; token list 
                                    468 ; basicptr -> base address 
                                    469 ; in  -> offset in list array 
                                    470 ; output:
                                    471 ;   A 		token attribute
                                    472 ;   X 		*token_value 
                                    473 ;----------------------------------------
      001747                        474 next_token::
      0097A4 FD               [ 1]  475 	clrw x 
      0097A5 20 EF 01         [ 1]  476 	ld a,in 
      0097A7 C7 00 02         [ 1]  477 	ld in.saved,a ; in case "_unget_token" needed 
                                    478 ; don't replace sub by "cp a,count" 
                                    479 ; if end of line must return with A=0   	
      0097A7 A1 85 26         [ 1]  480 	sub a,count 
      0097AA 05 CD            [ 1]  481 	jreq 9$ ; end of line 
      001753                        482 0$: 
      0097AC 9C 41 20         [ 2]  483 	ldw x,basicptr 
      0097AF E6 BB 00 00      [ 2]  484 	addw x,in.w 
      0097B0 F6               [ 1]  485 	ld a,(x)
      0097B0 A1               [ 1]  486 	incw x
      0097B1 05 26 05 CD      [ 1]  487 	inc in   
      0097B5 9C               [ 4]  488 9$: ret 
                                    489 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    490 ;------------------------
                                    491 ; get cmd and function 
                                    492 ; code address 
                                    493 ; input:
                                    494 ;    X   * cmd|func index 
                                    495 ;        in code_addr table 
                                    496 ;------------------------
      001761                        497 get_code_addr:
      0097B6 3C               [ 2]  498 	ldw x,(x)
      0097B7 20 DD F6         [ 2]  499 	ldw x,(code_addr,x)
      0097B9                        500 skip_2_bytes:
      0097B9 A1 0A 27 D9      [ 1]  501 	inc in 
      0097BD A1 03 CD 97      [ 1]  502 	inc in 
      0097C1 EE               [ 4]  503 	ret
                                    504 
                                    505 ;-------------------------
                                    506 ;  skip .asciz in BASIC line 
                                    507 ;  name 
                                    508 ;  input:
                                    509 ;     x		* string 
                                    510 ;  output:
                                    511 ;     none 
                                    512 ;-------------------------
      00176E                        513 skip_string:
      0097C2 20               [ 1]  514 	ld a,(x)
      0097C3 D2 CC            [ 1]  515 	jreq 1$
      0097C5 96               [ 1]  516 	incw x 
      0097C6 C8 FA            [ 2]  517 	jra skip_string 
      0097C7 5C               [ 1]  518 1$: incw x 	
      0097C7 5F C6 00 02      [ 2]  519 	subw x,basicptr 
      0097CB C7 00 03         [ 2]  520 	ldw in.w,x 
      0097CE C0               [ 4]  521 	ret 
                                    522 
                                    523 ;---------------------
                                    524 ; extract 16 bits  
                                    525 ; address from BASIC
                                    526 ; code 
                                    527 ; input:
                                    528 ;    X    *address
                                    529 ; output:
                                    530 ;    X    address 
                                    531 ;-------------------- 
      00177D                        532 get_addr:
      0097CF 00               [ 2]  533 	ldw x,(x)
      0097D0 04 27 0D 01      [ 1]  534 	inc in 
      0097D3 72 5C 00 01      [ 1]  535 	inc in 
      0097D3 CE               [ 4]  536 	ret 
                                    537 
                                    538 ;--------------------
                                    539 ; extract int24_t  
                                    540 ; value from BASIC 
                                    541 ; code 
                                    542 ; input:
                                    543 ;    X   *integer 
                                    544 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    545 ;    A:X   int24  
                                    546 ;--------------------
      001787                        547 get_int24:
      0097D4 00               [ 1]  548 	ld a,(x)
      0097D5 05 72            [ 2]  549 	ldw x,(1,x)
                                    550 ; skip 3 bytes 
      0097D7 BB 00 01 F6      [ 1]  551 	inc in 
      0097DB 5C 72 5C 00      [ 1]  552 	inc in 
      0097DF 02 81 00 01      [ 1]  553 	inc in 
      0097E1 81               [ 4]  554 	ret 
                                    555 
                                    556 ;-------------------------
                                    557 ; get character from 
                                    558 ; BASIC code 
                                    559 ; input:
                                    560 ;    X   *char 
                                    561 ; output:
                                    562 ;    A    char 
                                    563 ;-------------------------
      001797                        564 get_char:
      0097E1 FE               [ 1]  565 	ld a,(x)
      0097E2 DE B3 76 01      [ 1]  566 	inc in  
      0097E5 81               [ 4]  567     ret 
                                    568 
                                    569 ;-----------------------------------
                                    570 ; print a 16 bit integer 
                                    571 ; using variable 'base' as conversion
                                    572 ; format.
                                    573 ; input:
                                    574 ;    X       integer to print 
                                    575 ;   'base'    conversion base 
                                    576 ; output:
                                    577 ;   terminal  
                                    578 ;-----------------------------------
      00179D                        579 prt_i16:
      0097E5 72 5C 00 02      [ 1]  580 	clr acc24 
      0097E9 72 5C 00         [ 2]  581 	ldw acc16,x 
      0097EC 02 81 00 0D 04   [ 2]  582 	btjf acc16,#7,prt_acc24
      0097EE 72 53 00 0C      [ 1]  583 	cpl acc24 ; sign extend 
                                    584 	
                                    585 ;------------------------------------
                                    586 ; print integer in acc24 
                                    587 ; input:
                                    588 ;	acc24 		integer to print 
                                    589 ;	'base' 		numerical base for conversion 
                                    590 ;   'tab_width' field width 
                                    591 ;    A 			signed||unsigned conversion
                                    592 ;  output:
                                    593 ;    A          string length
                                    594 ;------------------------------------
      0017AD                        595 prt_acc24:
      0097EE F6 27            [ 1]  596 	ld a,#255  ; signed conversion  
      0097F0 03 5C 20         [ 4]  597     call itoa  ; conversion entier en  .asciz
      0097F3 FA 5C 72         [ 4]  598 	call right_align  
      0097F6 B0               [ 1]  599 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0097F7 00 05 CF         [ 4]  600 	call puts
      0097FA 00               [ 1]  601 	pop a 
      0097FB 01               [ 4]  602     ret	
                                    603 
                                    604 ;---------------------------------------
                                    605 ;  print value at xstack top 
                                    606 ;---------------------------------------
      0017BB                        607 print_top: 
      0017BB                        608 	_xpop 
      0097FC 81 F6            [ 1]    1     ld a,(y)
      0097FD 93               [ 1]    2     ldw x,y 
      0097FD FE 72            [ 2]    3     ldw x,(1,x)
      0097FF 5C 00 02 72      [ 2]    4     addw y,#CELL_SIZE 
      009803 5C 00 02         [ 1]  609 	ld acc24,a 
      009806 81 00 0D         [ 2]  610 	ldw acc16,x 
      009807 CD 17 AD         [ 4]  611 	call prt_acc24 
      009807 F6 EE            [ 1]  612 	ld a,#SPACE
      009809 01 72 5C         [ 4]  613 	call putc 
      00980C 00               [ 4]  614 	ret 
                                    615 
                                    616 ;------------------------------------
                                    617 ; convert integer in acc24 to string
                                    618 ; input:
                                    619 ;   'base'	conversion base 
                                    620 ;	acc24	integer to convert
                                    621 ;   A       0=unsigned, else signed 
                                    622 ; output:
                                    623 ;   X  		pointer to first char of string
                                    624 ;   A       string length
                                    625 ;------------------------------------
                           000001   626 	SIGN=1  ; integer sign 
                           000002   627 	LEN=2 
                           000003   628 	PSTR=3
                           000004   629 	VSIZE=4 ;locals size
      0017D3                        630 itoa::
      0017D3                        631 	_vars VSIZE
      00980D 02 72            [ 2]    1     sub sp,#VSIZE 
      00980F 5C 00            [ 1]  632 	clr (LEN,sp) ; string length  
      009811 02 72            [ 1]  633 	clr (SIGN,sp)    ; sign
      009813 5C               [ 1]  634 	tnz A
      009814 00 02            [ 1]  635 	jreq 1$ ; unsigned conversion  
      009816 81 00 0A         [ 1]  636 	ld a,base 
      009817 A1 0A            [ 1]  637 	cp a,#10
      009817 F6 72            [ 1]  638 	jrne 1$
                                    639 	; base 10 string display with negative sign if bit 23==1
      009819 5C 00 02 81 05   [ 2]  640 	btjf acc24,#7,1$
      00981D 03 01            [ 1]  641 	cpl (SIGN,sp)
      00981D 72 5F 00         [ 4]  642 	call neg_acc24
      0017ED                        643 1$:
                                    644 ; initialize string pointer 
      009820 0D CF 00         [ 2]  645 	ldw x,#tib 
      009823 0E 72 0F         [ 2]  646 	addw x,#TIB_SIZE
      009826 00               [ 2]  647 	decw x 
      009827 0E               [ 1]  648 	clr (x)
      0017F5                        649 itoa_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      009828 04 72 53         [ 1]  650     ld a,base
                                    651 ;	ldw (PSTR,sp),x 
      00982B 00 0D C7         [ 4]  652     call divu24_8 ; acc24/A 
                                    653 ;	ldw x,(PSTR,sp)
      00982D AB 30            [ 1]  654     add a,#'0  ; remainder of division
      00982D A6 FF            [ 1]  655     cp a,#'9+1
      00982F CD 98            [ 1]  656     jrmi 2$
      009831 53 CD            [ 1]  657     add a,#7 
      001803                        658 2$:	
      009833 91               [ 2]  659 	decw x
      009834 AD               [ 1]  660     ld (x),a
      009835 88 CD            [ 1]  661 	inc (LEN,sp)
                                    662 	; if acc24==0 conversion done
      009837 89 DA 84         [ 1]  663 	ld a,acc24
      00983A 81 00 0D         [ 1]  664 	or a,acc16
      00983B CA 00 0E         [ 1]  665 	or a,acc8
      00983B 90 F6            [ 1]  666     jrne itoa_loop
                                    667 	;conversion done, next add '$' or '-' as required
      00983D 93 EE 01         [ 1]  668 	ld a,base 
      009840 72 A9            [ 1]  669 	cp a,#16
      009842 00 03            [ 1]  670 	jreq 8$
      009844 C7 00            [ 1]  671 	ld a,(SIGN,sp)
      009846 0D CF            [ 1]  672     jreq 10$
      009848 00 0E            [ 1]  673     ld a,#'-
      00984A CD 98            [ 2]  674 	jra 9$ 
      001821                        675 8$:	
      00984C 2D A6            [ 1]  676 	ld a,#'$ 
      00984E 20               [ 2]  677 9$: decw x
      00984F CD               [ 1]  678     ld (x),a
      009850 89 7D            [ 1]  679 	inc (LEN,sp)
      001827                        680 10$:
      009852 81 02            [ 1]  681 	ld a,(LEN,sp)
      009853                        682 	_drop VSIZE
      009853 52 04            [ 2]    1     addw sp,#VSIZE 
      009855 0F               [ 4]  683 	ret
                                    684 
                                    685 ;------------------------------------
                                    686 ; convert alpha to uppercase
                                    687 ; input:
                                    688 ;    a  character to convert
                                    689 ; output:
                                    690 ;    a  uppercase character
                                    691 ;------------------------------------
      00182C                        692 to_upper::
      009856 02 0F            [ 1]  693 	cp a,#'a
      009858 01 4D            [ 1]  694 	jrpl 1$
      00985A 27               [ 4]  695 0$:	ret
      00985B 11 C6            [ 1]  696 1$: cp a,#'z	
      00985D 00 0B            [ 1]  697 	jrugt 0$
      00985F A1 0A            [ 1]  698 	sub a,#32
      009861 26               [ 4]  699 	ret
                                    700 	
                                    701 ;------------------------------------
                                    702 ; convert pad content in integer
                                    703 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    704 ;    x		* .asciz to convert
                                    705 ; output:
                                    706 ;    acc24      int24_t
                                    707 ;------------------------------------
                                    708 	; local variables
                           000001   709 	SIGN=1 ; 1 byte, 
                           000002   710 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   711 	TEMP=3 ; 1 byte, temporary storage
                           000003   712 	VSIZE=3 ; 3 bytes reserved for local storage
      001838                        713 atoi24::
      009862 0A               [ 2]  714 	pushw x 
      001839                        715 	_vars VSIZE
      009863 72 0F            [ 2]    1     sub sp,#VSIZE 
                                    716 	; acc24=0 
      009865 00 0D 05 03      [ 1]  717 	clr acc24    
      009869 01 CD 82 51      [ 1]  718 	clr acc16
      00986D 72 5F 00 0E      [ 1]  719 	clr acc8 
      00986D AE 16            [ 1]  720 	clr (SIGN,sp)
      00986F 68 1C            [ 1]  721 	ld a,#10
      009871 00 50            [ 1]  722 	ld (BASE,sp),a ; default base decimal
      009873 5A               [ 1]  723 	ld a,(x)
      009874 7F 47            [ 1]  724 	jreq 9$  ; completed if 0
      009875 A1 2D            [ 1]  725 	cp a,#'-
      009875 C6 00            [ 1]  726 	jrne 1$
      009877 0B CD            [ 1]  727 	cpl (SIGN,sp)
      009879 83 47            [ 2]  728 	jra 2$
      00987B AB 30            [ 1]  729 1$: cp a,#'$
      00987D A1 3A            [ 1]  730 	jrne 3$
      00987F 2B 02            [ 1]  731 	ld a,#16
      009881 AB 07            [ 1]  732 	ld (BASE,sp),a
      009883 5C               [ 1]  733 2$:	incw x
      009883 5A               [ 1]  734 	ld a,(x)
      001862                        735 3$:	
      009884 F7 0C            [ 1]  736 	cp a,#'a
      009886 02 C6            [ 1]  737 	jrmi 4$
      009888 00 0D            [ 1]  738 	sub a,#32
      00988A CA 00            [ 1]  739 4$:	cp a,#'0
      00988C 0E CA            [ 1]  740 	jrmi 9$
      00988E 00 0F            [ 1]  741 	sub a,#'0
      009890 26 E3            [ 1]  742 	cp a,#10
      009892 C6 00            [ 1]  743 	jrmi 5$
      009894 0B A1            [ 1]  744 	sub a,#7
      009896 10 27            [ 1]  745 	cp a,(BASE,sp)
      009898 08 7B            [ 1]  746 	jrpl 9$
      00989A 01 27            [ 1]  747 5$:	ld (TEMP,sp),a
      00989C 0A A6            [ 1]  748 	ld a,(BASE,sp)
      00989E 2D 20 02         [ 4]  749 	call mulu24_8
      0098A1 7B 03            [ 1]  750 	ld a,(TEMP,sp)
      0098A1 A6 24 5A         [ 1]  751 	add a,acc24+2
      0098A4 F7 0C 02         [ 1]  752 	ld acc24+2,a
      0098A7 4F               [ 1]  753 	clr a
      0098A7 7B 02 5B         [ 1]  754 	adc a,acc24+1
      0098AA 04 81 0D         [ 1]  755 	ld acc24+1,a
      0098AC 4F               [ 1]  756 	clr a
      0098AC A1 61 2A         [ 1]  757 	adc a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0098AF 01 81 A1         [ 1]  758 	ld acc24,a
      0098B2 7A 22            [ 2]  759 	jra 2$
      0098B4 FB A0            [ 1]  760 9$:	tnz (SIGN,sp)
      0098B6 20 81            [ 1]  761     jreq atoi_exit
      0098B8 CD 01 D1         [ 4]  762     call neg_acc24
      00189E                        763 atoi_exit: 
      00189E                        764 	_drop VSIZE
      0098B8 89 52            [ 2]    1     addw sp,#VSIZE 
      0098BA 03               [ 2]  765 	popw x ; restore x
      0098BB 72               [ 4]  766 	ret
                                    767 
                                    768 
                                    769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    770 ;;   TINY BASIC  operators,
                                    771 ;;   commands and functions 
                                    772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    773 
                                    774 ;---------------------------------
                                    775 ; dictionary search 
                                    776 ; input:
                                    777 ;	X 		dictionary entry point, name field  
                                    778 ;   y		.asciz name to search 
                                    779 ; output:
                                    780 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    781 ;  X		cmd_index
                                    782 ;---------------------------------
                           000001   783 	NLEN=1 ; cmd length 
                           000002   784 	XSAVE=2
                           000004   785 	YSAVE=4
                           000005   786 	VSIZE=5 
      0018A2                        787 search_dict::
      0018A2                        788 	_vars VSIZE 
      0098BC 5F 00            [ 2]    1     sub sp,#VSIZE 
      0098BE 0D 72            [ 2]  789 	ldw (YSAVE,sp),y 
      0018A6                        790 search_next:
      0098C0 5F 00            [ 2]  791 	ldw (XSAVE,sp),x 
                                    792 ; get name length in dictionary	
      0098C2 0E               [ 1]  793 	ld a,(x)
      0098C3 72 5F            [ 1]  794 	and a,#0xf 
      0098C5 00 0F            [ 1]  795 	ld (NLEN,sp),a  
      0098C7 0F 01            [ 2]  796 	ldw y,(YSAVE,sp) ; name pointer 
      0098C9 A6               [ 1]  797 	incw x 
      0018B0                        798 cp_loop:
      0098CA 0A 6B            [ 1]  799 	ld a,(y)
      0098CC 02 F6            [ 1]  800 	jreq str_match 
      0098CE 27 47            [ 1]  801 	tnz (NLEN,sp)
      0098D0 A1 2D            [ 1]  802 	jreq no_match  
      0098D2 26               [ 1]  803 	cp a,(x)
      0098D3 04 03            [ 1]  804 	jrne no_match 
      0098D5 01 20            [ 1]  805 	incw y 
      0098D7 08               [ 1]  806 	incw x
      0098D8 A1 24            [ 1]  807 	dec (NLEN,sp)
      0098DA 26 06            [ 2]  808 	jra cp_loop 
      0018C2                        809 no_match:
      0098DC A6 10            [ 2]  810 	ldw x,(XSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0098DE 6B 02 5C         [ 2]  811 	subw x,#2 ; move X to link field
      0098E1 F6 00            [ 1]  812 	push #TK_NONE 
      0098E2 FE               [ 2]  813 	ldw x,(x) ; next word link 
      0098E2 A1               [ 1]  814 	pop a ; TK_NONE 
      0098E3 61 2B            [ 1]  815 	jreq search_exit  ; not found  
                                    816 ;try next 
      0098E5 02 A0            [ 2]  817 	jra search_next
      0018CF                        818 str_match:
      0098E7 20 A1            [ 2]  819 	ldw x,(XSAVE,sp)
      0098E9 30               [ 1]  820 	ld a,(X)
      0098EA 2B 2B            [ 1]  821 	ld (NLEN,sp),a ; needed to test keyword type  
      0098EC A0 30            [ 1]  822 	and a,#0xf 
                                    823 ; move x to procedure address field 	
      0098EE A1               [ 1]  824 	inc a 
      0098EF 0A 2B 06         [ 1]  825 	ld acc8,a 
      0098F2 A0 07 11 02      [ 1]  826 	clr acc16 
      0098F6 2A 1F 6B 03      [ 2]  827 	addw x,acc16 
      0098FA 7B               [ 2]  828 	ldw x,(x) ; routine index  
                                    829 ;determine keyword type bits 7:6 
      0098FB 02 CD            [ 1]  830 	ld a,(NLEN,sp)
      0098FD 82               [ 1]  831 	swap a 
      0098FE 6E 7B            [ 1]  832 	and a,#0xc
      009900 03               [ 1]  833 	srl a
      009901 CB               [ 1]  834 	srl a 
      009902 00 0F            [ 1]  835 	add a,#128
      0018EC                        836 search_exit: 
      0018EC                        837 	_drop VSIZE 
      009904 C7 00            [ 2]    1     addw sp,#VSIZE 
      009906 0F               [ 4]  838 	ret 
                                    839 
                                    840 ;---------------------
                                    841 ; check if next token
                                    842 ;  is of expected type 
                                    843 ; input:
                                    844 ;   A 		 expected token attribute
                                    845 ;  ouput:
                                    846 ;   none     if fail call syntax_error 
                                    847 ;--------------------
      0018EF                        848 expect:
      009907 4F               [ 1]  849 	push a 
      009908 C9 00 0E         [ 4]  850 	call next_token 
      00990B C7 00            [ 1]  851 	cp a,(1,sp)
      00990D 0E 4F            [ 1]  852 	jreq 1$
      00990F C9 00 0D         [ 2]  853 	jp syntax_error
      009912 C7               [ 1]  854 1$: pop a 
      009913 00               [ 4]  855 	ret 
                                    856 
                                    857 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    858 ; parse arguments list 
                                    859 ; between ()
                                    860 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018FC                        861 func_args:
      009914 0D 20            [ 1]  862 	ld a,#TK_LPAREN 
      009916 C9 0D 01         [ 4]  863 	call expect 
                                    864 ; expected to continue in arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    865 ; caller must check for TK_RPAREN 
                                    866 
                                    867 ;-------------------------------
                                    868 ; parse embedded BASIC routines 
                                    869 ; arguments list.
                                    870 ; arg_list::=  expr[','expr]*
                                    871 ; all arguments are of int24_t type
                                    872 ; and pushed on stack 
                                    873 ; input:
                                    874 ;   none
                                    875 ; output:
                                    876 ;   xstack{n}   arguments pushed on xstack
                                    877 ;   A 	number of arguments pushed on xstack  
                                    878 ;--------------------------------
      001901                        879 arg_list:
      009919 27 03            [ 1]  880 	push #0  
      00991B CD 82 51         [ 4]  881 1$: call expression
      00991E A1 00            [ 1]  882 	cp a,#TK_NONE 
      00991E 5B 03            [ 1]  883 	jreq 5$
      009920 85 81            [ 1]  884 	cp a,#TK_INTGR
      009922 26 0D            [ 1]  885 	jrne 4$
      00190E                        886 3$: 
      009922 52 05            [ 1]  887 	inc (1,sp)
      009924 17 04 47         [ 4]  888 	call next_token 
      009926 A1 08            [ 1]  889 	cp a,#TK_COMMA 
      009926 1F 02            [ 1]  890 	jreq 1$ 
      009928 F6 A4            [ 1]  891 	cp a,#TK_NONE 
      00992A 0F 6B            [ 1]  892 	jreq 5$ 
      00992C 01 16            [ 1]  893 4$:	cp a,#TK_RPAREN 
      00992E 04 5C            [ 1]  894 	jreq 5$
      009930                        895 	_unget_token 
      009930 90 F6 27 1B 0D   [ 1]    1      mov in,in.saved  
      009935 01               [ 1]  896 5$:	pop a  
      009936 27               [ 4]  897 	ret 
                                    898 
                                    899 ;--------------------------------
                                    900 ;   BASIC commnands 
                                    901 ;--------------------------------
                                    902 
                                    903 ;--------------------------------
                                    904 ;  arithmetic and relational 
                                    905 ;  routines
                                    906 ;  operators precedence
                                    907 ;  highest to lowest
                                    908 ;  operators on same row have 
                                    909 ;  same precedence and are executed
                                    910 ;  from left to right.
                                    911 ;	'*','/','%'
                                    912 ;   '-','+'
                                    913 ;   '=','>','<','>=','<=','<>','><'
                                    914 ;   '<>' and '><' are equivalent for not equal.
                                    915 ;--------------------------------
                                    916 
                                    917 ;---------------------
                                    918 ; return array element
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    919 ; address from @(expr)
                                    920 ; input:
                                    921 ;   A 		TK_ARRAY
                                    922 ; output:
                                    923 ;	X 		element address 
                                    924 ;----------------------
      001926                        925 get_array_element:
      009937 0A F1 26         [ 4]  926 	call func_args 
      00993A 07 90            [ 1]  927 	cp a,#1
      00993C 5C 5C            [ 1]  928 	jreq 1$
      00993E 0A 01 20         [ 2]  929 	jp syntax_error
      001930                        930 1$: _xpop 
      009941 EE F6            [ 1]    1     ld a,(y)
      009942 93               [ 1]    2     ldw x,y 
      009942 1E 02            [ 2]    3     ldw x,(1,x)
      009944 1D 00 02 4B      [ 2]    4     addw y,#CELL_SIZE 
                                    931     ; ignore A, index < 65536 in any case 
                                    932 	; check for bounds 
      009948 00 FE 84         [ 2]  933 	cpw x,array_size 
      00994B 27 1F            [ 2]  934 	jrule 3$
                                    935 ; bounds {1..array_size}	
      00994D 20 D7            [ 1]  936 2$: ld a,#ERR_BAD_VALUE 
      00994F CC 16 4A         [ 2]  937 	jp tb_error 
      00994F 1E               [ 2]  938 3$: tnzw  x
      009950 02 F6            [ 1]  939 	jreq 2$ 
      009952 6B               [ 2]  940 	pushw x 
      009953 01               [ 2]  941 	sllw x 
      009954 A4 0F 4C         [ 2]  942 	addw x,(1,sp) ; index*size_of(int24)
      009957 C7 00            [ 2]  943 	ldw (1,sp),x  
      009959 0F 72 5F         [ 2]  944 	ldw x,#tib ; array is below tib 
      00995C 00 0E 72         [ 2]  945 	subw x,(1,sp)
      001953                        946 	_drop 2   
      00995F BB 00            [ 2]    1     addw sp,#2 
      009961 0E               [ 4]  947 	ret 
                                    948 
                                    949 
                                    950 ;***********************************
                                    951 ;   expression parse,execute 
                                    952 ;***********************************
                                    953 ;-----------------------------------
                                    954 ; factor ::= ['+'|'-'|e]  var | @ |
                                    955 ;			 integer | function |
                                    956 ;			 '('relation')' 
                                    957 ; output:
                                    958 ;   A       token attribute 
                                    959 ;   xstack  value  
                                    960 ; ---------------------------------
                           000001   961 	NEG=1
                           000001   962 	VSIZE=1
      001956                        963 factor:
      001956                        964 	_vars VSIZE 
      009962 FE 7B            [ 2]    1     sub sp,#VSIZE 
      009964 01 4E            [ 1]  965 	clr (NEG,sp)
      009966 A4 0C 44         [ 4]  966 	call next_token
      009969 44 AB            [ 1]  967 	cp a,#CMD_END  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00996B 80 6D            [ 1]  968 	jrult 16$
      00996C A1 10            [ 1]  969 1$:	cp a,#TK_PLUS 
      00996C 5B 05            [ 1]  970 	jreq 2$
      00996E 81 11            [ 1]  971 	cp a,#TK_MINUS 
      00996F 26 05            [ 1]  972 	jrne 4$ 
      00996F 88 CD            [ 1]  973 	cpl (NEG,sp)
      00196B                        974 2$:	
      009971 97 C7 11         [ 4]  975 	call next_token 
      00196E                        976 4$:	
      009974 01 27            [ 1]  977 	cp a,#TK_IFUNC 
      009976 03 CC            [ 1]  978 	jrne 5$ 
      009978 96 C8 84         [ 4]  979 	call get_code_addr 
      00997B 81               [ 4]  980 	call (x); result in A:X  
      00997C 20 61            [ 2]  981 	jra 18$ 
      001978                        982 5$:
      00997C A6 06            [ 1]  983 	cp a,#TK_INTGR
      00997E CD 99            [ 1]  984 	jrne 6$
      009980 6F 17 87         [ 4]  985 	call get_int24 
      009981 20 58            [ 2]  986 	jra 18$
      001981                        987 6$:
      009981 4B 00            [ 1]  988 	cp a,#TK_ARRAY
      009983 CD 9A            [ 1]  989 	jrne 7$
      009985 B8 A1 00         [ 4]  990 	call get_array_element
      009988 27 1A            [ 2]  991     jra 71$
      00198A                        992 7$:
      00998A A1 84            [ 1]  993 	cp a,#TK_VAR 
      00998C 26 0D            [ 1]  994 	jrne 8$
      00998E CD 17 7D         [ 4]  995 	call get_addr 
      001991                        996 71$:
      00998E 0C               [ 1]  997 	ld a,(x)
      00998F 01 CD            [ 2]  998 	ldw x,(1,x)
      009991 97 C7            [ 2]  999 	jra 18$
      001996                       1000 8$:
      009993 A1 08            [ 1] 1001 	cp a,#TK_LABEL 
      009995 27 EC            [ 1] 1002 	jrne 9$ 
      009997 A1               [ 2] 1003 	pushw x 
      009998 00 27 09         [ 4] 1004 	call skip_string
      00999B A1               [ 2] 1005 	popw x 
      00999C 07 27 05         [ 4] 1006 	call search_const 
      00999F 55               [ 1] 1007 	clr a 
      0099A0 00               [ 2] 1008 	tnzw x 
      0099A1 03 00            [ 1] 1009 	jreq 16$
      0099A3 02 84 81         [ 4] 1010 	call get_const_value 
      0099A6 20 2E            [ 2] 1011 	jra 18$
      0019AB                       1012 9$: 
      0099A6 CD 99            [ 1] 1013 	cp a,#TK_CFUNC 
      0099A8 7C A1            [ 1] 1014 	jrne 12$
      0099AA 01 27 03         [ 4] 1015 	call get_code_addr 
      0099AD CC               [ 4] 1016 	call(x)
      0099AE 96               [ 1] 1017 	clrw x 
      0099AF C8               [ 1] 1018 	rlwa x 
      0099B0 90 F6            [ 2] 1019 	jra 18$ 	 
      0019B7                       1020 12$:			
      0099B2 93 EE            [ 1] 1021 	cp a,#TK_LPAREN
      0099B4 01 72            [ 1] 1022 	jrne 16$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0099B6 A9 00 03         [ 4] 1023 	call expression
      0099B9 C3 00            [ 1] 1024 	ld a,#TK_RPAREN 
      0099BB 20 23 05         [ 4] 1025 	call expect
      0019C3                       1026 	_xpop 
      0099BE A6 0A            [ 1]    1     ld a,(y)
      0099C0 CC               [ 1]    2     ldw x,y 
      0099C1 96 CA            [ 2]    3     ldw x,(1,x)
      0099C3 5D 27 F8 89      [ 2]    4     addw y,#CELL_SIZE 
      0099C7 58 72            [ 2] 1027 	jra 18$	
      0019CE                       1028 16$:
      0099C9 FB               [ 1] 1029 	tnz a 
      0099CA 01 1F            [ 1] 1030 	jreq 20$ 
      0019D1                       1031 	_unget_token
      0099CC 01 AE 16 68 72   [ 1]    1      mov in,in.saved  
      0099D1 F0               [ 1] 1032 	clr a 
      0099D2 01 5B            [ 2] 1033 	jra 20$ 
      0019D9                       1034 18$: 
      0099D4 02 81            [ 1] 1035 	tnz (NEG,sp)
      0099D6 27 03            [ 1] 1036 	jreq 19$
      0099D6 52 01 0F         [ 4] 1037 	call neg_ax   
      0019E0                       1038 19$: _xpush 
      0099D9 01 CD 97 C7      [ 2]    1     subw y,#CELL_SIZE
      0099DD A1 02            [ 1]    2     ld (y),a 
      0099DF 25 6D A1         [ 2]    3     ldw (1,y),x 
      0099E2 10 27            [ 1] 1039      ld a,#TK_INTGR
      0019EB                       1040 20$:
      0019EB                       1041 	_drop VSIZE
      0099E4 06 A1            [ 2]    1     addw sp,#VSIZE 
      0099E6 11               [ 4] 1042 	ret
                                   1043 
                                   1044 
                                   1045 ;-----------------------------------
                                   1046 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1047 ; output:
                                   1048 ;   A    	token attribute 
                                   1049 ;	xstack		value 
                                   1050 ;-----------------------------------
                           000001  1051 	MULOP=1
                           000001  1052 	VSIZE=1
      0019EE                       1053 term:
      0019EE                       1054 	_vars VSIZE
      0099E7 26 05            [ 2]    1     sub sp,#VSIZE 
      0099E9 03 01 56         [ 4] 1055 	call factor
      0099EB 4D               [ 1] 1056 	tnz a 
      0099EB CD 97            [ 1] 1057 	jreq term_exit 
      0019F6                       1058 term01:	 ; check for  operator 
      0099ED C7 17 47         [ 4] 1059 	call next_token
      0099EE 6B 01            [ 1] 1060 	ld (MULOP,sp),a
      0099EE A1 81            [ 1] 1061 	cp a,#CMD_END
      0099F0 26 06            [ 1] 1062 	jrult 8$
      0099F2 CD 97            [ 1] 1063 	and a,#TK_GRP_MASK
      0099F4 E1 FD            [ 1] 1064 	cp a,#TK_GRP_MULT
      0099F6 20 61            [ 1] 1065 	jreq 1$
      0099F8 20 23            [ 2] 1066 	jra 8$
      001A07                       1067 1$:	; got *|/|%
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0099F8 A1 84 26         [ 4] 1068 	call factor
      0099FB 05 CD            [ 1] 1069 	cp a,#TK_INTGR
      0099FD 98 07            [ 1] 1070 	jreq 2$
      0099FF 20 58 48         [ 2] 1071 	jp syntax_error
      009A01                       1072 2$:	
      009A01 A1 05            [ 1] 1073 	ld a,(MULOP,sp) 
      009A03 26 05            [ 1] 1074 	cp a,#TK_MULT 
      009A05 CD 99            [ 1] 1075 	jrne 3$
      009A07 A6 20 07         [ 4] 1076 	call mul24 
      009A0A 20 DA            [ 2] 1077 	jra term01
      009A0A A1 85            [ 1] 1078 3$: cp a,#TK_DIV 
      009A0C 26 08            [ 1] 1079 	jrne 4$ 
      009A0E CD 97 FD         [ 4] 1080 	call div24 
      009A11 20 D1            [ 2] 1081 	jra term01 
      009A11 F6 EE 01         [ 4] 1082 4$: call mod24
      009A14 20 43            [ 2] 1083 	jra term01 
      009A16 7B 01            [ 1] 1084 8$: ld a,(MULOP,sp)
      009A16 A1 03            [ 1] 1085 	jreq 9$ 
      001A2E                       1086 	_unget_token
      009A18 26 11 89 CD 97   [ 1]    1      mov in,in.saved  
      001A33                       1087 9$: 
      009A1D EE 85            [ 1] 1088 	ld a,#TK_INTGR 	
      001A35                       1089 term_exit:
      001A35                       1090 	_drop VSIZE 
      009A1F CD 9D            [ 2]    1     addw sp,#VSIZE 
      009A21 10               [ 4] 1091 	ret 
                                   1092 
                                   1093 ;-------------------------------
                                   1094 ;  expr ::= term [['+'|'-'] term]*
                                   1095 ;  result range {-32768..32767}
                                   1096 ;  output:
                                   1097 ;   A    token attribute 
                                   1098 ;   xstack	 result    
                                   1099 ;-------------------------------
                           000001  1100 	OP=1 
                           000001  1101 	VSIZE=1 
      001A38                       1102 expression:
      001A38                       1103 	_vars VSIZE 
      009A22 4F 5D            [ 2]    1     sub sp,#VSIZE 
      009A24 27 28 CD         [ 4] 1104 	call term
      009A27 9C               [ 1] 1105 	tnz a 
      009A28 71 20            [ 1] 1106 	jreq expr_exit 
      001A40                       1107 1$:	
      009A2A 2E 17 47         [ 4] 1108 	call next_token
      009A2B 6B 01            [ 1] 1109 	ld (OP,sp),a 
      009A2B A1 82            [ 1] 1110 	cp a,#CMD_END 
      009A2D 26 08            [ 1] 1111 	jrult 8$ 
      009A2F CD 97            [ 1] 1112 	and a,#TK_GRP_MASK
      009A31 E1 FD            [ 1] 1113 	cp a,#TK_GRP_ADD 
      009A33 5F 02            [ 1] 1114 	jreq 2$ 
      009A35 20 22            [ 2] 1115 	jra 8$
      009A37                       1116 2$: 
      009A37 A1 06 26         [ 4] 1117 	call term
      009A3A 13 CD            [ 1] 1118 	cp a,#TK_INTGR
      009A3C 9A B8            [ 1] 1119 	jreq 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009A3E A6 07 CD         [ 2] 1120 	jp syntax_error
      001A5B                       1121 3$:	
      009A41 99 6F            [ 1] 1122 	ld a,(OP,sp)
      009A43 90 F6            [ 1] 1123 	cp a,#TK_PLUS 
      009A45 93 EE            [ 1] 1124 	jrne 4$
      009A47 01 72 A9         [ 4] 1125 	call add24
      009A4A 00 03            [ 2] 1126 	jra 1$ 
      001A66                       1127 4$:	
      009A4C 20 0B 7D         [ 4] 1128 	call sub24
      009A4E 20 D5            [ 2] 1129 	jra 1$
      009A4E 4D 27            [ 1] 1130 8$: ld a,(OP,sp)
      009A50 1A 55            [ 1] 1131 	jreq 9$ 
      001A6F                       1132 	_unget_token	
      009A52 00 03 00 02 4F   [ 1]    1      mov in,in.saved  
      001A74                       1133 9$: 
      009A57 20 12            [ 1] 1134 	ld a,#TK_INTGR	
      009A59                       1135 expr_exit:
      001A76                       1136 	_drop VSIZE 
      009A59 0D 01            [ 2]    1     addw sp,#VSIZE 
      009A5B 27               [ 4] 1137 	ret 
                                   1138 
                                   1139 ;---------------------------------------------
                                   1140 ; rel ::= expr rel_op expr
                                   1141 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1142 ;  relation return  integer , zero is false 
                                   1143 ;  output:
                                   1144 ;    A 		token attribute  
                                   1145 ;	 xstack		value  
                                   1146 ;---------------------------------------------
                           000001  1147 	RELOP=1
                           000001  1148 	VSIZE=1 
      001A79                       1149 relation: 
      001A79                       1150 	_vars VSIZE
      009A5C 03 CD            [ 2]    1     sub sp,#VSIZE 
      009A5E 82 49 72         [ 4] 1151 	call expression
      009A61 A2               [ 1] 1152 	tnz a 
      009A62 00 03            [ 1] 1153 	jrne 1$
      009A64 90 F7 90         [ 2] 1154 	jp rel_exit
      001A84                       1155 1$:	
                                   1156 ; expect rel_op or leave 
      009A67 EF 01 A6         [ 4] 1157 	call next_token 
      009A6A 84 01            [ 1] 1158 	ld (RELOP,sp),a 
      009A6B A4 30            [ 1] 1159 	and a,#TK_GRP_MASK
      009A6B 5B 01            [ 1] 1160 	cp a,#TK_GRP_RELOP 
      009A6D 81 31            [ 1] 1161 	jrne 8$
      009A6E                       1162 2$:	; expect another expression
      009A6E 52 01 CD         [ 4] 1163 	call expression
      009A71 99 D6            [ 1] 1164 	cp a,#TK_INTGR
      009A73 4D 27            [ 1] 1165 	jreq 3$
      009A75 3F 16 48         [ 2] 1166 	jp syntax_error 
      009A76                       1167 3$:	
      009A76 CD 97 C7         [ 4] 1168 	call sub24 
      009A79 6B 01            [ 1] 1169 	jrne 4$
      009A7B A1 02 25 2B      [ 1] 1170 	mov acc8,#2 ; n1==n2
      009A7F A4 30            [ 2] 1171 	jra 6$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001AA4                       1172 4$: 
      009A81 A1 20            [ 1] 1173 	jrsgt 5$  
      009A83 27 02 20 23      [ 1] 1174 	mov acc8,#4 ; n1<2 
      009A87 20 04            [ 2] 1175 	jra 6$
      001AAC                       1176 5$:
      009A87 CD 99 D6 A1      [ 1] 1177 	mov acc8,#1 ; n1>n2 
      001AB0                       1178 6$:
      009A8B 84               [ 1] 1179 	clrw x 
      009A8C 27 03 CC         [ 1] 1180 	ld a, acc8  
      009A8F 96 C8            [ 1] 1181 	and a,(RELOP,sp)
      009A91 27 01            [ 1] 1182 	jreq 7$
      009A91 7B               [ 1] 1183 	incw x
      001AB9                       1184 7$:	_store_top   
      009A92 01 A1            [ 1]    1     ld (y),a 
      009A94 20 26 05         [ 2]    2     ldw (1,y),x     
      009A97 CD 82            [ 2] 1185 	jra 10$  	
      009A99 A1 20            [ 1] 1186 8$: ld a,(RELOP,sp)
      009A9B DA A1            [ 1] 1187 	jreq 10$
      001AC4                       1188 	_unget_token
      009A9D 21 26 05 CD 83   [ 1]    1      mov in,in.saved  
      001AC9                       1189 10$:
      009AA2 65 20            [ 1] 1190 	ld a,#TK_INTGR
      001ACB                       1191 rel_exit:
      001ACB                       1192 	_drop VSIZE
      009AA4 D1 CD            [ 2]    1     addw sp,#VSIZE 
      009AA6 84               [ 4] 1193 	ret 
                                   1194 
                                   1195 ;--------------------------------
                                   1196 ; BASIC: SHOW 
                                   1197 ; print stack content in hexadecimal bytes 
                                   1198 ; 16 bytes per row 
                                   1199 ;--------------------------------
                           000001  1200 	DEPTH=1
                           000002  1201 	CNTR=2
                           000002  1202 	VSIZE=2
      001ACE                       1203 show:
      001ACE                       1204 	_vars VSIZE 
      009AA7 13 20            [ 2]    1     sub sp,#VSIZE 
      009AA9 CC 7B            [ 1] 1205 	clr (CNTR,sp)
      009AAB 01 27 05         [ 2] 1206 	ldw x,#cstk_prompt
      009AAE 55 00 03         [ 4] 1207 	call puts 
      009AB1 00 02            [ 2] 1208 	pushw y 
      009AB3 AE 17 73         [ 2] 1209 	ldw x,#XSTACK_EMPTY
      009AB3 A6 84 01         [ 2] 1210 	subw x,(1,sp)
      009AB5                       1211 	_drop 2
      009AB5 5B 01            [ 2]    1     addw sp,#2 
      009AB7 81 03            [ 1] 1212 	ld a,#CELL_SIZE 
      009AB8 62               [ 2] 1213 	div x,a  
      009AB8 52               [ 1] 1214 	ld a,xl  
      009AB9 01 CD            [ 1] 1215     ld (DEPTH,sp),a 
      009ABB 9A 6E 4D 27      [ 2] 1216 	ldw ptr16,y 
      001AEC                       1217 1$: 
      009ABF 36 C6 00 18      [ 4] 1218 	ld a,[ptr16]
      009AC0 72 5C 00 19      [ 1] 1219 	inc ptr8 
      009AC0 CD 97 C7 6B      [ 5] 1220 	ldw x,[ptr16]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009AC4 01 A1 02 25      [ 1] 1221 	inc ptr8 
      009AC8 22 A4 30 A1      [ 1] 1222 	inc ptr8 
      009ACC 10 27 02         [ 1] 1223 	ld acc24,a 
      009ACF 20 1A 0D         [ 2] 1224 	ldw acc16,x 
      009AD1 CD 17 AD         [ 4] 1225 	call prt_acc24
      009AD1 CD 9A            [ 1] 1226 	ld a,#SPACE 
      009AD3 6E A1 84         [ 4] 1227 	call putc 
      009AD6 27 03            [ 1] 1228 	inc (CNTR,sp)
      009AD8 CC 96            [ 1] 1229 	ld a,(CNTR,sp)
      009ADA C8 01            [ 1] 1230 	cp a,(DEPTH,sp)
      009ADB 2B D6            [ 1] 1231 	jrmi 1$
      009ADB 7B 01            [ 1] 1232 	ld a,#CR 
      009ADD A1 10 26         [ 4] 1233 	call putc  
      001B1B                       1234 	_drop VSIZE 
      009AE0 05 CD            [ 2]    1     addw sp,#VSIZE 
      009AE2 81               [ 4] 1235 	ret
                                   1236 
      009AE3 D8 20 DA 6E 74 65 6E  1237 cstk_prompt: .asciz "\ncontent of expression stack from top to bottom:\n"
             74 20 6F 66 20 65 78
             70 72 65 73 73 69 6F
             6E 20 73 74 61 63 6B
             20 66 72 6F 6D 20 74
             6F 70 20 74 6F 20 62
             6F 74 74 6F 6D 3A 0A
             00
                                   1238 
                                   1239 
                                   1240 ;--------------------------------------------
                                   1241 ; BASIC: HEX 
                                   1242 ; select hexadecimal base for integer print
                                   1243 ;---------------------------------------------
      009AE6                       1244 hex_base:
      009AE6 CD 81 FD 20      [ 1] 1245 	mov base,#16 
      009AEA D5               [ 4] 1246 	ret 
                                   1247 
                                   1248 ;--------------------------------------------
                                   1249 ; BASIC: DEC 
                                   1250 ; select decimal base for integer print
                                   1251 ;---------------------------------------------
      001B55                       1252 dec_base:
      009AEB 7B 01 27 05      [ 1] 1253 	mov base,#10
      009AEF 55               [ 4] 1254 	ret 
                                   1255 
                                   1256 ;------------------------
                                   1257 ; BASIC: FREE 
                                   1258 ; return free size in RAM 
                                   1259 ; output:
                                   1260 ;   A:x		size 
                                   1261 ;--------------------------
      001B5A                       1262 free:
      009AF0 00 03            [ 2] 1263 	pushw y 
      009AF2 00               [ 1] 1264 	clr a 
      009AF3 02 16 68         [ 2] 1265 	ldw x,#tib 
      009AF4 90 CE 00 1A      [ 2] 1266 	ldw y,txtbgn 
      009AF4 A6 84 35 80      [ 2] 1267 	cpw y,#app_space
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009AF6 25 05            [ 1] 1268 	jrult 1$
      009AF6 5B 01 81         [ 2] 1269 	subw x,#free_ram 
      009AF9 20 04            [ 2] 1270 	jra 2$ 
      001B6F                       1271 1$:	
      009AF9 52 01 CD 9A      [ 2] 1272 	subw x,txtend
      009AFD B8 4D            [ 2] 1273 2$:	popw y 
      009AFF 26               [ 4] 1274 	ret 
                                   1275 
                                   1276 ;------------------------------
                                   1277 ; BASIC: SIZE 
                                   1278 ; command that print 
                                   1279 ; program start addres and size 
                                   1280 ;------------------------------
      001B76                       1281 cmd_size:
      009B00 03 CC 9B         [ 1] 1282 	push base 
      009B03 4B 1D CA         [ 2] 1283 	ldw x,#PROG_ADDR 
      009B04 CD 09 5A         [ 4] 1284 	call puts 
      009B04 CD 97 C7         [ 2] 1285 	ldw x,txtbgn     
      009B07 6B 01 A4 30      [ 1] 1286 	mov base,#16 
      009B0B A1 30 26         [ 4] 1287 	call prt_i16
      009B0E 31 00 0A         [ 1] 1288 	pop base 
      009B0F AE 1D DC         [ 2] 1289 	ldw x,#PROG_SIZE 
      009B0F CD 9A B8         [ 4] 1290 	call puts 
      009B12 A1 84 27         [ 2] 1291 	ldw x,txtend 
      009B15 03 CC 96 C8      [ 2] 1292 	subw x,txtbgn 
      009B19 CD 17 9D         [ 4] 1293 	call prt_i16
      009B19 CD 81 FD         [ 2] 1294 	ldw x,#STR_BYTES 
      009B1C 26 06 35         [ 4] 1295 	call puts  
      009B1F 02               [ 4] 1296 	ret 
                                   1297 
                                   1298 
                                   1299 ;------------------------
                                   1300 ; BASIC: UBOUND  
                                   1301 ; return array variable size 
                                   1302 ; and set 'array_size' variable 
                                   1303 ; output:
                                   1304 ;   A:X 	array_size
                                   1305 ;--------------------------
      001BA3                       1306 ubound:
      009B20 00 0F 20         [ 4] 1307 	call free 
      009B23 0C 03            [ 1] 1308 	ld a,#CELL_SIZE 
      009B24 42               [ 4] 1309 	mul x,a 
      009B24 2C 06 35         [ 2] 1310 	ldw array_size,x
      009B27 04               [ 1] 1311 	clr a 
      009B28 00               [ 4] 1312 	ret 
                                   1313 
                                   1314 ;-----------------------------
                                   1315 ; BASIC: LET var=expr 
                                   1316 ; variable assignement 
                                   1317 ; output:
                                   1318 ;   A 		TK_NONE 
                                   1319 ;-----------------------------
      001BAE                       1320 let::
      009B29 0F 20 04         [ 4] 1321 	call next_token 
      009B2C A1 85            [ 1] 1322 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009B2C 35 01            [ 1] 1323 	jreq let_var
      009B2E 00 0F            [ 1] 1324 	cp a,#TK_ARRAY 
      009B30 27 03            [ 1] 1325 	jreq  let_array
      009B30 5F C6 00         [ 2] 1326 	jp syntax_error
      001BBC                       1327 let_array:
      009B33 0F 14 01         [ 4] 1328 	call get_array_element
      009B36 27 01            [ 2] 1329 	jra let_eval 
      001BC1                       1330 let_var:
      009B38 5C 90 F7         [ 4] 1331 	call get_addr
      001BC4                       1332 let_eval:
      009B3B 90 EF 01         [ 2] 1333 	ldw ptr16,x  ; variable address 
      009B3E 20 09 7B         [ 4] 1334 	call next_token 
      009B41 01 27            [ 1] 1335 	cp a,#TK_EQUAL
      009B43 05 55            [ 1] 1336 	jreq 1$
      009B45 00 03 00         [ 2] 1337 	jp syntax_error
      001BD1                       1338 1$:	
      009B48 02 1A 38         [ 4] 1339 	call expression    
      009B49 A1 84            [ 1] 1340 	cp a,#TK_INTGR 
      009B49 A6 84            [ 1] 1341 	jreq 2$
      009B4B CC 16 48         [ 2] 1342 	jp syntax_error
      001BDB                       1343 2$:	
      001BDB                       1344 	_xpop ; value 
      009B4B 5B 01            [ 1]    1     ld a,(y)
      009B4D 81               [ 1]    2     ldw x,y 
      009B4E EE 01            [ 2]    3     ldw x,(1,x)
      009B4E 52 02 0F 02      [ 2]    4     addw y,#CELL_SIZE 
      001BE4                       1345 3$:
      009B52 AE 9B 9E CD      [ 4] 1346 	ld [ptr16],a
      009B56 89 DA 90 89      [ 1] 1347 	inc ptr8  
      009B5A AE 17 73 72      [ 5] 1348 	ldw [ptr16],x 
      009B5E F0               [ 4] 1349 	ret 
                                   1350 
                                   1351 
                                   1352 ;--------------------------
                                   1353 ; return constant value 
                                   1354 ; from it's record address
                                   1355 ; input:
                                   1356 ;	X	*const record 
                                   1357 ; output:
                                   1358 ;   A:X   const  value
                                   1359 ;--------------------------
      001BF1                       1360 get_const_value: ; -- i 
      009B5F 01               [ 1] 1361 	ld a,(x) ; record size 
      009B60 5B 02            [ 1] 1362 	sub a,#3 ; * value 
      009B62 A6               [ 1] 1363 	push a 
      009B63 03 62            [ 1] 1364 	push #0 
      009B65 9F 6B 01         [ 2] 1365 	addw x,(1,sp)
      009B68 90               [ 1] 1366 	ld a,(x)
      009B69 CF 00            [ 2] 1367 	ldw x,(1,x)
      001BFD                       1368 	_drop 2
      009B6B 19 02            [ 2]    1     addw sp,#2 
      009B6C 81               [ 4] 1369 	ret 
                                   1370 
                                   1371 
                                   1372 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                   1373 ; list constants in EEPROM 
                                   1374 ; call when using LIST \C 
                                   1375 ;-------------------------
                           000001  1376 	COUNT=1
                           000003  1377 	YTEMP=3
                           000004  1378 	VSIZE=4 
      001C00                       1379 list_const:
      009B6C 72 C6            [ 2] 1380 	pushw y 
      001C02                       1381 	_vars 4 
      009B6E 00 19            [ 2]    1     sub sp,#4 
      009B70 72               [ 1] 1382 	clrw x 
      009B71 5C 00            [ 2] 1383 	ldw (COUNT,sp),x  
      009B73 1A 72 CE 00      [ 2] 1384 	ldw Y,#EEPROM_BASE 
      009B77 19 72 5C 00      [ 2] 1385 1$:	cpw y,free_eeprom 
      009B7B 1A 72            [ 1] 1386 	jruge 9$
      009B7D 5C 00            [ 2] 1387     ldw (YTEMP,sp),y 
      009B7F 1A               [ 1] 1388 	ldw x,y
      009B80 C7               [ 1] 1389 	incw x 
      009B81 00 0D CF         [ 4] 1390 	call puts  
      009B84 00 0E            [ 1] 1391 	ld a,#'= 
      009B86 CD 98 2D         [ 4] 1392 	call putc 
      009B89 A6 20            [ 2] 1393 	ldw x,(YTEMP,sp)
      009B8B CD 89 7D         [ 4] 1394 	call get_const_value 
      009B8E 0C 02 7B         [ 1] 1395 	ld acc24,a 
      009B91 02 11 01         [ 2] 1396 	ldw acc16,x 
      009B94 2B D6 A6         [ 4] 1397 	call prt_acc24
      009B97 0D CD            [ 2] 1398 	ldw x,(COUNT,sp)
      009B99 89               [ 1] 1399 	incw x 
      009B9A 7D 5B            [ 2] 1400 	ldw (COUNT,sp),x 
      009B9C 02 81 0A 63      [ 1] 1401 	clr acc16 
      009BA0 6F 6E            [ 2] 1402 	ldw y,(YTEMP,sp)
      009BA2 74 65            [ 1] 1403 	ld a,(y)
      009BA4 6E 74 20         [ 1] 1404 	ld acc8,a
      009BA7 6F 66 20 65      [ 2] 1405 	addw y,acc16 
      009BAB 78 70            [ 2] 1406 	jra 1$ 
      001C41                       1407 9$:	
      009BAD 72 65            [ 2] 1408 	ldw x,(COUNT,sp)
      009BAF 73 73 69         [ 4] 1409 	call prt_i16 
      009BB2 6F 6E 20         [ 2] 1410 	ldw x,#CONST_COUNT 
      009BB5 73 74 61         [ 4] 1411 	call puts 
      001C4C                       1412 	_drop VSIZE 
      009BB8 63 6B            [ 2]    1     addw sp,#VSIZE 
      009BBA 20 66            [ 2] 1413 	popw y 
      009BBC 72               [ 4] 1414 	ret 
                                   1415 
      009BBD 6F 6D 20 74 6F 70 20  1416 CONST_COUNT: .asciz " constants in EEPROM\n"
             74 6F 20 62 6F 74 74
             6F 6D 3A 0A 00 4D 0A
             00
                                   1417 
                                   1418 
                                   1419 ;--------------------------
                                   1420 ; BASIC: EEFREE 
                                   1421 ; eeprom_free 
                                   1422 ; search end of data  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1423 ; in EEPROM 
                                   1424 ; input:
                                   1425 ;    none 
                                   1426 ; output:
                                   1427 ;    A:X     address free
                                   1428 ;-------------------------
      009BD0                       1429 func_eefree:
      009BD0 35 10 00         [ 2] 1430 	ldw x,#EEPROM_BASE 
      009BD3 0B 81 00 0E      [ 1] 1431 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009BD5 A3 47 F8         [ 2] 1432     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009BD5 35 0A            [ 1] 1433 	jruge 8$ ; no free space 
      009BD7 00               [ 1] 1434 2$: ld a,(x)
      009BD8 0B 81            [ 1] 1435 	jrne 3$
      009BDA 5C               [ 1] 1436 	incw x 
      009BDA 90 89 4F AE      [ 1] 1437 	dec acc8 
      009BDE 16 68            [ 1] 1438 	jrne 2$
      009BE0 90 CE 00         [ 2] 1439 	subw x,#8 
      009BE3 1B 90            [ 2] 1440 	jra 9$  
      009BE5 A3               [ 1] 1441 3$: ld a,(x)
      009BE6 B6               [ 1] 1442 	incw x
      009BE7 00               [ 1] 1443 	tnz a  
      009BE8 25 05            [ 1] 1444 	jrne 3$
      009BEA 1D               [ 2] 1445 	decw x   
      009BEB 00 80            [ 2] 1446 	jra 1$ 
      009BED 20               [ 1] 1447 8$: clrw x ; no free space 
      009BEE 04               [ 1] 1448 9$: clr a 
      009BEF CF 00 23         [ 2] 1449 	ldw free_eeprom,x ; save in system variable 
      009BEF 72               [ 4] 1450 	ret 
                                   1451 
                           000005  1452 CONST_REC_XTRA_BYTES=5 
                                   1453 ;--------------------------
                                   1454 ; search constant name 
                                   1455 ; format of constant record  
                                   1456 ;   .byte record length 
                                   1457 ;         = strlen(name)+5 
                                   1458 ;   .asciz name (variable length)
                                   1459 ;   .int24 value (3 bytes )
                                   1460 ; a constant record use 7+ bytes
                                   1461 ; constants are saved in EEPROM  
                                   1462 ; input:
                                   1463 ;    X     *name
                                   1464 ; output:
                                   1465 ;    X     address|0
                                   1466 ; use:
                                   1467 ;   A,Y, acc16 
                                   1468 ;-------------------------
                           000001  1469 	NAMEPTR=1 ; target name pointer 
                           000003  1470 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1471 	RECLEN=5  ; record length of target
                           000005  1472 	VSIZE=5
      001C90                       1473 search_const:
      009BF0 B0 00            [ 2] 1474 	pushw y 
      001C92                       1475 	_vars VSIZE
      009BF2 1D 90            [ 2]    1     sub sp,#VSIZE 
      009BF4 85 81 00 0D      [ 1] 1476 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009BF6 CD 13 8C         [ 4] 1477 	call strlen 
      009BF6 3B 00            [ 1] 1478 	add a,#CONST_REC_XTRA_BYTES
      009BF8 0B AE            [ 1] 1479 	ld (RECLEN,sp),a    
      009BFA 9E 4A            [ 2] 1480 	ldw (NAMEPTR,sp),x
      009BFC CD 89 DA CE      [ 2] 1481 	ldw y,#EEPROM_BASE 
      009C00 00 1B            [ 2] 1482 1$:	ldw x,(NAMEPTR,sp)
      009C02 35 10            [ 2] 1483 	ldw (EEPTR,sp),y
      009C04 00 0B CD 98      [ 2] 1484 	cpw y, free_eeprom 
      009C08 1D 32            [ 1] 1485 	jruge 7$ ; no match found 
      009C0A 00 0B            [ 1] 1486 	ld a,(y)
      009C0C AE 9E            [ 1] 1487 	cp a,(RECLEN,sp)
      009C0E 5C CD            [ 1] 1488 	jrne 2$ 
      009C10 89 DA            [ 1] 1489 	incw y 
      009C12 CE 00 1D         [ 4] 1490 	call strcmp
      009C15 72 B0            [ 1] 1491 	jrne 8$ ; match found 
      001CBC                       1492 2$: ; skip this one 	
      009C17 00 1B            [ 2] 1493 	ldW Y,(EEPTR,sp)
      009C19 CD 98            [ 1] 1494 	ld a,(y)
      009C1B 1D AE 9E         [ 1] 1495 	ld acc8,a 
      009C1E 6D CD 89 DA      [ 2] 1496 	addw y,acc16 
      009C22 81 DC            [ 2] 1497 	jra 1$  
      009C23                       1498 7$: ; no match found 
      009C23 CD 9B            [ 1] 1499 	clr (EEPTR,sp)
      009C25 DA A6            [ 1] 1500 	clr (EEPTR+1,sp)
      001CCD                       1501 8$: ; match found 
      009C27 03 42            [ 2] 1502 	ldw x,(EEPTR,sp) ; record address 
      001CCF                       1503 9$:	_DROP VSIZE
      009C29 CF 00            [ 2]    1     addw sp,#VSIZE 
      009C2B 20 4F            [ 2] 1504 	 popw y 
      009C2D 81               [ 4] 1505 	 ret 
                                   1506 
                                   1507 
                                   1508 ;--------------------------------------------
                                   1509 ; BASIC: CONST name=value [, name=value]*
                                   1510 ; define constant(s) saved in EEPROM
                                   1511 ;--------------------------------------------
                           000001  1512 	CNAME=1 
                           000003  1513 	BUFPTR=3
                           000005  1514 	RECLEN=5
                           000006  1515 	UPDATE=6
                           000007  1516 	YSAVE=7
                           000008  1517 	VSIZE=8 
      009C2E                       1518 cmd_const:
      009C2E CD 97            [ 2] 1519 	pushw y 
      001CD6                       1520 	_vars VSIZE 
      009C30 C7 A1            [ 2]    1     sub sp,#VSIZE 
      009C32 85 27            [ 1] 1521 	clr (UPDATE,sp)
      009C34 0C A1 05         [ 4] 1522 	call next_token 
      009C37 27 03            [ 1] 1523 	cp a,#TK_CHAR 
      009C39 CC 96            [ 1] 1524 	jrne 0$
      009C3B C8 17 97         [ 4] 1525 	call get_char 
      009C3C A4 DF            [ 1] 1526 	and a,#0xDF 
      009C3C CD 99            [ 1] 1527 	cp a,#'U 
      009C3E A6 20            [ 1] 1528 	jrne 1$
      009C40 03 06            [ 1] 1529 	cpl (UPDATE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009C41 20 07            [ 2] 1530 	jra const_loop 
      009C41 CD 97            [ 1] 1531 0$: cp a,#TK_LABEL 
      009C43 FD 08            [ 1] 1532 	jreq cloop_1
      009C44 CC 16 48         [ 2] 1533 1$: jp syntax_error
      001CF5                       1534 const_loop: 
      009C44 CF 00            [ 1] 1535 	ld a,#TK_LABEL 
      009C46 19 CD 97         [ 4] 1536 	call expect  
      001CFA                       1537 cloop_1: 
      009C49 C7 A1            [ 2] 1538 	ldw (CNAME,sp),x ; *const_name
      009C4B 32 27 03         [ 4] 1539 	call skip_string
      009C4E CC 96            [ 2] 1540 	ldw x,(CNAME,sp)
      009C50 C8 13 8C         [ 4] 1541 	call strlen  
      009C51 AB 05            [ 1] 1542 	add a,#CONST_REC_XTRA_BYTES 
      009C51 CD 9A            [ 1] 1543 	ld (RECLEN,sp),a 
                                   1544 ; copy name in buffer  
      009C53 B8 A1            [ 2] 1545 	ldw y,(CNAME,sp) 
      009C55 84 27 03         [ 2] 1546 	ldw x,#tib  
      009C58 CC 96            [ 1] 1547 	ld a,(RECLEN,sp)
      009C5A C8               [ 1] 1548 	ld (x),a 
      009C5B 5C               [ 1] 1549 	incw x  
      009C5B 90 F6 93         [ 4] 1550 	call strcpy 
      009C5E EE 01            [ 2] 1551 	ldw (BUFPTR,sp),x 
                                   1552 ; x not updated by strcpy 
                                   1553 ; BUFPTR must be incremented 
                                   1554 ; to point after name 
      009C60 72               [ 1] 1555 	clrw x 
      009C61 A9 00            [ 1] 1556 	ld a,(RECLEN,sp)
      009C63 03 04            [ 1] 1557 	sub a,#CONST_REC_XTRA_BYTES-1
      009C64 97               [ 1] 1558 	ld xl,a  
      009C64 72 C7 00         [ 2] 1559 	addw x,(BUFPTR,sp)
      009C67 19 72            [ 2] 1560 	ldw (BUFPTR,sp),x 
      009C69 5C 00            [ 1] 1561 	ld a,#TK_EQUAL 
      009C6B 1A 72 CF         [ 4] 1562 	call expect 
      009C6E 00 19            [ 2] 1563 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      009C70 81 1A 38         [ 4] 1564 	call expression 
      009C71 A1 84            [ 1] 1565 	cp a,#TK_INTGR 
      009C71 F6 A0            [ 1] 1566 	jreq 5$ 
      009C73 03 88 4B         [ 2] 1567 	jp syntax_error 
      001D32                       1568 5$:	_xpop 
      009C76 00 72            [ 1]    1     ld a,(y)
      009C78 FB               [ 1]    2     ldw x,y 
      009C79 01 F6            [ 2]    3     ldw x,(1,x)
      009C7B EE 01 5B 02      [ 2]    4     addw y,#CELL_SIZE 
      009C7F 81 07            [ 2] 1569 	ldw (YSAVE,sp),y ; save xtack pointer 
      009C80 16 03            [ 2] 1570 	ldw y,(BUFPTR,sp)
      009C80 90 89            [ 1] 1571 	ld (y),a 
      009C82 52 04 5F         [ 2] 1572 	ldw (1,y),x 
                                   1573 ; record completed in buffer 
                                   1574 ; check if constant already exist 
                                   1575 ; if exist and \U option then update  
      009C85 1F 01 90 AE      [ 1] 1576 	clr farptr 
      009C89 40 00            [ 2] 1577 	ldw x,(CNAME,sp)
      009C8B 90 C3 00         [ 4] 1578 	call search_const 
      009C8E 24               [ 2] 1579 	tnzw x 
      009C8F 24 30            [ 1] 1580 	jreq 6$ ; new constant  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009C91 17 03            [ 1] 1581 	tnz (UPDATE,sp)
      009C93 93 5C            [ 1] 1582 	jreq 8$ 
      009C95 CD 89            [ 2] 1583 	jra 7$	
      001D56                       1584 6$:	
      009C97 DA A6 3D         [ 2] 1585 	ldw x,free_eeprom  
      001D59                       1586 7$:	
      009C9A CD 89 7D         [ 2] 1587 	ldw farptr+1,x 
      009C9D 1E 03 CD         [ 2] 1588 	ldw x,#tib 
      009CA0 9C 71            [ 1] 1589 	ld a,(RECLEN,sp)
      009CA2 C7 00 0D         [ 4] 1590 	call write_nbytes
                                   1591 ; update free_eeprom 
      009CA5 CF               [ 1] 1592 	clrw x 
      009CA6 00 0E            [ 1] 1593 	ld a,(RECLEN,sp)
      009CA8 CD               [ 1] 1594 	ld xl,a 
      009CA9 98 2D 1E 01      [ 2] 1595 	addw x,free_eeprom 
      009CAD 5C 1F 01         [ 2] 1596 	ldw free_eeprom,x
      001D6F                       1597 8$: ; check for next constant 
      009CB0 72 5F 00         [ 4] 1598 	call next_token 
      009CB3 0E 16            [ 1] 1599 	cp a,#TK_COMMA 
      009CB5 03 90            [ 1] 1600 	jrne 9$ ; no other constant 
      009CB7 F6 C7 00         [ 2] 1601 	jp const_loop 
      001D79                       1602 9$: 
      001D79                       1603 	_unget_token    
      009CBA 0F 72 B9 00 0E   [ 1]    1      mov in,in.saved  
      001D7E                       1604 10$: 
      001D7E                       1605 	_drop VSIZE 
      009CBF 20 CA            [ 2]    1     addw sp,#VSIZE 
      009CC1 90 85            [ 2] 1606 	popw y ; restore xstack pointer 
      009CC1 1E               [ 4] 1607 	ret 
                                   1608 
                                   1609 
                                   1610 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1611 ; return program size 
                                   1612 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001D83                       1613 prog_size:
      009CC2 01 CD 98         [ 2] 1614 	ldw x,txtend 
      009CC5 1D AE 9C D1      [ 2] 1615 	subw x,txtbgn 
      009CC9 CD               [ 4] 1616 	ret 
                                   1617 
                                   1618 ;----------------------------
                                   1619 ; print program information 
                                   1620 ;---------------------------
      001D8B                       1621 program_info: 
      009CCA 89 DA 5B         [ 2] 1622 	ldw x,#PROG_ADDR 
      009CCD 04 90 85         [ 4] 1623 	call puts 
      009CD0 81 20 63         [ 2] 1624 	ldw x,txtbgn 
      009CD3 6F 6E 73 74      [ 1] 1625 	mov base,#16 
      009CD7 61 6E 74         [ 4] 1626 	call prt_i16
      009CDA 73 20 69 6E      [ 1] 1627 	mov base,#10  
      009CDE 20 45 45         [ 2] 1628 	ldw x,#PROG_SIZE
      009CE1 50 52 4F         [ 4] 1629 	call puts 
      009CE4 4D 0A 00         [ 4] 1630 	call prog_size 
      009CE7 CD 17 9D         [ 4] 1631 	call prt_i16 
      009CE7 AE 40 00         [ 2] 1632 	ldw x,#STR_BYTES 
      009CEA 35 08 00         [ 4] 1633 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009CED 0F A3 47         [ 2] 1634 	ldw x,txtbgn
      009CF0 F8 24 17         [ 2] 1635 	cpw x,#app 
      009CF3 F6 26            [ 1] 1636 	jrult 2$
      009CF5 0C 5C 72         [ 2] 1637 	ldw x,#FLASH_MEM 
      009CF8 5A 00            [ 2] 1638 	jra 3$
      009CFA 0F 26 F6         [ 2] 1639 2$: ldw x,#RAM_MEM 	 
      009CFD 1D 00 08         [ 4] 1640 3$:	call puts 
      009D00 20 09            [ 1] 1641 	ld a,#CR 
      009D02 F6 5C 4D         [ 4] 1642 	call putc
      009D05 26               [ 4] 1643 	ret 
                                   1644 
      009D06 FB 5A 20 E0 5F 4F CF  1645 PROG_ADDR: .asciz "program address: "
             00 24 81 64 72 65 73
             73 3A 20 00
      009D10 2C 20 70 72 6F 67 72  1646 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009D10 90 89 52 05 72 5F 00  1647 STR_BYTES: .asciz " bytes" 
      009D17 0E CD 94 0C AB 05 6B  1648 FLASH_MEM: .asciz " in FLASH memory" 
             05 1F 01 90 AE 40 00
             1E 01 17
      009D28 03 90 C3 00 24 24 1A  1649 RAM_MEM:   .asciz " in RAM memory" 
             90 F6 11 05 26 07 90
             5C
                                   1650 
                                   1651 
                                   1652 ;----------------------------
                                   1653 ; BASIC: LIST [[start][,end]]
                                   1654 ; list program lines 
                                   1655 ; form start to end 
                                   1656 ; if empty argument list then 
                                   1657 ; list all.
                                   1658 ;----------------------------
                           000001  1659 	FIRST=1
                           000003  1660 	LAST=3 
                           000005  1661 	LN_PTR=5
                           000006  1662 	VSIZE=6 
      001E14                       1663 list:
      009D37 CD 94 17 26 11   [ 2] 1664 	btjf flags,#FRUN,0$
      009D3C A6 07            [ 1] 1665 	ld a,#ERR_CMD_ONLY
      009D3C 16 03 90         [ 2] 1666 	jp tb_error
      001E1E                       1667 0$:	 
      009D3F F6 C7 00         [ 4] 1668 	call next_token 
      009D42 0F 72            [ 1] 1669 	cp a,#TK_CHAR 
      009D44 B9 00            [ 1] 1670 	jrne 2$
      009D46 0E 20 DC         [ 4] 1671 	call get_char 
      009D49 A4 DF            [ 1] 1672 	and a,#0xDF 
      009D49 0F 03            [ 1] 1673 	cp a,#'C 
      009D4B 0F 04            [ 1] 1674 	jrne 1$
      009D4D CD 1C 00         [ 4] 1675 	call list_const
      009D4D 1E               [ 4] 1676 	ret 
      009D4E 03 5B 05         [ 2] 1677 1$: jp syntax_error 
      001E35                       1678 2$:	_unget_token 
      009D51 90 85 81 00 01   [ 1]    1      mov in,in.saved  
      009D54 CD 1D 83         [ 4] 1679 	call prog_size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009D54 90 89            [ 1] 1680 	jrugt 3$
      009D56 52               [ 4] 1681 	ret 
      001E40                       1682 3$: _vars VSIZE
      009D57 08 0F            [ 2]    1     sub sp,#VSIZE 
      009D59 06 CD 97         [ 2] 1683 	ldw x,txtbgn 
      009D5C C7 A1            [ 2] 1684 	ldw (LN_PTR,sp),x 
      009D5E 04               [ 2] 1685 	ldw x,(x) 
      009D5F 26 0D            [ 2] 1686 	ldw (FIRST,sp),x ; list from first line 
      009D61 CD 98 17         [ 2] 1687 	ldw x,#MAX_LINENO ; biggest line number 
      009D64 A4 DF            [ 2] 1688 	ldw (LAST,sp),x 
      009D66 A1 55 26         [ 4] 1689 	call arg_list
      009D69 08               [ 1] 1690 	tnz a
      009D6A 03 06            [ 1] 1691 	jreq list_loop 
      009D6C 20 07            [ 1] 1692 	cp a,#2 
      009D6E A1 03            [ 1] 1693 	jreq 4$
      009D70 27 08            [ 1] 1694 	cp a,#1 
      009D72 CC 96            [ 1] 1695 	jreq first_line 
      009D74 C8 16 48         [ 2] 1696 	jp syntax_error 
      009D75 85               [ 2] 1697 4$:	popw x 
      009D75 A6 03            [ 2] 1698 	ldw (LAST+2,sp),x 
      001E63                       1699 first_line:
      009D77 CD               [ 2] 1700 	popw x
      009D78 99 6F            [ 2] 1701 	ldw (FIRST,sp),x 
      009D7A                       1702 lines_skip:
      009D7A 1F 01 CD         [ 2] 1703 	ldw x,txtbgn
      009D7D 97 EE            [ 2] 1704 2$:	ldw (LN_PTR,sp),x 
      009D7F 1E 01 CD         [ 2] 1705 	cpw x,txtend 
      009D82 94 0C            [ 1] 1706 	jrpl list_exit 
      009D84 AB               [ 2] 1707 	ldw x,(x) ;line# 
      009D85 05 6B            [ 2] 1708 	cpw x,(FIRST,sp)
      009D87 05 16            [ 1] 1709 	jrpl list_loop 
      009D89 01 AE            [ 2] 1710 	ldw x,(LN_PTR,sp) 
      009D8B 16 68            [ 1] 1711 	ld a,(2,x)
      009D8D 7B 05 F7         [ 1] 1712 	ld acc8,a 
      009D90 5C CD 94 28      [ 1] 1713 	clr acc16 
      009D94 1F 03 5F 7B      [ 2] 1714 	addw x,acc16
      009D98 05 A0            [ 2] 1715 	jra 2$ 
                                   1716 ; print loop
      001E86                       1717 list_loop:
      009D9A 04 97            [ 2] 1718 	ldw x,(LN_PTR,sp)
      009D9C 72 FB            [ 1] 1719 	ld a,(2,x) 
      009D9E 03 1F 03         [ 4] 1720 	call prt_basic_line
      009DA1 A6 32            [ 2] 1721 	ldw x,(LN_PTR,sp)
      009DA3 CD 99            [ 1] 1722 	ld a,(2,x)
      009DA5 6F 16 07         [ 1] 1723 	ld acc8,a 
      009DA8 CD 9A B8 A1      [ 1] 1724 	clr acc16 
      009DAC 84 27 03 CC      [ 2] 1725 	addw x,acc16
      009DB0 96 C8 90         [ 2] 1726 	cpw x,txtend 
      009DB3 F6 93            [ 1] 1727 	jrpl list_exit
      009DB5 EE 01            [ 2] 1728 	ldw (LN_PTR,sp),x
      009DB7 72               [ 2] 1729 	ldw x,(x)
      009DB8 A9 00            [ 2] 1730 	cpw x,(LAST,sp)  
      009DBA 03 17            [ 1] 1731 	jrslt list_loop
      001EA8                       1732 list_exit:
      009DBC 07 16 03 90 F7   [ 1] 1733 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009DC1 90 EF 01         [ 2] 1734 	ldw x,#pad 
      009DC4 72 5F 00         [ 2] 1735 	ldw basicptr,x 
      001EB3                       1736 	_drop VSIZE 
      009DC7 18 1E            [ 2]    1     addw sp,#VSIZE 
      009DC9 01 CD 9D         [ 4] 1737 	call program_info 
      009DCC 10               [ 4] 1738 	ret
                                   1739 
                                   1740 
                                   1741 ;--------------------------
                                   1742 ; BASIC: EDIT 
                                   1743 ;  copy program in FLASH 
                                   1744 ;  to RAM for edition 
                                   1745 ;-------------------------
      001EB9                       1746 edit:
      009DCD 5D 27 06         [ 4] 1747 	call qsign 
      009DD0 0D 06            [ 1] 1748 	jreq 1$ 
      009DD2 27 1B 20         [ 2] 1749 	ldw x,#NOT_SAVED 
      009DD5 03 09 5A         [ 4] 1750 	call puts 
      009DD6 81               [ 4] 1751 	ret 
      001EC5                       1752 1$: 
      009DD6 CE 00 24 80      [ 2] 1753 	ldw y,#app_sign ; source address 
      009DD9 CE 35 82         [ 2] 1754     ldw x,app_size  
      009DD9 CF 00 19         [ 2] 1755 	addw x,#4 
      009DDC AE 16 68         [ 2] 1756 	ldw acc16,x  ; bytes to copy 
      009DDF 7B 05 CD         [ 2] 1757 	ldw x,#rsign ; destination address 
      009DE2 88 BE 5F         [ 4] 1758 	call move  
      009DE5 7B 05 97         [ 2] 1759 	ldw x,#free_ram 
      009DE8 72 BB 00         [ 2] 1760 	ldw txtbgn,x 
      009DEB 24 CF 00 24      [ 2] 1761 	addw x,rsize  
      009DEF CF 00 1C         [ 2] 1762 	ldw txtend,x 
      009DEF CD               [ 4] 1763 	ret 
                                   1764 
      009DF0 97 C7 A1 08 26 03 CC  1765 NOT_SAVED: .asciz "No application saved.\n"
             9D 75 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1766 
                                   1767 
                                   1768 ;--------------------------
                                   1769 ; decompile line from token list
                                   1770 ; and print it. 
                                   1771 ; input:
                                   1772 ;   A       stop at this position 
                                   1773 ;   X 		pointer at line
                                   1774 ; output:
                                   1775 ;   none 
                                   1776 ;--------------------------	
      009DF9                       1777 prt_basic_line:
      009DF9 55 00            [ 2] 1778 	pushw y 
      009DFB 03 00 02         [ 1] 1779 	ld count,a 
      009DFE E6 02            [ 1] 1780 	ld a,(2,x)
      009DFE 5B 08 90         [ 1] 1781 	cp a,count 
      009E01 85 81            [ 1] 1782 	jrpl 1$ 
      009E03 C7 00 03         [ 1] 1783 	ld count,a 
      009E03 CE 00 1D         [ 2] 1784 1$:	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009E06 72 B0 00 1B      [ 2] 1785 	ldw y,#tib  
      009E0A 81 11 B0         [ 4] 1786 	call decompile 
      009E0B CD 09 5A         [ 4] 1787 	call puts 
      009E0B AE 9E            [ 1] 1788 	ld a,#CR 
      009E0D 4A CD 89         [ 4] 1789 	call putc 
      009E10 DA CE            [ 2] 1790 	popw y 
      009E12 00               [ 4] 1791 	ret 
                                   1792 
                                   1793 
                                   1794 
                                   1795 ;---------------------------------
                                   1796 ; BASIC: PRINT|? arg_list 
                                   1797 ; print values from argument list
                                   1798 ;----------------------------------
                           000001  1799 	CCOMMA=1
                           000001  1800 	VSIZE=1
      001F21                       1801 print:
      001F21                       1802 	_vars VSIZE 
      009E13 1B 35            [ 2]    1     sub sp,#VSIZE 
      001F23                       1803 reset_comma:
      009E15 10 00            [ 1] 1804 	clr (CCOMMA,sp)
      001F25                       1805 prt_loop:
      009E17 0B CD 98         [ 4] 1806 	call next_token
      009E1A 1D 35            [ 1] 1807 	cp a,#CMD_END 
      009E1C 0A 00            [ 1] 1808 	jrult print_exit ; colon or end of line 
      009E1E 0B AE            [ 1] 1809 	cp a,#TK_QSTR
      009E20 9E 5C            [ 1] 1810 	jreq 1$
      009E22 CD 89            [ 1] 1811 	cp a,#TK_CHAR 
      009E24 DA CD            [ 1] 1812 	jreq 2$ 
      009E26 9E 03            [ 1] 1813 	cp a,#TK_CFUNC 
      009E28 CD 98            [ 1] 1814 	jreq 3$
      009E2A 1D AE            [ 1] 1815 	cp a,#TK_COMMA 
      009E2C 9E 6D            [ 1] 1816 	jreq 4$
      009E2E CD 89            [ 1] 1817 	cp a,#TK_SHARP 
      009E30 DA CE            [ 1] 1818 	jreq 5$
      009E32 00 1B            [ 2] 1819 	jra 7$ 
      001F42                       1820 1$:	; print string 
      009E34 A3 B6 04         [ 4] 1821 	call puts
      009E37 25               [ 1] 1822 	incw x
      009E38 05 AE 9E 74      [ 2] 1823 	subw x,basicptr 
      009E3C 20 03 AE         [ 2] 1824 	ldw in.w,x  
      009E3F 9E 85            [ 2] 1825 	jra reset_comma
      001F4F                       1826 2$:	; print character 
      009E41 CD 89 DA         [ 4] 1827 	call get_char 
      009E44 A6 0D CD         [ 4] 1828 	call putc 
      009E47 89 7D            [ 2] 1829 	jra reset_comma 
      001F57                       1830 3$: ; print character function value  	
      009E49 81 70 72         [ 4] 1831 	call get_code_addr 
      009E4C 6F               [ 4] 1832 	call (x)
      009E4D 67 72 61         [ 4] 1833 	call putc
      009E50 6D 20            [ 2] 1834 	jra reset_comma 
      001F60                       1835 4$: ; set comma state 
      009E52 61 64            [ 1] 1836 	cpl (CCOMMA,sp)
      009E54 64 72            [ 2] 1837 	jra prt_loop   
      001F64                       1838 5$: ; # character must be followed by an integer   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009E56 65 73 73         [ 4] 1839 	call next_token
      009E59 3A 20            [ 1] 1840 	cp a,#TK_INTGR 
      009E5B 00 2C            [ 1] 1841 	jreq 6$
      009E5D 20 70 72         [ 2] 1842 	jp syntax_error 
      001F6E                       1843 6$: ; set tab width
      009E60 6F 67 72         [ 4] 1844 	call get_int24 
      009E63 61               [ 1] 1845 	ld a,xl 
      009E64 6D 20            [ 1] 1846 	and a,#15 
      009E66 73 69 7A         [ 1] 1847 	ld tab_width,a 
      009E69 65 3A            [ 2] 1848 	jra reset_comma 
      001F79                       1849 7$:	
      001F79                       1850 	_unget_token 
      009E6B 20 00 20 62 79   [ 1]    1      mov in,in.saved  
      009E70 74 65 73         [ 4] 1851 	call expression  
      009E73 00 20            [ 1] 1852 	cp a,#TK_INTGR 
      009E75 69 6E            [ 1] 1853 	jrne print_exit 
      009E77 20 46 4C         [ 4] 1854     call print_top
      009E7A 41 53            [ 2] 1855 	jra reset_comma 
      001F8A                       1856 print_exit:
      009E7C 48 20            [ 1] 1857 	tnz (CCOMMA,sp)
      009E7E 6D 65            [ 1] 1858 	jrne 9$
      009E80 6D 6F            [ 1] 1859 	ld a,#CR 
      009E82 72 79 00         [ 4] 1860     call putc 
      001F93                       1861 9$:	_drop VSIZE 
      009E85 20 69            [ 2]    1     addw sp,#VSIZE 
      009E87 6E               [ 4] 1862 	ret 
                                   1863 
                                   1864 ;----------------------
                                   1865 ; 'save_context' and
                                   1866 ; 'rest_context' must be 
                                   1867 ; called at the same 
                                   1868 ; call stack depth 
                                   1869 ; i.e. SP must have the 
                                   1870 ; save value at  
                                   1871 ; entry point of both 
                                   1872 ; routine. 
                                   1873 ;---------------------
                           000004  1874 	CTXT_SIZE=4 ; size of saved data 
                                   1875 ;--------------------
                                   1876 ; save current BASIC
                                   1877 ; interpreter context 
                                   1878 ; on stack 
                                   1879 ;--------------------
      001F96                       1880 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001F96                       1881 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001F96                       1882 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001F96                       1883 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001F96                       1884 save_context:
      009E88 20 52 41         [ 2] 1885 	ldw x,basicptr 
      009E8B 4D 20            [ 2] 1886 	ldw (BPTR,sp),x
      009E8D 6D 65 6D         [ 1] 1887 	ld a,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009E90 6F 72            [ 1] 1888 	ld (IN,sp),a
      009E92 79 00 03         [ 1] 1889 	ld a,count 
      009E94 6B 06            [ 1] 1890 	ld (CNT,sp),a  
      009E94 72               [ 4] 1891 	ret
                                   1892 
                                   1893 ;-----------------------
                                   1894 ; restore previously saved 
                                   1895 ; BASIC interpreter context 
                                   1896 ; from stack 
                                   1897 ;-------------------------
      001FA6                       1898 rest_context:
      009E95 01 00            [ 2] 1899 	ldw x,(BPTR,sp)
      009E97 22 05 A6         [ 2] 1900 	ldw basicptr,x 
      009E9A 07 CC            [ 1] 1901 	ld a,(IN,sp)
      009E9C 96 CA 01         [ 1] 1902 	ld in,a
      009E9E 7B 06            [ 1] 1903 	ld a,(CNT,sp)
      009E9E CD 97 C7         [ 1] 1904 	ld count,a  
      009EA1 A1               [ 4] 1905 	ret
                                   1906 
                                   1907 
                                   1908 
                                   1909 ;------------------------------------------
                                   1910 ; BASIC: INPUT [string]var[,[string]var]
                                   1911 ; input value in variables 
                                   1912 ; [string] optionally can be used as prompt 
                                   1913 ;-----------------------------------------
                           000001  1914 	CX_BPTR=1
                           000003  1915 	CX_IN=3
                           000004  1916 	CX_CNT=4
                           000005  1917 	SKIP=5
                           000005  1918 	VSIZE=5
      001FB6                       1919 input_var:
      009EA2 04 26            [ 2] 1920 	pushw y 
      001FB8                       1921 	_vars VSIZE 
      009EA4 10 CD            [ 2]    1     sub sp,#VSIZE 
      001FBA                       1922 input_loop:
      009EA6 98 17            [ 1] 1923 	clr (SKIP,sp)
      009EA8 A4 DF A1         [ 4] 1924 	call next_token 
      009EAB 43 26            [ 1] 1925 	cp a,#TK_QSTR 
      009EAD 04 CD            [ 1] 1926 	jrne 1$ 
      009EAF 9C 80 81         [ 4] 1927 	call puts 
      009EB2 CC               [ 1] 1928 	incw x 
      009EB3 96 C8 55 00      [ 2] 1929 	subw x,basicptr 
      009EB7 03 00 02         [ 2] 1930 	ldw in.w,x 
      009EBA CD 9E            [ 1] 1931 	cpl (SKIP,sp)
      009EBC 03 22 01         [ 4] 1932 	call next_token 
      009EBF 81 52            [ 1] 1933 1$: cp a,#TK_VAR  
      009EC1 06 CE            [ 1] 1934 	jreq 2$ 
      009EC3 00 1B 1F         [ 2] 1935 	jp syntax_error
      009EC6 05 FE 1F         [ 4] 1936 2$:	call get_addr
      009EC9 01 AE 7F         [ 2] 1937 	ldw ptr16,x 
      009ECC FF 1F            [ 1] 1938 	tnz (SKIP,sp)
      009ECE 03 CD            [ 1] 1939 	jrne 21$ 
      009ED0 99 81 4D         [ 4] 1940 	call var_name 
      009ED3 27 31 A1         [ 4] 1941 	call putc   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      001FEA                       1942 21$:
      009ED6 02 27            [ 1] 1943 	ld a,#':
      009ED8 07 A1 01         [ 4] 1944 	call putc 
      009EDB 27 06 CC         [ 4] 1945 	call save_context 
      009EDE 96 C8 85 1F      [ 1] 1946 	clr count  
      009EE2 05 0A 5F         [ 4] 1947 	call readln 
      009EE3 AE 16 68         [ 2] 1948 	ldw x,#tib 
      009EE3 85 1F 01         [ 1] 1949 	push count
      009EE6 4B 00            [ 1] 1950 	push #0 
      009EE6 CE 00 1B         [ 2] 1951 	addw x,(1,sp)
      009EE9 1F               [ 1] 1952 	incw x 
      002005                       1953 	_drop 2 
      009EEA 05 C3            [ 2]    1     addw sp,#2 
      009EEC 00 1D 2A 38      [ 1] 1954 	clr in 
      009EF0 FE 13 01         [ 4] 1955 	call get_token
      009EF3 2A 11            [ 1] 1956 	cp a,#TK_INTGR
      009EF5 1E 05            [ 1] 1957 	jreq 3$ 
      009EF7 E6 02            [ 1] 1958 	cp a,#TK_MINUS
      009EF9 C7 00 0F         [ 4] 1959 	call get_token 
      009EFC 72 5F            [ 1] 1960 	cp a,#TK_INTGR 
      009EFE 00 0E            [ 1] 1961 	jreq 22$
      009F00 72 BB 00         [ 4] 1962 	call rest_context 
      009F03 0E 20 E3         [ 2] 1963 	jp syntax_error
      009F06                       1964 22$:
      009F06 1E 05 E6         [ 4] 1965 	call neg_acc24	
      002024                       1966 3$: 
      009F09 02 CD 9F         [ 1] 1967 	ld a,acc24 
      009F0C 7D 1E 05         [ 2] 1968 	ldw x,acc16 
      009F0F E6 02 C7 00      [ 4] 1969 	ld [ptr16],a
      009F13 0F 72 5F 00      [ 1] 1970 	inc ptr8  
      009F17 0E 72 BB 00      [ 5] 1971 	ldw [ptr16],x 
      009F1B 0E C3 00         [ 4] 1972 	call rest_context
      009F1E 1D 2A 07         [ 4] 1973 	call next_token 
      009F21 1F 05            [ 1] 1974 	cp a,#TK_COMMA
      009F23 FE 13            [ 1] 1975 	jrne 4$ 
      009F25 03 2F DE         [ 2] 1976 	jp input_loop
      009F28                       1977 4$:
      009F28 55 00            [ 1] 1978 	cp a,#TK_NONE 
      009F2A 04 00            [ 1] 1979 	jreq input_exit  
      009F2C 02 AE            [ 1] 1980 	cp a,#TK_COLON 
      009F2E 16 B8            [ 1] 1981     jreq input_exit 
      009F30 CF 00 05         [ 2] 1982 	jp syntax_error 
      00204E                       1983 input_exit:
      00204E                       1984 	_drop VSIZE 
      009F33 5B 06            [ 2]    1     addw sp,#VSIZE 
      009F35 CD 9E            [ 2] 1985 	popw y 
      009F37 0B               [ 4] 1986 	ret 
                                   1987 
                                   1988 
                                   1989 ;---------------------
                                   1990 ; BASIC: REM | ' 
                                   1991 ; skip comment to end of line 
                                   1992 ;---------------------- 
      002053                       1993 remark::
      009F38 81 00 03 00 01   [ 1] 1994 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009F39 81               [ 4] 1995  	ret 
                                   1996 
                                   1997 
                                   1998 ;---------------------
                                   1999 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2000 ; read in loop 'addr'  
                                   2001 ; apply & 'mask' to value 
                                   2002 ; loop while result==0.  
                                   2003 ; 'xor_mask' is used to 
                                   2004 ; invert the wait logic.
                                   2005 ; i.e. loop while not 0.
                                   2006 ;---------------------
                           000001  2007 	XMASK=1 
                           000002  2008 	MASK=2
                           000003  2009 	ADDR=3
                           000004  2010 	VSIZE=4
      002059                       2011 wait: 
      002059                       2012 	_vars VSIZE
      009F39 CD A7            [ 2]    1     sub sp,#VSIZE 
      009F3B 45 27            [ 1] 2013 	clr (XMASK,sp) 
      009F3D 07 AE 9F         [ 4] 2014 	call arg_list 
      009F40 66 CD            [ 1] 2015 	cp a,#2
      009F42 89 DA            [ 1] 2016 	jruge 0$
      009F44 81 16 48         [ 2] 2017 	jp syntax_error 
      009F45 A1 03            [ 1] 2018 0$:	cp a,#3
      009F45 90 AE            [ 1] 2019 	jrult 1$
      00206B                       2020 	_xpop  ; xor mask 
      009F47 B6 00            [ 1]    1     ld a,(y)
      009F49 CE               [ 1]    2     ldw x,y 
      009F4A B6 02            [ 2]    3     ldw x,(1,x)
      009F4C 1C 00 04 CF      [ 2]    4     addw y,#CELL_SIZE 
      009F50 00               [ 1] 2021 	ld a,xl 
      009F51 0E AE            [ 1] 2022 	ld (XMASK,sp),a 
      002077                       2023 1$: _xpop ; mask
      009F53 00 7C            [ 1]    1     ld a,(y)
      009F55 CD               [ 1]    2     ldw x,y 
      009F56 94 38            [ 2]    3     ldw x,(1,x)
      009F58 AE 00 80 CF      [ 2]    4     addw y,#CELL_SIZE 
      009F5C 00               [ 1] 2024     ld a,xl  
      009F5D 1B 72            [ 1] 2025 	ld (MASK,sp),a 
      002083                       2026 	_xpop ; address 
      009F5F BB 00            [ 1]    1     ld a,(y)
      009F61 7E               [ 1]    2     ldw x,y 
      009F62 CF 00            [ 2]    3     ldw x,(1,x)
      009F64 1D 81 4E 6F      [ 2]    4     addw y,#CELL_SIZE 
      009F68 20               [ 1] 2027 2$:	ld a,(x)
      009F69 61 70            [ 1] 2028 	and a,(MASK,sp)
      009F6B 70 6C            [ 1] 2029 	xor a,(XMASK,sp)
      009F6D 69 63            [ 1] 2030 	jreq 2$ 
      002093                       2031 	_drop VSIZE 
      009F6F 61 74            [ 2]    1     addw sp,#VSIZE 
      009F71 69               [ 4] 2032 	ret 
                                   2033 
                                   2034 ;---------------------
                                   2035 ; BASIC: BSET addr,mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   2036 ; set bits at 'addr' corresponding 
                                   2037 ; to those of 'mask' that are at 1.
                                   2038 ; arguments:
                                   2039 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2040 ;   mask        mask|addr
                                   2041 ; output:
                                   2042 ;	none 
                                   2043 ;--------------------------
      002096                       2044 bit_set:
      009F72 6F 6E 20         [ 4] 2045 	call arg_list 
      009F75 73 61            [ 1] 2046 	cp a,#2	 
      009F77 76 65            [ 1] 2047 	jreq 1$ 
      009F79 64 2E 0A         [ 2] 2048 	jp syntax_error
      0020A0                       2049 1$: 
      0020A0                       2050 	_xpop ; mask 
      009F7C 00 F6            [ 1]    1     ld a,(y)
      009F7D 93               [ 1]    2     ldw x,y 
      009F7D 90 89            [ 2]    3     ldw x,(1,x)
      009F7F C7 00 04 E6      [ 2]    4     addw y,#CELL_SIZE 
      009F83 02               [ 1] 2051 	ld a,xl
      009F84 C1               [ 1] 2052 	push a  
      0020AB                       2053 	_xpop ; addr  
      009F85 00 04            [ 1]    1     ld a,(y)
      009F87 2A               [ 1]    2     ldw x,y 
      009F88 03 C7            [ 2]    3     ldw x,(1,x)
      009F8A 00 04 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009F8E 05               [ 1] 2054 	pop a 
      009F8F 90               [ 1] 2055 	or a,(x)
      009F90 AE               [ 1] 2056 	ld (x),a
      009F91 16               [ 4] 2057 	ret 
                                   2058 
                                   2059 ;---------------------
                                   2060 ; BASIC: BRES addr,mask
                                   2061 ; reset bits at 'addr' corresponding 
                                   2062 ; to those of 'mask' that are at 1.
                                   2063 ; arguments:
                                   2064 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2065 ;   mask	    ~mask&*addr  
                                   2066 ; output:
                                   2067 ;	none 
                                   2068 ;--------------------------
      0020B8                       2069 bit_reset:
      009F92 68 CD 92         [ 4] 2070 	call arg_list 
      009F95 30 CD            [ 1] 2071 	cp a,#2  
      009F97 89 DA            [ 1] 2072 	jreq 1$ 
      009F99 A6 0D CD         [ 2] 2073 	jp syntax_error
      0020C2                       2074 1$: 
      0020C2                       2075 	_xpop ; mask 
      009F9C 89 7D            [ 1]    1     ld a,(y)
      009F9E 90               [ 1]    2     ldw x,y 
      009F9F 85 81            [ 2]    3     ldw x,(1,x)
      009FA1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FA1 52               [ 1] 2076 	ld a,xl 
      009FA2 01               [ 1] 2077 	cpl a
      009FA3 88               [ 1] 2078 	push a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      0020CE                       2079 	_xpop ; addr  
      009FA3 0F 01            [ 1]    1     ld a,(y)
      009FA5 93               [ 1]    2     ldw x,y 
      009FA5 CD 97            [ 2]    3     ldw x,(1,x)
      009FA7 C7 A1 02 25      [ 2]    4     addw y,#CELL_SIZE 
      009FAB 5E               [ 1] 2080 	pop a 
      009FAC A1               [ 1] 2081 	and a,(x)
      009FAD 02               [ 1] 2082 	ld (x),a 
      009FAE 27               [ 4] 2083 	ret 
                                   2084 
                                   2085 ;---------------------
                                   2086 ; BASIC: BTOGL addr,mask
                                   2087 ; toggle bits at 'addr' corresponding 
                                   2088 ; to those of 'mask' that are at 1.
                                   2089 ; arguments:
                                   2090 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2091 ;   mask	    mask^*addr  
                                   2092 ; output:
                                   2093 ;	none 
                                   2094 ;--------------------------
      0020DB                       2095 bit_toggle:
      009FAF 12 A1 04         [ 4] 2096 	call arg_list 
      009FB2 27 1B            [ 1] 2097 	cp a,#2 
      009FB4 A1 82            [ 1] 2098 	jreq 1$ 
      009FB6 27 1F A1         [ 2] 2099 	jp syntax_error
      0020E5                       2100 1$: _xpop ; mask 
      009FB9 08 27            [ 1]    1     ld a,(y)
      009FBB 24               [ 1]    2     ldw x,y 
      009FBC A1 09            [ 2]    3     ldw x,(1,x)
      009FBE 27 24 20 37      [ 2]    4     addw y,#CELL_SIZE 
      009FC2 9F               [ 1] 2101 	ld a,xl
      009FC2 CD               [ 1] 2102 	push a 
      0020F0                       2103 	_xpop  ; addr  
      009FC3 89 DA            [ 1]    1     ld a,(y)
      009FC5 5C               [ 1]    2     ldw x,y 
      009FC6 72 B0            [ 2]    3     ldw x,(1,x)
      009FC8 00 05 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009FCC 01               [ 1] 2104 	pop a 
      009FCD 20               [ 1] 2105 	xor a,(x)
      009FCE D4               [ 1] 2106 	ld (x),a 
      009FCF 81               [ 4] 2107 	ret 
                                   2108 
                                   2109 
                                   2110 ;---------------------
                                   2111 ; BASIC: BTEST(addr,bit)
                                   2112 ; return bit value at 'addr' 
                                   2113 ; bit is in range {0..7}.
                                   2114 ; arguments:
                                   2115 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2116 ;   bit 	    bit position {0..7}  
                                   2117 ; output:
                                   2118 ;	A:X       bit value  
                                   2119 ;--------------------------
      0020FD                       2120 bit_test:
      009FCF CD 98 17         [ 4] 2121 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009FD2 CD 89            [ 1] 2122 	cp a,#2
      009FD4 7D 20            [ 1] 2123 	jreq 0$
      009FD6 CC 16 48         [ 2] 2124 	jp syntax_error
      009FD7                       2125 0$:	
      002107                       2126 	_xpop 
      009FD7 CD 97            [ 1]    1     ld a,(y)
      009FD9 E1               [ 1]    2     ldw x,y 
      009FDA FD CD            [ 2]    3     ldw x,(1,x)
      009FDC 89 7D 20 C3      [ 2]    4     addw y,#CELL_SIZE 
      009FE0 9F               [ 1] 2127 	ld a,xl 
      009FE0 03 01            [ 1] 2128 	and a,#7
      009FE2 20               [ 1] 2129 	push a   
      009FE3 C1 01            [ 1] 2130 	ld a,#1 
      009FE4 0D 01            [ 1] 2131 1$: tnz (1,sp)
      009FE4 CD 97            [ 1] 2132 	jreq 2$
      009FE6 C7               [ 1] 2133 	sll a 
      009FE7 A1 84            [ 1] 2134 	dec (1,sp)
      009FE9 27 03            [ 2] 2135 	jra 1$
      009FEB CC 96            [ 1] 2136 2$: ld (1,sp),a  
      002121                       2137 	_xpop ; address  
      009FED C8 F6            [ 1]    1     ld a,(y)
      009FEE 93               [ 1]    2     ldw x,y 
      009FEE CD 98            [ 2]    3     ldw x,(1,x)
      009FF0 07 9F A4 0F      [ 2]    4     addw y,#CELL_SIZE 
      009FF4 C7               [ 1] 2138 	pop a 
      009FF5 00               [ 1] 2139 	and a,(x)
      009FF6 23 20            [ 1] 2140 	jreq 3$
      009FF8 AA 01            [ 1] 2141 	ld a,#1 
      009FF9 5F               [ 1] 2142 3$:	clrw x 
      009FF9 55               [ 1] 2143 	ld xl,a
      009FFA 00               [ 1] 2144 	clr a  
      009FFB 03               [ 4] 2145 	ret
                                   2146 
                                   2147 ;--------------------
                                   2148 ; BASIC: POKE addr,byte
                                   2149 ; put a byte at addr 
                                   2150 ;--------------------
      002134                       2151 poke:
      009FFC 00 02 CD         [ 4] 2152 	call arg_list 
      009FFF 9A B8            [ 1] 2153 	cp a,#2
      00A001 A1 84            [ 1] 2154 	jreq 1$
      00A003 26 05 CD         [ 2] 2155 	jp syntax_error
      00213E                       2156 1$:	
      00213E                       2157 	_xpop ; byte   
      00A006 98 3B            [ 1]    1     ld a,(y)
      00A008 20               [ 1]    2     ldw x,y 
      00A009 99 01            [ 2]    3     ldw x,(1,x)
      00A00A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A00A 0D               [ 1] 2158     ld a,xl 
      00A00B 01               [ 1] 2159 	push a 
      002149                       2160 	_xpop ; address 
      00A00C 26 05            [ 1]    1     ld a,(y)
      00A00E A6               [ 1]    2     ldw x,y 
      00A00F 0D CD            [ 2]    3     ldw x,(1,x)
      00A011 89 7D 5B 01      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00A015 81               [ 1] 2161 	pop a 
      00A016 F7               [ 1] 2162 	ld (x),a 
      00A016 CE               [ 4] 2163 	ret 
                                   2164 
                                   2165 ;-----------------------
                                   2166 ; BASIC: PEEK(addr)
                                   2167 ; get the byte at addr 
                                   2168 ; input:
                                   2169 ;	none 
                                   2170 ; output:
                                   2171 ;	X 		value 
                                   2172 ;-----------------------
      002155                       2173 peek:
      00A017 00 05 1F         [ 4] 2174 	call func_args
      00A01A 03 C6            [ 1] 2175 	cp a,#1 
      00A01C 00 02            [ 1] 2176 	jreq 1$
      00A01E 6B 05 C6         [ 2] 2177 	jp syntax_error
      00215F                       2178 1$: _xpop ; address  
      00A021 00 04            [ 1]    1     ld a,(y)
      00A023 6B               [ 1]    2     ldw x,y 
      00A024 06 81            [ 2]    3     ldw x,(1,x)
      00A026 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A026 1E               [ 1] 2179 	ld a,(x)
      00A027 03               [ 1] 2180 	clrw x 
      00A028 CF               [ 1] 2181 	ld xl,a 
      00A029 00               [ 1] 2182 	clr a 
      00A02A 05               [ 4] 2183 	ret 
                                   2184 
                                   2185 ;---------------------------
                                   2186 ; BASIC IF expr : instructions
                                   2187 ; evaluate expr and if true 
                                   2188 ; execute instructions on same line. 
                                   2189 ;----------------------------
      00216D                       2190 if: 
      00A02B 7B 05 C7         [ 4] 2191 	call relation 
      00A02E 00 02            [ 1] 2192 	cp a,#TK_INTGR
      00A030 7B 06            [ 1] 2193 	jreq 1$ 
      00A032 C7 00 04         [ 2] 2194 	jp syntax_error
      002177                       2195 1$:	_xpop 
      00A035 81 F6            [ 1]    1     ld a,(y)
      00A036 93               [ 1]    2     ldw x,y 
      00A036 90 89            [ 2]    3     ldw x,(1,x)
      00A038 52 05 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A03A 5D               [ 2] 2196 	tnzw x 
      00A03A 0F 05            [ 1] 2197 	jrne 9$ 
                                   2198 ;skip to next line
      00A03C CD 97 C7 A1 02   [ 1] 2199 	mov in,count
      002188                       2200 	_drop 2 
      00A041 26 10            [ 2]    1     addw sp,#2 
      00A043 CD 89 DA         [ 2] 2201 	jp next_line
      00A046 5C               [ 4] 2202 9$:	ret 
                                   2203 
                                   2204 ;------------------------
                                   2205 ; BASIC: FOR var=expr 
                                   2206 ; set variable to expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   2207 ; leave variable address 
                                   2208 ; on stack and set
                                   2209 ; FLOOP bit in 'flags'
                                   2210 ;-----------------
                           000001  2211 	RETL1=1 ; return address  
                           000003  2212 	FSTEP=3  ; variable increment, int16
                           000005  2213 	LIMIT=5 ; loop limit, int24  
                           000008  2214 	CVAR=8   ; control variable 
                           00000A  2215 	INW=10   ;  in.w saved
                           00000C  2216 	BPTR=12 ; baseptr saved
                           00000C  2217 	VSIZE=12  
      00218E                       2218 for: ; { -- var_addr }
      00A047 72               [ 2] 2219 	popw x ; call return address 
      00218F                       2220 	_vars VSIZE 
      00A048 B0 00            [ 2]    1     sub sp,#VSIZE 
      00A04A 05               [ 2] 2221 	pushw x  ; RETL1 
      00A04B CF 00            [ 1] 2222 	ld a,#TK_VAR 
      00A04D 01 03 05         [ 4] 2223 	call expect
      00A050 CD 97 C7         [ 4] 2224 	call get_addr
      00A053 A1 85            [ 2] 2225 	ldw (CVAR,sp),x  ; control variable 
      00A055 27 03 CC         [ 4] 2226 	call let_eval 
      00A058 96 C8 CD 97      [ 1] 2227 	bset flags,#FLOOP 
      00A05C FD CF 00         [ 4] 2228 	call next_token 
      00A05F 19 0D            [ 1] 2229 	cp a,#TK_CMD 
      00A061 05 26            [ 1] 2230 	jreq 1$
      00A063 06 CD 92         [ 2] 2231 	jp syntax_error
      0021AD                       2232 1$:  
      00A066 05 CD 89         [ 4] 2233 	call get_code_addr
      00A069 7D 21 B8         [ 2] 2234 	cpw x,#to   
      00A06A 27 03            [ 1] 2235 	jreq to
      00A06A A6 3A CD         [ 2] 2236 	jp syntax_error 
                                   2237 
                                   2238 ;-----------------------------------
                                   2239 ; BASIC: TO expr 
                                   2240 ; second part of FOR loop initilization
                                   2241 ; leave limit on stack and set 
                                   2242 ; FTO bit in 'flags'
                                   2243 ;-----------------------------------
      0021B8                       2244 to: ; { var_addr -- var_addr limit step }
      00A06D 89 7D CD A0 16   [ 2] 2245 	btjt flags,#FLOOP,1$
      00A072 72 5F 00         [ 2] 2246 	jp syntax_error
      00A075 04 CD 8A         [ 4] 2247 1$: call expression   
      00A078 DF AE            [ 1] 2248 	cp a,#TK_INTGR 
      00A07A 16 68            [ 1] 2249 	jreq 2$ 
      00A07C 3B 00 04         [ 2] 2250 	jp syntax_error
      0021CA                       2251 2$: _xpop
      00A07F 4B 00            [ 1]    1     ld a,(y)
      00A081 72               [ 1]    2     ldw x,y 
      00A082 FB 01            [ 2]    3     ldw x,(1,x)
      00A084 5C 5B 02 72      [ 2]    4     addw y,#CELL_SIZE 
      00A088 5F 00            [ 1] 2252 	ld (LIMIT,sp),a 
      00A08A 02 CD            [ 2] 2253 	ldw (LIMIT+1,sp),x
      00A08C 8F 47 A1         [ 4] 2254 	call next_token
      00A08F 84 27            [ 1] 2255 	cp a,#TK_NONE  
      00A091 12 A1            [ 1] 2256 	jreq 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A093 11 CD            [ 1] 2257 	cp a,#TK_CMD
      00A095 8F 47            [ 1] 2258 	jrne 3$
      00A097 A1 84 27         [ 4] 2259 	call get_code_addr
      00A09A 06 CD A0         [ 2] 2260 	cpw x,#step 
      00A09D 26 CC            [ 1] 2261 	jreq step
      0021EA                       2262 3$:	
      0021EA                       2263 	_unget_token   	 
      00A09F 96 C8 02 00 01   [ 1]    1      mov in,in.saved  
      00A0A1                       2264 4$:	
      00A0A1 CD 82 51         [ 2] 2265 	ldw x,#1   ; default step  
      00A0A4 1F 03            [ 2] 2266 	ldw (FSTEP,sp),x 
      00A0A4 C6 00            [ 2] 2267 	jra store_loop_addr 
                                   2268 
                                   2269 
                                   2270 ;----------------------------------
                                   2271 ; BASIC: STEP expr 
                                   2272 ; optional third par of FOR loop
                                   2273 ; initialization. 	
                                   2274 ;------------------------------------
      0021F6                       2275 step: ; {var limit -- var limit step}
      00A0A6 0D CE 00 0E 72   [ 2] 2276 	btjt flags,#FLOOP,1$
      00A0AB C7 00 19         [ 2] 2277 	jp syntax_error
      00A0AE 72 5C 00         [ 4] 2278 1$: call expression 
      00A0B1 1A 72            [ 1] 2279 	cp a,#TK_INTGR
      00A0B3 CF 00            [ 1] 2280 	jreq 2$
      00A0B5 19 CD A0         [ 2] 2281 	jp syntax_error
      002208                       2282 2$:	
      002208                       2283 	_xpop 
      00A0B8 26 CD            [ 1]    1     ld a,(y)
      00A0BA 97               [ 1]    2     ldw x,y 
      00A0BB C7 A1            [ 2]    3     ldw x,(1,x)
      00A0BD 08 26 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A0C1 A0 3A            [ 2] 2284 	ldw (FSTEP,sp),x ; step
                                   2285 ; leave loop back entry point on cstack 
                                   2286 ; cstack is 1 call deep from interpreter
      00A0C3                       2287 store_loop_addr:
      00A0C3 A1 00 27         [ 2] 2288 	ldw x,basicptr
      00A0C6 07 A1 0A         [ 1] 2289 	ld a,in 
      00A0C9 27 03 CC         [ 1] 2290 	cp a,count 
      00A0CC 96 C8            [ 1] 2291 	jrmi 3$
      00A0CE 72 BB 00 00      [ 2] 2292 	addw x,in.w 
      00A0CE 5B 05            [ 2] 2293 	ldw (BPTR,sp),x 
      00A0D0 90 85 81         [ 2] 2294 	ldw x,#3 
      00A0D3 1F 0A            [ 2] 2295 	ldw (INW,sp),x 
      00A0D3 55               [ 4] 2296 	ret 
      00A0D4 00 04            [ 2] 2297 3$:	ldw (BPTR,sp),x 
      00A0D6 00 02 81         [ 2] 2298 	ldw x,in.w 
      00A0D9 1F 0A            [ 2] 2299 	ldw (INW,sp),x   
      00A0D9 52 04 0F 01      [ 1] 2300 	bres flags,#FLOOP 
      00A0DD CD 99 81 A1      [ 1] 2301 	inc loop_depth  
      00A0E1 02               [ 4] 2302 	ret 
                                   2303 
                                   2304 ;--------------------------------
                                   2305 ; BASIC: NEXT var 
                                   2306 ; FOR loop control 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2307 ; increment variable with step 
                                   2308 ; and compare with limit 
                                   2309 ; loop if threshold not crossed.
                                   2310 ; else stack. 
                                   2311 ; and decrement 'loop_depth' 
                                   2312 ;--------------------------------
      00223A                       2313 next: ; {var limit step retl1 -- [var limit step ] }
      00A0E2 24 03 CC 96      [ 1] 2314 	tnz loop_depth 
      00A0E6 C8 A1            [ 1] 2315 	jrne 1$ 
      00A0E8 03 25 0C         [ 2] 2316 	jp syntax_error 
      002243                       2317 1$: 
      00A0EB 90 F6            [ 1] 2318 	ld a,#TK_VAR 
      00A0ED 93 EE 01         [ 4] 2319 	call expect
      00A0F0 72 A9 00         [ 4] 2320 	call get_addr 
                                   2321 ; check for good variable after NEXT 	 
      00A0F3 03 9F            [ 2] 2322 	cpw x,(CVAR,sp)
      00A0F5 6B 01            [ 1] 2323 	jreq 2$  
      00A0F7 90 F6 93         [ 2] 2324 	jp syntax_error ; not the good one 
      002252                       2325 2$: 
      00A0FA EE 01 72         [ 2] 2326 	ldw ptr16,x 
                                   2327 	; increment variable 
      00A0FD A9               [ 1] 2328 	ld a,(x)
      00A0FE 00 03            [ 2] 2329 	ldw x,(1,x)  ; get var value 
      00A100 9F 6B 02         [ 2] 2330 	addw x,(FSTEP,sp) ; var+step 
      00A103 90 F6            [ 1] 2331 	adc a,#0  
      00A105 93 EE 01 72      [ 4] 2332 	ld [ptr16],a
      00A109 A9 00 03 F6      [ 1] 2333 	inc ptr8  
      00A10D 14 02 18 01      [ 5] 2334 	ldw [ptr16],x 
      00A111 27 F9 5B         [ 1] 2335 	ld acc24,a 
      00A114 04 81 0D         [ 2] 2336 	ldw acc16,x 
      00A116 7B 05            [ 1] 2337 	ld a,(LIMIT,sp)
      00A116 CD 99            [ 2] 2338 	ldw x,(LIMIT+1,sp)
      00A118 81 A1 02 27      [ 2] 2339 	subw x,acc16 
      00A11C 03 CC 96         [ 1] 2340 	sbc a,acc24
      00A11F C8               [ 1] 2341 	push cc  
                                   2342 ; check sign of STEP  
      00A120 A6 80            [ 1] 2343 	ld a,#0x80
      00A120 90 F6            [ 1] 2344 	bcp a,(FSTEP,sp)
      00A122 93 EE            [ 1] 2345 	jrpl 4$
                                   2346 ;negative step
      00A124 01               [ 1] 2347 	pop cc 
      00A125 72 A9            [ 1] 2348 	jrslt loop_done
      00A127 00 03            [ 2] 2349 	jra loop_back 
      002286                       2350 4$: ; positive step
      00A129 9F               [ 1] 2351 	pop cc 
      00A12A 88 90            [ 1] 2352 	jrsgt loop_done
      002289                       2353 loop_back:
      00A12C F6 93            [ 2] 2354 	ldw x,(BPTR,sp)
      00A12E EE 01 72         [ 2] 2355 	ldw basicptr,x 
      00A131 A9 00 03 84 FA   [ 2] 2356 	btjf flags,#FRUN,1$ 
      00A136 F7 81            [ 1] 2357 	ld a,(2,x)
      00A138 C7 00 03         [ 1] 2358 	ld count,a
      00A138 CD 99            [ 2] 2359 1$:	ldw x,(INW,sp)
      00A13A 81 A1 02         [ 2] 2360 	ldw in.w,x 
      00A13D 27               [ 4] 2361 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00229E                       2362 loop_done:
                                   2363 	; remove loop data from stack  
      00A13E 03               [ 2] 2364 	popw x
      00229F                       2365 	_drop VSIZE 
      00A13F CC 96            [ 2]    1     addw sp,#VSIZE 
      00A141 C8 5A 00 1E      [ 1] 2366 	dec loop_depth 
      00A142 FC               [ 2] 2367 	jp (x)
                                   2368 
                                   2369 ;----------------------------
                                   2370 ; called by goto/gosub
                                   2371 ; to get target line number 
                                   2372 ; output:
                                   2373 ;    x    line address 
                                   2374 ;---------------------------
      0022A6                       2375 get_target_line:
      00A142 90 F6 93         [ 4] 2376 	call next_token  
      00A145 EE 01            [ 1] 2377 	cp a,#TK_INTGR
      00A147 72 A9            [ 1] 2378 	jreq get_target_line_addr 
      00A149 00 03            [ 1] 2379 	cp a,#TK_LABEL 
      00A14B 9F 43            [ 1] 2380 	jreq look_target_symbol 
      00A14D 88 90 F6         [ 2] 2381 	jp syntax_error
                                   2382 ; the target is a line number 
                                   2383 ; search it. 
      0022B4                       2384 get_target_line_addr:
      00A150 93 EE            [ 2] 2385 	pushw y 
      00A152 01 72 A9         [ 4] 2386 	call get_int24 ; line # 
      00A155 00               [ 1] 2387 	clr a
      00A156 03 84 F4 F7      [ 2] 2388 	ldw y,basicptr 
      00A15A 81 FE            [ 2] 2389 	ldw y,(y)
      00A15B 90 89            [ 2] 2390 	pushw y 
      00A15B CD 99            [ 2] 2391 	cpw x,(1,sp)
      0022C4                       2392 	_drop 2  
      00A15D 81 A1            [ 2]    1     addw sp,#2 
      00A15F 02 27            [ 1] 2393 	jrult 11$
      00A161 03               [ 1] 2394 	inc a 
      0022C9                       2395 11$: ; scan program for this line# 	
      00A162 CC 96 C8         [ 4] 2396 	call search_lineno  
      00A165 90               [ 2] 2397 	tnzw x ; 0| line# address 
      00A166 F6 93            [ 1] 2398 	jrne 2$ 
      00A168 EE 01            [ 1] 2399 	ld a,#ERR_NO_LINE 
      00A16A 72 A9 00         [ 2] 2400 	jp tb_error 
      00A16D 03 9F            [ 2] 2401 2$:	popw y  
      00A16F 88               [ 4] 2402 	ret 
                                   2403 
                                   2404 ; the GOTO|GOSUB target is a symbol.
      0022D7                       2405 look_target_symbol:
      00A170 90 F6            [ 2] 2406 	pushw y 
      00A172 93               [ 2] 2407 	pushw x 
      00A173 EE 01 72 A9      [ 1] 2408 	clr acc16 
      00A177 00 03 84 F8      [ 2] 2409 	ldw y,txtbgn 
      00A17B F7 81 03         [ 1] 2410 1$:	ld a,(3,y) ; first TK_ID on line 
      00A17D A1 03            [ 1] 2411 	cp a,#TK_LABEL 
      00A17D CD 99            [ 1] 2412 	jreq 3$ 
      00A17F 7C A1 02         [ 1] 2413 2$:	ld a,(2,y); line length 
      00A182 27 03 CC         [ 1] 2414 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A185 96 C8 00 0D      [ 2] 2415 	addw y,acc16 ;point to next line 
      00A187 90 C3 00 1C      [ 2] 2416 	cpw y,txtend 
      00A187 90 F6            [ 1] 2417 	jrult 1$
      00A189 93 EE            [ 1] 2418 	ld a,#ERR_BAD_VALUE
      00A18B 01 72 A9         [ 2] 2419 	jp tb_error 
      0022FE                       2420 3$: ; found a TK_LABEL 
                                   2421 	; compare with GOTO|GOSUB target 
      00A18E 00 03            [ 2] 2422 	pushw y ; line address 
      00A190 9F A4 07 88      [ 2] 2423 	addw y,#4 ; label string 
      00A194 A6 01            [ 2] 2424 	ldw x,(3,sp) ; target string 
      00A196 0D 01 27         [ 4] 2425 	call strcmp
      00A199 05 48            [ 1] 2426 	jrne 4$
      00A19B 0A 01            [ 2] 2427 	popw y 
      00A19D 20 F7            [ 2] 2428 	jra 2$ 
      00230F                       2429 4$: ; target found 
      00A19F 6B               [ 2] 2430 	popw x ;  address line target  
      002310                       2431 	_drop 2 ; target string 
      00A1A0 01 90            [ 2]    1     addw sp,#2 
      00A1A2 F6 93            [ 2] 2432 	popw y 
      00A1A4 EE               [ 4] 2433 	ret
                                   2434 
                                   2435 
                                   2436 ;--------------------------------
                                   2437 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2438 ; selective goto or gosub 
                                   2439 ;--------------------------------
      002315                       2440 cmd_on:
      00A1A5 01 72 A9 00 03   [ 2] 2441 	btjt flags,#FRUN,0$ 
      00A1AA 84 F4            [ 1] 2442 	ld a,#ERR_RUN_ONLY
      00A1AC 27 02 A6         [ 2] 2443 	jp tb_error 
      00A1AF 01 5F 97         [ 4] 2444 0$:	call expression 
      00A1B2 4F 81            [ 1] 2445 	cp a,#TK_INTGR
      00A1B4 27 03            [ 1] 2446 	jreq 1$
      00A1B4 CD 99 81         [ 2] 2447 	jp syntax_error
      002329                       2448 1$: _xpop
      00A1B7 A1 02            [ 1]    1     ld a,(y)
      00A1B9 27               [ 1]    2     ldw x,y 
      00A1BA 03 CC            [ 2]    3     ldw x,(1,x)
      00A1BC 96 C8 00 03      [ 2]    4     addw y,#CELL_SIZE 
                                   2449 ; the selector is the element indice 
                                   2450 ; in the list of arguments. {1..#elements} 
      00A1BE 9F               [ 1] 2451 	ld a,xl ; keep only bits 7..0
      00A1BE 90 F6            [ 1] 2452 	jreq 9$ ; element # begin at 1. 
      00A1C0 93               [ 1] 2453 	push a  ; selector  
      00A1C1 EE 01 72         [ 4] 2454 	call next_token
      00A1C4 A9 00            [ 1] 2455 	cp a,#TK_CMD 
      00A1C6 03 9F            [ 1] 2456 	jreq 2$ 
      00A1C8 88 90 F6         [ 2] 2457 	jp syntax_error 
      00A1CB 93 EE 01         [ 4] 2458 2$: call get_code_addr
                                   2459 ;; must be a GOTO or GOSUB 
      00A1CE 72 A9 00         [ 2] 2460 	cpw x,#goto 
      00A1D1 03 84            [ 1] 2461 	jreq 4$
      00A1D3 F7 81 BB         [ 2] 2462 	cpw x,#gosub 
      00A1D5 27 03            [ 1] 2463 	jreq 4$ 
      00A1D5 CD 99 7C         [ 2] 2464 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      002350                       2465 4$: 
      00A1D8 A1               [ 1] 2466 	pop a 
      00A1D9 01               [ 2] 2467 	pushw x ; save routine address 	
      00A1DA 27               [ 1] 2468 	push a  ; selector  
      002353                       2469 5$: ; skip elements in list until selector==0 
      00A1DB 03 CC            [ 1] 2470 	dec (1,sp)
      00A1DD 96 C8            [ 1] 2471 	jreq 6$ 
                                   2472 ; can be a line# or a label 
      00A1DF 90 F6 93         [ 4] 2473 	call next_token 
      00A1E2 EE 01            [ 1] 2474 	cp a,#TK_INTGR 
      00A1E4 72 A9            [ 1] 2475 	jreq 52$
      00A1E6 00 03            [ 1] 2476 	cp a,#TK_LABEL 
      00A1E8 F6 5F            [ 1] 2477 	jreq 54$
      00A1EA 97 4F 81         [ 2] 2478 	jp syntax_error 
      00A1ED                       2479 52$: ; got a line number 
      00A1ED CD 9A F9         [ 1] 2480 	ld a,in ; skip over int24 value 
      00A1F0 A1 84            [ 1] 2481 	add a,#CELL_SIZE ; integer size  
      00A1F2 27 03 CC         [ 1] 2482 	ld in,a 
      00A1F5 96 C8            [ 2] 2483 	jra 56$
      00A1F7 90 F6 93         [ 4] 2484 54$: call skip_string ; skip over label 	
      002372                       2485 56$: ; if another element comma present 
      00A1FA EE 01 72         [ 4] 2486 	call next_token
      00A1FD A9 00            [ 1] 2487 	cp a,#TK_COMMA 
      00A1FF 03 5D            [ 1] 2488 	jreq 5$ 
                                   2489 ; arg list exhausted, selector to big 
                                   2490 ; continue execution on next line 
      002379                       2491 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A201 26 0A            [ 2]    1     addw sp,#3 
      00A203 55 00            [ 2] 2492 	jra 9$
      00237D                       2493 6$: ;at selected position  
      00237D                       2494 	_drop 1 ; discard selector
      00A205 04 00            [ 2]    1     addw sp,#1 
                                   2495 ; here only the routine address 
                                   2496 ; of GOTO|GOSUB is on stack 
      00A207 02 5B 02         [ 4] 2497     call get_target_line
      00A20A CC 97 79         [ 2] 2498 	ldw ptr16,x 	
      00A20D 81 00 03 00 01   [ 1] 2499 	mov in,count ; move to end of line  
      00A20E 85               [ 2] 2500 	popw x ; cmd address, GOTO||GOSUB 
      00A20E 85 52 0C         [ 2] 2501 	cpw x,#goto 
      00A211 89 A6            [ 1] 2502 	jrne 7$ 
      00A213 85 CD 99         [ 2] 2503 	ldw x,ptr16 
      00A216 6F CD            [ 2] 2504 	jra jp_to_target
      002395                       2505 7$: 
      00A218 97 FD            [ 2] 2506 	jra gosub_2 ; target in ptr16 
      002397                       2507 9$: ; expr out of range skip to end of line
                                   2508     ; this will force a fall to next line  
      00A21A 1F 08 CD 9C 44   [ 1] 2509 	mov in,count
      00239C                       2510 	_drop 2
      00A21F 72 14            [ 2]    1     addw sp,#2 
      00A221 00 22 CD         [ 2] 2511 	jp next_line  
                                   2512 
                                   2513 
                                   2514 ;------------------------
                                   2515 ; BASIC: GOTO line# 
                                   2516 ; jump to line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                   2517 ; here cstack is 2 call deep from interpreter 
                                   2518 ;------------------------
      0023A1                       2519 goto:
      00A224 97 C7 A1 80 27   [ 2] 2520 	btjt flags,#FRUN,goto_1  
      00A229 03 CC            [ 1] 2521 	ld a,#ERR_RUN_ONLY
      00A22B 96 C8 4A         [ 2] 2522 	jp tb_error 
      00A22D                       2523 goto_1:
      00A22D CD 97 E1         [ 4] 2524 	call get_target_line
      0023AE                       2525 jp_to_target:
      00A230 A3 A2 38         [ 2] 2526 	ldw basicptr,x 
      00A233 27 03            [ 1] 2527 	ld a,(2,x)
      00A235 CC 96 C8         [ 1] 2528 	ld count,a 
      00A238 35 03 00 01      [ 1] 2529 	mov in,#3 
      00A238 72               [ 4] 2530 	ret 
                                   2531 
                                   2532 
                                   2533 ;--------------------
                                   2534 ; BASIC: GOSUB line#
                                   2535 ; basic subroutine call
                                   2536 ; actual line# and basicptr 
                                   2537 ; are saved on cstack
                                   2538 ; here cstack is 2 call deep from interpreter 
                                   2539 ;--------------------
                           000001  2540 	TARGET=1   ; target address 
                           000003  2541 	RET_ADDR=3 ; subroutine return address 
                           000005  2542 	RET_BPTR=5 ; basicptr return point 
                           000007  2543 	RET_INW=7  ; in.w return point 
                           000004  2544 	VSIZE=4  
      0023BB                       2545 gosub:
      00A239 04 00 22 03 CC   [ 2] 2546 	btjt flags,#FRUN,gosub_1 
      00A23E 96 C8            [ 1] 2547 	ld a,#ERR_RUN_ONLY
      00A240 CD 9A B8         [ 2] 2548 	jp tb_error 
      00A243 A1               [ 4] 2549 	ret 
      0023C6                       2550 gosub_1:
      00A244 84 27 03         [ 4] 2551 	call get_target_line 
      00A247 CC 96 C8         [ 2] 2552 	ldw ptr16,x 
      0023CC                       2553 gosub_2: 
      00A24A 90               [ 2] 2554 	popw x 
      0023CD                       2555 	_vars VSIZE  
      00A24B F6 93            [ 2]    1     sub sp,#VSIZE 
      00A24D EE               [ 2] 2556 	pushw x ; RET_ADDR 
      00A24E 01 72 A9         [ 2] 2557 	ldw x,ptr16 
      00A251 00               [ 2] 2558 	pushw x ; TARGET
                                   2559 ; save BASIC subroutine return point.   
      00A252 03 6B 05         [ 2] 2560 	ldw x,basicptr
      00A255 1F 06            [ 2] 2561 	ldw (RET_BPTR,sp),x 
      00A257 CD 97 C7         [ 2] 2562 	ldw x,in.w 
      00A25A A1 00            [ 2] 2563 	ldw (RET_INW,sp),x
      00A25C 27               [ 2] 2564 	popw x 
      00A25D 11 A1            [ 2] 2565 	jra jp_to_target
                                   2566 
                                   2567 ;------------------------
                                   2568 ; BASIC: RETURN 
                                   2569 ; exit from BASIC subroutine 
                                   2570 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                           000003  2571 	RET_BPTR=3 ; basicptr return point 
                           000005  2572 	RET_INW=5  ; in.w return point 
                           000004  2573 	VSIZE=4  
      0023E1                       2574 return:
      00A25F 80 26 08 CD 97   [ 2] 2575 	btjt flags,#FRUN,0$ 
      00A264 E1 A3            [ 1] 2576 	ld a,#ERR_RUN_ONLY
      00A266 A2 76 27         [ 2] 2577 	jp tb_error 
      0023EB                       2578 0$:	
      00A269 0C 03            [ 2] 2579 	ldw x,(RET_ADDR,sp) 
      00A26A CF 00 04         [ 2] 2580 	ldw basicptr,x
      00A26A 55 00            [ 1] 2581 	ld a,(2,x)
      00A26C 03 00 02         [ 1] 2582 	ld count,a  
      00A26F 1E 05            [ 2] 2583 	ldw x,(RET_INW,sp)
      00A26F AE 00 01         [ 2] 2584 	ldw in.w,x 
      00A272 1F               [ 2] 2585 	popw x 
      0023FB                       2586 	_drop VSIZE 
      00A273 03 20            [ 2]    1     addw sp,#VSIZE 
      00A275 1D               [ 2] 2587 	pushw x
      00A276 81               [ 4] 2588 	ret  
                                   2589 
                                   2590 ;----------------------------------
                                   2591 ; BASIC: RUN
                                   2592 ; run BASIC program in RAM
                                   2593 ;----------------------------------- 
      0023FF                       2594 run: 
      00A276 72 04 00 22 03   [ 2] 2595 	btjf flags,#FRUN,0$  
      00A27B CC               [ 1] 2596 	clr a 
      00A27C 96               [ 4] 2597 	ret
      002406                       2598 0$: 
      00A27D C8 CD 9A B8 A1   [ 2] 2599 	btjf flags,#FBREAK,1$
      00240B                       2600 	_drop 2 
      00A282 84 27            [ 2]    1     addw sp,#2 
      00A284 03 CC 96         [ 4] 2601 	call rest_context
      002410                       2602 	_drop CTXT_SIZE 
      00A287 C8 04            [ 2]    1     addw sp,#CTXT_SIZE 
      00A288 72 19 00 21      [ 1] 2603 	bres flags,#FBREAK 
      00A288 90 F6 93 EE      [ 1] 2604 	bset flags,#FRUN 
      00A28C 01 72 A9         [ 2] 2605 	jp interpreter 
      00A28F 00 03 1F         [ 2] 2606 1$:	ldw x,txtbgn
      00A292 03 00 1C         [ 2] 2607 	cpw x,txtend 
      00A293 2B 0C            [ 1] 2608 	jrmi run_it 
      00A293 CE 00 05         [ 2] 2609 	ldw x,#err_no_prog
      00A296 C6 00 02         [ 4] 2610 	call puts 
      00A299 C1 00 04 2B 0C   [ 1] 2611 	mov in,count
      00A29E 72               [ 4] 2612 	ret 
      002431                       2613 run_it:	 
      002431                       2614 	_drop 2 ; drop return address 
      00A29F BB 00            [ 2]    1     addw sp,#2 
      002433                       2615 run_it_02: 
      00A2A1 01 1F 0C         [ 4] 2616     call ubound 
      00A2A4 AE 00 03         [ 4] 2617 	call clear_vars 
                                   2618 ; clear data pointer 
      00A2A7 1F               [ 1] 2619 	clrw x 
      00A2A8 0A 81 1F         [ 2] 2620 	ldw data_ptr,x 
      00A2AB 0C CE 00 01      [ 1] 2621 	clr data_ofs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A2AF 1F 0A 72 15      [ 1] 2622 	clr data_len 
                                   2623 ; initialize BASIC pointer 
      00A2B3 00 22 72         [ 2] 2624 	ldw x,txtbgn 
      00A2B6 5C 00 1F         [ 2] 2625 	ldw basicptr,x 
      00A2B9 81 02            [ 1] 2626 	ld a,(2,x)
      00A2BA C7 00 03         [ 1] 2627 	ld count,a
      00A2BA 72 5D 00 1F      [ 1] 2628 	mov in,#3	
      00A2BE 26 03 CC 96      [ 1] 2629 	bset flags,#FRUN 
      00A2C2 C8 16 F1         [ 2] 2630 	jp interpreter 
                                   2631 
                                   2632 
                                   2633 ;----------------------
                                   2634 ; BASIC: END
                                   2635 ; end running program
                                   2636 ;---------------------- 
      00A2C3                       2637 cmd_end: 
                                   2638 ; clean stack 
      00A2C3 A6 85 CD         [ 2] 2639 	ldw x,#STACK_EMPTY
      00A2C6 99               [ 1] 2640 	ldw sp,x 
      00A2C7 6F CD 97         [ 2] 2641 	jp warm_start
                                   2642 
                                   2643 ;---------------------------
                                   2644 ; BASIC: GET var 
                                   2645 ; receive a key in variable 
                                   2646 ; don't wait 
                                   2647 ;---------------------------
      002462                       2648 cmd_get:
      00A2CA FD 13 08         [ 4] 2649 	call next_token 
      00A2CD 27 03            [ 1] 2650 	cp a,#TK_VAR 
      00A2CF CC 96            [ 1] 2651 	jreq 0$
      00A2D1 C8 16 48         [ 2] 2652 	jp syntax_error 
      00A2D2 CD 17 7D         [ 4] 2653 0$: call get_addr 
      00A2D2 CF 00 19         [ 2] 2654 	ldw ptr16,x 
      00A2D5 F6 EE 01         [ 4] 2655 	call qgetc 
      00A2D8 72 FB            [ 1] 2656 	jreq 2$
      00A2DA 03 A9 00         [ 4] 2657 	call getc  
      00A2DD 72 C7 00 19      [ 4] 2658 2$: clr [ptr16]
      00A2E1 72 5C 00 1A      [ 1] 2659 	inc ptr8 
      00A2E5 72 CF 00 19      [ 4] 2660 	clr [ptr16]
      00A2E9 C7 00 0D CF      [ 1] 2661 	inc ptr8 
      00A2ED 00 0E 7B 05      [ 4] 2662 	ld [ptr16],a 
      00A2F1 1E               [ 4] 2663 	ret 
                                   2664 
                                   2665 
                                   2666 ;-----------------
                                   2667 ; 1 Khz beep 
                                   2668 ;-----------------
      00248F                       2669 beep_1khz:: 
      00A2F2 06 72 B0         [ 2] 2670 	ldw x,#100
      00A2F5 00 0E C2 00      [ 2] 2671 	ldw y,#1000
      00A2F9 0D 8A            [ 2] 2672 	jra beep
                                   2673 
                                   2674 ;-----------------------
                                   2675 ; BASIC: TONE expr1,expr2
                                   2676 ; used TIMER2 channel 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   2677 ; to produce a tone 
                                   2678 ; arguments:
                                   2679 ;    expr1   frequency 
                                   2680 ;    expr2   duration msec.
                                   2681 ;---------------------------
      002498                       2682 tone:
      00A2FB A6 80 15         [ 4] 2683 	call arg_list 
      00A2FE 03 2A            [ 1] 2684 	cp a,#2 
      00A300 05 86            [ 1] 2685 	jreq 1$
      00A302 2F 1A 20         [ 2] 2686 	jp syntax_error 
      0024A2                       2687 1$: 
      0024A2                       2688 	_xpop 
      00A305 03 F6            [ 1]    1     ld a,(y)
      00A306 93               [ 1]    2     ldw x,y 
      00A306 86 2C            [ 2]    3     ldw x,(1,x)
      00A308 15 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A309 89               [ 2] 2689 	pushw x ; duration 
      0024AC                       2690 	_xpop ; frequency
      00A309 1E 0C            [ 1]    1     ld a,(y)
      00A30B CF               [ 1]    2     ldw x,y 
      00A30C 00 05            [ 2]    3     ldw x,(1,x)
      00A30E 72 01 00 22      [ 2]    4     addw y,#CELL_SIZE 
      00A312 05 E6            [ 1] 2691 	ldw y,x ; frequency 
      00A314 02               [ 2] 2692 	popw x  ; duration 
      0024B8                       2693 beep:  
      00A315 C7               [ 2] 2694 	pushw x 
      00A316 00 04 1E         [ 2] 2695 	ldw x,#TIM2_CLK_FREQ
      00A319 0A               [ 2] 2696 	divw x,y ; cntr=Fclk/freq 
                                   2697 ; round to nearest integer 
      00A31A CF 00 01 81      [ 2] 2698 	cpw y,#TIM2_CLK_FREQ/2
      00A31E 2B 01            [ 1] 2699 	jrmi 2$
      00A31E 85               [ 1] 2700 	incw x 
      0024C4                       2701 2$:	 
      00A31F 5B               [ 1] 2702 	ld a,xh 
      00A320 0C 72 5A         [ 1] 2703 	ld TIM2_ARRH,a 
      00A323 00               [ 1] 2704 	ld a,xl 
      00A324 1F FC 0E         [ 1] 2705 	ld TIM2_ARRL,a 
                                   2706 ; 50% duty cycle 
      00A326 8C               [ 1] 2707 	ccf 
      00A326 CD               [ 2] 2708 	rrcw x 
      00A327 97               [ 1] 2709 	ld a,xh 
      00A328 C7 A1 84         [ 1] 2710 	ld TIM2_CCR1H,a 
      00A32B 27               [ 1] 2711 	ld a,xl
      00A32C 07 A1 03         [ 1] 2712 	ld TIM2_CCR1L,a
      00A32F 27 26 CC 96      [ 1] 2713 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A333 C8 10 53 00      [ 1] 2714 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A334 72 10 53 04      [ 1] 2715 	bset TIM2_EGR,#TIM2_EGR_UG
      00A334 90               [ 2] 2716 	popw x 
      00A335 89 CD 98         [ 4] 2717 	call pause02
      00A338 07 4F 90 CE      [ 1] 2718 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A33C 00 05 90 FE      [ 1] 2719 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A340 90               [ 4] 2720 	ret 
                                   2721 
                                   2722 ;-------------------------------
                                   2723 ; BASIC: ADCON 0|1 [,divisor]  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2724 ; disable/enanble ADC 
                                   2725 ;-------------------------------
                           000003  2726 	ONOFF=3 
                           000001  2727 	DIVSOR=1
                           000004  2728 	VSIZE=4 
      0024EF                       2729 power_adc:
      00A341 89 13 01         [ 4] 2730 	call arg_list 
      00A344 5B 02            [ 1] 2731 	cp a,#2	
      00A346 25 01            [ 1] 2732 	jreq 1$
      00A348 4C 01            [ 1] 2733 	cp a,#1 
      00A349 27 03            [ 1] 2734 	jreq 0$ 
      00A349 CD 8C C2         [ 2] 2735 	jp syntax_error 
      00A34C 5D               [ 1] 2736 0$:	clr a 
      00A34D 26               [ 1] 2737 	clrw x
      0024FF                       2738 	_xpush   ; divisor  
      00A34E 05 A6 05 CC      [ 2]    1     subw y,#CELL_SIZE
      00A352 96 CA            [ 1]    2     ld (y),a 
      00A354 90 85 81         [ 2]    3     ldw (1,y),x 
      00A357                       2739 1$: _at_next 
      00A357 90 89 89         [ 1]    1     ld a,(3,y)
      00A35A 72               [ 1]    2     ldw x,y 
      00A35B 5F 00            [ 2]    3     ldw x,(4,x)
      00A35D 0E               [ 2] 2740 	tnzw x 
      00A35E 90 CE            [ 1] 2741 	jreq 2$ 
      002511                       2742 	_xpop
      00A360 00 1B            [ 1]    1     ld a,(y)
      00A362 90               [ 1]    2     ldw x,y 
      00A363 E6 03            [ 2]    3     ldw x,(1,x)
      00A365 A1 03 27 15      [ 2]    4     addw y,#CELL_SIZE 
      00251A                       2743 	_xdrop  
      00A369 90 E6 02 C7      [ 2]    1     addw y,#CELL_SIZE 
      00A36D 00               [ 1] 2744 	ld a,xl
      00A36E 0F 72            [ 1] 2745 	and a,#7
      00A370 B9               [ 1] 2746 	swap a 
      00A371 00 0E 90         [ 1] 2747 	ld ADC_CR1,a
      00A374 C3 00 1D 25      [ 1] 2748 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A378 E9 A6 0A CC      [ 1] 2749 	bset ADC_CR1,#ADC_CR1_ADON 
      00252D                       2750 	_usec_dly 7 
      00A37C 96 CA 1B         [ 2]    1     ldw x,#(16*7-2)/4
      00A37E 5A               [ 2]    2     decw x
      00A37E 90               [ 1]    3     nop 
      00A37F 89 72            [ 1]    4     jrne .-4
      00A381 A9 00            [ 2] 2751 	jra 3$
      00A383 04 1E 03 CD      [ 1] 2752 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A387 94 17 26 04      [ 1] 2753 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00253E                       2754 3$:	
      00A38B 90               [ 4] 2755 	ret
                                   2756 
                                   2757 ;-----------------------------
                                   2758 ; BASIC: ADCREAD (channel)
                                   2759 ; read adc channel {0..5}
                                   2760 ; output:
                                   2761 ;   A 		TK_INTGR 
                                   2762 ;   X 		value 
                                   2763 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00253F                       2764 analog_read:
      00A38C 85 20 DA         [ 4] 2765 	call func_args 
      00A38F A1 01            [ 1] 2766 	cp a,#1 
      00A38F 85 5B            [ 1] 2767 	jreq 1$
      00A391 02 90 85         [ 2] 2768 	jp syntax_error
      002549                       2769 1$: _xpop 
      00A394 81 F6            [ 1]    1     ld a,(y)
      00A395 93               [ 1]    2     ldw x,y 
      00A395 72 00            [ 2]    3     ldw x,(1,x)
      00A397 00 22 05 A6      [ 2]    4     addw y,#CELL_SIZE 
      00A39B 06 CC 96         [ 2] 2770 	cpw x,#5 
      00A39E CA CD            [ 2] 2771 	jrule 2$
      00A3A0 9A B8            [ 1] 2772 	ld a,#ERR_BAD_VALUE
      00A3A2 A1 84 27         [ 2] 2773 	jp tb_error 
      00A3A5 03               [ 1] 2774 2$: ld a,xl
      00A3A6 CC 96 C8         [ 1] 2775 	ld acc8,a 
      00A3A9 90 F6            [ 1] 2776 	ld a,#5
      00A3AB 93 EE 01         [ 1] 2777 	sub a,acc8 
      00A3AE 72 A9 00         [ 1] 2778 	ld ADC_CSR,a
      00A3B1 03 9F 27 62      [ 1] 2779 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A3B5 88 CD 97 C7      [ 1] 2780 	bset ADC_CR1,#ADC_CR1_ADON
      00A3B9 A1 80 27 03 CC   [ 2] 2781 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A3BE 96 C8 CD         [ 2] 2782 	ldw x,ADC_DRH
      00A3C1 97 E1            [ 1] 2783 	ld a,#TK_INTGR
      00A3C3 A3               [ 4] 2784 	ret 
                                   2785 
                                   2786 ;-----------------------
                                   2787 ; BASIC: DREAD(pin)
                                   2788 ; Arduino pins 
                                   2789 ; read state of a digital pin 
                                   2790 ; pin# {0..15}
                                   2791 ; output:
                                   2792 ;    A 		TK_INTGR
                                   2793 ;    X      0|1 
                                   2794 ;-------------------------
                           000001  2795 	PINNO=1
                           000001  2796 	VSIZE=1
      00257B                       2797 digital_read:
      00257B                       2798 	_vars VSIZE 
      00A3C4 A4 21            [ 2]    1     sub sp,#VSIZE 
      00A3C6 27 08 A3         [ 4] 2799 	call func_args
      00A3C9 A4 3B            [ 1] 2800 	cp a,#1
      00A3CB 27 03            [ 1] 2801 	jreq 1$
      00A3CD CC 96 C8         [ 2] 2802 	jp syntax_error
      00A3D0                       2803 1$: _xpop 
      00A3D0 84 89            [ 1]    1     ld a,(y)
      00A3D2 88               [ 1]    2     ldw x,y 
      00A3D3 EE 01            [ 2]    3     ldw x,(1,x)
      00A3D3 0A 01 27 26      [ 2]    4     addw y,#CELL_SIZE 
      00A3D7 CD 97 C7         [ 2] 2804 	cpw x,#15 
      00A3DA A1 84            [ 2] 2805 	jrule 2$
      00A3DC 27 07            [ 1] 2806 	ld a,#ERR_BAD_VALUE
      00A3DE A1 03 27         [ 2] 2807 	jp tb_error 
      00A3E1 0D CC 96         [ 4] 2808 2$:	call select_pin 
      00A3E4 C8 01            [ 1] 2809 	ld (PINNO,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A3E5 E6 01            [ 1] 2810 	ld a,(GPIO_IDR,x)
      00A3E5 C6 00            [ 1] 2811 	tnz (PINNO,sp)
      00A3E7 02 AB            [ 1] 2812 	jreq 8$
      00A3E9 03               [ 1] 2813 3$: srl a 
      00A3EA C7 00            [ 1] 2814 	dec (PINNO,sp)
      00A3EC 02 20            [ 1] 2815 	jrne 3$ 
      00A3EE 03 CD            [ 1] 2816 8$: and a,#1 
      00A3F0 97               [ 1] 2817 	clrw x 
      00A3F1 EE               [ 1] 2818 	ld xl,a 
      00A3F2 A6 84            [ 1] 2819 	ld a,#TK_INTGR
      0025B0                       2820 	_drop VSIZE
      00A3F2 CD 97            [ 2]    1     addw sp,#VSIZE 
      00A3F4 C7               [ 4] 2821 	ret
                                   2822 
                                   2823 
                                   2824 ;-----------------------
                                   2825 ; BASIC: DWRITE pin,0|1
                                   2826 ; Arduino pins 
                                   2827 ; write to a digital pin 
                                   2828 ; pin# {0..15}
                                   2829 ; output:
                                   2830 ;    A 		TK_INTGR
                                   2831 ;    X      0|1 
                                   2832 ;-------------------------
                           000001  2833 	PINNO=1
                           000002  2834 	PINVAL=2
                           000002  2835 	VSIZE=2
      0025B3                       2836 digital_write:
      0025B3                       2837 	_vars VSIZE 
      00A3F5 A1 08            [ 2]    1     sub sp,#VSIZE 
      00A3F7 27 DA 5B         [ 4] 2838 	call arg_list  
      00A3FA 03 20            [ 1] 2839 	cp a,#2 
      00A3FC 1A 03            [ 1] 2840 	jreq 1$
      00A3FD CC 16 48         [ 2] 2841 	jp syntax_error
      0025BF                       2842 1$: _xpop 
      00A3FD 5B 01            [ 1]    1     ld a,(y)
      00A3FF CD               [ 1]    2     ldw x,y 
      00A400 A3 26            [ 2]    3     ldw x,(1,x)
      00A402 CF 00 19 55      [ 2]    4     addw y,#CELL_SIZE 
      00A406 00               [ 1] 2843 	ld a,xl 
      00A407 04 00            [ 1] 2844 	ld (PINVAL,sp),a
      0025CB                       2845 	_xpop 
      00A409 02 85            [ 1]    1     ld a,(y)
      00A40B A3               [ 1]    2     ldw x,y 
      00A40C A4 21            [ 2]    3     ldw x,(1,x)
      00A40E 26 05 CE 00      [ 2]    4     addw y,#CELL_SIZE 
      00A412 19 20 19         [ 2] 2846 	cpw x,#15 
      00A415 23 05            [ 2] 2847 	jrule 2$
      00A415 20 35            [ 1] 2848 	ld a,#ERR_BAD_VALUE
      00A417 CC 16 4A         [ 2] 2849 	jp tb_error 
      00A417 55 00 04         [ 4] 2850 2$:	call select_pin 
      00A41A 00 02            [ 1] 2851 	ld (PINNO,sp),a 
      00A41C 5B 02            [ 1] 2852 	ld a,#1
      00A41E CC 97            [ 1] 2853 	tnz (PINNO,sp)
      00A420 79 05            [ 1] 2854 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A421 48               [ 1] 2855 3$: sll a
      00A421 72 00            [ 1] 2856 	dec (PINNO,sp)
      00A423 00 22            [ 1] 2857 	jrne 3$
      00A425 05 A6            [ 1] 2858 4$: tnz (PINVAL,sp)
      00A427 06 CC            [ 1] 2859 	jrne 5$
      00A429 96               [ 1] 2860 	cpl a 
      00A42A CA 00            [ 1] 2861 	and a,(GPIO_ODR,x)
      00A42B 20 02            [ 2] 2862 	jra 8$
      00A42B CD A3            [ 1] 2863 5$: or a,(GPIO_ODR,x)
      00A42D 26 00            [ 1] 2864 8$: ld (GPIO_ODR,x),a 
      00A42E                       2865 	_drop VSIZE 
      00A42E CF 00            [ 2]    1     addw sp,#VSIZE 
      00A430 05               [ 4] 2866 	ret
                                   2867 
                                   2868 
                                   2869 ;-----------------------
                                   2870 ; BASIC: STOP
                                   2871 ; stop progam execution  
                                   2872 ; without resetting pointers 
                                   2873 ; the program is resumed
                                   2874 ; with RUN 
                                   2875 ;-------------------------
      0025FE                       2876 stop:
      00A431 E6 02 C7 00 04   [ 2] 2877 	btjt flags,#FRUN,2$
      00A436 35               [ 1] 2878 	clr a
      00A437 03               [ 4] 2879 	ret 
      002605                       2880 2$:	 
                                   2881 ; create space on cstack to save context 
      00A438 00 02 81         [ 2] 2882 	ldw x,#break_point 
      00A43B CD 09 5A         [ 4] 2883 	call puts 
      00260B                       2884 	_drop 2 ;drop return address 
      00A43B 72 00            [ 2]    1     addw sp,#2 
      00260D                       2885 	_vars CTXT_SIZE ; context size 
      00A43D 00 22            [ 2]    1     sub sp,#CTXT_SIZE 
      00A43F 06 A6 06         [ 4] 2886 	call save_context 
      00A442 CC 96 CA         [ 2] 2887 	ldw x,#tib 
      00A445 81 00 04         [ 2] 2888 	ldw basicptr,x
      00A446 7F               [ 1] 2889 	clr (x)
      00A446 CD A3 26 CF      [ 1] 2890 	clr count  
      00A44A 00               [ 1] 2891 	clrw x 
      00A44B 19 00 00         [ 2] 2892 	ldw in.w,x
      00A44C 72 11 00 21      [ 1] 2893 	bres flags,#FRUN 
      00A44C 85 52 04 89      [ 1] 2894 	bset flags,#FBREAK
      00A450 CE 00 19         [ 2] 2895 	jp interpreter 
      00A453 89 CE 00 05 1F 05 CE  2896 break_point: .asciz "\nbreak point, RUN to resume.\n"
             00 01 1F 07 85 20 CD
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2897 
                                   2898 ;-----------------------
                                   2899 ; BASIC: NEW
                                   2900 ; from command line only 
                                   2901 ; free program memory
                                   2902 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2903 ;------------------------
      00A461                       2904 new: 
      00A461 72 00 00 22 05   [ 2] 2905 	btjf flags,#FRUN,0$ 
      00A466 A6               [ 4] 2906 	ret 
      002650                       2907 0$:	
      00A467 06 CC 96         [ 4] 2908 	call clear_basic 
      00A46A CA               [ 4] 2909 	ret 
                                   2910 
                                   2911 ;-----------------------------------
                                   2912 ; BASIC: ERASE \E | \F 
                                   2913 ; erase all block in range from 
                                   2914 ;  'app_space' to FLASH end (0x20000)
                                   2915 ;  or all EEPROM 
                                   2916 ; that contains a non zero byte.  
                                   2917 ;-----------------------------------
                           000001  2918 	LIMIT=1 
                           000003  2919 	VSIZE = 3 
      00A46B                       2920 erase:
      00A46B 1E 03 CF 00      [ 1] 2921 	clr farptr 
      002658                       2922 	_vars VSIZE 
      00A46F 05 E6            [ 2]    1     sub sp,#VSIZE 
      00A471 02 C7 00         [ 4] 2923 	call next_token 
      00A474 04 1E            [ 1] 2924 	cp a,#TK_CHAR 
      00A476 05 CF            [ 1] 2925 	jreq 0$ 
      00A478 00 01 85         [ 2] 2926 	jp syntax_error
      00A47B 5B 04 89         [ 4] 2927 0$: call get_char 
      00A47E 81 DF            [ 1] 2928 	and a,#0XDF 
      00A47F A1 45            [ 1] 2929 	cp a,#'E
      00A47F 72 01            [ 1] 2930 	jrne 1$
      00A481 00 22 02         [ 2] 2931 	ldw x,#EEPROM_BASE 
      00A484 4F 81 18         [ 2] 2932 	ldw farptr+1,x 
      00A486 AE 47 FF         [ 2] 2933 	ldw x,#EEPROM_END
      00A486 72               [ 1] 2934 	clr a 
      00A487 09 00            [ 2] 2935 	jra 3$ 
      00A489 22 12            [ 1] 2936 1$: cp a,#'F 
      00A48B 5B 02            [ 1] 2937 	jreq 2$
      00A48D CD A0 26         [ 2] 2938 	ldw x,#err_bad_value
      00A490 5B 04 72         [ 2] 2939 	jp tb_error
      002683                       2940 2$:
      00A493 19 00 22         [ 2] 2941 	ldw x,#app_sign 
      00A496 72 10 00         [ 2] 2942 	ldw farptr+1,x 
      00A499 22 CC            [ 1] 2943 	ld a,#(FLASH_END>>16)&0XFF 
      00A49B 97 71 CE         [ 2] 2944 	ldw x,#FLASH_END&0xffff
      00268E                       2945 3$:
      00A49E 00 1B            [ 1] 2946 	ld (LIMIT,sp),a 
      00A4A0 C3 00            [ 2] 2947 	ldw (LIMIT+1,sp),x 
                                   2948  ; operation done from RAM
                                   2949  ; copy code to RAM in tib   
      00A4A2 1D 2B 0C         [ 4] 2950 	call move_erase_to_ram
      002695                       2951 4$:	 
      00A4A5 AE 96 57         [ 4] 2952     call scan_block 
      00A4A8 CD 89            [ 1] 2953 	jreq 5$  ; block already erased 
      00A4AA DA 55            [ 1] 2954     ld a,#'E 
      00A4AC 00 04 00         [ 4] 2955     call putc 
      00A4AF 02 81 7E         [ 4] 2956 	call block_erase   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2957 ; this block is clean, next  
      00A4B1 AE 00 80         [ 2] 2958 5$:	ldw x,#BLOCK_SIZE
      00A4B1 5B 02 6F         [ 4] 2959 	call incr_farptr
                                   2960 ; check limit, 24 bit substraction  	
      00A4B3 7B 01            [ 1] 2961 	ld a,(LIMIT,sp)
      00A4B3 CD 9C            [ 2] 2962 	ldw x,(LIMIT+1,sp)
      00A4B5 23 CD 94 7C      [ 2] 2963 	subw x,farptr+1
      00A4B9 5F CF 00         [ 1] 2964 	sbc a,farptr 
      00A4BC 07 72            [ 1] 2965 	jrugt 4$ 
      00A4BE 5F 00 09         [ 4] 2966 9$: call clear_basic
      00A4C1 72 5F            [ 2] 2967 	ldw x,(LIMIT+1,sp)
      00A4C3 00 0A CE         [ 2] 2968 	cpw x,#EEPROM_END
      00A4C6 00 1B            [ 1] 2969 	jrne 10$
      00A4C8 CF 00 05         [ 4] 2970 	call func_eefree 
      0026C2                       2971 10$:
      0026C2                       2972 	_drop VSIZE 
      00A4CB E6 02            [ 2]    1     addw sp,#VSIZE 
      00A4CD C7               [ 4] 2973 	ret 
                                   2974 	
                                   2975 
                                   2976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2977 ;  check for application signature 
                                   2978 ; output:
                                   2979 ;   Carry    0 app present 
                                   2980 ;            1 no app installed  
                                   2981 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026C5                       2982 qsign: 
      00A4CE 00 04 35         [ 2] 2983 	ldw x,app_sign 
      00A4D1 03 00 02         [ 2] 2984 	cpw x,SIGNATURE ; "BC" 
      00A4D4 72               [ 4] 2985 	ret 
                                   2986 
                                   2987 ;--------------------------------------
                                   2988 ;  fill write buffer 
                                   2989 ;  input:
                                   2990 ;    y  point to output buffer 
                                   2991 ;    x  point to source 
                                   2992 ;    a  bytes to write in buffer 
                                   2993 ;  output:
                                   2994 ;    y   += A 
                                   2995 ;    X   += A 
                                   2996 ;    A   0 
                                   2997 ;---------------------------------------
      0026CC                       2998 fill_write_buffer:
      00A4D5 10               [ 1] 2999 	push a 
      00A4D6 00               [ 1] 3000 	tnz a 
      00A4D7 22 CC            [ 1] 3001 	jreq 9$ 
      00A4D9 97               [ 1] 3002 1$: ld a,(x)
      00A4DA 71               [ 1] 3003 	incw x 
      00A4DB 90 F7            [ 1] 3004 	ld (y),a 
      00A4DB AE 17            [ 1] 3005 	incw y 
      00A4DD FF 94            [ 1] 3006 	dec (1,sp) 
      00A4DF CC 97            [ 1] 3007 	jrne 1$ 
      00A4E1 52               [ 1] 3008 9$:	pop a 
      00A4E2 81               [ 4] 3009     ret 	
                                   3010 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   3011 ;--------------------------------------
                                   3012 ;  fill pad buffer with zero 
                                   3013 ;  input:
                                   3014 ;	none 
                                   3015 ;  output:
                                   3016 ;    y     buffer address  
                                   3017 ;--------------------------------------
      0026DC                       3018 clear_block_buffer:
      00A4E2 CD               [ 1] 3019 	push a 
      00A4E3 97 C7 A1 85      [ 2] 3020 	ldw y,#block_buffer 
      00A4E7 27 03            [ 2] 3021 	pushw y
      00A4E9 CC 96            [ 1] 3022 	ld a,#BLOCK_SIZE   
      00A4EB C8 CD            [ 1] 3023 1$:	clr (y)
      00A4ED 97 FD            [ 1] 3024 	incw y
      00A4EF CF               [ 1] 3025 	dec a  
      00A4F0 00 19            [ 1] 3026 	jrne 1$ 	
      00A4F2 CD 89            [ 2] 3027 9$: popw y 
      00A4F4 86               [ 1] 3028 	pop a 			
      00A4F5 27               [ 4] 3029 	ret 
                                   3030 
                                   3031 
                                   3032 ;---------------------------------------
                                   3033 ; BASIC: SAVE
                                   3034 ; write application from RAM to FLASH
                                   3035 ;--------------------------------------
                           000001  3036 	XTEMP=1
                           000003  3037 	COUNT=3  ; last count bytes written 
                           000004  3038 	CNT_LO=4 ; count low byte 
                           000005  3039 	TOWRITE=5 ; how bytes left to write  
                           000006  3040 	VSIZE=6 
      0026F0                       3041 save_app:
      00A4F6 03               [ 2] 3042 	pushw x 
      00A4F7 CD 89            [ 2] 3043 	pushw y 
      0026F3                       3044 	_vars VSIZE
      00A4F9 8D 72            [ 2]    1     sub sp,#VSIZE 
      00A4FB 3F 00 19         [ 4] 3045 	call qsign 
      00A4FE 72 5C            [ 1] 3046 	jrne 1$
      00A500 00 1A 72         [ 2] 3047 	ldw x,#CANT_DO 
      00A503 3F 00 19         [ 4] 3048 	call puts 
      00A506 72 5C 00         [ 2] 3049 	jp 9$
      002703                       3050 1$: 
      00A509 1A 72 C7         [ 2] 3051 	ldw x,txtbgn
      00A50C 00 19 81         [ 2] 3052 	cpw x,txtend 
      00A50F 25 09            [ 1] 3053 	jrult 2$ 
      00A50F AE 00 64         [ 2] 3054 	ldw x,#NO_APP
      00A512 90 AE 03         [ 4] 3055 	call puts 
      00A515 E8 20 20         [ 2] 3056 	jp 9$
      00A518                       3057 2$: 
                                   3058 ; block programming flash
                                   3059 ; must be done from RAM
                                   3060 ; moved in tib  
      00A518 CD 99 81         [ 4] 3061 	call move_prg_to_ram
                                   3062 ; initialize farptr 
                                   3063 ; to app_sign address 
      00A51B A1 02 27 03      [ 1] 3064 	clr farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A51F CC 96 C8         [ 2] 3065 	ldw x,#app_sign 
      00A522 CF 00 18         [ 2] 3066 	ldw farptr+1,x
                                   3067 ; initialize local variables 
      00A522 90 F6 93         [ 4] 3068 	call prog_size
      00A525 EE 01            [ 2] 3069 	ldw (TOWRITE,sp),x
      00A527 72 A9            [ 1] 3070 	clr (COUNT,sp)
                                   3071 ; first bock 
                                   3072 ; containt signature 2 bytes 
                                   3073 ; and size 	2 bytes 
                                   3074 ; use Y as pointer to block_buffer
      00A529 00 03 89         [ 4] 3075 	call clear_block_buffer ; -- y=*block_buffer	
                                   3076 ; write signature
      00A52C 90 F6 93         [ 2] 3077 	ldw x,SIGNATURE ; "BC" 
      00A52F EE 01            [ 2] 3078 	ldw (y),x 
      00A531 72 A9 00 03      [ 2] 3079 	addw y,#2
      00A535 90 93            [ 2] 3080 	ldw x,(TOWRITE,sp)
      00A537 85 FF            [ 2] 3081 	ldw (y),x
      00A538 72 A9 00 02      [ 2] 3082 	addw y,#2   
      00A538 89 AE            [ 1] 3083 	ld a,#(BLOCK_SIZE-4)
      00A53A F4 24            [ 1] 3084 	ld (CNT_LO,sp),a 
      00A53C 65 90 A3         [ 2] 3085 	cpw x,#(BLOCK_SIZE-4) 
      00A53F 7A 12            [ 1] 3086 	jrugt 3$
      00A541 2B               [ 1] 3087 	ld a,xl 
      00A542 01 5C            [ 1] 3088 3$:	ld (CNT_LO,sp),a   
      00A544 CE 00 1A         [ 2] 3089 	ldw x,txtbgn 
      00A544 9E C7            [ 2] 3090 	ldw (XTEMP,sp),x 
      00274D                       3091 32$: 
      00A546 53 0D            [ 2] 3092 	ldw x,(XTEMP,sp)
      00A548 9F C7            [ 1] 3093 	ld a,(CNT_LO,sp)
      00A54A 53 0E 8C         [ 4] 3094 	call fill_write_buffer 
      00A54D 56 9E            [ 2] 3095 	ldw (XTEMP,sp),x 
      00A54F C7 53 0F         [ 2] 3096 	ldw x,#block_buffer
      00A552 9F C7 53         [ 4] 3097 	call write_buffer
      00A555 10 72 10         [ 2] 3098 	ldw x,#BLOCK_SIZE 
      00A558 53 08 72         [ 4] 3099 	call incr_farptr  
                                   3100 ; following blocks 
      00A55B 10 53            [ 2] 3101 	ldw x,(XTEMP,sp)
      00A55D 00 72 10         [ 2] 3102 	cpw x,txtend 
      00A560 53 04            [ 1] 3103 	jruge 9$ 
      00A562 85 CD            [ 2] 3104 	ldw x,(TOWRITE,sp)
      00A564 A9 BF 72         [ 2] 3105 	subw x,(COUNT,sp)
      00A567 11 53            [ 2] 3106 	ldw (TOWRITE,sp),x 
      00A569 08 72            [ 1] 3107 	ld a,#BLOCK_SIZE 
      00A56B 11 53 00         [ 2] 3108 	cpw x,#BLOCK_SIZE 
      00A56E 81 01            [ 1] 3109 	jruge 4$ 
      00A56F 9F               [ 1] 3110 	ld a,xl 
      00A56F CD 99            [ 1] 3111 4$:	ld (CNT_LO,sp),a 
      00A571 81 A1 02         [ 4] 3112 	call clear_block_buffer 
      00A574 27 12            [ 2] 3113 	jra 32$ 
      00277F                       3114 9$:	_drop VSIZE 
      00A576 A1 01            [ 2]    1     addw sp,#VSIZE 
      00A578 27 03            [ 2] 3115     popw y 
      00A57A CC               [ 2] 3116 	popw x 
      00A57B 96               [ 4] 3117 	ret 
                                   3118 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3119 
      00A57C C8 4F                 3120 SIGNATURE: .ascii "BC"
      00A57E 5F 72 A2 00 03 90 F7  3121 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             90 EF 01 90 E6 03 93
             EE 04 5D 27 25 90 F6
             93 EE 01 72 A9 00 03
             72 A9 00 03 9F A4 07
             4E C7 54 01 72 16 50
             CA 72 10 54 01 AE 00
             1B 5A 9D 26 FA 20 08
             72 11 54 01 72 17 50
             CA 65 00
      00A5BE 4E 6F 20 61 70 70 6C  3122 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3123 
                                   3124 ;---------------------
                                   3125 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3126 ; write 1 or more byte to FLASH or EEPROM
                                   3127 ; starting at address  
                                   3128 ; input:
                                   3129 ;   expr1  	is address 
                                   3130 ;   expr2,...,exprn   are bytes to write
                                   3131 ; output:
                                   3132 ;   none 
                                   3133 ;---------------------
      0027DF                       3134 write:
      00A5BE 81 1A 38         [ 4] 3135 	call expression
      00A5BF A1 84            [ 1] 3136 	cp a,#TK_INTGR 
      00A5BF CD 99            [ 1] 3137 	jreq 0$
      00A5C1 7C A1 01         [ 2] 3138 	jp syntax_error
      0027E9                       3139 0$: _xpop 
      00A5C4 27 03            [ 1]    1     ld a,(y)
      00A5C6 CC               [ 1]    2     ldw x,y 
      00A5C7 96 C8            [ 2]    3     ldw x,(1,x)
      00A5C9 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A5CD 01 72 A9         [ 1] 3140 	ld farptr,a 
      00A5D0 00 03 A3         [ 2] 3141 	ldw ptr16,x 
      0027F8                       3142 1$:	
      00A5D3 00 05 23         [ 4] 3143 	call next_token 
      00A5D6 05 A6            [ 1] 3144 	cp a,#TK_COMMA 
      00A5D8 0A CC            [ 1] 3145 	jreq 2$ 
      00A5DA 96 CA            [ 2] 3146 	jra 9$ ; no more data 
      00A5DC 9F C7 00         [ 4] 3147 2$:	call expression
      00A5DF 0F A6            [ 1] 3148 	cp a,#TK_INTGR
      00A5E1 05 C0            [ 1] 3149 	jreq 3$
      00A5E3 00 0F C7         [ 2] 3150 	jp syntax_error
      00280B                       3151 3$:	_xpop 
      00A5E6 54 00            [ 1]    1     ld a,(y)
      00A5E8 72               [ 1]    2     ldw x,y 
      00A5E9 16 54            [ 2]    3     ldw x,(1,x)
      00A5EB 02 72 10 54      [ 2]    4     addw y,#CELL_SIZE 
      00A5EF 01               [ 1] 3152 	ld a,xl 
      00A5F0 72               [ 1] 3153 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A5F1 0F 54 00         [ 4] 3154 	call write_byte
      00A5F4 FB CE 54         [ 2] 3155 	ldw x,#1 
      00A5F7 04 A6 84         [ 4] 3156 	call incr_farptr 
      00A5FA 81 D7            [ 2] 3157 	jra 1$ 
      00A5FB                       3158 9$:
      00A5FB 52               [ 4] 3159 	ret 
                                   3160 
                                   3161 
                                   3162 ;---------------------
                                   3163 ;BASIC: CHAR(expr)
                                   3164 ; évaluate expression 
                                   3165 ; and take the 7 least 
                                   3166 ; bits as ASCII character
                                   3167 ; output: 
                                   3168 ; 	A char 
                                   3169 ;---------------------
      002822                       3170 char:
      00A5FC 01 CD 99         [ 4] 3171 	call func_args 
      00A5FF 7C A1            [ 1] 3172 	cp a,#1
      00A601 01 27            [ 1] 3173 	jreq 1$
      00A603 03 CC 96         [ 2] 3174 	jp syntax_error
      00282C                       3175 1$:	_xpop
      00A606 C8 90            [ 1]    1     ld a,(y)
      00A608 F6               [ 1]    2     ldw x,y 
      00A609 93 EE            [ 2]    3     ldw x,(1,x)
      00A60B 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A60F 03               [ 1] 3176 	ld a,xl
      00A610 A3 00            [ 1] 3177 	and a,#0x7f 
      00A612 0F               [ 4] 3178 	ret
                                   3179 
                                   3180 ;---------------------
                                   3181 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3182 ; extract first character 
                                   3183 ; of string argument 
                                   3184 ; output:
                                   3185 ;    A:X    int24 
                                   3186 ;---------------------
      002839                       3187 ascii:
      00A613 23 05            [ 1] 3188 	ld a,#TK_LPAREN
      00A615 A6 0A CC         [ 4] 3189 	call expect 
      00A618 96 CA CD         [ 4] 3190 	call next_token 
      00A61B AB 96            [ 1] 3191 	cp a,#TK_QSTR 
      00A61D 6B 01            [ 1] 3192 	jreq 1$
      00A61F E6 01            [ 1] 3193 	cp a,#TK_CHAR 
      00A621 0D 01            [ 1] 3194 	jreq 2$ 
      00A623 27 05            [ 1] 3195 	cp a,#TK_CFUNC 
      00A625 44 0A            [ 1] 3196 	jreq 0$
      00A627 01 26 FB         [ 2] 3197 	jp syntax_error
      002850                       3198 0$: ; cfunc 
      00A62A A4               [ 4] 3199 	call (x)
      00A62B 01 5F            [ 2] 3200 	jra 3$
      002853                       3201 1$: ; quoted string 
      00A62D 97               [ 1] 3202 	ld a,(x)
      00A62E A6               [ 1] 3203 	push a  
      00A62F 84 5B 01         [ 4] 3204 	call skip_string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A632 81               [ 1] 3205 	pop a  	
      00A633 20 03            [ 2] 3206 	jra 3$ 
      00285B                       3207 2$: ; character 
      00A633 52 02 CD         [ 4] 3208 	call get_char 
      00A636 99               [ 1] 3209 3$:	clrw x 
      00A637 81               [ 1] 3210 	rlwa x   
      002860                       3211 4$:	_xpush  
      00A638 A1 02 27 03      [ 2]    1     subw y,#CELL_SIZE
      00A63C CC 96            [ 1]    2     ld (y),a 
      00A63E C8 90 F6         [ 2]    3     ldw (1,y),x 
      00A641 93 EE            [ 1] 3212 	ld a,#TK_RPAREN 
      00A643 01 72 A9         [ 4] 3213 	call expect
      00286E                       3214 9$:	
      00286E                       3215 	_xpop  
      00A646 00 03            [ 1]    1     ld a,(y)
      00A648 9F               [ 1]    2     ldw x,y 
      00A649 6B 02            [ 2]    3     ldw x,(1,x)
      00A64B 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A64F 01               [ 4] 3216 	ret 
                                   3217 
                                   3218 ;---------------------
                                   3219 ;BASIC: KEY
                                   3220 ; wait for a character 
                                   3221 ; received from STDIN 
                                   3222 ; input:
                                   3223 ;	none 
                                   3224 ; output:
                                   3225 ;	a	 character 
                                   3226 ;---------------------
      002878                       3227 key:
      00A650 72 A9 00         [ 4] 3228 	call getc 
      00A653 03               [ 4] 3229 	ret
                                   3230 
                                   3231 ;----------------------
                                   3232 ; BASIC: QKEY
                                   3233 ; Return true if there 
                                   3234 ; is a character in 
                                   3235 ; waiting in STDIN 
                                   3236 ; input:
                                   3237 ;  none 
                                   3238 ; output:
                                   3239 ;   A     0|-1
                                   3240 ;-----------------------
      00287C                       3241 qkey:: 
      00A654 A3               [ 1] 3242 	clrw x 
      00A655 00 0F 23         [ 1] 3243 	ld a,rx1_head
      00A658 05 A6 0A         [ 1] 3244 	sub a,rx1_tail 
      00A65B CC 96            [ 1] 3245 	jreq 9$ 
      00A65D CA               [ 2] 3246 	cplw x
      00A65E CD AB            [ 1] 3247 	ld a,#255    
      002888                       3248 9$: 
      00A660 96               [ 4] 3249 	ret 
                                   3250 
                                   3251 ;---------------------
                                   3252 ; BASIC: GPIO(expr,reg)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   3253 ; return gpio address 
                                   3254 ; expr {0..8}
                                   3255 ; input:
                                   3256 ;   none 
                                   3257 ; output:
                                   3258 ;   X 		gpio register address
                                   3259 ;----------------------------
                                   3260 ;	N=PORT
                                   3261 ;	T=REG 
      002889                       3262 gpio:
      00A661 6B 01 A6         [ 4] 3263 	call func_args 
      00A664 01 0D            [ 1] 3264 	cp a,#2
      00A666 01 27            [ 1] 3265 	jreq 1$
      00A668 05 48 0A         [ 2] 3266 	jp syntax_error  
      002893                       3267 1$:	_at_next 
      00A66B 01 26 FB         [ 1]    1     ld a,(3,y)
      00A66E 0D               [ 1]    2     ldw x,y 
      00A66F 02 26            [ 2]    3     ldw x,(4,x)
      00A671 05               [ 2] 3268 	tnzw x 
      00A672 43 E4            [ 1] 3269 	jrmi bad_port
      00A674 00 20 02         [ 2] 3270 	cpw x,#9
      00A677 EA 00            [ 1] 3271 	jrpl bad_port
      00A679 E7 00            [ 1] 3272 	ld a,#5
      00A67B 5B               [ 4] 3273 	mul x,a
      00A67C 02 81 00         [ 2] 3274 	addw x,#GPIO_BASE 
      00A67E 89               [ 2] 3275 	pushw x 
      0028A8                       3276 	_xpop
      00A67E 72 00            [ 1]    1     ld a,(y)
      00A680 00               [ 1]    2     ldw x,y 
      00A681 22 02            [ 2]    3     ldw x,(1,x)
      00A683 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A685 72 FB 01         [ 2] 3277 	addw x,(1,sp)
      0028B4                       3278 	_drop 2 
      00A685 AE A6            [ 2]    1     addw sp,#2 
      00A687 AC               [ 1] 3279 	clr a 
      0028B7                       3280 	_store_top 	
      00A688 CD 89            [ 1]    1     ld (y),a 
      00A68A DA 5B 02         [ 2]    2     ldw (1,y),x     
      00A68D 52 04            [ 1] 3281 	ld a,#TK_INTGR
      00A68F CD               [ 4] 3282 	ret
      0028BF                       3283 bad_port:
      00A690 A0 16            [ 1] 3284 	ld a,#ERR_BAD_VALUE
      00A692 AE 16 68         [ 2] 3285 	jp tb_error
                                   3286 
                                   3287 
                                   3288 ;-------------------------
                                   3289 ; BASIC: UFLASH 
                                   3290 ; return free flash address
                                   3291 ; input:
                                   3292 ;  none 
                                   3293 ; output:
                                   3294 ;	A		TK_INTGR
                                   3295 ;   xstack	free address 
                                   3296 ;---------------------------
      0028C4                       3297 uflash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A695 CF 00 05         [ 2] 3298 	ldw x,app_sign
      00A698 7F 72 5F         [ 2] 3299 	cpw x,#4243 ; signature "BC" 
      00A69B 00 04            [ 1] 3300 	jreq 1$
      00A69D 5F CF 00         [ 2] 3301 	ldw x,app_size 
      00A6A0 01 72 11         [ 2] 3302 	addw x,#app
      00A6A3 00 22            [ 2] 3303 	jra 2$
      00A6A5 72 18 00         [ 2] 3304 1$:	ldw x,#app_space 
      00A6A8 22               [ 1] 3305 2$:	clr a 
      00A6A9 CC               [ 4] 3306 	ret 
                                   3307 
                                   3308 
                                   3309 ;---------------------
                                   3310 ; BASIC: USR(addr[,arg])
                                   3311 ; execute a function written 
                                   3312 ; in binary code.
                                   3313 ; binary fonction should 
                                   3314 ; return token attribute in A 
                                   3315 ; and value in YL:X. 
                                   3316 ; input:
                                   3317 ;   addr	routine address 
                                   3318 ;   arg 	is an optional argument 
                                   3319 ; output:
                                   3320 ;   A 		token attribute 
                                   3321 ;   xstack  returned value 
                                   3322 ;---------------------
      0028D9                       3323 usr:
      00A6AA 97               [ 2] 3324 	pushw x 
      00A6AB 71 0A            [ 2] 3325 	pushw y 	
      00A6AD 62 72 65         [ 4] 3326 	call func_args 
      00A6B0 61 6B            [ 1] 3327 	cp a,#1 
      00A6B2 20 70            [ 1] 3328 	jreq 1$
      00A6B4 6F 69            [ 1] 3329 	cp a,#2
      00A6B6 6E 74            [ 1] 3330 	jreq 1$  
      00A6B8 2C 20 52         [ 2] 3331 	jp syntax_error 
      00A6BB 55               [ 1] 3332 1$: push a 
      0028EB                       3333 	_xpop 
      00A6BC 4E 20            [ 1]    1     ld a,(y)
      00A6BE 74               [ 1]    2     ldw x,y 
      00A6BF 6F 20            [ 2]    3     ldw x,(1,x)
      00A6C1 72 65 73 75      [ 2]    4     addw y,#CELL_SIZE 
      00A6C5 6D 65            [ 1] 3334 	ldw y,x  ; arg|addr 
      00A6C7 2E               [ 1] 3335     pop a 
      00A6C8 0A 00            [ 1] 3336 	cp a,#1 
      00A6CA 27 0A            [ 1] 3337 	jreq 3$
      0028FB                       3338 	_xpop  ; x=code addr  
      00A6CA 72 01            [ 1]    1     ld a,(y)
      00A6CC 00               [ 1]    2     ldw x,y 
      00A6CD 22 01            [ 2]    3     ldw x,(1,x)
      00A6CF 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A6D0 51               [ 1] 3339 	exgw x,y ; y=code addr, x=arg 
      00A6D0 CD 95            [ 4] 3340 3$: call (y)
      00A6D2 24               [ 1] 3341 	push a 
      00A6D3 81 9F            [ 1] 3342 	ld a,yl  
      00A6D4                       3343 	_xpush 
      00A6D4 72 5F 00 18      [ 2]    1     subw y,#CELL_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A6D8 52 03            [ 1]    2     ld (y),a 
      00A6DA CD 97 C7         [ 2]    3     ldw (1,y),x 
      00A6DD A1               [ 1] 3344 	pop a 
      00A6DE 04 27            [ 2] 3345 	popw y 
      00A6E0 03               [ 2] 3346 	popw x 
      00A6E1 CC               [ 4] 3347 	ret 
                                   3348 
                                   3349 
                                   3350 ;------------------------------
                                   3351 ; BASIC: BYE 
                                   3352 ; halt mcu in its lowest power mode 
                                   3353 ; wait for reset or external interrupt
                                   3354 ; do a cold start on wakeup.
                                   3355 ;------------------------------
      002918                       3356 bye:
      00A6E2 96 C8 CD 98 17   [ 2] 3357 	btjf UART1_SR,#UART_SR_TC,.
      00A6E7 A4               [10] 3358 	halt
      00A6E8 DF A1 45         [ 2] 3359 	jp cold_start  
                                   3360 
                                   3361 ;----------------------------------
                                   3362 ; BASIC: SLEEP 
                                   3363 ; halt mcu until reset or external
                                   3364 ; interrupt.
                                   3365 ; Resume progam after SLEEP command
                                   3366 ;----------------------------------
      002921                       3367 sleep:
      00A6EB 26 0C AE 40 00   [ 2] 3368 	btjf UART1_SR,#UART_SR_TC,.
      00A6F0 CF 00 19 AE      [ 1] 3369 	bset flags,#FSLEEP
      00A6F4 47               [10] 3370 	halt 
      00A6F5 FF               [ 4] 3371 	ret 
                                   3372 
                                   3373 ;-------------------------------
                                   3374 ; BASIC: PAUSE expr 
                                   3375 ; suspend execution for n msec.
                                   3376 ; input:
                                   3377 ;	none
                                   3378 ; output:
                                   3379 ;	none 
                                   3380 ;------------------------------
      00292C                       3381 pause:
      00A6F6 4F 20 15         [ 4] 3382 	call expression
      00A6F9 A1 46            [ 1] 3383 	cp a,#TK_INTGR
      00A6FB 27 06            [ 1] 3384 	jreq 1$ 
      00A6FD AE 96 08         [ 2] 3385 	jp syntax_error
      002936                       3386 1$: _xpop 
      00A700 CC 96            [ 1]    1     ld a,(y)
      00A702 CA               [ 1]    2     ldw x,y 
      00A703 EE 01            [ 2]    3     ldw x,(1,x)
      00A703 AE B6 00 CF      [ 2]    4     addw y,#CELL_SIZE 
      00293F                       3387 pause02:
      00A707 00 19 A6         [ 2] 3388 	ldw timer,x 
      00A70A 02 AE 7F         [ 2] 3389 1$: ldw x,timer 
      00A70D FF               [ 2] 3390 	tnzw x 
      00A70E 27 03            [ 1] 3391 	jreq 2$
      00A70E 6B               [10] 3392 	wfi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A70F 01 1F            [ 1] 3393 	jrne 1$
      00A711 02               [ 1] 3394 2$:	clr a 
      00A712 CD               [ 4] 3395 	ret 
                                   3396 
                                   3397 ;------------------------------
                                   3398 ; BASIC: AWU expr
                                   3399 ; halt mcu for 'expr' milliseconds
                                   3400 ; use Auto wakeup peripheral
                                   3401 ; all oscillators stopped except LSI
                                   3402 ; range: 1ms - 511ms
                                   3403 ; input:
                                   3404 ;  none
                                   3405 ; output:
                                   3406 ;  none:
                                   3407 ;------------------------------
      00294D                       3408 awu:
      00A713 87 80 38         [ 4] 3409   call expression
      00A715 A1 84            [ 1] 3410   cp a,#TK_INTGR
      00A715 CD 88            [ 1] 3411   jreq 1$
      00A717 FD 27 08         [ 2] 3412   jp syntax_error
      002957                       3413 1$: _xpop 
      00A71A A6 45            [ 1]    1     ld a,(y)
      00A71C CD               [ 1]    2     ldw x,y 
      00A71D 89 7D            [ 2]    3     ldw x,(1,x)
      00A71F CD 87 FE AE      [ 2]    4     addw y,#CELL_SIZE 
      002960                       3414 awu02:
      00A723 00 80 CD         [ 2] 3415   cpw x,#5120
      00A726 88 EF            [ 1] 3416   jrmi 1$ 
      00A728 7B 01 1E 02      [ 1] 3417   mov AWU_TBR,#15 
      00A72C 72 B0            [ 1] 3418   ld a,#30
      00A72E 00               [ 2] 3419   div x,a
      00A72F 19 C2            [ 1] 3420   ld a,#16
      00A731 00               [ 2] 3421   div x,a 
      00A732 18 22            [ 2] 3422   jra 4$
      002971                       3423 1$: 
      00A734 E0 CD 95         [ 2] 3424   cpw x,#2048
      00A737 24 1E            [ 1] 3425   jrmi 2$ 
      00A739 02 A3 47 FF      [ 1] 3426   mov AWU_TBR,#14
      00A73D 26 03            [ 1] 3427   ld a,#80
      00A73F CD               [ 2] 3428   div x,a 
      00A740 9C E7            [ 2] 3429   jra 4$   
      00A742                       3430 2$:
      00A742 5B 03 81 F2      [ 1] 3431   mov AWU_TBR,#7
      00A745                       3432 3$:  
                                   3433 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A745 CE B6 00         [ 2] 3434   cpw x,#64 
      00A748 C3 A8            [ 2] 3435   jrule 4$ 
      00A74A 05 81 50 F2      [ 1] 3436   inc AWU_TBR 
      00A74C 54               [ 2] 3437   srlw x 
      00A74C 88 4D            [ 2] 3438   jra 3$ 
      00298F                       3439 4$:
      00A74E 27               [ 1] 3440   ld a, xl
      00A74F 0A               [ 1] 3441   dec a 
      00A750 F6 5C            [ 1] 3442   jreq 5$
      00A752 90               [ 1] 3443   dec a 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      002994                       3444 5$: 
      00A753 F7 90            [ 1] 3445   and a,#0x3e 
      00A755 5C 0A 01         [ 1] 3446   ld AWU_APR,a 
      00A758 26 F6 84 81      [ 1] 3447   bset AWU_CSR,#AWU_CSR_AWUEN
      00A75C 8E               [10] 3448   halt 
                                   3449 
      00A75C 88               [ 4] 3450   ret 
                                   3451 
                                   3452 ;------------------------------
                                   3453 ; BASIC: TICKS
                                   3454 ; return msec ticks counter value 
                                   3455 ; input:
                                   3456 ; 	none 
                                   3457 ; output:
                                   3458 ;	X 		TK_INTGR
                                   3459 ;-------------------------------
      00299F                       3460 get_ticks:
      00A75D 90 AE 16         [ 2] 3461 	ldw x,ticks 
      00A760 B8               [ 1] 3462 	clr a 
      0029A3                       3463 	_xpush 
      00A761 90 89 A6 80      [ 2]    1     subw y,#CELL_SIZE
      00A765 90 7F            [ 1]    2     ld (y),a 
      00A767 90 5C 4A         [ 2]    3     ldw (1,y),x 
      00A76A 26 F9            [ 1] 3464 	ld a,#TK_INTGR
      00A76C 90               [ 4] 3465 	ret 
                                   3466 
                                   3467 ;------------------------------
                                   3468 ; BASIC: ABS(expr)
                                   3469 ; return absolute value of expr.
                                   3470 ; input:
                                   3471 ;   none
                                   3472 ; output:
                                   3473 ;   xstack    positive int24 
                                   3474 ;-------------------------------
      0029AF                       3475 abs:
      00A76D 85 84 81         [ 4] 3476 	call func_args 
      00A770 A1 01            [ 1] 3477 	cp a,#1 
      00A770 89 90            [ 1] 3478 	jreq 0$ 
      00A772 89 52 06         [ 2] 3479 	jp syntax_error
      0029B9                       3480 0$:  
      00A775 CD A7 45         [ 4] 3481 	call abs24 
      00A778 26 09            [ 1] 3482     ld a,#TK_INTGR 
      00A77A AE               [ 4] 3483 	ret 
                                   3484 
                                   3485 ;------------------------------
                                   3486 ; BASIC: AND(expr1,expr2)
                                   3487 ; Apply bit AND relation between
                                   3488 ; the 2 arguments, i.e expr1 & expr2 
                                   3489 ; output:
                                   3490 ; 	A 		TK_INTGR
                                   3491 ;   X 		result 
                                   3492 ;------------------------------
      0029BF                       3493 bit_and: ; i1 i2 -- i1 & i2 
      00A77B A8 07 CD         [ 4] 3494 	call func_args 
      00A77E 89 DA            [ 1] 3495 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A780 CC A7            [ 1] 3496 	jreq 1$
      00A782 FF 16 48         [ 2] 3497 	jp syntax_error 
      00A783                       3498 1$:	_xpop 
      00A783 CE 00            [ 1]    1     ld a,(y)
      00A785 1B               [ 1]    2     ldw x,y 
      00A786 C3 00            [ 2]    3     ldw x,(1,x)
      00A788 1D 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A78C A8               [ 2] 3499     pushw x 
      00A78D 49               [ 1] 3500 	push  a 
      0029D4                       3501 	_at_top 
      00A78E CD 89            [ 1]    1     ld a,(y)
      00A790 DA               [ 1]    2     ldw x,y 
      00A791 CC A7            [ 2]    3     ldw x,(1,x)
      00A793 FF 01            [ 1] 3502 	and a,(1,sp)
      00A794 02               [ 1] 3503 	rlwa x 
      00A794 CD 87            [ 1] 3504 	and a,(2,sp)
      00A796 C0               [ 1] 3505 	rlwa x 
      00A797 72 5F            [ 1] 3506 	and a,(3,sp)
      00A799 00               [ 1] 3507 	rlwa x 
      0029E2                       3508 	_drop 3 
      00A79A 18 AE            [ 2]    1     addw sp,#3 
      0029E4                       3509 	_store_top 
      00A79C B6 00            [ 1]    1     ld (y),a 
      00A79E CF 00 19         [ 2]    2     ldw (1,y),x     
      00A7A1 CD 9E            [ 1] 3510 	ld a,#TK_INTGR
      00A7A3 03               [ 4] 3511 	ret
                                   3512 
                                   3513 ;------------------------------
                                   3514 ; BASIC: OR(expr1,expr2)
                                   3515 ; Apply bit OR relation between
                                   3516 ; the 2 arguments, i.e expr1 | expr2 
                                   3517 ; output:
                                   3518 ; 	A 		TK_INTGR
                                   3519 ;   X 		result 
                                   3520 ;------------------------------
      0029EC                       3521 bit_or:
      00A7A4 1F 05 0F         [ 4] 3522 	call func_args 
      00A7A7 03 CD            [ 1] 3523 	cp a,#2
      00A7A9 A7 5C            [ 1] 3524 	jreq 1$
      00A7AB CE A8 05         [ 2] 3525 	jp syntax_error 
      0029F6                       3526 1$:	_xpop 
      00A7AE 90 FF            [ 1]    1     ld a,(y)
      00A7B0 72               [ 1]    2     ldw x,y 
      00A7B1 A9 00            [ 2]    3     ldw x,(1,x)
      00A7B3 02 1E 05 90      [ 2]    4     addw y,#CELL_SIZE 
      00A7B7 FF               [ 2] 3527     pushw x 
      00A7B8 72               [ 1] 3528 	push  a 
      002A01                       3529 	_at_top 
      00A7B9 A9 00            [ 1]    1     ld a,(y)
      00A7BB 02               [ 1]    2     ldw x,y 
      00A7BC A6 7C            [ 2]    3     ldw x,(1,x)
      00A7BE 6B 04            [ 1] 3530 	or a,(1,sp)
      00A7C0 A3 00            [ 1] 3531 	ld yl,a 
      00A7C2 7C               [ 1] 3532 	ld a,xh 
      00A7C3 22 01            [ 1] 3533 	or a,(2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A7C5 9F               [ 1] 3534 	ld xh,a 
      00A7C6 6B               [ 1] 3535 	ld a,xl 
      00A7C7 04 CE            [ 1] 3536 	or a,(3,sp)
      00A7C9 00               [ 1] 3537 	ld xl,a 
      00A7CA 1B 1F            [ 1] 3538 	ld a,yl 
      002A14                       3539 	_drop 3 
      00A7CC 01 03            [ 2]    1     addw sp,#3 
      00A7CD                       3540 	_store_top 
      00A7CD 1E 01            [ 1]    1     ld (y),a 
      00A7CF 7B 04 CD         [ 2]    2     ldw (1,y),x     
      00A7D2 A7 4C            [ 1] 3541 	ld a,#TK_INTGR
      00A7D4 1F               [ 4] 3542 	ret
                                   3543 
                                   3544 ;------------------------------
                                   3545 ; BASIC: XOR(expr1,expr2)
                                   3546 ; Apply bit XOR relation between
                                   3547 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3548 ; output:
                                   3549 ; 	A 		TK_INTGR
                                   3550 ;   X 		result 
                                   3551 ;------------------------------
      002A1E                       3552 bit_xor:
      00A7D5 01 AE 16         [ 4] 3553 	call func_args 
      00A7D8 B8 CD            [ 1] 3554 	cp a,#2
      00A7DA 87 DA            [ 1] 3555 	jreq 1$
      00A7DC AE 00 80         [ 2] 3556 	jp syntax_error 
      002A28                       3557 1$:	_xpop 
      00A7DF CD 88            [ 1]    1     ld a,(y)
      00A7E1 EF               [ 1]    2     ldw x,y 
      00A7E2 1E 01            [ 2]    3     ldw x,(1,x)
      00A7E4 C3 00 1D 24      [ 2]    4     addw y,#CELL_SIZE 
      00A7E8 16               [ 2] 3558     pushw x 
      00A7E9 1E               [ 1] 3559 	push  a 
      002A33                       3560 	_at_top 
      00A7EA 05 72            [ 1]    1     ld a,(y)
      00A7EC F0               [ 1]    2     ldw x,y 
      00A7ED 03 1F            [ 2]    3     ldw x,(1,x)
      00A7EF 05 A6            [ 1] 3561 	xor a,(1,sp)
      00A7F1 80 A3            [ 1] 3562 	ld yl,a 
      00A7F3 00               [ 1] 3563 	ld a,xh 
      00A7F4 80 24            [ 1] 3564 	xor a,(2,sp)
      00A7F6 01               [ 1] 3565 	ld xh,a 
      00A7F7 9F               [ 1] 3566 	ld a,xl 
      00A7F8 6B 04            [ 1] 3567 	xor a,(3,sp)
      00A7FA CD               [ 1] 3568 	ld xl,a 
      00A7FB A7 5C            [ 1] 3569 	ld a,yl 
      002A46                       3570 	_drop 3 
      00A7FD 20 CE            [ 2]    1     addw sp,#3 
      002A48                       3571 	_store_top 
      00A7FF 5B 06            [ 1]    1     ld (y),a 
      00A801 90 85 85         [ 2]    2     ldw (1,y),x     
      00A804 81 42            [ 1] 3572 	ld a,#TK_INTGR
      00A806 43               [ 4] 3573 	ret
                                   3574 
                                   3575 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3576 ; BASIC: LSHIFT(expr1,expr2)
                                   3577 ; logical shift left expr1 by 
                                   3578 ; expr2 bits 
                                   3579 ; output:
                                   3580 ; 	A 		TK_INTGR
                                   3581 ;   X 		result 
                                   3582 ;------------------------------
      002A50                       3583 lshift:
      00A807 43 61 6E         [ 4] 3584 	call func_args
      00A80A 27 74            [ 1] 3585 	cp a,#2 
      00A80C 20 66            [ 1] 3586 	jreq 1$
      00A80E 6C 61 73         [ 2] 3587 	jp syntax_error
      002A5A                       3588 1$: _xpop 
      00A811 68 20            [ 1]    1     ld a,(y)
      00A813 61               [ 1]    2     ldw x,y 
      00A814 70 70            [ 2]    3     ldw x,(1,x)
      00A816 6C 69 63 61      [ 2]    4     addw y,#CELL_SIZE 
      00A81A 74 69            [ 1] 3589     ldw y,x    
      002A65                       3590 	_at_top  ; T@ 
      00A81C 6F 6E            [ 1]    1     ld a,(y)
      00A81E 2C               [ 1]    2     ldw x,y 
      00A81F 20 61            [ 2]    3     ldw x,(1,x)
      00A821 6C 72            [ 2] 3591 	tnzw y 
      00A823 65 61            [ 1] 3592 	jreq 4$
      00A825 64               [ 1] 3593 2$:	rcf 
      00A826 79               [ 2] 3594 	rlcw x 
      00A827 20               [ 1] 3595 	rlc a 
      00A828 6F 6E            [ 2] 3596 	decw y 
      00A82A 65 20            [ 1] 3597 	jrne 2$
      002A75                       3598 4$: _store_top  ; T! 
      00A82C 69 6E            [ 1]    1     ld (y),a 
      00A82E 20 46 4C         [ 2]    2     ldw (1,y),x     
      00A831 41 53            [ 1] 3599 	ld a,#TK_INTGR
      00A833 48               [ 4] 3600 	ret
                                   3601 
                                   3602 ;------------------------------
                                   3603 ; BASIC: RSHIFT(expr1,expr2)
                                   3604 ; logical shift right expr1 by 
                                   3605 ; expr2 bits.
                                   3606 ; output:
                                   3607 ; 	A 		TK_INTGR
                                   3608 ;   X 		result 
                                   3609 ;------------------------------
      002A7D                       3610 rshift:
      00A834 0A 75 73         [ 4] 3611 	call func_args
      00A837 65 20            [ 1] 3612 	cp a,#2 
      00A839 45 52            [ 1] 3613 	jreq 1$
      00A83B 41 53 45         [ 2] 3614 	jp syntax_error
      002A87                       3615 1$: _xpop 
      00A83E 20 5C            [ 1]    1     ld a,(y)
      00A840 46               [ 1]    2     ldw x,y 
      00A841 20 62            [ 2]    3     ldw x,(1,x)
      00A843 65 66 6F 72      [ 2]    4     addw y,#CELL_SIZE 
      00A847 65 00            [ 1] 3616     ldw y,x   
      002A92                       3617 	_at_top  ; T@  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A849 4E 6F            [ 1]    1     ld a,(y)
      00A84B 20               [ 1]    2     ldw x,y 
      00A84C 61 70            [ 2]    3     ldw x,(1,x)
      00A84E 70 6C            [ 2] 3618 	tnzw y 
      00A850 69 63            [ 1] 3619 	jreq 4$
      00A852 61               [ 1] 3620 2$:	rcf 
      00A853 74               [ 2] 3621 	rrcw x
      00A854 69               [ 1] 3622 	rrc a  
      00A855 6F 6E            [ 2] 3623 	decw y 
      00A857 20 69            [ 1] 3624 	jrne 2$
      002AA2                       3625 4$: _store_top  ; T! 
      00A859 6E 20            [ 1]    1     ld (y),a 
      00A85B 52 41 4D         [ 2]    2     ldw (1,y),x     
      00A85E 00 84            [ 1] 3626 	ld a,#TK_INTGR
      00A85F 81               [ 4] 3627 	ret
                                   3628 
                                   3629 ;--------------------------
                                   3630 ; BASIC: FCPU integer
                                   3631 ; set CPU frequency 
                                   3632 ;-------------------------- 
                                   3633 
      002AAA                       3634 fcpu:
      00A85F CD 9A            [ 1] 3635 	ld a,#TK_INTGR
      00A861 B8 A1 84         [ 4] 3636 	call expect 
      00A864 27 03 CC         [ 4] 3637 	call get_int24 
      00A867 96               [ 1] 3638 	ld a,xl 
      00A868 C8 90            [ 1] 3639 	and a,#7 
      00A86A F6 93 EE         [ 1] 3640 	ld CLK_CKDIVR,a 
      00A86D 01               [ 4] 3641 	ret 
                                   3642 
                                   3643 ;------------------------------
                                   3644 ; BASIC: PMODE pin#, mode 
                                   3645 ; Arduino pin. 
                                   3646 ; define pin as input or output
                                   3647 ; pin#: {0..15}
                                   3648 ; mode: INPUT|OUTPUT  
                                   3649 ;------------------------------
                           000001  3650 	PINNO=1
                           000001  3651 	VSIZE=1
      002AB9                       3652 pin_mode:
      002AB9                       3653 	_vars VSIZE 
      00A86E 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A870 00 03 C7         [ 4] 3654 	call arg_list 
      00A873 00 18            [ 1] 3655 	cp a,#2 
      00A875 CF 00            [ 1] 3656 	jreq 1$
      00A877 19 16 48         [ 2] 3657 	jp syntax_error 
      00A878                       3658 1$: _xpop 
      00A878 CD 97            [ 1]    1     ld a,(y)
      00A87A C7               [ 1]    2     ldw x,y 
      00A87B A1 08            [ 2]    3     ldw x,(1,x)
      00A87D 27 02 20 20      [ 2]    4     addw y,#CELL_SIZE 
      00A881 CD 9A            [ 1] 3659 	ldw y,x ; mode 
      002AD0                       3660 	_xpop ; Dx pin 
      00A883 B8 A1            [ 1]    1     ld a,(y)
      00A885 84               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A886 27 03            [ 2]    3     ldw x,(1,x)
      00A888 CC 96 C8 90      [ 2]    4     addw y,#CELL_SIZE 
      00A88C F6 93 EE         [ 4] 3661 	call select_pin 
      00A88F 01 72            [ 1] 3662 	ld (PINNO,sp),a  
      00A891 A9 00            [ 1] 3663 	ld a,#1 
      00A893 03 9F            [ 1] 3664 	tnz (PINNO,sp)
      00A895 5F CD            [ 1] 3665 	jreq 4$
      00A897 88               [ 1] 3666 2$:	sll a 
      00A898 1F AE            [ 1] 3667 	dec (PINNO,sp)
      00A89A 00 01            [ 1] 3668 	jrne 2$ 
      00A89C CD 88            [ 1] 3669 	ld (PINNO,sp),a
      00A89E EF 20            [ 1] 3670 	ld a,(PINNO,sp)
      00A8A0 D7 03            [ 1] 3671 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A8A1 E7 03            [ 1] 3672 	ld (GPIO_CR1,x),a 
      00A8A1 81 A3 00 01      [ 2] 3673 4$:	cpw y,#OUTP 
      00A8A2 27 10            [ 1] 3674 	jreq 6$
                                   3675 ; input mode
                                   3676 ; disable external interrupt 
      00A8A2 CD 99            [ 1] 3677 	ld a,(PINNO,sp)
      00A8A4 7C               [ 1] 3678 	cpl a 
      00A8A5 A1 01            [ 1] 3679 	and a,(GPIO_CR2,x)
      00A8A7 27 03            [ 1] 3680 	ld (GPIO_CR2,x),a 
                                   3681 ;clear bit in DDR for input mode 
      00A8A9 CC 96            [ 1] 3682 	ld a,(PINNO,sp)
      00A8AB C8               [ 1] 3683 	cpl a 
      00A8AC 90 F6            [ 1] 3684 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A8AE 93 EE            [ 1] 3685 	ld (GPIO_DDR,x),a 
      00A8B0 01 72            [ 2] 3686 	jra 9$
      002B07                       3687 6$: ;output mode  
      00A8B2 A9 00            [ 1] 3688 	ld a,(PINNO,sp)
      00A8B4 03 9F            [ 1] 3689 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A8B6 A4 7F            [ 1] 3690 	ld (GPIO_DDR,x),a 
      00A8B8 81 01            [ 1] 3691 	ld a,(PINNO,sp)
      00A8B9 EA 04            [ 1] 3692 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A8B9 A6 06            [ 1] 3693 	ld (GPIO_CR2,x),a 
      002B13                       3694 9$:	
      002B13                       3695 	_drop VSIZE 
      00A8BB CD 99            [ 2]    1     addw sp,#VSIZE 
      00A8BD 6F               [ 4] 3696 	ret
                                   3697 
                                   3698 ;------------------------
                                   3699 ; select Arduino pin 
                                   3700 ; input:
                                   3701 ;   X 	 {0..15} Arduino Dx 
                                   3702 ; output:
                                   3703 ;   A     stm8s208 pin 
                                   3704 ;   X     base address s208 GPIO port 
                                   3705 ;---------------------------
      002B16                       3706 select_pin:
      00A8BE CD               [ 2] 3707 	sllw x 
      00A8BF 97 C7 A1         [ 2] 3708 	addw x,#arduino_to_8s208 
      00A8C2 02               [ 2] 3709 	ldw x,(x)
      00A8C3 27               [ 1] 3710 	ld a,xl 
      00A8C4 0E               [ 1] 3711 	push a 
      00A8C5 A1               [ 1] 3712 	swapw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A8C6 04 27            [ 1] 3713 	ld a,#5 
      00A8C8 12               [ 4] 3714 	mul x,a 
      00A8C9 A1 82 27         [ 2] 3715 	addw x,#GPIO_BASE 
      00A8CC 03               [ 1] 3716 	pop a 
      00A8CD CC               [ 4] 3717 	ret 
                                   3718 ; translation from Arduino D0..D15 to stm8s208rb 
      002B26                       3719 arduino_to_8s208:
      00A8CE 96 C8                 3720 .byte 3,6 ; D0 
      00A8D0 03 05                 3721 .byte 3,5 ; D1 
      00A8D0 FD 20                 3722 .byte 4,0 ; D2 
      00A8D2 0B 01                 3723 .byte 2,1 ; D3
      00A8D3 06 00                 3724 .byte 6,0 ; D4
      00A8D3 F6 88                 3725 .byte 2,2 ; D5
      00A8D5 CD 97                 3726 .byte 2,3 ; D6
      00A8D7 EE 84                 3727 .byte 3,1 ; D7
      00A8D9 20 03                 3728 .byte 3,3 ; D8
      00A8DB 02 04                 3729 .byte 2,4 ; D9
      00A8DB CD 98                 3730 .byte 4,5 ; D10
      00A8DD 17 5F                 3731 .byte 2,6 ; D11
      00A8DF 02 72                 3732 .byte 2,7 ; D12
      00A8E1 A2 00                 3733 .byte 2,5 ; D13
      00A8E3 03 90                 3734 .byte 4,2 ; D14
      00A8E5 F7 90                 3735 .byte 4,1 ; D15
                                   3736 
                                   3737 
                                   3738 ;------------------------------
                                   3739 ; BASIC: RND(expr)
                                   3740 ; return random number 
                                   3741 ; between 1 and expr inclusive
                                   3742 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3743 ; input:
                                   3744 ; 	none 
                                   3745 ; output:
                                   3746 ;	xstack 	random positive integer 
                                   3747 ;------------------------------
      002B46                       3748 random:
      00A8E7 EF 01 A6         [ 4] 3749 	call func_args 
      00A8EA 07 CD            [ 1] 3750 	cp a,#1
      00A8EC 99 6F            [ 1] 3751 	jreq 1$
      00A8EE CC 16 48         [ 2] 3752 	jp syntax_error
      002B50                       3753 1$:  
      002B50                       3754 	_xpop   
      00A8EE 90 F6            [ 1]    1     ld a,(y)
      00A8F0 93               [ 1]    2     ldw x,y 
      00A8F1 EE 01            [ 2]    3     ldw x,(1,x)
      00A8F3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8F7 81               [ 2] 3755 	pushw x 
      00A8F8 88               [ 1] 3756 	push a  
      00A8F8 CD 89            [ 1] 3757 	ld a,#0x80 
      00A8FA 8D 81            [ 1] 3758 	bcp a,(1,sp)
      00A8FC 27 05            [ 1] 3759 	jreq 2$
      00A8FC 5F C6            [ 1] 3760 	ld a,#ERR_BAD_VALUE
      00A8FE 00 2E C0         [ 2] 3761 	jp tb_error
      002B66                       3762 2$: 
                                   3763 ; acc16=(x<<5)^x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A901 00 2F 27         [ 2] 3764 	ldw x,seedx 
      00A904 03               [ 2] 3765 	sllw x 
      00A905 53               [ 2] 3766 	sllw x 
      00A906 A6               [ 2] 3767 	sllw x 
      00A907 FF               [ 2] 3768 	sllw x 
      00A908 58               [ 2] 3769 	sllw x 
      00A908 81               [ 1] 3770 	ld a,xh 
      00A909 C8 00 13         [ 1] 3771 	xor a,seedx 
      00A909 CD 99 7C         [ 1] 3772 	ld acc16,a 
      00A90C A1               [ 1] 3773 	ld a,xl 
      00A90D 02 27 03         [ 1] 3774 	xor a,seedx+1 
      00A910 CC 96 C8         [ 1] 3775 	ld acc8,a 
                                   3776 ; seedx=seedy 
      00A913 90 E6 03         [ 2] 3777 	ldw x,seedy 
      00A916 93 EE 04         [ 2] 3778 	ldw seedx,x  
                                   3779 ; seedy=seedy^(seedy>>1)
      00A919 5D 2B            [ 2] 3780 	srlw y 
      00A91B 23 A3            [ 1] 3781 	ld a,yh 
      00A91D 00 09 2A         [ 1] 3782 	xor a,seedy 
      00A920 1E A6 05         [ 1] 3783 	ld seedy,a  
      00A923 42 1C            [ 1] 3784 	ld a,yl 
      00A925 50 00 89         [ 1] 3785 	xor a,seedy+1 
      00A928 90 F6 93         [ 1] 3786 	ld seedy+1,a 
                                   3787 ; acc16>>3 
      00A92B EE 01 72         [ 2] 3788 	ldw x,acc16 
      00A92E A9               [ 2] 3789 	srlw x 
      00A92F 00               [ 2] 3790 	srlw x 
      00A930 03               [ 2] 3791 	srlw x 
                                   3792 ; x=acc16^x 
      00A931 72               [ 1] 3793 	ld a,xh 
      00A932 FB 01 5B         [ 1] 3794 	xor a,acc16 
      00A935 02               [ 1] 3795 	ld xh,a 
      00A936 4F               [ 1] 3796 	ld a,xl 
      00A937 90 F7 90         [ 1] 3797 	xor a,acc8 
      00A93A EF               [ 1] 3798 	ld xl,a 
                                   3799 ; seedy=x^seedy 
      00A93B 01 A6 84         [ 1] 3800 	xor a,seedy+1
      00A93E 81               [ 1] 3801 	ld xl,a 
      00A93F 9E               [ 1] 3802 	ld a,xh 
      00A93F A6 0A CC         [ 1] 3803 	xor a,seedy
      00A942 96               [ 1] 3804 	ld xh,a 
      00A943 CA 00 15         [ 2] 3805 	ldw seedy,x 
                                   3806 ; return seedy modulo expr + 1 
      00A944 C6 00 14         [ 1] 3807 	ld a,seedx+1 
      002BB3                       3808 	_xpush 
      00A944 CE B6 00 A3      [ 2]    1     subw y,#CELL_SIZE
      00A948 10 93            [ 1]    2     ld (y),a 
      00A94A 27 08 CE         [ 2]    3     ldw (1,y),x 
      00A94D B6               [ 1] 3809 	pop a 
      00A94E 02               [ 2] 3810 	popw x 
      002BBE                       3811 	_xpush 
      00A94F 1C B6 04 20      [ 2]    1     subw y,#CELL_SIZE
      00A953 03 AE            [ 1]    2     ld (y),a 
      00A955 B6 00 4F         [ 2]    3     ldw (1,y),x 
      00A958 81 02 E5         [ 4] 3812 	call div24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A959                       3813 10$:
      00A959 89 90            [ 1] 3814 	ld a,#TK_INTGR
      00A95B 89               [ 4] 3815 	ret 
                                   3816 
                                   3817 ;---------------------------------
                                   3818 ; BASIC: WORDS 
                                   3819 ; affiche la listes des mots du
                                   3820 ; dictionnaire ainsi que le nombre
                                   3821 ; de mots.
                                   3822 ;---------------------------------
                           000001  3823 	WLEN=1 ; word length
                           000002  3824 	LLEN=2 ; character sent to console
                           000003  3825 	WCNT=3 ; count words printed 
                           000003  3826 	VSIZE=3 
      002BCD                       3827 words:
      002BCD                       3828 	_vars VSIZE
      00A95C CD 99            [ 2]    1     sub sp,#VSIZE 
      00A95E 7C A1            [ 1] 3829 	clr (LLEN,sp)
      00A960 01 27            [ 1] 3830 	clr (WCNT,sp)
      00A962 07 A1 02 27      [ 2] 3831 	ldw y,#kword_dict+2
      00A966 03               [ 1] 3832 0$:	ldw x,y
      00A967 CC               [ 1] 3833 	ld a,(x)
      00A968 96 C8            [ 1] 3834 	and a,#15 
      00A96A 88 90            [ 1] 3835 	ld (WLEN,sp),a 
      00A96C F6 93            [ 1] 3836 	inc (WCNT,sp)
      00A96E EE               [ 1] 3837 1$:	incw x 
      00A96F 01               [ 1] 3838 	ld a,(x)
      00A970 72 A9 00         [ 4] 3839 	call putc 
      00A973 03 90            [ 1] 3840 	inc (LLEN,sp)
      00A975 93 84            [ 1] 3841 	dec (WLEN,sp)
      00A977 A1 01            [ 1] 3842 	jrne 1$
      00A979 27 0A            [ 1] 3843 	ld a,#70
      00A97B 90 F6            [ 1] 3844 	cp a,(LLEN,sp)
      00A97D 93 EE            [ 1] 3845 	jrmi 2$   
      00A97F 01 72            [ 1] 3846 	ld a,#SPACE 
      00A981 A9 00 03         [ 4] 3847 	call putc 
      00A984 51 90            [ 1] 3848 	inc (LLEN,sp) 
      00A986 FD 88            [ 2] 3849 	jra 3$
      00A988 90 9F            [ 1] 3850 2$: ld a,#CR 
      00A98A 72 A2 00         [ 4] 3851 	call putc 
      00A98D 03 90            [ 1] 3852 	clr (LLEN,sp)
      00A98F F7 90 EF 01      [ 2] 3853 3$:	subw y,#2 
      00A993 84 90            [ 2] 3854 	ldw y,(y)
      00A995 85 85            [ 1] 3855 	jrne 0$ 
      00A997 81 0D            [ 1] 3856 	ld a,#CR 
      00A998 CD 08 FD         [ 4] 3857 	call putc  
      00A998 72               [ 1] 3858 	clrw x 
      00A999 0D 52            [ 1] 3859 	ld a,(WCNT,sp)
      00A99B 30               [ 1] 3860 	ld xl,a 
      00A99C FB 8E CC         [ 4] 3861 	call prt_i16 
      00A99F 81 32 1D         [ 2] 3862 	ldw x,#words_count_msg
      00A9A1 CD 09 5A         [ 4] 3863 	call puts 
      002C1A                       3864 	_drop VSIZE 
      00A9A1 72 0D            [ 2]    1     addw sp,#VSIZE 
      00A9A3 52               [ 4] 3865 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A9A4 30 FB 72 16 00 22 8E  3866 words_count_msg: .asciz " words in dictionary\n"
             81 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3867 
                                   3868 
                                   3869 ;-----------------------------
                                   3870 ; BASIC: TIMER expr 
                                   3871 ; initialize count down timer 
                                   3872 ;-----------------------------
      00A9AC                       3873 set_timer:
      00A9AC CD 9A B8         [ 4] 3874 	call arg_list
      00A9AF A1 84            [ 1] 3875 	cp a,#1 
      00A9B1 27 03            [ 1] 3876 	jreq 1$
      00A9B3 CC 96 C8         [ 2] 3877 	jp syntax_error
      002C3D                       3878 1$: 
      002C3D                       3879 	_xpop  
      00A9B6 90 F6            [ 1]    1     ld a,(y)
      00A9B8 93               [ 1]    2     ldw x,y 
      00A9B9 EE 01            [ 2]    3     ldw x,(1,x)
      00A9BB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A9BF CF 00 11         [ 2] 3880 	ldw timer,x 
      00A9BF CF               [ 4] 3881 	ret 
                                   3882 
                                   3883 ;------------------------------
                                   3884 ; BASIC: TIMEOUT 
                                   3885 ; return state of timer 
                                   3886 ;------------------------------
      002C4A                       3887 timeout:
      00A9C0 00 12 CE         [ 2] 3888 	ldw x,timer 
      002C4D                       3889 logical_complement:
      00A9C3 00 12            [ 1] 3890 	ld a,#255 
      00A9C5 5D               [ 2] 3891 	cplw x 
      00A9C6 27 03 8F         [ 2] 3892 	cpw x,#-1
      00A9C9 26 F7            [ 1] 3893 	jreq 2$
      00A9CB 4F               [ 1] 3894 	clrw x
      00A9CC 81               [ 1] 3895 	clr a 
      00A9CD                       3896 2$:	_xpush  
      00A9CD CD 9A B8 A1      [ 2]    1     subw y,#CELL_SIZE
      00A9D1 84 27            [ 1]    2     ld (y),a 
      00A9D3 03 CC 96         [ 2]    3     ldw (1,y),x 
      00A9D6 C8 90            [ 1] 3897 	ld a,#TK_INTGR
      00A9D8 F6               [ 4] 3898 	ret 
                                   3899 
                                   3900 ;--------------------------------
                                   3901 ; BASIC NOT(expr) 
                                   3902 ; return logical complement of expr
                                   3903 ;--------------------------------
      002C63                       3904 func_not:
      00A9D9 93 EE 01         [ 4] 3905 	call func_args  
      00A9DC 72 A9            [ 1] 3906 	cp a,#1
      00A9DE 00 03            [ 1] 3907 	jreq 1$
      00A9E0 CC 16 48         [ 2] 3908 	jp syntax_error
      002C6D                       3909 1$:  
      00A9E0 A3 14 00         [ 4] 3910 	call cpl24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A9E3 2B 0C            [ 1] 3911 	ld a,#TK_INTGR
      00A9E5 35               [ 4] 3912 	ret 
                                   3913 
                                   3914 
                                   3915 
                                   3916 ;-----------------------------------
                                   3917 ; BASIC: IWDGEN expr1 
                                   3918 ; enable independant watchdog timer
                                   3919 ; expr1 is delay in multiple of 62.5µsec
                                   3920 ; expr1 -> {1..16383}
                                   3921 ;-----------------------------------
      002C73                       3922 enable_iwdg:
      00A9E6 0F 50 F2         [ 4] 3923 	call arg_list
      00A9E9 A6 1E            [ 1] 3924 	cp a,#1 
      00A9EB 62 A6            [ 1] 3925 	jreq 1$
      00A9ED 10 62 20         [ 2] 3926 	jp syntax_error 
      002C7D                       3927 1$: _xpop  
      00A9F0 1E F6            [ 1]    1     ld a,(y)
      00A9F1 93               [ 1]    2     ldw x,y 
      00A9F1 A3 08            [ 2]    3     ldw x,(1,x)
      00A9F3 00 2B 09 35      [ 2]    4     addw y,#CELL_SIZE 
      00A9F7 0E 50            [ 1] 3928 	push #0
      00A9F9 F2 A6 50 62      [ 1] 3929 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A9FD 20               [ 1] 3930 	ld a,xh 
      00A9FE 10 3F            [ 1] 3931 	and a,#0x3f
      00A9FF 95               [ 1] 3932 	ld xh,a  
      00A9FF 35 07 50         [ 2] 3933 2$:	cpw x,#255
      00AA02 F2 06            [ 2] 3934 	jrule 3$
      00AA03 0C 01            [ 1] 3935 	inc (1,sp)
      00AA03 A3               [ 1] 3936 	rcf 
      00AA04 00               [ 2] 3937 	rrcw x 
      00AA05 40 23            [ 2] 3938 	jra 2$
      00AA07 07 72 5C 50      [ 1] 3939 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AA0B F2               [ 1] 3940 	pop a  
      00AA0C 54 20 F4         [ 1] 3941 	ld IWDG_PR,a 
      00AA0F 9F               [ 1] 3942 	ld a,xl
      00AA0F 9F               [ 1] 3943 	dec a 
      00AA10 4A 27 01 4A      [ 1] 3944 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AA14 C7 50 E2         [ 1] 3945 	ld IWDG_RLR,a 
      00AA14 A4 3E C7 50      [ 1] 3946 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00AA18 F1               [ 4] 3947 	ret 
                                   3948 
                                   3949 
                                   3950 ;-----------------------------------
                                   3951 ; BASIC: IWDGREF  
                                   3952 ; refresh independant watchdog count down 
                                   3953 ; timer before it reset MCU. 
                                   3954 ;-----------------------------------
      002CB1                       3955 refresh_iwdg:
      00AA19 72 18 50 F0      [ 1] 3956 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00AA1D 8E               [ 4] 3957 	ret 
                                   3958 
                                   3959 
                                   3960 ;-------------------------------------
                                   3961 ; BASIC: LOG(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3962 ; return logarithm base 2 of expr 
                                   3963 ; this is the position of most significant
                                   3964 ; bit set. 
                                   3965 ; input: 
                                   3966 ; output:
                                   3967 ;   A     TK_INTGR 
                                   3968 ;   xstack log2 
                                   3969 ;*********************************
      002CB6                       3970 log2:
      00AA1E 81 18 FC         [ 4] 3971 	call func_args 
      00AA1F A1 01            [ 1] 3972 	cp a,#1 
      00AA1F CE 00            [ 1] 3973 	jreq 1$
      00AA21 10 4F 72         [ 2] 3974 	jp syntax_error 
      002CC0                       3975 1$: _at_top   
      00AA24 A2 00            [ 1]    1     ld a,(y)
      00AA26 03               [ 1]    2     ldw x,y 
      00AA27 90 F7            [ 2]    3     ldw x,(1,x)
      002CC5                       3976 leading_one:
      00AA29 90               [ 1] 3977 	tnz a
      00AA2A EF 01            [ 1] 3978 	jrne 2$ 
      00AA2C A6               [ 2] 3979 	tnzw x 
      00AA2D 84 81            [ 1] 3980 	jrne 2$
      00AA2F 4C               [ 1] 3981 	inc a  
      00AA2F CD 99            [ 2] 3982 	jra 9$
      00AA31 7C A1            [ 1] 3983 2$:	push #24  
      00AA33 01               [ 2] 3984 3$: rlcw x 
      00AA34 27               [ 1] 3985     rlc a 
      00AA35 03 CC            [ 1] 3986 	jrc 4$
      00AA37 96 C8            [ 1] 3987 	dec (1,sp) 
      00AA39 26 F8            [ 1] 3988 	jrne 3$
      00AA39 CD               [ 1] 3989 4$: clrw x 
      00AA3A 82               [ 1] 3990     pop a 
      00AA3B 23               [ 1] 3991 	ld xl,a 
      00AA3C A6               [ 1] 3992 	clr a 
      002CDC                       3993 9$:	_store_top 
      00AA3D 84 81            [ 1]    1     ld (y),a 
      00AA3F 90 EF 01         [ 2]    2     ldw (1,y),x     
      00AA3F CD 99            [ 1] 3994 	ld a,#TK_INTGR
      00AA41 7C               [ 4] 3995 	ret 
                                   3996 
                                   3997 ;-----------------------------------
                                   3998 ; BASIC: BIT(expr) 
                                   3999 ; expr ->{0..15}
                                   4000 ; return 2^expr 
                                   4001 ; output:
                                   4002 ;    x    2^expr 
                                   4003 ;-----------------------------------
      002CE4                       4004 bitmask:
      00AA42 A1 02 27         [ 4] 4005     call func_args 
      00AA45 03 CC            [ 1] 4006 	cp a,#1
      00AA47 96 C8            [ 1] 4007 	jreq 1$
      00AA49 90 F6 93         [ 2] 4008 	jp syntax_error 
      002CEE                       4009 1$: _xpop 
      00AA4C EE 01            [ 1]    1     ld a,(y)
      00AA4E 72               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00AA4F A9 00            [ 2]    3     ldw x,(1,x)
      00AA51 03 89 88 90      [ 2]    4     addw y,#CELL_SIZE 
      00AA55 F6               [ 1] 4010 	ld a,xl 
      00AA56 93 EE            [ 1] 4011 	and a,#15
      00AA58 01               [ 1] 4012 	clrw x 
      00AA59 14               [ 1] 4013 	incw x 
      00AA5A 01               [ 1] 4014 2$: tnz a 
      00AA5B 02 14            [ 1] 4015 	jreq 3$
      00AA5D 02               [ 2] 4016 	slaw x 
      00AA5E 02               [ 1] 4017 	dec a 
      00AA5F 14 03            [ 1] 4018 	jrne 2$ 
      002D03                       4019 3$: 
      00AA61 02               [ 4] 4020 	ret 
                                   4021 
                                   4022 ;------------------------------
                                   4023 ; BASIC: INVERT(expr)
                                   4024 ; 1's complement 
                                   4025 ;--------------------------------
      002D04                       4026 invert:
      00AA62 5B 03 90         [ 4] 4027 	call func_args
      00AA65 F7 90            [ 1] 4028 	cp a,#1 
      00AA67 EF 01            [ 1] 4029 	jreq 1$
      00AA69 A6 84 81         [ 2] 4030 	jp syntax_error
      00AA6C                       4031 1$: _xpop 
      00AA6C CD 99            [ 1]    1     ld a,(y)
      00AA6E 7C               [ 1]    2     ldw x,y 
      00AA6F A1 02            [ 2]    3     ldw x,(1,x)
      00AA71 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00AA75 C8               [ 1] 4032 	cpl a 
      00AA76 90               [ 2] 4033 	cplw x 
      00AA77 F6               [ 4] 4034 	ret 
                                   4035 
                                   4036 ;------------------------------
                                   4037 ; BASIC: DO 
                                   4038 ; initiate a DO ... UNTIL loop 
                                   4039 ;------------------------------
                           000003  4040 	DOLP_ADR=3 
                           000005  4041 	DOLP_INW=5
                           000004  4042 	VSIZE=4 
      002D1A                       4043 do_loop:
      00AA78 93               [ 2] 4044 	popw x 
      002D1B                       4045 	_vars VSIZE 
      00AA79 EE 01            [ 2]    1     sub sp,#VSIZE 
      00AA7B 72               [ 2] 4046 	pushw x 
      00AA7C A9 00 03 89      [ 2] 4047 	ldw y,basicptr 
      00AA80 88 90            [ 2] 4048 	ldw (DOLP_ADR,sp),y
      00AA82 F6 93 EE         [ 2] 4049 	ldw x,in.w 
      00AA85 01 1A            [ 2] 4050 	ldw (DOLP_INW,sp),x
      00AA87 01 90 97 9E      [ 1] 4051 	inc loop_depth 
      00AA8B 1A               [ 4] 4052 	ret 
                                   4053 
                                   4054 ;--------------------------------
                                   4055 ; BASIC: UNTIL expr 
                                   4056 ; loop if exprssion is false 
                                   4057 ; else terminate loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4058 ;--------------------------------
      002D2E                       4059 until: 
      00AA8C 02 95 9F 1A      [ 1] 4060 	tnz loop_depth 
      00AA90 03 97            [ 1] 4061 	jrne 1$ 
      00AA92 90 9F 5B         [ 2] 4062 	jp syntax_error 
      002D37                       4063 1$: 
      00AA95 03 90 F7         [ 4] 4064 	call relation 
      00AA98 90 EF            [ 1] 4065 	cp a,#TK_INTGR
      00AA9A 01 A6            [ 1] 4066 	jreq 2$
      00AA9C 84 81 48         [ 2] 4067 	jp syntax_error
      00AA9E                       4068 2$: 
      002D41                       4069 	_xpop
      00AA9E CD 99            [ 1]    1     ld a,(y)
      00AAA0 7C               [ 1]    2     ldw x,y 
      00AAA1 A1 02            [ 2]    3     ldw x,(1,x)
      00AAA3 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00AAA7 C8               [ 1] 4070 	tnz a 
      00AAA8 90 F6            [ 1] 4071 	jrne 9$ 
      00AAAA 93               [ 2] 4072 	tnzw x   
      00AAAB EE 01            [ 1] 4073 	jrne 9$
      00AAAD 72 A9            [ 2] 4074 	ldw x,(DOLP_ADR,sp)
      00AAAF 00 03 89         [ 2] 4075 	ldw basicptr,x 
      00AAB2 88 90            [ 1] 4076 	ld a,(2,x)
      00AAB4 F6 93 EE         [ 1] 4077 	ld count,a 
      00AAB7 01 18            [ 2] 4078 	ldw x,(DOLP_INW,sp)
      00AAB9 01 90 97         [ 2] 4079 	ldw in.w,x 
      00AABC 9E               [ 4] 4080 	ret 
      002D60                       4081 9$:	; remove loop data from stack  
      00AABD 18               [ 2] 4082 	popw x
      002D61                       4083 	_drop VSIZE
      00AABE 02 95            [ 2]    1     addw sp,#VSIZE 
      00AAC0 9F 18 03 97      [ 1] 4084 	dec loop_depth 
      00AAC4 90               [ 2] 4085 	jp (x)
                                   4086 
                                   4087 ;--------------------------
                                   4088 ; BASIC: PRTA...PRTI  
                                   4089 ;  return constant value 
                                   4090 ;  PORT  offset in GPIO
                                   4091 ;  array
                                   4092 ;---------------------------
      002D68                       4093 const_porta:
      00AAC5 9F 5B 03         [ 2] 4094 	ldw x,#0
      00AAC8 90 F7            [ 1] 4095 	ld a,#TK_INTGR 
      00AACA 90               [ 4] 4096 	ret 
      002D6E                       4097 const_portb:
      00AACB EF 01 A6         [ 2] 4098 	ldw x,#1
      00AACE 84 81            [ 1] 4099 	ld a,#TK_INTGR 
      00AAD0 81               [ 4] 4100 	ret 
      002D74                       4101 const_portc:
      00AAD0 CD 99 7C         [ 2] 4102 	ldw x,#2
      00AAD3 A1 02            [ 1] 4103 	ld a,#TK_INTGR 
      00AAD5 27               [ 4] 4104 	ret 
      002D7A                       4105 const_portd:
      00AAD6 03 CC 96         [ 2] 4106 	ldw x,#3
      00AAD9 C8 90            [ 1] 4107 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00AADB F6               [ 4] 4108 	ret 
      002D80                       4109 const_porte:
      00AADC 93 EE 01         [ 2] 4110 	ldw x,#4
      00AADF 72 A9            [ 1] 4111 	ld a,#TK_INTGR 
      00AAE1 00               [ 4] 4112 	ret 
      002D86                       4113 const_portf:
      00AAE2 03 90 93         [ 2] 4114 	ldw x,#5
      00AAE5 90 F6            [ 1] 4115 	ld a,#TK_INTGR 
      00AAE7 93               [ 4] 4116 	ret 
      002D8C                       4117 const_portg:
      00AAE8 EE 01 90         [ 2] 4118 	ldw x,#6
      00AAEB 5D 27            [ 1] 4119 	ld a,#TK_INTGR 
      00AAED 07               [ 4] 4120 	ret 
      002D92                       4121 const_porth:
      00AAEE 98 59 49         [ 2] 4122 	ldw x,#7
      00AAF1 90 5A            [ 1] 4123 	ld a,#TK_INTGR 
      00AAF3 26               [ 4] 4124 	ret 
      002D98                       4125 const_porti:
      00AAF4 F9 90 F7         [ 2] 4126 	ldw x,#8
      00AAF7 90 EF            [ 1] 4127 	ld a,#TK_INTGR 
      00AAF9 01               [ 4] 4128 	ret 
                                   4129 
                                   4130 ;-------------------------------
                                   4131 ; following return constant 
                                   4132 ; related to GPIO register offset 
                                   4133 ;---------------------------------
      002D9E                       4134 const_odr:
      00AAFA A6 84            [ 1] 4135 	ld a,#TK_INTGR 
      00AAFC 81 00 00         [ 2] 4136 	ldw x,#GPIO_ODR
      00AAFD 81               [ 4] 4137 	ret 
      002DA4                       4138 const_idr:
      00AAFD CD 99            [ 1] 4139 	ld a,#TK_INTGR 
      00AAFF 7C A1 02         [ 2] 4140 	ldw x,#GPIO_IDR
      00AB02 27               [ 4] 4141 	ret 
      002DAA                       4142 const_ddr:
      00AB03 03 CC            [ 1] 4143 	ld a,#TK_INTGR 
      00AB05 96 C8 90         [ 2] 4144 	ldw x,#GPIO_DDR
      00AB08 F6               [ 4] 4145 	ret 
      002DB0                       4146 const_cr1:
      00AB09 93 EE            [ 1] 4147 	ld a,#TK_INTGR 
      00AB0B 01 72 A9         [ 2] 4148 	ldw x,#GPIO_CR1
      00AB0E 00               [ 4] 4149 	ret 
      002DB6                       4150 const_cr2:
      00AB0F 03 90            [ 1] 4151 	ld a,#TK_INTGR 
      00AB11 93 90 F6         [ 2] 4152 	ldw x,#GPIO_CR2
      00AB14 93               [ 4] 4153 	ret 
                                   4154 ;-------------------------
                                   4155 ; BASIC: POUT 
                                   4156 ;  constant for port mode
                                   4157 ;  used by PMODE 
                                   4158 ;  to set pin as output
                                   4159 ;------------------------
      002DBC                       4160 const_output:
      00AB15 EE 01            [ 1] 4161 	ld a,#TK_INTGR 
      00AB17 90 5D 27         [ 2] 4162 	ldw x,#OUTP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00AB1A 07               [ 4] 4163 	ret 
                                   4164 
                                   4165 ;-------------------------
                                   4166 ; BASIC: PINP 
                                   4167 ;  constant for port mode
                                   4168 ;  used by PMODE 
                                   4169 ;  to set pin as input
                                   4170 ;------------------------
      002DC2                       4171 const_input:
      00AB1B 98 56            [ 1] 4172 	ld a,#TK_INTGR 
      00AB1D 46 90 5A         [ 2] 4173 	ldw x,#INP 
      00AB20 26               [ 4] 4174 	ret 
                                   4175 	
                                   4176 ;-----------------------
                                   4177 ; memory area constants
                                   4178 ;-----------------------
      002DC8                       4179 const_eeprom_base:
      00AB21 F9 90            [ 1] 4180 	ld a,#TK_INTGR 
      00AB23 F7 90 EF         [ 2] 4181 	ldw x,#EEPROM_BASE 
      00AB26 01               [ 4] 4182 	ret 
                                   4183 
                                   4184 ;---------------------------
                                   4185 ; BASIC: DATA 
                                   4186 ; when the interpreter find 
                                   4187 ; a DATA line it skip it.
                                   4188 ;---------------------------
      002DCE                       4189 data:
      00AB27 A6 84 81 00 01   [ 1] 4190 	mov in,count 
      00AB2A 81               [ 4] 4191 	ret 
                                   4192 
                                   4193 ;------------------------------
                                   4194 ; check if it is a DATA line 
                                   4195 ; input: 
                                   4196 ;    X    line address 
                                   4197 ; output:
                                   4198 ;    Z    set if DATA line 
                                   4199 ;----------------------------
      002DD4                       4200 is_data_line:
      00AB2A A6 84            [ 2] 4201 	ldw x,(4,x)
      00AB2C CD 99 6F         [ 2] 4202 	ldw x,(code_addr,x)
      00AB2F CD 98 07         [ 2] 4203 	cpw x,#data 
      00AB32 9F               [ 4] 4204 	ret 
                                   4205 
                                   4206 ;---------------------------
                                   4207 ; set DATA pointer at line# 
                                   4208 ; specified by X 
                                   4209 ;---------------------------
      002DDD                       4210 data_line:
      00AB33 A4               [ 1] 4211     clr a 
      00AB34 07 C7 50         [ 4] 4212 	call search_lineno
      00AB37 C6               [ 2] 4213 	tnzw x 
      00AB38 81 05            [ 1] 4214 	jrne 3$
      00AB39 A6 05            [ 1] 4215 2$:	ld a,#ERR_NO_LINE 
      00AB39 52 01 CD         [ 2] 4216 	jp tb_error
      002DE9                       4217 3$: ; check if valid data line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00AB3C 99 81            [ 1] 4218     ldw y,x 
      00AB3E A1 02 27         [ 4] 4219 	call is_data_line 
      00AB41 03 CC            [ 1] 4220 	jrne 2$ 
      002DF0                       4221 set_data_ptr: 	
      00AB43 96 C8 90 F6      [ 2] 4222 	ldw data_ptr,y
      00AB47 93 EE 01         [ 1] 4223 	ld a,(2,y)
      00AB4A 72 A9 00         [ 1] 4224 	ld data_len,a 
      00AB4D 03 90 93 90      [ 1] 4225 	mov data_ofs,#FIRST_DATA_ITEM 
      00AB51 F6               [ 4] 4226 	ret
                                   4227 
                                   4228 ;---------------------------------
                                   4229 ; BASIC: RESTORE [line#]
                                   4230 ; set data_ptr to first data line
                                   4231 ; if no DATA found pointer set to
                                   4232 ; zero.
                                   4233 ; if a line# is given as argument 
                                   4234 ; a data line with that number 
                                   4235 ; is searched and the data pointer 
                                   4236 ; is set to it. If there is no 
                                   4237 ; data line with that number 
                                   4238 ; the program is interrupted. 
                                   4239 ;---------------------------------
      002DFF                       4240 restore:
      00AB52 93 EE 01 72      [ 1] 4241 	clr data_ptr 
      00AB56 A9 00 03 CD      [ 1] 4242 	clr data_ptr+1
      00AB5A AB 96 6B 01      [ 1] 4243 	clr data_ofs 
      00AB5E A6 01 0D 01      [ 1] 4244 	clr data_len
      00AB62 27 0D 48         [ 4] 4245 	call next_token 
      00AB65 0A 01            [ 1] 4246 	cp a,#TK_INTGR
      00AB67 26 FB            [ 1] 4247 	jreq data_line
      002E16                       4248 	_unget_token 
      00AB69 6B 01 7B 01 EA   [ 1]    1      mov in,in.saved  
      00AB6E 03 E7 03         [ 2] 4249 	ldw x,txtbgn
                                   4250 ; search first DATA line 
      002E1E                       4251 data_search_loop: 	
      00AB71 90 A3 00         [ 2] 4252 	cpw x,txtend
      00AB74 01 27            [ 1] 4253 	jruge restore_error 
      00AB76 10 7B            [ 1] 4254 	ldw y,x 
      00AB78 01 43 E4         [ 4] 4255 	call is_data_line 
      00AB7B 04 E7            [ 1] 4256 	jreq set_data_ptr
      002E2A                       4257 try_next_line: 
      00AB7D 04               [ 1] 4258 	ldw x,y 
      00AB7E 7B 01            [ 1] 4259 	ld a,(2,x)
      00AB80 43 E4 02         [ 1] 4260 	ld acc8,a 
      00AB83 E7 02 20 0C      [ 1] 4261 	clr acc16 
      00AB87 72 BB 00 0D      [ 2] 4262 	addw x,acc16 
      00AB87 7B 01            [ 2] 4263 	jra data_search_loop
      002E3A                       4264 restore_error:	
      00AB89 EA 02            [ 1] 4265     ld a,#ERR_NO_DATA 
      00AB8B E7 02 7B         [ 2] 4266 	jp tb_error 
                                   4267 
                                   4268 
                                   4269 ;---------------------------------
                                   4270 ; BASIC: READ 
                                   4271 ; return next data item | 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4272 ;---------------------------------
                           000001  4273 	CTX_BPTR=1 
                           000003  4274 	CTX_IN=3 
                           000004  4275 	CTX_COUNT=4 
                           000005  4276 	XSAVE=5
                           000006  4277 	VSIZE=6
      002E3F                       4278 read:
      002E3F                       4279 	_vars  VSIZE 
      00AB8E 01 EA            [ 2]    1     sub sp,#VSIZE 
      002E41                       4280 read01:	
      00AB90 04 E7 04         [ 1] 4281 	ld a,data_ofs
      00AB93 C1 00 09         [ 1] 4282 	cp a,data_len 
      00AB93 5B 01            [ 1] 4283 	jreq 2$ ; end of line  
      00AB95 81 1F 96         [ 4] 4284 	call save_context
      00AB96 CE 00 06         [ 2] 4285 	ldw x,data_ptr 
      00AB96 58 1C AB         [ 2] 4286 	ldw basicptr,x 
      00AB99 A6 FE 9F 88 5E   [ 1] 4287 	mov in,data_ofs 
      00AB9E A6 05 42 1C 50   [ 1] 4288 	mov count,data_len  
      00ABA3 00 84 81         [ 4] 4289 	call expression 
      00ABA6 A1 84            [ 1] 4290 	cp a,#TK_INTGR 
      00ABA6 03 06            [ 1] 4291 	jreq 1$ 
      00ABA8 03 05 04         [ 2] 4292 	jp syntax_error 
      002E66                       4293 1$:
      00ABAB 00 02            [ 2] 4294 	ldw (XSAVE,SP),x
      00ABAD 01 06 00         [ 4] 4295 	call next_token ; skip comma
      00ABB0 02 02 02         [ 2] 4296 	ldw x,basicptr 
      00ABB3 03 03 01         [ 2] 4297 	ldw data_ptr,x 
      00ABB6 03 03 02 04 04   [ 1] 4298 	mov data_ofs,in 
      00ABBB 05 02 06         [ 4] 4299 	call rest_context
      00ABBE 02 07            [ 2] 4300 	ldw x,(XSAVE,sp)
      00ABC0 02 05            [ 1] 4301 	ld a,#TK_INTGR
      002E7D                       4302 	_drop VSIZE 
      00ABC2 04 02            [ 2]    1     addw sp,#VSIZE 
      00ABC4 04               [ 4] 4303 	ret 
      002E80                       4304 2$: ; end of line reached 
      00ABC5 01 CE 00 06      [ 2] 4305 	ldw y, data_ptr 
      00ABC6 72 5F 00 06      [ 1] 4306 	clr data_ptr
      00ABC6 CD 99 7C A1      [ 1] 4307 	clr data_ptr+1   
      00ABCA 01 27 03 CC      [ 1] 4308 	clr data_ofs 
      00ABCE 96 C8 00 09      [ 1] 4309 	clr data_len 
      00ABD0 CD 2E 2A         [ 4] 4310 	call try_next_line 
      00ABD0 90 F6            [ 2] 4311 	jra read01
                                   4312 
                                   4313 
                                   4314 ;---------------------------------
                                   4315 ; BASIC: SPIEN clkdiv, 0|1  
                                   4316 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4317 ; if clkdiv==-1 disable SPI
                                   4318 ; 0|1 -> disable|enable  
                                   4319 ;--------------------------------- 
                           000005  4320 SPI_CS_BIT=5
      002E99                       4321 spi_enable:
      00ABD2 93 EE 01         [ 4] 4322 	call arg_list 
      00ABD5 72 A9            [ 1] 4323 	cp a,#2
      00ABD7 00 03            [ 1] 4324 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00ABD9 89 88 A6         [ 2] 4325 	jp syntax_error 
      002EA3                       4326 1$: 
      00ABDC 80 15 01 27      [ 1] 4327 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00ABE0 05               [ 2] 4328 	popw x  
      00ABE1 A6               [ 2] 4329 	tnzw x 
      00ABE2 0A CC            [ 1] 4330 	jreq spi_disable 
      00ABE4 96               [ 2] 4331 	popw x 
      00ABE5 CA 08            [ 1] 4332 	ld a,#(1<<SPI_CR1_BR)
      00ABE6 42               [ 4] 4333 	mul x,a 
      00ABE6 CE               [ 1] 4334 	ld a,xl 
      00ABE7 00 14 58         [ 1] 4335 	ld SPI_CR1,a 
                                   4336 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00ABEA 58 58 58 58      [ 1] 4337 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00ABEE 9E C8 00 14      [ 1] 4338 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4339 ; configure SPI as master mode 0.	
      00ABF2 C7 00 0E 9F      [ 1] 4340 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4341 ; ~CS line controlled by sofware 	
      00ABF6 C8 00 15 C7      [ 1] 4342 	bset SPI_CR2,#SPI_CR2_SSM 
      00ABFA 00 0F CE 00      [ 1] 4343     bset SPI_CR2,#SPI_CR2_SSI 
                                   4344 ; enable SPI
      00ABFE 16 CF 00 14      [ 1] 4345 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AC02 90               [ 4] 4346 	ret 
      002ECC                       4347 spi_disable:
      002ECC                       4348 	_drop #2; throw first argument.
      00AC03 54 90            [ 2]    1     addw sp,##2 
                                   4349 ; wait spi idle 
      00AC05 9E C8            [ 1] 4350 1$:	ld a,#0x82 
      00AC07 00 16 C7         [ 1] 4351 	and a,SPI_SR
      00AC0A 00 16            [ 1] 4352 	cp a,#2 
      00AC0C 90 9F            [ 1] 4353 	jrne 1$
      00AC0E C8 00 17 C7      [ 1] 4354 	bres SPI_CR1,#SPI_CR1_SPE
      00AC12 00 17 CE 00      [ 1] 4355 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00AC16 0E 54 54 54      [ 1] 4356 	bres PE_DDR,#SPI_CS_BIT 
      00AC1A 9E               [ 4] 4357 	ret 
                                   4358 
      002EE4                       4359 spi_clear_error:
      00AC1B C8 00            [ 1] 4360 	ld a,#0x78 
      00AC1D 0E 95 9F         [ 1] 4361 	bcp a,SPI_SR 
      00AC20 C8 00            [ 1] 4362 	jreq 1$
      00AC22 0F 97 C8 00      [ 1] 4363 	clr SPI_SR 
      00AC26 17               [ 4] 4364 1$: ret 
                                   4365 
      002EF0                       4366 spi_send_byte:
      00AC27 97               [ 1] 4367 	push a 
      00AC28 9E C8 00         [ 4] 4368 	call spi_clear_error
      00AC2B 16               [ 1] 4369 	pop a 
      00AC2C 95 CF 00 16 C6   [ 2] 4370 	btjf SPI_SR,#SPI_SR_TXE,.
      00AC31 00 15 72         [ 1] 4371 	ld SPI_DR,a
      00AC34 A2 00 03 90 F7   [ 2] 4372 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AC39 90 EF 01         [ 1] 4373 	ld a,SPI_DR 
      00AC3C 84               [ 4] 4374 	ret 
                                   4375 
      002F06                       4376 spi_rcv_byte:
      00AC3D 85 72            [ 1] 4377 	ld a,#255
      00AC3F A2 00 03 90 F7   [ 2] 4378 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00AC44 90 EF 01         [ 1] 4379 	ld a,SPI_DR 
      00AC47 CD               [ 4] 4380 	ret
                                   4381 
                                   4382 ;------------------------------
                                   4383 ; BASIC: SPIWR byte [,byte]
                                   4384 ; write 1 or more byte
                                   4385 ;------------------------------
      002F11                       4386 spi_write:
      00AC48 83 65 38         [ 4] 4387 	call expression
      00AC4A A1 84            [ 1] 4388 	cp a,#TK_INTGR 
      00AC4A A6 84            [ 1] 4389 	jreq 1$
      00AC4C 81 16 48         [ 2] 4390 	jp syntax_error 
      00AC4D                       4391 1$:	
      00AC4D 52               [ 1] 4392 	ld a,xl 
      00AC4E 03 0F 02         [ 4] 4393 	call spi_send_byte 
      00AC51 0F 03 90         [ 4] 4394 	call next_token 
      00AC54 AE B3            [ 1] 4395 	cp a,#TK_COMMA 
      00AC56 70 93            [ 1] 4396 	jrne 2$ 
      00AC58 F6 A4            [ 2] 4397 	jra spi_write 
      00AC5A 0F               [ 1] 4398 2$:	tnz a 
      00AC5B 6B 01            [ 1] 4399 	jreq 3$
      002F2B                       4400 	_unget_token  
      00AC5D 0C 03 5C F6 CD   [ 1]    1      mov in,in.saved  
      00AC62 89               [ 4] 4401 3$:	ret 
                                   4402 
                                   4403 
                                   4404 ;-------------------------------
                                   4405 ; BASIC: SPIRD 	
                                   4406 ; read one byte from SPI 
                                   4407 ;-------------------------------
      002F31                       4408 spi_read:
      00AC63 7D 0C 02         [ 4] 4409 	call spi_rcv_byte 
      00AC66 0A               [ 1] 4410 	clrw x 
      00AC67 01               [ 1] 4411 	ld xl,a 
      00AC68 26 F5            [ 1] 4412 	ld a,#TK_INTGR 
      00AC6A A6               [ 4] 4413 	ret 
                                   4414 
                                   4415 ;------------------------------
                                   4416 ; BASIC: SPISEL 0|1 
                                   4417 ; set state of ~CS line
                                   4418 ; 0|1 deselect|select  
                                   4419 ;------------------------------
      002F39                       4420 spi_select:
      00AC6B 46 11 02         [ 4] 4421 	call next_token 
      00AC6E 2B 09            [ 1] 4422 	cp a,#TK_INTGR 
      00AC70 A6 20            [ 1] 4423 	jreq 1$
      00AC72 CD 89 7D         [ 2] 4424 	jp syntax_error 
      00AC75 0C               [ 2] 4425 1$: tnzw x  
      00AC76 02 20            [ 1] 4426 	jreq cs_high 
      00AC78 07 A6 0D CD      [ 1] 4427 	bres PE_ODR,#SPI_CS_BIT
      00AC7C 89               [ 4] 4428 	ret 
      002F4B                       4429 cs_high: 
      00AC7D 7D 0F 02 72      [ 1] 4430 	bset PE_ODR,#SPI_CS_BIT
      00AC81 A2               [ 4] 4431 	ret 
                                   4432 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4433 ;-------------------------------
                                   4434 ; BASIC: PAD 
                                   4435 ; Return pad buffer address.
                                   4436 ;------------------------------
      002F50                       4437 pad_ref:
      00AC82 00 02 90         [ 2] 4438 	ldw x,#pad 
      00AC85 FE 26            [ 1] 4439 	ld a,TK_INTGR
      00AC87 CF               [ 4] 4440 	ret 
                                   4441 
                                   4442 
                                   4443 ;------------------------------
                                   4444 ;      dictionary 
                                   4445 ; format:
                                   4446 ;   link:   2 bytes 
                                   4447 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4448 ;   cmd_name: 16 byte max 
                                   4449 ;   cmd_index: 2 bytes 
                                   4450 ;------------------------------
                                   4451 	.macro _dict_entry len,name,cmd_idx 
                                   4452 	.word LINK 
                                   4453 	LINK=.
                                   4454 name:
                                   4455 	.byte len 	
                                   4456 	.ascii "name"
                                   4457 	.word cmd_idx 
                                   4458 	.endm 
                                   4459 
                           000000  4460 	LINK=0
                                   4461 ; respect alphabetic order for BASIC names from Z-A
                                   4462 ; this sort order is for a cleaner WORDS cmd output. 	
      002F56                       4463 kword_end:
      002F56                       4464 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00AC88 A6 0D                    1 	.word LINK 
                           002F58     2 	LINK=.
      002F58                          3 XOR:
      00AC8A CD                       4 	.byte 3+F_IFUNC 	
      00AC8B 89 7D 5F                 5 	.ascii "XOR"
      00AC8E 7B 03                    6 	.word XOR_IDX 
      002F5E                       4465 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00AC90 97 CD                    1 	.word LINK 
                           002F60     2 	LINK=.
      002F60                          3 WRITE:
      00AC92 98                       4 	.byte 5 	
      00AC93 1D AE AC 9D CD           5 	.ascii "WRITE"
      00AC98 89 DA                    6 	.word WRITE_IDX 
      002F68                       4466 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00AC9A 5B 03                    1 	.word LINK 
                           002F6A     2 	LINK=.
      002F6A                          3 WORDS:
      00AC9C 81                       4 	.byte 5 	
      00AC9D 20 77 6F 72 64           5 	.ascii "WORDS"
      00ACA2 73 20                    6 	.word WORDS_IDX 
      002F72                       4467 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00ACA4 69 6E                    1 	.word LINK 
                           002F74     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      002F74                          3 WAIT:
      00ACA6 20                       4 	.byte 4 	
      00ACA7 64 69 63 74              5 	.ascii "WAIT"
      00ACAB 69 6F                    6 	.word WAIT_IDX 
      002F7B                       4468 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00ACAD 6E 61                    1 	.word LINK 
                           002F7D     2 	LINK=.
      002F7D                          3 USR:
      00ACAF 72                       4 	.byte 3+F_IFUNC 	
      00ACB0 79 0A 00                 5 	.ascii "USR"
      00ACB3 00 B6                    6 	.word USR_IDX 
      002F83                       4469 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00ACB3 CD 99                    1 	.word LINK 
                           002F85     2 	LINK=.
      002F85                          3 UNTIL:
      00ACB5 81                       4 	.byte 5 	
      00ACB6 A1 01 27 03 CC           5 	.ascii "UNTIL"
      00ACBB 96 C8                    6 	.word UNTIL_IDX 
      00ACBD                       4470 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00ACBD 90 F6                    1 	.word LINK 
                           002F8F     2 	LINK=.
      002F8F                          3 UFLASH:
      00ACBF 93                       4 	.byte 6+F_IFUNC 	
      00ACC0 EE 01 72 A9 00 03        5 	.ascii "UFLASH"
      00ACC6 CF 00                    6 	.word UFLASH_IDX 
      002F98                       4471 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00ACC8 12 81                    1 	.word LINK 
                           002F9A     2 	LINK=.
      00ACCA                          3 UBOUND:
      00ACCA CE                       4 	.byte 6+F_IFUNC 	
      00ACCB 00 12 4F 55 4E 44        5 	.ascii "UBOUND"
      00ACCD 00 B0                    6 	.word UBOUND_IDX 
      002FA3                       4472 	_dict_entry,4,TONE,TONE_IDX;tone  
      00ACCD A6 FF                    1 	.word LINK 
                           002FA5     2 	LINK=.
      002FA5                          3 TONE:
      00ACCF 53                       4 	.byte 4 	
      00ACD0 A3 FF FF 27              5 	.ascii "TONE"
      00ACD4 02 5F                    6 	.word TONE_IDX 
      002FAC                       4473 	_dict_entry,2,TO,TO_IDX;to
      00ACD6 4F 72                    1 	.word LINK 
                           002FAE     2 	LINK=.
      002FAE                          3 TO:
      00ACD8 A2                       4 	.byte 2 	
      00ACD9 00 03                    5 	.ascii "TO"
      00ACDB 90 F7                    6 	.word TO_IDX 
      002FB3                       4474 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00ACDD 90 EF                    1 	.word LINK 
                           002FB5     2 	LINK=.
      002FB5                          3 TIMER:
      00ACDF 01                       4 	.byte 5 	
      00ACE0 A6 84 81 45 52           5 	.ascii "TIMER"
      00ACE3 00 A8                    6 	.word TIMER_IDX 
      002FBD                       4475 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00ACE3 CD 99                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



                           002FBF     2 	LINK=.
      002FBF                          3 TIMEOUT:
      00ACE5 7C                       4 	.byte 7+F_IFUNC 	
      00ACE6 A1 01 27 03 CC 96 C8     5 	.ascii "TIMEOUT"
      00ACED 00 AA                    6 	.word TMROUT_IDX 
      002FC9                       4476 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00ACED CD 82                    1 	.word LINK 
                           002FCB     2 	LINK=.
      002FCB                          3 TICKS:
      00ACEF 2A                       4 	.byte 5+F_IFUNC 	
      00ACF0 A6 84 81 4B 53           5 	.ascii "TICKS"
      00ACF3 00 A6                    6 	.word TICKS_IDX 
      002FD3                       4477 	_dict_entry,4,STOP,STOP_IDX;stop 
      00ACF3 CD 99                    1 	.word LINK 
                           002FD5     2 	LINK=.
      002FD5                          3 STOP:
      00ACF5 81                       4 	.byte 4 	
      00ACF6 A1 01 27 03              5 	.ascii "STOP"
      00ACFA CC 96                    6 	.word STOP_IDX 
      002FDC                       4478 	_dict_entry,4,STEP,STEP_IDX;step 
      00ACFC C8 90                    1 	.word LINK 
                           002FDE     2 	LINK=.
      002FDE                          3 STEP:
      00ACFE F6                       4 	.byte 4 	
      00ACFF 93 EE 01 72              5 	.ascii "STEP"
      00AD03 A9 00                    6 	.word STEP_IDX 
      002FE5                       4479 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00AD05 03 4B                    1 	.word LINK 
                           002FE7     2 	LINK=.
      002FE7                          3 SPIWR:
      00AD07 00                       4 	.byte 5 	
      00AD08 35 CC 50 E0 9E           5 	.ascii "SPIWR"
      00AD0D A4 3F                    6 	.word SPIWR_IDX 
      002FEF                       4480 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00AD0F 95 A3                    1 	.word LINK 
                           002FF1     2 	LINK=.
      002FF1                          3 SPISEL:
      00AD11 00                       4 	.byte 6 	
      00AD12 FF 23 06 0C 01 98        5 	.ascii "SPISEL"
      00AD18 56 20                    6 	.word SPISEL_IDX 
      002FFA                       4481 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00AD1A F5 35                    1 	.word LINK 
                           002FFC     2 	LINK=.
      002FFC                          3 SPIRD:
      00AD1C 55                       4 	.byte 5+F_IFUNC 	
      00AD1D 50 E0 84 C7 50           5 	.ascii "SPIRD"
      00AD22 E1 9F                    6 	.word SPIRD_IDX 
      003004                       4482 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00AD24 4A 35                    1 	.word LINK 
                           003006     2 	LINK=.
      003006                          3 SPIEN:
      00AD26 55                       4 	.byte 5 	
      00AD27 50 E0 C7 50 E2           5 	.ascii "SPIEN"
      00AD2C 35 AA                    6 	.word SPIEN_IDX 
      00300E                       4483 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00AD2E 50 E0                    1 	.word LINK 
                           003010     2 	LINK=.
      003010                          3 SLEEP:
      00AD30 81                       4 	.byte 5 	
      00AD31 53 4C 45 45 50           5 	.ascii "SLEEP"
      00AD31 35 AA                    6 	.word SLEEP_IDX 
      003018                       4484     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00AD33 50 E0                    1 	.word LINK 
                           00301A     2 	LINK=.
      00301A                          3 SIZE:
      00AD35 81                       4 	.byte 4 	
      00AD36 53 49 5A 45              5 	.ascii "SIZE"
      00AD36 CD 99                    6 	.word SIZE_IDX 
      003021                       4485 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00AD38 7C A1                    1 	.word LINK 
                           003023     2 	LINK=.
      003023                          3 SHOW:
      00AD3A 01                       4 	.byte 4 	
      00AD3B 27 03 CC 96              5 	.ascii "SHOW"
      00AD3F C8 90                    6 	.word SHOW_IDX 
      00302A                       4486 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00AD41 F6 93                    1 	.word LINK 
                           00302C     2 	LINK=.
      00302C                          3 SAVE:
      00AD43 EE                       4 	.byte 4 	
      00AD44 01 41 56 45              5 	.ascii "SAVE"
      00AD45 00 34                    6 	.word SAVE_IDX 
      003033                       4487 	_dict_entry 3,RUN,RUN_IDX;run
      00AD45 4D 26                    1 	.word LINK 
                           003035     2 	LINK=.
      003035                          3 RUN:
      00AD47 06                       4 	.byte 3 	
      00AD48 5D 26 03                 5 	.ascii "RUN"
      00AD4B 4C 20                    6 	.word RUN_IDX 
      00303B                       4488 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00AD4D 0E 4B                    1 	.word LINK 
                           00303D     2 	LINK=.
      00303D                          3 RSHIFT:
      00AD4F 18                       4 	.byte 6+F_IFUNC 	
      00AD50 59 49 25 04 0A 01        5 	.ascii "RSHIFT"
      00AD56 26 F8                    6 	.word RSHIFT_IDX 
      003046                       4489 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00AD58 5F 84                    1 	.word LINK 
                           003048     2 	LINK=.
      003048                          3 RND:
      00AD5A 97                       4 	.byte 3+F_IFUNC 	
      00AD5B 4F 90 F7                 5 	.ascii "RND"
      00AD5E 90 EF                    6 	.word RND_IDX 
      00304E                       4490 	_dict_entry,6,RETURN,RET_IDX;return 
      00AD60 01 A6                    1 	.word LINK 
                           003050     2 	LINK=.
      003050                          3 RETURN:
      00AD62 84                       4 	.byte 6 	
      00AD63 81 45 54 55 52 4E        5 	.ascii "RETURN"
      00AD64 00 8C                    6 	.word RET_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      003059                       4491 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00AD64 CD 99                    1 	.word LINK 
                           00305B     2 	LINK=.
      00305B                          3 RESTORE:
      00AD66 7C                       4 	.byte 7 	
      00AD67 A1 01 27 03 CC 96 C8     5 	.ascii "RESTORE"
      00AD6E 90 F6                    6 	.word REST_IDX 
      003065                       4492 	_dict_entry 3,REM,REM_IDX;remark 
      00AD70 93 EE                    1 	.word LINK 
                           003067     2 	LINK=.
      003067                          3 REM:
      00AD72 01                       4 	.byte 3 	
      00AD73 72 A9 00                 5 	.ascii "REM"
      00AD76 03 9F                    6 	.word REM_IDX 
      00306D                       4493 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00AD78 A4 0F                    1 	.word LINK 
                           00306F     2 	LINK=.
      00306F                          3 REBOOT:
      00AD7A 5F                       4 	.byte 6 	
      00AD7B 5C 4D 27 04 58 4A        5 	.ascii "REBOOT"
      00AD81 26 F9                    6 	.word RBT_IDX 
      00AD83                       4494 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00AD83 81 6F                    1 	.word LINK 
                           00307A     2 	LINK=.
      00AD84                          3 READ:
      00AD84 CD                       4 	.byte 4+F_IFUNC 	
      00AD85 99 7C A1 01              5 	.ascii "READ"
      00AD89 27 03                    6 	.word READ_IDX 
      003081                       4495 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00AD8B CC 96                    1 	.word LINK 
                           003083     2 	LINK=.
      003083                          3 QKEY:
      00AD8D C8                       4 	.byte 4+F_IFUNC 	
      00AD8E 90 F6 93 EE              5 	.ascii "QKEY"
      00AD92 01 72                    6 	.word QKEY_IDX 
      00308A                       4496 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00AD94 A9 00                    1 	.word LINK 
                           00308C     2 	LINK=.
      00308C                          3 PRTI:
      00AD96 03                       4 	.byte 4+F_IFUNC 	
      00AD97 43 53 81 49              5 	.ascii "PRTI"
      00AD9A 00 80                    6 	.word PRTI_IDX 
      003093                       4497 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00AD9A 85 52                    1 	.word LINK 
                           003095     2 	LINK=.
      003095                          3 PRTH:
      00AD9C 04                       4 	.byte 4+F_IFUNC 	
      00AD9D 89 90 CE 00              5 	.ascii "PRTH"
      00ADA1 05 17                    6 	.word PRTH_IDX 
      00309C                       4498 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00ADA3 03 CE                    1 	.word LINK 
                           00309E     2 	LINK=.
      00309E                          3 PRTG:
      00ADA5 00                       4 	.byte 4+F_IFUNC 	
      00ADA6 01 1F 05 72              5 	.ascii "PRTG"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00ADAA 5C 00                    6 	.word PRTG_IDX 
      0030A5                       4499 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00ADAC 1F 81                    1 	.word LINK 
                           0030A7     2 	LINK=.
      00ADAE                          3 PRTF:
      00ADAE 72                       4 	.byte 4+F_IFUNC 	
      00ADAF 5D 00 1F 26              5 	.ascii "PRTF"
      00ADB3 03 CC                    6 	.word PRTF_IDX 
      0030AE                       4500 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00ADB5 96 C8                    1 	.word LINK 
                           0030B0     2 	LINK=.
      00ADB7                          3 PRTE:
      00ADB7 CD                       4 	.byte 4+F_IFUNC 	
      00ADB8 9A F9 A1 84              5 	.ascii "PRTE"
      00ADBC 27 03                    6 	.word PRTE_IDX 
      0030B7                       4501 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00ADBE CC 96                    1 	.word LINK 
                           0030B9     2 	LINK=.
      0030B9                          3 PRTD:
      00ADC0 C8                       4 	.byte 4+F_IFUNC 	
      00ADC1 50 52 54 44              5 	.ascii "PRTD"
      00ADC1 90 F6                    6 	.word PRTD_IDX 
      0030C0                       4502 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00ADC3 93 EE                    1 	.word LINK 
                           0030C2     2 	LINK=.
      0030C2                          3 PRTC:
      00ADC5 01                       4 	.byte 4+F_IFUNC 	
      00ADC6 72 A9 00 03              5 	.ascii "PRTC"
      00ADCA 4D 26                    6 	.word PRTC_IDX 
      0030C9                       4503 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00ADCC 13 5D                    1 	.word LINK 
                           0030CB     2 	LINK=.
      0030CB                          3 PRTB:
      00ADCE 26                       4 	.byte 4+F_IFUNC 	
      00ADCF 10 1E 03 CF              5 	.ascii "PRTB"
      00ADD3 00 05                    6 	.word PRTB_IDX 
      0030D2                       4504 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00ADD5 E6 02                    1 	.word LINK 
                           0030D4     2 	LINK=.
      0030D4                          3 PRTA:
      00ADD7 C7                       4 	.byte 4+F_IFUNC 	
      00ADD8 00 04 1E 05              5 	.ascii "PRTA"
      00ADDC CF 00                    6 	.word PRTA_IDX 
      0030DB                       4505 	_dict_entry 5,PRINT,PRT_IDX;print 
      00ADDE 01 81                    1 	.word LINK 
                           0030DD     2 	LINK=.
      00ADE0                          3 PRINT:
      00ADE0 85                       4 	.byte 5 	
      00ADE1 5B 04 72 5A 00           5 	.ascii "PRINT"
      00ADE6 1F FC                    6 	.word PRT_IDX 
      00ADE8                       4506 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00ADE8 AE 00                    1 	.word LINK 
                           0030E7     2 	LINK=.
      0030E7                          3 POUT:
      00ADEA 00                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00ADEB A6 84 81 54              5 	.ascii "POUT"
      00ADEE 00 6C                    6 	.word POUT_IDX 
      0030EE                       4507 	_dict_entry,4,POKE,POKE_IDX;poke 
      00ADEE AE 00                    1 	.word LINK 
                           0030F0     2 	LINK=.
      0030F0                          3 POKE:
      00ADF0 01                       4 	.byte 4 	
      00ADF1 A6 84 81 45              5 	.ascii "POKE"
      00ADF4 00 6A                    6 	.word POKE_IDX 
      0030F7                       4508 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00ADF4 AE 00                    1 	.word LINK 
                           0030F9     2 	LINK=.
      0030F9                          3 PMODE:
      00ADF6 02                       4 	.byte 5 	
      00ADF7 A6 84 81 44 45           5 	.ascii "PMODE"
      00ADFA 00 64                    6 	.word PMODE_IDX 
      003101                       4509 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00ADFA AE 00                    1 	.word LINK 
                           003103     2 	LINK=.
      003103                          3 PINP:
      00ADFC 03                       4 	.byte 4+F_IFUNC 	
      00ADFD A6 84 81 50              5 	.ascii "PINP"
      00AE00 00 68                    6 	.word PINP_IDX 
      00310A                       4510 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00AE00 AE 00                    1 	.word LINK 
                           00310C     2 	LINK=.
      00310C                          3 PEEK:
      00AE02 04                       4 	.byte 4+F_IFUNC 	
      00AE03 A6 84 81 4B              5 	.ascii "PEEK"
      00AE06 00 66                    6 	.word PEEK_IDX 
      003113                       4511 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AE06 AE 00                    1 	.word LINK 
                           003115     2 	LINK=.
      003115                          3 PAUSE:
      00AE08 05                       4 	.byte 5 	
      00AE09 A6 84 81 53 45           5 	.ascii "PAUSE"
      00AE0C 00 62                    6 	.word PAUSE_IDX 
      00311D                       4512 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AE0C AE 00                    1 	.word LINK 
                           00311F     2 	LINK=.
      00311F                          3 PAD:
      00AE0E 06                       4 	.byte 3+F_IFUNC 	
      00AE0F A6 84 81                 5 	.ascii "PAD"
      00AE12 00 60                    6 	.word PAD_IDX 
      003125                       4513 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00AE12 AE 00                    1 	.word LINK 
                           003127     2 	LINK=.
      003127                          3 OR:
      00AE14 07                       4 	.byte 2+F_IFUNC 	
      00AE15 A6 84                    5 	.ascii "OR"
      00AE17 81 5E                    6 	.word OR_IDX 
      00AE18                       4514 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AE18 AE 00                    1 	.word LINK 
                           00312E     2 	LINK=.
      00312E                          3 ON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AE1A 08                       4 	.byte 2 	
      00AE1B A6 84                    5 	.ascii "ON"
      00AE1D 81 C2                    6 	.word ON_IDX 
      00AE1E                       4515 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AE1E A6 84                    1 	.word LINK 
                           003135     2 	LINK=.
      003135                          3 ODR:
      00AE20 AE                       4 	.byte 3+F_IFUNC 	
      00AE21 00 00 81                 5 	.ascii "ODR"
      00AE24 00 5C                    6 	.word ODR_IDX 
      00313B                       4516 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00AE24 A6 84                    1 	.word LINK 
                           00313D     2 	LINK=.
      00313D                          3 NOT:
      00AE26 AE                       4 	.byte 3+F_IFUNC 	
      00AE27 00 01 81                 5 	.ascii "NOT"
      00AE2A 00 5A                    6 	.word NOT_IDX 
      003143                       4517 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AE2A A6 84                    1 	.word LINK 
                           003145     2 	LINK=.
      003145                          3 NEXT:
      00AE2C AE                       4 	.byte 4 	
      00AE2D 00 02 81 54              5 	.ascii "NEXT"
      00AE30 00 56                    6 	.word NEXT_IDX 
      00314C                       4518 	_dict_entry,3,NEW,NEW_IDX;new
      00AE30 A6 84                    1 	.word LINK 
                           00314E     2 	LINK=.
      00314E                          3 NEW:
      00AE32 AE                       4 	.byte 3 	
      00AE33 00 03 81                 5 	.ascii "NEW"
      00AE36 00 58                    6 	.word NEW_IDX 
                                   4519 ;	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      003154                       4520 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AE36 A6 84                    1 	.word LINK 
                           003156     2 	LINK=.
      003156                          3 LSHIFT:
      00AE38 AE                       4 	.byte 6+F_IFUNC 	
      00AE39 00 04 81 49 46 54        5 	.ascii "LSHIFT"
      00AE3C 00 54                    6 	.word LSHIFT_IDX 
      00315F                       4521 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AE3C A6 84                    1 	.word LINK 
                           003161     2 	LINK=.
      003161                          3 LOG:
      00AE3E AE                       4 	.byte 3+F_IFUNC 	
      00AE3F 00 01 81                 5 	.ascii "LOG"
      00AE42 00 52                    6 	.word LOG_IDX 
      003167                       4522 	_dict_entry 4,LIST,LIST_IDX;list
      00AE42 A6 84                    1 	.word LINK 
                           003169     2 	LINK=.
      003169                          3 LIST:
      00AE44 AE                       4 	.byte 4 	
      00AE45 00 00 81 54              5 	.ascii "LIST"
      00AE48 00 50                    6 	.word LIST_IDX 
      003170                       4523 	_dict_entry 3,LET,LET_IDX;let 
      00AE48 A6 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           003172     2 	LINK=.
      003172                          3 LET:
      00AE4A AE                       4 	.byte 3 	
      00AE4B 40 00 81                 5 	.ascii "LET"
      00AE4E 00 4E                    6 	.word LET_IDX 
      003178                       4524 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AE4E 55 00                    1 	.word LINK 
                           00317A     2 	LINK=.
      00317A                          3 KEY:
      00AE50 04                       4 	.byte 3+F_CFUNC 	
      00AE51 00 02 81                 5 	.ascii "KEY"
      00AE54 00 4C                    6 	.word KEY_IDX 
      003180                       4525 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AE54 EE 04                    1 	.word LINK 
                           003182     2 	LINK=.
      003182                          3 IWDGREF:
      00AE56 DE                       4 	.byte 7 	
      00AE57 B3 76 A3 AE 4E 81 46     5 	.ascii "IWDGREF"
      00AE5D 00 4A                    6 	.word IWDGREF_IDX 
      00318C                       4526 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AE5D 4F CD                    1 	.word LINK 
                           00318E     2 	LINK=.
      00318E                          3 IWDGEN:
      00AE5F 8C                       4 	.byte 6 	
      00AE60 C2 5D 26 05 A6 05        5 	.ascii "IWDGEN"
      00AE66 CC 96                    6 	.word IWDGEN_IDX 
      003197                       4527 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AE68 CA 8E                    1 	.word LINK 
                           003199     2 	LINK=.
      00AE69                          3 INVERT:
      00AE69 90                       4 	.byte 6+F_IFUNC 	
      00AE6A 93 CD AE 54 26 F4        5 	.ascii "INVERT"
      00AE70 00 46                    6 	.word INVERT_IDX 
      0031A2                       4528 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AE70 90 CF                    1 	.word LINK 
                           0031A4     2 	LINK=.
      0031A4                          3 INPUT:
      00AE72 00                       4 	.byte 5 	
      00AE73 07 90 E6 02 C7           5 	.ascii "INPUT"
      00AE78 00 0A                    6 	.word INPUT_IDX 
      0031AC                       4529 	_dict_entry,2,IF,IF_IDX;if 
      00AE7A 35 06                    1 	.word LINK 
                           0031AE     2 	LINK=.
      0031AE                          3 IF:
      00AE7C 00                       4 	.byte 2 	
      00AE7D 09 81                    5 	.ascii "IF"
      00AE7F 00 42                    6 	.word IF_IDX 
      0031B3                       4530 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AE7F 72 5F                    1 	.word LINK 
                           0031B5     2 	LINK=.
      0031B5                          3 IDR:
      00AE81 00                       4 	.byte 3+F_IFUNC 	
      00AE82 07 72 5F                 5 	.ascii "IDR"
      00AE85 00 08                    6 	.word IDR_IDX 
      0031BB                       4531 	_dict_entry,3,HEX,HEX_IDX;hex_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AE87 72 5F                    1 	.word LINK 
                           0031BD     2 	LINK=.
      0031BD                          3 HEX:
      00AE89 00                       4 	.byte 3 	
      00AE8A 09 72 5F                 5 	.ascii "HEX"
      00AE8D 00 0A                    6 	.word HEX_IDX 
      0031C3                       4532 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AE8F CD 97                    1 	.word LINK 
                           0031C5     2 	LINK=.
      0031C5                          3 GPIO:
      00AE91 C7                       4 	.byte 4+F_IFUNC 	
      00AE92 A1 84 27 C7              5 	.ascii "GPIO"
      00AE96 55 00                    6 	.word GPIO_IDX 
      0031CC                       4533 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AE98 03 00                    1 	.word LINK 
                           0031CE     2 	LINK=.
      0031CE                          3 GOTO:
      00AE9A 02                       4 	.byte 4 	
      00AE9B CE 00 1B 4F              5 	.ascii "GOTO"
      00AE9E 00 3A                    6 	.word GOTO_IDX 
      0031D5                       4534 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AE9E C3 00                    1 	.word LINK 
                           0031D7     2 	LINK=.
      0031D7                          3 GOSUB:
      00AEA0 1D                       4 	.byte 5 	
      00AEA1 24 17 90 93 CD           5 	.ascii "GOSUB"
      00AEA6 AE 54                    6 	.word GOSUB_IDX 
      0031DF                       4535 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AEA8 27 C6                    1 	.word LINK 
                           0031E1     2 	LINK=.
      00AEAA                          3 GET:
      00AEAA 93                       4 	.byte 3 	
      00AEAB E6 02 C7                 5 	.ascii "GET"
      00AEAE 00 0F                    6 	.word GET_IDX 
      0031E7                       4536 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AEB0 72 5F                    1 	.word LINK 
                           0031E9     2 	LINK=.
      0031E9                          3 FREE:
      00AEB2 00                       4 	.byte 4+F_IFUNC 	
      00AEB3 0E 72 BB 00              5 	.ascii "FREE"
      00AEB7 0E 20                    6 	.word FREE_IDX 
      0031F0                       4537 	_dict_entry,3,FOR,FOR_IDX;for 
      00AEB9 E4 E9                    1 	.word LINK 
                           0031F2     2 	LINK=.
      00AEBA                          3 FOR:
      00AEBA A6                       4 	.byte 3 	
      00AEBB 0C CC 96                 5 	.ascii "FOR"
      00AEBE CA 36                    6 	.word FOR_IDX 
      00AEBF                       4538 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AEBF 52 06                    1 	.word LINK 
                           0031FA     2 	LINK=.
      00AEC1                          3 FCPU:
      00AEC1 C6                       4 	.byte 4 	
      00AEC2 00 09 C1 00              5 	.ascii "FCPU"
      00AEC6 0A 27                    6 	.word FCPU_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      003201                       4539 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AEC8 37 CD                    1 	.word LINK 
                           003203     2 	LINK=.
      003203                          3 ERASE:
      00AECA A0                       4 	.byte 5 	
      00AECB 16 CE 00 07 CF           5 	.ascii "ERASE"
      00AED0 00 05                    6 	.word ERASE_IDX 
      00320B                       4540 	_dict_entry,3,END,END_IDX;cmd_end  
      00AED2 55 00                    1 	.word LINK 
                           00320D     2 	LINK=.
      00320D                          3 END:
      00AED4 09                       4 	.byte 3 	
      00AED5 00 02 55                 5 	.ascii "END"
      00AED8 00 0A                    6 	.word END_IDX 
      003213                       4541 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AEDA 00 04                    1 	.word LINK 
                           003215     2 	LINK=.
      003215                          3 EEPROM:
      00AEDC CD                       4 	.byte 6+F_IFUNC 	
      00AEDD 9A B8 A1 84 27 03        5 	.ascii "EEPROM"
      00AEE3 CC 96                    6 	.word EEPROM_IDX 
      00321E                       4542 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AEE5 C8 15                    1 	.word LINK 
                           003220     2 	LINK=.
      00AEE6                          3 EEFREE:
      00AEE6 1F                       4 	.byte 6+F_IFUNC 	
      00AEE7 05 CD 97 C7 CE 00        5 	.ascii "EEFREE"
      00AEED 05 CF                    6 	.word EEFREE_IDX 
      003229                       4543 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AEEF 00 07                    1 	.word LINK 
                           00322B     2 	LINK=.
      00322B                          3 EDIT:
      00AEF1 55                       4 	.byte 4 	
      00AEF2 00 02 00 09              5 	.ascii "EDIT"
      00AEF6 CD A0                    6 	.word EDIT_IDX 
      003232                       4544 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AEF8 26 1E                    1 	.word LINK 
                           003234     2 	LINK=.
      003234                          3 DWRITE:
      00AEFA 05                       4 	.byte 6+F_CMD 	
      00AEFB A6 84 5B 06 81 45        5 	.ascii "DWRITE"
      00AF00 00 28                    6 	.word DWRITE_IDX 
      00323D                       4545 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AF00 90 CE                    1 	.word LINK 
                           00323F     2 	LINK=.
      00323F                          3 DREAD:
      00AF02 00                       4 	.byte 5+F_IFUNC 	
      00AF03 07 72 5F 00 07           5 	.ascii "DREAD"
      00AF08 72 5F                    6 	.word DREAD_IDX 
      003247                       4546 	_dict_entry,2,DO,DO_IDX;do_loop
      00AF0A 00 08                    1 	.word LINK 
                           003249     2 	LINK=.
      003249                          3 DO:
      00AF0C 72                       4 	.byte 2 	
      00AF0D 5F 00                    5 	.ascii "DO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AF0F 09 72                    6 	.word DO_IDX 
      00324E                       4547 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AF11 5F 00                    1 	.word LINK 
                           003250     2 	LINK=.
      003250                          3 DEC:
      00AF13 0A                       4 	.byte 3 	
      00AF14 CD AE AA                 5 	.ascii "DEC"
      00AF17 20 A8                    6 	.word DEC_IDX 
      00AF19                       4548 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AF19 CD 99                    1 	.word LINK 
                           003258     2 	LINK=.
      003258                          3 DDR:
      00AF1B 81                       4 	.byte 3+F_IFUNC 	
      00AF1C A1 02 27                 5 	.ascii "DDR"
      00AF1F 03 CC                    6 	.word DDR_IDX 
      00325E                       4549 	_dict_entry,4,DATA,DATA_IDX;data  
      00AF21 96 C8                    1 	.word LINK 
                           003260     2 	LINK=.
      00AF23                          3 DATA:
      00AF23 72                       4 	.byte 4 	
      00AF24 12 50 C7 85              5 	.ascii "DATA"
      00AF28 5D 27                    6 	.word DATA_IDX 
      003267                       4550 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AF2A 21 85                    1 	.word LINK 
                           003269     2 	LINK=.
      003269                          3 CRL:
      00AF2C A6                       4 	.byte 3+F_IFUNC 	
      00AF2D 08 42 9F                 5 	.ascii "CRL"
      00AF30 C7 52                    6 	.word CRL_IDX 
      00326F                       4551 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AF32 00 72                    1 	.word LINK 
                           003271     2 	LINK=.
      003271                          3 CRH:
      00AF34 1A                       4 	.byte 3+F_IFUNC 	
      00AF35 50 14 72                 5 	.ascii "CRH"
      00AF38 1A 50                    6 	.word CRH_IDX 
      003277                       4552 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AF3A 16 72                    1 	.word LINK 
                           003279     2 	LINK=.
      003279                          3 CONST:
      00AF3C 14                       4 	.byte 5 	
      00AF3D 52 00 72 12 52           5 	.ascii "CONST"
      00AF42 01 72                    6 	.word CONST_IDX 
      003281                       4553 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AF44 10 52                    1 	.word LINK 
                           003283     2 	LINK=.
      003283                          3 CHAR:
      00AF46 01                       4 	.byte 4+F_CFUNC 	
      00AF47 72 1C 52 00              5 	.ascii "CHAR"
      00AF4B 81 18                    6 	.word CHAR_IDX 
      00AF4C                       4554 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AF4C 5B 02                    1 	.word LINK 
                           00328C     2 	LINK=.
      00328C                          3 BYE:
      00AF4E A6                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AF4F 82 C4 52                 5 	.ascii "BYE"
      00AF52 03 A1                    6 	.word BYE_IDX 
      003292                       4555 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AF54 02 26                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 BTOGL:
      00AF56 F7                       4 	.byte 5 	
      00AF57 72 1D 52 00 72           5 	.ascii "BTOGL"
      00AF5C 13 50                    6 	.word BTOGL_IDX 
      00329C                       4556 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AF5E C7 72                    1 	.word LINK 
                           00329E     2 	LINK=.
      00329E                          3 BTEST:
      00AF60 1B                       4 	.byte 5+F_IFUNC 	
      00AF61 50 16 81 53 54           5 	.ascii "BTEST"
      00AF64 00 12                    6 	.word BTEST_IDX 
      0032A6                       4557 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AF64 A6 78                    1 	.word LINK 
                           0032A8     2 	LINK=.
      0032A8                          3 BSET:
      00AF66 C5                       4 	.byte 4 	
      00AF67 52 03 27 04              5 	.ascii "BSET"
      00AF6B 72 5F                    6 	.word BSET_IDX 
      0032AF                       4558 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AF6D 52 03                    1 	.word LINK 
                           0032B1     2 	LINK=.
      0032B1                          3 BRES:
      00AF6F 81                       4 	.byte 4 	
      00AF70 42 52 45 53              5 	.ascii "BRES"
      00AF70 88 CD                    6 	.word BRES_IDX 
      0032B8                       4559 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AF72 AF 64                    1 	.word LINK 
                           0032BA     2 	LINK=.
      0032BA                          3 BIT:
      00AF74 84                       4 	.byte 3+F_IFUNC 	
      00AF75 72 03 52                 5 	.ascii "BIT"
      00AF78 03 FB                    6 	.word BIT_IDX 
      0032C0                       4560 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AF7A C7 52                    1 	.word LINK 
                           0032C2     2 	LINK=.
      0032C2                          3 AWU:
      00AF7C 04                       4 	.byte 3 	
      00AF7D 72 01 52                 5 	.ascii "AWU"
      00AF80 03 FB                    6 	.word AWU_IDX 
      0032C8                       4561 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AF82 C6 52                    1 	.word LINK 
                           0032CA     2 	LINK=.
      0032CA                          3 ASC:
      00AF84 04                       4 	.byte 3+F_IFUNC 	
      00AF85 81 53 43                 5 	.ascii "ASC"
      00AF86 00 08                    6 	.word ASC_IDX 
      0032D0                       4562 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00AF86 A6 FF                    1 	.word LINK 
                           0032D2     2 	LINK=.
      0032D2                          3 AND:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AF88 72                       4 	.byte 3+F_IFUNC 	
      00AF89 01 52 03                 5 	.ascii "AND"
      00AF8C E3 C6                    6 	.word AND_IDX 
      0032D8                       4563 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AF8E 52 04                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 ADCREAD:
      00AF90 81                       4 	.byte 7+F_IFUNC 	
      00AF91 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00AF91 CD 9A                    6 	.word ADCREAD_IDX 
      0032E4                       4564 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AF93 B8 A1                    1 	.word LINK 
                           0032E6     2 	LINK=.
      0032E6                          3 ADCON:
      00AF95 84                       4 	.byte 5 	
      00AF96 27 03 CC 96 C8           5 	.ascii "ADCON"
      00AF9B 00 02                    6 	.word ADCON_IDX 
      0032EE                       4565 kword_dict::
      0032EE                       4566 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AF9B 9F CD                    1 	.word LINK 
                           0032F0     2 	LINK=.
      0032F0                          3 ABS:
      00AF9D AF                       4 	.byte 3+F_IFUNC 	
      00AF9E 70 CD 97                 5 	.ascii "ABS"
      00AFA1 C7 A1                    6 	.word ABS_IDX 
                                   4567 
                                   4568 ;comands and fonctions address table 	
      0032F6                       4569 code_addr::
      00AFA3 08 26 02 20 E9 4D 27  4570 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             05 55 00 03 00 02 81
      00AFB1 20 B8 20 96 20 FD 20  4571 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             DB 29 18 28 22 2D B6
      00AFB1 CD AF 86 5F 97 A6 84  4572 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             81 2D 1A 25 7B 25 B3
      00AFB9 1E B9 2D C8 24 5B 26  4573 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             54 2A AA 26 F0 21 8E
             23 BB 23 A1 28 89
      00AFB9 CD 97 C7 A1 84 27 03  4574 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             CC 96 C8 5D 27 05 72
             1B 50
      00AFC9 14 81 1E 14 2C B6 2A  4575 	.word let,list,log2,lshift,next,new ; 40..47
             50 22 3A 26 4A
      00AFCB 2C 63 2D 9E 29 EC 2F  4576 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             50 29 2C 2A B9 21 55
             2D C2
      00AFCB 72 1A 50 14 81 21 2D  4577 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             68 2D 6E 2D 74 2D 7A
             2D 80
      00AFD0 2D 86 2D 8C 2D 92 2D  4578 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             98 28 7C 2E 3F 00 B2
             20 53
      00AFD0 AE 16 B8 B6 84 81 2A  4579 	.word restore,return, random,rshift,run,show,free ; 72..79
             7D 23 FF 1A CE 1B 5A
      00AFD6 29 21 2F 31 2E 99 2F  4580 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             39 2F 11 21 F6 25 FE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



             29 9F
      00AFD6 00 00 2C 4A 21 B8 24  4581 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             98 1B A3 28 C4 2D 2E
             28 D9
      00AFD8 20 59 2B CD 27 DF 2A  4582 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             1E 1B 76 23 15 24 62
             1C D4
      00AFD8 43 58 4F 52           4583 	.word func_eefree,0 
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
      0033C2                         30 test:
      0033C2                         31     _vars VSIZE 
      00AFDC 00 BE            [ 2]    1     sub sp,#VSIZE 
      00AFDE AF D8 10         [ 2]   32     ldw x,#LOOP_CNT
      00AFE0 1F 03            [ 2]   33     ldw (CNTR,sp),x  
      00AFE0 05 57 52         [ 2]   34     ldw x,ticks 
      00AFE3 49 54            [ 2]   35     ldw (T,sp),x
      0033CE                         36 1$: ; test add24 
      00AFE5 45 00            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AFE7 BC AF E0         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AFEA C7 00 0C         [ 1]   39     ld acc24,a 
      00AFEA 05 57 4F         [ 2]   40     ldw acc24+1,x  
      00AFED 52 44            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AFEF 53 00 BA         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AFF2 AF EA 58         [ 4]   43     call add24 
      00AFF4 1E 03            [ 2]   44     ldw x,(CNTR,sp)
      00AFF4 04 57 41         [ 2]   45     subw x,#1
      00AFF7 49 54            [ 2]   46     ldw (CNTR,sp),x 
      00AFF9 00 B8            [ 1]   47     jrne 1$
      00AFFB AF F4 AD         [ 4]   48     call prt_acc24
      00AFFD A6 20            [ 1]   49     ld a,#SPACE 
      00AFFD 43 55 53         [ 4]   50     call putc 
      00B000 52 00 B6         [ 2]   51     ldw x,ticks 
      00B003 AF FD 01         [ 2]   52     subw x,(T,sp)
      00B005 CD 17 9D         [ 4]   53     call prt_i16  
      00B005 05 55            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00B007 4E 54 49         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00B00A 4C 00 B4         [ 2]   58     ldw x,LOOP_CNT
      00B00D B0 05            [ 2]   59     ldw (CNTR,sp),x 
      00B00F CE 00 0F         [ 2]   60     ldw x,ticks 
      00B00F 46 55            [ 2]   61     ldw (T,sp),x 
      00340A                         62 2$: 
      00B011 46 4C            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00B013 41 53 48         [ 2]   64     ldw x,#VAL1&0XFFFF
      00B016 00 B2 B0         [ 1]   65     ld acc24,a 
      00B019 0F 00 0D         [ 2]   66     ldw acc24+1,x  
      00B01A A6 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00B01A 46 55 42         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00B01D 4F 55 4E         [ 4]   69     call mul24 
      00B020 44 00            [ 2]   70     ldw x,(CNTR,sp)
      00B022 B0 B0 1A         [ 2]   71     subw x,#1
      00B025 1F 03            [ 2]   72     ldw (CNTR,sp),x 
      00B025 04 54            [ 1]   73     jrne 2$ 
      00B027 4F 4E 45         [ 4]   74    call prt_acc24 
      00B02A 00 AE            [ 1]   75    ld a,#SPACE 
      00B02C B0 25 FD         [ 4]   76    call putc 
      00B02E CE 00 0F         [ 2]   77     ldw x,ticks 
      00B02E 02 54 4F         [ 2]   78     subw x,(T,sp)
      00B031 00 AC B0         [ 4]   79     call prt_i16 
      00B034 2E 0D            [ 1]   80     ld a,#CR 
      00B035 CD 08 FD         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00B035 05 54 49         [ 2]   83     ldw x,LOOP_CNT
      00B038 4D 45            [ 2]   84     ldw (CNTR,sp),x 
      00B03A 52 00 A8         [ 2]   85     ldw x,ticks 
      00B03D B0 35            [ 2]   86     ldw (T,sp),x 
      00B03F                         87 3$: 
      00B03F 47 54            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B041 49 4D 45         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B044 4F 55 54         [ 1]   90     ld acc24,a 
      00B047 00 AA B0         [ 2]   91     ldw acc24+1,x  
      00B04A 3F 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B04B AE 05 FF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B04B 45 54 49         [ 4]   94     call mul24 
      00B04E 43 4B            [ 2]   95     ldw x,(CNTR,sp)
      00B050 53 00 A6         [ 2]   96     subw x,#1
      00B053 B0 4B            [ 2]   97     ldw (CNTR,sp),x 
      00B055 26 E4            [ 1]   98     jrne 3$ 
      00B055 04 53 54         [ 4]   99     call prt_acc24    
      00B058 4F 50            [ 1]  100     ld a,#SPACE 
      00B05A 00 A4 B0         [ 4]  101     call putc 
      00B05D 55 00 0F         [ 2]  102     ldw x,ticks 
      00B05E 72 F0 01         [ 2]  103     subw x,(T,sp)
      00B05E 04 53 54         [ 4]  104     call prt_i16 
      00B061 45 50            [ 1]  105     ld a,#CR 
      00B063 00 A2 B0         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B066 5E 27 10         [ 2]  108     ldw x,LOOP_CNT
      00B067 1F 03            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00B067 05 53 50         [ 2]  110     ldw x,ticks 
      00B06A 49 57            [ 2]  111     ldw (T,sp),x 
      003482                        112 4$:
      00B06C 52 00            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B06E A0 B0 67         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B071 C7 00 0C         [ 1]  115     ld acc24,a 
      00B071 06 53 50         [ 2]  116     ldw acc24+1,x  
      00B074 49 53            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B076 45 4C 00         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B079 9E B0 71         [ 4]  119     call mul24 
      00B07C 1E 03            [ 2]  120     ldw x,(CNTR,sp)
      00B07C 45 53 50         [ 2]  121     subw x,#1
      00B07F 49 52            [ 2]  122     ldw (CNTR,sp),x 
      00B081 44 00            [ 1]  123     jrne 4$ 
      00B083 9A B0 7C         [ 4]  124     call prt_acc24 
      00B086 A6 20            [ 1]  125     ld a,#SPACE 
      00B086 05 53 50         [ 4]  126     call putc 
      00B089 49 45 4E         [ 2]  127     ldw x,ticks 
      00B08C 00 9C B0         [ 2]  128     subw x,(T,sp)
      00B08F 86 17 9D         [ 4]  129     call prt_i16 
      00B090 A6 0D            [ 1]  130     ld a,#CR 
      00B090 05 53 4C         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B093 45 45 50         [ 2]  133     ldw x,LOOP_CNT
      00B096 00 98            [ 2]  134     ldw (CNTR,sp),x 
      00B098 B0 90 0F         [ 2]  135     ldw x,ticks 
      00B09A 1F 01            [ 2]  136     ldw (T,sp),x 
      0034BE                        137 5$: 
      00B09A 04 53            [ 1]  138     ld a,#0xff
      00B09C 49 5A 45         [ 2]  139     ldw x,#0xffff
      00B09F 00 C0 B0         [ 4]  140     call abs24 
      00B0A2 9A 00 0C         [ 1]  141     ld acc24,a 
      00B0A3 CF 00 0D         [ 2]  142     ldw acc24+1,x
      00B0A3 04 53            [ 2]  143     ldw x,(CNTR,sp)
      00B0A5 48 4F 57         [ 2]  144     subw x,#1
      00B0A8 00 94            [ 2]  145     ldw (CNTR,sp),x 
      00B0AA B0 A3            [ 1]  146     jrne 5$ 
      00B0AC CD 17 AD         [ 4]  147     call prt_acc24 
      00B0AC 04 53            [ 1]  148     ld a,#SPACE 
      00B0AE 41 56 45         [ 4]  149     call putc 
      00B0B1 00 34 B0         [ 2]  150     ldw x,ticks 
      00B0B4 AC F0 01         [ 2]  151     subw x,(T,sp)
      00B0B5 CD 17 9D         [ 4]  152     call prt_i16 
      0034E6                        153 6$:
      00B0B5 03 52            [ 1]  154     ld a,#CR 
      00B0B7 55 4E 00         [ 4]  155     call putc 
      00B0BA 92 B0 B5         [ 4]  156     call read_integer 
      00B0BD 55 00 0C 00 17   [ 1]  157     mov farptr,acc24 
      00B0BD 46 52 53 48 49   [ 1]  158     mov farptr+1,acc16 
      00B0C2 46 54 00 90 B0   [ 1]  159     mov farptr+2,acc8 
      00B0C7 BD 35 31         [ 4]  160     call read_integer 
      00B0C8 C6 00 0C         [ 1]  161     ld a,acc24 
      00B0C8 43 52 4E         [ 2]  162     ldw x,acc16 
      00B0CB 44 00 8E B0 C8   [ 1]  163     mov acc24,farptr 
      00B0D0 55 00 18 00 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00B0D0 06 52 45 54 55   [ 1]  165     mov acc8,farptr+2 
      00B0D5 52 4E 00         [ 4]  166     call div24 
      00B0D8 8C               [ 1]  167     push a 
      00B0D9 B0               [ 2]  168     pushw x 
      00B0DA D0 17 AD         [ 4]  169     call prt_acc24 
      00B0DB A6 20            [ 1]  170     ld a,#SPACE 
      00B0DB 07 52 45         [ 4]  171     call putc 
      00B0DE 53               [ 2]  172     popw x
      00B0DF 54 4F 52         [ 2]  173     ldw acc16,x  
      00B0E2 45 00 8A         [ 1]  174     pop acc24 
      00B0E5 B0 DB AD         [ 4]  175     call prt_acc24
      00B0E7 20 B8            [ 2]  176     jra 6$
      00352E                        177     _drop VSIZE 
      00B0E7 03 52            [ 2]    1     addw sp,#VSIZE 
      00B0E9 45               [ 4]  178     ret 
                                    179 
                                    180 
      003531                        181 read_integer:
      00B0EA 4D 00            [ 1]  182     ld a,#'? 
      00B0EC 88 B0 E7         [ 4]  183     call putc  
      00B0EF 72 5F 00 03      [ 1]  184 	clr count  
      00B0EF 06 52 45         [ 4]  185 	call readln 
      00B0F2 42 4F 4F         [ 2]  186 	ldw x,#tib 
      00B0F5 54 00 86         [ 1]  187 	push count
      00B0F8 B0 EF            [ 1]  188 	push #0 
      00B0FA 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00B0FA 44               [ 1]  190 	incw x 
      003549                        191 	_drop 2 
      00B0FB 52 45            [ 2]    1     addw sp,#2 
      00B0FD 41 44 00 84      [ 1]  192 	clr in 
      00B101 B0 FA C7         [ 4]  193 	call get_token
      00B103 A1 84            [ 1]  194 	cp a,#TK_INTGR
      00B103 44 51            [ 1]  195 	jreq 3$ 
      00B105 4B 45            [ 1]  196 	cp a,#TK_MINUS
      00B107 59 00 82         [ 4]  197 	call get_token 
      00B10A B1 03            [ 1]  198 	cp a,#TK_INTGR 
      00B10C 27 03            [ 1]  199 	jreq 2$
      00B10C 44 50 52         [ 2]  200 	jp syntax_error
      003562                        201 2$:
      00B10F 54 49 00         [ 4]  202 	call neg_acc24  	
      003565                        203 3$: 
      00B112 80               [ 4]  204     ret 
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
      00B113 B1 0C                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00B115 00 00                   32 app_size: .word 0 ; 31 
      003584                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0032F0 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0032E6 R
    ADCON_ID=  000002     |   4 ADCREAD    0032DA R   |     ADCREAD_=  000004 
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
  4 AND        0032D2 R   |     AND_IDX =  000006     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032CA R
    ASC_IDX =  000008     |     ATTRIB  =  000002     |   4 AUTO_RUN   000145 R
  4 AWU        0032C2 R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000A 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   4 BIT        0032BA R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000C     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000C 
  4 BRES       0032B1 R   |     BRES_IDX=  00000E     |     BS      =  000008 
  4 BSET       0032A8 R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      00329E R   |     BTEST_ID=  000012     |   4 BTOGL      003294 R
    BTOGL_ID=  000014     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        00328C R   |     BYE_IDX =  000016     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    002787 R   |     CAN_DGR =  005426 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       003283 R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

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
    CNT_LO  =  000004     |     COMMA   =  00002C     |   4 CONST      003279 R
  4 CONST_CO   001C51 R   |     CONST_ID=  0000C6     |     CONST_RE=  000005 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        003271 R
    CRH_IDX =  00001A     |   4 CRL        003269 R   |     CRL_IDX =  00001C 
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
    CURR    =  000002     |     CVAR    =  000008     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       003260 R
    DATA_IDX=  00001E     |     DBG_A   =  000008     |     DBG_CC  =  000009 
    DBG_X   =  000006     |     DBG_Y   =  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        003258 R   |     DDR_IDX =  000020     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        003250 R
    DEC_IDX =  000022     |     DEPTH   =  000001     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         003249 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000024     |   4 DREAD      00323F R
    DREAD_ID=  000026     |   4 DWRITE     003234 R   |     DWRITE_I=  000028 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       00322B R   |     EDIT_IDX=  00002A     |   4 EEFREE     003220 R
    EEFREE_I=  0000C8     |   4 EEPROM     003215 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002C     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        00320D R
    END_IDX =  00002E     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003203 R   |     ERASE_ID=  000030 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       0031FA R   |     FCPU_IDX=  000032     |     FF      =  00000C 
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
  4 FLASH_ME   001DF4 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        0031F2 R   |     FOR_IDX =  000036 
  4 FREE       0031E9 R   |     FREE_IDX=  000096     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   4 GET        0031E1 R
    GET_IDX =  0000C4     |   4 GOSUB      0031D7 R   |     GOSUB_ID=  000038 
  4 GOTO       0031CE R   |     GOTO_IDX=  00003A     |   4 GPIO       0031C5 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003C 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        0031BD R   |     HEX_IDX =  00003E     |     HOME    =  000082 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
    I2C_WRIT=  000000     |   4 IDR        0031B5 R   |     IDR_IDX =  000040 
  4 IF         0031AE R   |     IF_IDX  =  000042     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   4 INPUT      0031A4 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000044     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
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
  4 INVERT     003199 R   |     INVERT_I=  000046     |     INW     =  00000A 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  4 IWDGEN     00318E R   |     IWDGEN_I=  000048     |   4 IWDGREF    003182 R
    IWDGREF_=  00004A     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        00317A R
    KEY_END =  000083     |     KEY_IDX =  00004C     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        003172 R
    LET_IDX =  00004E     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  0032F0 R   |   4 LIST       003169 R
    LIST_IDX=  000050     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG        003161 R
    LOG_IDX =  000052     |     LOOP_CNT=  002710     |   4 LSHIFT     003156 R
    LSHIFT_I=  000054     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000004     |     N2      =  000007     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        00314E R   |     NEW_IDX =  000058 
  4 NEXT       003145 R   |     NEXT_IDX=  000056     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        00313D R   |     NOT_IDX =  00005A 
  4 NOT_SAVE   001EE6 R   |   4 NO_APP     0027C9 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        003135 R   |     ODR_IDX =  00005C     |   4 ON         00312E R
    ONOFF   =  000003     |     ON_IDX  =  0000C2     |     OP      =  000001 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         003127 R   |     OR_IDX  =  00005E 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        00311F R   |     PAD_IDX =  000060 
    PAD_SIZE=  000080     |   4 PAUSE      003115 R   |     PAUSE_ID=  000062 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       00310C R   |     PEEK_IDX=  000066 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       003103 R
    PINP_IDX=  000068     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      0030F9 R
    PMODE_ID=  000064     |   4 POKE       0030F0 R   |     POKE_IDX=  00006A 
  4 POUT       0030E7 R   |     POUT_IDX=  00006C     |     PREV    =  000001 
  4 PRINT      0030DD R   |     PROD    =  000001     |     PROD_SIG=  00000A 
  4 PROG_ADD   001DCA R   |   4 PROG_SIZ   001DDC R   |   4 PRTA       0030D4 R
    PRTA_IDX=  000070     |   4 PRTB       0030CB R   |     PRTB_IDX=  000072 
  4 PRTC       0030C2 R   |     PRTC_IDX=  000074     |   4 PRTD       0030B9 R
    PRTD_IDX=  000076     |   4 PRTE       0030B0 R   |     PRTE_IDX=  000078 
  4 PRTF       0030A7 R   |     PRTF_IDX=  00007A     |   4 PRTG       00309E R
    PRTG_IDX=  00007C     |   4 PRTH       003095 R   |     PRTH_IDX=  00007E 
  4 PRTI       00308C R   |     PRTI_IDX=  000080     |     PRT_IDX =  00006E 
    PSIZE   =  000001     |     PSTR    =  000003     |   4 QKEY       003083 R
    QKEY_IDX=  000082     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001E05 R   |     RAM_SIZE=  001800 
    RBT_IDX =  000086     |   4 READ       00307A R   |     READ_IDX=  000084 
  4 REBOOT     00306F R   |     RECLEN  =  000005     |   4 REG_A      000520 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

  4 REG_CC     000524 R   |   4 REG_EPC    000513 R   |   4 REG_SP     000529 R
  4 REG_X      00051C R   |   4 REG_Y      000518 R   |     RELOP   =  000001 
  4 REM        003067 R   |     REM_IDX =  000088     |   4 RESTORE    00305B R
    REST_IDX=  00008A     |     RETL1   =  000001     |   4 RETURN     003050 R
    RET_ADDR=  000003     |     RET_BPTR=  000003     |     RET_IDX =  00008C 
    RET_INW =  000005     |   4 RND        003048 R   |     RND_IDX =  00008E 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     00303D R
    RSHIFT_I=  000090     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        003035 R   |     RUN_IDX =  000092     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       00302C R
    SAVE_IDX=  000034     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   4 SHOW       003023 R
    SHOW_IDX=  000094     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   002785 R   |   4 SIZE       00301A R   |     SIZE_IDX=  0000C0 
    SKIP    =  000005     |   4 SLEEP      003010 R   |     SLEEP_ID=  000098 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      003006 R   |     SPIEN_ID=  00009C     |   4 SPIRD      002FFC R
    SPIRD_ID=  00009A     |   4 SPISEL     002FF1 R   |     SPISEL_I=  00009E 
  4 SPIWR      002FE7 R   |     SPIWR_ID=  0000A0     |     SPI_CR1 =  005200 
    SPI_CR1_=  000003     |     SPI_CR1_=  000000     |     SPI_CR1_=  000001 
    SPI_CR1_=  000007     |     SPI_CR1_=  000002     |     SPI_CR1_=  000006 
    SPI_CR2 =  005201     |     SPI_CR2_=  000007     |     SPI_CR2_=  000006 
    SPI_CR2_=  000005     |     SPI_CR2_=  000004     |     SPI_CR2_=  000002 
    SPI_CR2_=  000000     |     SPI_CR2_=  000001     |     SPI_CRCP=  005205 
    SPI_CS_B=  000005     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  00008C     |   4 STATES     0004D6 R   |   4 STEP       002FDE R
    STEP_IDX=  0000A2     |   4 STOP       002FD5 R   |     STOP_IDX=  0000A4 
    STR     =  000003     |   4 STR_BYTE   001DED R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     T       =  000001     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TARGET  =  000001 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      002FCB R   |     TICKS_ID=  0000A6 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    002FBF R   |   4 TIMER      002FB5 R
    TIMER_ID=  0000A8     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_ARRAY=  000005     |     TK_CFUNC=  000082     |     TK_CHAR =  000004 
    TK_CMD  =  000080     |     TK_COLON=  00000A     |     TK_COMMA=  000008 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FLOAT=  000086     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LABEL=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000006     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000007     |     TK_SHARP=  000009     |     TK_VAR  =  000085 
    TMROUT_I=  0000AA     |   4 TO         002FAE R   |   4 TONE       002FA5 R
    TONE_IDX=  0000AE     |     TOWRITE =  000005     |     TO_IDX  =  0000AC 
  4 Timer4Up   00001E R   |   4 TrapHand   000012 R   |     U8      =  000001 
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
  4 UBOUND     002F9A R   |     UBOUND_I=  0000B0     |   4 UBTN_Han   000057 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 UFLASH     002F8F R   |     UFLASH_I=  0000B2     |   4 UNTIL      002F85 R
    UNTIL_ID=  0000B4     |     UPDATE  =  000006     |     US      =  00001F 
  4 USER_ABO   00005F R   |   4 USR        002F7D R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000B6 
  4 Uart1RxH   00088B R   |   4 UserButt   000033 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VSISE   =  000003     |     VSIZE   =  000008 
    VT      =  00000B     |   4 WAIT       002F74 R   |     WAIT_IDX=  0000B8 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   4 WORDS      002F6A R
    WORDS_ID=  0000BA     |   4 WRITE      002F60 R   |     WRITE_ID=  0000BC 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        002F58 R   |     XOR_IDX =  0000BE     |     XSAVE   =  000005 
    XSTACK_E=  001773     |     XSTACK_S=  00003C     |     XTEMP   =  000001 
    YSAVE   =  000007     |     YTEMP   =  000003     |   4 abs        0029AF R
  4 abs24      0001A3 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000BC6 R
  4 add24      000158 R   |   4 add_char   00133A R   |   4 add_spac   001117 R
  4 analog_r   00253F R   |   4 app        003584 R   |   4 app_sign   003580 R
  4 app_size   003582 R   |   4 app_spac   003580 GR  |   4 arduino_   002B26 R
  4 arg_list   001901 R   |   5 array_si   00001F R   |   4 ascii      002839 R
  4 at_tst     000F81 R   |   4 atoi24     001838 GR  |   4 atoi_exi   00189E R
  4 awu        00294D R   |   4 awu02      002960 R   |   4 bad_port   0028BF R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       0024B8 R
  4 beep_1kh   00248F GR  |   4 bin_exit   000E02 R   |   4 bit_and    0029BF R
  4 bit_or     0029EC R   |   4 bit_rese   0020B8 R   |   4 bit_set    002096 R
  4 bit_test   0020FD R   |   4 bit_togg   0020DB R   |   4 bit_xor    002A1E R
  4 bitmask    002CE4 R   |   4 bkslsh_t   000F2E R   |   4 bksp       000964 R
  2 block_bu   0016B8 GR  |   4 block_er   00077E R   |   4 break_po   00262C R
  4 bye        002918 R   |   4 char       002822 R   |   4 clear_ba   0014A4 R
  4 clear_bl   0026DC R   |   4 clear_va   0013FC R   |   4 clock_in   00007A R
  4 cloop_1    001CFA R   |   4 cmd_cons   001CD4 R   |   4 cmd_end    00245B R
  4 cmd_get    002462 R   |   4 cmd_itf    00052E R   |   4 cmd_line   0016D5 R
  4 cmd_name   00135A R   |   4 cmd_on     002315 R   |   4 cmd_size   001B76 R
  4 code_add   0032F6 GR  |   4 cold_sta   0000B2 R   |   4 colon_ts   000F55 R
  4 comma_ts   000F60 R   |   4 comp_msg   001627 R   |   4 compile    001086 GR
  4 const_cr   002DB0 R   |   4 const_cr   002DB6 R   |   4 const_dd   002DAA R
  4 const_ee   002DC8 R   |   4 const_id   002DA4 R   |   4 const_in   002DC2 R
  4 const_lo   001CF5 R   |   4 const_od   002D9E R   |   4 const_ou   002DBC R
  4 const_po   002D68 R   |   4 const_po   002D6E R   |   4 const_po   002D74 R
  4 const_po   002D7A R   |   4 const_po   002D80 R   |   4 const_po   002D86 R
  4 const_po   002D8C R   |   4 const_po   002D92 R   |   4 const_po   002D98 R
  4 convert_   000D70 R   |   4 convert_   000928 R   |   4 copy_com   000FB6 R
  5 count      000003 GR  |   4 cp24       00019A R   |   4 cp_loop    0018B0 R
  4 cpl24      0001AA R   |   4 cpy_cmd_   001102 R   |   4 cpy_quot   00113F R
  4 create_g   000C9A R   |   4 cs_high    002F4B R   |   4 cstk_pro   001B1E R
  4 dash_tst   000F76 R   |   4 data       002DCE R   |   5 data_len   000009 R
  4 data_lin   002DDD R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 data_sea   002E1E R   |   4 dec_base   001B55 R   |   4 decomp_l   0011F8 R
  4 decompil   0011B0 GR  |   4 del_line   000C6D R   |   4 delete_l   000A51 R
  4 delete_n   000974 R   |   4 delete_u   000A16 R   |   4 digital_   00257B R
  4 digital_   0025B3 R   |   4 div24      0002E5 R   |   4 divu24_8   0002C7 R
  4 do_loop    002D1A R   |   4 do_progr   000771 R   |   4 edit       001EB9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 enable_i   002C73 R   |   4 eql_tst    00100B R   |   4 equal      00134D R
  4 erase      002654 R   |   4 erase_ex   00079D R   |   4 erase_fl   000793 R
  4 err_bad_   001588 R   |   4 err_buf_   0015FE R   |   4 err_cmd_   00154C R
  4 err_div0   001511 R   |   4 err_dupl   001566 R   |   4 err_math   0014F8 R
  4 err_mem_   0014DD R   |   4 err_msg    0014BB R   |   4 err_no_a   001594 R
  4 err_no_d   0015C7 R   |   4 err_no_f   0015EB R   |   4 err_no_l   001520 R
  4 err_no_p   0015D7 R   |   4 err_not_   001577 R   |   4 err_over   00160B R
  4 err_run_   001536 R   |   4 err_synt   0014EA R   |   4 escaped    000D85 GR
  4 expect     0018EF R   |   4 expr_exi   001A76 R   |   4 expressi   001A38 R
  4 factor     001956 R   |   5 farptr     000017 R   |   4 fcpu       002AAA R
  4 fetchc     00061E R   |   4 fill_wri   0026CC R   |   4 final_te   000BBF R
  4 first_li   001E63 R   |   5 flags      000021 GR  |   4 for        00218E R
  4 free       001B5A R   |   5 free_eep   000023 R   |   7 free_ram   000080 R
  4 func_arg   0018FC R   |   4 func_eef   001C67 R   |   4 func_not   002C63 R
  4 ge         00134F R   |   4 get_addr   00177D R   |   4 get_arra   001926 R
  4 get_char   001797 R   |   4 get_cmd_   00118F R   |   4 get_code   001761 R
  4 get_cons   001BF1 R   |   4 get_esca   000934 R   |   4 get_int2   001787 R
  4 get_targ   0022A6 R   |   4 get_targ   0022B4 R   |   4 get_tick   00299F R
  4 get_toke   000EC7 GR  |   4 getc       00090D GR  |   4 gosub      0023BB R
  4 gosub_1    0023C6 R   |   4 gosub_2    0023CC R   |   4 goto       0023A1 R
  4 goto_1     0023AB R   |   4 gpio       002889 R   |   4 gt         00134B R
  4 gt_tst     001016 R   |   4 hex_base   001B50 R   |   4 hex_dump   00065E R
  4 if         00216D R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   00086F R   |   4 input_ex   00204E R
  4 input_lo   001FBA R   |   4 input_va   001FB6 R   |   4 insert_c   0009D3 R
  4 insert_l   000CC6 R   |   4 insert_l   000D35 R   |   4 interp_l   001716 R
  4 interpre   0016F1 R   |   4 invalid    000573 R   |   4 invalid_   0005F4 R
  4 invert     002D04 R   |   4 is_alnum   000E37 GR  |   4 is_alpha   000E1D GR
  4 is_data_   002DD4 R   |   4 is_digit   000E2E GR  |   4 is_symbo   000E40 R
  4 itoa       0017D3 GR  |   4 itoa_loo   0017F5 R   |   4 jp_to_ta   0023AE R
  4 key        002878 R   |   4 kword_di   0032EE GR  |   4 kword_en   002F56 R
  4 le         001354 R   |   4 leading_   002CC5 R   |   4 ledoff     000429 R
  4 ledon      000424 R   |   4 ledtoggl   00042E R   |   4 left_par   000437 R
  4 let        001BAE GR  |   4 let_arra   001BBC R   |   4 let_eval   001BC4 R
  4 let_var    001BC1 R   |   4 lines_sk   001E66 R   |   4 list       001E14 R
  4 list_con   001C00 R   |   4 list_exi   001EA8 R   |   4 list_loo   001E86 R
  4 log2       002CB6 R   |   4 logical_   002C4D R   |   4 look_tar   0022D7 R
  4 loop_bac   002289 R   |   5 loop_dep   00001E R   |   4 loop_don   00229E R
  4 lshift     002A50 R   |   4 lt         001352 R   |   4 lt_tst     00103F R
  4 mem_peek   000590 R   |   4 mod24      000393 R   |   4 move       0013B8 GR
  4 move_dow   0013D7 R   |   4 move_era   000700 R   |   4 move_exi   0013F8 R
  4 move_lef   0009AB R   |   4 move_loo   0013DC R   |   4 move_prg   000740 R
  4 move_rig   0009B9 R   |   4 move_up    0013C9 R   |   4 mul24      000221 R
  4 mul_char   00133C R   |   4 mulu24_8   0001EE R   |   4 nbr_tst    000EFA R
  4 ne         001357 R   |   4 neg24      0001B7 R   |   4 neg_acc2   0001D1 R
  4 neg_ax     0001C9 R   |   4 new        00264A R   |   4 next       00223A R
  4 next_lin   0016F9 R   |   4 next_tok   001747 GR  |   4 no_match   0018C2 R
  4 number     000624 R   |   4 other      001068 R   |   4 overwrit   000BEB R
  2 pad        0016B8 GR  |   4 pad_ref    002F50 R   |   4 parse_bi   000DE0 R
  4 parse_in   000D8D R   |   4 parse_ke   000E63 R   |   4 parse_qu   000D38 R
  4 parse_sy   000E4B R   |   4 pause      00292C R   |   4 pause02    00293F R
  4 peek       002155 R   |   4 peek_byt   0005BE R   |   4 pin_mode   002AB9 R
  4 plus_tst   000FDF R   |   4 poke       002134 R   |   4 power_ad   0024EF R
  4 prcnt_ts   001000 R   |   4 print      001F21 R   |   4 print_ex   001F8A R
  4 print_fa   000603 R   |   4 print_he   000C20 GR  |   4 print_re   000483 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 print_st   000583 R   |   4 print_to   0017BB R   |   4 prog_siz   001D83 R
  4 program_   001D8B R   |   4 program_   00071A R   |   4 program_   000740 R
  4 prt_acc2   0017AD R   |   4 prt_basi   001EFD R   |   4 prt_i16    00179D R
  4 prt_loop   001F25 R   |   4 prt_peek   000406 GR  |   4 prt_reg1   000464 R
  4 prt_reg8   000442 R   |   4 prt_regs   00039C GR  |   5 ptr16      000018 GR
  5 ptr8       000019 R   |   4 putc       0008FD GR  |   4 puts       00095A GR
  4 qgetc      000906 GR  |   4 qkey       00287C GR  |   4 qmark_ts   000F8C R
  4 qsign      0026C5 R   |   4 random     002B46 R   |   4 read       002E3F R
  4 read01     002E41 R   |   4 read_int   003531 R   |   4 readln     000A5F GR
  4 readln_l   000A6C R   |   4 readln_q   000C08 R   |   4 refresh_   002CB1 R
  4 regs_sta   0003DF R   |   4 rel_exit   001ACB R   |   4 relation   001A79 R
  4 relop_st   00133F R   |   4 remark     002053 GR  |   4 repl       00053C R
  4 repl_exi   000564 R   |   4 reset_co   001F23 R   |   4 rest_con   001FA6 R
  4 restore    002DFF R   |   4 restore_   002E3A R   |   4 return     0023E1 R
  4 right_al   00112D GR  |   4 row_alig   000854 R   |   4 row_eras   0006D3 R
  4 row_eras   000700 R   |   4 row_loop   000641 R   |   4 rparnt_t   000F4A R
  4 rshift     002A7D R   |   7 rsign      00007C R   |   7 rsize      00007E R
  4 rt_msg     001615 R   |   4 run        0023FF R   |   4 run_app    000127 R
  4 run_it     002431 R   |   4 run_it_0   002433 R   |   5 rx1_head   00002D R
  5 rx1_queu   000025 R   |   5 rx1_tail   00002E R   |   4 save_app   0026F0 R
  4 save_con   001F96 R   |   4 scan_blo   00087D R   |   4 search_c   001C90 R
  4 search_d   0018A2 GR  |   4 search_e   0018EC R   |   4 search_l   000C42 GR
  4 search_l   000C51 R   |   4 search_n   0018A6 R   |   5 seedx      000013 R
  5 seedy      000015 R   |   4 select_p   002B16 R   |   4 send_esc   000982 R
  4 send_par   00098D R   |   4 set_data   002DF0 R   |   4 set_time   002C33 R
  4 sharp_ts   000F6B R   |   4 show       001ACE R   |   4 show_row   00062F R
  4 single_c   001335 R   |   4 skip       000EB4 R   |   4 skip_2_b   001765 R
  4 skip_str   00176E R   |   4 slash_ts   000FF5 R   |   4 sleep      002921 R
  4 software   00140B R   |   4 spaces     0009C7 GR  |   4 spi_clea   002EE4 R
  4 spi_disa   002ECC R   |   4 spi_enab   002E99 R   |   4 spi_rcv_   002F06 R
  4 spi_read   002F31 R   |   4 spi_sele   002F39 R   |   4 spi_send   002EF0 R
  4 spi_writ   002F11 R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   000FEA R   |   4 step       0021F6 R   |   4 stop       0025FE R
  4 store_lo   002213 R   |   4 str_matc   0018CF R   |   4 str_tst    000EEA R
  4 strcmp     001397 R   |   4 strcpy     0013A8 GR  |   4 strlen     00138C GR
  4 sub24      00017D R   |   4 symb_loo   000E4C R   |   4 syntax_e   001648 GR
  4 system_i   001451 R   |   5 tab_widt   000022 GR  |   4 tb_error   00164A GR
  4 term       0019EE R   |   4 term01     0019F6 R   |   4 term_exi   001A35 R
  4 test       0033C2 R   |   4 test_p     00057B R   |   2 tib        001668 GR
  4 tick_tst   000FA4 R   |   5 ticks      00000F R   |   4 timeout    002C4A R
  5 timer      000011 GR  |   4 timer2_i   000090 R   |   4 timer4_i   00009D R
  4 tk_id      001638 R   |   4 to         0021B8 R   |   4 to_eepro   000769 R
  4 to_flash   00076E R   |   4 to_hex_c   000C37 GR  |   4 to_upper   00182C GR
  4 token_ch   00107F R   |   4 token_ex   001083 R   |   4 tone       002498 R
  4 try_next   002E2A R   |   5 txtbgn     00001A GR  |   5 txtend     00001C GR
  4 uart1_ge   00090D GR  |   4 uart1_in   0008B8 R   |   4 uart1_pu   0008FD GR
  4 uart1_qg   000906 GR  |   4 uart1_se   0008C8 R   |   4 ubound     001BA3 R
  4 uflash     0028C4 R   |   4 unlock_e   00069D R   |   4 unlock_f   0006B8 R
  4 until      002D2E R   |   4 user_int   000046 R   |   4 usr        0028D9 R
  4 var_name   001185 GR  |   5 vars       00002F GR  |   4 wait       002059 R
  4 warm_ini   001482 R   |   4 warm_sta   0016D2 R   |   4 words      002BCD R
  4 words_co   002C1D R   |   4 write      0027DF R   |   4 write_bl   000819 GR
  4 write_bu   00075A R   |   4 write_by   00079F R   |   4 write_ee   0007DB R
  4 write_ex   000814 R   |   4 write_fl   0007C5 R   |   4 write_nb   00083E R
  2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3584   flags    0
   5 DATA       size     7D   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

