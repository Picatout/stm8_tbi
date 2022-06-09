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
      008190 CD 9D C2         [ 4]  270 	call func_eefree 
      008193 CD 9D 63         [ 4]  271 	call ubound 
      008196 CD 95 31         [ 4]  272 	call clear_basic
      008199 CD A6 A8         [ 4]  273 	call beep_1khz  
      00819C CD 94 DE         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for autorun application
      00819F CE 40 00         [ 2]  277 	ldw x,EEPROM_BASE 
      0081A2 C3 B2 C1         [ 2]  278 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 B1         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
      0081AA 4F               [ 1]  282 	clr a 
      0081AB CE 40 02         [ 2]  283 	ldw x,EEPROM_BASE+2
      0081AE CD A5 AE         [ 4]  284 	call is_program_addr 
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
      0081D4 CD 9E E4         [ 4]  299 	call program_info 
      0081D7 CC A6 1E         [ 2]  300 	jp run_it_02  
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
      0087CB A3 B9 80         [ 2]  384 	ldw farptr+1,x  	
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
      0087EF B9 80            [ 1]   75 	jrne 3$
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
      00881F B9 80 24 0E      [ 1]  112 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
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
      008936 CD A9 AD         [ 4]  440     call puts 
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
      008C26 A6 A8            [ 1]  234 	ld a,(CURR,sp)
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
      008F0E A3 21 62         [ 2]  784 	cpw x,#remark 
      008F0E AE B7            [ 1]  785 	jrne token_exit 
      008F10 5D               [ 1]  786 	ldw x,y 
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
      008F52 6E 27            [ 1]  842 	jrne 2$ 
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
      009047 A0 9A            [ 1]  231 1$:	jrmi 2$
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



      00905F E2 FF 1C         [ 4]  247 	call get_int24 
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
      00908C 91 22 62         [ 2]  270 	cpw x,#remark 
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
      00911A A1 E2            [ 1]  365 	jrugt 11$
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
      0092DB E2 26 23 CE 00 05 CD   322 err_no_line: .asciz "invalid line number.\n"
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
             93 AA A3 9D 6E
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
      0093ED AE B7 5B         [ 1]  453 	ld count,a 
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
      009418 81 1C FC         [ 4]  472 	call let_array 
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
      000020 CD 1C 2F         [ 4]  507 	call condition  
      000021 A1 84            [ 1]  508 	cp a,#TK_INTGR 
      000023 27 03            [ 1]  509 	jreq 1$ 
      000024 CC 16 A5         [ 2]  510 0$:	jp syntax_error 
      000025                        511 1$: 
      000027 1E 01            [ 2]  512 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      00002F CD 13 99         [ 4]  513 	call strlen 
      000030 AB 05            [ 1]  514 	add a,#REC_XTRA_BYTES
      000031 6B 04            [ 1]  515 	ld (REC_LEN+1,sp),a 
      000033 CD 1D 6B         [ 4]  516 	call search_name 
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
                                    898 ;---------------------
                                    899 ; check if next token
                                    900 ;  is of expected type 
                                    901 ; input:
                                    902 ;   A 		 expected token attribute
                                    903 ;  ouput:
                                    904 ;   none     if fail call syntax_error 
                                    905 ;--------------------
      0019C2                        906 expect:
      0095C7 76               [ 1]  907 	push a 
      0095C8 61 6C 69         [ 4]  908 	call next_token 
      0095CB 64 20            [ 1]  909 	cp a,(1,sp)
      0095CD 6C 69            [ 1]  910 	jreq 1$
      0095CF 6E 65 20         [ 2]  911 	jp syntax_error
      0095D2 6E               [ 1]  912 1$: pop a 
      0095D3 75               [ 4]  913 	ret 
                                    914 
                                    915 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    916 ; parse arguments list 
                                    917 ; between ()
                                    918 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019CF                        919 func_args:
      0095D4 6D 62            [ 1]  920 	ld a,#TK_LPAREN 
      0095D6 65 72 2E         [ 4]  921 	call expect 
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
      0019D4                        937 arg_list:
      0095D9 0A 00            [ 1]  938 	push #0
      0095DB 72 75 6E         [ 4]  939 1$:	call condition 
      0095DE 20               [ 1]  940 	tnz a 
      0095DF 74 69            [ 1]  941 	jreq 7$  
      0095E1 6D 65            [ 1]  942 	inc (1,sp)
      0095E3 20 6F 6E         [ 4]  943 	call next_token 
      0095E6 6C 79            [ 1]  944 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0095E8 20 75            [ 1]  945 	jreq 1$ 
      0095EA 73 61            [ 1]  946 	cp a,#TK_RPAREN
      0095EC 67 65            [ 1]  947 	jreq 7$
      0019E9                        948 	_unget_token 
      0095EE 2E 0A 00 63 6F   [ 1]    1      mov in,in.saved  
      0095F3 6D               [ 1]  949 7$:	pop a  
      0095F4 6D               [ 4]  950 	ret 
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
      0019F0                        978 get_array_element:
      0095F5 61 6E 64         [ 4]  979 	call func_args 
      0095F8 20 6C            [ 1]  980 	cp a,#1
      0095FA 69 6E            [ 1]  981 	jreq 1$
      0095FC 65 20 6F         [ 2]  982 	jp syntax_error
      0019FA                        983 1$: _xpop 
      0095FF 6E 6C            [ 1]    1     ld a,(y)
      009601 79               [ 1]    2     ldw x,y 
      009602 20 75            [ 2]    3     ldw x,(1,x)
      009604 73 61 67 65      [ 2]    4     addw y,#CELL_SIZE 
                                    984     ; ignore A, index < 65536 in any case 
                                    985 	; check for bounds 
      009608 2E 0A 00         [ 2]  986 	cpw x,array_size 
      00960B 64 75            [ 2]  987 	jrule 3$
                                    988 ; bounds {1..array_size}	
      00960D 70 6C            [ 1]  989 2$: ld a,#ERR_BAD_VALUE 
      00960F 69 63 61         [ 2]  990 	jp tb_error 
      009612 74               [ 2]  991 3$: tnzw  x
      009613 65 20            [ 1]  992 	jreq 2$ 
      009615 6E 61            [ 1]  993 	ld a,#CELL_SIZE  
      009617 6D               [ 4]  994 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009618 65 2E 0A         [ 2]  995 	ldw acc16,x   
      00961B 00 46 69         [ 2]  996 	ldw x,#tib ; array is below tib 
      00961E 6C 65 20 6E      [ 2]  997 	subw x,acc16 
      009622 6F               [ 4]  998 	ret 
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
      001A1E                       1014 factor:
      001A1E                       1015 	_vars VSIZE 
      009623 74 20            [ 2]    1     sub sp,#VSIZE 
      009625 66 6F            [ 1] 1016 	clr (NEG,sp)
      009627 75 6E 64         [ 4] 1017 	call next_token
      00962A 2E               [ 1] 1018 	tnz a 
      00962B 0A 00            [ 1] 1019 	jrne 1$ 
      00962D 62 61 64         [ 2] 1020 	jp 22$ 
      009630 20 76            [ 1] 1021 1$:	cp a,#TK_PLUS 
      009632 61 6C            [ 1] 1022 	jreq 2$
      009634 75 65            [ 1] 1023 	cp a,#TK_MINUS 
      009636 2E 0A            [ 1] 1024 	jrne 4$ 
      009638 00 46            [ 1] 1025 	cpl (NEG,sp)
      001A35                       1026 2$:	
      00963A 69 6C 65         [ 4] 1027 	call next_token
      001A38                       1028 4$:
      00963D 20               [ 1] 1029 	tnz a 
      00963E 69 6E            [ 1] 1030 	jrne 41$ 
      009640 20 65 78         [ 2] 1031 	jp syntax_error  
      001A3E                       1032 41$:	
      009643 74 65            [ 1] 1033 	cp a,#TK_IFUNC 
      009645 6E 64            [ 1] 1034 	jrne 5$ 
      001A42                       1035 	_get_code_addr 
      009647 65               [ 2]    1         ldw x,(x)
      009648 64 20 6D 65      [ 1]    2         inc in 
      00964C 6D 6F 72 79      [ 1]    3         inc in 
      009650 2C               [ 4] 1036 	call (x); result in A:X  
      009651 20 63            [ 2] 1037 	jra 18$ 
      001A4E                       1038 5$:
      009653 61 6E            [ 1] 1039 	cp a,#TK_INTGR
      009655 27 74            [ 1] 1040 	jrne 6$
      009657 20 62 65         [ 4] 1041 	call get_int24 ; A:X
      00965A 20 72            [ 2] 1042 	jra 18$
      001A57                       1043 6$:
      00965C 75 6E            [ 1] 1044 	cp a,#TK_ARRAY
      00965E 20 66            [ 1] 1045 	jrne 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009660 72 6F 6D         [ 4] 1046 	call get_array_element
      009663 20 74            [ 2] 1047     jra 71$
      001A60                       1048 7$:
      009665 68 65            [ 1] 1049 	cp a,#TK_VAR 
      009667 72 65            [ 1] 1050 	jrne 8$
      009669 2E 0A 00         [ 4] 1051 	call get_addr 
      001A67                       1052 71$: ; put value in A:X
      00966C 4E               [ 1] 1053 	ld a,(x)
      00966D 6F 20            [ 2] 1054 	ldw x,(1,x)
      00966F 64 61            [ 2] 1055 	jra 18$
      001A6C                       1056 8$:
      009671 74 61            [ 1] 1057 	cp a,#TK_LABEL 
      009673 20 66            [ 1] 1058 	jrne 9$
      009675 6F 75            [ 2] 1059 	pushw y  
      009677 6E               [ 2] 1060 	pushw x 
      009678 64 2E 0A         [ 4] 1061 	call skip_string
      00967B 00               [ 2] 1062 	popw x  
      00967C 4E 6F 20         [ 4] 1063 	call strlen 
      00967F 70 72            [ 1] 1064 	add a,#REC_XTRA_BYTES
      009681 6F 67 72         [ 4] 1065 	call search_name
      009684 61               [ 2] 1066 	tnzw x 
      009685 6D 20            [ 1] 1067 	jrne 82$ 
      009687 69 6E            [ 2] 1068 	popw y 
      009689 20 52            [ 2] 1069 	jra 16$
      001A86                       1070 82$:
      00968B 41 4D            [ 2] 1071 	popw y   
      00968D 21 0A 00         [ 4] 1072 	call get_value ; in A:X 
      009690 46 69            [ 2] 1073 	jra 18$
      001A8D                       1074 9$: 
      009692 6C 65            [ 1] 1075 	cp a,#TK_CFUNC 
      009694 20 73            [ 1] 1076 	jrne 12$
      001A91                       1077 	_get_code_addr 
      009696 79               [ 2]    1         ldw x,(x)
      009697 73 74 65 6D      [ 1]    2         inc in 
      00969B 20 66 75 6C      [ 1]    3         inc in 
      00969F 6C               [ 4] 1078 	call(x)
      0096A0 2E               [ 1] 1079 	clrw x 
      0096A1 0A               [ 1] 1080 	rlwa x  ; char>int24 in A:X 
      0096A2 00 42            [ 2] 1081 	jra 18$ 	 
      001A9F                       1082 12$:			
      0096A4 75 66            [ 1] 1083 	cp a,#TK_LPAREN
      0096A6 66 65            [ 1] 1084 	jrne 16$
      0096A8 72 20 66         [ 4] 1085 	call expression
      0096AB 75 6C            [ 1] 1086 	ld a,#TK_RPAREN 
      0096AD 6C 0A 00         [ 4] 1087 	call expect
      001AAB                       1088 	_xpop 
      0096B0 6F 76            [ 1]    1     ld a,(y)
      0096B2 65               [ 1]    2     ldw x,y 
      0096B3 72 66            [ 2]    3     ldw x,(1,x)
      0096B5 6C 6F 77 0A      [ 2]    4     addw y,#CELL_SIZE 
      0096B9 00 63            [ 2] 1089 	jra 18$	
      001AB6                       1090 16$:
      001AB6                       1091 	_unget_token 
      0096BB 6F 6E 73 74 61   [ 1]    1      mov in,in.saved  
      0096C0 6E               [ 1] 1092 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      0096C1 74 20            [ 2] 1093 	jra 22$ 
      001ABE                       1094 18$: 
      0096C3 63 61            [ 1] 1095 	tnz (NEG,sp)
      0096C5 6E 27            [ 1] 1096 	jreq 20$
      0096C7 74 20 62         [ 4] 1097 	call neg_ax   
      001AC5                       1098 20$:
      001AC5                       1099 	_xpush 
      0096CA 65 20 6D 6F      [ 2]    1     subw y,#CELL_SIZE
      0096CE 64 69            [ 1]    2     ld (y),a 
      0096D0 66 69 65         [ 2]    3     ldw (1,y),x 
      0096D3 64 0A            [ 1] 1100 	ld a,#TK_INTGR
      001AD0                       1101 22$:
      001AD0                       1102 	_drop VSIZE
      0096D5 00 6E            [ 2]    1     addw sp,#VSIZE 
      0096D7 6F               [ 4] 1103 	ret
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
      001AD3                       1114 term:
      001AD3                       1115 	_vars VSIZE
      0096D8 20 70            [ 2]    1     sub sp,#VSIZE 
                                   1116 ; first factor 	
      0096DA 72 6F 67         [ 4] 1117 	call factor
      0096DD 72               [ 1] 1118 	tnz a 
      0096DE 61 6D            [ 1] 1119 	jreq term_exit  
      001ADB                       1120 term01:	 ; check for  operator '*'|'/'|'%' 
      0096E0 20 61 74         [ 4] 1121 	call next_token
      0096E3 20 74            [ 1] 1122 	ld (MULOP,sp),a
      0096E5 68 69            [ 1] 1123 	and a,#TK_GRP_MASK
      0096E7 73 20            [ 1] 1124 	cp a,#TK_GRP_MULT
      0096E9 61 64            [ 1] 1125 	jreq 1$
      0096EB 64 72            [ 1] 1126 	ld a,#TK_INTGR
      001AE8                       1127 	_unget_token 
      0096ED 65 73 73 0A 00   [ 1]    1      mov in,in.saved  
      0096F2 0A 72            [ 2] 1128 	jra term_exit 
      001AEF                       1129 1$:	; got *|/|%
                                   1130 ;second factor
      0096F4 75 6E 20         [ 4] 1131 	call factor
      0096F7 74               [ 1] 1132 	tnz a 
      0096F8 69 6D            [ 1] 1133 	jrne 2$ 
      0096FA 65 20 65         [ 2] 1134 	jp syntax_error 
      001AF8                       1135 2$: ; select operation 	
      0096FD 72 72            [ 1] 1136 	ld a,(MULOP,sp) 
      0096FF 6F 72            [ 1] 1137 	cp a,#TK_MULT 
      009701 2C 20            [ 1] 1138 	jrne 3$
                                   1139 ; '*' operator
      009703 00 0A 63         [ 4] 1140 	call mul24 
      009706 6F 6D            [ 2] 1141 	jra term01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      009708 70 69            [ 1] 1142 3$: cp a,#TK_DIV 
      00970A 6C 65            [ 1] 1143 	jrne 4$ 
                                   1144 ; '/' operator	
      00970C 20 65 72         [ 4] 1145 	call div24 
      00970F 72 6F            [ 2] 1146 	jra term01 
      001B0C                       1147 4$: ; '%' operator
      009711 72 2C 20         [ 4] 1148 	call mod24
      009714 00 6C            [ 2] 1149 	jra term01 
      001B11                       1150 9$: 
      009716 61 73            [ 1] 1151 	ld a,#TK_INTGR
      001B13                       1152 term_exit:
      001B13                       1153 	_drop VSIZE 
      009718 74 20            [ 2]    1     addw sp,#VSIZE 
      00971A 74               [ 4] 1154 	ret 
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
      001B16                       1165 expression:
      001B16                       1166 	_vars VSIZE 
      00971B 6F 6B            [ 2]    1     sub sp,#VSIZE 
                                   1167 ; first term 	
      00971D 65 6E 20         [ 4] 1168 	call term
      009720 69               [ 1] 1169 	tnz a 
      009721 64 3A            [ 1] 1170 	jreq 9$
      001B1E                       1171 1$:	; operator '+'|'-'
      009723 20 00 0C         [ 4] 1172 	call next_token
      009725 6B 01            [ 1] 1173 	ld (OP,sp),a 
      009725 A6 02            [ 1] 1174 	and a,#TK_GRP_MASK
      009727 A1 10            [ 1] 1175 	cp a,#TK_GRP_ADD 
      009727 72 0A            [ 1] 1176 	jreq 2$ 
      001B29                       1177 	_unget_token 
      009729 00 23 4C 88 AE   [ 1]    1      mov in,in.saved  
      00972E 96 F2            [ 1] 1178 	ld a,#TK_INTGR
      009730 CD 89            [ 2] 1179 	jra 9$ 
      001B32                       1180 2$: ; second term 
      009732 DC 84 AE         [ 4] 1181 	call term
      009735 95               [ 1] 1182 	tnz a 
      009736 52 72            [ 1] 1183 	jrne 3$
      009738 5F 00 0E         [ 2] 1184 	jp syntax_error
      001B3B                       1185 3$:
      00973B 48 72            [ 1] 1186 	ld a,(OP,sp)
      00973D 59 00            [ 1] 1187 	cp a,#TK_PLUS 
      00973F 0E C7            [ 1] 1188 	jrne 4$
                                   1189 ; '+' operator	
      009741 00 0F 72         [ 4] 1190 	call add24
      009744 BB 00            [ 2] 1191 	jra 1$ 
      001B46                       1192 4$:	; '-' operator 
      009746 0E FE CD         [ 4] 1193 	call sub24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009749 89 DC            [ 2] 1194 	jra 1$
      001B4B                       1195 9$:
      001B4B                       1196 	_drop VSIZE 
      00974B CE 00            [ 2]    1     addw sp,#VSIZE 
      00974D 05               [ 4] 1197 	ret 
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
      001B4E                       1208 relation: 
      001B4E                       1209 	_vars VSIZE
      00974E C6 00            [ 2]    1     sub sp,#VSIZE 
      009750 03 90 5F         [ 4] 1210 	call expression
      009753 90               [ 1] 1211 	tnz a 
      009754 02 CD            [ 1] 1212 	jreq 9$ 
                                   1213 ; expect rel_op or leave 
      009756 86 C5 CE         [ 4] 1214 	call next_token 
      009759 00 05            [ 1] 1215 	ld (RELOP,sp),a 
      00975B C6 00            [ 1] 1216 	and a,#TK_GRP_MASK
      00975D 02 CD            [ 1] 1217 	cp a,#TK_GRP_RELOP 
      00975F A0 76            [ 1] 1218 	jreq 2$
      009761 AE 97            [ 1] 1219 	ld a,#TK_INTGR 
      001B63                       1220 	_unget_token 
      009763 15 CD 89 DC C6   [ 1]    1      mov in,in.saved  
      009768 00 04            [ 2] 1221 	jra 9$ 
      001B6A                       1222 2$:	; expect another expression
      00976A 5F 97 72         [ 4] 1223 	call expression
      00976D BB               [ 1] 1224 	tnz a 
      00976E 00 05            [ 1] 1225 	jrne 3$
      009770 F6 5F 97         [ 2] 1226 	jp syntax_error 
      001B73                       1227 3$: 
      009773 CD 98 D4         [ 4] 1228 	call cp24 
      001B76                       1229 	_xpop  
      009776 20 35            [ 1]    1     ld a,(y)
      009778 93               [ 1]    2     ldw x,y 
      009778 88 AE            [ 2]    3     ldw x,(1,x)
      00977A 97 04 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00977E DC               [ 1] 1230 	tnz a 
      00977F 84 AE            [ 1] 1231 	jrmi 4$
      009781 95 52            [ 1] 1232 	jrne 5$
      009783 72 5F 00 0E      [ 1] 1233 	mov acc8,#2 ; i1==i2
      009787 48 72            [ 2] 1234 	jra 6$ 
      001B8A                       1235 4$: ; i1<i2
      009789 59 00 0E C7      [ 1] 1236 	mov acc8,#4 
      00978D 00 0F            [ 2] 1237 	jra 6$
      001B90                       1238 5$: ; i1>i2
      00978F 72 BB 00 0E      [ 1] 1239 	mov acc8,#1  
      001B94                       1240 6$: ; 0=false, -1=true 
      009793 FE               [ 1] 1241 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009794 CD 89 DC         [ 1] 1242 	ld a, acc8  
      009797 AE 16            [ 1] 1243 	and a,(RELOP,sp)
      009799 68 CD            [ 1] 1244 	jreq 7$
      00979B 89               [ 2] 1245 	cplw x 
      00979C DC A6            [ 1] 1246 	ld a,#255 
      001B9F                       1247 7$:	_xpush 
      00979E 0D CD 89 7F      [ 2]    1     subw y,#CELL_SIZE
      0097A2 CE 00            [ 1]    2     ld (y),a 
      0097A4 01 CD 8A         [ 2]    3     ldw (1,y),x 
      0097A7 49 A6            [ 1] 1248 	ld a,#TK_INTGR
      001BAA                       1249 9$: 
      001BAA                       1250 	_drop VSIZE
      0097A9 5E CD            [ 2]    1     addw sp,#VSIZE 
      0097AB 89               [ 4] 1251 	ret 
                                   1252 
                                   1253 ;-------------------------------------------
                                   1254 ;  AND factor:  [NOT] relation | (condition)
                                   1255 ;  output:
                                   1256 ;     A      TK_INTGR|0
                                   1257 ;-------------------------------------------
                           000001  1258 	NOT_OP=1
      001BAD                       1259 and_factor:
      0097AC 7F AE            [ 1] 1260 	push #0 
      0097AE 17 FF 94         [ 4] 1261 0$:	call next_token  
      0097B1 4D               [ 1] 1262 	tnz a 
      0097B1 CD 95            [ 1] 1263 	jreq 8$ 
      0097B3 0F 87            [ 1] 1264 	cp a,#TK_NOT 
      0097B4 26 04            [ 1] 1265 	jrne 1$ 
      0097B4 A6 0D            [ 1] 1266 	cpl (NOT_OP,sp)
      0097B6 CD 89            [ 2] 1267 	jra 0$ 
      001BBD                       1268 1$:	
      0097B8 7F A6            [ 1] 1269 	cp a,#TK_LPAREN 
      0097BA 3E CD            [ 1] 1270 	jrne 2$
      0097BC 89 7F CD         [ 4] 1271 	call condition
      0097BF 8A E1            [ 1] 1272 	ld a,#TK_RPAREN 
      0097C1 72 5D 00         [ 4] 1273 	call expect
      0097C4 03 27            [ 2] 1274 	jra 3$
      001BCB                       1275 2$: _unget_token 
      0097C6 ED CD 91 29 72   [ 1]    1      mov in,in.saved  
      0097CB 5D 00 03         [ 4] 1276 	call relation
      001BD3                       1277 3$:
      0097CE 27 E4            [ 1] 1278 	tnz (NOT_OP,sp)
      0097D0 27 03            [ 1] 1279 	jreq 8$ 
      0097D0 C6 00 02         [ 4] 1280 	call cpl24
      001BDA                       1281 8$:
      001BDA                       1282 	_drop 1  
      0097D3 C1 00            [ 2]    1     addw sp,#1 
      0097D5 03               [ 4] 1283     ret 
                                   1284 
                                   1285 
                                   1286 ;--------------------------------------------
                                   1287 ;  AND operator as priority over OR||XOR 
                                   1288 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1289 ;          
                                   1290 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   1291 ;     A     TK_INTGR|0
                                   1292 ;    xtack   value 
                                   1293 ;--------------------------------------------
      001BDD                       1294 and_cond:
      0097D6 2B 20 AD         [ 4] 1295 	call and_factor
      0097D8 4D               [ 1] 1296 	tnz a 
      0097D8 72 01            [ 1] 1297 	jreq 9$  
      0097DA 00 23 D7         [ 4] 1298 1$: call next_token 
      0097DD CE               [ 1] 1299 	tnz a 
      0097DE 00 05            [ 1] 1300 	jreq 6$ 
      0097E0 72 BB            [ 1] 1301 	cp a,#TK_AND 
      0097E2 00 01            [ 1] 1302 	jreq 3$
      001BED                       1303 	_unget_token 
      0097E4 C3 00 1E 2B 03   [ 1]    1      mov in,in.saved  
      0097E9 CD A6            [ 2] 1304 	jra 6$ 
      0097EB 4F CF 00         [ 4] 1305 3$:	call and_factor  
      0097EE 05               [ 1] 1306 	tnz a 
      0097EF E6 02            [ 1] 1307 	jrne 4$
      0097F1 C7 00 03         [ 2] 1308 	jp syntax_error 
      001BFD                       1309 4$:	
      001BFD                       1310 	_xpop 
      0097F4 35 03            [ 1]    1     ld a,(y)
      0097F6 00               [ 1]    2     ldw x,y 
      0097F7 02 01            [ 2]    3     ldw x,(1,x)
      0097F8 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0097F8 CD 98 8C         [ 1] 1311 	ld acc24,a 
      0097FB A1 00 27         [ 2] 1312 	ldw acc16,x
      001C0C                       1313 	_xpop 
      0097FE D9 A1            [ 1]    1     ld a,(y)
      009800 80               [ 1]    2     ldw x,y 
      009801 26 0C            [ 2]    3     ldw x,(1,x)
      009803 FE 72 5C 00      [ 2]    4     addw y,#CELL_SIZE 
      009807 02 72 5C         [ 1] 1314 	and a,acc24 
      00980A 00               [ 1] 1315 	rlwa x 
      00980B 02 FD 20         [ 1] 1316 	and a,acc16 
      00980E E9               [ 1] 1317 	rlwa x 
      00980F C4 00 0E         [ 1] 1318 	and a,acc8 
      00980F A1               [ 1] 1319 	rlwa x
      001C21                       1320 	_xpush
      009810 85 26 05 CD      [ 2]    1     subw y,#CELL_SIZE
      009814 9D 81            [ 1]    2     ld (y),a 
      009816 20 E0 01         [ 2]    3     ldw (1,y),x 
      009818 20 B7            [ 2] 1321 	jra 1$  
      009818 A1 05            [ 1] 1322 6$: ld a,#TK_INTGR 
      00981A 26               [ 4] 1323 9$:	ret 	 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                           000001  1334 	ATMP=1
                           000002  1335 	OP=2
                           000002  1336 	VSIZE=2 
      001C2F                       1337 condition:
      001C2F                       1338 	_vars VSIZE 
      00981B 05 CD            [ 2]    1     sub sp,#VSIZE 
      00981D 9D 7C 20         [ 4] 1339 	call and_cond
      009820 D7               [ 1] 1340 	tnz a 
      009821 27 69            [ 1] 1341 	jreq 9$ 
      009821 A1 03 26         [ 4] 1342 1$:	call next_token 
      009824 05 CD            [ 1] 1343 	cp a,#TK_OR 
      009826 98 31            [ 1] 1344 	jreq 2$
      009828 20 CE            [ 1] 1345 	cp a,#TK_XOR
      00982A 27 07            [ 1] 1346 	jreq 2$ 
      001C42                       1347 	_unget_token 
      00982A A1 0A 27 CA CC   [ 1]    1      mov in,in.saved  
      00982F 97 25            [ 2] 1348 	jra 8$ 
      009831 6B 02            [ 1] 1349 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009831 52 04 1F         [ 4] 1350 	call and_cond
      009834 01 0F            [ 1] 1351 	cp a,#TK_INTGR 
      009836 03 CD            [ 1] 1352 	jreq 3$
      009838 98 A5 CE         [ 2] 1353 	jp syntax_error 
      001C55                       1354 3$:	 
      001C55                       1355 	_xpop  ; rigth arg 
      00983B 00 05            [ 1]    1     ld a,(y)
      00983D 72               [ 1]    2     ldw x,y 
      00983E BB 00            [ 2]    3     ldw x,(1,x)
      009840 01 F6 A1 32      [ 2]    4     addw y,#CELL_SIZE 
      009844 26 43 72         [ 1] 1356 	ld acc24,a 
      009847 5C 00 02         [ 2] 1357 	ldw acc16,x 
      001C64                       1358 	_xpop  ; left arg  
      00984A CD 9C            [ 1]    1     ld a,(y)
      00984C AF               [ 1]    2     ldw x,y 
      00984D A1 84            [ 2]    3     ldw x,(1,x)
      00984F 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      009853 25 01            [ 1] 1359 	ld (ATMP,sp),a 
      009854 7B 02            [ 1] 1360 	ld a,(OP,sp)
      009854 1E 01            [ 1] 1361 	cp a,#TK_XOR 
      009856 CD 94            [ 1] 1362 	jreq 5$ 
      001C75                       1363 4$: ; A:X OR acc24   
      009858 19 AB            [ 1] 1364 	ld a,(ATMP,sp)
      00985A 05 6B 04         [ 1] 1365 	or a,acc24 
      00985D CD               [ 1] 1366 	rlwa x 
      00985E 9D EB 5D         [ 1] 1367 	or a,acc16 
      009861 27               [ 1] 1368 	rlwa x 
      009862 EE F6 2A         [ 1] 1369 	or a,acc8 
      009865 05               [ 1] 1370 	rlwa x 
      009866 A6 11            [ 2] 1371 	jra 6$  
      001C85                       1372 5$: ; A:X XOR acc24 
      009868 CC 97            [ 1] 1373 	ld a,(ATMP,sp)
      00986A 27 00 0C         [ 1] 1374 	xor a,acc24 
      00986B 02               [ 1] 1375 	rlwa x 
      00986B 72 FB 03         [ 1] 1376 	xor a,acc16 
      00986E 1D               [ 1] 1377 	rlwa x 
      00986F 00 03 CF         [ 1] 1378 	xor a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009872 00               [ 1] 1379 	rlwa x 
      001C93                       1380 6$: _xpush
      009873 1A 90 F6 93      [ 2]    1     subw y,#CELL_SIZE
      009877 EE 01            [ 1]    2     ld (y),a 
      009879 72 A9 00         [ 2]    3     ldw (1,y),x 
      00987C 03 72            [ 2] 1381 	jra 1$ 
      00987E C7 00            [ 1] 1382 8$:	ld a,#TK_INTGR 
      001CA0                       1383 9$:	_drop VSIZE 
      009880 1A 72            [ 2]    1     addw sp,#VSIZE 
      009882 5C               [ 4] 1384 	ret 
                                   1385 
                                   1386 
                                   1387 ;--------------------------------------------
                                   1388 ; BASIC: HEX 
                                   1389 ; select hexadecimal base for integer print
                                   1390 ;---------------------------------------------
      001CA3                       1391 hex_base:
      009883 00 1B 72 CF      [ 1] 1392 	mov base,#16 
      009887 00               [ 4] 1393 	ret 
                                   1394 
                                   1395 ;--------------------------------------------
                                   1396 ; BASIC: DEC 
                                   1397 ; select decimal base for integer print
                                   1398 ;---------------------------------------------
      001CA8                       1399 dec_base:
      009888 1A 5B 04 81      [ 1] 1400 	mov base,#10
      00988C 81               [ 4] 1401 	ret 
                                   1402 
                                   1403 ;------------------------
                                   1404 ; BASIC: FREE 
                                   1405 ; return free size in RAM 
                                   1406 ; output:
                                   1407 ;   A:x		size 
                                   1408 ;--------------------------
      001CAD                       1409 free:
      00988C C6               [ 1] 1410 	clr a 
      00988D 00 02 C7         [ 2] 1411 	ldw x,#tib 
      009890 00 04 C0 00      [ 2] 1412 	subw x,dvar_end 
      009894 03               [ 4] 1413 	ret 
                                   1414 
                                   1415 ;------------------------------
                                   1416 ; BASIC: SIZE 
                                   1417 ; command that print 
                                   1418 ; program start addres and size 
                                   1419 ;------------------------------
      001CB6                       1420 cmd_size:
      009895 27 0D 0A         [ 1] 1421 	push base 
      009897 AE 1E A3         [ 2] 1422 	ldw x,#PROG_ADDR 
      009897 CE 00 05         [ 4] 1423 	call puts 
      00989A 72 BB 00         [ 2] 1424 	ldw x,txtbgn     
      00989D 01 F6 5C 72      [ 1] 1425 	mov base,#16 
      0098A1 5C 00 02         [ 4] 1426 	call prt_i16
      0098A4 81 00 0A         [ 1] 1427 	pop base 
      0098A5 AE 1E B5         [ 2] 1428 	ldw x,#PROG_SIZE 
      0098A5 F6 27 03         [ 4] 1429 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      0098A8 5C 20 FA         [ 2] 1430 	ldw x,txtend 
      0098AB 5C 72 B0 00      [ 2] 1431 	subw x,txtbgn 
      0098AF 05 CF 00         [ 4] 1432 	call prt_i16
      0098B2 01 81 C6         [ 2] 1433 	ldw x,#STR_BYTES 
      0098B4 CD 09 5C         [ 4] 1434 	call puts  
      0098B4 FE               [ 4] 1435 	ret 
                                   1436 
                                   1437 
                                   1438 ;------------------------
                                   1439 ; BASIC: UBOUND  
                                   1440 ; return array variable size 
                                   1441 ; and set 'array_size' variable 
                                   1442 ; output:
                                   1443 ;   A:X 	array_size
                                   1444 ;--------------------------
      001CE3                       1445 ubound:
      0098B5 72 5C 00         [ 4] 1446 	call free 
      0098B8 02 72            [ 1] 1447 	ld a,#CELL_SIZE 
      0098BA 5C               [ 2] 1448 	div x,a 
      0098BB 00 02 81         [ 2] 1449 	ldw array_size,x
      0098BE 4F               [ 1] 1450 	clr a 
      0098BE F6               [ 4] 1451 	ret 
                                   1452 
                                   1453 ;-----------------------------
                                   1454 ; BASIC: LET var=expr 
                                   1455 ; variable assignement 
                                   1456 ; output:
                                   1457 ;   A 		TK_NONE 
                                   1458 ;-----------------------------
      001CEE                       1459 let::
      0098BF EE 01 72         [ 4] 1460 	call next_token 
      0098C2 5C 00            [ 1] 1461 	cp a,#TK_VAR 
      0098C4 02 72            [ 1] 1462 	jreq let_var
      0098C6 5C 00            [ 1] 1463 	cp a,#TK_ARRAY 
      0098C8 02 72            [ 1] 1464 	jreq  let_array
      0098CA 5C 00 02         [ 2] 1465 	jp syntax_error
      001CFC                       1466 let_array:
      0098CD 81 19 F0         [ 4] 1467 	call get_array_element
      0098CE 20 03            [ 2] 1468 	jra let_eval 
      001D01                       1469 let_var:
      0098CE F6 72 5C         [ 4] 1470 	call get_addr
      001D04                       1471 let_eval:
      0098D1 00 02 81         [ 2] 1472 	ldw ptr16,x  ; variable address 
      0098D4 CD 18 0C         [ 4] 1473 	call next_token 
      0098D4 72 5F            [ 1] 1474 	cp a,#TK_EQUAL
      0098D6 00 0D            [ 1] 1475 	jreq 1$
      0098D8 CF 00 0E         [ 2] 1476 	jp syntax_error
      001D11                       1477 1$:	
      0098DB A6 10 C1         [ 4] 1478 	call condition   
      0098DE 00 0B            [ 1] 1479 	cp a,#TK_INTGR 
      0098E0 27 09            [ 1] 1480 	jreq 2$
      0098E2 72 0F 00         [ 2] 1481 	jp syntax_error
      001D1B                       1482 2$:	
      001D1B                       1483 	_xpop ; value 
      0098E5 0E 04            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0098E7 72               [ 1]    2     ldw x,y 
      0098E8 53 00            [ 2]    3     ldw x,(1,x)
      0098EA 0D A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0098EB                       1484 3$:
      0098EB A6 FF CD 99      [ 4] 1485 	ld [ptr16],a
      0098EF 11 CD 91 D3      [ 1] 1486 	inc ptr8  
      0098F3 88 CD 89 DC      [ 5] 1487 	ldw [ptr16],x 
      0098F7 84               [ 4] 1488 	ret 
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
      001D31                       1499 get_value: ; -- i 
      0098F8 81               [ 1] 1500 	ld a,(x) ; record size 
      0098F9 A4 0F            [ 1] 1501 	and a,#NAME_MAX_LEN
      0098F9 90 F6            [ 1] 1502 	sub a,#CELL_SIZE ; * value 
      0098FB 93               [ 1] 1503 	push a 
      0098FC EE 01            [ 1] 1504 	push #0 
      0098FE 72 A9 00         [ 2] 1505 	addw x,(1,sp)
      009901 03               [ 1] 1506 	ld a,(x)
      009902 C7 00            [ 2] 1507 	ldw x,(1,x)
      001D3F                       1508 	_drop 2
      009904 0D CF            [ 2]    1     addw sp,#2 
      009906 00               [ 4] 1509 	ret 
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
      001D42                       1522 func_eefree:
      009907 0E CD 98         [ 2] 1523 	ldw x,#EEPROM_BASE 
      00990A EB A6 20 CD      [ 1] 1524 1$:	mov acc8,#8 ; count 8 consecutive zeros
      00990E 89 7F 81         [ 2] 1525     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009911 24 17            [ 1] 1526 	jruge 8$ ; no free space 
      009911 52               [ 1] 1527 2$: ld a,(x)
      009912 04 0F            [ 1] 1528 	jrne 3$
      009914 02               [ 1] 1529 	incw x 
      009915 0F 01 4D 27      [ 1] 1530 	dec acc8 
      009919 11 C6            [ 1] 1531 	jrne 2$
      00991B 00 0B A1         [ 2] 1532 	subw x,#8 
      00991E 0A 26            [ 2] 1533 	jra 9$  
      009920 0A               [ 1] 1534 3$: ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009921 72               [ 1] 1535 	incw x
      009922 0F               [ 1] 1536 	tnz a  
      009923 00 0D            [ 1] 1537 	jrne 3$
      009925 05               [ 2] 1538 	decw x   
      009926 03 01            [ 2] 1539 	jra 1$ 
      009928 CD               [ 1] 1540 8$: clrw x ; no free space 
      009929 82               [ 1] 1541 9$: clr a 
      00992A 9D 00 24         [ 2] 1542 	ldw free_eeprom,x ; save in system variable 
      00992B 81               [ 4] 1543 	ret 
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
      001D6B                       1568 search_name:
      00992B AE 16            [ 2] 1569 	pushw y 
      001D6D                       1570 	_vars VSIZE
      00992D 68 1C            [ 2]    1     sub sp,#VSIZE 
      00992F 00 50 5A 7F      [ 1] 1571 	clr acc16 
      009933 6B 05            [ 1] 1572 	ld (RECLEN,sp),a    
      009933 C6 00            [ 2] 1573 	ldw (NAMEPTR,sp),x
      009935 0B CD 83         [ 2] 1574 	ldw x,dvar_end 
      009938 69 AB            [ 2] 1575 	ldw (LIMIT,sp),x 
      00993A 30 A1 3A 2B      [ 2] 1576 	ldw y,dvar_bgn
      00993E 02 AB            [ 2] 1577 1$:	ldw (WLKPTR,sp),y
      009940 07               [ 1] 1578 	ldw x,y 
      009941 13 07            [ 2] 1579 	cpw x, (LIMIT,sp) 
      009941 5A F7            [ 1] 1580 	jruge 7$ ; no match found 
      009943 0C 02            [ 1] 1581 	ld a,(y)
      009945 C6 00            [ 1] 1582 	and a,#NAME_MAX_LEN
      009947 0D CA            [ 1] 1583 	cp a,(RECLEN,sp)
      009949 00 0E            [ 1] 1584 	jrne 2$ 
      00994B CA 00            [ 1] 1585 	incw y 
      00994D 0F 26            [ 2] 1586 	ldw x,(NAMEPTR,sp)
      00994F E3 C6 00         [ 4] 1587 	call strcmp
      009952 0B A1            [ 1] 1588 	jrne 8$ ; match found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001D98                       1589 2$: ; skip this one 	
      009954 10 27            [ 2] 1590 	ldW Y,(WLKPTR,sp)
      009956 08 7B            [ 1] 1591 	ld a,(y)
      009958 01 27            [ 1] 1592 	and a,#NAME_MAX_LEN 
      00995A 0A A6 2D         [ 1] 1593 	ld acc8,a 
      00995D 20 02 00 0D      [ 2] 1594 	addw y,acc16 
      00995F 20 D9            [ 2] 1595 	jra 1$  
      001DA7                       1596 7$: ; no match found 
      00995F A6 24            [ 1] 1597 	clr (WLKPTR,sp)
      009961 5A F7            [ 1] 1598 	clr (WLKPTR+1,sp)
      001DAB                       1599 8$: ; match found 
      009963 0C 02            [ 2] 1600 	ldw x,(WLKPTR,sp) ; record address 
      009965                       1601 9$:	_DROP VSIZE
      009965 7B 02            [ 2]    1     addw sp,#VSIZE 
      009967 5B 04            [ 2] 1602 	popw y 
      009969 81               [ 4] 1603 	 ret 
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
      00996A                       1614 cmd_const:
      00996A A1 61 2A 01 81   [ 2] 1615 	btjt flags,#FRUN,0$
      00996F A1 7A            [ 1] 1616 	ld a,#ERR_RUN_ONLY
      009971 22 FB A0         [ 2] 1617 	jp tb_error 
      001DBC                       1618 0$: 
      001DBC                       1619 	_vars VSIZE 
      009974 20 81            [ 2]    1     sub sp,#VSIZE 
      009976 A6 80            [ 1] 1620 	ld a,#128 
      009976 52 05            [ 1] 1621 	ld (RONLY,sp),a 
      009978 1F 04            [ 1] 1622 	clr (REC_LEN,sp)
      00997A 4F 5F            [ 2] 1623 	jra cmd_dim2 ; shared code with cmd_dim  
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
      001DC6                       1634 cmd_dim:
      00997C 72 A2 00 03 90   [ 2] 1635 	btjt flags,#FRUN,cmd_dim1
      009981 F7 90            [ 1] 1636 	ld a,#ERR_RUN_ONLY
      009983 EF 01 0F         [ 2] 1637 	jp tb_error 
      001DD0                       1638 cmd_dim1:	
      001DD0                       1639 	_vars VSIZE
      009986 01 A6            [ 2]    1     sub sp,#VSIZE 
      009988 0A 6B            [ 1] 1640 	clr (REC_LEN,sp )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00998A 02 1E            [ 1] 1641 	clr (RONLY,sp)
      001DD6                       1642 cmd_dim2: 
      00998C 04 F6 27         [ 4] 1643 0$:	call next_token 
      00998F 4E A1            [ 1] 1644 	cp a,#TK_LABEL  
      009991 2D 26            [ 1] 1645 	jreq 1$ 
      009993 04 03 01         [ 2] 1646 	jp syntax_error 
      009996 20 08            [ 2] 1647 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009998 A1 24 26         [ 4] 1648 	call strlen
      00999B 08 A6            [ 1] 1649 	add a,#REC_XTRA_BYTES
      00999D 10 6B            [ 1] 1650 	ld (REC_LEN+1,sp),a
      00999F 02 5C 1F         [ 4] 1651 	call skip_string 
      0099A2 04 F6            [ 1] 1652 	ld a,(REC_LEN+1,sp)
      0099A4 1E 01            [ 2] 1653 	ldw x,(VAR_NAME,sp) 
      0099A4 A1 61 2B         [ 4] 1654 	call search_name  
      0099A7 02               [ 2] 1655 	tnzw x 
      0099A8 A0 20            [ 1] 1656 	jreq 2$
      0099AA A1 30            [ 1] 1657 	ld a,#ERR_DUPLICATE
      0099AC 2B 30 A0         [ 2] 1658 	jp tb_error  
      0099AF 30 A1 0A         [ 2] 1659 2$:	ldw x,dvar_end 
      0099B2 2B 06            [ 1] 1660 	ld a,(REC_LEN+1,sp)
      0099B4 A0 07            [ 1] 1661 	or a,(RONLY,sp)
      0099B6 11               [ 1] 1662 	ld (x),a 
      0099B7 02               [ 1] 1663 	incw x 
      0099B8 2A 24            [ 2] 1664 	pushw y 
      0099BA 6B 03            [ 2] 1665 	ldw y,(VAR_NAME+2,sp)
      0099BC 7B 02 CD         [ 4] 1666 	call strcpy
      0099BF 82 BA            [ 2] 1667 	popw y 
      0099C1 72               [ 2] 1668 	decw x
      0099C2 A2 00 03         [ 2] 1669 	addw x,(REC_LEN,sp)
      0099C5 90 F7 90         [ 2] 1670 	ldw dvar_end,x 
      0099C8 EF 01 5F         [ 2] 1671 	subw x,#CELL_SIZE  
      0099CB 7B               [ 1] 1672 	clr (x)
      0099CC 03 02            [ 1] 1673 	clr (1,x)  
      0099CE 72 A2            [ 1] 1674 	clr (2,x)
      0099D0 00 03 90         [ 4] 1675 4$: call next_token 
      0099D3 F7 90            [ 1] 1676 	cp a,#TK_COMMA 
      0099D5 EF 01            [ 1] 1677 	jreq 0$ 
      0099D7 CD 81            [ 1] 1678 	cp a,#TK_EQUAL 
      0099D9 FE 1E            [ 1] 1679 	jrne 8$
                                   1680 ; initialize variable 
      0099DB 04 20 C2         [ 4] 1681 	call condition 
      0099DE 0D 01            [ 1] 1682 	cp a,#TK_INTGR
      0099E0 27 03            [ 1] 1683 	jreq 5$
      0099E2 CD 82 83         [ 2] 1684 	jp syntax_error
      0099E5 CE 00 32         [ 2] 1685 5$: ldw x,dvar_end 
      0099E5 90 F6 93         [ 2] 1686 	subw x,#CELL_SIZE 
      0099E8 EE 01 72         [ 2] 1687 	ldw ptr16,x 
      001E3A                       1688 	_xpop 
      0099EB A9 00            [ 1]    1     ld a,(y)
      0099ED 03               [ 1]    2     ldw x,y 
      0099EE C7 00            [ 2]    3     ldw x,(1,x)
      0099F0 0D CF 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      0099F4 5B 05 81 19      [ 4] 1689 	ld [ptr16],a 
      0099F7 72 5C 00 1A      [ 1] 1690 	inc ptr8 
      0099F7 52 05 17 04      [ 5] 1691 	ldw [ptr16],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0099FB 20 CB            [ 2] 1692 	jra 4$ 
      001E51                       1693 8$:	
      001E51                       1694 	_unget_token 	
      0099FB 1F 02 F6 A4 0F   [ 1]    1      mov in,in.saved  
      001E56                       1695 	_drop VSIZE 
      009A00 6B 01            [ 2]    1     addw sp,#VSIZE 
      009A02 16 04 5C         [ 4] 1696 	call ubound 
      009A05 81               [ 4] 1697 	ret 
                                   1698 
                                   1699 
                                   1700 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1701 ; return program size 
                                   1702 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E5C                       1703 prog_size:
      009A05 90 F6 27         [ 2] 1704 	ldw x,txtend 
      009A08 1B 0D 01 27      [ 2] 1705 	subw x,txtbgn 
      009A0C 0A               [ 4] 1706 	ret 
                                   1707 
                                   1708 ;----------------------------
                                   1709 ; print program information 
                                   1710 ;---------------------------
      001E64                       1711 program_info: 
      009A0D F1 26 07         [ 2] 1712 	ldw x,#PROG_ADDR 
      009A10 90 5C 5C         [ 4] 1713 	call puts 
      009A13 0A 01 20         [ 2] 1714 	ldw x,txtbgn 
      009A16 EE 10 00 0A      [ 1] 1715 	mov base,#16 
      009A17 CD 18 54         [ 4] 1716 	call prt_i16
      009A17 1E 02 1D 00      [ 1] 1717 	mov base,#10  
      009A1B 02 4B 00         [ 2] 1718 	ldw x,#PROG_SIZE
      009A1E FE 84 27         [ 4] 1719 	call puts 
      009A21 1D 20 D7         [ 4] 1720 	call prog_size 
      009A24 CD 18 54         [ 4] 1721 	call prt_i16 
      009A24 1E 02 F6         [ 2] 1722 	ldw x,#STR_BYTES 
      009A27 6B 01 A4         [ 4] 1723 	call puts
      009A2A 0F 4C C7         [ 2] 1724 	ldw x,txtbgn
      009A2D 00 0F 72         [ 2] 1725 	cpw x,#app 
      009A30 5F 00            [ 1] 1726 	jrult 2$
      009A32 0E 72 BB         [ 2] 1727 	ldw x,#FLASH_MEM 
      009A35 00 0E            [ 2] 1728 	jra 3$
      009A37 FE 7B 01         [ 2] 1729 2$: ldw x,#RAM_MEM 	 
      009A3A A4 F0 4E         [ 4] 1730 3$:	call puts 
      009A3D AB 80            [ 1] 1731 	ld a,#CR 
      009A3F CD 08 FF         [ 4] 1732 	call putc
      009A3F 5B               [ 4] 1733 	ret 
                                   1734 
      009A40 05 81 6F 67 72 61 6D  1735 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A42 2C 20 70 72 6F 67 72  1736 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A42 88 CD 98 8C 11 01 27  1737 STR_BYTES: .asciz " bytes" 
      009A49 03 CC 97 25 84 81 41  1738 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009A4F 20 69 6E 20 52 41 4D  1739 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
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
      001EED                       1753 cmd_list:
      009A4F A6 06 CD 9A 42   [ 2] 1754 	btjf flags,#FRUN,0$
      009A54 A6 07            [ 1] 1755 	ld a,#ERR_CMD_ONLY
      009A54 4B 00 CD         [ 2] 1756 	jp tb_error
      001EF7                       1757 0$:	 
      009A57 9C AF 4D         [ 4] 1758 	call prog_size 
      009A5A 27 12            [ 1] 1759 	jrugt 3$
      009A5C 0C               [ 4] 1760 	ret 
      001EFD                       1761 3$: _vars VSIZE
      009A5D 01 CD            [ 2]    1     sub sp,#VSIZE 
      009A5F 98 8C A1         [ 2] 1762 	ldw x,txtbgn 
      009A62 08 27            [ 2] 1763 	ldw (LN_PTR,sp),x 
      009A64 F1               [ 2] 1764 	ldw x,(x) 
      009A65 A1 07            [ 2] 1765 	ldw (FIRST,sp),x ; list from first line 
      009A67 27 05 55         [ 2] 1766 	ldw x,#MAX_LINENO ; biggest line number 
      009A6A 00 04            [ 2] 1767 	ldw (LAST,sp),x 
      009A6C 00 02 84         [ 4] 1768 	call next_token 
      009A6F 81 84            [ 1] 1769 	cp a,#TK_INTGR
      009A70 27 0B            [ 1] 1770 	jreq start_from 
      001F13                       1771 is_minus: 	
      009A70 CD 9A            [ 1] 1772 	cp a,#TK_MINUS 
      009A72 4F A1            [ 1] 1773 	jreq end_at_line
      001F17                       1774 	_unget_token 
      009A74 01 27 03 CC 97   [ 1]    1      mov in,in.saved  
      009A79 25 90            [ 2] 1775 	jra list_loop 
      001F1E                       1776 start_from:	 
      009A7B F6 93 EE         [ 4] 1777 	call get_int24
      009A7E 01 72            [ 2] 1778 	ldw (FIRST,sp),x	
      001F23                       1779 lines_skip:
      009A80 A9 00            [ 2] 1780 	pushw y 
      009A82 03               [ 1] 1781 	clr a 
      009A83 C3 00 21         [ 4] 1782 	call search_lineno 
      009A86 23               [ 2] 1783 	tnzw x 
      009A87 05 A6            [ 1] 1784 	jrne 1$
      009A89 0A               [ 1] 1785 	ldw x,y 
      009A8A CC 97            [ 2] 1786 1$:	popw y 
      009A8C 27 5D            [ 2] 1787 	ldw (LN_PTR,sp),x 
      009A8E 27 F8 A6         [ 4] 1788 	call next_token 
      009A91 03 42            [ 1] 1789 	cp a,#TK_MINUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009A93 CF 00            [ 1] 1790 	jreq end_at_line 
      009A95 0E AE            [ 2] 1791 	ldw x,(FIRST,sp)
      009A97 16 68            [ 2] 1792 	ldw (LAST,sp),x 
      009A99 72 B0            [ 2] 1793 	jra list_loop 
      001F3E                       1794 end_at_line:
                                   1795 ; expect ending line# 
      009A9B 00 0E 81         [ 4] 1796     call next_token 
      009A9E A1 84            [ 1] 1797 	cp a,#TK_INTGR
      009A9E 52 01            [ 1] 1798 	jreq 1$
      001F45                       1799 	_unget_token 
      009AA0 0F 01 CD 98 8C   [ 1]    1      mov in,in.saved  
      009AA5 4D 26            [ 2] 1800 	jra list_loop
      001F4C                       1801 1$:
      009AA7 03 CC 9B         [ 4] 1802 	call get_int24 
      009AAA 50 A1            [ 2] 1803 	ldw (LAST,sp),x 
                                   1804 ; print loop
      001F51                       1805 list_loop:
      009AAC 10 27            [ 2] 1806 	ldw x,(LN_PTR,sp)
      009AAE 06 A1            [ 1] 1807 	ld a,(2,x) 
      009AB0 11 26 05         [ 4] 1808 	call prt_basic_line
      009AB3 03 01            [ 2] 1809 	ldw x,(LN_PTR,sp)
      009AB5 E6 02            [ 1] 1810 	ld a,(2,x)
      009AB5 CD 98 8C         [ 1] 1811 	ld acc8,a 
      009AB8 72 5F 00 0D      [ 1] 1812 	clr acc16 
      009AB8 4D 26 03 CC      [ 2] 1813 	addw x,acc16
      009ABC 97 25 1D         [ 2] 1814 	cpw x,txtend 
      009ABE 2A 07            [ 1] 1815 	jrpl list_exit
      009ABE A1 81            [ 2] 1816 	ldw (LN_PTR,sp),x
      009AC0 26               [ 2] 1817 	ldw x,(x)
      009AC1 0C FE            [ 2] 1818 	cpw x,(LAST,sp)  
      009AC3 72 5C            [ 1] 1819 	jrsle list_loop
      001F73                       1820 list_exit:
      009AC5 00 02 72 5C 00   [ 1] 1821 	mov in,count 
      009ACA 02 FD 20         [ 2] 1822 	ldw x,#pad 
      009ACD 70 00 04         [ 2] 1823 	ldw basicptr,x 
      009ACE                       1824 	_drop VSIZE 
      009ACE A1 84            [ 2]    1     addw sp,#VSIZE 
      009AD0 26 05 CD         [ 4] 1825 	call program_info
      009AD3 98 BE 20 67 06   [ 2] 1826 	btjf flags,#FLN_REJECTED,9$
      009AD7 AE 1F 8F         [ 2] 1827 	ldw x,#LINES_REJECTED
      009AD7 A1 05 26         [ 4] 1828 	call puts
      001F8E                       1829 9$: 
      009ADA 05               [ 4] 1830 	ret
      009ADB CD 9A 70 20 07 4E 47  1831 LINES_REJECTED: .asciz "WARNING: lines missing in this program.\n"
             3A 20 6C 69 6E 65 73
             20 6D 69 73 73 69 6E
             67 20 69 6E 20 74 68
             69 73 20 70 72 6F 67
             72 61 6D 2E 0A 00
                                   1832 
                                   1833 ;--------------------------
                                   1834 ; BASIC: EDIT label 
                                   1835 ;  copy program in FLASH 
                                   1836 ;  to RAM for edition 
                                   1837 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009AE0                       1838 cmd_edit:
      009AE0 A1 85            [ 1] 1839 	ld a,#TK_LABEL 
      009AE2 26 08 CD         [ 4] 1840 	call expect  
      009AE5 98               [ 2] 1841 	pushw x 
      009AE6 B4 18 25         [ 4] 1842 	call skip_string
      009AE7 85               [ 2] 1843 	popw x 
      009AE7 F6 EE 01         [ 4] 1844 	call search_program 
      009AEA 20 52            [ 1] 1845     jrne 1$ 
      009AEC AE 00 12         [ 2] 1846 	ldw x,#ERR_NO_PROGRAM
      009AEC A1 03 26         [ 2] 1847 	jp tb_error 
      009AEF 1D 90            [ 2] 1848 1$: pushw y 
      009AF1 89 89            [ 1] 1849 	ldw y,x ; source address 
      009AF3 CD 98 A5         [ 2] 1850 	subw x,#4
      009AF6 85 CD            [ 2] 1851 	ldw x,(2,x) ; program size 
      009AF8 94 19 AB         [ 2] 1852 	addw x,#4 
      009AFB 05 CD 9D         [ 2] 1853 	ldw acc16,x  ; bytes to copy 
      009AFE EB 5D 26         [ 2] 1854 	ldw x,#rsign ; destination address 
      009B01 04 90 85 20      [ 2] 1855 	subw y,#4 
      009B05 30 13 C5         [ 4] 1856 	call move  
      009B06 AE 00 90         [ 2] 1857 	ldw x,#free_ram 
      009B06 90 85 CD         [ 2] 1858 	ldw txtbgn,x 
      009B09 9D B1 20 31      [ 2] 1859 	addw x,rsize  
      009B0D CF 00 1D         [ 2] 1860 	ldw txtend,x
      009B0D A1 82            [ 2] 1861 	popw y  
      009B0F 26               [ 4] 1862 	ret 
                                   1863 
                                   1864 ;--------------------------
                                   1865 ; decompile line from token list
                                   1866 ; and print it. 
                                   1867 ; input:
                                   1868 ;   A       stop at this position 
                                   1869 ;   X 		pointer at line
                                   1870 ; output:
                                   1871 ;   none 
                                   1872 ;--------------------------	
      001FF6                       1873 prt_basic_line:
      009B10 0E FE            [ 2] 1874 	pushw y 
      009B12 72 5C 00         [ 1] 1875 	ld count,a 
      009B15 02 72            [ 1] 1876 	ld a,(2,x)
      009B17 5C 00 02         [ 1] 1877 	cp a,count 
      009B1A FD 5F            [ 1] 1878 	jrpl 1$ 
      009B1C 02 20 1F         [ 1] 1879 	ld count,a 
      009B1F CF 00 04         [ 2] 1880 1$:	ldw basicptr,x 
      009B1F A1 06 26 13      [ 2] 1881 	ldw y,#tib  
      009B23 CD 9B 96         [ 4] 1882 	call decompile 
      009B26 A6 07 CD         [ 4] 1883 	call puts 
      009B29 9A 42            [ 1] 1884 	ld a,#CR 
      009B2B 90 F6 93         [ 4] 1885 	call putc 
      009B2E EE 01            [ 2] 1886 	popw y 
      009B30 72               [ 4] 1887 	ret 
                                   1888 
                                   1889 
                                   1890 ;---------------------------------
                                   1891 ; BASIC: PRINT|? arg_list 
                                   1892 ; print values from argument list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1893 ;----------------------------------
                           000001  1894 	CCOMMA=1
                           000001  1895 	VSIZE=1
      00201A                       1896 print:
      00201A                       1897 	_vars VSIZE 
      009B31 A9 00            [ 2]    1     sub sp,#VSIZE 
      00201C                       1898 reset_comma:
      009B33 03 20            [ 1] 1899 	clr (CCOMMA,sp)
      00201E                       1900 prt_loop:
      009B35 08 18 0C         [ 4] 1901 	call next_token
      009B36 A1 02            [ 1] 1902 	cp a,#CMD_END 
      009B36 55 00            [ 1] 1903 	jrult 0$
      009B38 04 00            [ 1] 1904 	cp a,#TK_COLON 
      009B3A 02 4F            [ 1] 1905 	jreq 0$
      009B3C 20 12            [ 1] 1906 	cp a,#TK_CMD
      009B3E 26 07            [ 1] 1907 	jrne 10$
      00202D                       1908 0$:
      00202D                       1909 	_unget_token 
      009B3E 0D 01 27 03 CD   [ 1]    1      mov in,in.saved  
      009B43 82 95            [ 2] 1910 	jra 8$ 
      009B45                       1911 10$:	
      009B45 72 A2            [ 1] 1912 	cp a,#TK_QSTR
      009B47 00 03            [ 1] 1913 	jreq 1$
      009B49 90 F7            [ 1] 1914 	cp a,#TK_CHAR 
      009B4B 90 EF            [ 1] 1915 	jreq 2$ 
      009B4D 01 A6            [ 1] 1916 	cp a,#TK_CFUNC 
      009B4F 84 1F            [ 1] 1917 	jreq 3$
      009B50 A1 08            [ 1] 1918 	cp a,#TK_COMMA 
      009B50 5B 01            [ 1] 1919 	jreq 4$
      009B52 81 09            [ 1] 1920 	cp a,#TK_SHARP 
      009B53 27 2A            [ 1] 1921 	jreq 5$
      009B53 52 01            [ 2] 1922 	jra 7$ 
      00204A                       1923 1$:	; print string 
      009B55 CD 9A 9E         [ 4] 1924 	call puts
      009B58 4D               [ 1] 1925 	incw x
      009B59 27 38 00 04      [ 2] 1926 	subw x,basicptr 
      009B5B CF 00 00         [ 2] 1927 	ldw in.w,x  
      009B5B CD 98            [ 2] 1928 	jra reset_comma
      002057                       1929 2$:	; print character 
      009B5D 8C 6B 01         [ 4] 1930 	call get_char 
      009B60 A4 30 A1         [ 4] 1931 	call putc 
      009B63 20 27            [ 2] 1932 	jra reset_comma 
      00205F                       1933 3$: ; print character function value  	
      00205F                       1934 	_get_code_addr 
      009B65 09               [ 2]    1         ldw x,(x)
      009B66 A6 84 55 00      [ 1]    2         inc in 
      009B6A 04 00 02 20      [ 1]    3         inc in 
      009B6E 24               [ 4] 1935 	call (x)
      009B6F CD 08 FF         [ 4] 1936 	call putc
      009B6F CD 9A            [ 2] 1937 	jra reset_comma 
      00206E                       1938 4$: ; set comma state 
      009B71 9E 4D            [ 1] 1939 	cpl (CCOMMA,sp)
      009B73 26 03            [ 2] 1940 	jra prt_loop   
      002072                       1941 5$: ; # character must be followed by an integer   
      009B75 CC 97 25         [ 4] 1942 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009B78 A1 84            [ 1] 1943 	cp a,#TK_INTGR 
      009B78 7B 01            [ 1] 1944 	jreq 6$
      009B7A A1 20 26         [ 2] 1945 	jp syntax_error 
      00207C                       1946 6$: ; set tab width
      009B7D 05 CD 82         [ 4] 1947 	call get_int24 
      009B80 F9               [ 1] 1948 	ld a,xl 
      009B81 20 D8            [ 1] 1949 	and a,#15 
      009B83 A1 21 26         [ 1] 1950 	ld tab_width,a 
      009B86 05 CD            [ 2] 1951 	jra reset_comma 
      002087                       1952 7$:	
      002087                       1953 	_unget_token 
      009B88 83 87 20 CF 01   [ 1]    1      mov in,in.saved  
      009B8C CD 1C 2F         [ 4] 1954 	call condition
      009B8C CD               [ 1] 1955 	tnz a 
      009B8D 84 21            [ 1] 1956 	jreq 8$    
      009B8F 20 CA 79         [ 4] 1957     call print_top
      009B91 20 85            [ 2] 1958 	jra reset_comma 
      002097                       1959 8$:
      009B91 A6 84            [ 1] 1960 	tnz (CCOMMA,sp)
      009B93 26 05            [ 1] 1961 	jrne 9$
      009B93 5B 01            [ 1] 1962 	ld a,#CR 
      009B95 81 08 FF         [ 4] 1963     call putc 
      009B96                       1964 9$:	_drop VSIZE 
      009B96 52 01            [ 2]    1     addw sp,#VSIZE 
      009B98 CD               [ 4] 1965 	ret 
                                   1966 
                                   1967 ;----------------------
                                   1968 ; 'save_context' and
                                   1969 ; 'rest_context' must be 
                                   1970 ; called at the same 
                                   1971 ; call stack depth 
                                   1972 ; i.e. SP must have the 
                                   1973 ; save value at  
                                   1974 ; entry point of both 
                                   1975 ; routine. 
                                   1976 ;---------------------
                           000004  1977 	CTXT_SIZE=4 ; size of saved data 
                                   1978 ;--------------------
                                   1979 ; save current BASIC
                                   1980 ; interpreter context 
                                   1981 ; on stack 
                                   1982 ;--------------------
      0020A3                       1983 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0020A3                       1984 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0020A3                       1985 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0020A3                       1986 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0020A3                       1987 save_context:
      009B99 9B 53 4D         [ 2] 1988 	ldw x,basicptr 
      009B9C 27 2D            [ 2] 1989 	ldw (BPTR,sp),x
      009B9E C6 00 01         [ 1] 1990 	ld a,in 
      009B9E CD 98            [ 1] 1991 	ld (IN,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009BA0 8C 6B 01         [ 1] 1992 	ld a,count 
      009BA3 A4 30            [ 1] 1993 	ld (CNT,sp),a  
      009BA5 A1               [ 4] 1994 	ret
                                   1995 
                                   1996 ;-----------------------
                                   1997 ; restore previously saved 
                                   1998 ; BASIC interpreter context 
                                   1999 ; from stack 
                                   2000 ;-------------------------
      0020B3                       2001 rest_context:
      009BA6 10 27            [ 2] 2002 	ldw x,(BPTR,sp)
      009BA8 09 55 00         [ 2] 2003 	ldw basicptr,x 
      009BAB 04 00            [ 1] 2004 	ld a,(IN,sp)
      009BAD 02 A6 84         [ 1] 2005 	ld in,a
      009BB0 20 19            [ 1] 2006 	ld a,(CNT,sp)
      009BB2 C7 00 02         [ 1] 2007 	ld count,a  
      009BB2 CD               [ 4] 2008 	ret
                                   2009 
                                   2010 
                                   2011 
                                   2012 ;------------------------------------------
                                   2013 ; BASIC: INPUT [string]var[,[string]var]
                                   2014 ; input value in variables 
                                   2015 ; [string] optionally can be used as prompt 
                                   2016 ;-----------------------------------------
                           000001  2017 	CX_BPTR=1
                           000003  2018 	CX_IN=3
                           000004  2019 	CX_CNT=4
                           000005  2020 	SKIP=5
                           000005  2021 	VSIZE=5
      0020C3                       2022 input_var:
      009BB3 9B 53            [ 2] 2023 	pushw y 
      0020C5                       2024 	_vars VSIZE 
      009BB5 4D 26            [ 2]    1     sub sp,#VSIZE 
      0020C7                       2025 input_loop:
      009BB7 03 CC            [ 1] 2026 	clr (SKIP,sp)
      009BB9 97 25 0C         [ 4] 2027 	call next_token 
      009BBB A1 02            [ 1] 2028 	cp a,#TK_QSTR 
      009BBB 7B 01            [ 1] 2029 	jrne 1$ 
      009BBD A1 10 26         [ 4] 2030 	call puts 
      009BC0 05               [ 1] 2031 	incw x 
      009BC1 CD 81 FE 20      [ 2] 2032 	subw x,basicptr 
      009BC5 D8 00 00         [ 2] 2033 	ldw in.w,x 
      009BC6 03 05            [ 1] 2034 	cpl (SKIP,sp)
      009BC6 CD 82 1B         [ 4] 2035 	call next_token 
      009BC9 20 D3            [ 1] 2036 1$: cp a,#TK_VAR  
      009BCB 27 03            [ 1] 2037 	jreq 2$ 
      009BCB 5B 01 81         [ 2] 2038 	jp syntax_error
      009BCE CD 18 34         [ 4] 2039 2$:	call get_addr
      009BCE 52 01 CD         [ 2] 2040 	ldw ptr16,x 
      009BD1 9B 96            [ 1] 2041 	tnz (SKIP,sp)
      009BD3 4D 27            [ 1] 2042 	jrne 21$ 
      009BD5 54 CD 98         [ 4] 2043 	call var_name 
      009BD8 8C 6B 01         [ 4] 2044 	call putc   
      0020F7                       2045 21$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009BDB A4 30            [ 1] 2046 	ld a,#':
      009BDD A1 30 27         [ 4] 2047 	call putc 
      009BE0 09 A6 84         [ 4] 2048 	call save_context 
      009BE3 55 00 04 00      [ 1] 2049 	clr count  
      009BE7 02 20 40         [ 4] 2050 	call readln 
      009BEA AE 16 68         [ 2] 2051 	ldw x,#tib 
      009BEA CD 9B 96         [ 1] 2052 	push count
      009BED 4D 26            [ 1] 2053 	push #0 
      009BEF 03 CC 97         [ 2] 2054 	addw x,(1,sp)
      009BF2 25               [ 1] 2055 	incw x 
      009BF3                       2056 	_drop 2 
      009BF3 CD 82            [ 2]    1     addw sp,#2 
      009BF5 38 90 F6 93      [ 1] 2057 	clr in 
      009BF9 EE 01 72         [ 4] 2058 	call get_token
      009BFC A9 00            [ 1] 2059 	cp a,#TK_INTGR
      009BFE 03 4D            [ 1] 2060 	jreq 3$ 
      009C00 2B 08            [ 1] 2061 	cp a,#TK_MINUS
      009C02 26 0C            [ 1] 2062 	jrne 22$
      009C04 35 02 00         [ 4] 2063 	call get_token 
      009C07 0F 20            [ 1] 2064 	cp a,#TK_INTGR 
      009C09 0A 06            [ 1] 2065 	jreq 23$
      009C0A                       2066 22$:
      009C0A 35 04 00         [ 4] 2067 	call rest_context 
      009C0D 0F 20 04         [ 2] 2068 	jp syntax_error
      009C10                       2069 23$:
      009C10 35 01 00         [ 4] 2070 	call neg_acc24	
      002133                       2071 3$: 
      009C13 0F 00 0C         [ 1] 2072 	ld a,acc24 
      009C14 CE 00 0D         [ 2] 2073 	ldw x,acc16 
      009C14 5F C6 00 0F      [ 4] 2074 	ld [ptr16],a
      009C18 14 01 27 03      [ 1] 2075 	inc ptr8  
      009C1C 53 A6 FF 72      [ 5] 2076 	ldw [ptr16],x 
      009C20 A2 00 03         [ 4] 2077 	call rest_context
      009C23 90 F7 90         [ 4] 2078 	call next_token 
      009C26 EF 01            [ 1] 2079 	cp a,#TK_COMMA
      009C28 A6 84            [ 1] 2080 	jrne 4$ 
      009C2A CC 20 C7         [ 2] 2081 	jp input_loop
      002152                       2082 4$:
      009C2A 5B 01            [ 1] 2083 	cp a,#TK_NONE 
      009C2C 81 07            [ 1] 2084 	jreq input_exit  
      009C2D A1 0A            [ 1] 2085 	cp a,#TK_COLON 
      009C2D 4B 00            [ 1] 2086     jreq input_exit 
      009C2F CD 98 8C         [ 2] 2087 	jp syntax_error 
      00215D                       2088 input_exit:
      00215D                       2089 	_drop VSIZE 
      009C32 4D 27            [ 2]    1     addw sp,#VSIZE 
      009C34 25 A1            [ 2] 2090 	popw y 
      009C36 87               [ 4] 2091 	ret 
                                   2092 
                                   2093 
                                   2094 ;---------------------
                                   2095 ; BASIC: REM | ' 
                                   2096 ; skip comment to end of line 
                                   2097 ;---------------------- 
      002162                       2098 remark::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009C37 26 04 03 01 20   [ 1] 2099 	mov in,count 
      009C3C F2               [ 4] 2100  	ret 
                                   2101 
                                   2102 
                                   2103 ;---------------------
                                   2104 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2105 ; read in loop 'addr'  
                                   2106 ; apply & 'mask' to value 
                                   2107 ; loop while result==0.  
                                   2108 ; 'xor_mask' is used to 
                                   2109 ; invert the wait logic.
                                   2110 ; i.e. loop while not 0.
                                   2111 ;---------------------
                           000001  2112 	XMASK=1 
                           000002  2113 	MASK=2
                           000003  2114 	ADDR=3
                           000004  2115 	VSIZE=4
      009C3D                       2116 wait: 
      002168                       2117 	_vars VSIZE
      009C3D A1 06            [ 2]    1     sub sp,#VSIZE 
      009C3F 26 0A            [ 1] 2118 	clr (XMASK,sp) 
      009C41 CD 9C AF         [ 4] 2119 	call arg_list 
      009C44 A6 07            [ 1] 2120 	cp a,#2
      009C46 CD 9A            [ 1] 2121 	jruge 0$
      009C48 42 20 08         [ 2] 2122 	jp syntax_error 
      009C4B 55 00            [ 1] 2123 0$:	cp a,#3
      009C4D 04 00            [ 1] 2124 	jrult 1$
      00217A                       2125 	_xpop  ; xor mask 
      009C4F 02 CD            [ 1]    1     ld a,(y)
      009C51 9B               [ 1]    2     ldw x,y 
      009C52 CE 01            [ 2]    3     ldw x,(1,x)
      009C53 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C53 0D               [ 1] 2126 	ld a,xl 
      009C54 01 27            [ 1] 2127 	ld (XMASK,sp),a 
      002186                       2128 1$: _xpop ; mask
      009C56 03 CD            [ 1]    1     ld a,(y)
      009C58 82               [ 1]    2     ldw x,y 
      009C59 7A 01            [ 2]    3     ldw x,(1,x)
      009C5A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C5A 5B               [ 1] 2129     ld a,xl  
      009C5B 01 81            [ 1] 2130 	ld (MASK,sp),a 
      009C5D                       2131 	_xpop ; address 
      009C5D CD 9C            [ 1]    1     ld a,(y)
      009C5F 2D               [ 1]    2     ldw x,y 
      009C60 4D 27            [ 2]    3     ldw x,(1,x)
      009C62 4B CD 98 8C      [ 2]    4     addw y,#CELL_SIZE 
      009C66 4D               [ 1] 2132 2$:	ld a,(x)
      009C67 27 43            [ 1] 2133 	and a,(MASK,sp)
      009C69 A1 88            [ 1] 2134 	xor a,(XMASK,sp)
      009C6B 27 07            [ 1] 2135 	jreq 2$ 
      0021A2                       2136 	_drop VSIZE 
      009C6D 55 00            [ 2]    1     addw sp,#VSIZE 
      009C6F 04               [ 4] 2137 	ret 
                                   2138 
                                   2139 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   2140 ; BASIC: BSET addr,mask
                                   2141 ; set bits at 'addr' corresponding 
                                   2142 ; to those of 'mask' that are at 1.
                                   2143 ; arguments:
                                   2144 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2145 ;   mask        mask|addr
                                   2146 ; output:
                                   2147 ;	none 
                                   2148 ;--------------------------
      0021A5                       2149 bit_set:
      009C70 00 02 20         [ 4] 2150 	call arg_list 
      009C73 38 CD            [ 1] 2151 	cp a,#2	 
      009C75 9C 2D            [ 1] 2152 	jreq 1$ 
      009C77 4D 26 03         [ 2] 2153 	jp syntax_error
      0021AF                       2154 1$: 
      0021AF                       2155 	_xpop ; mask 
      009C7A CC 97            [ 1]    1     ld a,(y)
      009C7C 25               [ 1]    2     ldw x,y 
      009C7D EE 01            [ 2]    3     ldw x,(1,x)
      009C7D 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      009C81 01               [ 1] 2156 	ld a,xl
      009C82 72               [ 1] 2157 	push a  
      0021BA                       2158 	_xpop ; addr  
      009C83 A9 00            [ 1]    1     ld a,(y)
      009C85 03               [ 1]    2     ldw x,y 
      009C86 C7 00            [ 2]    3     ldw x,(1,x)
      009C88 0D CF 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      009C8C 90               [ 1] 2159 	pop a 
      009C8D F6               [ 1] 2160 	or a,(x)
      009C8E 93               [ 1] 2161 	ld (x),a
      009C8F EE               [ 4] 2162 	ret 
                                   2163 
                                   2164 ;---------------------
                                   2165 ; BASIC: BRES addr,mask
                                   2166 ; reset bits at 'addr' corresponding 
                                   2167 ; to those of 'mask' that are at 1.
                                   2168 ; arguments:
                                   2169 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2170 ;   mask	    ~mask&*addr  
                                   2171 ; output:
                                   2172 ;	none 
                                   2173 ;--------------------------
      0021C7                       2174 bit_reset:
      009C90 01 72 A9         [ 4] 2175 	call arg_list 
      009C93 00 03            [ 1] 2176 	cp a,#2  
      009C95 C4 00            [ 1] 2177 	jreq 1$ 
      009C97 0D 02 C4         [ 2] 2178 	jp syntax_error
      0021D1                       2179 1$: 
      0021D1                       2180 	_xpop ; mask 
      009C9A 00 0E            [ 1]    1     ld a,(y)
      009C9C 02               [ 1]    2     ldw x,y 
      009C9D C4 00            [ 2]    3     ldw x,(1,x)
      009C9F 0F 02 72 A2      [ 2]    4     addw y,#CELL_SIZE 
      009CA3 00               [ 1] 2181 	ld a,xl 
      009CA4 03               [ 1] 2182 	cpl a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009CA5 90               [ 1] 2183 	push a  
      0021DD                       2184 	_xpop ; addr  
      009CA6 F7 90            [ 1]    1     ld a,(y)
      009CA8 EF               [ 1]    2     ldw x,y 
      009CA9 01 20            [ 2]    3     ldw x,(1,x)
      009CAB B7 A6 84 81      [ 2]    4     addw y,#CELL_SIZE 
      009CAF 84               [ 1] 2185 	pop a 
      009CAF 52               [ 1] 2186 	and a,(x)
      009CB0 02               [ 1] 2187 	ld (x),a 
      009CB1 CD               [ 4] 2188 	ret 
                                   2189 
                                   2190 ;---------------------
                                   2191 ; BASIC: BTOGL addr,mask
                                   2192 ; toggle bits at 'addr' corresponding 
                                   2193 ; to those of 'mask' that are at 1.
                                   2194 ; arguments:
                                   2195 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2196 ;   mask	    mask^*addr  
                                   2197 ; output:
                                   2198 ;	none 
                                   2199 ;--------------------------
      0021EA                       2200 bit_toggle:
      009CB2 9C 5D 4D         [ 4] 2201 	call arg_list 
      009CB5 27 69            [ 1] 2202 	cp a,#2 
      009CB7 CD 98            [ 1] 2203 	jreq 1$ 
      009CB9 8C A1 89         [ 2] 2204 	jp syntax_error
      0021F4                       2205 1$: _xpop ; mask 
      009CBC 27 0B            [ 1]    1     ld a,(y)
      009CBE A1               [ 1]    2     ldw x,y 
      009CBF 8A 27            [ 2]    3     ldw x,(1,x)
      009CC1 07 55 00 04      [ 2]    4     addw y,#CELL_SIZE 
      009CC5 00               [ 1] 2206 	ld a,xl
      009CC6 02               [ 1] 2207 	push a 
      0021FF                       2208 	_xpop  ; addr  
      009CC7 20 55            [ 1]    1     ld a,(y)
      009CC9 6B               [ 1]    2     ldw x,y 
      009CCA 02 CD            [ 2]    3     ldw x,(1,x)
      009CCC 9C 5D A1 84      [ 2]    4     addw y,#CELL_SIZE 
      009CD0 27               [ 1] 2209 	pop a 
      009CD1 03               [ 1] 2210 	xor a,(x)
      009CD2 CC               [ 1] 2211 	ld (x),a 
      009CD3 97               [ 4] 2212 	ret 
                                   2213 
                                   2214 
                                   2215 ;---------------------
                                   2216 ; BASIC: BTEST(addr,bit)
                                   2217 ; return bit value at 'addr' 
                                   2218 ; bit is in range {0..7}.
                                   2219 ; arguments:
                                   2220 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2221 ;   bit 	    bit position {0..7}  
                                   2222 ; output:
                                   2223 ;	A:X       bit value  
                                   2224 ;--------------------------
      00220C                       2225 bit_test:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009CD4 25 19 CF         [ 4] 2226 	call func_args 
      009CD5 A1 02            [ 1] 2227 	cp a,#2
      009CD5 90 F6            [ 1] 2228 	jreq 0$
      009CD7 93 EE 01         [ 2] 2229 	jp syntax_error
      002216                       2230 0$:	
      002216                       2231 	_xpop 
      009CDA 72 A9            [ 1]    1     ld a,(y)
      009CDC 00               [ 1]    2     ldw x,y 
      009CDD 03 C7            [ 2]    3     ldw x,(1,x)
      009CDF 00 0D CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009CE3 0E               [ 1] 2232 	ld a,xl 
      009CE4 90 F6            [ 1] 2233 	and a,#7
      009CE6 93               [ 1] 2234 	push a   
      009CE7 EE 01            [ 1] 2235 	ld a,#1 
      009CE9 72 A9            [ 1] 2236 1$: tnz (1,sp)
      009CEB 00 03            [ 1] 2237 	jreq 2$
      009CED 6B               [ 1] 2238 	sll a 
      009CEE 01 7B            [ 1] 2239 	dec (1,sp)
      009CF0 02 A1            [ 2] 2240 	jra 1$
      009CF2 8A 27            [ 1] 2241 2$: ld (1,sp),a  
      002230                       2242 	_xpop ; address  
      009CF4 10 F6            [ 1]    1     ld a,(y)
      009CF5 93               [ 1]    2     ldw x,y 
      009CF5 7B 01            [ 2]    3     ldw x,(1,x)
      009CF7 CA 00 0D 02      [ 2]    4     addw y,#CELL_SIZE 
      009CFB CA               [ 1] 2243 	pop a 
      009CFC 00               [ 1] 2244 	and a,(x)
      009CFD 0E 02            [ 1] 2245 	jreq 3$
      009CFF CA 00            [ 1] 2246 	ld a,#1 
      009D01 0F               [ 1] 2247 3$:	clrw x 
      009D02 02               [ 1] 2248 	ld xl,a
      009D03 20               [ 1] 2249 	clr a  
      009D04 0E               [ 4] 2250 	ret
                                   2251 
                                   2252 ;--------------------
                                   2253 ; BASIC: POKE addr,byte
                                   2254 ; put a byte at addr 
                                   2255 ;--------------------
      009D05                       2256 poke:
      009D05 7B 01 C8         [ 4] 2257 	call arg_list 
      009D08 00 0D            [ 1] 2258 	cp a,#2
      009D0A 02 C8            [ 1] 2259 	jreq 1$
      009D0C 00 0E 02         [ 2] 2260 	jp syntax_error
      00224D                       2261 1$:	
      00224D                       2262 	_xpop ; byte   
      009D0F C8 00            [ 1]    1     ld a,(y)
      009D11 0F               [ 1]    2     ldw x,y 
      009D12 02 72            [ 2]    3     ldw x,(1,x)
      009D14 A2 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      009D18 F7               [ 1] 2263     ld a,xl 
      009D19 90               [ 1] 2264 	push a 
      002258                       2265 	_xpop ; address 
      009D1A EF 01            [ 1]    1     ld a,(y)
      009D1C 20               [ 1]    2     ldw x,y 
      009D1D 99 A6            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009D1F 84 5B 02 81      [ 2]    4     addw y,#CELL_SIZE 
      009D23 84               [ 1] 2266 	pop a 
      009D23 35               [ 1] 2267 	ld (x),a 
      009D24 10               [ 4] 2268 	ret 
                                   2269 
                                   2270 ;-----------------------
                                   2271 ; BASIC: PEEK(addr)
                                   2272 ; get the byte at addr 
                                   2273 ; input:
                                   2274 ;	none 
                                   2275 ; output:
                                   2276 ;	X 		value 
                                   2277 ;-----------------------
      002264                       2278 peek:
      009D25 00 0B 81         [ 4] 2279 	call func_args
      009D28 A1 01            [ 1] 2280 	cp a,#1 
      009D28 35 0A            [ 1] 2281 	jreq 1$
      009D2A 00 0B 81         [ 2] 2282 	jp syntax_error
      009D2D                       2283 1$: _xpop ; address  
      009D2D 4F AE            [ 1]    1     ld a,(y)
      009D2F 16               [ 1]    2     ldw x,y 
      009D30 68 72            [ 2]    3     ldw x,(1,x)
      009D32 B0 00 33 81      [ 2]    4     addw y,#CELL_SIZE 
      009D36 C7 00 18         [ 1] 2284 	ld farptr,a 
      009D36 3B 00 0B         [ 2] 2285 	ldw ptr16,x 
      009D39 AE 9F 23 CD      [ 5] 2286 	ldf a,[farptr]
      009D3D 89               [ 1] 2287 	clrw x 
      009D3E DC               [ 1] 2288 	ld xl,a 
      009D3F CE               [ 1] 2289 	clr a 
      009D40 00               [ 4] 2290 	ret 
                                   2291 
                                   2292 ;---------------------------
                                   2293 ; BASIC IF expr : instructions
                                   2294 ; evaluate expr and if true 
                                   2295 ; execute instructions on same line. 
                                   2296 ;----------------------------
      002285                       2297 if: 
      009D41 1C 35 10         [ 4] 2298 	call condition  
      002288                       2299 	_xpop 
      009D44 00 0B            [ 1]    1     ld a,(y)
      009D46 CD               [ 1]    2     ldw x,y 
      009D47 98 D4            [ 2]    3     ldw x,(1,x)
      009D49 32 00 0B AE      [ 2]    4     addw y,#CELL_SIZE 
      009D4D 9F               [ 1] 2300 	tnz  a  
      009D4E 35 CD            [ 1] 2301 	jrne 9$
      009D50 89               [ 2] 2302 	tnzw x 
      009D51 DC CE            [ 1] 2303 	jrne 9$  
                                   2304 ;skip to next line
      009D53 00 1E 72 B0 00   [ 1] 2305 	mov in,count
      00229C                       2306 	_drop 2 
      009D58 1C CD            [ 2]    1     addw sp,#2 
      009D5A 98 D4 AE         [ 2] 2307 	jp next_line
      009D5D 9F               [ 4] 2308 9$:	ret 
                                   2309 
                                   2310 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   2311 ; BASIC: FOR var=expr 
                                   2312 ; set variable to expression 
                                   2313 ; leave variable address 
                                   2314 ; on stack and set
                                   2315 ; FLOOP bit in 'flags'
                                   2316 ;-----------------
                           000001  2317 	RETL1=1 ; return address  
                           000003  2318 	FSTEP=3  ; variable increment int24
                           000006  2319 	LIMIT=6 ; loop limit, int24  
                           000009  2320 	CVAR=9   ; control variable 
                           00000B  2321 	INW=11   ;  in.w saved
                           00000D  2322 	BPTR=13 ; baseptr saved
                           00000D  2323 	VSIZE=13  
      0022A2                       2324 for: ; { -- var_addr }
      009D5E 46               [ 2] 2325 	popw x ; call return address 
      0022A3                       2326 	_vars VSIZE 
      009D5F CD 89            [ 2]    1     sub sp,#VSIZE 
      009D61 DC               [ 2] 2327 	pushw x  ; RETL1 
      009D62 81 85            [ 1] 2328 	ld a,#TK_VAR 
      009D63 CD 19 C2         [ 4] 2329 	call expect
      009D63 CD 9D 2D         [ 4] 2330 	call get_addr
      009D66 A6 03            [ 2] 2331 	ldw (CVAR,sp),x  ; control variable 
      009D68 62 CF 00         [ 4] 2332 	call let_eval 
      009D6B 21 4F 81 22      [ 1] 2333 	bset flags,#FLOOP 
      009D6E CD 18 0C         [ 4] 2334 	call next_token 
      009D6E CD 98            [ 1] 2335 	cp a,#TK_CMD 
      009D70 8C A1            [ 1] 2336 	jreq 1$
      009D72 85 27 0C         [ 2] 2337 	jp syntax_error
      0022C1                       2338 1$:  
      0022C1                       2339 	_get_code_addr
      009D75 A1               [ 2]    1         ldw x,(x)
      009D76 05 27 03 CC      [ 1]    2         inc in 
      009D7A 97 25 00 01      [ 1]    3         inc in 
      009D7C A3 22 D2         [ 2] 2340 	cpw x,#to   
      009D7C CD 9A            [ 1] 2341 	jreq to
      009D7E 70 20 03         [ 2] 2342 	jp syntax_error 
                                   2343 
                                   2344 ;-----------------------------------
                                   2345 ; BASIC: TO expr 
                                   2346 ; second part of FOR loop initilization
                                   2347 ; leave limit on stack and set 
                                   2348 ; FTO bit in 'flags'
                                   2349 ;-----------------------------------
      009D81                       2350 to: ; { var_addr -- var_addr limit step }
      009D81 CD 98 B4 22 03   [ 2] 2351 	btjt flags,#FLOOP,1$
      009D84 CC 16 A5         [ 2] 2352 	jp syntax_error
      009D84 CF 00 1A         [ 4] 2353 1$: call expression   
      009D87 CD 98            [ 1] 2354 	cp a,#TK_INTGR 
      009D89 8C A1            [ 1] 2355 	jreq 2$ 
      009D8B 32 27 03         [ 2] 2356 	jp syntax_error
      0022E4                       2357 2$: _xpop
      009D8E CC 97            [ 1]    1     ld a,(y)
      009D90 25               [ 1]    2     ldw x,y 
      009D91 EE 01            [ 2]    3     ldw x,(1,x)
      009D91 CD 9C AF A1      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009D95 84 27            [ 1] 2358 	ld (LIMIT,sp),a 
      009D97 03 CC            [ 2] 2359 	ldw (LIMIT+1,sp),x
      009D99 97 25 0C         [ 4] 2360 	call next_token
      009D9B A1 00            [ 1] 2361 	cp a,#TK_NONE  
      009D9B 90 F6            [ 1] 2362 	jreq 4$ 
      009D9D 93 EE            [ 1] 2363 	cp a,#TK_CMD
      009D9F 01 72            [ 1] 2364 	jrne 3$
      0022FC                       2365 	_get_code_addr
      009DA1 A9               [ 2]    1         ldw x,(x)
      009DA2 00 03 00 01      [ 1]    2         inc in 
      009DA4 72 5C 00 01      [ 1]    3         inc in 
      009DA4 72 C7 00         [ 2] 2366 	cpw x,#step 
      009DA7 1A 72            [ 1] 2367 	jreq step
      00230A                       2368 3$:	
      00230A                       2369 	_unget_token   	 
      009DA9 5C 00 1B 72 CF   [ 1]    1      mov in,in.saved  
      00230F                       2370 4$:	
      009DAE 00 1A            [ 1] 2371 	clr (FSTEP,sp) 
      009DB0 81 00 01         [ 2] 2372 	ldw x,#1   ; default step  
      009DB1 1F 04            [ 2] 2373 	ldw (FSTEP+1,sp),x 
      009DB1 F6 A4            [ 2] 2374 	jra store_loop_addr 
                                   2375 
                                   2376 
                                   2377 ;----------------------------------
                                   2378 ; BASIC: STEP expr 
                                   2379 ; optional third par of FOR loop
                                   2380 ; initialization. 	
                                   2381 ;------------------------------------
      002318                       2382 step: ; {var limit -- var limit step}
      009DB3 0F A0 03 88 4B   [ 2] 2383 	btjt flags,#FLOOP,1$
      009DB8 00 72 FB         [ 2] 2384 	jp syntax_error
      009DBB 01 F6 EE         [ 4] 2385 1$: call expression 
      009DBE 01 5B            [ 1] 2386 	cp a,#TK_INTGR
      009DC0 02 81            [ 1] 2387 	jreq 2$
      009DC2 CC 16 A5         [ 2] 2388 	jp syntax_error
      00232A                       2389 2$:	
      00232A                       2390 	_xpop 
      009DC2 AE 40            [ 1]    1     ld a,(y)
      009DC4 00               [ 1]    2     ldw x,y 
      009DC5 35 08            [ 2]    3     ldw x,(1,x)
      009DC7 00 0F A3 47      [ 2]    4     addw y,#CELL_SIZE 
      009DCB F8 24            [ 1] 2391 	ld (FSTEP,sp),a 
      009DCD 17 F6            [ 2] 2392 	ldw (FSTEP+1,sp),x ; step
                                   2393 ; if step < 0 decrement LIMIT 
      009DCF 26               [ 1] 2394 	tnz a
      009DD0 0C 5C            [ 1] 2395 	jrpl store_loop_addr 
      009DD2 72 5A            [ 1] 2396 	ld a,(LIMIT,sp)
      009DD4 00 0F            [ 2] 2397 	ldw x,(LIMIT+1,sp)
      009DD6 26 F6 1D         [ 2] 2398 	subw x,#1 
      009DD9 00 08            [ 1] 2399 	sbc a,#0 
      009DDB 20 09            [ 1] 2400 	ld (LIMIT,sp),a 
      009DDD F6 5C            [ 2] 2401 	ldw (LIMIT+1,sp),x 
                                   2402 ; leave loop back entry point on cstack 
                                   2403 ; cstack is 1 call deep from interpreter
      002347                       2404 store_loop_addr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009DDF 4D 26 FB         [ 2] 2405 	ldw x,basicptr
      009DE2 5A 20            [ 2] 2406 	ldw (BPTR,sp),x 
      009DE4 E0 5F 4F         [ 2] 2407 	ldw x,in.w 
      009DE7 CF 00            [ 2] 2408 	ldw (INW,sp),x   
      009DE9 25 81 00 22      [ 1] 2409 	bres flags,#FLOOP 
      009DEB 72 5C 00 1F      [ 1] 2410 	inc loop_depth  
      009DEB 90               [ 4] 2411 	ret 
                                   2412 
                                   2413 ;--------------------------------
                                   2414 ; BASIC: NEXT var 
                                   2415 ; FOR loop control 
                                   2416 ; increment variable with step 
                                   2417 ; and compare with limit 
                                   2418 ; loop if threshold not crossed.
                                   2419 ; else stack. 
                                   2420 ; and decrement 'loop_depth' 
                                   2421 ;--------------------------------
      00235A                       2422 next: ; {var limit step retl1 -- [var limit step ] }
      009DEC 89 52 08 72      [ 1] 2423 	tnz loop_depth 
      009DF0 5F 00            [ 1] 2424 	jrne 1$ 
      009DF2 0E 6B 05         [ 2] 2425 	jp syntax_error 
      002363                       2426 1$: 
      009DF5 1F 01            [ 1] 2427 	ld a,#TK_VAR 
      009DF7 CE 00 33         [ 4] 2428 	call expect
      009DFA 1F 07 90         [ 4] 2429 	call get_addr 
                                   2430 ; check for good variable after NEXT 	 
      009DFD CE 00            [ 2] 2431 	cpw x,(CVAR,sp)
      009DFF 31 17            [ 1] 2432 	jreq 2$  
      009E01 03 93 13         [ 2] 2433 	jp syntax_error ; not the good one 
      002372                       2434 2$: 
      009E04 07 24 20         [ 2] 2435 	ldw ptr16,x 
                                   2436 	; increment variable 
      009E07 90               [ 1] 2437 	ld a,(x)
      009E08 F6 A4            [ 2] 2438 	ldw x,(1,x)  ; get var value 
      009E0A 0F 11 05         [ 2] 2439 	addw x,(FSTEP+1,sp) ; var+step 
      009E0D 26 09            [ 1] 2440 	adc a,(FSTEP,sp)
      009E0F 90 5C 1E 01      [ 4] 2441 	ld [ptr16],a
      009E13 CD 94 24 26      [ 1] 2442 	inc ptr8  
      009E17 13 CF 00 19      [ 5] 2443 	ldw [ptr16],x 
      009E18 C7 00 0C         [ 1] 2444 	ld acc24,a 
      009E18 16 03 90         [ 2] 2445 	ldw acc16,x 
      009E1B F6 A4            [ 1] 2446 	ld a,(LIMIT,sp)
      009E1D 0F C7            [ 2] 2447 	ldw x,(LIMIT+1,sp)
      009E1F 00 0F 72 B9      [ 2] 2448 	subw x,acc16 
      009E23 00 0E 20         [ 1] 2449 	sbc a,acc24
      009E26 D9 03            [ 1] 2450 	xor a,(FSTEP,sp)
      009E27 A8 80            [ 1] 2451 	xor a,#0x80
      009E27 0F 03            [ 1] 2452 	jrmi loop_back  
      009E29 0F 04            [ 2] 2453 	jra loop_done   
                                   2454 ; check sign of STEP  
      009E2B 7B 03            [ 1] 2455 	ld a,(FSTEP,sp)
      009E2B 1E 03            [ 1] 2456 	jrpl 4$
                                   2457 ;negative step
      009E2D 5B 08 90         [ 1] 2458     ld a,acc8 
      009E30 85 81            [ 1] 2459 	jrslt loop_back   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009E32 20 1A            [ 2] 2460 	jra loop_done  
      0023AD                       2461 4$: ; positive step
      009E32 72 00 00 23 05   [ 2] 2462 	btjt acc8,#7,loop_done 
      0023B2                       2463 loop_back:
      009E37 A6 06            [ 2] 2464 	ldw x,(BPTR,sp)
      009E39 CC 97 27         [ 2] 2465 	ldw basicptr,x 
      009E3C 72 01 00 22 05   [ 2] 2466 	btjf flags,#FRUN,1$ 
      009E3C 52 05            [ 1] 2467 	ld a,(2,x)
      009E3E A6 80 6B         [ 1] 2468 	ld count,a
      009E41 05 0F            [ 2] 2469 1$:	ldw x,(INW,sp)
      009E43 03 20 10         [ 2] 2470 	ldw in.w,x 
      009E46 81               [ 4] 2471 	ret 
      0023C7                       2472 loop_done:
                                   2473 	; remove loop data from stack  
      009E46 72               [ 2] 2474 	popw x
      0023C8                       2475 	_drop VSIZE 
      009E47 00 00            [ 2]    1     addw sp,#VSIZE 
      009E49 23 05 A6 06      [ 1] 2476 	dec loop_depth 
      009E4D CC               [ 2] 2477 	jp (x)
                                   2478 
                                   2479 ;----------------------------
                                   2480 ; called by goto/gosub
                                   2481 ; to get target line number 
                                   2482 ; output:
                                   2483 ;    x    line address 
                                   2484 ;---------------------------
      0023CF                       2485 get_target_line:
      009E4E 97 27 0C         [ 4] 2486 	call next_token  
      009E50 A1 84            [ 1] 2487 	cp a,#TK_INTGR
      009E50 52 05            [ 1] 2488 	jreq get_target_line_addr 
      009E52 0F 03            [ 1] 2489 	cp a,#TK_LABEL 
      009E54 0F 05            [ 1] 2490 	jreq look_target_symbol 
      009E56 CC 16 A5         [ 2] 2491 	jp syntax_error
                                   2492 ; the target is a line number 
                                   2493 ; search it. 
      0023DD                       2494 get_target_line_addr:
      009E56 CD 98            [ 2] 2495 	pushw y 
      009E58 8C A1 03         [ 4] 2496 	call get_int24 ; line # 
      009E5B 27               [ 1] 2497 	clr a
      009E5C 03 CC 97 25      [ 2] 2498 	ldw y,basicptr 
      009E60 1F 01            [ 2] 2499 	ldw y,(y)
      009E62 CD 94            [ 2] 2500 	pushw y 
      009E64 19 AB            [ 2] 2501 	cpw x,(1,sp)
      0023ED                       2502 	_drop 2  
      009E66 05 6B            [ 2]    1     addw sp,#2 
      009E68 04 CD            [ 1] 2503 	jrult 11$
      009E6A 98               [ 1] 2504 	inc a 
      0023F2                       2505 11$: ; scan program for this line# 	
      009E6B A5 7B 04         [ 4] 2506 	call search_lineno  
      009E6E 1E               [ 2] 2507 	tnzw x ; 0| line# address 
      009E6F 01 CD            [ 1] 2508 	jrne 2$ 
      009E71 9D EB            [ 1] 2509 	ld a,#ERR_NO_LINE 
      009E73 5D 27 05         [ 2] 2510 	jp tb_error 
      009E76 A6 08            [ 2] 2511 2$:	popw y  
      009E78 CC               [ 4] 2512 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   2513 
                                   2514 ; the GOTO|GOSUB target is a symbol.
                                   2515 ; output:
                                   2516 ;    X    line address|0 
      002400                       2517 look_target_symbol:
      009E79 97 27            [ 2] 2518 	pushw y 
      009E7B CE               [ 2] 2519 	pushw x 
      009E7C 00 33 7B         [ 4] 2520 	call skip_string 
      009E7F 04 1A 05 F7      [ 1] 2521 	clr acc16 
      009E83 5C 90 89 16      [ 2] 2522 	ldw y,txtbgn 
      009E87 03 CD 94         [ 1] 2523 1$:	ld a,(3,y) ; first TK_ID on line 
      009E8A 35 90            [ 1] 2524 	cp a,#TK_LABEL 
      009E8C 85 5A            [ 1] 2525 	jreq 3$ 
      009E8E 72 FB 03         [ 1] 2526 2$:	ld a,(2,y); line length 
      009E91 CF 00 33         [ 1] 2527 	ld acc8,a 
      009E94 1D 00 03 7F      [ 2] 2528 	addw y,acc16 ;point to next line 
      009E98 6F 01 6F 02      [ 2] 2529 	cpw y,txtend 
      009E9C CD 98            [ 1] 2530 	jrult 1$
      009E9E 8C A1            [ 1] 2531 	ld a,#ERR_BAD_VALUE
      009EA0 08 27 B3         [ 2] 2532 	jp tb_error 
      00242A                       2533 3$: ; found a TK_LABEL 
                                   2534 	; compare with GOTO|GOSUB target 
      009EA3 A1 32            [ 2] 2535 	pushw y ; line address 
      009EA5 26 2A CD 9C      [ 2] 2536 	addw y,#4 ; label string 
      009EA9 AF A1            [ 2] 2537 	ldw x,(3,sp) ; target string 
      009EAB 84 27 03         [ 4] 2538 	call strcmp
      009EAE CC 97            [ 1] 2539 	jrne 4$
      009EB0 25 CE            [ 2] 2540 	popw y 
      009EB2 00 33            [ 2] 2541 	jra 2$ 
      00243B                       2542 4$: ; target found 
      009EB4 1D               [ 2] 2543 	popw x ;  address line target  
      00243C                       2544 	_drop 2 ; target string 
      009EB5 00 03            [ 2]    1     addw sp,#2 
      009EB7 CF 00            [ 2] 2545 	popw y 
      009EB9 1A               [ 4] 2546 	ret
                                   2547 
                                   2548 
                                   2549 ;--------------------------------
                                   2550 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2551 ; selective goto or gosub 
                                   2552 ;--------------------------------
      002441                       2553 cmd_on:
      009EBA 90 F6 93 EE 01   [ 2] 2554 	btjt flags,#FRUN,0$ 
      009EBF 72 A9            [ 1] 2555 	ld a,#ERR_RUN_ONLY
      009EC1 00 03 72         [ 2] 2556 	jp tb_error 
      009EC4 C7 00 1A         [ 4] 2557 0$:	call expression 
      009EC7 72 5C            [ 1] 2558 	cp a,#TK_INTGR
      009EC9 00 1B            [ 1] 2559 	jreq 1$
      009ECB 72 CF 00         [ 2] 2560 	jp syntax_error
      002455                       2561 1$: _xpop
      009ECE 1A 20            [ 1]    1     ld a,(y)
      009ED0 CB               [ 1]    2     ldw x,y 
      009ED1 EE 01            [ 2]    3     ldw x,(1,x)
      009ED1 55 00 04 00      [ 2]    4     addw y,#CELL_SIZE 
                                   2562 ; the selector is the element indice 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2563 ; in the list of arguments. {1..#elements} 
      009ED5 02               [ 1] 2564 	ld a,xl ; keep only bits 7..0
      009ED6 5B 05            [ 1] 2565 	jreq 9$ ; element # begin at 1. 
      009ED8 CD               [ 1] 2566 	push a  ; selector  
      009ED9 9D 63 81         [ 4] 2567 	call next_token
      009EDC A1 80            [ 1] 2568 	cp a,#TK_CMD 
      009EDC CE 00            [ 1] 2569 	jreq 2$ 
      009EDE 1E 72 B0         [ 2] 2570 	jp syntax_error 
      00246C                       2571 2$: _get_code_addr
      009EE1 00               [ 2]    1         ldw x,(x)
      009EE2 1C 81 00 01      [ 1]    2         inc in 
      009EE4 72 5C 00 01      [ 1]    3         inc in 
                                   2572 ;; must be a GOTO or GOSUB 
      009EE4 AE 9F 23         [ 2] 2573 	cpw x,#goto 
      009EE7 CD 89            [ 1] 2574 	jreq 4$
      009EE9 DC CE 00         [ 2] 2575 	cpw x,#gosub 
      009EEC 1C 35            [ 1] 2576 	jreq 4$ 
      009EEE 10 00 0B         [ 2] 2577 	jp syntax_error 
      002482                       2578 4$: 
      009EF1 CD               [ 1] 2579 	pop a 
      009EF2 98               [ 2] 2580 	pushw x ; save routine address 	
      009EF3 D4               [ 1] 2581 	push a  ; selector  
      002485                       2582 5$: ; skip elements in list until selector==0 
      009EF4 35 0A            [ 1] 2583 	dec (1,sp)
      009EF6 00 0B            [ 1] 2584 	jreq 6$ 
                                   2585 ; can be a line# or a label 
      009EF8 AE 9F 35         [ 4] 2586 	call next_token 
      009EFB CD 89            [ 1] 2587 	cp a,#TK_INTGR 
      009EFD DC CD            [ 1] 2588 	jreq 52$
      009EFF 9E DC            [ 1] 2589 	cp a,#TK_LABEL 
      009F01 CD 98            [ 1] 2590 	jreq 54$
      009F03 D4 AE 9F         [ 2] 2591 	jp syntax_error 
      002497                       2592 52$: ; got a line number 
      009F06 46 CD 89         [ 1] 2593 	ld a,in ; skip over int24 value 
      009F09 DC CE            [ 1] 2594 	add a,#CELL_SIZE ; integer size  
      009F0B 00 1C A3         [ 1] 2595 	ld in,a 
      009F0E B9 84            [ 2] 2596 	jra 56$
      009F10 25 05 AE         [ 4] 2597 54$: call skip_string ; skip over label 	
      0024A4                       2598 56$: ; if another element comma present 
      009F13 9F 4D 20         [ 4] 2599 	call next_token
      009F16 03 AE            [ 1] 2600 	cp a,#TK_COMMA 
      009F18 9F 5E            [ 1] 2601 	jreq 5$ 
                                   2602 ; arg list exhausted, selector to big 
                                   2603 ; continue execution on next line 
      0024AB                       2604 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F1A CD 89            [ 2]    1     addw sp,#3 
      009F1C DC A6            [ 2] 2605 	jra 9$
      0024AF                       2606 6$: ;at selected position  
      0024AF                       2607 	_drop 1 ; discard selector
      009F1E 0D CD            [ 2]    1     addw sp,#1 
                                   2608 ; here only the routine address 
                                   2609 ; of GOTO|GOSUB is on stack 
      009F20 89 7F 81         [ 4] 2610     call get_target_line
      009F23 70 72 6F         [ 2] 2611 	ldw ptr16,x 	
      009F26 67 72 61 6D 20   [ 1] 2612 	mov in,count ; move to end of line  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009F2B 61               [ 2] 2613 	popw x ; cmd address, GOTO||GOSUB 
      009F2C 64 64 72         [ 2] 2614 	cpw x,#goto 
      009F2F 65 73            [ 1] 2615 	jrne 7$ 
      009F31 73 3A 20         [ 2] 2616 	ldw x,ptr16 
      009F34 00 2C            [ 2] 2617 	jra jp_to_target
      0024C7                       2618 7$: 
      009F36 20 70            [ 2] 2619 	jra gosub_2 ; target in ptr16 
      0024C9                       2620 9$: ; expr out of range skip to end of line
                                   2621     ; this will force a fall to next line  
      009F38 72 6F 67 72 61   [ 1] 2622 	mov in,count
      0024CE                       2623 	_drop 2
      009F3D 6D 20            [ 2]    1     addw sp,#2 
      009F3F 73 69 7A         [ 2] 2624 	jp next_line  
                                   2625 
                                   2626 
                                   2627 ;------------------------
                                   2628 ; BASIC: GOTO line# 
                                   2629 ; jump to line# 
                                   2630 ; here cstack is 2 call deep from interpreter 
                                   2631 ;------------------------
      0024D3                       2632 goto:
      009F42 65 3A 20 00 20   [ 2] 2633 	btjt flags,#FRUN,goto_1  
      009F47 62 79            [ 1] 2634 	ld a,#ERR_RUN_ONLY
      009F49 74 65 73         [ 2] 2635 	jp tb_error 
      0024DD                       2636 goto_1:
      009F4C 00 20 69         [ 4] 2637 	call get_target_line
      0024E0                       2638 jp_to_target:
      009F4F 6E 20 46         [ 2] 2639 	ldw basicptr,x 
      009F52 4C 41            [ 1] 2640 	ld a,(2,x)
      009F54 53 48 20         [ 1] 2641 	ld count,a 
      009F57 6D 65 6D 6F      [ 1] 2642 	mov in,#3 
      009F5B 72               [ 4] 2643 	ret 
                                   2644 
                                   2645 
                                   2646 ;--------------------
                                   2647 ; BASIC: GOSUB line#
                                   2648 ; basic subroutine call
                                   2649 ; actual line# and basicptr 
                                   2650 ; are saved on cstack
                                   2651 ; here cstack is 2 call deep from interpreter 
                                   2652 ;--------------------
                           000001  2653 	RET_ADDR=1 ; subroutine return address 
                           000003  2654 	RET_BPTR=3 ; basicptr return point 
                           000005  2655 	RET_INW=5  ; in.w return point 
                           000004  2656 	VSIZE=4 
      0024ED                       2657 gosub:
      009F5C 79 00 20 69 6E   [ 2] 2658 	btjt flags,#FRUN,gosub_1 
      009F61 20 52            [ 1] 2659 	ld a,#ERR_RUN_ONLY
      009F63 41 4D 20         [ 2] 2660 	jp tb_error 
      009F66 6D               [ 4] 2661 	ret 
      0024F8                       2662 gosub_1:
      009F67 65 6D 6F         [ 4] 2663 	call get_target_line 
      009F6A 72 79 00         [ 2] 2664 	ldw ptr16,x
      009F6D                       2665 gosub_2: 
      009F6D 72               [ 2] 2666 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      0024FF                       2667 	_vars VSIZE  
      009F6E 01 00            [ 2]    1     sub sp,#VSIZE 
      009F70 23               [ 2] 2668 	pushw x ; RET_ADDR 
                                   2669 ; save BASIC subroutine return point.   
      009F71 05 A6 07         [ 2] 2670 	ldw x,basicptr
      009F74 CC 97            [ 2] 2671 	ldw (RET_BPTR,sp),x 
      009F76 27 00 00         [ 2] 2672 	ldw x,in.w 
      009F77 1F 05            [ 2] 2673 	ldw (RET_INW,sp),x
      009F77 CD 9E DC         [ 2] 2674 	ldw x,ptr16  
      009F7A 22 01            [ 2] 2675 	jra jp_to_target
                                   2676 
                                   2677 ;------------------------
                                   2678 ; BASIC: RETURN 
                                   2679 ; exit from BASIC subroutine 
                                   2680 ;------------------------
      002511                       2681 return:
      009F7C 81 52 06 CE 00   [ 2] 2682 	btjt flags,#FRUN,0$ 
      009F81 1C 1F            [ 1] 2683 	ld a,#ERR_RUN_ONLY
      009F83 05 FE 1F         [ 2] 2684 	jp tb_error 
      00251B                       2685 0$:	
      009F86 01 AE            [ 2] 2686 	ldw x,(RET_BPTR,sp) 
      009F88 7F FF 1F         [ 2] 2687 	ldw basicptr,x
      009F8B 03 CD            [ 1] 2688 	ld a,(2,x)
      009F8D 98 8C A1         [ 1] 2689 	ld count,a  
      009F90 84 27            [ 2] 2690 	ldw x,(RET_INW,sp)
      009F92 0B 00 00         [ 2] 2691 	ldw in.w,x 
      009F93 85               [ 2] 2692 	popw x 
      00252B                       2693 	_drop VSIZE 
      009F93 A1 11            [ 2]    1     addw sp,#VSIZE 
      009F95 27               [ 2] 2694 	jp (x)
                                   2695 
                                   2696 
                                   2697 ;---------------------------------
                                   2698 ; check if A:X contain the address 
                                   2699 ; of a program in FLASH 
                                   2700 ; output:
                                   2701 ;     Z    set is progam 
                                   2702 ;----------------------------------
      00252E                       2703 is_program_addr:
      009F96 27               [ 1] 2704 	tnz a 
      009F97 55 00            [ 1] 2705 	jrne 9$
      009F99 04 00 02         [ 2] 2706 	cpw x,#app_space 
      009F9C 20 33            [ 1] 2707 	jrult 8$
      009F9E 89               [ 2] 2708 	pushw x 
      009F9E CD 98 BE         [ 4] 2709 	call qsign 
      009FA1 1F               [ 2] 2710 	popw x 
      009FA2 01 01            [ 1] 2711 	jreq 9$ 
      009FA3 43               [ 1] 2712 8$:	cpl a ; clr Z bit  
      009FA3 90               [ 4] 2713 9$:	ret 
                                   2714 
                                   2715 ;----------------------------------
                                   2716 ; BASIC: RUN [label]
                                   2717 ; run BASIC program in RAM
                                   2718 ;----------------------------------- 
      00253F                       2719 cmd_run: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009FA4 89 4F CD 8C C5   [ 2] 2720 	btjf flags,#FRUN,0$  
      009FA9 5D               [ 1] 2721 	clr a 
      009FAA 26               [ 4] 2722 	ret
      002546                       2723 0$: ; check for STOP condition 
      009FAB 01 93 90 85 1F   [ 2] 2724 	btjf flags,#FBREAK,1$
      00254B                       2725 	_drop 2 
      009FB0 05 CD            [ 2]    1     addw sp,#2 
      009FB2 98 8C A1         [ 4] 2726 	call rest_context
      002550                       2727 	_drop CTXT_SIZE 
      009FB5 11 27            [ 2]    1     addw sp,#CTXT_SIZE 
      009FB7 06 1E 01 1F      [ 1] 2728 	bres flags,#FBREAK 
      009FBB 03 20 13 22      [ 1] 2729 	bset flags,#FRUN 
      009FBE CC 17 50         [ 2] 2730 	jp interpreter 
      00255D                       2731 1$:	; check for label option 
      009FBE CD 98 8C         [ 4] 2732 	call next_token 
      009FC1 A1 84            [ 1] 2733 	cp a,#TK_LABEL 
      009FC3 27 07            [ 1] 2734 	jrne 3$
      009FC5 55               [ 2] 2735 	pushw x 
      009FC6 00 04 00         [ 4] 2736 	call skip_string 
      009FC9 02               [ 2] 2737 	popw x  
      009FCA 20 05 43         [ 4] 2738 	call search_program
      009FCC 26 05            [ 1] 2739 	jrne 2$
      009FCC CD 98            [ 1] 2740 	ld a,#ERR_NO_PROGRAM
      009FCE BE 1F 03         [ 2] 2741 	jp tb_error 
      009FD1 CF 00 1B         [ 2] 2742 2$: ldw txtbgn,x 
      009FD1 1E 05 E6         [ 2] 2743 	subw x,#2 
      009FD4 02               [ 2] 2744 	ldw x,(x)
      009FD5 CD A0 76 1E      [ 2] 2745 	addw x,txtbgn 
      009FD9 05 E6 02         [ 2] 2746 	ldw txtend,x 
      009FDC C7 00            [ 2] 2747 	jra run_it 	
      002583                       2748 3$:	_unget_token 
      009FDE 0F 72 5F 00 0E   [ 1]    1      mov in,in.saved  
      009FE3 72 BB 00         [ 2] 2749 	ldw x,txtbgn
      009FE6 0E C3 00         [ 2] 2750 	cpw x,txtend 
      009FE9 1E 2A            [ 1] 2751 	jrmi run_it 
      009FEB 07 1F 05         [ 2] 2752 	ldw x,#err_no_prog
      009FEE FE 13 03         [ 4] 2753 	call puts 
      009FF1 2D DE 02 00 01   [ 1] 2754 	mov in,count
      009FF3 81               [ 4] 2755 	ret 
      00259C                       2756 run_it:	 
      00259C                       2757 	_drop 2 ; drop return address 
      009FF3 55 00            [ 2]    1     addw sp,#2 
      00259E                       2758 run_it_02: 
      009FF5 03 00 02         [ 4] 2759     call ubound 
      009FF8 AE 16 B8         [ 4] 2760 	call clear_vars
                                   2761 ; initialize DIM variables pointers 
      009FFB CF 00 05         [ 2] 2762 	ldw x,txtend 
      009FFE 5B 06 CD         [ 2] 2763 	ldw dvar_bgn,x 
      00A001 9E E4 72         [ 2] 2764 	ldw dvar_end,x 	 
                                   2765 ; clear data pointer 
      00A004 0D               [ 1] 2766 	clrw x 
      00A005 00 23 06         [ 2] 2767 	ldw data_ptr,x 
      00A008 AE A0 0F CD      [ 1] 2768 	clr data_ofs 
      00A00C 89 DC 00 09      [ 1] 2769 	clr data_len 
                                   2770 ; initialize BASIC pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A00E CE 00 1B         [ 2] 2771 	ldw x,txtbgn 
      00A00E 81 57 41         [ 2] 2772 	ldw basicptr,x 
      00A011 52 4E            [ 1] 2773 	ld a,(2,x)
      00A013 49 4E 47         [ 1] 2774 	ld count,a
      00A016 3A 20 6C 69      [ 1] 2775 	mov in,#3	
      00A01A 6E 65 73 20      [ 1] 2776 	bset flags,#FRUN 
      00A01E 6D 69 73         [ 2] 2777 	jp interpreter 
                                   2778 
                                   2779 
                                   2780 ;----------------------
                                   2781 ; BASIC: END
                                   2782 ; end running program
                                   2783 ;---------------------- 
                           000001  2784 	CHAIN_BP=1 
                           000003  2785 	CHAIN_IN=3
                           000005  2786 	CHAIN_TXTBGN=5
                           000007  2787 	CHAIN_TXTEND=7
                           000008  2788 	CHAIN_CNTX_SIZE=8  
      0025CF                       2789 cmd_end: 
      0025CF                       2790 	_drop 2 ; no need for return address 
      00A021 73 69            [ 2]    1     addw sp,#2 
                                   2791 ; check for chained program 
      00A023 6E 67 20 69      [ 1] 2792 	tnz chain_level
      00A027 6E 20            [ 1] 2793 	jreq 8$
                                   2794 ; restore chain context 
      00A029 74 68 69 73      [ 1] 2795 	dec chain_level 
      00A02D 20 70            [ 2] 2796 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      00A02F 72 6F 67         [ 2] 2797 	ldw basicptr,x 
      00A032 72 61            [ 2] 2798 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      00A034 6D 2E 0A         [ 2] 2799 	ldw in,x 
      00A037 00 05            [ 2] 2800 	ldw x,(CHAIN_TXTBGN,sp)
      00A038 CF 00 1B         [ 2] 2801 	ldw txtbgn,x 
      00A038 A6 03            [ 2] 2802 	ldw x,(CHAIN_TXTEND,sp)
      00A03A CD 9A 42         [ 2] 2803 	ldw txtend,x 
      0025EF                       2804 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A03D 89 CD            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A03F 98 A5 85         [ 2] 2805 	jp interpreter 
      0025F4                       2806 8$: ; clean stack 
      00A042 CD B2 C3         [ 2] 2807 	ldw x,#STACK_EMPTY
      00A045 26               [ 1] 2808 	ldw sp,x 
      00A046 06 AE 00         [ 2] 2809 	jp warm_start
                                   2810 
                                   2811 ;---------------------------
                                   2812 ; BASIC: GET var 
                                   2813 ; receive a key in variable 
                                   2814 ; don't wait 
                                   2815 ;---------------------------
      0025FB                       2816 cmd_get:
      00A049 12 CC 97         [ 4] 2817 	call next_token 
      00A04C 27 90            [ 1] 2818 	cp a,#TK_VAR 
      00A04E 89 90            [ 1] 2819 	jreq 0$
      00A050 93 1D 00         [ 2] 2820 	jp syntax_error 
      00A053 04 EE 02         [ 4] 2821 0$: call get_addr 
      00A056 1C 00 04         [ 2] 2822 	ldw ptr16,x 
      00A059 CF 00 0E         [ 4] 2823 	call qgetc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A05C AE 00            [ 1] 2824 	jreq 2$
      00A05E 8C 72 A2         [ 4] 2825 	call getc  
      00A061 00 04 CD 94      [ 4] 2826 2$: clr [ptr16]
      00A065 45 AE 00 90      [ 1] 2827 	inc ptr8 
      00A069 CF 00 1C 72      [ 4] 2828 	clr [ptr16]
      00A06D BB 00 8E CF      [ 1] 2829 	inc ptr8 
      00A071 00 1E 90 85      [ 4] 2830 	ld [ptr16],a 
      00A075 81               [ 4] 2831 	ret 
                                   2832 
                                   2833 
                                   2834 ;-----------------
                                   2835 ; 1 Khz beep 
                                   2836 ;-----------------
      00A076                       2837 beep_1khz:: 
      00A076 90 89            [ 2] 2838 	pushw y 
      00A078 C7 00 03         [ 2] 2839 	ldw x,#100
      00A07B E6 02 C1 00      [ 2] 2840 	ldw y,#1000
      00A07F 03 2A            [ 2] 2841 	jra beep
                                   2842 
                                   2843 ;-----------------------
                                   2844 ; BASIC: TONE expr1,expr2
                                   2845 ; used TIMER2 channel 1
                                   2846 ; to produce a tone 
                                   2847 ; arguments:
                                   2848 ;    expr1   frequency 
                                   2849 ;    expr2   duration msec.
                                   2850 ;---------------------------
      002633                       2851 tone:
      00A081 03 C7            [ 2] 2852 	pushw y 
      00A083 00 03 CF         [ 4] 2853 	call arg_list 
      00A086 00 05            [ 1] 2854 	cp a,#2 
      00A088 90 AE            [ 1] 2855 	jreq 1$
      00A08A 16 68 CD         [ 2] 2856 	jp syntax_error 
      00263F                       2857 1$: 
      00263F                       2858 	_xpop 
      00A08D 92 35            [ 1]    1     ld a,(y)
      00A08F CD               [ 1]    2     ldw x,y 
      00A090 89 DC            [ 2]    3     ldw x,(1,x)
      00A092 A6 0D CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00A096 7F               [ 2] 2859 	pushw x ; duration 
      002649                       2860 	_xpop ; frequency
      00A097 90 85            [ 1]    1     ld a,(y)
      00A099 81               [ 1]    2     ldw x,y 
      00A09A EE 01            [ 2]    3     ldw x,(1,x)
      00A09A 52 01 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A09C 90 93            [ 1] 2861 	ldw y,x ; frequency 
      00A09C 0F               [ 2] 2862 	popw x  ; duration 
      002655                       2863 beep:  
      00A09D 01               [ 2] 2864 	pushw x 
      00A09E AE F4 24         [ 2] 2865 	ldw x,#TIM2_CLK_FREQ
      00A09E CD               [ 2] 2866 	divw x,y ; cntr=Fclk/freq 
                                   2867 ; round to nearest integer 
      00A09F 98 8C A1 02      [ 2] 2868 	cpw y,#TIM2_CLK_FREQ/2
      00A0A3 25 08            [ 1] 2869 	jrmi 2$
      00A0A5 A1               [ 1] 2870 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      002661                       2871 2$:	 
      00A0A6 0A               [ 1] 2872 	ld a,xh 
      00A0A7 27 04 A1         [ 1] 2873 	ld TIM2_ARRH,a 
      00A0AA 80               [ 1] 2874 	ld a,xl 
      00A0AB 26 07 0E         [ 1] 2875 	ld TIM2_ARRL,a 
                                   2876 ; 50% duty cycle 
      00A0AD 8C               [ 1] 2877 	ccf 
      00A0AD 55               [ 2] 2878 	rrcw x 
      00A0AE 00               [ 1] 2879 	ld a,xh 
      00A0AF 04 00 02         [ 1] 2880 	ld TIM2_CCR1H,a 
      00A0B2 20               [ 1] 2881 	ld a,xl
      00A0B3 63 53 10         [ 1] 2882 	ld TIM2_CCR1L,a
      00A0B4 72 10 53 08      [ 1] 2883 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A0B4 A1 02 27 12      [ 1] 2884 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A0B8 A1 04 27 1B      [ 1] 2885 	bset TIM2_EGR,#TIM2_EGR_UG
      00A0BC A1               [ 2] 2886 	popw x 
      00A0BD 82 27 1F         [ 4] 2887 	call pause02
      00A0C0 A1 08 27 2A      [ 1] 2888 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A0C4 A1 09 27 2A      [ 1] 2889 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A0C8 20 3D            [ 2] 2890 	popw y 
      00A0CA 81               [ 4] 2891 	ret 
                                   2892 
                                   2893 ;-------------------------------
                                   2894 ; BASIC: ADCON 0|1 [,divisor]  
                                   2895 ; disable/enanble ADC 
                                   2896 ;-------------------------------
                           000003  2897 	ONOFF=3 
                           000001  2898 	DIVSOR=1
                           000004  2899 	VSIZE=4 
      00268E                       2900 power_adc:
      00A0CA CD 89 DC         [ 4] 2901 	call arg_list 
      00A0CD 5C 72            [ 1] 2902 	cp a,#2	
      00A0CF B0 00            [ 1] 2903 	jreq 1$
      00A0D1 05 CF            [ 1] 2904 	cp a,#1 
      00A0D3 00 01            [ 1] 2905 	jreq 0$ 
      00A0D5 20 C5 A5         [ 2] 2906 	jp syntax_error 
      00A0D7 4F               [ 1] 2907 0$:	clr a 
      00A0D7 CD               [ 1] 2908 	clrw x
      00269E                       2909 	_xpush   ; divisor  
      00A0D8 98 CE CD 89      [ 2]    1     subw y,#CELL_SIZE
      00A0DC 7F 20            [ 1]    2     ld (y),a 
      00A0DE BD EF 01         [ 2]    3     ldw (1,y),x 
      00A0DF                       2910 1$: _at_next 
      00A0DF FE 72 5C         [ 1]    1     ld a,(3,y)
      00A0E2 00               [ 1]    2     ldw x,y 
      00A0E3 02 72            [ 2]    3     ldw x,(4,x)
      00A0E5 5C               [ 2] 2911 	tnzw x 
      00A0E6 00 02            [ 1] 2912 	jreq 2$ 
      0026B0                       2913 	_xpop
      00A0E8 FD CD            [ 1]    1     ld a,(y)
      00A0EA 89               [ 1]    2     ldw x,y 
      00A0EB 7F 20            [ 2]    3     ldw x,(1,x)
      00A0ED AE A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0EE                       2914 	_xdrop  
      00A0EE 03 01 20 AC      [ 2]    1     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A0F2 9F               [ 1] 2915 	ld a,xl
      00A0F2 CD 98            [ 1] 2916 	and a,#7
      00A0F4 8C               [ 1] 2917 	swap a 
      00A0F5 A1 84 27         [ 1] 2918 	ld ADC_CR1,a
      00A0F8 03 CC 97 25      [ 1] 2919 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0FC 72 10 54 01      [ 1] 2920 	bset ADC_CR1,#ADC_CR1_ADON 
      0026CC                       2921 	_usec_dly 7 
      00A0FC CD 98 BE         [ 2]    1     ldw x,#(16*7-2)/4
      00A0FF 9F               [ 2]    2     decw x
      00A100 A4               [ 1]    3     nop 
      00A101 0F C7            [ 1]    4     jrne .-4
      00A103 00 24            [ 2] 2922 	jra 3$
      00A105 20 95 54 01      [ 1] 2923 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A107 72 17 50 CA      [ 1] 2924 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0026DD                       2925 3$:	
      00A107 55               [ 4] 2926 	ret
                                   2927 
                                   2928 ;-----------------------------
                                   2929 ; BASIC: ADCREAD (channel)
                                   2930 ; read adc channel {0..5}
                                   2931 ; output:
                                   2932 ;   A 		TK_INTGR 
                                   2933 ;   X 		value 
                                   2934 ;-----------------------------
      0026DE                       2935 analog_read:
      00A108 00 04 00         [ 4] 2936 	call func_args 
      00A10B 02 CD            [ 1] 2937 	cp a,#1 
      00A10D 9C AF            [ 1] 2938 	jreq 1$
      00A10F 4D 27 05         [ 2] 2939 	jp syntax_error
      0026E8                       2940 1$: _xpop 
      00A112 CD 98            [ 1]    1     ld a,(y)
      00A114 F9               [ 1]    2     ldw x,y 
      00A115 20 85            [ 2]    3     ldw x,(1,x)
      00A117 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A117 0D 01 26         [ 2] 2941 	cpw x,#5 
      00A11A 05 A6            [ 2] 2942 	jrule 2$
      00A11C 0D CD            [ 1] 2943 	ld a,#ERR_BAD_VALUE
      00A11E 89 7F 5B         [ 2] 2944 	jp tb_error 
      00A121 01               [ 1] 2945 2$: ld a,xl
      00A122 81 00 0E         [ 1] 2946 	ld acc8,a 
      00A123 A6 05            [ 1] 2947 	ld a,#5
      00A123 CE 00 05         [ 1] 2948 	sub a,acc8 
      00A126 1F 03 C6         [ 1] 2949 	ld ADC_CSR,a
      00A129 00 02 6B 05      [ 1] 2950 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A12D C6 00 03 6B      [ 1] 2951 	bset ADC_CR1,#ADC_CR1_ADON
      00A131 06 81 54 00 FB   [ 2] 2952 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A133 CE 54 04         [ 2] 2953 	ldw x,ADC_DRH
      00A133 1E 03            [ 1] 2954 	ld a,#TK_INTGR
      00A135 CF               [ 4] 2955 	ret 
                                   2956 
                                   2957 ;-----------------------
                                   2958 ; BASIC: DREAD(pin)
                                   2959 ; Arduino pins 
                                   2960 ; read state of a digital pin 
                                   2961 ; pin# {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   2962 ; output:
                                   2963 ;    A 		TK_INTGR
                                   2964 ;    X      0|1 
                                   2965 ;-------------------------
                           000001  2966 	PINNO=1
                           000001  2967 	VSIZE=1
      00271A                       2968 digital_read:
      00271A                       2969 	_vars VSIZE 
      00A136 00 05            [ 2]    1     sub sp,#VSIZE 
      00A138 7B 05 C7         [ 4] 2970 	call func_args
      00A13B 00 02            [ 1] 2971 	cp a,#1
      00A13D 7B 06            [ 1] 2972 	jreq 1$
      00A13F C7 00 03         [ 2] 2973 	jp syntax_error
      002726                       2974 1$: _xpop 
      00A142 81 F6            [ 1]    1     ld a,(y)
      00A143 93               [ 1]    2     ldw x,y 
      00A143 90 89            [ 2]    3     ldw x,(1,x)
      00A145 52 05 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A147 A3 00 0F         [ 2] 2975 	cpw x,#15 
      00A147 0F 05            [ 2] 2976 	jrule 2$
      00A149 CD 98            [ 1] 2977 	ld a,#ERR_BAD_VALUE
      00A14B 8C A1 02         [ 2] 2978 	jp tb_error 
      00A14E 26 10 CD         [ 4] 2979 2$:	call select_pin 
      00A151 89 DC            [ 1] 2980 	ld (PINNO,sp),a
      00A153 5C 72            [ 1] 2981 	ld a,(GPIO_IDR,x)
      00A155 B0 00            [ 1] 2982 	tnz (PINNO,sp)
      00A157 05 CF            [ 1] 2983 	jreq 8$
      00A159 00               [ 1] 2984 3$: srl a 
      00A15A 01 03            [ 1] 2985 	dec (PINNO,sp)
      00A15C 05 CD            [ 1] 2986 	jrne 3$ 
      00A15E 98 8C            [ 1] 2987 8$: and a,#1 
      00A160 A1               [ 1] 2988 	clrw x 
      00A161 85               [ 1] 2989 	ld xl,a 
      00A162 27               [ 1] 2990 	clr a 
      00274E                       2991 	_drop VSIZE
      00A163 03 CC            [ 2]    1     addw sp,#VSIZE 
      00A165 97               [ 4] 2992 	ret
                                   2993 
                                   2994 
                                   2995 ;-----------------------
                                   2996 ; BASIC: DWRITE pin,0|1
                                   2997 ; Arduino pins 
                                   2998 ; write to a digital pin 
                                   2999 ; pin# {0..15}
                                   3000 ; output:
                                   3001 ;    A 		TK_INTGR
                                   3002 ;    X      0|1 
                                   3003 ;-------------------------
                           000001  3004 	PINNO=1
                           000002  3005 	PINVAL=2
                           000002  3006 	VSIZE=2
      002751                       3007 digital_write:
      002751                       3008 	_vars VSIZE 
      00A166 25 CD            [ 2]    1     sub sp,#VSIZE 
      00A168 98 B4 CF         [ 4] 3009 	call arg_list  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A16B 00 1A            [ 1] 3010 	cp a,#2 
      00A16D 0D 05            [ 1] 3011 	jreq 1$
      00A16F 26 06 CD         [ 2] 3012 	jp syntax_error
      00275D                       3013 1$: _xpop 
      00A172 92 2B            [ 1]    1     ld a,(y)
      00A174 CD               [ 1]    2     ldw x,y 
      00A175 89 7F            [ 2]    3     ldw x,(1,x)
      00A177 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A177 A6               [ 1] 3014 	ld a,xl 
      00A178 3A CD            [ 1] 3015 	ld (PINVAL,sp),a
      002769                       3016 	_xpop 
      00A17A 89 7F            [ 1]    1     ld a,(y)
      00A17C CD               [ 1]    2     ldw x,y 
      00A17D A1 23            [ 2]    3     ldw x,(1,x)
      00A17F 72 5F 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A183 CD 8A E1         [ 2] 3017 	cpw x,#15 
      00A186 AE 16            [ 2] 3018 	jrule 2$
      00A188 68 3B            [ 1] 3019 	ld a,#ERR_BAD_VALUE
      00A18A 00 03 4B         [ 2] 3020 	jp tb_error 
      00A18D 00 72 FB         [ 4] 3021 2$:	call select_pin 
      00A190 01 5C            [ 1] 3022 	ld (PINNO,sp),a 
      00A192 5B 02            [ 1] 3023 	ld a,#1
      00A194 72 5F            [ 1] 3024 	tnz (PINNO,sp)
      00A196 00 02            [ 1] 3025 	jreq 4$
      00A198 CD               [ 1] 3026 3$: sll a
      00A199 8F 75            [ 1] 3027 	dec (PINNO,sp)
      00A19B A1 84            [ 1] 3028 	jrne 3$
      00A19D 27 14            [ 1] 3029 4$: tnz (PINVAL,sp)
      00A19F A1 11            [ 1] 3030 	jrne 5$
      00A1A1 26               [ 1] 3031 	cpl a 
      00A1A2 07 CD            [ 1] 3032 	and a,(GPIO_ODR,x)
      00A1A4 8F 75            [ 2] 3033 	jra 8$
      00A1A6 A1 84            [ 1] 3034 5$: or a,(GPIO_ODR,x)
      00A1A8 27 06            [ 1] 3035 8$: ld (GPIO_ODR,x),a 
      00A1AA                       3036 	_drop VSIZE 
      00A1AA CD A1            [ 2]    1     addw sp,#VSIZE 
      00A1AC 33               [ 4] 3037 	ret
                                   3038 
                                   3039 
                                   3040 ;-----------------------
                                   3041 ; BASIC: STOP
                                   3042 ; stop progam execution  
                                   3043 ; without resetting pointers 
                                   3044 ; the program is resumed
                                   3045 ; with RUN 
                                   3046 ;-------------------------
      00279C                       3047 stop:
      00A1AD CC 97 25 22 02   [ 2] 3048 	btjt flags,#FRUN,2$
      00A1B0 4F               [ 1] 3049 	clr a
      00A1B0 CD               [ 4] 3050 	ret 
      0027A3                       3051 2$:	 
                                   3052 ; create space on cstack to save context 
      00A1B1 82 9D CA         [ 2] 3053 	ldw x,#break_point 
      00A1B3 CD 09 5C         [ 4] 3054 	call puts 
      0027A9                       3055 	_drop 2 ;drop return address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A1B3 C6 00            [ 2]    1     addw sp,#2 
      0027AB                       3056 	_vars CTXT_SIZE ; context size 
      00A1B5 0D CE            [ 2]    1     sub sp,#CTXT_SIZE 
      00A1B7 00 0E 72         [ 4] 3057 	call save_context 
      00A1BA C7 00 1A         [ 2] 3058 	ldw x,#tib 
      00A1BD 72 5C 00         [ 2] 3059 	ldw basicptr,x
      00A1C0 1B               [ 1] 3060 	clr (x)
      00A1C1 72 CF 00 1A      [ 1] 3061 	clr count  
      00A1C5 CD               [ 1] 3062 	clrw x 
      00A1C6 A1 33 CD         [ 2] 3063 	ldw in.w,x
      00A1C9 98 8C A1 08      [ 1] 3064 	bres flags,#FRUN 
      00A1CD 26 03 CC A1      [ 1] 3065 	bset flags,#FBREAK
      00A1D1 47 17 50         [ 2] 3066 	jp interpreter 
      00A1D2 0A 62 72 65 61 6B 20  3067 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3068 
                                   3069 ;-----------------------
                                   3070 ; BASIC: NEW
                                   3071 ; from command line only 
                                   3072 ; free program memory
                                   3073 ; and clear variables 
                                   3074 ;------------------------
      0027E8                       3075 new: 
      00A1D2 A1 00 27 07 A1   [ 2] 3076 	btjf flags,#FRUN,0$ 
      00A1D7 0A               [ 4] 3077 	ret 
      00A1D8 27 03 CC 97      [ 1] 3078 0$:	clr flags 
      00A1DC 25 14 B1         [ 4] 3079 	call clear_basic 
      00A1DD 81               [ 4] 3080 	ret 
                                   3081 
                                   3082 ;-----------------------------------
                                   3083 ; erase program at specified address
                                   3084 ; keep signature and size fields. 
                                   3085 ; signature replaced by "XX"
                                   3086 ; input:
                                   3087 ;    X    address 
                                   3088 ;-----------------------------------
                           000001  3089 	ADDR=1    ; program address
                           000003  3090 	PRG_SIZE=3    ; program size 
                           000005  3091 	BLOCKS=5 ; blocks to erase 
                           000006  3092 	VSIZE=6
      0027F6                       3093 erase_program:
      00A1DD 5B               [ 2] 3094 	pushw x 
      00A1DE 05 90 85         [ 4] 3095 	call skip_string 
      00A1E1 81               [ 2] 3096 	popw x 
      00A1E2 CD 32 43         [ 4] 3097 	call search_program 
      00A1E2 55 00            [ 1] 3098 	jreq 9$
      00A1E4 03 00 02         [ 4] 3099 	call move_erase_to_ram
      00A1E7 81 5F 00 18      [ 1] 3100 	clr farptr 
      00A1E8                       3101 	_vars VSIZE 
      00A1E8 52 04            [ 2]    1     sub sp,#VSIZE 
      00A1EA 0F 01 CD         [ 2] 3102 1$:	subw x,#4 
      00A1ED 9A 54            [ 2] 3103 	ldw (ADDR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A1EF A1 02            [ 2] 3104 	ldw x,(2,x)
      00A1F1 24 03            [ 2] 3105 	ldw (PRG_SIZE,sp),x
      00A1F3 CC 97            [ 1] 3106 	ld a,#BLOCK_SIZE 
      00A1F5 25               [ 2] 3107 	div x,a 
      00A1F6 A1               [ 1] 3108 	tnz a 
      00A1F7 03 25            [ 1] 3109 	jreq 2$ 
      00A1F9 0C               [ 1] 3110 	incw x 
      00A1FA 90 F6            [ 2] 3111 2$:	ldw (BLOCKS,sp),x 
      00A1FC 93 EE            [ 2] 3112 	ldw x,(ADDR,sp)
      00A1FE 01 72 A9         [ 2] 3113 	ldw ptr16,x 
      00A201 00 03 9F         [ 4] 3114 3$:	call block_erase
      00A204 6B 01 90         [ 2] 3115 	ldw x,#BLOCK_SIZE 
      00A207 F6 93 EE         [ 4] 3116 	call incr_farptr
      00A20A 01 72            [ 2] 3117 	ldw x,(BLOCKS,sp)
      00A20C A9               [ 2] 3118 	decw x 
      00A20D 00 03            [ 2] 3119 	ldw (BLOCKS,sp),x 
      00A20F 9F 6B            [ 1] 3120 	jrne 3$ 
                                   3121 ; write XX and size at addr 
      00A211 02 90            [ 2] 3122 	ldw x,(ADDR,sp)
      00A213 F6 93 EE         [ 2] 3123 	ldw ptr16,x 
      00A216 01 72            [ 1] 3124 	ld a,#'X 
      00A218 A9               [ 1] 3125 	clrw x 
      00A219 00 03 F6         [ 4] 3126 	call write_byte 
      00A21C 14 02 18         [ 4] 3127 	call write_byte 
      00A21F 01 27            [ 1] 3128 	ld a,(PRG_SIZE,sp)
      00A221 F9 5B 04         [ 4] 3129 	call write_byte 
      00A224 81 04            [ 1] 3130 	ld a,(PRG_SIZE+1,sp)
      00A225 CD 07 8B         [ 4] 3131 	call write_byte 
      002848                       3132 	_drop VSIZE 
      00A225 CD 9A            [ 2]    1     addw sp,#VSIZE 
      00284A                       3133 9$:	
      00A227 54               [ 4] 3134 	ret 
                                   3135 
                                   3136 ;-----------------------------------
                                   3137 ; BASIC: ERASE \E | \F || address
                                   3138 ; erase all block in range from 
                                   3139 ;  'app_space' to FLASH end (0x27fff)
                                   3140 ;  or all EEPROM 
                                   3141 ; that contains a non zero byte. 
                                   3142 ; if the argument is an address  
                                   3143 ; mark the program at this address 
                                   3144 ; as erased. Erase the blocks 
                                   3145 ; replace signature by 'XX' and 
                                   3146 ; keep size field.  
                                   3147 ;-----------------------------------
                           000001  3148 	LIMIT=1 
                           000003  3149 	VSIZE = 3 
      00284B                       3150 cmd_erase:
      00A228 A1 02 27 03 CC   [ 2] 3151 	btjf flags,#FRUN,eras0
      00A22D 97 25            [ 1] 3152 	ld a,#ERR_CMD_ONLY
      00A22F CC 16 A7         [ 2] 3153 	jp tb_error 
      002855                       3154 eras0:	
      00A22F 90 F6 93 EE      [ 1] 3155 	clr farptr 
      00A233 01 72 A9         [ 4] 3156 	call next_token
      00A236 00 03            [ 1] 3157 	cp a,#TK_LABEL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A238 9F 88            [ 1] 3158 	jreq erase_program  
      002860                       3159 	_vars VSIZE 
      00A23A 90 F6            [ 2]    1     sub sp,#VSIZE 
      00A23C 93 EE            [ 1] 3160 	cp a,#TK_CHAR 
      00A23E 01 72            [ 1] 3161 	jreq 0$ 
      00A240 A9 00 03         [ 2] 3162 	jp syntax_error
      00A243 84 FA F7         [ 4] 3163 0$: call get_char 
      00A246 81 DF            [ 1] 3164 	and a,#0XDF 
      00A247 A1 45            [ 1] 3165 	cp a,#'E
      00A247 CD 9A            [ 1] 3166 	jrne 1$
      00A249 54 A1 02         [ 2] 3167 	ldw x,#EEPROM_BASE 
      00A24C 27 03 CC         [ 2] 3168 	ldw farptr+1,x 
      00A24F 97 25 FF         [ 2] 3169 	ldw x,#EEPROM_END
      00A251 4F               [ 1] 3170 	clr a 
      00A251 90 F6            [ 2] 3171 	jra 3$ 
      00A253 93 EE            [ 1] 3172 1$: cp a,#'F 
      00A255 01 72            [ 1] 3173 	jreq 2$
      00A257 A9 00 03         [ 2] 3174 	ldw x,#err_bad_value
      00A25A 9F 43 88         [ 2] 3175 	jp tb_error
      002888                       3176 2$:
      00A25D 90 F6 93         [ 2] 3177 	ldw x,#app_space  
      00A260 EE 01 72         [ 2] 3178 	ldw farptr+1,x 
      00A263 A9 00            [ 1] 3179 	ld a,#(FLASH_END>>16)&0XFF 
      00A265 03 84 F4         [ 2] 3180 	ldw x,#FLASH_END&0xffff
      002893                       3181 3$:
      00A268 F7 81            [ 1] 3182 	ld (LIMIT,sp),a 
      00A26A 1F 02            [ 2] 3183 	ldw (LIMIT+1,sp),x 
                                   3184 ; operation done from RAM
                                   3185 ; copy code to RAM in tib   
      00A26A CD 9A 54         [ 4] 3186 	call move_erase_to_ram
      00289A                       3187 4$:	 
      00A26D A1 02 27         [ 4] 3188     call scan_block 
      00A270 03 CC            [ 1] 3189 	jreq 5$  ; block already erased 
      00A272 97 25            [ 1] 3190     ld a,#'E 
      00A274 90 F6 93         [ 4] 3191     call putc 
      00A277 EE 01 72         [ 4] 3192 	call block_erase   
                                   3193 ; this block is clean, next  
      00A27A A9 00 03         [ 2] 3194 5$:	ldw x,#BLOCK_SIZE
      00A27D 9F 88 90         [ 4] 3195 	call incr_farptr
                                   3196 ; check limit, 24 bit substraction  	
      00A280 F6 93            [ 1] 3197 	ld a,(LIMIT,sp)
      00A282 EE 01            [ 2] 3198 	ldw x,(LIMIT+1,sp)
      00A284 72 A9 00 03      [ 2] 3199 	subw x,farptr+1
      00A288 84 F8 F7         [ 1] 3200 	sbc a,farptr 
      00A28B 81 E0            [ 1] 3201 	jrugt 4$ 
      00A28C CD 14 B1         [ 4] 3202 9$: call clear_basic
      00A28C CD 9A            [ 2] 3203 	ldw x,(LIMIT+1,sp)
      00A28E 4F A1 02         [ 2] 3204 	cpw x,#EEPROM_END
      00A291 27 03            [ 1] 3205 	jrne 10$
      00A293 CC 97 25         [ 4] 3206 	call func_eefree 
      00A296                       3207 10$:
      0028C7                       3208 	_drop VSIZE 
      00A296 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A298 93               [ 4] 3209 	ret 
                                   3210 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3211 
                                   3212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3213 ;  check for application signature 
                                   3214 ; input:
                                   3215 ;	x       address to check 
                                   3216 ; output:
                                   3217 ;   Z      1  signature present 
                                   3218 ;          0 not app signature  
                                   3219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028CA                       3220 qsign: 
      00A299 EE               [ 2] 3221 	pushw x 
                                   3222 ; align to block 
      00A29A 01               [ 1] 3223 	ld a,xl 
      00A29B 72 A9            [ 1] 3224 	and a,#BLOCK_SIZE 
      00A29D 00               [ 1] 3225 	ld xl,a 
      00A29E 03               [ 2] 3226 	ldw x,(x)
      00A29F 9F A4 07         [ 2] 3227 	cpw x,SIGNATURE ; "TB" 
      00A2A2 88               [ 2] 3228 	popw x 
      00A2A3 A6               [ 4] 3229 	ret 
                                   3230 
                                   3231 ;--------------------------------------
                                   3232 ;  fill write buffer 
                                   3233 ;  input:
                                   3234 ;    y  point to output buffer 
                                   3235 ;    x  point to source 
                                   3236 ;    a  bytes to write in buffer 
                                   3237 ;  output:
                                   3238 ;    y   += A 
                                   3239 ;    X   += A 
                                   3240 ;    A   0 
                                   3241 ;---------------------------------------
      0028D5                       3242 fill_write_buffer:
      00A2A4 01               [ 1] 3243 	push a 
      00A2A5 0D               [ 1] 3244 	tnz a 
      00A2A6 01 27            [ 1] 3245 	jreq 9$ 
      00A2A8 05               [ 1] 3246 1$: ld a,(x)
      00A2A9 48               [ 1] 3247 	incw x 
      00A2AA 0A 01            [ 1] 3248 	ld (y),a 
      00A2AC 20 F7            [ 1] 3249 	incw y 
      00A2AE 6B 01            [ 1] 3250 	dec (1,sp) 
      00A2B0 90 F6            [ 1] 3251 	jrne 1$ 
      00A2B2 93               [ 1] 3252 9$:	pop a 
      00A2B3 EE               [ 4] 3253     ret 	
                                   3254 
                                   3255 ;--------------------------------------
                                   3256 ;  fill pad buffer with zero 
                                   3257 ;  input:
                                   3258 ;	none 
                                   3259 ;  output:
                                   3260 ;    y     buffer address  
                                   3261 ;--------------------------------------
      0028E5                       3262 clear_block_buffer:
      00A2B4 01               [ 1] 3263 	push a 
      00A2B5 72 A9 00 03      [ 2] 3264 	ldw y,#block_buffer 
      00A2B9 84 F4            [ 2] 3265 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A2BB 27 02            [ 1] 3266 	ld a,#BLOCK_SIZE   
      00A2BD A6 01            [ 1] 3267 1$:	clr (y)
      00A2BF 5F 97            [ 1] 3268 	incw y
      00A2C1 4F               [ 1] 3269 	dec a  
      00A2C2 81 F9            [ 1] 3270 	jrne 1$ 	
      00A2C3 90 85            [ 2] 3271 9$: popw y 
      00A2C3 CD               [ 1] 3272 	pop a 			
      00A2C4 9A               [ 4] 3273 	ret 
                                   3274 
                                   3275 
                                   3276 ;----------------------------------
                                   3277 ;  search  a free space space that 
                                   3278 ;  fit program size 
                                   3279 ; input:
                                   3280 ;    X    program size 
                                   3281 ; output:
                                   3282 ;    X    address | 0 
                                   3283 ;------------------------------------
                           000001  3284 	PG_SIZE=1 
                           000002  3285 	VSIZE=2 
      0028F9                       3286 search_fit:
      00A2C5 54               [ 2] 3287 	pushw x; PG_SIZE 
      00A2C6 A1 02 27         [ 2] 3288 	ldw x,#app_space 
      00A2C9 03 CC 97         [ 4] 3289 1$:	call is_erased 
      00A2CC 25 0D            [ 1] 3290 	jreq 4$
      00A2CD F6               [ 1] 3291 	ld a,(x)
      00A2CD 90 F6            [ 1] 3292 	or a,(1,x)
      00A2CF 93 EE            [ 1] 3293 	jreq 9$ ; free space 
      00A2D1 01 72 A9         [ 4] 3294 2$:	call skip_to_next
      00A2D4 00               [ 2] 3295 	tnzw x 
      00A2D5 03 9F            [ 1] 3296 	jrne 1$
      00A2D7 88 90            [ 2] 3297 	jra 9$
      00290F                       3298 4$: ; erased program 
                                   3299     ; does it fit? 
      00A2D9 F6 93 EE         [ 2] 3300 	ldw acc16,x 
      00A2DC 01 72            [ 2] 3301 	ldw x,(2,x) ; size erased program
                                   3302 ; top multiple of BLOCK_SIZE 
      00A2DE A9 00 03         [ 2] 3303 	addw x,#4 
      00A2E1 84 F7 81         [ 2] 3304 	addw x,#BLOCK_SIZE-1 
      00A2E4 9F               [ 1] 3305 	ld a,xl 
      00A2E4 CD 9A            [ 1] 3306 	and a,#BLOCK_SIZE 
      00A2E6 4F               [ 1] 3307 	ld xl,a  
      00A2E7 A1 01            [ 2] 3308 	cpw x,(1,sp) ; size program to save 
      00A2E9 27 03            [ 1] 3309 	jruge 8$   ; fit 
      00A2EB CC 97 25         [ 2] 3310 	ldw x,acc16 
      00A2EE 90 F6            [ 2] 3311 	jra 2$ 
      00A2F0 93 EE 01         [ 2] 3312 8$: ldw x,acc16 ; fit in this one 	
      00292A                       3313 9$:	_drop VSIZE 
      00A2F3 72 A9            [ 2]    1     addw sp,#VSIZE 
      00A2F5 00               [ 4] 3314 	ret  
                                   3315 
                                   3316 ;-------------------------
                                   3317 ; erase header and 
                                   3318 ; size fields 
                                   3319 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3320 ;    X    program address 
                                   3321 ; output:
                                   3322 ;    X    unchanged 
                                   3323 ;-------------------------
                           000001  3324 	COUNT=1 
      00292D                       3325 erase_header:
      00A2F6 03               [ 2] 3326 	pushw x 
      00A2F7 C7 00            [ 1] 3327 	push #4 ; COUNT 
      00A2F9 19 CF 00 1A      [ 1] 3328 	clr farptr 
      00A2FD 92 BC 00         [ 2] 3329 	ldw ptr16,x 
      00A300 19               [ 1] 3330 	clr a 
      00A301 5F               [ 1] 3331 	clrw x 
      00A302 97 4F 81         [ 4] 3332 1$:	call write_byte 
      00A305 0A 01            [ 1] 3333 	dec (COUNT,sp)
      00A305 CD 9C            [ 1] 3334 	jrne 1$
      002940                       3335 	_drop 1 
      00A307 AF 90            [ 2]    1     addw sp,#1 
      00A309 F6               [ 2] 3336 	popw x 
      00A30A 93 EE 01         [ 2] 3337 	ldw ptr16,x 
      00A30D 72               [ 4] 3338 	ret 
                                   3339 
                                   3340 ;---------------------------------------
                                   3341 ; BASIC: SAVE
                                   3342 ; write application from RAM to FLASH
                                   3343 ; at UFLASH address
                                   3344 ;--------------------------------------
                           000001  3345 	XTEMP=1
                           000003  3346 	COUNT=3  ; last count bytes written 
                           000004  3347 	CNT_LO=4 ; count low byte 
                           000005  3348 	TOWRITE=5 ; how bytes left to write  
                           000006  3349 	VSIZE=6 
      002947                       3350 cmd_save:
      00A30E A9               [ 2] 3351 	pushw x 
      00A30F 00 03            [ 2] 3352 	pushw y 
      00294A                       3353 	_vars VSIZE
      00A311 4D 26            [ 2]    1     sub sp,#VSIZE 
      00A313 0D 5D 26         [ 4] 3354 	call prog_size 
      00A316 0A 55            [ 1] 3355 	jrne 0$ 
      00A318 00 03 00         [ 2] 3356 	jp 9$ ; no program to save 
      00A31B 02 5B            [ 2] 3357 0$:	ldw (TOWRITE,sp),x ; program size
      00A31D 02 CC 97 D8      [ 1] 3358 	clr farptr 
      00A321 81 28 F9         [ 4] 3359 	call search_fit
      00A322 CF 00 19         [ 2] 3360 	ldw ptr16,x 
      00A322 85 52 0D         [ 2] 3361 	ldw x,#0xFFFF
      00A325 89 A6 85 CD      [ 2] 3362 	subw x,ptr16 ; free flash 
      00A329 9A 42 CD         [ 2] 3363 	subw x,#4 ; signature and size field 
      00A32C 98 B4            [ 2] 3364 	cpw x,(TOWRITE,sp)
      00A32E 1F 09            [ 1] 3365 	jruge 1$
      00A330 CD 9D            [ 1] 3366 	ld a,#ERR_MEM_FULL
      00A332 84 72 14         [ 2] 3367 	jp tb_error 
      002973                       3368 1$: ; check if header bytes are zero's 
      00A335 00 23 CD         [ 2] 3369 	ldw x,ptr16 
      00A338 98               [ 1] 3370 	ld a,(x)
      00A339 8C A1            [ 1] 3371 	or a,(1,x)
      00A33B 80 27            [ 1] 3372 	or a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A33D 03 CC            [ 1] 3373 	or a,(3,x)
      00A33F 97 25            [ 1] 3374 	jreq 2$
      00A341 CD 29 2D         [ 4] 3375 	call erase_header ; preserve X and farptr 
      002982                       3376 2$: 
                                   3377 ; block programming flash
                                   3378 ; must be done from RAM
                                   3379 ; moved in tib  
      00A341 FE 72 5C         [ 4] 3380 	call move_prg_to_ram
                                   3381 ; initialize written bytes count  
      00A344 00 02            [ 1] 3382 	clr (COUNT,sp)
                                   3383 ; first bock 
                                   3384 ; containt signature 2 bytes 
                                   3385 ; and size 	2 bytes 
                                   3386 ; use Y as pointer to block_buffer
      00A346 72 5C 00         [ 4] 3387 	call clear_block_buffer ; -- y=*block_buffer	
                                   3388 ; write signature
      00A349 02 A3 A3         [ 2] 3389 	ldw x,SIGNATURE ; "TB" 
      00A34C 52 27            [ 2] 3390 	ldw (y),x 
      00A34E 03 CC 97 25      [ 2] 3391 	addw y,#2
      00A352 1E 05            [ 2] 3392 	ldw x,(TOWRITE,sp)
      00A352 72 04            [ 2] 3393 	ldw (y),x
      00A354 00 23 03 CC      [ 2] 3394 	addw y,#2   
      00A358 97 25            [ 1] 3395 	ld a,#(BLOCK_SIZE-4)
      00A35A CD 9B 96         [ 2] 3396 	cpw x,#(BLOCK_SIZE-4) 
      00A35D A1 84            [ 1] 3397 	jrugt 3$
      00A35F 27               [ 1] 3398 	ld a,xl 
      00A360 03 CC            [ 1] 3399 3$:	ld (CNT_LO,sp),a   
      00A362 97 25 90         [ 2] 3400 	ldw x,txtbgn 
      00A365 F6 93            [ 2] 3401 	ldw (XTEMP,sp),x 
      0029AA                       3402 32$: 
      00A367 EE 01            [ 2] 3403 	ldw x,(XTEMP,sp)
      00A369 72 A9            [ 1] 3404 	ld a,(CNT_LO,sp)
      00A36B 00 03 6B         [ 4] 3405 	call fill_write_buffer 
      00A36E 06 1F            [ 2] 3406 	ldw (XTEMP,sp),x 
      00A370 07 CD 98         [ 2] 3407 	ldw x,#block_buffer
      00A373 8C A1 00         [ 4] 3408 	call write_buffer
      00A376 27 17 A1         [ 2] 3409 	ldw x,#BLOCK_SIZE 
      00A379 80 26 0E         [ 4] 3410 	call incr_farptr  
                                   3411 ; following blocks 
      00A37C FE 72            [ 2] 3412 	ldw x,(XTEMP,sp)
      00A37E 5C 00 02         [ 2] 3413 	cpw x,txtend 
      00A381 72 5C            [ 1] 3414 	jruge 9$ 
      00A383 00 02            [ 2] 3415 	ldw x,(TOWRITE,sp)
      00A385 A3 A3 98         [ 2] 3416 	subw x,(COUNT,sp)
      00A388 27 0E            [ 2] 3417 	ldw (TOWRITE,sp),x 
      00A38A A6 80            [ 1] 3418 	ld a,#BLOCK_SIZE 
      00A38A 55 00 04         [ 2] 3419 	cpw x,#BLOCK_SIZE 
      00A38D 00 02            [ 1] 3420 	jruge 4$ 
      00A38F 9F               [ 1] 3421 	ld a,xl 
      00A38F 0F 03            [ 1] 3422 4$:	ld (CNT_LO,sp),a 
      00A391 AE 00 01         [ 4] 3423 	call clear_block_buffer 
      00A394 1F 04            [ 2] 3424 	jra 32$ 
      0029DC                       3425 9$:	_drop VSIZE 
      00A396 20 2F            [ 2]    1     addw sp,#VSIZE 
      00A398 90 85            [ 2] 3426     popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A398 72               [ 2] 3427 	popw x 
      00A399 04               [ 4] 3428 	ret 
                                   3429 
      00A39A 00 23                 3430 SIGNATURE: .ascii "TB"
      00A39C 03 CC                 3431 ERASED: .ascii "XX" 
                                   3432 
                                   3433 ;---------------------
                                   3434 ; check if there is 
                                   3435 ; an erased program 
                                   3436 ; at this address 
                                   3437 ; input:
                                   3438 ;    X    address 
                                   3439 ; output:
                                   3440 ;    Z    Set=erased program 
                                   3441 ;--------------------
      0029E6                       3442 is_erased:
      00A39E 97               [ 2] 3443 	pushw x 
                                   3444 ; align to BLOCK 
      00A39F 25               [ 1] 3445 	ld a,xl 
      00A3A0 CD 9B            [ 1] 3446 	and a,#BLOCK_SIZE 
      00A3A2 96               [ 1] 3447 	ld xl,a 
      00A3A3 A1               [ 2] 3448 	ldw x,(x)
      00A3A4 84 27 03         [ 2] 3449 	cpw x,ERASED 
      00A3A7 CC               [ 2] 3450 	popw x 
      00A3A8 97               [ 4] 3451 	ret 
                                   3452 
                                   3453 ;----------------------------
                                   3454 ;  skip to next program
                                   3455 ;  block 
                                   3456 ; input:
                                   3457 ;    X   actual program addr
                                   3458 ; output:
                                   3459 ;    X   next block 
                                   3460 ;        after program 
                                   3461 ;----------------------------
      0029F1                       3462 skip_to_next:
                                   3463 ; align to block 
      00A3A9 25               [ 1] 3464 	ld a,xl 
      00A3AA A4 80            [ 1] 3465 	and a,#BLOCK_SIZE 
      00A3AA 90               [ 1] 3466 	ld xl,a 
      00A3AB F6 93 EE         [ 2] 3467 	ldw acc16,x 
      00A3AE 01 72            [ 2] 3468 	ldw x,(2,x)
      00A3B0 A9 00 03 6B      [ 2] 3469 	addw x,acc16 ; blk_addr+prg_size 
      00A3B4 03 1F 04         [ 2] 3470 	addw x,#4 ; +header fields 
                                   3471 ; align to next block 
      00A3B7 4D 2A 0D         [ 2] 3472 	addw x,#BLOCK_SIZE-1 
      00A3BA 7B               [ 1] 3473 	ld a,xl 
      00A3BB 06 1E            [ 1] 3474 	and a,#0x80 
      00A3BD 07               [ 1] 3475 	ld xl,a  
      00A3BE 1D               [ 4] 3476 	ret 
                                   3477 
                                   3478 
                                   3479 ;---------------------
                                   3480 ; BASIC: DIR 
                                   3481 ; list programs saved 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3482 ; in flash 
                                   3483 ;--------------------
                           000001  3484 	XTEMP=1 
      002A09                       3485 cmd_dir:
      00A3BF 00 01 A2         [ 2] 3486 	ldw x,#app_space 
      00A3C2 00               [ 2] 3487 	pushw x 
      002A0D                       3488 1$: 
      00A3C3 6B 06 1F         [ 4] 3489 	call qsign 
      00A3C6 07 3B            [ 1] 3490 	jrne 4$
      00A3C7 1C 00 04         [ 2] 3491 	addw x,#4
      00A3C7 CE 00 05 1F      [ 1] 3492 	mov base,#16
      00A3CB 0D CE 00         [ 4] 3493 	call prt_i16
      00A3CE 01 1F            [ 1] 3494 	ld a,#SPACE 
      00A3D0 0B 72 15         [ 4] 3495 	call putc 
      00A3D3 00 23            [ 2] 3496 	ldw x,(1,sp)
      00A3D5 72 5C            [ 2] 3497 	ldw x,(2,x)
      00A3D7 00 20 81 0A      [ 1] 3498 	mov base,#10  
      00A3DA CD 18 54         [ 4] 3499 	call prt_i16 
      00A3DA 72 5D 00         [ 2] 3500 	ldw x,#STR_BYTES
      00A3DD 20 26 03         [ 4] 3501 	call puts
      00A3E0 CC 97            [ 1] 3502 	ld a,#', 
      00A3E2 25 08 FF         [ 4] 3503 	call putc
      00A3E3 1E 01            [ 2] 3504 	ldw x,(1,sp)
      00A3E3 A6 85 CD         [ 2] 3505 	addw x,#8
      00A3E6 9A 42 CD         [ 4] 3506 	call puts 
      00A3E9 98 B4            [ 1] 3507 	ld a,#CR 
      00A3EB 13 09 27         [ 4] 3508 	call putc
      00A3EE 03 CC            [ 2] 3509 	ldw x,(1,sp)
      00A3F0 97 25 F1         [ 4] 3510 3$:	call skip_to_next
      00A3F2 1F 01            [ 2] 3511 	ldw (1,sp),x 
      00A3F2 CF 00            [ 2] 3512 	jra 1$
      002A4D                       3513 4$: ; check if it is an erased program 
      00A3F4 1A F6 EE         [ 4] 3514 	call is_erased 
      00A3F7 01 72            [ 1] 3515 	jreq 3$ 
      002A52                       3516 8$: ; done 
      002A52                       3517 	_drop 2 
      00A3F9 FB 04            [ 2]    1     addw sp,#2 
      00A3FB 19               [ 4] 3518 	ret 
                                   3519 
                                   3520 ;---------------------
                                   3521 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3522 ; write 1 or more byte to FLASH or EEPROM
                                   3523 ; starting at address  
                                   3524 ; input:
                                   3525 ;   expr1  	is address 
                                   3526 ;   expr2,...,exprn   are bytes to write
                                   3527 ; output:
                                   3528 ;   none 
                                   3529 ;---------------------
      002A55                       3530 write:
      00A3FC 03 72 C7         [ 4] 3531 	call expression
      00A3FF 00 1A            [ 1] 3532 	cp a,#TK_INTGR 
      00A401 72 5C            [ 1] 3533 	jreq 0$
      00A403 00 1B 72         [ 2] 3534 	jp syntax_error
      002A5F                       3535 0$: _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A406 CF 00            [ 1]    1     ld a,(y)
      00A408 1A               [ 1]    2     ldw x,y 
      00A409 C7 00            [ 2]    3     ldw x,(1,x)
      00A40B 0D CF 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      00A40F 7B 06 1E         [ 1] 3536 	ld farptr,a 
      00A412 07 72 B0         [ 2] 3537 	ldw ptr16,x 
      002A6E                       3538 1$:	
      00A415 00 0E C2         [ 4] 3539 	call next_token 
      00A418 00 0D            [ 1] 3540 	cp a,#TK_COMMA 
      00A41A 18 03            [ 1] 3541 	jreq 2$ 
      00A41C A8 80            [ 2] 3542 	jra 9$ ; no more data 
      00A41E 2B 12 20         [ 4] 3543 2$:	call next_token 
      00A421 25 7B            [ 1] 3544 	cp a,#TK_CHAR 
      00A423 03 2A            [ 1] 3545 	jreq 4$ 
      00A425 07 C6            [ 1] 3546 	cp a,#TK_QSTR
      00A427 00 0F            [ 1] 3547 	jreq 6$
      002A82                       3548 	_unget_token 
      00A429 2F 07 20 1A 01   [ 1]    1      mov in,in.saved  
      00A42D CD 1B 16         [ 4] 3549 	call expression
      00A42D 72 0E            [ 1] 3550 	cp a,#TK_INTGR
      00A42F 00 0F            [ 1] 3551 	jreq 3$
      00A431 15 16 A5         [ 2] 3552 	jp syntax_error
      00A432                       3553 3$:	_xpop 
      00A432 1E 0D            [ 1]    1     ld a,(y)
      00A434 CF               [ 1]    2     ldw x,y 
      00A435 00 05            [ 2]    3     ldw x,(1,x)
      00A437 72 01 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A43B 05               [ 1] 3554 	ld a,xl 
      00A43C E6               [ 1] 3555 	clrw x 
      00A43D 02 C7 00         [ 4] 3556 	call write_byte
      00A440 03 1E            [ 2] 3557 	jra 1$ 
      002AA1                       3558 4$: ; write character 
      00A442 0B               [ 1] 3559 	ld a,(x)
      00A443 CF 00 01 81      [ 1] 3560 	inc in 
      00A447 5F               [ 1] 3561 	clrw x 
      00A447 85 5B 0D         [ 4] 3562 	call write_byte 
      00A44A 72 5A            [ 2] 3563 	jra 1$ 
      002AAC                       3564 6$: ; write string 
      00A44C 00               [ 2] 3565 	pushw x 
      00A44D 20               [ 1] 3566 	ld a,(x)
      00A44E FC 5C 00 01      [ 1] 3567 	inc in 
      00A44F 5F               [ 1] 3568 	clrw x 
      00A44F CD 98 8C         [ 4] 3569 	call write_byte 
      00A452 A1               [ 2] 3570 	popw x 
      00A453 84               [ 1] 3571 	ld a,(x)
      00A454 27 07            [ 1] 3572 	jreq 1$
      00A456 A1               [ 1] 3573 	incw x 
      00A457 03 27            [ 2] 3574 	jra 6$ 	
      002ABD                       3575 9$:
      00A459 26               [ 4] 3576 	ret 
                                   3577 
                                   3578 
                                   3579 ;---------------------
                                   3580 ;BASIC: CHAR(expr)
                                   3581 ; évaluate expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3582 ; and take the 7 least 
                                   3583 ; bits as ASCII character
                                   3584 ; output: 
                                   3585 ; 	A char 
                                   3586 ;---------------------
      002ABE                       3587 func_char:
      00A45A CC 97 25         [ 4] 3588 	call func_args 
      00A45D A1 01            [ 1] 3589 	cp a,#1
      00A45D 90 89            [ 1] 3590 	jreq 1$
      00A45F CD 98 BE         [ 2] 3591 	jp syntax_error
      002AC8                       3592 1$:	_xpop
      00A462 4F 90            [ 1]    1     ld a,(y)
      00A464 CE               [ 1]    2     ldw x,y 
      00A465 00 05            [ 2]    3     ldw x,(1,x)
      00A467 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A46B 13               [ 1] 3593 	ld a,xl
      00A46C 01 5B            [ 1] 3594 	and a,#0x7f 
      00A46E 02               [ 4] 3595 	ret
                                   3596 
                                   3597 ;---------------------
                                   3598 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3599 ; extract first character 
                                   3600 ; of string argument 
                                   3601 ; output:
                                   3602 ;    A:X    int24 
                                   3603 ;---------------------
      002AD5                       3604 ascii:
      00A46F 25 01            [ 1] 3605 	ld a,#TK_LPAREN
      00A471 4C 19 C2         [ 4] 3606 	call expect 
      00A472 CD 18 0C         [ 4] 3607 	call next_token 
      00A472 CD 8C            [ 1] 3608 	cp a,#TK_QSTR 
      00A474 C5 5D            [ 1] 3609 	jreq 1$
      00A476 26 05            [ 1] 3610 	cp a,#TK_CHAR 
      00A478 A6 05            [ 1] 3611 	jreq 2$ 
      00A47A CC 97            [ 1] 3612 	cp a,#TK_CFUNC 
      00A47C 27 90            [ 1] 3613 	jreq 0$
      00A47E 85 81 A5         [ 2] 3614 	jp syntax_error
      00A480                       3615 0$: ; cfunc 
      00A480 90               [ 4] 3616 	call (x)
      00A481 89 89            [ 2] 3617 	jra 3$
      002AEF                       3618 1$: ; quoted string 
      00A483 CD               [ 1] 3619 	ld a,(x)
      00A484 98               [ 1] 3620 	push a  
      00A485 A5 72 5F         [ 4] 3621 	call skip_string
      00A488 00               [ 1] 3622 	pop a  	
      00A489 0E 90            [ 2] 3623 	jra 3$ 
      002AF7                       3624 2$: ; character 
      00A48B CE 00 1C         [ 4] 3625 	call get_char 
      00A48E 90               [ 1] 3626 3$:	clrw x 
      00A48F E6               [ 1] 3627 	rlwa x   
      002AFC                       3628 4$:	_xpush  
      00A490 03 A1 03 27      [ 2]    1     subw y,#CELL_SIZE
      00A494 15 90            [ 1]    2     ld (y),a 
      00A496 E6 02 C7         [ 2]    3     ldw (1,y),x 
      00A499 00 0F            [ 1] 3629 	ld a,#TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A49B 72 B9 00         [ 4] 3630 	call expect
      002B0A                       3631 9$:	
      002B0A                       3632 	_xpop  
      00A49E 0E 90            [ 1]    1     ld a,(y)
      00A4A0 C3               [ 1]    2     ldw x,y 
      00A4A1 00 1E            [ 2]    3     ldw x,(1,x)
      00A4A3 25 E9 A6 0A      [ 2]    4     addw y,#CELL_SIZE 
      00A4A7 CC               [ 4] 3633 	ret 
                                   3634 
                                   3635 ;---------------------
                                   3636 ;BASIC: KEY
                                   3637 ; wait for a character 
                                   3638 ; received from STDIN 
                                   3639 ; input:
                                   3640 ;	none 
                                   3641 ; output:
                                   3642 ;	a	 character 
                                   3643 ;---------------------
      002B14                       3644 key:
      00A4A8 97 27 0F         [ 4] 3645 	call getc 
      00A4AA 81               [ 4] 3646 	ret
                                   3647 
                                   3648 ;----------------------
                                   3649 ; BASIC: QKEY
                                   3650 ; Return true if there 
                                   3651 ; is a character in 
                                   3652 ; waiting in STDIN 
                                   3653 ; input:
                                   3654 ;  none 
                                   3655 ; output:
                                   3656 ;   A     0|-1
                                   3657 ;-----------------------
      002B18                       3658 qkey:: 
      00A4AA 90               [ 1] 3659 	clrw x 
      00A4AB 89 72 A9         [ 1] 3660 	ld a,rx1_head
      00A4AE 00 04 1E         [ 1] 3661 	sub a,rx1_tail 
      00A4B1 03 CD            [ 1] 3662 	jreq 9$ 
      00A4B3 94               [ 2] 3663 	cplw x
      00A4B4 24 26            [ 1] 3664 	ld a,#255    
      002B24                       3665 9$: 
      00A4B6 04               [ 4] 3666 	ret 
                                   3667 
                                   3668 ;---------------------
                                   3669 ; BASIC: GPIO(port,reg)
                                   3670 ; return gpio register address 
                                   3671 ; expr {PORTA..PORTI}
                                   3672 ; input:
                                   3673 ;   none 
                                   3674 ; output:
                                   3675 ;   A:X 	gpio register address
                                   3676 ;----------------------------
                                   3677 ;	N=PORT
                                   3678 ;	T=REG 
      002B25                       3679 gpio:
      00A4B7 90 85 20         [ 4] 3680 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A4BA DA 02            [ 1] 3681 	cp a,#2
      00A4BB 27 03            [ 1] 3682 	jreq 1$
      00A4BB 85 5B 02         [ 2] 3683 	jp syntax_error  
      002B2F                       3684 1$:	_at_next 
      00A4BE 90 85 81         [ 1]    1     ld a,(3,y)
      00A4C1 93               [ 1]    2     ldw x,y 
      00A4C1 72 00            [ 2]    3     ldw x,(4,x)
      00A4C3 00 23 05         [ 2] 3685 	cpw x,#PA_BASE 
      00A4C6 A6 06            [ 1] 3686 	jrmi bad_port
      00A4C8 CC 97 27         [ 2] 3687 	cpw x,#PI_BASE+1 
      00A4CB CD 9B            [ 1] 3688 	jrpl bad_port
      00A4CD 96               [ 2] 3689 	pushw x 
      002B40                       3690 	_xpop
      00A4CE A1 84            [ 1]    1     ld a,(y)
      00A4D0 27               [ 1]    2     ldw x,y 
      00A4D1 03 CC            [ 2]    3     ldw x,(1,x)
      00A4D3 97 25 90 F6      [ 2]    4     addw y,#CELL_SIZE 
      00A4D7 93 EE 01         [ 2] 3691 	addw x,(1,sp)
      002B4C                       3692 	_drop 2 
      00A4DA 72 A9            [ 2]    1     addw sp,#2 
      00A4DC 00               [ 1] 3693 	clr a 
      00A4DD 03               [ 4] 3694 	ret
      002B50                       3695 bad_port:
      00A4DE 9F 27            [ 1] 3696 	ld a,#ERR_BAD_VALUE
      00A4E0 68 88 CD         [ 2] 3697 	jp tb_error
                                   3698 
                                   3699 
                                   3700 ;-------------------------
                                   3701 ; BASIC: UFLASH 
                                   3702 ; return free flash address
                                   3703 ; scan all block starting at 
                                   3704 ; app_space and return 
                                   3705 ; address of first free block 
                                   3706 ; below extended memory.  
                                   3707 ; return 0 if no free block 
                                   3708 ; input:
                                   3709 ;  none 
                                   3710 ; output:
                                   3711 ;	A:X		FLASH free address
                                   3712 ;---------------------------
      002B55                       3713 uflash:
      00A4E3 98 8C A1 80      [ 1] 3714 	clr farptr 
      00A4E7 27 03 CC         [ 2] 3715 	ldw x,#app_space 
      00A4EA 97               [ 2] 3716 	pushw x 
      00A4EB 25 FE 72         [ 2] 3717 1$:	ldw ptr16,x 
      00A4EE 5C 00 02         [ 4] 3718 	call scan_block 
      00A4F1 72 5C            [ 1] 3719 	jreq 8$
      00A4F3 00 02            [ 2] 3720 	ldw x,(1,sp)
      00A4F5 A3 A5 53         [ 2] 3721 	addw x,#BLOCK_SIZE 
      00A4F8 27 08            [ 1] 3722 	jreq 7$ 
      00A4FA A3 A5            [ 2] 3723 	ldw (1,sp),x 
      00A4FC 6D 27            [ 2] 3724 	jra 1$ 
      002B70                       3725 7$: ; no free block 
      00A4FE 03 CC            [ 1] 3726 	clr (1,sp) 
      00A500 97 25            [ 1] 3727 	clr (2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A502 85               [ 2] 3728 8$: popw x 
      00A502 84               [ 1] 3729 	clr a 
      00A503 89               [ 4] 3730 	ret 
                                   3731 
                                   3732 
                                   3733 ;---------------------
                                   3734 ; BASIC: USR(addr,arg)
                                   3735 ; execute a function written 
                                   3736 ; in binary code.
                                   3737 ; input:
                                   3738 ;   addr	routine address 
                                   3739 ;   arg 	is an argument
                                   3740 ;           it can be ignore 
                                   3741 ;           by cally. 
                                   3742 ; output:
                                   3743 ;   xstack 	value returned by cally  
                                   3744 ;---------------------
      002B77                       3745 usr:
      00A504 88 19 CF         [ 4] 3746 	call func_args 
      00A505 A1 02            [ 1] 3747 	cp a,#2
      00A505 0A 01            [ 1] 3748 	jreq 1$  
      00A507 27 26 CD         [ 2] 3749 	jp syntax_error 
      002B81                       3750 1$: 
      002B81                       3751 	_at_next ; A:X addr 
      00A50A 98 8C A1         [ 1]    1     ld a,(3,y)
      00A50D 84               [ 1]    2     ldw x,y 
      00A50E 27 07            [ 2]    3     ldw x,(4,x)
      00A510 A1 03 27         [ 2] 3752 	ldw ptr16,X 
      002B8A                       3753 	_xpop  ; arg 
      00A513 0D CC            [ 1]    1     ld a,(y)
      00A515 97               [ 1]    2     ldw x,y 
      00A516 25 01            [ 2]    3     ldw x,(1,x)
      00A517 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      002B93                       3754 	_store_top ; overwrite addr 
      00A517 C6 00            [ 1]    1     ld (y),a 
      00A519 02 AB 03         [ 2]    2     ldw (1,y),x     
      00A51C C7 00 02 20      [ 6] 3755     call [ptr16]
      00A520 03               [ 4] 3756 	ret 
                                   3757 
                                   3758 
                                   3759 ;------------------------------
                                   3760 ; BASIC: BYE 
                                   3761 ; halt mcu in its lowest power mode 
                                   3762 ; wait for reset or external interrupt
                                   3763 ; do a cold start on wakeup.
                                   3764 ;------------------------------
      002B9D                       3765 bye:
      00A521 CD 98 A5 30 FB   [ 2] 3766 	btjf UART1_SR,#UART_SR_TC,.
      00A524 8E               [10] 3767 	halt
      00A524 CD 98 8C         [ 2] 3768 	jp cold_start  
                                   3769 
                                   3770 ;----------------------------------
                                   3771 ; BASIC: SLEEP 
                                   3772 ; halt mcu until reset or external
                                   3773 ; interrupt.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3774 ; Resume progam after SLEEP command
                                   3775 ;----------------------------------
      002BA6                       3776 sleep:
      00A527 A1 08 27 DA 5B   [ 2] 3777 	btjf UART1_SR,#UART_SR_TC,.
      00A52C 03 20 1A 22      [ 1] 3778 	bset flags,#FSLEEP
      00A52F 8E               [10] 3779 	halt 
      00A52F 5B               [ 4] 3780 	ret 
                                   3781 
                                   3782 ;-------------------------------
                                   3783 ; BASIC: PAUSE expr 
                                   3784 ; suspend execution for n msec.
                                   3785 ; input:
                                   3786 ;	none
                                   3787 ; output:
                                   3788 ;	none 
                                   3789 ;------------------------------
      002BB1                       3790 pause:
      00A530 01 CD A4         [ 4] 3791 	call expression
      00A533 4F CF            [ 1] 3792 	cp a,#TK_INTGR
      00A535 00 1A            [ 1] 3793 	jreq 1$ 
      00A537 55 00 03         [ 2] 3794 	jp syntax_error
      002BBB                       3795 1$: _xpop 
      00A53A 00 02            [ 1]    1     ld a,(y)
      00A53C 85               [ 1]    2     ldw x,y 
      00A53D A3 A5            [ 2]    3     ldw x,(1,x)
      00A53F 53 26 05 CE      [ 2]    4     addw y,#CELL_SIZE 
      002BC4                       3796 pause02:
      00A543 00 1A 20         [ 2] 3797 	ldw timer,x 
      00A546 19 00 12         [ 2] 3798 1$: ldw x,timer 
      00A547 5D               [ 2] 3799 	tnzw x 
      00A547 20 35            [ 1] 3800 	jreq 2$
      00A549 8F               [10] 3801 	wfi 
      00A549 55 00            [ 1] 3802 	jrne 1$
      002BD0                       3803 2$:	
      00A54B 03               [ 4] 3804 	ret 
                                   3805 
                                   3806 ;------------------------------
                                   3807 ; BASIC: AWU expr
                                   3808 ; halt mcu for 'expr' milliseconds
                                   3809 ; use Auto wakeup peripheral
                                   3810 ; all oscillators stopped except LSI
                                   3811 ; range: 1ms - 511ms
                                   3812 ; input:
                                   3813 ;  none
                                   3814 ; output:
                                   3815 ;  none:
                                   3816 ;------------------------------
      002BD1                       3817 awu:
      00A54C 00 02 5B         [ 4] 3818   call expression
      00A54F 02 CC            [ 1] 3819   cp a,#TK_INTGR
      00A551 97 D8            [ 1] 3820   jreq 1$
      00A553 CC 16 A5         [ 2] 3821   jp syntax_error
      002BDB                       3822 1$: _xpop 
      00A553 72 00            [ 1]    1     ld a,(y)
      00A555 00               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A556 23 05            [ 2]    3     ldw x,(1,x)
      00A558 A6 06 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      002BE4                       3823 awu02:
      00A55C 27 14 00         [ 2] 3824   cpw x,#5120
      00A55D 2B 0C            [ 1] 3825   jrmi 1$ 
      00A55D CD A4 4F F2      [ 1] 3826   mov AWU_TBR,#15 
      00A560 A6 1E            [ 1] 3827   ld a,#30
      00A560 CF               [ 2] 3828   div x,a
      00A561 00 05            [ 1] 3829   ld a,#16
      00A563 E6               [ 2] 3830   div x,a 
      00A564 02 C7            [ 2] 3831   jra 4$
      002BF5                       3832 1$: 
      00A566 00 03 35         [ 2] 3833   cpw x,#2048
      00A569 03 00            [ 1] 3834   jrmi 2$ 
      00A56B 02 81 50 F2      [ 1] 3835   mov AWU_TBR,#14
      00A56D A6 50            [ 1] 3836   ld a,#80
      00A56D 72               [ 2] 3837   div x,a 
      00A56E 00 00            [ 2] 3838   jra 4$   
      002C03                       3839 2$:
      00A570 23 06 A6 06      [ 1] 3840   mov AWU_TBR,#7
      002C07                       3841 3$:  
                                   3842 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A574 CC 97 27         [ 2] 3843   cpw x,#64 
      00A577 81 07            [ 2] 3844   jrule 4$ 
      00A578 72 5C 50 F2      [ 1] 3845   inc AWU_TBR 
      00A578 CD               [ 2] 3846   srlw x 
      00A579 A4 4F            [ 2] 3847   jra 3$ 
      002C13                       3848 4$:
      00A57B CF               [ 1] 3849   ld a, xl
      00A57C 00               [ 1] 3850   dec a 
      00A57D 1A 01            [ 1] 3851   jreq 5$
      00A57E 4A               [ 1] 3852   dec a 	
      002C18                       3853 5$: 
      00A57E 85 52            [ 1] 3854   and a,#0x3e 
      00A580 04 89 CE         [ 1] 3855   ld AWU_APR,a 
      00A583 00 05 1F 03      [ 1] 3856   bset AWU_CSR,#AWU_CSR_AWUEN
      00A587 CE               [10] 3857   halt 
                                   3858 
      00A588 00               [ 4] 3859   ret 
                                   3860 
                                   3861 ;------------------------------
                                   3862 ; BASIC: TICKS
                                   3863 ; return msec ticks counter value 
                                   3864 ; input:
                                   3865 ; 	none 
                                   3866 ; output:
                                   3867 ;	X 		TK_INTGR
                                   3868 ;-------------------------------
      002C23                       3869 get_ticks:
      00A589 01 1F 05         [ 1] 3870 	ld a,ticks 
      00A58C CE 00 1A         [ 2] 3871 	ldw x,ticks+1 
      00A58F 20               [ 4] 3872 	ret 
                                   3873 
                                   3874 ;------------------------------
                                   3875 ; BASIC: ABS(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3876 ; return absolute value of expr.
                                   3877 ; input:
                                   3878 ;   none
                                   3879 ; output:
                                   3880 ;   xstack    positive int24 
                                   3881 ;-------------------------------
      002C2A                       3882 abs:
      00A590 CF 19 CF         [ 4] 3883 	call func_args 
      00A591 A1 01            [ 1] 3884 	cp a,#1 
      00A591 72 00            [ 1] 3885 	jreq 0$ 
      00A593 00 23 05         [ 2] 3886 	jp syntax_error
      002C34                       3887 0$:  
      00A596 A6 06 CC         [ 4] 3888 	call abs24 
      002C37                       3889 	_xpop 
      00A599 97 27            [ 1]    1     ld a,(y)
      00A59B 93               [ 1]    2     ldw x,y 
      00A59B 1E 03            [ 2]    3     ldw x,(1,x)
      00A59D CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A5A1 02               [ 4] 3890 	ret 
                                   3891 
                                   3892 ;------------------------------
                                   3893 ; BASIC: LSHIFT(expr1,expr2)
                                   3894 ; logical shift left expr1 by 
                                   3895 ; expr2 bits 
                                   3896 ; output:
                                   3897 ; 	A:x 	result 
                                   3898 ;------------------------------
      002C41                       3899 lshift:
      00A5A2 C7 00 03         [ 4] 3900 	call func_args
      00A5A5 1E 05            [ 1] 3901 	cp a,#2 
      00A5A7 CF 00            [ 1] 3902 	jreq 1$
      00A5A9 01 85 5B         [ 2] 3903 	jp syntax_error
      002C4B                       3904 1$: _xpop 
      00A5AC 04 FC            [ 1]    1     ld a,(y)
      00A5AE 93               [ 1]    2     ldw x,y 
      00A5AE 4D 26            [ 2]    3     ldw x,(1,x)
      00A5B0 0D A3 B9 80      [ 2]    4     addw y,#CELL_SIZE 
      00A5B4 25               [ 1] 3905 	ld a,xl 
      00A5B5 07               [ 1] 3906 	push a      
      002C56                       3907 	_xpop  ; T>A:X 
      00A5B6 89 CD            [ 1]    1     ld a,(y)
      00A5B8 A9               [ 1]    2     ldw x,y 
      00A5B9 4A 85            [ 2]    3     ldw x,(1,x)
      00A5BB 27 01 43 81      [ 2]    4     addw y,#CELL_SIZE 
      00A5BF 0D 01            [ 1] 3908 	tnz (1,sp) 
      00A5BF 72 01            [ 1] 3909 	jreq 4$
      00A5C1 00               [ 1] 3910 2$:	rcf 
      00A5C2 23               [ 2] 3911 	rlcw x 
      00A5C3 02               [ 1] 3912 	rlc a 
      00A5C4 4F 81            [ 1] 3913 	dec (1,sp) 
      00A5C6 26 F9            [ 1] 3914 	jrne 2$
      002C6A                       3915 4$: _drop 1 
      00A5C6 72 09            [ 2]    1     addw sp,#1 
      00A5C8 00               [ 4] 3916 	ret
                                   3917 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                                   3918 ;------------------------------
                                   3919 ; BASIC: RSHIFT(expr1,expr2)
                                   3920 ; logical shift right expr1 by 
                                   3921 ; expr2 bits.
                                   3922 ; output:
                                   3923 ; 	A 		TK_INTGR
                                   3924 ;   X 		result 
                                   3925 ;------------------------------
      002C6D                       3926 rshift:
      00A5C9 23 12 5B         [ 4] 3927 	call func_args
      00A5CC 02 CD            [ 1] 3928 	cp a,#2 
      00A5CE A1 33            [ 1] 3929 	jreq 1$
      00A5D0 5B 04 72         [ 2] 3930 	jp syntax_error
      002C77                       3931 1$: _xpop ; T>A:X
      00A5D3 19 00            [ 1]    1     ld a,(y)
      00A5D5 23               [ 1]    2     ldw x,y 
      00A5D6 72 10            [ 2]    3     ldw x,(1,x)
      00A5D8 00 23 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A5DC D0               [ 1] 3932     ld a,xl 
      00A5DD 88               [ 1] 3933 	push a    
      002C82                       3934 	_xpop  
      00A5DD CD 98            [ 1]    1     ld a,(y)
      00A5DF 8C               [ 1]    2     ldw x,y 
      00A5E0 A1 03            [ 2]    3     ldw x,(1,x)
      00A5E2 26 1F 89 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A5E6 98 A5            [ 1] 3935 	tnz (1,sp)
      00A5E8 85 CD            [ 1] 3936 	jreq 4$
      00A5EA B2               [ 1] 3937 2$:	rcf 
      00A5EB C3               [ 1] 3938 	rrc a 
      00A5EC 26               [ 2] 3939 	rrcw x 
      00A5ED 05 A6            [ 1] 3940 	dec (1,sp) 
      00A5EF 12 CC            [ 1] 3941 	jrne 2$
      002C96                       3942 4$: _drop 1 
      00A5F1 97 27            [ 2]    1     addw sp,#1 
      00A5F3 CF               [ 4] 3943 	ret
                                   3944 
                                   3945 ;--------------------------
                                   3946 ; BASIC: FCPU integer
                                   3947 ; set CPU frequency 
                                   3948 ;-------------------------- 
                                   3949 
      002C99                       3950 fcpu:
      00A5F4 00 1C            [ 1] 3951 	ld a,#TK_INTGR
      00A5F6 1D 00 02         [ 4] 3952 	call expect 
      00A5F9 FE 72 BB         [ 4] 3953 	call get_int24 
      00A5FC 00               [ 1] 3954 	ld a,xl 
      00A5FD 1C CF            [ 1] 3955 	and a,#7 
      00A5FF 00 1E 20         [ 1] 3956 	ld CLK_CKDIVR,a 
      00A602 19               [ 4] 3957 	ret 
                                   3958 
                                   3959 ;------------------------------
                                   3960 ; BASIC: PMODE pin#, mode 
                                   3961 ; Arduino pin. 
                                   3962 ; define pin as input or output
                                   3963 ; pin#: {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



                                   3964 ; mode: INPUT|OUTPUT  
                                   3965 ;------------------------------
                           000001  3966 	PINNO=1
                           000001  3967 	VSIZE=1
      002CA8                       3968 pin_mode:
      002CA8                       3969 	_vars VSIZE 
      00A603 55 00            [ 2]    1     sub sp,#VSIZE 
      00A605 04 00 02         [ 4] 3970 	call arg_list 
      00A608 CE 00            [ 1] 3971 	cp a,#2 
      00A60A 1C C3            [ 1] 3972 	jreq 1$
      00A60C 00 1E 2B         [ 2] 3973 	jp syntax_error 
      002CB4                       3974 1$: _xpop 
      00A60F 0C AE            [ 1]    1     ld a,(y)
      00A611 96               [ 1]    2     ldw x,y 
      00A612 7C CD            [ 2]    3     ldw x,(1,x)
      00A614 89 DC 55 00      [ 2]    4     addw y,#CELL_SIZE 
      00A618 03 00 02         [ 2] 3975 	ldw ptr16,x ; mode 
      002CC0                       3976 	_xpop ; Dx pin 
      00A61B 81 F6            [ 1]    1     ld a,(y)
      00A61C 93               [ 1]    2     ldw x,y 
      00A61C 5B 02            [ 2]    3     ldw x,(1,x)
      00A61E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A61E CD 9D 63         [ 4] 3977 	call select_pin 
      00A621 CD 94            [ 1] 3978 	ld (PINNO,sp),a  
      00A623 89 CE            [ 1] 3979 	ld a,#1 
      00A625 00 1E            [ 1] 3980 	tnz (PINNO,sp)
      00A627 CF 00            [ 1] 3981 	jreq 4$
      00A629 31               [ 1] 3982 2$:	sll a 
      00A62A CF 00            [ 1] 3983 	dec (PINNO,sp)
      00A62C 33 5F            [ 1] 3984 	jrne 2$ 
      00A62E CF 00            [ 1] 3985 	ld (PINNO,sp),a
      00A630 07 72            [ 1] 3986 	ld a,(PINNO,sp)
      00A632 5F 00            [ 1] 3987 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A634 09 72            [ 1] 3988 	ld (GPIO_CR1,x),a 
      00A636 5F 00            [ 1] 3989 4$:	ld a,#OUTP
      00A638 0A CE 00         [ 1] 3990 	cp a,acc8 
      00A63B 1C CF            [ 1] 3991 	jreq 6$
                                   3992 ; input mode
                                   3993 ; disable external interrupt 
      00A63D 00 05            [ 1] 3994 	ld a,(PINNO,sp)
      00A63F E6               [ 1] 3995 	cpl a 
      00A640 02 C7            [ 1] 3996 	and a,(GPIO_CR2,x)
      00A642 00 03            [ 1] 3997 	ld (GPIO_CR2,x),a 
                                   3998 ;clear bit in DDR for input mode 
      00A644 35 03            [ 1] 3999 	ld a,(PINNO,sp)
      00A646 00               [ 1] 4000 	cpl a 
      00A647 02 72            [ 1] 4001 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A649 10 00            [ 1] 4002 	ld (GPIO_DDR,x),a 
      00A64B 23 CC            [ 2] 4003 	jra 9$
      002CF8                       4004 6$: ;output mode  
      00A64D 97 D0            [ 1] 4005 	ld a,(PINNO,sp)
      00A64F EA 02            [ 1] 4006 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A64F 5B 02            [ 1] 4007 	ld (GPIO_DDR,x),a 
      00A651 72 5D            [ 1] 4008 	ld a,(PINNO,sp)
      00A653 00 35            [ 1] 4009 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A655 27 1D            [ 1] 4010 	ld (GPIO_CR2,x),a 
      002D04                       4011 9$:	
      002D04                       4012 	_drop VSIZE 
      00A657 72 5A            [ 2]    1     addw sp,#VSIZE 
      00A659 00               [ 4] 4013 	ret
                                   4014 
                                   4015 ;------------------------
                                   4016 ; select Arduino pin 
                                   4017 ; input:
                                   4018 ;   X 	 {0..15} Arduino Dx 
                                   4019 ; output:
                                   4020 ;   A     stm8s208 pin 
                                   4021 ;   X     base address s208 GPIO port 
                                   4022 ;---------------------------
      002D07                       4023 select_pin:
      00A65A 35               [ 2] 4024 	sllw x 
      00A65B 1E 01 CF         [ 2] 4025 	addw x,#arduino_to_8s208 
      00A65E 00               [ 2] 4026 	ldw x,(x)
      00A65F 05               [ 1] 4027 	ld a,xl 
      00A660 1E               [ 1] 4028 	push a 
      00A661 03               [ 1] 4029 	swapw x 
      00A662 CF 00            [ 1] 4030 	ld a,#5 
      00A664 02               [ 4] 4031 	mul x,a 
      00A665 1E 05 CF         [ 2] 4032 	addw x,#GPIO_BASE 
      00A668 00               [ 1] 4033 	pop a 
      00A669 1C               [ 4] 4034 	ret 
                                   4035 ; translation from Arduino D0..D15 to stm8s208rb 
      002D17                       4036 arduino_to_8s208:
      00A66A 1E 07                 4037 .byte 3,6 ; D0 
      00A66C CF 00                 4038 .byte 3,5 ; D1 
      00A66E 1E 5B                 4039 .byte 4,0 ; D2 
      00A670 08 CC                 4040 .byte 2,1 ; D3
      00A672 97 D0                 4041 .byte 6,0 ; D4
      00A674 02 02                 4042 .byte 2,2 ; D5
      00A674 AE 17                 4043 .byte 2,3 ; D6
      00A676 FF 94                 4044 .byte 3,1 ; D7
      00A678 CC 97                 4045 .byte 3,3 ; D8
      00A67A B1 04                 4046 .byte 2,4 ; D9
      00A67B 04 05                 4047 .byte 4,5 ; D10
      00A67B CD 98                 4048 .byte 2,6 ; D11
      00A67D 8C A1                 4049 .byte 2,7 ; D12
      00A67F 85 27                 4050 .byte 2,5 ; D13
      00A681 03 CC                 4051 .byte 4,2 ; D14
      00A683 97 25                 4052 .byte 4,1 ; D15
                                   4053 
                                   4054 
                                   4055 ;------------------------------
                                   4056 ; BASIC: RND(expr)
                                   4057 ; return random number 
                                   4058 ; between 1 and expr inclusive
                                   4059 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4060 ; input:
                                   4061 ; 	none 
                                   4062 ; output:
                                   4063 ;	xstack 	random positive integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



                                   4064 ;------------------------------
      002D37                       4065 random:
      00A685 CD 98 B4         [ 4] 4066 	call func_args 
      00A688 CF 00            [ 1] 4067 	cp a,#1
      00A68A 1A CD            [ 1] 4068 	jreq 1$
      00A68C 89 88 27         [ 2] 4069 	jp syntax_error
      002D41                       4070 1$:  
      002D41                       4071 	_xpop   
      00A68F 03 CD            [ 1]    1     ld a,(y)
      00A691 89               [ 1]    2     ldw x,y 
      00A692 8F 72            [ 2]    3     ldw x,(1,x)
      00A694 3F 00 1A 72      [ 2]    4     addw y,#CELL_SIZE 
      00A698 5C               [ 2] 4072 	pushw x 
      00A699 00               [ 1] 4073 	push a  
      00A69A 1B 72            [ 1] 4074 	ld a,#0x80 
      00A69C 3F 00            [ 1] 4075 	bcp a,(1,sp)
      00A69E 1A 72            [ 1] 4076 	jreq 2$
      00A6A0 5C 00            [ 1] 4077 	ld a,#ERR_BAD_VALUE
      00A6A2 1B 72 C7         [ 2] 4078 	jp tb_error
      002D57                       4079 2$: 
                                   4080 ; acc16=(x<<5)^x 
      00A6A5 00 1A 81         [ 2] 4081 	ldw x,seedx 
      00A6A8 58               [ 2] 4082 	sllw x 
      00A6A8 90               [ 2] 4083 	sllw x 
      00A6A9 89               [ 2] 4084 	sllw x 
      00A6AA AE               [ 2] 4085 	sllw x 
      00A6AB 00               [ 2] 4086 	sllw x 
      00A6AC 64               [ 1] 4087 	ld a,xh 
      00A6AD 90 AE 03         [ 1] 4088 	xor a,seedx 
      00A6B0 E8 20 22         [ 1] 4089 	ld acc16,a 
      00A6B3 9F               [ 1] 4090 	ld a,xl 
      00A6B3 90 89 CD         [ 1] 4091 	xor a,seedx+1 
      00A6B6 9A 54 A1         [ 1] 4092 	ld acc8,a 
                                   4093 ; seedx=seedy 
      00A6B9 02 27 03         [ 2] 4094 	ldw x,seedy 
      00A6BC CC 97 25         [ 2] 4095 	ldw seedx,x  
                                   4096 ; seedy=seedy^(seedy>>1)
      00A6BF CE 00 16         [ 2] 4097 	ldw x,seedy 
      00A6BF 90               [ 2] 4098 	srlw x 
      00A6C0 F6               [ 1] 4099 	ld a,xh 
      00A6C1 93 EE 01         [ 1] 4100 	xor a,seedy 
      00A6C4 72 A9 00         [ 1] 4101 	ld seedy,a  
      00A6C7 03               [ 1] 4102 	ld a,xl 
      00A6C8 89 90 F6         [ 1] 4103 	xor a,seedy+1 
      00A6CB 93 EE 01         [ 1] 4104 	ld seedy+1,a 
                                   4105 ; acc16>>3 
      00A6CE 72 A9 00         [ 2] 4106 	ldw x,acc16 
      00A6D1 03               [ 2] 4107 	srlw x 
      00A6D2 90               [ 2] 4108 	srlw x 
      00A6D3 93               [ 2] 4109 	srlw x 
                                   4110 ; x=acc16^x 
      00A6D4 85               [ 1] 4111 	ld a,xh 
      00A6D5 C8 00 0D         [ 1] 4112 	xor a,acc16 
      00A6D5 89 AE F4         [ 1] 4113 	ld acc16,a 
      00A6D8 24               [ 1] 4114 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A6D9 65 90 A3         [ 1] 4115 	xor a,acc8 
      00A6DC 7A 12 2B         [ 1] 4116 	ld acc8,a 
                                   4117 ; seedy=acc16^seedy 
      00A6DF 01 5C 17         [ 1] 4118 	xor a,seedy+1
      00A6E1 97               [ 1] 4119 	ld xl,a 
      00A6E1 9E C7 53         [ 1] 4120 	ld a,acc16 
      00A6E4 0D 9F C7         [ 1] 4121 	xor a,seedy
      00A6E7 53               [ 1] 4122 	ld xh,a 
      00A6E8 0E 8C 56         [ 2] 4123 	ldw seedy,x 
                                   4124 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A6EB 9E C7 53         [ 1] 4125 	ld a,seedx+1
      00A6EE 0F 9F            [ 1] 4126 	and a,#127
      002DAC                       4127 	_xpush 
      00A6F0 C7 53 10 72      [ 2]    1     subw y,#CELL_SIZE
      00A6F4 10 53            [ 1]    2     ld (y),a 
      00A6F6 08 72 10         [ 2]    3     ldw (1,y),x 
      00A6F9 53               [ 1] 4128 	pop a 
      00A6FA 00               [ 2] 4129 	popw x 
      002DB7                       4130 	_xpush 
      00A6FB 72 10 53 04      [ 2]    1     subw y,#CELL_SIZE
      00A6FF 85 CD            [ 1]    2     ld (y),a 
      00A701 AC 44 72         [ 2]    3     ldw (1,y),x 
      00A704 11 53 08         [ 4] 4131 	call mod24 
      002DC3                       4132 	_xpop
      00A707 72 11            [ 1]    1     ld a,(y)
      00A709 53               [ 1]    2     ldw x,y 
      00A70A 00 90            [ 2]    3     ldw x,(1,x)
      00A70C 85 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A70E 1C 00 01         [ 2] 4133 	addw x,#1 
      00A70E CD 9A            [ 1] 4134 	adc a,#0  
      00A710 54               [ 4] 4135 	ret 
                                   4136 
                                   4137 ;---------------------------------
                                   4138 ; BASIC: WORDS 
                                   4139 ; affiche la listes des mots du
                                   4140 ; dictionnaire ainsi que le nombre
                                   4141 ; de mots.
                                   4142 ;---------------------------------
                           000001  4143 	WLEN=1 ; word length
                           000002  4144 	LLEN=2 ; character sent to console
                           000003  4145 	WCNT=3 ; count words printed 
                           000003  4146 	VSIZE=3 
      002DD2                       4147 words:
      00A711 A1 02            [ 2] 4148 	pushw y
      002DD4                       4149 	_vars VSIZE
      00A713 27 12            [ 2]    1     sub sp,#VSIZE 
      00A715 A1 01            [ 1] 4150 	clr (LLEN,sp)
      00A717 27 03            [ 1] 4151 	clr (WCNT,sp)
      00A719 CC 97 25 4F      [ 2] 4152 	ldw y,#kword_dict+2
      00A71D 5F               [ 1] 4153 0$:	ldw x,y
      00A71E 72               [ 1] 4154 	ld a,(x)
      00A71F A2 00            [ 1] 4155 	and a,#15 
      00A721 03 90            [ 1] 4156 	ld (WLEN,sp),a 
      00A723 F7 90            [ 1] 4157 	inc (WCNT,sp)
      00A725 EF               [ 1] 4158 1$:	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A726 01               [ 1] 4159 	ld a,(x)
      00A727 90 E6 03         [ 4] 4160 	call putc 
      00A72A 93 EE            [ 1] 4161 	inc (LLEN,sp)
      00A72C 04 5D            [ 1] 4162 	dec (WLEN,sp)
      00A72E 27 25            [ 1] 4163 	jrne 1$
      00A730 90 F6            [ 1] 4164 	ld a,#70
      00A732 93 EE            [ 1] 4165 	cp a,(LLEN,sp)
      00A734 01 72            [ 1] 4166 	jrmi 2$   
      00A736 A9 00            [ 1] 4167 	ld a,#SPACE 
      00A738 03 72 A9         [ 4] 4168 	call putc 
      00A73B 00 03            [ 1] 4169 	inc (LLEN,sp) 
      00A73D 9F A4            [ 2] 4170 	jra 3$
      00A73F 07 4E            [ 1] 4171 2$: ld a,#CR 
      00A741 C7 54 01         [ 4] 4172 	call putc 
      00A744 72 16            [ 1] 4173 	clr (LLEN,sp)
      00A746 50 CA 72 10      [ 2] 4174 3$:	subw y,#2 
      00A74A 54 01            [ 2] 4175 	ldw y,(y)
      00A74C AE 00            [ 1] 4176 	jrne 0$ 
      00A74E 1B 5A            [ 1] 4177 	ld a,#CR 
      00A750 9D 26 FA         [ 4] 4178 	call putc  
      00A753 20               [ 1] 4179 	clrw x 
      00A754 08 72            [ 1] 4180 	ld a,(WCNT,sp)
      00A756 11               [ 1] 4181 	ld xl,a 
      00A757 54 01 72         [ 4] 4182 	call prt_i16 
      00A75A 17 50 CA         [ 2] 4183 	ldw x,#words_count_msg
      00A75D CD 09 5C         [ 4] 4184 	call puts 
      002E21                       4185 	_drop VSIZE 
      00A75D 81 03            [ 2]    1     addw sp,#VSIZE 
      00A75E 90 85            [ 2] 4186 	popw y 
      00A75E CD               [ 4] 4187 	ret 
      00A75F 9A 4F A1 01 27 03 CC  4188 words_count_msg: .asciz " words in dictionary\n"
             97 25 90 F6 93 EE 01
             72 A9 00 03 A3 00 05
             23
                                   4189 
                                   4190 
                                   4191 ;-----------------------------
                                   4192 ; BASIC: TIMER expr 
                                   4193 ; initialize count down timer 
                                   4194 ;-----------------------------
      002E3C                       4195 set_timer:
      00A775 05 A6 0A         [ 4] 4196 	call arg_list
      00A778 CC 97            [ 1] 4197 	cp a,#1 
      00A77A 27 9F            [ 1] 4198 	jreq 1$
      00A77C C7 00 0F         [ 2] 4199 	jp syntax_error
      002E46                       4200 1$: 
      002E46                       4201 	_xpop  
      00A77F A6 05            [ 1]    1     ld a,(y)
      00A781 C0               [ 1]    2     ldw x,y 
      00A782 00 0F            [ 2]    3     ldw x,(1,x)
      00A784 C7 54 00 72      [ 2]    4     addw y,#CELL_SIZE 
      00A788 16 54 02         [ 2] 4202 	ldw timer,x 
      00A78B 72               [ 4] 4203 	ret 
                                   4204 
                                   4205 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4206 ; BASIC: TIMEOUT 
                                   4207 ; return state of timer 
                                   4208 ; output:
                                   4209 ;   A:X     0 not timeout 
                                   4210 ;   A:X     -1 timeout 
                                   4211 ;------------------------------
      002E53                       4212 timeout:
      00A78C 10               [ 1] 4213 	clr a 
      00A78D 54 01 72         [ 2] 4214 	ldw x,timer 
      00A790 0F 54            [ 1] 4215 	jreq 1$
      00A792 00               [ 1] 4216 	clrw x
      00A793 FB               [ 4] 4217 	ret  
      00A794 CE               [ 1] 4218 1$:	cpl a
      00A795 54               [ 2] 4219 	cplw x 
      00A796 04               [ 4] 4220 	ret 
                                   4221  	
                                   4222 
                                   4223 
                                   4224 
                                   4225 ;-----------------------------------
                                   4226 ; BASIC: IWDGEN expr1 
                                   4227 ; enable independant watchdog timer
                                   4228 ; expr1 is delay in multiple of 62.5µsec
                                   4229 ; expr1 -> {1..16383}
                                   4230 ;-----------------------------------
      002E5E                       4231 enable_iwdg:
      00A797 A6 84 81         [ 4] 4232 	call arg_list
      00A79A A1 01            [ 1] 4233 	cp a,#1 
      00A79A 52 01            [ 1] 4234 	jreq 1$
      00A79C CD 9A 4F         [ 2] 4235 	jp syntax_error 
      002E68                       4236 1$: _xpop  
      00A79F A1 01            [ 1]    1     ld a,(y)
      00A7A1 27               [ 1]    2     ldw x,y 
      00A7A2 03 CC            [ 2]    3     ldw x,(1,x)
      00A7A4 97 25 90 F6      [ 2]    4     addw y,#CELL_SIZE 
      00A7A8 93 EE            [ 1] 4237 	push #0
      00A7AA 01 72 A9 00      [ 1] 4238 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A7AE 03               [ 1] 4239 	ld a,xh 
      00A7AF A3 00            [ 1] 4240 	and a,#0x3f
      00A7B1 0F               [ 1] 4241 	ld xh,a  
      00A7B2 23 05 A6         [ 2] 4242 2$:	cpw x,#255
      00A7B5 0A CC            [ 2] 4243 	jrule 3$
      00A7B7 97 27            [ 1] 4244 	inc (1,sp)
      00A7B9 CD               [ 1] 4245 	rcf 
      00A7BA AD               [ 2] 4246 	rrcw x 
      00A7BB 87 6B            [ 2] 4247 	jra 2$
      00A7BD 01 E6 01 0D      [ 1] 4248 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7C1 01               [ 1] 4249 	pop a  
      00A7C2 27 05 44         [ 1] 4250 	ld IWDG_PR,a 
      00A7C5 0A               [ 1] 4251 	ld a,xl
      00A7C6 01               [ 1] 4252 	dec a 
      00A7C7 26 FB A4 01      [ 1] 4253 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7CB 5F 97 4F         [ 1] 4254 	ld IWDG_RLR,a 
      00A7CE 5B 01 81 E0      [ 1] 4255 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A7D1 81               [ 4] 4256 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4257 
                                   4258 
                                   4259 ;-----------------------------------
                                   4260 ; BASIC: IWDGREF  
                                   4261 ; refresh independant watchdog count down 
                                   4262 ; timer before it reset MCU. 
                                   4263 ;-----------------------------------
      002E9C                       4264 refresh_iwdg:
      00A7D1 52 02 CD 9A      [ 1] 4265 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A7D5 54               [ 4] 4266 	ret 
                                   4267 
                                   4268 
                                   4269 ;-------------------------------------
                                   4270 ; BASIC: LOG2(expr)
                                   4271 ; return logarithm base 2 of expr 
                                   4272 ; this is the position of most significant
                                   4273 ; bit set. 
                                   4274 ; input: 
                                   4275 ; output:
                                   4276 ;   A     TK_INTGR 
                                   4277 ;   xstack log2 
                                   4278 ;*********************************
      002EA1                       4279 log2:
      00A7D6 A1 02 27         [ 4] 4280 	call func_args 
      00A7D9 03 CC            [ 1] 4281 	cp a,#1 
      00A7DB 97 25            [ 1] 4282 	jreq 1$
      00A7DD 90 F6 93         [ 2] 4283 	jp syntax_error 
      002EAB                       4284 1$: 
      002EAB                       4285 	_xpop    
      00A7E0 EE 01            [ 1]    1     ld a,(y)
      00A7E2 72               [ 1]    2     ldw x,y 
      00A7E3 A9 00            [ 2]    3     ldw x,(1,x)
      00A7E5 03 9F 6B 02      [ 2]    4     addw y,#CELL_SIZE 
      00A7E9 90               [ 1] 4286 	tnz a
      00A7EA F6 93            [ 1] 4287 	jrne 2$ 
      00A7EC EE               [ 2] 4288 	tnzw x 
      00A7ED 01 72            [ 1] 4289 	jrne 2$
      00A7EF A9 00            [ 1] 4290 	ld a,#ERR_BAD_VALUE
      00A7F1 03 A3 00         [ 2] 4291 	jp tb_error 
      00A7F4 0F 23            [ 1] 4292 2$: push #24 
      00A7F6 05               [ 2] 4293 3$: rlcw x 
      00A7F7 A6               [ 1] 4294     rlc a 
      00A7F8 0A CC            [ 1] 4295 	jrc 4$
      00A7FA 97 27            [ 1] 4296 	dec (1,sp) 
      00A7FC CD AD            [ 1] 4297 	jrne 3$
      00A7FE 87               [ 1] 4298 4$: clrw x 
      00A7FF 6B               [ 1] 4299     pop a 
      00A800 01               [ 1] 4300 	dec a
      00A801 A6               [ 1] 4301 	rlwa x  
      002ECD                       4302 9$:	
      00A802 01               [ 4] 4303 	ret 
                                   4304 
                                   4305 ;-----------------------------------
                                   4306 ; BASIC: BIT(expr) 
                                   4307 ; expr ->{0..23}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



                                   4308 ; return 2^expr 
                                   4309 ; output:
                                   4310 ;    A:X    2^expr 
                                   4311 ;-----------------------------------
      002ECE                       4312 bitmask:
      00A803 0D 01 27         [ 4] 4313     call func_args 
      00A806 05 48            [ 1] 4314 	cp a,#1
      00A808 0A 01            [ 1] 4315 	jreq 1$
      00A80A 26 FB 0D         [ 2] 4316 	jp syntax_error 
      002ED8                       4317 1$: _xpop 
      00A80D 02 26            [ 1]    1     ld a,(y)
      00A80F 05               [ 1]    2     ldw x,y 
      00A810 43 E4            [ 2]    3     ldw x,(1,x)
      00A812 00 20 02 EA      [ 2]    4     addw y,#CELL_SIZE 
      00A816 00               [ 1] 4318 	ld a,xl 
      00A817 E7 00 5B         [ 2] 4319 	ldw x,#1 
      00A81A 02 81            [ 1] 4320 	and a,#23
      00A81C 27 0A            [ 1] 4321 	jreq 9$
      00A81C 72               [ 1] 4322 	push a 
      00A81D 00               [ 1] 4323 	clr a 
      002EEB                       4324 2$: 
      00A81E 00               [ 2] 4325 	slaw x 
      00A81F 23               [ 1] 4326 	rlc a 	
      00A820 02 4F            [ 1] 4327 	dec (1,sp)
      00A822 81 FA            [ 1] 4328 	jrne 2$ 
      00A823                       4329 4$:
      002EF1                       4330     _drop 1 
      00A823 AE A8            [ 2]    1     addw sp,#1 
      00A825 4A               [ 4] 4331 9$:	ret 
                                   4332 
                                   4333 ;------------------------------
                                   4334 ; BASIC: DO 
                                   4335 ; initiate a DO ... UNTIL loop 
                                   4336 ;------------------------------
                           000003  4337 	DOLP_ADR=3 
                           000005  4338 	DOLP_INW=5
                           000004  4339 	VSIZE=4 
      002EF4                       4340 do_loop:
      00A826 CD               [ 2] 4341 	popw x 
      002EF5                       4342 	_vars VSIZE 
      00A827 89 DC            [ 2]    1     sub sp,#VSIZE 
      00A829 5B               [ 2] 4343 	pushw x 
      00A82A 02 52 04         [ 2] 4344 	ldw x,basicptr 
      00A82D CD A1            [ 2] 4345 	ldw (DOLP_ADR,sp),x
      00A82F 23 AE 16         [ 2] 4346 	ldw x,in.w 
      00A832 68 CF            [ 2] 4347 	ldw (DOLP_INW,sp),x
      00A834 00 05 7F 72      [ 1] 4348 	inc loop_depth 
      00A838 5F               [ 4] 4349 	ret 
                                   4350 
                                   4351 ;--------------------------------
                                   4352 ; BASIC: UNTIL expr 
                                   4353 ; loop if exprssion is false 
                                   4354 ; else terminate loop
                                   4355 ;--------------------------------
      002F07                       4356 until: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A839 00 03 5F CF      [ 1] 4357 	tnz loop_depth 
      00A83D 00 01            [ 1] 4358 	jrne 1$ 
      00A83F 72 11 00         [ 2] 4359 	jp syntax_error 
      002F10                       4360 1$: 
      00A842 23 72 18         [ 4] 4361 	call condition  
      002F13                       4362 	_xpop 
      00A845 00 23            [ 1]    1     ld a,(y)
      00A847 CC               [ 1]    2     ldw x,y 
      00A848 97 D0            [ 2]    3     ldw x,(1,x)
      00A84A 0A 62 72 65      [ 2]    4     addw y,#CELL_SIZE 
      00A84E 61               [ 1] 4363 	tnz a 
      00A84F 6B 20            [ 1] 4364 	jrne 9$ 
      00A851 70               [ 2] 4365 	tnzw x 
      00A852 6F 69            [ 1] 4366 	jrne 9$ 
      00A854 6E 74            [ 2] 4367 	ldw x,(DOLP_ADR,sp)
      00A856 2C 20 52         [ 2] 4368 	ldw basicptr,x 
      00A859 55 4E            [ 1] 4369 	ld a,(2,x)
      00A85B 20 74 6F         [ 1] 4370 	ld count,a 
      00A85E 20 72            [ 2] 4371 	ldw x,(DOLP_INW,sp)
      00A860 65 73 75         [ 2] 4372 	ldw in.w,x 
      00A863 6D               [ 4] 4373 	ret 
      002F32                       4374 9$:	; remove loop data from stack  
      00A864 65               [ 2] 4375 	popw x
      002F33                       4376 	_drop VSIZE
      00A865 2E 0A            [ 2]    1     addw sp,#VSIZE 
      00A867 00 5A 00 1F      [ 1] 4377 	dec loop_depth 
      00A868 FC               [ 2] 4378 	jp (x)
                                   4379 
                                   4380 ;--------------------------
                                   4381 ; BASIC: PORTA...PORTI  
                                   4382 ;  return constant value 
                                   4383 ;  PORT  base address 
                                   4384 ;---------------------------
      002F3A                       4385 const_porta:
      00A868 72 01 00         [ 2] 4386 	ldw x,#PA_BASE 
      00A86B 23               [ 1] 4387 	clr a 
      00A86C 01               [ 4] 4388 	ret 
      002F3F                       4389 const_portb:
      00A86D 81 72 5F         [ 2] 4390 	ldw x,#PB_BASE 
      00A870 00               [ 1] 4391 	clr a 
      00A871 23               [ 4] 4392 	ret 
      002F44                       4393 const_portc:
      00A872 CD 95 31         [ 2] 4394 	ldw x,#PC_BASE 
      00A875 81               [ 1] 4395 	clr a 
      00A876 81               [ 4] 4396 	ret 
      002F49                       4397 const_portd:
      00A876 89 CD 98         [ 2] 4398 	ldw x,#PD_BASE 
      00A879 A5               [ 1] 4399 	clr a 
      00A87A 85               [ 4] 4400 	ret 
      002F4E                       4401 const_porte:
      00A87B CD B2 C3         [ 2] 4402 	ldw x,#PE_BASE 
      00A87E 27               [ 1] 4403 	clr a 
      00A87F 4A               [ 4] 4404 	ret 
      002F53                       4405 const_portf:
      00A880 CD 87 67         [ 2] 4406 	ldw x,#PF_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A883 72               [ 1] 4407 	clr a 
      00A884 5F               [ 4] 4408 	ret 
      002F58                       4409 const_portg:
      00A885 00 19 52         [ 2] 4410 	ldw x,#PG_BASE 
      00A888 06               [ 1] 4411 	clr a 
      00A889 1D               [ 4] 4412 	ret 
      002F5D                       4413 const_porti:
      00A88A 00 04 1F         [ 2] 4414 	ldw x,#PI_BASE 
      00A88D 01               [ 1] 4415 	clr a 
      00A88E EE               [ 4] 4416 	ret 
                                   4417 
                                   4418 ;-------------------------------
                                   4419 ; following return constant 
                                   4420 ; related to GPIO register offset 
                                   4421 ;---------------------------------
      002F62                       4422 const_odr:
      00A88F 02               [ 1] 4423 	clr a 
      00A890 1F 03 A6         [ 2] 4424 	ldw x,#GPIO_ODR
      00A893 80               [ 4] 4425 	ret 
      002F67                       4426 const_idr:
      00A894 62               [ 1] 4427 	clr a 
      00A895 4D 27 01         [ 2] 4428 	ldw x,#GPIO_IDR
      00A898 5C               [ 4] 4429 	ret 
      002F6C                       4430 const_ddr:
      00A899 1F               [ 1] 4431 	clr a
      00A89A 05 1E 01         [ 2] 4432 	ldw x,#GPIO_DDR
      00A89D CF               [ 4] 4433 	ret 
      002F71                       4434 const_cr1:
      00A89E 00               [ 1] 4435 	clr a 
      00A89F 1A CD 87         [ 2] 4436 	ldw x,#GPIO_CR1
      00A8A2 E5               [ 4] 4437 	ret 
      002F76                       4438 const_cr2:
      00A8A3 AE               [ 1] 4439 	clr a
      00A8A4 00 80 CD         [ 2] 4440 	ldw x,#GPIO_CR2
      00A8A7 88               [ 4] 4441 	ret 
                                   4442 ;-------------------------
                                   4443 ; BASIC: POUT 
                                   4444 ;  constant for port mode
                                   4445 ;  used by PMODE 
                                   4446 ;  to set pin as output
                                   4447 ;------------------------
      002F7B                       4448 const_output:
      00A8A8 E0               [ 1] 4449 	clr a 
      00A8A9 1E 05 5A         [ 2] 4450 	ldw x,#OUTP
      00A8AC 1F               [ 4] 4451 	ret 
                                   4452 
                                   4453 ;-------------------------
                                   4454 ; BASIC: PINP 
                                   4455 ;  constant for port mode
                                   4456 ;  used by PMODE 
                                   4457 ;  to set pin as input
                                   4458 ;------------------------
      002F80                       4459 const_input:
      00A8AD 05               [ 1] 4460 	clr a  
      00A8AE 26 F0 1E         [ 2] 4461 	ldw x,#INP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A8B1 01               [ 4] 4462 	ret 
                                   4463 	
                                   4464 ;-----------------------
                                   4465 ; memory area constants
                                   4466 ;-----------------------
      002F85                       4467 const_eeprom_base:
      00A8B2 CF               [ 1] 4468 	clr a  
      00A8B3 00 1A A6         [ 2] 4469 	ldw x,#EEPROM_BASE 
      00A8B6 58               [ 4] 4470 	ret 
                                   4471 
                                   4472 ;---------------------------
                                   4473 ; BASIC: DATA 
                                   4474 ; when the interpreter find 
                                   4475 ; a DATA line it skip it.
                                   4476 ;---------------------------
      002F8A                       4477 data:
      00A8B7 5F CD 88 0B CD   [ 1] 4478 	mov in,count 
      00A8BC 88               [ 4] 4479 	ret 
                                   4480 
                                   4481 ;------------------------------
                                   4482 ; check if it is a DATA line 
                                   4483 ; input: 
                                   4484 ;    X    line address 
                                   4485 ; output:
                                   4486 ;    Z    set if DATA line 
                                   4487 ;----------------------------
      002F90                       4488 is_data_line:
      00A8BD 0B               [ 2] 4489 	pushw x 
      00A8BE 7B 03            [ 1] 4490 	ld a,(3,x)
      00A8C0 CD 88            [ 1] 4491 	cp a,#TK_CMD 
      00A8C2 0B 7B            [ 1] 4492 	jrne 9$
      00A8C4 04 CD            [ 2] 4493 	ldw x,(4,x)
      00A8C6 88 0B 5B         [ 2] 4494 	cpw x,#data  
      00A8C9 06               [ 2] 4495 9$: popw x 
      00A8CA 81               [ 4] 4496 	ret 
                                   4497 
                                   4498 ;---------------------------------
                                   4499 ; BASIC: RESTORE [line#]
                                   4500 ; set data_ptr to first data line
                                   4501 ; if no DATA found pointer set to
                                   4502 ; zero.
                                   4503 ; if a line# is given as argument 
                                   4504 ; a data line with that number 
                                   4505 ; is searched and the data pointer 
                                   4506 ; is set to it. If there is no 
                                   4507 ; data line with that number 
                                   4508 ; the program is interrupted. 
                                   4509 ;---------------------------------
      002F9E                       4510 restore:
      00A8CA 81               [ 1] 4511 	clrw x 
      00A8CB CF 00 06         [ 2] 4512 	ldw data_ptr,x 
      00A8CB 72 01 00         [ 2] 4513 	ldw data_ofs,x 
      00A8CE 23 05 A6         [ 2] 4514 	ldw x,txtbgn 
      00A8D1 07 CC 97         [ 4] 4515 	call next_token 
      00A8D4 27 84            [ 1] 4516 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A8D5 26 10            [ 1] 4517 	jrne 0$
      00A8D5 72 5F 00         [ 4] 4518 	call get_int24
      00A8D8 19 CD            [ 2] 4519 	pushw y 
      00A8DA 98               [ 1] 4520 	clr a 
      00A8DB 8C A1 03         [ 4] 4521 	call search_lineno  
      00A8DE 27 96            [ 2] 4522 	popw y 
      00A8E0 52               [ 2] 4523 	tnzw x 
      00A8E1 03 A1            [ 1] 4524 	jrne set_data_pointer 
      00A8E3 04 27            [ 2] 4525 	jra data_error 
      002FBF                       4526 0$:
      002FBF                       4527 	_unget_token  
      00A8E5 03 CC 97 25 CD   [ 1]    1      mov in,in.saved  
                                   4528 ; search first DATA line 	
      00A8EA 98 CE A4         [ 2] 4529 1$:	cpw x,txtend
      00A8ED DF A1            [ 1] 4530 	jruge data_error 
      002FC9                       4531 2$:	
      00A8EF 45 26 0C         [ 4] 4532 	call is_data_line 
      00A8F2 AE 40            [ 1] 4533 	jrne 4$
      00A8F4 00 CF 00         [ 4] 4534 4$:	call try_next_line 
      00A8F7 1A AE            [ 1] 4535 	jrne 4$ 
      00A8F9 47               [ 4] 4536 	ret 
                                   4537 
                                   4538 ;---------------------
                                   4539 ; set data pointer 
                                   4540 ; variables at new line 
                                   4541 ; input:
                                   4542 ;    X    line address 
                                   4543 ;----------------------
      002FD4                       4544 set_data_pointer:
      00A8FA FF 4F 20         [ 2] 4545 	ldw data_ptr,x
      00A8FD 15 A1            [ 1] 4546 	ld a,(2,x)
      00A8FF 46 27 06         [ 1] 4547 	ld data_len,a 
      00A902 AE 96 2D CC      [ 1] 4548 	mov data_ofs,#FIRST_DATA_ITEM
      00A906 97               [ 4] 4549 	ret 
                                   4550 
                                   4551 
                                   4552 ;--------------------
                                   4553 ; at end of data line 
                                   4554 ; check if next line 
                                   4555 ; is a data line 
                                   4556 ; input:
                                   4557 ;    X   actual line address 
                                   4558 ;  
                                   4559 ;-------------------
      002FE1                       4560 try_next_line: 
      00A907 27 02            [ 1] 4561 	ld a,(2,x)
      00A908 C7 00 0E         [ 1] 4562 	ld acc8,a 
      00A908 AE B9 80 CF      [ 1] 4563 	clr acc16 
      00A90C 00 1A A6 02      [ 2] 4564 	addw x,acc16 
      00A910 AE 7F FF         [ 2] 4565 	cpw x,txtend 
      00A913 25 02            [ 1] 4566 	jrult 1$
      00A913 6B 01            [ 2] 4567 	jra data_error 
      002FF5                       4568 1$:	
      00A915 1F 02 CD         [ 4] 4569 	call is_data_line 
      00A918 87 67            [ 1] 4570 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A91A A6 01            [ 1] 4571 	ld a,#1  
      00A91A CD 88            [ 2] 4572 	jra 9$
      00A91C EE 27 08         [ 4] 4573 2$:	call set_data_pointer
      00A91F A6               [ 1] 4574 	clr a  
      00A920 45               [ 4] 4575 9$:	ret 
      003003                       4576 data_error:	
      00A921 CD 89            [ 1] 4577     ld a,#ERR_NO_DATA 
      00A923 7F CD 87         [ 2] 4578 	jp tb_error 
                                   4579 
                                   4580 
                                   4581 ;---------------------------------
                                   4582 ; BASIC: READ 
                                   4583 ; return next data item | 0 
                                   4584 ;---------------------------------
                           000001  4585 	CTX_BPTR=1 
                           000003  4586 	CTX_IN=3 
                           000004  4587 	CTX_COUNT=4 
                           000005  4588 	INT24=5
                           000007  4589 	VSIZE=7 
      003008                       4590 read:
      003008                       4591 	_vars  VSIZE 
      00A926 E5 AE            [ 2]    1     sub sp,#VSIZE 
      00A928 00 80 CD         [ 4] 4592 	call save_context
      00300D                       4593 read01:	
      00A92B 88 E0 7B         [ 1] 4594 	ld a,data_ofs
      00A92E 01 1E 02         [ 1] 4595 	cp a,data_len 
      00A931 72 B0            [ 1] 4596 	jreq 2$ ; end of line  
      003015                       4597 0$:
      00A933 00 1A C2         [ 2] 4598 	ldw x,data_ptr 
      00A936 00 19 22         [ 2] 4599 	ldw basicptr,x 
      00A939 E0 CD 95 31 1E   [ 1] 4600 	mov in,data_ofs 
      00A93E 02 A3 47 FF 26   [ 1] 4601 	mov count,data_len  
      00A943 03 CD 9D         [ 4] 4602 	call expression 
      00A946 C2 84            [ 1] 4603 	cp a,#TK_INTGR 
      00A947 27 03            [ 1] 4604 	jreq 1$ 
      00A947 5B 03 81         [ 2] 4605 	jp syntax_error 
      00A94A                       4606 1$:
      00A94A 89 9F A4         [ 4] 4607 	call next_token ; skip comma
      00A94D 80 97 FE         [ 2] 4608 	ldw x,basicptr 
      00A950 C3 AA 62         [ 2] 4609 	ldw data_ptr,x 
      00A953 85 81 01 00 08   [ 1] 4610 	mov data_ofs,in 
      00A955 CD 20 B3         [ 4] 4611 	call rest_context
      003040                       4612 	_xpop 
      00A955 88 4D            [ 1]    1     ld a,(y)
      00A957 27               [ 1]    2     ldw x,y 
      00A958 0A F6            [ 2]    3     ldw x,(1,x)
      00A95A 5C 90 F7 90      [ 2]    4     addw y,#CELL_SIZE 
      003049                       4613 	_drop VSIZE 
      00A95E 5C 0A            [ 2]    1     addw sp,#VSIZE 
      00A960 01               [ 4] 4614 	ret 
      00304C                       4615 2$: ; end of line reached 
                                   4616 	; try next line 
      00A961 26 F6 84         [ 2] 4617 	ldw x,data_ptr  
      00A964 81 2F E1         [ 4] 4618 	call try_next_line
      00A965 27 C1            [ 1] 4619 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A965 88 90            [ 2] 4620 	jra data_error 
                                   4621 
                                   4622 ;---------------------------------
                                   4623 ; BASIC: SPIEN clkdiv, 0|1  
                                   4624 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4625 ; if clkdiv==-1 disable SPI
                                   4626 ; 0|1 -> disable|enable  
                                   4627 ;--------------------------------- 
                           000005  4628 SPI_CS_BIT=5
      003056                       4629 spi_enable:
      00A967 AE 16 B8         [ 4] 4630 	call arg_list 
      00A96A 90 89            [ 1] 4631 	cp a,#2
      00A96C A6 80            [ 1] 4632 	jreq 1$
      00A96E 90 7F 90         [ 2] 4633 	jp syntax_error 
      003060                       4634 1$: 
      00A971 5C 4A 26 F9      [ 1] 4635 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A975 90               [ 2] 4636 	popw x  
      00A976 85               [ 2] 4637 	tnzw x 
      00A977 84 81            [ 1] 4638 	jreq spi_disable 
      00A979 85               [ 2] 4639 	popw x 
      00A979 89 AE            [ 1] 4640 	ld a,#(1<<SPI_CR1_BR)
      00A97B B9               [ 4] 4641 	mul x,a 
      00A97C 80               [ 1] 4642 	ld a,xl 
      00A97D CD AA 66         [ 1] 4643 	ld SPI_CR1,a 
                                   4644 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A980 27 0D F6 EA      [ 1] 4645 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A984 01 27 23 CD      [ 1] 4646 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4647 ; configure SPI as master mode 0.	
      00A988 AA 71 5D 26      [ 1] 4648 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4649 ; ~CS line controlled by sofware 	
      00A98C F0 20 1B 01      [ 1] 4650 	bset SPI_CR2,#SPI_CR2_SSM 
      00A98F 72 10 52 01      [ 1] 4651     bset SPI_CR2,#SPI_CR2_SSI 
                                   4652 ; enable SPI
      00A98F CF 00 0E EE      [ 1] 4653 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A993 02               [ 4] 4654 	ret 
      003089                       4655 spi_disable:
      003089                       4656 	_drop #2; throw first argument.
      00A994 1C 00            [ 2]    1     addw sp,##2 
                                   4657 ; wait spi idle 
      00A996 04 1C            [ 1] 4658 1$:	ld a,#0x82 
      00A998 00 7F 9F         [ 1] 4659 	and a,SPI_SR
      00A99B A4 80            [ 1] 4660 	cp a,#2 
      00A99D 97 13            [ 1] 4661 	jrne 1$
      00A99F 01 24 05 CE      [ 1] 4662 	bres SPI_CR1,#SPI_CR1_SPE
      00A9A3 00 0E 20 E0      [ 1] 4663 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A9A7 CE 00 0E 5B      [ 1] 4664 	bres PE_DDR,#SPI_CS_BIT 
      00A9AB 02               [ 4] 4665 	ret 
                                   4666 
      0030A1                       4667 spi_clear_error:
      00A9AC 81 78            [ 1] 4668 	ld a,#0x78 
      00A9AD C5 52 03         [ 1] 4669 	bcp a,SPI_SR 
      00A9AD 89 4B            [ 1] 4670 	jreq 1$
      00A9AF 04 72 5F 00      [ 1] 4671 	clr SPI_SR 
      00A9B3 19               [ 4] 4672 1$: ret 
                                   4673 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      0030AD                       4674 spi_send_byte:
      00A9B4 CF               [ 1] 4675 	push a 
      00A9B5 00 1A 4F         [ 4] 4676 	call spi_clear_error
      00A9B8 5F               [ 1] 4677 	pop a 
      00A9B9 CD 88 0B 0A 01   [ 2] 4678 	btjf SPI_SR,#SPI_SR_TXE,.
      00A9BE 26 F9 5B         [ 1] 4679 	ld SPI_DR,a
      00A9C1 01 85 CF 00 1A   [ 2] 4680 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A9C6 81 52 04         [ 1] 4681 	ld a,SPI_DR 
      00A9C7 81               [ 4] 4682 	ret 
                                   4683 
      0030C3                       4684 spi_rcv_byte:
      00A9C7 89 90            [ 1] 4685 	ld a,#255
      00A9C9 89 52 06 CD 9E   [ 2] 4686 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A9CE DC 26 03         [ 1] 4687 	ld a,SPI_DR 
      00A9D1 CC               [ 4] 4688 	ret
                                   4689 
                                   4690 ;------------------------------
                                   4691 ; BASIC: SPIWR byte [,byte]
                                   4692 ; write 1 or more byte
                                   4693 ;------------------------------
      0030CE                       4694 spi_write:
      00A9D2 AA 5C 1F         [ 4] 4695 	call expression
      00A9D5 05 72            [ 1] 4696 	cp a,#TK_INTGR 
      00A9D7 5F 00            [ 1] 4697 	jreq 1$
      00A9D9 19 CD A9         [ 2] 4698 	jp syntax_error 
      0030D8                       4699 1$:	
      00A9DC 79               [ 1] 4700 	ld a,xl 
      00A9DD CF 00 1A         [ 4] 4701 	call spi_send_byte 
      00A9E0 AE FF FF         [ 4] 4702 	call next_token 
      00A9E3 72 B0            [ 1] 4703 	cp a,#TK_COMMA 
      00A9E5 00 1A            [ 1] 4704 	jrne 2$ 
      00A9E7 1D 00            [ 2] 4705 	jra spi_write 
      00A9E9 04               [ 1] 4706 2$:	tnz a 
      00A9EA 13 05            [ 1] 4707 	jreq 3$
      0030E8                       4708 	_unget_token  
      00A9EC 24 05 A6 01 CC   [ 1]    1      mov in,in.saved  
      00A9F1 97               [ 4] 4709 3$:	ret 
                                   4710 
                                   4711 
                                   4712 ;-------------------------------
                                   4713 ; BASIC: SPIRD 	
                                   4714 ; read one byte from SPI 
                                   4715 ;-------------------------------
      0030EE                       4716 spi_read:
      00A9F2 27 30 C3         [ 4] 4717 	call spi_rcv_byte 
      00A9F3 5F               [ 1] 4718 	clrw x 
      00A9F3 CE               [ 1] 4719 	ld xl,a 
      00A9F4 00               [ 1] 4720 	clr a  
      00A9F5 1A               [ 4] 4721 	ret 
                                   4722 
                                   4723 ;------------------------------
                                   4724 ; BASIC: SPISEL 0|1 
                                   4725 ; set state of ~CS line
                                   4726 ; 0|1 deselect|select  
                                   4727 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      0030F5                       4728 spi_select:
      00A9F6 F6 EA 01         [ 4] 4729 	call next_token 
      00A9F9 EA 02            [ 1] 4730 	cp a,#TK_INTGR 
      00A9FB EA 03            [ 1] 4731 	jreq 1$
      00A9FD 27 03 CD         [ 2] 4732 	jp syntax_error 
      00AA00 A9               [ 2] 4733 1$: tnzw x  
      00AA01 AD 05            [ 1] 4734 	jreq cs_high 
      00AA02 72 1B 50 14      [ 1] 4735 	bres PE_ODR,#SPI_CS_BIT
      00AA02 CD               [ 4] 4736 	ret 
      003107                       4737 cs_high: 
      00AA03 87 A7 0F 03      [ 1] 4738 	bset PE_ODR,#SPI_CS_BIT
      00AA07 CD               [ 4] 4739 	ret 
                                   4740 
                                   4741 ;-------------------------------
                                   4742 ; BASIC: PAD 
                                   4743 ; Return pad buffer address.
                                   4744 ;------------------------------
      00310C                       4745 pad_ref:
      00AA08 A9 65 CE         [ 2] 4746 	ldw x,#pad 
      00AA0B AA               [ 1] 4747 	clr a
      00AA0C 62               [ 4] 4748 	ret 
                                   4749 
                                   4750 ;****************************
                                   4751 ; expression stack 
                                   4752 ; manipulation routines
                                   4753 ;****************************
                                   4754 
                                   4755 ;-----------------------------
                                   4756 ; BASIC: PUSH expr|rel|cond 
                                   4757 ; push the result on xtack
                                   4758 ;-----------------------------
      003111                       4759 xpush:
      00AA0D 90 FF 72         [ 4] 4760 	call condition 
      00AA10 A9               [ 4] 4761 	ret 
                                   4762 
                                   4763 ;------------------------------
                                   4764 ; BASIC: POP 
                                   4765 ; pop top of xstack 
                                   4766 ;------------------------------
      003115                       4767 xpop:
      003115                       4768 	_xpop 
      00AA11 00 02            [ 1]    1     ld a,(y)
      00AA13 1E               [ 1]    2     ldw x,y 
      00AA14 05 90            [ 2]    3     ldw x,(1,x)
      00AA16 FF 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00AA1A 02               [ 4] 4769 	ret 
                                   4770 
                                   4771 
                                   4772 ;------------------------------
                                   4773 ; BASIC: ALLOC expr 
                                   4774 ; allocate expr element on xtack 
                                   4775 ;-------------------------------
      00311F                       4776 xalloc: 
      00AA1B A6 7C A3         [ 4] 4777 	call expression 
      00AA1E 00 7C            [ 1] 4778 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AA20 22 01            [ 1] 4779 	jreq 1$ 
      00AA22 9F 6B 04         [ 2] 4780 	jp syntax_error
      003129                       4781 1$: _xpop 
      00AA25 CE 00            [ 1]    1     ld a,(y)
      00AA27 1C               [ 1]    2     ldw x,y 
      00AA28 1F 01            [ 2]    3     ldw x,(1,x)
      00AA2A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AA2A 1E               [ 1] 4782 	tnz a 
      00AA2B 01 7B            [ 1] 4783 	jreq 3$ 
      00AA2D 04 CD            [ 1] 4784 2$:	ld a,#ERR_BAD_VALUE
      00AA2F A9 55 1F         [ 2] 4785 	jp tb_error 
      00AA32 01 AE 16         [ 2] 4786 3$: cpw x,#XSTACK_SIZE 
      00AA35 B8 CD            [ 1] 4787 	jrugt 2$
      00AA37 87 C1            [ 1] 4788 	ld a,#CELL_SIZE 
      00AA39 AE               [ 4] 4789 	mul x,a 
      00AA3A 00 80 CD         [ 2] 4790 	ldw acc16,x 
      00AA3D 88 E0 1E 01      [ 2] 4791 	subw y,acc16 
      00AA41 C3 00 1E 24      [ 2] 4792 	cpw y,#xstack_full
      00AA45 16 1E            [ 1] 4793 	jrugt 9$
      00AA47 05 72            [ 1] 4794 	ld a,#ERR_MEM_FULL
      00AA49 F0 03 1F         [ 2] 4795 	jp tb_error 
      003154                       4796 9$:	 
      00AA4C 05               [ 4] 4797 	ret 
                                   4798 
                                   4799 
                                   4800 ;------------------------------
                                   4801 ;  BASIC DROP expr 
                                   4802 ;  expr in range {0..XSTACK_SIZE}
                                   4803 ;  discard n elements from xtack
                                   4804 ;------------------------------
      003155                       4805 xdrop:
      00AA4D A6 80 A3         [ 4] 4806 	call expression 
      00AA50 00 80            [ 1] 4807 	cp a,#TK_INTGR
      00AA52 24 01            [ 1] 4808 	jreq 1$ 
      00AA54 9F 6B 04         [ 2] 4809 	jp syntax_error 
      00315F                       4810 1$:	_xpop 
      00AA57 CD A9            [ 1]    1     ld a,(y)
      00AA59 65               [ 1]    2     ldw x,y 
      00AA5A 20 CE            [ 2]    3     ldw x,(1,x)
      00AA5C 5B 06 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00AA60 85               [ 1] 4811 	ld a,xl 
      00AA61 81 54            [ 1] 4812 	and a,#0x1f 
      00AA63 42               [ 1] 4813 	clrw x 
      00AA64 58               [ 1] 4814 	ld xl,a 
      00AA65 58 03            [ 1] 4815 	ld a,#CELL_SIZE 
      00AA66 42               [ 4] 4816 	mul x,a 
      00AA66 89 9F A4         [ 2] 4817 	ldw acc16,x  
      00AA69 80 97 FE C3      [ 2] 4818 	addw y,acc16 
      00AA6D AA 64 85 81      [ 2] 4819 	cpw y,#XSTACK_EMPTY 
      00AA71 23 04            [ 2] 4820 	jrule 9$
      00AA71 9F A4 80 97      [ 2] 4821 	ldw y,#XSTACK_EMPTY 
      00AA75 CF               [ 4] 4822 9$:	ret 
                                   4823 
                                   4824 ;-----------------------
                                   4825 ; check if value in A:X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



                                   4826 ; is inside xstack bound
                                   4827 ; output:
                                   4828 ;    X     slot address  
                                   4829 ;-----------------------
      003182                       4830 xstack_bound:
      00AA76 00               [ 1] 4831 	tnz a 
      00AA77 0E EE            [ 1] 4832 	jrne 8$ 
      00AA79 02 72 BB         [ 2] 4833 1$: cpw x,#XSTACK_SIZE 
      00AA7C 00 0E            [ 1] 4834 	jrugt 8$
      00AA7E 1C 00            [ 1] 4835 	ld a,#CELL_SIZE 
      00AA80 04               [ 4] 4836 	mul x,a
      00AA81 1C 00 7F         [ 2] 4837 	ldw acc16,x 
      00AA84 9F               [ 1] 4838 	ldw x,y 
      00AA85 A4 80 97 81      [ 2] 4839 	addw x,acc16 
      00AA89 A3 17 73         [ 2] 4840 	cpw x,#XSTACK_EMPTY 
      00AA89 AE B9            [ 1] 4841 	jruge 8$  
      00AA8B 80               [ 4] 4842 	ret 
      00AA8C 89 0A            [ 1] 4843 8$: ld a,#ERR_BAD_VALUE
      00AA8D CC 16 A7         [ 2] 4844 	jp tb_error 
                                   4845 
                                   4846 ;-------------------------
                                   4847 ; BASIC: PUT expr, cond 
                                   4848 ; expr -> slot 
                                   4849 ; cond -> valut to put 
                                   4850 ; on xstack 
                                   4851 ;-------------------------
      0031A0                       4852 xput:
      00AA8D CD A9 4A         [ 4] 4853 	call arg_list 
      00AA90 26 3B            [ 1] 4854 	cp a,#2 
      00AA92 1C 00            [ 1] 4855 	jreq 1$ 
      00AA94 04 35 10         [ 2] 4856 0$:	jp syntax_error
      0031AA                       4857 1$: _xpop   ; value to put 
      00AA97 00 0B            [ 1]    1     ld a,(y)
      00AA99 CD               [ 1]    2     ldw x,y 
      00AA9A 98 D4            [ 2]    3     ldw x,(1,x)
      00AA9C A6 20 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00AAA0 7F               [ 2] 4858 	pushw x 
      00AAA1 1E               [ 1] 4859 	push a 
      0031B5                       4860 	_xpop    ; slot 
      00AAA2 01 EE            [ 1]    1     ld a,(y)
      00AAA4 02               [ 1]    2     ldw x,y 
      00AAA5 35 0A            [ 2]    3     ldw x,(1,x)
      00AAA7 00 0B CD 98      [ 2]    4     addw y,#CELL_SIZE 
      00AAAB D4 AE 9F         [ 4] 4861 	call xstack_bound
      00AAAE 46 CD 89         [ 2] 4862     ldw ptr16,x 
      00AAB1 DC               [ 1] 4863 	pop a 
      00AAB2 A6               [ 2] 4864 	popw x 
      00AAB3 2C CD 89 7F      [ 4] 4865 	ld [ptr16],a 
      00AAB7 1E 01 1C 00      [ 1] 4866 	inc ptr8 
      00AABB 08 CD 89 DC      [ 5] 4867 	ldw [ptr16],x 
      00AABF A6               [ 4] 4868 	ret 
                                   4869 
                                   4870 ;------------------------
                                   4871 ; BASIC: PICK expr 
                                   4872 ; get nième element on 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



                                   4873 ; xtack. 
                                   4874 ;-----------------------
      0031D3                       4875 xpick:
      00AAC0 0D CD 89         [ 4] 4876 	call func_args 
      00AAC3 7F 1E            [ 1] 4877 	cp a,#1 
      00AAC5 01 CD            [ 1] 4878 	jreq 1$
      00AAC7 AA 71 1F         [ 2] 4879 	jp syntax_error 
      0031DD                       4880 1$: _xpop 
      00AACA 01 20            [ 1]    1     ld a,(y)
      00AACC C0               [ 1]    2     ldw x,y 
      00AACD EE 01            [ 2]    3     ldw x,(1,x)
      00AACD CD AA 66 27      [ 2]    4     addw y,#CELL_SIZE 
      00AAD1 F4 31 82         [ 4] 4881 	call xstack_bound
      00AAD2 F6               [ 1] 4882     ld a,(x)
      00AAD2 5B 02            [ 2] 4883 	ldw x,(1,x)				
      00AAD4 81               [ 4] 4884 	ret 
                                   4885 
                                   4886 
                                   4887 ;----------------------------
                                   4888 ; BASIC: AUTORUN \C | label  
                                   4889 ;  \C -> cancel autorun 
                                   4890 ;  addr -> register an 
                                   4891 ;    autorun program 
                                   4892 ;    this program execute at 
                                   4893 ;     reset/boot 
                                   4894 ;----------------------------
      00AAD5                       4895 cmd_auto_run:
      00AAD5 CD 9B 96         [ 4] 4896 	call next_token 
      00AAD8 A1 84            [ 1] 4897 	cp a,#TK_LABEL 
      00AADA 27 03            [ 1] 4898 	jreq 1$ 
      00AADC CC 97            [ 1] 4899 	cp a,#TK_CHAR 
      00AADE 25 90            [ 1] 4900 	jrne 0$ 
      00AAE0 F6               [ 1] 4901 	ld a,(x)
      00AAE1 93 EE 01 72      [ 1] 4902 	inc in 
      00AAE5 A9 00            [ 1] 4903 	and a,#0xDF 
      00AAE7 03 C7            [ 1] 4904 	cp a,#'C 
      00AAE9 00 19            [ 1] 4905 	jrne 0$ 
      00AAEB CF 00 1A         [ 2] 4906 	ldw x,#EEPROM_BASE 
      00AAEE CD 29 2D         [ 4] 4907 	call erase_header
      00AAEE CD               [ 4] 4908 	ret 
      00AAEF 98 8C A1         [ 2] 4909 0$:	jp syntax_error
      00AAF2 08               [ 2] 4910 1$:	pushw x 
      00AAF3 27 02 20         [ 4] 4911 	call skip_string
      00AAF6 46               [ 2] 4912 	popw x 
      00AAF7 CD 98 8C         [ 4] 4913 	call search_program
      00AAFA A1 04            [ 1] 4914 	jrne 2$ 
      00AAFC 27 23            [ 1] 4915 	ld a,#ERR_BAD_VALUE
      00AAFE A1 02 27         [ 2] 4916 	jp tb_error 
      00AB01 2A               [ 2] 4917 2$: pushw x 
      00AB02 55 00 04 00      [ 1] 4918 	clr farptr 
      00AB06 02 CD 9B         [ 2] 4919 	ldw x,#EEPROM_BASE
      00AB09 96 A1 84         [ 2] 4920 	ldw ptr16,x 
      00AB0C 27 03 CC         [ 1] 4921 	ld a,AR_SIGN 
      00AB0F 97               [ 1] 4922 	clrw x 	 
      00AB10 25 90 F6         [ 4] 4923 	call write_byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AB13 93 EE 01         [ 1] 4924 	ld a,AR_SIGN+1
      00AB16 72 A9 00         [ 4] 4925 	call write_byte 
      00AB19 03 9F            [ 1] 4926 	ld a,(1,sp)
      00AB1B 5F CD 88         [ 4] 4927 	call write_byte 
      00AB1E 0B 20            [ 1] 4928 	ld a,(2,sp)
      00AB20 CD 07 8B         [ 4] 4929 	call write_byte 
      00AB21                       4930 	_drop 2 
      00AB21 F6 72            [ 2]    1     addw sp,#2 
      00AB23 5C               [ 4] 4931 	ret 
                                   4932 
      00AB24 00 02                 4933 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4934 
                                   4935 ;-------------------------------
                                   4936 ; search a program in flash 
                                   4937 ; memory with a label at first 
                                   4938 ; that correspond to name 
                                   4939 ; pointed by X 
                                   4940 ; input:
                                   4941 ;    x      *name 
                                   4942 ; output: 
                                   4943 ;    X     prog_addr|0
                                   4944 ;-------------------------------
                           000001  4945 	WLKPTR=1 
                           000003  4946 	PNAME=3
                           000005  4947 	LIMIT=5
                           000007  4948 	YSAVE=7
                           000006  4949 	VSIZE=6 
      003243                       4950 search_program:
      00AB26 5F CD            [ 2] 4951 	pushw y 
      003245                       4952 	_vars VSIZE 
      00AB28 88 0B            [ 2]    1     sub sp,#VSIZE 
      00AB2A 20 C2            [ 2] 4953 	ldw (PNAME,sp),x 
      00AB2C CD 2B 55         [ 4] 4954 	call uflash 
      00AB2C 89 F6            [ 2] 4955 	ldw (LIMIT,sp),x 
      00AB2E 72 5C 00         [ 2] 4956 	ldw x,#app_space 
      00AB31 02 5F            [ 2] 4957 1$:	ldw (WLKPTR,sp),x  
      00AB33 CD               [ 1] 4958 	clr a 
      00AB34 88 0B 85         [ 4] 4959 	call is_program_addr
      00AB37 F6 27            [ 1] 4960 	jrne 4$
      00AB39 B4 5C 20         [ 2] 4961 	addw x,#7 
      00AB3C EF               [ 1] 4962 	ld a,(x)
      00AB3D A1 03            [ 1] 4963 	cp a,#TK_LABEL 
      00AB3D 81 08            [ 1] 4964 	jrne 4$ 
      00AB3E 5C               [ 1] 4965 	incw x 
      00AB3E CD 9A            [ 2] 4966 	ldw y,(PNAME,sp)
      00AB40 4F A1 01         [ 4] 4967 	call strcmp
      00AB43 27 03            [ 1] 4968 	jrne 6$
      003269                       4969 4$: 
      00AB45 CC 97 25         [ 4] 4970 	call skip_to_next
      00AB48 90 F6            [ 2] 4971 	cpw x,(LIMIT,sp)
      00AB4A 93 EE            [ 1] 4972 	jrult 1$
      00AB4C 01               [ 1] 4973 	clrw x 
      00AB4D 72 A9            [ 2] 4974 	jra 8$
      003273                       4975 6$: ; found label 
      00AB4F 00 03            [ 2] 4976 	ldw x,(WLKPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AB51 9F A4 7F         [ 2] 4977 	addw x,#4 	
      003278                       4978 8$:	
      003278                       4979 	_drop VSIZE  
      00AB54 81 06            [ 2]    1     addw sp,#VSIZE 
      00AB55 90 85            [ 2] 4980 	popw y 
      00AB55 A6               [ 4] 4981 	ret 
                                   4982 
                                   4983 
                                   4984 ;-------------------------------
                                   4985 ; BASIC: CHAIN label [, line#]
                                   4986 ; Execute another program like it 
                                   4987 ; is a sub-routine. When the 
                                   4988 ; called program terminate 
                                   4989 ; execution continue at caller 
                                   4990 ; after CHAIN command. 
                                   4991 ; if a line# is given, the 
                                   4992 ; chained program start execution 
                                   4993 ; at this line#.
                                   4994 ;---------------------------------
                           000003  4995 	CHAIN_LN=3 
                           000005  4996 	CHAIN_ADDR=5 
                           000007  4997 	CHAIN_BP=7
                           000009  4998 	CHAIN_IN=9
                           00000A  4999 	CHAIN_COUNT=10 
                           00000B  5000 	CHAIN_TXTBGN=11 
                           00000D  5001 	CHAIN_TXTEND=13 
                           00000C  5002 	VSIZE=12 
                           000004  5003 	DISCARD=4 
      00327D                       5004 cmd_chain:
      00AB56 06               [ 2] 5005 	popw x 
      00327E                       5006 	_vars VSIZE 
      00AB57 CD 9A            [ 2]    1     sub sp,#VSIZE 
      00AB59 42               [ 2] 5007 	pushw x
      00AB5A CD 98            [ 1] 5008 	clr (CHAIN_LN,sp) 
      00AB5C 8C A1            [ 1] 5009 	clr (CHAIN_LN+1,sp)  
      00AB5E 02 27            [ 1] 5010 	ld a,#TK_LABEL 
      00AB60 0E A1 04         [ 4] 5011 	call expect 
      00AB63 27               [ 2] 5012 	pushw x 
      00AB64 12 A1 82         [ 4] 5013 	call skip_string
      00AB67 27               [ 2] 5014 	popw x 
      00AB68 03 CC 97         [ 4] 5015 	call search_program 
      00AB6B 25               [ 2] 5016 	tnzw x  
      00AB6C 26 05            [ 1] 5017 	jrne 1$ 
      00AB6C FD 20            [ 1] 5018 0$:	ld a,#ERR_BAD_VALUE
      00AB6E 0B 16 A7         [ 2] 5019 	jp tb_error 
      00AB6F 1F 05            [ 2] 5020 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AB6F F6 88 CD         [ 4] 5021     call next_token 
      00AB72 98 A5            [ 1] 5022 	cp a,#TK_COMMA 
      00AB74 84 20            [ 1] 5023 	jrne 4$
      00AB76 03 84            [ 1] 5024 	ld a,#TK_INTGR
      00AB77 CD 19 C2         [ 4] 5025 	call expect 
      00AB77 CD 98 CE         [ 4] 5026 	call get_int24 
      00AB7A 5F 02            [ 2] 5027 	ldw (CHAIN_LN,sp),x
      00AB7C 72 A2            [ 2] 5028 	jra 6$ 
      0032AF                       5029 4$: _unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AB7E 00 03 90 F7 90   [ 1]    1      mov in,in.saved  
      0032B4                       5030 6$: ; save chain context 
      00AB83 EF 01 A6         [ 2] 5031 	ldw x,basicptr 
      00AB86 07 CD            [ 2] 5032 	ldw (CHAIN_BP,sp),x 
      00AB88 9A 42 01         [ 2] 5033 	ldw x,in
      00AB8A 1F 09            [ 2] 5034 	ldw (CHAIN_IN,sp),x
      00AB8A 90 F6 93         [ 2] 5035 	ldw x,txtbgn 
      00AB8D EE 01            [ 2] 5036 	ldw (CHAIN_TXTBGN,sp),x
      00AB8F 72 A9 00         [ 2] 5037 	ldw x,txtend 
      00AB92 03 81            [ 2] 5038 	ldw (CHAIN_TXTEND,sp),x  
                                   5039 ; set chained program context 	
      00AB94 1E 05            [ 2] 5040 	ldw x,(CHAIN_ADDR,sp)
      00AB94 CD 89 8F         [ 2] 5041 	ldw basicptr,x 
      00AB97 81 00 1B         [ 2] 5042 	ldw txtbgn,x 
      00AB98 1D 00 02         [ 2] 5043 	subw x,#2
      00AB98 5F               [ 2] 5044 	ldw x,(x)
      00AB99 C6 00 2F         [ 2] 5045 	addw x,(CHAIN_ADDR,sp)
      00AB9C C0 00 30         [ 2] 5046 	ldw txtend,x  
      00AB9F 27 03            [ 2] 5047 	ldw x,(CHAIN_ADDR,sp)
      00ABA1 53 A6            [ 1] 5048 	ld a,(2,x)
      00ABA3 FF 00 02         [ 1] 5049 	ld count,a 
      00ABA4 35 03 00 01      [ 1] 5050 	mov in,#3 
      00ABA4 81 03            [ 2] 5051 	ldw x,(CHAIN_LN,sp)
      00ABA5 5D               [ 2] 5052 	tnzw x 
      00ABA5 CD 9A            [ 1] 5053 	jreq 8$ 
      00ABA7 4F A1            [ 2] 5054 	pushw y
      00ABA9 02               [ 1] 5055 	clr a  
      00ABAA 27 03 CC         [ 4] 5056 	call search_lineno
      00ABAD 97 25            [ 2] 5057 	popw y 
      00ABAF 90               [ 2] 5058 	tnzw x 
      00ABB0 E6 03            [ 1] 5059 	jreq 0$ 
      00ABB2 93 EE 04         [ 2] 5060 	ldw basicptr,x 
      00ABB5 A3 50            [ 1] 5061 	ld a,(2,x)
      00ABB7 00 2B 16         [ 1] 5062 	ld count,a 
      00ABBA A3 50 29 2A      [ 1] 5063 8$: inc chain_level
      00ABBE 11               [ 2] 5064 	popw x 
      003302                       5065 	_drop DISCARD
      00ABBF 89 90            [ 2]    1     addw sp,#DISCARD 
      00ABC1 F6               [ 2] 5066 	jp (x)
                                   5067 
                                   5068 
                                   5069 ;------------------------------
                                   5070 ;      dictionary 
                                   5071 ; format:
                                   5072 ;   link:   2 bytes 
                                   5073 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5074 ;   cmd_name: 16 byte max 
                                   5075 ;   code_addr: 2 bytes 
                                   5076 ;------------------------------
                                   5077 	.macro _dict_entry len,name,code_addr 
                                   5078 	.word LINK 
                                   5079 	LINK=.
                                   5080 name:
                                   5081 	.byte len   	
                                   5082 	.ascii "name"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



                                   5083 	.word code_addr  
                                   5084 	.endm 
                                   5085 
                           000000  5086 	LINK=0
                                   5087 ; respect alphabetic order for BASIC names from Z-A
                                   5088 ; this sort order is for a cleaner WORDS cmd output. 	
      003305                       5089 kword_end:
      003305                       5090 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00ABC2 93 EE                    1 	.word LINK 
                           003307     2 	LINK=.
      003307                          3 XOR:
      00ABC4 01                       4 	.byte 3+F_XOR   	
      00ABC5 72 A9 00                 5 	.ascii "XOR"
      00ABC8 03 72                    6 	.word TK_XOR  
      00330D                       5091 	_dict_entry,5,WRITE,write  
      00ABCA FB 01                    1 	.word LINK 
                           00330F     2 	LINK=.
      00330F                          3 WRITE:
      00ABCC 5B                       4 	.byte 5   	
      00ABCD 02 4F 81 54 45           5 	.ascii "WRITE"
      00ABD0 2A 55                    6 	.word write  
      003317                       5092 	_dict_entry,5,WORDS,words 
      00ABD0 A6 0A                    1 	.word LINK 
                           003319     2 	LINK=.
      003319                          3 WORDS:
      00ABD2 CC                       4 	.byte 5   	
      00ABD3 97 27 52 44 53           5 	.ascii "WORDS"
      00ABD5 2D D2                    6 	.word words  
      003321                       5093 	_dict_entry 4,WAIT,wait 
      00ABD5 72 5F                    1 	.word LINK 
                           003323     2 	LINK=.
      003323                          3 WAIT:
      00ABD7 00                       4 	.byte 4   	
      00ABD8 19 AE B9 80              5 	.ascii "WAIT"
      00ABDC 89 CF                    6 	.word wait  
      00332A                       5094 	_dict_entry,3+F_IFUNC,USR,usr
      00ABDE 00 1A                    1 	.word LINK 
                           00332C     2 	LINK=.
      00332C                          3 USR:
      00ABE0 CD                       4 	.byte 3+F_IFUNC   	
      00ABE1 88 EE 27                 5 	.ascii "USR"
      00ABE4 0F 1E                    6 	.word usr  
      003332                       5095 	_dict_entry,5,UNTIL,until 
      00ABE6 01 1C                    1 	.word LINK 
                           003334     2 	LINK=.
      003334                          3 UNTIL:
      00ABE8 00                       4 	.byte 5   	
      00ABE9 80 27 04 1F 01           5 	.ascii "UNTIL"
      00ABEE 20 ED                    6 	.word until  
      00ABF0                       5096 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ABF0 0F 01                    1 	.word LINK 
                           00333E     2 	LINK=.
      00333E                          3 UFLASH:
      00ABF2 0F                       4 	.byte 6+F_IFUNC   	
      00ABF3 02 85 4F 81 53 48        5 	.ascii "UFLASH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00ABF7 2B 55                    6 	.word uflash  
      003347                       5097 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ABF7 CD 9A                    1 	.word LINK 
                           003349     2 	LINK=.
      003349                          3 UBOUND:
      00ABF9 4F                       4 	.byte 6+F_IFUNC   	
      00ABFA A1 02 27 03 CC 97        5 	.ascii "UBOUND"
      00AC00 25 E3                    6 	.word ubound  
      00AC01                       5098 	_dict_entry,4,TONE,tone  
      00AC01 90 E6                    1 	.word LINK 
                           003354     2 	LINK=.
      003354                          3 TONE:
      00AC03 03                       4 	.byte 4   	
      00AC04 93 EE 04 CF              5 	.ascii "TONE"
      00AC08 00 1A                    6 	.word tone  
      00335B                       5099 	_dict_entry,2,TO,to
      00AC0A 90 F6                    1 	.word LINK 
                           00335D     2 	LINK=.
      00335D                          3 TO:
      00AC0C 93                       4 	.byte 2   	
      00AC0D EE 01                    5 	.ascii "TO"
      00AC0F 72 A9                    6 	.word to  
      003362                       5100 	_dict_entry,5,TIMER,set_timer
      00AC11 00 03                    1 	.word LINK 
                           003364     2 	LINK=.
      003364                          3 TIMER:
      00AC13 90                       4 	.byte 5   	
      00AC14 F7 90 EF 01 72           5 	.ascii "TIMER"
      00AC19 CD 00                    6 	.word set_timer  
      00336C                       5101 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AC1B 1A 81                    1 	.word LINK 
                           00336E     2 	LINK=.
      00AC1D                          3 TIMEOUT:
      00AC1D 72                       4 	.byte 7+F_IFUNC   	
      00AC1E 0D 52 30 FB 8E CC 81     5 	.ascii "TIMEOUT"
      00AC25 35 53                    6 	.word timeout  
      00AC26                       5102 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AC26 72 0D                    1 	.word LINK 
                           00337A     2 	LINK=.
      00337A                          3 TICKS:
      00AC28 52                       4 	.byte 5+F_IFUNC   	
      00AC29 30 FB 72 16 00           5 	.ascii "TICKS"
      00AC2E 23 8E                    6 	.word get_ticks  
      003382                       5103 	_dict_entry,4,STOP,stop 
      00AC30 81 7A                    1 	.word LINK 
                           003384     2 	LINK=.
      00AC31                          3 STOP:
      00AC31 CD                       4 	.byte 4   	
      00AC32 9B 96 A1 84              5 	.ascii "STOP"
      00AC36 27 03                    6 	.word stop  
      00338B                       5104 	_dict_entry,4,STEP,step 
      00AC38 CC 97                    1 	.word LINK 
                           00338D     2 	LINK=.
      00338D                          3 STEP:
      00AC3A 25                       4 	.byte 4   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AC3B 90 F6 93 EE              5 	.ascii "STEP"
      00AC3F 01 72                    6 	.word step  
      003394                       5105 	_dict_entry,5,SPIWR,spi_write
      00AC41 A9 00                    1 	.word LINK 
                           003396     2 	LINK=.
      003396                          3 SPIWR:
      00AC43 03                       4 	.byte 5   	
      00AC44 53 50 49 57 52           5 	.ascii "SPIWR"
      00AC44 CF 00                    6 	.word spi_write  
      00339E                       5106 	_dict_entry,6,SPISEL,spi_select
      00AC46 13 CE                    1 	.word LINK 
                           0033A0     2 	LINK=.
      0033A0                          3 SPISEL:
      00AC48 00                       4 	.byte 6   	
      00AC49 13 5D 27 03 8F 26        5 	.ascii "SPISEL"
      00AC4F F7 F5                    6 	.word spi_select  
      00AC50                       5107 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AC50 81 A0                    1 	.word LINK 
                           0033AB     2 	LINK=.
      00AC51                          3 SPIRD:
      00AC51 CD                       4 	.byte 5+F_IFUNC   	
      00AC52 9B 96 A1 84 27           5 	.ascii "SPIRD"
      00AC57 03 CC                    6 	.word spi_read  
      0033B3                       5108 	_dict_entry,5,SPIEN,spi_enable 
      00AC59 97 25                    1 	.word LINK 
                           0033B5     2 	LINK=.
      0033B5                          3 SPIEN:
      00AC5B 90                       4 	.byte 5   	
      00AC5C F6 93 EE 01 72           5 	.ascii "SPIEN"
      00AC61 A9 00                    6 	.word spi_enable  
      0033BD                       5109 	_dict_entry,5,SLEEP,sleep 
      00AC63 03 B5                    1 	.word LINK 
                           0033BF     2 	LINK=.
      00AC64                          3 SLEEP:
      00AC64 A3                       4 	.byte 5   	
      00AC65 14 00 2B 0C 35           5 	.ascii "SLEEP"
      00AC6A 0F 50                    6 	.word sleep  
      0033C7                       5110     _dict_entry,4,SIZE,cmd_size 
      00AC6C F2 A6                    1 	.word LINK 
                           0033C9     2 	LINK=.
      0033C9                          3 SIZE:
      00AC6E 1E                       4 	.byte 4   	
      00AC6F 62 A6 10 62              5 	.ascii "SIZE"
      00AC73 20 1E                    6 	.word cmd_size  
      00AC75                       5111 	_dict_entry,4,SAVE,cmd_save 
      00AC75 A3 08                    1 	.word LINK 
                           0033D2     2 	LINK=.
      0033D2                          3 SAVE:
      00AC77 00                       4 	.byte 4   	
      00AC78 2B 09 35 0E              5 	.ascii "SAVE"
      00AC7C 50 F2                    6 	.word cmd_save  
      0033D9                       5112 	_dict_entry 3,RUN,cmd_run
      00AC7E A6 50                    1 	.word LINK 
                           0033DB     2 	LINK=.
      0033DB                          3 RUN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AC80 62                       4 	.byte 3   	
      00AC81 20 10 4E                 5 	.ascii "RUN"
      00AC83 25 3F                    6 	.word cmd_run  
      0033E1                       5113 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AC83 35 07                    1 	.word LINK 
                           0033E3     2 	LINK=.
      0033E3                          3 RSHIFT:
      00AC85 50                       4 	.byte 6+F_IFUNC   	
      00AC86 F2 53 48 49 46 54        5 	.ascii "RSHIFT"
      00AC87 2C 6D                    6 	.word rshift  
      0033EC                       5114 	_dict_entry,3+F_IFUNC,RND,random 
      00AC87 A3 00                    1 	.word LINK 
                           0033EE     2 	LINK=.
      0033EE                          3 RND:
      00AC89 40                       4 	.byte 3+F_IFUNC   	
      00AC8A 23 07 72                 5 	.ascii "RND"
      00AC8D 5C 50                    6 	.word random  
      0033F4                       5115 	_dict_entry,6,RETURN,return 
      00AC8F F2 54                    1 	.word LINK 
                           0033F6     2 	LINK=.
      0033F6                          3 RETURN:
      00AC91 20                       4 	.byte 6   	
      00AC92 F4 45 54 55 52 4E        5 	.ascii "RETURN"
      00AC93 25 11                    6 	.word return  
      0033FF                       5116 	_dict_entry,7,RESTORE,restore 
      00AC93 9F 4A                    1 	.word LINK 
                           003401     2 	LINK=.
      003401                          3 RESTORE:
      00AC95 27                       4 	.byte 7   	
      00AC96 01 4A 53 54 4F 52 45     5 	.ascii "RESTORE"
      00AC98 2F 9E                    6 	.word restore  
      00340B                       5117 	_dict_entry 3,REM,remark 
      00AC98 A4 3E                    1 	.word LINK 
                           00340D     2 	LINK=.
      00340D                          3 REM:
      00AC9A C7                       4 	.byte 3   	
      00AC9B 50 F1 72                 5 	.ascii "REM"
      00AC9E 18 50                    6 	.word remark  
      003413                       5118 	_dict_entry,6,REBOOT,cold_start
      00ACA0 F0 8E                    1 	.word LINK 
                           003415     2 	LINK=.
      003415                          3 REBOOT:
      00ACA2 81                       4 	.byte 6   	
      00ACA3 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00ACA3 C6 00                    6 	.word cold_start  
      00341E                       5119 	_dict_entry,4+F_IFUNC,READ,read  
      00ACA5 10 CE                    1 	.word LINK 
                           003420     2 	LINK=.
      003420                          3 READ:
      00ACA7 00                       4 	.byte 4+F_IFUNC   	
      00ACA8 11 81 41 44              5 	.ascii "READ"
      00ACAA 30 08                    6 	.word read  
      003427                       5120 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00ACAA CD 9A                    1 	.word LINK 
                           003429     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      003429                          3 QKEY:
      00ACAC 4F                       4 	.byte 4+F_IFUNC   	
      00ACAD A1 01 27 03              5 	.ascii "QKEY"
      00ACB1 CC 97                    6 	.word qkey  
      003430                       5121 	_dict_entry,3,PUT,xput 
      00ACB3 25 29                    1 	.word LINK 
                           003432     2 	LINK=.
      00ACB4                          3 PUT:
      00ACB4 CD                       4 	.byte 3   	
      00ACB5 82 73 90                 5 	.ascii "PUT"
      00ACB8 F6 93                    6 	.word xput  
      003438                       5122 	_dict_entry,4,PUSH,xpush   
      00ACBA EE 01                    1 	.word LINK 
                           00343A     2 	LINK=.
      00343A                          3 PUSH:
      00ACBC 72                       4 	.byte 4   	
      00ACBD A9 00 03 81              5 	.ascii "PUSH"
      00ACC1 31 11                    6 	.word xpush  
      003441                       5123 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00ACC1 CD 9A                    1 	.word LINK 
                           003443     2 	LINK=.
      003443                          3 PORTI:
      00ACC3 4F                       4 	.byte 5+F_IFUNC   	
      00ACC4 A1 02 27 03 CC           5 	.ascii "PORTI"
      00ACC9 97 25                    6 	.word const_porti  
      00344B                       5124 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00ACCB 90 F6                    1 	.word LINK 
                           00344D     2 	LINK=.
      00344D                          3 PORTG:
      00ACCD 93                       4 	.byte 5+F_IFUNC   	
      00ACCE EE 01 72 A9 00           5 	.ascii "PORTG"
      00ACD3 03 9F                    6 	.word const_portg  
      003455                       5125 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00ACD5 88 90                    1 	.word LINK 
                           003457     2 	LINK=.
      003457                          3 PORTF:
      00ACD7 F6                       4 	.byte 5+F_IFUNC   	
      00ACD8 93 EE 01 72 A9           5 	.ascii "PORTF"
      00ACDD 00 03                    6 	.word const_portf  
      00345F                       5126 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00ACDF 0D 01                    1 	.word LINK 
                           003461     2 	LINK=.
      003461                          3 PORTE:
      00ACE1 27                       4 	.byte 5+F_IFUNC   	
      00ACE2 07 98 59 49 0A           5 	.ascii "PORTE"
      00ACE7 01 26                    6 	.word const_porte  
      003469                       5127 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00ACE9 F9 5B                    1 	.word LINK 
                           00346B     2 	LINK=.
      00346B                          3 PORTD:
      00ACEB 01                       4 	.byte 5+F_IFUNC   	
      00ACEC 81 4F 52 54 44           5 	.ascii "PORTD"
      00ACED 2F 49                    6 	.word const_portd  
      003473                       5128 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00ACED CD 9A                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



                           003475     2 	LINK=.
      003475                          3 PORTC:
      00ACEF 4F                       4 	.byte 5+F_IFUNC   	
      00ACF0 A1 02 27 03 CC           5 	.ascii "PORTC"
      00ACF5 97 25                    6 	.word const_portc  
      00347D                       5129 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00ACF7 90 F6                    1 	.word LINK 
                           00347F     2 	LINK=.
      00347F                          3 PORTB:
      00ACF9 93                       4 	.byte 5+F_IFUNC   	
      00ACFA EE 01 72 A9 00           5 	.ascii "PORTB"
      00ACFF 03 9F                    6 	.word const_portb  
      003487                       5130 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AD01 88 90                    1 	.word LINK 
                           003489     2 	LINK=.
      003489                          3 PORTA:
      00AD03 F6                       4 	.byte 5+F_IFUNC   	
      00AD04 93 EE 01 72 A9           5 	.ascii "PORTA"
      00AD09 00 03                    6 	.word const_porta  
      003491                       5131 	_dict_entry 5,PRINT,print 
      00AD0B 0D 01                    1 	.word LINK 
                           003493     2 	LINK=.
      003493                          3 PRINT:
      00AD0D 27                       4 	.byte 5   	
      00AD0E 07 98 46 56 0A           5 	.ascii "PRINT"
      00AD13 01 26                    6 	.word print  
      00349B                       5132 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AD15 F9 5B                    1 	.word LINK 
                           00349D     2 	LINK=.
      00349D                          3 POUT:
      00AD17 01                       4 	.byte 4+F_IFUNC   	
      00AD18 81 4F 55 54              5 	.ascii "POUT"
      00AD19 2F 7B                    6 	.word const_output  
      0034A4                       5133 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AD19 A6 84                    1 	.word LINK 
                           0034A6     2 	LINK=.
      0034A6                          3 POP:
      00AD1B CD                       4 	.byte 3+F_IFUNC   	
      00AD1C 9A 42 CD                 5 	.ascii "POP"
      00AD1F 98 BE                    6 	.word xpop  
      0034AC                       5134 	_dict_entry,4,POKE,poke 
      00AD21 9F A4                    1 	.word LINK 
                           0034AE     2 	LINK=.
      0034AE                          3 POKE:
      00AD23 07                       4 	.byte 4   	
      00AD24 C7 50 C6 81              5 	.ascii "POKE"
      00AD28 22 43                    6 	.word poke  
      0034B5                       5135 	_dict_entry,5,PMODE,pin_mode 
      00AD28 52 01                    1 	.word LINK 
                           0034B7     2 	LINK=.
      0034B7                          3 PMODE:
      00AD2A CD                       4 	.byte 5   	
      00AD2B 9A 54 A1 02 27           5 	.ascii "PMODE"
      00AD30 03 CC                    6 	.word pin_mode  
      0034BF                       5136 	_dict_entry,4+F_IFUNC,PINP,const_input
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AD32 97 25                    1 	.word LINK 
                           0034C1     2 	LINK=.
      0034C1                          3 PINP:
      00AD34 90                       4 	.byte 4+F_IFUNC   	
      00AD35 F6 93 EE 01              5 	.ascii "PINP"
      00AD39 72 A9                    6 	.word const_input  
      0034C8                       5137 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AD3B 00 03                    1 	.word LINK 
                           0034CA     2 	LINK=.
      0034CA                          3 PICK:
      00AD3D CF                       4 	.byte 4+F_IFUNC   	
      00AD3E 00 1A 90 F6              5 	.ascii "PICK"
      00AD42 93 EE                    6 	.word xpick  
      0034D1                       5138 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AD44 01 72                    1 	.word LINK 
                           0034D3     2 	LINK=.
      0034D3                          3 PEEK:
      00AD46 A9                       4 	.byte 4+F_IFUNC   	
      00AD47 00 03 CD AD              5 	.ascii "PEEK"
      00AD4B 87 6B                    6 	.word peek  
      0034DA                       5139 	_dict_entry,5,PAUSE,pause 
      00AD4D 01 A6                    1 	.word LINK 
                           0034DC     2 	LINK=.
      0034DC                          3 PAUSE:
      00AD4F 01                       4 	.byte 5   	
      00AD50 0D 01 27 0D 48           5 	.ascii "PAUSE"
      00AD55 0A 01                    6 	.word pause  
      0034E4                       5140 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AD57 26 FB                    1 	.word LINK 
                           0034E6     2 	LINK=.
      0034E6                          3 PAD:
      00AD59 6B                       4 	.byte 3+F_IFUNC   	
      00AD5A 01 7B 01                 5 	.ascii "PAD"
      00AD5D EA 03                    6 	.word pad_ref  
      0034EC                       5141 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AD5F E7 03                    1 	.word LINK 
                           0034EE     2 	LINK=.
      0034EE                          3 OR:
      00AD61 A6                       4 	.byte 2+F_OR   	
      00AD62 01 C1                    5 	.ascii "OR"
      00AD64 00 0F                    6 	.word TK_OR  
      0034F3                       5142 	_dict_entry,2,ON,cmd_on 
      00AD66 27 10                    1 	.word LINK 
                           0034F5     2 	LINK=.
      0034F5                          3 ON:
      00AD68 7B                       4 	.byte 2   	
      00AD69 01 43                    5 	.ascii "ON"
      00AD6B E4 04                    6 	.word cmd_on  
      0034FA                       5143 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AD6D E7 04                    1 	.word LINK 
                           0034FC     2 	LINK=.
      0034FC                          3 ODR:
      00AD6F 7B                       4 	.byte 3+F_IFUNC   	
      00AD70 01 43 E4                 5 	.ascii "ODR"
      00AD73 02 E7                    6 	.word const_odr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      003502                       5144 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AD75 02 20                    1 	.word LINK 
                           003504     2 	LINK=.
      003504                          3 NOT:
      00AD77 0C                       4 	.byte 3+F_NOT   	
      00AD78 4E 4F 54                 5 	.ascii "NOT"
      00AD78 7B 01                    6 	.word TK_NOT  
      00350A                       5145 	_dict_entry,4,NEXT,next 
      00AD7A EA 02                    1 	.word LINK 
                           00350C     2 	LINK=.
      00350C                          3 NEXT:
      00AD7C E7                       4 	.byte 4   	
      00AD7D 02 7B 01 EA              5 	.ascii "NEXT"
      00AD81 04 E7                    6 	.word next  
      003513                       5146 	_dict_entry,3,NEW,new
      00AD83 04 0C                    1 	.word LINK 
                           003515     2 	LINK=.
      00AD84                          3 NEW:
      00AD84 5B                       4 	.byte 3   	
      00AD85 01 81 57                 5 	.ascii "NEW"
      00AD87 27 E8                    6 	.word new  
      00351B                       5147 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AD87 58 1C                    1 	.word LINK 
                           00351D     2 	LINK=.
      00351D                          3 LSHIFT:
      00AD89 AD                       4 	.byte 6+F_IFUNC   	
      00AD8A 97 FE 9F 88 5E A6        5 	.ascii "LSHIFT"
      00AD90 05 42                    6 	.word lshift  
      003526                       5148 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AD92 1C 50                    1 	.word LINK 
                           003528     2 	LINK=.
      003528                          3 LOG2:
      00AD94 00                       4 	.byte 4+F_IFUNC   	
      00AD95 84 81 47 32              5 	.ascii "LOG2"
      00AD97 2E A1                    6 	.word log2  
      00352F                       5149 	_dict_entry 4,LIST,cmd_list
      00AD97 03 06                    1 	.word LINK 
                           003531     2 	LINK=.
      003531                          3 LIST:
      00AD99 03                       4 	.byte 4   	
      00AD9A 05 04 00 02              5 	.ascii "LIST"
      00AD9E 01 06                    6 	.word cmd_list  
      003538                       5150 	_dict_entry 3,LET,let 
      00ADA0 00 02                    1 	.word LINK 
                           00353A     2 	LINK=.
      00353A                          3 LET:
      00ADA2 02                       4 	.byte 3   	
      00ADA3 02 03 03                 5 	.ascii "LET"
      00ADA6 01 03                    6 	.word let  
      003540                       5151 	_dict_entry,3+F_CFUNC,KEY,key 
      00ADA8 03 02                    1 	.word LINK 
                           003542     2 	LINK=.
      003542                          3 KEY:
      00ADAA 04                       4 	.byte 3+F_CFUNC   	
      00ADAB 04 05 02                 5 	.ascii "KEY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ADAE 06 02                    6 	.word key  
      003548                       5152 	_dict_entry,7,IWDGREF,refresh_iwdg
      00ADB0 07 02                    1 	.word LINK 
                           00354A     2 	LINK=.
      00354A                          3 IWDGREF:
      00ADB2 05                       4 	.byte 7   	
      00ADB3 04 02 04 01 52 45 46     5 	.ascii "IWDGREF"
      00ADB7 2E 9C                    6 	.word refresh_iwdg  
      003554                       5153 	_dict_entry,6,IWDGEN,enable_iwdg
      00ADB7 CD 9A                    1 	.word LINK 
                           003556     2 	LINK=.
      003556                          3 IWDGEN:
      00ADB9 4F                       4 	.byte 6   	
      00ADBA A1 01 27 03 CC 97        5 	.ascii "IWDGEN"
      00ADC0 25 5E                    6 	.word enable_iwdg  
      00ADC1                       5154 	_dict_entry,5,INPUT,input_var  
      00ADC1 90 F6                    1 	.word LINK 
                           003561     2 	LINK=.
      003561                          3 INPUT:
      00ADC3 93                       4 	.byte 5   	
      00ADC4 EE 01 72 A9 00           5 	.ascii "INPUT"
      00ADC9 03 89                    6 	.word input_var  
      003569                       5155 	_dict_entry,2,IF,if 
      00ADCB 88 A6                    1 	.word LINK 
                           00356B     2 	LINK=.
      00356B                          3 IF:
      00ADCD 80                       4 	.byte 2   	
      00ADCE 15 01                    5 	.ascii "IF"
      00ADD0 27 05                    6 	.word if  
      003570                       5156 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00ADD2 A6 0A                    1 	.word LINK 
                           003572     2 	LINK=.
      003572                          3 IDR:
      00ADD4 CC                       4 	.byte 3+F_IFUNC   	
      00ADD5 97 27 52                 5 	.ascii "IDR"
      00ADD7 2F 67                    6 	.word const_idr  
      003578                       5157 	_dict_entry,3,HEX,hex_base
      00ADD7 CE 00                    1 	.word LINK 
                           00357A     2 	LINK=.
      00357A                          3 HEX:
      00ADD9 15                       4 	.byte 3   	
      00ADDA 58 58 58                 5 	.ascii "HEX"
      00ADDD 58 58                    6 	.word hex_base  
      003580                       5158 	_dict_entry,4,GOTO,goto 
      00ADDF 9E C8                    1 	.word LINK 
                           003582     2 	LINK=.
      003582                          3 GOTO:
      00ADE1 00                       4 	.byte 4   	
      00ADE2 15 C7 00 0E              5 	.ascii "GOTO"
      00ADE6 9F C8                    6 	.word goto  
      003589                       5159 	_dict_entry,5,GOSUB,gosub 
      00ADE8 00 16                    1 	.word LINK 
                           00358B     2 	LINK=.
      00358B                          3 GOSUB:
      00ADEA C7                       4 	.byte 5   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00ADEB 00 0F CE 00 17           5 	.ascii "GOSUB"
      00ADF0 CF 00                    6 	.word gosub  
      003593                       5160 	_dict_entry,3,GET,cmd_get 
      00ADF2 15 CE                    1 	.word LINK 
                           003595     2 	LINK=.
      003595                          3 GET:
      00ADF4 00                       4 	.byte 3   	
      00ADF5 17 54 9E                 5 	.ascii "GET"
      00ADF8 C8 00                    6 	.word cmd_get  
      00359B                       5161 	_dict_entry,4+F_IFUNC,FREE,free
      00ADFA 17 C7                    1 	.word LINK 
                           00359D     2 	LINK=.
      00359D                          3 FREE:
      00ADFC 00                       4 	.byte 4+F_IFUNC   	
      00ADFD 17 9F C8 00              5 	.ascii "FREE"
      00AE01 18 C7                    6 	.word free  
      0035A4                       5162 	_dict_entry,3,FOR,for 
      00AE03 00 18                    1 	.word LINK 
                           0035A6     2 	LINK=.
      0035A6                          3 FOR:
      00AE05 CE                       4 	.byte 3   	
      00AE06 00 0E 54                 5 	.ascii "FOR"
      00AE09 54 54                    6 	.word for  
      0035AC                       5163 	_dict_entry,4,FCPU,fcpu 
      00AE0B 9E C8                    1 	.word LINK 
                           0035AE     2 	LINK=.
      0035AE                          3 FCPU:
      00AE0D 00                       4 	.byte 4   	
      00AE0E 0E C7 00 0E              5 	.ascii "FCPU"
      00AE12 9F C8                    6 	.word fcpu  
      0035B5                       5164 	_dict_entry,5,ERASE,cmd_erase 
      00AE14 00 0F                    1 	.word LINK 
                           0035B7     2 	LINK=.
      0035B7                          3 ERASE:
      00AE16 C7                       4 	.byte 5   	
      00AE17 00 0F C8 00 18           5 	.ascii "ERASE"
      00AE1C 97 C6                    6 	.word cmd_erase  
      0035BF                       5165 	_dict_entry,3,END,cmd_end  
      00AE1E 00 0E                    1 	.word LINK 
                           0035C1     2 	LINK=.
      0035C1                          3 END:
      00AE20 C8                       4 	.byte 3   	
      00AE21 00 17 95                 5 	.ascii "END"
      00AE24 CF 00                    6 	.word cmd_end  
      0035C7                       5166 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AE26 17 C6                    1 	.word LINK 
                           0035C9     2 	LINK=.
      0035C9                          3 EEPROM:
      00AE28 00                       4 	.byte 6+F_IFUNC   	
      00AE29 16 A4 7F 72 A2 00        5 	.ascii "EEPROM"
      00AE2F 03 90                    6 	.word const_eeprom_base  
      0035D2                       5167 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AE31 F7 90                    1 	.word LINK 
                           0035D4     2 	LINK=.
      0035D4                          3 EEFREE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00AE33 EF                       4 	.byte 6+F_IFUNC   	
      00AE34 01 84 85 72 A2 00        5 	.ascii "EEFREE"
      00AE3A 03 90                    6 	.word func_eefree  
      0035DD                       5168 	_dict_entry,4,EDIT,cmd_edit 
      00AE3C F7 90                    1 	.word LINK 
                           0035DF     2 	LINK=.
      0035DF                          3 EDIT:
      00AE3E EF                       4 	.byte 4   	
      00AE3F 01 CD 84 21              5 	.ascii "EDIT"
      00AE43 90 F6                    6 	.word cmd_edit  
      0035E6                       5169 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AE45 93 EE                    1 	.word LINK 
                           0035E8     2 	LINK=.
      0035E8                          3 DWRITE:
      00AE47 01                       4 	.byte 6+F_CMD   	
      00AE48 72 A9 00 03 1C 00        5 	.ascii "DWRITE"
      00AE4E 01 A9                    6 	.word digital_write  
      0035F1                       5170 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AE50 00 81                    1 	.word LINK 
                           0035F3     2 	LINK=.
      00AE52                          3 DROP:
      00AE52 90                       4 	.byte 4   	
      00AE53 89 52 03 0F              5 	.ascii "DROP"
      00AE57 02 0F                    6 	.word xdrop  
      0035FA                       5171 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AE59 03 90                    1 	.word LINK 
                           0035FC     2 	LINK=.
      0035FC                          3 DREAD:
      00AE5B AE                       4 	.byte 5+F_IFUNC   	
      00AE5C B7 5D 93 F6 A4           5 	.ascii "DREAD"
      00AE61 0F 6B                    6 	.word digital_read  
      003604                       5172 	_dict_entry,2,DO,do_loop
      00AE63 01 0C                    1 	.word LINK 
                           003606     2 	LINK=.
      003606                          3 DO:
      00AE65 03                       4 	.byte 2   	
      00AE66 5C F6                    5 	.ascii "DO"
      00AE68 CD 89                    6 	.word do_loop  
      00360B                       5173 	_dict_entry,3,DIR,cmd_dir
      00AE6A 7F 0C                    1 	.word LINK 
                           00360D     2 	LINK=.
      00360D                          3 DIR:
      00AE6C 02                       4 	.byte 3   	
      00AE6D 0A 01 26                 5 	.ascii "DIR"
      00AE70 F5 A6                    6 	.word cmd_dir  
      003613                       5174 	_dict_entry,3,DIM,cmd_dim 
      00AE72 46 11                    1 	.word LINK 
                           003615     2 	LINK=.
      003615                          3 DIM:
      00AE74 02                       4 	.byte 3   	
      00AE75 2B 09 A6                 5 	.ascii "DIM"
      00AE78 20 CD                    6 	.word cmd_dim  
      00361B                       5175 	_dict_entry,3,DEC,dec_base
      00AE7A 89 7F                    1 	.word LINK 
                           00361D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00361D                          3 DEC:
      00AE7C 0C                       4 	.byte 3   	
      00AE7D 02 20 07                 5 	.ascii "DEC"
      00AE80 A6 0D                    6 	.word dec_base  
      003623                       5176 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AE82 CD 89                    1 	.word LINK 
                           003625     2 	LINK=.
      003625                          3 DDR:
      00AE84 7F                       4 	.byte 3+F_IFUNC   	
      00AE85 0F 02 72                 5 	.ascii "DDR"
      00AE88 A2 00                    6 	.word const_ddr  
      00362B                       5177 	_dict_entry,4,DATA,data  
      00AE8A 02 90                    1 	.word LINK 
                           00362D     2 	LINK=.
      00362D                          3 DATA:
      00AE8C FE                       4 	.byte 4   	
      00AE8D 26 CF A6 0D              5 	.ascii "DATA"
      00AE91 CD 89                    6 	.word data  
      003634                       5178 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AE93 7F 5F                    1 	.word LINK 
                           003636     2 	LINK=.
      003636                          3 CR2:
      00AE95 7B                       4 	.byte 3+F_IFUNC   	
      00AE96 03 97 CD                 5 	.ascii "CR2"
      00AE99 98 D4                    6 	.word const_cr2  
      00363C                       5179 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AE9B AE AE                    1 	.word LINK 
                           00363E     2 	LINK=.
      00363E                          3 CR1:
      00AE9D A6                       4 	.byte 3+F_IFUNC   	
      00AE9E CD 89 DC                 5 	.ascii "CR1"
      00AEA1 5B 03                    6 	.word const_cr1  
      003644                       5180 	_dict_entry,5,CONST,cmd_const 
      00AEA3 90 85                    1 	.word LINK 
                           003646     2 	LINK=.
      003646                          3 CONST:
      00AEA5 81                       4 	.byte 5   	
      00AEA6 20 77 6F 72 64           5 	.ascii "CONST"
      00AEAB 73 20                    6 	.word cmd_const  
      00364E                       5181 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AEAD 69 6E                    1 	.word LINK 
                           003650     2 	LINK=.
      003650                          3 CHAR:
      00AEAF 20                       4 	.byte 4+F_CFUNC   	
      00AEB0 64 69 63 74              5 	.ascii "CHAR"
      00AEB4 69 6F                    6 	.word func_char  
      003657                       5182 	_dict_entry,5,CHAIN,cmd_chain
      00AEB6 6E 61                    1 	.word LINK 
                           003659     2 	LINK=.
      003659                          3 CHAIN:
      00AEB8 72                       4 	.byte 5   	
      00AEB9 79 0A 00 49 4E           5 	.ascii "CHAIN"
      00AEBC 32 7D                    6 	.word cmd_chain  
      003661                       5183 	_dict_entry,3,BYE,bye 
      00AEBC CD 9A                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



                           003663     2 	LINK=.
      003663                          3 BYE:
      00AEBE 54                       4 	.byte 3   	
      00AEBF A1 01 27                 5 	.ascii "BYE"
      00AEC2 03 CC                    6 	.word bye  
      003669                       5184 	_dict_entry,5,BTOGL,bit_toggle
      00AEC4 97 25                    1 	.word LINK 
                           00366B     2 	LINK=.
      00AEC6                          3 BTOGL:
      00AEC6 90                       4 	.byte 5   	
      00AEC7 F6 93 EE 01 72           5 	.ascii "BTOGL"
      00AECC A9 00                    6 	.word bit_toggle  
      003673                       5185 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AECE 03 CF                    1 	.word LINK 
                           003675     2 	LINK=.
      003675                          3 BTEST:
      00AED0 00                       4 	.byte 5+F_IFUNC   	
      00AED1 13 81 45 53 54           5 	.ascii "BTEST"
      00AED3 22 0C                    6 	.word bit_test  
      00367D                       5186 	_dict_entry,4,BSET,bit_set 
      00AED3 4F CE                    1 	.word LINK 
                           00367F     2 	LINK=.
      00367F                          3 BSET:
      00AED5 00                       4 	.byte 4   	
      00AED6 13 27 02 5F              5 	.ascii "BSET"
      00AEDA 81 43                    6 	.word bit_set  
      003686                       5187 	_dict_entry,4,BRES,bit_reset
      00AEDC 53 81                    1 	.word LINK 
                           003688     2 	LINK=.
      00AEDE                          3 BRES:
      00AEDE CD                       4 	.byte 4   	
      00AEDF 9A 54 A1 01              5 	.ascii "BRES"
      00AEE3 27 03                    6 	.word bit_reset  
      00368F                       5188 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AEE5 CC 97                    1 	.word LINK 
                           003691     2 	LINK=.
      003691                          3 BIT:
      00AEE7 25                       4 	.byte 3+F_IFUNC   	
      00AEE8 90 F6 93                 5 	.ascii "BIT"
      00AEEB EE 01                    6 	.word bitmask  
      003697                       5189 	_dict_entry,3,AWU,awu 
      00AEED 72 A9                    1 	.word LINK 
                           003699     2 	LINK=.
      003699                          3 AWU:
      00AEEF 00                       4 	.byte 3   	
      00AEF0 03 4B 00                 5 	.ascii "AWU"
      00AEF3 35 CC                    6 	.word awu  
      00369F                       5190 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AEF5 50 E0                    1 	.word LINK 
                           0036A1     2 	LINK=.
      0036A1                          3 AUTORUN:
      00AEF7 9E                       4 	.byte 7   	
      00AEF8 A4 3F 95 A3 00 FF 23     5 	.ascii "AUTORUN"
      00AEFF 06 0C                    6 	.word cmd_auto_run  
      0036AB                       5191 	_dict_entry,3+F_IFUNC,ASC,ascii
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00AF01 01 98                    1 	.word LINK 
                           0036AD     2 	LINK=.
      0036AD                          3 ASC:
      00AF03 56                       4 	.byte 3+F_IFUNC   	
      00AF04 20 F5 35                 5 	.ascii "ASC"
      00AF07 55 50                    6 	.word ascii  
      0036B3                       5192 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AF09 E0 84                    1 	.word LINK 
                           0036B5     2 	LINK=.
      0036B5                          3 AND:
      00AF0B C7                       4 	.byte 3+F_AND   	
      00AF0C 50 E1 9F                 5 	.ascii "AND"
      00AF0F 4A 35                    6 	.word TK_AND  
      0036BB                       5193 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AF11 55 50                    1 	.word LINK 
                           0036BD     2 	LINK=.
      0036BD                          3 ALLOC:
      00AF13 E0                       4 	.byte 5   	
      00AF14 C7 50 E2 35 AA           5 	.ascii "ALLOC"
      00AF19 50 E0                    6 	.word xalloc  
      0036C5                       5194 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AF1B 81 BD                    1 	.word LINK 
                           0036C7     2 	LINK=.
      00AF1C                          3 ADCREAD:
      00AF1C 35                       4 	.byte 7+F_IFUNC   	
      00AF1D AA 50 E0 81 45 41 44     5 	.ascii "ADCREAD"
      00AF21 26 DE                    6 	.word analog_read  
      0036D1                       5195 	_dict_entry,5,ADCON,power_adc 
      00AF21 CD 9A                    1 	.word LINK 
                           0036D3     2 	LINK=.
      0036D3                          3 ADCON:
      00AF23 4F                       4 	.byte 5   	
      00AF24 A1 01 27 03 CC           5 	.ascii "ADCON"
      00AF29 97 25                    6 	.word power_adc  
      00AF2B                       5196 kword_dict::
      0036DB                       5197 	_dict_entry,3+F_IFUNC,ABS,abs
      00AF2B 90 F6                    1 	.word LINK 
                           0036DD     2 	LINK=.
      0036DD                          3 ABS:
      00AF2D 93                       4 	.byte 3+F_IFUNC   	
      00AF2E EE 01 72                 5 	.ascii "ABS"
      00AF31 A9 00                    6 	.word abs  
                                   5198 
                                   5199 
                                   5200 
                                   5201 
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
      0036E3                         30 test:
      0036E3                         31     _vars VSIZE 
      00AF33 03 4D            [ 2]    1     sub sp,#VSIZE 
      00AF35 26 08 5D         [ 2]   32     ldw x,#LOOP_CNT
      00AF38 26 05            [ 2]   33     ldw (CNTR,sp),x  
      00AF3A A6 0A CC         [ 2]   34     ldw x,ticks 
      00AF3D 97 27            [ 2]   35     ldw (T,sp),x
      0036EF                         36 1$: ; test add24 
      00AF3F 4B 18            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AF41 59 49 25         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AF44 04 0A 01         [ 1]   39     ld acc24,a 
      00AF47 26 F8 5F         [ 2]   40     ldw acc24+1,x  
      00AF4A 84 4A            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AF4C 02 05 FF         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AF4D CD 01 7E         [ 4]   43     call add24 
      00AF4D 81 03            [ 2]   44     ldw x,(CNTR,sp)
      00AF4E 1D 00 01         [ 2]   45     subw x,#1
      00AF4E CD 9A            [ 2]   46     ldw (CNTR,sp),x 
      00AF50 4F A1            [ 1]   47     jrne 1$
      00AF52 01 27 03         [ 4]   48     call prt_acc24
      00AF55 CC 97            [ 1]   49     ld a,#SPACE 
      00AF57 25 90 F6         [ 4]   50     call putc 
      00AF5A 93 EE 01         [ 2]   51     ldw x,ticks 
      00AF5D 72 A9 00         [ 2]   52     subw x,(T,sp)
      00AF60 03 9F AE         [ 4]   53     call prt_i16  
      00AF63 00 01            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]



      00AF65 A4 17 27         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AF68 0A 88 4F         [ 2]   58     ldw x,LOOP_CNT
      00AF6B 1F 03            [ 2]   59     ldw (CNTR,sp),x 
      00AF6B 58 49 0A         [ 2]   60     ldw x,ticks 
      00AF6E 01 26            [ 2]   61     ldw (T,sp),x 
      00372B                         62 2$: 
      00AF70 FA 02            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AF71 AE FF FF         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AF71 5B 01 81         [ 1]   65     ld acc24,a 
      00AF74 CF 00 0D         [ 2]   66     ldw acc24+1,x  
      00AF74 85 52            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AF76 04 89 CE         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AF79 00 05 1F         [ 4]   69     call mul24 
      00AF7C 03 CE            [ 2]   70     ldw x,(CNTR,sp)
      00AF7E 00 01 1F         [ 2]   71     subw x,#1
      00AF81 05 72            [ 2]   72     ldw (CNTR,sp),x 
      00AF83 5C 00            [ 1]   73     jrne 2$ 
      00AF85 20 81 6B         [ 4]   74    call prt_acc24 
      00AF87 A6 20            [ 1]   75    ld a,#SPACE 
      00AF87 72 5D 00         [ 4]   76    call putc 
      00AF8A 20 26 03         [ 2]   77     ldw x,ticks 
      00AF8D CC 97 25         [ 2]   78     subw x,(T,sp)
      00AF90 CD 18 54         [ 4]   79     call prt_i16 
      00AF90 CD 9C            [ 1]   80     ld a,#CR 
      00AF92 AF 90 F6         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AF95 93 EE 01         [ 2]   83     ldw x,LOOP_CNT
      00AF98 72 A9            [ 2]   84     ldw (CNTR,sp),x 
      00AF9A 00 03 4D         [ 2]   85     ldw x,ticks 
      00AF9D 26 13            [ 2]   86     ldw (T,sp),x 
      003767                         87 3$: 
      00AF9F 5D 26            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AFA1 10 1E 03         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AFA4 CF 00 05         [ 1]   90     ld acc24,a 
      00AFA7 E6 02 C7         [ 2]   91     ldw acc24+1,x  
      00AFAA 00 03            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AFAC 1E 05 CF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AFAF 00 01 81         [ 4]   94     call mul24 
      00AFB2 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00AFB2 85 5B 04         [ 2]   96     subw x,#1
      00AFB5 72 5A            [ 2]   97     ldw (CNTR,sp),x 
      00AFB7 00 20            [ 1]   98     jrne 3$ 
      00AFB9 FC 18 6B         [ 4]   99     call prt_acc24    
      00AFBA A6 20            [ 1]  100     ld a,#SPACE 
      00AFBA AE 50 00         [ 4]  101     call putc 
      00AFBD 4F 81 0F         [ 2]  102     ldw x,ticks 
      00AFBF 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AFBF AE 50 05         [ 4]  104     call prt_i16 
      00AFC2 4F 81            [ 1]  105     ld a,#CR 
      00AFC4 CD 08 FF         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AFC4 AE 50 0A         [ 2]  108     ldw x,LOOP_CNT
      00AFC7 4F 81            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]



      00AFC9 CE 00 0F         [ 2]  110     ldw x,ticks 
      00AFC9 AE 50            [ 2]  111     ldw (T,sp),x 
      0037A3                        112 4$:
      00AFCB 0F 4F            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AFCD 81 FF FF         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AFCE C7 00 0C         [ 1]  115     ld acc24,a 
      00AFCE AE 50 14         [ 2]  116     ldw acc24+1,x  
      00AFD1 4F 81            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AFD3 AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AFD3 AE 50 19         [ 4]  119     call mul24 
      00AFD6 4F 81            [ 2]  120     ldw x,(CNTR,sp)
      00AFD8 1D 00 01         [ 2]  121     subw x,#1
      00AFD8 AE 50            [ 2]  122     ldw (CNTR,sp),x 
      00AFDA 1E 4F            [ 1]  123     jrne 4$ 
      00AFDC 81 18 6B         [ 4]  124     call prt_acc24 
      00AFDD A6 20            [ 1]  125     ld a,#SPACE 
      00AFDD AE 50 28         [ 4]  126     call putc 
      00AFE0 4F 81 0F         [ 2]  127     ldw x,ticks 
      00AFE2 72 F0 01         [ 2]  128     subw x,(T,sp)
      00AFE2 4F AE 00         [ 4]  129     call prt_i16 
      00AFE5 00 81            [ 1]  130     ld a,#CR 
      00AFE7 CD 08 FF         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AFE7 4F AE 00         [ 2]  133     ldw x,LOOP_CNT
      00AFEA 01 81            [ 2]  134     ldw (CNTR,sp),x 
      00AFEC CE 00 0F         [ 2]  135     ldw x,ticks 
      00AFEC 4F AE            [ 2]  136     ldw (T,sp),x 
      0037DF                        137 5$: 
      00AFEE 00 02            [ 1]  138     ld a,#0xff
      00AFF0 81 FF FF         [ 2]  139     ldw x,#0xffff
      00AFF1 CD 01 F3         [ 4]  140     call abs24 
      00AFF1 4F AE 00         [ 1]  141     ld acc24,a 
      00AFF4 03 81 0D         [ 2]  142     ldw acc24+1,x
      00AFF6 1E 03            [ 2]  143     ldw x,(CNTR,sp)
      00AFF6 4F AE 00         [ 2]  144     subw x,#1
      00AFF9 04 81            [ 2]  145     ldw (CNTR,sp),x 
      00AFFB 26 E9            [ 1]  146     jrne 5$ 
      00AFFB 4F AE 00         [ 4]  147     call prt_acc24 
      00AFFE 01 81            [ 1]  148     ld a,#SPACE 
      00B000 CD 08 FF         [ 4]  149     call putc 
      00B000 4F AE 00         [ 2]  150     ldw x,ticks 
      00B003 00 81 01         [ 2]  151     subw x,(T,sp)
      00B005 CD 18 54         [ 4]  152     call prt_i16 
      003807                        153 6$:
      00B005 4F AE            [ 1]  154     ld a,#CR 
      00B007 40 00 81         [ 4]  155     call putc 
      00B00A CD 38 52         [ 4]  156     call read_integer 
      00B00A 55 00 03 00 02   [ 1]  157     mov farptr,acc24 
      00B00F 81 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00B010 55 00 0E 00 1A   [ 1]  159     mov farptr+2,acc8 
      00B010 89 E6 03         [ 4]  160     call read_integer 
      00B013 A1 80 26         [ 1]  161     ld a,acc24 
      00B016 05 EE 04         [ 2]  162     ldw x,acc16 
      00B019 A3 B0 0A 85 81   [ 1]  163     mov acc24,farptr 
      00B01E 55 00 19 00 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]



      00B01E 5F CF 00 07 CF   [ 1]  165     mov acc8,farptr+2 
      00B023 00 09 CE         [ 4]  166     call div24 
      00B026 00               [ 1]  167     push a 
      00B027 1C               [ 2]  168     pushw x 
      00B028 CD 98 8C         [ 4]  169     call prt_acc24 
      00B02B A1 84            [ 1]  170     ld a,#SPACE 
      00B02D 26 10 CD         [ 4]  171     call putc 
      00B030 98               [ 2]  172     popw x
      00B031 BE 90 89         [ 2]  173     ldw acc16,x  
      00B034 4F CD 8C         [ 1]  174     pop acc24 
      00B037 C5 90 85         [ 4]  175     call prt_acc24
      00B03A 5D 26            [ 2]  176     jra 6$
      00384F                        177     _drop VSIZE 
      00B03C 17 20            [ 2]    1     addw sp,#VSIZE 
      00B03E 44               [ 4]  178     ret 
                                    179 
                                    180 
      00B03F                        181 read_integer:
      00B03F 55 00            [ 1]  182     ld a,#'? 
      00B041 04 00 02         [ 4]  183     call putc  
      00B044 C3 00 1E 24      [ 1]  184 	clr count  
      00B048 3A 0A 61         [ 4]  185 	call readln 
      00B049 AE 16 68         [ 2]  186 	ldw x,#tib 
      00B049 CD B0 10         [ 1]  187 	push count
      00B04C 26 00            [ 1]  188 	push #0 
      00B04E CD B0 61         [ 2]  189 	addw x,(1,sp)
      00B051 26               [ 1]  190 	incw x 
      00386A                        191 	_drop 2 
      00B052 FB 81            [ 2]    1     addw sp,#2 
      00B054 72 5F 00 01      [ 1]  192 	clr in 
      00B054 CF 00 07         [ 4]  193 	call get_token
      00B057 E6 02            [ 1]  194 	cp a,#TK_INTGR
      00B059 C7 00            [ 1]  195 	jreq 3$ 
      00B05B 0A 35            [ 1]  196 	cp a,#TK_MINUS
      00B05D 06 00 09         [ 4]  197 	call get_token 
      00B060 81 84            [ 1]  198 	cp a,#TK_INTGR 
      00B061 27 03            [ 1]  199 	jreq 2$
      00B061 E6 02 C7         [ 2]  200 	jp syntax_error
      003883                        201 2$:
      00B064 00 0F 72         [ 4]  202 	call neg_acc24  	
      003886                        203 3$: 
      00B067 5F               [ 4]  204     ret 
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
      003900                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003900                         30 app_space::
      00B068 00 0E                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B06A 72 BB                   32 app_size: .word 0 
      003904                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0036DD R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0036D3 R
    ADCON_ID=  000002     |   4 ADCREAD    0036C7 R   |     ADCREAD_=  000004 
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
  4 ALLOC      0036BD R   |   4 AND        0036B5 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 AR_SIGN    003241 R   |   4 ASC        0036AD R   |     ASC_IDX =  000006 
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTORUN    0036A1 R
  4 AUTO_RUN   00015C R   |   4 AWU        003699 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        003691 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003688 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       00367F R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      003675 R
    BTEST_ID=  000010     |   4 BTOGL      00366B R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        003663 R   |     BYE_IDX =  000014 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAIN      003659 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    CHAIN_AD=  000005     |     CHAIN_BP=  000007     |     CHAIN_CN=  000008 
    CHAIN_CO=  00000A     |     CHAIN_IN=  000009     |     CHAIN_LN=  000003 
    CHAIN_TX=  00000B     |     CHAIN_TX=  00000D     |   4 CHAR       003650 R
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
    COMMA   =  00002C     |   4 CONST      003646 R   |     CONST_ID=  0000B6 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CR1        00363E R
    CR1_IDX =  00001A     |   4 CR2        003636 R   |     CR2_IDX =  000018 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       00362D R
    DATA_IDX=  00001C     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        003625 R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        00361D R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        003615 R   |   4 DIR        00360D R   |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         003606 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      0035FC R   |     DREAD_ID=  000024     |   4 DROP       0035F3 R
  4 DWRITE     0035E8 R   |     DWRITE_I=  000026     |   4 EDIT       0035DF R
    EDIT_IDX=  000028     |   4 EEFREE     0035D4 R   |     EEFREE_I=  0000B8 
  4 EEPROM     0035C9 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        0035C1 R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      0035B7 R
  4 ERASED     0029E4 R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_NO_P=  000012     |     ERR_OVER=  000010 
    ERR_RD_O=  000011     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       0035AE R   |     FCPU_IDX=  000030 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001ECD R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLN_REJE=  000006     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        0035A6 R   |     FOR_IDX =  000034     |   4 FREE       00359D R
    FREE_IDX=  000088     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_AND   =  000080     |     F_CFUNC =  000020     |     F_CMD   =  000000 
    F_CONST =  000030     |     F_IFUNC =  000010     |     F_NOT   =  000070 
    F_OR    =  000090     |     F_XOR   =  0000A0     |   4 GET        003595 R
    GET_IDX =  0000B4     |   4 GOSUB      00358B R   |     GOSUB_ID=  000036 
  4 GOTO       003582 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        00357A R   |     HEX_IDX =  00003A 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003572 R
    IDR_IDX =  00003C     |   4 IF         00356B R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  4 INPUT      003561 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
  4 IWDGEN     003556 R   |     IWDGEN_I=  000042     |   4 IWDGREF    00354A R
    IWDGREF_=  000044     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        003542 R
    KEY_END =  000083     |     KEY_IDX =  000046     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        00353A R   |     LET_IDX =  000048     |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   4 LINES_RE   001F8F R
  4 LINK    =  0036DD R   |   4 LIST       003531 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       003528 R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     00351D R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NAME_MAX=  00000F     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        003515 R   |     NEW_IDX =  000052     |   4 NEXT       00350C R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        003504 R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        0034FC R
    ODR_IDX =  000054     |   4 ON         0034F5 R   |     ONOFF   =  000003 
    ON_IDX  =  0000B2     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         0034EE R   |     OR_IDX  =  0000FC     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        0034E6 R   |     PAD_IDX =  000056     |     PAD_SIZE=  000080 
  4 PAUSE      0034DC R   |     PAUSE_ID=  000058     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       0034D3 R   |     PEEK_IDX=  00005C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PG_SIZE =  000001     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   4 PICK       0034CA R   |     PINNO   =  000001 
  4 PINP       0034C1 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      0034B7 R   |     PMODE_ID=  00005A     |     PNAME   =  000003 
  4 POKE       0034AE R   |     POKE_IDX=  000060     |   4 POP        0034A6 R
  4 PORTA      003489 R   |   4 PORTB      00347F R   |   4 PORTC      003475 R
  4 PORTD      00346B R   |   4 PORTE      003461 R   |   4 PORTF      003457 R
  4 PORTG      00344D R   |   4 PORTI      003443 R   |   4 POUT       00349D R
    POUT_IDX=  000062     |     PREV    =  000001     |     PRG_SIZE=  000003 
  4 PRINT      003493 R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001EA3 R   |   4 PROG_SIZ   001EB5 R   |     PRTA_IDX=  000066 
    PRTB_IDX=  000068     |     PRTC_IDX=  00006A     |     PRTD_IDX=  00006C 
    PRTE_IDX=  00006E     |     PRTF_IDX=  000070     |     PRTG_IDX=  000072 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    PRTI_IDX=  000074     |     PRT_IDX =  000064     |     PSIZE   =  00000B 
    PSTR    =  000003     |   4 PUSH       00343A R   |   4 PUT        003432 R
  4 QKEY       003429 R   |     QKEY_IDX=  000076     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001EDE R
    RAM_SIZE=  001800     |     RBT_IDX =  00007A     |   4 READ       003420 R
    READ_IDX=  000078     |   4 REBOOT     003415 R   |     RECLEN  =  000005 
    REC_LEN =  000003     |     REC_XTRA=  000005     |   4 REG_A      0004DA R
  4 REG_CC     0004DE R   |   4 REG_PC     0004CE R   |   4 REG_SP     0004E3 R
  4 REG_X      0004D6 R   |   4 REG_Y      0004D2 R   |     RELOP   =  000001 
  4 REM        00340D R   |     REM_IDX =  00007C     |   4 RESTORE    003401 R
    REST_IDX=  00007E     |     RETL1   =  000001     |   4 RETURN     0033F6 R
    RET_ADDR=  000001     |     RET_BPTR=  000003     |     RET_IDX =  000080 
    RET_INW =  000005     |   4 RND        0033EE R   |     RND_IDX =  000082 
    RONLY   =  000005     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     0033E3 R   |     RSHIFT_I=  000084     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        0033DB R   |     RUN_IDX =  000086 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000001 
    R_CC    =  000009     |     R_PC    =  00000A     |     R_X     =  000002 
    R_Y     =  000004     |   4 SAVE       0033D2 R   |     SAVE_IDX=  000032 
    SAV_ACC1=  000006     |     SAV_ACC2=  000008     |     SAV_COUN=  00000A 
    SAV_IN  =  000009     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   0029E2 R   |   4 SIZE       0033C9 R
    SIZE_IDX=  0000B0     |     SKIP    =  000005     |   4 SLEEP      0033BF R
    SLEEP_ID=  00008A     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      0033B5 R   |     SPIEN_ID=  00008E 
  4 SPIRD      0033AB R   |     SPIRD_ID=  00008C     |   4 SPISEL     0033A0 R
    SPISEL_I=  000090     |   4 SPIWR      003396 R   |     SPIWR_ID=  000092 
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
  4 STEP       00338D R   |     STEP_IDX=  000094     |   4 STOP       003384 R
    STOP_IDX=  000096     |     STR     =  000003     |   4 STR_BYTE   001EC6 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |   4 SysCall    000012 R
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      00337A R
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    00336E R
  4 TIMER      003364 R   |     TIMER_ID=  00009A     |     TIM_CR1_=  000007 
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
  4 TO         00335D R   |   4 TONE       003354 R   |     TONE_IDX=  0000A0 
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
    UBC     =  004801     |   4 UBOUND     003349 R   |     UBOUND_I=  0000A2 
  4 UBTN_Han   00005A R   |   4 UFLASH     00333E R   |     UFLASH_I=  0000A4 
  4 UNTIL      003334 R   |     UNTIL_ID=  0000A6     |     US      =  00001F 
  4 USER_ABO   000062 R   |   4 USR        00332C R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000A8 
  4 Uart1RxH   00087C R   |   4 UserButt   000036 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VAR_NAME=  000001     |     VSIZE   =  000008 
    VT      =  00000B     |   4 WAIT       003323 R   |     WAIT_IDX=  0000AA 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |     WLKPTR  =  000001 
  4 WORDS      003319 R   |     WORDS_ID=  0000AC     |   4 WRITE      00330F R
    WRITE_ID=  0000AE     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        003307 R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  000014 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000005 
  4 abs        002C2A R   |   4 abs24      0001F3 R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000BC7 R   |   4 add24      00017E R   |   4 add_char   001345 R
  4 add_spac   00113D R   |   4 analog_r   0026DE R   |   4 and_cond   001BDD R
  4 and_fact   001BAD R   |   4 app        003904 R   |   4 app_sign   003900 R
  4 app_size   003902 R   |   4 app_spac   003900 GR  |   4 arduino_   002D17 R
  4 arg_list   0019D4 R   |   5 array_si   000020 R   |   4 ascii      002AD5 R
  4 at_tst     000FAF R   |   4 atoi24     0018F6 GR  |   4 atoi_exi   001965 R
  4 awu        002BD1 R   |   4 awu02      002BE4 R   |   4 bad_port   002B50 R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       002655 R
  4 beep_1kh   002628 GR  |   4 bin_exit   000E16 R   |   4 bit_rese   0021C7 R
  4 bit_set    0021A5 R   |   4 bit_test   00220C R   |   4 bit_togg   0021EA R
  4 bitmask    002ECE R   |   4 bkslsh_t   000F5C R   |   4 bksp       000966 R
  2 block_bu   0016B8 GR  |   4 block_er   000765 R   |   4 break_po   0027CA R
  4 bye        002B9D R   |   5 chain_le   000034 R   |   4 clear_au   0008B3 R
  4 clear_ba   0014B1 R   |   4 clear_bl   0028E5 R   |   4 clear_va   001409 R
  4 clock_in   00007D R   |   4 cmd_auto   0031ED R   |   4 cmd_chai   00327D R
  4 cmd_cons   001DB2 R   |   4 cmd_dim    001DC6 R   |   4 cmd_dim1   001DD0 R
  4 cmd_dim2   001DD6 R   |   4 cmd_dir    002A09 R   |   4 cmd_edit   001FB8 R
  4 cmd_end    0025CF R   |   4 cmd_eras   00284B R   |   4 cmd_get    0025FB R
  4 cmd_itf    0004FE R   |   4 cmd_line   001734 R   |   4 cmd_list   001EED R
  4 cmd_name   001365 R   |   4 cmd_on     002441 R   |   4 cmd_run    00253F R
  4 cmd_save   002947 R   |   4 cmd_size   001CB6 R   |   4 cold_sta   0000B5 R
  4 colon_ts   000F83 R   |   4 comma_ts   000F8E R   |   4 comp_msg   001684 R
  4 compile    0010A9 GR  |   4 conditio   001C2F R   |   4 const_cr   002F71 R
  4 const_cr   002F76 R   |   4 const_dd   002F6C R   |   4 const_ee   002F85 R
  4 const_id   002F67 R   |   4 const_in   002F80 R   |   4 const_od   002F62 R
  4 const_ou   002F7B R   |   4 const_po   002F3A R   |   4 const_po   002F3F R
  4 const_po   002F44 R   |   4 const_po   002F49 R   |   4 const_po   002F4E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Symbol Table

  4 const_po   002F53 R   |   4 const_po   002F58 R   |   4 const_po   002F5D R
  4 convert_   000D82 R   |   4 convert_   00092A R   |   4 copy_com   000FE4 R
  5 count      000002 GR  |   4 cp24       0001B8 R   |   4 cp24_ax    0001EA R
  4 cp_loop    001985 R   |   4 cpl24      0001FA R   |   4 cpy_cmd_   001125 R
  4 cpy_quot   001165 R   |   4 cs_high    003107 R   |   4 dash_tst   000FA4 R
  4 data       002F8A R   |   4 data_err   003003 R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001CA8 R
  4 decomp_l   0011FD R   |   4 decompil   0011B5 GR  |   4 del_line   000C70 R
  4 delete_l   000A53 R   |   4 delete_n   000976 R   |   4 delete_u   000A18 R
  4 digital_   00271A R   |   4 digital_   002751 R   |   4 div24      000307 R
  4 divu24_8   0002E9 R   |   4 do_loop    002EF4 R   |   4 do_progr   000758 R
  4 dup24      00016F R   |   5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR
  4 enable_i   002E5E R   |   4 end_at_l   001F3E R   |   4 eql_tst    00102F R
  4 equal      001358 R   |   4 eras0      002855 R   |   4 erase_ex   000789 R
  4 erase_fl   00077F R   |   4 erase_he   00292D R   |   4 erase_pr   0027F6 R
  4 err_bad_   0015AD R   |   4 err_buf_   001623 R   |   4 err_cmd_   001571 R
  4 err_div0   001536 R   |   4 err_dupl   00158B R   |   4 err_math   00151D R
  4 err_mem_   0014F8 R   |   4 err_msg    0014D2 R   |   4 err_no_a   0015B9 R
  4 err_no_d   0015EC R   |   4 err_no_f   001610 R   |   4 err_no_l   001545 R
  4 err_no_p   0015FC R   |   4 err_not_   00159C R   |   4 err_not_   001656 R
  4 err_over   001630 R   |   4 err_read   00163A R   |   4 err_run_   00155B R
  4 err_synt   00150F R   |   4 escaped    000D97 GR  |   4 expect     0019C2 R
  4 expressi   001B16 R   |   4 factor     001A1E R   |   5 farptr     000018 R
  4 fcpu       002C99 R   |   4 fetchc     000605 R   |   4 fill_wri   0028D5 R
  4 final_te   000BC0 R   |   5 flags      000022 GR  |   4 for        0022A2 R
  4 free       001CAD R   |   5 free_eep   000024 R   |   7 free_ram   000090 R
  4 func_arg   0019CF R   |   4 func_cha   002ABE R   |   4 func_eef   001D42 R
  4 ge         00135A R   |   4 get_addr   001834 R   |   4 get_arra   0019F0 R
  4 get_char   00184E R   |   4 get_esca   000936 R   |   4 get_int2   00183E R
  4 get_targ   0023CF R   |   4 get_targ   0023DD R   |   4 get_tick   002C23 R
  4 get_toke   000EF5 GR  |   4 get_valu   001D31 R   |   4 getc       00090F GR
  4 gosub      0024ED R   |   4 gosub_1    0024F8 R   |   4 gosub_2    0024FE R
  4 goto       0024D3 R   |   4 goto_1     0024DD R   |   4 gpio       002B25 R
  4 gt         001356 R   |   4 gt_tst     00103A R   |   4 hex_base   001CA3 R
  4 hex_dump   000645 R   |   4 if         002285 R   |   5 in         000001 GR
  5 in.saved   000003 GR  |   5 in.w       000000 GR  |   4 incr_far   000860 R
  4 input_ex   00215D R   |   4 input_lo   0020C7 R   |   4 input_va   0020C3 R
  4 insert_c   0009D5 R   |   4 insert_l   000CDC R   |   4 interp_l   001778 R
  4 interpre   001750 R   |   4 invalid    00056D R   |   4 invalid_   0005DB R
  4 is_alnum   000E49 GR  |   4 is_alpha   000E2F GR  |   4 is_data_   002F90 R
  4 is_digit   000E40 GR  |   4 is_erase   0029E6 R   |   4 is_minus   001F13 R
  4 is_progr   00252E R   |   4 is_symbo   000E52 R   |   4 itoa       001891 GR
  4 itoa_loo   0018B3 R   |   4 jp_to_ta   0024E0 R   |   4 key        002B14 R
  4 kword_di   0036DB GR  |   4 kword_en   003305 R   |   4 le         00135F R
  4 ledoff     0003CD R   |   4 ledon      0003C8 R   |   4 ledtoggl   0003D2 R
  4 left_par   0003DB R   |   4 let        001CEE GR  |   4 let_arra   001CFC R
  4 let_dvar   0017B1 R   |   4 let_eval   001D04 R   |   4 let_var    001D01 R
  4 lines_sk   001F23 R   |   4 list_exi   001F73 R   |   4 list_loo   001F51 R
  4 log2       002EA1 R   |   4 look_tar   002400 R   |   4 loop_bac   0023B2 R
  5 loop_dep   00001F R   |   4 loop_don   0023C7 R   |   4 lshift     002C41 R
  4 lt         00135D R   |   4 lt_tst     001063 R   |   4 mem_peek   000589 R
  4 mod24      0003A1 R   |   4 move       0013C5 GR  |   4 move_dow   0013E4 R
  4 move_era   0006E7 R   |   4 move_exi   001405 R   |   4 move_lef   0009AD R
  4 move_loo   0013E9 R   |   4 move_prg   000727 R   |   4 move_rig   0009BB R
  4 move_up    0013D6 R   |   4 mul24      000279 R   |   4 mul_char   001347 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 251.
Hexadecimal [24-Bits]

Symbol Table

  4 mulu24_8   00023A R   |   4 nbr_tst    000F28 R   |   4 ne         001362 R
  4 neg24      000203 R   |   4 neg_acc2   00021D R   |   4 neg_ax     000215 R
  4 new        0027E8 R   |   4 next       00235A R   |   4 next_lin   001758 R
  4 next_tok   00180C GR  |   4 no_match   001997 R   |   4 number     00060B R
  4 open_gap   000CA5 R   |   4 other      00108C R   |   4 overwrit   000BEC R
  2 pad        0016B8 GR  |   4 pad_ref    00310C R   |   4 parse_ad   0004E8 R
  4 parse_bi   000DF4 R   |   4 parse_in   000D9F R   |   4 parse_ke   000E75 R
  4 parse_qu   000D4A R   |   4 parse_sy   000E5D R   |   4 pause      002BB1 R
  4 pause02    002BC4 R   |   4 peek       002264 R   |   4 peek_byt   0005A5 R
  4 pin_mode   002CA8 R   |   4 plus_tst   001003 R   |   4 poke       002243 R
  4 power_ad   00268E R   |   4 prcnt_ts   001024 R   |   4 print      00201A R
  4 print_fa   0005EA R   |   4 print_he   000C23 GR  |   4 print_re   000427 R
  4 print_st   00057D R   |   4 print_to   001879 R   |   4 prog_siz   001E5C R
  4 program_   001E64 R   |   4 program_   000701 R   |   4 program_   000727 R
  4 prt_acc2   00186B R   |   4 prt_basi   001FF6 R   |   4 prt_i16    001854 R
  4 prt_loop   00201E R   |   4 prt_peek   0003AA GR  |   4 prt_reg1   000408 R
  4 prt_reg8   0003E6 R   |   5 ptr16      000019 GR  |   5 ptr8       00001A R
  4 putc       0008FF GR  |   4 puts       00095C GR  |   4 qgetc      000908 GR
  4 qkey       002B18 GR  |   4 qmark_ts   000FBA R   |   4 qsign      0028CA R
  4 random     002D37 R   |   4 read       003008 R   |   4 read01     00300D R
  4 read_int   003852 R   |   4 readln     000A61 GR  |   4 readln_l   000A70 R
  4 readln_q   000C09 R   |   4 refresh_   002E9C R   |   4 relation   001B4E R
  4 relop_st   00134A R   |   4 remark     002162 GR  |   4 repl       000527 R
  4 repl_exi   00054F R   |   4 reset_co   00201C R   |   4 rest_con   0020B3 R
  4 restore    002F9E R   |   4 return     002511 R   |   4 right_al   001153 GR
  4 row_alig   000845 R   |   4 row_eras   0006BA R   |   4 row_eras   0006E7 R
  4 row_loop   000628 R   |   4 rparnt_t   000F78 R   |   4 rshift     002C6D R
  7 rsign      00008C R   |   7 rsize      00008E R   |   4 rt_msg     001672 R
  4 run_app    00012A R   |   4 run_it     00259C R   |   4 run_it_0   00259E R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_con   0020A3 R   |   4 scan_blo   00086E R   |   4 search_d   001977 GR
  4 search_e   0019BF R   |   4 search_f   0028F9 R   |   4 search_l   000C45 GR
  4 search_l   000C54 R   |   4 search_n   001D6B R   |   4 search_n   00197B R
  4 search_p   003243 R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002D07 R   |   4 send_esc   000984 R   |   4 send_par   00098F R
  4 set_data   002FD4 R   |   4 set_time   002E3C R   |   4 sharp_ts   000F99 R
  4 show_row   000616 R   |   4 single_c   001340 R   |   4 skip       000EE2 R
  4 skip_str   001825 R   |   4 skip_to_   0029F1 R   |   4 slash_ts   001019 R
  4 sleep      002BA6 R   |   4 software   001418 R   |   4 spaces     0009C9 GR
  4 spi_clea   0030A1 R   |   4 spi_disa   003089 R   |   4 spi_enab   003056 R
  4 spi_rcv_   0030C3 R   |   4 spi_read   0030EE R   |   4 spi_sele   0030F5 R
  4 spi_send   0030AD R   |   4 spi_writ   0030CE R   |   2 stack_fu   001774 GR
  2 stack_un   001800 R   |   4 star_tst   00100E R   |   4 start_fr   001F1E R
  4 step       002318 R   |   4 stop       00279C R   |   4 store_lo   002347 R
  4 str_matc   0019A4 R   |   4 str_tst    000F18 R   |   4 strcmp     0013A4 R
  4 strcpy     0013B5 GR  |   4 strlen     001399 GR  |   4 sub24      00019B R
  4 symb_loo   000E5E R   |   4 syntax_e   0016A5 GR  |   4 system_i   00145E R
  5 tab_widt   000023 GR  |   4 tb_error   0016A7 GR  |   4 term       001AD3 R
  4 term01     001ADB R   |   4 term_exi   001B13 R   |   4 test       0036E3 R
  4 test_p     000575 R   |   2 tib        001668 GR  |   4 tick_tst   000FD2 R
  5 ticks      00000F R   |   4 timeout    002E53 R   |   5 timer      000012 GR
  4 timer2_i   000093 R   |   4 timer4_i   0000A0 R   |   4 tk_id      001695 R
  4 to         0022D2 R   |   4 to_eepro   000750 R   |   4 to_flash   000755 R
  4 to_hex_c   000C3A GR  |   4 to_upper   0018EA GR  |   4 token_ch   0010A2 R
  4 token_ex   0010A6 R   |   4 tone       002633 R   |   4 try_next   002FE1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 252.
Hexadecimal [24-Bits]

Symbol Table

  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   00090F GR
  4 uart1_in   0008BA R   |   4 uart1_pu   0008FF GR  |   4 uart1_qg   000908 GR
  4 uart1_se   0008CA R   |   4 ubound     001CE3 R   |   4 uflash     002B55 R
  4 unlock_e   000684 R   |   4 unlock_f   00069F R   |   4 until      002F07 R
  4 user_int   000049 R   |   4 usr        002B77 R   |   4 var_name   0011AB GR
  5 vars       000035 GR  |   4 wait       002168 R   |   4 warm_ini   00148F R
  4 warm_sta   001731 R   |   4 words      002DD2 R   |   4 words_co   002E26 R
  4 write      002A55 R   |   4 write_bl   00080A GR  |   4 write_bu   000741 R
  4 write_by   00078B R   |   4 write_ee   0007C7 R   |   4 write_ex   000800 R
  4 write_fl   0007B1 R   |   4 write_nb   00082F R   |   4 xalloc     00311F R
  4 xdrop      003155 R   |   4 xpick      0031D3 R   |   4 xpop       003115 R
  4 xpush      003111 R   |   4 xput       0031A0 R   |   4 xstack_b   003182 R
  2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 253.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3904   flags    0
   5 DATA       size     83   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

