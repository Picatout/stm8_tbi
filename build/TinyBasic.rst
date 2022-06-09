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
      0080DF CC 97 A0         [ 2]  169 5$:	jp warm_start
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
      008190 CD 9D B1         [ 4]  270 	call func_eefree 
      008193 CD 9D 52         [ 4]  271 	call ubound 
      008196 CD 95 2A         [ 4]  272 	call clear_basic
      008199 CD A6 63         [ 4]  273 	call beep_1khz  
      00819C CD 94 D7         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for autorun application
      00819F CE 40 00         [ 2]  277 	ldw x,EEPROM_BASE 
      0081A2 C3 B2 78         [ 2]  278 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 A0         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
      0081AA 4F               [ 1]  282 	clr a 
      0081AB CE 40 02         [ 2]  283 	ldw x,EEPROM_BASE+2
      0081AE CD A5 69         [ 4]  284 	call is_program_addr 
      0081B1 27 03            [ 1]  285 	jreq 1$
      0081B3 CC 97 A0         [ 2]  286 	jp warm_start
      0081B6                        287 1$:	
                                    288 ; run application in FLASH|EEPROM 
      0081B6 90 CE 17 73      [ 2]  289 	ldw y,XSTACK_EMPTY
      0081BA CD 95 08         [ 4]  290 	call warm_init
      0081BD CE 40 02         [ 2]  291 	ldw x,EEPROM_BASE+2 
      0081C0 CF 00 1C         [ 2]  292 	ldw txtbgn,x
      0081C3 1D 00 02         [ 2]  293 	subw x,#2 
      0081C6 FE               [ 2]  294 	ldw x,(x)
      0081C7 72 BB 00 1C      [ 2]  295 	addw x,txtbgn 
      0081CB CF 00 1E         [ 2]  296 	ldw txtend,x 
      0081CE AE 81 DC         [ 2]  297 	ldw x,#AUTO_RUN 
      0081D1 CD 89 DC         [ 4]  298 	call puts 
      0081D4 CD 9E D3         [ 4]  299 	call program_info 
      0081D7 CC A5 D9         [ 2]  300 	jp run_it_02  
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
      0082F0 97 16 03         [ 4]  240     call neg24
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
      008368 16 05            [ 1]  346     jrne 1$ 
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
      0083AC 16 01            [ 1]  385     sbc a,(DIVISOR,sp)
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
      0083E2 CD 18 43         [ 4]   51 	call prt_i16  
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
      008417 CD 18 43         [ 4]  107 	call prt_i16  
      008417 0D 06 27         [ 4]  108 	call left_paren 
      00841A 03               [ 1]  109 	pop a 
      00841B CD               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00841C 82               [ 1]  111 	ld xl,a 
      00841D 95 5B 06 81      [ 1]  112 	mov base,#10 
      008421 CD 18 43         [ 4]  113 	call prt_i16  
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
      008431 C3 A6 3A         [ 4]  132 	call left_paren 
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
      008445 98 C3            [ 1]  155 	ld (R_A,sp),a 
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
      008474 C3 CD            [ 1]  183 	ld a, (R_CC,sp) 
      008476 84 5B 84         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      008479 5F 97 35         [ 2]  186 	ldw x,#REG_SP
      00847C 0A 00            [ 1]  187 	ldw y,sp 
      00847E 0B CD 98 C3      [ 2]  188 	addw y,#(VSIZE+3)
      008482 A6 29 CD         [ 4]  189 	call prt_reg16  
      008485 89 7F            [ 1]  190 	ld a,#'\n' 
      008487 81 08 FF         [ 4]  191 	call putc
      008488 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      008488 90 89            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      00848A CD 89 DC         [ 1]  194 	ld acc24,a 
      00848D 1E 01 35         [ 2]  195 	ldw acc16,x 
      008490 10 00            [ 1]  196 	ld a,(R_A,sp)
      008492 0B CD            [ 2]  197 	ldw x,(R_X,sp)
      008494 98 C3            [ 2]  198 	ldw y,(R_Y,sp)
      00048D                        199 	_drop VSIZE
      008496 CD 84            [ 2]    1     addw sp,#VSIZE 
      008498 5B               [ 1]  200 	pop cc   	
      008499 85               [ 4]  201 	ret
                                    202 
      00849A 35 0A 00 0B CD 98 C3   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
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
      00856A CD 8F 5B         [ 2]  313 1$:	ldw x,acc24 
      00856D 72 B9 00         [ 2]  314 	ldw farptr,x 
      008570 01 AE 16         [ 1]  315 	ld a,acc8 
      008573 B8 CD 94         [ 1]  316 	ld farptr+2,a 
      0005A5                        317 peek_byte:
      008576 2E AE 16         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008579 B8 CD            [ 1]  319 	ld a,#8 
      00857B 99 65            [ 1]  320 	ld (PSIZE,sp),a 
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
      0085C8 CD 99 59         [ 4]  385 	call get_token
      0085CB A1 51            [ 1]  386 	cp a,#TK_INTGR
      0085CD 26 26            [ 1]  387 	jreq 1$
      0085CF CC 16 94         [ 2]  388 	jp syntax_error
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
      008639 90 CD 98 DA      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
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
      008678 10 CD 98 DA      [ 1]   87 	ldf ([farptr],y),a
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
      00868B CD 8F 6E         [ 2]  102 	ldw acc16,x 
      00868E A1 84 27         [ 2]  103 	ldw x,#tib 
      008691 03 CC 97 14      [ 2]  104 	ldw y,#row_erase 
      008695 81 13 BE         [ 4]  105 	call move
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
      0086A2 C3 A6            [ 1]  130 	clrw y 
      0086A4 20               [ 1]  131 1$:	ld a,(x)
      0086A5 CD 89 7F 18      [ 1]  132 	ldf ([farptr],y),a
      0086A8 5C               [ 1]  133 	incw x 
      0086A8 1E 02            [ 1]  134 	incw y 
      0086AA F6 5F            [ 1]  135 	dec (BCNT,sp)
      0086AC 97 CD            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0086AE 98 C3 1E 02 5C   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
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
      00877A CD 94 3E         [ 4]  287 	call incr_farptr
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
      0087BA CD 94 3E         [ 1]  375 	and a,farptr+2 
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
      00891F CD 13 BE         [ 4]  429     call move
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
      008936 CD A9 64         [ 4]  440     call puts 
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
      008952 CD 13 BE         [ 4]  470 	call move 
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
      008A0F CD 11 AE         [ 4]  623 	call decompile 
      008A0F 89 5F            [ 1]  624 	clr (LL_HB,sp)
      008A11 97 A6            [ 1]  625 	ld a,#CR 
      008A13 0A 62 95         [ 4]  626 	call putc 
      008A16 9F 4D            [ 1]  627 	ld a,#'>
      008A18 27 0B A1         [ 4]  628 	call putc
      008A1B 09 23 02         [ 2]  629     ldw x,#tib  
      008A1E A6 09 92         [ 4]  630 	call strlen 
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
      008A6E 94 3E            [ 1]  679 	ld a,(LL,sp)
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
      008AB0 3E 90            [ 1]  713 	ld a,#TIB_SIZE-1
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
      008B4F 12 4D            [ 1]   86 	ld (LLEN+1,sp),a 
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
      008B6C 07 CD 99 65      [ 2]   98 	ldw txtend,y
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
      008B90 CD 92 2E         [ 2]  128 	ldw x,txtend 
      008B93 0F 01 A6         [ 2]  129 	subw x,(SRC,sp)
      008B96 0D CD 89         [ 2]  130 	ldw acc16,x ; size to move
      008B99 7F A6            [ 2]  131 	ldw x,(DEST,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      008B9B 3E CD 89         [ 4]  132 	call move
      008B9E 7F AE 16         [ 2]  133 	ldw x,txtend
      008BA1 68 CD 94         [ 2]  134 	addw x,(LEN,sp)
      008BA4 12 6B 02         [ 2]  135 	ldw txtend,x
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
      008BD7 A3 16 62         [ 2]  179 	cpw x,#tib-6 
      008BD7 A6 01            [ 1]  180 	jrult 3$
      008BD9 CD 8A            [ 1]  181 	ld a,#ERR_MEM_FULL
      008BDB 2D 0A 03         [ 2]  182 	jp tb_error 
      000D15                        183 3$: ; create gap to insert line 
      008BDE 90 5A            [ 2]  184 	ldw x,(DEST,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008BE0 CC 8A            [ 2]  185 	ldw y,(LLEN,sp)
      008BE2 F0 A1 82         [ 4]  186 	call open_gap 
                                    187 ; move new line in gap 
      008BE5 26 0E            [ 2]  188 	ldw x,(LLEN,sp)
      008BE7 7B 03 CD         [ 2]  189 	ldw acc16,x 
      008BEA 8A 2D 0F 03      [ 2]  190 	ldw y,#pad ;SRC 
      008BEE 90 AE            [ 2]  191 	ldw x,(DEST,sp) ; dest address 
      008BF0 16 68 CC         [ 4]  192 	call move
      008BF3 8A F0            [ 2]  193 	ldw x,(DEST,sp)
      008BF5 A1 83 26         [ 2]  194 	cpw x,txtend 
      008BF8 26 7B            [ 1]  195 	jrult 9$ 
      008BFA 03 11            [ 2]  196 	ldw x,(LLEN,sp)
      008BFC 02 26 03 CC      [ 2]  197 	addw x,txtend 
      008C00 8A F0 1D         [ 2]  198 	ldw txtend,x 
      008C02 CF 00 30         [ 2]  199 	ldw dvar_bgn,x 
      008C02 7B 02 10         [ 2]  200 	ldw dvar_end,x 
      000D40                        201 9$:	
      000D40                        202 	_drop VSIZE
      008C05 03 CD            [ 2]    1     addw sp,#VSIZE 
      008C07 8A               [ 4]  203 	ret
                                    204 
                                    205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    206 ;; compiler routines        ;;
                                    207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    208 ;------------------------------------
                                    209 ; parse quoted string 
                                    210 ; input:
                                    211 ;   Y 	pointer to tib 
                                    212 ;   X   pointer to output buffer 
                                    213 ; output:
                                    214 ;	buffer   parsed string
                                    215 ;------------------------------------
                           000001   216 	PREV = 1
                           000002   217 	CURR =2
                           000002   218 	VSIZE=2
      000D43                        219 parse_quote: 
      000D43                        220 	_vars VSIZE 
      008C08 3B 7B            [ 2]    1     sub sp,#VSIZE 
      008C0A 02               [ 1]  221 	clr a
      008C0B 6B 03            [ 1]  222 1$:	ld (PREV,sp),a 
      000D48                        223 2$:	
      008C0D 90 AE 16         [ 4]  224 	ld a,([in.w],y)
      008C10 68 72            [ 1]  225 	jreq 6$
      008C12 5F 00 0E C7      [ 1]  226 	inc in 
      008C16 00 0F            [ 1]  227 	ld (CURR,sp),a 
      008C18 72 B9            [ 1]  228 	ld a,#'\
      008C1A 00 0E            [ 1]  229 	cp a, (PREV,sp)
      008C1C CC 8A            [ 1]  230 	jrne 3$
      008C1E F0 A1            [ 1]  231 	clr (PREV,sp)
      008C20 0F 26            [ 1]  232 	ld a,(CURR,sp)
      008C22 08 03            [ 4]  233 	callr convert_escape
      008C24 04               [ 1]  234 	ld (x),a 
      008C25 CD               [ 1]  235 	incw x 
      008C26 A6 63            [ 2]  236 	jra 2$
      000D63                        237 3$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      008C28 CC 8A            [ 1]  238 	ld a,(CURR,sp)
      008C2A F0 A1            [ 1]  239 	cp a,#'\'
      008C2C 84 26            [ 1]  240 	jreq 1$
      008C2E 11 7B            [ 1]  241 	cp a,#'"
      008C30 03 11            [ 1]  242 	jreq 6$ 
      008C32 02               [ 1]  243 	ld (x),a 
      008C33 2A               [ 1]  244 	incw x 
      008C34 08 D7            [ 2]  245 	jra 2$
      008C35                        246 6$:
      008C35 97               [ 1]  247 	clr (x)
      008C36 7B               [ 1]  248 	incw x 
      008C37 02 CD            [ 1]  249 	ldw y,x 
      008C39 8A               [ 1]  250 	clrw x 
      008C3A 98 0A            [ 1]  251 	ld a,#TK_QSTR  
      000D78                        252 	_drop VSIZE
      008C3C 02 02            [ 2]    1     addw sp,#VSIZE 
      008C3D 81               [ 4]  253 	ret 
                                    254 
                                    255 ;---------------------------------------
                                    256 ; called by parse_quote
                                    257 ; subtitute escaped character 
                                    258 ; by their ASCII value .
                                    259 ; input:
                                    260 ;   A  character following '\'
                                    261 ; output:
                                    262 ;   A  substitued char or same if not valid.
                                    263 ;---------------------------------------
      000D7B                        264 convert_escape:
      008C3D CC               [ 2]  265 	pushw x 
      008C3E 8A F0 90         [ 2]  266 	ldw x,#escaped 
      008C40 F1               [ 1]  267 1$:	cp a,(x)
      008C40 A1 20            [ 1]  268 	jreq 2$
      008C42 2A               [ 1]  269 	tnz (x)
      008C43 03 CC            [ 1]  270 	jreq 3$
      008C45 8A               [ 1]  271 	incw x 
      008C46 F0 F7            [ 2]  272 	jra 1$
      008C47 1D 0D 90         [ 2]  273 2$: subw x,#escaped 
      008C47 A6               [ 1]  274 	ld a,xl 
      008C48 4F 11            [ 1]  275 	add a,#7
      008C4A 02               [ 2]  276 3$:	popw x 
      008C4B 2A               [ 4]  277 	ret 
                                    278 
      008C4C 03 CC 8A F0 0D 04 26   279 escaped:: .asciz "abtnvfr"
             18
                                    280 
                                    281 ;-------------------------
                                    282 ; integer parser 
                                    283 ; input:
                                    284 ;   X 		point to output buffer  
                                    285 ;   Y 		point to tib 
                                    286 ;   A 	    first digit|'$' 
                                    287 ; output:  
                                    288 ;   X 		integer bits 15..0 
                                    289 ;   A 		TK_INTGR
                                    290 ;   acc24   24 bits integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    291 ;-------------------------
                           000001   292 	BASE=1
                           000002   293 	TCHAR=2 
                           000003   294 	XSAVE=3
                           000004   295 	VSIZE=4 
      000D98                        296 parse_integer: ; { -- n }
      008C54 7B               [ 2]  297 	pushw x 	
      008C55 03 11            [ 1]  298 	push #0 ; TCHAR
      008C57 02 27            [ 1]  299 	push #10 ; BASE=10
      008C59 12 7B            [ 1]  300 	cp a,#'$
      008C5B 02 97            [ 1]  301 	jrne 2$ 
      000DA1                        302     _drop #1
      008C5D 7B 03            [ 2]    1     addw sp,##1 
      008C5F 95 7B            [ 1]  303 	push #16  ; BASE=16
      008C61 01               [ 1]  304 2$:	ld (x),a 
      008C62 CD               [ 1]  305 	incw x 
      008C63 8A 55 0C         [ 4]  306 	ld a,([in.w],y)
      008C66 02 0C 03 CC      [ 1]  307 	inc in 
      008C6A 8A F0 D9         [ 4]  308 	call to_upper 
      008C6C 6B 02            [ 1]  309 	ld (TCHAR,sp),a 
      008C6C 7B 01 90         [ 4]  310 	call is_digit 
      008C6F F7 90            [ 1]  311 	jrc 2$
      008C71 5C CD            [ 1]  312 	ld a,#16 
      008C73 89 7F            [ 1]  313 	cp a,(BASE,sp)
      008C75 7B 03            [ 1]  314 	jrne 3$ 
      008C77 11 02            [ 1]  315 	ld a,(TCHAR,sp)
      008C79 2B 09            [ 1]  316 	cp a,#'A 
      008C7B 90 7F            [ 1]  317 	jrmi 3$ 
      008C7D 0C 02            [ 1]  318 	cp a,#'G 
      008C7F 0C 03            [ 1]  319 	jrmi 2$ 
      008C81 CC 8A F0 01      [ 1]  320 3$: dec in 	
      008C84 7F               [ 1]  321     clr (x)
      008C84 0C 03            [ 2]  322 	ldw x,(XSAVE,sp)
      008C86 CC 8A F0 73      [ 2]  323 	ldw y,#XSTACK_EMPTY 
      008C89 CD 18 E5         [ 4]  324 	call atoi24
      008C89 90 AE            [ 2]  325 	ldw y,(XSAVE,sp)
      008C8B 16 68 0F         [ 1]  326 	ld a,acc24 
      008C8E 01 72            [ 1]  327 	ld (y),a 
      008C90 F9 01            [ 1]  328 	incw y  
      008C92 90 7F 7B         [ 2]  329 	ldw x,acc16 
      008C95 02 C7            [ 2]  330 	ldw (y),x 
      008C97 00 03 A6 0D      [ 2]  331 	addw y,#2
      008C9B CD 89            [ 1]  332 	ld a,#TK_INTGR
      000DEA                        333 	_drop VSIZE  
      008C9D 7F 5B            [ 2]    1     addw sp,#VSIZE 
      008C9F 06               [ 4]  334 	ret 	
                                    335 
                                    336 ;-------------------------
                                    337 ; binary integer parser
                                    338 ; build integer in acc24  
                                    339 ; input:
                                    340 ;   X 		point to output buffer  
                                    341 ;   Y 		point to tib 
                                    342 ;   A 	    '&' 
                                    343 ; output:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    344 ;   buffer  TK_INTGR integer  
                                    345 ;   X 		int16 
                                    346 ;   A 		TK_INTGR
                                    347 ;   acc24    int24 
                                    348 ;-------------------------
                           000001   349 	BINARY=1 ; 24 bits integer 
                           000003   350 	VSIZE=3
      000DED                        351 parse_binary: ; { -- n }
      008CA0 90 85            [ 1]  352 	push #0
      008CA2 81 00            [ 1]  353 	push #0
      008CA3 4B 00            [ 1]  354 	push #0
      000DF3                        355 2$:	
      008CA3 88 4E CD         [ 4]  356 	ld a,([in.w],y)
      008CA6 8C BA CD 89      [ 1]  357 	inc in 
      008CAA 7F 7B            [ 1]  358 	cp a,#'0 
      008CAC 01 CD            [ 1]  359 	jreq 3$
      008CAE 8C BA            [ 1]  360 	cp a,#'1 
      008CB0 CD 89            [ 1]  361 	jreq 3$ 
      008CB2 7F A6            [ 2]  362 	jra bin_exit 
      008CB4 20 CD            [ 1]  363 3$: sub a,#'0 
      008CB6 89               [ 1]  364 	rrc a
      008CB7 7F 84            [ 1]  365 	rlc (BINARY+2,sp) 
      008CB9 81 02            [ 1]  366 	rlc (BINARY+1,sp)
      008CBA 09 01            [ 1]  367 	rlc (BINARY,sp) 
      008CBA A4 0F            [ 2]  368 	jra 2$  
      000E0F                        369 bin_exit:
      008CBC A1 09 23 02      [ 1]  370 	dec in 
      008CC0 AB 07            [ 1]  371 	ldw y,x
      008CC2 AB 30            [ 1]  372 	ld a,(BINARY,sp)
      008CC4 81 F7            [ 1]  373 	ld (y),a 
      008CC5 90 5C            [ 1]  374 	incw y 
      008CC5 52 02            [ 2]  375 	ldw x,(BINARY+1,sp)
      008CC7 0F 01            [ 2]  376 	ldw (y),x 
      008CC9 90 CE 00 1C      [ 2]  377 	addw y,#2  
      008CCD 4D 27            [ 1]  378 	ld a,#TK_INTGR 	
      000E25                        379 	_drop VSIZE 
      008CCF 04 90            [ 2]    1     addw sp,#VSIZE 
      008CD1 CE               [ 4]  380 	ret
                                    381 
                                    382 ;-------------------------------------
                                    383 ; check if A is a letter 
                                    384 ; input:
                                    385 ;   A 			character to test 
                                    386 ; output:
                                    387 ;   C flag      1 true, 0 false 
                                    388 ;-------------------------------------
      000E28                        389 is_alpha::
      008CD2 00 05            [ 1]  390 	cp a,#'A 
      008CD4 8C               [ 1]  391 	ccf 
      008CD4 90 C3            [ 1]  392 	jrnc 9$ 
      008CD6 00 1E            [ 1]  393 	cp a,#'Z+1 
      008CD8 2A 10            [ 1]  394 	jrc 9$ 
      008CDA 90 F3            [ 1]  395 	cp a,#'a 
      008CDC 27               [ 1]  396 	ccf 
      008CDD 0E 2B            [ 1]  397 	jrnc 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008CDF 0A 90            [ 1]  398 	cp a,#'z+1
      008CE1 E6               [ 4]  399 9$: ret 	
                                    400 
                                    401 ;------------------------------------
                                    402 ; check if character in {'0'..'9'}
                                    403 ; input:
                                    404 ;    A  character to test
                                    405 ; output:
                                    406 ;    Carry  0 not digit | 1 digit
                                    407 ;------------------------------------
      000E39                        408 is_digit::
      008CE2 02 6B            [ 1]  409 	cp a,#'0
      008CE4 02 72            [ 1]  410 	jrc 1$
      008CE6 F9 01            [ 1]  411     cp a,#'9+1
      008CE8 20               [ 1]  412 	ccf 
      008CE9 EA               [ 1]  413 1$:	ccf 
      008CEA 81               [ 4]  414     ret
                                    415 
                                    416 ;-------------------------------------
                                    417 ; return true if character in  A 
                                    418 ; is letter or digit.
                                    419 ; input:
                                    420 ;   A     ASCII character 
                                    421 ; output:
                                    422 ;   A     no change 
                                    423 ;   Carry    0 false| 1 true 
                                    424 ;--------------------------------------
      000E42                        425 is_alnum::
      008CEA 5F 51 5B         [ 4]  426 	call is_digit
      008CED 02 51            [ 1]  427 	jrc 1$ 
      008CEF 81 0E 28         [ 4]  428 	call is_alpha
      008CF0 81               [ 4]  429 1$:	ret 
                                    430 
                                    431 ;-----------------------------
                                    432 ; check if character in A 
                                    433 ; is a valid symbol character 
                                    434 ; valid: Upper case LETTER,DIGIT,'_' 
                                    435 ; input:
                                    436 ;    A   character to validate
                                    437 ; output:
                                    438 ;    Carry   set if valid 
                                    439 ;----------------------------
      000E4B                        440 is_symbol_char: 
      008CF0 52 04            [ 1]  441 	cp a,#'_ 
      008CF2 E6 02            [ 1]  442 	jrne 1$
      008CF4 6B               [ 1]  443 	scf 
      008CF5 02 0F            [ 2]  444 	jra 9$ 
      008CF7 01 90 93         [ 4]  445 1$:	call is_alnum 
      008CFA 72               [ 4]  446 9$: ret 
                                    447 
                                    448 ;---------------------------
                                    449 ;  when lexical unit begin 
                                    450 ;  with a letter a symbol 
                                    451 ;  is expected.
                                    452 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    453 ;   A   first character of symbol 
                                    454 ;	X   point to output buffer 
                                    455 ;   Y   point to input text 
                                    456 ; output:
                                    457 ;	X   after symbol 
                                    458 ;   Y   point after lexical unit 
                                    459 ;---------------------------
      000E56                        460 parse_symbol:
      008CFB F9               [ 1]  461 	incw x ; keep space for TK_ID 
      000E57                        462 symb_loop: 
                                    463 ; symbol are converted to upper case 
      008CFC 01 17 03         [ 4]  464 	call to_upper  
      008CFF 90               [ 1]  465 	ld (x), a 
      008D00 CE               [ 1]  466 	incw x
      008D01 00 1E 72         [ 4]  467 	ld a,([in.w],y)
      008D04 F2 03 90 CF      [ 1]  468 	inc in 
      008D08 00 0E 16         [ 4]  469 	call is_symbol_char 
      008D0B 03 CD            [ 1]  470 	jrc symb_loop 
      008D0D 94               [ 1]  471 	clr (x)
      008D0E 3E 90 CE 00      [ 1]  472 	dec in  
      008D12 1E               [ 4]  473 	ret 
                                    474 
                                    475 ;---------------------------
                                    476 ;  token begin with a letter,
                                    477 ;  is keyword or variable. 	
                                    478 ; input:
                                    479 ;   X 		point to pad 
                                    480 ;   Y 		point to text
                                    481 ;   A 	    first letter  
                                    482 ; output:
                                    483 ;   X		exec_addr|var_addr 
                                    484 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC|TK_AND|TK_OR|TK_XOR   
                                    485 ;   pad 	keyword|var_name  
                                    486 ;--------------------------  
                           000001   487 	XFIRST=1
                           000002   488 	VSIZE=2
      000E6E                        489 parse_keyword: 
      008D13 72               [ 2]  490 	pushw x ; preserve *symbol 
      008D14 F2 01 90         [ 4]  491 	call parse_symbol
      008D17 CF 00            [ 2]  492 	ldw x,(XFIRST,sp) 
      008D19 1E 90            [ 1]  493 	ld a,(2,x)
      008D1B CF 00            [ 1]  494 	jrne 2$
                                    495 ; one letter variable name 
      008D1D 31 90            [ 1]  496 	ld a,(1,x) 
      008D1F CF 00            [ 1]  497 	sub a,#'A 
      008D21 33 5B 04         [ 2]  498 	ldw x,#3 
      008D24 81               [ 4]  499 	mul x,a 
      008D25 1C 00 35         [ 2]  500 	addw x,#vars 
      008D25 C3 00            [ 1]  501 	ld a,#TK_VAR 
      008D27 1E 24            [ 2]  502 	jra 4$ 
      000E87                        503 2$: ; check for keyword, otherwise syntax error.
      000E87                        504 	_ldx_dict kword_dict ; dictionary entry point
      008D29 31 52 06         [ 2]    1     ldw x,#kword_dict+2
      008D2C 1F 03            [ 2]  505 	ldw y,(XFIRST,sp) ; name to search for
      008D2E 17 05            [ 1]  506 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008D30 90 CF 00         [ 4]  507 	call search_dict
      008D33 0E               [ 1]  508 	tnz a
      008D34 90 93            [ 1]  509 	jrne 4$
                                    510 ; not in dictionary
                                    511 ; compile it as TK_LABEL
      008D36 72 BB            [ 2]  512 	ldw y,(XFIRST,sp)
      008D38 00 0E            [ 1]  513 	ld a,#TK_LABEL 
      008D3A 1F 01            [ 1]  514 	ld (y),a 
      008D3C CE 00            [ 1]  515 	incw y
      008D3E 1E               [ 1]  516 	ldw x,y 
      008D3F 72 F0 03         [ 4]  517 	call strlen
      008D42 CF 00            [ 1]  518 	cp a,#NAME_MAX_LEN 
      008D44 0E 1E            [ 2]  519 	jrule 22$ 
      008D46 01 CD            [ 1]  520 	ld a,#NAME_MAX_LEN 
      000EA6                        521 22$:	
      008D48 94               [ 1]  522 	push a 
      000EA7                        523 24$:
      008D49 3E CE            [ 1]  524     ld a,(y)
      008D4B 00 1E            [ 1]  525 	jreq 3$
      008D4D 72 FB            [ 1]  526 	incw y
      008D4F 05 CF            [ 1]  527 	dec (1,sp) 
      008D51 00 1E            [ 1]  528 	jrne 24$
      008D53 CF               [ 1]  529 	clr a 
      008D54 00 31            [ 1]  530 	ld (y),a 
      008D56 CF 00            [ 1]  531 3$: incw y 
      000EB6                        532 	_drop 1 
      008D58 33 5B            [ 2]    1     addw sp,#1 
      008D5A 06 81            [ 1]  533 	ld a,#TK_LABEL 
      008D5C 5F               [ 1]  534 	clrw x 
      008D5C 52 08            [ 2]  535 	jra 5$ 
      000EBD                        536 4$:	
      008D5E 72 CE            [ 2]  537 	ldw y,(XFIRST,sp)
      008D60 00 1A            [ 1]  538 	cp a,#TK_NOT 
      008D62 1F 05            [ 1]  539 	jrmi 41$
      008D64 0F 07            [ 1]  540 	ld (y),a 
      008D66 CE 00            [ 1]  541 	incw y 
      008D68 1A E6            [ 2]  542 	jra 5$ 
      000EC9                        543 41$:	
      008D6A 02 6B 08         [ 2]  544 	cpw x,#let  
      008D6D 4F 1E            [ 1]  545 	jreq 5$  ; don't compile LET command 
      008D6F 05 CD            [ 1]  546 	ld (y),a 
      008D71 8C C5            [ 1]  547 	incw y 
      008D73 5D 27            [ 2]  548 	ldw (y),x
      008D75 07 1F 01 CD      [ 2]  549 	addw y,#2  
      000ED8                        550 5$:	_drop VSIZE 
      008D79 8C F0            [ 2]    1     addw sp,#VSIZE 
      008D7B 20               [ 4]  551 	ret  	
                                    552 
                                    553 ;------------------------------------
                                    554 ; skip character c in text starting from 'in'
                                    555 ; input:
                                    556 ;	 y 		point to text buffer
                                    557 ;    a 		character to skip
                                    558 ; output:  
                                    559 ;	'in' ajusted to new position
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    560 ;------------------------------------
                           000001   561 	C = 1 ; local var
      000EDB                        562 skip:
      008D7C 02               [ 1]  563 	push a
      008D7D 17 01 A6         [ 4]  564 1$:	ld a,([in.w],y)
      008D80 03 11            [ 1]  565 	jreq 2$
      008D82 08 27            [ 1]  566 	cp a,(C,sp)
      008D84 3B CE            [ 1]  567 	jrne 2$
      008D86 00 1E 72 FB      [ 1]  568 	inc in
      008D8A 07 A3            [ 2]  569 	jra 1$
      000EEB                        570 2$: _drop 1 
      008D8C 16 62            [ 2]    1     addw sp,#1 
      008D8E 25               [ 4]  571 	ret
                                    572 	
                                    573 
                                    574 ;------------------------------------
                                    575 ; scan text for next token
                                    576 ; input: 
                                    577 ;	X 		pointer to buffer where 
                                    578 ;	        token id and value are copied 
                                    579 ; use:
                                    580 ;	Y   pointer to text in tib 
                                    581 ; output:
                                    582 ;   A       token attribute 
                                    583 ;   X 		token value
                                    584 ;   Y       updated position in output buffer   
                                    585 ;------------------------------------
                                    586 	; use to check special character 
                                    587 	.macro _case c t  
                                    588 	ld a,#c 
                                    589 	cp a,(TCHAR,sp) 
                                    590 	jrne t
                                    591 	.endm 
                                    592 
                           000001   593 	TCHAR=1
                           000002   594 	ATTRIB=2
                           000002   595 	VSIZE=2
      000EEE                        596 get_token:: 
      000EEE                        597 	_vars VSIZE
      008D8F 05 A6            [ 2]    1     sub sp,#VSIZE 
                                    598 ;	ld a,in 
                                    599 ;	sub a,count
                                    600 ;   jrmi 0$
                                    601 ;	clr a 
                                    602 ;	ret 
      000EF0                        603 0$: 
      008D91 01 CC 97 16      [ 2]  604 	ldw y,#tib    	
      008D95 A6 20            [ 1]  605 	ld a,#SPACE
      008D95 1E 01 16         [ 4]  606 	call skip
      008D98 07 CD 8D 25 1E   [ 1]  607 	mov in.saved,in 
      008D9D 07 CF 00         [ 4]  608 	ld a,([in.w],y)
      008DA0 0E 90            [ 1]  609 	jrne 1$
      008DA2 AE 16            [ 1]  610 	ldw y,x 
      008DA4 B8 1E 01         [ 2]  611 	jp token_exit ; end of line 
      008DA7 CD 94 3E 1E      [ 1]  612 1$:	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008DAB 01 C3 00         [ 4]  613 	call to_upper 
      008DAE 1E 25            [ 1]  614 	ld (TCHAR,sp),a 
                                    615 ; check for quoted string
      000F11                        616 str_tst:  	
      000F11                        617 	_case '"' nbr_tst
      008DB0 0F 1E            [ 1]    1 	ld a,#'"' 
      008DB2 07 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB4 BB 00            [ 1]    3 	jrne nbr_tst
      008DB6 1E CF            [ 1]  618 	ld a,#TK_QSTR
      008DB8 00               [ 1]  619 	ld (x),a 
      008DB9 1E               [ 1]  620 	incw x 
      008DBA CF 00 31         [ 4]  621 	call parse_quote
      008DBD CF 00 33         [ 2]  622 	jp token_exit
      008DC0                        623 nbr_tst:
                                    624 ; check for hexadecimal number 
      008DC0 5B 08            [ 1]  625 	ld a,#'$'
      008DC2 81 01            [ 1]  626 	cp a,(TCHAR,sp) 
      008DC3 27 17            [ 1]  627 	jreq 1$
                                    628 ;check for binary number 
      008DC3 52 02            [ 1]  629 	ld a,#'&
      008DC5 4F 6B            [ 1]  630 	cp a,(TCHAR,sp)
      008DC7 01 0A            [ 1]  631 	jrne 0$
      008DC8 A6 84            [ 1]  632 	ld a,#TK_INTGR
      008DC8 91               [ 1]  633 	ld (x),a 
      008DC9 D6               [ 1]  634 	incw x 
      008DCA 01 27 24         [ 4]  635 	call parse_binary ; expect binary integer 
      008DCD 72 5C 00         [ 2]  636 	jp token_exit 
                                    637 ; check for decimal number 	
      008DD0 02 6B            [ 1]  638 0$:	ld a,(TCHAR,sp)
      008DD2 02 A6 5C         [ 4]  639 	call is_digit
      008DD5 11 01            [ 1]  640 	jrnc 3$
      008DD7 26 0A            [ 1]  641 1$:	ld a,#TK_INTGR 
      008DD9 0F               [ 1]  642 	ld (x),a 
      008DDA 01               [ 1]  643 	incw x 
      008DDB 7B 02            [ 1]  644 	ld a,(TCHAR,sp)
      008DDD AD 1C F7         [ 4]  645 	call parse_integer 
      008DE0 5C 20 E5         [ 2]  646 	jp token_exit 
      008DE3                        647 3$: 
      000F4A                        648 	_case '(' bkslsh_tst 
      008DE3 7B 02            [ 1]    1 	ld a,#'(' 
      008DE5 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE7 27 DD            [ 1]    3 	jrne bkslsh_tst
      008DE9 A1 22            [ 1]  649 	ld a,#TK_LPAREN
      008DEB 27 04 F7         [ 2]  650 	jp token_char   	
      000F55                        651 bkslsh_tst: ; character token 
      000F55                        652 	_case '\',rparnt_tst
      008DEE 5C 20            [ 1]    1 	ld a,#'\' 
      008DF0 D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF1 26 16            [ 1]    3 	jrne rparnt_tst
      008DF1 7F 5C            [ 1]  653 	ld a,#TK_CHAR 
      008DF3 90               [ 1]  654 	ld (x),a 
      008DF4 93               [ 1]  655 	incw x 
      008DF5 5F A6 02         [ 4]  656 	ld a,([in.w],y)
      008DF8 5B               [ 1]  657 	ld (x),a 
      008DF9 02               [ 1]  658 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008DFA 81 93            [ 1]  659 	ldw y,x 	 
      008DFB 72 5C 00 01      [ 1]  660 	inc in  
      008DFB 89               [ 1]  661 	clrw x 
      008DFC AE               [ 1]  662 	ld xl,a 
      008DFD 8E 10            [ 1]  663 	ld a,#TK_CHAR 
      008DFF F1 27 06         [ 2]  664 	jp token_exit 
      000F71                        665 rparnt_tst:		
      000F71                        666 	_case ')' colon_tst 
      008E02 7D 27            [ 1]    1 	ld a,#')' 
      008E04 09 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E06 20 F7            [ 1]    3 	jrne colon_tst
      008E08 1D 8E            [ 1]  667 	ld a,#TK_RPAREN 
      008E0A 10 9F AB         [ 2]  668 	jp token_char
      000F7C                        669 colon_tst:
      000F7C                        670 	_case ':' comma_tst 
      008E0D 07 85            [ 1]    1 	ld a,#':' 
      008E0F 81 61            [ 1]    2 	cp a,(TCHAR,sp) 
      008E11 62 74            [ 1]    3 	jrne comma_tst
      008E13 6E 76            [ 1]  671 	ld a,#TK_COLON 
      008E15 66 72 00         [ 2]  672 	jp token_char  
      008E18                        673 comma_tst:
      000F87                        674 	_case COMMA sharp_tst 
      008E18 89 4B            [ 1]    1 	ld a,#COMMA 
      008E1A 00 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1C 0A A1            [ 1]    3 	jrne sharp_tst
      008E1E 24 26            [ 1]  675 	ld a,#TK_COMMA
      008E20 04 5B 01         [ 2]  676 	jp token_char
      000F92                        677 sharp_tst:
      000F92                        678 	_case SHARP dash_tst 
      008E23 4B 10            [ 1]    1 	ld a,#SHARP 
      008E25 F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E27 91 D6            [ 1]    3 	jrne dash_tst
      008E29 01 72            [ 1]  679 	ld a,#TK_SHARP
      008E2B 5C 00 02         [ 2]  680 	jp token_char  	 	 
      000F9D                        681 dash_tst: 	
      000F9D                        682 	_case '-' at_tst 
      008E2E CD 99            [ 1]    1 	ld a,#'-' 
      008E30 59 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E32 02 CD            [ 1]    3 	jrne at_tst
      008E34 8E B9            [ 1]  683 	ld a,#TK_MINUS  
      008E36 25 ED A6         [ 2]  684 	jp token_char 
      000FA8                        685 at_tst:
      000FA8                        686 	_case '@' qmark_tst 
      008E39 10 11            [ 1]    1 	ld a,#'@' 
      008E3B 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3D 0A 7B            [ 1]    3 	jrne qmark_tst
      008E3F 02 A1            [ 1]  687 	ld a,#TK_ARRAY 
      008E41 41 2B 04         [ 2]  688 	jp token_char
      000FB3                        689 qmark_tst:
      000FB3                        690 	_case '?' tick_tst 
      008E44 A1 47            [ 1]    1 	ld a,#'?' 
      008E46 2B DD            [ 1]    2 	cp a,(TCHAR,sp) 
      008E48 72 5A            [ 1]    3 	jrne tick_tst
      008E4A 00 02            [ 1]  691 	ld a,#TK_CMD  
      008E4C 7F               [ 1]  692 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008E4D 1E               [ 1]  693 	incw x 
      008E4E 03 90            [ 1]  694 	ldw y,x 
      008E50 AE 17 73         [ 2]  695 	ldw x,#print
      008E53 CD 99            [ 2]  696 	ldw (y),x 
      008E55 65 16 03 C6      [ 2]  697 	addw y,#2
      008E59 00 0D 90         [ 2]  698 	jp token_exit
      000FCB                        699 tick_tst: ; comment 
      000FCB                        700 	_case TICK plus_tst 
      008E5C F7 90            [ 1]    1 	ld a,#TICK 
      008E5E 5C CE            [ 1]    2 	cp a,(TCHAR,sp) 
      008E60 00 0E            [ 1]    3 	jrne plus_tst
      008E62 90 FF            [ 1]  701 	ld a,#TK_CMD
      008E64 72               [ 1]  702 	ld (x),a 
      008E65 A9               [ 1]  703 	incw x
      008E66 00 02 A6 84      [ 2]  704 	ldw y,#remark 
      008E6A 5B               [ 2]  705 	ldw (x),y 
      008E6B 04 81 02         [ 2]  706 	addw x,#2  
      008E6D                        707 copy_comment:
      008E6D 4B 00 4B 00      [ 2]  708 	ldw y,#tib 
      008E71 4B 00 00 00      [ 2]  709 	addw y,in.w
      008E73 90 89            [ 2]  710 	pushw y 
      008E73 91 D6 01         [ 4]  711 	call strcpy
      008E76 72 5C 00         [ 2]  712 	subw y,(1,sp)
      008E79 02 A1            [ 1]  713 	incw y ; strlen+1 
      008E7B 30 27            [ 2]  714 	ldw (1,sp),y 
      008E7D 06 A1 31         [ 2]  715 	addw x,(1,sp) 
      000FF4                        716 	_drop 2 
      008E80 27 02            [ 2]    1     addw sp,#2 
      008E82 20               [ 1]  717 	clr a 
      008E83 0B A0            [ 1]  718 	ldw y,x 
      008E85 30 46 09         [ 2]  719 	jp token_exit 
      000FFC                        720 plus_tst:
      000FFC                        721 	_case '+' star_tst 
      008E88 03 09            [ 1]    1 	ld a,#'+' 
      008E8A 02 09            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8C 01 20            [ 1]    3 	jrne star_tst
      008E8E E4 10            [ 1]  722 	ld a,#TK_PLUS  
      008E8F CC 10 9B         [ 2]  723 	jp token_char 
      001007                        724 star_tst:
      001007                        725 	_case '*' slash_tst 
      008E8F 72 5A            [ 1]    1 	ld a,#'*' 
      008E91 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E93 90 93            [ 1]    3 	jrne slash_tst
      008E95 7B 01            [ 1]  726 	ld a,#TK_MULT 
      008E97 90 F7 90         [ 2]  727 	jp token_char 
      001012                        728 slash_tst: 
      001012                        729 	_case '/' prcnt_tst 
      008E9A 5C 1E            [ 1]    1 	ld a,#'/' 
      008E9C 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E9E FF 72            [ 1]    3 	jrne prcnt_tst
      008EA0 A9 00            [ 1]  730 	ld a,#TK_DIV 
      008EA2 02 A6 84         [ 2]  731 	jp token_char 
      00101D                        732 prcnt_tst:
      00101D                        733 	_case '%' eql_tst 
      008EA5 5B 03            [ 1]    1 	ld a,#'%' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008EA7 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA8 26 05            [ 1]    3 	jrne eql_tst
      008EA8 A1 41            [ 1]  734 	ld a,#TK_MOD
      008EAA 8C 24 0B         [ 2]  735 	jp token_char  
                                    736 ; 1 or 2 character tokens 	
      001028                        737 eql_tst:
      001028                        738 	_case '=' gt_tst 		
      008EAD A1 5B            [ 1]    1 	ld a,#'=' 
      008EAF 25 07            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB1 A1 61            [ 1]    3 	jrne gt_tst
      008EB3 8C 24            [ 1]  739 	ld a,#TK_EQUAL
      008EB5 02 A1 7B         [ 2]  740 	jp token_char 
      001033                        741 gt_tst:
      001033                        742 	_case '>' lt_tst 
      008EB8 81 3E            [ 1]    1 	ld a,#'>' 
      008EB9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB9 A1 30            [ 1]    3 	jrne lt_tst
      008EBB 25 03            [ 1]  743 	ld a,#TK_GT 
      008EBD A1 3A            [ 1]  744 	ld (ATTRIB,sp),a 
      008EBF 8C 8C 81         [ 4]  745 	ld a,([in.w],y)
      008EC2 72 5C 00 01      [ 1]  746 	inc in 
      008EC2 CD 8E            [ 1]  747 	cp a,#'=
      008EC4 B9 25            [ 1]  748 	jrne 1$
      008EC6 03 CD            [ 1]  749 	ld a,#TK_GE 
      008EC8 8E A8            [ 2]  750 	jra token_char  
      008ECA 81 3C            [ 1]  751 1$: cp a,#'<
      008ECB 26 04            [ 1]  752 	jrne 2$
      008ECB A1 5F            [ 1]  753 	ld a,#TK_NE 
      008ECD 26 03            [ 2]  754 	jra token_char 
      008ECF 99 20 03 CD      [ 1]  755 2$: dec in
      008ED3 8E C2            [ 1]  756 	ld a,(ATTRIB,sp)
      008ED5 81 3F            [ 2]  757 	jra token_char 	 
      008ED6                        758 lt_tst:
      00105C                        759 	_case '<' other
      008ED6 5C 3C            [ 1]    1 	ld a,#'<' 
      008ED7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED7 CD 99            [ 1]    3 	jrne other
      008ED9 59 F7            [ 1]  760 	ld a,#TK_LT 
      008EDB 5C 91            [ 1]  761 	ld (ATTRIB,sp),a 
      008EDD D6 01 72         [ 4]  762 	ld a,([in.w],y)
      008EE0 5C 00 02 CD      [ 1]  763 	inc in 
      008EE4 8E CB            [ 1]  764 	cp a,#'=
      008EE6 25 EF            [ 1]  765 	jrne 1$
      008EE8 7F 72            [ 1]  766 	ld a,#TK_LE 
      008EEA 5A 00            [ 2]  767 	jra token_char 
      008EEC 02 81            [ 1]  768 1$: cp a,#'>
      008EEE 26 04            [ 1]  769 	jrne 2$
      008EEE 89 CD            [ 1]  770 	ld a,#TK_NE 
      008EF0 8E D6            [ 2]  771 	jra token_char 
      008EF2 1E 01 E6 02      [ 1]  772 2$: dec in 
      008EF6 26 0F            [ 1]  773 	ld a,(ATTRIB,sp)
      008EF8 E6 01            [ 2]  774 	jra token_char 	
      001085                        775 other: ; not a special character 	 
      008EFA A0 41            [ 1]  776 	ld a,(TCHAR,sp)
      008EFC AE 00 03         [ 4]  777 	call is_alpha 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008EFF 42 1C            [ 1]  778 	jrc 30$ 
      008F01 00 36 A6         [ 2]  779 	jp syntax_error 
      00108F                        780 30$: 
      008F04 85 20 36         [ 4]  781 	call parse_keyword
      008F07 A3 21 1D         [ 2]  782 	cpw x,#remark 
      008F07 AE B7            [ 1]  783 	jrne token_exit 
      008F09 14               [ 1]  784 	ldw x,y 
      008F0A 16 01 90         [ 2]  785 	jp copy_comment 
      00109B                        786 token_char:
      008F0D 5C               [ 1]  787 	ld (x),a 
      008F0E CD               [ 1]  788 	incw x
      008F0F 99 E6            [ 1]  789 	ldw y,x 
      00109F                        790 token_exit:
      00109F                        791 	_drop VSIZE 
      008F11 4D 26            [ 2]    1     addw sp,#VSIZE 
      008F13 29               [ 4]  792 	ret
                                    793 
                                    794 
                                    795 ;-----------------------------------
                                    796 ; create token list fromm text line 
                                    797 ; save this list in pad buffer 
                                    798 ;  compiled line format: 
                                    799 ;    line_no  2 bytes {0...32767}
                                    800 ;    count    1 byte  
                                    801 ;    tokens   variable length 
                                    802 ;   
                                    803 ; input:
                                    804 ;   none
                                    805 ; modified variables:
                                    806 ;   basicptr     token list buffer address 
                                    807 ;   in.w  		 3|count, i.e. index in buffer
                                    808 ;   count        length of line | 0  
                                    809 ;-----------------------------------
                           000001   810 	XSAVE=1
                           000002   811 	VSIZE=2
      0010A2                        812 compile::
      008F14 16 01            [ 2]  813 	pushw y 
      0010A4                        814 	_vars VSIZE 
      008F16 A6 03            [ 2]    1     sub sp,#VSIZE 
      008F18 90 F7 90 5C 93   [ 1]  815 	mov basicptr,txtbgn
      008F1D CD 94 12 A1      [ 1]  816 	bset flags,#FCOMP 
      008F21 0F 23            [ 1]  817 	ld a,#0
      008F23 02 A6 0F         [ 2]  818 	ldw x,#0
      008F26 CF 16 B8         [ 2]  819 	ldw pad,x ; destination buffer 
      008F26 88 16 BA         [ 1]  820 	ld pad+2,a ; count 
      008F27 AE 16 BB         [ 2]  821 	ldw x,#pad+3
      008F27 90 F6 27 09      [ 1]  822 	clr in 
      008F2B 90 5C 0A         [ 4]  823 	call get_token
      008F2E 01 26            [ 1]  824 	cp a,#TK_INTGR
      008F30 F6 4F            [ 1]  825 	jrne 2$
      008F32 90 F7 90         [ 2]  826 	cpw x,#1 
      008F35 5C 5B            [ 1]  827 	jrpl 1$
      008F37 01 A6            [ 1]  828 	ld a,#ERR_BAD_VALUE
      008F39 03 5F 20         [ 2]  829 	jp tb_error
      008F3C 1B 16 B8         [ 2]  830 1$:	ldw pad,x ; line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008F3D 90 AE 16 BB      [ 2]  831 	ldw y,#pad+3 
      008F3D 16 01 A1 87      [ 2]  832 2$:	cpw y,#xstack_full 
      008F41 2B 06            [ 1]  833 	jrult 3$
      008F43 90 F7            [ 1]  834 	ld a,#ERR_BUF_FULL 
      008F45 90 5C 20         [ 2]  835 	jp tb_error 
      0010E4                        836 3$:	
      008F48 0F               [ 1]  837 	ldw x,y 
      008F49 CD 0E EE         [ 4]  838 	call get_token 
      008F49 A3 9D            [ 1]  839 	cp a,#TK_NONE 
      008F4B 5D 27            [ 1]  840 	jrne 2$ 
                                    841 ; compilation completed  
      008F4D 0A 90 F7 90      [ 2]  842 	subw y,#pad ; compiled line length 
      008F51 5C 90            [ 1]  843     ld a,yl
      008F53 FF 72 A9         [ 2]  844 	ldw x,#pad 
      008F56 00 02 5B         [ 2]  845 	ldw ptr16,x 
      008F59 02 81            [ 1]  846 	ld (2,x),a 
      008F5B FE               [ 2]  847 	ldw x,(x)  ; line# 
      008F5B 88 91            [ 1]  848 	jreq 10$
      008F5D D6 01 27         [ 4]  849 	call insert_line
      008F60 0A 11 01 26      [ 1]  850 	clr  count 
      008F64 06 72            [ 2]  851 	jra  11$ 
      001106                        852 10$: ; line# is zero 
      008F66 5C 00 02         [ 2]  853 	ldw x,ptr16  
      008F69 20 F1 5B         [ 2]  854 	ldw basicptr,x 
      008F6C 01 81            [ 1]  855 	ld a,(2,x)
      008F6E C7 00 02         [ 1]  856 	ld count,a 
      008F6E 52 02 00 01      [ 1]  857 	mov in,#3 
      008F70                        858 11$:
      001115                        859 	_drop VSIZE 
      008F70 90 AE            [ 2]    1     addw sp,#VSIZE 
      008F72 16 68 A6 20      [ 1]  860 	bres flags,#FCOMP 
      008F76 CD 8F            [ 2]  861 	popw y 
      008F78 5B               [ 4]  862 	ret 
                                    863 
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
      00111E                         48 cpy_cmd_name:
      008F79 55               [ 2]   49 	tnzw x 
      008F7A 00 02            [ 1]   50 	jreq 10$
      008F7C 00               [ 1]   51 	ld a,(x)
      008F7D 04               [ 1]   52 	incw x
      008F7E 91 D6            [ 1]   53 	and a,#15  
      008F80 01               [ 1]   54 	push a 
      008F81 26 05            [ 1]   55     tnz (1,sp) 
      008F83 90 93            [ 1]   56 	jreq 9$
      008F85 CC               [ 1]   57 1$:	ld a,(x)
      008F86 91 1F            [ 1]   58 	ld (y),a  
      008F88 72               [ 1]   59 	incw x
      008F89 5C 00            [ 1]   60 	incw y 
      008F8B 02 CD            [ 1]   61 	dec (1,sp)	 
      008F8D 99 59            [ 1]   62 	jrne 1$
      008F8F 6B               [ 1]   63 9$: pop a 
      001135                         64 10$: 
      008F90 01               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      008F91                         75 add_space:
      008F91 A6 22            [ 2]   76 	decw y 
      008F93 11 01            [ 1]   77 	ld a,(y)
      008F95 26 0A            [ 1]   78 	incw y
      008F97 A6 02            [ 1]   79 	cp a,#') 
      008F99 F7 5C            [ 1]   80 	jreq 0$
      008F9B CD 8D C3         [ 4]   81 	call is_alnum 
      008F9E CC 91            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      001145                         83 0$: 
      008FA0 1F 20            [ 1]   84 	ld a,#SPACE 
      008FA1 90 F7            [ 1]   85 	ld (y),a 
      008FA1 A6 24            [ 1]   86 	incw y 
      008FA3 11               [ 4]   87 1$: ret 
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
      00114C                         99 right_align::
      008FA4 01               [ 1]  100 	push a 
      008FA5 27 17            [ 1]  101 0$: ld a,(1,sp)
      008FA7 A6 26 11         [ 1]  102 	cp a,tab_width 
      008FAA 01 26            [ 1]  103 	jrpl 1$
      008FAC 0A A6            [ 1]  104 	ld a,#SPACE 
      008FAE 84               [ 2]  105 	decw x
      008FAF F7               [ 1]  106 	ld (x),a  
      008FB0 5C CD            [ 1]  107 	inc (1,sp)
      008FB2 8E 6D            [ 2]  108 	jra 0$ 
      008FB4 CC               [ 1]  109 1$: pop a 	
      008FB5 91               [ 4]  110 	ret 
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
      00115E                        123 cpy_quote:
      008FB6 1F 7B            [ 1]  124 	ld a,#'"
      008FB8 01 CD            [ 1]  125 	ld (y),a 
      008FBA 8E B9            [ 1]  126 	incw y 
      008FBC 24               [ 2]  127 	pushw x 
      008FBD 0C A6 84         [ 4]  128 	call skip_string 
      008FC0 F7               [ 2]  129 	popw x 
      008FC1 5C               [ 1]  130 1$:	ld a,(x)
      008FC2 7B 01            [ 1]  131 	jreq 9$
      008FC4 CD               [ 1]  132 	incw x 
      008FC5 8E 18            [ 1]  133 	cp a,#SPACE 
      008FC7 CC 91            [ 1]  134 	jrult 3$
      008FC9 1F F7            [ 1]  135 	ld (y),a
      008FCA 90 5C            [ 1]  136 	incw y 
      008FCA A6 28            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      008FCC 11 01            [ 1]  138 	jrne 1$ 
      001179                        139 2$:
      008FCE 26 05            [ 1]  140 	ld (y),a
      008FD0 A6 06            [ 1]  141 	incw y  
      008FD2 CC 91            [ 2]  142 	jra 1$
      008FD4 1B               [ 1]  143 3$: push a 
      008FD5 A6 5C            [ 1]  144 	ld a,#'\
      008FD5 A6 5C            [ 1]  145 	ld (y),a 
      008FD7 11 01            [ 1]  146 	incw y  
      008FD9 26               [ 1]  147 	pop a 
      008FDA 16 A6            [ 1]  148 	sub a,#7
      008FDC 04 F7 5C         [ 1]  149 	ld acc8,a 
      008FDF 91 D6 01 F7      [ 1]  150 	clr acc16
      008FE3 5C               [ 2]  151 	pushw x
      008FE4 90 93 72         [ 2]  152 	ldw x,#escaped 
      008FE7 5C 00 02 5F      [ 2]  153 	addw x,acc16 
      008FEB 97               [ 1]  154 	ld a,(x)
      008FEC A6               [ 2]  155 	popw x
      008FED 04 CC            [ 2]  156 	jra 2$
      008FEF 91 1F            [ 1]  157 9$: ld a,#'"
      008FF1 90 F7            [ 1]  158 	ld (y),a 
      008FF1 A6 29            [ 1]  159 	incw y  
      008FF3 11               [ 1]  160 	incw x 
      008FF4 01               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011A4                        171 var_name::
      008FF5 26 05 A6         [ 2]  172 		subw x,#vars 
      008FF8 07 CC            [ 1]  173 		ld a,#3
      008FFA 91               [ 2]  174 		div x,a 
      008FFB 1B               [ 1]  175 		ld a,xl 
      008FFC AB 41            [ 1]  176 		add a,#'A 
      008FFC A6               [ 4]  177 		ret 
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
      0011AE                        195 decompile::
      0011AE                        196 	_vars VSIZE
      008FFD 3A 11            [ 2]    1     sub sp,#VSIZE 
      008FFF 01 26 05         [ 1]  197 	ld a,base
      009002 A6 0A            [ 1]  198 	ld (BASE_SAV,sp),a  
      009004 CC 91 1B         [ 1]  199 	ld a,tab_width 
      009007 6B 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      009007 A6 2C            [ 2]  201 	ldw (STR,sp),y   
      009009 11 01 26 05      [ 5]  202 	ldw x,[basicptr] ; line number 
      00900D A6 08 CC 91      [ 1]  203 	mov base,#10
      009011 1B 05 00 23      [ 1]  204 	mov tab_width,#5
      009012 72 5F 00 0C      [ 1]  205 	clr acc24 
      009012 A6 23 11         [ 2]  206 	ldw acc16,x
      009015 01               [ 1]  207 	clr a ; unsigned conversion 
      009016 26 05 A6         [ 4]  208 	call itoa  
      009019 09 CC 91         [ 4]  209 	call right_align 
      00901C 1B               [ 1]  210 	push a 
      00901D 90 93            [ 1]  211 1$:	ldw y,x ; source
      00901D A6 2D            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      00901F 11 01 26         [ 4]  213 	call strcpy 
      009022 05 A6            [ 1]  214 	clrw y 
      009024 11               [ 1]  215 	pop a 
      009025 CC 91            [ 1]  216 	ld yl,a 
      009027 1B F9 03         [ 2]  217 	addw y,(STR,sp)
      009028 A6 20            [ 1]  218 	ld a,#SPACE 
      009028 A6 40            [ 1]  219 	ld (y),a 
      00902A 11 01            [ 1]  220 	incw y 
      00902C 26 05 A6 05      [ 1]  221 	clr tab_width
      009030 CC 91 1B         [ 2]  222 	ldw x,#3
      009033 CF 00 00         [ 2]  223 	ldw in.w,x 
      0011F6                        224 decomp_loop:
      009033 A6 3F            [ 2]  225 	pushw y
      009035 11 01 26         [ 4]  226 	call next_token 
      009038 12 A6            [ 2]  227 	popw y 
      00903A 80               [ 1]  228 	tnz a  
      00903B F7 5C            [ 1]  229 	jrne 1$
      00903D 90 93 AE         [ 2]  230 	jp 20$
      009040 A0 55            [ 1]  231 1$:	jrmi 2$
      009042 90 FF 72         [ 2]  232 	jp 6$
      001208                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      009045 A9 00            [ 1]  234 	cp a,#TK_VAR 
      009047 02 CC            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009049 91 1F 36         [ 4]  237 	call add_space
      00904B CD 18 23         [ 4]  238 	call get_addr   
      00904B A6 27 11         [ 4]  239 	call var_name
      00904E 01 26            [ 1]  240 	ld (y),a 
      009050 2B A6            [ 1]  241 	incw y  
      009052 80 F7            [ 2]  242 	jra decomp_loop
      00121B                        243 3$:
      009054 5C 90            [ 1]  244 	cp a,#TK_INTGR
      009056 AE A1            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009058 9D FF 1C         [ 4]  247 	call get_int24 
      00905B 00 02 0C         [ 1]  248 	ld acc24,a 
      00905D CF 00 0D         [ 2]  249 	ldw acc16,x 
      00905D 90 AE 16         [ 4]  250 	call add_space
      009060 68 72            [ 2]  251 	pushw y 
      009062 B9 00            [ 1]  252 	ld a,#255 ; signed conversion 
      009064 01 90 89         [ 4]  253 	call itoa  
      009067 CD 94            [ 2]  254 	ldw y,(1,sp) 
      009069 2E               [ 1]  255 	push a 
      00906A 72               [ 1]  256 	exgw x,y 
      00906B F2 01 90         [ 4]  257 	call strcpy 
      00906E 5C 17            [ 1]  258 	clrw y
      009070 01               [ 1]  259 	pop a  
      009071 72 FB            [ 1]  260 	ld yl,a 
      009073 01 5B 02         [ 2]  261 	addw y,(1,sp)
      001241                        262 	_drop 2 
      009076 4F 90            [ 2]    1     addw sp,#2 
      009078 93 CC            [ 2]  263 	jra decomp_loop
      001245                        264 4$: ; dictionary keyword
      00907A 91 1F            [ 1]  265 	cp a,#TK_NOT 
      00907C 24 39            [ 1]  266 	jruge 50$ 
      00907C A6               [ 2]  267 	ldw x,(x)
      00907D 2B 11 01 26      [ 1]  268 	inc in 
      009081 05 A6 10 CC      [ 1]  269 	inc in 
      009085 91 1B 1D         [ 2]  270 	cpw x,#remark 
      009087 26 23            [ 1]  271 	jrne 5$
      009087 A6 2A 11         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      00908A 01 26 05         [ 4]  274 	call add_space
      00908D A6 20            [ 1]  275 	ld a,#''
      00908F CC 91            [ 1]  276 	ld (y),a 
      009091 1B 5C            [ 1]  277 	incw y 
      009092                        278 46$:
      009092 A6 2F 11 01      [ 4]  279 	ld a,([in.w],x)
      009096 26 05 A6 21      [ 1]  280 	inc in  
      00909A CC 91            [ 1]  281 	ld (y),a 
      00909C 1B 5C            [ 1]  282 	incw y 
      00909D C6 00 01         [ 1]  283 	ld a,in 
      00909D A6 25 11         [ 1]  284 	cp a,count 
      0090A0 01 26            [ 1]  285 	jrmi 46$
      0090A2 05 A6 22         [ 2]  286 	jp 20$  
      0090A5 CC 91 1B         [ 2]  287 5$: cpw x,#let  
      0090A8 26 05            [ 1]  288 	jrne 54$
      0090A8 A6 3D 11         [ 2]  289 	jp decomp_loop ; down display LET
      001282                        290 50$:
      0090AB 01               [ 1]  291 	clrw x 
      0090AC 26               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      001284                        297 54$: ; insert command name 
      0090AD 05 A6 32         [ 4]  298 	call add_space  
      0090B0 CC 91            [ 2]  299 	pushw y
      0090B2 1B 13 5E         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      0090B3 90 85            [ 2]  301 	popw y 
      0090B3 A6 3E 11         [ 4]  302 	call cpy_cmd_name
      0090B6 01 26 23         [ 2]  303 	jp decomp_loop 
      001294                        304 6$:
                                    305 ; label?
      0090B9 A6 31            [ 1]  306 	cp a,#TK_LABEL 
      0090BB 6B 02            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0090BD 91 D6            [ 1]  309 	ld a,#32 
      0090BF 01 72            [ 1]  310 	ld (y),a 
      0090C1 5C 00            [ 1]  311 	incw y 
      00129E                        312 61$:
      0090C3 02               [ 2]  313 	pushw x 
      0090C4 A1 3D 26         [ 4]  314 	call skip_string 
      0090C7 04               [ 2]  315 	popw x 
      0012A3                        316 62$:	
      0090C8 A6               [ 1]  317 	ld a,(x)
      0090C9 33 20            [ 1]  318 	jreq 63$ 
      0090CB 4F               [ 1]  319 	incw x  
      0090CC A1 3C            [ 1]  320 	ld (y),a 
      0090CE 26 04            [ 1]  321 	incw y 
      0090D0 A6 35            [ 2]  322 	jra 62$ 
      0012AD                        323 63$: 
      0090D2 20 47            [ 1]  324 	ld a,#32 
      0090D4 72 5A            [ 1]  325 	ld (y),a 
      0090D6 00 02            [ 1]  326 	incw y 
      0090D8 7B 02 20         [ 2]  327 	jp decomp_loop
      0012B6                        328 64$:
      0090DB 3F 02            [ 1]  329 	cp a,#TK_QSTR 
      0090DC 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0090DC A6 3C 11         [ 4]  332 	call add_space
      0090DF 01 26 23         [ 4]  333 	call cpy_quote  
      0090E2 A6 34 6B         [ 2]  334 	jp decomp_loop
      0012C3                        335 7$:
      0090E5 02 91            [ 1]  336 	cp a,#TK_CHAR 
      0090E7 D6 01            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      0090E9 72 5C 00         [ 4]  339 	call add_space 
      0090EC 02 A1            [ 1]  340 	ld a,#'\ 
      0090EE 3D 26            [ 1]  341 	ld (y),a 
      0090F0 04 A6            [ 1]  342 	incw y
      0090F2 36               [ 1]  343 	ld a,(x)
      0090F3 20 26 A1 3E      [ 1]  344 	inc in  
      0090F7 26 04            [ 2]  345 	jra 81$
      0090F9 A6 35            [ 1]  346 8$: cp a,#TK_COLON 
      0090FB 20 1E            [ 1]  347 	jrne 9$
      0090FD 72 5A            [ 1]  348 	ld a,#':
      0012DD                        349 81$:
      0090FF 00 02            [ 1]  350 	ld (y),a 
      009101 7B 02            [ 1]  351 	incw y 
      0012E1                        352 82$:
      009103 20 16 F6         [ 2]  353 	jp decomp_loop
      009105                        354 9$: 
      009105 7B 01            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009107 CD 8E            [ 1]  356 	jrugt 10$ 
      009109 A8 25            [ 1]  357 	sub a,#TK_ARRAY 
      00910B 03               [ 1]  358 	clrw x 
      00910C CC               [ 1]  359 	ld xl,a
      00910D 97 14 39         [ 2]  360 	addw x,#single_char 
      00910F F6               [ 1]  361 	ld a,(x)
      00910F CD 8E            [ 2]  362 	jra 81$ 
      0012F2                        363 10$: 
      009111 EE A3            [ 1]  364 	cp a,#TK_MINUS 
      009113 A1 9D            [ 1]  365 	jrugt 11$
      009115 26 08            [ 1]  366 	sub a,#TK_PLUS 
      009117 93               [ 1]  367 	clrw x 
      009118 CC               [ 1]  368 	ld xl,a 
      009119 90 5D 3E         [ 2]  369 	addw x,#add_char 
      00911B F6               [ 1]  370 	ld a,(x)
      00911B F7 5C            [ 2]  371 	jra 81$
      001300                        372 11$:
      00911D 90 93            [ 1]  373     cp a,#TK_MOD 
      00911F 22 0A            [ 1]  374 	jrugt 12$
      00911F 5B 02            [ 1]  375 	sub a,#TK_MULT
      009121 81               [ 1]  376 	clrw x 
      009122 97               [ 1]  377 	ld xl,a 
      009122 90 89 52         [ 2]  378 	addw x,#mul_char
      009125 02               [ 1]  379 	ld a,(x)
      009126 55 00            [ 2]  380 	jra 81$
      00130E                        381 12$:
      009128 1C 00            [ 1]  382 	sub a,#TK_GT  
      00912A 05               [ 1]  383 	sll a 
      00912B 72               [ 1]  384 	clrw x 
      00912C 1A               [ 1]  385 	ld xl,a 
      00912D 00 23 A6         [ 2]  386 	addw x,#relop_str 
      009130 00               [ 2]  387 	ldw x,(x)
      009131 AE               [ 1]  388 	ld a,(x)
      009132 00               [ 1]  389 	incw x 
      009133 00 CF            [ 1]  390 	ld (y),a
      009135 16 B8            [ 1]  391 	incw y 
      009137 C7               [ 1]  392 	ld a,(x)
      009138 16 BA            [ 1]  393 	jrne 81$
      00913A AE 16 BB         [ 2]  394 	jp decomp_loop 
      001323                        395 20$: 
      00913D 72 5F            [ 1]  396 	clr (y)
      00913F 00 02            [ 2]  397 	ldw x,(STR,sp)
      009141 CD 8F            [ 1]  398 	ld a,(BASE_SAV,sp)
      009143 6E A1 84         [ 1]  399 	ld base,a 
      009146 26 11            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      009148 A3 00 01         [ 1]  401 	ld tab_width,a
      00914B 2A 05 A6         [ 2]  402 	subw y,(STR,sp) 
      00914E 0A CC            [ 1]  403 	ld a,yl 
      001336                        404 	_drop VSIZE 
      009150 97 16            [ 2]    1     addw sp,#VSIZE 
      009152 CF               [ 4]  405 	ret 
                                    406 
      009153 16 B8 90 AE 16         407 single_char: .byte '@','(',')',',','#'
      009158 BB 90                  408 add_char: .byte '+','-'
      00915A A3 17 38               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00915D 25 05 A6 0F CC 97 16   410 relop_str: .word gt,equal,ge,lt,ne,le 
             56 13 5B 13 58
      009164 3E 00                  411 gt: .asciz ">"
      009164 93 CD                  412 equal: .asciz "="
      009166 8F 6E A1               413 ge: .asciz ">="
      009169 00 26                  414 lt: .asciz "<"
      00916B ED 72 A2               415 le: .asciz "<="
      00916E 16 B8 90               416 ne:  .asciz "<>"
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
      00135E                        429 cmd_name:
      00135E                        430 	_vars VSIZE 
      009171 9F AE            [ 2]    1     sub sp,#VSIZE 
      009173 16 B8 CF 00      [ 1]  431 	clr acc16 
      009177 1A E7            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009179 02 FE 27         [ 2]  433 	ldw x,#kword_dict	
      00917C 09 CD            [ 2]  434 1$:	ldw (LINK,sp),x
      00917E 8D 5C            [ 1]  435 	ld a,(2,x)
      009180 72 5F            [ 1]  436 	and a,#15 
      009182 00 03 20         [ 1]  437 	ld acc8,a 
      009185 0F 00 03         [ 2]  438 	addw x,#3
      009186 72 BB 00 0D      [ 2]  439 	addw x,acc16
      009186 CE               [ 2]  440 	ldw x,(x) ; code address   
      009187 00 1A            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      009189 CF 00            [ 1]  442 	jreq 2$
      00918B 05 E6            [ 2]  443 	ldw x,(LINK,sp)
      00918D 02               [ 2]  444 	ldw x,(x) 
      00918E C7 00 03         [ 2]  445 	subw x,#2  
      009191 35 03            [ 1]  446 	jrne 1$
      009193 00               [ 1]  447 	clr a 
      009194 02               [ 1]  448 	clrw x 
      009195 20 05            [ 2]  449 	jra 9$
      009195 5B 02            [ 2]  450 2$: ldw x,(LINK,sp)
      009197 72 1B 00         [ 2]  451 	addw x,#2 	
      00138F                        452 9$:	_drop VSIZE
      00919A 23 90            [ 2]    1     addw sp,#VSIZE 
      00919C 85               [ 4]  453 	ret
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
      001392                        120 strlen::
      00919D 81               [ 2]  121 	pushw x 
      00919E 4F               [ 1]  122 	clr a
      00919E 5D               [ 1]  123 1$:	tnz (x) 
      00919F 27 14            [ 1]  124 	jreq 9$ 
      0091A1 F6               [ 1]  125 	inc a 
      0091A2 5C               [ 1]  126 	incw x 
      0091A3 A4 0F            [ 2]  127 	jra 1$ 
      0091A5 88               [ 2]  128 9$:	popw x 
      0091A6 0D               [ 4]  129 	ret 
                                    130 
                                    131 ;------------------------------------
                                    132 ; compare 2 strings
                                    133 ; input:
                                    134 ;   X 		char* first string 
                                    135 ;   Y       char* second string 
                                    136 ; output:
                                    137 ;   A 		0 not == |1 ==  
                                    138 ;-------------------------------------
      00139D                        139 strcmp:
      0091A7 01               [ 1]  140 	ld a,(x)
      0091A8 27 0A            [ 1]  141 	jreq 5$ 
      0091AA F6 90            [ 1]  142 	cp a,(y) 
      0091AC F7 5C            [ 1]  143 	jrne 4$ 
      0091AE 90               [ 1]  144 	incw x 
      0091AF 5C 0A            [ 1]  145 	incw y 
      0091B1 01 26            [ 2]  146 	jra strcmp 
      0013A9                        147 4$: ; not same  
      0091B3 F6               [ 1]  148 	clr a 
      0091B4 84               [ 4]  149 	ret 
      0091B5                        150 5$: ; same 
      0091B5 81 01            [ 1]  151 	ld a,#1 
      0091B6 81               [ 4]  152 	ret 
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
      0013AE                        163 strcpy::
      0091B6 90               [ 1]  164 	push a 
      0091B7 5A               [ 2]  165 	pushw x 
      0091B8 90 F6            [ 1]  166 1$: ld a,(y)
      0091BA 90 5C            [ 1]  167 	jreq 9$ 
      0091BC A1               [ 1]  168 	ld (x),a 
      0091BD 29               [ 1]  169 	incw x 
      0091BE 27 05            [ 1]  170 	incw y 
      0091C0 CD 8E            [ 2]  171 	jra 1$ 
      0091C2 C2               [ 1]  172 9$:	clr (x)
      0091C3 24               [ 2]  173 	popw x 
      0091C4 06               [ 1]  174 	pop a 
      0091C5 81               [ 4]  175 	ret 
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
      0013BE                        189 move::
      0091C5 A6               [ 1]  190 	push a 
      0013BF                        191 	_vars VSIZE 
      0091C6 20 90            [ 2]    1     sub sp,#VSIZE 
      0091C8 F7 90            [ 1]  192 	clr (INCR,sp)
      0091CA 5C 81            [ 1]  193 	clr (LB,sp)
      0091CC 90 89            [ 2]  194 	pushw y 
      0091CC 88 7B            [ 2]  195 	cpw x,(1,sp) ; compare DEST to SRC 
      0091CE 01 C1            [ 2]  196 	popw y 
      0091D0 00 24            [ 1]  197 	jreq move_exit ; x==y 
      0091D2 2A 08            [ 1]  198 	jrmi move_down
      0013CF                        199 move_up: ; start from top address with incr=-1
      0091D4 A6 20 5A F7      [ 2]  200 	addw x,acc16
      0091D8 0C 01 20 F1      [ 2]  201 	addw y,acc16
      0091DC 84 81            [ 1]  202 	cpl (INCR,sp)
      0091DE 03 02            [ 1]  203 	cpl (LB,sp)   ; increment = -1 
      0091DE A6 22            [ 2]  204 	jra move_loop  
      0013DD                        205 move_down: ; start from bottom address with incr=1 
      0091E0 90               [ 2]  206     decw x 
      0091E1 F7 90            [ 2]  207 	decw y
      0091E3 5C 89            [ 1]  208 	inc (LB,sp) ; incr=1 
      0013E2                        209 move_loop:	
      0091E5 CD 98 94         [ 1]  210     ld a, acc16 
      0091E8 85 F6 27         [ 1]  211 	or a, acc8
      0091EB 30 5C            [ 1]  212 	jreq move_exit 
      0091ED A1 20 25         [ 2]  213 	addw x,(INCR,sp)
      0091F0 0E 90 F7         [ 2]  214 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0091F3 90 5C            [ 1]  215 	ld a,(y)
      0091F5 A1               [ 1]  216 	ld (x),a 
      0091F6 5C               [ 2]  217 	pushw x 
      0091F7 26 F0 0D         [ 2]  218 	ldw x,acc16 
      0091F9 5A               [ 2]  219 	decw x 
      0091F9 90 F7 90         [ 2]  220 	ldw acc16,x 
      0091FC 5C               [ 2]  221 	popw x 
      0091FD 20 EA            [ 2]  222 	jra move_loop
      0013FE                        223 move_exit:
      0013FE                        224 	_drop VSIZE
      0091FF 88 A6            [ 2]    1     addw sp,#VSIZE 
      009201 5C               [ 1]  225 	pop a 
      009202 90               [ 4]  226 	ret 	
                                    227 
                                    228 ;------------------------------------
                                    229 ;  set all variables to zero 
                                    230 ; input:
                                    231 ;   none 
                                    232 ; output:
                                    233 ;	none
                                    234 ;------------------------------------
      001402                        235 clear_vars:
      009203 F7               [ 2]  236 	pushw x 
      009204 90               [ 1]  237 	push a  
      009205 5C 84 A0         [ 2]  238 	ldw x,#vars 
      009208 07 C7            [ 1]  239 	ld a,#CELL_SIZE*26 
      00920A 00               [ 1]  240 1$:	clr (x)
      00920B 0F               [ 1]  241 	incw x 
      00920C 72               [ 1]  242 	dec a 
      00920D 5F 00            [ 1]  243 	jrne 1$
      00920F 0E               [ 1]  244 	pop a 
      009210 89               [ 2]  245 	popw x 
      009211 AE               [ 4]  246 	ret 
                                    247 
                                    248 
                                    249 ;-----------------------
                                    250 ;  display system 
                                    251 ;  information 
                                    252 ;-----------------------
                           000002   253 	MAJOR=2
                           000000   254 	MINOR=0 
      009212 8E 10 72 BB 00 0E F6   255 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      009224                        257 system_information:
      009224 1D 00 36         [ 2]  258 	ldw x,#software 
      009227 A6 03 62         [ 4]  259 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00922A 9F AB            [ 1]  260 	ld a,#MAJOR 
      00922C 41 81 0E         [ 1]  261 	ld acc8,a 
      00922E 5F               [ 1]  262 	clrw x 
      00922E 52 04 C6         [ 2]  263 	ldw acc24,x
      009231 00 0B 6B 01      [ 1]  264 	clr tab_width  
      009235 C6 00 24 6B      [ 1]  265 	mov base, #10 
      009239 02 17 03         [ 4]  266 	call prt_acc24 
      00923C 72 CE            [ 1]  267 	ld a,#'.
      00923E 00 05 35         [ 4]  268 	call putc 
      009241 0A 00            [ 1]  269 	ld a,#MINOR 
      009243 0B 35 05         [ 1]  270 	ld acc8,a 
      009246 00               [ 1]  271 	clrw x 
      009247 24 72 5F         [ 2]  272 	ldw acc24,x 
      00924A 00 0D CF         [ 4]  273 	call prt_acc24
      00924D 00 0E            [ 1]  274 	ld a,#CR 
      00924F 4F CD 99         [ 4]  275 	call putc
                                    276 ;call test 
      009252 00               [ 4]  277 	ret
                                    278 
      001488                        279 warm_init:
      009253 CD 91 CC 88      [ 2]  280 	ldw y,#XSTACK_EMPTY  
      009257 90 93 1E 04      [ 1]  281 	clr flags 
      00925B CD 94 2E 90      [ 1]  282 	clr loop_depth 
      00925F 5F 84 90 97      [ 1]  283 	mov tab_width,#TAB_WIDTH 
      009263 72 F9 03 A6      [ 1]  284 	mov base,#10 
      009267 20 90 F7         [ 2]  285 	ldw x,#0 
      00926A 90 5C 72         [ 2]  286 	ldw basicptr,x 
      00926D 5F 00 24         [ 2]  287 	ldw in.w,x 
      009270 AE 00 03 CF      [ 1]  288 	clr count
      009274 00               [ 4]  289 	ret 
                                    290 
                                    291 ;---------------------------
                                    292 ; reset BASIC text variables 
                                    293 ; and clear variables 
                                    294 ;---------------------------
      0014AA                        295 clear_basic:
      009275 01               [ 2]  296 	pushw x 
      009276 72 5F 00 02      [ 1]  297 	clr count
      009276 90 89 CD 98      [ 1]  298 	clr in  
      00927A 7B 90 85         [ 2]  299 	ldw x,#free_ram 
      00927D 4D 26 03         [ 2]  300 	ldw txtbgn,x 
      009280 CC 93 A3         [ 2]  301 	ldw txtend,x 
      009283 2B 03 CC         [ 2]  302 	ldw dvar_bgn,x 
      009286 93 14 32         [ 2]  303 	ldw dvar_end,x 
      009288 CD 14 02         [ 4]  304 	call clear_vars 
      009288 A1 85 26 0F      [ 1]  305 	clr chain_level 
      00928C CD               [ 2]  306 	popw x
      00928D 91               [ 4]  307 	ret 
                                    308 
                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;;   Tiny BASIC error messages     ;;
                                    311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014CB                        312 err_msg:
      00928E B6 CD 98 A3 CD 92 24   313 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             90 F7 90 5C 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00929A DB 4A 15 60 15 7A 15   314 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             8B 15 9C
      00929B 15 A8 15 DB 15 EB 15   315 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             FF 16 12
      00929B A1 84 26 26 CD 98      316 	.word err_overflow,err_read_only,err_not_program  
                                    317 
      0092A1 AD C7 00 0D CF 00 0E   318 err_mem_full: .asciz "Memory full\n" 
             CD 91 B6 90 89 A6
      0092AE FF CD 99 00 16 01 88   319 err_syntax: .asciz "syntax error\n" 
             51 CD 94 2E 90 5F 84
      0092BC 90 97 72 F9 01 5B 02   320 err_math_ovf: .asciz "math operation overflow\n"
             20 B1 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092C5 64 69 76 69 73 69 6F   321 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0092C5 A1 87 24 39 FE 72 5C   322 err_no_line: .asciz "invalid line number.\n"
             00 02 72 5C 00 02 A3
             A1 9D 26 23 CE 00 05
             CD
      0092DB 91 B6 A6 27 90 F7 90   323 err_run_only: .asciz "run time only usage.\n" 
             5C 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092E3 63 6F 6D 6D 61 6E 64   324 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0092E3 72 D6 00 01 72 5C 00   325 err_duplicate: .asciz "duplicate name.\n"
             02 90 F7 90 5C C6 00
             02 C1 00
      0092F4 03 2B EC CC 93 A3 A3   326 err_not_file: .asciz "File not found.\n"
             9D 5D 26 05 CC 92 76
             2E 0A 00
      009302 62 61 64 20 76 61 6C   327 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      009302 5F 97 6C 65 20 69 6E   328 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      009304 4E 6F 20 64 61 74 61   329 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      009304 CD 91 B6 90 89 CD 93   330 err_no_prog: .asciz "No program in RAM!\n"
             DE 90 85 CD 91 9E CC
             92 76 4D 21 0A 00
      009314 46 69 6C 65 20 73 79   331 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      009314 A1 03 26 1E A6 20 90   332 err_buf_full: .asciz "Buffer full\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal  F7-Bits]



             66 75 6C 6C 0A 00
      00931C 90 5C 65 72 66 6C 6F   333 err_overflow: .asciz "overflow\n" 
             77 0A 00
      00931E 63 6F 6E 73 74 61 6E   334 err_read_only: .asciz "constant can't be modified\n"
             74 20 63 61 6E 27 74
             20 62 65 20 6D 6F 64
             69 66 69 65 64 0A 00
      00931E 89 CD 98 94 85 6F 67   335 err_not_program: .asciz "no program at this address\n"
             72 61 6D 20 61 74 20
             74 68 69 73 20 61 64
             64 72 65 73 73 0A 00
                                    336 
                                    337 ;-------------------------------------
      009323 0A 72 75 6E 20 74 69   338 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      009323 F6 27 07 5C 90 F7 90   339 comp_msg: .asciz "\ncompile error, "
             5C 20 F6 72 72 6F 72
             2C 20 00
      00932D 6C 61 73 74 20 74 6F   340 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    341 
      001694                        342 syntax_error::
      00932D A6 20            [ 1]  343 	ld a,#ERR_SYNTAX 
                                    344 
      001696                        345 tb_error::
      00932F 90 F7 90 5C CC   [ 2]  346 	btjt flags,#FCOMP,1$
      009334 92               [ 1]  347 	push a 
      009335 76 16 61         [ 2]  348 	ldw x, #rt_msg 
      009336 CD 09 5C         [ 4]  349 	call puts 
      009336 A1               [ 1]  350 	pop a 
      009337 02 26 09         [ 2]  351 	ldw x, #err_msg 
      00933A CD 91 B6 CD      [ 1]  352 	clr acc16 
      00933E 91               [ 1]  353 	sll a
      00933F DE CC 92 76      [ 1]  354 	rlc acc16  
      009343 C7 00 0E         [ 1]  355 	ld acc8, a 
      009343 A1 04 26 10      [ 2]  356 	addw x,acc16 
      009347 CD               [ 2]  357 	ldw x,(x)
      009348 91 B6 A6         [ 4]  358 	call puts
      00934B 5C 90 F7         [ 2]  359 	ldw x,basicptr 
                           000001   360 .if DEBUG 
      00934E 90 5C F6         [ 1]  361 ld a,count 
      009351 72 5C            [ 1]  362 clrw y 
      009353 00 02            [ 1]  363 rlwa y  
      009355 20 06 A1         [ 4]  364 call hex_dump
      009358 0A 26 09         [ 2]  365 ldw x,basicptr
                                    366 .endif 
      00935B A6 3A 01         [ 1]  367 	ld a,in 
      00935D CD 1F B1         [ 4]  368 	call prt_basic_line
      00935D 90 F7 90         [ 2]  369 	ldw x,#tk_id 
      009360 5C 09 5C         [ 4]  370 	call puts 
      009361 C6 00 03         [ 1]  371 	ld a,in.saved 
      009361 CC               [ 1]  372 	clrw x 
      009362 92               [ 1]  373 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009363 76 BB 00 04      [ 2]  374 	addw x,basicptr 
      009364 F6               [ 1]  375 	ld a,(x)
      009364 A1               [ 1]  376 	clrw x 
      009365 09               [ 1]  377 	ld xl,a 
      009366 22 0A A0         [ 4]  378 	call prt_i16
      009369 05 5F            [ 2]  379 	jra 6$
      0016E7                        380 1$:	
      00936B 97               [ 1]  381 	push a 
      00936C 1C 93 B9         [ 2]  382 	ldw x,#comp_msg
      00936F F6 20 EB         [ 4]  383 	call puts 
      009372 84               [ 1]  384 	pop a 
      009372 A1 11 22         [ 2]  385 	ldw x, #err_msg 
      009375 0A A0 10 5F      [ 1]  386 	clr acc16 
      009379 97               [ 1]  387 	sll a
      00937A 1C 93 BE F6      [ 1]  388 	rlc acc16  
      00937E 20 DD 0E         [ 1]  389 	ld acc8, a 
      009380 72 BB 00 0D      [ 2]  390 	addw x,acc16 
      009380 A1               [ 2]  391 	ldw x,(x)
      009381 22 22 0A         [ 4]  392 	call puts
      009384 A0 20 5F         [ 2]  393 	ldw x,#tib
      009387 97 1C 93         [ 4]  394 	call puts 
      00938A C0 F6            [ 1]  395 	ld a,#CR 
      00938C 20 CF FF         [ 4]  396 	call putc
      00938E CE 00 00         [ 2]  397 	ldw x,in.w
      00938E A0 31 48         [ 4]  398 	call spaces
      009391 5F 97            [ 1]  399 	ld a,#'^
      009393 1C 93 C3         [ 4]  400 	call putc 
      009396 FE F6 5C         [ 2]  401 6$: ldw x,#STACK_EMPTY 
      009399 90               [ 1]  402     ldw sp,x
                                    403 
      001720                        404 warm_start:
      00939A F7 90 5C         [ 4]  405 	call warm_init
                                    406 ;----------------------------
                                    407 ;   BASIC interpreter
                                    408 ;----------------------------
      001723                        409 cmd_line: ; user interface 
      00939D F6 26            [ 1]  410 	ld a,#CR 
      00939F BD CC 92         [ 4]  411 	call putc 
      0093A2 76 3E            [ 1]  412 	ld a,#'> 
      0093A3 CD 08 FF         [ 4]  413 	call putc
      0093A3 90 7F 1E         [ 4]  414 	call readln
      0093A6 03 7B 01 C7      [ 1]  415 	tnz count 
      0093AA 00 0B            [ 1]  416 	jreq cmd_line
      0093AC 7B 02 C7         [ 4]  417 	call compile
                                    418 ;;;;;;;;;;;;;;;;;;;;;;	
                                    419 ;pushw y 
                                    420 ;ldw x,txtbgn  
                                    421 ;ldw y,txtend
                                    422 ;ldw acc16,x   
                                    423 ;subw y,acc16 
                                    424 ;call hex_dump
                                    425 ;popw y 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;
                                    427 
                                    428 ; if text begin with a line number
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    429 ; the compiler set count to zero    
                                    430 ; so code is not interpreted
      0093AF 00 24 72 F2      [ 1]  431 	tnz count 
      0093B3 03 90            [ 1]  432 	jreq cmd_line
                                    433 	
                                    434 ; if direct command 
                                    435 ; it's ready to interpret 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;; This is the interpreter loop
                                    438 ;; for each BASIC code line. 
                                    439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00173F                        440 interpreter: 
      0093B5 9F 5B 04         [ 1]  441 	ld a,in 
      0093B8 81 40 28         [ 1]  442 	cp a,count 
      0093BB 29 2C            [ 1]  443 	jrmi interp_loop
      001747                        444 next_line:
      0093BD 23 2B 2D 2A 2F   [ 2]  445 	btjf flags, #FRUN, cmd_line
      0093C2 25 93 CF         [ 2]  446 	ldw x,basicptr
      0093C5 93 D1 93 D3      [ 2]  447 	addw x,in.w 
      0093C9 93 D6 93         [ 2]  448 	cpw x,txtend 
      0093CC DB 93            [ 1]  449 	jrmi 0$
      0093CE D8 3E 00         [ 4]  450 	call cmd_end 
      0093D1 3D 00 3E         [ 2]  451 0$:	ldw basicptr,x ; start of next line  
      0093D4 3D 00            [ 1]  452 	ld a,(2,x)
      0093D6 3C 00 3C         [ 1]  453 	ld count,a 
      0093D9 3D 00 3C 3E      [ 1]  454 	mov in,#3 ; skip first 3 bytes of line 
      001767                        455 interp_loop:
      0093DD 00 17 FB         [ 4]  456 	call next_token
      0093DE A1 00            [ 1]  457 	cp a,#TK_NONE 
      0093DE 52 04            [ 1]  458 	jreq next_line 
      0093E0 72 5F            [ 1]  459 	cp a,#TK_CMD
      0093E2 00 0E            [ 1]  460 	jrne 1$
      001772                        461 	_get_code_addr
      0093E4 1F               [ 2]    1         ldw x,(x)
      0093E5 01 AE B7 12      [ 1]    2         inc in 
      0093E9 1F 03 E6 02      [ 1]    3         inc in 
      0093ED A4               [ 4]  462 	call(x)
      0093EE 0F C7            [ 2]  463 	jra interp_loop 
      00177E                        464 1$:	 
      0093F0 00 0F            [ 1]  465 	cp a,#TK_VAR
      0093F2 1C 00            [ 1]  466 	jrne 2$
      0093F4 03 72 BB         [ 4]  467 	call let_var  
      0093F7 00 0E            [ 2]  468 	jra interp_loop 
      001787                        469 2$:	
      0093F9 FE 13            [ 1]  470 	cp a,#TK_ARRAY 
      0093FB 01 27            [ 1]  471 	jrne 3$
      0093FD 0C 1E 03         [ 4]  472 	call let_array 
      009400 FE 1D            [ 2]  473 	jra interp_loop
      001790                        474 3$:	
      009402 00 02            [ 1]  475 	cp a,#TK_LABEL
      009404 26 E3            [ 1]  476 	jrne 4$
      009406 4F 5F 20         [ 4]  477 	call let_dvar  
      009409 05 1E            [ 2]  478 	jra interp_loop 
      001799                        479 4$: 
      00940B 03 1C            [ 1]  480 	cp a,#TK_COLON 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00940D 00 02            [ 1]  481 	jreq interp_loop
      00940F 5B 04 81         [ 2]  482 5$:	jp syntax_error 
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
      000001                        495 let_dvar:
      000002                        496 	_vars VSIZE 
      000003 52 04            [ 2]    1     sub sp,#VSIZE 
      000004 1F 01            [ 2]  497 	ldw (VAR_NAME,sp),x
      000005 0F 03            [ 1]  498 	clr (REC_LEN,sp) 
      000007 CD 18 14         [ 4]  499 	call skip_string 
      000009 CE 00 04         [ 2]  500 	ldw x,basicptr 
      00000A 72 BB 00 00      [ 2]  501 	addw x,in.w 
      00000B F6               [ 1]  502 	ld a,(x)
      00000C A1 32            [ 1]  503 	cp a,#TK_EQUAL 
      00000D 26 43            [ 1]  504 	jrne 9$ 
                                    505 ; dvar assignment 
      00000E 72 5C 00 01      [ 1]  506 	inc in  
      00000F CD 1C 1E         [ 4]  507 	call condition  
      000010 A1 84            [ 1]  508 	cp a,#TK_INTGR 
      000013 27 03            [ 1]  509 	jreq 1$ 
      000015 CC 16 94         [ 2]  510 0$:	jp syntax_error 
      000017                        511 1$: 
      000019 1E 01            [ 2]  512 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      00001A CD 13 92         [ 4]  513 	call strlen 
      00001B AB 05            [ 1]  514 	add a,#REC_XTRA_BYTES
      00001C 6B 04            [ 1]  515 	ld (REC_LEN+1,sp),a 
      00001E CD 1D 5A         [ 4]  516 	call search_name 
      000020 5D               [ 2]  517 	tnzw x 
      000021 27 EE            [ 1]  518 	jreq 0$ 
      000023 F6               [ 1]  519 	ld a,(x)
      000024 2A 05            [ 1]  520 	jrpl 2$
      000025 A6 11            [ 1]  521 	ld a,#ERR_RD_ONLY 
      000027 CC 16 96         [ 2]  522 	jp tb_error 
      00002F                        523 2$:
      000030 72 FB 03         [ 2]  524 	addw x,(REC_LEN,sp)
      000031 1D 00 03         [ 2]  525 	subw x,#CELL_SIZE 
      000033 CF 00 19         [ 2]  526 	ldw ptr16,x
      000035                        527 	_xpop 
      000036 90 F6            [ 1]    1     ld a,(y)
      00008C 93               [ 1]    2     ldw x,y 
      00008C EE 01            [ 2]    3     ldw x,(1,x)
      00008E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      000090 72 C7 00 19      [ 4]  528 	ld [ptr16],a 
      009412 72 5C 00 1A      [ 1]  529 	inc ptr8 
      009412 89 4F 7D 27      [ 5]  530 	ldw [ptr16],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0017F8                        531 9$: _drop VSIZE 	
      009416 04 4C            [ 2]    1     addw sp,#VSIZE 
      009418 5C               [ 4]  532 	ret 
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
      0017FB                        544 next_token::
                                    545 ;	clrw x 
      009419 20 F9 85         [ 1]  546 	ld a,in 
      00941C 81 00 03         [ 1]  547 	ld in.saved,a ; in case "_unget_token" needed 
                                    548 ; don't replace sub by "cp a,count" 
                                    549 ; if end of line must return with A=0   	
      00941D C0 00 02         [ 1]  550 	sub a,count 
      00941D F6 27            [ 1]  551 	jreq 9$ ; end of line 
      001806                        552 0$: 
      00941F 0B 90 F1         [ 2]  553 	ldw x,basicptr 
      009422 26 05 5C 90      [ 2]  554 	addw x,in.w 
      009426 5C               [ 1]  555 	ld a,(x)
      009427 20               [ 1]  556 	incw x
      009428 F4 5C 00 01      [ 1]  557 	inc in   
      009429 81               [ 4]  558 9$: ret 
                                    559 
                                    560 ;-------------------------
                                    561 ;  skip .asciz in BASIC line 
                                    562 ;  name 
                                    563 ;  input:
                                    564 ;     x		* string 
                                    565 ;  output:
                                    566 ;     none 
                                    567 ;-------------------------
      001814                        568 skip_string:
      009429 4F               [ 1]  569 	ld a,(x)
      00942A 81 03            [ 1]  570 	jreq 1$
      00942B 5C               [ 1]  571 	incw x 
      00942B A6 01            [ 2]  572 	jra skip_string 
      00942D 81               [ 1]  573 1$: incw x 	
      00942E 72 B0 00 04      [ 2]  574 	subw x,basicptr 
      00942E 88 89 90         [ 2]  575 	ldw in.w,x 
      009431 F6               [ 4]  576 	ret 
                                    577 
                                    578 ;---------------------
                                    579 ; extract 16 bits  
                                    580 ; address from BASIC
                                    581 ; code 
                                    582 ; input:
                                    583 ;    X    *address
                                    584 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    585 ;    X    address 
                                    586 ;-------------------- 
      001823                        587 get_addr:
      009432 27               [ 2]  588 	ldw x,(x)
      009433 06 F7 5C 90      [ 1]  589 	inc in 
      009437 5C 20 F6 7F      [ 1]  590 	inc in 
      00943B 85               [ 4]  591 	ret 
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
      00182D                        602 get_int24:
      00943C 84               [ 1]  603 	ld a,(x)
      00943D 81 01            [ 2]  604 	ldw x,(1,x)
                                    605 ; skip 3 bytes 
      00943E 72 5C 00 01      [ 1]  606 	inc in 
      00943E 88 52 02 0F      [ 1]  607 	inc in 
      009442 01 0F 02 90      [ 1]  608 	inc in 
      009446 89               [ 4]  609 	ret 
                                    610 
                                    611 ;-------------------------
                                    612 ; get character from 
                                    613 ; BASIC code 
                                    614 ; input:
                                    615 ;    X   *char 
                                    616 ; output:
                                    617 ;    A    char 
                                    618 ;-------------------------
      00183D                        619 get_char:
      009447 13               [ 1]  620 	ld a,(x)
      009448 01 90 85 27      [ 1]  621 	inc in  
      00944C 31               [ 4]  622     ret 
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
      001843                        634 prt_i16:
      00944D 2B 0E 00 0C      [ 1]  635 	clr acc24 
      00944F CF 00 0D         [ 2]  636 	ldw acc16,x 
      00944F 72 BB            [ 1]  637 	ld a,#16
      009451 00 0E 72         [ 1]  638 	cp a,base
      009454 B9 00            [ 1]  639 	jreq prt_acc24  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009456 0E 03 01 03 02   [ 2]  640 	btjf acc16,#7,prt_acc24
      00945B 20 05 00 0C      [ 1]  641 	cpl acc24 ; sign extend 
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
      00945D                        653 prt_acc24:
      00945D 5A 90            [ 1]  654 	ld a,#255  ; signed conversion  
      00945F 5A 0C 02         [ 4]  655     call itoa  ; conversion entier en  .asciz
      009462 CD 11 4C         [ 4]  656 	call right_align  
      009462 C6               [ 1]  657 	push a 
      009463 00 0E CA         [ 4]  658 	call puts
      009466 00               [ 1]  659 	pop a 
      009467 0F               [ 4]  660     ret	
                                    661 
                                    662 ;---------------------------------------
                                    663 ;  print value at xstack top 
                                    664 ;---------------------------------------
      001868                        665 print_top: 
      001868                        666 	_xpop 
      009468 27 14            [ 1]    1     ld a,(y)
      00946A 72               [ 1]    2     ldw x,y 
      00946B FB 01            [ 2]    3     ldw x,(1,x)
      00946D 72 F9 01 90      [ 2]    4     addw y,#CELL_SIZE 
      009471 F6 F7 89         [ 1]  667 	ld acc24,a 
      009474 CE 00 0E         [ 2]  668 	ldw acc16,x 
      009477 5A CF 00         [ 4]  669 	call prt_acc24 
      00947A 0E 85            [ 1]  670 	ld a,#SPACE
      00947C 20 E4 FF         [ 4]  671 	call putc 
      00947E 81               [ 4]  672 	ret 
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
      001880                        688 itoa::
      001880                        689 	_vars VSIZE
      00947E 5B 02            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009480 84 81            [ 1]  690 	clr (LEN,sp) ; string length  
      009482 0F 01            [ 1]  691 	clr (SIGN,sp)    ; sign
      009482 89               [ 1]  692 	tnz A
      009483 88 AE            [ 1]  693 	jreq 1$ ; unsigned conversion  
      009485 00 36 A6         [ 1]  694 	ld a,base 
      009488 4E 7F            [ 1]  695 	cp a,#10
      00948A 5C 4A            [ 1]  696 	jrne 1$
                                    697 	; base 10 string display with negative sign if bit 23==1
      00948C 26 FB 84 85 81   [ 2]  698 	btjf acc24,#7,1$
      009491 0A 0A            [ 1]  699 	cpl (SIGN,sp)
      009493 54 69 6E         [ 4]  700 	call neg_acc24
      00189A                        701 1$:
                                    702 ; initialize string pointer 
      009496 79 20 42         [ 2]  703 	ldw x,#tib 
      009499 41 53 49         [ 2]  704 	addw x,#TIB_SIZE
      00949C 43               [ 2]  705 	decw x 
      00949D 20               [ 1]  706 	clr (x)
      0018A2                        707 itoa_loop:
      00949E 66 6F 72         [ 1]  708     ld a,base
      0094A1 20 53 54         [ 4]  709     call divu24_8 ; acc24/A 
      0094A4 4D 38            [ 1]  710     add a,#'0  ; remainder of division
      0094A6 0A 43            [ 1]  711     cp a,#'9+1
      0094A8 6F 70            [ 1]  712     jrmi 2$
      0094AA 79 72            [ 1]  713     add a,#7 
      0018B0                        714 2$:	
      0094AC 69               [ 2]  715 	decw x
      0094AD 67               [ 1]  716     ld (x),a
      0094AE 68 74            [ 1]  717 	inc (LEN,sp)
                                    718 	; if acc24==0 conversion done
      0094B0 2C 20 4A         [ 1]  719 	ld a,acc24
      0094B3 61 63 71         [ 1]  720 	or a,acc16
      0094B6 75 65 73         [ 1]  721 	or a,acc8
      0094B9 20 44            [ 1]  722     jrne itoa_loop
                                    723 	;conversion done, next add '$' or '-' as required
      0094BB 65 73 63         [ 1]  724 	ld a,base 
      0094BE 68 65            [ 1]  725 	cp a,#16
      0094C0 6E 65            [ 1]  726 	jreq 8$
      0094C2 73 20            [ 1]  727 	ld a,(SIGN,sp)
      0094C4 32 30            [ 1]  728     jreq 10$
      0094C6 31 39            [ 1]  729     ld a,#'-
      0094C8 2C 32            [ 2]  730 	jra 9$ 
      0018CE                        731 8$:	
      0094CA 30 32            [ 1]  732 	ld a,#'$ 
      0094CC 32               [ 2]  733 9$: decw x
      0094CD 0A               [ 1]  734     ld (x),a
      0094CE 76 65            [ 1]  735 	inc (LEN,sp)
      0018D4                        736 10$:
      0094D0 72 73            [ 1]  737 	ld a,(LEN,sp)
      0018D6                        738 	_drop VSIZE
      0094D2 69 6F            [ 2]    1     addw sp,#VSIZE 
      0094D4 6E               [ 4]  739 	ret
                                    740 
                                    741 ;------------------------------------
                                    742 ; convert alpha to uppercase
                                    743 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    744 ;    a  character to convert
                                    745 ; output:
                                    746 ;    a  uppercase character
                                    747 ;------------------------------------
      0018D9                        748 to_upper::
      0094D5 20 00            [ 1]  749 	cp a,#'a
      0094D7 2A 01            [ 1]  750 	jrpl 1$
      0094D7 AE               [ 4]  751 0$:	ret
      0094D8 94 91            [ 1]  752 1$: cp a,#'z	
      0094DA CD 89            [ 1]  753 	jrugt 0$
      0094DC DC A6            [ 1]  754 	sub a,#32
      0094DE 02               [ 4]  755 	ret
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
      0018E5                        771 atoi24::
      0018E5                        772 	_vars VSIZE
      0094DF C7 00            [ 2]    1     sub sp,#VSIZE 
      0094E1 0F 5F            [ 2]  773 	ldw (XTEMP,sp),x 
                                    774 ; conversion made on xstack 
      0094E3 CF               [ 1]  775 	clr a 
      0094E4 00               [ 1]  776 	clrw x 
      0018EB                        777 	_xpush 
      0094E5 0D 72 5F 00      [ 2]    1     subw y,#CELL_SIZE
      0094E9 24 35            [ 1]    2     ld (y),a 
      0094EB 0A 00 0B         [ 2]    3     ldw (1,y),x 
      0094EE CD 98            [ 1]  778 	clr (SIGN,sp)
      0094F0 DA A6            [ 1]  779 	ld a,#10
      0094F2 2E CD            [ 1]  780 	ld (BASE,sp),a ; default base decimal
      0094F4 89 7F            [ 2]  781 	ldw x,(XTEMP,sp)
      0094F6 A6               [ 1]  782 	ld a,(x)
      0094F7 00 C7            [ 1]  783 	jreq 9$  ; completed if 0
      0094F9 00 0F            [ 1]  784 	cp a,#'-
      0094FB 5F CF            [ 1]  785 	jrne 1$
      0094FD 00 0D            [ 1]  786 	cpl (SIGN,sp)
      0094FF CD 98            [ 2]  787 	jra 2$
      009501 DA A6            [ 1]  788 1$: cp a,#'$
      009503 0D CD            [ 1]  789 	jrne 3$
      009505 89 7F            [ 1]  790 	ld a,#16
      009507 81 02            [ 1]  791 	ld (BASE,sp),a
      009508 5C               [ 1]  792 2$:	incw x
      009508 90 AE            [ 2]  793 	ldw (XTEMP,sp),x 
      00950A 17               [ 1]  794 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      001913                        795 3$:	; char to digit 
      00950B 73 72            [ 1]  796 	cp a,#'a
      00950D 5F 00            [ 1]  797 	jrmi 4$
      00950F 23 72            [ 1]  798 	sub a,#32
      009511 5F 00            [ 1]  799 4$:	cp a,#'0
      009513 20 35            [ 1]  800 	jrmi 9$
      009515 04 00            [ 1]  801 	sub a,#'0
      009517 24 35            [ 1]  802 	cp a,#10
      009519 0A 00            [ 1]  803 	jrmi 5$
      00951B 0B AE            [ 1]  804 	sub a,#7
      00951D 00 00            [ 1]  805 	cp a,(BASE,sp)
      00951F CF 00            [ 1]  806 	jrpl 9$
      009521 05 CF            [ 1]  807 5$:	ld (TEMP,sp),a
      009523 00 01            [ 1]  808 	ld a,(BASE,sp)
      009525 72 5F 00         [ 4]  809 	call mulu24_8
      001930                        810 	_xpush 
      009528 03 81 00 03      [ 2]    1     subw y,#CELL_SIZE
      00952A 90 F7            [ 1]    2     ld (y),a 
      00952A 89 72 5F         [ 2]    3     ldw (1,y),x 
      00952D 00               [ 1]  811 	clrw x 
      00952E 03 72            [ 1]  812 	ld a,(TEMP,sp)
      009530 5F               [ 1]  813 	rlwa x 
      00193D                        814 	_xpush 
      009531 00 02 AE 00      [ 2]    1     subw y,#CELL_SIZE
      009535 90 CF            [ 1]    2     ld (y),a 
      009537 00 1C CF         [ 2]    3     ldw (1,y),x 
      00953A 00 1E CF         [ 4]  815 	call add24 
      00953D 00 31            [ 2]  816 	ldw x,(XTEMP,sp)
      00953F CF 00            [ 2]  817 	jra 2$
      009541 33 CD            [ 1]  818 9$:	tnz (SIGN,sp)
      009543 94 82            [ 1]  819     jreq atoi_exit
      009545 72 5F 00         [ 4]  820     call neg24
      001954                        821 atoi_exit:
      001954                        822 	_xpop 
      009548 35 85            [ 1]    1     ld a,(y)
      00954A 81               [ 1]    2     ldw x,y 
      00954B EE 01            [ 2]    3     ldw x,(1,x)
      00954B 00 00 95 71      [ 2]    4     addw y,#CELL_SIZE 
      00954F 95 7E 95         [ 1]  823 	ld acc24,a 
      009552 8C 95 A5         [ 2]  824 	ldw acc16,x  
      001963                        825 	_drop VSIZE
      009555 95 B4            [ 2]    1     addw sp,#VSIZE 
      009557 95               [ 4]  826 	ret
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
                                    837 ;	X 		dictionary entry point, name field  
                                    838 ;   y		.asciz name to search 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    839 ; output:
                                    840 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    841 ;  X		routine address|TK_OP 
                                    842 ;---------------------------------
                           000001   843 	NLEN=1 ; cmd length 
                           000002   844 	XSAVE=2
                           000004   845 	YSAVE=4
                           000005   846 	VSIZE=5 
      001966                        847 search_dict::
      001966                        848 	_vars VSIZE 
      009558 CA 95            [ 2]    1     sub sp,#VSIZE 
      00955A E0 95            [ 2]  849 	ldw (YSAVE,sp),y 
      00196A                        850 search_next:
      00955C FA 96            [ 2]  851 	ldw (XSAVE,sp),x 
                                    852 ; get name length in dictionary	
      00955E 0B               [ 1]  853 	ld a,(x)
      00955F 96 1C            [ 1]  854 	and a,#0xf 
      009561 96 28            [ 1]  855 	ld (NLEN,sp),a  
      009563 96 5B            [ 2]  856 	ldw y,(YSAVE,sp) ; name pointer 
      009565 96               [ 1]  857 	incw x 
      001974                        858 cp_loop:
      009566 6B 96            [ 1]  859 	ld a,(y)
      009568 7F 96            [ 1]  860 	jreq str_match 
      00956A 92 96            [ 1]  861 	tnz (NLEN,sp)
      00956C 9F 96            [ 1]  862 	jreq no_match  
      00956E A9               [ 1]  863 	cp a,(x)
      00956F 96 C5            [ 1]  864 	jrne no_match 
      009571 4D 65            [ 1]  865 	incw y 
      009573 6D               [ 1]  866 	incw x
      009574 6F 72            [ 1]  867 	dec (NLEN,sp)
      009576 79 20            [ 2]  868 	jra cp_loop 
      001986                        869 no_match:
      009578 66 75            [ 2]  870 	ldw x,(XSAVE,sp) 
      00957A 6C 6C 0A         [ 2]  871 	subw x,#2 ; move X to link field
      00957D 00 73            [ 1]  872 	push #TK_NONE 
      00957F 79               [ 2]  873 	ldw x,(x) ; next word link 
      009580 6E               [ 1]  874 	pop a ; TK_NONE 
      009581 74 61            [ 1]  875 	jreq search_exit  ; not found  
                                    876 ;try next 
      009583 78 20            [ 2]  877 	jra search_next
      001993                        878 str_match:
      009585 65 72            [ 2]  879 	ldw x,(XSAVE,sp)
      009587 72               [ 1]  880 	ld a,(X)
      009588 6F 72            [ 1]  881 	ld (NLEN,sp),a ; needed to test keyword type  
      00958A 0A 00            [ 1]  882 	and a,#NLEN_MASK 
                                    883 ; move x to procedure address field 	
      00958C 6D               [ 1]  884 	inc a 
      00958D 61 74 68         [ 1]  885 	ld acc8,a 
      009590 20 6F 70 65      [ 1]  886 	clr acc16 
      009594 72 61 74 69      [ 2]  887 	addw x,acc16 
      009598 6F               [ 2]  888 	ldw x,(x) ; routine address  
                                    889 ;determine keyword type bits 7:4 
      009599 6E 20            [ 1]  890 	ld a,(NLEN,sp)
      00959B 6F 76            [ 1]  891 	and a,#KW_TYPE_MASK 
      00959D 65               [ 1]  892 	swap a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00959E 72 66            [ 1]  893 	add a,#128
      0019AE                        894 search_exit: 
      0019AE                        895 	_drop VSIZE 
      0095A0 6C 6F            [ 2]    1     addw sp,#VSIZE 
      0095A2 77               [ 4]  896 	ret 
                                    897 
                                    898 ;---------------------
                                    899 ; check if next token
                                    900 ;  is of expected type 
                                    901 ; input:
                                    902 ;   A 		 expected token attribute
                                    903 ;  ouput:
                                    904 ;   none     if fail call syntax_error 
                                    905 ;--------------------
      0019B1                        906 expect:
      0095A3 0A               [ 1]  907 	push a 
      0095A4 00 64 69         [ 4]  908 	call next_token 
      0095A7 76 69            [ 1]  909 	cp a,(1,sp)
      0095A9 73 69            [ 1]  910 	jreq 1$
      0095AB 6F 6E 20         [ 2]  911 	jp syntax_error
      0095AE 62               [ 1]  912 1$: pop a 
      0095AF 79               [ 4]  913 	ret 
                                    914 
                                    915 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    916 ; parse arguments list 
                                    917 ; between ()
                                    918 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019BE                        919 func_args:
      0095B0 20 30            [ 1]  920 	ld a,#TK_LPAREN 
      0095B2 0A 00 69         [ 4]  921 	call expect 
                                    922 ; expected to continue in arg_list 
                                    923 ; caller must check for TK_RPAREN 
                                    924 
                                    925 ;-------------------------------
                                    926 ; parse embedded BASIC routines 
                                    927 ; arguments list.
                                    928 ; arg_list::=  expr[','expr]*
                                    929 ; all arguments are of int24_t type
                                    930 ; and pushed on stack 
                                    931 ; input:
                                    932 ;   none
                                    933 ; output:
                                    934 ;   xstack{n}   arguments pushed on xstack
                                    935 ;   A 	number of arguments pushed on xstack  
                                    936 ;--------------------------------
      0019C3                        937 arg_list:
      0095B5 6E 76            [ 1]  938 	push #0
      0095B7 61 6C 69         [ 4]  939 1$:	call condition 
      0095BA 64               [ 1]  940 	tnz a 
      0095BB 20 6C            [ 1]  941 	jreq 7$  
      0095BD 69 6E            [ 1]  942 	inc (1,sp)
      0095BF 65 20 6E         [ 4]  943 	call next_token 
      0095C2 75 6D            [ 1]  944 	cp a,#TK_COMMA 
      0095C4 62 65            [ 1]  945 	jreq 1$ 
      0095C6 72 2E            [ 1]  946 	cp a,#TK_RPAREN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0095C8 0A 00            [ 1]  947 	jreq 7$
      0019D8                        948 	_unget_token 
      0095CA 72 75 6E 20 74   [ 1]    1      mov in,in.saved  
      0095CF 69               [ 1]  949 7$:	pop a  
      0095D0 6D               [ 4]  950 	ret 
                                    951 
                                    952 ;--------------------------------
                                    953 ;   BASIC commnands 
                                    954 ;--------------------------------
                                    955 
                                    956 ;--------------------------------
                                    957 ;  arithmetic and relational 
                                    958 ;  routines
                                    959 ;  operators precedence
                                    960 ;  highest to lowest
                                    961 ;  operators on same row have 
                                    962 ;  same precedence and are executed
                                    963 ;  from left to right.
                                    964 ;	'*','/','%'
                                    965 ;   '-','+'
                                    966 ;   '=','>','<','>=','<=','<>','><'
                                    967 ;   '<>' and '><' are equivalent for not equal.
                                    968 ;--------------------------------
                                    969 
                                    970 ;---------------------
                                    971 ; return array element
                                    972 ; address from @(expr)
                                    973 ; input:
                                    974 ;   A 		TK_ARRAY
                                    975 ; output:
                                    976 ;	X 		element address 
                                    977 ;----------------------
      0019DF                        978 get_array_element:
      0095D1 65 20 6F         [ 4]  979 	call func_args 
      0095D4 6E 6C            [ 1]  980 	cp a,#1
      0095D6 79 20            [ 1]  981 	jreq 1$
      0095D8 75 73 61         [ 2]  982 	jp syntax_error
      0019E9                        983 1$: _xpop 
      0095DB 67 65            [ 1]    1     ld a,(y)
      0095DD 2E               [ 1]    2     ldw x,y 
      0095DE 0A 00            [ 2]    3     ldw x,(1,x)
      0095E0 63 6F 6D 6D      [ 2]    4     addw y,#CELL_SIZE 
                                    984     ; ignore A, index < 65536 in any case 
                                    985 	; check for bounds 
      0095E4 61 6E 64         [ 2]  986 	cpw x,array_size 
      0095E7 20 6C            [ 2]  987 	jrule 3$
                                    988 ; bounds {1..array_size}	
      0095E9 69 6E            [ 1]  989 2$: ld a,#ERR_BAD_VALUE 
      0095EB 65 20 6F         [ 2]  990 	jp tb_error 
      0095EE 6E               [ 2]  991 3$: tnzw  x
      0095EF 6C 79            [ 1]  992 	jreq 2$ 
      0095F1 20 75            [ 1]  993 	ld a,#CELL_SIZE  
      0095F3 73               [ 4]  994 	mul x,a 
      0095F4 61 67 65         [ 2]  995 	ldw acc16,x   
      0095F7 2E 0A 00         [ 2]  996 	ldw x,#tib ; array is below tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0095FA 64 75 70 6C      [ 2]  997 	subw x,acc16 
      0095FE 69               [ 4]  998 	ret 
                                    999 
                                   1000 
                                   1001 ;***********************************
                                   1002 ;   expression parse,execute 
                                   1003 ;***********************************
                                   1004 ;-----------------------------------
                                   1005 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1006 ;			 integer | function |
                                   1007 ;			 '('relation')' 
                                   1008 ; output:
                                   1009 ;   A       token attribute 
                                   1010 ;   xstack  value  
                                   1011 ; ---------------------------------
                           000001  1012 	NEG=1
                           000001  1013 	VSIZE=1
      001A0D                       1014 factor:
      001A0D                       1015 	_vars VSIZE 
      0095FF 63 61            [ 2]    1     sub sp,#VSIZE 
      009601 74 65            [ 1] 1016 	clr (NEG,sp)
      009603 20 6E 61         [ 4] 1017 	call next_token
      009606 6D               [ 1] 1018 	tnz a 
      009607 65 2E            [ 1] 1019 	jrne 1$ 
      009609 0A 00 46         [ 2] 1020 	jp 22$ 
      00960C 69 6C            [ 1] 1021 1$:	cp a,#TK_PLUS 
      00960E 65 20            [ 1] 1022 	jreq 2$
      009610 6E 6F            [ 1] 1023 	cp a,#TK_MINUS 
      009612 74 20            [ 1] 1024 	jrne 4$ 
      009614 66 6F            [ 1] 1025 	cpl (NEG,sp)
      001A24                       1026 2$:	
      009616 75 6E 64         [ 4] 1027 	call next_token
      001A27                       1028 4$:
      009619 2E               [ 1] 1029 	tnz a 
      00961A 0A 00            [ 1] 1030 	jrne 41$ 
      00961C 62 61 64         [ 2] 1031 	jp syntax_error  
      001A2D                       1032 41$:	
      00961F 20 76            [ 1] 1033 	cp a,#TK_IFUNC 
      009621 61 6C            [ 1] 1034 	jrne 5$ 
      001A31                       1035 	_get_code_addr 
      009623 75               [ 2]    1         ldw x,(x)
      009624 65 2E 0A 00      [ 1]    2         inc in 
      009628 46 69 6C 65      [ 1]    3         inc in 
      00962C 20               [ 4] 1036 	call (x); result in A:X  
      00962D 69 6E            [ 2] 1037 	jra 18$ 
      001A3D                       1038 5$:
      00962F 20 65            [ 1] 1039 	cp a,#TK_INTGR
      009631 78 74            [ 1] 1040 	jrne 6$
      009633 65 6E 64         [ 4] 1041 	call get_int24 ; A:X
      009636 65 64            [ 2] 1042 	jra 18$
      001A46                       1043 6$:
      009638 20 6D            [ 1] 1044 	cp a,#TK_ARRAY
      00963A 65 6D            [ 1] 1045 	jrne 7$
      00963C 6F 72 79         [ 4] 1046 	call get_array_element
      00963F 2C 20            [ 2] 1047     jra 71$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      001A4F                       1048 7$:
      009641 63 61            [ 1] 1049 	cp a,#TK_VAR 
      009643 6E 27            [ 1] 1050 	jrne 8$
      009645 74 20 62         [ 4] 1051 	call get_addr 
      001A56                       1052 71$: ; put value in A:X
      009648 65               [ 1] 1053 	ld a,(x)
      009649 20 72            [ 2] 1054 	ldw x,(1,x)
      00964B 75 6E            [ 2] 1055 	jra 18$
      001A5B                       1056 8$:
      00964D 20 66            [ 1] 1057 	cp a,#TK_LABEL 
      00964F 72 6F            [ 1] 1058 	jrne 9$
      009651 6D 20            [ 2] 1059 	pushw y  
      009653 74               [ 2] 1060 	pushw x 
      009654 68 65 72         [ 4] 1061 	call skip_string
      009657 65               [ 2] 1062 	popw x  
      009658 2E 0A 00         [ 4] 1063 	call strlen 
      00965B 4E 6F            [ 1] 1064 	add a,#REC_XTRA_BYTES
      00965D 20 64 61         [ 4] 1065 	call search_name
      009660 74               [ 2] 1066 	tnzw x 
      009661 61 20            [ 1] 1067 	jrne 82$ 
      009663 66 6F            [ 2] 1068 	popw y 
      009665 75 6E            [ 2] 1069 	jra 16$
      001A75                       1070 82$:
      009667 64 2E            [ 2] 1071 	popw y   
      009669 0A 00 4E         [ 4] 1072 	call get_value ; in A:X 
      00966C 6F 20            [ 2] 1073 	jra 18$
      001A7C                       1074 9$: 
      00966E 70 72            [ 1] 1075 	cp a,#TK_CFUNC 
      009670 6F 67            [ 1] 1076 	jrne 12$
      001A80                       1077 	_get_code_addr 
      009672 72               [ 2]    1         ldw x,(x)
      009673 61 6D 20 69      [ 1]    2         inc in 
      009677 6E 20 52 41      [ 1]    3         inc in 
      00967B 4D               [ 4] 1078 	call(x)
      00967C 21               [ 1] 1079 	clrw x 
      00967D 0A               [ 1] 1080 	rlwa x  ; char>int24 in A:X 
      00967E 00 46            [ 2] 1081 	jra 18$ 	 
      001A8E                       1082 12$:			
      009680 69 6C            [ 1] 1083 	cp a,#TK_LPAREN
      009682 65 20            [ 1] 1084 	jrne 16$
      009684 73 79 73         [ 4] 1085 	call expression
      009687 74 65            [ 1] 1086 	ld a,#TK_RPAREN 
      009689 6D 20 66         [ 4] 1087 	call expect
      001A9A                       1088 	_xpop 
      00968C 75 6C            [ 1]    1     ld a,(y)
      00968E 6C               [ 1]    2     ldw x,y 
      00968F 2E 0A            [ 2]    3     ldw x,(1,x)
      009691 00 42 75 66      [ 2]    4     addw y,#CELL_SIZE 
      009695 66 65            [ 2] 1089 	jra 18$	
      001AA5                       1090 16$:
      001AA5                       1091 	_unget_token 
      009697 72 20 66 75 6C   [ 1]    1      mov in,in.saved  
      00969C 6C               [ 1] 1092 	clr a 
      00969D 0A 00            [ 2] 1093 	jra 22$ 
      001AAD                       1094 18$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00969F 6F 76            [ 1] 1095 	tnz (NEG,sp)
      0096A1 65 72            [ 1] 1096 	jreq 20$
      0096A3 66 6C 6F         [ 4] 1097 	call neg_ax   
      001AB4                       1098 20$:
      001AB4                       1099 	_xpush 
      0096A6 77 0A 00 63      [ 2]    1     subw y,#CELL_SIZE
      0096AA 6F 6E            [ 1]    2     ld (y),a 
      0096AC 73 74 61         [ 2]    3     ldw (1,y),x 
      0096AF 6E 74            [ 1] 1100 	ld a,#TK_INTGR
      001ABF                       1101 22$:
      001ABF                       1102 	_drop VSIZE
      0096B1 20 63            [ 2]    1     addw sp,#VSIZE 
      0096B3 61               [ 4] 1103 	ret
                                   1104 
                                   1105 
                                   1106 ;-----------------------------------
                                   1107 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1108 ; output:
                                   1109 ;   A    	token attribute 
                                   1110 ;	xstack		value 
                                   1111 ;-----------------------------------
                           000001  1112 	MULOP=1
                           000001  1113 	VSIZE=1
      001AC2                       1114 term:
      001AC2                       1115 	_vars VSIZE
      0096B4 6E 27            [ 2]    1     sub sp,#VSIZE 
                                   1116 ; first factor 	
      0096B6 74 20 62         [ 4] 1117 	call factor
      0096B9 65               [ 1] 1118 	tnz a 
      0096BA 20 6D            [ 1] 1119 	jreq term_exit  
      001ACA                       1120 term01:	 ; check for  operator '*'|'/'|'%' 
      0096BC 6F 64 69         [ 4] 1121 	call next_token
      0096BF 66 69            [ 1] 1122 	ld (MULOP,sp),a
      0096C1 65 64            [ 1] 1123 	and a,#TK_GRP_MASK
      0096C3 0A 00            [ 1] 1124 	cp a,#TK_GRP_MULT
      0096C5 6E 6F            [ 1] 1125 	jreq 1$
      0096C7 20 70            [ 1] 1126 	ld a,#TK_INTGR
      001AD7                       1127 	_unget_token 
      0096C9 72 6F 67 72 61   [ 1]    1      mov in,in.saved  
      0096CE 6D 20            [ 2] 1128 	jra term_exit 
      001ADE                       1129 1$:	; got *|/|%
                                   1130 ;second factor
      0096D0 61 74 20         [ 4] 1131 	call factor
      0096D3 74               [ 1] 1132 	tnz a 
      0096D4 68 69            [ 1] 1133 	jrne 2$ 
      0096D6 73 20 61         [ 2] 1134 	jp syntax_error 
      001AE7                       1135 2$: ; select operation 	
      0096D9 64 64            [ 1] 1136 	ld a,(MULOP,sp) 
      0096DB 72 65            [ 1] 1137 	cp a,#TK_MULT 
      0096DD 73 73            [ 1] 1138 	jrne 3$
                                   1139 ; '*' operator
      0096DF 0A 00 0A         [ 4] 1140 	call mul24 
      0096E2 72 75            [ 2] 1141 	jra term01
      0096E4 6E 20            [ 1] 1142 3$: cp a,#TK_DIV 
      0096E6 74 69            [ 1] 1143 	jrne 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                   1144 ; '/' operator	
      0096E8 6D 65 20         [ 4] 1145 	call div24 
      0096EB 65 72            [ 2] 1146 	jra term01 
      001AFB                       1147 4$: ; '%' operator
      0096ED 72 6F 72         [ 4] 1148 	call mod24
      0096F0 2C 20            [ 2] 1149 	jra term01 
      001B00                       1150 9$: 
      0096F2 00 0A            [ 1] 1151 	ld a,#TK_INTGR
      001B02                       1152 term_exit:
      001B02                       1153 	_drop VSIZE 
      0096F4 63 6F            [ 2]    1     addw sp,#VSIZE 
      0096F6 6D               [ 4] 1154 	ret 
                                   1155 
                                   1156 ;-------------------------------
                                   1157 ;  expr ::= term [['+'|'-'] term]*
                                   1158 ;  result range {-32768..32767}
                                   1159 ;  output:
                                   1160 ;   A    token attribute 
                                   1161 ;   xstack	 result    
                                   1162 ;-------------------------------
                           000001  1163 	OP=1 
                           000001  1164 	VSIZE=1 
      001B05                       1165 expression:
      001B05                       1166 	_vars VSIZE 
      0096F7 70 69            [ 2]    1     sub sp,#VSIZE 
                                   1167 ; first term 	
      0096F9 6C 65 20         [ 4] 1168 	call term
      0096FC 65               [ 1] 1169 	tnz a 
      0096FD 72 72            [ 1] 1170 	jreq 9$
      001B0D                       1171 1$:	; operator '+'|'-'
      0096FF 6F 72 2C         [ 4] 1172 	call next_token
      009702 20 00            [ 1] 1173 	ld (OP,sp),a 
      009704 6C 61            [ 1] 1174 	and a,#TK_GRP_MASK
      009706 73 74            [ 1] 1175 	cp a,#TK_GRP_ADD 
      009708 20 74            [ 1] 1176 	jreq 2$ 
      001B18                       1177 	_unget_token 
      00970A 6F 6B 65 6E 20   [ 1]    1      mov in,in.saved  
      00970F 69 64            [ 1] 1178 	ld a,#TK_INTGR
      009711 3A 20            [ 2] 1179 	jra 9$ 
      001B21                       1180 2$: ; second term 
      009713 00 1A C2         [ 4] 1181 	call term
      009714 4D               [ 1] 1182 	tnz a 
      009714 A6 02            [ 1] 1183 	jrne 3$
      009716 CC 16 94         [ 2] 1184 	jp syntax_error
      001B2A                       1185 3$:
      009716 72 0A            [ 1] 1186 	ld a,(OP,sp)
      009718 00 23            [ 1] 1187 	cp a,#TK_PLUS 
      00971A 4C 88            [ 1] 1188 	jrne 4$
                                   1189 ; '+' operator	
      00971C AE 96 E1         [ 4] 1190 	call add24
      00971F CD 89            [ 2] 1191 	jra 1$ 
      001B35                       1192 4$:	; '-' operator 
      009721 DC 84 AE         [ 4] 1193 	call sub24
      009724 95 4B            [ 2] 1194 	jra 1$
      001B3A                       1195 9$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      001B3A                       1196 	_drop VSIZE 
      009726 72 5F            [ 2]    1     addw sp,#VSIZE 
      009728 00               [ 4] 1197 	ret 
                                   1198 
                                   1199 ;---------------------------------------------
                                   1200 ; rel ::= expr rel_op expr
                                   1201 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1202 ;  relation return  integer , zero is false 
                                   1203 ;  output:
                                   1204 ;	 xstack		value  
                                   1205 ;---------------------------------------------
                           000001  1206 	RELOP=1
                           000001  1207 	VSIZE=1 
      001B3D                       1208 relation: 
      001B3D                       1209 	_vars VSIZE
      009729 0E 48            [ 2]    1     sub sp,#VSIZE 
      00972B 72 59 00         [ 4] 1210 	call expression
      00972E 0E               [ 1] 1211 	tnz a 
      00972F C7 00            [ 1] 1212 	jreq 9$ 
                                   1213 ; expect rel_op or leave 
      009731 0F 72 BB         [ 4] 1214 	call next_token 
      009734 00 0E            [ 1] 1215 	ld (RELOP,sp),a 
      009736 FE CD            [ 1] 1216 	and a,#TK_GRP_MASK
      009738 89 DC            [ 1] 1217 	cp a,#TK_GRP_RELOP 
      00973A CE 00            [ 1] 1218 	jreq 2$
      00973C 05 C6            [ 1] 1219 	ld a,#TK_INTGR 
      001B52                       1220 	_unget_token 
      00973E 00 03 90 5F 90   [ 1]    1      mov in,in.saved  
      009743 02 CD            [ 2] 1221 	jra 9$ 
      001B59                       1222 2$:	; expect another expression
      009745 86 C5 CE         [ 4] 1223 	call expression
      009748 00               [ 1] 1224 	tnz a 
      009749 05 C6            [ 1] 1225 	jrne 3$
      00974B 00 02 CD         [ 2] 1226 	jp syntax_error 
      001B62                       1227 3$: 
      00974E A0 31 AE         [ 4] 1228 	call cp24 
      001B65                       1229 	_xpop  
      009751 97 04            [ 1]    1     ld a,(y)
      009753 CD               [ 1]    2     ldw x,y 
      009754 89 DC            [ 2]    3     ldw x,(1,x)
      009756 C6 00 04 5F      [ 2]    4     addw y,#CELL_SIZE 
      00975A 97               [ 1] 1230 	tnz a 
      00975B 72 BB            [ 1] 1231 	jrmi 4$
      00975D 00 05            [ 1] 1232 	jrne 5$
      00975F F6 5F 97 CD      [ 1] 1233 	mov acc8,#2 ; i1==i2
      009763 98 C3            [ 2] 1234 	jra 6$ 
      001B79                       1235 4$: ; i1<i2
      009765 20 35 00 0E      [ 1] 1236 	mov acc8,#4 
      009767 20 04            [ 2] 1237 	jra 6$
      001B7F                       1238 5$: ; i1>i2
      009767 88 AE 96 F3      [ 1] 1239 	mov acc8,#1  
      001B83                       1240 6$: ; 0=false, -1=true 
      00976B CD               [ 1] 1241 	clrw x 
      00976C 89 DC 84         [ 1] 1242 	ld a, acc8  
      00976F AE 95            [ 1] 1243 	and a,(RELOP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009771 4B 72            [ 1] 1244 	jreq 7$
      009773 5F               [ 2] 1245 	cplw x 
      009774 00 0E            [ 1] 1246 	ld a,#255 
      001B8E                       1247 7$:	_xpush 
      009776 48 72 59 00      [ 2]    1     subw y,#CELL_SIZE
      00977A 0E C7            [ 1]    2     ld (y),a 
      00977C 00 0F 72         [ 2]    3     ldw (1,y),x 
      00977F BB 00            [ 1] 1248 	ld a,#TK_INTGR
      001B99                       1249 9$: 
      001B99                       1250 	_drop VSIZE
      009781 0E FE            [ 2]    1     addw sp,#VSIZE 
      009783 CD               [ 4] 1251 	ret 
                                   1252 
                                   1253 ;-------------------------------------------
                                   1254 ;  AND factor:  [NOT] relation | (condition)
                                   1255 ;  output:
                                   1256 ;     A      TK_INTGR|0
                                   1257 ;-------------------------------------------
                           000001  1258 	NOT_OP=1
      001B9C                       1259 and_factor:
      009784 89 DC            [ 1] 1260 	push #0 
      009786 AE 16 68         [ 4] 1261 0$:	call next_token  
      009789 CD               [ 1] 1262 	tnz a 
      00978A 89 DC            [ 1] 1263 	jreq 8$ 
      00978C A6 0D            [ 1] 1264 	cp a,#TK_NOT 
      00978E CD 89            [ 1] 1265 	jrne 1$ 
      009790 7F CE            [ 1] 1266 	cpl (NOT_OP,sp)
      009792 00 01            [ 2] 1267 	jra 0$ 
      001BAC                       1268 1$:	
      009794 CD 8A            [ 1] 1269 	cp a,#TK_LPAREN 
      009796 49 A6            [ 1] 1270 	jrne 2$
      009798 5E CD 89         [ 4] 1271 	call condition
      00979B 7F AE            [ 1] 1272 	ld a,#TK_RPAREN 
      00979D 17 FF 94         [ 4] 1273 	call expect
      0097A0 20 08            [ 2] 1274 	jra 3$
      001BBA                       1275 2$: _unget_token 
      0097A0 CD 95 08 00 01   [ 1]    1      mov in,in.saved  
      0097A3 CD 1B 3D         [ 4] 1276 	call relation
      001BC2                       1277 3$:
      0097A3 A6 0D            [ 1] 1278 	tnz (NOT_OP,sp)
      0097A5 CD 89            [ 1] 1279 	jreq 8$ 
      0097A7 7F A6 3E         [ 4] 1280 	call cpl24
      001BC9                       1281 8$:
      001BC9                       1282 	_drop 1  
      0097AA CD 89            [ 2]    1     addw sp,#1 
      0097AC 7F               [ 4] 1283     ret 
                                   1284 
                                   1285 
                                   1286 ;--------------------------------------------
                                   1287 ;  AND operator as priority over OR||XOR 
                                   1288 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1289 ;          
                                   1290 ;  output:
                                   1291 ;     A     TK_INTGR|0
                                   1292 ;    xtack   value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   1293 ;--------------------------------------------
      001BCC                       1294 and_cond:
      0097AD CD 8A E1         [ 4] 1295 	call and_factor
      0097B0 72               [ 1] 1296 	tnz a 
      0097B1 5D 00            [ 1] 1297 	jreq 9$  
      0097B3 03 27 ED         [ 4] 1298 1$: call next_token 
      0097B6 CD               [ 1] 1299 	tnz a 
      0097B7 91 22            [ 1] 1300 	jreq 6$ 
      0097B9 72 5D            [ 1] 1301 	cp a,#TK_AND 
      0097BB 00 03            [ 1] 1302 	jreq 3$
      001BDC                       1303 	_unget_token 
      0097BD 27 E4 03 00 01   [ 1]    1      mov in,in.saved  
      0097BF 20 38            [ 2] 1304 	jra 6$ 
      0097BF C6 00 02         [ 4] 1305 3$:	call and_factor  
      0097C2 C1               [ 1] 1306 	tnz a 
      0097C3 00 03            [ 1] 1307 	jrne 4$
      0097C5 2B 20 94         [ 2] 1308 	jp syntax_error 
      0097C7                       1309 4$:	
      001BEC                       1310 	_xpop 
      0097C7 72 01            [ 1]    1     ld a,(y)
      0097C9 00               [ 1]    2     ldw x,y 
      0097CA 23 D7            [ 2]    3     ldw x,(1,x)
      0097CC CE 00 05 72      [ 2]    4     addw y,#CELL_SIZE 
      0097D0 BB 00 01         [ 1] 1311 	ld acc24,a 
      0097D3 C3 00 1E         [ 2] 1312 	ldw acc16,x
      001BFB                       1313 	_xpop 
      0097D6 2B 03            [ 1]    1     ld a,(y)
      0097D8 CD               [ 1]    2     ldw x,y 
      0097D9 A6 0A            [ 2]    3     ldw x,(1,x)
      0097DB CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      0097DF 02 C7 00         [ 1] 1314 	and a,acc24 
      0097E2 03               [ 1] 1315 	rlwa x 
      0097E3 35 03 00         [ 1] 1316 	and a,acc16 
      0097E6 02               [ 1] 1317 	rlwa x 
      0097E7 C4 00 0E         [ 1] 1318 	and a,acc8 
      0097E7 CD               [ 1] 1319 	rlwa x
      001C10                       1320 	_xpush
      0097E8 98 7B A1 00      [ 2]    1     subw y,#CELL_SIZE
      0097EC 27 D9            [ 1]    2     ld (y),a 
      0097EE A1 80 26         [ 2]    3     ldw (1,y),x 
      0097F1 0C FE            [ 2] 1321 	jra 1$  
      0097F3 72 5C            [ 1] 1322 6$: ld a,#TK_INTGR 
      0097F5 00               [ 4] 1323 9$:	ret 	 
                                   1324 
                                   1325 
                                   1326 ;--------------------------------------------
                                   1327 ; condition for IF and UNTIL 
                                   1328 ; operators: OR,XOR 
                                   1329 ; format:  and_cond [ OP and_cond ]* 
                                   1330 ; output:
                                   1331 ;    A        INTGR|0 
                                   1332 ;    xstack   value 
                                   1333 ;--------------------------------------------
                           000001  1334 	ATMP=1
                           000002  1335 	OP=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                           000002  1336 	VSIZE=2 
      001C1E                       1337 condition:
      001C1E                       1338 	_vars VSIZE 
      0097F6 02 72            [ 2]    1     sub sp,#VSIZE 
      0097F8 5C 00 02         [ 4] 1339 	call and_cond
      0097FB FD               [ 1] 1340 	tnz a 
      0097FC 20 E9            [ 1] 1341 	jreq 9$ 
      0097FE CD 17 FB         [ 4] 1342 1$:	call next_token 
      0097FE A1 85            [ 1] 1343 	cp a,#TK_OR 
      009800 26 05            [ 1] 1344 	jreq 2$
      009802 CD 9D            [ 1] 1345 	cp a,#TK_XOR
      009804 70 20            [ 1] 1346 	jreq 2$ 
      001C31                       1347 	_unget_token 
      009806 E0 00 03 00 01   [ 1]    1      mov in,in.saved  
      009807 20 55            [ 2] 1348 	jra 8$ 
      009807 A1 05            [ 1] 1349 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009809 26 05 CD         [ 4] 1350 	call and_cond
      00980C 9D 6B            [ 1] 1351 	cp a,#TK_INTGR 
      00980E 20 D7            [ 1] 1352 	jreq 3$
      009810 CC 16 94         [ 2] 1353 	jp syntax_error 
      001C44                       1354 3$:	 
      001C44                       1355 	_xpop  ; rigth arg 
      009810 A1 03            [ 1]    1     ld a,(y)
      009812 26               [ 1]    2     ldw x,y 
      009813 05 CD            [ 2]    3     ldw x,(1,x)
      009815 98 20 20 CE      [ 2]    4     addw y,#CELL_SIZE 
      009819 C7 00 0C         [ 1] 1356 	ld acc24,a 
      009819 A1 0A 27         [ 2] 1357 	ldw acc16,x 
      001C53                       1358 	_xpop  ; left arg  
      00981C CA CC            [ 1]    1     ld a,(y)
      00981E 97               [ 1]    2     ldw x,y 
      00981F 14 01            [ 2]    3     ldw x,(1,x)
      009820 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009820 52 04            [ 1] 1359 	ld (ATMP,sp),a 
      009822 1F 01            [ 1] 1360 	ld a,(OP,sp)
      009824 0F 03            [ 1] 1361 	cp a,#TK_XOR 
      009826 CD 98            [ 1] 1362 	jreq 5$ 
      001C64                       1363 4$: ; A:X OR acc24   
      009828 94 CE            [ 1] 1364 	ld a,(ATMP,sp)
      00982A 00 05 72         [ 1] 1365 	or a,acc24 
      00982D BB               [ 1] 1366 	rlwa x 
      00982E 00 01 F6         [ 1] 1367 	or a,acc16 
      009831 A1               [ 1] 1368 	rlwa x 
      009832 32 26 43         [ 1] 1369 	or a,acc8 
      009835 72               [ 1] 1370 	rlwa x 
      009836 5C 00            [ 2] 1371 	jra 6$  
      001C74                       1372 5$: ; A:X XOR acc24 
      009838 02 CD            [ 1] 1373 	ld a,(ATMP,sp)
      00983A 9C 9E A1         [ 1] 1374 	xor a,acc24 
      00983D 84               [ 1] 1375 	rlwa x 
      00983E 27 03 CC         [ 1] 1376 	xor a,acc16 
      009841 97               [ 1] 1377 	rlwa x 
      009842 14 00 0E         [ 1] 1378 	xor a,acc8 
      009843 02               [ 1] 1379 	rlwa x 
      001C82                       1380 6$: _xpush
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009843 1E 01 CD 94      [ 2]    1     subw y,#CELL_SIZE
      009847 12 AB            [ 1]    2     ld (y),a 
      009849 05 6B 04         [ 2]    3     ldw (1,y),x 
      00984C CD 9D            [ 2] 1381 	jra 1$ 
      00984E DA 5D            [ 1] 1382 8$:	ld a,#TK_INTGR 
      001C8F                       1383 9$:	_drop VSIZE 
      009850 27 EE            [ 2]    1     addw sp,#VSIZE 
      009852 F6               [ 4] 1384 	ret 
                                   1385 
                                   1386 
                                   1387 ;--------------------------------------------
                                   1388 ; BASIC: HEX 
                                   1389 ; select hexadecimal base for integer print
                                   1390 ;---------------------------------------------
      001C92                       1391 hex_base:
      009853 2A 05 A6 11      [ 1] 1392 	mov base,#16 
      009857 CC               [ 4] 1393 	ret 
                                   1394 
                                   1395 ;--------------------------------------------
                                   1396 ; BASIC: DEC 
                                   1397 ; select decimal base for integer print
                                   1398 ;---------------------------------------------
      001C97                       1399 dec_base:
      009858 97 16 00 0A      [ 1] 1400 	mov base,#10
      00985A 81               [ 4] 1401 	ret 
                                   1402 
                                   1403 ;------------------------
                                   1404 ; BASIC: FREE 
                                   1405 ; return free size in RAM 
                                   1406 ; output:
                                   1407 ;   A:x		size 
                                   1408 ;--------------------------
      001C9C                       1409 free:
      00985A 72               [ 1] 1410 	clr a 
      00985B FB 03 1D         [ 2] 1411 	ldw x,#tib 
      00985E 00 03 CF 00      [ 2] 1412 	subw x,dvar_end 
      009862 1A               [ 4] 1413 	ret 
                                   1414 
                                   1415 ;------------------------------
                                   1416 ; BASIC: SIZE 
                                   1417 ; command that print 
                                   1418 ; program start addres and size 
                                   1419 ;------------------------------
      001CA5                       1420 cmd_size:
      009863 90 F6 93         [ 1] 1421 	push base 
      009866 EE 01 72         [ 2] 1422 	ldw x,#PROG_ADDR 
      009869 A9 00 03         [ 4] 1423 	call puts 
      00986C 72 C7 00         [ 2] 1424 	ldw x,txtbgn     
      00986F 1A 72 5C 00      [ 1] 1425 	mov base,#16 
      009873 1B 72 CF         [ 4] 1426 	call prt_i16
      009876 00 1A 5B         [ 1] 1427 	pop base 
      009879 04 81 A4         [ 2] 1428 	ldw x,#PROG_SIZE 
      00987B CD 09 5C         [ 4] 1429 	call puts 
      00987B C6 00 02         [ 2] 1430 	ldw x,txtend 
      00987E C7 00 04 C0      [ 2] 1431 	subw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009882 00 03 27         [ 4] 1432 	call prt_i16
      009885 0D 1E B5         [ 2] 1433 	ldw x,#STR_BYTES 
      009886 CD 09 5C         [ 4] 1434 	call puts  
      009886 CE               [ 4] 1435 	ret 
                                   1436 
                                   1437 
                                   1438 ;------------------------
                                   1439 ; BASIC: UBOUND  
                                   1440 ; return array variable size 
                                   1441 ; and set 'array_size' variable 
                                   1442 ; output:
                                   1443 ;   A:X 	array_size
                                   1444 ;--------------------------
      001CD2                       1445 ubound:
      009887 00 05 72         [ 4] 1446 	call free 
      00988A BB 00            [ 1] 1447 	ld a,#CELL_SIZE 
      00988C 01               [ 2] 1448 	div x,a 
      00988D F6 5C 72         [ 2] 1449 	ldw array_size,x
      009890 5C               [ 1] 1450 	clr a 
      009891 00               [ 4] 1451 	ret 
                                   1452 
                                   1453 ;-----------------------------
                                   1454 ; BASIC: LET var=expr 
                                   1455 ; variable assignement 
                                   1456 ; output:
                                   1457 ;   A 		TK_NONE 
                                   1458 ;-----------------------------
      001CDD                       1459 let::
      009892 02 81 FB         [ 4] 1460 	call next_token 
      009894 A1 85            [ 1] 1461 	cp a,#TK_VAR 
      009894 F6 27            [ 1] 1462 	jreq let_var
      009896 03 5C            [ 1] 1463 	cp a,#TK_ARRAY 
      009898 20 FA            [ 1] 1464 	jreq  let_array
      00989A 5C 72 B0         [ 2] 1465 	jp syntax_error
      001CEB                       1466 let_array:
      00989D 00 05 CF         [ 4] 1467 	call get_array_element
      0098A0 00 01            [ 2] 1468 	jra let_eval 
      001CF0                       1469 let_var:
      0098A2 81 18 23         [ 4] 1470 	call get_addr
      0098A3                       1471 let_eval:
      0098A3 FE 72 5C         [ 2] 1472 	ldw ptr16,x  ; variable address 
      0098A6 00 02 72         [ 4] 1473 	call next_token 
      0098A9 5C 00            [ 1] 1474 	cp a,#TK_EQUAL
      0098AB 02 81            [ 1] 1475 	jreq 1$
      0098AD CC 16 94         [ 2] 1476 	jp syntax_error
      001D00                       1477 1$:	
      0098AD F6 EE 01         [ 4] 1478 	call condition   
      0098B0 72 5C            [ 1] 1479 	cp a,#TK_INTGR 
      0098B2 00 02            [ 1] 1480 	jreq 2$
      0098B4 72 5C 00         [ 2] 1481 	jp syntax_error
      001D0A                       1482 2$:	
      001D0A                       1483 	_xpop ; value 
      0098B7 02 72            [ 1]    1     ld a,(y)
      0098B9 5C               [ 1]    2     ldw x,y 
      0098BA 00 02            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0098BC 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0098BD                       1484 3$:
      0098BD F6 72 5C 00      [ 4] 1485 	ld [ptr16],a
      0098C1 02 81 00 1A      [ 1] 1486 	inc ptr8  
      0098C3 72 CF 00 19      [ 5] 1487 	ldw [ptr16],x 
      0098C3 72               [ 4] 1488 	ret 
                                   1489 
                                   1490 
                                   1491 ;--------------------------
                                   1492 ; return constant/dvar value 
                                   1493 ; from it's record address
                                   1494 ; input:
                                   1495 ;	X	*const record 
                                   1496 ; output:
                                   1497 ;   A:X   const  value
                                   1498 ;--------------------------
      001D20                       1499 get_value: ; -- i 
      0098C4 5F               [ 1] 1500 	ld a,(x) ; record size 
      0098C5 00 0D            [ 1] 1501 	and a,#NAME_MAX_LEN
      0098C7 CF 00            [ 1] 1502 	sub a,#CELL_SIZE ; * value 
      0098C9 0E               [ 1] 1503 	push a 
      0098CA A6 10            [ 1] 1504 	push #0 
      0098CC C1 00 0B         [ 2] 1505 	addw x,(1,sp)
      0098CF 27               [ 1] 1506 	ld a,(x)
      0098D0 09 72            [ 2] 1507 	ldw x,(1,x)
      001D2E                       1508 	_drop 2
      0098D2 0F 00            [ 2]    1     addw sp,#2 
      0098D4 0E               [ 4] 1509 	ret 
                                   1510 
                                   1511 
                                   1512 ;--------------------------
                                   1513 ; BASIC: EEFREE 
                                   1514 ; eeprom_free 
                                   1515 ; search end of data  
                                   1516 ; in EEPROM 
                                   1517 ; input:
                                   1518 ;    none 
                                   1519 ; output:
                                   1520 ;    A:X     address free
                                   1521 ;-------------------------
      001D31                       1522 func_eefree:
      0098D5 04 72 53         [ 2] 1523 	ldw x,#EEPROM_BASE 
      0098D8 00 0D 00 0E      [ 1] 1524 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0098DA A3 47 F8         [ 2] 1525     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0098DA A6 FF            [ 1] 1526 	jruge 8$ ; no free space 
      0098DC CD               [ 1] 1527 2$: ld a,(x)
      0098DD 99 00            [ 1] 1528 	jrne 3$
      0098DF CD               [ 1] 1529 	incw x 
      0098E0 91 CC 88 CD      [ 1] 1530 	dec acc8 
      0098E4 89 DC            [ 1] 1531 	jrne 2$
      0098E6 84 81 08         [ 2] 1532 	subw x,#8 
      0098E8 20 09            [ 2] 1533 	jra 9$  
      0098E8 90               [ 1] 1534 3$: ld a,(x)
      0098E9 F6               [ 1] 1535 	incw x
      0098EA 93               [ 1] 1536 	tnz a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      0098EB EE 01            [ 1] 1537 	jrne 3$
      0098ED 72               [ 2] 1538 	decw x   
      0098EE A9 00            [ 2] 1539 	jra 1$ 
      0098F0 03               [ 1] 1540 8$: clrw x ; no free space 
      0098F1 C7               [ 1] 1541 9$: clr a 
      0098F2 00 0D CF         [ 2] 1542 	ldw free_eeprom,x ; save in system variable 
      0098F5 00               [ 4] 1543 	ret 
                                   1544 
                           000005  1545 REC_XTRA_BYTES=5 
                                   1546 ;--------------------------
                                   1547 ; search constant/dim_var name 
                                   1548 ; format of record  
                                   1549 ;   .byte record length 
                                   1550 ;         = strlen(name)+5 
                                   1551 ;   .asciz name (variable length)
                                   1552 ;   .int24 value (3 bytes )
                                   1553 ; a constant record use 7+ bytes
                                   1554 ; constants are saved in EEPROM  
                                   1555 ; input:
                                   1556 ;    A     record_len 
                                   1557 ;    X     *name
                                   1558 ; output:
                                   1559 ;    X     address|0
                                   1560 ; use:
                                   1561 ;   A,Y, acc16 
                                   1562 ;-------------------------
                           000001  1563 	NAMEPTR=1 ; target name pointer 
                           000003  1564 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1565 	RECLEN=5  ; record length of target
                           000007  1566 	LIMIT=7   ; search area limit 
                           000008  1567 	VSIZE=8  
      001D5A                       1568 search_name:
      0098F6 0E CD            [ 2] 1569 	pushw y 
      001D5C                       1570 	_vars VSIZE
      0098F8 98 DA            [ 2]    1     sub sp,#VSIZE 
      0098FA A6 20 CD 89      [ 1] 1571 	clr acc16 
      0098FE 7F 81            [ 1] 1572 	ld (RECLEN,sp),a    
      009900 1F 01            [ 2] 1573 	ldw (NAMEPTR,sp),x
      009900 52 04 0F         [ 2] 1574 	ldw x,dvar_end 
      009903 02 0F            [ 2] 1575 	ldw (LIMIT,sp),x 
      009905 01 4D 27 11      [ 2] 1576 	ldw y,dvar_bgn
      009909 C6 00            [ 2] 1577 1$:	ldw (WLKPTR,sp),y
      00990B 0B               [ 1] 1578 	ldw x,y 
      00990C A1 0A            [ 2] 1579 	cpw x, (LIMIT,sp) 
      00990E 26 0A            [ 1] 1580 	jruge 7$ ; no match found 
      009910 72 0F            [ 1] 1581 	ld a,(y)
      009912 00 0D            [ 1] 1582 	and a,#NAME_MAX_LEN
      009914 05 03            [ 1] 1583 	cp a,(RECLEN,sp)
      009916 01 CD            [ 1] 1584 	jrne 2$ 
      009918 82 9D            [ 1] 1585 	incw y 
      00991A 1E 01            [ 2] 1586 	ldw x,(NAMEPTR,sp)
      00991A AE 16 68         [ 4] 1587 	call strcmp
      00991D 1C 00            [ 1] 1588 	jrne 8$ ; match found 
      001D87                       1589 2$: ; skip this one 	
      00991F 50 5A            [ 2] 1590 	ldW Y,(WLKPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009921 7F F6            [ 1] 1591 	ld a,(y)
      009922 A4 0F            [ 1] 1592 	and a,#NAME_MAX_LEN 
      009922 C6 00 0B         [ 1] 1593 	ld acc8,a 
      009925 CD 83 69 AB      [ 2] 1594 	addw y,acc16 
      009929 30 A1            [ 2] 1595 	jra 1$  
      001D96                       1596 7$: ; no match found 
      00992B 3A 2B            [ 1] 1597 	clr (WLKPTR,sp)
      00992D 02 AB            [ 1] 1598 	clr (WLKPTR+1,sp)
      001D9A                       1599 8$: ; match found 
      00992F 07 03            [ 2] 1600 	ldw x,(WLKPTR,sp) ; record address 
      009930                       1601 9$:	_DROP VSIZE
      009930 5A F7            [ 2]    1     addw sp,#VSIZE 
      009932 0C 02            [ 2] 1602 	popw y 
      009934 C6               [ 4] 1603 	 ret 
                                   1604 
                                   1605 ;--------------------------------------------
                                   1606 ; BASIC: CONST name=value [, name=value]*
                                   1607 ; define constant(s) saved in EEPROM
                                   1608 ; share most of his code with cmd_dim 
                                   1609 ;--------------------------------------------
                           000001  1610 	VAR_NAME=1 
                           000003  1611 	REC_LEN=3
                           000005  1612 	RONLY=5
                           000005  1613 	VSIZE=5
      001DA1                       1614 cmd_const:
      009935 00 0D CA 00 0E   [ 2] 1615 	btjt flags,#FRUN,0$
      00993A CA 00            [ 1] 1616 	ld a,#ERR_RUN_ONLY
      00993C 0F 26 E3         [ 2] 1617 	jp tb_error 
      001DAB                       1618 0$: 
      001DAB                       1619 	_vars VSIZE 
      00993F C6 00            [ 2]    1     sub sp,#VSIZE 
      009941 0B A1            [ 1] 1620 	ld a,#128 
      009943 10 27            [ 1] 1621 	ld (RONLY,sp),a 
      009945 08 7B            [ 1] 1622 	clr (REC_LEN,sp)
      009947 01 27            [ 2] 1623 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1624 
                                   1625 ;---------------------------------
                                   1626 ; BASIC: DIM var_name [var_name]* 
                                   1627 ; create named variables at end 
                                   1628 ; of BASIC program. 
                                   1629 ; These variables are initialized 
                                   1630 ; to 0. 
                                   1631 ; record format same ast CONST 
                                   1632 ; but r/w because stored in RAM 
                                   1633 ;---------------------------------
      001DB5                       1634 cmd_dim:
      009949 0A A6 2D 20 02   [ 2] 1635 	btjt flags,#FRUN,cmd_dim1
      00994E A6 06            [ 1] 1636 	ld a,#ERR_RUN_ONLY
      00994E A6 24 5A         [ 2] 1637 	jp tb_error 
      001DBF                       1638 cmd_dim1:	
      001DBF                       1639 	_vars VSIZE
      009951 F7 0C            [ 2]    1     sub sp,#VSIZE 
      009953 02 03            [ 1] 1640 	clr (REC_LEN,sp )
      009954 0F 05            [ 1] 1641 	clr (RONLY,sp)
      001DC5                       1642 cmd_dim2: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009954 7B 02 5B         [ 4] 1643 0$:	call next_token 
      009957 04 81            [ 1] 1644 	cp a,#TK_LABEL  
      009959 27 03            [ 1] 1645 	jreq 1$ 
      009959 A1 61 2A         [ 2] 1646 	jp syntax_error 
      00995C 01 81            [ 2] 1647 1$: ldw (VAR_NAME,sp),x ; name pointer 
      00995E A1 7A 22         [ 4] 1648 	call strlen
      009961 FB A0            [ 1] 1649 	add a,#REC_XTRA_BYTES
      009963 20 81            [ 1] 1650 	ld (REC_LEN+1,sp),a
      009965 CD 18 14         [ 4] 1651 	call skip_string 
      009965 52 05            [ 1] 1652 	ld a,(REC_LEN+1,sp)
      009967 1F 04            [ 2] 1653 	ldw x,(VAR_NAME,sp) 
      009969 4F 5F 72         [ 4] 1654 	call search_name  
      00996C A2               [ 2] 1655 	tnzw x 
      00996D 00 03            [ 1] 1656 	jreq 2$
      00996F 90 F7            [ 1] 1657 	ld a,#ERR_DUPLICATE
      009971 90 EF 01         [ 2] 1658 	jp tb_error  
      009974 0F 01 A6         [ 2] 1659 2$:	ldw x,dvar_end 
      009977 0A 6B            [ 1] 1660 	ld a,(REC_LEN+1,sp)
      009979 02 1E            [ 1] 1661 	or a,(RONLY,sp)
      00997B 04               [ 1] 1662 	ld (x),a 
      00997C F6               [ 1] 1663 	incw x 
      00997D 27 4E            [ 2] 1664 	pushw y 
      00997F A1 2D            [ 2] 1665 	ldw y,(VAR_NAME+2,sp)
      009981 26 04 03         [ 4] 1666 	call strcpy
      009984 01 20            [ 2] 1667 	popw y 
      009986 08               [ 2] 1668 	decw x
      009987 A1 24 26         [ 2] 1669 	addw x,(REC_LEN,sp)
      00998A 08 A6 10         [ 2] 1670 	ldw dvar_end,x 
      00998D 6B 02 5C         [ 2] 1671 	subw x,#CELL_SIZE  
      009990 1F               [ 1] 1672 	clr (x)
      009991 04 F6            [ 1] 1673 	clr (1,x)  
      009993 6F 02            [ 1] 1674 	clr (2,x)
      009993 A1 61 2B         [ 4] 1675 4$: call next_token 
      009996 02 A0            [ 1] 1676 	cp a,#TK_COMMA 
      009998 20 A1            [ 1] 1677 	jreq 0$ 
      00999A 30 2B            [ 1] 1678 	cp a,#TK_EQUAL 
      00999C 30 A0            [ 1] 1679 	jrne 8$
                                   1680 ; initialize variable 
      00999E 30 A1 0A         [ 4] 1681 	call condition 
      0099A1 2B 06            [ 1] 1682 	cp a,#TK_INTGR
      0099A3 A0 07            [ 1] 1683 	jreq 5$
      0099A5 11 02 2A         [ 2] 1684 	jp syntax_error
      0099A8 24 6B 03         [ 2] 1685 5$: ldw x,dvar_end 
      0099AB 7B 02 CD         [ 2] 1686 	subw x,#CELL_SIZE 
      0099AE 82 BA 72         [ 2] 1687 	ldw ptr16,x 
      001E29                       1688 	_xpop 
      0099B1 A2 00            [ 1]    1     ld a,(y)
      0099B3 03               [ 1]    2     ldw x,y 
      0099B4 90 F7            [ 2]    3     ldw x,(1,x)
      0099B6 90 EF 01 5F      [ 2]    4     addw y,#CELL_SIZE 
      0099BA 7B 03 02 72      [ 4] 1689 	ld [ptr16],a 
      0099BE A2 00 03 90      [ 1] 1690 	inc ptr8 
      0099C2 F7 90 EF 01      [ 5] 1691 	ldw [ptr16],x 
      0099C6 CD 81            [ 2] 1692 	jra 4$ 
      001E40                       1693 8$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      001E40                       1694 	_unget_token 	
      0099C8 FE 1E 04 20 C2   [ 1]    1      mov in,in.saved  
      001E45                       1695 	_drop VSIZE 
      0099CD 0D 01            [ 2]    1     addw sp,#VSIZE 
      0099CF 27 03 CD         [ 4] 1696 	call ubound 
      0099D2 82               [ 4] 1697 	ret 
                                   1698 
                                   1699 
                                   1700 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1701 ; return program size 
                                   1702 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E4B                       1703 prog_size:
      0099D3 83 00 1D         [ 2] 1704 	ldw x,txtend 
      0099D4 72 B0 00 1B      [ 2] 1705 	subw x,txtbgn 
      0099D4 90               [ 4] 1706 	ret 
                                   1707 
                                   1708 ;----------------------------
                                   1709 ; print program information 
                                   1710 ;---------------------------
      001E53                       1711 program_info: 
      0099D5 F6 93 EE         [ 2] 1712 	ldw x,#PROG_ADDR 
      0099D8 01 72 A9         [ 4] 1713 	call puts 
      0099DB 00 03 C7         [ 2] 1714 	ldw x,txtbgn 
      0099DE 00 0D CF 00      [ 1] 1715 	mov base,#16 
      0099E2 0E 5B 05         [ 4] 1716 	call prt_i16
      0099E5 81 0A 00 0A      [ 1] 1717 	mov base,#10  
      0099E6 AE 1E A4         [ 2] 1718 	ldw x,#PROG_SIZE
      0099E6 52 05 17         [ 4] 1719 	call puts 
      0099E9 04 1E 4B         [ 4] 1720 	call prog_size 
      0099EA CD 18 43         [ 4] 1721 	call prt_i16 
      0099EA 1F 02 F6         [ 2] 1722 	ldw x,#STR_BYTES 
      0099ED A4 0F 6B         [ 4] 1723 	call puts
      0099F0 01 16 04         [ 2] 1724 	ldw x,txtbgn
      0099F3 5C 38 84         [ 2] 1725 	cpw x,#app 
      0099F4 25 05            [ 1] 1726 	jrult 2$
      0099F4 90 F6 27         [ 2] 1727 	ldw x,#FLASH_MEM 
      0099F7 1B 0D            [ 2] 1728 	jra 3$
      0099F9 01 27 0A         [ 2] 1729 2$: ldw x,#RAM_MEM 	 
      0099FC F1 26 07         [ 4] 1730 3$:	call puts 
      0099FF 90 5C            [ 1] 1731 	ld a,#CR 
      009A01 5C 0A 01         [ 4] 1732 	call putc
      009A04 20               [ 4] 1733 	ret 
                                   1734 
      009A05 EE 72 6F 67 72 61 6D  1735 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A06 2C 20 70 72 6F 67 72  1736 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A06 1E 02 1D 00 02 4B 00  1737 STR_BYTES: .asciz " bytes" 
      009A0D FE 84 27 1D 20 D7 41  1738 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A13 20 69 6E 20 52 41 4D  1739 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



             00
                                   1740 
                                   1741 
                                   1742 ;----------------------------
                                   1743 ; BASIC: LIST [[start][-end]]
                                   1744 ; list program lines 
                                   1745 ; form start to end 
                                   1746 ; if empty argument list then 
                                   1747 ; list all.
                                   1748 ;----------------------------
                           000001  1749 	FIRST=1
                           000003  1750 	LAST=3 
                           000005  1751 	LN_PTR=5
                           000006  1752 	VSIZE=6 
      001EDC                       1753 list:
      009A13 1E 02 F6 6B 01   [ 2] 1754 	btjf flags,#FRUN,0$
      009A18 A4 0F            [ 1] 1755 	ld a,#ERR_CMD_ONLY
      009A1A 4C C7 00         [ 2] 1756 	jp tb_error
      001EE6                       1757 0$:	 
      009A1D 0F 72 5F         [ 4] 1758 	call prog_size 
      009A20 00 0E            [ 1] 1759 	jrugt 3$
      009A22 72               [ 4] 1760 	ret 
      001EEC                       1761 3$: _vars VSIZE
      009A23 BB 00            [ 2]    1     sub sp,#VSIZE 
      009A25 0E FE 7B         [ 2] 1762 	ldw x,txtbgn 
      009A28 01 A4            [ 2] 1763 	ldw (LN_PTR,sp),x 
      009A2A F0               [ 2] 1764 	ldw x,(x) 
      009A2B 4E AB            [ 2] 1765 	ldw (FIRST,sp),x ; list from first line 
      009A2D 80 7F FF         [ 2] 1766 	ldw x,#MAX_LINENO ; biggest line number 
      009A2E 1F 03            [ 2] 1767 	ldw (LAST,sp),x 
      009A2E 5B 05 81         [ 4] 1768 	call next_token 
      009A31 A1 84            [ 1] 1769 	cp a,#TK_INTGR
      009A31 88 CD            [ 1] 1770 	jreq start_from 
      001F02                       1771 is_minus: 	
      009A33 98 7B            [ 1] 1772 	cp a,#TK_MINUS 
      009A35 11 01            [ 1] 1773 	jreq end_at_line
      001F06                       1774 	_unget_token 
      009A37 27 03 CC 97 14   [ 1]    1      mov in,in.saved  
      009A3C 84 81            [ 2] 1775 	jra list_loop 
      009A3E                       1776 start_from:	 
      009A3E A6 06 CD         [ 4] 1777 	call get_int24
      009A41 9A 31            [ 2] 1778 	ldw (FIRST,sp),x	
      009A43                       1779 lines_skip:
      009A43 4B 00            [ 2] 1780 	pushw y 
      009A45 CD               [ 1] 1781 	clr a 
      009A46 9C 9E 4D         [ 4] 1782 	call search_lineno 
      009A49 27               [ 2] 1783 	tnzw x 
      009A4A 12 0C            [ 1] 1784 	jrne 1$
      009A4C 01               [ 1] 1785 	ldw x,y 
      009A4D CD 98            [ 2] 1786 1$:	popw y 
      009A4F 7B A1            [ 2] 1787 	ldw (LN_PTR,sp),x 
      009A51 08 27 F1         [ 4] 1788 	call next_token 
      009A54 A1 07            [ 1] 1789 	cp a,#TK_MINUS 
      009A56 27 05            [ 1] 1790 	jreq end_at_line 
      009A58 55 00            [ 2] 1791 	ldw x,(FIRST,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009A5A 04 00            [ 2] 1792 	ldw (LAST,sp),x 
      009A5C 02 84            [ 2] 1793 	jra list_loop 
      001F2D                       1794 end_at_line:
                                   1795 ; expect ending line# 
      009A5E 81 17 FB         [ 4] 1796     call next_token 
      009A5F A1 84            [ 1] 1797 	cp a,#TK_INTGR
      009A5F CD 9A            [ 1] 1798 	jreq 1$
      001F34                       1799 	_unget_token 
      009A61 3E A1 01 27 03   [ 1]    1      mov in,in.saved  
      009A66 CC 97            [ 2] 1800 	jra list_loop
      001F3B                       1801 1$:
      009A68 14 90 F6         [ 4] 1802 	call get_int24 
      009A6B 93 EE            [ 2] 1803 	ldw (LAST,sp),x 
                                   1804 ; print loop
      001F40                       1805 list_loop:
      009A6D 01 72            [ 2] 1806 	ldw x,(LN_PTR,sp)
      009A6F A9 00            [ 1] 1807 	ld a,(2,x) 
      009A71 03 C3 00         [ 4] 1808 	call prt_basic_line
      009A74 21 23            [ 2] 1809 	ldw x,(LN_PTR,sp)
      009A76 05 A6            [ 1] 1810 	ld a,(2,x)
      009A78 0A CC 97         [ 1] 1811 	ld acc8,a 
      009A7B 16 5D 27 F8      [ 1] 1812 	clr acc16 
      009A7F A6 03 42 CF      [ 2] 1813 	addw x,acc16
      009A83 00 0E AE         [ 2] 1814 	cpw x,txtend 
      009A86 16 68            [ 1] 1815 	jrpl list_exit
      009A88 72 B0            [ 2] 1816 	ldw (LN_PTR,sp),x
      009A8A 00               [ 2] 1817 	ldw x,(x)
      009A8B 0E 81            [ 2] 1818 	cpw x,(LAST,sp)  
      009A8D 2D DE            [ 1] 1819 	jrsle list_loop
      001F62                       1820 list_exit:
      009A8D 52 01 0F 01 CD   [ 1] 1821 	mov in,count 
      009A92 98 7B 4D         [ 2] 1822 	ldw x,#pad 
      009A95 26 03 CC         [ 2] 1823 	ldw basicptr,x 
      001F6D                       1824 	_drop VSIZE 
      009A98 9B 3F            [ 2]    1     addw sp,#VSIZE 
      009A9A A1 10 27         [ 4] 1825 	call program_info 
      009A9D 06               [ 4] 1826 	ret
                                   1827 
                                   1828 
                                   1829 ;--------------------------
                                   1830 ; BASIC: EDIT label 
                                   1831 ;  copy program in FLASH 
                                   1832 ;  to RAM for edition 
                                   1833 ;-------------------------
      001F73                       1834 cmd_edit:
      009A9E A1 11            [ 1] 1835 	ld a,#TK_LABEL 
      009AA0 26 05 03         [ 4] 1836 	call expect  
      009AA3 01               [ 2] 1837 	pushw x 
      009AA4 CD 18 14         [ 4] 1838 	call skip_string
      009AA4 CD               [ 2] 1839 	popw x 
      009AA5 98 7B FA         [ 4] 1840 	call search_program 
      009AA7 26 06            [ 1] 1841     jrne 1$ 
      009AA7 4D 26 03         [ 2] 1842 	ldw x,#ERR_NO_PROGRAM
      009AAA CC 97 14         [ 2] 1843 	jp tb_error 
      009AAD 90 89            [ 2] 1844 1$: pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009AAD A1 81            [ 1] 1845 	ldw y,x ; source address 
      009AAF 26 0C FE         [ 2] 1846 	subw x,#4
      009AB2 72 5C            [ 2] 1847 	ldw x,(2,x) ; program size 
      009AB4 00 02 72         [ 2] 1848 	addw x,#4 
      009AB7 5C 00 02         [ 2] 1849 	ldw acc16,x  ; bytes to copy 
      009ABA FD 20 70         [ 2] 1850 	ldw x,#rsign ; destination address 
      009ABD 72 A2 00 04      [ 2] 1851 	subw y,#4 
      009ABD A1 84 26         [ 4] 1852 	call move  
      009AC0 05 CD 98         [ 2] 1853 	ldw x,#free_ram 
      009AC3 AD 20 67         [ 2] 1854 	ldw txtbgn,x 
      009AC6 72 BB 00 8E      [ 2] 1855 	addw x,rsize  
      009AC6 A1 05 26         [ 2] 1856 	ldw txtend,x
      009AC9 05 CD            [ 2] 1857 	popw y  
      009ACB 9A               [ 4] 1858 	ret 
                                   1859 
                                   1860 ;--------------------------
                                   1861 ; decompile line from token list
                                   1862 ; and print it. 
                                   1863 ; input:
                                   1864 ;   A       stop at this position 
                                   1865 ;   X 		pointer at line
                                   1866 ; output:
                                   1867 ;   none 
                                   1868 ;--------------------------	
      001FB1                       1869 prt_basic_line:
      009ACC 5F 20            [ 2] 1870 	pushw y 
      009ACE 07 00 02         [ 1] 1871 	ld count,a 
      009ACF E6 02            [ 1] 1872 	ld a,(2,x)
      009ACF A1 85 26         [ 1] 1873 	cp a,count 
      009AD2 08 CD            [ 1] 1874 	jrpl 1$ 
      009AD4 98 A3 02         [ 1] 1875 	ld count,a 
      009AD6 CF 00 04         [ 2] 1876 1$:	ldw basicptr,x 
      009AD6 F6 EE 01 20      [ 2] 1877 	ldw y,#tib  
      009ADA 52 11 AE         [ 4] 1878 	call decompile 
      009ADB CD 09 5C         [ 4] 1879 	call puts 
      009ADB A1 03            [ 1] 1880 	ld a,#CR 
      009ADD 26 1D 90         [ 4] 1881 	call putc 
      009AE0 89 89            [ 2] 1882 	popw y 
      009AE2 CD               [ 4] 1883 	ret 
                                   1884 
                                   1885 
                                   1886 ;---------------------------------
                                   1887 ; BASIC: PRINT|? arg_list 
                                   1888 ; print values from argument list
                                   1889 ;----------------------------------
                           000001  1890 	CCOMMA=1
                           000001  1891 	VSIZE=1
      001FD5                       1892 print:
      001FD5                       1893 	_vars VSIZE 
      009AE3 98 94            [ 2]    1     sub sp,#VSIZE 
      001FD7                       1894 reset_comma:
      009AE5 85 CD            [ 1] 1895 	clr (CCOMMA,sp)
      001FD9                       1896 prt_loop:
      009AE7 94 12 AB         [ 4] 1897 	call next_token
      009AEA 05 CD            [ 1] 1898 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009AEC 9D DA            [ 1] 1899 	jrult 0$
      009AEE 5D 26            [ 1] 1900 	cp a,#TK_COLON 
      009AF0 04 90            [ 1] 1901 	jreq 0$
      009AF2 85 20            [ 1] 1902 	cp a,#TK_CMD
      009AF4 30 07            [ 1] 1903 	jrne 10$
      009AF5                       1904 0$:
      001FE8                       1905 	_unget_token 
      009AF5 90 85 CD 9D A0   [ 1]    1      mov in,in.saved  
      009AFA 20 31            [ 2] 1906 	jra 8$ 
      009AFC                       1907 10$:	
      009AFC A1 82            [ 1] 1908 	cp a,#TK_QSTR
      009AFE 26 0E            [ 1] 1909 	jreq 1$
      009B00 FE 72            [ 1] 1910 	cp a,#TK_CHAR 
      009B02 5C 00            [ 1] 1911 	jreq 2$ 
      009B04 02 72            [ 1] 1912 	cp a,#TK_CFUNC 
      009B06 5C 00            [ 1] 1913 	jreq 3$
      009B08 02 FD            [ 1] 1914 	cp a,#TK_COMMA 
      009B0A 5F 02            [ 1] 1915 	jreq 4$
      009B0C 20 1F            [ 1] 1916 	cp a,#TK_SHARP 
      009B0E 27 2A            [ 1] 1917 	jreq 5$
      009B0E A1 06            [ 2] 1918 	jra 7$ 
      002005                       1919 1$:	; print string 
      009B10 26 13 CD         [ 4] 1920 	call puts
      009B13 9B               [ 1] 1921 	incw x
      009B14 85 A6 07 CD      [ 2] 1922 	subw x,basicptr 
      009B18 9A 31 90         [ 2] 1923 	ldw in.w,x  
      009B1B F6 93            [ 2] 1924 	jra reset_comma
      002012                       1925 2$:	; print character 
      009B1D EE 01 72         [ 4] 1926 	call get_char 
      009B20 A9 00 03         [ 4] 1927 	call putc 
      009B23 20 08            [ 2] 1928 	jra reset_comma 
      009B25                       1929 3$: ; print character function value  	
      00201A                       1930 	_get_code_addr 
      009B25 55               [ 2]    1         ldw x,(x)
      009B26 00 04 00 02      [ 1]    2         inc in 
      009B2A 4F 20 12 01      [ 1]    3         inc in 
      009B2D FD               [ 4] 1931 	call (x)
      009B2D 0D 01 27         [ 4] 1932 	call putc
      009B30 03 CD            [ 2] 1933 	jra reset_comma 
      002029                       1934 4$: ; set comma state 
      009B32 82 95            [ 1] 1935 	cpl (CCOMMA,sp)
      009B34 20 AC            [ 2] 1936 	jra prt_loop   
      00202D                       1937 5$: ; # character must be followed by an integer   
      009B34 72 A2 00         [ 4] 1938 	call next_token
      009B37 03 90            [ 1] 1939 	cp a,#TK_INTGR 
      009B39 F7 90            [ 1] 1940 	jreq 6$
      009B3B EF 01 A6         [ 2] 1941 	jp syntax_error 
      002037                       1942 6$: ; set tab width
      009B3E 84 18 2D         [ 4] 1943 	call get_int24 
      009B3F 9F               [ 1] 1944 	ld a,xl 
      009B3F 5B 01            [ 1] 1945 	and a,#15 
      009B41 81 00 23         [ 1] 1946 	ld tab_width,a 
      009B42 20 95            [ 2] 1947 	jra reset_comma 
      002042                       1948 7$:	
      002042                       1949 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009B42 52 01 CD 9A 8D   [ 1]    1      mov in,in.saved  
      009B47 4D 27 38         [ 4] 1950 	call condition
      009B4A 4D               [ 1] 1951 	tnz a 
      009B4A CD 98            [ 1] 1952 	jreq 8$    
      009B4C 7B 6B 01         [ 4] 1953     call print_top
      009B4F A4 30            [ 2] 1954 	jra reset_comma 
      002052                       1955 8$:
      009B51 A1 20            [ 1] 1956 	tnz (CCOMMA,sp)
      009B53 27 09            [ 1] 1957 	jrne 9$
      009B55 A6 84            [ 1] 1958 	ld a,#CR 
      009B57 55 00 04         [ 4] 1959     call putc 
      00205B                       1960 9$:	_drop VSIZE 
      009B5A 00 02            [ 2]    1     addw sp,#VSIZE 
      009B5C 20               [ 4] 1961 	ret 
                                   1962 
                                   1963 ;----------------------
                                   1964 ; 'save_context' and
                                   1965 ; 'rest_context' must be 
                                   1966 ; called at the same 
                                   1967 ; call stack depth 
                                   1968 ; i.e. SP must have the 
                                   1969 ; save value at  
                                   1970 ; entry point of both 
                                   1971 ; routine. 
                                   1972 ;---------------------
                           000004  1973 	CTXT_SIZE=4 ; size of saved data 
                                   1974 ;--------------------
                                   1975 ; save current BASIC
                                   1976 ; interpreter context 
                                   1977 ; on stack 
                                   1978 ;--------------------
      00205E                       1979 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00205E                       1980 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00205E                       1981 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00205E                       1982 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00205E                       1983 save_context:
      009B5D 24 00 04         [ 2] 1984 	ldw x,basicptr 
      009B5E 1F 03            [ 2] 1985 	ldw (BPTR,sp),x
      009B5E CD 9A 8D         [ 1] 1986 	ld a,in 
      009B61 4D 26            [ 1] 1987 	ld (IN,sp),a
      009B63 03 CC 97         [ 1] 1988 	ld a,count 
      009B66 14 06            [ 1] 1989 	ld (CNT,sp),a  
      009B67 81               [ 4] 1990 	ret
                                   1991 
                                   1992 ;-----------------------
                                   1993 ; restore previously saved 
                                   1994 ; BASIC interpreter context 
                                   1995 ; from stack 
                                   1996 ;-------------------------
      00206E                       1997 rest_context:
      009B67 7B 01            [ 2] 1998 	ldw x,(BPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009B69 A1 20 26         [ 2] 1999 	ldw basicptr,x 
      009B6C 05 CD            [ 1] 2000 	ld a,(IN,sp)
      009B6E 82 F9 20         [ 1] 2001 	ld in,a
      009B71 D8 A1            [ 1] 2002 	ld a,(CNT,sp)
      009B73 21 26 05         [ 1] 2003 	ld count,a  
      009B76 CD               [ 4] 2004 	ret
                                   2005 
                                   2006 
                                   2007 
                                   2008 ;------------------------------------------
                                   2009 ; BASIC: INPUT [string]var[,[string]var]
                                   2010 ; input value in variables 
                                   2011 ; [string] optionally can be used as prompt 
                                   2012 ;-----------------------------------------
                           000001  2013 	CX_BPTR=1
                           000003  2014 	CX_IN=3
                           000004  2015 	CX_CNT=4
                           000005  2016 	SKIP=5
                           000005  2017 	VSIZE=5
      00207E                       2018 input_var:
      009B77 83 87            [ 2] 2019 	pushw y 
      002080                       2020 	_vars VSIZE 
      009B79 20 CF            [ 2]    1     sub sp,#VSIZE 
      009B7B                       2021 input_loop:
      009B7B CD 84            [ 1] 2022 	clr (SKIP,sp)
      009B7D 21 20 CA         [ 4] 2023 	call next_token 
      009B80 A1 02            [ 1] 2024 	cp a,#TK_QSTR 
      009B80 A6 84            [ 1] 2025 	jrne 1$ 
      009B82 CD 09 5C         [ 4] 2026 	call puts 
      009B82 5B               [ 1] 2027 	incw x 
      009B83 01 81 00 04      [ 2] 2028 	subw x,basicptr 
      009B85 CF 00 00         [ 2] 2029 	ldw in.w,x 
      009B85 52 01            [ 1] 2030 	cpl (SKIP,sp)
      009B87 CD 9B 42         [ 4] 2031 	call next_token 
      009B8A 4D 27            [ 1] 2032 1$: cp a,#TK_VAR  
      009B8C 2D 03            [ 1] 2033 	jreq 2$ 
      009B8D CC 16 94         [ 2] 2034 	jp syntax_error
      009B8D CD 98 7B         [ 4] 2035 2$:	call get_addr
      009B90 6B 01 A4         [ 2] 2036 	ldw ptr16,x 
      009B93 30 A1            [ 1] 2037 	tnz (SKIP,sp)
      009B95 10 27            [ 1] 2038 	jrne 21$ 
      009B97 09 55 00         [ 4] 2039 	call var_name 
      009B9A 04 00 02         [ 4] 2040 	call putc   
      0020B2                       2041 21$:
      009B9D A6 84            [ 1] 2042 	ld a,#':
      009B9F 20 19 FF         [ 4] 2043 	call putc 
      009BA1 CD 20 5E         [ 4] 2044 	call save_context 
      009BA1 CD 9B 42 4D      [ 1] 2045 	clr count  
      009BA5 26 03 CC         [ 4] 2046 	call readln 
      009BA8 97 14 68         [ 2] 2047 	ldw x,#tib 
      009BAA 3B 00 02         [ 1] 2048 	push count
      009BAA 7B 01            [ 1] 2049 	push #0 
      009BAC A1 10 26         [ 2] 2050 	addw x,(1,sp)
      009BAF 05               [ 1] 2051 	incw x 
      0020CD                       2052 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009BB0 CD 81            [ 2]    1     addw sp,#2 
      009BB2 FE 20 D8 01      [ 1] 2053 	clr in 
      009BB5 CD 0E EE         [ 4] 2054 	call get_token
      009BB5 CD 82            [ 1] 2055 	cp a,#TK_INTGR
      009BB7 1B 20            [ 1] 2056 	jreq 3$ 
      009BB9 D3 11            [ 1] 2057 	cp a,#TK_MINUS
      009BBA 26 07            [ 1] 2058 	jrne 22$
      009BBA 5B 01 81         [ 4] 2059 	call get_token 
      009BBD A1 84            [ 1] 2060 	cp a,#TK_INTGR 
      009BBD 52 01            [ 1] 2061 	jreq 23$
      0020E5                       2062 22$:
      009BBF CD 9B 85         [ 4] 2063 	call rest_context 
      009BC2 4D 27 54         [ 2] 2064 	jp syntax_error
      0020EB                       2065 23$:
      009BC5 CD 98 7B         [ 4] 2066 	call neg_acc24	
      0020EE                       2067 3$: 
      009BC8 6B 01 A4         [ 1] 2068 	ld a,acc24 
      009BCB 30 A1 30         [ 2] 2069 	ldw x,acc16 
      009BCE 27 09 A6 84      [ 4] 2070 	ld [ptr16],a
      009BD2 55 00 04 00      [ 1] 2071 	inc ptr8  
      009BD6 02 20 40 19      [ 5] 2072 	ldw [ptr16],x 
      009BD9 CD 20 6E         [ 4] 2073 	call rest_context
      009BD9 CD 9B 85         [ 4] 2074 	call next_token 
      009BDC 4D 26            [ 1] 2075 	cp a,#TK_COMMA
      009BDE 03 CC            [ 1] 2076 	jrne 4$ 
      009BE0 97 14 82         [ 2] 2077 	jp input_loop
      009BE2                       2078 4$:
      009BE2 CD 82            [ 1] 2079 	cp a,#TK_NONE 
      009BE4 38 90            [ 1] 2080 	jreq input_exit  
      009BE6 F6 93            [ 1] 2081 	cp a,#TK_COLON 
      009BE8 EE 01            [ 1] 2082     jreq input_exit 
      009BEA 72 A9 00         [ 2] 2083 	jp syntax_error 
      002118                       2084 input_exit:
      002118                       2085 	_drop VSIZE 
      009BED 03 4D            [ 2]    1     addw sp,#VSIZE 
      009BEF 2B 08            [ 2] 2086 	popw y 
      009BF1 26               [ 4] 2087 	ret 
                                   2088 
                                   2089 
                                   2090 ;---------------------
                                   2091 ; BASIC: REM | ' 
                                   2092 ; skip comment to end of line 
                                   2093 ;---------------------- 
      00211D                       2094 remark::
      009BF2 0C 35 02 00 0F   [ 1] 2095 	mov in,count 
      009BF7 20               [ 4] 2096  	ret 
                                   2097 
                                   2098 
                                   2099 ;---------------------
                                   2100 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2101 ; read in loop 'addr'  
                                   2102 ; apply & 'mask' to value 
                                   2103 ; loop while result==0.  
                                   2104 ; 'xor_mask' is used to 
                                   2105 ; invert the wait logic.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   2106 ; i.e. loop while not 0.
                                   2107 ;---------------------
                           000001  2108 	XMASK=1 
                           000002  2109 	MASK=2
                           000003  2110 	ADDR=3
                           000004  2111 	VSIZE=4
      002123                       2112 wait: 
      002123                       2113 	_vars VSIZE
      009BF8 0A 04            [ 2]    1     sub sp,#VSIZE 
      009BF9 0F 01            [ 1] 2114 	clr (XMASK,sp) 
      009BF9 35 04 00         [ 4] 2115 	call arg_list 
      009BFC 0F 20            [ 1] 2116 	cp a,#2
      009BFE 04 03            [ 1] 2117 	jruge 0$
      009BFF CC 16 94         [ 2] 2118 	jp syntax_error 
      009BFF 35 01            [ 1] 2119 0$:	cp a,#3
      009C01 00 0F            [ 1] 2120 	jrult 1$
      009C03                       2121 	_xpop  ; xor mask 
      009C03 5F C6            [ 1]    1     ld a,(y)
      009C05 00               [ 1]    2     ldw x,y 
      009C06 0F 14            [ 2]    3     ldw x,(1,x)
      009C08 01 27 03 53      [ 2]    4     addw y,#CELL_SIZE 
      009C0C A6               [ 1] 2122 	ld a,xl 
      009C0D FF 72            [ 1] 2123 	ld (XMASK,sp),a 
      002141                       2124 1$: _xpop ; mask
      009C0F A2 00            [ 1]    1     ld a,(y)
      009C11 03               [ 1]    2     ldw x,y 
      009C12 90 F7            [ 2]    3     ldw x,(1,x)
      009C14 90 EF 01 A6      [ 2]    4     addw y,#CELL_SIZE 
      009C18 84               [ 1] 2125     ld a,xl  
      009C19 6B 02            [ 1] 2126 	ld (MASK,sp),a 
      00214D                       2127 	_xpop ; address 
      009C19 5B 01            [ 1]    1     ld a,(y)
      009C1B 81               [ 1]    2     ldw x,y 
      009C1C EE 01            [ 2]    3     ldw x,(1,x)
      009C1C 4B 00 CD 98      [ 2]    4     addw y,#CELL_SIZE 
      009C20 7B               [ 1] 2128 2$:	ld a,(x)
      009C21 4D 27            [ 1] 2129 	and a,(MASK,sp)
      009C23 25 A1            [ 1] 2130 	xor a,(XMASK,sp)
      009C25 87 26            [ 1] 2131 	jreq 2$ 
      00215D                       2132 	_drop VSIZE 
      009C27 04 03            [ 2]    1     addw sp,#VSIZE 
      009C29 01               [ 4] 2133 	ret 
                                   2134 
                                   2135 ;---------------------
                                   2136 ; BASIC: BSET addr,mask
                                   2137 ; set bits at 'addr' corresponding 
                                   2138 ; to those of 'mask' that are at 1.
                                   2139 ; arguments:
                                   2140 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2141 ;   mask        mask|addr
                                   2142 ; output:
                                   2143 ;	none 
                                   2144 ;--------------------------
      002160                       2145 bit_set:
      009C2A 20 F2 C3         [ 4] 2146 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009C2C A1 02            [ 1] 2147 	cp a,#2	 
      009C2C A1 06            [ 1] 2148 	jreq 1$ 
      009C2E 26 0A CD         [ 2] 2149 	jp syntax_error
      00216A                       2150 1$: 
      00216A                       2151 	_xpop ; mask 
      009C31 9C 9E            [ 1]    1     ld a,(y)
      009C33 A6               [ 1]    2     ldw x,y 
      009C34 07 CD            [ 2]    3     ldw x,(1,x)
      009C36 9A 31 20 08      [ 2]    4     addw y,#CELL_SIZE 
      009C3A 55               [ 1] 2152 	ld a,xl
      009C3B 00               [ 1] 2153 	push a  
      002175                       2154 	_xpop ; addr  
      009C3C 04 00            [ 1]    1     ld a,(y)
      009C3E 02               [ 1]    2     ldw x,y 
      009C3F CD 9B            [ 2]    3     ldw x,(1,x)
      009C41 BD A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C42 84               [ 1] 2155 	pop a 
      009C42 0D               [ 1] 2156 	or a,(x)
      009C43 01               [ 1] 2157 	ld (x),a
      009C44 27               [ 4] 2158 	ret 
                                   2159 
                                   2160 ;---------------------
                                   2161 ; BASIC: BRES addr,mask
                                   2162 ; reset bits at 'addr' corresponding 
                                   2163 ; to those of 'mask' that are at 1.
                                   2164 ; arguments:
                                   2165 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2166 ;   mask	    ~mask&*addr  
                                   2167 ; output:
                                   2168 ;	none 
                                   2169 ;--------------------------
      002182                       2170 bit_reset:
      009C45 03 CD 82         [ 4] 2171 	call arg_list 
      009C48 7A 02            [ 1] 2172 	cp a,#2  
      009C49 27 03            [ 1] 2173 	jreq 1$ 
      009C49 5B 01 81         [ 2] 2174 	jp syntax_error
      009C4C                       2175 1$: 
      00218C                       2176 	_xpop ; mask 
      009C4C CD 9C            [ 1]    1     ld a,(y)
      009C4E 1C               [ 1]    2     ldw x,y 
      009C4F 4D 27            [ 2]    3     ldw x,(1,x)
      009C51 4B CD 98 7B      [ 2]    4     addw y,#CELL_SIZE 
      009C55 4D               [ 1] 2177 	ld a,xl 
      009C56 27               [ 1] 2178 	cpl a
      009C57 43               [ 1] 2179 	push a  
      002198                       2180 	_xpop ; addr  
      009C58 A1 88            [ 1]    1     ld a,(y)
      009C5A 27               [ 1]    2     ldw x,y 
      009C5B 07 55            [ 2]    3     ldw x,(1,x)
      009C5D 00 04 00 02      [ 2]    4     addw y,#CELL_SIZE 
      009C61 20               [ 1] 2181 	pop a 
      009C62 38               [ 1] 2182 	and a,(x)
      009C63 CD               [ 1] 2183 	ld (x),a 
      009C64 9C               [ 4] 2184 	ret 
                                   2185 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2186 ;---------------------
                                   2187 ; BASIC: BTOGL addr,mask
                                   2188 ; toggle bits at 'addr' corresponding 
                                   2189 ; to those of 'mask' that are at 1.
                                   2190 ; arguments:
                                   2191 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2192 ;   mask	    mask^*addr  
                                   2193 ; output:
                                   2194 ;	none 
                                   2195 ;--------------------------
      0021A5                       2196 bit_toggle:
      009C65 1C 4D 26         [ 4] 2197 	call arg_list 
      009C68 03 CC            [ 1] 2198 	cp a,#2 
      009C6A 97 14            [ 1] 2199 	jreq 1$ 
      009C6C CC 16 94         [ 2] 2200 	jp syntax_error
      0021AF                       2201 1$: _xpop ; mask 
      009C6C 90 F6            [ 1]    1     ld a,(y)
      009C6E 93               [ 1]    2     ldw x,y 
      009C6F EE 01            [ 2]    3     ldw x,(1,x)
      009C71 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C75 C7               [ 1] 2202 	ld a,xl
      009C76 00               [ 1] 2203 	push a 
      0021BA                       2204 	_xpop  ; addr  
      009C77 0D CF            [ 1]    1     ld a,(y)
      009C79 00               [ 1]    2     ldw x,y 
      009C7A 0E 90            [ 2]    3     ldw x,(1,x)
      009C7C F6 93 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      009C80 72               [ 1] 2205 	pop a 
      009C81 A9               [ 1] 2206 	xor a,(x)
      009C82 00               [ 1] 2207 	ld (x),a 
      009C83 03               [ 4] 2208 	ret 
                                   2209 
                                   2210 
                                   2211 ;---------------------
                                   2212 ; BASIC: BTEST(addr,bit)
                                   2213 ; return bit value at 'addr' 
                                   2214 ; bit is in range {0..7}.
                                   2215 ; arguments:
                                   2216 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2217 ;   bit 	    bit position {0..7}  
                                   2218 ; output:
                                   2219 ;	A:X       bit value  
                                   2220 ;--------------------------
      0021C7                       2221 bit_test:
      009C84 C4 00 0D         [ 4] 2222 	call func_args 
      009C87 02 C4            [ 1] 2223 	cp a,#2
      009C89 00 0E            [ 1] 2224 	jreq 0$
      009C8B 02 C4 00         [ 2] 2225 	jp syntax_error
      0021D1                       2226 0$:	
      0021D1                       2227 	_xpop 
      009C8E 0F 02            [ 1]    1     ld a,(y)
      009C90 72               [ 1]    2     ldw x,y 
      009C91 A2 00            [ 2]    3     ldw x,(1,x)
      009C93 03 90 F7 90      [ 2]    4     addw y,#CELL_SIZE 
      009C97 EF               [ 1] 2228 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009C98 01 20            [ 1] 2229 	and a,#7
      009C9A B7               [ 1] 2230 	push a   
      009C9B A6 84            [ 1] 2231 	ld a,#1 
      009C9D 81 01            [ 1] 2232 1$: tnz (1,sp)
      009C9E 27 05            [ 1] 2233 	jreq 2$
      009C9E 52               [ 1] 2234 	sll a 
      009C9F 02 CD            [ 1] 2235 	dec (1,sp)
      009CA1 9C 4C            [ 2] 2236 	jra 1$
      009CA3 4D 27            [ 1] 2237 2$: ld (1,sp),a  
      0021EB                       2238 	_xpop ; address  
      009CA5 69 CD            [ 1]    1     ld a,(y)
      009CA7 98               [ 1]    2     ldw x,y 
      009CA8 7B A1            [ 2]    3     ldw x,(1,x)
      009CAA 89 27 0B A1      [ 2]    4     addw y,#CELL_SIZE 
      009CAE 8A               [ 1] 2239 	pop a 
      009CAF 27               [ 1] 2240 	and a,(x)
      009CB0 07 55            [ 1] 2241 	jreq 3$
      009CB2 00 04            [ 1] 2242 	ld a,#1 
      009CB4 00               [ 1] 2243 3$:	clrw x 
      009CB5 02               [ 1] 2244 	ld xl,a
      009CB6 20               [ 1] 2245 	clr a  
      009CB7 55               [ 4] 2246 	ret
                                   2247 
                                   2248 ;--------------------
                                   2249 ; BASIC: POKE addr,byte
                                   2250 ; put a byte at addr 
                                   2251 ;--------------------
      0021FE                       2252 poke:
      009CB8 6B 02 CD         [ 4] 2253 	call arg_list 
      009CBB 9C 4C            [ 1] 2254 	cp a,#2
      009CBD A1 84            [ 1] 2255 	jreq 1$
      009CBF 27 03 CC         [ 2] 2256 	jp syntax_error
      002208                       2257 1$:	
      002208                       2258 	_xpop ; byte   
      009CC2 97 14            [ 1]    1     ld a,(y)
      009CC4 93               [ 1]    2     ldw x,y 
      009CC4 90 F6            [ 2]    3     ldw x,(1,x)
      009CC6 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      009CCA A9               [ 1] 2259     ld a,xl 
      009CCB 00               [ 1] 2260 	push a 
      002213                       2261 	_xpop ; address 
      009CCC 03 C7            [ 1]    1     ld a,(y)
      009CCE 00               [ 1]    2     ldw x,y 
      009CCF 0D CF            [ 2]    3     ldw x,(1,x)
      009CD1 00 0E 90 F6      [ 2]    4     addw y,#CELL_SIZE 
      009CD5 93               [ 1] 2262 	pop a 
      009CD6 EE               [ 1] 2263 	ld (x),a 
      009CD7 01               [ 4] 2264 	ret 
                                   2265 
                                   2266 ;-----------------------
                                   2267 ; BASIC: PEEK(addr)
                                   2268 ; get the byte at addr 
                                   2269 ; input:
                                   2270 ;	none 
                                   2271 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2272 ;	X 		value 
                                   2273 ;-----------------------
      00221F                       2274 peek:
      009CD8 72 A9 00         [ 4] 2275 	call func_args
      009CDB 03 6B            [ 1] 2276 	cp a,#1 
      009CDD 01 7B            [ 1] 2277 	jreq 1$
      009CDF 02 A1 8A         [ 2] 2278 	jp syntax_error
      002229                       2279 1$: _xpop ; address  
      009CE2 27 10            [ 1]    1     ld a,(y)
      009CE4 93               [ 1]    2     ldw x,y 
      009CE4 7B 01            [ 2]    3     ldw x,(1,x)
      009CE6 CA 00 0D 02      [ 2]    4     addw y,#CELL_SIZE 
      009CEA CA 00 0E         [ 1] 2280 	ld farptr,a 
      009CED 02 CA 00         [ 2] 2281 	ldw ptr16,x 
      009CF0 0F 02 20 0E      [ 5] 2282 	ldf a,[farptr]
      009CF4 5F               [ 1] 2283 	clrw x 
      009CF4 7B               [ 1] 2284 	ld xl,a 
      009CF5 01               [ 1] 2285 	clr a 
      009CF6 C8               [ 4] 2286 	ret 
                                   2287 
                                   2288 ;---------------------------
                                   2289 ; BASIC IF expr : instructions
                                   2290 ; evaluate expr and if true 
                                   2291 ; execute instructions on same line. 
                                   2292 ;----------------------------
      002240                       2293 if: 
      009CF7 00 0D 02         [ 4] 2294 	call condition  
      002243                       2295 	_xpop 
      009CFA C8 00            [ 1]    1     ld a,(y)
      009CFC 0E               [ 1]    2     ldw x,y 
      009CFD 02 C8            [ 2]    3     ldw x,(1,x)
      009CFF 00 0F 02 72      [ 2]    4     addw y,#CELL_SIZE 
      009D03 A2               [ 1] 2296 	tnz  a  
      009D04 00 03            [ 1] 2297 	jrne 9$
      009D06 90               [ 2] 2298 	tnzw x 
      009D07 F7 90            [ 1] 2299 	jrne 9$  
                                   2300 ;skip to next line
      009D09 EF 01 20 99 A6   [ 1] 2301 	mov in,count
      002257                       2302 	_drop 2 
      009D0E 84 5B            [ 2]    1     addw sp,#2 
      009D10 02 81 47         [ 2] 2303 	jp next_line
      009D12 81               [ 4] 2304 9$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                           00000D  2318 	BPTR=13 ; baseptr saved
                           00000D  2319 	VSIZE=13  
      00225D                       2320 for: ; { -- var_addr }
      009D12 35               [ 2] 2321 	popw x ; call return address 
      00225E                       2322 	_vars VSIZE 
      009D13 10 00            [ 2]    1     sub sp,#VSIZE 
      009D15 0B               [ 2] 2323 	pushw x  ; RETL1 
      009D16 81 85            [ 1] 2324 	ld a,#TK_VAR 
      009D17 CD 19 B1         [ 4] 2325 	call expect
      009D17 35 0A 00         [ 4] 2326 	call get_addr
      009D1A 0B 81            [ 2] 2327 	ldw (CVAR,sp),x  ; control variable 
      009D1C CD 1C F3         [ 4] 2328 	call let_eval 
      009D1C 4F AE 16 68      [ 1] 2329 	bset flags,#FLOOP 
      009D20 72 B0 00         [ 4] 2330 	call next_token 
      009D23 33 81            [ 1] 2331 	cp a,#TK_CMD 
      009D25 27 03            [ 1] 2332 	jreq 1$
      009D25 3B 00 0B         [ 2] 2333 	jp syntax_error
      00227C                       2334 1$:  
      00227C                       2335 	_get_code_addr
      009D28 AE               [ 2]    1         ldw x,(x)
      009D29 9F 12 CD 89      [ 1]    2         inc in 
      009D2D DC CE 00 1C      [ 1]    3         inc in 
      009D31 35 10 00         [ 2] 2336 	cpw x,#to   
      009D34 0B CD            [ 1] 2337 	jreq to
      009D36 98 C3 32         [ 2] 2338 	jp syntax_error 
                                   2339 
                                   2340 ;-----------------------------------
                                   2341 ; BASIC: TO expr 
                                   2342 ; second part of FOR loop initilization
                                   2343 ; leave limit on stack and set 
                                   2344 ; FTO bit in 'flags'
                                   2345 ;-----------------------------------
      00228D                       2346 to: ; { var_addr -- var_addr limit step }
      009D39 00 0B AE 9F 24   [ 2] 2347 	btjt flags,#FLOOP,1$
      009D3E CD 89 DC         [ 2] 2348 	jp syntax_error
      009D41 CE 00 1E         [ 4] 2349 1$: call expression   
      009D44 72 B0            [ 1] 2350 	cp a,#TK_INTGR 
      009D46 00 1C            [ 1] 2351 	jreq 2$ 
      009D48 CD 98 C3         [ 2] 2352 	jp syntax_error
      00229F                       2353 2$: _xpop
      009D4B AE 9F            [ 1]    1     ld a,(y)
      009D4D 35               [ 1]    2     ldw x,y 
      009D4E CD 89            [ 2]    3     ldw x,(1,x)
      009D50 DC 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D52 6B 06            [ 1] 2354 	ld (LIMIT,sp),a 
      009D52 CD 9D            [ 2] 2355 	ldw (LIMIT+1,sp),x
      009D54 1C A6 03         [ 4] 2356 	call next_token
      009D57 62 CF            [ 1] 2357 	cp a,#TK_NONE  
      009D59 00 21            [ 1] 2358 	jreq 4$ 
      009D5B 4F 81            [ 1] 2359 	cp a,#TK_CMD
      009D5D 26 0E            [ 1] 2360 	jrne 3$
      0022B7                       2361 	_get_code_addr
      009D5D CD               [ 2]    1         ldw x,(x)
      009D5E 98 7B A1 85      [ 1]    2         inc in 
      009D62 27 0C A1 05      [ 1]    3         inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009D66 27 03 CC         [ 2] 2362 	cpw x,#step 
      009D69 97 14            [ 1] 2363 	jreq step
      009D6B                       2364 3$:	
      0022C5                       2365 	_unget_token   	 
      009D6B CD 9A 5F 20 03   [ 1]    1      mov in,in.saved  
      009D70                       2366 4$:	
      009D70 CD 98            [ 1] 2367 	clr (FSTEP,sp) 
      009D72 A3 00 01         [ 2] 2368 	ldw x,#1   ; default step  
      009D73 1F 04            [ 2] 2369 	ldw (FSTEP+1,sp),x 
      009D73 CF 00            [ 2] 2370 	jra store_loop_addr 
                                   2371 
                                   2372 
                                   2373 ;----------------------------------
                                   2374 ; BASIC: STEP expr 
                                   2375 ; optional third par of FOR loop
                                   2376 ; initialization. 	
                                   2377 ;------------------------------------
      0022D3                       2378 step: ; {var limit -- var limit step}
      009D75 1A CD 98 7B A1   [ 2] 2379 	btjt flags,#FLOOP,1$
      009D7A 32 27 03         [ 2] 2380 	jp syntax_error
      009D7D CC 97 14         [ 4] 2381 1$: call expression 
      009D80 A1 84            [ 1] 2382 	cp a,#TK_INTGR
      009D80 CD 9C            [ 1] 2383 	jreq 2$
      009D82 9E A1 84         [ 2] 2384 	jp syntax_error
      0022E5                       2385 2$:	
      0022E5                       2386 	_xpop 
      009D85 27 03            [ 1]    1     ld a,(y)
      009D87 CC               [ 1]    2     ldw x,y 
      009D88 97 14            [ 2]    3     ldw x,(1,x)
      009D8A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D8A 90 F6            [ 1] 2387 	ld (FSTEP,sp),a 
      009D8C 93 EE            [ 2] 2388 	ldw (FSTEP+1,sp),x ; step
                                   2389 ; if step < 0 decrement LIMIT 
      009D8E 01               [ 1] 2390 	tnz a
      009D8F 72 A9            [ 1] 2391 	jrpl store_loop_addr 
      009D91 00 03            [ 1] 2392 	ld a,(LIMIT,sp)
      009D93 1E 07            [ 2] 2393 	ldw x,(LIMIT+1,sp)
      009D93 72 C7 00         [ 2] 2394 	subw x,#1 
      009D96 1A 72            [ 1] 2395 	sbc a,#0 
      009D98 5C 00            [ 1] 2396 	ld (LIMIT,sp),a 
      009D9A 1B 72            [ 2] 2397 	ldw (LIMIT+1,sp),x 
                                   2398 ; leave loop back entry point on cstack 
                                   2399 ; cstack is 1 call deep from interpreter
      002302                       2400 store_loop_addr:
      009D9C CF 00 1A         [ 2] 2401 	ldw x,basicptr
      009D9F 81 0D            [ 2] 2402 	ldw (BPTR,sp),x 
      009DA0 CE 00 00         [ 2] 2403 	ldw x,in.w 
      009DA0 F6 A4            [ 2] 2404 	ldw (INW,sp),x   
      009DA2 0F A0 03 88      [ 1] 2405 	bres flags,#FLOOP 
      009DA6 4B 00 72 FB      [ 1] 2406 	inc loop_depth  
      009DAA 01               [ 4] 2407 	ret 
                                   2408 
                                   2409 ;--------------------------------
                                   2410 ; BASIC: NEXT var 
                                   2411 ; FOR loop control 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2412 ; increment variable with step 
                                   2413 ; and compare with limit 
                                   2414 ; loop if threshold not crossed.
                                   2415 ; else stack. 
                                   2416 ; and decrement 'loop_depth' 
                                   2417 ;--------------------------------
      002315                       2418 next: ; {var limit step retl1 -- [var limit step ] }
      009DAB F6 EE 01 5B      [ 1] 2419 	tnz loop_depth 
      009DAF 02 81            [ 1] 2420 	jrne 1$ 
      009DB1 CC 16 94         [ 2] 2421 	jp syntax_error 
      00231E                       2422 1$: 
      009DB1 AE 40            [ 1] 2423 	ld a,#TK_VAR 
      009DB3 00 35 08         [ 4] 2424 	call expect
      009DB6 00 0F A3         [ 4] 2425 	call get_addr 
                                   2426 ; check for good variable after NEXT 	 
      009DB9 47 F8            [ 2] 2427 	cpw x,(CVAR,sp)
      009DBB 24 17            [ 1] 2428 	jreq 2$  
      009DBD F6 26 0C         [ 2] 2429 	jp syntax_error ; not the good one 
      00232D                       2430 2$: 
      009DC0 5C 72 5A         [ 2] 2431 	ldw ptr16,x 
                                   2432 	; increment variable 
      009DC3 00               [ 1] 2433 	ld a,(x)
      009DC4 0F 26            [ 2] 2434 	ldw x,(1,x)  ; get var value 
      009DC6 F6 1D 00         [ 2] 2435 	addw x,(FSTEP+1,sp) ; var+step 
      009DC9 08 20            [ 1] 2436 	adc a,(FSTEP,sp)
      009DCB 09 F6 5C 4D      [ 4] 2437 	ld [ptr16],a
      009DCF 26 FB 5A 20      [ 1] 2438 	inc ptr8  
      009DD3 E0 5F 4F CF      [ 5] 2439 	ldw [ptr16],x 
      009DD7 00 25 81         [ 1] 2440 	ld acc24,a 
      009DDA CF 00 0D         [ 2] 2441 	ldw acc16,x 
      009DDA 90 89            [ 1] 2442 	ld a,(LIMIT,sp)
      009DDC 52 08            [ 2] 2443 	ldw x,(LIMIT+1,sp)
      009DDE 72 5F 00 0E      [ 2] 2444 	subw x,acc16 
      009DE2 6B 05 1F         [ 1] 2445 	sbc a,acc24
      009DE5 01 CE            [ 1] 2446 	xor a,(FSTEP,sp)
      009DE7 00 33            [ 1] 2447 	xor a,#0x80
      009DE9 1F 07            [ 1] 2448 	jrmi loop_back  
      009DEB 90 CE            [ 2] 2449 	jra loop_done   
                                   2450 ; check sign of STEP  
      009DED 00 31            [ 1] 2451 	ld a,(FSTEP,sp)
      009DEF 17 03            [ 1] 2452 	jrpl 4$
                                   2453 ;negative step
      009DF1 93 13 07         [ 1] 2454     ld a,acc8 
      009DF4 24 20            [ 1] 2455 	jrslt loop_back   
      009DF6 90 F6            [ 2] 2456 	jra loop_done  
      002368                       2457 4$: ; positive step
      009DF8 A4 0F 11 05 26   [ 2] 2458 	btjt acc8,#7,loop_done 
      00236D                       2459 loop_back:
      009DFD 09 90            [ 2] 2460 	ldw x,(BPTR,sp)
      009DFF 5C 1E 01         [ 2] 2461 	ldw basicptr,x 
      009E02 CD 94 1D 26 13   [ 2] 2462 	btjf flags,#FRUN,1$ 
      009E07 E6 02            [ 1] 2463 	ld a,(2,x)
      009E07 16 03 90         [ 1] 2464 	ld count,a
      009E0A F6 A4            [ 2] 2465 1$:	ldw x,(INW,sp)
      009E0C 0F C7 00         [ 2] 2466 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009E0F 0F               [ 4] 2467 	ret 
      002382                       2468 loop_done:
                                   2469 	; remove loop data from stack  
      009E10 72               [ 2] 2470 	popw x
      002383                       2471 	_drop VSIZE 
      009E11 B9 00            [ 2]    1     addw sp,#VSIZE 
      009E13 0E 20 D9 1F      [ 1] 2472 	dec loop_depth 
      009E16 FC               [ 2] 2473 	jp (x)
                                   2474 
                                   2475 ;----------------------------
                                   2476 ; called by goto/gosub
                                   2477 ; to get target line number 
                                   2478 ; output:
                                   2479 ;    x    line address 
                                   2480 ;---------------------------
      00238A                       2481 get_target_line:
      009E16 0F 03 0F         [ 4] 2482 	call next_token  
      009E19 04 84            [ 1] 2483 	cp a,#TK_INTGR
      009E1A 27 07            [ 1] 2484 	jreq get_target_line_addr 
      009E1A 1E 03            [ 1] 2485 	cp a,#TK_LABEL 
      009E1C 5B 08            [ 1] 2486 	jreq look_target_symbol 
      009E1E 90 85 81         [ 2] 2487 	jp syntax_error
                                   2488 ; the target is a line number 
                                   2489 ; search it. 
      009E21                       2490 get_target_line_addr:
      009E21 72 00            [ 2] 2491 	pushw y 
      009E23 00 23 05         [ 4] 2492 	call get_int24 ; line # 
      009E26 A6               [ 1] 2493 	clr a
      009E27 06 CC 97 16      [ 2] 2494 	ldw y,basicptr 
      009E2B 90 FE            [ 2] 2495 	ldw y,(y)
      009E2B 52 05            [ 2] 2496 	pushw y 
      009E2D A6 80            [ 2] 2497 	cpw x,(1,sp)
      0023A8                       2498 	_drop 2  
      009E2F 6B 05            [ 2]    1     addw sp,#2 
      009E31 0F 03            [ 1] 2499 	jrult 11$
      009E33 20               [ 1] 2500 	inc a 
      0023AD                       2501 11$: ; scan program for this line# 	
      009E34 10 0C 45         [ 4] 2502 	call search_lineno  
      009E35 5D               [ 2] 2503 	tnzw x ; 0| line# address 
      009E35 72 00            [ 1] 2504 	jrne 2$ 
      009E37 00 23            [ 1] 2505 	ld a,#ERR_NO_LINE 
      009E39 05 A6 06         [ 2] 2506 	jp tb_error 
      009E3C CC 97            [ 2] 2507 2$:	popw y  
      009E3E 16               [ 4] 2508 	ret 
                                   2509 
                                   2510 ; the GOTO|GOSUB target is a symbol.
                                   2511 ; output:
                                   2512 ;    X    line address|0 
      009E3F                       2513 look_target_symbol:
      009E3F 52 05            [ 2] 2514 	pushw y 
      009E41 0F               [ 2] 2515 	pushw x 
      009E42 03 0F 05         [ 4] 2516 	call skip_string 
      009E45 72 5F 00 0D      [ 1] 2517 	clr acc16 
      009E45 CD 98 7B A1      [ 2] 2518 	ldw y,txtbgn 
      009E49 03 27 03         [ 1] 2519 1$:	ld a,(3,y) ; first TK_ID on line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009E4C CC 97            [ 1] 2520 	cp a,#TK_LABEL 
      009E4E 14 1F            [ 1] 2521 	jreq 3$ 
      009E50 01 CD 94         [ 1] 2522 2$:	ld a,(2,y); line length 
      009E53 12 AB 05         [ 1] 2523 	ld acc8,a 
      009E56 6B 04 CD 98      [ 2] 2524 	addw y,acc16 ;point to next line 
      009E5A 94 7B 04 1E      [ 2] 2525 	cpw y,txtend 
      009E5E 01 CD            [ 1] 2526 	jrult 1$
      009E60 9D DA            [ 1] 2527 	ld a,#ERR_BAD_VALUE
      009E62 5D 27 05         [ 2] 2528 	jp tb_error 
      0023E5                       2529 3$: ; found a TK_LABEL 
                                   2530 	; compare with GOTO|GOSUB target 
      009E65 A6 08            [ 2] 2531 	pushw y ; line address 
      009E67 CC 97 16 CE      [ 2] 2532 	addw y,#4 ; label string 
      009E6B 00 33            [ 2] 2533 	ldw x,(3,sp) ; target string 
      009E6D 7B 04 1A         [ 4] 2534 	call strcmp
      009E70 05 F7            [ 1] 2535 	jrne 4$
      009E72 5C 90            [ 2] 2536 	popw y 
      009E74 89 16            [ 2] 2537 	jra 2$ 
      0023F6                       2538 4$: ; target found 
      009E76 03               [ 2] 2539 	popw x ;  address line target  
      0023F7                       2540 	_drop 2 ; target string 
      009E77 CD 94            [ 2]    1     addw sp,#2 
      009E79 2E 90            [ 2] 2541 	popw y 
      009E7B 85               [ 4] 2542 	ret
                                   2543 
                                   2544 
                                   2545 ;--------------------------------
                                   2546 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2547 ; selective goto or gosub 
                                   2548 ;--------------------------------
      0023FC                       2549 cmd_on:
      009E7C 5A 72 FB 03 CF   [ 2] 2550 	btjt flags,#FRUN,0$ 
      009E81 00 33            [ 1] 2551 	ld a,#ERR_RUN_ONLY
      009E83 1D 00 03         [ 2] 2552 	jp tb_error 
      009E86 7F 6F 01         [ 4] 2553 0$:	call expression 
      009E89 6F 02            [ 1] 2554 	cp a,#TK_INTGR
      009E8B CD 98            [ 1] 2555 	jreq 1$
      009E8D 7B A1 08         [ 2] 2556 	jp syntax_error
      002410                       2557 1$: _xpop
      009E90 27 B3            [ 1]    1     ld a,(y)
      009E92 A1               [ 1]    2     ldw x,y 
      009E93 32 26            [ 2]    3     ldw x,(1,x)
      009E95 2A CD 9C 9E      [ 2]    4     addw y,#CELL_SIZE 
                                   2558 ; the selector is the element indice 
                                   2559 ; in the list of arguments. {1..#elements} 
      009E99 A1               [ 1] 2560 	ld a,xl ; keep only bits 7..0
      009E9A 84 27            [ 1] 2561 	jreq 9$ ; element # begin at 1. 
      009E9C 03               [ 1] 2562 	push a  ; selector  
      009E9D CC 97 14         [ 4] 2563 	call next_token
      009EA0 CE 00            [ 1] 2564 	cp a,#TK_CMD 
      009EA2 33 1D            [ 1] 2565 	jreq 2$ 
      009EA4 00 03 CF         [ 2] 2566 	jp syntax_error 
      002427                       2567 2$: _get_code_addr
      009EA7 00               [ 2]    1         ldw x,(x)
      009EA8 1A 90 F6 93      [ 1]    2         inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009EAC EE 01 72 A9      [ 1]    3         inc in 
                                   2568 ;; must be a GOTO or GOSUB 
      009EB0 00 03 72         [ 2] 2569 	cpw x,#goto 
      009EB3 C7 00            [ 1] 2570 	jreq 4$
      009EB5 1A 72 5C         [ 2] 2571 	cpw x,#gosub 
      009EB8 00 1B            [ 1] 2572 	jreq 4$ 
      009EBA 72 CF 00         [ 2] 2573 	jp syntax_error 
      00243D                       2574 4$: 
      009EBD 1A               [ 1] 2575 	pop a 
      009EBE 20               [ 2] 2576 	pushw x ; save routine address 	
      009EBF CB               [ 1] 2577 	push a  ; selector  
      009EC0                       2578 5$: ; skip elements in list until selector==0 
      009EC0 55 00            [ 1] 2579 	dec (1,sp)
      009EC2 04 00            [ 1] 2580 	jreq 6$ 
                                   2581 ; can be a line# or a label 
      009EC4 02 5B 05         [ 4] 2582 	call next_token 
      009EC7 CD 9D            [ 1] 2583 	cp a,#TK_INTGR 
      009EC9 52 81            [ 1] 2584 	jreq 52$
      009ECB A1 03            [ 1] 2585 	cp a,#TK_LABEL 
      009ECB CE 00            [ 1] 2586 	jreq 54$
      009ECD 1E 72 B0         [ 2] 2587 	jp syntax_error 
      002452                       2588 52$: ; got a line number 
      009ED0 00 1C 81         [ 1] 2589 	ld a,in ; skip over int24 value 
      009ED3 AB 03            [ 1] 2590 	add a,#CELL_SIZE ; integer size  
      009ED3 AE 9F 12         [ 1] 2591 	ld in,a 
      009ED6 CD 89            [ 2] 2592 	jra 56$
      009ED8 DC CE 00         [ 4] 2593 54$: call skip_string ; skip over label 	
      00245F                       2594 56$: ; if another element comma present 
      009EDB 1C 35 10         [ 4] 2595 	call next_token
      009EDE 00 0B            [ 1] 2596 	cp a,#TK_COMMA 
      009EE0 CD 98            [ 1] 2597 	jreq 5$ 
                                   2598 ; arg list exhausted, selector to big 
                                   2599 ; continue execution on next line 
      002466                       2600 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EE2 C3 35            [ 2]    1     addw sp,#3 
      009EE4 0A 00            [ 2] 2601 	jra 9$
      00246A                       2602 6$: ;at selected position  
      00246A                       2603 	_drop 1 ; discard selector
      009EE6 0B AE            [ 2]    1     addw sp,#1 
                                   2604 ; here only the routine address 
                                   2605 ; of GOTO|GOSUB is on stack 
      009EE8 9F 24 CD         [ 4] 2606     call get_target_line
      009EEB 89 DC CD         [ 2] 2607 	ldw ptr16,x 	
      009EEE 9E CB CD 98 C3   [ 1] 2608 	mov in,count ; move to end of line  
      009EF3 AE               [ 2] 2609 	popw x ; cmd address, GOTO||GOSUB 
      009EF4 9F 35 CD         [ 2] 2610 	cpw x,#goto 
      009EF7 89 DC            [ 1] 2611 	jrne 7$ 
      009EF9 CE 00 1C         [ 2] 2612 	ldw x,ptr16 
      009EFC A3 B9            [ 2] 2613 	jra jp_to_target
      002482                       2614 7$: 
      009EFE 04 25            [ 2] 2615 	jra gosub_2 ; target in ptr16 
      002484                       2616 9$: ; expr out of range skip to end of line
                                   2617     ; this will force a fall to next line  
      009F00 05 AE 9F 3C 20   [ 1] 2618 	mov in,count
      002489                       2619 	_drop 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009F05 03 AE            [ 2]    1     addw sp,#2 
      009F07 9F 4D CD         [ 2] 2620 	jp next_line  
                                   2621 
                                   2622 
                                   2623 ;------------------------
                                   2624 ; BASIC: GOTO line# 
                                   2625 ; jump to line# 
                                   2626 ; here cstack is 2 call deep from interpreter 
                                   2627 ;------------------------
      00248E                       2628 goto:
      009F0A 89 DC A6 0D CD   [ 2] 2629 	btjt flags,#FRUN,goto_1  
      009F0F 89 7F            [ 1] 2630 	ld a,#ERR_RUN_ONLY
      009F11 81 70 72         [ 2] 2631 	jp tb_error 
      002498                       2632 goto_1:
      009F14 6F 67 72         [ 4] 2633 	call get_target_line
      00249B                       2634 jp_to_target:
      009F17 61 6D 20         [ 2] 2635 	ldw basicptr,x 
      009F1A 61 64            [ 1] 2636 	ld a,(2,x)
      009F1C 64 72 65         [ 1] 2637 	ld count,a 
      009F1F 73 73 3A 20      [ 1] 2638 	mov in,#3 
      009F23 00               [ 4] 2639 	ret 
                                   2640 
                                   2641 
                                   2642 ;--------------------
                                   2643 ; BASIC: GOSUB line#
                                   2644 ; basic subroutine call
                                   2645 ; actual line# and basicptr 
                                   2646 ; are saved on cstack
                                   2647 ; here cstack is 2 call deep from interpreter 
                                   2648 ;--------------------
                           000001  2649 	RET_ADDR=1 ; subroutine return address 
                           000003  2650 	RET_BPTR=3 ; basicptr return point 
                           000005  2651 	RET_INW=5  ; in.w return point 
                           000004  2652 	VSIZE=4 
      0024A8                       2653 gosub:
      009F24 2C 20 70 72 6F   [ 2] 2654 	btjt flags,#FRUN,gosub_1 
      009F29 67 72            [ 1] 2655 	ld a,#ERR_RUN_ONLY
      009F2B 61 6D 20         [ 2] 2656 	jp tb_error 
      009F2E 73               [ 4] 2657 	ret 
      0024B3                       2658 gosub_1:
      009F2F 69 7A 65         [ 4] 2659 	call get_target_line 
      009F32 3A 20 00         [ 2] 2660 	ldw ptr16,x
      0024B9                       2661 gosub_2: 
      009F35 20               [ 2] 2662 	popw x 
      0024BA                       2663 	_vars VSIZE  
      009F36 62 79            [ 2]    1     sub sp,#VSIZE 
      009F38 74               [ 2] 2664 	pushw x ; RET_ADDR 
                                   2665 ; save BASIC subroutine return point.   
      009F39 65 73 00         [ 2] 2666 	ldw x,basicptr
      009F3C 20 69            [ 2] 2667 	ldw (RET_BPTR,sp),x 
      009F3E 6E 20 46         [ 2] 2668 	ldw x,in.w 
      009F41 4C 41            [ 2] 2669 	ldw (RET_INW,sp),x
      009F43 53 48 20         [ 2] 2670 	ldw x,ptr16  
      009F46 6D 65            [ 2] 2671 	jra jp_to_target
                                   2672 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2673 ;------------------------
                                   2674 ; BASIC: RETURN 
                                   2675 ; exit from BASIC subroutine 
                                   2676 ;------------------------
      0024CC                       2677 return:
      009F48 6D 6F 72 79 00   [ 2] 2678 	btjt flags,#FRUN,0$ 
      009F4D 20 69            [ 1] 2679 	ld a,#ERR_RUN_ONLY
      009F4F 6E 20 52         [ 2] 2680 	jp tb_error 
      0024D6                       2681 0$:	
      009F52 41 4D            [ 2] 2682 	ldw x,(RET_BPTR,sp) 
      009F54 20 6D 65         [ 2] 2683 	ldw basicptr,x
      009F57 6D 6F            [ 1] 2684 	ld a,(2,x)
      009F59 72 79 00         [ 1] 2685 	ld count,a  
      009F5C 1E 05            [ 2] 2686 	ldw x,(RET_INW,sp)
      009F5C 72 01 00         [ 2] 2687 	ldw in.w,x 
      009F5F 23               [ 2] 2688 	popw x 
      0024E6                       2689 	_drop VSIZE 
      009F60 05 A6            [ 2]    1     addw sp,#VSIZE 
      009F62 07               [ 2] 2690 	jp (x)
                                   2691 
                                   2692 
                                   2693 ;---------------------------------
                                   2694 ; check if A:X contain the address 
                                   2695 ; of a program in FLASH 
                                   2696 ; output:
                                   2697 ;     Z    set is progam 
                                   2698 ;----------------------------------
      0024E9                       2699 is_program_addr:
      009F63 CC               [ 1] 2700 	tnz a 
      009F64 97 16            [ 1] 2701 	jrne 9$
      009F66 A3 38 80         [ 2] 2702 	cpw x,#app_space 
      009F66 CD 9E            [ 1] 2703 	jrult 8$
      009F68 CB               [ 2] 2704 	pushw x 
      009F69 22 01 81         [ 4] 2705 	call qsign 
      009F6C 52               [ 2] 2706 	popw x 
      009F6D 06 CE            [ 1] 2707 	jreq 9$ 
      009F6F 00               [ 1] 2708 8$:	cpl a ; clr Z bit  
      009F70 1C               [ 4] 2709 9$:	ret 
                                   2710 
                                   2711 ;----------------------------------
                                   2712 ; BASIC: RUN [label]
                                   2713 ; run BASIC program in RAM
                                   2714 ;----------------------------------- 
      0024FA                       2715 cmd_run: 
      009F71 1F 05 FE 1F 01   [ 2] 2716 	btjf flags,#FRUN,0$  
      009F76 AE               [ 1] 2717 	clr a 
      009F77 7F               [ 4] 2718 	ret
      002501                       2719 0$: ; check for STOP condition 
      009F78 FF 1F 03 CD 98   [ 2] 2720 	btjf flags,#FBREAK,1$
      002506                       2721 	_drop 2 
      009F7D 7B A1            [ 2]    1     addw sp,#2 
      009F7F 84 27 0B         [ 4] 2722 	call rest_context
      009F82                       2723 	_drop CTXT_SIZE 
      009F82 A1 11            [ 2]    1     addw sp,#CTXT_SIZE 
      009F84 27 27 55 00      [ 1] 2724 	bres flags,#FBREAK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009F88 04 00 02 20      [ 1] 2725 	bset flags,#FRUN 
      009F8C 33 17 3F         [ 2] 2726 	jp interpreter 
      009F8D                       2727 1$:	; check for label option 
      009F8D CD 98 AD         [ 4] 2728 	call next_token 
      009F90 1F 01            [ 1] 2729 	cp a,#TK_LABEL 
      009F92 26 1F            [ 1] 2730 	jrne 3$
      009F92 90               [ 2] 2731 	pushw x 
      009F93 89 4F CD         [ 4] 2732 	call skip_string 
      009F96 8C               [ 2] 2733 	popw x  
      009F97 C5 5D 26         [ 4] 2734 	call search_program
      009F9A 01 93            [ 1] 2735 	jrne 2$
      009F9C 90 85            [ 1] 2736 	ld a,#ERR_NO_PROGRAM
      009F9E 1F 05 CD         [ 2] 2737 	jp tb_error 
      009FA1 98 7B A1         [ 2] 2738 2$: ldw txtbgn,x 
      009FA4 11 27 06         [ 2] 2739 	subw x,#2 
      009FA7 1E               [ 2] 2740 	ldw x,(x)
      009FA8 01 1F 03 20      [ 2] 2741 	addw x,txtbgn 
      009FAC 13 00 1D         [ 2] 2742 	ldw txtend,x 
      009FAD 20 19            [ 2] 2743 	jra run_it 	
      00253E                       2744 3$:	_unget_token 
      009FAD CD 98 7B A1 84   [ 1]    1      mov in,in.saved  
      009FB2 27 07 55         [ 2] 2745 	ldw x,txtbgn
      009FB5 00 04 00         [ 2] 2746 	cpw x,txtend 
      009FB8 02 20            [ 1] 2747 	jrmi run_it 
      009FBA 05 15 EB         [ 2] 2748 	ldw x,#err_no_prog
      009FBB CD 09 5C         [ 4] 2749 	call puts 
      009FBB CD 98 AD 1F 03   [ 1] 2750 	mov in,count
      009FC0 81               [ 4] 2751 	ret 
      002557                       2752 run_it:	 
      002557                       2753 	_drop 2 ; drop return address 
      009FC0 1E 05            [ 2]    1     addw sp,#2 
      002559                       2754 run_it_02: 
      009FC2 E6 02 CD         [ 4] 2755     call ubound 
      009FC5 A0 31 1E         [ 4] 2756 	call clear_vars
                                   2757 ; initialize DIM variables pointers 
      009FC8 05 E6 02         [ 2] 2758 	ldw x,txtend 
      009FCB C7 00 0F         [ 2] 2759 	ldw dvar_bgn,x 
      009FCE 72 5F 00         [ 2] 2760 	ldw dvar_end,x 	 
                                   2761 ; clear data pointer 
      009FD1 0E               [ 1] 2762 	clrw x 
      009FD2 72 BB 00         [ 2] 2763 	ldw data_ptr,x 
      009FD5 0E C3 00 1E      [ 1] 2764 	clr data_ofs 
      009FD9 2A 07 1F 05      [ 1] 2765 	clr data_len 
                                   2766 ; initialize BASIC pointer 
      009FDD FE 13 03         [ 2] 2767 	ldw x,txtbgn 
      009FE0 2D DE 04         [ 2] 2768 	ldw basicptr,x 
      009FE2 E6 02            [ 1] 2769 	ld a,(2,x)
      009FE2 55 00 03         [ 1] 2770 	ld count,a
      009FE5 00 02 AE 16      [ 1] 2771 	mov in,#3	
      009FE9 B8 CF 00 05      [ 1] 2772 	bset flags,#FRUN 
      009FED 5B 06 CD         [ 2] 2773 	jp interpreter 
                                   2774 
                                   2775 
                                   2776 ;----------------------
                                   2777 ; BASIC: END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   2778 ; end running program
                                   2779 ;---------------------- 
                           000001  2780 	CHAIN_BP=1 
                           000003  2781 	CHAIN_IN=3
                           000005  2782 	CHAIN_TXTBGN=5
                           000007  2783 	CHAIN_TXTEND=7
                           000008  2784 	CHAIN_CNTX_SIZE=8  
      00258A                       2785 cmd_end: 
      00258A                       2786 	_drop 2 ; no need for return address 
      009FF0 9E D3            [ 2]    1     addw sp,#2 
                                   2787 ; check for chained program 
      009FF2 81 5D 00 34      [ 1] 2788 	tnz chain_level
      009FF3 27 1D            [ 1] 2789 	jreq 8$
                                   2790 ; restore chain context 
      009FF3 A6 03 CD 9A      [ 1] 2791 	dec chain_level 
      009FF7 31 89            [ 2] 2792 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      009FF9 CD 98 94         [ 2] 2793 	ldw basicptr,x 
      009FFC 85 CD            [ 2] 2794 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      009FFE B2 7A 26         [ 2] 2795 	ldw in,x 
      00A001 06 AE            [ 2] 2796 	ldw x,(CHAIN_TXTBGN,sp)
      00A003 00 12 CC         [ 2] 2797 	ldw txtbgn,x 
      00A006 97 16            [ 2] 2798 	ldw x,(CHAIN_TXTEND,sp)
      00A008 90 89 90         [ 2] 2799 	ldw txtend,x 
      0025AA                       2800 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A00B 93 1D            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A00D 00 04 EE         [ 2] 2801 	jp interpreter 
      0025AF                       2802 8$: ; clean stack 
      00A010 02 1C 00         [ 2] 2803 	ldw x,#STACK_EMPTY
      00A013 04               [ 1] 2804 	ldw sp,x 
      00A014 CF 00 0E         [ 2] 2805 	jp warm_start
                                   2806 
                                   2807 ;---------------------------
                                   2808 ; BASIC: GET var 
                                   2809 ; receive a key in variable 
                                   2810 ; don't wait 
                                   2811 ;---------------------------
      0025B6                       2812 cmd_get:
      00A017 AE 00 8C         [ 4] 2813 	call next_token 
      00A01A 72 A2            [ 1] 2814 	cp a,#TK_VAR 
      00A01C 00 04            [ 1] 2815 	jreq 0$
      00A01E CD 94 3E         [ 2] 2816 	jp syntax_error 
      00A021 AE 00 90         [ 4] 2817 0$: call get_addr 
      00A024 CF 00 1C         [ 2] 2818 	ldw ptr16,x 
      00A027 72 BB 00         [ 4] 2819 	call qgetc 
      00A02A 8E CF            [ 1] 2820 	jreq 2$
      00A02C 00 1E 90         [ 4] 2821 	call getc  
      00A02F 85 81 00 19      [ 4] 2822 2$: clr [ptr16]
      00A031 72 5C 00 1A      [ 1] 2823 	inc ptr8 
      00A031 90 89 C7 00      [ 4] 2824 	clr [ptr16]
      00A035 03 E6 02 C1      [ 1] 2825 	inc ptr8 
      00A039 00 03 2A 03      [ 4] 2826 	ld [ptr16],a 
      00A03D C7               [ 4] 2827 	ret 
                                   2828 
                                   2829 
                                   2830 ;-----------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2831 ; 1 Khz beep 
                                   2832 ;-----------------
      0025E3                       2833 beep_1khz:: 
      00A03E 00 03            [ 2] 2834 	pushw y 
      00A040 CF 00 05         [ 2] 2835 	ldw x,#100
      00A043 90 AE 16 68      [ 2] 2836 	ldw y,#1000
      00A047 CD 92            [ 2] 2837 	jra beep
                                   2838 
                                   2839 ;-----------------------
                                   2840 ; BASIC: TONE expr1,expr2
                                   2841 ; used TIMER2 channel 1
                                   2842 ; to produce a tone 
                                   2843 ; arguments:
                                   2844 ;    expr1   frequency 
                                   2845 ;    expr2   duration msec.
                                   2846 ;---------------------------
      0025EE                       2847 tone:
      00A049 2E CD            [ 2] 2848 	pushw y 
      00A04B 89 DC A6         [ 4] 2849 	call arg_list 
      00A04E 0D CD            [ 1] 2850 	cp a,#2 
      00A050 89 7F            [ 1] 2851 	jreq 1$
      00A052 90 85 81         [ 2] 2852 	jp syntax_error 
      00A055                       2853 1$: 
      0025FA                       2854 	_xpop 
      00A055 52 01            [ 1]    1     ld a,(y)
      00A057 93               [ 1]    2     ldw x,y 
      00A057 0F 01            [ 2]    3     ldw x,(1,x)
      00A059 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A059 CD               [ 2] 2855 	pushw x ; duration 
      002604                       2856 	_xpop ; frequency
      00A05A 98 7B            [ 1]    1     ld a,(y)
      00A05C A1               [ 1]    2     ldw x,y 
      00A05D 02 25            [ 2]    3     ldw x,(1,x)
      00A05F 08 A1 0A 27      [ 2]    4     addw y,#CELL_SIZE 
      00A063 04 A1            [ 1] 2857 	ldw y,x ; frequency 
      00A065 80               [ 2] 2858 	popw x  ; duration 
      002610                       2859 beep:  
      00A066 26               [ 2] 2860 	pushw x 
      00A067 07 F4 24         [ 2] 2861 	ldw x,#TIM2_CLK_FREQ
      00A068 65               [ 2] 2862 	divw x,y ; cntr=Fclk/freq 
                                   2863 ; round to nearest integer 
      00A068 55 00 04 00      [ 2] 2864 	cpw y,#TIM2_CLK_FREQ/2
      00A06C 02 20            [ 1] 2865 	jrmi 2$
      00A06E 63               [ 1] 2866 	incw x 
      00A06F                       2867 2$:	 
      00A06F A1               [ 1] 2868 	ld a,xh 
      00A070 02 27 12         [ 1] 2869 	ld TIM2_ARRH,a 
      00A073 A1               [ 1] 2870 	ld a,xl 
      00A074 04 27 1B         [ 1] 2871 	ld TIM2_ARRL,a 
                                   2872 ; 50% duty cycle 
      00A077 A1               [ 1] 2873 	ccf 
      00A078 82               [ 2] 2874 	rrcw x 
      00A079 27               [ 1] 2875 	ld a,xh 
      00A07A 1F A1 08         [ 1] 2876 	ld TIM2_CCR1H,a 
      00A07D 27               [ 1] 2877 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A07E 2A A1 09         [ 1] 2878 	ld TIM2_CCR1L,a
      00A081 27 2A 20 3D      [ 1] 2879 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A085 72 10 53 00      [ 1] 2880 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A085 CD 89 DC 5C      [ 1] 2881 	bset TIM2_EGR,#TIM2_EGR_UG
      00A089 72               [ 2] 2882 	popw x 
      00A08A B0 00 05         [ 4] 2883 	call pause02
      00A08D CF 00 01 20      [ 1] 2884 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A091 C5 11 53 00      [ 1] 2885 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A092 90 85            [ 2] 2886 	popw y 
      00A092 CD               [ 4] 2887 	ret 
                                   2888 
                                   2889 ;-------------------------------
                                   2890 ; BASIC: ADCON 0|1 [,divisor]  
                                   2891 ; disable/enanble ADC 
                                   2892 ;-------------------------------
                           000003  2893 	ONOFF=3 
                           000001  2894 	DIVSOR=1
                           000004  2895 	VSIZE=4 
      002649                       2896 power_adc:
      00A093 98 BD CD         [ 4] 2897 	call arg_list 
      00A096 89 7F            [ 1] 2898 	cp a,#2	
      00A098 20 BD            [ 1] 2899 	jreq 1$
      00A09A A1 01            [ 1] 2900 	cp a,#1 
      00A09A FE 72            [ 1] 2901 	jreq 0$ 
      00A09C 5C 00 02         [ 2] 2902 	jp syntax_error 
      00A09F 72               [ 1] 2903 0$:	clr a 
      00A0A0 5C               [ 1] 2904 	clrw x
      002659                       2905 	_xpush   ; divisor  
      00A0A1 00 02 FD CD      [ 2]    1     subw y,#CELL_SIZE
      00A0A5 89 7F            [ 1]    2     ld (y),a 
      00A0A7 20 AE 01         [ 2]    3     ldw (1,y),x 
      00A0A9                       2906 1$: _at_next 
      00A0A9 03 01 20         [ 1]    1     ld a,(3,y)
      00A0AC AC               [ 1]    2     ldw x,y 
      00A0AD EE 04            [ 2]    3     ldw x,(4,x)
      00A0AD CD               [ 2] 2907 	tnzw x 
      00A0AE 98 7B            [ 1] 2908 	jreq 2$ 
      00266B                       2909 	_xpop
      00A0B0 A1 84            [ 1]    1     ld a,(y)
      00A0B2 27               [ 1]    2     ldw x,y 
      00A0B3 03 CC            [ 2]    3     ldw x,(1,x)
      00A0B5 97 14 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0B7                       2910 	_xdrop  
      00A0B7 CD 98 AD 9F      [ 2]    1     addw y,#CELL_SIZE 
      00A0BB A4               [ 1] 2911 	ld a,xl
      00A0BC 0F C7            [ 1] 2912 	and a,#7
      00A0BE 00               [ 1] 2913 	swap a 
      00A0BF 24 20 95         [ 1] 2914 	ld ADC_CR1,a
      00A0C2 72 16 50 CA      [ 1] 2915 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0C2 55 00 04 00      [ 1] 2916 	bset ADC_CR1,#ADC_CR1_ADON 
      002687                       2917 	_usec_dly 7 
      00A0C6 02 CD 9C         [ 2]    1     ldw x,#(16*7-2)/4
      00A0C9 9E               [ 2]    2     decw x
      00A0CA 4D               [ 1]    3     nop 
      00A0CB 27 05            [ 1]    4     jrne .-4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A0CD CD 98            [ 2] 2918 	jra 3$
      00A0CF E8 20 85 01      [ 1] 2919 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0D2 72 17 50 CA      [ 1] 2920 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002698                       2921 3$:	
      00A0D2 0D               [ 4] 2922 	ret
                                   2923 
                                   2924 ;-----------------------------
                                   2925 ; BASIC: ADCREAD (channel)
                                   2926 ; read adc channel {0..5}
                                   2927 ; output:
                                   2928 ;   A 		TK_INTGR 
                                   2929 ;   X 		value 
                                   2930 ;-----------------------------
      002699                       2931 analog_read:
      00A0D3 01 26 05         [ 4] 2932 	call func_args 
      00A0D6 A6 0D            [ 1] 2933 	cp a,#1 
      00A0D8 CD 89            [ 1] 2934 	jreq 1$
      00A0DA 7F 5B 01         [ 2] 2935 	jp syntax_error
      0026A3                       2936 1$: _xpop 
      00A0DD 81 F6            [ 1]    1     ld a,(y)
      00A0DE 93               [ 1]    2     ldw x,y 
      00A0DE CE 00            [ 2]    3     ldw x,(1,x)
      00A0E0 05 1F 03 C6      [ 2]    4     addw y,#CELL_SIZE 
      00A0E4 00 02 6B         [ 2] 2937 	cpw x,#5 
      00A0E7 05 C6            [ 2] 2938 	jrule 2$
      00A0E9 00 03            [ 1] 2939 	ld a,#ERR_BAD_VALUE
      00A0EB 6B 06 81         [ 2] 2940 	jp tb_error 
      00A0EE 9F               [ 1] 2941 2$: ld a,xl
      00A0EE 1E 03 CF         [ 1] 2942 	ld acc8,a 
      00A0F1 00 05            [ 1] 2943 	ld a,#5
      00A0F3 7B 05 C7         [ 1] 2944 	sub a,acc8 
      00A0F6 00 02 7B         [ 1] 2945 	ld ADC_CSR,a
      00A0F9 06 C7 00 03      [ 1] 2946 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0FD 81 10 54 01      [ 1] 2947 	bset ADC_CR1,#ADC_CR1_ADON
      00A0FE 72 0F 54 00 FB   [ 2] 2948 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0FE 90 89 52         [ 2] 2949 	ldw x,ADC_DRH
      00A101 05 84            [ 1] 2950 	ld a,#TK_INTGR
      00A102 81               [ 4] 2951 	ret 
                                   2952 
                                   2953 ;-----------------------
                                   2954 ; BASIC: DREAD(pin)
                                   2955 ; Arduino pins 
                                   2956 ; read state of a digital pin 
                                   2957 ; pin# {0..15}
                                   2958 ; output:
                                   2959 ;    A 		TK_INTGR
                                   2960 ;    X      0|1 
                                   2961 ;-------------------------
                           000001  2962 	PINNO=1
                           000001  2963 	VSIZE=1
      0026D5                       2964 digital_read:
      0026D5                       2965 	_vars VSIZE 
      00A102 0F 05            [ 2]    1     sub sp,#VSIZE 
      00A104 CD 98 7B         [ 4] 2966 	call func_args
      00A107 A1 02            [ 1] 2967 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A109 26 10            [ 1] 2968 	jreq 1$
      00A10B CD 89 DC         [ 2] 2969 	jp syntax_error
      0026E1                       2970 1$: _xpop 
      00A10E 5C 72            [ 1]    1     ld a,(y)
      00A110 B0               [ 1]    2     ldw x,y 
      00A111 00 05            [ 2]    3     ldw x,(1,x)
      00A113 CF 00 01 03      [ 2]    4     addw y,#CELL_SIZE 
      00A117 05 CD 98         [ 2] 2971 	cpw x,#15 
      00A11A 7B A1            [ 2] 2972 	jrule 2$
      00A11C 85 27            [ 1] 2973 	ld a,#ERR_BAD_VALUE
      00A11E 03 CC 97         [ 2] 2974 	jp tb_error 
      00A121 14 CD 98         [ 4] 2975 2$:	call select_pin 
      00A124 A3 CF            [ 1] 2976 	ld (PINNO,sp),a
      00A126 00 1A            [ 1] 2977 	ld a,(GPIO_IDR,x)
      00A128 0D 05            [ 1] 2978 	tnz (PINNO,sp)
      00A12A 26 06            [ 1] 2979 	jreq 8$
      00A12C CD               [ 1] 2980 3$: srl a 
      00A12D 92 24            [ 1] 2981 	dec (PINNO,sp)
      00A12F CD 89            [ 1] 2982 	jrne 3$ 
      00A131 7F 01            [ 1] 2983 8$: and a,#1 
      00A132 5F               [ 1] 2984 	clrw x 
      00A132 A6               [ 1] 2985 	ld xl,a 
      00A133 3A               [ 1] 2986 	clr a 
      002709                       2987 	_drop VSIZE
      00A134 CD 89            [ 2]    1     addw sp,#VSIZE 
      00A136 7F               [ 4] 2988 	ret
                                   2989 
                                   2990 
                                   2991 ;-----------------------
                                   2992 ; BASIC: DWRITE pin,0|1
                                   2993 ; Arduino pins 
                                   2994 ; write to a digital pin 
                                   2995 ; pin# {0..15}
                                   2996 ; output:
                                   2997 ;    A 		TK_INTGR
                                   2998 ;    X      0|1 
                                   2999 ;-------------------------
                           000001  3000 	PINNO=1
                           000002  3001 	PINVAL=2
                           000002  3002 	VSIZE=2
      00270C                       3003 digital_write:
      00270C                       3004 	_vars VSIZE 
      00A137 CD A0            [ 2]    1     sub sp,#VSIZE 
      00A139 DE 72 5F         [ 4] 3005 	call arg_list  
      00A13C 00 03            [ 1] 3006 	cp a,#2 
      00A13E CD 8A            [ 1] 3007 	jreq 1$
      00A140 E1 AE 16         [ 2] 3008 	jp syntax_error
      002718                       3009 1$: _xpop 
      00A143 68 3B            [ 1]    1     ld a,(y)
      00A145 00               [ 1]    2     ldw x,y 
      00A146 03 4B            [ 2]    3     ldw x,(1,x)
      00A148 00 72 FB 01      [ 2]    4     addw y,#CELL_SIZE 
      00A14C 5C               [ 1] 3010 	ld a,xl 
      00A14D 5B 02            [ 1] 3011 	ld (PINVAL,sp),a
      002724                       3012 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A14F 72 5F            [ 1]    1     ld a,(y)
      00A151 00               [ 1]    2     ldw x,y 
      00A152 02 CD            [ 2]    3     ldw x,(1,x)
      00A154 8F 6E A1 84      [ 2]    4     addw y,#CELL_SIZE 
      00A158 27 14 A1         [ 2] 3013 	cpw x,#15 
      00A15B 11 26            [ 2] 3014 	jrule 2$
      00A15D 07 CD            [ 1] 3015 	ld a,#ERR_BAD_VALUE
      00A15F 8F 6E A1         [ 2] 3016 	jp tb_error 
      00A162 84 27 06         [ 4] 3017 2$:	call select_pin 
      00A165 6B 01            [ 1] 3018 	ld (PINNO,sp),a 
      00A165 CD A0            [ 1] 3019 	ld a,#1
      00A167 EE CC            [ 1] 3020 	tnz (PINNO,sp)
      00A169 97 14            [ 1] 3021 	jreq 4$
      00A16B 48               [ 1] 3022 3$: sll a
      00A16B CD 82            [ 1] 3023 	dec (PINNO,sp)
      00A16D 9D FB            [ 1] 3024 	jrne 3$
      00A16E 0D 02            [ 1] 3025 4$: tnz (PINVAL,sp)
      00A16E C6 00            [ 1] 3026 	jrne 5$
      00A170 0D               [ 1] 3027 	cpl a 
      00A171 CE 00            [ 1] 3028 	and a,(GPIO_ODR,x)
      00A173 0E 72            [ 2] 3029 	jra 8$
      00A175 C7 00            [ 1] 3030 5$: or a,(GPIO_ODR,x)
      00A177 1A 72            [ 1] 3031 8$: ld (GPIO_ODR,x),a 
      002754                       3032 	_drop VSIZE 
      00A179 5C 00            [ 2]    1     addw sp,#VSIZE 
      00A17B 1B               [ 4] 3033 	ret
                                   3034 
                                   3035 
                                   3036 ;-----------------------
                                   3037 ; BASIC: STOP
                                   3038 ; stop progam execution  
                                   3039 ; without resetting pointers 
                                   3040 ; the program is resumed
                                   3041 ; with RUN 
                                   3042 ;-------------------------
      002757                       3043 stop:
      00A17C 72 CF 00 1A CD   [ 2] 3044 	btjt flags,#FRUN,2$
      00A181 A0               [ 1] 3045 	clr a
      00A182 EE               [ 4] 3046 	ret 
      00275E                       3047 2$:	 
                                   3048 ; create space on cstack to save context 
      00A183 CD 98 7B         [ 2] 3049 	ldw x,#break_point 
      00A186 A1 08 26         [ 4] 3050 	call puts 
      002764                       3051 	_drop 2 ;drop return address 
      00A189 03 CC            [ 2]    1     addw sp,#2 
      002766                       3052 	_vars CTXT_SIZE ; context size 
      00A18B A1 02            [ 2]    1     sub sp,#CTXT_SIZE 
      00A18D CD 20 5E         [ 4] 3053 	call save_context 
      00A18D A1 00 27         [ 2] 3054 	ldw x,#tib 
      00A190 07 A1 0A         [ 2] 3055 	ldw basicptr,x
      00A193 27               [ 1] 3056 	clr (x)
      00A194 03 CC 97 14      [ 1] 3057 	clr count  
      00A198 5F               [ 1] 3058 	clrw x 
      00A198 5B 05 90         [ 2] 3059 	ldw in.w,x
      00A19B 85 81 00 22      [ 1] 3060 	bres flags,#FRUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A19D 72 18 00 22      [ 1] 3061 	bset flags,#FBREAK
      00A19D 55 00 03         [ 2] 3062 	jp interpreter 
      00A1A0 00 02 81 65 61 6B 20  3063 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3064 
                                   3065 ;-----------------------
                                   3066 ; BASIC: NEW
                                   3067 ; from command line only 
                                   3068 ; free program memory
                                   3069 ; and clear variables 
                                   3070 ;------------------------
      00A1A3                       3071 new: 
      00A1A3 52 04 0F 01 CD   [ 2] 3072 	btjf flags,#FRUN,0$ 
      00A1A8 9A               [ 4] 3073 	ret 
      0027A9                       3074 0$:	
      00A1A9 43 A1 02         [ 4] 3075 	call clear_basic 
      00A1AC 24               [ 4] 3076 	ret 
                                   3077 
                                   3078 ;-----------------------------------
                                   3079 ; erase program at specified address
                                   3080 ; keep signature and size fields. 
                                   3081 ; signature replaced by "XX"
                                   3082 ; input:
                                   3083 ;    X    address 
                                   3084 ;-----------------------------------
                           000001  3085 	ADDR=1    ; program address
                           000003  3086 	PRG_SIZE=3    ; program size 
                           000005  3087 	BLOCKS=5 ; blocks to erase 
                           000006  3088 	VSIZE=6
      0027AD                       3089 erase_program:
      00A1AD 03               [ 2] 3090 	pushw x 
      00A1AE CC 97 14         [ 4] 3091 	call skip_string 
      00A1B1 A1               [ 2] 3092 	popw x 
      00A1B2 03 25 0C         [ 4] 3093 	call search_program 
      00A1B5 90 F6            [ 1] 3094 	jreq 9$
      00A1B7 93 EE 01         [ 4] 3095 	call move_erase_to_ram
      00A1BA 72 A9 00 03      [ 1] 3096 	clr farptr 
      0027BE                       3097 	_vars VSIZE 
      00A1BE 9F 6B            [ 2]    1     sub sp,#VSIZE 
      00A1C0 01 90 F6         [ 2] 3098 1$:	subw x,#4 
      00A1C3 93 EE            [ 2] 3099 	ldw (ADDR,sp),x
      00A1C5 01 72            [ 2] 3100 	ldw x,(2,x)
      00A1C7 A9 00            [ 2] 3101 	ldw (PRG_SIZE,sp),x
      00A1C9 03 9F            [ 1] 3102 	ld a,#BLOCK_SIZE 
      00A1CB 6B               [ 2] 3103 	div x,a 
      00A1CC 02               [ 1] 3104 	tnz a 
      00A1CD 90 F6            [ 1] 3105 	jreq 2$ 
      00A1CF 93               [ 1] 3106 	incw x 
      00A1D0 EE 01            [ 2] 3107 2$:	ldw (BLOCKS,sp),x 
      00A1D2 72 A9            [ 2] 3108 	ldw x,(ADDR,sp)
      00A1D4 00 03 F6         [ 2] 3109 	ldw ptr16,x 
      00A1D7 14 02 18         [ 4] 3110 3$:	call block_erase
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A1DA 01 27 F9         [ 2] 3111 	ldw x,#BLOCK_SIZE 
      00A1DD 5B 04 81         [ 4] 3112 	call incr_farptr
      00A1E0 1E 05            [ 2] 3113 	ldw x,(BLOCKS,sp)
      00A1E0 CD               [ 2] 3114 	decw x 
      00A1E1 9A 43            [ 2] 3115 	ldw (BLOCKS,sp),x 
      00A1E3 A1 02            [ 1] 3116 	jrne 3$ 
                                   3117 ; write XX and size at addr 
      00A1E5 27 03            [ 2] 3118 	ldw x,(ADDR,sp)
      00A1E7 CC 97 14         [ 2] 3119 	ldw ptr16,x 
      00A1EA A6 58            [ 1] 3120 	ld a,#'X 
      00A1EA 90               [ 1] 3121 	clrw x 
      00A1EB F6 93 EE         [ 4] 3122 	call write_byte 
      00A1EE 01 72 A9         [ 4] 3123 	call write_byte 
      00A1F1 00 03            [ 1] 3124 	ld a,(PRG_SIZE,sp)
      00A1F3 9F 88 90         [ 4] 3125 	call write_byte 
      00A1F6 F6 93            [ 1] 3126 	ld a,(PRG_SIZE+1,sp)
      00A1F8 EE 01 72         [ 4] 3127 	call write_byte 
      0027FF                       3128 	_drop VSIZE 
      00A1FB A9 00            [ 2]    1     addw sp,#VSIZE 
      002801                       3129 9$:	
      00A1FD 03               [ 4] 3130 	ret 
                                   3131 
                                   3132 ;-----------------------------------
                                   3133 ; BASIC: ERASE \E | \F || address
                                   3134 ; erase all block in range from 
                                   3135 ;  'app_space' to FLASH end (0x27fff)
                                   3136 ;  or all EEPROM 
                                   3137 ; that contains a non zero byte. 
                                   3138 ; if the argument is an address  
                                   3139 ; mark the program at this address 
                                   3140 ; as erased. Erase the blocks 
                                   3141 ; replace signature by 'XX' and 
                                   3142 ; keep size field.  
                                   3143 ;-----------------------------------
                           000001  3144 	LIMIT=1 
                           000003  3145 	VSIZE = 3 
      002802                       3146 cmd_erase:
      00A1FE 84 FA F7 81 05   [ 2] 3147 	btjf flags,#FRUN,eras0
      00A202 A6 07            [ 1] 3148 	ld a,#ERR_CMD_ONLY
      00A202 CD 9A 43         [ 2] 3149 	jp tb_error 
      00280C                       3150 eras0:	
      00A205 A1 02 27 03      [ 1] 3151 	clr farptr 
      00A209 CC 97 14         [ 4] 3152 	call next_token
      00A20C A1 03            [ 1] 3153 	cp a,#TK_LABEL 
      00A20C 90 F6            [ 1] 3154 	jreq erase_program  
      002817                       3155 	_vars VSIZE 
      00A20E 93 EE            [ 2]    1     sub sp,#VSIZE 
      00A210 01 72            [ 1] 3156 	cp a,#TK_CHAR 
      00A212 A9 00            [ 1] 3157 	jreq 0$ 
      00A214 03 9F 43         [ 2] 3158 	jp syntax_error
      00A217 88 90 F6         [ 4] 3159 0$: call get_char 
      00A21A 93 EE            [ 1] 3160 	and a,#0XDF 
      00A21C 01 72            [ 1] 3161 	cp a,#'E
      00A21E A9 00            [ 1] 3162 	jrne 1$
      00A220 03 84 F4         [ 2] 3163 	ldw x,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A223 F7 81 19         [ 2] 3164 	ldw farptr+1,x 
      00A225 AE 47 FF         [ 2] 3165 	ldw x,#EEPROM_END
      00A225 CD               [ 1] 3166 	clr a 
      00A226 9A 43            [ 2] 3167 	jra 3$ 
      00A228 A1 02            [ 1] 3168 1$: cp a,#'F 
      00A22A 27 03            [ 1] 3169 	jreq 2$
      00A22C CC 97 14         [ 2] 3170 	ldw x,#err_bad_value
      00A22F 90 F6 93         [ 2] 3171 	jp tb_error
      00283F                       3172 2$:
      00A232 EE 01 72         [ 2] 3173 	ldw x,#app_space  
      00A235 A9 00 03         [ 2] 3174 	ldw farptr+1,x 
      00A238 9F 88            [ 1] 3175 	ld a,#(FLASH_END>>16)&0XFF 
      00A23A 90 F6 93         [ 2] 3176 	ldw x,#FLASH_END&0xffff
      00284A                       3177 3$:
      00A23D EE 01            [ 1] 3178 	ld (LIMIT,sp),a 
      00A23F 72 A9            [ 2] 3179 	ldw (LIMIT+1,sp),x 
                                   3180 ; operation done from RAM
                                   3181 ; copy code to RAM in tib   
      00A241 00 03 84         [ 4] 3182 	call move_erase_to_ram
      002851                       3183 4$:	 
      00A244 F8 F7 81         [ 4] 3184     call scan_block 
      00A247 27 08            [ 1] 3185 	jreq 5$  ; block already erased 
      00A247 CD 9A            [ 1] 3186     ld a,#'E 
      00A249 3E A1 02         [ 4] 3187     call putc 
      00A24C 27 03 CC         [ 4] 3188 	call block_erase   
                                   3189 ; this block is clean, next  
      00A24F 97 14 80         [ 2] 3190 5$:	ldw x,#BLOCK_SIZE
      00A251 CD 08 60         [ 4] 3191 	call incr_farptr
                                   3192 ; check limit, 24 bit substraction  	
      00A251 90 F6            [ 1] 3193 	ld a,(LIMIT,sp)
      00A253 93 EE            [ 2] 3194 	ldw x,(LIMIT+1,sp)
      00A255 01 72 A9 00      [ 2] 3195 	subw x,farptr+1
      00A259 03 9F A4         [ 1] 3196 	sbc a,farptr 
      00A25C 07 88            [ 1] 3197 	jrugt 4$ 
      00A25E A6 01 0D         [ 4] 3198 9$: call clear_basic
      00A261 01 27            [ 2] 3199 	ldw x,(LIMIT+1,sp)
      00A263 05 48 0A         [ 2] 3200 	cpw x,#EEPROM_END
      00A266 01 20            [ 1] 3201 	jrne 10$
      00A268 F7 6B 01         [ 4] 3202 	call func_eefree 
      00287E                       3203 10$:
      00287E                       3204 	_drop VSIZE 
      00A26B 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A26D 93               [ 4] 3205 	ret 
                                   3206 	
                                   3207 
                                   3208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3209 ;  check for application signature 
                                   3210 ; input:
                                   3211 ;	x       address to check 
                                   3212 ; output:
                                   3213 ;   Z      1  signature present 
                                   3214 ;          0 not app signature  
                                   3215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002881                       3216 qsign: 
      00A26E EE               [ 2] 3217 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3218 ; align to block 
      00A26F 01               [ 1] 3219 	ld a,xl 
      00A270 72 A9            [ 1] 3220 	and a,#BLOCK_SIZE 
      00A272 00               [ 1] 3221 	ld xl,a 
      00A273 03               [ 2] 3222 	ldw x,(x)
      00A274 84 F4 27         [ 2] 3223 	cpw x,SIGNATURE ; "TB" 
      00A277 02               [ 2] 3224 	popw x 
      00A278 A6               [ 4] 3225 	ret 
                                   3226 
                                   3227 ;--------------------------------------
                                   3228 ;  fill write buffer 
                                   3229 ;  input:
                                   3230 ;    y  point to output buffer 
                                   3231 ;    x  point to source 
                                   3232 ;    a  bytes to write in buffer 
                                   3233 ;  output:
                                   3234 ;    y   += A 
                                   3235 ;    X   += A 
                                   3236 ;    A   0 
                                   3237 ;---------------------------------------
      00288C                       3238 fill_write_buffer:
      00A279 01               [ 1] 3239 	push a 
      00A27A 5F               [ 1] 3240 	tnz a 
      00A27B 97 4F            [ 1] 3241 	jreq 9$ 
      00A27D 81               [ 1] 3242 1$: ld a,(x)
      00A27E 5C               [ 1] 3243 	incw x 
      00A27E CD 9A            [ 1] 3244 	ld (y),a 
      00A280 43 A1            [ 1] 3245 	incw y 
      00A282 02 27            [ 1] 3246 	dec (1,sp) 
      00A284 03 CC            [ 1] 3247 	jrne 1$ 
      00A286 97               [ 1] 3248 9$:	pop a 
      00A287 14               [ 4] 3249     ret 	
                                   3250 
                                   3251 ;--------------------------------------
                                   3252 ;  fill pad buffer with zero 
                                   3253 ;  input:
                                   3254 ;	none 
                                   3255 ;  output:
                                   3256 ;    y     buffer address  
                                   3257 ;--------------------------------------
      00A288                       3258 clear_block_buffer:
      00A288 90               [ 1] 3259 	push a 
      00A289 F6 93 EE 01      [ 2] 3260 	ldw y,#block_buffer 
      00A28D 72 A9            [ 2] 3261 	pushw y
      00A28F 00 03            [ 1] 3262 	ld a,#BLOCK_SIZE   
      00A291 9F 88            [ 1] 3263 1$:	clr (y)
      00A293 90 F6            [ 1] 3264 	incw y
      00A295 93               [ 1] 3265 	dec a  
      00A296 EE 01            [ 1] 3266 	jrne 1$ 	
      00A298 72 A9            [ 2] 3267 9$: popw y 
      00A29A 00               [ 1] 3268 	pop a 			
      00A29B 03               [ 4] 3269 	ret 
                                   3270 
                                   3271 
                                   3272 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3273 ;  search  a free space space that 
                                   3274 ;  fit program size 
                                   3275 ; input:
                                   3276 ;    X    program size 
                                   3277 ; output:
                                   3278 ;    X    address | 0 
                                   3279 ;------------------------------------
                           000001  3280 	PG_SIZE=1 
                           000002  3281 	VSIZE=2 
      0028B0                       3282 search_fit:
      00A29C 84               [ 2] 3283 	pushw x; PG_SIZE 
      00A29D F7 81 80         [ 2] 3284 	ldw x,#app_space 
      00A29F CD 29 9D         [ 4] 3285 1$:	call is_erased 
      00A29F CD 9A            [ 1] 3286 	jreq 4$
      00A2A1 3E               [ 1] 3287 	ld a,(x)
      00A2A2 A1 01            [ 1] 3288 	or a,(1,x)
      00A2A4 27 03            [ 1] 3289 	jreq 9$ ; free space 
      00A2A6 CC 97 14         [ 4] 3290 2$:	call skip_to_next
      00A2A9 90               [ 2] 3291 	tnzw x 
      00A2AA F6 93            [ 1] 3292 	jrne 1$
      00A2AC EE 01            [ 2] 3293 	jra 9$
      0028C6                       3294 4$: ; erased program 
                                   3295     ; does it fit? 
      00A2AE 72 A9 00         [ 2] 3296 	ldw acc16,x 
      00A2B1 03 C7            [ 2] 3297 	ldw x,(2,x) ; size erased program
                                   3298 ; top multiple of BLOCK_SIZE 
      00A2B3 00 19 CF         [ 2] 3299 	addw x,#4 
      00A2B6 00 1A 92         [ 2] 3300 	addw x,#BLOCK_SIZE-1 
      00A2B9 BC               [ 1] 3301 	ld a,xl 
      00A2BA 00 19            [ 1] 3302 	and a,#BLOCK_SIZE 
      00A2BC 5F               [ 1] 3303 	ld xl,a  
      00A2BD 97 4F            [ 2] 3304 	cpw x,(1,sp) ; size program to save 
      00A2BF 81 05            [ 1] 3305 	jruge 8$   ; fit 
      00A2C0 CE 00 0D         [ 2] 3306 	ldw x,acc16 
      00A2C0 CD 9C            [ 2] 3307 	jra 2$ 
      00A2C2 9E 90 F6         [ 2] 3308 8$: ldw x,acc16 ; fit in this one 	
      0028E1                       3309 9$:	_drop VSIZE 
      00A2C5 93 EE            [ 2]    1     addw sp,#VSIZE 
      00A2C7 01               [ 4] 3310 	ret  
                                   3311 
                                   3312 ;-------------------------
                                   3313 ; erase header and 
                                   3314 ; size fields 
                                   3315 ; input: 
                                   3316 ;    X    program address 
                                   3317 ; output:
                                   3318 ;    X    unchanged 
                                   3319 ;-------------------------
                           000001  3320 	COUNT=1 
      0028E4                       3321 erase_header:
      00A2C8 72               [ 2] 3322 	pushw x 
      00A2C9 A9 00            [ 1] 3323 	push #4 ; COUNT 
      00A2CB 03 4D 26 0D      [ 1] 3324 	clr farptr 
      00A2CF 5D 26 0A         [ 2] 3325 	ldw ptr16,x 
      00A2D2 55               [ 1] 3326 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A2D3 00               [ 1] 3327 	clrw x 
      00A2D4 03 00 02         [ 4] 3328 1$:	call write_byte 
      00A2D7 5B 02            [ 1] 3329 	dec (COUNT,sp)
      00A2D9 CC 97            [ 1] 3330 	jrne 1$
      0028F7                       3331 	_drop 1 
      00A2DB C7 81            [ 2]    1     addw sp,#1 
      00A2DD 85               [ 2] 3332 	popw x 
      00A2DD 85 52 0D         [ 2] 3333 	ldw ptr16,x 
      00A2E0 89               [ 4] 3334 	ret 
                                   3335 
                                   3336 ;---------------------------------------
                                   3337 ; BASIC: SAVE
                                   3338 ; write application from RAM to FLASH
                                   3339 ; at UFLASH address
                                   3340 ;--------------------------------------
                           000001  3341 	XTEMP=1
                           000003  3342 	COUNT=3  ; last count bytes written 
                           000004  3343 	CNT_LO=4 ; count low byte 
                           000005  3344 	TOWRITE=5 ; how bytes left to write  
                           000006  3345 	VSIZE=6 
      0028FE                       3346 cmd_save:
      00A2E1 A6               [ 2] 3347 	pushw x 
      00A2E2 85 CD            [ 2] 3348 	pushw y 
      002901                       3349 	_vars VSIZE
      00A2E4 9A 31            [ 2]    1     sub sp,#VSIZE 
      00A2E6 CD 98 A3         [ 4] 3350 	call prog_size 
      00A2E9 1F 09            [ 1] 3351 	jrne 0$ 
      00A2EB CD 9D 73         [ 2] 3352 	jp 9$ ; no program to save 
      00A2EE 72 14            [ 2] 3353 0$:	ldw (TOWRITE,sp),x ; program size
      00A2F0 00 23 CD 98      [ 1] 3354 	clr farptr 
      00A2F4 7B A1 80         [ 4] 3355 	call search_fit
      00A2F7 27 03 CC         [ 2] 3356 	ldw ptr16,x 
      00A2FA 97 14 FF         [ 2] 3357 	ldw x,#0xFFFF
      00A2FC 72 B0 00 19      [ 2] 3358 	subw x,ptr16 ; free flash 
      00A2FC FE 72 5C         [ 2] 3359 	subw x,#4 ; signature and size field 
      00A2FF 00 02            [ 2] 3360 	cpw x,(TOWRITE,sp)
      00A301 72 5C            [ 1] 3361 	jruge 1$
      00A303 00 02            [ 1] 3362 	ld a,#ERR_MEM_FULL
      00A305 A3 A3 0D         [ 2] 3363 	jp tb_error 
      00292A                       3364 1$: ; check if header bytes are zero's 
      00A308 27 03 CC         [ 2] 3365 	ldw x,ptr16 
      00A30B 97               [ 1] 3366 	ld a,(x)
      00A30C 14 01            [ 1] 3367 	or a,(1,x)
      00A30D EA 02            [ 1] 3368 	or a,(2,x)
      00A30D 72 04            [ 1] 3369 	or a,(3,x)
      00A30F 00 23            [ 1] 3370 	jreq 2$
      00A311 03 CC 97         [ 4] 3371 	call erase_header ; preserve X and farptr 
      002939                       3372 2$: 
                                   3373 ; block programming flash
                                   3374 ; must be done from RAM
                                   3375 ; moved in tib  
      00A314 14 CD 9B         [ 4] 3376 	call move_prg_to_ram
                                   3377 ; initialize written bytes count  
      00A317 85 A1            [ 1] 3378 	clr (COUNT,sp)
                                   3379 ; first bock 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   3380 ; containt signature 2 bytes 
                                   3381 ; and size 	2 bytes 
                                   3382 ; use Y as pointer to block_buffer
      00A319 84 27 03         [ 4] 3383 	call clear_block_buffer ; -- y=*block_buffer	
                                   3384 ; write signature
      00A31C CC 97 14         [ 2] 3385 	ldw x,SIGNATURE ; "TB" 
      00A31F 90 F6            [ 2] 3386 	ldw (y),x 
      00A321 93 EE 01 72      [ 2] 3387 	addw y,#2
      00A325 A9 00            [ 2] 3388 	ldw x,(TOWRITE,sp)
      00A327 03 6B            [ 2] 3389 	ldw (y),x
      00A329 06 1F 07 CD      [ 2] 3390 	addw y,#2   
      00A32D 98 7B            [ 1] 3391 	ld a,#(BLOCK_SIZE-4)
      00A32F A1 00 27         [ 2] 3392 	cpw x,#(BLOCK_SIZE-4) 
      00A332 17 A1            [ 1] 3393 	jrugt 3$
      00A334 80               [ 1] 3394 	ld a,xl 
      00A335 26 0E            [ 1] 3395 3$:	ld (CNT_LO,sp),a   
      00A337 FE 72 5C         [ 2] 3396 	ldw x,txtbgn 
      00A33A 00 02            [ 2] 3397 	ldw (XTEMP,sp),x 
      002961                       3398 32$: 
      00A33C 72 5C            [ 2] 3399 	ldw x,(XTEMP,sp)
      00A33E 00 02            [ 1] 3400 	ld a,(CNT_LO,sp)
      00A340 A3 A3 53         [ 4] 3401 	call fill_write_buffer 
      00A343 27 0E            [ 2] 3402 	ldw (XTEMP,sp),x 
      00A345 AE 16 B8         [ 2] 3403 	ldw x,#block_buffer
      00A345 55 00 04         [ 4] 3404 	call write_buffer
      00A348 00 02 80         [ 2] 3405 	ldw x,#BLOCK_SIZE 
      00A34A CD 08 60         [ 4] 3406 	call incr_farptr  
                                   3407 ; following blocks 
      00A34A 0F 03            [ 2] 3408 	ldw x,(XTEMP,sp)
      00A34C AE 00 01         [ 2] 3409 	cpw x,txtend 
      00A34F 1F 04            [ 1] 3410 	jruge 9$ 
      00A351 20 2F            [ 2] 3411 	ldw x,(TOWRITE,sp)
      00A353 72 F0 03         [ 2] 3412 	subw x,(COUNT,sp)
      00A353 72 04            [ 2] 3413 	ldw (TOWRITE,sp),x 
      00A355 00 23            [ 1] 3414 	ld a,#BLOCK_SIZE 
      00A357 03 CC 97         [ 2] 3415 	cpw x,#BLOCK_SIZE 
      00A35A 14 CD            [ 1] 3416 	jruge 4$ 
      00A35C 9B               [ 1] 3417 	ld a,xl 
      00A35D 85 A1            [ 1] 3418 4$:	ld (CNT_LO,sp),a 
      00A35F 84 27 03         [ 4] 3419 	call clear_block_buffer 
      00A362 CC 97            [ 2] 3420 	jra 32$ 
      002993                       3421 9$:	_drop VSIZE 
      00A364 14 06            [ 2]    1     addw sp,#VSIZE 
      00A365 90 85            [ 2] 3422     popw y 
      00A365 90               [ 2] 3423 	popw x 
      00A366 F6               [ 4] 3424 	ret 
                                   3425 
      00A367 93 EE                 3426 SIGNATURE: .ascii "TB"
      00A369 01 72                 3427 ERASED: .ascii "XX" 
                                   3428 
                                   3429 ;---------------------
                                   3430 ; check if there is 
                                   3431 ; an erased program 
                                   3432 ; at this address 
                                   3433 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3434 ;    X    address 
                                   3435 ; output:
                                   3436 ;    Z    Set=erased program 
                                   3437 ;--------------------
      00299D                       3438 is_erased:
      00A36B A9               [ 2] 3439 	pushw x 
                                   3440 ; align to BLOCK 
      00A36C 00               [ 1] 3441 	ld a,xl 
      00A36D 03 6B            [ 1] 3442 	and a,#BLOCK_SIZE 
      00A36F 03               [ 1] 3443 	ld xl,a 
      00A370 1F               [ 2] 3444 	ldw x,(x)
      00A371 04 4D 2A         [ 2] 3445 	cpw x,ERASED 
      00A374 0D               [ 2] 3446 	popw x 
      00A375 7B               [ 4] 3447 	ret 
                                   3448 
                                   3449 ;----------------------------
                                   3450 ;  skip to next program
                                   3451 ;  block 
                                   3452 ; input:
                                   3453 ;    X   actual program addr
                                   3454 ; output:
                                   3455 ;    X   next block 
                                   3456 ;        after program 
                                   3457 ;----------------------------
      0029A8                       3458 skip_to_next:
                                   3459 ; align to block 
      00A376 06               [ 1] 3460 	ld a,xl 
      00A377 1E 07            [ 1] 3461 	and a,#BLOCK_SIZE 
      00A379 1D               [ 1] 3462 	ld xl,a 
      00A37A 00 01 A2         [ 2] 3463 	ldw acc16,x 
      00A37D 00 6B            [ 2] 3464 	ldw x,(2,x)
      00A37F 06 1F 07 0D      [ 2] 3465 	addw x,acc16 ; blk_addr+prg_size 
      00A382 1C 00 04         [ 2] 3466 	addw x,#4 ; +header fields 
                                   3467 ; align to next block 
      00A382 CE 00 05         [ 2] 3468 	addw x,#BLOCK_SIZE-1 
      00A385 1F               [ 1] 3469 	ld a,xl 
      00A386 0D CE            [ 1] 3470 	and a,#0x80 
      00A388 00               [ 1] 3471 	ld xl,a  
      00A389 01               [ 4] 3472 	ret 
                                   3473 
                                   3474 
                                   3475 ;---------------------
                                   3476 ; BASIC: DIR 
                                   3477 ; list programs saved 
                                   3478 ; in flash 
                                   3479 ;--------------------
                           000001  3480 	XTEMP=1 
      0029C0                       3481 cmd_dir:
      00A38A 1F 0B 72         [ 2] 3482 	ldw x,#app_space 
      00A38D 15               [ 2] 3483 	pushw x 
      0029C4                       3484 1$: 
      00A38E 00 23 72         [ 4] 3485 	call qsign 
      00A391 5C 00            [ 1] 3486 	jrne 4$
      00A393 20 81 04         [ 2] 3487 	addw x,#4
      00A395 35 10 00 0A      [ 1] 3488 	mov base,#16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A395 72 5D 00         [ 4] 3489 	call prt_i16
      00A398 20 26            [ 1] 3490 	ld a,#SPACE 
      00A39A 03 CC 97         [ 4] 3491 	call putc 
      00A39D 14 01            [ 2] 3492 	ldw x,(1,sp)
      00A39E EE 02            [ 2] 3493 	ldw x,(2,x)
      00A39E A6 85 CD 9A      [ 1] 3494 	mov base,#10  
      00A3A2 31 CD 98         [ 4] 3495 	call prt_i16 
      00A3A5 A3 13 09         [ 2] 3496 	ldw x,#STR_BYTES
      00A3A8 27 03 CC         [ 4] 3497 	call puts
      00A3AB 97 14            [ 1] 3498 	ld a,#', 
      00A3AD CD 08 FF         [ 4] 3499 	call putc
      00A3AD CF 00            [ 2] 3500 	ldw x,(1,sp)
      00A3AF 1A F6 EE         [ 2] 3501 	addw x,#8
      00A3B2 01 72 FB         [ 4] 3502 	call puts 
      00A3B5 04 19            [ 1] 3503 	ld a,#CR 
      00A3B7 03 72 C7         [ 4] 3504 	call putc
      00A3BA 00 1A            [ 2] 3505 	ldw x,(1,sp)
      00A3BC 72 5C 00         [ 4] 3506 3$:	call skip_to_next
      00A3BF 1B 72            [ 2] 3507 	ldw (1,sp),x 
      00A3C1 CF 00            [ 2] 3508 	jra 1$
      002A04                       3509 4$: ; check if it is an erased program 
      00A3C3 1A C7 00         [ 4] 3510 	call is_erased 
      00A3C6 0D CF            [ 1] 3511 	jreq 3$ 
      002A09                       3512 8$: ; done 
      002A09                       3513 	_drop 2 
      00A3C8 00 0E            [ 2]    1     addw sp,#2 
      00A3CA 7B               [ 4] 3514 	ret 
                                   3515 
                                   3516 ;---------------------
                                   3517 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3518 ; write 1 or more byte to FLASH or EEPROM
                                   3519 ; starting at address  
                                   3520 ; input:
                                   3521 ;   expr1  	is address 
                                   3522 ;   expr2,...,exprn   are bytes to write
                                   3523 ; output:
                                   3524 ;   none 
                                   3525 ;---------------------
      002A0C                       3526 write:
      00A3CB 06 1E 07         [ 4] 3527 	call expression
      00A3CE 72 B0            [ 1] 3528 	cp a,#TK_INTGR 
      00A3D0 00 0E            [ 1] 3529 	jreq 0$
      00A3D2 C2 00 0D         [ 2] 3530 	jp syntax_error
      002A16                       3531 0$: _xpop 
      00A3D5 18 03            [ 1]    1     ld a,(y)
      00A3D7 A8               [ 1]    2     ldw x,y 
      00A3D8 80 2B            [ 2]    3     ldw x,(1,x)
      00A3DA 12 20 25 7B      [ 2]    4     addw y,#CELL_SIZE 
      00A3DE 03 2A 07         [ 1] 3532 	ld farptr,a 
      00A3E1 C6 00 0F         [ 2] 3533 	ldw ptr16,x 
      002A25                       3534 1$:	
      00A3E4 2F 07 20         [ 4] 3535 	call next_token 
      00A3E7 1A 08            [ 1] 3536 	cp a,#TK_COMMA 
      00A3E8 27 02            [ 1] 3537 	jreq 2$ 
      00A3E8 72 0E            [ 2] 3538 	jra 9$ ; no more data 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A3EA 00 0F 15         [ 4] 3539 2$:	call next_token 
      00A3ED A1 04            [ 1] 3540 	cp a,#TK_CHAR 
      00A3ED 1E 0D            [ 1] 3541 	jreq 4$ 
      00A3EF CF 00            [ 1] 3542 	cp a,#TK_QSTR
      00A3F1 05 72            [ 1] 3543 	jreq 6$
      002A39                       3544 	_unget_token 
      00A3F3 01 00 23 05 E6   [ 1]    1      mov in,in.saved  
      00A3F8 02 C7 00         [ 4] 3545 	call expression
      00A3FB 03 1E            [ 1] 3546 	cp a,#TK_INTGR
      00A3FD 0B CF            [ 1] 3547 	jreq 3$
      00A3FF 00 01 81         [ 2] 3548 	jp syntax_error
      00A402                       3549 3$:	_xpop 
      00A402 85 5B            [ 1]    1     ld a,(y)
      00A404 0D               [ 1]    2     ldw x,y 
      00A405 72 5A            [ 2]    3     ldw x,(1,x)
      00A407 00 20 FC 03      [ 2]    4     addw y,#CELL_SIZE 
      00A40A 9F               [ 1] 3550 	ld a,xl 
      00A40A CD               [ 1] 3551 	clrw x 
      00A40B 98 7B A1         [ 4] 3552 	call write_byte
      00A40E 84 27            [ 2] 3553 	jra 1$ 
      002A58                       3554 4$: ; write character 
      00A410 07               [ 1] 3555 	ld a,(x)
      00A411 A1 03 27 26      [ 1] 3556 	inc in 
      00A415 CC               [ 1] 3557 	clrw x 
      00A416 97 14 8B         [ 4] 3558 	call write_byte 
      00A418 20 C2            [ 2] 3559 	jra 1$ 
      002A63                       3560 6$: ; write string 
      00A418 90               [ 2] 3561 	pushw x 
      00A419 89               [ 1] 3562 	ld a,(x)
      00A41A CD 98 AD 4F      [ 1] 3563 	inc in 
      00A41E 90               [ 1] 3564 	clrw x 
      00A41F CE 00 05         [ 4] 3565 	call write_byte 
      00A422 90               [ 2] 3566 	popw x 
      00A423 FE               [ 1] 3567 	ld a,(x)
      00A424 90 89            [ 1] 3568 	jreq 1$
      00A426 13               [ 1] 3569 	incw x 
      00A427 01 5B            [ 2] 3570 	jra 6$ 	
      002A74                       3571 9$:
      00A429 02               [ 4] 3572 	ret 
                                   3573 
                                   3574 
                                   3575 ;---------------------
                                   3576 ;BASIC: CHAR(expr)
                                   3577 ; évaluate expression 
                                   3578 ; and take the 7 least 
                                   3579 ; bits as ASCII character
                                   3580 ; output: 
                                   3581 ; 	A char 
                                   3582 ;---------------------
      002A75                       3583 func_char:
      00A42A 25 01 4C         [ 4] 3584 	call func_args 
      00A42D A1 01            [ 1] 3585 	cp a,#1
      00A42D CD 8C            [ 1] 3586 	jreq 1$
      00A42F C5 5D 26         [ 2] 3587 	jp syntax_error
      002A7F                       3588 1$:	_xpop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A432 05 A6            [ 1]    1     ld a,(y)
      00A434 05               [ 1]    2     ldw x,y 
      00A435 CC 97            [ 2]    3     ldw x,(1,x)
      00A437 16 90 85 81      [ 2]    4     addw y,#CELL_SIZE 
      00A43B 9F               [ 1] 3589 	ld a,xl
      00A43B 90 89            [ 1] 3590 	and a,#0x7f 
      00A43D 89               [ 4] 3591 	ret
                                   3592 
                                   3593 ;---------------------
                                   3594 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3595 ; extract first character 
                                   3596 ; of string argument 
                                   3597 ; output:
                                   3598 ;    A:X    int24 
                                   3599 ;---------------------
      002A8C                       3600 ascii:
      00A43E CD 98            [ 1] 3601 	ld a,#TK_LPAREN
      00A440 94 72 5F         [ 4] 3602 	call expect 
      00A443 00 0E 90         [ 4] 3603 	call next_token 
      00A446 CE 00            [ 1] 3604 	cp a,#TK_QSTR 
      00A448 1C 90            [ 1] 3605 	jreq 1$
      00A44A E6 03            [ 1] 3606 	cp a,#TK_CHAR 
      00A44C A1 03            [ 1] 3607 	jreq 2$ 
      00A44E 27 15            [ 1] 3608 	cp a,#TK_CFUNC 
      00A450 90 E6            [ 1] 3609 	jreq 0$
      00A452 02 C7 00         [ 2] 3610 	jp syntax_error
      002AA3                       3611 0$: ; cfunc 
      00A455 0F               [ 4] 3612 	call (x)
      00A456 72 B9            [ 2] 3613 	jra 3$
      002AA6                       3614 1$: ; quoted string 
      00A458 00               [ 1] 3615 	ld a,(x)
      00A459 0E               [ 1] 3616 	push a  
      00A45A 90 C3 00         [ 4] 3617 	call skip_string
      00A45D 1E               [ 1] 3618 	pop a  	
      00A45E 25 E9            [ 2] 3619 	jra 3$ 
      002AAE                       3620 2$: ; character 
      00A460 A6 0A CC         [ 4] 3621 	call get_char 
      00A463 97               [ 1] 3622 3$:	clrw x 
      00A464 16               [ 1] 3623 	rlwa x   
      00A465                       3624 4$:	_xpush  
      00A465 90 89 72 A9      [ 2]    1     subw y,#CELL_SIZE
      00A469 00 04            [ 1]    2     ld (y),a 
      00A46B 1E 03 CD         [ 2]    3     ldw (1,y),x 
      00A46E 94 1D            [ 1] 3625 	ld a,#TK_RPAREN 
      00A470 26 04 90         [ 4] 3626 	call expect
      002AC1                       3627 9$:	
      002AC1                       3628 	_xpop  
      00A473 85 20            [ 1]    1     ld a,(y)
      00A475 DA               [ 1]    2     ldw x,y 
      00A476 EE 01            [ 2]    3     ldw x,(1,x)
      00A476 85 5B 02 90      [ 2]    4     addw y,#CELL_SIZE 
      00A47A 85               [ 4] 3629 	ret 
                                   3630 
                                   3631 ;---------------------
                                   3632 ;BASIC: KEY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3633 ; wait for a character 
                                   3634 ; received from STDIN 
                                   3635 ; input:
                                   3636 ;	none 
                                   3637 ; output:
                                   3638 ;	a	 character 
                                   3639 ;---------------------
      002ACB                       3640 key:
      00A47B 81 09 0F         [ 4] 3641 	call getc 
      00A47C 81               [ 4] 3642 	ret
                                   3643 
                                   3644 ;----------------------
                                   3645 ; BASIC: QKEY
                                   3646 ; Return true if there 
                                   3647 ; is a character in 
                                   3648 ; waiting in STDIN 
                                   3649 ; input:
                                   3650 ;  none 
                                   3651 ; output:
                                   3652 ;   A     0|-1
                                   3653 ;-----------------------
      002ACF                       3654 qkey:: 
      00A47C 72               [ 1] 3655 	clrw x 
      00A47D 00 00 23         [ 1] 3656 	ld a,rx1_head
      00A480 05 A6 06         [ 1] 3657 	sub a,rx1_tail 
      00A483 CC 97            [ 1] 3658 	jreq 9$ 
      00A485 16               [ 2] 3659 	cplw x
      00A486 CD 9B            [ 1] 3660 	ld a,#255    
      002ADB                       3661 9$: 
      00A488 85               [ 4] 3662 	ret 
                                   3663 
                                   3664 ;---------------------
                                   3665 ; BASIC: GPIO(port,reg)
                                   3666 ; return gpio register address 
                                   3667 ; expr {PORTA..PORTI}
                                   3668 ; input:
                                   3669 ;   none 
                                   3670 ; output:
                                   3671 ;   A:X 	gpio register address
                                   3672 ;----------------------------
                                   3673 ;	N=PORT
                                   3674 ;	T=REG 
      002ADC                       3675 gpio:
      00A489 A1 84 27         [ 4] 3676 	call func_args 
      00A48C 03 CC            [ 1] 3677 	cp a,#2
      00A48E 97 14            [ 1] 3678 	jreq 1$
      00A490 90 F6 93         [ 2] 3679 	jp syntax_error  
      002AE6                       3680 1$:	_at_next 
      00A493 EE 01 72         [ 1]    1     ld a,(3,y)
      00A496 A9               [ 1]    2     ldw x,y 
      00A497 00 03            [ 2]    3     ldw x,(4,x)
      00A499 9F 27 68         [ 2] 3681 	cpw x,#PA_BASE 
      00A49C 88 CD            [ 1] 3682 	jrmi bad_port
      00A49E 98 7B A1         [ 2] 3683 	cpw x,#PI_BASE+1 
      00A4A1 80 27            [ 1] 3684 	jrpl bad_port
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A4A3 03               [ 2] 3685 	pushw x 
      002AF7                       3686 	_xpop
      00A4A4 CC 97            [ 1]    1     ld a,(y)
      00A4A6 14               [ 1]    2     ldw x,y 
      00A4A7 FE 72            [ 2]    3     ldw x,(1,x)
      00A4A9 5C 00 02 72      [ 2]    4     addw y,#CELL_SIZE 
      00A4AD 5C 00 02         [ 2] 3687 	addw x,(1,sp)
      002B03                       3688 	_drop 2 
      00A4B0 A3 A5            [ 2]    1     addw sp,#2 
      00A4B2 0E               [ 1] 3689 	clr a 
      00A4B3 27               [ 4] 3690 	ret
      002B07                       3691 bad_port:
      00A4B4 08 A3            [ 1] 3692 	ld a,#ERR_BAD_VALUE
      00A4B6 A5 28 27         [ 2] 3693 	jp tb_error
                                   3694 
                                   3695 
                                   3696 ;-------------------------
                                   3697 ; BASIC: UFLASH 
                                   3698 ; return free flash address
                                   3699 ; scan all block starting at 
                                   3700 ; app_space and return 
                                   3701 ; address of first free block 
                                   3702 ; below extended memory.  
                                   3703 ; return 0 if no free block 
                                   3704 ; input:
                                   3705 ;  none 
                                   3706 ; output:
                                   3707 ;	A:X		FLASH free address
                                   3708 ;---------------------------
      002B0C                       3709 uflash:
      00A4B9 03 CC 97 14      [ 1] 3710 	clr farptr 
      00A4BD AE 38 80         [ 2] 3711 	ldw x,#app_space 
      00A4BD 84               [ 2] 3712 	pushw x 
      00A4BE 89 88 19         [ 2] 3713 1$:	ldw ptr16,x 
      00A4C0 CD 08 6E         [ 4] 3714 	call scan_block 
      00A4C0 0A 01            [ 1] 3715 	jreq 8$
      00A4C2 27 26            [ 2] 3716 	ldw x,(1,sp)
      00A4C4 CD 98 7B         [ 2] 3717 	addw x,#BLOCK_SIZE 
      00A4C7 A1 84            [ 1] 3718 	jreq 7$ 
      00A4C9 27 07            [ 2] 3719 	ldw (1,sp),x 
      00A4CB A1 03            [ 2] 3720 	jra 1$ 
      002B27                       3721 7$: ; no free block 
      00A4CD 27 0D            [ 1] 3722 	clr (1,sp) 
      00A4CF CC 97            [ 1] 3723 	clr (2,sp)
      00A4D1 14               [ 2] 3724 8$: popw x 
      00A4D2 4F               [ 1] 3725 	clr a 
      00A4D2 C6               [ 4] 3726 	ret 
                                   3727 
                                   3728 
                                   3729 ;---------------------
                                   3730 ; BASIC: USR(addr,arg)
                                   3731 ; execute a function written 
                                   3732 ; in binary code.
                                   3733 ; input:
                                   3734 ;   addr	routine address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3735 ;   arg 	is an argument
                                   3736 ;           it can be ignore 
                                   3737 ;           by cally. 
                                   3738 ; output:
                                   3739 ;   xstack 	value returned by cally  
                                   3740 ;---------------------
      002B2E                       3741 usr:
      00A4D3 00 02 AB         [ 4] 3742 	call func_args 
      00A4D6 03 C7            [ 1] 3743 	cp a,#2
      00A4D8 00 02            [ 1] 3744 	jreq 1$  
      00A4DA 20 03 CD         [ 2] 3745 	jp syntax_error 
      002B38                       3746 1$: 
      002B38                       3747 	_at_next ; A:X addr 
      00A4DD 98 94 03         [ 1]    1     ld a,(3,y)
      00A4DF 93               [ 1]    2     ldw x,y 
      00A4DF CD 98            [ 2]    3     ldw x,(4,x)
      00A4E1 7B A1 08         [ 2] 3748 	ldw ptr16,X 
      002B41                       3749 	_xpop  ; arg 
      00A4E4 27 DA            [ 1]    1     ld a,(y)
      00A4E6 5B               [ 1]    2     ldw x,y 
      00A4E7 03 20            [ 2]    3     ldw x,(1,x)
      00A4E9 1A A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A4EA                       3750 	_store_top ; overwrite addr 
      00A4EA 5B 01            [ 1]    1     ld (y),a 
      00A4EC CD A4 0A         [ 2]    2     ldw (1,y),x     
      00A4EF CF 00 1A 55      [ 6] 3751     call [ptr16]
      00A4F3 00               [ 4] 3752 	ret 
                                   3753 
                                   3754 
                                   3755 ;------------------------------
                                   3756 ; BASIC: BYE 
                                   3757 ; halt mcu in its lowest power mode 
                                   3758 ; wait for reset or external interrupt
                                   3759 ; do a cold start on wakeup.
                                   3760 ;------------------------------
      002B54                       3761 bye:
      00A4F4 03 00 02 85 A3   [ 2] 3762 	btjf UART1_SR,#UART_SR_TC,.
      00A4F9 A5               [10] 3763 	halt
      00A4FA 0E 26 05         [ 2] 3764 	jp cold_start  
                                   3765 
                                   3766 ;----------------------------------
                                   3767 ; BASIC: SLEEP 
                                   3768 ; halt mcu until reset or external
                                   3769 ; interrupt.
                                   3770 ; Resume progam after SLEEP command
                                   3771 ;----------------------------------
      002B5D                       3772 sleep:
      00A4FD CE 00 1A 20 19   [ 2] 3773 	btjf UART1_SR,#UART_SR_TC,.
      00A502 72 16 00 22      [ 1] 3774 	bset flags,#FSLEEP
      00A502 20               [10] 3775 	halt 
      00A503 35               [ 4] 3776 	ret 
                                   3777 
                                   3778 ;-------------------------------
                                   3779 ; BASIC: PAUSE expr 
                                   3780 ; suspend execution for n msec.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3781 ; input:
                                   3782 ;	none
                                   3783 ; output:
                                   3784 ;	none 
                                   3785 ;------------------------------
      00A504                       3786 pause:
      00A504 55 00 03         [ 4] 3787 	call expression
      00A507 00 02            [ 1] 3788 	cp a,#TK_INTGR
      00A509 5B 02            [ 1] 3789 	jreq 1$ 
      00A50B CC 97 C7         [ 2] 3790 	jp syntax_error
      00A50E                       3791 1$: _xpop 
      00A50E 72 00            [ 1]    1     ld a,(y)
      00A510 00               [ 1]    2     ldw x,y 
      00A511 23 05            [ 2]    3     ldw x,(1,x)
      00A513 A6 06 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      002B7B                       3792 pause02:
      00A517 16 00 12         [ 2] 3793 	ldw timer,x 
      00A518 CE 00 12         [ 2] 3794 1$: ldw x,timer 
      00A518 CD               [ 2] 3795 	tnzw x 
      00A519 A4 0A            [ 1] 3796 	jreq 2$
      00A51B 8F               [10] 3797 	wfi 
      00A51B CF 00            [ 1] 3798 	jrne 1$
      002B87                       3799 2$:	
      00A51D 05               [ 4] 3800 	ret 
                                   3801 
                                   3802 ;------------------------------
                                   3803 ; BASIC: AWU expr
                                   3804 ; halt mcu for 'expr' milliseconds
                                   3805 ; use Auto wakeup peripheral
                                   3806 ; all oscillators stopped except LSI
                                   3807 ; range: 1ms - 511ms
                                   3808 ; input:
                                   3809 ;  none
                                   3810 ; output:
                                   3811 ;  none:
                                   3812 ;------------------------------
      002B88                       3813 awu:
      00A51E E6 02 C7         [ 4] 3814   call expression
      00A521 00 03            [ 1] 3815   cp a,#TK_INTGR
      00A523 35 03            [ 1] 3816   jreq 1$
      00A525 00 02 81         [ 2] 3817   jp syntax_error
      00A528                       3818 1$: _xpop 
      00A528 72 00            [ 1]    1     ld a,(y)
      00A52A 00               [ 1]    2     ldw x,y 
      00A52B 23 06            [ 2]    3     ldw x,(1,x)
      00A52D A6 06 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      002B9B                       3819 awu02:
      00A531 16 81 00         [ 2] 3820   cpw x,#5120
      00A533 2B 0C            [ 1] 3821   jrmi 1$ 
      00A533 CD A4 0A CF      [ 1] 3822   mov AWU_TBR,#15 
      00A537 00 1A            [ 1] 3823   ld a,#30
      00A539 62               [ 2] 3824   div x,a
      00A539 85 52            [ 1] 3825   ld a,#16
      00A53B 04               [ 2] 3826   div x,a 
      00A53C 89 CE            [ 2] 3827   jra 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      002BAC                       3828 1$: 
      00A53E 00 05 1F         [ 2] 3829   cpw x,#2048
      00A541 03 CE            [ 1] 3830   jrmi 2$ 
      00A543 00 01 1F 05      [ 1] 3831   mov AWU_TBR,#14
      00A547 CE 00            [ 1] 3832   ld a,#80
      00A549 1A               [ 2] 3833   div x,a 
      00A54A 20 CF            [ 2] 3834   jra 4$   
      00A54C                       3835 2$:
      00A54C 72 00 00 23      [ 1] 3836   mov AWU_TBR,#7
      002BBE                       3837 3$:  
                                   3838 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A550 05 A6 06         [ 2] 3839   cpw x,#64 
      00A553 CC 97            [ 2] 3840   jrule 4$ 
      00A555 16 5C 50 F2      [ 1] 3841   inc AWU_TBR 
      00A556 54               [ 2] 3842   srlw x 
      00A556 1E 03            [ 2] 3843   jra 3$ 
      002BCA                       3844 4$:
      00A558 CF               [ 1] 3845   ld a, xl
      00A559 00               [ 1] 3846   dec a 
      00A55A 05 E6            [ 1] 3847   jreq 5$
      00A55C 02               [ 1] 3848   dec a 	
      002BCF                       3849 5$: 
      00A55D C7 00            [ 1] 3850   and a,#0x3e 
      00A55F 03 1E 05         [ 1] 3851   ld AWU_APR,a 
      00A562 CF 00 01 85      [ 1] 3852   bset AWU_CSR,#AWU_CSR_AWUEN
      00A566 5B               [10] 3853   halt 
                                   3854 
      00A567 04               [ 4] 3855   ret 
                                   3856 
                                   3857 ;------------------------------
                                   3858 ; BASIC: TICKS
                                   3859 ; return msec ticks counter value 
                                   3860 ; input:
                                   3861 ; 	none 
                                   3862 ; output:
                                   3863 ;	X 		TK_INTGR
                                   3864 ;-------------------------------
      002BDA                       3865 get_ticks:
      00A568 FC 00 0F         [ 1] 3866 	ld a,ticks 
      00A569 CE 00 10         [ 2] 3867 	ldw x,ticks+1 
      00A569 4D               [ 4] 3868 	ret 
                                   3869 
                                   3870 ;------------------------------
                                   3871 ; BASIC: ABS(expr)
                                   3872 ; return absolute value of expr.
                                   3873 ; input:
                                   3874 ;   none
                                   3875 ; output:
                                   3876 ;   xstack    positive int24 
                                   3877 ;-------------------------------
      002BE1                       3878 abs:
      00A56A 26 0D A3         [ 4] 3879 	call func_args 
      00A56D B9 00            [ 1] 3880 	cp a,#1 
      00A56F 25 07            [ 1] 3881 	jreq 0$ 
      00A571 89 CD A9         [ 2] 3882 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      002BEB                       3883 0$:  
      00A574 01 85 27         [ 4] 3884 	call abs24 
      002BEE                       3885 	_xpop 
      00A577 01 43            [ 1]    1     ld a,(y)
      00A579 81               [ 1]    2     ldw x,y 
      00A57A EE 01            [ 2]    3     ldw x,(1,x)
      00A57A 72 01 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A57E 02               [ 4] 3886 	ret 
                                   3887 
                                   3888 ;------------------------------
                                   3889 ; BASIC: LSHIFT(expr1,expr2)
                                   3890 ; logical shift left expr1 by 
                                   3891 ; expr2 bits 
                                   3892 ; output:
                                   3893 ; 	A:x 	result 
                                   3894 ;------------------------------
      002BF8                       3895 lshift:
      00A57F 4F 81 BE         [ 4] 3896 	call func_args
      00A581 A1 02            [ 1] 3897 	cp a,#2 
      00A581 72 09            [ 1] 3898 	jreq 1$
      00A583 00 23 12         [ 2] 3899 	jp syntax_error
      002C02                       3900 1$: _xpop 
      00A586 5B 02            [ 1]    1     ld a,(y)
      00A588 CD               [ 1]    2     ldw x,y 
      00A589 A0 EE            [ 2]    3     ldw x,(1,x)
      00A58B 5B 04 72 19      [ 2]    4     addw y,#CELL_SIZE 
      00A58F 00               [ 1] 3901 	ld a,xl 
      00A590 23               [ 1] 3902 	push a      
      002C0D                       3903 	_xpop  ; T>A:X 
      00A591 72 10            [ 1]    1     ld a,(y)
      00A593 00               [ 1]    2     ldw x,y 
      00A594 23 CC            [ 2]    3     ldw x,(1,x)
      00A596 97 BF 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A598 0D 01            [ 1] 3904 	tnz (1,sp) 
      00A598 CD 98            [ 1] 3905 	jreq 4$
      00A59A 7B               [ 1] 3906 2$:	rcf 
      00A59B A1               [ 2] 3907 	rlcw x 
      00A59C 03               [ 1] 3908 	rlc a 
      00A59D 26 1F            [ 1] 3909 	dec (1,sp) 
      00A59F 89 CD            [ 1] 3910 	jrne 2$
      002C21                       3911 4$: _drop 1 
      00A5A1 98 94            [ 2]    1     addw sp,#1 
      00A5A3 85               [ 4] 3912 	ret
                                   3913 
                                   3914 ;------------------------------
                                   3915 ; BASIC: RSHIFT(expr1,expr2)
                                   3916 ; logical shift right expr1 by 
                                   3917 ; expr2 bits.
                                   3918 ; output:
                                   3919 ; 	A 		TK_INTGR
                                   3920 ;   X 		result 
                                   3921 ;------------------------------
      002C24                       3922 rshift:
      00A5A4 CD B2 7A         [ 4] 3923 	call func_args
      00A5A7 26 05            [ 1] 3924 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A5A9 A6 12            [ 1] 3925 	jreq 1$
      00A5AB CC 97 16         [ 2] 3926 	jp syntax_error
      002C2E                       3927 1$: _xpop ; T>A:X
      00A5AE CF 00            [ 1]    1     ld a,(y)
      00A5B0 1C               [ 1]    2     ldw x,y 
      00A5B1 1D 00            [ 2]    3     ldw x,(1,x)
      00A5B3 02 FE 72 BB      [ 2]    4     addw y,#CELL_SIZE 
      00A5B7 00               [ 1] 3928     ld a,xl 
      00A5B8 1C               [ 1] 3929 	push a    
      002C39                       3930 	_xpop  
      00A5B9 CF 00            [ 1]    1     ld a,(y)
      00A5BB 1E               [ 1]    2     ldw x,y 
      00A5BC 20 19            [ 2]    3     ldw x,(1,x)
      00A5BE 55 00 04 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5C2 02 CE            [ 1] 3931 	tnz (1,sp)
      00A5C4 00 1C            [ 1] 3932 	jreq 4$
      00A5C6 C3               [ 1] 3933 2$:	rcf 
      00A5C7 00               [ 1] 3934 	rrc a 
      00A5C8 1E               [ 2] 3935 	rrcw x 
      00A5C9 2B 0C            [ 1] 3936 	dec (1,sp) 
      00A5CB AE 96            [ 1] 3937 	jrne 2$
      002C4D                       3938 4$: _drop 1 
      00A5CD 6B CD            [ 2]    1     addw sp,#1 
      00A5CF 89               [ 4] 3939 	ret
                                   3940 
                                   3941 ;--------------------------
                                   3942 ; BASIC: FCPU integer
                                   3943 ; set CPU frequency 
                                   3944 ;-------------------------- 
                                   3945 
      002C50                       3946 fcpu:
      00A5D0 DC 55            [ 1] 3947 	ld a,#TK_INTGR
      00A5D2 00 03 00         [ 4] 3948 	call expect 
      00A5D5 02 81 2D         [ 4] 3949 	call get_int24 
      00A5D7 9F               [ 1] 3950 	ld a,xl 
      00A5D7 5B 02            [ 1] 3951 	and a,#7 
      00A5D9 C7 50 C6         [ 1] 3952 	ld CLK_CKDIVR,a 
      00A5D9 CD               [ 4] 3953 	ret 
                                   3954 
                                   3955 ;------------------------------
                                   3956 ; BASIC: PMODE pin#, mode 
                                   3957 ; Arduino pin. 
                                   3958 ; define pin as input or output
                                   3959 ; pin#: {0..15}
                                   3960 ; mode: INPUT|OUTPUT  
                                   3961 ;------------------------------
                           000001  3962 	PINNO=1
                           000001  3963 	VSIZE=1
      002C5F                       3964 pin_mode:
      002C5F                       3965 	_vars VSIZE 
      00A5DA 9D 52            [ 2]    1     sub sp,#VSIZE 
      00A5DC CD 94 82         [ 4] 3966 	call arg_list 
      00A5DF CE 00            [ 1] 3967 	cp a,#2 
      00A5E1 1E CF            [ 1] 3968 	jreq 1$
      00A5E3 00 31 CF         [ 2] 3969 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      002C6B                       3970 1$: _xpop 
      00A5E6 00 33            [ 1]    1     ld a,(y)
      00A5E8 5F               [ 1]    2     ldw x,y 
      00A5E9 CF 00            [ 2]    3     ldw x,(1,x)
      00A5EB 07 72 5F 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5EF 09 72 5F         [ 2] 3971 	ldw ptr16,x ; mode 
      002C77                       3972 	_xpop ; Dx pin 
      00A5F2 00 0A            [ 1]    1     ld a,(y)
      00A5F4 CE               [ 1]    2     ldw x,y 
      00A5F5 00 1C            [ 2]    3     ldw x,(1,x)
      00A5F7 CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A5FB 02 C7 00         [ 4] 3973 	call select_pin 
      00A5FE 03 35            [ 1] 3974 	ld (PINNO,sp),a  
      00A600 03 00            [ 1] 3975 	ld a,#1 
      00A602 02 72            [ 1] 3976 	tnz (PINNO,sp)
      00A604 10 00            [ 1] 3977 	jreq 4$
      00A606 23               [ 1] 3978 2$:	sll a 
      00A607 CC 97            [ 1] 3979 	dec (PINNO,sp)
      00A609 BF FB            [ 1] 3980 	jrne 2$ 
      00A60A 6B 01            [ 1] 3981 	ld (PINNO,sp),a
      00A60A 5B 02            [ 1] 3982 	ld a,(PINNO,sp)
      00A60C 72 5D            [ 1] 3983 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A60E 00 35            [ 1] 3984 	ld (GPIO_CR1,x),a 
      00A610 27 1D            [ 1] 3985 4$:	ld a,#OUTP
      00A612 72 5A 00         [ 1] 3986 	cp a,acc8 
      00A615 35 1E            [ 1] 3987 	jreq 6$
                                   3988 ; input mode
                                   3989 ; disable external interrupt 
      00A617 01 CF            [ 1] 3990 	ld a,(PINNO,sp)
      00A619 00               [ 1] 3991 	cpl a 
      00A61A 05 1E            [ 1] 3992 	and a,(GPIO_CR2,x)
      00A61C 03 CF            [ 1] 3993 	ld (GPIO_CR2,x),a 
                                   3994 ;clear bit in DDR for input mode 
      00A61E 00 02            [ 1] 3995 	ld a,(PINNO,sp)
      00A620 1E               [ 1] 3996 	cpl a 
      00A621 05 CF            [ 1] 3997 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A623 00 1C            [ 1] 3998 	ld (GPIO_DDR,x),a 
      00A625 1E 07            [ 2] 3999 	jra 9$
      002CAF                       4000 6$: ;output mode  
      00A627 CF 00            [ 1] 4001 	ld a,(PINNO,sp)
      00A629 1E 5B            [ 1] 4002 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A62B 08 CC            [ 1] 4003 	ld (GPIO_DDR,x),a 
      00A62D 97 BF            [ 1] 4004 	ld a,(PINNO,sp)
      00A62F EA 04            [ 1] 4005 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A62F AE 17            [ 1] 4006 	ld (GPIO_CR2,x),a 
      002CBB                       4007 9$:	
      002CBB                       4008 	_drop VSIZE 
      00A631 FF 94            [ 2]    1     addw sp,#VSIZE 
      00A633 CC               [ 4] 4009 	ret
                                   4010 
                                   4011 ;------------------------
                                   4012 ; select Arduino pin 
                                   4013 ; input:
                                   4014 ;   X 	 {0..15} Arduino Dx 
                                   4015 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



                                   4016 ;   A     stm8s208 pin 
                                   4017 ;   X     base address s208 GPIO port 
                                   4018 ;---------------------------
      002CBE                       4019 select_pin:
      00A634 97               [ 2] 4020 	sllw x 
      00A635 A0 2C CE         [ 2] 4021 	addw x,#arduino_to_8s208 
      00A636 FE               [ 2] 4022 	ldw x,(x)
      00A636 CD               [ 1] 4023 	ld a,xl 
      00A637 98               [ 1] 4024 	push a 
      00A638 7B               [ 1] 4025 	swapw x 
      00A639 A1 85            [ 1] 4026 	ld a,#5 
      00A63B 27               [ 4] 4027 	mul x,a 
      00A63C 03 CC 97         [ 2] 4028 	addw x,#GPIO_BASE 
      00A63F 14               [ 1] 4029 	pop a 
      00A640 CD               [ 4] 4030 	ret 
                                   4031 ; translation from Arduino D0..D15 to stm8s208rb 
      002CCE                       4032 arduino_to_8s208:
      00A641 98 A3                 4033 .byte 3,6 ; D0 
      00A643 CF 00                 4034 .byte 3,5 ; D1 
      00A645 1A CD                 4035 .byte 4,0 ; D2 
      00A647 89 88                 4036 .byte 2,1 ; D3
      00A649 27 03                 4037 .byte 6,0 ; D4
      00A64B CD 89                 4038 .byte 2,2 ; D5
      00A64D 8F 72                 4039 .byte 2,3 ; D6
      00A64F 3F 00                 4040 .byte 3,1 ; D7
      00A651 1A 72                 4041 .byte 3,3 ; D8
      00A653 5C 00                 4042 .byte 2,4 ; D9
      00A655 1B 72                 4043 .byte 4,5 ; D10
      00A657 3F 00                 4044 .byte 2,6 ; D11
      00A659 1A 72                 4045 .byte 2,7 ; D12
      00A65B 5C 00                 4046 .byte 2,5 ; D13
      00A65D 1B 72                 4047 .byte 4,2 ; D14
      00A65F C7 00                 4048 .byte 4,1 ; D15
                                   4049 
                                   4050 
                                   4051 ;------------------------------
                                   4052 ; BASIC: RND(expr)
                                   4053 ; return random number 
                                   4054 ; between 1 and expr inclusive
                                   4055 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4056 ; input:
                                   4057 ; 	none 
                                   4058 ; output:
                                   4059 ;	xstack 	random positive integer 
                                   4060 ;------------------------------
      002CEE                       4061 random:
      00A661 1A 81 BE         [ 4] 4062 	call func_args 
      00A663 A1 01            [ 1] 4063 	cp a,#1
      00A663 90 89            [ 1] 4064 	jreq 1$
      00A665 AE 00 64         [ 2] 4065 	jp syntax_error
      002CF8                       4066 1$:  
      002CF8                       4067 	_xpop   
      00A668 90 AE            [ 1]    1     ld a,(y)
      00A66A 03               [ 1]    2     ldw x,y 
      00A66B E8 20            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A66D 22 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A66E 89               [ 2] 4068 	pushw x 
      00A66E 90               [ 1] 4069 	push a  
      00A66F 89 CD            [ 1] 4070 	ld a,#0x80 
      00A671 9A 43            [ 1] 4071 	bcp a,(1,sp)
      00A673 A1 02            [ 1] 4072 	jreq 2$
      00A675 27 03            [ 1] 4073 	ld a,#ERR_BAD_VALUE
      00A677 CC 97 14         [ 2] 4074 	jp tb_error
      00A67A                       4075 2$: 
                                   4076 ; acc16=(x<<5)^x 
      00A67A 90 F6 93         [ 2] 4077 	ldw x,seedx 
      00A67D EE               [ 2] 4078 	sllw x 
      00A67E 01               [ 2] 4079 	sllw x 
      00A67F 72               [ 2] 4080 	sllw x 
      00A680 A9               [ 2] 4081 	sllw x 
      00A681 00               [ 2] 4082 	sllw x 
      00A682 03               [ 1] 4083 	ld a,xh 
      00A683 89 90 F6         [ 1] 4084 	xor a,seedx 
      00A686 93 EE 01         [ 1] 4085 	ld acc16,a 
      00A689 72               [ 1] 4086 	ld a,xl 
      00A68A A9 00 03         [ 1] 4087 	xor a,seedx+1 
      00A68D 90 93 85         [ 1] 4088 	ld acc8,a 
                                   4089 ; seedx=seedy 
      00A690 CE 00 16         [ 2] 4090 	ldw x,seedy 
      00A690 89 AE F4         [ 2] 4091 	ldw seedx,x  
                                   4092 ; seedy=seedy^(seedy>>1)
      00A693 24 65 90         [ 2] 4093 	ldw x,seedy 
      00A696 A3               [ 2] 4094 	srlw x 
      00A697 7A               [ 1] 4095 	ld a,xh 
      00A698 12 2B 01         [ 1] 4096 	xor a,seedy 
      00A69B 5C 00 16         [ 1] 4097 	ld seedy,a  
      00A69C 9F               [ 1] 4098 	ld a,xl 
      00A69C 9E C7 53         [ 1] 4099 	xor a,seedy+1 
      00A69F 0D 9F C7         [ 1] 4100 	ld seedy+1,a 
                                   4101 ; acc16>>3 
      00A6A2 53 0E 8C         [ 2] 4102 	ldw x,acc16 
      00A6A5 56               [ 2] 4103 	srlw x 
      00A6A6 9E               [ 2] 4104 	srlw x 
      00A6A7 C7               [ 2] 4105 	srlw x 
                                   4106 ; x=acc16^x 
      00A6A8 53               [ 1] 4107 	ld a,xh 
      00A6A9 0F 9F C7         [ 1] 4108 	xor a,acc16 
      00A6AC 53 10 72         [ 1] 4109 	ld acc16,a 
      00A6AF 10               [ 1] 4110 	ld a,xl 
      00A6B0 53 08 72         [ 1] 4111 	xor a,acc8 
      00A6B3 10 53 00         [ 1] 4112 	ld acc8,a 
                                   4113 ; seedy=acc16^seedy 
      00A6B6 72 10 53         [ 1] 4114 	xor a,seedy+1
      00A6B9 04               [ 1] 4115 	ld xl,a 
      00A6BA 85 CD AB         [ 1] 4116 	ld a,acc16 
      00A6BD FB 72 11         [ 1] 4117 	xor a,seedy
      00A6C0 53               [ 1] 4118 	ld xh,a 
      00A6C1 08 72 11         [ 2] 4119 	ldw seedy,x 
                                   4120 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A6C4 53 00 90         [ 1] 4121 	ld a,seedx+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A6C7 85 81            [ 1] 4122 	and a,#127
      00A6C9                       4123 	_xpush 
      00A6C9 CD 9A 43 A1      [ 2]    1     subw y,#CELL_SIZE
      00A6CD 02 27            [ 1]    2     ld (y),a 
      00A6CF 12 A1 01         [ 2]    3     ldw (1,y),x 
      00A6D2 27               [ 1] 4124 	pop a 
      00A6D3 03               [ 2] 4125 	popw x 
      002D6E                       4126 	_xpush 
      00A6D4 CC 97 14 4F      [ 2]    1     subw y,#CELL_SIZE
      00A6D8 5F 72            [ 1]    2     ld (y),a 
      00A6DA A2 00 03         [ 2]    3     ldw (1,y),x 
      00A6DD 90 F7 90         [ 4] 4127 	call mod24 
      002D7A                       4128 	_xpop
      00A6E0 EF 01            [ 1]    1     ld a,(y)
      00A6E2 90               [ 1]    2     ldw x,y 
      00A6E3 E6 03            [ 2]    3     ldw x,(1,x)
      00A6E5 93 EE 04 5D      [ 2]    4     addw y,#CELL_SIZE 
      00A6E9 27 25 90         [ 2] 4129 	addw x,#1 
      00A6EC F6 93            [ 1] 4130 	adc a,#0  
      00A6EE EE               [ 4] 4131 	ret 
                                   4132 
                                   4133 ;---------------------------------
                                   4134 ; BASIC: WORDS 
                                   4135 ; affiche la listes des mots du
                                   4136 ; dictionnaire ainsi que le nombre
                                   4137 ; de mots.
                                   4138 ;---------------------------------
                           000001  4139 	WLEN=1 ; word length
                           000002  4140 	LLEN=2 ; character sent to console
                           000003  4141 	WCNT=3 ; count words printed 
                           000003  4142 	VSIZE=3 
      002D89                       4143 words:
      00A6EF 01 72            [ 2] 4144 	pushw y
      002D8B                       4145 	_vars VSIZE
      00A6F1 A9 00            [ 2]    1     sub sp,#VSIZE 
      00A6F3 03 72            [ 1] 4146 	clr (LLEN,sp)
      00A6F5 A9 00            [ 1] 4147 	clr (WCNT,sp)
      00A6F7 03 9F A4 07      [ 2] 4148 	ldw y,#kword_dict+2
      00A6FB 4E               [ 1] 4149 0$:	ldw x,y
      00A6FC C7               [ 1] 4150 	ld a,(x)
      00A6FD 54 01            [ 1] 4151 	and a,#15 
      00A6FF 72 16            [ 1] 4152 	ld (WLEN,sp),a 
      00A701 50 CA            [ 1] 4153 	inc (WCNT,sp)
      00A703 72               [ 1] 4154 1$:	incw x 
      00A704 10               [ 1] 4155 	ld a,(x)
      00A705 54 01 AE         [ 4] 4156 	call putc 
      00A708 00 1B            [ 1] 4157 	inc (LLEN,sp)
      00A70A 5A 9D            [ 1] 4158 	dec (WLEN,sp)
      00A70C 26 FA            [ 1] 4159 	jrne 1$
      00A70E 20 08            [ 1] 4160 	ld a,#70
      00A710 72 11            [ 1] 4161 	cp a,(LLEN,sp)
      00A712 54 01            [ 1] 4162 	jrmi 2$   
      00A714 72 17            [ 1] 4163 	ld a,#SPACE 
      00A716 50 CA FF         [ 4] 4164 	call putc 
      00A718 0C 02            [ 1] 4165 	inc (LLEN,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A718 81 07            [ 2] 4166 	jra 3$
      00A719 A6 0D            [ 1] 4167 2$: ld a,#CR 
      00A719 CD 9A 3E         [ 4] 4168 	call putc 
      00A71C A1 01            [ 1] 4169 	clr (LLEN,sp)
      00A71E 27 03 CC 97      [ 2] 4170 3$:	subw y,#2 
      00A722 14 90            [ 2] 4171 	ldw y,(y)
      00A724 F6 93            [ 1] 4172 	jrne 0$ 
      00A726 EE 01            [ 1] 4173 	ld a,#CR 
      00A728 72 A9 00         [ 4] 4174 	call putc  
      00A72B 03               [ 1] 4175 	clrw x 
      00A72C A3 00            [ 1] 4176 	ld a,(WCNT,sp)
      00A72E 05               [ 1] 4177 	ld xl,a 
      00A72F 23 05 A6         [ 4] 4178 	call prt_i16 
      00A732 0A CC 97         [ 2] 4179 	ldw x,#words_count_msg
      00A735 16 9F C7         [ 4] 4180 	call puts 
      002DD8                       4181 	_drop VSIZE 
      00A738 00 0F            [ 2]    1     addw sp,#VSIZE 
      00A73A A6 05            [ 2] 4182 	popw y 
      00A73C C0               [ 4] 4183 	ret 
      00A73D 00 0F C7 54 00 72 16  4184 words_count_msg: .asciz " words in dictionary\n"
             54 02 72 10 54 01 72
             0F 54 00 FB CE 54 04
             A6
                                   4185 
                                   4186 
                                   4187 ;-----------------------------
                                   4188 ; BASIC: TIMER expr 
                                   4189 ; initialize count down timer 
                                   4190 ;-----------------------------
      002DF3                       4191 set_timer:
      00A753 84 81 C3         [ 4] 4192 	call arg_list
      00A755 A1 01            [ 1] 4193 	cp a,#1 
      00A755 52 01            [ 1] 4194 	jreq 1$
      00A757 CD 9A 3E         [ 2] 4195 	jp syntax_error
      002DFD                       4196 1$: 
      002DFD                       4197 	_xpop  
      00A75A A1 01            [ 1]    1     ld a,(y)
      00A75C 27               [ 1]    2     ldw x,y 
      00A75D 03 CC            [ 2]    3     ldw x,(1,x)
      00A75F 97 14 90 F6      [ 2]    4     addw y,#CELL_SIZE 
      00A763 93 EE 01         [ 2] 4198 	ldw timer,x 
      00A766 72               [ 4] 4199 	ret 
                                   4200 
                                   4201 ;------------------------------
                                   4202 ; BASIC: TIMEOUT 
                                   4203 ; return state of timer 
                                   4204 ; output:
                                   4205 ;   A:X     0 not timeout 
                                   4206 ;   A:X     -1 timeout 
                                   4207 ;------------------------------
      002E0A                       4208 timeout:
      00A767 A9               [ 1] 4209 	clr a 
      00A768 00 03 A3         [ 2] 4210 	ldw x,timer 
      00A76B 00 0F            [ 1] 4211 	jreq 1$
      00A76D 23               [ 1] 4212 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A76E 05               [ 4] 4213 	ret  
      00A76F A6               [ 1] 4214 1$:	cpl a
      00A770 0A               [ 2] 4215 	cplw x 
      00A771 CC               [ 4] 4216 	ret 
                                   4217  	
                                   4218 
                                   4219 
                                   4220 
                                   4221 ;-----------------------------------
                                   4222 ; BASIC: IWDGEN expr1 
                                   4223 ; enable independant watchdog timer
                                   4224 ; expr1 is delay in multiple of 62.5µsec
                                   4225 ; expr1 -> {1..16383}
                                   4226 ;-----------------------------------
      002E15                       4227 enable_iwdg:
      00A772 97 16 CD         [ 4] 4228 	call arg_list
      00A775 AD 3E            [ 1] 4229 	cp a,#1 
      00A777 6B 01            [ 1] 4230 	jreq 1$
      00A779 E6 01 0D         [ 2] 4231 	jp syntax_error 
      002E1F                       4232 1$: _xpop  
      00A77C 01 27            [ 1]    1     ld a,(y)
      00A77E 05               [ 1]    2     ldw x,y 
      00A77F 44 0A            [ 2]    3     ldw x,(1,x)
      00A781 01 26 FB A4      [ 2]    4     addw y,#CELL_SIZE 
      00A785 01 5F            [ 1] 4233 	push #0
      00A787 97 4F 5B 01      [ 1] 4234 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A78B 81               [ 1] 4235 	ld a,xh 
      00A78C A4 3F            [ 1] 4236 	and a,#0x3f
      00A78C 52               [ 1] 4237 	ld xh,a  
      00A78D 02 CD 9A         [ 2] 4238 2$:	cpw x,#255
      00A790 43 A1            [ 2] 4239 	jrule 3$
      00A792 02 27            [ 1] 4240 	inc (1,sp)
      00A794 03               [ 1] 4241 	rcf 
      00A795 CC               [ 2] 4242 	rrcw x 
      00A796 97 14            [ 2] 4243 	jra 2$
      00A798 90 F6 93 EE      [ 1] 4244 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A79C 01               [ 1] 4245 	pop a  
      00A79D 72 A9 00         [ 1] 4246 	ld IWDG_PR,a 
      00A7A0 03               [ 1] 4247 	ld a,xl
      00A7A1 9F               [ 1] 4248 	dec a 
      00A7A2 6B 02 90 F6      [ 1] 4249 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7A6 93 EE 01         [ 1] 4250 	ld IWDG_RLR,a 
      00A7A9 72 A9 00 03      [ 1] 4251 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A7AD A3               [ 4] 4252 	ret 
                                   4253 
                                   4254 
                                   4255 ;-----------------------------------
                                   4256 ; BASIC: IWDGREF  
                                   4257 ; refresh independant watchdog count down 
                                   4258 ; timer before it reset MCU. 
                                   4259 ;-----------------------------------
      002E53                       4260 refresh_iwdg:
      00A7AE 00 0F 23 05      [ 1] 4261 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A7B2 A6               [ 4] 4262 	ret 
                                   4263 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4264 
                                   4265 ;-------------------------------------
                                   4266 ; BASIC: LOG2(expr)
                                   4267 ; return logarithm base 2 of expr 
                                   4268 ; this is the position of most significant
                                   4269 ; bit set. 
                                   4270 ; input: 
                                   4271 ; output:
                                   4272 ;   A     TK_INTGR 
                                   4273 ;   xstack log2 
                                   4274 ;*********************************
      002E58                       4275 log2:
      00A7B3 0A CC 97         [ 4] 4276 	call func_args 
      00A7B6 16 CD            [ 1] 4277 	cp a,#1 
      00A7B8 AD 3E            [ 1] 4278 	jreq 1$
      00A7BA 6B 01 A6         [ 2] 4279 	jp syntax_error 
      002E62                       4280 1$: 
      002E62                       4281 	_xpop    
      00A7BD 01 0D            [ 1]    1     ld a,(y)
      00A7BF 01               [ 1]    2     ldw x,y 
      00A7C0 27 05            [ 2]    3     ldw x,(1,x)
      00A7C2 48 0A 01 26      [ 2]    4     addw y,#CELL_SIZE 
      00A7C6 FB               [ 1] 4282 	tnz a
      00A7C7 0D 02            [ 1] 4283 	jrne 2$ 
      00A7C9 26               [ 2] 4284 	tnzw x 
      00A7CA 05 43            [ 1] 4285 	jrne 2$
      00A7CC E4 00            [ 1] 4286 	ld a,#ERR_BAD_VALUE
      00A7CE 20 02 EA         [ 2] 4287 	jp tb_error 
      00A7D1 00 E7            [ 1] 4288 2$: push #24 
      00A7D3 00               [ 2] 4289 3$: rlcw x 
      00A7D4 5B               [ 1] 4290     rlc a 
      00A7D5 02 81            [ 1] 4291 	jrc 4$
      00A7D7 0A 01            [ 1] 4292 	dec (1,sp) 
      00A7D7 72 00            [ 1] 4293 	jrne 3$
      00A7D9 00               [ 1] 4294 4$: clrw x 
      00A7DA 23               [ 1] 4295     pop a 
      00A7DB 02               [ 1] 4296 	dec a
      00A7DC 4F               [ 1] 4297 	rlwa x  
      002E84                       4298 9$:	
      00A7DD 81               [ 4] 4299 	ret 
                                   4300 
                                   4301 ;-----------------------------------
                                   4302 ; BASIC: BIT(expr) 
                                   4303 ; expr ->{0..23}
                                   4304 ; return 2^expr 
                                   4305 ; output:
                                   4306 ;    A:X    2^expr 
                                   4307 ;-----------------------------------
      00A7DE                       4308 bitmask:
      00A7DE AE A8 05         [ 4] 4309     call func_args 
      00A7E1 CD 89            [ 1] 4310 	cp a,#1
      00A7E3 DC 5B            [ 1] 4311 	jreq 1$
      00A7E5 02 52 04         [ 2] 4312 	jp syntax_error 
      002E8F                       4313 1$: _xpop 
      00A7E8 CD A0            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A7EA DE               [ 1]    2     ldw x,y 
      00A7EB AE 16            [ 2]    3     ldw x,(1,x)
      00A7ED 68 CF 00 05      [ 2]    4     addw y,#CELL_SIZE 
      00A7F1 7F               [ 1] 4314 	ld a,xl 
      00A7F2 72 5F 00         [ 2] 4315 	ldw x,#1 
      00A7F5 03 5F            [ 1] 4316 	and a,#23
      00A7F7 CF 00            [ 1] 4317 	jreq 9$
      00A7F9 01               [ 1] 4318 	push a 
      00A7FA 72               [ 1] 4319 	clr a 
      002EA2                       4320 2$: 
      00A7FB 11               [ 2] 4321 	slaw x 
      00A7FC 00               [ 1] 4322 	rlc a 	
      00A7FD 23 72            [ 1] 4323 	dec (1,sp)
      00A7FF 18 00            [ 1] 4324 	jrne 2$ 
      002EA8                       4325 4$:
      002EA8                       4326     _drop 1 
      00A801 23 CC            [ 2]    1     addw sp,#1 
      00A803 97               [ 4] 4327 9$:	ret 
                                   4328 
                                   4329 ;------------------------------
                                   4330 ; BASIC: DO 
                                   4331 ; initiate a DO ... UNTIL loop 
                                   4332 ;------------------------------
                           000003  4333 	DOLP_ADR=3 
                           000005  4334 	DOLP_INW=5
                           000004  4335 	VSIZE=4 
      002EAB                       4336 do_loop:
      00A804 BF               [ 2] 4337 	popw x 
      002EAC                       4338 	_vars VSIZE 
      00A805 0A 62            [ 2]    1     sub sp,#VSIZE 
      00A807 72               [ 2] 4339 	pushw x 
      00A808 65 61 6B         [ 2] 4340 	ldw x,basicptr 
      00A80B 20 70            [ 2] 4341 	ldw (DOLP_ADR,sp),x
      00A80D 6F 69 6E         [ 2] 4342 	ldw x,in.w 
      00A810 74 2C            [ 2] 4343 	ldw (DOLP_INW,sp),x
      00A812 20 52 55 4E      [ 1] 4344 	inc loop_depth 
      00A816 20               [ 4] 4345 	ret 
                                   4346 
                                   4347 ;--------------------------------
                                   4348 ; BASIC: UNTIL expr 
                                   4349 ; loop if exprssion is false 
                                   4350 ; else terminate loop
                                   4351 ;--------------------------------
      002EBE                       4352 until: 
      00A817 74 6F 20 72      [ 1] 4353 	tnz loop_depth 
      00A81B 65 73            [ 1] 4354 	jrne 1$ 
      00A81D 75 6D 65         [ 2] 4355 	jp syntax_error 
      002EC7                       4356 1$: 
      00A820 2E 0A 00         [ 4] 4357 	call condition  
      00A823                       4358 	_xpop 
      00A823 72 01            [ 1]    1     ld a,(y)
      00A825 00               [ 1]    2     ldw x,y 
      00A826 23 01            [ 2]    3     ldw x,(1,x)
      00A828 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A829 4D               [ 1] 4359 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A829 CD 95            [ 1] 4360 	jrne 9$ 
      00A82B 2A               [ 2] 4361 	tnzw x 
      00A82C 81 10            [ 1] 4362 	jrne 9$ 
      00A82D 1E 03            [ 2] 4363 	ldw x,(DOLP_ADR,sp)
      00A82D 89 CD 98         [ 2] 4364 	ldw basicptr,x 
      00A830 94 85            [ 1] 4365 	ld a,(2,x)
      00A832 CD B2 7A         [ 1] 4366 	ld count,a 
      00A835 27 4A            [ 2] 4367 	ldw x,(DOLP_INW,sp)
      00A837 CD 87 67         [ 2] 4368 	ldw in.w,x 
      00A83A 72               [ 4] 4369 	ret 
      002EE9                       4370 9$:	; remove loop data from stack  
      00A83B 5F               [ 2] 4371 	popw x
      002EEA                       4372 	_drop VSIZE
      00A83C 00 19            [ 2]    1     addw sp,#VSIZE 
      00A83E 52 06 1D 00      [ 1] 4373 	dec loop_depth 
      00A842 04               [ 2] 4374 	jp (x)
                                   4375 
                                   4376 ;--------------------------
                                   4377 ; BASIC: PORTA...PORTI  
                                   4378 ;  return constant value 
                                   4379 ;  PORT  base address 
                                   4380 ;---------------------------
      002EF1                       4381 const_porta:
      00A843 1F 01 EE         [ 2] 4382 	ldw x,#PA_BASE 
      00A846 02               [ 1] 4383 	clr a 
      00A847 1F               [ 4] 4384 	ret 
      002EF6                       4385 const_portb:
      00A848 03 A6 80         [ 2] 4386 	ldw x,#PB_BASE 
      00A84B 62               [ 1] 4387 	clr a 
      00A84C 4D               [ 4] 4388 	ret 
      002EFB                       4389 const_portc:
      00A84D 27 01 5C         [ 2] 4390 	ldw x,#PC_BASE 
      00A850 1F               [ 1] 4391 	clr a 
      00A851 05               [ 4] 4392 	ret 
      002F00                       4393 const_portd:
      00A852 1E 01 CF         [ 2] 4394 	ldw x,#PD_BASE 
      00A855 00               [ 1] 4395 	clr a 
      00A856 1A               [ 4] 4396 	ret 
      002F05                       4397 const_porte:
      00A857 CD 87 E5         [ 2] 4398 	ldw x,#PE_BASE 
      00A85A AE               [ 1] 4399 	clr a 
      00A85B 00               [ 4] 4400 	ret 
      002F0A                       4401 const_portf:
      00A85C 80 CD 88         [ 2] 4402 	ldw x,#PF_BASE 
      00A85F E0               [ 1] 4403 	clr a 
      00A860 1E               [ 4] 4404 	ret 
      002F0F                       4405 const_portg:
      00A861 05 5A 1F         [ 2] 4406 	ldw x,#PG_BASE 
      00A864 05               [ 1] 4407 	clr a 
      00A865 26               [ 4] 4408 	ret 
      002F14                       4409 const_porti:
      00A866 F0 1E 01         [ 2] 4410 	ldw x,#PI_BASE 
      00A869 CF               [ 1] 4411 	clr a 
      00A86A 00               [ 4] 4412 	ret 
                                   4413 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4414 ;-------------------------------
                                   4415 ; following return constant 
                                   4416 ; related to GPIO register offset 
                                   4417 ;---------------------------------
      002F19                       4418 const_odr:
      00A86B 1A               [ 1] 4419 	clr a 
      00A86C A6 58 5F         [ 2] 4420 	ldw x,#GPIO_ODR
      00A86F CD               [ 4] 4421 	ret 
      002F1E                       4422 const_idr:
      00A870 88               [ 1] 4423 	clr a 
      00A871 0B CD 88         [ 2] 4424 	ldw x,#GPIO_IDR
      00A874 0B               [ 4] 4425 	ret 
      002F23                       4426 const_ddr:
      00A875 7B               [ 1] 4427 	clr a
      00A876 03 CD 88         [ 2] 4428 	ldw x,#GPIO_DDR
      00A879 0B               [ 4] 4429 	ret 
      002F28                       4430 const_cr1:
      00A87A 7B               [ 1] 4431 	clr a 
      00A87B 04 CD 88         [ 2] 4432 	ldw x,#GPIO_CR1
      00A87E 0B               [ 4] 4433 	ret 
      002F2D                       4434 const_cr2:
      00A87F 5B               [ 1] 4435 	clr a
      00A880 06 00 04         [ 2] 4436 	ldw x,#GPIO_CR2
      00A881 81               [ 4] 4437 	ret 
                                   4438 ;-------------------------
                                   4439 ; BASIC: POUT 
                                   4440 ;  constant for port mode
                                   4441 ;  used by PMODE 
                                   4442 ;  to set pin as output
                                   4443 ;------------------------
      002F32                       4444 const_output:
      00A881 81               [ 1] 4445 	clr a 
      00A882 AE 00 01         [ 2] 4446 	ldw x,#OUTP
      00A882 72               [ 4] 4447 	ret 
                                   4448 
                                   4449 ;-------------------------
                                   4450 ; BASIC: PINP 
                                   4451 ;  constant for port mode
                                   4452 ;  used by PMODE 
                                   4453 ;  to set pin as input
                                   4454 ;------------------------
      002F37                       4455 const_input:
      00A883 01               [ 1] 4456 	clr a  
      00A884 00 23 05         [ 2] 4457 	ldw x,#INP 
      00A887 A6               [ 4] 4458 	ret 
                                   4459 	
                                   4460 ;-----------------------
                                   4461 ; memory area constants
                                   4462 ;-----------------------
      002F3C                       4463 const_eeprom_base:
      00A888 07               [ 1] 4464 	clr a  
      00A889 CC 97 16         [ 2] 4465 	ldw x,#EEPROM_BASE 
      00A88C 81               [ 4] 4466 	ret 
                                   4467 
                                   4468 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                                   4469 ; BASIC: DATA 
                                   4470 ; when the interpreter find 
                                   4471 ; a DATA line it skip it.
                                   4472 ;---------------------------
      002F41                       4473 data:
      00A88C 72 5F 00 19 CD   [ 1] 4474 	mov in,count 
      00A891 98               [ 4] 4475 	ret 
                                   4476 
                                   4477 ;------------------------------
                                   4478 ; check if it is a DATA line 
                                   4479 ; input: 
                                   4480 ;    X    line address 
                                   4481 ; output:
                                   4482 ;    Z    set if DATA line 
                                   4483 ;----------------------------
      002F47                       4484 is_data_line:
      00A892 7B               [ 2] 4485 	pushw x 
      00A893 A1 03            [ 1] 4486 	ld a,(3,x)
      00A895 27 96            [ 1] 4487 	cp a,#TK_CMD 
      00A897 52 03            [ 1] 4488 	jrne 9$
      00A899 A1 04            [ 2] 4489 	ldw x,(4,x)
      00A89B 27 03 CC         [ 2] 4490 	cpw x,#data  
      00A89E 97               [ 2] 4491 9$: popw x 
      00A89F 14               [ 4] 4492 	ret 
                                   4493 
                                   4494 ;---------------------------------
                                   4495 ; BASIC: RESTORE [line#]
                                   4496 ; set data_ptr to first data line
                                   4497 ; if no DATA found pointer set to
                                   4498 ; zero.
                                   4499 ; if a line# is given as argument 
                                   4500 ; a data line with that number 
                                   4501 ; is searched and the data pointer 
                                   4502 ; is set to it. If there is no 
                                   4503 ; data line with that number 
                                   4504 ; the program is interrupted. 
                                   4505 ;---------------------------------
      002F55                       4506 restore:
      00A8A0 CD               [ 1] 4507 	clrw x 
      00A8A1 98 BD A4         [ 2] 4508 	ldw data_ptr,x 
      00A8A4 DF A1 45         [ 2] 4509 	ldw data_ofs,x 
      00A8A7 26 0C AE         [ 2] 4510 	ldw x,txtbgn 
      00A8AA 40 00 CF         [ 4] 4511 	call next_token 
      00A8AD 00 1A            [ 1] 4512 	cp a,#TK_INTGR
      00A8AF AE 47            [ 1] 4513 	jrne 0$
      00A8B1 FF 4F 20         [ 4] 4514 	call get_int24
      00A8B4 15 A1            [ 2] 4515 	pushw y 
      00A8B6 46               [ 1] 4516 	clr a 
      00A8B7 27 06 AE         [ 4] 4517 	call search_lineno  
      00A8BA 96 1C            [ 2] 4518 	popw y 
      00A8BC CC               [ 2] 4519 	tnzw x 
      00A8BD 97 16            [ 1] 4520 	jrne set_data_pointer 
      00A8BF 20 44            [ 2] 4521 	jra data_error 
      002F76                       4522 0$:
      002F76                       4523 	_unget_token  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A8BF AE B9 00 CF 00   [ 1]    1      mov in,in.saved  
                                   4524 ; search first DATA line 	
      00A8C4 1A A6 02         [ 2] 4525 1$:	cpw x,txtend
      00A8C7 AE 7F            [ 1] 4526 	jruge data_error 
      002F80                       4527 2$:	
      00A8C9 FF 2F 47         [ 4] 4528 	call is_data_line 
      00A8CA 26 00            [ 1] 4529 	jrne 4$
      00A8CA 6B 01 1F         [ 4] 4530 4$:	call try_next_line 
      00A8CD 02 CD            [ 1] 4531 	jrne 4$ 
      00A8CF 87               [ 4] 4532 	ret 
                                   4533 
                                   4534 ;---------------------
                                   4535 ; set data pointer 
                                   4536 ; variables at new line 
                                   4537 ; input:
                                   4538 ;    X    line address 
                                   4539 ;----------------------
      002F8B                       4540 set_data_pointer:
      00A8D0 67 00 06         [ 2] 4541 	ldw data_ptr,x
      00A8D1 E6 02            [ 1] 4542 	ld a,(2,x)
      00A8D1 CD 88 EE         [ 1] 4543 	ld data_len,a 
      00A8D4 27 08 A6 45      [ 1] 4544 	mov data_ofs,#FIRST_DATA_ITEM
      00A8D8 CD               [ 4] 4545 	ret 
                                   4546 
                                   4547 
                                   4548 ;--------------------
                                   4549 ; at end of data line 
                                   4550 ; check if next line 
                                   4551 ; is a data line 
                                   4552 ; input:
                                   4553 ;    X   actual line address 
                                   4554 ;  
                                   4555 ;-------------------
      002F98                       4556 try_next_line: 
      00A8D9 89 7F            [ 1] 4557 	ld a,(2,x)
      00A8DB CD 87 E5         [ 1] 4558 	ld acc8,a 
      00A8DE AE 00 80 CD      [ 1] 4559 	clr acc16 
      00A8E2 88 E0 7B 01      [ 2] 4560 	addw x,acc16 
      00A8E6 1E 02 72         [ 2] 4561 	cpw x,txtend 
      00A8E9 B0 00            [ 1] 4562 	jrult 1$
      00A8EB 1A C2            [ 2] 4563 	jra data_error 
      002FAC                       4564 1$:	
      00A8ED 00 19 22         [ 4] 4565 	call is_data_line 
      00A8F0 E0 CD            [ 1] 4566 	jreq 2$
      00A8F2 95 2A            [ 1] 4567 	ld a,#1  
      00A8F4 1E 02            [ 2] 4568 	jra 9$
      00A8F6 A3 47 FF         [ 4] 4569 2$:	call set_data_pointer
      00A8F9 26               [ 1] 4570 	clr a  
      00A8FA 03               [ 4] 4571 9$:	ret 
      002FBA                       4572 data_error:	
      00A8FB CD 9D            [ 1] 4573     ld a,#ERR_NO_DATA 
      00A8FD B1 16 96         [ 2] 4574 	jp tb_error 
                                   4575 
                                   4576 
                                   4577 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4578 ; BASIC: READ 
                                   4579 ; return next data item | 0 
                                   4580 ;---------------------------------
                           000001  4581 	CTX_BPTR=1 
                           000003  4582 	CTX_IN=3 
                           000004  4583 	CTX_COUNT=4 
                           000005  4584 	INT24=5
                           000007  4585 	VSIZE=7 
      00A8FE                       4586 read:
      002FBF                       4587 	_vars  VSIZE 
      00A8FE 5B 03            [ 2]    1     sub sp,#VSIZE 
      00A900 81 20 5E         [ 4] 4588 	call save_context
      00A901                       4589 read01:	
      00A901 89 9F A4         [ 1] 4590 	ld a,data_ofs
      00A904 80 97 FE         [ 1] 4591 	cp a,data_len 
      00A907 C3 AA            [ 1] 4592 	jreq 2$ ; end of line  
      002FCC                       4593 0$:
      00A909 19 85 81         [ 2] 4594 	ldw x,data_ptr 
      00A90C CF 00 04         [ 2] 4595 	ldw basicptr,x 
      00A90C 88 4D 27 0A F6   [ 1] 4596 	mov in,data_ofs 
      00A911 5C 90 F7 90 5C   [ 1] 4597 	mov count,data_len  
      00A916 0A 01 26         [ 4] 4598 	call expression 
      00A919 F6 84            [ 1] 4599 	cp a,#TK_INTGR 
      00A91B 81 03            [ 1] 4600 	jreq 1$ 
      00A91C CC 16 94         [ 2] 4601 	jp syntax_error 
      002FE6                       4602 1$:
      00A91C 88 90 AE         [ 4] 4603 	call next_token ; skip comma
      00A91F 16 B8 90         [ 2] 4604 	ldw x,basicptr 
      00A922 89 A6 80         [ 2] 4605 	ldw data_ptr,x 
      00A925 90 7F 90 5C 4A   [ 1] 4606 	mov data_ofs,in 
      00A92A 26 F9 90         [ 4] 4607 	call rest_context
      002FF7                       4608 	_xpop 
      00A92D 85 84            [ 1]    1     ld a,(y)
      00A92F 81               [ 1]    2     ldw x,y 
      00A930 EE 01            [ 2]    3     ldw x,(1,x)
      00A930 89 AE B9 00      [ 2]    4     addw y,#CELL_SIZE 
      003000                       4609 	_drop VSIZE 
      00A934 CD AA            [ 2]    1     addw sp,#VSIZE 
      00A936 1D               [ 4] 4610 	ret 
      003003                       4611 2$: ; end of line reached 
                                   4612 	; try next line 
      00A937 27 0D F6         [ 2] 4613 	ldw x,data_ptr  
      00A93A EA 01 27         [ 4] 4614 	call try_next_line
      00A93D 23 CD            [ 1] 4615 	jreq 0$ 
      00A93F AA 28            [ 2] 4616 	jra data_error 
                                   4617 
                                   4618 ;---------------------------------
                                   4619 ; BASIC: SPIEN clkdiv, 0|1  
                                   4620 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4621 ; if clkdiv==-1 disable SPI
                                   4622 ; 0|1 -> disable|enable  
                                   4623 ;--------------------------------- 
                           000005  4624 SPI_CS_BIT=5
      00300D                       4625 spi_enable:
      00A941 5D 26 F0         [ 4] 4626 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A944 20 1B            [ 1] 4627 	cp a,#2
      00A946 27 03            [ 1] 4628 	jreq 1$
      00A946 CF 00 0E         [ 2] 4629 	jp syntax_error 
      003017                       4630 1$: 
      00A949 EE 02 1C 00      [ 1] 4631 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A94D 04               [ 2] 4632 	popw x  
      00A94E 1C               [ 2] 4633 	tnzw x 
      00A94F 00 7F            [ 1] 4634 	jreq spi_disable 
      00A951 9F               [ 2] 4635 	popw x 
      00A952 A4 80            [ 1] 4636 	ld a,#(1<<SPI_CR1_BR)
      00A954 97               [ 4] 4637 	mul x,a 
      00A955 13               [ 1] 4638 	ld a,xl 
      00A956 01 24 05         [ 1] 4639 	ld SPI_CR1,a 
                                   4640 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A959 CE 00 0E 20      [ 1] 4641 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A95D E0 CE 00 0E      [ 1] 4642 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4643 ; configure SPI as master mode 0.	
      00A961 5B 02 81 00      [ 1] 4644 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4645 ; ~CS line controlled by sofware 	
      00A964 72 12 52 01      [ 1] 4646 	bset SPI_CR2,#SPI_CR2_SSM 
      00A964 89 4B 04 72      [ 1] 4647     bset SPI_CR2,#SPI_CR2_SSI 
                                   4648 ; enable SPI
      00A968 5F 00 19 CF      [ 1] 4649 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A96C 00               [ 4] 4650 	ret 
      003040                       4651 spi_disable:
      003040                       4652 	_drop #2; throw first argument.
      00A96D 1A 4F            [ 2]    1     addw sp,##2 
                                   4653 ; wait spi idle 
      00A96F 5F CD            [ 1] 4654 1$:	ld a,#0x82 
      00A971 88 0B 0A         [ 1] 4655 	and a,SPI_SR
      00A974 01 26            [ 1] 4656 	cp a,#2 
      00A976 F9 5B            [ 1] 4657 	jrne 1$
      00A978 01 85 CF 00      [ 1] 4658 	bres SPI_CR1,#SPI_CR1_SPE
      00A97C 1A 81 50 C7      [ 1] 4659 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A97E 72 1B 50 16      [ 1] 4660 	bres PE_DDR,#SPI_CS_BIT 
      00A97E 89               [ 4] 4661 	ret 
                                   4662 
      003058                       4663 spi_clear_error:
      00A97F 90 89            [ 1] 4664 	ld a,#0x78 
      00A981 52 06 CD         [ 1] 4665 	bcp a,SPI_SR 
      00A984 9E CB            [ 1] 4666 	jreq 1$
      00A986 26 03 CC AA      [ 1] 4667 	clr SPI_SR 
      00A98A 13               [ 4] 4668 1$: ret 
                                   4669 
      003064                       4670 spi_send_byte:
      00A98B 1F               [ 1] 4671 	push a 
      00A98C 05 72 5F         [ 4] 4672 	call spi_clear_error
      00A98F 00               [ 1] 4673 	pop a 
      00A990 19 CD A9 30 CF   [ 2] 4674 	btjf SPI_SR,#SPI_SR_TXE,.
      00A995 00 1A AE         [ 1] 4675 	ld SPI_DR,a
      00A998 FF FF 72 B0 00   [ 2] 4676 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A99D 1A 1D 00         [ 1] 4677 	ld a,SPI_DR 
      00A9A0 04               [ 4] 4678 	ret 
                                   4679 
      00307A                       4680 spi_rcv_byte:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A9A1 13 05            [ 1] 4681 	ld a,#255
      00A9A3 24 05 A6 01 CC   [ 2] 4682 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A9A8 97 16 04         [ 1] 4683 	ld a,SPI_DR 
      00A9AA 81               [ 4] 4684 	ret
                                   4685 
                                   4686 ;------------------------------
                                   4687 ; BASIC: SPIWR byte [,byte]
                                   4688 ; write 1 or more byte
                                   4689 ;------------------------------
      003085                       4690 spi_write:
      00A9AA CE 00 1A         [ 4] 4691 	call expression
      00A9AD F6 EA            [ 1] 4692 	cp a,#TK_INTGR 
      00A9AF 01 EA            [ 1] 4693 	jreq 1$
      00A9B1 02 EA 03         [ 2] 4694 	jp syntax_error 
      00308F                       4695 1$:	
      00A9B4 27               [ 1] 4696 	ld a,xl 
      00A9B5 03 CD A9         [ 4] 4697 	call spi_send_byte 
      00A9B8 64 17 FB         [ 4] 4698 	call next_token 
      00A9B9 A1 08            [ 1] 4699 	cp a,#TK_COMMA 
      00A9B9 CD 87            [ 1] 4700 	jrne 2$ 
      00A9BB A7 0F            [ 2] 4701 	jra spi_write 
      00A9BD 03               [ 1] 4702 2$:	tnz a 
      00A9BE CD A9            [ 1] 4703 	jreq 3$
      00309F                       4704 	_unget_token  
      00A9C0 1C CE AA 19 90   [ 1]    1      mov in,in.saved  
      00A9C5 FF               [ 4] 4705 3$:	ret 
                                   4706 
                                   4707 
                                   4708 ;-------------------------------
                                   4709 ; BASIC: SPIRD 	
                                   4710 ; read one byte from SPI 
                                   4711 ;-------------------------------
      0030A5                       4712 spi_read:
      00A9C6 72 A9 00         [ 4] 4713 	call spi_rcv_byte 
      00A9C9 02               [ 1] 4714 	clrw x 
      00A9CA 1E               [ 1] 4715 	ld xl,a 
      00A9CB 05               [ 1] 4716 	clr a  
      00A9CC 90               [ 4] 4717 	ret 
                                   4718 
                                   4719 ;------------------------------
                                   4720 ; BASIC: SPISEL 0|1 
                                   4721 ; set state of ~CS line
                                   4722 ; 0|1 deselect|select  
                                   4723 ;------------------------------
      0030AC                       4724 spi_select:
      00A9CD FF 72 A9         [ 4] 4725 	call next_token 
      00A9D0 00 02            [ 1] 4726 	cp a,#TK_INTGR 
      00A9D2 A6 7C            [ 1] 4727 	jreq 1$
      00A9D4 A3 00 7C         [ 2] 4728 	jp syntax_error 
      00A9D7 22               [ 2] 4729 1$: tnzw x  
      00A9D8 01 9F            [ 1] 4730 	jreq cs_high 
      00A9DA 6B 04 CE 00      [ 1] 4731 	bres PE_ODR,#SPI_CS_BIT
      00A9DE 1C               [ 4] 4732 	ret 
      0030BE                       4733 cs_high: 
      00A9DF 1F 01 50 14      [ 1] 4734 	bset PE_ODR,#SPI_CS_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A9E1 81               [ 4] 4735 	ret 
                                   4736 
                                   4737 ;-------------------------------
                                   4738 ; BASIC: PAD 
                                   4739 ; Return pad buffer address.
                                   4740 ;------------------------------
      0030C3                       4741 pad_ref:
      00A9E1 1E 01 7B         [ 2] 4742 	ldw x,#pad 
      00A9E4 04               [ 1] 4743 	clr a
      00A9E5 CD               [ 4] 4744 	ret 
                                   4745 
                                   4746 ;****************************
                                   4747 ; expression stack 
                                   4748 ; manipulation routines
                                   4749 ;****************************
                                   4750 
                                   4751 ;-----------------------------
                                   4752 ; BASIC: PUSH expr|rel|cond 
                                   4753 ; push the result on xtack
                                   4754 ;-----------------------------
      0030C8                       4755 xpush:
      00A9E6 A9 0C 1F         [ 4] 4756 	call condition 
      00A9E9 01               [ 4] 4757 	ret 
                                   4758 
                                   4759 ;------------------------------
                                   4760 ; BASIC: POP 
                                   4761 ; pop top of xstack 
                                   4762 ;------------------------------
      0030CC                       4763 xpop:
      0030CC                       4764 	_xpop 
      00A9EA AE 16            [ 1]    1     ld a,(y)
      00A9EC B8               [ 1]    2     ldw x,y 
      00A9ED CD 87            [ 2]    3     ldw x,(1,x)
      00A9EF C1 AE 00 80      [ 2]    4     addw y,#CELL_SIZE 
      00A9F3 CD               [ 4] 4765 	ret 
                                   4766 
                                   4767 
                                   4768 ;------------------------------
                                   4769 ; BASIC: ALLOC expr 
                                   4770 ; allocate expr element on xtack 
                                   4771 ;-------------------------------
      0030D6                       4772 xalloc: 
      00A9F4 88 E0 1E         [ 4] 4773 	call expression 
      00A9F7 01 C3            [ 1] 4774 	cp a,#TK_INTGR
      00A9F9 00 1E            [ 1] 4775 	jreq 1$ 
      00A9FB 24 16 1E         [ 2] 4776 	jp syntax_error
      0030E0                       4777 1$: _xpop 
      00A9FE 05 72            [ 1]    1     ld a,(y)
      00AA00 F0               [ 1]    2     ldw x,y 
      00AA01 03 1F            [ 2]    3     ldw x,(1,x)
      00AA03 05 A6 80 A3      [ 2]    4     addw y,#CELL_SIZE 
      00AA07 00               [ 1] 4778 	tnz a 
      00AA08 80 24            [ 1] 4779 	jreq 3$ 
      00AA0A 01 9F            [ 1] 4780 2$:	ld a,#ERR_BAD_VALUE
      00AA0C 6B 04 CD         [ 2] 4781 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AA0F A9 1C 20         [ 2] 4782 3$: cpw x,#XSTACK_SIZE 
      00AA12 CE 5B            [ 1] 4783 	jrugt 2$
      00AA14 06 90            [ 1] 4784 	ld a,#CELL_SIZE 
      00AA16 85               [ 4] 4785 	mul x,a 
      00AA17 85 81 54         [ 2] 4786 	ldw acc16,x 
      00AA1A 42 58 58 0D      [ 2] 4787 	subw y,acc16 
      00AA1D 90 A3 17 38      [ 2] 4788 	cpw y,#xstack_full
      00AA1D 89 9F            [ 1] 4789 	jrugt 9$
      00AA1F A4 80            [ 1] 4790 	ld a,#ERR_MEM_FULL
      00AA21 97 FE C3         [ 2] 4791 	jp tb_error 
      00310B                       4792 9$:	 
      00AA24 AA               [ 4] 4793 	ret 
                                   4794 
                                   4795 
                                   4796 ;------------------------------
                                   4797 ;  BASIC DROP expr 
                                   4798 ;  expr in range {0..XSTACK_SIZE}
                                   4799 ;  discard n elements from xtack
                                   4800 ;------------------------------
      00310C                       4801 xdrop:
      00AA25 1B 85 81         [ 4] 4802 	call expression 
      00AA28 A1 84            [ 1] 4803 	cp a,#TK_INTGR
      00AA28 9F A4            [ 1] 4804 	jreq 1$ 
      00AA2A 80 97 CF         [ 2] 4805 	jp syntax_error 
      003116                       4806 1$:	_xpop 
      00AA2D 00 0E            [ 1]    1     ld a,(y)
      00AA2F EE               [ 1]    2     ldw x,y 
      00AA30 02 72            [ 2]    3     ldw x,(1,x)
      00AA32 BB 00 0E 1C      [ 2]    4     addw y,#CELL_SIZE 
      00AA36 00               [ 1] 4807 	ld a,xl 
      00AA37 04 1C            [ 1] 4808 	and a,#0x1f 
      00AA39 00               [ 1] 4809 	clrw x 
      00AA3A 7F               [ 1] 4810 	ld xl,a 
      00AA3B 9F A4            [ 1] 4811 	ld a,#CELL_SIZE 
      00AA3D 80               [ 4] 4812 	mul x,a 
      00AA3E 97 81 0D         [ 2] 4813 	ldw acc16,x  
      00AA40 72 B9 00 0D      [ 2] 4814 	addw y,acc16 
      00AA40 AE B9 00 89      [ 2] 4815 	cpw y,#XSTACK_EMPTY 
      00AA44 23 04            [ 2] 4816 	jrule 9$
      00AA44 CD A9 01 26      [ 2] 4817 	ldw y,#XSTACK_EMPTY 
      00AA48 3B               [ 4] 4818 9$:	ret 
                                   4819 
                                   4820 ;-----------------------
                                   4821 ; check if value in A:X 
                                   4822 ; is inside xstack bound
                                   4823 ; output:
                                   4824 ;    X     slot address  
                                   4825 ;-----------------------
      003139                       4826 xstack_bound:
      00AA49 1C               [ 1] 4827 	tnz a 
      00AA4A 00 04            [ 1] 4828 	jrne 8$ 
      00AA4C 35 10 00         [ 2] 4829 1$: cpw x,#XSTACK_SIZE 
      00AA4F 0B CD            [ 1] 4830 	jrugt 8$
      00AA51 98 C3            [ 1] 4831 	ld a,#CELL_SIZE 
      00AA53 A6               [ 4] 4832 	mul x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AA54 20 CD 89         [ 2] 4833 	ldw acc16,x 
      00AA57 7F               [ 1] 4834 	ldw x,y 
      00AA58 1E 01 EE 02      [ 2] 4835 	addw x,acc16 
      00AA5C 35 0A 00         [ 2] 4836 	cpw x,#XSTACK_EMPTY 
      00AA5F 0B CD            [ 1] 4837 	jruge 8$  
      00AA61 98               [ 4] 4838 	ret 
      00AA62 C3 AE            [ 1] 4839 8$: ld a,#ERR_BAD_VALUE
      00AA64 9F 35 CD         [ 2] 4840 	jp tb_error 
                                   4841 
                                   4842 ;-------------------------
                                   4843 ; BASIC: PUT expr, cond 
                                   4844 ; expr -> slot 
                                   4845 ; cond -> valut to put 
                                   4846 ; on xstack 
                                   4847 ;-------------------------
      003157                       4848 xput:
      00AA67 89 DC A6         [ 4] 4849 	call arg_list 
      00AA6A 2C CD            [ 1] 4850 	cp a,#2 
      00AA6C 89 7F            [ 1] 4851 	jreq 1$ 
      00AA6E 1E 01 1C         [ 2] 4852 0$:	jp syntax_error
      003161                       4853 1$: _xpop   ; value to put 
      00AA71 00 08            [ 1]    1     ld a,(y)
      00AA73 CD               [ 1]    2     ldw x,y 
      00AA74 89 DC            [ 2]    3     ldw x,(1,x)
      00AA76 A6 0D CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00AA7A 7F               [ 2] 4854 	pushw x 
      00AA7B 1E               [ 1] 4855 	push a 
      00316C                       4856 	_xpop    ; slot 
      00AA7C 01 CD            [ 1]    1     ld a,(y)
      00AA7E AA               [ 1]    2     ldw x,y 
      00AA7F 28 1F            [ 2]    3     ldw x,(1,x)
      00AA81 01 20 C0 03      [ 2]    4     addw y,#CELL_SIZE 
      00AA84 CD 31 39         [ 4] 4857 	call xstack_bound
      00AA84 CD AA 1D         [ 2] 4858     ldw ptr16,x 
      00AA87 27               [ 1] 4859 	pop a 
      00AA88 F4               [ 2] 4860 	popw x 
      00AA89 72 C7 00 19      [ 4] 4861 	ld [ptr16],a 
      00AA89 5B 02 81 1A      [ 1] 4862 	inc ptr8 
      00AA8C 72 CF 00 19      [ 5] 4863 	ldw [ptr16],x 
      00AA8C CD               [ 4] 4864 	ret 
                                   4865 
                                   4866 ;------------------------
                                   4867 ; BASIC: PICK expr 
                                   4868 ; get nième element on 
                                   4869 ; xtack. 
                                   4870 ;-----------------------
      00318A                       4871 xpick:
      00AA8D 9B 85 A1         [ 4] 4872 	call func_args 
      00AA90 84 27            [ 1] 4873 	cp a,#1 
      00AA92 03 CC            [ 1] 4874 	jreq 1$
      00AA94 97 14 90         [ 2] 4875 	jp syntax_error 
      003194                       4876 1$: _xpop 
      00AA97 F6 93            [ 1]    1     ld a,(y)
      00AA99 EE               [ 1]    2     ldw x,y 
      00AA9A 01 72            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AA9C A9 00 03 C7      [ 2]    4     addw y,#CELL_SIZE 
      00AAA0 00 19 CF         [ 4] 4877 	call xstack_bound
      00AAA3 00               [ 1] 4878     ld a,(x)
      00AAA4 1A 01            [ 2] 4879 	ldw x,(1,x)				
      00AAA5 81               [ 4] 4880 	ret 
                                   4881 
                                   4882 
                                   4883 ;----------------------------
                                   4884 ; BASIC: AUTORUN \C | label  
                                   4885 ;  \C -> cancel autorun 
                                   4886 ;  addr -> register an 
                                   4887 ;    autorun program 
                                   4888 ;    this program execute at 
                                   4889 ;     reset/boot 
                                   4890 ;----------------------------
      0031A4                       4891 cmd_auto_run:
      00AAA5 CD 98 7B         [ 4] 4892 	call next_token 
      00AAA8 A1 08            [ 1] 4893 	cp a,#TK_LABEL 
      00AAAA 27 02            [ 1] 4894 	jreq 1$ 
      00AAAC 20 46            [ 1] 4895 	cp a,#TK_CHAR 
      00AAAE CD 98            [ 1] 4896 	jrne 0$ 
      00AAB0 7B               [ 1] 4897 	ld a,(x)
      00AAB1 A1 04 27 23      [ 1] 4898 	inc in 
      00AAB5 A1 02            [ 1] 4899 	and a,#0xDF 
      00AAB7 27 2A            [ 1] 4900 	cp a,#'C 
      00AAB9 55 00            [ 1] 4901 	jrne 0$ 
      00AABB 04 00 02         [ 2] 4902 	ldw x,#EEPROM_BASE 
      00AABE CD 9B 85         [ 4] 4903 	call erase_header
      00AAC1 A1               [ 4] 4904 	ret 
      00AAC2 84 27 03         [ 2] 4905 0$:	jp syntax_error
      00AAC5 CC               [ 2] 4906 1$:	pushw x 
      00AAC6 97 14 90         [ 4] 4907 	call skip_string
      00AAC9 F6               [ 2] 4908 	popw x 
      00AACA 93 EE 01         [ 4] 4909 	call search_program
      00AACD 72 A9            [ 1] 4910 	jrne 2$ 
      00AACF 00 03            [ 1] 4911 	ld a,#ERR_BAD_VALUE
      00AAD1 9F 5F CD         [ 2] 4912 	jp tb_error 
      00AAD4 88               [ 2] 4913 2$: pushw x 
      00AAD5 0B 20 CD 18      [ 1] 4914 	clr farptr 
      00AAD8 AE 40 00         [ 2] 4915 	ldw x,#EEPROM_BASE
      00AAD8 F6 72 5C         [ 2] 4916 	ldw ptr16,x 
      00AADB 00 02 5F         [ 1] 4917 	ld a,AR_SIGN 
      00AADE CD               [ 1] 4918 	clrw x 	 
      00AADF 88 0B 20         [ 4] 4919 	call write_byte
      00AAE2 C2 31 F9         [ 1] 4920 	ld a,AR_SIGN+1
      00AAE3 CD 07 8B         [ 4] 4921 	call write_byte 
      00AAE3 89 F6            [ 1] 4922 	ld a,(1,sp)
      00AAE5 72 5C 00         [ 4] 4923 	call write_byte 
      00AAE8 02 5F            [ 1] 4924 	ld a,(2,sp)
      00AAEA CD 88 0B         [ 4] 4925 	call write_byte 
      0031F5                       4926 	_drop 2 
      00AAED 85 F6            [ 2]    1     addw sp,#2 
      00AAEF 27               [ 4] 4927 	ret 
                                   4928 
      00AAF0 B4 5C                 4929 AR_SIGN: .ascii "AR" ; autorun signature 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



                                   4930 
                                   4931 ;-------------------------------
                                   4932 ; search a program in flash 
                                   4933 ; memory with a label at first 
                                   4934 ; that correspond to name 
                                   4935 ; pointed by X 
                                   4936 ; input:
                                   4937 ;    x      *name 
                                   4938 ; output: 
                                   4939 ;    X     prog_addr|0
                                   4940 ;-------------------------------
                           000001  4941 	WLKPTR=1 
                           000003  4942 	PNAME=3
                           000005  4943 	LIMIT=5
                           000007  4944 	YSAVE=7
                           000006  4945 	VSIZE=6 
      0031FA                       4946 search_program:
      00AAF2 20 EF            [ 2] 4947 	pushw y 
      00AAF4                       4948 	_vars VSIZE 
      00AAF4 81 06            [ 2]    1     sub sp,#VSIZE 
      00AAF5 1F 03            [ 2] 4949 	ldw (PNAME,sp),x 
      00AAF5 CD 9A 3E         [ 4] 4950 	call uflash 
      00AAF8 A1 01            [ 2] 4951 	ldw (LIMIT,sp),x 
      00AAFA 27 03 CC         [ 2] 4952 	ldw x,#app_space 
      00AAFD 97 14            [ 2] 4953 1$:	ldw (WLKPTR,sp),x  
      00AAFF 90               [ 1] 4954 	clr a 
      00AB00 F6 93 EE         [ 4] 4955 	call is_program_addr
      00AB03 01 72            [ 1] 4956 	jrne 4$
      00AB05 A9 00 03         [ 2] 4957 	addw x,#7 
      00AB08 9F               [ 1] 4958 	ld a,(x)
      00AB09 A4 7F            [ 1] 4959 	cp a,#TK_LABEL 
      00AB0B 81 08            [ 1] 4960 	jrne 4$ 
      00AB0C 5C               [ 1] 4961 	incw x 
      00AB0C A6 06            [ 2] 4962 	ldw y,(PNAME,sp)
      00AB0E CD 9A 31         [ 4] 4963 	call strcmp
      00AB11 CD 98            [ 1] 4964 	jrne 6$
      003220                       4965 4$: 
      00AB13 7B A1 02         [ 4] 4966 	call skip_to_next
      00AB16 27 0E            [ 2] 4967 	cpw x,(LIMIT,sp)
      00AB18 A1 04            [ 1] 4968 	jrult 1$
      00AB1A 27               [ 1] 4969 	clrw x 
      00AB1B 12 A1            [ 2] 4970 	jra 8$
      00322A                       4971 6$: ; found label 
      00AB1D 82 27            [ 2] 4972 	ldw x,(WLKPTR,sp)
      00AB1F 03 CC 97         [ 2] 4973 	addw x,#4 	
      00322F                       4974 8$:	
      00322F                       4975 	_drop VSIZE  
      00AB22 14 06            [ 2]    1     addw sp,#VSIZE 
      00AB23 90 85            [ 2] 4976 	popw y 
      00AB23 FD               [ 4] 4977 	ret 
                                   4978 
                                   4979 
                                   4980 ;-------------------------------
                                   4981 ; BASIC: CHAIN label [, line#]
                                   4982 ; Execute another program like it 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                                   4983 ; is a sub-routine. When the 
                                   4984 ; called program terminate 
                                   4985 ; execution continue at caller 
                                   4986 ; after CHAIN command. 
                                   4987 ; if a line# is given, the 
                                   4988 ; chained program start execution 
                                   4989 ; at this line#.
                                   4990 ;---------------------------------
                           000003  4991 	CHAIN_LN=3 
                           000005  4992 	CHAIN_ADDR=5 
                           000007  4993 	CHAIN_BP=7
                           000009  4994 	CHAIN_IN=9
                           00000A  4995 	CHAIN_COUNT=10 
                           00000B  4996 	CHAIN_TXTBGN=11 
                           00000D  4997 	CHAIN_TXTEND=13 
                           00000C  4998 	VSIZE=12 
                           000004  4999 	DISCARD=4 
      003234                       5000 cmd_chain:
      00AB24 20               [ 2] 5001 	popw x 
      003235                       5002 	_vars VSIZE 
      00AB25 0B 0C            [ 2]    1     sub sp,#VSIZE 
      00AB26 89               [ 2] 5003 	pushw x
      00AB26 F6 88            [ 1] 5004 	clr (CHAIN_LN,sp) 
      00AB28 CD 98            [ 1] 5005 	clr (CHAIN_LN+1,sp)  
      00AB2A 94 84            [ 1] 5006 	ld a,#TK_LABEL 
      00AB2C 20 03 B1         [ 4] 5007 	call expect 
      00AB2E 89               [ 2] 5008 	pushw x 
      00AB2E CD 98 BD         [ 4] 5009 	call skip_string
      00AB31 5F               [ 2] 5010 	popw x 
      00AB32 02 72 A2         [ 4] 5011 	call search_program 
      00AB35 00               [ 2] 5012 	tnzw x  
      00AB36 03 90            [ 1] 5013 	jrne 1$ 
      00AB38 F7 90            [ 1] 5014 0$:	ld a,#ERR_BAD_VALUE
      00AB3A EF 01 A6         [ 2] 5015 	jp tb_error 
      00AB3D 07 CD            [ 2] 5016 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AB3F 9A 31 FB         [ 4] 5017     call next_token 
      00AB41 A1 08            [ 1] 5018 	cp a,#TK_COMMA 
      00AB41 90 F6            [ 1] 5019 	jrne 4$
      00AB43 93 EE            [ 1] 5020 	ld a,#TK_INTGR
      00AB45 01 72 A9         [ 4] 5021 	call expect 
      00AB48 00 03 81         [ 4] 5022 	call get_int24 
      00AB4B 1F 03            [ 2] 5023 	ldw (CHAIN_LN,sp),x
      00AB4B CD 89            [ 2] 5024 	jra 6$ 
      003266                       5025 4$: _unget_token 
      00AB4D 8F 81 03 00 01   [ 1]    1      mov in,in.saved  
      00AB4F                       5026 6$: ; save chain context 
      00AB4F 5F C6 00         [ 2] 5027 	ldw x,basicptr 
      00AB52 2F C0            [ 2] 5028 	ldw (CHAIN_BP,sp),x 
      00AB54 00 30 27         [ 2] 5029 	ldw x,in
      00AB57 03 53            [ 2] 5030 	ldw (CHAIN_IN,sp),x
      00AB59 A6 FF 1B         [ 2] 5031 	ldw x,txtbgn 
      00AB5B 1F 0B            [ 2] 5032 	ldw (CHAIN_TXTBGN,sp),x
      00AB5B 81 00 1D         [ 2] 5033 	ldw x,txtend 
      00AB5C 1F 0D            [ 2] 5034 	ldw (CHAIN_TXTEND,sp),x  
                                   5035 ; set chained program context 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AB5C CD 9A            [ 2] 5036 	ldw x,(CHAIN_ADDR,sp)
      00AB5E 3E A1 02         [ 2] 5037 	ldw basicptr,x 
      00AB61 27 03 CC         [ 2] 5038 	ldw txtbgn,x 
      00AB64 97 14 90         [ 2] 5039 	subw x,#2
      00AB67 E6               [ 2] 5040 	ldw x,(x)
      00AB68 03 93 EE         [ 2] 5041 	addw x,(CHAIN_ADDR,sp)
      00AB6B 04 A3 50         [ 2] 5042 	ldw txtend,x  
      00AB6E 00 2B            [ 2] 5043 	ldw x,(CHAIN_ADDR,sp)
      00AB70 16 A3            [ 1] 5044 	ld a,(2,x)
      00AB72 50 29 2A         [ 1] 5045 	ld count,a 
      00AB75 11 89 90 F6      [ 1] 5046 	mov in,#3 
      00AB79 93 EE            [ 2] 5047 	ldw x,(CHAIN_LN,sp)
      00AB7B 01               [ 2] 5048 	tnzw x 
      00AB7C 72 A9            [ 1] 5049 	jreq 8$ 
      00AB7E 00 03            [ 2] 5050 	pushw y
      00AB80 72               [ 1] 5051 	clr a  
      00AB81 FB 01 5B         [ 4] 5052 	call search_lineno
      00AB84 02 4F            [ 2] 5053 	popw y 
      00AB86 81               [ 2] 5054 	tnzw x 
      00AB87 27 A0            [ 1] 5055 	jreq 0$ 
      00AB87 A6 0A CC         [ 2] 5056 	ldw basicptr,x 
      00AB8A 97 16            [ 1] 5057 	ld a,(2,x)
      00AB8C C7 00 02         [ 1] 5058 	ld count,a 
      00AB8C 72 5F 00 19      [ 1] 5059 8$: inc chain_level
      00AB90 AE               [ 2] 5060 	popw x 
      0032B9                       5061 	_drop DISCARD
      00AB91 B9 00            [ 2]    1     addw sp,#DISCARD 
      00AB93 89               [ 2] 5062 	jp (x)
                                   5063 
                                   5064 
                                   5065 ;------------------------------
                                   5066 ;      dictionary 
                                   5067 ; format:
                                   5068 ;   link:   2 bytes 
                                   5069 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5070 ;   cmd_name: 16 byte max 
                                   5071 ;   code_addr: 2 bytes 
                                   5072 ;------------------------------
                                   5073 	.macro _dict_entry len,name,code_addr 
                                   5074 	.word LINK 
                                   5075 	LINK=.
                                   5076 name:
                                   5077 	.byte len   	
                                   5078 	.ascii "name"
                                   5079 	.word code_addr  
                                   5080 	.endm 
                                   5081 
                           000000  5082 	LINK=0
                                   5083 ; respect alphabetic order for BASIC names from Z-A
                                   5084 ; this sort order is for a cleaner WORDS cmd output. 	
      0032BC                       5085 kword_end:
      0032BC                       5086 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AB94 CF 00                    1 	.word LINK 
                           0032BE     2 	LINK=.
      0032BE                          3 XOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AB96 1A                       4 	.byte 3+F_XOR   	
      00AB97 CD 88 EE                 5 	.ascii "XOR"
      00AB9A 27 0F                    6 	.word TK_XOR  
      0032C4                       5087 	_dict_entry,5,WRITE,write  
      00AB9C 1E 01                    1 	.word LINK 
                           0032C6     2 	LINK=.
      0032C6                          3 WRITE:
      00AB9E 1C                       4 	.byte 5   	
      00AB9F 00 80 27 04 1F           5 	.ascii "WRITE"
      00ABA4 01 20                    6 	.word write  
      0032CE                       5088 	_dict_entry,5,WORDS,words 
      00ABA6 ED C6                    1 	.word LINK 
                           0032D0     2 	LINK=.
      00ABA7                          3 WORDS:
      00ABA7 0F                       4 	.byte 5   	
      00ABA8 01 0F 02 85 4F           5 	.ascii "WORDS"
      00ABAD 81 89                    6 	.word words  
      00ABAE                       5089 	_dict_entry 4,WAIT,wait 
      00ABAE CD 9A                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 WAIT:
      00ABB0 3E                       4 	.byte 4   	
      00ABB1 A1 02 27 03              5 	.ascii "WAIT"
      00ABB5 CC 97                    6 	.word wait  
      0032E1                       5090 	_dict_entry,3+F_IFUNC,USR,usr
      00ABB7 14 DA                    1 	.word LINK 
                           0032E3     2 	LINK=.
      00ABB8                          3 USR:
      00ABB8 90                       4 	.byte 3+F_IFUNC   	
      00ABB9 E6 03 93                 5 	.ascii "USR"
      00ABBC EE 04                    6 	.word usr  
      0032E9                       5091 	_dict_entry,5,UNTIL,until 
      00ABBE CF 00                    1 	.word LINK 
                           0032EB     2 	LINK=.
      0032EB                          3 UNTIL:
      00ABC0 1A                       4 	.byte 5   	
      00ABC1 90 F6 93 EE 01           5 	.ascii "UNTIL"
      00ABC6 72 A9                    6 	.word until  
      0032F3                       5092 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ABC8 00 03                    1 	.word LINK 
                           0032F5     2 	LINK=.
      0032F5                          3 UFLASH:
      00ABCA 90                       4 	.byte 6+F_IFUNC   	
      00ABCB F7 90 EF 01 72 CD        5 	.ascii "UFLASH"
      00ABD1 00 1A                    6 	.word uflash  
      0032FE                       5093 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ABD3 81 F5                    1 	.word LINK 
                           003300     2 	LINK=.
      00ABD4                          3 UBOUND:
      00ABD4 72                       4 	.byte 6+F_IFUNC   	
      00ABD5 0D 52 30 FB 8E CC        5 	.ascii "UBOUND"
      00ABDB 81 35                    6 	.word ubound  
      00ABDD                       5094 	_dict_entry,4,TONE,tone  
      00ABDD 72 0D                    1 	.word LINK 
                           00330B     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00330B                          3 TONE:
      00ABDF 52                       4 	.byte 4   	
      00ABE0 30 FB 72 16              5 	.ascii "TONE"
      00ABE4 00 23                    6 	.word tone  
      003312                       5095 	_dict_entry,2,TO,to
      00ABE6 8E 81                    1 	.word LINK 
                           003314     2 	LINK=.
      00ABE8                          3 TO:
      00ABE8 CD                       4 	.byte 2   	
      00ABE9 9B 85                    5 	.ascii "TO"
      00ABEB A1 84                    6 	.word to  
      003319                       5096 	_dict_entry,5,TIMER,set_timer
      00ABED 27 03                    1 	.word LINK 
                           00331B     2 	LINK=.
      00331B                          3 TIMER:
      00ABEF CC                       4 	.byte 5   	
      00ABF0 97 14 90 F6 93           5 	.ascii "TIMER"
      00ABF5 EE 01                    6 	.word set_timer  
      003323                       5097 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00ABF7 72 A9                    1 	.word LINK 
                           003325     2 	LINK=.
      003325                          3 TIMEOUT:
      00ABF9 00                       4 	.byte 7+F_IFUNC   	
      00ABFA 03 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00ABFB 2E 0A                    6 	.word timeout  
      00332F                       5098 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00ABFB CF 00                    1 	.word LINK 
                           003331     2 	LINK=.
      003331                          3 TICKS:
      00ABFD 13                       4 	.byte 5+F_IFUNC   	
      00ABFE CE 00 13 5D 27           5 	.ascii "TICKS"
      00AC03 03 8F                    6 	.word get_ticks  
      003339                       5099 	_dict_entry,4,STOP,stop 
      00AC05 26 F7                    1 	.word LINK 
                           00333B     2 	LINK=.
      00AC07                          3 STOP:
      00AC07 81                       4 	.byte 4   	
      00AC08 53 54 4F 50              5 	.ascii "STOP"
      00AC08 CD 9B                    6 	.word stop  
      003342                       5100 	_dict_entry,4,STEP,step 
      00AC0A 85 A1                    1 	.word LINK 
                           003344     2 	LINK=.
      003344                          3 STEP:
      00AC0C 84                       4 	.byte 4   	
      00AC0D 27 03 CC 97              5 	.ascii "STEP"
      00AC11 14 90                    6 	.word step  
      00334B                       5101 	_dict_entry,5,SPIWR,spi_write
      00AC13 F6 93                    1 	.word LINK 
                           00334D     2 	LINK=.
      00334D                          3 SPIWR:
      00AC15 EE                       4 	.byte 5   	
      00AC16 01 72 A9 00 03           5 	.ascii "SPIWR"
      00AC1B 30 85                    6 	.word spi_write  
      003355                       5102 	_dict_entry,6,SPISEL,spi_select
      00AC1B A3 14                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



                           003357     2 	LINK=.
      003357                          3 SPISEL:
      00AC1D 00                       4 	.byte 6   	
      00AC1E 2B 0C 35 0F 50 F2        5 	.ascii "SPISEL"
      00AC24 A6 1E                    6 	.word spi_select  
      003360                       5103 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AC26 62 A6                    1 	.word LINK 
                           003362     2 	LINK=.
      003362                          3 SPIRD:
      00AC28 10                       4 	.byte 5+F_IFUNC   	
      00AC29 62 20 1E 52 44           5 	.ascii "SPIRD"
      00AC2C 30 A5                    6 	.word spi_read  
      00336A                       5104 	_dict_entry,5,SPIEN,spi_enable 
      00AC2C A3 08                    1 	.word LINK 
                           00336C     2 	LINK=.
      00336C                          3 SPIEN:
      00AC2E 00                       4 	.byte 5   	
      00AC2F 2B 09 35 0E 50           5 	.ascii "SPIEN"
      00AC34 F2 A6                    6 	.word spi_enable  
      003374                       5105 	_dict_entry,5,SLEEP,sleep 
      00AC36 50 62                    1 	.word LINK 
                           003376     2 	LINK=.
      003376                          3 SLEEP:
      00AC38 20                       4 	.byte 5   	
      00AC39 10 4C 45 45 50           5 	.ascii "SLEEP"
      00AC3A 2B 5D                    6 	.word sleep  
      00337E                       5106     _dict_entry,4,SIZE,cmd_size 
      00AC3A 35 07                    1 	.word LINK 
                           003380     2 	LINK=.
      003380                          3 SIZE:
      00AC3C 50                       4 	.byte 4   	
      00AC3D F2 49 5A 45              5 	.ascii "SIZE"
      00AC3E 1C A5                    6 	.word cmd_size  
      003387                       5107 	_dict_entry,4,SAVE,cmd_save 
      00AC3E A3 00                    1 	.word LINK 
                           003389     2 	LINK=.
      003389                          3 SAVE:
      00AC40 40                       4 	.byte 4   	
      00AC41 23 07 72 5C              5 	.ascii "SAVE"
      00AC45 50 F2                    6 	.word cmd_save  
      003390                       5108 	_dict_entry 3,RUN,cmd_run
      00AC47 54 20                    1 	.word LINK 
                           003392     2 	LINK=.
      003392                          3 RUN:
      00AC49 F4                       4 	.byte 3   	
      00AC4A 52 55 4E                 5 	.ascii "RUN"
      00AC4A 9F 4A                    6 	.word cmd_run  
      003398                       5109 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AC4C 27 01                    1 	.word LINK 
                           00339A     2 	LINK=.
      00339A                          3 RSHIFT:
      00AC4E 4A                       4 	.byte 6+F_IFUNC   	
      00AC4F 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00AC4F A4 3E                    6 	.word rshift  
      0033A3                       5110 	_dict_entry,3+F_IFUNC,RND,random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AC51 C7 50                    1 	.word LINK 
                           0033A5     2 	LINK=.
      0033A5                          3 RND:
      00AC53 F1                       4 	.byte 3+F_IFUNC   	
      00AC54 72 18 50                 5 	.ascii "RND"
      00AC57 F0 8E                    6 	.word random  
      0033AB                       5111 	_dict_entry,6,RETURN,return 
      00AC59 81 A5                    1 	.word LINK 
                           0033AD     2 	LINK=.
      00AC5A                          3 RETURN:
      00AC5A C6                       4 	.byte 6   	
      00AC5B 00 10 CE 00 11 81        5 	.ascii "RETURN"
      00AC61 24 CC                    6 	.word return  
      0033B6                       5112 	_dict_entry,7,RESTORE,restore 
      00AC61 CD 9A                    1 	.word LINK 
                           0033B8     2 	LINK=.
      0033B8                          3 RESTORE:
      00AC63 3E                       4 	.byte 7   	
      00AC64 A1 01 27 03 CC 97 14     5 	.ascii "RESTORE"
      00AC6B 2F 55                    6 	.word restore  
      0033C2                       5113 	_dict_entry 3,REM,remark 
      00AC6B CD 82                    1 	.word LINK 
                           0033C4     2 	LINK=.
      0033C4                          3 REM:
      00AC6D 73                       4 	.byte 3   	
      00AC6E 90 F6 93                 5 	.ascii "REM"
      00AC71 EE 01                    6 	.word remark  
      0033CA                       5114 	_dict_entry,6,REBOOT,cold_start
      00AC73 72 A9                    1 	.word LINK 
                           0033CC     2 	LINK=.
      0033CC                          3 REBOOT:
      00AC75 00                       4 	.byte 6   	
      00AC76 03 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00AC78 00 B5                    6 	.word cold_start  
      0033D5                       5115 	_dict_entry,4+F_IFUNC,READ,read  
      00AC78 CD 9A                    1 	.word LINK 
                           0033D7     2 	LINK=.
      0033D7                          3 READ:
      00AC7A 3E                       4 	.byte 4+F_IFUNC   	
      00AC7B A1 02 27 03              5 	.ascii "READ"
      00AC7F CC 97                    6 	.word read  
      0033DE                       5116 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AC81 14 90                    1 	.word LINK 
                           0033E0     2 	LINK=.
      0033E0                          3 QKEY:
      00AC83 F6                       4 	.byte 4+F_IFUNC   	
      00AC84 93 EE 01 72              5 	.ascii "QKEY"
      00AC88 A9 00                    6 	.word qkey  
      0033E7                       5117 	_dict_entry,3,PUT,xput 
      00AC8A 03 9F                    1 	.word LINK 
                           0033E9     2 	LINK=.
      0033E9                          3 PUT:
      00AC8C 88                       4 	.byte 3   	
      00AC8D 90 F6 93                 5 	.ascii "PUT"
      00AC90 EE 01                    6 	.word xput  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      0033EF                       5118 	_dict_entry,4,PUSH,xpush   
      00AC92 72 A9                    1 	.word LINK 
                           0033F1     2 	LINK=.
      0033F1                          3 PUSH:
      00AC94 00                       4 	.byte 4   	
      00AC95 03 0D 01 27              5 	.ascii "PUSH"
      00AC99 07 98                    6 	.word xpush  
      0033F8                       5119 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AC9B 59 49                    1 	.word LINK 
                           0033FA     2 	LINK=.
      0033FA                          3 PORTI:
      00AC9D 0A                       4 	.byte 5+F_IFUNC   	
      00AC9E 01 26 F9 5B 01           5 	.ascii "PORTI"
      00ACA3 81 14                    6 	.word const_porti  
      00ACA4                       5120 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00ACA4 CD 9A                    1 	.word LINK 
                           003404     2 	LINK=.
      003404                          3 PORTG:
      00ACA6 3E                       4 	.byte 5+F_IFUNC   	
      00ACA7 A1 02 27 03 CC           5 	.ascii "PORTG"
      00ACAC 97 14                    6 	.word const_portg  
      00340C                       5121 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00ACAE 90 F6                    1 	.word LINK 
                           00340E     2 	LINK=.
      00340E                          3 PORTF:
      00ACB0 93                       4 	.byte 5+F_IFUNC   	
      00ACB1 EE 01 72 A9 00           5 	.ascii "PORTF"
      00ACB6 03 9F                    6 	.word const_portf  
      003416                       5122 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00ACB8 88 90                    1 	.word LINK 
                           003418     2 	LINK=.
      003418                          3 PORTE:
      00ACBA F6                       4 	.byte 5+F_IFUNC   	
      00ACBB 93 EE 01 72 A9           5 	.ascii "PORTE"
      00ACC0 00 03                    6 	.word const_porte  
      003420                       5123 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00ACC2 0D 01                    1 	.word LINK 
                           003422     2 	LINK=.
      003422                          3 PORTD:
      00ACC4 27                       4 	.byte 5+F_IFUNC   	
      00ACC5 07 98 46 56 0A           5 	.ascii "PORTD"
      00ACCA 01 26                    6 	.word const_portd  
      00342A                       5124 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00ACCC F9 5B                    1 	.word LINK 
                           00342C     2 	LINK=.
      00342C                          3 PORTC:
      00ACCE 01                       4 	.byte 5+F_IFUNC   	
      00ACCF 81 4F 52 54 43           5 	.ascii "PORTC"
      00ACD0 2E FB                    6 	.word const_portc  
      003434                       5125 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00ACD0 A6 84                    1 	.word LINK 
                           003436     2 	LINK=.
      003436                          3 PORTB:
      00ACD2 CD                       4 	.byte 5+F_IFUNC   	
      00ACD3 9A 31 CD 98 AD           5 	.ascii "PORTB"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00ACD8 9F A4                    6 	.word const_portb  
      00343E                       5126 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00ACDA 07 C7                    1 	.word LINK 
                           003440     2 	LINK=.
      003440                          3 PORTA:
      00ACDC 50                       4 	.byte 5+F_IFUNC   	
      00ACDD C6 81 52 54 41           5 	.ascii "PORTA"
      00ACDF 2E F1                    6 	.word const_porta  
      003448                       5127 	_dict_entry 5,PRINT,print 
      00ACDF 52 01                    1 	.word LINK 
                           00344A     2 	LINK=.
      00344A                          3 PRINT:
      00ACE1 CD                       4 	.byte 5   	
      00ACE2 9A 43 A1 02 27           5 	.ascii "PRINT"
      00ACE7 03 CC                    6 	.word print  
      003452                       5128 	_dict_entry,4+F_IFUNC,POUT,const_output
      00ACE9 97 14                    1 	.word LINK 
                           003454     2 	LINK=.
      003454                          3 POUT:
      00ACEB 90                       4 	.byte 4+F_IFUNC   	
      00ACEC F6 93 EE 01              5 	.ascii "POUT"
      00ACF0 72 A9                    6 	.word const_output  
      00345B                       5129 	_dict_entry,3+F_IFUNC,POP,xpop 
      00ACF2 00 03                    1 	.word LINK 
                           00345D     2 	LINK=.
      00345D                          3 POP:
      00ACF4 CF                       4 	.byte 3+F_IFUNC   	
      00ACF5 00 1A 90                 5 	.ascii "POP"
      00ACF8 F6 93                    6 	.word xpop  
      003463                       5130 	_dict_entry,4,POKE,poke 
      00ACFA EE 01                    1 	.word LINK 
                           003465     2 	LINK=.
      003465                          3 POKE:
      00ACFC 72                       4 	.byte 4   	
      00ACFD A9 00 03 CD              5 	.ascii "POKE"
      00AD01 AD 3E                    6 	.word poke  
      00346C                       5131 	_dict_entry,5,PMODE,pin_mode 
      00AD03 6B 01                    1 	.word LINK 
                           00346E     2 	LINK=.
      00346E                          3 PMODE:
      00AD05 A6                       4 	.byte 5   	
      00AD06 01 0D 01 27 0D           5 	.ascii "PMODE"
      00AD0B 48 0A                    6 	.word pin_mode  
      003476                       5132 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AD0D 01 26                    1 	.word LINK 
                           003478     2 	LINK=.
      003478                          3 PINP:
      00AD0F FB                       4 	.byte 4+F_IFUNC   	
      00AD10 6B 01 7B 01              5 	.ascii "PINP"
      00AD14 EA 03                    6 	.word const_input  
      00347F                       5133 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AD16 E7 03                    1 	.word LINK 
                           003481     2 	LINK=.
      003481                          3 PICK:
      00AD18 A6                       4 	.byte 4+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AD19 01 C1 00 0F              5 	.ascii "PICK"
      00AD1D 27 10                    6 	.word xpick  
      003488                       5134 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AD1F 7B 01                    1 	.word LINK 
                           00348A     2 	LINK=.
      00348A                          3 PEEK:
      00AD21 43                       4 	.byte 4+F_IFUNC   	
      00AD22 E4 04 E7 04              5 	.ascii "PEEK"
      00AD26 7B 01                    6 	.word peek  
      003491                       5135 	_dict_entry,5,PAUSE,pause 
      00AD28 43 E4                    1 	.word LINK 
                           003493     2 	LINK=.
      003493                          3 PAUSE:
      00AD2A 02                       4 	.byte 5   	
      00AD2B E7 02 20 0C 45           5 	.ascii "PAUSE"
      00AD2F 2B 68                    6 	.word pause  
      00349B                       5136 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AD2F 7B 01                    1 	.word LINK 
                           00349D     2 	LINK=.
      00349D                          3 PAD:
      00AD31 EA                       4 	.byte 3+F_IFUNC   	
      00AD32 02 E7 02                 5 	.ascii "PAD"
      00AD35 7B 01                    6 	.word pad_ref  
      0034A3                       5137 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AD37 EA 04                    1 	.word LINK 
                           0034A5     2 	LINK=.
      0034A5                          3 OR:
      00AD39 E7                       4 	.byte 2+F_OR   	
      00AD3A 04 52                    5 	.ascii "OR"
      00AD3B 00 89                    6 	.word TK_OR  
      0034AA                       5138 	_dict_entry,2,ON,cmd_on 
      00AD3B 5B 01                    1 	.word LINK 
                           0034AC     2 	LINK=.
      0034AC                          3 ON:
      00AD3D 81                       4 	.byte 2   	
      00AD3E 4F 4E                    5 	.ascii "ON"
      00AD3E 58 1C                    6 	.word cmd_on  
      0034B1                       5139 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AD40 AD 4E                    1 	.word LINK 
                           0034B3     2 	LINK=.
      0034B3                          3 ODR:
      00AD42 FE                       4 	.byte 3+F_IFUNC   	
      00AD43 9F 88 5E                 5 	.ascii "ODR"
      00AD46 A6 05                    6 	.word const_odr  
      0034B9                       5140 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AD48 42 1C                    1 	.word LINK 
                           0034BB     2 	LINK=.
      0034BB                          3 NOT:
      00AD4A 50                       4 	.byte 3+F_NOT   	
      00AD4B 00 84 81                 5 	.ascii "NOT"
      00AD4E 00 87                    6 	.word TK_NOT  
      0034C1                       5141 	_dict_entry,4,NEXT,next 
      00AD4E 03 06                    1 	.word LINK 
                           0034C3     2 	LINK=.
      0034C3                          3 NEXT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AD50 03                       4 	.byte 4   	
      00AD51 05 04 00 02              5 	.ascii "NEXT"
      00AD55 01 06                    6 	.word next  
      0034CA                       5142 	_dict_entry,3,NEW,new
      00AD57 00 02                    1 	.word LINK 
                           0034CC     2 	LINK=.
      0034CC                          3 NEW:
      00AD59 02                       4 	.byte 3   	
      00AD5A 02 03 03                 5 	.ascii "NEW"
      00AD5D 01 03                    6 	.word new  
      0034D2                       5143 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AD5F 03 02                    1 	.word LINK 
                           0034D4     2 	LINK=.
      0034D4                          3 LSHIFT:
      00AD61 04                       4 	.byte 6+F_IFUNC   	
      00AD62 04 05 02 06 02 07        5 	.ascii "LSHIFT"
      00AD68 02 05                    6 	.word lshift  
      0034DD                       5144 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AD6A 04 02                    1 	.word LINK 
                           0034DF     2 	LINK=.
      0034DF                          3 LOG2:
      00AD6C 04                       4 	.byte 4+F_IFUNC   	
      00AD6D 01 4F 47 32              5 	.ascii "LOG2"
      00AD6E 2E 58                    6 	.word log2  
      0034E6                       5145 	_dict_entry 4,LIST,list
      00AD6E CD 9A                    1 	.word LINK 
                           0034E8     2 	LINK=.
      0034E8                          3 LIST:
      00AD70 3E                       4 	.byte 4   	
      00AD71 A1 01 27 03              5 	.ascii "LIST"
      00AD75 CC 97                    6 	.word list  
      0034EF                       5146 	_dict_entry 3,LET,let 
      00AD77 14 E8                    1 	.word LINK 
                           0034F1     2 	LINK=.
      00AD78                          3 LET:
      00AD78 90                       4 	.byte 3   	
      00AD79 F6 93 EE                 5 	.ascii "LET"
      00AD7C 01 72                    6 	.word let  
      0034F7                       5147 	_dict_entry,3+F_CFUNC,KEY,key 
      00AD7E A9 00                    1 	.word LINK 
                           0034F9     2 	LINK=.
      0034F9                          3 KEY:
      00AD80 03                       4 	.byte 3+F_CFUNC   	
      00AD81 89 88 A6                 5 	.ascii "KEY"
      00AD84 80 15                    6 	.word key  
      0034FF                       5148 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AD86 01 27                    1 	.word LINK 
                           003501     2 	LINK=.
      003501                          3 IWDGREF:
      00AD88 05                       4 	.byte 7   	
      00AD89 A6 0A CC 97 16 45 46     5 	.ascii "IWDGREF"
      00AD8E 2E 53                    6 	.word refresh_iwdg  
      00350B                       5149 	_dict_entry,6,IWDGEN,enable_iwdg
      00AD8E CE 00                    1 	.word LINK 
                           00350D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00350D                          3 IWDGEN:
      00AD90 15                       4 	.byte 6   	
      00AD91 58 58 58 58 58 9E        5 	.ascii "IWDGEN"
      00AD97 C8 00                    6 	.word enable_iwdg  
      003516                       5150 	_dict_entry,5,INPUT,input_var  
      00AD99 15 C7                    1 	.word LINK 
                           003518     2 	LINK=.
      003518                          3 INPUT:
      00AD9B 00                       4 	.byte 5   	
      00AD9C 0E 9F C8 00 16           5 	.ascii "INPUT"
      00ADA1 C7 00                    6 	.word input_var  
      003520                       5151 	_dict_entry,2,IF,if 
      00ADA3 0F CE                    1 	.word LINK 
                           003522     2 	LINK=.
      003522                          3 IF:
      00ADA5 00                       4 	.byte 2   	
      00ADA6 17 CF                    5 	.ascii "IF"
      00ADA8 00 15                    6 	.word if  
      003527                       5152 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00ADAA CE 00                    1 	.word LINK 
                           003529     2 	LINK=.
      003529                          3 IDR:
      00ADAC 17                       4 	.byte 3+F_IFUNC   	
      00ADAD 54 9E C8                 5 	.ascii "IDR"
      00ADB0 00 17                    6 	.word const_idr  
      00352F                       5153 	_dict_entry,3,HEX,hex_base
      00ADB2 C7 00                    1 	.word LINK 
                           003531     2 	LINK=.
      003531                          3 HEX:
      00ADB4 17                       4 	.byte 3   	
      00ADB5 9F C8 00                 5 	.ascii "HEX"
      00ADB8 18 C7                    6 	.word hex_base  
      003537                       5154 	_dict_entry,4,GOTO,goto 
      00ADBA 00 18                    1 	.word LINK 
                           003539     2 	LINK=.
      003539                          3 GOTO:
      00ADBC CE                       4 	.byte 4   	
      00ADBD 00 0E 54 54              5 	.ascii "GOTO"
      00ADC1 54 9E                    6 	.word goto  
      003540                       5155 	_dict_entry,5,GOSUB,gosub 
      00ADC3 C8 00                    1 	.word LINK 
                           003542     2 	LINK=.
      003542                          3 GOSUB:
      00ADC5 0E                       4 	.byte 5   	
      00ADC6 C7 00 0E 9F C8           5 	.ascii "GOSUB"
      00ADCB 00 0F                    6 	.word gosub  
      00354A                       5156 	_dict_entry,3,GET,cmd_get 
      00ADCD C7 00                    1 	.word LINK 
                           00354C     2 	LINK=.
      00354C                          3 GET:
      00ADCF 0F                       4 	.byte 3   	
      00ADD0 C8 00 18                 5 	.ascii "GET"
      00ADD3 97 C6                    6 	.word cmd_get  
      003552                       5157 	_dict_entry,4+F_IFUNC,FREE,free
      00ADD5 00 0E                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



                           003554     2 	LINK=.
      003554                          3 FREE:
      00ADD7 C8                       4 	.byte 4+F_IFUNC   	
      00ADD8 00 17 95 CF              5 	.ascii "FREE"
      00ADDC 00 17                    6 	.word free  
      00355B                       5158 	_dict_entry,3,FOR,for 
      00ADDE C6 00                    1 	.word LINK 
                           00355D     2 	LINK=.
      00355D                          3 FOR:
      00ADE0 16                       4 	.byte 3   	
      00ADE1 A4 7F 72                 5 	.ascii "FOR"
      00ADE4 A2 00                    6 	.word for  
      003563                       5159 	_dict_entry,4,FCPU,fcpu 
      00ADE6 03 90                    1 	.word LINK 
                           003565     2 	LINK=.
      003565                          3 FCPU:
      00ADE8 F7                       4 	.byte 4   	
      00ADE9 90 EF 01 84              5 	.ascii "FCPU"
      00ADED 85 72                    6 	.word fcpu  
      00356C                       5160 	_dict_entry,5,ERASE,cmd_erase 
      00ADEF A2 00                    1 	.word LINK 
                           00356E     2 	LINK=.
      00356E                          3 ERASE:
      00ADF1 03                       4 	.byte 5   	
      00ADF2 90 F7 90 EF 01           5 	.ascii "ERASE"
      00ADF7 CD 84                    6 	.word cmd_erase  
      003576                       5161 	_dict_entry,3,END,cmd_end  
      00ADF9 21 90                    1 	.word LINK 
                           003578     2 	LINK=.
      003578                          3 END:
      00ADFB F6                       4 	.byte 3   	
      00ADFC 93 EE 01                 5 	.ascii "END"
      00ADFF 72 A9                    6 	.word cmd_end  
      00357E                       5162 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AE01 00 03                    1 	.word LINK 
                           003580     2 	LINK=.
      003580                          3 EEPROM:
      00AE03 1C                       4 	.byte 6+F_IFUNC   	
      00AE04 00 01 A9 00 81 4D        5 	.ascii "EEPROM"
      00AE09 2F 3C                    6 	.word const_eeprom_base  
      003589                       5163 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AE09 90 89                    1 	.word LINK 
                           00358B     2 	LINK=.
      00358B                          3 EEFREE:
      00AE0B 52                       4 	.byte 6+F_IFUNC   	
      00AE0C 03 0F 02 0F 03 90        5 	.ascii "EEFREE"
      00AE12 AE B7                    6 	.word func_eefree  
      003594                       5164 	_dict_entry,4,EDIT,cmd_edit 
      00AE14 14 93                    1 	.word LINK 
                           003596     2 	LINK=.
      003596                          3 EDIT:
      00AE16 F6                       4 	.byte 4   	
      00AE17 A4 0F 6B 01              5 	.ascii "EDIT"
      00AE1B 0C 03                    6 	.word cmd_edit  
      00359D                       5165 	_dict_entry,6+F_CMD,DWRITE,digital_write
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00AE1D 5C F6                    1 	.word LINK 
                           00359F     2 	LINK=.
      00359F                          3 DWRITE:
      00AE1F CD                       4 	.byte 6+F_CMD   	
      00AE20 89 7F 0C 02 0A 01        5 	.ascii "DWRITE"
      00AE26 26 F5                    6 	.word digital_write  
      0035A8                       5166 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AE28 A6 46                    1 	.word LINK 
                           0035AA     2 	LINK=.
      0035AA                          3 DROP:
      00AE2A 11                       4 	.byte 4   	
      00AE2B 02 2B 09 A6              5 	.ascii "DROP"
      00AE2F 20 CD                    6 	.word xdrop  
      0035B1                       5167 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AE31 89 7F                    1 	.word LINK 
                           0035B3     2 	LINK=.
      0035B3                          3 DREAD:
      00AE33 0C                       4 	.byte 5+F_IFUNC   	
      00AE34 02 20 07 A6 0D           5 	.ascii "DREAD"
      00AE39 CD 89                    6 	.word digital_read  
      0035BB                       5168 	_dict_entry,2,DO,do_loop
      00AE3B 7F 0F                    1 	.word LINK 
                           0035BD     2 	LINK=.
      0035BD                          3 DO:
      00AE3D 02                       4 	.byte 2   	
      00AE3E 72 A2                    5 	.ascii "DO"
      00AE40 00 02                    6 	.word do_loop  
      0035C2                       5169 	_dict_entry,3,DIR,cmd_dir
      00AE42 90 FE                    1 	.word LINK 
                           0035C4     2 	LINK=.
      0035C4                          3 DIR:
      00AE44 26                       4 	.byte 3   	
      00AE45 CF A6 0D                 5 	.ascii "DIR"
      00AE48 CD 89                    6 	.word cmd_dir  
      0035CA                       5170 	_dict_entry,3,DIM,cmd_dim 
      00AE4A 7F 5F                    1 	.word LINK 
                           0035CC     2 	LINK=.
      0035CC                          3 DIM:
      00AE4C 7B                       4 	.byte 3   	
      00AE4D 03 97 CD                 5 	.ascii "DIM"
      00AE50 98 C3                    6 	.word cmd_dim  
      0035D2                       5171 	_dict_entry,3,DEC,dec_base
      00AE52 AE AE                    1 	.word LINK 
                           0035D4     2 	LINK=.
      0035D4                          3 DEC:
      00AE54 5D                       4 	.byte 3   	
      00AE55 CD 89 DC                 5 	.ascii "DEC"
      00AE58 5B 03                    6 	.word dec_base  
      0035DA                       5172 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AE5A 90 85                    1 	.word LINK 
                           0035DC     2 	LINK=.
      0035DC                          3 DDR:
      00AE5C 81                       4 	.byte 3+F_IFUNC   	
      00AE5D 20 77 6F                 5 	.ascii "DDR"
      00AE60 72 64                    6 	.word const_ddr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      0035E2                       5173 	_dict_entry,4,DATA,data  
      00AE62 73 20                    1 	.word LINK 
                           0035E4     2 	LINK=.
      0035E4                          3 DATA:
      00AE64 69                       4 	.byte 4   	
      00AE65 6E 20 64 69              5 	.ascii "DATA"
      00AE69 63 74                    6 	.word data  
      0035EB                       5174 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AE6B 69 6F                    1 	.word LINK 
                           0035ED     2 	LINK=.
      0035ED                          3 CR2:
      00AE6D 6E                       4 	.byte 3+F_IFUNC   	
      00AE6E 61 72 79                 5 	.ascii "CR2"
      00AE71 0A 00                    6 	.word const_cr2  
      00AE73                       5175 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AE73 CD 9A                    1 	.word LINK 
                           0035F5     2 	LINK=.
      0035F5                          3 CR1:
      00AE75 43                       4 	.byte 3+F_IFUNC   	
      00AE76 A1 01 27                 5 	.ascii "CR1"
      00AE79 03 CC                    6 	.word const_cr1  
      0035FB                       5176 	_dict_entry,5,CONST,cmd_const 
      00AE7B 97 14                    1 	.word LINK 
                           0035FD     2 	LINK=.
      00AE7D                          3 CONST:
      00AE7D 90                       4 	.byte 5   	
      00AE7E F6 93 EE 01 72           5 	.ascii "CONST"
      00AE83 A9 00                    6 	.word cmd_const  
      003605                       5177 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AE85 03 CF                    1 	.word LINK 
                           003607     2 	LINK=.
      003607                          3 CHAR:
      00AE87 00                       4 	.byte 4+F_CFUNC   	
      00AE88 13 81 41 52              5 	.ascii "CHAR"
      00AE8A 2A 75                    6 	.word func_char  
      00360E                       5178 	_dict_entry,5,CHAIN,cmd_chain
      00AE8A 4F CE                    1 	.word LINK 
                           003610     2 	LINK=.
      003610                          3 CHAIN:
      00AE8C 00                       4 	.byte 5   	
      00AE8D 13 27 02 5F 81           5 	.ascii "CHAIN"
      00AE92 43 53                    6 	.word cmd_chain  
      003618                       5179 	_dict_entry,3,BYE,bye 
      00AE94 81 10                    1 	.word LINK 
                           00361A     2 	LINK=.
      00AE95                          3 BYE:
      00AE95 CD                       4 	.byte 3   	
      00AE96 9A 43 A1                 5 	.ascii "BYE"
      00AE99 01 27                    6 	.word bye  
      003620                       5180 	_dict_entry,5,BTOGL,bit_toggle
      00AE9B 03 CC                    1 	.word LINK 
                           003622     2 	LINK=.
      003622                          3 BTOGL:
      00AE9D 97                       4 	.byte 5   	
      00AE9E 14 90 F6 93 EE           5 	.ascii "BTOGL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



      00AEA3 01 72                    6 	.word bit_toggle  
      00362A                       5181 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AEA5 A9 00                    1 	.word LINK 
                           00362C     2 	LINK=.
      00362C                          3 BTEST:
      00AEA7 03                       4 	.byte 5+F_IFUNC   	
      00AEA8 4B 00 35 CC 50           5 	.ascii "BTEST"
      00AEAD E0 9E                    6 	.word bit_test  
      003634                       5182 	_dict_entry,4,BSET,bit_set 
      00AEAF A4 3F                    1 	.word LINK 
                           003636     2 	LINK=.
      003636                          3 BSET:
      00AEB1 95                       4 	.byte 4   	
      00AEB2 A3 00 FF 23              5 	.ascii "BSET"
      00AEB6 06 0C                    6 	.word bit_set  
      00363D                       5183 	_dict_entry,4,BRES,bit_reset
      00AEB8 01 98                    1 	.word LINK 
                           00363F     2 	LINK=.
      00363F                          3 BRES:
      00AEBA 56                       4 	.byte 4   	
      00AEBB 20 F5 35 55              5 	.ascii "BRES"
      00AEBF 50 E0                    6 	.word bit_reset  
      003646                       5184 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AEC1 84 C7                    1 	.word LINK 
                           003648     2 	LINK=.
      003648                          3 BIT:
      00AEC3 50                       4 	.byte 3+F_IFUNC   	
      00AEC4 E1 9F 4A                 5 	.ascii "BIT"
      00AEC7 35 55                    6 	.word bitmask  
      00364E                       5185 	_dict_entry,3,AWU,awu 
      00AEC9 50 E0                    1 	.word LINK 
                           003650     2 	LINK=.
      003650                          3 AWU:
      00AECB C7                       4 	.byte 3   	
      00AECC 50 E2 35                 5 	.ascii "AWU"
      00AECF AA 50                    6 	.word awu  
      003656                       5186 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AED1 E0 81                    1 	.word LINK 
                           003658     2 	LINK=.
      00AED3                          3 AUTORUN:
      00AED3 35                       4 	.byte 7   	
      00AED4 AA 50 E0 81 52 55 4E     5 	.ascii "AUTORUN"
      00AED8 31 A4                    6 	.word cmd_auto_run  
      003662                       5187 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AED8 CD 9A                    1 	.word LINK 
                           003664     2 	LINK=.
      003664                          3 ASC:
      00AEDA 3E                       4 	.byte 3+F_IFUNC   	
      00AEDB A1 01 27                 5 	.ascii "ASC"
      00AEDE 03 CC                    6 	.word ascii  
      00366A                       5188 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AEE0 97 14                    1 	.word LINK 
                           00366C     2 	LINK=.
      00AEE2                          3 AND:
      00AEE2 90                       4 	.byte 3+F_AND   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00AEE3 F6 93 EE                 5 	.ascii "AND"
      00AEE6 01 72                    6 	.word TK_AND  
      003672                       5189 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AEE8 A9 00                    1 	.word LINK 
                           003674     2 	LINK=.
      003674                          3 ALLOC:
      00AEEA 03                       4 	.byte 5   	
      00AEEB 4D 26 08 5D 26           5 	.ascii "ALLOC"
      00AEF0 05 A6                    6 	.word xalloc  
      00367C                       5190 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AEF2 0A CC                    1 	.word LINK 
                           00367E     2 	LINK=.
      00367E                          3 ADCREAD:
      00AEF4 97                       4 	.byte 7+F_IFUNC   	
      00AEF5 16 4B 18 59 49 25 04     5 	.ascii "ADCREAD"
      00AEFC 0A 01                    6 	.word analog_read  
      003688                       5191 	_dict_entry,5,ADCON,power_adc 
      00AEFE 26 F8                    1 	.word LINK 
                           00368A     2 	LINK=.
      00368A                          3 ADCON:
      00AF00 5F                       4 	.byte 5   	
      00AF01 84 4A 02 4F 4E           5 	.ascii "ADCON"
      00AF04 26 49                    6 	.word power_adc  
      003692                       5192 kword_dict::
      003692                       5193 	_dict_entry,3+F_IFUNC,ABS,abs
      00AF04 81 8A                    1 	.word LINK 
                           003694     2 	LINK=.
      00AF05                          3 ABS:
      00AF05 CD                       4 	.byte 3+F_IFUNC   	
      00AF06 9A 3E A1                 5 	.ascii "ABS"
      00AF09 01 27                    6 	.word abs  
                                   5194 
                                   5195 
                                   5196 
                                   5197 
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
      00369A                         30 test:
      00369A                         31     _vars VSIZE 
      00AF0B 03 CC            [ 2]    1     sub sp,#VSIZE 
      00AF0D 97 14 90         [ 2]   32     ldw x,#LOOP_CNT
      00AF10 F6 93            [ 2]   33     ldw (CNTR,sp),x  
      00AF12 EE 01 72         [ 2]   34     ldw x,ticks 
      00AF15 A9 00            [ 2]   35     ldw (T,sp),x
      0036A6                         36 1$: ; test add24 
      00AF17 03 9F            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AF19 AE 00 01         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AF1C A4 17 27         [ 1]   39     ld acc24,a 
      00AF1F 0A 88 4F         [ 2]   40     ldw acc24+1,x  
      00AF22 A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AF22 58 49 0A         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AF25 01 26 FA         [ 4]   43     call add24 
      00AF28 1E 03            [ 2]   44     ldw x,(CNTR,sp)
      00AF28 5B 01 81         [ 2]   45     subw x,#1
      00AF2B 1F 03            [ 2]   46     ldw (CNTR,sp),x 
      00AF2B 85 52            [ 1]   47     jrne 1$
      00AF2D 04 89 CE         [ 4]   48     call prt_acc24
      00AF30 00 05            [ 1]   49     ld a,#SPACE 
      00AF32 1F 03 CE         [ 4]   50     call putc 
      00AF35 00 01 1F         [ 2]   51     ldw x,ticks 
      00AF38 05 72 5C         [ 2]   52     subw x,(T,sp)
      00AF3B 00 20 81         [ 4]   53     call prt_i16  
      00AF3E A6 0D            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]



      00AF3E 72 5D 00         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AF41 20 26 03         [ 2]   58     ldw x,LOOP_CNT
      00AF44 CC 97            [ 2]   59     ldw (CNTR,sp),x 
      00AF46 14 00 0F         [ 2]   60     ldw x,ticks 
      00AF47 1F 01            [ 2]   61     ldw (T,sp),x 
      0036E2                         62 2$: 
      00AF47 CD 9C            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AF49 9E 90 F6         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AF4C 93 EE 01         [ 1]   65     ld acc24,a 
      00AF4F 72 A9 00         [ 2]   66     ldw acc24+1,x  
      00AF52 03 4D            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AF54 26 13 5D         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AF57 26 10 1E         [ 4]   69     call mul24 
      00AF5A 03 CF            [ 2]   70     ldw x,(CNTR,sp)
      00AF5C 00 05 E6         [ 2]   71     subw x,#1
      00AF5F 02 C7            [ 2]   72     ldw (CNTR,sp),x 
      00AF61 00 03            [ 1]   73     jrne 2$ 
      00AF63 1E 05 CF         [ 4]   74    call prt_acc24 
      00AF66 00 01            [ 1]   75    ld a,#SPACE 
      00AF68 81 08 FF         [ 4]   76    call putc 
      00AF69 CE 00 0F         [ 2]   77     ldw x,ticks 
      00AF69 85 5B 04         [ 2]   78     subw x,(T,sp)
      00AF6C 72 5A 00         [ 4]   79     call prt_i16 
      00AF6F 20 FC            [ 1]   80     ld a,#CR 
      00AF71 CD 08 FF         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AF71 AE 50 00         [ 2]   83     ldw x,LOOP_CNT
      00AF74 4F 81            [ 2]   84     ldw (CNTR,sp),x 
      00AF76 CE 00 0F         [ 2]   85     ldw x,ticks 
      00AF76 AE 50            [ 2]   86     ldw (T,sp),x 
      00371E                         87 3$: 
      00AF78 05 4F            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AF7A 81 FF FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AF7B C7 00 0C         [ 1]   90     ld acc24,a 
      00AF7B AE 50 0A         [ 2]   91     ldw acc24+1,x  
      00AF7E 4F 81            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AF80 AE 05 FF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AF80 AE 50 0F         [ 4]   94     call mul24 
      00AF83 4F 81            [ 2]   95     ldw x,(CNTR,sp)
      00AF85 1D 00 01         [ 2]   96     subw x,#1
      00AF85 AE 50            [ 2]   97     ldw (CNTR,sp),x 
      00AF87 14 4F            [ 1]   98     jrne 3$ 
      00AF89 81 18 5A         [ 4]   99     call prt_acc24    
      00AF8A A6 20            [ 1]  100     ld a,#SPACE 
      00AF8A AE 50 19         [ 4]  101     call putc 
      00AF8D 4F 81 0F         [ 2]  102     ldw x,ticks 
      00AF8F 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AF8F AE 50 1E         [ 4]  104     call prt_i16 
      00AF92 4F 81            [ 1]  105     ld a,#CR 
      00AF94 CD 08 FF         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AF94 AE 50 28         [ 2]  108     ldw x,LOOP_CNT
      00AF97 4F 81            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]



      00AF99 CE 00 0F         [ 2]  110     ldw x,ticks 
      00AF99 4F AE            [ 2]  111     ldw (T,sp),x 
      00375A                        112 4$:
      00AF9B 00 00            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AF9D 81 FF FF         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AF9E C7 00 0C         [ 1]  115     ld acc24,a 
      00AF9E 4F AE 00         [ 2]  116     ldw acc24+1,x  
      00AFA1 01 81            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AFA3 AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AFA3 4F AE 00         [ 4]  119     call mul24 
      00AFA6 02 81            [ 2]  120     ldw x,(CNTR,sp)
      00AFA8 1D 00 01         [ 2]  121     subw x,#1
      00AFA8 4F AE            [ 2]  122     ldw (CNTR,sp),x 
      00AFAA 00 03            [ 1]  123     jrne 4$ 
      00AFAC 81 18 5A         [ 4]  124     call prt_acc24 
      00AFAD A6 20            [ 1]  125     ld a,#SPACE 
      00AFAD 4F AE 00         [ 4]  126     call putc 
      00AFB0 04 81 0F         [ 2]  127     ldw x,ticks 
      00AFB2 72 F0 01         [ 2]  128     subw x,(T,sp)
      00AFB2 4F AE 00         [ 4]  129     call prt_i16 
      00AFB5 01 81            [ 1]  130     ld a,#CR 
      00AFB7 CD 08 FF         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AFB7 4F AE 00         [ 2]  133     ldw x,LOOP_CNT
      00AFBA 00 81            [ 2]  134     ldw (CNTR,sp),x 
      00AFBC CE 00 0F         [ 2]  135     ldw x,ticks 
      00AFBC 4F AE            [ 2]  136     ldw (T,sp),x 
      003796                        137 5$: 
      00AFBE 40 00            [ 1]  138     ld a,#0xff
      00AFC0 81 FF FF         [ 2]  139     ldw x,#0xffff
      00AFC1 CD 01 F3         [ 4]  140     call abs24 
      00AFC1 55 00 03         [ 1]  141     ld acc24,a 
      00AFC4 00 02 81         [ 2]  142     ldw acc24+1,x
      00AFC7 1E 03            [ 2]  143     ldw x,(CNTR,sp)
      00AFC7 89 E6 03         [ 2]  144     subw x,#1
      00AFCA A1 80            [ 2]  145     ldw (CNTR,sp),x 
      00AFCC 26 05            [ 1]  146     jrne 5$ 
      00AFCE EE 04 A3         [ 4]  147     call prt_acc24 
      00AFD1 AF C1            [ 1]  148     ld a,#SPACE 
      00AFD3 85 81 FF         [ 4]  149     call putc 
      00AFD5 CE 00 0F         [ 2]  150     ldw x,ticks 
      00AFD5 5F CF 00         [ 2]  151     subw x,(T,sp)
      00AFD8 07 CF 00         [ 4]  152     call prt_i16 
      0037BE                        153 6$:
      00AFDB 09 CE            [ 1]  154     ld a,#CR 
      00AFDD 00 1C CD         [ 4]  155     call putc 
      00AFE0 98 7B A1         [ 4]  156     call read_integer 
      00AFE3 84 26 10 CD 98   [ 1]  157     mov farptr,acc24 
      00AFE8 AD 90 89 4F CD   [ 1]  158     mov farptr+1,acc16 
      00AFED 8C C5 90 85 5D   [ 1]  159     mov farptr+2,acc8 
      00AFF2 26 17 20         [ 4]  160     call read_integer 
      00AFF5 44 00 0C         [ 1]  161     ld a,acc24 
      00AFF6 CE 00 0D         [ 2]  162     ldw x,acc16 
      00AFF6 55 00 04 00 02   [ 1]  163     mov acc24,farptr 
      00AFFB C3 00 1E 24 3A   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]



      00B000 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00B000 CD AF C7         [ 4]  166     call div24 
      00B003 26               [ 1]  167     push a 
      00B004 00               [ 2]  168     pushw x 
      00B005 CD B0 18         [ 4]  169     call prt_acc24 
      00B008 26 FB            [ 1]  170     ld a,#SPACE 
      00B00A 81 08 FF         [ 4]  171     call putc 
      00B00B 85               [ 2]  172     popw x
      00B00B CF 00 07         [ 2]  173     ldw acc16,x  
      00B00E E6 02 C7         [ 1]  174     pop acc24 
      00B011 00 0A 35         [ 4]  175     call prt_acc24
      00B014 06 00            [ 2]  176     jra 6$
      003806                        177     _drop VSIZE 
      00B016 09 81            [ 2]    1     addw sp,#VSIZE 
      00B018 81               [ 4]  178     ret 
                                    179 
                                    180 
      003809                        181 read_integer:
      00B018 E6 02            [ 1]  182     ld a,#'? 
      00B01A C7 00 0F         [ 4]  183     call putc  
      00B01D 72 5F 00 0E      [ 1]  184 	clr count  
      00B021 72 BB 00         [ 4]  185 	call readln 
      00B024 0E C3 00         [ 2]  186 	ldw x,#tib 
      00B027 1E 25 02         [ 1]  187 	push count
      00B02A 20 0E            [ 1]  188 	push #0 
      00B02C 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00B02C CD               [ 1]  190 	incw x 
      003821                        191 	_drop 2 
      00B02D AF C7            [ 2]    1     addw sp,#2 
      00B02F 27 04 A6 01      [ 1]  192 	clr in 
      00B033 20 04 CD         [ 4]  193 	call get_token
      00B036 B0 0B            [ 1]  194 	cp a,#TK_INTGR
      00B038 4F 81            [ 1]  195 	jreq 3$ 
      00B03A A1 11            [ 1]  196 	cp a,#TK_MINUS
      00B03A A6 0C CC         [ 4]  197 	call get_token 
      00B03D 97 16            [ 1]  198 	cp a,#TK_INTGR 
      00B03F 27 03            [ 1]  199 	jreq 2$
      00B03F 52 07 CD         [ 2]  200 	jp syntax_error
      00383A                        201 2$:
      00B042 A0 DE 1D         [ 4]  202 	call neg_acc24  	
      00B044                        203 3$: 
      00B044 C6               [ 4]  204     ret 
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
      00B045 00 09                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B047 C1 00                   32 app_size: .word 0 
      003884                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003694 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      00368A R
    ADCON_ID=  000002     |   4 ADCREAD    00367E R   |     ADCREAD_=  000004 
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
  4 ALLOC      003674 R   |   4 AND        00366C R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 AR_SIGN    0031F8 R   |   4 ASC        003664 R   |     ASC_IDX =  000006 
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTORUN    003658 R
  4 AUTO_RUN   00015C R   |   4 AWU        003650 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        003648 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       00363F R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       003636 R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      00362C R
    BTEST_ID=  000010     |   4 BTOGL      003622 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        00361A R   |     BYE_IDX =  000014 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAIN      003610 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    CHAIN_AD=  000005     |     CHAIN_BP=  000007     |     CHAIN_CN=  000008 
    CHAIN_CO=  00000A     |     CHAIN_IN=  000009     |     CHAIN_LN=  000003 
    CHAIN_TX=  00000B     |     CHAIN_TX=  00000D     |   4 CHAR       003607 R
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
    COMMA   =  00002C     |   4 CONST      0035FD R   |     CONST_ID=  0000B6 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CR1        0035F5 R
    CR1_IDX =  00001A     |   4 CR2        0035ED R   |     CR2_IDX =  000018 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0035E4 R
    DATA_IDX=  00001C     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        0035DC R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        0035D4 R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        0035CC R   |   4 DIR        0035C4 R   |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0035BD R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      0035B3 R   |     DREAD_ID=  000024     |   4 DROP       0035AA R
  4 DWRITE     00359F R   |     DWRITE_I=  000026     |   4 EDIT       003596 R
    EDIT_IDX=  000028     |   4 EEFREE     00358B R   |     EEFREE_I=  0000B8 
  4 EEPROM     003580 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        003578 R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      00356E R
  4 ERASED     00299B R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_NO_P=  000012     |     ERR_OVER=  000010 
    ERR_RD_O=  000011     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       003565 R   |     FCPU_IDX=  000030 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001EBC R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        00355D R
    FOR_IDX =  000034     |   4 FREE       003554 R   |     FREE_IDX=  000088 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_AND   =  000080 
    F_CFUNC =  000020     |     F_CMD   =  000000     |     F_CONST =  000030 
    F_IFUNC =  000010     |     F_NOT   =  000070     |     F_OR    =  000090 
    F_XOR   =  0000A0     |   4 GET        00354C R   |     GET_IDX =  0000B4 
  4 GOSUB      003542 R   |     GOSUB_ID=  000036     |   4 GOTO       003539 R
    GOTO_IDX=  000038     |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        003531 R   |     HEX_IDX =  00003A     |     HOME    =  000082 
    HSECNT  =  004809     |     I2C_CCRH=  00521C     |     I2C_CCRH=  000080 
    I2C_CCRH=  0000C0     |     I2C_CCRH=  000080     |     I2C_CCRH=  000000 
    I2C_CCRH=  000001     |     I2C_CCRH=  000000     |     I2C_CCRL=  00521B 
    I2C_CCRL=  00001A     |     I2C_CCRL=  000002     |     I2C_CCRL=  00000D 
    I2C_CCRL=  000050     |     I2C_CCRL=  000090     |     I2C_CCRL=  0000A0 
    I2C_CR1 =  005210     |     I2C_CR1_=  000006     |     I2C_CR1_=  000007 
    I2C_CR1_=  000000     |     I2C_CR2 =  005211     |     I2C_CR2_=  000002 
    I2C_CR2_=  000003     |     I2C_CR2_=  000000     |     I2C_CR2_=  000001 
    I2C_CR2_=  000007     |     I2C_DR  =  005216     |     I2C_FREQ=  005212 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    I2C_ITR =  00521A     |     I2C_ITR_=  000002     |     I2C_ITR_=  000000 
    I2C_ITR_=  000001     |     I2C_OARH=  005214     |     I2C_OARH=  000001 
    I2C_OARH=  000002     |     I2C_OARH=  000006     |     I2C_OARH=  000007 
    I2C_OARL=  005213     |     I2C_OARL=  000000     |     I2C_OAR_=  000813 
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
    I2C_WRIT=  000000     |   4 IDR        003529 R   |     IDR_IDX =  00003C 
  4 IF         003522 R   |     IF_IDX  =  00003E     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   4 INPUT      003518 R
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
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     00350D R
    IWDGEN_I=  000042     |   4 IWDGREF    003501 R   |     IWDGREF_=  000044 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        0034F9 R   |     KEY_END =  000083 
    KEY_IDX =  000046     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        0034F1 R
    LET_IDX =  000048     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   4 LINK    =  003694 R   |   4 LIST       0034E8 R
    LIST_IDX=  00004A     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       0034DF R
    LOG_IDX =  00004C     |     LOOP_CNT=  002710     |   4 LSHIFT     0034D4 R
    LSHIFT_I=  00004E     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000005     |     NAFR    =  004804     |     NAK     =  000015 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

    NAMEPTR =  000001     |     NAME_MAX=  00000F     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        0034CC R   |     NEW_IDX =  000052 
  4 NEXT       0034C3 R   |     NEXT_IDX=  000050     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NLEN_MAS=  00000F 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        0034BB R
    NOT_IDX =  0000F8     |     NOT_OP  =  000001     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        0034B3 R   |     ODR_IDX =  000054     |   4 ON         0034AC R
    ONOFF   =  000003     |     ON_IDX  =  0000B2     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         0034A5 R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        00349D R   |     PAD_IDX =  000056 
    PAD_SIZE=  000080     |   4 PAUSE      003493 R   |     PAUSE_ID=  000058 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       00348A R   |     PEEK_IDX=  00005C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PG_SIZE =  000001 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   4 PICK       003481 R
    PINNO   =  000001     |   4 PINP       003478 R   |     PINP_IDX=  00005E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      00346E R   |     PMODE_ID=  00005A 
    PNAME   =  000003     |   4 POKE       003465 R   |     POKE_IDX=  000060 
  4 POP        00345D R   |   4 PORTA      003440 R   |   4 PORTB      003436 R
  4 PORTC      00342C R   |   4 PORTD      003422 R   |   4 PORTE      003418 R
  4 PORTF      00340E R   |   4 PORTG      003404 R   |   4 PORTI      0033FA R
  4 POUT       003454 R   |     POUT_IDX=  000062     |     PREV    =  000001 
    PRG_SIZE=  000003     |   4 PRINT      00344A R   |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001E92 R   |   4 PROG_SIZ   001EA4 R
    PRTA_IDX=  000066     |     PRTB_IDX=  000068     |     PRTC_IDX=  00006A 
    PRTD_IDX=  00006C     |     PRTE_IDX=  00006E     |     PRTF_IDX=  000070 
    PRTG_IDX=  000072     |     PRTI_IDX=  000074     |     PRT_IDX =  000064 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    PSIZE   =  00000B     |     PSTR    =  000003     |   4 PUSH       0033F1 R
  4 PUT        0033E9 R   |   4 QKEY       0033E0 R   |     QKEY_IDX=  000076 
    QSIGN   =  000005     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    001ECD R   |     RAM_SIZE=  001800     |     RBT_IDX =  00007A 
  4 READ       0033D7 R   |     READ_IDX=  000078     |   4 REBOOT     0033CC R
    RECLEN  =  000005     |     REC_LEN =  000003     |     REC_XTRA=  000005 
  4 REG_A      0004DA R   |   4 REG_CC     0004DE R   |   4 REG_PC     0004CE R
  4 REG_SP     0004E3 R   |   4 REG_X      0004D6 R   |   4 REG_Y      0004D2 R
    RELOP   =  000001     |   4 REM        0033C4 R   |     REM_IDX =  00007C 
  4 RESTORE    0033B8 R   |     REST_IDX=  00007E     |     RETL1   =  000001 
  4 RETURN     0033AD R   |     RET_ADDR=  000001     |     RET_BPTR=  000003 
    RET_IDX =  000080     |     RET_INW =  000005     |   4 RND        0033A5 R
    RND_IDX =  000082     |     RONLY   =  000005     |     ROP     =  004800 
    RS      =  00001E     |   4 RSHIFT     00339A R   |     RSHIFT_I=  000084 
    RSIGN   =  000006     |     RST_SR  =  0050B3     |   4 RUN        003392 R
    RUN_IDX =  000086     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
    R_A     =  000001     |     R_CC    =  000009     |     R_PC    =  00000A 
    R_X     =  000002     |     R_Y     =  000004     |   4 SAVE       003389 R
    SAVE_IDX=  000032     |     SAV_ACC1=  000006     |     SAV_ACC2=  000008 
    SAV_COUN=  00000A     |     SAV_IN  =  000009     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002999 R
  4 SIZE       003380 R   |     SIZE_IDX=  0000B0     |     SKIP    =  000005 
  4 SLEEP      003376 R   |     SLEEP_ID=  00008A     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      00336C R
    SPIEN_ID=  00008E     |   4 SPIRD      003362 R   |     SPIRD_ID=  00008C 
  4 SPISEL     003357 R   |     SPISEL_I=  000090     |   4 SPIWR      00334D R
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
  4 STATES     000491 R   |   4 STEP       003344 R   |     STEP_IDX=  000094 
  4 STOP       00333B R   |     STOP_IDX=  000096     |     STR     =  000003 
  4 STR_BYTE   001EB5 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
  4 SysCall    000012 R   |     T       =  000001     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      003331 R   |     TICKS_ID=  000098     |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  005259     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    003325 R   |   4 TIMER      00331B R   |     TIMER_ID=  00009A 
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
    TMROUT_I=  00009C     |   4 TO         003314 R   |   4 TONE       00330B R
    TONE_IDX=  0000A0     |     TOWRITE =  000005     |     TO_IDX  =  00009E 
  4 Timer4Up   000013 R   |     U8      =  000001     |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     003300 R
    UBOUND_I=  0000A2     |   4 UBTN_Han   00005A R   |   4 UFLASH     0032F5 R
    UFLASH_I=  0000A4     |   4 UNTIL      0032EB R   |     UNTIL_ID=  0000A6 
    US      =  00001F     |   4 USER_ABO   000062 R   |   4 USR        0032E3 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000A8     |   4 Uart1RxH   00087C R   |   4 UserButt   000036 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VAR_NAME=  000001 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       0032DA R
    WAIT_IDX=  0000AA     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
    WLKPTR  =  000001     |   4 WORDS      0032D0 R   |     WORDS_ID=  0000AC 
  4 WRITE      0032C6 R   |     WRITE_ID=  0000AE     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        0032BE R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  000014     |     XTEMP   =  000001     |     YSAVE   =  000007 
    YTEMP   =  000005     |   4 abs        002BE1 R   |   4 abs24      0001F3 R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BC7 R   |   4 add24      00017E R
  4 add_char   00133E R   |   4 add_spac   001136 R   |   4 analog_r   002699 R
  4 and_cond   001BCC R   |   4 and_fact   001B9C R   |   4 app        003884 R
  4 app_sign   003880 R   |   4 app_size   003882 R   |   4 app_spac   003880 GR
  4 arduino_   002CCE R   |   4 arg_list   0019C3 R   |   5 array_si   000020 R
  4 ascii      002A8C R   |   4 at_tst     000FA8 R   |   4 atoi24     0018E5 GR
  4 atoi_exi   001954 R   |   4 awu        002B88 R   |   4 awu02      002B9B R
  4 bad_port   002B07 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       002610 R   |   4 beep_1kh   0025E3 GR  |   4 bin_exit   000E0F R
  4 bit_rese   002182 R   |   4 bit_set    002160 R   |   4 bit_test   0021C7 R
  4 bit_togg   0021A5 R   |   4 bitmask    002E85 R   |   4 bkslsh_t   000F55 R
  4 bksp       000966 R   |   2 block_bu   0016B8 GR  |   4 block_er   000765 R
  4 break_po   002785 R   |   4 bye        002B54 R   |   5 chain_le   000034 R
  4 clear_au   0008B3 R   |   4 clear_ba   0014AA R   |   4 clear_bl   00289C R
  4 clear_va   001402 R   |   4 clock_in   00007D R   |   4 cmd_auto   0031A4 R
  4 cmd_chai   003234 R   |   4 cmd_cons   001DA1 R   |   4 cmd_dim    001DB5 R
  4 cmd_dim1   001DBF R   |   4 cmd_dim2   001DC5 R   |   4 cmd_dir    0029C0 R
  4 cmd_edit   001F73 R   |   4 cmd_end    00258A R   |   4 cmd_eras   002802 R
  4 cmd_get    0025B6 R   |   4 cmd_itf    0004FE R   |   4 cmd_line   001723 R
  4 cmd_name   00135E R   |   4 cmd_on     0023FC R   |   4 cmd_run    0024FA R
  4 cmd_save   0028FE R   |   4 cmd_size   001CA5 R   |   4 cold_sta   0000B5 R
  4 colon_ts   000F7C R   |   4 comma_ts   000F87 R   |   4 comp_msg   001673 R
  4 compile    0010A2 GR  |   4 conditio   001C1E R   |   4 const_cr   002F28 R
  4 const_cr   002F2D R   |   4 const_dd   002F23 R   |   4 const_ee   002F3C R
  4 const_id   002F1E R   |   4 const_in   002F37 R   |   4 const_od   002F19 R
  4 const_ou   002F32 R   |   4 const_po   002EF1 R   |   4 const_po   002EF6 R
  4 const_po   002EFB R   |   4 const_po   002F00 R   |   4 const_po   002F05 R
  4 const_po   002F0A R   |   4 const_po   002F0F R   |   4 const_po   002F14 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Symbol Table

  4 convert_   000D7B R   |   4 convert_   00092A R   |   4 copy_com   000FDD R
  5 count      000002 GR  |   4 cp24       0001B8 R   |   4 cp24_ax    0001EA R
  4 cp_loop    001974 R   |   4 cpl24      0001FA R   |   4 cpy_cmd_   00111E R
  4 cpy_quot   00115E R   |   4 cs_high    0030BE R   |   4 dash_tst   000F9D R
  4 data       002F41 R   |   4 data_err   002FBA R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001C97 R
  4 decomp_l   0011F6 R   |   4 decompil   0011AE GR  |   4 del_line   000C70 R
  4 delete_l   000A53 R   |   4 delete_n   000976 R   |   4 delete_u   000A18 R
  4 digital_   0026D5 R   |   4 digital_   00270C R   |   4 div24      000307 R
  4 divu24_8   0002E9 R   |   4 do_loop    002EAB R   |   4 do_progr   000758 R
  4 dup24      00016F R   |   5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR
  4 enable_i   002E15 R   |   4 end_at_l   001F2D R   |   4 eql_tst    001028 R
  4 equal      001351 R   |   4 eras0      00280C R   |   4 erase_ex   000789 R
  4 erase_fl   00077F R   |   4 erase_he   0028E4 R   |   4 erase_pr   0027AD R
  4 err_bad_   00159C R   |   4 err_buf_   001612 R   |   4 err_cmd_   001560 R
  4 err_div0   001525 R   |   4 err_dupl   00157A R   |   4 err_math   00150C R
  4 err_mem_   0014F1 R   |   4 err_msg    0014CB R   |   4 err_no_a   0015A8 R
  4 err_no_d   0015DB R   |   4 err_no_f   0015FF R   |   4 err_no_l   001534 R
  4 err_no_p   0015EB R   |   4 err_not_   00158B R   |   4 err_not_   001645 R
  4 err_over   00161F R   |   4 err_read   001629 R   |   4 err_run_   00154A R
  4 err_synt   0014FE R   |   4 escaped    000D90 GR  |   4 expect     0019B1 R
  4 expressi   001B05 R   |   4 factor     001A0D R   |   5 farptr     000018 R
  4 fcpu       002C50 R   |   4 fetchc     000605 R   |   4 fill_wri   00288C R
  4 final_te   000BC0 R   |   5 flags      000022 GR  |   4 for        00225D R
  4 free       001C9C R   |   5 free_eep   000024 R   |   7 free_ram   000090 R
  4 func_arg   0019BE R   |   4 func_cha   002A75 R   |   4 func_eef   001D31 R
  4 ge         001353 R   |   4 get_addr   001823 R   |   4 get_arra   0019DF R
  4 get_char   00183D R   |   4 get_esca   000936 R   |   4 get_int2   00182D R
  4 get_targ   00238A R   |   4 get_targ   002398 R   |   4 get_tick   002BDA R
  4 get_toke   000EEE GR  |   4 get_valu   001D20 R   |   4 getc       00090F GR
  4 gosub      0024A8 R   |   4 gosub_1    0024B3 R   |   4 gosub_2    0024B9 R
  4 goto       00248E R   |   4 goto_1     002498 R   |   4 gpio       002ADC R
  4 gt         00134F R   |   4 gt_tst     001033 R   |   4 hex_base   001C92 R
  4 hex_dump   000645 R   |   4 if         002240 R   |   5 in         000001 GR
  5 in.saved   000003 GR  |   5 in.w       000000 GR  |   4 incr_far   000860 R
  4 input_ex   002118 R   |   4 input_lo   002082 R   |   4 input_va   00207E R
  4 insert_c   0009D5 R   |   4 insert_l   000CDC R   |   4 interp_l   001767 R
  4 interpre   00173F R   |   4 invalid    00056D R   |   4 invalid_   0005DB R
  4 is_alnum   000E42 GR  |   4 is_alpha   000E28 GR  |   4 is_data_   002F47 R
  4 is_digit   000E39 GR  |   4 is_erase   00299D R   |   4 is_minus   001F02 R
  4 is_progr   0024E9 R   |   4 is_symbo   000E4B R   |   4 itoa       001880 GR
  4 itoa_loo   0018A2 R   |   4 jp_to_ta   00249B R   |   4 key        002ACB R
  4 kword_di   003692 GR  |   4 kword_en   0032BC R   |   4 le         001358 R
  4 ledoff     0003CD R   |   4 ledon      0003C8 R   |   4 ledtoggl   0003D2 R
  4 left_par   0003DB R   |   4 let        001CDD GR  |   4 let_arra   001CEB R
  4 let_dvar   0017A0 R   |   4 let_eval   001CF3 R   |   4 let_var    001CF0 R
  4 lines_sk   001F12 R   |   4 list       001EDC R   |   4 list_exi   001F62 R
  4 list_loo   001F40 R   |   4 log2       002E58 R   |   4 look_tar   0023BB R
  4 loop_bac   00236D R   |   5 loop_dep   00001F R   |   4 loop_don   002382 R
  4 lshift     002BF8 R   |   4 lt         001356 R   |   4 lt_tst     00105C R
  4 mem_peek   000589 R   |   4 mod24      0003A1 R   |   4 move       0013BE GR
  4 move_dow   0013DD R   |   4 move_era   0006E7 R   |   4 move_exi   0013FE R
  4 move_lef   0009AD R   |   4 move_loo   0013E2 R   |   4 move_prg   000727 R
  4 move_rig   0009BB R   |   4 move_up    0013CF R   |   4 mul24      000279 R
  4 mul_char   001340 R   |   4 mulu24_8   00023A R   |   4 nbr_tst    000F21 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 251.
Hexadecimal [24-Bits]

Symbol Table

  4 ne         00135B R   |   4 neg24      000203 R   |   4 neg_acc2   00021D R
  4 neg_ax     000215 R   |   4 new        0027A3 R   |   4 next       002315 R
  4 next_lin   001747 R   |   4 next_tok   0017FB GR  |   4 no_match   001986 R
  4 number     00060B R   |   4 open_gap   000CA5 R   |   4 other      001085 R
  4 overwrit   000BEC R   |   2 pad        0016B8 GR  |   4 pad_ref    0030C3 R
  4 parse_ad   0004E8 R   |   4 parse_bi   000DED R   |   4 parse_in   000D98 R
  4 parse_ke   000E6E R   |   4 parse_qu   000D43 R   |   4 parse_sy   000E56 R
  4 pause      002B68 R   |   4 pause02    002B7B R   |   4 peek       00221F R
  4 peek_byt   0005A5 R   |   4 pin_mode   002C5F R   |   4 plus_tst   000FFC R
  4 poke       0021FE R   |   4 power_ad   002649 R   |   4 prcnt_ts   00101D R
  4 print      001FD5 R   |   4 print_fa   0005EA R   |   4 print_he   000C23 GR
  4 print_re   000427 R   |   4 print_st   00057D R   |   4 print_to   001868 R
  4 prog_siz   001E4B R   |   4 program_   001E53 R   |   4 program_   000701 R
  4 program_   000727 R   |   4 prt_acc2   00185A R   |   4 prt_basi   001FB1 R
  4 prt_i16    001843 R   |   4 prt_loop   001FD9 R   |   4 prt_peek   0003AA GR
  4 prt_reg1   000408 R   |   4 prt_reg8   0003E6 R   |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       0008FF GR  |   4 puts       00095C GR
  4 qgetc      000908 GR  |   4 qkey       002ACF GR  |   4 qmark_ts   000FB3 R
  4 qsign      002881 R   |   4 random     002CEE R   |   4 read       002FBF R
  4 read01     002FC4 R   |   4 read_int   003809 R   |   4 readln     000A61 GR
  4 readln_l   000A70 R   |   4 readln_q   000C09 R   |   4 refresh_   002E53 R
  4 relation   001B3D R   |   4 relop_st   001343 R   |   4 remark     00211D GR
  4 repl       000527 R   |   4 repl_exi   00054F R   |   4 reset_co   001FD7 R
  4 rest_con   00206E R   |   4 restore    002F55 R   |   4 return     0024CC R
  4 right_al   00114C GR  |   4 row_alig   000845 R   |   4 row_eras   0006BA R
  4 row_eras   0006E7 R   |   4 row_loop   000628 R   |   4 rparnt_t   000F71 R
  4 rshift     002C24 R   |   7 rsign      00008C R   |   7 rsize      00008E R
  4 rt_msg     001661 R   |   4 run_app    00012A R   |   4 run_it     002557 R
  4 run_it_0   002559 R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_con   00205E R   |   4 scan_blo   00086E R
  4 search_d   001966 GR  |   4 search_e   0019AE R   |   4 search_f   0028B0 R
  4 search_l   000C45 GR  |   4 search_l   000C54 R   |   4 search_n   001D5A R
  4 search_n   00196A R   |   4 search_p   0031FA R   |   5 seedx      000014 R
  5 seedy      000016 R   |   4 select_p   002CBE R   |   4 send_esc   000984 R
  4 send_par   00098F R   |   4 set_data   002F8B R   |   4 set_time   002DF3 R
  4 sharp_ts   000F92 R   |   4 show_row   000616 R   |   4 single_c   001339 R
  4 skip       000EDB R   |   4 skip_str   001814 R   |   4 skip_to_   0029A8 R
  4 slash_ts   001012 R   |   4 sleep      002B5D R   |   4 software   001411 R
  4 spaces     0009C9 GR  |   4 spi_clea   003058 R   |   4 spi_disa   003040 R
  4 spi_enab   00300D R   |   4 spi_rcv_   00307A R   |   4 spi_read   0030A5 R
  4 spi_sele   0030AC R   |   4 spi_send   003064 R   |   4 spi_writ   003085 R
  2 stack_fu   001774 GR  |   2 stack_un   001800 R   |   4 star_tst   001007 R
  4 start_fr   001F0D R   |   4 step       0022D3 R   |   4 stop       002757 R
  4 store_lo   002302 R   |   4 str_matc   001993 R   |   4 str_tst    000F11 R
  4 strcmp     00139D R   |   4 strcpy     0013AE GR  |   4 strlen     001392 GR
  4 sub24      00019B R   |   4 symb_loo   000E57 R   |   4 syntax_e   001694 GR
  4 system_i   001457 R   |   5 tab_widt   000023 GR  |   4 tb_error   001696 GR
  4 term       001AC2 R   |   4 term01     001ACA R   |   4 term_exi   001B02 R
  4 test       00369A R   |   4 test_p     000575 R   |   2 tib        001668 GR
  4 tick_tst   000FCB R   |   5 ticks      00000F R   |   4 timeout    002E0A R
  5 timer      000012 GR  |   4 timer2_i   000093 R   |   4 timer4_i   0000A0 R
  4 tk_id      001684 R   |   4 to         00228D R   |   4 to_eepro   000750 R
  4 to_flash   000755 R   |   4 to_hex_c   000C3A GR  |   4 to_upper   0018D9 GR
  4 token_ch   00109B R   |   4 token_ex   00109F R   |   4 tone       0025EE R
  4 try_next   002F98 R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 252.
Hexadecimal [24-Bits]

Symbol Table

  4 uart1_ge   00090F GR  |   4 uart1_in   0008BA R   |   4 uart1_pu   0008FF GR
  4 uart1_qg   000908 GR  |   4 uart1_se   0008CA R   |   4 ubound     001CD2 R
  4 uflash     002B0C R   |   4 unlock_e   000684 R   |   4 unlock_f   00069F R
  4 until      002EBE R   |   4 user_int   000049 R   |   4 usr        002B2E R
  4 var_name   0011A4 GR  |   5 vars       000035 GR  |   4 wait       002123 R
  4 warm_ini   001488 R   |   4 warm_sta   001720 R   |   4 words      002D89 R
  4 words_co   002DDD R   |   4 write      002A0C R   |   4 write_bl   00080A GR
  4 write_bu   000741 R   |   4 write_by   00078B R   |   4 write_ee   0007C7 R
  4 write_ex   000800 R   |   4 write_fl   0007B1 R   |   4 write_nb   00082F R
  4 xalloc     0030D6 R   |   4 xdrop      00310C R   |   4 xpick      00318A R
  4 xpop       0030CC R   |   4 xpush      0030C8 R   |   4 xput       003157 R
  4 xstack_b   003139 R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

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

