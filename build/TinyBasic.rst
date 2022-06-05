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
      008000 82 00 81 38             54     int cold_start			; RESET vector 
                           000001    55 .if DEBUG
      008004 82 00 80 92             56 	int DebugHandler 		;TRAP  software interrupt
                           000000    57 .else
                                     58 	int SysCall ; TRAP  BASIC sys() calls 
                                     59 .endif
      008008 82 00 80 80             60 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 84             61 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80             62 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80             63 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80             64 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80             65 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80             66 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 B9             67 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80             68 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80             69 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80             70 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80             71 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80             72 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80             73 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80             74 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80             75 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80             76 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80             77 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 88 EC             78 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80             79 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80             80 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 80             81 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 80             82 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 96             83 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80             84 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80             85 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80             86 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80             87 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80             88 	int NonHandledInterrupt ;int28  not used
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      00807C 82 00 80 80             89 	int NonHandledInterrupt ;int29  not used
                                     90 
                                     91 ;---------------------------------------
                                     92     .area CODE
                                     93 ;---------------------------------------
                                     94 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     96 ; non handled interrupt 
                                     97 ; reset MCU
                                     98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                         99 NonHandledInterrupt:
      000000                        100 	_swreset 
      008080 35 80 50 D1      [ 1]    1     mov WWDG_CR,#0X80
                                    101 
                                    102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    103 ; auto wakeup from halt
                                    104 ; at iret, program continue 
                                    105 ; after hatl instruction
                                    106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008084                        107 AWUHandler:
      008084 72 19 50 F0      [ 1]  108 	bres AWU_CSR,#AWU_CSR_AWUEN
      008088 55 00 3F 50 F1   [ 1]  109 	mov AWU_APR,0x3F
      00808D 72 5F 50 F2      [ 1]  110 	clr AWU_TBR 
      008091 80               [11]  111 	iret
                                    112 
                                    113 ;------------------------------------
                                    114 ; software interrupt handler  
                                    115 ;------------------------------------
                           000001   116 .if DEBUG 
      008092                        117 DebugHandler:
      008092 CD 84 97         [ 4]  118 	call print_registers
      008095 80               [11]  119 	iret
                           000000   120 .else 
                                    121 SysCall:
                                    122 
                                    123 	iret 
                                    124 .endif 
                                    125 
                                    126 ;------------------------------
                                    127 ; TIMER 4 is used to maintain 
                                    128 ; a milliseconds 'ticks' counter
                                    129 ; and decrement 'timer' varaiable
                                    130 ; ticks range {0..2^23-1}
                                    131 ;--------------------------------
      008096                        132 Timer4UpdateHandler:
      008096 72 5F 53 42      [ 1]  133 	clr TIM4_SR 
      00809A C6 00 10         [ 1]  134 	ld a,ticks 
      00809D CE 00 11         [ 2]  135 	ldw x,ticks+1
      0080A0 1C 00 01         [ 2]  136 	addw x,#1 
      0080A3 A9 00            [ 1]  137 	adc a,#0 
      0080A5 2A 02            [ 1]  138 	jrpl 0$
                                    139 ; reset to 0 when negatif 
      0080A7 4F               [ 1]  140 	clr a 
      0080A8 5F               [ 1]  141 	clrw x 
      0080A9 C7 00 10         [ 1]  142 0$:	ld ticks,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      0080AC CF 00 11         [ 2]  143 	ldw ticks+1,x 
      0080AF CE 00 13         [ 2]  144 	ldw x,timer
      0080B2 27 04            [ 1]  145 	jreq 1$
      0080B4 5A               [ 2]  146 	decw x 
      0080B5 CF 00 13         [ 2]  147 	ldw timer,x 
      0080B8                        148 1$:	
      0080B8 80               [11]  149 	iret 
                                    150 
                                    151 ;------------------------------------
                                    152 ; Triggered by pressing USER UserButton 
                                    153 ; on NUCLEO card.
                                    154 ; This is used to abort a progam lock 
                                    155 ; in infinite loop. 
                                    156 ;------------------------------------
      0080B9                        157 UserButtonHandler:
                                    158 ; wait button release
      0080B9 5F               [ 1]  159 	clrw x
      0080BA 5A               [ 2]  160 1$: decw x 
      0080BB 26 FD            [ 1]  161 	jrne 1$
      0080BD 72 09 50 15 F8   [ 2]  162 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    163 ; if MCU suspended by SLEEP resume program
      0080C2 72 07 00 23 05   [ 2]  164     btjf flags,#FSLEEP,2$
      0080C7 72 17 00 23      [ 1]  165 	bres flags,#FSLEEP 
      0080CB 80               [11]  166 	iret
      0080CC                        167 2$:	
      0080CC                        168 user_interrupted:
      0080CC 72 00 00 23 02   [ 2]  169     btjt flags,#FRUN,4$
      0080D1 20 0A            [ 2]  170 	jra UBTN_Handler_exit 
      0080D3                        171 4$:	; program interrupted by user 
      0080D3 72 11 00 23      [ 1]  172 	bres flags,#FRUN 
      0080D7 AE 80 E5         [ 2]  173 	ldw x,#USER_ABORT
      0080DA CD 89 BB         [ 4]  174 	call puts 
      0080DD                        175 UBTN_Handler_exit:
      0080DD AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080E0 94               [ 1]  177     ldw sp,x
      0080E1 9A               [ 1]  178 	rim 
      0080E2 CC 97 45         [ 2]  179 5$:	jp warm_start
                                    180 
      0080E5 0A 50 72 6F 67 72 61   181 USER_ABORT: .asciz "\nProgram aborted by user.\n"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008100                        195 clock_init:	
      008100 C1 50 C3         [ 1]  196 	cp a,CLK_CMSR 
      008103 27 0C            [ 1]  197 	jreq 2$ ; no switching required 
                                    198 ; select clock source 
      008105 72 12 50 C5      [ 1]  199 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008109 C7 50 C4         [ 1]  200 	ld CLK_SWR,a
      00810C C1 50 C3         [ 1]  201 1$:	cp a,CLK_CMSR
      00810F 26 FB            [ 1]  202 	jrne 1$
      008111                        203 2$: 	
                                    204 ; HSI and cpu clock divisor 
      008111 9F               [ 1]  205 	ld a,xl 
      008112 C7 50 C6         [ 1]  206 	ld CLK_CKDIVR,a  
      008115 81               [ 4]  207 	ret
                                    208 
                                    209 ;----------------------------------
                                    210 ; TIMER2 used as audio tone output 
                                    211 ; on port D:5. CN9-6
                                    212 ; channel 1 configured as PWM mode 1 
                                    213 ;-----------------------------------  
                                    214 
      008116                        215 timer2_init:
      008116 72 1A 50 C7      [ 1]  216 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00811A 35 60 53 05      [ 1]  217  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00811E 35 08 53 0C      [ 1]  218 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008122 81               [ 4]  219 	ret 
                                    220 
                                    221 ;---------------------------------
                                    222 ; TIM4 is configured to generate an 
                                    223 ; interrupt every millisecond 
                                    224 ;----------------------------------
      008123                        225 timer4_init:
      008123 72 18 50 C7      [ 1]  226 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008127 35 07 53 45      [ 1]  227 	mov TIM4_PSCR,#7 ; prescale 128  
      00812B 35 7D 53 46      [ 1]  228 	mov TIM4_ARR,#125 ; set for 1msec.
      00812F 35 05 53 40      [ 1]  229 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008133 72 10 53 41      [ 1]  230 	bset TIM4_IER,#TIM4_IER_UIE
      008137 81               [ 4]  231 	ret
                                    232 
                                    233 ;-------------------------------------
                                    234 ;  initialization entry point 
                                    235 ;-------------------------------------
      008138                        236 cold_start:
                                    237 ;set stack 
      008138 AE 17 FF         [ 2]  238 	ldw x,#STACK_EMPTY
      00813B 94               [ 1]  239 	ldw sp,x
                                    240 ; clear all ram 
      00813C 7F               [ 1]  241 0$: clr (x)
      00813D 5A               [ 2]  242 	decw x 
      00813E 26 FC            [ 1]  243 	jrne 0$
                                    244 ; activate pull up on all inputs 
      008140 A6 FF            [ 1]  245 	ld a,#255 
      008142 C7 50 03         [ 1]  246 	ld PA_CR1,a 
      008145 C7 50 08         [ 1]  247 	ld PB_CR1,a 
      008148 C7 50 0D         [ 1]  248 	ld PC_CR1,a 
      00814B C7 50 12         [ 1]  249 	ld PD_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      00814E C7 50 17         [ 1]  250 	ld PE_CR1,a 
      008151 C7 50 1C         [ 1]  251 	ld PF_CR1,a 
      008154 C7 50 21         [ 1]  252 	ld PG_CR1,a 
      008157 C7 50 2B         [ 1]  253 	ld PI_CR1,a
                                    254 ; set LD2 pin as output 
      00815A 72 1A 50 0D      [ 1]  255     bset PC_CR1,#LED2_BIT
      00815E 72 1A 50 0E      [ 1]  256     bset PC_CR2,#LED2_BIT
      008162 72 1A 50 0C      [ 1]  257     bset PC_DDR,#LED2_BIT
      008166 72 1B 50 0A      [ 1]  258 	bres PC_ODR,#LED2_BIT 
                                    259 ; disable schmitt triggers on Arduino CN4 analog inputs
      00816A 55 00 3F 54 07   [ 1]  260 	mov ADC_TDRL,0x3f
                                    261 ; disable peripherals clocks
                                    262 ;	clr CLK_PCKENR1 
                                    263 ;	clr CLK_PCKENR2
      00816F 72 5F 50 F2      [ 1]  264 	clr AWU_TBR 
      008173 72 14 50 CA      [ 1]  265 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                    266 ; select internal clock no divisor: 16 Mhz 	
      008177 A6 E1            [ 1]  267 	ld a,#CLK_SWR_HSI 
      008179 5F               [ 1]  268 	clrw x  
      00817A CD 81 00         [ 4]  269     call clock_init 
      00817D CD 81 23         [ 4]  270 	call timer4_init
      008180 CD 81 16         [ 4]  271 	call timer2_init
                                    272 ; UART1 at 115200 BAUD
      008183 CD 89 19         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008186 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      00818A 9A               [ 1]  277 	rim ; enable interrupts 
      00818B 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00818F 72 5C 00 16      [ 1]  279 	inc seedx+1 
      008193 CD 9D C1         [ 4]  280 	call func_eefree 
      008196 CD 9C F6         [ 4]  281 	call ubound 
      008199 CD 94 F1         [ 4]  282 	call clear_basic
      00819C CD A6 26         [ 4]  283 	call beep_1khz  
      00819F CD 94 9E         [ 4]  284 	call system_information
      0081A2                        285 2$:	
                                    286 ; check for application in flash memory 
      0081A2 CD A8 61         [ 4]  287 	call qsign 
      0081A5 27 03            [ 1]  288 	jreq run_app
      0081A7 CC 97 45         [ 2]  289 	jp warm_start 
      0081AA                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081AA 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081AE CD 94 CF         [ 4]  293 	call warm_init
      0081B1 AE B6 84         [ 2]  294 	ldw x,#app 
      0081B4 CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081B7 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081BB CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081BE AE 81 CC         [ 2]  298 	ldw x,#AUTO_RUN 
      0081C1 CD 89 BB         [ 4]  299 	call puts 
      0081C4 CD 9E E3         [ 4]  300 	call program_info 
      0081C7 CC A5 C1         [ 2]  301 	jp run_it_02  
      0081CA 20 FE            [ 2]  302     jra .  
                                    303 
      0081CC 20 61 75 74 6F 20 72   304 AUTO_RUN: .asciz " auto run program\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal  75-Bits]



             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    305 
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
      00015F                         37 dup24:
      00015F                         38     _at_top 
      0081D4 6E 20            [ 1]    1     ld a,(y)
      0081D6 70               [ 1]    2     ldw x,y 
      0081D7 72 6F            [ 2]    3     ldw x,(1,x)
      000164                         39     _xpush 
      0081D9 67 72 61 6D      [ 2]    1     subw y,#CELL_SIZE
      0081DD 0A 00            [ 1]    2     ld (y),a 
      0081DF 90 EF 01         [ 2]    3     ldw (1,y),x 
      0081DF 90               [ 4]   40     ret 
                                     41 
                                     42 
                                     43 
                                     44 ;-------------------------------
                                     45 ; add24 
                                     46 ; add 24 bits integers 
                                     47 ;------------------------------
      00016E                         48 add24: ; ( N T -- N+T )
      00016E                         49     _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0081E0 F6 93            [ 1]    1     ld a,(y)
      0081E2 EE               [ 1]    2     ldw x,y 
      0081E3 01 72            [ 2]    3     ldw x,(1,x)
      0081E5 A2 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      0081E9 F7               [ 2]   50     pushw x  
      0081EA 90               [ 1]   51     push a  
      000179                         52     _at_top  
      0081EB EF 01            [ 1]    1     ld a,(y)
      0081ED 81               [ 1]    2     ldw x,y 
      0081EE EE 01            [ 2]    3     ldw x,(1,x)
      0081EE 90 F6 93         [ 2]   53     addw x,(2,sp)
      0081F1 EE 01            [ 1]   54     adc a, (1,sp)
      000183                         55     _store_top 
      0081F3 72 A9            [ 1]    1     ld (y),a 
      0081F5 00 03 89         [ 2]    2     ldw (1,y),x     
      000188                         56     _drop 3 
      0081F8 88 90            [ 2]    1     addw sp,#3 
      0081FA F6               [ 4]   57     ret 
                                     58 
                                     59 ;-------------------------------
                                     60 ; sub24 
                                     61 ; subtract 24 bits integers 
                                     62 ;------------------------------
      00018B                         63 sub24: ; ( N T -- N-T ) 
      00018B                         64     _xpop 
      0081FB 93 EE            [ 1]    1     ld a,(y)
      0081FD 01               [ 1]    2     ldw x,y 
      0081FE 72 FB            [ 2]    3     ldw x,(1,x)
      008200 02 19 01 90      [ 2]    4     addw y,#CELL_SIZE 
      008204 F7               [ 2]   65     pushw x 
      008205 90               [ 1]   66     push  a
      000196                         67     _at_top  
      008206 EF 01            [ 1]    1     ld a,(y)
      008208 5B               [ 1]    2     ldw x,y 
      008209 03 81            [ 2]    3     ldw x,(1,x)
      00820B 72 F0 02         [ 2]   68     subw x,(2,sp) 
      00820B 90 F6            [ 1]   69     sbc a, (1,sp)
      0001A0                         70     _store_top  
      00820D 93 EE            [ 1]    1     ld (y),a 
      00820F 01 72 A9         [ 2]    2     ldw (1,y),x     
      0001A5                         71     _drop 3 
      008212 00 03            [ 2]    1     addw sp,#3 
      008214 89               [ 4]   72     ret 
                                     73 
                                     74 ;------------------------------
                                     75 ; cp24  N T -- 0x800000|0|0x010000
                                     76 ;------------------------------
      0001A8                         77 cp24:
      0001A8                         78     _xpop 
      008215 88 90            [ 1]    1     ld a,(y)
      008217 F6               [ 1]    2     ldw x,y 
      008218 93 EE            [ 2]    3     ldw x,(1,x)
      00821A 01 72 F0 02      [ 2]    4     addw y,#CELL_SIZE 
      00821E 12 01 90         [ 1]   79     ld acc24,a 
      008221 F7 90 EF         [ 2]   80     ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      0001B7                         81     _at_top 
      008224 01 5B            [ 1]    1     ld a,(y)
      008226 03               [ 1]    2     ldw x,y 
      008227 81 01            [ 2]    3     ldw x,(1,x)
      008228 72 B0 00 0D      [ 2]   82     subw x,acc16
      008228 90 F6 93         [ 1]   83     sbc a,acc24
      00822B EE 01            [ 1]   84     jrslt 1$
      00822D 72 A9            [ 1]   85     jrne 2$
      00822F 00               [ 2]   86     tnzw x 
      008230 03 C7            [ 1]   87     jrne 2$
      008232 00               [ 1]   88     clr a 
      008233 0D CF            [ 2]   89     jra 9$ 
      0001CD                         90 1$: ; i1 < i2 
      008235 00 0E            [ 1]   91     ld a,#255
      008237 90 F6            [ 2]   92     jra 9$ 
      0001D1                         93 2$: ; i1 > i2 
      008239 93 EE            [ 1]   94     ld a,#1 
      00823B 01               [ 1]   95 9$: clrw x
      0001D4                         96      _store_top 
      00823C 72 B0            [ 1]    1     ld (y),a 
      00823E 00 0E C2         [ 2]    2     ldw (1,y),x     
      008241 00               [ 4]   97     ret 
                                     98 
                                     99 ;-------------------------------
                                    100 ; cp24_ax 
                                    101 ; compare acc24 with A:X 
                                    102 ;-------------------------------
      0001DA                        103 cp24_ax:
      008242 0D               [ 1]  104     push a 
      008243 2F 08 26         [ 2]  105     cpw x,acc16 
      008246 0A 5D 26         [ 1]  106     sbc a,acc24
      008249 07               [ 1]  107     pop a 
      00824A 4F               [ 4]  108     ret 
                                    109 
                                    110 
                                    111 ;-------------------------------
                                    112 ; abs24 
                                    113 ; abolute value of top  
                                    114 ;-------------------------------
      0001E3                        115 abs24: ; ( i -- u )
      00824B 20 06            [ 1]  116     ld a,(y)
      00824D A1 80            [ 1]  117     cp a,#0x80 
      00824D A6 FF            [ 1]  118     jrpl neg24 ; negative integer
      00824F 20               [ 4]  119     ret  
                                    120 
                                    121 ;----------------------------
                                    122 ;  one's compleement 
                                    123 ;----------------------------
      0001EA                        124 cpl24:  ; i -- ~i 
      008250 02 73            [ 1]  125     cpl (y) 
      008251 90 63 01         [ 1]  126     cpl (1,y)
      008251 A6 01 5F         [ 1]  127     cpl (2,y)
      008254 90               [ 4]  128     ret 
                                    129 
                                    130 ;----------------------------    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                    131 ; two'2 complement of top  
                                    132 ;---------------------------
      0001F3                        133 neg24: ; (i -- -i )
      0001F3                        134     _at_top
      008255 F7 90            [ 1]    1     ld a,(y)
      008257 EF               [ 1]    2     ldw x,y 
      008258 01 81            [ 2]    3     ldw x,(1,x)
      00825A 43               [ 1]  135     cpl  a  
      00825A 88               [ 2]  136     cplw x 
      00825B C3 00 0E         [ 2]  137     addw x,#1
      00825E C2 00            [ 1]  138     adc a,#0
      0001FF                        139     _store_top  
      008260 0D 84            [ 1]    1     ld (y),a 
      008262 81 EF 01         [ 2]    2     ldw (1,y),x     
      008263 81               [ 4]  140 9$: ret 
                                    141 
                                    142 ;-----------------------------
                                    143 ; negate integer in A:X 
                                    144 ;----------------------------
      000205                        145 neg_ax:
      008263 90               [ 1]  146     cpl  a  
      008264 F6               [ 2]  147     cplw x 
      008265 A1 80 2A         [ 2]  148     addw x,#1
      008268 0A 81            [ 1]  149     adc a,#0
      00826A 81               [ 4]  150     ret 
                                    151 
                                    152 ;------------------------------------
                                    153 ;  two's complement of acc24 
                                    154 ;-------------------------------------
      00020D                        155 neg_acc24: ; 
      00826A 90 73 90 63      [ 1]  156     cpl acc24 
      00826E 01 90 63 02      [ 1]  157     cpl acc16 
      008272 81 53 00 0E      [ 1]  158     cpl acc8
      008273 72 5C 00 0E      [ 1]  159     inc acc8 
      008273 90 F6            [ 1]  160     jrne 9$
      008275 93 EE 01 43      [ 1]  161     inc acc16 
      008279 53 1C            [ 1]  162     jrne 9$
      00827B 00 01 A9 00      [ 1]  163     inc acc24 
      00827F 90               [ 4]  164 9$: ret 
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
      00022A                        180 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008280 F7               [ 1]  181     push a 
      008281 90 EF 01 81      [ 1]  182 	clr acc32
      008285 72 5F 00 0C      [ 1]  183     clr acc24  
                                    184 ; multiply top bits 7..0 * U8   	
      008285 43 53 1C         [ 1]  185     ld a,(2,Y) ; top least byte  
      008288 00               [ 1]  186     ld xl,a 
      008289 01 A9            [ 1]  187     ld a,(U8,sp)
      00828B 00               [ 4]  188     mul x,a 
      00828C 81 00 0D         [ 2]  189     ldw acc16,x 
                                    190 ; multiply top bits 15..8 * U8     
      00828D 90 E6 01         [ 1]  191     ld a,(1,Y) ; top middle byte 
      00828D 72               [ 1]  192     ld xl,a 
      00828E 53 00            [ 1]  193     ld a,(U8,sp) 
      008290 0D               [ 4]  194     mul x,a 
      008291 72 53 00 0E      [ 2]  195     addw x,acc24
      008295 72 53 00 0F      [ 1]  196     rlc acc32 
      008299 72 5C 00         [ 2]  197     ldw acc24,x 
                                    198 ; multiply top bits 23..16 * 8 
      00829C 0F 26            [ 1]  199     ld a,(Y)
      00829E 0A               [ 1]  200     ld xl,a 
      00829F 72 5C            [ 1]  201     ld a,(U8,sp)
      0082A1 00               [ 4]  202     mul x,a 
      0082A2 0E 26 04 72      [ 2]  203     addw x,acc32
      0082A6 5C               [ 1]  204     rlwa x 
      0082A7 00               [ 1]  205     tnz a 
      0082A8 0D 81            [ 1]  206     jreq 1$
      0082AA A6 10            [ 1]  207     ld a,#ERR_OVERFLOW
      0082AA 88 72 5F         [ 2]  208     jp tb_error 
      000262                        209 1$:
      0082AD 00               [ 1]  210     ld a,xh  
      0082AE 0C 72 5F         [ 2]  211     ldw x,acc16   
      000266                        212     _drop VSIZE 
      0082B1 00 0D            [ 2]    1     addw sp,#VSIZE 
      0082B3 90               [ 4]  213     ret
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
      000269                        224 mul24:
      000269                        225     _vars VSIZE
      0082B4 E6 02            [ 2]    1     sub sp,#VSIZE 
      0082B6 97               [ 1]  226     clrw x 
      0082B7 7B 01            [ 2]  227     ldw (PROD,sp),x 
      0082B9 42 CF            [ 2]  228     ldw (PROD+2,sp),x
      000270                        229     _xpop 
      0082BB 00 0E            [ 1]    1     ld a,(y)
      0082BD 90               [ 1]    2     ldw x,y 
      0082BE E6 01            [ 2]    3     ldw x,(1,x)
      0082C0 97 7B 01 42      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      0082C4 72               [ 1]  230     tnz a 
      0082C5 BB 00            [ 1]  231     jrpl 0$
      0082C7 0D 72            [ 1]  232     cpl (PROD_SIGN,sp)
      0082C9 59 00 0C         [ 4]  233     call neg_ax 
      000281                        234 0$:    
      0082CC CF 00            [ 1]  235     ld (N1,sp),a 
      0082CE 0D 90            [ 2]  236     ldw (N1+1,sp),x
      0082D0 F6 97            [ 1]  237     tnz (Y)
      0082D2 7B 01            [ 1]  238     jrpl 2$ 
      0082D4 42 72            [ 1]  239     cpl (PROD_SIGN,sp) 
      0082D6 BB 00 0C         [ 4]  240     call neg24
      00028E                        241 2$: 
      0082D9 02 4D            [ 1]  242     ld a,(N1+2,sp); least byte     
      0082DB 27 05            [ 1]  243     jreq 4$
      0082DD A6 10 CC         [ 4]  244     call mulu24_8
      0082E0 96               [ 1]  245     tnz a 
      0082E1 BB 3C            [ 1]  246     jrmi 8$ ; overflow  
      0082E2 6B 01            [ 1]  247     ld (PROD,sp),a
      0082E2 9E CE            [ 2]  248     ldw (PROD+1,sp),x 
      00029C                        249 4$:
      0082E4 00 0E            [ 1]  250     ld a,(N1+1,sp); middle byte     
      0082E6 5B 01            [ 1]  251     jreq 5$
      0082E8 81 02 2A         [ 4]  252     call mulu24_8
      0082E9 4D               [ 1]  253     tnz a 
      0082E9 52 07            [ 1]  254     jrne 8$  ; overflow 
      0082EB 5F 1F 01         [ 2]  255     addw x,(PROD,sp)
      0082EE 1F 03            [ 1]  256     jrv 8$ ; overflow
      0082F0 90 F6            [ 2]  257     ldw (PROD,sp),x 
      0002AD                        258 5$:
      0082F2 93 EE            [ 1]  259     ld a,(N1,sp) ; high byte 
      0082F4 01 72            [ 1]  260     jreq 6$
      0082F6 A9 00 03         [ 4]  261     call mulu24_8
      0082F9 4D               [ 1]  262     rrwa x 
      0082FA 2A               [ 2]  263     tnzw x 
      0082FB 05 03            [ 1]  264     jrne 8$ ; overflow 
      0082FD 04               [ 1]  265     tnz a 
      0082FE CD 82            [ 1]  266     jrmi 8$ ; overflow 
      008300 85 01            [ 1]  267     add a,(PROD,sp)
      008301 6B 01            [ 1]  268     ld (PROD,sp),a 
      008301 6B 05            [ 1]  269     jrv 8$ ; overflow 
      0002C1                        270 6$:
      008303 1F 06            [ 1]  271     ld a,(PROD,sp)
      008305 90 7D            [ 2]  272     ldw x,(PROD+1,sp)
      008307 2A 05            [ 1]  273     tnz (PROD_SIGN,sp)
      008309 03 04            [ 1]  274     jreq 9$
      00830B CD 82 73         [ 4]  275     call neg_ax 
      00830E                        276 9$:
      0002CC                        277     _store_top 
      00830E 7B 07            [ 1]    1     ld (y),a 
      008310 27 0A CD         [ 2]    2     ldw (1,y),x     
      0002D1                        278     _drop VSIZE 
      008313 82 AA            [ 2]    1     addw sp,#VSIZE 
      008315 4D               [ 4]  279     ret 
      0002D4                        280 8$: ; overflow
      008316 2B 3C            [ 1]  281     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008318 6B 01 1F         [ 2]  282     jp tb_error 
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
      0002D9                        296 divu24_8:
      00831B 02               [ 2]  297 	pushw x ; save x
      00831C 88               [ 1]  298 	push a 
                                    299 	; ld dividend UU:MM bytes in X
      00831C 7B 06 27         [ 2]  300 	ldw x,acc24
      00831F 0D CD            [ 1]  301 	ld a,(U8,SP) ; divisor
      008321 82               [ 2]  302 	div x,a ; UU:MM/U8
      008322 AA               [ 1]  303 	push a  ;save remainder
      008323 4D 26 2E         [ 2]  304     ldw acc24,x ; quotient 
      008326 72               [ 1]  305 	pop a
      008327 FB               [ 1]  306 	ld xh,a
      008328 01 29 29         [ 1]  307 	ld a,acc8
      00832B 1F               [ 1]  308 	ld xl,a
      00832C 01 01            [ 1]  309 	ld a,(U8,sp) ; divisor
      00832D 62               [ 2]  310 	div x,a  ; R:LL/U8
      00832D 7B 05            [ 1]  311 	ld (U8,sp),a ; save remainder
      00832F 27               [ 1]  312 	ld a,xl
      008330 10 CD 82         [ 1]  313 	ld acc8,a
      008333 AA               [ 1]  314 	pop a
      008334 01               [ 2]  315 	popw x
      008335 5D               [ 4]  316 	ret
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
      0002F7                        332 div24:
      0002F7                        333     _vars VSIZE 
      008336 26 1C            [ 2]    1     sub sp,#VSIZE 
      008338 4D 2B            [ 1]  334     clr (RSIGN,sp)
      00833A 19 1B            [ 1]  335     clr (QSIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0002FD                        336     _xpop 
      00833C 01 6B            [ 1]    1     ld a,(y)
      00833E 01               [ 1]    2     ldw x,y 
      00833F 29 13            [ 2]    3     ldw x,(1,x)
      008341 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008341 7B               [ 1]  337     tnz a 
      008342 01 1E            [ 1]  338     jrpl 0$ 
      008344 02 0D            [ 1]  339     cpl (QSIGN,sp)
      008346 04 27 03         [ 4]  340     call neg_ax
      00030E                        341 0$:
      008349 CD 82            [ 1]  342     ld  (DIVISOR,sp),a
      00834B 85 02            [ 2]  343     ldw (DIVISOR+1,sp),x
      00834C 1A 02            [ 1]  344     or a,(DIVISOR+1,sp)
      00834C 90 F7            [ 1]  345     or a,(DIVISOR+2,sp)
      00834E 90 EF            [ 1]  346     jrne 1$ 
      008350 01 5B            [ 1]  347     ld a,#ERR_DIV0 
      008352 07 81 3B         [ 2]  348     jp tb_error 
      008354                        349 1$: ; dividend  
      00031D                        350     _at_top
      008354 A6 10            [ 1]    1     ld a,(y)
      008356 CC               [ 1]    2     ldw x,y 
      008357 96 BB            [ 2]    3     ldw x,(1,x)
      008359 4D               [ 1]  351     tnz a 
      008359 89 88            [ 1]  352     jrpl 2$
      00835B CE 00 0D         [ 4]  353     call neg_ax
      00835E 7B 01            [ 1]  354     cpl (QSIGN,sp)
      008360 62 88            [ 1]  355     cpl (RSIGN,sp)
      00032C                        356 2$: 
                                    357 ;    ld acc24,a 
                                    358 ;    ldw acc16,x 
      00032C                        359     _store_top 
      008362 CF 00            [ 1]    1     ld (y),a 
      008364 0D 84 95         [ 2]    2     ldw (1,y),x     
      008367 C6 00            [ 1]  360     ld a,#24 
      008369 0F 97            [ 1]  361     ld (CNTR,sp),a
      00836B 7B 01            [ 1]  362     ld a,(DIVISOR,sp)
      00836D 62 6B            [ 2]  363     ldw x,(DIVISOR+1,sp)
                                    364 ; dividend >= divisor ? 
      00836F 01 9F C7         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      008372 00 0F            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      008374 84 85 81         [ 1]  368     ld a,acc24 
      008377 CE 00 0D         [ 2]  369     ldw x,acc16 
      008377 52 06 0F 06      [ 1]  370     clr acc24 
      00837B 0F 05 90 F6      [ 1]  371     clr acc16 
      00837F 93 EE 01 72      [ 1]  372     clr acc8 
      008383 A9 00            [ 2]  373     jra 6$
      000352                        374 22$:     
      008385 03               [ 1]  375     clr a 
      008386 4D               [ 1]  376     clrw x 
      008387 2A               [ 1]  377     rcf  
      000355                        378 3$: ; shift carry in acc24 bit 0 
      008388 05 03 05         [ 1]  379     rlc (2,y) 
      00838B CD 82 85         [ 1]  380     rlc (1,y)
      00838E 90 79            [ 1]  381     rlc (Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00838E 6B               [ 2]  382     rlcw x  
      00838F 01               [ 1]  383     rlc a
      008390 1F 02 1A         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      008393 02 1A            [ 1]  385     sbc a,(DIVISOR,sp)
      008395 03 26            [ 1]  386     jrnc 5$
      008397 05 A6 04         [ 2]  387     addw x,(DIVISOR+1,sp)
      00839A CC 96            [ 1]  388     adc a,(DIVISOR,sp)
      00036B                        389 5$: ; shift carry in QUOTIENT 
      00839C BB               [ 1]  390     ccf
      00839D 0A 04            [ 1]  391     dec (CNTR,sp)
      00839D 90 F6            [ 1]  392     jrne 3$ 
                                    393 ; shift quotient last bit     
      00839F 93 EE 01         [ 1]  394     rlc (2,y)
      0083A2 4D 2A 07         [ 1]  395     rlc (1,y) 
      0083A5 CD 82            [ 1]  396     rlc (y) 
      000378                        397 6$:    
      0083A7 85 03            [ 1]  398     ld (DIVISOR,sp),a 
      0083A9 05 03            [ 2]  399     ldw (DIVISOR+1,sp),x 
      0083AB 06 05            [ 1]  400     tnz (QSIGN,sp)
      0083AC 27 03            [ 1]  401     jreq 8$
      0083AC 90 F7 90         [ 4]  402     call neg24
      000383                        403 8$: 
      0083AF EF 01            [ 1]  404     ld a,(DIVISOR,sp)
      0083B1 A6 18            [ 2]  405     ldw x,(DIVSOR+1,sp)
      000387                        406 81$:
      0083B3 6B 04            [ 1]  407     tnz (RSIGN,sp)
      0083B5 7B 01            [ 1]  408     jreq 9$
      0083B7 1E 02 CD         [ 4]  409     call neg_ax       
      00038E                        410 9$: _drop VSIZE 
      0083BA 82 5A            [ 2]    1     addw sp,#VSIZE 
      0083BC 23               [ 4]  411     ret 
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
      000391                        423 mod24:
      0083BD 14 C6 00         [ 4]  424     call div24 
      000394                        425     _store_top  ; replace quotient by remainder 
      0083C0 0D CE            [ 1]    1     ld (y),a 
      0083C2 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083C5 5F               [ 4]  426     ret 
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
                           000001    25 .if DEBUG 
                                     26 
                                     27     .area CODE
                                     28 
                                     29 ;--------------------
                                     30 ; print content at address in hex.
                                     31 ; input:
                                     32 ;   X 	address to peek 
                                     33 ; output:
                                     34 ;	none 
                                     35 ;--------------------	
      00039A                         36 prt_peek::
      0083C6 00               [ 2]   37 	pushw x 
      0083C7 0D 72 5F 00      [ 1]   38 	mov base,#16 
      0083CB 0E 72 5F         [ 4]   39 	call prt_i16  
      0083CE 00 0F            [ 1]   40 	ld a,#': 
      0083D0 20 26 DE         [ 4]   41 	call putc 
      0083D2 A6 20            [ 1]   42 	ld a,#SPACE 
      0083D2 4F 5F 98         [ 4]   43 	call putc 
      0083D5 85               [ 2]   44 	popw x 
      0083D5 90               [ 1]   45 	ld a,(x)
      0083D6 69               [ 1]   46 	clrw x 
      0083D7 02               [ 1]   47 	ld xl,a 
      0083D8 90 69 01 90      [ 1]   48 	mov base,#10 
      0083DC 79 59 49         [ 4]   49 	call prt_i16 
      0083DF 72               [ 4]   50 	ret 
                                     51 
                                     52 ;----------------------------------------
                                     53 ;   DEBUG support functions
                                     54 ;----------------------------------------
                                     55 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                     56 ; turn LED on 
      0003B8                         57 ledon:
      0083E0 F0 02 12 01      [ 1]   58     bset PC_ODR,#LED2_BIT
      0083E4 24               [ 4]   59     ret 
                                     60 
                                     61 ; turn LED off 
      0003BD                         62 ledoff:
      0083E5 05 72 FB 02      [ 1]   63     bres PC_ODR,#LED2_BIT 
      0083E9 19               [ 4]   64     ret 
                                     65 
                                     66 ; invert LED status 
      0003C2                         67 ledtoggle:
      0083EA 01 20            [ 1]   68     ld a,#LED2_MASK
      0083EB C8 50 0A         [ 1]   69     xor a,PC_ODR
      0083EB 8C 0A 04         [ 1]   70     ld PC_ODR,a
      0083EE 26               [ 4]   71     ret 
                                     72 
      0003CB                         73 left_paren:
      0083EF E5 90            [ 1]   74 	ld a,#SPACE 
      0083F1 69 02 90         [ 4]   75 	call putc
      0083F4 69 01            [ 1]   76 	ld a,#'( 
      0083F6 90 79 DE         [ 4]   77 	call putc 	
      0083F8 81               [ 4]   78 	ret 
                                     79 
                                     80 ;------------------------------
                                     81 ; print 8 bit register 
                                     82 ; input:
                                     83 ;   X  point to register name 
                                     84 ;   A  register value to print 
                                     85 ; output:
                                     86 ;   none
                                     87 ;------------------------------- 
      0003D6                         88 prt_reg8:
      0083F8 6B               [ 1]   89 	push a 
      0083F9 01 1F 02         [ 4]   90 	call puts 
      0083FC 0D 05            [ 1]   91 	ld a,(1,sp) 
      0083FE 27               [ 1]   92 	clrw x 
      0083FF 03               [ 1]   93 	ld xl,a 
      008400 CD 82 73 0A      [ 1]   94 	mov base,#16
      008403 CD 17 E5         [ 4]   95 	call prt_i16  
      008403 7B 01 1E         [ 4]   96 	call left_paren 
      008406 02               [ 1]   97 	pop a 
      008407 5F               [ 1]   98 	clrw x 
      008407 0D               [ 1]   99 	ld xl,a 
      008408 06 27 03 CD      [ 1]  100 	mov base,#10 
      00840C 82 85 5B         [ 4]  101 	call prt_i16  
      00840F 06 81            [ 1]  102 	ld a,#') 
      008411 CD 08 DE         [ 4]  103 	call putc
      008411 CD               [ 4]  104 	ret
                                    105 
                                    106 ;--------------------------------
                                    107 ; print 16 bits register 
                                    108 ; input:
                                    109 ;   X   point register name 
                                    110 ;   Y   register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                    111 ; output:
                                    112 ;  none
                                    113 ;--------------------------------
      0003F8                        114 prt_reg16: 
      008412 83 77            [ 2]  115 	pushw y 
      008414 90 F7 90         [ 4]  116 	call puts 
      008417 EF 01            [ 2]  117 	ldw x,(1,sp) 
      008419 81 10 00 0A      [ 1]  118 	mov base,#16 
      00841A CD 17 E5         [ 4]  119 	call prt_i16  
      00841A 89 35 10         [ 4]  120 	call left_paren 
      00841D 00               [ 2]  121 	popw x 
      00841E 0B CD 98 65      [ 1]  122 	mov base,#10 
      008422 A6 3A CD         [ 4]  123 	call prt_i16  
      008425 89 5E            [ 1]  124 	ld a,#') 
      008427 A6 20 CD         [ 4]  125 	call putc
      00842A 89               [ 4]  126 	ret 
                                    127 
                                    128 ;------------------------------------
                                    129 ; print registers contents saved on
                                    130 ; stack by trap interrupt.
                                    131 ;------------------------------------
                           000001   132 	SAVE_ACC24=1 
                           000002   133 	SAVE_ACC16=2
                           000003   134 	VSIZE=3 
      000417                        135 	_argofs VSIZE ; TrapHandler saved acc24  
                           000005     1     ARG_OFS=2+VSIZE 
      000417                        136 	_arg R_PC, 8 
                           00000D     1     R_PC=ARG_OFS+8 
      000417                        137 	_arg R_PCE,7 
                           00000C     1     R_PCE=ARG_OFS+7 
      000417                        138 	_arg R_Y 5 
                           00000A     1     R_Y=ARG_OFS+5 
      000417                        139 	_arg R_X 3
                           000008     1     R_X=ARG_OFS+3 
      000417                        140 	_arg R_A 2
                           000007     1     R_A=ARG_OFS+2 
      000417                        141 	_arg R_CC 1
                           000006     1     R_CC=ARG_OFS+1 
      000417                        142 print_registers:
      000417                        143 	_vars VSIZE 
      00842B 5E 85            [ 2]    1     sub sp,#VSIZE 
      00842D F6 5F 97         [ 1]  144 	ld a,acc24 
      008430 35 0A 00         [ 2]  145 	ldw x,acc16 
      008433 0B CD            [ 1]  146 	ld (SAVE_ACC24,sp),a 
      008435 98 65            [ 2]  147 	ldw (SAVE_ACC16,sp),x 
      008437 81 04 86         [ 2]  148 	ldw x,#STATES
      008438 CD 09 3B         [ 4]  149 	call puts
                                    150 ; print EPC 
      008438 72 1A 50 0A      [ 1]  151 	mov base,#16
      00843C 81 04 C2         [ 2]  152 	ldw x, #REG_EPC
      00843D CD 09 3B         [ 4]  153 	call puts 
      00843D 72 1B            [ 1]  154 	ld a, (R_PCE,sp)
      00843F 50 0A 81         [ 1]  155 	ld acc8,a 
      008442 1E 0D            [ 2]  156 	ldw x,(R_PC,sp)
      008442 A6 20 C8         [ 1]  157 	ld acc24,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008445 50 0A C7         [ 2]  158 	ldw acc16,x 
      008448 50               [ 1]  159 	clr a 
      008449 0A 81 FC         [ 4]  160 	call prt_acc24 
      00844B 35 0A 00 0A      [ 1]  161 	mov base,#10  
                                    162 ; print x
      00844B A6 20 CD         [ 2]  163 	ldw x,#REG_X
      00844E 89 5E            [ 2]  164 	ldw y,(R_X,sp)
      008450 A6 28 CD         [ 4]  165 	call prt_reg16  
                                    166 ; print Y 
      008453 89 5E 81         [ 2]  167 	ldw x,#REG_Y
      008456 16 0A            [ 2]  168 	ldw y, (R_Y,sp)
      008456 88 CD 89         [ 4]  169 	call prt_reg16  
                                    170 ; print A 
      008459 BB 7B 01         [ 2]  171 	ldw x,#REG_A
      00845C 5F 97            [ 1]  172 	ld a, (R_A,sp) 
      00845E 35 10 00         [ 4]  173 	call prt_reg8
                                    174 ; print CC 
      008461 0B CD 98         [ 2]  175 	ldw x,#REG_CC 
      008464 65 CD            [ 1]  176 	ld a, (R_CC,sp) 
      008466 84 4B 84         [ 4]  177 	call prt_reg8 
                                    178 ; print SP 
      008469 5F 97 35         [ 2]  179 	ldw x,#REG_SP
      00846C 0A 00            [ 1]  180 	ldw y,sp 
      00846E 0B CD 98 65      [ 2]  181 	addw y,#(VSIZE+2+9)
      008472 A6 29 CD         [ 4]  182 	call prt_reg16  
      008475 89 5E            [ 1]  183 	ld a,#'\n' 
      008477 81 08 DE         [ 4]  184 	call putc
      008478 7B 01            [ 1]  185 	ld a,(SAVE_ACC24,sp)
      008478 90 89            [ 2]  186 	ldw x,(SAVE_ACC16,sp)
      00847A CD 89 BB         [ 1]  187 	ld acc24,a 
      00847D 1E 01 35         [ 2]  188 	ldw acc16,x 
      000483                        189 	_drop VSIZE  	
      008480 10 00            [ 2]    1     addw sp,#VSIZE 
      008482 0B               [ 4]  190 	ret
                                    191 
      008483 CD 98 65 CD 84 4B 85   192 STATES:  .asciz "\nRegisters state at TRAP point.\n--------------------------\n"
             35 0A 00 0B CD 98 65
             A6 29 CD 89 5E 81 54
             52 41 50 20 70 6F 69
             6E 74 2E 0A 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
      008497 45 50 43 3A 00         193 REG_EPC: .asciz "EPC:"
      008497 52 03 C6 00            194 REG_Y:   .asciz "\nY:" 
      00849B 0D CE 00 0E            195 REG_X:   .asciz "\nX:"
      00849F 6B 01 1F 02            196 REG_A:   .asciz "\nA:" 
      0084A3 AE 85 06 CD 89         197 REG_CC:  .asciz "\nCC:"
      0084A8 BB 35 10 00 0B         198 REG_SP:  .asciz "\nSP:"
                                    199 
                                    200 ;----------------------
                                    201 ; input:
                                    202 ;	Y    *input buffer 
                                    203 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                    204 ;   acc24  integer 
                                    205 ;----------------------
      0004DD                        206 parse_addr:
      0084AD AE 85            [ 1]  207 	ld a,#SPACE 
      0084AF 42 CD 89         [ 4]  208 	call skip  	 
      0084B2 BB 7B 0C C7      [ 2]  209 	addw y,in.w 
      0084B6 00 0F 1E         [ 2]  210 	ldw x,#pad 
      0084B9 0D C7 00         [ 4]  211 	call strcpy
      0084BC 0D CF 00         [ 2]  212 	ldw x,#pad
      0084BF 0E 4F CD         [ 4]  213 	call atoi24 	
      0084C2 98               [ 4]  214 	ret 
                                    215 
                                    216 ;----------------------------
                                    217 ; command interface
                                    218 ; only 3 commands:
                                    219 ;  'q' to resume application
                                    220 ;  'p [addr]' to print memory values 
                                    221 ;  's addr' to print string 
                                    222 ;----------------------------
                                    223 ;local variable
                           00000B   224 	PSIZE=11
                           00000A   225 	SAV_COUNT=10
                           000009   226 	SAV_IN=9
                           000008   227 	SAV_ACC24=8
                           000006   228 	SAV_ACC16=6
                           000004   229 	R_Y=4
                           000002   230 	R_X=2
                           000001   231 	R_A=1
                           00000B   232 	VSIZE=11
      0004F3                        233 cmd_itf:
      0084C3 7C               [ 1]  234 	push cc 
      0004F4                        235 	_vars VSIZE
      0084C4 35 0A            [ 2]    1     sub sp,#VSIZE 
      0084C6 00 0B            [ 1]  236 	ld (R_A,sp),a
      0084C8 AE 85 4B         [ 1]  237 	ld a,count 
      0084CB 16 08            [ 1]  238 	ld (SAV_COUNT,sp),a 
      0084CD CD 84 78         [ 1]  239 	ld a,in 
      0084D0 AE 85            [ 1]  240 	ld (SAV_IN,sp),a  
      0084D2 47 16            [ 2]  241 	ldw (R_X,sp),x 
      0084D4 0A CD            [ 2]  242 	ldw (R_Y,sp),y
      0084D6 84 78 AE         [ 1]  243 	ld a,acc24 
      0084D9 85 4F 7B         [ 2]  244 	ldw x,acc16 
      0084DC 07 CD            [ 1]  245 	ld (SAV_ACC24,sp),a 
      0084DE 84 56            [ 2]  246 	ldw (SAV_ACC16,sp),x 
      0084E0 AE 85 53 7B      [ 1]  247 	clr farptr 
      0084E4 06 CD 84 56      [ 1]  248 	clr farptr+1 
      0084E8 AE 85 58 90      [ 1]  249 	clr farptr+2  
      00051C                        250 repl:
      0084EC 96 72            [ 1]  251 	ld a,#CR 
      0084EE A9 00 0E         [ 4]  252 	call putc 
      0084F1 CD 84            [ 1]  253 	ld a,#'? 
      0084F3 78 A6 0A         [ 4]  254 	call putc
      0084F6 CD 89 5E 7B      [ 1]  255 	clr in.w 
      0084FA 01 1E 02 C7      [ 1]  256 	clr in 
      0084FE 00 0D CF         [ 4]  257 	call readln
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008501 00 0E 5B 03      [ 2]  258 	ldw y,#tib  
      008505 81 0A            [ 1]  259 	ld a,(y)
      008507 52 65            [ 1]  260 	jreq repl  
      008509 67 69 73 74      [ 1]  261 	inc in 
      00850D 65 72 73         [ 4]  262 	call to_upper 
      008510 20 73            [ 1]  263 	cp a,#'Q 
      008512 74 61            [ 1]  264 	jrne test_p
      000544                        265 repl_exit:
                                    266 ; restore original context 
      008514 74 65            [ 1]  267 	ld a,(SAV_ACC24,sp)
      008516 20 61            [ 2]  268 	ldw x,(SAV_ACC16,sp)
      008518 74 20 54         [ 1]  269 	ld acc24,a 
      00851B 52 41 50         [ 2]  270 	ldw acc16,x
      00851E 20 70            [ 1]  271 	ld a,(SAV_COUNT,sp)
      008520 6F 69 6E         [ 1]  272 	ld count,a 
      008523 74 2E            [ 1]  273 	ld a,(SAV_IN,sp)
      008525 0A 2D 2D         [ 1]  274 	ld in,a 
      008528 2D 2D            [ 2]  275 	ldw y,(R_Y,sp)
      00852A 2D 2D            [ 2]  276 	ldw x,(R_X,sp)
      00852C 2D 2D            [ 1]  277 	ld a,(R_A,sp)
      00055E                        278 	_drop VSIZE
      00852E 2D 2D            [ 2]    1     addw sp,#VSIZE 
      008530 2D               [ 1]  279 	pop cc 
      008531 2D               [ 4]  280 	ret  
      000562                        281 invalid:
      008532 2D 2D 2D         [ 2]  282 	ldw x,#invalid_cmd 
      008535 2D 2D 2D         [ 4]  283 	call puts 
      008538 2D 2D            [ 2]  284 	jra repl 
      00056A                        285 test_p:	
      00853A 2D 2D            [ 1]  286     cp a,#'P 
      00853C 2D 2D            [ 1]  287 	jreq mem_peek
      00853E 2D 2D            [ 1]  288     cp a,#'S 
      008540 0A 00            [ 1]  289 	jrne invalid 
      000572                        290 print_string:
      008542 45 50 43         [ 4]  291 	call parse_addr 	
      008545 3A 00 0A         [ 2]  292 	ldw x,acc16
      008548 59 3A 00         [ 4]  293 	call puts
      00854B 0A 58 3A         [ 2]  294 	jp repl 	
      00057E                        295 mem_peek:
      00854E 00 0A 41         [ 4]  296 	call parse_addr 
      008551 3A 00 0A         [ 1]  297 	ld a, acc24 
      008554 43 43 3A         [ 1]  298 	or a,acc16 
      008557 00 0A 53         [ 1]  299 	or a,acc8 
      00855A 50 3A            [ 1]  300 	jrne 1$ 
      00855C 00 0C            [ 2]  301 	jra peek_byte  
      00855D CE 00 0C         [ 2]  302 1$:	ldw x,acc24 
      00855D A6 20 CD         [ 2]  303 	ldw farptr,x 
      008560 8F 22 72         [ 1]  304 	ld a,acc8 
      008563 B9 00 01         [ 1]  305 	ld farptr+2,a 
      00059A                        306 peek_byte:
      008566 AE 16 E0         [ 4]  307 	call print_farptr 
      008569 CD 93            [ 1]  308 	ld a,#8 
      00856B F5 AE            [ 1]  309 	ld (PSIZE,sp),a 
      00856D 16               [ 1]  310 	clrw x 
      00856E E0 CD 99         [ 4]  311 1$:	call fetchc  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008571 07               [ 2]  312 	pushw x 
      008572 81 00 0E         [ 1]  313 	ld acc8,a 
      008573 5F               [ 1]  314 	clrw x 
      008573 8A 52 0B         [ 2]  315 	ldw acc24,x 
      008576 6B 01            [ 1]  316 	ld a,#16+128
      008578 C6 00 04         [ 4]  317 	call prt_acc24
      00857B 6B               [ 2]  318 	popw x 
      00857C 0A C6            [ 1]  319 	dec (PSIZE,sp)
      00857E 00 02            [ 1]  320 	jrne 1$ 
      008580 6B 09            [ 1]  321 	ld a,#8 
      008582 1F 02 17         [ 1]  322 	add a,farptr+2 
      008585 04 C6 00         [ 1]  323 	ld farptr+2,a
      008588 0D               [ 1]  324 	clr a 
      008589 CE 00 0E         [ 1]  325 	adc a,farptr+1 
      00858C 6B 08 1F         [ 1]  326 	ld farptr+1,a 
      00858F 06               [ 1]  327 	clr a 
      008590 72 5F 00         [ 1]  328 	adc a,farptr 
      008593 19 72 5F         [ 1]  329 	ld farptr,a 
      008596 00 1A 72         [ 2]  330 	jp repl  
                                    331 
      008599 5F 00 1B 20 61 20 63   332 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    333 
                                    334 ;----------------------------
                                    335 ; display farptr address
                                    336 ;----------------------------
      00859C                        337 print_farptr:
      00859C A6 0D CD         [ 1]  338 	ld a ,farptr+2 
      00859F 89 5E A6         [ 1]  339 	ld acc8,a 
      0085A2 3F CD 89         [ 2]  340 	ldw x,farptr 
      0085A5 5E 72 5F         [ 2]  341 	ldw acc24,x 
      0085A8 00               [ 1]  342 	clrw x 
      0085A9 01 72            [ 1]  343 	ld a,#16 
      0085AB 5F 00 02         [ 4]  344 	call prt_acc24
      0085AE CD 8A            [ 1]  345 	ld a,#SPACE 
      0085B0 C0 90 AE         [ 4]  346 	call putc 
      0085B3 16 90 90         [ 4]  347 	call putc 
      0085B6 F6               [ 4]  348 	ret
                                    349 
                                    350 ;------------------------------------
                                    351 ; get byte at address farptr[X]
                                    352 ; input:
                                    353 ;	 farptr   address to peek
                                    354 ;    X		  farptr index 	
                                    355 ; output:
                                    356 ;	 A 		  byte from memory  
                                    357 ;    x		  incremented by 1
                                    358 ;------------------------------------
      0005FA                        359 fetchc: ; @C
      0085B7 27 E3 72 5C      [ 5]  360 	ldf a,([farptr],x)
      0085BB 00               [ 1]  361 	incw x
      0085BC 02               [ 4]  362 	ret
                                    363 
                                    364 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                    365 ;------------------------------------
                                    366 ; expect a number from command line 
                                    367 ; next argument
                                    368 ;  input:
                                    369 ;	  none
                                    370 ;  output:
                                    371 ;    acc24   int24_t 
                                    372 ;------------------------------------
      000600                        373 number:
      0085BD CD 98 FB         [ 4]  374 	call get_token
      0085C0 A1 51            [ 1]  375 	cp a,#TK_INTGR
      0085C2 26 26            [ 1]  376 	jreq 1$
      0085C4 CC 16 39         [ 2]  377 	jp syntax_error
      0085C4 7B               [ 4]  378 1$:	ret
                                    379 
                                    380 
                                    381 ;---------------------
                                    382 ; display n bytes row 
                                    383 ; from memory.
                                    384 ; input:
                                    385 ;   A   bytes to print 
                                    386 ;	X   start address 
                                    387 ; output:
                                    388 ;   X   address after last shown  
                                    389 ;---------------------
                           000001   390 	CNT=1 
                           000002   391 	ADR=2 
                           000003   392 	VSIZE=3 
      00060B                        393 show_row:
      0085C5 08               [ 1]  394 	tnz a 
      0085C6 1E 06            [ 1]  395 	jrne 1$
      0085C8 C7               [ 4]  396 	ret 
      00060F                        397 1$:	
      0085C9 00               [ 2]  398 	pushw x  
      0085CA 0D               [ 1]  399 	push a 
      0085CB CF 00 0E 7B      [ 1]  400 	mov tab_width,#4 
      0085CF 0A C7 00         [ 4]  401 	call prt_i16 
      0085D2 04 7B            [ 1]  402 	ld a,#SPACE  
      0085D4 09 C7 00         [ 4]  403 	call putc
      00061D                        404 row_loop:
      0085D7 02 16            [ 2]  405 	ldw x,(ADR,sp)
      0085D9 04               [ 1]  406 	ld a,(x)
      0085DA 1E               [ 1]  407 	clrw x 
      0085DB 02               [ 1]  408 	ld xl,a 
      0085DC 7B 01 5B         [ 4]  409 	call prt_i16 
      0085DF 0B 86            [ 2]  410 	ldw x,(ADR,sp)
      0085E1 81               [ 1]  411 	incw x 
      0085E2 1F 02            [ 2]  412 	ldw (ADR,sp),x 
      0085E2 AE 86            [ 1]  413 	dec (CNT,sp)
      0085E4 50 CD            [ 1]  414 	jrne row_loop
      00062E                        415 	_drop VSIZE  		
      0085E6 89 BB            [ 2]    1     addw sp,#VSIZE 
      0085E8 20 B2 00 23      [ 1]  416 	mov tab_width,#4
      0085EA A6 0D            [ 1]  417 	ld a,#CR 
      0085EA A1 50 27         [ 4]  418 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0085ED 10               [ 4]  419 	ret 
                                    420 
                                    421 ;--------------------------
                                    422 ; print memory content 
                                    423 ; in hexadecimal format
                                    424 ;  input:
                                    425 ;    X    start address 
                                    426 ;    Y    count 
                                    427 ;--------------------------
                           000001   428 	BCNT=1
                           000003   429 	BASE=3
                           000004   430 	TABW=4
                           000004   431 	VSIZE=4   
      00063A                        432 hex_dump:
      0085EE A1               [ 1]  433 	push a 
      00063B                        434 	_vars VSIZE
      0085EF 53 26            [ 2]    1     sub sp,#VSIZE 
      0085F1 F0 00 0A         [ 1]  435 	ld a,base
      0085F2 6B 03            [ 1]  436 	ld (BASE,sp),a 
      0085F2 CD 85 5D CE      [ 1]  437 	mov base,#16
      0085F6 00 0E CD         [ 1]  438 	ld a,tab_width 
      0085F9 89 BB            [ 1]  439 	ld (TABW,sp),a
      0085FB CC 85            [ 1]  440 	ld a,#CR 
      0085FD 9C 08 DE         [ 4]  441 	call putc 
      0085FE 17 01            [ 2]  442 1$: ldw (BCNT,sp),y
      0085FE CD 85            [ 1]  443 	ld a,#16
      008600 5D C6 00 0D      [ 2]  444 	cpw y,#16
      008604 CA 00            [ 1]  445 	jrpl 2$
      008606 0E CA            [ 1]  446 	ld a,yl
      00065C                        447 2$: 	
      008608 00 0F 26         [ 4]  448 	call show_row 
      00860B 02 20            [ 2]  449 	ldw y,(BCNT,sp) 
      00860D 0C CE 00 0D      [ 2]  450 	subw y,#16 
      008611 CF 00 19 C6      [ 2]  451 	cpw y,#1
      008615 00 0F            [ 1]  452 	jrpl 1$
      008617 C7 00            [ 1]  453 	ld a,(BASE,sp)
      008619 1B 00 0A         [ 1]  454 	ld base,a
      00861A 7B 04            [ 1]  455 	ld a,(TABW,sp)
      00861A CD 86 5F         [ 1]  456 	ld tab_width,a 
      000675                        457 	_drop VSIZE
      00861D A6 08            [ 2]    1     addw sp,#VSIZE 
      00861F 6B               [ 1]  458 	pop a 
      008620 0B               [ 4]  459 	ret 
                                    460 
                                    461 .endif ; DEBUG 
                                    462 
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
      000679                         45 unlock_eeprom:
      008621 5F CD 86 7A 89   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008626 C7 00 0F 5F      [ 1]   47 	mov FLASH_CR2,#0 
      00862A CF 00 0D A6      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      00862E 90 CD 98 7C      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008632 85 0A 0B 26      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008636 EB A6 08 CB 00   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00863B 1B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      000694                         62 unlock_flash:
      00863C C7 00 1B 4F C9   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008641 00 1A C7 00      [ 1]   64 	mov FLASH_CR2,#0 
      008645 1A 4F C9 00      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008649 19 C7 00 19      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00864D CC 85 9C 6E      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008651 6F 74 20 61 20   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008656 63               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      0006AF                         76 row_erase:
      008657 6F               [ 1]   77 	push a 
      008658 6D 6D            [ 2]   78 	pushw y 
      00865A 61 6E 64 0A      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00865E 00 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00865F 4F               [ 1]   81 	clr a 
      00865F C6 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      008661 1B C7 00 0F      [ 1]   83 	ldf ([farptr],y),a
      008665 CE 00            [ 1]   84     incw y
      008667 19 CF 00 0D      [ 1]   85 	ldf ([farptr],y),a
      00866B 5F A6            [ 1]   86     incw y
      00866D 10 CD 98 7C      [ 1]   87 	ldf ([farptr],y),a
      008671 A6 20            [ 1]   88     incw y
      008673 CD 89 5E CD      [ 1]   89 	ldf ([farptr],y),a
      008677 89 5E 81 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00867A 90 85            [ 2]   91 	popw y 
      00867A 92               [ 1]   92 	pop a 
      00867B AF               [ 4]   93 	ret
      0006DC                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      0006DC                         97 move_erase_to_ram:
      00867C 00               [ 2]   98 	pushw x 
      00867D 19 5C            [ 2]   99 	pushw y 
      00867F 81 06 DC         [ 2]  100 	ldw x,#row_erase_end 
      008680 1D 06 AF         [ 2]  101 	subw x,#row_erase
      008680 CD 8F 35         [ 2]  102 	ldw acc16,x 
      008683 A1 84 27         [ 2]  103 	ldw x,#tib 
      008686 03 CC 96 B9      [ 2]  104 	ldw y,#row_erase 
      00868A 81 13 85         [ 4]  105 	call move
      00868B 90 85            [ 2]  106 	popw y
      00868B 4D               [ 2]  107 	popw x
      00868C 26               [ 4]  108 	ret 
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
      0006F6                        123 program_row:
      00868D 01               [ 1]  124 	push a 
      00868E 81 89            [ 2]  125 	pushw y 
      00868F 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      00868F 89 88 35 04      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      008693 00 24 CD 98      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      008697 65 A6            [ 1]  130 	clrw y 
      008699 20               [ 1]  131 1$:	ld a,(x)
      00869A CD 89 5E 18      [ 1]  132 	ldf ([farptr],y),a
      00869D 5C               [ 1]  133 	incw x 
      00869D 1E 02            [ 1]  134 	incw y 
      00869F F6 5F            [ 1]  135 	dec (BCNT,sp)
      0086A1 97 CD            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0086A3 98 65 1E 02 5C   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000716                        139 	_drop 1 
      0086A8 1F 02            [ 2]    1     addw sp,#1 
      0086AA 0A 01            [ 2]  140 	popw y 
      0086AC 26               [ 1]  141 	pop a 
      0086AD EF               [ 4]  142 	ret 
      00071C                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      00071C                        149 move_prg_to_ram:
      0086AE 5B               [ 2]  150 	pushw x 
      0086AF 03 35            [ 2]  151 	pushw y 
      0086B1 04 00 24         [ 2]  152 	ldw x,#program_row_end 
      0086B4 A6 0D CD         [ 2]  153 	subw x,#program_row 
      0086B7 89 5E 81         [ 2]  154 	ldw acc16,x ; bytes to move 
      0086BA AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
      0086BA 88 52 04 C6      [ 2]  156 	ldw y,#program_row ; source address 
      0086BE 00 0B 6B         [ 4]  157 	call move
      0086C1 03 35            [ 2]  158 	popw y 
      0086C3 10               [ 2]  159 	popw x  
      0086C4 00               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000736                        169 write_buffer:
      0086C5 0B               [ 2]  170 	pushw x 
      0086C6 C6 00 24 6B      [ 1]  171 	tnz farptr 
      0086CA 04 A6            [ 1]  172 	jrne to_flash 
      0086CC 0D CD 89         [ 2]  173 	ldw x,farptr+1 
      0086CF 5E 17 01         [ 2]  174 	cpw x,#app_space  
      0086D2 A6 10            [ 1]  175 	jruge to_flash 
      000745                        176 to_eeprom:
      0086D4 90 A3 00         [ 4]  177 	call unlock_eeprom
      0086D7 10 2A            [ 2]  178 	jra do_programming
      00074A                        179 to_flash:
      0086D9 02 90 9F         [ 4]  180 	call unlock_flash
      0086DC                        181 do_programming:
      0086DC CD               [ 2]  182 	popw x 
      0086DD 86 8B 16         [ 4]  183 	call tib
      0086E0 01 72 A2 00      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0086E4 10 90 A3 00      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0086E8 01               [ 4]  186 	ret 
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
      00075A                        197 block_erase:
      0086E9 2A               [ 2]  198 	pushw x 
      0086EA E5 7B 03         [ 1]  199 	ld a,farptr 
      0086ED C7 00            [ 1]  200 	jrne erase_flash
      0086EF 0B 7B 04         [ 2]  201 	ldw x,farptr+1
      0086F2 C7 00 24         [ 2]  202 	cpw x,#app_space 
      0086F5 5B 04            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      0086F7 84 81 79         [ 4]  205 	call unlock_eeprom 
      0086F9 CD 16 90         [ 4]  206 	call tib 
      0086F9 72 06 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0086FD 15 35            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      000774                        210 erase_flash:
      0086FF 00 50 5B         [ 4]  211 	call unlock_flash 
      008702 35 FF 50         [ 4]  212 	call tib 
      008705 5C 35 AE 50      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00077E                        214 erase_exit: 
      008709 64               [ 2]  215 	popw x 
      00870A 35               [ 4]  216 	ret 
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
      000780                        232 write_byte:
      00870B 56 50            [ 2]  233 	pushw y
      000782                        234 	_vars VSIZE
      00870D 64 72            [ 2]    1     sub sp,#VSIZE 
      00870F 07 50            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      008711 5F FB            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      008713 81 CE 00 19      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008714 72 5D 00 18      [ 1]  240 	tnz farptr 
      008714 72 02            [ 1]  241 	jrne write_flash
      008716 50 5F 15 35      [ 2]  242     cpw y,#app_space 	 
      00871A 00 50            [ 1]  243     jruge write_flash
      00871C 5B 35 FF 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      008720 5C 35            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      008722 56 50 62 35      [ 2]  246 	cpw y,#OPTION_END 
      008726 AE 50            [ 1]  247 	jrugt write_exit
      008728 62 72            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      0007A6                        250 write_flash:
      00872A 03 50 5F         [ 4]  251 	call unlock_flash 
      00872D FB               [ 1]  252 1$:	sim 
      00872E 81 01            [ 1]  253 	ld a,(BTW,sp)
      00872F 92 A7 00 18      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      00872F 88 90 89 35 20   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008734 50               [ 1]  256     rim 
      008735 5B 35 DF 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008739 5C 4F            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      0007BC                        260 write_eeprom:
      00873B 90 5F 91         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      00873E A7 00 19 90      [ 2]  263 	cpw y,#OPTION_BASE
      008742 5C 91            [ 1]  264 	jrmi 1$
      008744 A7 00 19 90      [ 2]  265 	cpw y,#OPTION_END+1
      008748 5C 91            [ 1]  266 	jrpl 1$
      00874A A7 00            [ 1]  267 	cpl (OPT,sp)
      0007CD                        268 1$: 
      00874C 19 90            [ 1]  269     tnz (OPT,sp)
      00874E 5C 91            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      008750 A7 00 19 72      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      008754 05 50 5F FB      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0007D9                        274 2$: 
      008758 90 85            [ 1]  275     ld a,(BTW,sp)
      00875A 84 81 00 18      [ 4]  276     ldf ([farptr],x),a
      00875C 0D 02            [ 1]  277     tnz (OPT,sp)
      00875C 27 08            [ 1]  278     jreq 3$
      00875C 89               [ 1]  279     incw x
      00875D 90 89            [ 1]  280     ld a,(BTW,sp)
      00875F AE               [ 1]  281     cpl a
      008760 87 5C 1D 87      [ 4]  282     ldf ([farptr],x),a
      008764 2F CF 00 0E AE   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008769 16 90 90 AE 87   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0007F5                        285 write_exit:
      0007F5                        286 	_drop VSIZE 
      00876E 2F CD            [ 2]    1     addw sp,#VSIZE 
      008770 94 05            [ 2]  287 	popw y
      008772 90               [ 4]  288     ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                    300 ;	X 		after last byte written 
                                    301 ;   Y 		after last byte read 
                                    302 ;  farptr   point after block
                                    303 ;---------------------------------------------
      0007FA                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      0007FA                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      0007FA                        309 write_block::
      008773 85               [ 1]  310 	push a 
      0007FB                        311 	_vars VSIZE
      008774 85 81            [ 2]    1     sub sp,#VSIZE 
      008776 1F 01            [ 2]  312 	ldw (XSAVE,sp),x 
      008776 88 90            [ 2]  313 	ldw x,(BSIZE,sp) 
      008778 89 4B            [ 1]  314 	jreq 9$
      00877A 80 72            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      00877C 10 50            [ 1]  316 	ld a,(y)
      00877E 5B 72 11         [ 4]  317 	call write_byte 
      008781 50               [ 1]  318 	incw x 
      008782 5C 90            [ 1]  319 	incw y 
      008784 5F F6            [ 2]  320 	ldw (XSAVE,sp),x
      008786 91 A7            [ 2]  321 	ldw x,(BSIZE,sp)
      008788 00               [ 2]  322 	decw x
      008789 19 5C            [ 2]  323 	ldw (BSIZE,sp),x 
      00878B 90 5C            [ 1]  324 	jrne 1$
      000816                        325 9$:
      00878D 0A 01            [ 2]  326 	ldw x,(XSAVE,sp)
      00878F 26 F4 72         [ 4]  327 	call incr_farptr
      00081B                        328 	_drop VSIZE
      008792 05 50            [ 2]    1     addw sp,#VSIZE 
      008794 5F               [ 1]  329 	pop a 
      008795 FB               [ 4]  330 	ret 
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
      00081F                        347 write_nbytes:
      008796 5B 01            [ 2]  348 	pushw y
      008798 90               [ 1]  349 	push a 
      008799 85 84            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00879B 81               [ 1]  351 	clrw x 
      00879C                        352 1$:  
      00879C 90 F6            [ 1]  353 	ld a,(y)
      00879C 89 90            [ 1]  354 	incw y
      00879E 89 AE 87         [ 4]  355 	call write_byte 
      0087A1 9C               [ 1]  356 	incw x 
      0087A2 1D 87            [ 1]  357 	dec (1,sp)  
      0087A4 76 CF            [ 1]  358 	jrne 1$ 
      0087A6 00               [ 1]  359 9$: pop a 
      0087A7 0E AE            [ 2]  360 	popw y 
      0087A9 16               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      000835                        370 row_align:
      0087AA 90 90            [ 1]  371 	ld a,#0x7f 
      0087AC AE 87 76         [ 1]  372 	and a,farptr+2 
      0087AF CD 94            [ 1]  373 	jreq 1$ 
      0087B1 05 90 85         [ 2]  374 	ldw x,farptr+1 
      0087B4 85 81 80         [ 2]  375 	addw x,#BLOCK_SIZE 
      0087B6 24 04            [ 1]  376 	jrnc 0$
      0087B6 89 72 5D 00      [ 1]  377 	inc farptr 
      0087BA 19               [ 1]  378 0$: ld a,xl 
      0087BB 26 0D            [ 1]  379 	and a,#0x80
      0087BD CE               [ 1]  380 	ld xl,a
      0087BE 00 1A A3         [ 2]  381 	ldw farptr+1,x  	
      0087C1 B6               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      000850                        390 incr_farptr:
      0087C2 80 24 05 19      [ 2]  391 	addw x,farptr+1 
      0087C5 24 04            [ 1]  392 	jrnc 1$
      0087C5 CD 86 F9 20      [ 1]  393 	inc farptr 
      0087C9 03 00 19         [ 2]  394 1$:	ldw farptr+1,x  
      0087CA 81               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      00085E                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0087CA CD               [ 1]  406 	clrw x 
      0087CB 87 14 00 18      [ 5]  407 1$: ldf a,([farptr],x) 
      0087CD 26 06            [ 1]  408 	jrne 2$
      0087CD 85               [ 1]  409 	incw x 
      0087CE CD 16 90         [ 2]  410 	cpw x,#BLOCK_SIZE 
      0087D1 72 13            [ 1]  411 	jrult 1$ 
      0087D3 50               [ 4]  412 2$:	ret 
                                    413 
                                    414 
                                    415 
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
      00086C                         66 Uart1RxHandler: ; console receive char 
      0087D4 5F 72 17 50 5F   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0087D9 81 52 31         [ 1]   68 	ld a,UART1_DR 
      0087DA A1 03            [ 1]   69 	cp a,#CTRL_C 
      0087DA 89 C6            [ 1]   70 	jrne 2$
      0087DC 00 19 26         [ 4]   71 	call putc 
      0087DF 14 CE 00         [ 2]   72 	jp user_interrupted
      00087E                         73 2$:
      0087E2 1A A3            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0087E4 B6 80            [ 1]   75 	jrne 3$
      0087E6 24 0C CD         [ 2]   76 	jp cold_start 	
      0087E9 86               [ 1]   77 3$:	push a 
      0087EA F9 CD            [ 1]   78 	ld a,#rx1_queue 
      0087EC 16 90 72         [ 1]   79 	add a,rx1_tail 
      0087EF 17               [ 1]   80 	clrw x 
      0087F0 50               [ 1]   81 	ld xl,a 
      0087F1 5F               [ 1]   82 	pop a 
      0087F2 20               [ 1]   83 	ld (x),a 
      0087F3 0A 00 2F         [ 1]   84 	ld a,rx1_tail 
      0087F4 4C               [ 1]   85 	inc a 
      0087F4 CD 87            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      0087F6 14 CD 16         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0087F9 90               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      000899                         97 uart1_init:
      0087FA 72 13 50 5F      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      0087FE 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      0087FE 85 81 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008800 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0008A9                        103 uart1_set_baud: 
      008800 90               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008801 89 52            [ 1]  107 	ld a,#CLK_SWR_HSI
      008803 02 6B 01         [ 1]  108 	cp a,CLK_CMSR 
      008806 0F 02            [ 1]  109 	jreq 2$ 
      0008B1                        110 1$: ; 8 Mhz 	
      008808 90 CE 00 1A      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      00880C 72 5D 00 19      [ 1]  112 	mov UART1_BRR1,#0x4
      008810 26 14            [ 2]  113 	jra 3$
      0008BB                        114 2$: ; 16 Mhz 	
      008812 90 A3 B6 80      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008816 24 0E 90 A3      [ 1]  116 	mov UART1_BRR1,#0x08
      0008C3                        117 3$:
      00881A 40 00 25 57      [ 1]  118     clr UART1_DR
      00881E 90 A3 48 7F      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008822 22 51 20 16      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008826 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008826 CD 87 14 9B      [ 1]  122     clr rx1_head 
      00882A 7B 01 92 A7      [ 1]  123 	clr rx1_tail
      00882E 00               [ 1]  124 	pop a  
      00882F 19               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      0008DE                        133 putc:: ; console output always on UART1
      0008DE                        134 uart1_putc:: 
      008830 72 05 50 5F FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008835 9A 72 13         [ 1]  136 	ld UART1_DR,a 
      008838 50               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      0008E7                        148 qgetc::
      0008E7                        149 uart1_qgetc::
      008839 5F 20 39         [ 1]  150 	ld a,rx1_head 
      00883C C0 00 2F         [ 1]  151 	sub a,rx1_tail 
      00883C CD               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      0008EE                        161 getc:: ;console input
      0008EE                        162 uart1_getc::
      00883D 86 F9 90         [ 4]  163 	call uart1_qgetc
      008840 A3 48            [ 1]  164 	jreq uart1_getc 
      008842 00               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008843 2B 08            [ 1]  167 	ld a,#rx1_queue
      008845 90 A3 48         [ 1]  168 	add a,rx1_head 
      008848 80               [ 1]  169 	clrw x  
      008849 2A               [ 1]  170 	ld xl,a 
      00884A 02               [ 1]  171 	ld a,(x)
      00884B 03               [ 1]  172 	push a
      00884C 02 00 2E         [ 1]  173 	ld a,rx1_head 
      00884D 4C               [ 1]  174 	inc a 
      00884D 0D 02            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      00884F 27 08 72         [ 1]  176 	ld rx1_head,a 
      008852 1E               [ 1]  177 	pop a  
      008853 50               [ 2]  178 	popw x
      008854 5B               [ 4]  179 	ret 
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
      008855 72 1F 50 5C 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
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
      008859                        207 get_escape:
      008859 7B 01 92         [ 4]  208     call getc 
      00885C A7 00            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      00885E 19 0D            [ 1]  210     jreq 1$
      008860 02               [ 1]  211     clr a
      008861 27               [ 4]  212     ret
      008862 08 5C 7B         [ 4]  213 1$: call getc 
      008865 01 43 92         [ 2]  214     ldw x,#convert_table
      000924                        215 2$:
      008868 A7               [ 1]  216     cp a,(x)
      008869 00 19            [ 1]  217     jreq 4$
      00886B 72 05 50         [ 2]  218     addw x,#2
      00886E 5F               [ 1]  219     tnz (x)
      00886F FB 72            [ 1]  220     jrne 2$
      008871 0D               [ 1]  221     clr a
      008872 50               [ 4]  222     ret 
      008873 5F               [ 1]  223 4$: incw x 
      008874 FB               [ 1]  224     ld a,(x)
      008875 A1 84            [ 1]  225     cp a,#SUP
      008875 5B 02            [ 1]  226     jrne 5$
      008877 90               [ 1]  227     push a 
      008878 85 81 EE         [ 4]  228     call getc
      00887A 84               [ 1]  229     pop a 
      00093A                        230 5$:
      00887A 88               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00093B                        241 puts::
      00887B 52               [ 1]  242     ld a,(x)
      00887C 02 1F            [ 1]  243 	jreq 1$
      00887E 01 1E 06         [ 4]  244 	call putc 
      008881 27               [ 1]  245 	incw x 
      008882 13 1E            [ 2]  246 	jra puts 
      008884 01               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      000945                        258 bksp:
      008885 90 F6            [ 1]  259 	ld a,#BS 
      008887 CD 88 00         [ 4]  260 	call putc 
      00888A 5C 90            [ 1]  261 	ld a,#SPACE 
      00888C 5C 1F 01         [ 4]  262 	call putc 
      00888F 1E 06            [ 1]  263 	ld a,#BS 
      008891 5A 1F 06         [ 4]  264 	call putc 
      008894 26               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      000955                        274 delete_nchar:
      008895 ED               [ 1]  275 	push a 
      008896 0D 01            [ 1]  276 0$:	tnz (1,sp)
      008896 1E 01            [ 1]  277 	jreq 1$
      008898 CD 88 D0         [ 4]  278 	call bksp 
      00889B 5B 02            [ 1]  279 	dec (1,sp)
      00889D 84 81            [ 2]  280 	jra 0$
      00889F 84               [ 1]  281 1$:	pop a 
      00889F 90               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      000963                        290 send_escape:
      0088A0 89 88            [ 1]  291 	ld a,#ESC 
      0088A2 90 93 5F         [ 4]  292 	call putc 
      0088A5 A6 5B            [ 1]  293 	ld a,#'[
      0088A5 90 F6 90         [ 4]  294 	call putc 
      0088A8 5C               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      00096E                        311 send_parameter:
      0088A9 CD               [ 2]  312 	pushw x 
      0088AA 88               [ 1]  313 	clrw x 
      0088AB 00               [ 1]  314 	ld xl,a 
      0088AC 5C 0A            [ 1]  315 	ld a,#10 
      0088AE 01               [ 2]  316 	div x,a 
      0088AF 26               [ 1]  317 	ld xh,a 
      0088B0 F4               [ 1]  318 	ld a,xl
      0088B1 84               [ 1]  319     tnz a 
      0088B2 90 85            [ 1]  320     jreq 2$
      0088B4 81 09            [ 1]  321 	cp a,#9 
      0088B5 23 02            [ 2]  322 	jrule 1$
      0088B5 A6 7F            [ 1]  323 	ld a,#9
      00097F                        324 1$:
      0088B7 C4 00            [ 1]  325 	add a,#'0 
      0088B9 1B 27 13         [ 4]  326 	call putc
      0088BC CE               [ 1]  327 2$:	ld a,xh 
      0088BD 00 1A            [ 1]  328 	add a,#'0
      0088BF 1C 00 80         [ 4]  329 	call putc 
      0088C2 24               [ 2]  330 	popw x 
      0088C3 04               [ 4]  331 	ret 
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
      00098C                        344 move_left:
      0088C4 72               [ 1]  345 	push a 
      0088C5 5C 00 19         [ 4]  346 	call send_escape
      0088C8 9F               [ 1]  347     pop a
      0088C9 A4 80 97         [ 4]  348 	call send_parameter 
      0088CC CF 00            [ 1]  349 	ld a,#'D 
      0088CE 1A 81 DE         [ 4]  350 	call putc 
      0088D0 81               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00099A                        362 move_right:
      0088D0 72               [ 1]  363 	push a 
      0088D1 BB 00 1A         [ 4]  364 	call send_escape
      0088D4 24               [ 1]  365     pop a
      0088D5 04 72 5C         [ 4]  366 	call send_parameter 
      0088D8 00 19            [ 1]  367 	ld a,#'C 
      0088DA CF 00 1A         [ 4]  368 	call putc 
      0088DD 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      0088DE                        379 spaces::
      0088DE 5F 92            [ 1]  380 	ld a,#SPACE 
      0088E0 AF               [ 2]  381 1$:	tnzw x
      0088E1 00 19            [ 1]  382 	jreq 9$
      0088E3 26 06 5C         [ 4]  383 	call putc 
      0088E6 A3               [ 2]  384 	decw x
      0088E7 00 80            [ 2]  385 	jra 1$
      0009B3                        386 9$: 
      0088E9 25               [ 4]  387 	ret 
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
      0009B4                        405 insert_char: 
      0009B4                        406 	_vars VSIZE 
      0088EA F4 81            [ 2]    1     sub sp,#VSIZE 
      0088EC 6B 02            [ 1]  407     ld (KCHAR,sp),a 
      0088EC 72               [ 1]  408     ld a,xh 
      0088ED 0B 52            [ 1]  409 	ld (IPOS,sp),a
      0088EF 30               [ 1]  410     ld a,xl 
      0088F0 27 C6            [ 1]  411     ld (LLEN,sp),a  
      0088F2 52               [ 1]  412     ldw x,y
      0088F3 31               [ 1]  413     incw x 
      0088F4 A1 03            [ 1]  414     ld a,(LLEN,sp)
      0088F6 26 06            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0088F8 CD               [ 1]  416     inc a 
      0088F9 89 5E CC         [ 1]  417     ld acc8,a 
      0088FC 80 CC 00 0D      [ 1]  418     clr acc16
      0088FE CD 13 85         [ 4]  419     call move
      0088FE A1 18 26 03      [ 2]  420     ldw y,#tib 
      008902 CC 81            [ 1]  421     ld a,(IPOS,sp)
      008904 38 88 A6         [ 1]  422     ld acc8,a 
      008907 27 CB 00 30      [ 2]  423     addw y,acc16 
      00890B 5F 97            [ 1]  424     ld a,(KCHAR,sp)
      00890D 84 F7            [ 1]  425     ld (y),a
      00890F C6 00            [ 1]  426     incw y  
      008911 30 4C            [ 1]  427     ld a,(IPOS,sp)
      008913 A4 07 C7         [ 4]  428     call move_left
      008916 00 30 80         [ 2]  429     ldw x,#tib 
      008919 CD 09 3B         [ 4]  430     call puts 
      008919 72 1A            [ 1]  431     ld a,(LLEN,sp)
      00891B 50 02            [ 1]  432     sub a,(IPOS,sp) 
      00891D 72 1A 50         [ 4]  433     call move_left 
      0009F4                        434 	_drop VSIZE 
      008920 03 72            [ 2]    1     addw sp,#VSIZE 
      008922 1A               [ 4]  435 	ret 
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
      0009F7                        448 delete_under:
      0009F7                        449 	_vars VSIZE 
      008923 50 04            [ 2]    1     sub sp,#VSIZE 
      008925 72 14            [ 1]  450     ld (LLEN,sp),a 
      008927 50               [ 1]  451     ld a,xl 
      008928 C7 01            [ 1]  452     ld (CPOS,sp),a 
      008929 93               [ 1]  453     ldw x,y ; move destination
      008929 88 A6            [ 1]  454     incw y  ; move source 
      00892B E1 C1            [ 1]  455     ld a,(LLEN,sp)
      00892D 50 C3            [ 1]  456     sub a,(CPOS,sp)
      00892F 27               [ 1]  457     inc a ; move including zero at end.
      008930 0A 00 0E         [ 1]  458     ld acc8,a 
      008931 72 5F 00 0D      [ 1]  459     clr acc16 
      008931 35 05 52         [ 4]  460 	call move 
      008934 33 35 04 52      [ 2]  461     ldw y,#tib 
      008938 32 20            [ 1]  462     ld a,(CPOS,sp)
      00893A 08 00 0E         [ 1]  463     ld acc8,a 
      00893B 72 B9 00 0D      [ 2]  464     addw y,acc16 
      00893B 35               [ 1]  465     ldw x,y 
      00893C 0B 52 33         [ 4]  466     call puts 
      00893F 35 08            [ 1]  467     ld a,#SPACE  
      008941 52 32 DE         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      008943 7B 02            [ 1]  469     ld a,(LLEN,sp)
      008943 72 5F            [ 1]  470     sub a,(CPOS,sp)
      008945 52 31 35         [ 4]  471     call move_left 
      008948 2C 52            [ 1]  472     dec (LLEN,sp)
      000A2F                        473 	_drop VSIZE 
      00894A 35 72            [ 2]    1     addw sp,#VSIZE 
      00894C 10               [ 4]  474 	ret 
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
      000A32                        486 delete_line:
      00894D 52 35 72         [ 4]  487     call send_escape
      008950 0D 52            [ 1]  488 	ld a,#'2
      008952 30 FB 72         [ 4]  489 	call putc 
      008955 5F 00            [ 1]  490 	ld a,#'K 
      008957 2F 72 5F         [ 4]  491 	call putc 
      00895A 00               [ 4]  492 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                           000004   523 	VSIZE=4 
      000A40                        524 readln::
      00895B 30 84            [ 2]  525 	pushw y 
      000A42                        526 	_vars VSIZE 
      00895D 81 04            [ 2]    1     sub sp,#VSIZE 
      00895E 5F               [ 1]  527 	clrw x 
      00895E 1F 02            [ 2]  528 	ldw (LL,sp),x 
      00895E 72 0F            [ 2]  529 	ldw (CPOS,sp),x 
      008960 52 30            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008962 FB C7 52 31      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000A4F                        532 readln_loop:
      008966 81 08 EE         [ 4]  533 	call getc
      008967 6B 01            [ 1]  534 	ld (RXCHAR,sp),a
      008967 A1 1B            [ 1]  535     cp a,#ESC 
      008967 C6 00            [ 1]  536     jrne 0$
      008969 2F C0 00         [ 4]  537     call get_escape 
      00896C 30 81            [ 1]  538     ld (RXCHAR,sp),a 
      00896E A1 0D            [ 1]  539 0$:	cp a,#CR
      00896E 26 03            [ 1]  540 	jrne 1$
      00896E CD 89 67         [ 2]  541 	jp readln_quit
      008971 27 FB            [ 1]  542 1$:	cp a,#LF 
      008973 89 A6            [ 1]  543 	jrne 2$ 
      008975 27 CB 00         [ 2]  544 	jp readln_quit
      000A6B                        545 2$:
      008978 2F 5F            [ 1]  546 	cp a,#BS
      00897A 97 F6            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      00897C 88 C6            [ 1]  549     tnz (CPOS,sp)
      00897E 00 2F            [ 1]  550     jreq readln_loop 
      008980 4C A4            [ 1]  551     ld a,#1 
      008982 07 C7 00         [ 4]  552     call move_left
      008985 2F 84            [ 1]  553     dec (CPOS,sp)
      008987 85 81            [ 2]  554     decw y 
      008989 43 81            [ 1]  555     ld a,(CPOS,sp) 
      00898B 44 80 48         [ 2]  556     jp 12$
      000A81                        557 3$:
      00898E 82 46            [ 1]  558 	cp a,#CTRL_D
      008990 83 33            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      008992 84 00 00         [ 4]  561 	call delete_line 
      008995 7B 03            [ 1]  562     ld a,(CPOS,sp)
      008995 CD               [ 1]  563     inc a 
      008996 89 6E A1         [ 4]  564     call move_left 
      008999 5B 27            [ 1]  565 	ld a,#'> 
      00899B 02 4F 81         [ 4]  566 	call putc 
      00899E CD 89 6E AE      [ 2]  567 	ldw y,#tib
      0089A2 89 89            [ 1]  568 	clr (y)
      0089A4 0F 02            [ 1]  569 	clr (LL,sp)
      0089A4 F1 27            [ 1]  570 	clr (CPOS,sp)
      0089A6 08 1C            [ 2]  571 	jra readln_loop
      000A9F                        572 4$:
      0089A8 00 02            [ 1]  573 	cp a,#CTRL_R 
      0089AA 7D 26            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      0089AC F7 4F            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0089AE 81 5C            [ 1]  577 	jrne readln_loop
      0089B0 F6 A1 84 26      [ 2]  578 	ldw y,#tib 
      0089B4 05               [ 1]  579 	ldw x,y
      0089B5 88 CD 89         [ 4]  580 	call strlen
      0089B8 6E               [ 1]  581 	tnz a  
      0089B9 84 9D            [ 1]  582 	jreq readln_loop
      0089BA 6B 02            [ 1]  583 	ld (LL,sp),a 
      0089BA 81 03            [ 1]  584     ld (CPOS,sp),a
      0089BB 93               [ 1]  585 	ldw x,y  
      0089BB F6 27 06         [ 4]  586 	call puts
      0089BE CD 89            [ 1]  587 	clr (LL_HB,sp)
      0089C0 5E 5C 20         [ 2]  588 	addw y,(LL_HB,sp)
      0089C3 F7 81            [ 2]  589 	jra readln_loop 
      0089C5                        590 5$:
      0089C5 A6 08            [ 1]  591 	cp a,#CTRL_E 
      0089C7 CD 89            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      0089C9 5E A6 20         [ 2]  594 	ldw x,#tib 
      0089CC CD 89 5E         [ 4]  595 	call atoi24
      0089CF A6 08 CD         [ 2]  596 	ldw x,acc16
      0089D2 89 5E 81         [ 4]  597 	call search_lineno
      0089D5 5D               [ 2]  598 	tnzw x 
      0089D5 88 0D            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      0089D7 01 27 07         [ 2]  603 	jp readln_quit  
      000AD7                        604 51$:
      0089DA CD 89 C5         [ 2]  605 	ldw basicptr,x
      0089DD 0A 01            [ 1]  606 	ld a,(2,x)
      0089DF 20 F5 84         [ 1]  607 	ld count,a 
      0089E2 81 AE 16 90      [ 2]  608 	ldw y,#tib 
      0089E3 CD 11 75         [ 4]  609 	call decompile 
      0089E3 A6 1B            [ 1]  610 	clr (LL_HB,sp)
      0089E5 CD 89            [ 1]  611 	ld a,#CR 
      0089E7 5E A6 5B         [ 4]  612 	call putc 
      0089EA CD 89            [ 1]  613 	ld a,#'>
      0089EC 5E 81 DE         [ 4]  614 	call putc
      0089EE AE 16 90         [ 2]  615     ldw x,#tib  
      0089EE 89 5F 97         [ 4]  616 	call strlen 
      0089F1 A6 0A            [ 1]  617 	ld (LL,sp),a 
      0089F3 62 95 9F         [ 4]  618 	call puts 
      0089F6 4D 27            [ 1]  619 	ldw y,x
      0089F8 0B A1            [ 1]  620     ld a,(LL,sp)
      0089FA 09 23            [ 1]  621     ld (CPOS,sp),a  
      0089FC 02 A6 09         [ 2]  622 	jp readln_loop
      0089FF                        623 6$:
      0089FF AB 30            [ 1]  624 	cp a,#ARROW_RIGHT
      008A01 CD 89            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A03 5E 9E            [ 1]  627 	ld a,(CPOS,sp)
      008A05 AB 30            [ 1]  628     cp a,(LL,sp)
      008A07 CD 89            [ 1]  629     jrmi 61$
      008A09 5E 85 81         [ 2]  630     jp readln_loop 
      008A0C                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008A0C 88 CD            [ 1]  632     ld a,#1 
      008A0E 89 E3 84         [ 4]  633 	call move_right 
      008A11 CD 89            [ 1]  634 	inc (CPOS,sp)
      008A13 EE A6            [ 1]  635     incw y 
      008A15 44 CD 89         [ 2]  636     jp readln_loop 
      008A18 5E 81            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A1A 26 13            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A1A 88 CD            [ 1]  640 	tnz (CPOS,sp)
      008A1C 89 E3            [ 1]  641 	jrne 71$
      008A1E 84 CD 89         [ 2]  642 	jp readln_loop
      000B2A                        643 71$:
      008A21 EE A6            [ 1]  644     ld a,#1 
      008A23 43 CD 89         [ 4]  645 	call move_left 
      008A26 5E 81            [ 1]  646 	dec (CPOS,sp)
      008A28 90 5A            [ 2]  647     decw y 
      008A28 A6 20 5D         [ 2]  648 	jp readln_loop 
      008A2B 27 06            [ 1]  649 8$: cp a,#HOME  
      008A2D CD 89            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A2F 5E 5A            [ 1]  652     ld a,(CPOS,sp)
      008A31 20 F7 8C         [ 4]  653     call move_left 
      008A33 0F 03            [ 1]  654 	clr (CPOS,sp)
      008A33 81 AE 16 90      [ 2]  655     ldw y,#tib 
      008A34 CC 0A 4F         [ 2]  656 	jp readln_loop  
      008A34 52 03            [ 1]  657 9$: cp a,#KEY_END  
      008A36 6B 02            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A38 9E 6B            [ 1]  660 	ld a,(CPOS,sp)
      008A3A 01 9F            [ 1]  661 	cp a,(LL,sp)
      008A3C 6B 03            [ 1]  662 	jrne 91$
      008A3E 93 5C 7B         [ 2]  663 	jp readln_loop 
      000B55                        664 91$:
      008A41 03 10            [ 1]  665 	ld a,(LL,sp)
      008A43 01 4C            [ 1]  666 	sub a,(CPOS,sp)
      008A45 C7 00 0F         [ 4]  667 	call move_right 
      008A48 72 5F            [ 1]  668 	ld a,(LL,sp)
      008A4A 00 0E            [ 1]  669 	ld (CPOS,sp),a
      008A4C CD 94 05 90      [ 2]  670     ldw y,#tib
      008A50 AE 16 90 7B      [ 1]  671     clr acc16 
      008A54 01 C7 00         [ 1]  672     ld acc8,a 
      008A57 0F 72 B9 00      [ 2]  673     addw y,acc16  
      008A5B 0E 7B 02         [ 2]  674 	jp readln_loop 
      008A5E 90 F7            [ 1]  675 10$: cp a,#CTRL_O
      008A60 90 5C            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008A62 7B 01            [ 1]  678 	cpl (OVRWR,sp)
      008A64 CD 8A 0C         [ 4]  679 	call beep_1khz
      008A67 AE 16 90         [ 2]  680 	jp readln_loop 
      008A6A CD 89            [ 1]  681 11$: cp a,#SUP 
      008A6C BB 7B            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008A6E 03 10            [ 1]  684     ld a,(CPOS,sp)
      008A70 01 CD            [ 1]  685     cp a,(LL,sp)
      008A72 8A 0C            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      000B88                        687 12$:
      008A74 5B               [ 1]  688     ld xl,a    ; cursor position 
      008A75 03 81            [ 1]  689     ld a,(LL,sp)  ; line length
      008A77 CD 09 F7         [ 4]  690     call delete_under
      008A77 52 02            [ 1]  691     dec (LLEN,sp)
      000B90                        692 13$:
      008A79 6B 02 9F         [ 2]  693     jp readln_loop 
      000B93                        694 final_test:
      008A7C 6B 01            [ 1]  695 	cp a,#SPACE
      008A7E 93 90            [ 1]  696 	jrpl accept_char
      008A80 5C 7B 02         [ 2]  697 	jp readln_loop
      000B9A                        698 accept_char:
      008A83 10 01            [ 1]  699 	ld a,#TIB_SIZE-1
      008A85 4C C7            [ 1]  700 	cp a, (LL,sp)
      008A87 00 0F            [ 1]  701 	jrpl 1$
      008A89 72 5F 00         [ 2]  702 	jp readln_loop
      008A8C 0E CD            [ 1]  703 1$:	tnz (OVRWR,sp)
      008A8E 94 05            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008A90 90 AE            [ 1]  706     ld a,(CPOS,sp)
      008A92 16 90            [ 1]  707     cp a,(LL,sp)
      008A94 7B 01            [ 1]  708     jreq overwrite
      008A96 C7 00            [ 1]  709     ld a,(LL,sp)
      008A98 0F               [ 1]  710     ld xl,a 
      008A99 72 B9            [ 1]  711     ld a,(CPOS,sp)
      008A9B 00               [ 1]  712     ld xh,a
      008A9C 0E 93            [ 1]  713     ld a,(RXCHAR,sp)
      008A9E CD 89 BB         [ 4]  714     call insert_char
      008AA1 A6 20            [ 1]  715     inc (LLEN,sp)
      008AA3 CD 89            [ 1]  716     inc (CPOS,sp)	
      008AA5 5E 7B 02         [ 2]  717     jp readln_loop 
      000BBF                        718 overwrite:
      008AA8 10 01            [ 1]  719 	ld a,(RXCHAR,sp)
      008AAA CD 8A            [ 1]  720 	ld (y),a
      008AAC 0C 0A            [ 1]  721     incw y
      008AAE 02 5B 02         [ 4]  722     call putc 
      008AB1 81 03            [ 1]  723 	ld a,(CPOS,sp)
      008AB2 11 02            [ 1]  724 	cp a,(LL,sp)
      008AB2 CD 89            [ 1]  725 	jrmi 1$
      008AB4 E3 A6            [ 1]  726 	clr (y)
      008AB6 32 CD            [ 1]  727 	inc (LL,sp)
      008AB8 89 5E            [ 1]  728     inc (CPOS,sp)
      008ABA A6 4B CD         [ 2]  729 	jp readln_loop 
      000BD7                        730 1$:	
      008ABD 89 5E            [ 1]  731 	inc (CPOS,sp)
      008ABF 81 0A 4F         [ 2]  732 	jp readln_loop 
      008AC0                        733 readln_quit:
      008AC0 90 89 52 04      [ 2]  734 	ldw y,#tib
      008AC4 5F 1F            [ 1]  735     clr (LL_HB,sp) 
      008AC6 02 1F 03         [ 2]  736     addw y,(LL_HB,sp)
      008AC9 03 04            [ 1]  737     clr (y)
      008ACB 90 AE            [ 1]  738 	ld a,(LL,sp)
      008ACD 16 90 03         [ 1]  739 	ld count,a 
      008ACF A6 0D            [ 1]  740 	ld a,#CR
      008ACF CD 89 6E         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      000BF1                        742 	_drop VSIZE 
      008AD2 6B 01            [ 2]    1     addw sp,#VSIZE 
      008AD4 A1 1B            [ 2]  743 	popw y 
      008AD6 26               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000BF6                        752 print_hex::
      008AD7 05               [ 1]  753 	push a 
      008AD8 CD               [ 1]  754 	swap a 
      008AD9 89 95 6B         [ 4]  755 	call to_hex_char 
      008ADC 01 A1 0D         [ 4]  756 	call putc 
      008ADF 26 03            [ 1]  757     ld a,(1,sp) 
      008AE1 CC 8C 5C         [ 4]  758 	call to_hex_char
      008AE4 A1 0A 26         [ 4]  759 	call putc
      008AE7 03 CC            [ 1]  760 	ld a,#SPACE 
      008AE9 8C 5C DE         [ 4]  761 	call putc 
      008AEB 84               [ 1]  762 	pop a 
      008AEB A1               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      000C0D                        772 to_hex_char::
      008AEC 08 26            [ 1]  773 	and a,#15 
      008AEE 12 0D            [ 1]  774 	cp a,#9 
      008AF0 03 27            [ 2]  775 	jrule 1$ 
      008AF2 DC A6            [ 1]  776 	add a,#7
      008AF4 01 CD            [ 1]  777 1$: add a,#'0 
      008AF6 8A               [ 4]  778 	ret 
                                    779 
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
      000C18                         51 search_lineno::
      000C18                         52 	_vars VSIZE
      008AF7 0C 0A            [ 2]    1     sub sp,#VSIZE 
      008AF9 03 90            [ 1]   53 	clr (LL,sp)
      008AFB 5A 7B 03 CC      [ 2]   54 	ldw y,txtbgn
      008AFF 8C               [ 1]   55 	tnz a 
      008B00 08 04            [ 1]   56 	jreq search_ln_loop
      008B01 90 CE 00 04      [ 2]   57 	ldw y,basicptr 
      000C27                         58 search_ln_loop:
      008B01 A1 04 26 1A      [ 2]   59 	cpw y,txtend 
      008B05 CD 8A            [ 1]   60 	jrpl 8$
      008B07 B2 7B            [ 1]   61 	cpw x,(y)
      008B09 03 4C            [ 1]   62 	jreq 9$
      008B0B CD 8A            [ 1]   63 	jrmi 8$ 
      008B0D 0C A6 3E         [ 1]   64 	ld a,(2,y)
      008B10 CD 89            [ 1]   65 	ld (LB,sp),a 
      008B12 5E 90 AE         [ 2]   66 	addw y,(LL,sp)
      008B15 16 90            [ 2]   67 	jra search_ln_loop 
      000C3D                         68 8$: 
      008B17 90               [ 1]   69 	clrw x 	
      008B18 7F               [ 1]   70 	exgw x,y 
      000C3F                         71 9$: _drop VSIZE
      008B19 0F 02            [ 2]    1     addw sp,#VSIZE 
      008B1B 0F               [ 1]   72 	exgw x,y   
      008B1C 03               [ 4]   73 	ret 
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
      000C43                         83 del_line: 
      000C43                         84 	_vars VSIZE 
      008B1D 20 B0            [ 2]    1     sub sp,#VSIZE 
      008B1F E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008B1F A1 12            [ 1]   86 	ld (LLEN+1,sp),a 
      008B21 26 1E            [ 1]   87 	clr (LLEN,sp)
      008B23 0D 02            [ 1]   88 	ldw y,x  
      008B25 26 A8 90         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B28 AE 16            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B2A 90 93 CD 93      [ 2]   91 	ldw y,txtend 
      008B2E D9 4D 27         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B31 9D 6B 02 6B      [ 2]   93 	ldw acc16,y 
      008B35 03 93            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B37 CD 89 BB         [ 4]   95 	call move
      008B3A 0F 01 72 F9      [ 2]   96 	ldw y,txtend 
      008B3E 01 20 8E         [ 2]   97 	subw y,(LLEN,sp)
      008B41 90 CF 00 1D      [ 2]   98 	ldw txtend,y  
      000C6D                         99 	_drop VSIZE     
      008B41 A1 05            [ 2]    1     addw sp,#VSIZE 
      008B43 26               [ 4]  100 	ret 
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
      000C70                        115 create_gap:
      000C70                        116 	_vars VSIZE
      008B44 41 AE            [ 2]    1     sub sp,#VSIZE 
      008B46 16 90            [ 2]  117 	ldw (SRC,sp),x 
      008B48 CD 99            [ 2]  118 	ldw (LEN,sp),y 
      008B4A 07 CE 00 0E      [ 2]  119 	ldw acc16,y 
      008B4E CD 8C            [ 1]  120 	ldw y,x ; SRC
      008B50 98 5D 26 03      [ 2]  121 	addw x,acc16  
      008B54 CC 8C            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B56 5C 00 1D         [ 2]  124 	ldw x,txtend 
      008B57 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008B57 CF 00 05         [ 2]  126 	ldw acc16,x ; size to move
      008B5A E6 02            [ 2]  127 	ldw x,(DEST,sp) 
      008B5C C7 00 04         [ 4]  128 	call move
      008B5F 90 AE 16         [ 2]  129 	ldw x,txtend
      008B62 90 CD 91         [ 2]  130 	addw x,(LEN,sp)
      008B65 F5 0F 01         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      000C99                        132 9$:	_drop VSIZE 
      008B68 A6 0D            [ 2]    1     addw sp,#VSIZE 
      008B6A CD               [ 4]  133 	ret 
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
      000C9C                        150 insert_line:
      000C9C                        151 	_vars VSIZE 
      008B6B 89 5E            [ 2]    1     sub sp,#VSIZE 
      008B6D A6 3E CD         [ 2]  152 	ldw x,txtend  
      008B70 89 5E AE         [ 2]  153 	cpw x,txtbgn 
      008B73 16 90            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008B75 CD 93 D9         [ 2]  156 	ldw x,#2 
      008B78 6B 02 CD 89      [ 4]  157 	ld a,([ptr16],x)
      008B7C BB 90            [ 1]  158 	cp a,#3
      008B7E 93 7B            [ 1]  159 	jreq insert_ln_exit
      008B80 02               [ 1]  160 	clrw x 
      008B81 6B               [ 1]  161 	ld xl,a
      008B82 03 CC            [ 2]  162 	ldw (LLEN,sp),x 
      008B84 8A CF 1B         [ 2]  163 	ldw x,txtbgn
      008B86 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008B86 A1 81 26         [ 2]  165 	ldw x,txtend 
      008B89 15 7B            [ 2]  166 	jra 4$
      008B8B 03 11 02 2B      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008B8F 03 CC            [ 2]  169 	ldw (LINENO,sp),x 
      008B91 8A CF 02         [ 2]  170 	ldw x,#2 
      008B93 72 D6 00 19      [ 4]  171 	ld a,([ptr16],x)
      008B93 A6               [ 1]  172 	ld xl,a
                                    173 ; line length
      008B94 01 CD            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008B96 8A 1A            [ 2]  176 	ldw x,(LINENO,sp)
      008B98 0C               [ 1]  177 	clr a 
      008B99 03 90 5C         [ 4]  178 	call search_lineno 
      008B9C CC               [ 2]  179 	tnzw x 
      008B9D 8A CF            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008B9F A1 80            [ 2]  183 	ldw (DEST,sp),y 
      008BA1 26 13            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BA3 0D 03            [ 2]  187 2$: ldw (DEST,sp),x 
      008BA5 26 03 CC         [ 4]  188 	call del_line
      000CE1                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BA8 8A CF            [ 1]  192 	ld a,#3
      008BAA 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008BAA A6 01            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BAC CD 8A            [ 2]  197 	ldw x,(DEST,sp)
      008BAE 0C 0A 03         [ 2]  198 	cpw x,txtend 
      008BB1 90 5A            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BB3 CC 8A            [ 2]  202 	ldw x,(DEST,sp)
      008BB5 CF A1            [ 2]  203 	ldw y,(LLEN,sp)
      008BB7 82 26 0E         [ 4]  204 	call create_gap
      008BBA 7B 03            [ 2]  205 	jra 5$
      000CF7                        206 4$: 
      008BBC CD 8A 0C         [ 2]  207 	addw x,(LLEN,sp)
      008BBF 0F 03 90         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008BC2 AE 16            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008BC4 90 CC 8A         [ 2]  211 	ldw acc16,x 
      008BC7 CF A1 83 26      [ 2]  212 	ldw y,#pad ;SRC 
      008BCB 26 7B            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008BCD 03 11 02         [ 4]  214 	call move 
      000D0B                        215 insert_ln_exit:	
      000D0B                        216 	_drop VSIZE
      008BD0 26 03            [ 2]    1     addw sp,#VSIZE 
      008BD2 CC               [ 4]  217 	ret
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
      000D0E                        233 parse_quote: 
      000D0E                        234 	_vars VSIZE 
      008BD3 8A CF            [ 2]    1     sub sp,#VSIZE 
      008BD5 4F               [ 1]  235 	clr a
      008BD5 7B 02            [ 1]  236 1$:	ld (PREV,sp),a 
      000D13                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      008BD7 10 03 CD         [ 4]  238 	ld a,([in.w],y)
      008BDA 8A 1A            [ 1]  239 	jreq 6$
      008BDC 7B 02 6B 03      [ 1]  240 	inc in 
      008BE0 90 AE            [ 1]  241 	ld (CURR,sp),a 
      008BE2 16 90            [ 1]  242 	ld a,#'\
      008BE4 72 5F            [ 1]  243 	cp a, (PREV,sp)
      008BE6 00 0E            [ 1]  244 	jrne 3$
      008BE8 C7 00            [ 1]  245 	clr (PREV,sp)
      008BEA 0F 72            [ 1]  246 	ld a,(CURR,sp)
      008BEC B9 00            [ 4]  247 	callr convert_escape
      008BEE 0E               [ 1]  248 	ld (x),a 
      008BEF CC               [ 1]  249 	incw x 
      008BF0 8A CF            [ 2]  250 	jra 2$
      000D2E                        251 3$:
      008BF2 A1 0F            [ 1]  252 	ld a,(CURR,sp)
      008BF4 26 08            [ 1]  253 	cp a,#'\'
      008BF6 03 04            [ 1]  254 	jreq 1$
      008BF8 CD A6            [ 1]  255 	cp a,#'"
      008BFA 26 CC            [ 1]  256 	jreq 6$ 
      008BFC 8A               [ 1]  257 	ld (x),a 
      008BFD CF               [ 1]  258 	incw x 
      008BFE A1 84            [ 2]  259 	jra 2$
      000D3C                        260 6$:
      008C00 26               [ 1]  261 	clr (x)
      008C01 11               [ 1]  262 	incw x 
      008C02 7B 03            [ 1]  263 	ldw y,x 
      008C04 11               [ 1]  264 	clrw x 
      008C05 02 2A            [ 1]  265 	ld a,#TK_QSTR  
      000D43                        266 	_drop VSIZE
      008C07 08 02            [ 2]    1     addw sp,#VSIZE 
      008C08 81               [ 4]  267 	ret 
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
      000D46                        278 convert_escape:
      008C08 97               [ 2]  279 	pushw x 
      008C09 7B 02 CD         [ 2]  280 	ldw x,#escaped 
      008C0C 8A               [ 1]  281 1$:	cp a,(x)
      008C0D 77 0A            [ 1]  282 	jreq 2$
      008C0F 02               [ 1]  283 	tnz (x)
      008C10 27 09            [ 1]  284 	jreq 3$
      008C10 CC               [ 1]  285 	incw x 
      008C11 8A CF            [ 2]  286 	jra 1$
      008C13 1D 0D 5B         [ 2]  287 2$: subw x,#escaped 
      008C13 A1               [ 1]  288 	ld a,xl 
      008C14 20 2A            [ 1]  289 	add a,#7
      008C16 03               [ 2]  290 3$:	popw x 
      008C17 CC               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    292 
      008C18 8A CF 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008C1A                        310 parse_integer: ; { -- n }
      008C1A A6               [ 2]  311 	pushw x 	
      008C1B 4F 11            [ 1]  312 	push #0 ; TCHAR
      008C1D 02 2A            [ 1]  313 	push #10 ; BASE=10
      008C1F 03 CC            [ 1]  314 	cp a,#'$
      008C21 8A CF            [ 1]  315 	jrne 2$ 
      000D6C                        316     _drop #1
      008C23 0D 04            [ 2]    1     addw sp,##1 
      008C25 26 18            [ 1]  317 	push #16  ; BASE=16
      008C27 7B               [ 1]  318 2$:	ld (x),a 
      008C28 03               [ 1]  319 	incw x 
      008C29 11 02 27         [ 4]  320 	ld a,([in.w],y)
      008C2C 12 7B 02 97      [ 1]  321 	inc in 
      008C30 7B 03 95         [ 4]  322 	call to_upper 
      008C33 7B 01            [ 1]  323 	ld (TCHAR,sp),a 
      008C35 CD 8A 34         [ 4]  324 	call is_digit 
      008C38 0C 02            [ 1]  325 	jrc 2$
      008C3A 0C 03            [ 1]  326 	ld a,#16 
      008C3C CC 8A            [ 1]  327 	cp a,(BASE,sp)
      008C3E CF 0A            [ 1]  328 	jrne 3$ 
      008C3F 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008C3F 7B 01            [ 1]  330 	cp a,#'A 
      008C41 90 F7            [ 1]  331 	jrmi 3$ 
      008C43 90 5C            [ 1]  332 	cp a,#'G 
      008C45 CD 89            [ 1]  333 	jrmi 2$ 
      008C47 5E 7B 03 11      [ 1]  334 3$: dec in 	
      008C4B 02               [ 1]  335     clr (x)
      008C4C 2B 09            [ 2]  336 	ldw x,(XSAVE,sp)
      008C4E 90 7F 0C         [ 4]  337 	call atoi24
      008C51 02 0C            [ 2]  338 	ldw y,(XSAVE,sp)
      008C53 03 CC 8A         [ 1]  339 	ld a,acc24 
      008C56 CF F7            [ 1]  340 	ld (y),a 
      008C57 90 5C            [ 1]  341 	incw y  
      008C57 0C 03 CC         [ 2]  342 	ldw x,acc16 
      008C5A 8A CF            [ 2]  343 	ldw (y),x 
      008C5C 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008C5C 90 AE            [ 1]  345 	ld a,#TK_INTGR
      000DB1                        346 	_drop VSIZE  
      008C5E 16 90            [ 2]    1     addw sp,#VSIZE 
      008C60 0F               [ 4]  347 	ret 	
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
      000DB4                        364 parse_binary: ; { -- n }
      008C61 01 72            [ 1]  365 	push #0
      008C63 F9 01            [ 1]  366 	push #0
      008C65 90 7F            [ 1]  367 	push #0
      000DBA                        368 2$:	
      008C67 7B 02 C7         [ 4]  369 	ld a,([in.w],y)
      008C6A 00 04 A6 0D      [ 1]  370 	inc in 
      008C6E CD 89            [ 1]  371 	cp a,#'0 
      008C70 5E 5B            [ 1]  372 	jreq 3$
      008C72 04 90            [ 1]  373 	cp a,#'1 
      008C74 85 81            [ 1]  374 	jreq 3$ 
      008C76 20 0B            [ 2]  375 	jra bin_exit 
      008C76 88 4E            [ 1]  376 3$: sub a,#'0 
      008C78 CD               [ 1]  377 	rrc a
      008C79 8C 8D            [ 1]  378 	rlc (BINARY+2,sp) 
      008C7B CD 89            [ 1]  379 	rlc (BINARY+1,sp)
      008C7D 5E 7B            [ 1]  380 	rlc (BINARY,sp) 
      008C7F 01 CD            [ 2]  381 	jra 2$  
      000DD6                        382 bin_exit:
      008C81 8C 8D CD 89      [ 1]  383 	dec in 
      008C85 5E A6            [ 1]  384 	ldw y,x
      008C87 20 CD            [ 1]  385 	ld a,(BINARY,sp)
      008C89 89 5E            [ 1]  386 	ld (y),a 
      008C8B 84 81            [ 1]  387 	incw y 
      008C8D 1E 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008C8D A4 0F            [ 2]  389 	ldw (y),x 
      008C8F A1 09 23 02      [ 2]  390 	addw y,#2  
      008C93 AB 07            [ 1]  391 	ld a,#TK_INTGR 	
      000DEC                        392 	_drop VSIZE 
      008C95 AB 30            [ 2]    1     addw sp,#VSIZE 
      008C97 81               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      008C98                        402 is_alpha::
      008C98 52 02            [ 1]  403 	cp a,#'A 
      008C9A 0F               [ 1]  404 	ccf 
      008C9B 01 90            [ 1]  405 	jrnc 9$ 
      008C9D CE 00            [ 1]  406 	cp a,#'Z+1 
      008C9F 1C 4D            [ 1]  407 	jrc 9$ 
      008CA1 27 04            [ 1]  408 	cp a,#'a 
      008CA3 90               [ 1]  409 	ccf 
      008CA4 CE 00            [ 1]  410 	jrnc 9$
      008CA6 05 7B            [ 1]  411 	cp a,#'z+1
      008CA7 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E00                        421 is_digit::
      008CA7 90 C3            [ 1]  422 	cp a,#'0
      008CA9 00 1E            [ 1]  423 	jrc 1$
      008CAB 2A 10            [ 1]  424     cp a,#'9+1
      008CAD 90               [ 1]  425 	ccf 
      008CAE F3               [ 1]  426 1$:	ccf 
      008CAF 27               [ 4]  427     ret
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
      000E09                        438 is_alnum::
      008CB0 0E 2B 0A         [ 4]  439 	call is_digit
      008CB3 90 E6            [ 1]  440 	jrc 1$ 
      008CB5 02 6B 02         [ 4]  441 	call is_alpha
      008CB8 72               [ 4]  442 1$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      000E12                        453 is_symbol_char: 
      008CB9 F9 01            [ 1]  454 	cp a,#'_ 
      008CBB 20 EA            [ 1]  455 	jrne 1$
      008CBD 99               [ 1]  456 	scf 
      008CBD 5F 51            [ 2]  457 	jra 9$ 
      008CBF 5B 02 51         [ 4]  458 1$:	call is_alnum 
      008CC2 81               [ 4]  459 9$: ret 
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
      008CC3                        473 parse_symbol:
      008CC3 52               [ 1]  474 	incw x ; keep space for TK_ID 
      000E1E                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008CC4 04 E6 02         [ 4]  477 	call to_upper  
      008CC7 6B               [ 1]  478 	ld (x), a 
      008CC8 02               [ 1]  479 	incw x
      008CC9 0F 01 90         [ 4]  480 	ld a,([in.w],y)
      008CCC 93 72 F9 01      [ 1]  481 	inc in 
      008CD0 17 03 90         [ 4]  482 	call is_symbol_char 
      008CD3 CE 00            [ 1]  483 	jrc symb_loop 
      008CD5 1E               [ 1]  484 	clr (x)
      008CD6 72 F2 03 90      [ 1]  485 	dec in  
      008CDA CF               [ 4]  486 	ret 
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
      000E35                        502 parse_keyword: 
      008CDB 00               [ 2]  503 	pushw x ; preserve *symbol 
      008CDC 0E 16 03         [ 4]  504 	call parse_symbol
      008CDF CD 94            [ 2]  505 	ldw x,(XFIRST,sp) 
      008CE1 05 90            [ 1]  506 	ld a,(2,x)
      008CE3 CE 00            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008CE5 1E 72            [ 1]  509 	ld a,(1,x) 
      008CE7 F2 01            [ 1]  510 	sub a,#'A 
      008CE9 90 CF 00         [ 2]  511 	ldw x,#3 
      008CEC 1E               [ 4]  512 	mul x,a 
      008CED 5B 04 81         [ 2]  513 	addw x,#vars 
      008CF0 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008CF0 52 06            [ 2]  515 	jra 4$ 
      000E4E                        516 2$: ; check for keyword, otherwise syntax error.
      000E4E                        517 	_ldx_dict kword_dict ; dictionary entry point
      008CF2 1F 03 17         [ 2]    1     ldw x,#kword_dict+2
      008CF5 05 90            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008CF7 CF 00            [ 1]  519 	incw y 
      008CF9 0E 90 93         [ 4]  520 	call search_dict
      008CFC 72               [ 1]  521 	tnz a
      008CFD BB 00            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008CFF 0E 1F            [ 2]  525 	ldw y,(XFIRST,sp)
      008D01 01 CE            [ 1]  526 	ld a,#TK_LABEL 
      008D03 00 1E            [ 1]  527 	ld (y),a 
      008D05 72 F0            [ 1]  528 	incw y
      008D07 03               [ 1]  529 	ldw x,y 
      008D08 CF 00 0E         [ 4]  530 	call strlen
      008D0B 1E 01            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008D0D CD 94            [ 2]  532 	jrule 22$ 
      008D0F 05 CE            [ 1]  533 	ld a,#NAME_MAX_LEN 
      000E6D                        534 22$:	
      008D11 00               [ 1]  535 	push a 
      000E6E                        536 24$:
      008D12 1E 72            [ 1]  537     ld a,(y)
      008D14 FB 05            [ 1]  538 	jreq 3$
      008D16 CF 00            [ 1]  539 	incw y
      008D18 1E 5B            [ 1]  540 	dec (1,sp) 
      008D1A 06 81            [ 1]  541 	jrne 24$
      008D1C 4F               [ 1]  542 	clr a 
      008D1C 52 08            [ 1]  543 	ld (y),a 
      008D1E CE 00            [ 1]  544 3$: incw y 
      000E7D                        545 	_drop 1 
      008D20 1E C3            [ 2]    1     addw sp,#1 
      008D22 00 1C            [ 1]  546 	ld a,#TK_LABEL 
      008D24 26               [ 1]  547 	clrw x 
      008D25 19 AE            [ 2]  548 	jra 5$ 
      000E84                        549 4$:	
      008D27 00 02            [ 2]  550 	ldw y,(XFIRST,sp)
      008D29 72 D6            [ 1]  551 	cp a,#TK_NOT 
      008D2B 00 1A            [ 1]  552 	jrmi 41$
      008D2D A1 03            [ 1]  553 	ld (y),a 
      008D2F 27 5A            [ 1]  554 	incw y 
      008D31 5F 97            [ 2]  555 	jra 5$ 
      000E90                        556 41$:	
      008D33 1F 07 CE         [ 2]  557 	cpw x,#let  
      008D36 00 1C            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D38 1F 01            [ 1]  559 	ld (y),a 
      008D3A CE 00            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008D3C 1E 20            [ 2]  561 	ldw (y),x
      008D3E 38 72 CE 00      [ 2]  562 	addw y,#2  
      000E9F                        563 5$:	_drop VSIZE 
      008D42 1A 1F            [ 2]    1     addw sp,#VSIZE 
      008D44 05               [ 4]  564 	ret  	
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
      000EA2                        575 skip:
      008D45 AE               [ 1]  576 	push a
      008D46 00 02 72         [ 4]  577 1$:	ld a,([in.w],y)
      008D49 D6 00            [ 1]  578 	jreq 2$
      008D4B 1A 97            [ 1]  579 	cp a,(C,sp)
      008D4D 1F 07            [ 1]  580 	jrne 2$
      008D4F 1E 05 4F CD      [ 1]  581 	inc in
      008D53 8C 98            [ 2]  582 	jra 1$
      000EB2                        583 2$: _drop 1 
      008D55 5D 26            [ 2]    1     addw sp,#1 
      008D57 04               [ 4]  584 	ret
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
      000EB5                        609 get_token:: 
      000EB5                        610 	_vars VSIZE
      008D58 17 01            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000EB7                        616 0$: 
      008D5A 20 05 1F 01      [ 2]  617 	ldw y,#tib    	
      008D5E CD 8C            [ 1]  618 	ld a,#SPACE
      008D60 C3 0E A2         [ 4]  619 	call skip
      008D61 55 00 01 00 02   [ 1]  620 	mov in.saved,in 
      008D61 A6 03 11         [ 4]  621 	ld a,([in.w],y)
      008D64 08 27            [ 1]  622 	jrne 1$
      008D66 24 1E            [ 1]  623 	ldw y,x 
      008D68 01 C3 00         [ 2]  624 	jp token_exit ; end of line 
      008D6B 1E 27 09 1E      [ 1]  625 1$:	inc in 
      008D6F 01 16 07         [ 4]  626 	call to_upper 
      008D72 CD 8C            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000ED8                        629 str_tst:  	
      000ED8                        630 	_case '"' nbr_tst
      008D74 F0 20            [ 1]    1 	ld a,#'"' 
      008D76 06 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D77 26 0A            [ 1]    3 	jrne nbr_tst
      008D77 72 FB            [ 1]  631 	ld a,#TK_QSTR
      008D79 07               [ 1]  632 	ld (x),a 
      008D7A CF               [ 1]  633 	incw x 
      008D7B 00 1E 1E         [ 4]  634 	call parse_quote
      008D7E 07 CF 00         [ 2]  635 	jp token_exit
      000EE8                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008D81 0E 90            [ 1]  638 	ld a,#'$'
      008D83 AE 16            [ 1]  639 	cp a,(TCHAR,sp) 
      008D85 E0 1E            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008D87 01 CD            [ 1]  642 	ld a,#'&
      008D89 94 05            [ 1]  643 	cp a,(TCHAR,sp)
      008D8B 26 0A            [ 1]  644 	jrne 0$
      008D8B 5B 08            [ 1]  645 	ld a,#TK_INTGR
      008D8D 81               [ 1]  646 	ld (x),a 
      008D8E 5C               [ 1]  647 	incw x 
      008D8E 52 02 4F         [ 4]  648 	call parse_binary ; expect binary integer 
      008D91 6B 01 66         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008D93 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008D93 91 D6 01         [ 4]  652 	call is_digit
      008D96 27 24            [ 1]  653 	jrnc 3$
      008D98 72 5C            [ 1]  654 1$:	ld a,#TK_INTGR 
      008D9A 00               [ 1]  655 	ld (x),a 
      008D9B 02               [ 1]  656 	incw x 
      008D9C 6B 02            [ 1]  657 	ld a,(TCHAR,sp)
      008D9E A6 5C 11         [ 4]  658 	call parse_integer 
      008DA1 01 26 0A         [ 2]  659 	jp token_exit 
      000F11                        660 3$: 
      000F11                        661 	_case '(' bkslsh_tst 
      008DA4 0F 01            [ 1]    1 	ld a,#'(' 
      008DA6 7B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA8 AD 1C            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008DAA F7 5C            [ 1]  662 	ld a,#TK_LPAREN
      008DAC 20 E5 62         [ 2]  663 	jp token_char   	
      008DAE                        664 bkslsh_tst: ; character token 
      000F1C                        665 	_case '\',rparnt_tst
      008DAE 7B 02            [ 1]    1 	ld a,#'\' 
      008DB0 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB2 27 DD            [ 1]    3 	jrne rparnt_tst
      008DB4 A1 22            [ 1]  666 	ld a,#TK_CHAR 
      008DB6 27               [ 1]  667 	ld (x),a 
      008DB7 04               [ 1]  668 	incw x 
      008DB8 F7 5C 20         [ 4]  669 	ld a,([in.w],y)
      008DBB D7               [ 1]  670 	ld (x),a 
      008DBC 5C               [ 1]  671 	incw x
      008DBC 7F 5C            [ 1]  672 	ldw y,x 	 
      008DBE 90 93 5F A6      [ 1]  673 	inc in  
      008DC2 02               [ 1]  674 	clrw x 
      008DC3 5B               [ 1]  675 	ld xl,a 
      008DC4 02 81            [ 1]  676 	ld a,#TK_CHAR 
      008DC6 CC 10 66         [ 2]  677 	jp token_exit 
      000F38                        678 rparnt_tst:		
      000F38                        679 	_case ')' colon_tst 
      008DC6 89 AE            [ 1]    1 	ld a,#')' 
      008DC8 8D DB            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCA F1 27            [ 1]    3 	jrne colon_tst
      008DCC 06 7D            [ 1]  680 	ld a,#TK_RPAREN 
      008DCE 27 09 5C         [ 2]  681 	jp token_char
      000F43                        682 colon_tst:
      000F43                        683 	_case ':' comma_tst 
      008DD1 20 F7            [ 1]    1 	ld a,#':' 
      008DD3 1D 8D            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD5 DB 9F            [ 1]    3 	jrne comma_tst
      008DD7 AB 07            [ 1]  684 	ld a,#TK_COLON 
      008DD9 85 81 61         [ 2]  685 	jp token_char  
      000F4E                        686 comma_tst:
      000F4E                        687 	_case COMMA sharp_tst 
      008DDC 62 74            [ 1]    1 	ld a,#COMMA 
      008DDE 6E 76            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE0 66 72            [ 1]    3 	jrne sharp_tst
      008DE2 00 08            [ 1]  688 	ld a,#TK_COMMA
      008DE3 CC 10 62         [ 2]  689 	jp token_char
      000F59                        690 sharp_tst:
      000F59                        691 	_case SHARP dash_tst 
      008DE3 89 4B            [ 1]    1 	ld a,#SHARP 
      008DE5 00 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE7 0A A1            [ 1]    3 	jrne dash_tst
      008DE9 24 26            [ 1]  692 	ld a,#TK_SHARP
      008DEB 04 5B 01         [ 2]  693 	jp token_char  	 	 
      000F64                        694 dash_tst: 	
      000F64                        695 	_case '-' at_tst 
      008DEE 4B 10            [ 1]    1 	ld a,#'-' 
      008DF0 F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF2 91 D6            [ 1]    3 	jrne at_tst
      008DF4 01 72            [ 1]  696 	ld a,#TK_MINUS  
      008DF6 5C 00 02         [ 2]  697 	jp token_char 
      000F6F                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      000F6F                        699 	_case '@' qmark_tst 
      008DF9 CD 98            [ 1]    1 	ld a,#'@' 
      008DFB FB 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFD 02 CD            [ 1]    3 	jrne qmark_tst
      008DFF 8E 80            [ 1]  700 	ld a,#TK_ARRAY 
      008E01 25 ED A6         [ 2]  701 	jp token_char
      000F7A                        702 qmark_tst:
      000F7A                        703 	_case '?' tick_tst 
      008E04 10 11            [ 1]    1 	ld a,#'?' 
      008E06 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008E08 0A 7B            [ 1]    3 	jrne tick_tst
      008E0A 02 A1            [ 1]  704 	ld a,#TK_CMD  
      008E0C 41               [ 1]  705 	ld (x),a 
      008E0D 2B               [ 1]  706 	incw x 
      008E0E 04 A1            [ 1]  707 	ldw y,x 
      008E10 47 2B DD         [ 2]  708 	ldw x,#print
      008E13 72 5A            [ 2]  709 	ldw (y),x 
      008E15 00 02 7F 1E      [ 2]  710 	addw y,#2
      008E19 03 CD 99         [ 2]  711 	jp token_exit
      000F92                        712 tick_tst: ; comment 
      000F92                        713 	_case TICK plus_tst 
      008E1C 07 16            [ 1]    1 	ld a,#TICK 
      008E1E 03 C6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E20 00 0D            [ 1]    3 	jrne plus_tst
      008E22 90 F7            [ 1]  714 	ld a,#TK_CMD
      008E24 90               [ 1]  715 	ld (x),a 
      008E25 5C               [ 1]  716 	incw x
      008E26 CE 00 0E 90      [ 2]  717 	ldw y,#remark 
      008E2A FF               [ 2]  718 	ldw (x),y 
      008E2B 72 A9 00         [ 2]  719 	addw x,#2  
      000FA4                        720 copy_comment:
      008E2E 02 A6 84 5B      [ 2]  721 	ldw y,#tib 
      008E32 04 81 00 00      [ 2]  722 	addw y,in.w
      008E34 90 89            [ 2]  723 	pushw y 
      008E34 4B 00 4B         [ 4]  724 	call strcpy
      008E37 00 4B 00         [ 2]  725 	subw y,(1,sp)
      008E3A 90 5C            [ 1]  726 	incw y ; strlen+1 
      008E3A 91 D6            [ 2]  727 	ldw (1,sp),y 
      008E3C 01 72 5C         [ 2]  728 	addw x,(1,sp) 
      000FBB                        729 	_drop 2 
      008E3F 00 02            [ 2]    1     addw sp,#2 
      008E41 A1               [ 1]  730 	clr a 
      008E42 30 27            [ 1]  731 	ldw y,x 
      008E44 06 A1 31         [ 2]  732 	jp token_exit 
      000FC3                        733 plus_tst:
      000FC3                        734 	_case '+' star_tst 
      008E47 27 02            [ 1]    1 	ld a,#'+' 
      008E49 20 0B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4B A0 30            [ 1]    3 	jrne star_tst
      008E4D 46 09            [ 1]  735 	ld a,#TK_PLUS  
      008E4F 03 09 02         [ 2]  736 	jp token_char 
      000FCE                        737 star_tst:
      000FCE                        738 	_case '*' slash_tst 
      008E52 09 01            [ 1]    1 	ld a,#'*' 
      008E54 20 E4            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008E56 26 05            [ 1]    3 	jrne slash_tst
      008E56 72 5A            [ 1]  739 	ld a,#TK_MULT 
      008E58 00 02 90         [ 2]  740 	jp token_char 
      000FD9                        741 slash_tst: 
      000FD9                        742 	_case '/' prcnt_tst 
      008E5B 93 7B            [ 1]    1 	ld a,#'/' 
      008E5D 01 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E5F F7 90            [ 1]    3 	jrne prcnt_tst
      008E61 5C 1E            [ 1]  743 	ld a,#TK_DIV 
      008E63 02 90 FF         [ 2]  744 	jp token_char 
      000FE4                        745 prcnt_tst:
      000FE4                        746 	_case '%' eql_tst 
      008E66 72 A9            [ 1]    1 	ld a,#'%' 
      008E68 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E6A A6 84            [ 1]    3 	jrne eql_tst
      008E6C 5B 03            [ 1]  747 	ld a,#TK_MOD
      008E6E 81 10 62         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      008E6F                        750 eql_tst:
      000FEF                        751 	_case '=' gt_tst 		
      008E6F A1 41            [ 1]    1 	ld a,#'=' 
      008E71 8C 24            [ 1]    2 	cp a,(TCHAR,sp) 
      008E73 0B A1            [ 1]    3 	jrne gt_tst
      008E75 5B 25            [ 1]  752 	ld a,#TK_EQUAL
      008E77 07 A1 61         [ 2]  753 	jp token_char 
      000FFA                        754 gt_tst:
      000FFA                        755 	_case '>' lt_tst 
      008E7A 8C 24            [ 1]    1 	ld a,#'>' 
      008E7C 02 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      008E7E 7B 81            [ 1]    3 	jrne lt_tst
      008E80 A6 31            [ 1]  756 	ld a,#TK_GT 
      008E80 A1 30            [ 1]  757 	ld (ATTRIB,sp),a 
      008E82 25 03 A1         [ 4]  758 	ld a,([in.w],y)
      008E85 3A 8C 8C 81      [ 1]  759 	inc in 
      008E89 A1 3D            [ 1]  760 	cp a,#'=
      008E89 CD 8E            [ 1]  761 	jrne 1$
      008E8B 80 25            [ 1]  762 	ld a,#TK_GE 
      008E8D 03 CD            [ 2]  763 	jra token_char  
      008E8F 8E 6F            [ 1]  764 1$: cp a,#'<
      008E91 81 04            [ 1]  765 	jrne 2$
      008E92 A6 35            [ 1]  766 	ld a,#TK_NE 
      008E92 A1 5F            [ 2]  767 	jra token_char 
      008E94 26 03 99 20      [ 1]  768 2$: dec in
      008E98 03 CD            [ 1]  769 	ld a,(ATTRIB,sp)
      008E9A 8E 89            [ 2]  770 	jra token_char 	 
      001023                        771 lt_tst:
      001023                        772 	_case '<' other
      008E9C 81 3C            [ 1]    1 	ld a,#'<' 
      008E9D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E9D 5C 23            [ 1]    3 	jrne other
      008E9E A6 34            [ 1]  773 	ld a,#TK_LT 
      008E9E CD 98            [ 1]  774 	ld (ATTRIB,sp),a 
      008EA0 FB F7 5C         [ 4]  775 	ld a,([in.w],y)
      008EA3 91 D6 01 72      [ 1]  776 	inc in 
      008EA7 5C 00            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008EA9 02 CD            [ 1]  778 	jrne 1$
      008EAB 8E 92            [ 1]  779 	ld a,#TK_LE 
      008EAD 25 EF            [ 2]  780 	jra token_char 
      008EAF 7F 72            [ 1]  781 1$: cp a,#'>
      008EB1 5A 00            [ 1]  782 	jrne 2$
      008EB3 02 81            [ 1]  783 	ld a,#TK_NE 
      008EB5 20 1E            [ 2]  784 	jra token_char 
      008EB5 89 CD 8E 9D      [ 1]  785 2$: dec in 
      008EB9 1E 01            [ 1]  786 	ld a,(ATTRIB,sp)
      008EBB E6 02            [ 2]  787 	jra token_char 	
      00104C                        788 other: ; not a special character 	 
      008EBD 26 0F            [ 1]  789 	ld a,(TCHAR,sp)
      008EBF E6 01 A0         [ 4]  790 	call is_alpha 
      008EC2 41 AE            [ 1]  791 	jrc 30$ 
      008EC4 00 03 42         [ 2]  792 	jp syntax_error 
      001056                        793 30$: 
      008EC7 1C 00 35         [ 4]  794 	call parse_keyword
      008ECA A6 85 20         [ 2]  795 	cpw x,#remark 
      008ECD 36 08            [ 1]  796 	jrne token_exit 
      008ECE 93               [ 1]  797 	ldw x,y 
      008ECE AE B4 A2         [ 2]  798 	jp copy_comment 
      001062                        799 token_char:
      008ED1 16               [ 1]  800 	ld (x),a 
      008ED2 01               [ 1]  801 	incw x
      008ED3 90 5C            [ 1]  802 	ldw y,x 
      001066                        803 token_exit:
      001066                        804 	_drop VSIZE 
      008ED5 CD 99            [ 2]    1     addw sp,#VSIZE 
      008ED7 88               [ 4]  805 	ret
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
      001069                        825 compile::
      008ED8 4D 26            [ 2]  826 	pushw y 
      00106B                        827 	_vars VSIZE 
      008EDA 29 16            [ 2]    1     sub sp,#VSIZE 
      008EDC 01 A6 03 90 F7   [ 1]  828 	mov basicptr,txtbgn
      008EE1 90 5C 93 CD      [ 1]  829 	bset flags,#FCOMP 
      008EE5 93 D9            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008EE7 A1 0F 23         [ 2]  831 	ldw x,#0
      008EEA 02 A6 0F         [ 2]  832 	ldw pad,x ; destination buffer 
      008EED C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      008EED 88 16 E3         [ 2]  834 	ldw x,#pad+3
      008EEE 72 5F 00 01      [ 1]  835 	clr in 
      008EEE 90 F6 27         [ 4]  836 	call get_token
      008EF1 09 90            [ 1]  837 	cp a,#TK_INTGR
      008EF3 5C 0A            [ 1]  838 	jrne 2$
      008EF5 01 26 F6         [ 2]  839 	cpw x,#1 
      008EF8 4F 90            [ 1]  840 	jrpl 1$
      008EFA F7 90            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008EFC 5C 5B 01         [ 2]  842 	jp tb_error
      008EFF A6 03 5F         [ 2]  843 1$:	ldw pad,x 
      008F02 20 1B 16 E3      [ 2]  844 	ldw y,#pad+3 
      008F04 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      008F04 16 01            [ 1]  846 	jrult 3$
      008F06 A1 87            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F08 2B 06 90         [ 2]  848 	jp tb_error 
      0010AB                        849 3$:	
      008F0B F7               [ 1]  850 	ldw x,y 
      008F0C 90 5C 20         [ 4]  851 	call get_token 
      008F0F 0F 00            [ 1]  852 	cp a,#TK_NONE 
      008F10 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F10 A3 9D 01 27      [ 2]  855 	subw y,#pad
      008F14 0A 90            [ 1]  856     ld a,yl
      008F16 F7 90 5C         [ 2]  857 	ldw x,#pad 
      008F19 90 FF 72         [ 2]  858 	ldw ptr16,x 
      008F1C A9 00            [ 1]  859 	ld (2,x),a 
      008F1E 02               [ 2]  860 	ldw x,(x)
      008F1F 5B 02            [ 1]  861 	jreq 10$
      008F21 81 0C 9C         [ 4]  862 	call insert_line
      008F22 72 5F 00 03      [ 1]  863 	clr  count 
      008F22 88 91            [ 2]  864 	jra  11$ 
      0010CD                        865 10$: ; line# is zero 
      008F24 D6 01 27         [ 2]  866 	ldw x,ptr16  
      008F27 0A 11 01         [ 2]  867 	ldw basicptr,x 
      008F2A 26 06            [ 1]  868 	ld a,(2,x)
      008F2C 72 5C 00         [ 1]  869 	ld count,a 
      008F2F 02 20 F1 5B      [ 1]  870 	mov in,#3 
      0010DC                        871 11$:
      0010DC                        872 	_drop VSIZE 
      008F33 01 81            [ 2]    1     addw sp,#VSIZE 
      008F35 72 1B 00 22      [ 1]  873 	bres flags,#FCOMP 
      008F35 52 02            [ 2]  874 	popw y 
      008F37 81               [ 4]  875 	ret 
                                    876 
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
      0010E5                         48 cpy_cmd_name:
      008F37 90               [ 2]   49 	tnzw x 
      008F38 AE 16            [ 1]   50 	jreq 10$
      008F3A 90               [ 1]   51 	ld a,(x)
      008F3B A6               [ 1]   52 	incw x
      008F3C 20 CD            [ 1]   53 	and a,#15  
      008F3E 8F               [ 1]   54 	push a 
      008F3F 22 55            [ 1]   55     tnz (1,sp) 
      008F41 00 02            [ 1]   56 	jreq 9$
      008F43 00               [ 1]   57 1$:	ld a,(x)
      008F44 03 91            [ 1]   58 	ld (y),a  
      008F46 D6               [ 1]   59 	incw x
      008F47 01 26            [ 1]   60 	incw y 
      008F49 05 90            [ 1]   61 	dec (1,sp)	 
      008F4B 93 CC            [ 1]   62 	jrne 1$
      008F4D 90               [ 1]   63 9$: pop a 
      0010FC                         64 10$: 
      008F4E E6               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      0010FD                         75 add_space:
      008F4F 72 5C            [ 2]   76 	decw y 
      008F51 00 02            [ 1]   77 	ld a,(y)
      008F53 CD 98            [ 1]   78 	incw y
      008F55 FB 6B            [ 1]   79 	cp a,#') 
      008F57 01 05            [ 1]   80 	jreq 0$
      008F58 CD 0E 09         [ 4]   81 	call is_alnum 
      008F58 A6 22            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00110C                         83 0$: 
      008F5A 11 01            [ 1]   84 	ld a,#SPACE 
      008F5C 26 0A            [ 1]   85 	ld (y),a 
      008F5E A6 02            [ 1]   86 	incw y 
      008F60 F7               [ 4]   87 1$: ret 
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
      001113                         99 right_align::
      008F61 5C               [ 1]  100 	push a 
      008F62 CD 8D            [ 1]  101 0$: ld a,(1,sp)
      008F64 8E CC 90         [ 1]  102 	cp a,tab_width 
      008F67 E6 08            [ 1]  103 	jrpl 1$
      008F68 A6 20            [ 1]  104 	ld a,#SPACE 
      008F68 A6               [ 2]  105 	decw x
      008F69 24               [ 1]  106 	ld (x),a  
      008F6A 11 01            [ 1]  107 	inc (1,sp)
      008F6C 27 17            [ 2]  108 	jra 0$ 
      008F6E A6               [ 1]  109 1$: pop a 	
      008F6F 26               [ 4]  110 	ret 
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
      001125                        123 cpy_quote:
      008F70 11 01            [ 1]  124 	ld a,#'"
      008F72 26 0A            [ 1]  125 	ld (y),a 
      008F74 A6 84            [ 1]  126 	incw y 
      008F76 F7               [ 2]  127 	pushw x 
      008F77 5C CD 8E         [ 4]  128 	call skip_string 
      008F7A 34               [ 2]  129 	popw x 
      008F7B CC               [ 1]  130 1$:	ld a,(x)
      008F7C 90 E6            [ 1]  131 	jreq 9$
      008F7E 7B               [ 1]  132 	incw x 
      008F7F 01 CD            [ 1]  133 	cp a,#SPACE 
      008F81 8E 80            [ 1]  134 	jrult 3$
      008F83 24 0C            [ 1]  135 	ld (y),a
      008F85 A6 84            [ 1]  136 	incw y 
      008F87 F7 5C            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      008F89 7B 01            [ 1]  138 	jrne 1$ 
      001140                        139 2$:
      008F8B CD 8D            [ 1]  140 	ld (y),a
      008F8D E3 CC            [ 1]  141 	incw y  
      008F8F 90 E6            [ 2]  142 	jra 1$
      008F91 88               [ 1]  143 3$: push a 
      008F91 A6 28            [ 1]  144 	ld a,#'\
      008F93 11 01            [ 1]  145 	ld (y),a 
      008F95 26 05            [ 1]  146 	incw y  
      008F97 A6               [ 1]  147 	pop a 
      008F98 06 CC            [ 1]  148 	sub a,#7
      008F9A 90 E2 0E         [ 1]  149 	ld acc8,a 
      008F9C 72 5F 00 0D      [ 1]  150 	clr acc16
      008F9C A6               [ 2]  151 	pushw x
      008F9D 5C 11 01         [ 2]  152 	ldw x,#escaped 
      008FA0 26 16 A6 04      [ 2]  153 	addw x,acc16 
      008FA4 F7               [ 1]  154 	ld a,(x)
      008FA5 5C               [ 2]  155 	popw x
      008FA6 91 D6            [ 2]  156 	jra 2$
      008FA8 01 F7            [ 1]  157 9$: ld a,#'"
      008FAA 5C 90            [ 1]  158 	ld (y),a 
      008FAC 93 72            [ 1]  159 	incw y  
      008FAE 5C               [ 1]  160 	incw x 
      008FAF 00               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      00116B                        171 var_name::
      008FB0 02 5F 97         [ 2]  172 		subw x,#vars 
      008FB3 A6 04            [ 1]  173 		ld a,#3
      008FB5 CC               [ 2]  174 		div x,a 
      008FB6 90               [ 1]  175 		ld a,xl 
      008FB7 E6 41            [ 1]  176 		add a,#'A 
      008FB8 81               [ 4]  177 		ret 
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
      001175                        195 decompile::
      001175                        196 	_vars VSIZE
      008FB8 A6 29            [ 2]    1     sub sp,#VSIZE 
      008FBA 11 01 26         [ 1]  197 	ld a,base
      008FBD 05 A6            [ 1]  198 	ld (BASE_SAV,sp),a  
      008FBF 07 CC 90         [ 1]  199 	ld a,tab_width 
      008FC2 E2 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      008FC3 17 03            [ 2]  201 	ldw (STR,sp),y   
      008FC3 A6 3A 11 01      [ 5]  202 	ldw x,[basicptr] ; line number 
      008FC7 26 05 A6 0A      [ 1]  203 	mov base,#10
      008FCB CC 90 E2 23      [ 1]  204 	mov tab_width,#5
      008FCE 72 5F 00 0C      [ 1]  205 	clr acc24 
      008FCE A6 2C 11         [ 2]  206 	ldw acc16,x
      008FD1 01               [ 1]  207 	clr a ; unsigned conversion 
      008FD2 26 05 A6         [ 4]  208 	call itoa  
      008FD5 08 CC 90         [ 4]  209 	call right_align 
      008FD8 E2               [ 1]  210 	push a 
      008FD9 90 93            [ 1]  211 1$:	ldw y,x ; source
      008FD9 A6 23            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      008FDB 11 01 26         [ 4]  213 	call strcpy 
      008FDE 05 A6            [ 1]  214 	clrw y 
      008FE0 09               [ 1]  215 	pop a 
      008FE1 CC 90            [ 1]  216 	ld yl,a 
      008FE3 E2 F9 03         [ 2]  217 	addw y,(STR,sp)
      008FE4 A6 20            [ 1]  218 	ld a,#SPACE 
      008FE4 A6 2D            [ 1]  219 	ld (y),a 
      008FE6 11 01            [ 1]  220 	incw y 
      008FE8 26 05 A6 11      [ 1]  221 	clr tab_width
      008FEC CC 90 E2         [ 2]  222 	ldw x,#3
      008FEF CF 00 00         [ 2]  223 	ldw in.w,x 
      0011BD                        224 decomp_loop:
      008FEF A6 40            [ 2]  225 	pushw y
      008FF1 11 01 26         [ 4]  226 	call next_token 
      008FF4 05 A6            [ 2]  227 	popw y 
      008FF6 05               [ 1]  228 	tnz a  
      008FF7 CC 90            [ 1]  229 	jrne 1$
      008FF9 E2 12 EA         [ 2]  230 	jp 20$
      008FFA 2B 03            [ 1]  231 1$:	jrmi 2$
      008FFA A6 3F 11         [ 2]  232 	jp 6$
      0011CF                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      008FFD 01 26            [ 1]  234 	cp a,#TK_VAR 
      008FFF 12 A6            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009001 80 F7 5C         [ 4]  237 	call add_space
      009004 90 93 AE         [ 4]  238 	call get_addr   
      009007 A0 79 90         [ 4]  239 	call var_name
      00900A FF 72            [ 1]  240 	ld (y),a 
      00900C A9 00            [ 1]  241 	incw y  
      00900E 02 CC            [ 2]  242 	jra decomp_loop
      0011E2                        243 3$:
      009010 90 E6            [ 1]  244 	cp a,#TK_INTGR
      009012 26 26            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009012 A6 27 11         [ 4]  247 	call get_int24 
      009015 01 26 2B         [ 1]  248 	ld acc24,a 
      009018 A6 80 F7         [ 2]  249 	ldw acc16,x 
      00901B 5C 90 AE         [ 4]  250 	call add_space
      00901E A1 C1            [ 2]  251 	pushw y 
      009020 FF 1C            [ 1]  252 	ld a,#255 ; signed conversion 
      009022 00 02 22         [ 4]  253 	call itoa  
      009024 16 01            [ 2]  254 	ldw y,(1,sp) 
      009024 90               [ 1]  255 	push a 
      009025 AE               [ 1]  256 	exgw x,y 
      009026 16 90 72         [ 4]  257 	call strcpy 
      009029 B9 00            [ 1]  258 	clrw y
      00902B 01               [ 1]  259 	pop a  
      00902C 90 89            [ 1]  260 	ld yl,a 
      00902E CD 93 F5         [ 2]  261 	addw y,(1,sp)
      001208                        262 	_drop 2 
      009031 72 F2            [ 2]    1     addw sp,#2 
      009033 01 90            [ 2]  263 	jra decomp_loop
      00120C                        264 4$: ; dictionary keyword
      009035 5C 17            [ 1]  265 	cp a,#TK_NOT 
      009037 01 72            [ 1]  266 	jruge 50$ 
      009039 FB               [ 2]  267 	ldw x,(x)
      00903A 01 5B 02 4F      [ 1]  268 	inc in 
      00903E 90 93 CC 90      [ 1]  269 	inc in 
      009042 E6 21 41         [ 2]  270 	cpw x,#remark 
      009043 26 23            [ 1]  271 	jrne 5$
      009043 A6 2B 11         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      009046 01 26 05         [ 4]  274 	call add_space
      009049 A6 10            [ 1]  275 	ld a,#''
      00904B CC 90            [ 1]  276 	ld (y),a 
      00904D E2 5C            [ 1]  277 	incw y 
      00904E                        278 46$:
      00904E A6 2A 11 01      [ 4]  279 	ld a,([in.w],x)
      009052 26 05 A6 20      [ 1]  280 	inc in  
      009056 CC 90            [ 1]  281 	ld (y),a 
      009058 E2 5C            [ 1]  282 	incw y 
      009059 C6 00 01         [ 1]  283 	ld a,in 
      009059 A6 2F 11         [ 1]  284 	cp a,count 
      00905C 01 26            [ 1]  285 	jrmi 46$
      00905E 05 A6 21         [ 2]  286 	jp 20$  
      009061 CC 90 E2         [ 2]  287 5$: cpw x,#let  
      009064 26 05            [ 1]  288 	jrne 54$
      009064 A6 25 11         [ 2]  289 	jp decomp_loop ; down display LET
      001249                        290 50$:
      009067 01               [ 1]  291 	clrw x 
      009068 26               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      00124B                        297 54$: ; insert command name 
      009069 05 A6 22         [ 4]  298 	call add_space  
      00906C CC 90            [ 2]  299 	pushw y
      00906E E2 13 25         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00906F 90 85            [ 2]  301 	popw y 
      00906F A6 3D 11         [ 4]  302 	call cpy_cmd_name
      009072 01 26 05         [ 2]  303 	jp decomp_loop 
      00125B                        304 6$:
                                    305 ; label?
      009075 A6 32            [ 1]  306 	cp a,#TK_LABEL 
      009077 CC 90            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      009079 E2 20            [ 1]  309 	ld a,#32 
      00907A 90 F7            [ 1]  310 	ld (y),a 
      00907A A6 3E            [ 1]  311 	incw y 
      001265                        312 61$:
      00907C 11               [ 2]  313 	pushw x 
      00907D 01 26 23         [ 4]  314 	call skip_string 
      009080 A6               [ 2]  315 	popw x 
      00126A                        316 62$:	
      009081 31               [ 1]  317 	ld a,(x)
      009082 6B 02            [ 1]  318 	jreq 63$ 
      009084 91               [ 1]  319 	incw x  
      009085 D6 01            [ 1]  320 	ld (y),a 
      009087 72 5C            [ 1]  321 	incw y 
      009089 00 02            [ 2]  322 	jra 62$ 
      001274                        323 63$: 
      00908B A1 3D            [ 1]  324 	ld a,#32 
      00908D 26 04            [ 1]  325 	ld (y),a 
      00908F A6 33            [ 1]  326 	incw y 
      009091 20 4F A1         [ 2]  327 	jp decomp_loop
      00127D                        328 64$:
      009094 3C 26            [ 1]  329 	cp a,#TK_QSTR 
      009096 04 A6            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      009098 35 20 47         [ 4]  332 	call add_space
      00909B 72 5A 00         [ 4]  333 	call cpy_quote  
      00909E 02 7B 02         [ 2]  334 	jp decomp_loop
      00128A                        335 7$:
      0090A1 20 3F            [ 1]  336 	cp a,#TK_CHAR 
      0090A3 26 10            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      0090A3 A6 3C 11         [ 4]  339 	call add_space 
      0090A6 01 26            [ 1]  340 	ld a,#'\ 
      0090A8 23 A6            [ 1]  341 	ld (y),a 
      0090AA 34 6B            [ 1]  342 	incw y
      0090AC 02               [ 1]  343 	ld a,(x)
      0090AD 91 D6 01 72      [ 1]  344 	inc in  
      0090B1 5C 00            [ 2]  345 	jra 81$
      0090B3 02 A1            [ 1]  346 8$: cp a,#TK_COLON 
      0090B5 3D 26            [ 1]  347 	jrne 9$
      0090B7 04 A6            [ 1]  348 	ld a,#':
      0012A4                        349 81$:
      0090B9 36 20            [ 1]  350 	ld (y),a 
      0090BB 26 A1            [ 1]  351 	incw y 
      0012A8                        352 82$:
      0090BD 3E 26 04         [ 2]  353 	jp decomp_loop
      0012AB                        354 9$: 
      0090C0 A6 35            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0090C2 20 1E            [ 1]  356 	jrugt 10$ 
      0090C4 72 5A            [ 1]  357 	sub a,#TK_ARRAY 
      0090C6 00               [ 1]  358 	clrw x 
      0090C7 02               [ 1]  359 	ld xl,a
      0090C8 7B 02 20         [ 2]  360 	addw x,#single_char 
      0090CB 16               [ 1]  361 	ld a,(x)
      0090CC 20 EB            [ 2]  362 	jra 81$ 
      0012B9                        363 10$: 
      0090CC 7B 01            [ 1]  364 	cp a,#TK_MINUS 
      0090CE CD 8E            [ 1]  365 	jrugt 11$
      0090D0 6F 25            [ 1]  366 	sub a,#TK_PLUS 
      0090D2 03               [ 1]  367 	clrw x 
      0090D3 CC               [ 1]  368 	ld xl,a 
      0090D4 96 B9 05         [ 2]  369 	addw x,#add_char 
      0090D6 F6               [ 1]  370 	ld a,(x)
      0090D6 CD 8E            [ 2]  371 	jra 81$
      0012C7                        372 11$:
      0090D8 B5 A3            [ 1]  373     cp a,#TK_MOD 
      0090DA A1 C1            [ 1]  374 	jrugt 12$
      0090DC 26 08            [ 1]  375 	sub a,#TK_MULT
      0090DE 93               [ 1]  376 	clrw x 
      0090DF CC               [ 1]  377 	ld xl,a 
      0090E0 90 24 07         [ 2]  378 	addw x,#mul_char
      0090E2 F6               [ 1]  379 	ld a,(x)
      0090E2 F7 5C            [ 2]  380 	jra 81$
      0012D5                        381 12$:
      0090E4 90 93            [ 1]  382 	sub a,#TK_GT  
      0090E6 48               [ 1]  383 	sll a 
      0090E6 5B               [ 1]  384 	clrw x 
      0090E7 02               [ 1]  385 	ld xl,a 
      0090E8 81 13 0A         [ 2]  386 	addw x,#relop_str 
      0090E9 FE               [ 2]  387 	ldw x,(x)
      0090E9 90               [ 1]  388 	ld a,(x)
      0090EA 89               [ 1]  389 	incw x 
      0090EB 52 02            [ 1]  390 	ld (y),a
      0090ED 55 00            [ 1]  391 	incw y 
      0090EF 1C               [ 1]  392 	ld a,(x)
      0090F0 00 05            [ 1]  393 	jrne 81$
      0090F2 72 1A 00         [ 2]  394 	jp decomp_loop 
      0012EA                        395 20$: 
      0090F5 23 A6            [ 1]  396 	clr (y)
      0090F7 00 AE            [ 2]  397 	ldw x,(STR,sp)
      0090F9 00 00            [ 1]  398 	ld a,(BASE_SAV,sp)
      0090FB CF 16 E0         [ 1]  399 	ld base,a 
      0090FE C7 16            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      009100 E2 AE 16         [ 1]  401 	ld tab_width,a
      009103 E3 72 5F         [ 2]  402 	subw y,(STR,sp) 
      009106 00 02            [ 1]  403 	ld a,yl 
      0012FD                        404 	_drop VSIZE 
      009108 CD 8F            [ 2]    1     addw sp,#VSIZE 
      00910A 35               [ 4]  405 	ret 
                                    406 
      00910B A1 84 26 11 A3         407 single_char: .byte '@','(',')',',','#'
      009110 00 01                  408 add_char: .byte '+','-'
      009112 2A 05 A6               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009115 0A CC 96 BB CF 16 E0   410 relop_str: .word gt,equal,ge,lt,ne,le 
             90 AE 16 E3 90
      009121 A3 17                  411 gt: .asciz ">"
      009123 60 25                  412 equal: .asciz "="
      009125 05 A6 0F               413 ge: .asciz ">="
      009128 CC 96                  414 lt: .asciz "<"
      00912A BB 3D 00               415 le: .asciz "<="
      00912B 3C 3E 00               416 ne:  .asciz "<>"
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
      001325                        429 cmd_name:
      001325                        430 	_vars VSIZE 
      00912B 93 CD            [ 2]    1     sub sp,#VSIZE 
      00912D 8F 35 A1 00      [ 1]  431 	clr acc16 
      009131 26 ED            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009133 72 A2 16         [ 2]  433 	ldw x,#kword_dict	
      009136 E0 90            [ 2]  434 1$:	ldw (LINK,sp),x
      009138 9F AE            [ 1]  435 	ld a,(2,x)
      00913A 16 E0            [ 1]  436 	and a,#15 
      00913C CF 00 1A         [ 1]  437 	ld acc8,a 
      00913F E7 02 FE         [ 2]  438 	addw x,#3
      009142 27 09 CD 8D      [ 2]  439 	addw x,acc16
      009146 1C               [ 2]  440 	ldw x,(x) ; code address   
      009147 72 5F            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      009149 00 04            [ 1]  442 	jreq 2$
      00914B 20 0F            [ 2]  443 	ldw x,(LINK,sp)
      00914D FE               [ 2]  444 	ldw x,(x) 
      00914D CE 00 1A         [ 2]  445 	subw x,#2  
      009150 CF 00            [ 1]  446 	jrne 1$
      009152 05               [ 1]  447 	clr a 
      009153 E6               [ 1]  448 	clrw x 
      009154 02 C7            [ 2]  449 	jra 9$
      009156 00 04            [ 2]  450 2$: ldw x,(LINK,sp)
      009158 35 03 00         [ 2]  451 	addw x,#2 	
      001356                        452 9$:	_drop VSIZE
      00915B 02 04            [ 2]    1     addw sp,#VSIZE 
      00915C 81               [ 4]  453 	ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
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
      001359                        118 strlen::
      00915C 5B               [ 2]  119 	pushw x 
      00915D 02               [ 1]  120 	clr a
      00915E 72               [ 1]  121 1$:	tnz (x) 
      00915F 1B 00            [ 1]  122 	jreq 9$ 
      009161 23               [ 1]  123 	inc a 
      009162 90               [ 1]  124 	incw x 
      009163 85 81            [ 2]  125 	jra 1$ 
      009165 85               [ 2]  126 9$:	popw x 
      009165 5D               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      001364                        137 strcmp:
      009166 27               [ 1]  138 	ld a,(x)
      009167 14 F6            [ 1]  139 	jreq 5$ 
      009169 5C A4            [ 1]  140 	cp a,(y) 
      00916B 0F 88            [ 1]  141 	jrne 4$ 
      00916D 0D               [ 1]  142 	incw x 
      00916E 01 27            [ 1]  143 	incw y 
      009170 0A F6            [ 2]  144 	jra strcmp 
      001370                        145 4$: ; not same  
      009172 90               [ 1]  146 	clr a 
      009173 F7               [ 4]  147 	ret 
      001372                        148 5$: ; same 
      009174 5C 90            [ 1]  149 	ld a,#1 
      009176 5C               [ 4]  150 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      001375                        161 strcpy::
      009177 0A               [ 1]  162 	push a 
      009178 01               [ 2]  163 	pushw x 
      009179 26 F6            [ 1]  164 1$: ld a,(y)
      00917B 84 06            [ 1]  165 	jreq 9$ 
      00917C F7               [ 1]  166 	ld (x),a 
      00917C 81               [ 1]  167 	incw x 
      00917D 90 5C            [ 1]  168 	incw y 
      00917D 90 5A            [ 2]  169 	jra 1$ 
      00917F 90               [ 1]  170 9$:	clr (x)
      009180 F6               [ 2]  171 	popw x 
      009181 90               [ 1]  172 	pop a 
      009182 5C               [ 4]  173 	ret 
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
      001385                        187 move::
      009183 A1               [ 1]  188 	push a 
      001386                        189 	_vars VSIZE 
      009184 29 27            [ 2]    1     sub sp,#VSIZE 
      009186 05 CD            [ 1]  190 	clr (INCR,sp)
      009188 8E 89            [ 1]  191 	clr (LB,sp)
      00918A 24 06            [ 2]  192 	pushw y 
      00918C 13 01            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      00918C A6 20            [ 2]  194 	popw y 
      00918E 90 F7            [ 1]  195 	jreq move_exit ; x==y 
      009190 90 5C            [ 1]  196 	jrmi move_down
      001396                        197 move_up: ; start from top address with incr=-1
      009192 81 BB 00 0D      [ 2]  198 	addw x,acc16
      009193 72 B9 00 0D      [ 2]  199 	addw y,acc16
      009193 88 7B            [ 1]  200 	cpl (INCR,sp)
      009195 01 C1            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      009197 00 24            [ 2]  202 	jra move_loop  
      0013A4                        203 move_down: ; start from bottom address with incr=1 
      009199 2A               [ 2]  204     decw x 
      00919A 08 A6            [ 2]  205 	decw y
      00919C 20 5A            [ 1]  206 	inc (LB,sp) ; incr=1 
      0013A9                        207 move_loop:	
      00919E F7 0C 01         [ 1]  208     ld a, acc16 
      0091A1 20 F1 84         [ 1]  209 	or a, acc8
      0091A4 81 14            [ 1]  210 	jreq move_exit 
      0091A5 72 FB 01         [ 2]  211 	addw x,(INCR,sp)
      0091A5 A6 22 90         [ 2]  212 	addw y,(INCR,sp) 
      0091A8 F7 90            [ 1]  213 	ld a,(y)
      0091AA 5C               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0091AB 89               [ 2]  215 	pushw x 
      0091AC CD 98 36         [ 2]  216 	ldw x,acc16 
      0091AF 85               [ 2]  217 	decw x 
      0091B0 F6 27 30         [ 2]  218 	ldw acc16,x 
      0091B3 5C               [ 2]  219 	popw x 
      0091B4 A1 20            [ 2]  220 	jra move_loop
      0013C5                        221 move_exit:
      0013C5                        222 	_drop VSIZE
      0091B6 25 0E            [ 2]    1     addw sp,#VSIZE 
      0091B8 90               [ 1]  223 	pop a 
      0091B9 F7               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      0013C9                        233 clear_vars:
      0091BA 90               [ 2]  234 	pushw x 
      0091BB 5C               [ 1]  235 	push a  
      0091BC A1 5C 26         [ 2]  236 	ldw x,#vars 
      0091BF F0 4E            [ 1]  237 	ld a,#CELL_SIZE*26 
      0091C0 7F               [ 1]  238 1$:	clr (x)
      0091C0 90               [ 1]  239 	incw x 
      0091C1 F7               [ 1]  240 	dec a 
      0091C2 90 5C            [ 1]  241 	jrne 1$
      0091C4 20               [ 1]  242 	pop a 
      0091C5 EA               [ 2]  243 	popw x 
      0091C6 88               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      0091C7 A6 5C 90 F7 90 5C 84   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             A0 07 C7 00 0F 72 5F
             00 0E 89 AE 8D DB 72
             BB 00 0E F6 85 20 DD
             A6 22 90 F7 90 5C 5C
             81 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    254 
      0091EB                        255 system_information:
      0091EB 1D 00 35         [ 2]  256 	ldw x,#software 
      0091EE A6 03 62         [ 4]  257 	call puts 
      0091F1 9F AB            [ 1]  258 	ld a,#MAJOR 
      0091F3 41 81 0E         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      0091F5 5F               [ 1]  260 	clrw x 
      0091F5 52 04 C6         [ 2]  261 	ldw acc24,x
      0091F8 00 0B 6B 01      [ 1]  262 	clr tab_width  
      0091FC C6 00 24 6B      [ 1]  263 	mov base, #10 
      009200 02 17 03         [ 4]  264 	call prt_acc24 
      009203 72 CE            [ 1]  265 	ld a,#'.
      009205 00 05 35         [ 4]  266 	call putc 
      009208 0A 00            [ 1]  267 	ld a,#MINOR 
      00920A 0B 35 05         [ 1]  268 	ld acc8,a 
      00920D 00               [ 1]  269 	clrw x 
      00920E 24 72 5F         [ 2]  270 	ldw acc24,x 
      009211 00 0D CF         [ 4]  271 	call prt_acc24
      009214 00 0E            [ 1]  272 	ld a,#CR 
      009216 4F CD 98         [ 4]  273 	call putc
                                    274 ;call test 
      009219 A2               [ 4]  275 	ret
                                    276 
      00144F                        277 warm_init:
      00921A CD 91 93 88      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      00921E 90 93 1E 04      [ 1]  279 	clr flags 
      009222 CD 93 F5 90      [ 1]  280 	clr loop_depth 
      009226 5F 84 90 97      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      00922A 72 F9 03 A6      [ 1]  282 	mov base,#10 
      00922E 20 90 F7         [ 2]  283 	ldw x,#0 
      009231 90 5C 72         [ 2]  284 	ldw basicptr,x 
      009234 5F 00 24         [ 2]  285 	ldw in.w,x 
      009237 AE 00 03 CF      [ 1]  286 	clr count
      00923B 00               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      001471                        293 clear_basic:
      00923C 01               [ 2]  294 	pushw x 
      00923D 72 5F 00 03      [ 1]  295 	clr count
      00923D 90 89 CD 98      [ 1]  296 	clr in  
      009241 1D 90 85         [ 2]  297 	ldw x,#free_ram 
      009244 4D 26 03         [ 2]  298 	ldw txtbgn,x 
      009247 CC 93 6A         [ 2]  299 	ldw txtend,x 
      00924A 2B 03 CC         [ 2]  300 	ldw dvar_bgn,x 
      00924D 92 DB 32         [ 2]  301 	ldw dvar_end,x 
      00924F CD 13 C9         [ 4]  302 	call clear_vars 
      00924F A1               [ 2]  303 	popw x
      009250 85               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00148E                        309 err_msg:
      009251 26 0F CD 91 7D CD 98   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             45 CD 91 EB 90
      00925D F7 90 5C 20 DB 3B 15   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             4C 15 5D
      009262 15 69 15 9C 15 AC 15   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



             C0 15 D3
      009262 A1 84 26 26            313 	.word err_overflow,err_read_only  
                                    314 
      009266 CD 98 4F C7 00 0D CF   315 err_mem_full: .asciz "Memory full\n" 
             00 0E CD 91 7D 90
      009273 89 A6 FF CD 98 A2 16   316 err_syntax: .asciz "syntax error\n" 
             01 88 51 CD 93 F5 90
      009281 5F 84 90 97 72 F9 01   317 err_math_ovf: .asciz "math operation overflow\n"
             5B 02 20 B1 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00928C 64 69 76 69 73 69 6F   318 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      00928C A1 87 24 39 FE 72 5C   319 err_no_line: .asciz "invalid line number.\n"
             00 02 72 5C 00 02 A3
             A1 C1 26 23 CE 00 05
             CD
      0092A2 91 7D A6 27 90 F7 90   320 err_run_only: .asciz "run time only usage.\n" 
             5C 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092AA 63 6F 6D 6D 61 6E 64   321 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0092AA 72 D6 00 01 72 5C 00   322 err_duplicate: .asciz "duplicate name.\n"
             02 90 F7 90 5C C6 00
             02 C1 00
      0092BB 04 2B EC CC 93 6A A3   323 err_not_file: .asciz "File not found.\n"
             9D 01 26 05 CC 92 3D
             2E 0A 00
      0092C9 62 61 64 20 76 61 6C   324 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0092C9 5F 97 6C 65 20 69 6E   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092CB 4E 6F 20 64 61 74 61   326 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092CB CD 91 7D 90 89 CD 93   327 err_no_prog: .asciz "No program in RAM!\n"
             A5 90 85 CD 91 65 CC
             92 3D 4D 21 0A 00
      0092DB 46 69 6C 65 20 73 79   328 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      0092DB A1 03 26 1E A6 20 90   329 err_buf_full: .asciz "Buffer full\n"
             F7 90 5C 6C 0A 00
      0092E5 6F 76 65 72 66 6C 6F   330 err_overflow: .asciz "overflow\n" 
             77 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0092E5 89 CD 98 36 85 61 6E   331 err_read_only: .asciz "constant can't be modified\n"
             74 20 63 61 6E 27 74
             20 62 65 20 6D 6F 64
             69 66 69 65 64 0A 00
                                    332 
      0092EA 0A 72 75 6E 20 74 69   333 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      0092EA F6 27 07 5C 90 F7 90   334 comp_msg: .asciz "\ncompile error, "
             5C 20 F6 72 72 6F 72
             2C 20 00
      0092F4 6C 61 73 74 20 74 6F   335 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    336 
      001639                        337 syntax_error::
      0092F4 A6 20            [ 1]  338 	ld a,#ERR_SYNTAX 
                                    339 
      00163B                        340 tb_error::
      0092F6 90 F7 90 5C CC   [ 2]  341 	btjt flags,#FCOMP,1$
      0092FB 92               [ 1]  342 	push a 
      0092FC 3D 16 06         [ 2]  343 	ldw x, #rt_msg 
      0092FD CD 09 3B         [ 4]  344 	call puts 
      0092FD A1               [ 1]  345 	pop a 
      0092FE 02 26 09         [ 2]  346 	ldw x, #err_msg 
      009301 CD 91 7D CD      [ 1]  347 	clr acc16 
      009305 91               [ 1]  348 	sll a
      009306 A5 CC 92 3D      [ 1]  349 	rlc acc16  
      00930A C7 00 0E         [ 1]  350 	ld acc8, a 
      00930A A1 04 26 10      [ 2]  351 	addw x,acc16 
      00930E CD               [ 2]  352 	ldw x,(x)
      00930F 91 7D A6         [ 4]  353 	call puts
      009312 5C 90 F7         [ 2]  354 	ldw x,basicptr 
                           000001   355 .if DEBUG 
      009315 90 5C F6         [ 1]  356 ld a,count 
      009318 72 5C            [ 1]  357 clrw y 
      00931A 00 02            [ 1]  358 rlwa y  
      00931C 20 06 A1         [ 4]  359 call hex_dump
      00931F 0A 26 09         [ 2]  360 ldw x,basicptr
                                    361 .endif 
      009322 A6 3A 01         [ 1]  362 	ld a,in 
      009324 CD 1F D5         [ 4]  363 	call prt_basic_line
      009324 90 F7 90         [ 2]  364 	ldw x,#tk_id 
      009327 5C 09 3B         [ 4]  365 	call puts 
      009328 C6 00 02         [ 1]  366 	ld a,in.saved 
      009328 CC               [ 1]  367 	clrw x 
      009329 92               [ 1]  368 	ld xl,a 
      00932A 3D BB 00 04      [ 2]  369 	addw x,basicptr 
      00932B F6               [ 1]  370 	ld a,(x)
      00932B A1               [ 1]  371 	clrw x 
      00932C 09               [ 1]  372 	ld xl,a 
      00932D 22 0A A0         [ 4]  373 	call prt_i16
      009330 05 5F            [ 2]  374 	jra 6$
      00168C                        375 1$:	
      009332 97               [ 1]  376 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009333 1C 93 80         [ 2]  377 	ldw x,#comp_msg
      009336 F6 20 EB         [ 4]  378 	call puts 
      009339 84               [ 1]  379 	pop a 
      009339 A1 11 22         [ 2]  380 	ldw x, #err_msg 
      00933C 0A A0 10 5F      [ 1]  381 	clr acc16 
      009340 97               [ 1]  382 	sll a
      009341 1C 93 85 F6      [ 1]  383 	rlc acc16  
      009345 20 DD 0E         [ 1]  384 	ld acc8, a 
      009347 72 BB 00 0D      [ 2]  385 	addw x,acc16 
      009347 A1               [ 2]  386 	ldw x,(x)
      009348 22 22 0A         [ 4]  387 	call puts
      00934B A0 20 5F         [ 2]  388 	ldw x,#tib
      00934E 97 1C 93         [ 4]  389 	call puts 
      009351 87 F6            [ 1]  390 	ld a,#CR 
      009353 20 CF DE         [ 4]  391 	call putc
      009355 CE 00 00         [ 2]  392 	ldw x,in.w
      009355 A0 31 48         [ 4]  393 	call spaces
      009358 5F 97            [ 1]  394 	ld a,#'^
      00935A 1C 93 8A         [ 4]  395 	call putc 
      00935D FE F6 5C         [ 2]  396 6$: ldw x,#STACK_EMPTY 
      009360 90               [ 1]  397     ldw sp,x
                                    398 
      0016C5                        399 warm_start:
      009361 F7 90 5C         [ 4]  400 	call warm_init
                                    401 ;----------------------------
                                    402 ;   BASIC interpreter
                                    403 ;----------------------------
      0016C8                        404 cmd_line: ; user interface 
      009364 F6 26            [ 1]  405 	ld a,#CR 
      009366 BD CC 92         [ 4]  406 	call putc 
      009369 3D 3E            [ 1]  407 	ld a,#'> 
      00936A CD 08 DE         [ 4]  408 	call putc
      00936A 90 7F 1E         [ 4]  409 	call readln
      00936D 03 7B 01 C7      [ 1]  410 	tnz count 
      009371 00 0B            [ 1]  411 	jreq cmd_line
      009373 7B 02 C7         [ 4]  412 	call compile
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
      009376 00 24 72 F2      [ 1]  426 	tnz count 
      00937A 03 90            [ 1]  427 	jreq cmd_line
                                    428 	
                                    429 ; if direct command 
                                    430 ; it's ready to interpret 
                                    431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    432 ;; This is the interpreter loop
                                    433 ;; for each BASIC code line. 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016E4                        435 interpreter: 
      00937C 9F 5B 04         [ 1]  436 	ld a,in 
      00937F 81 40 28         [ 1]  437 	cp a,count 
      009382 29 2C            [ 1]  438 	jrmi interp_loop
      0016EC                        439 next_line:
      009384 23 2B 2D 2A 2F   [ 2]  440 	btjf flags, #FRUN, cmd_line
      009389 25 93 96         [ 2]  441 	ldw x,basicptr
      00938C 93 98 93 9A      [ 2]  442 	addw x,in.w 
      009390 93 9D 93         [ 2]  443 	cpw x,txtend 
      009393 A2 93            [ 1]  444 	jrpl warm_start
      009395 9F 3E 00         [ 2]  445 	ldw basicptr,x ; start of next line  
      009398 3D 00            [ 1]  446 	ld a,(2,x)
      00939A 3E 3D 00         [ 1]  447 	ld count,a 
      00939D 3C 00 3C 3D      [ 1]  448 	mov in,#3 ; skip first 3 bytes of line 
      001709                        449 interp_loop:
      0093A1 00 3C 3E         [ 4]  450 	call next_token
      0093A4 00 00            [ 1]  451 	cp a,#TK_NONE 
      0093A5 27 DC            [ 1]  452 	jreq next_line 
      0093A5 52 04            [ 1]  453 	cp a,#TK_CMD
      0093A7 72 5F            [ 1]  454 	jrne 1$
      001714                        455 	_get_code_addr
      0093A9 00               [ 2]    1         ldw x,(x)
      0093AA 0E 1F 01 AE      [ 1]    2         inc in 
      0093AE B4 A0 1F 03      [ 1]    3         inc in 
      0093B2 E6               [ 4]  456 	call(x)
      0093B3 02 A4            [ 2]  457 	jra interp_loop 
      001720                        458 1$:	 
      0093B5 0F C7            [ 1]  459 	cp a,#TK_VAR
      0093B7 00 0F            [ 1]  460 	jrne 2$
      0093B9 1C 00 03         [ 4]  461 	call let_var  
      0093BC 72 BB            [ 2]  462 	jra interp_loop 
      001729                        463 2$:	
      0093BE 00 0E            [ 1]  464 	cp a,#TK_ARRAY 
      0093C0 FE 13            [ 1]  465 	jrne 3$
      0093C2 01 27 0C         [ 4]  466 	call let_array 
      0093C5 1E 03            [ 2]  467 	jra interp_loop
      001732                        468 3$:	
      0093C7 FE 1D            [ 1]  469 	cp a,#TK_LABEL
      0093C9 00 02            [ 1]  470 	jrne 4$
      0093CB 26 E3 4F         [ 4]  471 	call let_dvar  
      0093CE 5F 20            [ 2]  472 	jra interp_loop 
      00173B                        473 4$: 
      0093D0 05 1E            [ 1]  474 	cp a,#TK_COLON 
      0093D2 03 1C            [ 1]  475 	jreq interp_loop
      0093D4 00 02 5B         [ 2]  476 5$:	jp syntax_error 
                                    477 
                                    478 
                                    479 ;----------------------
                                    480 ; when a label is met 
                                    481 ; at interp_loop
                                    482 ; it may be a variable 
                                    483 ; assignement to DIM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    484 ; variable 
                                    485 ;----------------------
                           000001   486 	VAR_NAME=1 
                           000003   487 	REC_LEN=3
                           000004   488 	VSIZE=4 
      001742                        489 let_dvar:
      001742                        490 	_vars VSIZE 
      0093D7 04 81            [ 2]    1     sub sp,#VSIZE 
      000001 1F 01            [ 2]  491 	ldw (VAR_NAME,sp),x
      000002 0F 03            [ 1]  492 	clr (REC_LEN,sp) 
      000003 CD 17 B6         [ 4]  493 	call skip_string 
      000004 CE 00 04         [ 2]  494 	ldw x,basicptr 
      000005 72 BB 00 00      [ 2]  495 	addw x,in.w 
      000007 F6               [ 1]  496 	ld a,(x)
      000009 A1 32            [ 1]  497 	cp a,#TK_EQUAL 
      00000A 26 43            [ 1]  498 	jrne 9$ 
                                    499 ; dvar assignment 
      00000B 72 5C 00 01      [ 1]  500 	inc in  
      00000C CD 1B C2         [ 4]  501 	call condition  
      00000D A1 84            [ 1]  502 	cp a,#TK_INTGR 
      00000E 27 03            [ 1]  503 	jreq 1$ 
      00000F CC 16 39         [ 2]  504 0$:	jp syntax_error 
      000010                        505 1$: 
      000013 1E 01            [ 2]  506 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      000015 CD 13 59         [ 4]  507 	call strlen 
      000017 AB 05            [ 1]  508 	add a,#REC_XTRA_BYTES
      000019 6B 04            [ 1]  509 	ld (REC_LEN+1,sp),a 
      00001A CD 1D 6A         [ 4]  510 	call search_name 
      00001B 5D               [ 2]  511 	tnzw x 
      00001C 27 EE            [ 1]  512 	jreq 0$ 
      00001E F6               [ 1]  513 	ld a,(x)
      000020 2A 05            [ 1]  514 	jrpl 2$
      000021 A6 11            [ 1]  515 	ld a,#ERR_RD_ONLY 
      000023 CC 16 3B         [ 2]  516 	jp tb_error 
      000024                        517 2$:
      000025 72 FB 03         [ 2]  518 	addw x,(REC_LEN,sp)
      000027 1D 00 03         [ 2]  519 	subw x,#CELL_SIZE 
      00002F CF 00 19         [ 2]  520 	ldw ptr16,x
      000030                        521 	_xpop 
      000031 90 F6            [ 1]    1     ld a,(y)
      000033 93               [ 1]    2     ldw x,y 
      000035 EE 01            [ 2]    3     ldw x,(1,x)
      00008C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00008C 72 C7 00 19      [ 4]  522 	ld [ptr16],a 
      00008E 72 5C 00 1A      [ 1]  523 	inc ptr8 
      000090 72 CF 00 19      [ 5]  524 	ldw [ptr16],x 
      0093D9                        525 9$: _drop VSIZE 	
      0093D9 89 4F            [ 2]    1     addw sp,#VSIZE 
      0093DB 7D               [ 4]  526 	ret 
                                    527 
                                    528 
                                    529 ;--------------------------
                                    530 ; extract next token from
                                    531 ; token list 
                                    532 ; basicptr -> base address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                    533 ; in  -> offset in list array 
                                    534 ; output:
                                    535 ;   A 		token attribute
                                    536 ;   X 		*token_value 
                                    537 ;----------------------------------------
      00179D                        538 next_token::
                                    539 ;	clrw x 
      0093DC 27 04 4C         [ 1]  540 	ld a,in 
      0093DF 5C 20 F9         [ 1]  541 	ld in.saved,a ; in case "_unget_token" needed 
                                    542 ; don't replace sub by "cp a,count" 
                                    543 ; if end of line must return with A=0   	
      0093E2 85 81 03         [ 1]  544 	sub a,count 
      0093E4 27 0D            [ 1]  545 	jreq 9$ ; end of line 
      0017A8                        546 0$: 
      0093E4 F6 27 0B         [ 2]  547 	ldw x,basicptr 
      0093E7 90 F1 26 05      [ 2]  548 	addw x,in.w 
      0093EB 5C               [ 1]  549 	ld a,(x)
      0093EC 90               [ 1]  550 	incw x
      0093ED 5C 20 F4 01      [ 1]  551 	inc in   
      0093F0 81               [ 4]  552 9$: ret 
                                    553 
                                    554 ;-------------------------
                                    555 ;  skip .asciz in BASIC line 
                                    556 ;  name 
                                    557 ;  input:
                                    558 ;     x		* string 
                                    559 ;  output:
                                    560 ;     none 
                                    561 ;-------------------------
      0017B6                        562 skip_string:
      0093F0 4F               [ 1]  563 	ld a,(x)
      0093F1 81 03            [ 1]  564 	jreq 1$
      0093F2 5C               [ 1]  565 	incw x 
      0093F2 A6 01            [ 2]  566 	jra skip_string 
      0093F4 81               [ 1]  567 1$: incw x 	
      0093F5 72 B0 00 04      [ 2]  568 	subw x,basicptr 
      0093F5 88 89 90         [ 2]  569 	ldw in.w,x 
      0093F8 F6               [ 4]  570 	ret 
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
      0017C5                        581 get_addr:
      0093F9 27               [ 2]  582 	ldw x,(x)
      0093FA 06 F7 5C 90      [ 1]  583 	inc in 
      0093FE 5C 20 F6 7F      [ 1]  584 	inc in 
      009402 85               [ 4]  585 	ret 
                                    586 
                                    587 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    588 ; extract int24_t  
                                    589 ; value from BASIC 
                                    590 ; code 
                                    591 ; input:
                                    592 ;    X   *integer 
                                    593 ; output:
                                    594 ;    A:X   int24  
                                    595 ;--------------------
      0017CF                        596 get_int24:
      009403 84               [ 1]  597 	ld a,(x)
      009404 81 01            [ 2]  598 	ldw x,(1,x)
                                    599 ; skip 3 bytes 
      009405 72 5C 00 01      [ 1]  600 	inc in 
      009405 88 52 02 0F      [ 1]  601 	inc in 
      009409 01 0F 02 90      [ 1]  602 	inc in 
      00940D 89               [ 4]  603 	ret 
                                    604 
                                    605 ;-------------------------
                                    606 ; get character from 
                                    607 ; BASIC code 
                                    608 ; input:
                                    609 ;    X   *char 
                                    610 ; output:
                                    611 ;    A    char 
                                    612 ;-------------------------
      0017DF                        613 get_char:
      00940E 13               [ 1]  614 	ld a,(x)
      00940F 01 90 85 27      [ 1]  615 	inc in  
      009413 31               [ 4]  616     ret 
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
      0017E5                        628 prt_i16:
      009414 2B 0E 00 0C      [ 1]  629 	clr acc24 
      009416 CF 00 0D         [ 2]  630 	ldw acc16,x 
      009416 72 BB            [ 1]  631 	ld a,#16
      009418 00 0E 72         [ 1]  632 	cp a,base
      00941B B9 00            [ 1]  633 	jreq prt_acc24  
      00941D 0E 03 01 03 02   [ 2]  634 	btjf acc16,#7,prt_acc24
      009422 20 05 00 0C      [ 1]  635 	cpl acc24 ; sign extend 
                                    636 	
                                    637 ;------------------------------------
                                    638 ; print integer in acc24 
                                    639 ; input:
                                    640 ;	acc24 		integer to print 
                                    641 ;	'base' 		numerical base for conversion 
                                    642 ;   'tab_width' field width 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    643 ;    A 			signed||unsigned conversion
                                    644 ;  output:
                                    645 ;    A          string length
                                    646 ;------------------------------------
      009424                        647 prt_acc24:
      009424 5A 90            [ 1]  648 	ld a,#255  ; signed conversion  
      009426 5A 0C 02         [ 4]  649     call itoa  ; conversion entier en  .asciz
      009429 CD 11 13         [ 4]  650 	call right_align  
      009429 C6               [ 1]  651 	push a 
      00942A 00 0E CA         [ 4]  652 	call puts
      00942D 00               [ 1]  653 	pop a 
      00942E 0F               [ 4]  654     ret	
                                    655 
                                    656 ;---------------------------------------
                                    657 ;  print value at xstack top 
                                    658 ;---------------------------------------
      00180A                        659 print_top: 
      00180A                        660 	_xpop 
      00942F 27 14            [ 1]    1     ld a,(y)
      009431 72               [ 1]    2     ldw x,y 
      009432 FB 01            [ 2]    3     ldw x,(1,x)
      009434 72 F9 01 90      [ 2]    4     addw y,#CELL_SIZE 
      009438 F6 F7 89         [ 1]  661 	ld acc24,a 
      00943B CE 00 0E         [ 2]  662 	ldw acc16,x 
      00943E 5A CF 00         [ 4]  663 	call prt_acc24 
      009441 0E 85            [ 1]  664 	ld a,#SPACE
      009443 20 E4 DE         [ 4]  665 	call putc 
      009445 81               [ 4]  666 	ret 
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
      001822                        682 itoa::
      001822                        683 	_vars VSIZE
      009445 5B 02            [ 2]    1     sub sp,#VSIZE 
      009447 84 81            [ 1]  684 	clr (LEN,sp) ; string length  
      009449 0F 01            [ 1]  685 	clr (SIGN,sp)    ; sign
      009449 89               [ 1]  686 	tnz A
      00944A 88 AE            [ 1]  687 	jreq 1$ ; unsigned conversion  
      00944C 00 35 A6         [ 1]  688 	ld a,base 
      00944F 4E 7F            [ 1]  689 	cp a,#10
      009451 5C 4A            [ 1]  690 	jrne 1$
                                    691 	; base 10 string display with negative sign if bit 23==1
      009453 26 FB 84 85 81   [ 2]  692 	btjf acc24,#7,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009458 0A 0A            [ 1]  693 	cpl (SIGN,sp)
      00945A 54 69 6E         [ 4]  694 	call neg_acc24
      00183C                        695 1$:
                                    696 ; initialize string pointer 
      00945D 79 20 42         [ 2]  697 	ldw x,#tib 
      009460 41 53 49         [ 2]  698 	addw x,#TIB_SIZE
      009463 43               [ 2]  699 	decw x 
      009464 20               [ 1]  700 	clr (x)
      001844                        701 itoa_loop:
      009465 66 6F 72         [ 1]  702     ld a,base
      009468 20 53 54         [ 4]  703     call divu24_8 ; acc24/A 
      00946B 4D 38            [ 1]  704     add a,#'0  ; remainder of division
      00946D 0A 43            [ 1]  705     cp a,#'9+1
      00946F 6F 70            [ 1]  706     jrmi 2$
      009471 79 72            [ 1]  707     add a,#7 
      001852                        708 2$:	
      009473 69               [ 2]  709 	decw x
      009474 67               [ 1]  710     ld (x),a
      009475 68 74            [ 1]  711 	inc (LEN,sp)
                                    712 	; if acc24==0 conversion done
      009477 2C 20 4A         [ 1]  713 	ld a,acc24
      00947A 61 63 71         [ 1]  714 	or a,acc16
      00947D 75 65 73         [ 1]  715 	or a,acc8
      009480 20 44            [ 1]  716     jrne itoa_loop
                                    717 	;conversion done, next add '$' or '-' as required
      009482 65 73 63         [ 1]  718 	ld a,base 
      009485 68 65            [ 1]  719 	cp a,#16
      009487 6E 65            [ 1]  720 	jreq 8$
      009489 73 20            [ 1]  721 	ld a,(SIGN,sp)
      00948B 32 30            [ 1]  722     jreq 10$
      00948D 31 39            [ 1]  723     ld a,#'-
      00948F 2C 32            [ 2]  724 	jra 9$ 
      001870                        725 8$:	
      009491 30 32            [ 1]  726 	ld a,#'$ 
      009493 32               [ 2]  727 9$: decw x
      009494 0A               [ 1]  728     ld (x),a
      009495 76 65            [ 1]  729 	inc (LEN,sp)
      001876                        730 10$:
      009497 72 73            [ 1]  731 	ld a,(LEN,sp)
      001878                        732 	_drop VSIZE
      009499 69 6F            [ 2]    1     addw sp,#VSIZE 
      00949B 6E               [ 4]  733 	ret
                                    734 
                                    735 ;------------------------------------
                                    736 ; convert alpha to uppercase
                                    737 ; input:
                                    738 ;    a  character to convert
                                    739 ; output:
                                    740 ;    a  uppercase character
                                    741 ;------------------------------------
      00187B                        742 to_upper::
      00949C 20 00            [ 1]  743 	cp a,#'a
      00949E 2A 01            [ 1]  744 	jrpl 1$
      00949E AE               [ 4]  745 0$:	ret
      00949F 94 58            [ 1]  746 1$: cp a,#'z	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0094A1 CD 89            [ 1]  747 	jrugt 0$
      0094A3 BB A6            [ 1]  748 	sub a,#32
      0094A5 02               [ 4]  749 	ret
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
      001887                        764 atoi24::
      001887                        765 	_vars VSIZE
      0094A6 C7 00            [ 2]    1     sub sp,#VSIZE 
      0094A8 0F 5F            [ 2]  766 	ldw (XTEMP,sp),x 
                                    767 ; conversion made on xstack 
      0094AA CF               [ 1]  768 	clr a 
      0094AB 00               [ 1]  769 	clrw x 
      00188D                        770 	_xpush 
      0094AC 0D 72 5F 00      [ 2]    1     subw y,#CELL_SIZE
      0094B0 24 35            [ 1]    2     ld (y),a 
      0094B2 0A 00 0B         [ 2]    3     ldw (1,y),x 
      0094B5 CD 98            [ 1]  771 	clr (SIGN,sp)
      0094B7 7C A6            [ 1]  772 	ld a,#10
      0094B9 2E CD            [ 1]  773 	ld (BASE,sp),a ; default base decimal
      0094BB 89 5E            [ 2]  774 	ldw x,(XTEMP,sp)
      0094BD A6               [ 1]  775 	ld a,(x)
      0094BE 00 C7            [ 1]  776 	jreq 9$  ; completed if 0
      0094C0 00 0F            [ 1]  777 	cp a,#'-
      0094C2 5F CF            [ 1]  778 	jrne 1$
      0094C4 00 0D            [ 1]  779 	cpl (SIGN,sp)
      0094C6 CD 98            [ 2]  780 	jra 2$
      0094C8 7C A6            [ 1]  781 1$: cp a,#'$
      0094CA 0D CD            [ 1]  782 	jrne 3$
      0094CC 89 5E            [ 1]  783 	ld a,#16
      0094CE 81 02            [ 1]  784 	ld (BASE,sp),a
      0094CF 5C               [ 1]  785 2$:	incw x
      0094CF 90 AE            [ 2]  786 	ldw (XTEMP,sp),x 
      0094D1 17               [ 1]  787 	ld a,(x)
      0018B5                        788 3$:	; char to digit 
      0094D2 73 72            [ 1]  789 	cp a,#'a
      0094D4 5F 00            [ 1]  790 	jrmi 4$
      0094D6 23 72            [ 1]  791 	sub a,#32
      0094D8 5F 00            [ 1]  792 4$:	cp a,#'0
      0094DA 20 35            [ 1]  793 	jrmi 9$
      0094DC 04 00            [ 1]  794 	sub a,#'0
      0094DE 24 35            [ 1]  795 	cp a,#10
      0094E0 0A 00            [ 1]  796 	jrmi 5$
      0094E2 0B AE            [ 1]  797 	sub a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0094E4 00 00            [ 1]  798 	cp a,(BASE,sp)
      0094E6 CF 00            [ 1]  799 	jrpl 9$
      0094E8 05 CF            [ 1]  800 5$:	ld (TEMP,sp),a
      0094EA 00 01            [ 1]  801 	ld a,(BASE,sp)
      0094EC 72 5F 00         [ 4]  802 	call mulu24_8
      0018D2                        803 	_xpush 
      0094EF 04 81 00 03      [ 2]    1     subw y,#CELL_SIZE
      0094F1 90 F7            [ 1]    2     ld (y),a 
      0094F1 89 72 5F         [ 2]    3     ldw (1,y),x 
      0094F4 00               [ 1]  804 	clrw x 
      0094F5 04 72            [ 1]  805 	ld a,(TEMP,sp)
      0094F7 5F               [ 1]  806 	rlwa x 
      0018DF                        807 	_xpush 
      0094F8 00 02 AE 00      [ 2]    1     subw y,#CELL_SIZE
      0094FC 90 CF            [ 1]    2     ld (y),a 
      0094FE 00 1C CF         [ 2]    3     ldw (1,y),x 
      009501 00 1E CF         [ 4]  808 	call add24 
      009504 00 31            [ 2]  809 	ldw x,(XTEMP,sp)
      009506 CF 00            [ 2]  810 	jra 2$
      009508 33 CD            [ 1]  811 9$:	tnz (SIGN,sp)
      00950A 94 49            [ 1]  812     jreq atoi_exit
      00950C 85 81 F3         [ 4]  813     call neg24
      00950E                        814 atoi_exit:
      0018F6                        815 	_xpop 
      00950E 00 00            [ 1]    1     ld a,(y)
      009510 95               [ 1]    2     ldw x,y 
      009511 32 95            [ 2]    3     ldw x,(1,x)
      009513 3F 95 4D 95      [ 2]    4     addw y,#CELL_SIZE 
      009517 66 95 75         [ 1]  816 	ld acc24,a 
      00951A 95 8B 95         [ 2]  817 	ldw acc16,x  
      001905                        818 	_drop VSIZE
      00951D A1 95            [ 2]    1     addw sp,#VSIZE 
      00951F BB               [ 4]  819 	ret
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
      001908                        840 search_dict::
      001908                        841 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009520 95 CC            [ 2]    1     sub sp,#VSIZE 
      009522 95 DD            [ 2]  842 	ldw (YSAVE,sp),y 
      00190C                        843 search_next:
      009524 95 E9            [ 2]  844 	ldw (XSAVE,sp),x 
                                    845 ; get name length in dictionary	
      009526 96               [ 1]  846 	ld a,(x)
      009527 1C 96            [ 1]  847 	and a,#0xf 
      009529 2C 96            [ 1]  848 	ld (NLEN,sp),a  
      00952B 40 96            [ 2]  849 	ldw y,(YSAVE,sp) ; name pointer 
      00952D 53               [ 1]  850 	incw x 
      001916                        851 cp_loop:
      00952E 96 60            [ 1]  852 	ld a,(y)
      009530 96 6A            [ 1]  853 	jreq str_match 
      009532 4D 65            [ 1]  854 	tnz (NLEN,sp)
      009534 6D 6F            [ 1]  855 	jreq no_match  
      009536 72               [ 1]  856 	cp a,(x)
      009537 79 20            [ 1]  857 	jrne no_match 
      009539 66 75            [ 1]  858 	incw y 
      00953B 6C               [ 1]  859 	incw x
      00953C 6C 0A            [ 1]  860 	dec (NLEN,sp)
      00953E 00 73            [ 2]  861 	jra cp_loop 
      001928                        862 no_match:
      009540 79 6E            [ 2]  863 	ldw x,(XSAVE,sp) 
      009542 74 61 78         [ 2]  864 	subw x,#2 ; move X to link field
      009545 20 65            [ 1]  865 	push #TK_NONE 
      009547 72               [ 2]  866 	ldw x,(x) ; next word link 
      009548 72               [ 1]  867 	pop a ; TK_NONE 
      009549 6F 72            [ 1]  868 	jreq search_exit  ; not found  
                                    869 ;try next 
      00954B 0A 00            [ 2]  870 	jra search_next
      001935                        871 str_match:
      00954D 6D 61            [ 2]  872 	ldw x,(XSAVE,sp)
      00954F 74               [ 1]  873 	ld a,(X)
      009550 68 20            [ 1]  874 	ld (NLEN,sp),a ; needed to test keyword type  
      009552 6F 70            [ 1]  875 	and a,#NLEN_MASK 
                                    876 ; move x to procedure address field 	
      009554 65               [ 1]  877 	inc a 
      009555 72 61 74         [ 1]  878 	ld acc8,a 
      009558 69 6F 6E 20      [ 1]  879 	clr acc16 
      00955C 6F 76 65 72      [ 2]  880 	addw x,acc16 
      009560 66               [ 2]  881 	ldw x,(x) ; routine address  
                                    882 ;determine keyword type bits 7:4 
      009561 6C 6F            [ 1]  883 	ld a,(NLEN,sp)
      009563 77 0A            [ 1]  884 	and a,#KW_TYPE_MASK 
      009565 00               [ 1]  885 	swap a 
      009566 64 69            [ 1]  886 	add a,#128
      001950                        887 search_exit: 
      001950                        888 	_drop VSIZE 
      009568 76 69            [ 2]    1     addw sp,#VSIZE 
      00956A 73               [ 4]  889 	ret 
                                    890 
                                    891 ;---------------------
                                    892 ; check if next token
                                    893 ;  is of expected type 
                                    894 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    895 ;   A 		 expected token attribute
                                    896 ;  ouput:
                                    897 ;   none     if fail call syntax_error 
                                    898 ;--------------------
      001953                        899 expect:
      00956B 69               [ 1]  900 	push a 
      00956C 6F 6E 20         [ 4]  901 	call next_token 
      00956F 62 79            [ 1]  902 	cp a,(1,sp)
      009571 20 30            [ 1]  903 	jreq 1$
      009573 0A 00 69         [ 2]  904 	jp syntax_error
      009576 6E               [ 1]  905 1$: pop a 
      009577 76               [ 4]  906 	ret 
                                    907 
                                    908 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    909 ; parse arguments list 
                                    910 ; between ()
                                    911 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001960                        912 func_args:
      009578 61 6C            [ 1]  913 	ld a,#TK_LPAREN 
      00957A 69 64 20         [ 4]  914 	call expect 
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
      001965                        930 arg_list:
      00957D 6C 69            [ 1]  931 	push #0
      00957F 6E 65 20         [ 4]  932 1$:	call condition 
      009582 6E               [ 1]  933 	tnz a 
      009583 75 6D            [ 1]  934 	jreq 7$  
      009585 62 65            [ 1]  935 	inc (1,sp)
      009587 72 2E 0A         [ 4]  936 	call next_token 
      00958A 00 72            [ 1]  937 	cp a,#TK_COMMA 
      00958C 75 6E            [ 1]  938 	jreq 1$ 
      00958E 20 74            [ 1]  939 	cp a,#TK_RPAREN
      009590 69 6D            [ 1]  940 	jreq 7$
      00197A                        941 	_unget_token 
      009592 65 20 6F 6E 6C   [ 1]    1      mov in,in.saved  
      009597 79               [ 1]  942 7$:	pop a  
      009598 20               [ 4]  943 	ret 
                                    944 
                                    945 ;--------------------------------
                                    946 ;   BASIC commnands 
                                    947 ;--------------------------------
                                    948 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
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
      001981                        971 get_array_element:
      009599 75 73 61         [ 4]  972 	call func_args 
      00959C 67 65            [ 1]  973 	cp a,#1
      00959E 2E 0A            [ 1]  974 	jreq 1$
      0095A0 00 63 6F         [ 2]  975 	jp syntax_error
      00198B                        976 1$: _xpop 
      0095A3 6D 6D            [ 1]    1     ld a,(y)
      0095A5 61               [ 1]    2     ldw x,y 
      0095A6 6E 64            [ 2]    3     ldw x,(1,x)
      0095A8 20 6C 69 6E      [ 2]    4     addw y,#CELL_SIZE 
                                    977     ; ignore A, index < 65536 in any case 
                                    978 	; check for bounds 
      0095AC 65 20 6F         [ 2]  979 	cpw x,array_size 
      0095AF 6E 6C            [ 2]  980 	jrule 3$
                                    981 ; bounds {1..array_size}	
      0095B1 79 20            [ 1]  982 2$: ld a,#ERR_BAD_VALUE 
      0095B3 75 73 61         [ 2]  983 	jp tb_error 
      0095B6 67               [ 2]  984 3$: tnzw  x
      0095B7 65 2E            [ 1]  985 	jreq 2$ 
      0095B9 0A               [ 2]  986 	pushw x 
      0095BA 00               [ 2]  987 	sllw x 
      0095BB 64 75 70         [ 2]  988 	addw x,(1,sp) ; index*size_of(int24)
      0095BE 6C 69            [ 2]  989 	ldw (1,sp),x  
      0095C0 63 61 74         [ 2]  990 	ldw x,#tib ; array is below tib 
      0095C3 65 20 6E         [ 2]  991 	subw x,(1,sp)
      0019AE                        992 	_drop 2   
      0095C6 61 6D            [ 2]    1     addw sp,#2 
      0095C8 65               [ 4]  993 	ret 
                                    994 
                                    995 
                                    996 ;***********************************
                                    997 ;   expression parse,execute 
                                    998 ;***********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
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
      0019B1                       1009 factor:
      0019B1                       1010 	_vars VSIZE 
      0095C9 2E 0A            [ 2]    1     sub sp,#VSIZE 
      0095CB 00 46            [ 1] 1011 	clr (NEG,sp)
      0095CD 69 6C 65         [ 4] 1012 	call next_token
      0095D0 20               [ 1] 1013 	tnz a 
      0095D1 6E 6F            [ 1] 1014 	jrne 1$ 
      0095D3 74 20 66         [ 2] 1015 	jp 22$ 
      0095D6 6F 75            [ 1] 1016 1$:	cp a,#TK_PLUS 
      0095D8 6E 64            [ 1] 1017 	jreq 2$
      0095DA 2E 0A            [ 1] 1018 	cp a,#TK_MINUS 
      0095DC 00 62            [ 1] 1019 	jrne 4$ 
      0095DE 61 64            [ 1] 1020 	cpl (NEG,sp)
      0019C8                       1021 2$:	
      0095E0 20 76 61         [ 4] 1022 	call next_token
      0019CB                       1023 4$:
      0095E3 6C               [ 1] 1024 	tnz a 
      0095E4 75 65            [ 1] 1025 	jrne 41$ 
      0095E6 2E 0A 00         [ 2] 1026 	jp syntax_error  
      0019D1                       1027 41$:	
      0095E9 46 69            [ 1] 1028 	cp a,#TK_IFUNC 
      0095EB 6C 65            [ 1] 1029 	jrne 5$ 
      0019D5                       1030 	_get_code_addr 
      0095ED 20               [ 2]    1         ldw x,(x)
      0095EE 69 6E 20 65      [ 1]    2         inc in 
      0095F2 78 74 65 6E      [ 1]    3         inc in 
      0095F6 64               [ 4] 1031 	call (x); result in A:X  
      0095F7 65 64            [ 2] 1032 	jra 18$ 
      0019E1                       1033 5$:
      0095F9 20 6D            [ 1] 1034 	cp a,#TK_INTGR
      0095FB 65 6D            [ 1] 1035 	jrne 6$
      0095FD 6F 72 79         [ 4] 1036 	call get_int24 ; A:X
      009600 2C 20            [ 2] 1037 	jra 18$
      0019EA                       1038 6$:
      009602 63 61            [ 1] 1039 	cp a,#TK_ARRAY
      009604 6E 27            [ 1] 1040 	jrne 7$
      009606 74 20 62         [ 4] 1041 	call get_array_element
      009609 65 20            [ 2] 1042     jra 71$
      0019F3                       1043 7$:
      00960B 72 75            [ 1] 1044 	cp a,#TK_VAR 
      00960D 6E 20            [ 1] 1045 	jrne 8$
      00960F 66 72 6F         [ 4] 1046 	call get_addr 
      0019FA                       1047 71$: ; put value in A:X
      009612 6D               [ 1] 1048 	ld a,(x)
      009613 20 74            [ 2] 1049 	ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009615 68 65            [ 2] 1050 	jra 18$
      0019FF                       1051 8$:
      009617 72 65            [ 1] 1052 	cp a,#TK_LABEL 
      009619 2E 0A            [ 1] 1053 	jrne 9$
      00961B 00 4E            [ 2] 1054 	pushw y  
      00961D 6F               [ 2] 1055 	pushw x 
      00961E 20 64 61         [ 4] 1056 	call skip_string
      009621 74               [ 2] 1057 	popw x  
      009622 61 20 66         [ 4] 1058 	call strlen 
      009625 6F 75            [ 1] 1059 	add a,#REC_XTRA_BYTES
      009627 6E 64 2E         [ 4] 1060 	call search_name
      00962A 0A               [ 2] 1061 	tnzw x 
      00962B 00 4E            [ 1] 1062 	jrne 82$ 
      00962D 6F 20            [ 2] 1063 	popw y 
      00962F 70 72            [ 2] 1064 	jra 16$
      001A19                       1065 82$:
      009631 6F 67            [ 2] 1066 	popw y   
      009633 72 61 6D         [ 4] 1067 	call get_value ; in A:X 
      009636 20 69            [ 2] 1068 	jra 18$
      001A20                       1069 9$: 
      009638 6E 20            [ 1] 1070 	cp a,#TK_CFUNC 
      00963A 52 41            [ 1] 1071 	jrne 12$
      001A24                       1072 	_get_code_addr 
      00963C 4D               [ 2]    1         ldw x,(x)
      00963D 21 0A 00 46      [ 1]    2         inc in 
      009641 69 6C 65 20      [ 1]    3         inc in 
      009645 73               [ 4] 1073 	call(x)
      009646 79               [ 1] 1074 	clrw x 
      009647 73               [ 1] 1075 	rlwa x  ; char>int24 in A:X 
      009648 74 65            [ 2] 1076 	jra 18$ 	 
      001A32                       1077 12$:			
      00964A 6D 20            [ 1] 1078 	cp a,#TK_LPAREN
      00964C 66 75            [ 1] 1079 	jrne 16$
      00964E 6C 6C 2E         [ 4] 1080 	call expression
      009651 0A 00            [ 1] 1081 	ld a,#TK_RPAREN 
      009653 42 75 66         [ 4] 1082 	call expect
      001A3E                       1083 	_xpop 
      009656 66 65            [ 1]    1     ld a,(y)
      009658 72               [ 1]    2     ldw x,y 
      009659 20 66            [ 2]    3     ldw x,(1,x)
      00965B 75 6C 6C 0A      [ 2]    4     addw y,#CELL_SIZE 
      00965F 00 6F            [ 2] 1084 	jra 18$	
      001A49                       1085 16$:
      001A49                       1086 	_unget_token 
      009661 76 65 72 66 6C   [ 1]    1      mov in,in.saved  
      009666 6F               [ 1] 1087 	clr a 
      009667 77 0A            [ 2] 1088 	jra 22$ 
      001A51                       1089 18$: 
      009669 00 63            [ 1] 1090 	tnz (NEG,sp)
      00966B 6F 6E            [ 1] 1091 	jreq 20$
      00966D 73 74 61         [ 4] 1092 	call neg_ax   
      001A58                       1093 20$:
      001A58                       1094 	_xpush 
      009670 6E 74 20 63      [ 2]    1     subw y,#CELL_SIZE
      009674 61 6E            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009676 27 74 20         [ 2]    3     ldw (1,y),x 
      009679 62 65            [ 1] 1095 	ld a,#TK_INTGR
      001A63                       1096 22$:
      001A63                       1097 	_drop VSIZE
      00967B 20 6D            [ 2]    1     addw sp,#VSIZE 
      00967D 6F               [ 4] 1098 	ret
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
      001A66                       1109 term:
      001A66                       1110 	_vars VSIZE
      00967E 64 69            [ 2]    1     sub sp,#VSIZE 
                                   1111 ; first factor 	
      009680 66 69 65         [ 4] 1112 	call factor
      009683 64               [ 1] 1113 	tnz a 
      009684 0A 00            [ 1] 1114 	jreq term_exit  
      001A6E                       1115 term01:	 ; check for  operator '*'|'/'|'%' 
      009686 0A 72 75         [ 4] 1116 	call next_token
      009689 6E 20            [ 1] 1117 	ld (MULOP,sp),a
      00968B 74 69            [ 1] 1118 	and a,#TK_GRP_MASK
      00968D 6D 65            [ 1] 1119 	cp a,#TK_GRP_MULT
      00968F 20 65            [ 1] 1120 	jreq 1$
      009691 72 72            [ 1] 1121 	ld a,#TK_INTGR
      001A7B                       1122 	_unget_token 
      009693 6F 72 2C 20 00   [ 1]    1      mov in,in.saved  
      009698 0A 63            [ 2] 1123 	jra term_exit 
      001A82                       1124 1$:	; got *|/|%
                                   1125 ;second factor
      00969A 6F 6D 70         [ 4] 1126 	call factor
      00969D 69               [ 1] 1127 	tnz a 
      00969E 6C 65            [ 1] 1128 	jrne 2$ 
      0096A0 20 65 72         [ 2] 1129 	jp syntax_error 
      001A8B                       1130 2$: ; select operation 	
      0096A3 72 6F            [ 1] 1131 	ld a,(MULOP,sp) 
      0096A5 72 2C            [ 1] 1132 	cp a,#TK_MULT 
      0096A7 20 00            [ 1] 1133 	jrne 3$
                                   1134 ; '*' operator
      0096A9 6C 61 73         [ 4] 1135 	call mul24 
      0096AC 74 20            [ 2] 1136 	jra term01
      0096AE 74 6F            [ 1] 1137 3$: cp a,#TK_DIV 
      0096B0 6B 65            [ 1] 1138 	jrne 4$ 
                                   1139 ; '/' operator	
      0096B2 6E 20 69         [ 4] 1140 	call div24 
      0096B5 64 3A            [ 2] 1141 	jra term01 
      001A9F                       1142 4$: ; '%' operator
      0096B7 20 00 91         [ 4] 1143 	call mod24
      0096B9 20 CA            [ 2] 1144 	jra term01 
      001AA4                       1145 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0096B9 A6 02            [ 1] 1146 	ld a,#TK_INTGR
      0096BB                       1147 term_exit:
      001AA6                       1148 	_drop VSIZE 
      0096BB 72 0A            [ 2]    1     addw sp,#VSIZE 
      0096BD 00               [ 4] 1149 	ret 
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
      001AA9                       1160 expression:
      001AA9                       1161 	_vars VSIZE 
      0096BE 23 4C            [ 2]    1     sub sp,#VSIZE 
                                   1162 ; first term 	
      0096C0 88 AE 96         [ 4] 1163 	call term
      0096C3 86               [ 1] 1164 	tnz a 
      0096C4 CD 89            [ 1] 1165 	jreq 9$
      001AB1                       1166 1$:	; operator '+'|'-'
      0096C6 BB 84 AE         [ 4] 1167 	call next_token
      0096C9 95 0E            [ 1] 1168 	ld (OP,sp),a 
      0096CB 72 5F            [ 1] 1169 	and a,#TK_GRP_MASK
      0096CD 00 0E            [ 1] 1170 	cp a,#TK_GRP_ADD 
      0096CF 48 72            [ 1] 1171 	jreq 2$ 
      001ABC                       1172 	_unget_token 
      0096D1 59 00 0E C7 00   [ 1]    1      mov in,in.saved  
      0096D6 0F 72            [ 1] 1173 	ld a,#TK_INTGR
      0096D8 BB 00            [ 2] 1174 	jra 9$ 
      001AC5                       1175 2$: ; second term 
      0096DA 0E FE CD         [ 4] 1176 	call term
      0096DD 89               [ 1] 1177 	tnz a 
      0096DE BB CE            [ 1] 1178 	jrne 3$
      0096E0 00 05 C6         [ 2] 1179 	jp syntax_error
      001ACE                       1180 3$:
      0096E3 00 04            [ 1] 1181 	ld a,(OP,sp)
      0096E5 90 5F            [ 1] 1182 	cp a,#TK_PLUS 
      0096E7 90 02            [ 1] 1183 	jrne 4$
                                   1184 ; '+' operator	
      0096E9 CD 86 BA         [ 4] 1185 	call add24
      0096EC CE 00            [ 2] 1186 	jra 1$ 
      001AD9                       1187 4$:	; '-' operator 
      0096EE 05 C6 00         [ 4] 1188 	call sub24
      0096F1 02 CD            [ 2] 1189 	jra 1$
      001ADE                       1190 9$:
      001ADE                       1191 	_drop VSIZE 
      0096F3 A0 55            [ 2]    1     addw sp,#VSIZE 
      0096F5 AE               [ 4] 1192 	ret 
                                   1193 
                                   1194 ;---------------------------------------------
                                   1195 ; rel ::= expr rel_op expr
                                   1196 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



                                   1197 ;  relation return  integer , zero is false 
                                   1198 ;  output:
                                   1199 ;	 xstack		value  
                                   1200 ;---------------------------------------------
                           000001  1201 	RELOP=1
                           000001  1202 	VSIZE=1 
      001AE1                       1203 relation: 
      001AE1                       1204 	_vars VSIZE
      0096F6 96 A9            [ 2]    1     sub sp,#VSIZE 
      0096F8 CD 89 BB         [ 4] 1205 	call expression
      0096FB C6               [ 1] 1206 	tnz a 
      0096FC 00 03            [ 1] 1207 	jreq 9$ 
                                   1208 ; expect rel_op or leave 
      0096FE 5F 97 72         [ 4] 1209 	call next_token 
      009701 BB 00            [ 1] 1210 	ld (RELOP,sp),a 
      009703 05 F6            [ 1] 1211 	and a,#TK_GRP_MASK
      009705 5F 97            [ 1] 1212 	cp a,#TK_GRP_RELOP 
      009707 CD 98            [ 1] 1213 	jreq 2$
      009709 65 20            [ 1] 1214 	ld a,#TK_INTGR 
      001AF6                       1215 	_unget_token 
      00970B 35 00 02 00 01   [ 1]    1      mov in,in.saved  
      00970C 20 40            [ 2] 1216 	jra 9$ 
      001AFD                       1217 2$:	; expect another expression
      00970C 88 AE 96         [ 4] 1218 	call expression
      00970F 98               [ 1] 1219 	tnz a 
      009710 CD 89            [ 1] 1220 	jrne 3$
      009712 BB 84 AE         [ 2] 1221 	jp syntax_error 
      001B06                       1222 3$: 
      009715 95 0E 72         [ 4] 1223 	call cp24 
      001B09                       1224 	_xpop  
      009718 5F 00            [ 1]    1     ld a,(y)
      00971A 0E               [ 1]    2     ldw x,y 
      00971B 48 72            [ 2]    3     ldw x,(1,x)
      00971D 59 00 0E C7      [ 2]    4     addw y,#CELL_SIZE 
      009721 00               [ 1] 1225 	tnz a 
      009722 0F 72            [ 1] 1226 	jrmi 4$
      009724 BB 00            [ 1] 1227 	jrne 5$
      009726 0E FE CD 89      [ 1] 1228 	mov acc8,#2 ; i1==i2
      00972A BB AE            [ 2] 1229 	jra 6$ 
      001B1D                       1230 4$: ; i1<i2
      00972C 16 90 CD 89      [ 1] 1231 	mov acc8,#4 
      009730 BB A6            [ 2] 1232 	jra 6$
      001B23                       1233 5$: ; i1>i2
      009732 0D CD 89 5E      [ 1] 1234 	mov acc8,#1  
      001B27                       1235 6$: ; 0=false, -1=true 
      009736 CE               [ 1] 1236 	clrw x 
      009737 00 01 CD         [ 1] 1237 	ld a, acc8  
      00973A 8A 28            [ 1] 1238 	and a,(RELOP,sp)
      00973C A6 5E            [ 1] 1239 	jreq 7$
      00973E CD               [ 2] 1240 	cplw x 
      00973F 89 5E            [ 1] 1241 	ld a,#255 
      001B32                       1242 7$:	_xpush 
      009741 AE 17 FF 94      [ 2]    1     subw y,#CELL_SIZE
      009745 90 F7            [ 1]    2     ld (y),a 
      009745 CD 94 CF         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009748 A6 84            [ 1] 1243 	ld a,#TK_INTGR
      001B3D                       1244 9$: 
      001B3D                       1245 	_drop VSIZE
      009748 A6 0D            [ 2]    1     addw sp,#VSIZE 
      00974A CD               [ 4] 1246 	ret 
                                   1247 
                                   1248 ;-------------------------------------------
                                   1249 ;  AND factor:  [NOT] relation | (condition)
                                   1250 ;  output:
                                   1251 ;     A      TK_INTGR|0
                                   1252 ;-------------------------------------------
                           000001  1253 	NOT_OP=1
      001B40                       1254 and_factor:
      00974B 89 5E            [ 1] 1255 	push #0 
      00974D A6 3E CD         [ 4] 1256 0$:	call next_token  
      009750 89               [ 1] 1257 	tnz a 
      009751 5E CD            [ 1] 1258 	jreq 8$ 
      009753 8A C0            [ 1] 1259 	cp a,#TK_NOT 
      009755 72 5D            [ 1] 1260 	jrne 1$ 
      009757 00 04            [ 1] 1261 	cpl (NOT_OP,sp)
      009759 27 ED            [ 2] 1262 	jra 0$ 
      001B50                       1263 1$:	
      00975B CD 90            [ 1] 1264 	cp a,#TK_LPAREN 
      00975D E9 72            [ 1] 1265 	jrne 2$
      00975F 5D 00 04         [ 4] 1266 	call condition
      009762 27 E4            [ 1] 1267 	ld a,#TK_RPAREN 
      009764 CD 19 53         [ 4] 1268 	call expect
      009764 C6 00            [ 2] 1269 	jra 3$
      001B5E                       1270 2$: _unget_token 
      009766 02 C1 00 04 2B   [ 1]    1      mov in,in.saved  
      00976B 1D 1A E1         [ 4] 1271 	call relation
      00976C                       1272 3$:
      00976C 72 01            [ 1] 1273 	tnz (NOT_OP,sp)
      00976E 00 23            [ 1] 1274 	jreq 8$ 
      009770 D7 CE 00         [ 4] 1275 	call cpl24
      001B6D                       1276 8$:
      001B6D                       1277 	_drop 1  
      009773 05 72            [ 2]    1     addw sp,#1 
      009775 BB               [ 4] 1278     ret 
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
      001B70                       1289 and_cond:
      009776 00 01 C3         [ 4] 1290 	call and_factor
      009779 00               [ 1] 1291 	tnz a 
      00977A 1E 2A            [ 1] 1292 	jreq 9$  
      00977C C8 CF 00         [ 4] 1293 1$: call next_token 
      00977F 05               [ 1] 1294 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009780 E6 02            [ 1] 1295 	jreq 6$ 
      009782 C7 00            [ 1] 1296 	cp a,#TK_AND 
      009784 04 35            [ 1] 1297 	jreq 3$
      001B80                       1298 	_unget_token 
      009786 03 00 02 00 01   [ 1]    1      mov in,in.saved  
      009789 20 38            [ 2] 1299 	jra 6$ 
      009789 CD 98 1D         [ 4] 1300 3$:	call and_factor  
      00978C A1               [ 1] 1301 	tnz a 
      00978D 00 27            [ 1] 1302 	jrne 4$
      00978F DC A1 80         [ 2] 1303 	jp syntax_error 
      001B90                       1304 4$:	
      001B90                       1305 	_xpop 
      009792 26 0C            [ 1]    1     ld a,(y)
      009794 FE               [ 1]    2     ldw x,y 
      009795 72 5C            [ 2]    3     ldw x,(1,x)
      009797 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00979B 00 02 FD         [ 1] 1306 	ld acc24,a 
      00979E 20 E9 0D         [ 2] 1307 	ldw acc16,x
      0097A0                       1308 	_xpop 
      0097A0 A1 85            [ 1]    1     ld a,(y)
      0097A2 26               [ 1]    2     ldw x,y 
      0097A3 05 CD            [ 2]    3     ldw x,(1,x)
      0097A5 9D 14 20 E0      [ 2]    4     addw y,#CELL_SIZE 
      0097A9 C4 00 0C         [ 1] 1309 	and a,acc24 
      0097A9 A1               [ 1] 1310 	rlwa x 
      0097AA 05 26 05         [ 1] 1311 	and a,acc16 
      0097AD CD               [ 1] 1312 	rlwa x 
      0097AE 9D 0F 20         [ 1] 1313 	and a,acc8 
      0097B1 D7               [ 1] 1314 	rlwa x
      0097B2                       1315 	_xpush
      0097B2 A1 03 26 05      [ 2]    1     subw y,#CELL_SIZE
      0097B6 CD 97            [ 1]    2     ld (y),a 
      0097B8 C2 20 CE         [ 2]    3     ldw (1,y),x 
      0097BB 20 B7            [ 2] 1316 	jra 1$  
      0097BB A1 0A            [ 1] 1317 6$: ld a,#TK_INTGR 
      0097BD 27               [ 4] 1318 9$:	ret 	 
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
      001BC2                       1332 condition:
      001BC2                       1333 	_vars VSIZE 
      0097BE CA CC            [ 2]    1     sub sp,#VSIZE 
      0097C0 96 B9 70         [ 4] 1334 	call and_cond
      0097C2 4D               [ 1] 1335 	tnz a 
      0097C2 52 04            [ 1] 1336 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      0097C4 1F 01 0F         [ 4] 1337 1$:	call next_token 
      0097C7 03 CD            [ 1] 1338 	cp a,#TK_OR 
      0097C9 98 36            [ 1] 1339 	jreq 2$
      0097CB CE 00            [ 1] 1340 	cp a,#TK_XOR
      0097CD 05 72            [ 1] 1341 	jreq 2$ 
      001BD5                       1342 	_unget_token 
      0097CF BB 00 01 F6 A1   [ 1]    1      mov in,in.saved  
      0097D4 32 26            [ 2] 1343 	jra 8$ 
      0097D6 43 72            [ 1] 1344 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097D8 5C 00 02         [ 4] 1345 	call and_cond
      0097DB CD 9C            [ 1] 1346 	cp a,#TK_INTGR 
      0097DD 42 A1            [ 1] 1347 	jreq 3$
      0097DF 84 27 03         [ 2] 1348 	jp syntax_error 
      001BE8                       1349 3$:	 
      001BE8                       1350 	_xpop  ; rigth arg 
      0097E2 CC 96            [ 1]    1     ld a,(y)
      0097E4 B9               [ 1]    2     ldw x,y 
      0097E5 EE 01            [ 2]    3     ldw x,(1,x)
      0097E5 1E 01 CD 93      [ 2]    4     addw y,#CELL_SIZE 
      0097E9 D9 AB 05         [ 1] 1351 	ld acc24,a 
      0097EC 6B 04 CD         [ 2] 1352 	ldw acc16,x 
      001BF7                       1353 	_xpop  ; left arg  
      0097EF 9D EA            [ 1]    1     ld a,(y)
      0097F1 5D               [ 1]    2     ldw x,y 
      0097F2 27 EE            [ 2]    3     ldw x,(1,x)
      0097F4 F6 2A 05 A6      [ 2]    4     addw y,#CELL_SIZE 
      0097F8 11 CC            [ 1] 1354 	ld (ATMP,sp),a 
      0097FA 96 BB            [ 1] 1355 	ld a,(OP,sp)
      0097FC A1 8A            [ 1] 1356 	cp a,#TK_XOR 
      0097FC 72 FB            [ 1] 1357 	jreq 5$ 
      001C08                       1358 4$: ; A:X OR acc24   
      0097FE 03 1D            [ 1] 1359 	ld a,(ATMP,sp)
      009800 00 03 CF         [ 1] 1360 	or a,acc24 
      009803 00               [ 1] 1361 	rlwa x 
      009804 1A 90 F6         [ 1] 1362 	or a,acc16 
      009807 93               [ 1] 1363 	rlwa x 
      009808 EE 01 72         [ 1] 1364 	or a,acc8 
      00980B A9               [ 1] 1365 	rlwa x 
      00980C 00 03            [ 2] 1366 	jra 6$  
      001C18                       1367 5$: ; A:X XOR acc24 
      00980E 72 C7            [ 1] 1368 	ld a,(ATMP,sp)
      009810 00 1A 72         [ 1] 1369 	xor a,acc24 
      009813 5C               [ 1] 1370 	rlwa x 
      009814 00 1B 72         [ 1] 1371 	xor a,acc16 
      009817 CF               [ 1] 1372 	rlwa x 
      009818 00 1A 5B         [ 1] 1373 	xor a,acc8 
      00981B 04               [ 1] 1374 	rlwa x 
      001C26                       1375 6$: _xpush
      00981C 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00981D 90 F7            [ 1]    2     ld (y),a 
      00981D C6 00 02         [ 2]    3     ldw (1,y),x 
      009820 C7 00            [ 2] 1376 	jra 1$ 
      009822 03 C0            [ 1] 1377 8$:	ld a,#TK_INTGR 
      001C33                       1378 9$:	_drop VSIZE 
      009824 00 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009826 27               [ 4] 1379 	ret 
                                   1380 
                                   1381 
                                   1382 ;--------------------------------------------
                                   1383 ; BASIC: HEX 
                                   1384 ; select hexadecimal base for integer print
                                   1385 ;---------------------------------------------
      001C36                       1386 hex_base:
      009827 0D 10 00 0A      [ 1] 1387 	mov base,#16 
      009828 81               [ 4] 1388 	ret 
                                   1389 
                                   1390 ;--------------------------------------------
                                   1391 ; BASIC: DEC 
                                   1392 ; select decimal base for integer print
                                   1393 ;---------------------------------------------
      001C3B                       1394 dec_base:
      009828 CE 00 05 72      [ 1] 1395 	mov base,#10
      00982C BB               [ 4] 1396 	ret 
                                   1397 
                                   1398 ;------------------------
                                   1399 ; BASIC: FREE 
                                   1400 ; return free size in RAM 
                                   1401 ; output:
                                   1402 ;   A:x		size 
                                   1403 ;--------------------------
      001C40                       1404 free:
      00982D 00               [ 1] 1405 	clr a 
      00982E 01 F6 5C         [ 2] 1406 	ldw x,#tib 
      009831 72 5C 00 02      [ 2] 1407 	subw x,dvar_end 
      009835 81               [ 4] 1408 	ret 
                                   1409 
                                   1410 ;------------------------------
                                   1411 ; BASIC: SIZE 
                                   1412 ; command that print 
                                   1413 ; program start addres and size 
                                   1414 ;------------------------------
      009836                       1415 cmd_size:
      009836 F6 27 03         [ 1] 1416 	push base 
      009839 5C 20 FA         [ 2] 1417 	ldw x,#PROG_ADDR 
      00983C 5C 72 B0         [ 4] 1418 	call puts 
      00983F 00 05 CF         [ 2] 1419 	ldw x,txtbgn     
      009842 00 01 81 0A      [ 1] 1420 	mov base,#16 
      009845 CD 17 E5         [ 4] 1421 	call prt_i16
      009845 FE 72 5C         [ 1] 1422 	pop base 
      009848 00 02 72         [ 2] 1423 	ldw x,#PROG_SIZE 
      00984B 5C 00 02         [ 4] 1424 	call puts 
      00984E 81 00 1D         [ 2] 1425 	ldw x,txtend 
      00984F 72 B0 00 1B      [ 2] 1426 	subw x,txtbgn 
      00984F F6 EE 01         [ 4] 1427 	call prt_i16
      009852 72 5C 00         [ 2] 1428 	ldw x,#STR_BYTES 
      009855 02 72 5C         [ 4] 1429 	call puts  
      009858 00               [ 4] 1430 	ret 
                                   1431 
                                   1432 
                                   1433 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1434 ; BASIC: UBOUND  
                                   1435 ; return array variable size 
                                   1436 ; and set 'array_size' variable 
                                   1437 ; output:
                                   1438 ;   A:X 	array_size
                                   1439 ;--------------------------
      001C76                       1440 ubound:
      009859 02 72 5C         [ 4] 1441 	call free 
      00985C 00 02            [ 1] 1442 	ld a,#CELL_SIZE 
      00985E 81               [ 2] 1443 	div x,a 
      00985F CF 00 20         [ 2] 1444 	ldw array_size,x
      00985F F6               [ 1] 1445 	clr a 
      009860 72               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;-----------------------------
                                   1449 ; BASIC: LET var=expr 
                                   1450 ; variable assignement 
                                   1451 ; output:
                                   1452 ;   A 		TK_NONE 
                                   1453 ;-----------------------------
      001C81                       1454 let::
      009861 5C 00 02         [ 4] 1455 	call next_token 
      009864 81 85            [ 1] 1456 	cp a,#TK_VAR 
      009865 27 0C            [ 1] 1457 	jreq let_var
      009865 72 5F            [ 1] 1458 	cp a,#TK_ARRAY 
      009867 00 0D            [ 1] 1459 	jreq  let_array
      009869 CF 00 0E         [ 2] 1460 	jp syntax_error
      001C8F                       1461 let_array:
      00986C A6 10 C1         [ 4] 1462 	call get_array_element
      00986F 00 0B            [ 2] 1463 	jra let_eval 
      001C94                       1464 let_var:
      009871 27 09 72         [ 4] 1465 	call get_addr
      001C97                       1466 let_eval:
      009874 0F 00 0E         [ 2] 1467 	ldw ptr16,x  ; variable address 
      009877 04 72 53         [ 4] 1468 	call next_token 
      00987A 00 0D            [ 1] 1469 	cp a,#TK_EQUAL
      00987C 27 03            [ 1] 1470 	jreq 1$
      00987C A6 FF CD         [ 2] 1471 	jp syntax_error
      001CA4                       1472 1$:	
      00987F 98 A2 CD         [ 4] 1473 	call condition   
      009882 91 93            [ 1] 1474 	cp a,#TK_INTGR 
      009884 88 CD            [ 1] 1475 	jreq 2$
      009886 89 BB 84         [ 2] 1476 	jp syntax_error
      001CAE                       1477 2$:	
      001CAE                       1478 	_xpop ; value 
      009889 81 F6            [ 1]    1     ld a,(y)
      00988A 93               [ 1]    2     ldw x,y 
      00988A 90 F6            [ 2]    3     ldw x,(1,x)
      00988C 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      001CB7                       1479 3$:
      009890 A9 00 03 C7      [ 4] 1480 	ld [ptr16],a
      009894 00 0D CF 00      [ 1] 1481 	inc ptr8  
      009898 0E CD 98 7C      [ 5] 1482 	ldw [ptr16],x 
      00989C A6               [ 4] 1483 	ret 
                                   1484 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
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
      001CC4                       1494 get_value: ; -- i 
      00989D 20               [ 1] 1495 	ld a,(x) ; record size 
      00989E CD 89            [ 1] 1496 	and a,#NAME_MAX_LEN
      0098A0 5E 81            [ 1] 1497 	sub a,#CELL_SIZE ; * value 
      0098A2 88               [ 1] 1498 	push a 
      0098A2 52 04            [ 1] 1499 	push #0 
      0098A4 0F 02 0F         [ 2] 1500 	addw x,(1,sp)
      0098A7 01               [ 1] 1501 	ld a,(x)
      0098A8 4D 27            [ 2] 1502 	ldw x,(1,x)
      001CD2                       1503 	_drop 2
      0098AA 11 C6            [ 2]    1     addw sp,#2 
      0098AC 00               [ 4] 1504 	ret 
                                   1505 
                                   1506 
                                   1507 ;--------------------------
                                   1508 ; list constants in EEPROM 
                                   1509 ; call when using LIST \C 
                                   1510 ;-------------------------
                           000001  1511 	COUNT=1
                           000003  1512 	YTEMP=3
                           000004  1513 	VSIZE=4 
      001CD5                       1514 list_const:
      0098AD 0B A1            [ 2] 1515 	pushw y 
      001CD7                       1516 	_vars 4 
      0098AF 0A 26            [ 2]    1     sub sp,#4 
      0098B1 0A               [ 1] 1517 	clrw x 
      0098B2 72 0F            [ 2] 1518 	ldw (COUNT,sp),x  
      0098B4 00 0D 05 03      [ 2] 1519 	ldw Y,#EEPROM_BASE 
      0098B8 01 CD 82 8D      [ 2] 1520 1$:	cpw y,free_eeprom 
      0098BC 24 35            [ 1] 1521 	jruge 9$
      0098BC AE 16            [ 2] 1522     ldw (YTEMP,sp),y 
      0098BE 90               [ 1] 1523 	ldw x,y
      0098BF 1C               [ 1] 1524 	incw x 
      0098C0 00 50 5A         [ 4] 1525 	call puts  
      0098C3 7F 3D            [ 1] 1526 	ld a,#'= 
      0098C4 CD 08 DE         [ 4] 1527 	call putc 
      0098C4 C6 00            [ 2] 1528 	ldw x,(YTEMP,sp)
      0098C6 0B CD 83         [ 4] 1529 	call get_value 
      0098C9 59 AB 30         [ 1] 1530 	ld acc24,a 
      0098CC A1 3A 2B         [ 2] 1531 	ldw acc16,x 
      0098CF 02 AB 07         [ 4] 1532 	call prt_acc24
      0098D2 A6 0D            [ 1] 1533 	ld a,#CR 
      0098D2 5A F7 0C         [ 4] 1534 	call putc 
      0098D5 02 C6            [ 2] 1535 	ldw x,(COUNT,sp)
      0098D7 00               [ 1] 1536 	incw x 
      0098D8 0D CA            [ 2] 1537 	ldw (COUNT,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      0098DA 00 0E CA 00      [ 1] 1538 	clr acc16 
      0098DE 0F 26            [ 2] 1539 	ldw y,(YTEMP,sp)
      0098E0 E3 C6            [ 1] 1540 	ld a,(y)
      0098E2 00 0B A1         [ 1] 1541 	ld acc8,a
      0098E5 10 27 08 7B      [ 2] 1542 	addw y,acc16 
      0098E9 01 27            [ 2] 1543 	jra 1$ 
      001D1B                       1544 9$:	
      0098EB 0A A6            [ 2] 1545 	ldw x,(COUNT,sp)
      0098ED 2D 20 02         [ 4] 1546 	call prt_i16 
      0098F0 AE 1D 2B         [ 2] 1547 	ldw x,#CONST_COUNT 
      0098F0 A6 24 5A         [ 4] 1548 	call puts 
      001D26                       1549 	_drop VSIZE 
      0098F3 F7 0C            [ 2]    1     addw sp,#VSIZE 
      0098F5 02 85            [ 2] 1550 	popw y 
      0098F6 81               [ 4] 1551 	ret 
                                   1552 
      0098F6 7B 02 5B 04 81 74 61  1553 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1554 
                                   1555 
                                   1556 ;--------------------------
                                   1557 ; BASIC: EEFREE 
                                   1558 ; eeprom_free 
                                   1559 ; search end of data  
                                   1560 ; in EEPROM 
                                   1561 ; input:
                                   1562 ;    none 
                                   1563 ; output:
                                   1564 ;    A:X     address free
                                   1565 ;-------------------------
      0098FB                       1566 func_eefree:
      0098FB A1 61 2A         [ 2] 1567 	ldw x,#EEPROM_BASE 
      0098FE 01 81 A1 7A      [ 1] 1568 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009902 22 FB A0         [ 2] 1569     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009905 20 81            [ 1] 1570 	jruge 8$ ; no free space 
      009907 F6               [ 1] 1571 2$: ld a,(x)
      009907 52 05            [ 1] 1572 	jrne 3$
      009909 1F               [ 1] 1573 	incw x 
      00990A 04 4F 5F 72      [ 1] 1574 	dec acc8 
      00990E A2 00            [ 1] 1575 	jrne 2$
      009910 03 90 F7         [ 2] 1576 	subw x,#8 
      009913 90 EF            [ 2] 1577 	jra 9$  
      009915 01               [ 1] 1578 3$: ld a,(x)
      009916 0F               [ 1] 1579 	incw x
      009917 01               [ 1] 1580 	tnz a  
      009918 A6 0A            [ 1] 1581 	jrne 3$
      00991A 6B               [ 2] 1582 	decw x   
      00991B 02 1E            [ 2] 1583 	jra 1$ 
      00991D 04               [ 1] 1584 8$: clrw x ; no free space 
      00991E F6               [ 1] 1585 9$: clr a 
      00991F 27 4E A1         [ 2] 1586 	ldw free_eeprom,x ; save in system variable 
      009922 2D               [ 4] 1587 	ret 
                                   1588 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



                           000005  1589 REC_XTRA_BYTES=5 
                                   1590 ;--------------------------
                                   1591 ; search constant/dim_var name 
                                   1592 ; format of record  
                                   1593 ;   .byte record length 
                                   1594 ;         = strlen(name)+5 
                                   1595 ;   .asciz name (variable length)
                                   1596 ;   .int24 value (3 bytes )
                                   1597 ; a constant record use 7+ bytes
                                   1598 ; constants are saved in EEPROM  
                                   1599 ; input:
                                   1600 ;    A     record_len 
                                   1601 ;    X     *name
                                   1602 ; output:
                                   1603 ;    X     address|0
                                   1604 ; use:
                                   1605 ;   A,Y, acc16 
                                   1606 ;-------------------------
                           000001  1607 	NAMEPTR=1 ; target name pointer 
                           000003  1608 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1609 	RECLEN=5  ; record length of target
                           000007  1610 	LIMIT=7   ; search area limit 
                           000008  1611 	VSIZE=8  
      001D6A                       1612 search_name:
      009923 26 04            [ 2] 1613 	pushw y 
      001D6C                       1614 	_vars VSIZE
      009925 03 01            [ 2]    1     sub sp,#VSIZE 
      009927 20 08 A1 24      [ 1] 1615 	clr acc16 
      00992B 26 08            [ 1] 1616 	ld (RECLEN,sp),a    
      00992D A6 10            [ 2] 1617 	ldw (NAMEPTR,sp),x
      00992F 6B 02 5C         [ 2] 1618 	ldw x,dvar_end 
      009932 1F 04            [ 2] 1619 	ldw (LIMIT,sp),x 
      009934 F6 CE 00 30      [ 2] 1620 	ldw y,dvar_bgn
      009935 17 03            [ 2] 1621 1$:	ldw (WLKPTR,sp),y
      009935 A1               [ 1] 1622 	ldw x,y 
      009936 61 2B            [ 2] 1623 	cpw x, (LIMIT,sp) 
      009938 02 A0            [ 1] 1624 	jruge 7$ ; no match found 
      00993A 20 A1            [ 1] 1625 	ld a,(y)
      00993C 30 2B            [ 1] 1626 	and a,#NAME_MAX_LEN
      00993E 30 A0            [ 1] 1627 	cp a,(RECLEN,sp)
      009940 30 A1            [ 1] 1628 	jrne 2$ 
      009942 0A 2B            [ 1] 1629 	incw y 
      009944 06 A0            [ 2] 1630 	ldw x,(NAMEPTR,sp)
      009946 07 11 02         [ 4] 1631 	call strcmp
      009949 2A 24            [ 1] 1632 	jrne 8$ ; match found 
      001D97                       1633 2$: ; skip this one 	
      00994B 6B 03            [ 2] 1634 	ldW Y,(WLKPTR,sp)
      00994D 7B 02            [ 1] 1635 	ld a,(y)
      00994F CD 82            [ 1] 1636 	and a,#NAME_MAX_LEN 
      009951 AA 72 A2         [ 1] 1637 	ld acc8,a 
      009954 00 03 90 F7      [ 2] 1638 	addw y,acc16 
      009958 90 EF            [ 2] 1639 	jra 1$  
      001DA6                       1640 7$: ; no match found 
      00995A 01 5F            [ 1] 1641 	clr (WLKPTR,sp)
      00995C 7B 03            [ 1] 1642 	clr (WLKPTR+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      001DAA                       1643 8$: ; match found 
      00995E 02 72            [ 2] 1644 	ldw x,(WLKPTR,sp) ; record address 
      001DAC                       1645 9$:	_DROP VSIZE
      009960 A2 00            [ 2]    1     addw sp,#VSIZE 
      009962 03 90            [ 2] 1646 	popw y 
      009964 F7               [ 4] 1647 	 ret 
                                   1648 
                                   1649 ;--------------------------------------------
                                   1650 ; BASIC: CONST name=value [, name=value]*
                                   1651 ; define constant(s) saved in EEPROM
                                   1652 ; share most of his code with cmd_dim 
                                   1653 ;--------------------------------------------
                           000001  1654 	VAR_NAME=1 
                           000003  1655 	REC_LEN=3
                           000005  1656 	RONLY=5
                           000005  1657 	VSIZE=5
      001DB1                       1658 cmd_const:
      009965 90 EF 01 CD 81   [ 2] 1659 	btjt flags,#FRUN,0$
      00996A EE 1E            [ 1] 1660 	ld a,#ERR_RUN_ONLY
      00996C 04 20 C2         [ 2] 1661 	jp tb_error 
      001DBB                       1662 0$: 
      001DBB                       1663 	_vars VSIZE 
      00996F 0D 01            [ 2]    1     sub sp,#VSIZE 
      009971 27 03            [ 1] 1664 	ld a,#128 
      009973 CD 82            [ 1] 1665 	ld (RONLY,sp),a 
      009975 73 03            [ 1] 1666 	clr (REC_LEN,sp)
      009976 20 10            [ 2] 1667 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1668 
                                   1669 ;---------------------------------
                                   1670 ; BASIC: DIM var_name [var_name]* 
                                   1671 ; create named variables at end 
                                   1672 ; of BASIC program. 
                                   1673 ; These variables are initialized 
                                   1674 ; to 0. 
                                   1675 ; record format same ast CONST 
                                   1676 ; but r/w because stored in RAM 
                                   1677 ;---------------------------------
      001DC5                       1678 cmd_dim:
      009976 90 F6 93 EE 01   [ 2] 1679 	btjt flags,#FRUN,cmd_dim1
      00997B 72 A9            [ 1] 1680 	ld a,#ERR_RUN_ONLY
      00997D 00 03 C7         [ 2] 1681 	jp tb_error 
      001DCF                       1682 cmd_dim1:	
      001DCF                       1683 	_vars VSIZE
      009980 00 0D            [ 2]    1     sub sp,#VSIZE 
      009982 CF 00            [ 1] 1684 	clr (REC_LEN,sp )
      009984 0E 5B            [ 1] 1685 	clr (RONLY,sp)
      001DD5                       1686 cmd_dim2: 
      009986 05 81 9D         [ 4] 1687 0$:	call next_token 
      009988 A1 03            [ 1] 1688 	cp a,#TK_LABEL  
      009988 52 05            [ 1] 1689 	jreq 1$ 
      00998A 17 04 39         [ 2] 1690 	jp syntax_error 
      00998C 1F 01            [ 2] 1691 1$: ldw (VAR_NAME,sp),x ; name pointer 
      00998C 1F 02 F6         [ 4] 1692 	call strlen
      00998F A4 0F            [ 1] 1693 	add a,#REC_XTRA_BYTES
      009991 6B 01            [ 1] 1694 	ld (REC_LEN+1,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009993 16 04 5C         [ 4] 1695 	call skip_string 
      009996 7B 04            [ 1] 1696 	ld a,(REC_LEN+1,sp)
      009996 90 F6            [ 2] 1697 	ldw x,(VAR_NAME,sp) 
      009998 27 1B 0D         [ 4] 1698 	call search_name  
      00999B 01               [ 2] 1699 	tnzw x 
      00999C 27 0A            [ 1] 1700 	jreq 2$
      00999E F1 26            [ 1] 1701 	ld a,#ERR_DUPLICATE
      0099A0 07 90 5C         [ 2] 1702 	jp tb_error  
      0099A3 5C 0A 01         [ 2] 1703 2$:	ldw x,dvar_end 
      0099A6 20 EE            [ 1] 1704 	ld a,(REC_LEN+1,sp)
      0099A8 1A 05            [ 1] 1705 	or a,(RONLY,sp)
      0099A8 1E               [ 1] 1706 	ld (x),a 
      0099A9 02               [ 1] 1707 	incw x 
      0099AA 1D 00            [ 2] 1708 	pushw y 
      0099AC 02 4B            [ 2] 1709 	ldw y,(VAR_NAME+2,sp)
      0099AE 00 FE 84         [ 4] 1710 	call strcpy
      0099B1 27 1D            [ 2] 1711 	popw y 
      0099B3 20               [ 2] 1712 	decw x
      0099B4 D7 FB 03         [ 2] 1713 	addw x,(REC_LEN,sp)
      0099B5 CF 00 32         [ 2] 1714 	ldw dvar_end,x 
      0099B5 1E 02 F6         [ 2] 1715 	subw x,#CELL_SIZE  
      0099B8 6B               [ 1] 1716 	clr (x)
      0099B9 01 A4            [ 1] 1717 	clr (1,x)  
      0099BB 0F 4C            [ 1] 1718 	clr (2,x)
      0099BD C7 00 0F         [ 4] 1719 4$: call next_token 
      0099C0 72 5F            [ 1] 1720 	cp a,#TK_COMMA 
      0099C2 00 0E            [ 1] 1721 	jreq 0$ 
      0099C4 72 BB            [ 1] 1722 	cp a,#TK_EQUAL 
      0099C6 00 0E            [ 1] 1723 	jrne 8$
                                   1724 ; initialize variable 
      0099C8 FE 7B 01         [ 4] 1725 	call condition 
      0099CB A4 F0            [ 1] 1726 	cp a,#TK_INTGR
      0099CD 4E AB            [ 1] 1727 	jreq 5$
      0099CF 80 16 39         [ 2] 1728 	jp syntax_error
      0099D0 CE 00 32         [ 2] 1729 5$: ldw x,dvar_end 
      0099D0 5B 05 81         [ 2] 1730 	subw x,#CELL_SIZE 
      0099D3 CF 00 19         [ 2] 1731 	ldw ptr16,x 
      001E39                       1732 	_xpop 
      0099D3 88 CD            [ 1]    1     ld a,(y)
      0099D5 98               [ 1]    2     ldw x,y 
      0099D6 1D 11            [ 2]    3     ldw x,(1,x)
      0099D8 01 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      0099DC 96 B9 84 81      [ 4] 1733 	ld [ptr16],a 
      0099E0 72 5C 00 1A      [ 1] 1734 	inc ptr8 
      0099E0 A6 06 CD 99      [ 5] 1735 	ldw [ptr16],x 
      0099E4 D3 CB            [ 2] 1736 	jra 4$ 
      0099E5                       1737 8$:	
      001E50                       1738 	_unget_token 	
      0099E5 4B 00 CD 9C 42   [ 1]    1      mov in,in.saved  
      001E55                       1739 	_drop VSIZE 
      0099EA 4D 27            [ 2]    1     addw sp,#VSIZE 
      0099EC 12 0C 01         [ 4] 1740 	call ubound 
      0099EF CD               [ 4] 1741 	ret 
                                   1742 
                                   1743 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   1744 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1745 ; return program size 
                                   1746 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E5B                       1747 prog_size:
      0099F0 98 1D A1         [ 2] 1748 	ldw x,txtend 
      0099F3 08 27 F1 A1      [ 2] 1749 	subw x,txtbgn 
      0099F7 07               [ 4] 1750 	ret 
                                   1751 
                                   1752 ;----------------------------
                                   1753 ; print program information 
                                   1754 ;---------------------------
      001E63                       1755 program_info: 
      0099F8 27 05 55         [ 2] 1756 	ldw x,#PROG_ADDR 
      0099FB 00 03 00         [ 4] 1757 	call puts 
      0099FE 02 84 81         [ 2] 1758 	ldw x,txtbgn 
      009A01 35 10 00 0A      [ 1] 1759 	mov base,#16 
      009A01 CD 99 E0         [ 4] 1760 	call prt_i16
      009A04 A1 01 27 03      [ 1] 1761 	mov base,#10  
      009A08 CC 96 B9         [ 2] 1762 	ldw x,#PROG_SIZE
      009A0B 90 F6 93         [ 4] 1763 	call puts 
      009A0E EE 01 72         [ 4] 1764 	call prog_size 
      009A11 A9 00 03         [ 4] 1765 	call prt_i16 
      009A14 C3 00 21         [ 2] 1766 	ldw x,#STR_BYTES 
      009A17 23 05 A6         [ 4] 1767 	call puts
      009A1A 0A CC 96         [ 2] 1768 	ldw x,txtbgn
      009A1D BB 5D 27         [ 2] 1769 	cpw x,#app 
      009A20 F8 89            [ 1] 1770 	jrult 2$
      009A22 58 72 FB         [ 2] 1771 	ldw x,#FLASH_MEM 
      009A25 01 1F            [ 2] 1772 	jra 3$
      009A27 01 AE 16         [ 2] 1773 2$: ldw x,#RAM_MEM 	 
      009A2A 90 72 F0         [ 4] 1774 3$:	call puts 
      009A2D 01 5B            [ 1] 1775 	ld a,#CR 
      009A2F 02 81 DE         [ 4] 1776 	call putc
      009A31 81               [ 4] 1777 	ret 
                                   1778 
      009A31 52 01 0F 01 CD 98 1D  1779 PROG_ADDR: .asciz "program address: "
             4D 26 03 CC 9A E3 A1
             10 27 06 A1
      009A43 11 26 05 03 01 67 72  1780 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A48 20 62 79 74 65 73 00  1781 STR_BYTES: .asciz " bytes" 
      009A48 CD 98 1D 20 46 4C 41  1782 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A4B 20 69 6E 20 52 41 4D  1783 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1784 
                                   1785 
                                   1786 ;----------------------------
                                   1787 ; BASIC: LIST [[start][,end]]
                                   1788 ; list program lines 
                                   1789 ; form start to end 
                                   1790 ; if empty argument list then 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1791 ; list all.
                                   1792 ;----------------------------
                           000001  1793 	FIRST=1
                           000003  1794 	LAST=3 
                           000005  1795 	LN_PTR=5
                           000006  1796 	VSIZE=6 
      001EEC                       1797 list:
      009A4B 4D 26 03 CC 96   [ 2] 1798 	btjf flags,#FRUN,0$
      009A50 B9 07            [ 1] 1799 	ld a,#ERR_CMD_ONLY
      009A51 CC 16 3B         [ 2] 1800 	jp tb_error
      001EF6                       1801 0$:	 
      009A51 A1 81 26         [ 4] 1802 	call next_token 
      009A54 0C FE            [ 1] 1803 	cp a,#TK_CHAR 
      009A56 72 5C            [ 1] 1804 	jrne 2$
      009A58 00 02 72         [ 4] 1805 	call get_char 
      009A5B 5C 00            [ 1] 1806 	and a,#0xDF 
      009A5D 02 FD            [ 1] 1807 	cp a,#'C 
      009A5F 20 70            [ 1] 1808 	jrne 1$
      009A61 CD 1C D5         [ 4] 1809 	call list_const
      009A61 A1               [ 4] 1810 	ret 
      009A62 84 26 05         [ 2] 1811 1$: jp syntax_error 
      001F0D                       1812 2$:	_unget_token 
      009A65 CD 98 4F 20 67   [ 1]    1      mov in,in.saved  
      009A6A CD 1E 5B         [ 4] 1813 	call prog_size 
      009A6A A1 05            [ 1] 1814 	jrugt 3$
      009A6C 26               [ 4] 1815 	ret 
      001F18                       1816 3$: _vars VSIZE
      009A6D 05 CD            [ 2]    1     sub sp,#VSIZE 
      009A6F 9A 01 20         [ 2] 1817 	ldw x,txtbgn 
      009A72 07 05            [ 2] 1818 	ldw (LN_PTR,sp),x 
      009A73 FE               [ 2] 1819 	ldw x,(x) 
      009A73 A1 85            [ 2] 1820 	ldw (FIRST,sp),x ; list from first line 
      009A75 26 08 CD         [ 2] 1821 	ldw x,#MAX_LINENO ; biggest line number 
      009A78 98 45            [ 2] 1822 	ldw (LAST,sp),x 
      009A7A CD 19 65         [ 4] 1823 	call arg_list
      009A7A F6               [ 1] 1824 	tnz a
      009A7B EE 01            [ 1] 1825 	jreq list_loop 
      009A7D 20 52            [ 1] 1826 	cp a,#2 
      009A7F 27 07            [ 1] 1827 	jreq 4$
      009A7F A1 03            [ 1] 1828 	cp a,#1 
      009A81 26 1D            [ 1] 1829 	jreq first_line 
      009A83 90 89 89         [ 2] 1830 	jp syntax_error 
      009A86 CD               [ 2] 1831 4$:	popw x 
      009A87 98 36            [ 2] 1832 	ldw (LAST+2,sp),x 
      001F3B                       1833 first_line:
      009A89 85               [ 2] 1834 	popw x
      009A8A CD 93            [ 2] 1835 	ldw (FIRST,sp),x 
      001F3E                       1836 lines_skip:
      009A8C D9 AB 05         [ 2] 1837 	ldw x,txtbgn
      009A8F CD 9D            [ 2] 1838 2$:	ldw (LN_PTR,sp),x 
      009A91 EA 5D 26         [ 2] 1839 	cpw x,txtend 
      009A94 04 90            [ 1] 1840 	jrpl list_exit 
      009A96 85               [ 2] 1841 	ldw x,(x) ;line# 
      009A97 20 30            [ 2] 1842 	cpw x,(FIRST,sp)
      009A99 2A 11            [ 1] 1843 	jrpl list_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009A99 90 85            [ 2] 1844 	ldw x,(LN_PTR,sp) 
      009A9B CD 9D            [ 1] 1845 	ld a,(2,x)
      009A9D 44 20 31         [ 1] 1846 	ld acc8,a 
      009AA0 72 5F 00 0D      [ 1] 1847 	clr acc16 
      009AA0 A1 82 26 0E      [ 2] 1848 	addw x,acc16
      009AA4 FE 72            [ 2] 1849 	jra 2$ 
                                   1850 ; print loop
      001F5E                       1851 list_loop:
      009AA6 5C 00            [ 2] 1852 	ldw x,(LN_PTR,sp)
      009AA8 02 72            [ 1] 1853 	ld a,(2,x) 
      009AAA 5C 00 02         [ 4] 1854 	call prt_basic_line
      009AAD FD 5F            [ 2] 1855 	ldw x,(LN_PTR,sp)
      009AAF 02 20            [ 1] 1856 	ld a,(2,x)
      009AB1 1F 00 0E         [ 1] 1857 	ld acc8,a 
      009AB2 72 5F 00 0D      [ 1] 1858 	clr acc16 
      009AB2 A1 06 26 13      [ 2] 1859 	addw x,acc16
      009AB6 CD 9B 29         [ 2] 1860 	cpw x,txtend 
      009AB9 A6 07            [ 1] 1861 	jrpl list_exit
      009ABB CD 99            [ 2] 1862 	ldw (LN_PTR,sp),x
      009ABD D3               [ 2] 1863 	ldw x,(x)
      009ABE 90 F6            [ 2] 1864 	cpw x,(LAST,sp)  
      009AC0 93 EE            [ 1] 1865 	jrslt list_loop
      001F80                       1866 list_exit:
      009AC2 01 72 A9 00 03   [ 1] 1867 	mov in,count 
      009AC7 20 08 E0         [ 2] 1868 	ldw x,#pad 
      009AC9 CF 00 04         [ 2] 1869 	ldw basicptr,x 
      001F8B                       1870 	_drop VSIZE 
      009AC9 55 00            [ 2]    1     addw sp,#VSIZE 
      009ACB 03 00 02         [ 4] 1871 	call program_info 
      009ACE 4F               [ 4] 1872 	ret
                                   1873 
                                   1874 
                                   1875 ;--------------------------
                                   1876 ; BASIC: EDIT 
                                   1877 ;  copy program in FLASH 
                                   1878 ;  to RAM for edition 
                                   1879 ;-------------------------
      001F91                       1880 edit:
      009ACF 20 12 E1         [ 4] 1881 	call qsign 
      009AD1 27 07            [ 1] 1882 	jreq 1$ 
      009AD1 0D 01 27         [ 2] 1883 	ldw x,#NOT_SAVED 
      009AD4 03 CD 82         [ 4] 1884 	call puts 
      009AD7 85               [ 4] 1885 	ret 
      009AD8                       1886 1$: 
      009AD8 72 A2 00 03      [ 2] 1887 	ldw y,#app_sign ; source address 
      009ADC 90 F7 90         [ 2] 1888     ldw x,app_size  
      009ADF EF 01 A6         [ 2] 1889 	addw x,#4 
      009AE2 84 00 0D         [ 2] 1890 	ldw acc16,x  ; bytes to copy 
      009AE3 AE 00 8C         [ 2] 1891 	ldw x,#rsign ; destination address 
      009AE3 5B 01 81         [ 4] 1892 	call move  
      009AE6 AE 00 90         [ 2] 1893 	ldw x,#free_ram 
      009AE6 52 01 CD         [ 2] 1894 	ldw txtbgn,x 
      009AE9 9A 31 4D 27      [ 2] 1895 	addw x,rsize  
      009AED 38 00 1D         [ 2] 1896 	ldw txtend,x 
      009AEE 81               [ 4] 1897 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1898 
      009AEE CD 98 1D 6B 01 A4 30  1899 NOT_SAVED: .asciz "No application saved.\n"
             A1 20 27 09 A6 84 55
             00 03 00 02 20 24 2E
             0A 00
                                   1900 
                                   1901 
                                   1902 ;--------------------------
                                   1903 ; decompile line from token list
                                   1904 ; and print it. 
                                   1905 ; input:
                                   1906 ;   A       stop at this position 
                                   1907 ;   X 		pointer at line
                                   1908 ; output:
                                   1909 ;   none 
                                   1910 ;--------------------------	
      009B02                       1911 prt_basic_line:
      009B02 CD 9A            [ 2] 1912 	pushw y 
      009B04 31 4D 26         [ 1] 1913 	ld count,a 
      009B07 03 CC            [ 1] 1914 	ld a,(2,x)
      009B09 96 B9 03         [ 1] 1915 	cp a,count 
      009B0B 2A 03            [ 1] 1916 	jrpl 1$ 
      009B0B 7B 01 A1         [ 1] 1917 	ld count,a 
      009B0E 20 26 05         [ 2] 1918 1$:	ldw basicptr,x 
      009B11 CD 82 E9 20      [ 2] 1919 	ldw y,#tib  
      009B15 D8 A1 21         [ 4] 1920 	call decompile 
      009B18 26 05 CD         [ 4] 1921 	call puts 
      009B1B 83 77            [ 1] 1922 	ld a,#CR 
      009B1D 20 CF DE         [ 4] 1923 	call putc 
      009B1F 90 85            [ 2] 1924 	popw y 
      009B1F CD               [ 4] 1925 	ret 
                                   1926 
                                   1927 
                                   1928 ;---------------------------------
                                   1929 ; BASIC: PRINT|? arg_list 
                                   1930 ; print values from argument list
                                   1931 ;----------------------------------
                           000001  1932 	CCOMMA=1
                           000001  1933 	VSIZE=1
      001FF9                       1934 print:
      001FF9                       1935 	_vars VSIZE 
      009B20 84 11            [ 2]    1     sub sp,#VSIZE 
      001FFB                       1936 reset_comma:
      009B22 20 CA            [ 1] 1937 	clr (CCOMMA,sp)
      009B24                       1938 prt_loop:
      009B24 A6 84 9D         [ 4] 1939 	call next_token
      009B26 A1 02            [ 1] 1940 	cp a,#CMD_END 
      009B26 5B 01            [ 1] 1941 	jrult 0$
      009B28 81 0A            [ 1] 1942 	cp a,#TK_COLON 
      009B29 27 04            [ 1] 1943 	jreq 0$
      009B29 52 01            [ 1] 1944 	cp a,#TK_CMD
      009B2B CD 9A            [ 1] 1945 	jrne 10$
      00200C                       1946 0$:
      00200C                       1947 	_unget_token 
      009B2D E6 4D 27 2D 01   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009B31 20 63            [ 2] 1948 	jra 8$ 
      002013                       1949 10$:	
      009B31 CD 98            [ 1] 1950 	cp a,#TK_QSTR
      009B33 1D 6B            [ 1] 1951 	jreq 1$
      009B35 01 A4            [ 1] 1952 	cp a,#TK_CHAR 
      009B37 30 A1            [ 1] 1953 	jreq 2$ 
      009B39 10 27            [ 1] 1954 	cp a,#TK_CFUNC 
      009B3B 09 55            [ 1] 1955 	jreq 3$
      009B3D 00 03            [ 1] 1956 	cp a,#TK_COMMA 
      009B3F 00 02            [ 1] 1957 	jreq 4$
      009B41 A6 84            [ 1] 1958 	cp a,#TK_SHARP 
      009B43 20 19            [ 1] 1959 	jreq 5$
      009B45 20 3D            [ 2] 1960 	jra 7$ 
      002029                       1961 1$:	; print string 
      009B45 CD 9A E6         [ 4] 1962 	call puts
      009B48 4D               [ 1] 1963 	incw x
      009B49 26 03 CC 96      [ 2] 1964 	subw x,basicptr 
      009B4D B9 00 00         [ 2] 1965 	ldw in.w,x  
      009B4E 20 C5            [ 2] 1966 	jra reset_comma
      002036                       1967 2$:	; print character 
      009B4E 7B 01 A1         [ 4] 1968 	call get_char 
      009B51 10 26 05         [ 4] 1969 	call putc 
      009B54 CD 81            [ 2] 1970 	jra reset_comma 
      00203E                       1971 3$: ; print character function value  	
      00203E                       1972 	_get_code_addr 
      009B56 EE               [ 2]    1         ldw x,(x)
      009B57 20 D8 00 01      [ 1]    2         inc in 
      009B59 72 5C 00 01      [ 1]    3         inc in 
      009B59 CD               [ 4] 1973 	call (x)
      009B5A 82 0B 20         [ 4] 1974 	call putc
      009B5D D3 AE            [ 2] 1975 	jra reset_comma 
      009B5E                       1976 4$: ; set comma state 
      009B5E 5B 01            [ 1] 1977 	cpl (CCOMMA,sp)
      009B60 81 AC            [ 2] 1978 	jra prt_loop   
      009B61                       1979 5$: ; # character must be followed by an integer   
      009B61 52 01 CD         [ 4] 1980 	call next_token
      009B64 9B 29            [ 1] 1981 	cp a,#TK_INTGR 
      009B66 4D 27            [ 1] 1982 	jreq 6$
      009B68 54 CD 98         [ 2] 1983 	jp syntax_error 
      00205B                       1984 6$: ; set tab width
      009B6B 1D 6B 01         [ 4] 1985 	call get_int24 
      009B6E A4               [ 1] 1986 	ld a,xl 
      009B6F 30 A1            [ 1] 1987 	and a,#15 
      009B71 30 27 09         [ 1] 1988 	ld tab_width,a 
      009B74 A6 84            [ 2] 1989 	jra reset_comma 
      002066                       1990 7$:	
      002066                       1991 	_unget_token 
      009B76 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009B7B 20 40 C2         [ 4] 1992 	call condition
      009B7D 4D               [ 1] 1993 	tnz a 
      009B7D CD 9B            [ 1] 1994 	jreq 8$    
      009B7F 29 4D 26         [ 4] 1995     call print_top
      009B82 03 CC            [ 2] 1996 	jra reset_comma 
      002076                       1997 8$:
      009B84 96 B9            [ 1] 1998 	tnz (CCOMMA,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009B86 26 05            [ 1] 1999 	jrne 9$
      009B86 CD 82            [ 1] 2000 	ld a,#CR 
      009B88 28 90 F6         [ 4] 2001     call putc 
      00207F                       2002 9$:	_drop VSIZE 
      009B8B 93 EE            [ 2]    1     addw sp,#VSIZE 
      009B8D 01               [ 4] 2003 	ret 
                                   2004 
                                   2005 ;----------------------
                                   2006 ; 'save_context' and
                                   2007 ; 'rest_context' must be 
                                   2008 ; called at the same 
                                   2009 ; call stack depth 
                                   2010 ; i.e. SP must have the 
                                   2011 ; save value at  
                                   2012 ; entry point of both 
                                   2013 ; routine. 
                                   2014 ;---------------------
                           000004  2015 	CTXT_SIZE=4 ; size of saved data 
                                   2016 ;--------------------
                                   2017 ; save current BASIC
                                   2018 ; interpreter context 
                                   2019 ; on stack 
                                   2020 ;--------------------
      002082                       2021 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002082                       2022 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002082                       2023 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002082                       2024 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002082                       2025 save_context:
      009B8E 72 A9 00         [ 2] 2026 	ldw x,basicptr 
      009B91 03 4D            [ 2] 2027 	ldw (BPTR,sp),x
      009B93 2B 08 26         [ 1] 2028 	ld a,in 
      009B96 0C 35            [ 1] 2029 	ld (IN,sp),a
      009B98 02 00 0F         [ 1] 2030 	ld a,count 
      009B9B 20 0A            [ 1] 2031 	ld (CNT,sp),a  
      009B9D 81               [ 4] 2032 	ret
                                   2033 
                                   2034 ;-----------------------
                                   2035 ; restore previously saved 
                                   2036 ; BASIC interpreter context 
                                   2037 ; from stack 
                                   2038 ;-------------------------
      002092                       2039 rest_context:
      009B9D 35 04            [ 2] 2040 	ldw x,(BPTR,sp)
      009B9F 00 0F 20         [ 2] 2041 	ldw basicptr,x 
      009BA2 04 05            [ 1] 2042 	ld a,(IN,sp)
      009BA3 C7 00 01         [ 1] 2043 	ld in,a
      009BA3 35 01            [ 1] 2044 	ld a,(CNT,sp)
      009BA5 00 0F 03         [ 1] 2045 	ld count,a  
      009BA7 81               [ 4] 2046 	ret
                                   2047 
                                   2048 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   2049 
                                   2050 ;------------------------------------------
                                   2051 ; BASIC: INPUT [string]var[,[string]var]
                                   2052 ; input value in variables 
                                   2053 ; [string] optionally can be used as prompt 
                                   2054 ;-----------------------------------------
                           000001  2055 	CX_BPTR=1
                           000003  2056 	CX_IN=3
                           000004  2057 	CX_CNT=4
                           000005  2058 	SKIP=5
                           000005  2059 	VSIZE=5
      0020A2                       2060 input_var:
      009BA7 5F C6            [ 2] 2061 	pushw y 
      0020A4                       2062 	_vars VSIZE 
      009BA9 00 0F            [ 2]    1     sub sp,#VSIZE 
      0020A6                       2063 input_loop:
      009BAB 14 01            [ 1] 2064 	clr (SKIP,sp)
      009BAD 27 03 53         [ 4] 2065 	call next_token 
      009BB0 A6 FF            [ 1] 2066 	cp a,#TK_QSTR 
      009BB2 72 A2            [ 1] 2067 	jrne 1$ 
      009BB4 00 03 90         [ 4] 2068 	call puts 
      009BB7 F7               [ 1] 2069 	incw x 
      009BB8 90 EF 01 A6      [ 2] 2070 	subw x,basicptr 
      009BBC 84 00 00         [ 2] 2071 	ldw in.w,x 
      009BBD 03 05            [ 1] 2072 	cpl (SKIP,sp)
      009BBD 5B 01 81         [ 4] 2073 	call next_token 
      009BC0 A1 85            [ 1] 2074 1$: cp a,#TK_VAR  
      009BC0 4B 00            [ 1] 2075 	jreq 2$ 
      009BC2 CD 98 1D         [ 2] 2076 	jp syntax_error
      009BC5 4D 27 25         [ 4] 2077 2$:	call get_addr
      009BC8 A1 87 26         [ 2] 2078 	ldw ptr16,x 
      009BCB 04 03            [ 1] 2079 	tnz (SKIP,sp)
      009BCD 01 20            [ 1] 2080 	jrne 21$ 
      009BCF F2 11 6B         [ 4] 2081 	call var_name 
      009BD0 CD 08 DE         [ 4] 2082 	call putc   
      0020D6                       2083 21$:
      009BD0 A1 06            [ 1] 2084 	ld a,#':
      009BD2 26 0A CD         [ 4] 2085 	call putc 
      009BD5 9C 42 A6         [ 4] 2086 	call save_context 
      009BD8 07 CD 99 D3      [ 1] 2087 	clr count  
      009BDC 20 08 55         [ 4] 2088 	call readln 
      009BDF 00 03 00         [ 2] 2089 	ldw x,#tib 
      009BE2 02 CD 9B         [ 1] 2090 	push count
      009BE5 61 00            [ 1] 2091 	push #0 
      009BE6 72 FB 01         [ 2] 2092 	addw x,(1,sp)
      009BE6 0D               [ 1] 2093 	incw x 
      0020F1                       2094 	_drop 2 
      009BE7 01 27            [ 2]    1     addw sp,#2 
      009BE9 03 CD 82 6A      [ 1] 2095 	clr in 
      009BED CD 0E B5         [ 4] 2096 	call get_token
      009BED 5B 01            [ 1] 2097 	cp a,#TK_INTGR
      009BEF 81 14            [ 1] 2098 	jreq 3$ 
      009BF0 A1 11            [ 1] 2099 	cp a,#TK_MINUS
      009BF0 CD 9B            [ 1] 2100 	jrne 22$
      009BF2 C0 4D 27         [ 4] 2101 	call get_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009BF5 4B CD            [ 1] 2102 	cp a,#TK_INTGR 
      009BF7 98 1D            [ 1] 2103 	jreq 23$
      002109                       2104 22$:
      009BF9 4D 27 43         [ 4] 2105 	call rest_context 
      009BFC A1 88 27         [ 2] 2106 	jp syntax_error
      00210F                       2107 23$:
      009BFF 07 55 00         [ 4] 2108 	call neg_acc24	
      002112                       2109 3$: 
      009C02 03 00 02         [ 1] 2110 	ld a,acc24 
      009C05 20 38 CD         [ 2] 2111 	ldw x,acc16 
      009C08 9B C0 4D 26      [ 4] 2112 	ld [ptr16],a
      009C0C 03 CC 96 B9      [ 1] 2113 	inc ptr8  
      009C10 72 CF 00 19      [ 5] 2114 	ldw [ptr16],x 
      009C10 90 F6 93         [ 4] 2115 	call rest_context
      009C13 EE 01 72         [ 4] 2116 	call next_token 
      009C16 A9 00            [ 1] 2117 	cp a,#TK_COMMA
      009C18 03 C7            [ 1] 2118 	jrne 4$ 
      009C1A 00 0D CF         [ 2] 2119 	jp input_loop
      002131                       2120 4$:
      009C1D 00 0E            [ 1] 2121 	cp a,#TK_NONE 
      009C1F 90 F6            [ 1] 2122 	jreq input_exit  
      009C21 93 EE            [ 1] 2123 	cp a,#TK_COLON 
      009C23 01 72            [ 1] 2124     jreq input_exit 
      009C25 A9 00 03         [ 2] 2125 	jp syntax_error 
      00213C                       2126 input_exit:
      00213C                       2127 	_drop VSIZE 
      009C28 C4 00            [ 2]    1     addw sp,#VSIZE 
      009C2A 0D 02            [ 2] 2128 	popw y 
      009C2C C4               [ 4] 2129 	ret 
                                   2130 
                                   2131 
                                   2132 ;---------------------
                                   2133 ; BASIC: REM | ' 
                                   2134 ; skip comment to end of line 
                                   2135 ;---------------------- 
      002141                       2136 remark::
      009C2D 00 0E 02 C4 00   [ 1] 2137 	mov in,count 
      009C32 0F               [ 4] 2138  	ret 
                                   2139 
                                   2140 
                                   2141 ;---------------------
                                   2142 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2143 ; read in loop 'addr'  
                                   2144 ; apply & 'mask' to value 
                                   2145 ; loop while result==0.  
                                   2146 ; 'xor_mask' is used to 
                                   2147 ; invert the wait logic.
                                   2148 ; i.e. loop while not 0.
                                   2149 ;---------------------
                           000001  2150 	XMASK=1 
                           000002  2151 	MASK=2
                           000003  2152 	ADDR=3
                           000004  2153 	VSIZE=4
      002147                       2154 wait: 
      002147                       2155 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009C33 02 72            [ 2]    1     sub sp,#VSIZE 
      009C35 A2 00            [ 1] 2156 	clr (XMASK,sp) 
      009C37 03 90 F7         [ 4] 2157 	call arg_list 
      009C3A 90 EF            [ 1] 2158 	cp a,#2
      009C3C 01 20            [ 1] 2159 	jruge 0$
      009C3E B7 A6 84         [ 2] 2160 	jp syntax_error 
      009C41 81 03            [ 1] 2161 0$:	cp a,#3
      009C42 25 0C            [ 1] 2162 	jrult 1$
      002159                       2163 	_xpop  ; xor mask 
      009C42 52 02            [ 1]    1     ld a,(y)
      009C44 CD               [ 1]    2     ldw x,y 
      009C45 9B F0            [ 2]    3     ldw x,(1,x)
      009C47 4D 27 69 CD      [ 2]    4     addw y,#CELL_SIZE 
      009C4B 98               [ 1] 2164 	ld a,xl 
      009C4C 1D A1            [ 1] 2165 	ld (XMASK,sp),a 
      002165                       2166 1$: _xpop ; mask
      009C4E 89 27            [ 1]    1     ld a,(y)
      009C50 0B               [ 1]    2     ldw x,y 
      009C51 A1 8A            [ 2]    3     ldw x,(1,x)
      009C53 27 07 55 00      [ 2]    4     addw y,#CELL_SIZE 
      009C57 03               [ 1] 2167     ld a,xl  
      009C58 00 02            [ 1] 2168 	ld (MASK,sp),a 
      002171                       2169 	_xpop ; address 
      009C5A 20 55            [ 1]    1     ld a,(y)
      009C5C 6B               [ 1]    2     ldw x,y 
      009C5D 02 CD            [ 2]    3     ldw x,(1,x)
      009C5F 9B F0 A1 84      [ 2]    4     addw y,#CELL_SIZE 
      009C63 27               [ 1] 2170 2$:	ld a,(x)
      009C64 03 CC            [ 1] 2171 	and a,(MASK,sp)
      009C66 96 B9            [ 1] 2172 	xor a,(XMASK,sp)
      009C68 27 F9            [ 1] 2173 	jreq 2$ 
      002181                       2174 	_drop VSIZE 
      009C68 90 F6            [ 2]    1     addw sp,#VSIZE 
      009C6A 93               [ 4] 2175 	ret 
                                   2176 
                                   2177 ;---------------------
                                   2178 ; BASIC: BSET addr,mask
                                   2179 ; set bits at 'addr' corresponding 
                                   2180 ; to those of 'mask' that are at 1.
                                   2181 ; arguments:
                                   2182 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2183 ;   mask        mask|addr
                                   2184 ; output:
                                   2185 ;	none 
                                   2186 ;--------------------------
      002184                       2187 bit_set:
      009C6B EE 01 72         [ 4] 2188 	call arg_list 
      009C6E A9 00            [ 1] 2189 	cp a,#2	 
      009C70 03 C7            [ 1] 2190 	jreq 1$ 
      009C72 00 0D CF         [ 2] 2191 	jp syntax_error
      00218E                       2192 1$: 
      00218E                       2193 	_xpop ; mask 
      009C75 00 0E            [ 1]    1     ld a,(y)
      009C77 90               [ 1]    2     ldw x,y 
      009C78 F6 93            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009C7A EE 01 72 A9      [ 2]    4     addw y,#CELL_SIZE 
      009C7E 00               [ 1] 2194 	ld a,xl
      009C7F 03               [ 1] 2195 	push a  
      002199                       2196 	_xpop ; addr  
      009C80 6B 01            [ 1]    1     ld a,(y)
      009C82 7B               [ 1]    2     ldw x,y 
      009C83 02 A1            [ 2]    3     ldw x,(1,x)
      009C85 8A 27 10 03      [ 2]    4     addw y,#CELL_SIZE 
      009C88 84               [ 1] 2197 	pop a 
      009C88 7B               [ 1] 2198 	or a,(x)
      009C89 01               [ 1] 2199 	ld (x),a
      009C8A CA               [ 4] 2200 	ret 
                                   2201 
                                   2202 ;---------------------
                                   2203 ; BASIC: BRES addr,mask
                                   2204 ; reset bits at 'addr' corresponding 
                                   2205 ; to those of 'mask' that are at 1.
                                   2206 ; arguments:
                                   2207 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2208 ;   mask	    ~mask&*addr  
                                   2209 ; output:
                                   2210 ;	none 
                                   2211 ;--------------------------
      0021A6                       2212 bit_reset:
      009C8B 00 0D 02         [ 4] 2213 	call arg_list 
      009C8E CA 00            [ 1] 2214 	cp a,#2  
      009C90 0E 02            [ 1] 2215 	jreq 1$ 
      009C92 CA 00 0F         [ 2] 2216 	jp syntax_error
      0021B0                       2217 1$: 
      0021B0                       2218 	_xpop ; mask 
      009C95 02 20            [ 1]    1     ld a,(y)
      009C97 0E               [ 1]    2     ldw x,y 
      009C98 EE 01            [ 2]    3     ldw x,(1,x)
      009C98 7B 01 C8 00      [ 2]    4     addw y,#CELL_SIZE 
      009C9C 0D               [ 1] 2219 	ld a,xl 
      009C9D 02               [ 1] 2220 	cpl a
      009C9E C8               [ 1] 2221 	push a  
      0021BC                       2222 	_xpop ; addr  
      009C9F 00 0E            [ 1]    1     ld a,(y)
      009CA1 02               [ 1]    2     ldw x,y 
      009CA2 C8 00            [ 2]    3     ldw x,(1,x)
      009CA4 0F 02 72 A2      [ 2]    4     addw y,#CELL_SIZE 
      009CA8 00               [ 1] 2223 	pop a 
      009CA9 03               [ 1] 2224 	and a,(x)
      009CAA 90               [ 1] 2225 	ld (x),a 
      009CAB F7               [ 4] 2226 	ret 
                                   2227 
                                   2228 ;---------------------
                                   2229 ; BASIC: BTOGL addr,mask
                                   2230 ; toggle bits at 'addr' corresponding 
                                   2231 ; to those of 'mask' that are at 1.
                                   2232 ; arguments:
                                   2233 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2234 ;   mask	    mask^*addr  
                                   2235 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2236 ;	none 
                                   2237 ;--------------------------
      0021C9                       2238 bit_toggle:
      009CAC 90 EF 01         [ 4] 2239 	call arg_list 
      009CAF 20 99            [ 1] 2240 	cp a,#2 
      009CB1 A6 84            [ 1] 2241 	jreq 1$ 
      009CB3 5B 02 81         [ 2] 2242 	jp syntax_error
      009CB6                       2243 1$: _xpop ; mask 
      009CB6 35 10            [ 1]    1     ld a,(y)
      009CB8 00               [ 1]    2     ldw x,y 
      009CB9 0B 81            [ 2]    3     ldw x,(1,x)
      009CBB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CBB 35               [ 1] 2244 	ld a,xl
      009CBC 0A               [ 1] 2245 	push a 
      0021DE                       2246 	_xpop  ; addr  
      009CBD 00 0B            [ 1]    1     ld a,(y)
      009CBF 81               [ 1]    2     ldw x,y 
      009CC0 EE 01            [ 2]    3     ldw x,(1,x)
      009CC0 4F AE 16 90      [ 2]    4     addw y,#CELL_SIZE 
      009CC4 72               [ 1] 2247 	pop a 
      009CC5 B0               [ 1] 2248 	xor a,(x)
      009CC6 00               [ 1] 2249 	ld (x),a 
      009CC7 33               [ 4] 2250 	ret 
                                   2251 
                                   2252 
                                   2253 ;---------------------
                                   2254 ; BASIC: BTEST(addr,bit)
                                   2255 ; return bit value at 'addr' 
                                   2256 ; bit is in range {0..7}.
                                   2257 ; arguments:
                                   2258 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2259 ;   bit 	    bit position {0..7}  
                                   2260 ; output:
                                   2261 ;	A:X       bit value  
                                   2262 ;--------------------------
      0021EB                       2263 bit_test:
      009CC8 81 19 60         [ 4] 2264 	call func_args 
      009CC9 A1 02            [ 1] 2265 	cp a,#2
      009CC9 3B 00            [ 1] 2266 	jreq 0$
      009CCB 0B AE 9F         [ 2] 2267 	jp syntax_error
      0021F5                       2268 0$:	
      0021F5                       2269 	_xpop 
      009CCE 22 CD            [ 1]    1     ld a,(y)
      009CD0 89               [ 1]    2     ldw x,y 
      009CD1 BB CE            [ 2]    3     ldw x,(1,x)
      009CD3 00 1C 35 10      [ 2]    4     addw y,#CELL_SIZE 
      009CD7 00               [ 1] 2270 	ld a,xl 
      009CD8 0B CD            [ 1] 2271 	and a,#7
      009CDA 98               [ 1] 2272 	push a   
      009CDB 65 32            [ 1] 2273 	ld a,#1 
      009CDD 00 0B            [ 1] 2274 1$: tnz (1,sp)
      009CDF AE 9F            [ 1] 2275 	jreq 2$
      009CE1 34               [ 1] 2276 	sll a 
      009CE2 CD 89            [ 1] 2277 	dec (1,sp)
      009CE4 BB CE            [ 2] 2278 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009CE6 00 1E            [ 1] 2279 2$: ld (1,sp),a  
      00220F                       2280 	_xpop ; address  
      009CE8 72 B0            [ 1]    1     ld a,(y)
      009CEA 00               [ 1]    2     ldw x,y 
      009CEB 1C CD            [ 2]    3     ldw x,(1,x)
      009CED 98 65 AE 9F      [ 2]    4     addw y,#CELL_SIZE 
      009CF1 45               [ 1] 2281 	pop a 
      009CF2 CD               [ 1] 2282 	and a,(x)
      009CF3 89 BB            [ 1] 2283 	jreq 3$
      009CF5 81 01            [ 1] 2284 	ld a,#1 
      009CF6 5F               [ 1] 2285 3$:	clrw x 
      009CF6 CD               [ 1] 2286 	ld xl,a
      009CF7 9C               [ 1] 2287 	clr a  
      009CF8 C0               [ 4] 2288 	ret
                                   2289 
                                   2290 ;--------------------
                                   2291 ; BASIC: POKE addr,byte
                                   2292 ; put a byte at addr 
                                   2293 ;--------------------
      002222                       2294 poke:
      009CF9 A6 03 62         [ 4] 2295 	call arg_list 
      009CFC CF 00            [ 1] 2296 	cp a,#2
      009CFE 21 4F            [ 1] 2297 	jreq 1$
      009D00 81 16 39         [ 2] 2298 	jp syntax_error
      009D01                       2299 1$:	
      00222C                       2300 	_xpop ; byte   
      009D01 CD 98            [ 1]    1     ld a,(y)
      009D03 1D               [ 1]    2     ldw x,y 
      009D04 A1 85            [ 2]    3     ldw x,(1,x)
      009D06 27 0C A1 05      [ 2]    4     addw y,#CELL_SIZE 
      009D0A 27               [ 1] 2301     ld a,xl 
      009D0B 03               [ 1] 2302 	push a 
      002237                       2303 	_xpop ; address 
      009D0C CC 96            [ 1]    1     ld a,(y)
      009D0E B9               [ 1]    2     ldw x,y 
      009D0F EE 01            [ 2]    3     ldw x,(1,x)
      009D0F CD 9A 01 20      [ 2]    4     addw y,#CELL_SIZE 
      009D13 03               [ 1] 2304 	pop a 
      009D14 F7               [ 1] 2305 	ld (x),a 
      009D14 CD               [ 4] 2306 	ret 
                                   2307 
                                   2308 ;-----------------------
                                   2309 ; BASIC: PEEK(addr)
                                   2310 ; get the byte at addr 
                                   2311 ; input:
                                   2312 ;	none 
                                   2313 ; output:
                                   2314 ;	X 		value 
                                   2315 ;-----------------------
      002243                       2316 peek:
      009D15 98 45 60         [ 4] 2317 	call func_args
      009D17 A1 01            [ 1] 2318 	cp a,#1 
      009D17 CF 00            [ 1] 2319 	jreq 1$
      009D19 1A CD 98         [ 2] 2320 	jp syntax_error
      00224D                       2321 1$: _xpop ; address  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009D1C 1D A1            [ 1]    1     ld a,(y)
      009D1E 32               [ 1]    2     ldw x,y 
      009D1F 27 03            [ 2]    3     ldw x,(1,x)
      009D21 CC 96 B9 03      [ 2]    4     addw y,#CELL_SIZE 
      009D24 C7 00 18         [ 1] 2322 	ld farptr,a 
      009D24 CD 9C 42         [ 2] 2323 	ldw ptr16,x 
      009D27 A1 84 27 03      [ 5] 2324 	ldf a,[farptr]
      009D2B CC               [ 1] 2325 	clrw x 
      009D2C 96               [ 1] 2326 	ld xl,a 
      009D2D B9               [ 1] 2327 	clr a 
      009D2E 81               [ 4] 2328 	ret 
                                   2329 
                                   2330 ;---------------------------
                                   2331 ; BASIC IF expr : instructions
                                   2332 ; evaluate expr and if true 
                                   2333 ; execute instructions on same line. 
                                   2334 ;----------------------------
      002264                       2335 if: 
      009D2E 90 F6 93         [ 4] 2336 	call condition  
      002267                       2337 	_xpop 
      009D31 EE 01            [ 1]    1     ld a,(y)
      009D33 72               [ 1]    2     ldw x,y 
      009D34 A9 00            [ 2]    3     ldw x,(1,x)
      009D36 03 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D37 4D               [ 1] 2338 	tnz  a  
      009D37 72 C7            [ 1] 2339 	jrne 9$
      009D39 00               [ 2] 2340 	tnzw x 
      009D3A 1A 72            [ 1] 2341 	jrne 9$  
                                   2342 ;skip to next line
      009D3C 5C 00 1B 72 CF   [ 1] 2343 	mov in,count
      00227B                       2344 	_drop 2 
      009D41 00 1A            [ 2]    1     addw sp,#2 
      009D43 81 16 EC         [ 2] 2345 	jp next_line
      009D44 81               [ 4] 2346 9$:	ret 
                                   2347 
                                   2348 ;------------------------
                                   2349 ; BASIC: FOR var=expr 
                                   2350 ; set variable to expression 
                                   2351 ; leave variable address 
                                   2352 ; on stack and set
                                   2353 ; FLOOP bit in 'flags'
                                   2354 ;-----------------
                           000001  2355 	RETL1=1 ; return address  
                           000003  2356 	FSTEP=3  ; variable increment int24
                           000006  2357 	LIMIT=6 ; loop limit, int24  
                           000009  2358 	CVAR=9   ; control variable 
                           00000B  2359 	INW=11   ;  in.w saved
                           00000D  2360 	BPTR=13 ; baseptr saved
                           00000D  2361 	VSIZE=13  
      002281                       2362 for: ; { -- var_addr }
      009D44 F6               [ 2] 2363 	popw x ; call return address 
      002282                       2364 	_vars VSIZE 
      009D45 A4 0F            [ 2]    1     sub sp,#VSIZE 
      009D47 A0               [ 2] 2365 	pushw x  ; RETL1 
      009D48 03 88            [ 1] 2366 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009D4A 4B 00 72         [ 4] 2367 	call expect
      009D4D FB 01 F6         [ 4] 2368 	call get_addr
      009D50 EE 01            [ 2] 2369 	ldw (CVAR,sp),x  ; control variable 
      009D52 5B 02 81         [ 4] 2370 	call let_eval 
      009D55 72 14 00 22      [ 1] 2371 	bset flags,#FLOOP 
      009D55 90 89 52         [ 4] 2372 	call next_token 
      009D58 04 5F            [ 1] 2373 	cp a,#TK_CMD 
      009D5A 1F 01            [ 1] 2374 	jreq 1$
      009D5C 90 AE 40         [ 2] 2375 	jp syntax_error
      0022A0                       2376 1$:  
      0022A0                       2377 	_get_code_addr
      009D5F 00               [ 2]    1         ldw x,(x)
      009D60 90 C3 00 25      [ 1]    2         inc in 
      009D64 24 35 17 03      [ 1]    3         inc in 
      009D68 93 5C CD         [ 2] 2378 	cpw x,#to   
      009D6B 89 BB            [ 1] 2379 	jreq to
      009D6D A6 3D CD         [ 2] 2380 	jp syntax_error 
                                   2381 
                                   2382 ;-----------------------------------
                                   2383 ; BASIC: TO expr 
                                   2384 ; second part of FOR loop initilization
                                   2385 ; leave limit on stack and set 
                                   2386 ; FTO bit in 'flags'
                                   2387 ;-----------------------------------
      0022B1                       2388 to: ; { var_addr -- var_addr limit step }
      009D70 89 5E 1E 03 CD   [ 2] 2389 	btjt flags,#FLOOP,1$
      009D75 9D 44 C7         [ 2] 2390 	jp syntax_error
      009D78 00 0D CF         [ 4] 2391 1$: call expression   
      009D7B 00 0E            [ 1] 2392 	cp a,#TK_INTGR 
      009D7D CD 98            [ 1] 2393 	jreq 2$ 
      009D7F 7C A6 0D         [ 2] 2394 	jp syntax_error
      0022C3                       2395 2$: _xpop
      009D82 CD 89            [ 1]    1     ld a,(y)
      009D84 5E               [ 1]    2     ldw x,y 
      009D85 1E 01            [ 2]    3     ldw x,(1,x)
      009D87 5C 1F 01 72      [ 2]    4     addw y,#CELL_SIZE 
      009D8B 5F 00            [ 1] 2396 	ld (LIMIT,sp),a 
      009D8D 0E 16            [ 2] 2397 	ldw (LIMIT+1,sp),x
      009D8F 03 90 F6         [ 4] 2398 	call next_token
      009D92 C7 00            [ 1] 2399 	cp a,#TK_NONE  
      009D94 0F 72            [ 1] 2400 	jreq 4$ 
      009D96 B9 00            [ 1] 2401 	cp a,#TK_CMD
      009D98 0E 20            [ 1] 2402 	jrne 3$
      0022DB                       2403 	_get_code_addr
      009D9A C5               [ 2]    1         ldw x,(x)
      009D9B 72 5C 00 01      [ 1]    2         inc in 
      009D9B 1E 01 CD 98      [ 1]    3         inc in 
      009D9F 65 AE 9D         [ 2] 2404 	cpw x,#step 
      009DA2 AB CD            [ 1] 2405 	jreq step
      0022E9                       2406 3$:	
      0022E9                       2407 	_unget_token   	 
      009DA4 89 BB 5B 04 90   [ 1]    1      mov in,in.saved  
      0022EE                       2408 4$:	
      009DA9 85 81            [ 1] 2409 	clr (FSTEP,sp) 
      009DAB 20 63 6F         [ 2] 2410 	ldw x,#1   ; default step  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009DAE 6E 73            [ 2] 2411 	ldw (FSTEP+1,sp),x 
      009DB0 74 61            [ 2] 2412 	jra store_loop_addr 
                                   2413 
                                   2414 
                                   2415 ;----------------------------------
                                   2416 ; BASIC: STEP expr 
                                   2417 ; optional third par of FOR loop
                                   2418 ; initialization. 	
                                   2419 ;------------------------------------
      0022F7                       2420 step: ; {var limit -- var limit step}
      009DB2 6E 74 73 20 69   [ 2] 2421 	btjt flags,#FLOOP,1$
      009DB7 6E 20 45         [ 2] 2422 	jp syntax_error
      009DBA 45 50 52         [ 4] 2423 1$: call expression 
      009DBD 4F 4D            [ 1] 2424 	cp a,#TK_INTGR
      009DBF 0A 00            [ 1] 2425 	jreq 2$
      009DC1 CC 16 39         [ 2] 2426 	jp syntax_error
      002309                       2427 2$:	
      002309                       2428 	_xpop 
      009DC1 AE 40            [ 1]    1     ld a,(y)
      009DC3 00               [ 1]    2     ldw x,y 
      009DC4 35 08            [ 2]    3     ldw x,(1,x)
      009DC6 00 0F A3 47      [ 2]    4     addw y,#CELL_SIZE 
      009DCA F8 24            [ 1] 2429 	ld (FSTEP,sp),a 
      009DCC 17 F6            [ 2] 2430 	ldw (FSTEP+1,sp),x ; step
                                   2431 ; if step < 0 decrement LIMIT 
      009DCE 26               [ 1] 2432 	tnz a
      009DCF 0C 5C            [ 1] 2433 	jrpl store_loop_addr 
      009DD1 72 5A            [ 1] 2434 	ld a,(LIMIT,sp)
      009DD3 00 0F            [ 2] 2435 	ldw x,(LIMIT+1,sp)
      009DD5 26 F6 1D         [ 2] 2436 	subw x,#1 
      009DD8 00 08            [ 1] 2437 	sbc a,#0 
      009DDA 20 09            [ 1] 2438 	ld (LIMIT,sp),a 
      009DDC F6 5C            [ 2] 2439 	ldw (LIMIT+1,sp),x 
                                   2440 ; leave loop back entry point on cstack 
                                   2441 ; cstack is 1 call deep from interpreter
      002326                       2442 store_loop_addr:
      009DDE 4D 26 FB         [ 2] 2443 	ldw x,basicptr
      009DE1 5A 20            [ 2] 2444 	ldw (BPTR,sp),x 
      009DE3 E0 5F 4F         [ 2] 2445 	ldw x,in.w 
      009DE6 CF 00            [ 2] 2446 	ldw (INW,sp),x   
      009DE8 25 81 00 22      [ 1] 2447 	bres flags,#FLOOP 
      009DEA 72 5C 00 1F      [ 1] 2448 	inc loop_depth  
      009DEA 90               [ 4] 2449 	ret 
                                   2450 
                                   2451 ;--------------------------------
                                   2452 ; BASIC: NEXT var 
                                   2453 ; FOR loop control 
                                   2454 ; increment variable with step 
                                   2455 ; and compare with limit 
                                   2456 ; loop if threshold not crossed.
                                   2457 ; else stack. 
                                   2458 ; and decrement 'loop_depth' 
                                   2459 ;--------------------------------
      002339                       2460 next: ; {var limit step retl1 -- [var limit step ] }
      009DEB 89 52 08 72      [ 1] 2461 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009DEF 5F 00            [ 1] 2462 	jrne 1$ 
      009DF1 0E 6B 05         [ 2] 2463 	jp syntax_error 
      002342                       2464 1$: 
      009DF4 1F 01            [ 1] 2465 	ld a,#TK_VAR 
      009DF6 CE 00 33         [ 4] 2466 	call expect
      009DF9 1F 07 90         [ 4] 2467 	call get_addr 
                                   2468 ; check for good variable after NEXT 	 
      009DFC CE 00            [ 2] 2469 	cpw x,(CVAR,sp)
      009DFE 31 17            [ 1] 2470 	jreq 2$  
      009E00 03 93 13         [ 2] 2471 	jp syntax_error ; not the good one 
      002351                       2472 2$: 
      009E03 07 24 20         [ 2] 2473 	ldw ptr16,x 
                                   2474 	; increment variable 
      009E06 90               [ 1] 2475 	ld a,(x)
      009E07 F6 A4            [ 2] 2476 	ldw x,(1,x)  ; get var value 
      009E09 0F 11 05         [ 2] 2477 	addw x,(FSTEP+1,sp) ; var+step 
      009E0C 26 09            [ 1] 2478 	adc a,(FSTEP,sp)
      009E0E 90 5C 1E 01      [ 4] 2479 	ld [ptr16],a
      009E12 CD 93 E4 26      [ 1] 2480 	inc ptr8  
      009E16 13 CF 00 19      [ 5] 2481 	ldw [ptr16],x 
      009E17 C7 00 0C         [ 1] 2482 	ld acc24,a 
      009E17 16 03 90         [ 2] 2483 	ldw acc16,x 
      009E1A F6 A4            [ 1] 2484 	ld a,(LIMIT,sp)
      009E1C 0F C7            [ 2] 2485 	ldw x,(LIMIT+1,sp)
      009E1E 00 0F 72 B9      [ 2] 2486 	subw x,acc16 
      009E22 00 0E 20         [ 1] 2487 	sbc a,acc24
      009E25 D9 03            [ 1] 2488 	xor a,(FSTEP,sp)
      009E26 A8 80            [ 1] 2489 	xor a,#0x80
      009E26 0F 03            [ 1] 2490 	jrmi loop_back  
      009E28 0F 04            [ 2] 2491 	jra loop_done   
                                   2492 ; check sign of STEP  
      009E2A 7B 03            [ 1] 2493 	ld a,(FSTEP,sp)
      009E2A 1E 03            [ 1] 2494 	jrpl 4$
                                   2495 ;negative step
      009E2C 5B 08 90         [ 1] 2496     ld a,acc8 
      009E2F 85 81            [ 1] 2497 	jrslt loop_back   
      009E31 20 1A            [ 2] 2498 	jra loop_done  
      00238C                       2499 4$: ; positive step
      009E31 72 00 00 23 05   [ 2] 2500 	btjt acc8,#7,loop_done 
      002391                       2501 loop_back:
      009E36 A6 06            [ 2] 2502 	ldw x,(BPTR,sp)
      009E38 CC 96 BB         [ 2] 2503 	ldw basicptr,x 
      009E3B 72 01 00 22 05   [ 2] 2504 	btjf flags,#FRUN,1$ 
      009E3B 52 05            [ 1] 2505 	ld a,(2,x)
      009E3D A6 80 6B         [ 1] 2506 	ld count,a
      009E40 05 0F            [ 2] 2507 1$:	ldw x,(INW,sp)
      009E42 03 20 10         [ 2] 2508 	ldw in.w,x 
      009E45 81               [ 4] 2509 	ret 
      0023A6                       2510 loop_done:
                                   2511 	; remove loop data from stack  
      009E45 72               [ 2] 2512 	popw x
      0023A7                       2513 	_drop VSIZE 
      009E46 00 00            [ 2]    1     addw sp,#VSIZE 
      009E48 23 05 A6 06      [ 1] 2514 	dec loop_depth 
      009E4C CC               [ 2] 2515 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   2516 
                                   2517 ;----------------------------
                                   2518 ; called by goto/gosub
                                   2519 ; to get target line number 
                                   2520 ; output:
                                   2521 ;    x    line address 
                                   2522 ;---------------------------
      0023AE                       2523 get_target_line:
      009E4D 96 BB 9D         [ 4] 2524 	call next_token  
      009E4F A1 84            [ 1] 2525 	cp a,#TK_INTGR
      009E4F 52 05            [ 1] 2526 	jreq get_target_line_addr 
      009E51 0F 03            [ 1] 2527 	cp a,#TK_LABEL 
      009E53 0F 05            [ 1] 2528 	jreq look_target_symbol 
      009E55 CC 16 39         [ 2] 2529 	jp syntax_error
                                   2530 ; the target is a line number 
                                   2531 ; search it. 
      0023BC                       2532 get_target_line_addr:
      009E55 CD 98            [ 2] 2533 	pushw y 
      009E57 1D A1 03         [ 4] 2534 	call get_int24 ; line # 
      009E5A 27               [ 1] 2535 	clr a
      009E5B 03 CC 96 B9      [ 2] 2536 	ldw y,basicptr 
      009E5F 1F 01            [ 2] 2537 	ldw y,(y)
      009E61 CD 93            [ 2] 2538 	pushw y 
      009E63 D9 AB            [ 2] 2539 	cpw x,(1,sp)
      0023CC                       2540 	_drop 2  
      009E65 05 6B            [ 2]    1     addw sp,#2 
      009E67 04 CD            [ 1] 2541 	jrult 11$
      009E69 98               [ 1] 2542 	inc a 
      0023D1                       2543 11$: ; scan program for this line# 	
      009E6A 36 7B 04         [ 4] 2544 	call search_lineno  
      009E6D 1E               [ 2] 2545 	tnzw x ; 0| line# address 
      009E6E 01 CD            [ 1] 2546 	jrne 2$ 
      009E70 9D EA            [ 1] 2547 	ld a,#ERR_NO_LINE 
      009E72 5D 27 05         [ 2] 2548 	jp tb_error 
      009E75 A6 08            [ 2] 2549 2$:	popw y  
      009E77 CC               [ 4] 2550 	ret 
                                   2551 
                                   2552 ; the GOTO|GOSUB target is a symbol.
                                   2553 ; output:
                                   2554 ;    X    line address|0 
      0023DF                       2555 look_target_symbol:
      009E78 96 BB            [ 2] 2556 	pushw y 
      009E7A CE               [ 2] 2557 	pushw x 
      009E7B 00 33 7B         [ 4] 2558 	call skip_string 
      009E7E 04 1A 05 F7      [ 1] 2559 	clr acc16 
      009E82 5C 90 89 16      [ 2] 2560 	ldw y,txtbgn 
      009E86 03 CD 93         [ 1] 2561 1$:	ld a,(3,y) ; first TK_ID on line 
      009E89 F5 90            [ 1] 2562 	cp a,#TK_LABEL 
      009E8B 85 5A            [ 1] 2563 	jreq 3$ 
      009E8D 72 FB 03         [ 1] 2564 2$:	ld a,(2,y); line length 
      009E90 CF 00 33         [ 1] 2565 	ld acc8,a 
      009E93 1D 00 03 7F      [ 2] 2566 	addw y,acc16 ;point to next line 
      009E97 6F 01 6F 02      [ 2] 2567 	cpw y,txtend 
      009E9B CD 98            [ 1] 2568 	jrult 1$
      009E9D 1D A1            [ 1] 2569 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009E9F 08 27 B3         [ 2] 2570 	jp tb_error 
      002409                       2571 3$: ; found a TK_LABEL 
                                   2572 	; compare with GOTO|GOSUB target 
      009EA2 A1 32            [ 2] 2573 	pushw y ; line address 
      009EA4 26 2A CD 9C      [ 2] 2574 	addw y,#4 ; label string 
      009EA8 42 A1            [ 2] 2575 	ldw x,(3,sp) ; target string 
      009EAA 84 27 03         [ 4] 2576 	call strcmp
      009EAD CC 96            [ 1] 2577 	jrne 4$
      009EAF B9 CE            [ 2] 2578 	popw y 
      009EB1 00 33            [ 2] 2579 	jra 2$ 
      00241A                       2580 4$: ; target found 
      009EB3 1D               [ 2] 2581 	popw x ;  address line target  
      00241B                       2582 	_drop 2 ; target string 
      009EB4 00 03            [ 2]    1     addw sp,#2 
      009EB6 CF 00            [ 2] 2583 	popw y 
      009EB8 1A               [ 4] 2584 	ret
                                   2585 
                                   2586 
                                   2587 ;--------------------------------
                                   2588 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2589 ; selective goto or gosub 
                                   2590 ;--------------------------------
      002420                       2591 cmd_on:
      009EB9 90 F6 93 EE 01   [ 2] 2592 	btjt flags,#FRUN,0$ 
      009EBE 72 A9            [ 1] 2593 	ld a,#ERR_RUN_ONLY
      009EC0 00 03 72         [ 2] 2594 	jp tb_error 
      009EC3 C7 00 1A         [ 4] 2595 0$:	call expression 
      009EC6 72 5C            [ 1] 2596 	cp a,#TK_INTGR
      009EC8 00 1B            [ 1] 2597 	jreq 1$
      009ECA 72 CF 00         [ 2] 2598 	jp syntax_error
      002434                       2599 1$: _xpop
      009ECD 1A 20            [ 1]    1     ld a,(y)
      009ECF CB               [ 1]    2     ldw x,y 
      009ED0 EE 01            [ 2]    3     ldw x,(1,x)
      009ED0 55 00 03 00      [ 2]    4     addw y,#CELL_SIZE 
                                   2600 ; the selector is the element indice 
                                   2601 ; in the list of arguments. {1..#elements} 
      009ED4 02               [ 1] 2602 	ld a,xl ; keep only bits 7..0
      009ED5 5B 05            [ 1] 2603 	jreq 9$ ; element # begin at 1. 
      009ED7 CD               [ 1] 2604 	push a  ; selector  
      009ED8 9C F6 81         [ 4] 2605 	call next_token
      009EDB A1 80            [ 1] 2606 	cp a,#TK_CMD 
      009EDB CE 00            [ 1] 2607 	jreq 2$ 
      009EDD 1E 72 B0         [ 2] 2608 	jp syntax_error 
      00244B                       2609 2$: _get_code_addr
      009EE0 00               [ 2]    1         ldw x,(x)
      009EE1 1C 81 00 01      [ 1]    2         inc in 
      009EE3 72 5C 00 01      [ 1]    3         inc in 
                                   2610 ;; must be a GOTO or GOSUB 
      009EE3 AE 9F 22         [ 2] 2611 	cpw x,#goto 
      009EE6 CD 89            [ 1] 2612 	jreq 4$
      009EE8 BB CE 00         [ 2] 2613 	cpw x,#gosub 
      009EEB 1C 35            [ 1] 2614 	jreq 4$ 
      009EED 10 00 0B         [ 2] 2615 	jp syntax_error 
      002461                       2616 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009EF0 CD               [ 1] 2617 	pop a 
      009EF1 98               [ 2] 2618 	pushw x ; save routine address 	
      009EF2 65               [ 1] 2619 	push a  ; selector  
      002464                       2620 5$: ; skip elements in list until selector==0 
      009EF3 35 0A            [ 1] 2621 	dec (1,sp)
      009EF5 00 0B            [ 1] 2622 	jreq 6$ 
                                   2623 ; can be a line# or a label 
      009EF7 AE 9F 34         [ 4] 2624 	call next_token 
      009EFA CD 89            [ 1] 2625 	cp a,#TK_INTGR 
      009EFC BB CD            [ 1] 2626 	jreq 52$
      009EFE 9E DB            [ 1] 2627 	cp a,#TK_LABEL 
      009F00 CD 98            [ 1] 2628 	jreq 54$
      009F02 65 AE 9F         [ 2] 2629 	jp syntax_error 
      002476                       2630 52$: ; got a line number 
      009F05 45 CD 89         [ 1] 2631 	ld a,in ; skip over int24 value 
      009F08 BB CE            [ 1] 2632 	add a,#CELL_SIZE ; integer size  
      009F0A 00 1C A3         [ 1] 2633 	ld in,a 
      009F0D B6 84            [ 2] 2634 	jra 56$
      009F0F 25 05 AE         [ 4] 2635 54$: call skip_string ; skip over label 	
      002483                       2636 56$: ; if another element comma present 
      009F12 9F 4C 20         [ 4] 2637 	call next_token
      009F15 03 AE            [ 1] 2638 	cp a,#TK_COMMA 
      009F17 9F 5D            [ 1] 2639 	jreq 5$ 
                                   2640 ; arg list exhausted, selector to big 
                                   2641 ; continue execution on next line 
      00248A                       2642 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F19 CD 89            [ 2]    1     addw sp,#3 
      009F1B BB A6            [ 2] 2643 	jra 9$
      00248E                       2644 6$: ;at selected position  
      00248E                       2645 	_drop 1 ; discard selector
      009F1D 0D CD            [ 2]    1     addw sp,#1 
                                   2646 ; here only the routine address 
                                   2647 ; of GOTO|GOSUB is on stack 
      009F1F 89 5E 81         [ 4] 2648     call get_target_line
      009F22 70 72 6F         [ 2] 2649 	ldw ptr16,x 	
      009F25 67 72 61 6D 20   [ 1] 2650 	mov in,count ; move to end of line  
      009F2A 61               [ 2] 2651 	popw x ; cmd address, GOTO||GOSUB 
      009F2B 64 64 72         [ 2] 2652 	cpw x,#goto 
      009F2E 65 73            [ 1] 2653 	jrne 7$ 
      009F30 73 3A 20         [ 2] 2654 	ldw x,ptr16 
      009F33 00 2C            [ 2] 2655 	jra jp_to_target
      0024A6                       2656 7$: 
      009F35 20 70            [ 2] 2657 	jra gosub_2 ; target in ptr16 
      0024A8                       2658 9$: ; expr out of range skip to end of line
                                   2659     ; this will force a fall to next line  
      009F37 72 6F 67 72 61   [ 1] 2660 	mov in,count
      0024AD                       2661 	_drop 2
      009F3C 6D 20            [ 2]    1     addw sp,#2 
      009F3E 73 69 7A         [ 2] 2662 	jp next_line  
                                   2663 
                                   2664 
                                   2665 ;------------------------
                                   2666 ; BASIC: GOTO line# 
                                   2667 ; jump to line# 
                                   2668 ; here cstack is 2 call deep from interpreter 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2669 ;------------------------
      0024B2                       2670 goto:
      009F41 65 3A 20 00 20   [ 2] 2671 	btjt flags,#FRUN,goto_1  
      009F46 62 79            [ 1] 2672 	ld a,#ERR_RUN_ONLY
      009F48 74 65 73         [ 2] 2673 	jp tb_error 
      0024BC                       2674 goto_1:
      009F4B 00 20 69         [ 4] 2675 	call get_target_line
      0024BF                       2676 jp_to_target:
      009F4E 6E 20 46         [ 2] 2677 	ldw basicptr,x 
      009F51 4C 41            [ 1] 2678 	ld a,(2,x)
      009F53 53 48 20         [ 1] 2679 	ld count,a 
      009F56 6D 65 6D 6F      [ 1] 2680 	mov in,#3 
      009F5A 72               [ 4] 2681 	ret 
                                   2682 
                                   2683 
                                   2684 ;--------------------
                                   2685 ; BASIC: GOSUB line#
                                   2686 ; basic subroutine call
                                   2687 ; actual line# and basicptr 
                                   2688 ; are saved on cstack
                                   2689 ; here cstack is 2 call deep from interpreter 
                                   2690 ;--------------------
                           000001  2691 	RET_ADDR=1 ; subroutine return address 
                           000003  2692 	RET_BPTR=3 ; basicptr return point 
                           000005  2693 	RET_INW=5  ; in.w return point 
                           000004  2694 	VSIZE=4 
      0024CC                       2695 gosub:
      009F5B 79 00 20 69 6E   [ 2] 2696 	btjt flags,#FRUN,gosub_1 
      009F60 20 52            [ 1] 2697 	ld a,#ERR_RUN_ONLY
      009F62 41 4D 20         [ 2] 2698 	jp tb_error 
      009F65 6D               [ 4] 2699 	ret 
      0024D7                       2700 gosub_1:
      009F66 65 6D 6F         [ 4] 2701 	call get_target_line 
      009F69 72 79 00         [ 2] 2702 	ldw ptr16,x
      009F6C                       2703 gosub_2: 
      009F6C 72               [ 2] 2704 	popw x 
      0024DE                       2705 	_vars VSIZE  
      009F6D 01 00            [ 2]    1     sub sp,#VSIZE 
      009F6F 23               [ 2] 2706 	pushw x ; RET_ADDR 
                                   2707 ; save BASIC subroutine return point.   
      009F70 05 A6 07         [ 2] 2708 	ldw x,basicptr
      009F73 CC 96            [ 2] 2709 	ldw (RET_BPTR,sp),x 
      009F75 BB 00 00         [ 2] 2710 	ldw x,in.w 
      009F76 1F 05            [ 2] 2711 	ldw (RET_INW,sp),x
      009F76 CD 98 1D         [ 2] 2712 	ldw x,ptr16  
      009F79 A1 04            [ 2] 2713 	jra jp_to_target
                                   2714 
                                   2715 ;------------------------
                                   2716 ; BASIC: RETURN 
                                   2717 ; exit from BASIC subroutine 
                                   2718 ;------------------------
      0024F0                       2719 return:
      009F7B 26 10 CD 98 5F   [ 2] 2720 	btjt flags,#FRUN,0$ 
      009F80 A4 DF            [ 1] 2721 	ld a,#ERR_RUN_ONLY
      009F82 A1 43 26         [ 2] 2722 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      0024FA                       2723 0$:	
      009F85 04 CD            [ 2] 2724 	ldw x,(RET_BPTR,sp) 
      009F87 9D 55 81         [ 2] 2725 	ldw basicptr,x
      009F8A CC 96            [ 1] 2726 	ld a,(2,x)
      009F8C B9 55 00         [ 1] 2727 	ld count,a  
      009F8F 03 00            [ 2] 2728 	ldw x,(RET_INW,sp)
      009F91 02 CD 9E         [ 2] 2729 	ldw in.w,x 
      009F94 DB               [ 2] 2730 	popw x 
      00250A                       2731 	_drop VSIZE 
      009F95 22 01            [ 2]    1     addw sp,#VSIZE 
      009F97 81               [ 2] 2732 	jp (x)
                                   2733 
                                   2734 
                                   2735 ;----------------------------------
                                   2736 ; BASIC: RUN
                                   2737 ; run BASIC program in RAM
                                   2738 ;----------------------------------- 
      00250D                       2739 run: 
      009F98 52 06 CE 00 1C   [ 2] 2740 	btjf flags,#FRUN,0$  
      009F9D 1F               [ 1] 2741 	clr a 
      009F9E 05               [ 4] 2742 	ret
      002514                       2743 0$: 
      009F9F FE 1F 01 AE 7F   [ 2] 2744 	btjf flags,#FBREAK,1$
      002519                       2745 	_drop 2 
      009FA4 FF 1F            [ 2]    1     addw sp,#2 
      009FA6 03 CD 99         [ 4] 2746 	call rest_context
      00251E                       2747 	_drop CTXT_SIZE 
      009FA9 E5 4D            [ 2]    1     addw sp,#CTXT_SIZE 
      009FAB 27 31 A1 02      [ 1] 2748 	bres flags,#FBREAK 
      009FAF 27 07 A1 01      [ 1] 2749 	bset flags,#FRUN 
      009FB3 27 06 CC         [ 2] 2750 	jp interpreter 
      009FB6 96 B9 85         [ 2] 2751 1$:	ldw x,txtbgn
      009FB9 1F 05 1D         [ 2] 2752 	cpw x,txtend 
      009FBB 2B 0C            [ 1] 2753 	jrmi run_it 
      009FBB 85 1F 01         [ 2] 2754 	ldw x,#err_no_prog
      009FBE CD 09 3B         [ 4] 2755 	call puts 
      009FBE CE 00 1C 1F 05   [ 1] 2756 	mov in,count
      009FC3 C3               [ 4] 2757 	ret 
      00253F                       2758 run_it:	 
      00253F                       2759 	_drop 2 ; drop return address 
      009FC4 00 1E            [ 2]    1     addw sp,#2 
      002541                       2760 run_it_02: 
      009FC6 2A 38 FE         [ 4] 2761     call ubound 
      009FC9 13 01 2A         [ 4] 2762 	call clear_vars
                                   2763 ; initialize DIM variables pointers 
      009FCC 11 1E 05         [ 2] 2764 	ldw x,txtend 
      009FCF E6 02 C7         [ 2] 2765 	ldw dvar_bgn,x 
      009FD2 00 0F 72         [ 2] 2766 	ldw dvar_end,x 	 
                                   2767 ; clear data pointer 
      009FD5 5F               [ 1] 2768 	clrw x 
      009FD6 00 0E 72         [ 2] 2769 	ldw data_ptr,x 
      009FD9 BB 00 0E 20      [ 1] 2770 	clr data_ofs 
      009FDD E3 5F 00 09      [ 1] 2771 	clr data_len 
                                   2772 ; initialize BASIC pointer 
      009FDE CE 00 1B         [ 2] 2773 	ldw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009FDE 1E 05 E6         [ 2] 2774 	ldw basicptr,x 
      009FE1 02 CD            [ 1] 2775 	ld a,(2,x)
      009FE3 A0 55 1E         [ 1] 2776 	ld count,a
      009FE6 05 E6 02 C7      [ 1] 2777 	mov in,#3	
      009FEA 00 0F 72 5F      [ 1] 2778 	bset flags,#FRUN 
      009FEE 00 0E 72         [ 2] 2779 	jp interpreter 
                                   2780 
                                   2781 
                                   2782 ;----------------------
                                   2783 ; BASIC: END
                                   2784 ; end running program
                                   2785 ;---------------------- 
      002572                       2786 cmd_end: 
                                   2787 ; clean stack 
      009FF1 BB 00 0E         [ 2] 2788 	ldw x,#STACK_EMPTY
      009FF4 C3               [ 1] 2789 	ldw sp,x 
      009FF5 00 1E 2A         [ 2] 2790 	jp warm_start
                                   2791 
                                   2792 ;---------------------------
                                   2793 ; BASIC: GET var 
                                   2794 ; receive a key in variable 
                                   2795 ; don't wait 
                                   2796 ;---------------------------
      002579                       2797 cmd_get:
      009FF8 07 1F 05         [ 4] 2798 	call next_token 
      009FFB FE 13            [ 1] 2799 	cp a,#TK_VAR 
      009FFD 03 2F            [ 1] 2800 	jreq 0$
      009FFF DE 16 39         [ 2] 2801 	jp syntax_error 
      00A000 CD 17 C5         [ 4] 2802 0$: call get_addr 
      00A000 55 00 04         [ 2] 2803 	ldw ptr16,x 
      00A003 00 02 AE         [ 4] 2804 	call qgetc 
      00A006 16 E0            [ 1] 2805 	jreq 2$
      00A008 CF 00 05         [ 4] 2806 	call getc  
      00A00B 5B 06 CD 9E      [ 4] 2807 2$: clr [ptr16]
      00A00F E3 81 00 1A      [ 1] 2808 	inc ptr8 
      00A011 72 3F 00 19      [ 4] 2809 	clr [ptr16]
      00A011 CD A8 61 27      [ 1] 2810 	inc ptr8 
      00A015 07 AE A0 3E      [ 4] 2811 	ld [ptr16],a 
      00A019 CD               [ 4] 2812 	ret 
                                   2813 
                                   2814 
                                   2815 ;-----------------
                                   2816 ; 1 Khz beep 
                                   2817 ;-----------------
      0025A6                       2818 beep_1khz:: 
      00A01A 89 BB            [ 2] 2819 	pushw y 
      00A01C 81 00 64         [ 2] 2820 	ldw x,#100
      00A01D 90 AE 03 E8      [ 2] 2821 	ldw y,#1000
      00A01D 90 AE            [ 2] 2822 	jra beep
                                   2823 
                                   2824 ;-----------------------
                                   2825 ; BASIC: TONE expr1,expr2
                                   2826 ; used TIMER2 channel 1
                                   2827 ; to produce a tone 
                                   2828 ; arguments:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2829 ;    expr1   frequency 
                                   2830 ;    expr2   duration msec.
                                   2831 ;---------------------------
      0025B1                       2832 tone:
      00A01F B6 80            [ 2] 2833 	pushw y 
      00A021 CE B6 82         [ 4] 2834 	call arg_list 
      00A024 1C 00            [ 1] 2835 	cp a,#2 
      00A026 04 CF            [ 1] 2836 	jreq 1$
      00A028 00 0E AE         [ 2] 2837 	jp syntax_error 
      0025BD                       2838 1$: 
      0025BD                       2839 	_xpop 
      00A02B 00 8C            [ 1]    1     ld a,(y)
      00A02D CD               [ 1]    2     ldw x,y 
      00A02E 94 05            [ 2]    3     ldw x,(1,x)
      00A030 AE 00 90 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A034 00               [ 2] 2840 	pushw x ; duration 
      0025C7                       2841 	_xpop ; frequency
      00A035 1C 72            [ 1]    1     ld a,(y)
      00A037 BB               [ 1]    2     ldw x,y 
      00A038 00 8E            [ 2]    3     ldw x,(1,x)
      00A03A CF 00 1E 81      [ 2]    4     addw y,#CELL_SIZE 
      00A03E 4E 6F            [ 1] 2842 	ldw y,x ; frequency 
      00A040 20               [ 2] 2843 	popw x  ; duration 
      0025D3                       2844 beep:  
      00A041 61               [ 2] 2845 	pushw x 
      00A042 70 70 6C         [ 2] 2846 	ldw x,#TIM2_CLK_FREQ
      00A045 69               [ 2] 2847 	divw x,y ; cntr=Fclk/freq 
                                   2848 ; round to nearest integer 
      00A046 63 61 74 69      [ 2] 2849 	cpw y,#TIM2_CLK_FREQ/2
      00A04A 6F 6E            [ 1] 2850 	jrmi 2$
      00A04C 20               [ 1] 2851 	incw x 
      0025DF                       2852 2$:	 
      00A04D 73               [ 1] 2853 	ld a,xh 
      00A04E 61 76 65         [ 1] 2854 	ld TIM2_ARRH,a 
      00A051 64               [ 1] 2855 	ld a,xl 
      00A052 2E 0A 00         [ 1] 2856 	ld TIM2_ARRL,a 
                                   2857 ; 50% duty cycle 
      00A055 8C               [ 1] 2858 	ccf 
      00A055 90               [ 2] 2859 	rrcw x 
      00A056 89               [ 1] 2860 	ld a,xh 
      00A057 C7 00 04         [ 1] 2861 	ld TIM2_CCR1H,a 
      00A05A E6               [ 1] 2862 	ld a,xl
      00A05B 02 C1 00         [ 1] 2863 	ld TIM2_CCR1L,a
      00A05E 04 2A 03 C7      [ 1] 2864 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A062 00 04 CF 00      [ 1] 2865 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A066 05 90 AE 16      [ 1] 2866 	bset TIM2_EGR,#TIM2_EGR_UG
      00A06A 90               [ 2] 2867 	popw x 
      00A06B CD 91 F5         [ 4] 2868 	call pause02
      00A06E CD 89 BB A6      [ 1] 2869 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A072 0D CD 89 5E      [ 1] 2870 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A076 90 85            [ 2] 2871 	popw y 
      00A078 81               [ 4] 2872 	ret 
                                   2873 
                                   2874 ;-------------------------------
                                   2875 ; BASIC: ADCON 0|1 [,divisor]  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



                                   2876 ; disable/enanble ADC 
                                   2877 ;-------------------------------
                           000003  2878 	ONOFF=3 
                           000001  2879 	DIVSOR=1
                           000004  2880 	VSIZE=4 
      00A079                       2881 power_adc:
      00A079 52 01 65         [ 4] 2882 	call arg_list 
      00A07B A1 02            [ 1] 2883 	cp a,#2	
      00A07B 0F 01            [ 1] 2884 	jreq 1$
      00A07D A1 01            [ 1] 2885 	cp a,#1 
      00A07D CD 98            [ 1] 2886 	jreq 0$ 
      00A07F 1D A1 02         [ 2] 2887 	jp syntax_error 
      00A082 25               [ 1] 2888 0$:	clr a 
      00A083 08               [ 1] 2889 	clrw x
      00261C                       2890 	_xpush   ; divisor  
      00A084 A1 0A 27 04      [ 2]    1     subw y,#CELL_SIZE
      00A088 A1 80            [ 1]    2     ld (y),a 
      00A08A 26 07 01         [ 2]    3     ldw (1,y),x 
      00A08C                       2891 1$: _at_next 
      00A08C 55 00 03         [ 1]    1     ld a,(3,y)
      00A08F 00               [ 1]    2     ldw x,y 
      00A090 02 20            [ 2]    3     ldw x,(4,x)
      00A092 63               [ 2] 2892 	tnzw x 
      00A093 27 25            [ 1] 2893 	jreq 2$ 
      00262E                       2894 	_xpop
      00A093 A1 02            [ 1]    1     ld a,(y)
      00A095 27               [ 1]    2     ldw x,y 
      00A096 12 A1            [ 2]    3     ldw x,(1,x)
      00A098 04 27 1B A1      [ 2]    4     addw y,#CELL_SIZE 
      002637                       2895 	_xdrop  
      00A09C 82 27 1F A1      [ 2]    1     addw y,#CELL_SIZE 
      00A0A0 08               [ 1] 2896 	ld a,xl
      00A0A1 27 2A            [ 1] 2897 	and a,#7
      00A0A3 A1               [ 1] 2898 	swap a 
      00A0A4 09 27 2A         [ 1] 2899 	ld ADC_CR1,a
      00A0A7 20 3D 50 CA      [ 1] 2900 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0A9 72 10 54 01      [ 1] 2901 	bset ADC_CR1,#ADC_CR1_ADON 
      00264A                       2902 	_usec_dly 7 
      00A0A9 CD 89 BB         [ 2]    1     ldw x,#(16*7-2)/4
      00A0AC 5C               [ 2]    2     decw x
      00A0AD 72               [ 1]    3     nop 
      00A0AE B0 00            [ 1]    4     jrne .-4
      00A0B0 05 CF            [ 2] 2903 	jra 3$
      00A0B2 00 01 20 C5      [ 1] 2904 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0B6 72 17 50 CA      [ 1] 2905 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00265B                       2906 3$:	
      00A0B6 CD               [ 4] 2907 	ret
                                   2908 
                                   2909 ;-----------------------------
                                   2910 ; BASIC: ADCREAD (channel)
                                   2911 ; read adc channel {0..5}
                                   2912 ; output:
                                   2913 ;   A 		TK_INTGR 
                                   2914 ;   X 		value 
                                   2915 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00265C                       2916 analog_read:
      00A0B7 98 5F CD         [ 4] 2917 	call func_args 
      00A0BA 89 5E            [ 1] 2918 	cp a,#1 
      00A0BC 20 BD            [ 1] 2919 	jreq 1$
      00A0BE CC 16 39         [ 2] 2920 	jp syntax_error
      002666                       2921 1$: _xpop 
      00A0BE FE 72            [ 1]    1     ld a,(y)
      00A0C0 5C               [ 1]    2     ldw x,y 
      00A0C1 00 02            [ 2]    3     ldw x,(1,x)
      00A0C3 72 5C 00 02      [ 2]    4     addw y,#CELL_SIZE 
      00A0C7 FD CD 89         [ 2] 2922 	cpw x,#5 
      00A0CA 5E 20            [ 2] 2923 	jrule 2$
      00A0CC AE 0A            [ 1] 2924 	ld a,#ERR_BAD_VALUE
      00A0CD CC 16 3B         [ 2] 2925 	jp tb_error 
      00A0CD 03               [ 1] 2926 2$: ld a,xl
      00A0CE 01 20 AC         [ 1] 2927 	ld acc8,a 
      00A0D1 A6 05            [ 1] 2928 	ld a,#5
      00A0D1 CD 98 1D         [ 1] 2929 	sub a,acc8 
      00A0D4 A1 84 27         [ 1] 2930 	ld ADC_CSR,a
      00A0D7 03 CC 96 B9      [ 1] 2931 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0DB 72 10 54 01      [ 1] 2932 	bset ADC_CR1,#ADC_CR1_ADON
      00A0DB CD 98 4F 9F A4   [ 2] 2933 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0E0 0F C7 00         [ 2] 2934 	ldw x,ADC_DRH
      00A0E3 24 20            [ 1] 2935 	ld a,#TK_INTGR
      00A0E5 95               [ 4] 2936 	ret 
                                   2937 
                                   2938 ;-----------------------
                                   2939 ; BASIC: DREAD(pin)
                                   2940 ; Arduino pins 
                                   2941 ; read state of a digital pin 
                                   2942 ; pin# {0..15}
                                   2943 ; output:
                                   2944 ;    A 		TK_INTGR
                                   2945 ;    X      0|1 
                                   2946 ;-------------------------
                           000001  2947 	PINNO=1
                           000001  2948 	VSIZE=1
      00A0E6                       2949 digital_read:
      002698                       2950 	_vars VSIZE 
      00A0E6 55 00            [ 2]    1     sub sp,#VSIZE 
      00A0E8 03 00 02         [ 4] 2951 	call func_args
      00A0EB CD 9C            [ 1] 2952 	cp a,#1
      00A0ED 42 4D            [ 1] 2953 	jreq 1$
      00A0EF 27 05 CD         [ 2] 2954 	jp syntax_error
      0026A4                       2955 1$: _xpop 
      00A0F2 98 8A            [ 1]    1     ld a,(y)
      00A0F4 20               [ 1]    2     ldw x,y 
      00A0F5 85 01            [ 2]    3     ldw x,(1,x)
      00A0F6 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0F6 0D 01 26         [ 2] 2956 	cpw x,#15 
      00A0F9 05 A6            [ 2] 2957 	jrule 2$
      00A0FB 0D CD            [ 1] 2958 	ld a,#ERR_BAD_VALUE
      00A0FD 89 5E 5B         [ 2] 2959 	jp tb_error 
      00A100 01 81 82         [ 4] 2960 2$:	call select_pin 
      00A102 6B 01            [ 1] 2961 	ld (PINNO,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A102 CE 00            [ 1] 2962 	ld a,(GPIO_IDR,x)
      00A104 05 1F            [ 1] 2963 	tnz (PINNO,sp)
      00A106 03 C6            [ 1] 2964 	jreq 8$
      00A108 00               [ 1] 2965 3$: srl a 
      00A109 02 6B            [ 1] 2966 	dec (PINNO,sp)
      00A10B 05 C6            [ 1] 2967 	jrne 3$ 
      00A10D 00 04            [ 1] 2968 8$: and a,#1 
      00A10F 6B               [ 1] 2969 	clrw x 
      00A110 06               [ 1] 2970 	ld xl,a 
      00A111 81               [ 1] 2971 	clr a 
      00A112                       2972 	_drop VSIZE
      00A112 1E 03            [ 2]    1     addw sp,#VSIZE 
      00A114 CF               [ 4] 2973 	ret
                                   2974 
                                   2975 
                                   2976 ;-----------------------
                                   2977 ; BASIC: DWRITE pin,0|1
                                   2978 ; Arduino pins 
                                   2979 ; write to a digital pin 
                                   2980 ; pin# {0..15}
                                   2981 ; output:
                                   2982 ;    A 		TK_INTGR
                                   2983 ;    X      0|1 
                                   2984 ;-------------------------
                           000001  2985 	PINNO=1
                           000002  2986 	PINVAL=2
                           000002  2987 	VSIZE=2
      0026CF                       2988 digital_write:
      0026CF                       2989 	_vars VSIZE 
      00A115 00 05            [ 2]    1     sub sp,#VSIZE 
      00A117 7B 05 C7         [ 4] 2990 	call arg_list  
      00A11A 00 02            [ 1] 2991 	cp a,#2 
      00A11C 7B 06            [ 1] 2992 	jreq 1$
      00A11E C7 00 04         [ 2] 2993 	jp syntax_error
      0026DB                       2994 1$: _xpop 
      00A121 81 F6            [ 1]    1     ld a,(y)
      00A122 93               [ 1]    2     ldw x,y 
      00A122 90 89            [ 2]    3     ldw x,(1,x)
      00A124 52 05 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A126 9F               [ 1] 2995 	ld a,xl 
      00A126 0F 05            [ 1] 2996 	ld (PINVAL,sp),a
      0026E7                       2997 	_xpop 
      00A128 CD 98            [ 1]    1     ld a,(y)
      00A12A 1D               [ 1]    2     ldw x,y 
      00A12B A1 02            [ 2]    3     ldw x,(1,x)
      00A12D 26 10 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00A131 BB 5C 72         [ 2] 2998 	cpw x,#15 
      00A134 B0 00            [ 2] 2999 	jrule 2$
      00A136 05 CF            [ 1] 3000 	ld a,#ERR_BAD_VALUE
      00A138 00 01 03         [ 2] 3001 	jp tb_error 
      00A13B 05 CD 98         [ 4] 3002 2$:	call select_pin 
      00A13E 1D A1            [ 1] 3003 	ld (PINNO,sp),a 
      00A140 85 27            [ 1] 3004 	ld a,#1
      00A142 03 CC            [ 1] 3005 	tnz (PINNO,sp)
      00A144 96 B9            [ 1] 3006 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A146 CD               [ 1] 3007 3$: sll a
      00A147 98 45            [ 1] 3008 	dec (PINNO,sp)
      00A149 CF 00            [ 1] 3009 	jrne 3$
      00A14B 1A 0D            [ 1] 3010 4$: tnz (PINVAL,sp)
      00A14D 05 26            [ 1] 3011 	jrne 5$
      00A14F 06               [ 1] 3012 	cpl a 
      00A150 CD 91            [ 1] 3013 	and a,(GPIO_ODR,x)
      00A152 EB CD            [ 2] 3014 	jra 8$
      00A154 89 5E            [ 1] 3015 5$: or a,(GPIO_ODR,x)
      00A156 E7 00            [ 1] 3016 8$: ld (GPIO_ODR,x),a 
      002717                       3017 	_drop VSIZE 
      00A156 A6 3A            [ 2]    1     addw sp,#VSIZE 
      00A158 CD               [ 4] 3018 	ret
                                   3019 
                                   3020 
                                   3021 ;-----------------------
                                   3022 ; BASIC: STOP
                                   3023 ; stop progam execution  
                                   3024 ; without resetting pointers 
                                   3025 ; the program is resumed
                                   3026 ; with RUN 
                                   3027 ;-------------------------
      00271A                       3028 stop:
      00A159 89 5E CD A1 02   [ 2] 3029 	btjt flags,#FRUN,2$
      00A15E 72               [ 1] 3030 	clr a
      00A15F 5F               [ 4] 3031 	ret 
      002721                       3032 2$:	 
                                   3033 ; create space on cstack to save context 
      00A160 00 04 CD         [ 2] 3034 	ldw x,#break_point 
      00A163 8A C0 AE         [ 4] 3035 	call puts 
      002727                       3036 	_drop 2 ;drop return address 
      00A166 16 90            [ 2]    1     addw sp,#2 
      002729                       3037 	_vars CTXT_SIZE ; context size 
      00A168 3B 00            [ 2]    1     sub sp,#CTXT_SIZE 
      00A16A 04 4B 00         [ 4] 3038 	call save_context 
      00A16D 72 FB 01         [ 2] 3039 	ldw x,#tib 
      00A170 5C 5B 02         [ 2] 3040 	ldw basicptr,x
      00A173 72               [ 1] 3041 	clr (x)
      00A174 5F 00 02 CD      [ 1] 3042 	clr count  
      00A178 8F               [ 1] 3043 	clrw x 
      00A179 35 A1 84         [ 2] 3044 	ldw in.w,x
      00A17C 27 14 A1 11      [ 1] 3045 	bres flags,#FRUN 
      00A180 26 07 CD 8F      [ 1] 3046 	bset flags,#FBREAK
      00A184 35 A1 84         [ 2] 3047 	jp interpreter 
      00A187 27 06 72 65 61 6B 20  3048 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3049 
                                   3050 ;-----------------------
                                   3051 ; BASIC: NEW
                                   3052 ; from command line only 
                                   3053 ; free program memory
                                   3054 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   3055 ;------------------------
      00A189                       3056 new: 
      00A189 CD A1 12 CC 96   [ 2] 3057 	btjf flags,#FRUN,0$ 
      00A18E B9               [ 4] 3058 	ret 
      00A18F                       3059 0$:	
      00A18F CD 82 8D         [ 4] 3060 	call clear_basic 
      00A192 81               [ 4] 3061 	ret 
                                   3062 
                                   3063 ;-----------------------------------
                                   3064 ; BASIC: ERASE \E | \F 
                                   3065 ; erase all block in range from 
                                   3066 ;  'app_space' to FLASH end (0x20000)
                                   3067 ;  or all EEPROM 
                                   3068 ; that contains a non zero byte.  
                                   3069 ;-----------------------------------
                           000001  3070 	LIMIT=1 
                           000003  3071 	VSIZE = 3 
      002770                       3072 erase:
      00A192 C6 00 0D CE      [ 1] 3073 	clr farptr 
      002774                       3074 	_vars VSIZE 
      00A196 00 0E            [ 2]    1     sub sp,#VSIZE 
      00A198 72 C7 00         [ 4] 3075 	call next_token 
      00A19B 1A 72            [ 1] 3076 	cp a,#TK_CHAR 
      00A19D 5C 00            [ 1] 3077 	jreq 0$ 
      00A19F 1B 72 CF         [ 2] 3078 	jp syntax_error
      00A1A2 00 1A CD         [ 4] 3079 0$: call get_char 
      00A1A5 A1 12            [ 1] 3080 	and a,#0XDF 
      00A1A7 CD 98            [ 1] 3081 	cp a,#'E
      00A1A9 1D A1            [ 1] 3082 	jrne 1$
      00A1AB 08 26 03         [ 2] 3083 	ldw x,#EEPROM_BASE 
      00A1AE CC A1 26         [ 2] 3084 	ldw farptr+1,x 
      00A1B1 AE 47 FF         [ 2] 3085 	ldw x,#EEPROM_END
      00A1B1 A1               [ 1] 3086 	clr a 
      00A1B2 00 27            [ 2] 3087 	jra 3$ 
      00A1B4 07 A1            [ 1] 3088 1$: cp a,#'F 
      00A1B6 0A 27            [ 1] 3089 	jreq 2$
      00A1B8 03 CC 96         [ 2] 3090 	ldw x,#err_bad_value
      00A1BB B9 16 3B         [ 2] 3091 	jp tb_error
      00A1BC                       3092 2$:
      00A1BC 5B 05 90         [ 2] 3093 	ldw x,#app_space  
      00A1BF 85 81 19         [ 2] 3094 	ldw farptr+1,x 
      00A1C1 A6 02            [ 1] 3095 	ld a,#(FLASH_END>>16)&0XFF 
      00A1C1 55 00 04         [ 2] 3096 	ldw x,#FLASH_END&0xffff
      0027AA                       3097 3$:
      00A1C4 00 02            [ 1] 3098 	ld (LIMIT,sp),a 
      00A1C6 81 02            [ 2] 3099 	ldw (LIMIT+1,sp),x 
                                   3100  ; operation done from RAM
                                   3101  ; copy code to RAM in tib   
      00A1C7 CD 06 DC         [ 4] 3102 	call move_erase_to_ram
      0027B1                       3103 4$:	 
      00A1C7 52 04 0F         [ 4] 3104     call scan_block 
      00A1CA 01 CD            [ 1] 3105 	jreq 5$  ; block already erased 
      00A1CC 99 E5            [ 1] 3106     ld a,#'E 
      00A1CE A1 02 24         [ 4] 3107     call putc 
      00A1D1 03 CC 96         [ 4] 3108 	call block_erase   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   3109 ; this block is clean, next  
      00A1D4 B9 A1 03         [ 2] 3110 5$:	ldw x,#BLOCK_SIZE
      00A1D7 25 0C 90         [ 4] 3111 	call incr_farptr
                                   3112 ; check limit, 24 bit substraction  	
      00A1DA F6 93            [ 1] 3113 	ld a,(LIMIT,sp)
      00A1DC EE 01            [ 2] 3114 	ldw x,(LIMIT+1,sp)
      00A1DE 72 A9 00 03      [ 2] 3115 	subw x,farptr+1
      00A1E2 9F 6B 01         [ 1] 3116 	sbc a,farptr 
      00A1E5 90 F6            [ 1] 3117 	jrugt 4$ 
      00A1E7 93 EE 01         [ 4] 3118 9$: call clear_basic
      00A1EA 72 A9            [ 2] 3119 	ldw x,(LIMIT+1,sp)
      00A1EC 00 03 9F         [ 2] 3120 	cpw x,#EEPROM_END
      00A1EF 6B 02            [ 1] 3121 	jrne 10$
      00A1F1 90 F6 93         [ 4] 3122 	call func_eefree 
      0027DE                       3123 10$:
      0027DE                       3124 	_drop VSIZE 
      00A1F4 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A1F6 72               [ 4] 3125 	ret 
                                   3126 	
                                   3127 
                                   3128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3129 ;  check for application signature 
                                   3130 ; output:
                                   3131 ;   Carry    0 app present 
                                   3132 ;            1 no app installed  
                                   3133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E1                       3134 qsign: 
      00A1F7 A9 00 03         [ 2] 3135 	ldw x,app_sign 
      00A1FA F6 14 02         [ 2] 3136 	cpw x,SIGNATURE ; "TB" 
      00A1FD 18               [ 4] 3137 	ret 
                                   3138 
                                   3139 ;--------------------------------------
                                   3140 ;  fill write buffer 
                                   3141 ;  input:
                                   3142 ;    y  point to output buffer 
                                   3143 ;    x  point to source 
                                   3144 ;    a  bytes to write in buffer 
                                   3145 ;  output:
                                   3146 ;    y   += A 
                                   3147 ;    X   += A 
                                   3148 ;    A   0 
                                   3149 ;---------------------------------------
      0027E8                       3150 fill_write_buffer:
      00A1FE 01               [ 1] 3151 	push a 
      00A1FF 27               [ 1] 3152 	tnz a 
      00A200 F9 5B            [ 1] 3153 	jreq 9$ 
      00A202 04               [ 1] 3154 1$: ld a,(x)
      00A203 81               [ 1] 3155 	incw x 
      00A204 90 F7            [ 1] 3156 	ld (y),a 
      00A204 CD 99            [ 1] 3157 	incw y 
      00A206 E5 A1            [ 1] 3158 	dec (1,sp) 
      00A208 02 27            [ 1] 3159 	jrne 1$ 
      00A20A 03               [ 1] 3160 9$:	pop a 
      00A20B CC               [ 4] 3161     ret 	
                                   3162 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



                                   3163 ;--------------------------------------
                                   3164 ;  fill pad buffer with zero 
                                   3165 ;  input:
                                   3166 ;	none 
                                   3167 ;  output:
                                   3168 ;    y     buffer address  
                                   3169 ;--------------------------------------
      0027F8                       3170 clear_block_buffer:
      00A20C 96               [ 1] 3171 	push a 
      00A20D B9 AE 16 E0      [ 2] 3172 	ldw y,#block_buffer 
      00A20E 90 89            [ 2] 3173 	pushw y
      00A20E 90 F6            [ 1] 3174 	ld a,#BLOCK_SIZE   
      00A210 93 EE            [ 1] 3175 1$:	clr (y)
      00A212 01 72            [ 1] 3176 	incw y
      00A214 A9               [ 1] 3177 	dec a  
      00A215 00 03            [ 1] 3178 	jrne 1$ 	
      00A217 9F 88            [ 2] 3179 9$: popw y 
      00A219 90               [ 1] 3180 	pop a 			
      00A21A F6               [ 4] 3181 	ret 
                                   3182 
                                   3183 
                                   3184 ;---------------------------------------
                                   3185 ; BASIC: SAVE
                                   3186 ; write application from RAM to FLASH
                                   3187 ; at UFLASH address
                                   3188 ;--------------------------------------
                           000001  3189 	XTEMP=1
                           000003  3190 	COUNT=3  ; last count bytes written 
                           000004  3191 	CNT_LO=4 ; count low byte 
                           000005  3192 	TOWRITE=5 ; how bytes left to write  
                           000006  3193 	VSIZE=6 
      00280C                       3194 save_app:
      00A21B 93               [ 2] 3195 	pushw x 
      00A21C EE 01            [ 2] 3196 	pushw y 
      00280F                       3197 	_vars VSIZE
      00A21E 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A220 00 03 84         [ 4] 3198 	call qsign 
      00A223 FA F7            [ 1] 3199 	jrne 1$
      00A225 81 28 A3         [ 2] 3200 	ldw x,#CANT_DO 
      00A226 CD 09 3B         [ 4] 3201 	call puts 
      00A226 CD 99 E5         [ 2] 3202 	jp 9$
      00281F                       3203 1$: 
      00A229 A1 02 27         [ 2] 3204 	ldw x,txtbgn
      00A22C 03 CC 96         [ 2] 3205 	cpw x,txtend 
      00A22F B9 09            [ 1] 3206 	jrult 2$ 
      00A230 AE 28 E5         [ 2] 3207 	ldw x,#NO_APP
      00A230 90 F6 93         [ 4] 3208 	call puts 
      00A233 EE 01 72         [ 2] 3209 	jp 9$
      002830                       3210 2$: 
                                   3211 ; block programming flash
                                   3212 ; must be done from RAM
                                   3213 ; moved in tib  
      00A236 A9 00 03         [ 4] 3214 	call move_prg_to_ram
                                   3215 ; initialize farptr 
                                   3216 ; to app_sign address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A239 9F 43 88 90      [ 1] 3217 	clr farptr 
      00A23D F6 93 EE         [ 2] 3218 	ldw x,#app_sign 
      00A240 01 72 A9         [ 2] 3219 	ldw farptr+1,x
                                   3220 ; initialize local variables 
      00A243 00 03 84         [ 4] 3221 	call prog_size
      00A246 F4 F7            [ 2] 3222 	ldw (TOWRITE,sp),x
      00A248 81 03            [ 1] 3223 	clr (COUNT,sp)
                                   3224 ; first bock 
                                   3225 ; containt signature 2 bytes 
                                   3226 ; and size 	2 bytes 
                                   3227 ; use Y as pointer to block_buffer
      00A249 CD 27 F8         [ 4] 3228 	call clear_block_buffer ; -- y=*block_buffer	
                                   3229 ; write signature
      00A249 CD 99 E5         [ 2] 3230 	ldw x,SIGNATURE ; "BC" 
      00A24C A1 02            [ 2] 3231 	ldw (y),x 
      00A24E 27 03 CC 96      [ 2] 3232 	addw y,#2
      00A252 B9 90            [ 2] 3233 	ldw x,(TOWRITE,sp)
      00A254 F6 93            [ 2] 3234 	ldw (y),x
      00A256 EE 01 72 A9      [ 2] 3235 	addw y,#2   
      00A25A 00 03            [ 1] 3236 	ld a,#(BLOCK_SIZE-4)
      00A25C 9F 88            [ 1] 3237 	ld (CNT_LO,sp),a 
      00A25E 90 F6 93         [ 2] 3238 	cpw x,#(BLOCK_SIZE-4) 
      00A261 EE 01            [ 1] 3239 	jrugt 3$
      00A263 72               [ 1] 3240 	ld a,xl 
      00A264 A9 00            [ 1] 3241 3$:	ld (CNT_LO,sp),a   
      00A266 03 84 F8         [ 2] 3242 	ldw x,txtbgn 
      00A269 F7 81            [ 2] 3243 	ldw (XTEMP,sp),x 
      00A26B                       3244 32$: 
      00A26B CD 99            [ 2] 3245 	ldw x,(XTEMP,sp)
      00A26D E0 A1            [ 1] 3246 	ld a,(CNT_LO,sp)
      00A26F 02 27 03         [ 4] 3247 	call fill_write_buffer 
      00A272 CC 96            [ 2] 3248 	ldw (XTEMP,sp),x 
      00A274 B9 16 E0         [ 2] 3249 	ldw x,#block_buffer
      00A275 CD 07 36         [ 4] 3250 	call write_buffer
      00A275 90 F6 93         [ 2] 3251 	ldw x,#BLOCK_SIZE 
      00A278 EE 01 72         [ 4] 3252 	call incr_farptr  
                                   3253 ; following blocks 
      00A27B A9 00            [ 2] 3254 	ldw x,(XTEMP,sp)
      00A27D 03 9F A4         [ 2] 3255 	cpw x,txtend 
      00A280 07 88            [ 1] 3256 	jruge 9$ 
      00A282 A6 01            [ 2] 3257 	ldw x,(TOWRITE,sp)
      00A284 0D 01 27         [ 2] 3258 	subw x,(COUNT,sp)
      00A287 05 48            [ 2] 3259 	ldw (TOWRITE,sp),x 
      00A289 0A 01            [ 1] 3260 	ld a,#BLOCK_SIZE 
      00A28B 20 F7 6B         [ 2] 3261 	cpw x,#BLOCK_SIZE 
      00A28E 01 90            [ 1] 3262 	jruge 4$ 
      00A290 F6               [ 1] 3263 	ld a,xl 
      00A291 93 EE            [ 1] 3264 4$:	ld (CNT_LO,sp),a 
      00A293 01 72 A9         [ 4] 3265 	call clear_block_buffer 
      00A296 00 03            [ 2] 3266 	jra 32$ 
      00289B                       3267 9$:	_drop VSIZE 
      00A298 84 F4            [ 2]    1     addw sp,#VSIZE 
      00A29A 27 02            [ 2] 3268     popw y 
      00A29C A6               [ 2] 3269 	popw x 
      00A29D 01               [ 4] 3270 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3271 
                                   3272 
      00A29E 5F 97                 3273 SIGNATURE: .ascii "TB"
      00A2A0 4F 81 6E 27 74 20 66  3274 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A2A2 4E 6F 20 61 70 70 6C  3275 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3276 
                                   3277 ;---------------------
                                   3278 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3279 ; write 1 or more byte to FLASH or EEPROM
                                   3280 ; starting at address  
                                   3281 ; input:
                                   3282 ;   expr1  	is address 
                                   3283 ;   expr2,...,exprn   are bytes to write
                                   3284 ; output:
                                   3285 ;   none 
                                   3286 ;---------------------
      0028FB                       3287 write:
      00A2A2 CD 99 E5         [ 4] 3288 	call expression
      00A2A5 A1 02            [ 1] 3289 	cp a,#TK_INTGR 
      00A2A7 27 03            [ 1] 3290 	jreq 0$
      00A2A9 CC 96 B9         [ 2] 3291 	jp syntax_error
      00A2AC                       3292 0$: _xpop 
      00A2AC 90 F6            [ 1]    1     ld a,(y)
      00A2AE 93               [ 1]    2     ldw x,y 
      00A2AF EE 01            [ 2]    3     ldw x,(1,x)
      00A2B1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2B5 9F 88 90         [ 1] 3293 	ld farptr,a 
      00A2B8 F6 93 EE         [ 2] 3294 	ldw ptr16,x 
      002914                       3295 1$:	
      00A2BB 01 72 A9         [ 4] 3296 	call next_token 
      00A2BE 00 03            [ 1] 3297 	cp a,#TK_COMMA 
      00A2C0 84 F7            [ 1] 3298 	jreq 2$ 
      00A2C2 81 20            [ 2] 3299 	jra 9$ ; no more data 
      00A2C3 CD 1A A9         [ 4] 3300 2$:	call expression
      00A2C3 CD 99            [ 1] 3301 	cp a,#TK_INTGR
      00A2C5 E0 A1            [ 1] 3302 	jreq 3$
      00A2C7 01 27 03         [ 2] 3303 	jp syntax_error
      002927                       3304 3$:	_xpop 
      00A2CA CC 96            [ 1]    1     ld a,(y)
      00A2CC B9               [ 1]    2     ldw x,y 
      00A2CD 90 F6            [ 2]    3     ldw x,(1,x)
      00A2CF 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2D3 A9               [ 1] 3305 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A2D4 00               [ 1] 3306 	clrw x 
      00A2D5 03 C7 00         [ 4] 3307 	call write_byte
      00A2D8 19 CF 00         [ 2] 3308 	ldw x,#1 
      00A2DB 1A 92 BC         [ 4] 3309 	call incr_farptr 
      00A2DE 00 19            [ 2] 3310 	jra 1$ 
      00293D                       3311 9$:
      00A2E0 5F               [ 4] 3312 	ret 
                                   3313 
                                   3314 
                                   3315 ;---------------------
                                   3316 ;BASIC: CHAR(expr)
                                   3317 ; évaluate expression 
                                   3318 ; and take the 7 least 
                                   3319 ; bits as ASCII character
                                   3320 ; output: 
                                   3321 ; 	A char 
                                   3322 ;---------------------
      00293E                       3323 func_char:
      00A2E1 97 4F 81         [ 4] 3324 	call func_args 
      00A2E4 A1 01            [ 1] 3325 	cp a,#1
      00A2E4 CD 9C            [ 1] 3326 	jreq 1$
      00A2E6 42 90 F6         [ 2] 3327 	jp syntax_error
      002948                       3328 1$:	_xpop
      00A2E9 93 EE            [ 1]    1     ld a,(y)
      00A2EB 01               [ 1]    2     ldw x,y 
      00A2EC 72 A9            [ 2]    3     ldw x,(1,x)
      00A2EE 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2F2 0D               [ 1] 3329 	ld a,xl
      00A2F3 5D 26            [ 1] 3330 	and a,#0x7f 
      00A2F5 0A               [ 4] 3331 	ret
                                   3332 
                                   3333 ;---------------------
                                   3334 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3335 ; extract first character 
                                   3336 ; of string argument 
                                   3337 ; output:
                                   3338 ;    A:X    int24 
                                   3339 ;---------------------
      002955                       3340 ascii:
      00A2F6 55 00            [ 1] 3341 	ld a,#TK_LPAREN
      00A2F8 04 00 02         [ 4] 3342 	call expect 
      00A2FB 5B 02 CC         [ 4] 3343 	call next_token 
      00A2FE 97 6C            [ 1] 3344 	cp a,#TK_QSTR 
      00A300 81 0E            [ 1] 3345 	jreq 1$
      00A301 A1 04            [ 1] 3346 	cp a,#TK_CHAR 
      00A301 85 52            [ 1] 3347 	jreq 2$ 
      00A303 0D 89            [ 1] 3348 	cp a,#TK_CFUNC 
      00A305 A6 85            [ 1] 3349 	jreq 0$
      00A307 CD 99 D3         [ 2] 3350 	jp syntax_error
      00296C                       3351 0$: ; cfunc 
      00A30A CD               [ 4] 3352 	call (x)
      00A30B 98 45            [ 2] 3353 	jra 3$
      00296F                       3354 1$: ; quoted string 
      00A30D 1F               [ 1] 3355 	ld a,(x)
      00A30E 09               [ 1] 3356 	push a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A30F CD 9D 17         [ 4] 3357 	call skip_string
      00A312 72               [ 1] 3358 	pop a  	
      00A313 14 00            [ 2] 3359 	jra 3$ 
      002977                       3360 2$: ; character 
      00A315 23 CD 98         [ 4] 3361 	call get_char 
      00A318 1D               [ 1] 3362 3$:	clrw x 
      00A319 A1               [ 1] 3363 	rlwa x   
      00297C                       3364 4$:	_xpush  
      00A31A 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A31E 96 B9            [ 1]    2     ld (y),a 
      00A320 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A320 FE 72            [ 1] 3365 	ld a,#TK_RPAREN 
      00A322 5C 00 02         [ 4] 3366 	call expect
      00298A                       3367 9$:	
      00298A                       3368 	_xpop  
      00A325 72 5C            [ 1]    1     ld a,(y)
      00A327 00               [ 1]    2     ldw x,y 
      00A328 02 A3            [ 2]    3     ldw x,(1,x)
      00A32A A3 31 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A32E CC               [ 4] 3369 	ret 
                                   3370 
                                   3371 ;---------------------
                                   3372 ;BASIC: KEY
                                   3373 ; wait for a character 
                                   3374 ; received from STDIN 
                                   3375 ; input:
                                   3376 ;	none 
                                   3377 ; output:
                                   3378 ;	a	 character 
                                   3379 ;---------------------
      002994                       3380 key:
      00A32F 96 B9 EE         [ 4] 3381 	call getc 
      00A331 81               [ 4] 3382 	ret
                                   3383 
                                   3384 ;----------------------
                                   3385 ; BASIC: QKEY
                                   3386 ; Return true if there 
                                   3387 ; is a character in 
                                   3388 ; waiting in STDIN 
                                   3389 ; input:
                                   3390 ;  none 
                                   3391 ; output:
                                   3392 ;   A     0|-1
                                   3393 ;-----------------------
      002998                       3394 qkey:: 
      00A331 72               [ 1] 3395 	clrw x 
      00A332 04 00 23         [ 1] 3396 	ld a,rx1_head
      00A335 03 CC 96         [ 1] 3397 	sub a,rx1_tail 
      00A338 B9 CD            [ 1] 3398 	jreq 9$ 
      00A33A 9B               [ 2] 3399 	cplw x
      00A33B 29 A1            [ 1] 3400 	ld a,#255    
      0029A4                       3401 9$: 
      00A33D 84               [ 4] 3402 	ret 
                                   3403 
                                   3404 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3405 ; BASIC: GPIO(port,reg)
                                   3406 ; return gpio register address 
                                   3407 ; expr {PORTA..PORTI}
                                   3408 ; input:
                                   3409 ;   none 
                                   3410 ; output:
                                   3411 ;   A:X 	gpio register address
                                   3412 ;----------------------------
                                   3413 ;	N=PORT
                                   3414 ;	T=REG 
      0029A5                       3415 gpio:
      00A33E 27 03 CC         [ 4] 3416 	call func_args 
      00A341 96 B9            [ 1] 3417 	cp a,#2
      00A343 90 F6            [ 1] 3418 	jreq 1$
      00A345 93 EE 01         [ 2] 3419 	jp syntax_error  
      0029AF                       3420 1$:	_at_next 
      00A348 72 A9 00         [ 1]    1     ld a,(3,y)
      00A34B 03               [ 1]    2     ldw x,y 
      00A34C 6B 06            [ 2]    3     ldw x,(4,x)
      00A34E 1F 07 CD         [ 2] 3421 	cpw x,#PA_BASE 
      00A351 98 1D            [ 1] 3422 	jrmi bad_port
      00A353 A1 00 27         [ 2] 3423 	cpw x,#PI_BASE+1 
      00A356 17 A1            [ 1] 3424 	jrpl bad_port
      00A358 80               [ 2] 3425 	pushw x 
      0029C0                       3426 	_xpop
      00A359 26 0E            [ 1]    1     ld a,(y)
      00A35B FE               [ 1]    2     ldw x,y 
      00A35C 72 5C            [ 2]    3     ldw x,(1,x)
      00A35E 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A362 00 02 A3         [ 2] 3427 	addw x,(1,sp)
      0029CC                       3428 	_drop 2 
      00A365 A3 77            [ 2]    1     addw sp,#2 
      00A367 27               [ 1] 3429 	clr a 
      00A368 0E               [ 4] 3430 	ret
      00A369                       3431 bad_port:
      00A369 55 00            [ 1] 3432 	ld a,#ERR_BAD_VALUE
      00A36B 03 00 02         [ 2] 3433 	jp tb_error
                                   3434 
                                   3435 
                                   3436 ;-------------------------
                                   3437 ; BASIC: UFLASH 
                                   3438 ; return free flash address
                                   3439 ; align to BLOCK address 
                                   3440 ; input:
                                   3441 ;  none 
                                   3442 ; output:
                                   3443 ;	A		TK_INTGR
                                   3444 ;   xstack	free address 
                                   3445 ;---------------------------
      00A36E                       3446 uflash:
      00A36E 0F 03 AE         [ 4] 3447 	call qsign 
      00A371 00 01            [ 1] 3448 	jrne 1$
      00A373 1F 04 20         [ 2] 3449 	ldw x,#app_space 
      00A376 2F BB 36 02      [ 2] 3450 	addw x,app_size 
      00A377 1C 00 04         [ 2] 3451 	addw x,#4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3452 ; align on 128 bytes block 
      00A377 72 04 00         [ 2] 3453 	addw x,#BLOCK_SIZE 
      00A37A 23               [ 1] 3454 	ld a,xl 
      00A37B 03 CC            [ 1] 3455 	and a,#0x80 
      00A37D 96               [ 1] 3456 	ld xl,a 
      00A37E B9 CD            [ 2] 3457 	jra 2$
      00A380 9B 29 A1         [ 2] 3458 1$:	ldw x,#app_space 
      0029F0                       3459 2$:
      00A383 84               [ 1] 3460 	clr a 
      00A384 27               [ 4] 3461 	ret 
                                   3462 
                                   3463 
                                   3464 ;---------------------
                                   3465 ; BASIC: USR(addr,arg)
                                   3466 ; execute a function written 
                                   3467 ; in binary code.
                                   3468 ; input:
                                   3469 ;   addr	routine address 
                                   3470 ;   arg 	is an argument
                                   3471 ;           it can be ignore 
                                   3472 ;           by cally. 
                                   3473 ; output:
                                   3474 ;   xstack 	value returned by cally  
                                   3475 ;---------------------
      0029F2                       3476 usr:
      00A385 03 CC 96         [ 4] 3477 	call func_args 
      00A388 B9 02            [ 1] 3478 	cp a,#2
      00A389 27 03            [ 1] 3479 	jreq 1$  
      00A389 90 F6 93         [ 2] 3480 	jp syntax_error 
      0029FC                       3481 1$: 
      0029FC                       3482 	_at_next ; A:X addr 
      00A38C EE 01 72         [ 1]    1     ld a,(3,y)
      00A38F A9               [ 1]    2     ldw x,y 
      00A390 00 03            [ 2]    3     ldw x,(4,x)
      00A392 6B 03 1F         [ 2] 3483 	ldw ptr16,X 
      002A05                       3484 	_xpop  ; arg 
      00A395 04 4D            [ 1]    1     ld a,(y)
      00A397 2A               [ 1]    2     ldw x,y 
      00A398 0D 7B            [ 2]    3     ldw x,(1,x)
      00A39A 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      002A0E                       3485 	_store_top ; overwrite addr 
      00A39E 00 01            [ 1]    1     ld (y),a 
      00A3A0 A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A3A3 06 1F 07 19      [ 6] 3486     call [ptr16]
      00A3A6 81               [ 4] 3487 	ret 
                                   3488 
                                   3489 
                                   3490 ;------------------------------
                                   3491 ; BASIC: BYE 
                                   3492 ; halt mcu in its lowest power mode 
                                   3493 ; wait for reset or external interrupt
                                   3494 ; do a cold start on wakeup.
                                   3495 ;------------------------------
      002A18                       3496 bye:
      00A3A6 CE 00 05 1F 0D   [ 2] 3497 	btjf UART1_SR,#UART_SR_TC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A3AB CE               [10] 3498 	halt
      00A3AC 00 01 1F         [ 2] 3499 	jp cold_start  
                                   3500 
                                   3501 ;----------------------------------
                                   3502 ; BASIC: SLEEP 
                                   3503 ; halt mcu until reset or external
                                   3504 ; interrupt.
                                   3505 ; Resume progam after SLEEP command
                                   3506 ;----------------------------------
      002A21                       3507 sleep:
      00A3AF 0B 72 15 00 23   [ 2] 3508 	btjf UART1_SR,#UART_SR_TC,.
      00A3B4 72 5C 00 20      [ 1] 3509 	bset flags,#FSLEEP
      00A3B8 81               [10] 3510 	halt 
      00A3B9 81               [ 4] 3511 	ret 
                                   3512 
                                   3513 ;-------------------------------
                                   3514 ; BASIC: PAUSE expr 
                                   3515 ; suspend execution for n msec.
                                   3516 ; input:
                                   3517 ;	none
                                   3518 ; output:
                                   3519 ;	none 
                                   3520 ;------------------------------
      002A2C                       3521 pause:
      00A3B9 72 5D 00         [ 4] 3522 	call expression
      00A3BC 20 26            [ 1] 3523 	cp a,#TK_INTGR
      00A3BE 03 CC            [ 1] 3524 	jreq 1$ 
      00A3C0 96 B9 39         [ 2] 3525 	jp syntax_error
      00A3C2                       3526 1$: _xpop 
      00A3C2 A6 85            [ 1]    1     ld a,(y)
      00A3C4 CD               [ 1]    2     ldw x,y 
      00A3C5 99 D3            [ 2]    3     ldw x,(1,x)
      00A3C7 CD 98 45 13      [ 2]    4     addw y,#CELL_SIZE 
      002A3F                       3527 pause02:
      00A3CB 09 27 03         [ 2] 3528 	ldw timer,x 
      00A3CE CC 96 B9         [ 2] 3529 1$: ldw x,timer 
      00A3D1 5D               [ 2] 3530 	tnzw x 
      00A3D1 CF 00            [ 1] 3531 	jreq 2$
      00A3D3 1A               [10] 3532 	wfi 
      00A3D4 F6 EE            [ 1] 3533 	jrne 1$
      002A4B                       3534 2$:	
      00A3D6 01               [ 4] 3535 	ret 
                                   3536 
                                   3537 ;------------------------------
                                   3538 ; BASIC: AWU expr
                                   3539 ; halt mcu for 'expr' milliseconds
                                   3540 ; use Auto wakeup peripheral
                                   3541 ; all oscillators stopped except LSI
                                   3542 ; range: 1ms - 511ms
                                   3543 ; input:
                                   3544 ;  none
                                   3545 ; output:
                                   3546 ;  none:
                                   3547 ;------------------------------
      002A4C                       3548 awu:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A3D7 72 FB 04         [ 4] 3549   call expression
      00A3DA 19 03            [ 1] 3550   cp a,#TK_INTGR
      00A3DC 72 C7            [ 1] 3551   jreq 1$
      00A3DE 00 1A 72         [ 2] 3552   jp syntax_error
      002A56                       3553 1$: _xpop 
      00A3E1 5C 00            [ 1]    1     ld a,(y)
      00A3E3 1B               [ 1]    2     ldw x,y 
      00A3E4 72 CF            [ 2]    3     ldw x,(1,x)
      00A3E6 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A5F                       3554 awu02:
      00A3EA 0D CF 00         [ 2] 3555   cpw x,#5120
      00A3ED 0E 7B            [ 1] 3556   jrmi 1$ 
      00A3EF 06 1E 07 72      [ 1] 3557   mov AWU_TBR,#15 
      00A3F3 B0 00            [ 1] 3558   ld a,#30
      00A3F5 0E               [ 2] 3559   div x,a
      00A3F6 C2 00            [ 1] 3560   ld a,#16
      00A3F8 0D               [ 2] 3561   div x,a 
      00A3F9 18 03            [ 2] 3562   jra 4$
      002A70                       3563 1$: 
      00A3FB A8 80 2B         [ 2] 3564   cpw x,#2048
      00A3FE 12 20            [ 1] 3565   jrmi 2$ 
      00A400 25 7B 03 2A      [ 1] 3566   mov AWU_TBR,#14
      00A404 07 C6            [ 1] 3567   ld a,#80
      00A406 00               [ 2] 3568   div x,a 
      00A407 0F 2F            [ 2] 3569   jra 4$   
      002A7E                       3570 2$:
      00A409 07 20 1A F2      [ 1] 3571   mov AWU_TBR,#7
      00A40C                       3572 3$:  
                                   3573 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A40C 72 0E 00         [ 2] 3574   cpw x,#64 
      00A40F 0F 15            [ 2] 3575   jrule 4$ 
      00A411 72 5C 50 F2      [ 1] 3576   inc AWU_TBR 
      00A411 1E               [ 2] 3577   srlw x 
      00A412 0D CF            [ 2] 3578   jra 3$ 
      002A8E                       3579 4$:
      00A414 00               [ 1] 3580   ld a, xl
      00A415 05               [ 1] 3581   dec a 
      00A416 72 01            [ 1] 3582   jreq 5$
      00A418 00               [ 1] 3583   dec a 	
      002A93                       3584 5$: 
      00A419 23 05            [ 1] 3585   and a,#0x3e 
      00A41B E6 02 C7         [ 1] 3586   ld AWU_APR,a 
      00A41E 00 04 1E 0B      [ 1] 3587   bset AWU_CSR,#AWU_CSR_AWUEN
      00A422 CF               [10] 3588   halt 
                                   3589 
      00A423 00               [ 4] 3590   ret 
                                   3591 
                                   3592 ;------------------------------
                                   3593 ; BASIC: TICKS
                                   3594 ; return msec ticks counter value 
                                   3595 ; input:
                                   3596 ; 	none 
                                   3597 ; output:
                                   3598 ;	X 		TK_INTGR
                                   3599 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      002A9E                       3600 get_ticks:
      00A424 01 81 0F         [ 1] 3601 	ld a,ticks 
      00A426 CE 00 10         [ 2] 3602 	ldw x,ticks+1 
      00A426 85               [ 4] 3603 	ret 
                                   3604 
                                   3605 ;------------------------------
                                   3606 ; BASIC: ABS(expr)
                                   3607 ; return absolute value of expr.
                                   3608 ; input:
                                   3609 ;   none
                                   3610 ; output:
                                   3611 ;   xstack    positive int24 
                                   3612 ;-------------------------------
      002AA5                       3613 abs:
      00A427 5B 0D 72         [ 4] 3614 	call func_args 
      00A42A 5A 00            [ 1] 3615 	cp a,#1 
      00A42C 20 FC            [ 1] 3616 	jreq 0$ 
      00A42E CC 16 39         [ 2] 3617 	jp syntax_error
      002AAF                       3618 0$:  
      00A42E CD 98 1D         [ 4] 3619 	call abs24 
      002AB2                       3620 	_xpop 
      00A431 A1 84            [ 1]    1     ld a,(y)
      00A433 27               [ 1]    2     ldw x,y 
      00A434 07 A1            [ 2]    3     ldw x,(1,x)
      00A436 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A43A 96               [ 4] 3621 	ret 
                                   3622 
                                   3623 ;------------------------------
                                   3624 ; BASIC: LSHIFT(expr1,expr2)
                                   3625 ; logical shift left expr1 by 
                                   3626 ; expr2 bits 
                                   3627 ; output:
                                   3628 ; 	A:x 	result 
                                   3629 ;------------------------------
      002ABC                       3630 lshift:
      00A43B B9 19 60         [ 4] 3631 	call func_args
      00A43C A1 02            [ 1] 3632 	cp a,#2 
      00A43C 90 89            [ 1] 3633 	jreq 1$
      00A43E CD 98 4F         [ 2] 3634 	jp syntax_error
      002AC6                       3635 1$: _xpop 
      00A441 4F 90            [ 1]    1     ld a,(y)
      00A443 CE               [ 1]    2     ldw x,y 
      00A444 00 05            [ 2]    3     ldw x,(1,x)
      00A446 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A44A 13               [ 1] 3636 	ld a,xl 
      00A44B 01               [ 1] 3637 	push a      
      002AD1                       3638 	_xpop  ; T>A:X 
      00A44C 5B 02            [ 1]    1     ld a,(y)
      00A44E 25               [ 1]    2     ldw x,y 
      00A44F 01 4C            [ 2]    3     ldw x,(1,x)
      00A451 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A451 CD 8C            [ 1] 3639 	tnz (1,sp) 
      00A453 98 5D            [ 1] 3640 	jreq 4$
      00A455 26               [ 1] 3641 2$:	rcf 
      00A456 05               [ 2] 3642 	rlcw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A457 A6               [ 1] 3643 	rlc a 
      00A458 05 CC            [ 1] 3644 	dec (1,sp) 
      00A45A 96 BB            [ 1] 3645 	jrne 2$
      002AE5                       3646 4$: _drop 1 
      00A45C 90 85            [ 2]    1     addw sp,#1 
      00A45E 81               [ 4] 3647 	ret
                                   3648 
                                   3649 ;------------------------------
                                   3650 ; BASIC: RSHIFT(expr1,expr2)
                                   3651 ; logical shift right expr1 by 
                                   3652 ; expr2 bits.
                                   3653 ; output:
                                   3654 ; 	A 		TK_INTGR
                                   3655 ;   X 		result 
                                   3656 ;------------------------------
      00A45F                       3657 rshift:
      00A45F 90 89 89         [ 4] 3658 	call func_args
      00A462 CD 98            [ 1] 3659 	cp a,#2 
      00A464 36 72            [ 1] 3660 	jreq 1$
      00A466 5F 00 0E         [ 2] 3661 	jp syntax_error
      002AF2                       3662 1$: _xpop ; T>A:X
      00A469 90 CE            [ 1]    1     ld a,(y)
      00A46B 00               [ 1]    2     ldw x,y 
      00A46C 1C 90            [ 2]    3     ldw x,(1,x)
      00A46E E6 03 A1 03      [ 2]    4     addw y,#CELL_SIZE 
      00A472 27               [ 1] 3663     ld a,xl 
      00A473 15               [ 1] 3664 	push a    
      002AFD                       3665 	_xpop  
      00A474 90 E6            [ 1]    1     ld a,(y)
      00A476 02               [ 1]    2     ldw x,y 
      00A477 C7 00            [ 2]    3     ldw x,(1,x)
      00A479 0F 72 B9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A47D 0E 90            [ 1] 3666 	tnz (1,sp)
      00A47F C3 00            [ 1] 3667 	jreq 4$
      00A481 1E               [ 1] 3668 2$:	rcf 
      00A482 25               [ 1] 3669 	rrc a 
      00A483 E9               [ 2] 3670 	rrcw x 
      00A484 A6 0A            [ 1] 3671 	dec (1,sp) 
      00A486 CC 96            [ 1] 3672 	jrne 2$
      002B11                       3673 4$: _drop 1 
      00A488 BB 01            [ 2]    1     addw sp,#1 
      00A489 81               [ 4] 3674 	ret
                                   3675 
                                   3676 ;--------------------------
                                   3677 ; BASIC: FCPU integer
                                   3678 ; set CPU frequency 
                                   3679 ;-------------------------- 
                                   3680 
      002B14                       3681 fcpu:
      00A489 90 89            [ 1] 3682 	ld a,#TK_INTGR
      00A48B 72 A9 00         [ 4] 3683 	call expect 
      00A48E 04 1E 03         [ 4] 3684 	call get_int24 
      00A491 CD               [ 1] 3685 	ld a,xl 
      00A492 93 E4            [ 1] 3686 	and a,#7 
      00A494 26 04 90         [ 1] 3687 	ld CLK_CKDIVR,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A497 85               [ 4] 3688 	ret 
                                   3689 
                                   3690 ;------------------------------
                                   3691 ; BASIC: PMODE pin#, mode 
                                   3692 ; Arduino pin. 
                                   3693 ; define pin as input or output
                                   3694 ; pin#: {0..15}
                                   3695 ; mode: INPUT|OUTPUT  
                                   3696 ;------------------------------
                           000001  3697 	PINNO=1
                           000001  3698 	VSIZE=1
      002B23                       3699 pin_mode:
      002B23                       3700 	_vars VSIZE 
      00A498 20 DA            [ 2]    1     sub sp,#VSIZE 
      00A49A CD 19 65         [ 4] 3701 	call arg_list 
      00A49A 85 5B            [ 1] 3702 	cp a,#2 
      00A49C 02 90            [ 1] 3703 	jreq 1$
      00A49E 85 81 39         [ 2] 3704 	jp syntax_error 
      00A4A0                       3705 1$: _xpop 
      00A4A0 72 00            [ 1]    1     ld a,(y)
      00A4A2 00               [ 1]    2     ldw x,y 
      00A4A3 23 05            [ 2]    3     ldw x,(1,x)
      00A4A5 A6 06 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A4A9 BB CD 9B         [ 2] 3706 	ldw ptr16,x ; mode 
      002B3B                       3707 	_xpop ; Dx pin 
      00A4AC 29 A1            [ 1]    1     ld a,(y)
      00A4AE 84               [ 1]    2     ldw x,y 
      00A4AF 27 03            [ 2]    3     ldw x,(1,x)
      00A4B1 CC 96 B9 90      [ 2]    4     addw y,#CELL_SIZE 
      00A4B5 F6 93 EE         [ 4] 3708 	call select_pin 
      00A4B8 01 72            [ 1] 3709 	ld (PINNO,sp),a  
      00A4BA A9 00            [ 1] 3710 	ld a,#1 
      00A4BC 03 9F            [ 1] 3711 	tnz (PINNO,sp)
      00A4BE 27 68            [ 1] 3712 	jreq 4$
      00A4C0 88               [ 1] 3713 2$:	sll a 
      00A4C1 CD 98            [ 1] 3714 	dec (PINNO,sp)
      00A4C3 1D A1            [ 1] 3715 	jrne 2$ 
      00A4C5 80 27            [ 1] 3716 	ld (PINNO,sp),a
      00A4C7 03 CC            [ 1] 3717 	ld a,(PINNO,sp)
      00A4C9 96 B9            [ 1] 3718 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4CB FE 72            [ 1] 3719 	ld (GPIO_CR1,x),a 
      00A4CD 5C 00            [ 1] 3720 4$:	ld a,#OUTP
      00A4CF 02 72 5C         [ 1] 3721 	cp a,acc8 
      00A4D2 00 02            [ 1] 3722 	jreq 6$
                                   3723 ; input mode
                                   3724 ; disable external interrupt 
      00A4D4 A3 A5            [ 1] 3725 	ld a,(PINNO,sp)
      00A4D6 32               [ 1] 3726 	cpl a 
      00A4D7 27 08            [ 1] 3727 	and a,(GPIO_CR2,x)
      00A4D9 A3 A5            [ 1] 3728 	ld (GPIO_CR2,x),a 
                                   3729 ;clear bit in DDR for input mode 
      00A4DB 4C 27            [ 1] 3730 	ld a,(PINNO,sp)
      00A4DD 03               [ 1] 3731 	cpl a 
      00A4DE CC 96            [ 1] 3732 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4E0 B9 02            [ 1] 3733 	ld (GPIO_DDR,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A4E1 20 0C            [ 2] 3734 	jra 9$
      002B73                       3735 6$: ;output mode  
      00A4E1 84 89            [ 1] 3736 	ld a,(PINNO,sp)
      00A4E3 88 02            [ 1] 3737 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4E4 E7 02            [ 1] 3738 	ld (GPIO_DDR,x),a 
      00A4E4 0A 01            [ 1] 3739 	ld a,(PINNO,sp)
      00A4E6 27 26            [ 1] 3740 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4E8 CD 98            [ 1] 3741 	ld (GPIO_CR2,x),a 
      002B7F                       3742 9$:	
      002B7F                       3743 	_drop VSIZE 
      00A4EA 1D A1            [ 2]    1     addw sp,#VSIZE 
      00A4EC 84               [ 4] 3744 	ret
                                   3745 
                                   3746 ;------------------------
                                   3747 ; select Arduino pin 
                                   3748 ; input:
                                   3749 ;   X 	 {0..15} Arduino Dx 
                                   3750 ; output:
                                   3751 ;   A     stm8s208 pin 
                                   3752 ;   X     base address s208 GPIO port 
                                   3753 ;---------------------------
      002B82                       3754 select_pin:
      00A4ED 27               [ 2] 3755 	sllw x 
      00A4EE 07 A1 03         [ 2] 3756 	addw x,#arduino_to_8s208 
      00A4F1 27               [ 2] 3757 	ldw x,(x)
      00A4F2 0D               [ 1] 3758 	ld a,xl 
      00A4F3 CC               [ 1] 3759 	push a 
      00A4F4 96               [ 1] 3760 	swapw x 
      00A4F5 B9 05            [ 1] 3761 	ld a,#5 
      00A4F6 42               [ 4] 3762 	mul x,a 
      00A4F6 C6 00 02         [ 2] 3763 	addw x,#GPIO_BASE 
      00A4F9 AB               [ 1] 3764 	pop a 
      00A4FA 03               [ 4] 3765 	ret 
                                   3766 ; translation from Arduino D0..D15 to stm8s208rb 
      002B92                       3767 arduino_to_8s208:
      00A4FB C7 00                 3768 .byte 3,6 ; D0 
      00A4FD 02 20                 3769 .byte 3,5 ; D1 
      00A4FF 03 CD                 3770 .byte 4,0 ; D2 
      00A501 98 36                 3771 .byte 2,1 ; D3
      00A503 06 00                 3772 .byte 6,0 ; D4
      00A503 CD 98                 3773 .byte 2,2 ; D5
      00A505 1D A1                 3774 .byte 2,3 ; D6
      00A507 08 27                 3775 .byte 3,1 ; D7
      00A509 DA 5B                 3776 .byte 3,3 ; D8
      00A50B 03 20                 3777 .byte 2,4 ; D9
      00A50D 1A 05                 3778 .byte 4,5 ; D10
      00A50E 02 06                 3779 .byte 2,6 ; D11
      00A50E 5B 01                 3780 .byte 2,7 ; D12
      00A510 CD A4                 3781 .byte 2,5 ; D13
      00A512 2E CF                 3782 .byte 4,2 ; D14
      00A514 00 1A                 3783 .byte 4,1 ; D15
                                   3784 
                                   3785 
                                   3786 ;------------------------------
                                   3787 ; BASIC: RND(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3788 ; return random number 
                                   3789 ; between 1 and expr inclusive
                                   3790 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3791 ; input:
                                   3792 ; 	none 
                                   3793 ; output:
                                   3794 ;	xstack 	random positive integer 
                                   3795 ;------------------------------
      002BB2                       3796 random:
      00A516 55 00 04         [ 4] 3797 	call func_args 
      00A519 00 02            [ 1] 3798 	cp a,#1
      00A51B 85 A3            [ 1] 3799 	jreq 1$
      00A51D A5 32 26         [ 2] 3800 	jp syntax_error
      002BBC                       3801 1$:  
      002BBC                       3802 	_xpop   
      00A520 05 CE            [ 1]    1     ld a,(y)
      00A522 00               [ 1]    2     ldw x,y 
      00A523 1A 20            [ 2]    3     ldw x,(1,x)
      00A525 19 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A526 89               [ 2] 3803 	pushw x 
      00A526 20               [ 1] 3804 	push a  
      00A527 35 80            [ 1] 3805 	ld a,#0x80 
      00A528 15 01            [ 1] 3806 	bcp a,(1,sp)
      00A528 55 00            [ 1] 3807 	jreq 2$
      00A52A 04 00            [ 1] 3808 	ld a,#ERR_BAD_VALUE
      00A52C 02 5B 02         [ 2] 3809 	jp tb_error
      002BD2                       3810 2$: 
                                   3811 ; acc16=(x<<5)^x 
      00A52F CC 97 6C         [ 2] 3812 	ldw x,seedx 
      00A532 58               [ 2] 3813 	sllw x 
      00A532 72               [ 2] 3814 	sllw x 
      00A533 00               [ 2] 3815 	sllw x 
      00A534 00               [ 2] 3816 	sllw x 
      00A535 23               [ 2] 3817 	sllw x 
      00A536 05               [ 1] 3818 	ld a,xh 
      00A537 A6 06 CC         [ 1] 3819 	xor a,seedx 
      00A53A 96 BB 0D         [ 1] 3820 	ld acc16,a 
      00A53C 9F               [ 1] 3821 	ld a,xl 
      00A53C CD A4 2E         [ 1] 3822 	xor a,seedx+1 
      00A53F C7 00 0E         [ 1] 3823 	ld acc8,a 
                                   3824 ; seedx=seedy 
      00A53F CF 00 05         [ 2] 3825 	ldw x,seedy 
      00A542 E6 02 C7         [ 2] 3826 	ldw seedx,x  
                                   3827 ; seedy=seedy^(seedy>>1)
      00A545 00 04 35         [ 2] 3828 	ldw x,seedy 
      00A548 03               [ 2] 3829 	srlw x 
      00A549 00               [ 1] 3830 	ld a,xh 
      00A54A 02 81 16         [ 1] 3831 	xor a,seedy 
      00A54C C7 00 16         [ 1] 3832 	ld seedy,a  
      00A54C 72               [ 1] 3833 	ld a,xl 
      00A54D 00 00 23         [ 1] 3834 	xor a,seedy+1 
      00A550 06 A6 06         [ 1] 3835 	ld seedy+1,a 
                                   3836 ; acc16>>3 
      00A553 CC 96 BB         [ 2] 3837 	ldw x,acc16 
      00A556 81               [ 2] 3838 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A557 54               [ 2] 3839 	srlw x 
      00A557 CD               [ 2] 3840 	srlw x 
                                   3841 ; x=acc16^x 
      00A558 A4               [ 1] 3842 	ld a,xh 
      00A559 2E CF 00         [ 1] 3843 	xor a,acc16 
      00A55C 1A 00 0D         [ 1] 3844 	ld acc16,a 
      00A55D 9F               [ 1] 3845 	ld a,xl 
      00A55D 85 52 04         [ 1] 3846 	xor a,acc8 
      00A560 89 CE 00         [ 1] 3847 	ld acc8,a 
                                   3848 ; seedy=acc16^seedy 
      00A563 05 1F 03         [ 1] 3849 	xor a,seedy+1
      00A566 CE               [ 1] 3850 	ld xl,a 
      00A567 00 01 1F         [ 1] 3851 	ld a,acc16 
      00A56A 05 CE 00         [ 1] 3852 	xor a,seedy
      00A56D 1A               [ 1] 3853 	ld xh,a 
      00A56E 20 CF 16         [ 2] 3854 	ldw seedy,x 
                                   3855 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A570 C6 00 15         [ 1] 3856 	ld a,seedx+1
      00A570 72 00            [ 1] 3857 	and a,#127
      002C27                       3858 	_xpush 
      00A572 00 23 05 A6      [ 2]    1     subw y,#CELL_SIZE
      00A576 06 CC            [ 1]    2     ld (y),a 
      00A578 96 BB 01         [ 2]    3     ldw (1,y),x 
      00A57A 84               [ 1] 3859 	pop a 
      00A57A 1E               [ 2] 3860 	popw x 
      002C32                       3861 	_xpush 
      00A57B 03 CF 00 05      [ 2]    1     subw y,#CELL_SIZE
      00A57F E6 02            [ 1]    2     ld (y),a 
      00A581 C7 00 04         [ 2]    3     ldw (1,y),x 
      00A584 1E 05 CF         [ 4] 3862 	call mod24 
      002C3E                       3863 	_xpop
      00A587 00 01            [ 1]    1     ld a,(y)
      00A589 85               [ 1]    2     ldw x,y 
      00A58A 5B 04            [ 2]    3     ldw x,(1,x)
      00A58C FC A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A58D 1C 00 01         [ 2] 3864 	addw x,#1 
      00A58D 72 01            [ 1] 3865 	adc a,#0  
      00A58F 00               [ 4] 3866 	ret 
                                   3867 
                                   3868 ;---------------------------------
                                   3869 ; BASIC: WORDS 
                                   3870 ; affiche la listes des mots du
                                   3871 ; dictionnaire ainsi que le nombre
                                   3872 ; de mots.
                                   3873 ;---------------------------------
                           000001  3874 	WLEN=1 ; word length
                           000002  3875 	LLEN=2 ; character sent to console
                           000003  3876 	WCNT=3 ; count words printed 
                           000003  3877 	VSIZE=3 
      002C4D                       3878 words:
      00A590 23 02            [ 2] 3879 	pushw y
      002C4F                       3880 	_vars VSIZE
      00A592 4F 81            [ 2]    1     sub sp,#VSIZE 
      00A594 0F 02            [ 1] 3881 	clr (LLEN,sp)
      00A594 72 09            [ 1] 3882 	clr (WCNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A596 00 23 12 5B      [ 2] 3883 	ldw y,#kword_dict+2
      00A59A 02               [ 1] 3884 0$:	ldw x,y
      00A59B CD               [ 1] 3885 	ld a,(x)
      00A59C A1 12            [ 1] 3886 	and a,#15 
      00A59E 5B 04            [ 1] 3887 	ld (WLEN,sp),a 
      00A5A0 72 19            [ 1] 3888 	inc (WCNT,sp)
      00A5A2 00               [ 1] 3889 1$:	incw x 
      00A5A3 23               [ 1] 3890 	ld a,(x)
      00A5A4 72 10 00         [ 4] 3891 	call putc 
      00A5A7 23 CC            [ 1] 3892 	inc (LLEN,sp)
      00A5A9 97 64            [ 1] 3893 	dec (WLEN,sp)
      00A5AB CE 00            [ 1] 3894 	jrne 1$
      00A5AD 1C C3            [ 1] 3895 	ld a,#70
      00A5AF 00 1E            [ 1] 3896 	cp a,(LLEN,sp)
      00A5B1 2B 0C            [ 1] 3897 	jrmi 2$   
      00A5B3 AE 96            [ 1] 3898 	ld a,#SPACE 
      00A5B5 2C CD 89         [ 4] 3899 	call putc 
      00A5B8 BB 55            [ 1] 3900 	inc (LLEN,sp) 
      00A5BA 00 04            [ 2] 3901 	jra 3$
      00A5BC 00 02            [ 1] 3902 2$: ld a,#CR 
      00A5BE 81 08 DE         [ 4] 3903 	call putc 
      00A5BF 0F 02            [ 1] 3904 	clr (LLEN,sp)
      00A5BF 5B 02 00 02      [ 2] 3905 3$:	subw y,#2 
      00A5C1 90 FE            [ 2] 3906 	ldw y,(y)
      00A5C1 CD 9C            [ 1] 3907 	jrne 0$ 
      00A5C3 F6 CD            [ 1] 3908 	ld a,#CR 
      00A5C5 94 49 CE         [ 4] 3909 	call putc  
      00A5C8 00               [ 1] 3910 	clrw x 
      00A5C9 1E CF            [ 1] 3911 	ld a,(WCNT,sp)
      00A5CB 00               [ 1] 3912 	ld xl,a 
      00A5CC 31 CF 00         [ 4] 3913 	call prt_i16 
      00A5CF 33 5F CF         [ 2] 3914 	ldw x,#words_count_msg
      00A5D2 00 07 72         [ 4] 3915 	call puts 
      002C9C                       3916 	_drop VSIZE 
      00A5D5 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A5D7 09 72            [ 2] 3917 	popw y 
      00A5D9 5F               [ 4] 3918 	ret 
      00A5DA 00 0A CE 00 1C CF 00  3919 words_count_msg: .asciz " words in dictionary\n"
             05 E6 02 C7 00 04 35
             03 00 02 72 10 00 23
             CC
                                   3920 
                                   3921 
                                   3922 ;-----------------------------
                                   3923 ; BASIC: TIMER expr 
                                   3924 ; initialize count down timer 
                                   3925 ;-----------------------------
      002CB7                       3926 set_timer:
      00A5F0 97 64 65         [ 4] 3927 	call arg_list
      00A5F2 A1 01            [ 1] 3928 	cp a,#1 
      00A5F2 AE 17            [ 1] 3929 	jreq 1$
      00A5F4 FF 94 CC         [ 2] 3930 	jp syntax_error
      002CC1                       3931 1$: 
      002CC1                       3932 	_xpop  
      00A5F7 97 45            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A5F9 93               [ 1]    2     ldw x,y 
      00A5F9 CD 98            [ 2]    3     ldw x,(1,x)
      00A5FB 1D A1 85 27      [ 2]    4     addw y,#CELL_SIZE 
      00A5FF 03 CC 96         [ 2] 3933 	ldw timer,x 
      00A602 B9               [ 4] 3934 	ret 
                                   3935 
                                   3936 ;------------------------------
                                   3937 ; BASIC: TIMEOUT 
                                   3938 ; return state of timer 
                                   3939 ; output:
                                   3940 ;   A:X     0 not timeout 
                                   3941 ;   A:X     -1 timeout 
                                   3942 ;------------------------------
      002CCE                       3943 timeout:
      00A603 CD               [ 1] 3944 	clr a 
      00A604 98 45 CF         [ 2] 3945 	ldw x,timer 
      00A607 00 1A            [ 1] 3946 	jreq 1$
      00A609 CD               [ 1] 3947 	clrw x
      00A60A 89               [ 4] 3948 	ret  
      00A60B 67               [ 1] 3949 1$:	cpl a
      00A60C 27               [ 2] 3950 	cplw x 
      00A60D 03               [ 4] 3951 	ret 
                                   3952  	
                                   3953 
                                   3954 
                                   3955 
                                   3956 ;-----------------------------------
                                   3957 ; BASIC: IWDGEN expr1 
                                   3958 ; enable independant watchdog timer
                                   3959 ; expr1 is delay in multiple of 62.5µsec
                                   3960 ; expr1 -> {1..16383}
                                   3961 ;-----------------------------------
      002CD9                       3962 enable_iwdg:
      00A60E CD 89 6E         [ 4] 3963 	call arg_list
      00A611 72 3F            [ 1] 3964 	cp a,#1 
      00A613 00 1A            [ 1] 3965 	jreq 1$
      00A615 72 5C 00         [ 2] 3966 	jp syntax_error 
      002CE3                       3967 1$: _xpop  
      00A618 1B 72            [ 1]    1     ld a,(y)
      00A61A 3F               [ 1]    2     ldw x,y 
      00A61B 00 1A            [ 2]    3     ldw x,(1,x)
      00A61D 72 5C 00 1B      [ 2]    4     addw y,#CELL_SIZE 
      00A621 72 C7            [ 1] 3968 	push #0
      00A623 00 1A 81 E0      [ 1] 3969 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A626 9E               [ 1] 3970 	ld a,xh 
      00A626 90 89            [ 1] 3971 	and a,#0x3f
      00A628 AE               [ 1] 3972 	ld xh,a  
      00A629 00 64 90         [ 2] 3973 2$:	cpw x,#255
      00A62C AE 03            [ 2] 3974 	jrule 3$
      00A62E E8 20            [ 1] 3975 	inc (1,sp)
      00A630 22               [ 1] 3976 	rcf 
      00A631 56               [ 2] 3977 	rrcw x 
      00A631 90 89            [ 2] 3978 	jra 2$
      00A633 CD 99 E5 A1      [ 1] 3979 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A637 02               [ 1] 3980 	pop a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A638 27 03 CC         [ 1] 3981 	ld IWDG_PR,a 
      00A63B 96               [ 1] 3982 	ld a,xl
      00A63C B9               [ 1] 3983 	dec a 
      00A63D 35 55 50 E0      [ 1] 3984 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A63D 90 F6 93         [ 1] 3985 	ld IWDG_RLR,a 
      00A640 EE 01 72 A9      [ 1] 3986 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A644 00               [ 4] 3987 	ret 
                                   3988 
                                   3989 
                                   3990 ;-----------------------------------
                                   3991 ; BASIC: IWDGREF  
                                   3992 ; refresh independant watchdog count down 
                                   3993 ; timer before it reset MCU. 
                                   3994 ;-----------------------------------
      002D17                       3995 refresh_iwdg:
      00A645 03 89 90 F6      [ 1] 3996 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A649 93               [ 4] 3997 	ret 
                                   3998 
                                   3999 
                                   4000 ;-------------------------------------
                                   4001 ; BASIC: LOG2(expr)
                                   4002 ; return logarithm base 2 of expr 
                                   4003 ; this is the position of most significant
                                   4004 ; bit set. 
                                   4005 ; input: 
                                   4006 ; output:
                                   4007 ;   A     TK_INTGR 
                                   4008 ;   xstack log2 
                                   4009 ;*********************************
      002D1C                       4010 log2:
      00A64A EE 01 72         [ 4] 4011 	call func_args 
      00A64D A9 00            [ 1] 4012 	cp a,#1 
      00A64F 03 90            [ 1] 4013 	jreq 1$
      00A651 93 85 39         [ 2] 4014 	jp syntax_error 
      00A653                       4015 1$: 
      002D26                       4016 	_xpop    
      00A653 89 AE            [ 1]    1     ld a,(y)
      00A655 F4               [ 1]    2     ldw x,y 
      00A656 24 65            [ 2]    3     ldw x,(1,x)
      00A658 90 A3 7A 12      [ 2]    4     addw y,#CELL_SIZE 
      00A65C 2B               [ 1] 4017 	tnz a
      00A65D 01 5C            [ 1] 4018 	jrne 2$ 
      00A65F 5D               [ 2] 4019 	tnzw x 
      00A65F 9E C7            [ 1] 4020 	jrne 2$
      00A661 53 0D            [ 1] 4021 	ld a,#ERR_BAD_VALUE
      00A663 9F C7 53         [ 2] 4022 	jp tb_error 
      00A666 0E 8C            [ 1] 4023 2$: push #24 
      00A668 56               [ 2] 4024 3$: rlcw x 
      00A669 9E               [ 1] 4025     rlc a 
      00A66A C7 53            [ 1] 4026 	jrc 4$
      00A66C 0F 9F            [ 1] 4027 	dec (1,sp) 
      00A66E C7 53            [ 1] 4028 	jrne 3$
      00A670 10               [ 1] 4029 4$: clrw x 
      00A671 72               [ 1] 4030     pop a 
      00A672 10               [ 1] 4031 	dec a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A673 53               [ 1] 4032 	rlwa x  
      002D48                       4033 9$:	
      00A674 08               [ 4] 4034 	ret 
                                   4035 
                                   4036 ;-----------------------------------
                                   4037 ; BASIC: BIT(expr) 
                                   4038 ; expr ->{0..23}
                                   4039 ; return 2^expr 
                                   4040 ; output:
                                   4041 ;    A:X    2^expr 
                                   4042 ;-----------------------------------
      002D49                       4043 bitmask:
      00A675 72 10 53         [ 4] 4044     call func_args 
      00A678 00 72            [ 1] 4045 	cp a,#1
      00A67A 10 53            [ 1] 4046 	jreq 1$
      00A67C 04 85 CD         [ 2] 4047 	jp syntax_error 
      002D53                       4048 1$: _xpop 
      00A67F AA BF            [ 1]    1     ld a,(y)
      00A681 72               [ 1]    2     ldw x,y 
      00A682 11 53            [ 2]    3     ldw x,(1,x)
      00A684 08 72 11 53      [ 2]    4     addw y,#CELL_SIZE 
      00A688 00               [ 1] 4049 	ld a,xl 
      00A689 90 85 81         [ 2] 4050 	ldw x,#1 
      00A68C A4 17            [ 1] 4051 	and a,#23
      00A68C CD 99            [ 1] 4052 	jreq 9$
      00A68E E5               [ 1] 4053 	push a 
      00A68F A1               [ 1] 4054 	clr a 
      002D66                       4055 2$: 
      00A690 02               [ 2] 4056 	slaw x 
      00A691 27               [ 1] 4057 	rlc a 	
      00A692 12 A1            [ 1] 4058 	dec (1,sp)
      00A694 01 27            [ 1] 4059 	jrne 2$ 
      002D6C                       4060 4$:
      002D6C                       4061     _drop 1 
      00A696 03 CC            [ 2]    1     addw sp,#1 
      00A698 96               [ 4] 4062 9$:	ret 
                                   4063 
                                   4064 ;------------------------------
                                   4065 ; BASIC: DO 
                                   4066 ; initiate a DO ... UNTIL loop 
                                   4067 ;------------------------------
                           000003  4068 	DOLP_ADR=3 
                           000005  4069 	DOLP_INW=5
                           000004  4070 	VSIZE=4 
      002D6F                       4071 do_loop:
      00A699 B9               [ 2] 4072 	popw x 
      002D70                       4073 	_vars VSIZE 
      00A69A 4F 5F            [ 2]    1     sub sp,#VSIZE 
      00A69C 72               [ 2] 4074 	pushw x 
      00A69D A2 00 03         [ 2] 4075 	ldw x,basicptr 
      00A6A0 90 F7            [ 2] 4076 	ldw (DOLP_ADR,sp),x
      00A6A2 90 EF 01         [ 2] 4077 	ldw x,in.w 
      00A6A5 90 E6            [ 2] 4078 	ldw (DOLP_INW,sp),x
      00A6A7 03 93 EE 04      [ 1] 4079 	inc loop_depth 
      00A6AB 5D               [ 4] 4080 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   4081 
                                   4082 ;--------------------------------
                                   4083 ; BASIC: UNTIL expr 
                                   4084 ; loop if exprssion is false 
                                   4085 ; else terminate loop
                                   4086 ;--------------------------------
      002D82                       4087 until: 
      00A6AC 27 25 90 F6      [ 1] 4088 	tnz loop_depth 
      00A6B0 93 EE            [ 1] 4089 	jrne 1$ 
      00A6B2 01 72 A9         [ 2] 4090 	jp syntax_error 
      002D8B                       4091 1$: 
      00A6B5 00 03 72         [ 4] 4092 	call condition  
      002D8E                       4093 	_xpop 
      00A6B8 A9 00            [ 1]    1     ld a,(y)
      00A6BA 03               [ 1]    2     ldw x,y 
      00A6BB 9F A4            [ 2]    3     ldw x,(1,x)
      00A6BD 07 4E C7 54      [ 2]    4     addw y,#CELL_SIZE 
      00A6C1 01               [ 1] 4094 	tnz a 
      00A6C2 72 16            [ 1] 4095 	jrne 9$ 
      00A6C4 50               [ 2] 4096 	tnzw x 
      00A6C5 CA 72            [ 1] 4097 	jrne 9$ 
      00A6C7 10 54            [ 2] 4098 	ldw x,(DOLP_ADR,sp)
      00A6C9 01 AE 00         [ 2] 4099 	ldw basicptr,x 
      00A6CC 1B 5A            [ 1] 4100 	ld a,(2,x)
      00A6CE 9D 26 FA         [ 1] 4101 	ld count,a 
      00A6D1 20 08            [ 2] 4102 	ldw x,(DOLP_INW,sp)
      00A6D3 72 11 54         [ 2] 4103 	ldw in.w,x 
      00A6D6 01               [ 4] 4104 	ret 
      002DAD                       4105 9$:	; remove loop data from stack  
      00A6D7 72               [ 2] 4106 	popw x
      002DAE                       4107 	_drop VSIZE
      00A6D8 17 50            [ 2]    1     addw sp,#VSIZE 
      00A6DA CA 5A 00 1F      [ 1] 4108 	dec loop_depth 
      00A6DB FC               [ 2] 4109 	jp (x)
                                   4110 
                                   4111 ;--------------------------
                                   4112 ; BASIC: PORTA...PORTI  
                                   4113 ;  return constant value 
                                   4114 ;  PORT  base address 
                                   4115 ;---------------------------
      002DB5                       4116 const_porta:
      00A6DB 81 50 00         [ 2] 4117 	ldw x,#PA_BASE 
      00A6DC 4F               [ 1] 4118 	clr a 
      00A6DC CD               [ 4] 4119 	ret 
      002DBA                       4120 const_portb:
      00A6DD 99 E0 A1         [ 2] 4121 	ldw x,#PB_BASE 
      00A6E0 01               [ 1] 4122 	clr a 
      00A6E1 27               [ 4] 4123 	ret 
      002DBF                       4124 const_portc:
      00A6E2 03 CC 96         [ 2] 4125 	ldw x,#PC_BASE 
      00A6E5 B9               [ 1] 4126 	clr a 
      00A6E6 90               [ 4] 4127 	ret 
      002DC4                       4128 const_portd:
      00A6E7 F6 93 EE         [ 2] 4129 	ldw x,#PD_BASE 
      00A6EA 01               [ 1] 4130 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A6EB 72               [ 4] 4131 	ret 
      002DC9                       4132 const_porte:
      00A6EC A9 00 03         [ 2] 4133 	ldw x,#PE_BASE 
      00A6EF A3               [ 1] 4134 	clr a 
      00A6F0 00               [ 4] 4135 	ret 
      002DCE                       4136 const_portf:
      00A6F1 05 23 05         [ 2] 4137 	ldw x,#PF_BASE 
      00A6F4 A6               [ 1] 4138 	clr a 
      00A6F5 0A               [ 4] 4139 	ret 
      002DD3                       4140 const_portg:
      00A6F6 CC 96 BB         [ 2] 4141 	ldw x,#PG_BASE 
      00A6F9 9F               [ 1] 4142 	clr a 
      00A6FA C7               [ 4] 4143 	ret 
      002DD8                       4144 const_porti:
      00A6FB 00 0F A6         [ 2] 4145 	ldw x,#PI_BASE 
      00A6FE 05               [ 1] 4146 	clr a 
      00A6FF C0               [ 4] 4147 	ret 
                                   4148 
                                   4149 ;-------------------------------
                                   4150 ; following return constant 
                                   4151 ; related to GPIO register offset 
                                   4152 ;---------------------------------
      002DDD                       4153 const_odr:
      00A700 00               [ 1] 4154 	clr a 
      00A701 0F C7 54         [ 2] 4155 	ldw x,#GPIO_ODR
      00A704 00               [ 4] 4156 	ret 
      002DE2                       4157 const_idr:
      00A705 72               [ 1] 4158 	clr a 
      00A706 16 54 02         [ 2] 4159 	ldw x,#GPIO_IDR
      00A709 72               [ 4] 4160 	ret 
      002DE7                       4161 const_ddr:
      00A70A 10               [ 1] 4162 	clr a
      00A70B 54 01 72         [ 2] 4163 	ldw x,#GPIO_DDR
      00A70E 0F               [ 4] 4164 	ret 
      002DEC                       4165 const_cr1:
      00A70F 54               [ 1] 4166 	clr a 
      00A710 00 FB CE         [ 2] 4167 	ldw x,#GPIO_CR1
      00A713 54               [ 4] 4168 	ret 
      002DF1                       4169 const_cr2:
      00A714 04               [ 1] 4170 	clr a
      00A715 A6 84 81         [ 2] 4171 	ldw x,#GPIO_CR2
      00A718 81               [ 4] 4172 	ret 
                                   4173 ;-------------------------
                                   4174 ; BASIC: POUT 
                                   4175 ;  constant for port mode
                                   4176 ;  used by PMODE 
                                   4177 ;  to set pin as output
                                   4178 ;------------------------
      002DF6                       4179 const_output:
      00A718 52               [ 1] 4180 	clr a 
      00A719 01 CD 99         [ 2] 4181 	ldw x,#OUTP
      00A71C E0               [ 4] 4182 	ret 
                                   4183 
                                   4184 ;-------------------------
                                   4185 ; BASIC: PINP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4186 ;  constant for port mode
                                   4187 ;  used by PMODE 
                                   4188 ;  to set pin as input
                                   4189 ;------------------------
      002DFB                       4190 const_input:
      00A71D A1               [ 1] 4191 	clr a  
      00A71E 01 27 03         [ 2] 4192 	ldw x,#INP 
      00A721 CC               [ 4] 4193 	ret 
                                   4194 	
                                   4195 ;-----------------------
                                   4196 ; memory area constants
                                   4197 ;-----------------------
      002E00                       4198 const_eeprom_base:
      00A722 96               [ 1] 4199 	clr a  
      00A723 B9 90 F6         [ 2] 4200 	ldw x,#EEPROM_BASE 
      00A726 93               [ 4] 4201 	ret 
                                   4202 
                                   4203 ;---------------------------
                                   4204 ; BASIC: DATA 
                                   4205 ; when the interpreter find 
                                   4206 ; a DATA line it skip it.
                                   4207 ;---------------------------
      002E05                       4208 data:
      00A727 EE 01 72 A9 00   [ 1] 4209 	mov in,count 
      00A72C 03               [ 4] 4210 	ret 
                                   4211 
                                   4212 ;------------------------------
                                   4213 ; check if it is a DATA line 
                                   4214 ; input: 
                                   4215 ;    X    line address 
                                   4216 ; output:
                                   4217 ;    Z    set if DATA line 
                                   4218 ;----------------------------
      002E0B                       4219 is_data_line:
      00A72D A3               [ 2] 4220 	pushw x 
      00A72E 00 0F            [ 1] 4221 	ld a,(3,x)
      00A730 23 05            [ 1] 4222 	cp a,#TK_CMD 
      00A732 A6 0A            [ 1] 4223 	jrne 9$
      00A734 CC 96            [ 2] 4224 	ldw x,(4,x)
      00A736 BB CD AC         [ 2] 4225 	cpw x,#data  
      00A739 02               [ 2] 4226 9$: popw x 
      00A73A 6B               [ 4] 4227 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      002E19                       4241 restore:
      00A73B 01               [ 1] 4242 	clrw x 
      00A73C E6 01 0D         [ 2] 4243 	ldw data_ptr,x 
      00A73F 01 27 05         [ 2] 4244 	ldw data_ofs,x 
      00A742 44 0A 01         [ 2] 4245 	ldw x,txtbgn 
      00A745 26 FB A4         [ 4] 4246 	call next_token 
      00A748 01 5F            [ 1] 4247 	cp a,#TK_INTGR
      00A74A 97 4F            [ 1] 4248 	jrne 0$
      00A74C 5B 01 81         [ 4] 4249 	call get_int24
      00A74F 90 89            [ 2] 4250 	pushw y 
      00A74F 52               [ 1] 4251 	clr a 
      00A750 02 CD 99         [ 4] 4252 	call search_lineno  
      00A753 E5 A1            [ 2] 4253 	popw y 
      00A755 02               [ 2] 4254 	tnzw x 
      00A756 27 03            [ 1] 4255 	jrne set_data_pointer 
      00A758 CC 96            [ 2] 4256 	jra data_error 
      002E3A                       4257 0$:
      002E3A                       4258 	_unget_token  
      00A75A B9 90 F6 93 EE   [ 1]    1      mov in,in.saved  
                                   4259 ; search first DATA line 	
      00A75F 01 72 A9         [ 2] 4260 1$:	cpw x,txtend
      00A762 00 03            [ 1] 4261 	jruge data_error 
      002E44                       4262 2$:	
      00A764 9F 6B 02         [ 4] 4263 	call is_data_line 
      00A767 90 F6            [ 1] 4264 	jrne 4$
      00A769 93 EE 01         [ 4] 4265 4$:	call try_next_line 
      00A76C 72 A9            [ 1] 4266 	jrne 4$ 
      00A76E 00               [ 4] 4267 	ret 
                                   4268 
                                   4269 ;---------------------
                                   4270 ; set data pointer 
                                   4271 ; variables at new line 
                                   4272 ; input:
                                   4273 ;    X    line address 
                                   4274 ;----------------------
      002E4F                       4275 set_data_pointer:
      00A76F 03 A3 00         [ 2] 4276 	ldw data_ptr,x
      00A772 0F 23            [ 1] 4277 	ld a,(2,x)
      00A774 05 A6 0A         [ 1] 4278 	ld data_len,a 
      00A777 CC 96 BB CD      [ 1] 4279 	mov data_ofs,#FIRST_DATA_ITEM
      00A77B AC               [ 4] 4280 	ret 
                                   4281 
                                   4282 
                                   4283 ;--------------------
                                   4284 ; at end of data line 
                                   4285 ; check if next line 
                                   4286 ; is a data line 
                                   4287 ; input:
                                   4288 ;    X   actual line address 
                                   4289 ;  
                                   4290 ;-------------------
      002E5C                       4291 try_next_line: 
      00A77C 02 6B            [ 1] 4292 	ld a,(2,x)
      00A77E 01 A6 01         [ 1] 4293 	ld acc8,a 
      00A781 0D 01 27 05      [ 1] 4294 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A785 48 0A 01 26      [ 2] 4295 	addw x,acc16 
      00A789 FB 0D 02         [ 2] 4296 	cpw x,txtend 
      00A78C 26 05            [ 1] 4297 	jrult 1$
      00A78E 43 E4            [ 2] 4298 	jra data_error 
      002E70                       4299 1$:	
      00A790 00 20 02         [ 4] 4300 	call is_data_line 
      00A793 EA 00            [ 1] 4301 	jreq 2$
      00A795 E7 00            [ 1] 4302 	ld a,#1  
      00A797 5B 02            [ 2] 4303 	jra 9$
      00A799 81 2E 4F         [ 4] 4304 2$:	call set_data_pointer
      00A79A 4F               [ 1] 4305 	clr a  
      00A79A 72               [ 4] 4306 9$:	ret 
      002E7E                       4307 data_error:	
      00A79B 00 00            [ 1] 4308     ld a,#ERR_NO_DATA 
      00A79D 23 02 4F         [ 2] 4309 	jp tb_error 
                                   4310 
                                   4311 
                                   4312 ;---------------------------------
                                   4313 ; BASIC: READ 
                                   4314 ; return next data item | 0 
                                   4315 ;---------------------------------
                           000001  4316 	CTX_BPTR=1 
                           000003  4317 	CTX_IN=3 
                           000004  4318 	CTX_COUNT=4 
                           000005  4319 	INT24=5
                           000007  4320 	VSIZE=7 
      002E83                       4321 read:
      002E83                       4322 	_vars  VSIZE 
      00A7A0 81 07            [ 2]    1     sub sp,#VSIZE 
      00A7A1 CD 20 82         [ 4] 4323 	call save_context
      002E88                       4324 read01:	
      00A7A1 AE A7 C8         [ 1] 4325 	ld a,data_ofs
      00A7A4 CD 89 BB         [ 1] 4326 	cp a,data_len 
      00A7A7 5B 02            [ 1] 4327 	jreq 2$ ; end of line  
      002E90                       4328 0$:
      00A7A9 52 04 CD         [ 2] 4329 	ldw x,data_ptr 
      00A7AC A1 02 AE         [ 2] 4330 	ldw basicptr,x 
      00A7AF 16 90 CF 00 05   [ 1] 4331 	mov in,data_ofs 
      00A7B4 7F 72 5F 00 04   [ 1] 4332 	mov count,data_len  
      00A7B9 5F CF 00         [ 4] 4333 	call expression 
      00A7BC 01 72            [ 1] 4334 	cp a,#TK_INTGR 
      00A7BE 11 00            [ 1] 4335 	jreq 1$ 
      00A7C0 23 72 18         [ 2] 4336 	jp syntax_error 
      002EAA                       4337 1$:
      00A7C3 00 23 CC         [ 4] 4338 	call next_token ; skip comma
      00A7C6 97 64 0A         [ 2] 4339 	ldw x,basicptr 
      00A7C9 62 72 65         [ 2] 4340 	ldw data_ptr,x 
      00A7CC 61 6B 20 70 6F   [ 1] 4341 	mov data_ofs,in 
      00A7D1 69 6E 74         [ 4] 4342 	call rest_context
      002EBB                       4343 	_xpop 
      00A7D4 2C 20            [ 1]    1     ld a,(y)
      00A7D6 52               [ 1]    2     ldw x,y 
      00A7D7 55 4E            [ 2]    3     ldw x,(1,x)
      00A7D9 20 74 6F 20      [ 2]    4     addw y,#CELL_SIZE 
      002EC4                       4344 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A7DD 72 65            [ 2]    1     addw sp,#VSIZE 
      00A7DF 73               [ 4] 4345 	ret 
      002EC7                       4346 2$: ; end of line reached 
                                   4347 	; try next line 
      00A7E0 75 6D 65         [ 2] 4348 	ldw x,data_ptr  
      00A7E3 2E 0A 00         [ 4] 4349 	call try_next_line
      00A7E6 27 C1            [ 1] 4350 	jreq 0$ 
      00A7E6 72 01            [ 2] 4351 	jra data_error 
                                   4352 
                                   4353 ;---------------------------------
                                   4354 ; BASIC: SPIEN clkdiv, 0|1  
                                   4355 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4356 ; if clkdiv==-1 disable SPI
                                   4357 ; 0|1 -> disable|enable  
                                   4358 ;--------------------------------- 
                           000005  4359 SPI_CS_BIT=5
      002ED1                       4360 spi_enable:
      00A7E8 00 23 01         [ 4] 4361 	call arg_list 
      00A7EB 81 02            [ 1] 4362 	cp a,#2
      00A7EC 27 03            [ 1] 4363 	jreq 1$
      00A7EC CD 94 F1         [ 2] 4364 	jp syntax_error 
      002EDB                       4365 1$: 
      00A7EF 81 12 50 C7      [ 1] 4366 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7F0 85               [ 2] 4367 	popw x  
      00A7F0 72               [ 2] 4368 	tnzw x 
      00A7F1 5F 00            [ 1] 4369 	jreq spi_disable 
      00A7F3 19               [ 2] 4370 	popw x 
      00A7F4 52 03            [ 1] 4371 	ld a,#(1<<SPI_CR1_BR)
      00A7F6 CD               [ 4] 4372 	mul x,a 
      00A7F7 98               [ 1] 4373 	ld a,xl 
      00A7F8 1D A1 04         [ 1] 4374 	ld SPI_CR1,a 
                                   4375 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7FB 27 03 CC 96      [ 1] 4376 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7FF B9 CD 98 5F      [ 1] 4377 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4378 ; configure SPI as master mode 0.	
      00A803 A4 DF A1 45      [ 1] 4379 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4380 ; ~CS line controlled by sofware 	
      00A807 26 0C AE 40      [ 1] 4381 	bset SPI_CR2,#SPI_CR2_SSM 
      00A80B 00 CF 00 1A      [ 1] 4382     bset SPI_CR2,#SPI_CR2_SSI 
                                   4383 ; enable SPI
      00A80F AE 47 FF 4F      [ 1] 4384 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A813 20               [ 4] 4385 	ret 
      002F04                       4386 spi_disable:
      002F04                       4387 	_drop #2; throw first argument.
      00A814 15 A1            [ 2]    1     addw sp,##2 
                                   4388 ; wait spi idle 
      00A816 46 27            [ 1] 4389 1$:	ld a,#0x82 
      00A818 06 AE 95         [ 1] 4390 	and a,SPI_SR
      00A81B DD CC            [ 1] 4391 	cp a,#2 
      00A81D 96 BB            [ 1] 4392 	jrne 1$
      00A81F 72 1D 52 00      [ 1] 4393 	bres SPI_CR1,#SPI_CR1_SPE
      00A81F AE B6 80 CF      [ 1] 4394 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A823 00 1A A6 02      [ 1] 4395 	bres PE_DDR,#SPI_CS_BIT 
      00A827 AE               [ 4] 4396 	ret 
                                   4397 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      002F1C                       4398 spi_clear_error:
      00A828 7F FF            [ 1] 4399 	ld a,#0x78 
      00A82A C5 52 03         [ 1] 4400 	bcp a,SPI_SR 
      00A82A 6B 01            [ 1] 4401 	jreq 1$
      00A82C 1F 02 CD 87      [ 1] 4402 	clr SPI_SR 
      00A830 5C               [ 4] 4403 1$: ret 
                                   4404 
      00A831                       4405 spi_send_byte:
      00A831 CD               [ 1] 4406 	push a 
      00A832 88 DE 27         [ 4] 4407 	call spi_clear_error
      00A835 08               [ 1] 4408 	pop a 
      00A836 A6 45 CD 89 5E   [ 2] 4409 	btjf SPI_SR,#SPI_SR_TXE,.
      00A83B CD 87 DA         [ 1] 4410 	ld SPI_DR,a
      00A83E AE 00 80 CD 88   [ 2] 4411 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A843 D0 7B 01         [ 1] 4412 	ld a,SPI_DR 
      00A846 1E               [ 4] 4413 	ret 
                                   4414 
      002F3E                       4415 spi_rcv_byte:
      00A847 02 72            [ 1] 4416 	ld a,#255
      00A849 B0 00 1A C2 00   [ 2] 4417 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A84E 19 22 E0         [ 1] 4418 	ld a,SPI_DR 
      00A851 CD               [ 4] 4419 	ret
                                   4420 
                                   4421 ;------------------------------
                                   4422 ; BASIC: SPIWR byte [,byte]
                                   4423 ; write 1 or more byte
                                   4424 ;------------------------------
      002F49                       4425 spi_write:
      00A852 94 F1 1E         [ 4] 4426 	call expression
      00A855 02 A3            [ 1] 4427 	cp a,#TK_INTGR 
      00A857 47 FF            [ 1] 4428 	jreq 1$
      00A859 26 03 CD         [ 2] 4429 	jp syntax_error 
      002F53                       4430 1$:	
      00A85C 9D               [ 1] 4431 	ld a,xl 
      00A85D C1 2F 28         [ 4] 4432 	call spi_send_byte 
      00A85E CD 17 9D         [ 4] 4433 	call next_token 
      00A85E 5B 03            [ 1] 4434 	cp a,#TK_COMMA 
      00A860 81 02            [ 1] 4435 	jrne 2$ 
      00A861 20 E9            [ 2] 4436 	jra spi_write 
      00A861 CE               [ 1] 4437 2$:	tnz a 
      00A862 B6 80            [ 1] 4438 	jreq 3$
      002F63                       4439 	_unget_token  
      00A864 C3 A9 21 81 01   [ 1]    1      mov in,in.saved  
      00A868 81               [ 4] 4440 3$:	ret 
                                   4441 
                                   4442 
                                   4443 ;-------------------------------
                                   4444 ; BASIC: SPIRD 	
                                   4445 ; read one byte from SPI 
                                   4446 ;-------------------------------
      002F69                       4447 spi_read:
      00A868 88 4D 27         [ 4] 4448 	call spi_rcv_byte 
      00A86B 0A               [ 1] 4449 	clrw x 
      00A86C F6               [ 1] 4450 	ld xl,a 
      00A86D 5C               [ 1] 4451 	clr a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A86E 90               [ 4] 4452 	ret 
                                   4453 
                                   4454 ;------------------------------
                                   4455 ; BASIC: SPISEL 0|1 
                                   4456 ; set state of ~CS line
                                   4457 ; 0|1 deselect|select  
                                   4458 ;------------------------------
      002F70                       4459 spi_select:
      00A86F F7 90 5C         [ 4] 4460 	call next_token 
      00A872 0A 01            [ 1] 4461 	cp a,#TK_INTGR 
      00A874 26 F6            [ 1] 4462 	jreq 1$
      00A876 84 81 39         [ 2] 4463 	jp syntax_error 
      00A878 5D               [ 2] 4464 1$: tnzw x  
      00A878 88 90            [ 1] 4465 	jreq cs_high 
      00A87A AE 16 E0 90      [ 1] 4466 	bres PE_ODR,#SPI_CS_BIT
      00A87E 89               [ 4] 4467 	ret 
      002F82                       4468 cs_high: 
      00A87F A6 80 90 7F      [ 1] 4469 	bset PE_ODR,#SPI_CS_BIT
      00A883 90               [ 4] 4470 	ret 
                                   4471 
                                   4472 ;-------------------------------
                                   4473 ; BASIC: PAD 
                                   4474 ; Return pad buffer address.
                                   4475 ;------------------------------
      002F87                       4476 pad_ref:
      00A884 5C 4A 26         [ 2] 4477 	ldw x,#pad 
      00A887 F9               [ 1] 4478 	clr a
      00A888 90               [ 4] 4479 	ret 
                                   4480 
                                   4481 ;****************************
                                   4482 ; expression stack 
                                   4483 ; manipulation routines
                                   4484 ;****************************
                                   4485 
                                   4486 ;-----------------------------
                                   4487 ; BASIC: PUSH expr|rel|cond 
                                   4488 ; push the result on xtack
                                   4489 ;-----------------------------
      002F8C                       4490 xpush:
      00A889 85 84 81         [ 4] 4491 	call condition 
      00A88C 81               [ 4] 4492 	ret 
                                   4493 
                                   4494 ;------------------------------
                                   4495 ; BASIC: POP 
                                   4496 ; pop top of xstack 
                                   4497 ;------------------------------
      002F90                       4498 xpop:
      002F90                       4499 	_xpop 
      00A88C 89 90            [ 1]    1     ld a,(y)
      00A88E 89               [ 1]    2     ldw x,y 
      00A88F 52 06            [ 2]    3     ldw x,(1,x)
      00A891 CD A8 61 26      [ 2]    4     addw y,#CELL_SIZE 
      00A895 09               [ 4] 4500 	ret 
                                   4501 
                                   4502 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



                                   4503 ;------------------------------
                                   4504 ; BASIC: ALLOC expr 
                                   4505 ; allocate expr element on xtack 
                                   4506 ;-------------------------------
      002F9A                       4507 xalloc: 
      00A896 AE A9 23         [ 4] 4508 	call expression 
      00A899 CD 89            [ 1] 4509 	cp a,#TK_INTGR
      00A89B BB CC            [ 1] 4510 	jreq 1$ 
      00A89D A9 1B 39         [ 2] 4511 	jp syntax_error
      00A89F                       4512 1$: _xpop 
      00A89F CE 00            [ 1]    1     ld a,(y)
      00A8A1 1C               [ 1]    2     ldw x,y 
      00A8A2 C3 00            [ 2]    3     ldw x,(1,x)
      00A8A4 1E 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A8A8 A9               [ 1] 4513 	tnz a 
      00A8A9 65 CD            [ 1] 4514 	jreq 3$ 
      00A8AB 89 BB            [ 1] 4515 2$:	ld a,#ERR_BAD_VALUE
      00A8AD CC A9 1B         [ 2] 4516 	jp tb_error 
      00A8B0 A3 00 14         [ 2] 4517 3$: cpw x,#XSTACK_SIZE 
      00A8B0 CD 87            [ 1] 4518 	jrugt 2$
      00A8B2 9C 72            [ 1] 4519 	ld a,#CELL_SIZE 
      00A8B4 5F               [ 4] 4520 	mul x,a 
      00A8B5 00 19 AE         [ 2] 4521 	ldw acc16,x 
      00A8B8 B6 80 CF 00      [ 2] 4522 	subw y,acc16 
      00A8BC 1A CD 9E DB      [ 2] 4523 	cpw y,#xstack_full
      00A8C0 1F 05            [ 1] 4524 	jrugt 9$
      00A8C2 0F 03            [ 1] 4525 	ld a,#ERR_MEM_FULL
      00A8C4 CD A8 78         [ 2] 4526 	jp tb_error 
      002FCF                       4527 9$:	 
      00A8C7 CE               [ 4] 4528 	ret 
                                   4529 
                                   4530 
                                   4531 ;------------------------------
                                   4532 ;  BASIC DROP expr 
                                   4533 ;  expr in range {0..XSTACK_SIZE}
                                   4534 ;  discard n elements from xtack
                                   4535 ;------------------------------
      002FD0                       4536 xdrop:
      00A8C8 A9 21 90         [ 4] 4537 	call expression 
      00A8CB FF 72            [ 1] 4538 	cp a,#TK_INTGR
      00A8CD A9 00            [ 1] 4539 	jreq 1$ 
      00A8CF 02 1E 05         [ 2] 4540 	jp syntax_error 
      002FDA                       4541 1$:	_xpop 
      00A8D2 90 FF            [ 1]    1     ld a,(y)
      00A8D4 72               [ 1]    2     ldw x,y 
      00A8D5 A9 00            [ 2]    3     ldw x,(1,x)
      00A8D7 02 A6 7C 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A8DB 04               [ 1] 4542 	ld a,xl 
      00A8DC A3 00            [ 1] 4543 	and a,#0x1f 
      00A8DE 7C               [ 1] 4544 	clrw x 
      00A8DF 22               [ 1] 4545 	ld xl,a 
      00A8E0 01 9F            [ 1] 4546 	ld a,#CELL_SIZE 
      00A8E2 6B               [ 4] 4547 	mul x,a 
      00A8E3 04 CE 00         [ 2] 4548 	ldw acc16,x  
      00A8E6 1C 1F 01 0D      [ 2] 4549 	addw y,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A8E9 90 A3 17 73      [ 2] 4550 	cpw y,#XSTACK_EMPTY 
      00A8E9 1E 01            [ 2] 4551 	jrule 9$
      00A8EB 7B 04 CD A8      [ 2] 4552 	ldw y,#XSTACK_EMPTY 
      00A8EF 68               [ 4] 4553 9$:	ret 
                                   4554 
                                   4555 ;-----------------------
                                   4556 ; check if value in A:X 
                                   4557 ; is inside xstack bound
                                   4558 ; output:
                                   4559 ;    X     slot address  
                                   4560 ;-----------------------
      002FFD                       4561 xstack_bound:
      00A8F0 1F               [ 1] 4562 	tnz a 
      00A8F1 01 AE            [ 1] 4563 	jrne 8$ 
      00A8F3 16 E0 CD         [ 2] 4564 1$: cpw x,#XSTACK_SIZE 
      00A8F6 87 B6            [ 1] 4565 	jrugt 8$
      00A8F8 AE 00            [ 1] 4566 	ld a,#CELL_SIZE 
      00A8FA 80               [ 4] 4567 	mul x,a
      00A8FB CD 88 D0         [ 2] 4568 	ldw acc16,x 
      00A8FE 1E               [ 1] 4569 	ldw x,y 
      00A8FF 01 C3 00 1E      [ 2] 4570 	addw x,acc16 
      00A903 24 16 1E         [ 2] 4571 	cpw x,#XSTACK_EMPTY 
      00A906 05 72            [ 1] 4572 	jruge 8$  
      00A908 F0               [ 4] 4573 	ret 
      00A909 03 1F            [ 1] 4574 8$: ld a,#ERR_BAD_VALUE
      00A90B 05 A6 80         [ 2] 4575 	jp tb_error 
                                   4576 
                                   4577 ;-------------------------
                                   4578 ; BASIC: PUT expr, cond 
                                   4579 ; expr -> slot 
                                   4580 ; cond -> valut to put 
                                   4581 ; on xstack 
                                   4582 ;-------------------------
      00301B                       4583 xput:
      00A90E A3 00 80         [ 4] 4584 	call arg_list 
      00A911 24 01            [ 1] 4585 	cp a,#2 
      00A913 9F 6B            [ 1] 4586 	jreq 1$ 
      00A915 04 CD A8         [ 2] 4587 0$:	jp syntax_error
      003025                       4588 1$: _xpop   ; value to put 
      00A918 78 20            [ 1]    1     ld a,(y)
      00A91A CE               [ 1]    2     ldw x,y 
      00A91B 5B 06            [ 2]    3     ldw x,(1,x)
      00A91D 90 85 85 81      [ 2]    4     addw y,#CELL_SIZE 
      00A921 54               [ 2] 4589 	pushw x 
      00A922 42               [ 1] 4590 	push a 
      003030                       4591 	_xpop    ; slot 
      00A923 43 61            [ 1]    1     ld a,(y)
      00A925 6E               [ 1]    2     ldw x,y 
      00A926 27 74            [ 2]    3     ldw x,(1,x)
      00A928 20 66 6C 61      [ 2]    4     addw y,#CELL_SIZE 
      00A92C 73 68 20         [ 4] 4592 	call xstack_bound
      00A92F 61 70 70         [ 2] 4593     ldw ptr16,x 
      00A932 6C               [ 1] 4594 	pop a 
      00A933 69               [ 2] 4595 	popw x 
      00A934 63 61 74 69      [ 4] 4596 	ld [ptr16],a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A938 6F 6E 2C 20      [ 1] 4597 	inc ptr8 
      00A93C 61 6C 72 65      [ 5] 4598 	ldw [ptr16],x 
      00A940 61               [ 4] 4599 	ret 
                                   4600 
                                   4601 ;------------------------
                                   4602 ; BASIC: PICK expr 
                                   4603 ; get nième element on 
                                   4604 ; xtack. 
                                   4605 ;-----------------------
      00304E                       4606 xpick:
      00A941 64 79 20         [ 4] 4607 	call func_args 
      00A944 6F 6E            [ 1] 4608 	cp a,#1 
      00A946 65 20            [ 1] 4609 	jreq 1$
      00A948 69 6E 20         [ 2] 4610 	jp syntax_error 
      003058                       4611 1$: _xpop 
      00A94B 46 4C            [ 1]    1     ld a,(y)
      00A94D 41               [ 1]    2     ldw x,y 
      00A94E 53 48            [ 2]    3     ldw x,(1,x)
      00A950 0A 75 73 65      [ 2]    4     addw y,#CELL_SIZE 
      00A954 20 45 52         [ 4] 4612 	call xstack_bound
      00A957 41               [ 1] 4613     ld a,(x)
      00A958 53 45            [ 2] 4614 	ldw x,(1,x)				
      00A95A 20               [ 4] 4615 	ret 
                                   4616 
                                   4617 
                                   4618 
                                   4619 ;------------------------------
                                   4620 ;      dictionary 
                                   4621 ; format:
                                   4622 ;   link:   2 bytes 
                                   4623 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4624 ;   cmd_name: 16 byte max 
                                   4625 ;   code_addr: 2 bytes 
                                   4626 ;------------------------------
                                   4627 	.macro _dict_entry len,name,code_addr 
                                   4628 	.word LINK 
                                   4629 	LINK=.
                                   4630 name:
                                   4631 	.byte len   	
                                   4632 	.ascii "name"
                                   4633 	.word code_addr  
                                   4634 	.endm 
                                   4635 
                           000000  4636 	LINK=0
                                   4637 ; respect alphabetic order for BASIC names from Z-A
                                   4638 ; this sort order is for a cleaner WORDS cmd output. 	
      003068                       4639 kword_end:
      003068                       4640 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00A95B 5C 46                    1 	.word LINK 
                           00306A     2 	LINK=.
      00306A                          3 XOR:
      00A95D 20                       4 	.byte 3+F_XOR   	
      00A95E 62 65 66                 5 	.ascii "XOR"
      00A961 6F 72                    6 	.word TK_XOR  
      003070                       4641 	_dict_entry,5,WRITE,write  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A963 65 00                    1 	.word LINK 
                           003072     2 	LINK=.
      003072                          3 WRITE:
      00A965 4E                       4 	.byte 5   	
      00A966 6F 20 61 70 70           5 	.ascii "WRITE"
      00A96B 6C 69                    6 	.word write  
      00307A                       4642 	_dict_entry,5,WORDS,words 
      00A96D 63 61                    1 	.word LINK 
                           00307C     2 	LINK=.
      00307C                          3 WORDS:
      00A96F 74                       4 	.byte 5   	
      00A970 69 6F 6E 20 69           5 	.ascii "WORDS"
      00A975 6E 20                    6 	.word words  
      003084                       4643 	_dict_entry 4,WAIT,wait 
      00A977 52 41                    1 	.word LINK 
                           003086     2 	LINK=.
      003086                          3 WAIT:
      00A979 4D                       4 	.byte 4   	
      00A97A 00 41 49 54              5 	.ascii "WAIT"
      00A97B 21 47                    6 	.word wait  
      00308D                       4644 	_dict_entry,3+F_IFUNC,USR,usr
      00A97B CD 9B                    1 	.word LINK 
                           00308F     2 	LINK=.
      00308F                          3 USR:
      00A97D 29                       4 	.byte 3+F_IFUNC   	
      00A97E A1 84 27                 5 	.ascii "USR"
      00A981 03 CC                    6 	.word usr  
      003095                       4645 	_dict_entry,5,UNTIL,until 
      00A983 96 B9                    1 	.word LINK 
                           003097     2 	LINK=.
      003097                          3 UNTIL:
      00A985 90                       4 	.byte 5   	
      00A986 F6 93 EE 01 72           5 	.ascii "UNTIL"
      00A98B A9 00                    6 	.word until  
      00309F                       4646 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A98D 03 C7                    1 	.word LINK 
                           0030A1     2 	LINK=.
      0030A1                          3 UFLASH:
      00A98F 00                       4 	.byte 6+F_IFUNC   	
      00A990 19 CF 00 1A 53 48        5 	.ascii "UFLASH"
      00A994 29 D5                    6 	.word uflash  
      0030AA                       4647 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00A994 CD 98                    1 	.word LINK 
                           0030AC     2 	LINK=.
      0030AC                          3 UBOUND:
      00A996 1D                       4 	.byte 6+F_IFUNC   	
      00A997 A1 08 27 02 20 20        5 	.ascii "UBOUND"
      00A99D CD 9B                    6 	.word ubound  
      0030B5                       4648 	_dict_entry,4,TONE,tone  
      00A99F 29 A1                    1 	.word LINK 
                           0030B7     2 	LINK=.
      0030B7                          3 TONE:
      00A9A1 84                       4 	.byte 4   	
      00A9A2 27 03 CC 96              5 	.ascii "TONE"
      00A9A6 B9 90                    6 	.word tone  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      0030BE                       4649 	_dict_entry,2,TO,to
      00A9A8 F6 93                    1 	.word LINK 
                           0030C0     2 	LINK=.
      0030C0                          3 TO:
      00A9AA EE                       4 	.byte 2   	
      00A9AB 01 72                    5 	.ascii "TO"
      00A9AD A9 00                    6 	.word to  
      0030C5                       4650 	_dict_entry,5,TIMER,set_timer
      00A9AF 03 9F                    1 	.word LINK 
                           0030C7     2 	LINK=.
      0030C7                          3 TIMER:
      00A9B1 5F                       4 	.byte 5   	
      00A9B2 CD 88 00 AE 00           5 	.ascii "TIMER"
      00A9B7 01 CD                    6 	.word set_timer  
      0030CF                       4651 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A9B9 88 D0                    1 	.word LINK 
                           0030D1     2 	LINK=.
      0030D1                          3 TIMEOUT:
      00A9BB 20                       4 	.byte 7+F_IFUNC   	
      00A9BC D7 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A9BD 2C CE                    6 	.word timeout  
      0030DB                       4652 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A9BD 81 D1                    1 	.word LINK 
                           0030DD     2 	LINK=.
      00A9BE                          3 TICKS:
      00A9BE CD                       4 	.byte 5+F_IFUNC   	
      00A9BF 99 E0 A1 01 27           5 	.ascii "TICKS"
      00A9C4 03 CC                    6 	.word get_ticks  
      0030E5                       4653 	_dict_entry,4,STOP,stop 
      00A9C6 96 B9                    1 	.word LINK 
                           0030E7     2 	LINK=.
      0030E7                          3 STOP:
      00A9C8 90                       4 	.byte 4   	
      00A9C9 F6 93 EE 01              5 	.ascii "STOP"
      00A9CD 72 A9                    6 	.word stop  
      0030EE                       4654 	_dict_entry,4,STEP,step 
      00A9CF 00 03                    1 	.word LINK 
                           0030F0     2 	LINK=.
      0030F0                          3 STEP:
      00A9D1 9F                       4 	.byte 4   	
      00A9D2 A4 7F 81 50              5 	.ascii "STEP"
      00A9D5 22 F7                    6 	.word step  
      0030F7                       4655 	_dict_entry,5,SPIWR,spi_write
      00A9D5 A6 06                    1 	.word LINK 
                           0030F9     2 	LINK=.
      0030F9                          3 SPIWR:
      00A9D7 CD                       4 	.byte 5   	
      00A9D8 99 D3 CD 98 1D           5 	.ascii "SPIWR"
      00A9DD A1 02                    6 	.word spi_write  
      003101                       4656 	_dict_entry,6,SPISEL,spi_select
      00A9DF 27 0E                    1 	.word LINK 
                           003103     2 	LINK=.
      003103                          3 SPISEL:
      00A9E1 A1                       4 	.byte 6   	
      00A9E2 04 27 12 A1 82 27        5 	.ascii "SPISEL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A9E8 03 CC                    6 	.word spi_select  
      00310C                       4657 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00A9EA 96 B9                    1 	.word LINK 
                           00310E     2 	LINK=.
      00A9EC                          3 SPIRD:
      00A9EC FD                       4 	.byte 5+F_IFUNC   	
      00A9ED 20 0B 49 52 44           5 	.ascii "SPIRD"
      00A9EF 2F 69                    6 	.word spi_read  
      003116                       4658 	_dict_entry,5,SPIEN,spi_enable 
      00A9EF F6 88                    1 	.word LINK 
                           003118     2 	LINK=.
      003118                          3 SPIEN:
      00A9F1 CD                       4 	.byte 5   	
      00A9F2 98 36 84 20 03           5 	.ascii "SPIEN"
      00A9F7 2E D1                    6 	.word spi_enable  
      003120                       4659 	_dict_entry,5,SLEEP,sleep 
      00A9F7 CD 98                    1 	.word LINK 
                           003122     2 	LINK=.
      003122                          3 SLEEP:
      00A9F9 5F                       4 	.byte 5   	
      00A9FA 5F 02 72 A2 00           5 	.ascii "SLEEP"
      00A9FF 03 90                    6 	.word sleep  
      00312A                       4660     _dict_entry,4,SIZE,cmd_size 
      00AA01 F7 90                    1 	.word LINK 
                           00312C     2 	LINK=.
      00312C                          3 SIZE:
      00AA03 EF                       4 	.byte 4   	
      00AA04 01 A6 07 CD              5 	.ascii "SIZE"
      00AA08 99 D3                    6 	.word cmd_size  
      00AA0A                       4661 	_dict_entry,4,SAVE,save_app 
      00AA0A 90 F6                    1 	.word LINK 
                           003135     2 	LINK=.
      003135                          3 SAVE:
      00AA0C 93                       4 	.byte 4   	
      00AA0D EE 01 72 A9              5 	.ascii "SAVE"
      00AA11 00 03                    6 	.word save_app  
      00313C                       4662 	_dict_entry 3,RUN,run
      00AA13 81 35                    1 	.word LINK 
                           00313E     2 	LINK=.
      00AA14                          3 RUN:
      00AA14 CD                       4 	.byte 3   	
      00AA15 89 6E 81                 5 	.ascii "RUN"
      00AA18 25 0D                    6 	.word run  
      003144                       4663 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AA18 5F C6                    1 	.word LINK 
                           003146     2 	LINK=.
      003146                          3 RSHIFT:
      00AA1A 00                       4 	.byte 6+F_IFUNC   	
      00AA1B 2F C0 00 30 27 03        5 	.ascii "RSHIFT"
      00AA21 53 A6                    6 	.word rshift  
      00314F                       4664 	_dict_entry,3+F_IFUNC,RND,random 
      00AA23 FF 46                    1 	.word LINK 
                           003151     2 	LINK=.
      00AA24                          3 RND:
      00AA24 81                       4 	.byte 3+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AA25 52 4E 44                 5 	.ascii "RND"
      00AA25 CD 99                    6 	.word random  
      003157                       4665 	_dict_entry,6,RETURN,return 
      00AA27 E0 A1                    1 	.word LINK 
                           003159     2 	LINK=.
      003159                          3 RETURN:
      00AA29 02                       4 	.byte 6   	
      00AA2A 27 03 CC 96 B9 90        5 	.ascii "RETURN"
      00AA30 E6 03                    6 	.word return  
      003162                       4666 	_dict_entry,7,RESTORE,restore 
      00AA32 93 EE                    1 	.word LINK 
                           003164     2 	LINK=.
      003164                          3 RESTORE:
      00AA34 04                       4 	.byte 7   	
      00AA35 A3 50 00 2B 16 A3 50     5 	.ascii "RESTORE"
      00AA3C 29 2A                    6 	.word restore  
      00316E                       4667 	_dict_entry 3,REM,remark 
      00AA3E 11 89                    1 	.word LINK 
                           003170     2 	LINK=.
      003170                          3 REM:
      00AA40 90                       4 	.byte 3   	
      00AA41 F6 93 EE                 5 	.ascii "REM"
      00AA44 01 72                    6 	.word remark  
      003176                       4668 	_dict_entry,6,REBOOT,cold_start
      00AA46 A9 00                    1 	.word LINK 
                           003178     2 	LINK=.
      003178                          3 REBOOT:
      00AA48 03                       4 	.byte 6   	
      00AA49 72 FB 01 5B 02 4F        5 	.ascii "REBOOT"
      00AA4F 81 B8                    6 	.word cold_start  
      00AA50                       4669 	_dict_entry,4+F_IFUNC,READ,read  
      00AA50 A6 0A                    1 	.word LINK 
                           003183     2 	LINK=.
      003183                          3 READ:
      00AA52 CC                       4 	.byte 4+F_IFUNC   	
      00AA53 96 BB 41 44              5 	.ascii "READ"
      00AA55 2E 83                    6 	.word read  
      00318A                       4670 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AA55 CD A8                    1 	.word LINK 
                           00318C     2 	LINK=.
      00318C                          3 QKEY:
      00AA57 61                       4 	.byte 4+F_IFUNC   	
      00AA58 26 13 AE B6              5 	.ascii "QKEY"
      00AA5C 80 72                    6 	.word qkey  
      003193                       4671 	_dict_entry,3,PUT,xput 
      00AA5E BB B6                    1 	.word LINK 
                           003195     2 	LINK=.
      003195                          3 PUT:
      00AA60 82                       4 	.byte 3   	
      00AA61 1C 00 04                 5 	.ascii "PUT"
      00AA64 1C 00                    6 	.word xput  
      00319B                       4672 	_dict_entry,4,PUSH,xpush   
      00AA66 80 9F                    1 	.word LINK 
                           00319D     2 	LINK=.
      00319D                          3 PUSH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AA68 A4                       4 	.byte 4   	
      00AA69 80 97 20 03              5 	.ascii "PUSH"
      00AA6D AE B6                    6 	.word xpush  
      0031A4                       4673 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AA6F 80 9D                    1 	.word LINK 
                           0031A6     2 	LINK=.
      00AA70                          3 PORTI:
      00AA70 4F                       4 	.byte 5+F_IFUNC   	
      00AA71 81 4F 52 54 49           5 	.ascii "PORTI"
      00AA72 2D D8                    6 	.word const_porti  
      0031AE                       4674 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AA72 CD 99                    1 	.word LINK 
                           0031B0     2 	LINK=.
      0031B0                          3 PORTG:
      00AA74 E0                       4 	.byte 5+F_IFUNC   	
      00AA75 A1 02 27 03 CC           5 	.ascii "PORTG"
      00AA7A 96 B9                    6 	.word const_portg  
      00AA7C                       4675 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AA7C 90 E6                    1 	.word LINK 
                           0031BA     2 	LINK=.
      0031BA                          3 PORTF:
      00AA7E 03                       4 	.byte 5+F_IFUNC   	
      00AA7F 93 EE 04 CF 00           5 	.ascii "PORTF"
      00AA84 1A 90                    6 	.word const_portf  
      0031C2                       4676 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AA86 F6 93                    1 	.word LINK 
                           0031C4     2 	LINK=.
      0031C4                          3 PORTE:
      00AA88 EE                       4 	.byte 5+F_IFUNC   	
      00AA89 01 72 A9 00 03           5 	.ascii "PORTE"
      00AA8E 90 F7                    6 	.word const_porte  
      0031CC                       4677 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AA90 90 EF                    1 	.word LINK 
                           0031CE     2 	LINK=.
      0031CE                          3 PORTD:
      00AA92 01                       4 	.byte 5+F_IFUNC   	
      00AA93 72 CD 00 1A 81           5 	.ascii "PORTD"
      00AA98 2D C4                    6 	.word const_portd  
      0031D6                       4678 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AA98 72 0D                    1 	.word LINK 
                           0031D8     2 	LINK=.
      0031D8                          3 PORTC:
      00AA9A 52                       4 	.byte 5+F_IFUNC   	
      00AA9B 30 FB 8E CC 81           5 	.ascii "PORTC"
      00AAA0 38 BF                    6 	.word const_portc  
      00AAA1                       4679 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AAA1 72 0D                    1 	.word LINK 
                           0031E2     2 	LINK=.
      0031E2                          3 PORTB:
      00AAA3 52                       4 	.byte 5+F_IFUNC   	
      00AAA4 30 FB 72 16 00           5 	.ascii "PORTB"
      00AAA9 23 8E                    6 	.word const_portb  
      0031EA                       4680 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AAAB 81 E2                    1 	.word LINK 
                           0031EC     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AAAC                          3 PORTA:
      00AAAC CD                       4 	.byte 5+F_IFUNC   	
      00AAAD 9B 29 A1 84 27           5 	.ascii "PORTA"
      00AAB2 03 CC                    6 	.word const_porta  
      0031F4                       4681 	_dict_entry 5,PRINT,print 
      00AAB4 96 B9                    1 	.word LINK 
                           0031F6     2 	LINK=.
      0031F6                          3 PRINT:
      00AAB6 90                       4 	.byte 5   	
      00AAB7 F6 93 EE 01 72           5 	.ascii "PRINT"
      00AABC A9 00                    6 	.word print  
      0031FE                       4682 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AABE 03 F6                    1 	.word LINK 
                           003200     2 	LINK=.
      00AABF                          3 POUT:
      00AABF CF                       4 	.byte 4+F_IFUNC   	
      00AAC0 00 13 CE 00              5 	.ascii "POUT"
      00AAC4 13 5D                    6 	.word const_output  
      003207                       4683 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AAC6 27 03                    1 	.word LINK 
                           003209     2 	LINK=.
      003209                          3 POP:
      00AAC8 8F                       4 	.byte 3+F_IFUNC   	
      00AAC9 26 F7 50                 5 	.ascii "POP"
      00AACB 2F 90                    6 	.word xpop  
      00320F                       4684 	_dict_entry,4,POKE,poke 
      00AACB 81 09                    1 	.word LINK 
                           003211     2 	LINK=.
      00AACC                          3 POKE:
      00AACC CD                       4 	.byte 4   	
      00AACD 9B 29 A1 84              5 	.ascii "POKE"
      00AAD1 27 03                    6 	.word poke  
      003218                       4685 	_dict_entry,5,PMODE,pin_mode 
      00AAD3 CC 96                    1 	.word LINK 
                           00321A     2 	LINK=.
      00321A                          3 PMODE:
      00AAD5 B9                       4 	.byte 5   	
      00AAD6 90 F6 93 EE 01           5 	.ascii "PMODE"
      00AADB 72 A9                    6 	.word pin_mode  
      003222                       4686 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AADD 00 03                    1 	.word LINK 
                           003224     2 	LINK=.
      00AADF                          3 PINP:
      00AADF A3                       4 	.byte 4+F_IFUNC   	
      00AAE0 14 00 2B 0C              5 	.ascii "PINP"
      00AAE4 35 0F                    6 	.word const_input  
      00322B                       4687 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AAE6 50 F2                    1 	.word LINK 
                           00322D     2 	LINK=.
      00322D                          3 PICK:
      00AAE8 A6                       4 	.byte 4+F_IFUNC   	
      00AAE9 1E 62 A6 10              5 	.ascii "PICK"
      00AAED 62 20                    6 	.word xpick  
      003234                       4688 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AAEF 1E 2D                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           003236     2 	LINK=.
      00AAF0                          3 PEEK:
      00AAF0 A3                       4 	.byte 4+F_IFUNC   	
      00AAF1 08 00 2B 09              5 	.ascii "PEEK"
      00AAF5 35 0E                    6 	.word peek  
      00323D                       4689 	_dict_entry,5,PAUSE,pause 
      00AAF7 50 F2                    1 	.word LINK 
                           00323F     2 	LINK=.
      00323F                          3 PAUSE:
      00AAF9 A6                       4 	.byte 5   	
      00AAFA 50 62 20 10 45           5 	.ascii "PAUSE"
      00AAFE 2A 2C                    6 	.word pause  
      003247                       4690 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AAFE 35 07                    1 	.word LINK 
                           003249     2 	LINK=.
      003249                          3 PAD:
      00AB00 50                       4 	.byte 3+F_IFUNC   	
      00AB01 F2 41 44                 5 	.ascii "PAD"
      00AB02 2F 87                    6 	.word pad_ref  
      00324F                       4691 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AB02 A3 00                    1 	.word LINK 
                           003251     2 	LINK=.
      003251                          3 OR:
      00AB04 40                       4 	.byte 2+F_OR   	
      00AB05 23 07                    5 	.ascii "OR"
      00AB07 72 5C                    6 	.word TK_OR  
      003256                       4692 	_dict_entry,2,ON,cmd_on 
      00AB09 50 F2                    1 	.word LINK 
                           003258     2 	LINK=.
      003258                          3 ON:
      00AB0B 54                       4 	.byte 2   	
      00AB0C 20 F4                    5 	.ascii "ON"
      00AB0E 24 20                    6 	.word cmd_on  
      00325D                       4693 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AB0E 9F 4A                    1 	.word LINK 
                           00325F     2 	LINK=.
      00325F                          3 ODR:
      00AB10 27                       4 	.byte 3+F_IFUNC   	
      00AB11 01 4A 52                 5 	.ascii "ODR"
      00AB13 2D DD                    6 	.word const_odr  
      003265                       4694 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AB13 A4 3E                    1 	.word LINK 
                           003267     2 	LINK=.
      003267                          3 NOT:
      00AB15 C7                       4 	.byte 3+F_NOT   	
      00AB16 50 F1 72                 5 	.ascii "NOT"
      00AB19 18 50                    6 	.word TK_NOT  
      00326D                       4695 	_dict_entry,4,NEXT,next 
      00AB1B F0 8E                    1 	.word LINK 
                           00326F     2 	LINK=.
      00326F                          3 NEXT:
      00AB1D 81                       4 	.byte 4   	
      00AB1E 4E 45 58 54              5 	.ascii "NEXT"
      00AB1E C6 00                    6 	.word next  
      003276                       4696 	_dict_entry,3,NEW,new
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AB20 10 CE                    1 	.word LINK 
                           003278     2 	LINK=.
      003278                          3 NEW:
      00AB22 00                       4 	.byte 3   	
      00AB23 11 81 57                 5 	.ascii "NEW"
      00AB25 27 66                    6 	.word new  
      00327E                       4697 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AB25 CD 99                    1 	.word LINK 
                           003280     2 	LINK=.
      003280                          3 LSHIFT:
      00AB27 E0                       4 	.byte 6+F_IFUNC   	
      00AB28 A1 01 27 03 CC 96        5 	.ascii "LSHIFT"
      00AB2E B9 BC                    6 	.word lshift  
      00AB2F                       4698 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AB2F CD 82                    1 	.word LINK 
                           00328B     2 	LINK=.
      00328B                          3 LOG2:
      00AB31 63                       4 	.byte 4+F_IFUNC   	
      00AB32 90 F6 93 EE              5 	.ascii "LOG2"
      00AB36 01 72                    6 	.word log2  
      003292                       4699 	_dict_entry 4,LIST,list
      00AB38 A9 00                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 LIST:
      00AB3A 03                       4 	.byte 4   	
      00AB3B 81 49 53 54              5 	.ascii "LIST"
      00AB3C 1E EC                    6 	.word list  
      00329B                       4700 	_dict_entry 3,LET,let 
      00AB3C CD 99                    1 	.word LINK 
                           00329D     2 	LINK=.
      00329D                          3 LET:
      00AB3E E0                       4 	.byte 3   	
      00AB3F A1 02 27                 5 	.ascii "LET"
      00AB42 03 CC                    6 	.word let  
      0032A3                       4701 	_dict_entry,3+F_CFUNC,KEY,key 
      00AB44 96 B9                    1 	.word LINK 
                           0032A5     2 	LINK=.
      0032A5                          3 KEY:
      00AB46 90                       4 	.byte 3+F_CFUNC   	
      00AB47 F6 93 EE                 5 	.ascii "KEY"
      00AB4A 01 72                    6 	.word key  
      0032AB                       4702 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AB4C A9 00                    1 	.word LINK 
                           0032AD     2 	LINK=.
      0032AD                          3 IWDGREF:
      00AB4E 03                       4 	.byte 7   	
      00AB4F 9F 88 90 F6 93 EE 01     5 	.ascii "IWDGREF"
      00AB56 72 A9                    6 	.word refresh_iwdg  
      0032B7                       4703 	_dict_entry,6,IWDGEN,enable_iwdg
      00AB58 00 03                    1 	.word LINK 
                           0032B9     2 	LINK=.
      0032B9                          3 IWDGEN:
      00AB5A 0D                       4 	.byte 6   	
      00AB5B 01 27 07 98 59 49        5 	.ascii "IWDGEN"
      00AB61 0A 01                    6 	.word enable_iwdg  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      0032C2                       4704 	_dict_entry,5,INPUT,input_var  
      00AB63 26 F9                    1 	.word LINK 
                           0032C4     2 	LINK=.
      0032C4                          3 INPUT:
      00AB65 5B                       4 	.byte 5   	
      00AB66 01 81 50 55 54           5 	.ascii "INPUT"
      00AB68 20 A2                    6 	.word input_var  
      0032CC                       4705 	_dict_entry,2,IF,if 
      00AB68 CD 99                    1 	.word LINK 
                           0032CE     2 	LINK=.
      0032CE                          3 IF:
      00AB6A E0                       4 	.byte 2   	
      00AB6B A1 02                    5 	.ascii "IF"
      00AB6D 27 03                    6 	.word if  
      0032D3                       4706 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AB6F CC 96                    1 	.word LINK 
                           0032D5     2 	LINK=.
      0032D5                          3 IDR:
      00AB71 B9                       4 	.byte 3+F_IFUNC   	
      00AB72 90 F6 93                 5 	.ascii "IDR"
      00AB75 EE 01                    6 	.word const_idr  
      0032DB                       4707 	_dict_entry,3,HEX,hex_base
      00AB77 72 A9                    1 	.word LINK 
                           0032DD     2 	LINK=.
      0032DD                          3 HEX:
      00AB79 00                       4 	.byte 3   	
      00AB7A 03 9F 88                 5 	.ascii "HEX"
      00AB7D 90 F6                    6 	.word hex_base  
      0032E3                       4708 	_dict_entry,4,GOTO,goto 
      00AB7F 93 EE                    1 	.word LINK 
                           0032E5     2 	LINK=.
      0032E5                          3 GOTO:
      00AB81 01                       4 	.byte 4   	
      00AB82 72 A9 00 03              5 	.ascii "GOTO"
      00AB86 0D 01                    6 	.word goto  
      0032EC                       4709 	_dict_entry,5,GOSUB,gosub 
      00AB88 27 07                    1 	.word LINK 
                           0032EE     2 	LINK=.
      0032EE                          3 GOSUB:
      00AB8A 98                       4 	.byte 5   	
      00AB8B 46 56 0A 01 26           5 	.ascii "GOSUB"
      00AB90 F9 5B                    6 	.word gosub  
      0032F6                       4710 	_dict_entry,3,GET,cmd_get 
      00AB92 01 81                    1 	.word LINK 
                           0032F8     2 	LINK=.
      00AB94                          3 GET:
      00AB94 A6                       4 	.byte 3   	
      00AB95 84 CD 99                 5 	.ascii "GET"
      00AB98 D3 CD                    6 	.word cmd_get  
      0032FE                       4711 	_dict_entry,4+F_IFUNC,FREE,free
      00AB9A 98 4F                    1 	.word LINK 
                           003300     2 	LINK=.
      003300                          3 FREE:
      00AB9C 9F                       4 	.byte 4+F_IFUNC   	
      00AB9D A4 07 C7 50              5 	.ascii "FREE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00ABA1 C6 81                    6 	.word free  
      00ABA3                       4712 	_dict_entry,3,FOR,for 
      00ABA3 52 01                    1 	.word LINK 
                           003309     2 	LINK=.
      003309                          3 FOR:
      00ABA5 CD                       4 	.byte 3   	
      00ABA6 99 E5 A1                 5 	.ascii "FOR"
      00ABA9 02 27                    6 	.word for  
      00330F                       4713 	_dict_entry,4,FCPU,fcpu 
      00ABAB 03 CC                    1 	.word LINK 
                           003311     2 	LINK=.
      003311                          3 FCPU:
      00ABAD 96                       4 	.byte 4   	
      00ABAE B9 90 F6 93              5 	.ascii "FCPU"
      00ABB2 EE 01                    6 	.word fcpu  
      003318                       4714 	_dict_entry,5,ERASE,erase 
      00ABB4 72 A9                    1 	.word LINK 
                           00331A     2 	LINK=.
      00331A                          3 ERASE:
      00ABB6 00                       4 	.byte 5   	
      00ABB7 03 CF 00 1A 90           5 	.ascii "ERASE"
      00ABBC F6 93                    6 	.word erase  
      003322                       4715 	_dict_entry,3,END,cmd_end  
      00ABBE EE 01                    1 	.word LINK 
                           003324     2 	LINK=.
      003324                          3 END:
      00ABC0 72                       4 	.byte 3   	
      00ABC1 A9 00 03                 5 	.ascii "END"
      00ABC4 CD AC                    6 	.word cmd_end  
      00332A                       4716 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00ABC6 02 6B                    1 	.word LINK 
                           00332C     2 	LINK=.
      00332C                          3 EEPROM:
      00ABC8 01                       4 	.byte 6+F_IFUNC   	
      00ABC9 A6 01 0D 01 27 0D        5 	.ascii "EEPROM"
      00ABCF 48 0A                    6 	.word const_eeprom_base  
      003335                       4717 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00ABD1 01 26                    1 	.word LINK 
                           003337     2 	LINK=.
      003337                          3 EEFREE:
      00ABD3 FB                       4 	.byte 6+F_IFUNC   	
      00ABD4 6B 01 7B 01 EA 03        5 	.ascii "EEFREE"
      00ABDA E7 03                    6 	.word func_eefree  
      003340                       4718 	_dict_entry,4,EDIT,edit 
      00ABDC A6 01                    1 	.word LINK 
                           003342     2 	LINK=.
      003342                          3 EDIT:
      00ABDE C1                       4 	.byte 4   	
      00ABDF 00 0F 27 10              5 	.ascii "EDIT"
      00ABE3 7B 01                    6 	.word edit  
      003349                       4719 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00ABE5 43 E4                    1 	.word LINK 
                           00334B     2 	LINK=.
      00334B                          3 DWRITE:
      00ABE7 04                       4 	.byte 6+F_CMD   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00ABE8 E7 04 7B 01 43 E4        5 	.ascii "DWRITE"
      00ABEE 02 E7                    6 	.word digital_write  
      003354                       4720 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00ABF0 02 20                    1 	.word LINK 
                           003356     2 	LINK=.
      003356                          3 DROP:
      00ABF2 0C                       4 	.byte 4   	
      00ABF3 44 52 4F 50              5 	.ascii "DROP"
      00ABF3 7B 01                    6 	.word xdrop  
      00335D                       4721 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00ABF5 EA 02                    1 	.word LINK 
                           00335F     2 	LINK=.
      00335F                          3 DREAD:
      00ABF7 E7                       4 	.byte 5+F_IFUNC   	
      00ABF8 02 7B 01 EA 04           5 	.ascii "DREAD"
      00ABFD E7 04                    6 	.word digital_read  
      00ABFF                       4722 	_dict_entry,2,DO,do_loop
      00ABFF 5B 01                    1 	.word LINK 
                           003369     2 	LINK=.
      003369                          3 DO:
      00AC01 81                       4 	.byte 2   	
      00AC02 44 4F                    5 	.ascii "DO"
      00AC02 58 1C                    6 	.word do_loop  
      00336E                       4723 	_dict_entry,3,DIM,cmd_dim 
      00AC04 AC 12                    1 	.word LINK 
                           003370     2 	LINK=.
      003370                          3 DIM:
      00AC06 FE                       4 	.byte 3   	
      00AC07 9F 88 5E                 5 	.ascii "DIM"
      00AC0A A6 05                    6 	.word cmd_dim  
      003376                       4724 	_dict_entry,3,DEC,dec_base
      00AC0C 42 1C                    1 	.word LINK 
                           003378     2 	LINK=.
      003378                          3 DEC:
      00AC0E 50                       4 	.byte 3   	
      00AC0F 00 84 81                 5 	.ascii "DEC"
      00AC12 1C 3B                    6 	.word dec_base  
      00337E                       4725 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AC12 03 06                    1 	.word LINK 
                           003380     2 	LINK=.
      003380                          3 DDR:
      00AC14 03                       4 	.byte 3+F_IFUNC   	
      00AC15 05 04 00                 5 	.ascii "DDR"
      00AC18 02 01                    6 	.word const_ddr  
      003386                       4726 	_dict_entry,4,DATA,data  
      00AC1A 06 00                    1 	.word LINK 
                           003388     2 	LINK=.
      003388                          3 DATA:
      00AC1C 02                       4 	.byte 4   	
      00AC1D 02 02 03 03              5 	.ascii "DATA"
      00AC21 01 03                    6 	.word data  
      00338F                       4727 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AC23 03 02                    1 	.word LINK 
                           003391     2 	LINK=.
      003391                          3 CR2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AC25 04                       4 	.byte 3+F_IFUNC   	
      00AC26 04 05 02                 5 	.ascii "CR2"
      00AC29 06 02                    6 	.word const_cr2  
      003397                       4728 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AC2B 07 02                    1 	.word LINK 
                           003399     2 	LINK=.
      003399                          3 CR1:
      00AC2D 05                       4 	.byte 3+F_IFUNC   	
      00AC2E 04 02 04                 5 	.ascii "CR1"
      00AC31 01 EC                    6 	.word const_cr1  
      00AC32                       4729 	_dict_entry,5,CONST,cmd_const 
      00AC32 CD 99                    1 	.word LINK 
                           0033A1     2 	LINK=.
      0033A1                          3 CONST:
      00AC34 E0                       4 	.byte 5   	
      00AC35 A1 01 27 03 CC           5 	.ascii "CONST"
      00AC3A 96 B9                    6 	.word cmd_const  
      00AC3C                       4730 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AC3C 90 F6                    1 	.word LINK 
                           0033AB     2 	LINK=.
      0033AB                          3 CHAR:
      00AC3E 93                       4 	.byte 4+F_CFUNC   	
      00AC3F EE 01 72 A9              5 	.ascii "CHAR"
      00AC43 00 03                    6 	.word func_char  
      0033B2                       4731 	_dict_entry,3,BYE,bye 
      00AC45 89 88                    1 	.word LINK 
                           0033B4     2 	LINK=.
      0033B4                          3 BYE:
      00AC47 A6                       4 	.byte 3   	
      00AC48 80 15 01                 5 	.ascii "BYE"
      00AC4B 27 05                    6 	.word bye  
      0033BA                       4732 	_dict_entry,5,BTOGL,bit_toggle
      00AC4D A6 0A                    1 	.word LINK 
                           0033BC     2 	LINK=.
      0033BC                          3 BTOGL:
      00AC4F CC                       4 	.byte 5   	
      00AC50 96 BB 4F 47 4C           5 	.ascii "BTOGL"
      00AC52 21 C9                    6 	.word bit_toggle  
      0033C4                       4733 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AC52 CE 00                    1 	.word LINK 
                           0033C6     2 	LINK=.
      0033C6                          3 BTEST:
      00AC54 15                       4 	.byte 5+F_IFUNC   	
      00AC55 58 58 58 58 58           5 	.ascii "BTEST"
      00AC5A 9E C8                    6 	.word bit_test  
      0033CE                       4734 	_dict_entry,4,BSET,bit_set 
      00AC5C 00 15                    1 	.word LINK 
                           0033D0     2 	LINK=.
      0033D0                          3 BSET:
      00AC5E C7                       4 	.byte 4   	
      00AC5F 00 0E 9F C8              5 	.ascii "BSET"
      00AC63 00 16                    6 	.word bit_set  
      0033D7                       4735 	_dict_entry,4,BRES,bit_reset
      00AC65 C7 00                    1 	.word LINK 
                           0033D9     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      0033D9                          3 BRES:
      00AC67 0F                       4 	.byte 4   	
      00AC68 CE 00 17 CF              5 	.ascii "BRES"
      00AC6C 00 15                    6 	.word bit_reset  
      0033E0                       4736 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AC6E CE 00                    1 	.word LINK 
                           0033E2     2 	LINK=.
      0033E2                          3 BIT:
      00AC70 17                       4 	.byte 3+F_IFUNC   	
      00AC71 54 9E C8                 5 	.ascii "BIT"
      00AC74 00 17                    6 	.word bitmask  
      0033E8                       4737 	_dict_entry,3,AWU,awu 
      00AC76 C7 00                    1 	.word LINK 
                           0033EA     2 	LINK=.
      0033EA                          3 AWU:
      00AC78 17                       4 	.byte 3   	
      00AC79 9F C8 00                 5 	.ascii "AWU"
      00AC7C 18 C7                    6 	.word awu  
      0033F0                       4738 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AC7E 00 18                    1 	.word LINK 
                           0033F2     2 	LINK=.
      0033F2                          3 ASC:
      00AC80 CE                       4 	.byte 3+F_IFUNC   	
      00AC81 00 0E 54                 5 	.ascii "ASC"
      00AC84 54 54                    6 	.word ascii  
      0033F8                       4739 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AC86 9E C8                    1 	.word LINK 
                           0033FA     2 	LINK=.
      0033FA                          3 AND:
      00AC88 00                       4 	.byte 3+F_AND   	
      00AC89 0E C7 00                 5 	.ascii "AND"
      00AC8C 0E 9F                    6 	.word TK_AND  
      003400                       4740 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AC8E C8 00                    1 	.word LINK 
                           003402     2 	LINK=.
      003402                          3 ALLOC:
      00AC90 0F                       4 	.byte 5   	
      00AC91 C7 00 0F C8 00           5 	.ascii "ALLOC"
      00AC96 18 97                    6 	.word xalloc  
      00340A                       4741 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AC98 C6 00                    1 	.word LINK 
                           00340C     2 	LINK=.
      00340C                          3 ADCREAD:
      00AC9A 0E                       4 	.byte 7+F_IFUNC   	
      00AC9B C8 00 17 95 CF 00 17     5 	.ascii "ADCREAD"
      00ACA2 C6 00                    6 	.word analog_read  
      003416                       4742 	_dict_entry,5,ADCON,power_adc 
      00ACA4 16 A4                    1 	.word LINK 
                           003418     2 	LINK=.
      003418                          3 ADCON:
      00ACA6 7F                       4 	.byte 5   	
      00ACA7 72 A2 00 03 90           5 	.ascii "ADCON"
      00ACAC F7 90                    6 	.word power_adc  
      003420                       4743 kword_dict::
      003420                       4744 	_dict_entry,3+F_IFUNC,ABS,abs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00ACAE EF 01                    1 	.word LINK 
                           003422     2 	LINK=.
      003422                          3 ABS:
      00ACB0 84                       4 	.byte 3+F_IFUNC   	
      00ACB1 85 72 A2                 5 	.ascii "ABS"
      00ACB4 00 03                    6 	.word abs  
                                   4745 
                           000000  4746 INDIRECT=0 
                           000000  4747 .if INDIRECT 
                                   4748 ;comands and fonctions address table 	
                                   4749 code_addr::
                                   4750 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4751 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4752 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4753 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4754 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4755 	.word let,list,log2,lshift,next,new ; 40..47
                                   4756 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4757 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4758 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4759 	.word restore,return, random,rshift,run,free ; 72..79
                                   4760 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4761 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4762 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4763 	.word func_eefree,0 
                                   4764 .endif 
                                   4765 
                                   4766 
                                   4767 
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
      003428                         30 test:
      003428                         31     _vars VSIZE 
      00ACB6 90 F7            [ 2]    1     sub sp,#VSIZE 
      00ACB8 90 EF 01         [ 2]   32     ldw x,#LOOP_CNT
      00ACBB CD 84            [ 2]   33     ldw (CNTR,sp),x  
      00ACBD 11 90 F6         [ 2]   34     ldw x,ticks 
      00ACC0 93 EE            [ 2]   35     ldw (T,sp),x
      003434                         36 1$: ; test add24 
      00ACC2 01 72            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00ACC4 A9 00 03         [ 2]   38     ldw x,#VAL1&0XFFFF
      00ACC7 1C 00 01         [ 1]   39     ld acc24,a 
      00ACCA A9 00 81         [ 2]   40     ldw acc24+1,x  
      00ACCD A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00ACCD 90 89 52         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00ACD0 03 0F 02         [ 4]   43     call add24 
      00ACD3 0F 03            [ 2]   44     ldw x,(CNTR,sp)
      00ACD5 90 AE B4         [ 2]   45     subw x,#1
      00ACD8 A2 93            [ 2]   46     ldw (CNTR,sp),x 
      00ACDA F6 A4            [ 1]   47     jrne 1$
      00ACDC 0F 6B 01         [ 4]   48     call prt_acc24
      00ACDF 0C 03            [ 1]   49     ld a,#SPACE 
      00ACE1 5C F6 CD         [ 4]   50     call putc 
      00ACE4 89 5E 0C         [ 2]   51     ldw x,ticks 
      00ACE7 02 0A 01         [ 2]   52     subw x,(T,sp)
      00ACEA 26 F5 A6         [ 4]   53     call prt_i16  
      00ACED 46 11            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00ACEF 02 2B 09         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ACF2 A6 20 CD         [ 2]   58     ldw x,LOOP_CNT
      00ACF5 89 5E            [ 2]   59     ldw (CNTR,sp),x 
      00ACF7 0C 02 20         [ 2]   60     ldw x,ticks 
      00ACFA 07 A6            [ 2]   61     ldw (T,sp),x 
      003470                         62 2$: 
      00ACFC 0D CD            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ACFE 89 5E 0F         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AD01 02 72 A2         [ 1]   65     ld acc24,a 
      00AD04 00 02 90         [ 2]   66     ldw acc24+1,x  
      00AD07 FE 26            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AD09 CF A6 0D         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AD0C CD 89 5E         [ 4]   69     call mul24 
      00AD0F 5F 7B            [ 2]   70     ldw x,(CNTR,sp)
      00AD11 03 97 CD         [ 2]   71     subw x,#1
      00AD14 98 65            [ 2]   72     ldw (CNTR,sp),x 
      00AD16 AE AD            [ 1]   73     jrne 2$ 
      00AD18 21 CD 89         [ 4]   74    call prt_acc24 
      00AD1B BB 5B            [ 1]   75    ld a,#SPACE 
      00AD1D 03 90 85         [ 4]   76    call putc 
      00AD20 81 20 77         [ 2]   77     ldw x,ticks 
      00AD23 6F 72 64         [ 2]   78     subw x,(T,sp)
      00AD26 73 20 69         [ 4]   79     call prt_i16 
      00AD29 6E 20            [ 1]   80     ld a,#CR 
      00AD2B 64 69 63         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AD2E 74 69 6F         [ 2]   83     ldw x,LOOP_CNT
      00AD31 6E 61            [ 2]   84     ldw (CNTR,sp),x 
      00AD33 72 79 0A         [ 2]   85     ldw x,ticks 
      00AD36 00 01            [ 2]   86     ldw (T,sp),x 
      00AD37                         87 3$: 
      00AD37 CD 99            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AD39 E5 A1 01         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AD3C 27 03 CC         [ 1]   90     ld acc24,a 
      00AD3F 96 B9 0D         [ 2]   91     ldw acc24+1,x  
      00AD41 A6 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AD41 90 F6 93         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AD44 EE 01 72         [ 4]   94     call mul24 
      00AD47 A9 00            [ 2]   95     ldw x,(CNTR,sp)
      00AD49 03 CF 00         [ 2]   96     subw x,#1
      00AD4C 13 81            [ 2]   97     ldw (CNTR,sp),x 
      00AD4E 26 E4            [ 1]   98     jrne 3$ 
      00AD4E 4F CE 00         [ 4]   99     call prt_acc24    
      00AD51 13 27            [ 1]  100     ld a,#SPACE 
      00AD53 02 5F 81         [ 4]  101     call putc 
      00AD56 43 53 81         [ 2]  102     ldw x,ticks 
      00AD59 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AD59 CD 99 E5         [ 4]  104     call prt_i16 
      00AD5C A1 01            [ 1]  105     ld a,#CR 
      00AD5E 27 03 CC         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AD61 96 B9 90         [ 2]  108     ldw x,LOOP_CNT
      00AD64 F6 93            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AD66 EE 01 72         [ 2]  110     ldw x,ticks 
      00AD69 A9 00            [ 2]  111     ldw (T,sp),x 
      0034E8                        112 4$:
      00AD6B 03 4B            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AD6D 00 35 CC         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AD70 50 E0 9E         [ 1]  115     ld acc24,a 
      00AD73 A4 3F 95         [ 2]  116     ldw acc24+1,x  
      00AD76 A3 00            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AD78 FF 23 06         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AD7B 0C 01 98         [ 4]  119     call mul24 
      00AD7E 56 20            [ 2]  120     ldw x,(CNTR,sp)
      00AD80 F5 35 55         [ 2]  121     subw x,#1
      00AD83 50 E0            [ 2]  122     ldw (CNTR,sp),x 
      00AD85 84 C7            [ 1]  123     jrne 4$ 
      00AD87 50 E1 9F         [ 4]  124     call prt_acc24 
      00AD8A 4A 35            [ 1]  125     ld a,#SPACE 
      00AD8C 55 50 E0         [ 4]  126     call putc 
      00AD8F C7 50 E2         [ 2]  127     ldw x,ticks 
      00AD92 35 AA 50         [ 2]  128     subw x,(T,sp)
      00AD95 E0 81 E5         [ 4]  129     call prt_i16 
      00AD97 A6 0D            [ 1]  130     ld a,#CR 
      00AD97 35 AA 50         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AD9A E0 81 10         [ 2]  133     ldw x,LOOP_CNT
      00AD9C 1F 03            [ 2]  134     ldw (CNTR,sp),x 
      00AD9C CD 99 E0         [ 2]  135     ldw x,ticks 
      00AD9F A1 01            [ 2]  136     ldw (T,sp),x 
      003524                        137 5$: 
      00ADA1 27 03            [ 1]  138     ld a,#0xff
      00ADA3 CC 96 B9         [ 2]  139     ldw x,#0xffff
      00ADA6 CD 01 E3         [ 4]  140     call abs24 
      00ADA6 90 F6 93         [ 1]  141     ld acc24,a 
      00ADA9 EE 01 72         [ 2]  142     ldw acc24+1,x
      00ADAC A9 00            [ 2]  143     ldw x,(CNTR,sp)
      00ADAE 03 4D 26         [ 2]  144     subw x,#1
      00ADB1 08 5D            [ 2]  145     ldw (CNTR,sp),x 
      00ADB3 26 05            [ 1]  146     jrne 5$ 
      00ADB5 A6 0A CC         [ 4]  147     call prt_acc24 
      00ADB8 96 BB            [ 1]  148     ld a,#SPACE 
      00ADBA 4B 18 59         [ 4]  149     call putc 
      00ADBD 49 25 04         [ 2]  150     ldw x,ticks 
      00ADC0 0A 01 26         [ 2]  151     subw x,(T,sp)
      00ADC3 F8 5F 84         [ 4]  152     call prt_i16 
      00354C                        153 6$:
      00ADC6 4A 02            [ 1]  154     ld a,#CR 
      00ADC8 CD 08 DE         [ 4]  155     call putc 
      00ADC8 81 35 97         [ 4]  156     call read_integer 
      00ADC9 55 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00ADC9 CD 99 E0 A1 01   [ 1]  158     mov farptr+1,acc16 
      00ADCE 27 03 CC 96 B9   [ 1]  159     mov farptr+2,acc8 
      00ADD3 90 F6 93         [ 4]  160     call read_integer 
      00ADD6 EE 01 72         [ 1]  161     ld a,acc24 
      00ADD9 A9 00 03         [ 2]  162     ldw x,acc16 
      00ADDC 9F AE 00 01 A4   [ 1]  163     mov acc24,farptr 
      00ADE1 17 27 0A 88 4F   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00ADE6 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00ADE6 58 49 0A         [ 4]  166     call div24 
      00ADE9 01               [ 1]  167     push a 
      00ADEA 26               [ 2]  168     pushw x 
      00ADEB FA 17 FC         [ 4]  169     call prt_acc24 
      00ADEC A6 20            [ 1]  170     ld a,#SPACE 
      00ADEC 5B 01 81         [ 4]  171     call putc 
      00ADEF 85               [ 2]  172     popw x
      00ADEF 85 52 04         [ 2]  173     ldw acc16,x  
      00ADF2 89 CE 00         [ 1]  174     pop acc24 
      00ADF5 05 1F 03         [ 4]  175     call prt_acc24
      00ADF8 CE 00            [ 2]  176     jra 6$
      003594                        177     _drop VSIZE 
      00ADFA 01 1F            [ 2]    1     addw sp,#VSIZE 
      00ADFC 05               [ 4]  178     ret 
                                    179 
                                    180 
      003597                        181 read_integer:
      00ADFD 72 5C            [ 1]  182     ld a,#'? 
      00ADFF 00 20 81         [ 4]  183     call putc  
      00AE02 72 5F 00 03      [ 1]  184 	clr count  
      00AE02 72 5D 00         [ 4]  185 	call readln 
      00AE05 20 26 03         [ 2]  186 	ldw x,#tib 
      00AE08 CC 96 B9         [ 1]  187 	push count
      00AE0B 4B 00            [ 1]  188 	push #0 
      00AE0B CD 9C 42         [ 2]  189 	addw x,(1,sp)
      00AE0E 90               [ 1]  190 	incw x 
      0035AF                        191 	_drop 2 
      00AE0F F6 93            [ 2]    1     addw sp,#2 
      00AE11 EE 01 72 A9      [ 1]  192 	clr in 
      00AE15 00 03 4D         [ 4]  193 	call get_token
      00AE18 26 13            [ 1]  194 	cp a,#TK_INTGR
      00AE1A 5D 26            [ 1]  195 	jreq 3$ 
      00AE1C 10 1E            [ 1]  196 	cp a,#TK_MINUS
      00AE1E 03 CF 00         [ 4]  197 	call get_token 
      00AE21 05 E6            [ 1]  198 	cp a,#TK_INTGR 
      00AE23 02 C7            [ 1]  199 	jreq 2$
      00AE25 00 04 1E         [ 2]  200 	jp syntax_error
      0035C8                        201 2$:
      00AE28 05 CF 00         [ 4]  202 	call neg_acc24  	
      0035CB                        203 3$: 
      00AE2B 01               [ 4]  204     ret 
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
      00AE2C 81 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AE2D 00 00                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003422 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003418 R
    ADCON_ID=  000002     |   4 ADCREAD    00340C R   |     ADCREAD_=  000004 
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
  4 ALLOC      003402 R   |   4 AND        0033FA R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        0033F2 R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   00014C R   |   4 AWU        0033EA R
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
  4 BIT        0033E2 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       0033D9 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       0033D0 R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      0033C6 R
    BTEST_ID=  000010     |   4 BTOGL      0033BC R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        0033B4 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    0028A3 R
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
  4 CHAR       0033AB R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
    CODE_ADD=  000001     |     COMMA   =  00002C     |   4 CONST      0033A1 R
  4 CONST_CO   001D2B R   |     CONST_ID=  0000B6     |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        003399 R   |     CR1_IDX =  00001A 
  4 CR2        003391 R   |     CR2_IDX =  000018     |     CTRL_A  =  000001 
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
    CX_IN   =  000003     |   4 DATA       003388 R   |     DATA_IDX=  00001C 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003380 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        003378 R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   4 DIM        003370 R
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         003369 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      00335F R   |     DREAD_ID=  000024     |   4 DROP       003356 R
  4 DWRITE     00334B R   |     DWRITE_I=  000026     |   4 DebugHan   000012 R
  4 EDIT       003342 R   |     EDIT_IDX=  000028     |   4 EEFREE     003337 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

    EEFREE_I=  0000B8     |   4 EEPROM     00332C R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EM      =  000019     |   4 END        003324 R   |     END_IDX =  00002C 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      00331A R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_OVER=  000010     |     ERR_RD_O=  000011 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       003311 R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001ECC R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        003309 R   |     FOR_IDX =  000034 
  4 FREE       003300 R   |     FREE_IDX=  000088     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        0032F8 R   |     GET_IDX =  0000B4     |   4 GOSUB      0032EE R
    GOSUB_ID=  000036     |   4 GOTO       0032E5 R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0032DD R
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
    I2C_OARL=  000000     |     I2C_OAR_=  000813     |     I2C_OAR_=  000009 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

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
  4 IDR        0032D5 R   |     IDR_IDX =  00003C     |   4 IF         0032CE R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INDIRECT=  000000     |     INP     =  000000     |   4 INPUT      0032C4 R
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
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     0032B9 R
    IWDGEN_I=  000042     |   4 IWDGREF    0032AD R   |     IWDGREF_=  000044 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        0032A5 R   |     KEY_END =  000083 
    KEY_IDX =  000046     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        00329D R
    LET_IDX =  000048     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  003422 R   |   4 LIST       003294 R
    LIST_IDX=  00004A     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       00328B R
    LOG_IDX =  00004C     |     LOOP_CNT=  002710     |   4 LSHIFT     003280 R
    LSHIFT_I=  00004E     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000005     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NAME_MAX=  00000F     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        003278 R   |     NEW_IDX =  000052 
  4 NEXT       00326F R   |     NEXT_IDX=  000050     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NLEN_MAS=  00000F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        003267 R
    NOT_IDX =  0000F8     |     NOT_OP  =  000001     |   4 NOT_SAVE   001FBE R
  4 NO_APP     0028E5 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        00325F R
    ODR_IDX =  000054     |   4 ON         003258 R   |     ONOFF   =  000003 
    ON_IDX  =  0000B2     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         003251 R   |     OR_IDX  =  0000FC     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        003249 R   |     PAD_IDX =  000056     |     PAD_SIZE=  000080 
  4 PAUSE      00323F R   |     PAUSE_ID=  000058     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       003236 R   |     PEEK_IDX=  00005C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
  4 PICK       00322D R   |     PINNO   =  000001     |   4 PINP       003224 R
    PINP_IDX=  00005E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      00321A R
    PMODE_ID=  00005A     |   4 POKE       003211 R   |     POKE_IDX=  000060 
  4 POP        003209 R   |   4 PORTA      0031EC R   |   4 PORTB      0031E2 R
  4 PORTC      0031D8 R   |   4 PORTD      0031CE R   |   4 PORTE      0031C4 R
  4 PORTF      0031BA R   |   4 PORTG      0031B0 R   |   4 PORTI      0031A6 R
  4 POUT       003200 R   |     POUT_IDX=  000062     |     PREV    =  000001 
  4 PRINT      0031F6 R   |     PROD    =  000001     |     PROD_SIG=  000004 
  4 PROG_ADD   001EA2 R   |   4 PROG_SIZ   001EB4 R   |     PRTA_IDX=  000066 
    PRTB_IDX=  000068     |     PRTC_IDX=  00006A     |     PRTD_IDX=  00006C 
    PRTE_IDX=  00006E     |     PRTF_IDX=  000070     |     PRTG_IDX=  000072 
    PRTI_IDX=  000074     |     PRT_IDX =  000064     |     PSIZE   =  00000B 
    PSTR    =  000003     |   4 PUSH       00319D R   |   4 PUT        003195 R
  4 QKEY       00318C R   |     QKEY_IDX=  000076     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001EDD R
    RAM_SIZE=  001800     |     RBT_IDX =  00007A     |   4 READ       003183 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    READ_IDX=  000078     |   4 REBOOT     003178 R   |     RECLEN  =  000005 
    REC_LEN =  000003     |     REC_XTRA=  000005     |   4 REG_A      0004CF R
  4 REG_CC     0004D3 R   |   4 REG_EPC    0004C2 R   |   4 REG_SP     0004D8 R
  4 REG_X      0004CB R   |   4 REG_Y      0004C7 R   |     RELOP   =  000001 
  4 REM        003170 R   |     REM_IDX =  00007C     |   4 RESTORE    003164 R
    REST_IDX=  00007E     |     RETL1   =  000001     |   4 RETURN     003159 R
    RET_ADDR=  000001     |     RET_BPTR=  000003     |     RET_IDX =  000080 
    RET_INW =  000005     |   4 RND        003151 R   |     RND_IDX =  000082 
    RONLY   =  000005     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003146 R   |     RSHIFT_I=  000084     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00313E R   |     RUN_IDX =  000086 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000001 
    R_CC    =  000006     |     R_PC    =  00000D     |     R_PCE   =  00000C 
    R_X     =  000002     |     R_Y     =  000004     |   4 SAVE       003135 R
    SAVE_ACC=  000002     |     SAVE_ACC=  000001     |     SAVE_IDX=  000032 
    SAV_ACC1=  000006     |     SAV_ACC2=  000008     |     SAV_COUN=  00000A 
    SAV_IN  =  000009     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   0028A1 R   |   4 SIZE       00312C R
    SIZE_IDX=  0000B0     |     SKIP    =  000005     |   4 SLEEP      003122 R
    SLEEP_ID=  00008A     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      003118 R   |     SPIEN_ID=  00008E 
  4 SPIRD      00310E R   |     SPIRD_ID=  00008C     |   4 SPISEL     003103 R
    SPISEL_I=  000090     |   4 SPIWR      0030F9 R   |     SPIWR_ID=  000092 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     000486 R
  4 STEP       0030F0 R   |     STEP_IDX=  000094     |   4 STOP       0030E7 R
    STOP_IDX=  000096     |     STR     =  000003     |   4 STR_BYTE   001EC5 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      0030DD R   |     TICKS_ID=  000098 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    TIM3_SR1=  005322     |     TIM3_SR2=  005323     |     TIM4_ARR=  005346 
    TIM4_CNT=  005344     |     TIM4_CR1=  005340     |     TIM4_CR1=  000007 
    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    0030D1 R   |   4 TIMER      0030C7 R
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
    TK_XOR  =  00008A     |     TMROUT_I=  00009C     |   4 TO         0030C0 R
  4 TONE       0030B7 R   |     TONE_IDX=  0000A0     |     TOWRITE =  000005 
    TO_IDX  =  00009E     |   4 Timer4Up   000016 R   |     U8      =  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     0030AC R   |     UBOUND_I=  0000A2     |   4 UBTN_Han   00005D R
  4 UFLASH     0030A1 R   |     UFLASH_I=  0000A4     |   4 UNTIL      003097 R
    UNTIL_ID=  0000A6     |     US      =  00001F     |   4 USER_ABO   000065 R
  4 USR        00308F R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000A8     |   4 Uart1RxH   00086C R
  4 UserButt   000039 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VAR_NAME=  000001     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       003086 R   |     WAIT_IDX=  0000AA     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |     WLKPTR  =  000003     |   4 WORDS      00307C R
    WORDS_ID=  0000AC     |   4 WRITE      003072 R   |     WRITE_ID=  0000AE 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        00306A R   |     XOR_IDX =  0000FE     |     XSAVE   =  000002 
    XSTACK_E=  001773     |     XSTACK_S=  000014     |     XTEMP   =  000001 
    YSAVE   =  000004     |     YTEMP   =  000003     |   4 abs        002AA5 R
  4 abs24      0001E3 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000B9A R
  4 add24      00016E R   |   4 add_char   001305 R   |   4 add_spac   0010FD R
  4 analog_r   00265C R   |   4 and_cond   001B70 R   |   4 and_fact   001B40 R
  4 app        003604 R   |   4 app_sign   003600 R   |   4 app_size   003602 R
  4 app_spac   003600 GR  |   4 arduino_   002B92 R   |   4 arg_list   001965 R
  5 array_si   000020 R   |   4 ascii      002955 R   |   4 at_tst     000F6F R
  4 atoi24     001887 GR  |   4 atoi_exi   0018F6 R   |   4 awu        002A4C R
  4 awu02      002A5F R   |   4 bad_port   0029D0 R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       0025D3 R   |   4 beep_1kh   0025A6 GR
  4 bin_exit   000DD6 R   |   4 bit_rese   0021A6 R   |   4 bit_set    002184 R
  4 bit_test   0021EB R   |   4 bit_togg   0021C9 R   |   4 bitmask    002D49 R
  4 bkslsh_t   000F1C R   |   4 bksp       000945 R   |   2 block_bu   0016E0 GR
  4 block_er   00075A R   |   4 break_po   002748 R   |   4 bye        002A18 R
  4 clear_ba   001471 R   |   4 clear_bl   0027F8 R   |   4 clear_va   0013C9 R
  4 clock_in   000080 R   |   4 cmd_cons   001DB1 R   |   4 cmd_dim    001DC5 R
  4 cmd_dim1   001DCF R   |   4 cmd_dim2   001DD5 R   |   4 cmd_end    002572 R
  4 cmd_get    002579 R   |   4 cmd_itf    0004F3 R   |   4 cmd_line   0016C8 R
  4 cmd_name   001325 R   |   4 cmd_on     002420 R   |   4 cmd_size   001C49 R
  4 cold_sta   0000B8 R   |   4 colon_ts   000F43 R   |   4 comma_ts   000F4E R
  4 comp_msg   001618 R   |   4 compile    001069 GR  |   4 conditio   001BC2 R
  4 const_cr   002DEC R   |   4 const_cr   002DF1 R   |   4 const_dd   002DE7 R
  4 const_ee   002E00 R   |   4 const_id   002DE2 R   |   4 const_in   002DFB R
  4 const_od   002DDD R   |   4 const_ou   002DF6 R   |   4 const_po   002DB5 R
  4 const_po   002DBA R   |   4 const_po   002DBF R   |   4 const_po   002DC4 R
  4 const_po   002DC9 R   |   4 const_po   002DCE R   |   4 const_po   002DD3 R
  4 const_po   002DD8 R   |   4 convert_   000D46 R   |   4 convert_   000909 R
  4 copy_com   000FA4 R   |   5 count      000003 GR  |   4 cp24       0001A8 R
  4 cp24_ax    0001DA R   |   4 cp_loop    001916 R   |   4 cpl24      0001EA R
  4 cpy_cmd_   0010E5 R   |   4 cpy_quot   001125 R   |   4 create_g   000C70 R
  4 cs_high    002F82 R   |   4 dash_tst   000F64 R   |   4 data       002E05 R
  4 data_err   002E7E R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001C3B R   |   4 decomp_l   0011BD R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 decompil   001175 GR  |   4 del_line   000C43 R   |   4 delete_l   000A32 R
  4 delete_n   000955 R   |   4 delete_u   0009F7 R   |   4 digital_   002698 R
  4 digital_   0026CF R   |   4 div24      0002F7 R   |   4 divu24_8   0002D9 R
  4 do_loop    002D6F R   |   4 do_progr   00074D R   |   4 dup24      00015F R
  5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR  |   4 edit       001F91 R
  4 enable_i   002CD9 R   |   4 eql_tst    000FEF R   |   4 equal      001318 R
  4 erase      002770 R   |   4 erase_ex   00077E R   |   4 erase_fl   000774 R
  4 err_bad_   00155D R   |   4 err_buf_   0015D3 R   |   4 err_cmd_   001521 R
  4 err_div0   0014E6 R   |   4 err_dupl   00153B R   |   4 err_math   0014CD R
  4 err_mem_   0014B2 R   |   4 err_msg    00148E R   |   4 err_no_a   001569 R
  4 err_no_d   00159C R   |   4 err_no_f   0015C0 R   |   4 err_no_l   0014F5 R
  4 err_no_p   0015AC R   |   4 err_not_   00154C R   |   4 err_over   0015E0 R
  4 err_read   0015EA R   |   4 err_run_   00150B R   |   4 err_synt   0014BF R
  4 escaped    000D5B GR  |   4 expect     001953 R   |   4 expressi   001AA9 R
  4 factor     0019B1 R   |   5 farptr     000018 R   |   4 fcpu       002B14 R
  4 fetchc     0005FA R   |   4 fill_wri   0027E8 R   |   4 final_te   000B93 R
  4 first_li   001F3B R   |   5 flags      000022 GR  |   4 for        002281 R
  4 free       001C40 R   |   5 free_eep   000024 R   |   7 free_ram   000090 R
  4 func_arg   001960 R   |   4 func_cha   00293E R   |   4 func_eef   001D41 R
  4 ge         00131A R   |   4 get_addr   0017C5 R   |   4 get_arra   001981 R
  4 get_char   0017DF R   |   4 get_esca   000915 R   |   4 get_int2   0017CF R
  4 get_targ   0023AE R   |   4 get_targ   0023BC R   |   4 get_tick   002A9E R
  4 get_toke   000EB5 GR  |   4 get_valu   001CC4 R   |   4 getc       0008EE GR
  4 gosub      0024CC R   |   4 gosub_1    0024D7 R   |   4 gosub_2    0024DD R
  4 goto       0024B2 R   |   4 goto_1     0024BC R   |   4 gpio       0029A5 R
  4 gt         001316 R   |   4 gt_tst     000FFA R   |   4 hex_base   001C36 R
  4 hex_dump   00063A R   |   4 if         002264 R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   000850 R
  4 input_ex   00213C R   |   4 input_lo   0020A6 R   |   4 input_va   0020A2 R
  4 insert_c   0009B4 R   |   4 insert_l   000C9C R   |   4 insert_l   000D0B R
  4 interp_l   001709 R   |   4 interpre   0016E4 R   |   4 invalid    000562 R
  4 invalid_   0005D0 R   |   4 is_alnum   000E09 GR  |   4 is_alpha   000DEF GR
  4 is_data_   002E0B R   |   4 is_digit   000E00 GR  |   4 is_symbo   000E12 R
  4 itoa       001822 GR  |   4 itoa_loo   001844 R   |   4 jp_to_ta   0024BF R
  4 key        002994 R   |   4 kword_di   003420 GR  |   4 kword_en   003068 R
  4 le         00131F R   |   4 ledoff     0003BD R   |   4 ledon      0003B8 R
  4 ledtoggl   0003C2 R   |   4 left_par   0003CB R   |   4 let        001C81 GR
  4 let_arra   001C8F R   |   4 let_dvar   001742 R   |   4 let_eval   001C97 R
  4 let_var    001C94 R   |   4 lines_sk   001F3E R   |   4 list       001EEC R
  4 list_con   001CD5 R   |   4 list_exi   001F80 R   |   4 list_loo   001F5E R
  4 log2       002D1C R   |   4 look_tar   0023DF R   |   4 loop_bac   002391 R
  5 loop_dep   00001F R   |   4 loop_don   0023A6 R   |   4 lshift     002ABC R
  4 lt         00131D R   |   4 lt_tst     001023 R   |   4 mem_peek   00057E R
  4 mod24      000391 R   |   4 move       001385 GR  |   4 move_dow   0013A4 R
  4 move_era   0006DC R   |   4 move_exi   0013C5 R   |   4 move_lef   00098C R
  4 move_loo   0013A9 R   |   4 move_prg   00071C R   |   4 move_rig   00099A R
  4 move_up    001396 R   |   4 mul24      000269 R   |   4 mul_char   001307 R
  4 mulu24_8   00022A R   |   4 nbr_tst    000EE8 R   |   4 ne         001322 R
  4 neg24      0001F3 R   |   4 neg_acc2   00020D R   |   4 neg_ax     000205 R
  4 new        002766 R   |   4 next       002339 R   |   4 next_lin   0016EC R
  4 next_tok   00179D GR  |   4 no_match   001928 R   |   4 number     000600 R
  4 other      00104C R   |   4 overwrit   000BBF R   |   2 pad        0016E0 GR
  4 pad_ref    002F87 R   |   4 parse_ad   0004DD R   |   4 parse_bi   000DB4 R
  4 parse_in   000D63 R   |   4 parse_ke   000E35 R   |   4 parse_qu   000D0E R
  4 parse_sy   000E1D R   |   4 pause      002A2C R   |   4 pause02    002A3F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

  4 peek       002243 R   |   4 peek_byt   00059A R   |   4 pin_mode   002B23 R
  4 plus_tst   000FC3 R   |   4 poke       002222 R   |   4 power_ad   00260C R
  4 prcnt_ts   000FE4 R   |   4 print      001FF9 R   |   4 print_fa   0005DF R
  4 print_he   000BF6 GR  |   4 print_re   000417 R   |   4 print_st   000572 R
  4 print_to   00180A R   |   4 prog_siz   001E5B R   |   4 program_   001E63 R
  4 program_   0006F6 R   |   4 program_   00071C R   |   4 prt_acc2   0017FC R
  4 prt_basi   001FD5 R   |   4 prt_i16    0017E5 R   |   4 prt_loop   001FFD R
  4 prt_peek   00039A GR  |   4 prt_reg1   0003F8 R   |   4 prt_reg8   0003D6 R
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       0008DE GR
  4 puts       00093B GR  |   4 qgetc      0008E7 GR  |   4 qkey       002998 GR
  4 qmark_ts   000F7A R   |   4 qsign      0027E1 R   |   4 random     002BB2 R
  4 read       002E83 R   |   4 read01     002E88 R   |   4 read_int   003597 R
  4 readln     000A40 GR  |   4 readln_l   000A4F R   |   4 readln_q   000BDC R
  4 refresh_   002D17 R   |   4 relation   001AE1 R   |   4 relop_st   00130A R
  4 remark     002141 GR  |   4 repl       00051C R   |   4 repl_exi   000544 R
  4 reset_co   001FFB R   |   4 rest_con   002092 R   |   4 restore    002E19 R
  4 return     0024F0 R   |   4 right_al   001113 GR  |   4 row_alig   000835 R
  4 row_eras   0006AF R   |   4 row_eras   0006DC R   |   4 row_loop   00061D R
  4 rparnt_t   000F38 R   |   4 rshift     002AE8 R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     001606 R   |   4 run        00250D R
  4 run_app    00012A R   |   4 run_it     00253F R   |   4 run_it_0   002541 R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_app   00280C R   |   4 save_con   002082 R   |   4 scan_blo   00085E R
  4 search_d   001908 GR  |   4 search_e   001950 R   |   4 search_l   000C18 GR
  4 search_l   000C27 R   |   4 search_n   001D6A R   |   4 search_n   00190C R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002B82 R
  4 send_esc   000963 R   |   4 send_par   00096E R   |   4 set_data   002E4F R
  4 set_time   002CB7 R   |   4 sharp_ts   000F59 R   |   4 show_row   00060B R
  4 single_c   001300 R   |   4 skip       000EA2 R   |   4 skip_str   0017B6 R
  4 slash_ts   000FD9 R   |   4 sleep      002A21 R   |   4 software   0013D8 R
  4 spaces     0009A8 GR  |   4 spi_clea   002F1C R   |   4 spi_disa   002F04 R
  4 spi_enab   002ED1 R   |   4 spi_rcv_   002F3E R   |   4 spi_read   002F69 R
  4 spi_sele   002F70 R   |   4 spi_send   002F28 R   |   4 spi_writ   002F49 R
  2 stack_fu   00179C GR  |   2 stack_un   001828 R   |   4 star_tst   000FCE R
  4 step       0022F7 R   |   4 stop       00271A R   |   4 store_lo   002326 R
  4 str_matc   001935 R   |   4 str_tst    000ED8 R   |   4 strcmp     001364 R
  4 strcpy     001375 GR  |   4 strlen     001359 GR  |   4 sub24      00018B R
  4 symb_loo   000E1E R   |   4 syntax_e   001639 GR  |   4 system_i   00141E R
  5 tab_widt   000023 GR  |   4 tb_error   00163B GR  |   4 term       001A66 R
  4 term01     001A6E R   |   4 term_exi   001AA6 R   |   4 test       003428 R
  4 test_p     00056A R   |   2 tib        001690 GR  |   4 tick_tst   000F92 R
  5 ticks      00000F R   |   4 timeout    002CCE R   |   5 timer      000012 GR
  4 timer2_i   000096 R   |   4 timer4_i   0000A3 R   |   4 tk_id      001629 R
  4 to         0022B1 R   |   4 to_eepro   000745 R   |   4 to_flash   00074A R
  4 to_hex_c   000C0D GR  |   4 to_upper   00187B GR  |   4 token_ch   001062 R
  4 token_ex   001066 R   |   4 tone       0025B1 R   |   4 try_next   002E5C R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   0008EE GR
  4 uart1_in   000899 R   |   4 uart1_pu   0008DE GR  |   4 uart1_qg   0008E7 GR
  4 uart1_se   0008A9 R   |   4 ubound     001C76 R   |   4 uflash     0029D5 R
  4 unlock_e   000679 R   |   4 unlock_f   000694 R   |   4 until      002D82 R
  4 user_int   00004C R   |   4 usr        0029F2 R   |   4 var_name   00116B GR
  5 vars       000034 GR  |   4 wait       002147 R   |   4 warm_ini   00144F R
  4 warm_sta   0016C5 R   |   4 words      002C4D R   |   4 words_co   002CA1 R
  4 write      0028FB R   |   4 write_bl   0007FA GR  |   4 write_bu   000736 R
  4 write_by   000780 R   |   4 write_ee   0007BC R   |   4 write_ex   0007F5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

  4 write_fl   0007A6 R   |   4 write_nb   00081F R   |   4 xalloc     002F9A R
  4 xdrop      002FD0 R   |   4 xpick      00304E R   |   4 xpop       002F90 R
  4 xpush      002F8C R   |   4 xput       00301B R   |   4 xstack_b   002FFD R
  2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
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

