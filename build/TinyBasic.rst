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



                                     34   
                                     35 
                                     36 ;;-----------------------------------
                                     37     .area SSEG (ABS)
                                     38 ;; working buffers and stack at end of RAM. 	
                                     39 ;;-----------------------------------
      001690                         40     .org RAM_SIZE-STACK_SIZE-XSTACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         41 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         42 block_buffer::                 ; use to write FLASH block (alias for pad )
      0016E0                         43 pad:: .ds PAD_SIZE             ; working buffer
      001760                         44 xstack_full:: .ds XSTACK_SIZE*CELL_SIZE   ; expression stack 
      00179C                         45 xstack_unf:: ; xstack underflow 
      00179C                         46 stack_full:: .ds STACK_SIZE   ; control stack 
      001828                         47 stack_unf: ; stack underflow ; control_stack bottom 
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
      008050 82 00 88 EB             74 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      0080D7 CD 89 BA         [ 4]  164 	call puts 
      0080DA                        165 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  166     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  167     ldw sp,x
      0080DE 9A               [ 1]  168 	rim 
      0080DF CC 97 44         [ 2]  169 5$:	jp warm_start
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
      008180 CD 89 18         [ 4]  263 	call uart1_init
                                    264 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  265     bset PE_CR2,#USR_BTN_BIT 
                                    266 ; display system information
      008187 9A               [ 1]  267 	rim ; enable interrupts 
      008188 72 5C 00 18      [ 1]  268 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  269 	inc seedx+1 
      008190 CD 9D 54         [ 4]  270 	call func_eefree 
      008193 CD 9C F5         [ 4]  271 	call ubound 
      008196 CD 94 F0         [ 4]  272 	call clear_basic
      008199 CD A5 A0         [ 4]  273 	call beep_1khz  
      00819C CD 94 9D         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for application in flash memory 
      00819F CE B7 00         [ 2]  277 	ldw x,app_space
      0081A2 CD A8 30         [ 4]  278 	call qsign 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 44         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
                                    282 ; run application in FLASH|EEPROM 
      0081AA 90 CE 17 73      [ 2]  283 	ldw y,XSTACK_EMPTY
      0081AE CD 94 CE         [ 4]  284 	call warm_init
      0081B1 AE B7 04         [ 2]  285 	ldw x,#app 
      0081B4 CF 00 1C         [ 2]  286 	ldw txtbgn,x
      0081B7 72 BB B7 02      [ 2]  287 	addw x,app_size 
      0081BB CF 00 1E         [ 2]  288 	ldw txtend,x 
      0081BE AE 81 CC         [ 2]  289 	ldw x,#AUTO_RUN 
      0081C1 CD 89 BA         [ 4]  290 	call puts 
      0081C4 CD 9E 76         [ 4]  291 	call program_info 
      0081C7 CC A5 3B         [ 2]  292 	jp run_it_02  
      0081CA 20 FE            [ 2]  293     jra .  
                                    294 
      0081CC 20 61 75 74 6F 20 72   295 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    296 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
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
      0081DF                         37 dup24:
      00015F                         38     _at_top 
      0081DF 90 F6            [ 1]    1     ld a,(y)
      0081E1 93               [ 1]    2     ldw x,y 
      0081E2 EE 01            [ 2]    3     ldw x,(1,x)
      000164                         39     _xpush 
      0081E4 72 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      0081E8 90 F7            [ 1]    2     ld (y),a 
      0081EA 90 EF 01         [ 2]    3     ldw (1,y),x 
      0081ED 81               [ 4]   40     ret 
                                     41 
                                     42 
                                     43 
                                     44 ;-------------------------------
                                     45 ; add24 
                                     46 ; add 24 bits integers 
                                     47 ;------------------------------
      0081EE                         48 add24: ; ( N T -- N+T )
      00016E                         49     _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      0081EE 90 F6            [ 1]    1     ld a,(y)
      0081F0 93               [ 1]    2     ldw x,y 
      0081F1 EE 01            [ 2]    3     ldw x,(1,x)
      0081F3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081F7 89               [ 2]   50     pushw x  
      0081F8 88               [ 1]   51     push a  
      000179                         52     _at_top  
      0081F9 90 F6            [ 1]    1     ld a,(y)
      0081FB 93               [ 1]    2     ldw x,y 
      0081FC EE 01            [ 2]    3     ldw x,(1,x)
      0081FE 72 FB 02         [ 2]   53     addw x,(2,sp)
      008201 19 01            [ 1]   54     adc a, (1,sp)
      000183                         55     _store_top 
      008203 90 F7            [ 1]    1     ld (y),a 
      008205 90 EF 01         [ 2]    2     ldw (1,y),x     
      000188                         56     _drop 3 
      008208 5B 03            [ 2]    1     addw sp,#3 
      00820A 81               [ 4]   57     ret 
                                     58 
                                     59 ;-------------------------------
                                     60 ; sub24 
                                     61 ; subtract 24 bits integers 
                                     62 ;------------------------------
      00820B                         63 sub24: ; ( N T -- N-T ) 
      00018B                         64     _xpop 
      00820B 90 F6            [ 1]    1     ld a,(y)
      00820D 93               [ 1]    2     ldw x,y 
      00820E EE 01            [ 2]    3     ldw x,(1,x)
      008210 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008214 89               [ 2]   65     pushw x 
      008215 88               [ 1]   66     push  a
      000196                         67     _at_top  
      008216 90 F6            [ 1]    1     ld a,(y)
      008218 93               [ 1]    2     ldw x,y 
      008219 EE 01            [ 2]    3     ldw x,(1,x)
      00821B 72 F0 02         [ 2]   68     subw x,(2,sp) 
      00821E 12 01            [ 1]   69     sbc a, (1,sp)
      0001A0                         70     _store_top  
      008220 90 F7            [ 1]    1     ld (y),a 
      008222 90 EF 01         [ 2]    2     ldw (1,y),x     
      0001A5                         71     _drop 3 
      008225 5B 03            [ 2]    1     addw sp,#3 
      008227 81               [ 4]   72     ret 
                                     73 
                                     74 ;------------------------------
                                     75 ; cp24  N T -- 0x800000|0|0x010000
                                     76 ;------------------------------
      008228                         77 cp24:
      0001A8                         78     _xpop 
      008228 90 F6            [ 1]    1     ld a,(y)
      00822A 93               [ 1]    2     ldw x,y 
      00822B EE 01            [ 2]    3     ldw x,(1,x)
      00822D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008231 C7 00 0D         [ 1]   79     ld acc24,a 
      008234 CF 00 0E         [ 2]   80     ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0001B7                         81     _at_top 
      008237 90 F6            [ 1]    1     ld a,(y)
      008239 93               [ 1]    2     ldw x,y 
      00823A EE 01            [ 2]    3     ldw x,(1,x)
      00823C 72 B0 00 0E      [ 2]   82     subw x,acc16
      008240 C2 00 0D         [ 1]   83     sbc a,acc24
      008243 2F 08            [ 1]   84     jrslt 1$
      008245 26 0A            [ 1]   85     jrne 2$
      008247 5D               [ 2]   86     tnzw x 
      008248 26 07            [ 1]   87     jrne 2$
      00824A 4F               [ 1]   88     clr a 
      00824B 20 06            [ 2]   89     jra 9$ 
      00824D                         90 1$: ; i1 < i2 
      00824D A6 FF            [ 1]   91     ld a,#255
      00824F 20 02            [ 2]   92     jra 9$ 
      008251                         93 2$: ; i1 > i2 
      008251 A6 01            [ 1]   94     ld a,#1 
      008253 5F               [ 1]   95 9$: clrw x
      0001D4                         96      _store_top 
      008254 90 F7            [ 1]    1     ld (y),a 
      008256 90 EF 01         [ 2]    2     ldw (1,y),x     
      008259 81               [ 4]   97     ret 
                                     98 
                                     99 ;-------------------------------
                                    100 ; cp24_ax 
                                    101 ; compare acc24 with A:X 
                                    102 ;-------------------------------
      00825A                        103 cp24_ax:
      00825A 88               [ 1]  104     push a 
      00825B C3 00 0E         [ 2]  105     cpw x,acc16 
      00825E C2 00 0D         [ 1]  106     sbc a,acc24
      008261 84               [ 1]  107     pop a 
      008262 81               [ 4]  108     ret 
                                    109 
                                    110 
                                    111 ;-------------------------------
                                    112 ; abs24 
                                    113 ; abolute value of top  
                                    114 ;-------------------------------
      008263                        115 abs24: ; ( i -- u )
      008263 90 F6            [ 1]  116     ld a,(y)
      008265 A1 80            [ 1]  117     cp a,#0x80 
      008267 2A 0A            [ 1]  118     jrpl neg24 ; negative integer
      008269 81               [ 4]  119     ret  
                                    120 
                                    121 ;----------------------------
                                    122 ;  one's compleement 
                                    123 ;----------------------------
      00826A                        124 cpl24:  ; i -- ~i 
      00826A 90 73            [ 1]  125     cpl (y) 
      00826C 90 63 01         [ 1]  126     cpl (1,y)
      00826F 90 63 02         [ 1]  127     cpl (2,y)
      008272 81               [ 4]  128     ret 
                                    129 
                                    130 ;----------------------------    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                    131 ; two'2 complement of top  
                                    132 ;---------------------------
      008273                        133 neg24: ; (i -- -i )
      0001F3                        134     _at_top
      008273 90 F6            [ 1]    1     ld a,(y)
      008275 93               [ 1]    2     ldw x,y 
      008276 EE 01            [ 2]    3     ldw x,(1,x)
      008278 43               [ 1]  135     cpl  a  
      008279 53               [ 2]  136     cplw x 
      00827A 1C 00 01         [ 2]  137     addw x,#1
      00827D A9 00            [ 1]  138     adc a,#0
      0001FF                        139     _store_top  
      00827F 90 F7            [ 1]    1     ld (y),a 
      008281 90 EF 01         [ 2]    2     ldw (1,y),x     
      008284 81               [ 4]  140 9$: ret 
                                    141 
                                    142 ;-----------------------------
                                    143 ; negate integer in A:X 
                                    144 ;----------------------------
      008285                        145 neg_ax:
      008285 43               [ 1]  146     cpl  a  
      008286 53               [ 2]  147     cplw x 
      008287 1C 00 01         [ 2]  148     addw x,#1
      00828A A9 00            [ 1]  149     adc a,#0
      00828C 81               [ 4]  150     ret 
                                    151 
                                    152 ;------------------------------------
                                    153 ;  two's complement of acc24 
                                    154 ;-------------------------------------
      00828D                        155 neg_acc24: ; 
      00828D 72 53 00 0D      [ 1]  156     cpl acc24 
      008291 72 53 00 0E      [ 1]  157     cpl acc16 
      008295 72 53 00 0F      [ 1]  158     cpl acc8
      008299 72 5C 00 0F      [ 1]  159     inc acc8 
      00829D 26 0A            [ 1]  160     jrne 9$
      00829F 72 5C 00 0E      [ 1]  161     inc acc16 
      0082A3 26 04            [ 1]  162     jrne 9$
      0082A5 72 5C 00 0D      [ 1]  163     inc acc24 
      0082A9 81               [ 4]  164 9$: ret 
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
      0082AA                        180 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      0082AA 88               [ 1]  181     push a 
      0082AB 72 5F 00 0C      [ 1]  182 	clr acc32
      0082AF 72 5F 00 0D      [ 1]  183     clr acc24  
                                    184 ; multiply top bits 7..0 * U8   	
      0082B3 90 E6 02         [ 1]  185     ld a,(2,Y) ; top least byte  
      0082B6 97               [ 1]  186     ld xl,a 
      0082B7 7B 01            [ 1]  187     ld a,(U8,sp)
      0082B9 42               [ 4]  188     mul x,a 
      0082BA CF 00 0E         [ 2]  189     ldw acc16,x 
                                    190 ; multiply top bits 15..8 * U8     
      0082BD 90 E6 01         [ 1]  191     ld a,(1,Y) ; top middle byte 
      0082C0 97               [ 1]  192     ld xl,a 
      0082C1 7B 01            [ 1]  193     ld a,(U8,sp) 
      0082C3 42               [ 4]  194     mul x,a 
      0082C4 72 BB 00 0D      [ 2]  195     addw x,acc24
      0082C8 72 59 00 0C      [ 1]  196     rlc acc32 
      0082CC CF 00 0D         [ 2]  197     ldw acc24,x 
                                    198 ; multiply top bits 23..16 * 8 
      0082CF 90 F6            [ 1]  199     ld a,(Y)
      0082D1 97               [ 1]  200     ld xl,a 
      0082D2 7B 01            [ 1]  201     ld a,(U8,sp)
      0082D4 42               [ 4]  202     mul x,a 
      0082D5 72 BB 00 0C      [ 2]  203     addw x,acc32
      0082D9 02               [ 1]  204     rlwa x 
      0082DA 4D               [ 1]  205     tnz a 
      0082DB 27 05            [ 1]  206     jreq 1$
      0082DD A6 10            [ 1]  207     ld a,#ERR_OVERFLOW
      0082DF CC 96 BA         [ 2]  208     jp tb_error 
      0082E2                        209 1$:
      0082E2 9E               [ 1]  210     ld a,xh  
      0082E3 CE 00 0E         [ 2]  211     ldw x,acc16   
      000266                        212     _drop VSIZE 
      0082E6 5B 01            [ 2]    1     addw sp,#VSIZE 
      0082E8 81               [ 4]  213     ret
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
      0082E9                        224 mul24:
      000269                        225     _vars VSIZE
      0082E9 52 07            [ 2]    1     sub sp,#VSIZE 
      0082EB 5F               [ 1]  226     clrw x 
      0082EC 1F 01            [ 2]  227     ldw (PROD,sp),x 
      0082EE 1F 03            [ 2]  228     ldw (PROD+2,sp),x
      000270                        229     _xpop 
      0082F0 90 F6            [ 1]    1     ld a,(y)
      0082F2 93               [ 1]    2     ldw x,y 
      0082F3 EE 01            [ 2]    3     ldw x,(1,x)
      0082F5 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      0082F9 4D               [ 1]  230     tnz a 
      0082FA 2A 05            [ 1]  231     jrpl 0$
      0082FC 03 04            [ 1]  232     cpl (PROD_SIGN,sp)
      0082FE CD 82 85         [ 4]  233     call neg_ax 
      008301                        234 0$:    
      008301 6B 05            [ 1]  235     ld (N1,sp),a 
      008303 1F 06            [ 2]  236     ldw (N1+1,sp),x
      008305 90 7D            [ 1]  237     tnz (Y)
      008307 2A 05            [ 1]  238     jrpl 2$ 
      008309 03 04            [ 1]  239     cpl (PROD_SIGN,sp) 
      00830B CD 82 73         [ 4]  240     call neg24
      00830E                        241 2$: 
      00830E 7B 07            [ 1]  242     ld a,(N1+2,sp); least byte     
      008310 27 0A            [ 1]  243     jreq 4$
      008312 CD 82 AA         [ 4]  244     call mulu24_8
      008315 4D               [ 1]  245     tnz a 
      008316 2B 3C            [ 1]  246     jrmi 8$ ; overflow  
      008318 6B 01            [ 1]  247     ld (PROD,sp),a
      00831A 1F 02            [ 2]  248     ldw (PROD+1,sp),x 
      00831C                        249 4$:
      00831C 7B 06            [ 1]  250     ld a,(N1+1,sp); middle byte     
      00831E 27 0D            [ 1]  251     jreq 5$
      008320 CD 82 AA         [ 4]  252     call mulu24_8
      008323 4D               [ 1]  253     tnz a 
      008324 26 2E            [ 1]  254     jrne 8$  ; overflow 
      008326 72 FB 01         [ 2]  255     addw x,(PROD,sp)
      008329 29 29            [ 1]  256     jrv 8$ ; overflow
      00832B 1F 01            [ 2]  257     ldw (PROD,sp),x 
      00832D                        258 5$:
      00832D 7B 05            [ 1]  259     ld a,(N1,sp) ; high byte 
      00832F 27 10            [ 1]  260     jreq 6$
      008331 CD 82 AA         [ 4]  261     call mulu24_8
      008334 01               [ 1]  262     rrwa x 
      008335 5D               [ 2]  263     tnzw x 
      008336 26 1C            [ 1]  264     jrne 8$ ; overflow 
      008338 4D               [ 1]  265     tnz a 
      008339 2B 19            [ 1]  266     jrmi 8$ ; overflow 
      00833B 1B 01            [ 1]  267     add a,(PROD,sp)
      00833D 6B 01            [ 1]  268     ld (PROD,sp),a 
      00833F 29 13            [ 1]  269     jrv 8$ ; overflow 
      008341                        270 6$:
      008341 7B 01            [ 1]  271     ld a,(PROD,sp)
      008343 1E 02            [ 2]  272     ldw x,(PROD+1,sp)
      008345 0D 04            [ 1]  273     tnz (PROD_SIGN,sp)
      008347 27 03            [ 1]  274     jreq 9$
      008349 CD 82 85         [ 4]  275     call neg_ax 
      00834C                        276 9$:
      0002CC                        277     _store_top 
      00834C 90 F7            [ 1]    1     ld (y),a 
      00834E 90 EF 01         [ 2]    2     ldw (1,y),x     
      0002D1                        278     _drop VSIZE 
      008351 5B 07            [ 2]    1     addw sp,#VSIZE 
      008353 81               [ 4]  279     ret 
      008354                        280 8$: ; overflow
      008354 A6 10            [ 1]  281     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008356 CC 96 BA         [ 2]  282     jp tb_error 
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
      008359                        296 divu24_8:
      008359 89               [ 2]  297 	pushw x ; save x
      00835A 88               [ 1]  298 	push a 
                                    299 	; ld dividend UU:MM bytes in X
      00835B CE 00 0D         [ 2]  300 	ldw x,acc24
      00835E 7B 01            [ 1]  301 	ld a,(U8,SP) ; divisor
      008360 62               [ 2]  302 	div x,a ; UU:MM/U8
      008361 88               [ 1]  303 	push a  ;save remainder
      008362 CF 00 0D         [ 2]  304     ldw acc24,x ; quotient 
      008365 84               [ 1]  305 	pop a
      008366 95               [ 1]  306 	ld xh,a
      008367 C6 00 0F         [ 1]  307 	ld a,acc8
      00836A 97               [ 1]  308 	ld xl,a
      00836B 7B 01            [ 1]  309 	ld a,(U8,sp) ; divisor
      00836D 62               [ 2]  310 	div x,a  ; R:LL/U8
      00836E 6B 01            [ 1]  311 	ld (U8,sp),a ; save remainder
      008370 9F               [ 1]  312 	ld a,xl
      008371 C7 00 0F         [ 1]  313 	ld acc8,a
      008374 84               [ 1]  314 	pop a
      008375 85               [ 2]  315 	popw x
      008376 81               [ 4]  316 	ret
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
      008377                        332 div24:
      0002F7                        333     _vars VSIZE 
      008377 52 06            [ 2]    1     sub sp,#VSIZE 
      008379 0F 06            [ 1]  334     clr (RSIGN,sp)
      00837B 0F 05            [ 1]  335     clr (QSIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      0002FD                        336     _xpop 
      00837D 90 F6            [ 1]    1     ld a,(y)
      00837F 93               [ 1]    2     ldw x,y 
      008380 EE 01            [ 2]    3     ldw x,(1,x)
      008382 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008386 4D               [ 1]  337     tnz a 
      008387 2A 05            [ 1]  338     jrpl 0$ 
      008389 03 05            [ 1]  339     cpl (QSIGN,sp)
      00838B CD 82 85         [ 4]  340     call neg_ax
      00838E                        341 0$:
      00838E 6B 01            [ 1]  342     ld  (DIVISOR,sp),a
      008390 1F 02            [ 2]  343     ldw (DIVISOR+1,sp),x
      008392 1A 02            [ 1]  344     or a,(DIVISOR+1,sp)
      008394 1A 03            [ 1]  345     or a,(DIVISOR+2,sp)
      008396 26 05            [ 1]  346     jrne 1$ 
      008398 A6 04            [ 1]  347     ld a,#ERR_DIV0 
      00839A CC 96 BA         [ 2]  348     jp tb_error 
      00839D                        349 1$: ; dividend  
      00031D                        350     _at_top
      00839D 90 F6            [ 1]    1     ld a,(y)
      00839F 93               [ 1]    2     ldw x,y 
      0083A0 EE 01            [ 2]    3     ldw x,(1,x)
      0083A2 4D               [ 1]  351     tnz a 
      0083A3 2A 07            [ 1]  352     jrpl 2$
      0083A5 CD 82 85         [ 4]  353     call neg_ax
      0083A8 03 05            [ 1]  354     cpl (QSIGN,sp)
      0083AA 03 06            [ 1]  355     cpl (RSIGN,sp)
      0083AC                        356 2$: 
                                    357 ;    ld acc24,a 
                                    358 ;    ldw acc16,x 
      00032C                        359     _store_top 
      0083AC 90 F7            [ 1]    1     ld (y),a 
      0083AE 90 EF 01         [ 2]    2     ldw (1,y),x     
      0083B1 A6 18            [ 1]  360     ld a,#24 
      0083B3 6B 04            [ 1]  361     ld (CNTR,sp),a
      0083B5 7B 01            [ 1]  362     ld a,(DIVISOR,sp)
      0083B7 1E 02            [ 2]  363     ldw x,(DIVISOR+1,sp)
                                    364 ; dividend >= divisor ? 
      0083B9 CD 82 5A         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      0083BC 23 14            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      0083BE C6 00 0D         [ 1]  368     ld a,acc24 
      0083C1 CE 00 0E         [ 2]  369     ldw x,acc16 
      0083C4 72 5F 00 0D      [ 1]  370     clr acc24 
      0083C8 72 5F 00 0E      [ 1]  371     clr acc16 
      0083CC 72 5F 00 0F      [ 1]  372     clr acc8 
      0083D0 20 26            [ 2]  373     jra 6$
      0083D2                        374 22$:     
      0083D2 4F               [ 1]  375     clr a 
      0083D3 5F               [ 1]  376     clrw x 
      0083D4 98               [ 1]  377     rcf  
      0083D5                        378 3$: ; shift carry in acc24 bit 0 
      0083D5 90 69 02         [ 1]  379     rlc (2,y) 
      0083D8 90 69 01         [ 1]  380     rlc (1,y)
      0083DB 90 79            [ 1]  381     rlc (Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0083DD 59               [ 2]  382     rlcw x  
      0083DE 49               [ 1]  383     rlc a
      0083DF 72 F0 02         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083E2 12 01            [ 1]  385     sbc a,(DIVISOR,sp)
      0083E4 24 05            [ 1]  386     jrnc 5$
      0083E6 72 FB 02         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083E9 19 01            [ 1]  388     adc a,(DIVISOR,sp)
      0083EB                        389 5$: ; shift carry in QUOTIENT 
      0083EB 8C               [ 1]  390     ccf
      0083EC 0A 04            [ 1]  391     dec (CNTR,sp)
      0083EE 26 E5            [ 1]  392     jrne 3$ 
                                    393 ; shift quotient last bit     
      0083F0 90 69 02         [ 1]  394     rlc (2,y)
      0083F3 90 69 01         [ 1]  395     rlc (1,y) 
      0083F6 90 79            [ 1]  396     rlc (y) 
      0083F8                        397 6$:    
      0083F8 6B 01            [ 1]  398     ld (DIVISOR,sp),a 
      0083FA 1F 02            [ 2]  399     ldw (DIVISOR+1,sp),x 
      0083FC 0D 05            [ 1]  400     tnz (QSIGN,sp)
      0083FE 27 03            [ 1]  401     jreq 8$
      008400 CD 82 73         [ 4]  402     call neg24
      008403                        403 8$: 
      008403 7B 01            [ 1]  404     ld a,(DIVISOR,sp)
      008405 1E 02            [ 2]  405     ldw x,(DIVSOR+1,sp)
      008407                        406 81$:
      008407 0D 06            [ 1]  407     tnz (RSIGN,sp)
      008409 27 03            [ 1]  408     jreq 9$
      00840B CD 82 85         [ 4]  409     call neg_ax       
      00038E                        410 9$: _drop VSIZE 
      00840E 5B 06            [ 2]    1     addw sp,#VSIZE 
      008410 81               [ 4]  411     ret 
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
      008411                        423 mod24:
      008411 CD 83 77         [ 4]  424     call div24 
      000394                        425     _store_top  ; replace quotient by remainder 
      008414 90 F7            [ 1]    1     ld (y),a 
      008416 90 EF 01         [ 2]    2     ldw (1,y),x     
      008419 81               [ 4]  426     ret 
                                    427 
                                    428 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
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
      00841A                         48 prt_peek::
      00841A 89               [ 2]   49 	pushw x 
      00841B 35 10 00 0B      [ 1]   50 	mov base,#16 
      00841F CD 98 64         [ 4]   51 	call prt_i16  
      008422 A6 3A            [ 1]   52 	ld a,#': 
      008424 CD 89 5D         [ 4]   53 	call putc 
      008427 A6 20            [ 1]   54 	ld a,#SPACE 
      008429 CD 89 5D         [ 4]   55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00842C 85               [ 2]   56 	popw x 
      00842D F6               [ 1]   57 	ld a,(x)
      00842E 5F               [ 1]   58 	clrw x 
      00842F 97               [ 1]   59 	ld xl,a 
      008430 35 0A 00 0B      [ 1]   60 	mov base,#10 
      008434 CD 98 64         [ 4]   61 	call prt_i16 
      008437 81               [ 4]   62 	ret 
                                     63 
                                     64 ;----------------------------------------
                                     65 ;   DEBUG support functions
                                     66 ;----------------------------------------
                                     67 
                                     68 ; turn LED on 
      008438                         69 ledon:
      008438 72 1A 50 0A      [ 1]   70     bset PC_ODR,#LED2_BIT
      00843C 81               [ 4]   71     ret 
                                     72 
                                     73 ; turn LED off 
      00843D                         74 ledoff:
      00843D 72 1B 50 0A      [ 1]   75     bres PC_ODR,#LED2_BIT 
      008441 81               [ 4]   76     ret 
                                     77 
                                     78 ; invert LED status 
      008442                         79 ledtoggle:
      008442 A6 20            [ 1]   80     ld a,#LED2_MASK
      008444 C8 50 0A         [ 1]   81     xor a,PC_ODR
      008447 C7 50 0A         [ 1]   82     ld PC_ODR,a
      00844A 81               [ 4]   83     ret 
                                     84 
      00844B                         85 left_paren:
      00844B A6 20            [ 1]   86 	ld a,#SPACE 
      00844D CD 89 5D         [ 4]   87 	call putc
      008450 A6 28            [ 1]   88 	ld a,#'( 
      008452 CD 89 5D         [ 4]   89 	call putc 	
      008455 81               [ 4]   90 	ret 
                                     91 
                                     92 ;------------------------------
                                     93 ; print 8 bit register 
                                     94 ; input:
                                     95 ;   X  point to register name 
                                     96 ;   A  register value to print 
                                     97 ; output:
                                     98 ;   none
                                     99 ;------------------------------- 
      008456                        100 prt_reg8:
      008456 88               [ 1]  101 	push a 
      008457 CD 89 BA         [ 4]  102 	call puts 
      00845A 7B 01            [ 1]  103 	ld a,(1,sp) 
      00845C 5F               [ 1]  104 	clrw x 
      00845D 97               [ 1]  105 	ld xl,a 
      00845E 35 10 00 0B      [ 1]  106 	mov base,#16
      008462 CD 98 64         [ 4]  107 	call prt_i16  
      008465 CD 84 4B         [ 4]  108 	call left_paren 
      008468 84               [ 1]  109 	pop a 
      008469 5F               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00846A 97               [ 1]  111 	ld xl,a 
      00846B 35 0A 00 0B      [ 1]  112 	mov base,#10 
      00846F CD 98 64         [ 4]  113 	call prt_i16  
      008472 A6 29            [ 1]  114 	ld a,#') 
      008474 CD 89 5D         [ 4]  115 	call putc
      008477 81               [ 4]  116 	ret
                                    117 
                                    118 ;--------------------------------
                                    119 ; print 16 bits register 
                                    120 ; input:
                                    121 ;   X   point register name 
                                    122 ;   Y   register value to print 
                                    123 ; output:
                                    124 ;  none
                                    125 ;--------------------------------
      008478                        126 prt_reg16: 
      008478 90 89            [ 2]  127 	pushw y 
      00847A CD 89 BA         [ 4]  128 	call puts 
      00847D 1E 01            [ 2]  129 	ldw x,(1,sp) 
      00847F 35 10 00 0B      [ 1]  130 	mov base,#16 
      008483 CD 98 64         [ 4]  131 	call prt_i16  
      008486 CD 84 4B         [ 4]  132 	call left_paren 
      008489 85               [ 2]  133 	popw x 
      00848A 35 0A 00 0B      [ 1]  134 	mov base,#10 
      00848E CD 98 64         [ 4]  135 	call prt_i16  
      008491 A6 29            [ 1]  136 	ld a,#') 
      008493 CD 89 5D         [ 4]  137 	call putc
      008496 81               [ 4]  138 	ret 
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
      008497                        152 print_registers:
      008497 8A               [ 1]  153 	push cc 
      000418                        154 	_vars VSIZE 
      008498 52 08            [ 2]    1     sub sp,#VSIZE 
      00849A 6B 01            [ 1]  155 	ld (R_A,sp),a 
      00849C 1F 02            [ 2]  156 	ldw (R_X,sp),x 
      00849E 17 04            [ 2]  157 	ldw (R_Y,sp),y
      0084A0 C6 00 0D         [ 1]  158 	ld a,acc24 
      0084A3 CE 00 0E         [ 2]  159 	ldw x,acc16 
      0084A6 6B 08            [ 1]  160 	ld (SAV_ACC24,sp),a 
      0084A8 1F 06            [ 2]  161 	ldw (SAV_ACC16,sp),x 
      0084AA AE 85 01         [ 2]  162 	ldw x,#STATES
      0084AD CD 89 BA         [ 4]  163 	call puts
                                    164 ; print PC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0084B0 AE 85 3E         [ 2]  165 	ldw x, #REG_PC
      0084B3 16 0A            [ 2]  166 	ldw y, (R_PC,sp)
      0084B5 72 A2 00 03      [ 2]  167 	subw y,#3
      0084B9 CD 84 78         [ 4]  168 	call prt_reg16 
                                    169 ; print x
      0084BC AE 85 46         [ 2]  170 	ldw x,#REG_X
      0084BF 16 02            [ 2]  171 	ldw y,(R_X,sp)
      0084C1 CD 84 78         [ 4]  172 	call prt_reg16  
                                    173 ; print Y 
      0084C4 AE 85 42         [ 2]  174 	ldw x,#REG_Y
      0084C7 16 04            [ 2]  175 	ldw y, (R_Y,sp)
      0084C9 CD 84 78         [ 4]  176 	call prt_reg16  
                                    177 ; print A 
      0084CC AE 85 4A         [ 2]  178 	ldw x,#REG_A
      0084CF 7B 01            [ 1]  179 	ld a, (R_A,sp) 
      0084D1 CD 84 56         [ 4]  180 	call prt_reg8
                                    181 ; print CC 
      0084D4 AE 85 4E         [ 2]  182 	ldw x,#REG_CC 
      0084D7 7B 09            [ 1]  183 	ld a, (R_CC,sp) 
      0084D9 CD 84 56         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      0084DC AE 85 53         [ 2]  186 	ldw x,#REG_SP
      0084DF 90 96            [ 1]  187 	ldw y,sp 
      0084E1 72 A9 00 0B      [ 2]  188 	addw y,#(VSIZE+3)
      0084E5 CD 84 78         [ 4]  189 	call prt_reg16  
      0084E8 A6 0A            [ 1]  190 	ld a,#'\n' 
      0084EA CD 89 5D         [ 4]  191 	call putc
      0084ED 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      0084EF 1E 06            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      0084F1 C7 00 0D         [ 1]  194 	ld acc24,a 
      0084F4 CF 00 0E         [ 2]  195 	ldw acc16,x 
      0084F7 7B 01            [ 1]  196 	ld a,(R_A,sp)
      0084F9 1E 02            [ 2]  197 	ldw x,(R_X,sp)
      0084FB 16 04            [ 2]  198 	ldw y,(R_Y,sp)
      00047D                        199 	_drop VSIZE
      0084FD 5B 08            [ 2]    1     addw sp,#VSIZE 
      0084FF 86               [ 1]  200 	pop cc   	
      008500 81               [ 4]  201 	ret
                                    202 
      008501 0A 52 65 67 69 73 74   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 62
             72 65 61 6B 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00853E 50 43 3A 00            204 REG_PC: .asciz "PC:"
      008542 0A 59 3A 00            205 REG_Y:   .asciz "\nY:" 
      008546 0A 58 3A 00            206 REG_X:   .asciz "\nX:"
      00854A 0A 41 3A 00            207 REG_A:   .asciz "\nA:" 
      00854E 0A 43 43 3A 00         208 REG_CC:  .asciz "\nCC:"
      008553 0A 53 50 3A 00         209 REG_SP:  .asciz "\nSP:"
                                    210 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                    211 ;----------------------
                                    212 ; input:
                                    213 ;	Y    *input buffer 
                                    214 ; output:
                                    215 ;   acc24  integer 
                                    216 ;----------------------
      008558                        217 parse_addr:
      008558 A6 20            [ 1]  218 	ld a,#SPACE 
      00855A CD 8F 21         [ 4]  219 	call skip  	 
      00855D 72 B9 00 01      [ 2]  220 	addw y,in.w 
      008561 AE 16 E0         [ 2]  221 	ldw x,#pad 
      008564 CD 93 F4         [ 4]  222 	call strcpy
      008567 AE 16 E0         [ 2]  223 	ldw x,#pad
      00856A CD 99 06         [ 4]  224 	call atoi24 	
      00856D 81               [ 4]  225 	ret 
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
      00856E                        244 cmd_itf:
      00856E 8A               [ 1]  245 	push cc 
      0004EF                        246 	_vars VSIZE
      00856F 52 0B            [ 2]    1     sub sp,#VSIZE 
      008571 6B 01            [ 1]  247 	ld (R_A,sp),a
      008573 C6 00 04         [ 1]  248 	ld a,count 
      008576 6B 0A            [ 1]  249 	ld (SAV_COUNT,sp),a 
      008578 C6 00 02         [ 1]  250 	ld a,in 
      00857B 6B 09            [ 1]  251 	ld (SAV_IN,sp),a  
      00857D 1F 02            [ 2]  252 	ldw (R_X,sp),x 
      00857F 17 04            [ 2]  253 	ldw (R_Y,sp),y
      008581 C6 00 0D         [ 1]  254 	ld a,acc24 
      008584 CE 00 0E         [ 2]  255 	ldw x,acc16 
      008587 6B 08            [ 1]  256 	ld (SAV_ACC24,sp),a 
      008589 1F 06            [ 2]  257 	ldw (SAV_ACC16,sp),x 
      00858B 72 5F 00 19      [ 1]  258 	clr farptr 
      00858F 72 5F 00 1A      [ 1]  259 	clr farptr+1 
      008593 72 5F 00 1B      [ 1]  260 	clr farptr+2  
      008597                        261 repl:
      008597 A6 0D            [ 1]  262 	ld a,#CR 
      008599 CD 89 5D         [ 4]  263 	call putc 
      00859C A6 3F            [ 1]  264 	ld a,#'? 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00859E CD 89 5D         [ 4]  265 	call putc
      0085A1 72 5F 00 01      [ 1]  266 	clr in.w 
      0085A5 72 5F 00 02      [ 1]  267 	clr in 
      0085A9 CD 8A BF         [ 4]  268 	call readln
      0085AC 90 AE 16 90      [ 2]  269 	ldw y,#tib  
      0085B0 90 F6            [ 1]  270 	ld a,(y)
      0085B2 27 E3            [ 1]  271 	jreq repl  
      0085B4 72 5C 00 02      [ 1]  272 	inc in 
      0085B8 CD 98 FA         [ 4]  273 	call to_upper 
      0085BB A1 51            [ 1]  274 	cp a,#'Q 
      0085BD 26 26            [ 1]  275 	jrne test_p
      0085BF                        276 repl_exit:
                                    277 ; restore original context 
      0085BF 7B 08            [ 1]  278 	ld a,(SAV_ACC24,sp)
      0085C1 1E 06            [ 2]  279 	ldw x,(SAV_ACC16,sp)
      0085C3 C7 00 0D         [ 1]  280 	ld acc24,a 
      0085C6 CF 00 0E         [ 2]  281 	ldw acc16,x
      0085C9 7B 0A            [ 1]  282 	ld a,(SAV_COUNT,sp)
      0085CB C7 00 04         [ 1]  283 	ld count,a 
      0085CE 7B 09            [ 1]  284 	ld a,(SAV_IN,sp)
      0085D0 C7 00 02         [ 1]  285 	ld in,a 
      0085D3 16 04            [ 2]  286 	ldw y,(R_Y,sp)
      0085D5 1E 02            [ 2]  287 	ldw x,(R_X,sp)
      0085D7 7B 01            [ 1]  288 	ld a,(R_A,sp)
      000559                        289 	_drop VSIZE
      0085D9 5B 0B            [ 2]    1     addw sp,#VSIZE 
      0085DB 86               [ 1]  290 	pop cc 
      0085DC 81               [ 4]  291 	ret  
      0085DD                        292 invalid:
      0085DD AE 86 4B         [ 2]  293 	ldw x,#invalid_cmd 
      0085E0 CD 89 BA         [ 4]  294 	call puts 
      0085E3 20 B2            [ 2]  295 	jra repl 
      0085E5                        296 test_p:	
      0085E5 A1 50            [ 1]  297     cp a,#'P 
      0085E7 27 10            [ 1]  298 	jreq mem_peek
      0085E9 A1 53            [ 1]  299     cp a,#'S 
      0085EB 26 F0            [ 1]  300 	jrne invalid 
      0085ED                        301 print_string:
      0085ED CD 85 58         [ 4]  302 	call parse_addr 	
      0085F0 CE 00 0E         [ 2]  303 	ldw x,acc16
      0085F3 CD 89 BA         [ 4]  304 	call puts
      0085F6 CC 85 97         [ 2]  305 	jp repl 	
      0085F9                        306 mem_peek:
      0085F9 CD 85 58         [ 4]  307 	call parse_addr 
      0085FC C6 00 0D         [ 1]  308 	ld a, acc24 
      0085FF CA 00 0E         [ 1]  309 	or a,acc16 
      008602 CA 00 0F         [ 1]  310 	or a,acc8 
      008605 26 02            [ 1]  311 	jrne 1$ 
      008607 20 0C            [ 2]  312 	jra peek_byte  
      008609 CE 00 0D         [ 2]  313 1$:	ldw x,acc24 
      00860C CF 00 19         [ 2]  314 	ldw farptr,x 
      00860F C6 00 0F         [ 1]  315 	ld a,acc8 
      008612 C7 00 1B         [ 1]  316 	ld farptr+2,a 
      008615                        317 peek_byte:
      008615 CD 86 5A         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008618 A6 08            [ 1]  319 	ld a,#8 
      00861A 6B 0B            [ 1]  320 	ld (PSIZE,sp),a 
      00861C 5F               [ 1]  321 	clrw x 
      00861D CD 86 75         [ 4]  322 1$:	call fetchc  
      008620 89               [ 2]  323 	pushw x 
      008621 C7 00 0F         [ 1]  324 	ld acc8,a 
      008624 5F               [ 1]  325 	clrw x 
      008625 CF 00 0D         [ 2]  326 	ldw acc24,x 
      008628 A6 90            [ 1]  327 	ld a,#16+128
      00862A CD 98 7B         [ 4]  328 	call prt_acc24
      00862D 85               [ 2]  329 	popw x 
      00862E 0A 0B            [ 1]  330 	dec (PSIZE,sp)
      008630 26 EB            [ 1]  331 	jrne 1$ 
      008632 A6 08            [ 1]  332 	ld a,#8 
      008634 CB 00 1B         [ 1]  333 	add a,farptr+2 
      008637 C7 00 1B         [ 1]  334 	ld farptr+2,a
      00863A 4F               [ 1]  335 	clr a 
      00863B C9 00 1A         [ 1]  336 	adc a,farptr+1 
      00863E C7 00 1A         [ 1]  337 	ld farptr+1,a 
      008641 4F               [ 1]  338 	clr a 
      008642 C9 00 19         [ 1]  339 	adc a,farptr 
      008645 C7 00 19         [ 1]  340 	ld farptr,a 
      008648 CC 85 97         [ 2]  341 	jp repl  
                                    342 
      00864B 6E 6F 74 20 61 20 63   343 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    344 
                                    345 ;----------------------------
                                    346 ; display farptr address
                                    347 ;----------------------------
      00865A                        348 print_farptr:
      00865A C6 00 1B         [ 1]  349 	ld a ,farptr+2 
      00865D C7 00 0F         [ 1]  350 	ld acc8,a 
      008660 CE 00 19         [ 2]  351 	ldw x,farptr 
      008663 CF 00 0D         [ 2]  352 	ldw acc24,x 
      008666 5F               [ 1]  353 	clrw x 
      008667 A6 10            [ 1]  354 	ld a,#16 
      008669 CD 98 7B         [ 4]  355 	call prt_acc24
      00866C A6 20            [ 1]  356 	ld a,#SPACE 
      00866E CD 89 5D         [ 4]  357 	call putc 
      008671 CD 89 5D         [ 4]  358 	call putc 
      008674 81               [ 4]  359 	ret
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
      008675                        370 fetchc: ; @C
      008675 92 AF 00 19      [ 5]  371 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008679 5C               [ 1]  372 	incw x
      00867A 81               [ 4]  373 	ret
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
      00867B                        384 number:
      00867B CD 8F 34         [ 4]  385 	call get_token
      00867E A1 84            [ 1]  386 	cp a,#TK_INTGR
      008680 27 03            [ 1]  387 	jreq 1$
      008682 CC 96 B8         [ 2]  388 	jp syntax_error
      008685 81               [ 4]  389 1$:	ret
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
      008686                        404 show_row:
      008686 4D               [ 1]  405 	tnz a 
      008687 26 01            [ 1]  406 	jrne 1$
      008689 81               [ 4]  407 	ret 
      00868A                        408 1$:	
      00868A 89               [ 2]  409 	pushw x  
      00868B 88               [ 1]  410 	push a 
      00868C 35 04 00 24      [ 1]  411 	mov tab_width,#4 
      008690 CD 98 64         [ 4]  412 	call prt_i16 
      008693 A6 20            [ 1]  413 	ld a,#SPACE  
      008695 CD 89 5D         [ 4]  414 	call putc
      008698                        415 row_loop:
      008698 1E 02            [ 2]  416 	ldw x,(ADR,sp)
      00869A F6               [ 1]  417 	ld a,(x)
      00869B 5F               [ 1]  418 	clrw x 
      00869C 97               [ 1]  419 	ld xl,a 
      00869D CD 98 64         [ 4]  420 	call prt_i16 
      0086A0 1E 02            [ 2]  421 	ldw x,(ADR,sp)
      0086A2 5C               [ 1]  422 	incw x 
      0086A3 1F 02            [ 2]  423 	ldw (ADR,sp),x 
      0086A5 0A 01            [ 1]  424 	dec (CNT,sp)
      0086A7 26 EF            [ 1]  425 	jrne row_loop
      000629                        426 	_drop VSIZE  		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0086A9 5B 03            [ 2]    1     addw sp,#VSIZE 
      0086AB 35 04 00 24      [ 1]  427 	mov tab_width,#4
      0086AF A6 0D            [ 1]  428 	ld a,#CR 
      0086B1 CD 89 5D         [ 4]  429 	call putc 
      0086B4 81               [ 4]  430 	ret 
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
      0086B5                        443 hex_dump:
      0086B5 88               [ 1]  444 	push a 
      000636                        445 	_vars VSIZE
      0086B6 52 04            [ 2]    1     sub sp,#VSIZE 
      0086B8 C6 00 0B         [ 1]  446 	ld a,base
      0086BB 6B 03            [ 1]  447 	ld (BASE,sp),a 
      0086BD 35 10 00 0B      [ 1]  448 	mov base,#16
      0086C1 C6 00 24         [ 1]  449 	ld a,tab_width 
      0086C4 6B 04            [ 1]  450 	ld (TABW,sp),a
      0086C6 A6 0D            [ 1]  451 	ld a,#CR 
      0086C8 CD 89 5D         [ 4]  452 	call putc 
      0086CB 17 01            [ 2]  453 1$: ldw (BCNT,sp),y
      0086CD A6 10            [ 1]  454 	ld a,#16
      0086CF 90 A3 00 10      [ 2]  455 	cpw y,#16
      0086D3 2A 02            [ 1]  456 	jrpl 2$
      0086D5 90 9F            [ 1]  457 	ld a,yl
      0086D7                        458 2$: 	
      0086D7 CD 86 86         [ 4]  459 	call show_row 
      0086DA 16 01            [ 2]  460 	ldw y,(BCNT,sp) 
      0086DC 72 A2 00 10      [ 2]  461 	subw y,#16 
      0086E0 90 A3 00 01      [ 2]  462 	cpw y,#1
      0086E4 2A E5            [ 1]  463 	jrpl 1$
      0086E6 7B 03            [ 1]  464 	ld a,(BASE,sp)
      0086E8 C7 00 0B         [ 1]  465 	ld base,a
      0086EB 7B 04            [ 1]  466 	ld a,(TABW,sp)
      0086ED C7 00 24         [ 1]  467 	ld tab_width,a 
      000670                        468 	_drop VSIZE
      0086F0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0086F2 84               [ 1]  469 	pop a 
      0086F3 81               [ 4]  470 	ret 
                                    471 
                                    472 .endif ; DEBUG 
                                    473 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
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
      0086F4                         45 unlock_eeprom:
      0086F4 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      0086F9 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      0086FD 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008701 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008705 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008709 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00870E 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      00870F                         62 unlock_flash:
      00870F 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008714 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008718 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      00871C 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008720 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008724 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008729 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      00872A                         76 row_erase:
      00872A 88               [ 1]   77 	push a 
      00872B 90 89            [ 2]   78 	pushw y 
      00872D 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008731 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008735 4F               [ 1]   81 	clr a 
      008736 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008738 91 A7 00 19      [ 1]   83 	ldf ([farptr],y),a
      00873C 90 5C            [ 1]   84     incw y
      00873E 91 A7 00 19      [ 1]   85 	ldf ([farptr],y),a
      008742 90 5C            [ 1]   86     incw y
      008744 91 A7 00 19      [ 1]   87 	ldf ([farptr],y),a
      008748 90 5C            [ 1]   88     incw y
      00874A 91 A7 00 19      [ 1]   89 	ldf ([farptr],y),a
      00874E 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008753 90 85            [ 2]   91 	popw y 
      008755 84               [ 1]   92 	pop a 
      008756 81               [ 4]   93 	ret
      008757                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      008757                         97 move_erase_to_ram:
      008757 89               [ 2]   98 	pushw x 
      008758 90 89            [ 2]   99 	pushw y 
      00875A AE 87 57         [ 2]  100 	ldw x,#row_erase_end 
      00875D 1D 87 2A         [ 2]  101 	subw x,#row_erase
      008760 CF 00 0E         [ 2]  102 	ldw acc16,x 
      008763 AE 16 90         [ 2]  103 	ldw x,#tib 
      008766 90 AE 87 2A      [ 2]  104 	ldw y,#row_erase 
      00876A CD 94 04         [ 4]  105 	call move
      00876D 90 85            [ 2]  106 	popw y
      00876F 85               [ 2]  107 	popw x
      008770 81               [ 4]  108 	ret 
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
      008771                        123 program_row:
      008771 88               [ 1]  124 	push a 
      008772 90 89            [ 2]  125 	pushw y 
      008774 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      008776 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00877A 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00877E 90 5F            [ 1]  130 	clrw y 
      008780 F6               [ 1]  131 1$:	ld a,(x)
      008781 91 A7 00 19      [ 1]  132 	ldf ([farptr],y),a
      008785 5C               [ 1]  133 	incw x 
      008786 90 5C            [ 1]  134 	incw y 
      008788 0A 01            [ 1]  135 	dec (BCNT,sp)
      00878A 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00878C 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000711                        139 	_drop 1 
      008791 5B 01            [ 2]    1     addw sp,#1 
      008793 90 85            [ 2]  140 	popw y 
      008795 84               [ 1]  141 	pop a 
      008796 81               [ 4]  142 	ret 
      008797                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      008797                        149 move_prg_to_ram:
      008797 89               [ 2]  150 	pushw x 
      008798 90 89            [ 2]  151 	pushw y 
      00879A AE 87 97         [ 2]  152 	ldw x,#program_row_end 
      00879D 1D 87 71         [ 2]  153 	subw x,#program_row 
      0087A0 CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0087A3 AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
      0087A6 90 AE 87 71      [ 2]  156 	ldw y,#program_row ; source address 
      0087AA CD 94 04         [ 4]  157 	call move
      0087AD 90 85            [ 2]  158 	popw y 
      0087AF 85               [ 2]  159 	popw x  
      0087B0 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0087B1                        169 write_buffer:
      0087B1 89               [ 2]  170 	pushw x 
      0087B2 72 5D 00 19      [ 1]  171 	tnz farptr 
      0087B6 26 0D            [ 1]  172 	jrne to_flash 
      0087B8 CE 00 1A         [ 2]  173 	ldw x,farptr+1 
      0087BB A3 B7 00         [ 2]  174 	cpw x,#app_space  
      0087BE 24 05            [ 1]  175 	jruge to_flash 
      0087C0                        176 to_eeprom:
      0087C0 CD 86 F4         [ 4]  177 	call unlock_eeprom
      0087C3 20 03            [ 2]  178 	jra do_programming
      0087C5                        179 to_flash:
      0087C5 CD 87 0F         [ 4]  180 	call unlock_flash
      0087C8                        181 do_programming:
      0087C8 85               [ 2]  182 	popw x 
      0087C9 CD 16 90         [ 4]  183 	call tib
      0087CC 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0087D0 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0087D4 81               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      0087D5                        197 block_erase:
      0087D5 89               [ 2]  198 	pushw x 
      0087D6 C6 00 19         [ 1]  199 	ld a,farptr 
      0087D9 26 14            [ 1]  200 	jrne erase_flash
      0087DB CE 00 1A         [ 2]  201 	ldw x,farptr+1
      0087DE A3 B7 00         [ 2]  202 	cpw x,#app_space 
      0087E1 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      0087E3 CD 86 F4         [ 4]  205 	call unlock_eeprom 
      0087E6 CD 16 90         [ 4]  206 	call tib 
      0087E9 72 17 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0087ED 20 0A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0087EF                        210 erase_flash:
      0087EF CD 87 0F         [ 4]  211 	call unlock_flash 
      0087F2 CD 16 90         [ 4]  212 	call tib 
      0087F5 72 13 50 5F      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0087F9                        214 erase_exit: 
      0087F9 85               [ 2]  215 	popw x 
      0087FA 81               [ 4]  216 	ret 
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
      0087FB                        232 write_byte:
      0087FB 90 89            [ 2]  233 	pushw y
      00077D                        234 	_vars VSIZE
      0087FD 52 02            [ 2]    1     sub sp,#VSIZE 
      0087FF 6B 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      008801 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      008803 90 CE 00 1A      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008807 72 5D 00 19      [ 1]  240 	tnz farptr 
      00880B 26 14            [ 1]  241 	jrne write_flash
      00880D 90 A3 B7 00      [ 2]  242     cpw y,#app_space 	 
      008811 24 0E            [ 1]  243     jruge write_flash
      008813 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      008817 25 57            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      008819 90 A3 48 7F      [ 2]  246 	cpw y,#OPTION_END 
      00881D 22 51            [ 1]  247 	jrugt write_exit
      00881F 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      008821                        250 write_flash:
      008821 CD 87 0F         [ 4]  251 	call unlock_flash 
      008824 9B               [ 1]  252 1$:	sim 
      008825 7B 01            [ 1]  253 	ld a,(BTW,sp)
      008827 92 A7 00 19      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      00882B 72 05 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008830 9A               [ 1]  256     rim 
      008831 72 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008835 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      008837                        260 write_eeprom:
      008837 CD 86 F4         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      00883A 90 A3 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      00883E 2B 08            [ 1]  264 	jrmi 1$
      008840 90 A3 48 80      [ 2]  265 	cpw y,#OPTION_END+1
      008844 2A 02            [ 1]  266 	jrpl 1$
      008846 03 02            [ 1]  267 	cpl (OPT,sp)
      008848                        268 1$: 
      008848 0D 02            [ 1]  269     tnz (OPT,sp)
      00884A 27 08            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      00884C 72 1E 50 5B      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      008850 72 1F 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008854                        274 2$: 
      008854 7B 01            [ 1]  275     ld a,(BTW,sp)
      008856 92 A7 00 19      [ 4]  276     ldf ([farptr],x),a
      00885A 0D 02            [ 1]  277     tnz (OPT,sp)
      00885C 27 08            [ 1]  278     jreq 3$
      00885E 5C               [ 1]  279     incw x
      00885F 7B 01            [ 1]  280     ld a,(BTW,sp)
      008861 43               [ 1]  281     cpl a
      008862 92 A7 00 19      [ 4]  282     ldf ([farptr],x),a
      008866 72 05 50 5F FB   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00886B 72 0D 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      008870                        285 write_exit:
      008870 5C               [ 1]  286 	incw x 
      008871 CD 88 CF         [ 4]  287 	call incr_farptr
      0007F4                        288 	_drop VSIZE 
      008874 5B 02            [ 2]    1     addw sp,#VSIZE 
      008876 90 85            [ 2]  289 	popw y
      008878 81               [ 4]  290     ret
                                    291 
                                    292 ;--------------------------------------------
                                    293 ; write a data block to eeprom or flash 
                                    294 ; the block must be erased before 
                                    295 ; using this routine.
                                    296 ; input:
                                    297 ;   Y        source address   
                                    298 ;   X        array index  destination  farptr[x]
                                    299 ;   BSIZE    block size bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                    300 ;   farptr   write address , byte* 
                                    301 ; output:
                                    302 ;	X 		after last byte written 
                                    303 ;   Y 		after last byte read 
                                    304 ;  farptr   point after block
                                    305 ;---------------------------------------------
      008879                        306 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      0007F9                        307 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    308 	; local var 
                           000001   309 	XSAVE=1 
                           000002   310 	VSIZE=2 
      0007F9                        311 write_block::
      008879 88               [ 1]  312 	push a 
      0007FA                        313 	_vars VSIZE
      00887A 52 02            [ 2]    1     sub sp,#VSIZE 
      00887C 1F 01            [ 2]  314 	ldw (XSAVE,sp),x 
      00887E 1E 06            [ 2]  315 	ldw x,(BSIZE,sp) 
      008880 27 13            [ 1]  316 	jreq 9$
      008882 1E 01            [ 2]  317 1$:	ldw x,(XSAVE,sp)
      008884 90 F6            [ 1]  318 	ld a,(y)
      008886 CD 87 FB         [ 4]  319 	call write_byte 
      008889 5C               [ 1]  320 	incw x 
      00888A 90 5C            [ 1]  321 	incw y 
      00888C 1F 01            [ 2]  322 	ldw (XSAVE,sp),x
      00888E 1E 06            [ 2]  323 	ldw x,(BSIZE,sp)
      008890 5A               [ 2]  324 	decw x
      008891 1F 06            [ 2]  325 	ldw (BSIZE,sp),x 
      008893 26 ED            [ 1]  326 	jrne 1$
      008895                        327 9$:
      008895 1E 01            [ 2]  328 	ldw x,(XSAVE,sp)
      008897 CD 88 CF         [ 4]  329 	call incr_farptr
      00081A                        330 	_drop VSIZE
      00889A 5B 02            [ 2]    1     addw sp,#VSIZE 
      00889C 84               [ 1]  331 	pop a 
      00889D 81               [ 4]  332 	ret 
                                    333 
                                    334 
                                    335 ;------------------------------------
                                    336 ; write n bytes to flash | eeprom 
                                    337 ; if the number of bytes is 
                                    338 ; >=128 it is faster to 
                                    339 ; use write_block
                                    340 ; the bytes are written one by 
                                    341 ; one and auto erased if required. 
                                    342 ; input:
                                    343 ;    farptr    dest address 
                                    344 ;    X         src address 
                                    345 ;    A         count 
                                    346 ; output:
                                    347 ;    none   
                                    348 ;----------------------------------
      00889E                        349 write_nbytes:
      00889E 90 89            [ 2]  350 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0088A0 88               [ 1]  351 	push a 
      0088A1 90 93            [ 1]  352 	ldw y,x
      0088A3 5F               [ 1]  353 	clrw x 
      0088A4                        354 1$:  
      0088A4 90 F6            [ 1]  355 	ld a,(y)
      0088A6 90 5C            [ 1]  356 	incw y
      0088A8 CD 87 FB         [ 4]  357 	call write_byte 
      0088AB 5C               [ 1]  358 	incw x 
      0088AC 0A 01            [ 1]  359 	dec (1,sp)  
      0088AE 26 F4            [ 1]  360 	jrne 1$ 
      0088B0 84               [ 1]  361 9$: pop a 
      0088B1 90 85            [ 2]  362 	popw y 
      0088B3 81               [ 4]  363 	ret 
                                    364 
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 ;;;  flash memory operations
                                    367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    368 
                                    369 ;--------------------------
                                    370 ; align farptr to BLOCK_SIZE 
                                    371 ;---------------------------
      0088B4                        372 row_align:
      0088B4 A6 7F            [ 1]  373 	ld a,#0x7f 
      0088B6 C4 00 1B         [ 1]  374 	and a,farptr+2 
      0088B9 27 13            [ 1]  375 	jreq 1$ 
      0088BB CE 00 1A         [ 2]  376 	ldw x,farptr+1 
      0088BE 1C 00 80         [ 2]  377 	addw x,#BLOCK_SIZE 
      0088C1 24 04            [ 1]  378 	jrnc 0$
      0088C3 72 5C 00 19      [ 1]  379 	inc farptr 
      0088C7 9F               [ 1]  380 0$: ld a,xl 
      0088C8 A4 80            [ 1]  381 	and a,#0x80
      0088CA 97               [ 1]  382 	ld xl,a
      0088CB CF 00 1A         [ 2]  383 	ldw farptr+1,x  	
      0088CE 81               [ 4]  384 1$:	ret
                                    385 
                                    386 ;--------------------
                                    387 ; input:
                                    388 ;   X     increment 
                                    389 ; output:
                                    390 ;   farptr  incremented 
                                    391 ;---------------------
      0088CF                        392 incr_farptr:
      0088CF 72 BB 00 1A      [ 2]  393 	addw x,farptr+1 
      0088D3 24 04            [ 1]  394 	jrnc 1$
      0088D5 72 5C 00 19      [ 1]  395 	inc farptr 
      0088D9 CF 00 1A         [ 2]  396 1$:	ldw farptr+1,x  
      0088DC 81               [ 4]  397 	ret 
                                    398 
                                    399 ;-----------------------------------
                                    400 ; scan block for non zero byte 
                                    401 ; block are 128 bytes 
                                    402 ; input:
                                    403 ;    farptr     address block  
                                    404 ; output:
                                    405 ;     A     0 cleared, other not cleared  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                    406 ;-----------------------------------
      0088DD                        407 scan_block:
      0088DD 5F               [ 1]  408 	clrw x 
      0088DE 92 AF 00 19      [ 5]  409 1$: ldf a,([farptr],x) 
      0088E2 26 06            [ 1]  410 	jrne 2$
      0088E4 5C               [ 1]  411 	incw x 
      0088E5 A3 00 80         [ 2]  412 	cpw x,#BLOCK_SIZE 
      0088E8 25 F4            [ 1]  413 	jrult 1$ 
      0088EA 81               [ 4]  414 2$:	ret 
                                    415 
                                    416 
                                    417 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
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
      0088EB                         66 Uart1RxHandler: ; console receive char 
      0088EB 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0088F0 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0088F3 A1 03            [ 1]   69 	cp a,#CTRL_C 
      0088F5 26 06            [ 1]   70 	jrne 2$
      0088F7 CD 89 5D         [ 4]   71 	call putc 
      0088FA CC 80 C9         [ 2]   72 	jp user_interrupted
      0088FD                         73 2$:
      0088FD A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0088FF 26 03            [ 1]   75 	jrne 3$
      008901 CC 81 35         [ 2]   76 	jp cold_start 	
      008904 88               [ 1]   77 3$:	push a 
      008905 A6 27            [ 1]   78 	ld a,#rx1_queue 
      008907 CB 00 30         [ 1]   79 	add a,rx1_tail 
      00890A 5F               [ 1]   80 	clrw x 
      00890B 97               [ 1]   81 	ld xl,a 
      00890C 84               [ 1]   82 	pop a 
      00890D F7               [ 1]   83 	ld (x),a 
      00890E C6 00 30         [ 1]   84 	ld a,rx1_tail 
      008911 4C               [ 1]   85 	inc a 
      008912 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008914 C7 00 30         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      008917 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008918                         97 uart1_init:
      008918 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00891C 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008920 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008924 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008928                        103 uart1_set_baud: 
      008928 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008929 A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      00892B C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      00892E 27 0A            [ 1]  109 	jreq 2$ 
      008930                        110 1$: ; 8 Mhz 	
      008930 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008934 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008938 20 08            [ 2]  113 	jra 3$
      00893A                        114 2$: ; 16 Mhz 	
      00893A 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00893E 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008942                        117 3$:
      008942 72 5F 52 31      [ 1]  118     clr UART1_DR
      008946 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00894A 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00894E 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008953 72 5F 00 2F      [ 1]  122     clr rx1_head 
      008957 72 5F 00 30      [ 1]  123 	clr rx1_tail
      00895B 84               [ 1]  124 	pop a  
      00895C 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      00895D                        133 putc:: ; console output always on UART1
      00895D                        134 uart1_putc:: 
      00895D 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008962 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008965 81               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      008966                        148 qgetc::
      008966                        149 uart1_qgetc::
      008966 C6 00 2F         [ 1]  150 	ld a,rx1_head 
      008969 C0 00 30         [ 1]  151 	sub a,rx1_tail 
      00896C 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      00896D                        161 getc:: ;console input
      00896D                        162 uart1_getc::
      00896D CD 89 66         [ 4]  163 	call uart1_qgetc
      008970 27 FB            [ 1]  164 	jreq uart1_getc 
      008972 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008973 A6 27            [ 1]  167 	ld a,#rx1_queue
      008975 CB 00 2F         [ 1]  168 	add a,rx1_head 
      008978 5F               [ 1]  169 	clrw x  
      008979 97               [ 1]  170 	ld xl,a 
      00897A F6               [ 1]  171 	ld a,(x)
      00897B 88               [ 1]  172 	push a
      00897C C6 00 2F         [ 1]  173 	ld a,rx1_head 
      00897F 4C               [ 1]  174 	inc a 
      008980 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008982 C7 00 2F         [ 1]  176 	ld rx1_head,a 
      008985 84               [ 1]  177 	pop a  
      008986 85               [ 2]  178 	popw x
      008987 81               [ 4]  179 	ret 
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
      008988 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
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
      008994                        207 get_escape:
      008994 CD 89 6D         [ 4]  208     call getc 
      008997 A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      008999 27 02            [ 1]  210     jreq 1$
      00899B 4F               [ 1]  211     clr a
      00899C 81               [ 4]  212     ret
      00899D CD 89 6D         [ 4]  213 1$: call getc 
      0089A0 AE 89 88         [ 2]  214     ldw x,#convert_table
      0089A3                        215 2$:
      0089A3 F1               [ 1]  216     cp a,(x)
      0089A4 27 08            [ 1]  217     jreq 4$
      0089A6 1C 00 02         [ 2]  218     addw x,#2
      0089A9 7D               [ 1]  219     tnz (x)
      0089AA 26 F7            [ 1]  220     jrne 2$
      0089AC 4F               [ 1]  221     clr a
      0089AD 81               [ 4]  222     ret 
      0089AE 5C               [ 1]  223 4$: incw x 
      0089AF F6               [ 1]  224     ld a,(x)
      0089B0 A1 84            [ 1]  225     cp a,#SUP
      0089B2 26 05            [ 1]  226     jrne 5$
      0089B4 88               [ 1]  227     push a 
      0089B5 CD 89 6D         [ 4]  228     call getc
      0089B8 84               [ 1]  229     pop a 
      0089B9                        230 5$:
      0089B9 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089BA                        241 puts::
      0089BA F6               [ 1]  242     ld a,(x)
      0089BB 27 06            [ 1]  243 	jreq 1$
      0089BD CD 89 5D         [ 4]  244 	call putc 
      0089C0 5C               [ 1]  245 	incw x 
      0089C1 20 F7            [ 2]  246 	jra puts 
      0089C3 81               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0089C4                        258 bksp:
      0089C4 A6 08            [ 1]  259 	ld a,#BS 
      0089C6 CD 89 5D         [ 4]  260 	call putc 
      0089C9 A6 20            [ 1]  261 	ld a,#SPACE 
      0089CB CD 89 5D         [ 4]  262 	call putc 
      0089CE A6 08            [ 1]  263 	ld a,#BS 
      0089D0 CD 89 5D         [ 4]  264 	call putc 
      0089D3 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0089D4                        274 delete_nchar:
      0089D4 88               [ 1]  275 	push a 
      0089D5 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0089D7 27 07            [ 1]  277 	jreq 1$
      0089D9 CD 89 C4         [ 4]  278 	call bksp 
      0089DC 0A 01            [ 1]  279 	dec (1,sp)
      0089DE 20 F5            [ 2]  280 	jra 0$
      0089E0 84               [ 1]  281 1$:	pop a 
      0089E1 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0089E2                        290 send_escape:
      0089E2 A6 1B            [ 1]  291 	ld a,#ESC 
      0089E4 CD 89 5D         [ 4]  292 	call putc 
      0089E7 A6 5B            [ 1]  293 	ld a,#'[
      0089E9 CD 89 5D         [ 4]  294 	call putc 
      0089EC 81               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      0089ED                        311 send_parameter:
      0089ED 89               [ 2]  312 	pushw x 
      0089EE 5F               [ 1]  313 	clrw x 
      0089EF 97               [ 1]  314 	ld xl,a 
      0089F0 A6 0A            [ 1]  315 	ld a,#10 
      0089F2 62               [ 2]  316 	div x,a 
      0089F3 95               [ 1]  317 	ld xh,a 
      0089F4 9F               [ 1]  318 	ld a,xl
      0089F5 4D               [ 1]  319     tnz a 
      0089F6 27 0B            [ 1]  320     jreq 2$
      0089F8 A1 09            [ 1]  321 	cp a,#9 
      0089FA 23 02            [ 2]  322 	jrule 1$
      0089FC A6 09            [ 1]  323 	ld a,#9
      0089FE                        324 1$:
      0089FE AB 30            [ 1]  325 	add a,#'0 
      008A00 CD 89 5D         [ 4]  326 	call putc
      008A03 9E               [ 1]  327 2$:	ld a,xh 
      008A04 AB 30            [ 1]  328 	add a,#'0
      008A06 CD 89 5D         [ 4]  329 	call putc 
      008A09 85               [ 2]  330 	popw x 
      008A0A 81               [ 4]  331 	ret 
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
      008A0B                        344 move_left:
      008A0B 88               [ 1]  345 	push a 
      008A0C CD 89 E2         [ 4]  346 	call send_escape
      008A0F 84               [ 1]  347     pop a
      008A10 CD 89 ED         [ 4]  348 	call send_parameter 
      008A13 A6 44            [ 1]  349 	ld a,#'D 
      008A15 CD 89 5D         [ 4]  350 	call putc 
      008A18 81               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      008A19                        362 move_right:
      008A19 88               [ 1]  363 	push a 
      008A1A CD 89 E2         [ 4]  364 	call send_escape
      008A1D 84               [ 1]  365     pop a
      008A1E CD 89 ED         [ 4]  366 	call send_parameter 
      008A21 A6 43            [ 1]  367 	ld a,#'C 
      008A23 CD 89 5D         [ 4]  368 	call putc 
      008A26 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A27                        379 spaces::
      008A27 A6 20            [ 1]  380 	ld a,#SPACE 
      008A29 5D               [ 2]  381 1$:	tnzw x
      008A2A 27 06            [ 1]  382 	jreq 9$
      008A2C CD 89 5D         [ 4]  383 	call putc 
      008A2F 5A               [ 2]  384 	decw x
      008A30 20 F7            [ 2]  385 	jra 1$
      008A32                        386 9$: 
      008A32 81               [ 4]  387 	ret 
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
      008A33                        405 insert_char: 
      0009B3                        406 	_vars VSIZE 
      008A33 52 03            [ 2]    1     sub sp,#VSIZE 
      008A35 6B 02            [ 1]  407     ld (KCHAR,sp),a 
      008A37 9E               [ 1]  408     ld a,xh 
      008A38 6B 01            [ 1]  409 	ld (IPOS,sp),a
      008A3A 9F               [ 1]  410     ld a,xl 
      008A3B 6B 03            [ 1]  411     ld (LLEN,sp),a  
      008A3D 93               [ 1]  412     ldw x,y
      008A3E 5C               [ 1]  413     incw x 
      008A3F 7B 03            [ 1]  414     ld a,(LLEN,sp)
      008A41 10 01            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      008A43 4C               [ 1]  416     inc a 
      008A44 C7 00 0F         [ 1]  417     ld acc8,a 
      008A47 72 5F 00 0E      [ 1]  418     clr acc16
      008A4B CD 94 04         [ 4]  419     call move
      008A4E 90 AE 16 90      [ 2]  420     ldw y,#tib 
      008A52 7B 01            [ 1]  421     ld a,(IPOS,sp)
      008A54 C7 00 0F         [ 1]  422     ld acc8,a 
      008A57 72 B9 00 0E      [ 2]  423     addw y,acc16 
      008A5B 7B 02            [ 1]  424     ld a,(KCHAR,sp)
      008A5D 90 F7            [ 1]  425     ld (y),a
      008A5F 90 5C            [ 1]  426     incw y  
      008A61 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008A63 CD 8A 0B         [ 4]  428     call move_left
      008A66 AE 16 90         [ 2]  429     ldw x,#tib 
      008A69 CD 89 BA         [ 4]  430     call puts 
      008A6C 7B 03            [ 1]  431     ld a,(LLEN,sp)
      008A6E 10 01            [ 1]  432     sub a,(IPOS,sp) 
      008A70 CD 8A 0B         [ 4]  433     call move_left 
      0009F3                        434 	_drop VSIZE 
      008A73 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A75 81               [ 4]  435 	ret 
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
      008A76                        448 delete_under:
      0009F6                        449 	_vars VSIZE 
      008A76 52 02            [ 2]    1     sub sp,#VSIZE 
      008A78 6B 02            [ 1]  450     ld (LLEN,sp),a 
      008A7A 9F               [ 1]  451     ld a,xl 
      008A7B 6B 01            [ 1]  452     ld (CPOS,sp),a 
      008A7D 93               [ 1]  453     ldw x,y ; move destination
      008A7E 90 5C            [ 1]  454     incw y  ; move source 
      008A80 7B 02            [ 1]  455     ld a,(LLEN,sp)
      008A82 10 01            [ 1]  456     sub a,(CPOS,sp)
      008A84 4C               [ 1]  457     inc a ; move including zero at end.
      008A85 C7 00 0F         [ 1]  458     ld acc8,a 
      008A88 72 5F 00 0E      [ 1]  459     clr acc16 
      008A8C CD 94 04         [ 4]  460 	call move 
      008A8F 90 AE 16 90      [ 2]  461     ldw y,#tib 
      008A93 7B 01            [ 1]  462     ld a,(CPOS,sp)
      008A95 C7 00 0F         [ 1]  463     ld acc8,a 
      008A98 72 B9 00 0E      [ 2]  464     addw y,acc16 
      008A9C 93               [ 1]  465     ldw x,y 
      008A9D CD 89 BA         [ 4]  466     call puts 
      008AA0 A6 20            [ 1]  467     ld a,#SPACE  
      008AA2 CD 89 5D         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008AA5 7B 02            [ 1]  469     ld a,(LLEN,sp)
      008AA7 10 01            [ 1]  470     sub a,(CPOS,sp)
      008AA9 CD 8A 0B         [ 4]  471     call move_left 
      008AAC 0A 02            [ 1]  472     dec (LLEN,sp)
      000A2E                        473 	_drop VSIZE 
      008AAE 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AB0 81               [ 4]  474 	ret 
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
      008AB1                        486 delete_line:
      008AB1 CD 89 E2         [ 4]  487     call send_escape
      008AB4 A6 32            [ 1]  488 	ld a,#'2
      008AB6 CD 89 5D         [ 4]  489 	call putc 
      008AB9 A6 4B            [ 1]  490 	ld a,#'K 
      008ABB CD 89 5D         [ 4]  491 	call putc 
      008ABE 81               [ 4]  492 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                           000004   523 	VSIZE=4 
      008ABF                        524 readln::
      008ABF 90 89            [ 2]  525 	pushw y 
      000A41                        526 	_vars VSIZE 
      008AC1 52 04            [ 2]    1     sub sp,#VSIZE 
      008AC3 5F               [ 1]  527 	clrw x 
      008AC4 1F 02            [ 2]  528 	ldw (LL,sp),x 
      008AC6 1F 03            [ 2]  529 	ldw (CPOS,sp),x 
      008AC8 03 04            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008ACA 90 AE 16 90      [ 2]  531  	ldw y,#tib ; terminal input buffer
      008ACE                        532 readln_loop:
      008ACE CD 89 6D         [ 4]  533 	call getc
      008AD1 6B 01            [ 1]  534 	ld (RXCHAR,sp),a
      008AD3 A1 1B            [ 1]  535     cp a,#ESC 
      008AD5 26 05            [ 1]  536     jrne 0$
      008AD7 CD 89 94         [ 4]  537     call get_escape 
      008ADA 6B 01            [ 1]  538     ld (RXCHAR,sp),a 
      008ADC A1 0D            [ 1]  539 0$:	cp a,#CR
      008ADE 26 03            [ 1]  540 	jrne 1$
      008AE0 CC 8C 5B         [ 2]  541 	jp readln_quit
      008AE3 A1 0A            [ 1]  542 1$:	cp a,#LF 
      008AE5 26 03            [ 1]  543 	jrne 2$ 
      008AE7 CC 8C 5B         [ 2]  544 	jp readln_quit
      008AEA                        545 2$:
      008AEA A1 08            [ 1]  546 	cp a,#BS
      008AEC 26 12            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      008AEE 0D 03            [ 1]  549     tnz (CPOS,sp)
      008AF0 27 DC            [ 1]  550     jreq readln_loop 
      008AF2 A6 01            [ 1]  551     ld a,#1 
      008AF4 CD 8A 0B         [ 4]  552     call move_left
      008AF7 0A 03            [ 1]  553     dec (CPOS,sp)
      008AF9 90 5A            [ 2]  554     decw y 
      008AFB 7B 03            [ 1]  555     ld a,(CPOS,sp) 
      008AFD CC 8C 07         [ 2]  556     jp 12$
      008B00                        557 3$:
      008B00 A1 04            [ 1]  558 	cp a,#CTRL_D
      008B02 26 1A            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      008B04 CD 8A B1         [ 4]  561 	call delete_line 
      008B07 7B 03            [ 1]  562     ld a,(CPOS,sp)
      008B09 4C               [ 1]  563     inc a 
      008B0A CD 8A 0B         [ 4]  564     call move_left 
      008B0D A6 3E            [ 1]  565 	ld a,#'> 
      008B0F CD 89 5D         [ 4]  566 	call putc 
      008B12 90 AE 16 90      [ 2]  567 	ldw y,#tib
      008B16 90 7F            [ 1]  568 	clr (y)
      008B18 0F 02            [ 1]  569 	clr (LL,sp)
      008B1A 0F 03            [ 1]  570 	clr (CPOS,sp)
      008B1C 20 B0            [ 2]  571 	jra readln_loop
      008B1E                        572 4$:
      008B1E A1 12            [ 1]  573 	cp a,#CTRL_R 
      008B20 26 1E            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      008B22 0D 02            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008B24 26 A8            [ 1]  577 	jrne readln_loop
      008B26 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008B2A 93               [ 1]  579 	ldw x,y
      008B2B CD 93 D8         [ 4]  580 	call strlen
      008B2E 4D               [ 1]  581 	tnz a  
      008B2F 27 9D            [ 1]  582 	jreq readln_loop
      008B31 6B 02            [ 1]  583 	ld (LL,sp),a 
      008B33 6B 03            [ 1]  584     ld (CPOS,sp),a
      008B35 93               [ 1]  585 	ldw x,y  
      008B36 CD 89 BA         [ 4]  586 	call puts
      008B39 0F 01            [ 1]  587 	clr (LL_HB,sp)
      008B3B 72 F9 01         [ 2]  588 	addw y,(LL_HB,sp)
      008B3E 20 8E            [ 2]  589 	jra readln_loop 
      008B40                        590 5$:
      008B40 A1 05            [ 1]  591 	cp a,#CTRL_E 
      008B42 26 41            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008B44 AE 16 90         [ 2]  594 	ldw x,#tib 
      008B47 CD 99 06         [ 4]  595 	call atoi24
      008B4A CE 00 0E         [ 2]  596 	ldw x,acc16
      008B4D CD 8C 97         [ 4]  597 	call search_lineno
      008B50 5D               [ 2]  598 	tnzw x 
      008B51 26 03            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008B53 CC 8C 5B         [ 2]  603 	jp readln_quit  
      008B56                        604 51$:
      008B56 CF 00 05         [ 2]  605 	ldw basicptr,x
      008B59 E6 02            [ 1]  606 	ld a,(2,x)
      008B5B C7 00 04         [ 1]  607 	ld count,a 
      008B5E 90 AE 16 90      [ 2]  608 	ldw y,#tib 
      008B62 CD 91 F4         [ 4]  609 	call decompile 
      008B65 0F 01            [ 1]  610 	clr (LL_HB,sp)
      008B67 A6 0D            [ 1]  611 	ld a,#CR 
      008B69 CD 89 5D         [ 4]  612 	call putc 
      008B6C A6 3E            [ 1]  613 	ld a,#'>
      008B6E CD 89 5D         [ 4]  614 	call putc
      008B71 AE 16 90         [ 2]  615     ldw x,#tib  
      008B74 CD 93 D8         [ 4]  616 	call strlen 
      008B77 6B 02            [ 1]  617 	ld (LL,sp),a 
      008B79 CD 89 BA         [ 4]  618 	call puts 
      008B7C 90 93            [ 1]  619 	ldw y,x
      008B7E 7B 02            [ 1]  620     ld a,(LL,sp)
      008B80 6B 03            [ 1]  621     ld (CPOS,sp),a  
      008B82 CC 8A CE         [ 2]  622 	jp readln_loop
      008B85                        623 6$:
      008B85 A1 81            [ 1]  624 	cp a,#ARROW_RIGHT
      008B87 26 15            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008B89 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008B8B 11 02            [ 1]  628     cp a,(LL,sp)
      008B8D 2B 03            [ 1]  629     jrmi 61$
      008B8F CC 8A CE         [ 2]  630     jp readln_loop 
      008B92                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B92 A6 01            [ 1]  632     ld a,#1 
      008B94 CD 8A 19         [ 4]  633 	call move_right 
      008B97 0C 03            [ 1]  634 	inc (CPOS,sp)
      008B99 90 5C            [ 1]  635     incw y 
      008B9B CC 8A CE         [ 2]  636     jp readln_loop 
      008B9E A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008BA0 26 13            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008BA2 0D 03            [ 1]  640 	tnz (CPOS,sp)
      008BA4 26 03            [ 1]  641 	jrne 71$
      008BA6 CC 8A CE         [ 2]  642 	jp readln_loop
      008BA9                        643 71$:
      008BA9 A6 01            [ 1]  644     ld a,#1 
      008BAB CD 8A 0B         [ 4]  645 	call move_left 
      008BAE 0A 03            [ 1]  646 	dec (CPOS,sp)
      008BB0 90 5A            [ 2]  647     decw y 
      008BB2 CC 8A CE         [ 2]  648 	jp readln_loop 
      008BB5 A1 82            [ 1]  649 8$: cp a,#HOME  
      008BB7 26 0E            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008BB9 7B 03            [ 1]  652     ld a,(CPOS,sp)
      008BBB CD 8A 0B         [ 4]  653     call move_left 
      008BBE 0F 03            [ 1]  654 	clr (CPOS,sp)
      008BC0 90 AE 16 90      [ 2]  655     ldw y,#tib 
      008BC4 CC 8A CE         [ 2]  656 	jp readln_loop  
      008BC7 A1 83            [ 1]  657 9$: cp a,#KEY_END  
      008BC9 26 26            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008BCB 7B 03            [ 1]  660 	ld a,(CPOS,sp)
      008BCD 11 02            [ 1]  661 	cp a,(LL,sp)
      008BCF 26 03            [ 1]  662 	jrne 91$
      008BD1 CC 8A CE         [ 2]  663 	jp readln_loop 
      008BD4                        664 91$:
      008BD4 7B 02            [ 1]  665 	ld a,(LL,sp)
      008BD6 10 03            [ 1]  666 	sub a,(CPOS,sp)
      008BD8 CD 8A 19         [ 4]  667 	call move_right 
      008BDB 7B 02            [ 1]  668 	ld a,(LL,sp)
      008BDD 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008BDF 90 AE 16 90      [ 2]  670     ldw y,#tib
      008BE3 72 5F 00 0E      [ 1]  671     clr acc16 
      008BE7 C7 00 0F         [ 1]  672     ld acc8,a 
      008BEA 72 B9 00 0E      [ 2]  673     addw y,acc16  
      008BEE CC 8A CE         [ 2]  674 	jp readln_loop 
      008BF1 A1 0F            [ 1]  675 10$: cp a,#CTRL_O
      008BF3 26 08            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008BF5 03 04            [ 1]  678 	cpl (OVRWR,sp)
      008BF7 CD A5 A0         [ 4]  679 	call beep_1khz
      008BFA CC 8A CE         [ 2]  680 	jp readln_loop 
      008BFD A1 84            [ 1]  681 11$: cp a,#SUP 
      008BFF 26 11            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008C01 7B 03            [ 1]  684     ld a,(CPOS,sp)
      008C03 11 02            [ 1]  685     cp a,(LL,sp)
      008C05 2A 08            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008C07                        687 12$:
      008C07 97               [ 1]  688     ld xl,a    ; cursor position 
      008C08 7B 02            [ 1]  689     ld a,(LL,sp)  ; line length
      008C0A CD 8A 76         [ 4]  690     call delete_under
      008C0D 0A 02            [ 1]  691     dec (LLEN,sp)
      008C0F                        692 13$:
      008C0F CC 8A CE         [ 2]  693     jp readln_loop 
      008C12                        694 final_test:
      008C12 A1 20            [ 1]  695 	cp a,#SPACE
      008C14 2A 03            [ 1]  696 	jrpl accept_char
      008C16 CC 8A CE         [ 2]  697 	jp readln_loop
      008C19                        698 accept_char:
      008C19 A6 4F            [ 1]  699 	ld a,#TIB_SIZE-1
      008C1B 11 02            [ 1]  700 	cp a, (LL,sp)
      008C1D 2A 03            [ 1]  701 	jrpl 1$
      008C1F CC 8A CE         [ 2]  702 	jp readln_loop
      008C22 0D 04            [ 1]  703 1$:	tnz (OVRWR,sp)
      008C24 26 18            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008C26 7B 03            [ 1]  706     ld a,(CPOS,sp)
      008C28 11 02            [ 1]  707     cp a,(LL,sp)
      008C2A 27 12            [ 1]  708     jreq overwrite
      008C2C 7B 02            [ 1]  709     ld a,(LL,sp)
      008C2E 97               [ 1]  710     ld xl,a 
      008C2F 7B 03            [ 1]  711     ld a,(CPOS,sp)
      008C31 95               [ 1]  712     ld xh,a
      008C32 7B 01            [ 1]  713     ld a,(RXCHAR,sp)
      008C34 CD 8A 33         [ 4]  714     call insert_char
      008C37 0C 02            [ 1]  715     inc (LLEN,sp)
      008C39 0C 03            [ 1]  716     inc (CPOS,sp)	
      008C3B CC 8A CE         [ 2]  717     jp readln_loop 
      008C3E                        718 overwrite:
      008C3E 7B 01            [ 1]  719 	ld a,(RXCHAR,sp)
      008C40 90 F7            [ 1]  720 	ld (y),a
      008C42 90 5C            [ 1]  721     incw y
      008C44 CD 89 5D         [ 4]  722     call putc 
      008C47 7B 03            [ 1]  723 	ld a,(CPOS,sp)
      008C49 11 02            [ 1]  724 	cp a,(LL,sp)
      008C4B 2B 09            [ 1]  725 	jrmi 1$
      008C4D 90 7F            [ 1]  726 	clr (y)
      008C4F 0C 02            [ 1]  727 	inc (LL,sp)
      008C51 0C 03            [ 1]  728     inc (CPOS,sp)
      008C53 CC 8A CE         [ 2]  729 	jp readln_loop 
      008C56                        730 1$:	
      008C56 0C 03            [ 1]  731 	inc (CPOS,sp)
      008C58 CC 8A CE         [ 2]  732 	jp readln_loop 
      008C5B                        733 readln_quit:
      008C5B 90 AE 16 90      [ 2]  734 	ldw y,#tib
      008C5F 0F 01            [ 1]  735     clr (LL_HB,sp) 
      008C61 72 F9 01         [ 2]  736     addw y,(LL_HB,sp)
      008C64 90 7F            [ 1]  737     clr (y)
      008C66 7B 02            [ 1]  738 	ld a,(LL,sp)
      008C68 C7 00 04         [ 1]  739 	ld count,a 
      008C6B A6 0D            [ 1]  740 	ld a,#CR
      008C6D CD 89 5D         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      000BF0                        742 	_drop VSIZE 
      008C70 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C72 90 85            [ 2]  743 	popw y 
      008C74 81               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      008C75                        752 print_hex::
      008C75 88               [ 1]  753 	push a 
      008C76 4E               [ 1]  754 	swap a 
      008C77 CD 8C 8C         [ 4]  755 	call to_hex_char 
      008C7A CD 89 5D         [ 4]  756 	call putc 
      008C7D 7B 01            [ 1]  757     ld a,(1,sp) 
      008C7F CD 8C 8C         [ 4]  758 	call to_hex_char
      008C82 CD 89 5D         [ 4]  759 	call putc
      008C85 A6 20            [ 1]  760 	ld a,#SPACE 
      008C87 CD 89 5D         [ 4]  761 	call putc 
      008C8A 84               [ 1]  762 	pop a 
      008C8B 81               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008C8C                        772 to_hex_char::
      008C8C A4 0F            [ 1]  773 	and a,#15 
      008C8E A1 09            [ 1]  774 	cp a,#9 
      008C90 23 02            [ 2]  775 	jrule 1$ 
      008C92 AB 07            [ 1]  776 	add a,#7
      008C94 AB 30            [ 1]  777 1$: add a,#'0 
      008C96 81               [ 4]  778 	ret 
                                    779 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
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
      008C97                         51 search_lineno::
      000C17                         52 	_vars VSIZE
      008C97 52 02            [ 2]    1     sub sp,#VSIZE 
      008C99 0F 01            [ 1]   53 	clr (LL,sp)
      008C9B 90 CE 00 1C      [ 2]   54 	ldw y,txtbgn
      008C9F 4D               [ 1]   55 	tnz a 
      008CA0 27 04            [ 1]   56 	jreq search_ln_loop
      008CA2 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008CA6                         58 search_ln_loop:
      008CA6 90 C3 00 1E      [ 2]   59 	cpw y,txtend 
      008CAA 2A 10            [ 1]   60 	jrpl 8$
      008CAC 90 F3            [ 1]   61 	cpw x,(y)
      008CAE 27 0E            [ 1]   62 	jreq 9$
      008CB0 2B 0A            [ 1]   63 	jrmi 8$ 
      008CB2 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CB5 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CB7 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008CBA 20 EA            [ 2]   67 	jra search_ln_loop 
      008CBC                         68 8$: 
      008CBC 5F               [ 1]   69 	clrw x 	
      008CBD 51               [ 1]   70 	exgw x,y 
      000C3E                         71 9$: _drop VSIZE
      008CBE 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CC0 51               [ 1]   72 	exgw x,y   
      008CC1 81               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008CC2                         83 del_line: 
      000C42                         84 	_vars VSIZE 
      008CC2 52 04            [ 2]    1     sub sp,#VSIZE 
      008CC4 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008CC6 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008CC8 0F 01            [ 1]   87 	clr (LLEN,sp)
      008CCA 90 93            [ 1]   88 	ldw y,x  
      008CCC 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008CCF 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008CD1 90 CE 00 1E      [ 2]   91 	ldw y,txtend 
      008CD5 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008CD8 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008CDC 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008CDE CD 94 04         [ 4]   95 	call move
      008CE1 90 CE 00 1E      [ 2]   96 	ldw y,txtend 
      008CE5 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008CE8 90 CF 00 1E      [ 2]   98 	ldw txtend,y  
      000C6C                         99 	_drop VSIZE     
      008CEC 5B 04            [ 2]    1     addw sp,#VSIZE 
      008CEE 81               [ 4]  100 	ret 
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
      008CEF                        115 create_gap:
      000C6F                        116 	_vars VSIZE
      008CEF 52 06            [ 2]    1     sub sp,#VSIZE 
      008CF1 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008CF3 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008CF5 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008CF9 90 93            [ 1]  120 	ldw y,x ; SRC
      008CFB 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008CFF 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008D01 CE 00 1E         [ 2]  124 	ldw x,txtend 
      008D04 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008D07 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D0A 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D0C CD 94 04         [ 4]  128 	call move
      008D0F CE 00 1E         [ 2]  129 	ldw x,txtend
      008D12 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D15 CF 00 1E         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      000C98                        132 9$:	_drop VSIZE 
      008D18 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D1A 81               [ 4]  133 	ret 
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
      008D1B                        150 insert_line:
      000C9B                        151 	_vars VSIZE 
      008D1B 52 08            [ 2]    1     sub sp,#VSIZE 
      008D1D CE 00 1E         [ 2]  152 	ldw x,txtend  
      008D20 C3 00 1C         [ 2]  153 	cpw x,txtbgn 
      008D23 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D25 AE 00 02         [ 2]  156 	ldw x,#2 
      008D28 72 D6 00 1A      [ 4]  157 	ld a,([ptr16],x)
      008D2C A1 03            [ 1]  158 	cp a,#3
      008D2E 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D30 5F               [ 1]  160 	clrw x 
      008D31 97               [ 1]  161 	ld xl,a
      008D32 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D34 CE 00 1C         [ 2]  163 	ldw x,txtbgn
      008D37 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D39 CE 00 1E         [ 2]  165 	ldw x,txtend 
      008D3C 20 38            [ 2]  166 	jra 4$
      008D3E 72 CE 00 1A      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D42 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D44 AE 00 02         [ 2]  170 	ldw x,#2 
      008D47 72 D6 00 1A      [ 4]  171 	ld a,([ptr16],x)
      008D4B 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D4C 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D4E 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D50 4F               [ 1]  177 	clr a 
      008D51 CD 8C 97         [ 4]  178 	call search_lineno 
      008D54 5D               [ 2]  179 	tnzw x 
      008D55 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D57 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D59 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008D5B 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008D5D CD 8C C2         [ 4]  188 	call del_line
      008D60                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008D60 A6 03            [ 1]  192 	ld a,#3
      008D62 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008D64 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008D66 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008D68 C3 00 1E         [ 2]  198 	cpw x,txtend 
      008D6B 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008D6D 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008D6F 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008D71 CD 8C EF         [ 4]  204 	call create_gap
      008D74 20 06            [ 2]  205 	jra 5$
      008D76                        206 4$: 
      008D76 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008D79 CF 00 1E         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008D7C 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008D7E CF 00 0E         [ 2]  211 	ldw acc16,x 
      008D81 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      008D85 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008D87 CD 94 04         [ 4]  214 	call move 
      008D8A                        215 insert_ln_exit:	
      000D0A                        216 	_drop VSIZE
      008D8A 5B 08            [ 2]    1     addw sp,#VSIZE 
      008D8C 81               [ 4]  217 	ret
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
      008D8D                        233 parse_quote: 
      000D0D                        234 	_vars VSIZE 
      008D8D 52 02            [ 2]    1     sub sp,#VSIZE 
      008D8F 4F               [ 1]  235 	clr a
      008D90 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008D92                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008D92 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008D95 27 24            [ 1]  239 	jreq 6$
      008D97 72 5C 00 02      [ 1]  240 	inc in 
      008D9B 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008D9D A6 5C            [ 1]  242 	ld a,#'\
      008D9F 11 01            [ 1]  243 	cp a, (PREV,sp)
      008DA1 26 0A            [ 1]  244 	jrne 3$
      008DA3 0F 01            [ 1]  245 	clr (PREV,sp)
      008DA5 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008DA7 AD 1C            [ 4]  247 	callr convert_escape
      008DA9 F7               [ 1]  248 	ld (x),a 
      008DAA 5C               [ 1]  249 	incw x 
      008DAB 20 E5            [ 2]  250 	jra 2$
      008DAD                        251 3$:
      008DAD 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DAF A1 5C            [ 1]  253 	cp a,#'\'
      008DB1 27 DD            [ 1]  254 	jreq 1$
      008DB3 A1 22            [ 1]  255 	cp a,#'"
      008DB5 27 04            [ 1]  256 	jreq 6$ 
      008DB7 F7               [ 1]  257 	ld (x),a 
      008DB8 5C               [ 1]  258 	incw x 
      008DB9 20 D7            [ 2]  259 	jra 2$
      008DBB                        260 6$:
      008DBB 7F               [ 1]  261 	clr (x)
      008DBC 5C               [ 1]  262 	incw x 
      008DBD 90 93            [ 1]  263 	ldw y,x 
      008DBF 5F               [ 1]  264 	clrw x 
      008DC0 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D42                        266 	_drop VSIZE
      008DC2 5B 02            [ 2]    1     addw sp,#VSIZE 
      008DC4 81               [ 4]  267 	ret 
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
      008DC5                        278 convert_escape:
      008DC5 89               [ 2]  279 	pushw x 
      008DC6 AE 8D DA         [ 2]  280 	ldw x,#escaped 
      008DC9 F1               [ 1]  281 1$:	cp a,(x)
      008DCA 27 06            [ 1]  282 	jreq 2$
      008DCC 7D               [ 1]  283 	tnz (x)
      008DCD 27 09            [ 1]  284 	jreq 3$
      008DCF 5C               [ 1]  285 	incw x 
      008DD0 20 F7            [ 2]  286 	jra 1$
      008DD2 1D 8D DA         [ 2]  287 2$: subw x,#escaped 
      008DD5 9F               [ 1]  288 	ld a,xl 
      008DD6 AB 07            [ 1]  289 	add a,#7
      008DD8 85               [ 2]  290 3$:	popw x 
      008DD9 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    292 
      008DDA 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008DE2                        310 parse_integer: ; { -- n }
      008DE2 89               [ 2]  311 	pushw x 	
      008DE3 4B 00            [ 1]  312 	push #0 ; TCHAR
      008DE5 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008DE7 A1 24            [ 1]  314 	cp a,#'$
      008DE9 26 04            [ 1]  315 	jrne 2$ 
      000D6B                        316     _drop #1
      008DEB 5B 01            [ 2]    1     addw sp,##1 
      008DED 4B 10            [ 1]  317 	push #16  ; BASE=16
      008DEF F7               [ 1]  318 2$:	ld (x),a 
      008DF0 5C               [ 1]  319 	incw x 
      008DF1 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008DF4 72 5C 00 02      [ 1]  321 	inc in 
      008DF8 CD 98 FA         [ 4]  322 	call to_upper 
      008DFB 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008DFD CD 8E 7F         [ 4]  324 	call is_digit 
      008E00 25 ED            [ 1]  325 	jrc 2$
      008E02 A6 10            [ 1]  326 	ld a,#16 
      008E04 11 01            [ 1]  327 	cp a,(BASE,sp)
      008E06 26 0A            [ 1]  328 	jrne 3$ 
      008E08 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E0A A1 41            [ 1]  330 	cp a,#'A 
      008E0C 2B 04            [ 1]  331 	jrmi 3$ 
      008E0E A1 47            [ 1]  332 	cp a,#'G 
      008E10 2B DD            [ 1]  333 	jrmi 2$ 
      008E12 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E16 7F               [ 1]  335     clr (x)
      008E17 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E19 CD 99 06         [ 4]  337 	call atoi24
      008E1C 16 03            [ 2]  338 	ldw y,(XSAVE,sp)
      008E1E C6 00 0D         [ 1]  339 	ld a,acc24 
      008E21 90 F7            [ 1]  340 	ld (y),a 
      008E23 90 5C            [ 1]  341 	incw y  
      008E25 CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E28 90 FF            [ 2]  343 	ldw (y),x 
      008E2A 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008E2E A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DB0                        346 	_drop VSIZE  
      008E30 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E32 81               [ 4]  347 	ret 	
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
      008E33                        364 parse_binary: ; { -- n }
      008E33 4B 00            [ 1]  365 	push #0
      008E35 4B 00            [ 1]  366 	push #0
      008E37 4B 00            [ 1]  367 	push #0
      008E39                        368 2$:	
      008E39 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E3C 72 5C 00 02      [ 1]  370 	inc in 
      008E40 A1 30            [ 1]  371 	cp a,#'0 
      008E42 27 06            [ 1]  372 	jreq 3$
      008E44 A1 31            [ 1]  373 	cp a,#'1 
      008E46 27 02            [ 1]  374 	jreq 3$ 
      008E48 20 0B            [ 2]  375 	jra bin_exit 
      008E4A A0 30            [ 1]  376 3$: sub a,#'0 
      008E4C 46               [ 1]  377 	rrc a
      008E4D 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E4F 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E51 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E53 20 E4            [ 2]  381 	jra 2$  
      008E55                        382 bin_exit:
      008E55 72 5A 00 02      [ 1]  383 	dec in 
      008E59 90 93            [ 1]  384 	ldw y,x
      008E5B 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008E5D 90 F7            [ 1]  386 	ld (y),a 
      008E5F 90 5C            [ 1]  387 	incw y 
      008E61 1E 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008E63 90 FF            [ 2]  389 	ldw (y),x 
      008E65 72 A9 00 02      [ 2]  390 	addw y,#2  
      008E69 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000DEB                        392 	_drop VSIZE 
      008E6B 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E6D 81               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      008E6E                        402 is_alpha::
      008E6E A1 41            [ 1]  403 	cp a,#'A 
      008E70 8C               [ 1]  404 	ccf 
      008E71 24 0B            [ 1]  405 	jrnc 9$ 
      008E73 A1 5B            [ 1]  406 	cp a,#'Z+1 
      008E75 25 07            [ 1]  407 	jrc 9$ 
      008E77 A1 61            [ 1]  408 	cp a,#'a 
      008E79 8C               [ 1]  409 	ccf 
      008E7A 24 02            [ 1]  410 	jrnc 9$
      008E7C A1 7B            [ 1]  411 	cp a,#'z+1
      008E7E 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008E7F                        421 is_digit::
      008E7F A1 30            [ 1]  422 	cp a,#'0
      008E81 25 03            [ 1]  423 	jrc 1$
      008E83 A1 3A            [ 1]  424     cp a,#'9+1
      008E85 8C               [ 1]  425 	ccf 
      008E86 8C               [ 1]  426 1$:	ccf 
      008E87 81               [ 4]  427     ret
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
      008E88                        438 is_alnum::
      008E88 CD 8E 7F         [ 4]  439 	call is_digit
      008E8B 25 03            [ 1]  440 	jrc 1$ 
      008E8D CD 8E 6E         [ 4]  441 	call is_alpha
      008E90 81               [ 4]  442 1$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008E91                        453 is_symbol_char: 
      008E91 A1 5F            [ 1]  454 	cp a,#'_ 
      008E93 26 03            [ 1]  455 	jrne 1$
      008E95 99               [ 1]  456 	scf 
      008E96 20 03            [ 2]  457 	jra 9$ 
      008E98 CD 8E 88         [ 4]  458 1$:	call is_alnum 
      008E9B 81               [ 4]  459 9$: ret 
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
      008E9C                        473 parse_symbol:
      008E9C 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008E9D                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008E9D CD 98 FA         [ 4]  477 	call to_upper  
      008EA0 F7               [ 1]  478 	ld (x), a 
      008EA1 5C               [ 1]  479 	incw x
      008EA2 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008EA5 72 5C 00 02      [ 1]  481 	inc in 
      008EA9 CD 8E 91         [ 4]  482 	call is_symbol_char 
      008EAC 25 EF            [ 1]  483 	jrc symb_loop 
      008EAE 7F               [ 1]  484 	clr (x)
      008EAF 72 5A 00 02      [ 1]  485 	dec in  
      008EB3 81               [ 4]  486 	ret 
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
      008EB4                        502 parse_keyword: 
      008EB4 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EB5 CD 8E 9C         [ 4]  504 	call parse_symbol
      008EB8 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008EBA E6 02            [ 1]  506 	ld a,(2,x)
      008EBC 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008EBE E6 01            [ 1]  509 	ld a,(1,x) 
      008EC0 A0 41            [ 1]  510 	sub a,#'A 
      008EC2 AE 00 03         [ 2]  511 	ldw x,#3 
      008EC5 42               [ 4]  512 	mul x,a 
      008EC6 1C 00 35         [ 2]  513 	addw x,#vars 
      008EC9 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008ECB 20 36            [ 2]  515 	jra 4$ 
      008ECD                        516 2$: ; check for keyword, otherwise syntax error.
      000E4D                        517 	_ldx_dict kword_dict ; dictionary entry point
      008ECD AE B4 ED         [ 2]    1     ldw x,#kword_dict+2
      008ED0 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008ED2 90 5C            [ 1]  519 	incw y 
      008ED4 CD 99 87         [ 4]  520 	call search_dict
      008ED7 4D               [ 1]  521 	tnz a
      008ED8 26 29            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008EDA 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008EDC A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008EDE 90 F7            [ 1]  527 	ld (y),a 
      008EE0 90 5C            [ 1]  528 	incw y
      008EE2 93               [ 1]  529 	ldw x,y 
      008EE3 CD 93 D8         [ 4]  530 	call strlen
      008EE6 A1 0F            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008EE8 23 02            [ 2]  532 	jrule 22$ 
      008EEA A6 0F            [ 1]  533 	ld a,#NAME_MAX_LEN 
      008EEC                        534 22$:	
      008EEC 88               [ 1]  535 	push a 
      008EED                        536 24$:
      008EED 90 F6            [ 1]  537     ld a,(y)
      008EEF 27 09            [ 1]  538 	jreq 3$
      008EF1 90 5C            [ 1]  539 	incw y
      008EF3 0A 01            [ 1]  540 	dec (1,sp) 
      008EF5 26 F6            [ 1]  541 	jrne 24$
      008EF7 4F               [ 1]  542 	clr a 
      008EF8 90 F7            [ 1]  543 	ld (y),a 
      008EFA 90 5C            [ 1]  544 3$: incw y 
      000E7C                        545 	_drop 1 
      008EFC 5B 01            [ 2]    1     addw sp,#1 
      008EFE A6 03            [ 1]  546 	ld a,#TK_LABEL 
      008F00 5F               [ 1]  547 	clrw x 
      008F01 20 1B            [ 2]  548 	jra 5$ 
      008F03                        549 4$:	
      008F03 16 01            [ 2]  550 	ldw y,(XFIRST,sp)
      008F05 A1 87            [ 1]  551 	cp a,#TK_NOT 
      008F07 2B 06            [ 1]  552 	jrmi 41$
      008F09 90 F7            [ 1]  553 	ld (y),a 
      008F0B 90 5C            [ 1]  554 	incw y 
      008F0D 20 0F            [ 2]  555 	jra 5$ 
      008F0F                        556 41$:	
      008F0F A3 9D 00         [ 2]  557 	cpw x,#let  
      008F12 27 0A            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008F14 90 F7            [ 1]  559 	ld (y),a 
      008F16 90 5C            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008F18 90 FF            [ 2]  561 	ldw (y),x
      008F1A 72 A9 00 02      [ 2]  562 	addw y,#2  
      000E9E                        563 5$:	_drop VSIZE 
      008F1E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F20 81               [ 4]  564 	ret  	
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
      008F21                        575 skip:
      008F21 88               [ 1]  576 	push a
      008F22 91 D6 01         [ 4]  577 1$:	ld a,([in.w],y)
      008F25 27 0A            [ 1]  578 	jreq 2$
      008F27 11 01            [ 1]  579 	cp a,(C,sp)
      008F29 26 06            [ 1]  580 	jrne 2$
      008F2B 72 5C 00 02      [ 1]  581 	inc in
      008F2F 20 F1            [ 2]  582 	jra 1$
      000EB1                        583 2$: _drop 1 
      008F31 5B 01            [ 2]    1     addw sp,#1 
      008F33 81               [ 4]  584 	ret
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
      008F34                        609 get_token:: 
      000EB4                        610 	_vars VSIZE
      008F34 52 02            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      008F36                        616 0$: 
      008F36 90 AE 16 90      [ 2]  617 	ldw y,#tib    	
      008F3A A6 20            [ 1]  618 	ld a,#SPACE
      008F3C CD 8F 21         [ 4]  619 	call skip
      008F3F 55 00 02 00 03   [ 1]  620 	mov in.saved,in 
      008F44 91 D6 01         [ 4]  621 	ld a,([in.w],y)
      008F47 26 05            [ 1]  622 	jrne 1$
      008F49 90 93            [ 1]  623 	ldw y,x 
      008F4B CC 90 E5         [ 2]  624 	jp token_exit ; end of line 
      008F4E 72 5C 00 02      [ 1]  625 1$:	inc in 
      008F52 CD 98 FA         [ 4]  626 	call to_upper 
      008F55 6B 01            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      008F57                        629 str_tst:  	
      000ED7                        630 	_case '"' nbr_tst
      008F57 A6 22            [ 1]    1 	ld a,#'"' 
      008F59 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F5B 26 0A            [ 1]    3 	jrne nbr_tst
      008F5D A6 02            [ 1]  631 	ld a,#TK_QSTR
      008F5F F7               [ 1]  632 	ld (x),a 
      008F60 5C               [ 1]  633 	incw x 
      008F61 CD 8D 8D         [ 4]  634 	call parse_quote
      008F64 CC 90 E5         [ 2]  635 	jp token_exit
      008F67                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008F67 A6 24            [ 1]  638 	ld a,#'$'
      008F69 11 01            [ 1]  639 	cp a,(TCHAR,sp) 
      008F6B 27 17            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008F6D A6 26            [ 1]  642 	ld a,#'&
      008F6F 11 01            [ 1]  643 	cp a,(TCHAR,sp)
      008F71 26 0A            [ 1]  644 	jrne 0$
      008F73 A6 84            [ 1]  645 	ld a,#TK_INTGR
      008F75 F7               [ 1]  646 	ld (x),a 
      008F76 5C               [ 1]  647 	incw x 
      008F77 CD 8E 33         [ 4]  648 	call parse_binary ; expect binary integer 
      008F7A CC 90 E5         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008F7D 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008F7F CD 8E 7F         [ 4]  652 	call is_digit
      008F82 24 0C            [ 1]  653 	jrnc 3$
      008F84 A6 84            [ 1]  654 1$:	ld a,#TK_INTGR 
      008F86 F7               [ 1]  655 	ld (x),a 
      008F87 5C               [ 1]  656 	incw x 
      008F88 7B 01            [ 1]  657 	ld a,(TCHAR,sp)
      008F8A CD 8D E2         [ 4]  658 	call parse_integer 
      008F8D CC 90 E5         [ 2]  659 	jp token_exit 
      008F90                        660 3$: 
      000F10                        661 	_case '(' bkslsh_tst 
      008F90 A6 28            [ 1]    1 	ld a,#'(' 
      008F92 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F94 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008F96 A6 06            [ 1]  662 	ld a,#TK_LPAREN
      008F98 CC 90 E1         [ 2]  663 	jp token_char   	
      008F9B                        664 bkslsh_tst: ; character token 
      000F1B                        665 	_case '\',rparnt_tst
      008F9B A6 5C            [ 1]    1 	ld a,#'\' 
      008F9D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F9F 26 16            [ 1]    3 	jrne rparnt_tst
      008FA1 A6 04            [ 1]  666 	ld a,#TK_CHAR 
      008FA3 F7               [ 1]  667 	ld (x),a 
      008FA4 5C               [ 1]  668 	incw x 
      008FA5 91 D6 01         [ 4]  669 	ld a,([in.w],y)
      008FA8 F7               [ 1]  670 	ld (x),a 
      008FA9 5C               [ 1]  671 	incw x
      008FAA 90 93            [ 1]  672 	ldw y,x 	 
      008FAC 72 5C 00 02      [ 1]  673 	inc in  
      008FB0 5F               [ 1]  674 	clrw x 
      008FB1 97               [ 1]  675 	ld xl,a 
      008FB2 A6 04            [ 1]  676 	ld a,#TK_CHAR 
      008FB4 CC 90 E5         [ 2]  677 	jp token_exit 
      008FB7                        678 rparnt_tst:		
      000F37                        679 	_case ')' colon_tst 
      008FB7 A6 29            [ 1]    1 	ld a,#')' 
      008FB9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FBB 26 05            [ 1]    3 	jrne colon_tst
      008FBD A6 07            [ 1]  680 	ld a,#TK_RPAREN 
      008FBF CC 90 E1         [ 2]  681 	jp token_char
      008FC2                        682 colon_tst:
      000F42                        683 	_case ':' comma_tst 
      008FC2 A6 3A            [ 1]    1 	ld a,#':' 
      008FC4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FC6 26 05            [ 1]    3 	jrne comma_tst
      008FC8 A6 0A            [ 1]  684 	ld a,#TK_COLON 
      008FCA CC 90 E1         [ 2]  685 	jp token_char  
      008FCD                        686 comma_tst:
      000F4D                        687 	_case COMMA sharp_tst 
      008FCD A6 2C            [ 1]    1 	ld a,#COMMA 
      008FCF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FD1 26 05            [ 1]    3 	jrne sharp_tst
      008FD3 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008FD5 CC 90 E1         [ 2]  689 	jp token_char
      008FD8                        690 sharp_tst:
      000F58                        691 	_case SHARP dash_tst 
      008FD8 A6 23            [ 1]    1 	ld a,#SHARP 
      008FDA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FDC 26 05            [ 1]    3 	jrne dash_tst
      008FDE A6 09            [ 1]  692 	ld a,#TK_SHARP
      008FE0 CC 90 E1         [ 2]  693 	jp token_char  	 	 
      008FE3                        694 dash_tst: 	
      000F63                        695 	_case '-' at_tst 
      008FE3 A6 2D            [ 1]    1 	ld a,#'-' 
      008FE5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE7 26 05            [ 1]    3 	jrne at_tst
      008FE9 A6 11            [ 1]  696 	ld a,#TK_MINUS  
      008FEB CC 90 E1         [ 2]  697 	jp token_char 
      008FEE                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      000F6E                        699 	_case '@' qmark_tst 
      008FEE A6 40            [ 1]    1 	ld a,#'@' 
      008FF0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FF2 26 05            [ 1]    3 	jrne qmark_tst
      008FF4 A6 05            [ 1]  700 	ld a,#TK_ARRAY 
      008FF6 CC 90 E1         [ 2]  701 	jp token_char
      008FF9                        702 qmark_tst:
      000F79                        703 	_case '?' tick_tst 
      008FF9 A6 3F            [ 1]    1 	ld a,#'?' 
      008FFB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FFD 26 12            [ 1]    3 	jrne tick_tst
      008FFF A6 80            [ 1]  704 	ld a,#TK_CMD  
      009001 F7               [ 1]  705 	ld (x),a 
      009002 5C               [ 1]  706 	incw x 
      009003 90 93            [ 1]  707 	ldw y,x 
      009005 AE 9F F3         [ 2]  708 	ldw x,#print
      009008 90 FF            [ 2]  709 	ldw (y),x 
      00900A 72 A9 00 02      [ 2]  710 	addw y,#2
      00900E CC 90 E5         [ 2]  711 	jp token_exit
      009011                        712 tick_tst: ; comment 
      000F91                        713 	_case TICK plus_tst 
      009011 A6 27            [ 1]    1 	ld a,#TICK 
      009013 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009015 26 2B            [ 1]    3 	jrne plus_tst
      009017 A6 80            [ 1]  714 	ld a,#TK_CMD
      009019 F7               [ 1]  715 	ld (x),a 
      00901A 5C               [ 1]  716 	incw x
      00901B 90 AE A1 3B      [ 2]  717 	ldw y,#remark 
      00901F FF               [ 2]  718 	ldw (x),y 
      009020 1C 00 02         [ 2]  719 	addw x,#2  
      009023                        720 copy_comment:
      009023 90 AE 16 90      [ 2]  721 	ldw y,#tib 
      009027 72 B9 00 01      [ 2]  722 	addw y,in.w
      00902B 90 89            [ 2]  723 	pushw y 
      00902D CD 93 F4         [ 4]  724 	call strcpy
      009030 72 F2 01         [ 2]  725 	subw y,(1,sp)
      009033 90 5C            [ 1]  726 	incw y ; strlen+1 
      009035 17 01            [ 2]  727 	ldw (1,sp),y 
      009037 72 FB 01         [ 2]  728 	addw x,(1,sp) 
      000FBA                        729 	_drop 2 
      00903A 5B 02            [ 2]    1     addw sp,#2 
      00903C 4F               [ 1]  730 	clr a 
      00903D 90 93            [ 1]  731 	ldw y,x 
      00903F CC 90 E5         [ 2]  732 	jp token_exit 
      009042                        733 plus_tst:
      000FC2                        734 	_case '+' star_tst 
      009042 A6 2B            [ 1]    1 	ld a,#'+' 
      009044 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009046 26 05            [ 1]    3 	jrne star_tst
      009048 A6 10            [ 1]  735 	ld a,#TK_PLUS  
      00904A CC 90 E1         [ 2]  736 	jp token_char 
      00904D                        737 star_tst:
      000FCD                        738 	_case '*' slash_tst 
      00904D A6 2A            [ 1]    1 	ld a,#'*' 
      00904F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009051 26 05            [ 1]    3 	jrne slash_tst
      009053 A6 20            [ 1]  739 	ld a,#TK_MULT 
      009055 CC 90 E1         [ 2]  740 	jp token_char 
      009058                        741 slash_tst: 
      000FD8                        742 	_case '/' prcnt_tst 
      009058 A6 2F            [ 1]    1 	ld a,#'/' 
      00905A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00905C 26 05            [ 1]    3 	jrne prcnt_tst
      00905E A6 21            [ 1]  743 	ld a,#TK_DIV 
      009060 CC 90 E1         [ 2]  744 	jp token_char 
      009063                        745 prcnt_tst:
      000FE3                        746 	_case '%' eql_tst 
      009063 A6 25            [ 1]    1 	ld a,#'%' 
      009065 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009067 26 05            [ 1]    3 	jrne eql_tst
      009069 A6 22            [ 1]  747 	ld a,#TK_MOD
      00906B CC 90 E1         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      00906E                        750 eql_tst:
      000FEE                        751 	_case '=' gt_tst 		
      00906E A6 3D            [ 1]    1 	ld a,#'=' 
      009070 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009072 26 05            [ 1]    3 	jrne gt_tst
      009074 A6 32            [ 1]  752 	ld a,#TK_EQUAL
      009076 CC 90 E1         [ 2]  753 	jp token_char 
      009079                        754 gt_tst:
      000FF9                        755 	_case '>' lt_tst 
      009079 A6 3E            [ 1]    1 	ld a,#'>' 
      00907B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00907D 26 23            [ 1]    3 	jrne lt_tst
      00907F A6 31            [ 1]  756 	ld a,#TK_GT 
      009081 6B 02            [ 1]  757 	ld (ATTRIB,sp),a 
      009083 91 D6 01         [ 4]  758 	ld a,([in.w],y)
      009086 72 5C 00 02      [ 1]  759 	inc in 
      00908A A1 3D            [ 1]  760 	cp a,#'=
      00908C 26 04            [ 1]  761 	jrne 1$
      00908E A6 33            [ 1]  762 	ld a,#TK_GE 
      009090 20 4F            [ 2]  763 	jra token_char  
      009092 A1 3C            [ 1]  764 1$: cp a,#'<
      009094 26 04            [ 1]  765 	jrne 2$
      009096 A6 35            [ 1]  766 	ld a,#TK_NE 
      009098 20 47            [ 2]  767 	jra token_char 
      00909A 72 5A 00 02      [ 1]  768 2$: dec in
      00909E 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      0090A0 20 3F            [ 2]  770 	jra token_char 	 
      0090A2                        771 lt_tst:
      001022                        772 	_case '<' other
      0090A2 A6 3C            [ 1]    1 	ld a,#'<' 
      0090A4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090A6 26 23            [ 1]    3 	jrne other
      0090A8 A6 34            [ 1]  773 	ld a,#TK_LT 
      0090AA 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      0090AC 91 D6 01         [ 4]  775 	ld a,([in.w],y)
      0090AF 72 5C 00 02      [ 1]  776 	inc in 
      0090B3 A1 3D            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      0090B5 26 04            [ 1]  778 	jrne 1$
      0090B7 A6 36            [ 1]  779 	ld a,#TK_LE 
      0090B9 20 26            [ 2]  780 	jra token_char 
      0090BB A1 3E            [ 1]  781 1$: cp a,#'>
      0090BD 26 04            [ 1]  782 	jrne 2$
      0090BF A6 35            [ 1]  783 	ld a,#TK_NE 
      0090C1 20 1E            [ 2]  784 	jra token_char 
      0090C3 72 5A 00 02      [ 1]  785 2$: dec in 
      0090C7 7B 02            [ 1]  786 	ld a,(ATTRIB,sp)
      0090C9 20 16            [ 2]  787 	jra token_char 	
      0090CB                        788 other: ; not a special character 	 
      0090CB 7B 01            [ 1]  789 	ld a,(TCHAR,sp)
      0090CD CD 8E 6E         [ 4]  790 	call is_alpha 
      0090D0 25 03            [ 1]  791 	jrc 30$ 
      0090D2 CC 96 B8         [ 2]  792 	jp syntax_error 
      0090D5                        793 30$: 
      0090D5 CD 8E B4         [ 4]  794 	call parse_keyword
      0090D8 A3 A1 3B         [ 2]  795 	cpw x,#remark 
      0090DB 26 08            [ 1]  796 	jrne token_exit 
      0090DD 93               [ 1]  797 	ldw x,y 
      0090DE CC 90 23         [ 2]  798 	jp copy_comment 
      0090E1                        799 token_char:
      0090E1 F7               [ 1]  800 	ld (x),a 
      0090E2 5C               [ 1]  801 	incw x
      0090E3 90 93            [ 1]  802 	ldw y,x 
      0090E5                        803 token_exit:
      001065                        804 	_drop VSIZE 
      0090E5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090E7 81               [ 4]  805 	ret
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
      0090E8                        825 compile::
      0090E8 90 89            [ 2]  826 	pushw y 
      00106A                        827 	_vars VSIZE 
      0090EA 52 02            [ 2]    1     sub sp,#VSIZE 
      0090EC 55 00 1C 00 05   [ 1]  828 	mov basicptr,txtbgn
      0090F1 72 1A 00 23      [ 1]  829 	bset flags,#FCOMP 
      0090F5 A6 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      0090F7 AE 00 00         [ 2]  831 	ldw x,#0
      0090FA CF 16 E0         [ 2]  832 	ldw pad,x ; destination buffer 
      0090FD C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      009100 AE 16 E3         [ 2]  834 	ldw x,#pad+3
      009103 72 5F 00 02      [ 1]  835 	clr in 
      009107 CD 8F 34         [ 4]  836 	call get_token
      00910A A1 84            [ 1]  837 	cp a,#TK_INTGR
      00910C 26 11            [ 1]  838 	jrne 2$
      00910E A3 00 01         [ 2]  839 	cpw x,#1 
      009111 2A 05            [ 1]  840 	jrpl 1$
      009113 A6 0A            [ 1]  841 	ld a,#ERR_BAD_VALUE
      009115 CC 96 BA         [ 2]  842 	jp tb_error
      009118 CF 16 E0         [ 2]  843 1$:	ldw pad,x 
      00911B 90 AE 16 E3      [ 2]  844 	ldw y,#pad+3 
      00911F 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      009123 25 05            [ 1]  846 	jrult 3$
      009125 A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      009127 CC 96 BA         [ 2]  848 	jp tb_error 
      00912A                        849 3$:	
      00912A 93               [ 1]  850 	ldw x,y 
      00912B CD 8F 34         [ 4]  851 	call get_token 
      00912E A1 00            [ 1]  852 	cp a,#TK_NONE 
      009130 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      009132 72 A2 16 E0      [ 2]  855 	subw y,#pad
      009136 90 9F            [ 1]  856     ld a,yl
      009138 AE 16 E0         [ 2]  857 	ldw x,#pad 
      00913B CF 00 1A         [ 2]  858 	ldw ptr16,x 
      00913E E7 02            [ 1]  859 	ld (2,x),a 
      009140 FE               [ 2]  860 	ldw x,(x)
      009141 27 09            [ 1]  861 	jreq 10$
      009143 CD 8D 1B         [ 4]  862 	call insert_line
      009146 72 5F 00 04      [ 1]  863 	clr  count 
      00914A 20 0F            [ 2]  864 	jra  11$ 
      00914C                        865 10$: ; line# is zero 
      00914C CE 00 1A         [ 2]  866 	ldw x,ptr16  
      00914F CF 00 05         [ 2]  867 	ldw basicptr,x 
      009152 E6 02            [ 1]  868 	ld a,(2,x)
      009154 C7 00 04         [ 1]  869 	ld count,a 
      009157 35 03 00 02      [ 1]  870 	mov in,#3 
      00915B                        871 11$:
      0010DB                        872 	_drop VSIZE 
      00915B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00915D 72 1B 00 23      [ 1]  873 	bres flags,#FCOMP 
      009161 90 85            [ 2]  874 	popw y 
      009163 81               [ 4]  875 	ret 
                                    876 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
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
      009164                         48 cpy_cmd_name:
      009164 5D               [ 2]   49 	tnzw x 
      009165 27 14            [ 1]   50 	jreq 10$
      009167 F6               [ 1]   51 	ld a,(x)
      009168 5C               [ 1]   52 	incw x
      009169 A4 0F            [ 1]   53 	and a,#15  
      00916B 88               [ 1]   54 	push a 
      00916C 0D 01            [ 1]   55     tnz (1,sp) 
      00916E 27 0A            [ 1]   56 	jreq 9$
      009170 F6               [ 1]   57 1$:	ld a,(x)
      009171 90 F7            [ 1]   58 	ld (y),a  
      009173 5C               [ 1]   59 	incw x
      009174 90 5C            [ 1]   60 	incw y 
      009176 0A 01            [ 1]   61 	dec (1,sp)	 
      009178 26 F6            [ 1]   62 	jrne 1$
      00917A 84               [ 1]   63 9$: pop a 
      00917B                         64 10$: 
      00917B 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00917C                         75 add_space:
      00917C 90 5A            [ 2]   76 	decw y 
      00917E 90 F6            [ 1]   77 	ld a,(y)
      009180 90 5C            [ 1]   78 	incw y
      009182 A1 29            [ 1]   79 	cp a,#') 
      009184 27 05            [ 1]   80 	jreq 0$
      009186 CD 8E 88         [ 4]   81 	call is_alnum 
      009189 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00918B                         83 0$: 
      00918B A6 20            [ 1]   84 	ld a,#SPACE 
      00918D 90 F7            [ 1]   85 	ld (y),a 
      00918F 90 5C            [ 1]   86 	incw y 
      009191 81               [ 4]   87 1$: ret 
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
      009192                         99 right_align::
      009192 88               [ 1]  100 	push a 
      009193 7B 01            [ 1]  101 0$: ld a,(1,sp)
      009195 C1 00 24         [ 1]  102 	cp a,tab_width 
      009198 2A 08            [ 1]  103 	jrpl 1$
      00919A A6 20            [ 1]  104 	ld a,#SPACE 
      00919C 5A               [ 2]  105 	decw x
      00919D F7               [ 1]  106 	ld (x),a  
      00919E 0C 01            [ 1]  107 	inc (1,sp)
      0091A0 20 F1            [ 2]  108 	jra 0$ 
      0091A2 84               [ 1]  109 1$: pop a 	
      0091A3 81               [ 4]  110 	ret 
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
      0091A4                        123 cpy_quote:
      0091A4 A6 22            [ 1]  124 	ld a,#'"
      0091A6 90 F7            [ 1]  125 	ld (y),a 
      0091A8 90 5C            [ 1]  126 	incw y 
      0091AA 89               [ 2]  127 	pushw x 
      0091AB CD 98 35         [ 4]  128 	call skip_string 
      0091AE 85               [ 2]  129 	popw x 
      0091AF F6               [ 1]  130 1$:	ld a,(x)
      0091B0 27 30            [ 1]  131 	jreq 9$
      0091B2 5C               [ 1]  132 	incw x 
      0091B3 A1 20            [ 1]  133 	cp a,#SPACE 
      0091B5 25 0E            [ 1]  134 	jrult 3$
      0091B7 90 F7            [ 1]  135 	ld (y),a
      0091B9 90 5C            [ 1]  136 	incw y 
      0091BB A1 5C            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      0091BD 26 F0            [ 1]  138 	jrne 1$ 
      0091BF                        139 2$:
      0091BF 90 F7            [ 1]  140 	ld (y),a
      0091C1 90 5C            [ 1]  141 	incw y  
      0091C3 20 EA            [ 2]  142 	jra 1$
      0091C5 88               [ 1]  143 3$: push a 
      0091C6 A6 5C            [ 1]  144 	ld a,#'\
      0091C8 90 F7            [ 1]  145 	ld (y),a 
      0091CA 90 5C            [ 1]  146 	incw y  
      0091CC 84               [ 1]  147 	pop a 
      0091CD A0 07            [ 1]  148 	sub a,#7
      0091CF C7 00 0F         [ 1]  149 	ld acc8,a 
      0091D2 72 5F 00 0E      [ 1]  150 	clr acc16
      0091D6 89               [ 2]  151 	pushw x
      0091D7 AE 8D DA         [ 2]  152 	ldw x,#escaped 
      0091DA 72 BB 00 0E      [ 2]  153 	addw x,acc16 
      0091DE F6               [ 1]  154 	ld a,(x)
      0091DF 85               [ 2]  155 	popw x
      0091E0 20 DD            [ 2]  156 	jra 2$
      0091E2 A6 22            [ 1]  157 9$: ld a,#'"
      0091E4 90 F7            [ 1]  158 	ld (y),a 
      0091E6 90 5C            [ 1]  159 	incw y  
      0091E8 5C               [ 1]  160 	incw x 
      0091E9 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0091EA                        171 var_name::
      0091EA 1D 00 35         [ 2]  172 		subw x,#vars 
      0091ED A6 03            [ 1]  173 		ld a,#3
      0091EF 62               [ 2]  174 		div x,a 
      0091F0 9F               [ 1]  175 		ld a,xl 
      0091F1 AB 41            [ 1]  176 		add a,#'A 
      0091F3 81               [ 4]  177 		ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                           000003   193 	STR=3
                           000004   194 	VSIZE=4 
      0091F4                        195 decompile::
      001174                        196 	_vars VSIZE
      0091F4 52 04            [ 2]    1     sub sp,#VSIZE 
      0091F6 C6 00 0B         [ 1]  197 	ld a,base
      0091F9 6B 01            [ 1]  198 	ld (BASE_SAV,sp),a  
      0091FB C6 00 24         [ 1]  199 	ld a,tab_width 
      0091FE 6B 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      009200 17 03            [ 2]  201 	ldw (STR,sp),y   
      009202 72 CE 00 05      [ 5]  202 	ldw x,[basicptr] ; line number 
      009206 35 0A 00 0B      [ 1]  203 	mov base,#10
      00920A 35 05 00 24      [ 1]  204 	mov tab_width,#5
      00920E 72 5F 00 0D      [ 1]  205 	clr acc24 
      009212 CF 00 0E         [ 2]  206 	ldw acc16,x
      009215 4F               [ 1]  207 	clr a ; unsigned conversion 
      009216 CD 98 A1         [ 4]  208 	call itoa  
      009219 CD 91 92         [ 4]  209 	call right_align 
      00921C 88               [ 1]  210 	push a 
      00921D 90 93            [ 1]  211 1$:	ldw y,x ; source
      00921F 1E 04            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      009221 CD 93 F4         [ 4]  213 	call strcpy 
      009224 90 5F            [ 1]  214 	clrw y 
      009226 84               [ 1]  215 	pop a 
      009227 90 97            [ 1]  216 	ld yl,a 
      009229 72 F9 03         [ 2]  217 	addw y,(STR,sp)
      00922C A6 20            [ 1]  218 	ld a,#SPACE 
      00922E 90 F7            [ 1]  219 	ld (y),a 
      009230 90 5C            [ 1]  220 	incw y 
      009232 72 5F 00 24      [ 1]  221 	clr tab_width
      009236 AE 00 03         [ 2]  222 	ldw x,#3
      009239 CF 00 01         [ 2]  223 	ldw in.w,x 
      00923C                        224 decomp_loop:
      00923C 90 89            [ 2]  225 	pushw y
      00923E CD 98 1C         [ 4]  226 	call next_token 
      009241 90 85            [ 2]  227 	popw y 
      009243 4D               [ 1]  228 	tnz a  
      009244 26 03            [ 1]  229 	jrne 1$
      009246 CC 93 69         [ 2]  230 	jp 20$
      009249 2B 03            [ 1]  231 1$:	jrmi 2$
      00924B CC 92 DA         [ 2]  232 	jp 6$
      00924E                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00924E A1 85            [ 1]  234 	cp a,#TK_VAR 
      009250 26 0F            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009252 CD 91 7C         [ 4]  237 	call add_space
      009255 CD 98 44         [ 4]  238 	call get_addr   
      009258 CD 91 EA         [ 4]  239 	call var_name
      00925B 90 F7            [ 1]  240 	ld (y),a 
      00925D 90 5C            [ 1]  241 	incw y  
      00925F 20 DB            [ 2]  242 	jra decomp_loop
      009261                        243 3$:
      009261 A1 84            [ 1]  244 	cp a,#TK_INTGR
      009263 26 26            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009265 CD 98 4E         [ 4]  247 	call get_int24 
      009268 C7 00 0D         [ 1]  248 	ld acc24,a 
      00926B CF 00 0E         [ 2]  249 	ldw acc16,x 
      00926E CD 91 7C         [ 4]  250 	call add_space
      009271 90 89            [ 2]  251 	pushw y 
      009273 A6 FF            [ 1]  252 	ld a,#255 ; signed conversion 
      009275 CD 98 A1         [ 4]  253 	call itoa  
      009278 16 01            [ 2]  254 	ldw y,(1,sp) 
      00927A 88               [ 1]  255 	push a 
      00927B 51               [ 1]  256 	exgw x,y 
      00927C CD 93 F4         [ 4]  257 	call strcpy 
      00927F 90 5F            [ 1]  258 	clrw y
      009281 84               [ 1]  259 	pop a  
      009282 90 97            [ 1]  260 	ld yl,a 
      009284 72 F9 01         [ 2]  261 	addw y,(1,sp)
      001207                        262 	_drop 2 
      009287 5B 02            [ 2]    1     addw sp,#2 
      009289 20 B1            [ 2]  263 	jra decomp_loop
      00928B                        264 4$: ; dictionary keyword
      00928B A1 87            [ 1]  265 	cp a,#TK_NOT 
      00928D 24 39            [ 1]  266 	jruge 50$ 
      00928F FE               [ 2]  267 	ldw x,(x)
      009290 72 5C 00 02      [ 1]  268 	inc in 
      009294 72 5C 00 02      [ 1]  269 	inc in 
      009298 A3 A1 3B         [ 2]  270 	cpw x,#remark 
      00929B 26 23            [ 1]  271 	jrne 5$
      00929D CE 00 05         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      0092A0 CD 91 7C         [ 4]  274 	call add_space
      0092A3 A6 27            [ 1]  275 	ld a,#''
      0092A5 90 F7            [ 1]  276 	ld (y),a 
      0092A7 90 5C            [ 1]  277 	incw y 
      0092A9                        278 46$:
      0092A9 72 D6 00 01      [ 4]  279 	ld a,([in.w],x)
      0092AD 72 5C 00 02      [ 1]  280 	inc in  
      0092B1 90 F7            [ 1]  281 	ld (y),a 
      0092B3 90 5C            [ 1]  282 	incw y 
      0092B5 C6 00 02         [ 1]  283 	ld a,in 
      0092B8 C1 00 04         [ 1]  284 	cp a,count 
      0092BB 2B EC            [ 1]  285 	jrmi 46$
      0092BD CC 93 69         [ 2]  286 	jp 20$  
      0092C0 A3 9D 00         [ 2]  287 5$: cpw x,#let  
      0092C3 26 05            [ 1]  288 	jrne 54$
      0092C5 CC 92 3C         [ 2]  289 	jp decomp_loop ; down display LET
      0092C8                        290 50$:
      0092C8 5F               [ 1]  291 	clrw x 
      0092C9 97               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      0092CA                        297 54$: ; insert command name 
      0092CA CD 91 7C         [ 4]  298 	call add_space  
      0092CD 90 89            [ 2]  299 	pushw y
      0092CF CD 93 A4         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0092D2 90 85            [ 2]  301 	popw y 
      0092D4 CD 91 64         [ 4]  302 	call cpy_cmd_name
      0092D7 CC 92 3C         [ 2]  303 	jp decomp_loop 
      0092DA                        304 6$:
                                    305 ; label?
      0092DA A1 03            [ 1]  306 	cp a,#TK_LABEL 
      0092DC 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0092DE A6 20            [ 1]  309 	ld a,#32 
      0092E0 90 F7            [ 1]  310 	ld (y),a 
      0092E2 90 5C            [ 1]  311 	incw y 
      0092E4                        312 61$:
      0092E4 89               [ 2]  313 	pushw x 
      0092E5 CD 98 35         [ 4]  314 	call skip_string 
      0092E8 85               [ 2]  315 	popw x 
      0092E9                        316 62$:	
      0092E9 F6               [ 1]  317 	ld a,(x)
      0092EA 27 07            [ 1]  318 	jreq 63$ 
      0092EC 5C               [ 1]  319 	incw x  
      0092ED 90 F7            [ 1]  320 	ld (y),a 
      0092EF 90 5C            [ 1]  321 	incw y 
      0092F1 20 F6            [ 2]  322 	jra 62$ 
      0092F3                        323 63$: 
      0092F3 A6 20            [ 1]  324 	ld a,#32 
      0092F5 90 F7            [ 1]  325 	ld (y),a 
      0092F7 90 5C            [ 1]  326 	incw y 
      0092F9 CC 92 3C         [ 2]  327 	jp decomp_loop
      0092FC                        328 64$:
      0092FC A1 02            [ 1]  329 	cp a,#TK_QSTR 
      0092FE 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      009300 CD 91 7C         [ 4]  332 	call add_space
      009303 CD 91 A4         [ 4]  333 	call cpy_quote  
      009306 CC 92 3C         [ 2]  334 	jp decomp_loop
      009309                        335 7$:
      009309 A1 04            [ 1]  336 	cp a,#TK_CHAR 
      00930B 26 10            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      00930D CD 91 7C         [ 4]  339 	call add_space 
      009310 A6 5C            [ 1]  340 	ld a,#'\ 
      009312 90 F7            [ 1]  341 	ld (y),a 
      009314 90 5C            [ 1]  342 	incw y
      009316 F6               [ 1]  343 	ld a,(x)
      009317 72 5C 00 02      [ 1]  344 	inc in  
      00931B 20 06            [ 2]  345 	jra 81$
      00931D A1 0A            [ 1]  346 8$: cp a,#TK_COLON 
      00931F 26 09            [ 1]  347 	jrne 9$
      009321 A6 3A            [ 1]  348 	ld a,#':
      009323                        349 81$:
      009323 90 F7            [ 1]  350 	ld (y),a 
      009325 90 5C            [ 1]  351 	incw y 
      009327                        352 82$:
      009327 CC 92 3C         [ 2]  353 	jp decomp_loop
      00932A                        354 9$: 
      00932A A1 09            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00932C 22 0A            [ 1]  356 	jrugt 10$ 
      00932E A0 05            [ 1]  357 	sub a,#TK_ARRAY 
      009330 5F               [ 1]  358 	clrw x 
      009331 97               [ 1]  359 	ld xl,a
      009332 1C 93 7F         [ 2]  360 	addw x,#single_char 
      009335 F6               [ 1]  361 	ld a,(x)
      009336 20 EB            [ 2]  362 	jra 81$ 
      009338                        363 10$: 
      009338 A1 11            [ 1]  364 	cp a,#TK_MINUS 
      00933A 22 0A            [ 1]  365 	jrugt 11$
      00933C A0 10            [ 1]  366 	sub a,#TK_PLUS 
      00933E 5F               [ 1]  367 	clrw x 
      00933F 97               [ 1]  368 	ld xl,a 
      009340 1C 93 84         [ 2]  369 	addw x,#add_char 
      009343 F6               [ 1]  370 	ld a,(x)
      009344 20 DD            [ 2]  371 	jra 81$
      009346                        372 11$:
      009346 A1 22            [ 1]  373     cp a,#TK_MOD 
      009348 22 0A            [ 1]  374 	jrugt 12$
      00934A A0 20            [ 1]  375 	sub a,#TK_MULT
      00934C 5F               [ 1]  376 	clrw x 
      00934D 97               [ 1]  377 	ld xl,a 
      00934E 1C 93 86         [ 2]  378 	addw x,#mul_char
      009351 F6               [ 1]  379 	ld a,(x)
      009352 20 CF            [ 2]  380 	jra 81$
      009354                        381 12$:
      009354 A0 31            [ 1]  382 	sub a,#TK_GT  
      009356 48               [ 1]  383 	sll a 
      009357 5F               [ 1]  384 	clrw x 
      009358 97               [ 1]  385 	ld xl,a 
      009359 1C 93 89         [ 2]  386 	addw x,#relop_str 
      00935C FE               [ 2]  387 	ldw x,(x)
      00935D F6               [ 1]  388 	ld a,(x)
      00935E 5C               [ 1]  389 	incw x 
      00935F 90 F7            [ 1]  390 	ld (y),a
      009361 90 5C            [ 1]  391 	incw y 
      009363 F6               [ 1]  392 	ld a,(x)
      009364 26 BD            [ 1]  393 	jrne 81$
      009366 CC 92 3C         [ 2]  394 	jp decomp_loop 
      009369                        395 20$: 
      009369 90 7F            [ 1]  396 	clr (y)
      00936B 1E 03            [ 2]  397 	ldw x,(STR,sp)
      00936D 7B 01            [ 1]  398 	ld a,(BASE_SAV,sp)
      00936F C7 00 0B         [ 1]  399 	ld base,a 
      009372 7B 02            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      009374 C7 00 24         [ 1]  401 	ld tab_width,a
      009377 72 F2 03         [ 2]  402 	subw y,(STR,sp) 
      00937A 90 9F            [ 1]  403 	ld a,yl 
      0012FC                        404 	_drop VSIZE 
      00937C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00937E 81               [ 4]  405 	ret 
                                    406 
      00937F 40 28 29 2C 23         407 single_char: .byte '@','(',')',',','#'
      009384 2B 2D                  408 add_char: .byte '+','-'
      009386 2A 2F 25               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009389 93 95 93 97 93 99 93   410 relop_str: .word gt,equal,ge,lt,ne,le 
             9C 93 A1 93 9E
      009395 3E 00                  411 gt: .asciz ">"
      009397 3D 00                  412 equal: .asciz "="
      009399 3E 3D 00               413 ge: .asciz ">="
      00939C 3C 00                  414 lt: .asciz "<"
      00939E 3C 3D 00               415 le: .asciz "<="
      0093A1 3C 3E 00               416 ne:  .asciz "<>"
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
      0093A4                        429 cmd_name:
      001324                        430 	_vars VSIZE 
      0093A4 52 04            [ 2]    1     sub sp,#VSIZE 
      0093A6 72 5F 00 0E      [ 1]  431 	clr acc16 
      0093AA 1F 01            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      0093AC AE B4 EB         [ 2]  433 	ldw x,#kword_dict	
      0093AF 1F 03            [ 2]  434 1$:	ldw (LINK,sp),x
      0093B1 E6 02            [ 1]  435 	ld a,(2,x)
      0093B3 A4 0F            [ 1]  436 	and a,#15 
      0093B5 C7 00 0F         [ 1]  437 	ld acc8,a 
      0093B8 1C 00 03         [ 2]  438 	addw x,#3
      0093BB 72 BB 00 0E      [ 2]  439 	addw x,acc16
      0093BF FE               [ 2]  440 	ldw x,(x) ; code address   
      0093C0 13 01            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      0093C2 27 0C            [ 1]  442 	jreq 2$
      0093C4 1E 03            [ 2]  443 	ldw x,(LINK,sp)
      0093C6 FE               [ 2]  444 	ldw x,(x) 
      0093C7 1D 00 02         [ 2]  445 	subw x,#2  
      0093CA 26 E3            [ 1]  446 	jrne 1$
      0093CC 4F               [ 1]  447 	clr a 
      0093CD 5F               [ 1]  448 	clrw x 
      0093CE 20 05            [ 2]  449 	jra 9$
      0093D0 1E 03            [ 2]  450 2$: ldw x,(LINK,sp)
      0093D2 1C 00 02         [ 2]  451 	addw x,#2 	
      001355                        452 9$:	_drop VSIZE
      0093D5 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093D7 81               [ 4]  453 	ret
                                    454 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
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
      000010                         77 ticks: .blkb 3 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000013                         78 timer:: .blkw 1 ;  milliseconds count down timer 
      000015                         79 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000017                         80 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000019                         81 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      00001A                         82 ptr16::  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001B                         83 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001C                         84 txtbgn:: .blkw 1 ; tokenized BASIC text beginning address 
      00001E                         85 txtend:: .blkw 1 ; tokenized BASIC text end address 
      000020                         86 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000021                         87 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000023                         88 flags:: .blkb 1 ; various boolean flags
      000024                         89 tab_width:: .blkb 1 ; print colon width (default 6)
      000025                         90 free_eeprom: .blkw 1 ; start address of free eeprom 
      000027                         91 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002F                         92 rx1_head:  .blkb 1 ; rx1_queue head pointer
      000030                         93 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      000031                         94 dvar_bgn:: .blkw 1 ; DIM variables start address 
      000033                         95 dvar_end:: .blkw 1 ; DIM variables end address 
                                     96 ; 24 bits integer variables 
      000035                         97 vars:: .blkb 3*26 ; BASIC variables A-Z,
                                     98 
                                     99 	.area BTXT (ABS)
      00008C                        100 	.org 0x8C  
                                    101 ; keep 'free_ram' as last variable 
                                    102 ; basic code compiled here. 
      00008C                        103 rsign: .blkw 1 ; "TB" 
      00008E                        104 rsize: .blkw 1 ; code size 	 
      000090                        105 free_ram: ; from here RAM free for BASIC text 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
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
      0093D8                        118 strlen::
      0093D8 89               [ 2]  119 	pushw x 
      0093D9 4F               [ 1]  120 	clr a
      0093DA 7D               [ 1]  121 1$:	tnz (x) 
      0093DB 27 04            [ 1]  122 	jreq 9$ 
      0093DD 4C               [ 1]  123 	inc a 
      0093DE 5C               [ 1]  124 	incw x 
      0093DF 20 F9            [ 2]  125 	jra 1$ 
      0093E1 85               [ 2]  126 9$:	popw x 
      0093E2 81               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      0093E3                        137 strcmp:
      0093E3 F6               [ 1]  138 	ld a,(x)
      0093E4 27 0B            [ 1]  139 	jreq 5$ 
      0093E6 90 F1            [ 1]  140 	cp a,(y) 
      0093E8 26 05            [ 1]  141 	jrne 4$ 
      0093EA 5C               [ 1]  142 	incw x 
      0093EB 90 5C            [ 1]  143 	incw y 
      0093ED 20 F4            [ 2]  144 	jra strcmp 
      0093EF                        145 4$: ; not same  
      0093EF 4F               [ 1]  146 	clr a 
      0093F0 81               [ 4]  147 	ret 
      0093F1                        148 5$: ; same 
      0093F1 A6 01            [ 1]  149 	ld a,#1 
      0093F3 81               [ 4]  150 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0093F4                        161 strcpy::
      0093F4 88               [ 1]  162 	push a 
      0093F5 89               [ 2]  163 	pushw x 
      0093F6 90 F6            [ 1]  164 1$: ld a,(y)
      0093F8 27 06            [ 1]  165 	jreq 9$ 
      0093FA F7               [ 1]  166 	ld (x),a 
      0093FB 5C               [ 1]  167 	incw x 
      0093FC 90 5C            [ 1]  168 	incw y 
      0093FE 20 F6            [ 2]  169 	jra 1$ 
      009400 7F               [ 1]  170 9$:	clr (x)
      009401 85               [ 2]  171 	popw x 
      009402 84               [ 1]  172 	pop a 
      009403 81               [ 4]  173 	ret 
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
      009404                        187 move::
      009404 88               [ 1]  188 	push a 
      001385                        189 	_vars VSIZE 
      009405 52 02            [ 2]    1     sub sp,#VSIZE 
      009407 0F 01            [ 1]  190 	clr (INCR,sp)
      009409 0F 02            [ 1]  191 	clr (LB,sp)
      00940B 90 89            [ 2]  192 	pushw y 
      00940D 13 01            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      00940F 90 85            [ 2]  194 	popw y 
      009411 27 31            [ 1]  195 	jreq move_exit ; x==y 
      009413 2B 0E            [ 1]  196 	jrmi move_down
      009415                        197 move_up: ; start from top address with incr=-1
      009415 72 BB 00 0E      [ 2]  198 	addw x,acc16
      009419 72 B9 00 0E      [ 2]  199 	addw y,acc16
      00941D 03 01            [ 1]  200 	cpl (INCR,sp)
      00941F 03 02            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      009421 20 05            [ 2]  202 	jra move_loop  
      009423                        203 move_down: ; start from bottom address with incr=1 
      009423 5A               [ 2]  204     decw x 
      009424 90 5A            [ 2]  205 	decw y
      009426 0C 02            [ 1]  206 	inc (LB,sp) ; incr=1 
      009428                        207 move_loop:	
      009428 C6 00 0E         [ 1]  208     ld a, acc16 
      00942B CA 00 0F         [ 1]  209 	or a, acc8
      00942E 27 14            [ 1]  210 	jreq move_exit 
      009430 72 FB 01         [ 2]  211 	addw x,(INCR,sp)
      009433 72 F9 01         [ 2]  212 	addw y,(INCR,sp) 
      009436 90 F6            [ 1]  213 	ld a,(y)
      009438 F7               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009439 89               [ 2]  215 	pushw x 
      00943A CE 00 0E         [ 2]  216 	ldw x,acc16 
      00943D 5A               [ 2]  217 	decw x 
      00943E CF 00 0E         [ 2]  218 	ldw acc16,x 
      009441 85               [ 2]  219 	popw x 
      009442 20 E4            [ 2]  220 	jra move_loop
      009444                        221 move_exit:
      0013C4                        222 	_drop VSIZE
      009444 5B 02            [ 2]    1     addw sp,#VSIZE 
      009446 84               [ 1]  223 	pop a 
      009447 81               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      009448                        233 clear_vars:
      009448 89               [ 2]  234 	pushw x 
      009449 88               [ 1]  235 	push a  
      00944A AE 00 35         [ 2]  236 	ldw x,#vars 
      00944D A6 4E            [ 1]  237 	ld a,#CELL_SIZE*26 
      00944F 7F               [ 1]  238 1$:	clr (x)
      009450 5C               [ 1]  239 	incw x 
      009451 4A               [ 1]  240 	dec a 
      009452 26 FB            [ 1]  241 	jrne 1$
      009454 84               [ 1]  242 	pop a 
      009455 85               [ 2]  243 	popw x 
      009456 81               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      009457 0A 0A 54 69 6E 79 20   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      00949D                        255 system_information:
      00949D AE 94 57         [ 2]  256 	ldw x,#software 
      0094A0 CD 89 BA         [ 4]  257 	call puts 
      0094A3 A6 02            [ 1]  258 	ld a,#MAJOR 
      0094A5 C7 00 0F         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0094A8 5F               [ 1]  260 	clrw x 
      0094A9 CF 00 0D         [ 2]  261 	ldw acc24,x
      0094AC 72 5F 00 24      [ 1]  262 	clr tab_width  
      0094B0 35 0A 00 0B      [ 1]  263 	mov base, #10 
      0094B4 CD 98 7B         [ 4]  264 	call prt_acc24 
      0094B7 A6 2E            [ 1]  265 	ld a,#'.
      0094B9 CD 89 5D         [ 4]  266 	call putc 
      0094BC A6 00            [ 1]  267 	ld a,#MINOR 
      0094BE C7 00 0F         [ 1]  268 	ld acc8,a 
      0094C1 5F               [ 1]  269 	clrw x 
      0094C2 CF 00 0D         [ 2]  270 	ldw acc24,x 
      0094C5 CD 98 7B         [ 4]  271 	call prt_acc24
      0094C8 A6 0D            [ 1]  272 	ld a,#CR 
      0094CA CD 89 5D         [ 4]  273 	call putc
                                    274 ;call test 
      0094CD 81               [ 4]  275 	ret
                                    276 
      0094CE                        277 warm_init:
      0094CE 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      0094D2 72 5F 00 23      [ 1]  279 	clr flags 
      0094D6 72 5F 00 20      [ 1]  280 	clr loop_depth 
      0094DA 35 04 00 24      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      0094DE 35 0A 00 0B      [ 1]  282 	mov base,#10 
      0094E2 AE 00 00         [ 2]  283 	ldw x,#0 
      0094E5 CF 00 05         [ 2]  284 	ldw basicptr,x 
      0094E8 CF 00 01         [ 2]  285 	ldw in.w,x 
      0094EB 72 5F 00 04      [ 1]  286 	clr count
      0094EF 81               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      0094F0                        293 clear_basic:
      0094F0 89               [ 2]  294 	pushw x 
      0094F1 72 5F 00 04      [ 1]  295 	clr count
      0094F5 72 5F 00 02      [ 1]  296 	clr in  
      0094F9 AE 00 90         [ 2]  297 	ldw x,#free_ram 
      0094FC CF 00 1C         [ 2]  298 	ldw txtbgn,x 
      0094FF CF 00 1E         [ 2]  299 	ldw txtend,x 
      009502 CF 00 31         [ 2]  300 	ldw dvar_bgn,x 
      009505 CF 00 33         [ 2]  301 	ldw dvar_end,x 
      009508 CD 94 48         [ 4]  302 	call clear_vars 
      00950B 85               [ 2]  303 	popw x
      00950C 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00950D                        309 err_msg:
      00950D 00 00 95 31 95 3E 95   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             4C 95 65 95 74
      009519 95 8A 95 A0 95 BA 95   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CB 95 DC
      009523 95 E8 96 1B 96 2B 96   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal  3F-Bits]



             BF 15 D2
      00952B 96 52 96 5F            313 	.word err_overflow,err_read_only  
                                    314 
      00952F 96 69 4D 65 6D 6F 72   315 err_mem_full: .asciz "Memory full\n" 
             79 20 66 75 6C 6C
      00953C 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      00954A 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      009563 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      009572 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      009588 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      00959E 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      0095B8 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      0095C9 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      0095DA 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      0095E6 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      009619 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      009629 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      00963D 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      009650 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
      00965D 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009667 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
                                    332 
      009683 0A 00 0A 72 75 6E 20   333 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      009695 20 00 0A 63 6F 6D 70   334 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      0096A6 20 00 6C 61 73 74 20   335 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    336 
      001638                        337 syntax_error::
      0096B6 20 00            [ 1]  338 	ld a,#ERR_SYNTAX 
                                    339 
      0096B8                        340 tb_error::
      0096B8 A6 02 00 22 4C   [ 2]  341 	btjt flags,#FCOMP,1$
      0096BA 88               [ 1]  342 	push a 
      0096BA 72 0A 00         [ 2]  343 	ldw x, #rt_msg 
      0096BD 23 4C 88         [ 4]  344 	call puts 
      0096C0 AE               [ 1]  345 	pop a 
      0096C1 96 85 CD         [ 2]  346 	ldw x, #err_msg 
      0096C4 89 BA 84 AE      [ 1]  347 	clr acc16 
      0096C8 95               [ 1]  348 	sll a
      0096C9 0D 72 5F 00      [ 1]  349 	rlc acc16  
      0096CD 0E 48 72         [ 1]  350 	ld acc8, a 
      0096D0 59 00 0E C7      [ 2]  351 	addw x,acc16 
      0096D4 00               [ 2]  352 	ldw x,(x)
      0096D5 0F 72 BB         [ 4]  353 	call puts
      0096D8 00 0E FE         [ 2]  354 	ldw x,basicptr 
                           000001   355 .if DEBUG 
      0096DB CD 89 BA         [ 1]  356 ld a,count 
      0096DE CE 00            [ 1]  357 clrw y 
      0096E0 05 C6            [ 1]  358 rlwa y  
      0096E2 00 04 90         [ 4]  359 call hex_dump
      0096E5 5F 90 02         [ 2]  360 ldw x,basicptr
                                    361 .endif 
      0096E8 CD 86 B5         [ 1]  362 	ld a,in 
      0096EB CE 00 05         [ 4]  363 	call prt_basic_line
      0096EE C6 00 02         [ 2]  364 	ldw x,#tk_id 
      0096F1 CD 9F CF         [ 4]  365 	call puts 
      0096F4 AE 96 A8         [ 1]  366 	ld a,in.saved 
      0096F7 CD               [ 1]  367 	clrw x 
      0096F8 89               [ 1]  368 	ld xl,a 
      0096F9 BA C6 00 03      [ 2]  369 	addw x,basicptr 
      0096FD 5F               [ 1]  370 	ld a,(x)
      0096FE 97               [ 1]  371 	clrw x 
      0096FF 72               [ 1]  372 	ld xl,a 
      009700 BB 00 05         [ 4]  373 	call prt_i16
      009703 F6 5F            [ 2]  374 	jra 6$
      00168B                        375 1$:	
      009705 97               [ 1]  376 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009706 CD 98 64         [ 2]  377 	ldw x,#comp_msg
      009709 20 35 3A         [ 4]  378 	call puts 
      00970B 84               [ 1]  379 	pop a 
      00970B 88 AE 96         [ 2]  380 	ldw x, #err_msg 
      00970E 97 CD 89 BA      [ 1]  381 	clr acc16 
      009712 84               [ 1]  382 	sll a
      009713 AE 95 0D 72      [ 1]  383 	rlc acc16  
      009717 5F 00 0E         [ 1]  384 	ld acc8, a 
      00971A 48 72 59 00      [ 2]  385 	addw x,acc16 
      00971E 0E               [ 2]  386 	ldw x,(x)
      00971F C7 00 0F         [ 4]  387 	call puts
      009722 72 BB 00         [ 2]  388 	ldw x,#tib
      009725 0E FE CD         [ 4]  389 	call puts 
      009728 89 BA            [ 1]  390 	ld a,#CR 
      00972A AE 16 90         [ 4]  391 	call putc
      00972D CD 89 BA         [ 2]  392 	ldw x,in.w
      009730 A6 0D CD         [ 4]  393 	call spaces
      009733 89 5D            [ 1]  394 	ld a,#'^
      009735 CE 00 01         [ 4]  395 	call putc 
      009738 CD 8A 27         [ 2]  396 6$: ldw x,#STACK_EMPTY 
      00973B A6               [ 1]  397     ldw sp,x
                                    398 
      0016C4                        399 warm_start:
      00973C 5E CD 89         [ 4]  400 	call warm_init
                                    401 ;----------------------------
                                    402 ;   BASIC interpreter
                                    403 ;----------------------------
      0016C7                        404 cmd_line: ; user interface 
      00973F 5D AE            [ 1]  405 	ld a,#CR 
      009741 17 FF 94         [ 4]  406 	call putc 
      009744 A6 3E            [ 1]  407 	ld a,#'> 
      009744 CD 94 CE         [ 4]  408 	call putc
      009747 CD 0A 3F         [ 4]  409 	call readln
      009747 A6 0D CD 89      [ 1]  410 	tnz count 
      00974B 5D A6            [ 1]  411 	jreq cmd_line
      00974D 3E CD 89         [ 4]  412 	call compile
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
      009750 5D CD 8A BF      [ 1]  426 	tnz count 
      009754 72 5D            [ 1]  427 	jreq cmd_line
                                    428 	
                                    429 ; if direct command 
                                    430 ; it's ready to interpret 
                                    431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                    432 ;; This is the interpreter loop
                                    433 ;; for each BASIC code line. 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016E3                        435 interpreter: 
      009756 00 04 27         [ 1]  436 	ld a,in 
      009759 ED CD 90         [ 1]  437 	cp a,count 
      00975C E8 72            [ 1]  438 	jrmi interp_loop
      0016EB                        439 next_line:
      00975E 5D 00 04 27 E4   [ 2]  440 	btjf flags, #FRUN, cmd_line
      009763 CE 00 04         [ 2]  441 	ldw x,basicptr
      009763 C6 00 02 C1      [ 2]  442 	addw x,in.w 
      009767 00 04 2B         [ 2]  443 	cpw x,txtend 
      00976A 1D C8            [ 1]  444 	jrpl warm_start
      00976B CF 00 04         [ 2]  445 	ldw basicptr,x ; start of next line  
      00976B 72 01            [ 1]  446 	ld a,(2,x)
      00976D 00 23 D7         [ 1]  447 	ld count,a 
      009770 CE 00 05 72      [ 1]  448 	mov in,#3 ; skip first 3 bytes of line 
      001708                        449 interp_loop:
      009774 BB 00 01         [ 4]  450 	call next_token
      009777 C3 00            [ 1]  451 	cp a,#TK_NONE 
      009779 1E 2A            [ 1]  452 	jreq next_line 
      00977B C8 CF            [ 1]  453 	cp a,#TK_CMD
      00977D 00 05            [ 1]  454 	jrne 1$
      001713                        455 	_get_code_addr
      00977F E6               [ 2]    1         ldw x,(x)
      009780 02 C7 00 04      [ 1]    2         inc in 
      009784 35 03 00 02      [ 1]    3         inc in 
      009788 FD               [ 4]  456 	call(x)
      009788 CD 98            [ 2]  457 	jra interp_loop 
      00171F                        458 1$:	 
      00978A 1C A1            [ 1]  459 	cp a,#TK_VAR
      00978C 00 27            [ 1]  460 	jrne 2$
      00978E DC A1 80         [ 4]  461 	call let_var  
      009791 26 0C            [ 2]  462 	jra interp_loop 
      001728                        463 2$:	
      009793 FE 72            [ 1]  464 	cp a,#TK_ARRAY 
      009795 5C 00            [ 1]  465 	jrne 3$
      009797 02 72 5C         [ 4]  466 	call let_array 
      00979A 00 02            [ 2]  467 	jra interp_loop
      001731                        468 3$:	
      00979C FD 20            [ 1]  469 	cp a,#TK_LABEL
      00979E E9 05            [ 1]  470 	jrne 4$
      00979F CD 17 41         [ 4]  471 	call let_dvar  
      00979F A1 85            [ 2]  472 	jra interp_loop 
      00173A                        473 4$: 
      0097A1 26 05            [ 1]  474 	cp a,#TK_COLON 
      0097A3 CD 9D            [ 1]  475 	jreq interp_loop
      0097A5 13 20 E0         [ 2]  476 5$:	jp syntax_error 
                                    477 
                                    478 
                                    479 ;----------------------
                                    480 ; when a label is met 
                                    481 ; at interp_loop
                                    482 ; it may be a variable 
                                    483 ; assignement to DIM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    484 ; variable 
                                    485 ;----------------------
                           000001   486 	VAR_NAME=1 
                           000003   487 	REC_LEN=3
                           000004   488 	VSIZE=4 
      0097A8                        489 let_dvar:
      001741                        490 	_vars VSIZE 
      0097A8 A1 05            [ 2]    1     sub sp,#VSIZE 
      0097AA 26 05            [ 2]  491 	ldw (VAR_NAME,sp),x
      0097AC CD 9D            [ 1]  492 	clr (REC_LEN,sp) 
      0097AE 0E 20 D7         [ 4]  493 	call skip_string 
      0097B1 CE 00 04         [ 2]  494 	ldw x,basicptr 
      0097B1 A1 03 26 05      [ 2]  495 	addw x,in.w 
      0097B5 CD               [ 1]  496 	ld a,(x)
      0097B6 97 C1            [ 1]  497 	cp a,#TK_EQUAL 
      0097B8 20 CE            [ 1]  498 	jrne 9$ 
                                    499 ; dvar assignment 
      0097BA 72 5C 00 01      [ 1]  500 	inc in  
      0097BA A1 0A 27         [ 4]  501 	call condition  
      0097BD CA CC            [ 1]  502 	cp a,#TK_INTGR 
      0097BF 96 B8            [ 1]  503 	jreq 1$ 
      0097C1 CC 16 38         [ 2]  504 0$:	jp syntax_error 
      001764                        505 1$: 
      0097C1 52 04            [ 2]  506 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      0097C3 1F 01 0F         [ 4]  507 	call strlen 
      0097C6 03 CD            [ 1]  508 	add a,#REC_XTRA_BYTES
      0097C8 98 35            [ 1]  509 	ld (REC_LEN+1,sp),a 
      0097CA CE 00 05         [ 4]  510 	call search_name 
      0097CD 72               [ 2]  511 	tnzw x 
      0097CE BB 00            [ 1]  512 	jreq 0$ 
      0097D0 01               [ 1]  513 	ld a,(x)
      0097D1 F6 A1            [ 1]  514 	jrpl 2$
      0097D3 32 26            [ 1]  515 	ld a,#ERR_RD_ONLY 
      0097D5 43 72 5C         [ 2]  516 	jp tb_error 
      00177B                        517 2$:
      0097D8 00 02 CD         [ 2]  518 	addw x,(REC_LEN,sp)
      0097DB 9C 41 A1         [ 2]  519 	subw x,#CELL_SIZE 
      0097DE 84 27 03         [ 2]  520 	ldw ptr16,x
      001784                        521 	_xpop 
      0097E1 CC 96            [ 1]    1     ld a,(y)
      0097E3 B8               [ 1]    2     ldw x,y 
      0097E4 EE 01            [ 2]    3     ldw x,(1,x)
      0097E4 1E 01 CD 93      [ 2]    4     addw y,#CELL_SIZE 
      0097E8 D8 AB 05 6B      [ 4]  522 	ld [ptr16],a 
      0097EC 04 CD 9D 7D      [ 1]  523 	inc ptr8 
      0097F0 5D 27 EE F6      [ 5]  524 	ldw [ptr16],x 
      001799                        525 9$: _drop VSIZE 	
      0097F4 2A 05            [ 2]    1     addw sp,#VSIZE 
      0097F6 A6               [ 4]  526 	ret 
                                    527 
                                    528 
                                    529 ;--------------------------
                                    530 ; extract next token from
                                    531 ; token list 
                                    532 ; basicptr -> base address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    533 ; in  -> offset in list array 
                                    534 ; output:
                                    535 ;   A 		token attribute
                                    536 ;   X 		*token_value 
                                    537 ;----------------------------------------
      00179C                        538 next_token::
                                    539 ;	clrw x 
      0097F7 11 CC 96         [ 1]  540 	ld a,in 
      0097FA BA 00 02         [ 1]  541 	ld in.saved,a ; in case "_unget_token" needed 
                                    542 ; don't replace sub by "cp a,count" 
                                    543 ; if end of line must return with A=0   	
      0097FB C0 00 03         [ 1]  544 	sub a,count 
      0097FB 72 FB            [ 1]  545 	jreq 9$ ; end of line 
      0017A7                        546 0$: 
      0097FD 03 1D 00         [ 2]  547 	ldw x,basicptr 
      009800 03 CF 00 1A      [ 2]  548 	addw x,in.w 
      009804 90               [ 1]  549 	ld a,(x)
      009805 F6               [ 1]  550 	incw x
      009806 93 EE 01 72      [ 1]  551 	inc in   
      00980A A9               [ 4]  552 9$: ret 
                                    553 
                                    554 ;-------------------------
                                    555 ;  skip .asciz in BASIC line 
                                    556 ;  name 
                                    557 ;  input:
                                    558 ;     x		* string 
                                    559 ;  output:
                                    560 ;     none 
                                    561 ;-------------------------
      0017B5                        562 skip_string:
      00980B 00               [ 1]  563 	ld a,(x)
      00980C 03 72            [ 1]  564 	jreq 1$
      00980E C7               [ 1]  565 	incw x 
      00980F 00 1A            [ 2]  566 	jra skip_string 
      009811 72               [ 1]  567 1$: incw x 	
      009812 5C 00 1B 72      [ 2]  568 	subw x,basicptr 
      009816 CF 00 1A         [ 2]  569 	ldw in.w,x 
      009819 5B               [ 4]  570 	ret 
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
      0017C4                        581 get_addr:
      00981A 04               [ 2]  582 	ldw x,(x)
      00981B 81 5C 00 01      [ 1]  583 	inc in 
      00981C 72 5C 00 01      [ 1]  584 	inc in 
      00981C C6               [ 4]  585 	ret 
                                    586 
                                    587 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                    588 ; extract int24_t  
                                    589 ; value from BASIC 
                                    590 ; code 
                                    591 ; input:
                                    592 ;    X   *integer 
                                    593 ; output:
                                    594 ;    A:X   int24  
                                    595 ;--------------------
      0017CE                        596 get_int24:
      00981D 00               [ 1]  597 	ld a,(x)
      00981E 02 C7            [ 2]  598 	ldw x,(1,x)
                                    599 ; skip 3 bytes 
      009820 00 03 C0 00      [ 1]  600 	inc in 
      009824 04 27 0D 01      [ 1]  601 	inc in 
      009827 72 5C 00 01      [ 1]  602 	inc in 
      009827 CE               [ 4]  603 	ret 
                                    604 
                                    605 ;-------------------------
                                    606 ; get character from 
                                    607 ; BASIC code 
                                    608 ; input:
                                    609 ;    X   *char 
                                    610 ; output:
                                    611 ;    A    char 
                                    612 ;-------------------------
      0017DE                        613 get_char:
      009828 00               [ 1]  614 	ld a,(x)
      009829 05 72 BB 00      [ 1]  615 	inc in  
      00982D 01               [ 4]  616     ret 
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
      0017E4                        628 prt_i16:
      00982E F6 5C 72 5C      [ 1]  629 	clr acc24 
      009832 00 02 81         [ 2]  630 	ldw acc16,x 
      009835 A6 10            [ 1]  631 	ld a,#16
      009835 F6 27 03         [ 1]  632 	cp a,base
      009838 5C 20            [ 1]  633 	jreq prt_acc24  
      00983A FA 5C 72 B0 00   [ 2]  634 	btjf acc16,#7,prt_acc24
      00983F 05 CF 00 01      [ 1]  635 	cpl acc24 ; sign extend 
                                    636 	
                                    637 ;------------------------------------
                                    638 ; print integer in acc24 
                                    639 ; input:
                                    640 ;	acc24 		integer to print 
                                    641 ;	'base' 		numerical base for conversion 
                                    642 ;   'tab_width' field width 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    643 ;    A 			signed||unsigned conversion
                                    644 ;  output:
                                    645 ;    A          string length
                                    646 ;------------------------------------
      0017FB                        647 prt_acc24:
      009843 81 FF            [ 1]  648 	ld a,#255  ; signed conversion  
      009844 CD 18 21         [ 4]  649     call itoa  ; conversion entier en  .asciz
      009844 FE 72 5C         [ 4]  650 	call right_align  
      009847 00               [ 1]  651 	push a 
      009848 02 72 5C         [ 4]  652 	call puts
      00984B 00               [ 1]  653 	pop a 
      00984C 02               [ 4]  654     ret	
                                    655 
                                    656 ;---------------------------------------
                                    657 ;  print value at xstack top 
                                    658 ;---------------------------------------
      001809                        659 print_top: 
      001809                        660 	_xpop 
      00984D 81 F6            [ 1]    1     ld a,(y)
      00984E 93               [ 1]    2     ldw x,y 
      00984E F6 EE            [ 2]    3     ldw x,(1,x)
      009850 01 72 5C 00      [ 2]    4     addw y,#CELL_SIZE 
      009854 02 72 5C         [ 1]  661 	ld acc24,a 
      009857 00 02 72         [ 2]  662 	ldw acc16,x 
      00985A 5C 00 02         [ 4]  663 	call prt_acc24 
      00985D 81 20            [ 1]  664 	ld a,#SPACE
      00985E CD 08 DD         [ 4]  665 	call putc 
      00985E F6               [ 4]  666 	ret 
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
      001821                        682 itoa::
      001821                        683 	_vars VSIZE
      00985F 72 5C            [ 2]    1     sub sp,#VSIZE 
      009861 00 02            [ 1]  684 	clr (LEN,sp) ; string length  
      009863 81 01            [ 1]  685 	clr (SIGN,sp)    ; sign
      009864 4D               [ 1]  686 	tnz A
      009864 72 5F            [ 1]  687 	jreq 1$ ; unsigned conversion  
      009866 00 0D CF         [ 1]  688 	ld a,base 
      009869 00 0E            [ 1]  689 	cp a,#10
      00986B A6 10            [ 1]  690 	jrne 1$
                                    691 	; base 10 string display with negative sign if bit 23==1
      00986D C1 00 0B 27 09   [ 2]  692 	btjf acc24,#7,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009872 72 0F            [ 1]  693 	cpl (SIGN,sp)
      009874 00 0E 04         [ 4]  694 	call neg_acc24
      00183B                        695 1$:
                                    696 ; initialize string pointer 
      009877 72 53 00         [ 2]  697 	ldw x,#tib 
      00987A 0D 00 50         [ 2]  698 	addw x,#TIB_SIZE
      00987B 5A               [ 2]  699 	decw x 
      00987B A6               [ 1]  700 	clr (x)
      001843                        701 itoa_loop:
      00987C FF CD 98         [ 1]  702     ld a,base
      00987F A1 CD 91         [ 4]  703     call divu24_8 ; acc24/A 
      009882 92 88            [ 1]  704     add a,#'0  ; remainder of division
      009884 CD 89            [ 1]  705     cp a,#'9+1
      009886 BA 84            [ 1]  706     jrmi 2$
      009888 81 07            [ 1]  707     add a,#7 
      009889                        708 2$:	
      009889 90               [ 2]  709 	decw x
      00988A F6               [ 1]  710     ld (x),a
      00988B 93 EE            [ 1]  711 	inc (LEN,sp)
                                    712 	; if acc24==0 conversion done
      00988D 01 72 A9         [ 1]  713 	ld a,acc24
      009890 00 03 C7         [ 1]  714 	or a,acc16
      009893 00 0D CF         [ 1]  715 	or a,acc8
      009896 00 0E            [ 1]  716     jrne itoa_loop
                                    717 	;conversion done, next add '$' or '-' as required
      009898 CD 98 7B         [ 1]  718 	ld a,base 
      00989B A6 20            [ 1]  719 	cp a,#16
      00989D CD 89            [ 1]  720 	jreq 8$
      00989F 5D 81            [ 1]  721 	ld a,(SIGN,sp)
      0098A1 27 0A            [ 1]  722     jreq 10$
      0098A1 52 04            [ 1]  723     ld a,#'-
      0098A3 0F 02            [ 2]  724 	jra 9$ 
      00186F                        725 8$:	
      0098A5 0F 01            [ 1]  726 	ld a,#'$ 
      0098A7 4D               [ 2]  727 9$: decw x
      0098A8 27               [ 1]  728     ld (x),a
      0098A9 11 C6            [ 1]  729 	inc (LEN,sp)
      001875                        730 10$:
      0098AB 00 0B            [ 1]  731 	ld a,(LEN,sp)
      001877                        732 	_drop VSIZE
      0098AD A1 0A            [ 2]    1     addw sp,#VSIZE 
      0098AF 26               [ 4]  733 	ret
                                    734 
                                    735 ;------------------------------------
                                    736 ; convert alpha to uppercase
                                    737 ; input:
                                    738 ;    a  character to convert
                                    739 ; output:
                                    740 ;    a  uppercase character
                                    741 ;------------------------------------
      00187A                        742 to_upper::
      0098B0 0A 72            [ 1]  743 	cp a,#'a
      0098B2 0F 00            [ 1]  744 	jrpl 1$
      0098B4 0D               [ 4]  745 0$:	ret
      0098B5 05 03            [ 1]  746 1$: cp a,#'z	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0098B7 01 CD            [ 1]  747 	jrugt 0$
      0098B9 82 8D            [ 1]  748 	sub a,#32
      0098BB 81               [ 4]  749 	ret
                                    750 	
                                    751 ;------------------------------------
                                    752 ; convert pad content in integer
                                    753 ; input:
                                    754 ;    x		* .asciz to convert
                                    755 ; output:
                                    756 ;    acc24      int24_t
                                    757 ;------------------------------------
                                    758 	; local variables
                           000001   759 	SIGN=1 ; 1 byte, 
                           000002   760 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   761 	TEMP=3 ; 1 byte, temporary storage
                           000004   762 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   763 	VSIZE=5 ; 5 bytes reserved for local storage
      001886                        764 atoi24::
      001886                        765 	_vars VSIZE
      0098BB AE 16            [ 2]    1     sub sp,#VSIZE 
      0098BD 90 1C            [ 2]  766 	ldw (XTEMP,sp),x 
                                    767 ; conversion made on xstack 
      0098BF 00               [ 1]  768 	clr a 
      0098C0 50               [ 1]  769 	clrw x 
      00188C                        770 	_xpush 
      0098C1 5A 7F 00 03      [ 2]    1     subw y,#CELL_SIZE
      0098C3 90 F7            [ 1]    2     ld (y),a 
      0098C3 C6 00 0B         [ 2]    3     ldw (1,y),x 
      0098C6 CD 83            [ 1]  771 	clr (SIGN,sp)
      0098C8 59 AB            [ 1]  772 	ld a,#10
      0098CA 30 A1            [ 1]  773 	ld (BASE,sp),a ; default base decimal
      0098CC 3A 2B            [ 2]  774 	ldw x,(XTEMP,sp)
      0098CE 02               [ 1]  775 	ld a,(x)
      0098CF AB 07            [ 1]  776 	jreq 9$  ; completed if 0
      0098D1 A1 2D            [ 1]  777 	cp a,#'-
      0098D1 5A F7            [ 1]  778 	jrne 1$
      0098D3 0C 02            [ 1]  779 	cpl (SIGN,sp)
      0098D5 C6 00            [ 2]  780 	jra 2$
      0098D7 0D CA            [ 1]  781 1$: cp a,#'$
      0098D9 00 0E            [ 1]  782 	jrne 3$
      0098DB CA 00            [ 1]  783 	ld a,#16
      0098DD 0F 26            [ 1]  784 	ld (BASE,sp),a
      0098DF E3               [ 1]  785 2$:	incw x
      0098E0 C6 00            [ 2]  786 	ldw (XTEMP,sp),x 
      0098E2 0B               [ 1]  787 	ld a,(x)
      0018B4                        788 3$:	; char to digit 
      0098E3 A1 10            [ 1]  789 	cp a,#'a
      0098E5 27 08            [ 1]  790 	jrmi 4$
      0098E7 7B 01            [ 1]  791 	sub a,#32
      0098E9 27 0A            [ 1]  792 4$:	cp a,#'0
      0098EB A6 2D            [ 1]  793 	jrmi 9$
      0098ED 20 02            [ 1]  794 	sub a,#'0
      0098EF A1 0A            [ 1]  795 	cp a,#10
      0098EF A6 24            [ 1]  796 	jrmi 5$
      0098F1 5A F7            [ 1]  797 	sub a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0098F3 0C 02            [ 1]  798 	cp a,(BASE,sp)
      0098F5 2A 24            [ 1]  799 	jrpl 9$
      0098F5 7B 02            [ 1]  800 5$:	ld (TEMP,sp),a
      0098F7 5B 04            [ 1]  801 	ld a,(BASE,sp)
      0098F9 81 02 2A         [ 4]  802 	call mulu24_8
      0098FA                        803 	_xpush 
      0098FA A1 61 2A 01      [ 2]    1     subw y,#CELL_SIZE
      0098FE 81 A1            [ 1]    2     ld (y),a 
      009900 7A 22 FB         [ 2]    3     ldw (1,y),x 
      009903 A0               [ 1]  804 	clrw x 
      009904 20 81            [ 1]  805 	ld a,(TEMP,sp)
      009906 02               [ 1]  806 	rlwa x 
      0018DE                        807 	_xpush 
      009906 52 05 1F 04      [ 2]    1     subw y,#CELL_SIZE
      00990A 4F 5F            [ 1]    2     ld (y),a 
      00990C 72 A2 00         [ 2]    3     ldw (1,y),x 
      00990F 03 90 F7         [ 4]  808 	call add24 
      009912 90 EF            [ 2]  809 	ldw x,(XTEMP,sp)
      009914 01 0F            [ 2]  810 	jra 2$
      009916 01 A6            [ 1]  811 9$:	tnz (SIGN,sp)
      009918 0A 6B            [ 1]  812     jreq atoi_exit
      00991A 02 1E 04         [ 4]  813     call neg24
      0018F5                        814 atoi_exit:
      0018F5                        815 	_xpop 
      00991D F6 27            [ 1]    1     ld a,(y)
      00991F 4E               [ 1]    2     ldw x,y 
      009920 A1 2D            [ 2]    3     ldw x,(1,x)
      009922 26 04 03 01      [ 2]    4     addw y,#CELL_SIZE 
      009926 20 08 A1         [ 1]  816 	ld acc24,a 
      009929 24 26 08         [ 2]  817 	ldw acc16,x  
      001904                        818 	_drop VSIZE
      00992C A6 10            [ 2]    1     addw sp,#VSIZE 
      00992E 6B               [ 4]  819 	ret
                                    820 
                                    821 
                                    822 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    823 ;;   TINY BASIC  operators,
                                    824 ;;   commands and functions 
                                    825 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    826 
                                    827 ;---------------------------------
                                    828 ; dictionary search 
                                    829 ; input:
                                    830 ;	X 		dictionary entry point, name field  
                                    831 ;   y		.asciz name to search 
                                    832 ; output:
                                    833 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    834 ;  X		routine address|TK_OP 
                                    835 ;---------------------------------
                           000001   836 	NLEN=1 ; cmd length 
                           000002   837 	XSAVE=2
                           000004   838 	YSAVE=4
                           000005   839 	VSIZE=5 
      001907                        840 search_dict::
      001907                        841 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00992F 02 5C            [ 2]    1     sub sp,#VSIZE 
      009931 1F 04            [ 2]  842 	ldw (YSAVE,sp),y 
      00190B                        843 search_next:
      009933 F6 02            [ 2]  844 	ldw (XSAVE,sp),x 
                                    845 ; get name length in dictionary	
      009934 F6               [ 1]  846 	ld a,(x)
      009934 A1 61            [ 1]  847 	and a,#0xf 
      009936 2B 02            [ 1]  848 	ld (NLEN,sp),a  
      009938 A0 20            [ 2]  849 	ldw y,(YSAVE,sp) ; name pointer 
      00993A A1               [ 1]  850 	incw x 
      001915                        851 cp_loop:
      00993B 30 2B            [ 1]  852 	ld a,(y)
      00993D 30 A0            [ 1]  853 	jreq str_match 
      00993F 30 A1            [ 1]  854 	tnz (NLEN,sp)
      009941 0A 2B            [ 1]  855 	jreq no_match  
      009943 06               [ 1]  856 	cp a,(x)
      009944 A0 07            [ 1]  857 	jrne no_match 
      009946 11 02            [ 1]  858 	incw y 
      009948 2A               [ 1]  859 	incw x
      009949 24 6B            [ 1]  860 	dec (NLEN,sp)
      00994B 03 7B            [ 2]  861 	jra cp_loop 
      001927                        862 no_match:
      00994D 02 CD            [ 2]  863 	ldw x,(XSAVE,sp) 
      00994F 82 AA 72         [ 2]  864 	subw x,#2 ; move X to link field
      009952 A2 00            [ 1]  865 	push #TK_NONE 
      009954 03               [ 2]  866 	ldw x,(x) ; next word link 
      009955 90               [ 1]  867 	pop a ; TK_NONE 
      009956 F7 90            [ 1]  868 	jreq search_exit  ; not found  
                                    869 ;try next 
      009958 EF 01            [ 2]  870 	jra search_next
      001934                        871 str_match:
      00995A 5F 7B            [ 2]  872 	ldw x,(XSAVE,sp)
      00995C 03               [ 1]  873 	ld a,(X)
      00995D 02 72            [ 1]  874 	ld (NLEN,sp),a ; needed to test keyword type  
      00995F A2 00            [ 1]  875 	and a,#NLEN_MASK 
                                    876 ; move x to procedure address field 	
      009961 03               [ 1]  877 	inc a 
      009962 90 F7 90         [ 1]  878 	ld acc8,a 
      009965 EF 01 CD 81      [ 1]  879 	clr acc16 
      009969 EE 1E 04 20      [ 2]  880 	addw x,acc16 
      00996D C2               [ 2]  881 	ldw x,(x) ; routine address  
                                    882 ;determine keyword type bits 7:4 
      00996E 0D 01            [ 1]  883 	ld a,(NLEN,sp)
      009970 27 03            [ 1]  884 	and a,#KW_TYPE_MASK 
      009972 CD               [ 1]  885 	swap a 
      009973 82 73            [ 1]  886 	add a,#128
      009975                        887 search_exit: 
      00194F                        888 	_drop VSIZE 
      009975 90 F6            [ 2]    1     addw sp,#VSIZE 
      009977 93               [ 4]  889 	ret 
                                    890 
                                    891 ;---------------------
                                    892 ; check if next token
                                    893 ;  is of expected type 
                                    894 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    895 ;   A 		 expected token attribute
                                    896 ;  ouput:
                                    897 ;   none     if fail call syntax_error 
                                    898 ;--------------------
      001952                        899 expect:
      009978 EE               [ 1]  900 	push a 
      009979 01 72 A9         [ 4]  901 	call next_token 
      00997C 00 03            [ 1]  902 	cp a,(1,sp)
      00997E C7 00            [ 1]  903 	jreq 1$
      009980 0D CF 00         [ 2]  904 	jp syntax_error
      009983 0E               [ 1]  905 1$: pop a 
      009984 5B               [ 4]  906 	ret 
                                    907 
                                    908 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    909 ; parse arguments list 
                                    910 ; between ()
                                    911 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00195F                        912 func_args:
      009985 05 81            [ 1]  913 	ld a,#TK_LPAREN 
      009987 CD 19 52         [ 4]  914 	call expect 
                                    915 ; expected to continue in arg_list 
                                    916 ; caller must check for TK_RPAREN 
                                    917 
                                    918 ;-------------------------------
                                    919 ; parse embedded BASIC routines 
                                    920 ; arguments list.
                                    921 ; arg_list::=  expr[','expr]*
                                    922 ; all arguments are of int24_t type
                                    923 ; and pushed on stack 
                                    924 ; input:
                                    925 ;   none
                                    926 ; output:
                                    927 ;   xstack{n}   arguments pushed on xstack
                                    928 ;   A 	number of arguments pushed on xstack  
                                    929 ;--------------------------------
      001964                        930 arg_list:
      009987 52 05            [ 1]  931 	push #0
      009989 17 04 C1         [ 4]  932 1$:	call condition 
      00998B 4D               [ 1]  933 	tnz a 
      00998B 1F 02            [ 1]  934 	jreq 7$  
      00998D F6 A4            [ 1]  935 	inc (1,sp)
      00998F 0F 6B 01         [ 4]  936 	call next_token 
      009992 16 04            [ 1]  937 	cp a,#TK_COMMA 
      009994 5C F1            [ 1]  938 	jreq 1$ 
      009995 A1 07            [ 1]  939 	cp a,#TK_RPAREN
      009995 90 F6            [ 1]  940 	jreq 7$
      001979                        941 	_unget_token 
      009997 27 1B 0D 01 27   [ 1]    1      mov in,in.saved  
      00999C 0A               [ 1]  942 7$:	pop a  
      00999D F1               [ 4]  943 	ret 
                                    944 
                                    945 ;--------------------------------
                                    946 ;   BASIC commnands 
                                    947 ;--------------------------------
                                    948 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    949 ;--------------------------------
                                    950 ;  arithmetic and relational 
                                    951 ;  routines
                                    952 ;  operators precedence
                                    953 ;  highest to lowest
                                    954 ;  operators on same row have 
                                    955 ;  same precedence and are executed
                                    956 ;  from left to right.
                                    957 ;	'*','/','%'
                                    958 ;   '-','+'
                                    959 ;   '=','>','<','>=','<=','<>','><'
                                    960 ;   '<>' and '><' are equivalent for not equal.
                                    961 ;--------------------------------
                                    962 
                                    963 ;---------------------
                                    964 ; return array element
                                    965 ; address from @(expr)
                                    966 ; input:
                                    967 ;   A 		TK_ARRAY
                                    968 ; output:
                                    969 ;	X 		element address 
                                    970 ;----------------------
      001980                        971 get_array_element:
      00999E 26 07 90         [ 4]  972 	call func_args 
      0099A1 5C 5C            [ 1]  973 	cp a,#1
      0099A3 0A 01            [ 1]  974 	jreq 1$
      0099A5 20 EE 38         [ 2]  975 	jp syntax_error
      0099A7                        976 1$: _xpop 
      0099A7 1E 02            [ 1]    1     ld a,(y)
      0099A9 1D               [ 1]    2     ldw x,y 
      0099AA 00 02            [ 2]    3     ldw x,(1,x)
      0099AC 4B 00 FE 84      [ 2]    4     addw y,#CELL_SIZE 
                                    977     ; ignore A, index < 65536 in any case 
                                    978 	; check for bounds 
      0099B0 27 1D 20         [ 2]  979 	cpw x,array_size 
      0099B3 D7 05            [ 2]  980 	jrule 3$
                                    981 ; bounds {1..array_size}	
      0099B4 A6 0A            [ 1]  982 2$: ld a,#ERR_BAD_VALUE 
      0099B4 1E 02 F6         [ 2]  983 	jp tb_error 
      0099B7 6B               [ 2]  984 3$: tnzw  x
      0099B8 01 A4            [ 1]  985 	jreq 2$ 
      0099BA 0F               [ 2]  986 	pushw x 
      0099BB 4C               [ 2]  987 	sllw x 
      0099BC C7 00 0F         [ 2]  988 	addw x,(1,sp) ; index*size_of(int24)
      0099BF 72 5F            [ 2]  989 	ldw (1,sp),x  
      0099C1 00 0E 72         [ 2]  990 	ldw x,#tib ; array is below tib 
      0099C4 BB 00 0E         [ 2]  991 	subw x,(1,sp)
      0019AD                        992 	_drop 2   
      0099C7 FE 7B            [ 2]    1     addw sp,#2 
      0099C9 01               [ 4]  993 	ret 
                                    994 
                                    995 
                                    996 ;***********************************
                                    997 ;   expression parse,execute 
                                    998 ;***********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                    999 ;-----------------------------------
                                   1000 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1001 ;			 integer | function |
                                   1002 ;			 '('relation')' 
                                   1003 ; output:
                                   1004 ;   A       token attribute 
                                   1005 ;   xstack  value  
                                   1006 ; ---------------------------------
                           000001  1007 	NEG=1
                           000001  1008 	VSIZE=1
      0019B0                       1009 factor:
      0019B0                       1010 	_vars VSIZE 
      0099CA A4 F0            [ 2]    1     sub sp,#VSIZE 
      0099CC 4E AB            [ 1] 1011 	clr (NEG,sp)
      0099CE 80 17 9C         [ 4] 1012 	call next_token
      0099CF 4D               [ 1] 1013 	tnz a 
      0099CF 5B 05            [ 1] 1014 	jrne 1$ 
      0099D1 81 1A 62         [ 2] 1015 	jp 22$ 
      0099D2 A1 10            [ 1] 1016 1$:	cp a,#TK_PLUS 
      0099D2 88 CD            [ 1] 1017 	jreq 2$
      0099D4 98 1C            [ 1] 1018 	cp a,#TK_MINUS 
      0099D6 11 01            [ 1] 1019 	jrne 4$ 
      0099D8 27 03            [ 1] 1020 	cpl (NEG,sp)
      0019C7                       1021 2$:	
      0099DA CC 96 B8         [ 4] 1022 	call next_token
      0019CA                       1023 4$:
      0099DD 84               [ 1] 1024 	tnz a 
      0099DE 81 03            [ 1] 1025 	jrne 41$ 
      0099DF CC 16 38         [ 2] 1026 	jp syntax_error  
      0019D0                       1027 41$:	
      0099DF A6 06            [ 1] 1028 	cp a,#TK_IFUNC 
      0099E1 CD 99            [ 1] 1029 	jrne 5$ 
      0019D4                       1030 	_get_code_addr 
      0099E3 D2               [ 2]    1         ldw x,(x)
      0099E4 72 5C 00 01      [ 1]    2         inc in 
      0099E4 4B 00 CD 9C      [ 1]    3         inc in 
      0099E8 41               [ 4] 1031 	call (x); result in A:X  
      0099E9 4D 27            [ 2] 1032 	jra 18$ 
      0019E0                       1033 5$:
      0099EB 12 0C            [ 1] 1034 	cp a,#TK_INTGR
      0099ED 01 CD            [ 1] 1035 	jrne 6$
      0099EF 98 1C A1         [ 4] 1036 	call get_int24 ; A:X
      0099F2 08 27            [ 2] 1037 	jra 18$
      0019E9                       1038 6$:
      0099F4 F1 A1            [ 1] 1039 	cp a,#TK_ARRAY
      0099F6 07 27            [ 1] 1040 	jrne 7$
      0099F8 05 55 00         [ 4] 1041 	call get_array_element
      0099FB 03 00            [ 2] 1042     jra 71$
      0019F2                       1043 7$:
      0099FD 02 84            [ 1] 1044 	cp a,#TK_VAR 
      0099FF 81 08            [ 1] 1045 	jrne 8$
      009A00 CD 17 C4         [ 4] 1046 	call get_addr 
      0019F9                       1047 71$: ; put value in A:X
      009A00 CD               [ 1] 1048 	ld a,(x)
      009A01 99 DF            [ 2] 1049 	ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009A03 A1 01            [ 2] 1050 	jra 18$
      0019FE                       1051 8$:
      009A05 27 03            [ 1] 1052 	cp a,#TK_LABEL 
      009A07 CC 96            [ 1] 1053 	jrne 9$
      009A09 B8 90            [ 2] 1054 	pushw y  
      009A0B F6               [ 2] 1055 	pushw x 
      009A0C 93 EE 01         [ 4] 1056 	call skip_string
      009A0F 72               [ 2] 1057 	popw x  
      009A10 A9 00 03         [ 4] 1058 	call strlen 
      009A13 C3 00            [ 1] 1059 	add a,#REC_XTRA_BYTES
      009A15 21 23 05         [ 4] 1060 	call search_name
      009A18 A6               [ 2] 1061 	tnzw x 
      009A19 0A CC            [ 1] 1062 	jrne 82$ 
      009A1B 96 BA            [ 2] 1063 	popw y 
      009A1D 5D 27            [ 2] 1064 	jra 16$
      001A18                       1065 82$:
      009A1F F8 89            [ 2] 1066 	popw y   
      009A21 58 72 FB         [ 4] 1067 	call get_value ; in A:X 
      009A24 01 1F            [ 2] 1068 	jra 18$
      001A1F                       1069 9$: 
      009A26 01 AE            [ 1] 1070 	cp a,#TK_CFUNC 
      009A28 16 90            [ 1] 1071 	jrne 12$
      001A23                       1072 	_get_code_addr 
      009A2A 72               [ 2]    1         ldw x,(x)
      009A2B F0 01 5B 02      [ 1]    2         inc in 
      009A2F 81 5C 00 01      [ 1]    3         inc in 
      009A30 FD               [ 4] 1073 	call(x)
      009A30 52               [ 1] 1074 	clrw x 
      009A31 01               [ 1] 1075 	rlwa x  ; char>int24 in A:X 
      009A32 0F 01            [ 2] 1076 	jra 18$ 	 
      001A31                       1077 12$:			
      009A34 CD 98            [ 1] 1078 	cp a,#TK_LPAREN
      009A36 1C 4D            [ 1] 1079 	jrne 16$
      009A38 26 03 CC         [ 4] 1080 	call expression
      009A3B 9A E2            [ 1] 1081 	ld a,#TK_RPAREN 
      009A3D A1 10 27         [ 4] 1082 	call expect
      001A3D                       1083 	_xpop 
      009A40 06 A1            [ 1]    1     ld a,(y)
      009A42 11               [ 1]    2     ldw x,y 
      009A43 26 05            [ 2]    3     ldw x,(1,x)
      009A45 03 01 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009A47 20 08            [ 2] 1084 	jra 18$	
      001A48                       1085 16$:
      001A48                       1086 	_unget_token 
      009A47 CD 98 1C 00 01   [ 1]    1      mov in,in.saved  
      009A4A 4F               [ 1] 1087 	clr a 
      009A4A 4D 26            [ 2] 1088 	jra 22$ 
      001A50                       1089 18$: 
      009A4C 03 CC            [ 1] 1090 	tnz (NEG,sp)
      009A4E 96 B8            [ 1] 1091 	jreq 20$
      009A50 CD 02 05         [ 4] 1092 	call neg_ax   
      001A57                       1093 20$:
      001A57                       1094 	_xpush 
      009A50 A1 81 26 0C      [ 2]    1     subw y,#CELL_SIZE
      009A54 FE 72            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009A56 5C 00 02         [ 2]    3     ldw (1,y),x 
      009A59 72 5C            [ 1] 1095 	ld a,#TK_INTGR
      001A62                       1096 22$:
      001A62                       1097 	_drop VSIZE
      009A5B 00 02            [ 2]    1     addw sp,#VSIZE 
      009A5D FD               [ 4] 1098 	ret
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
      001A65                       1109 term:
      001A65                       1110 	_vars VSIZE
      009A5E 20 70            [ 2]    1     sub sp,#VSIZE 
                                   1111 ; first factor 	
      009A60 CD 19 B0         [ 4] 1112 	call factor
      009A60 A1               [ 1] 1113 	tnz a 
      009A61 84 26            [ 1] 1114 	jreq term_exit  
      001A6D                       1115 term01:	 ; check for  operator '*'|'/'|'%' 
      009A63 05 CD 98         [ 4] 1116 	call next_token
      009A66 4E 20            [ 1] 1117 	ld (MULOP,sp),a
      009A68 67 30            [ 1] 1118 	and a,#TK_GRP_MASK
      009A69 A1 20            [ 1] 1119 	cp a,#TK_GRP_MULT
      009A69 A1 05            [ 1] 1120 	jreq 1$
      009A6B 26 05            [ 1] 1121 	ld a,#TK_INTGR
      001A7A                       1122 	_unget_token 
      009A6D CD 9A 00 20 07   [ 1]    1      mov in,in.saved  
      009A72 20 24            [ 2] 1123 	jra term_exit 
      001A81                       1124 1$:	; got *|/|%
                                   1125 ;second factor
      009A72 A1 85 26         [ 4] 1126 	call factor
      009A75 08               [ 1] 1127 	tnz a 
      009A76 CD 98            [ 1] 1128 	jrne 2$ 
      009A78 44 16 38         [ 2] 1129 	jp syntax_error 
      009A79                       1130 2$: ; select operation 	
      009A79 F6 EE            [ 1] 1131 	ld a,(MULOP,sp) 
      009A7B 01 20            [ 1] 1132 	cp a,#TK_MULT 
      009A7D 52 05            [ 1] 1133 	jrne 3$
                                   1134 ; '*' operator
      009A7E CD 02 69         [ 4] 1135 	call mul24 
      009A7E A1 03            [ 2] 1136 	jra term01
      009A80 26 1D            [ 1] 1137 3$: cp a,#TK_DIV 
      009A82 90 89            [ 1] 1138 	jrne 4$ 
                                   1139 ; '/' operator	
      009A84 89 CD 98         [ 4] 1140 	call div24 
      009A87 35 85            [ 2] 1141 	jra term01 
      001A9E                       1142 4$: ; '%' operator
      009A89 CD 93 D8         [ 4] 1143 	call mod24
      009A8C AB 05            [ 2] 1144 	jra term01 
      001AA3                       1145 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009A8E CD 9D            [ 1] 1146 	ld a,#TK_INTGR
      001AA5                       1147 term_exit:
      001AA5                       1148 	_drop VSIZE 
      009A90 7D 5D            [ 2]    1     addw sp,#VSIZE 
      009A92 26               [ 4] 1149 	ret 
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
      001AA8                       1160 expression:
      001AA8                       1161 	_vars VSIZE 
      009A93 04 90            [ 2]    1     sub sp,#VSIZE 
                                   1162 ; first term 	
      009A95 85 20 30         [ 4] 1163 	call term
      009A98 4D               [ 1] 1164 	tnz a 
      009A98 90 85            [ 1] 1165 	jreq 9$
      001AB0                       1166 1$:	; operator '+'|'-'
      009A9A CD 9D 43         [ 4] 1167 	call next_token
      009A9D 20 31            [ 1] 1168 	ld (OP,sp),a 
      009A9F A4 30            [ 1] 1169 	and a,#TK_GRP_MASK
      009A9F A1 82            [ 1] 1170 	cp a,#TK_GRP_ADD 
      009AA1 26 0E            [ 1] 1171 	jreq 2$ 
      001ABB                       1172 	_unget_token 
      009AA3 FE 72 5C 00 02   [ 1]    1      mov in,in.saved  
      009AA8 72 5C            [ 1] 1173 	ld a,#TK_INTGR
      009AAA 00 02            [ 2] 1174 	jra 9$ 
      001AC4                       1175 2$: ; second term 
      009AAC FD 5F 02         [ 4] 1176 	call term
      009AAF 20               [ 1] 1177 	tnz a 
      009AB0 1F 03            [ 1] 1178 	jrne 3$
      009AB1 CC 16 38         [ 2] 1179 	jp syntax_error
      001ACD                       1180 3$:
      009AB1 A1 06            [ 1] 1181 	ld a,(OP,sp)
      009AB3 26 13            [ 1] 1182 	cp a,#TK_PLUS 
      009AB5 CD 9B            [ 1] 1183 	jrne 4$
                                   1184 ; '+' operator	
      009AB7 28 A6 07         [ 4] 1185 	call add24
      009ABA CD 99            [ 2] 1186 	jra 1$ 
      001AD8                       1187 4$:	; '-' operator 
      009ABC D2 90 F6         [ 4] 1188 	call sub24
      009ABF 93 EE            [ 2] 1189 	jra 1$
      001ADD                       1190 9$:
      001ADD                       1191 	_drop VSIZE 
      009AC1 01 72            [ 2]    1     addw sp,#VSIZE 
      009AC3 A9               [ 4] 1192 	ret 
                                   1193 
                                   1194 ;---------------------------------------------
                                   1195 ; rel ::= expr rel_op expr
                                   1196 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                   1197 ;  relation return  integer , zero is false 
                                   1198 ;  output:
                                   1199 ;	 xstack		value  
                                   1200 ;---------------------------------------------
                           000001  1201 	RELOP=1
                           000001  1202 	VSIZE=1 
      001AE0                       1203 relation: 
      001AE0                       1204 	_vars VSIZE
      009AC4 00 03            [ 2]    1     sub sp,#VSIZE 
      009AC6 20 08 A8         [ 4] 1205 	call expression
      009AC8 4D               [ 1] 1206 	tnz a 
      009AC8 55 00            [ 1] 1207 	jreq 9$ 
                                   1208 ; expect rel_op or leave 
      009ACA 03 00 02         [ 4] 1209 	call next_token 
      009ACD 4F 20            [ 1] 1210 	ld (RELOP,sp),a 
      009ACF 12 30            [ 1] 1211 	and a,#TK_GRP_MASK
      009AD0 A1 30            [ 1] 1212 	cp a,#TK_GRP_RELOP 
      009AD0 0D 01            [ 1] 1213 	jreq 2$
      009AD2 27 03            [ 1] 1214 	ld a,#TK_INTGR 
      001AF5                       1215 	_unget_token 
      009AD4 CD 82 85 00 01   [ 1]    1      mov in,in.saved  
      009AD7 20 40            [ 2] 1216 	jra 9$ 
      001AFC                       1217 2$:	; expect another expression
      009AD7 72 A2 00         [ 4] 1218 	call expression
      009ADA 03               [ 1] 1219 	tnz a 
      009ADB 90 F7            [ 1] 1220 	jrne 3$
      009ADD 90 EF 01         [ 2] 1221 	jp syntax_error 
      001B05                       1222 3$: 
      009AE0 A6 84 A8         [ 4] 1223 	call cp24 
      009AE2                       1224 	_xpop  
      009AE2 5B 01            [ 1]    1     ld a,(y)
      009AE4 81               [ 1]    2     ldw x,y 
      009AE5 EE 01            [ 2]    3     ldw x,(1,x)
      009AE5 52 01 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      009AE9 30               [ 1] 1225 	tnz a 
      009AEA 4D 27            [ 1] 1226 	jrmi 4$
      009AEC 38 0C            [ 1] 1227 	jrne 5$
      009AED 35 02 00 0E      [ 1] 1228 	mov acc8,#2 ; i1==i2
      009AED CD 98            [ 2] 1229 	jra 6$ 
      001B1C                       1230 4$: ; i1<i2
      009AEF 1C 6B 01 A4      [ 1] 1231 	mov acc8,#4 
      009AF3 30 A1            [ 2] 1232 	jra 6$
      001B22                       1233 5$: ; i1>i2
      009AF5 20 27 09 A6      [ 1] 1234 	mov acc8,#1  
      001B26                       1235 6$: ; 0=false, -1=true 
      009AF9 84               [ 1] 1236 	clrw x 
      009AFA 55 00 03         [ 1] 1237 	ld a, acc8  
      009AFD 00 02            [ 1] 1238 	and a,(RELOP,sp)
      009AFF 20 24            [ 1] 1239 	jreq 7$
      009B01 53               [ 2] 1240 	cplw x 
      009B01 CD 9A            [ 1] 1241 	ld a,#255 
      001B31                       1242 7$:	_xpush 
      009B03 30 4D 26 03      [ 2]    1     subw y,#CELL_SIZE
      009B07 CC 96            [ 1]    2     ld (y),a 
      009B09 B8 EF 01         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009B0A A6 84            [ 1] 1243 	ld a,#TK_INTGR
      001B3C                       1244 9$: 
      001B3C                       1245 	_drop VSIZE
      009B0A 7B 01            [ 2]    1     addw sp,#VSIZE 
      009B0C A1               [ 4] 1246 	ret 
                                   1247 
                                   1248 ;-------------------------------------------
                                   1249 ;  AND factor:  [NOT] relation | (condition)
                                   1250 ;  output:
                                   1251 ;     A      TK_INTGR|0
                                   1252 ;-------------------------------------------
                           000001  1253 	NOT_OP=1
      001B3F                       1254 and_factor:
      009B0D 20 26            [ 1] 1255 	push #0 
      009B0F 05 CD 82         [ 4] 1256 0$:	call next_token  
      009B12 E9               [ 1] 1257 	tnz a 
      009B13 20 D8            [ 1] 1258 	jreq 8$ 
      009B15 A1 21            [ 1] 1259 	cp a,#TK_NOT 
      009B17 26 05            [ 1] 1260 	jrne 1$ 
      009B19 CD 83            [ 1] 1261 	cpl (NOT_OP,sp)
      009B1B 77 20            [ 2] 1262 	jra 0$ 
      001B4F                       1263 1$:	
      009B1D CF 06            [ 1] 1264 	cp a,#TK_LPAREN 
      009B1E 26 0A            [ 1] 1265 	jrne 2$
      009B1E CD 84 11         [ 4] 1266 	call condition
      009B21 20 CA            [ 1] 1267 	ld a,#TK_RPAREN 
      009B23 CD 19 52         [ 4] 1268 	call expect
      009B23 A6 84            [ 2] 1269 	jra 3$
      009B25                       1270 2$: _unget_token 
      009B25 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009B28 CD 1A E0         [ 4] 1271 	call relation
      001B65                       1272 3$:
      009B28 52 01            [ 1] 1273 	tnz (NOT_OP,sp)
      009B2A CD 9A            [ 1] 1274 	jreq 8$ 
      009B2C E5 4D 27         [ 4] 1275 	call cpl24
      001B6C                       1276 8$:
      001B6C                       1277 	_drop 1  
      009B2F 2D 01            [ 2]    1     addw sp,#1 
      009B30 81               [ 4] 1278     ret 
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
      001B6F                       1289 and_cond:
      009B30 CD 98 1C         [ 4] 1290 	call and_factor
      009B33 6B               [ 1] 1291 	tnz a 
      009B34 01 A4            [ 1] 1292 	jreq 9$  
      009B36 30 A1 10         [ 4] 1293 1$: call next_token 
      009B39 27               [ 1] 1294 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009B3A 09 55            [ 1] 1295 	jreq 6$ 
      009B3C 00 03            [ 1] 1296 	cp a,#TK_AND 
      009B3E 00 02            [ 1] 1297 	jreq 3$
      001B7F                       1298 	_unget_token 
      009B40 A6 84 20 19 01   [ 1]    1      mov in,in.saved  
      009B44 20 38            [ 2] 1299 	jra 6$ 
      009B44 CD 9A E5         [ 4] 1300 3$:	call and_factor  
      009B47 4D               [ 1] 1301 	tnz a 
      009B48 26 03            [ 1] 1302 	jrne 4$
      009B4A CC 96 B8         [ 2] 1303 	jp syntax_error 
      009B4D                       1304 4$:	
      001B8F                       1305 	_xpop 
      009B4D 7B 01            [ 1]    1     ld a,(y)
      009B4F A1               [ 1]    2     ldw x,y 
      009B50 10 26            [ 2]    3     ldw x,(1,x)
      009B52 05 CD 81 EE      [ 2]    4     addw y,#CELL_SIZE 
      009B56 20 D8 0C         [ 1] 1306 	ld acc24,a 
      009B58 CF 00 0D         [ 2] 1307 	ldw acc16,x
      001B9E                       1308 	_xpop 
      009B58 CD 82            [ 1]    1     ld a,(y)
      009B5A 0B               [ 1]    2     ldw x,y 
      009B5B 20 D3            [ 2]    3     ldw x,(1,x)
      009B5D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B5D 5B 01 81         [ 1] 1309 	and a,acc24 
      009B60 02               [ 1] 1310 	rlwa x 
      009B60 52 01 CD         [ 1] 1311 	and a,acc16 
      009B63 9B               [ 1] 1312 	rlwa x 
      009B64 28 4D 27         [ 1] 1313 	and a,acc8 
      009B67 54               [ 1] 1314 	rlwa x
      001BB3                       1315 	_xpush
      009B68 CD 98 1C 6B      [ 2]    1     subw y,#CELL_SIZE
      009B6C 01 A4            [ 1]    2     ld (y),a 
      009B6E 30 A1 30         [ 2]    3     ldw (1,y),x 
      009B71 27 09            [ 2] 1316 	jra 1$  
      009B73 A6 84            [ 1] 1317 6$: ld a,#TK_INTGR 
      009B75 55               [ 4] 1318 9$:	ret 	 
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
      001BC1                       1332 condition:
      001BC1                       1333 	_vars VSIZE 
      009B76 00 03            [ 2]    1     sub sp,#VSIZE 
      009B78 00 02 20         [ 4] 1334 	call and_cond
      009B7B 40               [ 1] 1335 	tnz a 
      009B7C 27 69            [ 1] 1336 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009B7C CD 9B 28         [ 4] 1337 1$:	call next_token 
      009B7F 4D 26            [ 1] 1338 	cp a,#TK_OR 
      009B81 03 CC            [ 1] 1339 	jreq 2$
      009B83 96 B8            [ 1] 1340 	cp a,#TK_XOR
      009B85 27 07            [ 1] 1341 	jreq 2$ 
      001BD4                       1342 	_unget_token 
      009B85 CD 82 28 90 F6   [ 1]    1      mov in,in.saved  
      009B8A 93 EE            [ 2] 1343 	jra 8$ 
      009B8C 01 72            [ 1] 1344 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009B8E A9 00 03         [ 4] 1345 	call and_cond
      009B91 4D 2B            [ 1] 1346 	cp a,#TK_INTGR 
      009B93 08 26            [ 1] 1347 	jreq 3$
      009B95 0C 35 02         [ 2] 1348 	jp syntax_error 
      001BE7                       1349 3$:	 
      001BE7                       1350 	_xpop  ; rigth arg 
      009B98 00 0F            [ 1]    1     ld a,(y)
      009B9A 20               [ 1]    2     ldw x,y 
      009B9B 0A 01            [ 2]    3     ldw x,(1,x)
      009B9C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B9C 35 04 00         [ 1] 1351 	ld acc24,a 
      009B9F 0F 20 04         [ 2] 1352 	ldw acc16,x 
      009BA2                       1353 	_xpop  ; left arg  
      009BA2 35 01            [ 1]    1     ld a,(y)
      009BA4 00               [ 1]    2     ldw x,y 
      009BA5 0F 01            [ 2]    3     ldw x,(1,x)
      009BA6 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009BA6 5F C6            [ 1] 1354 	ld (ATMP,sp),a 
      009BA8 00 0F            [ 1] 1355 	ld a,(OP,sp)
      009BAA 14 01            [ 1] 1356 	cp a,#TK_XOR 
      009BAC 27 03            [ 1] 1357 	jreq 5$ 
      001C07                       1358 4$: ; A:X OR acc24   
      009BAE 53 A6            [ 1] 1359 	ld a,(ATMP,sp)
      009BB0 FF 72 A2         [ 1] 1360 	or a,acc24 
      009BB3 00               [ 1] 1361 	rlwa x 
      009BB4 03 90 F7         [ 1] 1362 	or a,acc16 
      009BB7 90               [ 1] 1363 	rlwa x 
      009BB8 EF 01 A6         [ 1] 1364 	or a,acc8 
      009BBB 84               [ 1] 1365 	rlwa x 
      009BBC 20 0E            [ 2] 1366 	jra 6$  
      001C17                       1367 5$: ; A:X XOR acc24 
      009BBC 5B 01            [ 1] 1368 	ld a,(ATMP,sp)
      009BBE 81 00 0C         [ 1] 1369 	xor a,acc24 
      009BBF 02               [ 1] 1370 	rlwa x 
      009BBF 4B 00 CD         [ 1] 1371 	xor a,acc16 
      009BC2 98               [ 1] 1372 	rlwa x 
      009BC3 1C 4D 27         [ 1] 1373 	xor a,acc8 
      009BC6 25               [ 1] 1374 	rlwa x 
      001C25                       1375 6$: _xpush
      009BC7 A1 87 26 04      [ 2]    1     subw y,#CELL_SIZE
      009BCB 03 01            [ 1]    2     ld (y),a 
      009BCD 20 F2 01         [ 2]    3     ldw (1,y),x 
      009BCF 20 99            [ 2] 1376 	jra 1$ 
      009BCF A1 06            [ 1] 1377 8$:	ld a,#TK_INTGR 
      001C32                       1378 9$:	_drop VSIZE 
      009BD1 26 0A            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009BD3 CD               [ 4] 1379 	ret 
                                   1380 
                                   1381 
                                   1382 ;--------------------------------------------
                                   1383 ; BASIC: HEX 
                                   1384 ; select hexadecimal base for integer print
                                   1385 ;---------------------------------------------
      001C35                       1386 hex_base:
      009BD4 9C 41 A6 07      [ 1] 1387 	mov base,#16 
      009BD8 CD               [ 4] 1388 	ret 
                                   1389 
                                   1390 ;--------------------------------------------
                                   1391 ; BASIC: DEC 
                                   1392 ; select decimal base for integer print
                                   1393 ;---------------------------------------------
      001C3A                       1394 dec_base:
      009BD9 99 D2 20 08      [ 1] 1395 	mov base,#10
      009BDD 55               [ 4] 1396 	ret 
                                   1397 
                                   1398 ;------------------------
                                   1399 ; BASIC: FREE 
                                   1400 ; return free size in RAM 
                                   1401 ; output:
                                   1402 ;   A:x		size 
                                   1403 ;--------------------------
      001C3F                       1404 free:
      009BDE 00               [ 1] 1405 	clr a 
      009BDF 03 00 02         [ 2] 1406 	ldw x,#tib 
      009BE2 CD 9B 60 32      [ 2] 1407 	subw x,dvar_end 
      009BE5 81               [ 4] 1408 	ret 
                                   1409 
                                   1410 ;------------------------------
                                   1411 ; BASIC: SIZE 
                                   1412 ; command that print 
                                   1413 ; program start addres and size 
                                   1414 ;------------------------------
      001C48                       1415 cmd_size:
      009BE5 0D 01 27         [ 1] 1416 	push base 
      009BE8 03 CD 82         [ 2] 1417 	ldw x,#PROG_ADDR 
      009BEB 6A 09 3A         [ 4] 1418 	call puts 
      009BEC CE 00 1B         [ 2] 1419 	ldw x,txtbgn     
      009BEC 5B 01 81 0A      [ 1] 1420 	mov base,#16 
      009BEF CD 17 E4         [ 4] 1421 	call prt_i16
      009BEF CD 9B BF         [ 1] 1422 	pop base 
      009BF2 4D 27 4B         [ 2] 1423 	ldw x,#PROG_SIZE 
      009BF5 CD 98 1C         [ 4] 1424 	call puts 
      009BF8 4D 27 43         [ 2] 1425 	ldw x,txtend 
      009BFB A1 88 27 07      [ 2] 1426 	subw x,txtbgn 
      009BFF 55 00 03         [ 4] 1427 	call prt_i16
      009C02 00 02 20         [ 2] 1428 	ldw x,#STR_BYTES 
      009C05 38 CD 9B         [ 4] 1429 	call puts  
      009C08 BF               [ 4] 1430 	ret 
                                   1431 
                                   1432 
                                   1433 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1434 ; BASIC: UBOUND  
                                   1435 ; return array variable size 
                                   1436 ; and set 'array_size' variable 
                                   1437 ; output:
                                   1438 ;   A:X 	array_size
                                   1439 ;--------------------------
      001C75                       1440 ubound:
      009C09 4D 26 03         [ 4] 1441 	call free 
      009C0C CC 96            [ 1] 1442 	ld a,#CELL_SIZE 
      009C0E B8               [ 2] 1443 	div x,a 
      009C0F CF 00 20         [ 2] 1444 	ldw array_size,x
      009C0F 90               [ 1] 1445 	clr a 
      009C10 F6               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;-----------------------------
                                   1449 ; BASIC: LET var=expr 
                                   1450 ; variable assignement 
                                   1451 ; output:
                                   1452 ;   A 		TK_NONE 
                                   1453 ;-----------------------------
      001C80                       1454 let::
      009C11 93 EE 01         [ 4] 1455 	call next_token 
      009C14 72 A9            [ 1] 1456 	cp a,#TK_VAR 
      009C16 00 03            [ 1] 1457 	jreq let_var
      009C18 C7 00            [ 1] 1458 	cp a,#TK_ARRAY 
      009C1A 0D CF            [ 1] 1459 	jreq  let_array
      009C1C 00 0E 90         [ 2] 1460 	jp syntax_error
      001C8E                       1461 let_array:
      009C1F F6 93 EE         [ 4] 1462 	call get_array_element
      009C22 01 72            [ 2] 1463 	jra let_eval 
      001C93                       1464 let_var:
      009C24 A9 00 03         [ 4] 1465 	call get_addr
      001C96                       1466 let_eval:
      009C27 C4 00 0D         [ 2] 1467 	ldw ptr16,x  ; variable address 
      009C2A 02 C4 00         [ 4] 1468 	call next_token 
      009C2D 0E 02            [ 1] 1469 	cp a,#TK_EQUAL
      009C2F C4 00            [ 1] 1470 	jreq 1$
      009C31 0F 02 72         [ 2] 1471 	jp syntax_error
      001CA3                       1472 1$:	
      009C34 A2 00 03         [ 4] 1473 	call condition   
      009C37 90 F7            [ 1] 1474 	cp a,#TK_INTGR 
      009C39 90 EF            [ 1] 1475 	jreq 2$
      009C3B 01 20 B7         [ 2] 1476 	jp syntax_error
      001CAD                       1477 2$:	
      001CAD                       1478 	_xpop ; value 
      009C3E A6 84            [ 1]    1     ld a,(y)
      009C40 81               [ 1]    2     ldw x,y 
      009C41 EE 01            [ 2]    3     ldw x,(1,x)
      009C41 52 02 CD 9B      [ 2]    4     addw y,#CELL_SIZE 
      001CB6                       1479 3$:
      009C45 EF 4D 27 69      [ 4] 1480 	ld [ptr16],a
      009C49 CD 98 1C A1      [ 1] 1481 	inc ptr8  
      009C4D 89 27 0B A1      [ 5] 1482 	ldw [ptr16],x 
      009C51 8A               [ 4] 1483 	ret 
                                   1484 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1485 
                                   1486 ;--------------------------
                                   1487 ; return constant/dvar value 
                                   1488 ; from it's record address
                                   1489 ; input:
                                   1490 ;	X	*const record 
                                   1491 ; output:
                                   1492 ;   A:X   const  value
                                   1493 ;--------------------------
      001CC3                       1494 get_value: ; -- i 
      009C52 27               [ 1] 1495 	ld a,(x) ; record size 
      009C53 07 55            [ 1] 1496 	and a,#NAME_MAX_LEN
      009C55 00 03            [ 1] 1497 	sub a,#CELL_SIZE ; * value 
      009C57 00               [ 1] 1498 	push a 
      009C58 02 20            [ 1] 1499 	push #0 
      009C5A 55 6B 02         [ 2] 1500 	addw x,(1,sp)
      009C5D CD               [ 1] 1501 	ld a,(x)
      009C5E 9B EF            [ 2] 1502 	ldw x,(1,x)
      001CD1                       1503 	_drop 2
      009C60 A1 84            [ 2]    1     addw sp,#2 
      009C62 27               [ 4] 1504 	ret 
                                   1505 
                                   1506 
                                   1507 ;--------------------------
                                   1508 ; BASIC: EEFREE 
                                   1509 ; eeprom_free 
                                   1510 ; search end of data  
                                   1511 ; in EEPROM 
                                   1512 ; input:
                                   1513 ;    none 
                                   1514 ; output:
                                   1515 ;    A:X     address free
                                   1516 ;-------------------------
      001CD4                       1517 func_eefree:
      009C63 03 CC 96         [ 2] 1518 	ldw x,#EEPROM_BASE 
      009C66 B8 08 00 0E      [ 1] 1519 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009C67 A3 47 F8         [ 2] 1520     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009C67 90 F6            [ 1] 1521 	jruge 8$ ; no free space 
      009C69 93               [ 1] 1522 2$: ld a,(x)
      009C6A EE 01            [ 1] 1523 	jrne 3$
      009C6C 72               [ 1] 1524 	incw x 
      009C6D A9 00 03 C7      [ 1] 1525 	dec acc8 
      009C71 00 0D            [ 1] 1526 	jrne 2$
      009C73 CF 00 0E         [ 2] 1527 	subw x,#8 
      009C76 90 F6            [ 2] 1528 	jra 9$  
      009C78 93               [ 1] 1529 3$: ld a,(x)
      009C79 EE               [ 1] 1530 	incw x
      009C7A 01               [ 1] 1531 	tnz a  
      009C7B 72 A9            [ 1] 1532 	jrne 3$
      009C7D 00               [ 2] 1533 	decw x   
      009C7E 03 6B            [ 2] 1534 	jra 1$ 
      009C80 01               [ 1] 1535 8$: clrw x ; no free space 
      009C81 7B               [ 1] 1536 9$: clr a 
      009C82 02 A1 8A         [ 2] 1537 	ldw free_eeprom,x ; save in system variable 
      009C85 27               [ 4] 1538 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                   1539 
                           000005  1540 REC_XTRA_BYTES=5 
                                   1541 ;--------------------------
                                   1542 ; search constant/dim_var name 
                                   1543 ; format of record  
                                   1544 ;   .byte record length 
                                   1545 ;         = strlen(name)+5 
                                   1546 ;   .asciz name (variable length)
                                   1547 ;   .int24 value (3 bytes )
                                   1548 ; a constant record use 7+ bytes
                                   1549 ; constants are saved in EEPROM  
                                   1550 ; input:
                                   1551 ;    A     record_len 
                                   1552 ;    X     *name
                                   1553 ; output:
                                   1554 ;    X     address|0
                                   1555 ; use:
                                   1556 ;   A,Y, acc16 
                                   1557 ;-------------------------
                           000001  1558 	NAMEPTR=1 ; target name pointer 
                           000003  1559 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1560 	RECLEN=5  ; record length of target
                           000007  1561 	LIMIT=7   ; search area limit 
                           000008  1562 	VSIZE=8  
      001CFD                       1563 search_name:
      009C86 10 89            [ 2] 1564 	pushw y 
      009C87                       1565 	_vars VSIZE
      009C87 7B 01            [ 2]    1     sub sp,#VSIZE 
      009C89 CA 00 0D 02      [ 1] 1566 	clr acc16 
      009C8D CA 00            [ 1] 1567 	ld (RECLEN,sp),a    
      009C8F 0E 02            [ 2] 1568 	ldw (NAMEPTR,sp),x
      009C91 CA 00 0F         [ 2] 1569 	ldw x,dvar_end 
      009C94 02 20            [ 2] 1570 	ldw (LIMIT,sp),x 
      009C96 0E CE 00 30      [ 2] 1571 	ldw y,dvar_bgn
      009C97 17 03            [ 2] 1572 1$:	ldw (WLKPTR,sp),y
      009C97 7B               [ 1] 1573 	ldw x,y 
      009C98 01 C8            [ 2] 1574 	cpw x, (LIMIT,sp) 
      009C9A 00 0D            [ 1] 1575 	jruge 7$ ; no match found 
      009C9C 02 C8            [ 1] 1576 	ld a,(y)
      009C9E 00 0E            [ 1] 1577 	and a,#NAME_MAX_LEN
      009CA0 02 C8            [ 1] 1578 	cp a,(RECLEN,sp)
      009CA2 00 0F            [ 1] 1579 	jrne 2$ 
      009CA4 02 72            [ 1] 1580 	incw y 
      009CA6 A2 00            [ 2] 1581 	ldw x,(NAMEPTR,sp)
      009CA8 03 90 F7         [ 4] 1582 	call strcmp
      009CAB 90 EF            [ 1] 1583 	jrne 8$ ; match found 
      001D2A                       1584 2$: ; skip this one 	
      009CAD 01 20            [ 2] 1585 	ldW Y,(WLKPTR,sp)
      009CAF 99 A6            [ 1] 1586 	ld a,(y)
      009CB1 84 5B            [ 1] 1587 	and a,#NAME_MAX_LEN 
      009CB3 02 81 0E         [ 1] 1588 	ld acc8,a 
      009CB5 72 B9 00 0D      [ 2] 1589 	addw y,acc16 
      009CB5 35 10            [ 2] 1590 	jra 1$  
      001D39                       1591 7$: ; no match found 
      009CB7 00 0B            [ 1] 1592 	clr (WLKPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009CB9 81 04            [ 1] 1593 	clr (WLKPTR+1,sp)
      009CBA                       1594 8$: ; match found 
      009CBA 35 0A            [ 2] 1595 	ldw x,(WLKPTR,sp) ; record address 
      001D3F                       1596 9$:	_DROP VSIZE
      009CBC 00 0B            [ 2]    1     addw sp,#VSIZE 
      009CBE 81 85            [ 2] 1597 	popw y 
      009CBF 81               [ 4] 1598 	 ret 
                                   1599 
                                   1600 ;--------------------------------------------
                                   1601 ; BASIC: CONST name=value [, name=value]*
                                   1602 ; define constant(s) saved in EEPROM
                                   1603 ; share most of his code with cmd_dim 
                                   1604 ;--------------------------------------------
                           000001  1605 	VAR_NAME=1 
                           000003  1606 	REC_LEN=3
                           000005  1607 	RONLY=5
                           000005  1608 	VSIZE=5
      001D44                       1609 cmd_const:
      009CBF 4F AE 16 90 72   [ 2] 1610 	btjt flags,#FRUN,0$
      009CC4 B0 00            [ 1] 1611 	ld a,#ERR_RUN_ONLY
      009CC6 33 81 3A         [ 2] 1612 	jp tb_error 
      009CC8                       1613 0$: 
      001D4E                       1614 	_vars VSIZE 
      009CC8 3B 00            [ 2]    1     sub sp,#VSIZE 
      009CCA 0B AE            [ 1] 1615 	ld a,#128 
      009CCC 9E B5            [ 1] 1616 	ld (RONLY,sp),a 
      009CCE CD 89            [ 1] 1617 	clr (REC_LEN,sp)
      009CD0 BA CE            [ 2] 1618 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1619 
                                   1620 ;---------------------------------
                                   1621 ; BASIC: DIM var_name [var_name]* 
                                   1622 ; create named variables at end 
                                   1623 ; of BASIC program. 
                                   1624 ; These variables are initialized 
                                   1625 ; to 0. 
                                   1626 ; record format same ast CONST 
                                   1627 ; but r/w because stored in RAM 
                                   1628 ;---------------------------------
      001D58                       1629 cmd_dim:
      009CD2 00 1C 35 10 00   [ 2] 1630 	btjt flags,#FRUN,cmd_dim1
      009CD7 0B CD            [ 1] 1631 	ld a,#ERR_RUN_ONLY
      009CD9 98 64 32         [ 2] 1632 	jp tb_error 
      001D62                       1633 cmd_dim1:	
      001D62                       1634 	_vars VSIZE
      009CDC 00 0B            [ 2]    1     sub sp,#VSIZE 
      009CDE AE 9E            [ 1] 1635 	clr (REC_LEN,sp )
      009CE0 C7 CD            [ 1] 1636 	clr (RONLY,sp)
      001D68                       1637 cmd_dim2: 
      009CE2 89 BA CE         [ 4] 1638 0$:	call next_token 
      009CE5 00 1E            [ 1] 1639 	cp a,#TK_LABEL  
      009CE7 72 B0            [ 1] 1640 	jreq 1$ 
      009CE9 00 1C CD         [ 2] 1641 	jp syntax_error 
      009CEC 98 64            [ 2] 1642 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009CEE AE 9E D8         [ 4] 1643 	call strlen
      009CF1 CD 89            [ 1] 1644 	add a,#REC_XTRA_BYTES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009CF3 BA 81            [ 1] 1645 	ld (REC_LEN+1,sp),a
      009CF5 CD 17 B5         [ 4] 1646 	call skip_string 
      009CF5 CD 9C            [ 1] 1647 	ld a,(REC_LEN+1,sp)
      009CF7 BF A6            [ 2] 1648 	ldw x,(VAR_NAME,sp) 
      009CF9 03 62 CF         [ 4] 1649 	call search_name  
      009CFC 00               [ 2] 1650 	tnzw x 
      009CFD 21 4F            [ 1] 1651 	jreq 2$
      009CFF 81 08            [ 1] 1652 	ld a,#ERR_DUPLICATE
      009D00 CC 16 3A         [ 2] 1653 	jp tb_error  
      009D00 CD 98 1C         [ 2] 1654 2$:	ldw x,dvar_end 
      009D03 A1 85            [ 1] 1655 	ld a,(REC_LEN+1,sp)
      009D05 27 0C            [ 1] 1656 	or a,(RONLY,sp)
      009D07 A1               [ 1] 1657 	ld (x),a 
      009D08 05               [ 1] 1658 	incw x 
      009D09 27 03            [ 2] 1659 	pushw y 
      009D0B CC 96            [ 2] 1660 	ldw y,(VAR_NAME+2,sp)
      009D0D B8 13 74         [ 4] 1661 	call strcpy
      009D0E 90 85            [ 2] 1662 	popw y 
      009D0E CD               [ 2] 1663 	decw x
      009D0F 9A 00 20         [ 2] 1664 	addw x,(REC_LEN,sp)
      009D12 03 00 32         [ 2] 1665 	ldw dvar_end,x 
      009D13 1D 00 03         [ 2] 1666 	subw x,#CELL_SIZE  
      009D13 CD               [ 1] 1667 	clr (x)
      009D14 98 44            [ 1] 1668 	clr (1,x)  
      009D16 6F 02            [ 1] 1669 	clr (2,x)
      009D16 CF 00 1A         [ 4] 1670 4$: call next_token 
      009D19 CD 98            [ 1] 1671 	cp a,#TK_COMMA 
      009D1B 1C A1            [ 1] 1672 	jreq 0$ 
      009D1D 32 27            [ 1] 1673 	cp a,#TK_EQUAL 
      009D1F 03 CC            [ 1] 1674 	jrne 8$
                                   1675 ; initialize variable 
      009D21 96 B8 C1         [ 4] 1676 	call condition 
      009D23 A1 84            [ 1] 1677 	cp a,#TK_INTGR
      009D23 CD 9C            [ 1] 1678 	jreq 5$
      009D25 41 A1 84         [ 2] 1679 	jp syntax_error
      009D28 27 03 CC         [ 2] 1680 5$: ldw x,dvar_end 
      009D2B 96 B8 03         [ 2] 1681 	subw x,#CELL_SIZE 
      009D2D CF 00 19         [ 2] 1682 	ldw ptr16,x 
      001DCC                       1683 	_xpop 
      009D2D 90 F6            [ 1]    1     ld a,(y)
      009D2F 93               [ 1]    2     ldw x,y 
      009D30 EE 01            [ 2]    3     ldw x,(1,x)
      009D32 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D36 72 C7 00 19      [ 4] 1684 	ld [ptr16],a 
      009D36 72 C7 00 1A      [ 1] 1685 	inc ptr8 
      009D3A 72 5C 00 1B      [ 5] 1686 	ldw [ptr16],x 
      009D3E 72 CF            [ 2] 1687 	jra 4$ 
      001DE3                       1688 8$:	
      001DE3                       1689 	_unget_token 	
      009D40 00 1A 81 00 01   [ 1]    1      mov in,in.saved  
      009D43                       1690 	_drop VSIZE 
      009D43 F6 A4            [ 2]    1     addw sp,#VSIZE 
      009D45 0F A0 03         [ 4] 1691 	call ubound 
      009D48 88               [ 4] 1692 	ret 
                                   1693 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1694 
                                   1695 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1696 ; return program size 
                                   1697 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001DEE                       1698 prog_size:
      009D49 4B 00 72         [ 2] 1699 	ldw x,txtend 
      009D4C FB 01 F6 EE      [ 2] 1700 	subw x,txtbgn 
      009D50 01               [ 4] 1701 	ret 
                                   1702 
                                   1703 ;----------------------------
                                   1704 ; print program information 
                                   1705 ;---------------------------
      001DF6                       1706 program_info: 
      009D51 5B 02 81         [ 2] 1707 	ldw x,#PROG_ADDR 
      009D54 CD 09 3A         [ 4] 1708 	call puts 
      009D54 AE 40 00         [ 2] 1709 	ldw x,txtbgn 
      009D57 35 08 00 0F      [ 1] 1710 	mov base,#16 
      009D5B A3 47 F8         [ 4] 1711 	call prt_i16
      009D5E 24 17 F6 26      [ 1] 1712 	mov base,#10  
      009D62 0C 5C 72         [ 2] 1713 	ldw x,#PROG_SIZE
      009D65 5A 00 0F         [ 4] 1714 	call puts 
      009D68 26 F6 1D         [ 4] 1715 	call prog_size 
      009D6B 00 08 20         [ 4] 1716 	call prt_i16 
      009D6E 09 F6 5C         [ 2] 1717 	ldw x,#STR_BYTES 
      009D71 4D 26 FB         [ 4] 1718 	call puts
      009D74 5A 20 E0         [ 2] 1719 	ldw x,txtbgn
      009D77 5F 4F CF         [ 2] 1720 	cpw x,#app 
      009D7A 00 25            [ 1] 1721 	jrult 2$
      009D7C 81 1E 5F         [ 2] 1722 	ldw x,#FLASH_MEM 
      009D7D 20 03            [ 2] 1723 	jra 3$
      009D7D 90 89 52         [ 2] 1724 2$: ldw x,#RAM_MEM 	 
      009D80 08 72 5F         [ 4] 1725 3$:	call puts 
      009D83 00 0E            [ 1] 1726 	ld a,#CR 
      009D85 6B 05 1F         [ 4] 1727 	call putc
      009D88 01               [ 4] 1728 	ret 
                                   1729 
      009D89 CE 00 33 1F 07 90 CE  1730 PROG_ADDR: .asciz "program address: "
             00 31 17 03 93 13 07
             24 20 90 F6
      009D9B A4 0F 11 05 26 09 90  1731 PROG_SIZE: .asciz ", program size: "
             5C 1E 01 CD 93 E3 26
             13 20 00
      009DAA 20 62 79 74 65 73 00  1732 STR_BYTES: .asciz " bytes" 
      009DAA 16 03 90 F6 A4 0F C7  1733 FLASH_MEM: .asciz " in FLASH memory" 
             00 0F 72 B9 00 0E 20
             D9 79 00
      009DB9 20 69 6E 20 52 41 4D  1734 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1735 
                                   1736 
                                   1737 ;----------------------------
                                   1738 ; BASIC: LIST [[start][,end]]
                                   1739 ; list program lines 
                                   1740 ; form start to end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   1741 ; if empty argument list then 
                                   1742 ; list all.
                                   1743 ;----------------------------
                           000001  1744 	FIRST=1
                           000003  1745 	LAST=3 
                           000005  1746 	LN_PTR=5
                           000006  1747 	VSIZE=6 
      001E7F                       1748 list:
      009DB9 0F 03 0F 04 05   [ 2] 1749 	btjf flags,#FRUN,0$
      009DBD A6 07            [ 1] 1750 	ld a,#ERR_CMD_ONLY
      009DBD 1E 03 5B         [ 2] 1751 	jp tb_error
      001E89                       1752 0$:	 
      009DC0 08 90 85         [ 4] 1753 	call prog_size 
      009DC3 81 01            [ 1] 1754 	jrugt 3$
      009DC4 81               [ 4] 1755 	ret 
      001E8F                       1756 3$: _vars VSIZE
      009DC4 72 00            [ 2]    1     sub sp,#VSIZE 
      009DC6 00 23 05         [ 2] 1757 	ldw x,txtbgn 
      009DC9 A6 06            [ 2] 1758 	ldw (LN_PTR,sp),x 
      009DCB CC               [ 2] 1759 	ldw x,(x) 
      009DCC 96 BA            [ 2] 1760 	ldw (FIRST,sp),x ; list from first line 
      009DCE AE 7F FF         [ 2] 1761 	ldw x,#MAX_LINENO ; biggest line number 
      009DCE 52 05            [ 2] 1762 	ldw (LAST,sp),x 
      009DD0 A6 80 6B         [ 4] 1763 	call arg_list
      009DD3 05               [ 1] 1764 	tnz a
      009DD4 0F 03            [ 1] 1765 	jreq list_loop 
      009DD6 20 10            [ 1] 1766 	cp a,#2 
      009DD8 27 07            [ 1] 1767 	jreq 4$
      009DD8 72 00            [ 1] 1768 	cp a,#1 
      009DDA 00 23            [ 1] 1769 	jreq first_line 
      009DDC 05 A6 06         [ 2] 1770 	jp syntax_error 
      009DDF CC               [ 2] 1771 4$:	popw x 
      009DE0 96 BA            [ 2] 1772 	ldw (LAST+2,sp),x 
      009DE2                       1773 first_line:
      009DE2 52               [ 2] 1774 	popw x
      009DE3 05 0F            [ 2] 1775 	ldw (FIRST,sp),x 
      001EB5                       1776 lines_skip:
      009DE5 03 0F 05         [ 2] 1777 	ldw x,txtbgn
      009DE8 1F 05            [ 2] 1778 2$:	ldw (LN_PTR,sp),x 
      009DE8 CD 98 1C         [ 2] 1779 	cpw x,txtend 
      009DEB A1 03            [ 1] 1780 	jrpl list_exit 
      009DED 27               [ 2] 1781 	ldw x,(x) ;line# 
      009DEE 03 CC            [ 2] 1782 	cpw x,(FIRST,sp)
      009DF0 96 B8            [ 1] 1783 	jrpl list_loop 
      009DF2 1F 01            [ 2] 1784 	ldw x,(LN_PTR,sp) 
      009DF4 CD 93            [ 1] 1785 	ld a,(2,x)
      009DF6 D8 AB 05         [ 1] 1786 	ld acc8,a 
      009DF9 6B 04 CD 98      [ 1] 1787 	clr acc16 
      009DFD 35 7B 04 1E      [ 2] 1788 	addw x,acc16
      009E01 01 CD            [ 2] 1789 	jra 2$ 
                                   1790 ; print loop
      001ED5                       1791 list_loop:
      009E03 9D 7D            [ 2] 1792 	ldw x,(LN_PTR,sp)
      009E05 5D 27            [ 1] 1793 	ld a,(2,x) 
      009E07 05 A6 08         [ 4] 1794 	call prt_basic_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009E0A CC 96            [ 2] 1795 	ldw x,(LN_PTR,sp)
      009E0C BA CE            [ 1] 1796 	ld a,(2,x)
      009E0E 00 33 7B         [ 1] 1797 	ld acc8,a 
      009E11 04 1A 05 F7      [ 1] 1798 	clr acc16 
      009E15 5C 90 89 16      [ 2] 1799 	addw x,acc16
      009E19 03 CD 93         [ 2] 1800 	cpw x,txtend 
      009E1C F4 90            [ 1] 1801 	jrpl list_exit
      009E1E 85 5A            [ 2] 1802 	ldw (LN_PTR,sp),x
      009E20 72               [ 2] 1803 	ldw x,(x)
      009E21 FB 03            [ 2] 1804 	cpw x,(LAST,sp)  
      009E23 CF 00            [ 1] 1805 	jrslt list_loop
      001EF7                       1806 list_exit:
      009E25 33 1D 00 03 7F   [ 1] 1807 	mov in,count 
      009E2A 6F 01 6F         [ 2] 1808 	ldw x,#pad 
      009E2D 02 CD 98         [ 2] 1809 	ldw basicptr,x 
      001F02                       1810 	_drop VSIZE 
      009E30 1C A1            [ 2]    1     addw sp,#VSIZE 
      009E32 08 27 B3         [ 4] 1811 	call program_info 
      009E35 A1               [ 4] 1812 	ret
                                   1813 
                                   1814 
                                   1815 ;--------------------------
                                   1816 ; BASIC: EDIT 
                                   1817 ;  copy program in FLASH 
                                   1818 ;  to RAM for edition 
                                   1819 ;-------------------------
      001F08                       1820 edit:
      009E36 32 26 2A         [ 2] 1821 	ldw x,#app_space
      009E39 CD 9C 41         [ 4] 1822 	call qsign 
      009E3C A1 84            [ 1] 1823 	jreq 1$ 
      009E3E 27 03 CC         [ 2] 1824 	ldw x,#NOT_SAVED 
      009E41 96 B8 CE         [ 4] 1825 	call puts 
      009E44 00               [ 4] 1826 	ret 
      001F17                       1827 1$: 
      009E45 33 1D 00 03      [ 2] 1828 	ldw y,#app_sign ; source address 
      009E49 CF 00 1A         [ 2] 1829     ldw x,app_size  
      009E4C 90 F6 93         [ 2] 1830 	addw x,#4 
      009E4F EE 01 72         [ 2] 1831 	ldw acc16,x  ; bytes to copy 
      009E52 A9 00 03         [ 2] 1832 	ldw x,#rsign ; destination address 
      009E55 72 C7 00         [ 4] 1833 	call move  
      009E58 1A 72 5C         [ 2] 1834 	ldw x,#free_ram 
      009E5B 00 1B 72         [ 2] 1835 	ldw txtbgn,x 
      009E5E CF 00 1A 20      [ 2] 1836 	addw x,rsize  
      009E62 CB 00 1D         [ 2] 1837 	ldw txtend,x 
      009E63 81               [ 4] 1838 	ret 
                                   1839 
      009E63 55 00 03 00 02 5B 05  1840 NOT_SAVED: .asciz "No application saved.\n"
             CD 9C F5 81 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1841 
                                   1842 
                                   1843 ;--------------------------
                                   1844 ; decompile line from token list
                                   1845 ; and print it. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1846 ; input:
                                   1847 ;   A       stop at this position 
                                   1848 ;   X 		pointer at line
                                   1849 ; output:
                                   1850 ;   none 
                                   1851 ;--------------------------	
      009E6E                       1852 prt_basic_line:
      009E6E CE 00            [ 2] 1853 	pushw y 
      009E70 1E 72 B0         [ 1] 1854 	ld count,a 
      009E73 00 1C            [ 1] 1855 	ld a,(2,x)
      009E75 81 00 03         [ 1] 1856 	cp a,count 
      009E76 2A 03            [ 1] 1857 	jrpl 1$ 
      009E76 AE 9E B5         [ 1] 1858 	ld count,a 
      009E79 CD 89 BA         [ 2] 1859 1$:	ldw basicptr,x 
      009E7C CE 00 1C 35      [ 2] 1860 	ldw y,#tib  
      009E80 10 00 0B         [ 4] 1861 	call decompile 
      009E83 CD 98 64         [ 4] 1862 	call puts 
      009E86 35 0A            [ 1] 1863 	ld a,#CR 
      009E88 00 0B AE         [ 4] 1864 	call putc 
      009E8B 9E C7            [ 2] 1865 	popw y 
      009E8D CD               [ 4] 1866 	ret 
                                   1867 
                                   1868 
                                   1869 ;---------------------------------
                                   1870 ; BASIC: PRINT|? arg_list 
                                   1871 ; print values from argument list
                                   1872 ;----------------------------------
                           000001  1873 	CCOMMA=1
                           000001  1874 	VSIZE=1
      001F73                       1875 print:
      001F73                       1876 	_vars VSIZE 
      009E8E 89 BA            [ 2]    1     sub sp,#VSIZE 
      001F75                       1877 reset_comma:
      009E90 CD 9E            [ 1] 1878 	clr (CCOMMA,sp)
      001F77                       1879 prt_loop:
      009E92 6E CD 98         [ 4] 1880 	call next_token
      009E95 64 AE            [ 1] 1881 	cp a,#CMD_END 
      009E97 9E D8            [ 1] 1882 	jrult 0$
      009E99 CD 89            [ 1] 1883 	cp a,#TK_COLON 
      009E9B BA CE            [ 1] 1884 	jreq 0$
      009E9D 00 1C            [ 1] 1885 	cp a,#TK_CMD
      009E9F A3 B7            [ 1] 1886 	jrne 10$
      001F86                       1887 0$:
      001F86                       1888 	_unget_token 
      009EA1 04 25 05 AE 9E   [ 1]    1      mov in,in.saved  
      009EA6 DF 20            [ 2] 1889 	jra 8$ 
      001F8D                       1890 10$:	
      009EA8 03 AE            [ 1] 1891 	cp a,#TK_QSTR
      009EAA 9E F0            [ 1] 1892 	jreq 1$
      009EAC CD 89            [ 1] 1893 	cp a,#TK_CHAR 
      009EAE BA A6            [ 1] 1894 	jreq 2$ 
      009EB0 0D CD            [ 1] 1895 	cp a,#TK_CFUNC 
      009EB2 89 5D            [ 1] 1896 	jreq 3$
      009EB4 81 70            [ 1] 1897 	cp a,#TK_COMMA 
      009EB6 72 6F            [ 1] 1898 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009EB8 67 72            [ 1] 1899 	cp a,#TK_SHARP 
      009EBA 61 6D            [ 1] 1900 	jreq 5$
      009EBC 20 61            [ 2] 1901 	jra 7$ 
      001FA3                       1902 1$:	; print string 
      009EBE 64 64 72         [ 4] 1903 	call puts
      009EC1 65               [ 1] 1904 	incw x
      009EC2 73 73 3A 20      [ 2] 1905 	subw x,basicptr 
      009EC6 00 2C 20         [ 2] 1906 	ldw in.w,x  
      009EC9 70 72            [ 2] 1907 	jra reset_comma
      001FB0                       1908 2$:	; print character 
      009ECB 6F 67 72         [ 4] 1909 	call get_char 
      009ECE 61 6D 20         [ 4] 1910 	call putc 
      009ED1 73 69            [ 2] 1911 	jra reset_comma 
      001FB8                       1912 3$: ; print character function value  	
      001FB8                       1913 	_get_code_addr 
      009ED3 7A               [ 2]    1         ldw x,(x)
      009ED4 65 3A 20 00      [ 1]    2         inc in 
      009ED8 20 62 79 74      [ 1]    3         inc in 
      009EDC 65               [ 4] 1914 	call (x)
      009EDD 73 00 20         [ 4] 1915 	call putc
      009EE0 69 6E            [ 2] 1916 	jra reset_comma 
      001FC7                       1917 4$: ; set comma state 
      009EE2 20 46            [ 1] 1918 	cpl (CCOMMA,sp)
      009EE4 4C 41            [ 2] 1919 	jra prt_loop   
      001FCB                       1920 5$: ; # character must be followed by an integer   
      009EE6 53 48 20         [ 4] 1921 	call next_token
      009EE9 6D 65            [ 1] 1922 	cp a,#TK_INTGR 
      009EEB 6D 6F            [ 1] 1923 	jreq 6$
      009EED 72 79 00         [ 2] 1924 	jp syntax_error 
      001FD5                       1925 6$: ; set tab width
      009EF0 20 69 6E         [ 4] 1926 	call get_int24 
      009EF3 20               [ 1] 1927 	ld a,xl 
      009EF4 52 41            [ 1] 1928 	and a,#15 
      009EF6 4D 20 6D         [ 1] 1929 	ld tab_width,a 
      009EF9 65 6D            [ 2] 1930 	jra reset_comma 
      001FE0                       1931 7$:	
      001FE0                       1932 	_unget_token 
      009EFB 6F 72 79 00 01   [ 1]    1      mov in,in.saved  
      009EFF CD 1B C1         [ 4] 1933 	call condition
      009EFF 72               [ 1] 1934 	tnz a 
      009F00 01 00            [ 1] 1935 	jreq 8$    
      009F02 23 05 A6         [ 4] 1936     call print_top
      009F05 07 CC            [ 2] 1937 	jra reset_comma 
      001FF0                       1938 8$:
      009F07 96 BA            [ 1] 1939 	tnz (CCOMMA,sp)
      009F09 26 05            [ 1] 1940 	jrne 9$
      009F09 CD 9E            [ 1] 1941 	ld a,#CR 
      009F0B 6E 22 01         [ 4] 1942     call putc 
      001FF9                       1943 9$:	_drop VSIZE 
      009F0E 81 52            [ 2]    1     addw sp,#VSIZE 
      009F10 06               [ 4] 1944 	ret 
                                   1945 
                                   1946 ;----------------------
                                   1947 ; 'save_context' and
                                   1948 ; 'rest_context' must be 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1949 ; called at the same 
                                   1950 ; call stack depth 
                                   1951 ; i.e. SP must have the 
                                   1952 ; save value at  
                                   1953 ; entry point of both 
                                   1954 ; routine. 
                                   1955 ;---------------------
                           000004  1956 	CTXT_SIZE=4 ; size of saved data 
                                   1957 ;--------------------
                                   1958 ; save current BASIC
                                   1959 ; interpreter context 
                                   1960 ; on stack 
                                   1961 ;--------------------
      001FFC                       1962 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001FFC                       1963 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001FFC                       1964 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001FFC                       1965 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001FFC                       1966 save_context:
      009F11 CE 00 1C         [ 2] 1967 	ldw x,basicptr 
      009F14 1F 05            [ 2] 1968 	ldw (BPTR,sp),x
      009F16 FE 1F 01         [ 1] 1969 	ld a,in 
      009F19 AE 7F            [ 1] 1970 	ld (IN,sp),a
      009F1B FF 1F 03         [ 1] 1971 	ld a,count 
      009F1E CD 99            [ 1] 1972 	ld (CNT,sp),a  
      009F20 E4               [ 4] 1973 	ret
                                   1974 
                                   1975 ;-----------------------
                                   1976 ; restore previously saved 
                                   1977 ; BASIC interpreter context 
                                   1978 ; from stack 
                                   1979 ;-------------------------
      00200C                       1980 rest_context:
      009F21 4D 27            [ 2] 1981 	ldw x,(BPTR,sp)
      009F23 31 A1 02         [ 2] 1982 	ldw basicptr,x 
      009F26 27 07            [ 1] 1983 	ld a,(IN,sp)
      009F28 A1 01 27         [ 1] 1984 	ld in,a
      009F2B 06 CC            [ 1] 1985 	ld a,(CNT,sp)
      009F2D 96 B8 85         [ 1] 1986 	ld count,a  
      009F30 1F               [ 4] 1987 	ret
                                   1988 
                                   1989 
                                   1990 
                                   1991 ;------------------------------------------
                                   1992 ; BASIC: INPUT [string]var[,[string]var]
                                   1993 ; input value in variables 
                                   1994 ; [string] optionally can be used as prompt 
                                   1995 ;-----------------------------------------
                           000001  1996 	CX_BPTR=1
                           000003  1997 	CX_IN=3
                           000004  1998 	CX_CNT=4
                           000005  1999 	SKIP=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                           000005  2000 	VSIZE=5
      00201C                       2001 input_var:
      009F31 05 89            [ 2] 2002 	pushw y 
      009F32                       2003 	_vars VSIZE 
      009F32 85 1F            [ 2]    1     sub sp,#VSIZE 
      002020                       2004 input_loop:
      009F34 01 05            [ 1] 2005 	clr (SKIP,sp)
      009F35 CD 17 9C         [ 4] 2006 	call next_token 
      009F35 CE 00            [ 1] 2007 	cp a,#TK_QSTR 
      009F37 1C 1F            [ 1] 2008 	jrne 1$ 
      009F39 05 C3 00         [ 4] 2009 	call puts 
      009F3C 1E               [ 1] 2010 	incw x 
      009F3D 2A 38 FE 13      [ 2] 2011 	subw x,basicptr 
      009F41 01 2A 11         [ 2] 2012 	ldw in.w,x 
      009F44 1E 05            [ 1] 2013 	cpl (SKIP,sp)
      009F46 E6 02 C7         [ 4] 2014 	call next_token 
      009F49 00 0F            [ 1] 2015 1$: cp a,#TK_VAR  
      009F4B 72 5F            [ 1] 2016 	jreq 2$ 
      009F4D 00 0E 72         [ 2] 2017 	jp syntax_error
      009F50 BB 00 0E         [ 4] 2018 2$:	call get_addr
      009F53 20 E3 19         [ 2] 2019 	ldw ptr16,x 
      009F55 0D 05            [ 1] 2020 	tnz (SKIP,sp)
      009F55 1E 05            [ 1] 2021 	jrne 21$ 
      009F57 E6 02 CD         [ 4] 2022 	call var_name 
      009F5A 9F CF 1E         [ 4] 2023 	call putc   
      002050                       2024 21$:
      009F5D 05 E6            [ 1] 2025 	ld a,#':
      009F5F 02 C7 00         [ 4] 2026 	call putc 
      009F62 0F 72 5F         [ 4] 2027 	call save_context 
      009F65 00 0E 72 BB      [ 1] 2028 	clr count  
      009F69 00 0E C3         [ 4] 2029 	call readln 
      009F6C 00 1E 2A         [ 2] 2030 	ldw x,#tib 
      009F6F 07 1F 05         [ 1] 2031 	push count
      009F72 FE 13            [ 1] 2032 	push #0 
      009F74 03 2F DE         [ 2] 2033 	addw x,(1,sp)
      009F77 5C               [ 1] 2034 	incw x 
      00206B                       2035 	_drop 2 
      009F77 55 00            [ 2]    1     addw sp,#2 
      009F79 04 00 02 AE      [ 1] 2036 	clr in 
      009F7D 16 E0 CF         [ 4] 2037 	call get_token
      009F80 00 05            [ 1] 2038 	cp a,#TK_INTGR
      009F82 5B 06            [ 1] 2039 	jreq 3$ 
      009F84 CD 9E            [ 1] 2040 	cp a,#TK_MINUS
      009F86 76 81            [ 1] 2041 	jrne 22$
      009F88 CD 0E B4         [ 4] 2042 	call get_token 
      009F88 AE B7            [ 1] 2043 	cp a,#TK_INTGR 
      009F8A 00 CD            [ 1] 2044 	jreq 23$
      002083                       2045 22$:
      009F8C A8 30 27         [ 4] 2046 	call rest_context 
      009F8F 07 AE 9F         [ 2] 2047 	jp syntax_error
      002089                       2048 23$:
      009F92 B8 CD 89         [ 4] 2049 	call neg_acc24	
      00208C                       2050 3$: 
      009F95 BA 81 0C         [ 1] 2051 	ld a,acc24 
      009F97 CE 00 0D         [ 2] 2052 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009F97 90 AE B7 00      [ 4] 2053 	ld [ptr16],a
      009F9B CE B7 02 1C      [ 1] 2054 	inc ptr8  
      009F9F 00 04 CF 00      [ 5] 2055 	ldw [ptr16],x 
      009FA3 0E AE 00         [ 4] 2056 	call rest_context
      009FA6 8C CD 94         [ 4] 2057 	call next_token 
      009FA9 04 AE            [ 1] 2058 	cp a,#TK_COMMA
      009FAB 00 90            [ 1] 2059 	jrne 4$ 
      009FAD CF 00 1C         [ 2] 2060 	jp input_loop
      0020AB                       2061 4$:
      009FB0 72 BB            [ 1] 2062 	cp a,#TK_NONE 
      009FB2 00 8E            [ 1] 2063 	jreq input_exit  
      009FB4 CF 00            [ 1] 2064 	cp a,#TK_COLON 
      009FB6 1E 81            [ 1] 2065     jreq input_exit 
      009FB8 4E 6F 20         [ 2] 2066 	jp syntax_error 
      0020B6                       2067 input_exit:
      0020B6                       2068 	_drop VSIZE 
      009FBB 61 70            [ 2]    1     addw sp,#VSIZE 
      009FBD 70 6C            [ 2] 2069 	popw y 
      009FBF 69               [ 4] 2070 	ret 
                                   2071 
                                   2072 
                                   2073 ;---------------------
                                   2074 ; BASIC: REM | ' 
                                   2075 ; skip comment to end of line 
                                   2076 ;---------------------- 
      0020BB                       2077 remark::
      009FC0 63 61 74 69 6F   [ 1] 2078 	mov in,count 
      009FC5 6E               [ 4] 2079  	ret 
                                   2080 
                                   2081 
                                   2082 ;---------------------
                                   2083 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2084 ; read in loop 'addr'  
                                   2085 ; apply & 'mask' to value 
                                   2086 ; loop while result==0.  
                                   2087 ; 'xor_mask' is used to 
                                   2088 ; invert the wait logic.
                                   2089 ; i.e. loop while not 0.
                                   2090 ;---------------------
                           000001  2091 	XMASK=1 
                           000002  2092 	MASK=2
                           000003  2093 	ADDR=3
                           000004  2094 	VSIZE=4
      0020C1                       2095 wait: 
      0020C1                       2096 	_vars VSIZE
      009FC6 20 73            [ 2]    1     sub sp,#VSIZE 
      009FC8 61 76            [ 1] 2097 	clr (XMASK,sp) 
      009FCA 65 64 2E         [ 4] 2098 	call arg_list 
      009FCD 0A 00            [ 1] 2099 	cp a,#2
      009FCF 24 03            [ 1] 2100 	jruge 0$
      009FCF 90 89 C7         [ 2] 2101 	jp syntax_error 
      009FD2 00 04            [ 1] 2102 0$:	cp a,#3
      009FD4 E6 02            [ 1] 2103 	jrult 1$
      0020D3                       2104 	_xpop  ; xor mask 
      009FD6 C1 00            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009FD8 04               [ 1]    2     ldw x,y 
      009FD9 2A 03            [ 2]    3     ldw x,(1,x)
      009FDB C7 00 04 CF      [ 2]    4     addw y,#CELL_SIZE 
      009FDF 00               [ 1] 2105 	ld a,xl 
      009FE0 05 90            [ 1] 2106 	ld (XMASK,sp),a 
      0020DF                       2107 1$: _xpop ; mask
      009FE2 AE 16            [ 1]    1     ld a,(y)
      009FE4 90               [ 1]    2     ldw x,y 
      009FE5 CD 91            [ 2]    3     ldw x,(1,x)
      009FE7 F4 CD 89 BA      [ 2]    4     addw y,#CELL_SIZE 
      009FEB A6               [ 1] 2108     ld a,xl  
      009FEC 0D CD            [ 1] 2109 	ld (MASK,sp),a 
      0020EB                       2110 	_xpop ; address 
      009FEE 89 5D            [ 1]    1     ld a,(y)
      009FF0 90               [ 1]    2     ldw x,y 
      009FF1 85 81            [ 2]    3     ldw x,(1,x)
      009FF3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009FF3 52               [ 1] 2111 2$:	ld a,(x)
      009FF4 01 02            [ 1] 2112 	and a,(MASK,sp)
      009FF5 18 01            [ 1] 2113 	xor a,(XMASK,sp)
      009FF5 0F 01            [ 1] 2114 	jreq 2$ 
      009FF7                       2115 	_drop VSIZE 
      009FF7 CD 98            [ 2]    1     addw sp,#VSIZE 
      009FF9 1C               [ 4] 2116 	ret 
                                   2117 
                                   2118 ;---------------------
                                   2119 ; BASIC: BSET addr,mask
                                   2120 ; set bits at 'addr' corresponding 
                                   2121 ; to those of 'mask' that are at 1.
                                   2122 ; arguments:
                                   2123 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2124 ;   mask        mask|addr
                                   2125 ; output:
                                   2126 ;	none 
                                   2127 ;--------------------------
      0020FE                       2128 bit_set:
      009FFA A1 02 25         [ 4] 2129 	call arg_list 
      009FFD 08 A1            [ 1] 2130 	cp a,#2	 
      009FFF 0A 27            [ 1] 2131 	jreq 1$ 
      00A001 04 A1 80         [ 2] 2132 	jp syntax_error
      002108                       2133 1$: 
      002108                       2134 	_xpop ; mask 
      00A004 26 07            [ 1]    1     ld a,(y)
      00A006 93               [ 1]    2     ldw x,y 
      00A006 55 00            [ 2]    3     ldw x,(1,x)
      00A008 03 00 02 20      [ 2]    4     addw y,#CELL_SIZE 
      00A00C 63               [ 1] 2135 	ld a,xl
      00A00D 88               [ 1] 2136 	push a  
      002113                       2137 	_xpop ; addr  
      00A00D A1 02            [ 1]    1     ld a,(y)
      00A00F 27               [ 1]    2     ldw x,y 
      00A010 12 A1            [ 2]    3     ldw x,(1,x)
      00A012 04 27 1B A1      [ 2]    4     addw y,#CELL_SIZE 
      00A016 82               [ 1] 2138 	pop a 
      00A017 27               [ 1] 2139 	or a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00A018 1F               [ 1] 2140 	ld (x),a
      00A019 A1               [ 4] 2141 	ret 
                                   2142 
                                   2143 ;---------------------
                                   2144 ; BASIC: BRES addr,mask
                                   2145 ; reset bits at 'addr' corresponding 
                                   2146 ; to those of 'mask' that are at 1.
                                   2147 ; arguments:
                                   2148 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2149 ;   mask	    ~mask&*addr  
                                   2150 ; output:
                                   2151 ;	none 
                                   2152 ;--------------------------
      002120                       2153 bit_reset:
      00A01A 08 27 2A         [ 4] 2154 	call arg_list 
      00A01D A1 09            [ 1] 2155 	cp a,#2  
      00A01F 27 2A            [ 1] 2156 	jreq 1$ 
      00A021 20 3D 38         [ 2] 2157 	jp syntax_error
      00A023                       2158 1$: 
      00212A                       2159 	_xpop ; mask 
      00A023 CD 89            [ 1]    1     ld a,(y)
      00A025 BA               [ 1]    2     ldw x,y 
      00A026 5C 72            [ 2]    3     ldw x,(1,x)
      00A028 B0 00 05 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A02C 00               [ 1] 2160 	ld a,xl 
      00A02D 01               [ 1] 2161 	cpl a
      00A02E 20               [ 1] 2162 	push a  
      002136                       2163 	_xpop ; addr  
      00A02F C5 F6            [ 1]    1     ld a,(y)
      00A030 93               [ 1]    2     ldw x,y 
      00A030 CD 98            [ 2]    3     ldw x,(1,x)
      00A032 5E CD 89 5D      [ 2]    4     addw y,#CELL_SIZE 
      00A036 20               [ 1] 2164 	pop a 
      00A037 BD               [ 1] 2165 	and a,(x)
      00A038 F7               [ 1] 2166 	ld (x),a 
      00A038 FE               [ 4] 2167 	ret 
                                   2168 
                                   2169 ;---------------------
                                   2170 ; BASIC: BTOGL addr,mask
                                   2171 ; toggle bits at 'addr' corresponding 
                                   2172 ; to those of 'mask' that are at 1.
                                   2173 ; arguments:
                                   2174 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2175 ;   mask	    mask^*addr  
                                   2176 ; output:
                                   2177 ;	none 
                                   2178 ;--------------------------
      002143                       2179 bit_toggle:
      00A039 72 5C 00         [ 4] 2180 	call arg_list 
      00A03C 02 72            [ 1] 2181 	cp a,#2 
      00A03E 5C 00            [ 1] 2182 	jreq 1$ 
      00A040 02 FD CD         [ 2] 2183 	jp syntax_error
      00214D                       2184 1$: _xpop ; mask 
      00A043 89 5D            [ 1]    1     ld a,(y)
      00A045 20               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00A046 AE 01            [ 2]    3     ldw x,(1,x)
      00A047 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A047 03               [ 1] 2185 	ld a,xl
      00A048 01               [ 1] 2186 	push a 
      002158                       2187 	_xpop  ; addr  
      00A049 20 AC            [ 1]    1     ld a,(y)
      00A04B 93               [ 1]    2     ldw x,y 
      00A04B CD 98            [ 2]    3     ldw x,(1,x)
      00A04D 1C A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      00A051 03               [ 1] 2188 	pop a 
      00A052 CC               [ 1] 2189 	xor a,(x)
      00A053 96               [ 1] 2190 	ld (x),a 
      00A054 B8               [ 4] 2191 	ret 
                                   2192 
                                   2193 
                                   2194 ;---------------------
                                   2195 ; BASIC: BTEST(addr,bit)
                                   2196 ; return bit value at 'addr' 
                                   2197 ; bit is in range {0..7}.
                                   2198 ; arguments:
                                   2199 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2200 ;   bit 	    bit position {0..7}  
                                   2201 ; output:
                                   2202 ;	A:X       bit value  
                                   2203 ;--------------------------
      00A055                       2204 bit_test:
      00A055 CD 98 4E         [ 4] 2205 	call func_args 
      00A058 9F A4            [ 1] 2206 	cp a,#2
      00A05A 0F C7            [ 1] 2207 	jreq 0$
      00A05C 00 24 20         [ 2] 2208 	jp syntax_error
      00216F                       2209 0$:	
      00216F                       2210 	_xpop 
      00A05F 95 F6            [ 1]    1     ld a,(y)
      00A060 93               [ 1]    2     ldw x,y 
      00A060 55 00            [ 2]    3     ldw x,(1,x)
      00A062 03 00 02 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A066 9C               [ 1] 2211 	ld a,xl 
      00A067 41 4D            [ 1] 2212 	and a,#7
      00A069 27               [ 1] 2213 	push a   
      00A06A 05 CD            [ 1] 2214 	ld a,#1 
      00A06C 98 89            [ 1] 2215 1$: tnz (1,sp)
      00A06E 20 85            [ 1] 2216 	jreq 2$
      00A070 48               [ 1] 2217 	sll a 
      00A070 0D 01            [ 1] 2218 	dec (1,sp)
      00A072 26 05            [ 2] 2219 	jra 1$
      00A074 A6 0D            [ 1] 2220 2$: ld (1,sp),a  
      002189                       2221 	_xpop ; address  
      00A076 CD 89            [ 1]    1     ld a,(y)
      00A078 5D               [ 1]    2     ldw x,y 
      00A079 5B 01            [ 2]    3     ldw x,(1,x)
      00A07B 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A07C 84               [ 1] 2222 	pop a 
      00A07C CE               [ 1] 2223 	and a,(x)
      00A07D 00 05            [ 1] 2224 	jreq 3$
      00A07F 1F 03            [ 1] 2225 	ld a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00A081 C6               [ 1] 2226 3$:	clrw x 
      00A082 00               [ 1] 2227 	ld xl,a
      00A083 02               [ 1] 2228 	clr a  
      00A084 6B               [ 4] 2229 	ret
                                   2230 
                                   2231 ;--------------------
                                   2232 ; BASIC: POKE addr,byte
                                   2233 ; put a byte at addr 
                                   2234 ;--------------------
      00219C                       2235 poke:
      00A085 05 C6 00         [ 4] 2236 	call arg_list 
      00A088 04 6B            [ 1] 2237 	cp a,#2
      00A08A 06 81            [ 1] 2238 	jreq 1$
      00A08C CC 16 38         [ 2] 2239 	jp syntax_error
      0021A6                       2240 1$:	
      0021A6                       2241 	_xpop ; byte   
      00A08C 1E 03            [ 1]    1     ld a,(y)
      00A08E CF               [ 1]    2     ldw x,y 
      00A08F 00 05            [ 2]    3     ldw x,(1,x)
      00A091 7B 05 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A095 02               [ 1] 2242     ld a,xl 
      00A096 7B               [ 1] 2243 	push a 
      0021B1                       2244 	_xpop ; address 
      00A097 06 C7            [ 1]    1     ld a,(y)
      00A099 00               [ 1]    2     ldw x,y 
      00A09A 04 81            [ 2]    3     ldw x,(1,x)
      00A09C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A09C 90               [ 1] 2245 	pop a 
      00A09D 89               [ 1] 2246 	ld (x),a 
      00A09E 52               [ 4] 2247 	ret 
                                   2248 
                                   2249 ;-----------------------
                                   2250 ; BASIC: PEEK(addr)
                                   2251 ; get the byte at addr 
                                   2252 ; input:
                                   2253 ;	none 
                                   2254 ; output:
                                   2255 ;	X 		value 
                                   2256 ;-----------------------
      0021BD                       2257 peek:
      00A09F 05 19 5F         [ 4] 2258 	call func_args
      00A0A0 A1 01            [ 1] 2259 	cp a,#1 
      00A0A0 0F 05            [ 1] 2260 	jreq 1$
      00A0A2 CD 98 1C         [ 2] 2261 	jp syntax_error
      0021C7                       2262 1$: _xpop ; address  
      00A0A5 A1 02            [ 1]    1     ld a,(y)
      00A0A7 26               [ 1]    2     ldw x,y 
      00A0A8 10 CD            [ 2]    3     ldw x,(1,x)
      00A0AA 89 BA 5C 72      [ 2]    4     addw y,#CELL_SIZE 
      00A0AE B0 00 05         [ 1] 2263 	ld farptr,a 
      00A0B1 CF 00 01         [ 2] 2264 	ldw ptr16,x 
      00A0B4 03 05 CD 98      [ 5] 2265 	ldf a,[farptr]
      00A0B8 1C               [ 1] 2266 	clrw x 
      00A0B9 A1               [ 1] 2267 	ld xl,a 
      00A0BA 85               [ 1] 2268 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00A0BB 27               [ 4] 2269 	ret 
                                   2270 
                                   2271 ;---------------------------
                                   2272 ; BASIC IF expr : instructions
                                   2273 ; evaluate expr and if true 
                                   2274 ; execute instructions on same line. 
                                   2275 ;----------------------------
      0021DE                       2276 if: 
      00A0BC 03 CC 96         [ 4] 2277 	call condition  
      0021E1                       2278 	_xpop 
      00A0BF B8 CD            [ 1]    1     ld a,(y)
      00A0C1 98               [ 1]    2     ldw x,y 
      00A0C2 44 CF            [ 2]    3     ldw x,(1,x)
      00A0C4 00 1A 0D 05      [ 2]    4     addw y,#CELL_SIZE 
      00A0C8 26               [ 1] 2279 	tnz  a  
      00A0C9 06 CD            [ 1] 2280 	jrne 9$
      00A0CB 91               [ 2] 2281 	tnzw x 
      00A0CC EA CD            [ 1] 2282 	jrne 9$  
                                   2283 ;skip to next line
      00A0CE 89 5D 03 00 01   [ 1] 2284 	mov in,count
      00A0D0                       2285 	_drop 2 
      00A0D0 A6 3A            [ 2]    1     addw sp,#2 
      00A0D2 CD 89 5D         [ 2] 2286 	jp next_line
      00A0D5 CD               [ 4] 2287 9$:	ret 
                                   2288 
                                   2289 ;------------------------
                                   2290 ; BASIC: FOR var=expr 
                                   2291 ; set variable to expression 
                                   2292 ; leave variable address 
                                   2293 ; on stack and set
                                   2294 ; FLOOP bit in 'flags'
                                   2295 ;-----------------
                           000001  2296 	RETL1=1 ; return address  
                           000003  2297 	FSTEP=3  ; variable increment int24
                           000006  2298 	LIMIT=6 ; loop limit, int24  
                           000009  2299 	CVAR=9   ; control variable 
                           00000B  2300 	INW=11   ;  in.w saved
                           00000D  2301 	BPTR=13 ; baseptr saved
                           00000D  2302 	VSIZE=13  
      0021FB                       2303 for: ; { -- var_addr }
      00A0D6 A0               [ 2] 2304 	popw x ; call return address 
      0021FC                       2305 	_vars VSIZE 
      00A0D7 7C 72            [ 2]    1     sub sp,#VSIZE 
      00A0D9 5F               [ 2] 2306 	pushw x  ; RETL1 
      00A0DA 00 04            [ 1] 2307 	ld a,#TK_VAR 
      00A0DC CD 8A BF         [ 4] 2308 	call expect
      00A0DF AE 16 90         [ 4] 2309 	call get_addr
      00A0E2 3B 00            [ 2] 2310 	ldw (CVAR,sp),x  ; control variable 
      00A0E4 04 4B 00         [ 4] 2311 	call let_eval 
      00A0E7 72 FB 01 5C      [ 1] 2312 	bset flags,#FLOOP 
      00A0EB 5B 02 72         [ 4] 2313 	call next_token 
      00A0EE 5F 00            [ 1] 2314 	cp a,#TK_CMD 
      00A0F0 02 CD            [ 1] 2315 	jreq 1$
      00A0F2 8F 34 A1         [ 2] 2316 	jp syntax_error
      00221A                       2317 1$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00221A                       2318 	_get_code_addr
      00A0F5 84               [ 2]    1         ldw x,(x)
      00A0F6 27 14 A1 11      [ 1]    2         inc in 
      00A0FA 26 07 CD 8F      [ 1]    3         inc in 
      00A0FE 34 A1 84         [ 2] 2319 	cpw x,#to   
      00A101 27 06            [ 1] 2320 	jreq to
      00A103 CC 16 38         [ 2] 2321 	jp syntax_error 
                                   2322 
                                   2323 ;-----------------------------------
                                   2324 ; BASIC: TO expr 
                                   2325 ; second part of FOR loop initilization
                                   2326 ; leave limit on stack and set 
                                   2327 ; FTO bit in 'flags'
                                   2328 ;-----------------------------------
      00222B                       2329 to: ; { var_addr -- var_addr limit step }
      00A103 CD A0 8C CC 96   [ 2] 2330 	btjt flags,#FLOOP,1$
      00A108 B8 16 38         [ 2] 2331 	jp syntax_error
      00A109 CD 1A A8         [ 4] 2332 1$: call expression   
      00A109 CD 82            [ 1] 2333 	cp a,#TK_INTGR 
      00A10B 8D 03            [ 1] 2334 	jreq 2$ 
      00A10C CC 16 38         [ 2] 2335 	jp syntax_error
      00223D                       2336 2$: _xpop
      00A10C C6 00            [ 1]    1     ld a,(y)
      00A10E 0D               [ 1]    2     ldw x,y 
      00A10F CE 00            [ 2]    3     ldw x,(1,x)
      00A111 0E 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A115 1A 72            [ 1] 2337 	ld (LIMIT,sp),a 
      00A117 5C 00            [ 2] 2338 	ldw (LIMIT+1,sp),x
      00A119 1B 72 CF         [ 4] 2339 	call next_token
      00A11C 00 1A            [ 1] 2340 	cp a,#TK_NONE  
      00A11E CD A0            [ 1] 2341 	jreq 4$ 
      00A120 8C CD            [ 1] 2342 	cp a,#TK_CMD
      00A122 98 1C            [ 1] 2343 	jrne 3$
      002255                       2344 	_get_code_addr
      00A124 A1               [ 2]    1         ldw x,(x)
      00A125 08 26 03 CC      [ 1]    2         inc in 
      00A129 A0 A0 00 01      [ 1]    3         inc in 
      00A12B A3 22 71         [ 2] 2345 	cpw x,#step 
      00A12B A1 00            [ 1] 2346 	jreq step
      002263                       2347 3$:	
      002263                       2348 	_unget_token   	 
      00A12D 27 07 A1 0A 27   [ 1]    1      mov in,in.saved  
      002268                       2349 4$:	
      00A132 03 CC            [ 1] 2350 	clr (FSTEP,sp) 
      00A134 96 B8 01         [ 2] 2351 	ldw x,#1   ; default step  
      00A136 1F 04            [ 2] 2352 	ldw (FSTEP+1,sp),x 
      00A136 5B 05            [ 2] 2353 	jra store_loop_addr 
                                   2354 
                                   2355 
                                   2356 ;----------------------------------
                                   2357 ; BASIC: STEP expr 
                                   2358 ; optional third par of FOR loop
                                   2359 ; initialization. 	
                                   2360 ;------------------------------------
      002271                       2361 step: ; {var limit -- var limit step}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00A138 90 85 81 22 03   [ 2] 2362 	btjt flags,#FLOOP,1$
      00A13B CC 16 38         [ 2] 2363 	jp syntax_error
      00A13B 55 00 04         [ 4] 2364 1$: call expression 
      00A13E 00 02            [ 1] 2365 	cp a,#TK_INTGR
      00A140 81 03            [ 1] 2366 	jreq 2$
      00A141 CC 16 38         [ 2] 2367 	jp syntax_error
      002283                       2368 2$:	
      002283                       2369 	_xpop 
      00A141 52 04            [ 1]    1     ld a,(y)
      00A143 0F               [ 1]    2     ldw x,y 
      00A144 01 CD            [ 2]    3     ldw x,(1,x)
      00A146 99 E4 A1 02      [ 2]    4     addw y,#CELL_SIZE 
      00A14A 24 03            [ 1] 2370 	ld (FSTEP,sp),a 
      00A14C CC 96            [ 2] 2371 	ldw (FSTEP+1,sp),x ; step
                                   2372 ; if step < 0 decrement LIMIT 
      00A14E B8               [ 1] 2373 	tnz a
      00A14F A1 03            [ 1] 2374 	jrpl store_loop_addr 
      00A151 25 0C            [ 1] 2375 	ld a,(LIMIT,sp)
      00A153 90 F6            [ 2] 2376 	ldw x,(LIMIT+1,sp)
      00A155 93 EE 01         [ 2] 2377 	subw x,#1 
      00A158 72 A9            [ 1] 2378 	sbc a,#0 
      00A15A 00 03            [ 1] 2379 	ld (LIMIT,sp),a 
      00A15C 9F 6B            [ 2] 2380 	ldw (LIMIT+1,sp),x 
                                   2381 ; leave loop back entry point on cstack 
                                   2382 ; cstack is 1 call deep from interpreter
      0022A0                       2383 store_loop_addr:
      00A15E 01 90 F6         [ 2] 2384 	ldw x,basicptr
      00A161 93 EE            [ 2] 2385 	ldw (BPTR,sp),x 
      00A163 01 72 A9         [ 2] 2386 	ldw x,in.w 
      00A166 00 03            [ 2] 2387 	ldw (INW,sp),x   
      00A168 9F 6B 02 90      [ 1] 2388 	bres flags,#FLOOP 
      00A16C F6 93 EE 01      [ 1] 2389 	inc loop_depth  
      00A170 72               [ 4] 2390 	ret 
                                   2391 
                                   2392 ;--------------------------------
                                   2393 ; BASIC: NEXT var 
                                   2394 ; FOR loop control 
                                   2395 ; increment variable with step 
                                   2396 ; and compare with limit 
                                   2397 ; loop if threshold not crossed.
                                   2398 ; else stack. 
                                   2399 ; and decrement 'loop_depth' 
                                   2400 ;--------------------------------
      0022B3                       2401 next: ; {var limit step retl1 -- [var limit step ] }
      00A171 A9 00 03 F6      [ 1] 2402 	tnz loop_depth 
      00A175 14 02            [ 1] 2403 	jrne 1$ 
      00A177 18 01 27         [ 2] 2404 	jp syntax_error 
      0022BC                       2405 1$: 
      00A17A F9 5B            [ 1] 2406 	ld a,#TK_VAR 
      00A17C 04 81 52         [ 4] 2407 	call expect
      00A17E CD 17 C4         [ 4] 2408 	call get_addr 
                                   2409 ; check for good variable after NEXT 	 
      00A17E CD 99            [ 2] 2410 	cpw x,(CVAR,sp)
      00A180 E4 A1            [ 1] 2411 	jreq 2$  
      00A182 02 27 03         [ 2] 2412 	jp syntax_error ; not the good one 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      0022CB                       2413 2$: 
      00A185 CC 96 B8         [ 2] 2414 	ldw ptr16,x 
                                   2415 	; increment variable 
      00A188 F6               [ 1] 2416 	ld a,(x)
      00A188 90 F6            [ 2] 2417 	ldw x,(1,x)  ; get var value 
      00A18A 93 EE 01         [ 2] 2418 	addw x,(FSTEP+1,sp) ; var+step 
      00A18D 72 A9            [ 1] 2419 	adc a,(FSTEP,sp)
      00A18F 00 03 9F 88      [ 4] 2420 	ld [ptr16],a
      00A193 90 F6 93 EE      [ 1] 2421 	inc ptr8  
      00A197 01 72 A9 00      [ 5] 2422 	ldw [ptr16],x 
      00A19B 03 84 FA         [ 1] 2423 	ld acc24,a 
      00A19E F7 81 0D         [ 2] 2424 	ldw acc16,x 
      00A1A0 7B 06            [ 1] 2425 	ld a,(LIMIT,sp)
      00A1A0 CD 99            [ 2] 2426 	ldw x,(LIMIT+1,sp)
      00A1A2 E4 A1 02 27      [ 2] 2427 	subw x,acc16 
      00A1A6 03 CC 96         [ 1] 2428 	sbc a,acc24
      00A1A9 B8 03            [ 1] 2429 	xor a,(FSTEP,sp)
      00A1AA A8 80            [ 1] 2430 	xor a,#0x80
      00A1AA 90 F6            [ 1] 2431 	jrmi loop_back  
      00A1AC 93 EE            [ 2] 2432 	jra loop_done   
                                   2433 ; check sign of STEP  
      00A1AE 01 72            [ 1] 2434 	ld a,(FSTEP,sp)
      00A1B0 A9 00            [ 1] 2435 	jrpl 4$
                                   2436 ;negative step
      00A1B2 03 9F 43         [ 1] 2437     ld a,acc8 
      00A1B5 88 90            [ 1] 2438 	jrslt loop_back   
      00A1B7 F6 93            [ 2] 2439 	jra loop_done  
      002306                       2440 4$: ; positive step
      00A1B9 EE 01 72 A9 00   [ 2] 2441 	btjt acc8,#7,loop_done 
      00230B                       2442 loop_back:
      00A1BE 03 84            [ 2] 2443 	ldw x,(BPTR,sp)
      00A1C0 F4 F7 81         [ 2] 2444 	ldw basicptr,x 
      00A1C3 72 01 00 22 05   [ 2] 2445 	btjf flags,#FRUN,1$ 
      00A1C3 CD 99            [ 1] 2446 	ld a,(2,x)
      00A1C5 E4 A1 02         [ 1] 2447 	ld count,a
      00A1C8 27 03            [ 2] 2448 1$:	ldw x,(INW,sp)
      00A1CA CC 96 B8         [ 2] 2449 	ldw in.w,x 
      00A1CD 90               [ 4] 2450 	ret 
      002320                       2451 loop_done:
                                   2452 	; remove loop data from stack  
      00A1CE F6               [ 2] 2453 	popw x
      002321                       2454 	_drop VSIZE 
      00A1CF 93 EE            [ 2]    1     addw sp,#VSIZE 
      00A1D1 01 72 A9 00      [ 1] 2455 	dec loop_depth 
      00A1D5 03               [ 2] 2456 	jp (x)
                                   2457 
                                   2458 ;----------------------------
                                   2459 ; called by goto/gosub
                                   2460 ; to get target line number 
                                   2461 ; output:
                                   2462 ;    x    line address 
                                   2463 ;---------------------------
      002328                       2464 get_target_line:
      00A1D6 9F 88 90         [ 4] 2465 	call next_token  
      00A1D9 F6 93            [ 1] 2466 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00A1DB EE 01            [ 1] 2467 	jreq get_target_line_addr 
      00A1DD 72 A9            [ 1] 2468 	cp a,#TK_LABEL 
      00A1DF 00 03            [ 1] 2469 	jreq look_target_symbol 
      00A1E1 84 F8 F7         [ 2] 2470 	jp syntax_error
                                   2471 ; the target is a line number 
                                   2472 ; search it. 
      002336                       2473 get_target_line_addr:
      00A1E4 81 89            [ 2] 2474 	pushw y 
      00A1E5 CD 17 CE         [ 4] 2475 	call get_int24 ; line # 
      00A1E5 CD               [ 1] 2476 	clr a
      00A1E6 99 DF A1 02      [ 2] 2477 	ldw y,basicptr 
      00A1EA 27 03            [ 2] 2478 	ldw y,(y)
      00A1EC CC 96            [ 2] 2479 	pushw y 
      00A1EE B8 01            [ 2] 2480 	cpw x,(1,sp)
      00A1EF                       2481 	_drop 2  
      00A1EF 90 F6            [ 2]    1     addw sp,#2 
      00A1F1 93 EE            [ 1] 2482 	jrult 11$
      00A1F3 01               [ 1] 2483 	inc a 
      00234B                       2484 11$: ; scan program for this line# 	
      00A1F4 72 A9 00         [ 4] 2485 	call search_lineno  
      00A1F7 03               [ 2] 2486 	tnzw x ; 0| line# address 
      00A1F8 9F A4            [ 1] 2487 	jrne 2$ 
      00A1FA 07 88            [ 1] 2488 	ld a,#ERR_NO_LINE 
      00A1FC A6 01 0D         [ 2] 2489 	jp tb_error 
      00A1FF 01 27            [ 2] 2490 2$:	popw y  
      00A201 05               [ 4] 2491 	ret 
                                   2492 
                                   2493 ; the GOTO|GOSUB target is a symbol.
                                   2494 ; output:
                                   2495 ;    X    line address|0 
      002359                       2496 look_target_symbol:
      00A202 48 0A            [ 2] 2497 	pushw y 
      00A204 01               [ 2] 2498 	pushw x 
      00A205 20 F7 6B         [ 4] 2499 	call skip_string 
      00A208 01 90 F6 93      [ 1] 2500 	clr acc16 
      00A20C EE 01 72 A9      [ 2] 2501 	ldw y,txtbgn 
      00A210 00 03 84         [ 1] 2502 1$:	ld a,(3,y) ; first TK_ID on line 
      00A213 F4 27            [ 1] 2503 	cp a,#TK_LABEL 
      00A215 02 A6            [ 1] 2504 	jreq 3$ 
      00A217 01 5F 97         [ 1] 2505 2$:	ld a,(2,y); line length 
      00A21A 4F 81 0E         [ 1] 2506 	ld acc8,a 
      00A21C 72 B9 00 0D      [ 2] 2507 	addw y,acc16 ;point to next line 
      00A21C CD 99 E4 A1      [ 2] 2508 	cpw y,txtend 
      00A220 02 27            [ 1] 2509 	jrult 1$
      00A222 03 CC            [ 1] 2510 	ld a,#ERR_BAD_VALUE
      00A224 96 B8 3A         [ 2] 2511 	jp tb_error 
      00A226                       2512 3$: ; found a TK_LABEL 
                                   2513 	; compare with GOTO|GOSUB target 
      00A226 90 F6            [ 2] 2514 	pushw y ; line address 
      00A228 93 EE 01 72      [ 2] 2515 	addw y,#4 ; label string 
      00A22C A9 00            [ 2] 2516 	ldw x,(3,sp) ; target string 
      00A22E 03 9F 88         [ 4] 2517 	call strcmp
      00A231 90 F6            [ 1] 2518 	jrne 4$
      00A233 93 EE            [ 2] 2519 	popw y 
      00A235 01 72            [ 2] 2520 	jra 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      002394                       2521 4$: ; target found 
      00A237 A9               [ 2] 2522 	popw x ;  address line target  
      002395                       2523 	_drop 2 ; target string 
      00A238 00 03            [ 2]    1     addw sp,#2 
      00A23A 84 F7            [ 2] 2524 	popw y 
      00A23C 81               [ 4] 2525 	ret
                                   2526 
                                   2527 
                                   2528 ;--------------------------------
                                   2529 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2530 ; selective goto or gosub 
                                   2531 ;--------------------------------
      00A23D                       2532 cmd_on:
      00A23D CD 99 DF A1 01   [ 2] 2533 	btjt flags,#FRUN,0$ 
      00A242 27 03            [ 1] 2534 	ld a,#ERR_RUN_ONLY
      00A244 CC 96 B8         [ 2] 2535 	jp tb_error 
      00A247 90 F6 93         [ 4] 2536 0$:	call expression 
      00A24A EE 01            [ 1] 2537 	cp a,#TK_INTGR
      00A24C 72 A9            [ 1] 2538 	jreq 1$
      00A24E 00 03 C7         [ 2] 2539 	jp syntax_error
      0023AE                       2540 1$: _xpop
      00A251 00 19            [ 1]    1     ld a,(y)
      00A253 CF               [ 1]    2     ldw x,y 
      00A254 00 1A            [ 2]    3     ldw x,(1,x)
      00A256 92 BC 00 19      [ 2]    4     addw y,#CELL_SIZE 
                                   2541 ; the selector is the element indice 
                                   2542 ; in the list of arguments. {1..#elements} 
      00A25A 5F               [ 1] 2543 	ld a,xl ; keep only bits 7..0
      00A25B 97 4F            [ 1] 2544 	jreq 9$ ; element # begin at 1. 
      00A25D 81               [ 1] 2545 	push a  ; selector  
      00A25E CD 17 9C         [ 4] 2546 	call next_token
      00A25E CD 9C            [ 1] 2547 	cp a,#TK_CMD 
      00A260 41 90            [ 1] 2548 	jreq 2$ 
      00A262 F6 93 EE         [ 2] 2549 	jp syntax_error 
      0023C5                       2550 2$: _get_code_addr
      00A265 01               [ 2]    1         ldw x,(x)
      00A266 72 A9 00 03      [ 1]    2         inc in 
      00A26A 4D 26 0D 5D      [ 1]    3         inc in 
                                   2551 ;; must be a GOTO or GOSUB 
      00A26E 26 0A 55         [ 2] 2552 	cpw x,#goto 
      00A271 00 04            [ 1] 2553 	jreq 4$
      00A273 00 02 5B         [ 2] 2554 	cpw x,#gosub 
      00A276 02 CC            [ 1] 2555 	jreq 4$ 
      00A278 97 6B 81         [ 2] 2556 	jp syntax_error 
      00A27B                       2557 4$: 
      00A27B 85               [ 1] 2558 	pop a 
      00A27C 52               [ 2] 2559 	pushw x ; save routine address 	
      00A27D 0D               [ 1] 2560 	push a  ; selector  
      0023DE                       2561 5$: ; skip elements in list until selector==0 
      00A27E 89 A6            [ 1] 2562 	dec (1,sp)
      00A280 85 CD            [ 1] 2563 	jreq 6$ 
                                   2564 ; can be a line# or a label 
      00A282 99 D2 CD         [ 4] 2565 	call next_token 
      00A285 98 44            [ 1] 2566 	cp a,#TK_INTGR 
      00A287 1F 09            [ 1] 2567 	jreq 52$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A289 CD 9D            [ 1] 2568 	cp a,#TK_LABEL 
      00A28B 16 72            [ 1] 2569 	jreq 54$
      00A28D 14 00 23         [ 2] 2570 	jp syntax_error 
      0023F0                       2571 52$: ; got a line number 
      00A290 CD 98 1C         [ 1] 2572 	ld a,in ; skip over int24 value 
      00A293 A1 80            [ 1] 2573 	add a,#CELL_SIZE ; integer size  
      00A295 27 03 CC         [ 1] 2574 	ld in,a 
      00A298 96 B8            [ 2] 2575 	jra 56$
      00A29A CD 17 B5         [ 4] 2576 54$: call skip_string ; skip over label 	
      0023FD                       2577 56$: ; if another element comma present 
      00A29A FE 72 5C         [ 4] 2578 	call next_token
      00A29D 00 02            [ 1] 2579 	cp a,#TK_COMMA 
      00A29F 72 5C            [ 1] 2580 	jreq 5$ 
                                   2581 ; arg list exhausted, selector to big 
                                   2582 ; continue execution on next line 
      002404                       2583 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A2A1 00 02            [ 2]    1     addw sp,#3 
      00A2A3 A3 A2            [ 2] 2584 	jra 9$
      002408                       2585 6$: ;at selected position  
      002408                       2586 	_drop 1 ; discard selector
      00A2A5 AB 27            [ 2]    1     addw sp,#1 
                                   2587 ; here only the routine address 
                                   2588 ; of GOTO|GOSUB is on stack 
      00A2A7 03 CC 96         [ 4] 2589     call get_target_line
      00A2AA B8 00 19         [ 2] 2590 	ldw ptr16,x 	
      00A2AB 55 00 03 00 01   [ 1] 2591 	mov in,count ; move to end of line  
      00A2AB 72               [ 2] 2592 	popw x ; cmd address, GOTO||GOSUB 
      00A2AC 04 00 23         [ 2] 2593 	cpw x,#goto 
      00A2AF 03 CC            [ 1] 2594 	jrne 7$ 
      00A2B1 96 B8 CD         [ 2] 2595 	ldw x,ptr16 
      00A2B4 9B 28            [ 2] 2596 	jra jp_to_target
      002420                       2597 7$: 
      00A2B6 A1 84            [ 2] 2598 	jra gosub_2 ; target in ptr16 
      002422                       2599 9$: ; expr out of range skip to end of line
                                   2600     ; this will force a fall to next line  
      00A2B8 27 03 CC 96 B8   [ 1] 2601 	mov in,count
      002427                       2602 	_drop 2
      00A2BD 90 F6            [ 2]    1     addw sp,#2 
      00A2BF 93 EE 01         [ 2] 2603 	jp next_line  
                                   2604 
                                   2605 
                                   2606 ;------------------------
                                   2607 ; BASIC: GOTO line# 
                                   2608 ; jump to line# 
                                   2609 ; here cstack is 2 call deep from interpreter 
                                   2610 ;------------------------
      00242C                       2611 goto:
      00A2C2 72 A9 00 03 6B   [ 2] 2612 	btjt flags,#FRUN,goto_1  
      00A2C7 06 1F            [ 1] 2613 	ld a,#ERR_RUN_ONLY
      00A2C9 07 CD 98         [ 2] 2614 	jp tb_error 
      002436                       2615 goto_1:
      00A2CC 1C A1 00         [ 4] 2616 	call get_target_line
      002439                       2617 jp_to_target:
      00A2CF 27 17 A1         [ 2] 2618 	ldw basicptr,x 
      00A2D2 80 26            [ 1] 2619 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A2D4 0E FE 72         [ 1] 2620 	ld count,a 
      00A2D7 5C 00 02 72      [ 1] 2621 	mov in,#3 
      00A2DB 5C               [ 4] 2622 	ret 
                                   2623 
                                   2624 
                                   2625 ;--------------------
                                   2626 ; BASIC: GOSUB line#
                                   2627 ; basic subroutine call
                                   2628 ; actual line# and basicptr 
                                   2629 ; are saved on cstack
                                   2630 ; here cstack is 2 call deep from interpreter 
                                   2631 ;--------------------
                           000001  2632 	RET_ADDR=1 ; subroutine return address 
                           000003  2633 	RET_BPTR=3 ; basicptr return point 
                           000005  2634 	RET_INW=5  ; in.w return point 
                           000004  2635 	VSIZE=4 
      002446                       2636 gosub:
      00A2DC 00 02 A3 A2 F1   [ 2] 2637 	btjt flags,#FRUN,gosub_1 
      00A2E1 27 0E            [ 1] 2638 	ld a,#ERR_RUN_ONLY
      00A2E3 CC 16 3A         [ 2] 2639 	jp tb_error 
      00A2E3 55               [ 4] 2640 	ret 
      002451                       2641 gosub_1:
      00A2E4 00 03 00         [ 4] 2642 	call get_target_line 
      00A2E7 02 00 19         [ 2] 2643 	ldw ptr16,x
      00A2E8                       2644 gosub_2: 
      00A2E8 0F               [ 2] 2645 	popw x 
      002458                       2646 	_vars VSIZE  
      00A2E9 03 AE            [ 2]    1     sub sp,#VSIZE 
      00A2EB 00               [ 2] 2647 	pushw x ; RET_ADDR 
                                   2648 ; save BASIC subroutine return point.   
      00A2EC 01 1F 04         [ 2] 2649 	ldw x,basicptr
      00A2EF 20 2F            [ 2] 2650 	ldw (RET_BPTR,sp),x 
      00A2F1 CE 00 00         [ 2] 2651 	ldw x,in.w 
      00A2F1 72 04            [ 2] 2652 	ldw (RET_INW,sp),x
      00A2F3 00 23 03         [ 2] 2653 	ldw x,ptr16  
      00A2F6 CC 96            [ 2] 2654 	jra jp_to_target
                                   2655 
                                   2656 ;------------------------
                                   2657 ; BASIC: RETURN 
                                   2658 ; exit from BASIC subroutine 
                                   2659 ;------------------------
      00246A                       2660 return:
      00A2F8 B8 CD 9B 28 A1   [ 2] 2661 	btjt flags,#FRUN,0$ 
      00A2FD 84 27            [ 1] 2662 	ld a,#ERR_RUN_ONLY
      00A2FF 03 CC 96         [ 2] 2663 	jp tb_error 
      002474                       2664 0$:	
      00A302 B8 03            [ 2] 2665 	ldw x,(RET_BPTR,sp) 
      00A303 CF 00 04         [ 2] 2666 	ldw basicptr,x
      00A303 90 F6            [ 1] 2667 	ld a,(2,x)
      00A305 93 EE 01         [ 1] 2668 	ld count,a  
      00A308 72 A9            [ 2] 2669 	ldw x,(RET_INW,sp)
      00A30A 00 03 6B         [ 2] 2670 	ldw in.w,x 
      00A30D 03               [ 2] 2671 	popw x 
      002484                       2672 	_drop VSIZE 
      00A30E 1F 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A310 4D               [ 2] 2673 	jp (x)
                                   2674 
                                   2675 
                                   2676 ;----------------------------------
                                   2677 ; BASIC: RUN
                                   2678 ; run BASIC program in RAM
                                   2679 ;----------------------------------- 
      002487                       2680 run: 
      00A311 2A 0D 7B 06 1E   [ 2] 2681 	btjf flags,#FRUN,0$  
      00A316 07               [ 1] 2682 	clr a 
      00A317 1D               [ 4] 2683 	ret
      00248E                       2684 0$: 
      00A318 00 01 A2 00 6B   [ 2] 2685 	btjf flags,#FBREAK,1$
      002493                       2686 	_drop 2 
      00A31D 06 1F            [ 2]    1     addw sp,#2 
      00A31F 07 20 0C         [ 4] 2687 	call rest_context
      00A320                       2688 	_drop CTXT_SIZE 
      00A320 CE 00            [ 2]    1     addw sp,#CTXT_SIZE 
      00A322 05 1F 0D CE      [ 1] 2689 	bres flags,#FBREAK 
      00A326 00 01 1F 0B      [ 1] 2690 	bset flags,#FRUN 
      00A32A 72 15 00         [ 2] 2691 	jp interpreter 
      00A32D 23 72 5C         [ 2] 2692 1$:	ldw x,txtbgn
      00A330 00 20 81         [ 2] 2693 	cpw x,txtend 
      00A333 2B 0C            [ 1] 2694 	jrmi run_it 
      00A333 72 5D 00         [ 2] 2695 	ldw x,#err_no_prog
      00A336 20 26 03         [ 4] 2696 	call puts 
      00A339 CC 96 B8 00 01   [ 1] 2697 	mov in,count
      00A33C 81               [ 4] 2698 	ret 
      0024B9                       2699 run_it:	 
      0024B9                       2700 	_drop 2 ; drop return address 
      00A33C A6 85            [ 2]    1     addw sp,#2 
      0024BB                       2701 run_it_02: 
      00A33E CD 99 D2         [ 4] 2702     call ubound 
      00A341 CD 98 44         [ 4] 2703 	call clear_vars
                                   2704 ; initialize DIM variables pointers 
      00A344 13 09 27         [ 2] 2705 	ldw x,txtend 
      00A347 03 CC 96         [ 2] 2706 	ldw dvar_bgn,x 
      00A34A B8 00 32         [ 2] 2707 	ldw dvar_end,x 	 
                                   2708 ; clear data pointer 
      00A34B 5F               [ 1] 2709 	clrw x 
      00A34B CF 00 1A         [ 2] 2710 	ldw data_ptr,x 
      00A34E F6 EE 01 72      [ 1] 2711 	clr data_ofs 
      00A352 FB 04 19 03      [ 1] 2712 	clr data_len 
                                   2713 ; initialize BASIC pointer 
      00A356 72 C7 00         [ 2] 2714 	ldw x,txtbgn 
      00A359 1A 72 5C         [ 2] 2715 	ldw basicptr,x 
      00A35C 00 1B            [ 1] 2716 	ld a,(2,x)
      00A35E 72 CF 00         [ 1] 2717 	ld count,a
      00A361 1A C7 00 0D      [ 1] 2718 	mov in,#3	
      00A365 CF 00 0E 7B      [ 1] 2719 	bset flags,#FRUN 
      00A369 06 1E 07         [ 2] 2720 	jp interpreter 
                                   2721 
                                   2722 
                                   2723 ;----------------------
                                   2724 ; BASIC: END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2725 ; end running program
                                   2726 ;---------------------- 
      0024EC                       2727 cmd_end: 
                                   2728 ; clean stack 
      00A36C 72 B0 00         [ 2] 2729 	ldw x,#STACK_EMPTY
      00A36F 0E               [ 1] 2730 	ldw sp,x 
      00A370 C2 00 0D         [ 2] 2731 	jp warm_start
                                   2732 
                                   2733 ;---------------------------
                                   2734 ; BASIC: GET var 
                                   2735 ; receive a key in variable 
                                   2736 ; don't wait 
                                   2737 ;---------------------------
      0024F3                       2738 cmd_get:
      00A373 18 03 A8         [ 4] 2739 	call next_token 
      00A376 80 2B            [ 1] 2740 	cp a,#TK_VAR 
      00A378 12 20            [ 1] 2741 	jreq 0$
      00A37A 25 7B 03         [ 2] 2742 	jp syntax_error 
      00A37D 2A 07 C6         [ 4] 2743 0$: call get_addr 
      00A380 00 0F 2F         [ 2] 2744 	ldw ptr16,x 
      00A383 07 20 1A         [ 4] 2745 	call qgetc 
      00A386 27 03            [ 1] 2746 	jreq 2$
      00A386 72 0E 00         [ 4] 2747 	call getc  
      00A389 0F 15 00 19      [ 4] 2748 2$: clr [ptr16]
      00A38B 72 5C 00 1A      [ 1] 2749 	inc ptr8 
      00A38B 1E 0D CF 00      [ 4] 2750 	clr [ptr16]
      00A38F 05 72 01 00      [ 1] 2751 	inc ptr8 
      00A393 23 05 E6 02      [ 4] 2752 	ld [ptr16],a 
      00A397 C7               [ 4] 2753 	ret 
                                   2754 
                                   2755 
                                   2756 ;-----------------
                                   2757 ; 1 Khz beep 
                                   2758 ;-----------------
      002520                       2759 beep_1khz:: 
      00A398 00 04            [ 2] 2760 	pushw y 
      00A39A 1E 0B CF         [ 2] 2761 	ldw x,#100
      00A39D 00 01 81 E8      [ 2] 2762 	ldw y,#1000
      00A3A0 20 22            [ 2] 2763 	jra beep
                                   2764 
                                   2765 ;-----------------------
                                   2766 ; BASIC: TONE expr1,expr2
                                   2767 ; used TIMER2 channel 1
                                   2768 ; to produce a tone 
                                   2769 ; arguments:
                                   2770 ;    expr1   frequency 
                                   2771 ;    expr2   duration msec.
                                   2772 ;---------------------------
      00252B                       2773 tone:
      00A3A0 85 5B            [ 2] 2774 	pushw y 
      00A3A2 0D 72 5A         [ 4] 2775 	call arg_list 
      00A3A5 00 20            [ 1] 2776 	cp a,#2 
      00A3A7 FC 03            [ 1] 2777 	jreq 1$
      00A3A8 CC 16 38         [ 2] 2778 	jp syntax_error 
      002537                       2779 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      002537                       2780 	_xpop 
      00A3A8 CD 98            [ 1]    1     ld a,(y)
      00A3AA 1C               [ 1]    2     ldw x,y 
      00A3AB A1 84            [ 2]    3     ldw x,(1,x)
      00A3AD 27 07 A1 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3B1 27               [ 2] 2781 	pushw x ; duration 
      002541                       2782 	_xpop ; frequency
      00A3B2 26 CC            [ 1]    1     ld a,(y)
      00A3B4 96               [ 1]    2     ldw x,y 
      00A3B5 B8 01            [ 2]    3     ldw x,(1,x)
      00A3B6 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3B6 90 89            [ 1] 2783 	ldw y,x ; frequency 
      00A3B8 CD               [ 2] 2784 	popw x  ; duration 
      00254D                       2785 beep:  
      00A3B9 98               [ 2] 2786 	pushw x 
      00A3BA 4E 4F 90         [ 2] 2787 	ldw x,#TIM2_CLK_FREQ
      00A3BD CE               [ 2] 2788 	divw x,y ; cntr=Fclk/freq 
                                   2789 ; round to nearest integer 
      00A3BE 00 05 90 FE      [ 2] 2790 	cpw y,#TIM2_CLK_FREQ/2
      00A3C2 90 89            [ 1] 2791 	jrmi 2$
      00A3C4 13               [ 1] 2792 	incw x 
      002559                       2793 2$:	 
      00A3C5 01               [ 1] 2794 	ld a,xh 
      00A3C6 5B 02 25         [ 1] 2795 	ld TIM2_ARRH,a 
      00A3C9 01               [ 1] 2796 	ld a,xl 
      00A3CA 4C 53 0E         [ 1] 2797 	ld TIM2_ARRL,a 
                                   2798 ; 50% duty cycle 
      00A3CB 8C               [ 1] 2799 	ccf 
      00A3CB CD               [ 2] 2800 	rrcw x 
      00A3CC 8C               [ 1] 2801 	ld a,xh 
      00A3CD 97 5D 26         [ 1] 2802 	ld TIM2_CCR1H,a 
      00A3D0 05               [ 1] 2803 	ld a,xl
      00A3D1 A6 05 CC         [ 1] 2804 	ld TIM2_CCR1L,a
      00A3D4 96 BA 90 85      [ 1] 2805 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A3D8 81 10 53 00      [ 1] 2806 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A3D9 72 10 53 04      [ 1] 2807 	bset TIM2_EGR,#TIM2_EGR_UG
      00A3D9 90               [ 2] 2808 	popw x 
      00A3DA 89 89 CD         [ 4] 2809 	call pause02
      00A3DD 98 35 72 5F      [ 1] 2810 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A3E1 00 0E 90 CE      [ 1] 2811 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A3E5 00 1C            [ 2] 2812 	popw y 
      00A3E7 90               [ 4] 2813 	ret 
                                   2814 
                                   2815 ;-------------------------------
                                   2816 ; BASIC: ADCON 0|1 [,divisor]  
                                   2817 ; disable/enanble ADC 
                                   2818 ;-------------------------------
                           000003  2819 	ONOFF=3 
                           000001  2820 	DIVSOR=1
                           000004  2821 	VSIZE=4 
      002586                       2822 power_adc:
      00A3E8 E6 03 A1         [ 4] 2823 	call arg_list 
      00A3EB 03 27            [ 1] 2824 	cp a,#2	
      00A3ED 15 90            [ 1] 2825 	jreq 1$
      00A3EF E6 02            [ 1] 2826 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A3F1 C7 00            [ 1] 2827 	jreq 0$ 
      00A3F3 0F 72 B9         [ 2] 2828 	jp syntax_error 
      00A3F6 00               [ 1] 2829 0$:	clr a 
      00A3F7 0E               [ 1] 2830 	clrw x
      002596                       2831 	_xpush   ; divisor  
      00A3F8 90 C3 00 1E      [ 2]    1     subw y,#CELL_SIZE
      00A3FC 25 E9            [ 1]    2     ld (y),a 
      00A3FE A6 0A CC         [ 2]    3     ldw (1,y),x 
      00259F                       2832 1$: _at_next 
      00A401 96 BA 03         [ 1]    1     ld a,(3,y)
      00A403 93               [ 1]    2     ldw x,y 
      00A403 90 89            [ 2]    3     ldw x,(4,x)
      00A405 72               [ 2] 2833 	tnzw x 
      00A406 A9 00            [ 1] 2834 	jreq 2$ 
      0025A8                       2835 	_xpop
      00A408 04 1E            [ 1]    1     ld a,(y)
      00A40A 03               [ 1]    2     ldw x,y 
      00A40B CD 93            [ 2]    3     ldw x,(1,x)
      00A40D E3 26 04 90      [ 2]    4     addw y,#CELL_SIZE 
      0025B1                       2836 	_xdrop  
      00A411 85 20 DA 03      [ 2]    1     addw y,#CELL_SIZE 
      00A414 9F               [ 1] 2837 	ld a,xl
      00A414 85 5B            [ 1] 2838 	and a,#7
      00A416 02               [ 1] 2839 	swap a 
      00A417 90 85 81         [ 1] 2840 	ld ADC_CR1,a
      00A41A 72 16 50 CA      [ 1] 2841 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A41A 72 00 00 23      [ 1] 2842 	bset ADC_CR1,#ADC_CR1_ADON 
      0025C4                       2843 	_usec_dly 7 
      00A41E 05 A6 06         [ 2]    1     ldw x,#(16*7-2)/4
      00A421 CC               [ 2]    2     decw x
      00A422 96               [ 1]    3     nop 
      00A423 BA CD            [ 1]    4     jrne .-4
      00A425 9B 28            [ 2] 2844 	jra 3$
      00A427 A1 84 27 03      [ 1] 2845 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A42B CC 96 B8 90      [ 1] 2846 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0025D5                       2847 3$:	
      00A42F F6               [ 4] 2848 	ret
                                   2849 
                                   2850 ;-----------------------------
                                   2851 ; BASIC: ADCREAD (channel)
                                   2852 ; read adc channel {0..5}
                                   2853 ; output:
                                   2854 ;   A 		TK_INTGR 
                                   2855 ;   X 		value 
                                   2856 ;-----------------------------
      0025D6                       2857 analog_read:
      00A430 93 EE 01         [ 4] 2858 	call func_args 
      00A433 72 A9            [ 1] 2859 	cp a,#1 
      00A435 00 03            [ 1] 2860 	jreq 1$
      00A437 9F 27 68         [ 2] 2861 	jp syntax_error
      0025E0                       2862 1$: _xpop 
      00A43A 88 CD            [ 1]    1     ld a,(y)
      00A43C 98               [ 1]    2     ldw x,y 
      00A43D 1C A1            [ 2]    3     ldw x,(1,x)
      00A43F 80 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A443 96 B8 FE         [ 2] 2863 	cpw x,#5 
      00A446 72 5C            [ 2] 2864 	jrule 2$
      00A448 00 02            [ 1] 2865 	ld a,#ERR_BAD_VALUE
      00A44A 72 5C 00         [ 2] 2866 	jp tb_error 
      00A44D 02               [ 1] 2867 2$: ld a,xl
      00A44E A3 A4 AC         [ 1] 2868 	ld acc8,a 
      00A451 27 08            [ 1] 2869 	ld a,#5
      00A453 A3 A4 C6         [ 1] 2870 	sub a,acc8 
      00A456 27 03 CC         [ 1] 2871 	ld ADC_CSR,a
      00A459 96 B8 54 02      [ 1] 2872 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A45B 72 10 54 01      [ 1] 2873 	bset ADC_CR1,#ADC_CR1_ADON
      00A45B 84 89 88 00 FB   [ 2] 2874 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A45E CE 54 04         [ 2] 2875 	ldw x,ADC_DRH
      00A45E 0A 01            [ 1] 2876 	ld a,#TK_INTGR
      00A460 27               [ 4] 2877 	ret 
                                   2878 
                                   2879 ;-----------------------
                                   2880 ; BASIC: DREAD(pin)
                                   2881 ; Arduino pins 
                                   2882 ; read state of a digital pin 
                                   2883 ; pin# {0..15}
                                   2884 ; output:
                                   2885 ;    A 		TK_INTGR
                                   2886 ;    X      0|1 
                                   2887 ;-------------------------
                           000001  2888 	PINNO=1
                           000001  2889 	VSIZE=1
      002612                       2890 digital_read:
      002612                       2891 	_vars VSIZE 
      00A461 26 CD            [ 2]    1     sub sp,#VSIZE 
      00A463 98 1C A1         [ 4] 2892 	call func_args
      00A466 84 27            [ 1] 2893 	cp a,#1
      00A468 07 A1            [ 1] 2894 	jreq 1$
      00A46A 03 27 0D         [ 2] 2895 	jp syntax_error
      00261E                       2896 1$: _xpop 
      00A46D CC 96            [ 1]    1     ld a,(y)
      00A46F B8               [ 1]    2     ldw x,y 
      00A470 EE 01            [ 2]    3     ldw x,(1,x)
      00A470 C6 00 02 AB      [ 2]    4     addw y,#CELL_SIZE 
      00A474 03 C7 00         [ 2] 2897 	cpw x,#15 
      00A477 02 20            [ 2] 2898 	jrule 2$
      00A479 03 CD            [ 1] 2899 	ld a,#ERR_BAD_VALUE
      00A47B 98 35 3A         [ 2] 2900 	jp tb_error 
      00A47D CD 2B C5         [ 4] 2901 2$:	call select_pin 
      00A47D CD 98            [ 1] 2902 	ld (PINNO,sp),a
      00A47F 1C A1            [ 1] 2903 	ld a,(GPIO_IDR,x)
      00A481 08 27            [ 1] 2904 	tnz (PINNO,sp)
      00A483 DA 5B            [ 1] 2905 	jreq 8$
      00A485 03               [ 1] 2906 3$: srl a 
      00A486 20 1A            [ 1] 2907 	dec (PINNO,sp)
      00A488 26 FB            [ 1] 2908 	jrne 3$ 
      00A488 5B 01            [ 1] 2909 8$: and a,#1 
      00A48A CD               [ 1] 2910 	clrw x 
      00A48B A3               [ 1] 2911 	ld xl,a 
      00A48C A8               [ 1] 2912 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      002646                       2913 	_drop VSIZE
      00A48D CF 00            [ 2]    1     addw sp,#VSIZE 
      00A48F 1A               [ 4] 2914 	ret
                                   2915 
                                   2916 
                                   2917 ;-----------------------
                                   2918 ; BASIC: DWRITE pin,0|1
                                   2919 ; Arduino pins 
                                   2920 ; write to a digital pin 
                                   2921 ; pin# {0..15}
                                   2922 ; output:
                                   2923 ;    A 		TK_INTGR
                                   2924 ;    X      0|1 
                                   2925 ;-------------------------
                           000001  2926 	PINNO=1
                           000002  2927 	PINVAL=2
                           000002  2928 	VSIZE=2
      002649                       2929 digital_write:
      002649                       2930 	_vars VSIZE 
      00A490 55 00            [ 2]    1     sub sp,#VSIZE 
      00A492 04 00 02         [ 4] 2931 	call arg_list  
      00A495 85 A3            [ 1] 2932 	cp a,#2 
      00A497 A4 AC            [ 1] 2933 	jreq 1$
      00A499 26 05 CE         [ 2] 2934 	jp syntax_error
      002655                       2935 1$: _xpop 
      00A49C 00 1A            [ 1]    1     ld a,(y)
      00A49E 20               [ 1]    2     ldw x,y 
      00A49F 19 01            [ 2]    3     ldw x,(1,x)
      00A4A0 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A4A0 20               [ 1] 2936 	ld a,xl 
      00A4A1 35 02            [ 1] 2937 	ld (PINVAL,sp),a
      00A4A2                       2938 	_xpop 
      00A4A2 55 00            [ 1]    1     ld a,(y)
      00A4A4 04               [ 1]    2     ldw x,y 
      00A4A5 00 02            [ 2]    3     ldw x,(1,x)
      00A4A7 5B 02 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A4AB 6B 00 0F         [ 2] 2939 	cpw x,#15 
      00A4AC 23 05            [ 2] 2940 	jrule 2$
      00A4AC 72 00            [ 1] 2941 	ld a,#ERR_BAD_VALUE
      00A4AE 00 23 05         [ 2] 2942 	jp tb_error 
      00A4B1 A6 06 CC         [ 4] 2943 2$:	call select_pin 
      00A4B4 96 BA            [ 1] 2944 	ld (PINNO,sp),a 
      00A4B6 A6 01            [ 1] 2945 	ld a,#1
      00A4B6 CD A3            [ 1] 2946 	tnz (PINNO,sp)
      00A4B8 A8 05            [ 1] 2947 	jreq 4$
      00A4B9 48               [ 1] 2948 3$: sll a
      00A4B9 CF 00            [ 1] 2949 	dec (PINNO,sp)
      00A4BB 05 E6            [ 1] 2950 	jrne 3$
      00A4BD 02 C7            [ 1] 2951 4$: tnz (PINVAL,sp)
      00A4BF 00 04            [ 1] 2952 	jrne 5$
      00A4C1 35               [ 1] 2953 	cpl a 
      00A4C2 03 00            [ 1] 2954 	and a,(GPIO_ODR,x)
      00A4C4 02 81            [ 2] 2955 	jra 8$
      00A4C6 EA 00            [ 1] 2956 5$: or a,(GPIO_ODR,x)
      00A4C6 72 00            [ 1] 2957 8$: ld (GPIO_ODR,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      002691                       2958 	_drop VSIZE 
      00A4C8 00 23            [ 2]    1     addw sp,#VSIZE 
      00A4CA 06               [ 4] 2959 	ret
                                   2960 
                                   2961 
                                   2962 ;-----------------------
                                   2963 ; BASIC: STOP
                                   2964 ; stop progam execution  
                                   2965 ; without resetting pointers 
                                   2966 ; the program is resumed
                                   2967 ; with RUN 
                                   2968 ;-------------------------
      002694                       2969 stop:
      00A4CB A6 06 CC 96 BA   [ 2] 2970 	btjt flags,#FRUN,2$
      00A4D0 81               [ 1] 2971 	clr a
      00A4D1 81               [ 4] 2972 	ret 
      00269B                       2973 2$:	 
                                   2974 ; create space on cstack to save context 
      00A4D1 CD A3 A8         [ 2] 2975 	ldw x,#break_point 
      00A4D4 CF 00 1A         [ 4] 2976 	call puts 
      00A4D7                       2977 	_drop 2 ;drop return address 
      00A4D7 85 52            [ 2]    1     addw sp,#2 
      0026A3                       2978 	_vars CTXT_SIZE ; context size 
      00A4D9 04 89            [ 2]    1     sub sp,#CTXT_SIZE 
      00A4DB CE 00 05         [ 4] 2979 	call save_context 
      00A4DE 1F 03 CE         [ 2] 2980 	ldw x,#tib 
      00A4E1 00 01 1F         [ 2] 2981 	ldw basicptr,x
      00A4E4 05               [ 1] 2982 	clr (x)
      00A4E5 CE 00 1A 20      [ 1] 2983 	clr count  
      00A4E9 CF               [ 1] 2984 	clrw x 
      00A4EA CF 00 00         [ 2] 2985 	ldw in.w,x
      00A4EA 72 00 00 23      [ 1] 2986 	bres flags,#FRUN 
      00A4EE 05 A6 06 CC      [ 1] 2987 	bset flags,#FBREAK
      00A4F2 96 BA E3         [ 2] 2988 	jp interpreter 
      00A4F4 0A 62 72 65 61 6B 20  2989 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2990 
                                   2991 ;-----------------------
                                   2992 ; BASIC: NEW
                                   2993 ; from command line only 
                                   2994 ; free program memory
                                   2995 ; and clear variables 
                                   2996 ;------------------------
      0026E0                       2997 new: 
      00A4F4 1E 03 CF 00 05   [ 2] 2998 	btjf flags,#FRUN,0$ 
      00A4F9 E6               [ 4] 2999 	ret 
      0026E6                       3000 0$:	
      00A4FA 02 C7 00         [ 4] 3001 	call clear_basic 
      00A4FD 04               [ 4] 3002 	ret 
                                   3003 
                                   3004 ;-----------------------------------
                                   3005 ; BASIC: ERASE \E | \F [address]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   3006 ; erase all block in range from 
                                   3007 ;  'app_space' to FLASH end (0x27fff)
                                   3008 ;  or all EEPROM 
                                   3009 ; that contains a non zero byte. 
                                   3010 ; [address] is optional, if given 
                                   3011 ; erase at block containing this address  
                                   3012 ;-----------------------------------
                           000001  3013 	LIMIT=1 
                           000003  3014 	VSIZE = 3 
      0026EA                       3015 erase:
      00A4FE 1E 05 CF 00 01   [ 2] 3016 	btjf flags,#FRUN,eras0
      00A503 85 5B            [ 1] 3017 	ld a,#ERR_CMD_ONLY
      00A505 04 FC 3A         [ 2] 3018 	jp tb_error 
      00A507                       3019 eras0:	
      00A507 72 01 00 23      [ 1] 3020 	clr farptr 
      0026F8                       3021 	_vars VSIZE 
      00A50B 02 4F            [ 2]    1     sub sp,#VSIZE 
      00A50D 81 17 9C         [ 4] 3022 	call next_token 
      00A50E A1 04            [ 1] 3023 	cp a,#TK_CHAR 
      00A50E 72 09            [ 1] 3024 	jreq 0$ 
      00A510 00 23 12         [ 2] 3025 	jp syntax_error
      00A513 5B 02 CD         [ 4] 3026 0$: call get_char 
      00A516 A0 8C            [ 1] 3027 	and a,#0XDF 
      00A518 5B 04            [ 1] 3028 	cp a,#'E
      00A51A 72 19            [ 1] 3029 	jrne 1$
      00A51C 00 23 72         [ 2] 3030 	ldw x,#EEPROM_BASE 
      00A51F 10 00 23         [ 2] 3031 	ldw farptr+1,x 
      00A522 CC 97 63         [ 2] 3032 	ldw x,#EEPROM_END
      00A525 CE               [ 1] 3033 	clr a 
      00A526 00 1C            [ 2] 3034 	jra 3$ 
      00A528 C3 00            [ 1] 3035 1$: cp a,#'F 
      00A52A 1E 2B            [ 1] 3036 	jreq 2$
      00A52C 0C AE 96         [ 2] 3037 	ldw x,#err_bad_value
      00A52F 2B CD 89         [ 2] 3038 	jp tb_error
      002723                       3039 2$:
      00A532 BA 55 00         [ 2] 3040 	ldw x,#app_space  
      00A535 04 00 02         [ 2] 3041 	ldw farptr+1,x 
      00A538 81 02            [ 1] 3042 	ld a,#(FLASH_END>>16)&0XFF 
      00A539 AE 7F FF         [ 2] 3043 	ldw x,#FLASH_END&0xffff
      00272E                       3044 3$:
      00A539 5B 02            [ 1] 3045 	ld (LIMIT,sp),a 
      00A53B 1F 02            [ 2] 3046 	ldw (LIMIT+1,sp),x 
                                   3047  ; operation done from RAM
                                   3048  ; copy code to RAM in tib   
      00A53B CD 9C F5         [ 4] 3049 	call move_erase_to_ram
                                   3050 ;
                                   3051 ; check address option 	
      00A53E CD 94 48         [ 4] 3052 	call next_token 
      00A541 CE 00            [ 1] 3053 	cp a,#TK_NONE 
      00A543 1E CF            [ 1] 3054 	jreq 4$ 
      00273C                       3055 	_unget_token 
      00A545 00 31 CF 00 33   [ 1]    1      mov in,in.saved  
      00A54A 5F CF 00         [ 4] 3056 	call expression 
      00A54D 07 72            [ 1] 3057 	cp a,#TK_INTGR
      00A54F 5F 00            [ 1] 3058 	jreq 32$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A551 09 72 5F         [ 2] 3059 	jp syntax_error
      00274B                       3060 32$: 
      00274B                       3061 	_xpop
      00A554 00 0A            [ 1]    1     ld a,(y)
      00A556 CE               [ 1]    2     ldw x,y 
      00A557 00 1C            [ 2]    3     ldw x,(1,x)
      00A559 CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A55D 02               [ 1] 3062 	tnz a 
      00A55E C7 00            [ 1] 3063 	jrne 38$
      00A560 04 35 03         [ 2] 3064 	cpw x,#app_space
      00A563 00 02            [ 1] 3065 	jruge 38$
      00A565 72 10 00         [ 2] 3066 	cpw x,#EEPROM_BASE 
      00A568 23 CC            [ 1] 3067 	jrult 37$
      00A56A 97 63 FF         [ 2] 3068 	cpw x,#EEPROM_END 
      00A56C 25 10            [ 1] 3069 	jrult 39$
      002766                       3070 37$:
      00A56C AE 17            [ 1] 3071 	ld a,#ERR_BAD_VALUE
      00A56E FF 94 CC         [ 2] 3072 	jp syntax_error 
      00276B                       3073 38$:	 
      00A571 97 44            [ 1] 3074 	cp a,#2
      00A573 22 F7            [ 1] 3075 	jrugt 37$
      00A573 CD 98            [ 1] 3076 	jrult 39$ 
      00A575 1C A1 85         [ 2] 3077 	cpw x,0x7fff 
      00A578 27 03            [ 1] 3078 	jrugt 37$ 
      002776                       3079 39$:
      00A57A CC 96 B8         [ 1] 3080 	ld farptr,a 
      00A57D CD               [ 1] 3081 	ld a,xl 
      00A57E 98 44            [ 1] 3082 	and a,#0x80
      00A580 CF               [ 1] 3083 	ld xl,a
      00A581 00 1A CD         [ 2] 3084 	ldw farptr+1,x
      002780                       3085 4$:	 
      00A584 89 66 27         [ 4] 3086     call scan_block 
      00A587 03 CD            [ 1] 3087 	jreq 5$  ; block already erased 
      00A589 89 6D            [ 1] 3088     ld a,#'E 
      00A58B 72 3F 00         [ 4] 3089     call putc 
      00A58E 1A 72 5C         [ 4] 3090 	call block_erase   
                                   3091 ; this block is clean, next  
      00A591 00 1B 72         [ 2] 3092 5$:	ldw x,#BLOCK_SIZE
      00A594 3F 00 1A         [ 4] 3093 	call incr_farptr
                                   3094 ; check limit, 24 bit substraction  	
      00A597 72 5C            [ 1] 3095 	ld a,(LIMIT,sp)
      00A599 00 1B            [ 2] 3096 	ldw x,(LIMIT+1,sp)
      00A59B 72 C7 00 1A      [ 2] 3097 	subw x,farptr+1
      00A59F 81 00 18         [ 1] 3098 	sbc a,farptr 
      00A5A0 22 E0            [ 1] 3099 	jrugt 4$ 
      00A5A0 90 89 AE         [ 4] 3100 9$: call clear_basic
      00A5A3 00 64            [ 2] 3101 	ldw x,(LIMIT+1,sp)
      00A5A5 90 AE 03         [ 2] 3102 	cpw x,#EEPROM_END
      00A5A8 E8 20            [ 1] 3103 	jrne 10$
      00A5AA 22 1C D4         [ 4] 3104 	call func_eefree 
      00A5AB                       3105 10$:
      0027AD                       3106 	_drop VSIZE 
      00A5AB 90 89            [ 2]    1     addw sp,#VSIZE 
      00A5AD CD               [ 4] 3107 	ret 
                                   3108 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   3109 
                                   3110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3111 ;  check for application signature 
                                   3112 ; input:
                                   3113 ;	x       address to check 
                                   3114 ; output:
                                   3115 ;   Carry    0 app present 
                                   3116 ;            1 no app installed  
                                   3117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B0                       3118 qsign: 
      00A5AE 99 E4 A1         [ 2] 3119 	cpw x,SIGNATURE ; "TB" 
      00A5B1 02               [ 4] 3120 	ret 
                                   3121 
                                   3122 ;--------------------------------------
                                   3123 ;  fill write buffer 
                                   3124 ;  input:
                                   3125 ;    y  point to output buffer 
                                   3126 ;    x  point to source 
                                   3127 ;    a  bytes to write in buffer 
                                   3128 ;  output:
                                   3129 ;    y   += A 
                                   3130 ;    X   += A 
                                   3131 ;    A   0 
                                   3132 ;---------------------------------------
      0027B4                       3133 fill_write_buffer:
      00A5B2 27               [ 1] 3134 	push a 
      00A5B3 03               [ 1] 3135 	tnz a 
      00A5B4 CC 96            [ 1] 3136 	jreq 9$ 
      00A5B6 B8               [ 1] 3137 1$: ld a,(x)
      00A5B7 5C               [ 1] 3138 	incw x 
      00A5B7 90 F6            [ 1] 3139 	ld (y),a 
      00A5B9 93 EE            [ 1] 3140 	incw y 
      00A5BB 01 72            [ 1] 3141 	dec (1,sp) 
      00A5BD A9 00            [ 1] 3142 	jrne 1$ 
      00A5BF 03               [ 1] 3143 9$:	pop a 
      00A5C0 89               [ 4] 3144     ret 	
                                   3145 
                                   3146 ;--------------------------------------
                                   3147 ;  fill pad buffer with zero 
                                   3148 ;  input:
                                   3149 ;	none 
                                   3150 ;  output:
                                   3151 ;    y     buffer address  
                                   3152 ;--------------------------------------
      0027C4                       3153 clear_block_buffer:
      00A5C1 90               [ 1] 3154 	push a 
      00A5C2 F6 93 EE 01      [ 2] 3155 	ldw y,#block_buffer 
      00A5C6 72 A9            [ 2] 3156 	pushw y
      00A5C8 00 03            [ 1] 3157 	ld a,#BLOCK_SIZE   
      00A5CA 90 93            [ 1] 3158 1$:	clr (y)
      00A5CC 85 5C            [ 1] 3159 	incw y
      00A5CD 4A               [ 1] 3160 	dec a  
      00A5CD 89 AE            [ 1] 3161 	jrne 1$ 	
      00A5CF F4 24            [ 2] 3162 9$: popw y 
      00A5D1 65               [ 1] 3163 	pop a 			
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A5D2 90               [ 4] 3164 	ret 
                                   3165 
                                   3166 
                                   3167 ;---------------------------------------
                                   3168 ; BASIC: SAVE
                                   3169 ; write application from RAM to FLASH
                                   3170 ; at UFLASH address
                                   3171 ;--------------------------------------
                           000001  3172 	XTEMP=1
                           000003  3173 	COUNT=3  ; last count bytes written 
                           000004  3174 	CNT_LO=4 ; count low byte 
                           000005  3175 	TOWRITE=5 ; how bytes left to write  
                           000006  3176 	VSIZE=6 
      0027D8                       3177 save_app:
      00A5D3 A3               [ 2] 3178 	pushw x 
      00A5D4 7A 12            [ 2] 3179 	pushw y 
      0027DB                       3180 	_vars VSIZE
      00A5D6 2B 01            [ 2]    1     sub sp,#VSIZE 
      00A5D8 5C 1D EE         [ 4] 3181 	call prog_size 
      00A5D9 26 09            [ 1] 3182 	jrne 0$ 
      00A5D9 9E C7 53         [ 2] 3183 	ldw x,#NO_APP
      00A5DC 0D 9F C7         [ 4] 3184 	call puts 
      00A5DF 53 0E 8C         [ 2] 3185 	jp 9$
      00A5E2 56 9E            [ 2] 3186 0$:	ldw (TOWRITE,sp),x ; program size
      00A5E4 C7 53 0F         [ 4] 3187 	call uflash
      00A5E7 9F C7 53 10      [ 1] 3188 	clr farptr 
      00A5EB 72 10 53         [ 2] 3189 	ldw ptr16,x 
      00A5EE 08 72 10         [ 2] 3190 	ldw x,#0xFFFF
      00A5F1 53 00 72 10      [ 2] 3191 	subw x,ptr16 ; free flash 
      00A5F5 53 04 85         [ 2] 3192 	subw x,#4 ; signature and size field 
      00A5F8 CD AB            [ 2] 3193 	cpw x,(TOWRITE,sp)
      00A5FA 02 72            [ 1] 3194 	jruge 1$
      00A5FC 11 53 08         [ 2] 3195 	ldw x,#CANT_DO 
      00A5FF 72 11 53         [ 4] 3196 	call puts 
      00A602 00 90 85         [ 2] 3197 	jp 9$
      00280E                       3198 1$: 
                                   3199 ; block programming flash
                                   3200 ; must be done from RAM
                                   3201 ; moved in tib  
      00A605 81 07 17         [ 4] 3202 	call move_prg_to_ram
                                   3203 ; initialize written bytes count  
      00A606 0F 03            [ 1] 3204 	clr (COUNT,sp)
                                   3205 ; first bock 
                                   3206 ; containt signature 2 bytes 
                                   3207 ; and size 	2 bytes 
                                   3208 ; use Y as pointer to block_buffer
      00A606 CD 99 E4         [ 4] 3209 	call clear_block_buffer ; -- y=*block_buffer	
                                   3210 ; write signature
      00A609 A1 02 27         [ 2] 3211 	ldw x,SIGNATURE ; "TB" 
      00A60C 12 A1            [ 2] 3212 	ldw (y),x 
      00A60E 01 27 03 CC      [ 2] 3213 	addw y,#2
      00A612 96 B8            [ 2] 3214 	ldw x,(TOWRITE,sp)
      00A614 4F 5F            [ 2] 3215 	ldw (y),x
      00A616 72 A2 00 03      [ 2] 3216 	addw y,#2   
      00A61A 90 F7            [ 1] 3217 	ld a,#(BLOCK_SIZE-4)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A61C 90 EF 01         [ 2] 3218 	cpw x,#(BLOCK_SIZE-4) 
      00A61F 90 E6            [ 1] 3219 	jrugt 3$
      00A621 03               [ 1] 3220 	ld a,xl 
      00A622 93 EE            [ 1] 3221 3$:	ld (CNT_LO,sp),a   
      00A624 04 5D 27         [ 2] 3222 	ldw x,txtbgn 
      00A627 25 90            [ 2] 3223 	ldw (XTEMP,sp),x 
      002836                       3224 32$: 
      00A629 F6 93            [ 2] 3225 	ldw x,(XTEMP,sp)
      00A62B EE 01            [ 1] 3226 	ld a,(CNT_LO,sp)
      00A62D 72 A9 00         [ 4] 3227 	call fill_write_buffer 
      00A630 03 72            [ 2] 3228 	ldw (XTEMP,sp),x 
      00A632 A9 00 03         [ 2] 3229 	ldw x,#block_buffer
      00A635 9F A4 07         [ 4] 3230 	call write_buffer
      00A638 4E C7 54         [ 2] 3231 	ldw x,#BLOCK_SIZE 
      00A63B 01 72 16         [ 4] 3232 	call incr_farptr  
                                   3233 ; following blocks 
      00A63E 50 CA            [ 2] 3234 	ldw x,(XTEMP,sp)
      00A640 72 10 54         [ 2] 3235 	cpw x,txtend 
      00A643 01 AE            [ 1] 3236 	jruge 9$ 
      00A645 00 1B            [ 2] 3237 	ldw x,(TOWRITE,sp)
      00A647 5A 9D 26         [ 2] 3238 	subw x,(COUNT,sp)
      00A64A FA 20            [ 2] 3239 	ldw (TOWRITE,sp),x 
      00A64C 08 72            [ 1] 3240 	ld a,#BLOCK_SIZE 
      00A64E 11 54 01         [ 2] 3241 	cpw x,#BLOCK_SIZE 
      00A651 72 17            [ 1] 3242 	jruge 4$ 
      00A653 50               [ 1] 3243 	ld a,xl 
      00A654 CA 04            [ 1] 3244 4$:	ld (CNT_LO,sp),a 
      00A655 CD 27 C4         [ 4] 3245 	call clear_block_buffer 
      00A655 81 CE            [ 2] 3246 	jra 32$ 
      00A656                       3247 9$:	_drop VSIZE 
      00A656 CD 99            [ 2]    1     addw sp,#VSIZE 
      00A658 DF A1            [ 2] 3248     popw y 
      00A65A 01               [ 2] 3249 	popw x 
      00A65B 27               [ 4] 3250 	ret 
                                   3251 
                                   3252 
      00A65C 03 CC                 3253 SIGNATURE: .ascii "TB"
      00A65E 96 B8 90 F6 93 EE 01  3254 CANT_DO: .asciz "Can't save application, not enough free FLASH\n"
             72 A9 00 03 A3 00 05
             23 05 A6 0A CC 96 BA
             9F C7 00 0F A6 05 C0
             00 0F C7 54 00 72 16
             54 02 72 10 54 01 72
             0F 54 00 FB CE
      00A68D 54 04 A6 84 81 70 6C  3255 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3256 
                                   3257 ;---------------------
                                   3258 ; BASIC: DIR 
                                   3259 ; list programs saved 
                                   3260 ; in flash 
                                   3261 ;--------------------
                           000001  3262 	XTEMP=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A692                       3263 cmd_dir:
      00A692 52 01 CD         [ 2] 3264 	ldw x,#app_space 
      00A695 99               [ 2] 3265 	pushw x 
      00A696 DF               [ 2] 3266 1$: ldw x,(x)
      00A697 A1 01 27         [ 4] 3267 	call qsign 
      00A69A 03 CC            [ 1] 3268 	jrne 8$
      00A69C 96 B8            [ 2] 3269 	ldw x,(1,sp)
      00A69E 90 F6 93         [ 2] 3270 	addw x,#4
      00A6A1 EE 01 72 A9      [ 1] 3271 	mov base,#16
      00A6A5 00 03 A3         [ 4] 3272 	call prt_i16
      00A6A8 00 0F            [ 1] 3273 	ld a,#SPACE 
      00A6AA 23 05 A6         [ 4] 3274 	call putc 
      00A6AD 0A CC            [ 2] 3275 	ldw x,(1,sp)
      00A6AF 96 BA            [ 2] 3276 	ldw x,(2,x)
      00A6B1 CD AC 45 6B      [ 1] 3277 	mov base,#10 
      00A6B5 01 E6 01         [ 4] 3278 	call prt_i16 
      00A6B8 0D 01 27         [ 2] 3279 	ldw x,#STR_BYTES
      00A6BB 05 44 0A         [ 4] 3280 	call puts
      00A6BE 01 26            [ 1] 3281 	ld a,#', 
      00A6C0 FB A4 01         [ 4] 3282 	call putc
      00A6C3 5F 97            [ 2] 3283 	ldw x,(1,sp)
      00A6C5 4F 5B 01         [ 2] 3284 	addw x,#10
      00A6C8 81 09 3A         [ 4] 3285 	call puts 
      00A6C9 A6 0D            [ 1] 3286 	ld a,#CR 
      00A6C9 52 02 CD         [ 4] 3287 	call putc
      00A6CC 99 E4            [ 2] 3288 	ldw x,(1,sp)
      00A6CE A1 02 27         [ 2] 3289 	ldw acc16,x 
      00A6D1 03 CC            [ 2] 3290 	ldw x,(2,x)
      00A6D3 96 B8 90 F6      [ 2] 3291 	addw x,acc16 
      00A6D7 93 EE 01         [ 2] 3292 	addw x,#4 
      00A6DA 72 A9 00         [ 2] 3293 	addw x,#BLOCK_SIZE 
      00A6DD 03               [ 1] 3294 	ld a,xl 
      00A6DE 9F 6B            [ 1] 3295 	and a,#128 
      00A6E0 02               [ 1] 3296 	ld xl,a 
      00A6E1 90 F6            [ 2] 3297 	ldw (1,sp),x 
      00A6E3 93 EE            [ 2] 3298 	jra 1$  
      00290C                       3299 8$: ; done 
      00290C                       3300 	_drop 2 
      00A6E5 01 72            [ 2]    1     addw sp,#2 
      00A6E7 A9               [ 4] 3301 	ret 
                                   3302 
                                   3303 ;---------------------
                                   3304 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3305 ; write 1 or more byte to FLASH or EEPROM
                                   3306 ; starting at address  
                                   3307 ; input:
                                   3308 ;   expr1  	is address 
                                   3309 ;   expr2,...,exprn   are bytes to write
                                   3310 ; output:
                                   3311 ;   none 
                                   3312 ;---------------------
      00290F                       3313 write:
      00A6E8 00 03 A3         [ 4] 3314 	call expression
      00A6EB 00 0F            [ 1] 3315 	cp a,#TK_INTGR 
      00A6ED 23 05            [ 1] 3316 	jreq 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A6EF A6 0A CC         [ 2] 3317 	jp syntax_error
      002919                       3318 0$: _xpop 
      00A6F2 96 BA            [ 1]    1     ld a,(y)
      00A6F4 CD               [ 1]    2     ldw x,y 
      00A6F5 AC 45            [ 2]    3     ldw x,(1,x)
      00A6F7 6B 01 A6 01      [ 2]    4     addw y,#CELL_SIZE 
      00A6FB 0D 01 27         [ 1] 3319 	ld farptr,a 
      00A6FE 05 48 0A         [ 2] 3320 	ldw ptr16,x 
      002928                       3321 1$:	
      00A701 01 26 FB         [ 4] 3322 	call next_token 
      00A704 0D 02            [ 1] 3323 	cp a,#TK_COMMA 
      00A706 26 05            [ 1] 3324 	jreq 2$ 
      00A708 43 E4            [ 2] 3325 	jra 9$ ; no more data 
      00A70A 00 20 02         [ 4] 3326 2$:	call next_token 
      00A70D EA 00            [ 1] 3327 	cp a,#TK_CHAR 
      00A70F E7 00            [ 1] 3328 	jreq 4$ 
      00A711 5B 02            [ 1] 3329 	cp a,#TK_QSTR
      00A713 81 2A            [ 1] 3330 	jreq 6$
      00A714                       3331 	_unget_token 
      00A714 72 00 00 23 02   [ 1]    1      mov in,in.saved  
      00A719 4F 81 A8         [ 4] 3332 	call expression
      00A71B A1 84            [ 1] 3333 	cp a,#TK_INTGR
      00A71B AE A7            [ 1] 3334 	jreq 3$
      00A71D 42 CD 89         [ 2] 3335 	jp syntax_error
      00294B                       3336 3$:	_xpop 
      00A720 BA 5B            [ 1]    1     ld a,(y)
      00A722 02               [ 1]    2     ldw x,y 
      00A723 52 04            [ 2]    3     ldw x,(1,x)
      00A725 CD A0 7C AE      [ 2]    4     addw y,#CELL_SIZE 
      00A729 16               [ 1] 3337 	ld a,xl 
      00A72A 90               [ 1] 3338 	clrw x 
      00A72B CF 00 05         [ 4] 3339 	call write_byte
      00A72E 7F 72            [ 2] 3340 	jra 1$ 
      00295B                       3341 4$: ; write character 
      00A730 5F               [ 1] 3342 	ld a,(x)
      00A731 00 04 5F CF      [ 1] 3343 	inc in 
      00A735 00               [ 1] 3344 	clrw x 
      00A736 01 72 11         [ 4] 3345 	call write_byte 
      00A739 00 23            [ 2] 3346 	jra 1$ 
      002966                       3347 6$: ; write string 
      00A73B 72               [ 2] 3348 	pushw x 
      00A73C 18               [ 1] 3349 	ld a,(x)
      00A73D 00 23 CC 97      [ 1] 3350 	inc in 
      00A741 63               [ 1] 3351 	clrw x 
      00A742 0A 62 72         [ 4] 3352 	call write_byte 
      00A745 65               [ 2] 3353 	popw x 
      00A746 61               [ 1] 3354 	ld a,(x)
      00A747 6B 20            [ 1] 3355 	jreq 1$
      00A749 70               [ 1] 3356 	incw x 
      00A74A 6F 69            [ 2] 3357 	jra 6$ 	
      002977                       3358 9$:
      00A74C 6E               [ 4] 3359 	ret 
                                   3360 
                                   3361 
                                   3362 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3363 ;BASIC: CHAR(expr)
                                   3364 ; évaluate expression 
                                   3365 ; and take the 7 least 
                                   3366 ; bits as ASCII character
                                   3367 ; output: 
                                   3368 ; 	A char 
                                   3369 ;---------------------
      002978                       3370 func_char:
      00A74D 74 2C 20         [ 4] 3371 	call func_args 
      00A750 52 55            [ 1] 3372 	cp a,#1
      00A752 4E 20            [ 1] 3373 	jreq 1$
      00A754 74 6F 20         [ 2] 3374 	jp syntax_error
      002982                       3375 1$:	_xpop
      00A757 72 65            [ 1]    1     ld a,(y)
      00A759 73               [ 1]    2     ldw x,y 
      00A75A 75 6D            [ 2]    3     ldw x,(1,x)
      00A75C 65 2E 0A 00      [ 2]    4     addw y,#CELL_SIZE 
      00A760 9F               [ 1] 3376 	ld a,xl
      00A760 72 01            [ 1] 3377 	and a,#0x7f 
      00A762 00               [ 4] 3378 	ret
                                   3379 
                                   3380 ;---------------------
                                   3381 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3382 ; extract first character 
                                   3383 ; of string argument 
                                   3384 ; output:
                                   3385 ;    A:X    int24 
                                   3386 ;---------------------
      00298F                       3387 ascii:
      00A763 23 01            [ 1] 3388 	ld a,#TK_LPAREN
      00A765 81 19 52         [ 4] 3389 	call expect 
      00A766 CD 17 9C         [ 4] 3390 	call next_token 
      00A766 CD 94            [ 1] 3391 	cp a,#TK_QSTR 
      00A768 F0 81            [ 1] 3392 	jreq 1$
      00A76A A1 04            [ 1] 3393 	cp a,#TK_CHAR 
      00A76A 72 01            [ 1] 3394 	jreq 2$ 
      00A76C 00 23            [ 1] 3395 	cp a,#TK_CFUNC 
      00A76E 05 A6            [ 1] 3396 	jreq 0$
      00A770 07 CC 96         [ 2] 3397 	jp syntax_error
      0029A6                       3398 0$: ; cfunc 
      00A773 BA               [ 4] 3399 	call (x)
      00A774 20 0B            [ 2] 3400 	jra 3$
      0029A9                       3401 1$: ; quoted string 
      00A774 72               [ 1] 3402 	ld a,(x)
      00A775 5F               [ 1] 3403 	push a  
      00A776 00 19 52         [ 4] 3404 	call skip_string
      00A779 03               [ 1] 3405 	pop a  	
      00A77A CD 98            [ 2] 3406 	jra 3$ 
      0029B1                       3407 2$: ; character 
      00A77C 1C A1 04         [ 4] 3408 	call get_char 
      00A77F 27               [ 1] 3409 3$:	clrw x 
      00A780 03               [ 1] 3410 	rlwa x   
      0029B6                       3411 4$:	_xpush  
      00A781 CC 96 B8 CD      [ 2]    1     subw y,#CELL_SIZE
      00A785 98 5E            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A787 A4 DF A1         [ 2]    3     ldw (1,y),x 
      00A78A 45 26            [ 1] 3412 	ld a,#TK_RPAREN 
      00A78C 0C AE 40         [ 4] 3413 	call expect
      0029C4                       3414 9$:	
      0029C4                       3415 	_xpop  
      00A78F 00 CF            [ 1]    1     ld a,(y)
      00A791 00               [ 1]    2     ldw x,y 
      00A792 1A AE            [ 2]    3     ldw x,(1,x)
      00A794 47 FF 4F 20      [ 2]    4     addw y,#CELL_SIZE 
      00A798 15               [ 4] 3416 	ret 
                                   3417 
                                   3418 ;---------------------
                                   3419 ;BASIC: KEY
                                   3420 ; wait for a character 
                                   3421 ; received from STDIN 
                                   3422 ; input:
                                   3423 ;	none 
                                   3424 ; output:
                                   3425 ;	a	 character 
                                   3426 ;---------------------
      0029CE                       3427 key:
      00A799 A1 46 27         [ 4] 3428 	call getc 
      00A79C 06               [ 4] 3429 	ret
                                   3430 
                                   3431 ;----------------------
                                   3432 ; BASIC: QKEY
                                   3433 ; Return true if there 
                                   3434 ; is a character in 
                                   3435 ; waiting in STDIN 
                                   3436 ; input:
                                   3437 ;  none 
                                   3438 ; output:
                                   3439 ;   A     0|-1
                                   3440 ;-----------------------
      0029D2                       3441 qkey:: 
      00A79D AE               [ 1] 3442 	clrw x 
      00A79E 95 DC CC         [ 1] 3443 	ld a,rx1_head
      00A7A1 96 BA 2F         [ 1] 3444 	sub a,rx1_tail 
      00A7A3 27 03            [ 1] 3445 	jreq 9$ 
      00A7A3 AE               [ 2] 3446 	cplw x
      00A7A4 B7 00            [ 1] 3447 	ld a,#255    
      0029DE                       3448 9$: 
      00A7A6 CF               [ 4] 3449 	ret 
                                   3450 
                                   3451 ;---------------------
                                   3452 ; BASIC: GPIO(port,reg)
                                   3453 ; return gpio register address 
                                   3454 ; expr {PORTA..PORTI}
                                   3455 ; input:
                                   3456 ;   none 
                                   3457 ; output:
                                   3458 ;   A:X 	gpio register address
                                   3459 ;----------------------------
                                   3460 ;	N=PORT
                                   3461 ;	T=REG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      0029DF                       3462 gpio:
      00A7A7 00 1A A6         [ 4] 3463 	call func_args 
      00A7AA 02 AE            [ 1] 3464 	cp a,#2
      00A7AC 7F FF            [ 1] 3465 	jreq 1$
      00A7AE CC 16 38         [ 2] 3466 	jp syntax_error  
      0029E9                       3467 1$:	_at_next 
      00A7AE 6B 01 1F         [ 1]    1     ld a,(3,y)
      00A7B1 02               [ 1]    2     ldw x,y 
      00A7B2 CD 87            [ 2]    3     ldw x,(4,x)
      00A7B4 57 CD 98         [ 2] 3468 	cpw x,#PA_BASE 
      00A7B7 1C A1            [ 1] 3469 	jrmi bad_port
      00A7B9 00 27 44         [ 2] 3470 	cpw x,#PI_BASE+1 
      00A7BC 55 00            [ 1] 3471 	jrpl bad_port
      00A7BE 03               [ 2] 3472 	pushw x 
      0029FA                       3473 	_xpop
      00A7BF 00 02            [ 1]    1     ld a,(y)
      00A7C1 CD               [ 1]    2     ldw x,y 
      00A7C2 9B 28            [ 2]    3     ldw x,(1,x)
      00A7C4 A1 84 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A7C8 CC 96 B8         [ 2] 3474 	addw x,(1,sp)
      00A7CB                       3475 	_drop 2 
      00A7CB 90 F6            [ 2]    1     addw sp,#2 
      00A7CD 93               [ 1] 3476 	clr a 
      00A7CE EE               [ 4] 3477 	ret
      002A0A                       3478 bad_port:
      00A7CF 01 72            [ 1] 3479 	ld a,#ERR_BAD_VALUE
      00A7D1 A9 00 03         [ 2] 3480 	jp tb_error
                                   3481 
                                   3482 
                                   3483 ;-------------------------
                                   3484 ; BASIC: UFLASH 
                                   3485 ; return free flash address
                                   3486 ; align to BLOCK address 
                                   3487 ; input:
                                   3488 ;  none 
                                   3489 ; output:
                                   3490 ;	A		TK_INTGR
                                   3491 ;   xstack	free address 
                                   3492 ;---------------------------
                           000001  3493 	SIGN_ADDR=1 
      002A0F                       3494 uflash:
      00A7D4 4D 26 14         [ 2] 3495 	ldw x,#app_space 
      00A7D7 A3               [ 2] 3496 	pushw x 
      00A7D8 B7               [ 2] 3497 1$:	ldw x,(x) 
      00A7D9 00 24 0F         [ 4] 3498 	call qsign 
      00A7DC A3 40            [ 1] 3499 	jrne 2$
      00A7DE 00 25            [ 2] 3500 	ldw x,(1,sp)
      00A7E0 05 A3 47         [ 2] 3501 	ldw acc16,x 
      00A7E3 FF 25            [ 2] 3502 	ldw x,(2,x)
      00A7E5 10 BB 00 0D      [ 2] 3503 	addw x,acc16  
      00A7E6 1C 00 04         [ 2] 3504 	addw x,#4
                                   3505 ; align on 128 bytes block 
      00A7E6 A6 0A CC         [ 2] 3506 	addw x,#BLOCK_SIZE 
      00A7E9 96               [ 1] 3507 	ld a,xl 
      00A7EA B8 80            [ 1] 3508 	and a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A7EB 97               [ 1] 3509 	ld xl,a 
      00A7EB A1 02            [ 2] 3510 	ldw (1,sp),x 
      00A7ED 22 F7            [ 2] 3511 	jra 1$
      00A7EF 25               [ 2] 3512 2$: popw x 
      00A7F0 05               [ 1] 3513 	clr a 
      00A7F1 C3               [ 4] 3514 	ret 
                                   3515 
                                   3516 
                                   3517 ;---------------------
                                   3518 ; BASIC: USR(addr,arg)
                                   3519 ; execute a function written 
                                   3520 ; in binary code.
                                   3521 ; input:
                                   3522 ;   addr	routine address 
                                   3523 ;   arg 	is an argument
                                   3524 ;           it can be ignore 
                                   3525 ;           by cally. 
                                   3526 ; output:
                                   3527 ;   xstack 	value returned by cally  
                                   3528 ;---------------------
      002A35                       3529 usr:
      00A7F2 7F FF 22         [ 4] 3530 	call func_args 
      00A7F5 F0 02            [ 1] 3531 	cp a,#2
      00A7F6 27 03            [ 1] 3532 	jreq 1$  
      00A7F6 C7 00 19         [ 2] 3533 	jp syntax_error 
      002A3F                       3534 1$: 
      002A3F                       3535 	_at_next ; A:X addr 
      00A7F9 9F A4 80         [ 1]    1     ld a,(3,y)
      00A7FC 97               [ 1]    2     ldw x,y 
      00A7FD CF 00            [ 2]    3     ldw x,(4,x)
      00A7FF 1A 00 19         [ 2] 3536 	ldw ptr16,X 
      00A800                       3537 	_xpop  ; arg 
      00A800 CD 88            [ 1]    1     ld a,(y)
      00A802 DD               [ 1]    2     ldw x,y 
      00A803 27 08            [ 2]    3     ldw x,(1,x)
      00A805 A6 45 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      002A51                       3538 	_store_top ; overwrite addr 
      00A809 5D CD            [ 1]    1     ld (y),a 
      00A80B 87 D5 AE         [ 2]    2     ldw (1,y),x     
      00A80E 00 80 CD 88      [ 6] 3539     call [ptr16]
      00A812 CF               [ 4] 3540 	ret 
                                   3541 
                                   3542 
                                   3543 ;------------------------------
                                   3544 ; BASIC: BYE 
                                   3545 ; halt mcu in its lowest power mode 
                                   3546 ; wait for reset or external interrupt
                                   3547 ; do a cold start on wakeup.
                                   3548 ;------------------------------
      002A5B                       3549 bye:
      00A813 7B 01 1E 02 72   [ 2] 3550 	btjf UART1_SR,#UART_SR_TC,.
      00A818 B0               [10] 3551 	halt
      00A819 00 1A C2         [ 2] 3552 	jp cold_start  
                                   3553 
                                   3554 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3555 ; BASIC: SLEEP 
                                   3556 ; halt mcu until reset or external
                                   3557 ; interrupt.
                                   3558 ; Resume progam after SLEEP command
                                   3559 ;----------------------------------
      002A64                       3560 sleep:
      00A81C 00 19 22 E0 CD   [ 2] 3561 	btjf UART1_SR,#UART_SR_TC,.
      00A821 94 F0 1E 02      [ 1] 3562 	bset flags,#FSLEEP
      00A825 A3               [10] 3563 	halt 
      00A826 47               [ 4] 3564 	ret 
                                   3565 
                                   3566 ;-------------------------------
                                   3567 ; BASIC: PAUSE expr 
                                   3568 ; suspend execution for n msec.
                                   3569 ; input:
                                   3570 ;	none
                                   3571 ; output:
                                   3572 ;	none 
                                   3573 ;------------------------------
      002A6F                       3574 pause:
      00A827 FF 26 03         [ 4] 3575 	call expression
      00A82A CD 9D            [ 1] 3576 	cp a,#TK_INTGR
      00A82C 54 03            [ 1] 3577 	jreq 1$ 
      00A82D CC 16 38         [ 2] 3578 	jp syntax_error
      002A79                       3579 1$: _xpop 
      00A82D 5B 03            [ 1]    1     ld a,(y)
      00A82F 81               [ 1]    2     ldw x,y 
      00A830 EE 01            [ 2]    3     ldw x,(1,x)
      00A830 C3 A8 EE 81      [ 2]    4     addw y,#CELL_SIZE 
      00A834                       3580 pause02:
      00A834 88 4D 27         [ 2] 3581 	ldw timer,x 
      00A837 0A F6 5C         [ 2] 3582 1$: ldw x,timer 
      00A83A 90               [ 2] 3583 	tnzw x 
      00A83B F7 90            [ 1] 3584 	jreq 2$
      00A83D 5C               [10] 3585 	wfi 
      00A83E 0A 01            [ 1] 3586 	jrne 1$
      002A8E                       3587 2$:	
      00A840 26               [ 4] 3588 	ret 
                                   3589 
                                   3590 ;------------------------------
                                   3591 ; BASIC: AWU expr
                                   3592 ; halt mcu for 'expr' milliseconds
                                   3593 ; use Auto wakeup peripheral
                                   3594 ; all oscillators stopped except LSI
                                   3595 ; range: 1ms - 511ms
                                   3596 ; input:
                                   3597 ;  none
                                   3598 ; output:
                                   3599 ;  none:
                                   3600 ;------------------------------
      002A8F                       3601 awu:
      00A841 F6 84 81         [ 4] 3602   call expression
      00A844 A1 84            [ 1] 3603   cp a,#TK_INTGR
      00A844 88 90            [ 1] 3604   jreq 1$
      00A846 AE 16 E0         [ 2] 3605   jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      002A99                       3606 1$: _xpop 
      00A849 90 89            [ 1]    1     ld a,(y)
      00A84B A6               [ 1]    2     ldw x,y 
      00A84C 80 90            [ 2]    3     ldw x,(1,x)
      00A84E 7F 90 5C 4A      [ 2]    4     addw y,#CELL_SIZE 
      002AA2                       3607 awu02:
      00A852 26 F9 90         [ 2] 3608   cpw x,#5120
      00A855 85 84            [ 1] 3609   jrmi 1$ 
      00A857 81 0F 50 F2      [ 1] 3610   mov AWU_TBR,#15 
      00A858 A6 1E            [ 1] 3611   ld a,#30
      00A858 89               [ 2] 3612   div x,a
      00A859 90 89            [ 1] 3613   ld a,#16
      00A85B 52               [ 2] 3614   div x,a 
      00A85C 06 CD            [ 2] 3615   jra 4$
      002AB3                       3616 1$: 
      00A85E 9E 6E 26         [ 2] 3617   cpw x,#2048
      00A861 09 AE            [ 1] 3618   jrmi 2$ 
      00A863 A9 1F CD 89      [ 1] 3619   mov AWU_TBR,#14
      00A867 BA CC            [ 1] 3620   ld a,#80
      00A869 A8               [ 2] 3621   div x,a 
      00A86A E8 1F            [ 2] 3622   jra 4$   
      002AC1                       3623 2$:
      00A86C 05 CD AA 8F      [ 1] 3624   mov AWU_TBR,#7
      002AC5                       3625 3$:  
                                   3626 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A870 72 5F 00         [ 2] 3627   cpw x,#64 
      00A873 19 CF            [ 2] 3628   jrule 4$ 
      00A875 00 1A AE FF      [ 1] 3629   inc AWU_TBR 
      00A879 FF               [ 2] 3630   srlw x 
      00A87A 72 B0            [ 2] 3631   jra 3$ 
      002AD1                       3632 4$:
      00A87C 00               [ 1] 3633   ld a, xl
      00A87D 1A               [ 1] 3634   dec a 
      00A87E 1D 00            [ 1] 3635   jreq 5$
      00A880 04               [ 1] 3636   dec a 	
      002AD6                       3637 5$: 
      00A881 13 05            [ 1] 3638   and a,#0x3e 
      00A883 24 09 AE         [ 1] 3639   ld AWU_APR,a 
      00A886 A8 F0 CD 89      [ 1] 3640   bset AWU_CSR,#AWU_CSR_AWUEN
      00A88A BA               [10] 3641   halt 
                                   3642 
      00A88B CC               [ 4] 3643   ret 
                                   3644 
                                   3645 ;------------------------------
                                   3646 ; BASIC: TICKS
                                   3647 ; return msec ticks counter value 
                                   3648 ; input:
                                   3649 ; 	none 
                                   3650 ; output:
                                   3651 ;	X 		TK_INTGR
                                   3652 ;-------------------------------
      002AE1                       3653 get_ticks:
      00A88C A8 E8 0F         [ 1] 3654 	ld a,ticks 
      00A88E CE 00 10         [ 2] 3655 	ldw x,ticks+1 
      00A88E CD               [ 4] 3656 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3657 
                                   3658 ;------------------------------
                                   3659 ; BASIC: ABS(expr)
                                   3660 ; return absolute value of expr.
                                   3661 ; input:
                                   3662 ;   none
                                   3663 ; output:
                                   3664 ;   xstack    positive int24 
                                   3665 ;-------------------------------
      002AE8                       3666 abs:
      00A88F 87 97 0F         [ 4] 3667 	call func_args 
      00A892 03 CD            [ 1] 3668 	cp a,#1 
      00A894 A8 44            [ 1] 3669 	jreq 0$ 
      00A896 CE A8 EE         [ 2] 3670 	jp syntax_error
      002AF2                       3671 0$:  
      00A899 90 FF 72         [ 4] 3672 	call abs24 
      002AF5                       3673 	_xpop 
      00A89C A9 00            [ 1]    1     ld a,(y)
      00A89E 02               [ 1]    2     ldw x,y 
      00A89F 1E 05            [ 2]    3     ldw x,(1,x)
      00A8A1 90 FF 72 A9      [ 2]    4     addw y,#CELL_SIZE 
      00A8A5 00               [ 4] 3674 	ret 
                                   3675 
                                   3676 ;------------------------------
                                   3677 ; BASIC: LSHIFT(expr1,expr2)
                                   3678 ; logical shift left expr1 by 
                                   3679 ; expr2 bits 
                                   3680 ; output:
                                   3681 ; 	A:x 	result 
                                   3682 ;------------------------------
      002AFF                       3683 lshift:
      00A8A6 02 A6 7C         [ 4] 3684 	call func_args
      00A8A9 A3 00            [ 1] 3685 	cp a,#2 
      00A8AB 7C 22            [ 1] 3686 	jreq 1$
      00A8AD 01 9F 6B         [ 2] 3687 	jp syntax_error
      002B09                       3688 1$: _xpop 
      00A8B0 04 CE            [ 1]    1     ld a,(y)
      00A8B2 00               [ 1]    2     ldw x,y 
      00A8B3 1C 1F            [ 2]    3     ldw x,(1,x)
      00A8B5 01 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8B6 9F               [ 1] 3689 	ld a,xl 
      00A8B6 1E               [ 1] 3690 	push a      
      002B14                       3691 	_xpop  ; T>A:X 
      00A8B7 01 7B            [ 1]    1     ld a,(y)
      00A8B9 04               [ 1]    2     ldw x,y 
      00A8BA CD A8            [ 2]    3     ldw x,(1,x)
      00A8BC 34 1F 01 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A8C0 16 E0            [ 1] 3692 	tnz (1,sp) 
      00A8C2 CD 87            [ 1] 3693 	jreq 4$
      00A8C4 B1               [ 1] 3694 2$:	rcf 
      00A8C5 AE               [ 2] 3695 	rlcw x 
      00A8C6 00               [ 1] 3696 	rlc a 
      00A8C7 80 CD            [ 1] 3697 	dec (1,sp) 
      00A8C9 88 CF            [ 1] 3698 	jrne 2$
      002B28                       3699 4$: _drop 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A8CB 1E 01            [ 2]    1     addw sp,#1 
      00A8CD C3               [ 4] 3700 	ret
                                   3701 
                                   3702 ;------------------------------
                                   3703 ; BASIC: RSHIFT(expr1,expr2)
                                   3704 ; logical shift right expr1 by 
                                   3705 ; expr2 bits.
                                   3706 ; output:
                                   3707 ; 	A 		TK_INTGR
                                   3708 ;   X 		result 
                                   3709 ;------------------------------
      002B2B                       3710 rshift:
      00A8CE 00 1E 24         [ 4] 3711 	call func_args
      00A8D1 16 1E            [ 1] 3712 	cp a,#2 
      00A8D3 05 72            [ 1] 3713 	jreq 1$
      00A8D5 F0 03 1F         [ 2] 3714 	jp syntax_error
      002B35                       3715 1$: _xpop ; T>A:X
      00A8D8 05 A6            [ 1]    1     ld a,(y)
      00A8DA 80               [ 1]    2     ldw x,y 
      00A8DB A3 00            [ 2]    3     ldw x,(1,x)
      00A8DD 80 24 01 9F      [ 2]    4     addw y,#CELL_SIZE 
      00A8E1 6B               [ 1] 3716     ld a,xl 
      00A8E2 04               [ 1] 3717 	push a    
      002B40                       3718 	_xpop  
      00A8E3 CD A8            [ 1]    1     ld a,(y)
      00A8E5 44               [ 1]    2     ldw x,y 
      00A8E6 20 CE            [ 2]    3     ldw x,(1,x)
      00A8E8 5B 06 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00A8EC 85 81            [ 1] 3719 	tnz (1,sp)
      00A8EE 54 42            [ 1] 3720 	jreq 4$
      00A8F0 43               [ 1] 3721 2$:	rcf 
      00A8F1 61               [ 1] 3722 	rrc a 
      00A8F2 6E               [ 2] 3723 	rrcw x 
      00A8F3 27 74            [ 1] 3724 	dec (1,sp) 
      00A8F5 20 73            [ 1] 3725 	jrne 2$
      002B54                       3726 4$: _drop 1 
      00A8F7 61 76            [ 2]    1     addw sp,#1 
      00A8F9 65               [ 4] 3727 	ret
                                   3728 
                                   3729 ;--------------------------
                                   3730 ; BASIC: FCPU integer
                                   3731 ; set CPU frequency 
                                   3732 ;-------------------------- 
                                   3733 
      002B57                       3734 fcpu:
      00A8FA 20 61            [ 1] 3735 	ld a,#TK_INTGR
      00A8FC 70 70 6C         [ 4] 3736 	call expect 
      00A8FF 69 63 61         [ 4] 3737 	call get_int24 
      00A902 74               [ 1] 3738 	ld a,xl 
      00A903 69 6F            [ 1] 3739 	and a,#7 
      00A905 6E 2C 20         [ 1] 3740 	ld CLK_CKDIVR,a 
      00A908 6E               [ 4] 3741 	ret 
                                   3742 
                                   3743 ;------------------------------
                                   3744 ; BASIC: PMODE pin#, mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3745 ; Arduino pin. 
                                   3746 ; define pin as input or output
                                   3747 ; pin#: {0..15}
                                   3748 ; mode: INPUT|OUTPUT  
                                   3749 ;------------------------------
                           000001  3750 	PINNO=1
                           000001  3751 	VSIZE=1
      002B66                       3752 pin_mode:
      002B66                       3753 	_vars VSIZE 
      00A909 6F 74            [ 2]    1     sub sp,#VSIZE 
      00A90B 20 65 6E         [ 4] 3754 	call arg_list 
      00A90E 6F 75            [ 1] 3755 	cp a,#2 
      00A910 67 68            [ 1] 3756 	jreq 1$
      00A912 20 66 72         [ 2] 3757 	jp syntax_error 
      002B72                       3758 1$: _xpop 
      00A915 65 65            [ 1]    1     ld a,(y)
      00A917 20               [ 1]    2     ldw x,y 
      00A918 46 4C            [ 2]    3     ldw x,(1,x)
      00A91A 41 53 48 0A      [ 2]    4     addw y,#CELL_SIZE 
      00A91E 00 4E 6F         [ 2] 3759 	ldw ptr16,x ; mode 
      002B7E                       3760 	_xpop ; Dx pin 
      00A921 20 61            [ 1]    1     ld a,(y)
      00A923 70               [ 1]    2     ldw x,y 
      00A924 70 6C            [ 2]    3     ldw x,(1,x)
      00A926 69 63 61 74      [ 2]    4     addw y,#CELL_SIZE 
      00A92A 69 6F 6E         [ 4] 3761 	call select_pin 
      00A92D 20 69            [ 1] 3762 	ld (PINNO,sp),a  
      00A92F 6E 20            [ 1] 3763 	ld a,#1 
      00A931 52 41            [ 1] 3764 	tnz (PINNO,sp)
      00A933 4D 00            [ 1] 3765 	jreq 4$
      00A935 48               [ 1] 3766 2$:	sll a 
      00A935 AE B7            [ 1] 3767 	dec (PINNO,sp)
      00A937 00 89            [ 1] 3768 	jrne 2$ 
      00A939 FE CD            [ 1] 3769 	ld (PINNO,sp),a
      00A93B A8 30            [ 1] 3770 	ld a,(PINNO,sp)
      00A93D 26 4D            [ 1] 3771 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A93F 1E 01            [ 1] 3772 	ld (GPIO_CR1,x),a 
      00A941 1C 00            [ 1] 3773 4$:	ld a,#OUTP
      00A943 04 35 10         [ 1] 3774 	cp a,acc8 
      00A946 00 0B            [ 1] 3775 	jreq 6$
                                   3776 ; input mode
                                   3777 ; disable external interrupt 
      00A948 CD 98            [ 1] 3778 	ld a,(PINNO,sp)
      00A94A 64               [ 1] 3779 	cpl a 
      00A94B A6 20            [ 1] 3780 	and a,(GPIO_CR2,x)
      00A94D CD 89            [ 1] 3781 	ld (GPIO_CR2,x),a 
                                   3782 ;clear bit in DDR for input mode 
      00A94F 5D 1E            [ 1] 3783 	ld a,(PINNO,sp)
      00A951 01               [ 1] 3784 	cpl a 
      00A952 EE 02            [ 1] 3785 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A954 35 0A            [ 1] 3786 	ld (GPIO_DDR,x),a 
      00A956 00 0B            [ 2] 3787 	jra 9$
      002BB6                       3788 6$: ;output mode  
      00A958 CD 98            [ 1] 3789 	ld a,(PINNO,sp)
      00A95A 64 AE            [ 1] 3790 	or a,(GPIO_DDR,x) ; bit==1 for output 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A95C 9E D8            [ 1] 3791 	ld (GPIO_DDR,x),a 
      00A95E CD 89            [ 1] 3792 	ld a,(PINNO,sp)
      00A960 BA A6            [ 1] 3793 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A962 2C CD            [ 1] 3794 	ld (GPIO_CR2,x),a 
      002BC2                       3795 9$:	
      002BC2                       3796 	_drop VSIZE 
      00A964 89 5D            [ 2]    1     addw sp,#VSIZE 
      00A966 1E               [ 4] 3797 	ret
                                   3798 
                                   3799 ;------------------------
                                   3800 ; select Arduino pin 
                                   3801 ; input:
                                   3802 ;   X 	 {0..15} Arduino Dx 
                                   3803 ; output:
                                   3804 ;   A     stm8s208 pin 
                                   3805 ;   X     base address s208 GPIO port 
                                   3806 ;---------------------------
      002BC5                       3807 select_pin:
      00A967 01               [ 2] 3808 	sllw x 
      00A968 1C 00 0A         [ 2] 3809 	addw x,#arduino_to_8s208 
      00A96B CD               [ 2] 3810 	ldw x,(x)
      00A96C 89               [ 1] 3811 	ld a,xl 
      00A96D BA               [ 1] 3812 	push a 
      00A96E A6               [ 1] 3813 	swapw x 
      00A96F 0D CD            [ 1] 3814 	ld a,#5 
      00A971 89               [ 4] 3815 	mul x,a 
      00A972 5D 1E 01         [ 2] 3816 	addw x,#GPIO_BASE 
      00A975 CF               [ 1] 3817 	pop a 
      00A976 00               [ 4] 3818 	ret 
                                   3819 ; translation from Arduino D0..D15 to stm8s208rb 
      002BD5                       3820 arduino_to_8s208:
      00A977 0E EE                 3821 .byte 3,6 ; D0 
      00A979 02 72                 3822 .byte 3,5 ; D1 
      00A97B BB 00                 3823 .byte 4,0 ; D2 
      00A97D 0E 1C                 3824 .byte 2,1 ; D3
      00A97F 00 04                 3825 .byte 6,0 ; D4
      00A981 1C 00                 3826 .byte 2,2 ; D5
      00A983 80 9F                 3827 .byte 2,3 ; D6
      00A985 A4 80                 3828 .byte 3,1 ; D7
      00A987 97 1F                 3829 .byte 3,3 ; D8
      00A989 01 20                 3830 .byte 2,4 ; D9
      00A98B AD 05                 3831 .byte 4,5 ; D10
      00A98C 02 06                 3832 .byte 2,6 ; D11
      00A98C 5B 02                 3833 .byte 2,7 ; D12
      00A98E 81 05                 3834 .byte 2,5 ; D13
      00A98F 04 02                 3835 .byte 4,2 ; D14
      00A98F CD 9B                 3836 .byte 4,1 ; D15
                                   3837 
                                   3838 
                                   3839 ;------------------------------
                                   3840 ; BASIC: RND(expr)
                                   3841 ; return random number 
                                   3842 ; between 1 and expr inclusive
                                   3843 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3844 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3845 ; 	none 
                                   3846 ; output:
                                   3847 ;	xstack 	random positive integer 
                                   3848 ;------------------------------
      002BF5                       3849 random:
      00A991 28 A1 84         [ 4] 3850 	call func_args 
      00A994 27 03            [ 1] 3851 	cp a,#1
      00A996 CC 96            [ 1] 3852 	jreq 1$
      00A998 B8 90 F6         [ 2] 3853 	jp syntax_error
      002BFF                       3854 1$:  
      002BFF                       3855 	_xpop   
      00A99B 93 EE            [ 1]    1     ld a,(y)
      00A99D 01               [ 1]    2     ldw x,y 
      00A99E 72 A9            [ 2]    3     ldw x,(1,x)
      00A9A0 00 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A9A4 19               [ 2] 3856 	pushw x 
      00A9A5 CF               [ 1] 3857 	push a  
      00A9A6 00 1A            [ 1] 3858 	ld a,#0x80 
      00A9A8 15 01            [ 1] 3859 	bcp a,(1,sp)
      00A9A8 CD 98            [ 1] 3860 	jreq 2$
      00A9AA 1C A1            [ 1] 3861 	ld a,#ERR_BAD_VALUE
      00A9AC 08 27 02         [ 2] 3862 	jp tb_error
      002C15                       3863 2$: 
                                   3864 ; acc16=(x<<5)^x 
      00A9AF 20 46 CD         [ 2] 3865 	ldw x,seedx 
      00A9B2 98               [ 2] 3866 	sllw x 
      00A9B3 1C               [ 2] 3867 	sllw x 
      00A9B4 A1               [ 2] 3868 	sllw x 
      00A9B5 04               [ 2] 3869 	sllw x 
      00A9B6 27               [ 2] 3870 	sllw x 
      00A9B7 23               [ 1] 3871 	ld a,xh 
      00A9B8 A1 02 27         [ 1] 3872 	xor a,seedx 
      00A9BB 2A 55 00         [ 1] 3873 	ld acc16,a 
      00A9BE 03               [ 1] 3874 	ld a,xl 
      00A9BF 00 02 CD         [ 1] 3875 	xor a,seedx+1 
      00A9C2 9B 28 A1         [ 1] 3876 	ld acc8,a 
                                   3877 ; seedx=seedy 
      00A9C5 84 27 03         [ 2] 3878 	ldw x,seedy 
      00A9C8 CC 96 B8         [ 2] 3879 	ldw seedx,x  
                                   3880 ; seedy=seedy^(seedy>>1)
      00A9CB 90 F6 93         [ 2] 3881 	ldw x,seedy 
      00A9CE EE               [ 2] 3882 	srlw x 
      00A9CF 01               [ 1] 3883 	ld a,xh 
      00A9D0 72 A9 00         [ 1] 3884 	xor a,seedy 
      00A9D3 03 9F 5F         [ 1] 3885 	ld seedy,a  
      00A9D6 CD               [ 1] 3886 	ld a,xl 
      00A9D7 87 FB 20         [ 1] 3887 	xor a,seedy+1 
      00A9DA CD 00 17         [ 1] 3888 	ld seedy+1,a 
                                   3889 ; acc16>>3 
      00A9DB CE 00 0D         [ 2] 3890 	ldw x,acc16 
      00A9DB F6               [ 2] 3891 	srlw x 
      00A9DC 72               [ 2] 3892 	srlw x 
      00A9DD 5C               [ 2] 3893 	srlw x 
                                   3894 ; x=acc16^x 
      00A9DE 00               [ 1] 3895 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A9DF 02 5F CD         [ 1] 3896 	xor a,acc16 
      00A9E2 87 FB 20         [ 1] 3897 	ld acc16,a 
      00A9E5 C2               [ 1] 3898 	ld a,xl 
      00A9E6 C8 00 0E         [ 1] 3899 	xor a,acc8 
      00A9E6 89 F6 72         [ 1] 3900 	ld acc8,a 
                                   3901 ; seedy=acc16^seedy 
      00A9E9 5C 00 02         [ 1] 3902 	xor a,seedy+1
      00A9EC 5F               [ 1] 3903 	ld xl,a 
      00A9ED CD 87 FB         [ 1] 3904 	ld a,acc16 
      00A9F0 85 F6 27         [ 1] 3905 	xor a,seedy
      00A9F3 B4               [ 1] 3906 	ld xh,a 
      00A9F4 5C 20 EF         [ 2] 3907 	ldw seedy,x 
                                   3908 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A9F7 C6 00 15         [ 1] 3909 	ld a,seedx+1
      00A9F7 81 7F            [ 1] 3910 	and a,#127
      00A9F8                       3911 	_xpush 
      00A9F8 CD 99 DF A1      [ 2]    1     subw y,#CELL_SIZE
      00A9FC 01 27            [ 1]    2     ld (y),a 
      00A9FE 03 CC 96         [ 2]    3     ldw (1,y),x 
      00AA01 B8               [ 1] 3912 	pop a 
      00AA02 90               [ 2] 3913 	popw x 
      002C75                       3914 	_xpush 
      00AA03 F6 93 EE 01      [ 2]    1     subw y,#CELL_SIZE
      00AA07 72 A9            [ 1]    2     ld (y),a 
      00AA09 00 03 9F         [ 2]    3     ldw (1,y),x 
      00AA0C A4 7F 81         [ 4] 3915 	call mod24 
      00AA0F                       3916 	_xpop
      00AA0F A6 06            [ 1]    1     ld a,(y)
      00AA11 CD               [ 1]    2     ldw x,y 
      00AA12 99 D2            [ 2]    3     ldw x,(1,x)
      00AA14 CD 98 1C A1      [ 2]    4     addw y,#CELL_SIZE 
      00AA18 02 27 0E         [ 2] 3917 	addw x,#1 
      00AA1B A1 04            [ 1] 3918 	adc a,#0  
      00AA1D 27               [ 4] 3919 	ret 
                                   3920 
                                   3921 ;---------------------------------
                                   3922 ; BASIC: WORDS 
                                   3923 ; affiche la listes des mots du
                                   3924 ; dictionnaire ainsi que le nombre
                                   3925 ; de mots.
                                   3926 ;---------------------------------
                           000001  3927 	WLEN=1 ; word length
                           000002  3928 	LLEN=2 ; character sent to console
                           000003  3929 	WCNT=3 ; count words printed 
                           000003  3930 	VSIZE=3 
      002C90                       3931 words:
      00AA1E 12 A1            [ 2] 3932 	pushw y
      002C92                       3933 	_vars VSIZE
      00AA20 82 27            [ 2]    1     sub sp,#VSIZE 
      00AA22 03 CC            [ 1] 3934 	clr (LLEN,sp)
      00AA24 96 B8            [ 1] 3935 	clr (WCNT,sp)
      00AA26 90 AE 34 6D      [ 2] 3936 	ldw y,#kword_dict+2
      00AA26 FD               [ 1] 3937 0$:	ldw x,y
      00AA27 20               [ 1] 3938 	ld a,(x)
      00AA28 0B 0F            [ 1] 3939 	and a,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00AA29 6B 01            [ 1] 3940 	ld (WLEN,sp),a 
      00AA29 F6 88            [ 1] 3941 	inc (WCNT,sp)
      00AA2B CD               [ 1] 3942 1$:	incw x 
      00AA2C 98               [ 1] 3943 	ld a,(x)
      00AA2D 35 84 20         [ 4] 3944 	call putc 
      00AA30 03 02            [ 1] 3945 	inc (LLEN,sp)
      00AA31 0A 01            [ 1] 3946 	dec (WLEN,sp)
      00AA31 CD 98            [ 1] 3947 	jrne 1$
      00AA33 5E 5F            [ 1] 3948 	ld a,#70
      00AA35 02 72            [ 1] 3949 	cp a,(LLEN,sp)
      00AA37 A2 00            [ 1] 3950 	jrmi 2$   
      00AA39 03 90            [ 1] 3951 	ld a,#SPACE 
      00AA3B F7 90 EF         [ 4] 3952 	call putc 
      00AA3E 01 A6            [ 1] 3953 	inc (LLEN,sp) 
      00AA40 07 CD            [ 2] 3954 	jra 3$
      00AA42 99 D2            [ 1] 3955 2$: ld a,#CR 
      00AA44 CD 08 DD         [ 4] 3956 	call putc 
      00AA44 90 F6            [ 1] 3957 	clr (LLEN,sp)
      00AA46 93 EE 01 72      [ 2] 3958 3$:	subw y,#2 
      00AA4A A9 00            [ 2] 3959 	ldw y,(y)
      00AA4C 03 81            [ 1] 3960 	jrne 0$ 
      00AA4E A6 0D            [ 1] 3961 	ld a,#CR 
      00AA4E CD 89 6D         [ 4] 3962 	call putc  
      00AA51 81               [ 1] 3963 	clrw x 
      00AA52 7B 03            [ 1] 3964 	ld a,(WCNT,sp)
      00AA52 5F               [ 1] 3965 	ld xl,a 
      00AA53 C6 00 2F         [ 4] 3966 	call prt_i16 
      00AA56 C0 00 30         [ 2] 3967 	ldw x,#words_count_msg
      00AA59 27 03 53         [ 4] 3968 	call puts 
      002CDF                       3969 	_drop VSIZE 
      00AA5C A6 FF            [ 2]    1     addw sp,#VSIZE 
      00AA5E 90 85            [ 2] 3970 	popw y 
      00AA5E 81               [ 4] 3971 	ret 
      00AA5F 20 77 6F 72 64 73 20  3972 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3973 
                                   3974 
                                   3975 ;-----------------------------
                                   3976 ; BASIC: TIMER expr 
                                   3977 ; initialize count down timer 
                                   3978 ;-----------------------------
      002CFA                       3979 set_timer:
      00AA5F CD 99 DF         [ 4] 3980 	call arg_list
      00AA62 A1 02            [ 1] 3981 	cp a,#1 
      00AA64 27 03            [ 1] 3982 	jreq 1$
      00AA66 CC 96 B8         [ 2] 3983 	jp syntax_error
      002D04                       3984 1$: 
      002D04                       3985 	_xpop  
      00AA69 90 E6            [ 1]    1     ld a,(y)
      00AA6B 03               [ 1]    2     ldw x,y 
      00AA6C 93 EE            [ 2]    3     ldw x,(1,x)
      00AA6E 04 A3 50 00      [ 2]    4     addw y,#CELL_SIZE 
      00AA72 2B 16 A3         [ 2] 3986 	ldw timer,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00AA75 50               [ 4] 3987 	ret 
                                   3988 
                                   3989 ;------------------------------
                                   3990 ; BASIC: TIMEOUT 
                                   3991 ; return state of timer 
                                   3992 ; output:
                                   3993 ;   A:X     0 not timeout 
                                   3994 ;   A:X     -1 timeout 
                                   3995 ;------------------------------
      002D11                       3996 timeout:
      00AA76 29               [ 1] 3997 	clr a 
      00AA77 2A 11 89         [ 2] 3998 	ldw x,timer 
      00AA7A 90 F6            [ 1] 3999 	jreq 1$
      00AA7C 93               [ 1] 4000 	clrw x
      00AA7D EE               [ 4] 4001 	ret  
      00AA7E 01               [ 1] 4002 1$:	cpl a
      00AA7F 72               [ 2] 4003 	cplw x 
      00AA80 A9               [ 4] 4004 	ret 
                                   4005  	
                                   4006 
                                   4007 
                                   4008 
                                   4009 ;-----------------------------------
                                   4010 ; BASIC: IWDGEN expr1 
                                   4011 ; enable independant watchdog timer
                                   4012 ; expr1 is delay in multiple of 62.5µsec
                                   4013 ; expr1 -> {1..16383}
                                   4014 ;-----------------------------------
      002D1C                       4015 enable_iwdg:
      00AA81 00 03 72         [ 4] 4016 	call arg_list
      00AA84 FB 01            [ 1] 4017 	cp a,#1 
      00AA86 5B 02            [ 1] 4018 	jreq 1$
      00AA88 4F 81 38         [ 2] 4019 	jp syntax_error 
      00AA8A                       4020 1$: _xpop  
      00AA8A A6 0A            [ 1]    1     ld a,(y)
      00AA8C CC               [ 1]    2     ldw x,y 
      00AA8D 96 BA            [ 2]    3     ldw x,(1,x)
      00AA8F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AA8F AE B7            [ 1] 4021 	push #0
      00AA91 00 89 FE CD      [ 1] 4022 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00AA95 A8               [ 1] 4023 	ld a,xh 
      00AA96 30 26            [ 1] 4024 	and a,#0x3f
      00AA98 19               [ 1] 4025 	ld xh,a  
      00AA99 1E 01 CF         [ 2] 4026 2$:	cpw x,#255
      00AA9C 00 0E            [ 2] 4027 	jrule 3$
      00AA9E EE 02            [ 1] 4028 	inc (1,sp)
      00AAA0 72               [ 1] 4029 	rcf 
      00AAA1 BB               [ 2] 4030 	rrcw x 
      00AAA2 00 0E            [ 2] 4031 	jra 2$
      00AAA4 1C 00 04 1C      [ 1] 4032 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AAA8 00               [ 1] 4033 	pop a  
      00AAA9 80 9F A4         [ 1] 4034 	ld IWDG_PR,a 
      00AAAC 80               [ 1] 4035 	ld a,xl
      00AAAD 97               [ 1] 4036 	dec a 
      00AAAE 1F 01 20 E1      [ 1] 4037 	mov IWDG_KR,#IWDG_KEY_ACCESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00AAB2 85 4F 81         [ 1] 4038 	ld IWDG_RLR,a 
      00AAB5 35 AA 50 E0      [ 1] 4039 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00AAB5 CD               [ 4] 4040 	ret 
                                   4041 
                                   4042 
                                   4043 ;-----------------------------------
                                   4044 ; BASIC: IWDGREF  
                                   4045 ; refresh independant watchdog count down 
                                   4046 ; timer before it reset MCU. 
                                   4047 ;-----------------------------------
      002D5A                       4048 refresh_iwdg:
      00AAB6 99 DF A1 02      [ 1] 4049 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00AABA 27               [ 4] 4050 	ret 
                                   4051 
                                   4052 
                                   4053 ;-------------------------------------
                                   4054 ; BASIC: LOG2(expr)
                                   4055 ; return logarithm base 2 of expr 
                                   4056 ; this is the position of most significant
                                   4057 ; bit set. 
                                   4058 ; input: 
                                   4059 ; output:
                                   4060 ;   A     TK_INTGR 
                                   4061 ;   xstack log2 
                                   4062 ;*********************************
      002D5F                       4063 log2:
      00AABB 03 CC 96         [ 4] 4064 	call func_args 
      00AABE B8 01            [ 1] 4065 	cp a,#1 
      00AABF 27 03            [ 1] 4066 	jreq 1$
      00AABF 90 E6 03         [ 2] 4067 	jp syntax_error 
      002D69                       4068 1$: 
      002D69                       4069 	_xpop    
      00AAC2 93 EE            [ 1]    1     ld a,(y)
      00AAC4 04               [ 1]    2     ldw x,y 
      00AAC5 CF 00            [ 2]    3     ldw x,(1,x)
      00AAC7 1A 90 F6 93      [ 2]    4     addw y,#CELL_SIZE 
      00AACB EE               [ 1] 4070 	tnz a
      00AACC 01 72            [ 1] 4071 	jrne 2$ 
      00AACE A9               [ 2] 4072 	tnzw x 
      00AACF 00 03            [ 1] 4073 	jrne 2$
      00AAD1 90 F7            [ 1] 4074 	ld a,#ERR_BAD_VALUE
      00AAD3 90 EF 01         [ 2] 4075 	jp tb_error 
      00AAD6 72 CD            [ 1] 4076 2$: push #24 
      00AAD8 00               [ 2] 4077 3$: rlcw x 
      00AAD9 1A               [ 1] 4078     rlc a 
      00AADA 81 04            [ 1] 4079 	jrc 4$
      00AADB 0A 01            [ 1] 4080 	dec (1,sp) 
      00AADB 72 0D            [ 1] 4081 	jrne 3$
      00AADD 52               [ 1] 4082 4$: clrw x 
      00AADE 30               [ 1] 4083     pop a 
      00AADF FB               [ 1] 4084 	dec a
      00AAE0 8E               [ 1] 4085 	rlwa x  
      002D8B                       4086 9$:	
      00AAE1 CC               [ 4] 4087 	ret 
                                   4088 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



                                   4089 ;-----------------------------------
                                   4090 ; BASIC: BIT(expr) 
                                   4091 ; expr ->{0..23}
                                   4092 ; return 2^expr 
                                   4093 ; output:
                                   4094 ;    A:X    2^expr 
                                   4095 ;-----------------------------------
      002D8C                       4096 bitmask:
      00AAE2 81 35 5F         [ 4] 4097     call func_args 
      00AAE4 A1 01            [ 1] 4098 	cp a,#1
      00AAE4 72 0D            [ 1] 4099 	jreq 1$
      00AAE6 52 30 FB         [ 2] 4100 	jp syntax_error 
      002D96                       4101 1$: _xpop 
      00AAE9 72 16            [ 1]    1     ld a,(y)
      00AAEB 00               [ 1]    2     ldw x,y 
      00AAEC 23 8E            [ 2]    3     ldw x,(1,x)
      00AAEE 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AAEF 9F               [ 1] 4102 	ld a,xl 
      00AAEF CD 9B 28         [ 2] 4103 	ldw x,#1 
      00AAF2 A1 84            [ 1] 4104 	and a,#23
      00AAF4 27 03            [ 1] 4105 	jreq 9$
      00AAF6 CC               [ 1] 4106 	push a 
      00AAF7 96               [ 1] 4107 	clr a 
      002DA9                       4108 2$: 
      00AAF8 B8               [ 2] 4109 	slaw x 
      00AAF9 90               [ 1] 4110 	rlc a 	
      00AAFA F6 93            [ 1] 4111 	dec (1,sp)
      00AAFC EE 01            [ 1] 4112 	jrne 2$ 
      002DAF                       4113 4$:
      002DAF                       4114     _drop 1 
      00AAFE 72 A9            [ 2]    1     addw sp,#1 
      00AB00 00               [ 4] 4115 9$:	ret 
                                   4116 
                                   4117 ;------------------------------
                                   4118 ; BASIC: DO 
                                   4119 ; initiate a DO ... UNTIL loop 
                                   4120 ;------------------------------
                           000003  4121 	DOLP_ADR=3 
                           000005  4122 	DOLP_INW=5
                           000004  4123 	VSIZE=4 
      002DB2                       4124 do_loop:
      00AB01 03               [ 2] 4125 	popw x 
      00AB02                       4126 	_vars VSIZE 
      00AB02 CF 00            [ 2]    1     sub sp,#VSIZE 
      00AB04 13               [ 2] 4127 	pushw x 
      00AB05 CE 00 13         [ 2] 4128 	ldw x,basicptr 
      00AB08 5D 27            [ 2] 4129 	ldw (DOLP_ADR,sp),x
      00AB0A 03 8F 26         [ 2] 4130 	ldw x,in.w 
      00AB0D F7 05            [ 2] 4131 	ldw (DOLP_INW,sp),x
      00AB0E 72 5C 00 1F      [ 1] 4132 	inc loop_depth 
      00AB0E 81               [ 4] 4133 	ret 
                                   4134 
                                   4135 ;--------------------------------
                                   4136 ; BASIC: UNTIL expr 
                                   4137 ; loop if exprssion is false 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   4138 ; else terminate loop
                                   4139 ;--------------------------------
      00AB0F                       4140 until: 
      00AB0F CD 9B 28 A1      [ 1] 4141 	tnz loop_depth 
      00AB13 84 27            [ 1] 4142 	jrne 1$ 
      00AB15 03 CC 96         [ 2] 4143 	jp syntax_error 
      002DCE                       4144 1$: 
      00AB18 B8 90 F6         [ 4] 4145 	call condition  
      002DD1                       4146 	_xpop 
      00AB1B 93 EE            [ 1]    1     ld a,(y)
      00AB1D 01               [ 1]    2     ldw x,y 
      00AB1E 72 A9            [ 2]    3     ldw x,(1,x)
      00AB20 00 03 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AB22 4D               [ 1] 4147 	tnz a 
      00AB22 A3 14            [ 1] 4148 	jrne 9$ 
      00AB24 00               [ 2] 4149 	tnzw x 
      00AB25 2B 0C            [ 1] 4150 	jrne 9$ 
      00AB27 35 0F            [ 2] 4151 	ldw x,(DOLP_ADR,sp)
      00AB29 50 F2 A6         [ 2] 4152 	ldw basicptr,x 
      00AB2C 1E 62            [ 1] 4153 	ld a,(2,x)
      00AB2E A6 10 62         [ 1] 4154 	ld count,a 
      00AB31 20 1E            [ 2] 4155 	ldw x,(DOLP_INW,sp)
      00AB33 CF 00 00         [ 2] 4156 	ldw in.w,x 
      00AB33 A3               [ 4] 4157 	ret 
      002DF0                       4158 9$:	; remove loop data from stack  
      00AB34 08               [ 2] 4159 	popw x
      002DF1                       4160 	_drop VSIZE
      00AB35 00 2B            [ 2]    1     addw sp,#VSIZE 
      00AB37 09 35 0E 50      [ 1] 4161 	dec loop_depth 
      00AB3B F2               [ 2] 4162 	jp (x)
                                   4163 
                                   4164 ;--------------------------
                                   4165 ; BASIC: PORTA...PORTI  
                                   4166 ;  return constant value 
                                   4167 ;  PORT  base address 
                                   4168 ;---------------------------
      002DF8                       4169 const_porta:
      00AB3C A6 50 62         [ 2] 4170 	ldw x,#PA_BASE 
      00AB3F 20               [ 1] 4171 	clr a 
      00AB40 10               [ 4] 4172 	ret 
      00AB41                       4173 const_portb:
      00AB41 35 07 50         [ 2] 4174 	ldw x,#PB_BASE 
      00AB44 F2               [ 1] 4175 	clr a 
      00AB45 81               [ 4] 4176 	ret 
      002E02                       4177 const_portc:
      00AB45 A3 00 40         [ 2] 4178 	ldw x,#PC_BASE 
      00AB48 23               [ 1] 4179 	clr a 
      00AB49 07               [ 4] 4180 	ret 
      002E07                       4181 const_portd:
      00AB4A 72 5C 50         [ 2] 4182 	ldw x,#PD_BASE 
      00AB4D F2               [ 1] 4183 	clr a 
      00AB4E 54               [ 4] 4184 	ret 
      002E0C                       4185 const_porte:
      00AB4F 20 F4 14         [ 2] 4186 	ldw x,#PE_BASE 
      00AB51 4F               [ 1] 4187 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00AB51 9F               [ 4] 4188 	ret 
      002E11                       4189 const_portf:
      00AB52 4A 27 01         [ 2] 4190 	ldw x,#PF_BASE 
      00AB55 4A               [ 1] 4191 	clr a 
      00AB56 81               [ 4] 4192 	ret 
      002E16                       4193 const_portg:
      00AB56 A4 3E C7         [ 2] 4194 	ldw x,#PG_BASE 
      00AB59 50               [ 1] 4195 	clr a 
      00AB5A F1               [ 4] 4196 	ret 
      002E1B                       4197 const_porti:
      00AB5B 72 18 50         [ 2] 4198 	ldw x,#PI_BASE 
      00AB5E F0               [ 1] 4199 	clr a 
      00AB5F 8E               [ 4] 4200 	ret 
                                   4201 
                                   4202 ;-------------------------------
                                   4203 ; following return constant 
                                   4204 ; related to GPIO register offset 
                                   4205 ;---------------------------------
      002E20                       4206 const_odr:
      00AB60 81               [ 1] 4207 	clr a 
      00AB61 AE 00 00         [ 2] 4208 	ldw x,#GPIO_ODR
      00AB61 C6               [ 4] 4209 	ret 
      002E25                       4210 const_idr:
      00AB62 00               [ 1] 4211 	clr a 
      00AB63 10 CE 00         [ 2] 4212 	ldw x,#GPIO_IDR
      00AB66 11               [ 4] 4213 	ret 
      002E2A                       4214 const_ddr:
      00AB67 81               [ 1] 4215 	clr a
      00AB68 AE 00 02         [ 2] 4216 	ldw x,#GPIO_DDR
      00AB68 CD               [ 4] 4217 	ret 
      002E2F                       4218 const_cr1:
      00AB69 99               [ 1] 4219 	clr a 
      00AB6A DF A1 01         [ 2] 4220 	ldw x,#GPIO_CR1
      00AB6D 27               [ 4] 4221 	ret 
      002E34                       4222 const_cr2:
      00AB6E 03               [ 1] 4223 	clr a
      00AB6F CC 96 B8         [ 2] 4224 	ldw x,#GPIO_CR2
      00AB72 81               [ 4] 4225 	ret 
                                   4226 ;-------------------------
                                   4227 ; BASIC: POUT 
                                   4228 ;  constant for port mode
                                   4229 ;  used by PMODE 
                                   4230 ;  to set pin as output
                                   4231 ;------------------------
      002E39                       4232 const_output:
      00AB72 CD               [ 1] 4233 	clr a 
      00AB73 82 63 90         [ 2] 4234 	ldw x,#OUTP
      00AB76 F6               [ 4] 4235 	ret 
                                   4236 
                                   4237 ;-------------------------
                                   4238 ; BASIC: PINP 
                                   4239 ;  constant for port mode
                                   4240 ;  used by PMODE 
                                   4241 ;  to set pin as input
                                   4242 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      002E3E                       4243 const_input:
      00AB77 93               [ 1] 4244 	clr a  
      00AB78 EE 01 72         [ 2] 4245 	ldw x,#INP 
      00AB7B A9               [ 4] 4246 	ret 
                                   4247 	
                                   4248 ;-----------------------
                                   4249 ; memory area constants
                                   4250 ;-----------------------
      002E43                       4251 const_eeprom_base:
      00AB7C 00               [ 1] 4252 	clr a  
      00AB7D 03 81 00         [ 2] 4253 	ldw x,#EEPROM_BASE 
      00AB7F 81               [ 4] 4254 	ret 
                                   4255 
                                   4256 ;---------------------------
                                   4257 ; BASIC: DATA 
                                   4258 ; when the interpreter find 
                                   4259 ; a DATA line it skip it.
                                   4260 ;---------------------------
      002E48                       4261 data:
      00AB7F CD 99 DF A1 02   [ 1] 4262 	mov in,count 
      00AB84 27               [ 4] 4263 	ret 
                                   4264 
                                   4265 ;------------------------------
                                   4266 ; check if it is a DATA line 
                                   4267 ; input: 
                                   4268 ;    X    line address 
                                   4269 ; output:
                                   4270 ;    Z    set if DATA line 
                                   4271 ;----------------------------
      002E4E                       4272 is_data_line:
      00AB85 03               [ 2] 4273 	pushw x 
      00AB86 CC 96            [ 1] 4274 	ld a,(3,x)
      00AB88 B8 90            [ 1] 4275 	cp a,#TK_CMD 
      00AB8A F6 93            [ 1] 4276 	jrne 9$
      00AB8C EE 01            [ 2] 4277 	ldw x,(4,x)
      00AB8E 72 A9 00         [ 2] 4278 	cpw x,#data  
      00AB91 03               [ 2] 4279 9$: popw x 
      00AB92 9F               [ 4] 4280 	ret 
                                   4281 
                                   4282 ;---------------------------------
                                   4283 ; BASIC: RESTORE [line#]
                                   4284 ; set data_ptr to first data line
                                   4285 ; if no DATA found pointer set to
                                   4286 ; zero.
                                   4287 ; if a line# is given as argument 
                                   4288 ; a data line with that number 
                                   4289 ; is searched and the data pointer 
                                   4290 ; is set to it. If there is no 
                                   4291 ; data line with that number 
                                   4292 ; the program is interrupted. 
                                   4293 ;---------------------------------
      002E5C                       4294 restore:
      00AB93 88               [ 1] 4295 	clrw x 
      00AB94 90 F6 93         [ 2] 4296 	ldw data_ptr,x 
      00AB97 EE 01 72         [ 2] 4297 	ldw data_ofs,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00AB9A A9 00 03         [ 2] 4298 	ldw x,txtbgn 
      00AB9D 0D 01 27         [ 4] 4299 	call next_token 
      00ABA0 07 98            [ 1] 4300 	cp a,#TK_INTGR
      00ABA2 59 49            [ 1] 4301 	jrne 0$
      00ABA4 0A 01 26         [ 4] 4302 	call get_int24
      00ABA7 F9 5B            [ 2] 4303 	pushw y 
      00ABA9 01               [ 1] 4304 	clr a 
      00ABAA 81 0C 17         [ 4] 4305 	call search_lineno  
      00ABAB 90 85            [ 2] 4306 	popw y 
      00ABAB CD               [ 2] 4307 	tnzw x 
      00ABAC 99 DF            [ 1] 4308 	jrne set_data_pointer 
      00ABAE A1 02            [ 2] 4309 	jra data_error 
      002E7D                       4310 0$:
      002E7D                       4311 	_unget_token  
      00ABB0 27 03 CC 96 B8   [ 1]    1      mov in,in.saved  
                                   4312 ; search first DATA line 	
      00ABB5 90 F6 93         [ 2] 4313 1$:	cpw x,txtend
      00ABB8 EE 01            [ 1] 4314 	jruge data_error 
      002E87                       4315 2$:	
      00ABBA 72 A9 00         [ 4] 4316 	call is_data_line 
      00ABBD 03 9F            [ 1] 4317 	jrne 4$
      00ABBF 88 90 F6         [ 4] 4318 4$:	call try_next_line 
      00ABC2 93 EE            [ 1] 4319 	jrne 4$ 
      00ABC4 01               [ 4] 4320 	ret 
                                   4321 
                                   4322 ;---------------------
                                   4323 ; set data pointer 
                                   4324 ; variables at new line 
                                   4325 ; input:
                                   4326 ;    X    line address 
                                   4327 ;----------------------
      002E92                       4328 set_data_pointer:
      00ABC5 72 A9 00         [ 2] 4329 	ldw data_ptr,x
      00ABC8 03 0D            [ 1] 4330 	ld a,(2,x)
      00ABCA 01 27 07         [ 1] 4331 	ld data_len,a 
      00ABCD 98 46 56 0A      [ 1] 4332 	mov data_ofs,#FIRST_DATA_ITEM
      00ABD1 01               [ 4] 4333 	ret 
                                   4334 
                                   4335 
                                   4336 ;--------------------
                                   4337 ; at end of data line 
                                   4338 ; check if next line 
                                   4339 ; is a data line 
                                   4340 ; input:
                                   4341 ;    X   actual line address 
                                   4342 ;  
                                   4343 ;-------------------
      002E9F                       4344 try_next_line: 
      00ABD2 26 F9            [ 1] 4345 	ld a,(2,x)
      00ABD4 5B 01 81         [ 1] 4346 	ld acc8,a 
      00ABD7 72 5F 00 0D      [ 1] 4347 	clr acc16 
      00ABD7 A6 84 CD 99      [ 2] 4348 	addw x,acc16 
      00ABDB D2 CD 98         [ 2] 4349 	cpw x,txtend 
      00ABDE 4E 9F            [ 1] 4350 	jrult 1$
      00ABE0 A4 07            [ 2] 4351 	jra data_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      002EB3                       4352 1$:	
      00ABE2 C7 50 C6         [ 4] 4353 	call is_data_line 
      00ABE5 81 04            [ 1] 4354 	jreq 2$
      00ABE6 A6 01            [ 1] 4355 	ld a,#1  
      00ABE6 52 01            [ 2] 4356 	jra 9$
      00ABE8 CD 99 E4         [ 4] 4357 2$:	call set_data_pointer
      00ABEB A1               [ 1] 4358 	clr a  
      00ABEC 02               [ 4] 4359 9$:	ret 
      002EC1                       4360 data_error:	
      00ABED 27 03            [ 1] 4361     ld a,#ERR_NO_DATA 
      00ABEF CC 96 B8         [ 2] 4362 	jp tb_error 
                                   4363 
                                   4364 
                                   4365 ;---------------------------------
                                   4366 ; BASIC: READ 
                                   4367 ; return next data item | 0 
                                   4368 ;---------------------------------
                           000001  4369 	CTX_BPTR=1 
                           000003  4370 	CTX_IN=3 
                           000004  4371 	CTX_COUNT=4 
                           000005  4372 	INT24=5
                           000007  4373 	VSIZE=7 
      002EC6                       4374 read:
      002EC6                       4375 	_vars  VSIZE 
      00ABF2 90 F6            [ 2]    1     sub sp,#VSIZE 
      00ABF4 93 EE 01         [ 4] 4376 	call save_context
      002ECB                       4377 read01:	
      00ABF7 72 A9 00         [ 1] 4378 	ld a,data_ofs
      00ABFA 03 CF 00         [ 1] 4379 	cp a,data_len 
      00ABFD 1A 90            [ 1] 4380 	jreq 2$ ; end of line  
      002ED3                       4381 0$:
      00ABFF F6 93 EE         [ 2] 4382 	ldw x,data_ptr 
      00AC02 01 72 A9         [ 2] 4383 	ldw basicptr,x 
      00AC05 00 03 CD AC 45   [ 1] 4384 	mov in,data_ofs 
      00AC0A 6B 01 A6 01 0D   [ 1] 4385 	mov count,data_len  
      00AC0F 01 27 0D         [ 4] 4386 	call expression 
      00AC12 48 0A            [ 1] 4387 	cp a,#TK_INTGR 
      00AC14 01 26            [ 1] 4388 	jreq 1$ 
      00AC16 FB 6B 01         [ 2] 4389 	jp syntax_error 
      002EED                       4390 1$:
      00AC19 7B 01 EA         [ 4] 4391 	call next_token ; skip comma
      00AC1C 03 E7 03         [ 2] 4392 	ldw x,basicptr 
      00AC1F A6 01 C1         [ 2] 4393 	ldw data_ptr,x 
      00AC22 00 0F 27 10 7B   [ 1] 4394 	mov data_ofs,in 
      00AC27 01 43 E4         [ 4] 4395 	call rest_context
      002EFE                       4396 	_xpop 
      00AC2A 04 E7            [ 1]    1     ld a,(y)
      00AC2C 04               [ 1]    2     ldw x,y 
      00AC2D 7B 01            [ 2]    3     ldw x,(1,x)
      00AC2F 43 E4 02 E7      [ 2]    4     addw y,#CELL_SIZE 
      002F07                       4397 	_drop VSIZE 
      00AC33 02 20            [ 2]    1     addw sp,#VSIZE 
      00AC35 0C               [ 4] 4398 	ret 
      00AC36                       4399 2$: ; end of line reached 
                                   4400 	; try next line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00AC36 7B 01 EA         [ 2] 4401 	ldw x,data_ptr  
      00AC39 02 E7 02         [ 4] 4402 	call try_next_line
      00AC3C 7B 01            [ 1] 4403 	jreq 0$ 
      00AC3E EA 04            [ 2] 4404 	jra data_error 
                                   4405 
                                   4406 ;---------------------------------
                                   4407 ; BASIC: SPIEN clkdiv, 0|1  
                                   4408 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4409 ; if clkdiv==-1 disable SPI
                                   4410 ; 0|1 -> disable|enable  
                                   4411 ;--------------------------------- 
                           000005  4412 SPI_CS_BIT=5
      002F14                       4413 spi_enable:
      00AC40 E7 04 64         [ 4] 4414 	call arg_list 
      00AC42 A1 02            [ 1] 4415 	cp a,#2
      00AC42 5B 01            [ 1] 4416 	jreq 1$
      00AC44 81 16 38         [ 2] 4417 	jp syntax_error 
      00AC45                       4418 1$: 
      00AC45 58 1C AC 55      [ 1] 4419 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00AC49 FE               [ 2] 4420 	popw x  
      00AC4A 9F               [ 2] 4421 	tnzw x 
      00AC4B 88 5E            [ 1] 4422 	jreq spi_disable 
      00AC4D A6               [ 2] 4423 	popw x 
      00AC4E 05 42            [ 1] 4424 	ld a,#(1<<SPI_CR1_BR)
      00AC50 1C               [ 4] 4425 	mul x,a 
      00AC51 50               [ 1] 4426 	ld a,xl 
      00AC52 00 84 81         [ 1] 4427 	ld SPI_CR1,a 
                                   4428 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00AC55 72 1A 50 14      [ 1] 4429 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00AC55 03 06 03 05      [ 1] 4430 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4431 ; configure SPI as master mode 0.	
      00AC59 04 00 02 01      [ 1] 4432 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4433 ; ~CS line controlled by sofware 	
      00AC5D 06 00 02 02      [ 1] 4434 	bset SPI_CR2,#SPI_CR2_SSM 
      00AC61 02 03 03 01      [ 1] 4435     bset SPI_CR2,#SPI_CR2_SSI 
                                   4436 ; enable SPI
      00AC65 03 03 02 04      [ 1] 4437 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AC69 04               [ 4] 4438 	ret 
      002F47                       4439 spi_disable:
      002F47                       4440 	_drop #2; throw first argument.
      00AC6A 05 02            [ 2]    1     addw sp,##2 
                                   4441 ; wait spi idle 
      00AC6C 06 02            [ 1] 4442 1$:	ld a,#0x82 
      00AC6E 07 02 05         [ 1] 4443 	and a,SPI_SR
      00AC71 04 02            [ 1] 4444 	cp a,#2 
      00AC73 04 01            [ 1] 4445 	jrne 1$
      00AC75 72 1D 52 00      [ 1] 4446 	bres SPI_CR1,#SPI_CR1_SPE
      00AC75 CD 99 DF A1      [ 1] 4447 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00AC79 01 27 03 CC      [ 1] 4448 	bres PE_DDR,#SPI_CS_BIT 
      00AC7D 96               [ 4] 4449 	ret 
                                   4450 
      002F5F                       4451 spi_clear_error:
      00AC7E B8 78            [ 1] 4452 	ld a,#0x78 
      00AC7F C5 52 03         [ 1] 4453 	bcp a,SPI_SR 
      00AC7F 90 F6            [ 1] 4454 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00AC81 93 EE 01 72      [ 1] 4455 	clr SPI_SR 
      00AC85 A9               [ 4] 4456 1$: ret 
                                   4457 
      002F6B                       4458 spi_send_byte:
      00AC86 00               [ 1] 4459 	push a 
      00AC87 03 89 88         [ 4] 4460 	call spi_clear_error
      00AC8A A6               [ 1] 4461 	pop a 
      00AC8B 80 15 01 27 05   [ 2] 4462 	btjf SPI_SR,#SPI_SR_TXE,.
      00AC90 A6 0A CC         [ 1] 4463 	ld SPI_DR,a
      00AC93 96 BA 52 03 FB   [ 2] 4464 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AC95 C6 52 04         [ 1] 4465 	ld a,SPI_DR 
      00AC95 CE               [ 4] 4466 	ret 
                                   4467 
      002F81                       4468 spi_rcv_byte:
      00AC96 00 15            [ 1] 4469 	ld a,#255
      00AC98 58 58 58 58 58   [ 2] 4470 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00AC9D 9E C8 00         [ 1] 4471 	ld a,SPI_DR 
      00ACA0 15               [ 4] 4472 	ret
                                   4473 
                                   4474 ;------------------------------
                                   4475 ; BASIC: SPIWR byte [,byte]
                                   4476 ; write 1 or more byte
                                   4477 ;------------------------------
      002F8C                       4478 spi_write:
      00ACA1 C7 00 0E         [ 4] 4479 	call expression
      00ACA4 9F C8            [ 1] 4480 	cp a,#TK_INTGR 
      00ACA6 00 16            [ 1] 4481 	jreq 1$
      00ACA8 C7 00 0F         [ 2] 4482 	jp syntax_error 
      002F96                       4483 1$:	
      00ACAB CE               [ 1] 4484 	ld a,xl 
      00ACAC 00 17 CF         [ 4] 4485 	call spi_send_byte 
      00ACAF 00 15 CE         [ 4] 4486 	call next_token 
      00ACB2 00 17            [ 1] 4487 	cp a,#TK_COMMA 
      00ACB4 54 9E            [ 1] 4488 	jrne 2$ 
      00ACB6 C8 00            [ 2] 4489 	jra spi_write 
      00ACB8 17               [ 1] 4490 2$:	tnz a 
      00ACB9 C7 00            [ 1] 4491 	jreq 3$
      002FA6                       4492 	_unget_token  
      00ACBB 17 9F C8 00 18   [ 1]    1      mov in,in.saved  
      00ACC0 C7               [ 4] 4493 3$:	ret 
                                   4494 
                                   4495 
                                   4496 ;-------------------------------
                                   4497 ; BASIC: SPIRD 	
                                   4498 ; read one byte from SPI 
                                   4499 ;-------------------------------
      002FAC                       4500 spi_read:
      00ACC1 00 18 CE         [ 4] 4501 	call spi_rcv_byte 
      00ACC4 00               [ 1] 4502 	clrw x 
      00ACC5 0E               [ 1] 4503 	ld xl,a 
      00ACC6 54               [ 1] 4504 	clr a  
      00ACC7 54               [ 4] 4505 	ret 
                                   4506 
                                   4507 ;------------------------------
                                   4508 ; BASIC: SPISEL 0|1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                                   4509 ; set state of ~CS line
                                   4510 ; 0|1 deselect|select  
                                   4511 ;------------------------------
      002FB3                       4512 spi_select:
      00ACC8 54 9E C8         [ 4] 4513 	call next_token 
      00ACCB 00 0E            [ 1] 4514 	cp a,#TK_INTGR 
      00ACCD C7 00            [ 1] 4515 	jreq 1$
      00ACCF 0E 9F C8         [ 2] 4516 	jp syntax_error 
      00ACD2 00               [ 2] 4517 1$: tnzw x  
      00ACD3 0F C7            [ 1] 4518 	jreq cs_high 
      00ACD5 00 0F C8 00      [ 1] 4519 	bres PE_ODR,#SPI_CS_BIT
      00ACD9 18               [ 4] 4520 	ret 
      002FC5                       4521 cs_high: 
      00ACDA 97 C6 00 0E      [ 1] 4522 	bset PE_ODR,#SPI_CS_BIT
      00ACDE C8               [ 4] 4523 	ret 
                                   4524 
                                   4525 ;-------------------------------
                                   4526 ; BASIC: PAD 
                                   4527 ; Return pad buffer address.
                                   4528 ;------------------------------
      002FCA                       4529 pad_ref:
      00ACDF 00 17 95         [ 2] 4530 	ldw x,#pad 
      00ACE2 CF               [ 1] 4531 	clr a
      00ACE3 00               [ 4] 4532 	ret 
                                   4533 
                                   4534 ;****************************
                                   4535 ; expression stack 
                                   4536 ; manipulation routines
                                   4537 ;****************************
                                   4538 
                                   4539 ;-----------------------------
                                   4540 ; BASIC: PUSH expr|rel|cond 
                                   4541 ; push the result on xtack
                                   4542 ;-----------------------------
      002FCF                       4543 xpush:
      00ACE4 17 C6 00         [ 4] 4544 	call condition 
      00ACE7 16               [ 4] 4545 	ret 
                                   4546 
                                   4547 ;------------------------------
                                   4548 ; BASIC: POP 
                                   4549 ; pop top of xstack 
                                   4550 ;------------------------------
      002FD3                       4551 xpop:
      002FD3                       4552 	_xpop 
      00ACE8 A4 7F            [ 1]    1     ld a,(y)
      00ACEA 72               [ 1]    2     ldw x,y 
      00ACEB A2 00            [ 2]    3     ldw x,(1,x)
      00ACED 03 90 F7 90      [ 2]    4     addw y,#CELL_SIZE 
      00ACF1 EF               [ 4] 4553 	ret 
                                   4554 
                                   4555 
                                   4556 ;------------------------------
                                   4557 ; BASIC: ALLOC expr 
                                   4558 ; allocate expr element on xtack 
                                   4559 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      002FDD                       4560 xalloc: 
      00ACF2 01 84 85         [ 4] 4561 	call expression 
      00ACF5 72 A2            [ 1] 4562 	cp a,#TK_INTGR
      00ACF7 00 03            [ 1] 4563 	jreq 1$ 
      00ACF9 90 F7 90         [ 2] 4564 	jp syntax_error
      002FE7                       4565 1$: _xpop 
      00ACFC EF 01            [ 1]    1     ld a,(y)
      00ACFE CD               [ 1]    2     ldw x,y 
      00ACFF 84 11            [ 2]    3     ldw x,(1,x)
      00AD01 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00AD05 01               [ 1] 4566 	tnz a 
      00AD06 72 A9            [ 1] 4567 	jreq 3$ 
      00AD08 00 03            [ 1] 4568 2$:	ld a,#ERR_BAD_VALUE
      00AD0A 1C 00 01         [ 2] 4569 	jp tb_error 
      00AD0D A9 00 81         [ 2] 4570 3$: cpw x,#XSTACK_SIZE 
      00AD10 22 F6            [ 1] 4571 	jrugt 2$
      00AD10 90 89            [ 1] 4572 	ld a,#CELL_SIZE 
      00AD12 52               [ 4] 4573 	mul x,a 
      00AD13 03 0F 02         [ 2] 4574 	ldw acc16,x 
      00AD16 0F 03 90 AE      [ 2] 4575 	subw y,acc16 
      00AD1A B4 ED 93 F6      [ 2] 4576 	cpw y,#xstack_full
      00AD1E A4 0F            [ 1] 4577 	jrugt 9$
      00AD20 6B 01            [ 1] 4578 	ld a,#ERR_MEM_FULL
      00AD22 0C 03 5C         [ 2] 4579 	jp tb_error 
      003012                       4580 9$:	 
      00AD25 F6               [ 4] 4581 	ret 
                                   4582 
                                   4583 
                                   4584 ;------------------------------
                                   4585 ;  BASIC DROP expr 
                                   4586 ;  expr in range {0..XSTACK_SIZE}
                                   4587 ;  discard n elements from xtack
                                   4588 ;------------------------------
      003013                       4589 xdrop:
      00AD26 CD 89 5D         [ 4] 4590 	call expression 
      00AD29 0C 02            [ 1] 4591 	cp a,#TK_INTGR
      00AD2B 0A 01            [ 1] 4592 	jreq 1$ 
      00AD2D 26 F5 A6         [ 2] 4593 	jp syntax_error 
      00301D                       4594 1$:	_xpop 
      00AD30 46 11            [ 1]    1     ld a,(y)
      00AD32 02               [ 1]    2     ldw x,y 
      00AD33 2B 09            [ 2]    3     ldw x,(1,x)
      00AD35 A6 20 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00AD39 5D               [ 1] 4595 	ld a,xl 
      00AD3A 0C 02            [ 1] 4596 	and a,#0x1f 
      00AD3C 20               [ 1] 4597 	clrw x 
      00AD3D 07               [ 1] 4598 	ld xl,a 
      00AD3E A6 0D            [ 1] 4599 	ld a,#CELL_SIZE 
      00AD40 CD               [ 4] 4600 	mul x,a 
      00AD41 89 5D 0F         [ 2] 4601 	ldw acc16,x  
      00AD44 02 72 A2 00      [ 2] 4602 	addw y,acc16 
      00AD48 02 90 FE 26      [ 2] 4603 	cpw y,#XSTACK_EMPTY 
      00AD4C CF A6            [ 2] 4604 	jrule 9$
      00AD4E 0D CD 89 5D      [ 2] 4605 	ldw y,#XSTACK_EMPTY 
      00AD52 5F               [ 4] 4606 9$:	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4607 
                                   4608 ;-----------------------
                                   4609 ; check if value in A:X 
                                   4610 ; is inside xstack bound
                                   4611 ; output:
                                   4612 ;    X     slot address  
                                   4613 ;-----------------------
      003040                       4614 xstack_bound:
      00AD53 7B               [ 1] 4615 	tnz a 
      00AD54 03 97            [ 1] 4616 	jrne 8$ 
      00AD56 CD 98 64         [ 2] 4617 1$: cpw x,#XSTACK_SIZE 
      00AD59 AE AD            [ 1] 4618 	jrugt 8$
      00AD5B 64 CD            [ 1] 4619 	ld a,#CELL_SIZE 
      00AD5D 89               [ 4] 4620 	mul x,a
      00AD5E BA 5B 03         [ 2] 4621 	ldw acc16,x 
      00AD61 90               [ 1] 4622 	ldw x,y 
      00AD62 85 81 20 77      [ 2] 4623 	addw x,acc16 
      00AD66 6F 72 64         [ 2] 4624 	cpw x,#XSTACK_EMPTY 
      00AD69 73 20            [ 1] 4625 	jruge 8$  
      00AD6B 69               [ 4] 4626 	ret 
      00AD6C 6E 20            [ 1] 4627 8$: ld a,#ERR_BAD_VALUE
      00AD6E 64 69 63         [ 2] 4628 	jp tb_error 
                                   4629 
                                   4630 ;-------------------------
                                   4631 ; BASIC: PUT expr, cond 
                                   4632 ; expr -> slot 
                                   4633 ; cond -> valut to put 
                                   4634 ; on xstack 
                                   4635 ;-------------------------
      00305E                       4636 xput:
      00AD71 74 69 6F         [ 4] 4637 	call arg_list 
      00AD74 6E 61            [ 1] 4638 	cp a,#2 
      00AD76 72 79            [ 1] 4639 	jreq 1$ 
      00AD78 0A 00 38         [ 2] 4640 0$:	jp syntax_error
      00AD7A                       4641 1$: _xpop   ; value to put 
      00AD7A CD 99            [ 1]    1     ld a,(y)
      00AD7C E4               [ 1]    2     ldw x,y 
      00AD7D A1 01            [ 2]    3     ldw x,(1,x)
      00AD7F 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00AD83 B8               [ 2] 4642 	pushw x 
      00AD84 88               [ 1] 4643 	push a 
      003073                       4644 	_xpop    ; slot 
      00AD84 90 F6            [ 1]    1     ld a,(y)
      00AD86 93               [ 1]    2     ldw x,y 
      00AD87 EE 01            [ 2]    3     ldw x,(1,x)
      00AD89 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AD8D CF 00 13         [ 4] 4645 	call xstack_bound
      00AD90 81 00 19         [ 2] 4646     ldw ptr16,x 
      00AD91 84               [ 1] 4647 	pop a 
      00AD91 4F               [ 2] 4648 	popw x 
      00AD92 CE 00 13 27      [ 4] 4649 	ld [ptr16],a 
      00AD96 02 5F 81 43      [ 1] 4650 	inc ptr8 
      00AD9A 53 81 00 19      [ 5] 4651 	ldw [ptr16],x 
      00AD9C 81               [ 4] 4652 	ret 
                                   4653 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4654 ;------------------------
                                   4655 ; BASIC: PICK expr 
                                   4656 ; get nième element on 
                                   4657 ; xtack. 
                                   4658 ;-----------------------
      003091                       4659 xpick:
      00AD9C CD 99 E4         [ 4] 4660 	call func_args 
      00AD9F A1 01            [ 1] 4661 	cp a,#1 
      00ADA1 27 03            [ 1] 4662 	jreq 1$
      00ADA3 CC 96 B8         [ 2] 4663 	jp syntax_error 
      00309B                       4664 1$: _xpop 
      00ADA6 90 F6            [ 1]    1     ld a,(y)
      00ADA8 93               [ 1]    2     ldw x,y 
      00ADA9 EE 01            [ 2]    3     ldw x,(1,x)
      00ADAB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00ADAF 4B 00 35         [ 4] 4665 	call xstack_bound
      00ADB2 CC               [ 1] 4666     ld a,(x)
      00ADB3 50 E0            [ 2] 4667 	ldw x,(1,x)				
      00ADB5 9E               [ 4] 4668 	ret 
                                   4669 
                                   4670 
                                   4671 
                                   4672 ;------------------------------
                                   4673 ;      dictionary 
                                   4674 ; format:
                                   4675 ;   link:   2 bytes 
                                   4676 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4677 ;   cmd_name: 16 byte max 
                                   4678 ;   code_addr: 2 bytes 
                                   4679 ;------------------------------
                                   4680 	.macro _dict_entry len,name,code_addr 
                                   4681 	.word LINK 
                                   4682 	LINK=.
                                   4683 name:
                                   4684 	.byte len   	
                                   4685 	.ascii "name"
                                   4686 	.word code_addr  
                                   4687 	.endm 
                                   4688 
                           000000  4689 	LINK=0
                                   4690 ; respect alphabetic order for BASIC names from Z-A
                                   4691 ; this sort order is for a cleaner WORDS cmd output. 	
      0030AB                       4692 kword_end:
      0030AB                       4693 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00ADB6 A4 3F                    1 	.word LINK 
                           0030AD     2 	LINK=.
      0030AD                          3 XOR:
      00ADB8 95                       4 	.byte 3+F_XOR   	
      00ADB9 A3 00 FF                 5 	.ascii "XOR"
      00ADBC 23 06                    6 	.word TK_XOR  
      0030B3                       4694 	_dict_entry,5,WRITE,write  
      00ADBE 0C 01                    1 	.word LINK 
                           0030B5     2 	LINK=.
      0030B5                          3 WRITE:
      00ADC0 98                       4 	.byte 5   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00ADC1 56 20 F5 35 55           5 	.ascii "WRITE"
      00ADC6 50 E0                    6 	.word write  
      0030BD                       4695 	_dict_entry,5,WORDS,words 
      00ADC8 84 C7                    1 	.word LINK 
                           0030BF     2 	LINK=.
      0030BF                          3 WORDS:
      00ADCA 50                       4 	.byte 5   	
      00ADCB E1 9F 4A 35 55           5 	.ascii "WORDS"
      00ADD0 50 E0                    6 	.word words  
      0030C7                       4696 	_dict_entry 4,WAIT,wait 
      00ADD2 C7 50                    1 	.word LINK 
                           0030C9     2 	LINK=.
      0030C9                          3 WAIT:
      00ADD4 E2                       4 	.byte 4   	
      00ADD5 35 AA 50 E0              5 	.ascii "WAIT"
      00ADD9 81 C1                    6 	.word wait  
      00ADDA                       4697 	_dict_entry,3+F_IFUNC,USR,usr
      00ADDA 35 AA                    1 	.word LINK 
                           0030D2     2 	LINK=.
      0030D2                          3 USR:
      00ADDC 50                       4 	.byte 3+F_IFUNC   	
      00ADDD E0 81 52                 5 	.ascii "USR"
      00ADDF 2A 35                    6 	.word usr  
      0030D8                       4698 	_dict_entry,5,UNTIL,until 
      00ADDF CD 99                    1 	.word LINK 
                           0030DA     2 	LINK=.
      0030DA                          3 UNTIL:
      00ADE1 DF                       4 	.byte 5   	
      00ADE2 A1 01 27 03 CC           5 	.ascii "UNTIL"
      00ADE7 96 B8                    6 	.word until  
      00ADE9                       4699 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ADE9 90 F6                    1 	.word LINK 
                           0030E4     2 	LINK=.
      0030E4                          3 UFLASH:
      00ADEB 93                       4 	.byte 6+F_IFUNC   	
      00ADEC EE 01 72 A9 00 03        5 	.ascii "UFLASH"
      00ADF2 4D 26                    6 	.word uflash  
      0030ED                       4700 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ADF4 08 5D                    1 	.word LINK 
                           0030EF     2 	LINK=.
      0030EF                          3 UBOUND:
      00ADF6 26                       4 	.byte 6+F_IFUNC   	
      00ADF7 05 A6 0A CC 96 BA        5 	.ascii "UBOUND"
      00ADFD 4B 18                    6 	.word ubound  
      0030F8                       4701 	_dict_entry,4,TONE,tone  
      00ADFF 59 49                    1 	.word LINK 
                           0030FA     2 	LINK=.
      0030FA                          3 TONE:
      00AE01 25                       4 	.byte 4   	
      00AE02 04 0A 01 26              5 	.ascii "TONE"
      00AE06 F8 5F                    6 	.word tone  
      003101                       4702 	_dict_entry,2,TO,to
      00AE08 84 4A                    1 	.word LINK 
                           003103     2 	LINK=.
      003103                          3 TO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00AE0A 02                       4 	.byte 2   	
      00AE0B 54 4F                    5 	.ascii "TO"
      00AE0B 81 2B                    6 	.word to  
      00AE0C                       4703 	_dict_entry,5,TIMER,set_timer
      00AE0C CD 99                    1 	.word LINK 
                           00310A     2 	LINK=.
      00310A                          3 TIMER:
      00AE0E DF                       4 	.byte 5   	
      00AE0F A1 01 27 03 CC           5 	.ascii "TIMER"
      00AE14 96 B8                    6 	.word set_timer  
      003112                       4704 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AE16 90 F6                    1 	.word LINK 
                           003114     2 	LINK=.
      003114                          3 TIMEOUT:
      00AE18 93                       4 	.byte 7+F_IFUNC   	
      00AE19 EE 01 72 A9 00 03 9F     5 	.ascii "TIMEOUT"
      00AE20 AE 00                    6 	.word timeout  
      00311E                       4705 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AE22 01 A4                    1 	.word LINK 
                           003120     2 	LINK=.
      003120                          3 TICKS:
      00AE24 17                       4 	.byte 5+F_IFUNC   	
      00AE25 27 0A 88 4F 53           5 	.ascii "TICKS"
      00AE29 2A E1                    6 	.word get_ticks  
      003128                       4706 	_dict_entry,4,STOP,stop 
      00AE29 58 49                    1 	.word LINK 
                           00312A     2 	LINK=.
      00312A                          3 STOP:
      00AE2B 0A                       4 	.byte 4   	
      00AE2C 01 26 FA 50              5 	.ascii "STOP"
      00AE2F 26 94                    6 	.word stop  
      003131                       4707 	_dict_entry,4,STEP,step 
      00AE2F 5B 01                    1 	.word LINK 
                           003133     2 	LINK=.
      003133                          3 STEP:
      00AE31 81                       4 	.byte 4   	
      00AE32 53 54 45 50              5 	.ascii "STEP"
      00AE32 85 52                    6 	.word step  
      00313A                       4708 	_dict_entry,5,SPIWR,spi_write
      00AE34 04 89                    1 	.word LINK 
                           00313C     2 	LINK=.
      00313C                          3 SPIWR:
      00AE36 CE                       4 	.byte 5   	
      00AE37 00 05 1F 03 CE           5 	.ascii "SPIWR"
      00AE3C 00 01                    6 	.word spi_write  
      003144                       4709 	_dict_entry,6,SPISEL,spi_select
      00AE3E 1F 05                    1 	.word LINK 
                           003146     2 	LINK=.
      003146                          3 SPISEL:
      00AE40 72                       4 	.byte 6   	
      00AE41 5C 00 20 81 45 4C        5 	.ascii "SPISEL"
      00AE45 2F B3                    6 	.word spi_select  
      00314F                       4710 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AE45 72 5D                    1 	.word LINK 
                           003151     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      003151                          3 SPIRD:
      00AE47 00                       4 	.byte 5+F_IFUNC   	
      00AE48 20 26 03 CC 96           5 	.ascii "SPIRD"
      00AE4D B8 AC                    6 	.word spi_read  
      00AE4E                       4711 	_dict_entry,5,SPIEN,spi_enable 
      00AE4E CD 9C                    1 	.word LINK 
                           00315B     2 	LINK=.
      00315B                          3 SPIEN:
      00AE50 41                       4 	.byte 5   	
      00AE51 90 F6 93 EE 01           5 	.ascii "SPIEN"
      00AE56 72 A9                    6 	.word spi_enable  
      003163                       4712 	_dict_entry,5,SLEEP,sleep 
      00AE58 00 03                    1 	.word LINK 
                           003165     2 	LINK=.
      003165                          3 SLEEP:
      00AE5A 4D                       4 	.byte 5   	
      00AE5B 26 13 5D 26 10           5 	.ascii "SLEEP"
      00AE60 1E 03                    6 	.word sleep  
      00316D                       4713     _dict_entry,4,SIZE,cmd_size 
      00AE62 CF 00                    1 	.word LINK 
                           00316F     2 	LINK=.
      00316F                          3 SIZE:
      00AE64 05                       4 	.byte 4   	
      00AE65 E6 02 C7 00              5 	.ascii "SIZE"
      00AE69 04 1E                    6 	.word cmd_size  
      003176                       4714 	_dict_entry,4,SAVE,save_app 
      00AE6B 05 CF                    1 	.word LINK 
                           003178     2 	LINK=.
      003178                          3 SAVE:
      00AE6D 00                       4 	.byte 4   	
      00AE6E 01 81 56 45              5 	.ascii "SAVE"
      00AE70 27 D8                    6 	.word save_app  
      00317F                       4715 	_dict_entry 3,RUN,run
      00AE70 85 5B                    1 	.word LINK 
                           003181     2 	LINK=.
      003181                          3 RUN:
      00AE72 04                       4 	.byte 3   	
      00AE73 72 5A 00                 5 	.ascii "RUN"
      00AE76 20 FC                    6 	.word run  
      00AE78                       4716 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AE78 AE 50                    1 	.word LINK 
                           003189     2 	LINK=.
      003189                          3 RSHIFT:
      00AE7A 00                       4 	.byte 6+F_IFUNC   	
      00AE7B 4F 81 48 49 46 54        5 	.ascii "RSHIFT"
      00AE7D 2B 2B                    6 	.word rshift  
      003192                       4717 	_dict_entry,3+F_IFUNC,RND,random 
      00AE7D AE 50                    1 	.word LINK 
                           003194     2 	LINK=.
      003194                          3 RND:
      00AE7F 05                       4 	.byte 3+F_IFUNC   	
      00AE80 4F 81 44                 5 	.ascii "RND"
      00AE82 2B F5                    6 	.word random  
      00319A                       4718 	_dict_entry,6,RETURN,return 
      00AE82 AE 50                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



                           00319C     2 	LINK=.
      00319C                          3 RETURN:
      00AE84 0A                       4 	.byte 6   	
      00AE85 4F 81 54 55 52 4E        5 	.ascii "RETURN"
      00AE87 24 6A                    6 	.word return  
      0031A5                       4719 	_dict_entry,7,RESTORE,restore 
      00AE87 AE 50                    1 	.word LINK 
                           0031A7     2 	LINK=.
      0031A7                          3 RESTORE:
      00AE89 0F                       4 	.byte 7   	
      00AE8A 4F 81 53 54 4F 52 45     5 	.ascii "RESTORE"
      00AE8C 2E 5C                    6 	.word restore  
      0031B1                       4720 	_dict_entry 3,REM,remark 
      00AE8C AE 50                    1 	.word LINK 
                           0031B3     2 	LINK=.
      0031B3                          3 REM:
      00AE8E 14                       4 	.byte 3   	
      00AE8F 4F 81 4D                 5 	.ascii "REM"
      00AE91 20 BB                    6 	.word remark  
      0031B9                       4721 	_dict_entry,6,REBOOT,cold_start
      00AE91 AE 50                    1 	.word LINK 
                           0031BB     2 	LINK=.
      0031BB                          3 REBOOT:
      00AE93 19                       4 	.byte 6   	
      00AE94 4F 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00AE96 00 B5                    6 	.word cold_start  
      0031C4                       4722 	_dict_entry,4+F_IFUNC,READ,read  
      00AE96 AE 50                    1 	.word LINK 
                           0031C6     2 	LINK=.
      0031C6                          3 READ:
      00AE98 1E                       4 	.byte 4+F_IFUNC   	
      00AE99 4F 81 41 44              5 	.ascii "READ"
      00AE9B 2E C6                    6 	.word read  
      0031CD                       4723 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AE9B AE 50                    1 	.word LINK 
                           0031CF     2 	LINK=.
      0031CF                          3 QKEY:
      00AE9D 28                       4 	.byte 4+F_IFUNC   	
      00AE9E 4F 81 45 59              5 	.ascii "QKEY"
      00AEA0 29 D2                    6 	.word qkey  
      0031D6                       4724 	_dict_entry,3,PUT,xput 
      00AEA0 4F AE                    1 	.word LINK 
                           0031D8     2 	LINK=.
      0031D8                          3 PUT:
      00AEA2 00                       4 	.byte 3   	
      00AEA3 00 81 54                 5 	.ascii "PUT"
      00AEA5 30 5E                    6 	.word xput  
      0031DE                       4725 	_dict_entry,4,PUSH,xpush   
      00AEA5 4F AE                    1 	.word LINK 
                           0031E0     2 	LINK=.
      0031E0                          3 PUSH:
      00AEA7 00                       4 	.byte 4   	
      00AEA8 01 81 53 48              5 	.ascii "PUSH"
      00AEAA 2F CF                    6 	.word xpush  
      0031E7                       4726 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AEAA 4F AE                    1 	.word LINK 
                           0031E9     2 	LINK=.
      0031E9                          3 PORTI:
      00AEAC 00                       4 	.byte 5+F_IFUNC   	
      00AEAD 02 81 52 54 49           5 	.ascii "PORTI"
      00AEAF 2E 1B                    6 	.word const_porti  
      0031F1                       4727 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AEAF 4F AE                    1 	.word LINK 
                           0031F3     2 	LINK=.
      0031F3                          3 PORTG:
      00AEB1 00                       4 	.byte 5+F_IFUNC   	
      00AEB2 03 81 52 54 47           5 	.ascii "PORTG"
      00AEB4 2E 16                    6 	.word const_portg  
      0031FB                       4728 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AEB4 4F AE                    1 	.word LINK 
                           0031FD     2 	LINK=.
      0031FD                          3 PORTF:
      00AEB6 00                       4 	.byte 5+F_IFUNC   	
      00AEB7 04 81 52 54 46           5 	.ascii "PORTF"
      00AEB9 2E 11                    6 	.word const_portf  
      003205                       4729 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AEB9 4F AE                    1 	.word LINK 
                           003207     2 	LINK=.
      003207                          3 PORTE:
      00AEBB 00                       4 	.byte 5+F_IFUNC   	
      00AEBC 01 81 52 54 45           5 	.ascii "PORTE"
      00AEBE 2E 0C                    6 	.word const_porte  
      00320F                       4730 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AEBE 4F AE                    1 	.word LINK 
                           003211     2 	LINK=.
      003211                          3 PORTD:
      00AEC0 00                       4 	.byte 5+F_IFUNC   	
      00AEC1 00 81 52 54 44           5 	.ascii "PORTD"
      00AEC3 2E 07                    6 	.word const_portd  
      003219                       4731 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AEC3 4F AE                    1 	.word LINK 
                           00321B     2 	LINK=.
      00321B                          3 PORTC:
      00AEC5 40                       4 	.byte 5+F_IFUNC   	
      00AEC6 00 81 52 54 43           5 	.ascii "PORTC"
      00AEC8 2E 02                    6 	.word const_portc  
      003223                       4732 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AEC8 55 00                    1 	.word LINK 
                           003225     2 	LINK=.
      003225                          3 PORTB:
      00AECA 04                       4 	.byte 5+F_IFUNC   	
      00AECB 00 02 81 54 42           5 	.ascii "PORTB"
      00AECE 2D FD                    6 	.word const_portb  
      00322D                       4733 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AECE 89 E6                    1 	.word LINK 
                           00322F     2 	LINK=.
      00322F                          3 PORTA:
      00AED0 03                       4 	.byte 5+F_IFUNC   	
      00AED1 A1 80 26 05 EE           5 	.ascii "PORTA"
      00AED6 04 A3                    6 	.word const_porta  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      003237                       4734 	_dict_entry 5,PRINT,print 
      00AED8 AE C8                    1 	.word LINK 
                           003239     2 	LINK=.
      003239                          3 PRINT:
      00AEDA 85                       4 	.byte 5   	
      00AEDB 81 52 49 4E 54           5 	.ascii "PRINT"
      00AEDC 1F 73                    6 	.word print  
      003241                       4735 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AEDC 5F CF                    1 	.word LINK 
                           003243     2 	LINK=.
      003243                          3 POUT:
      00AEDE 00                       4 	.byte 4+F_IFUNC   	
      00AEDF 07 CF 00 09              5 	.ascii "POUT"
      00AEE3 CE 00                    6 	.word const_output  
      00324A                       4736 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AEE5 1C CD                    1 	.word LINK 
                           00324C     2 	LINK=.
      00324C                          3 POP:
      00AEE7 98                       4 	.byte 3+F_IFUNC   	
      00AEE8 1C A1 84                 5 	.ascii "POP"
      00AEEB 26 10                    6 	.word xpop  
      003252                       4737 	_dict_entry,4,POKE,poke 
      00AEED CD 98                    1 	.word LINK 
                           003254     2 	LINK=.
      003254                          3 POKE:
      00AEEF 4E                       4 	.byte 4   	
      00AEF0 90 89 4F CD              5 	.ascii "POKE"
      00AEF4 8C 97                    6 	.word poke  
      00325B                       4738 	_dict_entry,5,PMODE,pin_mode 
      00AEF6 90 85                    1 	.word LINK 
                           00325D     2 	LINK=.
      00325D                          3 PMODE:
      00AEF8 5D                       4 	.byte 5   	
      00AEF9 26 17 20 44 45           5 	.ascii "PMODE"
      00AEFD 2B 66                    6 	.word pin_mode  
      003265                       4739 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AEFD 55 00                    1 	.word LINK 
                           003267     2 	LINK=.
      003267                          3 PINP:
      00AEFF 03                       4 	.byte 4+F_IFUNC   	
      00AF00 00 02 C3 00              5 	.ascii "PINP"
      00AF04 1E 24                    6 	.word const_input  
      00326E                       4740 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AF06 3A 67                    1 	.word LINK 
                           003270     2 	LINK=.
      00AF07                          3 PICK:
      00AF07 CD                       4 	.byte 4+F_IFUNC   	
      00AF08 AE CE 26 00              5 	.ascii "PICK"
      00AF0C CD AF                    6 	.word xpick  
      003277                       4741 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AF0E 1F 26                    1 	.word LINK 
                           003279     2 	LINK=.
      003279                          3 PEEK:
      00AF10 FB                       4 	.byte 4+F_IFUNC   	
      00AF11 81 45 45 4B              5 	.ascii "PEEK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AF12 21 BD                    6 	.word peek  
      003280                       4742 	_dict_entry,5,PAUSE,pause 
      00AF12 CF 00                    1 	.word LINK 
                           003282     2 	LINK=.
      003282                          3 PAUSE:
      00AF14 07                       4 	.byte 5   	
      00AF15 E6 02 C7 00 0A           5 	.ascii "PAUSE"
      00AF1A 35 06                    6 	.word pause  
      00328A                       4743 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AF1C 00 09                    1 	.word LINK 
                           00328C     2 	LINK=.
      00328C                          3 PAD:
      00AF1E 81                       4 	.byte 3+F_IFUNC   	
      00AF1F 50 41 44                 5 	.ascii "PAD"
      00AF1F E6 02                    6 	.word pad_ref  
      003292                       4744 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AF21 C7 00                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 OR:
      00AF23 0F                       4 	.byte 2+F_OR   	
      00AF24 72 5F                    5 	.ascii "OR"
      00AF26 00 0E                    6 	.word TK_OR  
      003299                       4745 	_dict_entry,2,ON,cmd_on 
      00AF28 72 BB                    1 	.word LINK 
                           00329B     2 	LINK=.
      00329B                          3 ON:
      00AF2A 00                       4 	.byte 2   	
      00AF2B 0E C3                    5 	.ascii "ON"
      00AF2D 00 1E                    6 	.word cmd_on  
      0032A0                       4746 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AF2F 25 02                    1 	.word LINK 
                           0032A2     2 	LINK=.
      0032A2                          3 ODR:
      00AF31 20                       4 	.byte 3+F_IFUNC   	
      00AF32 0E 44 52                 5 	.ascii "ODR"
      00AF33 2E 20                    6 	.word const_odr  
      0032A8                       4747 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AF33 CD AE                    1 	.word LINK 
                           0032AA     2 	LINK=.
      0032AA                          3 NOT:
      00AF35 CE                       4 	.byte 3+F_NOT   	
      00AF36 27 04 A6                 5 	.ascii "NOT"
      00AF39 01 20                    6 	.word TK_NOT  
      0032B0                       4748 	_dict_entry,4,NEXT,next 
      00AF3B 04 CD                    1 	.word LINK 
                           0032B2     2 	LINK=.
      0032B2                          3 NEXT:
      00AF3D AF                       4 	.byte 4   	
      00AF3E 12 4F 81 54              5 	.ascii "NEXT"
      00AF41 22 B3                    6 	.word next  
      0032B9                       4749 	_dict_entry,3,NEW,new
      00AF41 A6 0C                    1 	.word LINK 
                           0032BB     2 	LINK=.
      0032BB                          3 NEW:
      00AF43 CC                       4 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AF44 96 BA 57                 5 	.ascii "NEW"
      00AF46 26 E0                    6 	.word new  
      0032C1                       4750 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AF46 52 07                    1 	.word LINK 
                           0032C3     2 	LINK=.
      0032C3                          3 LSHIFT:
      00AF48 CD                       4 	.byte 6+F_IFUNC   	
      00AF49 A0 7C 48 49 46 54        5 	.ascii "LSHIFT"
      00AF4B 2A FF                    6 	.word lshift  
      0032CC                       4751 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AF4B C6 00                    1 	.word LINK 
                           0032CE     2 	LINK=.
      0032CE                          3 LOG2:
      00AF4D 09                       4 	.byte 4+F_IFUNC   	
      00AF4E C1 00 0A 27              5 	.ascii "LOG2"
      00AF52 37 5F                    6 	.word log2  
      00AF53                       4752 	_dict_entry 4,LIST,list
      00AF53 CE 00                    1 	.word LINK 
                           0032D7     2 	LINK=.
      0032D7                          3 LIST:
      00AF55 07                       4 	.byte 4   	
      00AF56 CF 00 05 55              5 	.ascii "LIST"
      00AF5A 00 09                    6 	.word list  
      0032DE                       4753 	_dict_entry 3,LET,let 
      00AF5C 00 02                    1 	.word LINK 
                           0032E0     2 	LINK=.
      0032E0                          3 LET:
      00AF5E 55                       4 	.byte 3   	
      00AF5F 00 0A 00                 5 	.ascii "LET"
      00AF62 04 CD                    6 	.word let  
      0032E6                       4754 	_dict_entry,3+F_CFUNC,KEY,key 
      00AF64 9B 28                    1 	.word LINK 
                           0032E8     2 	LINK=.
      0032E8                          3 KEY:
      00AF66 A1                       4 	.byte 3+F_CFUNC   	
      00AF67 84 27 03                 5 	.ascii "KEY"
      00AF6A CC 96                    6 	.word key  
      0032EE                       4755 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AF6C B8 E8                    1 	.word LINK 
                           0032F0     2 	LINK=.
      00AF6D                          3 IWDGREF:
      00AF6D CD                       4 	.byte 7   	
      00AF6E 98 1C CE 00 05 CF 00     5 	.ascii "IWDGREF"
      00AF75 07 55                    6 	.word refresh_iwdg  
      0032FA                       4756 	_dict_entry,6,IWDGEN,enable_iwdg
      00AF77 00 02                    1 	.word LINK 
                           0032FC     2 	LINK=.
      0032FC                          3 IWDGEN:
      00AF79 00                       4 	.byte 6   	
      00AF7A 09 CD A0 8C 90 F6        5 	.ascii "IWDGEN"
      00AF80 93 EE                    6 	.word enable_iwdg  
      003305                       4757 	_dict_entry,5,INPUT,input_var  
      00AF82 01 72                    1 	.word LINK 
                           003307     2 	LINK=.
      003307                          3 INPUT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AF84 A9                       4 	.byte 5   	
      00AF85 00 03 5B 07 81           5 	.ascii "INPUT"
      00AF8A 20 1C                    6 	.word input_var  
      00330F                       4758 	_dict_entry,2,IF,if 
      00AF8A CE 00                    1 	.word LINK 
                           003311     2 	LINK=.
      003311                          3 IF:
      00AF8C 07                       4 	.byte 2   	
      00AF8D CD AF                    5 	.ascii "IF"
      00AF8F 1F 27                    6 	.word if  
      003316                       4759 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AF91 C1 20                    1 	.word LINK 
                           003318     2 	LINK=.
      003318                          3 IDR:
      00AF93 AD                       4 	.byte 3+F_IFUNC   	
      00AF94 49 44 52                 5 	.ascii "IDR"
      00AF94 CD 99                    6 	.word const_idr  
      00331E                       4760 	_dict_entry,3,HEX,hex_base
      00AF96 E4 A1                    1 	.word LINK 
                           003320     2 	LINK=.
      003320                          3 HEX:
      00AF98 02                       4 	.byte 3   	
      00AF99 27 03 CC                 5 	.ascii "HEX"
      00AF9C 96 B8                    6 	.word hex_base  
      00AF9E                       4761 	_dict_entry,4,GOTO,goto 
      00AF9E 72 12                    1 	.word LINK 
                           003328     2 	LINK=.
      003328                          3 GOTO:
      00AFA0 50                       4 	.byte 4   	
      00AFA1 C7 85 5D 27              5 	.ascii "GOTO"
      00AFA5 21 85                    6 	.word goto  
      00332F                       4762 	_dict_entry,5,GOSUB,gosub 
      00AFA7 A6 08                    1 	.word LINK 
                           003331     2 	LINK=.
      003331                          3 GOSUB:
      00AFA9 42                       4 	.byte 5   	
      00AFAA 9F C7 52 00 72           5 	.ascii "GOSUB"
      00AFAF 1A 50                    6 	.word gosub  
      003339                       4763 	_dict_entry,3,GET,cmd_get 
      00AFB1 14 72                    1 	.word LINK 
                           00333B     2 	LINK=.
      00333B                          3 GET:
      00AFB3 1A                       4 	.byte 3   	
      00AFB4 50 16 72                 5 	.ascii "GET"
      00AFB7 14 52                    6 	.word cmd_get  
      003341                       4764 	_dict_entry,4+F_IFUNC,FREE,free
      00AFB9 00 72                    1 	.word LINK 
                           003343     2 	LINK=.
      003343                          3 FREE:
      00AFBB 12                       4 	.byte 4+F_IFUNC   	
      00AFBC 52 01 72 10              5 	.ascii "FREE"
      00AFC0 52 01                    6 	.word free  
      00334A                       4765 	_dict_entry,3,FOR,for 
      00AFC2 72 1C                    1 	.word LINK 
                           00334C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00334C                          3 FOR:
      00AFC4 52                       4 	.byte 3   	
      00AFC5 00 81 52                 5 	.ascii "FOR"
      00AFC7 21 FB                    6 	.word for  
      003352                       4766 	_dict_entry,4,FCPU,fcpu 
      00AFC7 5B 02                    1 	.word LINK 
                           003354     2 	LINK=.
      003354                          3 FCPU:
      00AFC9 A6                       4 	.byte 4   	
      00AFCA 82 C4 52 03              5 	.ascii "FCPU"
      00AFCE A1 02                    6 	.word fcpu  
      00335B                       4767 	_dict_entry,5,ERASE,erase 
      00AFD0 26 F7                    1 	.word LINK 
                           00335D     2 	LINK=.
      00335D                          3 ERASE:
      00AFD2 72                       4 	.byte 5   	
      00AFD3 1D 52 00 72 13           5 	.ascii "ERASE"
      00AFD8 50 C7                    6 	.word erase  
      003365                       4768 	_dict_entry,3,END,cmd_end  
      00AFDA 72 1B                    1 	.word LINK 
                           003367     2 	LINK=.
      003367                          3 END:
      00AFDC 50                       4 	.byte 3   	
      00AFDD 16 81 44                 5 	.ascii "END"
      00AFDF 24 EC                    6 	.word cmd_end  
      00336D                       4769 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AFDF A6 78                    1 	.word LINK 
                           00336F     2 	LINK=.
      00336F                          3 EEPROM:
      00AFE1 C5                       4 	.byte 6+F_IFUNC   	
      00AFE2 52 03 27 04 72 5F        5 	.ascii "EEPROM"
      00AFE8 52 03                    6 	.word const_eeprom_base  
      003378                       4770 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AFEA 81 6F                    1 	.word LINK 
                           00337A     2 	LINK=.
      00AFEB                          3 EEFREE:
      00AFEB 88                       4 	.byte 6+F_IFUNC   	
      00AFEC CD AF DF 84 72 03        5 	.ascii "EEFREE"
      00AFF2 52 03                    6 	.word func_eefree  
      003383                       4771 	_dict_entry,4,EDIT,edit 
      00AFF4 FB C7                    1 	.word LINK 
                           003385     2 	LINK=.
      003385                          3 EDIT:
      00AFF6 52                       4 	.byte 4   	
      00AFF7 04 72 01 52              5 	.ascii "EDIT"
      00AFFB 03 FB                    6 	.word edit  
      00338C                       4772 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AFFD C6 52                    1 	.word LINK 
                           00338E     2 	LINK=.
      00338E                          3 DWRITE:
      00AFFF 04                       4 	.byte 6+F_CMD   	
      00B000 81 57 52 49 54 45        5 	.ascii "DWRITE"
      00B001 26 49                    6 	.word digital_write  
      003397                       4773 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00B001 A6 FF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



                           003399     2 	LINK=.
      003399                          3 DROP:
      00B003 72                       4 	.byte 4   	
      00B004 01 52 03 E3              5 	.ascii "DROP"
      00B008 C6 52                    6 	.word xdrop  
      0033A0                       4774 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00B00A 04 81                    1 	.word LINK 
                           0033A2     2 	LINK=.
      00B00C                          3 DREAD:
      00B00C CD                       4 	.byte 5+F_IFUNC   	
      00B00D 9B 28 A1 84 27           5 	.ascii "DREAD"
      00B012 03 CC                    6 	.word digital_read  
      0033AA                       4775 	_dict_entry,2,DO,do_loop
      00B014 96 B8                    1 	.word LINK 
                           0033AC     2 	LINK=.
      00B016                          3 DO:
      00B016 9F                       4 	.byte 2   	
      00B017 CD AF                    5 	.ascii "DO"
      00B019 EB CD                    6 	.word do_loop  
      0033B1                       4776 	_dict_entry,3,DIR,cmd_dir
      00B01B 98 1C                    1 	.word LINK 
                           0033B3     2 	LINK=.
      0033B3                          3 DIR:
      00B01D A1                       4 	.byte 3   	
      00B01E 08 26 02                 5 	.ascii "DIR"
      00B021 20 E9                    6 	.word cmd_dir  
      0033B9                       4777 	_dict_entry,3,DIM,cmd_dim 
      00B023 4D 27                    1 	.word LINK 
                           0033BB     2 	LINK=.
      0033BB                          3 DIM:
      00B025 05                       4 	.byte 3   	
      00B026 55 00 03                 5 	.ascii "DIM"
      00B029 00 02                    6 	.word cmd_dim  
      0033C1                       4778 	_dict_entry,3,DEC,dec_base
      00B02B 81 BB                    1 	.word LINK 
                           0033C3     2 	LINK=.
      00B02C                          3 DEC:
      00B02C CD                       4 	.byte 3   	
      00B02D B0 01 5F                 5 	.ascii "DEC"
      00B030 97 4F                    6 	.word dec_base  
      0033C9                       4779 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00B032 81 C3                    1 	.word LINK 
                           0033CB     2 	LINK=.
      00B033                          3 DDR:
      00B033 CD                       4 	.byte 3+F_IFUNC   	
      00B034 98 1C A1                 5 	.ascii "DDR"
      00B037 84 27                    6 	.word const_ddr  
      0033D1                       4780 	_dict_entry,4,DATA,data  
      00B039 03 CC                    1 	.word LINK 
                           0033D3     2 	LINK=.
      0033D3                          3 DATA:
      00B03B 96                       4 	.byte 4   	
      00B03C B8 5D 27 05              5 	.ascii "DATA"
      00B040 72 1B                    6 	.word data  
      0033DA                       4781 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00B042 50 14                    1 	.word LINK 
                           0033DC     2 	LINK=.
      0033DC                          3 CR2:
      00B044 81                       4 	.byte 3+F_IFUNC   	
      00B045 43 52 32                 5 	.ascii "CR2"
      00B045 72 1A                    6 	.word const_cr2  
      0033E2                       4782 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00B047 50 14                    1 	.word LINK 
                           0033E4     2 	LINK=.
      0033E4                          3 CR1:
      00B049 81                       4 	.byte 3+F_IFUNC   	
      00B04A 43 52 31                 5 	.ascii "CR1"
      00B04A AE 16                    6 	.word const_cr1  
      0033EA                       4783 	_dict_entry,5,CONST,cmd_const 
      00B04C E0 4F                    1 	.word LINK 
                           0033EC     2 	LINK=.
      0033EC                          3 CONST:
      00B04E 81                       4 	.byte 5   	
      00B04F 43 4F 4E 53 54           5 	.ascii "CONST"
      00B04F CD 9C                    6 	.word cmd_const  
      0033F4                       4784 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00B051 41 81                    1 	.word LINK 
                           0033F6     2 	LINK=.
      00B053                          3 CHAR:
      00B053 90                       4 	.byte 4+F_CFUNC   	
      00B054 F6 93 EE 01              5 	.ascii "CHAR"
      00B058 72 A9                    6 	.word func_char  
      0033FD                       4785 	_dict_entry,3,BYE,bye 
      00B05A 00 03                    1 	.word LINK 
                           0033FF     2 	LINK=.
      0033FF                          3 BYE:
      00B05C 81                       4 	.byte 3   	
      00B05D 42 59 45                 5 	.ascii "BYE"
      00B05D CD 9B                    6 	.word bye  
      003405                       4786 	_dict_entry,5,BTOGL,bit_toggle
      00B05F 28 A1                    1 	.word LINK 
                           003407     2 	LINK=.
      003407                          3 BTOGL:
      00B061 84                       4 	.byte 5   	
      00B062 27 03 CC 96 B8           5 	.ascii "BTOGL"
      00B067 90 F6                    6 	.word bit_toggle  
      00340F                       4787 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00B069 93 EE                    1 	.word LINK 
                           003411     2 	LINK=.
      003411                          3 BTEST:
      00B06B 01                       4 	.byte 5+F_IFUNC   	
      00B06C 72 A9 00 03 4D           5 	.ascii "BTEST"
      00B071 27 05                    6 	.word bit_test  
      003419                       4788 	_dict_entry,4,BSET,bit_set 
      00B073 A6 0A                    1 	.word LINK 
                           00341B     2 	LINK=.
      00341B                          3 BSET:
      00B075 CC                       4 	.byte 4   	
      00B076 96 BA A3 00              5 	.ascii "BSET"
      00B07A 14 22                    6 	.word bit_set  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      003422                       4789 	_dict_entry,4,BRES,bit_reset
      00B07C F6 A6                    1 	.word LINK 
                           003424     2 	LINK=.
      003424                          3 BRES:
      00B07E 03                       4 	.byte 4   	
      00B07F 42 CF 00 0E              5 	.ascii "BRES"
      00B083 72 B2                    6 	.word bit_reset  
      00342B                       4790 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00B085 00 0E                    1 	.word LINK 
                           00342D     2 	LINK=.
      00342D                          3 BIT:
      00B087 90                       4 	.byte 3+F_IFUNC   	
      00B088 A3 17 60                 5 	.ascii "BIT"
      00B08B 22 05                    6 	.word bitmask  
      003433                       4791 	_dict_entry,3,AWU,awu 
      00B08D A6 01                    1 	.word LINK 
                           003435     2 	LINK=.
      003435                          3 AWU:
      00B08F CC                       4 	.byte 3   	
      00B090 96 BA 55                 5 	.ascii "AWU"
      00B092 2A 8F                    6 	.word awu  
      00343B                       4792 	_dict_entry,3+F_IFUNC,ASC,ascii
      00B092 81 35                    1 	.word LINK 
                           00343D     2 	LINK=.
      00B093                          3 ASC:
      00B093 CD                       4 	.byte 3+F_IFUNC   	
      00B094 9B 28 A1                 5 	.ascii "ASC"
      00B097 84 27                    6 	.word ascii  
      003443                       4793 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00B099 03 CC                    1 	.word LINK 
                           003445     2 	LINK=.
      003445                          3 AND:
      00B09B 96                       4 	.byte 3+F_AND   	
      00B09C B8 90 F6                 5 	.ascii "AND"
      00B09F 93 EE                    6 	.word TK_AND  
      00344B                       4794 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00B0A1 01 72                    1 	.word LINK 
                           00344D     2 	LINK=.
      00344D                          3 ALLOC:
      00B0A3 A9                       4 	.byte 5   	
      00B0A4 00 03 9F A4 1F           5 	.ascii "ALLOC"
      00B0A9 5F 97                    6 	.word xalloc  
      003455                       4795 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00B0AB A6 03                    1 	.word LINK 
                           003457     2 	LINK=.
      003457                          3 ADCREAD:
      00B0AD 42                       4 	.byte 7+F_IFUNC   	
      00B0AE CF 00 0E 72 B9 00 0E     5 	.ascii "ADCREAD"
      00B0B5 90 A3                    6 	.word analog_read  
      003461                       4796 	_dict_entry,5,ADCON,power_adc 
      00B0B7 17 73                    1 	.word LINK 
                           003463     2 	LINK=.
      003463                          3 ADCON:
      00B0B9 23                       4 	.byte 5   	
      00B0BA 04 90 AE 17 73           5 	.ascii "ADCON"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00B0BF 81 86                    6 	.word power_adc  
      00B0C0                       4797 kword_dict::
      00346B                       4798 	_dict_entry,3+F_IFUNC,ABS,abs
      00B0C0 4D 26                    1 	.word LINK 
                           00346D     2 	LINK=.
      00346D                          3 ABS:
      00B0C2 16                       4 	.byte 3+F_IFUNC   	
      00B0C3 A3 00 14                 5 	.ascii "ABS"
      00B0C6 22 11                    6 	.word abs  
                                   4799 
                           000000  4800 INDIRECT=0 
                           000000  4801 .if INDIRECT 
                                   4802 ;comands and fonctions address table 	
                                   4803 code_addr::
                                   4804 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4805 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4806 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4807 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4808 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4809 	.word let,list,log2,lshift,next,new ; 40..47
                                   4810 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4811 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4812 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4813 	.word restore,return, random,rshift,run,free ; 72..79
                                   4814 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4815 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4816 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4817 	.word func_eefree,0 
                                   4818 .endif 
                                   4819 
                                   4820 
                                   4821 
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
      003473                         30 test:
      003473                         31     _vars VSIZE 
      00B0C8 A6 03            [ 2]    1     sub sp,#VSIZE 
      00B0CA 42 CF 00         [ 2]   32     ldw x,#LOOP_CNT
      00B0CD 0E 93            [ 2]   33     ldw (CNTR,sp),x  
      00B0CF 72 BB 00         [ 2]   34     ldw x,ticks 
      00B0D2 0E A3            [ 2]   35     ldw (T,sp),x
      00347F                         36 1$: ; test add24 
      00B0D4 17 73            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00B0D6 24 01 81         [ 2]   38     ldw x,#VAL1&0XFFFF
      00B0D9 A6 0A CC         [ 1]   39     ld acc24,a 
      00B0DC 96 BA 0D         [ 2]   40     ldw acc24+1,x  
      00B0DE A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00B0DE CD 99 E4         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00B0E1 A1 02 27         [ 4]   43     call add24 
      00B0E4 03 CC            [ 2]   44     ldw x,(CNTR,sp)
      00B0E6 96 B8 90         [ 2]   45     subw x,#1
      00B0E9 F6 93            [ 2]   46     ldw (CNTR,sp),x 
      00B0EB EE 01            [ 1]   47     jrne 1$
      00B0ED 72 A9 00         [ 4]   48     call prt_acc24
      00B0F0 03 89            [ 1]   49     ld a,#SPACE 
      00B0F2 88 90 F6         [ 4]   50     call putc 
      00B0F5 93 EE 01         [ 2]   51     ldw x,ticks 
      00B0F8 72 A9 00         [ 2]   52     subw x,(T,sp)
      00B0FB 03 CD B0         [ 4]   53     call prt_i16  
      00B0FE C0 CF            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00B100 00 1A 84         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00B103 85 72 C7         [ 2]   58     ldw x,LOOP_CNT
      00B106 00 1A            [ 2]   59     ldw (CNTR,sp),x 
      00B108 72 5C 00         [ 2]   60     ldw x,ticks 
      00B10B 1B 72            [ 2]   61     ldw (T,sp),x 
      0034BB                         62 2$: 
      00B10D CF 00            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00B10F 1A 81 FF         [ 2]   64     ldw x,#VAL1&0XFFFF
      00B111 C7 00 0C         [ 1]   65     ld acc24,a 
      00B111 CD 99 DF         [ 2]   66     ldw acc24+1,x  
      00B114 A1 01            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00B116 27 03 CC         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00B119 96 B8 90         [ 4]   69     call mul24 
      00B11C F6 93            [ 2]   70     ldw x,(CNTR,sp)
      00B11E EE 01 72         [ 2]   71     subw x,#1
      00B121 A9 00            [ 2]   72     ldw (CNTR,sp),x 
      00B123 03 CD            [ 1]   73     jrne 2$ 
      00B125 B0 C0 F6         [ 4]   74    call prt_acc24 
      00B128 EE 01            [ 1]   75    ld a,#SPACE 
      00B12A 81 08 DD         [ 4]   76    call putc 
      00B12B CE 00 0F         [ 2]   77     ldw x,ticks 
      00B12B 00 00 01         [ 2]   78     subw x,(T,sp)
      00B12D CD 17 E4         [ 4]   79     call prt_i16 
      00B12D A3 58            [ 1]   80     ld a,#CR 
      00B12F 4F 52 00         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00B132 8A B1 2D         [ 2]   83     ldw x,LOOP_CNT
      00B135 1F 03            [ 2]   84     ldw (CNTR,sp),x 
      00B135 05 57 52         [ 2]   85     ldw x,ticks 
      00B138 49 54            [ 2]   86     ldw (T,sp),x 
      0034F7                         87 3$: 
      00B13A 45 A9            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B13C 8F B1 35         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B13F C7 00 0C         [ 1]   90     ld acc24,a 
      00B13F 05 57 4F         [ 2]   91     ldw acc24+1,x  
      00B142 52 44            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B144 53 AD 10         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B147 B1 3F 69         [ 4]   94     call mul24 
      00B149 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00B149 04 57 41         [ 2]   96     subw x,#1
      00B14C 49 54            [ 2]   97     ldw (CNTR,sp),x 
      00B14E A1 41            [ 1]   98     jrne 3$ 
      00B150 B1 49 FB         [ 4]   99     call prt_acc24    
      00B152 A6 20            [ 1]  100     ld a,#SPACE 
      00B152 13 55 53         [ 4]  101     call putc 
      00B155 52 AA B5         [ 2]  102     ldw x,ticks 
      00B158 B1 52 01         [ 2]  103     subw x,(T,sp)
      00B15A CD 17 E4         [ 4]  104     call prt_i16 
      00B15A 05 55            [ 1]  105     ld a,#CR 
      00B15C 4E 54 49         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B15F 4C AE 45         [ 2]  108     ldw x,LOOP_CNT
      00B162 B1 5A            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00B164 CE 00 0F         [ 2]  110     ldw x,ticks 
      00B164 16 55            [ 2]  111     ldw (T,sp),x 
      003533                        112 4$:
      00B166 46 4C            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B168 41 53 48         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B16B AA 8F B1         [ 1]  115     ld acc24,a 
      00B16E 64 00 0D         [ 2]  116     ldw acc24+1,x  
      00B16F A6 FF            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B16F 16 55 42         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B172 4F 55 4E         [ 4]  119     call mul24 
      00B175 44 9C            [ 2]  120     ldw x,(CNTR,sp)
      00B177 F5 B1 6F         [ 2]  121     subw x,#1
      00B17A 1F 03            [ 2]  122     ldw (CNTR,sp),x 
      00B17A 04 54            [ 1]  123     jrne 4$ 
      00B17C 4F 4E 45         [ 4]  124     call prt_acc24 
      00B17F A5 AB            [ 1]  125     ld a,#SPACE 
      00B181 B1 7A DD         [ 4]  126     call putc 
      00B183 CE 00 0F         [ 2]  127     ldw x,ticks 
      00B183 02 54 4F         [ 2]  128     subw x,(T,sp)
      00B186 A2 AB B1         [ 4]  129     call prt_i16 
      00B189 83 0D            [ 1]  130     ld a,#CR 
      00B18A CD 08 DD         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B18A 05 54 49         [ 2]  133     ldw x,LOOP_CNT
      00B18D 4D 45            [ 2]  134     ldw (CNTR,sp),x 
      00B18F 52 AD 7A         [ 2]  135     ldw x,ticks 
      00B192 B1 8A            [ 2]  136     ldw (T,sp),x 
      00B194                        137 5$: 
      00B194 17 54            [ 1]  138     ld a,#0xff
      00B196 49 4D 45         [ 2]  139     ldw x,#0xffff
      00B199 4F 55 54         [ 4]  140     call abs24 
      00B19C AD 91 B1         [ 1]  141     ld acc24,a 
      00B19F 94 00 0D         [ 2]  142     ldw acc24+1,x
      00B1A0 1E 03            [ 2]  143     ldw x,(CNTR,sp)
      00B1A0 15 54 49         [ 2]  144     subw x,#1
      00B1A3 43 4B            [ 2]  145     ldw (CNTR,sp),x 
      00B1A5 53 AB            [ 1]  146     jrne 5$ 
      00B1A7 61 B1 A0         [ 4]  147     call prt_acc24 
      00B1AA A6 20            [ 1]  148     ld a,#SPACE 
      00B1AA 04 53 54         [ 4]  149     call putc 
      00B1AD 4F 50 A7         [ 2]  150     ldw x,ticks 
      00B1B0 14 B1 AA         [ 2]  151     subw x,(T,sp)
      00B1B3 CD 17 E4         [ 4]  152     call prt_i16 
      003597                        153 6$:
      00B1B3 04 53            [ 1]  154     ld a,#CR 
      00B1B5 54 45 50         [ 4]  155     call putc 
      00B1B8 A2 F1 B1         [ 4]  156     call read_integer 
      00B1BB B3 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00B1BC 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00B1BC 05 53 50 49 57   [ 1]  159     mov farptr+2,acc8 
      00B1C1 52 B0 0C         [ 4]  160     call read_integer 
      00B1C4 B1 BC 0C         [ 1]  161     ld a,acc24 
      00B1C6 CE 00 0D         [ 2]  162     ldw x,acc16 
      00B1C6 06 53 50 49 53   [ 1]  163     mov acc24,farptr 
      00B1CB 45 4C B0 33 B1   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00B1D0 C6 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00B1D1 CD 02 F7         [ 4]  166     call div24 
      00B1D1 15               [ 1]  167     push a 
      00B1D2 53               [ 2]  168     pushw x 
      00B1D3 50 49 52         [ 4]  169     call prt_acc24 
      00B1D6 44 B0            [ 1]  170     ld a,#SPACE 
      00B1D8 2C B1 D1         [ 4]  171     call putc 
      00B1DB 85               [ 2]  172     popw x
      00B1DB 05 53 50         [ 2]  173     ldw acc16,x  
      00B1DE 49 45 4E         [ 1]  174     pop acc24 
      00B1E1 AF 94 B1         [ 4]  175     call prt_acc24
      00B1E4 DB B8            [ 2]  176     jra 6$
      00B1E5                        177     _drop VSIZE 
      00B1E5 05 53            [ 2]    1     addw sp,#VSIZE 
      00B1E7 4C               [ 4]  178     ret 
                                    179 
                                    180 
      0035E2                        181 read_integer:
      00B1E8 45 45            [ 1]  182     ld a,#'? 
      00B1EA 50 AA E4         [ 4]  183     call putc  
      00B1ED B1 E5 00 03      [ 1]  184 	clr count  
      00B1EF CD 0A 3F         [ 4]  185 	call readln 
      00B1EF 04 53 49         [ 2]  186 	ldw x,#tib 
      00B1F2 5A 45 9C         [ 1]  187 	push count
      00B1F5 C8 B1            [ 1]  188 	push #0 
      00B1F7 EF FB 01         [ 2]  189 	addw x,(1,sp)
      00B1F8 5C               [ 1]  190 	incw x 
      0035FA                        191 	_drop 2 
      00B1F8 04 53            [ 2]    1     addw sp,#2 
      00B1FA 41 56 45 A8      [ 1]  192 	clr in 
      00B1FE 58 B1 F8         [ 4]  193 	call get_token
      00B201 A1 84            [ 1]  194 	cp a,#TK_INTGR
      00B201 03 52            [ 1]  195 	jreq 3$ 
      00B203 55 4E            [ 1]  196 	cp a,#TK_MINUS
      00B205 A5 07 B2         [ 4]  197 	call get_token 
      00B208 01 84            [ 1]  198 	cp a,#TK_INTGR 
      00B209 27 03            [ 1]  199 	jreq 2$
      00B209 16 52 53         [ 2]  200 	jp syntax_error
      003613                        201 2$:
      00B20C 48 49 46         [ 4]  202 	call neg_acc24  	
      003616                        203 3$: 
      00B20F 54               [ 4]  204     ret 
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
      003680                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003680                         30 app_space::
      00B210 AB AB                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B212 B2 09                   32 app_size: .word 0 
      00B214                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00346D R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003463 R
    ADCON_ID=  000002     |   4 ADCREAD    003457 R   |     ADCREAD_=  000004 
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
  4 ALLOC      00344D R   |   4 AND        003445 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        00343D R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   00014C R   |   4 AWU        003435 R
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
  4 BIT        00342D R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003424 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       00341B R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      003411 R
    BTEST_ID=  000010     |   4 BTOGL      003407 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        0033FF R   |     BYE_IDX =  000014 
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
  4 CHAR       0033F6 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000006     |     CNTR    =  000003     |     CNT_LO  =  000004 
    CODE_ADD=  000001     |     COMMA   =  00002C     |   4 CONST      0033EC R
    CONST_ID=  0000B6     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        0033E4 R   |     CR1_IDX =  00001A     |   4 CR2        0033DC R
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
  4 DATA       0033D3 R   |     DATA_IDX=  00001C     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        0033CB R   |     DDR_IDX =  00001E     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        0033C3 R
    DEC_IDX =  000020     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   4 DIM        0033BB R   |   4 DIR        0033B3 R
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0033AC R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      0033A2 R   |     DREAD_ID=  000024     |   4 DROP       003399 R
  4 DWRITE     00338E R   |     DWRITE_I=  000026     |   4 EDIT       003385 R
    EDIT_IDX=  000028     |   4 EEFREE     00337A R   |     EEFREE_I=  0000B8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

  4 EEPROM     00336F R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        003367 R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      00335D R
    ERASE_ID=  00002E     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_OVER=  000010     |     ERR_RD_O=  000011     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       003354 R
    FCPU_IDX=  000030     |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FIRST_DA=  000006 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   001E5F R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        00334C R   |     FOR_IDX =  000034     |   4 FREE       003343 R
    FREE_IDX=  000088     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_AND   =  000080     |     F_CFUNC =  000020     |     F_CMD   =  000000 
    F_CONST =  000030     |     F_IFUNC =  000010     |     F_NOT   =  000070 
    F_OR    =  000090     |     F_XOR   =  0000A0     |   4 GET        00333B R
    GET_IDX =  0000B4     |   4 GOSUB      003331 R   |     GOSUB_ID=  000036 
  4 GOTO       003328 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        003320 R   |     HEX_IDX =  00003A 
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
    I2C_OAR_=  000813     |     I2C_OAR_=  000009     |     I2C_PECR=  00521E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    I2C_READ=  000001     |     I2C_SR1 =  005217     |     I2C_SR1_=  000003 
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003318 R
    IDR_IDX =  00003C     |   4 IF         003311 R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INDIRECT=  000000 
    INP     =  000000     |   4 INPUT      003307 R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     0032FC R   |     IWDGEN_I=  000042 
  4 IWDGREF    0032F0 R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0032E8 R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        0032E0 R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  00346D R   |   4 LIST       0032D7 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       0032CE R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     0032C3 R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NAME_MAX=  00000F     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        0032BB R   |     NEW_IDX =  000052     |   4 NEXT       0032B2 R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        0032AA R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |   4 NOT_SAVE   001F38 R   |   4 NO_APP     00289F R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        0032A2 R   |     ODR_IDX =  000054 
  4 ON         00329B R   |     ONOFF   =  000003     |     ON_IDX  =  0000B2 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         003294 R
    OR_IDX  =  0000FC     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        00328C R
    PAD_IDX =  000056     |     PAD_SIZE=  000080     |   4 PAUSE      003282 R
    PAUSE_ID=  000058     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       003279 R
    PEEK_IDX=  00005C     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   4 PICK       003270 R
    PINNO   =  000001     |   4 PINP       003267 R   |     PINP_IDX=  00005E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      00325D R   |     PMODE_ID=  00005A 
  4 POKE       003254 R   |     POKE_IDX=  000060     |   4 POP        00324C R
  4 PORTA      00322F R   |   4 PORTB      003225 R   |   4 PORTC      00321B R
  4 PORTD      003211 R   |   4 PORTE      003207 R   |   4 PORTF      0031FD R
  4 PORTG      0031F3 R   |   4 PORTI      0031E9 R   |   4 POUT       003243 R
    POUT_IDX=  000062     |     PREV    =  000001     |   4 PRINT      003239 R
    PROD    =  000001     |     PROD_SIG=  000004     |   4 PROG_ADD   001E35 R
  4 PROG_SIZ   001E47 R   |     PRTA_IDX=  000066     |     PRTB_IDX=  000068 
    PRTC_IDX=  00006A     |     PRTD_IDX=  00006C     |     PRTE_IDX=  00006E 
    PRTF_IDX=  000070     |     PRTG_IDX=  000072     |     PRTI_IDX=  000074 
    PRT_IDX =  000064     |     PSIZE   =  00000B     |     PSTR    =  000003 
  4 PUSH       0031E0 R   |   4 PUT        0031D8 R   |   4 QKEY       0031CF R
    QKEY_IDX=  000076     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001E70 R   |     RAM_SIZE=  001800 
    RBT_IDX =  00007A     |   4 READ       0031C6 R   |     READ_IDX=  000078 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

  4 REBOOT     0031BB R   |     RECLEN  =  000005     |     REC_LEN =  000003 
    REC_XTRA=  000005     |   4 REG_A      0004CA R   |   4 REG_CC     0004CE R
  4 REG_PC     0004BE R   |   4 REG_SP     0004D3 R   |   4 REG_X      0004C6 R
  4 REG_Y      0004C2 R   |     RELOP   =  000001     |   4 REM        0031B3 R
    REM_IDX =  00007C     |   4 RESTORE    0031A7 R   |     REST_IDX=  00007E 
    RETL1   =  000001     |   4 RETURN     00319C R   |     RET_ADDR=  000001 
    RET_BPTR=  000003     |     RET_IDX =  000080     |     RET_INW =  000005 
  4 RND        003194 R   |     RND_IDX =  000082     |     RONLY   =  000005 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     003189 R
    RSHIFT_I=  000084     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        003181 R   |     RUN_IDX =  000086     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000001     |     R_CC    =  000009 
    R_PC    =  00000A     |     R_X     =  000002     |     R_Y     =  000004 
  4 SAVE       003178 R   |     SAVE_IDX=  000032     |     SAV_ACC1=  000006 
    SAV_ACC2=  000008     |     SAV_COUN=  00000A     |     SAV_IN  =  000009 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   00286E R   |     SIGN_ADD=  000001     |   4 SIZE       00316F R
    SIZE_IDX=  0000B0     |     SKIP    =  000005     |   4 SLEEP      003165 R
    SLEEP_ID=  00008A     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      00315B R   |     SPIEN_ID=  00008E 
  4 SPIRD      003151 R   |     SPIRD_ID=  00008C     |   4 SPISEL     003146 R
    SPISEL_I=  000090     |   4 SPIWR      00313C R   |     SPIWR_ID=  000092 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     000481 R
  4 STEP       003133 R   |     STEP_IDX=  000094     |   4 STOP       00312A R
    STOP_IDX=  000096     |     STR     =  000003     |   4 STR_BYTE   001E58 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |   4 SysCall    000012 R
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      003120 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM3_CCR=  00532F     |     TIM3_CCR=  005330     |     TIM3_CNT=  005328 
    TIM3_CNT=  005329     |     TIM3_CR1=  005320     |     TIM3_CR1=  000007 
    TIM3_CR1=  000000     |     TIM3_CR1=  000003     |     TIM3_CR1=  000001 
    TIM3_CR1=  000002     |     TIM3_EGR=  005324     |     TIM3_IER=  005321 
    TIM3_PSC=  00532A     |     TIM3_SR1=  005322     |     TIM3_SR2=  005323 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    003114 R
  4 TIMER      00310A R   |     TIMER_ID=  00009A     |     TIM_CR1_=  000007 
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
  4 TO         003103 R   |   4 TONE       0030FA R   |     TONE_IDX=  0000A0 
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
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   4 UBOUND     0030EF R   |     UBOUND_I=  0000A2 
  4 UBTN_Han   00005A R   |   4 UFLASH     0030E4 R   |     UFLASH_I=  0000A4 
  4 UNTIL      0030DA R   |     UNTIL_ID=  0000A6     |     US      =  00001F 
  4 USER_ABO   000062 R   |   4 USR        0030D2 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000A8 
  4 Uart1RxH   00086B R   |   4 UserButt   000036 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VAR_NAME=  000001     |     VSIZE   =  000008 
    VT      =  00000B     |   4 WAIT       0030C9 R   |     WAIT_IDX=  0000AA 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |     WLKPTR  =  000003 
  4 WORDS      0030BF R   |     WORDS_ID=  0000AC     |   4 WRITE      0030B5 R
    WRITE_ID=  0000AE     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        0030AD R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  000014 
    XTEMP   =  000001     |     YSAVE   =  000004     |   4 abs        002AE8 R
  4 abs24      0001E3 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000B99 R
  4 add24      00016E R   |   4 add_char   001304 R   |   4 add_spac   0010FC R
  4 analog_r   0025D6 R   |   4 and_cond   001B6F R   |   4 and_fact   001B3F R
  4 app        003684 R   |   4 app_sign   003680 R   |   4 app_size   003682 R
  4 app_spac   003680 GR  |   4 arduino_   002BD5 R   |   4 arg_list   001964 R
  5 array_si   000020 R   |   4 ascii      00298F R   |   4 at_tst     000F6E R
  4 atoi24     001886 GR  |   4 atoi_exi   0018F5 R   |   4 awu        002A8F R
  4 awu02      002AA2 R   |   4 bad_port   002A0A R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       00254D R   |   4 beep_1kh   002520 GR
  4 bin_exit   000DD5 R   |   4 bit_rese   002120 R   |   4 bit_set    0020FE R
  4 bit_test   002165 R   |   4 bit_togg   002143 R   |   4 bitmask    002D8C R
  4 bkslsh_t   000F1B R   |   4 bksp       000944 R   |   2 block_bu   0016E0 GR
  4 block_er   000755 R   |   4 break_po   0026C2 R   |   4 bye        002A5B R
  4 clear_ba   001470 R   |   4 clear_bl   0027C4 R   |   4 clear_va   0013C8 R
  4 clock_in   00007D R   |   4 cmd_cons   001D44 R   |   4 cmd_dim    001D58 R
  4 cmd_dim1   001D62 R   |   4 cmd_dim2   001D68 R   |   4 cmd_dir    0028B5 R
  4 cmd_end    0024EC R   |   4 cmd_get    0024F3 R   |   4 cmd_itf    0004EE R
  4 cmd_line   0016C7 R   |   4 cmd_name   001324 R   |   4 cmd_on     00239A R
  4 cmd_size   001C48 R   |   4 cold_sta   0000B5 R   |   4 colon_ts   000F42 R
  4 comma_ts   000F4D R   |   4 comp_msg   001617 R   |   4 compile    001068 GR
  4 conditio   001BC1 R   |   4 const_cr   002E2F R   |   4 const_cr   002E34 R
  4 const_dd   002E2A R   |   4 const_ee   002E43 R   |   4 const_id   002E25 R
  4 const_in   002E3E R   |   4 const_od   002E20 R   |   4 const_ou   002E39 R
  4 const_po   002DF8 R   |   4 const_po   002DFD R   |   4 const_po   002E02 R
  4 const_po   002E07 R   |   4 const_po   002E0C R   |   4 const_po   002E11 R
  4 const_po   002E16 R   |   4 const_po   002E1B R   |   4 convert_   000D45 R
  4 convert_   000908 R   |   4 copy_com   000FA3 R   |   5 count      000003 GR
  4 cp24       0001A8 R   |   4 cp24_ax    0001DA R   |   4 cp_loop    001915 R
  4 cpl24      0001EA R   |   4 cpy_cmd_   0010E4 R   |   4 cpy_quot   001124 R
  4 create_g   000C6F R   |   4 cs_high    002FC5 R   |   4 dash_tst   000F63 R
  4 data       002E48 R   |   4 data_err   002EC1 R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001C3A R
  4 decomp_l   0011BC R   |   4 decompil   001174 GR  |   4 del_line   000C42 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 delete_l   000A31 R   |   4 delete_n   000954 R   |   4 delete_u   0009F6 R
  4 digital_   002612 R   |   4 digital_   002649 R   |   4 div24      0002F7 R
  4 divu24_8   0002D9 R   |   4 do_loop    002DB2 R   |   4 do_progr   000748 R
  4 dup24      00015F R   |   5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR
  4 edit       001F08 R   |   4 enable_i   002D1C R   |   4 eql_tst    000FEE R
  4 equal      001317 R   |   4 eras0      0026F4 R   |   4 erase      0026EA R
  4 erase_ex   000779 R   |   4 erase_fl   00076F R   |   4 err_bad_   00155C R
  4 err_buf_   0015D2 R   |   4 err_cmd_   001520 R   |   4 err_div0   0014E5 R
  4 err_dupl   00153A R   |   4 err_math   0014CC R   |   4 err_mem_   0014B1 R
  4 err_msg    00148D R   |   4 err_no_a   001568 R   |   4 err_no_d   00159B R
  4 err_no_f   0015BF R   |   4 err_no_l   0014F4 R   |   4 err_no_p   0015AB R
  4 err_not_   00154B R   |   4 err_over   0015DF R   |   4 err_read   0015E9 R
  4 err_run_   00150A R   |   4 err_synt   0014BE R   |   4 escaped    000D5A GR
  4 expect     001952 R   |   4 expressi   001AA8 R   |   4 factor     0019B0 R
  5 farptr     000018 R   |   4 fcpu       002B57 R   |   4 fetchc     0005F5 R
  4 fill_wri   0027B4 R   |   4 final_te   000B92 R   |   4 first_li   001EB2 R
  5 flags      000022 GR  |   4 for        0021FB R   |   4 free       001C3F R
  5 free_eep   000024 R   |   7 free_ram   000090 R   |   4 func_arg   00195F R
  4 func_cha   002978 R   |   4 func_eef   001CD4 R   |   4 ge         001319 R
  4 get_addr   0017C4 R   |   4 get_arra   001980 R   |   4 get_char   0017DE R
  4 get_esca   000914 R   |   4 get_int2   0017CE R   |   4 get_targ   002328 R
  4 get_targ   002336 R   |   4 get_tick   002AE1 R   |   4 get_toke   000EB4 GR
  4 get_valu   001CC3 R   |   4 getc       0008ED GR  |   4 gosub      002446 R
  4 gosub_1    002451 R   |   4 gosub_2    002457 R   |   4 goto       00242C R
  4 goto_1     002436 R   |   4 gpio       0029DF R   |   4 gt         001315 R
  4 gt_tst     000FF9 R   |   4 hex_base   001C35 R   |   4 hex_dump   000635 R
  4 if         0021DE R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   00084F R   |   4 input_ex   0020B6 R
  4 input_lo   002020 R   |   4 input_va   00201C R   |   4 insert_c   0009B3 R
  4 insert_l   000C9B R   |   4 insert_l   000D0A R   |   4 interp_l   001708 R
  4 interpre   0016E3 R   |   4 invalid    00055D R   |   4 invalid_   0005CB R
  4 is_alnum   000E08 GR  |   4 is_alpha   000DEE GR  |   4 is_data_   002E4E R
  4 is_digit   000DFF GR  |   4 is_symbo   000E11 R   |   4 itoa       001821 GR
  4 itoa_loo   001843 R   |   4 jp_to_ta   002439 R   |   4 key        0029CE R
  4 kword_di   00346B GR  |   4 kword_en   0030AB R   |   4 le         00131E R
  4 ledoff     0003BD R   |   4 ledon      0003B8 R   |   4 ledtoggl   0003C2 R
  4 left_par   0003CB R   |   4 let        001C80 GR  |   4 let_arra   001C8E R
  4 let_dvar   001741 R   |   4 let_eval   001C96 R   |   4 let_var    001C93 R
  4 lines_sk   001EB5 R   |   4 list       001E7F R   |   4 list_exi   001EF7 R
  4 list_loo   001ED5 R   |   4 log2       002D5F R   |   4 look_tar   002359 R
  4 loop_bac   00230B R   |   5 loop_dep   00001F R   |   4 loop_don   002320 R
  4 lshift     002AFF R   |   4 lt         00131C R   |   4 lt_tst     001022 R
  4 mem_peek   000579 R   |   4 mod24      000391 R   |   4 move       001384 GR
  4 move_dow   0013A3 R   |   4 move_era   0006D7 R   |   4 move_exi   0013C4 R
  4 move_lef   00098B R   |   4 move_loo   0013A8 R   |   4 move_prg   000717 R
  4 move_rig   000999 R   |   4 move_up    001395 R   |   4 mul24      000269 R
  4 mul_char   001306 R   |   4 mulu24_8   00022A R   |   4 nbr_tst    000EE7 R
  4 ne         001321 R   |   4 neg24      0001F3 R   |   4 neg_acc2   00020D R
  4 neg_ax     000205 R   |   4 new        0026E0 R   |   4 next       0022B3 R
  4 next_lin   0016EB R   |   4 next_tok   00179C GR  |   4 no_match   001927 R
  4 number     0005FB R   |   4 other      00104B R   |   4 overwrit   000BBE R
  2 pad        0016E0 GR  |   4 pad_ref    002FCA R   |   4 parse_ad   0004D8 R
  4 parse_bi   000DB3 R   |   4 parse_in   000D62 R   |   4 parse_ke   000E34 R
  4 parse_qu   000D0D R   |   4 parse_sy   000E1C R   |   4 pause      002A6F R
  4 pause02    002A82 R   |   4 peek       0021BD R   |   4 peek_byt   000595 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

  4 pin_mode   002B66 R   |   4 plus_tst   000FC2 R   |   4 poke       00219C R
  4 power_ad   002586 R   |   4 prcnt_ts   000FE3 R   |   4 print      001F73 R
  4 print_fa   0005DA R   |   4 print_he   000BF5 GR  |   4 print_re   000417 R
  4 print_st   00056D R   |   4 print_to   001809 R   |   4 prog_siz   001DEE R
  4 program_   001DF6 R   |   4 program_   0006F1 R   |   4 program_   000717 R
  4 prt_acc2   0017FB R   |   4 prt_basi   001F4F R   |   4 prt_i16    0017E4 R
  4 prt_loop   001F77 R   |   4 prt_peek   00039A GR  |   4 prt_reg1   0003F8 R
  4 prt_reg8   0003D6 R   |   5 ptr16      000019 GR  |   5 ptr8       00001A R
  4 putc       0008DD GR  |   4 puts       00093A GR  |   4 qgetc      0008E6 GR
  4 qkey       0029D2 GR  |   4 qmark_ts   000F79 R   |   4 qsign      0027B0 R
  4 random     002BF5 R   |   4 read       002EC6 R   |   4 read01     002ECB R
  4 read_int   0035E2 R   |   4 readln     000A3F GR  |   4 readln_l   000A4E R
  4 readln_q   000BDB R   |   4 refresh_   002D5A R   |   4 relation   001AE0 R
  4 relop_st   001309 R   |   4 remark     0020BB GR  |   4 repl       000517 R
  4 repl_exi   00053F R   |   4 reset_co   001F75 R   |   4 rest_con   00200C R
  4 restore    002E5C R   |   4 return     00246A R   |   4 right_al   001112 GR
  4 row_alig   000834 R   |   4 row_eras   0006AA R   |   4 row_eras   0006D7 R
  4 row_loop   000618 R   |   4 rparnt_t   000F37 R   |   4 rshift     002B2B R
  7 rsign      00008C R   |   7 rsize      00008E R   |   4 rt_msg     001605 R
  4 run        002487 R   |   4 run_app    00012A R   |   4 run_it     0024B9 R
  4 run_it_0   0024BB R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027D8 R   |   4 save_con   001FFC R
  4 scan_blo   00085D R   |   4 search_d   001907 GR  |   4 search_e   00194F R
  4 search_l   000C17 GR  |   4 search_l   000C26 R   |   4 search_n   001CFD R
  4 search_n   00190B R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002BC5 R   |   4 send_esc   000962 R   |   4 send_par   00096D R
  4 set_data   002E92 R   |   4 set_time   002CFA R   |   4 sharp_ts   000F58 R
  4 show_row   000606 R   |   4 single_c   0012FF R   |   4 skip       000EA1 R
  4 skip_str   0017B5 R   |   4 slash_ts   000FD8 R   |   4 sleep      002A64 R
  4 software   0013D7 R   |   4 spaces     0009A7 GR  |   4 spi_clea   002F5F R
  4 spi_disa   002F47 R   |   4 spi_enab   002F14 R   |   4 spi_rcv_   002F81 R
  4 spi_read   002FAC R   |   4 spi_sele   002FB3 R   |   4 spi_send   002F6B R
  4 spi_writ   002F8C R   |   2 stack_fu   00179C GR  |   2 stack_un   001828 R
  4 star_tst   000FCD R   |   4 step       002271 R   |   4 stop       002694 R
  4 store_lo   0022A0 R   |   4 str_matc   001934 R   |   4 str_tst    000ED7 R
  4 strcmp     001363 R   |   4 strcpy     001374 GR  |   4 strlen     001358 GR
  4 sub24      00018B R   |   4 symb_loo   000E1D R   |   4 syntax_e   001638 GR
  4 system_i   00141D R   |   5 tab_widt   000023 GR  |   4 tb_error   00163A GR
  4 term       001A65 R   |   4 term01     001A6D R   |   4 term_exi   001AA5 R
  4 test       003473 R   |   4 test_p     000565 R   |   2 tib        001690 GR
  4 tick_tst   000F91 R   |   5 ticks      00000F R   |   4 timeout    002D11 R
  5 timer      000012 GR  |   4 timer2_i   000093 R   |   4 timer4_i   0000A0 R
  4 tk_id      001628 R   |   4 to         00222B R   |   4 to_eepro   000740 R
  4 to_flash   000745 R   |   4 to_hex_c   000C0C GR  |   4 to_upper   00187A GR
  4 token_ch   001061 R   |   4 token_ex   001065 R   |   4 tone       00252B R
  4 try_next   002E9F R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   0008ED GR  |   4 uart1_in   000898 R   |   4 uart1_pu   0008DD GR
  4 uart1_qg   0008E6 GR  |   4 uart1_se   0008A8 R   |   4 ubound     001C75 R
  4 uflash     002A0F R   |   4 unlock_e   000674 R   |   4 unlock_f   00068F R
  4 until      002DC5 R   |   4 user_int   000049 R   |   4 usr        002A35 R
  4 var_name   00116A GR  |   5 vars       000034 GR  |   4 wait       0020C1 R
  4 warm_ini   00144E R   |   4 warm_sta   0016C4 R   |   4 words      002C90 R
  4 words_co   002CE4 R   |   4 write      00290F R   |   4 write_bl   0007F9 GR
  4 write_bu   000731 R   |   4 write_by   00077B R   |   4 write_ee   0007B7 R
  4 write_ex   0007F0 R   |   4 write_fl   0007A1 R   |   4 write_nb   00081E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

  4 xalloc     002FDD R   |   4 xdrop      003013 R   |   4 xpick      003091 R
  4 xpop       002FD3 R   |   4 xpush      002FCF R   |   4 xput       00305E R
  4 xstack_b   003040 R   |   2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3684   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

