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
                           000006    38 	FAUTORUN=6; auto start program running 
                           000007    39         FUPDATE=7 ; update constant flag 
                                     40 
                                     41 
                           000006    42         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     43 
                           007FFF    44 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     45 
                           000008    46 	RX_QUEUE_SIZE=8 
                                     47 
                           00F424    48         TIM2_CLK_FREQ=62500
                                     49 
                           000050    50 	TIB_SIZE=80
                           000080    51         PAD_SIZE=BLOCK_SIZE 
                                     52 
                                     53 ;--------------------------------------
                                     54 ;   constantes related to Arduino 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                     55 ;   API mapping 
                                     56 ;-------------------------------------
                           000000    57         INP=0
                           000001    58         OUTP=1 
                                     59 
                                     60 ;--------------------------------------
                                     61 ;       token attribute
                                     62 ;--------------------------------------
                                     63         ; bits 4:5 identify token group 
                                     64         ; 0x0n -> miscelinous 
                                     65         ; 0x1n -> +|- operators 
                                     66         ; 0x2n -> *|/|% operators
                                     67         ; 0x3n -> relational operators 
                           000080    68         TK_CMD=128      ; BASIC command   
                           000081    69         TK_IFUNC=129    ; BASIC integer function
                           000082    70         TK_CFUNC=130    ; BASIC character function
                           000083    71         TK_CONST=131    ; BASIC constant 
                           000084    72         TK_INTGR=132    ; 16 bits integer 
                           000085    73         TK_VAR=133
                           000086    74         TK_FLOAT=134    ; float32 
                           000000    75         TK_NONE=0       ; not a token 
                           000002    76         TK_QSTR=2       ; quoted string  
                           000003    77         TK_LABEL=3      ; used for defined, constants, variables
                           000004    78         TK_CHAR=4       ; ASCII character 
                           000005    79         TK_ARRAY=5     ; array variable '@' 
                           000006    80         TK_LPAREN=6     ; left parenthesis '('
                           000007    81         TK_RPAREN=7     ; right parenthesis ')'
                           000008    82         TK_COMMA=8     ; item separator ',' 
                           000009    83         TK_SHARP=9     ; print colon width '#' 
                           00000A    84         TK_COLON=0xa      ; command separator ':' 
                                     85         
                           000010    86         TK_PLUS=0x10    ; addition operator '+'
                           000011    87         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    88         TK_MULT=0x20    ; multiplication operator '*'
                           000021    89         TK_DIV=0x21     ; division operator '/'
                           000022    90         TK_MOD=0x22     ; modulo operator '%'
                                     91 
                                     92         ; don't change these token values 
                                     93         ; values chosen to be used as a mask.
                                     94         ; bit 7   1 for dictionary words else 0 
                                     95         ; bits 6  always 0 
                                     96         ; bits 5:4 identify group 
                                     97         ; bits 3:0 token identifier inside group  
                           000031    98         TK_GT=0x31      ; relation operator '>'
                           000032    99         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   100         TK_GE=0x33      ; relation operator '>='
                           000034   101         TK_LT=0x34      ; relation operator '<'
                           000036   102         TK_LE=0x36      ; relation operator '<='
                           000035   103         TK_NE=0x35      ; relation operator '<>' not equal 
                                    104         ; token groups 
                           000030   105         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   106         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   107         TK_GRP_ADD=0x10  ; additive operators
                           000020   108         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   109         TK_GRP_RELOP=0x30 ;relational operators. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000002   110         CMD_END=2 
                                    111 
                                    112 ;--------------------------------------
                                    113 ;   error codes 
                                    114 ;--------------------------------------
                           000000   115     ERR_NONE=0
                           000001   116     ERR_MEM_FULL=1 
                           000002   117     ERR_SYNTAX=2
                           000003   118     ERR_MATH_OVF=3
                           000004   119     ERR_DIV0=4 
                           000005   120     ERR_NO_LINE=5
                           000006   121     ERR_RUN_ONLY=6
                           000007   122     ERR_CMD_ONLY=7
                           000008   123     ERR_DUPLICATE=8
                           000009   124     ERR_NOT_FILE=9
                           00000A   125     ERR_BAD_VALUE=10
                           00000B   126     ERR_NO_ACCESS=11
                           00000C   127     ERR_NO_DATA=12 
                           00000D   128     ERR_NO_PROG=13
                           00000E   129     ERR_NO_FSPACE=14
                           00000F   130     ERR_BUF_FULL=15
                           000010   131     ERR_OVERFLOW=16 
                                    132 
                                    133 ;--------------------------------------
                                    134 ;   assembler flags 
                                    135 ;-------------------------------------
                                    136 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    137 
                                    138      .macro _usec_dly n 
                                    139     ldw x,#(16*n-2)/4
                                    140     decw x
                                    141     nop 
                                    142     jrne .-4
                                    143     .endm 
                                    144     
                                    145     ; load X register with 
                                    146     ; entry point of dictionary
                                    147     ; before calling 'search_dict'
                                    148     .macro _ldx_dict dict_name
                                    149     ldw x,#dict_name+2
                                    150     .endm 
                                    151 
                                    152     ; reset BASIC pointer
                                    153     ; to beginning of last token
                                    154     ; extracted except if it was end of line 
                                    155     .macro _unget_token 
                                    156      mov in,in.saved  
                                    157     .endm
                                    158 
                                    159 
                                    160 ;---------------------------------------
                                    161 ;    xtack manipulation macros 
                                    162 ;    Y is used as xstack pointer  
                                    163 ;----------------------------------------
                                    164     ; pop in A:X from XSTACK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     .macro _xpop 
                                    166     ld a,(y)
                                    167     ldw x,y 
                                    168     ldw x,(1,x)
                                    169     addw y,#CELL_SIZE 
                                    170     .endm 
                                    171 
                                    172     ; push A:X  to XSTACK 
                                    173     .macro _xpush 
                                    174     subw y,#CELL_SIZE
                                    175     ld (y),a 
                                    176     ldw (1,y),x 
                                    177     .endm 
                                    178 
                                    179     ; drop from XSTACK 
                                    180     .macro _xdrop 
                                    181     addw y,#CELL_SIZE 
                                    182     .endm 
                                    183 
                                    184     ; @T fetch top xstack 
                                    185     .macro _at_top
                                    186     ld a,(y)
                                    187     ldw x,y 
                                    188     ldw x,(1,x)
                                    189     .endm 
                                    190 
                                    191     ; @N  fetch next on xstack 
                                    192     .macro _at_next 
                                    193     ld a,(3,y)
                                    194     ldw x,y 
                                    195     ldw x,(4,x)
                                    196     .endm 
                                    197 
                                    198     ; !T put on top of xtack 
                                    199     .macro _store_top 
                                    200     ld (y),a 
                                    201     ldw (1,y),x     
                                    202     .endm 
                                    203 
                                    204     ; !N put next on xstack 
                                    205     .macro _store_next 
                                    206     ld (3,y),a 
                                    207     ldw (4,y),x 
                                    208     .endm 
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
      008000 82 00 81 3D             55     int cold_start			; RESET vector 
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
      008050 82 00 89 26             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      008096 CD 85 1E         [ 4]  120 	call print_registers
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
      0080D1 AE 80 EA         [ 2]  166 	ldw x,#USER_ABORT
      0080D4 CD 89 F5         [ 4]  167 	call puts 
      0080D7                        168 UBTN_Handler_exit:
      0080D7 AE 17 FF         [ 2]  169     ldw x,#STACK_EMPTY 
      0080DA 94               [ 1]  170     ldw sp,x
      0080DB 9A               [ 1]  171 	rim 
      0080DC CE 00 1B         [ 2]  172 	ldw x,txtbgn 
      0080DF A3 B6 00         [ 2]  173 	cpw x,#app_space 
      0080E2 22 03            [ 1]  174 	jrugt 5$
      0080E4 CD 95 21         [ 4]  175 	call clear_basic 
      0080E7 CC 97 49         [ 2]  176 5$:	jp warm_start
                                    177 
      0080EA 0A 50 72 6F 67 72 61   178 USER_ABORT: .asciz "\nProgram aborted by user.\n"
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
      008105                        192 clock_init:	
      008105 C1 50 C3         [ 1]  193 	cp a,CLK_CMSR 
      008108 27 0C            [ 1]  194 	jreq 2$ ; no switching required 
                                    195 ; select clock source 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      00810A 72 12 50 C5      [ 1]  196 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00810E C7 50 C4         [ 1]  197 	ld CLK_SWR,a
      008111 C1 50 C3         [ 1]  198 1$:	cp a,CLK_CMSR
      008114 26 FB            [ 1]  199 	jrne 1$
      008116                        200 2$: 	
                                    201 ; HSI and cpu clock divisor 
      008116 9F               [ 1]  202 	ld a,xl 
      008117 C7 50 C6         [ 1]  203 	ld CLK_CKDIVR,a  
      00811A 81               [ 4]  204 	ret
                                    205 
                                    206 ;----------------------------------
                                    207 ; TIMER2 used as audio tone output 
                                    208 ; on port D:5.
                                    209 ; channel 1 configured as PWM mode 1 
                                    210 ;-----------------------------------  
                                    211 
      00811B                        212 timer2_init:
      00811B 72 1A 50 C7      [ 1]  213 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00811F 35 60 53 05      [ 1]  214  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008123 35 08 53 0C      [ 1]  215 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008127 81               [ 4]  216 	ret 
                                    217 
                                    218 ;---------------------------------
                                    219 ; TIM4 is configured to generate an 
                                    220 ; interrupt every millisecond 
                                    221 ;----------------------------------
      008128                        222 timer4_init:
      008128 72 18 50 C7      [ 1]  223 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00812C 35 07 53 45      [ 1]  224 	mov TIM4_PSCR,#7 ; prescale 128  
      008130 35 7D 53 46      [ 1]  225 	mov TIM4_ARR,#125 ; set for 1msec.
      008134 35 05 53 40      [ 1]  226 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008138 72 10 53 41      [ 1]  227 	bset TIM4_IER,#TIM4_IER_UIE
      00813C 81               [ 4]  228 	ret
                                    229 
                                    230 ;-------------------------------------
                                    231 ;  initialization entry point 
                                    232 ;-------------------------------------
      00813D                        233 cold_start:
                                    234 ;set stack 
      00813D AE 17 FF         [ 2]  235 	ldw x,#STACK_EMPTY
      008140 94               [ 1]  236 	ldw sp,x
                                    237 ; clear all ram 
      008141 7F               [ 1]  238 0$: clr (x)
      008142 5A               [ 2]  239 	decw x 
      008143 26 FC            [ 1]  240 	jrne 0$
                                    241 ; activate pull up on all inputs 
      008145 A6 FF            [ 1]  242 	ld a,#255 
      008147 C7 50 03         [ 1]  243 	ld PA_CR1,a 
      00814A C7 50 08         [ 1]  244 	ld PB_CR1,a 
      00814D C7 50 0D         [ 1]  245 	ld PC_CR1,a 
      008150 C7 50 12         [ 1]  246 	ld PD_CR1,a 
      008153 C7 50 17         [ 1]  247 	ld PE_CR1,a 
      008156 C7 50 1C         [ 1]  248 	ld PF_CR1,a 
      008159 C7 50 21         [ 1]  249 	ld PG_CR1,a 
      00815C C7 50 2B         [ 1]  250 	ld PI_CR1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                    251 ; set LD2 pin as output 
      00815F 72 1A 50 0D      [ 1]  252     bset PC_CR1,#LED2_BIT
      008163 72 1A 50 0E      [ 1]  253     bset PC_CR2,#LED2_BIT
      008167 72 1A 50 0C      [ 1]  254     bset PC_DDR,#LED2_BIT
      00816B 72 1B 50 0A      [ 1]  255 	bres PC_ODR,#LED2_BIT 
                                    256 ; disable schmitt triggers on Arduino CN4 analog inputs
      00816F 55 00 3F 54 07   [ 1]  257 	mov ADC_TDRL,0x3f
                                    258 ; disable peripherals clocks
                                    259 ;	clr CLK_PCKENR1 
                                    260 ;	clr CLK_PCKENR2
      008174 72 5F 50 F2      [ 1]  261 	clr AWU_TBR 
      008178 72 14 50 CA      [ 1]  262 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    263 ; select internal clock no divisor: 16 Mhz 	
      00817C A6 E1            [ 1]  264 	ld a,#CLK_SWR_HSI 
      00817E 5F               [ 1]  265 	clrw x  
      00817F CD 81 05         [ 4]  266     call clock_init 
      008182 CD 81 28         [ 4]  267 	call timer4_init
      008185 CD 81 1B         [ 4]  268 	call timer2_init
                                    269 ; UART1 at 115200 BAUD
      008188 CD 89 53         [ 4]  270 	call uart1_init
                                    271 ; activate PE_4 (user button interrupt)
      00818B 72 18 50 18      [ 1]  272     bset PE_CR2,#USR_BTN_BIT 
                                    273 ; display system information
      00818F 9A               [ 1]  274 	rim ; enable interrupts 
      008190 72 5C 00 17      [ 1]  275 	inc seedy+1 
      008194 72 5C 00 15      [ 1]  276 	inc seedx+1 
      008198 CD 9C E1         [ 4]  277 	call func_eefree 
      00819B CD 9C 1E         [ 4]  278 	call ubound 
      00819E CD 95 21         [ 4]  279 	call clear_basic
      0081A1 CD A4 E5         [ 4]  280 	call beep_1khz  
      0081A4 CD 94 CE         [ 4]  281 	call system_information
      0081A7                        282 2$:	
                                    283 ; check for application in flash memory 
      0081A7 CE B6 00         [ 2]  284 	ldw x,app_sign 
      0081AA C3 A7 DB         [ 2]  285 	cpw x,SIGNATURE 
      0081AD 27 03            [ 1]  286 	jreq run_app
      0081AF CC 97 49         [ 2]  287 	jp warm_start 
      0081B2                        288 run_app:
                                    289 ; run application in FLASH|EEPROM 
      0081B2 CD 94 FF         [ 4]  290 	call warm_init
      0081B5 AE B6 04         [ 2]  291 	ldw x,#app 
      0081B8 CF 00 1B         [ 2]  292 	ldw txtbgn,x
      0081BB 72 BB B6 02      [ 2]  293 	addw x,app_size 
      0081BF CF 00 1D         [ 2]  294 	ldw txtend,x 
      0081C2 AE 81 D0         [ 2]  295 	ldw x,#AUTO_RUN 
      0081C5 CD 89 F5         [ 4]  296 	call puts 
      0081C8 CD 9D FE         [ 4]  297 	call program_info 
      0081CB CC A4 89         [ 2]  298 	jp run_it_02  
      0081CE 20 FE            [ 2]  299     jra .  
                                    300 
      0081D0 20 61 75 74 6F 20 72   301 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    302 
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
      0081E3                         35 add24: ; ( i1 i2 -- i1 + i2 )
      000163                         36     _xpop 
      0081E3 90 F6            [ 1]    1     ld a,(y)
      0081E5 93               [ 1]    2     ldw x,y 
      0081E6 EE 01            [ 2]    3     ldw x,(1,x)
      0081E8 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081EC 89               [ 2]   37     pushw x  
      0081ED 88               [ 1]   38     push a  
      00016E                         39     _xpop 
      0081EE 90 F6            [ 1]    1     ld a,(y)
      0081F0 93               [ 1]    2     ldw x,y 
      0081F1 EE 01            [ 2]    3     ldw x,(1,x)
      0081F3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081F7 72 FB 02         [ 2]   40     addw x,(2,sp)
      0081FA 19 01            [ 1]   41     adc a, (1,sp)
      00017C                         42     _xpush 
      0081FC 72 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      008200 90 F7            [ 1]    2     ld (y),a 
      008202 90 EF 01         [ 2]    3     ldw (1,y),x 
      000185                         43     _drop 3 
      008205 5B 03            [ 2]    1     addw sp,#3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008207 81               [ 4]   44     ret 
                                     45 
                                     46 ;-------------------------------
                                     47 ; sub24 A:X-acc24 
                                     48 ; subtract 24 bits integers 
                                     49 ;------------------------------
      008208                         50 sub24: ; (i1 i2 -- i1-i2 ) 
      000188                         51     _xpop 
      008208 90 F6            [ 1]    1     ld a,(y)
      00820A 93               [ 1]    2     ldw x,y 
      00820B EE 01            [ 2]    3     ldw x,(1,x)
      00820D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008211 89               [ 2]   52     pushw x 
      008212 88               [ 1]   53     push  a
      000193                         54     _at_top  
      008213 90 F6            [ 1]    1     ld a,(y)
      008215 93               [ 1]    2     ldw x,y 
      008216 EE 01            [ 2]    3     ldw x,(1,x)
      008218 72 F0 02         [ 2]   55     subw x,(2,sp) 
      00821B 12 01            [ 1]   56     sbc a, (1,sp)
      00019D                         57     _store_top  
      00821D 90 F7            [ 1]    1     ld (y),a 
      00821F 90 EF 01         [ 2]    2     ldw (1,y),x     
      0001A2                         58     _drop 3 
      008222 5B 03            [ 2]    1     addw sp,#3 
      008224 81               [ 4]   59     ret 
                                     60 
                                     61 ;------------------------------
                                     62 ; cp24 
                                     63 ; compare acc24 with A:X 
                                     64 ;-------------------------------
      008225                         65 cp24:
      008225 C1 00 0D         [ 1]   66     cp a,acc24 
      008228 26 03            [ 1]   67     jrne 9$ 
      00822A C3 00 0E         [ 2]   68     cpw x,acc16
      00822D                         69 9$: 
      00822D 81               [ 4]   70     ret 
                                     71 
                                     72 
                                     73 ;-------------------------------
                                     74 ; abs24 
                                     75 ; abolute value of top  
                                     76 ;-------------------------------
      00822E                         77 abs24: ; ( i -- u )
      00822E 90 F6            [ 1]   78     ld a,(y)
      008230 A1 80            [ 1]   79     cp a,#0x80 
      008232 2A 0E            [ 1]   80     jrpl neg24 ; negative integer
      008234 81               [ 4]   81     ret  
                                     82 
                                     83 ;----------------------------
                                     84 ;  one's compleement 
                                     85 ;----------------------------
      008235                         86 cpl24:  ; i -- ~i 
      0001B5                         87     _at_top 
      008235 90 F6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008237 93               [ 1]    2     ldw x,y 
      008238 EE 01            [ 2]    3     ldw x,(1,x)
      00823A 43               [ 1]   88     cpl a 
      00823B 53               [ 2]   89     cplw x 
      0001BC                         90     _store_top 
      00823C 90 F7            [ 1]    1     ld (y),a 
      00823E 90 EF 01         [ 2]    2     ldw (1,y),x     
      008241 81               [ 4]   91     ret 
                                     92 
                                     93 ;----------------------------    
                                     94 ; two'2 complement of top  
                                     95 ;---------------------------
      008242                         96 neg24: ; (i -- -i )
      0001C2                         97     _at_top
      008242 90 F6            [ 1]    1     ld a,(y)
      008244 93               [ 1]    2     ldw x,y 
      008245 EE 01            [ 2]    3     ldw x,(1,x)
      008247 43               [ 1]   98     cpl  a  
      008248 53               [ 2]   99     cplw x 
      008249 1C 00 01         [ 2]  100     addw x,#1
      00824C A9 00            [ 1]  101     adc a,#0
      0001CE                        102     _store_top  
      00824E 90 F7            [ 1]    1     ld (y),a 
      008250 90 EF 01         [ 2]    2     ldw (1,y),x     
      008253 81               [ 4]  103 9$: ret 
                                    104 
                                    105 ;-----------------------------
                                    106 ; negate integer in A:X 
                                    107 ;----------------------------
      008254                        108 neg_ax:
      008254 43               [ 1]  109     cpl  a  
      008255 53               [ 2]  110     cplw x 
      008256 1C 00 01         [ 2]  111     addw x,#1
      008259 A9 00            [ 1]  112     adc a,#0
      00825B 81               [ 4]  113     ret 
                                    114 
                                    115 ;------------------------------------
                                    116 ;  two's complement of acc24 
                                    117 ;-------------------------------------
      00825C                        118 neg_acc24: ; 
      00825C 88               [ 1]  119     push a 
      00825D 89               [ 2]  120 	pushw x
      00825E C6 00 0D         [ 1]  121 	ld a,acc24 
      008261 CE 00 0E         [ 2]  122 	ldw x,acc16
      008264 43               [ 1]  123 	cpl a 
      008265 53               [ 2]  124 	cplw x 
      008266 1C 00 01         [ 2]  125 	addw x,#1 
      008269 A9 00            [ 1]  126 	adc a,#0  
      00826B C7 00 0D         [ 1]  127 	ld acc24,a 
      00826E CF 00 0E         [ 2]  128 	ldw acc16,x 
      008271 85               [ 2]  129 	popw x 
      008272 84               [ 1]  130 	pop a 
      008273 81               [ 4]  131 	ret
                                    132 
                                    133 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                    134 ; unsigned multiply uint24_t by uint8_t
                                    135 ; input:
                                    136 ;	acc24	uint24_t 
                                    137 ;   A		uint8_t
                                    138 ; output:
                                    139 ;   acc24   A*acc24
                                    140 ;      A    overflow, bits 31..24 
                                    141 ;-------------------------------------
                                    142 ; local variables offset  on sp
                           000001   143 	U8   = 1   ; A pushed on stack
                           000001   144 	VSIZE = 1 
      008274                        145 mulu24_8:
      008274 89               [ 2]  146 	pushw x    ; save X
                                    147 	; local variable
      008275 88               [ 1]  148 	push a     ; U8
      008276 72 5F 00 0C      [ 1]  149 	clr acc32 
                                    150 ; multiply bits 7..0 * U8   	
      00827A 97               [ 1]  151 	ld xl,a 
      00827B C6 00 0F         [ 1]  152 	ld a,acc8 
      00827E 42               [ 4]  153 	mul x,a 
      00827F C6 00 0E         [ 1]  154 	ld a, acc16 
      008282 CF 00 0E         [ 2]  155 	ldw acc16,x
                                    156 ; multiply middle byte, bits 15..8 * U8  	
      008285 97               [ 1]  157 	ld xl,a 
      008286 7B 01            [ 1]  158 	ld a,(U8,sp)
      008288 42               [ 4]  159 	mul x,a 
      008289 C6 00 0D         [ 1]  160 	ld a,acc24
      00828C 72 5F 00 0D      [ 1]  161 	clr acc24  
      008290 72 BB 00 0D      [ 2]  162 	addw x,acc24
      008294 CF 00 0D         [ 2]  163 	ldw acc24,x 
                                    164 ; multiply  MSB, bits 23..16 * U8 
      008297 97               [ 1]  165 	ld xl,a 
      008298 7B 01            [ 1]  166 	ld a,(U8,sp)
      00829A 42               [ 4]  167 	mul x,a
      00829B 72 BB 00 0C      [ 2]  168 	addw x,acc32  
      00829F CF 00 0C         [ 2]  169 	ldw acc32,x 
      0082A2 9E               [ 1]  170 	ld a,xh 
      000223                        171 	_drop VSIZE  
      0082A3 5B 01            [ 2]    1     addw sp,#VSIZE 
      0082A5 85               [ 2]  172 	popw x 
      0082A6 81               [ 4]  173 	ret 
                                    174 
                                    175 
                                    176 ;-------------------------------
                                    177 ; mul24 i1 i2 -- i1*i2  
                                    178 ; multiply 24 bits integers 
                                    179 ;------------------------------
                           000001   180     PROD=1 
                           000004   181     N1=4
                           000007   182     N2=7
                           00000A   183     PROD_SIGN=10
                           00000A   184     VSIZE=10 
      0082A7                        185 mul24:
      000227                        186     _vars VSIZE
      0082A7 52 0A            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000229                        187     _xpop 
      0082A9 90 F6            [ 1]    1     ld a,(y)
      0082AB 93               [ 1]    2     ldw x,y 
      0082AC EE 01            [ 2]    3     ldw x,(1,x)
      0082AE 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0082B2 C7 00 0D         [ 1]  188     ld acc24,a 
      0082B5 CF 00 0E         [ 2]  189     ldw acc16,x 
      000238                        190     _at_top 
      0082B8 90 F6            [ 1]    1     ld a,(y)
      0082BA 93               [ 1]    2     ldw x,y 
      0082BB EE 01            [ 2]    3     ldw x,(1,x)
      0082BD 0F 0A            [ 1]  191     clr (PROD_SIGN,sp)
      0082BF 4D               [ 1]  192     tnz a 
      0082C0 2A 05            [ 1]  193     jrpl 1$ 
      0082C2 03 0A            [ 1]  194     cpl (PROD_SIGN,sp) 
      0082C4 CD 82 42         [ 4]  195     call neg24
      0082C7                        196 1$:
      0082C7 6B 07            [ 1]  197     ld (N2,sp),a 
      0082C9 1F 08            [ 2]  198     ldw (N2+1,sp),x
      0082CB C6 00 0D         [ 1]  199     ld a,acc24 
      0082CE CE 00 0E         [ 2]  200     ldw x,acc16
      0082D1 4D               [ 1]  201     tnz a 
      0082D2 2A 05            [ 1]  202     jrpl 2$ 
      0082D4 03 0A            [ 1]  203     cpl (PROD_SIGN,sp) 
      0082D6 CD 82 42         [ 4]  204     call neg24 
      0082D9                        205 2$: 
      0082D9 6B 04            [ 1]  206     ld (N1,sp),a 
      0082DB 1F 05            [ 2]  207     ldw (N1+1,sp),x
      0082DD C7 00 0D         [ 1]  208     ld acc24,a 
      0082E0 CF 00 0E         [ 2]  209     ldw acc16,x 
      0082E3 7B 09            [ 1]  210     ld a,(N2+2,sp); least byte     
      0082E5 27 12            [ 1]  211     jreq 4$
      0082E7 CD 82 74         [ 4]  212     call mulu24_8
      0082EA 4D               [ 1]  213     tnz a 
      0082EB 26 61            [ 1]  214     jrne 8$ ; overflow 
      0082ED CE 00 0E         [ 2]  215     ldw x,acc16  
      0082F0 C6 00 0D         [ 1]  216     ld a,acc24
      0082F3 2B 59            [ 1]  217     jrmi 8$ ; overflow  
      0082F5 6B 01            [ 1]  218     ld (PROD,sp),a
      0082F7 1F 02            [ 2]  219     ldw (PROD+1,sp),x 
      0082F9                        220 4$:
      0082F9 7B 04            [ 1]  221     ld a,(N1,sp) 
      0082FB 1E 05            [ 2]  222     ldw x,(N1+1,sp)
      0082FD C7 00 0D         [ 1]  223     ld acc24,a 
      008300 CF 00 0E         [ 2]  224     ldw acc16,x 
      008303 7B 08            [ 1]  225     ld a,(N2+1,sp); middle byte     
      008305 27 1F            [ 1]  226     jreq 5$
      008307 CD 82 74         [ 4]  227     call mulu24_8
      00830A 4D               [ 1]  228     tnz a 
      00830B 26 41            [ 1]  229     jrne 8$ ; overflow 
      00830D C6 00 0D         [ 1]  230     ld a,acc24 
      008310 26 3C            [ 1]  231     jrne 8$  ; overflow 
      008312 CE 00 0E         [ 2]  232     ldw x,acc16  
      008315 72 FB 01         [ 2]  233     addw x,(PROD,sp)
      008318 29 34            [ 1]  234     jrv 8$ ; overflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00831A 1F 01            [ 2]  235     ldw (PROD,sp),x 
      00831C 7B 04            [ 1]  236     ld a,(N1,sp)
      00831E 1E 05            [ 2]  237     ldw x,(N1+1,sp)
      008320 C7 00 0D         [ 1]  238     ld acc24,a 
      008323 CF 00 0E         [ 2]  239     ldw acc16,x 
      008326                        240 5$:
      008326 7B 07            [ 1]  241     ld a,(N2,sp) ; high byte 
      008328 27 16            [ 1]  242     jreq 6$
      00832A CD 82 74         [ 4]  243     call mulu24_8
      00832D 4D               [ 1]  244     tnz a 
      00832E 26 1E            [ 1]  245     jrne 8$ ; overflow 
      008330 CE 00 0D         [ 2]  246     ldw x,acc24 
      008333 26 19            [ 1]  247     jrne 8$ ; overflow 
      008335 C6 00 0F         [ 1]  248     ld a,acc8 
      008338 2B 14            [ 1]  249     jrmi 8$ ; overflow 
      00833A 1B 01            [ 1]  250     add a,(PROD,sp)
      00833C 6B 01            [ 1]  251     ld (PROD,sp),a 
      00833E 29 0E            [ 1]  252     jrv 8$ ; overflow 
      008340                        253 6$:
      008340 7B 01            [ 1]  254     ld a,(PROD,sp)
      008342 1E 02            [ 2]  255     ldw x,(PROD+1,sp)
      008344 0D 0A            [ 1]  256     tnz (PROD_SIGN,sp)
      008346 27 03            [ 1]  257     jreq 7$
      008348 CD 82 42         [ 4]  258     call neg24 
      00834B                        259 7$:
      00834B 98               [ 1]  260     rcf ; C=0 means no overflow 
      00834C 20 03            [ 2]  261     jra 9$
      00834E                        262 8$: ; overflow 
      00834E 4F               [ 1]  263     clr a 
      00834F 5F               [ 1]  264     clrw x 
      008350 99               [ 1]  265     scf ; C=1 means overflow 
      008351                        266 9$:    
      0002D1                        267     _store_top 
      008351 90 F7            [ 1]    1     ld (y),a 
      008353 90 EF 01         [ 2]    2     ldw (1,y),x     
      0002D6                        268     _drop VSIZE 
      008356 5B 0A            [ 2]    1     addw sp,#VSIZE 
      008358 81               [ 4]  269     ret 
                                    270 
                                    271 ;-------------------------------------
                                    272 ; divide uint24_t by uint8_t
                                    273 ; input:
                                    274 ;	acc24	dividend
                                    275 ;   A 		divisor
                                    276 ; output:
                                    277 ;   acc24	quotient
                                    278 ;   A		remainder
                                    279 ;------------------------------------- 
                                    280 ; offset  on sp of arguments and locals
                           000001   281 	U8   = 1   ; divisor on stack
                           000001   282 	VSIZE =1
      008359                        283 divu24_8:
      008359 89               [ 2]  284 	pushw x ; save x
      00835A 88               [ 1]  285 	push a 
                                    286 	; ld dividend UU:MM bytes in X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00835B C6 00 0D         [ 1]  287 	ld a, acc24
      00835E 95               [ 1]  288 	ld xh,a
      00835F C6 00 0E         [ 1]  289 	ld a,acc16
      008362 97               [ 1]  290 	ld xl,a
      008363 7B 01            [ 1]  291 	ld a,(U8,SP) ; divisor
      008365 62               [ 2]  292 	div x,a ; UU:MM/U8
      008366 88               [ 1]  293 	push a  ;save remainder
      008367 9E               [ 1]  294 	ld a,xh
      008368 C7 00 0D         [ 1]  295 	ld acc24,a
      00836B 9F               [ 1]  296 	ld a,xl
      00836C C7 00 0E         [ 1]  297 	ld acc16,a
      00836F 84               [ 1]  298 	pop a
      008370 95               [ 1]  299 	ld xh,a
      008371 C6 00 0F         [ 1]  300 	ld a,acc24+2
      008374 97               [ 1]  301 	ld xl,a
      008375 7B 01            [ 1]  302 	ld a,(U8,sp) ; divisor
      008377 62               [ 2]  303 	div x,a  ; R:LL/U8
      008378 6B 01            [ 1]  304 	ld (U8,sp),a ; save remainder
      00837A 9F               [ 1]  305 	ld a,xl
      00837B C7 00 0F         [ 1]  306 	ld acc24+2,a
      00837E 84               [ 1]  307 	pop a
      00837F 85               [ 2]  308 	popw x
      008380 81               [ 4]  309 	ret
                                    310 
                                    311 
                                    312 ;-------------------------------
                                    313 ; div24 N/T   
                                    314 ; divide 24 bits integers
                                    315 ;  i1 i2 -- i1/i2 
                                    316 ;------------------------------
                           000001   317     DIVISOR=1
                           000004   318     CNTR=4
                           000005   319     QSIGN=5
                           000006   320     RSIGN=6 
                           000006   321     VSIZE=6 
      008381                        322 div24:
      000301                        323     _vars VSIZE 
      008381 52 06            [ 2]    1     sub sp,#VSIZE 
      008383 0F 06            [ 1]  324     clr (RSIGN,sp)
      008385 0F 05            [ 1]  325     clr (QSIGN,sp)
      000307                        326     _xpop 
      008387 90 F6            [ 1]    1     ld a,(y)
      008389 93               [ 1]    2     ldw x,y 
      00838A EE 01            [ 2]    3     ldw x,(1,x)
      00838C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008390 4D               [ 1]  327     tnz a 
      008391 2A 05            [ 1]  328     jrpl 0$ 
      008393 03 05            [ 1]  329     cpl (QSIGN,sp)
      008395 CD 82 42         [ 4]  330     call neg24 
      008398                        331 0$:
      008398 6B 01            [ 1]  332     ld  (DIVISOR,sp),a
      00839A 1F 02            [ 2]  333     ldw (DIVISOR+1,sp),x
      00839C 1A 02            [ 1]  334     or a,(DIVISOR+1,sp)
      00839E 1A 03            [ 1]  335     or a,(DIVISOR+2,sp)
      0083A0 26 05            [ 1]  336     jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0083A2 A6 04            [ 1]  337     ld a,#ERR_DIV0 
      0083A4 CC 96 C7         [ 2]  338     jp tb_error 
      0083A7                        339 1$: 
      000327                        340     _at_top 
      0083A7 90 F6            [ 1]    1     ld a,(y)
      0083A9 93               [ 1]    2     ldw x,y 
      0083AA EE 01            [ 2]    3     ldw x,(1,x)
      0083AC C7 00 0D         [ 1]  341     ld acc24,a 
      0083AF CF 00 0E         [ 2]  342     ldw acc16,x 
      0083B2 A6 18            [ 1]  343     ld a,#24 
      0083B4 6B 04            [ 1]  344     ld (CNTR,sp),a
      0083B6 7B 01            [ 1]  345     ld a,(DIVISOR,sp)
      0083B8 72 5D 00 0D      [ 1]  346     tnz acc24 
      0083BC 2A 07            [ 1]  347     jrpl 2$ 
      0083BE 03 05            [ 1]  348     cpl (QSIGN,sp)
      0083C0 03 06            [ 1]  349     cpl (RSIGN,sp)
      0083C2 CD 82 5C         [ 4]  350     call neg_acc24
      0083C5                        351 2$:
      0083C5 CD 82 25         [ 4]  352     call cp24 ; A:X-acc24 ?
      0083C8 23 0A            [ 2]  353     jrule 22$ 
                                    354 ; quotient=0, remainder=0     
      0083CA 4F               [ 1]  355     clr a 
      0083CB 5F               [ 1]  356     clrw x
      0083CC C7 00 0D         [ 1]  357     ld acc24,a 
      0083CF CF 00 0E         [ 2]  358     ldw acc16,x  
      0083D2 20 57            [ 2]  359     jra 9$
      0083D4                        360 22$:     
      0083D4 4F               [ 1]  361     clr a 
      0083D5 5F               [ 1]  362     clrw x 
      0083D6 98               [ 1]  363     rcf  
      0083D7                        364 3$: 
      0083D7 72 59 00 0F      [ 1]  365     rlc acc8 
      0083DB 72 59 00 0E      [ 1]  366     rlc acc16
      0083DF 72 59 00 0D      [ 1]  367     rlc acc24 
      0083E3 59               [ 2]  368     rlcw x  
      0083E4 49               [ 1]  369     rlc a
      0083E5 72 F0 02         [ 2]  370 4$: subw x,(DIVISOR+1,sp) 
      0083E8 12 01            [ 1]  371     sbc a,(DIVISOR,sp)
      0083EA 24 05            [ 1]  372     jrnc 5$
      0083EC 72 FB 02         [ 2]  373     addw x,(DIVISOR+1,sp)
      0083EF 19 01            [ 1]  374     adc a,(DIVISOR,sp)
      0083F1                        375 5$: ; shift carry in QUOTIENT 
      0083F1 8C               [ 1]  376     ccf
      0083F2 0A 04            [ 1]  377     dec (CNTR,sp)
      0083F4 26 E1            [ 1]  378     jrne 3$ 
      0083F6 72 59 00 0F      [ 1]  379     rlc acc8 
      0083FA 72 59 00 0E      [ 1]  380     rlc acc16 
      0083FE 72 59 00 0C      [ 1]  381     rlc acc32 
      008402 6B 01            [ 1]  382     ld (DIVISOR,sp),a 
      008404 1F 02            [ 2]  383     ldw (DIVISOR+1,sp),x 
      008406 C6 00 0D         [ 1]  384     ld a,acc24 
      008409 CE 00 0E         [ 2]  385     ldw x,acc16 
      00840C 0D 05            [ 1]  386     tnz (QSIGN,sp)
      00840E 27 07            [ 1]  387     jreq 8$
      008410 43               [ 1]  388     cpl  a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008411 53               [ 2]  389     cplw x 
      008412 1C 00 01         [ 2]  390     addw x,#1
      008415 A9 00            [ 1]  391     adc a,#0
      008417                        392 8$: 
      000397                        393     _store_top 
      008417 90 F7            [ 1]    1     ld (y),a 
      008419 90 EF 01         [ 2]    2     ldw (1,y),x     
      00841C 7B 01            [ 1]  394     ld a,(DIVISOR,sp)
      00841E 1E 02            [ 2]  395     ldw x,(DIVSOR+1,sp)
      008420 0D 06            [ 1]  396     tnz (RSIGN,sp)
      008422 27 07            [ 1]  397     jreq 9$      
      008424 43               [ 1]  398     cpl  a  
      008425 53               [ 2]  399     cplw x 
      008426 1C 00 01         [ 2]  400     addw x,#1
      008429 A9 00            [ 1]  401     adc a,#0
      0003AB                        402 9$: _drop VSIZE 
      00842B 5B 06            [ 2]    1     addw sp,#VSIZE 
      00842D 81               [ 4]  403     ret 
                                    404 
                                    405 
                                    406 ;-------------------------------
                                    407 ; mod24 A:X % acc24 
                                    408 ; remainder 24 bits integers 
                                    409 ; input:
                                    410 ;    acc24   dividend 
                                    411 ;    A:X     divisor 
                                    412 ; output:
                                    413 ;    acc24   acc24 % A:X 
                                    414 ;------------------------------
      00842E                        415 mod24:
      00842E CD 83 81         [ 4]  416     call div24 
      0003B1                        417     _store_top  ; replace quotient by remainder 
      008431 90 F7            [ 1]    1     ld (y),a 
      008433 90 EF 01         [ 2]    2     ldw (1,y),x     
      008436 81               [ 4]  418     ret 
                                    419 
                                    420 
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
      008437                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003B7                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003B7                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003B7                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003B7                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003B7                         37 prt_regs::
      008437 AE 84 7A         [ 2]   38 	ldw x,#regs_state 
      00843A CD 89 F5         [ 4]   39 	call puts
                                     40 ; register PC
      00843D 16 01            [ 2]   41 	ldw y,(1,sp)
      00843F AE 85 AE         [ 2]   42 	ldw x,#REG_EPC 
      008442 CD 84 FF         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      008445 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      008447 AE 85 BF         [ 2]   46 	ldw x,#REG_CC 
      00844A CD 84 DD         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      00844D 7B 07            [ 1]   49 	ld a,(R_A,sp)
      00844F AE 85 BB         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008452 CD 84 DD         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      008455 16 05            [ 2]   53 	ldw y,(R_X,sp)
      008457 AE 85 B7         [ 2]   54 	ldw x,#REG_X 
      00845A CD 84 FF         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      00845D 16 03            [ 2]   57 	ldw y,(R_Y,sp)
      00845F AE 85 B3         [ 2]   58 	ldw x,#REG_Y 
      008462 CD 84 FF         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      008465 90 96            [ 1]   61 	ldw y,sp
      008467 72 A9 00 08      [ 2]   62 	addw y,#6+ARG_OFS  
      00846B AE 85 C4         [ 2]   63 	ldw x,#REG_SP
      00846E CD 84 FF         [ 4]   64 	call prt_reg16
      008471 A6 0D            [ 1]   65 	ld a,#CR 
      008473 CD 89 98         [ 4]   66 	call putc
      008476 CD 89 98         [ 4]   67 	call putc   
      008479 81               [ 4]   68 	ret 
                                     69 
                                     70 
      00847A 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      0084A1                         81 prt_peek::
      0084A1 89               [ 2]   82 	pushw x 
      0084A2 35 10 00 0B      [ 1]   83 	mov base,#16 
      0084A6 CD 98 0A         [ 4]   84 	call prt_i16  
      0084A9 A6 3A            [ 1]   85 	ld a,#': 
      0084AB CD 89 98         [ 4]   86 	call putc 
      0084AE A6 20            [ 1]   87 	ld a,#SPACE 
      0084B0 CD 89 98         [ 4]   88 	call putc 
      0084B3 85               [ 2]   89 	popw x 
      0084B4 F6               [ 1]   90 	ld a,(x)
      0084B5 5F               [ 1]   91 	clrw x 
      0084B6 97               [ 1]   92 	ld xl,a 
      0084B7 35 0A 00 0B      [ 1]   93 	mov base,#10 
      0084BB CD 98 0A         [ 4]   94 	call prt_i16 
      0084BE 81               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      0084BF                        102 ledon:
      0084BF 72 1A 50 0A      [ 1]  103     bset PC_ODR,#LED2_BIT
      0084C3 81               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      0084C4                        107 ledoff:
      0084C4 72 1B 50 0A      [ 1]  108     bres PC_ODR,#LED2_BIT 
      0084C8 81               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      0084C9                        112 ledtoggle:
      0084C9 A6 20            [ 1]  113     ld a,#LED2_MASK
      0084CB C8 50 0A         [ 1]  114     xor a,PC_ODR
      0084CE C7 50 0A         [ 1]  115     ld PC_ODR,a
      0084D1 81               [ 4]  116     ret 
                                    117 
      0084D2                        118 left_paren:
      0084D2 A6 20            [ 1]  119 	ld a,#SPACE 
      0084D4 CD 89 98         [ 4]  120 	call putc
      0084D7 A6 28            [ 1]  121 	ld a,#'( 
      0084D9 CD 89 98         [ 4]  122 	call putc 	
      0084DC 81               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      0084DD                        133 prt_reg8:
      0084DD 88               [ 1]  134 	push a 
      0084DE CD 89 F5         [ 4]  135 	call puts 
      0084E1 7B 01            [ 1]  136 	ld a,(1,sp) 
      0084E3 5F               [ 1]  137 	clrw x 
      0084E4 97               [ 1]  138 	ld xl,a 
      0084E5 35 10 00 0B      [ 1]  139 	mov base,#16
      0084E9 CD 98 0A         [ 4]  140 	call prt_i16  
      0084EC CD 84 D2         [ 4]  141 	call left_paren 
      0084EF 84               [ 1]  142 	pop a 
      0084F0 5F               [ 1]  143 	clrw x 
      0084F1 97               [ 1]  144 	ld xl,a 
      0084F2 35 0A 00 0B      [ 1]  145 	mov base,#10 
      0084F6 CD 98 0A         [ 4]  146 	call prt_i16  
      0084F9 A6 29            [ 1]  147 	ld a,#') 
      0084FB CD 89 98         [ 4]  148 	call putc
      0084FE 81               [ 4]  149 	ret
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
      0084FF                        159 prt_reg16: 
      0084FF 90 89            [ 2]  160 	pushw y 
      008501 CD 89 F5         [ 4]  161 	call puts 
      008504 1E 01            [ 2]  162 	ldw x,(1,sp) 
      008506 35 10 00 0B      [ 1]  163 	mov base,#16 
      00850A CD 98 0A         [ 4]  164 	call prt_i16  
      00850D CD 84 D2         [ 4]  165 	call left_paren 
      008510 85               [ 2]  166 	popw x 
      008511 35 0A 00 0B      [ 1]  167 	mov base,#10 
      008515 CD 98 0A         [ 4]  168 	call prt_i16  
      008518 A6 29            [ 1]  169 	ld a,#') 
      00851A CD 89 98         [ 4]  170 	call putc
      00851D 81               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      00851E                        177 print_registers:
      00851E AE 85 71         [ 2]  178 	ldw x,#STATES
      008521 CD 89 F5         [ 4]  179 	call puts
                                    180 ; print EPC 
      008524 AE 85 AE         [ 2]  181 	ldw x, #REG_EPC
      008527 CD 89 F5         [ 4]  182 	call puts 
      00852A 7B 0B            [ 1]  183 	ld a, (11,sp)
      00852C C7 00 0F         [ 1]  184 	ld acc8,a 
      00852F 7B 0A            [ 1]  185 	ld a, (10,sp) 
      008531 C7 00 0E         [ 1]  186 	ld acc16,a 
      008534 7B 09            [ 1]  187 	ld a,(9,sp) 
      008536 C7 00 0D         [ 1]  188 	ld acc24,a
      008539 5F               [ 1]  189 	clrw x  
      00853A A6 10            [ 1]  190 	ld a,#16
      00853C CD 98 1A         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      00853F AE 85 B7         [ 2]  193 	ldw x,#REG_X
      008542 16 05            [ 2]  194 	ldw y,(5,sp)
      008544 CD 84 FF         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      008547 AE 85 B3         [ 2]  197 	ldw x,#REG_Y
      00854A 16 07            [ 2]  198 	ldw y, (7,sp)
      00854C CD 84 FF         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      00854F AE 85 BB         [ 2]  201 	ldw x,#REG_A
      008552 7B 04            [ 1]  202 	ld a, (4,sp) 
      008554 CD 84 DD         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      008557 AE 85 BF         [ 2]  205 	ldw x,#REG_CC 
      00855A 7B 03            [ 1]  206 	ld a, (3,sp) 
      00855C CD 84 DD         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      00855F AE 85 C4         [ 2]  209 	ldw x,#REG_SP
      008562 90 96            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008564 72 A9 00 0C      [ 2]  211 	addw y,#12
      008568 CD 84 FF         [ 4]  212 	call prt_reg16  
      00856B A6 0A            [ 1]  213 	ld a,#'\n' 
      00856D CD 89 98         [ 4]  214 	call putc
      008570 81               [ 4]  215 	ret
                                    216 
      008571 0A 52 65 67 69 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0085AE 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      0085B3 0A 59 3A 00            219 REG_Y:   .asciz "\nY:" 
      0085B7 0A 58 3A 00            220 REG_X:   .asciz "\nX:"
      0085BB 0A 41 3A 00            221 REG_A:   .asciz "\nA:" 
      0085BF 0A 43 43 3A 00         222 REG_CC:  .asciz "\nCC:"
      0085C4 0A 53 50 3A 00         223 REG_SP:  .asciz "\nSP:"
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
      0085C9                        235 cmd_itf:
      0085C9 52 01            [ 2]  236 	sub sp,#VSIZE 
      0085CB 72 5F 00 18      [ 1]  237 	clr farptr 
      0085CF 72 5F 00 19      [ 1]  238 	clr farptr+1 
      0085D3 72 5F 00 1A      [ 1]  239 	clr farptr+2  
      0085D7                        240 repl:
      0085D7 A6 0D            [ 1]  241 	ld a,#CR 
      0085D9 CD 89 98         [ 4]  242 	call putc 
      0085DC A6 3F            [ 1]  243 	ld a,#'? 
      0085DE CD 89 98         [ 4]  244 	call putc
      0085E1 72 5F 00 01      [ 1]  245 	clr in.w 
      0085E5 72 5F 00 02      [ 1]  246 	clr in 
      0085E9 CD 8A FA         [ 4]  247 	call readln
      0085EC 90 AE 16 68      [ 2]  248 	ldw y,#tib  
      0085F0 90 F6            [ 1]  249 	ld a,(y)
      0085F2 27 E3            [ 1]  250 	jreq repl  
      0085F4 72 5C 00 02      [ 1]  251 	inc in 
      0085F8 CD 98 A1         [ 4]  252 	call to_upper 
      0085FB A1 51            [ 1]  253 	cp a,#'Q 
      0085FD 26 17            [ 1]  254 	jrne test_p
      0085FF                        255 repl_exit:
      0085FF 72 5F 16 68      [ 1]  256 	clr tib 
      008603 72 5F 00 04      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008607 72 5F 00 02      [ 1]  258 	clr in 
      00058B                        259 	_drop #VSIZE 	
      00860B 5B 01            [ 2]    1     addw sp,##VSIZE 
      00860D 81               [ 4]  260 	ret  
      00860E                        261 invalid:
      00860E AE 86 8F         [ 2]  262 	ldw x,#invalid_cmd 
      008611 CD 89 F5         [ 4]  263 	call puts 
      008614 20 C1            [ 2]  264 	jra repl 
      008616                        265 test_p:	
      008616 A1 50            [ 1]  266     cp a,#'P 
      008618 27 11            [ 1]  267 	jreq mem_peek
      00861A A1 53            [ 1]  268     cp a,#'S 
      00861C 26 F0            [ 1]  269 	jrne invalid 
      00861E                        270 print_string:	
      00861E CD 8F 62         [ 4]  271 	call get_token
      008621 A1 84            [ 1]  272 	cp a,#TK_INTGR 
      008623 26 E9            [ 1]  273 	jrne invalid 
      008625 CD 89 F5         [ 4]  274 	call puts
      008628 CC 85 D7         [ 2]  275 	jp repl 	
      00862B                        276 mem_peek:
      00862B A6 20            [ 1]  277 	ld a,#SPACE 
      00862D CD 8F 4F         [ 4]  278 	call skip  	 
      008630 72 B9 00 01      [ 2]  279 	addw y,in.w 
      008634 AE 16 B8         [ 2]  280 	ldw x,#pad 
      008637 CD 94 25         [ 4]  281 	call strcpy
      00863A AE 16 B8         [ 2]  282 	ldw x,#pad
      00863D CD 98 AD         [ 4]  283 	call atoi24 	
      008640 C6 00 0D         [ 1]  284 	ld a, acc24 
      008643 CA 00 0E         [ 1]  285 	or a,acc16 
      008646 CA 00 0F         [ 1]  286 	or a,acc8 
      008649 26 02            [ 1]  287 	jrne 1$ 
      00864B 20 0C            [ 2]  288 	jra peek_byte  
      00864D CE 00 0D         [ 2]  289 1$:	ldw x,acc24 
      008650 CF 00 18         [ 2]  290 	ldw farptr,x 
      008653 C6 00 0F         [ 1]  291 	ld a,acc8 
      008656 C7 00 1A         [ 1]  292 	ld farptr+2,a 
      008659                        293 peek_byte:
      008659 CD 86 9E         [ 4]  294 	call print_farptr 
      00865C A6 08            [ 1]  295 	ld a,#8 
      00865E 6B 01            [ 1]  296 	ld (PSIZE,sp),a 
      008660 5F               [ 1]  297 	clrw x 
      008661 CD 86 B9         [ 4]  298 1$:	call fetchc  
      008664 89               [ 2]  299 	pushw x 
      008665 C7 00 0F         [ 1]  300 	ld acc8,a 
      008668 5F               [ 1]  301 	clrw x 
      008669 CF 00 0D         [ 2]  302 	ldw acc24,x 
      00866C A6 90            [ 1]  303 	ld a,#16+128
      00866E CD 98 1A         [ 4]  304 	call prt_acc24
      008671 85               [ 2]  305 	popw x 
      008672 0A 01            [ 1]  306 	dec (PSIZE,sp)
      008674 26 EB            [ 1]  307 	jrne 1$ 
      008676 A6 08            [ 1]  308 	ld a,#8 
      008678 CB 00 1A         [ 1]  309 	add a,farptr+2 
      00867B C7 00 1A         [ 1]  310 	ld farptr+2,a
      00867E 4F               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00867F C9 00 19         [ 1]  312 	adc a,farptr+1 
      008682 C7 00 19         [ 1]  313 	ld farptr+1,a 
      008685 4F               [ 1]  314 	clr a 
      008686 C9 00 18         [ 1]  315 	adc a,farptr 
      008689 C7 00 18         [ 1]  316 	ld farptr,a 
      00868C CC 85 D7         [ 2]  317 	jp repl  
                                    318 
      00868F 6E 6F 74 20 61 20 63   319 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      00869E                        324 print_farptr:
      00869E C6 00 1A         [ 1]  325 	ld a ,farptr+2 
      0086A1 C7 00 0F         [ 1]  326 	ld acc8,a 
      0086A4 CE 00 18         [ 2]  327 	ldw x,farptr 
      0086A7 CF 00 0D         [ 2]  328 	ldw acc24,x 
      0086AA 5F               [ 1]  329 	clrw x 
      0086AB A6 10            [ 1]  330 	ld a,#16 
      0086AD CD 98 1A         [ 4]  331 	call prt_acc24
      0086B0 A6 20            [ 1]  332 	ld a,#SPACE 
      0086B2 CD 89 98         [ 4]  333 	call putc 
      0086B5 CD 89 98         [ 4]  334 	call putc 
      0086B8 81               [ 4]  335 	ret
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
      0086B9                        346 fetchc: ; @C
      0086B9 92 AF 00 18      [ 5]  347 	ldf a,([farptr],x)
      0086BD 5C               [ 1]  348 	incw x
      0086BE 81               [ 4]  349 	ret
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
      0086BF                        360 number:
      0086BF CD 8F 62         [ 4]  361 	call get_token
      0086C2 A1 84            [ 1]  362 	cp a,#TK_INTGR
      0086C4 27 03            [ 1]  363 	jreq 1$
      0086C6 CC 96 C5         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0086C9 81               [ 4]  365 1$:	ret
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
      0086CA                        380 show_row:
      0086CA 4D               [ 1]  381 	tnz a 
      0086CB 26 01            [ 1]  382 	jrne 1$
      0086CD 81               [ 4]  383 	ret 
      0086CE                        384 1$:	
      0086CE 89               [ 2]  385 	pushw x  
      0086CF 88               [ 1]  386 	push a 
      0086D0 35 04 00 23      [ 1]  387 	mov tab_width,#4 
      0086D4 CD 98 0A         [ 4]  388 	call prt_i16 
      0086D7 A6 20            [ 1]  389 	ld a,#SPACE  
      0086D9 CD 89 98         [ 4]  390 	call putc
      0086DC                        391 row_loop:
      0086DC 1E 02            [ 2]  392 	ldw x,(ADR,sp)
      0086DE F6               [ 1]  393 	ld a,(x)
      0086DF 5F               [ 1]  394 	clrw x 
      0086E0 97               [ 1]  395 	ld xl,a 
      0086E1 CD 98 0A         [ 4]  396 	call prt_i16 
      0086E4 1E 02            [ 2]  397 	ldw x,(ADR,sp)
      0086E6 5C               [ 1]  398 	incw x 
      0086E7 1F 02            [ 2]  399 	ldw (ADR,sp),x 
      0086E9 0A 01            [ 1]  400 	dec (CNT,sp)
      0086EB 26 EF            [ 1]  401 	jrne row_loop
      00066D                        402 	_drop VSIZE  		
      0086ED 5B 03            [ 2]    1     addw sp,#VSIZE 
      0086EF 35 04 00 23      [ 1]  403 	mov tab_width,#4
      0086F3 A6 0D            [ 1]  404 	ld a,#CR 
      0086F5 CD 89 98         [ 4]  405 	call putc 
      0086F8 81               [ 4]  406 	ret 
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



      0086F9                        419 hex_dump:
      0086F9 88               [ 1]  420 	push a 
      00067A                        421 	_vars VSIZE
      0086FA 52 04            [ 2]    1     sub sp,#VSIZE 
      0086FC C6 00 0B         [ 1]  422 	ld a,base
      0086FF 6B 03            [ 1]  423 	ld (BASE,sp),a 
      008701 35 10 00 0B      [ 1]  424 	mov base,#16
      008705 C6 00 23         [ 1]  425 	ld a,tab_width 
      008708 6B 04            [ 1]  426 	ld (TABW,sp),a
      00870A A6 0D            [ 1]  427 	ld a,#CR 
      00870C CD 89 98         [ 4]  428 	call putc 
      00870F 17 01            [ 2]  429 1$: ldw (BCNT,sp),y
      008711 A6 10            [ 1]  430 	ld a,#16
      008713 90 A3 00 10      [ 2]  431 	cpw y,#16
      008717 2A 02            [ 1]  432 	jrpl 2$
      008719 90 9F            [ 1]  433 	ld a,yl
      00871B                        434 2$: 	
      00871B CD 86 CA         [ 4]  435 	call show_row 
      00871E 16 01            [ 2]  436 	ldw y,(BCNT,sp) 
      008720 72 A2 00 10      [ 2]  437 	subw y,#16 
      008724 90 A3 00 01      [ 2]  438 	cpw y,#1
      008728 2A E5            [ 1]  439 	jrpl 1$
      00872A 7B 03            [ 1]  440 	ld a,(BASE,sp)
      00872C C7 00 0B         [ 1]  441 	ld base,a
      00872F 7B 04            [ 1]  442 	ld a,(TABW,sp)
      008731 C7 00 23         [ 1]  443 	ld tab_width,a 
      0006B4                        444 	_drop VSIZE
      008734 5B 04            [ 2]    1     addw sp,#VSIZE 
      008736 84               [ 1]  445 	pop a 
      008737 81               [ 4]  446 	ret 
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
      008738                         45 unlock_eeprom:
      008738 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      00873D 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      008741 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008745 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008749 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00874D 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008752 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      008753                         62 unlock_flash:
      008753 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008758 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      00875C 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008760 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008764 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008768 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00876D 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      00876E                         76 row_erase:
      00876E 88               [ 1]   77 	push a 
      00876F 90 89            [ 2]   78 	pushw y 
      008771 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008775 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008779 4F               [ 1]   81 	clr a 
      00877A 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00877C 91 A7 00 18      [ 1]   83 	ldf ([farptr],y),a
      008780 90 5C            [ 1]   84     incw y
      008782 91 A7 00 18      [ 1]   85 	ldf ([farptr],y),a
      008786 90 5C            [ 1]   86     incw y
      008788 91 A7 00 18      [ 1]   87 	ldf ([farptr],y),a
      00878C 90 5C            [ 1]   88     incw y
      00878E 91 A7 00 18      [ 1]   89 	ldf ([farptr],y),a
      008792 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008797 90 85            [ 2]   91 	popw y 
      008799 84               [ 1]   92 	pop a 
      00879A 81               [ 4]   93 	ret
      00879B                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      00879B                         97 move_erase_to_ram:
      00879B 89               [ 2]   98 	pushw x 
      00879C 90 89            [ 2]   99 	pushw y 
      00879E AE 87 9B         [ 2]  100 	ldw x,#row_erase_end 
      0087A1 1D 87 6E         [ 2]  101 	subw x,#row_erase
      0087A4 CF 00 0E         [ 2]  102 	ldw acc16,x 
      0087A7 AE 16 68         [ 2]  103 	ldw x,#tib 
      0087AA 90 AE 87 6E      [ 2]  104 	ldw y,#row_erase 
      0087AE CD 94 35         [ 4]  105 	call move
      0087B1 90 85            [ 2]  106 	popw y
      0087B3 85               [ 2]  107 	popw x
      0087B4 81               [ 4]  108 	ret 
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
      0087B5                        123 program_row:
      0087B5 88               [ 1]  124 	push a 
      0087B6 90 89            [ 2]  125 	pushw y 
      0087B8 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0087BA 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0087BE 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0087C2 90 5F            [ 1]  130 	clrw y 
      0087C4 F6               [ 1]  131 1$:	ld a,(x)
      0087C5 91 A7 00 18      [ 1]  132 	ldf ([farptr],y),a
      0087C9 5C               [ 1]  133 	incw x 
      0087CA 90 5C            [ 1]  134 	incw y 
      0087CC 0A 01            [ 1]  135 	dec (BCNT,sp)
      0087CE 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0087D0 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000755                        139 	_drop 1 
      0087D5 5B 01            [ 2]    1     addw sp,#1 
      0087D7 90 85            [ 2]  140 	popw y 
      0087D9 84               [ 1]  141 	pop a 
      0087DA 81               [ 4]  142 	ret 
      0087DB                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      0087DB                        149 move_prg_to_ram:
      0087DB 89               [ 2]  150 	pushw x 
      0087DC 90 89            [ 2]  151 	pushw y 
      0087DE AE 87 DB         [ 2]  152 	ldw x,#program_row_end 
      0087E1 1D 87 B5         [ 2]  153 	subw x,#program_row 
      0087E4 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0087E7 AE 16 68         [ 2]  155 	ldw x,#tib ; destination address 
      0087EA 90 AE 87 B5      [ 2]  156 	ldw y,#program_row ; source address 
      0087EE CD 94 35         [ 4]  157 	call move
      0087F1 90 85            [ 2]  158 	popw y 
      0087F3 85               [ 2]  159 	popw x  
      0087F4 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0087F5                        169 write_buffer:
      0087F5 89               [ 2]  170 	pushw x 
      0087F6 72 5D 00 18      [ 1]  171 	tnz farptr 
      0087FA 26 0D            [ 1]  172 	jrne to_flash 
      0087FC CE 00 19         [ 2]  173 	ldw x,farptr+1 
      0087FF A3 B6 00         [ 2]  174 	cpw x,#app_space  
      008802 24 05            [ 1]  175 	jruge to_flash 
      008804                        176 to_eeprom:
      008804 CD 87 38         [ 4]  177 	call unlock_eeprom
      008807 20 03            [ 2]  178 	jra do_programming
      008809                        179 to_flash:
      008809 CD 87 53         [ 4]  180 	call unlock_flash
      00880C                        181 do_programming:
      00880C 85               [ 2]  182 	popw x 
      00880D CD 16 68         [ 4]  183 	call tib
      008810 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008814 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008818 81               [ 4]  186 	ret 
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
      008819                        197 block_erase:
      008819 89               [ 2]  198 	pushw x 
      00881A CE 00 19         [ 2]  199 	ldw x,farptr+1
      00881D A3 B6 00         [ 2]  200 	cpw x,#app_space 
      008820 24 0C            [ 1]  201 	jruge erase_flash 
                                    202 ; erase eeprom block
      008822 CD 87 38         [ 4]  203 	call unlock_eeprom 
      008825 CD 16 68         [ 4]  204 	call tib 
      008828 72 17 50 5F      [ 1]  205 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00882C 20 0A            [ 2]  206 	jra erase_exit  
                                    207 ; erase flash block:
      00882E                        208 erase_flash:
      00882E CD 87 53         [ 4]  209 	call unlock_flash 
      008831 CD 16 68         [ 4]  210 	call tib 
      008834 72 13 50 5F      [ 1]  211     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008838                        212 erase_exit: 
      008838 85               [ 2]  213 	popw x 
      008839 81               [ 4]  214 	ret 
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
      00883A                        230 write_byte:
      00883A 90 89            [ 2]  231 	pushw y
      0007BC                        232 	_vars VSIZE
      00883C 52 02            [ 2]    1     sub sp,#VSIZE 
      00883E 6B 01            [ 1]  233 	ld (BTW,sp),a ; byte to write 
      008840 0F 02            [ 1]  234 	clr (OPT,sp)  ; OPTION flag
                                    235 ; put addr[15:0] in Y, for bounds check.
      008842 90 CE 00 19      [ 2]  236 	ldw y,farptr+1   ; Y=addr15:0
                                    237 ; check addr[23:16], if <> 0 then it is extened flash memory
      008846 72 5D 00 18      [ 1]  238 	tnz farptr 
      00884A 26 14            [ 1]  239 	jrne write_flash
      00884C 90 A3 B6 00      [ 2]  240     cpw y,#app_space 	 
      008850 24 0E            [ 1]  241     jruge write_flash
      008852 90 A3 40 00      [ 2]  242 	cpw y,#EEPROM_BASE  
      008856 25 57            [ 1]  243     jrult write_exit
      008858 90 A3 48 7F      [ 2]  244 	cpw y,#OPTION_END 
      00885C 22 51            [ 1]  245 	jrugt write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00885E 20 16            [ 2]  246 	jra write_eeprom 
                                    247 ; write program memory
      008860                        248 write_flash:
      008860 CD 87 53         [ 4]  249 	call unlock_flash 
      008863 9B               [ 1]  250 1$:	sim 
      008864 7B 01            [ 1]  251 	ld a,(BTW,sp)
      008866 92 A7 00 18      [ 4]  252 	ldf ([farptr],x),a ; farptr[x]=A
      00886A 72 05 50 5F FB   [ 2]  253 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00886F 9A               [ 1]  254     rim 
      008870 72 13 50 5F      [ 1]  255     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008874 20 39            [ 2]  256     jra write_exit
                                    257 ; write eeprom and option
      008876                        258 write_eeprom:
      008876 CD 87 38         [ 4]  259 	call unlock_eeprom
                                    260 	; check for data eeprom or option eeprom
      008879 90 A3 48 00      [ 2]  261 	cpw y,#OPTION_BASE
      00887D 2B 08            [ 1]  262 	jrmi 1$
      00887F 90 A3 48 80      [ 2]  263 	cpw y,#OPTION_END+1
      008883 2A 02            [ 1]  264 	jrpl 1$
      008885 03 02            [ 1]  265 	cpl (OPT,sp)
      008887                        266 1$: 
      008887 0D 02            [ 1]  267     tnz (OPT,sp)
      008889 27 08            [ 1]  268     jreq 2$
                                    269 	; pour modifier une option il faut modifier ces 2 bits
      00888B 72 1E 50 5B      [ 1]  270     bset FLASH_CR2,#FLASH_CR2_OPT
      00888F 72 1F 50 5C      [ 1]  271     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008893                        272 2$: 
      008893 7B 01            [ 1]  273     ld a,(BTW,sp)
      008895 92 A7 00 18      [ 4]  274     ldf ([farptr],x),a
      008899 0D 02            [ 1]  275     tnz (OPT,sp)
      00889B 27 08            [ 1]  276     jreq 3$
      00889D 5C               [ 1]  277     incw x
      00889E 7B 01            [ 1]  278     ld a,(BTW,sp)
      0088A0 43               [ 1]  279     cpl a
      0088A1 92 A7 00 18      [ 4]  280     ldf ([farptr],x),a
      0088A5 72 05 50 5F FB   [ 2]  281 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0088AA 72 0D 50 5F FB   [ 2]  282 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0088AF                        283 write_exit:
      00082F                        284 	_drop VSIZE 
      0088AF 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088B1 90 85            [ 2]  285 	popw y
      0088B3 81               [ 4]  286     ret
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
      0088B4                        302 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000834                        303 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    304 	; local var 
                           000001   305 	XSAVE=1 
                           000002   306 	VSIZE=2 
      000834                        307 write_block::
      0088B4 88               [ 1]  308 	push a 
      000835                        309 	_vars VSIZE
      0088B5 52 02            [ 2]    1     sub sp,#VSIZE 
      0088B7 1F 01            [ 2]  310 	ldw (XSAVE,sp),x 
      0088B9 1E 06            [ 2]  311 	ldw x,(BSIZE,sp) 
      0088BB 27 13            [ 1]  312 	jreq 9$
      0088BD 1E 01            [ 2]  313 1$:	ldw x,(XSAVE,sp)
      0088BF 90 F6            [ 1]  314 	ld a,(y)
      0088C1 CD 88 3A         [ 4]  315 	call write_byte 
      0088C4 5C               [ 1]  316 	incw x 
      0088C5 90 5C            [ 1]  317 	incw y 
      0088C7 1F 01            [ 2]  318 	ldw (XSAVE,sp),x
      0088C9 1E 06            [ 2]  319 	ldw x,(BSIZE,sp)
      0088CB 5A               [ 2]  320 	decw x
      0088CC 1F 06            [ 2]  321 	ldw (BSIZE,sp),x 
      0088CE 26 ED            [ 1]  322 	jrne 1$
      0088D0                        323 9$:
      0088D0 1E 01            [ 2]  324 	ldw x,(XSAVE,sp)
      0088D2 CD 89 0A         [ 4]  325 	call incr_farptr
      000855                        326 	_drop VSIZE
      0088D5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0088D7 84               [ 1]  327 	pop a 
      0088D8 81               [ 4]  328 	ret 
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
      0088D9                        345 write_nbytes:
      0088D9 90 89            [ 2]  346 	pushw y
      0088DB 88               [ 1]  347 	push a 
      0088DC 90 93            [ 1]  348 	ldw y,x
      0088DE 5F               [ 1]  349 	clrw x 
      0088DF                        350 1$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0088DF 90 F6            [ 1]  351 	ld a,(y)
      0088E1 90 5C            [ 1]  352 	incw y
      0088E3 CD 88 3A         [ 4]  353 	call write_byte 
      0088E6 5C               [ 1]  354 	incw x 
      0088E7 0A 01            [ 1]  355 	dec (1,sp)  
      0088E9 26 F4            [ 1]  356 	jrne 1$ 
      0088EB 84               [ 1]  357 9$: pop a 
      0088EC 90 85            [ 2]  358 	popw y 
      0088EE 81               [ 4]  359 	ret 
                                    360 
                                    361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    362 ;;;  flash memory operations
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 
                                    365 ;--------------------------
                                    366 ; align farptr to BLOCK_SIZE 
                                    367 ;---------------------------
      0088EF                        368 row_align:
      0088EF A6 7F            [ 1]  369 	ld a,#0x7f 
      0088F1 C4 00 1A         [ 1]  370 	and a,farptr+2 
      0088F4 27 13            [ 1]  371 	jreq 1$ 
      0088F6 CE 00 19         [ 2]  372 	ldw x,farptr+1 
      0088F9 1C 00 80         [ 2]  373 	addw x,#BLOCK_SIZE 
      0088FC 24 04            [ 1]  374 	jrnc 0$
      0088FE 72 5C 00 18      [ 1]  375 	inc farptr 
      008902 9F               [ 1]  376 0$: ld a,xl 
      008903 A4 80            [ 1]  377 	and a,#0x80
      008905 97               [ 1]  378 	ld xl,a
      008906 CF 00 19         [ 2]  379 	ldw farptr+1,x  	
      008909 81               [ 4]  380 1$:	ret
                                    381 
                                    382 ;--------------------
                                    383 ; input:
                                    384 ;   X     increment 
                                    385 ; output:
                                    386 ;   farptr  incremented 
                                    387 ;---------------------
      00890A                        388 incr_farptr:
      00890A 72 BB 00 19      [ 2]  389 	addw x,farptr+1 
      00890E 24 04            [ 1]  390 	jrnc 1$
      008910 72 5C 00 18      [ 1]  391 	inc farptr 
      008914 CF 00 19         [ 2]  392 1$:	ldw farptr+1,x  
      008917 81               [ 4]  393 	ret 
                                    394 
                                    395 ;-----------------------------------
                                    396 ; scan block for non zero byte 
                                    397 ; block are 128 bytes 
                                    398 ; input:
                                    399 ;    farptr     address block  
                                    400 ; output:
                                    401 ;     A     0 cleared, other not cleared  
                                    402 ;-----------------------------------
      008918                        403 scan_block:
      008918 5F               [ 1]  404 	clrw x 
      008919 92 AF 00 18      [ 5]  405 1$: ldf a,([farptr],x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00891D 26 06            [ 1]  406 	jrne 2$
      00891F 5C               [ 1]  407 	incw x 
      008920 A3 00 80         [ 2]  408 	cpw x,#BLOCK_SIZE 
      008923 25 F4            [ 1]  409 	jrult 1$ 
      008925 81               [ 4]  410 2$:	ret 
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
      008926                         66 Uart1RxHandler: ; console receive char 
      008926 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      00892B C6 52 31         [ 1]   68 	ld a,UART1_DR 
      00892E A1 03            [ 1]   69 	cp a,#CTRL_C 
      008930 26 06            [ 1]   70 	jrne 2$
      008932 CD 89 98         [ 4]   71 	call putc 
      008935 CC 80 C6         [ 2]   72 	jp user_interrupted
      008938                         73 2$:
      008938 A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      00893A 26 03            [ 1]   75 	jrne 3$
      00893C CC 81 3D         [ 2]   76 	jp cold_start 	
      00893F 88               [ 1]   77 3$:	push a 
      008940 A6 26            [ 1]   78 	ld a,#rx1_queue 
      008942 CB 00 2F         [ 1]   79 	add a,rx1_tail 
      008945 5F               [ 1]   80 	clrw x 
      008946 97               [ 1]   81 	ld xl,a 
      008947 84               [ 1]   82 	pop a 
      008948 F7               [ 1]   83 	ld (x),a 
      008949 C6 00 2F         [ 1]   84 	ld a,rx1_tail 
      00894C 4C               [ 1]   85 	inc a 
      00894D A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      00894F C7 00 2F         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      008952 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008953                         97 uart1_init:
      008953 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008957 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      00895B 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      00895F 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008963                        103 uart1_set_baud: 
      008963 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008964 A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      008966 C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      008969 27 0A            [ 1]  109 	jreq 2$ 
      00896B                        110 1$: ; 8 Mhz 	
      00896B 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      00896F 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008973 20 08            [ 2]  113 	jra 3$
      008975                        114 2$: ; 16 Mhz 	
      008975 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008979 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      00897D                        117 3$:
      00897D 72 5F 52 31      [ 1]  118     clr UART1_DR
      008981 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008985 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008989 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00898E 72 5F 00 2E      [ 1]  122     clr rx1_head 
      008992 72 5F 00 2F      [ 1]  123 	clr rx1_tail
      008996 84               [ 1]  124 	pop a  
      008997 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      008998                        133 putc:: ; console output always on UART1
      008998                        134 uart1_putc:: 
      008998 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      00899D C7 52 31         [ 1]  136 	ld UART1_DR,a 
      0089A0 81               [ 4]  137 	ret 
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
      0089A1                        148 qgetc::
      0089A1                        149 uart1_qgetc::
      0089A1 C6 00 2E         [ 1]  150 	ld a,rx1_head 
      0089A4 C0 00 2F         [ 1]  151 	sub a,rx1_tail 
      0089A7 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      0089A8                        161 getc:: ;console input
      0089A8                        162 uart1_getc::
      0089A8 CD 89 A1         [ 4]  163 	call uart1_qgetc
      0089AB 27 FB            [ 1]  164 	jreq uart1_getc 
      0089AD 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      0089AE A6 26            [ 1]  167 	ld a,#rx1_queue
      0089B0 CB 00 2E         [ 1]  168 	add a,rx1_head 
      0089B3 5F               [ 1]  169 	clrw x  
      0089B4 97               [ 1]  170 	ld xl,a 
      0089B5 F6               [ 1]  171 	ld a,(x)
      0089B6 88               [ 1]  172 	push a
      0089B7 C6 00 2E         [ 1]  173 	ld a,rx1_head 
      0089BA 4C               [ 1]  174 	inc a 
      0089BB A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0089BD C7 00 2E         [ 1]  176 	ld rx1_head,a 
      0089C0 84               [ 1]  177 	pop a  
      0089C1 85               [ 2]  178 	popw x
      0089C2 81               [ 4]  179 	ret 
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
      0089C3 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      0089CF                        207 get_escape:
      0089CF CD 89 A8         [ 4]  208     call getc 
      0089D2 A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0089D4 27 02            [ 1]  210     jreq 1$
      0089D6 4F               [ 1]  211     clr a
      0089D7 81               [ 4]  212     ret
      0089D8 CD 89 A8         [ 4]  213 1$: call getc 
      0089DB AE 89 C3         [ 2]  214     ldw x,#convert_table
      0089DE                        215 2$:
      0089DE F1               [ 1]  216     cp a,(x)
      0089DF 27 08            [ 1]  217     jreq 4$
      0089E1 1C 00 02         [ 2]  218     addw x,#2
      0089E4 7D               [ 1]  219     tnz (x)
      0089E5 26 F7            [ 1]  220     jrne 2$
      0089E7 4F               [ 1]  221     clr a
      0089E8 81               [ 4]  222     ret 
      0089E9 5C               [ 1]  223 4$: incw x 
      0089EA F6               [ 1]  224     ld a,(x)
      0089EB A1 84            [ 1]  225     cp a,#SUP
      0089ED 26 05            [ 1]  226     jrne 5$
      0089EF 88               [ 1]  227     push a 
      0089F0 CD 89 A8         [ 4]  228     call getc
      0089F3 84               [ 1]  229     pop a 
      0089F4                        230 5$:
      0089F4 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089F5                        241 puts::
      0089F5 F6               [ 1]  242     ld a,(x)
      0089F6 27 06            [ 1]  243 	jreq 1$
      0089F8 CD 89 98         [ 4]  244 	call putc 
      0089FB 5C               [ 1]  245 	incw x 
      0089FC 20 F7            [ 2]  246 	jra puts 
      0089FE 81               [ 4]  247 1$:	ret 
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
      0089FF                        258 bksp:
      0089FF A6 08            [ 1]  259 	ld a,#BS 
      008A01 CD 89 98         [ 4]  260 	call putc 
      008A04 A6 20            [ 1]  261 	ld a,#SPACE 
      008A06 CD 89 98         [ 4]  262 	call putc 
      008A09 A6 08            [ 1]  263 	ld a,#BS 
      008A0B CD 89 98         [ 4]  264 	call putc 
      008A0E 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      008A0F                        274 delete_nchar:
      008A0F 88               [ 1]  275 	push a 
      008A10 0D 01            [ 1]  276 0$:	tnz (1,sp)
      008A12 27 07            [ 1]  277 	jreq 1$
      008A14 CD 89 FF         [ 4]  278 	call bksp 
      008A17 0A 01            [ 1]  279 	dec (1,sp)
      008A19 20 F5            [ 2]  280 	jra 0$
      008A1B 84               [ 1]  281 1$:	pop a 
      008A1C 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      008A1D                        290 send_escape:
      008A1D A6 1B            [ 1]  291 	ld a,#ESC 
      008A1F CD 89 98         [ 4]  292 	call putc 
      008A22 A6 5B            [ 1]  293 	ld a,#'[
      008A24 CD 89 98         [ 4]  294 	call putc 
      008A27 81               [ 4]  295 	ret 
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
      008A28                        311 send_parameter:
      008A28 89               [ 2]  312 	pushw x 
      008A29 5F               [ 1]  313 	clrw x 
      008A2A 97               [ 1]  314 	ld xl,a 
      008A2B A6 0A            [ 1]  315 	ld a,#10 
      008A2D 62               [ 2]  316 	div x,a 
      008A2E 95               [ 1]  317 	ld xh,a 
      008A2F 9F               [ 1]  318 	ld a,xl
      008A30 4D               [ 1]  319     tnz a 
      008A31 27 0B            [ 1]  320     jreq 2$
      008A33 A1 09            [ 1]  321 	cp a,#9 
      008A35 23 02            [ 2]  322 	jrule 1$
      008A37 A6 39            [ 1]  323 	ld a,#'9
      008A39                        324 1$:
      008A39 AB 30            [ 1]  325 	add a,#'0 
      008A3B CD 89 98         [ 4]  326 	call putc
      008A3E 9E               [ 1]  327 2$:	ld a,xh 
      008A3F AB 30            [ 1]  328 	add a,#'0
      008A41 CD 89 98         [ 4]  329 	call putc 
      008A44 85               [ 2]  330 	popw x 
      008A45 81               [ 4]  331 	ret 
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
      008A46                        344 move_left:
      008A46 88               [ 1]  345 	push a 
      008A47 CD 8A 1D         [ 4]  346 	call send_escape
      008A4A 84               [ 1]  347     pop a
      008A4B CD 8A 28         [ 4]  348 	call send_parameter 
      008A4E A6 44            [ 1]  349 	ld a,#'D 
      008A50 CD 89 98         [ 4]  350 	call putc 
      008A53 81               [ 4]  351 	ret	
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



      008A54                        362 move_right:
      008A54 88               [ 1]  363 	push a 
      008A55 CD 8A 1D         [ 4]  364 	call send_escape
      008A58 84               [ 1]  365     pop a
      008A59 CD 8A 28         [ 4]  366 	call send_parameter 
      008A5C A6 43            [ 1]  367 	ld a,#'C 
      008A5E CD 89 98         [ 4]  368 	call putc 
      008A61 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A62                        379 spaces::
      008A62 A6 20            [ 1]  380 	ld a,#SPACE 
      008A64 5D               [ 2]  381 1$:	tnzw x
      008A65 27 06            [ 1]  382 	jreq 9$
      008A67 CD 89 98         [ 4]  383 	call putc 
      008A6A 5A               [ 2]  384 	decw x
      008A6B 20 F7            [ 2]  385 	jra 1$
      008A6D                        386 9$: 
      008A6D 81               [ 4]  387 	ret 
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
      008A6E                        404 insert_char: 
      0009EE                        405 	_vars VSIZE 
      008A6E 52 02            [ 2]    1     sub sp,#VSIZE 
      008A70 6B 02            [ 1]  406     ld (KCHAR,sp),a 
      008A72 9E               [ 1]  407     ld a,xh 
      008A73 6B 01            [ 1]  408 	ld (IPOS,sp),a
      008A75 9F               [ 1]  409     ld a,xl 
      008A76 6B 03            [ 1]  410     ld (LLEN,sp),a  
      008A78 93               [ 1]  411     ldw x,y
      008A79 5C               [ 1]  412     incw x 
      008A7A 7B 03            [ 1]  413     ld a,(LLEN,sp)
      008A7C 10 01            [ 1]  414     sub a,(IPOS,sp)
      008A7E 4C               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008A7F C7 00 0F         [ 1]  416     ld acc8,a 
      008A82 72 5F 00 0E      [ 1]  417     clr acc16
      008A86 CD 94 35         [ 4]  418     call move
      008A89 90 AE 16 68      [ 2]  419     ldw y,#tib 
      008A8D 7B 01            [ 1]  420     ld a,(IPOS,sp)
      008A8F C7 00 0F         [ 1]  421     ld acc8,a 
      008A92 72 B9 00 0E      [ 2]  422     addw y,acc16 
      008A96 7B 02            [ 1]  423     ld a,(KCHAR,sp)
      008A98 90 F7            [ 1]  424     ld (y),a
      008A9A 90 5C            [ 1]  425     incw y  
      008A9C 7B 01            [ 1]  426     ld a,(IPOS,sp)
      008A9E CD 8A 46         [ 4]  427     call move_left
      008AA1 AE 16 68         [ 2]  428     ldw x,#tib 
      008AA4 CD 89 F5         [ 4]  429     call puts 
      008AA7 7B 03            [ 1]  430     ld a,(LLEN,sp)
      008AA9 10 01            [ 1]  431     sub a,(IPOS,sp) 
      008AAB CD 8A 46         [ 4]  432     call move_left 
      000A2E                        433 	_drop VSIZE 
      008AAE 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AB0 81               [ 4]  434 	ret 
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
      008AB1                        447 delete_under:
      000A31                        448 	_vars VSIZE 
      008AB1 52 02            [ 2]    1     sub sp,#VSIZE 
      008AB3 6B 02            [ 1]  449     ld (LLEN,sp),a 
      008AB5 9F               [ 1]  450     ld a,xl 
      008AB6 6B 01            [ 1]  451     ld (CPOS,sp),a 
      008AB8 93               [ 1]  452     ldw x,y ; move destination
      008AB9 90 5C            [ 1]  453     incw y  ; move source 
      008ABB 7B 02            [ 1]  454     ld a,(LLEN,sp)
      008ABD 10 01            [ 1]  455     sub a,(CPOS,sp)
      008ABF 4C               [ 1]  456     inc a ; move including zero at end.
      008AC0 C7 00 0F         [ 1]  457     ld acc8,a 
      008AC3 72 5F 00 0E      [ 1]  458     clr acc16 
      008AC7 CD 94 35         [ 4]  459 	call move 
      008ACA 90 AE 16 68      [ 2]  460     ldw y,#tib 
      008ACE 7B 01            [ 1]  461     ld a,(CPOS,sp)
      008AD0 C7 00 0F         [ 1]  462     ld acc8,a 
      008AD3 72 B9 00 0E      [ 2]  463     addw y,acc16 
      008AD7 93               [ 1]  464     ldw x,y 
      008AD8 CD 89 F5         [ 4]  465     call puts 
      008ADB A6 20            [ 1]  466     ld a,#SPACE  
      008ADD CD 89 98         [ 4]  467     call putc
      008AE0 7B 02            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008AE2 10 01            [ 1]  469     sub a,(CPOS,sp)
      008AE4 CD 8A 46         [ 4]  470     call move_left 
      008AE7 0A 02            [ 1]  471     dec (LLEN,sp)
      000A69                        472 	_drop VSIZE 
      008AE9 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AEB 81               [ 4]  473 	ret 
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
      008AEC                        485 delete_line:
      008AEC CD 8A 1D         [ 4]  486     call send_escape
      008AEF A6 32            [ 1]  487 	ld a,#'2
      008AF1 CD 89 98         [ 4]  488 	call putc 
      008AF4 A6 4B            [ 1]  489 	ld a,#'K 
      008AF6 CD 89 98         [ 4]  490 	call putc 
      008AF9 81               [ 4]  491 	ret 
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



      008AFA                        523 readln::
      000A7A                        524 	_vars VSIZE 
      008AFA 52 04            [ 2]    1     sub sp,#VSIZE 
      008AFC 5F               [ 1]  525 	clrw x 
      008AFD 1F 02            [ 2]  526 	ldw (LL,sp),x 
      008AFF 1F 03            [ 2]  527 	ldw (CPOS,sp),x 
      008B01 03 04            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      008B03 90 AE 16 68      [ 2]  529  	ldw y,#tib ; input buffer
      008B07                        530 readln_loop:
      008B07 CD 89 A8         [ 4]  531 	call getc
      008B0A 6B 01            [ 1]  532 	ld (RXCHAR,sp),a
      008B0C A1 1B            [ 1]  533     cp a,#ESC 
      008B0E 26 05            [ 1]  534     jrne 0$
      008B10 CD 89 CF         [ 4]  535     call get_escape 
      008B13 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      008B15 A1 0D            [ 1]  537 0$:	cp a,#CR
      008B17 26 03            [ 1]  538 	jrne 1$
      008B19 CC 8C A3         [ 2]  539 	jp readln_quit
      008B1C A1 0A            [ 1]  540 1$:	cp a,#LF 
      008B1E 26 03            [ 1]  541 	jrne 2$ 
      008B20 CC 8C A3         [ 2]  542 	jp readln_quit
      008B23                        543 2$:
      008B23 A1 08            [ 1]  544 	cp a,#BS
      008B25 26 12            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      008B27 0D 03            [ 1]  547     tnz (CPOS,sp)
      008B29 27 DC            [ 1]  548     jreq readln_loop 
      008B2B A6 01            [ 1]  549     ld a,#1 
      008B2D CD 8A 46         [ 4]  550     call move_left
      008B30 0A 03            [ 1]  551     dec (CPOS,sp)
      008B32 90 5A            [ 2]  552     decw y 
      008B34 7B 03            [ 1]  553     ld a,(CPOS,sp) 
      008B36 CC 8C 4F         [ 2]  554     jp 12$
      008B39                        555 3$:
      008B39 A1 04            [ 1]  556 	cp a,#CTRL_D
      008B3B 26 1A            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      008B3D CD 8A EC         [ 4]  559 	call delete_line 
      008B40 7B 03            [ 1]  560     ld a,(CPOS,sp)
      008B42 4C               [ 1]  561     inc a 
      008B43 CD 8A 46         [ 4]  562     call move_left 
      008B46 A6 3E            [ 1]  563 	ld a,#'> 
      008B48 CD 89 98         [ 4]  564 	call putc 
      008B4B 90 AE 16 68      [ 2]  565 	ldw y,#tib
      008B4F 90 7F            [ 1]  566 	clr (y)
      008B51 0F 02            [ 1]  567 	clr (LL,sp)
      008B53 0F 03            [ 1]  568 	clr (CPOS,sp)
      008B55 20 B0            [ 2]  569 	jra readln_loop
      008B57                        570 4$:
      008B57 A1 12            [ 1]  571 	cp a,#CTRL_R 
      008B59 26 21            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      008B5B 0D 02            [ 1]  574 	tnz (LL,sp)
      008B5D 26 A8            [ 1]  575 	jrne readln_loop
      008B5F AE 16 68         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008B62 CD 94 09         [ 4]  577 	call strlen 
      008B65 90 AE 16 68      [ 2]  578 	ldw y,#tib 
      008B69 27 9C            [ 1]  579 	jreq readln_loop
      008B6B 6B 02            [ 1]  580 	ld (LL,sp),a 
      008B6D 6B 03            [ 1]  581     ld (CPOS,sp),a
      008B6F AE 16 68         [ 2]  582 	ldw x,#tib 
      008B72 CD 89 F5         [ 4]  583 	call puts
      008B75 0F 01            [ 1]  584 	clr (LL_HB,sp)
      008B77 72 F9 01         [ 2]  585 	addw y,(LL_HB,sp)
      008B7A 20 8B            [ 2]  586 	jra readln_loop 
      008B7C                        587 5$:
      008B7C A1 05            [ 1]  588 	cp a,#CTRL_E 
      008B7E 26 49            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      008B80 AE 16 68         [ 2]  591 	ldw x,#tib 
      008B83 CD 98 AD         [ 4]  592 	call atoi24
      008B86 CE 00 0E         [ 2]  593 	ldw x,acc16
      008B89 CD 8C DD         [ 4]  594 	call search_lineno
      008B8C 5D               [ 2]  595 	tnzw x 
      008B8D 26 0B            [ 1]  596 	jrne 51$
      008B8F 0F 02            [ 1]  597 	clr (LL,sp)
      008B91 90 AE 16 68      [ 2]  598 	ldw y,#tib
      008B95 90 7F            [ 1]  599     clr (y) 	
      008B97 CC 8C A3         [ 2]  600 	jp readln_quit  
      008B9A                        601 51$:
      008B9A CF 00 05         [ 2]  602 	ldw basicptr,x
      008B9D E6 02            [ 1]  603 	ld a,(2,x)
      008B9F C7 00 04         [ 1]  604 	ld count,a 
      008BA2 90 AE 16 68      [ 2]  605 	ldw y,#tib 
      008BA6 CD 92 40         [ 4]  606 	call decompile 
      008BA9 0F 01            [ 1]  607 	clr (LL_HB,sp)
      008BAB A6 0D            [ 1]  608 	ld a,#CR 
      008BAD CD 89 98         [ 4]  609 	call putc 
      008BB0 A6 3E            [ 1]  610 	ld a,#'>
      008BB2 CD 89 98         [ 4]  611 	call putc
      008BB5 AE 16 68         [ 2]  612     ldw x,#tib  
      008BB8 CD 94 09         [ 4]  613 	call strlen 
      008BBB 6B 02            [ 1]  614 	ld (LL,sp),a 
      008BBD CD 89 F5         [ 4]  615 	call puts 
      008BC0 90 93            [ 1]  616 	ldw y,x
      008BC2 7B 02            [ 1]  617     ld a,(LL,sp)
      008BC4 6B 03            [ 1]  618     ld (CPOS,sp),a  
      008BC6 CC 8B 07         [ 2]  619 	jp readln_loop
      008BC9                        620 6$:
      008BC9 A1 81            [ 1]  621 	cp a,#ARROW_RIGHT
      008BCB 26 15            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      008BCD 7B 03            [ 1]  624 	ld a,(CPOS,sp)
      008BCF 11 02            [ 1]  625     cp a,(LL,sp)
      008BD1 2B 03            [ 1]  626     jrmi 61$
      008BD3 CC 8B 07         [ 2]  627     jp readln_loop 
      008BD6                        628 61$:
      008BD6 A6 01            [ 1]  629     ld a,#1 
      008BD8 CD 8A 54         [ 4]  630 	call move_right 
      008BDB 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008BDD 90 5C            [ 1]  632     incw y 
      008BDF CC 8B 07         [ 2]  633     jp readln_loop 
      008BE2 A1 80            [ 1]  634 7$: cp a,#ARROW_LEFT  
      008BE4 26 13            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      008BE6 0D 03            [ 1]  637 	tnz (CPOS,sp)
      008BE8 26 03            [ 1]  638 	jrne 71$
      008BEA CC 8B 07         [ 2]  639 	jp readln_loop
      008BED                        640 71$:
      008BED A6 01            [ 1]  641     ld a,#1 
      008BEF CD 8A 46         [ 4]  642 	call move_left 
      008BF2 0A 03            [ 1]  643 	dec (CPOS,sp)
      008BF4 90 5A            [ 2]  644     decw y 
      008BF6 CC 8B 07         [ 2]  645 	jp readln_loop 
      008BF9 A1 82            [ 1]  646 8$: cp a,#HOME  
      008BFB 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      008BFD 7B 03            [ 1]  649     ld a,(CPOS,sp)
      008BFF CD 8A 46         [ 4]  650     call move_left 
      008C02 0F 03            [ 1]  651 	clr (CPOS,sp)
      008C04 90 AE 16 68      [ 2]  652     ldw y,#tib 
      008C08 CC 8B 07         [ 2]  653 	jp readln_loop  
      008C0B A1 83            [ 1]  654 9$: cp a,#KEY_END  
      008C0D 26 26            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      008C0F 7B 03            [ 1]  657 	ld a,(CPOS,sp)
      008C11 11 02            [ 1]  658 	cp a,(LL,sp)
      008C13 26 03            [ 1]  659 	jrne 91$
      008C15 CC 8B 07         [ 2]  660 	jp readln_loop 
      008C18                        661 91$:
      008C18 7B 02            [ 1]  662 	ld a,(LL,sp)
      008C1A 10 03            [ 1]  663 	sub a,(CPOS,sp)
      008C1C CD 8A 54         [ 4]  664 	call move_right 
      008C1F 7B 02            [ 1]  665 	ld a,(LL,sp)
      008C21 6B 03            [ 1]  666 	ld (CPOS,sp),a
      008C23 90 AE 16 68      [ 2]  667     ldw y,#tib
      008C27 72 5F 00 0E      [ 1]  668     clr acc16 
      008C2B C7 00 0F         [ 1]  669     ld acc8,a 
      008C2E 72 B9 00 0E      [ 2]  670     addw y,acc16  
      008C32 CC 8B 07         [ 2]  671 	jp readln_loop 
      008C35 A1 0F            [ 1]  672 10$: cp a,#CTRL_O
      008C37 26 0C            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008C39 03 04            [ 1]  675 	cpl (OVRWR,sp)
      008C3B 90 89            [ 2]  676 	pushw y 
      008C3D CD A4 E5         [ 4]  677 	call beep_1khz
      008C40 90 85            [ 2]  678 	popw y 
      008C42 CC 8B 07         [ 2]  679 	jp readln_loop 
      008C45 A1 84            [ 1]  680 11$: cp a,#SUP 
      008C47 26 11            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      008C49 7B 03            [ 1]  683     ld a,(CPOS,sp)
      008C4B 11 02            [ 1]  684     cp a,(LL,sp)
      008C4D 2A 08            [ 1]  685     jrpl 13$
      008C4F                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008C4F 97               [ 1]  687     ld xl,a    ; cursor position 
      008C50 7B 02            [ 1]  688     ld a,(LL,sp)  ; line length
      008C52 CD 8A B1         [ 4]  689     call delete_under
      008C55 0A 02            [ 1]  690     dec (LLEN,sp)
      008C57                        691 13$:
      008C57 CC 8B 07         [ 2]  692     jp readln_loop 
      008C5A                        693 final_test:
      008C5A A1 20            [ 1]  694 	cp a,#SPACE
      008C5C 2A 03            [ 1]  695 	jrpl accept_char
      008C5E CC 8B 07         [ 2]  696 	jp readln_loop
      008C61                        697 accept_char:
      008C61 A6 4F            [ 1]  698 	ld a,#TIB_SIZE-1
      008C63 11 02            [ 1]  699 	cp a, (LL,sp)
      008C65 2A 03            [ 1]  700 	jrpl 1$
      008C67 CC 8B 07         [ 2]  701 	jp readln_loop
      008C6A 0D 04            [ 1]  702 1$:	tnz (OVRWR,sp)
      008C6C 26 18            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008C6E 7B 03            [ 1]  705     ld a,(CPOS,sp)
      008C70 11 02            [ 1]  706     cp a,(LL,sp)
      008C72 27 12            [ 1]  707     jreq overwrite
      008C74 7B 02            [ 1]  708     ld a,(LL,sp)
      008C76 97               [ 1]  709     ld xl,a 
      008C77 7B 03            [ 1]  710     ld a,(CPOS,sp)
      008C79 95               [ 1]  711     ld xh,a
      008C7A 7B 01            [ 1]  712     ld a,(RXCHAR,sp)
      008C7C CD 8A 6E         [ 4]  713     call insert_char
      008C7F 0C 02            [ 1]  714     inc (LLEN,sp)
      008C81 0C 03            [ 1]  715     inc (CPOS,sp)
      008C83 CC 8B 07         [ 2]  716     jp readln_loop 
      008C86                        717 overwrite:
      008C86 7B 01            [ 1]  718 	ld a,(RXCHAR,sp)
      008C88 90 F7            [ 1]  719 	ld (y),a
      008C8A 90 5C            [ 1]  720     incw y
      008C8C CD 89 98         [ 4]  721     call putc 
      008C8F 7B 03            [ 1]  722 	ld a,(CPOS,sp)
      008C91 11 02            [ 1]  723 	cp a,(LL,sp)
      008C93 2B 09            [ 1]  724 	jrmi 1$
      008C95 90 7F            [ 1]  725 	clr (y)
      008C97 0C 02            [ 1]  726 	inc (LL,sp)
      008C99 0C 03            [ 1]  727     inc (CPOS,sp)
      008C9B CC 8B 07         [ 2]  728 	jp readln_loop 
      008C9E                        729 1$:	
      008C9E 0C 03            [ 1]  730 	inc (CPOS,sp)
      008CA0 CC 8B 07         [ 2]  731 	jp readln_loop 
      008CA3                        732 readln_quit:
      008CA3 90 AE 16 68      [ 2]  733 	ldw y,#tib
      008CA7 0F 01            [ 1]  734     clr (LL_HB,sp) 
      008CA9 72 F9 01         [ 2]  735     addw y,(LL_HB,sp)
      008CAC 90 7F            [ 1]  736     clr (y)
      008CAE 7B 02            [ 1]  737 	ld a,(LL,sp)
      008CB0 C7 00 04         [ 1]  738 	ld count,a 
      008CB3 A6 0D            [ 1]  739 	ld a,#CR
      008CB5 CD 89 98         [ 4]  740 	call putc
      000C38                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008CB8 5B 04            [ 2]    1     addw sp,#VSIZE 
      008CBA 81               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      008CBB                        750 print_hex::
      008CBB 88               [ 1]  751 	push a 
      008CBC 4E               [ 1]  752 	swap a 
      008CBD CD 8C D2         [ 4]  753 	call to_hex_char 
      008CC0 CD 89 98         [ 4]  754 	call putc 
      008CC3 7B 01            [ 1]  755     ld a,(1,sp) 
      008CC5 CD 8C D2         [ 4]  756 	call to_hex_char
      008CC8 CD 89 98         [ 4]  757 	call putc
      008CCB A6 20            [ 1]  758 	ld a,#SPACE 
      008CCD CD 89 98         [ 4]  759 	call putc 
      008CD0 84               [ 1]  760 	pop a 
      008CD1 81               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      008CD2                        770 to_hex_char::
      008CD2 A4 0F            [ 1]  771 	and a,#15 
      008CD4 A1 09            [ 1]  772 	cp a,#9 
      008CD6 23 02            [ 2]  773 	jrule 1$ 
      008CD8 AB 07            [ 1]  774 	add a,#7
      008CDA AB 30            [ 1]  775 1$: add a,#'0 
      008CDC 81               [ 4]  776 	ret 
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
      008CDD                         51 search_lineno::
      000C5D                         52 	_vars VSIZE
      008CDD 52 02            [ 2]    1     sub sp,#VSIZE 
      008CDF 0F 01            [ 1]   53 	clr (LL,sp)
      008CE1 90 CE 00 1B      [ 2]   54 	ldw y,txtbgn
      008CE5 4D               [ 1]   55 	tnz a 
      008CE6 27 04            [ 1]   56 	jreq search_ln_loop
      008CE8 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008CEC                         58 search_ln_loop:
      008CEC 90 C3 00 1D      [ 2]   59 	cpw y,txtend 
      008CF0 2A 10            [ 1]   60 	jrpl 8$
      008CF2 90 F3            [ 1]   61 	cpw x,(y)
      008CF4 27 0E            [ 1]   62 	jreq 9$
      008CF6 2B 0A            [ 1]   63 	jrmi 8$ 
      008CF8 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CFB 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CFD 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008D00 20 EA            [ 2]   67 	jra search_ln_loop 
      008D02                         68 8$: 
      008D02 5F               [ 1]   69 	clrw x 	
      008D03 51               [ 1]   70 	exgw x,y 
      000C84                         71 9$: _drop VSIZE
      008D04 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D06 51               [ 1]   72 	exgw x,y   
      008D07 81               [ 4]   73 	ret 
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
      008D08                         83 del_line: 
      000C88                         84 	_vars VSIZE 
      008D08 52 04            [ 2]    1     sub sp,#VSIZE 
      008D0A E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008D0C 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008D0E 0F 01            [ 1]   87 	clr (LLEN,sp)
      008D10 90 93            [ 1]   88 	ldw y,x  
      008D12 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008D15 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008D17 90 CE 00 1D      [ 2]   91 	ldw y,txtend 
      008D1B 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008D1E 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008D22 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008D24 CD 94 35         [ 4]   95 	call move
      008D27 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008D2B 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008D2E 90 CF 00 1D      [ 2]   98 	ldw txtend,y  
      000CB2                         99 	_drop VSIZE     
      008D32 5B 04            [ 2]    1     addw sp,#VSIZE 
      008D34 81               [ 4]  100 	ret 
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
      008D35                        115 create_gap:
      000CB5                        116 	_vars VSIZE
      008D35 52 06            [ 2]    1     sub sp,#VSIZE 
      008D37 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008D39 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008D3B 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008D3F 90 93            [ 1]  120 	ldw y,x ; SRC
      008D41 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008D45 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008D47 CE 00 1D         [ 2]  124 	ldw x,txtend 
      008D4A 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008D4D CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D50 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D52 CD 94 35         [ 4]  128 	call move
      008D55 CE 00 1D         [ 2]  129 	ldw x,txtend
      008D58 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D5B CF 00 1D         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      000CDE                        132 9$:	_drop VSIZE 
      008D5E 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D60 81               [ 4]  133 	ret 
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
      008D61                        150 insert_line:
      000CE1                        151 	_vars VSIZE 
      008D61 52 08            [ 2]    1     sub sp,#VSIZE 
      008D63 CE 00 1D         [ 2]  152 	ldw x,txtend  
      008D66 C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008D69 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D6B AE 00 02         [ 2]  156 	ldw x,#2 
      008D6E 72 D6 00 19      [ 4]  157 	ld a,([ptr16],x)
      008D72 A1 03            [ 1]  158 	cp a,#3
      008D74 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D76 5F               [ 1]  160 	clrw x 
      008D77 97               [ 1]  161 	ld xl,a
      008D78 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D7A CE 00 1B         [ 2]  163 	ldw x,txtbgn
      008D7D 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D7F CE 00 1D         [ 2]  165 	ldw x,txtend 
      008D82 20 38            [ 2]  166 	jra 4$
      008D84 72 CE 00 19      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D88 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D8A AE 00 02         [ 2]  170 	ldw x,#2 
      008D8D 72 D6 00 19      [ 4]  171 	ld a,([ptr16],x)
      008D91 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D92 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D94 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D96 4F               [ 1]  177 	clr a 
      008D97 CD 8C DD         [ 4]  178 	call search_lineno 
      008D9A 5D               [ 2]  179 	tnzw x 
      008D9B 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D9D 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D9F 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008DA1 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008DA3 CD 8D 08         [ 4]  188 	call del_line
      008DA6                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008DA6 A6 03            [ 1]  192 	ld a,#3
      008DA8 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008DAA 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008DAC 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008DAE C3 00 1D         [ 2]  198 	cpw x,txtend 
      008DB1 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008DB3 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008DB5 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008DB7 CD 8D 35         [ 4]  204 	call create_gap
      008DBA 20 06            [ 2]  205 	jra 5$
      008DBC                        206 4$: 
      008DBC 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008DBF CF 00 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008DC2 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008DC4 CF 00 0E         [ 2]  211 	ldw acc16,x 
      008DC7 90 AE 16 B8      [ 2]  212 	ldw y,#pad ;SRC 
      008DCB 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008DCD CD 94 35         [ 4]  214 	call move 
      008DD0                        215 insert_ln_exit:	
      000D50                        216 	_drop VSIZE
      008DD0 5B 08            [ 2]    1     addw sp,#VSIZE 
      008DD2 81               [ 4]  217 	ret
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
      008DD3                        233 parse_quote: 
      000D53                        234 	_vars VSIZE 
      008DD3 52 02            [ 2]    1     sub sp,#VSIZE 
      008DD5 4F               [ 1]  235 	clr a
      008DD6 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008DD8                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008DD8 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008DDB 27 24            [ 1]  239 	jreq 6$
      008DDD 72 5C 00 02      [ 1]  240 	inc in 
      008DE1 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008DE3 A6 5C            [ 1]  242 	ld a,#'\
      008DE5 11 01            [ 1]  243 	cp a, (PREV,sp)
      008DE7 26 0A            [ 1]  244 	jrne 3$
      008DE9 0F 01            [ 1]  245 	clr (PREV,sp)
      008DEB 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008DED AD 1C            [ 4]  247 	callr convert_escape
      008DEF F7               [ 1]  248 	ld (x),a 
      008DF0 5C               [ 1]  249 	incw x 
      008DF1 20 E5            [ 2]  250 	jra 2$
      008DF3                        251 3$:
      008DF3 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DF5 A1 5C            [ 1]  253 	cp a,#'\'
      008DF7 27 DD            [ 1]  254 	jreq 1$
      008DF9 A1 22            [ 1]  255 	cp a,#'"
      008DFB 27 04            [ 1]  256 	jreq 6$ 
      008DFD F7               [ 1]  257 	ld (x),a 
      008DFE 5C               [ 1]  258 	incw x 
      008DFF 20 D7            [ 2]  259 	jra 2$
      008E01                        260 6$:
      008E01 7F               [ 1]  261 	clr (x)
      008E02 5C               [ 1]  262 	incw x 
      008E03 90 93            [ 1]  263 	ldw y,x 
      008E05 5F               [ 1]  264 	clrw x 
      008E06 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D88                        266 	_drop VSIZE
      008E08 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E0A 81               [ 4]  267 	ret 
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
      008E0B                        278 convert_escape:
      008E0B 89               [ 2]  279 	pushw x 
      008E0C AE 8E 20         [ 2]  280 	ldw x,#escaped 
      008E0F F1               [ 1]  281 1$:	cp a,(x)
      008E10 27 06            [ 1]  282 	jreq 2$
      008E12 7D               [ 1]  283 	tnz (x)
      008E13 27 09            [ 1]  284 	jreq 3$
      008E15 5C               [ 1]  285 	incw x 
      008E16 20 F7            [ 2]  286 	jra 1$
      008E18 1D 8E 20         [ 2]  287 2$: subw x,#escaped 
      008E1B 9F               [ 1]  288 	ld a,xl 
      008E1C AB 07            [ 1]  289 	add a,#7
      008E1E 85               [ 2]  290 3$:	popw x 
      008E1F 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    292 
      008E20 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008E28                        310 parse_integer: ; { -- n }
      008E28 89               [ 2]  311 	pushw x 	
      008E29 4B 00            [ 1]  312 	push #0 ; TCHAR
      008E2B 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008E2D A1 24            [ 1]  314 	cp a,#'$
      008E2F 26 04            [ 1]  315 	jrne 2$ 
      000DB1                        316     _drop #1
      008E31 5B 01            [ 2]    1     addw sp,##1 
      008E33 4B 10            [ 1]  317 	push #16  ; BASE=16
      008E35 F7               [ 1]  318 2$:	ld (x),a 
      008E36 5C               [ 1]  319 	incw x 
      008E37 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008E3A 72 5C 00 02      [ 1]  321 	inc in 
      008E3E CD 98 A1         [ 4]  322 	call to_upper 
      008E41 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008E43 CD 8E C9         [ 4]  324 	call is_digit 
      008E46 25 ED            [ 1]  325 	jrc 2$
      008E48 A6 10            [ 1]  326 	ld a,#16 
      008E4A 11 01            [ 1]  327 	cp a,(BASE,sp)
      008E4C 26 0A            [ 1]  328 	jrne 3$ 
      008E4E 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E50 A1 41            [ 1]  330 	cp a,#'A 
      008E52 2B 04            [ 1]  331 	jrmi 3$ 
      008E54 A1 47            [ 1]  332 	cp a,#'G 
      008E56 2B DD            [ 1]  333 	jrmi 2$ 
      008E58 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E5C 7F               [ 1]  335     clr (x)
      008E5D 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E5F CD 98 AD         [ 4]  337 	call atoi24
      008E62 90 93            [ 1]  338 	ldw y,x
      008E64 C6 00 0D         [ 1]  339 	ld a,acc24 
      008E67 90 F7            [ 1]  340 	ld (y),a 
      008E69 72 A9 00 01      [ 2]  341 	addw y,#1  
      008E6D CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E70 90 FF            [ 2]  343 	ldw (y),x 
      008E72 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      008E76 A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DF8                        346 	_drop VSIZE  
      008E78 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E7A 81               [ 4]  347 	ret 	
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
      008E7B                        364 parse_binary: ; { -- n }
      008E7B 4B 00            [ 1]  365 	push #0
      008E7D 4B 00            [ 1]  366 	push #0
      008E7F 4B 00            [ 1]  367 	push #0
      008E81                        368 2$:	
      008E81 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E84 72 5C 00 02      [ 1]  370 	inc in 
      008E88 A1 30            [ 1]  371 	cp a,#'0 
      008E8A 27 06            [ 1]  372 	jreq 3$
      008E8C A1 31            [ 1]  373 	cp a,#'1 
      008E8E 27 02            [ 1]  374 	jreq 3$ 
      008E90 20 0B            [ 2]  375 	jra bin_exit 
      008E92 A0 30            [ 1]  376 3$: sub a,#'0 
      008E94 46               [ 1]  377 	rrc a
      008E95 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E97 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E99 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E9B 20 E4            [ 2]  381 	jra 2$  
      008E9D                        382 bin_exit:
      008E9D 72 5A 00 02      [ 1]  383 	dec in 
      008EA1 90 93            [ 1]  384 	ldw y,x
      008EA3 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008EA5 C7 00 0D         [ 1]  386 	ld acc24,a 
      008EA8 1E 02            [ 2]  387 	ldw x,(BINARY+1,sp)
      008EAA CF 00 0E         [ 2]  388 	ldw acc16,x
      008EAD 90 FF            [ 2]  389 	ldw (y),x 
      008EAF 72 A9 00 02      [ 2]  390 	addw y,#2  
      008EB3 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000E35                        392 	_drop VSIZE 
      008EB5 5B 03            [ 2]    1     addw sp,#VSIZE 
      008EB7 81               [ 4]  393 	ret
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
      008EB8                        402 is_alpha::
      008EB8 A1 41            [ 1]  403 	cp a,#'A 
      008EBA 8C               [ 1]  404 	ccf 
      008EBB 24 0B            [ 1]  405 	jrnc 9$ 
      008EBD A1 5B            [ 1]  406 	cp a,#'Z+1 
      008EBF 25 07            [ 1]  407 	jrc 9$ 
      008EC1 A1 61            [ 1]  408 	cp a,#'a 
      008EC3 8C               [ 1]  409 	ccf 
      008EC4 24 02            [ 1]  410 	jrnc 9$
      008EC6 A1 7B            [ 1]  411 	cp a,#'z+1
      008EC8 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008EC9                        421 is_digit::
      008EC9 A1 30            [ 1]  422 	cp a,#'0
      008ECB 25 03            [ 1]  423 	jrc 1$
      008ECD A1 3A            [ 1]  424     cp a,#'9+1
      008ECF 8C               [ 1]  425 	ccf 
      008ED0 8C               [ 1]  426 1$:	ccf 
      008ED1 81               [ 4]  427     ret
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
      008ED2                        438 is_alnum::
      008ED2 CD 8E C9         [ 4]  439 	call is_digit
      008ED5 25 03            [ 1]  440 	jrc 1$ 
      008ED7 CD 8E B8         [ 4]  441 	call is_alpha
      008EDA 81               [ 4]  442 1$:	ret 
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



      008EDB                        453 is_symbol_char: 
      008EDB A1 5F            [ 1]  454 	cp a,#'_ 
      008EDD 26 03            [ 1]  455 	jrne 1$
      008EDF 99               [ 1]  456 	scf 
      008EE0 20 03            [ 2]  457 	jra 9$ 
      008EE2 CD 8E D2         [ 4]  458 1$:	call is_alnum 
      008EE5 81               [ 4]  459 9$: ret 
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
      008EE6                        473 parse_symbol:
      008EE6 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008EE7                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008EE7 CD 98 A1         [ 4]  477 	call to_upper  
      008EEA F7               [ 1]  478 	ld (x), a 
      008EEB 5C               [ 1]  479 	incw x
      008EEC 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008EEF 72 5C 00 02      [ 1]  481 	inc in 
      008EF3 CD 8E DB         [ 4]  482 	call is_symbol_char 
      008EF6 25 EF            [ 1]  483 	jrc symb_loop 
      008EF8 7F               [ 1]  484 	clr (x)
      008EF9 72 5A 00 02      [ 1]  485 	dec in  
      008EFD 81               [ 4]  486 	ret 
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
      008EFE                        502 parse_keyword: 
      008EFE 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EFF CD 8E E6         [ 4]  504 	call parse_symbol
      008F02 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008F04 E6 02            [ 1]  506 	ld a,(2,x)
      008F06 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008F08 E6 01            [ 1]  509 	ld a,(1,x) 
      008F0A A0 41            [ 1]  510 	sub a,#'A 
      008F0C AE 00 03         [ 2]  511 	ldw x,#3 
      008F0F 42               [ 4]  512 	mul x,a 
      008F10 1C 00 30         [ 2]  513 	addw x,#vars 
      008F13 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008F15 20 24            [ 2]  515 	jra 4$ 
      008F17                        516 2$: ; check for keyword, otherwise syntax error.
      000E97                        517 	_ldx_dict kword_dict ; dictionary entry point
      008F17 AE B3 39         [ 2]    1     ldw x,#kword_dict+2
      008F1A 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008F1C 90 5C            [ 1]  519 	incw y 
      008F1E CD 99 17         [ 4]  520 	call search_dict
      008F21 4D               [ 1]  521 	tnz a
      008F22 26 17            [ 1]  522 	jrne 4$ 
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008F24 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008F26 A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008F28 90 F7            [ 1]  527 	ld (y),a 
      008F2A 90 5C            [ 1]  528 	incw y
      008F2C                        529 24$:	
      008F2C 90 F6            [ 1]  530     ld a,(y)
      008F2E 27 04            [ 1]  531 	jreq 3$
      008F30 90 5C            [ 1]  532 	incw y 
      008F32 20 F8            [ 2]  533 	jra 24$ 
      008F34 90 5C            [ 1]  534 3$: incw y 
      008F36 A6 03            [ 1]  535 	ld a,#TK_LABEL 
      008F38 5F               [ 1]  536 	clrw x 	
      008F39 20 11            [ 2]  537 	jra 5$ 
      008F3B                        538 4$:	
      008F3B 16 01            [ 2]  539 	ldw y,(XFIRST,sp)
      008F3D A3 00 4E         [ 2]  540 	cpw x,#LET_IDX 
      008F40 27 0A            [ 1]  541 	jreq 5$  ; don't compile LET command 
      008F42 90 F7            [ 1]  542 	ld (y),a 
      008F44 90 5C            [ 1]  543 	incw y 
      008F46 90 FF            [ 2]  544 	ldw (y),x
      008F48 72 A9 00 02      [ 2]  545 	addw y,#2  
      000ECC                        546 5$:	_drop VSIZE 
      008F4C 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F4E 81               [ 4]  547 	ret  	
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
      008F4F                        558 skip:
      008F4F 88               [ 1]  559 	push a
      008F50 91 D6 01         [ 4]  560 1$:	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008F53 27 0A            [ 1]  561 	jreq 2$
      008F55 11 01            [ 1]  562 	cp a,(C,sp)
      008F57 26 06            [ 1]  563 	jrne 2$
      008F59 72 5C 00 02      [ 1]  564 	inc in
      008F5D 20 F1            [ 2]  565 	jra 1$
      000EDF                        566 2$: _drop 1 
      008F5F 5B 01            [ 2]    1     addw sp,#1 
      008F61 81               [ 4]  567 	ret
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
      008F62                        592 get_token:: 
      000EE2                        593 	_vars VSIZE
      008F62 52 02            [ 2]    1     sub sp,#VSIZE 
                                    594 ;	ld a,in 
                                    595 ;	sub a,count
                                    596 ;   jrmi 0$
                                    597 ;	clr a 
                                    598 ;	ret 
      008F64                        599 0$: 
      008F64 90 AE 16 68      [ 2]  600 	ldw y,#tib    	
      008F68 A6 20            [ 1]  601 	ld a,#SPACE
      008F6A CD 8F 4F         [ 4]  602 	call skip
      008F6D 55 00 02 00 03   [ 1]  603 	mov in.saved,in 
      008F72 91 D6 01         [ 4]  604 	ld a,([in.w],y)
      008F75 26 05            [ 1]  605 	jrne 1$
      008F77 90 93            [ 1]  606 	ldw y,x 
      008F79 CC 91 1E         [ 2]  607 	jp token_exit ; end of line 
      008F7C 72 5C 00 02      [ 1]  608 1$:	inc in 
      008F80 CD 98 A1         [ 4]  609 	call to_upper 
      008F83 6B 01            [ 1]  610 	ld (TCHAR,sp),a 
                                    611 ; check for quoted string
      008F85                        612 str_tst:  	
      000F05                        613 	_case '"' nbr_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008F85 A6 22            [ 1]    1 	ld a,#'"' 
      008F87 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F89 26 0A            [ 1]    3 	jrne nbr_tst
      008F8B A6 02            [ 1]  614 	ld a,#TK_QSTR
      008F8D F7               [ 1]  615 	ld (x),a 
      008F8E 5C               [ 1]  616 	incw x 
      008F8F CD 8D D3         [ 4]  617 	call parse_quote
      008F92 CC 91 1E         [ 2]  618 	jp token_exit
      008F95                        619 nbr_tst:
                                    620 ; check for hexadecimal number 
      008F95 A6 24            [ 1]  621 	ld a,#'$'
      008F97 11 01            [ 1]  622 	cp a,(TCHAR,sp) 
      008F99 27 17            [ 1]  623 	jreq 1$
                                    624 ;check for binary number 
      008F9B A6 26            [ 1]  625 	ld a,#'&
      008F9D 11 01            [ 1]  626 	cp a,(TCHAR,sp)
      008F9F 26 0A            [ 1]  627 	jrne 0$
      008FA1 A6 84            [ 1]  628 	ld a,#TK_INTGR
      008FA3 F7               [ 1]  629 	ld (x),a 
      008FA4 5C               [ 1]  630 	incw x 
      008FA5 CD 8E 7B         [ 4]  631 	call parse_binary ; expect binary integer 
      008FA8 CC 91 1E         [ 2]  632 	jp token_exit 
                                    633 ; check for decimal number 	
      008FAB 7B 01            [ 1]  634 0$:	ld a,(TCHAR,sp)
      008FAD CD 8E C9         [ 4]  635 	call is_digit
      008FB0 24 0C            [ 1]  636 	jrnc 3$
      008FB2 A6 84            [ 1]  637 1$:	ld a,#TK_INTGR 
      008FB4 F7               [ 1]  638 	ld (x),a 
      008FB5 5C               [ 1]  639 	incw x 
      008FB6 7B 01            [ 1]  640 	ld a,(TCHAR,sp)
      008FB8 CD 8E 28         [ 4]  641 	call parse_integer 
      008FBB CC 91 1E         [ 2]  642 	jp token_exit 
      008FBE                        643 3$: 
      000F3E                        644 	_case '(' bkslsh_tst 
      008FBE A6 28            [ 1]    1 	ld a,#'(' 
      008FC0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FC2 26 05            [ 1]    3 	jrne bkslsh_tst
      008FC4 A6 06            [ 1]  645 	ld a,#TK_LPAREN
      008FC6 CC 91 1A         [ 2]  646 	jp token_char   	
      008FC9                        647 bkslsh_tst: ; character token 
      000F49                        648 	_case '\',rparnt_tst
      008FC9 A6 5C            [ 1]    1 	ld a,#'\' 
      008FCB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FCD 26 16            [ 1]    3 	jrne rparnt_tst
      008FCF A6 04            [ 1]  649 	ld a,#TK_CHAR 
      008FD1 F7               [ 1]  650 	ld (x),a 
      008FD2 5C               [ 1]  651 	incw x 
      008FD3 91 D6 01         [ 4]  652 	ld a,([in.w],y)
      008FD6 F7               [ 1]  653 	ld (x),a 
      008FD7 5C               [ 1]  654 	incw x
      008FD8 90 93            [ 1]  655 	ldw y,x 	 
      008FDA 72 5C 00 02      [ 1]  656 	inc in  
      008FDE 5F               [ 1]  657 	clrw x 
      008FDF 97               [ 1]  658 	ld xl,a 
      008FE0 A6 04            [ 1]  659 	ld a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008FE2 CC 91 1E         [ 2]  660 	jp token_exit 
      008FE5                        661 rparnt_tst:		
      000F65                        662 	_case ')' colon_tst 
      008FE5 A6 29            [ 1]    1 	ld a,#')' 
      008FE7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE9 26 05            [ 1]    3 	jrne colon_tst
      008FEB A6 07            [ 1]  663 	ld a,#TK_RPAREN 
      008FED CC 91 1A         [ 2]  664 	jp token_char
      008FF0                        665 colon_tst:
      000F70                        666 	_case ':' comma_tst 
      008FF0 A6 3A            [ 1]    1 	ld a,#':' 
      008FF2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FF4 26 05            [ 1]    3 	jrne comma_tst
      008FF6 A6 0A            [ 1]  667 	ld a,#TK_COLON 
      008FF8 CC 91 1A         [ 2]  668 	jp token_char  
      008FFB                        669 comma_tst:
      000F7B                        670 	_case COMMA sharp_tst 
      008FFB A6 2C            [ 1]    1 	ld a,#COMMA 
      008FFD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FFF 26 05            [ 1]    3 	jrne sharp_tst
      009001 A6 08            [ 1]  671 	ld a,#TK_COMMA
      009003 CC 91 1A         [ 2]  672 	jp token_char
      009006                        673 sharp_tst:
      000F86                        674 	_case SHARP dash_tst 
      009006 A6 23            [ 1]    1 	ld a,#SHARP 
      009008 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00900A 26 05            [ 1]    3 	jrne dash_tst
      00900C A6 09            [ 1]  675 	ld a,#TK_SHARP
      00900E CC 91 1A         [ 2]  676 	jp token_char  	 	 
      009011                        677 dash_tst: 	
      000F91                        678 	_case '-' at_tst 
      009011 A6 2D            [ 1]    1 	ld a,#'-' 
      009013 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009015 26 05            [ 1]    3 	jrne at_tst
      009017 A6 11            [ 1]  679 	ld a,#TK_MINUS  
      009019 CC 91 1A         [ 2]  680 	jp token_char 
      00901C                        681 at_tst:
      000F9C                        682 	_case '@' qmark_tst 
      00901C A6 40            [ 1]    1 	ld a,#'@' 
      00901E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009020 26 05            [ 1]    3 	jrne qmark_tst
      009022 A6 05            [ 1]  683 	ld a,#TK_ARRAY 
      009024 CC 91 1A         [ 2]  684 	jp token_char
      009027                        685 qmark_tst:
      000FA7                        686 	_case '?' tick_tst 
      009027 A6 3F            [ 1]    1 	ld a,#'?' 
      009029 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00902B 26 12            [ 1]    3 	jrne tick_tst
      00902D A6 80            [ 1]  687 	ld a,#TK_CMD  
      00902F F7               [ 1]  688 	ld (x),a 
      009030 5C               [ 1]  689 	incw x 
      009031 90 93            [ 1]  690 	ldw y,x 
      009033 AE 00 6E         [ 2]  691 	ldw x,#PRT_IDX 
      009036 90 FF            [ 2]  692 	ldw (y),x 
      009038 72 A9 00 02      [ 2]  693 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00903C CC 91 1E         [ 2]  694 	jp token_exit
      00903F                        695 tick_tst: ; comment 
      000FBF                        696 	_case TICK plus_tst 
      00903F A6 27            [ 1]    1 	ld a,#TICK 
      009041 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009043 26 35            [ 1]    3 	jrne plus_tst
      009045 A6 80            [ 1]  697 	ld a,#TK_CMD
      009047 F7               [ 1]  698 	ld (x),a 
      009048 5C               [ 1]  699 	incw x
      009049 90 AE 00 88      [ 2]  700 	ldw y,#REM_IDX
      00904D FF               [ 2]  701 	ldw (x),y 
      00904E 1C 00 02         [ 2]  702 	addw x,#2  
      009051                        703 copy_comment:
      009051 90 AE 16 68      [ 2]  704 	ldw y,#tib 
      009055 72 B9 00 01      [ 2]  705 	addw y,in.w
      009059 90 89            [ 2]  706 	pushw y
      00905B CD 94 25         [ 4]  707 	call strcpy
      00905E 72 F2 01         [ 2]  708     subw y,(1,sp)
      009061 90 9F            [ 1]  709 	ld a,yl 
      009063 CB 00 02         [ 1]  710 	add a,in
      009066 C7 00 02         [ 1]  711 	ld in,a 
      009069 1F 01            [ 2]  712 	ldw (1,sp),x
      00906B 72 F9 01         [ 2]  713 	addw y,(1,sp)
      00906E 90 5C            [ 1]  714 	incw y 
      000FF0                        715 	_drop 2 
      009070 5B 02            [ 2]    1     addw sp,#2 
      009072 AE 00 88         [ 2]  716 	ldw x,#REM_IDX 
      009075 A6 80            [ 1]  717 	ld a,#TK_CMD 
      009077 CC 91 1E         [ 2]  718 	jp token_exit 
      00907A                        719 plus_tst:
      000FFA                        720 	_case '+' star_tst 
      00907A A6 2B            [ 1]    1 	ld a,#'+' 
      00907C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00907E 26 05            [ 1]    3 	jrne star_tst
      009080 A6 10            [ 1]  721 	ld a,#TK_PLUS  
      009082 CC 91 1A         [ 2]  722 	jp token_char 
      009085                        723 star_tst:
      001005                        724 	_case '*' slash_tst 
      009085 A6 2A            [ 1]    1 	ld a,#'*' 
      009087 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009089 26 05            [ 1]    3 	jrne slash_tst
      00908B A6 20            [ 1]  725 	ld a,#TK_MULT 
      00908D CC 91 1A         [ 2]  726 	jp token_char 
      009090                        727 slash_tst: 
      001010                        728 	_case '/' prcnt_tst 
      009090 A6 2F            [ 1]    1 	ld a,#'/' 
      009092 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009094 26 05            [ 1]    3 	jrne prcnt_tst
      009096 A6 21            [ 1]  729 	ld a,#TK_DIV 
      009098 CC 91 1A         [ 2]  730 	jp token_char 
      00909B                        731 prcnt_tst:
      00101B                        732 	_case '%' eql_tst 
      00909B A6 25            [ 1]    1 	ld a,#'%' 
      00909D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00909F 26 05            [ 1]    3 	jrne eql_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      0090A1 A6 22            [ 1]  733 	ld a,#TK_MOD
      0090A3 CC 91 1A         [ 2]  734 	jp token_char  
                                    735 ; 1 or 2 character tokens 	
      0090A6                        736 eql_tst:
      001026                        737 	_case '=' gt_tst 		
      0090A6 A6 3D            [ 1]    1 	ld a,#'=' 
      0090A8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090AA 26 05            [ 1]    3 	jrne gt_tst
      0090AC A6 32            [ 1]  738 	ld a,#TK_EQUAL
      0090AE CC 91 1A         [ 2]  739 	jp token_char 
      0090B1                        740 gt_tst:
      001031                        741 	_case '>' lt_tst 
      0090B1 A6 3E            [ 1]    1 	ld a,#'>' 
      0090B3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090B5 26 23            [ 1]    3 	jrne lt_tst
      0090B7 A6 31            [ 1]  742 	ld a,#TK_GT 
      0090B9 6B 02            [ 1]  743 	ld (ATTRIB,sp),a 
      0090BB 91 D6 01         [ 4]  744 	ld a,([in.w],y)
      0090BE 72 5C 00 02      [ 1]  745 	inc in 
      0090C2 A1 3D            [ 1]  746 	cp a,#'=
      0090C4 26 04            [ 1]  747 	jrne 1$
      0090C6 A6 33            [ 1]  748 	ld a,#TK_GE 
      0090C8 20 50            [ 2]  749 	jra token_char  
      0090CA A1 3C            [ 1]  750 1$: cp a,#'<
      0090CC 26 04            [ 1]  751 	jrne 2$
      0090CE A6 35            [ 1]  752 	ld a,#TK_NE 
      0090D0 20 48            [ 2]  753 	jra token_char 
      0090D2 72 5A 00 02      [ 1]  754 2$: dec in
      0090D6 7B 02            [ 1]  755 	ld a,(ATTRIB,sp)
      0090D8 20 40            [ 2]  756 	jra token_char 	 
      0090DA                        757 lt_tst:
      00105A                        758 	_case '<' other
      0090DA A6 3C            [ 1]    1 	ld a,#'<' 
      0090DC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090DE 26 23            [ 1]    3 	jrne other
      0090E0 A6 34            [ 1]  759 	ld a,#TK_LT 
      0090E2 6B 02            [ 1]  760 	ld (ATTRIB,sp),a 
      0090E4 91 D6 01         [ 4]  761 	ld a,([in.w],y)
      0090E7 72 5C 00 02      [ 1]  762 	inc in 
      0090EB A1 3D            [ 1]  763 	cp a,#'=
      0090ED 26 04            [ 1]  764 	jrne 1$
      0090EF A6 36            [ 1]  765 	ld a,#TK_LE 
      0090F1 20 27            [ 2]  766 	jra token_char 
      0090F3 A1 3E            [ 1]  767 1$: cp a,#'>
      0090F5 26 04            [ 1]  768 	jrne 2$
      0090F7 A6 35            [ 1]  769 	ld a,#TK_NE 
      0090F9 20 1F            [ 2]  770 	jra token_char 
      0090FB 72 5A 00 02      [ 1]  771 2$: dec in 
      0090FF 7B 02            [ 1]  772 	ld a,(ATTRIB,sp)
      009101 20 17            [ 2]  773 	jra token_char 	
      009103                        774 other: ; not a special character 	 
      009103 7B 01            [ 1]  775 	ld a,(TCHAR,sp)
      009105 CD 8E B8         [ 4]  776 	call is_alpha 
      009108 25 03            [ 1]  777 	jrc 30$ 
      00910A CC 96 C5         [ 2]  778 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00910D                        779 30$: 
      00910D CD 8E FE         [ 4]  780 	call parse_keyword
      009110 A3 A0 B1         [ 2]  781 	cpw x,#remark 
      009113 26 09            [ 1]  782 	jrne token_exit 
      009115 90 93            [ 1]  783 	ldw y,x 
      009117 CC 90 51         [ 2]  784 	jp copy_comment 
      00911A                        785 token_char:
      00911A F7               [ 1]  786 	ld (x),a 
      00911B 5C               [ 1]  787 	incw x
      00911C 90 93            [ 1]  788 	ldw y,x 
      00911E                        789 token_exit:
      00109E                        790 	_drop VSIZE 
      00911E 5B 02            [ 2]    1     addw sp,#VSIZE 
      009120 81               [ 4]  791 	ret
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
      009121                        811 compile::
      009121 90 89            [ 2]  812 	pushw y 
      0010A3                        813 	_vars VSIZE 
      009123 52 02            [ 2]    1     sub sp,#VSIZE 
      009125 55 00 1B 00 05   [ 1]  814 	mov basicptr,txtbgn
      00912A 72 1A 00 22      [ 1]  815 	bset flags,#FCOMP 
      00912E A6 00            [ 1]  816 	ld a,#0
      009130 AE 00 00         [ 2]  817 	ldw x,#0
      009133 CF 16 B8         [ 2]  818 	ldw pad,x ; destination buffer 
      009136 C7 16 BA         [ 1]  819 	ld pad+2,a ; count 
      009139 AE 16 BB         [ 2]  820 	ldw x,#pad+3
      00913C 72 5F 00 02      [ 1]  821 	clr in 
      009140 CD 8F 62         [ 4]  822 	call get_token
      009143 A1 84            [ 1]  823 	cp a,#TK_INTGR
      009145 26 11            [ 1]  824 	jrne 2$
      009147 A3 00 01         [ 2]  825 	cpw x,#1 
      00914A 2A 05            [ 1]  826 	jrpl 1$
      00914C A6 0A            [ 1]  827 	ld a,#ERR_BAD_VALUE
      00914E CC 96 C7         [ 2]  828 	jp tb_error
      009151 CF 16 B8         [ 2]  829 1$:	ldw pad,x 
      009154 90 AE 16 BB      [ 2]  830 	ldw y,#pad+3 
      009158 90 A3 17 74      [ 2]  831 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00915C 25 05            [ 1]  832 	jrult 3$
      00915E A6 0F            [ 1]  833 	ld a,#ERR_BUF_FULL 
      009160 CC 96 C7         [ 2]  834 	jp tb_error 
      009163                        835 3$:	
      009163 93               [ 1]  836 	ldw x,y 
      009164 CD 8F 62         [ 4]  837 	call get_token 
      009167 A1 00            [ 1]  838 	cp a,#TK_NONE 
      009169 26 ED            [ 1]  839 	jrne 2$ 
                                    840 ; compilation completed  
      00916B 72 A2 16 B8      [ 2]  841 	subw y,#pad
      00916F 90 9F            [ 1]  842     ld a,yl
      009171 AE 16 B8         [ 2]  843 	ldw x,#pad 
      009174 CF 00 19         [ 2]  844 	ldw ptr16,x 
      009177 E7 02            [ 1]  845 	ld (2,x),a 
      009179 FE               [ 2]  846 	ldw x,(x)
      00917A 27 09            [ 1]  847 	jreq 10$
      00917C CD 8D 61         [ 4]  848 	call insert_line
      00917F 72 5F 00 04      [ 1]  849 	clr  count 
      009183 20 0F            [ 2]  850 	jra  11$ 
      009185                        851 10$: ; line# is zero 
      009185 CE 00 19         [ 2]  852 	ldw x,ptr16  
      009188 CF 00 05         [ 2]  853 	ldw basicptr,x 
      00918B E6 02            [ 1]  854 	ld a,(2,x)
      00918D C7 00 04         [ 1]  855 	ld count,a 
      009190 35 03 00 02      [ 1]  856 	mov in,#3 
      009194                        857 11$:
      001114                        858 	_drop VSIZE 
      009194 5B 02            [ 2]    1     addw sp,#VSIZE 
      009196 72 1B 00 22      [ 1]  859 	bres flags,#FCOMP 
      00919A 90 85            [ 2]  860 	popw y 
      00919C 81               [ 4]  861 	ret 
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
      00919D                         48 cpy_cmd_name:
      00919D F6               [ 1]   49 	ld a,(x)
      00919E 5C               [ 1]   50 	incw x
      00919F A4 0F            [ 1]   51 	and a,#15  
      0091A1 88               [ 1]   52 	push a 
      0091A2 0D 01            [ 1]   53     tnz (1,sp) 
      0091A4 27 0A            [ 1]   54 	jreq 9$
      0091A6 F6               [ 1]   55 1$:	ld a,(x)
      0091A7 90 F7            [ 1]   56 	ld (y),a  
      0091A9 5C               [ 1]   57 	incw x
      0091AA 90 5C            [ 1]   58 	incw y 
      0091AC 0A 01            [ 1]   59 	dec (1,sp)	 
      0091AE 26 F6            [ 1]   60 	jrne 1$
      0091B0 84               [ 1]   61 9$: pop a 
      0091B1 81               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      0091B2                         72 add_space:
      0091B2 90 5A            [ 2]   73 	decw y 
      0091B4 90 F6            [ 1]   74 	ld a,(y)
      0091B6 90 5C            [ 1]   75 	incw y
      0091B8 CD 8E D2         [ 4]   76 	call is_alnum 
      0091BB 24 06            [ 1]   77 	jrnc 1$
      0091BD A6 20            [ 1]   78 	ld a,#SPACE 
      0091BF 90 F7            [ 1]   79 	ld (y),a 
      0091C1 90 5C            [ 1]   80 	incw y 
      0091C3 81               [ 4]   81 1$: ret 
                                     82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
      0091C4                         93 right_align::
      0091C4 88               [ 1]   94 	push a 
      0091C5 7B 01            [ 1]   95 0$: ld a,(1,sp)
      0091C7 C1 00 23         [ 1]   96 	cp a,tab_width 
      0091CA 2A 08            [ 1]   97 	jrpl 1$
      0091CC A6 20            [ 1]   98 	ld a,#SPACE 
      0091CE 5A               [ 2]   99 	decw x
      0091CF F7               [ 1]  100 	ld (x),a  
      0091D0 0C 01            [ 1]  101 	inc (1,sp)
      0091D2 20 F1            [ 2]  102 	jra 0$ 
      0091D4 84               [ 1]  103 1$: pop a 	
      0091D5 81               [ 4]  104 	ret 
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
      0091D6                        117 cpy_quote:
      0091D6 A6 22            [ 1]  118 	ld a,#'"
      0091D8 90 F7            [ 1]  119 	ld (y),a 
      0091DA 90 5C            [ 1]  120 	incw y 
      0091DC F6               [ 1]  121 1$:	ld a,(x)
      0091DD 27 30            [ 1]  122 	jreq 9$
      0091DF 5C               [ 1]  123 	incw x 
      0091E0 A1 20            [ 1]  124 	cp a,#SPACE 
      0091E2 25 0E            [ 1]  125 	jrult 3$
      0091E4 90 F7            [ 1]  126 	ld (y),a
      0091E6 90 5C            [ 1]  127 	incw y 
      0091E8 A1 5C            [ 1]  128 	cp a,#'\ 
      0091EA 26 F0            [ 1]  129 	jrne 1$ 
      0091EC                        130 2$:
      0091EC 90 F7            [ 1]  131 	ld (y),a
      0091EE 90 5C            [ 1]  132 	incw y  
      0091F0 20 EA            [ 2]  133 	jra 1$
      0091F2 88               [ 1]  134 3$: push a 
      0091F3 A6 5C            [ 1]  135 	ld a,#'\
      0091F5 90 F7            [ 1]  136 	ld (y),a 
      0091F7 90 5C            [ 1]  137 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0091F9 84               [ 1]  138 	pop a 
      0091FA A0 07            [ 1]  139 	sub a,#7
      0091FC C7 00 0F         [ 1]  140 	ld acc8,a 
      0091FF 72 5F 00 0E      [ 1]  141 	clr acc16
      009203 89               [ 2]  142 	pushw x
      009204 AE 8E 20         [ 2]  143 	ldw x,#escaped 
      009207 72 BB 00 0E      [ 2]  144 	addw x,acc16 
      00920B F6               [ 1]  145 	ld a,(x)
      00920C 85               [ 2]  146 	popw x
      00920D 20 DD            [ 2]  147 	jra 2$
      00920F A6 22            [ 1]  148 9$: ld a,#'"
      009211 90 F7            [ 1]  149 	ld (y),a 
      009213 90 5C            [ 1]  150 	incw y  
      009215 5C               [ 1]  151 	incw x 
      009216 81               [ 4]  152 	ret
                                    153 
                                    154 ;--------------------------
                                    155 ; return variable name 
                                    156 ; from its address.
                                    157 ; input:
                                    158 ;   X    variable address
                                    159 ; output:
                                    160 ;   A     variable letter
                                    161 ;--------------------------
      009217                        162 var_name::
      009217 1D 00 30         [ 2]  163 		subw x,#vars 
      00921A 9F               [ 1]  164 		ld a,xl 
      00921B 44               [ 1]  165 		srl a 
      00921C AB 41            [ 1]  166 		add a,#'A 
      00921E 81               [ 4]  167 		ret 
                                    168 
                                    169 ;-----------------------------
                                    170 ; return cmd  idx from its 
                                    171 ; code address 
                                    172 ; input:
                                    173 ;   X      code address 
                                    174 ; output:
                                    175 ;   X      cmd_idx
                                    176 ;-----------------------------
      00921F                        177 get_cmd_idx:
      00921F 90 89            [ 2]  178 	pushw y
      009221 90 AE B3 3F      [ 2]  179 	ldw y,#code_addr 
      009225 90 CF 00 19      [ 2]  180 	ldw ptr16,y 
      009229 90 5F            [ 1]  181 	clrw y 
      00922B 91 D3 19         [ 5]  182 1$:	cpw x,([ptr16],y)
      00922E 27 0C            [ 1]  183 	jreq 3$ 
      009230 90 5C            [ 1]  184 	incw y 
      009232 91 D6 19         [ 4]  185 	ld a,([ptr16],y)
      009235 90 5C            [ 1]  186 	incw y
      009237 91 DA 19         [ 4]  187 	or a,([ptr16],y)	
      00923A 26 EF            [ 1]  188 	jrne 1$
      00923C 93               [ 1]  189 3$: ldw x,y 
      00923D 90 85            [ 2]  190 	popw y 
      00923F 81               [ 4]  191 	ret
                                    192 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
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
      009240                        208 decompile::
      0011C0                        209 	_vars VSIZE
      009240 52 04            [ 2]    1     sub sp,#VSIZE 
      009242 C6 00 0B         [ 1]  210 	ld a,base
      009245 6B 01            [ 1]  211 	ld (BASE_SAV,sp),a  
      009247 C6 00 23         [ 1]  212 	ld a,tab_width 
      00924A 6B 02            [ 1]  213 	ld (WIDTH_SAV,sp),a 
      00924C 17 03            [ 2]  214 	ldw (STR,sp),y   
      00924E 72 CE 00 05      [ 5]  215 	ldw x,[basicptr] ; line number 
      009252 35 0A 00 0B      [ 1]  216 	mov base,#10
      009256 35 05 00 23      [ 1]  217 	mov tab_width,#5
      00925A 72 5F 00 0D      [ 1]  218 	clr acc24 
      00925E CF 00 0E         [ 2]  219 	ldw acc16,x
      009261 4F               [ 1]  220 	clr a ; unsigned conversion 
      009262 CD 98 39         [ 4]  221 	call itoa  
      009265 CD 91 C4         [ 4]  222 	call right_align 
      009268 88               [ 1]  223 	push a 
      009269 90 93            [ 1]  224 1$:	ldw y,x ; source
      00926B 1E 04            [ 2]  225 	ldw x,(STR+1,sp) ; destination
      00926D CD 94 25         [ 4]  226 	call strcpy 
      009270 90 5F            [ 1]  227 	clrw y 
      009272 84               [ 1]  228 	pop a 
      009273 90 97            [ 1]  229 	ld yl,a 
      009275 72 F9 03         [ 2]  230 	addw y,(STR,sp)
      009278 A6 20            [ 1]  231 	ld a,#SPACE 
      00927A 90 F7            [ 1]  232 	ld (y),a 
      00927C 90 5C            [ 1]  233 	incw y 
      00927E 72 5F 00 23      [ 1]  234 	clr tab_width
      009282 AE 00 03         [ 2]  235 	ldw x,#3
      009285 CF 00 01         [ 2]  236 	ldw in.w,x 
      009288                        237 decomp_loop:
      009288 90 89            [ 2]  238 	pushw y
      00928A CD 97 BE         [ 4]  239 	call next_token 
      00928D 90 85            [ 2]  240 	popw y 
      00928F 4D               [ 1]  241 	tnz a  
      009290 26 03            [ 1]  242 	jrne 1$
      009292 CC 93 9C         [ 2]  243 	jp 20$
      009295 2B 03            [ 1]  244 1$:	jrmi 2$
      009297 CC 93 17         [ 2]  245 	jp 6$
      00929A                        246 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00929A A1 85            [ 1]  247 	cp a,#TK_VAR 
      00929C 26 0C            [ 1]  248 	jrne 3$
                                    249 ;; TK_VAR 
      00929E CD 91 B2         [ 4]  250 	call add_space  
      0092A1 CD 92 17         [ 4]  251 	call var_name
      0092A4 90 F7            [ 1]  252 	ld (y),a 
      0092A6 90 5C            [ 1]  253 	incw y  
      0092A8 20 DE            [ 2]  254 	jra decomp_loop
      0092AA                        255 3$:
      0092AA A1 84            [ 1]  256 	cp a,#TK_INTGR
      0092AC 26 26            [ 1]  257 	jrne 4$
                                    258 ;; TK_INTGR
      0092AE CD 97 F4         [ 4]  259 	call get_int24 
      0092B1 C7 00 0D         [ 1]  260 	ld acc24,a 
      0092B4 CF 00 0E         [ 2]  261 	ldw acc16,x 
      0092B7 CD 91 B2         [ 4]  262 	call add_space
      0092BA 90 89            [ 2]  263 	pushw y 
      0092BC A6 FF            [ 1]  264 	ld a,#255 ; signed conversion 
      0092BE CD 98 39         [ 4]  265 	call itoa  
      0092C1 16 01            [ 2]  266 	ldw y,(1,sp) 
      0092C3 88               [ 1]  267 	push a 
      0092C4 51               [ 1]  268 	exgw x,y 
      0092C5 CD 94 25         [ 4]  269 	call strcpy 
      0092C8 90 5F            [ 1]  270 	clrw y
      0092CA 84               [ 1]  271 	pop a  
      0092CB 90 97            [ 1]  272 	ld yl,a 
      0092CD 72 F9 01         [ 2]  273 	addw y,(1,sp)
      001250                        274 	_drop 2 
      0092D0 5B 02            [ 2]    1     addw sp,#2 
      0092D2 20 B4            [ 2]  275 	jra decomp_loop
      0092D4                        276 4$: ; dictionary keyword 
      0092D4 CD 92 1F         [ 4]  277 	call get_cmd_idx 
      0092D7 A3 00 88         [ 2]  278 	cpw x,#REM_IDX
      0092DA 26 23            [ 1]  279 	jrne 5$
      0092DC CE 00 05         [ 2]  280 	ldw x,basicptr 
                                    281 ; copy comment to buffer 
      0092DF CD 91 B2         [ 4]  282 	call add_space
      0092E2 A6 27            [ 1]  283 	ld a,#''
      0092E4 90 F7            [ 1]  284 	ld (y),a 
      0092E6 90 5C            [ 1]  285 	incw y 
      0092E8                        286 46$:
      0092E8 72 D6 00 01      [ 4]  287 	ld a,([in.w],x)
      0092EC 72 5C 00 02      [ 1]  288 	inc in  
      0092F0 90 F7            [ 1]  289 	ld (y),a 
      0092F2 90 5C            [ 1]  290 	incw y 
      0092F4 C6 00 02         [ 1]  291 	ld a,in 
      0092F7 C1 00 04         [ 1]  292 	cp a,count 
      0092FA 2B EC            [ 1]  293 	jrmi 46$
      0092FC CC 93 9C         [ 2]  294 	jp 20$  
      0092FF A3 00 4E         [ 2]  295 5$: cpw x,#LET_IDX 
      009302 26 03            [ 1]  296 	jrne 51$
      009304 CC 92 88         [ 2]  297 	jp decomp_loop ; down display LET 	
      009307                        298 51$: ; insert command name 
      009307 CD 91 B2         [ 4]  299 	call add_space  
      00930A 90 89            [ 2]  300 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00930C CD 93 D7         [ 4]  301 	call cmd_name
      00930F 90 85            [ 2]  302 	popw y 
      009311 CD 91 9D         [ 4]  303 	call cpy_cmd_name
      009314 CC 92 88         [ 2]  304 	jp decomp_loop 
      009317                        305 6$:
                                    306 ; label?
      009317 A1 03            [ 1]  307 	cp a,#TK_LABEL 
      009319 26 19            [ 1]  308 	jrne 64$
                                    309 ; copy label string to output buffer   	
      00931B A6 20            [ 1]  310 	ld a,#32 
      00931D 90 F7            [ 1]  311 	ld (y),a 
      00931F 90 5C            [ 1]  312 	incw y 
      009321                        313 61$:
      009321 F6               [ 1]  314 	ld a,(x)
      009322 27 07            [ 1]  315 	jreq 62$ 
      009324 5C               [ 1]  316 	incw x  
      009325 90 F7            [ 1]  317 	ld (y),a 
      009327 90 5C            [ 1]  318 	incw y 
      009329 20 F6            [ 2]  319 	jra 61$ 
      00932B                        320 62$: 
      00932B A6 20            [ 1]  321 	ld a,#32 
      00932D 90 F7            [ 1]  322 	ld (y),a 
      00932F 90 5C            [ 1]  323 	incw y 
      009331 CC 92 88         [ 2]  324 	jp decomp_loop
      009334                        325 64$:
      009334 A1 02            [ 1]  326 	cp a,#TK_QSTR 
      009336 26 06            [ 1]  327 	jrne 7$
                                    328 ;; TK_QSTR
      009338 CD 91 D6         [ 4]  329 	call cpy_quote  
      00933B CC 92 88         [ 2]  330 	jp decomp_loop
      00933E                        331 7$:
      00933E A1 04            [ 1]  332 	cp a,#TK_CHAR 
      009340 26 0E            [ 1]  333 	jrne 8$
                                    334 ;; TK_CHAR 
      009342 A6 5C            [ 1]  335 	ld a,#'\ 
      009344 90 F7            [ 1]  336 	ld (y),a 
      009346 90 5C            [ 1]  337 	incw y 
      009348 9F               [ 1]  338 	ld a,xl 
      009349 90 F7            [ 1]  339 	ld (y),a 
      00934B 90 5C            [ 1]  340 	incw y 
      00934D CC 92 88         [ 2]  341 	jp decomp_loop
      009350 A1 0A            [ 1]  342 8$: cp a,#TK_COLON 
      009352 26 09            [ 1]  343 	jrne 9$
      009354 A6 3A            [ 1]  344 	ld a,#':
      009356                        345 81$:
      009356 90 F7            [ 1]  346 	ld (y),a 
      009358 90 5C            [ 1]  347 	incw y 
      00935A                        348 82$:
      00935A CC 92 88         [ 2]  349 	jp decomp_loop
      00935D                        350 9$: 
      00935D A1 09            [ 1]  351 	cp a,#TK_SHARP
      00935F 22 0A            [ 1]  352 	jrugt 10$ 
      009361 A0 05            [ 1]  353 	sub a,#TK_ARRAY 
      009363 5F               [ 1]  354 	clrw x 
      009364 97               [ 1]  355 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009365 1C 93 B2         [ 2]  356 	addw x,#single_char 
      009368 F6               [ 1]  357 	ld a,(x)
      009369 20 EB            [ 2]  358 	jra 81$ 
      00936B                        359 10$: 
      00936B A1 11            [ 1]  360 	cp a,#TK_MINUS 
      00936D 22 0A            [ 1]  361 	jrugt 11$
      00936F A0 10            [ 1]  362 	sub a,#TK_PLUS 
      009371 5F               [ 1]  363 	clrw x 
      009372 97               [ 1]  364 	ld xl,a 
      009373 1C 93 B7         [ 2]  365 	addw x,#add_char 
      009376 F6               [ 1]  366 	ld a,(x)
      009377 20 DD            [ 2]  367 	jra 81$
      009379                        368 11$:
      009379 A1 22            [ 1]  369     cp a,#TK_MOD 
      00937B 22 0A            [ 1]  370 	jrugt 12$
      00937D A0 20            [ 1]  371 	sub a,#TK_MULT
      00937F 5F               [ 1]  372 	clrw x 
      009380 97               [ 1]  373 	ld xl,a 
      009381 1C 93 B9         [ 2]  374 	addw x,#mul_char
      009384 F6               [ 1]  375 	ld a,(x)
      009385 20 CF            [ 2]  376 	jra 81$
      009387                        377 12$:
      009387 A0 31            [ 1]  378 	sub a,#TK_GT  
      009389 48               [ 1]  379 	sll a 
      00938A 5F               [ 1]  380 	clrw x 
      00938B 97               [ 1]  381 	ld xl,a 
      00938C 1C 93 BC         [ 2]  382 	addw x,#relop_str 
      00938F FE               [ 2]  383 	ldw x,(x)
      009390 F6               [ 1]  384 	ld a,(x)
      009391 5C               [ 1]  385 	incw x 
      009392 90 F7            [ 1]  386 	ld (y),a
      009394 90 5C            [ 1]  387 	incw y 
      009396 F6               [ 1]  388 	ld a,(x)
      009397 26 BD            [ 1]  389 	jrne 81$
      009399 CC 92 88         [ 2]  390 	jp decomp_loop 
      00939C                        391 20$: 
      00939C 90 7F            [ 1]  392 	clr (y)
      00939E 1E 03            [ 2]  393 	ldw x,(STR,sp)
      0093A0 7B 01            [ 1]  394 	ld a,(BASE_SAV,sp)
      0093A2 C7 00 0B         [ 1]  395 	ld base,a 
      0093A5 7B 02            [ 1]  396 	ld a,(WIDTH_SAV,sp)
      0093A7 C7 00 23         [ 1]  397 	ld tab_width,a
      0093AA 72 F2 03         [ 2]  398 	subw y,(STR,sp) 
      0093AD 90 9F            [ 1]  399 	ld a,yl 
      00132F                        400 	_drop VSIZE 
      0093AF 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093B1 81               [ 4]  401 	ret 
                                    402 
      0093B2 40 28 29 2C 23         403 single_char: .byte '@','(',')',',','#'
      0093B7 2B 2D                  404 add_char: .byte '+','-'
      0093B9 2A 2F 25               405 mul_char: .byte '*','/','%'
      0093BC 93 C8 93 CA 93 CC 93   406 relop_str: .word gt,equal,ge,lt,le,ne 
             CF 93 D1 93 D4
      0093C8 3E 00                  407 gt: .asciz ">"
      0093CA 3D 00                  408 equal: .asciz "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0093CC 3E 3D 00               409 ge: .asciz ">="
      0093CF 3C 00                  410 lt: .asciz "<"
      0093D1 3C 3D 00               411 le: .asciz "<="
      0093D4 3C 3E 00               412 ne:  .asciz "<>"
                                    413 
                                    414 ;----------------------------------
                                    415 ; search in kword_dict name
                                    416 ; from its execution address 
                                    417 ; input:
                                    418 ;   X       	cmd_index 
                                    419 ; output:
                                    420 ;   X 			cstr*  | 0 
                                    421 ;--------------------------------
                           000001   422 	CMDX=1 
                           000003   423 	LINK=3 
                           000004   424 	VSIZE=4
      0093D7                        425 cmd_name:
      001357                        426 	_vars VSIZE 
      0093D7 52 04            [ 2]    1     sub sp,#VSIZE 
      0093D9 72 5F 00 0E      [ 1]  427 	clr acc16 
      0093DD 1F 01            [ 2]  428 	ldw (CMDX,sp),x  
      0093DF AE B3 37         [ 2]  429 	ldw x,#kword_dict	
      0093E2 1F 03            [ 2]  430 1$:	ldw (LINK,sp),x
      0093E4 E6 02            [ 1]  431 	ld a,(2,x)
      0093E6 A4 0F            [ 1]  432 	and a,#15 
      0093E8 C7 00 0F         [ 1]  433 	ld acc8,a 
      0093EB 1C 00 03         [ 2]  434 	addw x,#3
      0093EE 72 BB 00 0E      [ 2]  435 	addw x,acc16
      0093F2 FE               [ 2]  436 	ldw x,(x) ; command index  
      0093F3 13 01            [ 2]  437 	cpw x,(CMDX,sp)
      0093F5 27 0A            [ 1]  438 	jreq 2$
      0093F7 1E 03            [ 2]  439 	ldw x,(LINK,sp)
      0093F9 FE               [ 2]  440 	ldw x,(x) 
      0093FA 1D 00 02         [ 2]  441 	subw x,#2  
      0093FD 26 E3            [ 1]  442 	jrne 1$
      0093FF 20 05            [ 2]  443 	jra 9$
      009401 1E 03            [ 2]  444 2$: ldw x,(LINK,sp)
      009403 1C 00 02         [ 2]  445 	addw x,#2 	
      001386                        446 9$:	_drop VSIZE
      009406 5B 04            [ 2]    1     addw sp,#VSIZE 
      009408 81               [ 4]  447 	ret
                                    448 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
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
      009409                        116 strlen::
      009409 89               [ 2]  117 	pushw x 
      00940A 4F               [ 1]  118 	clr a
      00940B 7D               [ 1]  119 1$:	tnz (x) 
      00940C 27 04            [ 1]  120 	jreq 9$ 
      00940E 4C               [ 1]  121 	inc a 
      00940F 5C               [ 1]  122 	incw x 
      009410 20 F9            [ 2]  123 	jra 1$ 
      009412 85               [ 2]  124 9$:	popw x 
      009413 81               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      009414                        135 strcmp:
      009414 F6               [ 1]  136 	ld a,(x)
      009415 27 0B            [ 1]  137 	jreq 5$ 
      009417 90 F1            [ 1]  138 	cp a,(y) 
      009419 26 05            [ 1]  139 	jrne 4$ 
      00941B 5C               [ 1]  140 	incw x 
      00941C 90 5C            [ 1]  141 	incw y 
      00941E 20 F4            [ 2]  142 	jra strcmp 
      009420                        143 4$: ; not same  
      009420 4F               [ 1]  144 	clr a 
      009421 81               [ 4]  145 	ret 
      009422                        146 5$: ; same 
      009422 A6 01            [ 1]  147 	ld a,#1 
      009424 81               [ 4]  148 	ret 
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
      009425                        159 strcpy::
      009425 88               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009426 89               [ 2]  161 	pushw x 
      009427 90 F6            [ 1]  162 1$: ld a,(y)
      009429 27 06            [ 1]  163 	jreq 9$ 
      00942B F7               [ 1]  164 	ld (x),a 
      00942C 5C               [ 1]  165 	incw x 
      00942D 90 5C            [ 1]  166 	incw y 
      00942F 20 F6            [ 2]  167 	jra 1$ 
      009431 7F               [ 1]  168 9$:	clr (x)
      009432 85               [ 2]  169 	popw x 
      009433 84               [ 1]  170 	pop a 
      009434 81               [ 4]  171 	ret 
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
      009435                        185 move::
      009435 88               [ 1]  186 	push a 
      0013B6                        187 	_vars VSIZE 
      009436 52 02            [ 2]    1     sub sp,#VSIZE 
      009438 0F 01            [ 1]  188 	clr (INCR,sp)
      00943A 0F 02            [ 1]  189 	clr (LB,sp)
      00943C 90 89            [ 2]  190 	pushw y 
      00943E 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009440 90 85            [ 2]  192 	popw y 
      009442 27 31            [ 1]  193 	jreq move_exit ; x==y 
      009444 2B 0E            [ 1]  194 	jrmi move_down
      009446                        195 move_up: ; start from top address with incr=-1
      009446 72 BB 00 0E      [ 2]  196 	addw x,acc16
      00944A 72 B9 00 0E      [ 2]  197 	addw y,acc16
      00944E 03 01            [ 1]  198 	cpl (INCR,sp)
      009450 03 02            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009452 20 05            [ 2]  200 	jra move_loop  
      009454                        201 move_down: ; start from bottom address with incr=1 
      009454 5A               [ 2]  202     decw x 
      009455 90 5A            [ 2]  203 	decw y
      009457 0C 02            [ 1]  204 	inc (LB,sp) ; incr=1 
      009459                        205 move_loop:	
      009459 C6 00 0E         [ 1]  206     ld a, acc16 
      00945C CA 00 0F         [ 1]  207 	or a, acc8
      00945F 27 14            [ 1]  208 	jreq move_exit 
      009461 72 FB 01         [ 2]  209 	addw x,(INCR,sp)
      009464 72 F9 01         [ 2]  210 	addw y,(INCR,sp) 
      009467 90 F6            [ 1]  211 	ld a,(y)
      009469 F7               [ 1]  212 	ld (x),a 
      00946A 89               [ 2]  213 	pushw x 
      00946B CE 00 0E         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00946E 5A               [ 2]  215 	decw x 
      00946F CF 00 0E         [ 2]  216 	ldw acc16,x 
      009472 85               [ 2]  217 	popw x 
      009473 20 E4            [ 2]  218 	jra move_loop
      009475                        219 move_exit:
      0013F5                        220 	_drop VSIZE
      009475 5B 02            [ 2]    1     addw sp,#VSIZE 
      009477 84               [ 1]  221 	pop a 
      009478 81               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      009479                        231 clear_vars:
      009479 89               [ 2]  232 	pushw x 
      00947A 88               [ 1]  233 	push a  
      00947B AE 00 30         [ 2]  234 	ldw x,#vars 
      00947E A6 4E            [ 1]  235 	ld a,#CELL_SIZE*26 
      009480 7F               [ 1]  236 1$:	clr (x)
      009481 5C               [ 1]  237 	incw x 
      009482 4A               [ 1]  238 	dec a 
      009483 26 FB            [ 1]  239 	jrne 1$
      009485 84               [ 1]  240 	pop a 
      009486 85               [ 2]  241 	popw x 
      009487 81               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009488 0A 0A 54 69 6E 79 20   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      0094CE                        253 system_information:
      0094CE AE 94 88         [ 2]  254 	ldw x,#software 
      0094D1 CD 89 F5         [ 4]  255 	call puts 
      0094D4 A6 02            [ 1]  256 	ld a,#MAJOR 
      0094D6 C7 00 0F         [ 1]  257 	ld acc8,a 
      0094D9 5F               [ 1]  258 	clrw x 
      0094DA CF 00 0D         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0094DD 72 5F 00 23      [ 1]  260 	clr tab_width  
      0094E1 35 0A 00 0B      [ 1]  261 	mov base, #10 
      0094E5 CD 98 1A         [ 4]  262 	call prt_acc24 
      0094E8 A6 2E            [ 1]  263 	ld a,#'.
      0094EA CD 89 98         [ 4]  264 	call putc 
      0094ED A6 00            [ 1]  265 	ld a,#MINOR 
      0094EF C7 00 0F         [ 1]  266 	ld acc8,a 
      0094F2 5F               [ 1]  267 	clrw x 
      0094F3 CF 00 0D         [ 2]  268 	ldw acc24,x 
      0094F6 CD 98 1A         [ 4]  269 	call prt_acc24
      0094F9 A6 0D            [ 1]  270 	ld a,#CR 
      0094FB CD 89 98         [ 4]  271 	call putc
                                    272 ;call test 
      0094FE 81               [ 4]  273 	ret
                                    274 
      0094FF                        275 warm_init:
      0094FF 90 AE 17 73      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      009503 72 5F 00 22      [ 1]  277 	clr flags 
      009507 72 5F 00 1F      [ 1]  278 	clr loop_depth 
      00950B 35 04 00 23      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      00950F 35 0A 00 0B      [ 1]  280 	mov base,#10 
      009513 AE 00 00         [ 2]  281 	ldw x,#0 
      009516 CF 00 05         [ 2]  282 	ldw basicptr,x 
      009519 CF 00 01         [ 2]  283 	ldw in.w,x 
      00951C 72 5F 00 04      [ 1]  284 	clr count
      009520 81               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      009521                        291 clear_basic:
      009521 89               [ 2]  292 	pushw x 
      009522 72 5F 00 04      [ 1]  293 	clr count
      009526 72 5F 00 02      [ 1]  294 	clr in  
      00952A AE 00 80         [ 2]  295 	ldw x,#free_ram 
      00952D CF 00 1B         [ 2]  296 	ldw txtbgn,x 
      009530 CF 00 1D         [ 2]  297 	ldw txtend,x 
      009533 CD 94 79         [ 4]  298 	call clear_vars 
      009536 85               [ 2]  299 	popw x
      009537 81               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009538                        305 err_msg:
      009538 00 00 95 5A 95 67 95   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             75 95 8E 95 9D
      009544 95 B3 95 C9 95 E3 95   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             F4 96 05
      00954E 96 11 96 44 96 54 96   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             68 96 7B
      009558 96 88                  309 	.word err_overflow 
                                    310 
      00955A 4D 65 6D 6F 72 79 20   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal  66-Bits]



             66 75 6C 6C 0A 00
      009562 75 6C 6C 0A 00 73 79   312 err_syntax: .asciz "syntax error\n" 
             6E 74 61 78 20 65 72
      009570 72 6F 72 0A 00 6D 61   313 err_math_ovf: .asciz "math operation overflow\n"
             74 68 20 6F 70 65 72
             61 74 69 6F 6E 20 6F
             76 65 72 66
      009589 6C 6F 77 0A 00 64 69   314 err_div0: .asciz "division by 0\n" 
             76 69 73 69 6F 6E 20
             62
      009598 79 20 30 0A 00 69 6E   315 err_no_line: .asciz "invalid line number.\n"
             76 61 6C 69 64 20 6C
             69 6E 65 20 6E 75 6D
             62
      0095AE 65 72 2E 0A 00 72 75   316 err_run_only: .asciz "run time only usage.\n" 
             6E 20 74 69 6D 65 20
             6F 6E 6C 79 20 75 73
             61
      0095C4 67 65 2E 0A 00 63 6F   317 err_cmd_only: .asciz "command line only usage.\n"
             6D 6D 61 6E 64 20 6C
             69 6E 65 20 6F 6E 6C
             79 20 75 73 61
      0095DE 67 65 2E 0A 00 64 75   318 err_duplicate: .asciz "duplicate name.\n"
             70 6C 69 63 61 74 65
             20 6E 61
      0095EF 6D 65 2E 0A 00 46 69   319 err_not_file: .asciz "File not found.\n"
             6C 65 20 6E 6F 74 20
             66 6F 75
      009600 6E 64 2E 0A 00 62 61   320 err_bad_value: .asciz "bad value.\n"
             64 20 76 61 6C
      00960C 75 65 2E 0A 00 46 69   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6C 65 20 69 6E 20 65
             78 74 65 6E 64 65 64
             20 6D 65 6D 6F 72 79
             2C 20 63 61 6E 27 74
             20 62 65 20 72 75 6E
             20 66 72 6F 6D 20 74
             68 65
      00963F 72 65 2E 0A 00 4E 6F   322 err_no_data: .asciz "No data found.\n"
             20 64 61 74 61 20 66
             6F 75
      00964F 6E 64 2E 0A 00 4E 6F   323 err_no_prog: .asciz "No program in RAM!\n"
             20 70 72 6F 67 72 61
             6D 20 69 6E 20 52
      009663 41 4D 21 0A 00 46 69   324 err_no_fspace: .asciz "File system full.\n" 
             6C 65 20 73 79 73 74
             65 6D 20 66 75
      009676 6C 6C 2E 0A 00 42 75   325 err_buf_full: .asciz "Buffer full\n"
             66 66 65 72 20 66
      009683 75 6C 6C 0A 00 6F 76   326 err_overflow: .asciz "overflow\n" 
             65 72 66
                                    327 
      00968D 6C 6F 77 0A 00 0A 72   328 rt_msg: .asciz "\nrun time error, "
             75 6E 20 74 69 6D 65
             20 65 72 72
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00969F 6F 72 2C 20 00 0A 63   329 comp_msg: .asciz "\ncompile error, "
             6F 6D 70 69 6C 65 20
             65 72 72
      0096B0 6F 72 2C 20 00 6C 61   330 tk_id: .asciz "last token id: "
             73 74 20 74 6F 6B 65
             6E 20
                                    331 
      001645                        332 syntax_error::
      0096C0 69 64            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      001647                        335 tb_error::
      0096C2 3A 20 00 21 44   [ 2]  336 	btjt flags,#FCOMP,1$
      0096C5 88               [ 1]  337 	push a 
      0096C5 A6 02 12         [ 2]  338 	ldw x, #rt_msg 
      0096C7 CD 09 75         [ 4]  339 	call puts 
      0096C7 72               [ 1]  340 	pop a 
      0096C8 0A 00 22         [ 2]  341 	ldw x, #err_msg 
      0096CB 44 88 AE 96      [ 1]  342 	clr acc16 
      0096CF 92               [ 1]  343 	sll a
      0096D0 CD 89 F5 84      [ 1]  344 	rlc acc16  
      0096D4 AE 95 38         [ 1]  345 	ld acc8, a 
      0096D7 72 5F 00 0E      [ 2]  346 	addw x,acc16 
      0096DB 48               [ 2]  347 	ldw x,(x)
      0096DC 72 59 00         [ 4]  348 	call puts
      0096DF 0E C7 00         [ 2]  349 	ldw x,basicptr
      0096E2 0F 72 BB         [ 1]  350 	ld a,in 
      0096E5 00 0E FE         [ 4]  351 	call prt_basic_line
      0096E8 CD 89 F5         [ 2]  352 	ldw x,#tk_id 
      0096EB CE 00 05         [ 4]  353 	call puts 
      0096EE C6 00 02         [ 1]  354 	ld a,in.saved 
      0096F1 CD               [ 1]  355 	clrw x 
      0096F2 9F               [ 1]  356 	ld xl,a 
      0096F3 6F AE 96 B5      [ 2]  357 	addw x,basicptr 
      0096F7 CD               [ 1]  358 	ld a,(x)
      0096F8 89               [ 1]  359 	clrw x 
      0096F9 F5               [ 1]  360 	ld xl,a 
      0096FA C6 00 03         [ 4]  361 	call prt_i16
      0096FD 5F 97 72 BB 00   [ 2]  362 	btjf flags,#FAUTORUN ,6$
      009702 05 F6            [ 2]  363 	jra 6$
      001690                        364 1$:	
      009704 5F               [ 1]  365 	push a 
      009705 97 CD 98         [ 2]  366 	ldw x,#comp_msg
      009708 0A 72 0D         [ 4]  367 	call puts 
      00970B 00               [ 1]  368 	pop a 
      00970C 22 37 20         [ 2]  369 	ldw x, #err_msg 
      00970F 35 5F 00 0D      [ 1]  370 	clr acc16 
      009710 48               [ 1]  371 	sll a
      009710 88 AE 96 A4      [ 1]  372 	rlc acc16  
      009714 CD 89 F5         [ 1]  373 	ld acc8, a 
      009717 84 AE 95 38      [ 2]  374 	addw x,acc16 
      00971B 72               [ 2]  375 	ldw x,(x)
      00971C 5F 00 0E         [ 4]  376 	call puts
      00971F 48 72 59         [ 2]  377 	ldw x,#tib
      009722 00 0E C7         [ 4]  378 	call puts 
      009725 00 0F            [ 1]  379 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      009727 72 BB 00         [ 4]  380 	call putc
      00972A 0E FE CD         [ 2]  381 	ldw x,in.w
      00972D 89 F5 AE         [ 4]  382 	call spaces
      009730 16 68            [ 1]  383 	ld a,#'^
      009732 CD 89 F5         [ 4]  384 	call putc 
      009735 A6 0D CD         [ 2]  385 6$: ldw x,#STACK_EMPTY 
      009738 89               [ 1]  386     ldw sp,x
                                    387 
      0016C9                        388 warm_start:
      009739 98 CE 00         [ 4]  389 	call warm_init
                                    390 ;----------------------------
                                    391 ;   BASIC interpreter
                                    392 ;----------------------------
      0016CC                        393 cmd_line: ; user interface 
      00973C 01 CD            [ 1]  394 	ld a,#CR 
      00973E 8A 62 A6         [ 4]  395 	call putc 
      009741 5E CD            [ 1]  396 	ld a,#'> 
      009743 89 98 AE         [ 4]  397 	call putc
      009746 17 FF 94         [ 4]  398 	call readln
      009749 72 5D 00 03      [ 1]  399 	tnz count 
      009749 CD 94            [ 1]  400 	jreq cmd_line
      00974B FF 10 A1         [ 4]  401 	call compile
                                    402 
                                    403 ; if text begin with a line number
                                    404 ; the compiler set count to zero    
                                    405 ; so code is not interpreted
      00974C 72 5D 00 03      [ 1]  406 	tnz count 
      00974C A6 0D            [ 1]  407 	jreq cmd_line
                                    408 	
                                    409 ; if direct command 
                                    410 ; it's ready to interpret 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    412 ;; This is the interpreter loop
                                    413 ;; for each BASIC code line. 
                                    414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016E8                        415 interpreter: 
      00974E CD 89 98         [ 1]  416 	ld a,in 
      009751 A6 3E CD         [ 1]  417 	cp a,count 
      009754 89 98            [ 1]  418 	jrmi interp_loop
      0016F0                        419 next_line:
      009756 CD 8A FA 72 5D   [ 2]  420 	btjf flags, #FRUN, cmd_line
      00975B 00 04 27         [ 2]  421 	ldw x,basicptr
      00975E ED CD 91 21      [ 2]  422 	addw x,in.w 
      009762 72 5D 00         [ 2]  423 	cpw x,txtend 
      009765 04 27            [ 1]  424 	jrpl warm_start
      009767 E4 00 04         [ 2]  425 	ldw basicptr,x ; start of next line  
      009768 E6 02            [ 1]  426 	ld a,(2,x)
      009768 C6 00 02         [ 1]  427 	ld count,a 
      00976B C1 00 04 2B      [ 1]  428 	mov in,#3 ; skip first 3 bytes of line 
      00170D                        429 interp_loop: 
      00976F 1D 17 3E         [ 4]  430 	call next_token
      009770 A1 00            [ 1]  431 	cp a,#TK_NONE 
      009770 72 01            [ 1]  432 	jreq next_line 
      009772 00 22            [ 1]  433 	cp a,#TK_CMD
      009774 D7 CE            [ 1]  434 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009776 00 05 72         [ 4]  435 	call get_code_addr
      009779 BB               [ 4]  436 	call (x) 
      00977A 00 01            [ 2]  437 	jra interp_loop 
      00171E                        438 1$:	 
      00977C C3 00            [ 1]  439 	cp a,#TK_VAR
      00977E 1D 2A            [ 1]  440 	jrne 2$
      009780 C8 CF 00         [ 4]  441 	call let_var  
      009783 05 E6            [ 2]  442 	jra interp_loop 
      001727                        443 2$:	
      009785 02 C7            [ 1]  444 	cp a,#TK_ARRAY 
      009787 00 04            [ 1]  445 	jrne 3$
      009789 35 03 00         [ 4]  446 	call let_array 
      00978C 02 DD            [ 2]  447 	jra interp_loop
      00978D                        448 3$:	
      00978D CD 97            [ 1]  449 	cp a,#TK_COLON 
      00978F BE A1            [ 1]  450 	jreq interp_loop
      009791 00 27            [ 1]  451 4$: cp a,#TK_LABEL
      009793 DC A1 80         [ 4]  452 	call skip_string 
      009796 26 06            [ 1]  453 	jreq interp_loop 
      009798 CD 97 D8         [ 2]  454 5$:	jp syntax_error 
                                    455 
                                    456 ;--------------------------
                                    457 ; extract next token from
                                    458 ; token list 
                                    459 ; basicptr -> base address 
                                    460 ; in  -> offset in list array 
                                    461 ; output:
                                    462 ;   A 		token attribute
                                    463 ;   X 		*token_value 
                                    464 ;----------------------------------------
      00173E                        465 next_token::
      00979B FD               [ 1]  466 	clrw x 
      00979C 20 EF 01         [ 1]  467 	ld a,in 
      00979E C7 00 02         [ 1]  468 	ld in.saved,a ; in case "_unget_token" needed 
                                    469 ; don't replace sub by "cp a,count" 
                                    470 ; if end of line must return with A=0   	
      00979E A1 85 26         [ 1]  471 	sub a,count 
      0097A1 05 CD            [ 1]  472 	jreq 9$ ; end of line 
      00174A                        473 0$: 
      0097A3 9C 3C 20         [ 2]  474 	ldw x,basicptr 
      0097A6 E6 BB 00 00      [ 2]  475 	addw x,in.w 
      0097A7 F6               [ 1]  476 	ld a,(x)
      0097A7 A1               [ 1]  477 	incw x
      0097A8 05 26 05 CD      [ 1]  478 	inc in   
      0097AC 9C               [ 4]  479 9$: ret 
                                    480 
                                    481 ;------------------------
                                    482 ; get cmd and function 
                                    483 ; code address 
                                    484 ; input:
                                    485 ;    X   * cmd|func index 
                                    486 ;        in code_addr table 
                                    487 ;------------------------
      001758                        488 get_code_addr:
      0097AD 37               [ 2]  489 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0097AE 20 DD BF         [ 2]  490 	ldw x,(code_addr,x)
      0097B0                        491 skip_2_bytes:
      0097B0 A1 0A            [ 1]  492 	ld a,#2 ; *_IDX size 
      0097B2 27 D9 A1         [ 1]  493 	add a,in  
      0097B5 03 CD 97         [ 1]  494 	ld in,a 
      0097B8 E5               [ 4]  495 	ret
                                    496 
                                    497 ;-------------------------
                                    498 ;  skip .asciz in BASIC line 
                                    499 ;  name 
                                    500 ;  input:
                                    501 ;     x		* string 
                                    502 ;  output:
                                    503 ;     none 
                                    504 ;-------------------------
      001765                        505 skip_string:
      0097B9 27               [ 1]  506 	ld a,(x)
      0097BA D2               [ 1]  507 	incw x 
      0097BB CC 96            [ 1]  508 	jrne skip_string
      0097BD C5 B0 00 04      [ 2]  509 	subw x,basicptr 
      0097BE CF 00 00         [ 2]  510 	ldw in.w,x 
      0097BE 5F               [ 4]  511 	ret 
                                    512 
                                    513 ;---------------------
                                    514 ; extract 16 bits  
                                    515 ; address from BASIC
                                    516 ; code 
                                    517 ; input:
                                    518 ;    X    *address
                                    519 ; output:
                                    520 ;    X    address 
                                    521 ;-------------------- 
      001771                        522 get_addr:
      0097BF C6               [ 2]  523 	ldw x,(x)
      0097C0 00 02            [ 2]  524 	jra skip_2_bytes ; adjust in.w index 
                                    525 
                                    526 
                                    527 ;--------------------
                                    528 ; extract int24_t  
                                    529 ; value from BASIC 
                                    530 ; code 
                                    531 ; input:
                                    532 ;    X   *integer 
                                    533 ; output:
                                    534 ;    A:X   int24  
                                    535 ;--------------------
      001774                        536 get_int24:
      0097C2 C7               [ 1]  537 	ld a,(x)
      0097C3 00 03            [ 2]  538 	ldw x,(1,x)
                                    539 ; skip 3 bytes 
      0097C5 C0 00 04 27      [ 1]  540 	inc in 
      0097C9 0D 5C 00 01      [ 1]  541 	inc in 
      0097CA 72 5C 00 01      [ 1]  542 	inc in 
      0097CA CE               [ 4]  543 	ret 
                                    544 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    545 ;-------------------------
                                    546 ; get character from 
                                    547 ; BASIC code 
                                    548 ; input:
                                    549 ;    X   *char 
                                    550 ; output:
                                    551 ;    A    char 
                                    552 ;-------------------------
      001784                        553 get_char:
      0097CB 00               [ 1]  554 	ld a,(x)
      0097CC 05 72 BB 00      [ 1]  555 	inc in  
      0097D0 01               [ 4]  556     ret 
                                    557 
                                    558 ;-----------------------------------
                                    559 ; print a 16 bit integer 
                                    560 ; using variable 'base' as conversion
                                    561 ; format.
                                    562 ; input:
                                    563 ;    X       integer to print 
                                    564 ;   'base'    conversion base 
                                    565 ; output:
                                    566 ;   terminal  
                                    567 ;-----------------------------------
      00178A                        568 prt_i16:
      0097D1 F6 5C 72 5C      [ 1]  569 	clr acc24 
      0097D5 00 02 81         [ 2]  570 	ldw acc16,x 
      0097D8 72 0F 00 0D 04   [ 2]  571 	btjf acc16,#7,prt_acc24
      0097D8 FE DE B3 3F      [ 1]  572 	cpl acc24 ; sign extend 
                                    573 	
                                    574 ;------------------------------------
                                    575 ; print integer in acc24 
                                    576 ; input:
                                    577 ;	acc24 		integer to print 
                                    578 ;	'base' 		numerical base for conversion 
                                    579 ;   'tab_width' field width 
                                    580 ;    A 			signed||unsigned conversion
                                    581 ;  output:
                                    582 ;    A          string length
                                    583 ;------------------------------------
      0097DC                        584 prt_acc24:
      0097DC A6 02            [ 1]  585 	ld a,#255  ; signed conversion  
      0097DE CB 00 02         [ 4]  586     call itoa  ; conversion entier en  .asciz
      0097E1 C7 00 02         [ 4]  587 	call right_align  
      0097E4 81               [ 1]  588 	push a 
      0097E5 CD 09 75         [ 4]  589 	call puts
      0097E5 F6               [ 1]  590 	pop a 
      0097E6 5C               [ 4]  591     ret	
                                    592 
                                    593 ;---------------------------------------
                                    594 ;  print value at xstack top 
                                    595 ;---------------------------------------
      0017A8                        596 print_top: 
      0017A8                        597 	_xpop 
      0097E7 26 FC            [ 1]    1     ld a,(y)
      0097E9 72               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0097EA B0 00            [ 2]    3     ldw x,(1,x)
      0097EC 05 CF 00 01      [ 2]    4     addw y,#CELL_SIZE 
      0097F0 81 00 0C         [ 1]  598 	ld acc24,a 
      0097F1 CF 00 0D         [ 2]  599 	ldw acc16,x 
      0097F1 FE 20            [ 2]  600 	jra prt_acc24 
                                    601 
                                    602 
                                    603 ;------------------------------------
                                    604 ; convert integer in acc24 to string
                                    605 ; input:
                                    606 ;   'base'	conversion base 
                                    607 ;	acc24	integer to convert
                                    608 ;   A       0=unsigned, else signed 
                                    609 ; output:
                                    610 ;   X  		pointer to first char of string
                                    611 ;   A       string length
                                    612 ;------------------------------------
                           000001   613 	SIGN=1  ; integer sign 
                           000002   614 	LEN=2 
                           000003   615 	PSTR=3
                           000004   616 	VSIZE=4 ;locals size
      0017B9                        617 itoa::
      0017B9                        618 	_vars VSIZE
      0097F3 E8 04            [ 2]    1     sub sp,#VSIZE 
      0097F4 0F 02            [ 1]  619 	clr (LEN,sp) ; string length  
      0097F4 F6 EE            [ 1]  620 	clr (SIGN,sp)    ; sign
      0097F6 01               [ 1]  621 	tnz A
      0097F7 72 5C            [ 1]  622 	jreq 1$ ; unsigned conversion  
      0097F9 00 02 72         [ 1]  623 	ld a,base 
      0097FC 5C 00            [ 1]  624 	cp a,#10
      0097FE 02 72            [ 1]  625 	jrne 1$
                                    626 	; base 10 string display with negative sign if bit 23==1
      009800 5C 00 02 81 05   [ 2]  627 	btjf acc24,#7,1$
      009804 03 01            [ 1]  628 	cpl (SIGN,sp)
      009804 F6 72 5C         [ 4]  629 	call neg_acc24
      0017D3                        630 1$:
                                    631 ; initialize string pointer 
      009807 00 02 81         [ 2]  632 	ldw x,#tib 
      00980A 1C 00 50         [ 2]  633 	addw x,#TIB_SIZE
      00980A 72               [ 2]  634 	decw x 
      00980B 5F               [ 1]  635 	clr (x)
      0017DB                        636 itoa_loop:
      00980C 00 0D CF         [ 1]  637     ld a,base
      00980F 00 0E            [ 2]  638 	ldw (PSTR,sp),x 
      009811 72 0F 00         [ 4]  639     call divu24_8 ; acc24/A 
      009814 0E 04            [ 2]  640 	ldw x,(PSTR,sp)
      009816 72 53            [ 1]  641     add a,#'0  ; remainder of division
      009818 00 0D            [ 1]  642     cp a,#'9+1
      00981A 2B 02            [ 1]  643     jrmi 2$
      00981A A6 FF            [ 1]  644     add a,#7 
      0017ED                        645 2$:	
      00981C CD               [ 2]  646 	decw x
      00981D 98               [ 1]  647     ld (x),a
      00981E 39 CD            [ 1]  648 	inc (LEN,sp)
                                    649 	; if acc24==0 conversion done
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      009820 91 C4 88         [ 1]  650 	ld a,acc24
      009823 CD 89 F5         [ 1]  651 	or a,acc16
      009826 84 81 0E         [ 1]  652 	or a,acc8
      009828 26 DF            [ 1]  653     jrne itoa_loop
                                    654 	;conversion done, next add '$' or '-' as required
      009828 90 F6 93         [ 1]  655 	ld a,base 
      00982B EE 01            [ 1]  656 	cp a,#16
      00982D 72 A9            [ 1]  657 	jreq 8$
      00982F 00 03            [ 1]  658 	ld a,(SIGN,sp)
      009831 C7 00            [ 1]  659     jreq 10$
      009833 0D CF            [ 1]  660     ld a,#'-
      009835 00 0E            [ 2]  661 	jra 9$ 
                                    662 ; don't print more than 4 digits
                                    663 ; in hexadecimal to avoid '-' sign 
                                    664 ; extend display 	
      009837 20 E1            [ 1]  665 8$: ld a,(LEN,sp) 
      009839 A1 06            [ 1]  666 	cp a,#6 
      009839 52 04            [ 1]  667 	jrmi 81$
      00983B 0F               [ 1]  668 	incw x
      00983C 02 0F            [ 1]  669 	dec (LEN,sp)
      00983E 01 4D            [ 2]  670 	jra 8$
      001816                        671 81$:	
      009840 27 11            [ 1]  672 	ld a,#'$ 
      009842 C6               [ 2]  673 9$: decw x
      009843 00               [ 1]  674     ld (x),a
      009844 0B A1            [ 1]  675 	inc (LEN,sp)
      00181C                        676 10$:
      009846 0A 26            [ 1]  677 	ld a,(LEN,sp)
      00181E                        678 	_drop VSIZE
      009848 0A 72            [ 2]    1     addw sp,#VSIZE 
      00984A 0F               [ 4]  679 	ret
                                    680 
                                    681 ;------------------------------------
                                    682 ; convert alpha to uppercase
                                    683 ; input:
                                    684 ;    a  character to convert
                                    685 ; output:
                                    686 ;    a  uppercase character
                                    687 ;------------------------------------
      001821                        688 to_upper::
      00984B 00 0D            [ 1]  689 	cp a,#'a
      00984D 05 03            [ 1]  690 	jrpl 1$
      00984F 01               [ 4]  691 0$:	ret
      009850 CD 82            [ 1]  692 1$: cp a,#'z	
      009852 5C FB            [ 1]  693 	jrugt 0$
      009853 A0 20            [ 1]  694 	sub a,#32
      009853 AE               [ 4]  695 	ret
                                    696 	
                                    697 ;------------------------------------
                                    698 ; convert pad content in integer
                                    699 ; input:
                                    700 ;    x		* .asciz to convert
                                    701 ; output:
                                    702 ;    acc24      int24_t
                                    703 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    704 	; local variables
                           000001   705 	SIGN=1 ; 1 byte, 
                           000002   706 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   707 	TEMP=3 ; 1 byte, temporary storage
                           000003   708 	VSIZE=3 ; 3 bytes reserved for local storage
      00182D                        709 atoi24::
      009854 16               [ 2]  710 	pushw x 
      00182E                        711 	_vars VSIZE
      009855 68 1C            [ 2]    1     sub sp,#VSIZE 
                                    712 	; acc24=0 
      009857 00 50 5A 7F      [ 1]  713 	clr acc24    
      00985B 72 5F 00 0D      [ 1]  714 	clr acc16
      00985B C6 00 0B 1F      [ 1]  715 	clr acc8 
      00985F 03 CD            [ 1]  716 	clr (SIGN,sp)
      009861 83 59            [ 1]  717 	ld a,#10
      009863 1E 03            [ 1]  718 	ld (BASE,sp),a ; default base decimal
      009865 AB               [ 1]  719 	ld a,(x)
      009866 30 A1            [ 1]  720 	jreq 9$  ; completed if 0
      009868 3A 2B            [ 1]  721 	cp a,#'-
      00986A 02 AB            [ 1]  722 	jrne 1$
      00986C 07 01            [ 1]  723 	cpl (SIGN,sp)
      00986D 20 08            [ 2]  724 	jra 2$
      00986D 5A F7            [ 1]  725 1$: cp a,#'$
      00986F 0C 02            [ 1]  726 	jrne 3$
      009871 C6 00            [ 1]  727 	ld a,#16
      009873 0D CA            [ 1]  728 	ld (BASE,sp),a
      009875 00               [ 1]  729 2$:	incw x
      009876 0E               [ 1]  730 	ld a,(x)
      001857                        731 3$:	
      009877 CA 00            [ 1]  732 	cp a,#'a
      009879 0F 26            [ 1]  733 	jrmi 4$
      00987B DF C6            [ 1]  734 	sub a,#32
      00987D 00 0B            [ 1]  735 4$:	cp a,#'0
      00987F A1 10            [ 1]  736 	jrmi 9$
      009881 27 08            [ 1]  737 	sub a,#'0
      009883 7B 01            [ 1]  738 	cp a,#10
      009885 27 15            [ 1]  739 	jrmi 5$
      009887 A6 2D            [ 1]  740 	sub a,#7
      009889 20 0D            [ 1]  741 	cp a,(BASE,sp)
      00988B 7B 02            [ 1]  742 	jrpl 9$
      00988D A1 06            [ 1]  743 5$:	ld (TEMP,sp),a
      00988F 2B 05            [ 1]  744 	ld a,(BASE,sp)
      009891 5C 0A 02         [ 4]  745 	call mulu24_8
      009894 20 F5            [ 1]  746 	ld a,(TEMP,sp)
      009896 CB 00 0E         [ 1]  747 	add a,acc24+2
      009896 A6 24 5A         [ 1]  748 	ld acc24+2,a
      009899 F7               [ 1]  749 	clr a
      00989A 0C 02 0D         [ 1]  750 	adc a,acc24+1
      00989C C7 00 0D         [ 1]  751 	ld acc24+1,a
      00989C 7B               [ 1]  752 	clr a
      00989D 02 5B 04         [ 1]  753 	adc a,acc24
      0098A0 81 00 0C         [ 1]  754 	ld acc24,a
      0098A1 20 C9            [ 2]  755 	jra 2$
      0098A1 A1 61            [ 1]  756 9$:	tnz (SIGN,sp)
      0098A3 2A 01            [ 1]  757     jreq atoi_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      0098A5 81 A1 7A         [ 4]  758     call neg_acc24
      001893                        759 atoi_exit: 
      001893                        760 	_drop VSIZE
      0098A8 22 FB            [ 2]    1     addw sp,#VSIZE 
      0098AA A0               [ 2]  761 	popw x ; restore x
      0098AB 20               [ 4]  762 	ret
                                    763 
                                    764 
                                    765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    766 ;;   TINY BASIC  operators,
                                    767 ;;   commands and functions 
                                    768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    769 
                                    770 ;---------------------------------
                                    771 ; dictionary search 
                                    772 ; input:
                                    773 ;	X 		dictionary entry point, name field  
                                    774 ;   y		.asciz name to search 
                                    775 ; output:
                                    776 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    777 ;  X		cmd_index
                                    778 ;---------------------------------
                           000001   779 	NLEN=1 ; cmd length 
                           000002   780 	XSAVE=2
                           000004   781 	YSAVE=4
                           000005   782 	VSIZE=5 
      001897                        783 search_dict::
      001897                        784 	_vars VSIZE 
      0098AC 81 05            [ 2]    1     sub sp,#VSIZE 
      0098AD 17 04            [ 2]  785 	ldw (YSAVE,sp),y 
      00189B                        786 search_next:
      0098AD 89 52            [ 2]  787 	ldw (XSAVE,sp),x 
                                    788 ; get name length in dictionary	
      0098AF 03               [ 1]  789 	ld a,(x)
      0098B0 72 5F            [ 1]  790 	and a,#0xf 
      0098B2 00 0D            [ 1]  791 	ld (NLEN,sp),a  
      0098B4 72 5F            [ 2]  792 	ldw y,(YSAVE,sp) ; name pointer 
      0098B6 00               [ 1]  793 	incw x 
      0018A5                        794 cp_loop:
      0098B7 0E 72            [ 1]  795 	ld a,(y)
      0098B9 5F 00            [ 1]  796 	jreq str_match 
      0098BB 0F 0F            [ 1]  797 	tnz (NLEN,sp)
      0098BD 01 A6            [ 1]  798 	jreq no_match  
      0098BF 0A               [ 1]  799 	cp a,(x)
      0098C0 6B 02            [ 1]  800 	jrne no_match 
      0098C2 F6 27            [ 1]  801 	incw y 
      0098C4 47               [ 1]  802 	incw x
      0098C5 A1 2D            [ 1]  803 	dec (NLEN,sp)
      0098C7 26 04            [ 2]  804 	jra cp_loop 
      0018B7                        805 no_match:
      0098C9 03 01            [ 2]  806 	ldw x,(XSAVE,sp) 
      0098CB 20 08 A1         [ 2]  807 	subw x,#2 ; move X to link field
      0098CE 24 26            [ 1]  808 	push #TK_NONE 
      0098D0 06               [ 2]  809 	ldw x,(x) ; next word link 
      0098D1 A6               [ 1]  810 	pop a ; TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0098D2 10 6B            [ 1]  811 	jreq search_exit  ; not found  
                                    812 ;try next 
      0098D4 02 5C            [ 2]  813 	jra search_next
      0018C4                        814 str_match:
      0098D6 F6 02            [ 2]  815 	ldw x,(XSAVE,sp)
      0098D7 F6               [ 1]  816 	ld a,(X)
      0098D7 A1 61            [ 1]  817 	ld (NLEN,sp),a ; needed to test keyword type  
      0098D9 2B 02            [ 1]  818 	and a,#0xf 
                                    819 ; move x to procedure address field 	
      0098DB A0               [ 1]  820 	inc a 
      0098DC 20 A1 30         [ 1]  821 	ld acc8,a 
      0098DF 2B 2B A0 30      [ 1]  822 	clr acc16 
      0098E3 A1 0A 2B 06      [ 2]  823 	addw x,acc16 
      0098E7 A0               [ 2]  824 	ldw x,(x) ; routine index  
                                    825 ;determine keyword type bits 7:6 
      0098E8 07 11            [ 1]  826 	ld a,(NLEN,sp)
      0098EA 02               [ 1]  827 	swap a 
      0098EB 2A 1F            [ 1]  828 	and a,#0xc
      0098ED 6B               [ 1]  829 	srl a
      0098EE 03               [ 1]  830 	srl a 
      0098EF 7B 02            [ 1]  831 	add a,#128
      0018E1                        832 search_exit: 
      0018E1                        833 	_drop VSIZE 
      0098F1 CD 82            [ 2]    1     addw sp,#VSIZE 
      0098F3 74               [ 4]  834 	ret 
                                    835 
                                    836 ;---------------------
                                    837 ; check if next token
                                    838 ;  is of expected type 
                                    839 ; input:
                                    840 ;   A 		 expected token attribute
                                    841 ;  ouput:
                                    842 ;   none     if fail call syntax_error 
                                    843 ;--------------------
      0018E4                        844 expect:
      0098F4 7B               [ 1]  845 	push a 
      0098F5 03 CB 00         [ 4]  846 	call next_token 
      0098F8 0F C7            [ 1]  847 	cp a,(1,sp)
      0098FA 00 0F            [ 1]  848 	jreq 1$
      0098FC 4F C9 00         [ 2]  849 	jp syntax_error
      0098FF 0E               [ 1]  850 1$: pop a 
      009900 C7               [ 4]  851 	ret 
                                    852 
                                    853 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    854 ; parse arguments list 
                                    855 ; between ()
                                    856 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018F1                        857 func_args:
      009901 00 0E            [ 1]  858 	ld a,#TK_LPAREN 
      009903 4F C9 00         [ 4]  859 	call expect 
                                    860 ; expected to continue in arg_list 
                                    861 ; caller must check for TK_RPAREN 
                                    862 
                                    863 ;-------------------------------
                                    864 ; parse embedded BASIC routines 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                    865 ; arguments list.
                                    866 ; arg_list::=  expr[','expr]*
                                    867 ; all arguments are of int24_t type
                                    868 ; and pushed on stack 
                                    869 ; input:
                                    870 ;   none
                                    871 ; output:
                                    872 ;   xstack{n}   arguments pushed on xstack
                                    873 ;   A 	number of arguments pushed on xstack  
                                    874 ;--------------------------------
      0018F6                        875 arg_list:
      009906 0D C7            [ 1]  876 	push #0  
      009908 00 0D 20         [ 4]  877 1$: call expression
      00990B C9 0D            [ 1]  878 	cp a,#TK_NONE 
      00990D 01 27            [ 1]  879 	jreq 5$
      00990F 03 CD            [ 1]  880 	cp a,#TK_INTGR
      009911 82 5C            [ 1]  881 	jrne 4$
      009913                        882 3$: 
      009913 5B 03            [ 1]  883 	inc (1,sp)
      009915 85 81 3E         [ 4]  884 	call next_token 
      009917 A1 08            [ 1]  885 	cp a,#TK_COMMA 
      009917 52 05            [ 1]  886 	jreq 1$ 
      009919 17 04            [ 1]  887 	cp a,#TK_NONE 
      00991B 27 09            [ 1]  888 	jreq 5$ 
      00991B 1F 02            [ 1]  889 4$:	cp a,#TK_RPAREN 
      00991D F6 A4            [ 1]  890 	jreq 5$
      001914                        891 	_unget_token 
      00991F 0F 6B 01 16 04   [ 1]    1      mov in,in.saved  
      009924 5C               [ 1]  892 5$:	pop a  
      009925 81               [ 4]  893 	ret 
                                    894 
                                    895 ;--------------------------------
                                    896 ;   BASIC commnands 
                                    897 ;--------------------------------
                                    898 
                                    899 ;--------------------------------
                                    900 ;  arithmetic and relational 
                                    901 ;  routines
                                    902 ;  operators precedence
                                    903 ;  highest to lowest
                                    904 ;  operators on same row have 
                                    905 ;  same precedence and are executed
                                    906 ;  from left to right.
                                    907 ;	'*','/','%'
                                    908 ;   '-','+'
                                    909 ;   '=','>','<','>=','<=','<>','><'
                                    910 ;   '<>' and '><' are equivalent for not equal.
                                    911 ;--------------------------------
                                    912 
                                    913 ;---------------------
                                    914 ; return array element
                                    915 ; address from @(expr)
                                    916 ; input:
                                    917 ;   A 		TK_ARRAY
                                    918 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    919 ;	X 		element address 
                                    920 ;----------------------
      00191B                        921 get_array_element:
      009925 90 F6 27         [ 4]  922 	call func_args 
      009928 1B 0D            [ 1]  923 	cp a,#1
      00992A 01 27            [ 1]  924 	jreq 1$
      00992C 0A F1 26         [ 2]  925 	jp syntax_error
      001925                        926 1$: _xpop 
      00992F 07 90            [ 1]    1     ld a,(y)
      009931 5C               [ 1]    2     ldw x,y 
      009932 5C 0A            [ 2]    3     ldw x,(1,x)
      009934 01 20 EE 03      [ 2]    4     addw y,#CELL_SIZE 
                                    927     ; ignore A, index < 65536 in any case 
                                    928 	; check for bounds 
      009937 C3 00 1F         [ 2]  929 	cpw x,array_size 
      009937 1E 02            [ 2]  930 	jrule 3$
                                    931 ; bounds {1..array_size}	
      009939 1D 00            [ 1]  932 2$: ld a,#ERR_BAD_VALUE 
      00993B 02 4B 00         [ 2]  933 	jp tb_error 
      00993E FE               [ 2]  934 3$: tnzw  x
      00993F 84 27            [ 1]  935 	jreq 2$ 
      009941 1F               [ 2]  936 	pushw x 
      009942 20               [ 2]  937 	sllw x 
      009943 D7 FB 01         [ 2]  938 	addw x,(1,sp) ; index*size_of(int24)
      009944 1F 01            [ 2]  939 	ldw (1,sp),x  
      009944 1E 02 F6         [ 2]  940 	ldw x,#tib ; array is below tib 
      009947 6B 01 A4         [ 2]  941 	subw x,(1,sp)
      001948                        942 	_drop 2   
      00994A 0F 4C            [ 2]    1     addw sp,#2 
      00994C C7               [ 4]  943 	ret 
                                    944 
                                    945 
                                    946 ;***********************************
                                    947 ;   expression parse,execute 
                                    948 ;***********************************
                                    949 ;-----------------------------------
                                    950 ; factor ::= ['+'|'-'|e]  var | @ |
                                    951 ;			 integer | function |
                                    952 ;			 '('relation')' 
                                    953 ; output:
                                    954 ;   A       token attribute 
                                    955 ;   xstack  value  
                                    956 ; ---------------------------------
                           000001   957 	NEG=1
                           000001   958 	VSIZE=1
      00194B                        959 factor:
      00194B                        960 	_vars VSIZE 
      00994D 00 0F            [ 2]    1     sub sp,#VSIZE 
      00994F 72 5F            [ 1]  961 	clr (NEG,sp)
      009951 00 0E 72         [ 4]  962 	call next_token
      009954 BB 00            [ 1]  963 	cp a,#CMD_END  
      009956 0E FE            [ 1]  964 	jrult 16$
      009958 7B 01            [ 1]  965 1$:	cp a,#TK_PLUS 
      00995A 4E A4            [ 1]  966 	jreq 2$
      00995C 0C 44            [ 1]  967 	cp a,#TK_MINUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00995E 44 AB            [ 1]  968 	jrne 4$ 
      009960 80 01            [ 1]  969 	cpl (NEG,sp)
      009961 20 03            [ 2]  970 	jra 4$  
      001962                        971 2$:	
      009961 5B 05 81         [ 4]  972 	call next_token 
      009964                        973 4$:	
      009964 88 CD            [ 1]  974 	cp a,#TK_IFUNC 
      009966 97 BE            [ 1]  975 	jrne 5$ 
      009968 11 01 27         [ 4]  976 	call get_code_addr 
      00996B 03               [ 4]  977 	call (x); result in A:X  
      00996C CC 96            [ 2]  978 	jra 18$ 
      00196F                        979 5$:
      00996E C5 84            [ 1]  980 	cp a,#TK_INTGR
      009970 81 05            [ 1]  981 	jrne 6$
      009971 CD 17 74         [ 4]  982 	call get_int24 
      009971 A6 06            [ 2]  983 	jra 18$
      001978                        984 6$:
      009973 CD 99            [ 1]  985 	cp a,#TK_ARRAY
      009975 64 05            [ 1]  986 	jrne 7$
      009976 CD 19 1B         [ 4]  987 	call get_array_element
      009976 4B 00            [ 2]  988     jra 71$
      001981                        989 7$:
      009978 CD 9A            [ 1]  990 	cp a,#TK_VAR 
      00997A B3 A1            [ 1]  991 	jrne 8$
      00997C 00 27 1A         [ 4]  992 	call get_addr 
      001988                        993 71$:
      00997F A1               [ 1]  994 	ld a,(x)
      009980 84 26            [ 2]  995 	ldw x,(1,x)
      009982 0D 47            [ 2]  996 	jra 18$
      009983                        997 8$:
      009983 0C 01            [ 1]  998 	cp a,#TK_LABEL 
      009985 CD 97            [ 1]  999 	jrne 9$ 
      009987 BE A1 08         [ 4] 1000 	call search_const 
      00998A 27               [ 1] 1001 	clr a 
      00998B EC               [ 2] 1002 	tnzw x 
      00998C A1 00            [ 1] 1003 	jreq 16$
      00998E 27 09 A1         [ 4] 1004 	call get_const_value 
      009991 07 27            [ 2] 1005 	jra 18$
      00199D                       1006 9$: 
      009993 05 55            [ 1] 1007 	cp a,#TK_CFUNC 
      009995 00 03            [ 1] 1008 	jrne 12$
      009997 00 02 84         [ 4] 1009 	call get_code_addr 
      00999A 81               [ 4] 1010 	call(x)
      00999B 5F               [ 1] 1011 	clrw x 
      00999B CD               [ 1] 1012 	rlwa x 
      00999C 99 71            [ 2] 1013 	jra 18$ 	 
      0019A9                       1014 12$:			
      00999E A1 01            [ 1] 1015 	cp a,#TK_LPAREN
      0099A0 27 03            [ 1] 1016 	jrne 16$
      0099A2 CC 96 C5         [ 4] 1017 	call expression
      0019B0                       1018 	_xpush  
      0099A5 90 F6 93 EE      [ 2]    1     subw y,#CELL_SIZE
      0099A9 01 72            [ 1]    2     ld (y),a 
      0099AB A9 00 03         [ 2]    3     ldw (1,y),x 
      0099AE C3 00            [ 1] 1019 	ld a,#TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      0099B0 20 23 05         [ 4] 1020 	call expect
      0019BE                       1021 	_xpop 
      0099B3 A6 0A            [ 1]    1     ld a,(y)
      0099B5 CC               [ 1]    2     ldw x,y 
      0099B6 96 C7            [ 2]    3     ldw x,(1,x)
      0099B8 5D 27 F8 89      [ 2]    4     addw y,#CELL_SIZE 
      0099BC 58 72            [ 2] 1022 	jra 18$	
      0019C9                       1023 16$:
      0099BE FB               [ 1] 1024 	tnz a 
      0099BF 01 1F            [ 1] 1025 	jreq 20$ 
      0019CC                       1026 	_unget_token
      0099C1 01 AE 16 68 72   [ 1]    1      mov in,in.saved  
      0099C6 F0               [ 1] 1027 	clr a 
      0099C7 01 5B            [ 2] 1028 	jra 20$ 
      0019D4                       1029 18$: 
      0099C9 02 81            [ 1] 1030 	tnz (NEG,sp)
      0099CB 27 03            [ 1] 1031 	jreq 19$
      0099CB 52 01 0F         [ 4] 1032 	call neg_ax   
      0019DB                       1033 19$: _xpush 
      0099CE 01 CD 97 BE      [ 2]    1     subw y,#CELL_SIZE
      0099D2 A1 02            [ 1]    2     ld (y),a 
      0099D4 25 73 A1         [ 2]    3     ldw (1,y),x 
      0099D7 10 27            [ 1] 1034      ld a,#TK_INTGR
      0019E6                       1035 20$:
      0019E6                       1036 	_drop VSIZE
      0099D9 08 A1            [ 2]    1     addw sp,#VSIZE 
      0099DB 11               [ 4] 1037 	ret
                                   1038 
                                   1039 
                                   1040 ;-----------------------------------
                                   1041 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1042 ; output:
                                   1043 ;   A    	token attribute 
                                   1044 ;	xstack		value 
                                   1045 ;-----------------------------------
                           000001  1046 	MULOP=1
                           000001  1047 	VSIZE=1
      0019E9                       1048 term:
      0019E9                       1049 	_vars VSIZE
      0099DC 26 07            [ 2]    1     sub sp,#VSIZE 
      0099DE 03 01 20         [ 4] 1050 	call factor
      0099E1 03               [ 1] 1051 	tnz a 
      0099E2 27 3F            [ 1] 1052 	jreq term_exit 
      0019F1                       1053 term01:	 ; check for  operator 
      0099E2 CD 97 BE         [ 4] 1054 	call next_token
      0099E5 6B 01            [ 1] 1055 	ld (MULOP,sp),a
      0099E5 A1 81            [ 1] 1056 	cp a,#CMD_END
      0099E7 26 06            [ 1] 1057 	jrult 8$
      0099E9 CD 97            [ 1] 1058 	and a,#TK_GRP_MASK
      0099EB D8 FD            [ 1] 1059 	cp a,#TK_GRP_MULT
      0099ED 20 65            [ 1] 1060 	jreq 1$
      0099EF 20 23            [ 2] 1061 	jra 8$
      001A02                       1062 1$:	; got *|/|%
      0099EF A1 84 26         [ 4] 1063 	call factor
      0099F2 05 CD            [ 1] 1064 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0099F4 97 F4            [ 1] 1065 	jreq 2$
      0099F6 20 5C 45         [ 2] 1066 	jp syntax_error
      0099F8                       1067 2$:	
      0099F8 A1 05            [ 1] 1068 	ld a,(MULOP,sp) 
      0099FA 26 05            [ 1] 1069 	cp a,#TK_MULT 
      0099FC CD 99            [ 1] 1070 	jrne 3$
      0099FE 9B 20 07         [ 4] 1071 	call mul24 
      009A01 20 DA            [ 2] 1072 	jra term01
      009A01 A1 85            [ 1] 1073 3$: cp a,#TK_DIV 
      009A03 26 08            [ 1] 1074 	jrne 4$ 
      009A05 CD 97 F1         [ 4] 1075 	call div24 
      009A08 20 D1            [ 2] 1076 	jra term01 
      009A08 F6 EE 01         [ 4] 1077 4$: call mod24
      009A0B 20 47            [ 2] 1078 	jra term01 
      009A0D 7B 01            [ 1] 1079 8$: ld a,(MULOP,sp)
      009A0D A1 03            [ 1] 1080 	jreq 9$ 
      001A29                       1081 	_unget_token
      009A0F 26 0C CD 9D 0A   [ 1]    1      mov in,in.saved  
      001A2E                       1082 9$: 
      009A14 4F 5D            [ 1] 1083 	ld a,#TK_INTGR 	
      001A30                       1084 term_exit:
      001A30                       1085 	_drop VSIZE 
      009A16 27 31            [ 2]    1     addw sp,#VSIZE 
      009A18 CD               [ 4] 1086 	ret 
                                   1087 
                                   1088 ;-------------------------------
                                   1089 ;  expr ::= term [['+'|'-'] term]*
                                   1090 ;  result range {-32768..32767}
                                   1091 ;  output:
                                   1092 ;   A    token attribute 
                                   1093 ;   xstack	 result    
                                   1094 ;-------------------------------
                           000001  1095 	OP=1 
                           000001  1096 	VSIZE=1 
      001A33                       1097 expression:
      001A33                       1098 	_vars VSIZE 
      009A19 9C 6C            [ 2]    1     sub sp,#VSIZE 
      009A1B 20 37 E9         [ 4] 1099 	call term
      009A1D 4D               [ 1] 1100 	tnz a 
      009A1D A1 82            [ 1] 1101 	jreq expr_exit 
      001A3B                       1102 1$:	
      009A1F 26 08 CD         [ 4] 1103 	call next_token
      009A22 97 D8            [ 1] 1104 	ld (OP,sp),a 
      009A24 FD 5F            [ 1] 1105 	cp a,#CMD_END 
      009A26 02 20            [ 1] 1106 	jrult 8$ 
      009A28 2B 30            [ 1] 1107 	and a,#TK_GRP_MASK
      009A29 A1 10            [ 1] 1108 	cp a,#TK_GRP_ADD 
      009A29 A1 06            [ 1] 1109 	jreq 2$ 
      009A2B 26 1C            [ 2] 1110 	jra 8$
      001A4C                       1111 2$: 
      009A2D CD 9A B3         [ 4] 1112 	call term
      009A30 72 A2            [ 1] 1113 	cp a,#TK_INTGR
      009A32 00 03            [ 1] 1114 	jreq 3$
      009A34 90 F7 90         [ 2] 1115 	jp syntax_error
      001A56                       1116 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009A37 EF 01            [ 1] 1117 	ld a,(OP,sp)
      009A39 A6 07            [ 1] 1118 	cp a,#TK_PLUS 
      009A3B CD 99            [ 1] 1119 	jrne 4$
      009A3D 64 90 F6         [ 4] 1120 	call add24
      009A40 93 EE            [ 2] 1121 	jra 1$ 
      001A61                       1122 4$:	
      009A42 01 72 A9         [ 4] 1123 	call sub24
      009A45 00 03            [ 2] 1124 	jra 1$
      009A47 20 0B            [ 1] 1125 8$: ld a,(OP,sp)
      009A49 27 05            [ 1] 1126 	jreq 9$ 
      001A6A                       1127 	_unget_token	
      009A49 4D 27 1A 55 00   [ 1]    1      mov in,in.saved  
      001A6F                       1128 9$: 
      009A4E 03 00            [ 1] 1129 	ld a,#TK_INTGR	
      001A71                       1130 expr_exit:
      001A71                       1131 	_drop VSIZE 
      009A50 02 4F            [ 2]    1     addw sp,#VSIZE 
      009A52 20               [ 4] 1132 	ret 
                                   1133 
                                   1134 ;---------------------------------------------
                                   1135 ; rel ::= expr rel_op expr
                                   1136 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1137 ;  relation return  integer , zero is false 
                                   1138 ;  output:
                                   1139 ;    A 		token attribute  
                                   1140 ;	 xstack		value  
                                   1141 ;---------------------------------------------
                           000001  1142 	RELOP=1
                           000001  1143 	VSIZE=1 
      001A74                       1144 relation: 
      001A74                       1145 	_vars VSIZE
      009A53 12 01            [ 2]    1     sub sp,#VSIZE 
      009A54 CD 1A 33         [ 4] 1146 	call expression
      009A54 0D               [ 1] 1147 	tnz a 
      009A55 01 27            [ 1] 1148 	jrne 1$
      009A57 03 CD 82         [ 2] 1149 	jp rel_exit
      001A7F                       1150 1$:	
                                   1151 ; expect rel_op or leave 
      009A5A 54 72 A2         [ 4] 1152 	call next_token 
      009A5D 00 03            [ 1] 1153 	ld (RELOP,sp),a 
      009A5F 90 F7            [ 1] 1154 	and a,#TK_GRP_MASK
      009A61 90 EF            [ 1] 1155 	cp a,#TK_GRP_RELOP 
      009A63 01 A6            [ 1] 1156 	jrne 8$
      001A8A                       1157 2$:	; expect another expression
      009A65 84 1A 33         [ 4] 1158 	call expression
      009A66 A1 84            [ 1] 1159 	cp a,#TK_INTGR
      009A66 5B 01            [ 1] 1160 	jreq 3$
      009A68 81 16 45         [ 2] 1161 	jp syntax_error 
      009A69                       1162 3$:	
      009A69 52 01 CD         [ 4] 1163 	call sub24 
      009A6C 99 CB            [ 1] 1164 	jrne 4$
      009A6E 4D 27 3F 0E      [ 1] 1165 	mov acc8,#2 ; n1==n2
      009A71 20 0C            [ 2] 1166 	jra 6$ 
      001A9F                       1167 4$: 
      009A71 CD 97            [ 1] 1168 	jrsgt 5$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009A73 BE 6B 01 A1      [ 1] 1169 	mov acc8,#4 ; n1<2 
      009A77 02 25            [ 2] 1170 	jra 6$
      001AA7                       1171 5$:
      009A79 2B A4 30 A1      [ 1] 1172 	mov acc8,#1 ; n1>n2 
      001AAB                       1173 6$:
      009A7D 20               [ 1] 1174 	clrw x 
      009A7E 27 02 20         [ 1] 1175 	ld a, acc8  
      009A81 23 01            [ 1] 1176 	and a,(RELOP,sp)
      009A82 27 01            [ 1] 1177 	jreq 7$
      009A82 CD               [ 1] 1178 	incw x
      001AB4                       1179 7$:	_store_top   
      009A83 99 CB            [ 1]    1     ld (y),a 
      009A85 A1 84 27         [ 2]    2     ldw (1,y),x     
      009A88 03 CC            [ 2] 1180 	jra 10$  	
      009A8A 96 C5            [ 1] 1181 8$: ld a,(RELOP,sp)
      009A8C 27 05            [ 1] 1182 	jreq 10$
      001ABF                       1183 	_unget_token
      009A8C 7B 01 A1 20 26   [ 1]    1      mov in,in.saved  
      001AC4                       1184 10$:
      009A91 05 CD            [ 1] 1185 	ld a,#TK_INTGR
      001AC6                       1186 rel_exit:
      001AC6                       1187 	_drop VSIZE
      009A93 82 A7            [ 2]    1     addw sp,#VSIZE 
      009A95 20               [ 4] 1188 	ret 
                                   1189 
                                   1190 ;--------------------------------
                                   1191 ; BASIC: SHOW 
                                   1192 ; print stack content in hexadecimal bytes 
                                   1193 ; 16 bytes per row 
                                   1194 ;--------------------------------
                           000001  1195 	DEPTH=1
                           000002  1196 	CNTR=2
                           000002  1197 	VSIZE=2
      001AC9                       1198 show:
      001AC9                       1199 	_vars VSIZE 
      009A96 DA A1            [ 2]    1     sub sp,#VSIZE 
      009A98 21 26            [ 1] 1200 	clr (CNTR,sp)
      009A9A 05 CD 83         [ 2] 1201 	ldw x,#cstk_prompt
      009A9D 81 20 D1         [ 4] 1202 	call puts 
      009AA0 CD 84            [ 2] 1203 	pushw y 
      009AA2 2E 20 CC         [ 2] 1204 	ldw x,#XSTACK_EMPTY
      009AA5 7B 01 27         [ 2] 1205 	subw x,(1,sp)
      001ADB                       1206 	_drop 2
      009AA8 05 55            [ 2]    1     addw sp,#2 
      009AAA 00 03            [ 1] 1207 	ld a,#CELL_SIZE 
      009AAC 00               [ 2] 1208 	div x,a  
      009AAD 02               [ 1] 1209 	ld a,xl  
      009AAE 6B 01            [ 1] 1210     ld (DEPTH,sp),a 
      009AAE A6 84 00 18      [ 2] 1211 	ldw ptr16,y 
      009AB0                       1212 1$: 
      009AB0 5B 01 81 18      [ 4] 1213 	ld a,[ptr16]
      009AB3 72 5C 00 19      [ 1] 1214 	inc ptr8 
      009AB3 52 01 CD 9A      [ 5] 1215 	ldw x,[ptr16]
      009AB7 69 4D 27 36      [ 1] 1216 	inc ptr8 
      009ABB 72 5C 00 19      [ 1] 1217 	inc ptr8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009ABB CD 97 BE         [ 1] 1218 	ld acc24,a 
      009ABE 6B 01 A1         [ 2] 1219 	ldw acc16,x 
      009AC1 02 25 22         [ 4] 1220 	call prt_acc24
      009AC4 A4 30            [ 1] 1221 	ld a,#SPACE 
      009AC6 A1 10 27         [ 4] 1222 	call putc 
      009AC9 02 20            [ 1] 1223 	inc (CNTR,sp)
      009ACB 1A 02            [ 1] 1224 	ld a,(CNTR,sp)
      009ACC 11 01            [ 1] 1225 	cp a,(DEPTH,sp)
      009ACC CD 9A            [ 1] 1226 	jrmi 1$
      009ACE 69 A1            [ 1] 1227 	ld a,#CR 
      009AD0 84 27 03         [ 4] 1228 	call putc  
      001B16                       1229 	_drop VSIZE 
      009AD3 CC 96            [ 2]    1     addw sp,#VSIZE 
      009AD5 C5               [ 4] 1230 	ret
                                   1231 
      009AD6 0A 63 6F 6E 74 65 6E  1232 cstk_prompt: .asciz "\ncontent of expression stack from top to bottom:\n"
             74 20 6F 66 20 65 78
             70 72 65 73 73 69 6F
             6E 20 73 74 61 63 6B
             20 66 72 6F 6D 20 74
             6F 70 20 74 6F 20 62
             6F 74 74 6F 6D 3A 0A
             00
                                   1233 
                                   1234 
                                   1235 ;--------------------------------------------
                                   1236 ; BASIC: HEX 
                                   1237 ; select hexadecimal base for integer print
                                   1238 ;---------------------------------------------
      001B4B                       1239 hex_base:
      009AD6 7B 01 A1 10      [ 1] 1240 	mov base,#16 
      009ADA 26               [ 4] 1241 	ret 
                                   1242 
                                   1243 ;--------------------------------------------
                                   1244 ; BASIC: DEC 
                                   1245 ; select decimal base for integer print
                                   1246 ;---------------------------------------------
      001B50                       1247 dec_base:
      009ADB 05 CD 81 E3      [ 1] 1248 	mov base,#10
      009ADF 20               [ 4] 1249 	ret 
                                   1250 
                                   1251 ;------------------------
                                   1252 ; BASIC: FREE 
                                   1253 ; return free size in RAM 
                                   1254 ; output:
                                   1255 ;   A:x		size 
                                   1256 ;--------------------------
      001B55                       1257 free:
      009AE0 DA 89            [ 2] 1258 	pushw y 
      009AE1 4F               [ 1] 1259 	clr a 
      009AE1 CD 82 08         [ 2] 1260 	ldw x,#tib 
      009AE4 20 D5 7B 01      [ 2] 1261 	ldw y,txtbgn 
      009AE8 27 05 55 00      [ 2] 1262 	cpw y,#app_space
      009AEC 03 00            [ 1] 1263 	jrult 1$
      009AEE 02 00 80         [ 2] 1264 	subw x,#free_ram 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009AEF 20 04            [ 2] 1265 	jra 2$ 
      001B6A                       1266 1$:	
      009AEF A6 84 00 1C      [ 2] 1267 	subw x,txtend
      009AF1 90 85            [ 2] 1268 2$:	popw y 
      009AF1 5B               [ 4] 1269 	ret 
                                   1270 
                                   1271 ;------------------------------
                                   1272 ; BASIC: SIZE 
                                   1273 ; command that print 
                                   1274 ; program start addres and size 
                                   1275 ;------------------------------
      001B71                       1276 cmd_size:
      009AF2 01 81 0A         [ 1] 1277 	push base 
      009AF4 AE 1D BD         [ 2] 1278 	ldw x,#PROG_ADDR 
      009AF4 52 01 CD         [ 4] 1279 	call puts 
      009AF7 9A B3 4D         [ 2] 1280 	ldw x,txtbgn     
      009AFA 26 03 CC 9B      [ 1] 1281 	mov base,#16 
      009AFE 46 17 8A         [ 4] 1282 	call prt_i16
      009AFF 32 00 0A         [ 1] 1283 	pop base 
      009AFF CD 97 BE         [ 2] 1284 	ldw x,#PROG_SIZE 
      009B02 6B 01 A4         [ 4] 1285 	call puts 
      009B05 30 A1 30         [ 2] 1286 	ldw x,txtend 
      009B08 26 31 00 1A      [ 2] 1287 	subw x,txtbgn 
      009B0A CD 17 8A         [ 4] 1288 	call prt_i16
      009B0A CD 9A B3         [ 2] 1289 	ldw x,#STR_BYTES 
      009B0D A1 84 27         [ 4] 1290 	call puts  
      009B10 03               [ 4] 1291 	ret 
                                   1292 
                                   1293 
                                   1294 ;------------------------
                                   1295 ; BASIC: UBOUND  
                                   1296 ; return array variable size 
                                   1297 ; and set 'array_size' variable 
                                   1298 ; output:
                                   1299 ;   A:X 	array_size
                                   1300 ;--------------------------
      001B9E                       1301 ubound:
      009B11 CC 96 C5         [ 4] 1302 	call free 
      009B14 A6 03            [ 1] 1303 	ld a,#CELL_SIZE 
      009B14 CD               [ 4] 1304 	mul x,a 
      009B15 82 08 26         [ 2] 1305 	ldw array_size,x
      009B18 06               [ 1] 1306 	clr a 
      009B19 35               [ 4] 1307 	ret 
                                   1308 
                                   1309 ;-----------------------------
                                   1310 ; BASIC: LET var=expr 
                                   1311 ; variable assignement 
                                   1312 ; output:
                                   1313 ;   A 		TK_NONE 
                                   1314 ;-----------------------------
      001BA9                       1315 let::
      009B1A 02 00 0F         [ 4] 1316 	call next_token 
      009B1D 20 0C            [ 1] 1317 	cp a,#TK_VAR 
      009B1F 27 0C            [ 1] 1318 	jreq let_var
      009B1F 2C 06            [ 1] 1319 	cp a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009B21 35 04            [ 1] 1320 	jreq  let_array
      009B23 00 0F 20         [ 2] 1321 	jp syntax_error
      001BB7                       1322 let_array:
      009B26 04 19 1B         [ 4] 1323 	call get_array_element
      009B27 20 03            [ 2] 1324 	jra let_eval 
      001BBC                       1325 let_var:
      009B27 35 01 00         [ 4] 1326 	call get_addr
      001BBF                       1327 let_eval:
      009B2A 0F 00 18         [ 2] 1328 	ldw ptr16,x  ; variable address 
      009B2B CD 17 3E         [ 4] 1329 	call next_token 
      009B2B 5F C6            [ 1] 1330 	cp a,#TK_EQUAL
      009B2D 00 0F            [ 1] 1331 	jreq 1$
      009B2F 14 01 27         [ 2] 1332 	jp syntax_error
      001BCC                       1333 1$:	
      009B32 01 5C 90         [ 4] 1334 	call expression    
      009B35 F7 90            [ 1] 1335 	cp a,#TK_INTGR 
      009B37 EF 01            [ 1] 1336 	jreq 2$
      009B39 20 09 7B         [ 2] 1337 	jp syntax_error
      001BD6                       1338 2$:	
      001BD6                       1339 	_xpop ; value 
      009B3C 01 27            [ 1]    1     ld a,(y)
      009B3E 05               [ 1]    2     ldw x,y 
      009B3F 55 00            [ 2]    3     ldw x,(1,x)
      009B41 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      009B44                       1340 3$:
      009B44 A6 84 00 18      [ 4] 1341 	ld [ptr16],a
      009B46 72 5C 00 19      [ 1] 1342 	inc ptr8  
      009B46 5B 01 81 18      [ 5] 1343 	ldw [ptr16],x 
      009B49 81               [ 4] 1344 	ret 
                                   1345 
                                   1346 
                                   1347 ;--------------------------
                                   1348 ; return constant value 
                                   1349 ; from it's record address
                                   1350 ; input:
                                   1351 ;	X	*const record 
                                   1352 ; output:
                                   1353 ;   A:X   const  value
                                   1354 ;--------------------------
      001BEC                       1355 get_const_value: ; -- i 
      009B49 52               [ 1] 1356 	ld a,(x) ; record size 
      009B4A 02 0F            [ 1] 1357 	sub a,#3 ; * value 
      009B4C 02               [ 1] 1358 	push a 
      009B4D AE 9B            [ 1] 1359 	push #0 
      009B4F 99 CD 89         [ 2] 1360 	addw x,(1,sp)
      009B52 F5               [ 1] 1361 	ld a,(x)
      009B53 90 89            [ 2] 1362 	ldw x,(1,x)
      001BF8                       1363 	_drop 2
      009B55 AE 17            [ 2]    1     addw sp,#2 
      009B57 73               [ 4] 1364 	ret 
                                   1365 
                                   1366 
                                   1367 ;--------------------------
                                   1368 ; list constants in EEPROM 
                                   1369 ; call when using LIST \C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1370 ;-------------------------
                           000001  1371 	COUNT=1
                           000003  1372 	YTEMP=3
                           000004  1373 	VSIZE=4 
      001BFB                       1374 list_const:
      009B58 72 F0            [ 2] 1375 	pushw y 
      001BFD                       1376 	_vars 4 
      009B5A 01 5B            [ 2]    1     sub sp,#4 
      009B5C 02               [ 1] 1377 	clrw x 
      009B5D A6 03            [ 2] 1378 	ldw (COUNT,sp),x  
      009B5F 62 9F 6B 01      [ 2] 1379 	ldw Y,#EEPROM_BASE 
      009B63 90 CF 00 19      [ 2] 1380 1$:	cpw y,free_eeprom 
      009B67 24 30            [ 1] 1381 	jruge 9$
      009B67 72 C6            [ 2] 1382     ldw (YTEMP,sp),y 
      009B69 00               [ 1] 1383 	ldw x,y
      009B6A 19               [ 1] 1384 	incw x 
      009B6B 72 5C 00         [ 4] 1385 	call puts  
      009B6E 1A 72            [ 1] 1386 	ld a,#'= 
      009B70 CE 00 19         [ 4] 1387 	call putc 
      009B73 72 5C            [ 2] 1388 	ldw x,(YTEMP,sp)
      009B75 00 1A 72         [ 4] 1389 	call get_const_value 
      009B78 5C 00 1A         [ 1] 1390 	ld acc24,a 
      009B7B C7 00 0D         [ 2] 1391 	ldw acc16,x 
      009B7E CF 00 0E         [ 4] 1392 	call prt_acc24
      009B81 CD 98            [ 2] 1393 	ldw x,(COUNT,sp)
      009B83 1A               [ 1] 1394 	incw x 
      009B84 A6 20            [ 2] 1395 	ldw (COUNT,sp),x 
      009B86 CD 89 98 0C      [ 1] 1396 	clr acc16 
      009B8A 02 7B            [ 2] 1397 	ldw y,(YTEMP,sp)
      009B8C 02 11            [ 1] 1398 	ld a,(y)
      009B8E 01 2B D6         [ 1] 1399 	ld acc8,a
      009B91 A6 0D CD 89      [ 2] 1400 	addw y,acc16 
      009B95 98 5B            [ 2] 1401 	jra 1$ 
      001C3C                       1402 9$:	
      009B97 02 81            [ 2] 1403 	ldw x,(COUNT,sp)
      009B99 0A 63 6F         [ 4] 1404 	call prt_i16 
      009B9C 6E 74 65         [ 2] 1405 	ldw x,#CONST_COUNT 
      009B9F 6E 74 20         [ 4] 1406 	call puts 
      001C47                       1407 	_drop VSIZE 
      009BA2 6F 66            [ 2]    1     addw sp,#VSIZE 
      009BA4 20 65            [ 2] 1408 	popw y 
      009BA6 78               [ 4] 1409 	ret 
                                   1410 
      009BA7 70 72 65 73 73 69 6F  1411 CONST_COUNT: .asciz "constants in EEPROM\n"
             6E 20 73 74 61 63 6B
             20 66 72 6F 6D 20 74
                                   1412 
                                   1413 
                                   1414 ;--------------------------
                                   1415 ; BASIC: EEFREE 
                                   1416 ; eeprom_free 
                                   1417 ; search end of data  
                                   1418 ; in EEPROM 
                                   1419 ; input:
                                   1420 ;    none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal  6F-Bits]



                                   1421 ; output:
                                   1422 ;    A:X     address free
                                   1423 ;-------------------------
      001C61                       1424 func_eefree:
      009BBD 70 20 74         [ 2] 1425 	ldw x,#EEPROM_BASE 
      009BC0 6F 20 62 6F      [ 1] 1426 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009BC4 74 74 6F         [ 2] 1427     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009BC7 6D 3A            [ 1] 1428 	jruge 8$ ; no free space 
      009BC9 0A               [ 1] 1429 2$: ld a,(x)
      009BCA 00 0C            [ 1] 1430 	jrne 3$
      009BCB 5C               [ 1] 1431 	incw x 
      009BCB 35 10 00 0B      [ 1] 1432 	dec acc8 
      009BCF 81 F6            [ 1] 1433 	jrne 2$
      009BD0 1D 00 08         [ 2] 1434 	subw x,#8 
      009BD0 35 0A            [ 2] 1435 	jra 9$  
      009BD2 00               [ 1] 1436 3$: ld a,(x)
      009BD3 0B               [ 1] 1437 	incw x
      009BD4 81               [ 1] 1438 	tnz a  
      009BD5 26 FB            [ 1] 1439 	jrne 3$
      009BD5 90               [ 2] 1440 	decw x   
      009BD6 89 4F            [ 2] 1441 	jra 1$ 
      009BD8 AE               [ 1] 1442 8$: clrw x ; no free space 
      009BD9 16               [ 1] 1443 9$: clr a 
      009BDA 68 90 CE         [ 2] 1444 	ldw free_eeprom,x ; save in system variable 
      009BDD 00               [ 4] 1445 	ret 
                                   1446 
                           000005  1447 CONST_REC_MIN_BYTES=5 
                                   1448 ;--------------------------
                                   1449 ; search constant name 
                                   1450 ; format of constant record  
                                   1451 ;   .byte record length 
                                   1452 ;         = strlen(name)+5 
                                   1453 ;   .asciz name (variable length)
                                   1454 ;   .int24 value (3 bytes )
                                   1455 ; a constant record use 7+ bytes
                                   1456 ; constants are saved in EEPROM  
                                   1457 ; input:
                                   1458 ;    X     *name
                                   1459 ; output:
                                   1460 ;    X     address|0
                                   1461 ; use:
                                   1462 ;   A,Y, acc16 
                                   1463 ;-------------------------
                           000001  1464 	NAMEPTR=1 ; target name pointer 
                           000003  1465 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1466 	RECLEN=5  ; record length of target
                           000005  1467 	VSIZE=5
      001C8A                       1468 search_const:
      009BDE 1B 90            [ 2] 1469 	pushw y 
      001C8C                       1470 	_vars VSIZE
      009BE0 A3 B6            [ 2]    1     sub sp,#VSIZE 
      009BE2 00 25 05 1D      [ 1] 1471 	clr acc16 
      009BE6 00 80 20         [ 4] 1472 	call strlen 
      009BE9 04 05            [ 1] 1473 	add a,#CONST_REC_MIN_BYTES 
      009BEA 6B 05            [ 1] 1474 	ld (RECLEN,sp),a    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009BEA 72 B0            [ 2] 1475 	ldw (NAMEPTR,sp),x
      009BEC 00 1D 90 85      [ 2] 1476 	ldw y,#EEPROM_BASE 
      009BF0 81 01            [ 2] 1477 1$:	ldw x,(NAMEPTR,sp)
      009BF1 17 03            [ 2] 1478 	ldw (EEPTR,sp),y
      009BF1 3B 00 0B AE      [ 2] 1479 	cpw y, free_eeprom 
      009BF5 9E 3D            [ 1] 1480 	jruge 7$ ; no match found 
      009BF7 CD 89            [ 1] 1481 	ld a,(y)
      009BF9 F5 CE            [ 1] 1482 	cp a,(RECLEN,sp)
      009BFB 00 1B            [ 1] 1483 	jrne 2$ 
      009BFD 35 10            [ 1] 1484 	incw y 
      009BFF 00 0B CD         [ 4] 1485 	call strcmp
      009C02 98 0A            [ 1] 1486 	jrne 8$ ; match found 
      001CB6                       1487 2$: ; skip this one 	
      009C04 32 00            [ 2] 1488 	ldW Y,(EEPTR,sp)
      009C06 0B AE            [ 1] 1489 	ld a,(y)
      009C08 9E 4F CD         [ 1] 1490 	ld acc8,a 
      009C0B 89 F5 CE 00      [ 2] 1491 	addw y,acc16 
      009C0F 1D 72            [ 2] 1492 	jra 1$  
      001CC3                       1493 7$: ; no match found 
      009C11 B0 00            [ 1] 1494 	clr (EEPTR,sp)
      009C13 1B CD            [ 1] 1495 	clr (EEPTR+1,sp)
      001CC7                       1496 8$: ; match found 
      009C15 98 0A            [ 2] 1497 	ldw x,(EEPTR,sp) ; record address 
      001CC9                       1498 9$:	_DROP VSIZE
      009C17 AE 9E            [ 2]    1     addw sp,#VSIZE 
      009C19 60 CD            [ 2] 1499 	 popw y 
      009C1B 89               [ 4] 1500 	 ret 
                                   1501 
                                   1502 
                                   1503 ;--------------------------------------------
                                   1504 ; BASIC: CONST name=value [, name=value]*
                                   1505 ; define constant(s) saved in EEPROM
                                   1506 ;--------------------------------------------
                           000001  1507 	CNAME=1 
                           000003  1508 	BUFPTR=3
                           000005  1509 	RECLEN=5
                           000005  1510 	VSIZE=5
      001CCE                       1511 cmd_const:
      009C1C F5 81            [ 2] 1512 	pushw y 
      009C1E                       1513 	_vars VSIZE 
      009C1E CD 9B            [ 2]    1     sub sp,#VSIZE 
      009C20 D5 A6 03 42      [ 1] 1514 	bres flags,#FUPDATE 
      009C24 CF 00 20         [ 4] 1515 	call next_token 
      009C27 4F 81            [ 1] 1516 	cp a,#TK_CHAR 
      009C29 26 0E            [ 1] 1517 	jrne 1$
      009C29 CD               [ 1] 1518 	ld a,xl
      009C2A 97 BE            [ 1] 1519 	and a,#0xDF 
      009C2C A1 85            [ 1] 1520 	cp a,#'U 
      009C2E 27 0C            [ 1] 1521 	jrne 2$
      009C30 A1 05 27 03      [ 1] 1522 	bset flags,#FUPDATE 
      001CE8                       1523 0$:
      009C34 CC 96 C5         [ 4] 1524 	call next_token 
      009C37                       1525 1$:	
      009C37 CD 99            [ 1] 1526 	cp a,#TK_LABEL 
      009C39 9B 20            [ 1] 1527 	jreq 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001CEF                       1528 2$:	 
      009C3B 03 16 45         [ 2] 1529 	jp syntax_error 
      009C3C                       1530 3$: 
      009C3C CD 97            [ 2] 1531 	ldw (CNAME,sp),x ; *const_name
      009C3E F1 01            [ 2] 1532 	ldw x,(CNAME,sp)
      009C3F CD 13 89         [ 4] 1533 	call strlen 
      009C3F CF 00            [ 1] 1534 	add a,#CONST_REC_MIN_BYTES 
      009C41 19 CD            [ 1] 1535 	ld (RECLEN,sp),a 
                                   1536 ; copy name in buffer  
      009C43 97 BE            [ 2] 1537 	ldw y,(CNAME,sp) 
      009C45 A1 32 27         [ 2] 1538 	ldw x,#tib  
      009C48 03 CC            [ 1] 1539 	ld a,(RECLEN,sp)
      009C4A 96               [ 1] 1540 	ld (x),a 
      009C4B C5               [ 1] 1541 	incw x  
      009C4C CD 13 A5         [ 4] 1542 	call strcpy 
      009C4C CD 9A            [ 2] 1543 	ldw (BUFPTR,sp),x 
                                   1544 ; x not updated by strcpy 
                                   1545 ; BUFPTR must be incremented 
                                   1546 ; to point after name 
      009C4E B3 A1            [ 1] 1547 	ld a,(RECLEN,sp)
      009C50 84 27            [ 1] 1548 	sub a,#CONST_REC_MIN_BYTES-1
      009C52 03 CC            [ 1] 1549 	add a,(BUFPTR+1,sp) ; 
      009C54 96 C5            [ 1] 1550 	ld (BUFPTR+1,sp),a 
      009C56 24 02            [ 1] 1551 	jrnc 4$
      009C56 90 F6            [ 1] 1552     inc (BUFPTR,sp) 
      001D17                       1553 4$:
      009C58 93 EE            [ 1] 1554 	ld a,#TK_EQUAL 
      009C5A 01 72 A9         [ 4] 1555 	call expect 
      009C5D 00 03 33         [ 4] 1556 	call expression 
      009C5F A1 84            [ 1] 1557 	cp a,#TK_INTGR 
      009C5F 72 C7            [ 1] 1558 	jreq 5$ 
      009C61 00 19 72         [ 2] 1559 	jp syntax_error 
      009C64 5C 00            [ 2] 1560 5$:	ldw y,(BUFPTR,sp)
      001D28                       1561 	_xpop ; get value from xstack 
      009C66 1A 72            [ 1]    1     ld a,(y)
      009C68 CF               [ 1]    2     ldw x,y 
      009C69 00 19            [ 2]    3     ldw x,(1,x)
      009C6B 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C6C 90 F7            [ 1] 1562 	ld (y),a 
      009C6C F6 A0 03         [ 2] 1563 	ldw (1,y),x 
                                   1564 ; record completed in buffer 
                                   1565 ; check if constant already exist 
                                   1566 ; if so update value if \U option set 
      009C6F 88 4B 00 72      [ 1] 1567 	clr farptr 
      009C73 FB 01            [ 2] 1568 	ldw x,(CNAME,sp)
      009C75 F6 EE 01         [ 4] 1569 	call search_const 
      009C78 5B               [ 2] 1570 	tnzw x 
      009C79 02 81            [ 1] 1571 	jreq 6$ ; new constant  
      009C7B 72 0F 00 21 1B   [ 2] 1572 	btjf flags,#FUPDATE,8$
      009C7B 90 89            [ 2] 1573 	jra 7$	
      001D49                       1574 6$:	
      009C7D 52 04 5F         [ 2] 1575 	ldw x,free_eeprom  
      001D4C                       1576 7$:	
      009C80 1F 01 90         [ 2] 1577 	ldw farptr+1,x 
      009C83 AE 40 00         [ 2] 1578 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009C86 90 C3            [ 1] 1579 	ld a,(RECLEN,sp)
      009C88 00 24 24         [ 4] 1580 	call write_nbytes
                                   1581 ; update free_eeprom 
      009C8B 30               [ 1] 1582 	clrw x 
      009C8C 17 03            [ 1] 1583 	ld a,(RECLEN,sp)
      009C8E 93               [ 1] 1584 	ld xl,a 
      009C8F 5C CD 89 F5      [ 2] 1585 	addw x,free_eeprom 
      009C93 A6 3D CD         [ 2] 1586 	ldw free_eeprom,x
      001D62                       1587 8$:
      009C96 89 98 1E         [ 4] 1588 	call next_token 
      009C99 03 CD            [ 1] 1589 	cp a,#TK_COMMA 
      009C9B 9C 6C            [ 1] 1590 	jrne 9$
      009C9D C7 00 0D         [ 2] 1591 	jp 0$ 
      001D6C                       1592 9$: 
      001D6C                       1593 	_unget_token    
      009CA0 CF 00 0E CD 98   [ 1]    1      mov in,in.saved  
      001D71                       1594 10$: 
      001D71                       1595 	_drop VSIZE 
      009CA5 1A 1E            [ 2]    1     addw sp,#VSIZE 
      009CA7 01 5C            [ 2] 1596 	popw y 
      009CA9 1F               [ 4] 1597 	ret 
                                   1598 
                                   1599 
                                   1600 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1601 ; return program size 
                                   1602 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001D76                       1603 prog_size:
      009CAA 01 72 5F         [ 2] 1604 	ldw x,txtend 
      009CAD 00 0E 16 03      [ 2] 1605 	subw x,txtbgn 
      009CB1 90               [ 4] 1606 	ret 
                                   1607 
                                   1608 ;----------------------------
                                   1609 ; print program information 
                                   1610 ;---------------------------
      001D7E                       1611 program_info: 
      009CB2 F6 C7 00         [ 2] 1612 	ldw x,#PROG_ADDR 
      009CB5 0F 72 B9         [ 4] 1613 	call puts 
      009CB8 00 0E 20         [ 2] 1614 	ldw x,txtbgn 
      009CBB CA 10 00 0A      [ 1] 1615 	mov base,#16 
      009CBC CD 17 8A         [ 4] 1616 	call prt_i16
      009CBC 1E 01 CD 98      [ 1] 1617 	mov base,#10  
      009CC0 0A AE 9C         [ 2] 1618 	ldw x,#PROG_SIZE
      009CC3 CC CD 89         [ 4] 1619 	call puts 
      009CC6 F5 5B 04         [ 4] 1620 	call prog_size 
      009CC9 90 85 81         [ 4] 1621 	call prt_i16 
      009CCC 63 6F 6E         [ 2] 1622 	ldw x,#STR_BYTES 
      009CCF 73 74 61         [ 4] 1623 	call puts
      009CD2 6E 74 73         [ 2] 1624 	ldw x,txtbgn
      009CD5 20 69 6E         [ 2] 1625 	cpw x,#app 
      009CD8 20 45            [ 1] 1626 	jrult 2$
      009CDA 45 50 52         [ 2] 1627 	ldw x,#FLASH_MEM 
      009CDD 4F 4D            [ 2] 1628 	jra 3$
      009CDF 0A 00 F7         [ 2] 1629 2$: ldw x,#RAM_MEM 	 
      009CE1 CD 09 75         [ 4] 1630 3$:	call puts 
      009CE1 AE 40            [ 1] 1631 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009CE3 00 35 08         [ 4] 1632 	call putc
      009CE6 00               [ 4] 1633 	ret 
                                   1634 
      009CE7 0F A3 47 F8 24 17 F6  1635 PROG_ADDR: .asciz "program address: "
             26 0C 5C 72 5A 00 0F
             26 F6 1D 00
      009CF9 08 20 09 F6 5C 4D 26  1636 PROG_SIZE: .asciz ", program size: "
             FB 5A 20 E0 5F 4F CF
             00 24 81
      009D0A 62 79 74 65 73 00     1637 STR_BYTES: .asciz "bytes" 
      009D0A 90 89 52 05 72 5F 00  1638 FLASH_MEM: .asciz " in FLASH memory" 
             0E CD 94 09 AB 05 6B
             05 1F 01
      009D1B 90 AE 40 00 1E 01 17  1639 RAM_MEM:   .asciz " in RAM memory" 
             03 90 C3 00 24 24 1A
             90
                                   1640 
                                   1641 
                                   1642 ;----------------------------
                                   1643 ; BASIC: LIST [[start][,end]]
                                   1644 ; list program lines 
                                   1645 ; form start to end 
                                   1646 ; if empty argument list then 
                                   1647 ; list all.
                                   1648 ;----------------------------
                           000001  1649 	FIRST=1
                           000003  1650 	LAST=3 
                           000005  1651 	LN_PTR=5
                           000006  1652 	VSIZE=6 
      001E06                       1653 list:
      009D2A F6 11 05 26 07   [ 2] 1654 	btjf flags,#FRUN,0$
      009D2F 90 5C            [ 1] 1655 	ld a,#ERR_CMD_ONLY
      009D31 CD 94 14         [ 2] 1656 	jp tb_error
      001E10                       1657 0$:	 
      009D34 26 11 3E         [ 4] 1658 	call next_token 
      009D36 A1 04            [ 1] 1659 	cp a,#TK_CHAR 
      009D36 16 03            [ 1] 1660 	jrne 2$
      009D38 90 F6 C7         [ 4] 1661 	call get_char 
      009D3B 00 0F            [ 1] 1662 	and a,#0xDF 
      009D3D 72 B9            [ 1] 1663 	cp a,#'C 
      009D3F 00 0E            [ 1] 1664 	jrne 1$
      009D41 20 DC FB         [ 4] 1665 	call list_const
      009D43 81               [ 4] 1666 	ret 
      009D43 0F 03 0F         [ 2] 1667 1$: jp syntax_error 
      001E27                       1668 2$:	_unget_token 
      009D46 04 00 02 00 01   [ 1]    1      mov in,in.saved  
      009D47 CD 1D 76         [ 4] 1669 	call prog_size 
      009D47 1E 03            [ 1] 1670 	jrugt 3$
      009D49 5B               [ 4] 1671 	ret 
      001E32                       1672 3$: _vars VSIZE
      009D4A 05 90            [ 2]    1     sub sp,#VSIZE 
      009D4C 85 81 1A         [ 2] 1673 	ldw x,txtbgn 
      009D4E 1F 05            [ 2] 1674 	ldw (LN_PTR,sp),x 
      009D4E 90               [ 2] 1675 	ldw x,(x) 
      009D4F 89 52            [ 2] 1676 	ldw (FIRST,sp),x ; list from first line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009D51 05 72 1F         [ 2] 1677 	ldw x,#MAX_LINENO ; biggest line number 
      009D54 00 22            [ 2] 1678 	ldw (LAST,sp),x 
      009D56 CD 97 BE         [ 4] 1679 	call arg_list
      009D59 A1               [ 1] 1680 	tnz a
      009D5A 04 26            [ 1] 1681 	jreq list_loop 
      009D5C 0E 9F            [ 1] 1682 	cp a,#2 
      009D5E A4 DF            [ 1] 1683 	jreq 4$
      009D60 A1 55            [ 1] 1684 	cp a,#1 
      009D62 26 0B            [ 1] 1685 	jreq first_line 
      009D64 72 1E 00         [ 2] 1686 	jp syntax_error 
      009D67 22               [ 2] 1687 4$:	popw x 
      009D68 1F 05            [ 2] 1688 	ldw (LAST+2,sp),x 
      001E55                       1689 first_line:
      009D68 CD               [ 2] 1690 	popw x
      009D69 97 BE            [ 2] 1691 	ldw (FIRST,sp),x 
      009D6B                       1692 lines_skip:
      009D6B A1 03 27         [ 2] 1693 	ldw x,txtbgn
      009D6E 03 05            [ 2] 1694 2$:	ldw (LN_PTR,sp),x 
      009D6F C3 00 1C         [ 2] 1695 	cpw x,txtend 
      009D6F CC 96            [ 1] 1696 	jrpl list_exit 
      009D71 C5               [ 2] 1697 	ldw x,(x) ;line# 
      009D72 13 01            [ 2] 1698 	cpw x,(FIRST,sp)
      009D72 1F 01            [ 1] 1699 	jrpl list_loop 
      009D74 1E 01            [ 2] 1700 	ldw x,(LN_PTR,sp) 
      009D76 CD 94            [ 1] 1701 	ld a,(2,x)
      009D78 09 AB 05         [ 1] 1702 	ld acc8,a 
      009D7B 6B 05 16 01      [ 1] 1703 	clr acc16 
      009D7F AE 16 68 7B      [ 2] 1704 	addw x,acc16
      009D83 05 F7            [ 2] 1705 	jra 2$ 
                                   1706 ; print loop
      001E78                       1707 list_loop:
      009D85 5C CD            [ 2] 1708 	ldw x,(LN_PTR,sp)
      009D87 94 25            [ 1] 1709 	ld a,(2,x) 
      009D89 1F 03 7B         [ 4] 1710 	call prt_basic_line
      009D8C 05 A0            [ 2] 1711 	ldw x,(LN_PTR,sp)
      009D8E 04 1B            [ 1] 1712 	ld a,(2,x)
      009D90 04 6B 04         [ 1] 1713 	ld acc8,a 
      009D93 24 02 0C 03      [ 1] 1714 	clr acc16 
      009D97 72 BB 00 0D      [ 2] 1715 	addw x,acc16
      009D97 A6 32 CD         [ 2] 1716 	cpw x,txtend 
      009D9A 99 64            [ 1] 1717 	jrpl list_exit
      009D9C CD 9A            [ 2] 1718 	ldw (LN_PTR,sp),x
      009D9E B3               [ 2] 1719 	ldw x,(x)
      009D9F A1 84            [ 2] 1720 	cpw x,(LAST,sp)  
      009DA1 27 03            [ 1] 1721 	jrslt list_loop
      001E9A                       1722 list_exit:
      009DA3 CC 96 C5 16 03   [ 1] 1723 	mov in,count 
      009DA8 90 F6 93         [ 2] 1724 	ldw x,#pad 
      009DAB EE 01 72         [ 2] 1725 	ldw basicptr,x 
      001EA5                       1726 	_drop VSIZE 
      009DAE A9 00            [ 2]    1     addw sp,#VSIZE 
      009DB0 03 90 F7         [ 4] 1727 	call program_info 
      009DB3 90               [ 4] 1728 	ret
                                   1729 
                                   1730 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1731 ;--------------------------
                                   1732 ; BASIC: EDIT 
                                   1733 ;  copy program in FLASH 
                                   1734 ;  to RAM for edition 
                                   1735 ;-------------------------
      001EAB                       1736 edit:
      009DB4 EF 01 72         [ 4] 1737 	call qsign 
      009DB7 5F 00            [ 1] 1738 	jreq 1$ 
      009DB9 18 1E 01         [ 2] 1739 	ldw x,#NOT_SAVED 
      009DBC CD 9D 0A         [ 4] 1740 	call puts 
      009DBF 5D               [ 4] 1741 	ret 
      001EB7                       1742 1$: 
      009DC0 27 07 72 0F      [ 2] 1743 	ldw y,#app_sign ; source address 
      009DC4 00 22 1B         [ 2] 1744     ldw x,app_size  
      009DC7 20 03 04         [ 2] 1745 	addw x,#4 
      009DC9 CF 00 0D         [ 2] 1746 	ldw acc16,x  ; bytes to copy 
      009DC9 CE 00 24         [ 2] 1747 	ldw x,#rsign ; destination address 
      009DCC CD 13 B5         [ 4] 1748 	call move  
      009DCC CF 00 19         [ 2] 1749 	ldw x,#free_ram 
      009DCF AE 16 68         [ 2] 1750 	ldw txtbgn,x 
      009DD2 7B 05 CD 88      [ 2] 1751 	addw x,rsize  
      009DD6 D9 5F 7B         [ 2] 1752 	ldw txtend,x 
      009DD9 05               [ 4] 1753 	ret 
                                   1754 
      009DDA 97 72 BB 00 24 CF 00  1755 NOT_SAVED: .asciz "No application saved.\n"
             24 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1756 
                                   1757 
                                   1758 ;--------------------------
                                   1759 ; decompile line from token list
                                   1760 ; and print it. 
                                   1761 ; input:
                                   1762 ;   A       stop at this position 
                                   1763 ;   X 		pointer at line
                                   1764 ; output:
                                   1765 ;   none 
                                   1766 ;--------------------------	
      009DE2                       1767 prt_basic_line:
      009DE2 CD 97            [ 2] 1768 	pushw y 
      009DE4 BE A1 08         [ 1] 1769 	ld count,a 
      009DE7 26 03            [ 1] 1770 	ld a,(2,x)
      009DE9 CC 9D 68         [ 1] 1771 	cp a,count 
      009DEC 2A 03            [ 1] 1772 	jrpl 1$ 
      009DEC 55 00 03         [ 1] 1773 	ld count,a 
      009DEF 00 02 04         [ 2] 1774 1$:	ldw basicptr,x 
      009DF1 90 AE 16 68      [ 2] 1775 	ldw y,#tib  
      009DF1 5B 05 90         [ 4] 1776 	call decompile 
      009DF4 85 81 75         [ 4] 1777 	call puts 
      009DF6 A6 0D            [ 1] 1778 	ld a,#CR 
      009DF6 CE 00 1D         [ 4] 1779 	call putc 
      009DF9 72 B0            [ 2] 1780 	popw y 
      009DFB 00               [ 4] 1781 	ret 
                                   1782 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   1783 
                                   1784 
                                   1785 ;---------------------------------
                                   1786 ; BASIC: PRINT|? arg_list 
                                   1787 ; print values from argument list
                                   1788 ;----------------------------------
                           000001  1789 	CCOMMA=1
                           000001  1790 	VSIZE=1
      001F13                       1791 print:
      001F13                       1792 	_vars VSIZE 
      009DFC 1B 81            [ 2]    1     sub sp,#VSIZE 
      009DFE                       1793 reset_comma:
      009DFE AE 9E            [ 1] 1794 	clr (CCOMMA,sp)
      001F17                       1795 prt_loop:
      009E00 3D CD 89         [ 4] 1796 	call next_token
      009E03 F5 CE            [ 1] 1797 	cp a,#CMD_END 
      009E05 00 1B            [ 1] 1798 	jrult print_exit ; colon or end of line 
      009E07 35 10            [ 1] 1799 	cp a,#TK_QSTR
      009E09 00 0B            [ 1] 1800 	jreq 1$
      009E0B CD 98            [ 1] 1801 	cp a,#TK_CHAR 
      009E0D 0A 35            [ 1] 1802 	jreq 2$ 
      009E0F 0A 00            [ 1] 1803 	cp a,#TK_CFUNC 
      009E11 0B AE            [ 1] 1804 	jreq 3$
      009E13 9E 4F            [ 1] 1805 	cp a,#TK_COMMA 
      009E15 CD 89            [ 1] 1806 	jreq 4$
      009E17 F5 CD            [ 1] 1807 	cp a,#TK_SHARP 
      009E19 9D F6            [ 1] 1808 	jreq 5$
      009E1B CD 98            [ 2] 1809 	jra 7$ 
      001F34                       1810 1$:	; print string 
      009E1D 0A AE 9E         [ 4] 1811 	call puts
      009E20 60               [ 1] 1812 	incw x
      009E21 CD 89 F5 CE      [ 2] 1813 	subw x,basicptr 
      009E25 00 1B A3         [ 2] 1814 	ldw in.w,x  
      009E28 B6 04            [ 2] 1815 	jra reset_comma
      001F41                       1816 2$:	; print character 
      009E2A 25 05 AE         [ 4] 1817 	call get_char 
      009E2D 9E 66 20         [ 4] 1818 	call putc 
      009E30 03 AE            [ 2] 1819 	jra reset_comma 
      001F49                       1820 3$: ; print character function value  	
      009E32 9E 77 CD         [ 4] 1821 	call get_code_addr 
      009E35 89               [ 4] 1822 	call (x)
      009E36 F5 A6 0D         [ 4] 1823 	call putc
      009E39 CD 89            [ 2] 1824 	jra reset_comma 
      001F52                       1825 4$: ; set comma state 
      009E3B 98 81            [ 1] 1826 	cpl (CCOMMA,sp)
      009E3D 70 72            [ 2] 1827 	jra prt_loop   
      001F56                       1828 5$: ; # character must be followed by an integer   
      009E3F 6F 67 72         [ 4] 1829 	call next_token
      009E42 61 6D            [ 1] 1830 	cp a,#TK_INTGR 
      009E44 20 61            [ 1] 1831 	jreq 6$
      009E46 64 64 72         [ 2] 1832 	jp syntax_error 
      001F60                       1833 6$: ; set tab width
      009E49 65 73 73         [ 4] 1834 	call get_int24 
      009E4C 3A               [ 1] 1835 	ld a,xl 
      009E4D 20 00            [ 1] 1836 	and a,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009E4F 2C 20 70         [ 1] 1837 	ld tab_width,a 
      009E52 72 6F            [ 2] 1838 	jra reset_comma 
      001F6B                       1839 7$:	
      001F6B                       1840 	_unget_token 
      009E54 67 72 61 6D 20   [ 1]    1      mov in,in.saved  
      009E59 73 69 7A         [ 4] 1841 	call expression  
      009E5C 65 3A            [ 1] 1842 	cp a,#TK_INTGR 
      009E5E 20 00            [ 1] 1843 	jrne print_exit 
      009E60 62 79 74         [ 4] 1844     call print_top 
      009E63 65 73            [ 2] 1845 	jra reset_comma 
      001F7C                       1846 print_exit:
      009E65 00 20            [ 1] 1847 	tnz (CCOMMA,sp)
      009E67 69 6E            [ 1] 1848 	jrne 9$
      009E69 20 46            [ 1] 1849 	ld a,#CR 
      009E6B 4C 41 53         [ 4] 1850     call putc 
      001F85                       1851 9$:	_drop VSIZE 
      009E6E 48 20            [ 2]    1     addw sp,#VSIZE 
      009E70 6D               [ 4] 1852 	ret 
                                   1853 
                                   1854 ;----------------------
                                   1855 ; 'save_context' and
                                   1856 ; 'rest_context' must be 
                                   1857 ; called at the same 
                                   1858 ; call stack depth 
                                   1859 ; i.e. SP must have the 
                                   1860 ; save value at  
                                   1861 ; entry point of both 
                                   1862 ; routine. 
                                   1863 ;---------------------
                           000004  1864 	CTXT_SIZE=4 ; size of saved data 
                                   1865 ;--------------------
                                   1866 ; save current BASIC
                                   1867 ; interpreter context 
                                   1868 ; on stack 
                                   1869 ;--------------------
      001F88                       1870 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001F88                       1871 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001F88                       1872 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001F88                       1873 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001F88                       1874 save_context:
      009E71 65 6D 6F         [ 2] 1875 	ldw x,basicptr 
      009E74 72 79            [ 2] 1876 	ldw (BPTR,sp),x
      009E76 00 20 69         [ 1] 1877 	ld a,in 
      009E79 6E 20            [ 1] 1878 	ld (IN,sp),a
      009E7B 52 41 4D         [ 1] 1879 	ld a,count 
      009E7E 20 6D            [ 1] 1880 	ld (CNT,sp),a  
      009E80 65               [ 4] 1881 	ret
                                   1882 
                                   1883 ;-----------------------
                                   1884 ; restore previously saved 
                                   1885 ; BASIC interpreter context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                   1886 ; from stack 
                                   1887 ;-------------------------
      001F98                       1888 rest_context:
      009E81 6D 6F            [ 2] 1889 	ldw x,(BPTR,sp)
      009E83 72 79 00         [ 2] 1890 	ldw basicptr,x 
      009E86 7B 05            [ 1] 1891 	ld a,(IN,sp)
      009E86 72 01 00         [ 1] 1892 	ld in,a
      009E89 22 05            [ 1] 1893 	ld a,(CNT,sp)
      009E8B A6 07 CC         [ 1] 1894 	ld count,a  
      009E8E 96               [ 4] 1895 	ret
                                   1896 
                                   1897 
                                   1898 
                                   1899 ;------------------------------------------
                                   1900 ; BASIC: INPUT [string]var[,[string]var]
                                   1901 ; input value in variables 
                                   1902 ; [string] optionally can be used as prompt 
                                   1903 ;-----------------------------------------
                           000001  1904 	CX_BPTR=1
                           000003  1905 	CX_IN=3
                           000004  1906 	CX_CNT=4
                           000005  1907 	SKIP=5
                           000006  1908 	VAR_ADDR=6
                           000007  1909 	VSIZE=7
      001FA8                       1910 input_var:
      009E8F C7 89            [ 2] 1911 	pushw y 
      009E90                       1912 	_vars VSIZE 
      009E90 CD 97            [ 2]    1     sub sp,#VSIZE 
      001FAC                       1913 input_loop:
      009E92 BE A1            [ 1] 1914 	clr (SKIP,sp)
      009E94 04 26 10         [ 4] 1915 	call next_token 
      009E97 CD 98            [ 1] 1916 	cp a,#TK_QSTR 
      009E99 04 A4            [ 1] 1917 	jrne 1$ 
      009E9B DF A1 43         [ 4] 1918 	call puts 
      009E9E 26 04            [ 1] 1919 	cpl (SKIP,sp)
      009EA0 CD 9C 7B         [ 4] 1920 	call next_token 
      009EA3 81 CC            [ 1] 1921 1$: cp a,#TK_VAR  
      009EA5 96 C5            [ 1] 1922 	jreq 2$ 
      009EA7 55 00 03         [ 2] 1923 	jp syntax_error
      009EAA 00 02            [ 2] 1924 2$:	ldw (VAR_ADDR,sp),x 
      009EAC CD 9D            [ 1] 1925 	tnz (SKIP,sp)
      009EAE F6 22            [ 1] 1926 	jrne 21$ 
      009EB0 01 81 52         [ 4] 1927 	call var_name 
      009EB3 06 CE 00         [ 4] 1928 	call putc   
      001FD0                       1929 21$:
      009EB6 1B 1F            [ 1] 1930 	ld a,#':
      009EB8 05 FE 1F         [ 4] 1931 	call putc 
      009EBB 01 AE 7F         [ 4] 1932 	call save_context 
      009EBE FF 1F 03 CD      [ 1] 1933 	clr count  
      009EC2 99 76 4D         [ 4] 1934 	call readln 
      009EC5 27 31 A1         [ 2] 1935 	ldw x,#tib 
      009EC8 02 27 07         [ 1] 1936 	push count
      009ECB A1 01            [ 1] 1937 	push #0 
      009ECD 27 06 CC         [ 2] 1938 	addw x,(1,sp)
      009ED0 96               [ 1] 1939 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      001FEB                       1940 	_drop 2 
      009ED1 C5 85            [ 2]    1     addw sp,#2 
      009ED3 1F 05 00 01      [ 1] 1941 	clr in 
      009ED5 CD 0E E2         [ 4] 1942 	call get_token
      009ED5 85 1F            [ 1] 1943 	cp a,#TK_INTGR
      009ED7 01 12            [ 1] 1944 	jreq 3$ 
      009ED8 A1 11            [ 1] 1945 	cp a,#TK_MINUS
      009ED8 CE 00 1B         [ 4] 1946 	call get_token 
      009EDB 1F 05            [ 1] 1947 	cp a,#TK_INTGR 
      009EDD C3 00            [ 1] 1948 	jreq 22$
      009EDF 1D 2A 38         [ 4] 1949 	call rest_context 
      009EE2 FE 13 01         [ 2] 1950 	jp syntax_error
      002007                       1951 22$:
      009EE5 2A 11 1E         [ 4] 1952 	call neg_acc24	
      009EE8 05 E6            [ 2] 1953 3$: ldw y,(VAR_ADDR,sp) 
      009EEA 02 C7 00         [ 1] 1954 	ld a,acc24 
      009EED 0F 72 5F         [ 2] 1955 	ldw x,acc16 
      009EF0 00 0E            [ 1] 1956 	ld (y),a 
      009EF2 72 BB 00         [ 2] 1957 	ldw (1,y),x 
      009EF5 0E 20 E3         [ 4] 1958 	call rest_context
      009EF8 CD 17 3E         [ 4] 1959 	call next_token 
      009EF8 1E 05            [ 1] 1960 	cp a,#TK_COMMA 
      009EFA E6 02            [ 1] 1961 	jreq input_loop
      009EFC CD 9F            [ 1] 1962 	cp a,#TK_NONE 
      009EFE 6F 1E            [ 1] 1963 	jreq input_exit  
      009F00 05 E6            [ 1] 1964 	cp a,#TK_COLON 
      009F02 02 C7            [ 1] 1965     jreq input_exit 
      009F04 00 0F 72         [ 2] 1966 	jp syntax_error 
      00202C                       1967 input_exit:
      00202C                       1968 	_drop VSIZE 
      009F07 5F 00            [ 2]    1     addw sp,#VSIZE 
      009F09 0E 72            [ 2] 1969 	popw y 
      009F0B BB               [ 4] 1970 	ret 
                                   1971 
                                   1972 
                                   1973 ;---------------------
                                   1974 ; BASIC: REM | ' 
                                   1975 ; skip comment to end of line 
                                   1976 ;---------------------- 
      002031                       1977 remark::
      009F0C 00 0E C3 00 1D   [ 1] 1978 	mov in,count 
      009F11 2A               [ 4] 1979  	ret 
                                   1980 
                                   1981 
                                   1982 ;---------------------
                                   1983 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   1984 ; read in loop 'addr'  
                                   1985 ; apply & 'mask' to value 
                                   1986 ; loop while result==0.  
                                   1987 ; 'xor_mask' is used to 
                                   1988 ; invert the wait logic.
                                   1989 ; i.e. loop while not 0.
                                   1990 ;---------------------
                           000001  1991 	XMASK=1 
                           000002  1992 	MASK=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                           000003  1993 	ADDR=3
                           000004  1994 	VSIZE=4
      002037                       1995 wait: 
      002037                       1996 	_vars VSIZE
      009F12 07 1F            [ 2]    1     sub sp,#VSIZE 
      009F14 05 FE            [ 1] 1997 	clr (XMASK,sp) 
      009F16 13 03 2F         [ 4] 1998 	call arg_list 
      009F19 DE 02            [ 1] 1999 	cp a,#2
      009F1A 24 03            [ 1] 2000 	jruge 0$
      009F1A 55 00 04         [ 2] 2001 	jp syntax_error 
      009F1D 00 02            [ 1] 2002 0$:	cp a,#3
      009F1F AE 16            [ 1] 2003 	jrult 1$
      002049                       2004 	_xpop  ; xor mask 
      009F21 B8 CF            [ 1]    1     ld a,(y)
      009F23 00               [ 1]    2     ldw x,y 
      009F24 05 5B            [ 2]    3     ldw x,(1,x)
      009F26 06 CD 9D FE      [ 2]    4     addw y,#CELL_SIZE 
      009F2A 81               [ 1] 2005 	ld a,xl 
      009F2B 6B 01            [ 1] 2006 	ld (XMASK,sp),a 
      002055                       2007 1$: _xpop ; mask
      009F2B CD A7            [ 1]    1     ld a,(y)
      009F2D 1B               [ 1]    2     ldw x,y 
      009F2E 27 07            [ 2]    3     ldw x,(1,x)
      009F30 AE 9F 58 CD      [ 2]    4     addw y,#CELL_SIZE 
      009F34 89               [ 1] 2008     ld a,xl  
      009F35 F5 81            [ 1] 2009 	ld (MASK,sp),a 
      009F37                       2010 	_xpop ; address 
      009F37 90 AE            [ 1]    1     ld a,(y)
      009F39 B6               [ 1]    2     ldw x,y 
      009F3A 00 CE            [ 2]    3     ldw x,(1,x)
      009F3C B6 02 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      009F40 04               [ 1] 2011 2$:	ld a,(x)
      009F41 CF 00            [ 1] 2012 	and a,(MASK,sp)
      009F43 0E AE            [ 1] 2013 	xor a,(XMASK,sp)
      009F45 00 7C            [ 1] 2014 	jreq 2$ 
      002071                       2015 	_drop VSIZE 
      009F47 CD 94            [ 2]    1     addw sp,#VSIZE 
      009F49 35               [ 4] 2016 	ret 
                                   2017 
                                   2018 ;---------------------
                                   2019 ; BASIC: BSET addr,mask
                                   2020 ; set bits at 'addr' corresponding 
                                   2021 ; to those of 'mask' that are at 1.
                                   2022 ; arguments:
                                   2023 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2024 ;   mask        mask|addr
                                   2025 ; output:
                                   2026 ;	none 
                                   2027 ;--------------------------
      002074                       2028 bit_set:
      009F4A AE 00 80         [ 4] 2029 	call arg_list 
      009F4D CF 00            [ 1] 2030 	cp a,#2	 
      009F4F 1B 72            [ 1] 2031 	jreq 1$ 
      009F51 BB 00 7E         [ 2] 2032 	jp syntax_error
      00207E                       2033 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00207E                       2034 	_xpop ; mask 
      009F54 CF 00            [ 1]    1     ld a,(y)
      009F56 1D               [ 1]    2     ldw x,y 
      009F57 81 4E            [ 2]    3     ldw x,(1,x)
      009F59 6F 20 61 70      [ 2]    4     addw y,#CELL_SIZE 
      009F5D 70               [ 1] 2035 	ld a,xl
      009F5E 6C               [ 1] 2036 	push a  
      002089                       2037 	_xpop ; addr  
      009F5F 69 63            [ 1]    1     ld a,(y)
      009F61 61               [ 1]    2     ldw x,y 
      009F62 74 69            [ 2]    3     ldw x,(1,x)
      009F64 6F 6E 20 73      [ 2]    4     addw y,#CELL_SIZE 
      009F68 61               [ 1] 2038 	pop a 
      009F69 76               [ 1] 2039 	or a,(x)
      009F6A 65               [ 1] 2040 	ld (x),a
      009F6B 64               [ 4] 2041 	ret 
                                   2042 
                                   2043 ;---------------------
                                   2044 ; BASIC: BRES addr,mask
                                   2045 ; reset bits at 'addr' corresponding 
                                   2046 ; to those of 'mask' that are at 1.
                                   2047 ; arguments:
                                   2048 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2049 ;   mask	    ~mask&*addr  
                                   2050 ; output:
                                   2051 ;	none 
                                   2052 ;--------------------------
      002096                       2053 bit_reset:
      009F6C 2E 0A 00         [ 4] 2054 	call arg_list 
      009F6F A1 02            [ 1] 2055 	cp a,#2  
      009F6F 90 89            [ 1] 2056 	jreq 1$ 
      009F71 C7 00 04         [ 2] 2057 	jp syntax_error
      0020A0                       2058 1$: 
      0020A0                       2059 	_xpop ; mask 
      009F74 E6 02            [ 1]    1     ld a,(y)
      009F76 C1               [ 1]    2     ldw x,y 
      009F77 00 04            [ 2]    3     ldw x,(1,x)
      009F79 2A 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      009F7D 04               [ 1] 2060 	ld a,xl 
      009F7E CF               [ 1] 2061 	cpl a
      009F7F 00               [ 1] 2062 	push a  
      0020AC                       2063 	_xpop ; addr  
      009F80 05 90            [ 1]    1     ld a,(y)
      009F82 AE               [ 1]    2     ldw x,y 
      009F83 16 68            [ 2]    3     ldw x,(1,x)
      009F85 CD 92 40 CD      [ 2]    4     addw y,#CELL_SIZE 
      009F89 89               [ 1] 2064 	pop a 
      009F8A F5               [ 1] 2065 	and a,(x)
      009F8B A6               [ 1] 2066 	ld (x),a 
      009F8C 0D               [ 4] 2067 	ret 
                                   2068 
                                   2069 ;---------------------
                                   2070 ; BASIC: BTOGL addr,mask
                                   2071 ; toggle bits at 'addr' corresponding 
                                   2072 ; to those of 'mask' that are at 1.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   2073 ; arguments:
                                   2074 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2075 ;   mask	    mask^*addr  
                                   2076 ; output:
                                   2077 ;	none 
                                   2078 ;--------------------------
      0020B9                       2079 bit_toggle:
      009F8D CD 89 98         [ 4] 2080 	call arg_list 
      009F90 90 85            [ 1] 2081 	cp a,#2 
      009F92 81 03            [ 1] 2082 	jreq 1$ 
      009F93 CC 16 45         [ 2] 2083 	jp syntax_error
      0020C3                       2084 1$: _xpop ; mask 
      009F93 52 01            [ 1]    1     ld a,(y)
      009F95 93               [ 1]    2     ldw x,y 
      009F95 0F 01            [ 2]    3     ldw x,(1,x)
      009F97 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009F97 CD               [ 1] 2085 	ld a,xl
      009F98 97               [ 1] 2086 	push a 
      0020CE                       2087 	_xpop  ; addr  
      009F99 BE A1            [ 1]    1     ld a,(y)
      009F9B 02               [ 1]    2     ldw x,y 
      009F9C 25 5E            [ 2]    3     ldw x,(1,x)
      009F9E A1 02 27 12      [ 2]    4     addw y,#CELL_SIZE 
      009FA2 A1               [ 1] 2088 	pop a 
      009FA3 04               [ 1] 2089 	xor a,(x)
      009FA4 27               [ 1] 2090 	ld (x),a 
      009FA5 1B               [ 4] 2091 	ret 
                                   2092 
                                   2093 
                                   2094 ;---------------------
                                   2095 ; BASIC: BTEST(addr,bit)
                                   2096 ; return bit value at 'addr' 
                                   2097 ; bit is in range {0..7}.
                                   2098 ; arguments:
                                   2099 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2100 ;   bit 	    bit position {0..7}  
                                   2101 ; output:
                                   2102 ;	A:X       bit value  
                                   2103 ;--------------------------
      0020DB                       2104 bit_test:
      009FA6 A1 82 27         [ 4] 2105 	call func_args 
      009FA9 1F A1            [ 1] 2106 	cp a,#2
      009FAB 08 27            [ 1] 2107 	jreq 0$
      009FAD 24 A1 09         [ 2] 2108 	jp syntax_error
      0020E5                       2109 0$:	
      0020E5                       2110 	_xpop 
      009FB0 27 24            [ 1]    1     ld a,(y)
      009FB2 20               [ 1]    2     ldw x,y 
      009FB3 37 01            [ 2]    3     ldw x,(1,x)
      009FB4 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FB4 CD               [ 1] 2111 	ld a,xl 
      009FB5 89 F5            [ 1] 2112 	and a,#7
      009FB7 5C               [ 1] 2113 	push a   
      009FB8 72 B0            [ 1] 2114 	ld a,#1 
      009FBA 00 05            [ 1] 2115 1$: tnz (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009FBC CF 00            [ 1] 2116 	jreq 2$
      009FBE 01               [ 1] 2117 	sll a 
      009FBF 20 D4            [ 1] 2118 	dec (1,sp)
      009FC1 20 F7            [ 2] 2119 	jra 1$
      009FC1 CD 98            [ 1] 2120 2$: ld (1,sp),a  
      0020FF                       2121 	_xpop ; address  
      009FC3 04 CD            [ 1]    1     ld a,(y)
      009FC5 89               [ 1]    2     ldw x,y 
      009FC6 98 20            [ 2]    3     ldw x,(1,x)
      009FC8 CC A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FC9 84               [ 1] 2122 	pop a 
      009FC9 CD               [ 1] 2123 	and a,(x)
      009FCA 97 D8            [ 1] 2124 	jreq 3$
      009FCC FD CD            [ 1] 2125 	ld a,#1 
      009FCE 89               [ 1] 2126 3$:	clrw x 
      009FCF 98               [ 1] 2127 	ld xl,a
      009FD0 20               [ 1] 2128 	clr a  
      009FD1 C3               [ 4] 2129 	ret
                                   2130 
                                   2131 ;--------------------
                                   2132 ; BASIC: POKE addr,byte
                                   2133 ; put a byte at addr 
                                   2134 ;--------------------
      009FD2                       2135 poke:
      009FD2 03 01 20         [ 4] 2136 	call arg_list 
      009FD5 C1 02            [ 1] 2137 	cp a,#2
      009FD6 27 03            [ 1] 2138 	jreq 1$
      009FD6 CD 97 BE         [ 2] 2139 	jp syntax_error
      00211C                       2140 1$:	
      00211C                       2141 	_xpop ; byte   
      009FD9 A1 84            [ 1]    1     ld a,(y)
      009FDB 27               [ 1]    2     ldw x,y 
      009FDC 03 CC            [ 2]    3     ldw x,(1,x)
      009FDE 96 C5 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FE0 9F               [ 1] 2142     ld a,xl 
      009FE0 CD               [ 1] 2143 	push a 
      002127                       2144 	_xpop ; address 
      009FE1 97 F4            [ 1]    1     ld a,(y)
      009FE3 9F               [ 1]    2     ldw x,y 
      009FE4 A4 0F            [ 2]    3     ldw x,(1,x)
      009FE6 C7 00 23 20      [ 2]    4     addw y,#CELL_SIZE 
      009FEA AA               [ 1] 2145 	pop a 
      009FEB F7               [ 1] 2146 	ld (x),a 
      009FEB 55               [ 4] 2147 	ret 
                                   2148 
                                   2149 ;-----------------------
                                   2150 ; BASIC: PEEK(addr)
                                   2151 ; get the byte at addr 
                                   2152 ; input:
                                   2153 ;	none 
                                   2154 ; output:
                                   2155 ;	X 		value 
                                   2156 ;-----------------------
      002133                       2157 peek:
      009FEC 00 03 00         [ 4] 2158 	call func_args
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009FEF 02 CD            [ 1] 2159 	cp a,#1 
      009FF1 9A B3            [ 1] 2160 	jreq 1$
      009FF3 A1 84 26         [ 2] 2161 	jp syntax_error
      00213D                       2162 1$: _xpop ; address  
      009FF6 05 CD            [ 1]    1     ld a,(y)
      009FF8 98               [ 1]    2     ldw x,y 
      009FF9 28 20            [ 2]    3     ldw x,(1,x)
      009FFB 99 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FFC F6               [ 1] 2163 	ld a,(x)
      009FFC 0D               [ 1] 2164 	clrw x 
      009FFD 01               [ 1] 2165 	ld xl,a 
      009FFE 26               [ 1] 2166 	clr a 
      009FFF 05               [ 4] 2167 	ret 
                                   2168 
                                   2169 ;---------------------------
                                   2170 ; BASIC IF expr : instructions
                                   2171 ; evaluate expr and if true 
                                   2172 ; execute instructions on same line. 
                                   2173 ;----------------------------
      00214B                       2174 if: 
      00A000 A6 0D CD         [ 4] 2175 	call relation 
      00A003 89 98            [ 1] 2176 	cp a,#TK_INTGR
      00A005 5B 01            [ 1] 2177 	jreq 1$ 
      00A007 81 16 45         [ 2] 2178 	jp syntax_error
      00A008                       2179 1$:	_xpop 
      00A008 CE 00            [ 1]    1     ld a,(y)
      00A00A 05               [ 1]    2     ldw x,y 
      00A00B 1F 03            [ 2]    3     ldw x,(1,x)
      00A00D C6 00 02 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A011 05               [ 2] 2180 	tnzw x 
      00A012 C6 00            [ 1] 2181 	jrne 9$ 
                                   2182 ;skip to next line
      00A014 04 6B 06 81 01   [ 1] 2183 	mov in,count
      00A018 81               [ 4] 2184 9$:	ret 
                                   2185 
                                   2186 ;------------------------
                                   2187 ; BASIC: FOR var=expr 
                                   2188 ; set variable to expression 
                                   2189 ; leave variable address 
                                   2190 ; on stack and set
                                   2191 ; FLOOP bit in 'flags'
                                   2192 ;-----------------
                           000001  2193 	RETL1=1 ; return address  
                           000003  2194 	FSTEP=3  ; variable increment
                           000005  2195 	LIMIT=5 ; loop limit 
                           000008  2196 	CVAR=8   ; control variable 
                           00000A  2197 	INW=10   ;  in.w saved
                           00000C  2198 	BPTR=12 ; baseptr saved
                           00000C  2199 	VSIZE=12  
      002167                       2200 for: ; { -- var_addr }
      00A018 1E               [ 2] 2201 	popw x ; call return address 
      002168                       2202 	_vars VSIZE 
      00A019 03 CF            [ 2]    1     sub sp,#VSIZE 
      00A01B 00               [ 2] 2203 	pushw x  ; RETL1 
      00A01C 05 7B            [ 1] 2204 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00A01E 05 C7 00         [ 4] 2205 	call expect
      00A021 02               [ 2] 2206 	pushw x 
      00A022 7B 06 C7         [ 4] 2207 	call get_addr
      00A025 00 04            [ 2] 2208 	ldw (CVAR,sp),x  ; control variable 
      00A027 81               [ 2] 2209 	popw x 
      00A028 CD 1B BC         [ 4] 2210 	call let_var 
      00A028 90 89 52 07      [ 1] 2211 	bset flags,#FLOOP 
      00A02C CD 17 3E         [ 4] 2212 	call next_token 
      00A02C 0F 05            [ 1] 2213 	cp a,#TK_CMD 
      00A02E CD 97            [ 1] 2214 	jreq 1$
      00A030 BE A1 02         [ 2] 2215 	jp syntax_error
      002188                       2216 1$:  
      00A033 26 08 CD         [ 4] 2217 	call get_code_addr
      00A036 89 F5 03         [ 2] 2218 	cpw x,#to   
      00A039 05 CD            [ 1] 2219 	jreq to
      00A03B 97 BE A1         [ 2] 2220 	jp syntax_error 
                                   2221 
                                   2222 ;-----------------------------------
                                   2223 ; BASIC: TO expr 
                                   2224 ; second part of FOR loop initilization
                                   2225 ; leave limit on stack and set 
                                   2226 ; FTO bit in 'flags'
                                   2227 ;-----------------------------------
      002193                       2228 to: ; { var_addr -- var_addr limit step }
      00A03E 85 27 03 CC 96   [ 2] 2229 	btjt flags,#FLOOP,1$
      00A043 C5 1F 06         [ 2] 2230 	jp syntax_error
      00A046 0D 05 26         [ 4] 2231 1$: call expression   
      00A049 06 CD            [ 1] 2232 	cp a,#TK_INTGR 
      00A04B 92 17            [ 1] 2233 	jreq 2$ 
      00A04D CD 89 98         [ 2] 2234 	jp syntax_error
      00A050                       2235 2$: _xpop
      00A050 A6 3A            [ 1]    1     ld a,(y)
      00A052 CD               [ 1]    2     ldw x,y 
      00A053 89 98            [ 2]    3     ldw x,(1,x)
      00A055 CD A0 08 72      [ 2]    4     addw y,#CELL_SIZE 
      00A059 5F 00            [ 1] 2236 	ld (LIMIT,sp),a 
      00A05B 04 CD            [ 2] 2237 	ldw (LIMIT+1,sp),x
      00A05D 8A FA AE         [ 4] 2238 	call next_token
      00A060 16 68            [ 1] 2239 	cp a,#TK_NONE  
      00A062 3B 00            [ 1] 2240 	jreq 4$ 
      00A064 04 4B            [ 1] 2241 	cp a,#TK_CMD
      00A066 00 72            [ 1] 2242 	jrne 3$
      00A068 FB 01 5C         [ 4] 2243 	call get_code_addr
      00A06B 5B 02 72         [ 2] 2244 	cpw x,#step 
      00A06E 5F 00            [ 1] 2245 	jreq step
      0021C5                       2246 3$:	
      0021C5                       2247 	_unget_token   	 
      00A070 02 CD 8F 62 A1   [ 1]    1      mov in,in.saved  
      0021CA                       2248 4$:	
      00A075 84 27 12         [ 2] 2249 	ldw x,#1   ; default step  
      00A078 A1 11            [ 2] 2250 	ldw (FSTEP,sp),x 
      00A07A CD 8F            [ 2] 2251 	jra store_loop_addr 
                                   2252 
                                   2253 
                                   2254 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   2255 ; BASIC: STEP expr 
                                   2256 ; optional third par of FOR loop
                                   2257 ; initialization. 	
                                   2258 ;------------------------------------
      0021D1                       2259 step: ; {var limit -- var limit step}
      00A07C 62 A1 84 27 06   [ 2] 2260 	btjt flags,#FLOOP,1$
      00A081 CD A0 18         [ 2] 2261 	jp syntax_error
      00A084 CC 96 C5         [ 4] 2262 1$: call expression 
      00A087 A1 84            [ 1] 2263 	cp a,#TK_INTGR
      00A087 CD 82            [ 1] 2264 	jreq 2$
      00A089 5C 16 06         [ 2] 2265 	jp syntax_error
      0021E3                       2266 2$:	
      0021E3                       2267 	_xpop 
      00A08C C6 00            [ 1]    1     ld a,(y)
      00A08E 0D               [ 1]    2     ldw x,y 
      00A08F CE 00            [ 2]    3     ldw x,(1,x)
      00A091 0E 90 F7 90      [ 2]    4     addw y,#CELL_SIZE 
      00A095 EF 01            [ 2] 2268 	ldw (FSTEP,sp),x ; step
                                   2269 ; leave loop back entry point on cstack 
                                   2270 ; cstack is 1 call deep from interpreter
      0021EE                       2271 store_loop_addr:
      00A097 CD A0 18         [ 2] 2272 	ldw x,basicptr  
      00A09A CD 97            [ 2] 2273 	ldw (BPTR,sp),x 
      00A09C BE A1 08         [ 2] 2274 	ldw x,in.w 
      00A09F 27 8B            [ 2] 2275 	ldw (INW,sp),x   
      00A0A1 A1 00 27 07      [ 1] 2276 	bres flags,#FLOOP 
      00A0A5 A1 0A 27 03      [ 1] 2277 	inc loop_depth  
      00A0A9 CC               [ 4] 2278 	ret 
                                   2279 
                                   2280 ;--------------------------------
                                   2281 ; BASIC: NEXT var 
                                   2282 ; FOR loop control 
                                   2283 ; increment variable with step 
                                   2284 ; and compare with limit 
                                   2285 ; loop if threshold not crossed.
                                   2286 ; else stack. 
                                   2287 ; and decrement 'loop_depth' 
                                   2288 ;--------------------------------
      002201                       2289 next: ; {var limit step retl1 -- [var limit step ] }
      00A0AA 96 C5 00 1E      [ 1] 2290 	tnz loop_depth 
      00A0AC 26 03            [ 1] 2291 	jrne 1$ 
      00A0AC 5B 07 90         [ 2] 2292 	jp syntax_error 
      00220A                       2293 1$: 
      00A0AF 85 81            [ 1] 2294 	ld a,#TK_VAR 
      00A0B1 CD 18 E4         [ 4] 2295 	call expect
      00A0B1 55 00 04         [ 4] 2296 	call get_addr 
                                   2297 ; check for good variable after NEXT 	 
      00A0B4 00 02            [ 2] 2298 	cpw x,(CVAR,sp)
      00A0B6 81 03            [ 1] 2299 	jreq 2$  
      00A0B7 CC 16 45         [ 2] 2300 	jp syntax_error ; not the good one 
      002219                       2301 2$: 
      00A0B7 52 04 0F         [ 2] 2302 	ldw ptr16,x 
                                   2303 	; increment variable 
      00A0BA 01               [ 1] 2304 	ld a,(x)
      00A0BB CD 99            [ 2] 2305 	ldw x,(1,x)  ; get var value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A0BD 76 A1 02         [ 2] 2306 	addw x,(FSTEP,sp) ; var+step 
      00A0C0 24 03            [ 1] 2307 	adc a,#0  
      00A0C2 CC 96 C5 A1      [ 4] 2308 	ld [ptr16],a
      00A0C6 03 25 0C 90      [ 1] 2309 	inc ptr8  
      00A0CA F6 93 EE 01      [ 5] 2310 	ldw [ptr16],x 
      00A0CE 72 A9 00         [ 1] 2311 	ld acc24,a 
      00A0D1 03 9F 6B         [ 2] 2312 	ldw acc16,x 
                                   2313 ; check sign of STEP  
      00A0D4 01 90            [ 1] 2314 	ld a,#0x80
      00A0D6 F6 93            [ 1] 2315 	bcp a,(FSTEP,sp)
      00A0D8 EE 01            [ 1] 2316 	jrpl 4$
                                   2317 ;negative step
      00A0DA 72 A9            [ 1] 2318 	ld a,(LIMIT,sp)
      00A0DC 00 03            [ 2] 2319 	ldw x,(LIMIT+1,sp)
      00A0DE 9F 6B 02         [ 4] 2320 	call cp24 
      00A0E1 90 F6            [ 1] 2321 	jrslt loop_done
      00A0E3 93 EE            [ 2] 2322 	jra loop_back 
      002247                       2323 4$: ; positive step
      00A0E5 01 72            [ 1] 2324 	ld a,(LIMIT,sp)
      00A0E7 A9 00            [ 2] 2325 	ldw x,(LIMIT+1,sp)
      00A0E9 03 F6 14         [ 4] 2326 	call cp24
      00A0EC 02 18            [ 1] 2327 	jrsgt loop_done
      002250                       2328 loop_back:
      00A0EE 01 27            [ 2] 2329 	ldw x,(BPTR,sp)
      00A0F0 F9 5B 04         [ 2] 2330 	ldw basicptr,x 
      00A0F3 81 01 00 21 05   [ 2] 2331 	btjf flags,#FRUN,1$ 
      00A0F4 E6 02            [ 1] 2332 	ld a,(2,x)
      00A0F4 CD 99 76         [ 1] 2333 	ld count,a
      00A0F7 A1 02            [ 2] 2334 1$:	ldw x,(INW,sp)
      00A0F9 27 03 CC         [ 2] 2335 	ldw in.w,x 
      00A0FC 96               [ 4] 2336 	ret 
      002265                       2337 loop_done:
                                   2338 	; remove loop data from stack  
      00A0FD C5               [ 2] 2339 	popw x
      00A0FE                       2340 	_drop VSIZE 
      00A0FE 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A100 93 EE 01 72      [ 1] 2341 	dec loop_depth 
      00A104 A9               [ 2] 2342 	jp (x)
                                   2343 
                                   2344 ;----------------------------
                                   2345 ; called by goto/gosub
                                   2346 ; to get target line number 
                                   2347 ;---------------------------
      00226D                       2348 get_target_line:
      00A105 00 03 9F         [ 4] 2349 	call next_token  
      00A108 88 90            [ 1] 2350 	cp a,#TK_INTGR
      00A10A F6 93            [ 1] 2351 	jreq get_target_line_2 
      00A10C EE 01            [ 1] 2352 	cp a,#TK_LABEL 
      00A10E 72 A9            [ 1] 2353 	jreq look_target_symbol 
      00A110 00 03 84         [ 2] 2354 	jp syntax_error
      00227B                       2355 get_target_line_2:
      00A113 FA F7            [ 2] 2356 	pushw y 
      00A115 81 17 74         [ 4] 2357 	call get_int24 
      00A116 4F               [ 1] 2358 	clr a
      00A116 CD 99 76 A1      [ 2] 2359 	ldw y,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00A11A 02 27            [ 2] 2360 	ldw y,(y)
      00A11C 03 CC            [ 2] 2361 	pushw y 
      00A11E 96 C5            [ 2] 2362 	cpw x,(1,sp)
      00A120                       2363 	_drop 2  
      00A120 90 F6            [ 2]    1     addw sp,#2 
      00A122 93 EE            [ 1] 2364 	jrult 11$
      00A124 01               [ 1] 2365 	inc a 
      002290                       2366 11$:	
      00A125 72 A9 00         [ 4] 2367 	call search_lineno  
      00A128 03               [ 2] 2368 	tnzw x 
      00A129 9F 43            [ 1] 2369 	jrne 2$ 
      00A12B 88 90            [ 1] 2370 	ld a,#ERR_NO_LINE 
      00A12D F6 93 EE         [ 2] 2371 	jp tb_error 
      00A130 01 72            [ 2] 2372 2$:	popw y 
      00A132 A9               [ 4] 2373 	ret 
                                   2374 
                                   2375 ; the GOTO|GOSUB target is a symbol.
      00229E                       2376 look_target_symbol:
      00A133 00 03            [ 2] 2377 	pushw y 
      00A135 84               [ 2] 2378 	pushw x 
      00A136 F4 F7 81 0D      [ 1] 2379 	clr acc16 
      00A139 90 CE 00 1A      [ 2] 2380 	ldw y,txtbgn 
      00A139 CD 99 76         [ 1] 2381 1$:	ld a,(3,y) ; first TK_ID on line 
      00A13C A1 02            [ 1] 2382 	cp a,#TK_LABEL 
      00A13E 27 03            [ 1] 2383 	jreq 3$ 
      00A140 CC 96 C5         [ 1] 2384 2$:	ld a,(2,y); line length 
      00A143 90 F6 93         [ 1] 2385 	ld acc8,a 
      00A146 EE 01 72 A9      [ 2] 2386 	addw y,acc16 ;point to next line 
      00A14A 00 03 9F 88      [ 2] 2387 	cpw y,txtend 
      00A14E 90 F6            [ 1] 2388 	jrult 1$
      00A150 93 EE            [ 1] 2389 	ld a,#ERR_BAD_VALUE
      00A152 01 72 A9         [ 2] 2390 	jp tb_error 
      0022C5                       2391 3$: ; found a TK_LABEL 
                                   2392 	; compare with GOTO|GOSUB target 
      00A155 00 03            [ 2] 2393 	pushw y ; line address 
      00A157 84 F8 F7 81      [ 2] 2394 	addw y,#4 ; label string 
      00A15B 1E 03            [ 2] 2395 	ldw x,(3,sp) ; target string 
      00A15B CD 99 71         [ 4] 2396 	call strcmp
      00A15E A1 02            [ 1] 2397 	jrne 4$
      00A160 27 03            [ 2] 2398 	popw y 
      00A162 CC 96            [ 2] 2399 	jra 2$ 
      0022D6                       2400 4$: ; target found 
      00A164 C5               [ 2] 2401 	popw x ;  address line target  
      00A165                       2402 	_drop 2 ; target string 
      00A165 90 F6            [ 2]    1     addw sp,#2 
      00A167 93 EE            [ 2] 2403 	popw y 
      00A169 01               [ 4] 2404 	ret
                                   2405 
                                   2406 
                                   2407 ;--------------------------------
                                   2408 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2409 ; selective goto or gosub 
                                   2410 ;--------------------------------
                           000003  2411 	RET_ADDR=3
                           000005  2412 	RET_INW=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                           000004  2413 	VSIZE=4  
      0022DC                       2414 cmd_on:
      00A16A 72 A9            [ 2] 2415 	pushw y 
      00A16C 00 03 9F A4 07   [ 2] 2416 	btjt flags,#FRUN,0$ 
      00A171 88 A6            [ 1] 2417 	ld a,#ERR_RUN_ONLY
      00A173 01 0D 01         [ 2] 2418 	jp tb_error 
      00A176 27 05 48         [ 4] 2419 0$:	call expression 
      00A179 0A 01            [ 1] 2420 	cp a,#TK_INTGR
      00A17B 20 F7            [ 1] 2421 	jreq 1$
      00A17D 6B 01 90         [ 2] 2422 	jp syntax_error
      0022F2                       2423 1$: _xpop 
      00A180 F6 93            [ 1]    1     ld a,(y)
      00A182 EE               [ 1]    2     ldw x,y 
      00A183 01 72            [ 2]    3     ldw x,(1,x)
      00A185 A9 00 03 84      [ 2]    4     addw y,#CELL_SIZE 
      00A189 F4 27 02         [ 2] 2424 	cpw x,#1 
      00A18C A6 01            [ 1] 2425 	jrsge 11$
      00A18E 5F 97 4F         [ 2] 2426 	jp 9$ 
      002303                       2427 11$:	
      00A191 81 00 10         [ 2] 2428 	cpw x,#16 ; no more than 16 arguments 
      00A192 22 6C            [ 1] 2429 	jrugt 9$
      00A192 CD               [ 1] 2430 	ld a,xl 
      00A193 99               [ 1] 2431 	push a  ; selector  
      00A194 76 A1 02         [ 4] 2432 	call next_token ; should be GOTO|GOSUB 
      00A197 27 03            [ 1] 2433 	cp a,#TK_CMD 
      00A199 CC 96            [ 1] 2434 	jreq 2$ 
      00A19B C5 16 45         [ 2] 2435 	jp syntax_error 
      00A19C CD 17 58         [ 4] 2436 2$: call get_code_addr
      00A19C 90 F6 93         [ 2] 2437 	cpw x,#goto 
      00A19F EE 01            [ 1] 2438 	jreq 4$
      00A1A1 72 A9 00         [ 2] 2439 	cpw x,#gosub 
      00A1A4 03 9F            [ 1] 2440 	jreq 4$ 
      00A1A6 88 90 F6         [ 2] 2441 	jp syntax_error 
      00A1A9 93               [ 1] 2442 4$: pop a 
      00A1AA EE               [ 2] 2443 	pushw x ; save routine address 	
      00A1AB 01               [ 1] 2444 	push a  ; -- code_addr selector  
      00A1AC 72 A9 00         [ 4] 2445 5$: call next_token 
      00A1AF 03 84            [ 1] 2446 	cp a,#TK_INTGR 
      00A1B1 F7 81            [ 1] 2447 	jreq 52$
      00A1B3 CC 16 45         [ 2] 2448 	jp syntax_error 
      002331                       2449 52$: ; got a line number 
      00A1B3 CD 99 71         [ 4] 2450 	call get_int24  
      00A1B6 A1 01            [ 1] 2451 	dec (1,sp) ; decrement selector 
      00A1B8 27 03            [ 1] 2452 	jreq 58$ ; this is the selected one 
      00A1BA CC 96 C5         [ 4] 2453 	call next_token ; try for the next one 
      00A1BD 90 F6            [ 1] 2454 	cp a,#TK_COMMA 
      00A1BF 93 EE            [ 1] 2455 	jreq 5$ 
                                   2456 ; arg list exhausted, selector to big 
                                   2457 ; continue execution on next line 
      00233F                       2458 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A1C1 01 72            [ 2]    1     addw sp,#3 
      00A1C3 A9 00            [ 2] 2459 	jra 9$
      002343                       2460 58$: ;found line# in list 
      002343                       2461 	_drop 1 ; discard selector 
      00A1C5 03 F6            [ 2]    1     addw sp,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A1C7 5F 97 4F 81 01   [ 1] 2462 	mov in,count ; skip to end of this line. 
                                   2463 ; here only the routine address of GOTO|GOSUB is on stack 
                                   2464 ;   X contain target line number 
      00A1CB CD 22 7B         [ 4] 2465 8$:	call get_target_line_2
      00A1CB CD 9A            [ 2] 2466 	popw y ; routine address GOTO|GOSUB  
      00A1CD F4 A1 84 27      [ 2] 2467 	cpw y,#goto 
      00A1D1 03 CC            [ 1] 2468 	jreq jp_to_target 
      00A1D3 96 C5            [ 2] 2469 	popw y 
      002357                       2470 	_vars VSIZE 
      00A1D5 90 F6            [ 2]    1     sub sp,#VSIZE 
      00A1D7 93 EE            [ 2] 2471 	pushw y 
      00A1D9 01 72 A9 00      [ 2] 2472 	ldw y,basicptr 
      00A1DD 03 5D 26 05 55   [ 1] 2473 	mov in,count 
      00A1E2 00 04 00 02      [ 2] 2474 	addw y,in.w 
      00A1E6 81 03            [ 2] 2475 	ldw (RET_ADDR,sp),y 
      00A1E7 90 AE 00 03      [ 2] 2476 	ldw y,#3 
      00A1E7 85 52            [ 2] 2477 	ldw (RET_INW,sp),y
      00A1E9 0C 89            [ 2] 2478 	popw y 
      00A1EB A6 85            [ 2] 2479 	jra jp_to_target
      002374                       2480 9$: ; expr out of range skip to next line 
      00A1ED CD 99 64 89 CD   [ 1] 2481 	mov in,count
      00A1F2 97               [ 1] 2482 	clr a 
      00A1F3 F1 1F            [ 2] 2483 	popw y  
      00A1F5 08               [ 4] 2484 	ret 
                                   2485 
                                   2486 ;------------------------
                                   2487 ; BASIC: GOTO line# 
                                   2488 ; jump to line# 
                                   2489 ; here cstack is 2 call deep from interpreter 
                                   2490 ;------------------------
      00237D                       2491 goto:
      00A1F6 85 CD 9C 3C 72   [ 2] 2492 	btjt flags,#FRUN,0$ 
      00A1FB 14 00            [ 1] 2493 	ld a,#ERR_RUN_ONLY
      00A1FD 22 CD 97         [ 2] 2494 	jp tb_error 
      00A200 BE A1 80         [ 4] 2495 0$:	call get_target_line
      00238A                       2496 jp_to_target:
      00A203 27 03 CC         [ 2] 2497 	ldw basicptr,x 
      00A206 96 C5            [ 1] 2498 	ld a,(2,x)
      00A208 C7 00 03         [ 1] 2499 	ld count,a 
      00A208 CD 97 D8 A3      [ 1] 2500 	mov in,#3 
      00A20C A2               [ 4] 2501 	ret 
                                   2502 
                                   2503 
                                   2504 ;--------------------
                                   2505 ; BASIC: GOSUB line#
                                   2506 ; basic subroutine call
                                   2507 ; actual line# and basicptr 
                                   2508 ; are saved on cstack
                                   2509 ; here cstack is 2 call deep from interpreter 
                                   2510 ;--------------------
                           000003  2511 	RET_ADDR=3
                           000005  2512 	RET_INW=5
                           000004  2513 	VSIZE=4  
      002397                       2514 gosub:
      00A20D 13 27 03 CC 96   [ 2] 2515 	btjt flags,#FRUN,0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A212 C5 06            [ 1] 2516 	ld a,#ERR_RUN_ONLY
      00A213 CC 16 47         [ 2] 2517 	jp tb_error 
      00A213 72               [ 4] 2518 	ret 
      00A214 04               [ 2] 2519 0$:	popw x 
      0023A3                       2520 	_vars VSIZE  
      00A215 00 22            [ 2]    1     sub sp,#VSIZE 
      00A217 03               [ 2] 2521 	pushw x 
      00A218 CC 96 C5         [ 2] 2522 	ldw x,basicptr
      00A21B CD 9A            [ 2] 2523 	ldw (RET_ADDR,sp),x 
      00A21D B3 A1 84         [ 4] 2524 	call get_target_line  
      00A220 27               [ 2] 2525 	pushw x 
      00A221 03 CC 96         [ 2] 2526 	ldw x,in.w 
      00A224 C5 90            [ 2] 2527 	ldw (RET_INW+2,sp),x
      00A226 F6               [ 2] 2528 	popw x 
      00A227 93 EE            [ 2] 2529 	jra jp_to_target
                                   2530 
                                   2531 ;------------------------
                                   2532 ; BASIC: RETURN 
                                   2533 ; exit from a subroutine 
                                   2534 ; 
                                   2535 ;------------------------
      0023B7                       2536 return:
      00A229 01 72 A9 00 03   [ 2] 2537 	btjt flags,#FRUN,0$ 
      00A22E 6B 05            [ 1] 2538 	ld a,#ERR_RUN_ONLY
      00A230 1F 06 CD         [ 2] 2539 	jp tb_error 
      0023C1                       2540 0$:	
      00A233 97 BE            [ 2] 2541 	ldw x,(RET_ADDR,sp) 
      00A235 A1 00 27         [ 2] 2542 	ldw basicptr,x
      00A238 11 A1            [ 1] 2543 	ld a,(2,x)
      00A23A 80 26 08         [ 1] 2544 	ld count,a  
      00A23D CD 97            [ 2] 2545 	ldw x,(RET_INW,sp)
      00A23F D8 A3 A2         [ 2] 2546 	ldw in.w,x 
      00A242 51               [ 2] 2547 	popw x 
      0023D1                       2548 	_drop VSIZE 
      00A243 27 0C            [ 2]    1     addw sp,#VSIZE 
      00A245 89               [ 2] 2549 	pushw x
      00A245 55               [ 4] 2550 	ret  
                                   2551 
                                   2552 
                                   2553 ;----------------------------------
                                   2554 ; BASIC: RUN
                                   2555 ; run BASIC program in RAM
                                   2556 ;----------------------------------- 
      0023D5                       2557 run: 
      00A246 00 03 00 02 02   [ 2] 2558 	btjf flags,#FRUN,0$  
      00A24A 4F               [ 1] 2559 	clr a 
      00A24A AE               [ 4] 2560 	ret
      0023DC                       2561 0$: 
      00A24B 00 01 1F 03 20   [ 2] 2562 	btjf flags,#FBREAK,1$
      0023E1                       2563 	_drop 2 
      00A250 1D 02            [ 2]    1     addw sp,#2 
      00A251 CD 1F 98         [ 4] 2564 	call rest_context
      0023E6                       2565 	_drop CTXT_SIZE 
      00A251 72 04            [ 2]    1     addw sp,#CTXT_SIZE 
      00A253 00 22 03 CC      [ 1] 2566 	bres flags,#FBREAK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A257 96 C5 CD 9A      [ 1] 2567 	bset flags,#FRUN 
      00A25B B3 A1 84         [ 2] 2568 	jp interpreter 
      00A25E 27 03 CC         [ 2] 2569 1$:	ldw x,txtbgn
      00A261 96 C5 1C         [ 2] 2570 	cpw x,txtend 
      00A263 2B 0C            [ 1] 2571 	jrmi run_it 
      00A263 90 F6 93         [ 2] 2572 	ldw x,#err_no_prog
      00A266 EE 01 72         [ 4] 2573 	call puts 
      00A269 A9 00 03 1F 03   [ 1] 2574 	mov in,count
      00A26E 81               [ 4] 2575 	ret 
      002407                       2576 run_it:	 
      002407                       2577 	_drop 2 ; drop return address 
      00A26E CE 00            [ 2]    1     addw sp,#2 
      002409                       2578 run_it_02: 
      00A270 05 1F 0C         [ 4] 2579     call ubound 
      00A273 CE 00 01         [ 4] 2580 	call clear_vars 
                                   2581 ; clear data pointer 
      00A276 1F               [ 1] 2582 	clrw x 
      00A277 0A 72 15         [ 2] 2583 	ldw data_ptr,x 
      00A27A 00 22 72 5C      [ 1] 2584 	clr data_ofs 
      00A27E 00 1F 81 09      [ 1] 2585 	clr data_len 
                                   2586 ; initialize BASIC pointer 
      00A281 CE 00 1A         [ 2] 2587 	ldw x,txtbgn 
      00A281 72 5D 00         [ 2] 2588 	ldw basicptr,x 
      00A284 1F 26            [ 1] 2589 	ld a,(2,x)
      00A286 03 CC 96         [ 1] 2590 	ld count,a
      00A289 C5 03 00 01      [ 1] 2591 	mov in,#3	
      00A28A 72 10 00 21      [ 1] 2592 	bset flags,#FRUN 
      00A28A A6 85 CD         [ 2] 2593 	jp interpreter 
                                   2594 
                                   2595 
                                   2596 ;----------------------
                                   2597 ; BASIC: END
                                   2598 ; end running program
                                   2599 ;---------------------- 
      002431                       2600 cmd_end: 
                                   2601 ; clean stack 
      00A28D 99 64 CD         [ 2] 2602 	ldw x,#STACK_EMPTY
      00A290 97               [ 1] 2603 	ldw sp,x 
      00A291 F1 13 08         [ 2] 2604 	jp warm_start
                                   2605 
                                   2606 ;---------------------------
                                   2607 ; BASIC: GET var 
                                   2608 ; receive a key in variable 
                                   2609 ; don't wait 
                                   2610 ;---------------------------
      002438                       2611 cmd_get:
      00A294 27 03 CC         [ 4] 2612 	call next_token 
      00A297 96 C5            [ 1] 2613 	cp a,#TK_VAR 
      00A299 27 03            [ 1] 2614 	jreq 0$
      00A299 CF 00 19         [ 2] 2615 	jp syntax_error 
      00A29C F6 EE 01         [ 4] 2616 0$: call get_addr 
      00A29F 72 FB 03         [ 2] 2617 	ldw ptr16,x 
      00A2A2 A9 00 72         [ 4] 2618 	call qgetc 
      00A2A5 C7 00            [ 1] 2619 	jreq 2$
      00A2A7 19 72 5C         [ 4] 2620 	call getc  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A2AA 00 1A 72 CF      [ 4] 2621 2$: clr [ptr16]
      00A2AE 00 19 C7 00      [ 1] 2622 	inc ptr8 
      00A2B2 0D CF 00 0E      [ 4] 2623 	clr [ptr16]
      00A2B6 A6 80 15 03      [ 1] 2624 	inc ptr8 
      00A2BA 2A 0B 7B 05      [ 4] 2625 	ld [ptr16],a 
      00A2BE 1E               [ 4] 2626 	ret 
                                   2627 
                                   2628 
                                   2629 ;-----------------
                                   2630 ; 1 Khz beep 
                                   2631 ;-----------------
      002465                       2632 beep_1khz:: 
      00A2BF 06 CD 82         [ 2] 2633 	ldw x,#100
      00A2C2 25 2F 20 20      [ 2] 2634 	ldw y,#1000
      00A2C6 09 20            [ 2] 2635 	jra beep
                                   2636 
                                   2637 ;-----------------------
                                   2638 ; BASIC: TONE expr1,expr2
                                   2639 ; used TIMER2 channel 1
                                   2640 ; to produce a tone 
                                   2641 ; arguments:
                                   2642 ;    expr1   frequency 
                                   2643 ;    expr2   duration msec.
                                   2644 ;---------------------------
      00A2C7                       2645 tone:
      00A2C7 7B 05 1E         [ 4] 2646 	call arg_list 
      00A2CA 06 CD            [ 1] 2647 	cp a,#2 
      00A2CC 82 25            [ 1] 2648 	jreq 1$
      00A2CE 2C 15 45         [ 2] 2649 	jp syntax_error 
      00A2D0                       2650 1$: 
      002478                       2651 	_xpop 
      00A2D0 1E 0C            [ 1]    1     ld a,(y)
      00A2D2 CF               [ 1]    2     ldw x,y 
      00A2D3 00 05            [ 2]    3     ldw x,(1,x)
      00A2D5 72 01 00 22      [ 2]    4     addw y,#CELL_SIZE 
      00A2D9 05               [ 2] 2652 	pushw x ; duration 
      002482                       2653 	_xpop ; frequency
      00A2DA E6 02            [ 1]    1     ld a,(y)
      00A2DC C7               [ 1]    2     ldw x,y 
      00A2DD 00 04            [ 2]    3     ldw x,(1,x)
      00A2DF 1E 0A CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00A2E3 01 81            [ 1] 2654 	ldw y,x ; frequency 
      00A2E5 85               [ 2] 2655 	popw x  ; duration 
      00248E                       2656 beep:  
      00A2E5 85               [ 2] 2657 	pushw x 
      00A2E6 5B 0C 72         [ 2] 2658 	ldw x,#TIM2_CLK_FREQ
      00A2E9 5A               [ 2] 2659 	divw x,y ; cntr=Fclk/freq 
                                   2660 ; round to nearest integer 
      00A2EA 00 1F FC 12      [ 2] 2661 	cpw y,#TIM2_CLK_FREQ/2
      00A2ED 2B 01            [ 1] 2662 	jrmi 2$
      00A2ED CD               [ 1] 2663 	incw x 
      00249A                       2664 2$:	 
      00A2EE 97               [ 1] 2665 	ld a,xh 
      00A2EF BE A1 84         [ 1] 2666 	ld TIM2_ARRH,a 
      00A2F2 27               [ 1] 2667 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A2F3 07 A1 03         [ 1] 2668 	ld TIM2_ARRL,a 
                                   2669 ; 50% duty cycle 
      00A2F6 27               [ 1] 2670 	ccf 
      00A2F7 26               [ 2] 2671 	rrcw x 
      00A2F8 CC               [ 1] 2672 	ld a,xh 
      00A2F9 96 C5 0F         [ 1] 2673 	ld TIM2_CCR1H,a 
      00A2FB 9F               [ 1] 2674 	ld a,xl
      00A2FB 90 89 CD         [ 1] 2675 	ld TIM2_CCR1L,a
      00A2FE 97 F4 4F 90      [ 1] 2676 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A302 CE 00 05 90      [ 1] 2677 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A306 FE 90 89 13      [ 1] 2678 	bset TIM2_EGR,#TIM2_EGR_UG
      00A30A 01               [ 2] 2679 	popw x 
      00A30B 5B 02 25         [ 4] 2680 	call pause02
      00A30E 01 4C 53 08      [ 1] 2681 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A310 72 11 53 00      [ 1] 2682 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A310 CD               [ 4] 2683 	ret 
                                   2684 
                                   2685 ;-------------------------------
                                   2686 ; BASIC: ADCON 0|1 [,divisor]  
                                   2687 ; disable/enanble ADC 
                                   2688 ;-------------------------------
                           000003  2689 	ONOFF=3 
                           000001  2690 	DIVSOR=1
                           000004  2691 	VSIZE=4 
      0024C5                       2692 power_adc:
      00A311 8C DD 5D         [ 4] 2693 	call arg_list 
      00A314 26 05            [ 1] 2694 	cp a,#2	
      00A316 A6 05            [ 1] 2695 	jreq 1$
      00A318 CC 96            [ 1] 2696 	cp a,#1 
      00A31A C7 90            [ 1] 2697 	jreq 0$ 
      00A31C 85 81 45         [ 2] 2698 	jp syntax_error 
      00A31E 4F               [ 1] 2699 0$:	clr a 
      00A31E 90               [ 1] 2700 	clrw x
      0024D5                       2701 	_xpush   ; divisor  
      00A31F 89 89 72 5F      [ 2]    1     subw y,#CELL_SIZE
      00A323 00 0E            [ 1]    2     ld (y),a 
      00A325 90 CE 00         [ 2]    3     ldw (1,y),x 
      0024DE                       2702 1$: _at_next 
      00A328 1B 90 E6         [ 1]    1     ld a,(3,y)
      00A32B 03               [ 1]    2     ldw x,y 
      00A32C A1 03            [ 2]    3     ldw x,(4,x)
      00A32E 27               [ 2] 2703 	tnzw x 
      00A32F 15 90            [ 1] 2704 	jreq 2$ 
      0024E7                       2705 	_xpop
      00A331 E6 02            [ 1]    1     ld a,(y)
      00A333 C7               [ 1]    2     ldw x,y 
      00A334 00 0F            [ 2]    3     ldw x,(1,x)
      00A336 72 B9 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      0024F0                       2706 	_xdrop  
      00A33A 90 C3 00 1D      [ 2]    1     addw y,#CELL_SIZE 
      00A33E 25               [ 1] 2707 	ld a,xl
      00A33F E9 A6            [ 1] 2708 	and a,#7
      00A341 0A               [ 1] 2709 	swap a 
      00A342 CC 96 C7         [ 1] 2710 	ld ADC_CR1,a
      00A345 72 16 50 CA      [ 1] 2711 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A345 90 89 72 A9      [ 1] 2712 	bset ADC_CR1,#ADC_CR1_ADON 
      002503                       2713 	_usec_dly 7 
      00A349 00 04 1E         [ 2]    1     ldw x,#(16*7-2)/4
      00A34C 03               [ 2]    2     decw x
      00A34D CD               [ 1]    3     nop 
      00A34E 94 14            [ 1]    4     jrne .-4
      00A350 26 04            [ 2] 2714 	jra 3$
      00A352 90 85 20 DA      [ 1] 2715 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A356 72 17 50 CA      [ 1] 2716 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002514                       2717 3$:	
      00A356 85               [ 4] 2718 	ret
                                   2719 
                                   2720 ;-----------------------------
                                   2721 ; BASIC: ADCREAD (channel)
                                   2722 ; read adc channel {0..5}
                                   2723 ; output:
                                   2724 ;   A 		TK_INTGR 
                                   2725 ;   X 		value 
                                   2726 ;-----------------------------
      002515                       2727 analog_read:
      00A357 5B 02 90         [ 4] 2728 	call func_args 
      00A35A 85 81            [ 1] 2729 	cp a,#1 
      00A35C 27 03            [ 1] 2730 	jreq 1$
      00A35C 90 89 72         [ 2] 2731 	jp syntax_error
      00251F                       2732 1$: _xpop 
      00A35F 00 00            [ 1]    1     ld a,(y)
      00A361 22               [ 1]    2     ldw x,y 
      00A362 05 A6            [ 2]    3     ldw x,(1,x)
      00A364 06 CC 96 C7      [ 2]    4     addw y,#CELL_SIZE 
      00A368 CD 9A B3         [ 2] 2733 	cpw x,#5 
      00A36B A1 84            [ 2] 2734 	jrule 2$
      00A36D 27 03            [ 1] 2735 	ld a,#ERR_BAD_VALUE
      00A36F CC 96 C5         [ 2] 2736 	jp tb_error 
      00A372 90               [ 1] 2737 2$: ld a,xl
      00A373 F6 93 EE         [ 1] 2738 	ld acc8,a 
      00A376 01 72            [ 1] 2739 	ld a,#5
      00A378 A9 00 03         [ 1] 2740 	sub a,acc8 
      00A37B A3 00 01         [ 1] 2741 	ld ADC_CSR,a
      00A37E 2E 03 CC A3      [ 1] 2742 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A382 F4 10 54 01      [ 1] 2743 	bset ADC_CR1,#ADC_CR1_ADON
      00A383 72 0F 54 00 FB   [ 2] 2744 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A383 A3 00 10         [ 2] 2745 	ldw x,ADC_DRH
      00A386 22 6C            [ 1] 2746 	ld a,#TK_INTGR
      00A388 9F               [ 4] 2747 	ret 
                                   2748 
                                   2749 ;-----------------------
                                   2750 ; BASIC: DREAD(pin)
                                   2751 ; Arduino pins 
                                   2752 ; read state of a digital pin 
                                   2753 ; pin# {0..15}
                                   2754 ; output:
                                   2755 ;    A 		TK_INTGR
                                   2756 ;    X      0|1 
                                   2757 ;-------------------------
                           000001  2758 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                           000001  2759 	VSIZE=1
      002551                       2760 digital_read:
      002551                       2761 	_vars VSIZE 
      00A389 88 CD            [ 2]    1     sub sp,#VSIZE 
      00A38B 97 BE A1         [ 4] 2762 	call func_args
      00A38E 80 27            [ 1] 2763 	cp a,#1
      00A390 03 CC            [ 1] 2764 	jreq 1$
      00A392 96 C5 CD         [ 2] 2765 	jp syntax_error
      00255D                       2766 1$: _xpop 
      00A395 97 D8            [ 1]    1     ld a,(y)
      00A397 A3               [ 1]    2     ldw x,y 
      00A398 A3 FD            [ 2]    3     ldw x,(1,x)
      00A39A 27 08 A3 A4      [ 2]    4     addw y,#CELL_SIZE 
      00A39E 17 27 03         [ 2] 2767 	cpw x,#15 
      00A3A1 CC 96            [ 2] 2768 	jrule 2$
      00A3A3 C5 84            [ 1] 2769 	ld a,#ERR_BAD_VALUE
      00A3A5 89 88 CD         [ 2] 2770 	jp tb_error 
      00A3A8 97 BE A1         [ 4] 2771 2$:	call select_pin 
      00A3AB 84 27            [ 1] 2772 	ld (PINNO,sp),a
      00A3AD 03 CC            [ 1] 2773 	ld a,(GPIO_IDR,x)
      00A3AF 96 C5            [ 1] 2774 	tnz (PINNO,sp)
      00A3B1 27 05            [ 1] 2775 	jreq 8$
      00A3B1 CD               [ 1] 2776 3$: srl a 
      00A3B2 97 F4            [ 1] 2777 	dec (PINNO,sp)
      00A3B4 0A 01            [ 1] 2778 	jrne 3$ 
      00A3B6 27 0B            [ 1] 2779 8$: and a,#1 
      00A3B8 CD               [ 1] 2780 	clrw x 
      00A3B9 97               [ 1] 2781 	ld xl,a 
      00A3BA BE A1            [ 1] 2782 	ld a,#TK_INTGR
      002586                       2783 	_drop VSIZE
      00A3BC 08 27            [ 2]    1     addw sp,#VSIZE 
      00A3BE E8               [ 4] 2784 	ret
                                   2785 
                                   2786 
                                   2787 ;-----------------------
                                   2788 ; BASIC: DWRITE pin,0|1
                                   2789 ; Arduino pins 
                                   2790 ; write to a digital pin 
                                   2791 ; pin# {0..15}
                                   2792 ; output:
                                   2793 ;    A 		TK_INTGR
                                   2794 ;    X      0|1 
                                   2795 ;-------------------------
                           000001  2796 	PINNO=1
                           000002  2797 	PINVAL=2
                           000002  2798 	VSIZE=2
      002589                       2799 digital_write:
      002589                       2800 	_vars VSIZE 
      00A3BF 5B 03            [ 2]    1     sub sp,#VSIZE 
      00A3C1 20 31 F6         [ 4] 2801 	call arg_list  
      00A3C3 A1 02            [ 1] 2802 	cp a,#2 
      00A3C3 5B 01            [ 1] 2803 	jreq 1$
      00A3C5 55 00 04         [ 2] 2804 	jp syntax_error
      002595                       2805 1$: _xpop 
      00A3C8 00 02            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A3CA CD               [ 1]    2     ldw x,y 
      00A3CB A2 FB            [ 2]    3     ldw x,(1,x)
      00A3CD 90 85 90 A3      [ 2]    4     addw y,#CELL_SIZE 
      00A3D1 A3               [ 1] 2806 	ld a,xl 
      00A3D2 FD 27            [ 1] 2807 	ld (PINVAL,sp),a
      0025A1                       2808 	_xpop 
      00A3D4 35 90            [ 1]    1     ld a,(y)
      00A3D6 85               [ 1]    2     ldw x,y 
      00A3D7 52 04            [ 2]    3     ldw x,(1,x)
      00A3D9 90 89 90 CE      [ 2]    4     addw y,#CELL_SIZE 
      00A3DD 00 05 55         [ 2] 2809 	cpw x,#15 
      00A3E0 00 04            [ 2] 2810 	jrule 2$
      00A3E2 00 02            [ 1] 2811 	ld a,#ERR_BAD_VALUE
      00A3E4 72 B9 00         [ 2] 2812 	jp tb_error 
      00A3E7 01 17 03         [ 4] 2813 2$:	call select_pin 
      00A3EA 90 AE            [ 1] 2814 	ld (PINNO,sp),a 
      00A3EC 00 03            [ 1] 2815 	ld a,#1
      00A3EE 17 05            [ 1] 2816 	tnz (PINNO,sp)
      00A3F0 90 85            [ 1] 2817 	jreq 4$
      00A3F2 20               [ 1] 2818 3$: sll a
      00A3F3 16 01            [ 1] 2819 	dec (PINNO,sp)
      00A3F4 26 FB            [ 1] 2820 	jrne 3$
      00A3F4 55 00            [ 1] 2821 4$: tnz (PINVAL,sp)
      00A3F6 04 00            [ 1] 2822 	jrne 5$
      00A3F8 02               [ 1] 2823 	cpl a 
      00A3F9 4F 90            [ 1] 2824 	and a,(GPIO_ODR,x)
      00A3FB 85 81            [ 2] 2825 	jra 8$
      00A3FD EA 00            [ 1] 2826 5$: or a,(GPIO_ODR,x)
      00A3FD 72 00            [ 1] 2827 8$: ld (GPIO_ODR,x),a 
      0025D1                       2828 	_drop VSIZE 
      00A3FF 00 22            [ 2]    1     addw sp,#VSIZE 
      00A401 05               [ 4] 2829 	ret
                                   2830 
                                   2831 
                                   2832 ;-----------------------
                                   2833 ; BASIC: STOP
                                   2834 ; stop progam execution  
                                   2835 ; without resetting pointers 
                                   2836 ; the program is resumed
                                   2837 ; with RUN 
                                   2838 ;-------------------------
      0025D4                       2839 stop:
      00A402 A6 06 CC 96 C7   [ 2] 2840 	btjt flags,#FRUN,2$
      00A407 CD               [ 1] 2841 	clr a
      00A408 A2               [ 4] 2842 	ret 
      0025DB                       2843 2$:	 
                                   2844 ; create space on cstack to save context 
      00A409 ED 26 02         [ 2] 2845 	ldw x,#break_point 
      00A40A CD 09 75         [ 4] 2846 	call puts 
      0025E1                       2847 	_drop 2 ;drop return address 
      00A40A CF 00            [ 2]    1     addw sp,#2 
      0025E3                       2848 	_vars CTXT_SIZE ; context size 
      00A40C 05 E6            [ 2]    1     sub sp,#CTXT_SIZE 
      00A40E 02 C7 00         [ 4] 2849 	call save_context 
      00A411 04 35 03         [ 2] 2850 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A414 00 02 81         [ 2] 2851 	ldw basicptr,x
      00A417 7F               [ 1] 2852 	clr (x)
      00A417 72 00 00 22      [ 1] 2853 	clr count  
      00A41B 06               [ 1] 2854 	clrw x 
      00A41C A6 06 CC         [ 2] 2855 	ldw in.w,x
      00A41F 96 C7 81 85      [ 1] 2856 	bres flags,#FRUN 
      00A423 52 04 89 CE      [ 1] 2857 	bset flags,#FBREAK
      00A427 00 05 1F         [ 2] 2858 	jp interpreter 
      00A42A 03 CD A2 ED 89 CE 00  2859 break_point: .asciz "\nbreak point, RUN to resume.\n"
             01 1F 07 85 20 D3 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2860 
                                   2861 ;-----------------------
                                   2862 ; BASIC: NEW
                                   2863 ; from command line only 
                                   2864 ; free program memory
                                   2865 ; and clear variables 
                                   2866 ;------------------------
      00A437                       2867 new: 
      00A437 72 00 00 22 05   [ 2] 2868 	btjf flags,#FRUN,0$ 
      00A43C A6               [ 4] 2869 	ret 
      002626                       2870 0$:	
      00A43D 06 CC 96         [ 4] 2871 	call clear_basic 
      00A440 C7               [ 4] 2872 	ret 
                                   2873 
                                   2874 ;-----------------------------------
                                   2875 ; BASIC: ERASE \E | \F 
                                   2876 ; erase all block in range from 
                                   2877 ;  'app_space' to FLASH end (0x20000)
                                   2878 ;  or all EEPROM 
                                   2879 ; that contains a non zero byte.  
                                   2880 ;-----------------------------------
                           000001  2881 	LIMIT=1 
                           000003  2882 	VSIZE = 3 
      00A441                       2883 erase:
      00A441 1E 03 CF 00      [ 1] 2884 	clr farptr 
      00262E                       2885 	_vars VSIZE 
      00A445 05 E6            [ 2]    1     sub sp,#VSIZE 
      00A447 02 C7 00         [ 4] 2886 	call next_token 
      00A44A 04 1E            [ 1] 2887 	cp a,#TK_CHAR 
      00A44C 05 CF            [ 1] 2888 	jreq 0$ 
      00A44E 00 01 85         [ 2] 2889 	jp syntax_error
      00A451 5B 04 89         [ 4] 2890 0$: call get_char 
      00A454 81 DF            [ 1] 2891 	and a,#0XDF 
      00A455 A1 45            [ 1] 2892 	cp a,#'E
      00A455 72 01            [ 1] 2893 	jrne 1$
      00A457 00 22 02         [ 2] 2894 	ldw x,#EEPROM_BASE 
      00A45A 4F 81 18         [ 2] 2895 	ldw farptr+1,x 
      00A45C AE 47 FF         [ 2] 2896 	ldw x,#EEPROM_END
      00A45C 72               [ 1] 2897 	clr a 
      00A45D 09 00            [ 2] 2898 	jra 3$ 
      00A45F 22 12            [ 1] 2899 1$: cp a,#'F 
      00A461 5B 02            [ 1] 2900 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A463 CD A0 18         [ 2] 2901 	ldw x,#err_bad_value
      00A466 5B 04 72         [ 2] 2902 	jp tb_error
      002659                       2903 2$:
      00A469 19 00 22         [ 2] 2904 	ldw x,#app_sign 
      00A46C 72 10 00         [ 2] 2905 	ldw farptr+1,x 
      00A46F 22 CC            [ 1] 2906 	ld a,#(FLASH_END>>16)&0XFF 
      00A471 97 68 CE         [ 2] 2907 	ldw x,#FLASH_END&0xffff
      002664                       2908 3$:
      00A474 00 1B            [ 1] 2909 	ld (LIMIT,sp),a 
      00A476 C3 00            [ 2] 2910 	ldw (LIMIT+1,sp),x 
                                   2911  ; operation done from RAM
                                   2912  ; copy code to RAM in tib   
      00A478 1D 2B 0C         [ 4] 2913 	call move_erase_to_ram
      00266B                       2914 4$:	 
      00A47B AE 96 54         [ 4] 2915     call scan_block 
      00A47E CD 89            [ 1] 2916 	jreq 5$  ; block already erased 
      00A480 F5 55            [ 1] 2917     ld a,#'E 
      00A482 00 04 00         [ 4] 2918     call putc 
      00A485 02 81 99         [ 4] 2919 	call block_erase   
                                   2920 ; this block is clean, next  
      00A487 AE 00 80         [ 2] 2921 5$:	ldw x,#BLOCK_SIZE
      00A487 5B 02 8A         [ 4] 2922 	call incr_farptr
                                   2923 ; check limit, 24 bit substraction  	
      00A489 7B 01            [ 1] 2924 	ld a,(LIMIT,sp)
      00A489 CD 9C            [ 2] 2925 	ldw x,(LIMIT+1,sp)
      00A48B 1E CD 94 79      [ 2] 2926 	subw x,farptr+1
      00A48F 5F CF 00         [ 1] 2927 	sbc a,farptr 
      00A492 07 72            [ 1] 2928 	jrugt 4$ 
      00A494 5F 00 09         [ 4] 2929 9$: call clear_basic
      00A497 72 5F            [ 2] 2930 	ldw x,(LIMIT+1,sp)
      00A499 00 0A CE         [ 2] 2931 	cpw x,#EEPROM_END
      00A49C 00 1B            [ 1] 2932 	jrne 10$
      00A49E CF 00 05         [ 4] 2933 	call func_eefree 
      002698                       2934 10$:
      002698                       2935 	_drop VSIZE 
      00A4A1 E6 02            [ 2]    1     addw sp,#VSIZE 
      00A4A3 C7               [ 4] 2936 	ret 
                                   2937 	
                                   2938 
                                   2939 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2940 ;  check for application signature 
                                   2941 ; output:
                                   2942 ;   Carry    0 app present 
                                   2943 ;            1 no app installed  
                                   2944 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00269B                       2945 qsign: 
      00A4A4 00 04 35         [ 2] 2946 	ldw x,app_sign 
      00A4A7 03 00 02         [ 2] 2947 	cpw x,SIGNATURE ; "BC" 
      00A4AA 72               [ 4] 2948 	ret 
                                   2949 
                                   2950 ;--------------------------------------
                                   2951 ;  fill write buffer 
                                   2952 ;  input:
                                   2953 ;    y  point to output buffer 
                                   2954 ;    x  point to source 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2955 ;    a  bytes to write in buffer 
                                   2956 ;  output:
                                   2957 ;    y   += A 
                                   2958 ;    X   += A 
                                   2959 ;    A   0 
                                   2960 ;---------------------------------------
      0026A2                       2961 fill_write_buffer:
      00A4AB 10               [ 1] 2962 	push a 
      00A4AC 00               [ 1] 2963 	tnz a 
      00A4AD 22 CC            [ 1] 2964 	jreq 9$ 
      00A4AF 97               [ 1] 2965 1$: ld a,(x)
      00A4B0 68               [ 1] 2966 	incw x 
      00A4B1 90 F7            [ 1] 2967 	ld (y),a 
      00A4B1 AE 17            [ 1] 2968 	incw y 
      00A4B3 FF 94            [ 1] 2969 	dec (1,sp) 
      00A4B5 CC 97            [ 1] 2970 	jrne 1$ 
      00A4B7 49               [ 1] 2971 9$:	pop a 
      00A4B8 81               [ 4] 2972     ret 	
                                   2973 
                                   2974 ;--------------------------------------
                                   2975 ;  fill pad buffer with zero 
                                   2976 ;  input:
                                   2977 ;	none 
                                   2978 ;  output:
                                   2979 ;    y     buffer address  
                                   2980 ;--------------------------------------
      0026B2                       2981 clear_block_buffer:
      00A4B8 CD               [ 1] 2982 	push a 
      00A4B9 97 BE A1 85      [ 2] 2983 	ldw y,#block_buffer 
      00A4BD 27 03            [ 2] 2984 	pushw y
      00A4BF CC 96            [ 1] 2985 	ld a,#BLOCK_SIZE   
      00A4C1 C5 CD            [ 1] 2986 1$:	clr (y)
      00A4C3 97 F1            [ 1] 2987 	incw y
      00A4C5 CF               [ 1] 2988 	dec a  
      00A4C6 00 19            [ 1] 2989 	jrne 1$ 	
      00A4C8 CD 89            [ 2] 2990 9$: popw y 
      00A4CA A1               [ 1] 2991 	pop a 			
      00A4CB 27               [ 4] 2992 	ret 
                                   2993 
                                   2994 
                                   2995 ;---------------------------------------
                                   2996 ; BASIC: SAVE
                                   2997 ; write application from RAM to FLASH
                                   2998 ;--------------------------------------
                           000001  2999 	XTEMP=1
                           000003  3000 	COUNT=3  ; last count bytes written 
                           000004  3001 	CNT_LO=4 ; count low byte 
                           000005  3002 	TOWRITE=5 ; how bytes left to write  
                           000006  3003 	VSIZE=6 
      0026C6                       3004 save_app:
      00A4CC 03               [ 2] 3005 	pushw x 
      00A4CD CD 89            [ 2] 3006 	pushw y 
      0026C9                       3007 	_vars VSIZE
      00A4CF A8 72            [ 2]    1     sub sp,#VSIZE 
      00A4D1 3F 00 19         [ 4] 3008 	call qsign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A4D4 72 5C            [ 1] 3009 	jrne 1$
      00A4D6 00 1A 72         [ 2] 3010 	ldw x,#CANT_DO 
      00A4D9 3F 00 19         [ 4] 3011 	call puts 
      00A4DC 72 5C 00         [ 2] 3012 	jp 9$
      0026D9                       3013 1$: 
      00A4DF 1A 72 C7         [ 2] 3014 	ldw x,txtbgn
      00A4E2 00 19 81         [ 2] 3015 	cpw x,txtend 
      00A4E5 25 09            [ 1] 3016 	jrult 2$ 
      00A4E5 AE 00 64         [ 2] 3017 	ldw x,#NO_APP
      00A4E8 90 AE 03         [ 4] 3018 	call puts 
      00A4EB E8 20 20         [ 2] 3019 	jp 9$
      00A4EE                       3020 2$: 
                                   3021 ; block programming flash
                                   3022 ; must be done from RAM
                                   3023 ; moved in tib  
      00A4EE CD 99 76         [ 4] 3024 	call move_prg_to_ram
                                   3025 ; initialize farptr 
                                   3026 ; to app_sign address 
      00A4F1 A1 02 27 03      [ 1] 3027 	clr farptr 
      00A4F5 CC 96 C5         [ 2] 3028 	ldw x,#app_sign 
      00A4F8 CF 00 18         [ 2] 3029 	ldw farptr+1,x
                                   3030 ; initialize local variables 
      00A4F8 90 F6 93         [ 4] 3031 	call prog_size
      00A4FB EE 01            [ 2] 3032 	ldw (TOWRITE,sp),x
      00A4FD 72 A9            [ 1] 3033 	clr (COUNT,sp)
                                   3034 ; first bock 
                                   3035 ; containt signature 2 bytes 
                                   3036 ; and size 	2 bytes 
                                   3037 ; use Y as pointer to block_buffer
      00A4FF 00 03 89         [ 4] 3038 	call clear_block_buffer ; -- y=*block_buffer	
                                   3039 ; write signature
      00A502 90 F6 93         [ 2] 3040 	ldw x,SIGNATURE ; "BC" 
      00A505 EE 01            [ 2] 3041 	ldw (y),x 
      00A507 72 A9 00 03      [ 2] 3042 	addw y,#2
      00A50B 90 93            [ 2] 3043 	ldw x,(TOWRITE,sp)
      00A50D 85 FF            [ 2] 3044 	ldw (y),x
      00A50E 72 A9 00 02      [ 2] 3045 	addw y,#2   
      00A50E 89 AE            [ 1] 3046 	ld a,#(BLOCK_SIZE-4)
      00A510 F4 24            [ 1] 3047 	ld (CNT_LO,sp),a 
      00A512 65 90 A3         [ 2] 3048 	cpw x,#(BLOCK_SIZE-4) 
      00A515 7A 12            [ 1] 3049 	jrugt 3$
      00A517 2B               [ 1] 3050 	ld a,xl 
      00A518 01 5C            [ 1] 3051 3$:	ld (CNT_LO,sp),a   
      00A51A CE 00 1A         [ 2] 3052 	ldw x,txtbgn 
      00A51A 9E C7            [ 2] 3053 	ldw (XTEMP,sp),x 
      002723                       3054 32$: 
      00A51C 53 0D            [ 2] 3055 	ldw x,(XTEMP,sp)
      00A51E 9F C7            [ 1] 3056 	ld a,(CNT_LO,sp)
      00A520 53 0E 8C         [ 4] 3057 	call fill_write_buffer 
      00A523 56 9E            [ 2] 3058 	ldw (XTEMP,sp),x 
      00A525 C7 53 0F         [ 2] 3059 	ldw x,#block_buffer
      00A528 9F C7 53         [ 4] 3060 	call write_buffer
      00A52B 10 72 10         [ 2] 3061 	ldw x,#BLOCK_SIZE 
      00A52E 53 08 72         [ 4] 3062 	call incr_farptr  
                                   3063 ; following blocks 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A531 10 53            [ 2] 3064 	ldw x,(XTEMP,sp)
      00A533 00 72 10         [ 2] 3065 	cpw x,txtend 
      00A536 53 04            [ 1] 3066 	jruge 9$ 
      00A538 85 CD            [ 2] 3067 	ldw x,(TOWRITE,sp)
      00A53A A9 95 72         [ 2] 3068 	subw x,(COUNT,sp)
      00A53D 11 53            [ 2] 3069 	ldw (TOWRITE,sp),x 
      00A53F 08 72            [ 1] 3070 	ld a,#BLOCK_SIZE 
      00A541 11 53 00         [ 2] 3071 	cpw x,#BLOCK_SIZE 
      00A544 81 01            [ 1] 3072 	jruge 4$ 
      00A545 9F               [ 1] 3073 	ld a,xl 
      00A545 CD 99            [ 1] 3074 4$:	ld (CNT_LO,sp),a 
      00A547 76 A1 02         [ 4] 3075 	call clear_block_buffer 
      00A54A 27 12            [ 2] 3076 	jra 32$ 
      002755                       3077 9$:	_drop VSIZE 
      00A54C A1 01            [ 2]    1     addw sp,#VSIZE 
      00A54E 27 03            [ 2] 3078     popw y 
      00A550 CC               [ 2] 3079 	popw x 
      00A551 96               [ 4] 3080 	ret 
                                   3081 
                                   3082 
      00A552 C5 4F                 3083 SIGNATURE: .ascii "BC"
      00A554 5F 72 A2 00 03 90 F7  3084 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             90 EF 01 90 E6 03 93
             EE 04 5D 27 25 90 F6
             93 EE 01 72 A9 00 03
             72 A9 00 03 9F A4 07
             4E C7 54 01 72 16 50
             CA 72 10 54 01 AE 00
             1B 5A 9D 26 FA 20 08
             72 11 54 01 72 17 50
             CA 65 00
      00A594 4E 6F 20 61 70 70 6C  3085 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3086 
                                   3087 ;---------------------
                                   3088 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3089 ; write 1 or more byte to FLASH or EEPROM
                                   3090 ; starting at address  
                                   3091 ; input:
                                   3092 ;   expr1  	is address 
                                   3093 ;   expr2,...,exprn   are bytes to write
                                   3094 ; output:
                                   3095 ;   none 
                                   3096 ;---------------------
      0027B5                       3097 write:
      00A594 81 1A 33         [ 4] 3098 	call expression
      00A595 A1 84            [ 1] 3099 	cp a,#TK_INTGR 
      00A595 CD 99            [ 1] 3100 	jreq 0$
      00A597 71 A1 01         [ 2] 3101 	jp syntax_error
      0027BF                       3102 0$: _xpop 
      00A59A 27 03            [ 1]    1     ld a,(y)
      00A59C CC               [ 1]    2     ldw x,y 
      00A59D 96 C5            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A59F 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A5A3 01 72 A9         [ 1] 3103 	ld farptr,a 
      00A5A6 00 03 A3         [ 2] 3104 	ldw ptr16,x 
      0027CE                       3105 1$:	
      00A5A9 00 05 23         [ 4] 3106 	call next_token 
      00A5AC 05 A6            [ 1] 3107 	cp a,#TK_COMMA 
      00A5AE 0A CC            [ 1] 3108 	jreq 2$ 
      00A5B0 96 C7            [ 2] 3109 	jra 9$ ; no more data 
      00A5B2 9F C7 00         [ 4] 3110 2$:	call expression
      00A5B5 0F A6            [ 1] 3111 	cp a,#TK_INTGR
      00A5B7 05 C0            [ 1] 3112 	jreq 3$
      00A5B9 00 0F C7         [ 2] 3113 	jp syntax_error
      0027E1                       3114 3$:	_xpop 
      00A5BC 54 00            [ 1]    1     ld a,(y)
      00A5BE 72               [ 1]    2     ldw x,y 
      00A5BF 16 54            [ 2]    3     ldw x,(1,x)
      00A5C1 02 72 10 54      [ 2]    4     addw y,#CELL_SIZE 
      00A5C5 01               [ 1] 3115 	ld a,xl 
      00A5C6 72               [ 1] 3116 	clrw x 
      00A5C7 0F 54 00         [ 4] 3117 	call write_byte
      00A5CA FB CE 54         [ 2] 3118 	ldw x,#1 
      00A5CD 04 A6 84         [ 4] 3119 	call incr_farptr 
      00A5D0 81 D7            [ 2] 3120 	jra 1$ 
      00A5D1                       3121 9$:
      00A5D1 52               [ 4] 3122 	ret 
                                   3123 
                                   3124 
                                   3125 ;---------------------
                                   3126 ;BASIC: CHAR(expr)
                                   3127 ; évaluate expression 
                                   3128 ; and take the 7 least 
                                   3129 ; bits as ASCII character
                                   3130 ; output: 
                                   3131 ; 	A char 
                                   3132 ;---------------------
      0027F8                       3133 char:
      00A5D2 01 CD 99         [ 4] 3134 	call func_args 
      00A5D5 71 A1            [ 1] 3135 	cp a,#1
      00A5D7 01 27            [ 1] 3136 	jreq 1$
      00A5D9 03 CC 96         [ 2] 3137 	jp syntax_error
      002802                       3138 1$:	_xpop
      00A5DC C5 90            [ 1]    1     ld a,(y)
      00A5DE F6               [ 1]    2     ldw x,y 
      00A5DF 93 EE            [ 2]    3     ldw x,(1,x)
      00A5E1 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5E5 03               [ 1] 3139 	ld a,xl
      00A5E6 A3 00            [ 1] 3140 	and a,#0x7f 
      00A5E8 0F               [ 4] 3141 	ret
                                   3142 
                                   3143 ;---------------------
                                   3144 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3145 ; extract first character 
                                   3146 ; of string argument 
                                   3147 ; output:
                                   3148 ;    A:X    int24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3149 ;---------------------
      00280F                       3150 ascii:
      00A5E9 23 05            [ 1] 3151 	ld a,#TK_LPAREN
      00A5EB A6 0A CC         [ 4] 3152 	call expect 
      00A5EE 96 C7 CD         [ 4] 3153 	call next_token 
      00A5F1 AB 6C            [ 1] 3154 	cp a,#TK_QSTR 
      00A5F3 6B 01            [ 1] 3155 	jreq 1$
      00A5F5 E6 01            [ 1] 3156 	cp a,#TK_CHAR 
      00A5F7 0D 01            [ 1] 3157 	jreq 2$ 
      00A5F9 27 05            [ 1] 3158 	cp a,#TK_CFUNC 
      00A5FB 44 0A            [ 1] 3159 	jreq 0$
      00A5FD 01 26 FB         [ 2] 3160 	jp syntax_error
      002826                       3161 0$: ; cfunc 
      00A600 A4               [ 4] 3162 	call (x)
      00A601 01 5F            [ 2] 3163 	jra 3$
      002829                       3164 1$: ; quoted string 
      00A603 97               [ 1] 3165 	ld a,(x)
      00A604 A6               [ 1] 3166 	push a  
      00A605 84 5B 01         [ 4] 3167 	call skip_string
      00A608 81               [ 1] 3168 	pop a  	
      00A609 20 03            [ 2] 3169 	jra 3$ 
      002831                       3170 2$: ; character 
      00A609 52 02 CD         [ 4] 3171 	call get_char 
      00A60C 99               [ 1] 3172 3$:	clrw x 
      00A60D 76               [ 1] 3173 	rlwa x   
      002836                       3174 4$:	_xpush  
      00A60E A1 02 27 03      [ 2]    1     subw y,#CELL_SIZE
      00A612 CC 96            [ 1]    2     ld (y),a 
      00A614 C5 90 F6         [ 2]    3     ldw (1,y),x 
      00A617 93 EE            [ 1] 3175 	ld a,#TK_RPAREN 
      00A619 01 72 A9         [ 4] 3176 	call expect
      002844                       3177 9$:	
      002844                       3178 	_xpop  
      00A61C 00 03            [ 1]    1     ld a,(y)
      00A61E 9F               [ 1]    2     ldw x,y 
      00A61F 6B 02            [ 2]    3     ldw x,(1,x)
      00A621 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A625 01               [ 4] 3179 	ret 
                                   3180 
                                   3181 ;---------------------
                                   3182 ;BASIC: KEY
                                   3183 ; wait for a character 
                                   3184 ; received from STDIN 
                                   3185 ; input:
                                   3186 ;	none 
                                   3187 ; output:
                                   3188 ;	a	 character 
                                   3189 ;---------------------
      00284E                       3190 key:
      00A626 72 A9 00         [ 4] 3191 	call getc 
      00A629 03               [ 4] 3192 	ret
                                   3193 
                                   3194 ;----------------------
                                   3195 ; BASIC: QKEY
                                   3196 ; Return true if there 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3197 ; is a character in 
                                   3198 ; waiting in STDIN 
                                   3199 ; input:
                                   3200 ;  none 
                                   3201 ; output:
                                   3202 ;   A     0|-1
                                   3203 ;-----------------------
      002852                       3204 qkey:: 
      00A62A A3               [ 1] 3205 	clrw x 
      00A62B 00 0F 23         [ 1] 3206 	ld a,rx1_head
      00A62E 05 A6 0A         [ 1] 3207 	sub a,rx1_tail 
      00A631 CC 96            [ 1] 3208 	jreq 9$ 
      00A633 C7               [ 2] 3209 	cplw x
      00A634 CD AB            [ 1] 3210 	ld a,#255    
      00285E                       3211 9$: 
      00A636 6C               [ 4] 3212 	ret 
                                   3213 
                                   3214 ;---------------------
                                   3215 ; BASIC: GPIO(expr,reg)
                                   3216 ; return gpio address 
                                   3217 ; expr {0..8}
                                   3218 ; input:
                                   3219 ;   none 
                                   3220 ; output:
                                   3221 ;   X 		gpio register address
                                   3222 ;----------------------------
                                   3223 ;	N=PORT
                                   3224 ;	T=REG 
      00285F                       3225 gpio:
      00A637 6B 01 A6         [ 4] 3226 	call func_args 
      00A63A 01 0D            [ 1] 3227 	cp a,#2
      00A63C 01 27            [ 1] 3228 	jreq 1$
      00A63E 05 48 0A         [ 2] 3229 	jp syntax_error  
      002869                       3230 1$:	_at_next 
      00A641 01 26 FB         [ 1]    1     ld a,(3,y)
      00A644 0D               [ 1]    2     ldw x,y 
      00A645 02 26            [ 2]    3     ldw x,(4,x)
      00A647 05               [ 2] 3231 	tnzw x 
      00A648 43 E4            [ 1] 3232 	jrmi bad_port
      00A64A 00 20 02         [ 2] 3233 	cpw x,#9
      00A64D EA 00            [ 1] 3234 	jrpl bad_port
      00A64F E7 00            [ 1] 3235 	ld a,#5
      00A651 5B               [ 4] 3236 	mul x,a
      00A652 02 81 00         [ 2] 3237 	addw x,#GPIO_BASE 
      00A654 89               [ 2] 3238 	pushw x 
      00287E                       3239 	_xpop
      00A654 72 00            [ 1]    1     ld a,(y)
      00A656 00               [ 1]    2     ldw x,y 
      00A657 22 02            [ 2]    3     ldw x,(1,x)
      00A659 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A65B 72 FB 01         [ 2] 3240 	addw x,(1,sp)
      00288A                       3241 	_drop 2 
      00A65B AE A6            [ 2]    1     addw sp,#2 
      00A65D 82               [ 1] 3242 	clr a 
      00288D                       3243 	_store_top 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A65E CD 89            [ 1]    1     ld (y),a 
      00A660 F5 5B 02         [ 2]    2     ldw (1,y),x     
      00A663 52 04            [ 1] 3244 	ld a,#TK_INTGR
      00A665 CD               [ 4] 3245 	ret
      002895                       3246 bad_port:
      00A666 A0 08            [ 1] 3247 	ld a,#ERR_BAD_VALUE
      00A668 AE 16 68         [ 2] 3248 	jp tb_error
                                   3249 
                                   3250 
                                   3251 ;-------------------------
                                   3252 ; BASIC: UFLASH 
                                   3253 ; return free flash address
                                   3254 ; input:
                                   3255 ;  none 
                                   3256 ; output:
                                   3257 ;	A		TK_INTGR
                                   3258 ;   xstack	free address 
                                   3259 ;---------------------------
      00289A                       3260 uflash:
      00A66B CF 00 05         [ 2] 3261 	ldw x,app_sign
      00A66E 7F 72 5F         [ 2] 3262 	cpw x,#4243 ; signature "BC" 
      00A671 00 04            [ 1] 3263 	jreq 1$
      00A673 5F CF 00         [ 2] 3264 	ldw x,app_size 
      00A676 01 72 11         [ 2] 3265 	addw x,#app
      00A679 00 22            [ 2] 3266 	jra 2$
      00A67B 72 18 00         [ 2] 3267 1$:	ldw x,#app_space 
      00A67E 22               [ 1] 3268 2$:	clr a 
      00A67F CC               [ 4] 3269 	ret 
                                   3270 
                                   3271 
                                   3272 ;---------------------
                                   3273 ; BASIC: USR(addr[,arg])
                                   3274 ; execute a function written 
                                   3275 ; in binary code.
                                   3276 ; binary fonction should 
                                   3277 ; return token attribute in A 
                                   3278 ; and value in YL:X. 
                                   3279 ; input:
                                   3280 ;   addr	routine address 
                                   3281 ;   arg 	is an optional argument 
                                   3282 ; output:
                                   3283 ;   A 		token attribute 
                                   3284 ;   xstack  returned value 
                                   3285 ;---------------------
      0028AF                       3286 usr:
      00A680 97               [ 2] 3287 	pushw x 
      00A681 68 0A            [ 2] 3288 	pushw y 	
      00A683 62 72 65         [ 4] 3289 	call func_args 
      00A686 61 6B            [ 1] 3290 	cp a,#1 
      00A688 20 70            [ 1] 3291 	jreq 1$
      00A68A 6F 69            [ 1] 3292 	cp a,#2
      00A68C 6E 74            [ 1] 3293 	jreq 1$  
      00A68E 2C 20 52         [ 2] 3294 	jp syntax_error 
      00A691 55               [ 1] 3295 1$: push a 
      0028C1                       3296 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A692 4E 20            [ 1]    1     ld a,(y)
      00A694 74               [ 1]    2     ldw x,y 
      00A695 6F 20            [ 2]    3     ldw x,(1,x)
      00A697 72 65 73 75      [ 2]    4     addw y,#CELL_SIZE 
      00A69B 6D 65            [ 1] 3297 	ldw y,x  ; arg|addr 
      00A69D 2E               [ 1] 3298     pop a 
      00A69E 0A 00            [ 1] 3299 	cp a,#1 
      00A6A0 27 0A            [ 1] 3300 	jreq 3$
      0028D1                       3301 	_xpop  ; x=code addr  
      00A6A0 72 01            [ 1]    1     ld a,(y)
      00A6A2 00               [ 1]    2     ldw x,y 
      00A6A3 22 01            [ 2]    3     ldw x,(1,x)
      00A6A5 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A6A6 51               [ 1] 3302 	exgw x,y ; y=code addr, x=arg 
      00A6A6 CD 95            [ 4] 3303 3$: call (y)
      00A6A8 21               [ 1] 3304 	push a 
      00A6A9 81 9F            [ 1] 3305 	ld a,yl  
      00A6AA                       3306 	_xpush 
      00A6AA 72 5F 00 18      [ 2]    1     subw y,#CELL_SIZE
      00A6AE 52 03            [ 1]    2     ld (y),a 
      00A6B0 CD 97 BE         [ 2]    3     ldw (1,y),x 
      00A6B3 A1               [ 1] 3307 	pop a 
      00A6B4 04 27            [ 2] 3308 	popw y 
      00A6B6 03               [ 2] 3309 	popw x 
      00A6B7 CC               [ 4] 3310 	ret 
                                   3311 
                                   3312 
                                   3313 ;------------------------------
                                   3314 ; BASIC: BYE 
                                   3315 ; halt mcu in its lowest power mode 
                                   3316 ; wait for reset or external interrupt
                                   3317 ; do a cold start on wakeup.
                                   3318 ;------------------------------
      0028EE                       3319 bye:
      00A6B8 96 C5 CD 98 04   [ 2] 3320 	btjf UART1_SR,#UART_SR_TC,.
      00A6BD A4               [10] 3321 	halt
      00A6BE DF A1 45         [ 2] 3322 	jp cold_start  
                                   3323 
                                   3324 ;----------------------------------
                                   3325 ; BASIC: SLEEP 
                                   3326 ; halt mcu until reset or external
                                   3327 ; interrupt.
                                   3328 ; Resume progam after SLEEP command
                                   3329 ;----------------------------------
      0028F7                       3330 sleep:
      00A6C1 26 0C AE 40 00   [ 2] 3331 	btjf UART1_SR,#UART_SR_TC,.
      00A6C6 CF 00 19 AE      [ 1] 3332 	bset flags,#FSLEEP
      00A6CA 47               [10] 3333 	halt 
      00A6CB FF               [ 4] 3334 	ret 
                                   3335 
                                   3336 ;-------------------------------
                                   3337 ; BASIC: PAUSE expr 
                                   3338 ; suspend execution for n msec.
                                   3339 ; input:
                                   3340 ;	none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3341 ; output:
                                   3342 ;	none 
                                   3343 ;------------------------------
      002902                       3344 pause:
      00A6CC 4F 20 15         [ 4] 3345 	call expression
      00A6CF A1 46            [ 1] 3346 	cp a,#TK_INTGR
      00A6D1 27 06            [ 1] 3347 	jreq 1$ 
      00A6D3 AE 96 05         [ 2] 3348 	jp syntax_error
      00290C                       3349 1$: _xpop 
      00A6D6 CC 96            [ 1]    1     ld a,(y)
      00A6D8 C7               [ 1]    2     ldw x,y 
      00A6D9 EE 01            [ 2]    3     ldw x,(1,x)
      00A6D9 AE B6 00 CF      [ 2]    4     addw y,#CELL_SIZE 
      002915                       3350 pause02:
      00A6DD 00 19 A6         [ 2] 3351 	ldw timer,x 
      00A6E0 02 AE 7F         [ 2] 3352 1$: ldw x,timer 
      00A6E3 FF               [ 2] 3353 	tnzw x 
      00A6E4 27 03            [ 1] 3354 	jreq 2$
      00A6E4 6B               [10] 3355 	wfi 
      00A6E5 01 1F            [ 1] 3356 	jrne 1$
      00A6E7 02               [ 1] 3357 2$:	clr a 
      00A6E8 CD               [ 4] 3358 	ret 
                                   3359 
                                   3360 ;------------------------------
                                   3361 ; BASIC: AWU expr
                                   3362 ; halt mcu for 'expr' milliseconds
                                   3363 ; use Auto wakeup peripheral
                                   3364 ; all oscillators stopped except LSI
                                   3365 ; range: 1ms - 511ms
                                   3366 ; input:
                                   3367 ;  none
                                   3368 ; output:
                                   3369 ;  none:
                                   3370 ;------------------------------
      002923                       3371 awu:
      00A6E9 87 9B 33         [ 4] 3372   call expression
      00A6EB A1 84            [ 1] 3373   cp a,#TK_INTGR
      00A6EB CD 89            [ 1] 3374   jreq 1$
      00A6ED 18 27 08         [ 2] 3375   jp syntax_error
      00292D                       3376 1$: _xpop 
      00A6F0 A6 45            [ 1]    1     ld a,(y)
      00A6F2 CD               [ 1]    2     ldw x,y 
      00A6F3 89 98            [ 2]    3     ldw x,(1,x)
      00A6F5 CD 88 19 AE      [ 2]    4     addw y,#CELL_SIZE 
      002936                       3377 awu02:
      00A6F9 00 80 CD         [ 2] 3378   cpw x,#5120
      00A6FC 89 0A            [ 1] 3379   jrmi 1$ 
      00A6FE 7B 01 1E 02      [ 1] 3380   mov AWU_TBR,#15 
      00A702 72 B0            [ 1] 3381   ld a,#30
      00A704 00               [ 2] 3382   div x,a
      00A705 19 C2            [ 1] 3383   ld a,#16
      00A707 00               [ 2] 3384   div x,a 
      00A708 18 22            [ 2] 3385   jra 4$
      002947                       3386 1$: 
      00A70A E0 CD 95         [ 2] 3387   cpw x,#2048
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A70D 21 1E            [ 1] 3388   jrmi 2$ 
      00A70F 02 A3 47 FF      [ 1] 3389   mov AWU_TBR,#14
      00A713 26 03            [ 1] 3390   ld a,#80
      00A715 CD               [ 2] 3391   div x,a 
      00A716 9C E1            [ 2] 3392   jra 4$   
      00A718                       3393 2$:
      00A718 5B 03 81 F2      [ 1] 3394   mov AWU_TBR,#7
      00A71B                       3395 3$:  
                                   3396 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A71B CE B6 00         [ 2] 3397   cpw x,#64 
      00A71E C3 A7            [ 2] 3398   jrule 4$ 
      00A720 DB 81 50 F2      [ 1] 3399   inc AWU_TBR 
      00A722 54               [ 2] 3400   srlw x 
      00A722 88 4D            [ 2] 3401   jra 3$ 
      002965                       3402 4$:
      00A724 27               [ 1] 3403   ld a, xl
      00A725 0A               [ 1] 3404   dec a 
      00A726 F6 5C            [ 1] 3405   jreq 5$
      00A728 90               [ 1] 3406   dec a 	
      00296A                       3407 5$: 
      00A729 F7 90            [ 1] 3408   and a,#0x3e 
      00A72B 5C 0A 01         [ 1] 3409   ld AWU_APR,a 
      00A72E 26 F6 84 81      [ 1] 3410   bset AWU_CSR,#AWU_CSR_AWUEN
      00A732 8E               [10] 3411   halt 
                                   3412 
      00A732 88               [ 4] 3413   ret 
                                   3414 
                                   3415 ;------------------------------
                                   3416 ; BASIC: TICKS
                                   3417 ; return msec ticks counter value 
                                   3418 ; input:
                                   3419 ; 	none 
                                   3420 ; output:
                                   3421 ;	X 		TK_INTGR
                                   3422 ;-------------------------------
      002975                       3423 get_ticks:
      00A733 90 AE 16         [ 2] 3424 	ldw x,ticks 
      00A736 B8               [ 1] 3425 	clr a 
      002979                       3426 	_xpush 
      00A737 90 89 A6 80      [ 2]    1     subw y,#CELL_SIZE
      00A73B 90 7F            [ 1]    2     ld (y),a 
      00A73D 90 5C 4A         [ 2]    3     ldw (1,y),x 
      00A740 26 F9            [ 1] 3427 	ld a,#TK_INTGR
      00A742 90               [ 4] 3428 	ret 
                                   3429 
                                   3430 ;------------------------------
                                   3431 ; BASIC: ABS(expr)
                                   3432 ; return absolute value of expr.
                                   3433 ; input:
                                   3434 ;   none
                                   3435 ; output:
                                   3436 ;   xstack    positive int24 
                                   3437 ;-------------------------------
      002985                       3438 abs:
      00A743 85 84 81         [ 4] 3439 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A746 A1 01            [ 1] 3440 	cp a,#1 
      00A746 89 90            [ 1] 3441 	jreq 0$ 
      00A748 89 52 06         [ 2] 3442 	jp syntax_error
      00298F                       3443 0$:  
      00A74B CD A7 1B         [ 4] 3444 	call abs24 
      00A74E 26 09            [ 1] 3445     ld a,#TK_INTGR 
      00A750 AE               [ 4] 3446 	ret 
                                   3447 
                                   3448 ;------------------------------
                                   3449 ; BASIC: AND(expr1,expr2)
                                   3450 ; Apply bit AND relation between
                                   3451 ; the 2 arguments, i.e expr1 & expr2 
                                   3452 ; output:
                                   3453 ; 	A 		TK_INTGR
                                   3454 ;   X 		result 
                                   3455 ;------------------------------
      002995                       3456 bit_and: ; i1 i2 -- i1 & i2 
      00A751 A7 DD CD         [ 4] 3457 	call func_args 
      00A754 89 F5            [ 1] 3458 	cp a,#2
      00A756 CC A7            [ 1] 3459 	jreq 1$
      00A758 D5 16 45         [ 2] 3460 	jp syntax_error 
      00A759                       3461 1$:	_xpop 
      00A759 CE 00            [ 1]    1     ld a,(y)
      00A75B 1B               [ 1]    2     ldw x,y 
      00A75C C3 00            [ 2]    3     ldw x,(1,x)
      00A75E 1D 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A762 A8               [ 2] 3462     pushw x 
      00A763 1F               [ 1] 3463 	push  a 
      0029AA                       3464 	_at_top 
      00A764 CD 89            [ 1]    1     ld a,(y)
      00A766 F5               [ 1]    2     ldw x,y 
      00A767 CC A7            [ 2]    3     ldw x,(1,x)
      00A769 D5 01            [ 1] 3465 	and a,(1,sp)
      00A76A 02               [ 1] 3466 	rlwa x 
      00A76A CD 87            [ 1] 3467 	and a,(2,sp)
      00A76C DB               [ 1] 3468 	rlwa x 
      00A76D 72 5F            [ 1] 3469 	and a,(3,sp)
      00A76F 00               [ 1] 3470 	rlwa x 
      0029B8                       3471 	_drop 3 
      00A770 18 AE            [ 2]    1     addw sp,#3 
      0029BA                       3472 	_store_top 
      00A772 B6 00            [ 1]    1     ld (y),a 
      00A774 CF 00 19         [ 2]    2     ldw (1,y),x     
      00A777 CD 9D            [ 1] 3473 	ld a,#TK_INTGR
      00A779 F6               [ 4] 3474 	ret
                                   3475 
                                   3476 ;------------------------------
                                   3477 ; BASIC: OR(expr1,expr2)
                                   3478 ; Apply bit OR relation between
                                   3479 ; the 2 arguments, i.e expr1 | expr2 
                                   3480 ; output:
                                   3481 ; 	A 		TK_INTGR
                                   3482 ;   X 		result 
                                   3483 ;------------------------------
      0029C2                       3484 bit_or:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A77A 1F 05 0F         [ 4] 3485 	call func_args 
      00A77D 03 CD            [ 1] 3486 	cp a,#2
      00A77F A7 32            [ 1] 3487 	jreq 1$
      00A781 CE A7 DB         [ 2] 3488 	jp syntax_error 
      0029CC                       3489 1$:	_xpop 
      00A784 90 FF            [ 1]    1     ld a,(y)
      00A786 72               [ 1]    2     ldw x,y 
      00A787 A9 00            [ 2]    3     ldw x,(1,x)
      00A789 02 1E 05 90      [ 2]    4     addw y,#CELL_SIZE 
      00A78D FF               [ 2] 3490     pushw x 
      00A78E 72               [ 1] 3491 	push  a 
      0029D7                       3492 	_at_top 
      00A78F A9 00            [ 1]    1     ld a,(y)
      00A791 02               [ 1]    2     ldw x,y 
      00A792 A6 7C            [ 2]    3     ldw x,(1,x)
      00A794 6B 04            [ 1] 3493 	or a,(1,sp)
      00A796 A3 00            [ 1] 3494 	ld yl,a 
      00A798 7C               [ 1] 3495 	ld a,xh 
      00A799 22 01            [ 1] 3496 	or a,(2,sp)
      00A79B 9F               [ 1] 3497 	ld xh,a 
      00A79C 6B               [ 1] 3498 	ld a,xl 
      00A79D 04 CE            [ 1] 3499 	or a,(3,sp)
      00A79F 00               [ 1] 3500 	ld xl,a 
      00A7A0 1B 1F            [ 1] 3501 	ld a,yl 
      0029EA                       3502 	_drop 3 
      00A7A2 01 03            [ 2]    1     addw sp,#3 
      00A7A3                       3503 	_store_top 
      00A7A3 1E 01            [ 1]    1     ld (y),a 
      00A7A5 7B 04 CD         [ 2]    2     ldw (1,y),x     
      00A7A8 A7 22            [ 1] 3504 	ld a,#TK_INTGR
      00A7AA 1F               [ 4] 3505 	ret
                                   3506 
                                   3507 ;------------------------------
                                   3508 ; BASIC: XOR(expr1,expr2)
                                   3509 ; Apply bit XOR relation between
                                   3510 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3511 ; output:
                                   3512 ; 	A 		TK_INTGR
                                   3513 ;   X 		result 
                                   3514 ;------------------------------
      0029F4                       3515 bit_xor:
      00A7AB 01 AE 16         [ 4] 3516 	call func_args 
      00A7AE B8 CD            [ 1] 3517 	cp a,#2
      00A7B0 87 F5            [ 1] 3518 	jreq 1$
      00A7B2 AE 00 80         [ 2] 3519 	jp syntax_error 
      0029FE                       3520 1$:	_xpop 
      00A7B5 CD 89            [ 1]    1     ld a,(y)
      00A7B7 0A               [ 1]    2     ldw x,y 
      00A7B8 1E 01            [ 2]    3     ldw x,(1,x)
      00A7BA C3 00 1D 24      [ 2]    4     addw y,#CELL_SIZE 
      00A7BE 16               [ 2] 3521     pushw x 
      00A7BF 1E               [ 1] 3522 	push  a 
      002A09                       3523 	_at_top 
      00A7C0 05 72            [ 1]    1     ld a,(y)
      00A7C2 F0               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A7C3 03 1F            [ 2]    3     ldw x,(1,x)
      00A7C5 05 A6            [ 1] 3524 	xor a,(1,sp)
      00A7C7 80 A3            [ 1] 3525 	ld yl,a 
      00A7C9 00               [ 1] 3526 	ld a,xh 
      00A7CA 80 24            [ 1] 3527 	xor a,(2,sp)
      00A7CC 01               [ 1] 3528 	ld xh,a 
      00A7CD 9F               [ 1] 3529 	ld a,xl 
      00A7CE 6B 04            [ 1] 3530 	xor a,(3,sp)
      00A7D0 CD               [ 1] 3531 	ld xl,a 
      00A7D1 A7 32            [ 1] 3532 	ld a,yl 
      002A1C                       3533 	_drop 3 
      00A7D3 20 CE            [ 2]    1     addw sp,#3 
      002A1E                       3534 	_store_top 
      00A7D5 5B 06            [ 1]    1     ld (y),a 
      00A7D7 90 85 85         [ 2]    2     ldw (1,y),x     
      00A7DA 81 42            [ 1] 3535 	ld a,#TK_INTGR
      00A7DC 43               [ 4] 3536 	ret
                                   3537 
                                   3538 ;------------------------------
                                   3539 ; BASIC: LSHIFT(expr1,expr2)
                                   3540 ; logical shift left expr1 by 
                                   3541 ; expr2 bits 
                                   3542 ; output:
                                   3543 ; 	A 		TK_INTGR
                                   3544 ;   X 		result 
                                   3545 ;------------------------------
      002A26                       3546 lshift:
      00A7DD 43 61 6E         [ 4] 3547 	call func_args
      00A7E0 27 74            [ 1] 3548 	cp a,#2 
      00A7E2 20 66            [ 1] 3549 	jreq 1$
      00A7E4 6C 61 73         [ 2] 3550 	jp syntax_error
      002A30                       3551 1$: _xpop 
      00A7E7 68 20            [ 1]    1     ld a,(y)
      00A7E9 61               [ 1]    2     ldw x,y 
      00A7EA 70 70            [ 2]    3     ldw x,(1,x)
      00A7EC 6C 69 63 61      [ 2]    4     addw y,#CELL_SIZE 
      00A7F0 74 69            [ 1] 3552     ldw y,x    
      002A3B                       3553 	_at_top  ; T@ 
      00A7F2 6F 6E            [ 1]    1     ld a,(y)
      00A7F4 2C               [ 1]    2     ldw x,y 
      00A7F5 20 61            [ 2]    3     ldw x,(1,x)
      00A7F7 6C 72            [ 2] 3554 	tnzw y 
      00A7F9 65 61            [ 1] 3555 	jreq 4$
      00A7FB 64               [ 1] 3556 2$:	rcf 
      00A7FC 79               [ 2] 3557 	rlcw x 
      00A7FD 20               [ 1] 3558 	rlc a 
      00A7FE 6F 6E            [ 2] 3559 	decw y 
      00A800 65 20            [ 1] 3560 	jrne 2$
      002A4B                       3561 4$: _store_top  ; T! 
      00A802 69 6E            [ 1]    1     ld (y),a 
      00A804 20 46 4C         [ 2]    2     ldw (1,y),x     
      00A807 41 53            [ 1] 3562 	ld a,#TK_INTGR
      00A809 48               [ 4] 3563 	ret
                                   3564 
                                   3565 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3566 ; BASIC: RSHIFT(expr1,expr2)
                                   3567 ; logical shift right expr1 by 
                                   3568 ; expr2 bits.
                                   3569 ; output:
                                   3570 ; 	A 		TK_INTGR
                                   3571 ;   X 		result 
                                   3572 ;------------------------------
      002A53                       3573 rshift:
      00A80A 0A 75 73         [ 4] 3574 	call func_args
      00A80D 65 20            [ 1] 3575 	cp a,#2 
      00A80F 45 52            [ 1] 3576 	jreq 1$
      00A811 41 53 45         [ 2] 3577 	jp syntax_error
      002A5D                       3578 1$: _xpop 
      00A814 20 5C            [ 1]    1     ld a,(y)
      00A816 46               [ 1]    2     ldw x,y 
      00A817 20 62            [ 2]    3     ldw x,(1,x)
      00A819 65 66 6F 72      [ 2]    4     addw y,#CELL_SIZE 
      00A81D 65 00            [ 1] 3579     ldw y,x   
      002A68                       3580 	_at_top  ; T@  
      00A81F 4E 6F            [ 1]    1     ld a,(y)
      00A821 20               [ 1]    2     ldw x,y 
      00A822 61 70            [ 2]    3     ldw x,(1,x)
      00A824 70 6C            [ 2] 3581 	tnzw y 
      00A826 69 63            [ 1] 3582 	jreq 4$
      00A828 61               [ 1] 3583 2$:	rcf 
      00A829 74               [ 2] 3584 	rrcw x
      00A82A 69               [ 1] 3585 	rrc a  
      00A82B 6F 6E            [ 2] 3586 	decw y 
      00A82D 20 69            [ 1] 3587 	jrne 2$
      002A78                       3588 4$: _store_top  ; T! 
      00A82F 6E 20            [ 1]    1     ld (y),a 
      00A831 52 41 4D         [ 2]    2     ldw (1,y),x     
      00A834 00 84            [ 1] 3589 	ld a,#TK_INTGR
      00A835 81               [ 4] 3590 	ret
                                   3591 
                                   3592 ;--------------------------
                                   3593 ; BASIC: FCPU integer
                                   3594 ; set CPU frequency 
                                   3595 ;-------------------------- 
                                   3596 
      002A80                       3597 fcpu:
      00A835 CD 9A            [ 1] 3598 	ld a,#TK_INTGR
      00A837 B3 A1 84         [ 4] 3599 	call expect 
      00A83A 27 03 CC         [ 4] 3600 	call get_int24 
      00A83D 96               [ 1] 3601 	ld a,xl 
      00A83E C5 90            [ 1] 3602 	and a,#7 
      00A840 F6 93 EE         [ 1] 3603 	ld CLK_CKDIVR,a 
      00A843 01               [ 4] 3604 	ret 
                                   3605 
                                   3606 ;------------------------------
                                   3607 ; BASIC: PMODE pin#, mode 
                                   3608 ; Arduino pin. 
                                   3609 ; define pin as input or output
                                   3610 ; pin#: {0..15}
                                   3611 ; mode: INPUT|OUTPUT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3612 ;------------------------------
                           000001  3613 	PINNO=1
                           000001  3614 	VSIZE=1
      002A8F                       3615 pin_mode:
      002A8F                       3616 	_vars VSIZE 
      00A844 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A846 00 03 C7         [ 4] 3617 	call arg_list 
      00A849 00 18            [ 1] 3618 	cp a,#2 
      00A84B CF 00            [ 1] 3619 	jreq 1$
      00A84D 19 16 45         [ 2] 3620 	jp syntax_error 
      00A84E                       3621 1$: _xpop 
      00A84E CD 97            [ 1]    1     ld a,(y)
      00A850 BE               [ 1]    2     ldw x,y 
      00A851 A1 08            [ 2]    3     ldw x,(1,x)
      00A853 27 02 20 20      [ 2]    4     addw y,#CELL_SIZE 
      00A857 CD 9A            [ 1] 3622 	ldw y,x ; mode 
      002AA6                       3623 	_xpop ; Dx pin 
      00A859 B3 A1            [ 1]    1     ld a,(y)
      00A85B 84               [ 1]    2     ldw x,y 
      00A85C 27 03            [ 2]    3     ldw x,(1,x)
      00A85E CC 96 C5 90      [ 2]    4     addw y,#CELL_SIZE 
      00A862 F6 93 EE         [ 4] 3624 	call select_pin 
      00A865 01 72            [ 1] 3625 	ld (PINNO,sp),a  
      00A867 A9 00            [ 1] 3626 	ld a,#1 
      00A869 03 9F            [ 1] 3627 	tnz (PINNO,sp)
      00A86B 5F CD            [ 1] 3628 	jreq 4$
      00A86D 88               [ 1] 3629 2$:	sll a 
      00A86E 3A AE            [ 1] 3630 	dec (PINNO,sp)
      00A870 00 01            [ 1] 3631 	jrne 2$ 
      00A872 CD 89            [ 1] 3632 	ld (PINNO,sp),a
      00A874 0A 20            [ 1] 3633 	ld a,(PINNO,sp)
      00A876 D7 03            [ 1] 3634 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A877 E7 03            [ 1] 3635 	ld (GPIO_CR1,x),a 
      00A877 81 A3 00 01      [ 2] 3636 4$:	cpw y,#OUTP 
      00A878 27 10            [ 1] 3637 	jreq 6$
                                   3638 ; input mode
                                   3639 ; disable external interrupt 
      00A878 CD 99            [ 1] 3640 	ld a,(PINNO,sp)
      00A87A 71               [ 1] 3641 	cpl a 
      00A87B A1 01            [ 1] 3642 	and a,(GPIO_CR2,x)
      00A87D 27 03            [ 1] 3643 	ld (GPIO_CR2,x),a 
                                   3644 ;clear bit in DDR for input mode 
      00A87F CC 96            [ 1] 3645 	ld a,(PINNO,sp)
      00A881 C5               [ 1] 3646 	cpl a 
      00A882 90 F6            [ 1] 3647 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A884 93 EE            [ 1] 3648 	ld (GPIO_DDR,x),a 
      00A886 01 72            [ 2] 3649 	jra 9$
      002ADD                       3650 6$: ;output mode  
      00A888 A9 00            [ 1] 3651 	ld a,(PINNO,sp)
      00A88A 03 9F            [ 1] 3652 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A88C A4 7F            [ 1] 3653 	ld (GPIO_DDR,x),a 
      00A88E 81 01            [ 1] 3654 	ld a,(PINNO,sp)
      00A88F EA 04            [ 1] 3655 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A88F A6 06            [ 1] 3656 	ld (GPIO_CR2,x),a 
      002AE9                       3657 9$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      002AE9                       3658 	_drop VSIZE 
      00A891 CD 99            [ 2]    1     addw sp,#VSIZE 
      00A893 64               [ 4] 3659 	ret
                                   3660 
                                   3661 ;------------------------
                                   3662 ; select Arduino pin 
                                   3663 ; input:
                                   3664 ;   X 	 {0..15} Arduino Dx 
                                   3665 ; output:
                                   3666 ;   A     stm8s208 pin 
                                   3667 ;   X     base address s208 GPIO port 
                                   3668 ;---------------------------
      002AEC                       3669 select_pin:
      00A894 CD               [ 2] 3670 	sllw x 
      00A895 97 BE A1         [ 2] 3671 	addw x,#arduino_to_8s208 
      00A898 02               [ 2] 3672 	ldw x,(x)
      00A899 27               [ 1] 3673 	ld a,xl 
      00A89A 0E               [ 1] 3674 	push a 
      00A89B A1               [ 1] 3675 	swapw x 
      00A89C 04 27            [ 1] 3676 	ld a,#5 
      00A89E 12               [ 4] 3677 	mul x,a 
      00A89F A1 82 27         [ 2] 3678 	addw x,#GPIO_BASE 
      00A8A2 03               [ 1] 3679 	pop a 
      00A8A3 CC               [ 4] 3680 	ret 
                                   3681 ; translation from Arduino D0..D15 to stm8s208rb 
      002AFC                       3682 arduino_to_8s208:
      00A8A4 96 C5                 3683 .byte 3,6 ; D0 
      00A8A6 03 05                 3684 .byte 3,5 ; D1 
      00A8A6 FD 20                 3685 .byte 4,0 ; D2 
      00A8A8 0B 01                 3686 .byte 2,1 ; D3
      00A8A9 06 00                 3687 .byte 6,0 ; D4
      00A8A9 F6 88                 3688 .byte 2,2 ; D5
      00A8AB CD 97                 3689 .byte 2,3 ; D6
      00A8AD E5 84                 3690 .byte 3,1 ; D7
      00A8AF 20 03                 3691 .byte 3,3 ; D8
      00A8B1 02 04                 3692 .byte 2,4 ; D9
      00A8B1 CD 98                 3693 .byte 4,5 ; D10
      00A8B3 04 5F                 3694 .byte 2,6 ; D11
      00A8B5 02 72                 3695 .byte 2,7 ; D12
      00A8B7 A2 00                 3696 .byte 2,5 ; D13
      00A8B9 03 90                 3697 .byte 4,2 ; D14
      00A8BB F7 90                 3698 .byte 4,1 ; D15
                                   3699 
                                   3700 
                                   3701 ;------------------------------
                                   3702 ; BASIC: RND(expr)
                                   3703 ; return random number 
                                   3704 ; between 1 and expr inclusive
                                   3705 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3706 ; input:
                                   3707 ; 	none 
                                   3708 ; output:
                                   3709 ;	xstack 	random positive integer 
                                   3710 ;------------------------------
      002B1C                       3711 random:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A8BD EF 01 A6         [ 4] 3712 	call func_args 
      00A8C0 07 CD            [ 1] 3713 	cp a,#1
      00A8C2 99 64            [ 1] 3714 	jreq 1$
      00A8C4 CC 16 45         [ 2] 3715 	jp syntax_error
      002B26                       3716 1$:  
      002B26                       3717 	_xpop   
      00A8C4 90 F6            [ 1]    1     ld a,(y)
      00A8C6 93               [ 1]    2     ldw x,y 
      00A8C7 EE 01            [ 2]    3     ldw x,(1,x)
      00A8C9 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8CD 81               [ 2] 3718 	pushw x 
      00A8CE 88               [ 1] 3719 	push a  
      00A8CE CD 89            [ 1] 3720 	ld a,#0x80 
      00A8D0 A8 81            [ 1] 3721 	bcp a,(1,sp)
      00A8D2 27 05            [ 1] 3722 	jreq 2$
      00A8D2 5F C6            [ 1] 3723 	ld a,#ERR_BAD_VALUE
      00A8D4 00 2E C0         [ 2] 3724 	jp tb_error
      002B3C                       3725 2$: 
                                   3726 ; acc16=(x<<5)^x 
      00A8D7 00 2F 27         [ 2] 3727 	ldw x,seedx 
      00A8DA 03               [ 2] 3728 	sllw x 
      00A8DB 53               [ 2] 3729 	sllw x 
      00A8DC A6               [ 2] 3730 	sllw x 
      00A8DD FF               [ 2] 3731 	sllw x 
      00A8DE 58               [ 2] 3732 	sllw x 
      00A8DE 81               [ 1] 3733 	ld a,xh 
      00A8DF C8 00 13         [ 1] 3734 	xor a,seedx 
      00A8DF CD 99 71         [ 1] 3735 	ld acc16,a 
      00A8E2 A1               [ 1] 3736 	ld a,xl 
      00A8E3 02 27 03         [ 1] 3737 	xor a,seedx+1 
      00A8E6 CC 96 C5         [ 1] 3738 	ld acc8,a 
                                   3739 ; seedx=seedy 
      00A8E9 90 E6 03         [ 2] 3740 	ldw x,seedy 
      00A8EC 93 EE 04         [ 2] 3741 	ldw seedx,x  
                                   3742 ; seedy=seedy^(seedy>>1)
      00A8EF 5D 2B            [ 2] 3743 	srlw y 
      00A8F1 23 A3            [ 1] 3744 	ld a,yh 
      00A8F3 00 09 2A         [ 1] 3745 	xor a,seedy 
      00A8F6 1E A6 05         [ 1] 3746 	ld seedy,a  
      00A8F9 42 1C            [ 1] 3747 	ld a,yl 
      00A8FB 50 00 89         [ 1] 3748 	xor a,seedy+1 
      00A8FE 90 F6 93         [ 1] 3749 	ld seedy+1,a 
                                   3750 ; acc16>>3 
      00A901 EE 01 72         [ 2] 3751 	ldw x,acc16 
      00A904 A9               [ 2] 3752 	srlw x 
      00A905 00               [ 2] 3753 	srlw x 
      00A906 03               [ 2] 3754 	srlw x 
                                   3755 ; x=acc16^x 
      00A907 72               [ 1] 3756 	ld a,xh 
      00A908 FB 01 5B         [ 1] 3757 	xor a,acc16 
      00A90B 02               [ 1] 3758 	ld xh,a 
      00A90C 4F               [ 1] 3759 	ld a,xl 
      00A90D 90 F7 90         [ 1] 3760 	xor a,acc8 
      00A910 EF               [ 1] 3761 	ld xl,a 
                                   3762 ; seedy=x^seedy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A911 01 A6 84         [ 1] 3763 	xor a,seedy+1
      00A914 81               [ 1] 3764 	ld xl,a 
      00A915 9E               [ 1] 3765 	ld a,xh 
      00A915 A6 0A CC         [ 1] 3766 	xor a,seedy
      00A918 96               [ 1] 3767 	ld xh,a 
      00A919 C7 00 15         [ 2] 3768 	ldw seedy,x 
                                   3769 ; return seedy modulo expr + 1 
      00A91A C6 00 14         [ 1] 3770 	ld a,seedx+1 
      002B89                       3771 	_xpush 
      00A91A CE B6 00 A3      [ 2]    1     subw y,#CELL_SIZE
      00A91E 10 93            [ 1]    2     ld (y),a 
      00A920 27 08 CE         [ 2]    3     ldw (1,y),x 
      00A923 B6               [ 1] 3772 	pop a 
      00A924 02               [ 2] 3773 	popw x 
      002B94                       3774 	_xpush 
      00A925 1C B6 04 20      [ 2]    1     subw y,#CELL_SIZE
      00A929 03 AE            [ 1]    2     ld (y),a 
      00A92B B6 00 4F         [ 2]    3     ldw (1,y),x 
      00A92E 81 03 01         [ 4] 3775 	call div24 
      00A92F                       3776 10$:
      00A92F 89 90            [ 1] 3777 	ld a,#TK_INTGR
      00A931 89               [ 4] 3778 	ret 
                                   3779 
                                   3780 ;---------------------------------
                                   3781 ; BASIC: WORDS 
                                   3782 ; affiche la listes des mots du
                                   3783 ; dictionnaire ainsi que le nombre
                                   3784 ; de mots.
                                   3785 ;---------------------------------
                           000001  3786 	WLEN=1 ; word length
                           000002  3787 	LLEN=2 ; character sent to console
                           000003  3788 	WCNT=3 ; count words printed 
                           000003  3789 	VSIZE=3 
      002BA3                       3790 words:
      002BA3                       3791 	_vars VSIZE
      00A932 CD 99            [ 2]    1     sub sp,#VSIZE 
      00A934 71 A1            [ 1] 3792 	clr (LLEN,sp)
      00A936 01 27            [ 1] 3793 	clr (WCNT,sp)
      00A938 07 A1 02 27      [ 2] 3794 	ldw y,#kword_dict+2
      00A93C 03               [ 1] 3795 0$:	ldw x,y
      00A93D CC               [ 1] 3796 	ld a,(x)
      00A93E 96 C5            [ 1] 3797 	and a,#15 
      00A940 88 90            [ 1] 3798 	ld (WLEN,sp),a 
      00A942 F6 93            [ 1] 3799 	inc (WCNT,sp)
      00A944 EE               [ 1] 3800 1$:	incw x 
      00A945 01               [ 1] 3801 	ld a,(x)
      00A946 72 A9 00         [ 4] 3802 	call putc 
      00A949 03 90            [ 1] 3803 	inc (LLEN,sp)
      00A94B 93 84            [ 1] 3804 	dec (WLEN,sp)
      00A94D A1 01            [ 1] 3805 	jrne 1$
      00A94F 27 0A            [ 1] 3806 	ld a,#70
      00A951 90 F6            [ 1] 3807 	cp a,(LLEN,sp)
      00A953 93 EE            [ 1] 3808 	jrmi 2$   
      00A955 01 72            [ 1] 3809 	ld a,#SPACE 
      00A957 A9 00 03         [ 4] 3810 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A95A 51 90            [ 1] 3811 	inc (LLEN,sp) 
      00A95C FD 88            [ 2] 3812 	jra 3$
      00A95E 90 9F            [ 1] 3813 2$: ld a,#CR 
      00A960 72 A2 00         [ 4] 3814 	call putc 
      00A963 03 90            [ 1] 3815 	clr (LLEN,sp)
      00A965 F7 90 EF 01      [ 2] 3816 3$:	subw y,#2 
      00A969 84 90            [ 2] 3817 	ldw y,(y)
      00A96B 85 85            [ 1] 3818 	jrne 0$ 
      00A96D 81 0D            [ 1] 3819 	ld a,#CR 
      00A96E CD 09 18         [ 4] 3820 	call putc  
      00A96E 72               [ 1] 3821 	clrw x 
      00A96F 0D 52            [ 1] 3822 	ld a,(WCNT,sp)
      00A971 30               [ 1] 3823 	ld xl,a 
      00A972 FB 8E CC         [ 4] 3824 	call prt_i16 
      00A975 81 3D F3         [ 2] 3825 	ldw x,#words_count_msg
      00A977 CD 09 75         [ 4] 3826 	call puts 
      002BF0                       3827 	_drop VSIZE 
      00A977 72 0D            [ 2]    1     addw sp,#VSIZE 
      00A979 52               [ 4] 3828 	ret 
      00A97A 30 FB 72 16 00 22 8E  3829 words_count_msg: .asciz " words in dictionary\n"
             81 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3830 
                                   3831 
                                   3832 ;-----------------------------
                                   3833 ; BASIC: TIMER expr 
                                   3834 ; initialize count down timer 
                                   3835 ;-----------------------------
      00A982                       3836 set_timer:
      00A982 CD 9A B3         [ 4] 3837 	call arg_list
      00A985 A1 84            [ 1] 3838 	cp a,#1 
      00A987 27 03            [ 1] 3839 	jreq 1$
      00A989 CC 96 C5         [ 2] 3840 	jp syntax_error
      002C13                       3841 1$: 
      002C13                       3842 	_xpop  
      00A98C 90 F6            [ 1]    1     ld a,(y)
      00A98E 93               [ 1]    2     ldw x,y 
      00A98F EE 01            [ 2]    3     ldw x,(1,x)
      00A991 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A995 CF 00 11         [ 2] 3843 	ldw timer,x 
      00A995 CF               [ 4] 3844 	ret 
                                   3845 
                                   3846 ;------------------------------
                                   3847 ; BASIC: TIMEOUT 
                                   3848 ; return state of timer 
                                   3849 ;------------------------------
      002C20                       3850 timeout:
      00A996 00 12 CE         [ 2] 3851 	ldw x,timer 
      002C23                       3852 logical_complement:
      00A999 00 12            [ 1] 3853 	ld a,#255 
      00A99B 5D               [ 2] 3854 	cplw x 
      00A99C 27 03 8F         [ 2] 3855 	cpw x,#-1
      00A99F 26 F7            [ 1] 3856 	jreq 2$
      00A9A1 4F               [ 1] 3857 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A9A2 81               [ 1] 3858 	clr a 
      00A9A3                       3859 2$:	_xpush  
      00A9A3 CD 9A B3 A1      [ 2]    1     subw y,#CELL_SIZE
      00A9A7 84 27            [ 1]    2     ld (y),a 
      00A9A9 03 CC 96         [ 2]    3     ldw (1,y),x 
      00A9AC C5 90            [ 1] 3860 	ld a,#TK_INTGR
      00A9AE F6               [ 4] 3861 	ret 
                                   3862 
                                   3863 ;--------------------------------
                                   3864 ; BASIC NOT(expr) 
                                   3865 ; return logical complement of expr
                                   3866 ;--------------------------------
      002C39                       3867 func_not:
      00A9AF 93 EE 01         [ 4] 3868 	call func_args  
      00A9B2 72 A9            [ 1] 3869 	cp a,#1
      00A9B4 00 03            [ 1] 3870 	jreq 1$
      00A9B6 CC 16 45         [ 2] 3871 	jp syntax_error
      002C43                       3872 1$:  
      00A9B6 A3 14 00         [ 4] 3873 	call cpl24 
      00A9B9 2B 0C            [ 1] 3874 	ld a,#TK_INTGR
      00A9BB 35               [ 4] 3875 	ret 
                                   3876 
                                   3877 
                                   3878 
                                   3879 ;-----------------------------------
                                   3880 ; BASIC: IWDGEN expr1 
                                   3881 ; enable independant watchdog timer
                                   3882 ; expr1 is delay in multiple of 62.5µsec
                                   3883 ; expr1 -> {1..16383}
                                   3884 ;-----------------------------------
      002C49                       3885 enable_iwdg:
      00A9BC 0F 50 F2         [ 4] 3886 	call arg_list
      00A9BF A6 1E            [ 1] 3887 	cp a,#1 
      00A9C1 62 A6            [ 1] 3888 	jreq 1$
      00A9C3 10 62 20         [ 2] 3889 	jp syntax_error 
      002C53                       3890 1$: _xpop  
      00A9C6 1E F6            [ 1]    1     ld a,(y)
      00A9C7 93               [ 1]    2     ldw x,y 
      00A9C7 A3 08            [ 2]    3     ldw x,(1,x)
      00A9C9 00 2B 09 35      [ 2]    4     addw y,#CELL_SIZE 
      00A9CD 0E 50            [ 1] 3891 	push #0
      00A9CF F2 A6 50 62      [ 1] 3892 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A9D3 20               [ 1] 3893 	ld a,xh 
      00A9D4 10 3F            [ 1] 3894 	and a,#0x3f
      00A9D5 95               [ 1] 3895 	ld xh,a  
      00A9D5 35 07 50         [ 2] 3896 2$:	cpw x,#255
      00A9D8 F2 06            [ 2] 3897 	jrule 3$
      00A9D9 0C 01            [ 1] 3898 	inc (1,sp)
      00A9D9 A3               [ 1] 3899 	rcf 
      00A9DA 00               [ 2] 3900 	rrcw x 
      00A9DB 40 23            [ 2] 3901 	jra 2$
      00A9DD 07 72 5C 50      [ 1] 3902 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A9E1 F2               [ 1] 3903 	pop a  
      00A9E2 54 20 F4         [ 1] 3904 	ld IWDG_PR,a 
      00A9E5 9F               [ 1] 3905 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A9E5 9F               [ 1] 3906 	dec a 
      00A9E6 4A 27 01 4A      [ 1] 3907 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A9EA C7 50 E2         [ 1] 3908 	ld IWDG_RLR,a 
      00A9EA A4 3E C7 50      [ 1] 3909 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A9EE F1               [ 4] 3910 	ret 
                                   3911 
                                   3912 
                                   3913 ;-----------------------------------
                                   3914 ; BASIC: IWDGREF  
                                   3915 ; refresh independant watchdog count down 
                                   3916 ; timer before it reset MCU. 
                                   3917 ;-----------------------------------
      002C87                       3918 refresh_iwdg:
      00A9EF 72 18 50 F0      [ 1] 3919 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A9F3 8E               [ 4] 3920 	ret 
                                   3921 
                                   3922 
                                   3923 ;-------------------------------------
                                   3924 ; BASIC: LOG(expr)
                                   3925 ; return logarithm base 2 of expr 
                                   3926 ; this is the position of most significant
                                   3927 ; bit set. 
                                   3928 ; input: 
                                   3929 ; output:
                                   3930 ;   A     TK_INTGR 
                                   3931 ;   xstack log2 
                                   3932 ;*********************************
      002C8C                       3933 log2:
      00A9F4 81 18 F1         [ 4] 3934 	call func_args 
      00A9F5 A1 01            [ 1] 3935 	cp a,#1 
      00A9F5 CE 00            [ 1] 3936 	jreq 1$
      00A9F7 10 4F 72         [ 2] 3937 	jp syntax_error 
      002C96                       3938 1$: _at_top   
      00A9FA A2 00            [ 1]    1     ld a,(y)
      00A9FC 03               [ 1]    2     ldw x,y 
      00A9FD 90 F7            [ 2]    3     ldw x,(1,x)
      002C9B                       3939 leading_one:
      00A9FF 90               [ 1] 3940 	tnz a
      00AA00 EF 01            [ 1] 3941 	jrne 2$ 
      00AA02 A6               [ 2] 3942 	tnzw x 
      00AA03 84 81            [ 1] 3943 	jrne 2$
      00AA05 4C               [ 1] 3944 	inc a  
      00AA05 CD 99            [ 2] 3945 	jra 9$
      00AA07 71 A1            [ 1] 3946 2$:	push #24  
      00AA09 01               [ 2] 3947 3$: rlcw x 
      00AA0A 27               [ 1] 3948     rlc a 
      00AA0B 03 CC            [ 1] 3949 	jrc 4$
      00AA0D 96 C5            [ 1] 3950 	dec (1,sp) 
      00AA0F 26 F8            [ 1] 3951 	jrne 3$
      00AA0F CD               [ 1] 3952 4$: clrw x 
      00AA10 82               [ 1] 3953     pop a 
      00AA11 2E               [ 1] 3954 	ld xl,a 
      00AA12 A6               [ 1] 3955 	clr a 
      002CB2                       3956 9$:	_store_top 
      00AA13 84 81            [ 1]    1     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00AA15 90 EF 01         [ 2]    2     ldw (1,y),x     
      00AA15 CD 99            [ 1] 3957 	ld a,#TK_INTGR
      00AA17 71               [ 4] 3958 	ret 
                                   3959 
                                   3960 ;-----------------------------------
                                   3961 ; BASIC: BIT(expr) 
                                   3962 ; expr ->{0..15}
                                   3963 ; return 2^expr 
                                   3964 ; output:
                                   3965 ;    x    2^expr 
                                   3966 ;-----------------------------------
      002CBA                       3967 bitmask:
      00AA18 A1 02 27         [ 4] 3968     call func_args 
      00AA1B 03 CC            [ 1] 3969 	cp a,#1
      00AA1D 96 C5            [ 1] 3970 	jreq 1$
      00AA1F 90 F6 93         [ 2] 3971 	jp syntax_error 
      00AA22 EE               [ 2] 3972 1$: popw x 
      00AA23 01               [ 1] 3973 	ld a,xl 
      00AA24 72 A9            [ 1] 3974 	and a,#15
      00AA26 00               [ 1] 3975 	clrw x 
      00AA27 03               [ 1] 3976 	incw x 
      00AA28 89               [ 1] 3977 2$: tnz a 
      00AA29 88 90            [ 1] 3978 	jreq 3$
      00AA2B F6               [ 2] 3979 	slaw x 
      00AA2C 93               [ 1] 3980 	dec a 
      00AA2D EE 01            [ 2] 3981 	jra 2$ 
      00AA2F 14 01            [ 1] 3982 3$: ld a,#TK_INTGR
      00AA31 02               [ 4] 3983 	ret 
                                   3984 
                                   3985 ;------------------------------
                                   3986 ; BASIC: INVERT(expr)
                                   3987 ; 1's complement 
                                   3988 ;--------------------------------
      002CD4                       3989 invert:
      00AA32 14 02 02         [ 4] 3990 	call func_args
      00AA35 14 03            [ 1] 3991 	cp a,#1 
      00AA37 02 5B            [ 1] 3992 	jreq 1$
      00AA39 03 90 F7         [ 2] 3993 	jp syntax_error
      00AA3C 90               [ 2] 3994 1$: popw x  
      00AA3D EF               [ 2] 3995 	cplw x 
      00AA3E 01 A6            [ 1] 3996 	ld a,#TK_INTGR 
      00AA40 84               [ 4] 3997 	ret 
                                   3998 
                                   3999 ;------------------------------
                                   4000 ; BASIC: DO 
                                   4001 ; initiate a DO ... UNTIL loop 
                                   4002 ;------------------------------
                           000003  4003 	DOLP_ADR=3 
                           000005  4004 	DOLP_INW=5
                           000004  4005 	VSIZE=4 
      002CE3                       4006 do_loop:
      00AA41 81               [ 2] 4007 	popw x 
      00AA42                       4008 	_vars VSIZE 
      00AA42 CD 99            [ 2]    1     sub sp,#VSIZE 
      00AA44 71               [ 2] 4009 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00AA45 A1 02 27 03      [ 2] 4010 	ldw y,basicptr 
      00AA49 CC 96            [ 2] 4011 	ldw (DOLP_ADR,sp),y
      00AA4B C5 90 F6         [ 2] 4012 	ldw x,in.w 
      00AA4E 93 EE            [ 2] 4013 	ldw (DOLP_INW,sp),x
      00AA50 01 72 A9 00      [ 1] 4014 	inc loop_depth 
      00AA54 03               [ 4] 4015 	ret 
                                   4016 
                                   4017 ;--------------------------------
                                   4018 ; BASIC: UNTIL expr 
                                   4019 ; loop if exprssion is false 
                                   4020 ; else terminate loop
                                   4021 ;--------------------------------
      002CF7                       4022 until: 
      00AA55 89 88 90 F6      [ 1] 4023 	tnz loop_depth 
      00AA59 93 EE            [ 1] 4024 	jrne 1$ 
      00AA5B 01 1A 01         [ 2] 4025 	jp syntax_error 
      002D00                       4026 1$: 
      00AA5E 90 97 9E         [ 4] 4027 	call relation 
      00AA61 1A 02            [ 1] 4028 	cp a,#TK_INTGR
      00AA63 95 9F            [ 1] 4029 	jreq 2$
      00AA65 1A 03 97         [ 2] 4030 	jp syntax_error
      002D0A                       4031 2$: 
      002D0A                       4032 	_xpop
      00AA68 90 9F            [ 1]    1     ld a,(y)
      00AA6A 5B               [ 1]    2     ldw x,y 
      00AA6B 03 90            [ 2]    3     ldw x,(1,x)
      00AA6D F7 90 EF 01      [ 2]    4     addw y,#CELL_SIZE 
      00AA71 A6               [ 1] 4033 	tnz a 
      00AA72 84 81            [ 1] 4034 	jrne 9$ 
      00AA74 5D               [ 2] 4035 	tnzw x   
      00AA74 CD 99            [ 1] 4036 	jrne 9$
      00AA76 71 A1            [ 2] 4037 	ldw x,(DOLP_ADR,sp)
      00AA78 02 27 03         [ 2] 4038 	ldw basicptr,x 
      00AA7B CC 96            [ 1] 4039 	ld a,(2,x)
      00AA7D C5 90 F6         [ 1] 4040 	ld count,a 
      00AA80 93 EE            [ 2] 4041 	ldw x,(DOLP_INW,sp)
      00AA82 01 72 A9         [ 2] 4042 	ldw in.w,x 
      00AA85 00               [ 4] 4043 	ret 
      002D29                       4044 9$:	; remove loop data from stack  
      00AA86 03               [ 2] 4045 	popw x
      002D2A                       4046 	_drop VSIZE
      00AA87 89 88            [ 2]    1     addw sp,#VSIZE 
      00AA89 90 F6 93 EE      [ 1] 4047 	dec loop_depth 
      00AA8D 01               [ 2] 4048 	jp (x)
                                   4049 
                                   4050 ;--------------------------
                                   4051 ; BASIC: PRTA...PRTI  
                                   4052 ;  return constant value 
                                   4053 ;  PORT  offset in GPIO
                                   4054 ;  array
                                   4055 ;---------------------------
      002D31                       4056 const_porta:
      00AA8E 18 01 90         [ 2] 4057 	ldw x,#0
      00AA91 97 9E            [ 1] 4058 	ld a,#TK_INTGR 
      00AA93 18               [ 4] 4059 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      002D37                       4060 const_portb:
      00AA94 02 95 9F         [ 2] 4061 	ldw x,#1
      00AA97 18 03            [ 1] 4062 	ld a,#TK_INTGR 
      00AA99 97               [ 4] 4063 	ret 
      002D3D                       4064 const_portc:
      00AA9A 90 9F 5B         [ 2] 4065 	ldw x,#2
      00AA9D 03 90            [ 1] 4066 	ld a,#TK_INTGR 
      00AA9F F7               [ 4] 4067 	ret 
      002D43                       4068 const_portd:
      00AAA0 90 EF 01         [ 2] 4069 	ldw x,#3
      00AAA3 A6 84            [ 1] 4070 	ld a,#TK_INTGR 
      00AAA5 81               [ 4] 4071 	ret 
      00AAA6                       4072 const_porte:
      00AAA6 CD 99 71         [ 2] 4073 	ldw x,#4
      00AAA9 A1 02            [ 1] 4074 	ld a,#TK_INTGR 
      00AAAB 27               [ 4] 4075 	ret 
      002D4F                       4076 const_portf:
      00AAAC 03 CC 96         [ 2] 4077 	ldw x,#5
      00AAAF C5 90            [ 1] 4078 	ld a,#TK_INTGR 
      00AAB1 F6               [ 4] 4079 	ret 
      002D55                       4080 const_portg:
      00AAB2 93 EE 01         [ 2] 4081 	ldw x,#6
      00AAB5 72 A9            [ 1] 4082 	ld a,#TK_INTGR 
      00AAB7 00               [ 4] 4083 	ret 
      002D5B                       4084 const_porth:
      00AAB8 03 90 93         [ 2] 4085 	ldw x,#7
      00AABB 90 F6            [ 1] 4086 	ld a,#TK_INTGR 
      00AABD 93               [ 4] 4087 	ret 
      002D61                       4088 const_porti:
      00AABE EE 01 90         [ 2] 4089 	ldw x,#8
      00AAC1 5D 27            [ 1] 4090 	ld a,#TK_INTGR 
      00AAC3 07               [ 4] 4091 	ret 
                                   4092 
                                   4093 ;-------------------------------
                                   4094 ; following return constant 
                                   4095 ; related to GPIO register offset 
                                   4096 ;---------------------------------
      002D67                       4097 const_odr:
      00AAC4 98 59            [ 1] 4098 	ld a,#TK_INTGR 
      00AAC6 49 90 5A         [ 2] 4099 	ldw x,#GPIO_ODR
      00AAC9 26               [ 4] 4100 	ret 
      002D6D                       4101 const_idr:
      00AACA F9 90            [ 1] 4102 	ld a,#TK_INTGR 
      00AACC F7 90 EF         [ 2] 4103 	ldw x,#GPIO_IDR
      00AACF 01               [ 4] 4104 	ret 
      002D73                       4105 const_ddr:
      00AAD0 A6 84            [ 1] 4106 	ld a,#TK_INTGR 
      00AAD2 81 00 02         [ 2] 4107 	ldw x,#GPIO_DDR
      00AAD3 81               [ 4] 4108 	ret 
      002D79                       4109 const_cr1:
      00AAD3 CD 99            [ 1] 4110 	ld a,#TK_INTGR 
      00AAD5 71 A1 02         [ 2] 4111 	ldw x,#GPIO_CR1
      00AAD8 27               [ 4] 4112 	ret 
      002D7F                       4113 const_cr2:
      00AAD9 03 CC            [ 1] 4114 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00AADB 96 C5 90         [ 2] 4115 	ldw x,#GPIO_CR2
      00AADE F6               [ 4] 4116 	ret 
                                   4117 ;-------------------------
                                   4118 ; BASIC: POUT 
                                   4119 ;  constant for port mode
                                   4120 ;  used by PMODE 
                                   4121 ;  to set pin as output
                                   4122 ;------------------------
      002D85                       4123 const_output:
      00AADF 93 EE            [ 1] 4124 	ld a,#TK_INTGR 
      00AAE1 01 72 A9         [ 2] 4125 	ldw x,#OUTP
      00AAE4 00               [ 4] 4126 	ret 
                                   4127 
                                   4128 ;-------------------------
                                   4129 ; BASIC: PINP 
                                   4130 ;  constant for port mode
                                   4131 ;  used by PMODE 
                                   4132 ;  to set pin as input
                                   4133 ;------------------------
      002D8B                       4134 const_input:
      00AAE5 03 90            [ 1] 4135 	ld a,#TK_INTGR 
      00AAE7 93 90 F6         [ 2] 4136 	ldw x,#INP 
      00AAEA 93               [ 4] 4137 	ret 
                                   4138 	
                                   4139 ;-----------------------
                                   4140 ; memory area constants
                                   4141 ;-----------------------
      002D91                       4142 const_eeprom_base:
      00AAEB EE 01            [ 1] 4143 	ld a,#TK_INTGR 
      00AAED 90 5D 27         [ 2] 4144 	ldw x,#EEPROM_BASE 
      00AAF0 07               [ 4] 4145 	ret 
                                   4146 
                                   4147 ;---------------------------
                                   4148 ; BASIC: DATA 
                                   4149 ; when the interpreter find 
                                   4150 ; a DATA line it skip it.
                                   4151 ;---------------------------
      002D97                       4152 data:
      00AAF1 98 56 46 90 5A   [ 1] 4153 	mov in,count 
      00AAF6 26               [ 4] 4154 	ret 
                                   4155 
                                   4156 ;------------------------------
                                   4157 ; check if it is a DATA line 
                                   4158 ; input: 
                                   4159 ;    X    line address 
                                   4160 ; output:
                                   4161 ;    Z    set if DATA line 
                                   4162 ;----------------------------
      002D9D                       4163 is_data_line:
      00AAF7 F9 90            [ 2] 4164 	ldw x,(4,x)
      00AAF9 F7 90 EF         [ 2] 4165 	ldw x,(code_addr,x)
      00AAFC 01 A6 84         [ 2] 4166 	cpw x,#data 
      00AAFF 81               [ 4] 4167 	ret 
                                   4168 
                                   4169 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4170 ; set DATA pointer at line# 
                                   4171 ; specified by X 
                                   4172 ;---------------------------
      00AB00                       4173 data_line:
      00AB00 A6               [ 1] 4174     clr a 
      00AB01 84 CD 99         [ 4] 4175 	call search_lineno
      00AB04 64               [ 2] 4176 	tnzw x 
      00AB05 CD 97            [ 1] 4177 	jrne 3$
      00AB07 F4 9F            [ 1] 4178 2$:	ld a,#ERR_NO_LINE 
      00AB09 A4 07 C7         [ 2] 4179 	jp tb_error
      002DB2                       4180 3$: ; check if valid data line 
      00AB0C 50 C6            [ 1] 4181     ldw y,x 
      00AB0E 81 2D 9D         [ 4] 4182 	call is_data_line 
      00AB0F 26 F4            [ 1] 4183 	jrne 2$ 
      002DB9                       4184 set_data_ptr: 	
      00AB0F 52 01 CD 99      [ 2] 4185 	ldw data_ptr,y
      00AB13 76 A1 02         [ 1] 4186 	ld a,(2,y)
      00AB16 27 03 CC         [ 1] 4187 	ld data_len,a 
      00AB19 96 C5 90 F6      [ 1] 4188 	mov data_ofs,#FIRST_DATA_ITEM 
      00AB1D 93               [ 4] 4189 	ret
                                   4190 
                                   4191 ;---------------------------------
                                   4192 ; BASIC: RESTORE [line#]
                                   4193 ; set data_ptr to first data line
                                   4194 ; if no DATA found pointer set to
                                   4195 ; zero.
                                   4196 ; if a line# is given as argument 
                                   4197 ; a data line with that number 
                                   4198 ; is searched and the data pointer 
                                   4199 ; is set to it. If there is no 
                                   4200 ; data line with that number 
                                   4201 ; the program is interrupted. 
                                   4202 ;---------------------------------
      002DC8                       4203 restore:
      00AB1E EE 01 72 A9      [ 1] 4204 	clr data_ptr 
      00AB22 00 03 90 93      [ 1] 4205 	clr data_ptr+1
      00AB26 90 F6 93 EE      [ 1] 4206 	clr data_ofs 
      00AB2A 01 72 A9 00      [ 1] 4207 	clr data_len
      00AB2E 03 CD AB         [ 4] 4208 	call next_token 
      00AB31 6C 6B            [ 1] 4209 	cp a,#TK_INTGR
      00AB33 01 A6            [ 1] 4210 	jreq data_line
      002DDF                       4211 	_unget_token 
      00AB35 01 0D 01 27 0D   [ 1]    1      mov in,in.saved  
      00AB3A 48 0A 01         [ 2] 4212 	ldw x,txtbgn
                                   4213 ; search first DATA line 
      002DE7                       4214 data_search_loop: 	
      00AB3D 26 FB 6B         [ 2] 4215 	cpw x,txtend
      00AB40 01 7B            [ 1] 4216 	jruge restore_error 
      00AB42 01 EA            [ 1] 4217 	ldw y,x 
      00AB44 03 E7 03         [ 4] 4218 	call is_data_line 
      00AB47 90 A3            [ 1] 4219 	jreq set_data_ptr
      002DF3                       4220 try_next_line: 
      00AB49 00               [ 1] 4221 	ldw x,y 
      00AB4A 01 27            [ 1] 4222 	ld a,(2,x)
      00AB4C 10 7B 01         [ 1] 4223 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00AB4F 43 E4 04 E7      [ 1] 4224 	clr acc16 
      00AB53 04 7B 01 43      [ 2] 4225 	addw x,acc16 
      00AB57 E4 02            [ 2] 4226 	jra data_search_loop
      002E03                       4227 restore_error:	
      00AB59 E7 02            [ 1] 4228     ld a,#ERR_NO_DATA 
      00AB5B 20 0C 47         [ 2] 4229 	jp tb_error 
                                   4230 
                                   4231 
                                   4232 ;---------------------------------
                                   4233 ; BASIC: READ 
                                   4234 ; return next data item | 0 
                                   4235 ;---------------------------------
                           000001  4236 	CTX_BPTR=1 
                           000003  4237 	CTX_IN=3 
                           000004  4238 	CTX_COUNT=4 
                           000005  4239 	XSAVE=5
                           000006  4240 	VSIZE=6
      00AB5D                       4241 read:
      002E08                       4242 	_vars  VSIZE 
      00AB5D 7B 01            [ 2]    1     sub sp,#VSIZE 
      002E0A                       4243 read01:	
      00AB5F EA 02 E7         [ 1] 4244 	ld a,data_ofs
      00AB62 02 7B 01         [ 1] 4245 	cp a,data_len 
      00AB65 EA 04            [ 1] 4246 	jreq 2$ ; end of line  
      00AB67 E7 04 88         [ 4] 4247 	call save_context
      00AB69 CE 00 06         [ 2] 4248 	ldw x,data_ptr 
      00AB69 5B 01 81         [ 2] 4249 	ldw basicptr,x 
      00AB6C 55 00 08 00 01   [ 1] 4250 	mov in,data_ofs 
      00AB6C 58 1C AB 7C FE   [ 1] 4251 	mov count,data_len  
      00AB71 9F 88 5E         [ 4] 4252 	call expression 
      00AB74 A6 05            [ 1] 4253 	cp a,#TK_INTGR 
      00AB76 42 1C            [ 1] 4254 	jreq 1$ 
      00AB78 50 00 84         [ 2] 4255 	jp syntax_error 
      002E2F                       4256 1$:
      00AB7B 81 05            [ 2] 4257 	ldw (XSAVE,SP),x
      00AB7C CD 17 3E         [ 4] 4258 	call next_token ; skip comma
      00AB7C 03 06 03         [ 2] 4259 	ldw x,basicptr 
      00AB7F 05 04 00         [ 2] 4260 	ldw data_ptr,x 
      00AB82 02 01 06 00 02   [ 1] 4261 	mov data_ofs,in 
      00AB87 02 02 03         [ 4] 4262 	call rest_context
      00AB8A 03 01            [ 2] 4263 	ldw x,(XSAVE,sp)
      00AB8C 03 03            [ 1] 4264 	ld a,#TK_INTGR
      002E46                       4265 	_drop VSIZE 
      00AB8E 02 04            [ 2]    1     addw sp,#VSIZE 
      00AB90 04               [ 4] 4266 	ret 
      002E49                       4267 2$: ; end of line reached 
      00AB91 05 02 06 02      [ 2] 4268 	ldw y, data_ptr 
      00AB95 07 02 05 04      [ 1] 4269 	clr data_ptr
      00AB99 02 04 01 07      [ 1] 4270 	clr data_ptr+1   
      00AB9C 72 5F 00 08      [ 1] 4271 	clr data_ofs 
      00AB9C CD 99 71 A1      [ 1] 4272 	clr data_len 
      00ABA0 01 27 03         [ 4] 4273 	call try_next_line 
      00ABA3 CC 96            [ 2] 4274 	jra read01
                                   4275 
                                   4276 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4277 ;---------------------------------
                                   4278 ; BASIC: SPIEN clkdiv, 0|1  
                                   4279 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4280 ; if clkdiv==-1 disable SPI
                                   4281 ; 0|1 -> disable|enable  
                                   4282 ;--------------------------------- 
                           000005  4283 SPI_CS_BIT=5
      002E62                       4284 spi_enable:
      00ABA5 C5 18 F6         [ 4] 4285 	call arg_list 
      00ABA6 A1 02            [ 1] 4286 	cp a,#2
      00ABA6 90 F6            [ 1] 4287 	jreq 1$
      00ABA8 93 EE 01         [ 2] 4288 	jp syntax_error 
      002E6C                       4289 1$: 
      00ABAB 72 A9 00 03      [ 1] 4290 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00ABAF 89               [ 2] 4291 	popw x  
      00ABB0 88               [ 2] 4292 	tnzw x 
      00ABB1 A6 80            [ 1] 4293 	jreq spi_disable 
      00ABB3 15               [ 2] 4294 	popw x 
      00ABB4 01 27            [ 1] 4295 	ld a,#(1<<SPI_CR1_BR)
      00ABB6 05               [ 4] 4296 	mul x,a 
      00ABB7 A6               [ 1] 4297 	ld a,xl 
      00ABB8 0A CC 96         [ 1] 4298 	ld SPI_CR1,a 
                                   4299 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00ABBB C7 1A 50 14      [ 1] 4300 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00ABBC 72 1A 50 16      [ 1] 4301 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4302 ; configure SPI as master mode 0.	
      00ABBC CE 00 14 58      [ 1] 4303 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4304 ; ~CS line controlled by sofware 	
      00ABC0 58 58 58 58      [ 1] 4305 	bset SPI_CR2,#SPI_CR2_SSM 
      00ABC4 9E C8 00 14      [ 1] 4306     bset SPI_CR2,#SPI_CR2_SSI 
                                   4307 ; enable SPI
      00ABC8 C7 00 0E 9F      [ 1] 4308 	bset SPI_CR1,#SPI_CR1_SPE 	
      00ABCC C8               [ 4] 4309 	ret 
      002E95                       4310 spi_disable:
      002E95                       4311 	_drop #2; throw first argument.
      00ABCD 00 15            [ 2]    1     addw sp,##2 
                                   4312 ; wait spi idle 
      00ABCF C7 00            [ 1] 4313 1$:	ld a,#0x82 
      00ABD1 0F CE 00         [ 1] 4314 	and a,SPI_SR
      00ABD4 16 CF            [ 1] 4315 	cp a,#2 
      00ABD6 00 14            [ 1] 4316 	jrne 1$
      00ABD8 90 54 90 9E      [ 1] 4317 	bres SPI_CR1,#SPI_CR1_SPE
      00ABDC C8 00 16 C7      [ 1] 4318 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00ABE0 00 16 90 9F      [ 1] 4319 	bres PE_DDR,#SPI_CS_BIT 
      00ABE4 C8               [ 4] 4320 	ret 
                                   4321 
      002EAD                       4322 spi_clear_error:
      00ABE5 00 17            [ 1] 4323 	ld a,#0x78 
      00ABE7 C7 00 17         [ 1] 4324 	bcp a,SPI_SR 
      00ABEA CE 00            [ 1] 4325 	jreq 1$
      00ABEC 0E 54 54 54      [ 1] 4326 	clr SPI_SR 
      00ABF0 9E               [ 4] 4327 1$: ret 
                                   4328 
      002EB9                       4329 spi_send_byte:
      00ABF1 C8               [ 1] 4330 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00ABF2 00 0E 95         [ 4] 4331 	call spi_clear_error
      00ABF5 9F               [ 1] 4332 	pop a 
      00ABF6 C8 00 0F 97 C8   [ 2] 4333 	btjf SPI_SR,#SPI_SR_TXE,.
      00ABFB 00 17 97         [ 1] 4334 	ld SPI_DR,a
      00ABFE 9E C8 00 16 95   [ 2] 4335 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AC03 CF 00 16         [ 1] 4336 	ld a,SPI_DR 
      00AC06 C6               [ 4] 4337 	ret 
                                   4338 
      002ECF                       4339 spi_rcv_byte:
      00AC07 00 15            [ 1] 4340 	ld a,#255
      00AC09 72 A2 00 03 90   [ 2] 4341 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00AC0E F7 90 EF         [ 1] 4342 	ld a,SPI_DR 
      00AC11 01               [ 4] 4343 	ret
                                   4344 
                                   4345 ;------------------------------
                                   4346 ; BASIC: SPIWR byte [,byte]
                                   4347 ; write 1 or more byte
                                   4348 ;------------------------------
      002EDA                       4349 spi_write:
      00AC12 84 85 72         [ 4] 4350 	call expression
      00AC15 A2 00            [ 1] 4351 	cp a,#TK_INTGR 
      00AC17 03 90            [ 1] 4352 	jreq 1$
      00AC19 F7 90 EF         [ 2] 4353 	jp syntax_error 
      002EE4                       4354 1$:	
      00AC1C 01               [ 1] 4355 	ld a,xl 
      00AC1D CD 83 81         [ 4] 4356 	call spi_send_byte 
      00AC20 CD 17 3E         [ 4] 4357 	call next_token 
      00AC20 A6 84            [ 1] 4358 	cp a,#TK_COMMA 
      00AC22 81 02            [ 1] 4359 	jrne 2$ 
      00AC23 20 E9            [ 2] 4360 	jra spi_write 
      00AC23 52               [ 1] 4361 2$:	tnz a 
      00AC24 03 0F            [ 1] 4362 	jreq 3$
      002EF4                       4363 	_unget_token  
      00AC26 02 0F 03 90 AE   [ 1]    1      mov in,in.saved  
      00AC2B B3               [ 4] 4364 3$:	ret 
                                   4365 
                                   4366 
                                   4367 ;-------------------------------
                                   4368 ; BASIC: SPIRD 	
                                   4369 ; read one byte from SPI 
                                   4370 ;-------------------------------
      002EFA                       4371 spi_read:
      00AC2C 39 93 F6         [ 4] 4372 	call spi_rcv_byte 
      00AC2F A4               [ 1] 4373 	clrw x 
      00AC30 0F               [ 1] 4374 	ld xl,a 
      00AC31 6B 01            [ 1] 4375 	ld a,#TK_INTGR 
      00AC33 0C               [ 4] 4376 	ret 
                                   4377 
                                   4378 ;------------------------------
                                   4379 ; BASIC: SPISEL 0|1 
                                   4380 ; set state of ~CS line
                                   4381 ; 0|1 deselect|select  
                                   4382 ;------------------------------
      002F02                       4383 spi_select:
      00AC34 03 5C F6         [ 4] 4384 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00AC37 CD 89            [ 1] 4385 	cp a,#TK_INTGR 
      00AC39 98 0C            [ 1] 4386 	jreq 1$
      00AC3B 02 0A 01         [ 2] 4387 	jp syntax_error 
      00AC3E 26               [ 2] 4388 1$: tnzw x  
      00AC3F F5 A6            [ 1] 4389 	jreq cs_high 
      00AC41 46 11 02 2B      [ 1] 4390 	bres PE_ODR,#SPI_CS_BIT
      00AC45 09               [ 4] 4391 	ret 
      002F14                       4392 cs_high: 
      00AC46 A6 20 CD 89      [ 1] 4393 	bset PE_ODR,#SPI_CS_BIT
      00AC4A 98               [ 4] 4394 	ret 
                                   4395 
                                   4396 ;-------------------------------
                                   4397 ; BASIC: PAD 
                                   4398 ; Return pad buffer address.
                                   4399 ;------------------------------
      002F19                       4400 pad_ref:
      00AC4B 0C 02 20         [ 2] 4401 	ldw x,#pad 
      00AC4E 07 A6            [ 1] 4402 	ld a,TK_INTGR
      00AC50 0D               [ 4] 4403 	ret 
                                   4404 
                                   4405 
                                   4406 ;------------------------------
                                   4407 ;      dictionary 
                                   4408 ; format:
                                   4409 ;   link:   2 bytes 
                                   4410 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4411 ;   cmd_name: 16 byte max 
                                   4412 ;   cmd_index: 2 bytes 
                                   4413 ;------------------------------
                                   4414 	.macro _dict_entry len,name,cmd_idx 
                                   4415 	.word LINK 
                                   4416 	LINK=.
                                   4417 name:
                                   4418 	.byte len 	
                                   4419 	.ascii "name"
                                   4420 	.word cmd_idx 
                                   4421 	.endm 
                                   4422 
                           000000  4423 	LINK=0
                                   4424 ; respect alphabetic order for BASIC names from Z-A
                                   4425 ; this sort order is for a cleaner WORDS cmd output. 	
      002F1F                       4426 kword_end:
      002F1F                       4427 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00AC51 CD 89                    1 	.word LINK 
                           002F21     2 	LINK=.
      002F21                          3 XOR:
      00AC53 98                       4 	.byte 3+F_IFUNC 	
      00AC54 0F 02 72                 5 	.ascii "XOR"
      00AC57 A2 00                    6 	.word XOR_IDX 
      002F27                       4428 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00AC59 02 90                    1 	.word LINK 
                           002F29     2 	LINK=.
      002F29                          3 WRITE:
      00AC5B FE                       4 	.byte 5 	
      00AC5C 26 CF A6 0D CD           5 	.ascii "WRITE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00AC61 89 98                    6 	.word WRITE_IDX 
      002F31                       4429 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00AC63 5F 7B                    1 	.word LINK 
                           002F33     2 	LINK=.
      002F33                          3 WORDS:
      00AC65 03                       4 	.byte 5 	
      00AC66 97 CD 98 0A AE           5 	.ascii "WORDS"
      00AC6B AC 73                    6 	.word WORDS_IDX 
      002F3B                       4430 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00AC6D CD 89                    1 	.word LINK 
                           002F3D     2 	LINK=.
      002F3D                          3 WAIT:
      00AC6F F5                       4 	.byte 4 	
      00AC70 5B 03 81 20              5 	.ascii "WAIT"
      00AC74 77 6F                    6 	.word WAIT_IDX 
      002F44                       4431 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00AC76 72 64                    1 	.word LINK 
                           002F46     2 	LINK=.
      002F46                          3 USR:
      00AC78 73                       4 	.byte 3+F_IFUNC 	
      00AC79 20 69 6E                 5 	.ascii "USR"
      00AC7C 20 64                    6 	.word USR_IDX 
      002F4C                       4432 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00AC7E 69 63                    1 	.word LINK 
                           002F4E     2 	LINK=.
      002F4E                          3 UNTIL:
      00AC80 74                       4 	.byte 5 	
      00AC81 69 6F 6E 61 72           5 	.ascii "UNTIL"
      00AC86 79 0A                    6 	.word UNTIL_IDX 
      002F56                       4433 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00AC88 00 4E                    1 	.word LINK 
                           002F58     2 	LINK=.
      00AC89                          3 UFLASH:
      00AC89 CD                       4 	.byte 6+F_IFUNC 	
      00AC8A 99 76 A1 01 27 03        5 	.ascii "UFLASH"
      00AC90 CC 96                    6 	.word UFLASH_IDX 
      002F61                       4434 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00AC92 C5 58                    1 	.word LINK 
                           002F63     2 	LINK=.
      00AC93                          3 UBOUND:
      00AC93 90                       4 	.byte 6+F_IFUNC 	
      00AC94 F6 93 EE 01 72 A9        5 	.ascii "UBOUND"
      00AC9A 00 03                    6 	.word UBOUND_IDX 
      002F6C                       4435 	_dict_entry,4,TONE,TONE_IDX;tone  
      00AC9C CF 00                    1 	.word LINK 
                           002F6E     2 	LINK=.
      002F6E                          3 TONE:
      00AC9E 12                       4 	.byte 4 	
      00AC9F 81 4F 4E 45              5 	.ascii "TONE"
      00ACA0 00 AE                    6 	.word TONE_IDX 
      002F75                       4436 	_dict_entry,2,TO,TO_IDX;to
      00ACA0 CE 00                    1 	.word LINK 
                           002F77     2 	LINK=.
      002F77                          3 TO:
      00ACA2 12                       4 	.byte 2 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00ACA3 54 4F                    5 	.ascii "TO"
      00ACA3 A6 FF                    6 	.word TO_IDX 
      002F7C                       4437 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00ACA5 53 A3                    1 	.word LINK 
                           002F7E     2 	LINK=.
      002F7E                          3 TIMER:
      00ACA7 FF                       4 	.byte 5 	
      00ACA8 FF 27 02 5F 4F           5 	.ascii "TIMER"
      00ACAD 72 A2                    6 	.word TIMER_IDX 
      002F86                       4438 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00ACAF 00 03                    1 	.word LINK 
                           002F88     2 	LINK=.
      002F88                          3 TIMEOUT:
      00ACB1 90                       4 	.byte 7+F_IFUNC 	
      00ACB2 F7 90 EF 01 A6 84 81     5 	.ascii "TIMEOUT"
      00ACB9 00 AA                    6 	.word TMROUT_IDX 
      002F92                       4439 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00ACB9 CD 99                    1 	.word LINK 
                           002F94     2 	LINK=.
      002F94                          3 TICKS:
      00ACBB 71                       4 	.byte 5+F_IFUNC 	
      00ACBC A1 01 27 03 CC           5 	.ascii "TICKS"
      00ACC1 96 C5                    6 	.word TICKS_IDX 
      00ACC3                       4440 	_dict_entry,4,STOP,STOP_IDX;stop 
      00ACC3 CD 82                    1 	.word LINK 
                           002F9E     2 	LINK=.
      002F9E                          3 STOP:
      00ACC5 35                       4 	.byte 4 	
      00ACC6 A6 84 81 50              5 	.ascii "STOP"
      00ACC9 00 A4                    6 	.word STOP_IDX 
      002FA5                       4441 	_dict_entry,4,STEP,STEP_IDX;step 
      00ACC9 CD 99                    1 	.word LINK 
                           002FA7     2 	LINK=.
      002FA7                          3 STEP:
      00ACCB 76                       4 	.byte 4 	
      00ACCC A1 01 27 03              5 	.ascii "STEP"
      00ACD0 CC 96                    6 	.word STEP_IDX 
      002FAE                       4442 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00ACD2 C5 90                    1 	.word LINK 
                           002FB0     2 	LINK=.
      002FB0                          3 SPIWR:
      00ACD4 F6                       4 	.byte 5 	
      00ACD5 93 EE 01 72 A9           5 	.ascii "SPIWR"
      00ACDA 00 03                    6 	.word SPIWR_IDX 
      002FB8                       4443 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00ACDC 4B 00                    1 	.word LINK 
                           002FBA     2 	LINK=.
      002FBA                          3 SPISEL:
      00ACDE 35                       4 	.byte 6 	
      00ACDF CC 50 E0 9E A4 3F        5 	.ascii "SPISEL"
      00ACE5 95 A3                    6 	.word SPISEL_IDX 
      002FC3                       4444 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00ACE7 00 FF                    1 	.word LINK 
                           002FC5     2 	LINK=.
      002FC5                          3 SPIRD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00ACE9 23                       4 	.byte 5+F_IFUNC 	
      00ACEA 06 0C 01 98 56           5 	.ascii "SPIRD"
      00ACEF 20 F5                    6 	.word SPIRD_IDX 
      002FCD                       4445 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00ACF1 35 55                    1 	.word LINK 
                           002FCF     2 	LINK=.
      002FCF                          3 SPIEN:
      00ACF3 50                       4 	.byte 5 	
      00ACF4 E0 84 C7 50 E1           5 	.ascii "SPIEN"
      00ACF9 9F 4A                    6 	.word SPIEN_IDX 
      002FD7                       4446 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00ACFB 35 55                    1 	.word LINK 
                           002FD9     2 	LINK=.
      002FD9                          3 SLEEP:
      00ACFD 50                       4 	.byte 5 	
      00ACFE E0 C7 50 E2 35           5 	.ascii "SLEEP"
      00AD03 AA 50                    6 	.word SLEEP_IDX 
      002FE1                       4447     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00AD05 E0 81                    1 	.word LINK 
                           002FE3     2 	LINK=.
      00AD07                          3 SIZE:
      00AD07 35                       4 	.byte 4 	
      00AD08 AA 50 E0 81              5 	.ascii "SIZE"
      00AD0C 00 C0                    6 	.word SIZE_IDX 
      002FEA                       4448 	_dict_entry,4,SHOW,SHOW_IDX;show 
      00AD0C CD 99                    1 	.word LINK 
                           002FEC     2 	LINK=.
      002FEC                          3 SHOW:
      00AD0E 71                       4 	.byte 4 	
      00AD0F A1 01 27 03              5 	.ascii "SHOW"
      00AD13 CC 96                    6 	.word SHOW_IDX 
      002FF3                       4449 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00AD15 C5 90                    1 	.word LINK 
                           002FF5     2 	LINK=.
      002FF5                          3 SAVE:
      00AD17 F6                       4 	.byte 4 	
      00AD18 93 EE 01 45              5 	.ascii "SAVE"
      00AD1B 00 34                    6 	.word SAVE_IDX 
      002FFC                       4450 	_dict_entry 3,RUN,RUN_IDX;run
      00AD1B 4D 26                    1 	.word LINK 
                           002FFE     2 	LINK=.
      002FFE                          3 RUN:
      00AD1D 06                       4 	.byte 3 	
      00AD1E 5D 26 03                 5 	.ascii "RUN"
      00AD21 4C 20                    6 	.word RUN_IDX 
      003004                       4451 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00AD23 0E 4B                    1 	.word LINK 
                           003006     2 	LINK=.
      003006                          3 RSHIFT:
      00AD25 18                       4 	.byte 6+F_IFUNC 	
      00AD26 59 49 25 04 0A 01        5 	.ascii "RSHIFT"
      00AD2C 26 F8                    6 	.word RSHIFT_IDX 
      00300F                       4452 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00AD2E 5F 84                    1 	.word LINK 
                           003011     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      003011                          3 RND:
      00AD30 97                       4 	.byte 3+F_IFUNC 	
      00AD31 4F 90 F7                 5 	.ascii "RND"
      00AD34 90 EF                    6 	.word RND_IDX 
      003017                       4453 	_dict_entry,6,RETURN,RET_IDX;return 
      00AD36 01 A6                    1 	.word LINK 
                           003019     2 	LINK=.
      003019                          3 RETURN:
      00AD38 84                       4 	.byte 6 	
      00AD39 81 45 54 55 52 4E        5 	.ascii "RETURN"
      00AD3A 00 8C                    6 	.word RET_IDX 
      003022                       4454 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00AD3A CD 99                    1 	.word LINK 
                           003024     2 	LINK=.
      003024                          3 RESTORE:
      00AD3C 71                       4 	.byte 7 	
      00AD3D A1 01 27 03 CC 96 C5     5 	.ascii "RESTORE"
      00AD44 85 9F                    6 	.word REST_IDX 
      00302E                       4455 	_dict_entry 3,REM,REM_IDX;remark 
      00AD46 A4 0F                    1 	.word LINK 
                           003030     2 	LINK=.
      003030                          3 REM:
      00AD48 5F                       4 	.byte 3 	
      00AD49 5C 4D 27                 5 	.ascii "REM"
      00AD4C 04 58                    6 	.word REM_IDX 
      003036                       4456 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00AD4E 4A 20                    1 	.word LINK 
                           003038     2 	LINK=.
      003038                          3 REBOOT:
      00AD50 F9                       4 	.byte 6 	
      00AD51 A6 84 81 4F 4F 54        5 	.ascii "REBOOT"
      00AD54 00 86                    6 	.word RBT_IDX 
      003041                       4457 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00AD54 CD 99                    1 	.word LINK 
                           003043     2 	LINK=.
      003043                          3 READ:
      00AD56 71                       4 	.byte 4+F_IFUNC 	
      00AD57 A1 01 27 03              5 	.ascii "READ"
      00AD5B CC 96                    6 	.word READ_IDX 
      00304A                       4458 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00AD5D C5 85                    1 	.word LINK 
                           00304C     2 	LINK=.
      00304C                          3 QKEY:
      00AD5F 53                       4 	.byte 4+F_IFUNC 	
      00AD60 A6 84 81 59              5 	.ascii "QKEY"
      00AD63 00 82                    6 	.word QKEY_IDX 
      003053                       4459 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00AD63 85 52                    1 	.word LINK 
                           003055     2 	LINK=.
      003055                          3 PRTI:
      00AD65 04                       4 	.byte 4+F_IFUNC 	
      00AD66 89 90 CE 00              5 	.ascii "PRTI"
      00AD6A 05 17                    6 	.word PRTI_IDX 
      00305C                       4460 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00AD6C 03 CE                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



                           00305E     2 	LINK=.
      00305E                          3 PRTH:
      00AD6E 00                       4 	.byte 4+F_IFUNC 	
      00AD6F 01 1F 05 72              5 	.ascii "PRTH"
      00AD73 5C 00                    6 	.word PRTH_IDX 
      003065                       4461 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00AD75 1F 81                    1 	.word LINK 
                           003067     2 	LINK=.
      00AD77                          3 PRTG:
      00AD77 72                       4 	.byte 4+F_IFUNC 	
      00AD78 5D 00 1F 26              5 	.ascii "PRTG"
      00AD7C 03 CC                    6 	.word PRTG_IDX 
      00306E                       4462 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00AD7E 96 C5                    1 	.word LINK 
                           003070     2 	LINK=.
      00AD80                          3 PRTF:
      00AD80 CD                       4 	.byte 4+F_IFUNC 	
      00AD81 9A F4 A1 84              5 	.ascii "PRTF"
      00AD85 27 03                    6 	.word PRTF_IDX 
      003077                       4463 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00AD87 CC 96                    1 	.word LINK 
                           003079     2 	LINK=.
      003079                          3 PRTE:
      00AD89 C5                       4 	.byte 4+F_IFUNC 	
      00AD8A 50 52 54 45              5 	.ascii "PRTE"
      00AD8A 90 F6                    6 	.word PRTE_IDX 
      003080                       4464 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00AD8C 93 EE                    1 	.word LINK 
                           003082     2 	LINK=.
      003082                          3 PRTD:
      00AD8E 01                       4 	.byte 4+F_IFUNC 	
      00AD8F 72 A9 00 03              5 	.ascii "PRTD"
      00AD93 4D 26                    6 	.word PRTD_IDX 
      003089                       4465 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00AD95 13 5D                    1 	.word LINK 
                           00308B     2 	LINK=.
      00308B                          3 PRTC:
      00AD97 26                       4 	.byte 4+F_IFUNC 	
      00AD98 10 1E 03 CF              5 	.ascii "PRTC"
      00AD9C 00 05                    6 	.word PRTC_IDX 
      003092                       4466 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00AD9E E6 02                    1 	.word LINK 
                           003094     2 	LINK=.
      003094                          3 PRTB:
      00ADA0 C7                       4 	.byte 4+F_IFUNC 	
      00ADA1 00 04 1E 05              5 	.ascii "PRTB"
      00ADA5 CF 00                    6 	.word PRTB_IDX 
      00309B                       4467 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00ADA7 01 81                    1 	.word LINK 
                           00309D     2 	LINK=.
      00ADA9                          3 PRTA:
      00ADA9 85                       4 	.byte 4+F_IFUNC 	
      00ADAA 5B 04 72 5A              5 	.ascii "PRTA"
      00ADAE 00 1F                    6 	.word PRTA_IDX 
      0030A4                       4468 	_dict_entry 5,PRINT,PRT_IDX;print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00ADB0 FC 9D                    1 	.word LINK 
                           0030A6     2 	LINK=.
      00ADB1                          3 PRINT:
      00ADB1 AE                       4 	.byte 5 	
      00ADB2 00 00 A6 84 81           5 	.ascii "PRINT"
      00ADB7 00 6E                    6 	.word PRT_IDX 
      0030AE                       4469 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00ADB7 AE 00                    1 	.word LINK 
                           0030B0     2 	LINK=.
      0030B0                          3 POUT:
      00ADB9 01                       4 	.byte 4+F_IFUNC 	
      00ADBA A6 84 81 54              5 	.ascii "POUT"
      00ADBD 00 6C                    6 	.word POUT_IDX 
      0030B7                       4470 	_dict_entry,4,POKE,POKE_IDX;poke 
      00ADBD AE 00                    1 	.word LINK 
                           0030B9     2 	LINK=.
      0030B9                          3 POKE:
      00ADBF 02                       4 	.byte 4 	
      00ADC0 A6 84 81 45              5 	.ascii "POKE"
      00ADC3 00 6A                    6 	.word POKE_IDX 
      0030C0                       4471 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00ADC3 AE 00                    1 	.word LINK 
                           0030C2     2 	LINK=.
      0030C2                          3 PMODE:
      00ADC5 03                       4 	.byte 5 	
      00ADC6 A6 84 81 44 45           5 	.ascii "PMODE"
      00ADC9 00 64                    6 	.word PMODE_IDX 
      0030CA                       4472 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00ADC9 AE 00                    1 	.word LINK 
                           0030CC     2 	LINK=.
      0030CC                          3 PINP:
      00ADCB 04                       4 	.byte 4+F_IFUNC 	
      00ADCC A6 84 81 50              5 	.ascii "PINP"
      00ADCF 00 68                    6 	.word PINP_IDX 
      0030D3                       4473 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00ADCF AE 00                    1 	.word LINK 
                           0030D5     2 	LINK=.
      0030D5                          3 PEEK:
      00ADD1 05                       4 	.byte 4+F_IFUNC 	
      00ADD2 A6 84 81 4B              5 	.ascii "PEEK"
      00ADD5 00 66                    6 	.word PEEK_IDX 
      0030DC                       4474 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00ADD5 AE 00                    1 	.word LINK 
                           0030DE     2 	LINK=.
      0030DE                          3 PAUSE:
      00ADD7 06                       4 	.byte 5 	
      00ADD8 A6 84 81 53 45           5 	.ascii "PAUSE"
      00ADDB 00 62                    6 	.word PAUSE_IDX 
      0030E6                       4475 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00ADDB AE 00                    1 	.word LINK 
                           0030E8     2 	LINK=.
      0030E8                          3 PAD:
      00ADDD 07                       4 	.byte 3+F_IFUNC 	
      00ADDE A6 84 81                 5 	.ascii "PAD"
      00ADE1 00 60                    6 	.word PAD_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      0030EE                       4476 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00ADE1 AE 00                    1 	.word LINK 
                           0030F0     2 	LINK=.
      0030F0                          3 OR:
      00ADE3 08                       4 	.byte 2+F_IFUNC 	
      00ADE4 A6 84                    5 	.ascii "OR"
      00ADE6 81 5E                    6 	.word OR_IDX 
      00ADE7                       4477 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00ADE7 A6 84                    1 	.word LINK 
                           0030F7     2 	LINK=.
      0030F7                          3 ON:
      00ADE9 AE                       4 	.byte 2 	
      00ADEA 00 00                    5 	.ascii "ON"
      00ADEC 81 C2                    6 	.word ON_IDX 
      00ADED                       4478 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00ADED A6 84                    1 	.word LINK 
                           0030FE     2 	LINK=.
      0030FE                          3 ODR:
      00ADEF AE                       4 	.byte 3+F_IFUNC 	
      00ADF0 00 01 81                 5 	.ascii "ODR"
      00ADF3 00 5C                    6 	.word ODR_IDX 
      003104                       4479 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00ADF3 A6 84                    1 	.word LINK 
                           003106     2 	LINK=.
      003106                          3 NOT:
      00ADF5 AE                       4 	.byte 3+F_IFUNC 	
      00ADF6 00 02 81                 5 	.ascii "NOT"
      00ADF9 00 5A                    6 	.word NOT_IDX 
      00310C                       4480 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00ADF9 A6 84                    1 	.word LINK 
                           00310E     2 	LINK=.
      00310E                          3 NEXT:
      00ADFB AE                       4 	.byte 4 	
      00ADFC 00 03 81 54              5 	.ascii "NEXT"
      00ADFF 00 56                    6 	.word NEXT_IDX 
      003115                       4481 	_dict_entry,3,NEW,NEW_IDX;new
      00ADFF A6 84                    1 	.word LINK 
                           003117     2 	LINK=.
      003117                          3 NEW:
      00AE01 AE                       4 	.byte 3 	
      00AE02 00 04 81                 5 	.ascii "NEW"
      00AE05 00 58                    6 	.word NEW_IDX 
                                   4482 ;	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00311D                       4483 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AE05 A6 84                    1 	.word LINK 
                           00311F     2 	LINK=.
      00311F                          3 LSHIFT:
      00AE07 AE                       4 	.byte 6+F_IFUNC 	
      00AE08 00 01 81 49 46 54        5 	.ascii "LSHIFT"
      00AE0B 00 54                    6 	.word LSHIFT_IDX 
      003128                       4484 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AE0B A6 84                    1 	.word LINK 
                           00312A     2 	LINK=.
      00312A                          3 LOG:
      00AE0D AE                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AE0E 00 00 81                 5 	.ascii "LOG"
      00AE11 00 52                    6 	.word LOG_IDX 
      003130                       4485 	_dict_entry 4,LIST,LIST_IDX;list
      00AE11 A6 84                    1 	.word LINK 
                           003132     2 	LINK=.
      003132                          3 LIST:
      00AE13 AE                       4 	.byte 4 	
      00AE14 40 00 81 54              5 	.ascii "LIST"
      00AE17 00 50                    6 	.word LIST_IDX 
      003139                       4486 	_dict_entry 3,LET,LET_IDX;let 
      00AE17 55 00                    1 	.word LINK 
                           00313B     2 	LINK=.
      00313B                          3 LET:
      00AE19 04                       4 	.byte 3 	
      00AE1A 00 02 81                 5 	.ascii "LET"
      00AE1D 00 4E                    6 	.word LET_IDX 
      003141                       4487 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AE1D EE 04                    1 	.word LINK 
                           003143     2 	LINK=.
      003143                          3 KEY:
      00AE1F DE                       4 	.byte 3+F_CFUNC 	
      00AE20 B3 3F A3                 5 	.ascii "KEY"
      00AE23 AE 17                    6 	.word KEY_IDX 
      003149                       4488 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AE25 81 43                    1 	.word LINK 
                           00314B     2 	LINK=.
      00AE26                          3 IWDGREF:
      00AE26 4F                       4 	.byte 7 	
      00AE27 CD 8C DD 5D 26 05 A6     5 	.ascii "IWDGREF"
      00AE2E 05 CC                    6 	.word IWDGREF_IDX 
      003155                       4489 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AE30 96 C7                    1 	.word LINK 
                           003157     2 	LINK=.
      00AE32                          3 IWDGEN:
      00AE32 90                       4 	.byte 6 	
      00AE33 93 CD AE 1D 26 F4        5 	.ascii "IWDGEN"
      00AE39 00 48                    6 	.word IWDGEN_IDX 
      003160                       4490 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AE39 90 CF                    1 	.word LINK 
                           003162     2 	LINK=.
      003162                          3 INVERT:
      00AE3B 00                       4 	.byte 6+F_IFUNC 	
      00AE3C 07 90 E6 02 C7 00        5 	.ascii "INVERT"
      00AE42 0A 35                    6 	.word INVERT_IDX 
      00316B                       4491 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AE44 06 00                    1 	.word LINK 
                           00316D     2 	LINK=.
      00316D                          3 INPUT:
      00AE46 09                       4 	.byte 5 	
      00AE47 81 4E 50 55 54           5 	.ascii "INPUT"
      00AE48 00 44                    6 	.word INPUT_IDX 
      003175                       4492 	_dict_entry,2,IF,IF_IDX;if 
      00AE48 72 5F                    1 	.word LINK 
                           003177     2 	LINK=.
      003177                          3 IF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AE4A 00                       4 	.byte 2 	
      00AE4B 07 72                    5 	.ascii "IF"
      00AE4D 5F 00                    6 	.word IF_IDX 
      00317C                       4493 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AE4F 08 72                    1 	.word LINK 
                           00317E     2 	LINK=.
      00317E                          3 IDR:
      00AE51 5F                       4 	.byte 3+F_IFUNC 	
      00AE52 00 09 72                 5 	.ascii "IDR"
      00AE55 5F 00                    6 	.word IDR_IDX 
      003184                       4494 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AE57 0A CD                    1 	.word LINK 
                           003186     2 	LINK=.
      003186                          3 HEX:
      00AE59 97                       4 	.byte 3 	
      00AE5A BE A1 84                 5 	.ascii "HEX"
      00AE5D 27 C7                    6 	.word HEX_IDX 
      00318C                       4495 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AE5F 55 00                    1 	.word LINK 
                           00318E     2 	LINK=.
      00318E                          3 GPIO:
      00AE61 03                       4 	.byte 4+F_IFUNC 	
      00AE62 00 02 CE 00              5 	.ascii "GPIO"
      00AE66 1B 3C                    6 	.word GPIO_IDX 
      00AE67                       4496 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AE67 C3 00                    1 	.word LINK 
                           003197     2 	LINK=.
      003197                          3 GOTO:
      00AE69 1D                       4 	.byte 4 	
      00AE6A 24 17 90 93              5 	.ascii "GOTO"
      00AE6E CD AE                    6 	.word GOTO_IDX 
      00319E                       4497 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AE70 1D 27                    1 	.word LINK 
                           0031A0     2 	LINK=.
      0031A0                          3 GOSUB:
      00AE72 C6                       4 	.byte 5 	
      00AE73 47 4F 53 55 42           5 	.ascii "GOSUB"
      00AE73 93 E6                    6 	.word GOSUB_IDX 
      0031A8                       4498 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AE75 02 C7                    1 	.word LINK 
                           0031AA     2 	LINK=.
      0031AA                          3 GET:
      00AE77 00                       4 	.byte 3 	
      00AE78 0F 72 5F                 5 	.ascii "GET"
      00AE7B 00 0E                    6 	.word GET_IDX 
      0031B0                       4499 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AE7D 72 BB                    1 	.word LINK 
                           0031B2     2 	LINK=.
      0031B2                          3 FREE:
      00AE7F 00                       4 	.byte 4+F_IFUNC 	
      00AE80 0E 20 E4 45              5 	.ascii "FREE"
      00AE83 00 96                    6 	.word FREE_IDX 
      0031B9                       4500 	_dict_entry,3,FOR,FOR_IDX;for 
      00AE83 A6 0C                    1 	.word LINK 
                           0031BB     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      0031BB                          3 FOR:
      00AE85 CC                       4 	.byte 3 	
      00AE86 96 C7 52                 5 	.ascii "FOR"
      00AE88 00 36                    6 	.word FOR_IDX 
      0031C1                       4501 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AE88 52 06                    1 	.word LINK 
                           0031C3     2 	LINK=.
      00AE8A                          3 FCPU:
      00AE8A C6                       4 	.byte 4 	
      00AE8B 00 09 C1 00              5 	.ascii "FCPU"
      00AE8F 0A 27                    6 	.word FCPU_IDX 
      0031CA                       4502 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AE91 37 CD                    1 	.word LINK 
                           0031CC     2 	LINK=.
      0031CC                          3 ERASE:
      00AE93 A0                       4 	.byte 5 	
      00AE94 08 CE 00 07 CF           5 	.ascii "ERASE"
      00AE99 00 05                    6 	.word ERASE_IDX 
      0031D4                       4503 	_dict_entry,3,END,END_IDX;cmd_end  
      00AE9B 55 00                    1 	.word LINK 
                           0031D6     2 	LINK=.
      0031D6                          3 END:
      00AE9D 09                       4 	.byte 3 	
      00AE9E 00 02 55                 5 	.ascii "END"
      00AEA1 00 0A                    6 	.word END_IDX 
      0031DC                       4504 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AEA3 00 04                    1 	.word LINK 
                           0031DE     2 	LINK=.
      0031DE                          3 EEPROM:
      00AEA5 CD                       4 	.byte 6+F_IFUNC 	
      00AEA6 9A B3 A1 84 27 03        5 	.ascii "EEPROM"
      00AEAC CC 96                    6 	.word EEPROM_IDX 
      0031E7                       4505 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AEAE C5 DE                    1 	.word LINK 
                           0031E9     2 	LINK=.
      00AEAF                          3 EEFREE:
      00AEAF 1F                       4 	.byte 6+F_IFUNC 	
      00AEB0 05 CD 97 BE CE 00        5 	.ascii "EEFREE"
      00AEB6 05 CF                    6 	.word EEFREE_IDX 
      0031F2                       4506 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AEB8 00 07                    1 	.word LINK 
                           0031F4     2 	LINK=.
      0031F4                          3 EDIT:
      00AEBA 55                       4 	.byte 4 	
      00AEBB 00 02 00 09              5 	.ascii "EDIT"
      00AEBF CD A0                    6 	.word EDIT_IDX 
      0031FB                       4507 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AEC1 18 1E                    1 	.word LINK 
                           0031FD     2 	LINK=.
      0031FD                          3 DWRITE:
      00AEC3 05                       4 	.byte 6+F_CMD 	
      00AEC4 A6 84 5B 06 81 45        5 	.ascii "DWRITE"
      00AEC9 00 28                    6 	.word DWRITE_IDX 
      003206                       4508 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AEC9 90 CE                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



                           003208     2 	LINK=.
      003208                          3 DREAD:
      00AECB 00                       4 	.byte 5+F_IFUNC 	
      00AECC 07 72 5F 00 07           5 	.ascii "DREAD"
      00AED1 72 5F                    6 	.word DREAD_IDX 
      003210                       4509 	_dict_entry,2,DO,DO_IDX;do_loop
      00AED3 00 08                    1 	.word LINK 
                           003212     2 	LINK=.
      003212                          3 DO:
      00AED5 72                       4 	.byte 2 	
      00AED6 5F 00                    5 	.ascii "DO"
      00AED8 09 72                    6 	.word DO_IDX 
      003217                       4510 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AEDA 5F 00                    1 	.word LINK 
                           003219     2 	LINK=.
      003219                          3 DEC:
      00AEDC 0A                       4 	.byte 3 	
      00AEDD CD AE 73                 5 	.ascii "DEC"
      00AEE0 20 A8                    6 	.word DEC_IDX 
      00AEE2                       4511 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AEE2 CD 99                    1 	.word LINK 
                           003221     2 	LINK=.
      003221                          3 DDR:
      00AEE4 76                       4 	.byte 3+F_IFUNC 	
      00AEE5 A1 02 27                 5 	.ascii "DDR"
      00AEE8 03 CC                    6 	.word DDR_IDX 
      003227                       4512 	_dict_entry,4,DATA,DATA_IDX;data  
      00AEEA 96 C5                    1 	.word LINK 
                           003229     2 	LINK=.
      00AEEC                          3 DATA:
      00AEEC 72                       4 	.byte 4 	
      00AEED 12 50 C7 85              5 	.ascii "DATA"
      00AEF1 5D 27                    6 	.word DATA_IDX 
      003230                       4513 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AEF3 21 85                    1 	.word LINK 
                           003232     2 	LINK=.
      003232                          3 CRL:
      00AEF5 A6                       4 	.byte 3+F_IFUNC 	
      00AEF6 08 42 9F                 5 	.ascii "CRL"
      00AEF9 C7 52                    6 	.word CRL_IDX 
      003238                       4514 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AEFB 00 72                    1 	.word LINK 
                           00323A     2 	LINK=.
      00323A                          3 CRH:
      00AEFD 1A                       4 	.byte 3+F_IFUNC 	
      00AEFE 50 14 72                 5 	.ascii "CRH"
      00AF01 1A 50                    6 	.word CRH_IDX 
      003240                       4515 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AF03 16 72                    1 	.word LINK 
                           003242     2 	LINK=.
      003242                          3 CONST:
      00AF05 14                       4 	.byte 5 	
      00AF06 52 00 72 12 52           5 	.ascii "CONST"
      00AF0B 01 72                    6 	.word CONST_IDX 
      00324A                       4516 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AF0D 10 52                    1 	.word LINK 
                           00324C     2 	LINK=.
      00324C                          3 CHAR:
      00AF0F 01                       4 	.byte 4+F_CFUNC 	
      00AF10 72 1C 52 00              5 	.ascii "CHAR"
      00AF14 81 18                    6 	.word CHAR_IDX 
      00AF15                       4517 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AF15 5B 02                    1 	.word LINK 
                           003255     2 	LINK=.
      003255                          3 BYE:
      00AF17 A6                       4 	.byte 3 	
      00AF18 82 C4 52                 5 	.ascii "BYE"
      00AF1B 03 A1                    6 	.word BYE_IDX 
      00325B                       4518 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AF1D 02 26                    1 	.word LINK 
                           00325D     2 	LINK=.
      00325D                          3 BTOGL:
      00AF1F F7                       4 	.byte 5 	
      00AF20 72 1D 52 00 72           5 	.ascii "BTOGL"
      00AF25 13 50                    6 	.word BTOGL_IDX 
      003265                       4519 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AF27 C7 72                    1 	.word LINK 
                           003267     2 	LINK=.
      003267                          3 BTEST:
      00AF29 1B                       4 	.byte 5+F_IFUNC 	
      00AF2A 50 16 81 53 54           5 	.ascii "BTEST"
      00AF2D 00 12                    6 	.word BTEST_IDX 
      00326F                       4520 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AF2D A6 78                    1 	.word LINK 
                           003271     2 	LINK=.
      003271                          3 BSET:
      00AF2F C5                       4 	.byte 4 	
      00AF30 52 03 27 04              5 	.ascii "BSET"
      00AF34 72 5F                    6 	.word BSET_IDX 
      003278                       4521 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AF36 52 03                    1 	.word LINK 
                           00327A     2 	LINK=.
      00327A                          3 BRES:
      00AF38 81                       4 	.byte 4 	
      00AF39 42 52 45 53              5 	.ascii "BRES"
      00AF39 88 CD                    6 	.word BRES_IDX 
      003281                       4522 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AF3B AF 2D                    1 	.word LINK 
                           003283     2 	LINK=.
      003283                          3 BIT:
      00AF3D 84                       4 	.byte 3+F_IFUNC 	
      00AF3E 72 03 52                 5 	.ascii "BIT"
      00AF41 03 FB                    6 	.word BIT_IDX 
      003289                       4523 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AF43 C7 52                    1 	.word LINK 
                           00328B     2 	LINK=.
      00328B                          3 AWU:
      00AF45 04                       4 	.byte 3 	
      00AF46 72 01 52                 5 	.ascii "AWU"
      00AF49 03 FB                    6 	.word AWU_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      003291                       4524 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AF4B C6 52                    1 	.word LINK 
                           003293     2 	LINK=.
      003293                          3 ASC:
      00AF4D 04                       4 	.byte 3+F_IFUNC 	
      00AF4E 81 53 43                 5 	.ascii "ASC"
      00AF4F 00 08                    6 	.word ASC_IDX 
      003299                       4525 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00AF4F A6 FF                    1 	.word LINK 
                           00329B     2 	LINK=.
      00329B                          3 AND:
      00AF51 72                       4 	.byte 3+F_IFUNC 	
      00AF52 01 52 03                 5 	.ascii "AND"
      00AF55 E3 C6                    6 	.word AND_IDX 
      0032A1                       4526 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AF57 52 04                    1 	.word LINK 
                           0032A3     2 	LINK=.
      0032A3                          3 ADCREAD:
      00AF59 81                       4 	.byte 7+F_IFUNC 	
      00AF5A 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00AF5A CD 9A                    6 	.word ADCREAD_IDX 
      0032AD                       4527 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AF5C B3 A1                    1 	.word LINK 
                           0032AF     2 	LINK=.
      0032AF                          3 ADCON:
      00AF5E 84                       4 	.byte 5 	
      00AF5F 27 03 CC 96 C5           5 	.ascii "ADCON"
      00AF64 00 02                    6 	.word ADCON_IDX 
      0032B7                       4528 kword_dict::
      0032B7                       4529 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AF64 9F CD                    1 	.word LINK 
                           0032B9     2 	LINK=.
      0032B9                          3 ABS:
      00AF66 AF                       4 	.byte 3+F_IFUNC 	
      00AF67 39 CD 97                 5 	.ascii "ABS"
      00AF6A BE A1                    6 	.word ABS_IDX 
                                   4530 
                                   4531 ;comands and fonctions address table 	
      0032BF                       4532 code_addr::
      00AF6C 08 26 02 20 E9 4D 27  4533 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             05 55 00 03 00 02 81
      00AF7A 20 96 20 74 20 DB 20  4534 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             B9 28 EE 27 F8 2D 7F
      00AF7A CD AF 4F 5F 97 A6 84  4535 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             81 2C E3 25 51 25 89
      00AF82 1E AB 2D 91 24 31 26  4536 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             2A 2A 80 26 C6 21 67
             23 97 23 7D 28 5F
      00AF82 CD 97 BE A1 84 27 03  4537 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             CC 96 C5 5D 27 05 72
             1B 50
      00AF92 14 81 1E 06 2C 8C 2A  4538 	.word let,list,log2,lshift,next,new ; 40..47
             26 22 01 26 20
      00AF94 2C 39 2D 67 29 C2 2F  4539 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             19 29 02 2A 8F 21 33
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



             2D 8B
      00AF94 72 1A 50 14 81 13 2D  4540 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             31 2D 37 2D 3D 2D 43
             2D 49
      00AF99 2D 4F 2D 55 2D 5B 2D  4541 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             61 28 52 2E 08 00 BD
             20 31
      00AF99 AE 16 B8 B6 84 81 2A  4542 	.word restore,return, random,rshift,run,show,free ; 72..79
             53 23 D5 1A C9 1B 55
      00AF9F 28 F7 2E FA 2E 62 2F  4543 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             02 2E DA 21 D1 25 D4
             29 75
      00AF9F 00 00 2C 20 21 93 24  4544 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             6E 1B 9E 28 9A 2C F7
             28 AF
      00AFA1 20 37 2B A3 27 B5 29  4545 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             F4 1B 71 22 DC 24 38
             1C CE
      00AFA1 43 58 4F 52           4546 	.word func_eefree,0 
                                   4547 
                                   4548 
                                   4549 
                                   4550 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
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
      00338B                         30 test:
      00338B                         31     _vars VSIZE 
      00AFA5 00 BE            [ 2]    1     sub sp,#VSIZE 
      00AFA7 AF A1 10         [ 2]   32     ldw x,#LOOP_CNT
      00AFA9 1F 03            [ 2]   33     ldw (CNTR,sp),x  
      00AFA9 05 57 52         [ 2]   34     ldw x,ticks 
      00AFAC 49 54            [ 2]   35     ldw (T,sp),x
      003397                         36 1$: ; test add24 
      00AFAE 45 00            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AFB0 BC AF A9         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AFB3 C7 00 0C         [ 1]   39     ld acc24,a 
      00AFB3 05 57 4F         [ 2]   40     ldw acc24+1,x  
      00AFB6 52 44            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AFB8 53 00 BA         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AFBB AF B3 63         [ 4]   43     call add24 
      00AFBD 1E 03            [ 2]   44     ldw x,(CNTR,sp)
      00AFBD 04 57 41         [ 2]   45     subw x,#1
      00AFC0 49 54            [ 2]   46     ldw (CNTR,sp),x 
      00AFC2 00 B8            [ 1]   47     jrne 1$
      00AFC4 AF BD 9A         [ 4]   48     call prt_acc24
      00AFC6 A6 20            [ 1]   49     ld a,#SPACE 
      00AFC6 43 55 53         [ 4]   50     call putc 
      00AFC9 52 00 B6         [ 2]   51     ldw x,ticks 
      00AFCC AF C6 01         [ 2]   52     subw x,(T,sp)
      00AFCE CD 17 8A         [ 4]   53     call prt_i16  
      00AFCE 05 55            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00AFD0 4E 54 49         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AFD3 4C 00 B4         [ 2]   58     ldw x,LOOP_CNT
      00AFD6 AF CE            [ 2]   59     ldw (CNTR,sp),x 
      00AFD8 CE 00 0F         [ 2]   60     ldw x,ticks 
      00AFD8 46 55            [ 2]   61     ldw (T,sp),x 
      0033D3                         62 2$: 
      00AFDA 46 4C            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AFDC 41 53 48         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AFDF 00 B2 AF         [ 1]   65     ld acc24,a 
      00AFE2 D8 00 0D         [ 2]   66     ldw acc24+1,x  
      00AFE3 A6 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AFE3 46 55 42         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AFE6 4F 55 4E         [ 4]   69     call mul24 
      00AFE9 44 00            [ 2]   70     ldw x,(CNTR,sp)
      00AFEB B0 AF E3         [ 2]   71     subw x,#1
      00AFEE 1F 03            [ 2]   72     ldw (CNTR,sp),x 
      00AFEE 04 54            [ 1]   73     jrne 2$ 
      00AFF0 4F 4E 45         [ 4]   74    call prt_acc24 
      00AFF3 00 AE            [ 1]   75    ld a,#SPACE 
      00AFF5 AF EE 18         [ 4]   76    call putc 
      00AFF7 CE 00 0F         [ 2]   77     ldw x,ticks 
      00AFF7 02 54 4F         [ 2]   78     subw x,(T,sp)
      00AFFA 00 AC AF         [ 4]   79     call prt_i16 
      00AFFD F7 0D            [ 1]   80     ld a,#CR 
      00AFFE CD 09 18         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AFFE 05 54 49         [ 2]   83     ldw x,LOOP_CNT
      00B001 4D 45            [ 2]   84     ldw (CNTR,sp),x 
      00B003 52 00 A8         [ 2]   85     ldw x,ticks 
      00B006 AF FE            [ 2]   86     ldw (T,sp),x 
      00B008                         87 3$: 
      00B008 47 54            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B00A 49 4D 45         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B00D 4F 55 54         [ 1]   90     ld acc24,a 
      00B010 00 AA B0         [ 2]   91     ldw acc24+1,x  
      00B013 08 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B014 AE 05 FF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B014 45 54 49         [ 4]   94     call mul24 
      00B017 43 4B            [ 2]   95     ldw x,(CNTR,sp)
      00B019 53 00 A6         [ 2]   96     subw x,#1
      00B01C B0 14            [ 2]   97     ldw (CNTR,sp),x 
      00B01E 26 E4            [ 1]   98     jrne 3$ 
      00B01E 04 53 54         [ 4]   99     call prt_acc24    
      00B021 4F 50            [ 1]  100     ld a,#SPACE 
      00B023 00 A4 B0         [ 4]  101     call putc 
      00B026 1E 00 0F         [ 2]  102     ldw x,ticks 
      00B027 72 F0 01         [ 2]  103     subw x,(T,sp)
      00B027 04 53 54         [ 4]  104     call prt_i16 
      00B02A 45 50            [ 1]  105     ld a,#CR 
      00B02C 00 A2 B0         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B02F 27 27 10         [ 2]  108     ldw x,LOOP_CNT
      00B030 1F 03            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00B030 05 53 50         [ 2]  110     ldw x,ticks 
      00B033 49 57            [ 2]  111     ldw (T,sp),x 
      00344B                        112 4$:
      00B035 52 00            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B037 A0 B0 30         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B03A C7 00 0C         [ 1]  115     ld acc24,a 
      00B03A 06 53 50         [ 2]  116     ldw acc24+1,x  
      00B03D 49 53            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B03F 45 4C 00         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B042 9E B0 3A         [ 4]  119     call mul24 
      00B045 1E 03            [ 2]  120     ldw x,(CNTR,sp)
      00B045 45 53 50         [ 2]  121     subw x,#1
      00B048 49 52            [ 2]  122     ldw (CNTR,sp),x 
      00B04A 44 00            [ 1]  123     jrne 4$ 
      00B04C 9A B0 45         [ 4]  124     call prt_acc24 
      00B04F A6 20            [ 1]  125     ld a,#SPACE 
      00B04F 05 53 50         [ 4]  126     call putc 
      00B052 49 45 4E         [ 2]  127     ldw x,ticks 
      00B055 00 9C B0         [ 2]  128     subw x,(T,sp)
      00B058 4F 17 8A         [ 4]  129     call prt_i16 
      00B059 A6 0D            [ 1]  130     ld a,#CR 
      00B059 05 53 4C         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B05C 45 45 50         [ 2]  133     ldw x,LOOP_CNT
      00B05F 00 98            [ 2]  134     ldw (CNTR,sp),x 
      00B061 B0 59 0F         [ 2]  135     ldw x,ticks 
      00B063 1F 01            [ 2]  136     ldw (T,sp),x 
      003487                        137 5$: 
      00B063 04 53            [ 1]  138     ld a,#0xff
      00B065 49 5A 45         [ 2]  139     ldw x,#0xffff
      00B068 00 C0 B0         [ 4]  140     call abs24 
      00B06B 63 00 0C         [ 1]  141     ld acc24,a 
      00B06C CF 00 0D         [ 2]  142     ldw acc24+1,x
      00B06C 04 53            [ 2]  143     ldw x,(CNTR,sp)
      00B06E 48 4F 57         [ 2]  144     subw x,#1
      00B071 00 94            [ 2]  145     ldw (CNTR,sp),x 
      00B073 B0 6C            [ 1]  146     jrne 5$ 
      00B075 CD 17 9A         [ 4]  147     call prt_acc24 
      00B075 04 53            [ 1]  148     ld a,#SPACE 
      00B077 41 56 45         [ 4]  149     call putc 
      00B07A 00 34 B0         [ 2]  150     ldw x,ticks 
      00B07D 75 F0 01         [ 2]  151     subw x,(T,sp)
      00B07E CD 17 8A         [ 4]  152     call prt_i16 
      0034AF                        153 6$:
      00B07E 03 52            [ 1]  154     ld a,#CR 
      00B080 55 4E 00         [ 4]  155     call putc 
      00B083 92 B0 7E         [ 4]  156     call read_integer 
      00B086 55 00 0C 00 17   [ 1]  157     mov farptr,acc24 
      00B086 46 52 53 48 49   [ 1]  158     mov farptr+1,acc16 
      00B08B 46 54 00 90 B0   [ 1]  159     mov farptr+2,acc8 
      00B090 86 34 FA         [ 4]  160     call read_integer 
      00B091 C6 00 0C         [ 1]  161     ld a,acc24 
      00B091 43 52 4E         [ 2]  162     ldw x,acc16 
      00B094 44 00 8E B0 91   [ 1]  163     mov acc24,farptr 
      00B099 55 00 18 00 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00B099 06 52 45 54 55   [ 1]  165     mov acc8,farptr+2 
      00B09E 52 4E 00         [ 4]  166     call div24 
      00B0A1 8C               [ 1]  167     push a 
      00B0A2 B0               [ 2]  168     pushw x 
      00B0A3 99 17 9A         [ 4]  169     call prt_acc24 
      00B0A4 A6 20            [ 1]  170     ld a,#SPACE 
      00B0A4 07 52 45         [ 4]  171     call putc 
      00B0A7 53               [ 2]  172     popw x
      00B0A8 54 4F 52         [ 2]  173     ldw acc16,x  
      00B0AB 45 00 8A         [ 1]  174     pop acc24 
      00B0AE B0 A4 9A         [ 4]  175     call prt_acc24
      00B0B0 20 B8            [ 2]  176     jra 6$
      0034F7                        177     _drop VSIZE 
      00B0B0 03 52            [ 2]    1     addw sp,#VSIZE 
      00B0B2 45               [ 4]  178     ret 
                                    179 
                                    180 
      0034FA                        181 read_integer:
      00B0B3 4D 00            [ 1]  182     ld a,#'? 
      00B0B5 88 B0 B0         [ 4]  183     call putc  
      00B0B8 72 5F 00 03      [ 1]  184 	clr count  
      00B0B8 06 52 45         [ 4]  185 	call readln 
      00B0BB 42 4F 4F         [ 2]  186 	ldw x,#tib 
      00B0BE 54 00 86         [ 1]  187 	push count
      00B0C1 B0 B8            [ 1]  188 	push #0 
      00B0C3 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00B0C3 44               [ 1]  190 	incw x 
      003512                        191 	_drop 2 
      00B0C4 52 45            [ 2]    1     addw sp,#2 
      00B0C6 41 44 00 84      [ 1]  192 	clr in 
      00B0CA B0 C3 E2         [ 4]  193 	call get_token
      00B0CC A1 84            [ 1]  194 	cp a,#TK_INTGR
      00B0CC 44 51            [ 1]  195 	jreq 3$ 
      00B0CE 4B 45            [ 1]  196 	cp a,#TK_MINUS
      00B0D0 59 00 82         [ 4]  197 	call get_token 
      00B0D3 B0 CC            [ 1]  198 	cp a,#TK_INTGR 
      00B0D5 27 03            [ 1]  199 	jreq 2$
      00B0D5 44 50 52         [ 2]  200 	jp syntax_error
      00352B                        201 2$:
      00B0D8 54 49 00         [ 4]  202 	call neg_acc24  	
      00352E                        203 3$: 
      00B0DB 80               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
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
      00B0DC B0 D5                   31 app_sign: .word 0 ; .ascii "BC"  ; signature 
      00B0DE 00 00                   32 app_size: .word 0 ; 31 
      003584                         33 app: 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     35 ;;  BASIC code demo 'BLINK.BAS' 
                                     36 ;; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
                                     37 ;; byte code generated by compiler.
                                     38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     39 ;.byte 0,10,31,128,0,38,128,0,20,132,80,10,9,132,0,32,128
                                     40 ;.byte 0,100,132,0,250,128,0,182,129,0,132,128,0,46
                                     41 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0032B9 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0032AF R
    ADCON_ID=  000002     |   4 ADCREAD    0032A3 R   |     ADCREAD_=  000004 
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
  4 AND        00329B R   |     AND_IDX =  000006     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        003293 R
    ASC_IDX =  000008     |     ATTRIB  =  000002     |   4 AUTO_RUN   000150 R
  4 AWU        00328B R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
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
    BINARY  =  000001     |   4 BIT        003283 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000C     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000C 
  4 BRES       00327A R   |     BRES_IDX=  00000E     |     BS      =  000008 
  4 BSET       003271 R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      003267 R   |     BTEST_ID=  000012     |   4 BTOGL      00325D R
    BTOGL_ID=  000014     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        003255 R   |     BYE_IDX =  000016     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    00275D R   |     CAN_DGR =  005426 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       00324C R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
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
    CNT_LO  =  000004     |     COMMA   =  00002C     |   4 CONST      003242 R
  4 CONST_CO   001C4C R   |     CONST_ID=  0000C6     |     CONST_RE=  000005 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        00323A R
    CRH_IDX =  00001A     |   4 CRL        003232 R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       003229 R
    DATA_IDX=  00001E     |     DBG_A   =  000008     |     DBG_CC  =  000009 
    DBG_X   =  000006     |     DBG_Y   =  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        003221 R   |     DDR_IDX =  000020     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        003219 R
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
    DM_ENFCT=  007F9A     |   4 DO         003212 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000024     |   4 DREAD      003208 R
    DREAD_ID=  000026     |   4 DWRITE     0031FD R   |     DWRITE_I=  000028 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       0031F4 R   |     EDIT_IDX=  00002A     |   4 EEFREE     0031E9 R
    EEFREE_I=  0000C8     |   4 EEPROM     0031DE R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002C     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        0031D6 R
    END_IDX =  00002E     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      0031CC R   |     ERASE_ID=  000030 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       0031C3 R   |     FCPU_IDX=  000032 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001DE6 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        0031BB R
    FOR_IDX =  000036     |   4 FREE       0031B2 R   |     FREE_IDX=  000096 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     FUPDATE =  000007 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   4 GET        0031AA R   |     GET_IDX =  0000C4 
  4 GOSUB      0031A0 R   |     GOSUB_ID=  000038     |   4 GOTO       003197 R
    GOTO_IDX=  00003A     |   4 GPIO       00318E R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003C     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        003186 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
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
  4 IDR        00317E R   |     IDR_IDX =  000040     |   4 IF         003177 R
    IF_IDX  =  000042     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      00316D R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   4 INVERT     003162 R
    INVERT_I=  000046     |     INW     =  00000A     |     IPOS    =  000001 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     003157 R
    IWDGEN_I=  000048     |   4 IWDGREF    00314B R   |     IWDGREF_=  00004A 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        003143 R   |     KEY_END =  000083 
    KEY_IDX =  00004C     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        00313B R   |     LET_IDX =  00004E 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0032B9 R   |   4 LIST       003132 R   |     LIST_IDX=  000050 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG        00312A R   |     LOG_IDX =  000052 
    LOOP_CNT=  002710     |   4 LSHIFT     00311F R   |     LSHIFT_I=  000054 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000004 
    N2      =  000007     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        003117 R   |     NEW_IDX =  000058     |   4 NEXT       00310E R
    NEXT_IDX=  000056     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        003106 R   |     NOT_IDX =  00005A     |   4 NOT_SAVE   001ED8 R
  4 NO_APP     00279F R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        0030FE R
    ODR_IDX =  00005C     |   4 ON         0030F7 R   |     ONOFF   =  000003 
    ON_IDX  =  0000C2     |     OP      =  000001     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         0030F0 R   |     OR_IDX  =  00005E     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        0030E8 R   |     PAD_IDX =  000060     |     PAD_SIZE=  000080 
  4 PAUSE      0030DE R   |     PAUSE_ID=  000062     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       0030D5 R   |     PEEK_IDX=  000066     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   4 PINP       0030CC R   |     PINP_IDX=  000068 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      0030C2 R   |     PMODE_ID=  000064 
  4 POKE       0030B9 R   |     POKE_IDX=  00006A     |   4 POUT       0030B0 R
    POUT_IDX=  00006C     |     PREV    =  000001     |   4 PRINT      0030A6 R
    PROD    =  000001     |     PROD_SIG=  00000A     |   4 PROG_ADD   001DBD R
  4 PROG_SIZ   001DCF R   |   4 PRTA       00309D R   |     PRTA_IDX=  000070 
  4 PRTB       003094 R   |     PRTB_IDX=  000072     |   4 PRTC       00308B R
    PRTC_IDX=  000074     |   4 PRTD       003082 R   |     PRTD_IDX=  000076 
  4 PRTE       003079 R   |     PRTE_IDX=  000078     |   4 PRTF       003070 R
    PRTF_IDX=  00007A     |   4 PRTG       003067 R   |     PRTG_IDX=  00007C 
  4 PRTH       00305E R   |     PRTH_IDX=  00007E     |   4 PRTI       003055 R
    PRTI_IDX=  000080     |     PRT_IDX =  00006E     |     PSIZE   =  000001 
    PSTR    =  000003     |   4 QKEY       00304C R   |     QKEY_IDX=  000082 
    QSIGN   =  000005     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    001DF7 R   |     RAM_SIZE=  001800     |     RBT_IDX =  000086 
  4 READ       003043 R   |     READ_IDX=  000084     |   4 REBOOT     003038 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

    RECLEN  =  000005     |   4 REG_A      00053B R   |   4 REG_CC     00053F R
  4 REG_EPC    00052E R   |   4 REG_SP     000544 R   |   4 REG_X      000537 R
  4 REG_Y      000533 R   |     RELOP   =  000001     |   4 REM        003030 R
    REM_IDX =  000088     |   4 RESTORE    003024 R   |     REST_IDX=  00008A 
    RETL1   =  000001     |   4 RETURN     003019 R   |     RET_ADDR=  000003 
    RET_IDX =  00008C     |     RET_INW =  000005     |   4 RND        003011 R
    RND_IDX =  00008E     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003006 R   |     RSHIFT_I=  000090     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        002FFE R   |     RUN_IDX =  000092 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       002FF5 R   |     SAVE_IDX=  000034     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  4 SHOW       002FEC R   |     SHOW_IDX=  000094     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   00275B R   |   4 SIZE       002FE3 R
    SIZE_IDX=  0000C0     |     SKIP    =  000005     |   4 SLEEP      002FD9 R
    SLEEP_ID=  000098     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      002FCF R   |     SPIEN_ID=  00009C 
  4 SPIRD      002FC5 R   |     SPIRD_ID=  00009A     |   4 SPISEL     002FBA R
    SPISEL_I=  00009E     |   4 SPIWR      002FB0 R   |     SPIWR_ID=  0000A0 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     0004F1 R
  4 STEP       002FA7 R   |     STEP_IDX=  0000A2     |   4 STOP       002F9E R
    STOP_IDX=  0000A4     |     STR     =  000003     |   4 STR_BYTE   001DE0 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      002F94 R   |     TICKS_ID=  0000A6 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    002F88 R   |   4 TIMER      002F7E R
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
    TMROUT_I=  0000AA     |   4 TO         002F77 R   |   4 TONE       002F6E R
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
  4 UBOUND     002F63 R   |     UBOUND_I=  0000B0     |   4 UBTN_Han   000057 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

  4 UFLASH     002F58 R   |     UFLASH_I=  0000B2     |   4 UNTIL      002F4E R
    UNTIL_ID=  0000B4     |     US      =  00001F     |   4 USER_ABO   00006A R
  4 USR        002F46 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000B6     |   4 Uart1RxH   0008A6 R
  4 UserButt   000033 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VAR_ADDR=  000006     |     VSISE   =  000003     |     VSIZE   =  000008 
    VT      =  00000B     |   4 WAIT       002F3D R   |     WAIT_IDX=  0000B8 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   4 WORDS      002F33 R
    WORDS_ID=  0000BA     |   4 WRITE      002F29 R   |     WRITE_ID=  0000BC 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        002F21 R   |     XOR_IDX =  0000BE     |     XSAVE   =  000005 
    XSTACK_E=  001773     |     XSTACK_S=  00003C     |     XTEMP   =  000001 
    YSAVE   =  000004     |     YTEMP   =  000003     |   4 abs        002985 R
  4 abs24      0001AE R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000BE1 R
  4 add24      000163 R   |   4 add_char   001337 R   |   4 add_spac   001132 R
  4 analog_r   002515 R   |   4 app        003584 R   |   4 app_sign   003580 R
  4 app_size   003582 R   |   4 app_spac   003580 GR  |   4 arduino_   002AFC R
  4 arg_list   0018F6 R   |   5 array_si   00001F R   |   4 ascii      00280F R
  4 at_tst     000F9C R   |   4 atoi24     00182D GR  |   4 atoi_exi   001893 R
  4 awu        002923 R   |   4 awu02      002936 R   |   4 bad_port   002895 R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       00248E R
  4 beep_1kh   002465 GR  |   4 bin_exit   000E1D R   |   4 bit_and    002995 R
  4 bit_or     0029C2 R   |   4 bit_rese   002096 R   |   4 bit_set    002074 R
  4 bit_test   0020DB R   |   4 bit_togg   0020B9 R   |   4 bit_xor    0029F4 R
  4 bitmask    002CBA R   |   4 bkslsh_t   000F49 R   |   4 bksp       00097F R
  2 block_bu   0016B8 GR  |   4 block_er   000799 R   |   4 break_po   002602 R
  4 bye        0028EE R   |   4 char       0027F8 R   |   4 clear_ba   0014A1 R
  4 clear_bl   0026B2 R   |   4 clear_va   0013F9 R   |   4 clock_in   000085 R
  4 cmd_cons   001CCE R   |   4 cmd_end    002431 R   |   4 cmd_get    002438 R
  4 cmd_itf    000549 R   |   4 cmd_line   0016CC R   |   4 cmd_name   001357 R
  4 cmd_on     0022DC R   |   4 cmd_size   001B71 R   |   4 code_add   0032BF GR
  4 cold_sta   0000BD R   |   4 colon_ts   000F70 R   |   4 comma_ts   000F7B R
  4 comp_msg   001624 R   |   4 compile    0010A1 GR  |   4 const_cr   002D79 R
  4 const_cr   002D7F R   |   4 const_dd   002D73 R   |   4 const_ee   002D91 R
  4 const_id   002D6D R   |   4 const_in   002D8B R   |   4 const_od   002D67 R
  4 const_ou   002D85 R   |   4 const_po   002D31 R   |   4 const_po   002D37 R
  4 const_po   002D3D R   |   4 const_po   002D43 R   |   4 const_po   002D49 R
  4 const_po   002D4F R   |   4 const_po   002D55 R   |   4 const_po   002D5B R
  4 const_po   002D61 R   |   4 convert_   000D8B R   |   4 convert_   000943 R
  4 copy_com   000FD1 R   |   5 count      000003 GR  |   4 cp24       0001A5 R
  4 cp_loop    0018A5 R   |   4 cpl24      0001B5 R   |   4 cpy_cmd_   00111D R
  4 cpy_quot   001156 R   |   4 create_g   000CB5 R   |   4 cs_high    002F14 R
  4 cstk_pro   001B19 R   |   4 dash_tst   000F91 R   |   4 data       002D97 R
  5 data_len   000009 R   |   4 data_lin   002DA6 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 data_sea   002DE7 R   |   4 dec_base   001B50 R
  4 decomp_l   001208 R   |   4 decompil   0011C0 GR  |   4 del_line   000C88 R
  4 delete_l   000A6C R   |   4 delete_n   00098F R   |   4 delete_u   000A31 R
  4 digital_   002551 R   |   4 digital_   002589 R   |   4 div24      000301 R
  4 divu24_8   0002D9 R   |   4 do_loop    002CE3 R   |   4 do_progr   00078C R
  4 edit       001EAB R   |   4 enable_i   002C49 R   |   4 eql_tst    001026 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

  4 equal      00134A R   |   4 erase      00262A R   |   4 erase_ex   0007B8 R
  4 erase_fl   0007AE R   |   4 err_bad_   001585 R   |   4 err_buf_   0015FB R
  4 err_cmd_   001549 R   |   4 err_div0   00150E R   |   4 err_dupl   001563 R
  4 err_math   0014F5 R   |   4 err_mem_   0014DA R   |   4 err_msg    0014B8 R
  4 err_no_a   001591 R   |   4 err_no_d   0015C4 R   |   4 err_no_f   0015E8 R
  4 err_no_l   00151D R   |   4 err_no_p   0015D4 R   |   4 err_not_   001574 R
  4 err_over   001608 R   |   4 err_run_   001533 R   |   4 err_synt   0014E7 R
  4 escaped    000DA0 GR  |   4 expect     0018E4 R   |   4 expr_exi   001A71 R
  4 expressi   001A33 R   |   4 factor     00194B R   |   5 farptr     000017 R
  4 fcpu       002A80 R   |   4 fetchc     000639 R   |   4 fill_wri   0026A2 R
  4 final_te   000BDA R   |   4 first_li   001E55 R   |   5 flags      000021 GR
  4 for        002167 R   |   4 free       001B55 R   |   5 free_eep   000023 R
  7 free_ram   000080 R   |   4 func_arg   0018F1 R   |   4 func_eef   001C61 R
  4 func_not   002C39 R   |   4 ge         00134C R   |   4 get_addr   001771 R
  4 get_arra   00191B R   |   4 get_char   001784 R   |   4 get_cmd_   00119F R
  4 get_code   001758 R   |   4 get_cons   001BEC R   |   4 get_esca   00094F R
  4 get_int2   001774 R   |   4 get_targ   00226D R   |   4 get_targ   00227B R
  4 get_tick   002975 R   |   4 get_toke   000EE2 GR  |   4 getc       000928 GR
  4 gosub      002397 R   |   4 goto       00237D R   |   4 gpio       00285F R
  4 gt         001348 R   |   4 gt_tst     001031 R   |   4 hex_base   001B4B R
  4 hex_dump   000679 R   |   4 if         00214B R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   00088A R
  4 input_ex   00202C R   |   4 input_lo   001FAC R   |   4 input_va   001FA8 R
  4 insert_c   0009EE R   |   4 insert_l   000CE1 R   |   4 insert_l   000D50 R
  4 interp_l   00170D R   |   4 interpre   0016E8 R   |   4 invalid    00058E R
  4 invalid_   00060F R   |   4 invert     002CD4 R   |   4 is_alnum   000E52 GR
  4 is_alpha   000E38 GR  |   4 is_data_   002D9D R   |   4 is_digit   000E49 GR
  4 is_symbo   000E5B R   |   4 itoa       0017B9 GR  |   4 itoa_loo   0017DB R
  4 jp_to_ta   00238A R   |   4 key        00284E R   |   4 kword_di   0032B7 GR
  4 kword_en   002F1F R   |   4 le         001351 R   |   4 leading_   002C9B R
  4 ledoff     000444 R   |   4 ledon      00043F R   |   4 ledtoggl   000449 R
  4 left_par   000452 R   |   4 let        001BA9 GR  |   4 let_arra   001BB7 R
  4 let_eval   001BBF R   |   4 let_var    001BBC R   |   4 lines_sk   001E58 R
  4 list       001E06 R   |   4 list_con   001BFB R   |   4 list_exi   001E9A R
  4 list_loo   001E78 R   |   4 log2       002C8C R   |   4 logical_   002C23 R
  4 look_tar   00229E R   |   4 loop_bac   002250 R   |   5 loop_dep   00001E R
  4 loop_don   002265 R   |   4 lshift     002A26 R   |   4 lt         00134F R
  4 lt_tst     00105A R   |   4 mem_peek   0005AB R   |   4 mod24      0003AE R
  4 move       0013B5 GR  |   4 move_dow   0013D4 R   |   4 move_era   00071B R
  4 move_exi   0013F5 R   |   4 move_lef   0009C6 R   |   4 move_loo   0013D9 R
  4 move_prg   00075B R   |   4 move_rig   0009D4 R   |   4 move_up    0013C6 R
  4 mul24      000227 R   |   4 mul_char   001339 R   |   4 mulu24_8   0001F4 R
  4 nbr_tst    000F15 R   |   4 ne         001354 R   |   4 neg24      0001C2 R
  4 neg_acc2   0001DC R   |   4 neg_ax     0001D4 R   |   4 new        002620 R
  4 next       002201 R   |   4 next_lin   0016F0 R   |   4 next_tok   00173E GR
  4 no_match   0018B7 R   |   4 number     00063F R   |   4 other      001083 R
  4 overwrit   000C06 R   |   2 pad        0016B8 GR  |   4 pad_ref    002F19 R
  4 parse_bi   000DFB R   |   4 parse_in   000DA8 R   |   4 parse_ke   000E7E R
  4 parse_qu   000D53 R   |   4 parse_sy   000E66 R   |   4 pause      002902 R
  4 pause02    002915 R   |   4 peek       002133 R   |   4 peek_byt   0005D9 R
  4 pin_mode   002A8F R   |   4 plus_tst   000FFA R   |   4 poke       002112 R
  4 power_ad   0024C5 R   |   4 prcnt_ts   00101B R   |   4 print      001F13 R
  4 print_ex   001F7C R   |   4 print_fa   00061E R   |   4 print_he   000C3B GR
  4 print_re   00049E R   |   4 print_st   00059E R   |   4 print_to   0017A8 R
  4 prog_siz   001D76 R   |   4 program_   001D7E R   |   4 program_   000735 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 program_   00075B R   |   4 prt_acc2   00179A R   |   4 prt_basi   001EEF R
  4 prt_i16    00178A R   |   4 prt_loop   001F17 R   |   4 prt_peek   000421 GR
  4 prt_reg1   00047F R   |   4 prt_reg8   00045D R   |   4 prt_regs   0003B7 GR
  5 ptr16      000018 GR  |   5 ptr8       000019 R   |   4 putc       000918 GR
  4 puts       000975 GR  |   4 qgetc      000921 GR  |   4 qkey       002852 GR
  4 qmark_ts   000FA7 R   |   4 qsign      00269B R   |   4 random     002B1C R
  4 read       002E08 R   |   4 read01     002E0A R   |   4 read_int   0034FA R
  4 readln     000A7A GR  |   4 readln_l   000A87 R   |   4 readln_q   000C23 R
  4 refresh_   002C87 R   |   4 regs_sta   0003FA R   |   4 rel_exit   001AC6 R
  4 relation   001A74 R   |   4 relop_st   00133C R   |   4 remark     002031 GR
  4 repl       000557 R   |   4 repl_exi   00057F R   |   4 reset_co   001F15 R
  4 rest_con   001F98 R   |   4 restore    002DC8 R   |   4 restore_   002E03 R
  4 return     0023B7 R   |   4 right_al   001144 GR  |   4 row_alig   00086F R
  4 row_eras   0006EE R   |   4 row_eras   00071B R   |   4 row_loop   00065C R
  4 rparnt_t   000F65 R   |   4 rshift     002A53 R   |   7 rsign      00007C R
  7 rsize      00007E R   |   4 rt_msg     001612 R   |   4 run        0023D5 R
  4 run_app    000132 R   |   4 run_it     002407 R   |   4 run_it_0   002409 R
  5 rx1_head   00002D R   |   5 rx1_queu   000025 R   |   5 rx1_tail   00002E R
  4 save_app   0026C6 R   |   4 save_con   001F88 R   |   4 scan_blo   000898 R
  4 search_c   001C8A R   |   4 search_d   001897 GR  |   4 search_e   0018E1 R
  4 search_l   000C5D GR  |   4 search_l   000C6C R   |   4 search_n   00189B R
  5 seedx      000013 R   |   5 seedy      000015 R   |   4 select_p   002AEC R
  4 send_esc   00099D R   |   4 send_par   0009A8 R   |   4 set_data   002DB9 R
  4 set_time   002C09 R   |   4 sharp_ts   000F86 R   |   4 show       001AC9 R
  4 show_row   00064A R   |   4 single_c   001332 R   |   4 skip       000ECF R
  4 skip_2_b   00175C R   |   4 skip_str   001765 R   |   4 slash_ts   001010 R
  4 sleep      0028F7 R   |   4 software   001408 R   |   4 spaces     0009E2 GR
  4 spi_clea   002EAD R   |   4 spi_disa   002E95 R   |   4 spi_enab   002E62 R
  4 spi_rcv_   002ECF R   |   4 spi_read   002EFA R   |   4 spi_sele   002F02 R
  4 spi_send   002EB9 R   |   4 spi_writ   002EDA R   |   2 stack_fu   001774 GR
  2 stack_un   001800 R   |   4 star_tst   001005 R   |   4 step       0021D1 R
  4 stop       0025D4 R   |   4 store_lo   0021EE R   |   4 str_matc   0018C4 R
  4 str_tst    000F05 R   |   4 strcmp     001394 R   |   4 strcpy     0013A5 GR
  4 strlen     001389 GR  |   4 sub24      000188 R   |   4 symb_loo   000E67 R
  4 syntax_e   001645 GR  |   4 system_i   00144E R   |   5 tab_widt   000022 GR
  4 tb_error   001647 GR  |   4 term       0019E9 R   |   4 term01     0019F1 R
  4 term_exi   001A30 R   |   4 test       00338B R   |   4 test_p     000596 R
  2 tib        001668 GR  |   4 tick_tst   000FBF R   |   5 ticks      00000F R
  4 timeout    002C20 R   |   5 timer      000011 GR  |   4 timer2_i   00009B R
  4 timer4_i   0000A8 R   |   4 tk_id      001635 R   |   4 to         002193 R
  4 to_eepro   000784 R   |   4 to_flash   000789 R   |   4 to_hex_c   000C52 GR
  4 to_upper   001821 GR  |   4 token_ch   00109A R   |   4 token_ex   00109E R
  4 tone       00246E R   |   4 try_next   002DF3 R   |   5 txtbgn     00001A GR
  5 txtend     00001C GR  |   4 uart1_ge   000928 GR  |   4 uart1_in   0008D3 R
  4 uart1_pu   000918 GR  |   4 uart1_qg   000921 GR  |   4 uart1_se   0008E3 R
  4 ubound     001B9E R   |   4 uflash     00289A R   |   4 unlock_e   0006B8 R
  4 unlock_f   0006D3 R   |   4 until      002CF7 R   |   4 user_int   000046 R
  4 usr        0028AF R   |   4 var_name   001197 GR  |   5 vars       00002F GR
  4 wait       002037 R   |   4 warm_ini   00147F R   |   4 warm_sta   0016C9 R
  4 words      002BA3 R   |   4 words_co   002BF3 R   |   4 write      0027B5 R
  4 write_bl   000834 GR  |   4 write_bu   000775 R   |   4 write_by   0007BA R
  4 write_ee   0007F6 R   |   4 write_ex   00082F R   |   4 write_fl   0007E0 R
  4 write_nb   000859 R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
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

