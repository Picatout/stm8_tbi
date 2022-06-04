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
                                    169     ; extract code address for 
                                    170     ; TK_CMD|TK_FUNC|TK_IFUNC|TK_CFUNC 
                                    171     .macro _get_code_addr
                                    172         ldw x,(x)
                                    173         inc in 
                                    174         inc in 
                                    175     .endm 
                                    176 
                                    177 
                                    178 
                                    179 ;---------------------------------------
                                    180 ;    xtack manipulation macros 
                                    181 ;    Y is used as xstack pointer  
                                    182 ;----------------------------------------
                                    183     ; pop in A:X from XSTACK 
                                    184     .macro _xpop 
                                    185     ld a,(y)
                                    186     ldw x,y 
                                    187     ldw x,(1,x)
                                    188     addw y,#CELL_SIZE 
                                    189     .endm 
                                    190 
                                    191     ; push A:X  to XSTACK 
                                    192     .macro _xpush 
                                    193     subw y,#CELL_SIZE
                                    194     ld (y),a 
                                    195     ldw (1,y),x 
                                    196     .endm 
                                    197 
                                    198     ; drop from XSTACK 
                                    199     .macro _xdrop 
                                    200     addw y,#CELL_SIZE 
                                    201     .endm 
                                    202 
                                    203     ; @T fetch top xstack 
                                    204     .macro _at_top
                                    205     ld a,(y)
                                    206     ldw x,y 
                                    207     ldw x,(1,x)
                                    208     .endm 
                                    209 
                                    210     ; @N  fetch next on xstack 
                                    211     .macro _at_next 
                                    212     ld a,(3,y)
                                    213     ldw x,y 
                                    214     ldw x,(4,x)
                                    215     .endm 
                                    216 
                                    217     ; !T put on top of xtack 
                                    218     .macro _store_top 
                                    219     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                    220     ldw (1,y),x     
                                    221     .endm 
                                    222 
                                    223     ; !N put next on xstack 
                                    224     .macro _store_next 
                                    225     ld (3,y),a 
                                    226     ldw (4,y),x 
                                    227     .endm 
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
      0080ED CC 97 54         [ 2]  179 5$:	jp warm_start
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
      00819E CD 9D D7         [ 4]  280 	call func_eefree 
      0081A1 CD 9D 0E         [ 4]  281 	call ubound 
      0081A4 CD 95 1E         [ 4]  282 	call clear_basic
      0081A7 CD A6 DC         [ 4]  283 	call beep_1khz  
      0081AA CD 94 CB         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A9 17         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 54         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 94 FC         [ 4]  293 	call warm_init
      0081BC AE B7 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B7 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 89 E8         [ 4]  299 	call puts 
      0081CF CD 9F 99         [ 4]  300 	call program_info 
      0081D2 CC A6 77         [ 2]  301 	jp run_it_02  
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
      0082EB 96 CA FE         [ 4]  240     call neg24
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
      008363 CA 05            [ 1]  346     jrne 1$ 
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
      0083A7 CA 01            [ 1]  385     sbc a,(DIVISOR,sp)
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
      008412 CD 17 EE         [ 4]   84 	call prt_i16  
      008412 0D 06            [ 1]   85 	ld a,#': 
      008414 27 03 CD         [ 4]   86 	call putc 
      008417 82 90            [ 1]   87 	ld a,#SPACE 
      008419 5B 06 81         [ 4]   88 	call putc 
      00841C 85               [ 2]   89 	popw x 
      00841C CD               [ 1]   90 	ld a,(x)
      00841D 83               [ 1]   91 	clrw x 
      00841E 82               [ 1]   92 	ld xl,a 
      00841F 90 F7 90 EF      [ 1]   93 	mov base,#10 
      008423 01 81 EE         [ 4]   94 	call prt_i16 
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
      008494 CD 98 6E         [ 1]  186 	ld acc16,a 
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
      0084AA 98 6E 81         [ 2]  197 	ldw x,#REG_Y
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
      0084D7 CD 98 6E CD 84         222 REG_CC:  .asciz "\nCC:"
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
      0084E3 0B CD 98 6E      [ 1]  237 	clr farptr 
      0084E7 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      0084EB 8B 81 00 1A      [ 1]  239 	clr farptr+2  
      0084ED                        240 repl:
      0084ED 90 89            [ 1]  241 	ld a,#CR 
      0084EF CD 89 E8         [ 4]  242 	call putc 
      0084F2 1E 01            [ 1]  243 	ld a,#'? 
      0084F4 35 10 00         [ 4]  244 	call putc
      0084F7 0B CD 98 6E      [ 1]  245 	clr in.w 
      0084FB CD 84 C0 85      [ 1]  246 	clr in 
      0084FF 35 0A 00         [ 4]  247 	call readln
      008502 0B CD 98 6E      [ 2]  248 	ldw y,#tib  
      008506 A6 29            [ 1]  249 	ld a,(y)
      008508 CD 89            [ 1]  250 	jreq repl  
      00850A 8B 81 00 01      [ 1]  251 	inc in 
      00850C CD 18 84         [ 4]  252 	call to_upper 
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
      00852B 98 85            [ 1]  268     cp a,#'S 
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
      0085E8 04 A1            [ 2]  392 	ldw x,(ADR,sp)
      0085EA 51               [ 1]  393 	ld a,(x)
      0085EB 26               [ 1]  394 	clrw x 
      0085EC 17               [ 1]  395 	ld xl,a 
      0085ED CD 17 EE         [ 4]  396 	call prt_i16 
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
      00862D 10 C6            [ 1]  442 	ld a,(TABW,sp)
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
      00865E 85 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
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
      00869C 98 85 A6         [ 2]  103 	ldw x,#tib 
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
      0086B4 CC 96 C8 81      [ 1]  132 	ldf ([farptr],y),a
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
      0086C3 98 6E            [ 2]  140 	popw y 
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
      0086D0 98 6E 1E         [ 2]  155 	ldw x,#tib ; destination address 
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
      0086E7 A3 37 00         [ 2]  174 	cpw x,#app_space  
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
      0087EE B7               [ 1]  409 	incw x 
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
      008811 B7 80 24         [ 1]   87 	ld rx1_tail,a 
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
      008841 B7 80 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
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
      0089E7 81 18 90         [ 4]  595 	call atoi24
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
      008B76 99 10 CE         [ 2]  130 	addw x,(LEN,sp)
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
      008C27 DC               [ 1]  285 	incw x 
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
      008C47 CD 18 84         [ 4]  322 	call to_upper 
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
      008D1A 5B 04            [ 1]  531 	cp a,#15 
      008D1C 81 02            [ 2]  532 	jrule 22$ 
      008D1D A6 0F            [ 1]  533 	ld a,#15
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
      008E26 CD 99 04 6B      [ 2]  710 	addw y,#2
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
      008E49 10 16 03         [ 4]  724 	call strcpy
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
      008ECD 04 F7 5C         [ 4]  790 	call is_alpha 
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
      008EFB AE B5 58         [ 2]  834 	ldw x,#pad+3
      008EFE 16 01 90 5C      [ 1]  835 	clr in 
      008F02 CD 99 91         [ 4]  836 	call get_token
      008F05 4D 26            [ 1]  837 	cp a,#TK_INTGR
      008F07 29 16            [ 1]  838 	jrne 2$
      008F09 01 A6 03         [ 2]  839 	cpw x,#1 
      008F0C 90 F7            [ 1]  840 	jrpl 1$
      008F0E 90 5C            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F10 93 CD 94         [ 2]  842 	jp tb_error
      008F13 06 A1 0F         [ 2]  843 1$:	ldw pad,x 
      008F16 23 02 A6 0F      [ 2]  844 	ldw y,#pad+3 
      008F1A 90 A3 17 9C      [ 2]  845 2$:	cpw y,#stack_full 
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
      008F3D A3 9D 19         [ 2]  866 	ldw x,ptr16  
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
      008F81 99 04            [ 1]  103 	jrpl 1$
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
      008F93 91 13 BF         [ 4]  128 	call skip_string 
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
      009011 CD 17 A6         [ 4]  226 	call next_token 
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
      009032 93 AE A1         [ 1]  248 	ld acc24,a 
      009035 2F 90 FF         [ 2]  249 	ldw acc16,x 
      009038 72 A9 00         [ 4]  250 	call add_space
      00903B 02 CC            [ 2]  251 	pushw y 
      00903D 91 13            [ 1]  252 	ld a,#255 ; signed conversion 
      00903F CD 18 2B         [ 4]  253 	call itoa  
      00903F A6 27            [ 2]  254 	ldw y,(1,sp) 
      009041 11               [ 1]  255 	push a 
      009042 01               [ 1]  256 	exgw x,y 
      009043 26 2B A6         [ 4]  257 	call strcpy 
      009046 80 F7            [ 1]  258 	clrw y
      009048 5C               [ 1]  259 	pop a  
      009049 90 AE            [ 1]  260 	ld yl,a 
      00904B A2 77 FF         [ 2]  261 	addw y,(1,sp)
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
      00909C CD 17 BF         [ 4]  314 	call skip_string 
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
      009101 96 C8            [ 2]  380 	jra 81$
      009103                        381 12$:
      009103 CD 8E            [ 1]  382 	sub a,#TK_GT  
      009105 E2               [ 1]  383 	sll a 
      009106 A3               [ 1]  384 	clrw x 
      009107 A2               [ 1]  385 	ld xl,a 
      009108 77 26 08         [ 2]  386 	addw x,#relop_str 
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
      009145 CA CF 16               415 le: .asciz "<="
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
      00914D 90 A3 17 9C      [ 1]  431 	clr acc16 
      009151 25 05            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009153 A6 0F CC         [ 2]  433 	ldw x,#kword_dict	
      009156 96 CA            [ 2]  434 1$:	ldw (LINK,sp),x
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
      0091DB 3F               [ 1]  223 	pop a 
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
      009244 CD 98 AB         [ 2]  298 	ldw txtbgn,x 
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
             00 01 88
      00926A 15 94 15 C7 15 D7 15   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



             EB 15 FE
      00926A 90 89                  313 	.word err_overflow 
                                    314 
      00926C CD 98 26 90 85 4D 26   315 err_mem_full: .asciz "Memory full\n" 
             03 CC 93 97 2B 03
      009279 CC 93 08 74 61 78 20   316 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      00927C 6D 61 74 68 20 6F 70   317 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00927C A1 85 26 0F CD 91 AA   318 err_div0: .asciz "division by 0\n" 
             CD 98 4E CD 92 18 90
             F7
      00928B 90 5C 20 DB 6C 69 64   319 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00928F 72 75 6E 20 74 69 6D   320 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00928F A1 84 26 26 CD 98 58   321 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 AA 90 89 A6 FF CD
             98 AB 16 01 88
      0092A9 51 CD 94 22 90 5F 84   322 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      0092B9 46 69 6C 65 20 6E 6F   323 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0092B9 A1 87 24 39 FE 72 5C   324 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      0092C5 02 A3 A2 77 26 23 CE   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
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
      0092EB CC 93 97 A3 9D 19 26   328 err_no_fspace: .asciz "File system full.\n" 
             05 CC 92 6A 20 66 75
             6C 6C 2E 0A 00
      0092F6 42 75 66 66 65 72 20   329 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      0092F6 5F 97 65 72 66 6C 6F   330 err_overflow: .asciz "overflow\n" 
             77 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                    331 
      0092F8 0A 72 75 6E 20 74 69   332 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      0092F8 CD 91 AA 90 89 CD 93   333 comp_msg: .asciz "\ncompile error, "
             D2 90 85 CD 91 92 CC
             92 6A 00
      009308 6C 61 73 74 20 74 6F   334 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    335 
      001648                        336 syntax_error::
      009308 A1 03            [ 1]  337 	ld a,#ERR_SYNTAX 
                                    338 
      00164A                        339 tb_error::
      00930A 26 1E A6 20 90   [ 2]  340 	btjt flags,#FCOMP,1$
      00930F F7               [ 1]  341 	push a 
      009310 90 5C 15         [ 2]  342 	ldw x, #rt_msg 
      009312 CD 09 68         [ 4]  343 	call puts 
      009312 89               [ 1]  344 	pop a 
      009313 CD 98 3F         [ 2]  345 	ldw x, #err_msg 
      009316 85 5F 00 0D      [ 1]  346 	clr acc16 
      009317 48               [ 1]  347 	sll a
      009317 F6 27 07 5C      [ 1]  348 	rlc acc16  
      00931B 90 F7 90         [ 1]  349 	ld acc8, a 
      00931E 5C 20 F6 0D      [ 2]  350 	addw x,acc16 
      009321 FE               [ 2]  351 	ldw x,(x)
      009321 A6 20 90         [ 4]  352 	call puts
      009324 F7 90 5C         [ 2]  353 	ldw x,basicptr 
                           000001   354 .if DEBUG 
      009327 CC 92 6A         [ 1]  355 ld a,count 
      00932A 90 5F            [ 1]  356 clrw y 
      00932A A1 02            [ 1]  357 rlwa y  
      00932C 26 09 CD         [ 4]  358 call hex_dump
      00932F 91 AA CD         [ 2]  359 ldw x,basicptr
                                    360 .endif 
      009332 91 D2 CC         [ 1]  361 	ld a,in 
      009335 92 6A 8B         [ 4]  362 	call prt_basic_line
      009337 AE 16 38         [ 2]  363 	ldw x,#tk_id 
      009337 A1 04 26         [ 4]  364 	call puts 
      00933A 10 CD 91         [ 1]  365 	ld a,in.saved 
      00933D AA               [ 1]  366 	clrw x 
      00933E A6               [ 1]  367 	ld xl,a 
      00933F 5C 90 F7 90      [ 2]  368 	addw x,basicptr 
      009343 5C               [ 1]  369 	ld a,(x)
      009344 F6               [ 1]  370 	clrw x 
      009345 72               [ 1]  371 	ld xl,a 
      009346 5C 00 02         [ 4]  372 	call prt_i16
      009349 20 06            [ 2]  373 	jra 6$
      00169B                        374 1$:	
      00934B A1               [ 1]  375 	push a 
      00934C 0A 26 09         [ 2]  376 	ldw x,#comp_msg
      00934F A6 3A 68         [ 4]  377 	call puts 
      009351 84               [ 1]  378 	pop a 
      009351 90 F7 90         [ 2]  379 	ldw x, #err_msg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009354 5C 5F 00 0D      [ 1]  380 	clr acc16 
      009355 48               [ 1]  381 	sll a
      009355 CC 92 6A 0D      [ 1]  382 	rlc acc16  
      009358 C7 00 0E         [ 1]  383 	ld acc8, a 
      009358 A1 09 22 0A      [ 2]  384 	addw x,acc16 
      00935C A0               [ 2]  385 	ldw x,(x)
      00935D 05 5F 97         [ 4]  386 	call puts
      009360 1C 93 AD         [ 2]  387 	ldw x,#tib
      009363 F6 20 EB         [ 4]  388 	call puts 
      009366 A6 0D            [ 1]  389 	ld a,#CR 
      009366 A1 11 22         [ 4]  390 	call putc
      009369 0A A0 10         [ 2]  391 	ldw x,in.w
      00936C 5F 97 1C         [ 4]  392 	call spaces
      00936F 93 B2            [ 1]  393 	ld a,#'^
      009371 F6 20 DD         [ 4]  394 	call putc 
      009374 AE 17 FF         [ 2]  395 6$: ldw x,#STACK_EMPTY 
      009374 A1               [ 1]  396     ldw sp,x
                                    397 
      0016D4                        398 warm_start:
      009375 22 22 0A         [ 4]  399 	call warm_init
                                    400 ;----------------------------
                                    401 ;   BASIC interpreter
                                    402 ;----------------------------
      0016D7                        403 cmd_line: ; user interface 
      009378 A0 20            [ 1]  404 	ld a,#CR 
      00937A 5F 97 1C         [ 4]  405 	call putc 
      00937D 93 B4            [ 1]  406 	ld a,#'> 
      00937F F6 20 CF         [ 4]  407 	call putc
      009382 CD 0A 6D         [ 4]  408 	call readln
      009382 A0 31 48 5F      [ 1]  409 	tnz count 
      009386 97 1C            [ 1]  410 	jreq cmd_line
      009388 93 B7 FE         [ 4]  411 	call compile
                                    412 ;;;;;;;;;;;;;;;;;;;;;;	
                                    413 ;pushw y 
                                    414 ;ldw x,txtbgn  
                                    415 ;ldw y,txtend
                                    416 ;ldw acc16,x   
                                    417 ;subw y,acc16 
                                    418 ;call hex_dump
                                    419 ;popw y 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;
                                    421 
                                    422 ; if text begin with a line number
                                    423 ; the compiler set count to zero    
                                    424 ; so code is not interpreted
      00938B F6 5C 90 F7      [ 1]  425 	tnz count 
      00938F 90 5C            [ 1]  426 	jreq cmd_line
                                    427 	
                                    428 ; if direct command 
                                    429 ; it's ready to interpret 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    431 ;; This is the interpreter loop
                                    432 ;; for each BASIC code line. 
                                    433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016F3                        434 interpreter: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009391 F6 26 BD         [ 1]  435 	ld a,in 
      009394 CC 92 6A         [ 1]  436 	cp a,count 
      009397 2B 1D            [ 1]  437 	jrmi interp_loop
      0016FB                        438 next_line:
      009397 90 7F 1E 03 7B   [ 2]  439 	btjf flags, #FRUN, cmd_line
      00939C 01 C7 00         [ 2]  440 	ldw x,basicptr
      00939F 0B 7B 02 C7      [ 2]  441 	addw x,in.w 
      0093A3 00 24 72         [ 2]  442 	cpw x,txtend 
      0093A6 F2 03            [ 1]  443 	jrpl warm_start
      0093A8 90 9F 5B         [ 2]  444 	ldw basicptr,x ; start of next line  
      0093AB 04 81            [ 1]  445 	ld a,(2,x)
      0093AD 40 28 29         [ 1]  446 	ld count,a 
      0093B0 2C 23 2B 2D      [ 1]  447 	mov in,#3 ; skip first 3 bytes of line 
      001718                        448 interp_loop:
      0093B4 2A 2F 25         [ 4]  449 	call next_token
      0093B7 93 C3            [ 1]  450 	cp a,#TK_NONE 
      0093B9 93 C5            [ 1]  451 	jreq next_line 
      0093BB 93 C7            [ 1]  452 	cp a,#TK_CMD
      0093BD 93 CA            [ 1]  453 	jrne 1$
      001723                        454 	_get_code_addr
      0093BF 93               [ 2]    1         ldw x,(x)
      0093C0 CF 93 CC 3E      [ 1]    2         inc in 
      0093C4 00 3D 00 3E      [ 1]    3         inc in 
      0093C8 3D               [ 4]  455 	call(x)
      0093C9 00 3C            [ 2]  456 	jra interp_loop 
      00172F                        457 1$:	 
      0093CB 00 3C            [ 1]  458 	cp a,#TK_VAR
      0093CD 3D 00            [ 1]  459 	jrne 2$
      0093CF 3C 3E 00         [ 4]  460 	call let_var  
      0093D2 20 E0            [ 2]  461 	jra interp_loop 
      001738                        462 2$:	
      0093D2 52 04            [ 1]  463 	cp a,#TK_ARRAY 
      0093D4 72 5F            [ 1]  464 	jrne 3$
      0093D6 00 0E 1F         [ 4]  465 	call let_array 
      0093D9 01 AE            [ 2]  466 	jra interp_loop
      001741                        467 3$:	
      0093DB B5 56            [ 1]  468 	cp a,#TK_LABEL
      0093DD 1F 03            [ 1]  469 	jrne 4$
      0093DF E6 02 A4         [ 4]  470 	call let_dvar  
      0093E2 0F C7            [ 2]  471 	jra interp_loop 
      00174A                        472 4$: 
      0093E4 00 0F            [ 1]  473 	cp a,#TK_COLON 
      0093E6 1C 00            [ 1]  474 	jreq interp_loop
      0093E8 03 72 BB         [ 2]  475 5$:	jp syntax_error 
                                    476 
                                    477 
                                    478 ;----------------------
                                    479 ; when a label is met 
                                    480 ; at interp_loop
                                    481 ; it may be a variable 
                                    482 ; assignement to DIM 
                                    483 ; variable 
                                    484 ;----------------------
      001751                        485 let_dvar:
      0093EB 00               [ 2]  486 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0093EC 0E FE 13         [ 4]  487 	call skip_string 
      0093EF 01 27 0C         [ 2]  488 	ldw x,basicptr 
      0093F2 1E 03 FE 1D      [ 2]  489 	addw x,in.w 
      0093F6 00               [ 1]  490 	ld a,(x)
      0093F7 02 26            [ 1]  491 	cp a,#TK_EQUAL 
      0093F9 E3 4F            [ 1]  492 	jrne 9$ 
                                    493 ; dvar assignment 
      0093FB 5F 20 05 1E      [ 1]  494 	inc in  
      0093FF 03 1C 00         [ 4]  495 	call condition  
      009402 02 5B            [ 1]  496 	cp a,#TK_INTGR 
      009404 04 81            [ 1]  497 	jreq 1$ 
      000001 CC 16 48         [ 2]  498 0$:	jp syntax_error 
      000002 90 89            [ 2]  499 1$: pushw y 
      000003 90 CE 00 30      [ 2]  500 	ldw y,dvar_bgn 
      000004 1E 03            [ 2]  501 	ldw x,(3,sp) ; pointer to var name 
      000005 CD 1D 80         [ 4]  502 	call search_name 
      000007 5D               [ 2]  503 	tnzw x 
      000009 27 EF            [ 1]  504 	jreq 0$ 
      00000A F6               [ 1]  505 	ld a,(x)
      00000B 88               [ 1]  506 	push a 
      00000C 4B 00            [ 1]  507 	push #0 
      00000D 72 FB 01         [ 2]  508 	addw x,(1,sp)
      00000E 1D 00 03         [ 2]  509 	subw x,#CELL_SIZE 
      00000F CF 00 19         [ 2]  510 	ldw ptr16,x
      000010                        511 	_drop 2 
      000013 5B 02            [ 2]    1     addw sp,#2 
      000015 90 85            [ 2]  512 	popw y  
      000017                        513 	_xpop 
      000019 90 F6            [ 1]    1     ld a,(y)
      00001A 93               [ 1]    2     ldw x,y 
      00001B EE 01            [ 2]    3     ldw x,(1,x)
      00001C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00001E 72 C7 00 19      [ 4]  514 	ld [ptr16],a 
      000020 72 5C 00 1A      [ 1]  515 	inc ptr8 
      000021 72 CF 00 19      [ 5]  516 	ldw [ptr16],x 
      000023                        517 9$: _drop 2 	
      000024 5B 02            [ 2]    1     addw sp,#2 
      000025 81               [ 4]  518 	ret 
                                    519 
                                    520 
                                    521 ;--------------------------
                                    522 ; extract next token from
                                    523 ; token list 
                                    524 ; basicptr -> base address 
                                    525 ; in  -> offset in list array 
                                    526 ; output:
                                    527 ;   A 		token attribute
                                    528 ;   X 		*token_value 
                                    529 ;----------------------------------------
      000027                        530 next_token::
                                    531 ;	clrw x 
      00002F C6 00 01         [ 1]  532 	ld a,in 
      000030 C7 00 02         [ 1]  533 	ld in.saved,a ; in case "_unget_token" needed 
                                    534 ; don't replace sub by "cp a,count" 
                                    535 ; if end of line must return with A=0   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      000031 C0 00 03         [ 1]  536 	sub a,count 
      000033 27 0D            [ 1]  537 	jreq 9$ ; end of line 
      000035                        538 0$: 
      00008C CE 00 04         [ 2]  539 	ldw x,basicptr 
      00008C 72 BB 00 00      [ 2]  540 	addw x,in.w 
      00008E F6               [ 1]  541 	ld a,(x)
      000090 5C               [ 1]  542 	incw x
      009406 72 5C 00 01      [ 1]  543 	inc in   
      009406 89               [ 4]  544 9$: ret 
                                    545 
                                    546 ;-------------------------
                                    547 ;  skip .asciz in BASIC line 
                                    548 ;  name 
                                    549 ;  input:
                                    550 ;     x		* string 
                                    551 ;  output:
                                    552 ;     none 
                                    553 ;-------------------------
      0017BF                        554 skip_string:
      009407 4F               [ 1]  555 	ld a,(x)
      009408 7D 27            [ 1]  556 	jreq 1$
      00940A 04               [ 1]  557 	incw x 
      00940B 4C 5C            [ 2]  558 	jra skip_string 
      00940D 20               [ 1]  559 1$: incw x 	
      00940E F9 85 81 04      [ 2]  560 	subw x,basicptr 
      009411 CF 00 00         [ 2]  561 	ldw in.w,x 
      009411 F6               [ 4]  562 	ret 
                                    563 
                                    564 ;---------------------
                                    565 ; extract 16 bits  
                                    566 ; address from BASIC
                                    567 ; code 
                                    568 ; input:
                                    569 ;    X    *address
                                    570 ; output:
                                    571 ;    X    address 
                                    572 ;-------------------- 
      0017CE                        573 get_addr:
      009412 27               [ 2]  574 	ldw x,(x)
      009413 0B 90 F1 26      [ 1]  575 	inc in 
      009417 05 5C 90 5C      [ 1]  576 	inc in 
      00941B 20               [ 4]  577 	ret 
                                    578 
                                    579 ;--------------------
                                    580 ; extract int24_t  
                                    581 ; value from BASIC 
                                    582 ; code 
                                    583 ; input:
                                    584 ;    X   *integer 
                                    585 ; output:
                                    586 ;    A:X   int24  
                                    587 ;--------------------
      0017D8                        588 get_int24:
      00941C F4               [ 1]  589 	ld a,(x)
      00941D EE 01            [ 2]  590 	ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    591 ; skip 3 bytes 
      00941D 4F 81 00 01      [ 1]  592 	inc in 
      00941F 72 5C 00 01      [ 1]  593 	inc in 
      00941F A6 01 81 01      [ 1]  594 	inc in 
      009422 81               [ 4]  595 	ret 
                                    596 
                                    597 ;-------------------------
                                    598 ; get character from 
                                    599 ; BASIC code 
                                    600 ; input:
                                    601 ;    X   *char 
                                    602 ; output:
                                    603 ;    A    char 
                                    604 ;-------------------------
      0017E8                        605 get_char:
      009422 88               [ 1]  606 	ld a,(x)
      009423 89 90 F6 27      [ 1]  607 	inc in  
      009427 06               [ 4]  608     ret 
                                    609 
                                    610 ;-----------------------------------
                                    611 ; print a 16 bit integer 
                                    612 ; using variable 'base' as conversion
                                    613 ; format.
                                    614 ; input:
                                    615 ;    X       integer to print 
                                    616 ;   'base'    conversion base 
                                    617 ; output:
                                    618 ;   terminal  
                                    619 ;-----------------------------------
      0017EE                        620 prt_i16:
      009428 F7 5C 90 5C      [ 1]  621 	clr acc24 
      00942C 20 F6 7F         [ 2]  622 	ldw acc16,x 
      00942F 85 84            [ 1]  623 	ld a,#16
      009431 81 00 0A         [ 1]  624 	cp a,base
      009432 27 09            [ 1]  625 	jreq prt_acc24  
      009432 88 52 02 0F 01   [ 2]  626 	btjf acc16,#7,prt_acc24
      009437 0F 02 90 89      [ 1]  627 	cpl acc24 ; sign extend 
                                    628 	
                                    629 ;------------------------------------
                                    630 ; print integer in acc24 
                                    631 ; input:
                                    632 ;	acc24 		integer to print 
                                    633 ;	'base' 		numerical base for conversion 
                                    634 ;   'tab_width' field width 
                                    635 ;    A 			signed||unsigned conversion
                                    636 ;  output:
                                    637 ;    A          string length
                                    638 ;------------------------------------
      001805                        639 prt_acc24:
      00943B 13 01            [ 1]  640 	ld a,#255  ; signed conversion  
      00943D 90 85 27         [ 4]  641     call itoa  ; conversion entier en  .asciz
      009440 31 2B 0E         [ 4]  642 	call right_align  
      009443 88               [ 1]  643 	push a 
      009443 72 BB 00         [ 4]  644 	call puts
      009446 0E               [ 1]  645 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009447 72               [ 4]  646     ret	
                                    647 
                                    648 ;---------------------------------------
                                    649 ;  print value at xstack top 
                                    650 ;---------------------------------------
      001813                        651 print_top: 
      001813                        652 	_xpop 
      009448 B9 00            [ 1]    1     ld a,(y)
      00944A 0E               [ 1]    2     ldw x,y 
      00944B 03 01            [ 2]    3     ldw x,(1,x)
      00944D 03 02 20 05      [ 2]    4     addw y,#CELL_SIZE 
      009451 C7 00 0C         [ 1]  653 	ld acc24,a 
      009451 5A 90 5A         [ 2]  654 	ldw acc16,x 
      009454 0C 02 05         [ 4]  655 	call prt_acc24 
      009456 A6 20            [ 1]  656 	ld a,#SPACE
      009456 C6 00 0E         [ 4]  657 	call putc 
      009459 CA               [ 4]  658 	ret 
                                    659 
                                    660 ;------------------------------------
                                    661 ; convert integer in acc24 to string
                                    662 ; input:
                                    663 ;   'base'	conversion base 
                                    664 ;	acc24	integer to convert
                                    665 ;   A       0=unsigned, else signed 
                                    666 ; output:
                                    667 ;   X  		pointer to first char of string
                                    668 ;   A       string length
                                    669 ;------------------------------------
                           000001   670 	SIGN=1  ; integer sign 
                           000002   671 	LEN=2 
                           000003   672 	PSTR=3
                           000004   673 	VSIZE=4 ;locals size
      00182B                        674 itoa::
      00182B                        675 	_vars VSIZE
      00945A 00 0F            [ 2]    1     sub sp,#VSIZE 
      00945C 27 14            [ 1]  676 	clr (LEN,sp) ; string length  
      00945E 72 FB            [ 1]  677 	clr (SIGN,sp)    ; sign
      009460 01               [ 1]  678 	tnz A
      009461 72 F9            [ 1]  679 	jreq 1$ ; unsigned conversion  
      009463 01 90 F6         [ 1]  680 	ld a,base 
      009466 F7 89            [ 1]  681 	cp a,#10
      009468 CE 00            [ 1]  682 	jrne 1$
                                    683 	; base 10 string display with negative sign if bit 23==1
      00946A 0E 5A CF 00 0E   [ 2]  684 	btjf acc24,#7,1$
      00946F 85 20            [ 1]  685 	cpl (SIGN,sp)
      009471 E4 02 18         [ 4]  686 	call neg_acc24
      009472                        687 1$:
                                    688 ; initialize string pointer 
      009472 5B 02 84         [ 2]  689 	ldw x,#tib 
      009475 81 00 50         [ 2]  690 	addw x,#TIB_SIZE
      009476 5A               [ 2]  691 	decw x 
      009476 89               [ 1]  692 	clr (x)
      00184D                        693 itoa_loop:
      009477 88 AE 00         [ 1]  694     ld a,base
                                    695 ;	ldw (PSTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00947A 35 A6 4E         [ 4]  696     call divu24_8 ; acc24/A 
                                    697 ;	ldw x,(PSTR,sp)
      00947D 7F 5C            [ 1]  698     add a,#'0  ; remainder of division
      00947F 4A 26            [ 1]  699     cp a,#'9+1
      009481 FB 84            [ 1]  700     jrmi 2$
      009483 85 81            [ 1]  701     add a,#7 
      00185B                        702 2$:	
      009485 0A               [ 2]  703 	decw x
      009486 0A               [ 1]  704     ld (x),a
      009487 54 69            [ 1]  705 	inc (LEN,sp)
                                    706 	; if acc24==0 conversion done
      009489 6E 79 20         [ 1]  707 	ld a,acc24
      00948C 42 41 53         [ 1]  708 	or a,acc16
      00948F 49 43 20         [ 1]  709 	or a,acc8
      009492 66 6F            [ 1]  710     jrne itoa_loop
                                    711 	;conversion done, next add '$' or '-' as required
      009494 72 20 53         [ 1]  712 	ld a,base 
      009497 54 4D            [ 1]  713 	cp a,#16
      009499 38 0A            [ 1]  714 	jreq 8$
      00949B 43 6F            [ 1]  715 	ld a,(SIGN,sp)
      00949D 70 79            [ 1]  716     jreq 10$
      00949F 72 69            [ 1]  717     ld a,#'-
      0094A1 67 68            [ 2]  718 	jra 9$ 
      001879                        719 8$:	
      0094A3 74 2C            [ 1]  720 	ld a,#'$ 
      0094A5 20               [ 2]  721 9$: decw x
      0094A6 4A               [ 1]  722     ld (x),a
      0094A7 61 63            [ 1]  723 	inc (LEN,sp)
      00187F                        724 10$:
      0094A9 71 75            [ 1]  725 	ld a,(LEN,sp)
      001881                        726 	_drop VSIZE
      0094AB 65 73            [ 2]    1     addw sp,#VSIZE 
      0094AD 20               [ 4]  727 	ret
                                    728 
                                    729 ;------------------------------------
                                    730 ; convert alpha to uppercase
                                    731 ; input:
                                    732 ;    a  character to convert
                                    733 ; output:
                                    734 ;    a  uppercase character
                                    735 ;------------------------------------
      001884                        736 to_upper::
      0094AE 44 65            [ 1]  737 	cp a,#'a
      0094B0 73 63            [ 1]  738 	jrpl 1$
      0094B2 68               [ 4]  739 0$:	ret
      0094B3 65 6E            [ 1]  740 1$: cp a,#'z	
      0094B5 65 73            [ 1]  741 	jrugt 0$
      0094B7 20 32            [ 1]  742 	sub a,#32
      0094B9 30               [ 4]  743 	ret
                                    744 	
                                    745 ;------------------------------------
                                    746 ; convert pad content in integer
                                    747 ; input:
                                    748 ;    x		* .asciz to convert
                                    749 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                    750 ;    acc24      int24_t
                                    751 ;------------------------------------
                                    752 	; local variables
                           000001   753 	SIGN=1 ; 1 byte, 
                           000002   754 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   755 	TEMP=3 ; 1 byte, temporary storage
                           000004   756 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   757 	VSIZE=5 ; 5 bytes reserved for local storage
      001890                        758 atoi24::
      001890                        759 	_vars VSIZE
      0094BA 31 39            [ 2]    1     sub sp,#VSIZE 
      0094BC 2C 32            [ 2]  760 	ldw (XTEMP,sp),x 
                                    761 ; conversion made on xstack 
      0094BE 30               [ 1]  762 	clr a 
      0094BF 32               [ 1]  763 	clrw x 
      001896                        764 	_xpush 
      0094C0 32 0A 76 65      [ 2]    1     subw y,#CELL_SIZE
      0094C4 72 73            [ 1]    2     ld (y),a 
      0094C6 69 6F 6E         [ 2]    3     ldw (1,y),x 
      0094C9 20 00            [ 1]  765 	clr (SIGN,sp)
      0094CB A6 0A            [ 1]  766 	ld a,#10
      0094CB AE 94            [ 1]  767 	ld (BASE,sp),a ; default base decimal
      0094CD 85 CD            [ 2]  768 	ldw x,(XTEMP,sp)
      0094CF 89               [ 1]  769 	ld a,(x)
      0094D0 E8 A6            [ 1]  770 	jreq 9$  ; completed if 0
      0094D2 02 C7            [ 1]  771 	cp a,#'-
      0094D4 00 0F            [ 1]  772 	jrne 1$
      0094D6 5F CF            [ 1]  773 	cpl (SIGN,sp)
      0094D8 00 0D            [ 2]  774 	jra 2$
      0094DA 72 5F            [ 1]  775 1$: cp a,#'$
      0094DC 00 24            [ 1]  776 	jrne 3$
      0094DE 35 0A            [ 1]  777 	ld a,#16
      0094E0 00 0B            [ 1]  778 	ld (BASE,sp),a
      0094E2 CD               [ 1]  779 2$:	incw x
      0094E3 98 85            [ 2]  780 	ldw (XTEMP,sp),x 
      0094E5 A6               [ 1]  781 	ld a,(x)
      0018BE                        782 3$:	; char to digit 
      0094E6 2E CD            [ 1]  783 	cp a,#'a
      0094E8 89 8B            [ 1]  784 	jrmi 4$
      0094EA A6 00            [ 1]  785 	sub a,#32
      0094EC C7 00            [ 1]  786 4$:	cp a,#'0
      0094EE 0F 5F            [ 1]  787 	jrmi 9$
      0094F0 CF 00            [ 1]  788 	sub a,#'0
      0094F2 0D CD            [ 1]  789 	cp a,#10
      0094F4 98 85            [ 1]  790 	jrmi 5$
      0094F6 A6 0D            [ 1]  791 	sub a,#7
      0094F8 CD 89            [ 1]  792 	cp a,(BASE,sp)
      0094FA 8B 81            [ 1]  793 	jrpl 9$
      0094FC 6B 03            [ 1]  794 5$:	ld (TEMP,sp),a
      0094FC 90 AE            [ 1]  795 	ld a,(BASE,sp)
      0094FE 17 73 72         [ 4]  796 	call mulu24_8
      0018DB                        797 	_xpush 
      009501 5F 00 23 72      [ 2]    1     subw y,#CELL_SIZE
      009505 5F 00            [ 1]    2     ld (y),a 
      009507 20 35 04         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00950A 00               [ 1]  798 	clrw x 
      00950B 24 35            [ 1]  799 	ld a,(TEMP,sp)
      00950D 0A               [ 1]  800 	rlwa x 
      0018E8                        801 	_xpush 
      00950E 00 0B AE 00      [ 2]    1     subw y,#CELL_SIZE
      009512 00 CF            [ 1]    2     ld (y),a 
      009514 00 05 CF         [ 2]    3     ldw (1,y),x 
      009517 00 01 72         [ 4]  802 	call add24 
      00951A 5F 00            [ 2]  803 	ldw x,(XTEMP,sp)
      00951C 04 81            [ 2]  804 	jra 2$
      00951E 0D 01            [ 1]  805 9$:	tnz (SIGN,sp)
      00951E 89 72            [ 1]  806     jreq atoi_exit
      009520 5F 00 04         [ 4]  807     call neg24
      0018FF                        808 atoi_exit:
      0018FF                        809 	_xpop 
      009523 72 5F            [ 1]    1     ld a,(y)
      009525 00               [ 1]    2     ldw x,y 
      009526 02 AE            [ 2]    3     ldw x,(1,x)
      009528 00 90 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00952C 1C CF 00         [ 1]  810 	ld acc24,a 
      00952F 1E CF 00         [ 2]  811 	ldw acc16,x  
      00190E                        812 	_drop VSIZE
      009532 31 CF            [ 2]    1     addw sp,#VSIZE 
      009534 00               [ 4]  813 	ret
                                    814 
                                    815 
                                    816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    817 ;;   TINY BASIC  operators,
                                    818 ;;   commands and functions 
                                    819 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    820 
                                    821 ;---------------------------------
                                    822 ; dictionary search 
                                    823 ; input:
                                    824 ;	X 		dictionary entry point, name field  
                                    825 ;   y		.asciz name to search 
                                    826 ; output:
                                    827 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    828 ;  X		routine address|TK_OP 
                                    829 ;---------------------------------
                           000001   830 	NLEN=1 ; cmd length 
                           000002   831 	XSAVE=2
                           000004   832 	YSAVE=4
                           000005   833 	VSIZE=5 
      001911                        834 search_dict::
      001911                        835 	_vars VSIZE 
      009535 33 CD            [ 2]    1     sub sp,#VSIZE 
      009537 94 76            [ 2]  836 	ldw (YSAVE,sp),y 
      001915                        837 search_next:
      009539 85 81            [ 2]  838 	ldw (XSAVE,sp),x 
                                    839 ; get name length in dictionary	
      00953B F6               [ 1]  840 	ld a,(x)
      00953B 00 00            [ 1]  841 	and a,#0xf 
      00953D 95 5D            [ 1]  842 	ld (NLEN,sp),a  
      00953F 95 6A            [ 2]  843 	ldw y,(YSAVE,sp) ; name pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009541 95               [ 1]  844 	incw x 
      00191F                        845 cp_loop:
      009542 78 95            [ 1]  846 	ld a,(y)
      009544 91 95            [ 1]  847 	jreq str_match 
      009546 A0 95            [ 1]  848 	tnz (NLEN,sp)
      009548 B6 95            [ 1]  849 	jreq no_match  
      00954A CC               [ 1]  850 	cp a,(x)
      00954B 95 E6            [ 1]  851 	jrne no_match 
      00954D 95 F7            [ 1]  852 	incw y 
      00954F 96               [ 1]  853 	incw x
      009550 08 96            [ 1]  854 	dec (NLEN,sp)
      009552 14 96            [ 2]  855 	jra cp_loop 
      001931                        856 no_match:
      009554 47 96            [ 2]  857 	ldw x,(XSAVE,sp) 
      009556 57 96 6B         [ 2]  858 	subw x,#2 ; move X to link field
      009559 96 7E            [ 1]  859 	push #TK_NONE 
      00955B 96               [ 2]  860 	ldw x,(x) ; next word link 
      00955C 8B               [ 1]  861 	pop a ; TK_NONE 
      00955D 4D 65            [ 1]  862 	jreq search_exit  ; not found  
                                    863 ;try next 
      00955F 6D 6F            [ 2]  864 	jra search_next
      00193E                        865 str_match:
      009561 72 79            [ 2]  866 	ldw x,(XSAVE,sp)
      009563 20               [ 1]  867 	ld a,(X)
      009564 66 75            [ 1]  868 	ld (NLEN,sp),a ; needed to test keyword type  
      009566 6C 6C            [ 1]  869 	and a,#NLEN_MASK 
                                    870 ; move x to procedure address field 	
      009568 0A               [ 1]  871 	inc a 
      009569 00 73 79         [ 1]  872 	ld acc8,a 
      00956C 6E 74 61 78      [ 1]  873 	clr acc16 
      009570 20 65 72 72      [ 2]  874 	addw x,acc16 
      009574 6F               [ 2]  875 	ldw x,(x) ; routine address  
                                    876 ;determine keyword type bits 7:4 
      009575 72 0A            [ 1]  877 	ld a,(NLEN,sp)
      009577 00 6D            [ 1]  878 	and a,#KW_TYPE_MASK 
      009579 61               [ 1]  879 	swap a 
      00957A 74 68            [ 1]  880 	add a,#128
      001959                        881 search_exit: 
      001959                        882 	_drop VSIZE 
      00957C 20 6F            [ 2]    1     addw sp,#VSIZE 
      00957E 70               [ 4]  883 	ret 
                                    884 
                                    885 ;---------------------
                                    886 ; check if next token
                                    887 ;  is of expected type 
                                    888 ; input:
                                    889 ;   A 		 expected token attribute
                                    890 ;  ouput:
                                    891 ;   none     if fail call syntax_error 
                                    892 ;--------------------
      00195C                        893 expect:
      00957F 65               [ 1]  894 	push a 
      009580 72 61 74         [ 4]  895 	call next_token 
      009583 69 6F            [ 1]  896 	cp a,(1,sp)
      009585 6E 20            [ 1]  897 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009587 6F 76 65         [ 2]  898 	jp syntax_error
      00958A 72               [ 1]  899 1$: pop a 
      00958B 66               [ 4]  900 	ret 
                                    901 
                                    902 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    903 ; parse arguments list 
                                    904 ; between ()
                                    905 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001969                        906 func_args:
      00958C 6C 6F            [ 1]  907 	ld a,#TK_LPAREN 
      00958E 77 0A 00         [ 4]  908 	call expect 
                                    909 ; expected to continue in arg_list 
                                    910 ; caller must check for TK_RPAREN 
                                    911 
                                    912 ;-------------------------------
                                    913 ; parse embedded BASIC routines 
                                    914 ; arguments list.
                                    915 ; arg_list::=  expr[','expr]*
                                    916 ; all arguments are of int24_t type
                                    917 ; and pushed on stack 
                                    918 ; input:
                                    919 ;   none
                                    920 ; output:
                                    921 ;   xstack{n}   arguments pushed on xstack
                                    922 ;   A 	number of arguments pushed on xstack  
                                    923 ;--------------------------------
      00196E                        924 arg_list:
      009591 64 69            [ 1]  925 	push #0
      009593 76 69 73         [ 4]  926 1$:	call condition 
      009596 69               [ 1]  927 	tnz a 
      009597 6F 6E            [ 1]  928 	jreq 7$  
      009599 20 62            [ 1]  929 	inc (1,sp)
      00959B 79 20 30         [ 4]  930 	call next_token 
      00959E 0A 00            [ 1]  931 	cp a,#TK_COMMA 
      0095A0 69 6E            [ 1]  932 	jreq 1$ 
      0095A2 76 61            [ 1]  933 	cp a,#TK_RPAREN
      0095A4 6C 69            [ 1]  934 	jreq 7$
      001983                        935 	_unget_token 
      0095A6 64 20 6C 69 6E   [ 1]    1      mov in,in.saved  
      0095AB 65               [ 1]  936 7$:	pop a  
      0095AC 20               [ 4]  937 	ret 
                                    938 
                                    939 ;--------------------------------
                                    940 ;   BASIC commnands 
                                    941 ;--------------------------------
                                    942 
                                    943 ;--------------------------------
                                    944 ;  arithmetic and relational 
                                    945 ;  routines
                                    946 ;  operators precedence
                                    947 ;  highest to lowest
                                    948 ;  operators on same row have 
                                    949 ;  same precedence and are executed
                                    950 ;  from left to right.
                                    951 ;	'*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    952 ;   '-','+'
                                    953 ;   '=','>','<','>=','<=','<>','><'
                                    954 ;   '<>' and '><' are equivalent for not equal.
                                    955 ;--------------------------------
                                    956 
                                    957 ;---------------------
                                    958 ; return array element
                                    959 ; address from @(expr)
                                    960 ; input:
                                    961 ;   A 		TK_ARRAY
                                    962 ; output:
                                    963 ;	X 		element address 
                                    964 ;----------------------
      00198A                        965 get_array_element:
      0095AD 6E 75 6D         [ 4]  966 	call func_args 
      0095B0 62 65            [ 1]  967 	cp a,#1
      0095B2 72 2E            [ 1]  968 	jreq 1$
      0095B4 0A 00 72         [ 2]  969 	jp syntax_error
      001994                        970 1$: _xpop 
      0095B7 75 6E            [ 1]    1     ld a,(y)
      0095B9 20               [ 1]    2     ldw x,y 
      0095BA 74 69            [ 2]    3     ldw x,(1,x)
      0095BC 6D 65 20 6F      [ 2]    4     addw y,#CELL_SIZE 
                                    971     ; ignore A, index < 65536 in any case 
                                    972 	; check for bounds 
      0095C0 6E 6C 79         [ 2]  973 	cpw x,array_size 
      0095C3 20 75            [ 2]  974 	jrule 3$
                                    975 ; bounds {1..array_size}	
      0095C5 73 61            [ 1]  976 2$: ld a,#ERR_BAD_VALUE 
      0095C7 67 65 2E         [ 2]  977 	jp tb_error 
      0095CA 0A               [ 2]  978 3$: tnzw  x
      0095CB 00 63            [ 1]  979 	jreq 2$ 
      0095CD 6F               [ 2]  980 	pushw x 
      0095CE 6D               [ 2]  981 	sllw x 
      0095CF 6D 61 6E         [ 2]  982 	addw x,(1,sp) ; index*size_of(int24)
      0095D2 64 20            [ 2]  983 	ldw (1,sp),x  
      0095D4 6C 69 6E         [ 2]  984 	ldw x,#tib ; array is below tib 
      0095D7 65 20 6F         [ 2]  985 	subw x,(1,sp)
      0019B7                        986 	_drop 2   
      0095DA 6E 6C            [ 2]    1     addw sp,#2 
      0095DC 79               [ 4]  987 	ret 
                                    988 
                                    989 
                                    990 ;***********************************
                                    991 ;   expression parse,execute 
                                    992 ;***********************************
                                    993 ;-----------------------------------
                                    994 ; factor ::= ['+'|'-'|e]  var | @ |
                                    995 ;			 integer | function |
                                    996 ;			 '('relation')' 
                                    997 ; output:
                                    998 ;   A       token attribute 
                                    999 ;   xstack  value  
                                   1000 ; ---------------------------------
                           000001  1001 	NEG=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



                           000001  1002 	VSIZE=1
      0019BA                       1003 factor:
      0019BA                       1004 	_vars VSIZE 
      0095DD 20 75            [ 2]    1     sub sp,#VSIZE 
      0095DF 73 61            [ 1] 1005 	clr (NEG,sp)
      0095E1 67 65 2E         [ 4] 1006 	call next_token
      0095E4 0A               [ 1] 1007 	tnz a 
      0095E5 00 64            [ 1] 1008 	jrne 1$ 
      0095E7 75 70 6C         [ 2] 1009 	jp 22$ 
      0095EA 69 63            [ 1] 1010 1$:	cp a,#TK_PLUS 
      0095EC 61 74            [ 1] 1011 	jreq 2$
      0095EE 65 20            [ 1] 1012 	cp a,#TK_MINUS 
      0095F0 6E 61            [ 1] 1013 	jrne 4$ 
      0095F2 6D 65            [ 1] 1014 	cpl (NEG,sp)
      0019D1                       1015 2$:	
      0095F4 2E 0A 00         [ 4] 1016 	call next_token
      0019D4                       1017 4$:
      0095F7 46               [ 1] 1018 	tnz a 
      0095F8 69 6C            [ 1] 1019 	jrne 41$ 
      0095FA 65 20 6E         [ 2] 1020 	jp syntax_error  
      0019DA                       1021 41$:	
      0095FD 6F 74            [ 1] 1022 	cp a,#TK_IFUNC 
      0095FF 20 66            [ 1] 1023 	jrne 5$ 
      0019DE                       1024 	_get_code_addr 
      009601 6F               [ 2]    1         ldw x,(x)
      009602 75 6E 64 2E      [ 1]    2         inc in 
      009606 0A 00 62 61      [ 1]    3         inc in 
      00960A 64               [ 4] 1025 	call (x); result in A:X  
      00960B 20 76            [ 2] 1026 	jra 18$ 
      0019EA                       1027 5$:
      00960D 61 6C            [ 1] 1028 	cp a,#TK_INTGR
      00960F 75 65            [ 1] 1029 	jrne 6$
      009611 2E 0A 00         [ 4] 1030 	call get_int24 ; A:X
      009614 46 69            [ 2] 1031 	jra 18$
      0019F3                       1032 6$:
      009616 6C 65            [ 1] 1033 	cp a,#TK_ARRAY
      009618 20 69            [ 1] 1034 	jrne 7$
      00961A 6E 20 65         [ 4] 1035 	call get_array_element
      00961D 78 74            [ 2] 1036     jra 71$
      0019FC                       1037 7$:
      00961F 65 6E            [ 1] 1038 	cp a,#TK_VAR 
      009621 64 65            [ 1] 1039 	jrne 8$
      009623 64 20 6D         [ 4] 1040 	call get_addr 
      001A03                       1041 71$: ; put value in A:X
      009626 65               [ 1] 1042 	ld a,(x)
      009627 6D 6F            [ 2] 1043 	ldw x,(1,x)
      009629 72 79            [ 2] 1044 	jra 18$
      001A08                       1045 8$:
      00962B 2C 20            [ 1] 1046 	cp a,#TK_LABEL 
      00962D 63 61            [ 1] 1047 	jrne 9$
      00962F 6E 27            [ 2] 1048 	pushw y  
      009631 74               [ 2] 1049 	pushw x 
      009632 20 62 65         [ 4] 1050 	call skip_string
      009635 20 72            [ 2] 1051 	ldw x,(1,sp) 
      009637 75 6E 20 66      [ 2] 1052 	ldw y,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00963B 72 6F 6D         [ 4] 1053 	call search_name
      00963E 20               [ 2] 1054 	tnzw x 
      00963F 74 68            [ 1] 1055 	jrne 82$ 
      009641 65 72 65 2E      [ 2] 1056 	ldw y,dvar_bgn
      009645 0A 00            [ 2] 1057 	ldw x,(1,sp)
      009647 4E 6F 20         [ 4] 1058 	call search_name
      00964A 64               [ 2] 1059 	tnzw x 
      00964B 61 74            [ 1] 1060 	jrne 82$ 
      00964D 61               [ 2] 1061 	popw x 
      00964E 20 66            [ 2] 1062 	popw y 
      009650 6F 75            [ 2] 1063 	jra 16$
      001A2F                       1064 82$:
      001A2F                       1065 	_drop 2  ; name pointer 
      009652 6E 64            [ 2]    1     addw sp,#2 
      009654 2E 0A            [ 2] 1066 	popw y   
      009656 00 4E 6F         [ 4] 1067 	call get_value ; in A:X 
      009659 20 70            [ 2] 1068 	jra 18$
      001A38                       1069 9$: 
      00965B 72 6F            [ 1] 1070 	cp a,#TK_CFUNC 
      00965D 67 72            [ 1] 1071 	jrne 12$
      001A3C                       1072 	_get_code_addr 
      00965F 61               [ 2]    1         ldw x,(x)
      009660 6D 20 69 6E      [ 1]    2         inc in 
      009664 20 52 41 4D      [ 1]    3         inc in 
      009668 21               [ 4] 1073 	call(x)
      009669 0A               [ 1] 1074 	clrw x 
      00966A 00               [ 1] 1075 	rlwa x  ; char>int24 in A:X 
      00966B 46 69            [ 2] 1076 	jra 18$ 	 
      001A4A                       1077 12$:			
      00966D 6C 65            [ 1] 1078 	cp a,#TK_LPAREN
      00966F 20 73            [ 1] 1079 	jrne 16$
      009671 79 73 74         [ 4] 1080 	call expression
      009674 65 6D            [ 1] 1081 	ld a,#TK_RPAREN 
      009676 20 66 75         [ 4] 1082 	call expect
      001A56                       1083 	_xpop 
      009679 6C 6C            [ 1]    1     ld a,(y)
      00967B 2E               [ 1]    2     ldw x,y 
      00967C 0A 00            [ 2]    3     ldw x,(1,x)
      00967E 42 75 66 66      [ 2]    4     addw y,#CELL_SIZE 
      009682 65 72            [ 2] 1084 	jra 18$	
      001A61                       1085 16$:
      001A61                       1086 	_unget_token 
      009684 20 66 75 6C 6C   [ 1]    1      mov in,in.saved  
      009689 0A               [ 1] 1087 	clr a 
      00968A 00 6F            [ 2] 1088 	jra 22$ 
      001A69                       1089 18$: 
      00968C 76 65            [ 1] 1090 	tnz (NEG,sp)
      00968E 72 66            [ 1] 1091 	jreq 20$
      009690 6C 6F 77         [ 4] 1092 	call neg_ax   
      001A70                       1093 20$:
      001A70                       1094 	_xpush 
      009693 0A 00 0A 72      [ 2]    1     subw y,#CELL_SIZE
      009697 75 6E            [ 1]    2     ld (y),a 
      009699 20 74 69         [ 2]    3     ldw (1,y),x 
      00969C 6D 65            [ 1] 1095 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001A7B                       1096 22$:
      001A7B                       1097 	_drop VSIZE
      00969E 20 65            [ 2]    1     addw sp,#VSIZE 
      0096A0 72               [ 4] 1098 	ret
                                   1099 
                                   1100 
                                   1101 ;-----------------------------------
                                   1102 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1103 ; output:
                                   1104 ;   A    	token attribute 
                                   1105 ;	xstack		value 
                                   1106 ;-----------------------------------
                           000001  1107 	MULOP=1
                           000001  1108 	VSIZE=1
      001A7E                       1109 term:
      001A7E                       1110 	_vars VSIZE
      0096A1 72 6F            [ 2]    1     sub sp,#VSIZE 
                                   1111 ; first factor 	
      0096A3 72 2C 20         [ 4] 1112 	call factor
      0096A6 00               [ 1] 1113 	tnz a 
      0096A7 0A 63            [ 1] 1114 	jreq term_exit  
      001A86                       1115 term01:	 ; check for  operator '*'|'/'|'%' 
      0096A9 6F 6D 70         [ 4] 1116 	call next_token
      0096AC 69 6C            [ 1] 1117 	ld (MULOP,sp),a
      0096AE 65 20            [ 1] 1118 	and a,#TK_GRP_MASK
      0096B0 65 72            [ 1] 1119 	cp a,#TK_GRP_MULT
      0096B2 72 6F            [ 1] 1120 	jreq 1$
      0096B4 72 2C            [ 1] 1121 	ld a,#TK_INTGR
      001A93                       1122 	_unget_token 
      0096B6 20 00 6C 61 73   [ 1]    1      mov in,in.saved  
      0096BB 74 20            [ 2] 1123 	jra term_exit 
      001A9A                       1124 1$:	; got *|/|%
                                   1125 ;second factor
      0096BD 74 6F 6B         [ 4] 1126 	call factor
      0096C0 65               [ 1] 1127 	tnz a 
      0096C1 6E 20            [ 1] 1128 	jrne 2$ 
      0096C3 69 64 3A         [ 2] 1129 	jp syntax_error 
      001AA3                       1130 2$: ; select operation 	
      0096C6 20 00            [ 1] 1131 	ld a,(MULOP,sp) 
      0096C8 A1 20            [ 1] 1132 	cp a,#TK_MULT 
      0096C8 A6 02            [ 1] 1133 	jrne 3$
                                   1134 ; '*' operator
      0096CA CD 02 74         [ 4] 1135 	call mul24 
      0096CA 72 0A            [ 2] 1136 	jra term01
      0096CC 00 23            [ 1] 1137 3$: cp a,#TK_DIV 
      0096CE 4C 88            [ 1] 1138 	jrne 4$ 
                                   1139 ; '/' operator	
      0096D0 AE 96 95         [ 4] 1140 	call div24 
      0096D3 CD 89            [ 2] 1141 	jra term01 
      001AB7                       1142 4$: ; '%' operator
      0096D5 E8 84 AE         [ 4] 1143 	call mod24
      0096D8 95 3B            [ 2] 1144 	jra term01 
      001ABC                       1145 9$: 
      0096DA 72 5F            [ 1] 1146 	ld a,#TK_INTGR
      001ABE                       1147 term_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      001ABE                       1148 	_drop VSIZE 
      0096DC 00 0E            [ 2]    1     addw sp,#VSIZE 
      0096DE 48               [ 4] 1149 	ret 
                                   1150 
                                   1151 ;-------------------------------
                                   1152 ;  expr ::= term [['+'|'-'] term]*
                                   1153 ;  result range {-32768..32767}
                                   1154 ;  output:
                                   1155 ;   A    token attribute 
                                   1156 ;   xstack	 result    
                                   1157 ;-------------------------------
                           000001  1158 	OP=1 
                           000001  1159 	VSIZE=1 
      001AC1                       1160 expression:
      001AC1                       1161 	_vars VSIZE 
      0096DF 72 59            [ 2]    1     sub sp,#VSIZE 
                                   1162 ; first term 	
      0096E1 00 0E C7         [ 4] 1163 	call term
      0096E4 00               [ 1] 1164 	tnz a 
      0096E5 0F 72            [ 1] 1165 	jreq 9$
      001AC9                       1166 1$:	; operator '+'|'-'
      0096E7 BB 00 0E         [ 4] 1167 	call next_token
      0096EA FE CD            [ 1] 1168 	ld (OP,sp),a 
      0096EC 89 E8            [ 1] 1169 	and a,#TK_GRP_MASK
      0096EE CE 00            [ 1] 1170 	cp a,#TK_GRP_ADD 
      0096F0 05 C6            [ 1] 1171 	jreq 2$ 
      001AD4                       1172 	_unget_token 
      0096F2 00 04 90 5F 90   [ 1]    1      mov in,in.saved  
      0096F7 02 CD            [ 1] 1173 	ld a,#TK_INTGR
      0096F9 86 E7            [ 2] 1174 	jra 9$ 
      001ADD                       1175 2$: ; second term 
      0096FB CE 00 05         [ 4] 1176 	call term
      0096FE C6               [ 1] 1177 	tnz a 
      0096FF 00 02            [ 1] 1178 	jrne 3$
      009701 CD A1 0B         [ 2] 1179 	jp syntax_error
      001AE6                       1180 3$:
      009704 AE 96            [ 1] 1181 	ld a,(OP,sp)
      009706 B8 CD            [ 1] 1182 	cp a,#TK_PLUS 
      009708 89 E8            [ 1] 1183 	jrne 4$
                                   1184 ; '+' operator	
      00970A C6 00 03         [ 4] 1185 	call add24
      00970D 5F 97            [ 2] 1186 	jra 1$ 
      001AF1                       1187 4$:	; '-' operator 
      00970F 72 BB 00         [ 4] 1188 	call sub24
      009712 05 F6            [ 2] 1189 	jra 1$
      001AF6                       1190 9$:
      001AF6                       1191 	_drop VSIZE 
      009714 5F 97            [ 2]    1     addw sp,#VSIZE 
      009716 CD               [ 4] 1192 	ret 
                                   1193 
                                   1194 ;---------------------------------------------
                                   1195 ; rel ::= expr rel_op expr
                                   1196 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1197 ;  relation return  integer , zero is false 
                                   1198 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1199 ;	 xstack		value  
                                   1200 ;---------------------------------------------
                           000001  1201 	RELOP=1
                           000001  1202 	VSIZE=1 
      001AF9                       1203 relation: 
      001AF9                       1204 	_vars VSIZE
      009717 98 6E            [ 2]    1     sub sp,#VSIZE 
      009719 20 35 C1         [ 4] 1205 	call expression
      00971B 4D               [ 1] 1206 	tnz a 
      00971B 88 AE            [ 1] 1207 	jreq 9$ 
                                   1208 ; expect rel_op or leave 
      00971D 96 A7 CD         [ 4] 1209 	call next_token 
      009720 89 E8            [ 1] 1210 	ld (RELOP,sp),a 
      009722 84 AE            [ 1] 1211 	and a,#TK_GRP_MASK
      009724 95 3B            [ 1] 1212 	cp a,#TK_GRP_RELOP 
      009726 72 5F            [ 1] 1213 	jreq 2$
      009728 00 0E            [ 1] 1214 	ld a,#TK_INTGR 
      001B0E                       1215 	_unget_token 
      00972A 48 72 59 00 0E   [ 1]    1      mov in,in.saved  
      00972F C7 00            [ 2] 1216 	jra 9$ 
      001B15                       1217 2$:	; expect another expression
      009731 0F 72 BB         [ 4] 1218 	call expression
      009734 00               [ 1] 1219 	tnz a 
      009735 0E FE            [ 1] 1220 	jrne 3$
      009737 CD 89 E8         [ 2] 1221 	jp syntax_error 
      001B1E                       1222 3$: 
      00973A AE 16 90         [ 4] 1223 	call cp24 
      001B21                       1224 	_xpop  
      00973D CD 89            [ 1]    1     ld a,(y)
      00973F E8               [ 1]    2     ldw x,y 
      009740 A6 0D            [ 2]    3     ldw x,(1,x)
      009742 CD 89 8B CE      [ 2]    4     addw y,#CELL_SIZE 
      009746 00               [ 1] 1225 	tnz a 
      009747 01 CD            [ 1] 1226 	jrmi 4$
      009749 8A 55            [ 1] 1227 	jrne 5$
      00974B A6 5E CD 89      [ 1] 1228 	mov acc8,#2 ; i1==i2
      00974F 8B AE            [ 2] 1229 	jra 6$ 
      001B35                       1230 4$: ; i1<i2
      009751 17 FF 94 0E      [ 1] 1231 	mov acc8,#4 
      009754 20 04            [ 2] 1232 	jra 6$
      001B3B                       1233 5$: ; i1>i2
      009754 CD 94 FC 0E      [ 1] 1234 	mov acc8,#1  
      009757                       1235 6$: ; 0=false, -1=true 
      009757 A6               [ 1] 1236 	clrw x 
      009758 0D CD 89         [ 1] 1237 	ld a, acc8  
      00975B 8B A6            [ 1] 1238 	and a,(RELOP,sp)
      00975D 3E CD            [ 1] 1239 	jreq 7$
      00975F 89               [ 2] 1240 	cplw x 
      009760 8B CD            [ 1] 1241 	ld a,#255 
      001B4A                       1242 7$:	_xpush 
      009762 8A ED 72 5D      [ 2]    1     subw y,#CELL_SIZE
      009766 00 04            [ 1]    2     ld (y),a 
      009768 27 ED CD         [ 2]    3     ldw (1,y),x 
      00976B 91 16            [ 1] 1243 	ld a,#TK_INTGR
      001B55                       1244 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      001B55                       1245 	_drop VSIZE
      00976D 72 5D            [ 2]    1     addw sp,#VSIZE 
      00976F 00               [ 4] 1246 	ret 
                                   1247 
                                   1248 ;-------------------------------------------
                                   1249 ;  AND factor:  [NOT] relation | (condition)
                                   1250 ;  output:
                                   1251 ;     A      TK_INTGR|0
                                   1252 ;-------------------------------------------
                           000001  1253 	NOT_OP=1
      001B58                       1254 and_factor:
      009770 04 27            [ 1] 1255 	push #0 
      009772 E4 17 A6         [ 4] 1256 0$:	call next_token  
      009773 4D               [ 1] 1257 	tnz a 
      009773 C6 00            [ 1] 1258 	jreq 8$ 
      009775 02 C1            [ 1] 1259 	cp a,#TK_NOT 
      009777 00 04            [ 1] 1260 	jrne 1$ 
      009779 2B 1D            [ 1] 1261 	cpl (NOT_OP,sp)
      00977B 20 F2            [ 2] 1262 	jra 0$ 
      001B68                       1263 1$:	
      00977B 72 01            [ 1] 1264 	cp a,#TK_LPAREN 
      00977D 00 23            [ 1] 1265 	jrne 2$
      00977F D7 CE 00         [ 4] 1266 	call condition
      009782 05 72            [ 1] 1267 	ld a,#TK_RPAREN 
      009784 BB 00 01         [ 4] 1268 	call expect
      009787 C3 00            [ 2] 1269 	jra 3$
      001B76                       1270 2$: _unget_token 
      009789 1E 2A C8 CF 00   [ 1]    1      mov in,in.saved  
      00978E 05 E6 02         [ 4] 1271 	call relation
      001B7E                       1272 3$:
      009791 C7 00            [ 1] 1273 	tnz (NOT_OP,sp)
      009793 04 35            [ 1] 1274 	jreq 8$ 
      009795 03 00 02         [ 4] 1275 	call cpl24
      009798                       1276 8$:
      001B85                       1277 	_drop 1  
      009798 CD 98            [ 2]    1     addw sp,#1 
      00979A 26               [ 4] 1278     ret 
                                   1279 
                                   1280 
                                   1281 ;--------------------------------------------
                                   1282 ;  AND operator as priority over OR||XOR 
                                   1283 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1284 ;          
                                   1285 ;  output:
                                   1286 ;     A     TK_INTGR|0
                                   1287 ;    xtack   value 
                                   1288 ;--------------------------------------------
      001B88                       1289 and_cond:
      00979B A1 00 27         [ 4] 1290 	call and_factor
      00979E DC               [ 1] 1291 	tnz a 
      00979F A1 80            [ 1] 1292 	jreq 9$  
      0097A1 26 0C FE         [ 4] 1293 1$: call next_token 
      0097A4 72               [ 1] 1294 	tnz a 
      0097A5 5C 00            [ 1] 1295 	jreq 6$ 
      0097A7 02 72            [ 1] 1296 	cp a,#TK_AND 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0097A9 5C 00            [ 1] 1297 	jreq 3$
      001B98                       1298 	_unget_token 
      0097AB 02 FD 20 E9 01   [ 1]    1      mov in,in.saved  
      0097AF 20 38            [ 2] 1299 	jra 6$ 
      0097AF A1 85 26         [ 4] 1300 3$:	call and_factor  
      0097B2 05               [ 1] 1301 	tnz a 
      0097B3 CD 9D            [ 1] 1302 	jrne 4$
      0097B5 2C 20 E0         [ 2] 1303 	jp syntax_error 
      0097B8                       1304 4$:	
      001BA8                       1305 	_xpop 
      0097B8 A1 05            [ 1]    1     ld a,(y)
      0097BA 26               [ 1]    2     ldw x,y 
      0097BB 05 CD            [ 2]    3     ldw x,(1,x)
      0097BD 9D 27 20 D7      [ 2]    4     addw y,#CELL_SIZE 
      0097C1 C7 00 0C         [ 1] 1306 	ld acc24,a 
      0097C1 A1 03 26         [ 2] 1307 	ldw acc16,x
      001BB7                       1308 	_xpop 
      0097C4 05 CD            [ 1]    1     ld a,(y)
      0097C6 97               [ 1]    2     ldw x,y 
      0097C7 D1 20            [ 2]    3     ldw x,(1,x)
      0097C9 CE A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0097CA C4 00 0C         [ 1] 1309 	and a,acc24 
      0097CA A1               [ 1] 1310 	rlwa x 
      0097CB 0A 27 CA         [ 1] 1311 	and a,acc16 
      0097CE CC               [ 1] 1312 	rlwa x 
      0097CF 96 C8 0E         [ 1] 1313 	and a,acc8 
      0097D1 02               [ 1] 1314 	rlwa x
      001BCC                       1315 	_xpush
      0097D1 89 CD 98 3F      [ 2]    1     subw y,#CELL_SIZE
      0097D5 CE 00            [ 1]    2     ld (y),a 
      0097D7 05 72 BB         [ 2]    3     ldw (1,y),x 
      0097DA 00 01            [ 2] 1316 	jra 1$  
      0097DC F6 A1            [ 1] 1317 6$: ld a,#TK_INTGR 
      0097DE 32               [ 4] 1318 9$:	ret 	 
                                   1319 
                                   1320 
                                   1321 ;--------------------------------------------
                                   1322 ; condition for IF and UNTIL 
                                   1323 ; operators: OR,XOR 
                                   1324 ; format:  and_cond [ OP and_cond ]* 
                                   1325 ; output:
                                   1326 ;    A        INTGR|0 
                                   1327 ;    xstack   value 
                                   1328 ;--------------------------------------------
                           000001  1329 	ATMP=1
                           000002  1330 	OP=2
                           000002  1331 	VSIZE=2 
      001BDA                       1332 condition:
      001BDA                       1333 	_vars VSIZE 
      0097DF 26 42            [ 2]    1     sub sp,#VSIZE 
      0097E1 72 5C 00         [ 4] 1334 	call and_cond
      0097E4 02               [ 1] 1335 	tnz a 
      0097E5 CD 9C            [ 1] 1336 	jreq 9$ 
      0097E7 5A A1 84         [ 4] 1337 1$:	call next_token 
      0097EA 27 03            [ 1] 1338 	cp a,#TK_OR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      0097EC CC 96            [ 1] 1339 	jreq 2$
      0097EE C8 90            [ 1] 1340 	cp a,#TK_XOR
      0097F0 89 90            [ 1] 1341 	jreq 2$ 
      001BED                       1342 	_unget_token 
      0097F2 CE 00 31 1E 03   [ 1]    1      mov in,in.saved  
      0097F7 CD 9E            [ 2] 1343 	jra 8$ 
      0097F9 00 5D            [ 1] 1344 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097FB 27 EF F6         [ 4] 1345 	call and_cond
      0097FE 88 4B            [ 1] 1346 	cp a,#TK_INTGR 
      009800 00 72            [ 1] 1347 	jreq 3$
      009802 FB 01 1D         [ 2] 1348 	jp syntax_error 
      001C00                       1349 3$:	 
      001C00                       1350 	_xpop  ; rigth arg 
      009805 00 03            [ 1]    1     ld a,(y)
      009807 CF               [ 1]    2     ldw x,y 
      009808 00 1A            [ 2]    3     ldw x,(1,x)
      00980A 5B 02 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00980E 90 F6 93         [ 1] 1351 	ld acc24,a 
      009811 EE 01 72         [ 2] 1352 	ldw acc16,x 
      001C0F                       1353 	_xpop  ; left arg  
      009814 A9 00            [ 1]    1     ld a,(y)
      009816 03               [ 1]    2     ldw x,y 
      009817 72 C7            [ 2]    3     ldw x,(1,x)
      009819 00 1A 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00981D 00 1B            [ 1] 1354 	ld (ATMP,sp),a 
      00981F 72 CF            [ 1] 1355 	ld a,(OP,sp)
      009821 00 1A            [ 1] 1356 	cp a,#TK_XOR 
      009823 5B 02            [ 1] 1357 	jreq 5$ 
      001C20                       1358 4$: ; A:X OR acc24   
      009825 81 01            [ 1] 1359 	ld a,(ATMP,sp)
      009826 CA 00 0C         [ 1] 1360 	or a,acc24 
      009826 C6               [ 1] 1361 	rlwa x 
      009827 00 02 C7         [ 1] 1362 	or a,acc16 
      00982A 00               [ 1] 1363 	rlwa x 
      00982B 03 C0 00         [ 1] 1364 	or a,acc8 
      00982E 04               [ 1] 1365 	rlwa x 
      00982F 27 0D            [ 2] 1366 	jra 6$  
      009831                       1367 5$: ; A:X XOR acc24 
      009831 CE 00            [ 1] 1368 	ld a,(ATMP,sp)
      009833 05 72 BB         [ 1] 1369 	xor a,acc24 
      009836 00               [ 1] 1370 	rlwa x 
      009837 01 F6 5C         [ 1] 1371 	xor a,acc16 
      00983A 72               [ 1] 1372 	rlwa x 
      00983B 5C 00 02         [ 1] 1373 	xor a,acc8 
      00983E 81               [ 1] 1374 	rlwa x 
      00983F                       1375 6$: _xpush
      00983F F6 27 03 5C      [ 2]    1     subw y,#CELL_SIZE
      009843 20 FA            [ 1]    2     ld (y),a 
      009845 5C 72 B0         [ 2]    3     ldw (1,y),x 
      009848 00 05            [ 2] 1376 	jra 1$ 
      00984A CF 00            [ 1] 1377 8$:	ld a,#TK_INTGR 
      001C4B                       1378 9$:	_drop VSIZE 
      00984C 01 81            [ 2]    1     addw sp,#VSIZE 
      00984E 81               [ 4] 1379 	ret 
                                   1380 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



                                   1381 
                                   1382 ;--------------------------------------------
                                   1383 ; BASIC: HEX 
                                   1384 ; select hexadecimal base for integer print
                                   1385 ;---------------------------------------------
      001C4E                       1386 hex_base:
      00984E FE 72 5C 00      [ 1] 1387 	mov base,#16 
      009852 02               [ 4] 1388 	ret 
                                   1389 
                                   1390 ;--------------------------------------------
                                   1391 ; BASIC: DEC 
                                   1392 ; select decimal base for integer print
                                   1393 ;---------------------------------------------
      001C53                       1394 dec_base:
      009853 72 5C 00 02      [ 1] 1395 	mov base,#10
      009857 81               [ 4] 1396 	ret 
                                   1397 
                                   1398 ;------------------------
                                   1399 ; BASIC: FREE 
                                   1400 ; return free size in RAM 
                                   1401 ; output:
                                   1402 ;   A:x		size 
                                   1403 ;--------------------------
      009858                       1404 free:
      009858 F6               [ 1] 1405 	clr a 
      009859 EE 01 72         [ 2] 1406 	ldw x,#tib 
      00985C 5C 00 02 72      [ 2] 1407 	subw x,dvar_end 
      009860 5C               [ 4] 1408 	ret 
                                   1409 
                                   1410 ;------------------------------
                                   1411 ; BASIC: SIZE 
                                   1412 ; command that print 
                                   1413 ; program start addres and size 
                                   1414 ;------------------------------
      001C61                       1415 cmd_size:
      009861 00 02 72         [ 1] 1416 	push base 
      009864 5C 00 02         [ 2] 1417 	ldw x,#PROG_ADDR 
      009867 81 09 68         [ 4] 1418 	call puts 
      009868 CE 00 1B         [ 2] 1419 	ldw x,txtbgn     
      009868 F6 72 5C 00      [ 1] 1420 	mov base,#16 
      00986C 02 81 EE         [ 4] 1421 	call prt_i16
      00986E 32 00 0A         [ 1] 1422 	pop base 
      00986E 72 5F 00         [ 2] 1423 	ldw x,#PROG_SIZE 
      009871 0D CF 00         [ 4] 1424 	call puts 
      009874 0E A6 10         [ 2] 1425 	ldw x,txtend 
      009877 C1 00 0B 27      [ 2] 1426 	subw x,txtbgn 
      00987B 09 72 0F         [ 4] 1427 	call prt_i16
      00987E 00 0E 04         [ 2] 1428 	ldw x,#STR_BYTES 
      009881 72 53 00         [ 4] 1429 	call puts  
      009884 0D               [ 4] 1430 	ret 
                                   1431 
                                   1432 
                                   1433 ;------------------------
                                   1434 ; BASIC: UBOUND  
                                   1435 ; return array variable size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1436 ; and set 'array_size' variable 
                                   1437 ; output:
                                   1438 ;   A:X 	array_size
                                   1439 ;--------------------------
      009885                       1440 ubound:
      009885 A6 FF CD         [ 4] 1441 	call free 
      009888 98 AB            [ 1] 1442 	ld a,#CELL_SIZE 
      00988A CD               [ 2] 1443 	div x,a 
      00988B 91 C0 88         [ 2] 1444 	ldw array_size,x
      00988E CD               [ 1] 1445 	clr a 
      00988F 89               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;-----------------------------
                                   1449 ; BASIC: LET var=expr 
                                   1450 ; variable assignement 
                                   1451 ; output:
                                   1452 ;   A 		TK_NONE 
                                   1453 ;-----------------------------
      001C99                       1454 let::
      009890 E8 84 81         [ 4] 1455 	call next_token 
      009893 A1 85            [ 1] 1456 	cp a,#TK_VAR 
      009893 90 F6            [ 1] 1457 	jreq let_var
      009895 93 EE            [ 1] 1458 	cp a,#TK_ARRAY 
      009897 01 72            [ 1] 1459 	jreq  let_array
      009899 A9 00 03         [ 2] 1460 	jp syntax_error
      001CA7                       1461 let_array:
      00989C C7 00 0D         [ 4] 1462 	call get_array_element
      00989F CF 00            [ 2] 1463 	jra let_eval 
      001CAC                       1464 let_var:
      0098A1 0E CD 98         [ 4] 1465 	call get_addr
      001CAF                       1466 let_eval:
      0098A4 85 A6 20         [ 2] 1467 	ldw ptr16,x  ; variable address 
      0098A7 CD 89 8B         [ 4] 1468 	call next_token 
      0098AA 81 32            [ 1] 1469 	cp a,#TK_EQUAL
      0098AB 27 03            [ 1] 1470 	jreq 1$
      0098AB 52 04 0F         [ 2] 1471 	jp syntax_error
      001CBC                       1472 1$:	
      0098AE 02 0F 01         [ 4] 1473 	call condition   
      0098B1 4D 27            [ 1] 1474 	cp a,#TK_INTGR 
      0098B3 11 C6            [ 1] 1475 	jreq 2$
      0098B5 00 0B A1         [ 2] 1476 	jp syntax_error
      001CC6                       1477 2$:	
      001CC6                       1478 	_xpop ; value 
      0098B8 0A 26            [ 1]    1     ld a,(y)
      0098BA 0A               [ 1]    2     ldw x,y 
      0098BB 72 0F            [ 2]    3     ldw x,(1,x)
      0098BD 00 0D 05 03      [ 2]    4     addw y,#CELL_SIZE 
      001CCF                       1479 3$:
      0098C1 01 CD 82 98      [ 4] 1480 	ld [ptr16],a
      0098C5 72 5C 00 1A      [ 1] 1481 	inc ptr8  
      0098C5 AE 16 90 1C      [ 5] 1482 	ldw [ptr16],x 
      0098C9 00               [ 4] 1483 	ret 
                                   1484 
                                   1485 
                                   1486 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   1487 ; return constant/dvar value 
                                   1488 ; from it's record address
                                   1489 ; input:
                                   1490 ;	X	*const record 
                                   1491 ; output:
                                   1492 ;   A:X   const  value
                                   1493 ;--------------------------
      001CDC                       1494 get_value: ; -- i 
      0098CA 50               [ 1] 1495 	ld a,(x) ; record size 
      0098CB 5A 7F            [ 1] 1496 	sub a,#CELL_SIZE ; * value 
      0098CD 88               [ 1] 1497 	push a 
      0098CD C6 00            [ 1] 1498 	push #0 
      0098CF 0B CD 83         [ 2] 1499 	addw x,(1,sp)
      0098D2 64               [ 1] 1500 	ld a,(x)
      0098D3 AB 30            [ 2] 1501 	ldw x,(1,x)
      001CE8                       1502 	_drop 2
      0098D5 A1 3A            [ 2]    1     addw sp,#2 
      0098D7 2B               [ 4] 1503 	ret 
                                   1504 
                                   1505 
                                   1506 ;--------------------------
                                   1507 ; list constants in EEPROM 
                                   1508 ; call when using LIST \C 
                                   1509 ;-------------------------
                           000001  1510 	COUNT=1
                           000003  1511 	YTEMP=3
                           000004  1512 	VSIZE=4 
      001CEB                       1513 list_const:
      0098D8 02 AB            [ 2] 1514 	pushw y 
      001CED                       1515 	_vars 4 
      0098DA 07 04            [ 2]    1     sub sp,#4 
      0098DB 5F               [ 1] 1516 	clrw x 
      0098DB 5A F7            [ 2] 1517 	ldw (COUNT,sp),x  
      0098DD 0C 02 C6 00      [ 2] 1518 	ldw Y,#EEPROM_BASE 
      0098E1 0D CA 00 0E      [ 2] 1519 1$:	cpw y,free_eeprom 
      0098E5 CA 00            [ 1] 1520 	jruge 9$
      0098E7 0F 26            [ 2] 1521     ldw (YTEMP,sp),y 
      0098E9 E3               [ 1] 1522 	ldw x,y
      0098EA C6               [ 1] 1523 	incw x 
      0098EB 00 0B A1         [ 4] 1524 	call puts  
      0098EE 10 27            [ 1] 1525 	ld a,#'= 
      0098F0 08 7B 01         [ 4] 1526 	call putc 
      0098F3 27 0A            [ 2] 1527 	ldw x,(YTEMP,sp)
      0098F5 A6 2D 20         [ 4] 1528 	call get_value 
      0098F8 02 00 0C         [ 1] 1529 	ld acc24,a 
      0098F9 CF 00 0D         [ 2] 1530 	ldw acc16,x 
      0098F9 A6 24 5A         [ 4] 1531 	call prt_acc24
      0098FC F7 0C            [ 1] 1532 	ld a,#CR 
      0098FE 02 09 0B         [ 4] 1533 	call putc 
      0098FF 1E 01            [ 2] 1534 	ldw x,(COUNT,sp)
      0098FF 7B               [ 1] 1535 	incw x 
      009900 02 5B            [ 2] 1536 	ldw (COUNT,sp),x 
      009902 04 81 00 0D      [ 1] 1537 	clr acc16 
      009904 16 03            [ 2] 1538 	ldw y,(YTEMP,sp)
      009904 A1 61            [ 1] 1539 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009906 2A 01 81         [ 1] 1540 	ld acc8,a
      009909 A1 7A 22 FB      [ 2] 1541 	addw y,acc16 
      00990D A0 20            [ 2] 1542 	jra 1$ 
      001D31                       1543 9$:	
      00990F 81 01            [ 2] 1544 	ldw x,(COUNT,sp)
      009910 CD 17 EE         [ 4] 1545 	call prt_i16 
      009910 52 05 1F         [ 2] 1546 	ldw x,#CONST_COUNT 
      009913 04 4F 5F         [ 4] 1547 	call puts 
      001D3C                       1548 	_drop VSIZE 
      009916 72 A2            [ 2]    1     addw sp,#VSIZE 
      009918 00 03            [ 2] 1549 	popw y 
      00991A 90               [ 4] 1550 	ret 
                                   1551 
      00991B F7 90 EF 01 0F 01 A6  1552 CONST_COUNT: .asciz " constants in EEPROM\n"
             0A 6B 02 1E 04 F6 27
             4E A1 2D 26 04 03 01
             20
                                   1553 
                                   1554 
                                   1555 ;--------------------------
                                   1556 ; BASIC: EEFREE 
                                   1557 ; eeprom_free 
                                   1558 ; search end of data  
                                   1559 ; in EEPROM 
                                   1560 ; input:
                                   1561 ;    none 
                                   1562 ; output:
                                   1563 ;    A:X     address free
                                   1564 ;-------------------------
      001D57                       1565 func_eefree:
      009931 08 A1 24         [ 2] 1566 	ldw x,#EEPROM_BASE 
      009934 26 08 A6 10      [ 1] 1567 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009938 6B 02 5C         [ 2] 1568     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      00993B 1F 04            [ 1] 1569 	jruge 8$ ; no free space 
      00993D F6               [ 1] 1570 2$: ld a,(x)
      00993E 26 0C            [ 1] 1571 	jrne 3$
      00993E A1               [ 1] 1572 	incw x 
      00993F 61 2B 02 A0      [ 1] 1573 	dec acc8 
      009943 20 A1            [ 1] 1574 	jrne 2$
      009945 30 2B 30         [ 2] 1575 	subw x,#8 
      009948 A0 30            [ 2] 1576 	jra 9$  
      00994A A1               [ 1] 1577 3$: ld a,(x)
      00994B 0A               [ 1] 1578 	incw x
      00994C 2B               [ 1] 1579 	tnz a  
      00994D 06 A0            [ 1] 1580 	jrne 3$
      00994F 07               [ 2] 1581 	decw x   
      009950 11 02            [ 2] 1582 	jra 1$ 
      009952 2A               [ 1] 1583 8$: clrw x ; no free space 
      009953 24               [ 1] 1584 9$: clr a 
      009954 6B 03 7B         [ 2] 1585 	ldw free_eeprom,x ; save in system variable 
      009957 02               [ 4] 1586 	ret 
                                   1587 
                           000005  1588 REC_XTRA_BYTES=5 
                                   1589 ;--------------------------
                                   1590 ; search constant/dim_var name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1591 ; format of record  
                                   1592 ;   .byte record length 
                                   1593 ;         = strlen(name)+5 
                                   1594 ;   .asciz name (variable length)
                                   1595 ;   .int24 value (3 bytes )
                                   1596 ; a constant record use 7+ bytes
                                   1597 ; constants are saved in EEPROM  
                                   1598 ; input:
                                   1599 ;    X     *name
                                   1600 ;    Y     search from address 
                                   1601 ; output:
                                   1602 ;    X     address|0
                                   1603 ; use:
                                   1604 ;   A,Y, acc16 
                                   1605 ;-------------------------
                           000001  1606 	NAMEPTR=1 ; target name pointer 
                           000003  1607 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1608 	RECLEN=5  ; record length of target
                           000007  1609 	LIMIT=7   ; search area limit 
                           000008  1610 	VSIZE=8  
      001D80                       1611 search_name:
      001D80                       1612 	_vars VSIZE
      009958 CD 82            [ 2]    1     sub sp,#VSIZE 
      00995A B5 72 A2 00      [ 1] 1613 	clr acc16 
      00995E 03 90 F7         [ 4] 1614 	call strlen 
      009961 90 EF            [ 1] 1615 	add a,#REC_XTRA_BYTES
      009963 01 5F            [ 1] 1616 	ld (RECLEN,sp),a    
      009965 7B 03            [ 2] 1617 	ldw (NAMEPTR,sp),x
      009967 02 72 A2 00      [ 2] 1618 	cpw y,#EEPROM_BASE 
      00996B 03 90            [ 1] 1619 	jrult 0$ 
      00996D F7 90 EF         [ 2] 1620 	ldw x,free_eeprom 
      009970 01 CD            [ 2] 1621 	jra 10$ 
      009972 81 F9 1E         [ 2] 1622 0$: ldw x,dvar_end 
      001D9D                       1623 10$: 
      009975 04 20            [ 2] 1624 	ldw (LIMIT,sp),x 
      009977 C2 0D            [ 2] 1625 1$:	ldw (WLKPTR,sp),y
      009979 01               [ 1] 1626 	ldw x,y 
      00997A 27 03            [ 2] 1627 	cpw x, (LIMIT,sp) 
      00997C CD 82            [ 1] 1628 	jruge 7$ ; no match found 
      00997E 7E F6            [ 1] 1629 	ld a,(y)
      00997F 11 05            [ 1] 1630 	cp a,(RECLEN,sp)
      00997F 90 F6            [ 1] 1631 	jrne 2$ 
      009981 93 EE            [ 1] 1632 	incw y 
      009983 01 72            [ 2] 1633 	ldw x,(NAMEPTR,sp)
      009985 A9 00 03         [ 4] 1634 	call strcmp
      009988 C7 00            [ 1] 1635 	jrne 8$ ; match found 
      001DB5                       1636 2$: ; skip this one 	
      00998A 0D CF            [ 2] 1637 	ldW Y,(WLKPTR,sp)
      00998C 00 0E            [ 1] 1638 	ld a,(y)
      00998E 5B 05 81         [ 1] 1639 	ld acc8,a 
      009991 72 B9 00 0D      [ 2] 1640 	addw y,acc16 
      009991 52 05            [ 2] 1641 	jra 1$  
      001DC2                       1642 7$: ; no match found 
      009993 17 04            [ 1] 1643 	clr (WLKPTR,sp)
      009995 0F 04            [ 1] 1644 	clr (WLKPTR+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      001DC6                       1645 8$: ; match found 
      009995 1F 02            [ 2] 1646 	ldw x,(WLKPTR,sp) ; record address 
      001DC8                       1647 9$:	_DROP VSIZE
      009997 F6 A4            [ 2]    1     addw sp,#VSIZE 
      009999 0F               [ 4] 1648 	 ret 
                                   1649 
                                   1650 
                                   1651 ;--------------------------------------------
                                   1652 ; BASIC: CONST name=value [, name=value]*
                                   1653 ; define constant(s) saved in EEPROM
                                   1654 ;--------------------------------------------
                           000001  1655 	CNAME=1 
                           000003  1656 	BUFPTR=3
                           000005  1657 	RECLEN=5
                           000006  1658 	UPDATE=6
                           000007  1659 	YSAVE=7
                           000008  1660 	VSIZE=8 
      001DCB                       1661 cmd_const:
      00999A 6B 01            [ 2] 1662 	pushw y 
      001DCD                       1663 	_vars VSIZE 
      00999C 16 04            [ 2]    1     sub sp,#VSIZE 
      00999E 5C 06            [ 1] 1664 	clr (UPDATE,sp)
      00999F CD 17 A6         [ 4] 1665 	call next_token 
      00999F 90 F6            [ 1] 1666 	cp a,#TK_CHAR 
      0099A1 27 1B            [ 1] 1667 	jrne 0$
      0099A3 0D 01 27         [ 4] 1668 	call get_char 
      0099A6 0A F1            [ 1] 1669 	and a,#0xDF 
      0099A8 26 07            [ 1] 1670 	cp a,#'U 
      0099AA 90 5C            [ 1] 1671 	jrne 1$
      0099AC 5C 0A            [ 1] 1672 	cpl (UPDATE,sp)
      0099AE 01 20            [ 2] 1673 	jra const_loop 
      0099B0 EE 03            [ 1] 1674 0$: cp a,#TK_LABEL 
      0099B1 27 08            [ 1] 1675 	jreq cloop_1
      0099B1 1E 02 1D         [ 2] 1676 1$: jp syntax_error
      001DEC                       1677 const_loop: 
      0099B4 00 02            [ 1] 1678 	ld a,#TK_LABEL 
      0099B6 4B 00 FE         [ 4] 1679 	call expect  
      001DF1                       1680 cloop_1: 
      0099B9 84 27            [ 2] 1681 	ldw (CNAME,sp),x ; *const_name
      0099BB 1D 20 D7         [ 4] 1682 	call skip_string
      0099BE 1E 01            [ 2] 1683 	ldw x,(CNAME,sp)
      0099BE 1E 02 F6         [ 4] 1684 	call strlen  
      0099C1 6B 01            [ 1] 1685 	add a,#REC_XTRA_BYTES 
      0099C3 A4 0F            [ 1] 1686 	ld (RECLEN,sp),a 
                                   1687 ; copy name in buffer  
      0099C5 4C C7            [ 2] 1688 	ldw y,(CNAME,sp) 
      0099C7 00 0F 72         [ 2] 1689 	ldw x,#tib  
      0099CA 5F 00            [ 1] 1690 	ld a,(RECLEN,sp)
      0099CC 0E               [ 1] 1691 	ld (x),a 
      0099CD 72               [ 1] 1692 	incw x  
      0099CE BB 00 0E         [ 4] 1693 	call strcpy 
      0099D1 FE 7B            [ 2] 1694 	ldw (BUFPTR,sp),x 
                                   1695 ; x not updated by strcpy 
                                   1696 ; BUFPTR must be incremented 
                                   1697 ; to point after name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      0099D3 01               [ 1] 1698 	clrw x 
      0099D4 A4 F0            [ 1] 1699 	ld a,(RECLEN,sp)
      0099D6 4E AB            [ 1] 1700 	sub a,#REC_XTRA_BYTES-1
      0099D8 80               [ 1] 1701 	ld xl,a  
      0099D9 72 FB 03         [ 2] 1702 	addw x,(BUFPTR,sp)
      0099D9 5B 05            [ 2] 1703 	ldw (BUFPTR,sp),x 
      0099DB 81 32            [ 1] 1704 	ld a,#TK_EQUAL 
      0099DC CD 19 5C         [ 4] 1705 	call expect 
      0099DC 88 CD            [ 2] 1706 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099DE 98 26 11         [ 4] 1707 	call expression 
      0099E1 01 27            [ 1] 1708 	cp a,#TK_INTGR 
      0099E3 03 CC            [ 1] 1709 	jreq 5$ 
      0099E5 96 C8 84         [ 2] 1710 	jp syntax_error 
      001E29                       1711 5$:	_xpop 
      0099E8 81 F6            [ 1]    1     ld a,(y)
      0099E9 93               [ 1]    2     ldw x,y 
      0099E9 A6 06            [ 2]    3     ldw x,(1,x)
      0099EB CD 99 DC 03      [ 2]    4     addw y,#CELL_SIZE 
      0099EE 17 07            [ 2] 1712 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099EE 4B 00            [ 2] 1713 	ldw y,(BUFPTR,sp)
      0099F0 CD 9C            [ 1] 1714 	ld (y),a 
      0099F2 5A 4D 27         [ 2] 1715 	ldw (1,y),x 
                                   1716 ; record completed in buffer 
                                   1717 ; check if constant already exist 
                                   1718 ; if exist and \U option then update  
      0099F5 12 0C 01 CD      [ 1] 1719 	clr farptr 
      0099F9 98 26            [ 2] 1720 	ldw x,(CNAME,sp)
      0099FB A1 08 27 F1      [ 2] 1721 	ldw y,#EEPROM_BASE
      0099FF A1 07 27         [ 4] 1722 	call search_name 
      009A02 05               [ 2] 1723 	tnzw x 
      009A03 55 00            [ 1] 1724 	jreq 6$ ; new constant  
      009A05 03 00            [ 1] 1725 	tnz (UPDATE,sp)
      009A07 02 84            [ 1] 1726 	jreq 8$ 
      009A09 81 03            [ 2] 1727 	jra 7$	
      009A0A                       1728 6$:	
      009A0A CD 99 E9         [ 2] 1729 	ldw x,free_eeprom  
      001E54                       1730 7$:	
      009A0D A1 01 27         [ 2] 1731 	ldw farptr+1,x 
      009A10 03 CC 96         [ 2] 1732 	ldw x,#tib 
      009A13 C8 90            [ 1] 1733 	ld a,(RECLEN,sp)
      009A15 F6 93 EE         [ 4] 1734 	call write_nbytes
      009A18 01 72            [ 1] 1735 	tnz (UPDATE,sp)
      009A1A A9 00            [ 1] 1736 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1737 ; update free_eeprom 
      009A1C 03               [ 1] 1738 	clrw x 
      009A1D C3 00            [ 1] 1739 	ld a,(RECLEN,sp)
      009A1F 21               [ 1] 1740 	ld xl,a 
      009A20 23 05 A6 0A      [ 2] 1741 	addw x,free_eeprom 
      009A24 CC 96 CA         [ 2] 1742 	ldw free_eeprom,x
      001E6E                       1743 8$: ; check for next constant 
      009A27 5D 27 F8         [ 4] 1744 	call next_token 
      009A2A 89 58            [ 1] 1745 	cp a,#TK_COMMA 
      009A2C 72 FB            [ 1] 1746 	jrne 9$ ; no other constant 
      009A2E 01 1F 01         [ 2] 1747 	jp const_loop 
      001E78                       1748 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      001E78                       1749 	_unget_token    
      009A31 AE 16 90 72 F0   [ 1]    1      mov in,in.saved  
      001E7D                       1750 10$: 
      001E7D                       1751 	_drop VSIZE 
      009A36 01 5B            [ 2]    1     addw sp,#VSIZE 
      009A38 02 81            [ 2] 1752 	popw y ; restore xstack pointer 
      009A3A 81               [ 4] 1753 	ret 
                                   1754 
                                   1755 ;---------------------------------
                                   1756 ; BASIC: DIM var_name [var_name]* 
                                   1757 ; create named variables at end 
                                   1758 ; of BASIC program. 
                                   1759 ; These variables are initialized 
                                   1760 ; to 0. 
                                   1761 ; record format same ast CONST 
                                   1762 ; but r/w because stored in RAM 
                                   1763 ;---------------------------------
                           000001  1764 	VAR_NAME=1 
                           000003  1765 	REC_LEN=3 
                           000004  1766 	VSIZE=4 
      001E82                       1767 cmd_dim:
      009A3A 52 01 0F 01 CD   [ 2] 1768 	btjt flags,#FRUN,cmd_dim1
      009A3F 98 26            [ 1] 1769 	ld a,#ERR_RUN_ONLY
      009A41 4D 26 03         [ 2] 1770 	jp tb_error 
      001E8C                       1771 cmd_dim1:	
      009A44 CC 9A            [ 2] 1772 	pushw y 
      001E8E                       1773 	_vars VSIZE
      009A46 FB A1            [ 2]    1     sub sp,#VSIZE 
      009A48 10 27            [ 1] 1774 	clr (REC_LEN,sp ) 
      009A4A 06 A1 11         [ 4] 1775 0$:	call next_token 
      009A4D 26 05            [ 1] 1776 	cp a,#TK_LABEL  
      009A4F 03 01            [ 1] 1777 	jreq 1$ 
      009A51 CC 16 48         [ 2] 1778 	jp syntax_error 
      009A51 CD 98            [ 2] 1779 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009A53 26 13 86         [ 4] 1780 	call strlen 
      009A54 AB 05            [ 1] 1781 	add a,#REC_XTRA_BYTES
      009A54 4D 26            [ 1] 1782 	ld (REC_LEN+1,sp),a
      009A56 03 CC 96         [ 4] 1783 	call skip_string 
      009A59 C8 01            [ 2] 1784 	ldw x,(VAR_NAME,sp) 
      009A5A 90 CE 00 30      [ 2] 1785 	ldw y,dvar_bgn 
      009A5A A1 81 26         [ 4] 1786 	call search_name  
      009A5D 0C               [ 2] 1787 	tnzw x 
      009A5E FE 72            [ 1] 1788 	jrne 4$ ; already exist 	
      009A60 5C 00 02         [ 2] 1789 	ldw x,dvar_end 
      009A63 72 5C            [ 1] 1790 	ld a,(REC_LEN+1,sp)
      009A65 00               [ 1] 1791 	ld (x),a 
      009A66 02               [ 1] 1792 	incw x 
      009A67 FD 20            [ 2] 1793 	ldw y,(VAR_NAME,sp)
      009A69 7F 13 A2         [ 4] 1794 	call strcpy
      009A6A 5A               [ 2] 1795 	decw x 
      009A6A A1 84 26         [ 2] 1796 	addw x,(REC_LEN,sp)
      009A6D 05 CD 98         [ 2] 1797 	ldw dvar_end,x 
      009A70 58 20 76         [ 2] 1798 	subw x,#CELL_SIZE  
      009A73 7F               [ 1] 1799 	clr (x)
      009A73 A1 05            [ 1] 1800 	clr (1,x)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009A75 26 05            [ 1] 1801 	clr (2,x)
      009A77 CD 9A 0A         [ 4] 1802 4$: call next_token 
      009A7A 20 07            [ 1] 1803 	cp a,#TK_COMMA 
      009A7C 27 BC            [ 1] 1804 	jreq 0$ 
      009A7C A1 85            [ 1] 1805 	cp a,#TK_EQUAL 
      009A7E 26 08            [ 1] 1806 	jrne 8$
                                   1807 ; initialize variable 
      009A80 CD 98 4E         [ 4] 1808 	call condition 
      009A83 A1 84            [ 1] 1809 	cp a,#TK_INTGR
      009A83 F6 EE            [ 1] 1810 	jreq 5$
      009A85 01 20 61         [ 2] 1811 	jp syntax_error
      009A88 CE 00 32         [ 2] 1812 5$: ldw x,dvar_end 
      009A88 A1 03 26         [ 2] 1813 	subw x,#CELL_SIZE 
      009A8B 2C 90 89         [ 2] 1814 	ldw ptr16,x 
      001EED                       1815 	_xpop 
      009A8E 89 CD            [ 1]    1     ld a,(y)
      009A90 98               [ 1]    2     ldw x,y 
      009A91 3F 1E            [ 2]    3     ldw x,(1,x)
      009A93 01 90 AE 40      [ 2]    4     addw y,#CELL_SIZE 
      009A97 00 CD 9E 00      [ 4] 1816 	ld [ptr16],a 
      009A9B 5D 26 11 90      [ 1] 1817 	inc ptr8 
      009A9F CE 00 31 1E      [ 5] 1818 	ldw [ptr16],x 
      009AA3 01 CD            [ 2] 1819 	jra 4$ 
      001F04                       1820 8$:	
      001F04                       1821 	_unget_token 	
      009AA5 9E 00 5D 26 05   [ 1]    1      mov in,in.saved  
      001F09                       1822 	_drop VSIZE 
      009AAA 85 90            [ 2]    1     addw sp,#VSIZE 
      009AAC 85 20 32         [ 4] 1823 	call ubound 
      009AAF 90 85            [ 2] 1824 	popw y 
      009AAF 5B               [ 4] 1825 	ret 
                                   1826 
                                   1827 
                                   1828 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1829 ; return program size 
                                   1830 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001F11                       1831 prog_size:
      009AB0 02 90 85         [ 2] 1832 	ldw x,txtend 
      009AB3 CD 9D 5C 20      [ 2] 1833 	subw x,txtbgn 
      009AB7 31               [ 4] 1834 	ret 
                                   1835 
                                   1836 ;----------------------------
                                   1837 ; print program information 
                                   1838 ;---------------------------
      009AB8                       1839 program_info: 
      009AB8 A1 82 26         [ 2] 1840 	ldw x,#PROG_ADDR 
      009ABB 0E FE 72         [ 4] 1841 	call puts 
      009ABE 5C 00 02         [ 2] 1842 	ldw x,txtbgn 
      009AC1 72 5C 00 02      [ 1] 1843 	mov base,#16 
      009AC5 FD 5F 02         [ 4] 1844 	call prt_i16
      009AC8 20 1F 00 0A      [ 1] 1845 	mov base,#10  
      009ACA AE 1F 6A         [ 2] 1846 	ldw x,#PROG_SIZE
      009ACA A1 06 26         [ 4] 1847 	call puts 
      009ACD 13 CD 9B         [ 4] 1848 	call prog_size 
      009AD0 41 A6 07         [ 4] 1849 	call prt_i16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009AD3 CD 99 DC         [ 2] 1850 	ldw x,#STR_BYTES 
      009AD6 90 F6 93         [ 4] 1851 	call puts
      009AD9 EE 01 72         [ 2] 1852 	ldw x,txtbgn
      009ADC A9 00 03         [ 2] 1853 	cpw x,#app 
      009ADF 20 08            [ 1] 1854 	jrult 2$
      009AE1 AE 1F 82         [ 2] 1855 	ldw x,#FLASH_MEM 
      009AE1 55 00            [ 2] 1856 	jra 3$
      009AE3 03 00 02         [ 2] 1857 2$: ldw x,#RAM_MEM 	 
      009AE6 4F 20 12         [ 4] 1858 3$:	call puts 
      009AE9 A6 0D            [ 1] 1859 	ld a,#CR 
      009AE9 0D 01 27         [ 4] 1860 	call putc
      009AEC 03               [ 4] 1861 	ret 
                                   1862 
      009AED CD 82 90 67 72 61 6D  1863 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009AF0 2C 20 70 72 6F 67 72  1864 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009AF0 72 A2 00 03 90 F7 90  1865 STR_BYTES: .asciz " bytes" 
      009AF7 EF 01 A6 84 46 4C 41  1866 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009AFB 20 69 6E 20 52 41 4D  1867 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1868 
                                   1869 
                                   1870 ;----------------------------
                                   1871 ; BASIC: LIST [[start][,end]]
                                   1872 ; list program lines 
                                   1873 ; form start to end 
                                   1874 ; if empty argument list then 
                                   1875 ; list all.
                                   1876 ;----------------------------
                           000001  1877 	FIRST=1
                           000003  1878 	LAST=3 
                           000005  1879 	LN_PTR=5
                           000006  1880 	VSIZE=6 
      001FA2                       1881 list:
      009AFB 5B 01 81 22 05   [ 2] 1882 	btjf flags,#FRUN,0$
      009AFE A6 07            [ 1] 1883 	ld a,#ERR_CMD_ONLY
      009AFE 52 01 CD         [ 2] 1884 	jp tb_error
      001FAC                       1885 0$:	 
      009B01 9A 3A 4D         [ 4] 1886 	call next_token 
      009B04 27 38            [ 1] 1887 	cp a,#TK_CHAR 
      009B06 26 10            [ 1] 1888 	jrne 2$
      009B06 CD 98 26         [ 4] 1889 	call get_char 
      009B09 6B 01            [ 1] 1890 	and a,#0xDF 
      009B0B A4 30            [ 1] 1891 	cp a,#'C 
      009B0D A1 20            [ 1] 1892 	jrne 1$
      009B0F 27 09 A6         [ 4] 1893 	call list_const
      009B12 84               [ 4] 1894 	ret 
      009B13 55 00 03         [ 2] 1895 1$: jp syntax_error 
      001FC3                       1896 2$:	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B16 00 02 20 24 01   [ 1]    1      mov in,in.saved  
      009B1A CD 1F 11         [ 4] 1897 	call prog_size 
      009B1A CD 9A            [ 1] 1898 	jrugt 3$
      009B1C 3A               [ 4] 1899 	ret 
      001FCE                       1900 3$: _vars VSIZE
      009B1D 4D 26            [ 2]    1     sub sp,#VSIZE 
      009B1F 03 CC 96         [ 2] 1901 	ldw x,txtbgn 
      009B22 C8 05            [ 2] 1902 	ldw (LN_PTR,sp),x 
      009B23 FE               [ 2] 1903 	ldw x,(x) 
      009B23 7B 01            [ 2] 1904 	ldw (FIRST,sp),x ; list from first line 
      009B25 A1 20 26         [ 2] 1905 	ldw x,#MAX_LINENO ; biggest line number 
      009B28 05 CD            [ 2] 1906 	ldw (LAST,sp),x 
      009B2A 82 F4 20         [ 4] 1907 	call arg_list
      009B2D D8               [ 1] 1908 	tnz a
      009B2E A1 21            [ 1] 1909 	jreq list_loop 
      009B30 26 05            [ 1] 1910 	cp a,#2 
      009B32 CD 83            [ 1] 1911 	jreq 4$
      009B34 82 20            [ 1] 1912 	cp a,#1 
      009B36 CF 06            [ 1] 1913 	jreq first_line 
      009B37 CC 16 48         [ 2] 1914 	jp syntax_error 
      009B37 CD               [ 2] 1915 4$:	popw x 
      009B38 84 1C            [ 2] 1916 	ldw (LAST+2,sp),x 
      001FF1                       1917 first_line:
      009B3A 20               [ 2] 1918 	popw x
      009B3B CA 01            [ 2] 1919 	ldw (FIRST,sp),x 
      009B3C                       1920 lines_skip:
      009B3C A6 84 1B         [ 2] 1921 	ldw x,txtbgn
      009B3E 1F 05            [ 2] 1922 2$:	ldw (LN_PTR,sp),x 
      009B3E 5B 01 81         [ 2] 1923 	cpw x,txtend 
      009B41 2A 38            [ 1] 1924 	jrpl list_exit 
      009B41 52               [ 2] 1925 	ldw x,(x) ;line# 
      009B42 01 CD            [ 2] 1926 	cpw x,(FIRST,sp)
      009B44 9A FE            [ 1] 1927 	jrpl list_loop 
      009B46 4D 27            [ 2] 1928 	ldw x,(LN_PTR,sp) 
      009B48 2D 02            [ 1] 1929 	ld a,(2,x)
      009B49 C7 00 0E         [ 1] 1930 	ld acc8,a 
      009B49 CD 98 26 6B      [ 1] 1931 	clr acc16 
      009B4D 01 A4 30 A1      [ 2] 1932 	addw x,acc16
      009B51 10 27            [ 2] 1933 	jra 2$ 
                                   1934 ; print loop
      002014                       1935 list_loop:
      009B53 09 55            [ 2] 1936 	ldw x,(LN_PTR,sp)
      009B55 00 03            [ 1] 1937 	ld a,(2,x) 
      009B57 00 02 A6         [ 4] 1938 	call prt_basic_line
      009B5A 84 20            [ 2] 1939 	ldw x,(LN_PTR,sp)
      009B5C 19 02            [ 1] 1940 	ld a,(2,x)
      009B5D C7 00 0E         [ 1] 1941 	ld acc8,a 
      009B5D CD 9A FE 4D      [ 1] 1942 	clr acc16 
      009B61 26 03 CC 96      [ 2] 1943 	addw x,acc16
      009B65 C8 00 1D         [ 2] 1944 	cpw x,txtend 
      009B66 2A 07            [ 1] 1945 	jrpl list_exit
      009B66 7B 01            [ 2] 1946 	ldw (LN_PTR,sp),x
      009B68 A1               [ 2] 1947 	ldw x,(x)
      009B69 10 26            [ 2] 1948 	cpw x,(LAST,sp)  
      009B6B 05 CD            [ 1] 1949 	jrslt list_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      002036                       1950 list_exit:
      009B6D 81 F9 20 D8 01   [ 1] 1951 	mov in,count 
      009B71 AE 16 E0         [ 2] 1952 	ldw x,#pad 
      009B71 CD 82 16         [ 2] 1953 	ldw basicptr,x 
      002041                       1954 	_drop VSIZE 
      009B74 20 D3            [ 2]    1     addw sp,#VSIZE 
      009B76 CD 1F 19         [ 4] 1955 	call program_info 
      009B76 5B               [ 4] 1956 	ret
                                   1957 
                                   1958 
                                   1959 ;--------------------------
                                   1960 ; BASIC: EDIT 
                                   1961 ;  copy program in FLASH 
                                   1962 ;  to RAM for edition 
                                   1963 ;-------------------------
      002047                       1964 edit:
      009B77 01 81 97         [ 4] 1965 	call qsign 
      009B79 27 07            [ 1] 1966 	jreq 1$ 
      009B79 52 01 CD         [ 2] 1967 	ldw x,#NOT_SAVED 
      009B7C 9B 41 4D         [ 4] 1968 	call puts 
      009B7F 27               [ 4] 1969 	ret 
      002053                       1970 1$: 
      009B80 54 CD 98 26      [ 2] 1971 	ldw y,#app_sign ; source address 
      009B84 6B 01 A4         [ 2] 1972     ldw x,app_size  
      009B87 30 A1 30         [ 2] 1973 	addw x,#4 
      009B8A 27 09 A6         [ 2] 1974 	ldw acc16,x  ; bytes to copy 
      009B8D 84 55 00         [ 2] 1975 	ldw x,#rsign ; destination address 
      009B90 03 00 02         [ 4] 1976 	call move  
      009B93 20 40 90         [ 2] 1977 	ldw x,#free_ram 
      009B95 CF 00 1B         [ 2] 1978 	ldw txtbgn,x 
      009B95 CD 9B 41 4D      [ 2] 1979 	addw x,rsize  
      009B99 26 03 CC         [ 2] 1980 	ldw txtend,x 
      009B9C 96               [ 4] 1981 	ret 
                                   1982 
      009B9D C8 6F 20 61 70 70 6C  1983 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1984 
                                   1985 
                                   1986 ;--------------------------
                                   1987 ; decompile line from token list
                                   1988 ; and print it. 
                                   1989 ; input:
                                   1990 ;   A       stop at this position 
                                   1991 ;   X 		pointer at line
                                   1992 ; output:
                                   1993 ;   none 
                                   1994 ;--------------------------	
      009B9E                       1995 prt_basic_line:
      009B9E CD 82            [ 2] 1996 	pushw y 
      009BA0 33 90 F6         [ 1] 1997 	ld count,a 
      009BA3 93 EE            [ 1] 1998 	ld a,(2,x)
      009BA5 01 72 A9         [ 1] 1999 	cp a,count 
      009BA8 00 03            [ 1] 2000 	jrpl 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009BAA 4D 2B 08         [ 1] 2001 	ld count,a 
      009BAD 26 0C 35         [ 2] 2002 1$:	ldw basicptr,x 
      009BB0 02 00 0F 20      [ 2] 2003 	ldw y,#tib  
      009BB4 0A 11 A2         [ 4] 2004 	call decompile 
      009BB5 CD 09 68         [ 4] 2005 	call puts 
      009BB5 35 04            [ 1] 2006 	ld a,#CR 
      009BB7 00 0F 20         [ 4] 2007 	call putc 
      009BBA 04 85            [ 2] 2008 	popw y 
      009BBB 81               [ 4] 2009 	ret 
                                   2010 
                                   2011 
                                   2012 ;---------------------------------
                                   2013 ; BASIC: PRINT|? arg_list 
                                   2014 ; print values from argument list
                                   2015 ;----------------------------------
                           000001  2016 	CCOMMA=1
                           000001  2017 	VSIZE=1
      0020AF                       2018 print:
      0020AF                       2019 	_vars VSIZE 
      009BBB 35 01            [ 2]    1     sub sp,#VSIZE 
      0020B1                       2020 reset_comma:
      009BBD 00 0F            [ 1] 2021 	clr (CCOMMA,sp)
      009BBF                       2022 prt_loop:
      009BBF 5F C6 00         [ 4] 2023 	call next_token
      009BC2 0F 14            [ 1] 2024 	cp a,#CMD_END 
      009BC4 01 27            [ 1] 2025 	jrult 0$
      009BC6 03 53            [ 1] 2026 	cp a,#TK_COLON 
      009BC8 A6 FF            [ 1] 2027 	jreq 0$
      009BCA 72 A2            [ 1] 2028 	cp a,#TK_CMD
      009BCC 00 03            [ 1] 2029 	jrne 10$
      0020C2                       2030 0$:
      0020C2                       2031 	_unget_token 
      009BCE 90 F7 90 EF 01   [ 1]    1      mov in,in.saved  
      009BD3 A6 84            [ 2] 2032 	jra 8$ 
      009BD5                       2033 10$:	
      009BD5 5B 01            [ 1] 2034 	cp a,#TK_QSTR
      009BD7 81 12            [ 1] 2035 	jreq 1$
      009BD8 A1 04            [ 1] 2036 	cp a,#TK_CHAR 
      009BD8 4B 00            [ 1] 2037 	jreq 2$ 
      009BDA CD 98            [ 1] 2038 	cp a,#TK_CFUNC 
      009BDC 26 4D            [ 1] 2039 	jreq 3$
      009BDE 27 25            [ 1] 2040 	cp a,#TK_COMMA 
      009BE0 A1 87            [ 1] 2041 	jreq 4$
      009BE2 26 04            [ 1] 2042 	cp a,#TK_SHARP 
      009BE4 03 01            [ 1] 2043 	jreq 5$
      009BE6 20 F2            [ 2] 2044 	jra 7$ 
      009BE8                       2045 1$:	; print string 
      009BE8 A1 06 26         [ 4] 2046 	call puts
      009BEB 0A               [ 1] 2047 	incw x
      009BEC CD 9C 5A A6      [ 2] 2048 	subw x,basicptr 
      009BF0 07 CD 99         [ 2] 2049 	ldw in.w,x  
      009BF3 DC 20            [ 2] 2050 	jra reset_comma
      0020EC                       2051 2$:	; print character 
      009BF5 08 55 00         [ 4] 2052 	call get_char 
      009BF8 03 00 02         [ 4] 2053 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009BFB CD 9B            [ 2] 2054 	jra reset_comma 
      0020F4                       2055 3$: ; print character function value  	
      0020F4                       2056 	_get_code_addr 
      009BFD 79               [ 2]    1         ldw x,(x)
      009BFE 72 5C 00 01      [ 1]    2         inc in 
      009BFE 0D 01 27 03      [ 1]    3         inc in 
      009C02 CD               [ 4] 2057 	call (x)
      009C03 82 75 0B         [ 4] 2058 	call putc
      009C05 20 AE            [ 2] 2059 	jra reset_comma 
      002103                       2060 4$: ; set comma state 
      009C05 5B 01            [ 1] 2061 	cpl (CCOMMA,sp)
      009C07 81 AC            [ 2] 2062 	jra prt_loop   
      009C08                       2063 5$: ; # character must be followed by an integer   
      009C08 CD 9B D8         [ 4] 2064 	call next_token
      009C0B 4D 27            [ 1] 2065 	cp a,#TK_INTGR 
      009C0D 4B CD            [ 1] 2066 	jreq 6$
      009C0F 98 26 4D         [ 2] 2067 	jp syntax_error 
      002111                       2068 6$: ; set tab width
      009C12 27 43 A1         [ 4] 2069 	call get_int24 
      009C15 88               [ 1] 2070 	ld a,xl 
      009C16 27 07            [ 1] 2071 	and a,#15 
      009C18 55 00 03         [ 1] 2072 	ld tab_width,a 
      009C1B 00 02            [ 2] 2073 	jra reset_comma 
      00211C                       2074 7$:	
      00211C                       2075 	_unget_token 
      009C1D 20 38 CD 9B D8   [ 1]    1      mov in,in.saved  
      009C22 4D 26 03         [ 4] 2076 	call condition
      009C25 CC               [ 1] 2077 	tnz a 
      009C26 96 C8            [ 1] 2078 	jreq 8$    
      009C28 CD 18 13         [ 4] 2079     call print_top
      009C28 90 F6            [ 2] 2080 	jra reset_comma 
      00212C                       2081 8$:
      009C2A 93 EE            [ 1] 2082 	tnz (CCOMMA,sp)
      009C2C 01 72            [ 1] 2083 	jrne 9$
      009C2E A9 00            [ 1] 2084 	ld a,#CR 
      009C30 03 C7 00         [ 4] 2085     call putc 
      002135                       2086 9$:	_drop VSIZE 
      009C33 0D CF            [ 2]    1     addw sp,#VSIZE 
      009C35 00               [ 4] 2087 	ret 
                                   2088 
                                   2089 ;----------------------
                                   2090 ; 'save_context' and
                                   2091 ; 'rest_context' must be 
                                   2092 ; called at the same 
                                   2093 ; call stack depth 
                                   2094 ; i.e. SP must have the 
                                   2095 ; save value at  
                                   2096 ; entry point of both 
                                   2097 ; routine. 
                                   2098 ;---------------------
                           000004  2099 	CTXT_SIZE=4 ; size of saved data 
                                   2100 ;--------------------
                                   2101 ; save current BASIC
                                   2102 ; interpreter context 
                                   2103 ; on stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2104 ;--------------------
      002138                       2105 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002138                       2106 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002138                       2107 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002138                       2108 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002138                       2109 save_context:
      009C36 0E 90 F6         [ 2] 2110 	ldw x,basicptr 
      009C39 93 EE            [ 2] 2111 	ldw (BPTR,sp),x
      009C3B 01 72 A9         [ 1] 2112 	ld a,in 
      009C3E 00 03            [ 1] 2113 	ld (IN,sp),a
      009C40 C4 00 0D         [ 1] 2114 	ld a,count 
      009C43 02 C4            [ 1] 2115 	ld (CNT,sp),a  
      009C45 00               [ 4] 2116 	ret
                                   2117 
                                   2118 ;-----------------------
                                   2119 ; restore previously saved 
                                   2120 ; BASIC interpreter context 
                                   2121 ; from stack 
                                   2122 ;-------------------------
      002148                       2123 rest_context:
      009C46 0E 02            [ 2] 2124 	ldw x,(BPTR,sp)
      009C48 C4 00 0F         [ 2] 2125 	ldw basicptr,x 
      009C4B 02 72            [ 1] 2126 	ld a,(IN,sp)
      009C4D A2 00 03         [ 1] 2127 	ld in,a
      009C50 90 F7            [ 1] 2128 	ld a,(CNT,sp)
      009C52 90 EF 01         [ 1] 2129 	ld count,a  
      009C55 20               [ 4] 2130 	ret
                                   2131 
                                   2132 
                                   2133 
                                   2134 ;------------------------------------------
                                   2135 ; BASIC: INPUT [string]var[,[string]var]
                                   2136 ; input value in variables 
                                   2137 ; [string] optionally can be used as prompt 
                                   2138 ;-----------------------------------------
                           000001  2139 	CX_BPTR=1
                           000003  2140 	CX_IN=3
                           000004  2141 	CX_CNT=4
                           000005  2142 	SKIP=5
                           000005  2143 	VSIZE=5
      002158                       2144 input_var:
      009C56 B7 A6            [ 2] 2145 	pushw y 
      00215A                       2146 	_vars VSIZE 
      009C58 84 81            [ 2]    1     sub sp,#VSIZE 
      009C5A                       2147 input_loop:
      009C5A 52 02            [ 1] 2148 	clr (SKIP,sp)
      009C5C CD 9C 08         [ 4] 2149 	call next_token 
      009C5F 4D 27            [ 1] 2150 	cp a,#TK_QSTR 
      009C61 69 CD            [ 1] 2151 	jrne 1$ 
      009C63 98 26 A1         [ 4] 2152 	call puts 
      009C66 89               [ 1] 2153 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009C67 27 0B A1 8A      [ 2] 2154 	subw x,basicptr 
      009C6B 27 07 55         [ 2] 2155 	ldw in.w,x 
      009C6E 00 03            [ 1] 2156 	cpl (SKIP,sp)
      009C70 00 02 20         [ 4] 2157 	call next_token 
      009C73 55 6B            [ 1] 2158 1$: cp a,#TK_VAR  
      009C75 02 CD            [ 1] 2159 	jreq 2$ 
      009C77 9C 08 A1         [ 2] 2160 	jp syntax_error
      009C7A 84 27 03         [ 4] 2161 2$:	call get_addr
      009C7D CC 96 C8         [ 2] 2162 	ldw ptr16,x 
      009C80 0D 05            [ 1] 2163 	tnz (SKIP,sp)
      009C80 90 F6            [ 1] 2164 	jrne 21$ 
      009C82 93 EE 01         [ 4] 2165 	call var_name 
      009C85 72 A9 00         [ 4] 2166 	call putc   
      00218C                       2167 21$:
      009C88 03 C7            [ 1] 2168 	ld a,#':
      009C8A 00 0D CF         [ 4] 2169 	call putc 
      009C8D 00 0E 90         [ 4] 2170 	call save_context 
      009C90 F6 93 EE 01      [ 1] 2171 	clr count  
      009C94 72 A9 00         [ 4] 2172 	call readln 
      009C97 03 6B 01         [ 2] 2173 	ldw x,#tib 
      009C9A 7B 02 A1         [ 1] 2174 	push count
      009C9D 8A 27            [ 1] 2175 	push #0 
      009C9F 10 FB 01         [ 2] 2176 	addw x,(1,sp)
      009CA0 5C               [ 1] 2177 	incw x 
      0021A7                       2178 	_drop 2 
      009CA0 7B 01            [ 2]    1     addw sp,#2 
      009CA2 CA 00 0D 02      [ 1] 2179 	clr in 
      009CA6 CA 00 0E         [ 4] 2180 	call get_token
      009CA9 02 CA            [ 1] 2181 	cp a,#TK_INTGR
      009CAB 00 0F            [ 1] 2182 	jreq 3$ 
      009CAD 02 20            [ 1] 2183 	cp a,#TK_MINUS
      009CAF 0E 07            [ 1] 2184 	jrne 22$
      009CB0 CD 0E E2         [ 4] 2185 	call get_token 
      009CB0 7B 01            [ 1] 2186 	cp a,#TK_INTGR 
      009CB2 C8 00            [ 1] 2187 	jreq 23$
      0021BF                       2188 22$:
      009CB4 0D 02 C8         [ 4] 2189 	call rest_context 
      009CB7 00 0E 02         [ 2] 2190 	jp syntax_error
      0021C5                       2191 23$:
      009CBA C8 00 0F         [ 4] 2192 	call neg_acc24	
      0021C8                       2193 3$: 
      009CBD 02 72 A2         [ 1] 2194 	ld a,acc24 
      009CC0 00 03 90         [ 2] 2195 	ldw x,acc16 
      009CC3 F7 90 EF 01      [ 4] 2196 	ld [ptr16],a
      009CC7 20 99 A6 84      [ 1] 2197 	inc ptr8  
      009CCB 5B 02 81 19      [ 5] 2198 	ldw [ptr16],x 
      009CCE CD 21 48         [ 4] 2199 	call rest_context
      009CCE 35 10 00         [ 4] 2200 	call next_token 
      009CD1 0B 81            [ 1] 2201 	cp a,#TK_COMMA
      009CD3 26 03            [ 1] 2202 	jrne 4$ 
      009CD3 35 0A 00         [ 2] 2203 	jp input_loop
      0021E7                       2204 4$:
      009CD6 0B 81            [ 1] 2205 	cp a,#TK_NONE 
      009CD8 27 07            [ 1] 2206 	jreq input_exit  
      009CD8 4F AE            [ 1] 2207 	cp a,#TK_COLON 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CDA 16 90            [ 1] 2208     jreq input_exit 
      009CDC 72 B0 00         [ 2] 2209 	jp syntax_error 
      0021F2                       2210 input_exit:
      0021F2                       2211 	_drop VSIZE 
      009CDF 33 81            [ 2]    1     addw sp,#VSIZE 
      009CE1 90 85            [ 2] 2212 	popw y 
      009CE1 3B               [ 4] 2213 	ret 
                                   2214 
                                   2215 
                                   2216 ;---------------------
                                   2217 ; BASIC: REM | ' 
                                   2218 ; skip comment to end of line 
                                   2219 ;---------------------- 
      0021F7                       2220 remark::
      009CE2 00 0B AE 9F D8   [ 1] 2221 	mov in,count 
      009CE7 CD               [ 4] 2222  	ret 
                                   2223 
                                   2224 
                                   2225 ;---------------------
                                   2226 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2227 ; read in loop 'addr'  
                                   2228 ; apply & 'mask' to value 
                                   2229 ; loop while result==0.  
                                   2230 ; 'xor_mask' is used to 
                                   2231 ; invert the wait logic.
                                   2232 ; i.e. loop while not 0.
                                   2233 ;---------------------
                           000001  2234 	XMASK=1 
                           000002  2235 	MASK=2
                           000003  2236 	ADDR=3
                           000004  2237 	VSIZE=4
      0021FD                       2238 wait: 
      0021FD                       2239 	_vars VSIZE
      009CE8 89 E8            [ 2]    1     sub sp,#VSIZE 
      009CEA CE 00            [ 1] 2240 	clr (XMASK,sp) 
      009CEC 1C 35 10         [ 4] 2241 	call arg_list 
      009CEF 00 0B            [ 1] 2242 	cp a,#2
      009CF1 CD 98            [ 1] 2243 	jruge 0$
      009CF3 6E 32 00         [ 2] 2244 	jp syntax_error 
      009CF6 0B AE            [ 1] 2245 0$:	cp a,#3
      009CF8 9F EA            [ 1] 2246 	jrult 1$
      00220F                       2247 	_xpop  ; xor mask 
      009CFA CD 89            [ 1]    1     ld a,(y)
      009CFC E8               [ 1]    2     ldw x,y 
      009CFD CE 00            [ 2]    3     ldw x,(1,x)
      009CFF 1E 72 B0 00      [ 2]    4     addw y,#CELL_SIZE 
      009D03 1C               [ 1] 2248 	ld a,xl 
      009D04 CD 98            [ 1] 2249 	ld (XMASK,sp),a 
      00221B                       2250 1$: _xpop ; mask
      009D06 6E AE            [ 1]    1     ld a,(y)
      009D08 9F               [ 1]    2     ldw x,y 
      009D09 FB CD            [ 2]    3     ldw x,(1,x)
      009D0B 89 E8 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009D0E 9F               [ 1] 2251     ld a,xl  
      009D0E CD 9C            [ 1] 2252 	ld (MASK,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      002227                       2253 	_xpop ; address 
      009D10 D8 A6            [ 1]    1     ld a,(y)
      009D12 03               [ 1]    2     ldw x,y 
      009D13 62 CF            [ 2]    3     ldw x,(1,x)
      009D15 00 21 4F 81      [ 2]    4     addw y,#CELL_SIZE 
      009D19 F6               [ 1] 2254 2$:	ld a,(x)
      009D19 CD 98            [ 1] 2255 	and a,(MASK,sp)
      009D1B 26 A1            [ 1] 2256 	xor a,(XMASK,sp)
      009D1D 85 27            [ 1] 2257 	jreq 2$ 
      002237                       2258 	_drop VSIZE 
      009D1F 0C A1            [ 2]    1     addw sp,#VSIZE 
      009D21 05               [ 4] 2259 	ret 
                                   2260 
                                   2261 ;---------------------
                                   2262 ; BASIC: BSET addr,mask
                                   2263 ; set bits at 'addr' corresponding 
                                   2264 ; to those of 'mask' that are at 1.
                                   2265 ; arguments:
                                   2266 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2267 ;   mask        mask|addr
                                   2268 ; output:
                                   2269 ;	none 
                                   2270 ;--------------------------
      00223A                       2271 bit_set:
      009D22 27 03 CC         [ 4] 2272 	call arg_list 
      009D25 96 C8            [ 1] 2273 	cp a,#2	 
      009D27 27 03            [ 1] 2274 	jreq 1$ 
      009D27 CD 9A 0A         [ 2] 2275 	jp syntax_error
      002244                       2276 1$: 
      002244                       2277 	_xpop ; mask 
      009D2A 20 03            [ 1]    1     ld a,(y)
      009D2C 93               [ 1]    2     ldw x,y 
      009D2C CD 98            [ 2]    3     ldw x,(1,x)
      009D2E 4E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D2F 9F               [ 1] 2278 	ld a,xl
      009D2F CF               [ 1] 2279 	push a  
      00224F                       2280 	_xpop ; addr  
      009D30 00 1A            [ 1]    1     ld a,(y)
      009D32 CD               [ 1]    2     ldw x,y 
      009D33 98 26            [ 2]    3     ldw x,(1,x)
      009D35 A1 32 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009D39 CC               [ 1] 2281 	pop a 
      009D3A 96               [ 1] 2282 	or a,(x)
      009D3B C8               [ 1] 2283 	ld (x),a
      009D3C 81               [ 4] 2284 	ret 
                                   2285 
                                   2286 ;---------------------
                                   2287 ; BASIC: BRES addr,mask
                                   2288 ; reset bits at 'addr' corresponding 
                                   2289 ; to those of 'mask' that are at 1.
                                   2290 ; arguments:
                                   2291 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2292 ;   mask	    ~mask&*addr  
                                   2293 ; output:
                                   2294 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2295 ;--------------------------
      00225C                       2296 bit_reset:
      009D3C CD 9C 5A         [ 4] 2297 	call arg_list 
      009D3F A1 84            [ 1] 2298 	cp a,#2  
      009D41 27 03            [ 1] 2299 	jreq 1$ 
      009D43 CC 96 C8         [ 2] 2300 	jp syntax_error
      009D46                       2301 1$: 
      002266                       2302 	_xpop ; mask 
      009D46 90 F6            [ 1]    1     ld a,(y)
      009D48 93               [ 1]    2     ldw x,y 
      009D49 EE 01            [ 2]    3     ldw x,(1,x)
      009D4B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D4F 9F               [ 1] 2303 	ld a,xl 
      009D4F 72               [ 1] 2304 	cpl a
      009D50 C7               [ 1] 2305 	push a  
      002272                       2306 	_xpop ; addr  
      009D51 00 1A            [ 1]    1     ld a,(y)
      009D53 72               [ 1]    2     ldw x,y 
      009D54 5C 00            [ 2]    3     ldw x,(1,x)
      009D56 1B 72 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009D5A 1A               [ 1] 2307 	pop a 
      009D5B 81               [ 1] 2308 	and a,(x)
      009D5C F7               [ 1] 2309 	ld (x),a 
      009D5C F6               [ 4] 2310 	ret 
                                   2311 
                                   2312 ;---------------------
                                   2313 ; BASIC: BTOGL addr,mask
                                   2314 ; toggle bits at 'addr' corresponding 
                                   2315 ; to those of 'mask' that are at 1.
                                   2316 ; arguments:
                                   2317 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2318 ;   mask	    mask^*addr  
                                   2319 ; output:
                                   2320 ;	none 
                                   2321 ;--------------------------
      00227F                       2322 bit_toggle:
      009D5D A0 03 88         [ 4] 2323 	call arg_list 
      009D60 4B 00            [ 1] 2324 	cp a,#2 
      009D62 72 FB            [ 1] 2325 	jreq 1$ 
      009D64 01 F6 EE         [ 2] 2326 	jp syntax_error
      002289                       2327 1$: _xpop ; mask 
      009D67 01 5B            [ 1]    1     ld a,(y)
      009D69 02               [ 1]    2     ldw x,y 
      009D6A 81 01            [ 2]    3     ldw x,(1,x)
      009D6B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D6B 90               [ 1] 2328 	ld a,xl
      009D6C 89               [ 1] 2329 	push a 
      002294                       2330 	_xpop  ; addr  
      009D6D 52 04            [ 1]    1     ld a,(y)
      009D6F 5F               [ 1]    2     ldw x,y 
      009D70 1F 01            [ 2]    3     ldw x,(1,x)
      009D72 90 AE 40 00      [ 2]    4     addw y,#CELL_SIZE 
      009D76 90               [ 1] 2331 	pop a 
      009D77 C3               [ 1] 2332 	xor a,(x)
      009D78 00               [ 1] 2333 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D79 25               [ 4] 2334 	ret 
                                   2335 
                                   2336 
                                   2337 ;---------------------
                                   2338 ; BASIC: BTEST(addr,bit)
                                   2339 ; return bit value at 'addr' 
                                   2340 ; bit is in range {0..7}.
                                   2341 ; arguments:
                                   2342 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2343 ;   bit 	    bit position {0..7}  
                                   2344 ; output:
                                   2345 ;	A:X       bit value  
                                   2346 ;--------------------------
      0022A1                       2347 bit_test:
      009D7A 24 35 17         [ 4] 2348 	call func_args 
      009D7D 03 93            [ 1] 2349 	cp a,#2
      009D7F 5C CD            [ 1] 2350 	jreq 0$
      009D81 89 E8 A6         [ 2] 2351 	jp syntax_error
      0022AB                       2352 0$:	
      0022AB                       2353 	_xpop 
      009D84 3D CD            [ 1]    1     ld a,(y)
      009D86 89               [ 1]    2     ldw x,y 
      009D87 8B 1E            [ 2]    3     ldw x,(1,x)
      009D89 03 CD 9D 5C      [ 2]    4     addw y,#CELL_SIZE 
      009D8D C7               [ 1] 2354 	ld a,xl 
      009D8E 00 0D            [ 1] 2355 	and a,#7
      009D90 CF               [ 1] 2356 	push a   
      009D91 00 0E            [ 1] 2357 	ld a,#1 
      009D93 CD 98            [ 1] 2358 1$: tnz (1,sp)
      009D95 85 A6            [ 1] 2359 	jreq 2$
      009D97 0D               [ 1] 2360 	sll a 
      009D98 CD 89            [ 1] 2361 	dec (1,sp)
      009D9A 8B 1E            [ 2] 2362 	jra 1$
      009D9C 01 5C            [ 1] 2363 2$: ld (1,sp),a  
      0022C5                       2364 	_xpop ; address  
      009D9E 1F 01            [ 1]    1     ld a,(y)
      009DA0 72               [ 1]    2     ldw x,y 
      009DA1 5F 00            [ 2]    3     ldw x,(1,x)
      009DA3 0E 16 03 90      [ 2]    4     addw y,#CELL_SIZE 
      009DA7 F6               [ 1] 2365 	pop a 
      009DA8 C7               [ 1] 2366 	and a,(x)
      009DA9 00 0F            [ 1] 2367 	jreq 3$
      009DAB 72 B9            [ 1] 2368 	ld a,#1 
      009DAD 00               [ 1] 2369 3$:	clrw x 
      009DAE 0E               [ 1] 2370 	ld xl,a
      009DAF 20               [ 1] 2371 	clr a  
      009DB0 C5               [ 4] 2372 	ret
                                   2373 
                                   2374 ;--------------------
                                   2375 ; BASIC: POKE addr,byte
                                   2376 ; put a byte at addr 
                                   2377 ;--------------------
      009DB1                       2378 poke:
      009DB1 1E 01 CD         [ 4] 2379 	call arg_list 
      009DB4 98 6E            [ 1] 2380 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009DB6 AE 9D            [ 1] 2381 	jreq 1$
      009DB8 C1 CD 89         [ 2] 2382 	jp syntax_error
      0022E2                       2383 1$:	
      0022E2                       2384 	_xpop ; byte   
      009DBB E8 5B            [ 1]    1     ld a,(y)
      009DBD 04               [ 1]    2     ldw x,y 
      009DBE 90 85            [ 2]    3     ldw x,(1,x)
      009DC0 81 20 63 6F      [ 2]    4     addw y,#CELL_SIZE 
      009DC4 6E               [ 1] 2385     ld a,xl 
      009DC5 73               [ 1] 2386 	push a 
      0022ED                       2387 	_xpop ; address 
      009DC6 74 61            [ 1]    1     ld a,(y)
      009DC8 6E               [ 1]    2     ldw x,y 
      009DC9 74 73            [ 2]    3     ldw x,(1,x)
      009DCB 20 69 6E 20      [ 2]    4     addw y,#CELL_SIZE 
      009DCF 45               [ 1] 2388 	pop a 
      009DD0 45               [ 1] 2389 	ld (x),a 
      009DD1 50               [ 4] 2390 	ret 
                                   2391 
                                   2392 ;-----------------------
                                   2393 ; BASIC: PEEK(addr)
                                   2394 ; get the byte at addr 
                                   2395 ; input:
                                   2396 ;	none 
                                   2397 ; output:
                                   2398 ;	X 		value 
                                   2399 ;-----------------------
      0022F9                       2400 peek:
      009DD2 52 4F 4D         [ 4] 2401 	call func_args
      009DD5 0A 00            [ 1] 2402 	cp a,#1 
      009DD7 27 03            [ 1] 2403 	jreq 1$
      009DD7 AE 40 00         [ 2] 2404 	jp syntax_error
      002303                       2405 1$: _xpop ; address  
      009DDA 35 08            [ 1]    1     ld a,(y)
      009DDC 00               [ 1]    2     ldw x,y 
      009DDD 0F A3            [ 2]    3     ldw x,(1,x)
      009DDF 47 F8 24 17      [ 2]    4     addw y,#CELL_SIZE 
      009DE3 F6 26 0C         [ 1] 2406 	ld farptr,a 
      009DE6 5C 72 5A         [ 2] 2407 	ldw ptr16,x 
      009DE9 00 0F 26 F6      [ 5] 2408 	ldf a,[farptr]
      009DED 1D               [ 1] 2409 	clrw x 
      009DEE 00               [ 1] 2410 	ld xl,a 
      009DEF 08               [ 1] 2411 	clr a 
      009DF0 20               [ 4] 2412 	ret 
                                   2413 
                                   2414 ;---------------------------
                                   2415 ; BASIC IF expr : instructions
                                   2416 ; evaluate expr and if true 
                                   2417 ; execute instructions on same line. 
                                   2418 ;----------------------------
      00231A                       2419 if: 
      009DF1 09 F6 5C         [ 4] 2420 	call condition  
      00231D                       2421 	_xpop 
      009DF4 4D 26            [ 1]    1     ld a,(y)
      009DF6 FB               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009DF7 5A 20            [ 2]    3     ldw x,(1,x)
      009DF9 E0 5F 4F CF      [ 2]    4     addw y,#CELL_SIZE 
      009DFD 00               [ 1] 2422 	tnz  a  
      009DFE 25 81            [ 1] 2423 	jrne 9$
      009E00 5D               [ 2] 2424 	tnzw x 
      009E00 52 08            [ 1] 2425 	jrne 9$  
                                   2426 ;skip to next line
      009E02 72 5F 00 0E CD   [ 1] 2427 	mov in,count
      002331                       2428 	_drop 2 
      009E07 94 06            [ 2]    1     addw sp,#2 
      009E09 AB 05 6B         [ 2] 2429 	jp next_line
      009E0C 05               [ 4] 2430 9$:	ret 
                                   2431 
                                   2432 ;------------------------
                                   2433 ; BASIC: FOR var=expr 
                                   2434 ; set variable to expression 
                                   2435 ; leave variable address 
                                   2436 ; on stack and set
                                   2437 ; FLOOP bit in 'flags'
                                   2438 ;-----------------
                           000001  2439 	RETL1=1 ; return address  
                           000003  2440 	FSTEP=3  ; variable increment int24
                           000006  2441 	LIMIT=6 ; loop limit, int24  
                           000009  2442 	CVAR=9   ; control variable 
                           00000B  2443 	INW=11   ;  in.w saved
                           00000D  2444 	BPTR=13 ; baseptr saved
                           00000D  2445 	VSIZE=13  
      002337                       2446 for: ; { -- var_addr }
      009E0D 1F               [ 2] 2447 	popw x ; call return address 
      002338                       2448 	_vars VSIZE 
      009E0E 01 90            [ 2]    1     sub sp,#VSIZE 
      009E10 A3               [ 2] 2449 	pushw x  ; RETL1 
      009E11 40 00            [ 1] 2450 	ld a,#TK_VAR 
      009E13 25 05 CE         [ 4] 2451 	call expect
      009E16 00 25 20         [ 4] 2452 	call get_addr
      009E19 03 CE            [ 2] 2453 	ldw (CVAR,sp),x  ; control variable 
      009E1B 00 33 AF         [ 4] 2454 	call let_eval 
      009E1D 72 14 00 22      [ 1] 2455 	bset flags,#FLOOP 
      009E1D 1F 07 17         [ 4] 2456 	call next_token 
      009E20 03 93            [ 1] 2457 	cp a,#TK_CMD 
      009E22 13 07            [ 1] 2458 	jreq 1$
      009E24 24 1C 90         [ 2] 2459 	jp syntax_error
      002356                       2460 1$:  
      002356                       2461 	_get_code_addr
      009E27 F6               [ 2]    1         ldw x,(x)
      009E28 11 05 26 09      [ 1]    2         inc in 
      009E2C 90 5C 1E 01      [ 1]    3         inc in 
      009E30 CD 94 11         [ 2] 2462 	cpw x,#to   
      009E33 26 11            [ 1] 2463 	jreq to
      009E35 CC 16 48         [ 2] 2464 	jp syntax_error 
                                   2465 
                                   2466 ;-----------------------------------
                                   2467 ; BASIC: TO expr 
                                   2468 ; second part of FOR loop initilization
                                   2469 ; leave limit on stack and set 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2470 ; FTO bit in 'flags'
                                   2471 ;-----------------------------------
      002367                       2472 to: ; { var_addr -- var_addr limit step }
      009E35 16 03 90 F6 C7   [ 2] 2473 	btjt flags,#FLOOP,1$
      009E3A 00 0F 72         [ 2] 2474 	jp syntax_error
      009E3D B9 00 0E         [ 4] 2475 1$: call expression   
      009E40 20 DD            [ 1] 2476 	cp a,#TK_INTGR 
      009E42 27 03            [ 1] 2477 	jreq 2$ 
      009E42 0F 03 0F         [ 2] 2478 	jp syntax_error
      002379                       2479 2$: _xpop
      009E45 04 F6            [ 1]    1     ld a,(y)
      009E46 93               [ 1]    2     ldw x,y 
      009E46 1E 03            [ 2]    3     ldw x,(1,x)
      009E48 5B 08 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009E4B 6B 06            [ 1] 2480 	ld (LIMIT,sp),a 
      009E4B 90 89            [ 2] 2481 	ldw (LIMIT+1,sp),x
      009E4D 52 08 0F         [ 4] 2482 	call next_token
      009E50 06 CD            [ 1] 2483 	cp a,#TK_NONE  
      009E52 98 26            [ 1] 2484 	jreq 4$ 
      009E54 A1 04            [ 1] 2485 	cp a,#TK_CMD
      009E56 26 0D            [ 1] 2486 	jrne 3$
      002391                       2487 	_get_code_addr
      009E58 CD               [ 2]    1         ldw x,(x)
      009E59 98 68 A4 DF      [ 1]    2         inc in 
      009E5D A1 55 26 08      [ 1]    3         inc in 
      009E61 03 06 20         [ 2] 2488 	cpw x,#step 
      009E64 07 A1            [ 1] 2489 	jreq step
      00239F                       2490 3$:	
      00239F                       2491 	_unget_token   	 
      009E66 03 27 08 CC 96   [ 1]    1      mov in,in.saved  
      0023A4                       2492 4$:	
      009E6B C8 03            [ 1] 2493 	clr (FSTEP,sp) 
      009E6C AE 00 01         [ 2] 2494 	ldw x,#1   ; default step  
      009E6C A6 03            [ 2] 2495 	ldw (FSTEP+1,sp),x 
      009E6E CD 99            [ 2] 2496 	jra store_loop_addr 
                                   2497 
                                   2498 
                                   2499 ;----------------------------------
                                   2500 ; BASIC: STEP expr 
                                   2501 ; optional third par of FOR loop
                                   2502 ; initialization. 	
                                   2503 ;------------------------------------
      0023AD                       2504 step: ; {var limit -- var limit step}
      009E70 DC 04 00 22 03   [ 2] 2505 	btjt flags,#FLOOP,1$
      009E71 CC 16 48         [ 2] 2506 	jp syntax_error
      009E71 1F 01 CD         [ 4] 2507 1$: call expression 
      009E74 98 3F            [ 1] 2508 	cp a,#TK_INTGR
      009E76 1E 01            [ 1] 2509 	jreq 2$
      009E78 CD 94 06         [ 2] 2510 	jp syntax_error
      0023BF                       2511 2$:	
      0023BF                       2512 	_xpop 
      009E7B AB 05            [ 1]    1     ld a,(y)
      009E7D 6B               [ 1]    2     ldw x,y 
      009E7E 05 16            [ 2]    3     ldw x,(1,x)
      009E80 01 AE 16 90      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009E84 7B 05            [ 1] 2513 	ld (FSTEP,sp),a 
      009E86 F7 5C            [ 2] 2514 	ldw (FSTEP+1,sp),x ; step
                                   2515 ; if step < 0 decrement LIMIT 
      009E88 CD               [ 1] 2516 	tnz a
      009E89 94 22            [ 1] 2517 	jrpl store_loop_addr 
      009E8B 1F 03            [ 1] 2518 	ld a,(LIMIT,sp)
      009E8D 5F 7B            [ 2] 2519 	ldw x,(LIMIT+1,sp)
      009E8F 05 A0 04         [ 2] 2520 	subw x,#1 
      009E92 97 72            [ 1] 2521 	sbc a,#0 
      009E94 FB 03            [ 1] 2522 	ld (LIMIT,sp),a 
      009E96 1F 03            [ 2] 2523 	ldw (LIMIT+1,sp),x 
                                   2524 ; leave loop back entry point on cstack 
                                   2525 ; cstack is 1 call deep from interpreter
      0023DC                       2526 store_loop_addr:
      009E98 A6 32 CD         [ 2] 2527 	ldw x,basicptr
      009E9B 99 DC            [ 2] 2528 	ldw (BPTR,sp),x 
      009E9D 16 07 CD         [ 2] 2529 	ldw x,in.w 
      009EA0 9B 41            [ 2] 2530 	ldw (INW,sp),x   
      009EA2 A1 84 27 03      [ 1] 2531 	bres flags,#FLOOP 
      009EA6 CC 96 C8 90      [ 1] 2532 	inc loop_depth  
      009EAA F6               [ 4] 2533 	ret 
                                   2534 
                                   2535 ;--------------------------------
                                   2536 ; BASIC: NEXT var 
                                   2537 ; FOR loop control 
                                   2538 ; increment variable with step 
                                   2539 ; and compare with limit 
                                   2540 ; loop if threshold not crossed.
                                   2541 ; else stack. 
                                   2542 ; and decrement 'loop_depth' 
                                   2543 ;--------------------------------
      0023EF                       2544 next: ; {var limit step retl1 -- [var limit step ] }
      009EAB 93 EE 01 72      [ 1] 2545 	tnz loop_depth 
      009EAF A9 00            [ 1] 2546 	jrne 1$ 
      009EB1 03 17 07         [ 2] 2547 	jp syntax_error 
      0023F8                       2548 1$: 
      009EB4 16 03            [ 1] 2549 	ld a,#TK_VAR 
      009EB6 90 F7 90         [ 4] 2550 	call expect
      009EB9 EF 01 72         [ 4] 2551 	call get_addr 
                                   2552 ; check for good variable after NEXT 	 
      009EBC 5F 00            [ 2] 2553 	cpw x,(CVAR,sp)
      009EBE 19 1E            [ 1] 2554 	jreq 2$  
      009EC0 01 90 AE         [ 2] 2555 	jp syntax_error ; not the good one 
      002407                       2556 2$: 
      009EC3 40 00 CD         [ 2] 2557 	ldw ptr16,x 
                                   2558 	; increment variable 
      009EC6 9E               [ 1] 2559 	ld a,(x)
      009EC7 00 5D            [ 2] 2560 	ldw x,(1,x)  ; get var value 
      009EC9 27 06 0D         [ 2] 2561 	addw x,(FSTEP+1,sp) ; var+step 
      009ECC 06 27            [ 1] 2562 	adc a,(FSTEP,sp)
      009ECE 1F 20 03 19      [ 4] 2563 	ld [ptr16],a
      009ED1 72 5C 00 1A      [ 1] 2564 	inc ptr8  
      009ED1 CE 00 25 19      [ 5] 2565 	ldw [ptr16],x 
      009ED4 C7 00 0C         [ 1] 2566 	ld acc24,a 
      009ED4 CF 00 1A         [ 2] 2567 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009ED7 AE 16            [ 1] 2568 	ld a,(LIMIT,sp)
      009ED9 90 7B            [ 2] 2569 	ldw x,(LIMIT+1,sp)
      009EDB 05 CD 88 CC      [ 2] 2570 	subw x,acc16 
      009EDF 0D 06 26         [ 1] 2571 	sbc a,acc24
      009EE2 0B 5F            [ 1] 2572 	xor a,(FSTEP,sp)
      009EE4 7B 05            [ 1] 2573 	xor a,#0x80
      009EE6 97 72            [ 1] 2574 	jrmi loop_back  
      009EE8 BB 00            [ 2] 2575 	jra loop_done   
                                   2576 ; check sign of STEP  
      009EEA 25 CF            [ 1] 2577 	ld a,(FSTEP,sp)
      009EEC 00 25            [ 1] 2578 	jrpl 4$
                                   2579 ;negative step
      009EEE C6 00 0E         [ 1] 2580     ld a,acc8 
      009EEE CD 98            [ 1] 2581 	jrslt loop_back   
      009EF0 26 A1            [ 2] 2582 	jra loop_done  
      002442                       2583 4$: ; positive step
      009EF2 08 26 03 CC 9E   [ 2] 2584 	btjt acc8,#7,loop_done 
      002447                       2585 loop_back:
      009EF7 6C 0D            [ 2] 2586 	ldw x,(BPTR,sp)
      009EF8 CF 00 04         [ 2] 2587 	ldw basicptr,x 
      009EF8 55 00 03 00 02   [ 2] 2588 	btjf flags,#FRUN,1$ 
      009EFD E6 02            [ 1] 2589 	ld a,(2,x)
      009EFD 5B 08 90         [ 1] 2590 	ld count,a
      009F00 85 81            [ 2] 2591 1$:	ldw x,(INW,sp)
      009F02 CF 00 00         [ 2] 2592 	ldw in.w,x 
      009F02 72               [ 4] 2593 	ret 
      00245C                       2594 loop_done:
                                   2595 	; remove loop data from stack  
      009F03 00               [ 2] 2596 	popw x
      00245D                       2597 	_drop VSIZE 
      009F04 00 23            [ 2]    1     addw sp,#VSIZE 
      009F06 05 A6 06 CC      [ 1] 2598 	dec loop_depth 
      009F0A 96               [ 2] 2599 	jp (x)
                                   2600 
                                   2601 ;----------------------------
                                   2602 ; called by goto/gosub
                                   2603 ; to get target line number 
                                   2604 ; output:
                                   2605 ;    x    line address 
                                   2606 ;---------------------------
      002464                       2607 get_target_line:
      009F0B CA 17 A6         [ 4] 2608 	call next_token  
      009F0C A1 84            [ 1] 2609 	cp a,#TK_INTGR
      009F0C 90 89            [ 1] 2610 	jreq get_target_line_addr 
      009F0E 52 04            [ 1] 2611 	cp a,#TK_LABEL 
      009F10 0F 03            [ 1] 2612 	jreq look_target_symbol 
      009F12 CD 98 26         [ 2] 2613 	jp syntax_error
                                   2614 ; the target is a line number 
                                   2615 ; search it. 
      002472                       2616 get_target_line_addr:
      009F15 A1 03            [ 2] 2617 	pushw y 
      009F17 27 03 CC         [ 4] 2618 	call get_int24 ; line # 
      009F1A 96               [ 1] 2619 	clr a
      009F1B C8 1F 01 CD      [ 2] 2620 	ldw y,basicptr 
      009F1F 94 06            [ 2] 2621 	ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      009F21 AB 05            [ 2] 2622 	pushw y 
      009F23 6B 04            [ 2] 2623 	cpw x,(1,sp)
      002482                       2624 	_drop 2  
      009F25 CD 98            [ 2]    1     addw sp,#2 
      009F27 3F 1E            [ 1] 2625 	jrult 11$
      009F29 01               [ 1] 2626 	inc a 
      002487                       2627 11$: ; scan program for this line# 	
      009F2A 90 CE 00         [ 4] 2628 	call search_lineno  
      009F2D 31               [ 2] 2629 	tnzw x ; 0| line# address 
      009F2E CD 9E            [ 1] 2630 	jrne 2$ 
      009F30 00 5D            [ 1] 2631 	ld a,#ERR_NO_LINE 
      009F32 26 1B CE         [ 2] 2632 	jp tb_error 
      009F35 00 33            [ 2] 2633 2$:	popw y  
      009F37 7B               [ 4] 2634 	ret 
                                   2635 
                                   2636 ; the GOTO|GOSUB target is a symbol.
                                   2637 ; output:
                                   2638 ;    X    line address|0 
      002495                       2639 look_target_symbol:
      009F38 04 F7            [ 2] 2640 	pushw y 
      009F3A 5C               [ 2] 2641 	pushw x 
      009F3B 16 01 CD         [ 4] 2642 	call skip_string 
      009F3E 94 22 5A 72      [ 1] 2643 	clr acc16 
      009F42 FB 03 CF 00      [ 2] 2644 	ldw y,txtbgn 
      009F46 33 1D 00         [ 1] 2645 1$:	ld a,(3,y) ; first TK_ID on line 
      009F49 03 7F            [ 1] 2646 	cp a,#TK_LABEL 
      009F4B 6F 01            [ 1] 2647 	jreq 3$ 
      009F4D 6F 02 CD         [ 1] 2648 2$:	ld a,(2,y); line length 
      009F50 98 26 A1         [ 1] 2649 	ld acc8,a 
      009F53 08 27 BC A1      [ 2] 2650 	addw y,acc16 ;point to next line 
      009F57 32 26 2A CD      [ 2] 2651 	cpw y,txtend 
      009F5B 9C 5A            [ 1] 2652 	jrult 1$
      009F5D A1 84            [ 1] 2653 	ld a,#ERR_BAD_VALUE
      009F5F 27 03 CC         [ 2] 2654 	jp tb_error 
      0024BF                       2655 3$: ; found a TK_LABEL 
                                   2656 	; compare with GOTO|GOSUB target 
      009F62 96 C8            [ 2] 2657 	pushw y ; line address 
      009F64 CE 00 33 1D      [ 2] 2658 	addw y,#4 ; label string 
      009F68 00 03            [ 2] 2659 	ldw x,(3,sp) ; target string 
      009F6A CF 00 1A         [ 4] 2660 	call strcmp
      009F6D 90 F6            [ 1] 2661 	jrne 4$
      009F6F 93 EE            [ 2] 2662 	popw y 
      009F71 01 72            [ 2] 2663 	jra 2$ 
      0024D0                       2664 4$: ; target found 
      009F73 A9               [ 2] 2665 	popw x ;  address line target  
      0024D1                       2666 	_drop 2 ; target string 
      009F74 00 03            [ 2]    1     addw sp,#2 
      009F76 72 C7            [ 2] 2667 	popw y 
      009F78 00               [ 4] 2668 	ret
                                   2669 
                                   2670 
                                   2671 ;--------------------------------
                                   2672 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2673 ; selective goto or gosub 
                                   2674 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      0024D6                       2675 cmd_on:
      009F79 1A 72 5C 00 1B   [ 2] 2676 	btjt flags,#FRUN,0$ 
      009F7E 72 CF            [ 1] 2677 	ld a,#ERR_RUN_ONLY
      009F80 00 1A 20         [ 2] 2678 	jp tb_error 
      009F83 CB 1A C1         [ 4] 2679 0$:	call expression 
      009F84 A1 84            [ 1] 2680 	cp a,#TK_INTGR
      009F84 55 00            [ 1] 2681 	jreq 1$
      009F86 03 00 02         [ 2] 2682 	jp syntax_error
      0024EA                       2683 1$: _xpop
      009F89 5B 04            [ 1]    1     ld a,(y)
      009F8B CD               [ 1]    2     ldw x,y 
      009F8C 9D 0E            [ 2]    3     ldw x,(1,x)
      009F8E 90 85 81 03      [ 2]    4     addw y,#CELL_SIZE 
                                   2684 ; the selector is the element indice 
                                   2685 ; in the list of arguments. {1..#elements} 
      009F91 9F               [ 1] 2686 	ld a,xl ; keep only bits 7..0
      009F91 CE 00            [ 1] 2687 	jreq 9$ ; element # begin at 1. 
      009F93 1E               [ 1] 2688 	push a  ; selector  
      009F94 72 B0 00         [ 4] 2689 	call next_token
      009F97 1C 81            [ 1] 2690 	cp a,#TK_CMD 
      009F99 27 03            [ 1] 2691 	jreq 2$ 
      009F99 AE 9F D8         [ 2] 2692 	jp syntax_error 
      002501                       2693 2$: _get_code_addr
      009F9C CD               [ 2]    1         ldw x,(x)
      009F9D 89 E8 CE 00      [ 1]    2         inc in 
      009FA1 1C 35 10 00      [ 1]    3         inc in 
                                   2694 ;; must be a GOTO or GOSUB 
      009FA5 0B CD 98         [ 2] 2695 	cpw x,#goto 
      009FA8 6E 35            [ 1] 2696 	jreq 4$
      009FAA 0A 00 0B         [ 2] 2697 	cpw x,#gosub 
      009FAD AE 9F            [ 1] 2698 	jreq 4$ 
      009FAF EA CD 89         [ 2] 2699 	jp syntax_error 
      002517                       2700 4$: 
      009FB2 E8               [ 1] 2701 	pop a 
      009FB3 CD               [ 2] 2702 	pushw x ; save routine address 	
      009FB4 9F               [ 1] 2703 	push a  ; selector  
      00251A                       2704 5$: ; skip elements in list until selector==0 
      009FB5 91 CD            [ 1] 2705 	dec (1,sp)
      009FB7 98 6E            [ 1] 2706 	jreq 6$ 
                                   2707 ; can be a line# or a label 
      009FB9 AE 9F FB         [ 4] 2708 	call next_token 
      009FBC CD 89            [ 1] 2709 	cp a,#TK_INTGR 
      009FBE E8 CE            [ 1] 2710 	jreq 52$
      009FC0 00 1C            [ 1] 2711 	cp a,#TK_LABEL 
      009FC2 A3 B7            [ 1] 2712 	jreq 54$
      009FC4 84 25 05         [ 2] 2713 	jp syntax_error 
      00252C                       2714 52$: ; got a line number 
      009FC7 AE A0 02         [ 1] 2715 	ld a,in ; skip over int24 value 
      009FCA 20 03            [ 1] 2716 	add a,#CELL_SIZE ; integer size  
      009FCC AE A0 13         [ 1] 2717 	ld in,a 
      009FCF CD 89            [ 2] 2718 	jra 56$
      009FD1 E8 A6 0D         [ 4] 2719 54$: call skip_string ; skip over label 	
      002539                       2720 56$: ; if another element comma present 
      009FD4 CD 89 8B         [ 4] 2721 	call next_token
      009FD7 81 70            [ 1] 2722 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009FD9 72 6F            [ 1] 2723 	jreq 5$ 
                                   2724 ; arg list exhausted, selector to big 
                                   2725 ; continue execution on next line 
      002540                       2726 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009FDB 67 72            [ 2]    1     addw sp,#3 
      009FDD 61 6D            [ 2] 2727 	jra 9$
      002544                       2728 6$: ;at selected position  
      002544                       2729 	_drop 1 ; discard selector
      009FDF 20 61            [ 2]    1     addw sp,#1 
                                   2730 ; here only the routine address 
                                   2731 ; of GOTO|GOSUB is on stack 
      009FE1 64 64 72         [ 4] 2732     call get_target_line
      009FE4 65 73 73         [ 2] 2733 	ldw ptr16,x 	
      009FE7 3A 20 00 2C 20   [ 1] 2734 	mov in,count ; move to end of line  
      009FEC 70               [ 2] 2735 	popw x ; cmd address, GOTO||GOSUB 
      009FED 72 6F 67         [ 2] 2736 	cpw x,#goto 
      009FF0 72 61            [ 1] 2737 	jrne 7$ 
      009FF2 6D 20 73         [ 2] 2738 	ldw x,ptr16 
      009FF5 69 7A            [ 2] 2739 	jra jp_to_target
      00255C                       2740 7$: 
      009FF7 65 3A            [ 2] 2741 	jra gosub_2 ; target in ptr16 
      00255E                       2742 9$: ; expr out of range skip to end of line
                                   2743     ; this will force a fall to next line  
      009FF9 20 00 20 62 79   [ 1] 2744 	mov in,count
      002563                       2745 	_drop 2
      009FFE 74 65            [ 2]    1     addw sp,#2 
      00A000 73 00 20         [ 2] 2746 	jp next_line  
                                   2747 
                                   2748 
                                   2749 ;------------------------
                                   2750 ; BASIC: GOTO line# 
                                   2751 ; jump to line# 
                                   2752 ; here cstack is 2 call deep from interpreter 
                                   2753 ;------------------------
      002568                       2754 goto:
      00A003 69 6E 20 46 4C   [ 2] 2755 	btjt flags,#FRUN,goto_1  
      00A008 41 53            [ 1] 2756 	ld a,#ERR_RUN_ONLY
      00A00A 48 20 6D         [ 2] 2757 	jp tb_error 
      002572                       2758 goto_1:
      00A00D 65 6D 6F         [ 4] 2759 	call get_target_line
      002575                       2760 jp_to_target:
      00A010 72 79 00         [ 2] 2761 	ldw basicptr,x 
      00A013 20 69            [ 1] 2762 	ld a,(2,x)
      00A015 6E 20 52         [ 1] 2763 	ld count,a 
      00A018 41 4D 20 6D      [ 1] 2764 	mov in,#3 
      00A01C 65               [ 4] 2765 	ret 
                                   2766 
                                   2767 
                                   2768 ;--------------------
                                   2769 ; BASIC: GOSUB line#
                                   2770 ; basic subroutine call
                                   2771 ; actual line# and basicptr 
                                   2772 ; are saved on cstack
                                   2773 ; here cstack is 2 call deep from interpreter 
                                   2774 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                           000001  2775 	RET_ADDR=1 ; subroutine return address 
                           000003  2776 	RET_BPTR=3 ; basicptr return point 
                           000005  2777 	RET_INW=5  ; in.w return point 
                           000004  2778 	VSIZE=4 
      002582                       2779 gosub:
      00A01D 6D 6F 72 79 00   [ 2] 2780 	btjt flags,#FRUN,gosub_1 
      00A022 A6 06            [ 1] 2781 	ld a,#ERR_RUN_ONLY
      00A022 72 01 00         [ 2] 2782 	jp tb_error 
      00A025 23               [ 4] 2783 	ret 
      00258D                       2784 gosub_1:
      00A026 05 A6 07         [ 4] 2785 	call get_target_line 
      00A029 CC 96 CA         [ 2] 2786 	ldw ptr16,x
      00A02C                       2787 gosub_2: 
      00A02C CD               [ 2] 2788 	popw x 
      002594                       2789 	_vars VSIZE  
      00A02D 98 26            [ 2]    1     sub sp,#VSIZE 
      00A02F A1               [ 2] 2790 	pushw x ; RET_ADDR 
                                   2791 ; save BASIC subroutine return point.   
      00A030 04 26 10         [ 2] 2792 	ldw x,basicptr
      00A033 CD 98            [ 2] 2793 	ldw (RET_BPTR,sp),x 
      00A035 68 A4 DF         [ 2] 2794 	ldw x,in.w 
      00A038 A1 43            [ 2] 2795 	ldw (RET_INW,sp),x
      00A03A 26 04 CD         [ 2] 2796 	ldw x,ptr16  
      00A03D 9D 6B            [ 2] 2797 	jra jp_to_target
                                   2798 
                                   2799 ;------------------------
                                   2800 ; BASIC: RETURN 
                                   2801 ; exit from BASIC subroutine 
                                   2802 ;------------------------
      0025A6                       2803 return:
      00A03F 81 CC 96 C8 55   [ 2] 2804 	btjt flags,#FRUN,0$ 
      00A044 00 03            [ 1] 2805 	ld a,#ERR_RUN_ONLY
      00A046 00 02 CD         [ 2] 2806 	jp tb_error 
      0025B0                       2807 0$:	
      00A049 9F 91            [ 2] 2808 	ldw x,(RET_BPTR,sp) 
      00A04B 22 01 81         [ 2] 2809 	ldw basicptr,x
      00A04E 52 06            [ 1] 2810 	ld a,(2,x)
      00A050 CE 00 1C         [ 1] 2811 	ld count,a  
      00A053 1F 05            [ 2] 2812 	ldw x,(RET_INW,sp)
      00A055 FE 1F 01         [ 2] 2813 	ldw in.w,x 
      00A058 AE               [ 2] 2814 	popw x 
      0025C0                       2815 	_drop VSIZE 
      00A059 7F FF            [ 2]    1     addw sp,#VSIZE 
      00A05B 1F               [ 2] 2816 	jp (x)
                                   2817 
                                   2818 
                                   2819 ;----------------------------------
                                   2820 ; BASIC: RUN
                                   2821 ; run BASIC program in RAM
                                   2822 ;----------------------------------- 
      0025C3                       2823 run: 
      00A05C 03 CD 99 EE 4D   [ 2] 2824 	btjf flags,#FRUN,0$  
      00A061 27               [ 1] 2825 	clr a 
      00A062 31               [ 4] 2826 	ret
      0025CA                       2827 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A063 A1 02 27 07 A1   [ 2] 2828 	btjf flags,#FBREAK,1$
      0025CF                       2829 	_drop 2 
      00A068 01 27            [ 2]    1     addw sp,#2 
      00A06A 06 CC 96         [ 4] 2830 	call rest_context
      0025D4                       2831 	_drop CTXT_SIZE 
      00A06D C8 85            [ 2]    1     addw sp,#CTXT_SIZE 
      00A06F 1F 05 00 22      [ 1] 2832 	bres flags,#FBREAK 
      00A071 72 10 00 22      [ 1] 2833 	bset flags,#FRUN 
      00A071 85 1F 01         [ 2] 2834 	jp interpreter 
      00A074 CE 00 1B         [ 2] 2835 1$:	ldw x,txtbgn
      00A074 CE 00 1C         [ 2] 2836 	cpw x,txtend 
      00A077 1F 05            [ 1] 2837 	jrmi run_it 
      00A079 C3 00 1E         [ 2] 2838 	ldw x,#err_no_prog
      00A07C 2A 38 FE         [ 4] 2839 	call puts 
      00A07F 13 01 2A 11 1E   [ 1] 2840 	mov in,count
      00A084 05               [ 4] 2841 	ret 
      0025F5                       2842 run_it:	 
      0025F5                       2843 	_drop 2 ; drop return address 
      00A085 E6 02            [ 2]    1     addw sp,#2 
      0025F7                       2844 run_it_02: 
      00A087 C7 00 0F         [ 4] 2845     call ubound 
      00A08A 72 5F 00         [ 4] 2846 	call clear_vars
                                   2847 ; initialize DIM variables pointers 
      00A08D 0E 72 BB         [ 2] 2848 	ldw x,txtend 
      00A090 00 0E 20         [ 2] 2849 	ldw dvar_bgn,x 
      00A093 E3 00 32         [ 2] 2850 	ldw dvar_end,x 	 
                                   2851 ; clear data pointer 
      00A094 5F               [ 1] 2852 	clrw x 
      00A094 1E 05 E6         [ 2] 2853 	ldw data_ptr,x 
      00A097 02 CD A1 0B      [ 1] 2854 	clr data_ofs 
      00A09B 1E 05 E6 02      [ 1] 2855 	clr data_len 
                                   2856 ; initialize BASIC pointer 
      00A09F C7 00 0F         [ 2] 2857 	ldw x,txtbgn 
      00A0A2 72 5F 00         [ 2] 2858 	ldw basicptr,x 
      00A0A5 0E 72            [ 1] 2859 	ld a,(2,x)
      00A0A7 BB 00 0E         [ 1] 2860 	ld count,a
      00A0AA C3 00 1E 2A      [ 1] 2861 	mov in,#3	
      00A0AE 07 1F 05 FE      [ 1] 2862 	bset flags,#FRUN 
      00A0B2 13 03 2F         [ 2] 2863 	jp interpreter 
                                   2864 
                                   2865 
                                   2866 ;----------------------
                                   2867 ; BASIC: END
                                   2868 ; end running program
                                   2869 ;---------------------- 
      002628                       2870 cmd_end: 
                                   2871 ; clean stack 
      00A0B5 DE 17 FF         [ 2] 2872 	ldw x,#STACK_EMPTY
      00A0B6 94               [ 1] 2873 	ldw sp,x 
      00A0B6 55 00 04         [ 2] 2874 	jp warm_start
                                   2875 
                                   2876 ;---------------------------
                                   2877 ; BASIC: GET var 
                                   2878 ; receive a key in variable 
                                   2879 ; don't wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2880 ;---------------------------
      00262F                       2881 cmd_get:
      00A0B9 00 02 AE         [ 4] 2882 	call next_token 
      00A0BC 16 E0            [ 1] 2883 	cp a,#TK_VAR 
      00A0BE CF 00            [ 1] 2884 	jreq 0$
      00A0C0 05 5B 06         [ 2] 2885 	jp syntax_error 
      00A0C3 CD 9F 99         [ 4] 2886 0$: call get_addr 
      00A0C6 81 00 19         [ 2] 2887 	ldw ptr16,x 
      00A0C7 CD 09 14         [ 4] 2888 	call qgetc 
      00A0C7 CD A9            [ 1] 2889 	jreq 2$
      00A0C9 17 27 07         [ 4] 2890 	call getc  
      00A0CC AE A0 F4 CD      [ 4] 2891 2$: clr [ptr16]
      00A0D0 89 E8 81 1A      [ 1] 2892 	inc ptr8 
      00A0D3 72 3F 00 19      [ 4] 2893 	clr [ptr16]
      00A0D3 90 AE B7 80      [ 1] 2894 	inc ptr8 
      00A0D7 CE B7 82 1C      [ 4] 2895 	ld [ptr16],a 
      00A0DB 00               [ 4] 2896 	ret 
                                   2897 
                                   2898 
                                   2899 ;-----------------
                                   2900 ; 1 Khz beep 
                                   2901 ;-----------------
      00265C                       2902 beep_1khz:: 
      00A0DC 04 CF            [ 2] 2903 	pushw y 
      00A0DE 00 0E AE         [ 2] 2904 	ldw x,#100
      00A0E1 00 8C CD 94      [ 2] 2905 	ldw y,#1000
      00A0E5 32 AE            [ 2] 2906 	jra beep
                                   2907 
                                   2908 ;-----------------------
                                   2909 ; BASIC: TONE expr1,expr2
                                   2910 ; used TIMER2 channel 1
                                   2911 ; to produce a tone 
                                   2912 ; arguments:
                                   2913 ;    expr1   frequency 
                                   2914 ;    expr2   duration msec.
                                   2915 ;---------------------------
      002667                       2916 tone:
      00A0E7 00 90            [ 2] 2917 	pushw y 
      00A0E9 CF 00 1C         [ 4] 2918 	call arg_list 
      00A0EC 72 BB            [ 1] 2919 	cp a,#2 
      00A0EE 00 8E            [ 1] 2920 	jreq 1$
      00A0F0 CF 00 1E         [ 2] 2921 	jp syntax_error 
      002673                       2922 1$: 
      002673                       2923 	_xpop 
      00A0F3 81 4E            [ 1]    1     ld a,(y)
      00A0F5 6F               [ 1]    2     ldw x,y 
      00A0F6 20 61            [ 2]    3     ldw x,(1,x)
      00A0F8 70 70 6C 69      [ 2]    4     addw y,#CELL_SIZE 
      00A0FC 63               [ 2] 2924 	pushw x ; duration 
      00267D                       2925 	_xpop ; frequency
      00A0FD 61 74            [ 1]    1     ld a,(y)
      00A0FF 69               [ 1]    2     ldw x,y 
      00A100 6F 6E            [ 2]    3     ldw x,(1,x)
      00A102 20 73 61 76      [ 2]    4     addw y,#CELL_SIZE 
      00A106 65 64            [ 1] 2926 	ldw y,x ; frequency 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A108 2E               [ 2] 2927 	popw x  ; duration 
      002689                       2928 beep:  
      00A109 0A               [ 2] 2929 	pushw x 
      00A10A 00 F4 24         [ 2] 2930 	ldw x,#TIM2_CLK_FREQ
      00A10B 65               [ 2] 2931 	divw x,y ; cntr=Fclk/freq 
                                   2932 ; round to nearest integer 
      00A10B 90 89 C7 00      [ 2] 2933 	cpw y,#TIM2_CLK_FREQ/2
      00A10F 04 E6            [ 1] 2934 	jrmi 2$
      00A111 02               [ 1] 2935 	incw x 
      002695                       2936 2$:	 
      00A112 C1               [ 1] 2937 	ld a,xh 
      00A113 00 04 2A         [ 1] 2938 	ld TIM2_ARRH,a 
      00A116 03               [ 1] 2939 	ld a,xl 
      00A117 C7 00 04         [ 1] 2940 	ld TIM2_ARRL,a 
                                   2941 ; 50% duty cycle 
      00A11A CF               [ 1] 2942 	ccf 
      00A11B 00               [ 2] 2943 	rrcw x 
      00A11C 05               [ 1] 2944 	ld a,xh 
      00A11D 90 AE 16         [ 1] 2945 	ld TIM2_CCR1H,a 
      00A120 90               [ 1] 2946 	ld a,xl
      00A121 CD 92 22         [ 1] 2947 	ld TIM2_CCR1L,a
      00A124 CD 89 E8 A6      [ 1] 2948 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A128 0D CD 89 8B      [ 1] 2949 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A12C 90 85 81 04      [ 1] 2950 	bset TIM2_EGR,#TIM2_EGR_UG
      00A12F 85               [ 2] 2951 	popw x 
      00A12F 52 01 F5         [ 4] 2952 	call pause02
      00A131 72 11 53 08      [ 1] 2953 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A131 0F 01 53 00      [ 1] 2954 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A133 90 85            [ 2] 2955 	popw y 
      00A133 CD               [ 4] 2956 	ret 
                                   2957 
                                   2958 ;-------------------------------
                                   2959 ; BASIC: ADCON 0|1 [,divisor]  
                                   2960 ; disable/enanble ADC 
                                   2961 ;-------------------------------
                           000003  2962 	ONOFF=3 
                           000001  2963 	DIVSOR=1
                           000004  2964 	VSIZE=4 
      0026C2                       2965 power_adc:
      00A134 98 26 A1         [ 4] 2966 	call arg_list 
      00A137 02 25            [ 1] 2967 	cp a,#2	
      00A139 08 A1            [ 1] 2968 	jreq 1$
      00A13B 0A 27            [ 1] 2969 	cp a,#1 
      00A13D 04 A1            [ 1] 2970 	jreq 0$ 
      00A13F 80 26 07         [ 2] 2971 	jp syntax_error 
      00A142 4F               [ 1] 2972 0$:	clr a 
      00A142 55               [ 1] 2973 	clrw x
      0026D2                       2974 	_xpush   ; divisor  
      00A143 00 03 00 02      [ 2]    1     subw y,#CELL_SIZE
      00A147 20 63            [ 1]    2     ld (y),a 
      00A149 90 EF 01         [ 2]    3     ldw (1,y),x 
      0026DB                       2975 1$: _at_next 
      00A149 A1 02 27         [ 1]    1     ld a,(3,y)
      00A14C 12               [ 1]    2     ldw x,y 
      00A14D A1 04            [ 2]    3     ldw x,(4,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A14F 27               [ 2] 2976 	tnzw x 
      00A150 1B A1            [ 1] 2977 	jreq 2$ 
      0026E4                       2978 	_xpop
      00A152 82 27            [ 1]    1     ld a,(y)
      00A154 1F               [ 1]    2     ldw x,y 
      00A155 A1 08            [ 2]    3     ldw x,(1,x)
      00A157 27 2A A1 09      [ 2]    4     addw y,#CELL_SIZE 
      0026ED                       2979 	_xdrop  
      00A15B 27 2A 20 3D      [ 2]    1     addw y,#CELL_SIZE 
      00A15F 9F               [ 1] 2980 	ld a,xl
      00A15F CD 89            [ 1] 2981 	and a,#7
      00A161 E8               [ 1] 2982 	swap a 
      00A162 5C 72 B0         [ 1] 2983 	ld ADC_CR1,a
      00A165 00 05 CF 00      [ 1] 2984 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A169 01 20 C5 01      [ 1] 2985 	bset ADC_CR1,#ADC_CR1_ADON 
      00A16C                       2986 	_usec_dly 7 
      00A16C CD 98 68         [ 2]    1     ldw x,#(16*7-2)/4
      00A16F CD               [ 2]    2     decw x
      00A170 89               [ 1]    3     nop 
      00A171 8B 20            [ 1]    4     jrne .-4
      00A173 BD 08            [ 2] 2987 	jra 3$
      00A174 72 11 54 01      [ 1] 2988 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A174 FE 72 5C 00      [ 1] 2989 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002711                       2990 3$:	
      00A178 02               [ 4] 2991 	ret
                                   2992 
                                   2993 ;-----------------------------
                                   2994 ; BASIC: ADCREAD (channel)
                                   2995 ; read adc channel {0..5}
                                   2996 ; output:
                                   2997 ;   A 		TK_INTGR 
                                   2998 ;   X 		value 
                                   2999 ;-----------------------------
      002712                       3000 analog_read:
      00A179 72 5C 00         [ 4] 3001 	call func_args 
      00A17C 02 FD            [ 1] 3002 	cp a,#1 
      00A17E CD 89            [ 1] 3003 	jreq 1$
      00A180 8B 20 AE         [ 2] 3004 	jp syntax_error
      00A183                       3005 1$: _xpop 
      00A183 03 01            [ 1]    1     ld a,(y)
      00A185 20               [ 1]    2     ldw x,y 
      00A186 AC 01            [ 2]    3     ldw x,(1,x)
      00A187 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A187 CD 98 26         [ 2] 3006 	cpw x,#5 
      00A18A A1 84            [ 2] 3007 	jrule 2$
      00A18C 27 03            [ 1] 3008 	ld a,#ERR_BAD_VALUE
      00A18E CC 96 C8         [ 2] 3009 	jp tb_error 
      00A191 9F               [ 1] 3010 2$: ld a,xl
      00A191 CD 98 58         [ 1] 3011 	ld acc8,a 
      00A194 9F A4            [ 1] 3012 	ld a,#5
      00A196 0F C7 00         [ 1] 3013 	sub a,acc8 
      00A199 24 20 95         [ 1] 3014 	ld ADC_CSR,a
      00A19C 72 16 54 02      [ 1] 3015 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A19C 55 00 03 00      [ 1] 3016 	bset ADC_CR1,#ADC_CR1_ADON
      00A1A0 02 CD 9C 5A 4D   [ 2] 3017 	btjf ADC_CSR,#ADC_CSR_EOC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A1A5 27 05 CD         [ 2] 3018 	ldw x,ADC_DRH
      00A1A8 98 93            [ 1] 3019 	ld a,#TK_INTGR
      00A1AA 20               [ 4] 3020 	ret 
                                   3021 
                                   3022 ;-----------------------
                                   3023 ; BASIC: DREAD(pin)
                                   3024 ; Arduino pins 
                                   3025 ; read state of a digital pin 
                                   3026 ; pin# {0..15}
                                   3027 ; output:
                                   3028 ;    A 		TK_INTGR
                                   3029 ;    X      0|1 
                                   3030 ;-------------------------
                           000001  3031 	PINNO=1
                           000001  3032 	VSIZE=1
      00274E                       3033 digital_read:
      00274E                       3034 	_vars VSIZE 
      00A1AB 85 01            [ 2]    1     sub sp,#VSIZE 
      00A1AC CD 19 69         [ 4] 3035 	call func_args
      00A1AC 0D 01            [ 1] 3036 	cp a,#1
      00A1AE 26 05            [ 1] 3037 	jreq 1$
      00A1B0 A6 0D CD         [ 2] 3038 	jp syntax_error
      00275A                       3039 1$: _xpop 
      00A1B3 89 8B            [ 1]    1     ld a,(y)
      00A1B5 5B               [ 1]    2     ldw x,y 
      00A1B6 01 81            [ 2]    3     ldw x,(1,x)
      00A1B8 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A1B8 CE 00 05         [ 2] 3040 	cpw x,#15 
      00A1BB 1F 03            [ 2] 3041 	jrule 2$
      00A1BD C6 00            [ 1] 3042 	ld a,#ERR_BAD_VALUE
      00A1BF 02 6B 05         [ 2] 3043 	jp tb_error 
      00A1C2 C6 00 04         [ 4] 3044 2$:	call select_pin 
      00A1C5 6B 06            [ 1] 3045 	ld (PINNO,sp),a
      00A1C7 81 01            [ 1] 3046 	ld a,(GPIO_IDR,x)
      00A1C8 0D 01            [ 1] 3047 	tnz (PINNO,sp)
      00A1C8 1E 03            [ 1] 3048 	jreq 8$
      00A1CA CF               [ 1] 3049 3$: srl a 
      00A1CB 00 05            [ 1] 3050 	dec (PINNO,sp)
      00A1CD 7B 05            [ 1] 3051 	jrne 3$ 
      00A1CF C7 00            [ 1] 3052 8$: and a,#1 
      00A1D1 02               [ 1] 3053 	clrw x 
      00A1D2 7B               [ 1] 3054 	ld xl,a 
      00A1D3 06               [ 1] 3055 	clr a 
      002782                       3056 	_drop VSIZE
      00A1D4 C7 00            [ 2]    1     addw sp,#VSIZE 
      00A1D6 04               [ 4] 3057 	ret
                                   3058 
                                   3059 
                                   3060 ;-----------------------
                                   3061 ; BASIC: DWRITE pin,0|1
                                   3062 ; Arduino pins 
                                   3063 ; write to a digital pin 
                                   3064 ; pin# {0..15}
                                   3065 ; output:
                                   3066 ;    A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3067 ;    X      0|1 
                                   3068 ;-------------------------
                           000001  3069 	PINNO=1
                           000002  3070 	PINVAL=2
                           000002  3071 	VSIZE=2
      002785                       3072 digital_write:
      002785                       3073 	_vars VSIZE 
      00A1D7 81 02            [ 2]    1     sub sp,#VSIZE 
      00A1D8 CD 19 6E         [ 4] 3074 	call arg_list  
      00A1D8 90 89            [ 1] 3075 	cp a,#2 
      00A1DA 52 05            [ 1] 3076 	jreq 1$
      00A1DC CC 16 48         [ 2] 3077 	jp syntax_error
      002791                       3078 1$: _xpop 
      00A1DC 0F 05            [ 1]    1     ld a,(y)
      00A1DE CD               [ 1]    2     ldw x,y 
      00A1DF 98 26            [ 2]    3     ldw x,(1,x)
      00A1E1 A1 02 26 10      [ 2]    4     addw y,#CELL_SIZE 
      00A1E5 CD               [ 1] 3079 	ld a,xl 
      00A1E6 89 E8            [ 1] 3080 	ld (PINVAL,sp),a
      00279D                       3081 	_xpop 
      00A1E8 5C 72            [ 1]    1     ld a,(y)
      00A1EA B0               [ 1]    2     ldw x,y 
      00A1EB 00 05            [ 2]    3     ldw x,(1,x)
      00A1ED CF 00 01 03      [ 2]    4     addw y,#CELL_SIZE 
      00A1F1 05 CD 98         [ 2] 3082 	cpw x,#15 
      00A1F4 26 A1            [ 2] 3083 	jrule 2$
      00A1F6 85 27            [ 1] 3084 	ld a,#ERR_BAD_VALUE
      00A1F8 03 CC 96         [ 2] 3085 	jp tb_error 
      00A1FB C8 CD 98         [ 4] 3086 2$:	call select_pin 
      00A1FE 4E CF            [ 1] 3087 	ld (PINNO,sp),a 
      00A200 00 1A            [ 1] 3088 	ld a,#1
      00A202 0D 05            [ 1] 3089 	tnz (PINNO,sp)
      00A204 26 06            [ 1] 3090 	jreq 4$
      00A206 CD               [ 1] 3091 3$: sll a
      00A207 92 18            [ 1] 3092 	dec (PINNO,sp)
      00A209 CD 89            [ 1] 3093 	jrne 3$
      00A20B 8B 02            [ 1] 3094 4$: tnz (PINVAL,sp)
      00A20C 26 05            [ 1] 3095 	jrne 5$
      00A20C A6               [ 1] 3096 	cpl a 
      00A20D 3A CD            [ 1] 3097 	and a,(GPIO_ODR,x)
      00A20F 89 8B            [ 2] 3098 	jra 8$
      00A211 CD A1            [ 1] 3099 5$: or a,(GPIO_ODR,x)
      00A213 B8 72            [ 1] 3100 8$: ld (GPIO_ODR,x),a 
      0027CD                       3101 	_drop VSIZE 
      00A215 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A217 04               [ 4] 3102 	ret
                                   3103 
                                   3104 
                                   3105 ;-----------------------
                                   3106 ; BASIC: STOP
                                   3107 ; stop progam execution  
                                   3108 ; without resetting pointers 
                                   3109 ; the program is resumed
                                   3110 ; with RUN 
                                   3111 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      0027D0                       3112 stop:
      00A218 CD 8A ED AE 16   [ 2] 3113 	btjt flags,#FRUN,2$
      00A21D 90               [ 1] 3114 	clr a
      00A21E 3B               [ 4] 3115 	ret 
      0027D7                       3116 2$:	 
                                   3117 ; create space on cstack to save context 
      00A21F 00 04 4B         [ 2] 3118 	ldw x,#break_point 
      00A222 00 72 FB         [ 4] 3119 	call puts 
      0027DD                       3120 	_drop 2 ;drop return address 
      00A225 01 5C            [ 2]    1     addw sp,#2 
      0027DF                       3121 	_vars CTXT_SIZE ; context size 
      00A227 5B 02            [ 2]    1     sub sp,#CTXT_SIZE 
      00A229 72 5F 00         [ 4] 3122 	call save_context 
      00A22C 02 CD 8F         [ 2] 3123 	ldw x,#tib 
      00A22F 62 A1 84         [ 2] 3124 	ldw basicptr,x
      00A232 27               [ 1] 3125 	clr (x)
      00A233 14 A1 11 26      [ 1] 3126 	clr count  
      00A237 07               [ 1] 3127 	clrw x 
      00A238 CD 8F 62         [ 2] 3128 	ldw in.w,x
      00A23B A1 84 27 06      [ 1] 3129 	bres flags,#FRUN 
      00A23F 72 18 00 22      [ 1] 3130 	bset flags,#FBREAK
      00A23F CD A1 C8         [ 2] 3131 	jp interpreter 
      00A242 CC 96 C8 65 61 6B 20  3132 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3133 
                                   3134 ;-----------------------
                                   3135 ; BASIC: NEW
                                   3136 ; from command line only 
                                   3137 ; free program memory
                                   3138 ; and clear variables 
                                   3139 ;------------------------
      00A245                       3140 new: 
      00A245 CD 82 98 22 01   [ 2] 3141 	btjf flags,#FRUN,0$ 
      00A248 81               [ 4] 3142 	ret 
      002822                       3143 0$:	
      00A248 C6 00 0D         [ 4] 3144 	call clear_basic 
      00A24B CE               [ 4] 3145 	ret 
                                   3146 
                                   3147 ;-----------------------------------
                                   3148 ; BASIC: ERASE \E | \F 
                                   3149 ; erase all block in range from 
                                   3150 ;  'app_space' to FLASH end (0x20000)
                                   3151 ;  or all EEPROM 
                                   3152 ; that contains a non zero byte.  
                                   3153 ;-----------------------------------
                           000001  3154 	LIMIT=1 
                           000003  3155 	VSIZE = 3 
      002826                       3156 erase:
      00A24C 00 0E 72 C7      [ 1] 3157 	clr farptr 
      00282A                       3158 	_vars VSIZE 
      00A250 00 1A            [ 2]    1     sub sp,#VSIZE 
      00A252 72 5C 00         [ 4] 3159 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A255 1B 72            [ 1] 3160 	cp a,#TK_CHAR 
      00A257 CF 00            [ 1] 3161 	jreq 0$ 
      00A259 1A CD A1         [ 2] 3162 	jp syntax_error
      00A25C C8 CD 98         [ 4] 3163 0$: call get_char 
      00A25F 26 A1            [ 1] 3164 	and a,#0XDF 
      00A261 08 26            [ 1] 3165 	cp a,#'E
      00A263 03 CC            [ 1] 3166 	jrne 1$
      00A265 A1 DC 00         [ 2] 3167 	ldw x,#EEPROM_BASE 
      00A267 CF 00 19         [ 2] 3168 	ldw farptr+1,x 
      00A267 A1 00 27         [ 2] 3169 	ldw x,#EEPROM_END
      00A26A 07               [ 1] 3170 	clr a 
      00A26B A1 0A            [ 2] 3171 	jra 3$ 
      00A26D 27 03            [ 1] 3172 1$: cp a,#'F 
      00A26F CC 96            [ 1] 3173 	jreq 2$
      00A271 C8 15 88         [ 2] 3174 	ldw x,#err_bad_value
      00A272 CC 16 4A         [ 2] 3175 	jp tb_error
      002855                       3176 2$:
      00A272 5B 05 90         [ 2] 3177 	ldw x,#app_space  
      00A275 85 81 19         [ 2] 3178 	ldw farptr+1,x 
      00A277 A6 02            [ 1] 3179 	ld a,#(FLASH_END>>16)&0XFF 
      00A277 55 00 04         [ 2] 3180 	ldw x,#FLASH_END&0xffff
      002860                       3181 3$:
      00A27A 00 02            [ 1] 3182 	ld (LIMIT,sp),a 
      00A27C 81 02            [ 2] 3183 	ldw (LIMIT+1,sp),x 
                                   3184  ; operation done from RAM
                                   3185  ; copy code to RAM in tib   
      00A27D CD 07 09         [ 4] 3186 	call move_erase_to_ram
      002867                       3187 4$:	 
      00A27D 52 04 0F         [ 4] 3188     call scan_block 
      00A280 01 CD            [ 1] 3189 	jreq 5$  ; block already erased 
      00A282 99 EE            [ 1] 3190     ld a,#'E 
      00A284 A1 02 24         [ 4] 3191     call putc 
      00A287 03 CC 96         [ 4] 3192 	call block_erase   
                                   3193 ; this block is clean, next  
      00A28A C8 A1 03         [ 2] 3194 5$:	ldw x,#BLOCK_SIZE
      00A28D 25 0C 90         [ 4] 3195 	call incr_farptr
                                   3196 ; check limit, 24 bit substraction  	
      00A290 F6 93            [ 1] 3197 	ld a,(LIMIT,sp)
      00A292 EE 01            [ 2] 3198 	ldw x,(LIMIT+1,sp)
      00A294 72 A9 00 03      [ 2] 3199 	subw x,farptr+1
      00A298 9F 6B 01         [ 1] 3200 	sbc a,farptr 
      00A29B 90 F6            [ 1] 3201 	jrugt 4$ 
      00A29D 93 EE 01         [ 4] 3202 9$: call clear_basic
      00A2A0 72 A9            [ 2] 3203 	ldw x,(LIMIT+1,sp)
      00A2A2 00 03 9F         [ 2] 3204 	cpw x,#EEPROM_END
      00A2A5 6B 02            [ 1] 3205 	jrne 10$
      00A2A7 90 F6 93         [ 4] 3206 	call func_eefree 
      002894                       3207 10$:
      002894                       3208 	_drop VSIZE 
      00A2AA EE 01            [ 2]    1     addw sp,#VSIZE 
      00A2AC 72               [ 4] 3209 	ret 
                                   3210 	
                                   3211 
                                   3212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3213 ;  check for application signature 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3214 ; output:
                                   3215 ;   Carry    0 app present 
                                   3216 ;            1 no app installed  
                                   3217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002897                       3218 qsign: 
      00A2AD A9 00 03         [ 2] 3219 	ldw x,app_sign 
      00A2B0 F6 14 02         [ 2] 3220 	cpw x,SIGNATURE ; "TB" 
      00A2B3 18               [ 4] 3221 	ret 
                                   3222 
                                   3223 ;--------------------------------------
                                   3224 ;  fill write buffer 
                                   3225 ;  input:
                                   3226 ;    y  point to output buffer 
                                   3227 ;    x  point to source 
                                   3228 ;    a  bytes to write in buffer 
                                   3229 ;  output:
                                   3230 ;    y   += A 
                                   3231 ;    X   += A 
                                   3232 ;    A   0 
                                   3233 ;---------------------------------------
      00289E                       3234 fill_write_buffer:
      00A2B4 01               [ 1] 3235 	push a 
      00A2B5 27               [ 1] 3236 	tnz a 
      00A2B6 F9 5B            [ 1] 3237 	jreq 9$ 
      00A2B8 04               [ 1] 3238 1$: ld a,(x)
      00A2B9 81               [ 1] 3239 	incw x 
      00A2BA 90 F7            [ 1] 3240 	ld (y),a 
      00A2BA CD 99            [ 1] 3241 	incw y 
      00A2BC EE A1            [ 1] 3242 	dec (1,sp) 
      00A2BE 02 27            [ 1] 3243 	jrne 1$ 
      00A2C0 03               [ 1] 3244 9$:	pop a 
      00A2C1 CC               [ 4] 3245     ret 	
                                   3246 
                                   3247 ;--------------------------------------
                                   3248 ;  fill pad buffer with zero 
                                   3249 ;  input:
                                   3250 ;	none 
                                   3251 ;  output:
                                   3252 ;    y     buffer address  
                                   3253 ;--------------------------------------
      0028AE                       3254 clear_block_buffer:
      00A2C2 96               [ 1] 3255 	push a 
      00A2C3 C8 AE 16 E0      [ 2] 3256 	ldw y,#block_buffer 
      00A2C4 90 89            [ 2] 3257 	pushw y
      00A2C4 90 F6            [ 1] 3258 	ld a,#BLOCK_SIZE   
      00A2C6 93 EE            [ 1] 3259 1$:	clr (y)
      00A2C8 01 72            [ 1] 3260 	incw y
      00A2CA A9               [ 1] 3261 	dec a  
      00A2CB 00 03            [ 1] 3262 	jrne 1$ 	
      00A2CD 9F 88            [ 2] 3263 9$: popw y 
      00A2CF 90               [ 1] 3264 	pop a 			
      00A2D0 F6               [ 4] 3265 	ret 
                                   3266 
                                   3267 
                                   3268 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3269 ; BASIC: SAVE
                                   3270 ; write application from RAM to FLASH
                                   3271 ; at UFLASH address
                                   3272 ;--------------------------------------
                           000001  3273 	XTEMP=1
                           000003  3274 	COUNT=3  ; last count bytes written 
                           000004  3275 	CNT_LO=4 ; count low byte 
                           000005  3276 	TOWRITE=5 ; how bytes left to write  
                           000006  3277 	VSIZE=6 
      0028C2                       3278 save_app:
      00A2D1 93               [ 2] 3279 	pushw x 
      00A2D2 EE 01            [ 2] 3280 	pushw y 
      0028C5                       3281 	_vars VSIZE
      00A2D4 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A2D6 00 03 84         [ 4] 3282 	call qsign 
      00A2D9 FA F7            [ 1] 3283 	jrne 1$
      00A2DB 81 29 59         [ 2] 3284 	ldw x,#CANT_DO 
      00A2DC CD 09 68         [ 4] 3285 	call puts 
      00A2DC CD 99 EE         [ 2] 3286 	jp 9$
      0028D5                       3287 1$: 
      00A2DF A1 02 27         [ 2] 3288 	ldw x,txtbgn
      00A2E2 03 CC 96         [ 2] 3289 	cpw x,txtend 
      00A2E5 C8 09            [ 1] 3290 	jrult 2$ 
      00A2E6 AE 29 9B         [ 2] 3291 	ldw x,#NO_APP
      00A2E6 90 F6 93         [ 4] 3292 	call puts 
      00A2E9 EE 01 72         [ 2] 3293 	jp 9$
      0028E6                       3294 2$: 
                                   3295 ; block programming flash
                                   3296 ; must be done from RAM
                                   3297 ; moved in tib  
      00A2EC A9 00 03         [ 4] 3298 	call move_prg_to_ram
                                   3299 ; initialize farptr 
                                   3300 ; to app_sign address 
      00A2EF 9F 43 88 90      [ 1] 3301 	clr farptr 
      00A2F3 F6 93 EE         [ 2] 3302 	ldw x,#app_sign 
      00A2F6 01 72 A9         [ 2] 3303 	ldw farptr+1,x
                                   3304 ; initialize local variables 
      00A2F9 00 03 84         [ 4] 3305 	call prog_size
      00A2FC F4 F7            [ 2] 3306 	ldw (TOWRITE,sp),x
      00A2FE 81 03            [ 1] 3307 	clr (COUNT,sp)
                                   3308 ; first bock 
                                   3309 ; containt signature 2 bytes 
                                   3310 ; and size 	2 bytes 
                                   3311 ; use Y as pointer to block_buffer
      00A2FF CD 28 AE         [ 4] 3312 	call clear_block_buffer ; -- y=*block_buffer	
                                   3313 ; write signature
      00A2FF CD 99 EE         [ 2] 3314 	ldw x,SIGNATURE ; "BC" 
      00A302 A1 02            [ 2] 3315 	ldw (y),x 
      00A304 27 03 CC 96      [ 2] 3316 	addw y,#2
      00A308 C8 90            [ 2] 3317 	ldw x,(TOWRITE,sp)
      00A30A F6 93            [ 2] 3318 	ldw (y),x
      00A30C EE 01 72 A9      [ 2] 3319 	addw y,#2   
      00A310 00 03            [ 1] 3320 	ld a,#(BLOCK_SIZE-4)
      00A312 9F 88            [ 1] 3321 	ld (CNT_LO,sp),a 
      00A314 90 F6 93         [ 2] 3322 	cpw x,#(BLOCK_SIZE-4) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A317 EE 01            [ 1] 3323 	jrugt 3$
      00A319 72               [ 1] 3324 	ld a,xl 
      00A31A A9 00            [ 1] 3325 3$:	ld (CNT_LO,sp),a   
      00A31C 03 84 F8         [ 2] 3326 	ldw x,txtbgn 
      00A31F F7 81            [ 2] 3327 	ldw (XTEMP,sp),x 
      00A321                       3328 32$: 
      00A321 CD 99            [ 2] 3329 	ldw x,(XTEMP,sp)
      00A323 E9 A1            [ 1] 3330 	ld a,(CNT_LO,sp)
      00A325 02 27 03         [ 4] 3331 	call fill_write_buffer 
      00A328 CC 96            [ 2] 3332 	ldw (XTEMP,sp),x 
      00A32A C8 16 E0         [ 2] 3333 	ldw x,#block_buffer
      00A32B CD 07 63         [ 4] 3334 	call write_buffer
      00A32B 90 F6 93         [ 2] 3335 	ldw x,#BLOCK_SIZE 
      00A32E EE 01 72         [ 4] 3336 	call incr_farptr  
                                   3337 ; following blocks 
      00A331 A9 00            [ 2] 3338 	ldw x,(XTEMP,sp)
      00A333 03 9F A4         [ 2] 3339 	cpw x,txtend 
      00A336 07 88            [ 1] 3340 	jruge 9$ 
      00A338 A6 01            [ 2] 3341 	ldw x,(TOWRITE,sp)
      00A33A 0D 01 27         [ 2] 3342 	subw x,(COUNT,sp)
      00A33D 05 48            [ 2] 3343 	ldw (TOWRITE,sp),x 
      00A33F 0A 01            [ 1] 3344 	ld a,#BLOCK_SIZE 
      00A341 20 F7 6B         [ 2] 3345 	cpw x,#BLOCK_SIZE 
      00A344 01 90            [ 1] 3346 	jruge 4$ 
      00A346 F6               [ 1] 3347 	ld a,xl 
      00A347 93 EE            [ 1] 3348 4$:	ld (CNT_LO,sp),a 
      00A349 01 72 A9         [ 4] 3349 	call clear_block_buffer 
      00A34C 00 03            [ 2] 3350 	jra 32$ 
      002951                       3351 9$:	_drop VSIZE 
      00A34E 84 F4            [ 2]    1     addw sp,#VSIZE 
      00A350 27 02            [ 2] 3352     popw y 
      00A352 A6               [ 2] 3353 	popw x 
      00A353 01               [ 4] 3354 	ret 
                                   3355 
                                   3356 
      00A354 5F 97                 3357 SIGNATURE: .ascii "TB"
      00A356 4F 81 6E 27 74 20 66  3358 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A358 4E 6F 20 61 70 70 6C  3359 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3360 
                                   3361 ;---------------------
                                   3362 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3363 ; write 1 or more byte to FLASH or EEPROM
                                   3364 ; starting at address  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3365 ; input:
                                   3366 ;   expr1  	is address 
                                   3367 ;   expr2,...,exprn   are bytes to write
                                   3368 ; output:
                                   3369 ;   none 
                                   3370 ;---------------------
      0029B1                       3371 write:
      00A358 CD 99 EE         [ 4] 3372 	call expression
      00A35B A1 02            [ 1] 3373 	cp a,#TK_INTGR 
      00A35D 27 03            [ 1] 3374 	jreq 0$
      00A35F CC 96 C8         [ 2] 3375 	jp syntax_error
      00A362                       3376 0$: _xpop 
      00A362 90 F6            [ 1]    1     ld a,(y)
      00A364 93               [ 1]    2     ldw x,y 
      00A365 EE 01            [ 2]    3     ldw x,(1,x)
      00A367 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A36B 9F 88 90         [ 1] 3377 	ld farptr,a 
      00A36E F6 93 EE         [ 2] 3378 	ldw ptr16,x 
      0029CA                       3379 1$:	
      00A371 01 72 A9         [ 4] 3380 	call next_token 
      00A374 00 03            [ 1] 3381 	cp a,#TK_COMMA 
      00A376 84 F7            [ 1] 3382 	jreq 2$ 
      00A378 81 20            [ 2] 3383 	jra 9$ ; no more data 
      00A379 CD 1A C1         [ 4] 3384 2$:	call expression
      00A379 CD 99            [ 1] 3385 	cp a,#TK_INTGR
      00A37B E9 A1            [ 1] 3386 	jreq 3$
      00A37D 01 27 03         [ 2] 3387 	jp syntax_error
      0029DD                       3388 3$:	_xpop 
      00A380 CC 96            [ 1]    1     ld a,(y)
      00A382 C8               [ 1]    2     ldw x,y 
      00A383 90 F6            [ 2]    3     ldw x,(1,x)
      00A385 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A389 A9               [ 1] 3389 	ld a,xl 
      00A38A 00               [ 1] 3390 	clrw x 
      00A38B 03 C7 00         [ 4] 3391 	call write_byte
      00A38E 19 CF 00         [ 2] 3392 	ldw x,#1 
      00A391 1A 92 BC         [ 4] 3393 	call incr_farptr 
      00A394 00 19            [ 2] 3394 	jra 1$ 
      0029F3                       3395 9$:
      00A396 5F               [ 4] 3396 	ret 
                                   3397 
                                   3398 
                                   3399 ;---------------------
                                   3400 ;BASIC: CHAR(expr)
                                   3401 ; évaluate expression 
                                   3402 ; and take the 7 least 
                                   3403 ; bits as ASCII character
                                   3404 ; output: 
                                   3405 ; 	A char 
                                   3406 ;---------------------
      0029F4                       3407 func_char:
      00A397 97 4F 81         [ 4] 3408 	call func_args 
      00A39A A1 01            [ 1] 3409 	cp a,#1
      00A39A CD 9C            [ 1] 3410 	jreq 1$
      00A39C 5A 90 F6         [ 2] 3411 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      0029FE                       3412 1$:	_xpop
      00A39F 93 EE            [ 1]    1     ld a,(y)
      00A3A1 01               [ 1]    2     ldw x,y 
      00A3A2 72 A9            [ 2]    3     ldw x,(1,x)
      00A3A4 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A3A8 0D               [ 1] 3413 	ld a,xl
      00A3A9 5D 26            [ 1] 3414 	and a,#0x7f 
      00A3AB 0A               [ 4] 3415 	ret
                                   3416 
                                   3417 ;---------------------
                                   3418 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3419 ; extract first character 
                                   3420 ; of string argument 
                                   3421 ; output:
                                   3422 ;    A:X    int24 
                                   3423 ;---------------------
      002A0B                       3424 ascii:
      00A3AC 55 00            [ 1] 3425 	ld a,#TK_LPAREN
      00A3AE 04 00 02         [ 4] 3426 	call expect 
      00A3B1 5B 02 CC         [ 4] 3427 	call next_token 
      00A3B4 97 7B            [ 1] 3428 	cp a,#TK_QSTR 
      00A3B6 81 0E            [ 1] 3429 	jreq 1$
      00A3B7 A1 04            [ 1] 3430 	cp a,#TK_CHAR 
      00A3B7 85 52            [ 1] 3431 	jreq 2$ 
      00A3B9 0D 89            [ 1] 3432 	cp a,#TK_CFUNC 
      00A3BB A6 85            [ 1] 3433 	jreq 0$
      00A3BD CD 99 DC         [ 2] 3434 	jp syntax_error
      002A22                       3435 0$: ; cfunc 
      00A3C0 CD               [ 4] 3436 	call (x)
      00A3C1 98 4E            [ 2] 3437 	jra 3$
      002A25                       3438 1$: ; quoted string 
      00A3C3 1F               [ 1] 3439 	ld a,(x)
      00A3C4 09               [ 1] 3440 	push a  
      00A3C5 CD 9D 2F         [ 4] 3441 	call skip_string
      00A3C8 72               [ 1] 3442 	pop a  	
      00A3C9 14 00            [ 2] 3443 	jra 3$ 
      002A2D                       3444 2$: ; character 
      00A3CB 23 CD 98         [ 4] 3445 	call get_char 
      00A3CE 26               [ 1] 3446 3$:	clrw x 
      00A3CF A1               [ 1] 3447 	rlwa x   
      002A32                       3448 4$:	_xpush  
      00A3D0 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A3D4 96 C8            [ 1]    2     ld (y),a 
      00A3D6 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A3D6 FE 72            [ 1] 3449 	ld a,#TK_RPAREN 
      00A3D8 5C 00 02         [ 4] 3450 	call expect
      002A40                       3451 9$:	
      002A40                       3452 	_xpop  
      00A3DB 72 5C            [ 1]    1     ld a,(y)
      00A3DD 00               [ 1]    2     ldw x,y 
      00A3DE 02 A3            [ 2]    3     ldw x,(1,x)
      00A3E0 A3 E7 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3E4 CC               [ 4] 3453 	ret 
                                   3454 
                                   3455 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3456 ;BASIC: KEY
                                   3457 ; wait for a character 
                                   3458 ; received from STDIN 
                                   3459 ; input:
                                   3460 ;	none 
                                   3461 ; output:
                                   3462 ;	a	 character 
                                   3463 ;---------------------
      002A4A                       3464 key:
      00A3E5 96 C8 1B         [ 4] 3465 	call getc 
      00A3E7 81               [ 4] 3466 	ret
                                   3467 
                                   3468 ;----------------------
                                   3469 ; BASIC: QKEY
                                   3470 ; Return true if there 
                                   3471 ; is a character in 
                                   3472 ; waiting in STDIN 
                                   3473 ; input:
                                   3474 ;  none 
                                   3475 ; output:
                                   3476 ;   A     0|-1
                                   3477 ;-----------------------
      002A4E                       3478 qkey:: 
      00A3E7 72               [ 1] 3479 	clrw x 
      00A3E8 04 00 23         [ 1] 3480 	ld a,rx1_head
      00A3EB 03 CC 96         [ 1] 3481 	sub a,rx1_tail 
      00A3EE C8 CD            [ 1] 3482 	jreq 9$ 
      00A3F0 9B               [ 2] 3483 	cplw x
      00A3F1 41 A1            [ 1] 3484 	ld a,#255    
      002A5A                       3485 9$: 
      00A3F3 84               [ 4] 3486 	ret 
                                   3487 
                                   3488 ;---------------------
                                   3489 ; BASIC: GPIO(port,reg)
                                   3490 ; return gpio register address 
                                   3491 ; expr {PORTA..PORTI}
                                   3492 ; input:
                                   3493 ;   none 
                                   3494 ; output:
                                   3495 ;   A:X 	gpio register address
                                   3496 ;----------------------------
                                   3497 ;	N=PORT
                                   3498 ;	T=REG 
      002A5B                       3499 gpio:
      00A3F4 27 03 CC         [ 4] 3500 	call func_args 
      00A3F7 96 C8            [ 1] 3501 	cp a,#2
      00A3F9 90 F6            [ 1] 3502 	jreq 1$
      00A3FB 93 EE 01         [ 2] 3503 	jp syntax_error  
      002A65                       3504 1$:	_at_next 
      00A3FE 72 A9 00         [ 1]    1     ld a,(3,y)
      00A401 03               [ 1]    2     ldw x,y 
      00A402 6B 06            [ 2]    3     ldw x,(4,x)
      00A404 1F 07 CD         [ 2] 3505 	cpw x,#PA_BASE 
      00A407 98 26            [ 1] 3506 	jrmi bad_port
      00A409 A1 00 27         [ 2] 3507 	cpw x,#PI_BASE+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A40C 17 A1            [ 1] 3508 	jrpl bad_port
      00A40E 80               [ 2] 3509 	pushw x 
      002A76                       3510 	_xpop
      00A40F 26 0E            [ 1]    1     ld a,(y)
      00A411 FE               [ 1]    2     ldw x,y 
      00A412 72 5C            [ 2]    3     ldw x,(1,x)
      00A414 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A418 00 02 A3         [ 2] 3511 	addw x,(1,sp)
      002A82                       3512 	_drop 2 
      00A41B A4 2D            [ 2]    1     addw sp,#2 
      00A41D 27               [ 1] 3513 	clr a 
      00A41E 0E               [ 4] 3514 	ret
      00A41F                       3515 bad_port:
      00A41F 55 00            [ 1] 3516 	ld a,#ERR_BAD_VALUE
      00A421 03 00 02         [ 2] 3517 	jp tb_error
                                   3518 
                                   3519 
                                   3520 ;-------------------------
                                   3521 ; BASIC: UFLASH 
                                   3522 ; return free flash address
                                   3523 ; align to BLOCK address 
                                   3524 ; input:
                                   3525 ;  none 
                                   3526 ; output:
                                   3527 ;	A		TK_INTGR
                                   3528 ;   xstack	free address 
                                   3529 ;---------------------------
      00A424                       3530 uflash:
      00A424 0F 03 AE         [ 4] 3531 	call qsign 
      00A427 00 01            [ 1] 3532 	jrne 1$
      00A429 1F 04 20         [ 2] 3533 	ldw x,#app_space 
      00A42C 2F BB 37 02      [ 2] 3534 	addw x,app_size 
      00A42D 1C 00 04         [ 2] 3535 	addw x,#4
                                   3536 ; align on 128 bytes block 
      00A42D 72 04 00         [ 2] 3537 	addw x,#BLOCK_SIZE 
      00A430 23               [ 1] 3538 	ld a,xl 
      00A431 03 CC            [ 1] 3539 	and a,#0x80 
      00A433 96               [ 1] 3540 	ld xl,a 
      00A434 C8 CD            [ 2] 3541 	jra 2$
      00A436 9B 41 A1         [ 2] 3542 1$:	ldw x,#app_space 
      002AA6                       3543 2$:
      00A439 84               [ 1] 3544 	clr a 
      00A43A 27               [ 4] 3545 	ret 
                                   3546 
                                   3547 
                                   3548 ;---------------------
                                   3549 ; BASIC: USR(addr,arg)
                                   3550 ; execute a function written 
                                   3551 ; in binary code.
                                   3552 ; input:
                                   3553 ;   addr	routine address 
                                   3554 ;   arg 	is an argument
                                   3555 ;           it can be ignore 
                                   3556 ;           by cally. 
                                   3557 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3558 ;   xstack 	value returned by cally  
                                   3559 ;---------------------
      002AA8                       3560 usr:
      00A43B 03 CC 96         [ 4] 3561 	call func_args 
      00A43E C8 02            [ 1] 3562 	cp a,#2
      00A43F 27 03            [ 1] 3563 	jreq 1$  
      00A43F 90 F6 93         [ 2] 3564 	jp syntax_error 
      002AB2                       3565 1$: 
      002AB2                       3566 	_at_next ; A:X addr 
      00A442 EE 01 72         [ 1]    1     ld a,(3,y)
      00A445 A9               [ 1]    2     ldw x,y 
      00A446 00 03            [ 2]    3     ldw x,(4,x)
      00A448 6B 03 1F         [ 2] 3567 	ldw ptr16,X 
      002ABB                       3568 	_xpop  ; arg 
      00A44B 04 4D            [ 1]    1     ld a,(y)
      00A44D 2A               [ 1]    2     ldw x,y 
      00A44E 0D 7B            [ 2]    3     ldw x,(1,x)
      00A450 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      002AC4                       3569 	_store_top ; overwrite addr 
      00A454 00 01            [ 1]    1     ld (y),a 
      00A456 A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A459 06 1F 07 19      [ 6] 3570     call [ptr16]
      00A45C 81               [ 4] 3571 	ret 
                                   3572 
                                   3573 
                                   3574 ;------------------------------
                                   3575 ; BASIC: BYE 
                                   3576 ; halt mcu in its lowest power mode 
                                   3577 ; wait for reset or external interrupt
                                   3578 ; do a cold start on wakeup.
                                   3579 ;------------------------------
      002ACE                       3580 bye:
      00A45C CE 00 05 1F 0D   [ 2] 3581 	btjf UART1_SR,#UART_SR_TC,.
      00A461 CE               [10] 3582 	halt
      00A462 00 01 1F         [ 2] 3583 	jp cold_start  
                                   3584 
                                   3585 ;----------------------------------
                                   3586 ; BASIC: SLEEP 
                                   3587 ; halt mcu until reset or external
                                   3588 ; interrupt.
                                   3589 ; Resume progam after SLEEP command
                                   3590 ;----------------------------------
      002AD7                       3591 sleep:
      00A465 0B 72 15 00 23   [ 2] 3592 	btjf UART1_SR,#UART_SR_TC,.
      00A46A 72 5C 00 20      [ 1] 3593 	bset flags,#FSLEEP
      00A46E 81               [10] 3594 	halt 
      00A46F 81               [ 4] 3595 	ret 
                                   3596 
                                   3597 ;-------------------------------
                                   3598 ; BASIC: PAUSE expr 
                                   3599 ; suspend execution for n msec.
                                   3600 ; input:
                                   3601 ;	none
                                   3602 ; output:
                                   3603 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3604 ;------------------------------
      002AE2                       3605 pause:
      00A46F 72 5D 00         [ 4] 3606 	call expression
      00A472 20 26            [ 1] 3607 	cp a,#TK_INTGR
      00A474 03 CC            [ 1] 3608 	jreq 1$ 
      00A476 96 C8 48         [ 2] 3609 	jp syntax_error
      00A478                       3610 1$: _xpop 
      00A478 A6 85            [ 1]    1     ld a,(y)
      00A47A CD               [ 1]    2     ldw x,y 
      00A47B 99 DC            [ 2]    3     ldw x,(1,x)
      00A47D CD 98 4E 13      [ 2]    4     addw y,#CELL_SIZE 
      002AF5                       3611 pause02:
      00A481 09 27 03         [ 2] 3612 	ldw timer,x 
      00A484 CC 96 C8         [ 2] 3613 1$: ldw x,timer 
      00A487 5D               [ 2] 3614 	tnzw x 
      00A487 CF 00            [ 1] 3615 	jreq 2$
      00A489 1A               [10] 3616 	wfi 
      00A48A F6 EE            [ 1] 3617 	jrne 1$
      002B01                       3618 2$:	
      00A48C 01               [ 4] 3619 	ret 
                                   3620 
                                   3621 ;------------------------------
                                   3622 ; BASIC: AWU expr
                                   3623 ; halt mcu for 'expr' milliseconds
                                   3624 ; use Auto wakeup peripheral
                                   3625 ; all oscillators stopped except LSI
                                   3626 ; range: 1ms - 511ms
                                   3627 ; input:
                                   3628 ;  none
                                   3629 ; output:
                                   3630 ;  none:
                                   3631 ;------------------------------
      002B02                       3632 awu:
      00A48D 72 FB 04         [ 4] 3633   call expression
      00A490 19 03            [ 1] 3634   cp a,#TK_INTGR
      00A492 72 C7            [ 1] 3635   jreq 1$
      00A494 00 1A 72         [ 2] 3636   jp syntax_error
      002B0C                       3637 1$: _xpop 
      00A497 5C 00            [ 1]    1     ld a,(y)
      00A499 1B               [ 1]    2     ldw x,y 
      00A49A 72 CF            [ 2]    3     ldw x,(1,x)
      00A49C 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002B15                       3638 awu02:
      00A4A0 0D CF 00         [ 2] 3639   cpw x,#5120
      00A4A3 0E 7B            [ 1] 3640   jrmi 1$ 
      00A4A5 06 1E 07 72      [ 1] 3641   mov AWU_TBR,#15 
      00A4A9 B0 00            [ 1] 3642   ld a,#30
      00A4AB 0E               [ 2] 3643   div x,a
      00A4AC C2 00            [ 1] 3644   ld a,#16
      00A4AE 0D               [ 2] 3645   div x,a 
      00A4AF 18 03            [ 2] 3646   jra 4$
      002B26                       3647 1$: 
      00A4B1 A8 80 2B         [ 2] 3648   cpw x,#2048
      00A4B4 12 20            [ 1] 3649   jrmi 2$ 
      00A4B6 25 7B 03 2A      [ 1] 3650   mov AWU_TBR,#14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A4BA 07 C6            [ 1] 3651   ld a,#80
      00A4BC 00               [ 2] 3652   div x,a 
      00A4BD 0F 2F            [ 2] 3653   jra 4$   
      002B34                       3654 2$:
      00A4BF 07 20 1A F2      [ 1] 3655   mov AWU_TBR,#7
      00A4C2                       3656 3$:  
                                   3657 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A4C2 72 0E 00         [ 2] 3658   cpw x,#64 
      00A4C5 0F 15            [ 2] 3659   jrule 4$ 
      00A4C7 72 5C 50 F2      [ 1] 3660   inc AWU_TBR 
      00A4C7 1E               [ 2] 3661   srlw x 
      00A4C8 0D CF            [ 2] 3662   jra 3$ 
      002B44                       3663 4$:
      00A4CA 00               [ 1] 3664   ld a, xl
      00A4CB 05               [ 1] 3665   dec a 
      00A4CC 72 01            [ 1] 3666   jreq 5$
      00A4CE 00               [ 1] 3667   dec a 	
      002B49                       3668 5$: 
      00A4CF 23 05            [ 1] 3669   and a,#0x3e 
      00A4D1 E6 02 C7         [ 1] 3670   ld AWU_APR,a 
      00A4D4 00 04 1E 0B      [ 1] 3671   bset AWU_CSR,#AWU_CSR_AWUEN
      00A4D8 CF               [10] 3672   halt 
                                   3673 
      00A4D9 00               [ 4] 3674   ret 
                                   3675 
                                   3676 ;------------------------------
                                   3677 ; BASIC: TICKS
                                   3678 ; return msec ticks counter value 
                                   3679 ; input:
                                   3680 ; 	none 
                                   3681 ; output:
                                   3682 ;	X 		TK_INTGR
                                   3683 ;-------------------------------
      002B54                       3684 get_ticks:
      00A4DA 01 81 0F         [ 1] 3685 	ld a,ticks 
      00A4DC CE 00 10         [ 2] 3686 	ldw x,ticks+1 
      00A4DC 85               [ 4] 3687 	ret 
                                   3688 
                                   3689 ;------------------------------
                                   3690 ; BASIC: ABS(expr)
                                   3691 ; return absolute value of expr.
                                   3692 ; input:
                                   3693 ;   none
                                   3694 ; output:
                                   3695 ;   xstack    positive int24 
                                   3696 ;-------------------------------
      002B5B                       3697 abs:
      00A4DD 5B 0D 72         [ 4] 3698 	call func_args 
      00A4E0 5A 00            [ 1] 3699 	cp a,#1 
      00A4E2 20 FC            [ 1] 3700 	jreq 0$ 
      00A4E4 CC 16 48         [ 2] 3701 	jp syntax_error
      002B65                       3702 0$:  
      00A4E4 CD 98 26         [ 4] 3703 	call abs24 
      002B68                       3704 	_xpop 
      00A4E7 A1 84            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4E9 27               [ 1]    2     ldw x,y 
      00A4EA 07 A1            [ 2]    3     ldw x,(1,x)
      00A4EC 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A4F0 96               [ 4] 3705 	ret 
                                   3706 
                                   3707 ;------------------------------
                                   3708 ; BASIC: LSHIFT(expr1,expr2)
                                   3709 ; logical shift left expr1 by 
                                   3710 ; expr2 bits 
                                   3711 ; output:
                                   3712 ; 	A:x 	result 
                                   3713 ;------------------------------
      002B72                       3714 lshift:
      00A4F1 C8 19 69         [ 4] 3715 	call func_args
      00A4F2 A1 02            [ 1] 3716 	cp a,#2 
      00A4F2 90 89            [ 1] 3717 	jreq 1$
      00A4F4 CD 98 58         [ 2] 3718 	jp syntax_error
      002B7C                       3719 1$: _xpop 
      00A4F7 4F 90            [ 1]    1     ld a,(y)
      00A4F9 CE               [ 1]    2     ldw x,y 
      00A4FA 00 05            [ 2]    3     ldw x,(1,x)
      00A4FC 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A500 13               [ 1] 3720 	ld a,xl 
      00A501 01               [ 1] 3721 	push a      
      002B87                       3722 	_xpop  ; T>A:X 
      00A502 5B 02            [ 1]    1     ld a,(y)
      00A504 25               [ 1]    2     ldw x,y 
      00A505 01 4C            [ 2]    3     ldw x,(1,x)
      00A507 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A507 CD 8C            [ 1] 3723 	tnz (1,sp) 
      00A509 C5 5D            [ 1] 3724 	jreq 4$
      00A50B 26               [ 1] 3725 2$:	rcf 
      00A50C 05               [ 2] 3726 	rlcw x 
      00A50D A6               [ 1] 3727 	rlc a 
      00A50E 05 CC            [ 1] 3728 	dec (1,sp) 
      00A510 96 CA            [ 1] 3729 	jrne 2$
      002B9B                       3730 4$: _drop 1 
      00A512 90 85            [ 2]    1     addw sp,#1 
      00A514 81               [ 4] 3731 	ret
                                   3732 
                                   3733 ;------------------------------
                                   3734 ; BASIC: RSHIFT(expr1,expr2)
                                   3735 ; logical shift right expr1 by 
                                   3736 ; expr2 bits.
                                   3737 ; output:
                                   3738 ; 	A 		TK_INTGR
                                   3739 ;   X 		result 
                                   3740 ;------------------------------
      00A515                       3741 rshift:
      00A515 90 89 89         [ 4] 3742 	call func_args
      00A518 CD 98            [ 1] 3743 	cp a,#2 
      00A51A 3F 72            [ 1] 3744 	jreq 1$
      00A51C 5F 00 0E         [ 2] 3745 	jp syntax_error
      002BA8                       3746 1$: _xpop ; T>A:X
      00A51F 90 CE            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A521 00               [ 1]    2     ldw x,y 
      00A522 1C 90            [ 2]    3     ldw x,(1,x)
      00A524 E6 03 A1 03      [ 2]    4     addw y,#CELL_SIZE 
      00A528 27               [ 1] 3747     ld a,xl 
      00A529 15               [ 1] 3748 	push a    
      002BB3                       3749 	_xpop  
      00A52A 90 E6            [ 1]    1     ld a,(y)
      00A52C 02               [ 1]    2     ldw x,y 
      00A52D C7 00            [ 2]    3     ldw x,(1,x)
      00A52F 0F 72 B9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A533 0E 90            [ 1] 3750 	tnz (1,sp)
      00A535 C3 00            [ 1] 3751 	jreq 4$
      00A537 1E               [ 1] 3752 2$:	rcf 
      00A538 25               [ 1] 3753 	rrc a 
      00A539 E9               [ 2] 3754 	rrcw x 
      00A53A A6 0A            [ 1] 3755 	dec (1,sp) 
      00A53C CC 96            [ 1] 3756 	jrne 2$
      002BC7                       3757 4$: _drop 1 
      00A53E CA 01            [ 2]    1     addw sp,#1 
      00A53F 81               [ 4] 3758 	ret
                                   3759 
                                   3760 ;--------------------------
                                   3761 ; BASIC: FCPU integer
                                   3762 ; set CPU frequency 
                                   3763 ;-------------------------- 
                                   3764 
      002BCA                       3765 fcpu:
      00A53F 90 89            [ 1] 3766 	ld a,#TK_INTGR
      00A541 72 A9 00         [ 4] 3767 	call expect 
      00A544 04 1E 03         [ 4] 3768 	call get_int24 
      00A547 CD               [ 1] 3769 	ld a,xl 
      00A548 94 11            [ 1] 3770 	and a,#7 
      00A54A 26 04 90         [ 1] 3771 	ld CLK_CKDIVR,a 
      00A54D 85               [ 4] 3772 	ret 
                                   3773 
                                   3774 ;------------------------------
                                   3775 ; BASIC: PMODE pin#, mode 
                                   3776 ; Arduino pin. 
                                   3777 ; define pin as input or output
                                   3778 ; pin#: {0..15}
                                   3779 ; mode: INPUT|OUTPUT  
                                   3780 ;------------------------------
                           000001  3781 	PINNO=1
                           000001  3782 	VSIZE=1
      002BD9                       3783 pin_mode:
      002BD9                       3784 	_vars VSIZE 
      00A54E 20 DA            [ 2]    1     sub sp,#VSIZE 
      00A550 CD 19 6E         [ 4] 3785 	call arg_list 
      00A550 85 5B            [ 1] 3786 	cp a,#2 
      00A552 02 90            [ 1] 3787 	jreq 1$
      00A554 85 81 48         [ 2] 3788 	jp syntax_error 
      00A556                       3789 1$: _xpop 
      00A556 72 00            [ 1]    1     ld a,(y)
      00A558 00               [ 1]    2     ldw x,y 
      00A559 23 05            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A55B A6 06 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A55F CA CD 9B         [ 2] 3790 	ldw ptr16,x ; mode 
      002BF1                       3791 	_xpop ; Dx pin 
      00A562 41 A1            [ 1]    1     ld a,(y)
      00A564 84               [ 1]    2     ldw x,y 
      00A565 27 03            [ 2]    3     ldw x,(1,x)
      00A567 CC 96 C8 90      [ 2]    4     addw y,#CELL_SIZE 
      00A56B F6 93 EE         [ 4] 3792 	call select_pin 
      00A56E 01 72            [ 1] 3793 	ld (PINNO,sp),a  
      00A570 A9 00            [ 1] 3794 	ld a,#1 
      00A572 03 9F            [ 1] 3795 	tnz (PINNO,sp)
      00A574 27 68            [ 1] 3796 	jreq 4$
      00A576 88               [ 1] 3797 2$:	sll a 
      00A577 CD 98            [ 1] 3798 	dec (PINNO,sp)
      00A579 26 A1            [ 1] 3799 	jrne 2$ 
      00A57B 80 27            [ 1] 3800 	ld (PINNO,sp),a
      00A57D 03 CC            [ 1] 3801 	ld a,(PINNO,sp)
      00A57F 96 C8            [ 1] 3802 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A581 FE 72            [ 1] 3803 	ld (GPIO_CR1,x),a 
      00A583 5C 00            [ 1] 3804 4$:	ld a,#OUTP
      00A585 02 72 5C         [ 1] 3805 	cp a,acc8 
      00A588 00 02            [ 1] 3806 	jreq 6$
                                   3807 ; input mode
                                   3808 ; disable external interrupt 
      00A58A A3 A5            [ 1] 3809 	ld a,(PINNO,sp)
      00A58C E8               [ 1] 3810 	cpl a 
      00A58D 27 08            [ 1] 3811 	and a,(GPIO_CR2,x)
      00A58F A3 A6            [ 1] 3812 	ld (GPIO_CR2,x),a 
                                   3813 ;clear bit in DDR for input mode 
      00A591 02 27            [ 1] 3814 	ld a,(PINNO,sp)
      00A593 03               [ 1] 3815 	cpl a 
      00A594 CC 96            [ 1] 3816 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A596 C8 02            [ 1] 3817 	ld (GPIO_DDR,x),a 
      00A597 20 0C            [ 2] 3818 	jra 9$
      002C29                       3819 6$: ;output mode  
      00A597 84 89            [ 1] 3820 	ld a,(PINNO,sp)
      00A599 88 02            [ 1] 3821 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A59A E7 02            [ 1] 3822 	ld (GPIO_DDR,x),a 
      00A59A 0A 01            [ 1] 3823 	ld a,(PINNO,sp)
      00A59C 27 26            [ 1] 3824 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A59E CD 98            [ 1] 3825 	ld (GPIO_CR2,x),a 
      002C35                       3826 9$:	
      002C35                       3827 	_drop VSIZE 
      00A5A0 26 A1            [ 2]    1     addw sp,#VSIZE 
      00A5A2 84               [ 4] 3828 	ret
                                   3829 
                                   3830 ;------------------------
                                   3831 ; select Arduino pin 
                                   3832 ; input:
                                   3833 ;   X 	 {0..15} Arduino Dx 
                                   3834 ; output:
                                   3835 ;   A     stm8s208 pin 
                                   3836 ;   X     base address s208 GPIO port 
                                   3837 ;---------------------------
      002C38                       3838 select_pin:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A5A3 27               [ 2] 3839 	sllw x 
      00A5A4 07 A1 03         [ 2] 3840 	addw x,#arduino_to_8s208 
      00A5A7 27               [ 2] 3841 	ldw x,(x)
      00A5A8 0D               [ 1] 3842 	ld a,xl 
      00A5A9 CC               [ 1] 3843 	push a 
      00A5AA 96               [ 1] 3844 	swapw x 
      00A5AB C8 05            [ 1] 3845 	ld a,#5 
      00A5AC 42               [ 4] 3846 	mul x,a 
      00A5AC C6 00 02         [ 2] 3847 	addw x,#GPIO_BASE 
      00A5AF AB               [ 1] 3848 	pop a 
      00A5B0 03               [ 4] 3849 	ret 
                                   3850 ; translation from Arduino D0..D15 to stm8s208rb 
      002C48                       3851 arduino_to_8s208:
      00A5B1 C7 00                 3852 .byte 3,6 ; D0 
      00A5B3 02 20                 3853 .byte 3,5 ; D1 
      00A5B5 03 CD                 3854 .byte 4,0 ; D2 
      00A5B7 98 3F                 3855 .byte 2,1 ; D3
      00A5B9 06 00                 3856 .byte 6,0 ; D4
      00A5B9 CD 98                 3857 .byte 2,2 ; D5
      00A5BB 26 A1                 3858 .byte 2,3 ; D6
      00A5BD 08 27                 3859 .byte 3,1 ; D7
      00A5BF DA 5B                 3860 .byte 3,3 ; D8
      00A5C1 03 20                 3861 .byte 2,4 ; D9
      00A5C3 1A 05                 3862 .byte 4,5 ; D10
      00A5C4 02 06                 3863 .byte 2,6 ; D11
      00A5C4 5B 01                 3864 .byte 2,7 ; D12
      00A5C6 CD A4                 3865 .byte 2,5 ; D13
      00A5C8 E4 CF                 3866 .byte 4,2 ; D14
      00A5CA 00 1A                 3867 .byte 4,1 ; D15
                                   3868 
                                   3869 
                                   3870 ;------------------------------
                                   3871 ; BASIC: RND(expr)
                                   3872 ; return random number 
                                   3873 ; between 1 and expr inclusive
                                   3874 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3875 ; input:
                                   3876 ; 	none 
                                   3877 ; output:
                                   3878 ;	xstack 	random positive integer 
                                   3879 ;------------------------------
      002C68                       3880 random:
      00A5CC 55 00 04         [ 4] 3881 	call func_args 
      00A5CF 00 02            [ 1] 3882 	cp a,#1
      00A5D1 85 A3            [ 1] 3883 	jreq 1$
      00A5D3 A5 E8 26         [ 2] 3884 	jp syntax_error
      002C72                       3885 1$:  
      002C72                       3886 	_xpop   
      00A5D6 05 CE            [ 1]    1     ld a,(y)
      00A5D8 00               [ 1]    2     ldw x,y 
      00A5D9 1A 20            [ 2]    3     ldw x,(1,x)
      00A5DB 19 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5DC 89               [ 2] 3887 	pushw x 
      00A5DC 20               [ 1] 3888 	push a  
      00A5DD 35 80            [ 1] 3889 	ld a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A5DE 15 01            [ 1] 3890 	bcp a,(1,sp)
      00A5DE 55 00            [ 1] 3891 	jreq 2$
      00A5E0 04 00            [ 1] 3892 	ld a,#ERR_BAD_VALUE
      00A5E2 02 5B 02         [ 2] 3893 	jp tb_error
      002C88                       3894 2$: 
                                   3895 ; acc16=(x<<5)^x 
      00A5E5 CC 97 7B         [ 2] 3896 	ldw x,seedx 
      00A5E8 58               [ 2] 3897 	sllw x 
      00A5E8 72               [ 2] 3898 	sllw x 
      00A5E9 00               [ 2] 3899 	sllw x 
      00A5EA 00               [ 2] 3900 	sllw x 
      00A5EB 23               [ 2] 3901 	sllw x 
      00A5EC 05               [ 1] 3902 	ld a,xh 
      00A5ED A6 06 CC         [ 1] 3903 	xor a,seedx 
      00A5F0 96 CA 0D         [ 1] 3904 	ld acc16,a 
      00A5F2 9F               [ 1] 3905 	ld a,xl 
      00A5F2 CD A4 E4         [ 1] 3906 	xor a,seedx+1 
      00A5F5 C7 00 0E         [ 1] 3907 	ld acc8,a 
                                   3908 ; seedx=seedy 
      00A5F5 CF 00 05         [ 2] 3909 	ldw x,seedy 
      00A5F8 E6 02 C7         [ 2] 3910 	ldw seedx,x  
                                   3911 ; seedy=seedy^(seedy>>1)
      00A5FB 00 04 35         [ 2] 3912 	ldw x,seedy 
      00A5FE 03               [ 2] 3913 	srlw x 
      00A5FF 00               [ 1] 3914 	ld a,xh 
      00A600 02 81 16         [ 1] 3915 	xor a,seedy 
      00A602 C7 00 16         [ 1] 3916 	ld seedy,a  
      00A602 72               [ 1] 3917 	ld a,xl 
      00A603 00 00 23         [ 1] 3918 	xor a,seedy+1 
      00A606 06 A6 06         [ 1] 3919 	ld seedy+1,a 
                                   3920 ; acc16>>3 
      00A609 CC 96 CA         [ 2] 3921 	ldw x,acc16 
      00A60C 81               [ 2] 3922 	srlw x 
      00A60D 54               [ 2] 3923 	srlw x 
      00A60D CD               [ 2] 3924 	srlw x 
                                   3925 ; x=acc16^x 
      00A60E A4               [ 1] 3926 	ld a,xh 
      00A60F E4 CF 00         [ 1] 3927 	xor a,acc16 
      00A612 1A 00 0D         [ 1] 3928 	ld acc16,a 
      00A613 9F               [ 1] 3929 	ld a,xl 
      00A613 85 52 04         [ 1] 3930 	xor a,acc8 
      00A616 89 CE 00         [ 1] 3931 	ld acc8,a 
                                   3932 ; seedy=acc16^seedy 
      00A619 05 1F 03         [ 1] 3933 	xor a,seedy+1
      00A61C CE               [ 1] 3934 	ld xl,a 
      00A61D 00 01 1F         [ 1] 3935 	ld a,acc16 
      00A620 05 CE 00         [ 1] 3936 	xor a,seedy
      00A623 1A               [ 1] 3937 	ld xh,a 
      00A624 20 CF 16         [ 2] 3938 	ldw seedy,x 
                                   3939 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A626 C6 00 15         [ 1] 3940 	ld a,seedx+1
      00A626 72 00            [ 1] 3941 	and a,#127
      002CDD                       3942 	_xpush 
      00A628 00 23 05 A6      [ 2]    1     subw y,#CELL_SIZE
      00A62C 06 CC            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A62E 96 CA 01         [ 2]    3     ldw (1,y),x 
      00A630 84               [ 1] 3943 	pop a 
      00A630 1E               [ 2] 3944 	popw x 
      002CE8                       3945 	_xpush 
      00A631 03 CF 00 05      [ 2]    1     subw y,#CELL_SIZE
      00A635 E6 02            [ 1]    2     ld (y),a 
      00A637 C7 00 04         [ 2]    3     ldw (1,y),x 
      00A63A 1E 05 CF         [ 4] 3946 	call mod24 
      002CF4                       3947 	_xpop
      00A63D 00 01            [ 1]    1     ld a,(y)
      00A63F 85               [ 1]    2     ldw x,y 
      00A640 5B 04            [ 2]    3     ldw x,(1,x)
      00A642 FC A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A643 1C 00 01         [ 2] 3948 	addw x,#1 
      00A643 72 01            [ 1] 3949 	adc a,#0  
      00A645 00               [ 4] 3950 	ret 
                                   3951 
                                   3952 ;---------------------------------
                                   3953 ; BASIC: WORDS 
                                   3954 ; affiche la listes des mots du
                                   3955 ; dictionnaire ainsi que le nombre
                                   3956 ; de mots.
                                   3957 ;---------------------------------
                           000001  3958 	WLEN=1 ; word length
                           000002  3959 	LLEN=2 ; character sent to console
                           000003  3960 	WCNT=3 ; count words printed 
                           000003  3961 	VSIZE=3 
      002D03                       3962 words:
      00A646 23 02            [ 2] 3963 	pushw y
      002D05                       3964 	_vars VSIZE
      00A648 4F 81            [ 2]    1     sub sp,#VSIZE 
      00A64A 0F 02            [ 1] 3965 	clr (LLEN,sp)
      00A64A 72 09            [ 1] 3966 	clr (WCNT,sp)
      00A64C 00 23 12 5B      [ 2] 3967 	ldw y,#kword_dict+2
      00A650 02               [ 1] 3968 0$:	ldw x,y
      00A651 CD               [ 1] 3969 	ld a,(x)
      00A652 A1 C8            [ 1] 3970 	and a,#15 
      00A654 5B 04            [ 1] 3971 	ld (WLEN,sp),a 
      00A656 72 19            [ 1] 3972 	inc (WCNT,sp)
      00A658 00               [ 1] 3973 1$:	incw x 
      00A659 23               [ 1] 3974 	ld a,(x)
      00A65A 72 10 00         [ 4] 3975 	call putc 
      00A65D 23 CC            [ 1] 3976 	inc (LLEN,sp)
      00A65F 97 73            [ 1] 3977 	dec (WLEN,sp)
      00A661 CE 00            [ 1] 3978 	jrne 1$
      00A663 1C C3            [ 1] 3979 	ld a,#70
      00A665 00 1E            [ 1] 3980 	cp a,(LLEN,sp)
      00A667 2B 0C            [ 1] 3981 	jrmi 2$   
      00A669 AE 96            [ 1] 3982 	ld a,#SPACE 
      00A66B 57 CD 89         [ 4] 3983 	call putc 
      00A66E E8 55            [ 1] 3984 	inc (LLEN,sp) 
      00A670 00 04            [ 2] 3985 	jra 3$
      00A672 00 02            [ 1] 3986 2$: ld a,#CR 
      00A674 81 09 0B         [ 4] 3987 	call putc 
      00A675 0F 02            [ 1] 3988 	clr (LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A675 5B 02 00 02      [ 2] 3989 3$:	subw y,#2 
      00A677 90 FE            [ 2] 3990 	ldw y,(y)
      00A677 CD 9D            [ 1] 3991 	jrne 0$ 
      00A679 0E CD            [ 1] 3992 	ld a,#CR 
      00A67B 94 76 CE         [ 4] 3993 	call putc  
      00A67E 00               [ 1] 3994 	clrw x 
      00A67F 1E CF            [ 1] 3995 	ld a,(WCNT,sp)
      00A681 00               [ 1] 3996 	ld xl,a 
      00A682 31 CF 00         [ 4] 3997 	call prt_i16 
      00A685 33 5F CF         [ 2] 3998 	ldw x,#words_count_msg
      00A688 00 07 72         [ 4] 3999 	call puts 
      002D52                       4000 	_drop VSIZE 
      00A68B 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A68D 09 72            [ 2] 4001 	popw y 
      00A68F 5F               [ 4] 4002 	ret 
      00A690 00 0A CE 00 1C CF 00  4003 words_count_msg: .asciz " words in dictionary\n"
             05 E6 02 C7 00 04 35
             03 00 02 72 10 00 23
             CC
                                   4004 
                                   4005 
                                   4006 ;-----------------------------
                                   4007 ; BASIC: TIMER expr 
                                   4008 ; initialize count down timer 
                                   4009 ;-----------------------------
      002D6D                       4010 set_timer:
      00A6A6 97 73 6E         [ 4] 4011 	call arg_list
      00A6A8 A1 01            [ 1] 4012 	cp a,#1 
      00A6A8 AE 17            [ 1] 4013 	jreq 1$
      00A6AA FF 94 CC         [ 2] 4014 	jp syntax_error
      002D77                       4015 1$: 
      002D77                       4016 	_xpop  
      00A6AD 97 54            [ 1]    1     ld a,(y)
      00A6AF 93               [ 1]    2     ldw x,y 
      00A6AF CD 98            [ 2]    3     ldw x,(1,x)
      00A6B1 26 A1 85 27      [ 2]    4     addw y,#CELL_SIZE 
      00A6B5 03 CC 96         [ 2] 4017 	ldw timer,x 
      00A6B8 C8               [ 4] 4018 	ret 
                                   4019 
                                   4020 ;------------------------------
                                   4021 ; BASIC: TIMEOUT 
                                   4022 ; return state of timer 
                                   4023 ; output:
                                   4024 ;   A:X     0 not timeout 
                                   4025 ;   A:X     -1 timeout 
                                   4026 ;------------------------------
      002D84                       4027 timeout:
      00A6B9 CD               [ 1] 4028 	clr a 
      00A6BA 98 4E CF         [ 2] 4029 	ldw x,timer 
      00A6BD 00 1A            [ 1] 4030 	jreq 1$
      00A6BF CD               [ 1] 4031 	clrw x
      00A6C0 89               [ 4] 4032 	ret  
      00A6C1 94               [ 1] 4033 1$:	cpl a
      00A6C2 27               [ 2] 4034 	cplw x 
      00A6C3 03               [ 4] 4035 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4036  	
                                   4037 
                                   4038 
                                   4039 
                                   4040 ;-----------------------------------
                                   4041 ; BASIC: IWDGEN expr1 
                                   4042 ; enable independant watchdog timer
                                   4043 ; expr1 is delay in multiple of 62.5µsec
                                   4044 ; expr1 -> {1..16383}
                                   4045 ;-----------------------------------
      002D8F                       4046 enable_iwdg:
      00A6C4 CD 89 9B         [ 4] 4047 	call arg_list
      00A6C7 72 3F            [ 1] 4048 	cp a,#1 
      00A6C9 00 1A            [ 1] 4049 	jreq 1$
      00A6CB 72 5C 00         [ 2] 4050 	jp syntax_error 
      002D99                       4051 1$: _xpop  
      00A6CE 1B 72            [ 1]    1     ld a,(y)
      00A6D0 3F               [ 1]    2     ldw x,y 
      00A6D1 00 1A            [ 2]    3     ldw x,(1,x)
      00A6D3 72 5C 00 1B      [ 2]    4     addw y,#CELL_SIZE 
      00A6D7 72 C7            [ 1] 4052 	push #0
      00A6D9 00 1A 81 E0      [ 1] 4053 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A6DC 9E               [ 1] 4054 	ld a,xh 
      00A6DC 90 89            [ 1] 4055 	and a,#0x3f
      00A6DE AE               [ 1] 4056 	ld xh,a  
      00A6DF 00 64 90         [ 2] 4057 2$:	cpw x,#255
      00A6E2 AE 03            [ 2] 4058 	jrule 3$
      00A6E4 E8 20            [ 1] 4059 	inc (1,sp)
      00A6E6 22               [ 1] 4060 	rcf 
      00A6E7 56               [ 2] 4061 	rrcw x 
      00A6E7 90 89            [ 2] 4062 	jra 2$
      00A6E9 CD 99 EE A1      [ 1] 4063 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A6ED 02               [ 1] 4064 	pop a  
      00A6EE 27 03 CC         [ 1] 4065 	ld IWDG_PR,a 
      00A6F1 96               [ 1] 4066 	ld a,xl
      00A6F2 C8               [ 1] 4067 	dec a 
      00A6F3 35 55 50 E0      [ 1] 4068 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A6F3 90 F6 93         [ 1] 4069 	ld IWDG_RLR,a 
      00A6F6 EE 01 72 A9      [ 1] 4070 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A6FA 00               [ 4] 4071 	ret 
                                   4072 
                                   4073 
                                   4074 ;-----------------------------------
                                   4075 ; BASIC: IWDGREF  
                                   4076 ; refresh independant watchdog count down 
                                   4077 ; timer before it reset MCU. 
                                   4078 ;-----------------------------------
      002DCD                       4079 refresh_iwdg:
      00A6FB 03 89 90 F6      [ 1] 4080 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A6FF 93               [ 4] 4081 	ret 
                                   4082 
                                   4083 
                                   4084 ;-------------------------------------
                                   4085 ; BASIC: LOG2(expr)
                                   4086 ; return logarithm base 2 of expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



                                   4087 ; this is the position of most significant
                                   4088 ; bit set. 
                                   4089 ; input: 
                                   4090 ; output:
                                   4091 ;   A     TK_INTGR 
                                   4092 ;   xstack log2 
                                   4093 ;*********************************
      002DD2                       4094 log2:
      00A700 EE 01 72         [ 4] 4095 	call func_args 
      00A703 A9 00            [ 1] 4096 	cp a,#1 
      00A705 03 90            [ 1] 4097 	jreq 1$
      00A707 93 85 48         [ 2] 4098 	jp syntax_error 
      00A709                       4099 1$: 
      002DDC                       4100 	_xpop    
      00A709 89 AE            [ 1]    1     ld a,(y)
      00A70B F4               [ 1]    2     ldw x,y 
      00A70C 24 65            [ 2]    3     ldw x,(1,x)
      00A70E 90 A3 7A 12      [ 2]    4     addw y,#CELL_SIZE 
      00A712 2B               [ 1] 4101 	tnz a
      00A713 01 5C            [ 1] 4102 	jrne 2$ 
      00A715 5D               [ 2] 4103 	tnzw x 
      00A715 9E C7            [ 1] 4104 	jrne 2$
      00A717 53 0D            [ 1] 4105 	ld a,#ERR_BAD_VALUE
      00A719 9F C7 53         [ 2] 4106 	jp tb_error 
      00A71C 0E 8C            [ 1] 4107 2$: push #24 
      00A71E 56               [ 2] 4108 3$: rlcw x 
      00A71F 9E               [ 1] 4109     rlc a 
      00A720 C7 53            [ 1] 4110 	jrc 4$
      00A722 0F 9F            [ 1] 4111 	dec (1,sp) 
      00A724 C7 53            [ 1] 4112 	jrne 3$
      00A726 10               [ 1] 4113 4$: clrw x 
      00A727 72               [ 1] 4114     pop a 
      00A728 10               [ 1] 4115 	dec a
      00A729 53               [ 1] 4116 	rlwa x  
      002DFE                       4117 9$:	
      00A72A 08               [ 4] 4118 	ret 
                                   4119 
                                   4120 ;-----------------------------------
                                   4121 ; BASIC: BIT(expr) 
                                   4122 ; expr ->{0..23}
                                   4123 ; return 2^expr 
                                   4124 ; output:
                                   4125 ;    A:X    2^expr 
                                   4126 ;-----------------------------------
      002DFF                       4127 bitmask:
      00A72B 72 10 53         [ 4] 4128     call func_args 
      00A72E 00 72            [ 1] 4129 	cp a,#1
      00A730 10 53            [ 1] 4130 	jreq 1$
      00A732 04 85 CD         [ 2] 4131 	jp syntax_error 
      002E09                       4132 1$: _xpop 
      00A735 AB 75            [ 1]    1     ld a,(y)
      00A737 72               [ 1]    2     ldw x,y 
      00A738 11 53            [ 2]    3     ldw x,(1,x)
      00A73A 08 72 11 53      [ 2]    4     addw y,#CELL_SIZE 
      00A73E 00               [ 1] 4133 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A73F 90 85 81         [ 2] 4134 	ldw x,#1 
      00A742 A4 17            [ 1] 4135 	and a,#23
      00A742 CD 99            [ 1] 4136 	jreq 9$
      00A744 EE               [ 1] 4137 	push a 
      00A745 A1               [ 1] 4138 	clr a 
      002E1C                       4139 2$: 
      00A746 02               [ 2] 4140 	slaw x 
      00A747 27               [ 1] 4141 	rlc a 	
      00A748 12 A1            [ 1] 4142 	dec (1,sp)
      00A74A 01 27            [ 1] 4143 	jrne 2$ 
      002E22                       4144 4$:
      002E22                       4145     _drop 1 
      00A74C 03 CC            [ 2]    1     addw sp,#1 
      00A74E 96               [ 4] 4146 9$:	ret 
                                   4147 
                                   4148 ;------------------------------
                                   4149 ; BASIC: DO 
                                   4150 ; initiate a DO ... UNTIL loop 
                                   4151 ;------------------------------
                           000003  4152 	DOLP_ADR=3 
                           000005  4153 	DOLP_INW=5
                           000004  4154 	VSIZE=4 
      002E25                       4155 do_loop:
      00A74F C8               [ 2] 4156 	popw x 
      002E26                       4157 	_vars VSIZE 
      00A750 4F 5F            [ 2]    1     sub sp,#VSIZE 
      00A752 72               [ 2] 4158 	pushw x 
      00A753 A2 00 03         [ 2] 4159 	ldw x,basicptr 
      00A756 90 F7            [ 2] 4160 	ldw (DOLP_ADR,sp),x
      00A758 90 EF 01         [ 2] 4161 	ldw x,in.w 
      00A75B 90 E6            [ 2] 4162 	ldw (DOLP_INW,sp),x
      00A75D 03 93 EE 04      [ 1] 4163 	inc loop_depth 
      00A761 5D               [ 4] 4164 	ret 
                                   4165 
                                   4166 ;--------------------------------
                                   4167 ; BASIC: UNTIL expr 
                                   4168 ; loop if exprssion is false 
                                   4169 ; else terminate loop
                                   4170 ;--------------------------------
      002E38                       4171 until: 
      00A762 27 25 90 F6      [ 1] 4172 	tnz loop_depth 
      00A766 93 EE            [ 1] 4173 	jrne 1$ 
      00A768 01 72 A9         [ 2] 4174 	jp syntax_error 
      002E41                       4175 1$: 
      00A76B 00 03 72         [ 4] 4176 	call condition  
      002E44                       4177 	_xpop 
      00A76E A9 00            [ 1]    1     ld a,(y)
      00A770 03               [ 1]    2     ldw x,y 
      00A771 9F A4            [ 2]    3     ldw x,(1,x)
      00A773 07 4E C7 54      [ 2]    4     addw y,#CELL_SIZE 
      00A777 01               [ 1] 4178 	tnz a 
      00A778 72 16            [ 1] 4179 	jrne 9$ 
      00A77A 50               [ 2] 4180 	tnzw x 
      00A77B CA 72            [ 1] 4181 	jrne 9$ 
      00A77D 10 54            [ 2] 4182 	ldw x,(DOLP_ADR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A77F 01 AE 00         [ 2] 4183 	ldw basicptr,x 
      00A782 1B 5A            [ 1] 4184 	ld a,(2,x)
      00A784 9D 26 FA         [ 1] 4185 	ld count,a 
      00A787 20 08            [ 2] 4186 	ldw x,(DOLP_INW,sp)
      00A789 72 11 54         [ 2] 4187 	ldw in.w,x 
      00A78C 01               [ 4] 4188 	ret 
      002E63                       4189 9$:	; remove loop data from stack  
      00A78D 72               [ 2] 4190 	popw x
      002E64                       4191 	_drop VSIZE
      00A78E 17 50            [ 2]    1     addw sp,#VSIZE 
      00A790 CA 5A 00 1F      [ 1] 4192 	dec loop_depth 
      00A791 FC               [ 2] 4193 	jp (x)
                                   4194 
                                   4195 ;--------------------------
                                   4196 ; BASIC: PORTA...PORTI  
                                   4197 ;  return constant value 
                                   4198 ;  PORT  base address 
                                   4199 ;---------------------------
      002E6B                       4200 const_porta:
      00A791 81 50 00         [ 2] 4201 	ldw x,#PA_BASE 
      00A792 4F               [ 1] 4202 	clr a 
      00A792 CD               [ 4] 4203 	ret 
      002E70                       4204 const_portb:
      00A793 99 E9 A1         [ 2] 4205 	ldw x,#PB_BASE 
      00A796 01               [ 1] 4206 	clr a 
      00A797 27               [ 4] 4207 	ret 
      002E75                       4208 const_portc:
      00A798 03 CC 96         [ 2] 4209 	ldw x,#PC_BASE 
      00A79B C8               [ 1] 4210 	clr a 
      00A79C 90               [ 4] 4211 	ret 
      002E7A                       4212 const_portd:
      00A79D F6 93 EE         [ 2] 4213 	ldw x,#PD_BASE 
      00A7A0 01               [ 1] 4214 	clr a 
      00A7A1 72               [ 4] 4215 	ret 
      002E7F                       4216 const_porte:
      00A7A2 A9 00 03         [ 2] 4217 	ldw x,#PE_BASE 
      00A7A5 A3               [ 1] 4218 	clr a 
      00A7A6 00               [ 4] 4219 	ret 
      002E84                       4220 const_portf:
      00A7A7 05 23 05         [ 2] 4221 	ldw x,#PF_BASE 
      00A7AA A6               [ 1] 4222 	clr a 
      00A7AB 0A               [ 4] 4223 	ret 
      002E89                       4224 const_portg:
      00A7AC CC 96 CA         [ 2] 4225 	ldw x,#PG_BASE 
      00A7AF 9F               [ 1] 4226 	clr a 
      00A7B0 C7               [ 4] 4227 	ret 
      002E8E                       4228 const_porti:
      00A7B1 00 0F A6         [ 2] 4229 	ldw x,#PI_BASE 
      00A7B4 05               [ 1] 4230 	clr a 
      00A7B5 C0               [ 4] 4231 	ret 
                                   4232 
                                   4233 ;-------------------------------
                                   4234 ; following return constant 
                                   4235 ; related to GPIO register offset 
                                   4236 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      002E93                       4237 const_odr:
      00A7B6 00               [ 1] 4238 	clr a 
      00A7B7 0F C7 54         [ 2] 4239 	ldw x,#GPIO_ODR
      00A7BA 00               [ 4] 4240 	ret 
      002E98                       4241 const_idr:
      00A7BB 72               [ 1] 4242 	clr a 
      00A7BC 16 54 02         [ 2] 4243 	ldw x,#GPIO_IDR
      00A7BF 72               [ 4] 4244 	ret 
      002E9D                       4245 const_ddr:
      00A7C0 10               [ 1] 4246 	clr a
      00A7C1 54 01 72         [ 2] 4247 	ldw x,#GPIO_DDR
      00A7C4 0F               [ 4] 4248 	ret 
      002EA2                       4249 const_cr1:
      00A7C5 54               [ 1] 4250 	clr a 
      00A7C6 00 FB CE         [ 2] 4251 	ldw x,#GPIO_CR1
      00A7C9 54               [ 4] 4252 	ret 
      002EA7                       4253 const_cr2:
      00A7CA 04               [ 1] 4254 	clr a
      00A7CB A6 84 81         [ 2] 4255 	ldw x,#GPIO_CR2
      00A7CE 81               [ 4] 4256 	ret 
                                   4257 ;-------------------------
                                   4258 ; BASIC: POUT 
                                   4259 ;  constant for port mode
                                   4260 ;  used by PMODE 
                                   4261 ;  to set pin as output
                                   4262 ;------------------------
      002EAC                       4263 const_output:
      00A7CE 52               [ 1] 4264 	clr a 
      00A7CF 01 CD 99         [ 2] 4265 	ldw x,#OUTP
      00A7D2 E9               [ 4] 4266 	ret 
                                   4267 
                                   4268 ;-------------------------
                                   4269 ; BASIC: PINP 
                                   4270 ;  constant for port mode
                                   4271 ;  used by PMODE 
                                   4272 ;  to set pin as input
                                   4273 ;------------------------
      002EB1                       4274 const_input:
      00A7D3 A1               [ 1] 4275 	clr a  
      00A7D4 01 27 03         [ 2] 4276 	ldw x,#INP 
      00A7D7 CC               [ 4] 4277 	ret 
                                   4278 	
                                   4279 ;-----------------------
                                   4280 ; memory area constants
                                   4281 ;-----------------------
      002EB6                       4282 const_eeprom_base:
      00A7D8 96               [ 1] 4283 	clr a  
      00A7D9 C8 90 F6         [ 2] 4284 	ldw x,#EEPROM_BASE 
      00A7DC 93               [ 4] 4285 	ret 
                                   4286 
                                   4287 ;---------------------------
                                   4288 ; BASIC: DATA 
                                   4289 ; when the interpreter find 
                                   4290 ; a DATA line it skip it.
                                   4291 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      002EBB                       4292 data:
      00A7DD EE 01 72 A9 00   [ 1] 4293 	mov in,count 
      00A7E2 03               [ 4] 4294 	ret 
                                   4295 
                                   4296 ;------------------------------
                                   4297 ; check if it is a DATA line 
                                   4298 ; input: 
                                   4299 ;    X    line address 
                                   4300 ; output:
                                   4301 ;    Z    set if DATA line 
                                   4302 ;----------------------------
      002EC1                       4303 is_data_line:
      00A7E3 A3               [ 2] 4304 	pushw x 
      00A7E4 00 0F            [ 1] 4305 	ld a,(3,x)
      00A7E6 23 05            [ 1] 4306 	cp a,#TK_CMD 
      00A7E8 A6 0A            [ 1] 4307 	jrne 9$
      00A7EA CC 96            [ 2] 4308 	ldw x,(4,x)
      00A7EC CA CD AC         [ 2] 4309 	cpw x,#data  
      00A7EF B8               [ 2] 4310 9$: popw x 
      00A7F0 6B               [ 4] 4311 	ret 
                                   4312 
                                   4313 ;---------------------------------
                                   4314 ; BASIC: RESTORE [line#]
                                   4315 ; set data_ptr to first data line
                                   4316 ; if no DATA found pointer set to
                                   4317 ; zero.
                                   4318 ; if a line# is given as argument 
                                   4319 ; a data line with that number 
                                   4320 ; is searched and the data pointer 
                                   4321 ; is set to it. If there is no 
                                   4322 ; data line with that number 
                                   4323 ; the program is interrupted. 
                                   4324 ;---------------------------------
      002ECF                       4325 restore:
      00A7F1 01               [ 1] 4326 	clrw x 
      00A7F2 E6 01 0D         [ 2] 4327 	ldw data_ptr,x 
      00A7F5 01 27 05         [ 2] 4328 	ldw data_ofs,x 
      00A7F8 44 0A 01         [ 2] 4329 	ldw x,txtbgn 
      00A7FB 26 FB A4         [ 4] 4330 	call next_token 
      00A7FE 01 5F            [ 1] 4331 	cp a,#TK_INTGR
      00A800 97 4F            [ 1] 4332 	jrne 0$
      00A802 5B 01 81         [ 4] 4333 	call get_int24
      00A805 90 89            [ 2] 4334 	pushw y 
      00A805 52               [ 1] 4335 	clr a 
      00A806 02 CD 99         [ 4] 4336 	call search_lineno  
      00A809 EE A1            [ 2] 4337 	popw y 
      00A80B 02               [ 2] 4338 	tnzw x 
      00A80C 27 03            [ 1] 4339 	jrne set_data_pointer 
      00A80E CC 96            [ 2] 4340 	jra data_error 
      002EF0                       4341 0$:
      002EF0                       4342 	_unget_token  
      00A810 C8 90 F6 93 EE   [ 1]    1      mov in,in.saved  
                                   4343 ; search first DATA line 	
      00A815 01 72 A9         [ 2] 4344 1$:	cpw x,txtend
      00A818 00 03            [ 1] 4345 	jruge data_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      002EFA                       4346 2$:	
      00A81A 9F 6B 02         [ 4] 4347 	call is_data_line 
      00A81D 90 F6            [ 1] 4348 	jrne 4$
      00A81F 93 EE 01         [ 4] 4349 4$:	call try_next_line 
      00A822 72 A9            [ 1] 4350 	jrne 4$ 
      00A824 00               [ 4] 4351 	ret 
                                   4352 
                                   4353 ;---------------------
                                   4354 ; set data pointer 
                                   4355 ; variables at new line 
                                   4356 ; input:
                                   4357 ;    X    line address 
                                   4358 ;----------------------
      002F05                       4359 set_data_pointer:
      00A825 03 A3 00         [ 2] 4360 	ldw data_ptr,x
      00A828 0F 23            [ 1] 4361 	ld a,(2,x)
      00A82A 05 A6 0A         [ 1] 4362 	ld data_len,a 
      00A82D CC 96 CA CD      [ 1] 4363 	mov data_ofs,#FIRST_DATA_ITEM
      00A831 AC               [ 4] 4364 	ret 
                                   4365 
                                   4366 
                                   4367 ;--------------------
                                   4368 ; at end of data line 
                                   4369 ; check if next line 
                                   4370 ; is a data line 
                                   4371 ; input:
                                   4372 ;    X   actual line address 
                                   4373 ;  
                                   4374 ;-------------------
      002F12                       4375 try_next_line: 
      00A832 B8 6B            [ 1] 4376 	ld a,(2,x)
      00A834 01 A6 01         [ 1] 4377 	ld acc8,a 
      00A837 0D 01 27 05      [ 1] 4378 	clr acc16 
      00A83B 48 0A 01 26      [ 2] 4379 	addw x,acc16 
      00A83F FB 0D 02         [ 2] 4380 	cpw x,txtend 
      00A842 26 05            [ 1] 4381 	jrult 1$
      00A844 43 E4            [ 2] 4382 	jra data_error 
      002F26                       4383 1$:	
      00A846 00 20 02         [ 4] 4384 	call is_data_line 
      00A849 EA 00            [ 1] 4385 	jreq 2$
      00A84B E7 00            [ 1] 4386 	ld a,#1  
      00A84D 5B 02            [ 2] 4387 	jra 9$
      00A84F 81 2F 05         [ 4] 4388 2$:	call set_data_pointer
      00A850 4F               [ 1] 4389 	clr a  
      00A850 72               [ 4] 4390 9$:	ret 
      002F34                       4391 data_error:	
      00A851 00 00            [ 1] 4392     ld a,#ERR_NO_DATA 
      00A853 23 02 4F         [ 2] 4393 	jp tb_error 
                                   4394 
                                   4395 
                                   4396 ;---------------------------------
                                   4397 ; BASIC: READ 
                                   4398 ; return next data item | 0 
                                   4399 ;---------------------------------
                           000001  4400 	CTX_BPTR=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                           000003  4401 	CTX_IN=3 
                           000004  4402 	CTX_COUNT=4 
                           000005  4403 	INT24=5
                           000007  4404 	VSIZE=7 
      002F39                       4405 read:
      002F39                       4406 	_vars  VSIZE 
      00A856 81 07            [ 2]    1     sub sp,#VSIZE 
      00A857 CD 21 38         [ 4] 4407 	call save_context
      002F3E                       4408 read01:	
      00A857 AE A8 7E         [ 1] 4409 	ld a,data_ofs
      00A85A CD 89 E8         [ 1] 4410 	cp a,data_len 
      00A85D 5B 02            [ 1] 4411 	jreq 2$ ; end of line  
      002F46                       4412 0$:
      00A85F 52 04 CD         [ 2] 4413 	ldw x,data_ptr 
      00A862 A1 B8 AE         [ 2] 4414 	ldw basicptr,x 
      00A865 16 90 CF 00 05   [ 1] 4415 	mov in,data_ofs 
      00A86A 7F 72 5F 00 04   [ 1] 4416 	mov count,data_len  
      00A86F 5F CF 00         [ 4] 4417 	call expression 
      00A872 01 72            [ 1] 4418 	cp a,#TK_INTGR 
      00A874 11 00            [ 1] 4419 	jreq 1$ 
      00A876 23 72 18         [ 2] 4420 	jp syntax_error 
      002F60                       4421 1$:
      00A879 00 23 CC         [ 4] 4422 	call next_token ; skip comma
      00A87C 97 73 0A         [ 2] 4423 	ldw x,basicptr 
      00A87F 62 72 65         [ 2] 4424 	ldw data_ptr,x 
      00A882 61 6B 20 70 6F   [ 1] 4425 	mov data_ofs,in 
      00A887 69 6E 74         [ 4] 4426 	call rest_context
      002F71                       4427 	_xpop 
      00A88A 2C 20            [ 1]    1     ld a,(y)
      00A88C 52               [ 1]    2     ldw x,y 
      00A88D 55 4E            [ 2]    3     ldw x,(1,x)
      00A88F 20 74 6F 20      [ 2]    4     addw y,#CELL_SIZE 
      002F7A                       4428 	_drop VSIZE 
      00A893 72 65            [ 2]    1     addw sp,#VSIZE 
      00A895 73               [ 4] 4429 	ret 
      002F7D                       4430 2$: ; end of line reached 
                                   4431 	; try next line 
      00A896 75 6D 65         [ 2] 4432 	ldw x,data_ptr  
      00A899 2E 0A 00         [ 4] 4433 	call try_next_line
      00A89C 27 C1            [ 1] 4434 	jreq 0$ 
      00A89C 72 01            [ 2] 4435 	jra data_error 
                                   4436 
                                   4437 ;---------------------------------
                                   4438 ; BASIC: SPIEN clkdiv, 0|1  
                                   4439 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4440 ; if clkdiv==-1 disable SPI
                                   4441 ; 0|1 -> disable|enable  
                                   4442 ;--------------------------------- 
                           000005  4443 SPI_CS_BIT=5
      002F87                       4444 spi_enable:
      00A89E 00 23 01         [ 4] 4445 	call arg_list 
      00A8A1 81 02            [ 1] 4446 	cp a,#2
      00A8A2 27 03            [ 1] 4447 	jreq 1$
      00A8A2 CD 95 1E         [ 2] 4448 	jp syntax_error 
      002F91                       4449 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A8A5 81 12 50 C7      [ 1] 4450 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A8A6 85               [ 2] 4451 	popw x  
      00A8A6 72               [ 2] 4452 	tnzw x 
      00A8A7 5F 00            [ 1] 4453 	jreq spi_disable 
      00A8A9 19               [ 2] 4454 	popw x 
      00A8AA 52 03            [ 1] 4455 	ld a,#(1<<SPI_CR1_BR)
      00A8AC CD               [ 4] 4456 	mul x,a 
      00A8AD 98               [ 1] 4457 	ld a,xl 
      00A8AE 26 A1 04         [ 1] 4458 	ld SPI_CR1,a 
                                   4459 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A8B1 27 03 CC 96      [ 1] 4460 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A8B5 C8 CD 98 68      [ 1] 4461 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4462 ; configure SPI as master mode 0.	
      00A8B9 A4 DF A1 45      [ 1] 4463 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4464 ; ~CS line controlled by sofware 	
      00A8BD 26 0C AE 40      [ 1] 4465 	bset SPI_CR2,#SPI_CR2_SSM 
      00A8C1 00 CF 00 1A      [ 1] 4466     bset SPI_CR2,#SPI_CR2_SSI 
                                   4467 ; enable SPI
      00A8C5 AE 47 FF 4F      [ 1] 4468 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A8C9 20               [ 4] 4469 	ret 
      002FBA                       4470 spi_disable:
      002FBA                       4471 	_drop #2; throw first argument.
      00A8CA 15 A1            [ 2]    1     addw sp,##2 
                                   4472 ; wait spi idle 
      00A8CC 46 27            [ 1] 4473 1$:	ld a,#0x82 
      00A8CE 06 AE 96         [ 1] 4474 	and a,SPI_SR
      00A8D1 08 CC            [ 1] 4475 	cp a,#2 
      00A8D3 96 CA            [ 1] 4476 	jrne 1$
      00A8D5 72 1D 52 00      [ 1] 4477 	bres SPI_CR1,#SPI_CR1_SPE
      00A8D5 AE B7 80 CF      [ 1] 4478 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A8D9 00 1A A6 02      [ 1] 4479 	bres PE_DDR,#SPI_CS_BIT 
      00A8DD AE               [ 4] 4480 	ret 
                                   4481 
      002FD2                       4482 spi_clear_error:
      00A8DE 7F FF            [ 1] 4483 	ld a,#0x78 
      00A8E0 C5 52 03         [ 1] 4484 	bcp a,SPI_SR 
      00A8E0 6B 01            [ 1] 4485 	jreq 1$
      00A8E2 1F 02 CD 87      [ 1] 4486 	clr SPI_SR 
      00A8E6 89               [ 4] 4487 1$: ret 
                                   4488 
      00A8E7                       4489 spi_send_byte:
      00A8E7 CD               [ 1] 4490 	push a 
      00A8E8 89 0B 27         [ 4] 4491 	call spi_clear_error
      00A8EB 08               [ 1] 4492 	pop a 
      00A8EC A6 45 CD 89 8B   [ 2] 4493 	btjf SPI_SR,#SPI_SR_TXE,.
      00A8F1 CD 88 07         [ 1] 4494 	ld SPI_DR,a
      00A8F4 AE 00 80 CD 88   [ 2] 4495 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A8F9 FD 7B 01         [ 1] 4496 	ld a,SPI_DR 
      00A8FC 1E               [ 4] 4497 	ret 
                                   4498 
      002FF4                       4499 spi_rcv_byte:
      00A8FD 02 72            [ 1] 4500 	ld a,#255
      00A8FF B0 00 1A C2 00   [ 2] 4501 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A904 19 22 E0         [ 1] 4502 	ld a,SPI_DR 
      00A907 CD               [ 4] 4503 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



                                   4504 
                                   4505 ;------------------------------
                                   4506 ; BASIC: SPIWR byte [,byte]
                                   4507 ; write 1 or more byte
                                   4508 ;------------------------------
      002FFF                       4509 spi_write:
      00A908 95 1E 1E         [ 4] 4510 	call expression
      00A90B 02 A3            [ 1] 4511 	cp a,#TK_INTGR 
      00A90D 47 FF            [ 1] 4512 	jreq 1$
      00A90F 26 03 CD         [ 2] 4513 	jp syntax_error 
      003009                       4514 1$:	
      00A912 9D               [ 1] 4515 	ld a,xl 
      00A913 D7 2F DE         [ 4] 4516 	call spi_send_byte 
      00A914 CD 17 A6         [ 4] 4517 	call next_token 
      00A914 5B 03            [ 1] 4518 	cp a,#TK_COMMA 
      00A916 81 02            [ 1] 4519 	jrne 2$ 
      00A917 20 E9            [ 2] 4520 	jra spi_write 
      00A917 CE               [ 1] 4521 2$:	tnz a 
      00A918 B7 80            [ 1] 4522 	jreq 3$
      003019                       4523 	_unget_token  
      00A91A C3 A9 D7 81 01   [ 1]    1      mov in,in.saved  
      00A91E 81               [ 4] 4524 3$:	ret 
                                   4525 
                                   4526 
                                   4527 ;-------------------------------
                                   4528 ; BASIC: SPIRD 	
                                   4529 ; read one byte from SPI 
                                   4530 ;-------------------------------
      00301F                       4531 spi_read:
      00A91E 88 4D 27         [ 4] 4532 	call spi_rcv_byte 
      00A921 0A               [ 1] 4533 	clrw x 
      00A922 F6               [ 1] 4534 	ld xl,a 
      00A923 5C               [ 1] 4535 	clr a  
      00A924 90               [ 4] 4536 	ret 
                                   4537 
                                   4538 ;------------------------------
                                   4539 ; BASIC: SPISEL 0|1 
                                   4540 ; set state of ~CS line
                                   4541 ; 0|1 deselect|select  
                                   4542 ;------------------------------
      003026                       4543 spi_select:
      00A925 F7 90 5C         [ 4] 4544 	call next_token 
      00A928 0A 01            [ 1] 4545 	cp a,#TK_INTGR 
      00A92A 26 F6            [ 1] 4546 	jreq 1$
      00A92C 84 81 48         [ 2] 4547 	jp syntax_error 
      00A92E 5D               [ 2] 4548 1$: tnzw x  
      00A92E 88 90            [ 1] 4549 	jreq cs_high 
      00A930 AE 16 E0 90      [ 1] 4550 	bres PE_ODR,#SPI_CS_BIT
      00A934 89               [ 4] 4551 	ret 
      003038                       4552 cs_high: 
      00A935 A6 80 90 7F      [ 1] 4553 	bset PE_ODR,#SPI_CS_BIT
      00A939 90               [ 4] 4554 	ret 
                                   4555 
                                   4556 ;-------------------------------
                                   4557 ; BASIC: PAD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



                                   4558 ; Return pad buffer address.
                                   4559 ;------------------------------
      00303D                       4560 pad_ref:
      00A93A 5C 4A 26         [ 2] 4561 	ldw x,#pad 
      00A93D F9               [ 1] 4562 	clr a
      00A93E 90               [ 4] 4563 	ret 
                                   4564 
                                   4565 ;****************************
                                   4566 ; expression stack 
                                   4567 ; manipulation routines
                                   4568 ;****************************
                                   4569 
                                   4570 ;-----------------------------
                                   4571 ; BASIC: PUSH expr|rel|cond 
                                   4572 ; push the result on xtack
                                   4573 ;-----------------------------
      003042                       4574 xpush:
      00A93F 85 84 81         [ 4] 4575 	call condition 
      00A942 81               [ 4] 4576 	ret 
                                   4577 
                                   4578 ;------------------------------
                                   4579 ; BASIC: POP 
                                   4580 ; pop top of xstack 
                                   4581 ;------------------------------
      003046                       4582 xpop:
      003046                       4583 	_xpop 
      00A942 89 90            [ 1]    1     ld a,(y)
      00A944 89               [ 1]    2     ldw x,y 
      00A945 52 06            [ 2]    3     ldw x,(1,x)
      00A947 CD A9 17 26      [ 2]    4     addw y,#CELL_SIZE 
      00A94B 09               [ 4] 4584 	ret 
                                   4585 
                                   4586 
                                   4587 ;------------------------------
                                   4588 ; BASIC: ALLOC expr 
                                   4589 ; allocate expr element on xtack 
                                   4590 ;-------------------------------
      003050                       4591 xalloc: 
      00A94C AE A9 D9         [ 4] 4592 	call expression 
      00A94F CD 89            [ 1] 4593 	cp a,#TK_INTGR
      00A951 E8 CC            [ 1] 4594 	jreq 1$ 
      00A953 A9 D1 48         [ 2] 4595 	jp syntax_error
      00A955                       4596 1$: _xpop 
      00A955 CE 00            [ 1]    1     ld a,(y)
      00A957 1C               [ 1]    2     ldw x,y 
      00A958 C3 00            [ 2]    3     ldw x,(1,x)
      00A95A 1E 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A95E AA               [ 1] 4597 	tnz a 
      00A95F 1B CD            [ 1] 4598 	jreq 3$ 
      00A961 89 E8            [ 1] 4599 2$:	ld a,#ERR_BAD_VALUE
      00A963 CC A9 D1         [ 2] 4600 	jp tb_error 
      00A966 A3 00 14         [ 2] 4601 3$: cpw x,#XSTACK_SIZE 
      00A966 CD 87            [ 1] 4602 	jrugt 2$
      00A968 C9 72            [ 1] 4603 	ld a,#CELL_SIZE 
      00A96A 5F               [ 4] 4604 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A96B 00 19 AE         [ 2] 4605 	ldw acc16,x 
      00A96E B7 80 CF 00      [ 2] 4606 	subw y,acc16 
      00A972 1A CD 9F 91      [ 2] 4607 	cpw y,#xstack_full
      00A976 1F 05            [ 1] 4608 	jrugt 9$
      00A978 0F 03            [ 1] 4609 	ld a,#ERR_MEM_FULL
      00A97A CD A9 2E         [ 2] 4610 	jp tb_error 
      003085                       4611 9$:	 
      00A97D CE               [ 4] 4612 	ret 
                                   4613 
                                   4614 
                                   4615 ;------------------------------
                                   4616 ;  BASIC DROP expr 
                                   4617 ;  expr in range {0..XSTACK_SIZE}
                                   4618 ;  discard n elements from xtack
                                   4619 ;------------------------------
      003086                       4620 xdrop:
      00A97E A9 D7 90         [ 4] 4621 	call expression 
      00A981 FF 72            [ 1] 4622 	cp a,#TK_INTGR
      00A983 A9 00            [ 1] 4623 	jreq 1$ 
      00A985 02 1E 05         [ 2] 4624 	jp syntax_error 
      003090                       4625 1$:	_xpop 
      00A988 90 FF            [ 1]    1     ld a,(y)
      00A98A 72               [ 1]    2     ldw x,y 
      00A98B A9 00            [ 2]    3     ldw x,(1,x)
      00A98D 02 A6 7C 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A991 04               [ 1] 4626 	ld a,xl 
      00A992 A3 00            [ 1] 4627 	and a,#0x1f 
      00A994 7C               [ 1] 4628 	clrw x 
      00A995 22               [ 1] 4629 	ld xl,a 
      00A996 01 9F            [ 1] 4630 	ld a,#CELL_SIZE 
      00A998 6B               [ 4] 4631 	mul x,a 
      00A999 04 CE 00         [ 2] 4632 	ldw acc16,x  
      00A99C 1C 1F 01 0D      [ 2] 4633 	addw y,acc16 
      00A99F 90 A3 17 73      [ 2] 4634 	cpw y,#XSTACK_EMPTY 
      00A99F 1E 01            [ 2] 4635 	jrule 9$
      00A9A1 7B 04 CD A9      [ 2] 4636 	ldw y,#XSTACK_EMPTY 
      00A9A5 1E               [ 4] 4637 9$:	ret 
                                   4638 
                                   4639 ;-----------------------
                                   4640 ; check if value in A:X 
                                   4641 ; is inside xstack bound
                                   4642 ; output:
                                   4643 ;    X     slot address  
                                   4644 ;-----------------------
      0030B3                       4645 xstack_bound:
      00A9A6 1F               [ 1] 4646 	tnz a 
      00A9A7 01 AE            [ 1] 4647 	jrne 8$ 
      00A9A9 16 E0 CD         [ 2] 4648 1$: cpw x,#XSTACK_SIZE 
      00A9AC 87 E3            [ 1] 4649 	jrugt 8$
      00A9AE AE 00            [ 1] 4650 	ld a,#CELL_SIZE 
      00A9B0 80               [ 4] 4651 	mul x,a
      00A9B1 CD 88 FD         [ 2] 4652 	ldw acc16,x 
      00A9B4 1E               [ 1] 4653 	ldw x,y 
      00A9B5 01 C3 00 1E      [ 2] 4654 	addw x,acc16 
      00A9B9 24 16 1E         [ 2] 4655 	cpw x,#XSTACK_EMPTY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9BC 05 72            [ 1] 4656 	jruge 8$  
      00A9BE F0               [ 4] 4657 	ret 
      00A9BF 03 1F            [ 1] 4658 8$: ld a,#ERR_BAD_VALUE
      00A9C1 05 A6 80         [ 2] 4659 	jp tb_error 
                                   4660 
                                   4661 ;-------------------------
                                   4662 ; BASIC: PUT expr, cond 
                                   4663 ; expr -> slot 
                                   4664 ; cond -> valut to put 
                                   4665 ; on xstack 
                                   4666 ;-------------------------
      0030D1                       4667 xput:
      00A9C4 A3 00 80         [ 4] 4668 	call arg_list 
      00A9C7 24 01            [ 1] 4669 	cp a,#2 
      00A9C9 9F 6B            [ 1] 4670 	jreq 1$ 
      00A9CB 04 CD A9         [ 2] 4671 0$:	jp syntax_error
      0030DB                       4672 1$: _xpop   ; value to put 
      00A9CE 2E 20            [ 1]    1     ld a,(y)
      00A9D0 CE               [ 1]    2     ldw x,y 
      00A9D1 5B 06            [ 2]    3     ldw x,(1,x)
      00A9D3 90 85 85 81      [ 2]    4     addw y,#CELL_SIZE 
      00A9D7 54               [ 2] 4673 	pushw x 
      00A9D8 42               [ 1] 4674 	push a 
      0030E6                       4675 	_xpop    ; slot 
      00A9D9 43 61            [ 1]    1     ld a,(y)
      00A9DB 6E               [ 1]    2     ldw x,y 
      00A9DC 27 74            [ 2]    3     ldw x,(1,x)
      00A9DE 20 66 6C 61      [ 2]    4     addw y,#CELL_SIZE 
      00A9E2 73 68 20         [ 4] 4676 	call xstack_bound
      00A9E5 61 70 70         [ 2] 4677     ldw ptr16,x 
      00A9E8 6C               [ 1] 4678 	pop a 
      00A9E9 69               [ 2] 4679 	popw x 
      00A9EA 63 61 74 69      [ 4] 4680 	ld [ptr16],a 
      00A9EE 6F 6E 2C 20      [ 1] 4681 	inc ptr8 
      00A9F2 61 6C 72 65      [ 5] 4682 	ldw [ptr16],x 
      00A9F6 61               [ 4] 4683 	ret 
                                   4684 
                                   4685 ;------------------------
                                   4686 ; BASIC: PICK expr 
                                   4687 ; get nième element on 
                                   4688 ; xtack. 
                                   4689 ;-----------------------
      003104                       4690 xpick:
      00A9F7 64 79 20         [ 4] 4691 	call func_args 
      00A9FA 6F 6E            [ 1] 4692 	cp a,#1 
      00A9FC 65 20            [ 1] 4693 	jreq 1$
      00A9FE 69 6E 20         [ 2] 4694 	jp syntax_error 
      00310E                       4695 1$: _xpop 
      00AA01 46 4C            [ 1]    1     ld a,(y)
      00AA03 41               [ 1]    2     ldw x,y 
      00AA04 53 48            [ 2]    3     ldw x,(1,x)
      00AA06 0A 75 73 65      [ 2]    4     addw y,#CELL_SIZE 
      00AA0A 20 45 52         [ 4] 4696 	call xstack_bound
      00AA0D 41               [ 1] 4697     ld a,(x)
      00AA0E 53 45            [ 2] 4698 	ldw x,(1,x)				
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AA10 20               [ 4] 4699 	ret 
                                   4700 
                                   4701 
                                   4702 
                                   4703 ;------------------------------
                                   4704 ;      dictionary 
                                   4705 ; format:
                                   4706 ;   link:   2 bytes 
                                   4707 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4708 ;   cmd_name: 16 byte max 
                                   4709 ;   code_addr: 2 bytes 
                                   4710 ;------------------------------
                                   4711 	.macro _dict_entry len,name,code_addr 
                                   4712 	.word LINK 
                                   4713 	LINK=.
                                   4714 name:
                                   4715 	.byte len   	
                                   4716 	.ascii "name"
                                   4717 	.word code_addr  
                                   4718 	.endm 
                                   4719 
                           000000  4720 	LINK=0
                                   4721 ; respect alphabetic order for BASIC names from Z-A
                                   4722 ; this sort order is for a cleaner WORDS cmd output. 	
      00311E                       4723 kword_end:
      00311E                       4724 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AA11 5C 46                    1 	.word LINK 
                           003120     2 	LINK=.
      003120                          3 XOR:
      00AA13 20                       4 	.byte 3+F_XOR   	
      00AA14 62 65 66                 5 	.ascii "XOR"
      00AA17 6F 72                    6 	.word TK_XOR  
      003126                       4725 	_dict_entry,5,WRITE,write  
      00AA19 65 00                    1 	.word LINK 
                           003128     2 	LINK=.
      003128                          3 WRITE:
      00AA1B 4E                       4 	.byte 5   	
      00AA1C 6F 20 61 70 70           5 	.ascii "WRITE"
      00AA21 6C 69                    6 	.word write  
      003130                       4726 	_dict_entry,5,WORDS,words 
      00AA23 63 61                    1 	.word LINK 
                           003132     2 	LINK=.
      003132                          3 WORDS:
      00AA25 74                       4 	.byte 5   	
      00AA26 69 6F 6E 20 69           5 	.ascii "WORDS"
      00AA2B 6E 20                    6 	.word words  
      00313A                       4727 	_dict_entry 4,WAIT,wait 
      00AA2D 52 41                    1 	.word LINK 
                           00313C     2 	LINK=.
      00313C                          3 WAIT:
      00AA2F 4D                       4 	.byte 4   	
      00AA30 00 41 49 54              5 	.ascii "WAIT"
      00AA31 21 FD                    6 	.word wait  
      003143                       4728 	_dict_entry,3+F_IFUNC,USR,usr
      00AA31 CD 9B                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           003145     2 	LINK=.
      003145                          3 USR:
      00AA33 41                       4 	.byte 3+F_IFUNC   	
      00AA34 A1 84 27                 5 	.ascii "USR"
      00AA37 03 CC                    6 	.word usr  
      00314B                       4729 	_dict_entry,5,UNTIL,until 
      00AA39 96 C8                    1 	.word LINK 
                           00314D     2 	LINK=.
      00314D                          3 UNTIL:
      00AA3B 90                       4 	.byte 5   	
      00AA3C F6 93 EE 01 72           5 	.ascii "UNTIL"
      00AA41 A9 00                    6 	.word until  
      003155                       4730 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00AA43 03 C7                    1 	.word LINK 
                           003157     2 	LINK=.
      003157                          3 UFLASH:
      00AA45 00                       4 	.byte 6+F_IFUNC   	
      00AA46 19 CF 00 1A 53 48        5 	.ascii "UFLASH"
      00AA4A 2A 8B                    6 	.word uflash  
      003160                       4731 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00AA4A CD 98                    1 	.word LINK 
                           003162     2 	LINK=.
      003162                          3 UBOUND:
      00AA4C 26                       4 	.byte 6+F_IFUNC   	
      00AA4D A1 08 27 02 20 20        5 	.ascii "UBOUND"
      00AA53 CD 9B                    6 	.word ubound  
      00316B                       4732 	_dict_entry,4,TONE,tone  
      00AA55 41 A1                    1 	.word LINK 
                           00316D     2 	LINK=.
      00316D                          3 TONE:
      00AA57 84                       4 	.byte 4   	
      00AA58 27 03 CC 96              5 	.ascii "TONE"
      00AA5C C8 90                    6 	.word tone  
      003174                       4733 	_dict_entry,2,TO,to
      00AA5E F6 93                    1 	.word LINK 
                           003176     2 	LINK=.
      003176                          3 TO:
      00AA60 EE                       4 	.byte 2   	
      00AA61 01 72                    5 	.ascii "TO"
      00AA63 A9 00                    6 	.word to  
      00317B                       4734 	_dict_entry,5,TIMER,set_timer
      00AA65 03 9F                    1 	.word LINK 
                           00317D     2 	LINK=.
      00317D                          3 TIMER:
      00AA67 5F                       4 	.byte 5   	
      00AA68 CD 88 2D AE 00           5 	.ascii "TIMER"
      00AA6D 01 CD                    6 	.word set_timer  
      003185                       4735 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AA6F 88 FD                    1 	.word LINK 
                           003187     2 	LINK=.
      003187                          3 TIMEOUT:
      00AA71 20                       4 	.byte 7+F_IFUNC   	
      00AA72 D7 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00AA73 2D 84                    6 	.word timeout  
      003191                       4736 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA73 81 87                    1 	.word LINK 
                           003193     2 	LINK=.
      00AA74                          3 TICKS:
      00AA74 CD                       4 	.byte 5+F_IFUNC   	
      00AA75 99 E9 A1 01 27           5 	.ascii "TICKS"
      00AA7A 03 CC                    6 	.word get_ticks  
      00319B                       4737 	_dict_entry,4,STOP,stop 
      00AA7C 96 C8                    1 	.word LINK 
                           00319D     2 	LINK=.
      00319D                          3 STOP:
      00AA7E 90                       4 	.byte 4   	
      00AA7F F6 93 EE 01              5 	.ascii "STOP"
      00AA83 72 A9                    6 	.word stop  
      0031A4                       4738 	_dict_entry,4,STEP,step 
      00AA85 00 03                    1 	.word LINK 
                           0031A6     2 	LINK=.
      0031A6                          3 STEP:
      00AA87 9F                       4 	.byte 4   	
      00AA88 A4 7F 81 50              5 	.ascii "STEP"
      00AA8B 23 AD                    6 	.word step  
      0031AD                       4739 	_dict_entry,5,SPIWR,spi_write
      00AA8B A6 06                    1 	.word LINK 
                           0031AF     2 	LINK=.
      0031AF                          3 SPIWR:
      00AA8D CD                       4 	.byte 5   	
      00AA8E 99 DC CD 98 26           5 	.ascii "SPIWR"
      00AA93 A1 02                    6 	.word spi_write  
      0031B7                       4740 	_dict_entry,6,SPISEL,spi_select
      00AA95 27 0E                    1 	.word LINK 
                           0031B9     2 	LINK=.
      0031B9                          3 SPISEL:
      00AA97 A1                       4 	.byte 6   	
      00AA98 04 27 12 A1 82 27        5 	.ascii "SPISEL"
      00AA9E 03 CC                    6 	.word spi_select  
      0031C2                       4741 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AAA0 96 C8                    1 	.word LINK 
                           0031C4     2 	LINK=.
      00AAA2                          3 SPIRD:
      00AAA2 FD                       4 	.byte 5+F_IFUNC   	
      00AAA3 20 0B 49 52 44           5 	.ascii "SPIRD"
      00AAA5 30 1F                    6 	.word spi_read  
      0031CC                       4742 	_dict_entry,5,SPIEN,spi_enable 
      00AAA5 F6 88                    1 	.word LINK 
                           0031CE     2 	LINK=.
      0031CE                          3 SPIEN:
      00AAA7 CD                       4 	.byte 5   	
      00AAA8 98 3F 84 20 03           5 	.ascii "SPIEN"
      00AAAD 2F 87                    6 	.word spi_enable  
      0031D6                       4743 	_dict_entry,5,SLEEP,sleep 
      00AAAD CD 98                    1 	.word LINK 
                           0031D8     2 	LINK=.
      0031D8                          3 SLEEP:
      00AAAF 68                       4 	.byte 5   	
      00AAB0 5F 02 72 A2 00           5 	.ascii "SLEEP"
      00AAB5 03 90                    6 	.word sleep  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      0031E0                       4744     _dict_entry,4,SIZE,cmd_size 
      00AAB7 F7 90                    1 	.word LINK 
                           0031E2     2 	LINK=.
      0031E2                          3 SIZE:
      00AAB9 EF                       4 	.byte 4   	
      00AABA 01 A6 07 CD              5 	.ascii "SIZE"
      00AABE 99 DC                    6 	.word cmd_size  
      00AAC0                       4745 	_dict_entry,4,SAVE,save_app 
      00AAC0 90 F6                    1 	.word LINK 
                           0031EB     2 	LINK=.
      0031EB                          3 SAVE:
      00AAC2 93                       4 	.byte 4   	
      00AAC3 EE 01 72 A9              5 	.ascii "SAVE"
      00AAC7 00 03                    6 	.word save_app  
      0031F2                       4746 	_dict_entry 3,RUN,run
      00AAC9 81 EB                    1 	.word LINK 
                           0031F4     2 	LINK=.
      00AACA                          3 RUN:
      00AACA CD                       4 	.byte 3   	
      00AACB 89 9B 81                 5 	.ascii "RUN"
      00AACE 25 C3                    6 	.word run  
      0031FA                       4747 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AACE 5F C6                    1 	.word LINK 
                           0031FC     2 	LINK=.
      0031FC                          3 RSHIFT:
      00AAD0 00                       4 	.byte 6+F_IFUNC   	
      00AAD1 2F C0 00 30 27 03        5 	.ascii "RSHIFT"
      00AAD7 53 A6                    6 	.word rshift  
      003205                       4748 	_dict_entry,3+F_IFUNC,RND,random 
      00AAD9 FF FC                    1 	.word LINK 
                           003207     2 	LINK=.
      00AADA                          3 RND:
      00AADA 81                       4 	.byte 3+F_IFUNC   	
      00AADB 52 4E 44                 5 	.ascii "RND"
      00AADB CD 99                    6 	.word random  
      00320D                       4749 	_dict_entry,6,RETURN,return 
      00AADD E9 A1                    1 	.word LINK 
                           00320F     2 	LINK=.
      00320F                          3 RETURN:
      00AADF 02                       4 	.byte 6   	
      00AAE0 27 03 CC 96 C8 90        5 	.ascii "RETURN"
      00AAE6 E6 03                    6 	.word return  
      003218                       4750 	_dict_entry,7,RESTORE,restore 
      00AAE8 93 EE                    1 	.word LINK 
                           00321A     2 	LINK=.
      00321A                          3 RESTORE:
      00AAEA 04                       4 	.byte 7   	
      00AAEB A3 50 00 2B 16 A3 50     5 	.ascii "RESTORE"
      00AAF2 29 2A                    6 	.word restore  
      003224                       4751 	_dict_entry 3,REM,remark 
      00AAF4 11 89                    1 	.word LINK 
                           003226     2 	LINK=.
      003226                          3 REM:
      00AAF6 90                       4 	.byte 3   	
      00AAF7 F6 93 EE                 5 	.ascii "REM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAFA 01 72                    6 	.word remark  
      00322C                       4752 	_dict_entry,6,REBOOT,cold_start
      00AAFC A9 00                    1 	.word LINK 
                           00322E     2 	LINK=.
      00322E                          3 REBOOT:
      00AAFE 03                       4 	.byte 6   	
      00AAFF 72 FB 01 5B 02 4F        5 	.ascii "REBOOT"
      00AB05 81 C3                    6 	.word cold_start  
      00AB06                       4753 	_dict_entry,4+F_IFUNC,READ,read  
      00AB06 A6 0A                    1 	.word LINK 
                           003239     2 	LINK=.
      003239                          3 READ:
      00AB08 CC                       4 	.byte 4+F_IFUNC   	
      00AB09 96 CA 41 44              5 	.ascii "READ"
      00AB0B 2F 39                    6 	.word read  
      003240                       4754 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AB0B CD A9                    1 	.word LINK 
                           003242     2 	LINK=.
      003242                          3 QKEY:
      00AB0D 17                       4 	.byte 4+F_IFUNC   	
      00AB0E 26 13 AE B7              5 	.ascii "QKEY"
      00AB12 80 72                    6 	.word qkey  
      003249                       4755 	_dict_entry,3,PUT,xput 
      00AB14 BB B7                    1 	.word LINK 
                           00324B     2 	LINK=.
      00324B                          3 PUT:
      00AB16 82                       4 	.byte 3   	
      00AB17 1C 00 04                 5 	.ascii "PUT"
      00AB1A 1C 00                    6 	.word xput  
      003251                       4756 	_dict_entry,4,PUSH,xpush   
      00AB1C 80 9F                    1 	.word LINK 
                           003253     2 	LINK=.
      003253                          3 PUSH:
      00AB1E A4                       4 	.byte 4   	
      00AB1F 80 97 20 03              5 	.ascii "PUSH"
      00AB23 AE B7                    6 	.word xpush  
      00325A                       4757 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AB25 80 53                    1 	.word LINK 
                           00325C     2 	LINK=.
      00AB26                          3 PORTI:
      00AB26 4F                       4 	.byte 5+F_IFUNC   	
      00AB27 81 4F 52 54 49           5 	.ascii "PORTI"
      00AB28 2E 8E                    6 	.word const_porti  
      003264                       4758 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AB28 CD 99                    1 	.word LINK 
                           003266     2 	LINK=.
      003266                          3 PORTG:
      00AB2A E9                       4 	.byte 5+F_IFUNC   	
      00AB2B A1 02 27 03 CC           5 	.ascii "PORTG"
      00AB30 96 C8                    6 	.word const_portg  
      00AB32                       4759 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AB32 90 E6                    1 	.word LINK 
                           003270     2 	LINK=.
      003270                          3 PORTF:
      00AB34 03                       4 	.byte 5+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AB35 93 EE 04 CF 00           5 	.ascii "PORTF"
      00AB3A 1A 90                    6 	.word const_portf  
      003278                       4760 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AB3C F6 93                    1 	.word LINK 
                           00327A     2 	LINK=.
      00327A                          3 PORTE:
      00AB3E EE                       4 	.byte 5+F_IFUNC   	
      00AB3F 01 72 A9 00 03           5 	.ascii "PORTE"
      00AB44 90 F7                    6 	.word const_porte  
      003282                       4761 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AB46 90 EF                    1 	.word LINK 
                           003284     2 	LINK=.
      003284                          3 PORTD:
      00AB48 01                       4 	.byte 5+F_IFUNC   	
      00AB49 72 CD 00 1A 81           5 	.ascii "PORTD"
      00AB4E 2E 7A                    6 	.word const_portd  
      00328C                       4762 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AB4E 72 0D                    1 	.word LINK 
                           00328E     2 	LINK=.
      00328E                          3 PORTC:
      00AB50 52                       4 	.byte 5+F_IFUNC   	
      00AB51 30 FB 8E CC 81           5 	.ascii "PORTC"
      00AB56 43 75                    6 	.word const_portc  
      00AB57                       4763 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AB57 72 0D                    1 	.word LINK 
                           003298     2 	LINK=.
      003298                          3 PORTB:
      00AB59 52                       4 	.byte 5+F_IFUNC   	
      00AB5A 30 FB 72 16 00           5 	.ascii "PORTB"
      00AB5F 23 8E                    6 	.word const_portb  
      0032A0                       4764 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AB61 81 98                    1 	.word LINK 
                           0032A2     2 	LINK=.
      00AB62                          3 PORTA:
      00AB62 CD                       4 	.byte 5+F_IFUNC   	
      00AB63 9B 41 A1 84 27           5 	.ascii "PORTA"
      00AB68 03 CC                    6 	.word const_porta  
      0032AA                       4765 	_dict_entry 5,PRINT,print 
      00AB6A 96 C8                    1 	.word LINK 
                           0032AC     2 	LINK=.
      0032AC                          3 PRINT:
      00AB6C 90                       4 	.byte 5   	
      00AB6D F6 93 EE 01 72           5 	.ascii "PRINT"
      00AB72 A9 00                    6 	.word print  
      0032B4                       4766 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AB74 03 AC                    1 	.word LINK 
                           0032B6     2 	LINK=.
      00AB75                          3 POUT:
      00AB75 CF                       4 	.byte 4+F_IFUNC   	
      00AB76 00 13 CE 00              5 	.ascii "POUT"
      00AB7A 13 5D                    6 	.word const_output  
      0032BD                       4767 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AB7C 27 03                    1 	.word LINK 
                           0032BF     2 	LINK=.
      0032BF                          3 POP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB7E 8F                       4 	.byte 3+F_IFUNC   	
      00AB7F 26 F7 50                 5 	.ascii "POP"
      00AB81 30 46                    6 	.word xpop  
      0032C5                       4768 	_dict_entry,4,POKE,poke 
      00AB81 81 BF                    1 	.word LINK 
                           0032C7     2 	LINK=.
      00AB82                          3 POKE:
      00AB82 CD                       4 	.byte 4   	
      00AB83 9B 41 A1 84              5 	.ascii "POKE"
      00AB87 27 03                    6 	.word poke  
      0032CE                       4769 	_dict_entry,5,PMODE,pin_mode 
      00AB89 CC 96                    1 	.word LINK 
                           0032D0     2 	LINK=.
      0032D0                          3 PMODE:
      00AB8B C8                       4 	.byte 5   	
      00AB8C 90 F6 93 EE 01           5 	.ascii "PMODE"
      00AB91 72 A9                    6 	.word pin_mode  
      0032D8                       4770 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AB93 00 03                    1 	.word LINK 
                           0032DA     2 	LINK=.
      00AB95                          3 PINP:
      00AB95 A3                       4 	.byte 4+F_IFUNC   	
      00AB96 14 00 2B 0C              5 	.ascii "PINP"
      00AB9A 35 0F                    6 	.word const_input  
      0032E1                       4771 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AB9C 50 F2                    1 	.word LINK 
                           0032E3     2 	LINK=.
      0032E3                          3 PICK:
      00AB9E A6                       4 	.byte 4+F_IFUNC   	
      00AB9F 1E 62 A6 10              5 	.ascii "PICK"
      00ABA3 62 20                    6 	.word xpick  
      0032EA                       4772 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00ABA5 1E E3                    1 	.word LINK 
                           0032EC     2 	LINK=.
      00ABA6                          3 PEEK:
      00ABA6 A3                       4 	.byte 4+F_IFUNC   	
      00ABA7 08 00 2B 09              5 	.ascii "PEEK"
      00ABAB 35 0E                    6 	.word peek  
      0032F3                       4773 	_dict_entry,5,PAUSE,pause 
      00ABAD 50 F2                    1 	.word LINK 
                           0032F5     2 	LINK=.
      0032F5                          3 PAUSE:
      00ABAF A6                       4 	.byte 5   	
      00ABB0 50 62 20 10 45           5 	.ascii "PAUSE"
      00ABB4 2A E2                    6 	.word pause  
      0032FD                       4774 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00ABB4 35 07                    1 	.word LINK 
                           0032FF     2 	LINK=.
      0032FF                          3 PAD:
      00ABB6 50                       4 	.byte 3+F_IFUNC   	
      00ABB7 F2 41 44                 5 	.ascii "PAD"
      00ABB8 30 3D                    6 	.word pad_ref  
      003305                       4775 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00ABB8 A3 00                    1 	.word LINK 
                           003307     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      003307                          3 OR:
      00ABBA 40                       4 	.byte 2+F_OR   	
      00ABBB 23 07                    5 	.ascii "OR"
      00ABBD 72 5C                    6 	.word TK_OR  
      00330C                       4776 	_dict_entry,2,ON,cmd_on 
      00ABBF 50 F2                    1 	.word LINK 
                           00330E     2 	LINK=.
      00330E                          3 ON:
      00ABC1 54                       4 	.byte 2   	
      00ABC2 20 F4                    5 	.ascii "ON"
      00ABC4 24 D6                    6 	.word cmd_on  
      003313                       4777 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00ABC4 9F 4A                    1 	.word LINK 
                           003315     2 	LINK=.
      003315                          3 ODR:
      00ABC6 27                       4 	.byte 3+F_IFUNC   	
      00ABC7 01 4A 52                 5 	.ascii "ODR"
      00ABC9 2E 93                    6 	.word const_odr  
      00331B                       4778 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00ABC9 A4 3E                    1 	.word LINK 
                           00331D     2 	LINK=.
      00331D                          3 NOT:
      00ABCB C7                       4 	.byte 3+F_NOT   	
      00ABCC 50 F1 72                 5 	.ascii "NOT"
      00ABCF 18 50                    6 	.word TK_NOT  
      003323                       4779 	_dict_entry,4,NEXT,next 
      00ABD1 F0 8E                    1 	.word LINK 
                           003325     2 	LINK=.
      003325                          3 NEXT:
      00ABD3 81                       4 	.byte 4   	
      00ABD4 4E 45 58 54              5 	.ascii "NEXT"
      00ABD4 C6 00                    6 	.word next  
      00332C                       4780 	_dict_entry,3,NEW,new
      00ABD6 10 CE                    1 	.word LINK 
                           00332E     2 	LINK=.
      00332E                          3 NEW:
      00ABD8 00                       4 	.byte 3   	
      00ABD9 11 81 57                 5 	.ascii "NEW"
      00ABDB 28 1C                    6 	.word new  
      003334                       4781 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00ABDB CD 99                    1 	.word LINK 
                           003336     2 	LINK=.
      003336                          3 LSHIFT:
      00ABDD E9                       4 	.byte 6+F_IFUNC   	
      00ABDE A1 01 27 03 CC 96        5 	.ascii "LSHIFT"
      00ABE4 C8 72                    6 	.word lshift  
      00ABE5                       4782 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00ABE5 CD 82                    1 	.word LINK 
                           003341     2 	LINK=.
      003341                          3 LOG2:
      00ABE7 6E                       4 	.byte 4+F_IFUNC   	
      00ABE8 90 F6 93 EE              5 	.ascii "LOG2"
      00ABEC 01 72                    6 	.word log2  
      003348                       4783 	_dict_entry 4,LIST,list
      00ABEE A9 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



                           00334A     2 	LINK=.
      00334A                          3 LIST:
      00ABF0 03                       4 	.byte 4   	
      00ABF1 81 49 53 54              5 	.ascii "LIST"
      00ABF2 1F A2                    6 	.word list  
      003351                       4784 	_dict_entry 3,LET,let 
      00ABF2 CD 99                    1 	.word LINK 
                           003353     2 	LINK=.
      003353                          3 LET:
      00ABF4 E9                       4 	.byte 3   	
      00ABF5 A1 02 27                 5 	.ascii "LET"
      00ABF8 03 CC                    6 	.word let  
      003359                       4785 	_dict_entry,3+F_CFUNC,KEY,key 
      00ABFA 96 C8                    1 	.word LINK 
                           00335B     2 	LINK=.
      00335B                          3 KEY:
      00ABFC 90                       4 	.byte 3+F_CFUNC   	
      00ABFD F6 93 EE                 5 	.ascii "KEY"
      00AC00 01 72                    6 	.word key  
      003361                       4786 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AC02 A9 00                    1 	.word LINK 
                           003363     2 	LINK=.
      003363                          3 IWDGREF:
      00AC04 03                       4 	.byte 7   	
      00AC05 9F 88 90 F6 93 EE 01     5 	.ascii "IWDGREF"
      00AC0C 72 A9                    6 	.word refresh_iwdg  
      00336D                       4787 	_dict_entry,6,IWDGEN,enable_iwdg
      00AC0E 00 03                    1 	.word LINK 
                           00336F     2 	LINK=.
      00336F                          3 IWDGEN:
      00AC10 0D                       4 	.byte 6   	
      00AC11 01 27 07 98 59 49        5 	.ascii "IWDGEN"
      00AC17 0A 01                    6 	.word enable_iwdg  
      003378                       4788 	_dict_entry,5,INPUT,input_var  
      00AC19 26 F9                    1 	.word LINK 
                           00337A     2 	LINK=.
      00337A                          3 INPUT:
      00AC1B 5B                       4 	.byte 5   	
      00AC1C 01 81 50 55 54           5 	.ascii "INPUT"
      00AC1E 21 58                    6 	.word input_var  
      003382                       4789 	_dict_entry,2,IF,if 
      00AC1E CD 99                    1 	.word LINK 
                           003384     2 	LINK=.
      003384                          3 IF:
      00AC20 E9                       4 	.byte 2   	
      00AC21 A1 02                    5 	.ascii "IF"
      00AC23 27 03                    6 	.word if  
      003389                       4790 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AC25 CC 96                    1 	.word LINK 
                           00338B     2 	LINK=.
      00338B                          3 IDR:
      00AC27 C8                       4 	.byte 3+F_IFUNC   	
      00AC28 90 F6 93                 5 	.ascii "IDR"
      00AC2B EE 01                    6 	.word const_idr  
      003391                       4791 	_dict_entry,3,HEX,hex_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AC2D 72 A9                    1 	.word LINK 
                           003393     2 	LINK=.
      003393                          3 HEX:
      00AC2F 00                       4 	.byte 3   	
      00AC30 03 9F 88                 5 	.ascii "HEX"
      00AC33 90 F6                    6 	.word hex_base  
      003399                       4792 	_dict_entry,4,GOTO,goto 
      00AC35 93 EE                    1 	.word LINK 
                           00339B     2 	LINK=.
      00339B                          3 GOTO:
      00AC37 01                       4 	.byte 4   	
      00AC38 72 A9 00 03              5 	.ascii "GOTO"
      00AC3C 0D 01                    6 	.word goto  
      0033A2                       4793 	_dict_entry,5,GOSUB,gosub 
      00AC3E 27 07                    1 	.word LINK 
                           0033A4     2 	LINK=.
      0033A4                          3 GOSUB:
      00AC40 98                       4 	.byte 5   	
      00AC41 46 56 0A 01 26           5 	.ascii "GOSUB"
      00AC46 F9 5B                    6 	.word gosub  
      0033AC                       4794 	_dict_entry,3,GET,cmd_get 
      00AC48 01 81                    1 	.word LINK 
                           0033AE     2 	LINK=.
      00AC4A                          3 GET:
      00AC4A A6                       4 	.byte 3   	
      00AC4B 84 CD 99                 5 	.ascii "GET"
      00AC4E DC CD                    6 	.word cmd_get  
      0033B4                       4795 	_dict_entry,4+F_IFUNC,FREE,free
      00AC50 98 58                    1 	.word LINK 
                           0033B6     2 	LINK=.
      0033B6                          3 FREE:
      00AC52 9F                       4 	.byte 4+F_IFUNC   	
      00AC53 A4 07 C7 50              5 	.ascii "FREE"
      00AC57 C6 81                    6 	.word free  
      00AC59                       4796 	_dict_entry,3,FOR,for 
      00AC59 52 01                    1 	.word LINK 
                           0033BF     2 	LINK=.
      0033BF                          3 FOR:
      00AC5B CD                       4 	.byte 3   	
      00AC5C 99 EE A1                 5 	.ascii "FOR"
      00AC5F 02 27                    6 	.word for  
      0033C5                       4797 	_dict_entry,4,FCPU,fcpu 
      00AC61 03 CC                    1 	.word LINK 
                           0033C7     2 	LINK=.
      0033C7                          3 FCPU:
      00AC63 96                       4 	.byte 4   	
      00AC64 C8 90 F6 93              5 	.ascii "FCPU"
      00AC68 EE 01                    6 	.word fcpu  
      0033CE                       4798 	_dict_entry,5,ERASE,erase 
      00AC6A 72 A9                    1 	.word LINK 
                           0033D0     2 	LINK=.
      0033D0                          3 ERASE:
      00AC6C 00                       4 	.byte 5   	
      00AC6D 03 CF 00 1A 90           5 	.ascii "ERASE"
      00AC72 F6 93                    6 	.word erase  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      0033D8                       4799 	_dict_entry,3,END,cmd_end  
      00AC74 EE 01                    1 	.word LINK 
                           0033DA     2 	LINK=.
      0033DA                          3 END:
      00AC76 72                       4 	.byte 3   	
      00AC77 A9 00 03                 5 	.ascii "END"
      00AC7A CD AC                    6 	.word cmd_end  
      0033E0                       4800 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AC7C B8 6B                    1 	.word LINK 
                           0033E2     2 	LINK=.
      0033E2                          3 EEPROM:
      00AC7E 01                       4 	.byte 6+F_IFUNC   	
      00AC7F A6 01 0D 01 27 0D        5 	.ascii "EEPROM"
      00AC85 48 0A                    6 	.word const_eeprom_base  
      0033EB                       4801 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AC87 01 26                    1 	.word LINK 
                           0033ED     2 	LINK=.
      0033ED                          3 EEFREE:
      00AC89 FB                       4 	.byte 6+F_IFUNC   	
      00AC8A 6B 01 7B 01 EA 03        5 	.ascii "EEFREE"
      00AC90 E7 03                    6 	.word func_eefree  
      0033F6                       4802 	_dict_entry,4,EDIT,edit 
      00AC92 A6 01                    1 	.word LINK 
                           0033F8     2 	LINK=.
      0033F8                          3 EDIT:
      00AC94 C1                       4 	.byte 4   	
      00AC95 00 0F 27 10              5 	.ascii "EDIT"
      00AC99 7B 01                    6 	.word edit  
      0033FF                       4803 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AC9B 43 E4                    1 	.word LINK 
                           003401     2 	LINK=.
      003401                          3 DWRITE:
      00AC9D 04                       4 	.byte 6+F_CMD   	
      00AC9E E7 04 7B 01 43 E4        5 	.ascii "DWRITE"
      00ACA4 02 E7                    6 	.word digital_write  
      00340A                       4804 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00ACA6 02 20                    1 	.word LINK 
                           00340C     2 	LINK=.
      00340C                          3 DROP:
      00ACA8 0C                       4 	.byte 4   	
      00ACA9 44 52 4F 50              5 	.ascii "DROP"
      00ACA9 7B 01                    6 	.word xdrop  
      003413                       4805 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00ACAB EA 02                    1 	.word LINK 
                           003415     2 	LINK=.
      003415                          3 DREAD:
      00ACAD E7                       4 	.byte 5+F_IFUNC   	
      00ACAE 02 7B 01 EA 04           5 	.ascii "DREAD"
      00ACB3 E7 04                    6 	.word digital_read  
      00ACB5                       4806 	_dict_entry,2,DO,do_loop
      00ACB5 5B 01                    1 	.word LINK 
                           00341F     2 	LINK=.
      00341F                          3 DO:
      00ACB7 81                       4 	.byte 2   	
      00ACB8 44 4F                    5 	.ascii "DO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ACB8 58 1C                    6 	.word do_loop  
      003424                       4807 	_dict_entry,3,DIM,cmd_dim 
      00ACBA AC C8                    1 	.word LINK 
                           003426     2 	LINK=.
      003426                          3 DIM:
      00ACBC FE                       4 	.byte 3   	
      00ACBD 9F 88 5E                 5 	.ascii "DIM"
      00ACC0 A6 05                    6 	.word cmd_dim  
      00342C                       4808 	_dict_entry,3,DEC,dec_base
      00ACC2 42 1C                    1 	.word LINK 
                           00342E     2 	LINK=.
      00342E                          3 DEC:
      00ACC4 50                       4 	.byte 3   	
      00ACC5 00 84 81                 5 	.ascii "DEC"
      00ACC8 1C 53                    6 	.word dec_base  
      003434                       4809 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00ACC8 03 06                    1 	.word LINK 
                           003436     2 	LINK=.
      003436                          3 DDR:
      00ACCA 03                       4 	.byte 3+F_IFUNC   	
      00ACCB 05 04 00                 5 	.ascii "DDR"
      00ACCE 02 01                    6 	.word const_ddr  
      00343C                       4810 	_dict_entry,4,DATA,data  
      00ACD0 06 00                    1 	.word LINK 
                           00343E     2 	LINK=.
      00343E                          3 DATA:
      00ACD2 02                       4 	.byte 4   	
      00ACD3 02 02 03 03              5 	.ascii "DATA"
      00ACD7 01 03                    6 	.word data  
      003445                       4811 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00ACD9 03 02                    1 	.word LINK 
                           003447     2 	LINK=.
      003447                          3 CR2:
      00ACDB 04                       4 	.byte 3+F_IFUNC   	
      00ACDC 04 05 02                 5 	.ascii "CR2"
      00ACDF 06 02                    6 	.word const_cr2  
      00344D                       4812 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00ACE1 07 02                    1 	.word LINK 
                           00344F     2 	LINK=.
      00344F                          3 CR1:
      00ACE3 05                       4 	.byte 3+F_IFUNC   	
      00ACE4 04 02 04                 5 	.ascii "CR1"
      00ACE7 01 A2                    6 	.word const_cr1  
      00ACE8                       4813 	_dict_entry,5,CONST,cmd_const 
      00ACE8 CD 99                    1 	.word LINK 
                           003457     2 	LINK=.
      003457                          3 CONST:
      00ACEA E9                       4 	.byte 5   	
      00ACEB A1 01 27 03 CC           5 	.ascii "CONST"
      00ACF0 96 C8                    6 	.word cmd_const  
      00ACF2                       4814 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00ACF2 90 F6                    1 	.word LINK 
                           003461     2 	LINK=.
      003461                          3 CHAR:
      00ACF4 93                       4 	.byte 4+F_CFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00ACF5 EE 01 72 A9              5 	.ascii "CHAR"
      00ACF9 00 03                    6 	.word func_char  
      003468                       4815 	_dict_entry,3,BYE,bye 
      00ACFB 89 88                    1 	.word LINK 
                           00346A     2 	LINK=.
      00346A                          3 BYE:
      00ACFD A6                       4 	.byte 3   	
      00ACFE 80 15 01                 5 	.ascii "BYE"
      00AD01 27 05                    6 	.word bye  
      003470                       4816 	_dict_entry,5,BTOGL,bit_toggle
      00AD03 A6 0A                    1 	.word LINK 
                           003472     2 	LINK=.
      003472                          3 BTOGL:
      00AD05 CC                       4 	.byte 5   	
      00AD06 96 CA 4F 47 4C           5 	.ascii "BTOGL"
      00AD08 22 7F                    6 	.word bit_toggle  
      00347A                       4817 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AD08 CE 00                    1 	.word LINK 
                           00347C     2 	LINK=.
      00347C                          3 BTEST:
      00AD0A 15                       4 	.byte 5+F_IFUNC   	
      00AD0B 58 58 58 58 58           5 	.ascii "BTEST"
      00AD10 9E C8                    6 	.word bit_test  
      003484                       4818 	_dict_entry,4,BSET,bit_set 
      00AD12 00 15                    1 	.word LINK 
                           003486     2 	LINK=.
      003486                          3 BSET:
      00AD14 C7                       4 	.byte 4   	
      00AD15 00 0E 9F C8              5 	.ascii "BSET"
      00AD19 00 16                    6 	.word bit_set  
      00348D                       4819 	_dict_entry,4,BRES,bit_reset
      00AD1B C7 00                    1 	.word LINK 
                           00348F     2 	LINK=.
      00348F                          3 BRES:
      00AD1D 0F                       4 	.byte 4   	
      00AD1E CE 00 17 CF              5 	.ascii "BRES"
      00AD22 00 15                    6 	.word bit_reset  
      003496                       4820 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AD24 CE 00                    1 	.word LINK 
                           003498     2 	LINK=.
      003498                          3 BIT:
      00AD26 17                       4 	.byte 3+F_IFUNC   	
      00AD27 54 9E C8                 5 	.ascii "BIT"
      00AD2A 00 17                    6 	.word bitmask  
      00349E                       4821 	_dict_entry,3,AWU,awu 
      00AD2C C7 00                    1 	.word LINK 
                           0034A0     2 	LINK=.
      0034A0                          3 AWU:
      00AD2E 17                       4 	.byte 3   	
      00AD2F 9F C8 00                 5 	.ascii "AWU"
      00AD32 18 C7                    6 	.word awu  
      0034A6                       4822 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AD34 00 18                    1 	.word LINK 
                           0034A8     2 	LINK=.
      0034A8                          3 ASC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00AD36 CE                       4 	.byte 3+F_IFUNC   	
      00AD37 00 0E 54                 5 	.ascii "ASC"
      00AD3A 54 54                    6 	.word ascii  
      0034AE                       4823 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AD3C 9E C8                    1 	.word LINK 
                           0034B0     2 	LINK=.
      0034B0                          3 AND:
      00AD3E 00                       4 	.byte 3+F_AND   	
      00AD3F 0E C7 00                 5 	.ascii "AND"
      00AD42 0E 9F                    6 	.word TK_AND  
      0034B6                       4824 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AD44 C8 00                    1 	.word LINK 
                           0034B8     2 	LINK=.
      0034B8                          3 ALLOC:
      00AD46 0F                       4 	.byte 5   	
      00AD47 C7 00 0F C8 00           5 	.ascii "ALLOC"
      00AD4C 18 97                    6 	.word xalloc  
      0034C0                       4825 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AD4E C6 00                    1 	.word LINK 
                           0034C2     2 	LINK=.
      0034C2                          3 ADCREAD:
      00AD50 0E                       4 	.byte 7+F_IFUNC   	
      00AD51 C8 00 17 95 CF 00 17     5 	.ascii "ADCREAD"
      00AD58 C6 00                    6 	.word analog_read  
      0034CC                       4826 	_dict_entry,5,ADCON,power_adc 
      00AD5A 16 A4                    1 	.word LINK 
                           0034CE     2 	LINK=.
      0034CE                          3 ADCON:
      00AD5C 7F                       4 	.byte 5   	
      00AD5D 72 A2 00 03 90           5 	.ascii "ADCON"
      00AD62 F7 90                    6 	.word power_adc  
      0034D6                       4827 kword_dict::
      0034D6                       4828 	_dict_entry,3+F_IFUNC,ABS,abs
      00AD64 EF 01                    1 	.word LINK 
                           0034D8     2 	LINK=.
      0034D8                          3 ABS:
      00AD66 84                       4 	.byte 3+F_IFUNC   	
      00AD67 85 72 A2                 5 	.ascii "ABS"
      00AD6A 00 03                    6 	.word abs  
                                   4829 
                           000000  4830 INDIRECT=0 
                           000000  4831 .if INDIRECT 
                                   4832 ;comands and fonctions address table 	
                                   4833 code_addr::
                                   4834 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4835 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4836 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4837 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4838 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4839 	.word let,list,log2,lshift,next,new ; 40..47
                                   4840 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4841 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4842 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4843 	.word restore,return, random,rshift,run,free ; 72..79
                                   4844 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



                                   4845 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4846 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4847 	.word func_eefree,0 
                                   4848 .endif 
                                   4849 
                                   4850 
                                   4851 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
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
      0034DE                         30 test:
      0034DE                         31     _vars VSIZE 
      00AD6C 90 F7            [ 2]    1     sub sp,#VSIZE 
      00AD6E 90 EF 01         [ 2]   32     ldw x,#LOOP_CNT
      00AD71 CD 84            [ 2]   33     ldw (CNTR,sp),x  
      00AD73 1C 90 F6         [ 2]   34     ldw x,ticks 
      00AD76 93 EE            [ 2]   35     ldw (T,sp),x
      0034EA                         36 1$: ; test add24 
      00AD78 01 72            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AD7A A9 00 03         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AD7D 1C 00 01         [ 1]   39     ld acc24,a 
      00AD80 A9 00 81         [ 2]   40     ldw acc24+1,x  
      00AD83 A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AD83 90 89 52         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AD86 03 0F 02         [ 4]   43     call add24 
      00AD89 0F 03            [ 2]   44     ldw x,(CNTR,sp)
      00AD8B 90 AE B5         [ 2]   45     subw x,#1
      00AD8E 58 93            [ 2]   46     ldw (CNTR,sp),x 
      00AD90 F6 A4            [ 1]   47     jrne 1$
      00AD92 0F 6B 01         [ 4]   48     call prt_acc24
      00AD95 0C 03            [ 1]   49     ld a,#SPACE 
      00AD97 5C F6 CD         [ 4]   50     call putc 
      00AD9A 89 8B 0C         [ 2]   51     ldw x,ticks 
      00AD9D 02 0A 01         [ 2]   52     subw x,(T,sp)
      00ADA0 26 F5 A6         [ 4]   53     call prt_i16  
      00ADA3 46 11            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00ADA5 02 2B 09         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ADA8 A6 20 CD         [ 2]   58     ldw x,LOOP_CNT
      00ADAB 89 8B            [ 2]   59     ldw (CNTR,sp),x 
      00ADAD 0C 02 20         [ 2]   60     ldw x,ticks 
      00ADB0 07 A6            [ 2]   61     ldw (T,sp),x 
      003526                         62 2$: 
      00ADB2 0D CD            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ADB4 89 8B 0F         [ 2]   64     ldw x,#VAL1&0XFFFF
      00ADB7 02 72 A2         [ 1]   65     ld acc24,a 
      00ADBA 00 02 90         [ 2]   66     ldw acc24+1,x  
      00ADBD FE 26            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00ADBF CF A6 0D         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00ADC2 CD 89 8B         [ 4]   69     call mul24 
      00ADC5 5F 7B            [ 2]   70     ldw x,(CNTR,sp)
      00ADC7 03 97 CD         [ 2]   71     subw x,#1
      00ADCA 98 6E            [ 2]   72     ldw (CNTR,sp),x 
      00ADCC AE AD            [ 1]   73     jrne 2$ 
      00ADCE D7 CD 89         [ 4]   74    call prt_acc24 
      00ADD1 E8 5B            [ 1]   75    ld a,#SPACE 
      00ADD3 03 90 85         [ 4]   76    call putc 
      00ADD6 81 20 77         [ 2]   77     ldw x,ticks 
      00ADD9 6F 72 64         [ 2]   78     subw x,(T,sp)
      00ADDC 73 20 69         [ 4]   79     call prt_i16 
      00ADDF 6E 20            [ 1]   80     ld a,#CR 
      00ADE1 64 69 63         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00ADE4 74 69 6F         [ 2]   83     ldw x,LOOP_CNT
      00ADE7 6E 61            [ 2]   84     ldw (CNTR,sp),x 
      00ADE9 72 79 0A         [ 2]   85     ldw x,ticks 
      00ADEC 00 01            [ 2]   86     ldw (T,sp),x 
      00ADED                         87 3$: 
      00ADED CD 99            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00ADEF EE A1 01         [ 2]   89     ldw x,#VAL1&0XFFFF
      00ADF2 27 03 CC         [ 1]   90     ld acc24,a 
      00ADF5 96 C8 0D         [ 2]   91     ldw acc24+1,x  
      00ADF7 A6 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00ADF7 90 F6 93         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00ADFA EE 01 72         [ 4]   94     call mul24 
      00ADFD A9 00            [ 2]   95     ldw x,(CNTR,sp)
      00ADFF 03 CF 00         [ 2]   96     subw x,#1
      00AE02 13 81            [ 2]   97     ldw (CNTR,sp),x 
      00AE04 26 E4            [ 1]   98     jrne 3$ 
      00AE04 4F CE 00         [ 4]   99     call prt_acc24    
      00AE07 13 27            [ 1]  100     ld a,#SPACE 
      00AE09 02 5F 81         [ 4]  101     call putc 
      00AE0C 43 53 81         [ 2]  102     ldw x,ticks 
      00AE0F 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AE0F CD 99 EE         [ 4]  104     call prt_i16 
      00AE12 A1 01            [ 1]  105     ld a,#CR 
      00AE14 27 03 CC         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AE17 96 C8 90         [ 2]  108     ldw x,LOOP_CNT
      00AE1A F6 93            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]



      00AE1C EE 01 72         [ 2]  110     ldw x,ticks 
      00AE1F A9 00            [ 2]  111     ldw (T,sp),x 
      00359E                        112 4$:
      00AE21 03 4B            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AE23 00 35 CC         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AE26 50 E0 9E         [ 1]  115     ld acc24,a 
      00AE29 A4 3F 95         [ 2]  116     ldw acc24+1,x  
      00AE2C A3 00            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AE2E FF 23 06         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AE31 0C 01 98         [ 4]  119     call mul24 
      00AE34 56 20            [ 2]  120     ldw x,(CNTR,sp)
      00AE36 F5 35 55         [ 2]  121     subw x,#1
      00AE39 50 E0            [ 2]  122     ldw (CNTR,sp),x 
      00AE3B 84 C7            [ 1]  123     jrne 4$ 
      00AE3D 50 E1 9F         [ 4]  124     call prt_acc24 
      00AE40 4A 35            [ 1]  125     ld a,#SPACE 
      00AE42 55 50 E0         [ 4]  126     call putc 
      00AE45 C7 50 E2         [ 2]  127     ldw x,ticks 
      00AE48 35 AA 50         [ 2]  128     subw x,(T,sp)
      00AE4B E0 81 EE         [ 4]  129     call prt_i16 
      00AE4D A6 0D            [ 1]  130     ld a,#CR 
      00AE4D 35 AA 50         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AE50 E0 81 10         [ 2]  133     ldw x,LOOP_CNT
      00AE52 1F 03            [ 2]  134     ldw (CNTR,sp),x 
      00AE52 CD 99 E9         [ 2]  135     ldw x,ticks 
      00AE55 A1 01            [ 2]  136     ldw (T,sp),x 
      0035DA                        137 5$: 
      00AE57 27 03            [ 1]  138     ld a,#0xff
      00AE59 CC 96 C8         [ 2]  139     ldw x,#0xffff
      00AE5C CD 01 EE         [ 4]  140     call abs24 
      00AE5C 90 F6 93         [ 1]  141     ld acc24,a 
      00AE5F EE 01 72         [ 2]  142     ldw acc24+1,x
      00AE62 A9 00            [ 2]  143     ldw x,(CNTR,sp)
      00AE64 03 4D 26         [ 2]  144     subw x,#1
      00AE67 08 5D            [ 2]  145     ldw (CNTR,sp),x 
      00AE69 26 05            [ 1]  146     jrne 5$ 
      00AE6B A6 0A CC         [ 4]  147     call prt_acc24 
      00AE6E 96 CA            [ 1]  148     ld a,#SPACE 
      00AE70 4B 18 59         [ 4]  149     call putc 
      00AE73 49 25 04         [ 2]  150     ldw x,ticks 
      00AE76 0A 01 26         [ 2]  151     subw x,(T,sp)
      00AE79 F8 5F 84         [ 4]  152     call prt_i16 
      003602                        153 6$:
      00AE7C 4A 02            [ 1]  154     ld a,#CR 
      00AE7E CD 09 0B         [ 4]  155     call putc 
      00AE7E 81 36 4D         [ 4]  156     call read_integer 
      00AE7F 55 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AE7F CD 99 E9 A1 01   [ 1]  158     mov farptr+1,acc16 
      00AE84 27 03 CC 96 C8   [ 1]  159     mov farptr+2,acc8 
      00AE89 90 F6 93         [ 4]  160     call read_integer 
      00AE8C EE 01 72         [ 1]  161     ld a,acc24 
      00AE8F A9 00 03         [ 2]  162     ldw x,acc16 
      00AE92 9F AE 00 01 A4   [ 1]  163     mov acc24,farptr 
      00AE97 17 27 0A 88 4F   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]



      00AE9C 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00AE9C 58 49 0A         [ 4]  166     call div24 
      00AE9F 01               [ 1]  167     push a 
      00AEA0 26               [ 2]  168     pushw x 
      00AEA1 FA 18 05         [ 4]  169     call prt_acc24 
      00AEA2 A6 20            [ 1]  170     ld a,#SPACE 
      00AEA2 5B 01 81         [ 4]  171     call putc 
      00AEA5 85               [ 2]  172     popw x
      00AEA5 85 52 04         [ 2]  173     ldw acc16,x  
      00AEA8 89 CE 00         [ 1]  174     pop acc24 
      00AEAB 05 1F 03         [ 4]  175     call prt_acc24
      00AEAE CE 00            [ 2]  176     jra 6$
      00364A                        177     _drop VSIZE 
      00AEB0 01 1F            [ 2]    1     addw sp,#VSIZE 
      00AEB2 05               [ 4]  178     ret 
                                    179 
                                    180 
      00364D                        181 read_integer:
      00AEB3 72 5C            [ 1]  182     ld a,#'? 
      00AEB5 00 20 81         [ 4]  183     call putc  
      00AEB8 72 5F 00 03      [ 1]  184 	clr count  
      00AEB8 72 5D 00         [ 4]  185 	call readln 
      00AEBB 20 26 03         [ 2]  186 	ldw x,#tib 
      00AEBE CC 96 C8         [ 1]  187 	push count
      00AEC1 4B 00            [ 1]  188 	push #0 
      00AEC1 CD 9C 5A         [ 2]  189 	addw x,(1,sp)
      00AEC4 90               [ 1]  190 	incw x 
      003665                        191 	_drop 2 
      00AEC5 F6 93            [ 2]    1     addw sp,#2 
      00AEC7 EE 01 72 A9      [ 1]  192 	clr in 
      00AECB 00 03 4D         [ 4]  193 	call get_token
      00AECE 26 13            [ 1]  194 	cp a,#TK_INTGR
      00AED0 5D 26            [ 1]  195 	jreq 3$ 
      00AED2 10 1E            [ 1]  196 	cp a,#TK_MINUS
      00AED4 03 CF 00         [ 4]  197 	call get_token 
      00AED7 05 E6            [ 1]  198 	cp a,#TK_INTGR 
      00AED9 02 C7            [ 1]  199 	jreq 2$
      00AEDB 00 04 1E         [ 2]  200 	jp syntax_error
      00367E                        201 2$:
      00AEDE 05 CF 00         [ 4]  202 	call neg_acc24  	
      003681                        203 3$: 
      00AEE1 01               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
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
      003700                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003700                         30 app_space::
      00AEE2 81 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AEE3 00 00                   32 app_size: .word 0 
      003704                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0034D8 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0034CE R
    ADCON_ID=  000002     |   4 ADCREAD    0034C2 R   |     ADCREAD_=  000004 
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
  4 ALLOC      0034B8 R   |   4 AND        0034B0 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        0034A8 R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   000157 R   |   4 AWU        0034A0 R
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
  4 BIT        003498 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       00348F R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       003486 R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      00347C R
    BTEST_ID=  000010     |   4 BTOGL      003472 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |     BUFPTR  =  000003     |   4 BYE        00346A R
    BYE_IDX =  000014     |     C       =  000001     |     CAN     =  000018 
  4 CANT_DO    002959 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
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
    CELL_SIZ=  000003     |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   4 CHAR       003461 R   |     CHAR_IDX=  000016 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
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
    CMD_END =  000002     |     CNAME   =  000001     |     CNT     =  000006 
    CNTR    =  000003     |     CNT_LO  =  000004     |     CODE_ADD=  000001 
    COMMA   =  00002C     |   4 CONST      003457 R   |   4 CONST_CO   001D41 R
    CONST_ID=  0000B6     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        00344F R   |     CR1_IDX =  00001A     |   4 CR2        003447 R
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
  4 DATA       00343E R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003436 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        00342E R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   4 DIM        003426 R
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         00341F R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      003415 R   |     DREAD_ID=  000024     |   4 DROP       00340C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 DWRITE     003401 R   |     DWRITE_I=  000026     |   4 EDIT       0033F8 R
    EDIT_IDX=  000028     |   4 EEFREE     0033ED R   |     EEFREE_I=  0000B8 
  4 EEPROM     0033E2 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        0033DA R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      0033D0 R
    ERASE_ID=  00002E     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_OVER=  000010     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       0033C7 R   |     FCPU_IDX=  000030 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001F82 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        0033BF R
    FOR_IDX =  000034     |   4 FREE       0033B6 R   |     FREE_IDX=  000088 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_AND   =  000080 
    F_CFUNC =  000020     |     F_CMD   =  000000     |     F_CONST =  000030 
    F_IFUNC =  000010     |     F_NOT   =  000070     |     F_OR    =  000090 
    F_XOR   =  0000A0     |   4 GET        0033AE R   |     GET_IDX =  0000B4 
  4 GOSUB      0033A4 R   |     GOSUB_ID=  000036     |   4 GOTO       00339B R
    GOTO_IDX=  000038     |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        003393 R   |     HEX_IDX =  00003A     |     HOME    =  000082 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   4 IDR        00338B R   |     IDR_IDX =  00003C 
  4 IF         003384 R   |     IF_IDX  =  00003E     |     IN      =  000005 
    INCR    =  000001     |     INDIRECT=  000000     |     INP     =  000000 
  4 INPUT      00337A R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
  4 IWDGEN     00336F R   |     IWDGEN_I=  000042     |   4 IWDGREF    003363 R
    IWDGREF_=  000044     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        00335B R
    KEY_END =  000083     |     KEY_IDX =  000046     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        003353 R   |     LET_IDX =  000048     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |   4 LINK    =  0034D8 R
  4 LIST       00334A R   |     LIST_IDX=  00004A     |     LL      =  000001 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  4 LOG2       003341 R   |     LOG_IDX =  00004C     |     LOOP_CNT=  002710 
  4 LSHIFT     003336 R   |     LSHIFT_I=  00004E     |     MAJOR   =  000002 
    MASK    =  000002     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000001     |     N1      =  000005     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        00332E R   |     NEW_IDX =  000052 
  4 NEXT       003325 R   |     NEXT_IDX=  000050     |     NFLASH_W=  00480E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    NHSECNT =  00480A     |     NLEN    =  000001     |     NLEN_MAS=  00000F 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        00331D R
    NOT_IDX =  0000F8     |     NOT_OP  =  000001     |   4 NOT_SAVE   002074 R
  4 NO_APP     00299B R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        003315 R
    ODR_IDX =  000054     |   4 ON         00330E R   |     ONOFF   =  000003 
    ON_IDX  =  0000B2     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         003307 R   |     OR_IDX  =  0000FC     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        0032FF R   |     PAD_IDX =  000056     |     PAD_SIZE=  000080 
  4 PAUSE      0032F5 R   |     PAUSE_ID=  000058     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       0032EC R   |     PEEK_IDX=  00005C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
  4 PICK       0032E3 R   |     PINNO   =  000001     |   4 PINP       0032DA R
    PINP_IDX=  00005E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      0032D0 R
    PMODE_ID=  00005A     |   4 POKE       0032C7 R   |     POKE_IDX=  000060 
  4 POP        0032BF R   |   4 PORTA      0032A2 R   |   4 PORTB      003298 R
  4 PORTC      00328E R   |   4 PORTD      003284 R   |   4 PORTE      00327A R
  4 PORTF      003270 R   |   4 PORTG      003266 R   |   4 PORTI      00325C R
  4 POUT       0032B6 R   |     POUT_IDX=  000062     |     PREV    =  000001 
  4 PRINT      0032AC R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001F58 R   |   4 PROG_SIZ   001F6A R   |     PRTA_IDX=  000066 
    PRTB_IDX=  000068     |     PRTC_IDX=  00006A     |     PRTD_IDX=  00006C 
    PRTE_IDX=  00006E     |     PRTF_IDX=  000070     |     PRTG_IDX=  000072 
    PRTI_IDX=  000074     |     PRT_IDX =  000064     |     PSIZE   =  000001 
    PSTR    =  000003     |   4 PUSH       003253 R   |   4 PUT        00324B R
  4 QKEY       003242 R   |     QKEY_IDX=  000076     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001F93 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    RAM_SIZE=  001800     |     RBT_IDX =  00007A     |   4 READ       003239 R
    READ_IDX=  000078     |   4 REBOOT     00322E R   |     RECLEN  =  000005 
    REC_LEN =  000003     |     REC_XTRA=  000005     |   4 REG_A      000529 R
  4 REG_CC     00052D R   |   4 REG_EPC    00051C R   |   4 REG_SP     000532 R
  4 REG_X      000525 R   |   4 REG_Y      000521 R   |     RELOP   =  000001 
  4 REM        003226 R   |     REM_IDX =  00007C     |   4 RESTORE    00321A R
    REST_IDX=  00007E     |     RETL1   =  000001     |   4 RETURN     00320F R
    RET_ADDR=  000001     |     RET_BPTR=  000003     |     RET_IDX =  000080 
    RET_INW =  000005     |   4 RND        003207 R   |     RND_IDX =  000082 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     0031FC R
    RSHIFT_I=  000084     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        0031F4 R   |     RUN_IDX =  000086     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       0031EB R
    SAVE_IDX=  000032     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   002957 R   |   4 SIZE       0031E2 R
    SIZE_IDX=  0000B0     |     SKIP    =  000005     |   4 SLEEP      0031D8 R
    SLEEP_ID=  00008A     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      0031CE R   |     SPIEN_ID=  00008E 
  4 SPIRD      0031C4 R   |     SPIRD_ID=  00008C     |   4 SPISEL     0031B9 R
    SPISEL_I=  000090     |   4 SPIWR      0031AF R   |     SPIWR_ID=  000092 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     0004DF R
  4 STEP       0031A6 R   |     STEP_IDX=  000094     |   4 STOP       00319D R
    STOP_IDX=  000096     |     STR     =  000003     |   4 STR_BYTE   001F7B R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      003193 R   |     TICKS_ID=  000098 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525B 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    003187 R   |   4 TIMER      00317D R
    TIMER_ID=  00009A     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_AND  =  000088     |     TK_ARRAY=  000005     |     TK_CFUNC=  000082 
    TK_CHAR =  000004     |     TK_CMD  =  000080     |     TK_COLON=  00000A 
    TK_COMMA=  000008     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_FLOAT=  000086     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LABEL=  000003 
    TK_LE   =  000036     |     TK_LPARE=  000006     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_NOT  =  000087 
    TK_OR   =  000089     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000007     |     TK_SHARP=  000009     |     TK_VAR  =  000085 
    TK_XOR  =  00008A     |     TMROUT_I=  00009C     |   4 TO         003176 R
  4 TONE       00316D R   |     TONE_IDX=  0000A0     |     TOWRITE =  000005 
    TO_IDX  =  00009E     |   4 Timer4Up   000021 R   |   4 TrapHand   000012 R
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
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   4 UBOUND     003162 R   |     UBOUND_I=  0000A2 
  4 UBTN_Han   000068 R   |   4 UFLASH     003157 R   |     UFLASH_I=  0000A4 
  4 UNTIL      00314D R   |     UNTIL_ID=  0000A6     |     UPDATE  =  000006 
    US      =  00001F     |   4 USER_ABO   000070 R   |   4 USR        003145 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000A8     |   4 Uart1RxH   000899 R   |   4 UserButt   000044 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VAR_NAME=  000001 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       00313C R
    WAIT_IDX=  0000AA     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
    WLKPTR  =  000003     |   4 WORDS      003132 R   |     WORDS_ID=  0000AC 
  4 WRITE      003128 R   |     WRITE_ID=  0000AE     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        003120 R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  000014     |     XTEMP   =  000001     |     YSAVE   =  000007 
    YTEMP   =  000003     |   4 abs        002B5B R   |   4 abs24      0001EE R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BC7 R   |   4 add24      000179 R
  4 add_char   001332 R   |   4 add_spac   00112A R   |   4 analog_r   002712 R
  4 and_cond   001B88 R   |   4 and_fact   001B58 R   |   4 app        003704 R
  4 app_sign   003700 R   |   4 app_size   003702 R   |   4 app_spac   003700 GR
  4 arduino_   002C48 R   |   4 arg_list   00196E R   |   5 array_si   000020 R
  4 ascii      002A0B R   |   4 at_tst     000F9C R   |   4 atoi24     001890 GR
  4 atoi_exi   0018FF R   |   4 awu        002B02 R   |   4 awu02      002B15 R
  4 bad_port   002A86 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       002689 R   |   4 beep_1kh   00265C GR  |   4 bin_exit   000E03 R
  4 bit_rese   00225C R   |   4 bit_set    00223A R   |   4 bit_test   0022A1 R
  4 bit_togg   00227F R   |   4 bitmask    002DFF R   |   4 bkslsh_t   000F49 R
  4 bksp       000972 R   |   2 block_bu   0016E0 GR  |   4 block_er   000787 R
  4 break_po   0027FE R   |   4 bye        002ACE R   |   4 clear_ba   00149E R
  4 clear_bl   0028AE R   |   4 clear_va   0013F6 R   |   4 clock_in   00008B R
  4 cloop_1    001DF1 R   |   4 cmd_cons   001DCB R   |   4 cmd_dim    001E82 R
  4 cmd_dim1   001E8C R   |   4 cmd_end    002628 R   |   4 cmd_get    00262F R
  4 cmd_itf    000537 R   |   4 cmd_line   0016D7 R   |   4 cmd_name   001352 R
  4 cmd_on     0024D6 R   |   4 cmd_size   001C61 R   |   4 cold_sta   0000C3 R
  4 colon_ts   000F70 R   |   4 comma_ts   000F7B R   |   4 comp_msg   001627 R
  4 compile    001096 GR  |   4 conditio   001BDA R   |   4 const_cr   002EA2 R
  4 const_cr   002EA7 R   |   4 const_dd   002E9D R   |   4 const_ee   002EB6 R
  4 const_id   002E98 R   |   4 const_in   002EB1 R   |   4 const_lo   001DEC R
  4 const_od   002E93 R   |   4 const_ou   002EAC R   |   4 const_po   002E6B R
  4 const_po   002E70 R   |   4 const_po   002E75 R   |   4 const_po   002E7A R
  4 const_po   002E7F R   |   4 const_po   002E84 R   |   4 const_po   002E89 R
  4 const_po   002E8E R   |   4 convert_   000D73 R   |   4 convert_   000936 R
  4 copy_com   000FD1 R   |   5 count      000003 GR  |   4 cp24       0001B3 R
  4 cp24_ax    0001E5 R   |   4 cp_loop    00191F R   |   4 cpl24      0001F5 R
  4 cpy_cmd_   001112 R   |   4 cpy_quot   001152 R   |   4 create_g   000C9D R
  4 cs_high    003038 R   |   4 dash_tst   000F91 R   |   4 data       002EBB R
  4 data_err   002F34 R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001C53 R   |   4 decomp_l   0011EA R
  4 decompil   0011A2 GR  |   4 del_line   000C70 R   |   4 delete_l   000A5F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

  4 delete_n   000982 R   |   4 delete_u   000A24 R   |   4 digital_   00274E R
  4 digital_   002785 R   |   4 div24      000302 R   |   4 divu24_8   0002E4 R
  4 do_loop    002E25 R   |   4 do_progr   00077A R   |   4 dup24      00016A R
  5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR  |   4 edit       002047 R
  4 enable_i   002D8F R   |   4 eql_tst    00101C R   |   4 equal      001345 R
  4 erase      002826 R   |   4 erase_ex   0007AB R   |   4 erase_fl   0007A1 R
  4 err_bad_   001588 R   |   4 err_buf_   0015FE R   |   4 err_cmd_   00154C R
  4 err_div0   001511 R   |   4 err_dupl   001566 R   |   4 err_math   0014F8 R
  4 err_mem_   0014DD R   |   4 err_msg    0014BB R   |   4 err_no_a   001594 R
  4 err_no_d   0015C7 R   |   4 err_no_f   0015EB R   |   4 err_no_l   001520 R
  4 err_no_p   0015D7 R   |   4 err_not_   001577 R   |   4 err_over   00160B R
  4 err_run_   001536 R   |   4 err_synt   0014EA R   |   4 escaped    000D88 GR
  4 expect     00195C R   |   4 expressi   001AC1 R   |   4 factor     0019BA R
  5 farptr     000018 R   |   4 fcpu       002BCA R   |   4 fetchc     000627 R
  4 fill_wri   00289E R   |   4 final_te   000BC0 R   |   4 first_li   001FF1 R
  5 flags      000022 GR  |   4 for        002337 R   |   4 free       001C58 R
  5 free_eep   000024 R   |   7 free_ram   000090 R   |   4 func_arg   001969 R
  4 func_cha   0029F4 R   |   4 func_eef   001D57 R   |   4 ge         001347 R
  4 get_addr   0017CE R   |   4 get_arra   00198A R   |   4 get_char   0017E8 R
  4 get_esca   000942 R   |   4 get_int2   0017D8 R   |   4 get_targ   002464 R
  4 get_targ   002472 R   |   4 get_tick   002B54 R   |   4 get_toke   000EE2 GR
  4 get_valu   001CDC R   |   4 getc       00091B GR  |   4 gosub      002582 R
  4 gosub_1    00258D R   |   4 gosub_2    002593 R   |   4 goto       002568 R
  4 goto_1     002572 R   |   4 gpio       002A5B R   |   4 gt         001343 R
  4 gt_tst     001027 R   |   4 hex_base   001C4E R   |   4 hex_dump   000667 R
  4 if         00231A R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   00087D R   |   4 input_ex   0021F2 R
  4 input_lo   00215C R   |   4 input_va   002158 R   |   4 insert_c   0009E1 R
  4 insert_l   000CC9 R   |   4 insert_l   000D38 R   |   4 interp_l   001718 R
  4 interpre   0016F3 R   |   4 invalid    00057C R   |   4 invalid_   0005FD R
  4 is_alnum   000E36 GR  |   4 is_alpha   000E1C GR  |   4 is_data_   002EC1 R
  4 is_digit   000E2D GR  |   4 is_symbo   000E3F R   |   4 itoa       00182B GR
  4 itoa_loo   00184D R   |   4 jp_to_ta   002575 R   |   4 key        002A4A R
  4 kword_di   0034D6 GR  |   4 kword_en   00311E R   |   4 le         00134C R
  4 ledoff     000432 R   |   4 ledon      00042D R   |   4 ledtoggl   000437 R
  4 left_par   000440 R   |   4 let        001C99 GR  |   4 let_arra   001CA7 R
  4 let_dvar   001751 R   |   4 let_eval   001CAF R   |   4 let_var    001CAC R
  4 lines_sk   001FF4 R   |   4 list       001FA2 R   |   4 list_con   001CEB R
  4 list_exi   002036 R   |   4 list_loo   002014 R   |   4 log2       002DD2 R
  4 look_tar   002495 R   |   4 loop_bac   002447 R   |   5 loop_dep   00001F R
  4 loop_don   00245C R   |   4 lshift     002B72 R   |   4 lt         00134A R
  4 lt_tst     001050 R   |   4 mem_peek   000599 R   |   4 mod24      00039C R
  4 move       0013B2 GR  |   4 move_dow   0013D1 R   |   4 move_era   000709 R
  4 move_exi   0013F2 R   |   4 move_lef   0009B9 R   |   4 move_loo   0013D6 R
  4 move_prg   000749 R   |   4 move_rig   0009C7 R   |   4 move_up    0013C3 R
  4 mul24      000274 R   |   4 mul_char   001334 R   |   4 mulu24_8   000235 R
  4 nbr_tst    000F15 R   |   4 ne         00134F R   |   4 neg24      0001FE R
  4 neg_acc2   000218 R   |   4 neg_ax     000210 R   |   4 new        00281C R
  4 next       0023EF R   |   4 next_lin   0016FB R   |   4 next_tok   0017A6 GR
  4 no_match   001931 R   |   4 number     00062D R   |   4 other      001079 R
  4 overwrit   000BEC R   |   2 pad        0016E0 GR  |   4 pad_ref    00303D R
  4 parse_bi   000DE1 R   |   4 parse_in   000D90 R   |   4 parse_ke   000E62 R
  4 parse_qu   000D3B R   |   4 parse_sy   000E4A R   |   4 pause      002AE2 R
  4 pause02    002AF5 R   |   4 peek       0022F9 R   |   4 peek_byt   0005C7 R
  4 pin_mode   002BD9 R   |   4 plus_tst   000FF0 R   |   4 poke       0022D8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Symbol Table

  4 power_ad   0026C2 R   |   4 prcnt_ts   001011 R   |   4 print      0020AF R
  4 print_fa   00060C R   |   4 print_he   000C23 GR  |   4 print_re   00048C R
  4 print_st   00058C R   |   4 print_to   001813 R   |   4 prog_siz   001F11 R
  4 program_   001F19 R   |   4 program_   000723 R   |   4 program_   000749 R
  4 prt_acc2   001805 R   |   4 prt_basi   00208B R   |   4 prt_i16    0017EE R
  4 prt_loop   0020B3 R   |   4 prt_peek   00040F GR  |   4 prt_reg1   00046D R
  4 prt_reg8   00044B R   |   4 prt_regs   0003A5 GR  |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       00090B GR  |   4 puts       000968 GR
  4 qgetc      000914 GR  |   4 qkey       002A4E GR  |   4 qmark_ts   000FA7 R
  4 qsign      002897 R   |   4 random     002C68 R   |   4 read       002F39 R
  4 read01     002F3E R   |   4 read_int   00364D R   |   4 readln     000A6D GR
  4 readln_l   000A7C R   |   4 readln_q   000C09 R   |   4 refresh_   002DCD R
  4 regs_sta   0003E8 R   |   4 relation   001AF9 R   |   4 relop_st   001337 R
  4 remark     0021F7 GR  |   4 repl       000545 R   |   4 repl_exi   00056D R
  4 reset_co   0020B1 R   |   4 rest_con   002148 R   |   4 restore    002ECF R
  4 return     0025A6 R   |   4 right_al   001140 GR  |   4 row_alig   000862 R
  4 row_eras   0006DC R   |   4 row_eras   000709 R   |   4 row_loop   00064A R
  4 rparnt_t   000F65 R   |   4 rshift     002B9E R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     001615 R   |   4 run        0025C3 R
  4 run_app    000135 R   |   4 run_it     0025F5 R   |   4 run_it_0   0025F7 R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_app   0028C2 R   |   4 save_con   002138 R   |   4 scan_blo   00088B R
  4 search_d   001911 GR  |   4 search_e   001959 R   |   4 search_l   000C45 GR
  4 search_l   000C54 R   |   4 search_n   001D80 R   |   4 search_n   001915 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002C38 R
  4 send_esc   000990 R   |   4 send_par   00099B R   |   4 set_data   002F05 R
  4 set_time   002D6D R   |   4 sharp_ts   000F86 R   |   4 show_row   000638 R
  4 single_c   00132D R   |   4 skip       000ECF R   |   4 skip_str   0017BF R
  4 slash_ts   001006 R   |   4 sleep      002AD7 R   |   4 software   001405 R
  4 spaces     0009D5 GR  |   4 spi_clea   002FD2 R   |   4 spi_disa   002FBA R
  4 spi_enab   002F87 R   |   4 spi_rcv_   002FF4 R   |   4 spi_read   00301F R
  4 spi_sele   003026 R   |   4 spi_send   002FDE R   |   4 spi_writ   002FFF R
  2 stack_fu   00179C GR  |   2 stack_un   001828 R   |   4 star_tst   000FFB R
  4 step       0023AD R   |   4 stop       0027D0 R   |   4 store_lo   0023DC R
  4 str_matc   00193E R   |   4 str_tst    000F05 R   |   4 strcmp     001391 R
  4 strcpy     0013A2 GR  |   4 strlen     001386 GR  |   4 sub24      000196 R
  4 symb_loo   000E4B R   |   4 syntax_e   001648 GR  |   4 system_i   00144B R
  5 tab_widt   000023 GR  |   4 tb_error   00164A GR  |   4 term       001A7E R
  4 term01     001A86 R   |   4 term_exi   001ABE R   |   4 test       0034DE R
  4 test_p     000584 R   |   2 tib        001690 GR  |   4 tick_tst   000FBF R
  5 ticks      00000F R   |   4 timeout    002D84 R   |   5 timer      000012 GR
  4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R   |   4 tk_id      001638 R
  4 to         002367 R   |   4 to_eepro   000772 R   |   4 to_flash   000777 R
  4 to_hex_c   000C3A GR  |   4 to_upper   001884 GR  |   4 token_ch   00108F R
  4 token_ex   001093 R   |   4 tone       002667 R   |   4 try_next   002F12 R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   00091B GR
  4 uart1_in   0008C6 R   |   4 uart1_pu   00090B GR  |   4 uart1_qg   000914 GR
  4 uart1_se   0008D6 R   |   4 ubound     001C8E R   |   4 uflash     002A8B R
  4 unlock_e   0006A6 R   |   4 unlock_f   0006C1 R   |   4 until      002E38 R
  4 user_int   000057 R   |   4 usr        002AA8 R   |   4 var_name   001198 GR
  5 vars       000034 GR  |   4 wait       0021FD R   |   4 warm_ini   00147C R
  4 warm_sta   0016D4 R   |   4 words      002D03 R   |   4 words_co   002D57 R
  4 write      0029B1 R   |   4 write_bl   000827 GR  |   4 write_bu   000763 R
  4 write_by   0007AD R   |   4 write_ee   0007E9 R   |   4 write_ex   000822 R
  4 write_fl   0007D3 R   |   4 write_nb   00084C R   |   4 xalloc     003050 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Symbol Table

  4 xdrop      003086 R   |   4 xpick      003104 R   |   4 xpop       003046 R
  4 xpush      003042 R   |   4 xput       0030D1 R   |   4 xstack_b   0030B3 R
  2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 251.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3704   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

