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
                                    144 
                                    145 ;--------------------------------------
                                    146 ;   assembler flags 
                                    147 ;-------------------------------------
                                    148 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    149 
                                    150      .macro _usec_dly n 
                                    151     ldw x,#(16*n-2)/4
                                    152     decw x
                                    153     nop 
                                    154     jrne .-4
                                    155     .endm 
                                    156     
                                    157     ; load X register with 
                                    158     ; entry point of dictionary
                                    159     ; before calling 'search_dict'
                                    160     .macro _ldx_dict dict_name
                                    161     ldw x,#dict_name+2
                                    162     .endm 
                                    163 
                                    164     ; reset BASIC pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     ; to beginning of last token
                                    166     ; extracted except if it was end of line 
                                    167     .macro _unget_token 
                                    168      mov in,in.saved  
                                    169     .endm
                                    170 
                                    171 
                                    172     ; extract code address for 
                                    173     ; TK_CMD|TK_FUNC|TK_IFUNC|TK_CFUNC 
                                    174     .macro _get_code_addr
                                    175         ldw x,(x)
                                    176         inc in 
                                    177         inc in 
                                    178     .endm 
                                    179 
                                    180 
                                    181 
                                    182 ;---------------------------------------
                                    183 ;    xtack manipulation macros 
                                    184 ;    Y is used as xstack pointer  
                                    185 ;----------------------------------------
                                    186     ; pop in A:X from XSTACK 
                                    187     .macro _xpop 
                                    188     ld a,(y)
                                    189     ldw x,y 
                                    190     ldw x,(1,x)
                                    191     addw y,#CELL_SIZE 
                                    192     .endm 
                                    193 
                                    194     ; push A:X  to XSTACK 
                                    195     .macro _xpush 
                                    196     subw y,#CELL_SIZE
                                    197     ld (y),a 
                                    198     ldw (1,y),x 
                                    199     .endm 
                                    200 
                                    201     ; drop from XSTACK 
                                    202     .macro _xdrop 
                                    203     addw y,#CELL_SIZE 
                                    204     .endm 
                                    205 
                                    206     ; @T fetch top xstack 
                                    207     .macro _at_top
                                    208     ld a,(y)
                                    209     ldw x,y 
                                    210     ldw x,(1,x)
                                    211     .endm 
                                    212 
                                    213     ; @N  fetch next on xstack 
                                    214     .macro _at_next 
                                    215     ld a,(3,y)
                                    216     ldw x,y 
                                    217     ldw x,(4,x)
                                    218     .endm 
                                    219 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                    220     ; !T put on top of xtack 
                                    221     .macro _store_top 
                                    222     ld (y),a 
                                    223     ldw (1,y),x     
                                    224     .endm 
                                    225 
                                    226     ; !N put next on xstack 
                                    227     .macro _store_next 
                                    228     ld (3,y),a 
                                    229     ldw (4,y),x 
                                    230     .endm 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                     35   
                                     36 
                                     37 ;;-----------------------------------
                                     38     .area SSEG (ABS)
                                     39 ;; working buffers and stack at end of RAM. 	
                                     40 ;;-----------------------------------
      001690                         41     .org RAM_SIZE-STACK_SIZE-XSTACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         42 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         43 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016E0                         44 pad:: .ds PAD_SIZE             ; working buffer
      001760                         45 xstack_full:: .ds XSTACK_SIZE*CELL_SIZE   ; expression stack 
      00179C                         46 xstack_unf:: ; xstack underflow 
      00179C                         47 stack_full:: .ds STACK_SIZE   ; control stack 
      001828                         48 stack_unf: ; stack underflow ; control_stack bottom 
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
      008050 82 00 89 19             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
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
      008096 CD 85 0C         [ 4]  120 	call print_registers
      008099 CD 85 B7         [ 4]  121 	call cmd_itf
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
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
      0080E5 CD 89 E8         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 72         [ 2]  179 5$:	jp warm_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
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
      00818E CD 89 46         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9D EE         [ 4]  280 	call func_eefree 
      0081A1 CD 9D 23         [ 4]  281 	call ubound 
      0081A4 CD 95 1E         [ 4]  282 	call clear_basic
      0081A7 CD A6 53         [ 4]  283 	call beep_1khz  
      0081AA CD 94 CB         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 8E         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 72         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 94 FC         [ 4]  293 	call warm_init
      0081BC AE B6 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 89 E8         [ 4]  299 	call puts 
      0081CF CD 9F 10         [ 4]  300 	call program_info 
      0081D2 CC A5 EE         [ 2]  301 	jp run_it_02  
      0081D5 20 FE            [ 2]  302     jra .  
                                    303 
      0081D7 20 61 75 74 6F 20 72   304 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal  72-Bits]



             72 61 6D 0A 00
                                    305 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
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
      00016A                         37 dup24:
      00016A                         38     _at_top 
      0081E6 61 6D            [ 1]    1     ld a,(y)
      0081E8 0A               [ 1]    2     ldw x,y 
      0081E9 00 01            [ 2]    3     ldw x,(1,x)
      0081EA                         39     _xpush 
      0081EA 90 F6 93 EE      [ 2]    1     subw y,#CELL_SIZE
      0081EE 01 72            [ 1]    2     ld (y),a 
      0081F0 A2 00 03         [ 2]    3     ldw (1,y),x 
      0081F3 90               [ 4]   40     ret 
                                     41 
                                     42 
                                     43 
                                     44 ;-------------------------------
                                     45 ; add24 
                                     46 ; add 24 bits integers 
                                     47 ;------------------------------
      000179                         48 add24: ; ( N T -- N+T )
      000179                         49     _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      0081F4 F7 90            [ 1]    1     ld a,(y)
      0081F6 EF               [ 1]    2     ldw x,y 
      0081F7 01 81            [ 2]    3     ldw x,(1,x)
      0081F9 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081F9 90               [ 2]   50     pushw x  
      0081FA F6               [ 1]   51     push a  
      000184                         52     _at_top  
      0081FB 93 EE            [ 1]    1     ld a,(y)
      0081FD 01               [ 1]    2     ldw x,y 
      0081FE 72 A9            [ 2]    3     ldw x,(1,x)
      008200 00 03 89         [ 2]   53     addw x,(2,sp)
      008203 88 90            [ 1]   54     adc a, (1,sp)
      00018E                         55     _store_top 
      008205 F6 93            [ 1]    1     ld (y),a 
      008207 EE 01 72         [ 2]    2     ldw (1,y),x     
      000193                         56     _drop 3 
      00820A FB 02            [ 2]    1     addw sp,#3 
      00820C 19               [ 4]   57     ret 
                                     58 
                                     59 ;-------------------------------
                                     60 ; sub24 
                                     61 ; subtract 24 bits integers 
                                     62 ;------------------------------
      000196                         63 sub24: ; ( N T -- N-T ) 
      000196                         64     _xpop 
      00820D 01 90            [ 1]    1     ld a,(y)
      00820F F7               [ 1]    2     ldw x,y 
      008210 90 EF            [ 2]    3     ldw x,(1,x)
      008212 01 5B 03 81      [ 2]    4     addw y,#CELL_SIZE 
      008216 89               [ 2]   65     pushw x 
      008216 90               [ 1]   66     push  a
      0001A1                         67     _at_top  
      008217 F6 93            [ 1]    1     ld a,(y)
      008219 EE               [ 1]    2     ldw x,y 
      00821A 01 72            [ 2]    3     ldw x,(1,x)
      00821C A9 00 03         [ 2]   68     subw x,(2,sp) 
      00821F 89 88            [ 1]   69     sbc a, (1,sp)
      0001AB                         70     _store_top  
      008221 90 F6            [ 1]    1     ld (y),a 
      008223 93 EE 01         [ 2]    2     ldw (1,y),x     
      0001B0                         71     _drop 3 
      008226 72 F0            [ 2]    1     addw sp,#3 
      008228 02               [ 4]   72     ret 
                                     73 
                                     74 ;------------------------------
                                     75 ; cp24  N T -- 0x800000|0|0x010000
                                     76 ;------------------------------
      0001B3                         77 cp24:
      0001B3                         78     _xpop 
      008229 12 01            [ 1]    1     ld a,(y)
      00822B 90               [ 1]    2     ldw x,y 
      00822C F7 90            [ 2]    3     ldw x,(1,x)
      00822E EF 01 5B 03      [ 2]    4     addw y,#CELL_SIZE 
      008232 81 00 0C         [ 1]   79     ld acc24,a 
      008233 CF 00 0D         [ 2]   80     ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      0001C2                         81     _at_top 
      008233 90 F6            [ 1]    1     ld a,(y)
      008235 93               [ 1]    2     ldw x,y 
      008236 EE 01            [ 2]    3     ldw x,(1,x)
      008238 72 A9 00 03      [ 2]   82     subw x,acc16
      00823C C7 00 0D         [ 1]   83     sbc a,acc24
      00823F CF 00            [ 1]   84     jrslt 1$
      008241 0E 90            [ 1]   85     jrne 2$
      008243 F6               [ 2]   86     tnzw x 
      008244 93 EE            [ 1]   87     jrne 2$
      008246 01               [ 1]   88     clr a 
      008247 72 B0            [ 2]   89     jra 9$ 
      0001D8                         90 1$: ; i1 < i2 
      008249 00 0E            [ 1]   91     ld a,#255
      00824B C2 00            [ 2]   92     jra 9$ 
      0001DC                         93 2$: ; i1 > i2 
      00824D 0D 2F            [ 1]   94     ld a,#1 
      00824F 08               [ 1]   95 9$: clrw x
      0001DF                         96      _store_top 
      008250 26 0A            [ 1]    1     ld (y),a 
      008252 5D 26 07         [ 2]    2     ldw (1,y),x     
      008255 4F               [ 4]   97     ret 
                                     98 
                                     99 ;-------------------------------
                                    100 ; cp24_ax 
                                    101 ; compare acc24 with A:X 
                                    102 ;-------------------------------
      0001E5                        103 cp24_ax:
      008256 20               [ 1]  104     push a 
      008257 06 00 0D         [ 2]  105     cpw x,acc16 
      008258 C2 00 0C         [ 1]  106     sbc a,acc24
      008258 A6               [ 1]  107     pop a 
      008259 FF               [ 4]  108     ret 
                                    109 
                                    110 
                                    111 ;-------------------------------
                                    112 ; abs24 
                                    113 ; abolute value of top  
                                    114 ;-------------------------------
      0001EE                        115 abs24: ; ( i -- u )
      00825A 20 02            [ 1]  116     ld a,(y)
      00825C A1 80            [ 1]  117     cp a,#0x80 
      00825C A6 01            [ 1]  118     jrpl neg24 ; negative integer
      00825E 5F               [ 4]  119     ret  
                                    120 
                                    121 ;----------------------------
                                    122 ;  one's compleement 
                                    123 ;----------------------------
      0001F5                        124 cpl24:  ; i -- ~i 
      00825F 90 F7            [ 1]  125     cpl (y) 
      008261 90 EF 01         [ 1]  126     cpl (1,y)
      008264 81 63 02         [ 1]  127     cpl (2,y)
      008265 81               [ 4]  128     ret 
                                    129 
                                    130 ;----------------------------    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                    131 ; two'2 complement of top  
                                    132 ;---------------------------
      0001FE                        133 neg24: ; (i -- -i )
      0001FE                        134     _at_top
      008265 88 C3            [ 1]    1     ld a,(y)
      008267 00               [ 1]    2     ldw x,y 
      008268 0E C2            [ 2]    3     ldw x,(1,x)
      00826A 00               [ 1]  135     cpl  a  
      00826B 0D               [ 2]  136     cplw x 
      00826C 84 81 01         [ 2]  137     addw x,#1
      00826E A9 00            [ 1]  138     adc a,#0
      00020A                        139     _store_top  
      00826E 90 F6            [ 1]    1     ld (y),a 
      008270 A1 80 2A         [ 2]    2     ldw (1,y),x     
      008273 0A               [ 4]  140 9$: ret 
                                    141 
                                    142 ;-----------------------------
                                    143 ; negate integer in A:X 
                                    144 ;----------------------------
      000210                        145 neg_ax:
      008274 81               [ 1]  146     cpl  a  
      008275 53               [ 2]  147     cplw x 
      008275 90 73 90         [ 2]  148     addw x,#1
      008278 63 01            [ 1]  149     adc a,#0
      00827A 90               [ 4]  150     ret 
                                    151 
                                    152 ;------------------------------------
                                    153 ;  two's complement of acc24 
                                    154 ;-------------------------------------
      000218                        155 neg_acc24: ; 
      00827B 63 02 81 0C      [ 1]  156     cpl acc24 
      00827E 72 53 00 0D      [ 1]  157     cpl acc16 
      00827E 90 F6 93 EE      [ 1]  158     cpl acc8
      008282 01 43 53 1C      [ 1]  159     inc acc8 
      008286 00 01            [ 1]  160     jrne 9$
      008288 A9 00 90 F7      [ 1]  161     inc acc16 
      00828C 90 EF            [ 1]  162     jrne 9$
      00828E 01 81 00 0C      [ 1]  163     inc acc24 
      008290 81               [ 4]  164 9$: ret 
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
      000235                        180 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008290 43               [ 1]  181     push a 
      008291 53 1C 00 01      [ 1]  182 	clr acc32
      008295 A9 00 81 0C      [ 1]  183     clr acc24  
                                    184 ; multiply top bits 7..0 * U8   	
      008298 90 E6 02         [ 1]  185     ld a,(2,Y) ; top least byte  
      008298 72               [ 1]  186     ld xl,a 
      008299 53 00            [ 1]  187     ld a,(U8,sp)
      00829B 0D               [ 4]  188     mul x,a 
      00829C 72 53 00         [ 2]  189     ldw acc16,x 
                                    190 ; multiply top bits 15..8 * U8     
      00829F 0E 72 53         [ 1]  191     ld a,(1,Y) ; top middle byte 
      0082A2 00               [ 1]  192     ld xl,a 
      0082A3 0F 72            [ 1]  193     ld a,(U8,sp) 
      0082A5 5C               [ 4]  194     mul x,a 
      0082A6 00 0F 26 0A      [ 2]  195     addw x,acc24
      0082AA 72 5C 00 0E      [ 1]  196     rlc acc32 
      0082AE 26 04 72         [ 2]  197     ldw acc24,x 
                                    198 ; multiply top bits 23..16 * 8 
      0082B1 5C 00            [ 1]  199     ld a,(Y)
      0082B3 0D               [ 1]  200     ld xl,a 
      0082B4 81 01            [ 1]  201     ld a,(U8,sp)
      0082B5 42               [ 4]  202     mul x,a 
      0082B5 88 72 5F 00      [ 2]  203     addw x,acc32
      0082B9 0C               [ 1]  204     rlwa x 
      0082BA 72               [ 1]  205     tnz a 
      0082BB 5F 00            [ 1]  206     jreq 1$
      0082BD 0D 90            [ 1]  207     ld a,#ERR_OVERFLOW
      0082BF E6 02 97         [ 2]  208     jp tb_error 
      00026D                        209 1$:
      0082C2 7B               [ 1]  210     ld a,xh  
      0082C3 01 42 CF         [ 2]  211     ldw x,acc16   
      000271                        212     _drop VSIZE 
      0082C6 00 0E            [ 2]    1     addw sp,#VSIZE 
      0082C8 90               [ 4]  213     ret
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
      000274                        224 mul24:
      000274                        225     _vars VSIZE
      0082C9 E6 01            [ 2]    1     sub sp,#VSIZE 
      0082CB 97               [ 1]  226     clrw x 
      0082CC 7B 01            [ 2]  227     ldw (PROD,sp),x 
      0082CE 42 72            [ 2]  228     ldw (PROD+2,sp),x
      00027B                        229     _xpop 
      0082D0 BB 00            [ 1]    1     ld a,(y)
      0082D2 0D               [ 1]    2     ldw x,y 
      0082D3 72 59            [ 2]    3     ldw x,(1,x)
      0082D5 00 0C CF 00      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0082D9 0D               [ 1]  230     tnz a 
      0082DA 90 F6            [ 1]  231     jrpl 0$
      0082DC 97 7B            [ 1]  232     cpl (PROD_SIGN,sp)
      0082DE 01 42 72         [ 4]  233     call neg_ax 
      00028C                        234 0$:    
      0082E1 BB 00            [ 1]  235     ld (N1,sp),a 
      0082E3 0C 02            [ 2]  236     ldw (N1+1,sp),x
      0082E5 4D 27            [ 1]  237     tnz (Y)
      0082E7 05 A6            [ 1]  238     jrpl 2$ 
      0082E9 10 CC            [ 1]  239     cpl (PROD_SIGN,sp) 
      0082EB 96 E8 FE         [ 4]  240     call neg24
      0082ED                        241 2$: 
      0082ED 9E CE            [ 1]  242     ld a,(N1+2,sp); least byte     
      0082EF 00 0E            [ 1]  243     jreq 4$
      0082F1 5B 01 81         [ 4]  244     call mulu24_8
      0082F4 4D               [ 1]  245     tnz a 
      0082F4 52 07            [ 1]  246     jrmi 8$ ; overflow  
      0082F6 5F 1F            [ 1]  247     ld (PROD,sp),a
      0082F8 01 1F            [ 2]  248     ldw (PROD+1,sp),x 
      0002A7                        249 4$:
      0082FA 03 90            [ 1]  250     ld a,(N1+1,sp); middle byte     
      0082FC F6 93            [ 1]  251     jreq 5$
      0082FE EE 01 72         [ 4]  252     call mulu24_8
      008301 A9               [ 1]  253     tnz a 
      008302 00 03            [ 1]  254     jrne 8$  ; overflow 
      008304 4D 2A 05         [ 2]  255     addw x,(PROD,sp)
      008307 03 04            [ 1]  256     jrv 8$ ; overflow
      008309 CD 82            [ 2]  257     ldw (PROD,sp),x 
      0002B8                        258 5$:
      00830B 90 05            [ 1]  259     ld a,(N1,sp) ; high byte 
      00830C 27 10            [ 1]  260     jreq 6$
      00830C 6B 05 1F         [ 4]  261     call mulu24_8
      00830F 06               [ 1]  262     rrwa x 
      008310 90               [ 2]  263     tnzw x 
      008311 7D 2A            [ 1]  264     jrne 8$ ; overflow 
      008313 05               [ 1]  265     tnz a 
      008314 03 04            [ 1]  266     jrmi 8$ ; overflow 
      008316 CD 82            [ 1]  267     add a,(PROD,sp)
      008318 7E 01            [ 1]  268     ld (PROD,sp),a 
      008319 29 13            [ 1]  269     jrv 8$ ; overflow 
      0002CC                        270 6$:
      008319 7B 07            [ 1]  271     ld a,(PROD,sp)
      00831B 27 0A            [ 2]  272     ldw x,(PROD+1,sp)
      00831D CD 82            [ 1]  273     tnz (PROD_SIGN,sp)
      00831F B5 4D            [ 1]  274     jreq 9$
      008321 2B 3C 6B         [ 4]  275     call neg_ax 
      0002D7                        276 9$:
      0002D7                        277     _store_top 
      008324 01 1F            [ 1]    1     ld (y),a 
      008326 02 EF 01         [ 2]    2     ldw (1,y),x     
      008327                        278     _drop VSIZE 
      008327 7B 06            [ 2]    1     addw sp,#VSIZE 
      008329 27               [ 4]  279     ret 
      0002DF                        280 8$: ; overflow
      00832A 0D CD            [ 1]  281     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00832C 82 B5 4D         [ 2]  282     jp tb_error 
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
      0002E4                        296 divu24_8:
      00832F 26               [ 2]  297 	pushw x ; save x
      008330 2E               [ 1]  298 	push a 
                                    299 	; ld dividend UU:MM bytes in X
      008331 72 FB 01         [ 2]  300 	ldw x,acc24
      008334 29 29            [ 1]  301 	ld a,(U8,SP) ; divisor
      008336 1F               [ 2]  302 	div x,a ; UU:MM/U8
      008337 01               [ 1]  303 	push a  ;save remainder
      008338 CF 00 0C         [ 2]  304     ldw acc24,x ; quotient 
      008338 7B               [ 1]  305 	pop a
      008339 05               [ 1]  306 	ld xh,a
      00833A 27 10 CD         [ 1]  307 	ld a,acc8
      00833D 82               [ 1]  308 	ld xl,a
      00833E B5 01            [ 1]  309 	ld a,(U8,sp) ; divisor
      008340 5D               [ 2]  310 	div x,a  ; R:LL/U8
      008341 26 1C            [ 1]  311 	ld (U8,sp),a ; save remainder
      008343 4D               [ 1]  312 	ld a,xl
      008344 2B 19 1B         [ 1]  313 	ld acc8,a
      008347 01               [ 1]  314 	pop a
      008348 6B               [ 2]  315 	popw x
      008349 01               [ 4]  316 	ret
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
      000302                        332 div24:
      000302                        333     _vars VSIZE 
      00834A 29 13            [ 2]    1     sub sp,#VSIZE 
      00834C 0F 06            [ 1]  334     clr (RSIGN,sp)
      00834C 7B 01            [ 1]  335     clr (QSIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      000308                        336     _xpop 
      00834E 1E 02            [ 1]    1     ld a,(y)
      008350 0D               [ 1]    2     ldw x,y 
      008351 04 27            [ 2]    3     ldw x,(1,x)
      008353 03 CD 82 90      [ 2]    4     addw y,#CELL_SIZE 
      008357 4D               [ 1]  337     tnz a 
      008357 90 F7            [ 1]  338     jrpl 0$ 
      008359 90 EF            [ 1]  339     cpl (QSIGN,sp)
      00835B 01 5B 07         [ 4]  340     call neg_ax
      000319                        341 0$:
      00835E 81 01            [ 1]  342     ld  (DIVISOR,sp),a
      00835F 1F 02            [ 2]  343     ldw (DIVISOR+1,sp),x
      00835F A6 10            [ 1]  344     or a,(DIVISOR+1,sp)
      008361 CC 96            [ 1]  345     or a,(DIVISOR+2,sp)
      008363 E8 05            [ 1]  346     jrne 1$ 
      008364 A6 04            [ 1]  347     ld a,#ERR_DIV0 
      008364 89 88 CE         [ 2]  348     jp tb_error 
      000328                        349 1$: ; dividend  
      000328                        350     _at_top
      008367 00 0D            [ 1]    1     ld a,(y)
      008369 7B               [ 1]    2     ldw x,y 
      00836A 01 62            [ 2]    3     ldw x,(1,x)
      00836C 88               [ 1]  351     tnz a 
      00836D CF 00            [ 1]  352     jrpl 2$
      00836F 0D 84 95         [ 4]  353     call neg_ax
      008372 C6 00            [ 1]  354     cpl (QSIGN,sp)
      008374 0F 97            [ 1]  355     cpl (RSIGN,sp)
      000337                        356 2$: 
                                    357 ;    ld acc24,a 
                                    358 ;    ldw acc16,x 
      000337                        359     _store_top 
      008376 7B 01            [ 1]    1     ld (y),a 
      008378 62 6B 01         [ 2]    2     ldw (1,y),x     
      00837B 9F C7            [ 1]  360     ld a,#24 
      00837D 00 0F            [ 1]  361     ld (CNTR,sp),a
      00837F 84 85            [ 1]  362     ld a,(DIVISOR,sp)
      008381 81 02            [ 2]  363     ldw x,(DIVISOR+1,sp)
                                    364 ; dividend >= divisor ? 
      008382 CD 01 E5         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      008382 52 06            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      008384 0F 06 0F         [ 1]  368     ld a,acc24 
      008387 05 90 F6         [ 2]  369     ldw x,acc16 
      00838A 93 EE 01 72      [ 1]  370     clr acc24 
      00838E A9 00 03 4D      [ 1]  371     clr acc16 
      008392 2A 05 03 05      [ 1]  372     clr acc8 
      008396 CD 82            [ 2]  373     jra 6$
      00035D                        374 22$:     
      008398 90               [ 1]  375     clr a 
      008399 5F               [ 1]  376     clrw x 
      008399 6B               [ 1]  377     rcf  
      000360                        378 3$: ; shift carry in acc24 bit 0 
      00839A 01 1F 02         [ 1]  379     rlc (2,y) 
      00839D 1A 02 1A         [ 1]  380     rlc (1,y)
      0083A0 03 26            [ 1]  381     rlc (Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      0083A2 05               [ 2]  382     rlcw x  
      0083A3 A6               [ 1]  383     rlc a
      0083A4 04 CC 96         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083A7 E8 01            [ 1]  385     sbc a,(DIVISOR,sp)
      0083A8 24 05            [ 1]  386     jrnc 5$
      0083A8 90 F6 93         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083AB EE 01            [ 1]  388     adc a,(DIVISOR,sp)
      000376                        389 5$: ; shift carry in QUOTIENT 
      0083AD 4D               [ 1]  390     ccf
      0083AE 2A 07            [ 1]  391     dec (CNTR,sp)
      0083B0 CD 82            [ 1]  392     jrne 3$ 
                                    393 ; shift quotient last bit     
      0083B2 90 03 05         [ 1]  394     rlc (2,y)
      0083B5 03 06 01         [ 1]  395     rlc (1,y) 
      0083B7 90 79            [ 1]  396     rlc (y) 
      000383                        397 6$:    
      0083B7 90 F7            [ 1]  398     ld (DIVISOR,sp),a 
      0083B9 90 EF            [ 2]  399     ldw (DIVISOR+1,sp),x 
      0083BB 01 A6            [ 1]  400     tnz (QSIGN,sp)
      0083BD 18 6B            [ 1]  401     jreq 8$
      0083BF 04 7B 01         [ 4]  402     call neg24
      00038E                        403 8$: 
      0083C2 1E 02            [ 1]  404     ld a,(DIVISOR,sp)
      0083C4 CD 82            [ 2]  405     ldw x,(DIVSOR+1,sp)
      000392                        406 81$:
      0083C6 65 23            [ 1]  407     tnz (RSIGN,sp)
      0083C8 14 C6            [ 1]  408     jreq 9$
      0083CA 00 0D CE         [ 4]  409     call neg_ax       
      000399                        410 9$: _drop VSIZE 
      0083CD 00 0E            [ 2]    1     addw sp,#VSIZE 
      0083CF 72               [ 4]  411     ret 
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
      00039C                        423 mod24:
      0083D0 5F 00 0D         [ 4]  424     call div24 
      00039F                        425     _store_top  ; replace quotient by remainder 
      0083D3 72 5F            [ 1]    1     ld (y),a 
      0083D5 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083D8 5F               [ 4]  426     ret 
                                    427 
                                    428 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
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
      0003A5                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003A5                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003A5                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003A5                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003A5                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003A5                         37 prt_regs::
      0083D9 00 0F 20         [ 2]   38 	ldw x,#regs_state 
      0083DC 26 09 68         [ 4]   39 	call puts
                                     40 ; register PC
      0083DD 16 01            [ 2]   41 	ldw y,(1,sp)
      0083DD 4F 5F 98         [ 2]   42 	ldw x,#REG_EPC 
      0083E0 CD 04 6D         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      0083E0 90 69            [ 1]   45 	ld a,(R_CC,sp)
      0083E2 02 90 69         [ 2]   46 	ldw x,#REG_CC 
      0083E5 01 90 79         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      0083E8 59 49            [ 1]   49 	ld a,(R_A,sp)
      0083EA 72 F0 02         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0083ED 12 01 24         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      0083F0 05 72            [ 2]   53 	ldw y,(R_X,sp)
      0083F2 FB 02 19         [ 2]   54 	ldw x,#REG_X 
      0083F5 01 04 6D         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      0083F6 16 03            [ 2]   57 	ldw y,(R_Y,sp)
      0083F6 8C 0A 04         [ 2]   58 	ldw x,#REG_Y 
      0083F9 26 E5 90         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      0083FC 69 02            [ 1]   61 	ldw y,sp
      0083FE 90 69 01 90      [ 2]   62 	addw y,#6+ARG_OFS  
      008402 79 05 32         [ 2]   63 	ldw x,#REG_SP
      008403 CD 04 6D         [ 4]   64 	call prt_reg16
      008403 6B 01            [ 1]   65 	ld a,#CR 
      008405 1F 02 0D         [ 4]   66 	call putc
      008408 05 27 03         [ 4]   67 	call putc   
      00840B CD               [ 4]   68 	ret 
                                     69 
                                     70 
      00840C 82 7E 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      00840E                         81 prt_peek::
      00840E 7B               [ 2]   82 	pushw x 
      00840F 01 1E 02 0A      [ 1]   83 	mov base,#16 
      008412 CD 18 12         [ 4]   84 	call prt_i16  
      008412 0D 06            [ 1]   85 	ld a,#': 
      008414 27 03 CD         [ 4]   86 	call putc 
      008417 82 90            [ 1]   87 	ld a,#SPACE 
      008419 5B 06 81         [ 4]   88 	call putc 
      00841C 85               [ 2]   89 	popw x 
      00841C CD               [ 1]   90 	ld a,(x)
      00841D 83               [ 1]   91 	clrw x 
      00841E 82               [ 1]   92 	ld xl,a 
      00841F 90 F7 90 EF      [ 1]   93 	mov base,#10 
      008423 01 81 12         [ 4]   94 	call prt_i16 
      008425 81               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      00042D                        102 ledon:
      008425 AE 84 68 CD      [ 1]  103     bset PC_ODR,#LED2_BIT
      008429 89               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      000432                        107 ledoff:
      00842A E8 16 01 AE      [ 1]  108     bres PC_ODR,#LED2_BIT 
      00842E 85               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      000437                        112 ledtoggle:
      00842F 9C CD            [ 1]  113     ld a,#LED2_MASK
      008431 84 ED 7B         [ 1]  114     xor a,PC_ODR
      008434 08 AE 85         [ 1]  115     ld PC_ODR,a
      008437 AD               [ 4]  116     ret 
                                    117 
      000440                        118 left_paren:
      008438 CD 84            [ 1]  119 	ld a,#SPACE 
      00843A CB 7B 07         [ 4]  120 	call putc
      00843D AE 85            [ 1]  121 	ld a,#'( 
      00843F A9 CD 84         [ 4]  122 	call putc 	
      008442 CB               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      00044B                        133 prt_reg8:
      008443 16               [ 1]  134 	push a 
      008444 05 AE 85         [ 4]  135 	call puts 
      008447 A5 CD            [ 1]  136 	ld a,(1,sp) 
      008449 84               [ 1]  137 	clrw x 
      00844A ED               [ 1]  138 	ld xl,a 
      00844B 16 03 AE 85      [ 1]  139 	mov base,#16
      00844F A1 CD 84         [ 4]  140 	call prt_i16  
      008452 ED 90 96         [ 4]  141 	call left_paren 
      008455 72               [ 1]  142 	pop a 
      008456 A9               [ 1]  143 	clrw x 
      008457 00               [ 1]  144 	ld xl,a 
      008458 08 AE 85 B2      [ 1]  145 	mov base,#10 
      00845C CD 84 ED         [ 4]  146 	call prt_i16  
      00845F A6 0D            [ 1]  147 	ld a,#') 
      008461 CD 89 8B         [ 4]  148 	call putc
      008464 CD               [ 4]  149 	ret
                                    150 
                                    151 ;--------------------------------
                                    152 ; print 16 bits register 
                                    153 ; input:
                                    154 ;   X   point register name 
                                    155 ;   Y   register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                    156 ; output:
                                    157 ;  none
                                    158 ;--------------------------------
      00046D                        159 prt_reg16: 
      008465 89 8B            [ 2]  160 	pushw y 
      008467 81 0A 72         [ 4]  161 	call puts 
      00846A 65 67            [ 2]  162 	ldw x,(1,sp) 
      00846C 69 73 74 65      [ 1]  163 	mov base,#16 
      008470 72 73 20         [ 4]  164 	call prt_i16  
      008473 73 74 61         [ 4]  165 	call left_paren 
      008476 74               [ 2]  166 	popw x 
      008477 65 0A 2D 2D      [ 1]  167 	mov base,#10 
      00847B 2D 2D 2D         [ 4]  168 	call prt_i16  
      00847E 2D 2D            [ 1]  169 	ld a,#') 
      008480 2D 2D 2D         [ 4]  170 	call putc
      008483 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      00048C                        177 print_registers:
      008484 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      008487 2D 2D 2D         [ 4]  179 	call puts
                                    180 ; print EPC 
      00848A 2D 2D 2D         [ 2]  181 	ldw x, #REG_EPC
      00848D 0A 00 68         [ 4]  182 	call puts 
      00848F 7B 0B            [ 1]  183 	ld a, (11,sp)
      00848F 89 35 10         [ 1]  184 	ld acc8,a 
      008492 00 0B            [ 1]  185 	ld a, (10,sp) 
      008494 CD 98 92         [ 1]  186 	ld acc16,a 
      008497 A6 3A            [ 1]  187 	ld a,(9,sp) 
      008499 CD 89 8B         [ 1]  188 	ld acc24,a
      00849C A6               [ 1]  189 	clrw x  
      00849D 20 CD            [ 1]  190 	ld a,#16
      00849F 89 8B 85         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084A2 F6 5F 97         [ 2]  193 	ldw x,#REG_X
      0084A5 35 0A            [ 2]  194 	ldw y,(5,sp)
      0084A7 00 0B CD         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084AA 98 92 81         [ 2]  197 	ldw x,#REG_Y
      0084AD 16 07            [ 2]  198 	ldw y, (7,sp)
      0084AD 72 1A 50         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084B0 0A 81 29         [ 2]  201 	ldw x,#REG_A
      0084B2 7B 04            [ 1]  202 	ld a, (4,sp) 
      0084B2 72 1B 50         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084B5 0A 81 2D         [ 2]  205 	ldw x,#REG_CC 
      0084B7 7B 03            [ 1]  206 	ld a, (3,sp) 
      0084B7 A6 20 C8         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084BA 50 0A C7         [ 2]  209 	ldw x,#REG_SP
      0084BD 50 0A            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0084BF 81 A9 00 0C      [ 2]  211 	addw y,#12
      0084C0 CD 04 6D         [ 4]  212 	call prt_reg16  
      0084C0 A6 20            [ 1]  213 	ld a,#'\n' 
      0084C2 CD 89 8B         [ 4]  214 	call putc
      0084C5 A6               [ 4]  215 	ret
                                    216 
      0084C6 28 CD 89 8B 81 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0084CB 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      0084CB 88 CD 89 E8            219 REG_Y:   .asciz "\nY:" 
      0084CF 7B 01 5F 97            220 REG_X:   .asciz "\nX:"
      0084D3 35 10 00 0B            221 REG_A:   .asciz "\nA:" 
      0084D7 CD 98 92 CD 84         222 REG_CC:  .asciz "\nCC:"
      0084DC C0 84 5F 97 35         223 REG_SP:  .asciz "\nSP:"
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
      000537                        235 cmd_itf:
      0084E1 0A 00            [ 2]  236 	sub sp,#VSIZE 
      0084E3 0B CD 98 92      [ 1]  237 	clr farptr 
      0084E7 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      0084EB 8B 81 00 1A      [ 1]  239 	clr farptr+2  
      0084ED                        240 repl:
      0084ED 90 89            [ 1]  241 	ld a,#CR 
      0084EF CD 89 E8         [ 4]  242 	call putc 
      0084F2 1E 01            [ 1]  243 	ld a,#'? 
      0084F4 35 10 00         [ 4]  244 	call putc
      0084F7 0B CD 98 92      [ 1]  245 	clr in.w 
      0084FB CD 84 C0 85      [ 1]  246 	clr in 
      0084FF 35 0A 00         [ 4]  247 	call readln
      008502 0B CD 98 92      [ 2]  248 	ldw y,#tib  
      008506 A6 29            [ 1]  249 	ld a,(y)
      008508 CD 89            [ 1]  250 	jreq repl  
      00850A 8B 81 00 01      [ 1]  251 	inc in 
      00850C CD 18 A8         [ 4]  252 	call to_upper 
      00850C AE 85            [ 1]  253 	cp a,#'Q 
      00850E 5F CD            [ 1]  254 	jrne test_p
      00056D                        255 repl_exit:
      008510 89 E8 AE 85      [ 1]  256 	clr tib 
      008514 9C CD 89 E8      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008518 7B 0B C7 00      [ 1]  258 	clr in 
      000579                        259 	_drop #VSIZE 	
      00851C 0F 7B            [ 2]    1     addw sp,##VSIZE 
      00851E 0A               [ 4]  260 	ret  
      00057C                        261 invalid:
      00851F C7 00 0E         [ 2]  262 	ldw x,#invalid_cmd 
      008522 7B 09 C7         [ 4]  263 	call puts 
      008525 00 0D            [ 2]  264 	jra repl 
      000584                        265 test_p:	
      008527 5F A6            [ 1]  266     cp a,#'P 
      008529 10 CD            [ 1]  267 	jreq mem_peek
      00852B 98 A9            [ 1]  268     cp a,#'S 
      00852D AE 85            [ 1]  269 	jrne invalid 
      00058C                        270 print_string:	
      00852F A5 16 05         [ 4]  271 	call get_token
      008532 CD 84            [ 1]  272 	cp a,#TK_INTGR 
      008534 ED AE            [ 1]  273 	jrne invalid 
      008536 85 A1 16         [ 4]  274 	call puts
      008539 07 CD 84         [ 2]  275 	jp repl 	
      000599                        276 mem_peek:
      00853C ED AE            [ 1]  277 	ld a,#SPACE 
      00853E 85 A9 7B         [ 4]  278 	call skip  	 
      008541 04 CD 84 CB      [ 2]  279 	addw y,in.w 
      008545 AE 85 AD         [ 2]  280 	ldw x,#pad 
      008548 7B 03 CD         [ 4]  281 	call strcpy
      00854B 84 CB AE         [ 2]  282 	ldw x,#pad
      00854E 85 B2 90         [ 4]  283 	call atoi24 	
      008551 96 72 A9         [ 1]  284 	ld a, acc24 
      008554 00 0C CD         [ 1]  285 	or a,acc16 
      008557 84 ED A6         [ 1]  286 	or a,acc8 
      00855A 0A CD            [ 1]  287 	jrne 1$ 
      00855C 89 8B            [ 2]  288 	jra peek_byte  
      00855E 81 0A 52         [ 2]  289 1$:	ldw x,acc24 
      008561 65 67 69         [ 2]  290 	ldw farptr,x 
      008564 73 74 65         [ 1]  291 	ld a,acc8 
      008567 72 73 20         [ 1]  292 	ld farptr+2,a 
      0005C7                        293 peek_byte:
      00856A 73 74 61         [ 4]  294 	call print_farptr 
      00856D 74 65            [ 1]  295 	ld a,#8 
      00856F 20 61            [ 1]  296 	ld (PSIZE,sp),a 
      008571 74               [ 1]  297 	clrw x 
      008572 20 61 62         [ 4]  298 1$:	call fetchc  
      008575 6F               [ 2]  299 	pushw x 
      008576 72 74 20         [ 1]  300 	ld acc8,a 
      008579 70               [ 1]  301 	clrw x 
      00857A 6F 69 6E         [ 2]  302 	ldw acc24,x 
      00857D 74 2E            [ 1]  303 	ld a,#16+128
      00857F 0A 2D 2D         [ 4]  304 	call prt_acc24
      008582 2D               [ 2]  305 	popw x 
      008583 2D 2D            [ 1]  306 	dec (PSIZE,sp)
      008585 2D 2D            [ 1]  307 	jrne 1$ 
      008587 2D 2D            [ 1]  308 	ld a,#8 
      008589 2D 2D 2D         [ 1]  309 	add a,farptr+2 
      00858C 2D 2D 2D         [ 1]  310 	ld farptr+2,a
      00858F 2D               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008590 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      008593 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      008596 2D               [ 1]  314 	clr a 
      008597 2D 2D 2D         [ 1]  315 	adc a,farptr 
      00859A 0A 00 45         [ 1]  316 	ld farptr,a 
      00859D 50 43 3A         [ 2]  317 	jp repl  
                                    318 
      0085A0 00 0A 59 3A 00 0A 58   319 invalid_cmd: .asciz "not a command\n" 
             3A 00 0A 41 3A 00 0A
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      00060C                        324 print_farptr:
      0085AF 43 3A 00         [ 1]  325 	ld a ,farptr+2 
      0085B2 0A 53 50         [ 1]  326 	ld acc8,a 
      0085B5 3A 00 18         [ 2]  327 	ldw x,farptr 
      0085B7 CF 00 0C         [ 2]  328 	ldw acc24,x 
      0085B7 52               [ 1]  329 	clrw x 
      0085B8 01 72            [ 1]  330 	ld a,#16 
      0085BA 5F 00 19         [ 4]  331 	call prt_acc24
      0085BD 72 5F            [ 1]  332 	ld a,#SPACE 
      0085BF 00 1A 72         [ 4]  333 	call putc 
      0085C2 5F 00 1B         [ 4]  334 	call putc 
      0085C5 81               [ 4]  335 	ret
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
      000627                        346 fetchc: ; @C
      0085C5 A6 0D CD 89      [ 5]  347 	ldf a,([farptr],x)
      0085C9 8B               [ 1]  348 	incw x
      0085CA A6               [ 4]  349 	ret
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
      00062D                        360 number:
      0085CB 3F CD 89         [ 4]  361 	call get_token
      0085CE 8B 72            [ 1]  362 	cp a,#TK_INTGR
      0085D0 5F 00            [ 1]  363 	jreq 1$
      0085D2 01 72 5F         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0085D5 00               [ 4]  365 1$:	ret
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
      000638                        380 show_row:
      0085D6 02               [ 1]  381 	tnz a 
      0085D7 CD 8A            [ 1]  382 	jrne 1$
      0085D9 ED               [ 4]  383 	ret 
      00063C                        384 1$:	
      0085DA 90               [ 2]  385 	pushw x  
      0085DB AE               [ 1]  386 	push a 
      0085DC 16 90 90 F6      [ 1]  387 	mov tab_width,#4 
      0085E0 27 E3 72         [ 4]  388 	call prt_i16 
      0085E3 5C 00            [ 1]  389 	ld a,#SPACE  
      0085E5 02 CD 99         [ 4]  390 	call putc
      00064A                        391 row_loop:
      0085E8 28 A1            [ 2]  392 	ldw x,(ADR,sp)
      0085EA 51               [ 1]  393 	ld a,(x)
      0085EB 26               [ 1]  394 	clrw x 
      0085EC 17               [ 1]  395 	ld xl,a 
      0085ED CD 18 12         [ 4]  396 	call prt_i16 
      0085ED 72 5F            [ 2]  397 	ldw x,(ADR,sp)
      0085EF 16               [ 1]  398 	incw x 
      0085F0 90 72            [ 2]  399 	ldw (ADR,sp),x 
      0085F2 5F 00            [ 1]  400 	dec (CNT,sp)
      0085F4 04 72            [ 1]  401 	jrne row_loop
      00065B                        402 	_drop VSIZE  		
      0085F6 5F 00            [ 2]    1     addw sp,#VSIZE 
      0085F8 02 5B 01 81      [ 1]  403 	mov tab_width,#4
      0085FC A6 0D            [ 1]  404 	ld a,#CR 
      0085FC AE 86 7D         [ 4]  405 	call putc 
      0085FF CD               [ 4]  406 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      000667                        419 hex_dump:
      008600 89               [ 1]  420 	push a 
      000668                        421 	_vars VSIZE
      008601 E8 20            [ 2]    1     sub sp,#VSIZE 
      008603 C1 00 0A         [ 1]  422 	ld a,base
      008604 6B 03            [ 1]  423 	ld (BASE,sp),a 
      008604 A1 50 27 11      [ 1]  424 	mov base,#16
      008608 A1 53 26         [ 1]  425 	ld a,tab_width 
      00860B F0 04            [ 1]  426 	ld (TABW,sp),a
      00860C A6 0D            [ 1]  427 	ld a,#CR 
      00860C CD 8F 62         [ 4]  428 	call putc 
      00860F A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      008611 26 E9            [ 1]  430 	ld a,#16
      008613 CD 89 E8 CC      [ 2]  431 	cpw y,#16
      008617 85 C5            [ 1]  432 	jrpl 2$
      008619 90 9F            [ 1]  433 	ld a,yl
      000689                        434 2$: 	
      008619 A6 20 CD         [ 4]  435 	call show_row 
      00861C 8F 4F            [ 2]  436 	ldw y,(BCNT,sp) 
      00861E 72 B9 00 01      [ 2]  437 	subw y,#16 
      008622 AE 16 E0 CD      [ 2]  438 	cpw y,#1
      008626 94 22            [ 1]  439 	jrpl 1$
      008628 AE 16            [ 1]  440 	ld a,(BASE,sp)
      00862A E0 CD 99         [ 1]  441 	ld base,a
      00862D 34 C6            [ 1]  442 	ld a,(TABW,sp)
      00862F 00 0D CA         [ 1]  443 	ld tab_width,a 
      0006A2                        444 	_drop VSIZE
      008632 00 0E            [ 2]    1     addw sp,#VSIZE 
      008634 CA               [ 1]  445 	pop a 
      008635 00               [ 4]  446 	ret 
                                    447 
                                    448 .endif ; DEBUG 
                                    449 
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
                                     20 ;;;  In application Programming of 
                                     21 ;;;  FLASH, EEPROM and OPTION memory 
                                     22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     23 
                                     24     .module IAP 
                                     25 
                                     26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
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
      0006A6                         45 unlock_eeprom:
      008636 0F 26 02 20 0C   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      00863B CE 00 0D CF      [ 1]   47 	mov FLASH_CR2,#0 
      00863F 00 19 C6 00      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008643 0F C7 00 1B      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008647 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008647 CD 86 8C A6 08   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00864C 6B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006C1                         62 unlock_flash:
      00864D 01 5F CD 86 A7   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008652 89 C7 00 0F      [ 1]   64 	mov FLASH_CR2,#0 
      008656 5F CF 00 0D      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      00865A A6 90 CD 98      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00865E A9 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008662 26 EB A6 08 CB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008667 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      0006DC                         76 row_erase:
      008668 1B               [ 1]   77 	push a 
      008669 C7 00            [ 2]   78 	pushw y 
      00866B 1B 4F C9 00      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00866F 1A C7 00 1A      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008673 4F               [ 1]   81 	clr a 
      008674 C9 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      008676 19 C7 00 19      [ 1]   83 	ldf ([farptr],y),a
      00867A CC 85            [ 1]   84     incw y
      00867C C5 6E 6F 74      [ 1]   85 	ldf ([farptr],y),a
      008680 20 61            [ 1]   86     incw y
      008682 20 63 6F 6D      [ 1]   87 	ldf ([farptr],y),a
      008686 6D 61            [ 1]   88     incw y
      008688 6E 64 0A 00      [ 1]   89 	ldf ([farptr],y),a
      00868C 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00868C C6 00            [ 2]   91 	popw y 
      00868E 1B               [ 1]   92 	pop a 
      00868F C7               [ 4]   93 	ret
      000709                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      000709                         97 move_erase_to_ram:
      008690 00               [ 2]   98 	pushw x 
      008691 0F CE            [ 2]   99 	pushw y 
      008693 00 19 CF         [ 2]  100 	ldw x,#row_erase_end 
      008696 00 0D 5F         [ 2]  101 	subw x,#row_erase
      008699 A6 10 CD         [ 2]  102 	ldw acc16,x 
      00869C 98 A9 A6         [ 2]  103 	ldw x,#tib 
      00869F 20 CD 89 8B      [ 2]  104 	ldw y,#row_erase 
      0086A3 CD 89 8B         [ 4]  105 	call move
      0086A6 81 85            [ 2]  106 	popw y
      0086A7 85               [ 2]  107 	popw x
      0086A7 92               [ 4]  108 	ret 
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
      000723                        123 program_row:
      0086A8 AF               [ 1]  124 	push a 
      0086A9 00 19            [ 2]  125 	pushw y 
      0086AB 5C 81            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086AD 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086AD CD 8F 62 A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086B1 84 27            [ 1]  130 	clrw y 
      0086B3 03               [ 1]  131 1$:	ld a,(x)
      0086B4 CC 96 E6 81      [ 1]  132 	ldf ([farptr],y),a
      0086B8 5C               [ 1]  133 	incw x 
      0086B8 4D 26            [ 1]  134 	incw y 
      0086BA 01 81            [ 1]  135 	dec (BCNT,sp)
      0086BC 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0086BC 89 88 35 04 00   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000743                        139 	_drop 1 
      0086C1 24 CD            [ 2]    1     addw sp,#1 
      0086C3 98 92            [ 2]  140 	popw y 
      0086C5 A6               [ 1]  141 	pop a 
      0086C6 20               [ 4]  142 	ret 
      000749                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      000749                        149 move_prg_to_ram:
      0086C7 CD               [ 2]  150 	pushw x 
      0086C8 89 8B            [ 2]  151 	pushw y 
      0086CA AE 07 49         [ 2]  152 	ldw x,#program_row_end 
      0086CA 1E 02 F6         [ 2]  153 	subw x,#program_row 
      0086CD 5F 97 CD         [ 2]  154 	ldw acc16,x ; bytes to move 
      0086D0 98 92 1E         [ 2]  155 	ldw x,#tib ; destination address 
      0086D3 02 5C 1F 02      [ 2]  156 	ldw y,#program_row ; source address 
      0086D7 0A 01 26         [ 4]  157 	call move
      0086DA EF 5B            [ 2]  158 	popw y 
      0086DC 03               [ 2]  159 	popw x  
      0086DD 35               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000763                        169 write_buffer:
      0086DE 04               [ 2]  170 	pushw x 
      0086DF 00 24 A6 0D      [ 1]  171 	tnz farptr 
      0086E3 CD 89            [ 1]  172 	jrne to_flash 
      0086E5 8B 81 19         [ 2]  173 	ldw x,farptr+1 
      0086E7 A3 36 00         [ 2]  174 	cpw x,#app_space  
      0086E7 88 52            [ 1]  175 	jruge to_flash 
      000772                        176 to_eeprom:
      0086E9 04 C6 00         [ 4]  177 	call unlock_eeprom
      0086EC 0B 6B            [ 2]  178 	jra do_programming
      000777                        179 to_flash:
      0086EE 03 35 10         [ 4]  180 	call unlock_flash
      00077A                        181 do_programming:
      0086F1 00               [ 2]  182 	popw x 
      0086F2 0B C6 00         [ 4]  183 	call tib
      0086F5 24 6B 04 A6      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0086F9 0D CD 89 8B      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0086FD 17               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      000787                        197 block_erase:
      0086FE 01               [ 2]  198 	pushw x 
      0086FF A6 10 90         [ 1]  199 	ld a,farptr 
      008702 A3 00            [ 1]  200 	jrne erase_flash
      008704 10 2A 02         [ 2]  201 	ldw x,farptr+1
      008707 90 9F 00         [ 2]  202 	cpw x,#app_space 
      008709 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      008709 CD 86 B8         [ 4]  205 	call unlock_eeprom 
      00870C 16 01 72         [ 4]  206 	call tib 
      00870F A2 00 10 90      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008713 A3 00            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007A1                        210 erase_flash:
      008715 01 2A E5         [ 4]  211 	call unlock_flash 
      008718 7B 03 C7         [ 4]  212 	call tib 
      00871B 00 0B 7B 04      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007AB                        214 erase_exit: 
      00871F C7               [ 2]  215 	popw x 
      008720 00               [ 4]  216 	ret 
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
      0007AD                        232 write_byte:
      008721 24 5B            [ 2]  233 	pushw y
      0007AF                        234 	_vars VSIZE
      008723 04 84            [ 2]    1     sub sp,#VSIZE 
      008725 81 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      008726 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      008726 72 06 50 5F      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00872A 15 35 00 50      [ 1]  240 	tnz farptr 
      00872E 5B 35            [ 1]  241 	jrne write_flash
      008730 FF 50 5C 35      [ 2]  242     cpw y,#app_space 	 
      008734 AE 50            [ 1]  243     jruge write_flash
      008736 64 35 56 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      00873A 64 72            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00873C 07 50 5F FB      [ 2]  246 	cpw y,#OPTION_END 
      008740 81 51            [ 1]  247 	jrugt write_exit
      008741 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      0007D3                        250 write_flash:
      008741 72 02 50         [ 4]  251 	call unlock_flash 
      008744 5F               [ 1]  252 1$:	sim 
      008745 15 35            [ 1]  253 	ld a,(BTW,sp)
      008747 00 50 5B 35      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      00874B FF 50 5C 35 56   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008750 50               [ 1]  256     rim 
      008751 62 35 AE 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008755 62 72            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      0007E9                        260 write_eeprom:
      008757 03 50 5F         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      00875A FB 81 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      00875C 2B 08            [ 1]  264 	jrmi 1$
      00875C 88 90 89 35      [ 2]  265 	cpw y,#OPTION_END+1
      008760 20 50            [ 1]  266 	jrpl 1$
      008762 5B 35            [ 1]  267 	cpl (OPT,sp)
      0007FA                        268 1$: 
      008764 DF 50            [ 1]  269     tnz (OPT,sp)
      008766 5C 4F            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      008768 90 5F 91 A7      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      00876C 00 19 90 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      000806                        274 2$: 
      008770 91 A7            [ 1]  275     ld a,(BTW,sp)
      008772 00 19 90 5C      [ 4]  276     ldf ([farptr],x),a
      008776 91 A7            [ 1]  277     tnz (OPT,sp)
      008778 00 19            [ 1]  278     jreq 3$
      00877A 90               [ 1]  279     incw x
      00877B 5C 91            [ 1]  280     ld a,(BTW,sp)
      00877D A7               [ 1]  281     cpl a
      00877E 00 19 72 05      [ 4]  282     ldf ([farptr],x),a
      008782 50 5F FB 90 85   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008787 84 81 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      008789                        285 write_exit:
      008789                        286 	_drop VSIZE 
      008789 89 90            [ 2]    1     addw sp,#VSIZE 
      00878B 89 AE            [ 2]  287 	popw y
      00878D 87               [ 4]  288     ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                    300 ;	X 		after last byte written 
                                    301 ;   Y 		after last byte read 
                                    302 ;  farptr   point after block
                                    303 ;---------------------------------------------
      000827                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000827                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      000827                        309 write_block::
      00878E 89               [ 1]  310 	push a 
      000828                        311 	_vars VSIZE
      00878F 1D 87            [ 2]    1     sub sp,#VSIZE 
      008791 5C CF            [ 2]  312 	ldw (XSAVE,sp),x 
      008793 00 0E            [ 2]  313 	ldw x,(BSIZE,sp) 
      008795 AE 16            [ 1]  314 	jreq 9$
      008797 90 90            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      008799 AE 87            [ 1]  316 	ld a,(y)
      00879B 5C CD 94         [ 4]  317 	call write_byte 
      00879E 32               [ 1]  318 	incw x 
      00879F 90 85            [ 1]  319 	incw y 
      0087A1 85 81            [ 2]  320 	ldw (XSAVE,sp),x
      0087A3 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      0087A3 88               [ 2]  322 	decw x
      0087A4 90 89            [ 2]  323 	ldw (BSIZE,sp),x 
      0087A6 4B 80            [ 1]  324 	jrne 1$
      000843                        325 9$:
      0087A8 72 10            [ 2]  326 	ldw x,(XSAVE,sp)
      0087AA 50 5B 72         [ 4]  327 	call incr_farptr
      000848                        328 	_drop VSIZE
      0087AD 11 50            [ 2]    1     addw sp,#VSIZE 
      0087AF 5C               [ 1]  329 	pop a 
      0087B0 90               [ 4]  330 	ret 
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
      00084C                        347 write_nbytes:
      0087B1 5F F6            [ 2]  348 	pushw y
      0087B3 91               [ 1]  349 	push a 
      0087B4 A7 00            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0087B6 19               [ 1]  351 	clrw x 
      000852                        352 1$:  
      0087B7 5C 90            [ 1]  353 	ld a,(y)
      0087B9 5C 0A            [ 1]  354 	incw y
      0087BB 01 26 F4         [ 4]  355 	call write_byte 
      0087BE 72               [ 1]  356 	incw x 
      0087BF 05 50            [ 1]  357 	dec (1,sp)  
      0087C1 5F FB            [ 1]  358 	jrne 1$ 
      0087C3 5B               [ 1]  359 9$: pop a 
      0087C4 01 90            [ 2]  360 	popw y 
      0087C6 85               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      000862                        370 row_align:
      0087C7 84 81            [ 1]  371 	ld a,#0x7f 
      0087C9 C4 00 1A         [ 1]  372 	and a,farptr+2 
      0087C9 27 13            [ 1]  373 	jreq 1$ 
      0087C9 89 90 89         [ 2]  374 	ldw x,farptr+1 
      0087CC AE 87 C9         [ 2]  375 	addw x,#BLOCK_SIZE 
      0087CF 1D 87            [ 1]  376 	jrnc 0$
      0087D1 A3 CF 00 0E      [ 1]  377 	inc farptr 
      0087D5 AE               [ 1]  378 0$: ld a,xl 
      0087D6 16 90            [ 1]  379 	and a,#0x80
      0087D8 90               [ 1]  380 	ld xl,a
      0087D9 AE 87 A3         [ 2]  381 	ldw farptr+1,x  	
      0087DC CD               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      00087D                        390 incr_farptr:
      0087DD 94 32 90 85      [ 2]  391 	addw x,farptr+1 
      0087E1 85 81            [ 1]  392 	jrnc 1$
      0087E3 72 5C 00 18      [ 1]  393 	inc farptr 
      0087E3 89 72 5D         [ 2]  394 1$:	ldw farptr+1,x  
      0087E6 00               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      00088B                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0087E7 19               [ 1]  406 	clrw x 
      0087E8 26 0D CE 00      [ 5]  407 1$: ldf a,([farptr],x) 
      0087EC 1A A3            [ 1]  408 	jrne 2$
      0087EE B6               [ 1]  409 	incw x 
      0087EF 80 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
      0087F2 25 F4            [ 1]  411 	jrult 1$ 
      0087F2 CD               [ 4]  412 2$:	ret 
                                    413 
                                    414 
                                    415 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
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
      000899                         66 Uart1RxHandler: ; console receive char 
      0087F3 87 26 20 03 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0087F7 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0087F7 CD 87            [ 1]   69 	cp a,#CTRL_C 
      0087F9 41 06            [ 1]   70 	jrne 2$
      0087FA CD 09 0B         [ 4]   71 	call putc 
      0087FA 85 CD 16         [ 2]   72 	jp user_interrupted
      0008AB                         73 2$:
      0087FD 90 72            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0087FF 13 50            [ 1]   75 	jrne 3$
      008801 5F 72 17         [ 2]   76 	jp cold_start 	
      008804 50               [ 1]   77 3$:	push a 
      008805 5F 81            [ 1]   78 	ld a,#rx1_queue 
      008807 CB 00 2F         [ 1]   79 	add a,rx1_tail 
      008807 89               [ 1]   80 	clrw x 
      008808 C6               [ 1]   81 	ld xl,a 
      008809 00               [ 1]   82 	pop a 
      00880A 19               [ 1]   83 	ld (x),a 
      00880B 26 14 CE         [ 1]   84 	ld a,rx1_tail 
      00880E 00               [ 1]   85 	inc a 
      00880F 1A A3            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008811 B6 80 24         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      008814 0C               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0008C6                         97 uart1_init:
      008815 CD 87 26 CD      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008819 16 90 72 17      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      00881D 50 5F 20 0A      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008821 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0008D6                        103 uart1_set_baud: 
      008821 CD               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008822 87 41            [ 1]  107 	ld a,#CLK_SWR_HSI
      008824 CD 16 90         [ 1]  108 	cp a,CLK_CMSR 
      008827 72 13            [ 1]  109 	jreq 2$ 
      0008DE                        110 1$: ; 8 Mhz 	
      008829 50 5F 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      00882B 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      00882B 85 81            [ 2]  113 	jra 3$
      00882D                        114 2$: ; 16 Mhz 	
      00882D 90 89 52 02      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008831 6B 01 0F 02      [ 1]  116 	mov UART1_BRR1,#0x08
      0008F0                        117 3$:
      008835 90 CE 00 1A      [ 1]  118     clr UART1_DR
      008839 72 5D 00 19      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00883D 26 14 90 A3      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008841 B6 80 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008846 A3 40 00 25      [ 1]  122     clr rx1_head 
      00884A 57 90 A3 48      [ 1]  123 	clr rx1_tail
      00884E 7F               [ 1]  124 	pop a  
      00884F 22               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      00090B                        133 putc:: ; console output always on UART1
      00090B                        134 uart1_putc:: 
      008850 51 20 16 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008853 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008853 CD               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      000914                        148 qgetc::
      000914                        149 uart1_qgetc::
      008854 87 41 9B         [ 1]  150 	ld a,rx1_head 
      008857 7B 01 92         [ 1]  151 	sub a,rx1_tail 
      00885A A7               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      00091B                        161 getc:: ;console input
      00091B                        162 uart1_getc::
      00885B 00 19 72         [ 4]  163 	call uart1_qgetc
      00885E 05 50            [ 1]  164 	jreq uart1_getc 
      008860 5F               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008861 FB 9A            [ 1]  167 	ld a,#rx1_queue
      008863 72 13 50         [ 1]  168 	add a,rx1_head 
      008866 5F               [ 1]  169 	clrw x  
      008867 20               [ 1]  170 	ld xl,a 
      008868 39               [ 1]  171 	ld a,(x)
      008869 88               [ 1]  172 	push a
      008869 CD 87 26         [ 1]  173 	ld a,rx1_head 
      00886C 90               [ 1]  174 	inc a 
      00886D A3 48            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      00886F 00 2B 08         [ 1]  176 	ld rx1_head,a 
      008872 90               [ 1]  177 	pop a  
      008873 A3               [ 2]  178 	popw x
      008874 48               [ 4]  179 	ret 
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
      008875 80 2A 02 03 02 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
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
      00887A                        207 get_escape:
      00887A 0D 02 27         [ 4]  208     call getc 
      00887D 08 72            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      00887F 1E 50            [ 1]  210     jreq 1$
      008881 5B               [ 1]  211     clr a
      008882 72               [ 4]  212     ret
      008883 1F 50 5C         [ 4]  213 1$: call getc 
      008886 AE 09 36         [ 2]  214     ldw x,#convert_table
      000951                        215 2$:
      008886 7B               [ 1]  216     cp a,(x)
      008887 01 92            [ 1]  217     jreq 4$
      008889 A7 00 19         [ 2]  218     addw x,#2
      00888C 0D               [ 1]  219     tnz (x)
      00888D 02 27            [ 1]  220     jrne 2$
      00888F 08               [ 1]  221     clr a
      008890 5C               [ 4]  222     ret 
      008891 7B               [ 1]  223 4$: incw x 
      008892 01               [ 1]  224     ld a,(x)
      008893 43 92            [ 1]  225     cp a,#SUP
      008895 A7 00            [ 1]  226     jrne 5$
      008897 19               [ 1]  227     push a 
      008898 72 05 50         [ 4]  228     call getc
      00889B 5F               [ 1]  229     pop a 
      000967                        230 5$:
      00889C FB               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      000968                        241 puts::
      00889D 72               [ 1]  242     ld a,(x)
      00889E 0D 50            [ 1]  243 	jreq 1$
      0088A0 5F FB 0B         [ 4]  244 	call putc 
      0088A2 5C               [ 1]  245 	incw x 
      0088A2 5B 02            [ 2]  246 	jra puts 
      0088A4 90               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      000972                        258 bksp:
      0088A5 85 81            [ 1]  259 	ld a,#BS 
      0088A7 CD 09 0B         [ 4]  260 	call putc 
      0088A7 88 52            [ 1]  261 	ld a,#SPACE 
      0088A9 02 1F 01         [ 4]  262 	call putc 
      0088AC 1E 06            [ 1]  263 	ld a,#BS 
      0088AE 27 13 1E         [ 4]  264 	call putc 
      0088B1 01               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      000982                        274 delete_nchar:
      0088B2 90               [ 1]  275 	push a 
      0088B3 F6 CD            [ 1]  276 0$:	tnz (1,sp)
      0088B5 88 2D            [ 1]  277 	jreq 1$
      0088B7 5C 90 5C         [ 4]  278 	call bksp 
      0088BA 1F 01            [ 1]  279 	dec (1,sp)
      0088BC 1E 06            [ 2]  280 	jra 0$
      0088BE 5A               [ 1]  281 1$:	pop a 
      0088BF 1F               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      000990                        290 send_escape:
      0088C0 06 26            [ 1]  291 	ld a,#ESC 
      0088C2 ED 09 0B         [ 4]  292 	call putc 
      0088C3 A6 5B            [ 1]  293 	ld a,#'[
      0088C3 1E 01 CD         [ 4]  294 	call putc 
      0088C6 88               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      00099B                        311 send_parameter:
      0088C7 FD               [ 2]  312 	pushw x 
      0088C8 5B               [ 1]  313 	clrw x 
      0088C9 02               [ 1]  314 	ld xl,a 
      0088CA 84 81            [ 1]  315 	ld a,#10 
      0088CC 62               [ 2]  316 	div x,a 
      0088CC 90               [ 1]  317 	ld xh,a 
      0088CD 89               [ 1]  318 	ld a,xl
      0088CE 88               [ 1]  319     tnz a 
      0088CF 90 93            [ 1]  320     jreq 2$
      0088D1 5F 09            [ 1]  321 	cp a,#9 
      0088D2 23 02            [ 2]  322 	jrule 1$
      0088D2 90 F6            [ 1]  323 	ld a,#9
      0009AC                        324 1$:
      0088D4 90 5C            [ 1]  325 	add a,#'0 
      0088D6 CD 88 2D         [ 4]  326 	call putc
      0088D9 5C               [ 1]  327 2$:	ld a,xh 
      0088DA 0A 01            [ 1]  328 	add a,#'0
      0088DC 26 F4 84         [ 4]  329 	call putc 
      0088DF 90               [ 2]  330 	popw x 
      0088E0 85               [ 4]  331 	ret 
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
      0009B9                        344 move_left:
      0088E1 81               [ 1]  345 	push a 
      0088E2 CD 09 90         [ 4]  346 	call send_escape
      0088E2 A6               [ 1]  347     pop a
      0088E3 7F C4 00         [ 4]  348 	call send_parameter 
      0088E6 1B 27            [ 1]  349 	ld a,#'D 
      0088E8 13 CE 00         [ 4]  350 	call putc 
      0088EB 1A               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0009C7                        362 move_right:
      0088EC 1C               [ 1]  363 	push a 
      0088ED 00 80 24         [ 4]  364 	call send_escape
      0088F0 04               [ 1]  365     pop a
      0088F1 72 5C 00         [ 4]  366 	call send_parameter 
      0088F4 19 9F            [ 1]  367 	ld a,#'C 
      0088F6 A4 80 97         [ 4]  368 	call putc 
      0088F9 CF               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      0009D5                        379 spaces::
      0088FA 00 1A            [ 1]  380 	ld a,#SPACE 
      0088FC 81               [ 2]  381 1$:	tnzw x
      0088FD 27 06            [ 1]  382 	jreq 9$
      0088FD 72 BB 00         [ 4]  383 	call putc 
      008900 1A               [ 2]  384 	decw x
      008901 24 04            [ 2]  385 	jra 1$
      0009E0                        386 9$: 
      008903 72               [ 4]  387 	ret 
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
      0009E1                        405 insert_char: 
      0009E1                        406 	_vars VSIZE 
      008904 5C 00            [ 2]    1     sub sp,#VSIZE 
      008906 19 CF            [ 1]  407     ld (KCHAR,sp),a 
      008908 00               [ 1]  408     ld a,xh 
      008909 1A 81            [ 1]  409 	ld (IPOS,sp),a
      00890B 9F               [ 1]  410     ld a,xl 
      00890B 5F 92            [ 1]  411     ld (LLEN,sp),a  
      00890D AF               [ 1]  412     ldw x,y
      00890E 00               [ 1]  413     incw x 
      00890F 19 26            [ 1]  414     ld a,(LLEN,sp)
      008911 06 5C            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008913 A3               [ 1]  416     inc a 
      008914 00 80 25         [ 1]  417     ld acc8,a 
      008917 F4 81 00 0D      [ 1]  418     clr acc16
      008919 CD 13 B2         [ 4]  419     call move
      008919 72 0B 52 30      [ 2]  420     ldw y,#tib 
      00891D 27 C6            [ 1]  421     ld a,(IPOS,sp)
      00891F 52 31 A1         [ 1]  422     ld acc8,a 
      008922 03 26 06 CD      [ 2]  423     addw y,acc16 
      008926 89 8B            [ 1]  424     ld a,(KCHAR,sp)
      008928 CC 80            [ 1]  425     ld (y),a
      00892A D7 5C            [ 1]  426     incw y  
      00892B 7B 01            [ 1]  427     ld a,(IPOS,sp)
      00892B A1 18 26         [ 4]  428     call move_left
      00892E 03 CC 81         [ 2]  429     ldw x,#tib 
      008931 43 88 A6         [ 4]  430     call puts 
      008934 27 CB            [ 1]  431     ld a,(LLEN,sp)
      008936 00 30            [ 1]  432     sub a,(IPOS,sp) 
      008938 5F 97 84         [ 4]  433     call move_left 
      000A21                        434 	_drop VSIZE 
      00893B F7 C6            [ 2]    1     addw sp,#VSIZE 
      00893D 00               [ 4]  435 	ret 
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
      000A24                        448 delete_under:
      000A24                        449 	_vars VSIZE 
      00893E 30 4C            [ 2]    1     sub sp,#VSIZE 
      008940 A4 07            [ 1]  450     ld (LLEN,sp),a 
      008942 C7               [ 1]  451     ld a,xl 
      008943 00 30            [ 1]  452     ld (CPOS,sp),a 
      008945 80               [ 1]  453     ldw x,y ; move destination
      008946 90 5C            [ 1]  454     incw y  ; move source 
      008946 72 1A            [ 1]  455     ld a,(LLEN,sp)
      008948 50 02            [ 1]  456     sub a,(CPOS,sp)
      00894A 72               [ 1]  457     inc a ; move including zero at end.
      00894B 1A 50 03         [ 1]  458     ld acc8,a 
      00894E 72 1A 50 04      [ 1]  459     clr acc16 
      008952 72 14 50         [ 4]  460 	call move 
      008955 C7 AE 16 90      [ 2]  461     ldw y,#tib 
      008956 7B 01            [ 1]  462     ld a,(CPOS,sp)
      008956 88 A6 E1         [ 1]  463     ld acc8,a 
      008959 C1 50 C3 27      [ 2]  464     addw y,acc16 
      00895D 0A               [ 1]  465     ldw x,y 
      00895E CD 09 68         [ 4]  466     call puts 
      00895E 35 05            [ 1]  467     ld a,#SPACE  
      008960 52 33 35         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008963 04 52            [ 1]  469     ld a,(LLEN,sp)
      008965 32 20            [ 1]  470     sub a,(CPOS,sp)
      008967 08 09 B9         [ 4]  471     call move_left 
      008968 0A 02            [ 1]  472     dec (LLEN,sp)
      000A5C                        473 	_drop VSIZE 
      008968 35 0B            [ 2]    1     addw sp,#VSIZE 
      00896A 52               [ 4]  474 	ret 
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
      000A5F                        486 delete_line:
      00896B 33 35 08         [ 4]  487     call send_escape
      00896E 52 32            [ 1]  488 	ld a,#'2
      008970 CD 09 0B         [ 4]  489 	call putc 
      008970 72 5F            [ 1]  490 	ld a,#'K 
      008972 52 31 35         [ 4]  491 	call putc 
      008975 2C               [ 4]  492 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                           000004   523 	VSIZE=4 
      000A6D                        524 readln::
      008976 52 35            [ 2]  525 	pushw y 
      000A6F                        526 	_vars VSIZE 
      008978 72 10            [ 2]    1     sub sp,#VSIZE 
      00897A 52               [ 1]  527 	clrw x 
      00897B 35 72            [ 2]  528 	ldw (LL,sp),x 
      00897D 0D 52            [ 2]  529 	ldw (CPOS,sp),x 
      00897F 30 FB            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008981 72 5F 00 2F      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000A7C                        532 readln_loop:
      008985 72 5F 00         [ 4]  533 	call getc
      008988 30 84            [ 1]  534 	ld (RXCHAR,sp),a
      00898A 81 1B            [ 1]  535     cp a,#ESC 
      00898B 26 05            [ 1]  536     jrne 0$
      00898B CD 09 42         [ 4]  537     call get_escape 
      00898B 72 0F            [ 1]  538     ld (RXCHAR,sp),a 
      00898D 52 30            [ 1]  539 0$:	cp a,#CR
      00898F FB C7            [ 1]  540 	jrne 1$
      008991 52 31 81         [ 2]  541 	jp readln_quit
      008994 A1 0A            [ 1]  542 1$:	cp a,#LF 
      008994 26 03            [ 1]  543 	jrne 2$ 
      008994 C6 00 2F         [ 2]  544 	jp readln_quit
      000A98                        545 2$:
      008997 C0 00            [ 1]  546 	cp a,#BS
      008999 30 81            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      00899B 0D 03            [ 1]  549     tnz (CPOS,sp)
      00899B 27 DC            [ 1]  550     jreq readln_loop 
      00899B CD 89            [ 1]  551     ld a,#1 
      00899D 94 27 FB         [ 4]  552     call move_left
      0089A0 89 A6            [ 1]  553     dec (CPOS,sp)
      0089A2 27 CB            [ 2]  554     decw y 
      0089A4 00 2F            [ 1]  555     ld a,(CPOS,sp) 
      0089A6 5F 97 F6         [ 2]  556     jp 12$
      000AAE                        557 3$:
      0089A9 88 C6            [ 1]  558 	cp a,#CTRL_D
      0089AB 00 2F            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      0089AD 4C A4 07         [ 4]  561 	call delete_line 
      0089B0 C7 00            [ 1]  562     ld a,(CPOS,sp)
      0089B2 2F               [ 1]  563     inc a 
      0089B3 84 85 81         [ 4]  564     call move_left 
      0089B6 43 81            [ 1]  565 	ld a,#'> 
      0089B8 44 80 48         [ 4]  566 	call putc 
      0089BB 82 46 83 33      [ 2]  567 	ldw y,#tib
      0089BF 84 00            [ 1]  568 	clr (y)
      0089C1 00 02            [ 1]  569 	clr (LL,sp)
      0089C2 0F 03            [ 1]  570 	clr (CPOS,sp)
      0089C2 CD 89            [ 2]  571 	jra readln_loop
      000ACC                        572 4$:
      0089C4 9B A1            [ 1]  573 	cp a,#CTRL_R 
      0089C6 5B 27            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      0089C8 02 4F            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0089CA 81 CD            [ 1]  577 	jrne readln_loop
      0089CC 89 9B AE 89      [ 2]  578 	ldw y,#tib 
      0089D0 B6               [ 1]  579 	ldw x,y
      0089D1 CD 13 86         [ 4]  580 	call strlen
      0089D1 F1               [ 1]  581 	tnz a  
      0089D2 27 08            [ 1]  582 	jreq readln_loop
      0089D4 1C 00            [ 1]  583 	ld (LL,sp),a 
      0089D6 02 7D            [ 1]  584     ld (CPOS,sp),a
      0089D8 26               [ 1]  585 	ldw x,y  
      0089D9 F7 4F 81         [ 4]  586 	call puts
      0089DC 5C F6            [ 1]  587 	clr (LL_HB,sp)
      0089DE A1 84 26         [ 2]  588 	addw y,(LL_HB,sp)
      0089E1 05 88            [ 2]  589 	jra readln_loop 
      000AEE                        590 5$:
      0089E3 CD 89            [ 1]  591 	cp a,#CTRL_E 
      0089E5 9B 84            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      0089E7 AE 16 90         [ 2]  594 	ldw x,#tib 
      0089E7 81 18 B4         [ 4]  595 	call atoi24
      0089E8 CE 00 0D         [ 2]  596 	ldw x,acc16
      0089E8 F6 27 06         [ 4]  597 	call search_lineno
      0089EB CD               [ 2]  598 	tnzw x 
      0089EC 89 8B            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      0089EE 5C 20 F7         [ 2]  603 	jp readln_quit  
      000B04                        604 51$:
      0089F1 81 00 04         [ 2]  605 	ldw basicptr,x
      0089F2 E6 02            [ 1]  606 	ld a,(2,x)
      0089F2 A6 08 CD         [ 1]  607 	ld count,a 
      0089F5 89 8B A6 20      [ 2]  608 	ldw y,#tib 
      0089F9 CD 89 8B         [ 4]  609 	call decompile 
      0089FC A6 08            [ 1]  610 	clr (LL_HB,sp)
      0089FE CD 89            [ 1]  611 	ld a,#CR 
      008A00 8B 81 0B         [ 4]  612 	call putc 
      008A02 A6 3E            [ 1]  613 	ld a,#'>
      008A02 88 0D 01         [ 4]  614 	call putc
      008A05 27 07 CD         [ 2]  615     ldw x,#tib  
      008A08 89 F2 0A         [ 4]  616 	call strlen 
      008A0B 01 20            [ 1]  617 	ld (LL,sp),a 
      008A0D F5 84 81         [ 4]  618 	call puts 
      008A10 90 93            [ 1]  619 	ldw y,x
      008A10 A6 1B            [ 1]  620     ld a,(LL,sp)
      008A12 CD 89            [ 1]  621     ld (CPOS,sp),a  
      008A14 8B A6 5B         [ 2]  622 	jp readln_loop
      000B33                        623 6$:
      008A17 CD 89            [ 1]  624 	cp a,#ARROW_RIGHT
      008A19 8B 81            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A1B 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008A1B 89 5F            [ 1]  628     cp a,(LL,sp)
      008A1D 97 A6            [ 1]  629     jrmi 61$
      008A1F 0A 62 95         [ 2]  630     jp readln_loop 
      000B40                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008A22 9F 4D            [ 1]  632     ld a,#1 
      008A24 27 0B A1         [ 4]  633 	call move_right 
      008A27 09 23            [ 1]  634 	inc (CPOS,sp)
      008A29 02 A6            [ 1]  635     incw y 
      008A2B 09 0A 7C         [ 2]  636     jp readln_loop 
      008A2C A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A2C AB 30            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A2E CD 89            [ 1]  640 	tnz (CPOS,sp)
      008A30 8B 9E            [ 1]  641 	jrne 71$
      008A32 AB 30 CD         [ 2]  642 	jp readln_loop
      000B57                        643 71$:
      008A35 89 8B            [ 1]  644     ld a,#1 
      008A37 85 81 B9         [ 4]  645 	call move_left 
      008A39 0A 03            [ 1]  646 	dec (CPOS,sp)
      008A39 88 CD            [ 2]  647     decw y 
      008A3B 8A 10 84         [ 2]  648 	jp readln_loop 
      008A3E CD 8A            [ 1]  649 8$: cp a,#HOME  
      008A40 1B A6            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A42 44 CD            [ 1]  652     ld a,(CPOS,sp)
      008A44 89 8B 81         [ 4]  653     call move_left 
      008A47 0F 03            [ 1]  654 	clr (CPOS,sp)
      008A47 88 CD 8A 10      [ 2]  655     ldw y,#tib 
      008A4B 84 CD 8A         [ 2]  656 	jp readln_loop  
      008A4E 1B A6            [ 1]  657 9$: cp a,#KEY_END  
      008A50 43 CD            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A52 89 8B            [ 1]  660 	ld a,(CPOS,sp)
      008A54 81 02            [ 1]  661 	cp a,(LL,sp)
      008A55 26 03            [ 1]  662 	jrne 91$
      008A55 A6 20 5D         [ 2]  663 	jp readln_loop 
      000B82                        664 91$:
      008A58 27 06            [ 1]  665 	ld a,(LL,sp)
      008A5A CD 89            [ 1]  666 	sub a,(CPOS,sp)
      008A5C 8B 5A 20         [ 4]  667 	call move_right 
      008A5F F7 02            [ 1]  668 	ld a,(LL,sp)
      008A60 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008A60 81 AE 16 90      [ 2]  670     ldw y,#tib
      008A61 72 5F 00 0D      [ 1]  671     clr acc16 
      008A61 52 03 6B         [ 1]  672     ld acc8,a 
      008A64 02 9E 6B 01      [ 2]  673     addw y,acc16  
      008A68 9F 6B 03         [ 2]  674 	jp readln_loop 
      008A6B 93 5C            [ 1]  675 10$: cp a,#CTRL_O
      008A6D 7B 03            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008A6F 10 01            [ 1]  678 	cpl (OVRWR,sp)
      008A71 4C C7 00         [ 4]  679 	call beep_1khz
      008A74 0F 72 5F         [ 2]  680 	jp readln_loop 
      008A77 00 0E            [ 1]  681 11$: cp a,#SUP 
      008A79 CD 94            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008A7B 32 90            [ 1]  684     ld a,(CPOS,sp)
      008A7D AE 16            [ 1]  685     cp a,(LL,sp)
      008A7F 90 7B            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      000BB5                        687 12$:
      008A81 01               [ 1]  688     ld xl,a    ; cursor position 
      008A82 C7 00            [ 1]  689     ld a,(LL,sp)  ; line length
      008A84 0F 72 B9         [ 4]  690     call delete_under
      008A87 00 0E            [ 1]  691     dec (LLEN,sp)
      000BBD                        692 13$:
      008A89 7B 02 90         [ 2]  693     jp readln_loop 
      000BC0                        694 final_test:
      008A8C F7 90            [ 1]  695 	cp a,#SPACE
      008A8E 5C 7B            [ 1]  696 	jrpl accept_char
      008A90 01 CD 8A         [ 2]  697 	jp readln_loop
      000BC7                        698 accept_char:
      008A93 39 AE            [ 1]  699 	ld a,#TIB_SIZE-1
      008A95 16 90            [ 1]  700 	cp a, (LL,sp)
      008A97 CD 89            [ 1]  701 	jrpl 1$
      008A99 E8 7B 03         [ 2]  702 	jp readln_loop
      008A9C 10 01            [ 1]  703 1$:	tnz (OVRWR,sp)
      008A9E CD 8A            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008AA0 39 5B            [ 1]  706     ld a,(CPOS,sp)
      008AA2 03 81            [ 1]  707     cp a,(LL,sp)
      008AA4 27 12            [ 1]  708     jreq overwrite
      008AA4 52 02            [ 1]  709     ld a,(LL,sp)
      008AA6 6B               [ 1]  710     ld xl,a 
      008AA7 02 9F            [ 1]  711     ld a,(CPOS,sp)
      008AA9 6B               [ 1]  712     ld xh,a
      008AAA 01 93            [ 1]  713     ld a,(RXCHAR,sp)
      008AAC 90 5C 7B         [ 4]  714     call insert_char
      008AAF 02 10            [ 1]  715     inc (LLEN,sp)
      008AB1 01 4C            [ 1]  716     inc (CPOS,sp)	
      008AB3 C7 00 0F         [ 2]  717     jp readln_loop 
      000BEC                        718 overwrite:
      008AB6 72 5F            [ 1]  719 	ld a,(RXCHAR,sp)
      008AB8 00 0E            [ 1]  720 	ld (y),a
      008ABA CD 94            [ 1]  721     incw y
      008ABC 32 90 AE         [ 4]  722     call putc 
      008ABF 16 90            [ 1]  723 	ld a,(CPOS,sp)
      008AC1 7B 01            [ 1]  724 	cp a,(LL,sp)
      008AC3 C7 00            [ 1]  725 	jrmi 1$
      008AC5 0F 72            [ 1]  726 	clr (y)
      008AC7 B9 00            [ 1]  727 	inc (LL,sp)
      008AC9 0E 93            [ 1]  728     inc (CPOS,sp)
      008ACB CD 89 E8         [ 2]  729 	jp readln_loop 
      000C04                        730 1$:	
      008ACE A6 20            [ 1]  731 	inc (CPOS,sp)
      008AD0 CD 89 8B         [ 2]  732 	jp readln_loop 
      000C09                        733 readln_quit:
      008AD3 7B 02 10 01      [ 2]  734 	ldw y,#tib
      008AD7 CD 8A            [ 1]  735     clr (LL_HB,sp) 
      008AD9 39 0A 02         [ 2]  736     addw y,(LL_HB,sp)
      008ADC 5B 02            [ 1]  737     clr (y)
      008ADE 81 02            [ 1]  738 	ld a,(LL,sp)
      008ADF C7 00 03         [ 1]  739 	ld count,a 
      008ADF CD 8A            [ 1]  740 	ld a,#CR
      008AE1 10 A6 32         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      000C1E                        742 	_drop VSIZE 
      008AE4 CD 89            [ 2]    1     addw sp,#VSIZE 
      008AE6 8B A6            [ 2]  743 	popw y 
      008AE8 4B               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000C23                        752 print_hex::
      008AE9 CD               [ 1]  753 	push a 
      008AEA 89               [ 1]  754 	swap a 
      008AEB 8B 81 3A         [ 4]  755 	call to_hex_char 
      008AED CD 09 0B         [ 4]  756 	call putc 
      008AED 90 89            [ 1]  757     ld a,(1,sp) 
      008AEF 52 04 5F         [ 4]  758 	call to_hex_char
      008AF2 1F 02 1F         [ 4]  759 	call putc
      008AF5 03 03            [ 1]  760 	ld a,#SPACE 
      008AF7 04 90 AE         [ 4]  761 	call putc 
      008AFA 16               [ 1]  762 	pop a 
      008AFB 90               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008AFC                        772 to_hex_char::
      008AFC CD 89            [ 1]  773 	and a,#15 
      008AFE 9B 6B            [ 1]  774 	cp a,#9 
      008B00 01 A1            [ 2]  775 	jrule 1$ 
      008B02 1B 26            [ 1]  776 	add a,#7
      008B04 05 CD            [ 1]  777 1$: add a,#'0 
      008B06 89               [ 4]  778 	ret 
                                    779 
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
                                     19 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     20 ;;   compile BASIC source code to byte code
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 
                                     23 
                                     24     .module COMPILER 
                                     25 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
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
      008B07 C2 6B            [ 2]    1     sub sp,#VSIZE 
      008B09 01 A1            [ 1]   53 	clr (LL,sp)
      008B0B 0D 26 03 CC      [ 2]   54 	ldw y,txtbgn
      008B0F 8C               [ 1]   55 	tnz a 
      008B10 89 A1            [ 1]   56 	jreq search_ln_loop
      008B12 0A 26 03 CC      [ 2]   57 	ldw y,basicptr 
      000C54                         58 search_ln_loop:
      008B16 8C 89 00 1D      [ 2]   59 	cpw y,txtend 
      008B18 2A 10            [ 1]   60 	jrpl 8$
      008B18 A1 08            [ 1]   61 	cpw x,(y)
      008B1A 26 12            [ 1]   62 	jreq 9$
      008B1C 0D 03            [ 1]   63 	jrmi 8$ 
      008B1E 27 DC A6         [ 1]   64 	ld a,(2,y)
      008B21 01 CD            [ 1]   65 	ld (LB,sp),a 
      008B23 8A 39 0A         [ 2]   66 	addw y,(LL,sp)
      008B26 03 90            [ 2]   67 	jra search_ln_loop 
      000C6A                         68 8$: 
      008B28 5A               [ 1]   69 	clrw x 	
      008B29 7B               [ 1]   70 	exgw x,y 
      000C6C                         71 9$: _drop VSIZE
      008B2A 03 CC            [ 2]    1     addw sp,#VSIZE 
      008B2C 8C               [ 1]   72 	exgw x,y   
      008B2D 35               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008B2E                         83 del_line: 
      000C70                         84 	_vars VSIZE 
      008B2E A1 04            [ 2]    1     sub sp,#VSIZE 
      008B30 26 1A            [ 1]   85 	ld a,(2,x) ; line length
      008B32 CD 8A            [ 1]   86 	ld (LLEN+1,sp),a 
      008B34 DF 7B            [ 1]   87 	clr (LLEN,sp)
      008B36 03 4C            [ 1]   88 	ldw y,x  
      008B38 CD 8A 39         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B3B A6 3E            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B3D CD 89 8B 90      [ 2]   91 	ldw y,txtend 
      008B41 AE 16 90         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B44 90 7F 0F 02      [ 2]   93 	ldw acc16,y 
      008B48 0F 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B4A 20 B0 B2         [ 4]   95 	call move
      008B4C 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008B4C A1 12 26         [ 2]   97 	subw y,(LLEN,sp)
      008B4F 1E 0D 02 26      [ 2]   98 	ldw txtend,y  
      000C9A                         99 	_drop VSIZE     
      008B53 A8 90            [ 2]    1     addw sp,#VSIZE 
      008B55 AE               [ 4]  100 	ret 
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
      000C9D                        115 create_gap:
      000C9D                        116 	_vars VSIZE
      008B56 16 90            [ 2]    1     sub sp,#VSIZE 
      008B58 93 CD            [ 2]  117 	ldw (SRC,sp),x 
      008B5A 94 06            [ 2]  118 	ldw (LEN,sp),y 
      008B5C 4D 27 9D 6B      [ 2]  119 	ldw acc16,y 
      008B60 02 6B            [ 1]  120 	ldw y,x ; SRC
      008B62 03 93 CD 89      [ 2]  121 	addw x,acc16  
      008B66 E8 0F            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B68 01 72 F9         [ 2]  124 	ldw x,txtend 
      008B6B 01 20 8E         [ 2]  125 	subw x,(SRC,sp)
      008B6E CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      008B6E A1 05            [ 2]  127 	ldw x,(DEST,sp) 
      008B70 26 41 AE         [ 4]  128 	call move
      008B73 16 90 CD         [ 2]  129 	ldw x,txtend
      008B76 99 34 CE         [ 2]  130 	addw x,(LEN,sp)
      008B79 00 0E CD         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      000CC6                        132 9$:	_drop VSIZE 
      008B7C 8C C5            [ 2]    1     addw sp,#VSIZE 
      008B7E 5D               [ 4]  133 	ret 
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
      000CC9                        150 insert_line:
      000CC9                        151 	_vars VSIZE 
      008B7F 26 03            [ 2]    1     sub sp,#VSIZE 
      008B81 CC 8C 89         [ 2]  152 	ldw x,txtend  
      008B84 C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008B84 CF 00            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008B86 05 E6 02         [ 2]  156 	ldw x,#2 
      008B89 C7 00 04 90      [ 4]  157 	ld a,([ptr16],x)
      008B8D AE 16            [ 1]  158 	cp a,#3
      008B8F 90 CD            [ 1]  159 	jreq insert_ln_exit
      008B91 92               [ 1]  160 	clrw x 
      008B92 22               [ 1]  161 	ld xl,a
      008B93 0F 01            [ 2]  162 	ldw (LLEN,sp),x 
      008B95 A6 0D CD         [ 2]  163 	ldw x,txtbgn
      008B98 89 8B            [ 2]  164 	ldw (DEST,sp),x 
      008B9A A6 3E CD         [ 2]  165 	ldw x,txtend 
      008B9D 89 8B            [ 2]  166 	jra 4$
      008B9F AE 16 90 CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BA3 94 06            [ 2]  169 	ldw (LINENO,sp),x 
      008BA5 6B 02 CD         [ 2]  170 	ldw x,#2 
      008BA8 89 E8 90 93      [ 4]  171 	ld a,([ptr16],x)
      008BAC 7B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BAD 02 6B            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BAF 03 CC            [ 2]  176 	ldw x,(LINENO,sp)
      008BB1 8A               [ 1]  177 	clr a 
      008BB2 FC 0C 45         [ 4]  178 	call search_lineno 
      008BB3 5D               [ 2]  179 	tnzw x 
      008BB3 A1 81            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BB5 26 15            [ 2]  183 	ldw (DEST,sp),y 
      008BB7 7B 03            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BB9 11 02            [ 2]  187 2$: ldw (DEST,sp),x 
      008BBB 2B 03 CC         [ 4]  188 	call del_line
      000D0E                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BBE 8A FC            [ 1]  192 	ld a,#3
      008BC0 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008BC0 A6 01            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BC2 CD 8A            [ 2]  197 	ldw x,(DEST,sp)
      008BC4 47 0C 03         [ 2]  198 	cpw x,txtend 
      008BC7 90 5C            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BC9 CC 8A            [ 2]  202 	ldw x,(DEST,sp)
      008BCB FC A1            [ 2]  203 	ldw y,(LLEN,sp)
      008BCD 80 26 13         [ 4]  204 	call create_gap
      008BD0 0D 03            [ 2]  205 	jra 5$
      000D24                        206 4$: 
      008BD2 26 03 CC         [ 2]  207 	addw x,(LLEN,sp)
      008BD5 8A FC 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008BD7 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008BD7 A6 01 CD         [ 2]  211 	ldw acc16,x 
      008BDA 8A 39 0A 03      [ 2]  212 	ldw y,#pad ;SRC 
      008BDE 90 5A            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008BE0 CC 8A FC         [ 4]  214 	call move 
      000D38                        215 insert_ln_exit:	
      000D38                        216 	_drop VSIZE
      008BE3 A1 82            [ 2]    1     addw sp,#VSIZE 
      008BE5 26               [ 4]  217 	ret
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
      000D3B                        233 parse_quote: 
      000D3B                        234 	_vars VSIZE 
      008BE6 0E 7B            [ 2]    1     sub sp,#VSIZE 
      008BE8 03               [ 1]  235 	clr a
      008BE9 CD 8A            [ 1]  236 1$:	ld (PREV,sp),a 
      000D40                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      008BEB 39 0F 03         [ 4]  238 	ld a,([in.w],y)
      008BEE 90 AE            [ 1]  239 	jreq 6$
      008BF0 16 90 CC 8A      [ 1]  240 	inc in 
      008BF4 FC A1            [ 1]  241 	ld (CURR,sp),a 
      008BF6 83 26            [ 1]  242 	ld a,#'\
      008BF8 26 7B            [ 1]  243 	cp a, (PREV,sp)
      008BFA 03 11            [ 1]  244 	jrne 3$
      008BFC 02 26            [ 1]  245 	clr (PREV,sp)
      008BFE 03 CC            [ 1]  246 	ld a,(CURR,sp)
      008C00 8A FC            [ 4]  247 	callr convert_escape
      008C02 F7               [ 1]  248 	ld (x),a 
      008C02 7B               [ 1]  249 	incw x 
      008C03 02 10            [ 2]  250 	jra 2$
      000D5B                        251 3$:
      008C05 03 CD            [ 1]  252 	ld a,(CURR,sp)
      008C07 8A 47            [ 1]  253 	cp a,#'\'
      008C09 7B 02            [ 1]  254 	jreq 1$
      008C0B 6B 03            [ 1]  255 	cp a,#'"
      008C0D 90 AE            [ 1]  256 	jreq 6$ 
      008C0F 16               [ 1]  257 	ld (x),a 
      008C10 90               [ 1]  258 	incw x 
      008C11 72 5F            [ 2]  259 	jra 2$
      000D69                        260 6$:
      008C13 00               [ 1]  261 	clr (x)
      008C14 0E               [ 1]  262 	incw x 
      008C15 C7 00            [ 1]  263 	ldw y,x 
      008C17 0F               [ 1]  264 	clrw x 
      008C18 72 B9            [ 1]  265 	ld a,#TK_QSTR  
      000D70                        266 	_drop VSIZE
      008C1A 00 0E            [ 2]    1     addw sp,#VSIZE 
      008C1C CC               [ 4]  267 	ret 
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
      000D73                        278 convert_escape:
      008C1D 8A               [ 2]  279 	pushw x 
      008C1E FC A1 0F         [ 2]  280 	ldw x,#escaped 
      008C21 26               [ 1]  281 1$:	cp a,(x)
      008C22 08 03            [ 1]  282 	jreq 2$
      008C24 04               [ 1]  283 	tnz (x)
      008C25 CD A6            [ 1]  284 	jreq 3$
      008C27 53               [ 1]  285 	incw x 
      008C28 CC 8A            [ 2]  286 	jra 1$
      008C2A FC A1 84         [ 2]  287 2$: subw x,#escaped 
      008C2D 26               [ 1]  288 	ld a,xl 
      008C2E 11 7B            [ 1]  289 	add a,#7
      008C30 03               [ 2]  290 3$:	popw x 
      008C31 11               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    292 
      008C32 02 2A 08 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008C35                        310 parse_integer: ; { -- n }
      008C35 97               [ 2]  311 	pushw x 	
      008C36 7B 02            [ 1]  312 	push #0 ; TCHAR
      008C38 CD 8A            [ 1]  313 	push #10 ; BASE=10
      008C3A A4 0A            [ 1]  314 	cp a,#'$
      008C3C 02 04            [ 1]  315 	jrne 2$ 
      008C3D                        316     _drop #1
      008C3D CC 8A            [ 2]    1     addw sp,##1 
      008C3F FC 10            [ 1]  317 	push #16  ; BASE=16
      008C40 F7               [ 1]  318 2$:	ld (x),a 
      008C40 A1               [ 1]  319 	incw x 
      008C41 20 2A 03         [ 4]  320 	ld a,([in.w],y)
      008C44 CC 8A FC 01      [ 1]  321 	inc in 
      008C47 CD 18 A8         [ 4]  322 	call to_upper 
      008C47 A6 4F            [ 1]  323 	ld (TCHAR,sp),a 
      008C49 11 02 2A         [ 4]  324 	call is_digit 
      008C4C 03 CC            [ 1]  325 	jrc 2$
      008C4E 8A FC            [ 1]  326 	ld a,#16 
      008C50 0D 04            [ 1]  327 	cp a,(BASE,sp)
      008C52 26 18            [ 1]  328 	jrne 3$ 
      008C54 7B 03            [ 1]  329 	ld a,(TCHAR,sp)
      008C56 11 02            [ 1]  330 	cp a,#'A 
      008C58 27 12            [ 1]  331 	jrmi 3$ 
      008C5A 7B 02            [ 1]  332 	cp a,#'G 
      008C5C 97 7B            [ 1]  333 	jrmi 2$ 
      008C5E 03 95 7B 01      [ 1]  334 3$: dec in 	
      008C62 CD               [ 1]  335     clr (x)
      008C63 8A 61            [ 2]  336 	ldw x,(XSAVE,sp)
      008C65 0C 02 0C         [ 4]  337 	call atoi24
      008C68 03 CC            [ 2]  338 	ldw y,(XSAVE,sp)
      008C6A 8A FC 0C         [ 1]  339 	ld a,acc24 
      008C6C 90 F7            [ 1]  340 	ld (y),a 
      008C6C 7B 01            [ 1]  341 	incw y  
      008C6E 90 F7 90         [ 2]  342 	ldw x,acc16 
      008C71 5C CD            [ 2]  343 	ldw (y),x 
      008C73 89 8B 7B 03      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008C77 11 02            [ 1]  345 	ld a,#TK_INTGR
      000DDE                        346 	_drop VSIZE  
      008C79 2B 09            [ 2]    1     addw sp,#VSIZE 
      008C7B 90               [ 4]  347 	ret 	
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
      000DE1                        364 parse_binary: ; { -- n }
      008C7C 7F 0C            [ 1]  365 	push #0
      008C7E 02 0C            [ 1]  366 	push #0
      008C80 03 CC            [ 1]  367 	push #0
      000DE7                        368 2$:	
      008C82 8A FC 00         [ 4]  369 	ld a,([in.w],y)
      008C84 72 5C 00 01      [ 1]  370 	inc in 
      008C84 0C 03            [ 1]  371 	cp a,#'0 
      008C86 CC 8A            [ 1]  372 	jreq 3$
      008C88 FC 31            [ 1]  373 	cp a,#'1 
      008C89 27 02            [ 1]  374 	jreq 3$ 
      008C89 90 AE            [ 2]  375 	jra bin_exit 
      008C8B 16 90            [ 1]  376 3$: sub a,#'0 
      008C8D 0F               [ 1]  377 	rrc a
      008C8E 01 72            [ 1]  378 	rlc (BINARY+2,sp) 
      008C90 F9 01            [ 1]  379 	rlc (BINARY+1,sp)
      008C92 90 7F            [ 1]  380 	rlc (BINARY,sp) 
      008C94 7B 02            [ 2]  381 	jra 2$  
      000E03                        382 bin_exit:
      008C96 C7 00 04 A6      [ 1]  383 	dec in 
      008C9A 0D CD            [ 1]  384 	ldw y,x
      008C9C 89 8B            [ 1]  385 	ld a,(BINARY,sp)
      008C9E 5B 04            [ 1]  386 	ld (y),a 
      008CA0 90 85            [ 1]  387 	incw y 
      008CA2 81 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CA3 90 FF            [ 2]  389 	ldw (y),x 
      008CA3 88 4E CD 8C      [ 2]  390 	addw y,#2  
      008CA7 BA CD            [ 1]  391 	ld a,#TK_INTGR 	
      000E19                        392 	_drop VSIZE 
      008CA9 89 8B            [ 2]    1     addw sp,#VSIZE 
      008CAB 7B               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      000E1C                        402 is_alpha::
      008CAC 01 CD            [ 1]  403 	cp a,#'A 
      008CAE 8C               [ 1]  404 	ccf 
      008CAF BA CD            [ 1]  405 	jrnc 9$ 
      008CB1 89 8B            [ 1]  406 	cp a,#'Z+1 
      008CB3 A6 20            [ 1]  407 	jrc 9$ 
      008CB5 CD 89            [ 1]  408 	cp a,#'a 
      008CB7 8B               [ 1]  409 	ccf 
      008CB8 84 81            [ 1]  410 	jrnc 9$
      008CBA A1 7B            [ 1]  411 	cp a,#'z+1
      008CBA A4               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E2D                        421 is_digit::
      008CBB 0F A1            [ 1]  422 	cp a,#'0
      008CBD 09 23            [ 1]  423 	jrc 1$
      008CBF 02 AB            [ 1]  424     cp a,#'9+1
      008CC1 07               [ 1]  425 	ccf 
      008CC2 AB               [ 1]  426 1$:	ccf 
      008CC3 30               [ 4]  427     ret
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
      000E36                        438 is_alnum::
      008CC4 81 0E 2D         [ 4]  439 	call is_digit
      008CC5 25 03            [ 1]  440 	jrc 1$ 
      008CC5 52 02 0F         [ 4]  441 	call is_alpha
      008CC8 01               [ 4]  442 1$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      000E3F                        453 is_symbol_char: 
      008CC9 90 CE            [ 1]  454 	cp a,#'_ 
      008CCB 00 1C            [ 1]  455 	jrne 1$
      008CCD 4D               [ 1]  456 	scf 
      008CCE 27 04            [ 2]  457 	jra 9$ 
      008CD0 90 CE 00         [ 4]  458 1$:	call is_alnum 
      008CD3 05               [ 4]  459 9$: ret 
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
      008CD4                        473 parse_symbol:
      008CD4 90               [ 1]  474 	incw x ; keep space for TK_ID 
      000E4B                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008CD5 C3 00 1E         [ 4]  477 	call to_upper  
      008CD8 2A               [ 1]  478 	ld (x), a 
      008CD9 10               [ 1]  479 	incw x
      008CDA 90 F3 27         [ 4]  480 	ld a,([in.w],y)
      008CDD 0E 2B 0A 90      [ 1]  481 	inc in 
      008CE1 E6 02 6B         [ 4]  482 	call is_symbol_char 
      008CE4 02 72            [ 1]  483 	jrc symb_loop 
      008CE6 F9               [ 1]  484 	clr (x)
      008CE7 01 20 EA 01      [ 1]  485 	dec in  
      008CEA 81               [ 4]  486 	ret 
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
      000E62                        502 parse_keyword: 
      008CEA 5F               [ 2]  503 	pushw x ; preserve *symbol 
      008CEB 51 5B 02         [ 4]  504 	call parse_symbol
      008CEE 51 81            [ 2]  505 	ldw x,(XFIRST,sp) 
      008CF0 E6 02            [ 1]  506 	ld a,(2,x)
      008CF0 52 04            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008CF2 E6 02            [ 1]  509 	ld a,(1,x) 
      008CF4 6B 02            [ 1]  510 	sub a,#'A 
      008CF6 0F 01 90         [ 2]  511 	ldw x,#3 
      008CF9 93               [ 4]  512 	mul x,a 
      008CFA 72 F9 01         [ 2]  513 	addw x,#vars 
      008CFD 17 03            [ 1]  514 	ld a,#TK_VAR 
      008CFF 90 CE            [ 2]  515 	jra 4$ 
      000E7B                        516 2$: ; check for keyword, otherwise syntax error.
      000E7B                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D01 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D04 F2 03            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D06 90 CF            [ 1]  519 	incw y 
      008D08 00 0E 16         [ 4]  520 	call search_dict
      008D0B 03               [ 1]  521 	tnz a
      008D0C CD 94            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D0E 32 90            [ 2]  525 	ldw y,(XFIRST,sp)
      008D10 CE 00            [ 1]  526 	ld a,#TK_LABEL 
      008D12 1E 72            [ 1]  527 	ld (y),a 
      008D14 F2 01            [ 1]  528 	incw y
      008D16 90               [ 1]  529 	ldw x,y 
      008D17 CF 00 1E         [ 4]  530 	call strlen
      008D1A 5B 04            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008D1C 81 02            [ 2]  532 	jrule 22$ 
      008D1D A6 0F            [ 1]  533 	ld a,#NAME_MAX_LEN 
      000E9A                        534 22$:	
      008D1D 52               [ 1]  535 	push a 
      000E9B                        536 24$:
      008D1E 06 1F            [ 1]  537     ld a,(y)
      008D20 03 17            [ 1]  538 	jreq 3$
      008D22 05 90            [ 1]  539 	incw y
      008D24 CF 00            [ 1]  540 	dec (1,sp) 
      008D26 0E 90            [ 1]  541 	jrne 24$
      008D28 93               [ 1]  542 	clr a 
      008D29 72 BB            [ 1]  543 	ld (y),a 
      008D2B 00 0E            [ 1]  544 3$: incw y 
      000EAA                        545 	_drop 1 
      008D2D 1F 01            [ 2]    1     addw sp,#1 
      008D2F CE 00            [ 1]  546 	ld a,#TK_LABEL 
      008D31 1E               [ 1]  547 	clrw x 
      008D32 72 F0            [ 2]  548 	jra 5$ 
      000EB1                        549 4$:	
      008D34 03 CF            [ 2]  550 	ldw y,(XFIRST,sp)
      008D36 00 0E            [ 1]  551 	cp a,#TK_NOT 
      008D38 1E 01            [ 1]  552 	jrmi 41$
      008D3A CD 94            [ 1]  553 	ld (y),a 
      008D3C 32 CE            [ 1]  554 	incw y 
      008D3E 00 1E            [ 2]  555 	jra 5$ 
      000EBD                        556 41$:	
      008D40 72 FB 05         [ 2]  557 	cpw x,#let  
      008D43 CF 00            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D45 1E 5B            [ 1]  559 	ld (y),a 
      008D47 06 81            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008D49 90 FF            [ 2]  561 	ldw (y),x
      008D49 52 08 CE 00      [ 2]  562 	addw y,#2  
      000ECC                        563 5$:	_drop VSIZE 
      008D4D 1E C3            [ 2]    1     addw sp,#VSIZE 
      008D4F 00               [ 4]  564 	ret  	
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
      000ECF                        575 skip:
      008D50 1C               [ 1]  576 	push a
      008D51 26 19 AE         [ 4]  577 1$:	ld a,([in.w],y)
      008D54 00 02            [ 1]  578 	jreq 2$
      008D56 72 D6            [ 1]  579 	cp a,(C,sp)
      008D58 00 1A            [ 1]  580 	jrne 2$
      008D5A A1 03 27 5A      [ 1]  581 	inc in
      008D5E 5F 97            [ 2]  582 	jra 1$
      000EDF                        583 2$: _drop 1 
      008D60 1F 07            [ 2]    1     addw sp,#1 
      008D62 CE               [ 4]  584 	ret
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
      000EE2                        609 get_token:: 
      000EE2                        610 	_vars VSIZE
      008D63 00 1C            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000EE4                        616 0$: 
      008D65 1F 01 CE 00      [ 2]  617 	ldw y,#tib    	
      008D69 1E 20            [ 1]  618 	ld a,#SPACE
      008D6B 38 72 CE         [ 4]  619 	call skip
      008D6E 00 1A 1F 05 AE   [ 1]  620 	mov in.saved,in 
      008D73 00 02 72         [ 4]  621 	ld a,([in.w],y)
      008D76 D6 00            [ 1]  622 	jrne 1$
      008D78 1A 97            [ 1]  623 	ldw y,x 
      008D7A 1F 07 1E         [ 2]  624 	jp token_exit ; end of line 
      008D7D 05 4F CD 8C      [ 1]  625 1$:	inc in 
      008D81 C5 5D 26         [ 4]  626 	call to_upper 
      008D84 04 17            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F05                        629 str_tst:  	
      000F05                        630 	_case '"' nbr_tst
      008D86 01 20            [ 1]    1 	ld a,#'"' 
      008D88 05 1F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8A 01 CD            [ 1]    3 	jrne nbr_tst
      008D8C 8C F0            [ 1]  631 	ld a,#TK_QSTR
      008D8E F7               [ 1]  632 	ld (x),a 
      008D8E A6               [ 1]  633 	incw x 
      008D8F 03 11 08         [ 4]  634 	call parse_quote
      008D92 27 24 1E         [ 2]  635 	jp token_exit
      000F15                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008D95 01 C3            [ 1]  638 	ld a,#'$'
      008D97 00 1E            [ 1]  639 	cp a,(TCHAR,sp) 
      008D99 27 09            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008D9B 1E 01            [ 1]  642 	ld a,#'&
      008D9D 16 07            [ 1]  643 	cp a,(TCHAR,sp)
      008D9F CD 8D            [ 1]  644 	jrne 0$
      008DA1 1D 20            [ 1]  645 	ld a,#TK_INTGR
      008DA3 06               [ 1]  646 	ld (x),a 
      008DA4 5C               [ 1]  647 	incw x 
      008DA4 72 FB 07         [ 4]  648 	call parse_binary ; expect binary integer 
      008DA7 CF 00 1E         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DAA 1E 07            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DAC CF 00 0E         [ 4]  652 	call is_digit
      008DAF 90 AE            [ 1]  653 	jrnc 3$
      008DB1 16 E0            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DB3 1E               [ 1]  655 	ld (x),a 
      008DB4 01               [ 1]  656 	incw x 
      008DB5 CD 94            [ 1]  657 	ld a,(TCHAR,sp)
      008DB7 32 0D 90         [ 4]  658 	call parse_integer 
      008DB8 CC 10 93         [ 2]  659 	jp token_exit 
      000F3E                        660 3$: 
      000F3E                        661 	_case '(' bkslsh_tst 
      008DB8 5B 08            [ 1]    1 	ld a,#'(' 
      008DBA 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBB 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008DBB 52 02            [ 1]  662 	ld a,#TK_LPAREN
      008DBD 4F 6B 01         [ 2]  663 	jp token_char   	
      008DC0                        664 bkslsh_tst: ; character token 
      000F49                        665 	_case '\',rparnt_tst
      008DC0 91 D6            [ 1]    1 	ld a,#'\' 
      008DC2 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC4 24 72            [ 1]    3 	jrne rparnt_tst
      008DC6 5C 00            [ 1]  666 	ld a,#TK_CHAR 
      008DC8 02               [ 1]  667 	ld (x),a 
      008DC9 6B               [ 1]  668 	incw x 
      008DCA 02 A6 5C         [ 4]  669 	ld a,([in.w],y)
      008DCD 11               [ 1]  670 	ld (x),a 
      008DCE 01               [ 1]  671 	incw x
      008DCF 26 0A            [ 1]  672 	ldw y,x 	 
      008DD1 0F 01 7B 02      [ 1]  673 	inc in  
      008DD5 AD               [ 1]  674 	clrw x 
      008DD6 1C               [ 1]  675 	ld xl,a 
      008DD7 F7 5C            [ 1]  676 	ld a,#TK_CHAR 
      008DD9 20 E5 93         [ 2]  677 	jp token_exit 
      008DDB                        678 rparnt_tst:		
      000F65                        679 	_case ')' colon_tst 
      008DDB 7B 02            [ 1]    1 	ld a,#')' 
      008DDD A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDF 27 DD            [ 1]    3 	jrne colon_tst
      008DE1 A1 22            [ 1]  680 	ld a,#TK_RPAREN 
      008DE3 27 04 F7         [ 2]  681 	jp token_char
      000F70                        682 colon_tst:
      000F70                        683 	_case ':' comma_tst 
      008DE6 5C 20            [ 1]    1 	ld a,#':' 
      008DE8 D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE9 26 05            [ 1]    3 	jrne comma_tst
      008DE9 7F 5C            [ 1]  684 	ld a,#TK_COLON 
      008DEB 90 93 5F         [ 2]  685 	jp token_char  
      000F7B                        686 comma_tst:
      000F7B                        687 	_case COMMA sharp_tst 
      008DEE A6 02            [ 1]    1 	ld a,#COMMA 
      008DF0 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF2 81 05            [ 1]    3 	jrne sharp_tst
      008DF3 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008DF3 89 AE 8E         [ 2]  689 	jp token_char
      000F86                        690 sharp_tst:
      000F86                        691 	_case SHARP dash_tst 
      008DF6 08 F1            [ 1]    1 	ld a,#SHARP 
      008DF8 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFA 7D 27            [ 1]    3 	jrne dash_tst
      008DFC 09 5C            [ 1]  692 	ld a,#TK_SHARP
      008DFE 20 F7 1D         [ 2]  693 	jp token_char  	 	 
      000F91                        694 dash_tst: 	
      000F91                        695 	_case '-' at_tst 
      008E01 8E 08            [ 1]    1 	ld a,#'-' 
      008E03 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E05 07 85            [ 1]    3 	jrne at_tst
      008E07 81 61            [ 1]  696 	ld a,#TK_MINUS  
      008E09 62 74 6E         [ 2]  697 	jp token_char 
      000F9C                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      000F9C                        699 	_case '@' qmark_tst 
      008E0C 76 66            [ 1]    1 	ld a,#'@' 
      008E0E 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E10 26 05            [ 1]    3 	jrne qmark_tst
      008E10 89 4B            [ 1]  700 	ld a,#TK_ARRAY 
      008E12 00 4B 0A         [ 2]  701 	jp token_char
      000FA7                        702 qmark_tst:
      000FA7                        703 	_case '?' tick_tst 
      008E15 A1 24            [ 1]    1 	ld a,#'?' 
      008E17 26 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008E19 5B 01            [ 1]    3 	jrne tick_tst
      008E1B 4B 10            [ 1]  704 	ld a,#TK_CMD  
      008E1D F7               [ 1]  705 	ld (x),a 
      008E1E 5C               [ 1]  706 	incw x 
      008E1F 91 D6            [ 1]  707 	ldw y,x 
      008E21 01 72 5C         [ 2]  708 	ldw x,#print
      008E24 00 02            [ 2]  709 	ldw (y),x 
      008E26 CD 99 28 6B      [ 2]  710 	addw y,#2
      008E2A 02 CD 8E         [ 2]  711 	jp token_exit
      000FBF                        712 tick_tst: ; comment 
      000FBF                        713 	_case TICK plus_tst 
      008E2D AD 25            [ 1]    1 	ld a,#TICK 
      008E2F ED A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E31 10 11            [ 1]    3 	jrne plus_tst
      008E33 01 26            [ 1]  714 	ld a,#TK_CMD
      008E35 0A               [ 1]  715 	ld (x),a 
      008E36 7B               [ 1]  716 	incw x
      008E37 02 A1 41 2B      [ 2]  717 	ldw y,#remark 
      008E3B 04               [ 2]  718 	ldw (x),y 
      008E3C A1 47 2B         [ 2]  719 	addw x,#2  
      000FD1                        720 copy_comment:
      008E3F DD 72 5A 00      [ 2]  721 	ldw y,#tib 
      008E43 02 7F 1E 03      [ 2]  722 	addw y,in.w
      008E47 CD 99            [ 2]  723 	pushw y 
      008E49 34 16 03         [ 4]  724 	call strcpy
      008E4C C6 00 0D         [ 2]  725 	subw y,(1,sp)
      008E4F 90 F7            [ 1]  726 	incw y ; strlen+1 
      008E51 90 5C            [ 2]  727 	ldw (1,sp),y 
      008E53 CE 00 0E         [ 2]  728 	addw x,(1,sp) 
      000FE8                        729 	_drop 2 
      008E56 90 FF            [ 2]    1     addw sp,#2 
      008E58 72               [ 1]  730 	clr a 
      008E59 A9 00            [ 1]  731 	ldw y,x 
      008E5B 02 A6 84         [ 2]  732 	jp token_exit 
      000FF0                        733 plus_tst:
      000FF0                        734 	_case '+' star_tst 
      008E5E 5B 04            [ 1]    1 	ld a,#'+' 
      008E60 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E61 26 05            [ 1]    3 	jrne star_tst
      008E61 4B 00            [ 1]  735 	ld a,#TK_PLUS  
      008E63 4B 00 4B         [ 2]  736 	jp token_char 
      000FFB                        737 star_tst:
      000FFB                        738 	_case '*' slash_tst 
      008E66 00 2A            [ 1]    1 	ld a,#'*' 
      008E67 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008E67 91 D6            [ 1]    3 	jrne slash_tst
      008E69 01 72            [ 1]  739 	ld a,#TK_MULT 
      008E6B 5C 00 02         [ 2]  740 	jp token_char 
      001006                        741 slash_tst: 
      001006                        742 	_case '/' prcnt_tst 
      008E6E A1 30            [ 1]    1 	ld a,#'/' 
      008E70 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E72 A1 31            [ 1]    3 	jrne prcnt_tst
      008E74 27 02            [ 1]  743 	ld a,#TK_DIV 
      008E76 20 0B A0         [ 2]  744 	jp token_char 
      001011                        745 prcnt_tst:
      001011                        746 	_case '%' eql_tst 
      008E79 30 46            [ 1]    1 	ld a,#'%' 
      008E7B 09 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008E7D 09 02            [ 1]    3 	jrne eql_tst
      008E7F 09 01            [ 1]  747 	ld a,#TK_MOD
      008E81 20 E4 8F         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      008E83                        750 eql_tst:
      00101C                        751 	_case '=' gt_tst 		
      008E83 72 5A            [ 1]    1 	ld a,#'=' 
      008E85 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E87 90 93            [ 1]    3 	jrne gt_tst
      008E89 7B 01            [ 1]  752 	ld a,#TK_EQUAL
      008E8B 90 F7 90         [ 2]  753 	jp token_char 
      001027                        754 gt_tst:
      001027                        755 	_case '>' lt_tst 
      008E8E 5C 1E            [ 1]    1 	ld a,#'>' 
      008E90 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E92 FF 72            [ 1]    3 	jrne lt_tst
      008E94 A9 00            [ 1]  756 	ld a,#TK_GT 
      008E96 02 A6            [ 1]  757 	ld (ATTRIB,sp),a 
      008E98 84 5B 03         [ 4]  758 	ld a,([in.w],y)
      008E9B 81 5C 00 01      [ 1]  759 	inc in 
      008E9C A1 3D            [ 1]  760 	cp a,#'=
      008E9C A1 41            [ 1]  761 	jrne 1$
      008E9E 8C 24            [ 1]  762 	ld a,#TK_GE 
      008EA0 0B A1            [ 2]  763 	jra token_char  
      008EA2 5B 25            [ 1]  764 1$: cp a,#'<
      008EA4 07 A1            [ 1]  765 	jrne 2$
      008EA6 61 8C            [ 1]  766 	ld a,#TK_NE 
      008EA8 24 02            [ 2]  767 	jra token_char 
      008EAA A1 7B 81 01      [ 1]  768 2$: dec in
      008EAD 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      008EAD A1 30            [ 2]  770 	jra token_char 	 
      001050                        771 lt_tst:
      001050                        772 	_case '<' other
      008EAF 25 03            [ 1]    1 	ld a,#'<' 
      008EB1 A1 3A            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB3 8C 8C            [ 1]    3 	jrne other
      008EB5 81 34            [ 1]  773 	ld a,#TK_LT 
      008EB6 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      008EB6 CD 8E AD         [ 4]  775 	ld a,([in.w],y)
      008EB9 25 03 CD 8E      [ 1]  776 	inc in 
      008EBD 9C 81            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008EBF 26 04            [ 1]  778 	jrne 1$
      008EBF A1 5F            [ 1]  779 	ld a,#TK_LE 
      008EC1 26 03            [ 2]  780 	jra token_char 
      008EC3 99 20            [ 1]  781 1$: cp a,#'>
      008EC5 03 CD            [ 1]  782 	jrne 2$
      008EC7 8E B6            [ 1]  783 	ld a,#TK_NE 
      008EC9 81 1E            [ 2]  784 	jra token_char 
      008ECA 72 5A 00 01      [ 1]  785 2$: dec in 
      008ECA 5C 02            [ 1]  786 	ld a,(ATTRIB,sp)
      008ECB 20 16            [ 2]  787 	jra token_char 	
      001079                        788 other: ; not a special character 	 
      008ECB CD 99            [ 1]  789 	ld a,(TCHAR,sp)
      008ECD 28 F7 5C         [ 4]  790 	call is_alpha 
      008ED0 91 D6            [ 1]  791 	jrc 30$ 
      008ED2 01 72 5C         [ 2]  792 	jp syntax_error 
      001083                        793 30$: 
      008ED5 00 02 CD         [ 4]  794 	call parse_keyword
      008ED8 8E BF 25         [ 2]  795 	cpw x,#remark 
      008EDB EF 7F            [ 1]  796 	jrne token_exit 
      008EDD 72               [ 1]  797 	ldw x,y 
      008EDE 5A 00 02         [ 2]  798 	jp copy_comment 
      00108F                        799 token_char:
      008EE1 81               [ 1]  800 	ld (x),a 
      008EE2 5C               [ 1]  801 	incw x
      008EE2 89 CD            [ 1]  802 	ldw y,x 
      001093                        803 token_exit:
      001093                        804 	_drop VSIZE 
      008EE4 8E CA            [ 2]    1     addw sp,#VSIZE 
      008EE6 1E               [ 4]  805 	ret
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
      001096                        825 compile::
      008EE7 01 E6            [ 2]  826 	pushw y 
      001098                        827 	_vars VSIZE 
      008EE9 02 26            [ 2]    1     sub sp,#VSIZE 
      008EEB 0F E6 01 A0 41   [ 1]  828 	mov basicptr,txtbgn
      008EF0 AE 00 03 42      [ 1]  829 	bset flags,#FCOMP 
      008EF4 1C 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      008EF6 35 A6 85         [ 2]  831 	ldw x,#0
      008EF9 20 36 E0         [ 2]  832 	ldw pad,x ; destination buffer 
      008EFB C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      008EFB AE B4 CF         [ 2]  834 	ldw x,#pad+3
      008EFE 16 01 90 5C      [ 1]  835 	clr in 
      008F02 CD 99 B5         [ 4]  836 	call get_token
      008F05 4D 26            [ 1]  837 	cp a,#TK_INTGR
      008F07 29 16            [ 1]  838 	jrne 2$
      008F09 01 A6 03         [ 2]  839 	cpw x,#1 
      008F0C 90 F7            [ 1]  840 	jrpl 1$
      008F0E 90 5C            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F10 93 CD 94         [ 2]  842 	jp tb_error
      008F13 06 A1 0F         [ 2]  843 1$:	ldw pad,x 
      008F16 23 02 A6 0F      [ 2]  844 	ldw y,#pad+3 
      008F1A 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      008F1A 88 05            [ 1]  846 	jrult 3$
      008F1B A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F1B 90 F6 27         [ 2]  848 	jp tb_error 
      0010D8                        849 3$:	
      008F1E 09               [ 1]  850 	ldw x,y 
      008F1F 90 5C 0A         [ 4]  851 	call get_token 
      008F22 01 26            [ 1]  852 	cp a,#TK_NONE 
      008F24 F6 4F            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F26 90 F7 90 5C      [ 2]  855 	subw y,#pad
      008F2A 5B 01            [ 1]  856     ld a,yl
      008F2C A6 03 5F         [ 2]  857 	ldw x,#pad 
      008F2F 20 1B 19         [ 2]  858 	ldw ptr16,x 
      008F31 E7 02            [ 1]  859 	ld (2,x),a 
      008F31 16               [ 2]  860 	ldw x,(x)
      008F32 01 A1            [ 1]  861 	jreq 10$
      008F34 87 2B 06         [ 4]  862 	call insert_line
      008F37 90 F7 90 5C      [ 1]  863 	clr  count 
      008F3B 20 0F            [ 2]  864 	jra  11$ 
      008F3D                        865 10$: ; line# is zero 
      008F3D A3 9D 2E         [ 2]  866 	ldw x,ptr16  
      008F40 27 0A 90         [ 2]  867 	ldw basicptr,x 
      008F43 F7 90            [ 1]  868 	ld a,(2,x)
      008F45 5C 90 FF         [ 1]  869 	ld count,a 
      008F48 72 A9 00 02      [ 1]  870 	mov in,#3 
      001109                        871 11$:
      001109                        872 	_drop VSIZE 
      008F4C 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F4E 81 1B 00 22      [ 1]  873 	bres flags,#FCOMP 
      008F4F 90 85            [ 2]  874 	popw y 
      008F4F 88               [ 4]  875 	ret 
                                    876 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
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
      001112                         48 cpy_cmd_name:
      008F50 91               [ 2]   49 	tnzw x 
      008F51 D6 01            [ 1]   50 	jreq 10$
      008F53 27               [ 1]   51 	ld a,(x)
      008F54 0A               [ 1]   52 	incw x
      008F55 11 01            [ 1]   53 	and a,#15  
      008F57 26               [ 1]   54 	push a 
      008F58 06 72            [ 1]   55     tnz (1,sp) 
      008F5A 5C 00            [ 1]   56 	jreq 9$
      008F5C 02               [ 1]   57 1$:	ld a,(x)
      008F5D 20 F1            [ 1]   58 	ld (y),a  
      008F5F 5B               [ 1]   59 	incw x
      008F60 01 81            [ 1]   60 	incw y 
      008F62 0A 01            [ 1]   61 	dec (1,sp)	 
      008F62 52 02            [ 1]   62 	jrne 1$
      008F64 84               [ 1]   63 9$: pop a 
      001129                         64 10$: 
      008F64 90               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00112A                         75 add_space:
      008F65 AE 16            [ 2]   76 	decw y 
      008F67 90 A6            [ 1]   77 	ld a,(y)
      008F69 20 CD            [ 1]   78 	incw y
      008F6B 8F 4F            [ 1]   79 	cp a,#') 
      008F6D 55 00            [ 1]   80 	jreq 0$
      008F6F 02 00 03         [ 4]   81 	call is_alnum 
      008F72 91 D6            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      001139                         83 0$: 
      008F74 01 26            [ 1]   84 	ld a,#SPACE 
      008F76 05 90            [ 1]   85 	ld (y),a 
      008F78 93 CC            [ 1]   86 	incw y 
      008F7A 91               [ 4]   87 1$: ret 
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
      001140                         99 right_align::
      008F7B 13               [ 1]  100 	push a 
      008F7C 72 5C            [ 1]  101 0$: ld a,(1,sp)
      008F7E 00 02 CD         [ 1]  102 	cp a,tab_width 
      008F81 99 28            [ 1]  103 	jrpl 1$
      008F83 6B 01            [ 1]  104 	ld a,#SPACE 
      008F85 5A               [ 2]  105 	decw x
      008F85 A6               [ 1]  106 	ld (x),a  
      008F86 22 11            [ 1]  107 	inc (1,sp)
      008F88 01 26            [ 2]  108 	jra 0$ 
      008F8A 0A               [ 1]  109 1$: pop a 	
      008F8B A6               [ 4]  110 	ret 
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
      001152                        123 cpy_quote:
      008F8C 02 F7            [ 1]  124 	ld a,#'"
      008F8E 5C CD            [ 1]  125 	ld (y),a 
      008F90 8D BB            [ 1]  126 	incw y 
      008F92 CC               [ 2]  127 	pushw x 
      008F93 91 13 E3         [ 4]  128 	call skip_string 
      008F95 85               [ 2]  129 	popw x 
      008F95 A6               [ 1]  130 1$:	ld a,(x)
      008F96 24 11            [ 1]  131 	jreq 9$
      008F98 01               [ 1]  132 	incw x 
      008F99 27 17            [ 1]  133 	cp a,#SPACE 
      008F9B A6 26            [ 1]  134 	jrult 3$
      008F9D 11 01            [ 1]  135 	ld (y),a
      008F9F 26 0A            [ 1]  136 	incw y 
      008FA1 A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      008FA3 F7 5C            [ 1]  138 	jrne 1$ 
      00116D                        139 2$:
      008FA5 CD 8E            [ 1]  140 	ld (y),a
      008FA7 61 CC            [ 1]  141 	incw y  
      008FA9 91 13            [ 2]  142 	jra 1$
      008FAB 7B               [ 1]  143 3$: push a 
      008FAC 01 CD            [ 1]  144 	ld a,#'\
      008FAE 8E AD            [ 1]  145 	ld (y),a 
      008FB0 24 0C            [ 1]  146 	incw y  
      008FB2 A6               [ 1]  147 	pop a 
      008FB3 84 F7            [ 1]  148 	sub a,#7
      008FB5 5C 7B 01         [ 1]  149 	ld acc8,a 
      008FB8 CD 8E 10 CC      [ 1]  150 	clr acc16
      008FBC 91               [ 2]  151 	pushw x
      008FBD 13 0D 88         [ 2]  152 	ldw x,#escaped 
      008FBE 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      008FBE A6               [ 1]  154 	ld a,(x)
      008FBF 28               [ 2]  155 	popw x
      008FC0 11 01            [ 2]  156 	jra 2$
      008FC2 26 05            [ 1]  157 9$: ld a,#'"
      008FC4 A6 06            [ 1]  158 	ld (y),a 
      008FC6 CC 91            [ 1]  159 	incw y  
      008FC8 0F               [ 1]  160 	incw x 
      008FC9 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      001198                        171 var_name::
      008FC9 A6 5C 11         [ 2]  172 		subw x,#vars 
      008FCC 01 26            [ 1]  173 		ld a,#3
      008FCE 16               [ 2]  174 		div x,a 
      008FCF A6               [ 1]  175 		ld a,xl 
      008FD0 04 F7            [ 1]  176 		add a,#'A 
      008FD2 5C               [ 4]  177 		ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                           000003   193 	STR=3
                           000004   194 	VSIZE=4 
      0011A2                        195 decompile::
      0011A2                        196 	_vars VSIZE
      008FD3 91 D6            [ 2]    1     sub sp,#VSIZE 
      008FD5 01 F7 5C         [ 1]  197 	ld a,base
      008FD8 90 93            [ 1]  198 	ld (BASE_SAV,sp),a  
      008FDA 72 5C 00         [ 1]  199 	ld a,tab_width 
      008FDD 02 5F            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      008FDF 97 A6            [ 2]  201 	ldw (STR,sp),y   
      008FE1 04 CC 91 13      [ 5]  202 	ldw x,[basicptr] ; line number 
      008FE5 35 0A 00 0A      [ 1]  203 	mov base,#10
      008FE5 A6 29 11 01      [ 1]  204 	mov tab_width,#5
      008FE9 26 05 A6 07      [ 1]  205 	clr acc24 
      008FED CC 91 0F         [ 2]  206 	ldw acc16,x
      008FF0 4F               [ 1]  207 	clr a ; unsigned conversion 
      008FF0 A6 3A 11         [ 4]  208 	call itoa  
      008FF3 01 26 05         [ 4]  209 	call right_align 
      008FF6 A6               [ 1]  210 	push a 
      008FF7 0A CC            [ 1]  211 1$:	ldw y,x ; source
      008FF9 91 0F            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      008FFB CD 13 A2         [ 4]  213 	call strcpy 
      008FFB A6 2C            [ 1]  214 	clrw y 
      008FFD 11               [ 1]  215 	pop a 
      008FFE 01 26            [ 1]  216 	ld yl,a 
      009000 05 A6 08         [ 2]  217 	addw y,(STR,sp)
      009003 CC 91            [ 1]  218 	ld a,#SPACE 
      009005 0F F7            [ 1]  219 	ld (y),a 
      009006 90 5C            [ 1]  220 	incw y 
      009006 A6 23 11 01      [ 1]  221 	clr tab_width
      00900A 26 05 A6         [ 2]  222 	ldw x,#3
      00900D 09 CC 91         [ 2]  223 	ldw in.w,x 
      0011EA                        224 decomp_loop:
      009010 0F 89            [ 2]  225 	pushw y
      009011 CD 17 CA         [ 4]  226 	call next_token 
      009011 A6 2D            [ 2]  227 	popw y 
      009013 11               [ 1]  228 	tnz a  
      009014 01 26            [ 1]  229 	jrne 1$
      009016 05 A6 11         [ 2]  230 	jp 20$
      009019 CC 91            [ 1]  231 1$:	jrmi 2$
      00901B 0F 12 88         [ 2]  232 	jp 6$
      00901C                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00901C A6 40            [ 1]  234 	cp a,#TK_VAR 
      00901E 11 01            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009020 26 05 A6         [ 4]  237 	call add_space
      009023 05 CC 91         [ 4]  238 	call get_addr   
      009026 0F 11 98         [ 4]  239 	call var_name
      009027 90 F7            [ 1]  240 	ld (y),a 
      009027 A6 3F            [ 1]  241 	incw y  
      009029 11 01            [ 2]  242 	jra decomp_loop
      00120F                        243 3$:
      00902B 26 12            [ 1]  244 	cp a,#TK_INTGR
      00902D A6 80            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00902F F7 5C 90         [ 4]  247 	call get_int24 
      009032 93 AE A0         [ 1]  248 	ld acc24,a 
      009035 A6 90 FF         [ 2]  249 	ldw acc16,x 
      009038 72 A9 00         [ 4]  250 	call add_space
      00903B 02 CC            [ 2]  251 	pushw y 
      00903D 91 13            [ 1]  252 	ld a,#255 ; signed conversion 
      00903F CD 18 4F         [ 4]  253 	call itoa  
      00903F A6 27            [ 2]  254 	ldw y,(1,sp) 
      009041 11               [ 1]  255 	push a 
      009042 01               [ 1]  256 	exgw x,y 
      009043 26 2B A6         [ 4]  257 	call strcpy 
      009046 80 F7            [ 1]  258 	clrw y
      009048 5C               [ 1]  259 	pop a  
      009049 90 AE            [ 1]  260 	ld yl,a 
      00904B A1 EE FF         [ 2]  261 	addw y,(1,sp)
      001235                        262 	_drop 2 
      00904E 1C 00            [ 2]    1     addw sp,#2 
      009050 02 B1            [ 2]  263 	jra decomp_loop
      009051                        264 4$: ; dictionary keyword
      009051 90 AE            [ 1]  265 	cp a,#TK_NOT 
      009053 16 90            [ 1]  266 	jruge 50$ 
      009055 72               [ 2]  267 	ldw x,(x)
      009056 B9 00 01 90      [ 1]  268 	inc in 
      00905A 89 CD 94 22      [ 1]  269 	inc in 
      00905E 72 F2 01         [ 2]  270 	cpw x,#remark 
      009061 90 5C            [ 1]  271 	jrne 5$
      009063 17 01 72         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      009066 FB 01 5B         [ 4]  274 	call add_space
      009069 02 4F            [ 1]  275 	ld a,#''
      00906B 90 93            [ 1]  276 	ld (y),a 
      00906D CC 91            [ 1]  277 	incw y 
      001257                        278 46$:
      00906F 13 D6 00 00      [ 4]  279 	ld a,([in.w],x)
      009070 72 5C 00 01      [ 1]  280 	inc in  
      009070 A6 2B            [ 1]  281 	ld (y),a 
      009072 11 01            [ 1]  282 	incw y 
      009074 26 05 A6         [ 1]  283 	ld a,in 
      009077 10 CC 91         [ 1]  284 	cp a,count 
      00907A 0F EC            [ 1]  285 	jrmi 46$
      00907B CC 13 17         [ 2]  286 	jp 20$  
      00907B A6 2A 11         [ 2]  287 5$: cpw x,#let  
      00907E 01 26            [ 1]  288 	jrne 54$
      009080 05 A6 20         [ 2]  289 	jp decomp_loop ; down display LET
      001276                        290 50$:
      009083 CC               [ 1]  291 	clrw x 
      009084 91               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      001278                        297 54$: ; insert command name 
      009085 0F 11 2A         [ 4]  298 	call add_space  
      009086 90 89            [ 2]  299 	pushw y
      009086 A6 2F 11         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009089 01 26            [ 2]  301 	popw y 
      00908B 05 A6 21         [ 4]  302 	call cpy_cmd_name
      00908E CC 91 0F         [ 2]  303 	jp decomp_loop 
      009091                        304 6$:
                                    305 ; label?
      009091 A6 25            [ 1]  306 	cp a,#TK_LABEL 
      009093 11 01            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      009095 26 05            [ 1]  309 	ld a,#32 
      009097 A6 22            [ 1]  310 	ld (y),a 
      009099 CC 91            [ 1]  311 	incw y 
      001292                        312 61$:
      00909B 0F               [ 2]  313 	pushw x 
      00909C CD 17 E3         [ 4]  314 	call skip_string 
      00909C A6               [ 2]  315 	popw x 
      001297                        316 62$:	
      00909D 3D               [ 1]  317 	ld a,(x)
      00909E 11 01            [ 1]  318 	jreq 63$ 
      0090A0 26               [ 1]  319 	incw x  
      0090A1 05 A6            [ 1]  320 	ld (y),a 
      0090A3 32 CC            [ 1]  321 	incw y 
      0090A5 91 0F            [ 2]  322 	jra 62$ 
      0090A7                        323 63$: 
      0090A7 A6 3E            [ 1]  324 	ld a,#32 
      0090A9 11 01            [ 1]  325 	ld (y),a 
      0090AB 26 23            [ 1]  326 	incw y 
      0090AD A6 31 6B         [ 2]  327 	jp decomp_loop
      0012AA                        328 64$:
      0090B0 02 91            [ 1]  329 	cp a,#TK_QSTR 
      0090B2 D6 01            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0090B4 72 5C 00         [ 4]  332 	call add_space
      0090B7 02 A1 3D         [ 4]  333 	call cpy_quote  
      0090BA 26 04 A6         [ 2]  334 	jp decomp_loop
      0012B7                        335 7$:
      0090BD 33 20            [ 1]  336 	cp a,#TK_CHAR 
      0090BF 4F A1            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      0090C1 3C 26 04         [ 4]  339 	call add_space 
      0090C4 A6 35            [ 1]  340 	ld a,#'\ 
      0090C6 20 47            [ 1]  341 	ld (y),a 
      0090C8 72 5A            [ 1]  342 	incw y
      0090CA 00               [ 1]  343 	ld a,(x)
      0090CB 02 7B 02 20      [ 1]  344 	inc in  
      0090CF 3F 06            [ 2]  345 	jra 81$
      0090D0 A1 0A            [ 1]  346 8$: cp a,#TK_COLON 
      0090D0 A6 3C            [ 1]  347 	jrne 9$
      0090D2 11 01            [ 1]  348 	ld a,#':
      0012D1                        349 81$:
      0090D4 26 23            [ 1]  350 	ld (y),a 
      0090D6 A6 34            [ 1]  351 	incw y 
      0012D5                        352 82$:
      0090D8 6B 02 91         [ 2]  353 	jp decomp_loop
      0012D8                        354 9$: 
      0090DB D6 01            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      0090DD 72 5C            [ 1]  356 	jrugt 10$ 
      0090DF 00 02            [ 1]  357 	sub a,#TK_ARRAY 
      0090E1 A1               [ 1]  358 	clrw x 
      0090E2 3D               [ 1]  359 	ld xl,a
      0090E3 26 04 A6         [ 2]  360 	addw x,#single_char 
      0090E6 36               [ 1]  361 	ld a,(x)
      0090E7 20 26            [ 2]  362 	jra 81$ 
      0012E6                        363 10$: 
      0090E9 A1 3E            [ 1]  364 	cp a,#TK_MINUS 
      0090EB 26 04            [ 1]  365 	jrugt 11$
      0090ED A6 35            [ 1]  366 	sub a,#TK_PLUS 
      0090EF 20               [ 1]  367 	clrw x 
      0090F0 1E               [ 1]  368 	ld xl,a 
      0090F1 72 5A 00         [ 2]  369 	addw x,#add_char 
      0090F4 02               [ 1]  370 	ld a,(x)
      0090F5 7B 02            [ 2]  371 	jra 81$
      0012F4                        372 11$:
      0090F7 20 16            [ 1]  373     cp a,#TK_MOD 
      0090F9 22 0A            [ 1]  374 	jrugt 12$
      0090F9 7B 01            [ 1]  375 	sub a,#TK_MULT
      0090FB CD               [ 1]  376 	clrw x 
      0090FC 8E               [ 1]  377 	ld xl,a 
      0090FD 9C 25 03         [ 2]  378 	addw x,#mul_char
      009100 CC               [ 1]  379 	ld a,(x)
      009101 96 E6            [ 2]  380 	jra 81$
      009103                        381 12$:
      009103 CD 8E            [ 1]  382 	sub a,#TK_GT  
      009105 E2               [ 1]  383 	sll a 
      009106 A3               [ 1]  384 	clrw x 
      009107 A1               [ 1]  385 	ld xl,a 
      009108 EE 26 08         [ 2]  386 	addw x,#relop_str 
      00910B 93               [ 2]  387 	ldw x,(x)
      00910C CC               [ 1]  388 	ld a,(x)
      00910D 90               [ 1]  389 	incw x 
      00910E 51 F7            [ 1]  390 	ld (y),a
      00910F 90 5C            [ 1]  391 	incw y 
      00910F F7               [ 1]  392 	ld a,(x)
      009110 5C 90            [ 1]  393 	jrne 81$
      009112 93 11 EA         [ 2]  394 	jp decomp_loop 
      009113                        395 20$: 
      009113 5B 02            [ 1]  396 	clr (y)
      009115 81 03            [ 2]  397 	ldw x,(STR,sp)
      009116 7B 01            [ 1]  398 	ld a,(BASE_SAV,sp)
      009116 90 89 52         [ 1]  399 	ld base,a 
      009119 02 55            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      00911B 00 1C 00         [ 1]  401 	ld tab_width,a
      00911E 05 72 1A         [ 2]  402 	subw y,(STR,sp) 
      009121 00 23            [ 1]  403 	ld a,yl 
      00132A                        404 	_drop VSIZE 
      009123 A6 00            [ 2]    1     addw sp,#VSIZE 
      009125 AE               [ 4]  405 	ret 
                                    406 
      009126 00 00 CF 16 E0         407 single_char: .byte '@','(',')',',','#'
      00912B C7 16                  408 add_char: .byte '+','-'
      00912D E2 AE 16               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009130 E3 72 5F 00 02 CD 8F   410 relop_str: .word gt,equal,ge,lt,ne,le 
             62 A1 84 26 11
      00913C A3 00                  411 gt: .asciz ">"
      00913E 01 2A                  412 equal: .asciz "="
      009140 05 A6 0A               413 ge: .asciz ">="
      009143 CC 96                  414 lt: .asciz "<"
      009145 E8 CF 16               415 le: .asciz "<="
      009148 E0 90 AE               416 ne:  .asciz "<>"
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
      001352                        429 cmd_name:
      001352                        430 	_vars VSIZE 
      00914B 16 E3            [ 2]    1     sub sp,#VSIZE 
      00914D 90 A3 17 60      [ 1]  431 	clr acc16 
      009151 25 05            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009153 A6 0F CC         [ 2]  433 	ldw x,#kword_dict	
      009156 96 E8            [ 2]  434 1$:	ldw (LINK,sp),x
      009158 E6 02            [ 1]  435 	ld a,(2,x)
      009158 93 CD            [ 1]  436 	and a,#15 
      00915A 8F 62 A1         [ 1]  437 	ld acc8,a 
      00915D 00 26 ED         [ 2]  438 	addw x,#3
      009160 72 A2 16 E0      [ 2]  439 	addw x,acc16
      009164 90               [ 2]  440 	ldw x,(x) ; code address   
      009165 9F AE            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      009167 16 E0            [ 1]  442 	jreq 2$
      009169 CF 00            [ 2]  443 	ldw x,(LINK,sp)
      00916B 1A               [ 2]  444 	ldw x,(x) 
      00916C E7 02 FE         [ 2]  445 	subw x,#2  
      00916F 27 09            [ 1]  446 	jrne 1$
      009171 CD               [ 1]  447 	clr a 
      009172 8D               [ 1]  448 	clrw x 
      009173 49 72            [ 2]  449 	jra 9$
      009175 5F 00            [ 2]  450 2$: ldw x,(LINK,sp)
      009177 04 20 0F         [ 2]  451 	addw x,#2 	
      00917A                        452 9$:	_drop VSIZE
      00917A CE 00            [ 2]    1     addw sp,#VSIZE 
      00917C 1A               [ 4]  453 	ret
                                    454 
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
      000030                         94 dvar_bgn:: .blkw 1 ; DIM variables start address 
      000032                         95 dvar_end:: .blkw 1 ; DIM variables end address 
                                     96 ; 24 bits integer variables 
      000034                         97 vars:: .blkb 3*26 ; BASIC variables A-Z,
                                     98 
                                     99 	.area BTXT (ABS)
      00008C                        100 	.org 0x8C  
                                    101 ; keep 'free_ram' as last variable 
                                    102 ; basic code compiled here. 
      00008C                        103 rsign: .blkw 1 ; "TB" 
      00008E                        104 rsize: .blkw 1 ; code size 	 
      000090                        105 free_ram: ; from here RAM free for BASIC text 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                    106 
                                    107 	.area CODE 
                                    108 
                                    109 
                                    110 ;-------------------------------------
                                    111 ; retrun string length
                                    112 ; input:
                                    113 ;   X         .asciz  pointer 
                                    114 ; output:
                                    115 ;   X         not affected 
                                    116 ;   A         length 
                                    117 ;-------------------------------------
      001386                        118 strlen::
      00917D CF               [ 2]  119 	pushw x 
      00917E 00               [ 1]  120 	clr a
      00917F 05               [ 1]  121 1$:	tnz (x) 
      009180 E6 02            [ 1]  122 	jreq 9$ 
      009182 C7               [ 1]  123 	inc a 
      009183 00               [ 1]  124 	incw x 
      009184 04 35            [ 2]  125 	jra 1$ 
      009186 03               [ 2]  126 9$:	popw x 
      009187 00               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      001391                        137 strcmp:
      009188 02               [ 1]  138 	ld a,(x)
      009189 27 0B            [ 1]  139 	jreq 5$ 
      009189 5B 02            [ 1]  140 	cp a,(y) 
      00918B 72 1B            [ 1]  141 	jrne 4$ 
      00918D 00               [ 1]  142 	incw x 
      00918E 23 90            [ 1]  143 	incw y 
      009190 85 81            [ 2]  144 	jra strcmp 
      009192                        145 4$: ; not same  
      009192 5D               [ 1]  146 	clr a 
      009193 27               [ 4]  147 	ret 
      00139F                        148 5$: ; same 
      009194 14 F6            [ 1]  149 	ld a,#1 
      009196 5C               [ 4]  150 	ret 
                                    151 
                                    152 
                                    153 ;---------------------------------------
                                    154 ;  copy src to dest 
                                    155 ; input:
                                    156 ;   X 		dest 
                                    157 ;   Y 		src 
                                    158 ; output: 
                                    159 ;   X 		dest 
                                    160 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0013A2                        161 strcpy::
      009197 A4               [ 1]  162 	push a 
      009198 0F               [ 2]  163 	pushw x 
      009199 88 0D            [ 1]  164 1$: ld a,(y)
      00919B 01 27            [ 1]  165 	jreq 9$ 
      00919D 0A               [ 1]  166 	ld (x),a 
      00919E F6               [ 1]  167 	incw x 
      00919F 90 F7            [ 1]  168 	incw y 
      0091A1 5C 90            [ 2]  169 	jra 1$ 
      0091A3 5C               [ 1]  170 9$:	clr (x)
      0091A4 0A               [ 2]  171 	popw x 
      0091A5 01               [ 1]  172 	pop a 
      0091A6 26               [ 4]  173 	ret 
                                    174 
                                    175 ;---------------------------------------
                                    176 ; move memory block 
                                    177 ; input:
                                    178 ;   X 		destination 
                                    179 ;   Y 	    source 
                                    180 ;   acc16	bytes count 
                                    181 ; output:
                                    182 ;   none 
                                    183 ;--------------------------------------
                           000001   184 	INCR=1 ; incrament high byte 
                           000002   185 	LB=2 ; increment low byte 
                           000002   186 	VSIZE=2
      0013B2                        187 move::
      0091A7 F6               [ 1]  188 	push a 
      0013B3                        189 	_vars VSIZE 
      0091A8 84 02            [ 2]    1     sub sp,#VSIZE 
      0091A9 0F 01            [ 1]  190 	clr (INCR,sp)
      0091A9 81 02            [ 1]  191 	clr (LB,sp)
      0091AA 90 89            [ 2]  192 	pushw y 
      0091AA 90 5A            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      0091AC 90 F6            [ 2]  194 	popw y 
      0091AE 90 5C            [ 1]  195 	jreq move_exit ; x==y 
      0091B0 A1 29            [ 1]  196 	jrmi move_down
      0013C3                        197 move_up: ; start from top address with incr=-1
      0091B2 27 05 CD 8E      [ 2]  198 	addw x,acc16
      0091B6 B6 24 06 0D      [ 2]  199 	addw y,acc16
      0091B9 03 01            [ 1]  200 	cpl (INCR,sp)
      0091B9 A6 20            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      0091BB 90 F7            [ 2]  202 	jra move_loop  
      0013D1                        203 move_down: ; start from bottom address with incr=1 
      0091BD 90               [ 2]  204     decw x 
      0091BE 5C 81            [ 2]  205 	decw y
      0091C0 0C 02            [ 1]  206 	inc (LB,sp) ; incr=1 
      0013D6                        207 move_loop:	
      0091C0 88 7B 01         [ 1]  208     ld a, acc16 
      0091C3 C1 00 24         [ 1]  209 	or a, acc8
      0091C6 2A 08            [ 1]  210 	jreq move_exit 
      0091C8 A6 20 5A         [ 2]  211 	addw x,(INCR,sp)
      0091CB F7 0C 01         [ 2]  212 	addw y,(INCR,sp) 
      0091CE 20 F1            [ 1]  213 	ld a,(y)
      0091D0 84               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0091D1 81               [ 2]  215 	pushw x 
      0091D2 CE 00 0D         [ 2]  216 	ldw x,acc16 
      0091D2 A6               [ 2]  217 	decw x 
      0091D3 22 90 F7         [ 2]  218 	ldw acc16,x 
      0091D6 90               [ 2]  219 	popw x 
      0091D7 5C 89            [ 2]  220 	jra move_loop
      0013F2                        221 move_exit:
      0013F2                        222 	_drop VSIZE
      0091D9 CD 98            [ 2]    1     addw sp,#VSIZE 
      0091DB 63               [ 1]  223 	pop a 
      0091DC 85               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      0013F6                        233 clear_vars:
      0091DD F6               [ 2]  234 	pushw x 
      0091DE 27               [ 1]  235 	push a  
      0091DF 30 5C A1         [ 2]  236 	ldw x,#vars 
      0091E2 20 25            [ 1]  237 	ld a,#CELL_SIZE*26 
      0091E4 0E               [ 1]  238 1$:	clr (x)
      0091E5 90               [ 1]  239 	incw x 
      0091E6 F7               [ 1]  240 	dec a 
      0091E7 90 5C            [ 1]  241 	jrne 1$
      0091E9 A1               [ 1]  242 	pop a 
      0091EA 5C               [ 2]  243 	popw x 
      0091EB 26               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      0091EC F0 0A 54 69 6E 79 20   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    254 
      0091ED                        255 system_information:
      0091ED 90 F7 90         [ 2]  256 	ldw x,#software 
      0091F0 5C 20 EA         [ 4]  257 	call puts 
      0091F3 88 A6            [ 1]  258 	ld a,#MAJOR 
      0091F5 5C 90 F7         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0091F8 90               [ 1]  260 	clrw x 
      0091F9 5C 84 A0         [ 2]  261 	ldw acc24,x
      0091FC 07 C7 00 0F      [ 1]  262 	clr tab_width  
      009200 72 5F 00 0E      [ 1]  263 	mov base, #10 
      009204 89 AE 8E         [ 4]  264 	call prt_acc24 
      009207 08 72            [ 1]  265 	ld a,#'.
      009209 BB 00 0E         [ 4]  266 	call putc 
      00920C F6 85            [ 1]  267 	ld a,#MINOR 
      00920E 20 DD A6         [ 1]  268 	ld acc8,a 
      009211 22               [ 1]  269 	clrw x 
      009212 90 F7 90         [ 2]  270 	ldw acc24,x 
      009215 5C 5C 81         [ 4]  271 	call prt_acc24
      009218 A6 0D            [ 1]  272 	ld a,#CR 
      009218 1D 00 35         [ 4]  273 	call putc
                                    274 ;call test 
      00921B A6               [ 4]  275 	ret
                                    276 
      00147C                        277 warm_init:
      00921C 03 62 9F AB      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      009220 41 81 00 22      [ 1]  279 	clr flags 
      009222 72 5F 00 1F      [ 1]  280 	clr loop_depth 
      009222 52 04 C6 00      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      009226 0B 6B 01 C6      [ 1]  282 	mov base,#10 
      00922A 00 24 6B         [ 2]  283 	ldw x,#0 
      00922D 02 17 03         [ 2]  284 	ldw basicptr,x 
      009230 72 CE 00         [ 2]  285 	ldw in.w,x 
      009233 05 35 0A 00      [ 1]  286 	clr count
      009237 0B               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      00149E                        293 clear_basic:
      009238 35               [ 2]  294 	pushw x 
      009239 05 00 24 72      [ 1]  295 	clr count
      00923D 5F 00 0D CF      [ 1]  296 	clr in  
      009241 00 0E 4F         [ 2]  297 	ldw x,#free_ram 
      009244 CD 98 CF         [ 2]  298 	ldw txtbgn,x 
      009247 CD 91 C0         [ 2]  299 	ldw txtend,x 
      00924A 88 90 93         [ 2]  300 	ldw dvar_bgn,x 
      00924D 1E 04 CD         [ 2]  301 	ldw dvar_end,x 
      009250 94 22 90         [ 4]  302 	call clear_vars 
      009253 5F               [ 2]  303 	popw x
      009254 84               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014BB                        309 err_msg:
      009255 90 97 72 F9 03 A6 20   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             90 F7 90 5C 72
      009261 5F 00 24 AE 00 03 CF   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             00 01 8A
      00926A 15 96 15 C9 15 D9 15   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



             ED 16 00
      00926A 90 89 CD 98            313 	.word err_overflow,err_read_only  
                                    314 
      00926E 4A 90 85 4D 26 03 CC   315 err_mem_full: .asciz "Memory full\n" 
             93 97 2B 03 CC 93
      00927B 08 79 6E 74 61 78 20   316 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      00927C 6D 61 74 68 20 6F 70   317 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00927C A1 85 26 0F CD 91 AA   318 err_div0: .asciz "division by 0\n" 
             CD 98 72 CD 92 18 90
             F7
      00928B 90 5C 20 DB 6C 69 64   319 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00928F 72 75 6E 20 74 69 6D   320 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00928F A1 84 26 26 CD 98 7C   321 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 AA 90 89 A6 FF CD
             98 CF 16 01 88
      0092A9 51 CD 94 22 90 5F 84   322 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      0092B9 46 69 6C 65 20 6E 6F   323 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0092B9 A1 87 24 39 FE 72 5C   324 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      0092C5 02 A3 A1 EE 26 23 CE   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 AA A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092D7 4E 6F 20 64 61 74 61   326 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092D7 72 D6 00 01 72 5C 00   327 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      0092EB CC 93 97 A3 9D 2E 26   328 err_no_fspace: .asciz "File system full.\n" 
             05 CC 92 6A 20 66 75
             6C 6C 2E 0A 00
      0092F6 42 75 66 66 65 72 20   329 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      0092F6 5F 97 65 72 66 6C 6F   330 err_overflow: .asciz "overflow\n" 
             77 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0092F8 63 6F 6E 73 74 61 6E   331 err_read_only: .asciz "constant can't be modified\n"
             74 20 63 61 6E 27 74
             20 62 65 20 6D 6F 64
             69 66 69 65 64 0A 00
                                    332 
      0092F8 CD 91 AA 90 89 CD 93   333 rt_msg: .asciz "\nrun time error, "
             D2 90 85 CD 91 92 CC
             92 6A 20 00
      009308 0A 63 6F 6D 70 69 6C   334 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      009308 A1 03 26 1E A6 20 90   335 tk_id: .asciz "last token id: "
             F7 90 5C 20 69 64 3A
             20 00
                                    336 
      009312                        337 syntax_error::
      009312 89 CD            [ 1]  338 	ld a,#ERR_SYNTAX 
                                    339 
      001668                        340 tb_error::
      009314 98 63 85 22 4C   [ 2]  341 	btjt flags,#FCOMP,1$
      009317 88               [ 1]  342 	push a 
      009317 F6 27 07         [ 2]  343 	ldw x, #rt_msg 
      00931A 5C 90 F7         [ 4]  344 	call puts 
      00931D 90               [ 1]  345 	pop a 
      00931E 5C 20 F6         [ 2]  346 	ldw x, #err_msg 
      009321 72 5F 00 0D      [ 1]  347 	clr acc16 
      009321 A6               [ 1]  348 	sll a
      009322 20 90 F7 90      [ 1]  349 	rlc acc16  
      009326 5C CC 92         [ 1]  350 	ld acc8, a 
      009329 6A BB 00 0D      [ 2]  351 	addw x,acc16 
      00932A FE               [ 2]  352 	ldw x,(x)
      00932A A1 02 26         [ 4]  353 	call puts
      00932D 09 CD 91         [ 2]  354 	ldw x,basicptr 
                           000001   355 .if DEBUG 
      009330 AA CD 91         [ 1]  356 ld a,count 
      009333 D2 CC            [ 1]  357 clrw y 
      009335 92 6A            [ 1]  358 rlwa y  
      009337 CD 06 67         [ 4]  359 call hex_dump
      009337 A1 04 26         [ 2]  360 ldw x,basicptr
                                    361 .endif 
      00933A 10 CD 91         [ 1]  362 	ld a,in 
      00933D AA A6 5C         [ 4]  363 	call prt_basic_line
      009340 90 F7 90         [ 2]  364 	ldw x,#tk_id 
      009343 5C F6 72         [ 4]  365 	call puts 
      009346 5C 00 02         [ 1]  366 	ld a,in.saved 
      009349 20               [ 1]  367 	clrw x 
      00934A 06               [ 1]  368 	ld xl,a 
      00934B A1 0A 26 09      [ 2]  369 	addw x,basicptr 
      00934F A6               [ 1]  370 	ld a,(x)
      009350 3A               [ 1]  371 	clrw x 
      009351 97               [ 1]  372 	ld xl,a 
      009351 90 F7 90         [ 4]  373 	call prt_i16
      009354 5C 35            [ 2]  374 	jra 6$
      009355                        375 1$:	
      009355 CC               [ 1]  376 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009356 92 6A 45         [ 2]  377 	ldw x,#comp_msg
      009358 CD 09 68         [ 4]  378 	call puts 
      009358 A1               [ 1]  379 	pop a 
      009359 09 22 0A         [ 2]  380 	ldw x, #err_msg 
      00935C A0 05 5F 97      [ 1]  381 	clr acc16 
      009360 1C               [ 1]  382 	sll a
      009361 93 AD F6 20      [ 1]  383 	rlc acc16  
      009365 EB 00 0E         [ 1]  384 	ld acc8, a 
      009366 72 BB 00 0D      [ 2]  385 	addw x,acc16 
      009366 A1               [ 2]  386 	ldw x,(x)
      009367 11 22 0A         [ 4]  387 	call puts
      00936A A0 10 5F         [ 2]  388 	ldw x,#tib
      00936D 97 1C 93         [ 4]  389 	call puts 
      009370 B2 F6            [ 1]  390 	ld a,#CR 
      009372 20 DD 0B         [ 4]  391 	call putc
      009374 CE 00 00         [ 2]  392 	ldw x,in.w
      009374 A1 22 22         [ 4]  393 	call spaces
      009377 0A A0            [ 1]  394 	ld a,#'^
      009379 20 5F 97         [ 4]  395 	call putc 
      00937C 1C 93 B4         [ 2]  396 6$: ldw x,#STACK_EMPTY 
      00937F F6               [ 1]  397     ldw sp,x
                                    398 
      0016F2                        399 warm_start:
      009380 20 CF 7C         [ 4]  400 	call warm_init
                                    401 ;----------------------------
                                    402 ;   BASIC interpreter
                                    403 ;----------------------------
      009382                        404 cmd_line: ; user interface 
      009382 A0 31            [ 1]  405 	ld a,#CR 
      009384 48 5F 97         [ 4]  406 	call putc 
      009387 1C 93            [ 1]  407 	ld a,#'> 
      009389 B7 FE F6         [ 4]  408 	call putc
      00938C 5C 90 F7         [ 4]  409 	call readln
      00938F 90 5C F6 26      [ 1]  410 	tnz count 
      009393 BD CC            [ 1]  411 	jreq cmd_line
      009395 92 6A 96         [ 4]  412 	call compile
                                    413 ;;;;;;;;;;;;;;;;;;;;;;	
                                    414 ;pushw y 
                                    415 ;ldw x,txtbgn  
                                    416 ;ldw y,txtend
                                    417 ;ldw acc16,x   
                                    418 ;subw y,acc16 
                                    419 ;call hex_dump
                                    420 ;popw y 
                                    421 ;;;;;;;;;;;;;;;;;;;;;;
                                    422 
                                    423 ; if text begin with a line number
                                    424 ; the compiler set count to zero    
                                    425 ; so code is not interpreted
      009397 72 5D 00 03      [ 1]  426 	tnz count 
      009397 90 7F            [ 1]  427 	jreq cmd_line
                                    428 	
                                    429 ; if direct command 
                                    430 ; it's ready to interpret 
                                    431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    432 ;; This is the interpreter loop
                                    433 ;; for each BASIC code line. 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001711                        435 interpreter: 
      009399 1E 03 7B         [ 1]  436 	ld a,in 
      00939C 01 C7 00         [ 1]  437 	cp a,count 
      00939F 0B 7B            [ 1]  438 	jrmi interp_loop
      001719                        439 next_line:
      0093A1 02 C7 00 24 72   [ 2]  440 	btjf flags, #FRUN, cmd_line
      0093A6 F2 03 90         [ 2]  441 	ldw x,basicptr
      0093A9 9F 5B 04 81      [ 2]  442 	addw x,in.w 
      0093AD 40 28 29         [ 2]  443 	cpw x,txtend 
      0093B0 2C 23            [ 1]  444 	jrpl warm_start
      0093B2 2B 2D 2A         [ 2]  445 	ldw basicptr,x ; start of next line  
      0093B5 2F 25            [ 1]  446 	ld a,(2,x)
      0093B7 93 C3 93         [ 1]  447 	ld count,a 
      0093BA C5 93 C7 93      [ 1]  448 	mov in,#3 ; skip first 3 bytes of line 
      001736                        449 interp_loop:
      0093BE CA 93 CF         [ 4]  450 	call next_token
      0093C1 93 CC            [ 1]  451 	cp a,#TK_NONE 
      0093C3 3E 00            [ 1]  452 	jreq next_line 
      0093C5 3D 00            [ 1]  453 	cp a,#TK_CMD
      0093C7 3E 3D            [ 1]  454 	jrne 1$
      001741                        455 	_get_code_addr
      0093C9 00               [ 2]    1         ldw x,(x)
      0093CA 3C 00 3C 3D      [ 1]    2         inc in 
      0093CE 00 3C 3E 00      [ 1]    3         inc in 
      0093D2 FD               [ 4]  456 	call(x)
      0093D2 52 04            [ 2]  457 	jra interp_loop 
      00174D                        458 1$:	 
      0093D4 72 5F            [ 1]  459 	cp a,#TK_VAR
      0093D6 00 0E            [ 1]  460 	jrne 2$
      0093D8 1F 01 AE         [ 4]  461 	call let_var  
      0093DB B4 CD            [ 2]  462 	jra interp_loop 
      001756                        463 2$:	
      0093DD 1F 03            [ 1]  464 	cp a,#TK_ARRAY 
      0093DF E6 02            [ 1]  465 	jrne 3$
      0093E1 A4 0F C7         [ 4]  466 	call let_array 
      0093E4 00 0F            [ 2]  467 	jra interp_loop
      00175F                        468 3$:	
      0093E6 1C 00            [ 1]  469 	cp a,#TK_LABEL
      0093E8 03 72            [ 1]  470 	jrne 4$
      0093EA BB 00 0E         [ 4]  471 	call let_dvar  
      0093ED FE 13            [ 2]  472 	jra interp_loop 
      001768                        473 4$: 
      0093EF 01 27            [ 1]  474 	cp a,#TK_COLON 
      0093F1 0C 1E            [ 1]  475 	jreq interp_loop
      0093F3 03 FE 1D         [ 2]  476 5$:	jp syntax_error 
                                    477 
                                    478 
                                    479 ;----------------------
                                    480 ; when a label is met 
                                    481 ; at interp_loop
                                    482 ; it may be a variable 
                                    483 ; assignement to DIM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    484 ; variable 
                                    485 ;----------------------
                           000001   486 	VAR_NAME=1 
                           000003   487 	REC_LEN=3
                           000004   488 	VSIZE=4 
      00176F                        489 let_dvar:
      00176F                        490 	_vars VSIZE 
      0093F6 00 02            [ 2]    1     sub sp,#VSIZE 
      0093F8 26 E3            [ 2]  491 	ldw (VAR_NAME,sp),x
      0093FA 4F 5F            [ 1]  492 	clr (REC_LEN,sp) 
      0093FC 20 05 1E         [ 4]  493 	call skip_string 
      0093FF 03 1C 00         [ 2]  494 	ldw x,basicptr 
      009402 02 5B 04 81      [ 2]  495 	addw x,in.w 
      000001 F6               [ 1]  496 	ld a,(x)
      000002 A1 32            [ 1]  497 	cp a,#TK_EQUAL 
      000003 26 43            [ 1]  498 	jrne 9$ 
                                    499 ; dvar assignment 
      000004 72 5C 00 01      [ 1]  500 	inc in  
      000005 CD 1B EF         [ 4]  501 	call condition  
      000007 A1 84            [ 1]  502 	cp a,#TK_INTGR 
      000009 27 03            [ 1]  503 	jreq 1$ 
      00000A CC 16 66         [ 2]  504 0$:	jp syntax_error 
      00000B                        505 1$: 
      00000C 1E 01            [ 2]  506 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      00000D CD 13 86         [ 4]  507 	call strlen 
      00000E AB 05            [ 1]  508 	add a,#REC_XTRA_BYTES
      00000F 6B 04            [ 1]  509 	ld (REC_LEN+1,sp),a 
      000010 CD 1D 97         [ 4]  510 	call search_name 
      000013 5D               [ 2]  511 	tnzw x 
      000015 27 EE            [ 1]  512 	jreq 0$ 
      000017 F6               [ 1]  513 	ld a,(x)
      000019 2A 05            [ 1]  514 	jrpl 2$
      00001A A6 11            [ 1]  515 	ld a,#ERR_RD_ONLY 
      00001B CC 16 68         [ 2]  516 	jp tb_error 
      00001C                        517 2$:
      00001E 72 FB 03         [ 2]  518 	addw x,(REC_LEN,sp)
      000020 1D 00 03         [ 2]  519 	subw x,#CELL_SIZE 
      000021 CF 00 19         [ 2]  520 	ldw ptr16,x
      000023                        521 	_xpop 
      000024 90 F6            [ 1]    1     ld a,(y)
      000025 93               [ 1]    2     ldw x,y 
      000027 EE 01            [ 2]    3     ldw x,(1,x)
      00002F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      000030 72 C7 00 19      [ 4]  522 	ld [ptr16],a 
      000031 72 5C 00 1A      [ 1]  523 	inc ptr8 
      000033 72 CF 00 19      [ 5]  524 	ldw [ptr16],x 
      000035                        525 9$: _drop VSIZE 	
      00008C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00008C 81               [ 4]  526 	ret 
                                    527 
                                    528 
                                    529 ;--------------------------
                                    530 ; extract next token from
                                    531 ; token list 
                                    532 ; basicptr -> base address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    533 ; in  -> offset in list array 
                                    534 ; output:
                                    535 ;   A 		token attribute
                                    536 ;   X 		*token_value 
                                    537 ;----------------------------------------
      00008E                        538 next_token::
                                    539 ;	clrw x 
      000090 C6 00 01         [ 1]  540 	ld a,in 
      009406 C7 00 02         [ 1]  541 	ld in.saved,a ; in case "_unget_token" needed 
                                    542 ; don't replace sub by "cp a,count" 
                                    543 ; if end of line must return with A=0   	
      009406 89 4F 7D         [ 1]  544 	sub a,count 
      009409 27 04            [ 1]  545 	jreq 9$ ; end of line 
      0017D5                        546 0$: 
      00940B 4C 5C 20         [ 2]  547 	ldw x,basicptr 
      00940E F9 85 81 00      [ 2]  548 	addw x,in.w 
      009411 F6               [ 1]  549 	ld a,(x)
      009411 F6               [ 1]  550 	incw x
      009412 27 0B 90 F1      [ 1]  551 	inc in   
      009416 26               [ 4]  552 9$: ret 
                                    553 
                                    554 ;-------------------------
                                    555 ;  skip .asciz in BASIC line 
                                    556 ;  name 
                                    557 ;  input:
                                    558 ;     x		* string 
                                    559 ;  output:
                                    560 ;     none 
                                    561 ;-------------------------
      0017E3                        562 skip_string:
      009417 05               [ 1]  563 	ld a,(x)
      009418 5C 90            [ 1]  564 	jreq 1$
      00941A 5C               [ 1]  565 	incw x 
      00941B 20 F4            [ 2]  566 	jra skip_string 
      00941D 5C               [ 1]  567 1$: incw x 	
      00941D 4F 81 00 04      [ 2]  568 	subw x,basicptr 
      00941F CF 00 00         [ 2]  569 	ldw in.w,x 
      00941F A6               [ 4]  570 	ret 
                                    571 
                                    572 ;---------------------
                                    573 ; extract 16 bits  
                                    574 ; address from BASIC
                                    575 ; code 
                                    576 ; input:
                                    577 ;    X    *address
                                    578 ; output:
                                    579 ;    X    address 
                                    580 ;-------------------- 
      0017F2                        581 get_addr:
      009420 01               [ 2]  582 	ldw x,(x)
      009421 81 5C 00 01      [ 1]  583 	inc in 
      009422 72 5C 00 01      [ 1]  584 	inc in 
      009422 88               [ 4]  585 	ret 
                                    586 
                                    587 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    588 ; extract int24_t  
                                    589 ; value from BASIC 
                                    590 ; code 
                                    591 ; input:
                                    592 ;    X   *integer 
                                    593 ; output:
                                    594 ;    A:X   int24  
                                    595 ;--------------------
      0017FC                        596 get_int24:
      009423 89               [ 1]  597 	ld a,(x)
      009424 90 F6            [ 2]  598 	ldw x,(1,x)
                                    599 ; skip 3 bytes 
      009426 27 06 F7 5C      [ 1]  600 	inc in 
      00942A 90 5C 20 F6      [ 1]  601 	inc in 
      00942E 7F 85 84 81      [ 1]  602 	inc in 
      009432 81               [ 4]  603 	ret 
                                    604 
                                    605 ;-------------------------
                                    606 ; get character from 
                                    607 ; BASIC code 
                                    608 ; input:
                                    609 ;    X   *char 
                                    610 ; output:
                                    611 ;    A    char 
                                    612 ;-------------------------
      00180C                        613 get_char:
      009432 88               [ 1]  614 	ld a,(x)
      009433 52 02 0F 01      [ 1]  615 	inc in  
      009437 0F               [ 4]  616     ret 
                                    617 
                                    618 ;-----------------------------------
                                    619 ; print a 16 bit integer 
                                    620 ; using variable 'base' as conversion
                                    621 ; format.
                                    622 ; input:
                                    623 ;    X       integer to print 
                                    624 ;   'base'    conversion base 
                                    625 ; output:
                                    626 ;   terminal  
                                    627 ;-----------------------------------
      001812                        628 prt_i16:
      009438 02 90 89 13      [ 1]  629 	clr acc24 
      00943C 01 90 85         [ 2]  630 	ldw acc16,x 
      00943F 27 31            [ 1]  631 	ld a,#16
      009441 2B 0E 0A         [ 1]  632 	cp a,base
      009443 27 09            [ 1]  633 	jreq prt_acc24  
      009443 72 BB 00 0E 72   [ 2]  634 	btjf acc16,#7,prt_acc24
      009448 B9 00 0E 03      [ 1]  635 	cpl acc24 ; sign extend 
                                    636 	
                                    637 ;------------------------------------
                                    638 ; print integer in acc24 
                                    639 ; input:
                                    640 ;	acc24 		integer to print 
                                    641 ;	'base' 		numerical base for conversion 
                                    642 ;   'tab_width' field width 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    643 ;    A 			signed||unsigned conversion
                                    644 ;  output:
                                    645 ;    A          string length
                                    646 ;------------------------------------
      001829                        647 prt_acc24:
      00944C 01 03            [ 1]  648 	ld a,#255  ; signed conversion  
      00944E 02 20 05         [ 4]  649     call itoa  ; conversion entier en  .asciz
      009451 CD 11 40         [ 4]  650 	call right_align  
      009451 5A               [ 1]  651 	push a 
      009452 90 5A 0C         [ 4]  652 	call puts
      009455 02               [ 1]  653 	pop a 
      009456 81               [ 4]  654     ret	
                                    655 
                                    656 ;---------------------------------------
                                    657 ;  print value at xstack top 
                                    658 ;---------------------------------------
      001837                        659 print_top: 
      001837                        660 	_xpop 
      009456 C6 00            [ 1]    1     ld a,(y)
      009458 0E               [ 1]    2     ldw x,y 
      009459 CA 00            [ 2]    3     ldw x,(1,x)
      00945B 0F 27 14 72      [ 2]    4     addw y,#CELL_SIZE 
      00945F FB 01 72         [ 1]  661 	ld acc24,a 
      009462 F9 01 90         [ 2]  662 	ldw acc16,x 
      009465 F6 F7 89         [ 4]  663 	call prt_acc24 
      009468 CE 00            [ 1]  664 	ld a,#SPACE
      00946A 0E 5A CF         [ 4]  665 	call putc 
      00946D 00               [ 4]  666 	ret 
                                    667 
                                    668 ;------------------------------------
                                    669 ; convert integer in acc24 to string
                                    670 ; input:
                                    671 ;   'base'	conversion base 
                                    672 ;	acc24	integer to convert
                                    673 ;   A       0=unsigned, else signed 
                                    674 ; output:
                                    675 ;   X  		pointer to first char of string
                                    676 ;   A       string length
                                    677 ;------------------------------------
                           000001   678 	SIGN=1  ; integer sign 
                           000002   679 	LEN=2 
                           000003   680 	PSTR=3
                           000004   681 	VSIZE=4 ;locals size
      00184F                        682 itoa::
      00184F                        683 	_vars VSIZE
      00946E 0E 85            [ 2]    1     sub sp,#VSIZE 
      009470 20 E4            [ 1]  684 	clr (LEN,sp) ; string length  
      009472 0F 01            [ 1]  685 	clr (SIGN,sp)    ; sign
      009472 5B               [ 1]  686 	tnz A
      009473 02 84            [ 1]  687 	jreq 1$ ; unsigned conversion  
      009475 81 00 0A         [ 1]  688 	ld a,base 
      009476 A1 0A            [ 1]  689 	cp a,#10
      009476 89 88            [ 1]  690 	jrne 1$
                                    691 	; base 10 string display with negative sign if bit 23==1
      009478 AE 00 35 A6 4E   [ 2]  692 	btjf acc24,#7,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00947D 7F 5C            [ 1]  693 	cpl (SIGN,sp)
      00947F 4A 26 FB         [ 4]  694 	call neg_acc24
      001869                        695 1$:
                                    696 ; initialize string pointer 
      009482 84 85 81         [ 2]  697 	ldw x,#tib 
      009485 0A 0A 54         [ 2]  698 	addw x,#TIB_SIZE
      009488 69               [ 2]  699 	decw x 
      009489 6E               [ 1]  700 	clr (x)
      001871                        701 itoa_loop:
      00948A 79 20 42         [ 1]  702     ld a,base
                                    703 ;	ldw (PSTR,sp),x 
      00948D 41 53 49         [ 4]  704     call divu24_8 ; acc24/A 
                                    705 ;	ldw x,(PSTR,sp)
      009490 43 20            [ 1]  706     add a,#'0  ; remainder of division
      009492 66 6F            [ 1]  707     cp a,#'9+1
      009494 72 20            [ 1]  708     jrmi 2$
      009496 53 54            [ 1]  709     add a,#7 
      00187F                        710 2$:	
      009498 4D               [ 2]  711 	decw x
      009499 38               [ 1]  712     ld (x),a
      00949A 0A 43            [ 1]  713 	inc (LEN,sp)
                                    714 	; if acc24==0 conversion done
      00949C 6F 70 79         [ 1]  715 	ld a,acc24
      00949F 72 69 67         [ 1]  716 	or a,acc16
      0094A2 68 74 2C         [ 1]  717 	or a,acc8
      0094A5 20 4A            [ 1]  718     jrne itoa_loop
                                    719 	;conversion done, next add '$' or '-' as required
      0094A7 61 63 71         [ 1]  720 	ld a,base 
      0094AA 75 65            [ 1]  721 	cp a,#16
      0094AC 73 20            [ 1]  722 	jreq 8$
      0094AE 44 65            [ 1]  723 	ld a,(SIGN,sp)
      0094B0 73 63            [ 1]  724     jreq 10$
      0094B2 68 65            [ 1]  725     ld a,#'-
      0094B4 6E 65            [ 2]  726 	jra 9$ 
      00189D                        727 8$:	
      0094B6 73 20            [ 1]  728 	ld a,#'$ 
      0094B8 32               [ 2]  729 9$: decw x
      0094B9 30               [ 1]  730     ld (x),a
      0094BA 31 39            [ 1]  731 	inc (LEN,sp)
      0018A3                        732 10$:
      0094BC 2C 32            [ 1]  733 	ld a,(LEN,sp)
      0018A5                        734 	_drop VSIZE
      0094BE 30 32            [ 2]    1     addw sp,#VSIZE 
      0094C0 32               [ 4]  735 	ret
                                    736 
                                    737 ;------------------------------------
                                    738 ; convert alpha to uppercase
                                    739 ; input:
                                    740 ;    a  character to convert
                                    741 ; output:
                                    742 ;    a  uppercase character
                                    743 ;------------------------------------
      0018A8                        744 to_upper::
      0094C1 0A 76            [ 1]  745 	cp a,#'a
      0094C3 65 72            [ 1]  746 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0094C5 73               [ 4]  747 0$:	ret
      0094C6 69 6F            [ 1]  748 1$: cp a,#'z	
      0094C8 6E 20            [ 1]  749 	jrugt 0$
      0094CA 00 20            [ 1]  750 	sub a,#32
      0094CB 81               [ 4]  751 	ret
                                    752 	
                                    753 ;------------------------------------
                                    754 ; convert pad content in integer
                                    755 ; input:
                                    756 ;    x		* .asciz to convert
                                    757 ; output:
                                    758 ;    acc24      int24_t
                                    759 ;------------------------------------
                                    760 	; local variables
                           000001   761 	SIGN=1 ; 1 byte, 
                           000002   762 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   763 	TEMP=3 ; 1 byte, temporary storage
                           000004   764 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   765 	VSIZE=5 ; 5 bytes reserved for local storage
      0018B4                        766 atoi24::
      0018B4                        767 	_vars VSIZE
      0094CB AE 94            [ 2]    1     sub sp,#VSIZE 
      0094CD 85 CD            [ 2]  768 	ldw (XTEMP,sp),x 
                                    769 ; conversion made on xstack 
      0094CF 89               [ 1]  770 	clr a 
      0094D0 E8               [ 1]  771 	clrw x 
      0018BA                        772 	_xpush 
      0094D1 A6 02 C7 00      [ 2]    1     subw y,#CELL_SIZE
      0094D5 0F 5F            [ 1]    2     ld (y),a 
      0094D7 CF 00 0D         [ 2]    3     ldw (1,y),x 
      0094DA 72 5F            [ 1]  773 	clr (SIGN,sp)
      0094DC 00 24            [ 1]  774 	ld a,#10
      0094DE 35 0A            [ 1]  775 	ld (BASE,sp),a ; default base decimal
      0094E0 00 0B            [ 2]  776 	ldw x,(XTEMP,sp)
      0094E2 CD               [ 1]  777 	ld a,(x)
      0094E3 98 A9            [ 1]  778 	jreq 9$  ; completed if 0
      0094E5 A6 2E            [ 1]  779 	cp a,#'-
      0094E7 CD 89            [ 1]  780 	jrne 1$
      0094E9 8B A6            [ 1]  781 	cpl (SIGN,sp)
      0094EB 00 C7            [ 2]  782 	jra 2$
      0094ED 00 0F            [ 1]  783 1$: cp a,#'$
      0094EF 5F CF            [ 1]  784 	jrne 3$
      0094F1 00 0D            [ 1]  785 	ld a,#16
      0094F3 CD 98            [ 1]  786 	ld (BASE,sp),a
      0094F5 A9               [ 1]  787 2$:	incw x
      0094F6 A6 0D            [ 2]  788 	ldw (XTEMP,sp),x 
      0094F8 CD               [ 1]  789 	ld a,(x)
      0018E2                        790 3$:	; char to digit 
      0094F9 89 8B            [ 1]  791 	cp a,#'a
      0094FB 81 02            [ 1]  792 	jrmi 4$
      0094FC A0 20            [ 1]  793 	sub a,#32
      0094FC 90 AE            [ 1]  794 4$:	cp a,#'0
      0094FE 17 73            [ 1]  795 	jrmi 9$
      009500 72 5F            [ 1]  796 	sub a,#'0
      009502 00 23            [ 1]  797 	cp a,#10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009504 72 5F            [ 1]  798 	jrmi 5$
      009506 00 20            [ 1]  799 	sub a,#7
      009508 35 04            [ 1]  800 	cp a,(BASE,sp)
      00950A 00 24            [ 1]  801 	jrpl 9$
      00950C 35 0A            [ 1]  802 5$:	ld (TEMP,sp),a
      00950E 00 0B            [ 1]  803 	ld a,(BASE,sp)
      009510 AE 00 00         [ 4]  804 	call mulu24_8
      0018FF                        805 	_xpush 
      009513 CF 00 05 CF      [ 2]    1     subw y,#CELL_SIZE
      009517 00 01            [ 1]    2     ld (y),a 
      009519 72 5F 00         [ 2]    3     ldw (1,y),x 
      00951C 04               [ 1]  806 	clrw x 
      00951D 81 03            [ 1]  807 	ld a,(TEMP,sp)
      00951E 02               [ 1]  808 	rlwa x 
      00190C                        809 	_xpush 
      00951E 89 72 5F 00      [ 2]    1     subw y,#CELL_SIZE
      009522 04 72            [ 1]    2     ld (y),a 
      009524 5F 00 02         [ 2]    3     ldw (1,y),x 
      009527 AE 00 90         [ 4]  810 	call add24 
      00952A CF 00            [ 2]  811 	ldw x,(XTEMP,sp)
      00952C 1C CF            [ 2]  812 	jra 2$
      00952E 00 1E            [ 1]  813 9$:	tnz (SIGN,sp)
      009530 CF 00            [ 1]  814     jreq atoi_exit
      009532 31 CF 00         [ 4]  815     call neg24
      001923                        816 atoi_exit:
      001923                        817 	_xpop 
      009535 33 CD            [ 1]    1     ld a,(y)
      009537 94               [ 1]    2     ldw x,y 
      009538 76 85            [ 2]    3     ldw x,(1,x)
      00953A 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00953B C7 00 0C         [ 1]  818 	ld acc24,a 
      00953B 00 00 95         [ 2]  819 	ldw acc16,x  
      001932                        820 	_drop VSIZE
      00953E 5F 95            [ 2]    1     addw sp,#VSIZE 
      009540 6C               [ 4]  821 	ret
                                    822 
                                    823 
                                    824 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    825 ;;   TINY BASIC  operators,
                                    826 ;;   commands and functions 
                                    827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    828 
                                    829 ;---------------------------------
                                    830 ; dictionary search 
                                    831 ; input:
                                    832 ;	X 		dictionary entry point, name field  
                                    833 ;   y		.asciz name to search 
                                    834 ; output:
                                    835 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    836 ;  X		routine address|TK_OP 
                                    837 ;---------------------------------
                           000001   838 	NLEN=1 ; cmd length 
                           000002   839 	XSAVE=2
                           000004   840 	YSAVE=4
                           000005   841 	VSIZE=5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      001935                        842 search_dict::
      001935                        843 	_vars VSIZE 
      009541 95 7A            [ 2]    1     sub sp,#VSIZE 
      009543 95 93            [ 2]  844 	ldw (YSAVE,sp),y 
      001939                        845 search_next:
      009545 95 A2            [ 2]  846 	ldw (XSAVE,sp),x 
                                    847 ; get name length in dictionary	
      009547 95               [ 1]  848 	ld a,(x)
      009548 B8 95            [ 1]  849 	and a,#0xf 
      00954A CE 95            [ 1]  850 	ld (NLEN,sp),a  
      00954C E8 95            [ 2]  851 	ldw y,(YSAVE,sp) ; name pointer 
      00954E F9               [ 1]  852 	incw x 
      001943                        853 cp_loop:
      00954F 96 0A            [ 1]  854 	ld a,(y)
      009551 96 16            [ 1]  855 	jreq str_match 
      009553 96 49            [ 1]  856 	tnz (NLEN,sp)
      009555 96 59            [ 1]  857 	jreq no_match  
      009557 96               [ 1]  858 	cp a,(x)
      009558 6D 96            [ 1]  859 	jrne no_match 
      00955A 80 96            [ 1]  860 	incw y 
      00955C 8D               [ 1]  861 	incw x
      00955D 96 97            [ 1]  862 	dec (NLEN,sp)
      00955F 4D 65            [ 2]  863 	jra cp_loop 
      001955                        864 no_match:
      009561 6D 6F            [ 2]  865 	ldw x,(XSAVE,sp) 
      009563 72 79 20         [ 2]  866 	subw x,#2 ; move X to link field
      009566 66 75            [ 1]  867 	push #TK_NONE 
      009568 6C               [ 2]  868 	ldw x,(x) ; next word link 
      009569 6C               [ 1]  869 	pop a ; TK_NONE 
      00956A 0A 00            [ 1]  870 	jreq search_exit  ; not found  
                                    871 ;try next 
      00956C 73 79            [ 2]  872 	jra search_next
      001962                        873 str_match:
      00956E 6E 74            [ 2]  874 	ldw x,(XSAVE,sp)
      009570 61               [ 1]  875 	ld a,(X)
      009571 78 20            [ 1]  876 	ld (NLEN,sp),a ; needed to test keyword type  
      009573 65 72            [ 1]  877 	and a,#NLEN_MASK 
                                    878 ; move x to procedure address field 	
      009575 72               [ 1]  879 	inc a 
      009576 6F 72 0A         [ 1]  880 	ld acc8,a 
      009579 00 6D 61 74      [ 1]  881 	clr acc16 
      00957D 68 20 6F 70      [ 2]  882 	addw x,acc16 
      009581 65               [ 2]  883 	ldw x,(x) ; routine address  
                                    884 ;determine keyword type bits 7:4 
      009582 72 61            [ 1]  885 	ld a,(NLEN,sp)
      009584 74 69            [ 1]  886 	and a,#KW_TYPE_MASK 
      009586 6F               [ 1]  887 	swap a 
      009587 6E 20            [ 1]  888 	add a,#128
      00197D                        889 search_exit: 
      00197D                        890 	_drop VSIZE 
      009589 6F 76            [ 2]    1     addw sp,#VSIZE 
      00958B 65               [ 4]  891 	ret 
                                    892 
                                    893 ;---------------------
                                    894 ; check if next token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    895 ;  is of expected type 
                                    896 ; input:
                                    897 ;   A 		 expected token attribute
                                    898 ;  ouput:
                                    899 ;   none     if fail call syntax_error 
                                    900 ;--------------------
      001980                        901 expect:
      00958C 72               [ 1]  902 	push a 
      00958D 66 6C 6F         [ 4]  903 	call next_token 
      009590 77 0A            [ 1]  904 	cp a,(1,sp)
      009592 00 64            [ 1]  905 	jreq 1$
      009594 69 76 69         [ 2]  906 	jp syntax_error
      009597 73               [ 1]  907 1$: pop a 
      009598 69               [ 4]  908 	ret 
                                    909 
                                    910 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    911 ; parse arguments list 
                                    912 ; between ()
                                    913 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00198D                        914 func_args:
      009599 6F 6E            [ 1]  915 	ld a,#TK_LPAREN 
      00959B 20 62 79         [ 4]  916 	call expect 
                                    917 ; expected to continue in arg_list 
                                    918 ; caller must check for TK_RPAREN 
                                    919 
                                    920 ;-------------------------------
                                    921 ; parse embedded BASIC routines 
                                    922 ; arguments list.
                                    923 ; arg_list::=  expr[','expr]*
                                    924 ; all arguments are of int24_t type
                                    925 ; and pushed on stack 
                                    926 ; input:
                                    927 ;   none
                                    928 ; output:
                                    929 ;   xstack{n}   arguments pushed on xstack
                                    930 ;   A 	number of arguments pushed on xstack  
                                    931 ;--------------------------------
      001992                        932 arg_list:
      00959E 20 30            [ 1]  933 	push #0
      0095A0 0A 00 69         [ 4]  934 1$:	call condition 
      0095A3 6E               [ 1]  935 	tnz a 
      0095A4 76 61            [ 1]  936 	jreq 7$  
      0095A6 6C 69            [ 1]  937 	inc (1,sp)
      0095A8 64 20 6C         [ 4]  938 	call next_token 
      0095AB 69 6E            [ 1]  939 	cp a,#TK_COMMA 
      0095AD 65 20            [ 1]  940 	jreq 1$ 
      0095AF 6E 75            [ 1]  941 	cp a,#TK_RPAREN
      0095B1 6D 62            [ 1]  942 	jreq 7$
      0019A7                        943 	_unget_token 
      0095B3 65 72 2E 0A 00   [ 1]    1      mov in,in.saved  
      0095B8 72               [ 1]  944 7$:	pop a  
      0095B9 75               [ 4]  945 	ret 
                                    946 
                                    947 ;--------------------------------
                                    948 ;   BASIC commnands 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    949 ;--------------------------------
                                    950 
                                    951 ;--------------------------------
                                    952 ;  arithmetic and relational 
                                    953 ;  routines
                                    954 ;  operators precedence
                                    955 ;  highest to lowest
                                    956 ;  operators on same row have 
                                    957 ;  same precedence and are executed
                                    958 ;  from left to right.
                                    959 ;	'*','/','%'
                                    960 ;   '-','+'
                                    961 ;   '=','>','<','>=','<=','<>','><'
                                    962 ;   '<>' and '><' are equivalent for not equal.
                                    963 ;--------------------------------
                                    964 
                                    965 ;---------------------
                                    966 ; return array element
                                    967 ; address from @(expr)
                                    968 ; input:
                                    969 ;   A 		TK_ARRAY
                                    970 ; output:
                                    971 ;	X 		element address 
                                    972 ;----------------------
      0019AE                        973 get_array_element:
      0095BA 6E 20 74         [ 4]  974 	call func_args 
      0095BD 69 6D            [ 1]  975 	cp a,#1
      0095BF 65 20            [ 1]  976 	jreq 1$
      0095C1 6F 6E 6C         [ 2]  977 	jp syntax_error
      0019B8                        978 1$: _xpop 
      0095C4 79 20            [ 1]    1     ld a,(y)
      0095C6 75               [ 1]    2     ldw x,y 
      0095C7 73 61            [ 2]    3     ldw x,(1,x)
      0095C9 67 65 2E 0A      [ 2]    4     addw y,#CELL_SIZE 
                                    979     ; ignore A, index < 65536 in any case 
                                    980 	; check for bounds 
      0095CD 00 63 6F         [ 2]  981 	cpw x,array_size 
      0095D0 6D 6D            [ 2]  982 	jrule 3$
                                    983 ; bounds {1..array_size}	
      0095D2 61 6E            [ 1]  984 2$: ld a,#ERR_BAD_VALUE 
      0095D4 64 20 6C         [ 2]  985 	jp tb_error 
      0095D7 69               [ 2]  986 3$: tnzw  x
      0095D8 6E 65            [ 1]  987 	jreq 2$ 
      0095DA 20               [ 2]  988 	pushw x 
      0095DB 6F               [ 2]  989 	sllw x 
      0095DC 6E 6C 79         [ 2]  990 	addw x,(1,sp) ; index*size_of(int24)
      0095DF 20 75            [ 2]  991 	ldw (1,sp),x  
      0095E1 73 61 67         [ 2]  992 	ldw x,#tib ; array is below tib 
      0095E4 65 2E 0A         [ 2]  993 	subw x,(1,sp)
      0019DB                        994 	_drop 2   
      0095E7 00 64            [ 2]    1     addw sp,#2 
      0095E9 75               [ 4]  995 	ret 
                                    996 
                                    997 
                                    998 ;***********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



                                    999 ;   expression parse,execute 
                                   1000 ;***********************************
                                   1001 ;-----------------------------------
                                   1002 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1003 ;			 integer | function |
                                   1004 ;			 '('relation')' 
                                   1005 ; output:
                                   1006 ;   A       token attribute 
                                   1007 ;   xstack  value  
                                   1008 ; ---------------------------------
                           000001  1009 	NEG=1
                           000001  1010 	VSIZE=1
      0019DE                       1011 factor:
      0019DE                       1012 	_vars VSIZE 
      0095EA 70 6C            [ 2]    1     sub sp,#VSIZE 
      0095EC 69 63            [ 1] 1013 	clr (NEG,sp)
      0095EE 61 74 65         [ 4] 1014 	call next_token
      0095F1 20               [ 1] 1015 	tnz a 
      0095F2 6E 61            [ 1] 1016 	jrne 1$ 
      0095F4 6D 65 2E         [ 2] 1017 	jp 22$ 
      0095F7 0A 00            [ 1] 1018 1$:	cp a,#TK_PLUS 
      0095F9 46 69            [ 1] 1019 	jreq 2$
      0095FB 6C 65            [ 1] 1020 	cp a,#TK_MINUS 
      0095FD 20 6E            [ 1] 1021 	jrne 4$ 
      0095FF 6F 74            [ 1] 1022 	cpl (NEG,sp)
      0019F5                       1023 2$:	
      009601 20 66 6F         [ 4] 1024 	call next_token
      0019F8                       1025 4$:
      009604 75               [ 1] 1026 	tnz a 
      009605 6E 64            [ 1] 1027 	jrne 41$ 
      009607 2E 0A 00         [ 2] 1028 	jp syntax_error  
      0019FE                       1029 41$:	
      00960A 62 61            [ 1] 1030 	cp a,#TK_IFUNC 
      00960C 64 20            [ 1] 1031 	jrne 5$ 
      001A02                       1032 	_get_code_addr 
      00960E 76               [ 2]    1         ldw x,(x)
      00960F 61 6C 75 65      [ 1]    2         inc in 
      009613 2E 0A 00 46      [ 1]    3         inc in 
      009617 69               [ 4] 1033 	call (x); result in A:X  
      009618 6C 65            [ 2] 1034 	jra 18$ 
      001A0E                       1035 5$:
      00961A 20 69            [ 1] 1036 	cp a,#TK_INTGR
      00961C 6E 20            [ 1] 1037 	jrne 6$
      00961E 65 78 74         [ 4] 1038 	call get_int24 ; A:X
      009621 65 6E            [ 2] 1039 	jra 18$
      001A17                       1040 6$:
      009623 64 65            [ 1] 1041 	cp a,#TK_ARRAY
      009625 64 20            [ 1] 1042 	jrne 7$
      009627 6D 65 6D         [ 4] 1043 	call get_array_element
      00962A 6F 72            [ 2] 1044     jra 71$
      001A20                       1045 7$:
      00962C 79 2C            [ 1] 1046 	cp a,#TK_VAR 
      00962E 20 63            [ 1] 1047 	jrne 8$
      009630 61 6E 27         [ 4] 1048 	call get_addr 
      001A27                       1049 71$: ; put value in A:X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009633 74               [ 1] 1050 	ld a,(x)
      009634 20 62            [ 2] 1051 	ldw x,(1,x)
      009636 65 20            [ 2] 1052 	jra 18$
      001A2C                       1053 8$:
      009638 72 75            [ 1] 1054 	cp a,#TK_LABEL 
      00963A 6E 20            [ 1] 1055 	jrne 9$
      00963C 66 72            [ 2] 1056 	pushw y  
      00963E 6F               [ 2] 1057 	pushw x 
      00963F 6D 20 74         [ 4] 1058 	call skip_string
      009642 68               [ 2] 1059 	popw x  
      009643 65 72 65         [ 4] 1060 	call strlen 
      009646 2E 0A            [ 1] 1061 	add a,#REC_XTRA_BYTES
      009648 00 4E 6F         [ 4] 1062 	call search_name
      00964B 20               [ 2] 1063 	tnzw x 
      00964C 64 61            [ 1] 1064 	jrne 82$ 
      00964E 74 61            [ 2] 1065 	popw y 
      009650 20 66            [ 2] 1066 	jra 16$
      001A46                       1067 82$:
      009652 6F 75            [ 2] 1068 	popw y   
      009654 6E 64 2E         [ 4] 1069 	call get_value ; in A:X 
      009657 0A 00            [ 2] 1070 	jra 18$
      001A4D                       1071 9$: 
      009659 4E 6F            [ 1] 1072 	cp a,#TK_CFUNC 
      00965B 20 70            [ 1] 1073 	jrne 12$
      001A51                       1074 	_get_code_addr 
      00965D 72               [ 2]    1         ldw x,(x)
      00965E 6F 67 72 61      [ 1]    2         inc in 
      009662 6D 20 69 6E      [ 1]    3         inc in 
      009666 20               [ 4] 1075 	call(x)
      009667 52               [ 1] 1076 	clrw x 
      009668 41               [ 1] 1077 	rlwa x  ; char>int24 in A:X 
      009669 4D 21            [ 2] 1078 	jra 18$ 	 
      001A5F                       1079 12$:			
      00966B 0A 00            [ 1] 1080 	cp a,#TK_LPAREN
      00966D 46 69            [ 1] 1081 	jrne 16$
      00966F 6C 65 20         [ 4] 1082 	call expression
      009672 73 79            [ 1] 1083 	ld a,#TK_RPAREN 
      009674 73 74 65         [ 4] 1084 	call expect
      001A6B                       1085 	_xpop 
      009677 6D 20            [ 1]    1     ld a,(y)
      009679 66               [ 1]    2     ldw x,y 
      00967A 75 6C            [ 2]    3     ldw x,(1,x)
      00967C 6C 2E 0A 00      [ 2]    4     addw y,#CELL_SIZE 
      009680 42 75            [ 2] 1086 	jra 18$	
      001A76                       1087 16$:
      001A76                       1088 	_unget_token 
      009682 66 66 65 72 20   [ 1]    1      mov in,in.saved  
      009687 66               [ 1] 1089 	clr a 
      009688 75 6C            [ 2] 1090 	jra 22$ 
      001A7E                       1091 18$: 
      00968A 6C 0A            [ 1] 1092 	tnz (NEG,sp)
      00968C 00 6F            [ 1] 1093 	jreq 20$
      00968E 76 65 72         [ 4] 1094 	call neg_ax   
      001A85                       1095 20$:
      001A85                       1096 	_xpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009691 66 6C 6F 77      [ 2]    1     subw y,#CELL_SIZE
      009695 0A 00            [ 1]    2     ld (y),a 
      009697 63 6F 6E         [ 2]    3     ldw (1,y),x 
      00969A 73 74            [ 1] 1097 	ld a,#TK_INTGR
      001A90                       1098 22$:
      001A90                       1099 	_drop VSIZE
      00969C 61 6E            [ 2]    1     addw sp,#VSIZE 
      00969E 74               [ 4] 1100 	ret
                                   1101 
                                   1102 
                                   1103 ;-----------------------------------
                                   1104 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1105 ; output:
                                   1106 ;   A    	token attribute 
                                   1107 ;	xstack		value 
                                   1108 ;-----------------------------------
                           000001  1109 	MULOP=1
                           000001  1110 	VSIZE=1
      001A93                       1111 term:
      001A93                       1112 	_vars VSIZE
      00969F 20 63            [ 2]    1     sub sp,#VSIZE 
                                   1113 ; first factor 	
      0096A1 61 6E 27         [ 4] 1114 	call factor
      0096A4 74               [ 1] 1115 	tnz a 
      0096A5 20 62            [ 1] 1116 	jreq term_exit  
      001A9B                       1117 term01:	 ; check for  operator '*'|'/'|'%' 
      0096A7 65 20 6D         [ 4] 1118 	call next_token
      0096AA 6F 64            [ 1] 1119 	ld (MULOP,sp),a
      0096AC 69 66            [ 1] 1120 	and a,#TK_GRP_MASK
      0096AE 69 65            [ 1] 1121 	cp a,#TK_GRP_MULT
      0096B0 64 0A            [ 1] 1122 	jreq 1$
      0096B2 00 0A            [ 1] 1123 	ld a,#TK_INTGR
      001AA8                       1124 	_unget_token 
      0096B4 72 75 6E 20 74   [ 1]    1      mov in,in.saved  
      0096B9 69 6D            [ 2] 1125 	jra term_exit 
      001AAF                       1126 1$:	; got *|/|%
                                   1127 ;second factor
      0096BB 65 20 65         [ 4] 1128 	call factor
      0096BE 72               [ 1] 1129 	tnz a 
      0096BF 72 6F            [ 1] 1130 	jrne 2$ 
      0096C1 72 2C 20         [ 2] 1131 	jp syntax_error 
      001AB8                       1132 2$: ; select operation 	
      0096C4 00 0A            [ 1] 1133 	ld a,(MULOP,sp) 
      0096C6 63 6F            [ 1] 1134 	cp a,#TK_MULT 
      0096C8 6D 70            [ 1] 1135 	jrne 3$
                                   1136 ; '*' operator
      0096CA 69 6C 65         [ 4] 1137 	call mul24 
      0096CD 20 65            [ 2] 1138 	jra term01
      0096CF 72 72            [ 1] 1139 3$: cp a,#TK_DIV 
      0096D1 6F 72            [ 1] 1140 	jrne 4$ 
                                   1141 ; '/' operator	
      0096D3 2C 20 00         [ 4] 1142 	call div24 
      0096D6 6C 61            [ 2] 1143 	jra term01 
      001ACC                       1144 4$: ; '%' operator
      0096D8 73 74 20         [ 4] 1145 	call mod24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      0096DB 74 6F            [ 2] 1146 	jra term01 
      001AD1                       1147 9$: 
      0096DD 6B 65            [ 1] 1148 	ld a,#TK_INTGR
      001AD3                       1149 term_exit:
      001AD3                       1150 	_drop VSIZE 
      0096DF 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096E1 69               [ 4] 1151 	ret 
                                   1152 
                                   1153 ;-------------------------------
                                   1154 ;  expr ::= term [['+'|'-'] term]*
                                   1155 ;  result range {-32768..32767}
                                   1156 ;  output:
                                   1157 ;   A    token attribute 
                                   1158 ;   xstack	 result    
                                   1159 ;-------------------------------
                           000001  1160 	OP=1 
                           000001  1161 	VSIZE=1 
      001AD6                       1162 expression:
      001AD6                       1163 	_vars VSIZE 
      0096E2 64 3A            [ 2]    1     sub sp,#VSIZE 
                                   1164 ; first term 	
      0096E4 20 00 93         [ 4] 1165 	call term
      0096E6 4D               [ 1] 1166 	tnz a 
      0096E6 A6 02            [ 1] 1167 	jreq 9$
      0096E8                       1168 1$:	; operator '+'|'-'
      0096E8 72 0A 00         [ 4] 1169 	call next_token
      0096EB 23 4C            [ 1] 1170 	ld (OP,sp),a 
      0096ED 88 AE            [ 1] 1171 	and a,#TK_GRP_MASK
      0096EF 96 B3            [ 1] 1172 	cp a,#TK_GRP_ADD 
      0096F1 CD 89            [ 1] 1173 	jreq 2$ 
      001AE9                       1174 	_unget_token 
      0096F3 E8 84 AE 95 3B   [ 1]    1      mov in,in.saved  
      0096F8 72 5F            [ 1] 1175 	ld a,#TK_INTGR
      0096FA 00 0E            [ 2] 1176 	jra 9$ 
      001AF2                       1177 2$: ; second term 
      0096FC 48 72 59         [ 4] 1178 	call term
      0096FF 00               [ 1] 1179 	tnz a 
      009700 0E C7            [ 1] 1180 	jrne 3$
      009702 00 0F 72         [ 2] 1181 	jp syntax_error
      001AFB                       1182 3$:
      009705 BB 00            [ 1] 1183 	ld a,(OP,sp)
      009707 0E FE            [ 1] 1184 	cp a,#TK_PLUS 
      009709 CD 89            [ 1] 1185 	jrne 4$
                                   1186 ; '+' operator	
      00970B E8 CE 00         [ 4] 1187 	call add24
      00970E 05 C6            [ 2] 1188 	jra 1$ 
      001B06                       1189 4$:	; '-' operator 
      009710 00 04 90         [ 4] 1190 	call sub24
      009713 5F 90            [ 2] 1191 	jra 1$
      001B0B                       1192 9$:
      001B0B                       1193 	_drop VSIZE 
      009715 02 CD            [ 2]    1     addw sp,#VSIZE 
      009717 86               [ 4] 1194 	ret 
                                   1195 
                                   1196 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1197 ; rel ::= expr rel_op expr
                                   1198 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1199 ;  relation return  integer , zero is false 
                                   1200 ;  output:
                                   1201 ;	 xstack		value  
                                   1202 ;---------------------------------------------
                           000001  1203 	RELOP=1
                           000001  1204 	VSIZE=1 
      001B0E                       1205 relation: 
      001B0E                       1206 	_vars VSIZE
      009718 E7 CE            [ 2]    1     sub sp,#VSIZE 
      00971A 00 05 C6         [ 4] 1207 	call expression
      00971D 00               [ 1] 1208 	tnz a 
      00971E 02 CD            [ 1] 1209 	jreq 9$ 
                                   1210 ; expect rel_op or leave 
      009720 A0 82 AE         [ 4] 1211 	call next_token 
      009723 96 D6            [ 1] 1212 	ld (RELOP,sp),a 
      009725 CD 89            [ 1] 1213 	and a,#TK_GRP_MASK
      009727 E8 C6            [ 1] 1214 	cp a,#TK_GRP_RELOP 
      009729 00 03            [ 1] 1215 	jreq 2$
      00972B 5F 97            [ 1] 1216 	ld a,#TK_INTGR 
      001B23                       1217 	_unget_token 
      00972D 72 BB 00 05 F6   [ 1]    1      mov in,in.saved  
      009732 5F 97            [ 2] 1218 	jra 9$ 
      001B2A                       1219 2$:	; expect another expression
      009734 CD 98 92         [ 4] 1220 	call expression
      009737 20               [ 1] 1221 	tnz a 
      009738 35 03            [ 1] 1222 	jrne 3$
      009739 CC 16 66         [ 2] 1223 	jp syntax_error 
      001B33                       1224 3$: 
      009739 88 AE 96         [ 4] 1225 	call cp24 
      001B36                       1226 	_xpop  
      00973C C5 CD            [ 1]    1     ld a,(y)
      00973E 89               [ 1]    2     ldw x,y 
      00973F E8 84            [ 2]    3     ldw x,(1,x)
      009741 AE 95 3B 72      [ 2]    4     addw y,#CELL_SIZE 
      009745 5F               [ 1] 1227 	tnz a 
      009746 00 0E            [ 1] 1228 	jrmi 4$
      009748 48 72            [ 1] 1229 	jrne 5$
      00974A 59 00 0E C7      [ 1] 1230 	mov acc8,#2 ; i1==i2
      00974E 00 0F            [ 2] 1231 	jra 6$ 
      001B4A                       1232 4$: ; i1<i2
      009750 72 BB 00 0E      [ 1] 1233 	mov acc8,#4 
      009754 FE CD            [ 2] 1234 	jra 6$
      001B50                       1235 5$: ; i1>i2
      009756 89 E8 AE 16      [ 1] 1236 	mov acc8,#1  
      001B54                       1237 6$: ; 0=false, -1=true 
      00975A 90               [ 1] 1238 	clrw x 
      00975B CD 89 E8         [ 1] 1239 	ld a, acc8  
      00975E A6 0D            [ 1] 1240 	and a,(RELOP,sp)
      009760 CD 89            [ 1] 1241 	jreq 7$
      009762 8B               [ 2] 1242 	cplw x 
      009763 CE 00            [ 1] 1243 	ld a,#255 
      001B5F                       1244 7$:	_xpush 
      009765 01 CD 8A 55      [ 2]    1     subw y,#CELL_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009769 A6 5E            [ 1]    2     ld (y),a 
      00976B CD 89 8B         [ 2]    3     ldw (1,y),x 
      00976E AE 17            [ 1] 1245 	ld a,#TK_INTGR
      001B6A                       1246 9$: 
      001B6A                       1247 	_drop VSIZE
      009770 FF 94            [ 2]    1     addw sp,#VSIZE 
      009772 81               [ 4] 1248 	ret 
                                   1249 
                                   1250 ;-------------------------------------------
                                   1251 ;  AND factor:  [NOT] relation | (condition)
                                   1252 ;  output:
                                   1253 ;     A      TK_INTGR|0
                                   1254 ;-------------------------------------------
                           000001  1255 	NOT_OP=1
      001B6D                       1256 and_factor:
      009772 CD 94            [ 1] 1257 	push #0 
      009774 FC 17 CA         [ 4] 1258 0$:	call next_token  
      009775 4D               [ 1] 1259 	tnz a 
      009775 A6 0D            [ 1] 1260 	jreq 8$ 
      009777 CD 89            [ 1] 1261 	cp a,#TK_NOT 
      009779 8B A6            [ 1] 1262 	jrne 1$ 
      00977B 3E CD            [ 1] 1263 	cpl (NOT_OP,sp)
      00977D 89 8B            [ 2] 1264 	jra 0$ 
      001B7D                       1265 1$:	
      00977F CD 8A            [ 1] 1266 	cp a,#TK_LPAREN 
      009781 ED 72            [ 1] 1267 	jrne 2$
      009783 5D 00 04         [ 4] 1268 	call condition
      009786 27 ED            [ 1] 1269 	ld a,#TK_RPAREN 
      009788 CD 91 16         [ 4] 1270 	call expect
      00978B 72 5D            [ 2] 1271 	jra 3$
      001B8B                       1272 2$: _unget_token 
      00978D 00 04 27 E4 01   [ 1]    1      mov in,in.saved  
      009791 CD 1B 0E         [ 4] 1273 	call relation
      001B93                       1274 3$:
      009791 C6 00            [ 1] 1275 	tnz (NOT_OP,sp)
      009793 02 C1            [ 1] 1276 	jreq 8$ 
      009795 00 04 2B         [ 4] 1277 	call cpl24
      001B9A                       1278 8$:
      001B9A                       1279 	_drop 1  
      009798 1D 01            [ 2]    1     addw sp,#1 
      009799 81               [ 4] 1280     ret 
                                   1281 
                                   1282 
                                   1283 ;--------------------------------------------
                                   1284 ;  AND operator as priority over OR||XOR 
                                   1285 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1286 ;          
                                   1287 ;  output:
                                   1288 ;     A     TK_INTGR|0
                                   1289 ;    xtack   value 
                                   1290 ;--------------------------------------------
      001B9D                       1291 and_cond:
      009799 72 01 00         [ 4] 1292 	call and_factor
      00979C 23               [ 1] 1293 	tnz a 
      00979D D7 CE            [ 1] 1294 	jreq 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00979F 00 05 72         [ 4] 1295 1$: call next_token 
      0097A2 BB               [ 1] 1296 	tnz a 
      0097A3 00 01            [ 1] 1297 	jreq 6$ 
      0097A5 C3 00            [ 1] 1298 	cp a,#TK_AND 
      0097A7 1E 2A            [ 1] 1299 	jreq 3$
      001BAD                       1300 	_unget_token 
      0097A9 C8 CF 00 05 E6   [ 1]    1      mov in,in.saved  
      0097AE 02 C7            [ 2] 1301 	jra 6$ 
      0097B0 00 04 35         [ 4] 1302 3$:	call and_factor  
      0097B3 03               [ 1] 1303 	tnz a 
      0097B4 00 02            [ 1] 1304 	jrne 4$
      0097B6 CC 16 66         [ 2] 1305 	jp syntax_error 
      001BBD                       1306 4$:	
      001BBD                       1307 	_xpop 
      0097B6 CD 98            [ 1]    1     ld a,(y)
      0097B8 4A               [ 1]    2     ldw x,y 
      0097B9 A1 00            [ 2]    3     ldw x,(1,x)
      0097BB 27 DC A1 80      [ 2]    4     addw y,#CELL_SIZE 
      0097BF 26 0C FE         [ 1] 1308 	ld acc24,a 
      0097C2 72 5C 00         [ 2] 1309 	ldw acc16,x
      001BCC                       1310 	_xpop 
      0097C5 02 72            [ 1]    1     ld a,(y)
      0097C7 5C               [ 1]    2     ldw x,y 
      0097C8 00 02            [ 2]    3     ldw x,(1,x)
      0097CA FD 20 E9 03      [ 2]    4     addw y,#CELL_SIZE 
      0097CD C4 00 0C         [ 1] 1311 	and a,acc24 
      0097CD A1               [ 1] 1312 	rlwa x 
      0097CE 85 26 05         [ 1] 1313 	and a,acc16 
      0097D1 CD               [ 1] 1314 	rlwa x 
      0097D2 9D 41 20         [ 1] 1315 	and a,acc8 
      0097D5 E0               [ 1] 1316 	rlwa x
      0097D6                       1317 	_xpush
      0097D6 A1 05 26 05      [ 2]    1     subw y,#CELL_SIZE
      0097DA CD 9D            [ 1]    2     ld (y),a 
      0097DC 3C 20 D7         [ 2]    3     ldw (1,y),x 
      0097DF 20 B7            [ 2] 1318 	jra 1$  
      0097DF A1 03            [ 1] 1319 6$: ld a,#TK_INTGR 
      0097E1 26               [ 4] 1320 9$:	ret 	 
                                   1321 
                                   1322 
                                   1323 ;--------------------------------------------
                                   1324 ; condition for IF and UNTIL 
                                   1325 ; operators: OR,XOR 
                                   1326 ; format:  and_cond [ OP and_cond ]* 
                                   1327 ; output:
                                   1328 ;    A        INTGR|0 
                                   1329 ;    xstack   value 
                                   1330 ;--------------------------------------------
                           000001  1331 	ATMP=1
                           000002  1332 	OP=2
                           000002  1333 	VSIZE=2 
      001BEF                       1334 condition:
      001BEF                       1335 	_vars VSIZE 
      0097E2 05 CD            [ 2]    1     sub sp,#VSIZE 
      0097E4 97 EF 20         [ 4] 1336 	call and_cond
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      0097E7 CE               [ 1] 1337 	tnz a 
      0097E8 27 69            [ 1] 1338 	jreq 9$ 
      0097E8 A1 0A 27         [ 4] 1339 1$:	call next_token 
      0097EB CA CC            [ 1] 1340 	cp a,#TK_OR 
      0097ED 96 E6            [ 1] 1341 	jreq 2$
      0097EF A1 8A            [ 1] 1342 	cp a,#TK_XOR
      0097EF 52 04            [ 1] 1343 	jreq 2$ 
      001C02                       1344 	_unget_token 
      0097F1 1F 01 0F 03 CD   [ 1]    1      mov in,in.saved  
      0097F6 98 63            [ 2] 1345 	jra 8$ 
      0097F8 CE 00            [ 1] 1346 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097FA 05 72 BB         [ 4] 1347 	call and_cond
      0097FD 00 01            [ 1] 1348 	cp a,#TK_INTGR 
      0097FF F6 A1            [ 1] 1349 	jreq 3$
      009801 32 26 43         [ 2] 1350 	jp syntax_error 
      001C15                       1351 3$:	 
      001C15                       1352 	_xpop  ; rigth arg 
      009804 72 5C            [ 1]    1     ld a,(y)
      009806 00               [ 1]    2     ldw x,y 
      009807 02 CD            [ 2]    3     ldw x,(1,x)
      009809 9C 6F A1 84      [ 2]    4     addw y,#CELL_SIZE 
      00980D 27 03 CC         [ 1] 1353 	ld acc24,a 
      009810 96 E6 0D         [ 2] 1354 	ldw acc16,x 
      009812                       1355 	_xpop  ; left arg  
      009812 1E 01            [ 1]    1     ld a,(y)
      009814 CD               [ 1]    2     ldw x,y 
      009815 94 06            [ 2]    3     ldw x,(1,x)
      009817 AB 05 6B 04      [ 2]    4     addw y,#CELL_SIZE 
      00981B CD 9E            [ 1] 1356 	ld (ATMP,sp),a 
      00981D 17 5D            [ 1] 1357 	ld a,(OP,sp)
      00981F 27 EE            [ 1] 1358 	cp a,#TK_XOR 
      009821 F6 2A            [ 1] 1359 	jreq 5$ 
      001C35                       1360 4$: ; A:X OR acc24   
      009823 05 A6            [ 1] 1361 	ld a,(ATMP,sp)
      009825 11 CC 96         [ 1] 1362 	or a,acc24 
      009828 E8               [ 1] 1363 	rlwa x 
      009829 CA 00 0D         [ 1] 1364 	or a,acc16 
      009829 72               [ 1] 1365 	rlwa x 
      00982A FB 03 1D         [ 1] 1366 	or a,acc8 
      00982D 00               [ 1] 1367 	rlwa x 
      00982E 03 CF            [ 2] 1368 	jra 6$  
      001C45                       1369 5$: ; A:X XOR acc24 
      009830 00 1A            [ 1] 1370 	ld a,(ATMP,sp)
      009832 90 F6 93         [ 1] 1371 	xor a,acc24 
      009835 EE               [ 1] 1372 	rlwa x 
      009836 01 72 A9         [ 1] 1373 	xor a,acc16 
      009839 00               [ 1] 1374 	rlwa x 
      00983A 03 72 C7         [ 1] 1375 	xor a,acc8 
      00983D 00               [ 1] 1376 	rlwa x 
      001C53                       1377 6$: _xpush
      00983E 1A 72 5C 00      [ 2]    1     subw y,#CELL_SIZE
      009842 1B 72            [ 1]    2     ld (y),a 
      009844 CF 00 1A         [ 2]    3     ldw (1,y),x 
      009847 5B 04            [ 2] 1378 	jra 1$ 
      009849 81 84            [ 1] 1379 8$:	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00984A                       1380 9$:	_drop VSIZE 
      00984A C6 00            [ 2]    1     addw sp,#VSIZE 
      00984C 02               [ 4] 1381 	ret 
                                   1382 
                                   1383 
                                   1384 ;--------------------------------------------
                                   1385 ; BASIC: HEX 
                                   1386 ; select hexadecimal base for integer print
                                   1387 ;---------------------------------------------
      001C63                       1388 hex_base:
      00984D C7 00 03 C0      [ 1] 1389 	mov base,#16 
      009851 00               [ 4] 1390 	ret 
                                   1391 
                                   1392 ;--------------------------------------------
                                   1393 ; BASIC: DEC 
                                   1394 ; select decimal base for integer print
                                   1395 ;---------------------------------------------
      001C68                       1396 dec_base:
      009852 04 27 0D 0A      [ 1] 1397 	mov base,#10
      009855 81               [ 4] 1398 	ret 
                                   1399 
                                   1400 ;------------------------
                                   1401 ; BASIC: FREE 
                                   1402 ; return free size in RAM 
                                   1403 ; output:
                                   1404 ;   A:x		size 
                                   1405 ;--------------------------
      001C6D                       1406 free:
      009855 CE               [ 1] 1407 	clr a 
      009856 00 05 72         [ 2] 1408 	ldw x,#tib 
      009859 BB 00 01 F6      [ 2] 1409 	subw x,dvar_end 
      00985D 5C               [ 4] 1410 	ret 
                                   1411 
                                   1412 ;------------------------------
                                   1413 ; BASIC: SIZE 
                                   1414 ; command that print 
                                   1415 ; program start addres and size 
                                   1416 ;------------------------------
      001C76                       1417 cmd_size:
      00985E 72 5C 00         [ 1] 1418 	push base 
      009861 02 81 CF         [ 2] 1419 	ldw x,#PROG_ADDR 
      009863 CD 09 68         [ 4] 1420 	call puts 
      009863 F6 27 03         [ 2] 1421 	ldw x,txtbgn     
      009866 5C 20 FA 5C      [ 1] 1422 	mov base,#16 
      00986A 72 B0 00         [ 4] 1423 	call prt_i16
      00986D 05 CF 00         [ 1] 1424 	pop base 
      009870 01 81 E1         [ 2] 1425 	ldw x,#PROG_SIZE 
      009872 CD 09 68         [ 4] 1426 	call puts 
      009872 FE 72 5C         [ 2] 1427 	ldw x,txtend 
      009875 00 02 72 5C      [ 2] 1428 	subw x,txtbgn 
      009879 00 02 81         [ 4] 1429 	call prt_i16
      00987C AE 1E F2         [ 2] 1430 	ldw x,#STR_BYTES 
      00987C F6 EE 01         [ 4] 1431 	call puts  
      00987F 72               [ 4] 1432 	ret 
                                   1433 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1434 
                                   1435 ;------------------------
                                   1436 ; BASIC: UBOUND  
                                   1437 ; return array variable size 
                                   1438 ; and set 'array_size' variable 
                                   1439 ; output:
                                   1440 ;   A:X 	array_size
                                   1441 ;--------------------------
      001CA3                       1442 ubound:
      009880 5C 00 02         [ 4] 1443 	call free 
      009883 72 5C            [ 1] 1444 	ld a,#CELL_SIZE 
      009885 00               [ 2] 1445 	div x,a 
      009886 02 72 5C         [ 2] 1446 	ldw array_size,x
      009889 00               [ 1] 1447 	clr a 
      00988A 02               [ 4] 1448 	ret 
                                   1449 
                                   1450 ;-----------------------------
                                   1451 ; BASIC: LET var=expr 
                                   1452 ; variable assignement 
                                   1453 ; output:
                                   1454 ;   A 		TK_NONE 
                                   1455 ;-----------------------------
      001CAE                       1456 let::
      00988B 81 17 CA         [ 4] 1457 	call next_token 
      00988C A1 85            [ 1] 1458 	cp a,#TK_VAR 
      00988C F6 72            [ 1] 1459 	jreq let_var
      00988E 5C 00            [ 1] 1460 	cp a,#TK_ARRAY 
      009890 02 81            [ 1] 1461 	jreq  let_array
      009892 CC 16 66         [ 2] 1462 	jp syntax_error
      001CBC                       1463 let_array:
      009892 72 5F 00         [ 4] 1464 	call get_array_element
      009895 0D CF            [ 2] 1465 	jra let_eval 
      001CC1                       1466 let_var:
      009897 00 0E A6         [ 4] 1467 	call get_addr
      001CC4                       1468 let_eval:
      00989A 10 C1 00         [ 2] 1469 	ldw ptr16,x  ; variable address 
      00989D 0B 27 09         [ 4] 1470 	call next_token 
      0098A0 72 0F            [ 1] 1471 	cp a,#TK_EQUAL
      0098A2 00 0E            [ 1] 1472 	jreq 1$
      0098A4 04 72 53         [ 2] 1473 	jp syntax_error
      001CD1                       1474 1$:	
      0098A7 00 0D EF         [ 4] 1475 	call condition   
      0098A9 A1 84            [ 1] 1476 	cp a,#TK_INTGR 
      0098A9 A6 FF            [ 1] 1477 	jreq 2$
      0098AB CD 98 CF         [ 2] 1478 	jp syntax_error
      001CDB                       1479 2$:	
      001CDB                       1480 	_xpop ; value 
      0098AE CD 91            [ 1]    1     ld a,(y)
      0098B0 C0               [ 1]    2     ldw x,y 
      0098B1 88 CD            [ 2]    3     ldw x,(1,x)
      0098B3 89 E8 84 81      [ 2]    4     addw y,#CELL_SIZE 
      0098B7                       1481 3$:
      0098B7 90 F6 93 EE      [ 4] 1482 	ld [ptr16],a
      0098BB 01 72 A9 00      [ 1] 1483 	inc ptr8  
      0098BF 03 C7 00 0D      [ 5] 1484 	ldw [ptr16],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0098C3 CF               [ 4] 1485 	ret 
                                   1486 
                                   1487 
                                   1488 ;--------------------------
                                   1489 ; return constant/dvar value 
                                   1490 ; from it's record address
                                   1491 ; input:
                                   1492 ;	X	*const record 
                                   1493 ; output:
                                   1494 ;   A:X   const  value
                                   1495 ;--------------------------
      001CF1                       1496 get_value: ; -- i 
      0098C4 00               [ 1] 1497 	ld a,(x) ; record size 
      0098C5 0E CD            [ 1] 1498 	and a,#NAME_MAX_LEN
      0098C7 98 A9            [ 1] 1499 	sub a,#CELL_SIZE ; * value 
      0098C9 A6               [ 1] 1500 	push a 
      0098CA 20 CD            [ 1] 1501 	push #0 
      0098CC 89 8B 81         [ 2] 1502 	addw x,(1,sp)
      0098CF F6               [ 1] 1503 	ld a,(x)
      0098CF 52 04            [ 2] 1504 	ldw x,(1,x)
      001CFF                       1505 	_drop 2
      0098D1 0F 02            [ 2]    1     addw sp,#2 
      0098D3 0F               [ 4] 1506 	ret 
                                   1507 
                                   1508 
                                   1509 ;--------------------------
                                   1510 ; list constants in EEPROM 
                                   1511 ; call when using LIST \C 
                                   1512 ;-------------------------
                           000001  1513 	COUNT=1
                           000003  1514 	YTEMP=3
                           000004  1515 	VSIZE=4 
      001D02                       1516 list_const:
      0098D4 01 4D            [ 2] 1517 	pushw y 
      001D04                       1518 	_vars 4 
      0098D6 27 11            [ 2]    1     sub sp,#4 
      0098D8 C6               [ 1] 1519 	clrw x 
      0098D9 00 0B            [ 2] 1520 	ldw (COUNT,sp),x  
      0098DB A1 0A 26 0A      [ 2] 1521 	ldw Y,#EEPROM_BASE 
      0098DF 72 0F 00 0D      [ 2] 1522 1$:	cpw y,free_eeprom 
      0098E3 05 03            [ 1] 1523 	jruge 9$
      0098E5 01 CD            [ 2] 1524     ldw (YTEMP,sp),y 
      0098E7 82               [ 1] 1525 	ldw x,y
      0098E8 98               [ 1] 1526 	incw x 
      0098E9 CD 09 68         [ 4] 1527 	call puts  
      0098E9 AE 16            [ 1] 1528 	ld a,#'= 
      0098EB 90 1C 00         [ 4] 1529 	call putc 
      0098EE 50 5A            [ 2] 1530 	ldw x,(YTEMP,sp)
      0098F0 7F 1C F1         [ 4] 1531 	call get_value 
      0098F1 C7 00 0C         [ 1] 1532 	ld acc24,a 
      0098F1 C6 00 0B         [ 2] 1533 	ldw acc16,x 
      0098F4 CD 83 64         [ 4] 1534 	call prt_acc24
      0098F7 AB 30            [ 1] 1535 	ld a,#CR 
      0098F9 A1 3A 2B         [ 4] 1536 	call putc 
      0098FC 02 AB            [ 2] 1537 	ldw x,(COUNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      0098FE 07               [ 1] 1538 	incw x 
      0098FF 1F 01            [ 2] 1539 	ldw (COUNT,sp),x 
      0098FF 5A F7 0C 02      [ 1] 1540 	clr acc16 
      009903 C6 00            [ 2] 1541 	ldw y,(YTEMP,sp)
      009905 0D CA            [ 1] 1542 	ld a,(y)
      009907 00 0E CA         [ 1] 1543 	ld acc8,a
      00990A 00 0F 26 E3      [ 2] 1544 	addw y,acc16 
      00990E C6 00            [ 2] 1545 	jra 1$ 
      001D48                       1546 9$:	
      009910 0B A1            [ 2] 1547 	ldw x,(COUNT,sp)
      009912 10 27 08         [ 4] 1548 	call prt_i16 
      009915 7B 01 27         [ 2] 1549 	ldw x,#CONST_COUNT 
      009918 0A A6 2D         [ 4] 1550 	call puts 
      001D53                       1551 	_drop VSIZE 
      00991B 20 02            [ 2]    1     addw sp,#VSIZE 
      00991D 90 85            [ 2] 1552 	popw y 
      00991D A6               [ 4] 1553 	ret 
                                   1554 
      00991E 24 5A F7 0C 02 74 61  1555 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1556 
                                   1557 
                                   1558 ;--------------------------
                                   1559 ; BASIC: EEFREE 
                                   1560 ; eeprom_free 
                                   1561 ; search end of data  
                                   1562 ; in EEPROM 
                                   1563 ; input:
                                   1564 ;    none 
                                   1565 ; output:
                                   1566 ;    A:X     address free
                                   1567 ;-------------------------
      009923                       1568 func_eefree:
      009923 7B 02 5B         [ 2] 1569 	ldw x,#EEPROM_BASE 
      009926 04 81 00 0E      [ 1] 1570 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009928 A3 47 F8         [ 2] 1571     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009928 A1 61            [ 1] 1572 	jruge 8$ ; no free space 
      00992A 2A               [ 1] 1573 2$: ld a,(x)
      00992B 01 81            [ 1] 1574 	jrne 3$
      00992D A1               [ 1] 1575 	incw x 
      00992E 7A 22 FB A0      [ 1] 1576 	dec acc8 
      009932 20 81            [ 1] 1577 	jrne 2$
      009934 1D 00 08         [ 2] 1578 	subw x,#8 
      009934 52 05            [ 2] 1579 	jra 9$  
      009936 1F               [ 1] 1580 3$: ld a,(x)
      009937 04               [ 1] 1581 	incw x
      009938 4F               [ 1] 1582 	tnz a  
      009939 5F 72            [ 1] 1583 	jrne 3$
      00993B A2               [ 2] 1584 	decw x   
      00993C 00 03            [ 2] 1585 	jra 1$ 
      00993E 90               [ 1] 1586 8$: clrw x ; no free space 
      00993F F7               [ 1] 1587 9$: clr a 
      009940 90 EF 01         [ 2] 1588 	ldw free_eeprom,x ; save in system variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009943 0F               [ 4] 1589 	ret 
                                   1590 
                           000005  1591 REC_XTRA_BYTES=5 
                                   1592 ;--------------------------
                                   1593 ; search constant/dim_var name 
                                   1594 ; format of record  
                                   1595 ;   .byte record length 
                                   1596 ;         = strlen(name)+5 
                                   1597 ;   .asciz name (variable length)
                                   1598 ;   .int24 value (3 bytes )
                                   1599 ; a constant record use 7+ bytes
                                   1600 ; constants are saved in EEPROM  
                                   1601 ; input:
                                   1602 ;    A     record_len 
                                   1603 ;    X     *name
                                   1604 ; output:
                                   1605 ;    X     address|0
                                   1606 ; use:
                                   1607 ;   A,Y, acc16 
                                   1608 ;-------------------------
                           000001  1609 	NAMEPTR=1 ; target name pointer 
                           000003  1610 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1611 	RECLEN=5  ; record length of target
                           000007  1612 	LIMIT=7   ; search area limit 
                           000008  1613 	VSIZE=8  
      001D97                       1614 search_name:
      009944 01 A6            [ 2] 1615 	pushw y 
      001D99                       1616 	_vars VSIZE
      009946 0A 6B            [ 2]    1     sub sp,#VSIZE 
      009948 02 1E 04 F6      [ 1] 1617 	clr acc16 
      00994C 27 4E            [ 1] 1618 	ld (RECLEN,sp),a    
      00994E A1 2D            [ 2] 1619 	ldw (NAMEPTR,sp),x
      009950 26 04 03         [ 2] 1620 	ldw x,dvar_end 
      009953 01 20            [ 2] 1621 	ldw (LIMIT,sp),x 
      009955 08 A1 24 26      [ 2] 1622 	ldw y,dvar_bgn
      009959 08 A6            [ 2] 1623 1$:	ldw (WLKPTR,sp),y
      00995B 10               [ 1] 1624 	ldw x,y 
      00995C 6B 02            [ 2] 1625 	cpw x, (LIMIT,sp) 
      00995E 5C 1F            [ 1] 1626 	jruge 7$ ; no match found 
      009960 04 F6            [ 1] 1627 	ld a,(y)
      009962 A4 0F            [ 1] 1628 	and a,#NAME_MAX_LEN
      009962 A1 61            [ 1] 1629 	cp a,(RECLEN,sp)
      009964 2B 02            [ 1] 1630 	jrne 2$ 
      009966 A0 20            [ 1] 1631 	incw y 
      009968 A1 30            [ 2] 1632 	ldw x,(NAMEPTR,sp)
      00996A 2B 30 A0         [ 4] 1633 	call strcmp
      00996D 30 A1            [ 1] 1634 	jrne 8$ ; match found 
      001DC4                       1635 2$: ; skip this one 	
      00996F 0A 2B            [ 2] 1636 	ldW Y,(WLKPTR,sp)
      009971 06 A0            [ 1] 1637 	ld a,(y)
      009973 07 11            [ 1] 1638 	and a,#NAME_MAX_LEN 
      009975 02 2A 24         [ 1] 1639 	ld acc8,a 
      009978 6B 03 7B 02      [ 2] 1640 	addw y,acc16 
      00997C CD 82            [ 2] 1641 	jra 1$  
      001DD3                       1642 7$: ; no match found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00997E B5 72            [ 1] 1643 	clr (WLKPTR,sp)
      009980 A2 00            [ 1] 1644 	clr (WLKPTR+1,sp)
      001DD7                       1645 8$: ; match found 
      009982 03 90            [ 2] 1646 	ldw x,(WLKPTR,sp) ; record address 
      001DD9                       1647 9$:	_DROP VSIZE
      009984 F7 90            [ 2]    1     addw sp,#VSIZE 
      009986 EF 01            [ 2] 1648 	popw y 
      009988 5F               [ 4] 1649 	 ret 
                                   1650 
                                   1651 ;--------------------------------------------
                                   1652 ; BASIC: CONST name=value [, name=value]*
                                   1653 ; define constant(s) saved in EEPROM
                                   1654 ; share most of his code with cmd_dim 
                                   1655 ;--------------------------------------------
                           000001  1656 	VAR_NAME=1 
                           000003  1657 	REC_LEN=3
                           000005  1658 	RONLY=5
                           000005  1659 	VSIZE=5
      001DDE                       1660 cmd_const:
      009989 7B 03 02 72 A2   [ 2] 1661 	btjt flags,#FRUN,0$
      00998E 00 03            [ 1] 1662 	ld a,#ERR_RUN_ONLY
      009990 90 F7 90         [ 2] 1663 	jp tb_error 
      001DE8                       1664 0$: 
      001DE8                       1665 	_vars VSIZE 
      009993 EF 01            [ 2]    1     sub sp,#VSIZE 
      009995 CD 81            [ 1] 1666 	ld a,#128 
      009997 F9 1E            [ 1] 1667 	ld (RONLY,sp),a 
      009999 04 20            [ 1] 1668 	clr (REC_LEN,sp)
      00999B C2 0D            [ 2] 1669 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1670 
                                   1671 ;---------------------------------
                                   1672 ; BASIC: DIM var_name [var_name]* 
                                   1673 ; create named variables at end 
                                   1674 ; of BASIC program. 
                                   1675 ; These variables are initialized 
                                   1676 ; to 0. 
                                   1677 ; record format same ast CONST 
                                   1678 ; but r/w because stored in RAM 
                                   1679 ;---------------------------------
      001DF2                       1680 cmd_dim:
      00999D 01 27 03 CD 82   [ 2] 1681 	btjt flags,#FRUN,cmd_dim1
      0099A2 7E 06            [ 1] 1682 	ld a,#ERR_RUN_ONLY
      0099A3 CC 16 68         [ 2] 1683 	jp tb_error 
      001DFC                       1684 cmd_dim1:	
      001DFC                       1685 	_vars VSIZE
      0099A3 90 F6            [ 2]    1     sub sp,#VSIZE 
      0099A5 93 EE            [ 1] 1686 	clr (REC_LEN,sp )
      0099A7 01 72            [ 1] 1687 	clr (RONLY,sp)
      001E02                       1688 cmd_dim2: 
      0099A9 A9 00 03         [ 4] 1689 0$:	call next_token 
      0099AC C7 00            [ 1] 1690 	cp a,#TK_LABEL  
      0099AE 0D CF            [ 1] 1691 	jreq 1$ 
      0099B0 00 0E 5B         [ 2] 1692 	jp syntax_error 
      0099B3 05 81            [ 2] 1693 1$: ldw (VAR_NAME,sp),x ; name pointer 
      0099B5 CD 13 86         [ 4] 1694 	call strlen
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      0099B5 52 05            [ 1] 1695 	add a,#REC_XTRA_BYTES
      0099B7 17 04            [ 1] 1696 	ld (REC_LEN+1,sp),a
      0099B9 CD 17 E3         [ 4] 1697 	call skip_string 
      0099B9 1F 02            [ 1] 1698 	ld a,(REC_LEN+1,sp)
      0099BB F6 A4            [ 2] 1699 	ldw x,(VAR_NAME,sp) 
      0099BD 0F 6B 01         [ 4] 1700 	call search_name  
      0099C0 16               [ 2] 1701 	tnzw x 
      0099C1 04 5C            [ 1] 1702 	jreq 2$
      0099C3 A6 08            [ 1] 1703 	ld a,#ERR_DUPLICATE
      0099C3 90 F6 27         [ 2] 1704 	jp tb_error  
      0099C6 1B 0D 01         [ 2] 1705 2$:	ldw x,dvar_end 
      0099C9 27 0A            [ 1] 1706 	ld a,(REC_LEN+1,sp)
      0099CB F1 26            [ 1] 1707 	or a,(RONLY,sp)
      0099CD 07               [ 1] 1708 	ld (x),a 
      0099CE 90               [ 1] 1709 	incw x 
      0099CF 5C 5C            [ 2] 1710 	pushw y 
      0099D1 0A 01            [ 2] 1711 	ldw y,(VAR_NAME+2,sp)
      0099D3 20 EE A2         [ 4] 1712 	call strcpy
      0099D5 90 85            [ 2] 1713 	popw y 
      0099D5 1E               [ 2] 1714 	decw x
      0099D6 02 1D 00         [ 2] 1715 	addw x,(REC_LEN,sp)
      0099D9 02 4B 00         [ 2] 1716 	ldw dvar_end,x 
      0099DC FE 84 27         [ 2] 1717 	subw x,#CELL_SIZE  
      0099DF 1D               [ 1] 1718 	clr (x)
      0099E0 20 D7            [ 1] 1719 	clr (1,x)  
      0099E2 6F 02            [ 1] 1720 	clr (2,x)
      0099E2 1E 02 F6         [ 4] 1721 4$: call next_token 
      0099E5 6B 01            [ 1] 1722 	cp a,#TK_COMMA 
      0099E7 A4 0F            [ 1] 1723 	jreq 0$ 
      0099E9 4C C7            [ 1] 1724 	cp a,#TK_EQUAL 
      0099EB 00 0F            [ 1] 1725 	jrne 8$
                                   1726 ; initialize variable 
      0099ED 72 5F 00         [ 4] 1727 	call condition 
      0099F0 0E 72            [ 1] 1728 	cp a,#TK_INTGR
      0099F2 BB 00            [ 1] 1729 	jreq 5$
      0099F4 0E FE 7B         [ 2] 1730 	jp syntax_error
      0099F7 01 A4 F0         [ 2] 1731 5$: ldw x,dvar_end 
      0099FA 4E AB 80         [ 2] 1732 	subw x,#CELL_SIZE 
      0099FD CF 00 19         [ 2] 1733 	ldw ptr16,x 
      001E66                       1734 	_xpop 
      0099FD 5B 05            [ 1]    1     ld a,(y)
      0099FF 81               [ 1]    2     ldw x,y 
      009A00 EE 01            [ 2]    3     ldw x,(1,x)
      009A00 88 CD 98 4A      [ 2]    4     addw y,#CELL_SIZE 
      009A04 11 01 27 03      [ 4] 1735 	ld [ptr16],a 
      009A08 CC 96 E6 84      [ 1] 1736 	inc ptr8 
      009A0C 81 CF 00 19      [ 5] 1737 	ldw [ptr16],x 
      009A0D 20 CB            [ 2] 1738 	jra 4$ 
      001E7D                       1739 8$:	
      001E7D                       1740 	_unget_token 	
      009A0D A6 06 CD 9A 00   [ 1]    1      mov in,in.saved  
      009A12                       1741 	_drop VSIZE 
      009A12 4B 00            [ 2]    1     addw sp,#VSIZE 
      009A14 CD 9C 6F         [ 4] 1742 	call ubound 
      009A17 4D               [ 4] 1743 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                   1744 
                                   1745 
                                   1746 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1747 ; return program size 
                                   1748 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E88                       1749 prog_size:
      009A18 27 12 0C         [ 2] 1750 	ldw x,txtend 
      009A1B 01 CD 98 4A      [ 2] 1751 	subw x,txtbgn 
      009A1F A1               [ 4] 1752 	ret 
                                   1753 
                                   1754 ;----------------------------
                                   1755 ; print program information 
                                   1756 ;---------------------------
      001E90                       1757 program_info: 
      009A20 08 27 F1         [ 2] 1758 	ldw x,#PROG_ADDR 
      009A23 A1 07 27         [ 4] 1759 	call puts 
      009A26 05 55 00         [ 2] 1760 	ldw x,txtbgn 
      009A29 03 00 02 84      [ 1] 1761 	mov base,#16 
      009A2D 81 18 12         [ 4] 1762 	call prt_i16
      009A2E 35 0A 00 0A      [ 1] 1763 	mov base,#10  
      009A2E CD 9A 0D         [ 2] 1764 	ldw x,#PROG_SIZE
      009A31 A1 01 27         [ 4] 1765 	call puts 
      009A34 03 CC 96         [ 4] 1766 	call prog_size 
      009A37 E6 90 F6         [ 4] 1767 	call prt_i16 
      009A3A 93 EE 01         [ 2] 1768 	ldw x,#STR_BYTES 
      009A3D 72 A9 00         [ 4] 1769 	call puts
      009A40 03 C3 00         [ 2] 1770 	ldw x,txtbgn
      009A43 21 23 05         [ 2] 1771 	cpw x,#app 
      009A46 A6 0A            [ 1] 1772 	jrult 2$
      009A48 CC 96 E8         [ 2] 1773 	ldw x,#FLASH_MEM 
      009A4B 5D 27            [ 2] 1774 	jra 3$
      009A4D F8 89 58         [ 2] 1775 2$: ldw x,#RAM_MEM 	 
      009A50 72 FB 01         [ 4] 1776 3$:	call puts 
      009A53 1F 01            [ 1] 1777 	ld a,#CR 
      009A55 AE 16 90         [ 4] 1778 	call putc
      009A58 72               [ 4] 1779 	ret 
                                   1780 
      009A59 F0 01 5B 02 81 61 6D  1781 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A5E 2C 20 70 72 6F 67 72  1782 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A5E 52 01 0F 01 CD 98 4A  1783 STR_BYTES: .asciz " bytes" 
      009A65 4D 26 03 CC 9B 10 A1  1784 FLASH_MEM: .asciz " in FLASH memory" 
             10 27 06 A1 11 26 05
             03 01 00
      009A75 20 69 6E 20 52 41 4D  1785 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1786 
                                   1787 
                                   1788 ;----------------------------
                                   1789 ; BASIC: LIST [[start][,end]]
                                   1790 ; list program lines 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   1791 ; form start to end 
                                   1792 ; if empty argument list then 
                                   1793 ; list all.
                                   1794 ;----------------------------
                           000001  1795 	FIRST=1
                           000003  1796 	LAST=3 
                           000005  1797 	LN_PTR=5
                           000006  1798 	VSIZE=6 
      001F19                       1799 list:
      009A75 CD 98 4A 22 05   [ 2] 1800 	btjf flags,#FRUN,0$
      009A78 A6 07            [ 1] 1801 	ld a,#ERR_CMD_ONLY
      009A78 4D 26 03         [ 2] 1802 	jp tb_error
      001F23                       1803 0$:	 
      009A7B CC 96 E6         [ 4] 1804 	call next_token 
      009A7E A1 04            [ 1] 1805 	cp a,#TK_CHAR 
      009A7E A1 81            [ 1] 1806 	jrne 2$
      009A80 26 0C FE         [ 4] 1807 	call get_char 
      009A83 72 5C            [ 1] 1808 	and a,#0xDF 
      009A85 00 02            [ 1] 1809 	cp a,#'C 
      009A87 72 5C            [ 1] 1810 	jrne 1$
      009A89 00 02 FD         [ 4] 1811 	call list_const
      009A8C 20               [ 4] 1812 	ret 
      009A8D 70 16 66         [ 2] 1813 1$: jp syntax_error 
      009A8E                       1814 2$:	_unget_token 
      009A8E A1 84 26 05 CD   [ 1]    1      mov in,in.saved  
      009A93 98 7C 20         [ 4] 1815 	call prog_size 
      009A96 67 01            [ 1] 1816 	jrugt 3$
      009A97 81               [ 4] 1817 	ret 
      001F45                       1818 3$: _vars VSIZE
      009A97 A1 05            [ 2]    1     sub sp,#VSIZE 
      009A99 26 05 CD         [ 2] 1819 	ldw x,txtbgn 
      009A9C 9A 2E            [ 2] 1820 	ldw (LN_PTR,sp),x 
      009A9E 20               [ 2] 1821 	ldw x,(x) 
      009A9F 07 01            [ 2] 1822 	ldw (FIRST,sp),x ; list from first line 
      009AA0 AE 7F FF         [ 2] 1823 	ldw x,#MAX_LINENO ; biggest line number 
      009AA0 A1 85            [ 2] 1824 	ldw (LAST,sp),x 
      009AA2 26 08 CD         [ 4] 1825 	call arg_list
      009AA5 98               [ 1] 1826 	tnz a
      009AA6 72 31            [ 1] 1827 	jreq list_loop 
      009AA7 A1 02            [ 1] 1828 	cp a,#2 
      009AA7 F6 EE            [ 1] 1829 	jreq 4$
      009AA9 01 20            [ 1] 1830 	cp a,#1 
      009AAB 52 06            [ 1] 1831 	jreq first_line 
      009AAC CC 16 66         [ 2] 1832 	jp syntax_error 
      009AAC A1               [ 2] 1833 4$:	popw x 
      009AAD 03 26            [ 2] 1834 	ldw (LAST+2,sp),x 
      001F68                       1835 first_line:
      009AAF 1D               [ 2] 1836 	popw x
      009AB0 90 89            [ 2] 1837 	ldw (FIRST,sp),x 
      001F6B                       1838 lines_skip:
      009AB2 89 CD 98         [ 2] 1839 	ldw x,txtbgn
      009AB5 63 85            [ 2] 1840 2$:	ldw (LN_PTR,sp),x 
      009AB7 CD 94 06         [ 2] 1841 	cpw x,txtend 
      009ABA AB 05            [ 1] 1842 	jrpl list_exit 
      009ABC CD               [ 2] 1843 	ldw x,(x) ;line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009ABD 9E 17            [ 2] 1844 	cpw x,(FIRST,sp)
      009ABF 5D 26            [ 1] 1845 	jrpl list_loop 
      009AC1 04 90            [ 2] 1846 	ldw x,(LN_PTR,sp) 
      009AC3 85 20            [ 1] 1847 	ld a,(2,x)
      009AC5 30 00 0E         [ 1] 1848 	ld acc8,a 
      009AC6 72 5F 00 0D      [ 1] 1849 	clr acc16 
      009AC6 90 85 CD 9D      [ 2] 1850 	addw x,acc16
      009ACA 71 20            [ 2] 1851 	jra 2$ 
                                   1852 ; print loop
      001F8B                       1853 list_loop:
      009ACC 31 05            [ 2] 1854 	ldw x,(LN_PTR,sp)
      009ACD E6 02            [ 1] 1855 	ld a,(2,x) 
      009ACD A1 82 26         [ 4] 1856 	call prt_basic_line
      009AD0 0E FE            [ 2] 1857 	ldw x,(LN_PTR,sp)
      009AD2 72 5C            [ 1] 1858 	ld a,(2,x)
      009AD4 00 02 72         [ 1] 1859 	ld acc8,a 
      009AD7 5C 00 02 FD      [ 1] 1860 	clr acc16 
      009ADB 5F 02 20 1F      [ 2] 1861 	addw x,acc16
      009ADF C3 00 1D         [ 2] 1862 	cpw x,txtend 
      009ADF A1 06            [ 1] 1863 	jrpl list_exit
      009AE1 26 13            [ 2] 1864 	ldw (LN_PTR,sp),x
      009AE3 CD               [ 2] 1865 	ldw x,(x)
      009AE4 9B 56            [ 2] 1866 	cpw x,(LAST,sp)  
      009AE6 A6 07            [ 1] 1867 	jrslt list_loop
      001FAD                       1868 list_exit:
      009AE8 CD 9A 00 90 F6   [ 1] 1869 	mov in,count 
      009AED 93 EE 01         [ 2] 1870 	ldw x,#pad 
      009AF0 72 A9 00         [ 2] 1871 	ldw basicptr,x 
      001FB8                       1872 	_drop VSIZE 
      009AF3 03 20            [ 2]    1     addw sp,#VSIZE 
      009AF5 08 1E 90         [ 4] 1873 	call program_info 
      009AF6 81               [ 4] 1874 	ret
                                   1875 
                                   1876 
                                   1877 ;--------------------------
                                   1878 ; BASIC: EDIT 
                                   1879 ;  copy program in FLASH 
                                   1880 ;  to RAM for edition 
                                   1881 ;-------------------------
      001FBE                       1882 edit:
      009AF6 55 00 03         [ 4] 1883 	call qsign 
      009AF9 00 02            [ 1] 1884 	jreq 1$ 
      009AFB 4F 20 12         [ 2] 1885 	ldw x,#NOT_SAVED 
      009AFE CD 09 68         [ 4] 1886 	call puts 
      009AFE 0D               [ 4] 1887 	ret 
      001FCA                       1888 1$: 
      009AFF 01 27 03 CD      [ 2] 1889 	ldw y,#app_sign ; source address 
      009B03 82 90 02         [ 2] 1890     ldw x,app_size  
      009B05 1C 00 04         [ 2] 1891 	addw x,#4 
      009B05 72 A2 00         [ 2] 1892 	ldw acc16,x  ; bytes to copy 
      009B08 03 90 F7         [ 2] 1893 	ldw x,#rsign ; destination address 
      009B0B 90 EF 01         [ 4] 1894 	call move  
      009B0E A6 84 90         [ 2] 1895 	ldw x,#free_ram 
      009B10 CF 00 1B         [ 2] 1896 	ldw txtbgn,x 
      009B10 5B 01 81 8E      [ 2] 1897 	addw x,rsize  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B13 CF 00 1D         [ 2] 1898 	ldw txtend,x 
      009B13 52               [ 4] 1899 	ret 
                                   1900 
      009B14 01 CD 9A 5E 4D 27 38  1901 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1902 
                                   1903 
                                   1904 ;--------------------------
                                   1905 ; decompile line from token list
                                   1906 ; and print it. 
                                   1907 ; input:
                                   1908 ;   A       stop at this position 
                                   1909 ;   X 		pointer at line
                                   1910 ; output:
                                   1911 ;   none 
                                   1912 ;--------------------------	
      009B1B                       1913 prt_basic_line:
      009B1B CD 98            [ 2] 1914 	pushw y 
      009B1D 4A 6B 01         [ 1] 1915 	ld count,a 
      009B20 A4 30            [ 1] 1916 	ld a,(2,x)
      009B22 A1 20 27         [ 1] 1917 	cp a,count 
      009B25 09 A6            [ 1] 1918 	jrpl 1$ 
      009B27 84 55 00         [ 1] 1919 	ld count,a 
      009B2A 03 00 02         [ 2] 1920 1$:	ldw basicptr,x 
      009B2D 20 24 16 90      [ 2] 1921 	ldw y,#tib  
      009B2F CD 11 A2         [ 4] 1922 	call decompile 
      009B2F CD 9A 5E         [ 4] 1923 	call puts 
      009B32 4D 26            [ 1] 1924 	ld a,#CR 
      009B34 03 CC 96         [ 4] 1925 	call putc 
      009B37 E6 85            [ 2] 1926 	popw y 
      009B38 81               [ 4] 1927 	ret 
                                   1928 
                                   1929 
                                   1930 ;---------------------------------
                                   1931 ; BASIC: PRINT|? arg_list 
                                   1932 ; print values from argument list
                                   1933 ;----------------------------------
                           000001  1934 	CCOMMA=1
                           000001  1935 	VSIZE=1
      002026                       1936 print:
      002026                       1937 	_vars VSIZE 
      009B38 7B 01            [ 2]    1     sub sp,#VSIZE 
      002028                       1938 reset_comma:
      009B3A A1 20            [ 1] 1939 	clr (CCOMMA,sp)
      00202A                       1940 prt_loop:
      009B3C 26 05 CD         [ 4] 1941 	call next_token
      009B3F 82 F4            [ 1] 1942 	cp a,#CMD_END 
      009B41 20 D8            [ 1] 1943 	jrult 0$
      009B43 A1 21            [ 1] 1944 	cp a,#TK_COLON 
      009B45 26 05            [ 1] 1945 	jreq 0$
      009B47 CD 83            [ 1] 1946 	cp a,#TK_CMD
      009B49 82 20            [ 1] 1947 	jrne 10$
      002039                       1948 0$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      002039                       1949 	_unget_token 
      009B4B CF 00 02 00 01   [ 1]    1      mov in,in.saved  
      009B4C 20 63            [ 2] 1950 	jra 8$ 
      002040                       1951 10$:	
      009B4C CD 84            [ 1] 1952 	cp a,#TK_QSTR
      009B4E 1C 20            [ 1] 1953 	jreq 1$
      009B50 CA 04            [ 1] 1954 	cp a,#TK_CHAR 
      009B51 27 1B            [ 1] 1955 	jreq 2$ 
      009B51 A6 84            [ 1] 1956 	cp a,#TK_CFUNC 
      009B53 27 1F            [ 1] 1957 	jreq 3$
      009B53 5B 01            [ 1] 1958 	cp a,#TK_COMMA 
      009B55 81 2A            [ 1] 1959 	jreq 4$
      009B56 A1 09            [ 1] 1960 	cp a,#TK_SHARP 
      009B56 52 01            [ 1] 1961 	jreq 5$
      009B58 CD 9B            [ 2] 1962 	jra 7$ 
      002056                       1963 1$:	; print string 
      009B5A 13 4D 27         [ 4] 1964 	call puts
      009B5D 2D               [ 1] 1965 	incw x
      009B5E 72 B0 00 04      [ 2] 1966 	subw x,basicptr 
      009B5E CD 98 4A         [ 2] 1967 	ldw in.w,x  
      009B61 6B 01            [ 2] 1968 	jra reset_comma
      002063                       1969 2$:	; print character 
      009B63 A4 30 A1         [ 4] 1970 	call get_char 
      009B66 10 27 09         [ 4] 1971 	call putc 
      009B69 55 00            [ 2] 1972 	jra reset_comma 
      00206B                       1973 3$: ; print character function value  	
      00206B                       1974 	_get_code_addr 
      009B6B 03               [ 2]    1         ldw x,(x)
      009B6C 00 02 A6 84      [ 1]    2         inc in 
      009B70 20 19 00 01      [ 1]    3         inc in 
      009B72 FD               [ 4] 1975 	call (x)
      009B72 CD 9B 13         [ 4] 1976 	call putc
      009B75 4D 26            [ 2] 1977 	jra reset_comma 
      00207A                       1978 4$: ; set comma state 
      009B77 03 CC            [ 1] 1979 	cpl (CCOMMA,sp)
      009B79 96 E6            [ 2] 1980 	jra prt_loop   
      009B7B                       1981 5$: ; # character must be followed by an integer   
      009B7B 7B 01 A1         [ 4] 1982 	call next_token
      009B7E 10 26            [ 1] 1983 	cp a,#TK_INTGR 
      009B80 05 CD            [ 1] 1984 	jreq 6$
      009B82 81 F9 20         [ 2] 1985 	jp syntax_error 
      002088                       1986 6$: ; set tab width
      009B85 D8 17 FC         [ 4] 1987 	call get_int24 
      009B86 9F               [ 1] 1988 	ld a,xl 
      009B86 CD 82            [ 1] 1989 	and a,#15 
      009B88 16 20 D3         [ 1] 1990 	ld tab_width,a 
      009B8B 20 95            [ 2] 1991 	jra reset_comma 
      002093                       1992 7$:	
      002093                       1993 	_unget_token 
      009B8B 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009B8E CD 1B EF         [ 4] 1994 	call condition
      009B8E 52               [ 1] 1995 	tnz a 
      009B8F 01 CD            [ 1] 1996 	jreq 8$    
      009B91 9B 56 4D         [ 4] 1997     call print_top
      009B94 27 54            [ 2] 1998 	jra reset_comma 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      0020A3                       1999 8$:
      009B96 CD 98            [ 1] 2000 	tnz (CCOMMA,sp)
      009B98 4A 6B            [ 1] 2001 	jrne 9$
      009B9A 01 A4            [ 1] 2002 	ld a,#CR 
      009B9C 30 A1 30         [ 4] 2003     call putc 
      0020AC                       2004 9$:	_drop VSIZE 
      009B9F 27 09            [ 2]    1     addw sp,#VSIZE 
      009BA1 A6               [ 4] 2005 	ret 
                                   2006 
                                   2007 ;----------------------
                                   2008 ; 'save_context' and
                                   2009 ; 'rest_context' must be 
                                   2010 ; called at the same 
                                   2011 ; call stack depth 
                                   2012 ; i.e. SP must have the 
                                   2013 ; save value at  
                                   2014 ; entry point of both 
                                   2015 ; routine. 
                                   2016 ;---------------------
                           000004  2017 	CTXT_SIZE=4 ; size of saved data 
                                   2018 ;--------------------
                                   2019 ; save current BASIC
                                   2020 ; interpreter context 
                                   2021 ; on stack 
                                   2022 ;--------------------
      0020AF                       2023 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0020AF                       2024 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0020AF                       2025 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0020AF                       2026 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0020AF                       2027 save_context:
      009BA2 84 55 00         [ 2] 2028 	ldw x,basicptr 
      009BA5 03 00            [ 2] 2029 	ldw (BPTR,sp),x
      009BA7 02 20 40         [ 1] 2030 	ld a,in 
      009BAA 6B 05            [ 1] 2031 	ld (IN,sp),a
      009BAA CD 9B 56         [ 1] 2032 	ld a,count 
      009BAD 4D 26            [ 1] 2033 	ld (CNT,sp),a  
      009BAF 03               [ 4] 2034 	ret
                                   2035 
                                   2036 ;-----------------------
                                   2037 ; restore previously saved 
                                   2038 ; BASIC interpreter context 
                                   2039 ; from stack 
                                   2040 ;-------------------------
      0020BF                       2041 rest_context:
      009BB0 CC 96            [ 2] 2042 	ldw x,(BPTR,sp)
      009BB2 E6 00 04         [ 2] 2043 	ldw basicptr,x 
      009BB3 7B 05            [ 1] 2044 	ld a,(IN,sp)
      009BB3 CD 82 33         [ 1] 2045 	ld in,a
      009BB6 90 F6            [ 1] 2046 	ld a,(CNT,sp)
      009BB8 93 EE 01         [ 1] 2047 	ld count,a  
      009BBB 72               [ 4] 2048 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2049 
                                   2050 
                                   2051 
                                   2052 ;------------------------------------------
                                   2053 ; BASIC: INPUT [string]var[,[string]var]
                                   2054 ; input value in variables 
                                   2055 ; [string] optionally can be used as prompt 
                                   2056 ;-----------------------------------------
                           000001  2057 	CX_BPTR=1
                           000003  2058 	CX_IN=3
                           000004  2059 	CX_CNT=4
                           000005  2060 	SKIP=5
                           000005  2061 	VSIZE=5
      0020CF                       2062 input_var:
      009BBC A9 00            [ 2] 2063 	pushw y 
      0020D1                       2064 	_vars VSIZE 
      009BBE 03 4D            [ 2]    1     sub sp,#VSIZE 
      0020D3                       2065 input_loop:
      009BC0 2B 08            [ 1] 2066 	clr (SKIP,sp)
      009BC2 26 0C 35         [ 4] 2067 	call next_token 
      009BC5 02 00            [ 1] 2068 	cp a,#TK_QSTR 
      009BC7 0F 20            [ 1] 2069 	jrne 1$ 
      009BC9 0A 09 68         [ 4] 2070 	call puts 
      009BCA 5C               [ 1] 2071 	incw x 
      009BCA 35 04 00 0F      [ 2] 2072 	subw x,basicptr 
      009BCE 20 04 00         [ 2] 2073 	ldw in.w,x 
      009BD0 03 05            [ 1] 2074 	cpl (SKIP,sp)
      009BD0 35 01 00         [ 4] 2075 	call next_token 
      009BD3 0F 85            [ 1] 2076 1$: cp a,#TK_VAR  
      009BD4 27 03            [ 1] 2077 	jreq 2$ 
      009BD4 5F C6 00         [ 2] 2078 	jp syntax_error
      009BD7 0F 14 01         [ 4] 2079 2$:	call get_addr
      009BDA 27 03 53         [ 2] 2080 	ldw ptr16,x 
      009BDD A6 FF            [ 1] 2081 	tnz (SKIP,sp)
      009BDF 72 A2            [ 1] 2082 	jrne 21$ 
      009BE1 00 03 90         [ 4] 2083 	call var_name 
      009BE4 F7 90 EF         [ 4] 2084 	call putc   
      002103                       2085 21$:
      009BE7 01 A6            [ 1] 2086 	ld a,#':
      009BE9 84 09 0B         [ 4] 2087 	call putc 
      009BEA CD 20 AF         [ 4] 2088 	call save_context 
      009BEA 5B 01 81 03      [ 1] 2089 	clr count  
      009BED CD 0A 6D         [ 4] 2090 	call readln 
      009BED 4B 00 CD         [ 2] 2091 	ldw x,#tib 
      009BF0 98 4A 4D         [ 1] 2092 	push count
      009BF3 27 25            [ 1] 2093 	push #0 
      009BF5 A1 87 26         [ 2] 2094 	addw x,(1,sp)
      009BF8 04               [ 1] 2095 	incw x 
      00211E                       2096 	_drop 2 
      009BF9 03 01            [ 2]    1     addw sp,#2 
      009BFB 20 F2 00 01      [ 1] 2097 	clr in 
      009BFD CD 0E E2         [ 4] 2098 	call get_token
      009BFD A1 06            [ 1] 2099 	cp a,#TK_INTGR
      009BFF 26 0A            [ 1] 2100 	jreq 3$ 
      009C01 CD 9C            [ 1] 2101 	cp a,#TK_MINUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C03 6F A6            [ 1] 2102 	jrne 22$
      009C05 07 CD 9A         [ 4] 2103 	call get_token 
      009C08 00 20            [ 1] 2104 	cp a,#TK_INTGR 
      009C0A 08 55            [ 1] 2105 	jreq 23$
      002136                       2106 22$:
      009C0C 00 03 00         [ 4] 2107 	call rest_context 
      009C0F 02 CD 9B         [ 2] 2108 	jp syntax_error
      00213C                       2109 23$:
      009C12 8E 02 18         [ 4] 2110 	call neg_acc24	
      009C13                       2111 3$: 
      009C13 0D 01 27         [ 1] 2112 	ld a,acc24 
      009C16 03 CD 82         [ 2] 2113 	ldw x,acc16 
      009C19 75 C7 00 19      [ 4] 2114 	ld [ptr16],a
      009C1A 72 5C 00 1A      [ 1] 2115 	inc ptr8  
      009C1A 5B 01 81 19      [ 5] 2116 	ldw [ptr16],x 
      009C1D CD 20 BF         [ 4] 2117 	call rest_context
      009C1D CD 9B ED         [ 4] 2118 	call next_token 
      009C20 4D 27            [ 1] 2119 	cp a,#TK_COMMA
      009C22 4B CD            [ 1] 2120 	jrne 4$ 
      009C24 98 4A 4D         [ 2] 2121 	jp input_loop
      00215E                       2122 4$:
      009C27 27 43            [ 1] 2123 	cp a,#TK_NONE 
      009C29 A1 88            [ 1] 2124 	jreq input_exit  
      009C2B 27 07            [ 1] 2125 	cp a,#TK_COLON 
      009C2D 55 00            [ 1] 2126     jreq input_exit 
      009C2F 03 00 02         [ 2] 2127 	jp syntax_error 
      002169                       2128 input_exit:
      002169                       2129 	_drop VSIZE 
      009C32 20 38            [ 2]    1     addw sp,#VSIZE 
      009C34 CD 9B            [ 2] 2130 	popw y 
      009C36 ED               [ 4] 2131 	ret 
                                   2132 
                                   2133 
                                   2134 ;---------------------
                                   2135 ; BASIC: REM | ' 
                                   2136 ; skip comment to end of line 
                                   2137 ;---------------------- 
      00216E                       2138 remark::
      009C37 4D 26 03 CC 96   [ 1] 2139 	mov in,count 
      009C3C E6               [ 4] 2140  	ret 
                                   2141 
                                   2142 
                                   2143 ;---------------------
                                   2144 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2145 ; read in loop 'addr'  
                                   2146 ; apply & 'mask' to value 
                                   2147 ; loop while result==0.  
                                   2148 ; 'xor_mask' is used to 
                                   2149 ; invert the wait logic.
                                   2150 ; i.e. loop while not 0.
                                   2151 ;---------------------
                           000001  2152 	XMASK=1 
                           000002  2153 	MASK=2
                           000003  2154 	ADDR=3
                           000004  2155 	VSIZE=4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009C3D                       2156 wait: 
      002174                       2157 	_vars VSIZE
      009C3D 90 F6            [ 2]    1     sub sp,#VSIZE 
      009C3F 93 EE            [ 1] 2158 	clr (XMASK,sp) 
      009C41 01 72 A9         [ 4] 2159 	call arg_list 
      009C44 00 03            [ 1] 2160 	cp a,#2
      009C46 C7 00            [ 1] 2161 	jruge 0$
      009C48 0D CF 00         [ 2] 2162 	jp syntax_error 
      009C4B 0E 90            [ 1] 2163 0$:	cp a,#3
      009C4D F6 93            [ 1] 2164 	jrult 1$
      002186                       2165 	_xpop  ; xor mask 
      009C4F EE 01            [ 1]    1     ld a,(y)
      009C51 72               [ 1]    2     ldw x,y 
      009C52 A9 00            [ 2]    3     ldw x,(1,x)
      009C54 03 C4 00 0D      [ 2]    4     addw y,#CELL_SIZE 
      009C58 02               [ 1] 2166 	ld a,xl 
      009C59 C4 00            [ 1] 2167 	ld (XMASK,sp),a 
      002192                       2168 1$: _xpop ; mask
      009C5B 0E 02            [ 1]    1     ld a,(y)
      009C5D C4               [ 1]    2     ldw x,y 
      009C5E 00 0F            [ 2]    3     ldw x,(1,x)
      009C60 02 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      009C64 03               [ 1] 2169     ld a,xl  
      009C65 90 F7            [ 1] 2170 	ld (MASK,sp),a 
      00219E                       2171 	_xpop ; address 
      009C67 90 EF            [ 1]    1     ld a,(y)
      009C69 01               [ 1]    2     ldw x,y 
      009C6A 20 B7            [ 2]    3     ldw x,(1,x)
      009C6C A6 84 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009C6F F6               [ 1] 2172 2$:	ld a,(x)
      009C6F 52 02            [ 1] 2173 	and a,(MASK,sp)
      009C71 CD 9C            [ 1] 2174 	xor a,(XMASK,sp)
      009C73 1D 4D            [ 1] 2175 	jreq 2$ 
      0021AE                       2176 	_drop VSIZE 
      009C75 27 69            [ 2]    1     addw sp,#VSIZE 
      009C77 CD               [ 4] 2177 	ret 
                                   2178 
                                   2179 ;---------------------
                                   2180 ; BASIC: BSET addr,mask
                                   2181 ; set bits at 'addr' corresponding 
                                   2182 ; to those of 'mask' that are at 1.
                                   2183 ; arguments:
                                   2184 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2185 ;   mask        mask|addr
                                   2186 ; output:
                                   2187 ;	none 
                                   2188 ;--------------------------
      0021B1                       2189 bit_set:
      009C78 98 4A A1         [ 4] 2190 	call arg_list 
      009C7B 89 27            [ 1] 2191 	cp a,#2	 
      009C7D 0B A1            [ 1] 2192 	jreq 1$ 
      009C7F 8A 27 07         [ 2] 2193 	jp syntax_error
      0021BB                       2194 1$: 
      0021BB                       2195 	_xpop ; mask 
      009C82 55 00            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009C84 03               [ 1]    2     ldw x,y 
      009C85 00 02            [ 2]    3     ldw x,(1,x)
      009C87 20 55 6B 02      [ 2]    4     addw y,#CELL_SIZE 
      009C8B CD               [ 1] 2196 	ld a,xl
      009C8C 9C               [ 1] 2197 	push a  
      0021C6                       2198 	_xpop ; addr  
      009C8D 1D A1            [ 1]    1     ld a,(y)
      009C8F 84               [ 1]    2     ldw x,y 
      009C90 27 03            [ 2]    3     ldw x,(1,x)
      009C92 CC 96 E6 03      [ 2]    4     addw y,#CELL_SIZE 
      009C95 84               [ 1] 2199 	pop a 
      009C95 90               [ 1] 2200 	or a,(x)
      009C96 F6               [ 1] 2201 	ld (x),a
      009C97 93               [ 4] 2202 	ret 
                                   2203 
                                   2204 ;---------------------
                                   2205 ; BASIC: BRES addr,mask
                                   2206 ; reset bits at 'addr' corresponding 
                                   2207 ; to those of 'mask' that are at 1.
                                   2208 ; arguments:
                                   2209 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2210 ;   mask	    ~mask&*addr  
                                   2211 ; output:
                                   2212 ;	none 
                                   2213 ;--------------------------
      0021D3                       2214 bit_reset:
      009C98 EE 01 72         [ 4] 2215 	call arg_list 
      009C9B A9 00            [ 1] 2216 	cp a,#2  
      009C9D 03 C7            [ 1] 2217 	jreq 1$ 
      009C9F 00 0D CF         [ 2] 2218 	jp syntax_error
      0021DD                       2219 1$: 
      0021DD                       2220 	_xpop ; mask 
      009CA2 00 0E            [ 1]    1     ld a,(y)
      009CA4 90               [ 1]    2     ldw x,y 
      009CA5 F6 93            [ 2]    3     ldw x,(1,x)
      009CA7 EE 01 72 A9      [ 2]    4     addw y,#CELL_SIZE 
      009CAB 00               [ 1] 2221 	ld a,xl 
      009CAC 03               [ 1] 2222 	cpl a
      009CAD 6B               [ 1] 2223 	push a  
      0021E9                       2224 	_xpop ; addr  
      009CAE 01 7B            [ 1]    1     ld a,(y)
      009CB0 02               [ 1]    2     ldw x,y 
      009CB1 A1 8A            [ 2]    3     ldw x,(1,x)
      009CB3 27 10 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CB5 84               [ 1] 2225 	pop a 
      009CB5 7B               [ 1] 2226 	and a,(x)
      009CB6 01               [ 1] 2227 	ld (x),a 
      009CB7 CA               [ 4] 2228 	ret 
                                   2229 
                                   2230 ;---------------------
                                   2231 ; BASIC: BTOGL addr,mask
                                   2232 ; toggle bits at 'addr' corresponding 
                                   2233 ; to those of 'mask' that are at 1.
                                   2234 ; arguments:
                                   2235 ; 	addr 		memory address RAM|PERIPHERAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2236 ;   mask	    mask^*addr  
                                   2237 ; output:
                                   2238 ;	none 
                                   2239 ;--------------------------
      0021F6                       2240 bit_toggle:
      009CB8 00 0D 02         [ 4] 2241 	call arg_list 
      009CBB CA 00            [ 1] 2242 	cp a,#2 
      009CBD 0E 02            [ 1] 2243 	jreq 1$ 
      009CBF CA 00 0F         [ 2] 2244 	jp syntax_error
      002200                       2245 1$: _xpop ; mask 
      009CC2 02 20            [ 1]    1     ld a,(y)
      009CC4 0E               [ 1]    2     ldw x,y 
      009CC5 EE 01            [ 2]    3     ldw x,(1,x)
      009CC5 7B 01 C8 00      [ 2]    4     addw y,#CELL_SIZE 
      009CC9 0D               [ 1] 2246 	ld a,xl
      009CCA 02               [ 1] 2247 	push a 
      00220B                       2248 	_xpop  ; addr  
      009CCB C8 00            [ 1]    1     ld a,(y)
      009CCD 0E               [ 1]    2     ldw x,y 
      009CCE 02 C8            [ 2]    3     ldw x,(1,x)
      009CD0 00 0F 02 72      [ 2]    4     addw y,#CELL_SIZE 
      009CD4 A2               [ 1] 2249 	pop a 
      009CD5 00               [ 1] 2250 	xor a,(x)
      009CD6 03               [ 1] 2251 	ld (x),a 
      009CD7 90               [ 4] 2252 	ret 
                                   2253 
                                   2254 
                                   2255 ;---------------------
                                   2256 ; BASIC: BTEST(addr,bit)
                                   2257 ; return bit value at 'addr' 
                                   2258 ; bit is in range {0..7}.
                                   2259 ; arguments:
                                   2260 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2261 ;   bit 	    bit position {0..7}  
                                   2262 ; output:
                                   2263 ;	A:X       bit value  
                                   2264 ;--------------------------
      002218                       2265 bit_test:
      009CD8 F7 90 EF         [ 4] 2266 	call func_args 
      009CDB 01 20            [ 1] 2267 	cp a,#2
      009CDD 99 A6            [ 1] 2268 	jreq 0$
      009CDF 84 5B 02         [ 2] 2269 	jp syntax_error
      002222                       2270 0$:	
      002222                       2271 	_xpop 
      009CE2 81 F6            [ 1]    1     ld a,(y)
      009CE3 93               [ 1]    2     ldw x,y 
      009CE3 35 10            [ 2]    3     ldw x,(1,x)
      009CE5 00 0B 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009CE8 9F               [ 1] 2272 	ld a,xl 
      009CE8 35 0A            [ 1] 2273 	and a,#7
      009CEA 00               [ 1] 2274 	push a   
      009CEB 0B 81            [ 1] 2275 	ld a,#1 
      009CED 0D 01            [ 1] 2276 1$: tnz (1,sp)
      009CED 4F AE            [ 1] 2277 	jreq 2$
      009CEF 16               [ 1] 2278 	sll a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009CF0 90 72            [ 1] 2279 	dec (1,sp)
      009CF2 B0 00            [ 2] 2280 	jra 1$
      009CF4 33 81            [ 1] 2281 2$: ld (1,sp),a  
      009CF6                       2282 	_xpop ; address  
      009CF6 3B 00            [ 1]    1     ld a,(y)
      009CF8 0B               [ 1]    2     ldw x,y 
      009CF9 AE 9F            [ 2]    3     ldw x,(1,x)
      009CFB 4F CD 89 E8      [ 2]    4     addw y,#CELL_SIZE 
      009CFF CE               [ 1] 2283 	pop a 
      009D00 00               [ 1] 2284 	and a,(x)
      009D01 1C 35            [ 1] 2285 	jreq 3$
      009D03 10 00            [ 1] 2286 	ld a,#1 
      009D05 0B               [ 1] 2287 3$:	clrw x 
      009D06 CD               [ 1] 2288 	ld xl,a
      009D07 98               [ 1] 2289 	clr a  
      009D08 92               [ 4] 2290 	ret
                                   2291 
                                   2292 ;--------------------
                                   2293 ; BASIC: POKE addr,byte
                                   2294 ; put a byte at addr 
                                   2295 ;--------------------
      00224F                       2296 poke:
      009D09 32 00 0B         [ 4] 2297 	call arg_list 
      009D0C AE 9F            [ 1] 2298 	cp a,#2
      009D0E 61 CD            [ 1] 2299 	jreq 1$
      009D10 89 E8 CE         [ 2] 2300 	jp syntax_error
      002259                       2301 1$:	
      002259                       2302 	_xpop ; byte   
      009D13 00 1E            [ 1]    1     ld a,(y)
      009D15 72               [ 1]    2     ldw x,y 
      009D16 B0 00            [ 2]    3     ldw x,(1,x)
      009D18 1C CD 98 92      [ 2]    4     addw y,#CELL_SIZE 
      009D1C AE               [ 1] 2303     ld a,xl 
      009D1D 9F               [ 1] 2304 	push a 
      002264                       2305 	_xpop ; address 
      009D1E 72 CD            [ 1]    1     ld a,(y)
      009D20 89               [ 1]    2     ldw x,y 
      009D21 E8 81            [ 2]    3     ldw x,(1,x)
      009D23 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D23 CD               [ 1] 2306 	pop a 
      009D24 9C               [ 1] 2307 	ld (x),a 
      009D25 ED               [ 4] 2308 	ret 
                                   2309 
                                   2310 ;-----------------------
                                   2311 ; BASIC: PEEK(addr)
                                   2312 ; get the byte at addr 
                                   2313 ; input:
                                   2314 ;	none 
                                   2315 ; output:
                                   2316 ;	X 		value 
                                   2317 ;-----------------------
      002270                       2318 peek:
      009D26 A6 03 62         [ 4] 2319 	call func_args
      009D29 CF 00            [ 1] 2320 	cp a,#1 
      009D2B 21 4F            [ 1] 2321 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D2D 81 16 66         [ 2] 2322 	jp syntax_error
      009D2E                       2323 1$: _xpop ; address  
      009D2E CD 98            [ 1]    1     ld a,(y)
      009D30 4A               [ 1]    2     ldw x,y 
      009D31 A1 85            [ 2]    3     ldw x,(1,x)
      009D33 27 0C A1 05      [ 2]    4     addw y,#CELL_SIZE 
      009D37 27 03 CC         [ 1] 2324 	ld farptr,a 
      009D3A 96 E6 19         [ 2] 2325 	ldw ptr16,x 
      009D3C 92 BC 00 18      [ 5] 2326 	ldf a,[farptr]
      009D3C CD               [ 1] 2327 	clrw x 
      009D3D 9A               [ 1] 2328 	ld xl,a 
      009D3E 2E               [ 1] 2329 	clr a 
      009D3F 20               [ 4] 2330 	ret 
                                   2331 
                                   2332 ;---------------------------
                                   2333 ; BASIC IF expr : instructions
                                   2334 ; evaluate expr and if true 
                                   2335 ; execute instructions on same line. 
                                   2336 ;----------------------------
      002291                       2337 if: 
      009D40 03 1B EF         [ 4] 2338 	call condition  
      009D41                       2339 	_xpop 
      009D41 CD 98            [ 1]    1     ld a,(y)
      009D43 72               [ 1]    2     ldw x,y 
      009D44 EE 01            [ 2]    3     ldw x,(1,x)
      009D44 CF 00 1A CD      [ 2]    4     addw y,#CELL_SIZE 
      009D48 98               [ 1] 2340 	tnz  a  
      009D49 4A A1            [ 1] 2341 	jrne 9$
      009D4B 32               [ 2] 2342 	tnzw x 
      009D4C 27 03            [ 1] 2343 	jrne 9$  
                                   2344 ;skip to next line
      009D4E CC 96 E6 00 01   [ 1] 2345 	mov in,count
      009D51                       2346 	_drop 2 
      009D51 CD 9C            [ 2]    1     addw sp,#2 
      009D53 6F A1 84         [ 2] 2347 	jp next_line
      009D56 27               [ 4] 2348 9$:	ret 
                                   2349 
                                   2350 ;------------------------
                                   2351 ; BASIC: FOR var=expr 
                                   2352 ; set variable to expression 
                                   2353 ; leave variable address 
                                   2354 ; on stack and set
                                   2355 ; FLOOP bit in 'flags'
                                   2356 ;-----------------
                           000001  2357 	RETL1=1 ; return address  
                           000003  2358 	FSTEP=3  ; variable increment int24
                           000006  2359 	LIMIT=6 ; loop limit, int24  
                           000009  2360 	CVAR=9   ; control variable 
                           00000B  2361 	INW=11   ;  in.w saved
                           00000D  2362 	BPTR=13 ; baseptr saved
                           00000D  2363 	VSIZE=13  
      0022AE                       2364 for: ; { -- var_addr }
      009D57 03               [ 2] 2365 	popw x ; call return address 
      0022AF                       2366 	_vars VSIZE 
      009D58 CC 96            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009D5A E6               [ 2] 2367 	pushw x  ; RETL1 
      009D5B A6 85            [ 1] 2368 	ld a,#TK_VAR 
      009D5B 90 F6 93         [ 4] 2369 	call expect
      009D5E EE 01 72         [ 4] 2370 	call get_addr
      009D61 A9 00            [ 2] 2371 	ldw (CVAR,sp),x  ; control variable 
      009D63 03 1C C4         [ 4] 2372 	call let_eval 
      009D64 72 14 00 22      [ 1] 2373 	bset flags,#FLOOP 
      009D64 72 C7 00         [ 4] 2374 	call next_token 
      009D67 1A 72            [ 1] 2375 	cp a,#TK_CMD 
      009D69 5C 00            [ 1] 2376 	jreq 1$
      009D6B 1B 72 CF         [ 2] 2377 	jp syntax_error
      0022CD                       2378 1$:  
      0022CD                       2379 	_get_code_addr
      009D6E 00               [ 2]    1         ldw x,(x)
      009D6F 1A 81 00 01      [ 1]    2         inc in 
      009D71 72 5C 00 01      [ 1]    3         inc in 
      009D71 F6 A4 0F         [ 2] 2380 	cpw x,#to   
      009D74 A0 03            [ 1] 2381 	jreq to
      009D76 88 4B 00         [ 2] 2382 	jp syntax_error 
                                   2383 
                                   2384 ;-----------------------------------
                                   2385 ; BASIC: TO expr 
                                   2386 ; second part of FOR loop initilization
                                   2387 ; leave limit on stack and set 
                                   2388 ; FTO bit in 'flags'
                                   2389 ;-----------------------------------
      0022DE                       2390 to: ; { var_addr -- var_addr limit step }
      009D79 72 FB 01 F6 EE   [ 2] 2391 	btjt flags,#FLOOP,1$
      009D7E 01 5B 02         [ 2] 2392 	jp syntax_error
      009D81 81 1A D6         [ 4] 2393 1$: call expression   
      009D82 A1 84            [ 1] 2394 	cp a,#TK_INTGR 
      009D82 90 89            [ 1] 2395 	jreq 2$ 
      009D84 52 04 5F         [ 2] 2396 	jp syntax_error
      0022F0                       2397 2$: _xpop
      009D87 1F 01            [ 1]    1     ld a,(y)
      009D89 90               [ 1]    2     ldw x,y 
      009D8A AE 40            [ 2]    3     ldw x,(1,x)
      009D8C 00 90 C3 00      [ 2]    4     addw y,#CELL_SIZE 
      009D90 25 24            [ 1] 2398 	ld (LIMIT,sp),a 
      009D92 35 17            [ 2] 2399 	ldw (LIMIT+1,sp),x
      009D94 03 93 5C         [ 4] 2400 	call next_token
      009D97 CD 89            [ 1] 2401 	cp a,#TK_NONE  
      009D99 E8 A6            [ 1] 2402 	jreq 4$ 
      009D9B 3D CD            [ 1] 2403 	cp a,#TK_CMD
      009D9D 89 8B            [ 1] 2404 	jrne 3$
      002308                       2405 	_get_code_addr
      009D9F 1E               [ 2]    1         ldw x,(x)
      009DA0 03 CD 9D 71      [ 1]    2         inc in 
      009DA4 C7 00 0D CF      [ 1]    3         inc in 
      009DA8 00 0E CD         [ 2] 2406 	cpw x,#step 
      009DAB 98 A9            [ 1] 2407 	jreq step
      002316                       2408 3$:	
      002316                       2409 	_unget_token   	 
      009DAD A6 0D CD 89 8B   [ 1]    1      mov in,in.saved  
      00231B                       2410 4$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009DB2 1E 01            [ 1] 2411 	clr (FSTEP,sp) 
      009DB4 5C 1F 01         [ 2] 2412 	ldw x,#1   ; default step  
      009DB7 72 5F            [ 2] 2413 	ldw (FSTEP+1,sp),x 
      009DB9 00 0E            [ 2] 2414 	jra store_loop_addr 
                                   2415 
                                   2416 
                                   2417 ;----------------------------------
                                   2418 ; BASIC: STEP expr 
                                   2419 ; optional third par of FOR loop
                                   2420 ; initialization. 	
                                   2421 ;------------------------------------
      002324                       2422 step: ; {var limit -- var limit step}
      009DBB 16 03 90 F6 C7   [ 2] 2423 	btjt flags,#FLOOP,1$
      009DC0 00 0F 72         [ 2] 2424 	jp syntax_error
      009DC3 B9 00 0E         [ 4] 2425 1$: call expression 
      009DC6 20 C5            [ 1] 2426 	cp a,#TK_INTGR
      009DC8 27 03            [ 1] 2427 	jreq 2$
      009DC8 1E 01 CD         [ 2] 2428 	jp syntax_error
      002336                       2429 2$:	
      002336                       2430 	_xpop 
      009DCB 98 92            [ 1]    1     ld a,(y)
      009DCD AE               [ 1]    2     ldw x,y 
      009DCE 9D D8            [ 2]    3     ldw x,(1,x)
      009DD0 CD 89 E8 5B      [ 2]    4     addw y,#CELL_SIZE 
      009DD4 04 90            [ 1] 2431 	ld (FSTEP,sp),a 
      009DD6 85 81            [ 2] 2432 	ldw (FSTEP+1,sp),x ; step
                                   2433 ; if step < 0 decrement LIMIT 
      009DD8 20               [ 1] 2434 	tnz a
      009DD9 63 6F            [ 1] 2435 	jrpl store_loop_addr 
      009DDB 6E 73            [ 1] 2436 	ld a,(LIMIT,sp)
      009DDD 74 61            [ 2] 2437 	ldw x,(LIMIT+1,sp)
      009DDF 6E 74 73         [ 2] 2438 	subw x,#1 
      009DE2 20 69            [ 1] 2439 	sbc a,#0 
      009DE4 6E 20            [ 1] 2440 	ld (LIMIT,sp),a 
      009DE6 45 45            [ 2] 2441 	ldw (LIMIT+1,sp),x 
                                   2442 ; leave loop back entry point on cstack 
                                   2443 ; cstack is 1 call deep from interpreter
      002353                       2444 store_loop_addr:
      009DE8 50 52 4F         [ 2] 2445 	ldw x,basicptr
      009DEB 4D 0A            [ 2] 2446 	ldw (BPTR,sp),x 
      009DED 00 00 00         [ 2] 2447 	ldw x,in.w 
      009DEE 1F 0B            [ 2] 2448 	ldw (INW,sp),x   
      009DEE AE 40 00 35      [ 1] 2449 	bres flags,#FLOOP 
      009DF2 08 00 0F A3      [ 1] 2450 	inc loop_depth  
      009DF6 47               [ 4] 2451 	ret 
                                   2452 
                                   2453 ;--------------------------------
                                   2454 ; BASIC: NEXT var 
                                   2455 ; FOR loop control 
                                   2456 ; increment variable with step 
                                   2457 ; and compare with limit 
                                   2458 ; loop if threshold not crossed.
                                   2459 ; else stack. 
                                   2460 ; and decrement 'loop_depth' 
                                   2461 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      002366                       2462 next: ; {var limit step retl1 -- [var limit step ] }
      009DF7 F8 24 17 F6      [ 1] 2463 	tnz loop_depth 
      009DFB 26 0C            [ 1] 2464 	jrne 1$ 
      009DFD 5C 72 5A         [ 2] 2465 	jp syntax_error 
      00236F                       2466 1$: 
      009E00 00 0F            [ 1] 2467 	ld a,#TK_VAR 
      009E02 26 F6 1D         [ 4] 2468 	call expect
      009E05 00 08 20         [ 4] 2469 	call get_addr 
                                   2470 ; check for good variable after NEXT 	 
      009E08 09 F6            [ 2] 2471 	cpw x,(CVAR,sp)
      009E0A 5C 4D            [ 1] 2472 	jreq 2$  
      009E0C 26 FB 5A         [ 2] 2473 	jp syntax_error ; not the good one 
      00237E                       2474 2$: 
      009E0F 20 E0 5F         [ 2] 2475 	ldw ptr16,x 
                                   2476 	; increment variable 
      009E12 4F               [ 1] 2477 	ld a,(x)
      009E13 CF 00            [ 2] 2478 	ldw x,(1,x)  ; get var value 
      009E15 25 81 04         [ 2] 2479 	addw x,(FSTEP+1,sp) ; var+step 
      009E17 19 03            [ 1] 2480 	adc a,(FSTEP,sp)
      009E17 90 89 52 08      [ 4] 2481 	ld [ptr16],a
      009E1B 72 5F 00 0E      [ 1] 2482 	inc ptr8  
      009E1F 6B 05 1F 01      [ 5] 2483 	ldw [ptr16],x 
      009E23 CE 00 33         [ 1] 2484 	ld acc24,a 
      009E26 1F 07 90         [ 2] 2485 	ldw acc16,x 
      009E29 CE 00            [ 1] 2486 	ld a,(LIMIT,sp)
      009E2B 31 17            [ 2] 2487 	ldw x,(LIMIT+1,sp)
      009E2D 03 93 13 07      [ 2] 2488 	subw x,acc16 
      009E31 24 20 90         [ 1] 2489 	sbc a,acc24
      009E34 F6 A4            [ 1] 2490 	xor a,(FSTEP,sp)
      009E36 0F 11            [ 1] 2491 	xor a,#0x80
      009E38 05 26            [ 1] 2492 	jrmi loop_back  
      009E3A 09 90            [ 2] 2493 	jra loop_done   
                                   2494 ; check sign of STEP  
      009E3C 5C 1E            [ 1] 2495 	ld a,(FSTEP,sp)
      009E3E 01 CD            [ 1] 2496 	jrpl 4$
                                   2497 ;negative step
      009E40 94 11 26         [ 1] 2498     ld a,acc8 
      009E43 13 07            [ 1] 2499 	jrslt loop_back   
      009E44 20 1A            [ 2] 2500 	jra loop_done  
      0023B9                       2501 4$: ; positive step
      009E44 16 03 90 F6 A4   [ 2] 2502 	btjt acc8,#7,loop_done 
      0023BE                       2503 loop_back:
      009E49 0F C7            [ 2] 2504 	ldw x,(BPTR,sp)
      009E4B 00 0F 72         [ 2] 2505 	ldw basicptr,x 
      009E4E B9 00 0E 20 D9   [ 2] 2506 	btjf flags,#FRUN,1$ 
      009E53 E6 02            [ 1] 2507 	ld a,(2,x)
      009E53 0F 03 0F         [ 1] 2508 	ld count,a
      009E56 04 0B            [ 2] 2509 1$:	ldw x,(INW,sp)
      009E57 CF 00 00         [ 2] 2510 	ldw in.w,x 
      009E57 1E               [ 4] 2511 	ret 
      0023D3                       2512 loop_done:
                                   2513 	; remove loop data from stack  
      009E58 03               [ 2] 2514 	popw x
      0023D4                       2515 	_drop VSIZE 
      009E59 5B 08            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009E5B 90 85 81 1F      [ 1] 2516 	dec loop_depth 
      009E5E FC               [ 2] 2517 	jp (x)
                                   2518 
                                   2519 ;----------------------------
                                   2520 ; called by goto/gosub
                                   2521 ; to get target line number 
                                   2522 ; output:
                                   2523 ;    x    line address 
                                   2524 ;---------------------------
      0023DB                       2525 get_target_line:
      009E5E 72 00 00         [ 4] 2526 	call next_token  
      009E61 23 05            [ 1] 2527 	cp a,#TK_INTGR
      009E63 A6 06            [ 1] 2528 	jreq get_target_line_addr 
      009E65 CC 96            [ 1] 2529 	cp a,#TK_LABEL 
      009E67 E8 26            [ 1] 2530 	jreq look_target_symbol 
      009E68 CC 16 66         [ 2] 2531 	jp syntax_error
                                   2532 ; the target is a line number 
                                   2533 ; search it. 
      0023E9                       2534 get_target_line_addr:
      009E68 52 05            [ 2] 2535 	pushw y 
      009E6A A6 80 6B         [ 4] 2536 	call get_int24 ; line # 
      009E6D 05               [ 1] 2537 	clr a
      009E6E 0F 03 20 10      [ 2] 2538 	ldw y,basicptr 
      009E72 90 FE            [ 2] 2539 	ldw y,(y)
      009E72 72 00            [ 2] 2540 	pushw y 
      009E74 00 23            [ 2] 2541 	cpw x,(1,sp)
      0023F9                       2542 	_drop 2  
      009E76 05 A6            [ 2]    1     addw sp,#2 
      009E78 06 CC            [ 1] 2543 	jrult 11$
      009E7A 96               [ 1] 2544 	inc a 
      0023FE                       2545 11$: ; scan program for this line# 	
      009E7B E8 0C 45         [ 4] 2546 	call search_lineno  
      009E7C 5D               [ 2] 2547 	tnzw x ; 0| line# address 
      009E7C 52 05            [ 1] 2548 	jrne 2$ 
      009E7E 0F 03            [ 1] 2549 	ld a,#ERR_NO_LINE 
      009E80 0F 05 68         [ 2] 2550 	jp tb_error 
      009E82 90 85            [ 2] 2551 2$:	popw y  
      009E82 CD               [ 4] 2552 	ret 
                                   2553 
                                   2554 ; the GOTO|GOSUB target is a symbol.
                                   2555 ; output:
                                   2556 ;    X    line address|0 
      00240C                       2557 look_target_symbol:
      009E83 98 4A            [ 2] 2558 	pushw y 
      009E85 A1               [ 2] 2559 	pushw x 
      009E86 03 27 03         [ 4] 2560 	call skip_string 
      009E89 CC 96 E6 1F      [ 1] 2561 	clr acc16 
      009E8D 01 CD 94 06      [ 2] 2562 	ldw y,txtbgn 
      009E91 AB 05 6B         [ 1] 2563 1$:	ld a,(3,y) ; first TK_ID on line 
      009E94 04 CD            [ 1] 2564 	cp a,#TK_LABEL 
      009E96 98 63            [ 1] 2565 	jreq 3$ 
      009E98 7B 04 1E         [ 1] 2566 2$:	ld a,(2,y); line length 
      009E9B 01 CD 9E         [ 1] 2567 	ld acc8,a 
      009E9E 17 5D 27 05      [ 2] 2568 	addw y,acc16 ;point to next line 
      009EA2 A6 08 CC 96      [ 2] 2569 	cpw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009EA6 E8 CE            [ 1] 2570 	jrult 1$
      009EA8 00 33            [ 1] 2571 	ld a,#ERR_BAD_VALUE
      009EAA 7B 04 1A         [ 2] 2572 	jp tb_error 
      002436                       2573 3$: ; found a TK_LABEL 
                                   2574 	; compare with GOTO|GOSUB target 
      009EAD 05 F7            [ 2] 2575 	pushw y ; line address 
      009EAF 5C 90 89 16      [ 2] 2576 	addw y,#4 ; label string 
      009EB3 03 CD            [ 2] 2577 	ldw x,(3,sp) ; target string 
      009EB5 94 22 90         [ 4] 2578 	call strcmp
      009EB8 85 5A            [ 1] 2579 	jrne 4$
      009EBA 72 FB            [ 2] 2580 	popw y 
      009EBC 03 CF            [ 2] 2581 	jra 2$ 
      002447                       2582 4$: ; target found 
      009EBE 00               [ 2] 2583 	popw x ;  address line target  
      002448                       2584 	_drop 2 ; target string 
      009EBF 33 1D            [ 2]    1     addw sp,#2 
      009EC1 00 03            [ 2] 2585 	popw y 
      009EC3 7F               [ 4] 2586 	ret
                                   2587 
                                   2588 
                                   2589 ;--------------------------------
                                   2590 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2591 ; selective goto or gosub 
                                   2592 ;--------------------------------
      00244D                       2593 cmd_on:
      009EC4 6F 01 6F 02 CD   [ 2] 2594 	btjt flags,#FRUN,0$ 
      009EC9 98 4A            [ 1] 2595 	ld a,#ERR_RUN_ONLY
      009ECB A1 08 27         [ 2] 2596 	jp tb_error 
      009ECE B3 A1 32         [ 4] 2597 0$:	call expression 
      009ED1 26 2A            [ 1] 2598 	cp a,#TK_INTGR
      009ED3 CD 9C            [ 1] 2599 	jreq 1$
      009ED5 6F A1 84         [ 2] 2600 	jp syntax_error
      002461                       2601 1$: _xpop
      009ED8 27 03            [ 1]    1     ld a,(y)
      009EDA CC               [ 1]    2     ldw x,y 
      009EDB 96 E6            [ 2]    3     ldw x,(1,x)
      009EDD CE 00 33 1D      [ 2]    4     addw y,#CELL_SIZE 
                                   2602 ; the selector is the element indice 
                                   2603 ; in the list of arguments. {1..#elements} 
      009EE1 00               [ 1] 2604 	ld a,xl ; keep only bits 7..0
      009EE2 03 CF            [ 1] 2605 	jreq 9$ ; element # begin at 1. 
      009EE4 00               [ 1] 2606 	push a  ; selector  
      009EE5 1A 90 F6         [ 4] 2607 	call next_token
      009EE8 93 EE            [ 1] 2608 	cp a,#TK_CMD 
      009EEA 01 72            [ 1] 2609 	jreq 2$ 
      009EEC A9 00 03         [ 2] 2610 	jp syntax_error 
      002478                       2611 2$: _get_code_addr
      009EEF 72               [ 2]    1         ldw x,(x)
      009EF0 C7 00 1A 72      [ 1]    2         inc in 
      009EF4 5C 00 1B 72      [ 1]    3         inc in 
                                   2612 ;; must be a GOTO or GOSUB 
      009EF8 CF 00 1A         [ 2] 2613 	cpw x,#goto 
      009EFB 20 CB            [ 1] 2614 	jreq 4$
      009EFD A3 24 F9         [ 2] 2615 	cpw x,#gosub 
      009EFD 55 00            [ 1] 2616 	jreq 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      009EFF 03 00 02         [ 2] 2617 	jp syntax_error 
      00248E                       2618 4$: 
      009F02 5B               [ 1] 2619 	pop a 
      009F03 05               [ 2] 2620 	pushw x ; save routine address 	
      009F04 CD               [ 1] 2621 	push a  ; selector  
      002491                       2622 5$: ; skip elements in list until selector==0 
      009F05 9D 23            [ 1] 2623 	dec (1,sp)
      009F07 81 26            [ 1] 2624 	jreq 6$ 
                                   2625 ; can be a line# or a label 
      009F08 CD 17 CA         [ 4] 2626 	call next_token 
      009F08 CE 00            [ 1] 2627 	cp a,#TK_INTGR 
      009F0A 1E 72            [ 1] 2628 	jreq 52$
      009F0C B0 00            [ 1] 2629 	cp a,#TK_LABEL 
      009F0E 1C 81            [ 1] 2630 	jreq 54$
      009F10 CC 16 66         [ 2] 2631 	jp syntax_error 
      0024A3                       2632 52$: ; got a line number 
      009F10 AE 9F 4F         [ 1] 2633 	ld a,in ; skip over int24 value 
      009F13 CD 89            [ 1] 2634 	add a,#CELL_SIZE ; integer size  
      009F15 E8 CE 00         [ 1] 2635 	ld in,a 
      009F18 1C 35            [ 2] 2636 	jra 56$
      009F1A 10 00 0B         [ 4] 2637 54$: call skip_string ; skip over label 	
      0024B0                       2638 56$: ; if another element comma present 
      009F1D CD 98 92         [ 4] 2639 	call next_token
      009F20 35 0A            [ 1] 2640 	cp a,#TK_COMMA 
      009F22 00 0B            [ 1] 2641 	jreq 5$ 
                                   2642 ; arg list exhausted, selector to big 
                                   2643 ; continue execution on next line 
      0024B7                       2644 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F24 AE 9F            [ 2]    1     addw sp,#3 
      009F26 61 CD            [ 2] 2645 	jra 9$
      0024BB                       2646 6$: ;at selected position  
      0024BB                       2647 	_drop 1 ; discard selector
      009F28 89 E8            [ 2]    1     addw sp,#1 
                                   2648 ; here only the routine address 
                                   2649 ; of GOTO|GOSUB is on stack 
      009F2A CD 9F 08         [ 4] 2650     call get_target_line
      009F2D CD 98 92         [ 2] 2651 	ldw ptr16,x 	
      009F30 AE 9F 72 CD 89   [ 1] 2652 	mov in,count ; move to end of line  
      009F35 E8               [ 2] 2653 	popw x ; cmd address, GOTO||GOSUB 
      009F36 CE 00 1C         [ 2] 2654 	cpw x,#goto 
      009F39 A3 B6            [ 1] 2655 	jrne 7$ 
      009F3B 84 25 05         [ 2] 2656 	ldw x,ptr16 
      009F3E AE 9F            [ 2] 2657 	jra jp_to_target
      0024D3                       2658 7$: 
      009F40 79 20            [ 2] 2659 	jra gosub_2 ; target in ptr16 
      0024D5                       2660 9$: ; expr out of range skip to end of line
                                   2661     ; this will force a fall to next line  
      009F42 03 AE 9F 8A CD   [ 1] 2662 	mov in,count
      0024DA                       2663 	_drop 2
      009F47 89 E8            [ 2]    1     addw sp,#2 
      009F49 A6 0D CD         [ 2] 2664 	jp next_line  
                                   2665 
                                   2666 
                                   2667 ;------------------------
                                   2668 ; BASIC: GOTO line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



                                   2669 ; jump to line# 
                                   2670 ; here cstack is 2 call deep from interpreter 
                                   2671 ;------------------------
      0024DF                       2672 goto:
      009F4C 89 8B 81 70 72   [ 2] 2673 	btjt flags,#FRUN,goto_1  
      009F51 6F 67            [ 1] 2674 	ld a,#ERR_RUN_ONLY
      009F53 72 61 6D         [ 2] 2675 	jp tb_error 
      0024E9                       2676 goto_1:
      009F56 20 61 64         [ 4] 2677 	call get_target_line
      0024EC                       2678 jp_to_target:
      009F59 64 72 65         [ 2] 2679 	ldw basicptr,x 
      009F5C 73 73            [ 1] 2680 	ld a,(2,x)
      009F5E 3A 20 00         [ 1] 2681 	ld count,a 
      009F61 2C 20 70 72      [ 1] 2682 	mov in,#3 
      009F65 6F               [ 4] 2683 	ret 
                                   2684 
                                   2685 
                                   2686 ;--------------------
                                   2687 ; BASIC: GOSUB line#
                                   2688 ; basic subroutine call
                                   2689 ; actual line# and basicptr 
                                   2690 ; are saved on cstack
                                   2691 ; here cstack is 2 call deep from interpreter 
                                   2692 ;--------------------
                           000001  2693 	RET_ADDR=1 ; subroutine return address 
                           000003  2694 	RET_BPTR=3 ; basicptr return point 
                           000005  2695 	RET_INW=5  ; in.w return point 
                           000004  2696 	VSIZE=4 
      0024F9                       2697 gosub:
      009F66 67 72 61 6D 20   [ 2] 2698 	btjt flags,#FRUN,gosub_1 
      009F6B 73 69            [ 1] 2699 	ld a,#ERR_RUN_ONLY
      009F6D 7A 65 3A         [ 2] 2700 	jp tb_error 
      009F70 20               [ 4] 2701 	ret 
      002504                       2702 gosub_1:
      009F71 00 20 62         [ 4] 2703 	call get_target_line 
      009F74 79 74 65         [ 2] 2704 	ldw ptr16,x
      00250A                       2705 gosub_2: 
      009F77 73               [ 2] 2706 	popw x 
      00250B                       2707 	_vars VSIZE  
      009F78 00 20            [ 2]    1     sub sp,#VSIZE 
      009F7A 69               [ 2] 2708 	pushw x ; RET_ADDR 
                                   2709 ; save BASIC subroutine return point.   
      009F7B 6E 20 46         [ 2] 2710 	ldw x,basicptr
      009F7E 4C 41            [ 2] 2711 	ldw (RET_BPTR,sp),x 
      009F80 53 48 20         [ 2] 2712 	ldw x,in.w 
      009F83 6D 65            [ 2] 2713 	ldw (RET_INW,sp),x
      009F85 6D 6F 72         [ 2] 2714 	ldw x,ptr16  
      009F88 79 00            [ 2] 2715 	jra jp_to_target
                                   2716 
                                   2717 ;------------------------
                                   2718 ; BASIC: RETURN 
                                   2719 ; exit from BASIC subroutine 
                                   2720 ;------------------------
      00251D                       2721 return:
      009F8A 20 69 6E 20 52   [ 2] 2722 	btjt flags,#FRUN,0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009F8F 41 4D            [ 1] 2723 	ld a,#ERR_RUN_ONLY
      009F91 20 6D 65         [ 2] 2724 	jp tb_error 
      002527                       2725 0$:	
      009F94 6D 6F            [ 2] 2726 	ldw x,(RET_BPTR,sp) 
      009F96 72 79 00         [ 2] 2727 	ldw basicptr,x
      009F99 E6 02            [ 1] 2728 	ld a,(2,x)
      009F99 72 01 00         [ 1] 2729 	ld count,a  
      009F9C 23 05            [ 2] 2730 	ldw x,(RET_INW,sp)
      009F9E A6 07 CC         [ 2] 2731 	ldw in.w,x 
      009FA1 96               [ 2] 2732 	popw x 
      002537                       2733 	_drop VSIZE 
      009FA2 E8 04            [ 2]    1     addw sp,#VSIZE 
      009FA3 FC               [ 2] 2734 	jp (x)
                                   2735 
                                   2736 
                                   2737 ;----------------------------------
                                   2738 ; BASIC: RUN
                                   2739 ; run BASIC program in RAM
                                   2740 ;----------------------------------- 
      00253A                       2741 run: 
      009FA3 CD 98 4A A1 04   [ 2] 2742 	btjf flags,#FRUN,0$  
      009FA8 26               [ 1] 2743 	clr a 
      009FA9 10               [ 4] 2744 	ret
      002541                       2745 0$: 
      009FAA CD 98 8C A4 DF   [ 2] 2746 	btjf flags,#FBREAK,1$
      002546                       2747 	_drop 2 
      009FAF A1 43            [ 2]    1     addw sp,#2 
      009FB1 26 04 CD         [ 4] 2748 	call rest_context
      00254B                       2749 	_drop CTXT_SIZE 
      009FB4 9D 82            [ 2]    1     addw sp,#CTXT_SIZE 
      009FB6 81 CC 96 E6      [ 1] 2750 	bres flags,#FBREAK 
      009FBA 55 00 03 00      [ 1] 2751 	bset flags,#FRUN 
      009FBE 02 CD 9F         [ 2] 2752 	jp interpreter 
      009FC1 08 22 01         [ 2] 2753 1$:	ldw x,txtbgn
      009FC4 81 52 06         [ 2] 2754 	cpw x,txtend 
      009FC7 CE 00            [ 1] 2755 	jrmi run_it 
      009FC9 1C 1F 05         [ 2] 2756 	ldw x,#err_no_prog
      009FCC FE 1F 01         [ 4] 2757 	call puts 
      009FCF AE 7F FF 1F 03   [ 1] 2758 	mov in,count
      009FD4 CD               [ 4] 2759 	ret 
      00256C                       2760 run_it:	 
      00256C                       2761 	_drop 2 ; drop return address 
      009FD5 9A 12            [ 2]    1     addw sp,#2 
      00256E                       2762 run_it_02: 
      009FD7 4D 27 31         [ 4] 2763     call ubound 
      009FDA A1 02 27         [ 4] 2764 	call clear_vars
                                   2765 ; initialize DIM variables pointers 
      009FDD 07 A1 01         [ 2] 2766 	ldw x,txtend 
      009FE0 27 06 CC         [ 2] 2767 	ldw dvar_bgn,x 
      009FE3 96 E6 85         [ 2] 2768 	ldw dvar_end,x 	 
                                   2769 ; clear data pointer 
      009FE6 1F               [ 1] 2770 	clrw x 
      009FE7 05 00 06         [ 2] 2771 	ldw data_ptr,x 
      009FE8 72 5F 00 08      [ 1] 2772 	clr data_ofs 
      009FE8 85 1F 01 09      [ 1] 2773 	clr data_len 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   2774 ; initialize BASIC pointer 
      009FEB CE 00 1B         [ 2] 2775 	ldw x,txtbgn 
      009FEB CE 00 1C         [ 2] 2776 	ldw basicptr,x 
      009FEE 1F 05            [ 1] 2777 	ld a,(2,x)
      009FF0 C3 00 1E         [ 1] 2778 	ld count,a
      009FF3 2A 38 FE 13      [ 1] 2779 	mov in,#3	
      009FF7 01 2A 11 1E      [ 1] 2780 	bset flags,#FRUN 
      009FFB 05 E6 02         [ 2] 2781 	jp interpreter 
                                   2782 
                                   2783 
                                   2784 ;----------------------
                                   2785 ; BASIC: END
                                   2786 ; end running program
                                   2787 ;---------------------- 
      00259F                       2788 cmd_end: 
                                   2789 ; clean stack 
      009FFE C7 00 0F         [ 2] 2790 	ldw x,#STACK_EMPTY
      00A001 72               [ 1] 2791 	ldw sp,x 
      00A002 5F 00 0E         [ 2] 2792 	jp warm_start
                                   2793 
                                   2794 ;---------------------------
                                   2795 ; BASIC: GET var 
                                   2796 ; receive a key in variable 
                                   2797 ; don't wait 
                                   2798 ;---------------------------
      0025A6                       2799 cmd_get:
      00A005 72 BB 00         [ 4] 2800 	call next_token 
      00A008 0E 20            [ 1] 2801 	cp a,#TK_VAR 
      00A00A E3 03            [ 1] 2802 	jreq 0$
      00A00B CC 16 66         [ 2] 2803 	jp syntax_error 
      00A00B 1E 05 E6         [ 4] 2804 0$: call get_addr 
      00A00E 02 CD A0         [ 2] 2805 	ldw ptr16,x 
      00A011 82 1E 05         [ 4] 2806 	call qgetc 
      00A014 E6 02            [ 1] 2807 	jreq 2$
      00A016 C7 00 0F         [ 4] 2808 	call getc  
      00A019 72 5F 00 0E      [ 4] 2809 2$: clr [ptr16]
      00A01D 72 BB 00 0E      [ 1] 2810 	inc ptr8 
      00A021 C3 00 1E 2A      [ 4] 2811 	clr [ptr16]
      00A025 07 1F 05 FE      [ 1] 2812 	inc ptr8 
      00A029 13 03 2F DE      [ 4] 2813 	ld [ptr16],a 
      00A02D 81               [ 4] 2814 	ret 
                                   2815 
                                   2816 
                                   2817 ;-----------------
                                   2818 ; 1 Khz beep 
                                   2819 ;-----------------
      0025D3                       2820 beep_1khz:: 
      00A02D 55 00            [ 2] 2821 	pushw y 
      00A02F 04 00 02         [ 2] 2822 	ldw x,#100
      00A032 AE 16 E0 CF      [ 2] 2823 	ldw y,#1000
      00A036 00 05            [ 2] 2824 	jra beep
                                   2825 
                                   2826 ;-----------------------
                                   2827 ; BASIC: TONE expr1,expr2
                                   2828 ; used TIMER2 channel 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2829 ; to produce a tone 
                                   2830 ; arguments:
                                   2831 ;    expr1   frequency 
                                   2832 ;    expr2   duration msec.
                                   2833 ;---------------------------
      0025DE                       2834 tone:
      00A038 5B 06            [ 2] 2835 	pushw y 
      00A03A CD 9F 10         [ 4] 2836 	call arg_list 
      00A03D 81 02            [ 1] 2837 	cp a,#2 
      00A03E 27 03            [ 1] 2838 	jreq 1$
      00A03E CD A8 8E         [ 2] 2839 	jp syntax_error 
      0025EA                       2840 1$: 
      0025EA                       2841 	_xpop 
      00A041 27 07            [ 1]    1     ld a,(y)
      00A043 AE               [ 1]    2     ldw x,y 
      00A044 A0 6B            [ 2]    3     ldw x,(1,x)
      00A046 CD 89 E8 81      [ 2]    4     addw y,#CELL_SIZE 
      00A04A 89               [ 2] 2842 	pushw x ; duration 
      0025F4                       2843 	_xpop ; frequency
      00A04A 90 AE            [ 1]    1     ld a,(y)
      00A04C B6               [ 1]    2     ldw x,y 
      00A04D 80 CE            [ 2]    3     ldw x,(1,x)
      00A04F B6 82 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      00A053 04 CF            [ 1] 2844 	ldw y,x ; frequency 
      00A055 00               [ 2] 2845 	popw x  ; duration 
      002600                       2846 beep:  
      00A056 0E               [ 2] 2847 	pushw x 
      00A057 AE 00 8C         [ 2] 2848 	ldw x,#TIM2_CLK_FREQ
      00A05A CD               [ 2] 2849 	divw x,y ; cntr=Fclk/freq 
                                   2850 ; round to nearest integer 
      00A05B 94 32 AE 00      [ 2] 2851 	cpw y,#TIM2_CLK_FREQ/2
      00A05F 90 CF            [ 1] 2852 	jrmi 2$
      00A061 00               [ 1] 2853 	incw x 
      00260C                       2854 2$:	 
      00A062 1C               [ 1] 2855 	ld a,xh 
      00A063 72 BB 00         [ 1] 2856 	ld TIM2_ARRH,a 
      00A066 8E               [ 1] 2857 	ld a,xl 
      00A067 CF 00 1E         [ 1] 2858 	ld TIM2_ARRL,a 
                                   2859 ; 50% duty cycle 
      00A06A 81               [ 1] 2860 	ccf 
      00A06B 4E               [ 2] 2861 	rrcw x 
      00A06C 6F               [ 1] 2862 	ld a,xh 
      00A06D 20 61 70         [ 1] 2863 	ld TIM2_CCR1H,a 
      00A070 70               [ 1] 2864 	ld a,xl
      00A071 6C 69 63         [ 1] 2865 	ld TIM2_CCR1L,a
      00A074 61 74 69 6F      [ 1] 2866 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A078 6E 20 73 61      [ 1] 2867 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A07C 76 65 64 2E      [ 1] 2868 	bset TIM2_EGR,#TIM2_EGR_UG
      00A080 0A               [ 2] 2869 	popw x 
      00A081 00 2A 6C         [ 4] 2870 	call pause02
      00A082 72 11 53 08      [ 1] 2871 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A082 90 89 C7 00      [ 1] 2872 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A086 04 E6            [ 2] 2873 	popw y 
      00A088 02               [ 4] 2874 	ret 
                                   2875 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2876 ;-------------------------------
                                   2877 ; BASIC: ADCON 0|1 [,divisor]  
                                   2878 ; disable/enanble ADC 
                                   2879 ;-------------------------------
                           000003  2880 	ONOFF=3 
                           000001  2881 	DIVSOR=1
                           000004  2882 	VSIZE=4 
      002639                       2883 power_adc:
      00A089 C1 00 04         [ 4] 2884 	call arg_list 
      00A08C 2A 03            [ 1] 2885 	cp a,#2	
      00A08E C7 00            [ 1] 2886 	jreq 1$
      00A090 04 CF            [ 1] 2887 	cp a,#1 
      00A092 00 05            [ 1] 2888 	jreq 0$ 
      00A094 90 AE 16         [ 2] 2889 	jp syntax_error 
      00A097 90               [ 1] 2890 0$:	clr a 
      00A098 CD               [ 1] 2891 	clrw x
      002649                       2892 	_xpush   ; divisor  
      00A099 92 22 CD 89      [ 2]    1     subw y,#CELL_SIZE
      00A09D E8 A6            [ 1]    2     ld (y),a 
      00A09F 0D CD 89         [ 2]    3     ldw (1,y),x 
      002652                       2893 1$: _at_next 
      00A0A2 8B 90 85         [ 1]    1     ld a,(3,y)
      00A0A5 81               [ 1]    2     ldw x,y 
      00A0A6 EE 04            [ 2]    3     ldw x,(4,x)
      00A0A6 52               [ 2] 2894 	tnzw x 
      00A0A7 01 25            [ 1] 2895 	jreq 2$ 
      00A0A8                       2896 	_xpop
      00A0A8 0F 01            [ 1]    1     ld a,(y)
      00A0AA 93               [ 1]    2     ldw x,y 
      00A0AA CD 98            [ 2]    3     ldw x,(1,x)
      00A0AC 4A A1 02 25      [ 2]    4     addw y,#CELL_SIZE 
      002664                       2897 	_xdrop  
      00A0B0 08 A1 0A 27      [ 2]    1     addw y,#CELL_SIZE 
      00A0B4 04               [ 1] 2898 	ld a,xl
      00A0B5 A1 80            [ 1] 2899 	and a,#7
      00A0B7 26               [ 1] 2900 	swap a 
      00A0B8 07 54 01         [ 1] 2901 	ld ADC_CR1,a
      00A0B9 72 16 50 CA      [ 1] 2902 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0B9 55 00 03 00      [ 1] 2903 	bset ADC_CR1,#ADC_CR1_ADON 
      002677                       2904 	_usec_dly 7 
      00A0BD 02 20 63         [ 2]    1     ldw x,#(16*7-2)/4
      00A0C0 5A               [ 2]    2     decw x
      00A0C0 A1               [ 1]    3     nop 
      00A0C1 02 27            [ 1]    4     jrne .-4
      00A0C3 12 A1            [ 2] 2905 	jra 3$
      00A0C5 04 27 1B A1      [ 1] 2906 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0C9 82 27 1F A1      [ 1] 2907 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002688                       2908 3$:	
      00A0CD 08               [ 4] 2909 	ret
                                   2910 
                                   2911 ;-----------------------------
                                   2912 ; BASIC: ADCREAD (channel)
                                   2913 ; read adc channel {0..5}
                                   2914 ; output:
                                   2915 ;   A 		TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   2916 ;   X 		value 
                                   2917 ;-----------------------------
      002689                       2918 analog_read:
      00A0CE 27 2A A1         [ 4] 2919 	call func_args 
      00A0D1 09 27            [ 1] 2920 	cp a,#1 
      00A0D3 2A 20            [ 1] 2921 	jreq 1$
      00A0D5 3D 16 66         [ 2] 2922 	jp syntax_error
      00A0D6                       2923 1$: _xpop 
      00A0D6 CD 89            [ 1]    1     ld a,(y)
      00A0D8 E8               [ 1]    2     ldw x,y 
      00A0D9 5C 72            [ 2]    3     ldw x,(1,x)
      00A0DB B0 00 05 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A0DF 00 01 20         [ 2] 2924 	cpw x,#5 
      00A0E2 C5 05            [ 2] 2925 	jrule 2$
      00A0E3 A6 0A            [ 1] 2926 	ld a,#ERR_BAD_VALUE
      00A0E3 CD 98 8C         [ 2] 2927 	jp tb_error 
      00A0E6 CD               [ 1] 2928 2$: ld a,xl
      00A0E7 89 8B 20         [ 1] 2929 	ld acc8,a 
      00A0EA BD 05            [ 1] 2930 	ld a,#5
      00A0EB C0 00 0E         [ 1] 2931 	sub a,acc8 
      00A0EB FE 72 5C         [ 1] 2932 	ld ADC_CSR,a
      00A0EE 00 02 72 5C      [ 1] 2933 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0F2 00 02 FD CD      [ 1] 2934 	bset ADC_CR1,#ADC_CR1_ADON
      00A0F6 89 8B 20 AE FB   [ 2] 2935 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0FA CE 54 04         [ 2] 2936 	ldw x,ADC_DRH
      00A0FA 03 01            [ 1] 2937 	ld a,#TK_INTGR
      00A0FC 20               [ 4] 2938 	ret 
                                   2939 
                                   2940 ;-----------------------
                                   2941 ; BASIC: DREAD(pin)
                                   2942 ; Arduino pins 
                                   2943 ; read state of a digital pin 
                                   2944 ; pin# {0..15}
                                   2945 ; output:
                                   2946 ;    A 		TK_INTGR
                                   2947 ;    X      0|1 
                                   2948 ;-------------------------
                           000001  2949 	PINNO=1
                           000001  2950 	VSIZE=1
      0026C5                       2951 digital_read:
      0026C5                       2952 	_vars VSIZE 
      00A0FD AC 01            [ 2]    1     sub sp,#VSIZE 
      00A0FE CD 19 8D         [ 4] 2953 	call func_args
      00A0FE CD 98            [ 1] 2954 	cp a,#1
      00A100 4A A1            [ 1] 2955 	jreq 1$
      00A102 84 27 03         [ 2] 2956 	jp syntax_error
      0026D1                       2957 1$: _xpop 
      00A105 CC 96            [ 1]    1     ld a,(y)
      00A107 E6               [ 1]    2     ldw x,y 
      00A108 EE 01            [ 2]    3     ldw x,(1,x)
      00A108 CD 98 7C 9F      [ 2]    4     addw y,#CELL_SIZE 
      00A10C A4 0F C7         [ 2] 2958 	cpw x,#15 
      00A10F 00 24            [ 2] 2959 	jrule 2$
      00A111 20 95            [ 1] 2960 	ld a,#ERR_BAD_VALUE
      00A113 CC 16 68         [ 2] 2961 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A113 55 00 03         [ 4] 2962 2$:	call select_pin 
      00A116 00 02            [ 1] 2963 	ld (PINNO,sp),a
      00A118 CD 9C            [ 1] 2964 	ld a,(GPIO_IDR,x)
      00A11A 6F 4D            [ 1] 2965 	tnz (PINNO,sp)
      00A11C 27 05            [ 1] 2966 	jreq 8$
      00A11E CD               [ 1] 2967 3$: srl a 
      00A11F 98 B7            [ 1] 2968 	dec (PINNO,sp)
      00A121 20 85            [ 1] 2969 	jrne 3$ 
      00A123 A4 01            [ 1] 2970 8$: and a,#1 
      00A123 0D               [ 1] 2971 	clrw x 
      00A124 01               [ 1] 2972 	ld xl,a 
      00A125 26               [ 1] 2973 	clr a 
      0026F9                       2974 	_drop VSIZE
      00A126 05 A6            [ 2]    1     addw sp,#VSIZE 
      00A128 0D               [ 4] 2975 	ret
                                   2976 
                                   2977 
                                   2978 ;-----------------------
                                   2979 ; BASIC: DWRITE pin,0|1
                                   2980 ; Arduino pins 
                                   2981 ; write to a digital pin 
                                   2982 ; pin# {0..15}
                                   2983 ; output:
                                   2984 ;    A 		TK_INTGR
                                   2985 ;    X      0|1 
                                   2986 ;-------------------------
                           000001  2987 	PINNO=1
                           000002  2988 	PINVAL=2
                           000002  2989 	VSIZE=2
      0026FC                       2990 digital_write:
      0026FC                       2991 	_vars VSIZE 
      00A129 CD 89            [ 2]    1     sub sp,#VSIZE 
      00A12B 8B 5B 01         [ 4] 2992 	call arg_list  
      00A12E 81 02            [ 1] 2993 	cp a,#2 
      00A12F 27 03            [ 1] 2994 	jreq 1$
      00A12F CE 00 05         [ 2] 2995 	jp syntax_error
      002708                       2996 1$: _xpop 
      00A132 1F 03            [ 1]    1     ld a,(y)
      00A134 C6               [ 1]    2     ldw x,y 
      00A135 00 02            [ 2]    3     ldw x,(1,x)
      00A137 6B 05 C6 00      [ 2]    4     addw y,#CELL_SIZE 
      00A13B 04               [ 1] 2997 	ld a,xl 
      00A13C 6B 06            [ 1] 2998 	ld (PINVAL,sp),a
      002714                       2999 	_xpop 
      00A13E 81 F6            [ 1]    1     ld a,(y)
      00A13F 93               [ 1]    2     ldw x,y 
      00A13F 1E 03            [ 2]    3     ldw x,(1,x)
      00A141 CF 00 05 7B      [ 2]    4     addw y,#CELL_SIZE 
      00A145 05 C7 00         [ 2] 3000 	cpw x,#15 
      00A148 02 7B            [ 2] 3001 	jrule 2$
      00A14A 06 C7            [ 1] 3002 	ld a,#ERR_BAD_VALUE
      00A14C 00 04 81         [ 2] 3003 	jp tb_error 
      00A14F CD 2B AF         [ 4] 3004 2$:	call select_pin 
      00A14F 90 89            [ 1] 3005 	ld (PINNO,sp),a 
      00A151 52 05            [ 1] 3006 	ld a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A153 0D 01            [ 1] 3007 	tnz (PINNO,sp)
      00A153 0F 05            [ 1] 3008 	jreq 4$
      00A155 CD               [ 1] 3009 3$: sll a
      00A156 98 4A            [ 1] 3010 	dec (PINNO,sp)
      00A158 A1 02            [ 1] 3011 	jrne 3$
      00A15A 26 10            [ 1] 3012 4$: tnz (PINVAL,sp)
      00A15C CD 89            [ 1] 3013 	jrne 5$
      00A15E E8               [ 1] 3014 	cpl a 
      00A15F 5C 72            [ 1] 3015 	and a,(GPIO_ODR,x)
      00A161 B0 00            [ 2] 3016 	jra 8$
      00A163 05 CF            [ 1] 3017 5$: or a,(GPIO_ODR,x)
      00A165 00 01            [ 1] 3018 8$: ld (GPIO_ODR,x),a 
      002744                       3019 	_drop VSIZE 
      00A167 03 05            [ 2]    1     addw sp,#VSIZE 
      00A169 CD               [ 4] 3020 	ret
                                   3021 
                                   3022 
                                   3023 ;-----------------------
                                   3024 ; BASIC: STOP
                                   3025 ; stop progam execution  
                                   3026 ; without resetting pointers 
                                   3027 ; the program is resumed
                                   3028 ; with RUN 
                                   3029 ;-------------------------
      002747                       3030 stop:
      00A16A 98 4A A1 85 27   [ 2] 3031 	btjt flags,#FRUN,2$
      00A16F 03               [ 1] 3032 	clr a
      00A170 CC               [ 4] 3033 	ret 
      00274E                       3034 2$:	 
                                   3035 ; create space on cstack to save context 
      00A171 96 E6 CD         [ 2] 3036 	ldw x,#break_point 
      00A174 98 72 CF         [ 4] 3037 	call puts 
      002754                       3038 	_drop 2 ;drop return address 
      00A177 00 1A            [ 2]    1     addw sp,#2 
      002756                       3039 	_vars CTXT_SIZE ; context size 
      00A179 0D 05            [ 2]    1     sub sp,#CTXT_SIZE 
      00A17B 26 06 CD         [ 4] 3040 	call save_context 
      00A17E 92 18 CD         [ 2] 3041 	ldw x,#tib 
      00A181 89 8B 04         [ 2] 3042 	ldw basicptr,x
      00A183 7F               [ 1] 3043 	clr (x)
      00A183 A6 3A CD 89      [ 1] 3044 	clr count  
      00A187 8B               [ 1] 3045 	clrw x 
      00A188 CD A1 2F         [ 2] 3046 	ldw in.w,x
      00A18B 72 5F 00 04      [ 1] 3047 	bres flags,#FRUN 
      00A18F CD 8A ED AE      [ 1] 3048 	bset flags,#FBREAK
      00A193 16 90 3B         [ 2] 3049 	jp interpreter 
      00A196 00 04 4B 00 72 FB 01  3050 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5C 5B 02 72 5F 00 02
             CD 8F 62 A1 84 27 14
             A1 11 26 07 CD 8F 62
             A1 84
                                   3051 
                                   3052 ;-----------------------
                                   3053 ; BASIC: NEW
                                   3054 ; from command line only 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3055 ; free program memory
                                   3056 ; and clear variables 
                                   3057 ;------------------------
      002793                       3058 new: 
      00A1B4 27 06 00 22 01   [ 2] 3059 	btjf flags,#FRUN,0$ 
      00A1B6 81               [ 4] 3060 	ret 
      002799                       3061 0$:	
      00A1B6 CD A1 3F         [ 4] 3062 	call clear_basic 
      00A1B9 CC               [ 4] 3063 	ret 
                                   3064 
                                   3065 ;-----------------------------------
                                   3066 ; BASIC: ERASE \E | \F 
                                   3067 ; erase all block in range from 
                                   3068 ;  'app_space' to FLASH end (0x20000)
                                   3069 ;  or all EEPROM 
                                   3070 ; that contains a non zero byte.  
                                   3071 ;-----------------------------------
                           000001  3072 	LIMIT=1 
                           000003  3073 	VSIZE = 3 
      00279D                       3074 erase:
      00A1BA 96 E6 00 18      [ 1] 3075 	clr farptr 
      00A1BC                       3076 	_vars VSIZE 
      00A1BC CD 82            [ 2]    1     sub sp,#VSIZE 
      00A1BE 98 17 CA         [ 4] 3077 	call next_token 
      00A1BF A1 04            [ 1] 3078 	cp a,#TK_CHAR 
      00A1BF C6 00            [ 1] 3079 	jreq 0$ 
      00A1C1 0D CE 00         [ 2] 3080 	jp syntax_error
      00A1C4 0E 72 C7         [ 4] 3081 0$: call get_char 
      00A1C7 00 1A            [ 1] 3082 	and a,#0XDF 
      00A1C9 72 5C            [ 1] 3083 	cp a,#'E
      00A1CB 00 1B            [ 1] 3084 	jrne 1$
      00A1CD 72 CF 00         [ 2] 3085 	ldw x,#EEPROM_BASE 
      00A1D0 1A CD A1         [ 2] 3086 	ldw farptr+1,x 
      00A1D3 3F CD 98         [ 2] 3087 	ldw x,#EEPROM_END
      00A1D6 4A               [ 1] 3088 	clr a 
      00A1D7 A1 08            [ 2] 3089 	jra 3$ 
      00A1D9 26 03            [ 1] 3090 1$: cp a,#'F 
      00A1DB CC A1            [ 1] 3091 	jreq 2$
      00A1DD 53 15 8A         [ 2] 3092 	ldw x,#err_bad_value
      00A1DE CC 16 68         [ 2] 3093 	jp tb_error
      0027CC                       3094 2$:
      00A1DE A1 00 27         [ 2] 3095 	ldw x,#app_space  
      00A1E1 07 A1 0A         [ 2] 3096 	ldw farptr+1,x 
      00A1E4 27 03            [ 1] 3097 	ld a,#(FLASH_END>>16)&0XFF 
      00A1E6 CC 96 E6         [ 2] 3098 	ldw x,#FLASH_END&0xffff
      00A1E9                       3099 3$:
      00A1E9 5B 05            [ 1] 3100 	ld (LIMIT,sp),a 
      00A1EB 90 85            [ 2] 3101 	ldw (LIMIT+1,sp),x 
                                   3102  ; operation done from RAM
                                   3103  ; copy code to RAM in tib   
      00A1ED 81 07 09         [ 4] 3104 	call move_erase_to_ram
      00A1EE                       3105 4$:	 
      00A1EE 55 00 04         [ 4] 3106     call scan_block 
      00A1F1 00 02            [ 1] 3107 	jreq 5$  ; block already erased 
      00A1F3 81 45            [ 1] 3108     ld a,#'E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A1F4 CD 09 0B         [ 4] 3109     call putc 
      00A1F4 52 04 0F         [ 4] 3110 	call block_erase   
                                   3111 ; this block is clean, next  
      00A1F7 01 CD 9A         [ 2] 3112 5$:	ldw x,#BLOCK_SIZE
      00A1FA 12 A1 02         [ 4] 3113 	call incr_farptr
                                   3114 ; check limit, 24 bit substraction  	
      00A1FD 24 03            [ 1] 3115 	ld a,(LIMIT,sp)
      00A1FF CC 96            [ 2] 3116 	ldw x,(LIMIT+1,sp)
      00A201 E6 A1 03 25      [ 2] 3117 	subw x,farptr+1
      00A205 0C 90 F6         [ 1] 3118 	sbc a,farptr 
      00A208 93 EE            [ 1] 3119 	jrugt 4$ 
      00A20A 01 72 A9         [ 4] 3120 9$: call clear_basic
      00A20D 00 03            [ 2] 3121 	ldw x,(LIMIT+1,sp)
      00A20F 9F 6B 01         [ 2] 3122 	cpw x,#EEPROM_END
      00A212 90 F6            [ 1] 3123 	jrne 10$
      00A214 93 EE 01         [ 4] 3124 	call func_eefree 
      00280B                       3125 10$:
      00280B                       3126 	_drop VSIZE 
      00A217 72 A9            [ 2]    1     addw sp,#VSIZE 
      00A219 00               [ 4] 3127 	ret 
                                   3128 	
                                   3129 
                                   3130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3131 ;  check for application signature 
                                   3132 ; output:
                                   3133 ;   Carry    0 app present 
                                   3134 ;            1 no app installed  
                                   3135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00280E                       3136 qsign: 
      00A21A 03 9F 6B         [ 2] 3137 	ldw x,app_sign 
      00A21D 02 90 F6         [ 2] 3138 	cpw x,SIGNATURE ; "TB" 
      00A220 93               [ 4] 3139 	ret 
                                   3140 
                                   3141 ;--------------------------------------
                                   3142 ;  fill write buffer 
                                   3143 ;  input:
                                   3144 ;    y  point to output buffer 
                                   3145 ;    x  point to source 
                                   3146 ;    a  bytes to write in buffer 
                                   3147 ;  output:
                                   3148 ;    y   += A 
                                   3149 ;    X   += A 
                                   3150 ;    A   0 
                                   3151 ;---------------------------------------
      002815                       3152 fill_write_buffer:
      00A221 EE               [ 1] 3153 	push a 
      00A222 01               [ 1] 3154 	tnz a 
      00A223 72 A9            [ 1] 3155 	jreq 9$ 
      00A225 00               [ 1] 3156 1$: ld a,(x)
      00A226 03               [ 1] 3157 	incw x 
      00A227 F6 14            [ 1] 3158 	ld (y),a 
      00A229 02 18            [ 1] 3159 	incw y 
      00A22B 01 27            [ 1] 3160 	dec (1,sp) 
      00A22D F9 5B            [ 1] 3161 	jrne 1$ 
      00A22F 04               [ 1] 3162 9$:	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A230 81               [ 4] 3163     ret 	
                                   3164 
                                   3165 ;--------------------------------------
                                   3166 ;  fill pad buffer with zero 
                                   3167 ;  input:
                                   3168 ;	none 
                                   3169 ;  output:
                                   3170 ;    y     buffer address  
                                   3171 ;--------------------------------------
      00A231                       3172 clear_block_buffer:
      00A231 CD               [ 1] 3173 	push a 
      00A232 9A 12 A1 02      [ 2] 3174 	ldw y,#block_buffer 
      00A236 27 03            [ 2] 3175 	pushw y
      00A238 CC 96            [ 1] 3176 	ld a,#BLOCK_SIZE   
      00A23A E6 7F            [ 1] 3177 1$:	clr (y)
      00A23B 90 5C            [ 1] 3178 	incw y
      00A23B 90               [ 1] 3179 	dec a  
      00A23C F6 93            [ 1] 3180 	jrne 1$ 	
      00A23E EE 01            [ 2] 3181 9$: popw y 
      00A240 72               [ 1] 3182 	pop a 			
      00A241 A9               [ 4] 3183 	ret 
                                   3184 
                                   3185 
                                   3186 ;---------------------------------------
                                   3187 ; BASIC: SAVE
                                   3188 ; write application from RAM to FLASH
                                   3189 ; at UFLASH address
                                   3190 ;--------------------------------------
                           000001  3191 	XTEMP=1
                           000003  3192 	COUNT=3  ; last count bytes written 
                           000004  3193 	CNT_LO=4 ; count low byte 
                           000005  3194 	TOWRITE=5 ; how bytes left to write  
                           000006  3195 	VSIZE=6 
      002839                       3196 save_app:
      00A242 00               [ 2] 3197 	pushw x 
      00A243 03 9F            [ 2] 3198 	pushw y 
      00283C                       3199 	_vars VSIZE
      00A245 88 90            [ 2]    1     sub sp,#VSIZE 
      00A247 F6 93 EE         [ 4] 3200 	call qsign 
      00A24A 01 72            [ 1] 3201 	jrne 1$
      00A24C A9 00 03         [ 2] 3202 	ldw x,#CANT_DO 
      00A24F 84 FA F7         [ 4] 3203 	call puts 
      00A252 81 28 C8         [ 2] 3204 	jp 9$
      00A253                       3205 1$: 
      00A253 CD 9A 12         [ 2] 3206 	ldw x,txtbgn
      00A256 A1 02 27         [ 2] 3207 	cpw x,txtend 
      00A259 03 CC            [ 1] 3208 	jrult 2$ 
      00A25B 96 E6 12         [ 2] 3209 	ldw x,#NO_APP
      00A25D CD 09 68         [ 4] 3210 	call puts 
      00A25D 90 F6 93         [ 2] 3211 	jp 9$
      00285D                       3212 2$: 
                                   3213 ; block programming flash
                                   3214 ; must be done from RAM
                                   3215 ; moved in tib  
      00A260 EE 01 72         [ 4] 3216 	call move_prg_to_ram
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3217 ; initialize farptr 
                                   3218 ; to app_sign address 
      00A263 A9 00 03 9F      [ 1] 3219 	clr farptr 
      00A267 43 88 90         [ 2] 3220 	ldw x,#app_sign 
      00A26A F6 93 EE         [ 2] 3221 	ldw farptr+1,x
                                   3222 ; initialize local variables 
      00A26D 01 72 A9         [ 4] 3223 	call prog_size
      00A270 00 03            [ 2] 3224 	ldw (TOWRITE,sp),x
      00A272 84 F4            [ 1] 3225 	clr (COUNT,sp)
                                   3226 ; first bock 
                                   3227 ; containt signature 2 bytes 
                                   3228 ; and size 	2 bytes 
                                   3229 ; use Y as pointer to block_buffer
      00A274 F7 81 25         [ 4] 3230 	call clear_block_buffer ; -- y=*block_buffer	
                                   3231 ; write signature
      00A276 CE 28 CE         [ 2] 3232 	ldw x,SIGNATURE ; "BC" 
      00A276 CD 9A            [ 2] 3233 	ldw (y),x 
      00A278 12 A1 02 27      [ 2] 3234 	addw y,#2
      00A27C 03 CC            [ 2] 3235 	ldw x,(TOWRITE,sp)
      00A27E 96 E6            [ 2] 3236 	ldw (y),x
      00A280 90 F6 93 EE      [ 2] 3237 	addw y,#2   
      00A284 01 72            [ 1] 3238 	ld a,#(BLOCK_SIZE-4)
      00A286 A9 00            [ 1] 3239 	ld (CNT_LO,sp),a 
      00A288 03 9F 88         [ 2] 3240 	cpw x,#(BLOCK_SIZE-4) 
      00A28B 90 F6            [ 1] 3241 	jrugt 3$
      00A28D 93               [ 1] 3242 	ld a,xl 
      00A28E EE 01            [ 1] 3243 3$:	ld (CNT_LO,sp),a   
      00A290 72 A9 00         [ 2] 3244 	ldw x,txtbgn 
      00A293 03 84            [ 2] 3245 	ldw (XTEMP,sp),x 
      002896                       3246 32$: 
      00A295 F8 F7            [ 2] 3247 	ldw x,(XTEMP,sp)
      00A297 81 04            [ 1] 3248 	ld a,(CNT_LO,sp)
      00A298 CD 28 15         [ 4] 3249 	call fill_write_buffer 
      00A298 CD 9A            [ 2] 3250 	ldw (XTEMP,sp),x 
      00A29A 0D A1 02         [ 2] 3251 	ldw x,#block_buffer
      00A29D 27 03 CC         [ 4] 3252 	call write_buffer
      00A2A0 96 E6 80         [ 2] 3253 	ldw x,#BLOCK_SIZE 
      00A2A2 CD 08 7D         [ 4] 3254 	call incr_farptr  
                                   3255 ; following blocks 
      00A2A2 90 F6            [ 2] 3256 	ldw x,(XTEMP,sp)
      00A2A4 93 EE 01         [ 2] 3257 	cpw x,txtend 
      00A2A7 72 A9            [ 1] 3258 	jruge 9$ 
      00A2A9 00 03            [ 2] 3259 	ldw x,(TOWRITE,sp)
      00A2AB 9F A4 07         [ 2] 3260 	subw x,(COUNT,sp)
      00A2AE 88 A6            [ 2] 3261 	ldw (TOWRITE,sp),x 
      00A2B0 01 0D            [ 1] 3262 	ld a,#BLOCK_SIZE 
      00A2B2 01 27 05         [ 2] 3263 	cpw x,#BLOCK_SIZE 
      00A2B5 48 0A            [ 1] 3264 	jruge 4$ 
      00A2B7 01               [ 1] 3265 	ld a,xl 
      00A2B8 20 F7            [ 1] 3266 4$:	ld (CNT_LO,sp),a 
      00A2BA 6B 01 90         [ 4] 3267 	call clear_block_buffer 
      00A2BD F6 93            [ 2] 3268 	jra 32$ 
      0028C8                       3269 9$:	_drop VSIZE 
      00A2BF EE 01            [ 2]    1     addw sp,#VSIZE 
      00A2C1 72 A9            [ 2] 3270     popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A2C3 00               [ 2] 3271 	popw x 
      00A2C4 03               [ 4] 3272 	ret 
                                   3273 
                                   3274 
      00A2C5 84 F4                 3275 SIGNATURE: .ascii "TB"
      00A2C7 27 02 A6 01 5F 97 4F  3276 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             81 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A2CF 4E 6F 20 61 70 70 6C  3277 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3278 
                                   3279 ;---------------------
                                   3280 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3281 ; write 1 or more byte to FLASH or EEPROM
                                   3282 ; starting at address  
                                   3283 ; input:
                                   3284 ;   expr1  	is address 
                                   3285 ;   expr2,...,exprn   are bytes to write
                                   3286 ; output:
                                   3287 ;   none 
                                   3288 ;---------------------
      002928                       3289 write:
      00A2CF CD 9A 12         [ 4] 3290 	call expression
      00A2D2 A1 02            [ 1] 3291 	cp a,#TK_INTGR 
      00A2D4 27 03            [ 1] 3292 	jreq 0$
      00A2D6 CC 96 E6         [ 2] 3293 	jp syntax_error
      00A2D9                       3294 0$: _xpop 
      00A2D9 90 F6            [ 1]    1     ld a,(y)
      00A2DB 93               [ 1]    2     ldw x,y 
      00A2DC EE 01            [ 2]    3     ldw x,(1,x)
      00A2DE 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2E2 9F 88 90         [ 1] 3295 	ld farptr,a 
      00A2E5 F6 93 EE         [ 2] 3296 	ldw ptr16,x 
      002941                       3297 1$:	
      00A2E8 01 72 A9         [ 4] 3298 	call next_token 
      00A2EB 00 03            [ 1] 3299 	cp a,#TK_COMMA 
      00A2ED 84 F7            [ 1] 3300 	jreq 2$ 
      00A2EF 81 20            [ 2] 3301 	jra 9$ ; no more data 
      00A2F0 CD 1A D6         [ 4] 3302 2$:	call expression
      00A2F0 CD 9A            [ 1] 3303 	cp a,#TK_INTGR
      00A2F2 0D A1            [ 1] 3304 	jreq 3$
      00A2F4 01 27 03         [ 2] 3305 	jp syntax_error
      002954                       3306 3$:	_xpop 
      00A2F7 CC 96            [ 1]    1     ld a,(y)
      00A2F9 E6               [ 1]    2     ldw x,y 
      00A2FA 90 F6            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A2FC 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A300 A9               [ 1] 3307 	ld a,xl 
      00A301 00               [ 1] 3308 	clrw x 
      00A302 03 C7 00         [ 4] 3309 	call write_byte
      00A305 19 CF 00         [ 2] 3310 	ldw x,#1 
      00A308 1A 92 BC         [ 4] 3311 	call incr_farptr 
      00A30B 00 19            [ 2] 3312 	jra 1$ 
      00296A                       3313 9$:
      00A30D 5F               [ 4] 3314 	ret 
                                   3315 
                                   3316 
                                   3317 ;---------------------
                                   3318 ;BASIC: CHAR(expr)
                                   3319 ; évaluate expression 
                                   3320 ; and take the 7 least 
                                   3321 ; bits as ASCII character
                                   3322 ; output: 
                                   3323 ; 	A char 
                                   3324 ;---------------------
      00296B                       3325 func_char:
      00A30E 97 4F 81         [ 4] 3326 	call func_args 
      00A311 A1 01            [ 1] 3327 	cp a,#1
      00A311 CD 9C            [ 1] 3328 	jreq 1$
      00A313 6F 90 F6         [ 2] 3329 	jp syntax_error
      002975                       3330 1$:	_xpop
      00A316 93 EE            [ 1]    1     ld a,(y)
      00A318 01               [ 1]    2     ldw x,y 
      00A319 72 A9            [ 2]    3     ldw x,(1,x)
      00A31B 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A31F 0D               [ 1] 3331 	ld a,xl
      00A320 5D 26            [ 1] 3332 	and a,#0x7f 
      00A322 0A               [ 4] 3333 	ret
                                   3334 
                                   3335 ;---------------------
                                   3336 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3337 ; extract first character 
                                   3338 ; of string argument 
                                   3339 ; output:
                                   3340 ;    A:X    int24 
                                   3341 ;---------------------
      002982                       3342 ascii:
      00A323 55 00            [ 1] 3343 	ld a,#TK_LPAREN
      00A325 04 00 02         [ 4] 3344 	call expect 
      00A328 5B 02 CC         [ 4] 3345 	call next_token 
      00A32B 97 99            [ 1] 3346 	cp a,#TK_QSTR 
      00A32D 81 0E            [ 1] 3347 	jreq 1$
      00A32E A1 04            [ 1] 3348 	cp a,#TK_CHAR 
      00A32E 85 52            [ 1] 3349 	jreq 2$ 
      00A330 0D 89            [ 1] 3350 	cp a,#TK_CFUNC 
      00A332 A6 85            [ 1] 3351 	jreq 0$
      00A334 CD 9A 00         [ 2] 3352 	jp syntax_error
      002999                       3353 0$: ; cfunc 
      00A337 CD               [ 4] 3354 	call (x)
      00A338 98 72            [ 2] 3355 	jra 3$
      00299C                       3356 1$: ; quoted string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A33A 1F               [ 1] 3357 	ld a,(x)
      00A33B 09               [ 1] 3358 	push a  
      00A33C CD 9D 44         [ 4] 3359 	call skip_string
      00A33F 72               [ 1] 3360 	pop a  	
      00A340 14 00            [ 2] 3361 	jra 3$ 
      0029A4                       3362 2$: ; character 
      00A342 23 CD 98         [ 4] 3363 	call get_char 
      00A345 4A               [ 1] 3364 3$:	clrw x 
      00A346 A1               [ 1] 3365 	rlwa x   
      0029A9                       3366 4$:	_xpush  
      00A347 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A34B 96 E6            [ 1]    2     ld (y),a 
      00A34D 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A34D FE 72            [ 1] 3367 	ld a,#TK_RPAREN 
      00A34F 5C 00 02         [ 4] 3368 	call expect
      0029B7                       3369 9$:	
      0029B7                       3370 	_xpop  
      00A352 72 5C            [ 1]    1     ld a,(y)
      00A354 00               [ 1]    2     ldw x,y 
      00A355 02 A3            [ 2]    3     ldw x,(1,x)
      00A357 A3 5E 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A35B CC               [ 4] 3371 	ret 
                                   3372 
                                   3373 ;---------------------
                                   3374 ;BASIC: KEY
                                   3375 ; wait for a character 
                                   3376 ; received from STDIN 
                                   3377 ; input:
                                   3378 ;	none 
                                   3379 ; output:
                                   3380 ;	a	 character 
                                   3381 ;---------------------
      0029C1                       3382 key:
      00A35C 96 E6 1B         [ 4] 3383 	call getc 
      00A35E 81               [ 4] 3384 	ret
                                   3385 
                                   3386 ;----------------------
                                   3387 ; BASIC: QKEY
                                   3388 ; Return true if there 
                                   3389 ; is a character in 
                                   3390 ; waiting in STDIN 
                                   3391 ; input:
                                   3392 ;  none 
                                   3393 ; output:
                                   3394 ;   A     0|-1
                                   3395 ;-----------------------
      0029C5                       3396 qkey:: 
      00A35E 72               [ 1] 3397 	clrw x 
      00A35F 04 00 23         [ 1] 3398 	ld a,rx1_head
      00A362 03 CC 96         [ 1] 3399 	sub a,rx1_tail 
      00A365 E6 CD            [ 1] 3400 	jreq 9$ 
      00A367 9B               [ 2] 3401 	cplw x
      00A368 56 A1            [ 1] 3402 	ld a,#255    
      0029D1                       3403 9$: 
      00A36A 84               [ 4] 3404 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3405 
                                   3406 ;---------------------
                                   3407 ; BASIC: GPIO(port,reg)
                                   3408 ; return gpio register address 
                                   3409 ; expr {PORTA..PORTI}
                                   3410 ; input:
                                   3411 ;   none 
                                   3412 ; output:
                                   3413 ;   A:X 	gpio register address
                                   3414 ;----------------------------
                                   3415 ;	N=PORT
                                   3416 ;	T=REG 
      0029D2                       3417 gpio:
      00A36B 27 03 CC         [ 4] 3418 	call func_args 
      00A36E 96 E6            [ 1] 3419 	cp a,#2
      00A370 90 F6            [ 1] 3420 	jreq 1$
      00A372 93 EE 01         [ 2] 3421 	jp syntax_error  
      0029DC                       3422 1$:	_at_next 
      00A375 72 A9 00         [ 1]    1     ld a,(3,y)
      00A378 03               [ 1]    2     ldw x,y 
      00A379 6B 06            [ 2]    3     ldw x,(4,x)
      00A37B 1F 07 CD         [ 2] 3423 	cpw x,#PA_BASE 
      00A37E 98 4A            [ 1] 3424 	jrmi bad_port
      00A380 A1 00 27         [ 2] 3425 	cpw x,#PI_BASE+1 
      00A383 17 A1            [ 1] 3426 	jrpl bad_port
      00A385 80               [ 2] 3427 	pushw x 
      0029ED                       3428 	_xpop
      00A386 26 0E            [ 1]    1     ld a,(y)
      00A388 FE               [ 1]    2     ldw x,y 
      00A389 72 5C            [ 2]    3     ldw x,(1,x)
      00A38B 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A38F 00 02 A3         [ 2] 3429 	addw x,(1,sp)
      0029F9                       3430 	_drop 2 
      00A392 A3 A4            [ 2]    1     addw sp,#2 
      00A394 27               [ 1] 3431 	clr a 
      00A395 0E               [ 4] 3432 	ret
      00A396                       3433 bad_port:
      00A396 55 00            [ 1] 3434 	ld a,#ERR_BAD_VALUE
      00A398 03 00 02         [ 2] 3435 	jp tb_error
                                   3436 
                                   3437 
                                   3438 ;-------------------------
                                   3439 ; BASIC: UFLASH 
                                   3440 ; return free flash address
                                   3441 ; align to BLOCK address 
                                   3442 ; input:
                                   3443 ;  none 
                                   3444 ; output:
                                   3445 ;	A		TK_INTGR
                                   3446 ;   xstack	free address 
                                   3447 ;---------------------------
      00A39B                       3448 uflash:
      00A39B 0F 03 AE         [ 4] 3449 	call qsign 
      00A39E 00 01            [ 1] 3450 	jrne 1$
      00A3A0 1F 04 20         [ 2] 3451 	ldw x,#app_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A3A3 2F BB 36 02      [ 2] 3452 	addw x,app_size 
      00A3A4 1C 00 04         [ 2] 3453 	addw x,#4
                                   3454 ; align on 128 bytes block 
      00A3A4 72 04 00         [ 2] 3455 	addw x,#BLOCK_SIZE 
      00A3A7 23               [ 1] 3456 	ld a,xl 
      00A3A8 03 CC            [ 1] 3457 	and a,#0x80 
      00A3AA 96               [ 1] 3458 	ld xl,a 
      00A3AB E6 CD            [ 2] 3459 	jra 2$
      00A3AD 9B 56 A1         [ 2] 3460 1$:	ldw x,#app_space 
      002A1D                       3461 2$:
      00A3B0 84               [ 1] 3462 	clr a 
      00A3B1 27               [ 4] 3463 	ret 
                                   3464 
                                   3465 
                                   3466 ;---------------------
                                   3467 ; BASIC: USR(addr,arg)
                                   3468 ; execute a function written 
                                   3469 ; in binary code.
                                   3470 ; input:
                                   3471 ;   addr	routine address 
                                   3472 ;   arg 	is an argument
                                   3473 ;           it can be ignore 
                                   3474 ;           by cally. 
                                   3475 ; output:
                                   3476 ;   xstack 	value returned by cally  
                                   3477 ;---------------------
      002A1F                       3478 usr:
      00A3B2 03 CC 96         [ 4] 3479 	call func_args 
      00A3B5 E6 02            [ 1] 3480 	cp a,#2
      00A3B6 27 03            [ 1] 3481 	jreq 1$  
      00A3B6 90 F6 93         [ 2] 3482 	jp syntax_error 
      002A29                       3483 1$: 
      002A29                       3484 	_at_next ; A:X addr 
      00A3B9 EE 01 72         [ 1]    1     ld a,(3,y)
      00A3BC A9               [ 1]    2     ldw x,y 
      00A3BD 00 03            [ 2]    3     ldw x,(4,x)
      00A3BF 6B 03 1F         [ 2] 3485 	ldw ptr16,X 
      002A32                       3486 	_xpop  ; arg 
      00A3C2 04 4D            [ 1]    1     ld a,(y)
      00A3C4 2A               [ 1]    2     ldw x,y 
      00A3C5 0D 7B            [ 2]    3     ldw x,(1,x)
      00A3C7 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      002A3B                       3487 	_store_top ; overwrite addr 
      00A3CB 00 01            [ 1]    1     ld (y),a 
      00A3CD A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A3D0 06 1F 07 19      [ 6] 3488     call [ptr16]
      00A3D3 81               [ 4] 3489 	ret 
                                   3490 
                                   3491 
                                   3492 ;------------------------------
                                   3493 ; BASIC: BYE 
                                   3494 ; halt mcu in its lowest power mode 
                                   3495 ; wait for reset or external interrupt
                                   3496 ; do a cold start on wakeup.
                                   3497 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      002A45                       3498 bye:
      00A3D3 CE 00 05 1F 0D   [ 2] 3499 	btjf UART1_SR,#UART_SR_TC,.
      00A3D8 CE               [10] 3500 	halt
      00A3D9 00 01 1F         [ 2] 3501 	jp cold_start  
                                   3502 
                                   3503 ;----------------------------------
                                   3504 ; BASIC: SLEEP 
                                   3505 ; halt mcu until reset or external
                                   3506 ; interrupt.
                                   3507 ; Resume progam after SLEEP command
                                   3508 ;----------------------------------
      002A4E                       3509 sleep:
      00A3DC 0B 72 15 00 23   [ 2] 3510 	btjf UART1_SR,#UART_SR_TC,.
      00A3E1 72 5C 00 20      [ 1] 3511 	bset flags,#FSLEEP
      00A3E5 81               [10] 3512 	halt 
      00A3E6 81               [ 4] 3513 	ret 
                                   3514 
                                   3515 ;-------------------------------
                                   3516 ; BASIC: PAUSE expr 
                                   3517 ; suspend execution for n msec.
                                   3518 ; input:
                                   3519 ;	none
                                   3520 ; output:
                                   3521 ;	none 
                                   3522 ;------------------------------
      002A59                       3523 pause:
      00A3E6 72 5D 00         [ 4] 3524 	call expression
      00A3E9 20 26            [ 1] 3525 	cp a,#TK_INTGR
      00A3EB 03 CC            [ 1] 3526 	jreq 1$ 
      00A3ED 96 E6 66         [ 2] 3527 	jp syntax_error
      00A3EF                       3528 1$: _xpop 
      00A3EF A6 85            [ 1]    1     ld a,(y)
      00A3F1 CD               [ 1]    2     ldw x,y 
      00A3F2 9A 00            [ 2]    3     ldw x,(1,x)
      00A3F4 CD 98 72 13      [ 2]    4     addw y,#CELL_SIZE 
      002A6C                       3529 pause02:
      00A3F8 09 27 03         [ 2] 3530 	ldw timer,x 
      00A3FB CC 96 E6         [ 2] 3531 1$: ldw x,timer 
      00A3FE 5D               [ 2] 3532 	tnzw x 
      00A3FE CF 00            [ 1] 3533 	jreq 2$
      00A400 1A               [10] 3534 	wfi 
      00A401 F6 EE            [ 1] 3535 	jrne 1$
      002A78                       3536 2$:	
      00A403 01               [ 4] 3537 	ret 
                                   3538 
                                   3539 ;------------------------------
                                   3540 ; BASIC: AWU expr
                                   3541 ; halt mcu for 'expr' milliseconds
                                   3542 ; use Auto wakeup peripheral
                                   3543 ; all oscillators stopped except LSI
                                   3544 ; range: 1ms - 511ms
                                   3545 ; input:
                                   3546 ;  none
                                   3547 ; output:
                                   3548 ;  none:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3549 ;------------------------------
      002A79                       3550 awu:
      00A404 72 FB 04         [ 4] 3551   call expression
      00A407 19 03            [ 1] 3552   cp a,#TK_INTGR
      00A409 72 C7            [ 1] 3553   jreq 1$
      00A40B 00 1A 72         [ 2] 3554   jp syntax_error
      002A83                       3555 1$: _xpop 
      00A40E 5C 00            [ 1]    1     ld a,(y)
      00A410 1B               [ 1]    2     ldw x,y 
      00A411 72 CF            [ 2]    3     ldw x,(1,x)
      00A413 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A8C                       3556 awu02:
      00A417 0D CF 00         [ 2] 3557   cpw x,#5120
      00A41A 0E 7B            [ 1] 3558   jrmi 1$ 
      00A41C 06 1E 07 72      [ 1] 3559   mov AWU_TBR,#15 
      00A420 B0 00            [ 1] 3560   ld a,#30
      00A422 0E               [ 2] 3561   div x,a
      00A423 C2 00            [ 1] 3562   ld a,#16
      00A425 0D               [ 2] 3563   div x,a 
      00A426 18 03            [ 2] 3564   jra 4$
      002A9D                       3565 1$: 
      00A428 A8 80 2B         [ 2] 3566   cpw x,#2048
      00A42B 12 20            [ 1] 3567   jrmi 2$ 
      00A42D 25 7B 03 2A      [ 1] 3568   mov AWU_TBR,#14
      00A431 07 C6            [ 1] 3569   ld a,#80
      00A433 00               [ 2] 3570   div x,a 
      00A434 0F 2F            [ 2] 3571   jra 4$   
      002AAB                       3572 2$:
      00A436 07 20 1A F2      [ 1] 3573   mov AWU_TBR,#7
      00A439                       3574 3$:  
                                   3575 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A439 72 0E 00         [ 2] 3576   cpw x,#64 
      00A43C 0F 15            [ 2] 3577   jrule 4$ 
      00A43E 72 5C 50 F2      [ 1] 3578   inc AWU_TBR 
      00A43E 1E               [ 2] 3579   srlw x 
      00A43F 0D CF            [ 2] 3580   jra 3$ 
      002ABB                       3581 4$:
      00A441 00               [ 1] 3582   ld a, xl
      00A442 05               [ 1] 3583   dec a 
      00A443 72 01            [ 1] 3584   jreq 5$
      00A445 00               [ 1] 3585   dec a 	
      002AC0                       3586 5$: 
      00A446 23 05            [ 1] 3587   and a,#0x3e 
      00A448 E6 02 C7         [ 1] 3588   ld AWU_APR,a 
      00A44B 00 04 1E 0B      [ 1] 3589   bset AWU_CSR,#AWU_CSR_AWUEN
      00A44F CF               [10] 3590   halt 
                                   3591 
      00A450 00               [ 4] 3592   ret 
                                   3593 
                                   3594 ;------------------------------
                                   3595 ; BASIC: TICKS
                                   3596 ; return msec ticks counter value 
                                   3597 ; input:
                                   3598 ; 	none 
                                   3599 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3600 ;	X 		TK_INTGR
                                   3601 ;-------------------------------
      002ACB                       3602 get_ticks:
      00A451 01 81 0F         [ 1] 3603 	ld a,ticks 
      00A453 CE 00 10         [ 2] 3604 	ldw x,ticks+1 
      00A453 85               [ 4] 3605 	ret 
                                   3606 
                                   3607 ;------------------------------
                                   3608 ; BASIC: ABS(expr)
                                   3609 ; return absolute value of expr.
                                   3610 ; input:
                                   3611 ;   none
                                   3612 ; output:
                                   3613 ;   xstack    positive int24 
                                   3614 ;-------------------------------
      002AD2                       3615 abs:
      00A454 5B 0D 72         [ 4] 3616 	call func_args 
      00A457 5A 00            [ 1] 3617 	cp a,#1 
      00A459 20 FC            [ 1] 3618 	jreq 0$ 
      00A45B CC 16 66         [ 2] 3619 	jp syntax_error
      002ADC                       3620 0$:  
      00A45B CD 98 4A         [ 4] 3621 	call abs24 
      002ADF                       3622 	_xpop 
      00A45E A1 84            [ 1]    1     ld a,(y)
      00A460 27               [ 1]    2     ldw x,y 
      00A461 07 A1            [ 2]    3     ldw x,(1,x)
      00A463 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A467 96               [ 4] 3623 	ret 
                                   3624 
                                   3625 ;------------------------------
                                   3626 ; BASIC: LSHIFT(expr1,expr2)
                                   3627 ; logical shift left expr1 by 
                                   3628 ; expr2 bits 
                                   3629 ; output:
                                   3630 ; 	A:x 	result 
                                   3631 ;------------------------------
      002AE9                       3632 lshift:
      00A468 E6 19 8D         [ 4] 3633 	call func_args
      00A469 A1 02            [ 1] 3634 	cp a,#2 
      00A469 90 89            [ 1] 3635 	jreq 1$
      00A46B CD 98 7C         [ 2] 3636 	jp syntax_error
      002AF3                       3637 1$: _xpop 
      00A46E 4F 90            [ 1]    1     ld a,(y)
      00A470 CE               [ 1]    2     ldw x,y 
      00A471 00 05            [ 2]    3     ldw x,(1,x)
      00A473 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A477 13               [ 1] 3638 	ld a,xl 
      00A478 01               [ 1] 3639 	push a      
      002AFE                       3640 	_xpop  ; T>A:X 
      00A479 5B 02            [ 1]    1     ld a,(y)
      00A47B 25               [ 1]    2     ldw x,y 
      00A47C 01 4C            [ 2]    3     ldw x,(1,x)
      00A47E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A47E CD 8C            [ 1] 3641 	tnz (1,sp) 
      00A480 C5 5D            [ 1] 3642 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A482 26               [ 1] 3643 2$:	rcf 
      00A483 05               [ 2] 3644 	rlcw x 
      00A484 A6               [ 1] 3645 	rlc a 
      00A485 05 CC            [ 1] 3646 	dec (1,sp) 
      00A487 96 E8            [ 1] 3647 	jrne 2$
      002B12                       3648 4$: _drop 1 
      00A489 90 85            [ 2]    1     addw sp,#1 
      00A48B 81               [ 4] 3649 	ret
                                   3650 
                                   3651 ;------------------------------
                                   3652 ; BASIC: RSHIFT(expr1,expr2)
                                   3653 ; logical shift right expr1 by 
                                   3654 ; expr2 bits.
                                   3655 ; output:
                                   3656 ; 	A 		TK_INTGR
                                   3657 ;   X 		result 
                                   3658 ;------------------------------
      00A48C                       3659 rshift:
      00A48C 90 89 89         [ 4] 3660 	call func_args
      00A48F CD 98            [ 1] 3661 	cp a,#2 
      00A491 63 72            [ 1] 3662 	jreq 1$
      00A493 5F 00 0E         [ 2] 3663 	jp syntax_error
      002B1F                       3664 1$: _xpop ; T>A:X
      00A496 90 CE            [ 1]    1     ld a,(y)
      00A498 00               [ 1]    2     ldw x,y 
      00A499 1C 90            [ 2]    3     ldw x,(1,x)
      00A49B E6 03 A1 03      [ 2]    4     addw y,#CELL_SIZE 
      00A49F 27               [ 1] 3665     ld a,xl 
      00A4A0 15               [ 1] 3666 	push a    
      002B2A                       3667 	_xpop  
      00A4A1 90 E6            [ 1]    1     ld a,(y)
      00A4A3 02               [ 1]    2     ldw x,y 
      00A4A4 C7 00            [ 2]    3     ldw x,(1,x)
      00A4A6 0F 72 B9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A4AA 0E 90            [ 1] 3668 	tnz (1,sp)
      00A4AC C3 00            [ 1] 3669 	jreq 4$
      00A4AE 1E               [ 1] 3670 2$:	rcf 
      00A4AF 25               [ 1] 3671 	rrc a 
      00A4B0 E9               [ 2] 3672 	rrcw x 
      00A4B1 A6 0A            [ 1] 3673 	dec (1,sp) 
      00A4B3 CC 96            [ 1] 3674 	jrne 2$
      002B3E                       3675 4$: _drop 1 
      00A4B5 E8 01            [ 2]    1     addw sp,#1 
      00A4B6 81               [ 4] 3676 	ret
                                   3677 
                                   3678 ;--------------------------
                                   3679 ; BASIC: FCPU integer
                                   3680 ; set CPU frequency 
                                   3681 ;-------------------------- 
                                   3682 
      002B41                       3683 fcpu:
      00A4B6 90 89            [ 1] 3684 	ld a,#TK_INTGR
      00A4B8 72 A9 00         [ 4] 3685 	call expect 
      00A4BB 04 1E 03         [ 4] 3686 	call get_int24 
      00A4BE CD               [ 1] 3687 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4BF 94 11            [ 1] 3688 	and a,#7 
      00A4C1 26 04 90         [ 1] 3689 	ld CLK_CKDIVR,a 
      00A4C4 85               [ 4] 3690 	ret 
                                   3691 
                                   3692 ;------------------------------
                                   3693 ; BASIC: PMODE pin#, mode 
                                   3694 ; Arduino pin. 
                                   3695 ; define pin as input or output
                                   3696 ; pin#: {0..15}
                                   3697 ; mode: INPUT|OUTPUT  
                                   3698 ;------------------------------
                           000001  3699 	PINNO=1
                           000001  3700 	VSIZE=1
      002B50                       3701 pin_mode:
      002B50                       3702 	_vars VSIZE 
      00A4C5 20 DA            [ 2]    1     sub sp,#VSIZE 
      00A4C7 CD 19 92         [ 4] 3703 	call arg_list 
      00A4C7 85 5B            [ 1] 3704 	cp a,#2 
      00A4C9 02 90            [ 1] 3705 	jreq 1$
      00A4CB 85 81 66         [ 2] 3706 	jp syntax_error 
      00A4CD                       3707 1$: _xpop 
      00A4CD 72 00            [ 1]    1     ld a,(y)
      00A4CF 00               [ 1]    2     ldw x,y 
      00A4D0 23 05            [ 2]    3     ldw x,(1,x)
      00A4D2 A6 06 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A4D6 E8 CD 9B         [ 2] 3708 	ldw ptr16,x ; mode 
      002B68                       3709 	_xpop ; Dx pin 
      00A4D9 56 A1            [ 1]    1     ld a,(y)
      00A4DB 84               [ 1]    2     ldw x,y 
      00A4DC 27 03            [ 2]    3     ldw x,(1,x)
      00A4DE CC 96 E6 90      [ 2]    4     addw y,#CELL_SIZE 
      00A4E2 F6 93 EE         [ 4] 3710 	call select_pin 
      00A4E5 01 72            [ 1] 3711 	ld (PINNO,sp),a  
      00A4E7 A9 00            [ 1] 3712 	ld a,#1 
      00A4E9 03 9F            [ 1] 3713 	tnz (PINNO,sp)
      00A4EB 27 68            [ 1] 3714 	jreq 4$
      00A4ED 88               [ 1] 3715 2$:	sll a 
      00A4EE CD 98            [ 1] 3716 	dec (PINNO,sp)
      00A4F0 4A A1            [ 1] 3717 	jrne 2$ 
      00A4F2 80 27            [ 1] 3718 	ld (PINNO,sp),a
      00A4F4 03 CC            [ 1] 3719 	ld a,(PINNO,sp)
      00A4F6 96 E6            [ 1] 3720 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4F8 FE 72            [ 1] 3721 	ld (GPIO_CR1,x),a 
      00A4FA 5C 00            [ 1] 3722 4$:	ld a,#OUTP
      00A4FC 02 72 5C         [ 1] 3723 	cp a,acc8 
      00A4FF 00 02            [ 1] 3724 	jreq 6$
                                   3725 ; input mode
                                   3726 ; disable external interrupt 
      00A501 A3 A5            [ 1] 3727 	ld a,(PINNO,sp)
      00A503 5F               [ 1] 3728 	cpl a 
      00A504 27 08            [ 1] 3729 	and a,(GPIO_CR2,x)
      00A506 A3 A5            [ 1] 3730 	ld (GPIO_CR2,x),a 
                                   3731 ;clear bit in DDR for input mode 
      00A508 79 27            [ 1] 3732 	ld a,(PINNO,sp)
      00A50A 03               [ 1] 3733 	cpl a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A50B CC 96            [ 1] 3734 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A50D E6 02            [ 1] 3735 	ld (GPIO_DDR,x),a 
      00A50E 20 0C            [ 2] 3736 	jra 9$
      002BA0                       3737 6$: ;output mode  
      00A50E 84 89            [ 1] 3738 	ld a,(PINNO,sp)
      00A510 88 02            [ 1] 3739 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A511 E7 02            [ 1] 3740 	ld (GPIO_DDR,x),a 
      00A511 0A 01            [ 1] 3741 	ld a,(PINNO,sp)
      00A513 27 26            [ 1] 3742 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A515 CD 98            [ 1] 3743 	ld (GPIO_CR2,x),a 
      002BAC                       3744 9$:	
      002BAC                       3745 	_drop VSIZE 
      00A517 4A A1            [ 2]    1     addw sp,#VSIZE 
      00A519 84               [ 4] 3746 	ret
                                   3747 
                                   3748 ;------------------------
                                   3749 ; select Arduino pin 
                                   3750 ; input:
                                   3751 ;   X 	 {0..15} Arduino Dx 
                                   3752 ; output:
                                   3753 ;   A     stm8s208 pin 
                                   3754 ;   X     base address s208 GPIO port 
                                   3755 ;---------------------------
      002BAF                       3756 select_pin:
      00A51A 27               [ 2] 3757 	sllw x 
      00A51B 07 A1 03         [ 2] 3758 	addw x,#arduino_to_8s208 
      00A51E 27               [ 2] 3759 	ldw x,(x)
      00A51F 0D               [ 1] 3760 	ld a,xl 
      00A520 CC               [ 1] 3761 	push a 
      00A521 96               [ 1] 3762 	swapw x 
      00A522 E6 05            [ 1] 3763 	ld a,#5 
      00A523 42               [ 4] 3764 	mul x,a 
      00A523 C6 00 02         [ 2] 3765 	addw x,#GPIO_BASE 
      00A526 AB               [ 1] 3766 	pop a 
      00A527 03               [ 4] 3767 	ret 
                                   3768 ; translation from Arduino D0..D15 to stm8s208rb 
      002BBF                       3769 arduino_to_8s208:
      00A528 C7 00                 3770 .byte 3,6 ; D0 
      00A52A 02 20                 3771 .byte 3,5 ; D1 
      00A52C 03 CD                 3772 .byte 4,0 ; D2 
      00A52E 98 63                 3773 .byte 2,1 ; D3
      00A530 06 00                 3774 .byte 6,0 ; D4
      00A530 CD 98                 3775 .byte 2,2 ; D5
      00A532 4A A1                 3776 .byte 2,3 ; D6
      00A534 08 27                 3777 .byte 3,1 ; D7
      00A536 DA 5B                 3778 .byte 3,3 ; D8
      00A538 03 20                 3779 .byte 2,4 ; D9
      00A53A 1A 05                 3780 .byte 4,5 ; D10
      00A53B 02 06                 3781 .byte 2,6 ; D11
      00A53B 5B 01                 3782 .byte 2,7 ; D12
      00A53D CD A4                 3783 .byte 2,5 ; D13
      00A53F 5B CF                 3784 .byte 4,2 ; D14
      00A541 00 1A                 3785 .byte 4,1 ; D15
                                   3786 
                                   3787 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



                                   3788 ;------------------------------
                                   3789 ; BASIC: RND(expr)
                                   3790 ; return random number 
                                   3791 ; between 1 and expr inclusive
                                   3792 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3793 ; input:
                                   3794 ; 	none 
                                   3795 ; output:
                                   3796 ;	xstack 	random positive integer 
                                   3797 ;------------------------------
      002BDF                       3798 random:
      00A543 55 00 04         [ 4] 3799 	call func_args 
      00A546 00 02            [ 1] 3800 	cp a,#1
      00A548 85 A3            [ 1] 3801 	jreq 1$
      00A54A A5 5F 26         [ 2] 3802 	jp syntax_error
      002BE9                       3803 1$:  
      002BE9                       3804 	_xpop   
      00A54D 05 CE            [ 1]    1     ld a,(y)
      00A54F 00               [ 1]    2     ldw x,y 
      00A550 1A 20            [ 2]    3     ldw x,(1,x)
      00A552 19 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A553 89               [ 2] 3805 	pushw x 
      00A553 20               [ 1] 3806 	push a  
      00A554 35 80            [ 1] 3807 	ld a,#0x80 
      00A555 15 01            [ 1] 3808 	bcp a,(1,sp)
      00A555 55 00            [ 1] 3809 	jreq 2$
      00A557 04 00            [ 1] 3810 	ld a,#ERR_BAD_VALUE
      00A559 02 5B 02         [ 2] 3811 	jp tb_error
      002BFF                       3812 2$: 
                                   3813 ; acc16=(x<<5)^x 
      00A55C CC 97 99         [ 2] 3814 	ldw x,seedx 
      00A55F 58               [ 2] 3815 	sllw x 
      00A55F 72               [ 2] 3816 	sllw x 
      00A560 00               [ 2] 3817 	sllw x 
      00A561 00               [ 2] 3818 	sllw x 
      00A562 23               [ 2] 3819 	sllw x 
      00A563 05               [ 1] 3820 	ld a,xh 
      00A564 A6 06 CC         [ 1] 3821 	xor a,seedx 
      00A567 96 E8 0D         [ 1] 3822 	ld acc16,a 
      00A569 9F               [ 1] 3823 	ld a,xl 
      00A569 CD A4 5B         [ 1] 3824 	xor a,seedx+1 
      00A56C C7 00 0E         [ 1] 3825 	ld acc8,a 
                                   3826 ; seedx=seedy 
      00A56C CF 00 05         [ 2] 3827 	ldw x,seedy 
      00A56F E6 02 C7         [ 2] 3828 	ldw seedx,x  
                                   3829 ; seedy=seedy^(seedy>>1)
      00A572 00 04 35         [ 2] 3830 	ldw x,seedy 
      00A575 03               [ 2] 3831 	srlw x 
      00A576 00               [ 1] 3832 	ld a,xh 
      00A577 02 81 16         [ 1] 3833 	xor a,seedy 
      00A579 C7 00 16         [ 1] 3834 	ld seedy,a  
      00A579 72               [ 1] 3835 	ld a,xl 
      00A57A 00 00 23         [ 1] 3836 	xor a,seedy+1 
      00A57D 06 A6 06         [ 1] 3837 	ld seedy+1,a 
                                   3838 ; acc16>>3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A580 CC 96 E8         [ 2] 3839 	ldw x,acc16 
      00A583 81               [ 2] 3840 	srlw x 
      00A584 54               [ 2] 3841 	srlw x 
      00A584 CD               [ 2] 3842 	srlw x 
                                   3843 ; x=acc16^x 
      00A585 A4               [ 1] 3844 	ld a,xh 
      00A586 5B CF 00         [ 1] 3845 	xor a,acc16 
      00A589 1A 00 0D         [ 1] 3846 	ld acc16,a 
      00A58A 9F               [ 1] 3847 	ld a,xl 
      00A58A 85 52 04         [ 1] 3848 	xor a,acc8 
      00A58D 89 CE 00         [ 1] 3849 	ld acc8,a 
                                   3850 ; seedy=acc16^seedy 
      00A590 05 1F 03         [ 1] 3851 	xor a,seedy+1
      00A593 CE               [ 1] 3852 	ld xl,a 
      00A594 00 01 1F         [ 1] 3853 	ld a,acc16 
      00A597 05 CE 00         [ 1] 3854 	xor a,seedy
      00A59A 1A               [ 1] 3855 	ld xh,a 
      00A59B 20 CF 16         [ 2] 3856 	ldw seedy,x 
                                   3857 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A59D C6 00 15         [ 1] 3858 	ld a,seedx+1
      00A59D 72 00            [ 1] 3859 	and a,#127
      002C54                       3860 	_xpush 
      00A59F 00 23 05 A6      [ 2]    1     subw y,#CELL_SIZE
      00A5A3 06 CC            [ 1]    2     ld (y),a 
      00A5A5 96 E8 01         [ 2]    3     ldw (1,y),x 
      00A5A7 84               [ 1] 3861 	pop a 
      00A5A7 1E               [ 2] 3862 	popw x 
      002C5F                       3863 	_xpush 
      00A5A8 03 CF 00 05      [ 2]    1     subw y,#CELL_SIZE
      00A5AC E6 02            [ 1]    2     ld (y),a 
      00A5AE C7 00 04         [ 2]    3     ldw (1,y),x 
      00A5B1 1E 05 CF         [ 4] 3864 	call mod24 
      002C6B                       3865 	_xpop
      00A5B4 00 01            [ 1]    1     ld a,(y)
      00A5B6 85               [ 1]    2     ldw x,y 
      00A5B7 5B 04            [ 2]    3     ldw x,(1,x)
      00A5B9 FC A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5BA 1C 00 01         [ 2] 3866 	addw x,#1 
      00A5BA 72 01            [ 1] 3867 	adc a,#0  
      00A5BC 00               [ 4] 3868 	ret 
                                   3869 
                                   3870 ;---------------------------------
                                   3871 ; BASIC: WORDS 
                                   3872 ; affiche la listes des mots du
                                   3873 ; dictionnaire ainsi que le nombre
                                   3874 ; de mots.
                                   3875 ;---------------------------------
                           000001  3876 	WLEN=1 ; word length
                           000002  3877 	LLEN=2 ; character sent to console
                           000003  3878 	WCNT=3 ; count words printed 
                           000003  3879 	VSIZE=3 
      002C7A                       3880 words:
      00A5BD 23 02            [ 2] 3881 	pushw y
      002C7C                       3882 	_vars VSIZE
      00A5BF 4F 81            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A5C1 0F 02            [ 1] 3883 	clr (LLEN,sp)
      00A5C1 72 09            [ 1] 3884 	clr (WCNT,sp)
      00A5C3 00 23 12 5B      [ 2] 3885 	ldw y,#kword_dict+2
      00A5C7 02               [ 1] 3886 0$:	ldw x,y
      00A5C8 CD               [ 1] 3887 	ld a,(x)
      00A5C9 A1 3F            [ 1] 3888 	and a,#15 
      00A5CB 5B 04            [ 1] 3889 	ld (WLEN,sp),a 
      00A5CD 72 19            [ 1] 3890 	inc (WCNT,sp)
      00A5CF 00               [ 1] 3891 1$:	incw x 
      00A5D0 23               [ 1] 3892 	ld a,(x)
      00A5D1 72 10 00         [ 4] 3893 	call putc 
      00A5D4 23 CC            [ 1] 3894 	inc (LLEN,sp)
      00A5D6 97 91            [ 1] 3895 	dec (WLEN,sp)
      00A5D8 CE 00            [ 1] 3896 	jrne 1$
      00A5DA 1C C3            [ 1] 3897 	ld a,#70
      00A5DC 00 1E            [ 1] 3898 	cp a,(LLEN,sp)
      00A5DE 2B 0C            [ 1] 3899 	jrmi 2$   
      00A5E0 AE 96            [ 1] 3900 	ld a,#SPACE 
      00A5E2 59 CD 89         [ 4] 3901 	call putc 
      00A5E5 E8 55            [ 1] 3902 	inc (LLEN,sp) 
      00A5E7 00 04            [ 2] 3903 	jra 3$
      00A5E9 00 02            [ 1] 3904 2$: ld a,#CR 
      00A5EB 81 09 0B         [ 4] 3905 	call putc 
      00A5EC 0F 02            [ 1] 3906 	clr (LLEN,sp)
      00A5EC 5B 02 00 02      [ 2] 3907 3$:	subw y,#2 
      00A5EE 90 FE            [ 2] 3908 	ldw y,(y)
      00A5EE CD 9D            [ 1] 3909 	jrne 0$ 
      00A5F0 23 CD            [ 1] 3910 	ld a,#CR 
      00A5F2 94 76 CE         [ 4] 3911 	call putc  
      00A5F5 00               [ 1] 3912 	clrw x 
      00A5F6 1E CF            [ 1] 3913 	ld a,(WCNT,sp)
      00A5F8 00               [ 1] 3914 	ld xl,a 
      00A5F9 31 CF 00         [ 4] 3915 	call prt_i16 
      00A5FC 33 5F CF         [ 2] 3916 	ldw x,#words_count_msg
      00A5FF 00 07 72         [ 4] 3917 	call puts 
      002CC9                       3918 	_drop VSIZE 
      00A602 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A604 09 72            [ 2] 3919 	popw y 
      00A606 5F               [ 4] 3920 	ret 
      00A607 00 0A CE 00 1C CF 00  3921 words_count_msg: .asciz " words in dictionary\n"
             05 E6 02 C7 00 04 35
             03 00 02 72 10 00 23
             CC
                                   3922 
                                   3923 
                                   3924 ;-----------------------------
                                   3925 ; BASIC: TIMER expr 
                                   3926 ; initialize count down timer 
                                   3927 ;-----------------------------
      002CE4                       3928 set_timer:
      00A61D 97 91 92         [ 4] 3929 	call arg_list
      00A61F A1 01            [ 1] 3930 	cp a,#1 
      00A61F AE 17            [ 1] 3931 	jreq 1$
      00A621 FF 94 CC         [ 2] 3932 	jp syntax_error
      002CEE                       3933 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      002CEE                       3934 	_xpop  
      00A624 97 72            [ 1]    1     ld a,(y)
      00A626 93               [ 1]    2     ldw x,y 
      00A626 CD 98            [ 2]    3     ldw x,(1,x)
      00A628 4A A1 85 27      [ 2]    4     addw y,#CELL_SIZE 
      00A62C 03 CC 96         [ 2] 3935 	ldw timer,x 
      00A62F E6               [ 4] 3936 	ret 
                                   3937 
                                   3938 ;------------------------------
                                   3939 ; BASIC: TIMEOUT 
                                   3940 ; return state of timer 
                                   3941 ; output:
                                   3942 ;   A:X     0 not timeout 
                                   3943 ;   A:X     -1 timeout 
                                   3944 ;------------------------------
      002CFB                       3945 timeout:
      00A630 CD               [ 1] 3946 	clr a 
      00A631 98 72 CF         [ 2] 3947 	ldw x,timer 
      00A634 00 1A            [ 1] 3948 	jreq 1$
      00A636 CD               [ 1] 3949 	clrw x
      00A637 89               [ 4] 3950 	ret  
      00A638 94               [ 1] 3951 1$:	cpl a
      00A639 27               [ 2] 3952 	cplw x 
      00A63A 03               [ 4] 3953 	ret 
                                   3954  	
                                   3955 
                                   3956 
                                   3957 
                                   3958 ;-----------------------------------
                                   3959 ; BASIC: IWDGEN expr1 
                                   3960 ; enable independant watchdog timer
                                   3961 ; expr1 is delay in multiple of 62.5µsec
                                   3962 ; expr1 -> {1..16383}
                                   3963 ;-----------------------------------
      002D06                       3964 enable_iwdg:
      00A63B CD 89 9B         [ 4] 3965 	call arg_list
      00A63E 72 3F            [ 1] 3966 	cp a,#1 
      00A640 00 1A            [ 1] 3967 	jreq 1$
      00A642 72 5C 00         [ 2] 3968 	jp syntax_error 
      002D10                       3969 1$: _xpop  
      00A645 1B 72            [ 1]    1     ld a,(y)
      00A647 3F               [ 1]    2     ldw x,y 
      00A648 00 1A            [ 2]    3     ldw x,(1,x)
      00A64A 72 5C 00 1B      [ 2]    4     addw y,#CELL_SIZE 
      00A64E 72 C7            [ 1] 3970 	push #0
      00A650 00 1A 81 E0      [ 1] 3971 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A653 9E               [ 1] 3972 	ld a,xh 
      00A653 90 89            [ 1] 3973 	and a,#0x3f
      00A655 AE               [ 1] 3974 	ld xh,a  
      00A656 00 64 90         [ 2] 3975 2$:	cpw x,#255
      00A659 AE 03            [ 2] 3976 	jrule 3$
      00A65B E8 20            [ 1] 3977 	inc (1,sp)
      00A65D 22               [ 1] 3978 	rcf 
      00A65E 56               [ 2] 3979 	rrcw x 
      00A65E 90 89            [ 2] 3980 	jra 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A660 CD 9A 12 A1      [ 1] 3981 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A664 02               [ 1] 3982 	pop a  
      00A665 27 03 CC         [ 1] 3983 	ld IWDG_PR,a 
      00A668 96               [ 1] 3984 	ld a,xl
      00A669 E6               [ 1] 3985 	dec a 
      00A66A 35 55 50 E0      [ 1] 3986 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A66A 90 F6 93         [ 1] 3987 	ld IWDG_RLR,a 
      00A66D EE 01 72 A9      [ 1] 3988 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A671 00               [ 4] 3989 	ret 
                                   3990 
                                   3991 
                                   3992 ;-----------------------------------
                                   3993 ; BASIC: IWDGREF  
                                   3994 ; refresh independant watchdog count down 
                                   3995 ; timer before it reset MCU. 
                                   3996 ;-----------------------------------
      002D44                       3997 refresh_iwdg:
      00A672 03 89 90 F6      [ 1] 3998 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A676 93               [ 4] 3999 	ret 
                                   4000 
                                   4001 
                                   4002 ;-------------------------------------
                                   4003 ; BASIC: LOG2(expr)
                                   4004 ; return logarithm base 2 of expr 
                                   4005 ; this is the position of most significant
                                   4006 ; bit set. 
                                   4007 ; input: 
                                   4008 ; output:
                                   4009 ;   A     TK_INTGR 
                                   4010 ;   xstack log2 
                                   4011 ;*********************************
      002D49                       4012 log2:
      00A677 EE 01 72         [ 4] 4013 	call func_args 
      00A67A A9 00            [ 1] 4014 	cp a,#1 
      00A67C 03 90            [ 1] 4015 	jreq 1$
      00A67E 93 85 66         [ 2] 4016 	jp syntax_error 
      00A680                       4017 1$: 
      002D53                       4018 	_xpop    
      00A680 89 AE            [ 1]    1     ld a,(y)
      00A682 F4               [ 1]    2     ldw x,y 
      00A683 24 65            [ 2]    3     ldw x,(1,x)
      00A685 90 A3 7A 12      [ 2]    4     addw y,#CELL_SIZE 
      00A689 2B               [ 1] 4019 	tnz a
      00A68A 01 5C            [ 1] 4020 	jrne 2$ 
      00A68C 5D               [ 2] 4021 	tnzw x 
      00A68C 9E C7            [ 1] 4022 	jrne 2$
      00A68E 53 0D            [ 1] 4023 	ld a,#ERR_BAD_VALUE
      00A690 9F C7 53         [ 2] 4024 	jp tb_error 
      00A693 0E 8C            [ 1] 4025 2$: push #24 
      00A695 56               [ 2] 4026 3$: rlcw x 
      00A696 9E               [ 1] 4027     rlc a 
      00A697 C7 53            [ 1] 4028 	jrc 4$
      00A699 0F 9F            [ 1] 4029 	dec (1,sp) 
      00A69B C7 53            [ 1] 4030 	jrne 3$
      00A69D 10               [ 1] 4031 4$: clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A69E 72               [ 1] 4032     pop a 
      00A69F 10               [ 1] 4033 	dec a
      00A6A0 53               [ 1] 4034 	rlwa x  
      002D75                       4035 9$:	
      00A6A1 08               [ 4] 4036 	ret 
                                   4037 
                                   4038 ;-----------------------------------
                                   4039 ; BASIC: BIT(expr) 
                                   4040 ; expr ->{0..23}
                                   4041 ; return 2^expr 
                                   4042 ; output:
                                   4043 ;    A:X    2^expr 
                                   4044 ;-----------------------------------
      002D76                       4045 bitmask:
      00A6A2 72 10 53         [ 4] 4046     call func_args 
      00A6A5 00 72            [ 1] 4047 	cp a,#1
      00A6A7 10 53            [ 1] 4048 	jreq 1$
      00A6A9 04 85 CD         [ 2] 4049 	jp syntax_error 
      002D80                       4050 1$: _xpop 
      00A6AC AA EC            [ 1]    1     ld a,(y)
      00A6AE 72               [ 1]    2     ldw x,y 
      00A6AF 11 53            [ 2]    3     ldw x,(1,x)
      00A6B1 08 72 11 53      [ 2]    4     addw y,#CELL_SIZE 
      00A6B5 00               [ 1] 4051 	ld a,xl 
      00A6B6 90 85 81         [ 2] 4052 	ldw x,#1 
      00A6B9 A4 17            [ 1] 4053 	and a,#23
      00A6B9 CD 9A            [ 1] 4054 	jreq 9$
      00A6BB 12               [ 1] 4055 	push a 
      00A6BC A1               [ 1] 4056 	clr a 
      002D93                       4057 2$: 
      00A6BD 02               [ 2] 4058 	slaw x 
      00A6BE 27               [ 1] 4059 	rlc a 	
      00A6BF 12 A1            [ 1] 4060 	dec (1,sp)
      00A6C1 01 27            [ 1] 4061 	jrne 2$ 
      002D99                       4062 4$:
      002D99                       4063     _drop 1 
      00A6C3 03 CC            [ 2]    1     addw sp,#1 
      00A6C5 96               [ 4] 4064 9$:	ret 
                                   4065 
                                   4066 ;------------------------------
                                   4067 ; BASIC: DO 
                                   4068 ; initiate a DO ... UNTIL loop 
                                   4069 ;------------------------------
                           000003  4070 	DOLP_ADR=3 
                           000005  4071 	DOLP_INW=5
                           000004  4072 	VSIZE=4 
      002D9C                       4073 do_loop:
      00A6C6 E6               [ 2] 4074 	popw x 
      002D9D                       4075 	_vars VSIZE 
      00A6C7 4F 5F            [ 2]    1     sub sp,#VSIZE 
      00A6C9 72               [ 2] 4076 	pushw x 
      00A6CA A2 00 03         [ 2] 4077 	ldw x,basicptr 
      00A6CD 90 F7            [ 2] 4078 	ldw (DOLP_ADR,sp),x
      00A6CF 90 EF 01         [ 2] 4079 	ldw x,in.w 
      00A6D2 90 E6            [ 2] 4080 	ldw (DOLP_INW,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A6D4 03 93 EE 04      [ 1] 4081 	inc loop_depth 
      00A6D8 5D               [ 4] 4082 	ret 
                                   4083 
                                   4084 ;--------------------------------
                                   4085 ; BASIC: UNTIL expr 
                                   4086 ; loop if exprssion is false 
                                   4087 ; else terminate loop
                                   4088 ;--------------------------------
      002DAF                       4089 until: 
      00A6D9 27 25 90 F6      [ 1] 4090 	tnz loop_depth 
      00A6DD 93 EE            [ 1] 4091 	jrne 1$ 
      00A6DF 01 72 A9         [ 2] 4092 	jp syntax_error 
      002DB8                       4093 1$: 
      00A6E2 00 03 72         [ 4] 4094 	call condition  
      002DBB                       4095 	_xpop 
      00A6E5 A9 00            [ 1]    1     ld a,(y)
      00A6E7 03               [ 1]    2     ldw x,y 
      00A6E8 9F A4            [ 2]    3     ldw x,(1,x)
      00A6EA 07 4E C7 54      [ 2]    4     addw y,#CELL_SIZE 
      00A6EE 01               [ 1] 4096 	tnz a 
      00A6EF 72 16            [ 1] 4097 	jrne 9$ 
      00A6F1 50               [ 2] 4098 	tnzw x 
      00A6F2 CA 72            [ 1] 4099 	jrne 9$ 
      00A6F4 10 54            [ 2] 4100 	ldw x,(DOLP_ADR,sp)
      00A6F6 01 AE 00         [ 2] 4101 	ldw basicptr,x 
      00A6F9 1B 5A            [ 1] 4102 	ld a,(2,x)
      00A6FB 9D 26 FA         [ 1] 4103 	ld count,a 
      00A6FE 20 08            [ 2] 4104 	ldw x,(DOLP_INW,sp)
      00A700 72 11 54         [ 2] 4105 	ldw in.w,x 
      00A703 01               [ 4] 4106 	ret 
      002DDA                       4107 9$:	; remove loop data from stack  
      00A704 72               [ 2] 4108 	popw x
      002DDB                       4109 	_drop VSIZE
      00A705 17 50            [ 2]    1     addw sp,#VSIZE 
      00A707 CA 5A 00 1F      [ 1] 4110 	dec loop_depth 
      00A708 FC               [ 2] 4111 	jp (x)
                                   4112 
                                   4113 ;--------------------------
                                   4114 ; BASIC: PORTA...PORTI  
                                   4115 ;  return constant value 
                                   4116 ;  PORT  base address 
                                   4117 ;---------------------------
      002DE2                       4118 const_porta:
      00A708 81 50 00         [ 2] 4119 	ldw x,#PA_BASE 
      00A709 4F               [ 1] 4120 	clr a 
      00A709 CD               [ 4] 4121 	ret 
      002DE7                       4122 const_portb:
      00A70A 9A 0D A1         [ 2] 4123 	ldw x,#PB_BASE 
      00A70D 01               [ 1] 4124 	clr a 
      00A70E 27               [ 4] 4125 	ret 
      002DEC                       4126 const_portc:
      00A70F 03 CC 96         [ 2] 4127 	ldw x,#PC_BASE 
      00A712 E6               [ 1] 4128 	clr a 
      00A713 90               [ 4] 4129 	ret 
      002DF1                       4130 const_portd:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A714 F6 93 EE         [ 2] 4131 	ldw x,#PD_BASE 
      00A717 01               [ 1] 4132 	clr a 
      00A718 72               [ 4] 4133 	ret 
      002DF6                       4134 const_porte:
      00A719 A9 00 03         [ 2] 4135 	ldw x,#PE_BASE 
      00A71C A3               [ 1] 4136 	clr a 
      00A71D 00               [ 4] 4137 	ret 
      002DFB                       4138 const_portf:
      00A71E 05 23 05         [ 2] 4139 	ldw x,#PF_BASE 
      00A721 A6               [ 1] 4140 	clr a 
      00A722 0A               [ 4] 4141 	ret 
      002E00                       4142 const_portg:
      00A723 CC 96 E8         [ 2] 4143 	ldw x,#PG_BASE 
      00A726 9F               [ 1] 4144 	clr a 
      00A727 C7               [ 4] 4145 	ret 
      002E05                       4146 const_porti:
      00A728 00 0F A6         [ 2] 4147 	ldw x,#PI_BASE 
      00A72B 05               [ 1] 4148 	clr a 
      00A72C C0               [ 4] 4149 	ret 
                                   4150 
                                   4151 ;-------------------------------
                                   4152 ; following return constant 
                                   4153 ; related to GPIO register offset 
                                   4154 ;---------------------------------
      002E0A                       4155 const_odr:
      00A72D 00               [ 1] 4156 	clr a 
      00A72E 0F C7 54         [ 2] 4157 	ldw x,#GPIO_ODR
      00A731 00               [ 4] 4158 	ret 
      002E0F                       4159 const_idr:
      00A732 72               [ 1] 4160 	clr a 
      00A733 16 54 02         [ 2] 4161 	ldw x,#GPIO_IDR
      00A736 72               [ 4] 4162 	ret 
      002E14                       4163 const_ddr:
      00A737 10               [ 1] 4164 	clr a
      00A738 54 01 72         [ 2] 4165 	ldw x,#GPIO_DDR
      00A73B 0F               [ 4] 4166 	ret 
      002E19                       4167 const_cr1:
      00A73C 54               [ 1] 4168 	clr a 
      00A73D 00 FB CE         [ 2] 4169 	ldw x,#GPIO_CR1
      00A740 54               [ 4] 4170 	ret 
      002E1E                       4171 const_cr2:
      00A741 04               [ 1] 4172 	clr a
      00A742 A6 84 81         [ 2] 4173 	ldw x,#GPIO_CR2
      00A745 81               [ 4] 4174 	ret 
                                   4175 ;-------------------------
                                   4176 ; BASIC: POUT 
                                   4177 ;  constant for port mode
                                   4178 ;  used by PMODE 
                                   4179 ;  to set pin as output
                                   4180 ;------------------------
      002E23                       4181 const_output:
      00A745 52               [ 1] 4182 	clr a 
      00A746 01 CD 9A         [ 2] 4183 	ldw x,#OUTP
      00A749 0D               [ 4] 4184 	ret 
                                   4185 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4186 ;-------------------------
                                   4187 ; BASIC: PINP 
                                   4188 ;  constant for port mode
                                   4189 ;  used by PMODE 
                                   4190 ;  to set pin as input
                                   4191 ;------------------------
      002E28                       4192 const_input:
      00A74A A1               [ 1] 4193 	clr a  
      00A74B 01 27 03         [ 2] 4194 	ldw x,#INP 
      00A74E CC               [ 4] 4195 	ret 
                                   4196 	
                                   4197 ;-----------------------
                                   4198 ; memory area constants
                                   4199 ;-----------------------
      002E2D                       4200 const_eeprom_base:
      00A74F 96               [ 1] 4201 	clr a  
      00A750 E6 90 F6         [ 2] 4202 	ldw x,#EEPROM_BASE 
      00A753 93               [ 4] 4203 	ret 
                                   4204 
                                   4205 ;---------------------------
                                   4206 ; BASIC: DATA 
                                   4207 ; when the interpreter find 
                                   4208 ; a DATA line it skip it.
                                   4209 ;---------------------------
      002E32                       4210 data:
      00A754 EE 01 72 A9 00   [ 1] 4211 	mov in,count 
      00A759 03               [ 4] 4212 	ret 
                                   4213 
                                   4214 ;------------------------------
                                   4215 ; check if it is a DATA line 
                                   4216 ; input: 
                                   4217 ;    X    line address 
                                   4218 ; output:
                                   4219 ;    Z    set if DATA line 
                                   4220 ;----------------------------
      002E38                       4221 is_data_line:
      00A75A A3               [ 2] 4222 	pushw x 
      00A75B 00 0F            [ 1] 4223 	ld a,(3,x)
      00A75D 23 05            [ 1] 4224 	cp a,#TK_CMD 
      00A75F A6 0A            [ 1] 4225 	jrne 9$
      00A761 CC 96            [ 2] 4226 	ldw x,(4,x)
      00A763 E8 CD AC         [ 2] 4227 	cpw x,#data  
      00A766 2F               [ 2] 4228 9$: popw x 
      00A767 6B               [ 4] 4229 	ret 
                                   4230 
                                   4231 ;---------------------------------
                                   4232 ; BASIC: RESTORE [line#]
                                   4233 ; set data_ptr to first data line
                                   4234 ; if no DATA found pointer set to
                                   4235 ; zero.
                                   4236 ; if a line# is given as argument 
                                   4237 ; a data line with that number 
                                   4238 ; is searched and the data pointer 
                                   4239 ; is set to it. If there is no 
                                   4240 ; data line with that number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                                   4241 ; the program is interrupted. 
                                   4242 ;---------------------------------
      002E46                       4243 restore:
      00A768 01               [ 1] 4244 	clrw x 
      00A769 E6 01 0D         [ 2] 4245 	ldw data_ptr,x 
      00A76C 01 27 05         [ 2] 4246 	ldw data_ofs,x 
      00A76F 44 0A 01         [ 2] 4247 	ldw x,txtbgn 
      00A772 26 FB A4         [ 4] 4248 	call next_token 
      00A775 01 5F            [ 1] 4249 	cp a,#TK_INTGR
      00A777 97 4F            [ 1] 4250 	jrne 0$
      00A779 5B 01 81         [ 4] 4251 	call get_int24
      00A77C 90 89            [ 2] 4252 	pushw y 
      00A77C 52               [ 1] 4253 	clr a 
      00A77D 02 CD 9A         [ 4] 4254 	call search_lineno  
      00A780 12 A1            [ 2] 4255 	popw y 
      00A782 02               [ 2] 4256 	tnzw x 
      00A783 27 03            [ 1] 4257 	jrne set_data_pointer 
      00A785 CC 96            [ 2] 4258 	jra data_error 
      002E67                       4259 0$:
      002E67                       4260 	_unget_token  
      00A787 E6 90 F6 93 EE   [ 1]    1      mov in,in.saved  
                                   4261 ; search first DATA line 	
      00A78C 01 72 A9         [ 2] 4262 1$:	cpw x,txtend
      00A78F 00 03            [ 1] 4263 	jruge data_error 
      002E71                       4264 2$:	
      00A791 9F 6B 02         [ 4] 4265 	call is_data_line 
      00A794 90 F6            [ 1] 4266 	jrne 4$
      00A796 93 EE 01         [ 4] 4267 4$:	call try_next_line 
      00A799 72 A9            [ 1] 4268 	jrne 4$ 
      00A79B 00               [ 4] 4269 	ret 
                                   4270 
                                   4271 ;---------------------
                                   4272 ; set data pointer 
                                   4273 ; variables at new line 
                                   4274 ; input:
                                   4275 ;    X    line address 
                                   4276 ;----------------------
      002E7C                       4277 set_data_pointer:
      00A79C 03 A3 00         [ 2] 4278 	ldw data_ptr,x
      00A79F 0F 23            [ 1] 4279 	ld a,(2,x)
      00A7A1 05 A6 0A         [ 1] 4280 	ld data_len,a 
      00A7A4 CC 96 E8 CD      [ 1] 4281 	mov data_ofs,#FIRST_DATA_ITEM
      00A7A8 AC               [ 4] 4282 	ret 
                                   4283 
                                   4284 
                                   4285 ;--------------------
                                   4286 ; at end of data line 
                                   4287 ; check if next line 
                                   4288 ; is a data line 
                                   4289 ; input:
                                   4290 ;    X   actual line address 
                                   4291 ;  
                                   4292 ;-------------------
      002E89                       4293 try_next_line: 
      00A7A9 2F 6B            [ 1] 4294 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A7AB 01 A6 01         [ 1] 4295 	ld acc8,a 
      00A7AE 0D 01 27 05      [ 1] 4296 	clr acc16 
      00A7B2 48 0A 01 26      [ 2] 4297 	addw x,acc16 
      00A7B6 FB 0D 02         [ 2] 4298 	cpw x,txtend 
      00A7B9 26 05            [ 1] 4299 	jrult 1$
      00A7BB 43 E4            [ 2] 4300 	jra data_error 
      002E9D                       4301 1$:	
      00A7BD 00 20 02         [ 4] 4302 	call is_data_line 
      00A7C0 EA 00            [ 1] 4303 	jreq 2$
      00A7C2 E7 00            [ 1] 4304 	ld a,#1  
      00A7C4 5B 02            [ 2] 4305 	jra 9$
      00A7C6 81 2E 7C         [ 4] 4306 2$:	call set_data_pointer
      00A7C7 4F               [ 1] 4307 	clr a  
      00A7C7 72               [ 4] 4308 9$:	ret 
      002EAB                       4309 data_error:	
      00A7C8 00 00            [ 1] 4310     ld a,#ERR_NO_DATA 
      00A7CA 23 02 4F         [ 2] 4311 	jp tb_error 
                                   4312 
                                   4313 
                                   4314 ;---------------------------------
                                   4315 ; BASIC: READ 
                                   4316 ; return next data item | 0 
                                   4317 ;---------------------------------
                           000001  4318 	CTX_BPTR=1 
                           000003  4319 	CTX_IN=3 
                           000004  4320 	CTX_COUNT=4 
                           000005  4321 	INT24=5
                           000007  4322 	VSIZE=7 
      002EB0                       4323 read:
      002EB0                       4324 	_vars  VSIZE 
      00A7CD 81 07            [ 2]    1     sub sp,#VSIZE 
      00A7CE CD 20 AF         [ 4] 4325 	call save_context
      002EB5                       4326 read01:	
      00A7CE AE A7 F5         [ 1] 4327 	ld a,data_ofs
      00A7D1 CD 89 E8         [ 1] 4328 	cp a,data_len 
      00A7D4 5B 02            [ 1] 4329 	jreq 2$ ; end of line  
      002EBD                       4330 0$:
      00A7D6 52 04 CD         [ 2] 4331 	ldw x,data_ptr 
      00A7D9 A1 2F AE         [ 2] 4332 	ldw basicptr,x 
      00A7DC 16 90 CF 00 05   [ 1] 4333 	mov in,data_ofs 
      00A7E1 7F 72 5F 00 04   [ 1] 4334 	mov count,data_len  
      00A7E6 5F CF 00         [ 4] 4335 	call expression 
      00A7E9 01 72            [ 1] 4336 	cp a,#TK_INTGR 
      00A7EB 11 00            [ 1] 4337 	jreq 1$ 
      00A7ED 23 72 18         [ 2] 4338 	jp syntax_error 
      002ED7                       4339 1$:
      00A7F0 00 23 CC         [ 4] 4340 	call next_token ; skip comma
      00A7F3 97 91 0A         [ 2] 4341 	ldw x,basicptr 
      00A7F6 62 72 65         [ 2] 4342 	ldw data_ptr,x 
      00A7F9 61 6B 20 70 6F   [ 1] 4343 	mov data_ofs,in 
      00A7FE 69 6E 74         [ 4] 4344 	call rest_context
      002EE8                       4345 	_xpop 
      00A801 2C 20            [ 1]    1     ld a,(y)
      00A803 52               [ 1]    2     ldw x,y 
      00A804 55 4E            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A806 20 74 6F 20      [ 2]    4     addw y,#CELL_SIZE 
      002EF1                       4346 	_drop VSIZE 
      00A80A 72 65            [ 2]    1     addw sp,#VSIZE 
      00A80C 73               [ 4] 4347 	ret 
      002EF4                       4348 2$: ; end of line reached 
                                   4349 	; try next line 
      00A80D 75 6D 65         [ 2] 4350 	ldw x,data_ptr  
      00A810 2E 0A 00         [ 4] 4351 	call try_next_line
      00A813 27 C1            [ 1] 4352 	jreq 0$ 
      00A813 72 01            [ 2] 4353 	jra data_error 
                                   4354 
                                   4355 ;---------------------------------
                                   4356 ; BASIC: SPIEN clkdiv, 0|1  
                                   4357 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4358 ; if clkdiv==-1 disable SPI
                                   4359 ; 0|1 -> disable|enable  
                                   4360 ;--------------------------------- 
                           000005  4361 SPI_CS_BIT=5
      002EFE                       4362 spi_enable:
      00A815 00 23 01         [ 4] 4363 	call arg_list 
      00A818 81 02            [ 1] 4364 	cp a,#2
      00A819 27 03            [ 1] 4365 	jreq 1$
      00A819 CD 95 1E         [ 2] 4366 	jp syntax_error 
      002F08                       4367 1$: 
      00A81C 81 12 50 C7      [ 1] 4368 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A81D 85               [ 2] 4369 	popw x  
      00A81D 72               [ 2] 4370 	tnzw x 
      00A81E 5F 00            [ 1] 4371 	jreq spi_disable 
      00A820 19               [ 2] 4372 	popw x 
      00A821 52 03            [ 1] 4373 	ld a,#(1<<SPI_CR1_BR)
      00A823 CD               [ 4] 4374 	mul x,a 
      00A824 98               [ 1] 4375 	ld a,xl 
      00A825 4A A1 04         [ 1] 4376 	ld SPI_CR1,a 
                                   4377 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A828 27 03 CC 96      [ 1] 4378 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A82C E6 CD 98 8C      [ 1] 4379 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4380 ; configure SPI as master mode 0.	
      00A830 A4 DF A1 45      [ 1] 4381 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4382 ; ~CS line controlled by sofware 	
      00A834 26 0C AE 40      [ 1] 4383 	bset SPI_CR2,#SPI_CR2_SSM 
      00A838 00 CF 00 1A      [ 1] 4384     bset SPI_CR2,#SPI_CR2_SSI 
                                   4385 ; enable SPI
      00A83C AE 47 FF 4F      [ 1] 4386 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A840 20               [ 4] 4387 	ret 
      002F31                       4388 spi_disable:
      002F31                       4389 	_drop #2; throw first argument.
      00A841 15 A1            [ 2]    1     addw sp,##2 
                                   4390 ; wait spi idle 
      00A843 46 27            [ 1] 4391 1$:	ld a,#0x82 
      00A845 06 AE 96         [ 1] 4392 	and a,SPI_SR
      00A848 0A CC            [ 1] 4393 	cp a,#2 
      00A84A 96 E8            [ 1] 4394 	jrne 1$
      00A84C 72 1D 52 00      [ 1] 4395 	bres SPI_CR1,#SPI_CR1_SPE
      00A84C AE B6 80 CF      [ 1] 4396 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A850 00 1A A6 02      [ 1] 4397 	bres PE_DDR,#SPI_CS_BIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A854 AE               [ 4] 4398 	ret 
                                   4399 
      002F49                       4400 spi_clear_error:
      00A855 7F FF            [ 1] 4401 	ld a,#0x78 
      00A857 C5 52 03         [ 1] 4402 	bcp a,SPI_SR 
      00A857 6B 01            [ 1] 4403 	jreq 1$
      00A859 1F 02 CD 87      [ 1] 4404 	clr SPI_SR 
      00A85D 89               [ 4] 4405 1$: ret 
                                   4406 
      00A85E                       4407 spi_send_byte:
      00A85E CD               [ 1] 4408 	push a 
      00A85F 89 0B 27         [ 4] 4409 	call spi_clear_error
      00A862 08               [ 1] 4410 	pop a 
      00A863 A6 45 CD 89 8B   [ 2] 4411 	btjf SPI_SR,#SPI_SR_TXE,.
      00A868 CD 88 07         [ 1] 4412 	ld SPI_DR,a
      00A86B AE 00 80 CD 88   [ 2] 4413 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A870 FD 7B 01         [ 1] 4414 	ld a,SPI_DR 
      00A873 1E               [ 4] 4415 	ret 
                                   4416 
      002F6B                       4417 spi_rcv_byte:
      00A874 02 72            [ 1] 4418 	ld a,#255
      00A876 B0 00 1A C2 00   [ 2] 4419 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A87B 19 22 E0         [ 1] 4420 	ld a,SPI_DR 
      00A87E CD               [ 4] 4421 	ret
                                   4422 
                                   4423 ;------------------------------
                                   4424 ; BASIC: SPIWR byte [,byte]
                                   4425 ; write 1 or more byte
                                   4426 ;------------------------------
      002F76                       4427 spi_write:
      00A87F 95 1E 1E         [ 4] 4428 	call expression
      00A882 02 A3            [ 1] 4429 	cp a,#TK_INTGR 
      00A884 47 FF            [ 1] 4430 	jreq 1$
      00A886 26 03 CD         [ 2] 4431 	jp syntax_error 
      002F80                       4432 1$:	
      00A889 9D               [ 1] 4433 	ld a,xl 
      00A88A EE 2F 55         [ 4] 4434 	call spi_send_byte 
      00A88B CD 17 CA         [ 4] 4435 	call next_token 
      00A88B 5B 03            [ 1] 4436 	cp a,#TK_COMMA 
      00A88D 81 02            [ 1] 4437 	jrne 2$ 
      00A88E 20 E9            [ 2] 4438 	jra spi_write 
      00A88E CE               [ 1] 4439 2$:	tnz a 
      00A88F B6 80            [ 1] 4440 	jreq 3$
      002F90                       4441 	_unget_token  
      00A891 C3 A9 4E 81 01   [ 1]    1      mov in,in.saved  
      00A895 81               [ 4] 4442 3$:	ret 
                                   4443 
                                   4444 
                                   4445 ;-------------------------------
                                   4446 ; BASIC: SPIRD 	
                                   4447 ; read one byte from SPI 
                                   4448 ;-------------------------------
      002F96                       4449 spi_read:
      00A895 88 4D 27         [ 4] 4450 	call spi_rcv_byte 
      00A898 0A               [ 1] 4451 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A899 F6               [ 1] 4452 	ld xl,a 
      00A89A 5C               [ 1] 4453 	clr a  
      00A89B 90               [ 4] 4454 	ret 
                                   4455 
                                   4456 ;------------------------------
                                   4457 ; BASIC: SPISEL 0|1 
                                   4458 ; set state of ~CS line
                                   4459 ; 0|1 deselect|select  
                                   4460 ;------------------------------
      002F9D                       4461 spi_select:
      00A89C F7 90 5C         [ 4] 4462 	call next_token 
      00A89F 0A 01            [ 1] 4463 	cp a,#TK_INTGR 
      00A8A1 26 F6            [ 1] 4464 	jreq 1$
      00A8A3 84 81 66         [ 2] 4465 	jp syntax_error 
      00A8A5 5D               [ 2] 4466 1$: tnzw x  
      00A8A5 88 90            [ 1] 4467 	jreq cs_high 
      00A8A7 AE 16 E0 90      [ 1] 4468 	bres PE_ODR,#SPI_CS_BIT
      00A8AB 89               [ 4] 4469 	ret 
      002FAF                       4470 cs_high: 
      00A8AC A6 80 90 7F      [ 1] 4471 	bset PE_ODR,#SPI_CS_BIT
      00A8B0 90               [ 4] 4472 	ret 
                                   4473 
                                   4474 ;-------------------------------
                                   4475 ; BASIC: PAD 
                                   4476 ; Return pad buffer address.
                                   4477 ;------------------------------
      002FB4                       4478 pad_ref:
      00A8B1 5C 4A 26         [ 2] 4479 	ldw x,#pad 
      00A8B4 F9               [ 1] 4480 	clr a
      00A8B5 90               [ 4] 4481 	ret 
                                   4482 
                                   4483 ;****************************
                                   4484 ; expression stack 
                                   4485 ; manipulation routines
                                   4486 ;****************************
                                   4487 
                                   4488 ;-----------------------------
                                   4489 ; BASIC: PUSH expr|rel|cond 
                                   4490 ; push the result on xtack
                                   4491 ;-----------------------------
      002FB9                       4492 xpush:
      00A8B6 85 84 81         [ 4] 4493 	call condition 
      00A8B9 81               [ 4] 4494 	ret 
                                   4495 
                                   4496 ;------------------------------
                                   4497 ; BASIC: POP 
                                   4498 ; pop top of xstack 
                                   4499 ;------------------------------
      002FBD                       4500 xpop:
      002FBD                       4501 	_xpop 
      00A8B9 89 90            [ 1]    1     ld a,(y)
      00A8BB 89               [ 1]    2     ldw x,y 
      00A8BC 52 06            [ 2]    3     ldw x,(1,x)
      00A8BE CD A8 8E 26      [ 2]    4     addw y,#CELL_SIZE 
      00A8C2 09               [ 4] 4502 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



                                   4503 
                                   4504 
                                   4505 ;------------------------------
                                   4506 ; BASIC: ALLOC expr 
                                   4507 ; allocate expr element on xtack 
                                   4508 ;-------------------------------
      002FC7                       4509 xalloc: 
      00A8C3 AE A9 50         [ 4] 4510 	call expression 
      00A8C6 CD 89            [ 1] 4511 	cp a,#TK_INTGR
      00A8C8 E8 CC            [ 1] 4512 	jreq 1$ 
      00A8CA A9 48 66         [ 2] 4513 	jp syntax_error
      00A8CC                       4514 1$: _xpop 
      00A8CC CE 00            [ 1]    1     ld a,(y)
      00A8CE 1C               [ 1]    2     ldw x,y 
      00A8CF C3 00            [ 2]    3     ldw x,(1,x)
      00A8D1 1E 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A8D5 A9               [ 1] 4515 	tnz a 
      00A8D6 92 CD            [ 1] 4516 	jreq 3$ 
      00A8D8 89 E8            [ 1] 4517 2$:	ld a,#ERR_BAD_VALUE
      00A8DA CC A9 48         [ 2] 4518 	jp tb_error 
      00A8DD A3 00 14         [ 2] 4519 3$: cpw x,#XSTACK_SIZE 
      00A8DD CD 87            [ 1] 4520 	jrugt 2$
      00A8DF C9 72            [ 1] 4521 	ld a,#CELL_SIZE 
      00A8E1 5F               [ 4] 4522 	mul x,a 
      00A8E2 00 19 AE         [ 2] 4523 	ldw acc16,x 
      00A8E5 B6 80 CF 00      [ 2] 4524 	subw y,acc16 
      00A8E9 1A CD 9F 08      [ 2] 4525 	cpw y,#xstack_full
      00A8ED 1F 05            [ 1] 4526 	jrugt 9$
      00A8EF 0F 03            [ 1] 4527 	ld a,#ERR_MEM_FULL
      00A8F1 CD A8 A5         [ 2] 4528 	jp tb_error 
      002FFC                       4529 9$:	 
      00A8F4 CE               [ 4] 4530 	ret 
                                   4531 
                                   4532 
                                   4533 ;------------------------------
                                   4534 ;  BASIC DROP expr 
                                   4535 ;  expr in range {0..XSTACK_SIZE}
                                   4536 ;  discard n elements from xtack
                                   4537 ;------------------------------
      002FFD                       4538 xdrop:
      00A8F5 A9 4E 90         [ 4] 4539 	call expression 
      00A8F8 FF 72            [ 1] 4540 	cp a,#TK_INTGR
      00A8FA A9 00            [ 1] 4541 	jreq 1$ 
      00A8FC 02 1E 05         [ 2] 4542 	jp syntax_error 
      003007                       4543 1$:	_xpop 
      00A8FF 90 FF            [ 1]    1     ld a,(y)
      00A901 72               [ 1]    2     ldw x,y 
      00A902 A9 00            [ 2]    3     ldw x,(1,x)
      00A904 02 A6 7C 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A908 04               [ 1] 4544 	ld a,xl 
      00A909 A3 00            [ 1] 4545 	and a,#0x1f 
      00A90B 7C               [ 1] 4546 	clrw x 
      00A90C 22               [ 1] 4547 	ld xl,a 
      00A90D 01 9F            [ 1] 4548 	ld a,#CELL_SIZE 
      00A90F 6B               [ 4] 4549 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A910 04 CE 00         [ 2] 4550 	ldw acc16,x  
      00A913 1C 1F 01 0D      [ 2] 4551 	addw y,acc16 
      00A916 90 A3 17 73      [ 2] 4552 	cpw y,#XSTACK_EMPTY 
      00A916 1E 01            [ 2] 4553 	jrule 9$
      00A918 7B 04 CD A8      [ 2] 4554 	ldw y,#XSTACK_EMPTY 
      00A91C 95               [ 4] 4555 9$:	ret 
                                   4556 
                                   4557 ;-----------------------
                                   4558 ; check if value in A:X 
                                   4559 ; is inside xstack bound
                                   4560 ; output:
                                   4561 ;    X     slot address  
                                   4562 ;-----------------------
      00302A                       4563 xstack_bound:
      00A91D 1F               [ 1] 4564 	tnz a 
      00A91E 01 AE            [ 1] 4565 	jrne 8$ 
      00A920 16 E0 CD         [ 2] 4566 1$: cpw x,#XSTACK_SIZE 
      00A923 87 E3            [ 1] 4567 	jrugt 8$
      00A925 AE 00            [ 1] 4568 	ld a,#CELL_SIZE 
      00A927 80               [ 4] 4569 	mul x,a
      00A928 CD 88 FD         [ 2] 4570 	ldw acc16,x 
      00A92B 1E               [ 1] 4571 	ldw x,y 
      00A92C 01 C3 00 1E      [ 2] 4572 	addw x,acc16 
      00A930 24 16 1E         [ 2] 4573 	cpw x,#XSTACK_EMPTY 
      00A933 05 72            [ 1] 4574 	jruge 8$  
      00A935 F0               [ 4] 4575 	ret 
      00A936 03 1F            [ 1] 4576 8$: ld a,#ERR_BAD_VALUE
      00A938 05 A6 80         [ 2] 4577 	jp tb_error 
                                   4578 
                                   4579 ;-------------------------
                                   4580 ; BASIC: PUT expr, cond 
                                   4581 ; expr -> slot 
                                   4582 ; cond -> valut to put 
                                   4583 ; on xstack 
                                   4584 ;-------------------------
      003048                       4585 xput:
      00A93B A3 00 80         [ 4] 4586 	call arg_list 
      00A93E 24 01            [ 1] 4587 	cp a,#2 
      00A940 9F 6B            [ 1] 4588 	jreq 1$ 
      00A942 04 CD A8         [ 2] 4589 0$:	jp syntax_error
      003052                       4590 1$: _xpop   ; value to put 
      00A945 A5 20            [ 1]    1     ld a,(y)
      00A947 CE               [ 1]    2     ldw x,y 
      00A948 5B 06            [ 2]    3     ldw x,(1,x)
      00A94A 90 85 85 81      [ 2]    4     addw y,#CELL_SIZE 
      00A94E 54               [ 2] 4591 	pushw x 
      00A94F 42               [ 1] 4592 	push a 
      00305D                       4593 	_xpop    ; slot 
      00A950 43 61            [ 1]    1     ld a,(y)
      00A952 6E               [ 1]    2     ldw x,y 
      00A953 27 74            [ 2]    3     ldw x,(1,x)
      00A955 20 66 6C 61      [ 2]    4     addw y,#CELL_SIZE 
      00A959 73 68 20         [ 4] 4594 	call xstack_bound
      00A95C 61 70 70         [ 2] 4595     ldw ptr16,x 
      00A95F 6C               [ 1] 4596 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A960 69               [ 2] 4597 	popw x 
      00A961 63 61 74 69      [ 4] 4598 	ld [ptr16],a 
      00A965 6F 6E 2C 20      [ 1] 4599 	inc ptr8 
      00A969 61 6C 72 65      [ 5] 4600 	ldw [ptr16],x 
      00A96D 61               [ 4] 4601 	ret 
                                   4602 
                                   4603 ;------------------------
                                   4604 ; BASIC: PICK expr 
                                   4605 ; get nième element on 
                                   4606 ; xtack. 
                                   4607 ;-----------------------
      00307B                       4608 xpick:
      00A96E 64 79 20         [ 4] 4609 	call func_args 
      00A971 6F 6E            [ 1] 4610 	cp a,#1 
      00A973 65 20            [ 1] 4611 	jreq 1$
      00A975 69 6E 20         [ 2] 4612 	jp syntax_error 
      003085                       4613 1$: _xpop 
      00A978 46 4C            [ 1]    1     ld a,(y)
      00A97A 41               [ 1]    2     ldw x,y 
      00A97B 53 48            [ 2]    3     ldw x,(1,x)
      00A97D 0A 75 73 65      [ 2]    4     addw y,#CELL_SIZE 
      00A981 20 45 52         [ 4] 4614 	call xstack_bound
      00A984 41               [ 1] 4615     ld a,(x)
      00A985 53 45            [ 2] 4616 	ldw x,(1,x)				
      00A987 20               [ 4] 4617 	ret 
                                   4618 
                                   4619 
                                   4620 
                                   4621 ;------------------------------
                                   4622 ;      dictionary 
                                   4623 ; format:
                                   4624 ;   link:   2 bytes 
                                   4625 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4626 ;   cmd_name: 16 byte max 
                                   4627 ;   code_addr: 2 bytes 
                                   4628 ;------------------------------
                                   4629 	.macro _dict_entry len,name,code_addr 
                                   4630 	.word LINK 
                                   4631 	LINK=.
                                   4632 name:
                                   4633 	.byte len   	
                                   4634 	.ascii "name"
                                   4635 	.word code_addr  
                                   4636 	.endm 
                                   4637 
                           000000  4638 	LINK=0
                                   4639 ; respect alphabetic order for BASIC names from Z-A
                                   4640 ; this sort order is for a cleaner WORDS cmd output. 	
      003095                       4641 kword_end:
      003095                       4642 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00A988 5C 46                    1 	.word LINK 
                           003097     2 	LINK=.
      003097                          3 XOR:
      00A98A 20                       4 	.byte 3+F_XOR   	
      00A98B 62 65 66                 5 	.ascii "XOR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A98E 6F 72                    6 	.word TK_XOR  
      00309D                       4643 	_dict_entry,5,WRITE,write  
      00A990 65 00                    1 	.word LINK 
                           00309F     2 	LINK=.
      00309F                          3 WRITE:
      00A992 4E                       4 	.byte 5   	
      00A993 6F 20 61 70 70           5 	.ascii "WRITE"
      00A998 6C 69                    6 	.word write  
      0030A7                       4644 	_dict_entry,5,WORDS,words 
      00A99A 63 61                    1 	.word LINK 
                           0030A9     2 	LINK=.
      0030A9                          3 WORDS:
      00A99C 74                       4 	.byte 5   	
      00A99D 69 6F 6E 20 69           5 	.ascii "WORDS"
      00A9A2 6E 20                    6 	.word words  
      0030B1                       4645 	_dict_entry 4,WAIT,wait 
      00A9A4 52 41                    1 	.word LINK 
                           0030B3     2 	LINK=.
      0030B3                          3 WAIT:
      00A9A6 4D                       4 	.byte 4   	
      00A9A7 00 41 49 54              5 	.ascii "WAIT"
      00A9A8 21 74                    6 	.word wait  
      0030BA                       4646 	_dict_entry,3+F_IFUNC,USR,usr
      00A9A8 CD 9B                    1 	.word LINK 
                           0030BC     2 	LINK=.
      0030BC                          3 USR:
      00A9AA 56                       4 	.byte 3+F_IFUNC   	
      00A9AB A1 84 27                 5 	.ascii "USR"
      00A9AE 03 CC                    6 	.word usr  
      0030C2                       4647 	_dict_entry,5,UNTIL,until 
      00A9B0 96 E6                    1 	.word LINK 
                           0030C4     2 	LINK=.
      0030C4                          3 UNTIL:
      00A9B2 90                       4 	.byte 5   	
      00A9B3 F6 93 EE 01 72           5 	.ascii "UNTIL"
      00A9B8 A9 00                    6 	.word until  
      0030CC                       4648 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A9BA 03 C7                    1 	.word LINK 
                           0030CE     2 	LINK=.
      0030CE                          3 UFLASH:
      00A9BC 00                       4 	.byte 6+F_IFUNC   	
      00A9BD 19 CF 00 1A 53 48        5 	.ascii "UFLASH"
      00A9C1 2A 02                    6 	.word uflash  
      0030D7                       4649 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00A9C1 CD 98                    1 	.word LINK 
                           0030D9     2 	LINK=.
      0030D9                          3 UBOUND:
      00A9C3 4A                       4 	.byte 6+F_IFUNC   	
      00A9C4 A1 08 27 02 20 20        5 	.ascii "UBOUND"
      00A9CA CD 9B                    6 	.word ubound  
      0030E2                       4650 	_dict_entry,4,TONE,tone  
      00A9CC 56 A1                    1 	.word LINK 
                           0030E4     2 	LINK=.
      0030E4                          3 TONE:
      00A9CE 84                       4 	.byte 4   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00A9CF 27 03 CC 96              5 	.ascii "TONE"
      00A9D3 E6 90                    6 	.word tone  
      0030EB                       4651 	_dict_entry,2,TO,to
      00A9D5 F6 93                    1 	.word LINK 
                           0030ED     2 	LINK=.
      0030ED                          3 TO:
      00A9D7 EE                       4 	.byte 2   	
      00A9D8 01 72                    5 	.ascii "TO"
      00A9DA A9 00                    6 	.word to  
      0030F2                       4652 	_dict_entry,5,TIMER,set_timer
      00A9DC 03 9F                    1 	.word LINK 
                           0030F4     2 	LINK=.
      0030F4                          3 TIMER:
      00A9DE 5F                       4 	.byte 5   	
      00A9DF CD 88 2D AE 00           5 	.ascii "TIMER"
      00A9E4 01 CD                    6 	.word set_timer  
      0030FC                       4653 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A9E6 88 FD                    1 	.word LINK 
                           0030FE     2 	LINK=.
      0030FE                          3 TIMEOUT:
      00A9E8 20                       4 	.byte 7+F_IFUNC   	
      00A9E9 D7 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A9EA 2C FB                    6 	.word timeout  
      003108                       4654 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A9EA 81 FE                    1 	.word LINK 
                           00310A     2 	LINK=.
      00A9EB                          3 TICKS:
      00A9EB CD                       4 	.byte 5+F_IFUNC   	
      00A9EC 9A 0D A1 01 27           5 	.ascii "TICKS"
      00A9F1 03 CC                    6 	.word get_ticks  
      003112                       4655 	_dict_entry,4,STOP,stop 
      00A9F3 96 E6                    1 	.word LINK 
                           003114     2 	LINK=.
      003114                          3 STOP:
      00A9F5 90                       4 	.byte 4   	
      00A9F6 F6 93 EE 01              5 	.ascii "STOP"
      00A9FA 72 A9                    6 	.word stop  
      00311B                       4656 	_dict_entry,4,STEP,step 
      00A9FC 00 03                    1 	.word LINK 
                           00311D     2 	LINK=.
      00311D                          3 STEP:
      00A9FE 9F                       4 	.byte 4   	
      00A9FF A4 7F 81 50              5 	.ascii "STEP"
      00AA02 23 24                    6 	.word step  
      003124                       4657 	_dict_entry,5,SPIWR,spi_write
      00AA02 A6 06                    1 	.word LINK 
                           003126     2 	LINK=.
      003126                          3 SPIWR:
      00AA04 CD                       4 	.byte 5   	
      00AA05 9A 00 CD 98 4A           5 	.ascii "SPIWR"
      00AA0A A1 02                    6 	.word spi_write  
      00312E                       4658 	_dict_entry,6,SPISEL,spi_select
      00AA0C 27 0E                    1 	.word LINK 
                           003130     2 	LINK=.
      003130                          3 SPISEL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AA0E A1                       4 	.byte 6   	
      00AA0F 04 27 12 A1 82 27        5 	.ascii "SPISEL"
      00AA15 03 CC                    6 	.word spi_select  
      003139                       4659 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AA17 96 E6                    1 	.word LINK 
                           00313B     2 	LINK=.
      00AA19                          3 SPIRD:
      00AA19 FD                       4 	.byte 5+F_IFUNC   	
      00AA1A 20 0B 49 52 44           5 	.ascii "SPIRD"
      00AA1C 2F 96                    6 	.word spi_read  
      003143                       4660 	_dict_entry,5,SPIEN,spi_enable 
      00AA1C F6 88                    1 	.word LINK 
                           003145     2 	LINK=.
      003145                          3 SPIEN:
      00AA1E CD                       4 	.byte 5   	
      00AA1F 98 63 84 20 03           5 	.ascii "SPIEN"
      00AA24 2E FE                    6 	.word spi_enable  
      00314D                       4661 	_dict_entry,5,SLEEP,sleep 
      00AA24 CD 98                    1 	.word LINK 
                           00314F     2 	LINK=.
      00314F                          3 SLEEP:
      00AA26 8C                       4 	.byte 5   	
      00AA27 5F 02 72 A2 00           5 	.ascii "SLEEP"
      00AA2C 03 90                    6 	.word sleep  
      003157                       4662     _dict_entry,4,SIZE,cmd_size 
      00AA2E F7 90                    1 	.word LINK 
                           003159     2 	LINK=.
      003159                          3 SIZE:
      00AA30 EF                       4 	.byte 4   	
      00AA31 01 A6 07 CD              5 	.ascii "SIZE"
      00AA35 9A 00                    6 	.word cmd_size  
      00AA37                       4663 	_dict_entry,4,SAVE,save_app 
      00AA37 90 F6                    1 	.word LINK 
                           003162     2 	LINK=.
      003162                          3 SAVE:
      00AA39 93                       4 	.byte 4   	
      00AA3A EE 01 72 A9              5 	.ascii "SAVE"
      00AA3E 00 03                    6 	.word save_app  
      003169                       4664 	_dict_entry 3,RUN,run
      00AA40 81 62                    1 	.word LINK 
                           00316B     2 	LINK=.
      00AA41                          3 RUN:
      00AA41 CD                       4 	.byte 3   	
      00AA42 89 9B 81                 5 	.ascii "RUN"
      00AA45 25 3A                    6 	.word run  
      003171                       4665 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AA45 5F C6                    1 	.word LINK 
                           003173     2 	LINK=.
      003173                          3 RSHIFT:
      00AA47 00                       4 	.byte 6+F_IFUNC   	
      00AA48 2F C0 00 30 27 03        5 	.ascii "RSHIFT"
      00AA4E 53 A6                    6 	.word rshift  
      00317C                       4666 	_dict_entry,3+F_IFUNC,RND,random 
      00AA50 FF 73                    1 	.word LINK 
                           00317E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA51                          3 RND:
      00AA51 81                       4 	.byte 3+F_IFUNC   	
      00AA52 52 4E 44                 5 	.ascii "RND"
      00AA52 CD 9A                    6 	.word random  
      003184                       4667 	_dict_entry,6,RETURN,return 
      00AA54 0D A1                    1 	.word LINK 
                           003186     2 	LINK=.
      003186                          3 RETURN:
      00AA56 02                       4 	.byte 6   	
      00AA57 27 03 CC 96 E6 90        5 	.ascii "RETURN"
      00AA5D E6 03                    6 	.word return  
      00318F                       4668 	_dict_entry,7,RESTORE,restore 
      00AA5F 93 EE                    1 	.word LINK 
                           003191     2 	LINK=.
      003191                          3 RESTORE:
      00AA61 04                       4 	.byte 7   	
      00AA62 A3 50 00 2B 16 A3 50     5 	.ascii "RESTORE"
      00AA69 29 2A                    6 	.word restore  
      00319B                       4669 	_dict_entry 3,REM,remark 
      00AA6B 11 89                    1 	.word LINK 
                           00319D     2 	LINK=.
      00319D                          3 REM:
      00AA6D 90                       4 	.byte 3   	
      00AA6E F6 93 EE                 5 	.ascii "REM"
      00AA71 01 72                    6 	.word remark  
      0031A3                       4670 	_dict_entry,6,REBOOT,cold_start
      00AA73 A9 00                    1 	.word LINK 
                           0031A5     2 	LINK=.
      0031A5                          3 REBOOT:
      00AA75 03                       4 	.byte 6   	
      00AA76 72 FB 01 5B 02 4F        5 	.ascii "REBOOT"
      00AA7C 81 C3                    6 	.word cold_start  
      00AA7D                       4671 	_dict_entry,4+F_IFUNC,READ,read  
      00AA7D A6 0A                    1 	.word LINK 
                           0031B0     2 	LINK=.
      0031B0                          3 READ:
      00AA7F CC                       4 	.byte 4+F_IFUNC   	
      00AA80 96 E8 41 44              5 	.ascii "READ"
      00AA82 2E B0                    6 	.word read  
      0031B7                       4672 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AA82 CD A8                    1 	.word LINK 
                           0031B9     2 	LINK=.
      0031B9                          3 QKEY:
      00AA84 8E                       4 	.byte 4+F_IFUNC   	
      00AA85 26 13 AE B6              5 	.ascii "QKEY"
      00AA89 80 72                    6 	.word qkey  
      0031C0                       4673 	_dict_entry,3,PUT,xput 
      00AA8B BB B6                    1 	.word LINK 
                           0031C2     2 	LINK=.
      0031C2                          3 PUT:
      00AA8D 82                       4 	.byte 3   	
      00AA8E 1C 00 04                 5 	.ascii "PUT"
      00AA91 1C 00                    6 	.word xput  
      0031C8                       4674 	_dict_entry,4,PUSH,xpush   
      00AA93 80 9F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



                           0031CA     2 	LINK=.
      0031CA                          3 PUSH:
      00AA95 A4                       4 	.byte 4   	
      00AA96 80 97 20 03              5 	.ascii "PUSH"
      00AA9A AE B6                    6 	.word xpush  
      0031D1                       4675 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AA9C 80 CA                    1 	.word LINK 
                           0031D3     2 	LINK=.
      00AA9D                          3 PORTI:
      00AA9D 4F                       4 	.byte 5+F_IFUNC   	
      00AA9E 81 4F 52 54 49           5 	.ascii "PORTI"
      00AA9F 2E 05                    6 	.word const_porti  
      0031DB                       4676 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AA9F CD 9A                    1 	.word LINK 
                           0031DD     2 	LINK=.
      0031DD                          3 PORTG:
      00AAA1 0D                       4 	.byte 5+F_IFUNC   	
      00AAA2 A1 02 27 03 CC           5 	.ascii "PORTG"
      00AAA7 96 E6                    6 	.word const_portg  
      00AAA9                       4677 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AAA9 90 E6                    1 	.word LINK 
                           0031E7     2 	LINK=.
      0031E7                          3 PORTF:
      00AAAB 03                       4 	.byte 5+F_IFUNC   	
      00AAAC 93 EE 04 CF 00           5 	.ascii "PORTF"
      00AAB1 1A 90                    6 	.word const_portf  
      0031EF                       4678 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AAB3 F6 93                    1 	.word LINK 
                           0031F1     2 	LINK=.
      0031F1                          3 PORTE:
      00AAB5 EE                       4 	.byte 5+F_IFUNC   	
      00AAB6 01 72 A9 00 03           5 	.ascii "PORTE"
      00AABB 90 F7                    6 	.word const_porte  
      0031F9                       4679 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AABD 90 EF                    1 	.word LINK 
                           0031FB     2 	LINK=.
      0031FB                          3 PORTD:
      00AABF 01                       4 	.byte 5+F_IFUNC   	
      00AAC0 72 CD 00 1A 81           5 	.ascii "PORTD"
      00AAC5 2D F1                    6 	.word const_portd  
      003203                       4680 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AAC5 72 0D                    1 	.word LINK 
                           003205     2 	LINK=.
      003205                          3 PORTC:
      00AAC7 52                       4 	.byte 5+F_IFUNC   	
      00AAC8 30 FB 8E CC 81           5 	.ascii "PORTC"
      00AACD 43 EC                    6 	.word const_portc  
      00AACE                       4681 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AACE 72 0D                    1 	.word LINK 
                           00320F     2 	LINK=.
      00320F                          3 PORTB:
      00AAD0 52                       4 	.byte 5+F_IFUNC   	
      00AAD1 30 FB 72 16 00           5 	.ascii "PORTB"
      00AAD6 23 8E                    6 	.word const_portb  
      003217                       4682 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAD8 81 0F                    1 	.word LINK 
                           003219     2 	LINK=.
      00AAD9                          3 PORTA:
      00AAD9 CD                       4 	.byte 5+F_IFUNC   	
      00AADA 9B 56 A1 84 27           5 	.ascii "PORTA"
      00AADF 03 CC                    6 	.word const_porta  
      003221                       4683 	_dict_entry 5,PRINT,print 
      00AAE1 96 E6                    1 	.word LINK 
                           003223     2 	LINK=.
      003223                          3 PRINT:
      00AAE3 90                       4 	.byte 5   	
      00AAE4 F6 93 EE 01 72           5 	.ascii "PRINT"
      00AAE9 A9 00                    6 	.word print  
      00322B                       4684 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AAEB 03 23                    1 	.word LINK 
                           00322D     2 	LINK=.
      00AAEC                          3 POUT:
      00AAEC CF                       4 	.byte 4+F_IFUNC   	
      00AAED 00 13 CE 00              5 	.ascii "POUT"
      00AAF1 13 5D                    6 	.word const_output  
      003234                       4685 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AAF3 27 03                    1 	.word LINK 
                           003236     2 	LINK=.
      003236                          3 POP:
      00AAF5 8F                       4 	.byte 3+F_IFUNC   	
      00AAF6 26 F7 50                 5 	.ascii "POP"
      00AAF8 2F BD                    6 	.word xpop  
      00323C                       4686 	_dict_entry,4,POKE,poke 
      00AAF8 81 36                    1 	.word LINK 
                           00323E     2 	LINK=.
      00AAF9                          3 POKE:
      00AAF9 CD                       4 	.byte 4   	
      00AAFA 9B 56 A1 84              5 	.ascii "POKE"
      00AAFE 27 03                    6 	.word poke  
      003245                       4687 	_dict_entry,5,PMODE,pin_mode 
      00AB00 CC 96                    1 	.word LINK 
                           003247     2 	LINK=.
      003247                          3 PMODE:
      00AB02 E6                       4 	.byte 5   	
      00AB03 90 F6 93 EE 01           5 	.ascii "PMODE"
      00AB08 72 A9                    6 	.word pin_mode  
      00324F                       4688 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AB0A 00 03                    1 	.word LINK 
                           003251     2 	LINK=.
      00AB0C                          3 PINP:
      00AB0C A3                       4 	.byte 4+F_IFUNC   	
      00AB0D 14 00 2B 0C              5 	.ascii "PINP"
      00AB11 35 0F                    6 	.word const_input  
      003258                       4689 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AB13 50 F2                    1 	.word LINK 
                           00325A     2 	LINK=.
      00325A                          3 PICK:
      00AB15 A6                       4 	.byte 4+F_IFUNC   	
      00AB16 1E 62 A6 10              5 	.ascii "PICK"
      00AB1A 62 20                    6 	.word xpick  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      003261                       4690 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AB1C 1E 5A                    1 	.word LINK 
                           003263     2 	LINK=.
      00AB1D                          3 PEEK:
      00AB1D A3                       4 	.byte 4+F_IFUNC   	
      00AB1E 08 00 2B 09              5 	.ascii "PEEK"
      00AB22 35 0E                    6 	.word peek  
      00326A                       4691 	_dict_entry,5,PAUSE,pause 
      00AB24 50 F2                    1 	.word LINK 
                           00326C     2 	LINK=.
      00326C                          3 PAUSE:
      00AB26 A6                       4 	.byte 5   	
      00AB27 50 62 20 10 45           5 	.ascii "PAUSE"
      00AB2B 2A 59                    6 	.word pause  
      003274                       4692 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AB2B 35 07                    1 	.word LINK 
                           003276     2 	LINK=.
      003276                          3 PAD:
      00AB2D 50                       4 	.byte 3+F_IFUNC   	
      00AB2E F2 41 44                 5 	.ascii "PAD"
      00AB2F 2F B4                    6 	.word pad_ref  
      00327C                       4693 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AB2F A3 00                    1 	.word LINK 
                           00327E     2 	LINK=.
      00327E                          3 OR:
      00AB31 40                       4 	.byte 2+F_OR   	
      00AB32 23 07                    5 	.ascii "OR"
      00AB34 72 5C                    6 	.word TK_OR  
      003283                       4694 	_dict_entry,2,ON,cmd_on 
      00AB36 50 F2                    1 	.word LINK 
                           003285     2 	LINK=.
      003285                          3 ON:
      00AB38 54                       4 	.byte 2   	
      00AB39 20 F4                    5 	.ascii "ON"
      00AB3B 24 4D                    6 	.word cmd_on  
      00328A                       4695 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AB3B 9F 4A                    1 	.word LINK 
                           00328C     2 	LINK=.
      00328C                          3 ODR:
      00AB3D 27                       4 	.byte 3+F_IFUNC   	
      00AB3E 01 4A 52                 5 	.ascii "ODR"
      00AB40 2E 0A                    6 	.word const_odr  
      003292                       4696 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AB40 A4 3E                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 NOT:
      00AB42 C7                       4 	.byte 3+F_NOT   	
      00AB43 50 F1 72                 5 	.ascii "NOT"
      00AB46 18 50                    6 	.word TK_NOT  
      00329A                       4697 	_dict_entry,4,NEXT,next 
      00AB48 F0 8E                    1 	.word LINK 
                           00329C     2 	LINK=.
      00329C                          3 NEXT:
      00AB4A 81                       4 	.byte 4   	
      00AB4B 4E 45 58 54              5 	.ascii "NEXT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB4B C6 00                    6 	.word next  
      0032A3                       4698 	_dict_entry,3,NEW,new
      00AB4D 10 CE                    1 	.word LINK 
                           0032A5     2 	LINK=.
      0032A5                          3 NEW:
      00AB4F 00                       4 	.byte 3   	
      00AB50 11 81 57                 5 	.ascii "NEW"
      00AB52 27 93                    6 	.word new  
      0032AB                       4699 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AB52 CD 9A                    1 	.word LINK 
                           0032AD     2 	LINK=.
      0032AD                          3 LSHIFT:
      00AB54 0D                       4 	.byte 6+F_IFUNC   	
      00AB55 A1 01 27 03 CC 96        5 	.ascii "LSHIFT"
      00AB5B E6 E9                    6 	.word lshift  
      00AB5C                       4700 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AB5C CD 82                    1 	.word LINK 
                           0032B8     2 	LINK=.
      0032B8                          3 LOG2:
      00AB5E 6E                       4 	.byte 4+F_IFUNC   	
      00AB5F 90 F6 93 EE              5 	.ascii "LOG2"
      00AB63 01 72                    6 	.word log2  
      0032BF                       4701 	_dict_entry 4,LIST,list
      00AB65 A9 00                    1 	.word LINK 
                           0032C1     2 	LINK=.
      0032C1                          3 LIST:
      00AB67 03                       4 	.byte 4   	
      00AB68 81 49 53 54              5 	.ascii "LIST"
      00AB69 1F 19                    6 	.word list  
      0032C8                       4702 	_dict_entry 3,LET,let 
      00AB69 CD 9A                    1 	.word LINK 
                           0032CA     2 	LINK=.
      0032CA                          3 LET:
      00AB6B 0D                       4 	.byte 3   	
      00AB6C A1 02 27                 5 	.ascii "LET"
      00AB6F 03 CC                    6 	.word let  
      0032D0                       4703 	_dict_entry,3+F_CFUNC,KEY,key 
      00AB71 96 E6                    1 	.word LINK 
                           0032D2     2 	LINK=.
      0032D2                          3 KEY:
      00AB73 90                       4 	.byte 3+F_CFUNC   	
      00AB74 F6 93 EE                 5 	.ascii "KEY"
      00AB77 01 72                    6 	.word key  
      0032D8                       4704 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AB79 A9 00                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 IWDGREF:
      00AB7B 03                       4 	.byte 7   	
      00AB7C 9F 88 90 F6 93 EE 01     5 	.ascii "IWDGREF"
      00AB83 72 A9                    6 	.word refresh_iwdg  
      0032E4                       4705 	_dict_entry,6,IWDGEN,enable_iwdg
      00AB85 00 03                    1 	.word LINK 
                           0032E6     2 	LINK=.
      0032E6                          3 IWDGEN:
      00AB87 0D                       4 	.byte 6   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00AB88 01 27 07 98 59 49        5 	.ascii "IWDGEN"
      00AB8E 0A 01                    6 	.word enable_iwdg  
      0032EF                       4706 	_dict_entry,5,INPUT,input_var  
      00AB90 26 F9                    1 	.word LINK 
                           0032F1     2 	LINK=.
      0032F1                          3 INPUT:
      00AB92 5B                       4 	.byte 5   	
      00AB93 01 81 50 55 54           5 	.ascii "INPUT"
      00AB95 20 CF                    6 	.word input_var  
      0032F9                       4707 	_dict_entry,2,IF,if 
      00AB95 CD 9A                    1 	.word LINK 
                           0032FB     2 	LINK=.
      0032FB                          3 IF:
      00AB97 0D                       4 	.byte 2   	
      00AB98 A1 02                    5 	.ascii "IF"
      00AB9A 27 03                    6 	.word if  
      003300                       4708 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AB9C CC 96                    1 	.word LINK 
                           003302     2 	LINK=.
      003302                          3 IDR:
      00AB9E E6                       4 	.byte 3+F_IFUNC   	
      00AB9F 90 F6 93                 5 	.ascii "IDR"
      00ABA2 EE 01                    6 	.word const_idr  
      003308                       4709 	_dict_entry,3,HEX,hex_base
      00ABA4 72 A9                    1 	.word LINK 
                           00330A     2 	LINK=.
      00330A                          3 HEX:
      00ABA6 00                       4 	.byte 3   	
      00ABA7 03 9F 88                 5 	.ascii "HEX"
      00ABAA 90 F6                    6 	.word hex_base  
      003310                       4710 	_dict_entry,4,GOTO,goto 
      00ABAC 93 EE                    1 	.word LINK 
                           003312     2 	LINK=.
      003312                          3 GOTO:
      00ABAE 01                       4 	.byte 4   	
      00ABAF 72 A9 00 03              5 	.ascii "GOTO"
      00ABB3 0D 01                    6 	.word goto  
      003319                       4711 	_dict_entry,5,GOSUB,gosub 
      00ABB5 27 07                    1 	.word LINK 
                           00331B     2 	LINK=.
      00331B                          3 GOSUB:
      00ABB7 98                       4 	.byte 5   	
      00ABB8 46 56 0A 01 26           5 	.ascii "GOSUB"
      00ABBD F9 5B                    6 	.word gosub  
      003323                       4712 	_dict_entry,3,GET,cmd_get 
      00ABBF 01 81                    1 	.word LINK 
                           003325     2 	LINK=.
      00ABC1                          3 GET:
      00ABC1 A6                       4 	.byte 3   	
      00ABC2 84 CD 9A                 5 	.ascii "GET"
      00ABC5 00 CD                    6 	.word cmd_get  
      00332B                       4713 	_dict_entry,4+F_IFUNC,FREE,free
      00ABC7 98 7C                    1 	.word LINK 
                           00332D     2 	LINK=.
      00332D                          3 FREE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00ABC9 9F                       4 	.byte 4+F_IFUNC   	
      00ABCA A4 07 C7 50              5 	.ascii "FREE"
      00ABCE C6 81                    6 	.word free  
      00ABD0                       4714 	_dict_entry,3,FOR,for 
      00ABD0 52 01                    1 	.word LINK 
                           003336     2 	LINK=.
      003336                          3 FOR:
      00ABD2 CD                       4 	.byte 3   	
      00ABD3 9A 12 A1                 5 	.ascii "FOR"
      00ABD6 02 27                    6 	.word for  
      00333C                       4715 	_dict_entry,4,FCPU,fcpu 
      00ABD8 03 CC                    1 	.word LINK 
                           00333E     2 	LINK=.
      00333E                          3 FCPU:
      00ABDA 96                       4 	.byte 4   	
      00ABDB E6 90 F6 93              5 	.ascii "FCPU"
      00ABDF EE 01                    6 	.word fcpu  
      003345                       4716 	_dict_entry,5,ERASE,erase 
      00ABE1 72 A9                    1 	.word LINK 
                           003347     2 	LINK=.
      003347                          3 ERASE:
      00ABE3 00                       4 	.byte 5   	
      00ABE4 03 CF 00 1A 90           5 	.ascii "ERASE"
      00ABE9 F6 93                    6 	.word erase  
      00334F                       4717 	_dict_entry,3,END,cmd_end  
      00ABEB EE 01                    1 	.word LINK 
                           003351     2 	LINK=.
      003351                          3 END:
      00ABED 72                       4 	.byte 3   	
      00ABEE A9 00 03                 5 	.ascii "END"
      00ABF1 CD AC                    6 	.word cmd_end  
      003357                       4718 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00ABF3 2F 6B                    1 	.word LINK 
                           003359     2 	LINK=.
      003359                          3 EEPROM:
      00ABF5 01                       4 	.byte 6+F_IFUNC   	
      00ABF6 A6 01 0D 01 27 0D        5 	.ascii "EEPROM"
      00ABFC 48 0A                    6 	.word const_eeprom_base  
      003362                       4719 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00ABFE 01 26                    1 	.word LINK 
                           003364     2 	LINK=.
      003364                          3 EEFREE:
      00AC00 FB                       4 	.byte 6+F_IFUNC   	
      00AC01 6B 01 7B 01 EA 03        5 	.ascii "EEFREE"
      00AC07 E7 03                    6 	.word func_eefree  
      00336D                       4720 	_dict_entry,4,EDIT,edit 
      00AC09 A6 01                    1 	.word LINK 
                           00336F     2 	LINK=.
      00336F                          3 EDIT:
      00AC0B C1                       4 	.byte 4   	
      00AC0C 00 0F 27 10              5 	.ascii "EDIT"
      00AC10 7B 01                    6 	.word edit  
      003376                       4721 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AC12 43 E4                    1 	.word LINK 
                           003378     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      003378                          3 DWRITE:
      00AC14 04                       4 	.byte 6+F_CMD   	
      00AC15 E7 04 7B 01 43 E4        5 	.ascii "DWRITE"
      00AC1B 02 E7                    6 	.word digital_write  
      003381                       4722 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AC1D 02 20                    1 	.word LINK 
                           003383     2 	LINK=.
      003383                          3 DROP:
      00AC1F 0C                       4 	.byte 4   	
      00AC20 44 52 4F 50              5 	.ascii "DROP"
      00AC20 7B 01                    6 	.word xdrop  
      00338A                       4723 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AC22 EA 02                    1 	.word LINK 
                           00338C     2 	LINK=.
      00338C                          3 DREAD:
      00AC24 E7                       4 	.byte 5+F_IFUNC   	
      00AC25 02 7B 01 EA 04           5 	.ascii "DREAD"
      00AC2A E7 04                    6 	.word digital_read  
      00AC2C                       4724 	_dict_entry,2,DO,do_loop
      00AC2C 5B 01                    1 	.word LINK 
                           003396     2 	LINK=.
      003396                          3 DO:
      00AC2E 81                       4 	.byte 2   	
      00AC2F 44 4F                    5 	.ascii "DO"
      00AC2F 58 1C                    6 	.word do_loop  
      00339B                       4725 	_dict_entry,3,DIM,cmd_dim 
      00AC31 AC 3F                    1 	.word LINK 
                           00339D     2 	LINK=.
      00339D                          3 DIM:
      00AC33 FE                       4 	.byte 3   	
      00AC34 9F 88 5E                 5 	.ascii "DIM"
      00AC37 A6 05                    6 	.word cmd_dim  
      0033A3                       4726 	_dict_entry,3,DEC,dec_base
      00AC39 42 1C                    1 	.word LINK 
                           0033A5     2 	LINK=.
      0033A5                          3 DEC:
      00AC3B 50                       4 	.byte 3   	
      00AC3C 00 84 81                 5 	.ascii "DEC"
      00AC3F 1C 68                    6 	.word dec_base  
      0033AB                       4727 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AC3F 03 06                    1 	.word LINK 
                           0033AD     2 	LINK=.
      0033AD                          3 DDR:
      00AC41 03                       4 	.byte 3+F_IFUNC   	
      00AC42 05 04 00                 5 	.ascii "DDR"
      00AC45 02 01                    6 	.word const_ddr  
      0033B3                       4728 	_dict_entry,4,DATA,data  
      00AC47 06 00                    1 	.word LINK 
                           0033B5     2 	LINK=.
      0033B5                          3 DATA:
      00AC49 02                       4 	.byte 4   	
      00AC4A 02 02 03 03              5 	.ascii "DATA"
      00AC4E 01 03                    6 	.word data  
      0033BC                       4729 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AC50 03 02                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



                           0033BE     2 	LINK=.
      0033BE                          3 CR2:
      00AC52 04                       4 	.byte 3+F_IFUNC   	
      00AC53 04 05 02                 5 	.ascii "CR2"
      00AC56 06 02                    6 	.word const_cr2  
      0033C4                       4730 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AC58 07 02                    1 	.word LINK 
                           0033C6     2 	LINK=.
      0033C6                          3 CR1:
      00AC5A 05                       4 	.byte 3+F_IFUNC   	
      00AC5B 04 02 04                 5 	.ascii "CR1"
      00AC5E 01 19                    6 	.word const_cr1  
      00AC5F                       4731 	_dict_entry,5,CONST,cmd_const 
      00AC5F CD 9A                    1 	.word LINK 
                           0033CE     2 	LINK=.
      0033CE                          3 CONST:
      00AC61 0D                       4 	.byte 5   	
      00AC62 A1 01 27 03 CC           5 	.ascii "CONST"
      00AC67 96 E6                    6 	.word cmd_const  
      00AC69                       4732 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AC69 90 F6                    1 	.word LINK 
                           0033D8     2 	LINK=.
      0033D8                          3 CHAR:
      00AC6B 93                       4 	.byte 4+F_CFUNC   	
      00AC6C EE 01 72 A9              5 	.ascii "CHAR"
      00AC70 00 03                    6 	.word func_char  
      0033DF                       4733 	_dict_entry,3,BYE,bye 
      00AC72 89 88                    1 	.word LINK 
                           0033E1     2 	LINK=.
      0033E1                          3 BYE:
      00AC74 A6                       4 	.byte 3   	
      00AC75 80 15 01                 5 	.ascii "BYE"
      00AC78 27 05                    6 	.word bye  
      0033E7                       4734 	_dict_entry,5,BTOGL,bit_toggle
      00AC7A A6 0A                    1 	.word LINK 
                           0033E9     2 	LINK=.
      0033E9                          3 BTOGL:
      00AC7C CC                       4 	.byte 5   	
      00AC7D 96 E8 4F 47 4C           5 	.ascii "BTOGL"
      00AC7F 21 F6                    6 	.word bit_toggle  
      0033F1                       4735 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AC7F CE 00                    1 	.word LINK 
                           0033F3     2 	LINK=.
      0033F3                          3 BTEST:
      00AC81 15                       4 	.byte 5+F_IFUNC   	
      00AC82 58 58 58 58 58           5 	.ascii "BTEST"
      00AC87 9E C8                    6 	.word bit_test  
      0033FB                       4736 	_dict_entry,4,BSET,bit_set 
      00AC89 00 15                    1 	.word LINK 
                           0033FD     2 	LINK=.
      0033FD                          3 BSET:
      00AC8B C7                       4 	.byte 4   	
      00AC8C 00 0E 9F C8              5 	.ascii "BSET"
      00AC90 00 16                    6 	.word bit_set  
      003404                       4737 	_dict_entry,4,BRES,bit_reset
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AC92 C7 00                    1 	.word LINK 
                           003406     2 	LINK=.
      003406                          3 BRES:
      00AC94 0F                       4 	.byte 4   	
      00AC95 CE 00 17 CF              5 	.ascii "BRES"
      00AC99 00 15                    6 	.word bit_reset  
      00340D                       4738 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AC9B CE 00                    1 	.word LINK 
                           00340F     2 	LINK=.
      00340F                          3 BIT:
      00AC9D 17                       4 	.byte 3+F_IFUNC   	
      00AC9E 54 9E C8                 5 	.ascii "BIT"
      00ACA1 00 17                    6 	.word bitmask  
      003415                       4739 	_dict_entry,3,AWU,awu 
      00ACA3 C7 00                    1 	.word LINK 
                           003417     2 	LINK=.
      003417                          3 AWU:
      00ACA5 17                       4 	.byte 3   	
      00ACA6 9F C8 00                 5 	.ascii "AWU"
      00ACA9 18 C7                    6 	.word awu  
      00341D                       4740 	_dict_entry,3+F_IFUNC,ASC,ascii
      00ACAB 00 18                    1 	.word LINK 
                           00341F     2 	LINK=.
      00341F                          3 ASC:
      00ACAD CE                       4 	.byte 3+F_IFUNC   	
      00ACAE 00 0E 54                 5 	.ascii "ASC"
      00ACB1 54 54                    6 	.word ascii  
      003425                       4741 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00ACB3 9E C8                    1 	.word LINK 
                           003427     2 	LINK=.
      003427                          3 AND:
      00ACB5 00                       4 	.byte 3+F_AND   	
      00ACB6 0E C7 00                 5 	.ascii "AND"
      00ACB9 0E 9F                    6 	.word TK_AND  
      00342D                       4742 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00ACBB C8 00                    1 	.word LINK 
                           00342F     2 	LINK=.
      00342F                          3 ALLOC:
      00ACBD 0F                       4 	.byte 5   	
      00ACBE C7 00 0F C8 00           5 	.ascii "ALLOC"
      00ACC3 18 97                    6 	.word xalloc  
      003437                       4743 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00ACC5 C6 00                    1 	.word LINK 
                           003439     2 	LINK=.
      003439                          3 ADCREAD:
      00ACC7 0E                       4 	.byte 7+F_IFUNC   	
      00ACC8 C8 00 17 95 CF 00 17     5 	.ascii "ADCREAD"
      00ACCF C6 00                    6 	.word analog_read  
      003443                       4744 	_dict_entry,5,ADCON,power_adc 
      00ACD1 16 A4                    1 	.word LINK 
                           003445     2 	LINK=.
      003445                          3 ADCON:
      00ACD3 7F                       4 	.byte 5   	
      00ACD4 72 A2 00 03 90           5 	.ascii "ADCON"
      00ACD9 F7 90                    6 	.word power_adc  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00344D                       4745 kword_dict::
      00344D                       4746 	_dict_entry,3+F_IFUNC,ABS,abs
      00ACDB EF 01                    1 	.word LINK 
                           00344F     2 	LINK=.
      00344F                          3 ABS:
      00ACDD 84                       4 	.byte 3+F_IFUNC   	
      00ACDE 85 72 A2                 5 	.ascii "ABS"
      00ACE1 00 03                    6 	.word abs  
                                   4747 
                           000000  4748 INDIRECT=0 
                           000000  4749 .if INDIRECT 
                                   4750 ;comands and fonctions address table 	
                                   4751 code_addr::
                                   4752 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4753 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4754 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4755 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4756 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4757 	.word let,list,log2,lshift,next,new ; 40..47
                                   4758 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4759 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4760 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4761 	.word restore,return, random,rshift,run,free ; 72..79
                                   4762 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4763 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4764 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4765 	.word func_eefree,0 
                                   4766 .endif 
                                   4767 
                                   4768 
                                   4769 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
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
      003455                         30 test:
      003455                         31     _vars VSIZE 
      00ACE3 90 F7            [ 2]    1     sub sp,#VSIZE 
      00ACE5 90 EF 01         [ 2]   32     ldw x,#LOOP_CNT
      00ACE8 CD 84            [ 2]   33     ldw (CNTR,sp),x  
      00ACEA 1C 90 F6         [ 2]   34     ldw x,ticks 
      00ACED 93 EE            [ 2]   35     ldw (T,sp),x
      003461                         36 1$: ; test add24 
      00ACEF 01 72            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00ACF1 A9 00 03         [ 2]   38     ldw x,#VAL1&0XFFFF
      00ACF4 1C 00 01         [ 1]   39     ld acc24,a 
      00ACF7 A9 00 81         [ 2]   40     ldw acc24+1,x  
      00ACFA A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00ACFA 90 89 52         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00ACFD 03 0F 02         [ 4]   43     call add24 
      00AD00 0F 03            [ 2]   44     ldw x,(CNTR,sp)
      00AD02 90 AE B4         [ 2]   45     subw x,#1
      00AD05 CF 93            [ 2]   46     ldw (CNTR,sp),x 
      00AD07 F6 A4            [ 1]   47     jrne 1$
      00AD09 0F 6B 01         [ 4]   48     call prt_acc24
      00AD0C 0C 03            [ 1]   49     ld a,#SPACE 
      00AD0E 5C F6 CD         [ 4]   50     call putc 
      00AD11 89 8B 0C         [ 2]   51     ldw x,ticks 
      00AD14 02 0A 01         [ 2]   52     subw x,(T,sp)
      00AD17 26 F5 A6         [ 4]   53     call prt_i16  
      00AD1A 46 11            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00AD1C 02 2B 09         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AD1F A6 20 CD         [ 2]   58     ldw x,LOOP_CNT
      00AD22 89 8B            [ 2]   59     ldw (CNTR,sp),x 
      00AD24 0C 02 20         [ 2]   60     ldw x,ticks 
      00AD27 07 A6            [ 2]   61     ldw (T,sp),x 
      00349D                         62 2$: 
      00AD29 0D CD            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AD2B 89 8B 0F         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AD2E 02 72 A2         [ 1]   65     ld acc24,a 
      00AD31 00 02 90         [ 2]   66     ldw acc24+1,x  
      00AD34 FE 26            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AD36 CF A6 0D         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AD39 CD 89 8B         [ 4]   69     call mul24 
      00AD3C 5F 7B            [ 2]   70     ldw x,(CNTR,sp)
      00AD3E 03 97 CD         [ 2]   71     subw x,#1
      00AD41 98 92            [ 2]   72     ldw (CNTR,sp),x 
      00AD43 AE AD            [ 1]   73     jrne 2$ 
      00AD45 4E CD 89         [ 4]   74    call prt_acc24 
      00AD48 E8 5B            [ 1]   75    ld a,#SPACE 
      00AD4A 03 90 85         [ 4]   76    call putc 
      00AD4D 81 20 77         [ 2]   77     ldw x,ticks 
      00AD50 6F 72 64         [ 2]   78     subw x,(T,sp)
      00AD53 73 20 69         [ 4]   79     call prt_i16 
      00AD56 6E 20            [ 1]   80     ld a,#CR 
      00AD58 64 69 63         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AD5B 74 69 6F         [ 2]   83     ldw x,LOOP_CNT
      00AD5E 6E 61            [ 2]   84     ldw (CNTR,sp),x 
      00AD60 72 79 0A         [ 2]   85     ldw x,ticks 
      00AD63 00 01            [ 2]   86     ldw (T,sp),x 
      00AD64                         87 3$: 
      00AD64 CD 9A            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AD66 12 A1 01         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AD69 27 03 CC         [ 1]   90     ld acc24,a 
      00AD6C 96 E6 0D         [ 2]   91     ldw acc24+1,x  
      00AD6E A6 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AD6E 90 F6 93         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AD71 EE 01 72         [ 4]   94     call mul24 
      00AD74 A9 00            [ 2]   95     ldw x,(CNTR,sp)
      00AD76 03 CF 00         [ 2]   96     subw x,#1
      00AD79 13 81            [ 2]   97     ldw (CNTR,sp),x 
      00AD7B 26 E4            [ 1]   98     jrne 3$ 
      00AD7B 4F CE 00         [ 4]   99     call prt_acc24    
      00AD7E 13 27            [ 1]  100     ld a,#SPACE 
      00AD80 02 5F 81         [ 4]  101     call putc 
      00AD83 43 53 81         [ 2]  102     ldw x,ticks 
      00AD86 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AD86 CD 9A 12         [ 4]  104     call prt_i16 
      00AD89 A1 01            [ 1]  105     ld a,#CR 
      00AD8B 27 03 CC         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AD8E 96 E6 90         [ 2]  108     ldw x,LOOP_CNT
      00AD91 F6 93            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



      00AD93 EE 01 72         [ 2]  110     ldw x,ticks 
      00AD96 A9 00            [ 2]  111     ldw (T,sp),x 
      003515                        112 4$:
      00AD98 03 4B            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AD9A 00 35 CC         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AD9D 50 E0 9E         [ 1]  115     ld acc24,a 
      00ADA0 A4 3F 95         [ 2]  116     ldw acc24+1,x  
      00ADA3 A3 00            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ADA5 FF 23 06         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ADA8 0C 01 98         [ 4]  119     call mul24 
      00ADAB 56 20            [ 2]  120     ldw x,(CNTR,sp)
      00ADAD F5 35 55         [ 2]  121     subw x,#1
      00ADB0 50 E0            [ 2]  122     ldw (CNTR,sp),x 
      00ADB2 84 C7            [ 1]  123     jrne 4$ 
      00ADB4 50 E1 9F         [ 4]  124     call prt_acc24 
      00ADB7 4A 35            [ 1]  125     ld a,#SPACE 
      00ADB9 55 50 E0         [ 4]  126     call putc 
      00ADBC C7 50 E2         [ 2]  127     ldw x,ticks 
      00ADBF 35 AA 50         [ 2]  128     subw x,(T,sp)
      00ADC2 E0 81 12         [ 4]  129     call prt_i16 
      00ADC4 A6 0D            [ 1]  130     ld a,#CR 
      00ADC4 35 AA 50         [ 4]  131     call putc 
                                    132 ; test abs24 
      00ADC7 E0 81 10         [ 2]  133     ldw x,LOOP_CNT
      00ADC9 1F 03            [ 2]  134     ldw (CNTR,sp),x 
      00ADC9 CD 9A 0D         [ 2]  135     ldw x,ticks 
      00ADCC A1 01            [ 2]  136     ldw (T,sp),x 
      003551                        137 5$: 
      00ADCE 27 03            [ 1]  138     ld a,#0xff
      00ADD0 CC 96 E6         [ 2]  139     ldw x,#0xffff
      00ADD3 CD 01 EE         [ 4]  140     call abs24 
      00ADD3 90 F6 93         [ 1]  141     ld acc24,a 
      00ADD6 EE 01 72         [ 2]  142     ldw acc24+1,x
      00ADD9 A9 00            [ 2]  143     ldw x,(CNTR,sp)
      00ADDB 03 4D 26         [ 2]  144     subw x,#1
      00ADDE 08 5D            [ 2]  145     ldw (CNTR,sp),x 
      00ADE0 26 05            [ 1]  146     jrne 5$ 
      00ADE2 A6 0A CC         [ 4]  147     call prt_acc24 
      00ADE5 96 E8            [ 1]  148     ld a,#SPACE 
      00ADE7 4B 18 59         [ 4]  149     call putc 
      00ADEA 49 25 04         [ 2]  150     ldw x,ticks 
      00ADED 0A 01 26         [ 2]  151     subw x,(T,sp)
      00ADF0 F8 5F 84         [ 4]  152     call prt_i16 
      003579                        153 6$:
      00ADF3 4A 02            [ 1]  154     ld a,#CR 
      00ADF5 CD 09 0B         [ 4]  155     call putc 
      00ADF5 81 35 C4         [ 4]  156     call read_integer 
      00ADF6 55 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00ADF6 CD 9A 0D A1 01   [ 1]  158     mov farptr+1,acc16 
      00ADFB 27 03 CC 96 E6   [ 1]  159     mov farptr+2,acc8 
      00AE00 90 F6 93         [ 4]  160     call read_integer 
      00AE03 EE 01 72         [ 1]  161     ld a,acc24 
      00AE06 A9 00 03         [ 2]  162     ldw x,acc16 
      00AE09 9F AE 00 01 A4   [ 1]  163     mov acc24,farptr 
      00AE0E 17 27 0A 88 4F   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00AE13 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00AE13 58 49 0A         [ 4]  166     call div24 
      00AE16 01               [ 1]  167     push a 
      00AE17 26               [ 2]  168     pushw x 
      00AE18 FA 18 29         [ 4]  169     call prt_acc24 
      00AE19 A6 20            [ 1]  170     ld a,#SPACE 
      00AE19 5B 01 81         [ 4]  171     call putc 
      00AE1C 85               [ 2]  172     popw x
      00AE1C 85 52 04         [ 2]  173     ldw acc16,x  
      00AE1F 89 CE 00         [ 1]  174     pop acc24 
      00AE22 05 1F 03         [ 4]  175     call prt_acc24
      00AE25 CE 00            [ 2]  176     jra 6$
      0035C1                        177     _drop VSIZE 
      00AE27 01 1F            [ 2]    1     addw sp,#VSIZE 
      00AE29 05               [ 4]  178     ret 
                                    179 
                                    180 
      0035C4                        181 read_integer:
      00AE2A 72 5C            [ 1]  182     ld a,#'? 
      00AE2C 00 20 81         [ 4]  183     call putc  
      00AE2F 72 5F 00 03      [ 1]  184 	clr count  
      00AE2F 72 5D 00         [ 4]  185 	call readln 
      00AE32 20 26 03         [ 2]  186 	ldw x,#tib 
      00AE35 CC 96 E6         [ 1]  187 	push count
      00AE38 4B 00            [ 1]  188 	push #0 
      00AE38 CD 9C 6F         [ 2]  189 	addw x,(1,sp)
      00AE3B 90               [ 1]  190 	incw x 
      0035DC                        191 	_drop 2 
      00AE3C F6 93            [ 2]    1     addw sp,#2 
      00AE3E EE 01 72 A9      [ 1]  192 	clr in 
      00AE42 00 03 4D         [ 4]  193 	call get_token
      00AE45 26 13            [ 1]  194 	cp a,#TK_INTGR
      00AE47 5D 26            [ 1]  195 	jreq 3$ 
      00AE49 10 1E            [ 1]  196 	cp a,#TK_MINUS
      00AE4B 03 CF 00         [ 4]  197 	call get_token 
      00AE4E 05 E6            [ 1]  198 	cp a,#TK_INTGR 
      00AE50 02 C7            [ 1]  199 	jreq 2$
      00AE52 00 04 1E         [ 2]  200 	jp syntax_error
      0035F5                        201 2$:
      00AE55 05 CF 00         [ 4]  202 	call neg_acc24  	
      0035F8                        203 3$: 
      00AE58 01               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
      00AE59 81 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AE5A 00 00                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00344F R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003445 R
    ADCON_ID=  000002     |   4 ADCREAD    003439 R   |     ADCREAD_=  000004 
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
  4 ALLOC      00342F R   |   4 AND        003427 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        00341F R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   000157 R   |   4 AWU        003417 R
  4 AWUHandl   000004 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_CSR_=  000004     |     AWU_IDX =  000008     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BCNT    =  000001 
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
  4 BIT        00340F R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003406 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       0033FD R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      0033F3 R
    BTEST_ID=  000010     |   4 BTOGL      0033E9 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        0033E1 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    0028D0 R
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
  4 CHAR       0033D8 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000006     |     CNTR    =  000003     |     CNT_LO  =  000004 
    CODE_ADD=  000001     |     COMMA   =  00002C     |   4 CONST      0033CE R
  4 CONST_CO   001D58 R   |     CONST_ID=  0000B6     |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        0033C6 R   |     CR1_IDX =  00001A 
  4 CR2        0033BE R   |     CR2_IDX =  000018     |     CTRL_A  =  000001 
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
    CVAR    =  000009     |     CX_BPTR =  000001     |     CX_CNT  =  000004 
    CX_IN   =  000003     |   4 DATA       0033B5 R   |     DATA_IDX=  00001C 
    DBG_A   =  000008     |     DBG_CC  =  000009     |     DBG_X   =  000006 
    DBG_Y   =  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        0033AD R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        0033A5 R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        00339D R   |     DIVISOR =  000001     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  4 DO         003396 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
    DO_IDX  =  000022     |   4 DREAD      00338C R   |     DREAD_ID=  000024 
  4 DROP       003383 R   |   4 DWRITE     003378 R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       00336F R   |     EDIT_IDX=  000028     |   4 EEFREE     003364 R
    EEFREE_I=  0000B8     |   4 EEPROM     003359 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EM      =  000019     |   4 END        003351 R   |     END_IDX =  00002C 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      003347 R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_OVER=  000010     |     ERR_RD_O=  000011 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       00333E R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001EF9 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        003336 R   |     FOR_IDX =  000034 
  4 FREE       00332D R   |     FREE_IDX=  000088     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        003325 R   |     GET_IDX =  0000B4     |   4 GOSUB      00331B R
    GOSUB_ID=  000036     |   4 GOTO       003312 R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        00330A R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
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
  4 IDR        003302 R   |     IDR_IDX =  00003C     |   4 IF         0032FB R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INDIRECT=  000000     |     INP     =  000000     |   4 INPUT      0032F1 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000040     |     INPUT_PU=  000001     |     INT24   =  000005 
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
    INT_VECT=  008058     |     INW     =  00000B     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     0032E6 R
    IWDGEN_I=  000042     |   4 IWDGREF    0032DA R   |     IWDGREF_=  000044 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        0032D2 R   |     KEY_END =  000083 
    KEY_IDX =  000046     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        0032CA R
    LET_IDX =  000048     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  00344F R   |   4 LIST       0032C1 R
    LIST_IDX=  00004A     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       0032B8 R
    LOG_IDX =  00004C     |     LOOP_CNT=  002710     |   4 LSHIFT     0032AD R
    LSHIFT_I=  00004E     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000005     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NAME_MAX=  00000F     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        0032A5 R   |     NEW_IDX =  000052 
  4 NEXT       00329C R   |     NEXT_IDX=  000050     |     NFLASH_W=  00480E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    NHSECNT =  00480A     |     NLEN    =  000001     |     NLEN_MAS=  00000F 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        003294 R
    NOT_IDX =  0000F8     |     NOT_OP  =  000001     |   4 NOT_SAVE   001FEB R
  4 NO_APP     002912 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        00328C R
    ODR_IDX =  000054     |   4 ON         003285 R   |     ONOFF   =  000003 
    ON_IDX  =  0000B2     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         00327E R   |     OR_IDX  =  0000FC     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        003276 R   |     PAD_IDX =  000056     |     PAD_SIZE=  000080 
  4 PAUSE      00326C R   |     PAUSE_ID=  000058     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       003263 R   |     PEEK_IDX=  00005C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
  4 PICK       00325A R   |     PINNO   =  000001     |   4 PINP       003251 R
    PINP_IDX=  00005E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      003247 R
    PMODE_ID=  00005A     |   4 POKE       00323E R   |     POKE_IDX=  000060 
  4 POP        003236 R   |   4 PORTA      003219 R   |   4 PORTB      00320F R
  4 PORTC      003205 R   |   4 PORTD      0031FB R   |   4 PORTE      0031F1 R
  4 PORTF      0031E7 R   |   4 PORTG      0031DD R   |   4 PORTI      0031D3 R
  4 POUT       00322D R   |     POUT_IDX=  000062     |     PREV    =  000001 
  4 PRINT      003223 R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001ECF R   |   4 PROG_SIZ   001EE1 R   |     PRTA_IDX=  000066 
    PRTB_IDX=  000068     |     PRTC_IDX=  00006A     |     PRTD_IDX=  00006C 
    PRTE_IDX=  00006E     |     PRTF_IDX=  000070     |     PRTG_IDX=  000072 
    PRTI_IDX=  000074     |     PRT_IDX =  000064     |     PSIZE   =  000001 
    PSTR    =  000003     |   4 PUSH       0031CA R   |   4 PUT        0031C2 R
  4 QKEY       0031B9 R   |     QKEY_IDX=  000076     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001F0A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    RAM_SIZE=  001800     |     RBT_IDX =  00007A     |   4 READ       0031B0 R
    READ_IDX=  000078     |   4 REBOOT     0031A5 R   |     RECLEN  =  000005 
    REC_LEN =  000003     |     REC_XTRA=  000005     |   4 REG_A      000529 R
  4 REG_CC     00052D R   |   4 REG_EPC    00051C R   |   4 REG_SP     000532 R
  4 REG_X      000525 R   |   4 REG_Y      000521 R   |     RELOP   =  000001 
  4 REM        00319D R   |     REM_IDX =  00007C     |   4 RESTORE    003191 R
    REST_IDX=  00007E     |     RETL1   =  000001     |   4 RETURN     003186 R
    RET_ADDR=  000001     |     RET_BPTR=  000003     |     RET_IDX =  000080 
    RET_INW =  000005     |   4 RND        00317E R   |     RND_IDX =  000082 
    RONLY   =  000005     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003173 R   |     RSHIFT_I=  000084     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00316B R   |     RUN_IDX =  000086 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       003162 R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   0028CE R
  4 SIZE       003159 R   |     SIZE_IDX=  0000B0     |     SKIP    =  000005 
  4 SLEEP      00314F R   |     SLEEP_ID=  00008A     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003145 R
    SPIEN_ID=  00008E     |   4 SPIRD      00313B R   |     SPIRD_ID=  00008C 
  4 SPISEL     003130 R   |     SPISEL_I=  000090     |   4 SPIWR      003126 R
    SPIWR_ID=  000092     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
  4 STATES     0004DF R   |   4 STEP       00311D R   |     STEP_IDX=  000094 
  4 STOP       003114 R   |     STOP_IDX=  000096     |     STR     =  000003 
  4 STR_BYTE   001EF2 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      00310A R
    TICKS_ID=  000098     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM3_CCR=  00532F     |     TIM3_CCR=  005330     |     TIM3_CNT=  005328 
    TIM3_CNT=  005329     |     TIM3_CR1=  005320     |     TIM3_CR1=  000007 
    TIM3_CR1=  000000     |     TIM3_CR1=  000003     |     TIM3_CR1=  000001 
    TIM3_CR1=  000002     |     TIM3_EGR=  005324     |     TIM3_IER=  005321 
    TIM3_PSC=  00532A     |     TIM3_SR1=  005322     |     TIM3_SR2=  005323 
    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    0030FE R
  4 TIMER      0030F4 R   |     TIMER_ID=  00009A     |     TIM_CR1_=  000007 
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
  4 TO         0030ED R   |   4 TONE       0030E4 R   |     TONE_IDX=  0000A0 
    TOWRITE =  000005     |     TO_IDX  =  00009E     |   4 Timer4Up   000021 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     0030D9 R
    UBOUND_I=  0000A2     |   4 UBTN_Han   000068 R   |   4 UFLASH     0030CE R
    UFLASH_I=  0000A4     |   4 UNTIL      0030C4 R   |     UNTIL_ID=  0000A6 
    US      =  00001F     |   4 USER_ABO   000070 R   |   4 USR        0030BC R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000A8     |   4 Uart1RxH   000899 R   |   4 UserButt   000044 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VAR_NAME=  000001 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       0030B3 R
    WAIT_IDX=  0000AA     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
    WLKPTR  =  000003     |   4 WORDS      0030A9 R   |     WORDS_ID=  0000AC 
  4 WRITE      00309F R   |     WRITE_ID=  0000AE     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        003097 R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  000014     |     XTEMP   =  000001     |     YSAVE   =  000004 
    YTEMP   =  000003     |   4 abs        002AD2 R   |   4 abs24      0001EE R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BC7 R   |   4 add24      000179 R
  4 add_char   001332 R   |   4 add_spac   00112A R   |   4 analog_r   002689 R
  4 and_cond   001B9D R   |   4 and_fact   001B6D R   |   4 app        003604 R
  4 app_sign   003600 R   |   4 app_size   003602 R   |   4 app_spac   003600 GR
  4 arduino_   002BBF R   |   4 arg_list   001992 R   |   5 array_si   000020 R
  4 ascii      002982 R   |   4 at_tst     000F9C R   |   4 atoi24     0018B4 GR
  4 atoi_exi   001923 R   |   4 awu        002A79 R   |   4 awu02      002A8C R
  4 bad_port   0029FD R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       002600 R   |   4 beep_1kh   0025D3 GR  |   4 bin_exit   000E03 R
  4 bit_rese   0021D3 R   |   4 bit_set    0021B1 R   |   4 bit_test   002218 R
  4 bit_togg   0021F6 R   |   4 bitmask    002D76 R   |   4 bkslsh_t   000F49 R
  4 bksp       000972 R   |   2 block_bu   0016E0 GR  |   4 block_er   000787 R
  4 break_po   002775 R   |   4 bye        002A45 R   |   4 clear_ba   00149E R
  4 clear_bl   002825 R   |   4 clear_va   0013F6 R   |   4 clock_in   00008B R
  4 cmd_cons   001DDE R   |   4 cmd_dim    001DF2 R   |   4 cmd_dim1   001DFC R
  4 cmd_dim2   001E02 R   |   4 cmd_end    00259F R   |   4 cmd_get    0025A6 R
  4 cmd_itf    000537 R   |   4 cmd_line   0016F5 R   |   4 cmd_name   001352 R
  4 cmd_on     00244D R   |   4 cmd_size   001C76 R   |   4 cold_sta   0000C3 R
  4 colon_ts   000F70 R   |   4 comma_ts   000F7B R   |   4 comp_msg   001645 R
  4 compile    001096 GR  |   4 conditio   001BEF R   |   4 const_cr   002E19 R
  4 const_cr   002E1E R   |   4 const_dd   002E14 R   |   4 const_ee   002E2D R
  4 const_id   002E0F R   |   4 const_in   002E28 R   |   4 const_od   002E0A R
  4 const_ou   002E23 R   |   4 const_po   002DE2 R   |   4 const_po   002DE7 R
  4 const_po   002DEC R   |   4 const_po   002DF1 R   |   4 const_po   002DF6 R
  4 const_po   002DFB R   |   4 const_po   002E00 R   |   4 const_po   002E05 R
  4 convert_   000D73 R   |   4 convert_   000936 R   |   4 copy_com   000FD1 R
  5 count      000003 GR  |   4 cp24       0001B3 R   |   4 cp24_ax    0001E5 R
  4 cp_loop    001943 R   |   4 cpl24      0001F5 R   |   4 cpy_cmd_   001112 R
  4 cpy_quot   001152 R   |   4 create_g   000C9D R   |   4 cs_high    002FAF R
  4 dash_tst   000F91 R   |   4 data       002E32 R   |   4 data_err   002EAB R
  5 data_len   000009 R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 dec_base   001C68 R   |   4 decomp_l   0011EA R   |   4 decompil   0011A2 GR
  4 del_line   000C70 R   |   4 delete_l   000A5F R   |   4 delete_n   000982 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

  4 delete_u   000A24 R   |   4 digital_   0026C5 R   |   4 digital_   0026FC R
  4 div24      000302 R   |   4 divu24_8   0002E4 R   |   4 do_loop    002D9C R
  4 do_progr   00077A R   |   4 dup24      00016A R   |   5 dvar_bgn   000030 GR
  5 dvar_end   000032 GR  |   4 edit       001FBE R   |   4 enable_i   002D06 R
  4 eql_tst    00101C R   |   4 equal      001345 R   |   4 erase      00279D R
  4 erase_ex   0007AB R   |   4 erase_fl   0007A1 R   |   4 err_bad_   00158A R
  4 err_buf_   001600 R   |   4 err_cmd_   00154E R   |   4 err_div0   001513 R
  4 err_dupl   001568 R   |   4 err_math   0014FA R   |   4 err_mem_   0014DF R
  4 err_msg    0014BB R   |   4 err_no_a   001596 R   |   4 err_no_d   0015C9 R
  4 err_no_f   0015ED R   |   4 err_no_l   001522 R   |   4 err_no_p   0015D9 R
  4 err_not_   001579 R   |   4 err_over   00160D R   |   4 err_read   001617 R
  4 err_run_   001538 R   |   4 err_synt   0014EC R   |   4 escaped    000D88 GR
  4 expect     001980 R   |   4 expressi   001AD6 R   |   4 factor     0019DE R
  5 farptr     000018 R   |   4 fcpu       002B41 R   |   4 fetchc     000627 R
  4 fill_wri   002815 R   |   4 final_te   000BC0 R   |   4 first_li   001F68 R
  5 flags      000022 GR  |   4 for        0022AE R   |   4 free       001C6D R
  5 free_eep   000024 R   |   7 free_ram   000090 R   |   4 func_arg   00198D R
  4 func_cha   00296B R   |   4 func_eef   001D6E R   |   4 ge         001347 R
  4 get_addr   0017F2 R   |   4 get_arra   0019AE R   |   4 get_char   00180C R
  4 get_esca   000942 R   |   4 get_int2   0017FC R   |   4 get_targ   0023DB R
  4 get_targ   0023E9 R   |   4 get_tick   002ACB R   |   4 get_toke   000EE2 GR
  4 get_valu   001CF1 R   |   4 getc       00091B GR  |   4 gosub      0024F9 R
  4 gosub_1    002504 R   |   4 gosub_2    00250A R   |   4 goto       0024DF R
  4 goto_1     0024E9 R   |   4 gpio       0029D2 R   |   4 gt         001343 R
  4 gt_tst     001027 R   |   4 hex_base   001C63 R   |   4 hex_dump   000667 R
  4 if         002291 R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   00087D R   |   4 input_ex   002169 R
  4 input_lo   0020D3 R   |   4 input_va   0020CF R   |   4 insert_c   0009E1 R
  4 insert_l   000CC9 R   |   4 insert_l   000D38 R   |   4 interp_l   001736 R
  4 interpre   001711 R   |   4 invalid    00057C R   |   4 invalid_   0005FD R
  4 is_alnum   000E36 GR  |   4 is_alpha   000E1C GR  |   4 is_data_   002E38 R
  4 is_digit   000E2D GR  |   4 is_symbo   000E3F R   |   4 itoa       00184F GR
  4 itoa_loo   001871 R   |   4 jp_to_ta   0024EC R   |   4 key        0029C1 R
  4 kword_di   00344D GR  |   4 kword_en   003095 R   |   4 le         00134C R
  4 ledoff     000432 R   |   4 ledon      00042D R   |   4 ledtoggl   000437 R
  4 left_par   000440 R   |   4 let        001CAE GR  |   4 let_arra   001CBC R
  4 let_dvar   00176F R   |   4 let_eval   001CC4 R   |   4 let_var    001CC1 R
  4 lines_sk   001F6B R   |   4 list       001F19 R   |   4 list_con   001D02 R
  4 list_exi   001FAD R   |   4 list_loo   001F8B R   |   4 log2       002D49 R
  4 look_tar   00240C R   |   4 loop_bac   0023BE R   |   5 loop_dep   00001F R
  4 loop_don   0023D3 R   |   4 lshift     002AE9 R   |   4 lt         00134A R
  4 lt_tst     001050 R   |   4 mem_peek   000599 R   |   4 mod24      00039C R
  4 move       0013B2 GR  |   4 move_dow   0013D1 R   |   4 move_era   000709 R
  4 move_exi   0013F2 R   |   4 move_lef   0009B9 R   |   4 move_loo   0013D6 R
  4 move_prg   000749 R   |   4 move_rig   0009C7 R   |   4 move_up    0013C3 R
  4 mul24      000274 R   |   4 mul_char   001334 R   |   4 mulu24_8   000235 R
  4 nbr_tst    000F15 R   |   4 ne         00134F R   |   4 neg24      0001FE R
  4 neg_acc2   000218 R   |   4 neg_ax     000210 R   |   4 new        002793 R
  4 next       002366 R   |   4 next_lin   001719 R   |   4 next_tok   0017CA GR
  4 no_match   001955 R   |   4 number     00062D R   |   4 other      001079 R
  4 overwrit   000BEC R   |   2 pad        0016E0 GR  |   4 pad_ref    002FB4 R
  4 parse_bi   000DE1 R   |   4 parse_in   000D90 R   |   4 parse_ke   000E62 R
  4 parse_qu   000D3B R   |   4 parse_sy   000E4A R   |   4 pause      002A59 R
  4 pause02    002A6C R   |   4 peek       002270 R   |   4 peek_byt   0005C7 R
  4 pin_mode   002B50 R   |   4 plus_tst   000FF0 R   |   4 poke       00224F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

  4 power_ad   002639 R   |   4 prcnt_ts   001011 R   |   4 print      002026 R
  4 print_fa   00060C R   |   4 print_he   000C23 GR  |   4 print_re   00048C R
  4 print_st   00058C R   |   4 print_to   001837 R   |   4 prog_siz   001E88 R
  4 program_   001E90 R   |   4 program_   000723 R   |   4 program_   000749 R
  4 prt_acc2   001829 R   |   4 prt_basi   002002 R   |   4 prt_i16    001812 R
  4 prt_loop   00202A R   |   4 prt_peek   00040F GR  |   4 prt_reg1   00046D R
  4 prt_reg8   00044B R   |   4 prt_regs   0003A5 GR  |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       00090B GR  |   4 puts       000968 GR
  4 qgetc      000914 GR  |   4 qkey       0029C5 GR  |   4 qmark_ts   000FA7 R
  4 qsign      00280E R   |   4 random     002BDF R   |   4 read       002EB0 R
  4 read01     002EB5 R   |   4 read_int   0035C4 R   |   4 readln     000A6D GR
  4 readln_l   000A7C R   |   4 readln_q   000C09 R   |   4 refresh_   002D44 R
  4 regs_sta   0003E8 R   |   4 relation   001B0E R   |   4 relop_st   001337 R
  4 remark     00216E GR  |   4 repl       000545 R   |   4 repl_exi   00056D R
  4 reset_co   002028 R   |   4 rest_con   0020BF R   |   4 restore    002E46 R
  4 return     00251D R   |   4 right_al   001140 GR  |   4 row_alig   000862 R
  4 row_eras   0006DC R   |   4 row_eras   000709 R   |   4 row_loop   00064A R
  4 rparnt_t   000F65 R   |   4 rshift     002B15 R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     001633 R   |   4 run        00253A R
  4 run_app    000135 R   |   4 run_it     00256C R   |   4 run_it_0   00256E R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_app   002839 R   |   4 save_con   0020AF R   |   4 scan_blo   00088B R
  4 search_d   001935 GR  |   4 search_e   00197D R   |   4 search_l   000C45 GR
  4 search_l   000C54 R   |   4 search_n   001D97 R   |   4 search_n   001939 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002BAF R
  4 send_esc   000990 R   |   4 send_par   00099B R   |   4 set_data   002E7C R
  4 set_time   002CE4 R   |   4 sharp_ts   000F86 R   |   4 show_row   000638 R
  4 single_c   00132D R   |   4 skip       000ECF R   |   4 skip_str   0017E3 R
  4 slash_ts   001006 R   |   4 sleep      002A4E R   |   4 software   001405 R
  4 spaces     0009D5 GR  |   4 spi_clea   002F49 R   |   4 spi_disa   002F31 R
  4 spi_enab   002EFE R   |   4 spi_rcv_   002F6B R   |   4 spi_read   002F96 R
  4 spi_sele   002F9D R   |   4 spi_send   002F55 R   |   4 spi_writ   002F76 R
  2 stack_fu   00179C GR  |   2 stack_un   001828 R   |   4 star_tst   000FFB R
  4 step       002324 R   |   4 stop       002747 R   |   4 store_lo   002353 R
  4 str_matc   001962 R   |   4 str_tst    000F05 R   |   4 strcmp     001391 R
  4 strcpy     0013A2 GR  |   4 strlen     001386 GR  |   4 sub24      000196 R
  4 symb_loo   000E4B R   |   4 syntax_e   001666 GR  |   4 system_i   00144B R
  5 tab_widt   000023 GR  |   4 tb_error   001668 GR  |   4 term       001A93 R
  4 term01     001A9B R   |   4 term_exi   001AD3 R   |   4 test       003455 R
  4 test_p     000584 R   |   2 tib        001690 GR  |   4 tick_tst   000FBF R
  5 ticks      00000F R   |   4 timeout    002CFB R   |   5 timer      000012 GR
  4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R   |   4 tk_id      001656 R
  4 to         0022DE R   |   4 to_eepro   000772 R   |   4 to_flash   000777 R
  4 to_hex_c   000C3A GR  |   4 to_upper   0018A8 GR  |   4 token_ch   00108F R
  4 token_ex   001093 R   |   4 tone       0025DE R   |   4 try_next   002E89 R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   00091B GR
  4 uart1_in   0008C6 R   |   4 uart1_pu   00090B GR  |   4 uart1_qg   000914 GR
  4 uart1_se   0008D6 R   |   4 ubound     001CA3 R   |   4 uflash     002A02 R
  4 unlock_e   0006A6 R   |   4 unlock_f   0006C1 R   |   4 until      002DAF R
  4 user_int   000057 R   |   4 usr        002A1F R   |   4 var_name   001198 GR
  5 vars       000034 GR  |   4 wait       002174 R   |   4 warm_ini   00147C R
  4 warm_sta   0016F2 R   |   4 words      002C7A R   |   4 words_co   002CCE R
  4 write      002928 R   |   4 write_bl   000827 GR  |   4 write_bu   000763 R
  4 write_by   0007AD R   |   4 write_ee   0007E9 R   |   4 write_ex   000822 R
  4 write_fl   0007D3 R   |   4 write_nb   00084C R   |   4 xalloc     002FC7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

  4 xdrop      002FFD R   |   4 xpick      00307B R   |   4 xpop       002FBD R
  4 xpush      002FB9 R   |   4 xput       003048 R   |   4 xstack_b   00302A R
  2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3604   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

