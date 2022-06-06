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
      008050 82 00 88 E8             74 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      0080D7 CD 89 B7         [ 4]  164 	call puts 
      0080DA                        165 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  166     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  167     ldw sp,x
      0080DE 9A               [ 1]  168 	rim 
      0080DF CC 97 41         [ 2]  169 5$:	jp warm_start
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
      008180 CD 89 15         [ 4]  263 	call uart1_init
                                    264 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  265     bset PE_CR2,#USR_BTN_BIT 
                                    266 ; display system information
      008187 9A               [ 1]  267 	rim ; enable interrupts 
      008188 72 5C 00 18      [ 1]  268 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  269 	inc seedx+1 
      008190 CD 9D 51         [ 4]  270 	call func_eefree 
      008193 CD 9C F2         [ 4]  271 	call ubound 
      008196 CD 94 ED         [ 4]  272 	call clear_basic
      008199 CD A5 9A         [ 4]  273 	call beep_1khz  
      00819C CD 94 9A         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for application in flash memory 
      00819F CD A7 D5         [ 4]  277 	call qsign 
      0081A2 27 03            [ 1]  278 	jreq run_app
      0081A4 CC 97 41         [ 2]  279 	jp warm_start 
      0081A7                        280 run_app:
                                    281 ; run application in FLASH|EEPROM 
      0081A7 90 CE 17 73      [ 2]  282 	ldw y,XSTACK_EMPTY
      0081AB CD 94 CB         [ 4]  283 	call warm_init
      0081AE AE B6 04         [ 2]  284 	ldw x,#app 
      0081B1 CF 00 1C         [ 2]  285 	ldw txtbgn,x
      0081B4 72 BB B6 02      [ 2]  286 	addw x,app_size 
      0081B8 CF 00 1E         [ 2]  287 	ldw txtend,x 
      0081BB AE 81 C9         [ 2]  288 	ldw x,#AUTO_RUN 
      0081BE CD 89 B7         [ 4]  289 	call puts 
      0081C1 CD 9E 73         [ 4]  290 	call program_info 
      0081C4 CC A5 35         [ 2]  291 	jp run_it_02  
      0081C7 20 FE            [ 2]  292     jra .  
                                    293 
      0081C9 20 61 75 74 6F 20 72   294 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
             72 61 6D 0A 00
                                    295 
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
      0081DC                         37 dup24:
      00015C                         38     _at_top 
      0081DC 90 F6            [ 1]    1     ld a,(y)
      0081DE 93               [ 1]    2     ldw x,y 
      0081DF EE 01            [ 2]    3     ldw x,(1,x)
      000161                         39     _xpush 
      0081E1 72 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      0081E5 90 F7            [ 1]    2     ld (y),a 
      0081E7 90 EF 01         [ 2]    3     ldw (1,y),x 
      0081EA 81               [ 4]   40     ret 
                                     41 
                                     42 
                                     43 
                                     44 ;-------------------------------
                                     45 ; add24 
                                     46 ; add 24 bits integers 
                                     47 ;------------------------------
      0081EB                         48 add24: ; ( N T -- N+T )
      00016B                         49     _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      0081EB 90 F6            [ 1]    1     ld a,(y)
      0081ED 93               [ 1]    2     ldw x,y 
      0081EE EE 01            [ 2]    3     ldw x,(1,x)
      0081F0 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081F4 89               [ 2]   50     pushw x  
      0081F5 88               [ 1]   51     push a  
      000176                         52     _at_top  
      0081F6 90 F6            [ 1]    1     ld a,(y)
      0081F8 93               [ 1]    2     ldw x,y 
      0081F9 EE 01            [ 2]    3     ldw x,(1,x)
      0081FB 72 FB 02         [ 2]   53     addw x,(2,sp)
      0081FE 19 01            [ 1]   54     adc a, (1,sp)
      000180                         55     _store_top 
      008200 90 F7            [ 1]    1     ld (y),a 
      008202 90 EF 01         [ 2]    2     ldw (1,y),x     
      000185                         56     _drop 3 
      008205 5B 03            [ 2]    1     addw sp,#3 
      008207 81               [ 4]   57     ret 
                                     58 
                                     59 ;-------------------------------
                                     60 ; sub24 
                                     61 ; subtract 24 bits integers 
                                     62 ;------------------------------
      008208                         63 sub24: ; ( N T -- N-T ) 
      000188                         64     _xpop 
      008208 90 F6            [ 1]    1     ld a,(y)
      00820A 93               [ 1]    2     ldw x,y 
      00820B EE 01            [ 2]    3     ldw x,(1,x)
      00820D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008211 89               [ 2]   65     pushw x 
      008212 88               [ 1]   66     push  a
      000193                         67     _at_top  
      008213 90 F6            [ 1]    1     ld a,(y)
      008215 93               [ 1]    2     ldw x,y 
      008216 EE 01            [ 2]    3     ldw x,(1,x)
      008218 72 F0 02         [ 2]   68     subw x,(2,sp) 
      00821B 12 01            [ 1]   69     sbc a, (1,sp)
      00019D                         70     _store_top  
      00821D 90 F7            [ 1]    1     ld (y),a 
      00821F 90 EF 01         [ 2]    2     ldw (1,y),x     
      0001A2                         71     _drop 3 
      008222 5B 03            [ 2]    1     addw sp,#3 
      008224 81               [ 4]   72     ret 
                                     73 
                                     74 ;------------------------------
                                     75 ; cp24  N T -- 0x800000|0|0x010000
                                     76 ;------------------------------
      008225                         77 cp24:
      0001A5                         78     _xpop 
      008225 90 F6            [ 1]    1     ld a,(y)
      008227 93               [ 1]    2     ldw x,y 
      008228 EE 01            [ 2]    3     ldw x,(1,x)
      00822A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00822E C7 00 0D         [ 1]   79     ld acc24,a 
      008231 CF 00 0E         [ 2]   80     ldw acc16,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      0001B4                         81     _at_top 
      008234 90 F6            [ 1]    1     ld a,(y)
      008236 93               [ 1]    2     ldw x,y 
      008237 EE 01            [ 2]    3     ldw x,(1,x)
      008239 72 B0 00 0E      [ 2]   82     subw x,acc16
      00823D C2 00 0D         [ 1]   83     sbc a,acc24
      008240 2F 08            [ 1]   84     jrslt 1$
      008242 26 0A            [ 1]   85     jrne 2$
      008244 5D               [ 2]   86     tnzw x 
      008245 26 07            [ 1]   87     jrne 2$
      008247 4F               [ 1]   88     clr a 
      008248 20 06            [ 2]   89     jra 9$ 
      00824A                         90 1$: ; i1 < i2 
      00824A A6 FF            [ 1]   91     ld a,#255
      00824C 20 02            [ 2]   92     jra 9$ 
      00824E                         93 2$: ; i1 > i2 
      00824E A6 01            [ 1]   94     ld a,#1 
      008250 5F               [ 1]   95 9$: clrw x
      0001D1                         96      _store_top 
      008251 90 F7            [ 1]    1     ld (y),a 
      008253 90 EF 01         [ 2]    2     ldw (1,y),x     
      008256 81               [ 4]   97     ret 
                                     98 
                                     99 ;-------------------------------
                                    100 ; cp24_ax 
                                    101 ; compare acc24 with A:X 
                                    102 ;-------------------------------
      008257                        103 cp24_ax:
      008257 88               [ 1]  104     push a 
      008258 C3 00 0E         [ 2]  105     cpw x,acc16 
      00825B C2 00 0D         [ 1]  106     sbc a,acc24
      00825E 84               [ 1]  107     pop a 
      00825F 81               [ 4]  108     ret 
                                    109 
                                    110 
                                    111 ;-------------------------------
                                    112 ; abs24 
                                    113 ; abolute value of top  
                                    114 ;-------------------------------
      008260                        115 abs24: ; ( i -- u )
      008260 90 F6            [ 1]  116     ld a,(y)
      008262 A1 80            [ 1]  117     cp a,#0x80 
      008264 2A 0A            [ 1]  118     jrpl neg24 ; negative integer
      008266 81               [ 4]  119     ret  
                                    120 
                                    121 ;----------------------------
                                    122 ;  one's compleement 
                                    123 ;----------------------------
      008267                        124 cpl24:  ; i -- ~i 
      008267 90 73            [ 1]  125     cpl (y) 
      008269 90 63 01         [ 1]  126     cpl (1,y)
      00826C 90 63 02         [ 1]  127     cpl (2,y)
      00826F 81               [ 4]  128     ret 
                                    129 
                                    130 ;----------------------------    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                    131 ; two'2 complement of top  
                                    132 ;---------------------------
      008270                        133 neg24: ; (i -- -i )
      0001F0                        134     _at_top
      008270 90 F6            [ 1]    1     ld a,(y)
      008272 93               [ 1]    2     ldw x,y 
      008273 EE 01            [ 2]    3     ldw x,(1,x)
      008275 43               [ 1]  135     cpl  a  
      008276 53               [ 2]  136     cplw x 
      008277 1C 00 01         [ 2]  137     addw x,#1
      00827A A9 00            [ 1]  138     adc a,#0
      0001FC                        139     _store_top  
      00827C 90 F7            [ 1]    1     ld (y),a 
      00827E 90 EF 01         [ 2]    2     ldw (1,y),x     
      008281 81               [ 4]  140 9$: ret 
                                    141 
                                    142 ;-----------------------------
                                    143 ; negate integer in A:X 
                                    144 ;----------------------------
      008282                        145 neg_ax:
      008282 43               [ 1]  146     cpl  a  
      008283 53               [ 2]  147     cplw x 
      008284 1C 00 01         [ 2]  148     addw x,#1
      008287 A9 00            [ 1]  149     adc a,#0
      008289 81               [ 4]  150     ret 
                                    151 
                                    152 ;------------------------------------
                                    153 ;  two's complement of acc24 
                                    154 ;-------------------------------------
      00828A                        155 neg_acc24: ; 
      00828A 72 53 00 0D      [ 1]  156     cpl acc24 
      00828E 72 53 00 0E      [ 1]  157     cpl acc16 
      008292 72 53 00 0F      [ 1]  158     cpl acc8
      008296 72 5C 00 0F      [ 1]  159     inc acc8 
      00829A 26 0A            [ 1]  160     jrne 9$
      00829C 72 5C 00 0E      [ 1]  161     inc acc16 
      0082A0 26 04            [ 1]  162     jrne 9$
      0082A2 72 5C 00 0D      [ 1]  163     inc acc24 
      0082A6 81               [ 4]  164 9$: ret 
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
      0082A7                        180 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      0082A7 88               [ 1]  181     push a 
      0082A8 72 5F 00 0C      [ 1]  182 	clr acc32
      0082AC 72 5F 00 0D      [ 1]  183     clr acc24  
                                    184 ; multiply top bits 7..0 * U8   	
      0082B0 90 E6 02         [ 1]  185     ld a,(2,Y) ; top least byte  
      0082B3 97               [ 1]  186     ld xl,a 
      0082B4 7B 01            [ 1]  187     ld a,(U8,sp)
      0082B6 42               [ 4]  188     mul x,a 
      0082B7 CF 00 0E         [ 2]  189     ldw acc16,x 
                                    190 ; multiply top bits 15..8 * U8     
      0082BA 90 E6 01         [ 1]  191     ld a,(1,Y) ; top middle byte 
      0082BD 97               [ 1]  192     ld xl,a 
      0082BE 7B 01            [ 1]  193     ld a,(U8,sp) 
      0082C0 42               [ 4]  194     mul x,a 
      0082C1 72 BB 00 0D      [ 2]  195     addw x,acc24
      0082C5 72 59 00 0C      [ 1]  196     rlc acc32 
      0082C9 CF 00 0D         [ 2]  197     ldw acc24,x 
                                    198 ; multiply top bits 23..16 * 8 
      0082CC 90 F6            [ 1]  199     ld a,(Y)
      0082CE 97               [ 1]  200     ld xl,a 
      0082CF 7B 01            [ 1]  201     ld a,(U8,sp)
      0082D1 42               [ 4]  202     mul x,a 
      0082D2 72 BB 00 0C      [ 2]  203     addw x,acc32
      0082D6 02               [ 1]  204     rlwa x 
      0082D7 4D               [ 1]  205     tnz a 
      0082D8 27 05            [ 1]  206     jreq 1$
      0082DA A6 10            [ 1]  207     ld a,#ERR_OVERFLOW
      0082DC CC 96 B7         [ 2]  208     jp tb_error 
      0082DF                        209 1$:
      0082DF 9E               [ 1]  210     ld a,xh  
      0082E0 CE 00 0E         [ 2]  211     ldw x,acc16   
      000263                        212     _drop VSIZE 
      0082E3 5B 01            [ 2]    1     addw sp,#VSIZE 
      0082E5 81               [ 4]  213     ret
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
      0082E6                        224 mul24:
      000266                        225     _vars VSIZE
      0082E6 52 07            [ 2]    1     sub sp,#VSIZE 
      0082E8 5F               [ 1]  226     clrw x 
      0082E9 1F 01            [ 2]  227     ldw (PROD,sp),x 
      0082EB 1F 03            [ 2]  228     ldw (PROD+2,sp),x
      00026D                        229     _xpop 
      0082ED 90 F6            [ 1]    1     ld a,(y)
      0082EF 93               [ 1]    2     ldw x,y 
      0082F0 EE 01            [ 2]    3     ldw x,(1,x)
      0082F2 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      0082F6 4D               [ 1]  230     tnz a 
      0082F7 2A 05            [ 1]  231     jrpl 0$
      0082F9 03 04            [ 1]  232     cpl (PROD_SIGN,sp)
      0082FB CD 82 82         [ 4]  233     call neg_ax 
      0082FE                        234 0$:    
      0082FE 6B 05            [ 1]  235     ld (N1,sp),a 
      008300 1F 06            [ 2]  236     ldw (N1+1,sp),x
      008302 90 7D            [ 1]  237     tnz (Y)
      008304 2A 05            [ 1]  238     jrpl 2$ 
      008306 03 04            [ 1]  239     cpl (PROD_SIGN,sp) 
      008308 CD 82 70         [ 4]  240     call neg24
      00830B                        241 2$: 
      00830B 7B 07            [ 1]  242     ld a,(N1+2,sp); least byte     
      00830D 27 0A            [ 1]  243     jreq 4$
      00830F CD 82 A7         [ 4]  244     call mulu24_8
      008312 4D               [ 1]  245     tnz a 
      008313 2B 3C            [ 1]  246     jrmi 8$ ; overflow  
      008315 6B 01            [ 1]  247     ld (PROD,sp),a
      008317 1F 02            [ 2]  248     ldw (PROD+1,sp),x 
      008319                        249 4$:
      008319 7B 06            [ 1]  250     ld a,(N1+1,sp); middle byte     
      00831B 27 0D            [ 1]  251     jreq 5$
      00831D CD 82 A7         [ 4]  252     call mulu24_8
      008320 4D               [ 1]  253     tnz a 
      008321 26 2E            [ 1]  254     jrne 8$  ; overflow 
      008323 72 FB 01         [ 2]  255     addw x,(PROD,sp)
      008326 29 29            [ 1]  256     jrv 8$ ; overflow
      008328 1F 01            [ 2]  257     ldw (PROD,sp),x 
      00832A                        258 5$:
      00832A 7B 05            [ 1]  259     ld a,(N1,sp) ; high byte 
      00832C 27 10            [ 1]  260     jreq 6$
      00832E CD 82 A7         [ 4]  261     call mulu24_8
      008331 01               [ 1]  262     rrwa x 
      008332 5D               [ 2]  263     tnzw x 
      008333 26 1C            [ 1]  264     jrne 8$ ; overflow 
      008335 4D               [ 1]  265     tnz a 
      008336 2B 19            [ 1]  266     jrmi 8$ ; overflow 
      008338 1B 01            [ 1]  267     add a,(PROD,sp)
      00833A 6B 01            [ 1]  268     ld (PROD,sp),a 
      00833C 29 13            [ 1]  269     jrv 8$ ; overflow 
      00833E                        270 6$:
      00833E 7B 01            [ 1]  271     ld a,(PROD,sp)
      008340 1E 02            [ 2]  272     ldw x,(PROD+1,sp)
      008342 0D 04            [ 1]  273     tnz (PROD_SIGN,sp)
      008344 27 03            [ 1]  274     jreq 9$
      008346 CD 82 82         [ 4]  275     call neg_ax 
      008349                        276 9$:
      0002C9                        277     _store_top 
      008349 90 F7            [ 1]    1     ld (y),a 
      00834B 90 EF 01         [ 2]    2     ldw (1,y),x     
      0002CE                        278     _drop VSIZE 
      00834E 5B 07            [ 2]    1     addw sp,#VSIZE 
      008350 81               [ 4]  279     ret 
      008351                        280 8$: ; overflow
      008351 A6 10            [ 1]  281     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008353 CC 96 B7         [ 2]  282     jp tb_error 
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
      008356                        296 divu24_8:
      008356 89               [ 2]  297 	pushw x ; save x
      008357 88               [ 1]  298 	push a 
                                    299 	; ld dividend UU:MM bytes in X
      008358 CE 00 0D         [ 2]  300 	ldw x,acc24
      00835B 7B 01            [ 1]  301 	ld a,(U8,SP) ; divisor
      00835D 62               [ 2]  302 	div x,a ; UU:MM/U8
      00835E 88               [ 1]  303 	push a  ;save remainder
      00835F CF 00 0D         [ 2]  304     ldw acc24,x ; quotient 
      008362 84               [ 1]  305 	pop a
      008363 95               [ 1]  306 	ld xh,a
      008364 C6 00 0F         [ 1]  307 	ld a,acc8
      008367 97               [ 1]  308 	ld xl,a
      008368 7B 01            [ 1]  309 	ld a,(U8,sp) ; divisor
      00836A 62               [ 2]  310 	div x,a  ; R:LL/U8
      00836B 6B 01            [ 1]  311 	ld (U8,sp),a ; save remainder
      00836D 9F               [ 1]  312 	ld a,xl
      00836E C7 00 0F         [ 1]  313 	ld acc8,a
      008371 84               [ 1]  314 	pop a
      008372 85               [ 2]  315 	popw x
      008373 81               [ 4]  316 	ret
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
      008374                        332 div24:
      0002F4                        333     _vars VSIZE 
      008374 52 06            [ 2]    1     sub sp,#VSIZE 
      008376 0F 06            [ 1]  334     clr (RSIGN,sp)
      008378 0F 05            [ 1]  335     clr (QSIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      0002FA                        336     _xpop 
      00837A 90 F6            [ 1]    1     ld a,(y)
      00837C 93               [ 1]    2     ldw x,y 
      00837D EE 01            [ 2]    3     ldw x,(1,x)
      00837F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008383 4D               [ 1]  337     tnz a 
      008384 2A 05            [ 1]  338     jrpl 0$ 
      008386 03 05            [ 1]  339     cpl (QSIGN,sp)
      008388 CD 82 82         [ 4]  340     call neg_ax
      00838B                        341 0$:
      00838B 6B 01            [ 1]  342     ld  (DIVISOR,sp),a
      00838D 1F 02            [ 2]  343     ldw (DIVISOR+1,sp),x
      00838F 1A 02            [ 1]  344     or a,(DIVISOR+1,sp)
      008391 1A 03            [ 1]  345     or a,(DIVISOR+2,sp)
      008393 26 05            [ 1]  346     jrne 1$ 
      008395 A6 04            [ 1]  347     ld a,#ERR_DIV0 
      008397 CC 96 B7         [ 2]  348     jp tb_error 
      00839A                        349 1$: ; dividend  
      00031A                        350     _at_top
      00839A 90 F6            [ 1]    1     ld a,(y)
      00839C 93               [ 1]    2     ldw x,y 
      00839D EE 01            [ 2]    3     ldw x,(1,x)
      00839F 4D               [ 1]  351     tnz a 
      0083A0 2A 07            [ 1]  352     jrpl 2$
      0083A2 CD 82 82         [ 4]  353     call neg_ax
      0083A5 03 05            [ 1]  354     cpl (QSIGN,sp)
      0083A7 03 06            [ 1]  355     cpl (RSIGN,sp)
      0083A9                        356 2$: 
                                    357 ;    ld acc24,a 
                                    358 ;    ldw acc16,x 
      000329                        359     _store_top 
      0083A9 90 F7            [ 1]    1     ld (y),a 
      0083AB 90 EF 01         [ 2]    2     ldw (1,y),x     
      0083AE A6 18            [ 1]  360     ld a,#24 
      0083B0 6B 04            [ 1]  361     ld (CNTR,sp),a
      0083B2 7B 01            [ 1]  362     ld a,(DIVISOR,sp)
      0083B4 1E 02            [ 2]  363     ldw x,(DIVISOR+1,sp)
                                    364 ; dividend >= divisor ? 
      0083B6 CD 82 57         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      0083B9 23 14            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      0083BB C6 00 0D         [ 1]  368     ld a,acc24 
      0083BE CE 00 0E         [ 2]  369     ldw x,acc16 
      0083C1 72 5F 00 0D      [ 1]  370     clr acc24 
      0083C5 72 5F 00 0E      [ 1]  371     clr acc16 
      0083C9 72 5F 00 0F      [ 1]  372     clr acc8 
      0083CD 20 26            [ 2]  373     jra 6$
      0083CF                        374 22$:     
      0083CF 4F               [ 1]  375     clr a 
      0083D0 5F               [ 1]  376     clrw x 
      0083D1 98               [ 1]  377     rcf  
      0083D2                        378 3$: ; shift carry in acc24 bit 0 
      0083D2 90 69 02         [ 1]  379     rlc (2,y) 
      0083D5 90 69 01         [ 1]  380     rlc (1,y)
      0083D8 90 79            [ 1]  381     rlc (Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0083DA 59               [ 2]  382     rlcw x  
      0083DB 49               [ 1]  383     rlc a
      0083DC 72 F0 02         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083DF 12 01            [ 1]  385     sbc a,(DIVISOR,sp)
      0083E1 24 05            [ 1]  386     jrnc 5$
      0083E3 72 FB 02         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083E6 19 01            [ 1]  388     adc a,(DIVISOR,sp)
      0083E8                        389 5$: ; shift carry in QUOTIENT 
      0083E8 8C               [ 1]  390     ccf
      0083E9 0A 04            [ 1]  391     dec (CNTR,sp)
      0083EB 26 E5            [ 1]  392     jrne 3$ 
                                    393 ; shift quotient last bit     
      0083ED 90 69 02         [ 1]  394     rlc (2,y)
      0083F0 90 69 01         [ 1]  395     rlc (1,y) 
      0083F3 90 79            [ 1]  396     rlc (y) 
      0083F5                        397 6$:    
      0083F5 6B 01            [ 1]  398     ld (DIVISOR,sp),a 
      0083F7 1F 02            [ 2]  399     ldw (DIVISOR+1,sp),x 
      0083F9 0D 05            [ 1]  400     tnz (QSIGN,sp)
      0083FB 27 03            [ 1]  401     jreq 8$
      0083FD CD 82 70         [ 4]  402     call neg24
      008400                        403 8$: 
      008400 7B 01            [ 1]  404     ld a,(DIVISOR,sp)
      008402 1E 02            [ 2]  405     ldw x,(DIVSOR+1,sp)
      008404                        406 81$:
      008404 0D 06            [ 1]  407     tnz (RSIGN,sp)
      008406 27 03            [ 1]  408     jreq 9$
      008408 CD 82 82         [ 4]  409     call neg_ax       
      00038B                        410 9$: _drop VSIZE 
      00840B 5B 06            [ 2]    1     addw sp,#VSIZE 
      00840D 81               [ 4]  411     ret 
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
      00840E                        423 mod24:
      00840E CD 83 74         [ 4]  424     call div24 
      000391                        425     _store_top  ; replace quotient by remainder 
      008411 90 F7            [ 1]    1     ld (y),a 
      008413 90 EF 01         [ 2]    2     ldw (1,y),x     
      008416 81               [ 4]  426     ret 
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
      008417                         48 prt_peek::
      008417 89               [ 2]   49 	pushw x 
      008418 35 10 00 0B      [ 1]   50 	mov base,#16 
      00841C CD 98 61         [ 4]   51 	call prt_i16  
      00841F A6 3A            [ 1]   52 	ld a,#': 
      008421 CD 89 5A         [ 4]   53 	call putc 
      008424 A6 20            [ 1]   54 	ld a,#SPACE 
      008426 CD 89 5A         [ 4]   55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008429 85               [ 2]   56 	popw x 
      00842A F6               [ 1]   57 	ld a,(x)
      00842B 5F               [ 1]   58 	clrw x 
      00842C 97               [ 1]   59 	ld xl,a 
      00842D 35 0A 00 0B      [ 1]   60 	mov base,#10 
      008431 CD 98 61         [ 4]   61 	call prt_i16 
      008434 81               [ 4]   62 	ret 
                                     63 
                                     64 ;----------------------------------------
                                     65 ;   DEBUG support functions
                                     66 ;----------------------------------------
                                     67 
                                     68 ; turn LED on 
      008435                         69 ledon:
      008435 72 1A 50 0A      [ 1]   70     bset PC_ODR,#LED2_BIT
      008439 81               [ 4]   71     ret 
                                     72 
                                     73 ; turn LED off 
      00843A                         74 ledoff:
      00843A 72 1B 50 0A      [ 1]   75     bres PC_ODR,#LED2_BIT 
      00843E 81               [ 4]   76     ret 
                                     77 
                                     78 ; invert LED status 
      00843F                         79 ledtoggle:
      00843F A6 20            [ 1]   80     ld a,#LED2_MASK
      008441 C8 50 0A         [ 1]   81     xor a,PC_ODR
      008444 C7 50 0A         [ 1]   82     ld PC_ODR,a
      008447 81               [ 4]   83     ret 
                                     84 
      008448                         85 left_paren:
      008448 A6 20            [ 1]   86 	ld a,#SPACE 
      00844A CD 89 5A         [ 4]   87 	call putc
      00844D A6 28            [ 1]   88 	ld a,#'( 
      00844F CD 89 5A         [ 4]   89 	call putc 	
      008452 81               [ 4]   90 	ret 
                                     91 
                                     92 ;------------------------------
                                     93 ; print 8 bit register 
                                     94 ; input:
                                     95 ;   X  point to register name 
                                     96 ;   A  register value to print 
                                     97 ; output:
                                     98 ;   none
                                     99 ;------------------------------- 
      008453                        100 prt_reg8:
      008453 88               [ 1]  101 	push a 
      008454 CD 89 B7         [ 4]  102 	call puts 
      008457 7B 01            [ 1]  103 	ld a,(1,sp) 
      008459 5F               [ 1]  104 	clrw x 
      00845A 97               [ 1]  105 	ld xl,a 
      00845B 35 10 00 0B      [ 1]  106 	mov base,#16
      00845F CD 98 61         [ 4]  107 	call prt_i16  
      008462 CD 84 48         [ 4]  108 	call left_paren 
      008465 84               [ 1]  109 	pop a 
      008466 5F               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008467 97               [ 1]  111 	ld xl,a 
      008468 35 0A 00 0B      [ 1]  112 	mov base,#10 
      00846C CD 98 61         [ 4]  113 	call prt_i16  
      00846F A6 29            [ 1]  114 	ld a,#') 
      008471 CD 89 5A         [ 4]  115 	call putc
      008474 81               [ 4]  116 	ret
                                    117 
                                    118 ;--------------------------------
                                    119 ; print 16 bits register 
                                    120 ; input:
                                    121 ;   X   point register name 
                                    122 ;   Y   register value to print 
                                    123 ; output:
                                    124 ;  none
                                    125 ;--------------------------------
      008475                        126 prt_reg16: 
      008475 90 89            [ 2]  127 	pushw y 
      008477 CD 89 B7         [ 4]  128 	call puts 
      00847A 1E 01            [ 2]  129 	ldw x,(1,sp) 
      00847C 35 10 00 0B      [ 1]  130 	mov base,#16 
      008480 CD 98 61         [ 4]  131 	call prt_i16  
      008483 CD 84 48         [ 4]  132 	call left_paren 
      008486 85               [ 2]  133 	popw x 
      008487 35 0A 00 0B      [ 1]  134 	mov base,#10 
      00848B CD 98 61         [ 4]  135 	call prt_i16  
      00848E A6 29            [ 1]  136 	ld a,#') 
      008490 CD 89 5A         [ 4]  137 	call putc
      008493 81               [ 4]  138 	ret 
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
      008494                        152 print_registers:
      008494 8A               [ 1]  153 	push cc 
      000415                        154 	_vars VSIZE 
      008495 52 08            [ 2]    1     sub sp,#VSIZE 
      008497 6B 01            [ 1]  155 	ld (R_A,sp),a 
      008499 1F 02            [ 2]  156 	ldw (R_X,sp),x 
      00849B 17 04            [ 2]  157 	ldw (R_Y,sp),y
      00849D C6 00 0D         [ 1]  158 	ld a,acc24 
      0084A0 CE 00 0E         [ 2]  159 	ldw x,acc16 
      0084A3 6B 08            [ 1]  160 	ld (SAV_ACC24,sp),a 
      0084A5 1F 06            [ 2]  161 	ldw (SAV_ACC16,sp),x 
      0084A7 AE 84 FE         [ 2]  162 	ldw x,#STATES
      0084AA CD 89 B7         [ 4]  163 	call puts
                                    164 ; print PC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0084AD AE 85 3B         [ 2]  165 	ldw x, #REG_PC
      0084B0 16 0A            [ 2]  166 	ldw y, (R_PC,sp)
      0084B2 72 A2 00 03      [ 2]  167 	subw y,#3
      0084B6 CD 84 75         [ 4]  168 	call prt_reg16 
                                    169 ; print x
      0084B9 AE 85 43         [ 2]  170 	ldw x,#REG_X
      0084BC 16 02            [ 2]  171 	ldw y,(R_X,sp)
      0084BE CD 84 75         [ 4]  172 	call prt_reg16  
                                    173 ; print Y 
      0084C1 AE 85 3F         [ 2]  174 	ldw x,#REG_Y
      0084C4 16 04            [ 2]  175 	ldw y, (R_Y,sp)
      0084C6 CD 84 75         [ 4]  176 	call prt_reg16  
                                    177 ; print A 
      0084C9 AE 85 47         [ 2]  178 	ldw x,#REG_A
      0084CC 7B 01            [ 1]  179 	ld a, (R_A,sp) 
      0084CE CD 84 53         [ 4]  180 	call prt_reg8
                                    181 ; print CC 
      0084D1 AE 85 4B         [ 2]  182 	ldw x,#REG_CC 
      0084D4 7B 09            [ 1]  183 	ld a, (R_CC,sp) 
      0084D6 CD 84 53         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      0084D9 AE 85 50         [ 2]  186 	ldw x,#REG_SP
      0084DC 90 96            [ 1]  187 	ldw y,sp 
      0084DE 72 A9 00 0B      [ 2]  188 	addw y,#(VSIZE+3)
      0084E2 CD 84 75         [ 4]  189 	call prt_reg16  
      0084E5 A6 0A            [ 1]  190 	ld a,#'\n' 
      0084E7 CD 89 5A         [ 4]  191 	call putc
      0084EA 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      0084EC 1E 06            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      0084EE C7 00 0D         [ 1]  194 	ld acc24,a 
      0084F1 CF 00 0E         [ 2]  195 	ldw acc16,x 
      0084F4 7B 01            [ 1]  196 	ld a,(R_A,sp)
      0084F6 1E 02            [ 2]  197 	ldw x,(R_X,sp)
      0084F8 16 04            [ 2]  198 	ldw y,(R_Y,sp)
      00047A                        199 	_drop VSIZE
      0084FA 5B 08            [ 2]    1     addw sp,#VSIZE 
      0084FC 86               [ 1]  200 	pop cc   	
      0084FD 81               [ 4]  201 	ret
                                    202 
      0084FE 0A 52 65 67 69 73 74   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 62
             72 65 61 6B 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00853B 50 43 3A 00            204 REG_PC: .asciz "PC:"
      00853F 0A 59 3A 00            205 REG_Y:   .asciz "\nY:" 
      008543 0A 58 3A 00            206 REG_X:   .asciz "\nX:"
      008547 0A 41 3A 00            207 REG_A:   .asciz "\nA:" 
      00854B 0A 43 43 3A 00         208 REG_CC:  .asciz "\nCC:"
      008550 0A 53 50 3A 00         209 REG_SP:  .asciz "\nSP:"
                                    210 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                    211 ;----------------------
                                    212 ; input:
                                    213 ;	Y    *input buffer 
                                    214 ; output:
                                    215 ;   acc24  integer 
                                    216 ;----------------------
      008555                        217 parse_addr:
      008555 A6 20            [ 1]  218 	ld a,#SPACE 
      008557 CD 8F 1E         [ 4]  219 	call skip  	 
      00855A 72 B9 00 01      [ 2]  220 	addw y,in.w 
      00855E AE 16 E0         [ 2]  221 	ldw x,#pad 
      008561 CD 93 F1         [ 4]  222 	call strcpy
      008564 AE 16 E0         [ 2]  223 	ldw x,#pad
      008567 CD 99 03         [ 4]  224 	call atoi24 	
      00856A 81               [ 4]  225 	ret 
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
      00856B                        244 cmd_itf:
      00856B 8A               [ 1]  245 	push cc 
      0004EC                        246 	_vars VSIZE
      00856C 52 0B            [ 2]    1     sub sp,#VSIZE 
      00856E 6B 01            [ 1]  247 	ld (R_A,sp),a
      008570 C6 00 04         [ 1]  248 	ld a,count 
      008573 6B 0A            [ 1]  249 	ld (SAV_COUNT,sp),a 
      008575 C6 00 02         [ 1]  250 	ld a,in 
      008578 6B 09            [ 1]  251 	ld (SAV_IN,sp),a  
      00857A 1F 02            [ 2]  252 	ldw (R_X,sp),x 
      00857C 17 04            [ 2]  253 	ldw (R_Y,sp),y
      00857E C6 00 0D         [ 1]  254 	ld a,acc24 
      008581 CE 00 0E         [ 2]  255 	ldw x,acc16 
      008584 6B 08            [ 1]  256 	ld (SAV_ACC24,sp),a 
      008586 1F 06            [ 2]  257 	ldw (SAV_ACC16,sp),x 
      008588 72 5F 00 19      [ 1]  258 	clr farptr 
      00858C 72 5F 00 1A      [ 1]  259 	clr farptr+1 
      008590 72 5F 00 1B      [ 1]  260 	clr farptr+2  
      008594                        261 repl:
      008594 A6 0D            [ 1]  262 	ld a,#CR 
      008596 CD 89 5A         [ 4]  263 	call putc 
      008599 A6 3F            [ 1]  264 	ld a,#'? 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00859B CD 89 5A         [ 4]  265 	call putc
      00859E 72 5F 00 01      [ 1]  266 	clr in.w 
      0085A2 72 5F 00 02      [ 1]  267 	clr in 
      0085A6 CD 8A BC         [ 4]  268 	call readln
      0085A9 90 AE 16 90      [ 2]  269 	ldw y,#tib  
      0085AD 90 F6            [ 1]  270 	ld a,(y)
      0085AF 27 E3            [ 1]  271 	jreq repl  
      0085B1 72 5C 00 02      [ 1]  272 	inc in 
      0085B5 CD 98 F7         [ 4]  273 	call to_upper 
      0085B8 A1 51            [ 1]  274 	cp a,#'Q 
      0085BA 26 26            [ 1]  275 	jrne test_p
      0085BC                        276 repl_exit:
                                    277 ; restore original context 
      0085BC 7B 08            [ 1]  278 	ld a,(SAV_ACC24,sp)
      0085BE 1E 06            [ 2]  279 	ldw x,(SAV_ACC16,sp)
      0085C0 C7 00 0D         [ 1]  280 	ld acc24,a 
      0085C3 CF 00 0E         [ 2]  281 	ldw acc16,x
      0085C6 7B 0A            [ 1]  282 	ld a,(SAV_COUNT,sp)
      0085C8 C7 00 04         [ 1]  283 	ld count,a 
      0085CB 7B 09            [ 1]  284 	ld a,(SAV_IN,sp)
      0085CD C7 00 02         [ 1]  285 	ld in,a 
      0085D0 16 04            [ 2]  286 	ldw y,(R_Y,sp)
      0085D2 1E 02            [ 2]  287 	ldw x,(R_X,sp)
      0085D4 7B 01            [ 1]  288 	ld a,(R_A,sp)
      000556                        289 	_drop VSIZE
      0085D6 5B 0B            [ 2]    1     addw sp,#VSIZE 
      0085D8 86               [ 1]  290 	pop cc 
      0085D9 81               [ 4]  291 	ret  
      0085DA                        292 invalid:
      0085DA AE 86 48         [ 2]  293 	ldw x,#invalid_cmd 
      0085DD CD 89 B7         [ 4]  294 	call puts 
      0085E0 20 B2            [ 2]  295 	jra repl 
      0085E2                        296 test_p:	
      0085E2 A1 50            [ 1]  297     cp a,#'P 
      0085E4 27 10            [ 1]  298 	jreq mem_peek
      0085E6 A1 53            [ 1]  299     cp a,#'S 
      0085E8 26 F0            [ 1]  300 	jrne invalid 
      0085EA                        301 print_string:
      0085EA CD 85 55         [ 4]  302 	call parse_addr 	
      0085ED CE 00 0E         [ 2]  303 	ldw x,acc16
      0085F0 CD 89 B7         [ 4]  304 	call puts
      0085F3 CC 85 94         [ 2]  305 	jp repl 	
      0085F6                        306 mem_peek:
      0085F6 CD 85 55         [ 4]  307 	call parse_addr 
      0085F9 C6 00 0D         [ 1]  308 	ld a, acc24 
      0085FC CA 00 0E         [ 1]  309 	or a,acc16 
      0085FF CA 00 0F         [ 1]  310 	or a,acc8 
      008602 26 02            [ 1]  311 	jrne 1$ 
      008604 20 0C            [ 2]  312 	jra peek_byte  
      008606 CE 00 0D         [ 2]  313 1$:	ldw x,acc24 
      008609 CF 00 19         [ 2]  314 	ldw farptr,x 
      00860C C6 00 0F         [ 1]  315 	ld a,acc8 
      00860F C7 00 1B         [ 1]  316 	ld farptr+2,a 
      008612                        317 peek_byte:
      008612 CD 86 57         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008615 A6 08            [ 1]  319 	ld a,#8 
      008617 6B 0B            [ 1]  320 	ld (PSIZE,sp),a 
      008619 5F               [ 1]  321 	clrw x 
      00861A CD 86 72         [ 4]  322 1$:	call fetchc  
      00861D 89               [ 2]  323 	pushw x 
      00861E C7 00 0F         [ 1]  324 	ld acc8,a 
      008621 5F               [ 1]  325 	clrw x 
      008622 CF 00 0D         [ 2]  326 	ldw acc24,x 
      008625 A6 90            [ 1]  327 	ld a,#16+128
      008627 CD 98 78         [ 4]  328 	call prt_acc24
      00862A 85               [ 2]  329 	popw x 
      00862B 0A 0B            [ 1]  330 	dec (PSIZE,sp)
      00862D 26 EB            [ 1]  331 	jrne 1$ 
      00862F A6 08            [ 1]  332 	ld a,#8 
      008631 CB 00 1B         [ 1]  333 	add a,farptr+2 
      008634 C7 00 1B         [ 1]  334 	ld farptr+2,a
      008637 4F               [ 1]  335 	clr a 
      008638 C9 00 1A         [ 1]  336 	adc a,farptr+1 
      00863B C7 00 1A         [ 1]  337 	ld farptr+1,a 
      00863E 4F               [ 1]  338 	clr a 
      00863F C9 00 19         [ 1]  339 	adc a,farptr 
      008642 C7 00 19         [ 1]  340 	ld farptr,a 
      008645 CC 85 94         [ 2]  341 	jp repl  
                                    342 
      008648 6E 6F 74 20 61 20 63   343 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    344 
                                    345 ;----------------------------
                                    346 ; display farptr address
                                    347 ;----------------------------
      008657                        348 print_farptr:
      008657 C6 00 1B         [ 1]  349 	ld a ,farptr+2 
      00865A C7 00 0F         [ 1]  350 	ld acc8,a 
      00865D CE 00 19         [ 2]  351 	ldw x,farptr 
      008660 CF 00 0D         [ 2]  352 	ldw acc24,x 
      008663 5F               [ 1]  353 	clrw x 
      008664 A6 10            [ 1]  354 	ld a,#16 
      008666 CD 98 78         [ 4]  355 	call prt_acc24
      008669 A6 20            [ 1]  356 	ld a,#SPACE 
      00866B CD 89 5A         [ 4]  357 	call putc 
      00866E CD 89 5A         [ 4]  358 	call putc 
      008671 81               [ 4]  359 	ret
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
      008672                        370 fetchc: ; @C
      008672 92 AF 00 19      [ 5]  371 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008676 5C               [ 1]  372 	incw x
      008677 81               [ 4]  373 	ret
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
      008678                        384 number:
      008678 CD 8F 31         [ 4]  385 	call get_token
      00867B A1 84            [ 1]  386 	cp a,#TK_INTGR
      00867D 27 03            [ 1]  387 	jreq 1$
      00867F CC 96 B5         [ 2]  388 	jp syntax_error
      008682 81               [ 4]  389 1$:	ret
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
      008683                        404 show_row:
      008683 4D               [ 1]  405 	tnz a 
      008684 26 01            [ 1]  406 	jrne 1$
      008686 81               [ 4]  407 	ret 
      008687                        408 1$:	
      008687 89               [ 2]  409 	pushw x  
      008688 88               [ 1]  410 	push a 
      008689 35 04 00 24      [ 1]  411 	mov tab_width,#4 
      00868D CD 98 61         [ 4]  412 	call prt_i16 
      008690 A6 20            [ 1]  413 	ld a,#SPACE  
      008692 CD 89 5A         [ 4]  414 	call putc
      008695                        415 row_loop:
      008695 1E 02            [ 2]  416 	ldw x,(ADR,sp)
      008697 F6               [ 1]  417 	ld a,(x)
      008698 5F               [ 1]  418 	clrw x 
      008699 97               [ 1]  419 	ld xl,a 
      00869A CD 98 61         [ 4]  420 	call prt_i16 
      00869D 1E 02            [ 2]  421 	ldw x,(ADR,sp)
      00869F 5C               [ 1]  422 	incw x 
      0086A0 1F 02            [ 2]  423 	ldw (ADR,sp),x 
      0086A2 0A 01            [ 1]  424 	dec (CNT,sp)
      0086A4 26 EF            [ 1]  425 	jrne row_loop
      000626                        426 	_drop VSIZE  		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0086A6 5B 03            [ 2]    1     addw sp,#VSIZE 
      0086A8 35 04 00 24      [ 1]  427 	mov tab_width,#4
      0086AC A6 0D            [ 1]  428 	ld a,#CR 
      0086AE CD 89 5A         [ 4]  429 	call putc 
      0086B1 81               [ 4]  430 	ret 
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
      0086B2                        443 hex_dump:
      0086B2 88               [ 1]  444 	push a 
      000633                        445 	_vars VSIZE
      0086B3 52 04            [ 2]    1     sub sp,#VSIZE 
      0086B5 C6 00 0B         [ 1]  446 	ld a,base
      0086B8 6B 03            [ 1]  447 	ld (BASE,sp),a 
      0086BA 35 10 00 0B      [ 1]  448 	mov base,#16
      0086BE C6 00 24         [ 1]  449 	ld a,tab_width 
      0086C1 6B 04            [ 1]  450 	ld (TABW,sp),a
      0086C3 A6 0D            [ 1]  451 	ld a,#CR 
      0086C5 CD 89 5A         [ 4]  452 	call putc 
      0086C8 17 01            [ 2]  453 1$: ldw (BCNT,sp),y
      0086CA A6 10            [ 1]  454 	ld a,#16
      0086CC 90 A3 00 10      [ 2]  455 	cpw y,#16
      0086D0 2A 02            [ 1]  456 	jrpl 2$
      0086D2 90 9F            [ 1]  457 	ld a,yl
      0086D4                        458 2$: 	
      0086D4 CD 86 83         [ 4]  459 	call show_row 
      0086D7 16 01            [ 2]  460 	ldw y,(BCNT,sp) 
      0086D9 72 A2 00 10      [ 2]  461 	subw y,#16 
      0086DD 90 A3 00 01      [ 2]  462 	cpw y,#1
      0086E1 2A E5            [ 1]  463 	jrpl 1$
      0086E3 7B 03            [ 1]  464 	ld a,(BASE,sp)
      0086E5 C7 00 0B         [ 1]  465 	ld base,a
      0086E8 7B 04            [ 1]  466 	ld a,(TABW,sp)
      0086EA C7 00 24         [ 1]  467 	ld tab_width,a 
      00066D                        468 	_drop VSIZE
      0086ED 5B 04            [ 2]    1     addw sp,#VSIZE 
      0086EF 84               [ 1]  469 	pop a 
      0086F0 81               [ 4]  470 	ret 
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
      0086F1                         45 unlock_eeprom:
      0086F1 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      0086F6 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      0086FA 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      0086FE 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008702 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008706 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00870B 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      00870C                         62 unlock_flash:
      00870C 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008711 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008715 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008719 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00871D 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008721 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008726 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008727                         76 row_erase:
      008727 88               [ 1]   77 	push a 
      008728 90 89            [ 2]   78 	pushw y 
      00872A 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00872E 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008732 4F               [ 1]   81 	clr a 
      008733 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008735 91 A7 00 19      [ 1]   83 	ldf ([farptr],y),a
      008739 90 5C            [ 1]   84     incw y
      00873B 91 A7 00 19      [ 1]   85 	ldf ([farptr],y),a
      00873F 90 5C            [ 1]   86     incw y
      008741 91 A7 00 19      [ 1]   87 	ldf ([farptr],y),a
      008745 90 5C            [ 1]   88     incw y
      008747 91 A7 00 19      [ 1]   89 	ldf ([farptr],y),a
      00874B 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008750 90 85            [ 2]   91 	popw y 
      008752 84               [ 1]   92 	pop a 
      008753 81               [ 4]   93 	ret
      008754                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      008754                         97 move_erase_to_ram:
      008754 89               [ 2]   98 	pushw x 
      008755 90 89            [ 2]   99 	pushw y 
      008757 AE 87 54         [ 2]  100 	ldw x,#row_erase_end 
      00875A 1D 87 27         [ 2]  101 	subw x,#row_erase
      00875D CF 00 0E         [ 2]  102 	ldw acc16,x 
      008760 AE 16 90         [ 2]  103 	ldw x,#tib 
      008763 90 AE 87 27      [ 2]  104 	ldw y,#row_erase 
      008767 CD 94 01         [ 4]  105 	call move
      00876A 90 85            [ 2]  106 	popw y
      00876C 85               [ 2]  107 	popw x
      00876D 81               [ 4]  108 	ret 
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
      00876E                        123 program_row:
      00876E 88               [ 1]  124 	push a 
      00876F 90 89            [ 2]  125 	pushw y 
      008771 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      008773 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      008777 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00877B 90 5F            [ 1]  130 	clrw y 
      00877D F6               [ 1]  131 1$:	ld a,(x)
      00877E 91 A7 00 19      [ 1]  132 	ldf ([farptr],y),a
      008782 5C               [ 1]  133 	incw x 
      008783 90 5C            [ 1]  134 	incw y 
      008785 0A 01            [ 1]  135 	dec (BCNT,sp)
      008787 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      008789 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00070E                        139 	_drop 1 
      00878E 5B 01            [ 2]    1     addw sp,#1 
      008790 90 85            [ 2]  140 	popw y 
      008792 84               [ 1]  141 	pop a 
      008793 81               [ 4]  142 	ret 
      008794                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      008794                        149 move_prg_to_ram:
      008794 89               [ 2]  150 	pushw x 
      008795 90 89            [ 2]  151 	pushw y 
      008797 AE 87 94         [ 2]  152 	ldw x,#program_row_end 
      00879A 1D 87 6E         [ 2]  153 	subw x,#program_row 
      00879D CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      0087A0 AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
      0087A3 90 AE 87 6E      [ 2]  156 	ldw y,#program_row ; source address 
      0087A7 CD 94 01         [ 4]  157 	call move
      0087AA 90 85            [ 2]  158 	popw y 
      0087AC 85               [ 2]  159 	popw x  
      0087AD 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0087AE                        169 write_buffer:
      0087AE 89               [ 2]  170 	pushw x 
      0087AF 72 5D 00 19      [ 1]  171 	tnz farptr 
      0087B3 26 0D            [ 1]  172 	jrne to_flash 
      0087B5 CE 00 1A         [ 2]  173 	ldw x,farptr+1 
      0087B8 A3 B6 00         [ 2]  174 	cpw x,#app_space  
      0087BB 24 05            [ 1]  175 	jruge to_flash 
      0087BD                        176 to_eeprom:
      0087BD CD 86 F1         [ 4]  177 	call unlock_eeprom
      0087C0 20 03            [ 2]  178 	jra do_programming
      0087C2                        179 to_flash:
      0087C2 CD 87 0C         [ 4]  180 	call unlock_flash
      0087C5                        181 do_programming:
      0087C5 85               [ 2]  182 	popw x 
      0087C6 CD 16 90         [ 4]  183 	call tib
      0087C9 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0087CD 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0087D1 81               [ 4]  186 	ret 
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
      0087D2                        197 block_erase:
      0087D2 89               [ 2]  198 	pushw x 
      0087D3 C6 00 19         [ 1]  199 	ld a,farptr 
      0087D6 26 14            [ 1]  200 	jrne erase_flash
      0087D8 CE 00 1A         [ 2]  201 	ldw x,farptr+1
      0087DB A3 B6 00         [ 2]  202 	cpw x,#app_space 
      0087DE 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      0087E0 CD 86 F1         [ 4]  205 	call unlock_eeprom 
      0087E3 CD 16 90         [ 4]  206 	call tib 
      0087E6 72 17 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0087EA 20 0A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0087EC                        210 erase_flash:
      0087EC CD 87 0C         [ 4]  211 	call unlock_flash 
      0087EF CD 16 90         [ 4]  212 	call tib 
      0087F2 72 13 50 5F      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0087F6                        214 erase_exit: 
      0087F6 85               [ 2]  215 	popw x 
      0087F7 81               [ 4]  216 	ret 
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
      0087F8                        232 write_byte:
      0087F8 90 89            [ 2]  233 	pushw y
      00077A                        234 	_vars VSIZE
      0087FA 52 02            [ 2]    1     sub sp,#VSIZE 
      0087FC 6B 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      0087FE 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      008800 90 CE 00 1A      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008804 72 5D 00 19      [ 1]  240 	tnz farptr 
      008808 26 14            [ 1]  241 	jrne write_flash
      00880A 90 A3 B6 00      [ 2]  242     cpw y,#app_space 	 
      00880E 24 0E            [ 1]  243     jruge write_flash
      008810 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      008814 25 57            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      008816 90 A3 48 7F      [ 2]  246 	cpw y,#OPTION_END 
      00881A 22 51            [ 1]  247 	jrugt write_exit
      00881C 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      00881E                        250 write_flash:
      00881E CD 87 0C         [ 4]  251 	call unlock_flash 
      008821 9B               [ 1]  252 1$:	sim 
      008822 7B 01            [ 1]  253 	ld a,(BTW,sp)
      008824 92 A7 00 19      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008828 72 05 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00882D 9A               [ 1]  256     rim 
      00882E 72 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008832 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      008834                        260 write_eeprom:
      008834 CD 86 F1         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008837 90 A3 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      00883B 2B 08            [ 1]  264 	jrmi 1$
      00883D 90 A3 48 80      [ 2]  265 	cpw y,#OPTION_END+1
      008841 2A 02            [ 1]  266 	jrpl 1$
      008843 03 02            [ 1]  267 	cpl (OPT,sp)
      008845                        268 1$: 
      008845 0D 02            [ 1]  269     tnz (OPT,sp)
      008847 27 08            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      008849 72 1E 50 5B      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      00884D 72 1F 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008851                        274 2$: 
      008851 7B 01            [ 1]  275     ld a,(BTW,sp)
      008853 92 A7 00 19      [ 4]  276     ldf ([farptr],x),a
      008857 0D 02            [ 1]  277     tnz (OPT,sp)
      008859 27 08            [ 1]  278     jreq 3$
      00885B 5C               [ 1]  279     incw x
      00885C 7B 01            [ 1]  280     ld a,(BTW,sp)
      00885E 43               [ 1]  281     cpl a
      00885F 92 A7 00 19      [ 4]  282     ldf ([farptr],x),a
      008863 72 05 50 5F FB   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008868 72 0D 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      00886D                        285 write_exit:
      00886D 5C               [ 1]  286 	incw x 
      00886E CD 88 CC         [ 4]  287 	call incr_farptr
      0007F1                        288 	_drop VSIZE 
      008871 5B 02            [ 2]    1     addw sp,#VSIZE 
      008873 90 85            [ 2]  289 	popw y
      008875 81               [ 4]  290     ret
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
      008876                        306 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      0007F6                        307 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    308 	; local var 
                           000001   309 	XSAVE=1 
                           000002   310 	VSIZE=2 
      0007F6                        311 write_block::
      008876 88               [ 1]  312 	push a 
      0007F7                        313 	_vars VSIZE
      008877 52 02            [ 2]    1     sub sp,#VSIZE 
      008879 1F 01            [ 2]  314 	ldw (XSAVE,sp),x 
      00887B 1E 06            [ 2]  315 	ldw x,(BSIZE,sp) 
      00887D 27 13            [ 1]  316 	jreq 9$
      00887F 1E 01            [ 2]  317 1$:	ldw x,(XSAVE,sp)
      008881 90 F6            [ 1]  318 	ld a,(y)
      008883 CD 87 F8         [ 4]  319 	call write_byte 
      008886 5C               [ 1]  320 	incw x 
      008887 90 5C            [ 1]  321 	incw y 
      008889 1F 01            [ 2]  322 	ldw (XSAVE,sp),x
      00888B 1E 06            [ 2]  323 	ldw x,(BSIZE,sp)
      00888D 5A               [ 2]  324 	decw x
      00888E 1F 06            [ 2]  325 	ldw (BSIZE,sp),x 
      008890 26 ED            [ 1]  326 	jrne 1$
      008892                        327 9$:
      008892 1E 01            [ 2]  328 	ldw x,(XSAVE,sp)
      008894 CD 88 CC         [ 4]  329 	call incr_farptr
      000817                        330 	_drop VSIZE
      008897 5B 02            [ 2]    1     addw sp,#VSIZE 
      008899 84               [ 1]  331 	pop a 
      00889A 81               [ 4]  332 	ret 
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
      00889B                        349 write_nbytes:
      00889B 90 89            [ 2]  350 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00889D 88               [ 1]  351 	push a 
      00889E 90 93            [ 1]  352 	ldw y,x
      0088A0 5F               [ 1]  353 	clrw x 
      0088A1                        354 1$:  
      0088A1 90 F6            [ 1]  355 	ld a,(y)
      0088A3 90 5C            [ 1]  356 	incw y
      0088A5 CD 87 F8         [ 4]  357 	call write_byte 
      0088A8 5C               [ 1]  358 	incw x 
      0088A9 0A 01            [ 1]  359 	dec (1,sp)  
      0088AB 26 F4            [ 1]  360 	jrne 1$ 
      0088AD 84               [ 1]  361 9$: pop a 
      0088AE 90 85            [ 2]  362 	popw y 
      0088B0 81               [ 4]  363 	ret 
                                    364 
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 ;;;  flash memory operations
                                    367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    368 
                                    369 ;--------------------------
                                    370 ; align farptr to BLOCK_SIZE 
                                    371 ;---------------------------
      0088B1                        372 row_align:
      0088B1 A6 7F            [ 1]  373 	ld a,#0x7f 
      0088B3 C4 00 1B         [ 1]  374 	and a,farptr+2 
      0088B6 27 13            [ 1]  375 	jreq 1$ 
      0088B8 CE 00 1A         [ 2]  376 	ldw x,farptr+1 
      0088BB 1C 00 80         [ 2]  377 	addw x,#BLOCK_SIZE 
      0088BE 24 04            [ 1]  378 	jrnc 0$
      0088C0 72 5C 00 19      [ 1]  379 	inc farptr 
      0088C4 9F               [ 1]  380 0$: ld a,xl 
      0088C5 A4 80            [ 1]  381 	and a,#0x80
      0088C7 97               [ 1]  382 	ld xl,a
      0088C8 CF 00 1A         [ 2]  383 	ldw farptr+1,x  	
      0088CB 81               [ 4]  384 1$:	ret
                                    385 
                                    386 ;--------------------
                                    387 ; input:
                                    388 ;   X     increment 
                                    389 ; output:
                                    390 ;   farptr  incremented 
                                    391 ;---------------------
      0088CC                        392 incr_farptr:
      0088CC 72 BB 00 1A      [ 2]  393 	addw x,farptr+1 
      0088D0 24 04            [ 1]  394 	jrnc 1$
      0088D2 72 5C 00 19      [ 1]  395 	inc farptr 
      0088D6 CF 00 1A         [ 2]  396 1$:	ldw farptr+1,x  
      0088D9 81               [ 4]  397 	ret 
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
      0088DA                        407 scan_block:
      0088DA 5F               [ 1]  408 	clrw x 
      0088DB 92 AF 00 19      [ 5]  409 1$: ldf a,([farptr],x) 
      0088DF 26 06            [ 1]  410 	jrne 2$
      0088E1 5C               [ 1]  411 	incw x 
      0088E2 A3 00 80         [ 2]  412 	cpw x,#BLOCK_SIZE 
      0088E5 25 F4            [ 1]  413 	jrult 1$ 
      0088E7 81               [ 4]  414 2$:	ret 
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
      0088E8                         66 Uart1RxHandler: ; console receive char 
      0088E8 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0088ED C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0088F0 A1 03            [ 1]   69 	cp a,#CTRL_C 
      0088F2 26 06            [ 1]   70 	jrne 2$
      0088F4 CD 89 5A         [ 4]   71 	call putc 
      0088F7 CC 80 C9         [ 2]   72 	jp user_interrupted
      0088FA                         73 2$:
      0088FA A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0088FC 26 03            [ 1]   75 	jrne 3$
      0088FE CC 81 35         [ 2]   76 	jp cold_start 	
      008901 88               [ 1]   77 3$:	push a 
      008902 A6 27            [ 1]   78 	ld a,#rx1_queue 
      008904 CB 00 30         [ 1]   79 	add a,rx1_tail 
      008907 5F               [ 1]   80 	clrw x 
      008908 97               [ 1]   81 	ld xl,a 
      008909 84               [ 1]   82 	pop a 
      00890A F7               [ 1]   83 	ld (x),a 
      00890B C6 00 30         [ 1]   84 	ld a,rx1_tail 
      00890E 4C               [ 1]   85 	inc a 
      00890F A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008911 C7 00 30         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      008914 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008915                         97 uart1_init:
      008915 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008919 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      00891D 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008921 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008925                        103 uart1_set_baud: 
      008925 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008926 A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      008928 C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      00892B 27 0A            [ 1]  109 	jreq 2$ 
      00892D                        110 1$: ; 8 Mhz 	
      00892D 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008931 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008935 20 08            [ 2]  113 	jra 3$
      008937                        114 2$: ; 16 Mhz 	
      008937 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00893B 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      00893F                        117 3$:
      00893F 72 5F 52 31      [ 1]  118     clr UART1_DR
      008943 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008947 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00894B 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008950 72 5F 00 2F      [ 1]  122     clr rx1_head 
      008954 72 5F 00 30      [ 1]  123 	clr rx1_tail
      008958 84               [ 1]  124 	pop a  
      008959 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      00895A                        133 putc:: ; console output always on UART1
      00895A                        134 uart1_putc:: 
      00895A 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      00895F C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008962 81               [ 4]  137 	ret 
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
      008963                        148 qgetc::
      008963                        149 uart1_qgetc::
      008963 C6 00 2F         [ 1]  150 	ld a,rx1_head 
      008966 C0 00 30         [ 1]  151 	sub a,rx1_tail 
      008969 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      00896A                        161 getc:: ;console input
      00896A                        162 uart1_getc::
      00896A CD 89 63         [ 4]  163 	call uart1_qgetc
      00896D 27 FB            [ 1]  164 	jreq uart1_getc 
      00896F 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008970 A6 27            [ 1]  167 	ld a,#rx1_queue
      008972 CB 00 2F         [ 1]  168 	add a,rx1_head 
      008975 5F               [ 1]  169 	clrw x  
      008976 97               [ 1]  170 	ld xl,a 
      008977 F6               [ 1]  171 	ld a,(x)
      008978 88               [ 1]  172 	push a
      008979 C6 00 2F         [ 1]  173 	ld a,rx1_head 
      00897C 4C               [ 1]  174 	inc a 
      00897D A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      00897F C7 00 2F         [ 1]  176 	ld rx1_head,a 
      008982 84               [ 1]  177 	pop a  
      008983 85               [ 2]  178 	popw x
      008984 81               [ 4]  179 	ret 
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
      008985 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      008991                        207 get_escape:
      008991 CD 89 6A         [ 4]  208     call getc 
      008994 A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      008996 27 02            [ 1]  210     jreq 1$
      008998 4F               [ 1]  211     clr a
      008999 81               [ 4]  212     ret
      00899A CD 89 6A         [ 4]  213 1$: call getc 
      00899D AE 89 85         [ 2]  214     ldw x,#convert_table
      0089A0                        215 2$:
      0089A0 F1               [ 1]  216     cp a,(x)
      0089A1 27 08            [ 1]  217     jreq 4$
      0089A3 1C 00 02         [ 2]  218     addw x,#2
      0089A6 7D               [ 1]  219     tnz (x)
      0089A7 26 F7            [ 1]  220     jrne 2$
      0089A9 4F               [ 1]  221     clr a
      0089AA 81               [ 4]  222     ret 
      0089AB 5C               [ 1]  223 4$: incw x 
      0089AC F6               [ 1]  224     ld a,(x)
      0089AD A1 84            [ 1]  225     cp a,#SUP
      0089AF 26 05            [ 1]  226     jrne 5$
      0089B1 88               [ 1]  227     push a 
      0089B2 CD 89 6A         [ 4]  228     call getc
      0089B5 84               [ 1]  229     pop a 
      0089B6                        230 5$:
      0089B6 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089B7                        241 puts::
      0089B7 F6               [ 1]  242     ld a,(x)
      0089B8 27 06            [ 1]  243 	jreq 1$
      0089BA CD 89 5A         [ 4]  244 	call putc 
      0089BD 5C               [ 1]  245 	incw x 
      0089BE 20 F7            [ 2]  246 	jra puts 
      0089C0 81               [ 4]  247 1$:	ret 
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
      0089C1                        258 bksp:
      0089C1 A6 08            [ 1]  259 	ld a,#BS 
      0089C3 CD 89 5A         [ 4]  260 	call putc 
      0089C6 A6 20            [ 1]  261 	ld a,#SPACE 
      0089C8 CD 89 5A         [ 4]  262 	call putc 
      0089CB A6 08            [ 1]  263 	ld a,#BS 
      0089CD CD 89 5A         [ 4]  264 	call putc 
      0089D0 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0089D1                        274 delete_nchar:
      0089D1 88               [ 1]  275 	push a 
      0089D2 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0089D4 27 07            [ 1]  277 	jreq 1$
      0089D6 CD 89 C1         [ 4]  278 	call bksp 
      0089D9 0A 01            [ 1]  279 	dec (1,sp)
      0089DB 20 F5            [ 2]  280 	jra 0$
      0089DD 84               [ 1]  281 1$:	pop a 
      0089DE 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0089DF                        290 send_escape:
      0089DF A6 1B            [ 1]  291 	ld a,#ESC 
      0089E1 CD 89 5A         [ 4]  292 	call putc 
      0089E4 A6 5B            [ 1]  293 	ld a,#'[
      0089E6 CD 89 5A         [ 4]  294 	call putc 
      0089E9 81               [ 4]  295 	ret 
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
      0089EA                        311 send_parameter:
      0089EA 89               [ 2]  312 	pushw x 
      0089EB 5F               [ 1]  313 	clrw x 
      0089EC 97               [ 1]  314 	ld xl,a 
      0089ED A6 0A            [ 1]  315 	ld a,#10 
      0089EF 62               [ 2]  316 	div x,a 
      0089F0 95               [ 1]  317 	ld xh,a 
      0089F1 9F               [ 1]  318 	ld a,xl
      0089F2 4D               [ 1]  319     tnz a 
      0089F3 27 0B            [ 1]  320     jreq 2$
      0089F5 A1 09            [ 1]  321 	cp a,#9 
      0089F7 23 02            [ 2]  322 	jrule 1$
      0089F9 A6 09            [ 1]  323 	ld a,#9
      0089FB                        324 1$:
      0089FB AB 30            [ 1]  325 	add a,#'0 
      0089FD CD 89 5A         [ 4]  326 	call putc
      008A00 9E               [ 1]  327 2$:	ld a,xh 
      008A01 AB 30            [ 1]  328 	add a,#'0
      008A03 CD 89 5A         [ 4]  329 	call putc 
      008A06 85               [ 2]  330 	popw x 
      008A07 81               [ 4]  331 	ret 
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
      008A08                        344 move_left:
      008A08 88               [ 1]  345 	push a 
      008A09 CD 89 DF         [ 4]  346 	call send_escape
      008A0C 84               [ 1]  347     pop a
      008A0D CD 89 EA         [ 4]  348 	call send_parameter 
      008A10 A6 44            [ 1]  349 	ld a,#'D 
      008A12 CD 89 5A         [ 4]  350 	call putc 
      008A15 81               [ 4]  351 	ret	
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



      008A16                        362 move_right:
      008A16 88               [ 1]  363 	push a 
      008A17 CD 89 DF         [ 4]  364 	call send_escape
      008A1A 84               [ 1]  365     pop a
      008A1B CD 89 EA         [ 4]  366 	call send_parameter 
      008A1E A6 43            [ 1]  367 	ld a,#'C 
      008A20 CD 89 5A         [ 4]  368 	call putc 
      008A23 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A24                        379 spaces::
      008A24 A6 20            [ 1]  380 	ld a,#SPACE 
      008A26 5D               [ 2]  381 1$:	tnzw x
      008A27 27 06            [ 1]  382 	jreq 9$
      008A29 CD 89 5A         [ 4]  383 	call putc 
      008A2C 5A               [ 2]  384 	decw x
      008A2D 20 F7            [ 2]  385 	jra 1$
      008A2F                        386 9$: 
      008A2F 81               [ 4]  387 	ret 
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
      008A30                        405 insert_char: 
      0009B0                        406 	_vars VSIZE 
      008A30 52 03            [ 2]    1     sub sp,#VSIZE 
      008A32 6B 02            [ 1]  407     ld (KCHAR,sp),a 
      008A34 9E               [ 1]  408     ld a,xh 
      008A35 6B 01            [ 1]  409 	ld (IPOS,sp),a
      008A37 9F               [ 1]  410     ld a,xl 
      008A38 6B 03            [ 1]  411     ld (LLEN,sp),a  
      008A3A 93               [ 1]  412     ldw x,y
      008A3B 5C               [ 1]  413     incw x 
      008A3C 7B 03            [ 1]  414     ld a,(LLEN,sp)
      008A3E 10 01            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      008A40 4C               [ 1]  416     inc a 
      008A41 C7 00 0F         [ 1]  417     ld acc8,a 
      008A44 72 5F 00 0E      [ 1]  418     clr acc16
      008A48 CD 94 01         [ 4]  419     call move
      008A4B 90 AE 16 90      [ 2]  420     ldw y,#tib 
      008A4F 7B 01            [ 1]  421     ld a,(IPOS,sp)
      008A51 C7 00 0F         [ 1]  422     ld acc8,a 
      008A54 72 B9 00 0E      [ 2]  423     addw y,acc16 
      008A58 7B 02            [ 1]  424     ld a,(KCHAR,sp)
      008A5A 90 F7            [ 1]  425     ld (y),a
      008A5C 90 5C            [ 1]  426     incw y  
      008A5E 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008A60 CD 8A 08         [ 4]  428     call move_left
      008A63 AE 16 90         [ 2]  429     ldw x,#tib 
      008A66 CD 89 B7         [ 4]  430     call puts 
      008A69 7B 03            [ 1]  431     ld a,(LLEN,sp)
      008A6B 10 01            [ 1]  432     sub a,(IPOS,sp) 
      008A6D CD 8A 08         [ 4]  433     call move_left 
      0009F0                        434 	_drop VSIZE 
      008A70 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A72 81               [ 4]  435 	ret 
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
      008A73                        448 delete_under:
      0009F3                        449 	_vars VSIZE 
      008A73 52 02            [ 2]    1     sub sp,#VSIZE 
      008A75 6B 02            [ 1]  450     ld (LLEN,sp),a 
      008A77 9F               [ 1]  451     ld a,xl 
      008A78 6B 01            [ 1]  452     ld (CPOS,sp),a 
      008A7A 93               [ 1]  453     ldw x,y ; move destination
      008A7B 90 5C            [ 1]  454     incw y  ; move source 
      008A7D 7B 02            [ 1]  455     ld a,(LLEN,sp)
      008A7F 10 01            [ 1]  456     sub a,(CPOS,sp)
      008A81 4C               [ 1]  457     inc a ; move including zero at end.
      008A82 C7 00 0F         [ 1]  458     ld acc8,a 
      008A85 72 5F 00 0E      [ 1]  459     clr acc16 
      008A89 CD 94 01         [ 4]  460 	call move 
      008A8C 90 AE 16 90      [ 2]  461     ldw y,#tib 
      008A90 7B 01            [ 1]  462     ld a,(CPOS,sp)
      008A92 C7 00 0F         [ 1]  463     ld acc8,a 
      008A95 72 B9 00 0E      [ 2]  464     addw y,acc16 
      008A99 93               [ 1]  465     ldw x,y 
      008A9A CD 89 B7         [ 4]  466     call puts 
      008A9D A6 20            [ 1]  467     ld a,#SPACE  
      008A9F CD 89 5A         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008AA2 7B 02            [ 1]  469     ld a,(LLEN,sp)
      008AA4 10 01            [ 1]  470     sub a,(CPOS,sp)
      008AA6 CD 8A 08         [ 4]  471     call move_left 
      008AA9 0A 02            [ 1]  472     dec (LLEN,sp)
      000A2B                        473 	_drop VSIZE 
      008AAB 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AAD 81               [ 4]  474 	ret 
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
      008AAE                        486 delete_line:
      008AAE CD 89 DF         [ 4]  487     call send_escape
      008AB1 A6 32            [ 1]  488 	ld a,#'2
      008AB3 CD 89 5A         [ 4]  489 	call putc 
      008AB6 A6 4B            [ 1]  490 	ld a,#'K 
      008AB8 CD 89 5A         [ 4]  491 	call putc 
      008ABB 81               [ 4]  492 	ret 
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
      008ABC                        524 readln::
      008ABC 90 89            [ 2]  525 	pushw y 
      000A3E                        526 	_vars VSIZE 
      008ABE 52 04            [ 2]    1     sub sp,#VSIZE 
      008AC0 5F               [ 1]  527 	clrw x 
      008AC1 1F 02            [ 2]  528 	ldw (LL,sp),x 
      008AC3 1F 03            [ 2]  529 	ldw (CPOS,sp),x 
      008AC5 03 04            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008AC7 90 AE 16 90      [ 2]  531  	ldw y,#tib ; terminal input buffer
      008ACB                        532 readln_loop:
      008ACB CD 89 6A         [ 4]  533 	call getc
      008ACE 6B 01            [ 1]  534 	ld (RXCHAR,sp),a
      008AD0 A1 1B            [ 1]  535     cp a,#ESC 
      008AD2 26 05            [ 1]  536     jrne 0$
      008AD4 CD 89 91         [ 4]  537     call get_escape 
      008AD7 6B 01            [ 1]  538     ld (RXCHAR,sp),a 
      008AD9 A1 0D            [ 1]  539 0$:	cp a,#CR
      008ADB 26 03            [ 1]  540 	jrne 1$
      008ADD CC 8C 58         [ 2]  541 	jp readln_quit
      008AE0 A1 0A            [ 1]  542 1$:	cp a,#LF 
      008AE2 26 03            [ 1]  543 	jrne 2$ 
      008AE4 CC 8C 58         [ 2]  544 	jp readln_quit
      008AE7                        545 2$:
      008AE7 A1 08            [ 1]  546 	cp a,#BS
      008AE9 26 12            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      008AEB 0D 03            [ 1]  549     tnz (CPOS,sp)
      008AED 27 DC            [ 1]  550     jreq readln_loop 
      008AEF A6 01            [ 1]  551     ld a,#1 
      008AF1 CD 8A 08         [ 4]  552     call move_left
      008AF4 0A 03            [ 1]  553     dec (CPOS,sp)
      008AF6 90 5A            [ 2]  554     decw y 
      008AF8 7B 03            [ 1]  555     ld a,(CPOS,sp) 
      008AFA CC 8C 04         [ 2]  556     jp 12$
      008AFD                        557 3$:
      008AFD A1 04            [ 1]  558 	cp a,#CTRL_D
      008AFF 26 1A            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      008B01 CD 8A AE         [ 4]  561 	call delete_line 
      008B04 7B 03            [ 1]  562     ld a,(CPOS,sp)
      008B06 4C               [ 1]  563     inc a 
      008B07 CD 8A 08         [ 4]  564     call move_left 
      008B0A A6 3E            [ 1]  565 	ld a,#'> 
      008B0C CD 89 5A         [ 4]  566 	call putc 
      008B0F 90 AE 16 90      [ 2]  567 	ldw y,#tib
      008B13 90 7F            [ 1]  568 	clr (y)
      008B15 0F 02            [ 1]  569 	clr (LL,sp)
      008B17 0F 03            [ 1]  570 	clr (CPOS,sp)
      008B19 20 B0            [ 2]  571 	jra readln_loop
      008B1B                        572 4$:
      008B1B A1 12            [ 1]  573 	cp a,#CTRL_R 
      008B1D 26 1E            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      008B1F 0D 02            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008B21 26 A8            [ 1]  577 	jrne readln_loop
      008B23 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008B27 93               [ 1]  579 	ldw x,y
      008B28 CD 93 D5         [ 4]  580 	call strlen
      008B2B 4D               [ 1]  581 	tnz a  
      008B2C 27 9D            [ 1]  582 	jreq readln_loop
      008B2E 6B 02            [ 1]  583 	ld (LL,sp),a 
      008B30 6B 03            [ 1]  584     ld (CPOS,sp),a
      008B32 93               [ 1]  585 	ldw x,y  
      008B33 CD 89 B7         [ 4]  586 	call puts
      008B36 0F 01            [ 1]  587 	clr (LL_HB,sp)
      008B38 72 F9 01         [ 2]  588 	addw y,(LL_HB,sp)
      008B3B 20 8E            [ 2]  589 	jra readln_loop 
      008B3D                        590 5$:
      008B3D A1 05            [ 1]  591 	cp a,#CTRL_E 
      008B3F 26 41            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008B41 AE 16 90         [ 2]  594 	ldw x,#tib 
      008B44 CD 99 03         [ 4]  595 	call atoi24
      008B47 CE 00 0E         [ 2]  596 	ldw x,acc16
      008B4A CD 8C 94         [ 4]  597 	call search_lineno
      008B4D 5D               [ 2]  598 	tnzw x 
      008B4E 26 03            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008B50 CC 8C 58         [ 2]  603 	jp readln_quit  
      008B53                        604 51$:
      008B53 CF 00 05         [ 2]  605 	ldw basicptr,x
      008B56 E6 02            [ 1]  606 	ld a,(2,x)
      008B58 C7 00 04         [ 1]  607 	ld count,a 
      008B5B 90 AE 16 90      [ 2]  608 	ldw y,#tib 
      008B5F CD 91 F1         [ 4]  609 	call decompile 
      008B62 0F 01            [ 1]  610 	clr (LL_HB,sp)
      008B64 A6 0D            [ 1]  611 	ld a,#CR 
      008B66 CD 89 5A         [ 4]  612 	call putc 
      008B69 A6 3E            [ 1]  613 	ld a,#'>
      008B6B CD 89 5A         [ 4]  614 	call putc
      008B6E AE 16 90         [ 2]  615     ldw x,#tib  
      008B71 CD 93 D5         [ 4]  616 	call strlen 
      008B74 6B 02            [ 1]  617 	ld (LL,sp),a 
      008B76 CD 89 B7         [ 4]  618 	call puts 
      008B79 90 93            [ 1]  619 	ldw y,x
      008B7B 7B 02            [ 1]  620     ld a,(LL,sp)
      008B7D 6B 03            [ 1]  621     ld (CPOS,sp),a  
      008B7F CC 8A CB         [ 2]  622 	jp readln_loop
      008B82                        623 6$:
      008B82 A1 81            [ 1]  624 	cp a,#ARROW_RIGHT
      008B84 26 15            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008B86 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008B88 11 02            [ 1]  628     cp a,(LL,sp)
      008B8A 2B 03            [ 1]  629     jrmi 61$
      008B8C CC 8A CB         [ 2]  630     jp readln_loop 
      008B8F                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B8F A6 01            [ 1]  632     ld a,#1 
      008B91 CD 8A 16         [ 4]  633 	call move_right 
      008B94 0C 03            [ 1]  634 	inc (CPOS,sp)
      008B96 90 5C            [ 1]  635     incw y 
      008B98 CC 8A CB         [ 2]  636     jp readln_loop 
      008B9B A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008B9D 26 13            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008B9F 0D 03            [ 1]  640 	tnz (CPOS,sp)
      008BA1 26 03            [ 1]  641 	jrne 71$
      008BA3 CC 8A CB         [ 2]  642 	jp readln_loop
      008BA6                        643 71$:
      008BA6 A6 01            [ 1]  644     ld a,#1 
      008BA8 CD 8A 08         [ 4]  645 	call move_left 
      008BAB 0A 03            [ 1]  646 	dec (CPOS,sp)
      008BAD 90 5A            [ 2]  647     decw y 
      008BAF CC 8A CB         [ 2]  648 	jp readln_loop 
      008BB2 A1 82            [ 1]  649 8$: cp a,#HOME  
      008BB4 26 0E            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008BB6 7B 03            [ 1]  652     ld a,(CPOS,sp)
      008BB8 CD 8A 08         [ 4]  653     call move_left 
      008BBB 0F 03            [ 1]  654 	clr (CPOS,sp)
      008BBD 90 AE 16 90      [ 2]  655     ldw y,#tib 
      008BC1 CC 8A CB         [ 2]  656 	jp readln_loop  
      008BC4 A1 83            [ 1]  657 9$: cp a,#KEY_END  
      008BC6 26 26            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008BC8 7B 03            [ 1]  660 	ld a,(CPOS,sp)
      008BCA 11 02            [ 1]  661 	cp a,(LL,sp)
      008BCC 26 03            [ 1]  662 	jrne 91$
      008BCE CC 8A CB         [ 2]  663 	jp readln_loop 
      008BD1                        664 91$:
      008BD1 7B 02            [ 1]  665 	ld a,(LL,sp)
      008BD3 10 03            [ 1]  666 	sub a,(CPOS,sp)
      008BD5 CD 8A 16         [ 4]  667 	call move_right 
      008BD8 7B 02            [ 1]  668 	ld a,(LL,sp)
      008BDA 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008BDC 90 AE 16 90      [ 2]  670     ldw y,#tib
      008BE0 72 5F 00 0E      [ 1]  671     clr acc16 
      008BE4 C7 00 0F         [ 1]  672     ld acc8,a 
      008BE7 72 B9 00 0E      [ 2]  673     addw y,acc16  
      008BEB CC 8A CB         [ 2]  674 	jp readln_loop 
      008BEE A1 0F            [ 1]  675 10$: cp a,#CTRL_O
      008BF0 26 08            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008BF2 03 04            [ 1]  678 	cpl (OVRWR,sp)
      008BF4 CD A5 9A         [ 4]  679 	call beep_1khz
      008BF7 CC 8A CB         [ 2]  680 	jp readln_loop 
      008BFA A1 84            [ 1]  681 11$: cp a,#SUP 
      008BFC 26 11            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008BFE 7B 03            [ 1]  684     ld a,(CPOS,sp)
      008C00 11 02            [ 1]  685     cp a,(LL,sp)
      008C02 2A 08            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008C04                        687 12$:
      008C04 97               [ 1]  688     ld xl,a    ; cursor position 
      008C05 7B 02            [ 1]  689     ld a,(LL,sp)  ; line length
      008C07 CD 8A 73         [ 4]  690     call delete_under
      008C0A 0A 02            [ 1]  691     dec (LLEN,sp)
      008C0C                        692 13$:
      008C0C CC 8A CB         [ 2]  693     jp readln_loop 
      008C0F                        694 final_test:
      008C0F A1 20            [ 1]  695 	cp a,#SPACE
      008C11 2A 03            [ 1]  696 	jrpl accept_char
      008C13 CC 8A CB         [ 2]  697 	jp readln_loop
      008C16                        698 accept_char:
      008C16 A6 4F            [ 1]  699 	ld a,#TIB_SIZE-1
      008C18 11 02            [ 1]  700 	cp a, (LL,sp)
      008C1A 2A 03            [ 1]  701 	jrpl 1$
      008C1C CC 8A CB         [ 2]  702 	jp readln_loop
      008C1F 0D 04            [ 1]  703 1$:	tnz (OVRWR,sp)
      008C21 26 18            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008C23 7B 03            [ 1]  706     ld a,(CPOS,sp)
      008C25 11 02            [ 1]  707     cp a,(LL,sp)
      008C27 27 12            [ 1]  708     jreq overwrite
      008C29 7B 02            [ 1]  709     ld a,(LL,sp)
      008C2B 97               [ 1]  710     ld xl,a 
      008C2C 7B 03            [ 1]  711     ld a,(CPOS,sp)
      008C2E 95               [ 1]  712     ld xh,a
      008C2F 7B 01            [ 1]  713     ld a,(RXCHAR,sp)
      008C31 CD 8A 30         [ 4]  714     call insert_char
      008C34 0C 02            [ 1]  715     inc (LLEN,sp)
      008C36 0C 03            [ 1]  716     inc (CPOS,sp)	
      008C38 CC 8A CB         [ 2]  717     jp readln_loop 
      008C3B                        718 overwrite:
      008C3B 7B 01            [ 1]  719 	ld a,(RXCHAR,sp)
      008C3D 90 F7            [ 1]  720 	ld (y),a
      008C3F 90 5C            [ 1]  721     incw y
      008C41 CD 89 5A         [ 4]  722     call putc 
      008C44 7B 03            [ 1]  723 	ld a,(CPOS,sp)
      008C46 11 02            [ 1]  724 	cp a,(LL,sp)
      008C48 2B 09            [ 1]  725 	jrmi 1$
      008C4A 90 7F            [ 1]  726 	clr (y)
      008C4C 0C 02            [ 1]  727 	inc (LL,sp)
      008C4E 0C 03            [ 1]  728     inc (CPOS,sp)
      008C50 CC 8A CB         [ 2]  729 	jp readln_loop 
      008C53                        730 1$:	
      008C53 0C 03            [ 1]  731 	inc (CPOS,sp)
      008C55 CC 8A CB         [ 2]  732 	jp readln_loop 
      008C58                        733 readln_quit:
      008C58 90 AE 16 90      [ 2]  734 	ldw y,#tib
      008C5C 0F 01            [ 1]  735     clr (LL_HB,sp) 
      008C5E 72 F9 01         [ 2]  736     addw y,(LL_HB,sp)
      008C61 90 7F            [ 1]  737     clr (y)
      008C63 7B 02            [ 1]  738 	ld a,(LL,sp)
      008C65 C7 00 04         [ 1]  739 	ld count,a 
      008C68 A6 0D            [ 1]  740 	ld a,#CR
      008C6A CD 89 5A         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      000BED                        742 	_drop VSIZE 
      008C6D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C6F 90 85            [ 2]  743 	popw y 
      008C71 81               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      008C72                        752 print_hex::
      008C72 88               [ 1]  753 	push a 
      008C73 4E               [ 1]  754 	swap a 
      008C74 CD 8C 89         [ 4]  755 	call to_hex_char 
      008C77 CD 89 5A         [ 4]  756 	call putc 
      008C7A 7B 01            [ 1]  757     ld a,(1,sp) 
      008C7C CD 8C 89         [ 4]  758 	call to_hex_char
      008C7F CD 89 5A         [ 4]  759 	call putc
      008C82 A6 20            [ 1]  760 	ld a,#SPACE 
      008C84 CD 89 5A         [ 4]  761 	call putc 
      008C87 84               [ 1]  762 	pop a 
      008C88 81               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008C89                        772 to_hex_char::
      008C89 A4 0F            [ 1]  773 	and a,#15 
      008C8B A1 09            [ 1]  774 	cp a,#9 
      008C8D 23 02            [ 2]  775 	jrule 1$ 
      008C8F AB 07            [ 1]  776 	add a,#7
      008C91 AB 30            [ 1]  777 1$: add a,#'0 
      008C93 81               [ 4]  778 	ret 
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
      008C94                         51 search_lineno::
      000C14                         52 	_vars VSIZE
      008C94 52 02            [ 2]    1     sub sp,#VSIZE 
      008C96 0F 01            [ 1]   53 	clr (LL,sp)
      008C98 90 CE 00 1C      [ 2]   54 	ldw y,txtbgn
      008C9C 4D               [ 1]   55 	tnz a 
      008C9D 27 04            [ 1]   56 	jreq search_ln_loop
      008C9F 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008CA3                         58 search_ln_loop:
      008CA3 90 C3 00 1E      [ 2]   59 	cpw y,txtend 
      008CA7 2A 10            [ 1]   60 	jrpl 8$
      008CA9 90 F3            [ 1]   61 	cpw x,(y)
      008CAB 27 0E            [ 1]   62 	jreq 9$
      008CAD 2B 0A            [ 1]   63 	jrmi 8$ 
      008CAF 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CB2 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CB4 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008CB7 20 EA            [ 2]   67 	jra search_ln_loop 
      008CB9                         68 8$: 
      008CB9 5F               [ 1]   69 	clrw x 	
      008CBA 51               [ 1]   70 	exgw x,y 
      000C3B                         71 9$: _drop VSIZE
      008CBB 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CBD 51               [ 1]   72 	exgw x,y   
      008CBE 81               [ 4]   73 	ret 
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
      008CBF                         83 del_line: 
      000C3F                         84 	_vars VSIZE 
      008CBF 52 04            [ 2]    1     sub sp,#VSIZE 
      008CC1 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008CC3 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008CC5 0F 01            [ 1]   87 	clr (LLEN,sp)
      008CC7 90 93            [ 1]   88 	ldw y,x  
      008CC9 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008CCC 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008CCE 90 CE 00 1E      [ 2]   91 	ldw y,txtend 
      008CD2 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008CD5 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008CD9 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008CDB CD 94 01         [ 4]   95 	call move
      008CDE 90 CE 00 1E      [ 2]   96 	ldw y,txtend 
      008CE2 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008CE5 90 CF 00 1E      [ 2]   98 	ldw txtend,y  
      000C69                         99 	_drop VSIZE     
      008CE9 5B 04            [ 2]    1     addw sp,#VSIZE 
      008CEB 81               [ 4]  100 	ret 
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
      008CEC                        115 create_gap:
      000C6C                        116 	_vars VSIZE
      008CEC 52 06            [ 2]    1     sub sp,#VSIZE 
      008CEE 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008CF0 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008CF2 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008CF6 90 93            [ 1]  120 	ldw y,x ; SRC
      008CF8 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008CFC 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008CFE CE 00 1E         [ 2]  124 	ldw x,txtend 
      008D01 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008D04 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D07 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D09 CD 94 01         [ 4]  128 	call move
      008D0C CE 00 1E         [ 2]  129 	ldw x,txtend
      008D0F 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D12 CF 00 1E         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      000C95                        132 9$:	_drop VSIZE 
      008D15 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D17 81               [ 4]  133 	ret 
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
      008D18                        150 insert_line:
      000C98                        151 	_vars VSIZE 
      008D18 52 08            [ 2]    1     sub sp,#VSIZE 
      008D1A CE 00 1E         [ 2]  152 	ldw x,txtend  
      008D1D C3 00 1C         [ 2]  153 	cpw x,txtbgn 
      008D20 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D22 AE 00 02         [ 2]  156 	ldw x,#2 
      008D25 72 D6 00 1A      [ 4]  157 	ld a,([ptr16],x)
      008D29 A1 03            [ 1]  158 	cp a,#3
      008D2B 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D2D 5F               [ 1]  160 	clrw x 
      008D2E 97               [ 1]  161 	ld xl,a
      008D2F 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D31 CE 00 1C         [ 2]  163 	ldw x,txtbgn
      008D34 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D36 CE 00 1E         [ 2]  165 	ldw x,txtend 
      008D39 20 38            [ 2]  166 	jra 4$
      008D3B 72 CE 00 1A      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D3F 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D41 AE 00 02         [ 2]  170 	ldw x,#2 
      008D44 72 D6 00 1A      [ 4]  171 	ld a,([ptr16],x)
      008D48 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D49 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D4B 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D4D 4F               [ 1]  177 	clr a 
      008D4E CD 8C 94         [ 4]  178 	call search_lineno 
      008D51 5D               [ 2]  179 	tnzw x 
      008D52 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D54 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D56 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008D58 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008D5A CD 8C BF         [ 4]  188 	call del_line
      008D5D                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008D5D A6 03            [ 1]  192 	ld a,#3
      008D5F 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008D61 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008D63 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008D65 C3 00 1E         [ 2]  198 	cpw x,txtend 
      008D68 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008D6A 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008D6C 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008D6E CD 8C EC         [ 4]  204 	call create_gap
      008D71 20 06            [ 2]  205 	jra 5$
      008D73                        206 4$: 
      008D73 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008D76 CF 00 1E         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008D79 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008D7B CF 00 0E         [ 2]  211 	ldw acc16,x 
      008D7E 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      008D82 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008D84 CD 94 01         [ 4]  214 	call move 
      008D87                        215 insert_ln_exit:	
      000D07                        216 	_drop VSIZE
      008D87 5B 08            [ 2]    1     addw sp,#VSIZE 
      008D89 81               [ 4]  217 	ret
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
      008D8A                        233 parse_quote: 
      000D0A                        234 	_vars VSIZE 
      008D8A 52 02            [ 2]    1     sub sp,#VSIZE 
      008D8C 4F               [ 1]  235 	clr a
      008D8D 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008D8F                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008D8F 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008D92 27 24            [ 1]  239 	jreq 6$
      008D94 72 5C 00 02      [ 1]  240 	inc in 
      008D98 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008D9A A6 5C            [ 1]  242 	ld a,#'\
      008D9C 11 01            [ 1]  243 	cp a, (PREV,sp)
      008D9E 26 0A            [ 1]  244 	jrne 3$
      008DA0 0F 01            [ 1]  245 	clr (PREV,sp)
      008DA2 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008DA4 AD 1C            [ 4]  247 	callr convert_escape
      008DA6 F7               [ 1]  248 	ld (x),a 
      008DA7 5C               [ 1]  249 	incw x 
      008DA8 20 E5            [ 2]  250 	jra 2$
      008DAA                        251 3$:
      008DAA 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DAC A1 5C            [ 1]  253 	cp a,#'\'
      008DAE 27 DD            [ 1]  254 	jreq 1$
      008DB0 A1 22            [ 1]  255 	cp a,#'"
      008DB2 27 04            [ 1]  256 	jreq 6$ 
      008DB4 F7               [ 1]  257 	ld (x),a 
      008DB5 5C               [ 1]  258 	incw x 
      008DB6 20 D7            [ 2]  259 	jra 2$
      008DB8                        260 6$:
      008DB8 7F               [ 1]  261 	clr (x)
      008DB9 5C               [ 1]  262 	incw x 
      008DBA 90 93            [ 1]  263 	ldw y,x 
      008DBC 5F               [ 1]  264 	clrw x 
      008DBD A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D3F                        266 	_drop VSIZE
      008DBF 5B 02            [ 2]    1     addw sp,#VSIZE 
      008DC1 81               [ 4]  267 	ret 
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
      008DC2                        278 convert_escape:
      008DC2 89               [ 2]  279 	pushw x 
      008DC3 AE 8D D7         [ 2]  280 	ldw x,#escaped 
      008DC6 F1               [ 1]  281 1$:	cp a,(x)
      008DC7 27 06            [ 1]  282 	jreq 2$
      008DC9 7D               [ 1]  283 	tnz (x)
      008DCA 27 09            [ 1]  284 	jreq 3$
      008DCC 5C               [ 1]  285 	incw x 
      008DCD 20 F7            [ 2]  286 	jra 1$
      008DCF 1D 8D D7         [ 2]  287 2$: subw x,#escaped 
      008DD2 9F               [ 1]  288 	ld a,xl 
      008DD3 AB 07            [ 1]  289 	add a,#7
      008DD5 85               [ 2]  290 3$:	popw x 
      008DD6 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    292 
      008DD7 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008DDF                        310 parse_integer: ; { -- n }
      008DDF 89               [ 2]  311 	pushw x 	
      008DE0 4B 00            [ 1]  312 	push #0 ; TCHAR
      008DE2 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008DE4 A1 24            [ 1]  314 	cp a,#'$
      008DE6 26 04            [ 1]  315 	jrne 2$ 
      000D68                        316     _drop #1
      008DE8 5B 01            [ 2]    1     addw sp,##1 
      008DEA 4B 10            [ 1]  317 	push #16  ; BASE=16
      008DEC F7               [ 1]  318 2$:	ld (x),a 
      008DED 5C               [ 1]  319 	incw x 
      008DEE 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008DF1 72 5C 00 02      [ 1]  321 	inc in 
      008DF5 CD 98 F7         [ 4]  322 	call to_upper 
      008DF8 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008DFA CD 8E 7C         [ 4]  324 	call is_digit 
      008DFD 25 ED            [ 1]  325 	jrc 2$
      008DFF A6 10            [ 1]  326 	ld a,#16 
      008E01 11 01            [ 1]  327 	cp a,(BASE,sp)
      008E03 26 0A            [ 1]  328 	jrne 3$ 
      008E05 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E07 A1 41            [ 1]  330 	cp a,#'A 
      008E09 2B 04            [ 1]  331 	jrmi 3$ 
      008E0B A1 47            [ 1]  332 	cp a,#'G 
      008E0D 2B DD            [ 1]  333 	jrmi 2$ 
      008E0F 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E13 7F               [ 1]  335     clr (x)
      008E14 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E16 CD 99 03         [ 4]  337 	call atoi24
      008E19 16 03            [ 2]  338 	ldw y,(XSAVE,sp)
      008E1B C6 00 0D         [ 1]  339 	ld a,acc24 
      008E1E 90 F7            [ 1]  340 	ld (y),a 
      008E20 90 5C            [ 1]  341 	incw y  
      008E22 CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E25 90 FF            [ 2]  343 	ldw (y),x 
      008E27 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008E2B A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DAD                        346 	_drop VSIZE  
      008E2D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E2F 81               [ 4]  347 	ret 	
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
      008E30                        364 parse_binary: ; { -- n }
      008E30 4B 00            [ 1]  365 	push #0
      008E32 4B 00            [ 1]  366 	push #0
      008E34 4B 00            [ 1]  367 	push #0
      008E36                        368 2$:	
      008E36 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E39 72 5C 00 02      [ 1]  370 	inc in 
      008E3D A1 30            [ 1]  371 	cp a,#'0 
      008E3F 27 06            [ 1]  372 	jreq 3$
      008E41 A1 31            [ 1]  373 	cp a,#'1 
      008E43 27 02            [ 1]  374 	jreq 3$ 
      008E45 20 0B            [ 2]  375 	jra bin_exit 
      008E47 A0 30            [ 1]  376 3$: sub a,#'0 
      008E49 46               [ 1]  377 	rrc a
      008E4A 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E4C 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E4E 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E50 20 E4            [ 2]  381 	jra 2$  
      008E52                        382 bin_exit:
      008E52 72 5A 00 02      [ 1]  383 	dec in 
      008E56 90 93            [ 1]  384 	ldw y,x
      008E58 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008E5A 90 F7            [ 1]  386 	ld (y),a 
      008E5C 90 5C            [ 1]  387 	incw y 
      008E5E 1E 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008E60 90 FF            [ 2]  389 	ldw (y),x 
      008E62 72 A9 00 02      [ 2]  390 	addw y,#2  
      008E66 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000DE8                        392 	_drop VSIZE 
      008E68 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E6A 81               [ 4]  393 	ret
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
      008E6B                        402 is_alpha::
      008E6B A1 41            [ 1]  403 	cp a,#'A 
      008E6D 8C               [ 1]  404 	ccf 
      008E6E 24 0B            [ 1]  405 	jrnc 9$ 
      008E70 A1 5B            [ 1]  406 	cp a,#'Z+1 
      008E72 25 07            [ 1]  407 	jrc 9$ 
      008E74 A1 61            [ 1]  408 	cp a,#'a 
      008E76 8C               [ 1]  409 	ccf 
      008E77 24 02            [ 1]  410 	jrnc 9$
      008E79 A1 7B            [ 1]  411 	cp a,#'z+1
      008E7B 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008E7C                        421 is_digit::
      008E7C A1 30            [ 1]  422 	cp a,#'0
      008E7E 25 03            [ 1]  423 	jrc 1$
      008E80 A1 3A            [ 1]  424     cp a,#'9+1
      008E82 8C               [ 1]  425 	ccf 
      008E83 8C               [ 1]  426 1$:	ccf 
      008E84 81               [ 4]  427     ret
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
      008E85                        438 is_alnum::
      008E85 CD 8E 7C         [ 4]  439 	call is_digit
      008E88 25 03            [ 1]  440 	jrc 1$ 
      008E8A CD 8E 6B         [ 4]  441 	call is_alpha
      008E8D 81               [ 4]  442 1$:	ret 
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



      008E8E                        453 is_symbol_char: 
      008E8E A1 5F            [ 1]  454 	cp a,#'_ 
      008E90 26 03            [ 1]  455 	jrne 1$
      008E92 99               [ 1]  456 	scf 
      008E93 20 03            [ 2]  457 	jra 9$ 
      008E95 CD 8E 85         [ 4]  458 1$:	call is_alnum 
      008E98 81               [ 4]  459 9$: ret 
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
      008E99                        473 parse_symbol:
      008E99 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008E9A                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008E9A CD 98 F7         [ 4]  477 	call to_upper  
      008E9D F7               [ 1]  478 	ld (x), a 
      008E9E 5C               [ 1]  479 	incw x
      008E9F 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008EA2 72 5C 00 02      [ 1]  481 	inc in 
      008EA6 CD 8E 8E         [ 4]  482 	call is_symbol_char 
      008EA9 25 EF            [ 1]  483 	jrc symb_loop 
      008EAB 7F               [ 1]  484 	clr (x)
      008EAC 72 5A 00 02      [ 1]  485 	dec in  
      008EB0 81               [ 4]  486 	ret 
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
      008EB1                        502 parse_keyword: 
      008EB1 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EB2 CD 8E 99         [ 4]  504 	call parse_symbol
      008EB5 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008EB7 E6 02            [ 1]  506 	ld a,(2,x)
      008EB9 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008EBB E6 01            [ 1]  509 	ld a,(1,x) 
      008EBD A0 41            [ 1]  510 	sub a,#'A 
      008EBF AE 00 03         [ 2]  511 	ldw x,#3 
      008EC2 42               [ 4]  512 	mul x,a 
      008EC3 1C 00 35         [ 2]  513 	addw x,#vars 
      008EC6 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008EC8 20 36            [ 2]  515 	jra 4$ 
      008ECA                        516 2$: ; check for keyword, otherwise syntax error.
      000E4A                        517 	_ldx_dict kword_dict ; dictionary entry point
      008ECA AE B4 3C         [ 2]    1     ldw x,#kword_dict+2
      008ECD 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008ECF 90 5C            [ 1]  519 	incw y 
      008ED1 CD 99 84         [ 4]  520 	call search_dict
      008ED4 4D               [ 1]  521 	tnz a
      008ED5 26 29            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008ED7 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008ED9 A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008EDB 90 F7            [ 1]  527 	ld (y),a 
      008EDD 90 5C            [ 1]  528 	incw y
      008EDF 93               [ 1]  529 	ldw x,y 
      008EE0 CD 93 D5         [ 4]  530 	call strlen
      008EE3 A1 0F            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008EE5 23 02            [ 2]  532 	jrule 22$ 
      008EE7 A6 0F            [ 1]  533 	ld a,#NAME_MAX_LEN 
      008EE9                        534 22$:	
      008EE9 88               [ 1]  535 	push a 
      008EEA                        536 24$:
      008EEA 90 F6            [ 1]  537     ld a,(y)
      008EEC 27 09            [ 1]  538 	jreq 3$
      008EEE 90 5C            [ 1]  539 	incw y
      008EF0 0A 01            [ 1]  540 	dec (1,sp) 
      008EF2 26 F6            [ 1]  541 	jrne 24$
      008EF4 4F               [ 1]  542 	clr a 
      008EF5 90 F7            [ 1]  543 	ld (y),a 
      008EF7 90 5C            [ 1]  544 3$: incw y 
      000E79                        545 	_drop 1 
      008EF9 5B 01            [ 2]    1     addw sp,#1 
      008EFB A6 03            [ 1]  546 	ld a,#TK_LABEL 
      008EFD 5F               [ 1]  547 	clrw x 
      008EFE 20 1B            [ 2]  548 	jra 5$ 
      008F00                        549 4$:	
      008F00 16 01            [ 2]  550 	ldw y,(XFIRST,sp)
      008F02 A1 87            [ 1]  551 	cp a,#TK_NOT 
      008F04 2B 06            [ 1]  552 	jrmi 41$
      008F06 90 F7            [ 1]  553 	ld (y),a 
      008F08 90 5C            [ 1]  554 	incw y 
      008F0A 20 0F            [ 2]  555 	jra 5$ 
      008F0C                        556 41$:	
      008F0C A3 9C FD         [ 2]  557 	cpw x,#let  
      008F0F 27 0A            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008F11 90 F7            [ 1]  559 	ld (y),a 
      008F13 90 5C            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008F15 90 FF            [ 2]  561 	ldw (y),x
      008F17 72 A9 00 02      [ 2]  562 	addw y,#2  
      000E9B                        563 5$:	_drop VSIZE 
      008F1B 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F1D 81               [ 4]  564 	ret  	
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
      008F1E                        575 skip:
      008F1E 88               [ 1]  576 	push a
      008F1F 91 D6 01         [ 4]  577 1$:	ld a,([in.w],y)
      008F22 27 0A            [ 1]  578 	jreq 2$
      008F24 11 01            [ 1]  579 	cp a,(C,sp)
      008F26 26 06            [ 1]  580 	jrne 2$
      008F28 72 5C 00 02      [ 1]  581 	inc in
      008F2C 20 F1            [ 2]  582 	jra 1$
      000EAE                        583 2$: _drop 1 
      008F2E 5B 01            [ 2]    1     addw sp,#1 
      008F30 81               [ 4]  584 	ret
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
      008F31                        609 get_token:: 
      000EB1                        610 	_vars VSIZE
      008F31 52 02            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      008F33                        616 0$: 
      008F33 90 AE 16 90      [ 2]  617 	ldw y,#tib    	
      008F37 A6 20            [ 1]  618 	ld a,#SPACE
      008F39 CD 8F 1E         [ 4]  619 	call skip
      008F3C 55 00 02 00 03   [ 1]  620 	mov in.saved,in 
      008F41 91 D6 01         [ 4]  621 	ld a,([in.w],y)
      008F44 26 05            [ 1]  622 	jrne 1$
      008F46 90 93            [ 1]  623 	ldw y,x 
      008F48 CC 90 E2         [ 2]  624 	jp token_exit ; end of line 
      008F4B 72 5C 00 02      [ 1]  625 1$:	inc in 
      008F4F CD 98 F7         [ 4]  626 	call to_upper 
      008F52 6B 01            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      008F54                        629 str_tst:  	
      000ED4                        630 	_case '"' nbr_tst
      008F54 A6 22            [ 1]    1 	ld a,#'"' 
      008F56 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F58 26 0A            [ 1]    3 	jrne nbr_tst
      008F5A A6 02            [ 1]  631 	ld a,#TK_QSTR
      008F5C F7               [ 1]  632 	ld (x),a 
      008F5D 5C               [ 1]  633 	incw x 
      008F5E CD 8D 8A         [ 4]  634 	call parse_quote
      008F61 CC 90 E2         [ 2]  635 	jp token_exit
      008F64                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008F64 A6 24            [ 1]  638 	ld a,#'$'
      008F66 11 01            [ 1]  639 	cp a,(TCHAR,sp) 
      008F68 27 17            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008F6A A6 26            [ 1]  642 	ld a,#'&
      008F6C 11 01            [ 1]  643 	cp a,(TCHAR,sp)
      008F6E 26 0A            [ 1]  644 	jrne 0$
      008F70 A6 84            [ 1]  645 	ld a,#TK_INTGR
      008F72 F7               [ 1]  646 	ld (x),a 
      008F73 5C               [ 1]  647 	incw x 
      008F74 CD 8E 30         [ 4]  648 	call parse_binary ; expect binary integer 
      008F77 CC 90 E2         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008F7A 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008F7C CD 8E 7C         [ 4]  652 	call is_digit
      008F7F 24 0C            [ 1]  653 	jrnc 3$
      008F81 A6 84            [ 1]  654 1$:	ld a,#TK_INTGR 
      008F83 F7               [ 1]  655 	ld (x),a 
      008F84 5C               [ 1]  656 	incw x 
      008F85 7B 01            [ 1]  657 	ld a,(TCHAR,sp)
      008F87 CD 8D DF         [ 4]  658 	call parse_integer 
      008F8A CC 90 E2         [ 2]  659 	jp token_exit 
      008F8D                        660 3$: 
      000F0D                        661 	_case '(' bkslsh_tst 
      008F8D A6 28            [ 1]    1 	ld a,#'(' 
      008F8F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F91 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008F93 A6 06            [ 1]  662 	ld a,#TK_LPAREN
      008F95 CC 90 DE         [ 2]  663 	jp token_char   	
      008F98                        664 bkslsh_tst: ; character token 
      000F18                        665 	_case '\',rparnt_tst
      008F98 A6 5C            [ 1]    1 	ld a,#'\' 
      008F9A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F9C 26 16            [ 1]    3 	jrne rparnt_tst
      008F9E A6 04            [ 1]  666 	ld a,#TK_CHAR 
      008FA0 F7               [ 1]  667 	ld (x),a 
      008FA1 5C               [ 1]  668 	incw x 
      008FA2 91 D6 01         [ 4]  669 	ld a,([in.w],y)
      008FA5 F7               [ 1]  670 	ld (x),a 
      008FA6 5C               [ 1]  671 	incw x
      008FA7 90 93            [ 1]  672 	ldw y,x 	 
      008FA9 72 5C 00 02      [ 1]  673 	inc in  
      008FAD 5F               [ 1]  674 	clrw x 
      008FAE 97               [ 1]  675 	ld xl,a 
      008FAF A6 04            [ 1]  676 	ld a,#TK_CHAR 
      008FB1 CC 90 E2         [ 2]  677 	jp token_exit 
      008FB4                        678 rparnt_tst:		
      000F34                        679 	_case ')' colon_tst 
      008FB4 A6 29            [ 1]    1 	ld a,#')' 
      008FB6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FB8 26 05            [ 1]    3 	jrne colon_tst
      008FBA A6 07            [ 1]  680 	ld a,#TK_RPAREN 
      008FBC CC 90 DE         [ 2]  681 	jp token_char
      008FBF                        682 colon_tst:
      000F3F                        683 	_case ':' comma_tst 
      008FBF A6 3A            [ 1]    1 	ld a,#':' 
      008FC1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FC3 26 05            [ 1]    3 	jrne comma_tst
      008FC5 A6 0A            [ 1]  684 	ld a,#TK_COLON 
      008FC7 CC 90 DE         [ 2]  685 	jp token_char  
      008FCA                        686 comma_tst:
      000F4A                        687 	_case COMMA sharp_tst 
      008FCA A6 2C            [ 1]    1 	ld a,#COMMA 
      008FCC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FCE 26 05            [ 1]    3 	jrne sharp_tst
      008FD0 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008FD2 CC 90 DE         [ 2]  689 	jp token_char
      008FD5                        690 sharp_tst:
      000F55                        691 	_case SHARP dash_tst 
      008FD5 A6 23            [ 1]    1 	ld a,#SHARP 
      008FD7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FD9 26 05            [ 1]    3 	jrne dash_tst
      008FDB A6 09            [ 1]  692 	ld a,#TK_SHARP
      008FDD CC 90 DE         [ 2]  693 	jp token_char  	 	 
      008FE0                        694 dash_tst: 	
      000F60                        695 	_case '-' at_tst 
      008FE0 A6 2D            [ 1]    1 	ld a,#'-' 
      008FE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE4 26 05            [ 1]    3 	jrne at_tst
      008FE6 A6 11            [ 1]  696 	ld a,#TK_MINUS  
      008FE8 CC 90 DE         [ 2]  697 	jp token_char 
      008FEB                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      000F6B                        699 	_case '@' qmark_tst 
      008FEB A6 40            [ 1]    1 	ld a,#'@' 
      008FED 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FEF 26 05            [ 1]    3 	jrne qmark_tst
      008FF1 A6 05            [ 1]  700 	ld a,#TK_ARRAY 
      008FF3 CC 90 DE         [ 2]  701 	jp token_char
      008FF6                        702 qmark_tst:
      000F76                        703 	_case '?' tick_tst 
      008FF6 A6 3F            [ 1]    1 	ld a,#'?' 
      008FF8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FFA 26 12            [ 1]    3 	jrne tick_tst
      008FFC A6 80            [ 1]  704 	ld a,#TK_CMD  
      008FFE F7               [ 1]  705 	ld (x),a 
      008FFF 5C               [ 1]  706 	incw x 
      009000 90 93            [ 1]  707 	ldw y,x 
      009002 AE 9F ED         [ 2]  708 	ldw x,#print
      009005 90 FF            [ 2]  709 	ldw (y),x 
      009007 72 A9 00 02      [ 2]  710 	addw y,#2
      00900B CC 90 E2         [ 2]  711 	jp token_exit
      00900E                        712 tick_tst: ; comment 
      000F8E                        713 	_case TICK plus_tst 
      00900E A6 27            [ 1]    1 	ld a,#TICK 
      009010 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009012 26 2B            [ 1]    3 	jrne plus_tst
      009014 A6 80            [ 1]  714 	ld a,#TK_CMD
      009016 F7               [ 1]  715 	ld (x),a 
      009017 5C               [ 1]  716 	incw x
      009018 90 AE A1 35      [ 2]  717 	ldw y,#remark 
      00901C FF               [ 2]  718 	ldw (x),y 
      00901D 1C 00 02         [ 2]  719 	addw x,#2  
      009020                        720 copy_comment:
      009020 90 AE 16 90      [ 2]  721 	ldw y,#tib 
      009024 72 B9 00 01      [ 2]  722 	addw y,in.w
      009028 90 89            [ 2]  723 	pushw y 
      00902A CD 93 F1         [ 4]  724 	call strcpy
      00902D 72 F2 01         [ 2]  725 	subw y,(1,sp)
      009030 90 5C            [ 1]  726 	incw y ; strlen+1 
      009032 17 01            [ 2]  727 	ldw (1,sp),y 
      009034 72 FB 01         [ 2]  728 	addw x,(1,sp) 
      000FB7                        729 	_drop 2 
      009037 5B 02            [ 2]    1     addw sp,#2 
      009039 4F               [ 1]  730 	clr a 
      00903A 90 93            [ 1]  731 	ldw y,x 
      00903C CC 90 E2         [ 2]  732 	jp token_exit 
      00903F                        733 plus_tst:
      000FBF                        734 	_case '+' star_tst 
      00903F A6 2B            [ 1]    1 	ld a,#'+' 
      009041 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009043 26 05            [ 1]    3 	jrne star_tst
      009045 A6 10            [ 1]  735 	ld a,#TK_PLUS  
      009047 CC 90 DE         [ 2]  736 	jp token_char 
      00904A                        737 star_tst:
      000FCA                        738 	_case '*' slash_tst 
      00904A A6 2A            [ 1]    1 	ld a,#'*' 
      00904C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00904E 26 05            [ 1]    3 	jrne slash_tst
      009050 A6 20            [ 1]  739 	ld a,#TK_MULT 
      009052 CC 90 DE         [ 2]  740 	jp token_char 
      009055                        741 slash_tst: 
      000FD5                        742 	_case '/' prcnt_tst 
      009055 A6 2F            [ 1]    1 	ld a,#'/' 
      009057 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009059 26 05            [ 1]    3 	jrne prcnt_tst
      00905B A6 21            [ 1]  743 	ld a,#TK_DIV 
      00905D CC 90 DE         [ 2]  744 	jp token_char 
      009060                        745 prcnt_tst:
      000FE0                        746 	_case '%' eql_tst 
      009060 A6 25            [ 1]    1 	ld a,#'%' 
      009062 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009064 26 05            [ 1]    3 	jrne eql_tst
      009066 A6 22            [ 1]  747 	ld a,#TK_MOD
      009068 CC 90 DE         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      00906B                        750 eql_tst:
      000FEB                        751 	_case '=' gt_tst 		
      00906B A6 3D            [ 1]    1 	ld a,#'=' 
      00906D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00906F 26 05            [ 1]    3 	jrne gt_tst
      009071 A6 32            [ 1]  752 	ld a,#TK_EQUAL
      009073 CC 90 DE         [ 2]  753 	jp token_char 
      009076                        754 gt_tst:
      000FF6                        755 	_case '>' lt_tst 
      009076 A6 3E            [ 1]    1 	ld a,#'>' 
      009078 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00907A 26 23            [ 1]    3 	jrne lt_tst
      00907C A6 31            [ 1]  756 	ld a,#TK_GT 
      00907E 6B 02            [ 1]  757 	ld (ATTRIB,sp),a 
      009080 91 D6 01         [ 4]  758 	ld a,([in.w],y)
      009083 72 5C 00 02      [ 1]  759 	inc in 
      009087 A1 3D            [ 1]  760 	cp a,#'=
      009089 26 04            [ 1]  761 	jrne 1$
      00908B A6 33            [ 1]  762 	ld a,#TK_GE 
      00908D 20 4F            [ 2]  763 	jra token_char  
      00908F A1 3C            [ 1]  764 1$: cp a,#'<
      009091 26 04            [ 1]  765 	jrne 2$
      009093 A6 35            [ 1]  766 	ld a,#TK_NE 
      009095 20 47            [ 2]  767 	jra token_char 
      009097 72 5A 00 02      [ 1]  768 2$: dec in
      00909B 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      00909D 20 3F            [ 2]  770 	jra token_char 	 
      00909F                        771 lt_tst:
      00101F                        772 	_case '<' other
      00909F A6 3C            [ 1]    1 	ld a,#'<' 
      0090A1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090A3 26 23            [ 1]    3 	jrne other
      0090A5 A6 34            [ 1]  773 	ld a,#TK_LT 
      0090A7 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      0090A9 91 D6 01         [ 4]  775 	ld a,([in.w],y)
      0090AC 72 5C 00 02      [ 1]  776 	inc in 
      0090B0 A1 3D            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      0090B2 26 04            [ 1]  778 	jrne 1$
      0090B4 A6 36            [ 1]  779 	ld a,#TK_LE 
      0090B6 20 26            [ 2]  780 	jra token_char 
      0090B8 A1 3E            [ 1]  781 1$: cp a,#'>
      0090BA 26 04            [ 1]  782 	jrne 2$
      0090BC A6 35            [ 1]  783 	ld a,#TK_NE 
      0090BE 20 1E            [ 2]  784 	jra token_char 
      0090C0 72 5A 00 02      [ 1]  785 2$: dec in 
      0090C4 7B 02            [ 1]  786 	ld a,(ATTRIB,sp)
      0090C6 20 16            [ 2]  787 	jra token_char 	
      0090C8                        788 other: ; not a special character 	 
      0090C8 7B 01            [ 1]  789 	ld a,(TCHAR,sp)
      0090CA CD 8E 6B         [ 4]  790 	call is_alpha 
      0090CD 25 03            [ 1]  791 	jrc 30$ 
      0090CF CC 96 B5         [ 2]  792 	jp syntax_error 
      0090D2                        793 30$: 
      0090D2 CD 8E B1         [ 4]  794 	call parse_keyword
      0090D5 A3 A1 35         [ 2]  795 	cpw x,#remark 
      0090D8 26 08            [ 1]  796 	jrne token_exit 
      0090DA 93               [ 1]  797 	ldw x,y 
      0090DB CC 90 20         [ 2]  798 	jp copy_comment 
      0090DE                        799 token_char:
      0090DE F7               [ 1]  800 	ld (x),a 
      0090DF 5C               [ 1]  801 	incw x
      0090E0 90 93            [ 1]  802 	ldw y,x 
      0090E2                        803 token_exit:
      001062                        804 	_drop VSIZE 
      0090E2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090E4 81               [ 4]  805 	ret
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
      0090E5                        825 compile::
      0090E5 90 89            [ 2]  826 	pushw y 
      001067                        827 	_vars VSIZE 
      0090E7 52 02            [ 2]    1     sub sp,#VSIZE 
      0090E9 55 00 1C 00 05   [ 1]  828 	mov basicptr,txtbgn
      0090EE 72 1A 00 23      [ 1]  829 	bset flags,#FCOMP 
      0090F2 A6 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      0090F4 AE 00 00         [ 2]  831 	ldw x,#0
      0090F7 CF 16 E0         [ 2]  832 	ldw pad,x ; destination buffer 
      0090FA C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      0090FD AE 16 E3         [ 2]  834 	ldw x,#pad+3
      009100 72 5F 00 02      [ 1]  835 	clr in 
      009104 CD 8F 31         [ 4]  836 	call get_token
      009107 A1 84            [ 1]  837 	cp a,#TK_INTGR
      009109 26 11            [ 1]  838 	jrne 2$
      00910B A3 00 01         [ 2]  839 	cpw x,#1 
      00910E 2A 05            [ 1]  840 	jrpl 1$
      009110 A6 0A            [ 1]  841 	ld a,#ERR_BAD_VALUE
      009112 CC 96 B7         [ 2]  842 	jp tb_error
      009115 CF 16 E0         [ 2]  843 1$:	ldw pad,x 
      009118 90 AE 16 E3      [ 2]  844 	ldw y,#pad+3 
      00911C 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      009120 25 05            [ 1]  846 	jrult 3$
      009122 A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      009124 CC 96 B7         [ 2]  848 	jp tb_error 
      009127                        849 3$:	
      009127 93               [ 1]  850 	ldw x,y 
      009128 CD 8F 31         [ 4]  851 	call get_token 
      00912B A1 00            [ 1]  852 	cp a,#TK_NONE 
      00912D 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      00912F 72 A2 16 E0      [ 2]  855 	subw y,#pad
      009133 90 9F            [ 1]  856     ld a,yl
      009135 AE 16 E0         [ 2]  857 	ldw x,#pad 
      009138 CF 00 1A         [ 2]  858 	ldw ptr16,x 
      00913B E7 02            [ 1]  859 	ld (2,x),a 
      00913D FE               [ 2]  860 	ldw x,(x)
      00913E 27 09            [ 1]  861 	jreq 10$
      009140 CD 8D 18         [ 4]  862 	call insert_line
      009143 72 5F 00 04      [ 1]  863 	clr  count 
      009147 20 0F            [ 2]  864 	jra  11$ 
      009149                        865 10$: ; line# is zero 
      009149 CE 00 1A         [ 2]  866 	ldw x,ptr16  
      00914C CF 00 05         [ 2]  867 	ldw basicptr,x 
      00914F E6 02            [ 1]  868 	ld a,(2,x)
      009151 C7 00 04         [ 1]  869 	ld count,a 
      009154 35 03 00 02      [ 1]  870 	mov in,#3 
      009158                        871 11$:
      0010D8                        872 	_drop VSIZE 
      009158 5B 02            [ 2]    1     addw sp,#VSIZE 
      00915A 72 1B 00 23      [ 1]  873 	bres flags,#FCOMP 
      00915E 90 85            [ 2]  874 	popw y 
      009160 81               [ 4]  875 	ret 
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
      009161                         48 cpy_cmd_name:
      009161 5D               [ 2]   49 	tnzw x 
      009162 27 14            [ 1]   50 	jreq 10$
      009164 F6               [ 1]   51 	ld a,(x)
      009165 5C               [ 1]   52 	incw x
      009166 A4 0F            [ 1]   53 	and a,#15  
      009168 88               [ 1]   54 	push a 
      009169 0D 01            [ 1]   55     tnz (1,sp) 
      00916B 27 0A            [ 1]   56 	jreq 9$
      00916D F6               [ 1]   57 1$:	ld a,(x)
      00916E 90 F7            [ 1]   58 	ld (y),a  
      009170 5C               [ 1]   59 	incw x
      009171 90 5C            [ 1]   60 	incw y 
      009173 0A 01            [ 1]   61 	dec (1,sp)	 
      009175 26 F6            [ 1]   62 	jrne 1$
      009177 84               [ 1]   63 9$: pop a 
      009178                         64 10$: 
      009178 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      009179                         75 add_space:
      009179 90 5A            [ 2]   76 	decw y 
      00917B 90 F6            [ 1]   77 	ld a,(y)
      00917D 90 5C            [ 1]   78 	incw y
      00917F A1 29            [ 1]   79 	cp a,#') 
      009181 27 05            [ 1]   80 	jreq 0$
      009183 CD 8E 85         [ 4]   81 	call is_alnum 
      009186 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009188                         83 0$: 
      009188 A6 20            [ 1]   84 	ld a,#SPACE 
      00918A 90 F7            [ 1]   85 	ld (y),a 
      00918C 90 5C            [ 1]   86 	incw y 
      00918E 81               [ 4]   87 1$: ret 
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
      00918F                         99 right_align::
      00918F 88               [ 1]  100 	push a 
      009190 7B 01            [ 1]  101 0$: ld a,(1,sp)
      009192 C1 00 24         [ 1]  102 	cp a,tab_width 
      009195 2A 08            [ 1]  103 	jrpl 1$
      009197 A6 20            [ 1]  104 	ld a,#SPACE 
      009199 5A               [ 2]  105 	decw x
      00919A F7               [ 1]  106 	ld (x),a  
      00919B 0C 01            [ 1]  107 	inc (1,sp)
      00919D 20 F1            [ 2]  108 	jra 0$ 
      00919F 84               [ 1]  109 1$: pop a 	
      0091A0 81               [ 4]  110 	ret 
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
      0091A1                        123 cpy_quote:
      0091A1 A6 22            [ 1]  124 	ld a,#'"
      0091A3 90 F7            [ 1]  125 	ld (y),a 
      0091A5 90 5C            [ 1]  126 	incw y 
      0091A7 89               [ 2]  127 	pushw x 
      0091A8 CD 98 32         [ 4]  128 	call skip_string 
      0091AB 85               [ 2]  129 	popw x 
      0091AC F6               [ 1]  130 1$:	ld a,(x)
      0091AD 27 30            [ 1]  131 	jreq 9$
      0091AF 5C               [ 1]  132 	incw x 
      0091B0 A1 20            [ 1]  133 	cp a,#SPACE 
      0091B2 25 0E            [ 1]  134 	jrult 3$
      0091B4 90 F7            [ 1]  135 	ld (y),a
      0091B6 90 5C            [ 1]  136 	incw y 
      0091B8 A1 5C            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      0091BA 26 F0            [ 1]  138 	jrne 1$ 
      0091BC                        139 2$:
      0091BC 90 F7            [ 1]  140 	ld (y),a
      0091BE 90 5C            [ 1]  141 	incw y  
      0091C0 20 EA            [ 2]  142 	jra 1$
      0091C2 88               [ 1]  143 3$: push a 
      0091C3 A6 5C            [ 1]  144 	ld a,#'\
      0091C5 90 F7            [ 1]  145 	ld (y),a 
      0091C7 90 5C            [ 1]  146 	incw y  
      0091C9 84               [ 1]  147 	pop a 
      0091CA A0 07            [ 1]  148 	sub a,#7
      0091CC C7 00 0F         [ 1]  149 	ld acc8,a 
      0091CF 72 5F 00 0E      [ 1]  150 	clr acc16
      0091D3 89               [ 2]  151 	pushw x
      0091D4 AE 8D D7         [ 2]  152 	ldw x,#escaped 
      0091D7 72 BB 00 0E      [ 2]  153 	addw x,acc16 
      0091DB F6               [ 1]  154 	ld a,(x)
      0091DC 85               [ 2]  155 	popw x
      0091DD 20 DD            [ 2]  156 	jra 2$
      0091DF A6 22            [ 1]  157 9$: ld a,#'"
      0091E1 90 F7            [ 1]  158 	ld (y),a 
      0091E3 90 5C            [ 1]  159 	incw y  
      0091E5 5C               [ 1]  160 	incw x 
      0091E6 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0091E7                        171 var_name::
      0091E7 1D 00 35         [ 2]  172 		subw x,#vars 
      0091EA A6 03            [ 1]  173 		ld a,#3
      0091EC 62               [ 2]  174 		div x,a 
      0091ED 9F               [ 1]  175 		ld a,xl 
      0091EE AB 41            [ 1]  176 		add a,#'A 
      0091F0 81               [ 4]  177 		ret 
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
      0091F1                        195 decompile::
      001171                        196 	_vars VSIZE
      0091F1 52 04            [ 2]    1     sub sp,#VSIZE 
      0091F3 C6 00 0B         [ 1]  197 	ld a,base
      0091F6 6B 01            [ 1]  198 	ld (BASE_SAV,sp),a  
      0091F8 C6 00 24         [ 1]  199 	ld a,tab_width 
      0091FB 6B 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      0091FD 17 03            [ 2]  201 	ldw (STR,sp),y   
      0091FF 72 CE 00 05      [ 5]  202 	ldw x,[basicptr] ; line number 
      009203 35 0A 00 0B      [ 1]  203 	mov base,#10
      009207 35 05 00 24      [ 1]  204 	mov tab_width,#5
      00920B 72 5F 00 0D      [ 1]  205 	clr acc24 
      00920F CF 00 0E         [ 2]  206 	ldw acc16,x
      009212 4F               [ 1]  207 	clr a ; unsigned conversion 
      009213 CD 98 9E         [ 4]  208 	call itoa  
      009216 CD 91 8F         [ 4]  209 	call right_align 
      009219 88               [ 1]  210 	push a 
      00921A 90 93            [ 1]  211 1$:	ldw y,x ; source
      00921C 1E 04            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      00921E CD 93 F1         [ 4]  213 	call strcpy 
      009221 90 5F            [ 1]  214 	clrw y 
      009223 84               [ 1]  215 	pop a 
      009224 90 97            [ 1]  216 	ld yl,a 
      009226 72 F9 03         [ 2]  217 	addw y,(STR,sp)
      009229 A6 20            [ 1]  218 	ld a,#SPACE 
      00922B 90 F7            [ 1]  219 	ld (y),a 
      00922D 90 5C            [ 1]  220 	incw y 
      00922F 72 5F 00 24      [ 1]  221 	clr tab_width
      009233 AE 00 03         [ 2]  222 	ldw x,#3
      009236 CF 00 01         [ 2]  223 	ldw in.w,x 
      009239                        224 decomp_loop:
      009239 90 89            [ 2]  225 	pushw y
      00923B CD 98 19         [ 4]  226 	call next_token 
      00923E 90 85            [ 2]  227 	popw y 
      009240 4D               [ 1]  228 	tnz a  
      009241 26 03            [ 1]  229 	jrne 1$
      009243 CC 93 66         [ 2]  230 	jp 20$
      009246 2B 03            [ 1]  231 1$:	jrmi 2$
      009248 CC 92 D7         [ 2]  232 	jp 6$
      00924B                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00924B A1 85            [ 1]  234 	cp a,#TK_VAR 
      00924D 26 0F            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      00924F CD 91 79         [ 4]  237 	call add_space
      009252 CD 98 41         [ 4]  238 	call get_addr   
      009255 CD 91 E7         [ 4]  239 	call var_name
      009258 90 F7            [ 1]  240 	ld (y),a 
      00925A 90 5C            [ 1]  241 	incw y  
      00925C 20 DB            [ 2]  242 	jra decomp_loop
      00925E                        243 3$:
      00925E A1 84            [ 1]  244 	cp a,#TK_INTGR
      009260 26 26            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009262 CD 98 4B         [ 4]  247 	call get_int24 
      009265 C7 00 0D         [ 1]  248 	ld acc24,a 
      009268 CF 00 0E         [ 2]  249 	ldw acc16,x 
      00926B CD 91 79         [ 4]  250 	call add_space
      00926E 90 89            [ 2]  251 	pushw y 
      009270 A6 FF            [ 1]  252 	ld a,#255 ; signed conversion 
      009272 CD 98 9E         [ 4]  253 	call itoa  
      009275 16 01            [ 2]  254 	ldw y,(1,sp) 
      009277 88               [ 1]  255 	push a 
      009278 51               [ 1]  256 	exgw x,y 
      009279 CD 93 F1         [ 4]  257 	call strcpy 
      00927C 90 5F            [ 1]  258 	clrw y
      00927E 84               [ 1]  259 	pop a  
      00927F 90 97            [ 1]  260 	ld yl,a 
      009281 72 F9 01         [ 2]  261 	addw y,(1,sp)
      001204                        262 	_drop 2 
      009284 5B 02            [ 2]    1     addw sp,#2 
      009286 20 B1            [ 2]  263 	jra decomp_loop
      009288                        264 4$: ; dictionary keyword
      009288 A1 87            [ 1]  265 	cp a,#TK_NOT 
      00928A 24 39            [ 1]  266 	jruge 50$ 
      00928C FE               [ 2]  267 	ldw x,(x)
      00928D 72 5C 00 02      [ 1]  268 	inc in 
      009291 72 5C 00 02      [ 1]  269 	inc in 
      009295 A3 A1 35         [ 2]  270 	cpw x,#remark 
      009298 26 23            [ 1]  271 	jrne 5$
      00929A CE 00 05         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      00929D CD 91 79         [ 4]  274 	call add_space
      0092A0 A6 27            [ 1]  275 	ld a,#''
      0092A2 90 F7            [ 1]  276 	ld (y),a 
      0092A4 90 5C            [ 1]  277 	incw y 
      0092A6                        278 46$:
      0092A6 72 D6 00 01      [ 4]  279 	ld a,([in.w],x)
      0092AA 72 5C 00 02      [ 1]  280 	inc in  
      0092AE 90 F7            [ 1]  281 	ld (y),a 
      0092B0 90 5C            [ 1]  282 	incw y 
      0092B2 C6 00 02         [ 1]  283 	ld a,in 
      0092B5 C1 00 04         [ 1]  284 	cp a,count 
      0092B8 2B EC            [ 1]  285 	jrmi 46$
      0092BA CC 93 66         [ 2]  286 	jp 20$  
      0092BD A3 9C FD         [ 2]  287 5$: cpw x,#let  
      0092C0 26 05            [ 1]  288 	jrne 54$
      0092C2 CC 92 39         [ 2]  289 	jp decomp_loop ; down display LET
      0092C5                        290 50$:
      0092C5 5F               [ 1]  291 	clrw x 
      0092C6 97               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      0092C7                        297 54$: ; insert command name 
      0092C7 CD 91 79         [ 4]  298 	call add_space  
      0092CA 90 89            [ 2]  299 	pushw y
      0092CC CD 93 A1         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0092CF 90 85            [ 2]  301 	popw y 
      0092D1 CD 91 61         [ 4]  302 	call cpy_cmd_name
      0092D4 CC 92 39         [ 2]  303 	jp decomp_loop 
      0092D7                        304 6$:
                                    305 ; label?
      0092D7 A1 03            [ 1]  306 	cp a,#TK_LABEL 
      0092D9 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0092DB A6 20            [ 1]  309 	ld a,#32 
      0092DD 90 F7            [ 1]  310 	ld (y),a 
      0092DF 90 5C            [ 1]  311 	incw y 
      0092E1                        312 61$:
      0092E1 89               [ 2]  313 	pushw x 
      0092E2 CD 98 32         [ 4]  314 	call skip_string 
      0092E5 85               [ 2]  315 	popw x 
      0092E6                        316 62$:	
      0092E6 F6               [ 1]  317 	ld a,(x)
      0092E7 27 07            [ 1]  318 	jreq 63$ 
      0092E9 5C               [ 1]  319 	incw x  
      0092EA 90 F7            [ 1]  320 	ld (y),a 
      0092EC 90 5C            [ 1]  321 	incw y 
      0092EE 20 F6            [ 2]  322 	jra 62$ 
      0092F0                        323 63$: 
      0092F0 A6 20            [ 1]  324 	ld a,#32 
      0092F2 90 F7            [ 1]  325 	ld (y),a 
      0092F4 90 5C            [ 1]  326 	incw y 
      0092F6 CC 92 39         [ 2]  327 	jp decomp_loop
      0092F9                        328 64$:
      0092F9 A1 02            [ 1]  329 	cp a,#TK_QSTR 
      0092FB 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0092FD CD 91 79         [ 4]  332 	call add_space
      009300 CD 91 A1         [ 4]  333 	call cpy_quote  
      009303 CC 92 39         [ 2]  334 	jp decomp_loop
      009306                        335 7$:
      009306 A1 04            [ 1]  336 	cp a,#TK_CHAR 
      009308 26 10            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      00930A CD 91 79         [ 4]  339 	call add_space 
      00930D A6 5C            [ 1]  340 	ld a,#'\ 
      00930F 90 F7            [ 1]  341 	ld (y),a 
      009311 90 5C            [ 1]  342 	incw y
      009313 F6               [ 1]  343 	ld a,(x)
      009314 72 5C 00 02      [ 1]  344 	inc in  
      009318 20 06            [ 2]  345 	jra 81$
      00931A A1 0A            [ 1]  346 8$: cp a,#TK_COLON 
      00931C 26 09            [ 1]  347 	jrne 9$
      00931E A6 3A            [ 1]  348 	ld a,#':
      009320                        349 81$:
      009320 90 F7            [ 1]  350 	ld (y),a 
      009322 90 5C            [ 1]  351 	incw y 
      009324                        352 82$:
      009324 CC 92 39         [ 2]  353 	jp decomp_loop
      009327                        354 9$: 
      009327 A1 09            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009329 22 0A            [ 1]  356 	jrugt 10$ 
      00932B A0 05            [ 1]  357 	sub a,#TK_ARRAY 
      00932D 5F               [ 1]  358 	clrw x 
      00932E 97               [ 1]  359 	ld xl,a
      00932F 1C 93 7C         [ 2]  360 	addw x,#single_char 
      009332 F6               [ 1]  361 	ld a,(x)
      009333 20 EB            [ 2]  362 	jra 81$ 
      009335                        363 10$: 
      009335 A1 11            [ 1]  364 	cp a,#TK_MINUS 
      009337 22 0A            [ 1]  365 	jrugt 11$
      009339 A0 10            [ 1]  366 	sub a,#TK_PLUS 
      00933B 5F               [ 1]  367 	clrw x 
      00933C 97               [ 1]  368 	ld xl,a 
      00933D 1C 93 81         [ 2]  369 	addw x,#add_char 
      009340 F6               [ 1]  370 	ld a,(x)
      009341 20 DD            [ 2]  371 	jra 81$
      009343                        372 11$:
      009343 A1 22            [ 1]  373     cp a,#TK_MOD 
      009345 22 0A            [ 1]  374 	jrugt 12$
      009347 A0 20            [ 1]  375 	sub a,#TK_MULT
      009349 5F               [ 1]  376 	clrw x 
      00934A 97               [ 1]  377 	ld xl,a 
      00934B 1C 93 83         [ 2]  378 	addw x,#mul_char
      00934E F6               [ 1]  379 	ld a,(x)
      00934F 20 CF            [ 2]  380 	jra 81$
      009351                        381 12$:
      009351 A0 31            [ 1]  382 	sub a,#TK_GT  
      009353 48               [ 1]  383 	sll a 
      009354 5F               [ 1]  384 	clrw x 
      009355 97               [ 1]  385 	ld xl,a 
      009356 1C 93 86         [ 2]  386 	addw x,#relop_str 
      009359 FE               [ 2]  387 	ldw x,(x)
      00935A F6               [ 1]  388 	ld a,(x)
      00935B 5C               [ 1]  389 	incw x 
      00935C 90 F7            [ 1]  390 	ld (y),a
      00935E 90 5C            [ 1]  391 	incw y 
      009360 F6               [ 1]  392 	ld a,(x)
      009361 26 BD            [ 1]  393 	jrne 81$
      009363 CC 92 39         [ 2]  394 	jp decomp_loop 
      009366                        395 20$: 
      009366 90 7F            [ 1]  396 	clr (y)
      009368 1E 03            [ 2]  397 	ldw x,(STR,sp)
      00936A 7B 01            [ 1]  398 	ld a,(BASE_SAV,sp)
      00936C C7 00 0B         [ 1]  399 	ld base,a 
      00936F 7B 02            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      009371 C7 00 24         [ 1]  401 	ld tab_width,a
      009374 72 F2 03         [ 2]  402 	subw y,(STR,sp) 
      009377 90 9F            [ 1]  403 	ld a,yl 
      0012F9                        404 	_drop VSIZE 
      009379 5B 04            [ 2]    1     addw sp,#VSIZE 
      00937B 81               [ 4]  405 	ret 
                                    406 
      00937C 40 28 29 2C 23         407 single_char: .byte '@','(',')',',','#'
      009381 2B 2D                  408 add_char: .byte '+','-'
      009383 2A 2F 25               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009386 93 92 93 94 93 96 93   410 relop_str: .word gt,equal,ge,lt,ne,le 
             99 93 9E 93 9B
      009392 3E 00                  411 gt: .asciz ">"
      009394 3D 00                  412 equal: .asciz "="
      009396 3E 3D 00               413 ge: .asciz ">="
      009399 3C 00                  414 lt: .asciz "<"
      00939B 3C 3D 00               415 le: .asciz "<="
      00939E 3C 3E 00               416 ne:  .asciz "<>"
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
      0093A1                        429 cmd_name:
      001321                        430 	_vars VSIZE 
      0093A1 52 04            [ 2]    1     sub sp,#VSIZE 
      0093A3 72 5F 00 0E      [ 1]  431 	clr acc16 
      0093A7 1F 01            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      0093A9 AE B4 3A         [ 2]  433 	ldw x,#kword_dict	
      0093AC 1F 03            [ 2]  434 1$:	ldw (LINK,sp),x
      0093AE E6 02            [ 1]  435 	ld a,(2,x)
      0093B0 A4 0F            [ 1]  436 	and a,#15 
      0093B2 C7 00 0F         [ 1]  437 	ld acc8,a 
      0093B5 1C 00 03         [ 2]  438 	addw x,#3
      0093B8 72 BB 00 0E      [ 2]  439 	addw x,acc16
      0093BC FE               [ 2]  440 	ldw x,(x) ; code address   
      0093BD 13 01            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      0093BF 27 0C            [ 1]  442 	jreq 2$
      0093C1 1E 03            [ 2]  443 	ldw x,(LINK,sp)
      0093C3 FE               [ 2]  444 	ldw x,(x) 
      0093C4 1D 00 02         [ 2]  445 	subw x,#2  
      0093C7 26 E3            [ 1]  446 	jrne 1$
      0093C9 4F               [ 1]  447 	clr a 
      0093CA 5F               [ 1]  448 	clrw x 
      0093CB 20 05            [ 2]  449 	jra 9$
      0093CD 1E 03            [ 2]  450 2$: ldw x,(LINK,sp)
      0093CF 1C 00 02         [ 2]  451 	addw x,#2 	
      001352                        452 9$:	_drop VSIZE
      0093D2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093D4 81               [ 4]  453 	ret
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
      0093D5                        118 strlen::
      0093D5 89               [ 2]  119 	pushw x 
      0093D6 4F               [ 1]  120 	clr a
      0093D7 7D               [ 1]  121 1$:	tnz (x) 
      0093D8 27 04            [ 1]  122 	jreq 9$ 
      0093DA 4C               [ 1]  123 	inc a 
      0093DB 5C               [ 1]  124 	incw x 
      0093DC 20 F9            [ 2]  125 	jra 1$ 
      0093DE 85               [ 2]  126 9$:	popw x 
      0093DF 81               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      0093E0                        137 strcmp:
      0093E0 F6               [ 1]  138 	ld a,(x)
      0093E1 27 0B            [ 1]  139 	jreq 5$ 
      0093E3 90 F1            [ 1]  140 	cp a,(y) 
      0093E5 26 05            [ 1]  141 	jrne 4$ 
      0093E7 5C               [ 1]  142 	incw x 
      0093E8 90 5C            [ 1]  143 	incw y 
      0093EA 20 F4            [ 2]  144 	jra strcmp 
      0093EC                        145 4$: ; not same  
      0093EC 4F               [ 1]  146 	clr a 
      0093ED 81               [ 4]  147 	ret 
      0093EE                        148 5$: ; same 
      0093EE A6 01            [ 1]  149 	ld a,#1 
      0093F0 81               [ 4]  150 	ret 
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



      0093F1                        161 strcpy::
      0093F1 88               [ 1]  162 	push a 
      0093F2 89               [ 2]  163 	pushw x 
      0093F3 90 F6            [ 1]  164 1$: ld a,(y)
      0093F5 27 06            [ 1]  165 	jreq 9$ 
      0093F7 F7               [ 1]  166 	ld (x),a 
      0093F8 5C               [ 1]  167 	incw x 
      0093F9 90 5C            [ 1]  168 	incw y 
      0093FB 20 F6            [ 2]  169 	jra 1$ 
      0093FD 7F               [ 1]  170 9$:	clr (x)
      0093FE 85               [ 2]  171 	popw x 
      0093FF 84               [ 1]  172 	pop a 
      009400 81               [ 4]  173 	ret 
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
      009401                        187 move::
      009401 88               [ 1]  188 	push a 
      001382                        189 	_vars VSIZE 
      009402 52 02            [ 2]    1     sub sp,#VSIZE 
      009404 0F 01            [ 1]  190 	clr (INCR,sp)
      009406 0F 02            [ 1]  191 	clr (LB,sp)
      009408 90 89            [ 2]  192 	pushw y 
      00940A 13 01            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      00940C 90 85            [ 2]  194 	popw y 
      00940E 27 31            [ 1]  195 	jreq move_exit ; x==y 
      009410 2B 0E            [ 1]  196 	jrmi move_down
      009412                        197 move_up: ; start from top address with incr=-1
      009412 72 BB 00 0E      [ 2]  198 	addw x,acc16
      009416 72 B9 00 0E      [ 2]  199 	addw y,acc16
      00941A 03 01            [ 1]  200 	cpl (INCR,sp)
      00941C 03 02            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      00941E 20 05            [ 2]  202 	jra move_loop  
      009420                        203 move_down: ; start from bottom address with incr=1 
      009420 5A               [ 2]  204     decw x 
      009421 90 5A            [ 2]  205 	decw y
      009423 0C 02            [ 1]  206 	inc (LB,sp) ; incr=1 
      009425                        207 move_loop:	
      009425 C6 00 0E         [ 1]  208     ld a, acc16 
      009428 CA 00 0F         [ 1]  209 	or a, acc8
      00942B 27 14            [ 1]  210 	jreq move_exit 
      00942D 72 FB 01         [ 2]  211 	addw x,(INCR,sp)
      009430 72 F9 01         [ 2]  212 	addw y,(INCR,sp) 
      009433 90 F6            [ 1]  213 	ld a,(y)
      009435 F7               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009436 89               [ 2]  215 	pushw x 
      009437 CE 00 0E         [ 2]  216 	ldw x,acc16 
      00943A 5A               [ 2]  217 	decw x 
      00943B CF 00 0E         [ 2]  218 	ldw acc16,x 
      00943E 85               [ 2]  219 	popw x 
      00943F 20 E4            [ 2]  220 	jra move_loop
      009441                        221 move_exit:
      0013C1                        222 	_drop VSIZE
      009441 5B 02            [ 2]    1     addw sp,#VSIZE 
      009443 84               [ 1]  223 	pop a 
      009444 81               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      009445                        233 clear_vars:
      009445 89               [ 2]  234 	pushw x 
      009446 88               [ 1]  235 	push a  
      009447 AE 00 35         [ 2]  236 	ldw x,#vars 
      00944A A6 4E            [ 1]  237 	ld a,#CELL_SIZE*26 
      00944C 7F               [ 1]  238 1$:	clr (x)
      00944D 5C               [ 1]  239 	incw x 
      00944E 4A               [ 1]  240 	dec a 
      00944F 26 FB            [ 1]  241 	jrne 1$
      009451 84               [ 1]  242 	pop a 
      009452 85               [ 2]  243 	popw x 
      009453 81               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      009454 0A 0A 54 69 6E 79 20   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      00949A                        255 system_information:
      00949A AE 94 54         [ 2]  256 	ldw x,#software 
      00949D CD 89 B7         [ 4]  257 	call puts 
      0094A0 A6 02            [ 1]  258 	ld a,#MAJOR 
      0094A2 C7 00 0F         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0094A5 5F               [ 1]  260 	clrw x 
      0094A6 CF 00 0D         [ 2]  261 	ldw acc24,x
      0094A9 72 5F 00 24      [ 1]  262 	clr tab_width  
      0094AD 35 0A 00 0B      [ 1]  263 	mov base, #10 
      0094B1 CD 98 78         [ 4]  264 	call prt_acc24 
      0094B4 A6 2E            [ 1]  265 	ld a,#'.
      0094B6 CD 89 5A         [ 4]  266 	call putc 
      0094B9 A6 00            [ 1]  267 	ld a,#MINOR 
      0094BB C7 00 0F         [ 1]  268 	ld acc8,a 
      0094BE 5F               [ 1]  269 	clrw x 
      0094BF CF 00 0D         [ 2]  270 	ldw acc24,x 
      0094C2 CD 98 78         [ 4]  271 	call prt_acc24
      0094C5 A6 0D            [ 1]  272 	ld a,#CR 
      0094C7 CD 89 5A         [ 4]  273 	call putc
                                    274 ;call test 
      0094CA 81               [ 4]  275 	ret
                                    276 
      0094CB                        277 warm_init:
      0094CB 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      0094CF 72 5F 00 23      [ 1]  279 	clr flags 
      0094D3 72 5F 00 20      [ 1]  280 	clr loop_depth 
      0094D7 35 04 00 24      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      0094DB 35 0A 00 0B      [ 1]  282 	mov base,#10 
      0094DF AE 00 00         [ 2]  283 	ldw x,#0 
      0094E2 CF 00 05         [ 2]  284 	ldw basicptr,x 
      0094E5 CF 00 01         [ 2]  285 	ldw in.w,x 
      0094E8 72 5F 00 04      [ 1]  286 	clr count
      0094EC 81               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      0094ED                        293 clear_basic:
      0094ED 89               [ 2]  294 	pushw x 
      0094EE 72 5F 00 04      [ 1]  295 	clr count
      0094F2 72 5F 00 02      [ 1]  296 	clr in  
      0094F6 AE 00 90         [ 2]  297 	ldw x,#free_ram 
      0094F9 CF 00 1C         [ 2]  298 	ldw txtbgn,x 
      0094FC CF 00 1E         [ 2]  299 	ldw txtend,x 
      0094FF CF 00 31         [ 2]  300 	ldw dvar_bgn,x 
      009502 CF 00 33         [ 2]  301 	ldw dvar_end,x 
      009505 CD 94 45         [ 4]  302 	call clear_vars 
      009508 85               [ 2]  303 	popw x
      009509 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00950A                        309 err_msg:
      00950A 00 00 95 2E 95 3B 95   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             49 95 62 95 71
      009516 95 87 95 9D 95 B7 95   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             C8 95 D9
      009520 95 E5 96 18 96 28 96   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal  3C-Bits]



             BC 15 CF
      009528 96 4F 96 5C            313 	.word err_overflow,err_read_only  
                                    314 
      00952C 96 66 4D 65 6D 6F 72   315 err_mem_full: .asciz "Memory full\n" 
             79 20 66 75 6C 6C
      009539 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      009547 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      009560 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      00956F 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      009585 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      00959B 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      0095B5 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      0095C6 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      0095D7 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      0095E3 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      009616 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      009626 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      00963A 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      00964D 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
      00965A 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009664 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
                                    332 
      009680 0A 00 0A 72 75 6E 20   333 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      009692 20 00 0A 63 6F 6D 70   334 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      0096A3 20 00 6C 61 73 74 20   335 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    336 
      001635                        337 syntax_error::
      0096B3 20 00            [ 1]  338 	ld a,#ERR_SYNTAX 
                                    339 
      0096B5                        340 tb_error::
      0096B5 A6 02 00 22 4C   [ 2]  341 	btjt flags,#FCOMP,1$
      0096B7 88               [ 1]  342 	push a 
      0096B7 72 0A 00         [ 2]  343 	ldw x, #rt_msg 
      0096BA 23 4C 88         [ 4]  344 	call puts 
      0096BD AE               [ 1]  345 	pop a 
      0096BE 96 82 CD         [ 2]  346 	ldw x, #err_msg 
      0096C1 89 B7 84 AE      [ 1]  347 	clr acc16 
      0096C5 95               [ 1]  348 	sll a
      0096C6 0A 72 5F 00      [ 1]  349 	rlc acc16  
      0096CA 0E 48 72         [ 1]  350 	ld acc8, a 
      0096CD 59 00 0E C7      [ 2]  351 	addw x,acc16 
      0096D1 00               [ 2]  352 	ldw x,(x)
      0096D2 0F 72 BB         [ 4]  353 	call puts
      0096D5 00 0E FE         [ 2]  354 	ldw x,basicptr 
                           000001   355 .if DEBUG 
      0096D8 CD 89 B7         [ 1]  356 ld a,count 
      0096DB CE 00            [ 1]  357 clrw y 
      0096DD 05 C6            [ 1]  358 rlwa y  
      0096DF 00 04 90         [ 4]  359 call hex_dump
      0096E2 5F 90 02         [ 2]  360 ldw x,basicptr
                                    361 .endif 
      0096E5 CD 86 B2         [ 1]  362 	ld a,in 
      0096E8 CE 00 05         [ 4]  363 	call prt_basic_line
      0096EB C6 00 02         [ 2]  364 	ldw x,#tk_id 
      0096EE CD 9F C9         [ 4]  365 	call puts 
      0096F1 AE 96 A5         [ 1]  366 	ld a,in.saved 
      0096F4 CD               [ 1]  367 	clrw x 
      0096F5 89               [ 1]  368 	ld xl,a 
      0096F6 B7 C6 00 03      [ 2]  369 	addw x,basicptr 
      0096FA 5F               [ 1]  370 	ld a,(x)
      0096FB 97               [ 1]  371 	clrw x 
      0096FC 72               [ 1]  372 	ld xl,a 
      0096FD BB 00 05         [ 4]  373 	call prt_i16
      009700 F6 5F            [ 2]  374 	jra 6$
      001688                        375 1$:	
      009702 97               [ 1]  376 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009703 CD 98 61         [ 2]  377 	ldw x,#comp_msg
      009706 20 35 37         [ 4]  378 	call puts 
      009708 84               [ 1]  379 	pop a 
      009708 88 AE 96         [ 2]  380 	ldw x, #err_msg 
      00970B 94 CD 89 B7      [ 1]  381 	clr acc16 
      00970F 84               [ 1]  382 	sll a
      009710 AE 95 0A 72      [ 1]  383 	rlc acc16  
      009714 5F 00 0E         [ 1]  384 	ld acc8, a 
      009717 48 72 59 00      [ 2]  385 	addw x,acc16 
      00971B 0E               [ 2]  386 	ldw x,(x)
      00971C C7 00 0F         [ 4]  387 	call puts
      00971F 72 BB 00         [ 2]  388 	ldw x,#tib
      009722 0E FE CD         [ 4]  389 	call puts 
      009725 89 B7            [ 1]  390 	ld a,#CR 
      009727 AE 16 90         [ 4]  391 	call putc
      00972A CD 89 B7         [ 2]  392 	ldw x,in.w
      00972D A6 0D CD         [ 4]  393 	call spaces
      009730 89 5A            [ 1]  394 	ld a,#'^
      009732 CE 00 01         [ 4]  395 	call putc 
      009735 CD 8A 24         [ 2]  396 6$: ldw x,#STACK_EMPTY 
      009738 A6               [ 1]  397     ldw sp,x
                                    398 
      0016C1                        399 warm_start:
      009739 5E CD 89         [ 4]  400 	call warm_init
                                    401 ;----------------------------
                                    402 ;   BASIC interpreter
                                    403 ;----------------------------
      0016C4                        404 cmd_line: ; user interface 
      00973C 5A AE            [ 1]  405 	ld a,#CR 
      00973E 17 FF 94         [ 4]  406 	call putc 
      009741 A6 3E            [ 1]  407 	ld a,#'> 
      009741 CD 94 CB         [ 4]  408 	call putc
      009744 CD 0A 3C         [ 4]  409 	call readln
      009744 A6 0D CD 89      [ 1]  410 	tnz count 
      009748 5A A6            [ 1]  411 	jreq cmd_line
      00974A 3E CD 89         [ 4]  412 	call compile
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
      00974D 5A CD 8A BC      [ 1]  426 	tnz count 
      009751 72 5D            [ 1]  427 	jreq cmd_line
                                    428 	
                                    429 ; if direct command 
                                    430 ; it's ready to interpret 
                                    431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                    432 ;; This is the interpreter loop
                                    433 ;; for each BASIC code line. 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016E0                        435 interpreter: 
      009753 00 04 27         [ 1]  436 	ld a,in 
      009756 ED CD 90         [ 1]  437 	cp a,count 
      009759 E5 72            [ 1]  438 	jrmi interp_loop
      0016E8                        439 next_line:
      00975B 5D 00 04 27 E4   [ 2]  440 	btjf flags, #FRUN, cmd_line
      009760 CE 00 04         [ 2]  441 	ldw x,basicptr
      009760 C6 00 02 C1      [ 2]  442 	addw x,in.w 
      009764 00 04 2B         [ 2]  443 	cpw x,txtend 
      009767 1D C8            [ 1]  444 	jrpl warm_start
      009768 CF 00 04         [ 2]  445 	ldw basicptr,x ; start of next line  
      009768 72 01            [ 1]  446 	ld a,(2,x)
      00976A 00 23 D7         [ 1]  447 	ld count,a 
      00976D CE 00 05 72      [ 1]  448 	mov in,#3 ; skip first 3 bytes of line 
      001705                        449 interp_loop:
      009771 BB 00 01         [ 4]  450 	call next_token
      009774 C3 00            [ 1]  451 	cp a,#TK_NONE 
      009776 1E 2A            [ 1]  452 	jreq next_line 
      009778 C8 CF            [ 1]  453 	cp a,#TK_CMD
      00977A 00 05            [ 1]  454 	jrne 1$
      001710                        455 	_get_code_addr
      00977C E6               [ 2]    1         ldw x,(x)
      00977D 02 C7 00 04      [ 1]    2         inc in 
      009781 35 03 00 02      [ 1]    3         inc in 
      009785 FD               [ 4]  456 	call(x)
      009785 CD 98            [ 2]  457 	jra interp_loop 
      00171C                        458 1$:	 
      009787 19 A1            [ 1]  459 	cp a,#TK_VAR
      009789 00 27            [ 1]  460 	jrne 2$
      00978B DC A1 80         [ 4]  461 	call let_var  
      00978E 26 0C            [ 2]  462 	jra interp_loop 
      001725                        463 2$:	
      009790 FE 72            [ 1]  464 	cp a,#TK_ARRAY 
      009792 5C 00            [ 1]  465 	jrne 3$
      009794 02 72 5C         [ 4]  466 	call let_array 
      009797 00 02            [ 2]  467 	jra interp_loop
      00172E                        468 3$:	
      009799 FD 20            [ 1]  469 	cp a,#TK_LABEL
      00979B E9 05            [ 1]  470 	jrne 4$
      00979C CD 17 3E         [ 4]  471 	call let_dvar  
      00979C A1 85            [ 2]  472 	jra interp_loop 
      001737                        473 4$: 
      00979E 26 05            [ 1]  474 	cp a,#TK_COLON 
      0097A0 CD 9D            [ 1]  475 	jreq interp_loop
      0097A2 10 20 E0         [ 2]  476 5$:	jp syntax_error 
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
      0097A5                        489 let_dvar:
      00173E                        490 	_vars VSIZE 
      0097A5 A1 05            [ 2]    1     sub sp,#VSIZE 
      0097A7 26 05            [ 2]  491 	ldw (VAR_NAME,sp),x
      0097A9 CD 9D            [ 1]  492 	clr (REC_LEN,sp) 
      0097AB 0B 20 D7         [ 4]  493 	call skip_string 
      0097AE CE 00 04         [ 2]  494 	ldw x,basicptr 
      0097AE A1 03 26 05      [ 2]  495 	addw x,in.w 
      0097B2 CD               [ 1]  496 	ld a,(x)
      0097B3 97 BE            [ 1]  497 	cp a,#TK_EQUAL 
      0097B5 20 CE            [ 1]  498 	jrne 9$ 
                                    499 ; dvar assignment 
      0097B7 72 5C 00 01      [ 1]  500 	inc in  
      0097B7 A1 0A 27         [ 4]  501 	call condition  
      0097BA CA CC            [ 1]  502 	cp a,#TK_INTGR 
      0097BC 96 B5            [ 1]  503 	jreq 1$ 
      0097BE CC 16 35         [ 2]  504 0$:	jp syntax_error 
      001761                        505 1$: 
      0097BE 52 04            [ 2]  506 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      0097C0 1F 01 0F         [ 4]  507 	call strlen 
      0097C3 03 CD            [ 1]  508 	add a,#REC_XTRA_BYTES
      0097C5 98 32            [ 1]  509 	ld (REC_LEN+1,sp),a 
      0097C7 CE 00 05         [ 4]  510 	call search_name 
      0097CA 72               [ 2]  511 	tnzw x 
      0097CB BB 00            [ 1]  512 	jreq 0$ 
      0097CD 01               [ 1]  513 	ld a,(x)
      0097CE F6 A1            [ 1]  514 	jrpl 2$
      0097D0 32 26            [ 1]  515 	ld a,#ERR_RD_ONLY 
      0097D2 43 72 5C         [ 2]  516 	jp tb_error 
      001778                        517 2$:
      0097D5 00 02 CD         [ 2]  518 	addw x,(REC_LEN,sp)
      0097D8 9C 3E A1         [ 2]  519 	subw x,#CELL_SIZE 
      0097DB 84 27 03         [ 2]  520 	ldw ptr16,x
      001781                        521 	_xpop 
      0097DE CC 96            [ 1]    1     ld a,(y)
      0097E0 B5               [ 1]    2     ldw x,y 
      0097E1 EE 01            [ 2]    3     ldw x,(1,x)
      0097E1 1E 01 CD 93      [ 2]    4     addw y,#CELL_SIZE 
      0097E5 D5 AB 05 6B      [ 4]  522 	ld [ptr16],a 
      0097E9 04 CD 9D 7A      [ 1]  523 	inc ptr8 
      0097ED 5D 27 EE F6      [ 5]  524 	ldw [ptr16],x 
      001796                        525 9$: _drop VSIZE 	
      0097F1 2A 05            [ 2]    1     addw sp,#VSIZE 
      0097F3 A6               [ 4]  526 	ret 
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
      001799                        538 next_token::
                                    539 ;	clrw x 
      0097F4 11 CC 96         [ 1]  540 	ld a,in 
      0097F7 B7 00 02         [ 1]  541 	ld in.saved,a ; in case "_unget_token" needed 
                                    542 ; don't replace sub by "cp a,count" 
                                    543 ; if end of line must return with A=0   	
      0097F8 C0 00 03         [ 1]  544 	sub a,count 
      0097F8 72 FB            [ 1]  545 	jreq 9$ ; end of line 
      0017A4                        546 0$: 
      0097FA 03 1D 00         [ 2]  547 	ldw x,basicptr 
      0097FD 03 CF 00 1A      [ 2]  548 	addw x,in.w 
      009801 90               [ 1]  549 	ld a,(x)
      009802 F6               [ 1]  550 	incw x
      009803 93 EE 01 72      [ 1]  551 	inc in   
      009807 A9               [ 4]  552 9$: ret 
                                    553 
                                    554 ;-------------------------
                                    555 ;  skip .asciz in BASIC line 
                                    556 ;  name 
                                    557 ;  input:
                                    558 ;     x		* string 
                                    559 ;  output:
                                    560 ;     none 
                                    561 ;-------------------------
      0017B2                        562 skip_string:
      009808 00               [ 1]  563 	ld a,(x)
      009809 03 72            [ 1]  564 	jreq 1$
      00980B C7               [ 1]  565 	incw x 
      00980C 00 1A            [ 2]  566 	jra skip_string 
      00980E 72               [ 1]  567 1$: incw x 	
      00980F 5C 00 1B 72      [ 2]  568 	subw x,basicptr 
      009813 CF 00 1A         [ 2]  569 	ldw in.w,x 
      009816 5B               [ 4]  570 	ret 
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
      0017C1                        581 get_addr:
      009817 04               [ 2]  582 	ldw x,(x)
      009818 81 5C 00 01      [ 1]  583 	inc in 
      009819 72 5C 00 01      [ 1]  584 	inc in 
      009819 C6               [ 4]  585 	ret 
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
      0017CB                        596 get_int24:
      00981A 00               [ 1]  597 	ld a,(x)
      00981B 02 C7            [ 2]  598 	ldw x,(1,x)
                                    599 ; skip 3 bytes 
      00981D 00 03 C0 00      [ 1]  600 	inc in 
      009821 04 27 0D 01      [ 1]  601 	inc in 
      009824 72 5C 00 01      [ 1]  602 	inc in 
      009824 CE               [ 4]  603 	ret 
                                    604 
                                    605 ;-------------------------
                                    606 ; get character from 
                                    607 ; BASIC code 
                                    608 ; input:
                                    609 ;    X   *char 
                                    610 ; output:
                                    611 ;    A    char 
                                    612 ;-------------------------
      0017DB                        613 get_char:
      009825 00               [ 1]  614 	ld a,(x)
      009826 05 72 BB 00      [ 1]  615 	inc in  
      00982A 01               [ 4]  616     ret 
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
      0017E1                        628 prt_i16:
      00982B F6 5C 72 5C      [ 1]  629 	clr acc24 
      00982F 00 02 81         [ 2]  630 	ldw acc16,x 
      009832 A6 10            [ 1]  631 	ld a,#16
      009832 F6 27 03         [ 1]  632 	cp a,base
      009835 5C 20            [ 1]  633 	jreq prt_acc24  
      009837 FA 5C 72 B0 00   [ 2]  634 	btjf acc16,#7,prt_acc24
      00983C 05 CF 00 01      [ 1]  635 	cpl acc24 ; sign extend 
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
      0017F8                        647 prt_acc24:
      009840 81 FF            [ 1]  648 	ld a,#255  ; signed conversion  
      009841 CD 18 1E         [ 4]  649     call itoa  ; conversion entier en  .asciz
      009841 FE 72 5C         [ 4]  650 	call right_align  
      009844 00               [ 1]  651 	push a 
      009845 02 72 5C         [ 4]  652 	call puts
      009848 00               [ 1]  653 	pop a 
      009849 02               [ 4]  654     ret	
                                    655 
                                    656 ;---------------------------------------
                                    657 ;  print value at xstack top 
                                    658 ;---------------------------------------
      001806                        659 print_top: 
      001806                        660 	_xpop 
      00984A 81 F6            [ 1]    1     ld a,(y)
      00984B 93               [ 1]    2     ldw x,y 
      00984B F6 EE            [ 2]    3     ldw x,(1,x)
      00984D 01 72 5C 00      [ 2]    4     addw y,#CELL_SIZE 
      009851 02 72 5C         [ 1]  661 	ld acc24,a 
      009854 00 02 72         [ 2]  662 	ldw acc16,x 
      009857 5C 00 02         [ 4]  663 	call prt_acc24 
      00985A 81 20            [ 1]  664 	ld a,#SPACE
      00985B CD 08 DA         [ 4]  665 	call putc 
      00985B F6               [ 4]  666 	ret 
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
      00181E                        682 itoa::
      00181E                        683 	_vars VSIZE
      00985C 72 5C            [ 2]    1     sub sp,#VSIZE 
      00985E 00 02            [ 1]  684 	clr (LEN,sp) ; string length  
      009860 81 01            [ 1]  685 	clr (SIGN,sp)    ; sign
      009861 4D               [ 1]  686 	tnz A
      009861 72 5F            [ 1]  687 	jreq 1$ ; unsigned conversion  
      009863 00 0D CF         [ 1]  688 	ld a,base 
      009866 00 0E            [ 1]  689 	cp a,#10
      009868 A6 10            [ 1]  690 	jrne 1$
                                    691 	; base 10 string display with negative sign if bit 23==1
      00986A C1 00 0B 27 09   [ 2]  692 	btjf acc24,#7,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00986F 72 0F            [ 1]  693 	cpl (SIGN,sp)
      009871 00 0E 04         [ 4]  694 	call neg_acc24
      001838                        695 1$:
                                    696 ; initialize string pointer 
      009874 72 53 00         [ 2]  697 	ldw x,#tib 
      009877 0D 00 50         [ 2]  698 	addw x,#TIB_SIZE
      009878 5A               [ 2]  699 	decw x 
      009878 A6               [ 1]  700 	clr (x)
      001840                        701 itoa_loop:
      009879 FF CD 98         [ 1]  702     ld a,base
      00987C 9E CD 91         [ 4]  703     call divu24_8 ; acc24/A 
      00987F 8F 88            [ 1]  704     add a,#'0  ; remainder of division
      009881 CD 89            [ 1]  705     cp a,#'9+1
      009883 B7 84            [ 1]  706     jrmi 2$
      009885 81 07            [ 1]  707     add a,#7 
      009886                        708 2$:	
      009886 90               [ 2]  709 	decw x
      009887 F6               [ 1]  710     ld (x),a
      009888 93 EE            [ 1]  711 	inc (LEN,sp)
                                    712 	; if acc24==0 conversion done
      00988A 01 72 A9         [ 1]  713 	ld a,acc24
      00988D 00 03 C7         [ 1]  714 	or a,acc16
      009890 00 0D CF         [ 1]  715 	or a,acc8
      009893 00 0E            [ 1]  716     jrne itoa_loop
                                    717 	;conversion done, next add '$' or '-' as required
      009895 CD 98 78         [ 1]  718 	ld a,base 
      009898 A6 20            [ 1]  719 	cp a,#16
      00989A CD 89            [ 1]  720 	jreq 8$
      00989C 5A 81            [ 1]  721 	ld a,(SIGN,sp)
      00989E 27 0A            [ 1]  722     jreq 10$
      00989E 52 04            [ 1]  723     ld a,#'-
      0098A0 0F 02            [ 2]  724 	jra 9$ 
      00186C                        725 8$:	
      0098A2 0F 01            [ 1]  726 	ld a,#'$ 
      0098A4 4D               [ 2]  727 9$: decw x
      0098A5 27               [ 1]  728     ld (x),a
      0098A6 11 C6            [ 1]  729 	inc (LEN,sp)
      001872                        730 10$:
      0098A8 00 0B            [ 1]  731 	ld a,(LEN,sp)
      001874                        732 	_drop VSIZE
      0098AA A1 0A            [ 2]    1     addw sp,#VSIZE 
      0098AC 26               [ 4]  733 	ret
                                    734 
                                    735 ;------------------------------------
                                    736 ; convert alpha to uppercase
                                    737 ; input:
                                    738 ;    a  character to convert
                                    739 ; output:
                                    740 ;    a  uppercase character
                                    741 ;------------------------------------
      001877                        742 to_upper::
      0098AD 0A 72            [ 1]  743 	cp a,#'a
      0098AF 0F 00            [ 1]  744 	jrpl 1$
      0098B1 0D               [ 4]  745 0$:	ret
      0098B2 05 03            [ 1]  746 1$: cp a,#'z	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0098B4 01 CD            [ 1]  747 	jrugt 0$
      0098B6 82 8A            [ 1]  748 	sub a,#32
      0098B8 81               [ 4]  749 	ret
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
      001883                        764 atoi24::
      001883                        765 	_vars VSIZE
      0098B8 AE 16            [ 2]    1     sub sp,#VSIZE 
      0098BA 90 1C            [ 2]  766 	ldw (XTEMP,sp),x 
                                    767 ; conversion made on xstack 
      0098BC 00               [ 1]  768 	clr a 
      0098BD 50               [ 1]  769 	clrw x 
      001889                        770 	_xpush 
      0098BE 5A 7F 00 03      [ 2]    1     subw y,#CELL_SIZE
      0098C0 90 F7            [ 1]    2     ld (y),a 
      0098C0 C6 00 0B         [ 2]    3     ldw (1,y),x 
      0098C3 CD 83            [ 1]  771 	clr (SIGN,sp)
      0098C5 56 AB            [ 1]  772 	ld a,#10
      0098C7 30 A1            [ 1]  773 	ld (BASE,sp),a ; default base decimal
      0098C9 3A 2B            [ 2]  774 	ldw x,(XTEMP,sp)
      0098CB 02               [ 1]  775 	ld a,(x)
      0098CC AB 07            [ 1]  776 	jreq 9$  ; completed if 0
      0098CE A1 2D            [ 1]  777 	cp a,#'-
      0098CE 5A F7            [ 1]  778 	jrne 1$
      0098D0 0C 02            [ 1]  779 	cpl (SIGN,sp)
      0098D2 C6 00            [ 2]  780 	jra 2$
      0098D4 0D CA            [ 1]  781 1$: cp a,#'$
      0098D6 00 0E            [ 1]  782 	jrne 3$
      0098D8 CA 00            [ 1]  783 	ld a,#16
      0098DA 0F 26            [ 1]  784 	ld (BASE,sp),a
      0098DC E3               [ 1]  785 2$:	incw x
      0098DD C6 00            [ 2]  786 	ldw (XTEMP,sp),x 
      0098DF 0B               [ 1]  787 	ld a,(x)
      0018B1                        788 3$:	; char to digit 
      0098E0 A1 10            [ 1]  789 	cp a,#'a
      0098E2 27 08            [ 1]  790 	jrmi 4$
      0098E4 7B 01            [ 1]  791 	sub a,#32
      0098E6 27 0A            [ 1]  792 4$:	cp a,#'0
      0098E8 A6 2D            [ 1]  793 	jrmi 9$
      0098EA 20 02            [ 1]  794 	sub a,#'0
      0098EC A1 0A            [ 1]  795 	cp a,#10
      0098EC A6 24            [ 1]  796 	jrmi 5$
      0098EE 5A F7            [ 1]  797 	sub a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0098F0 0C 02            [ 1]  798 	cp a,(BASE,sp)
      0098F2 2A 24            [ 1]  799 	jrpl 9$
      0098F2 7B 02            [ 1]  800 5$:	ld (TEMP,sp),a
      0098F4 5B 04            [ 1]  801 	ld a,(BASE,sp)
      0098F6 81 02 27         [ 4]  802 	call mulu24_8
      0098F7                        803 	_xpush 
      0098F7 A1 61 2A 01      [ 2]    1     subw y,#CELL_SIZE
      0098FB 81 A1            [ 1]    2     ld (y),a 
      0098FD 7A 22 FB         [ 2]    3     ldw (1,y),x 
      009900 A0               [ 1]  804 	clrw x 
      009901 20 81            [ 1]  805 	ld a,(TEMP,sp)
      009903 02               [ 1]  806 	rlwa x 
      0018DB                        807 	_xpush 
      009903 52 05 1F 04      [ 2]    1     subw y,#CELL_SIZE
      009907 4F 5F            [ 1]    2     ld (y),a 
      009909 72 A2 00         [ 2]    3     ldw (1,y),x 
      00990C 03 90 F7         [ 4]  808 	call add24 
      00990F 90 EF            [ 2]  809 	ldw x,(XTEMP,sp)
      009911 01 0F            [ 2]  810 	jra 2$
      009913 01 A6            [ 1]  811 9$:	tnz (SIGN,sp)
      009915 0A 6B            [ 1]  812     jreq atoi_exit
      009917 02 1E 04         [ 4]  813     call neg24
      0018F2                        814 atoi_exit:
      0018F2                        815 	_xpop 
      00991A F6 27            [ 1]    1     ld a,(y)
      00991C 4E               [ 1]    2     ldw x,y 
      00991D A1 2D            [ 2]    3     ldw x,(1,x)
      00991F 26 04 03 01      [ 2]    4     addw y,#CELL_SIZE 
      009923 20 08 A1         [ 1]  816 	ld acc24,a 
      009926 24 26 08         [ 2]  817 	ldw acc16,x  
      001901                        818 	_drop VSIZE
      009929 A6 10            [ 2]    1     addw sp,#VSIZE 
      00992B 6B               [ 4]  819 	ret
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
      001904                        840 search_dict::
      001904                        841 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00992C 02 5C            [ 2]    1     sub sp,#VSIZE 
      00992E 1F 04            [ 2]  842 	ldw (YSAVE,sp),y 
      001908                        843 search_next:
      009930 F6 02            [ 2]  844 	ldw (XSAVE,sp),x 
                                    845 ; get name length in dictionary	
      009931 F6               [ 1]  846 	ld a,(x)
      009931 A1 61            [ 1]  847 	and a,#0xf 
      009933 2B 02            [ 1]  848 	ld (NLEN,sp),a  
      009935 A0 20            [ 2]  849 	ldw y,(YSAVE,sp) ; name pointer 
      009937 A1               [ 1]  850 	incw x 
      001912                        851 cp_loop:
      009938 30 2B            [ 1]  852 	ld a,(y)
      00993A 30 A0            [ 1]  853 	jreq str_match 
      00993C 30 A1            [ 1]  854 	tnz (NLEN,sp)
      00993E 0A 2B            [ 1]  855 	jreq no_match  
      009940 06               [ 1]  856 	cp a,(x)
      009941 A0 07            [ 1]  857 	jrne no_match 
      009943 11 02            [ 1]  858 	incw y 
      009945 2A               [ 1]  859 	incw x
      009946 24 6B            [ 1]  860 	dec (NLEN,sp)
      009948 03 7B            [ 2]  861 	jra cp_loop 
      001924                        862 no_match:
      00994A 02 CD            [ 2]  863 	ldw x,(XSAVE,sp) 
      00994C 82 A7 72         [ 2]  864 	subw x,#2 ; move X to link field
      00994F A2 00            [ 1]  865 	push #TK_NONE 
      009951 03               [ 2]  866 	ldw x,(x) ; next word link 
      009952 90               [ 1]  867 	pop a ; TK_NONE 
      009953 F7 90            [ 1]  868 	jreq search_exit  ; not found  
                                    869 ;try next 
      009955 EF 01            [ 2]  870 	jra search_next
      001931                        871 str_match:
      009957 5F 7B            [ 2]  872 	ldw x,(XSAVE,sp)
      009959 03               [ 1]  873 	ld a,(X)
      00995A 02 72            [ 1]  874 	ld (NLEN,sp),a ; needed to test keyword type  
      00995C A2 00            [ 1]  875 	and a,#NLEN_MASK 
                                    876 ; move x to procedure address field 	
      00995E 03               [ 1]  877 	inc a 
      00995F 90 F7 90         [ 1]  878 	ld acc8,a 
      009962 EF 01 CD 81      [ 1]  879 	clr acc16 
      009966 EB 1E 04 20      [ 2]  880 	addw x,acc16 
      00996A C2               [ 2]  881 	ldw x,(x) ; routine address  
                                    882 ;determine keyword type bits 7:4 
      00996B 0D 01            [ 1]  883 	ld a,(NLEN,sp)
      00996D 27 03            [ 1]  884 	and a,#KW_TYPE_MASK 
      00996F CD               [ 1]  885 	swap a 
      009970 82 70            [ 1]  886 	add a,#128
      009972                        887 search_exit: 
      00194C                        888 	_drop VSIZE 
      009972 90 F6            [ 2]    1     addw sp,#VSIZE 
      009974 93               [ 4]  889 	ret 
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
      00194F                        899 expect:
      009975 EE               [ 1]  900 	push a 
      009976 01 72 A9         [ 4]  901 	call next_token 
      009979 00 03            [ 1]  902 	cp a,(1,sp)
      00997B C7 00            [ 1]  903 	jreq 1$
      00997D 0D CF 00         [ 2]  904 	jp syntax_error
      009980 0E               [ 1]  905 1$: pop a 
      009981 5B               [ 4]  906 	ret 
                                    907 
                                    908 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    909 ; parse arguments list 
                                    910 ; between ()
                                    911 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00195C                        912 func_args:
      009982 05 81            [ 1]  913 	ld a,#TK_LPAREN 
      009984 CD 19 4F         [ 4]  914 	call expect 
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
      001961                        930 arg_list:
      009984 52 05            [ 1]  931 	push #0
      009986 17 04 BE         [ 4]  932 1$:	call condition 
      009988 4D               [ 1]  933 	tnz a 
      009988 1F 02            [ 1]  934 	jreq 7$  
      00998A F6 A4            [ 1]  935 	inc (1,sp)
      00998C 0F 6B 01         [ 4]  936 	call next_token 
      00998F 16 04            [ 1]  937 	cp a,#TK_COMMA 
      009991 5C F1            [ 1]  938 	jreq 1$ 
      009992 A1 07            [ 1]  939 	cp a,#TK_RPAREN
      009992 90 F6            [ 1]  940 	jreq 7$
      001976                        941 	_unget_token 
      009994 27 1B 0D 01 27   [ 1]    1      mov in,in.saved  
      009999 0A               [ 1]  942 7$:	pop a  
      00999A F1               [ 4]  943 	ret 
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
      00197D                        971 get_array_element:
      00999B 26 07 90         [ 4]  972 	call func_args 
      00999E 5C 5C            [ 1]  973 	cp a,#1
      0099A0 0A 01            [ 1]  974 	jreq 1$
      0099A2 20 EE 35         [ 2]  975 	jp syntax_error
      0099A4                        976 1$: _xpop 
      0099A4 1E 02            [ 1]    1     ld a,(y)
      0099A6 1D               [ 1]    2     ldw x,y 
      0099A7 00 02            [ 2]    3     ldw x,(1,x)
      0099A9 4B 00 FE 84      [ 2]    4     addw y,#CELL_SIZE 
                                    977     ; ignore A, index < 65536 in any case 
                                    978 	; check for bounds 
      0099AD 27 1D 20         [ 2]  979 	cpw x,array_size 
      0099B0 D7 05            [ 2]  980 	jrule 3$
                                    981 ; bounds {1..array_size}	
      0099B1 A6 0A            [ 1]  982 2$: ld a,#ERR_BAD_VALUE 
      0099B1 1E 02 F6         [ 2]  983 	jp tb_error 
      0099B4 6B               [ 2]  984 3$: tnzw  x
      0099B5 01 A4            [ 1]  985 	jreq 2$ 
      0099B7 0F               [ 2]  986 	pushw x 
      0099B8 4C               [ 2]  987 	sllw x 
      0099B9 C7 00 0F         [ 2]  988 	addw x,(1,sp) ; index*size_of(int24)
      0099BC 72 5F            [ 2]  989 	ldw (1,sp),x  
      0099BE 00 0E 72         [ 2]  990 	ldw x,#tib ; array is below tib 
      0099C1 BB 00 0E         [ 2]  991 	subw x,(1,sp)
      0019AA                        992 	_drop 2   
      0099C4 FE 7B            [ 2]    1     addw sp,#2 
      0099C6 01               [ 4]  993 	ret 
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
      0019AD                       1009 factor:
      0019AD                       1010 	_vars VSIZE 
      0099C7 A4 F0            [ 2]    1     sub sp,#VSIZE 
      0099C9 4E AB            [ 1] 1011 	clr (NEG,sp)
      0099CB 80 17 99         [ 4] 1012 	call next_token
      0099CC 4D               [ 1] 1013 	tnz a 
      0099CC 5B 05            [ 1] 1014 	jrne 1$ 
      0099CE 81 1A 5F         [ 2] 1015 	jp 22$ 
      0099CF A1 10            [ 1] 1016 1$:	cp a,#TK_PLUS 
      0099CF 88 CD            [ 1] 1017 	jreq 2$
      0099D1 98 19            [ 1] 1018 	cp a,#TK_MINUS 
      0099D3 11 01            [ 1] 1019 	jrne 4$ 
      0099D5 27 03            [ 1] 1020 	cpl (NEG,sp)
      0019C4                       1021 2$:	
      0099D7 CC 96 B5         [ 4] 1022 	call next_token
      0019C7                       1023 4$:
      0099DA 84               [ 1] 1024 	tnz a 
      0099DB 81 03            [ 1] 1025 	jrne 41$ 
      0099DC CC 16 35         [ 2] 1026 	jp syntax_error  
      0019CD                       1027 41$:	
      0099DC A6 06            [ 1] 1028 	cp a,#TK_IFUNC 
      0099DE CD 99            [ 1] 1029 	jrne 5$ 
      0019D1                       1030 	_get_code_addr 
      0099E0 CF               [ 2]    1         ldw x,(x)
      0099E1 72 5C 00 01      [ 1]    2         inc in 
      0099E1 4B 00 CD 9C      [ 1]    3         inc in 
      0099E5 3E               [ 4] 1031 	call (x); result in A:X  
      0099E6 4D 27            [ 2] 1032 	jra 18$ 
      0019DD                       1033 5$:
      0099E8 12 0C            [ 1] 1034 	cp a,#TK_INTGR
      0099EA 01 CD            [ 1] 1035 	jrne 6$
      0099EC 98 19 A1         [ 4] 1036 	call get_int24 ; A:X
      0099EF 08 27            [ 2] 1037 	jra 18$
      0019E6                       1038 6$:
      0099F1 F1 A1            [ 1] 1039 	cp a,#TK_ARRAY
      0099F3 07 27            [ 1] 1040 	jrne 7$
      0099F5 05 55 00         [ 4] 1041 	call get_array_element
      0099F8 03 00            [ 2] 1042     jra 71$
      0019EF                       1043 7$:
      0099FA 02 84            [ 1] 1044 	cp a,#TK_VAR 
      0099FC 81 08            [ 1] 1045 	jrne 8$
      0099FD CD 17 C1         [ 4] 1046 	call get_addr 
      0019F6                       1047 71$: ; put value in A:X
      0099FD CD               [ 1] 1048 	ld a,(x)
      0099FE 99 DC            [ 2] 1049 	ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009A00 A1 01            [ 2] 1050 	jra 18$
      0019FB                       1051 8$:
      009A02 27 03            [ 1] 1052 	cp a,#TK_LABEL 
      009A04 CC 96            [ 1] 1053 	jrne 9$
      009A06 B5 90            [ 2] 1054 	pushw y  
      009A08 F6               [ 2] 1055 	pushw x 
      009A09 93 EE 01         [ 4] 1056 	call skip_string
      009A0C 72               [ 2] 1057 	popw x  
      009A0D A9 00 03         [ 4] 1058 	call strlen 
      009A10 C3 00            [ 1] 1059 	add a,#REC_XTRA_BYTES
      009A12 21 23 05         [ 4] 1060 	call search_name
      009A15 A6               [ 2] 1061 	tnzw x 
      009A16 0A CC            [ 1] 1062 	jrne 82$ 
      009A18 96 B7            [ 2] 1063 	popw y 
      009A1A 5D 27            [ 2] 1064 	jra 16$
      001A15                       1065 82$:
      009A1C F8 89            [ 2] 1066 	popw y   
      009A1E 58 72 FB         [ 4] 1067 	call get_value ; in A:X 
      009A21 01 1F            [ 2] 1068 	jra 18$
      001A1C                       1069 9$: 
      009A23 01 AE            [ 1] 1070 	cp a,#TK_CFUNC 
      009A25 16 90            [ 1] 1071 	jrne 12$
      001A20                       1072 	_get_code_addr 
      009A27 72               [ 2]    1         ldw x,(x)
      009A28 F0 01 5B 02      [ 1]    2         inc in 
      009A2C 81 5C 00 01      [ 1]    3         inc in 
      009A2D FD               [ 4] 1073 	call(x)
      009A2D 52               [ 1] 1074 	clrw x 
      009A2E 01               [ 1] 1075 	rlwa x  ; char>int24 in A:X 
      009A2F 0F 01            [ 2] 1076 	jra 18$ 	 
      001A2E                       1077 12$:			
      009A31 CD 98            [ 1] 1078 	cp a,#TK_LPAREN
      009A33 19 4D            [ 1] 1079 	jrne 16$
      009A35 26 03 CC         [ 4] 1080 	call expression
      009A38 9A DF            [ 1] 1081 	ld a,#TK_RPAREN 
      009A3A A1 10 27         [ 4] 1082 	call expect
      001A3A                       1083 	_xpop 
      009A3D 06 A1            [ 1]    1     ld a,(y)
      009A3F 11               [ 1]    2     ldw x,y 
      009A40 26 05            [ 2]    3     ldw x,(1,x)
      009A42 03 01 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009A44 20 08            [ 2] 1084 	jra 18$	
      001A45                       1085 16$:
      001A45                       1086 	_unget_token 
      009A44 CD 98 19 00 01   [ 1]    1      mov in,in.saved  
      009A47 4F               [ 1] 1087 	clr a 
      009A47 4D 26            [ 2] 1088 	jra 22$ 
      001A4D                       1089 18$: 
      009A49 03 CC            [ 1] 1090 	tnz (NEG,sp)
      009A4B 96 B5            [ 1] 1091 	jreq 20$
      009A4D CD 02 02         [ 4] 1092 	call neg_ax   
      001A54                       1093 20$:
      001A54                       1094 	_xpush 
      009A4D A1 81 26 0C      [ 2]    1     subw y,#CELL_SIZE
      009A51 FE 72            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009A53 5C 00 02         [ 2]    3     ldw (1,y),x 
      009A56 72 5C            [ 1] 1095 	ld a,#TK_INTGR
      001A5F                       1096 22$:
      001A5F                       1097 	_drop VSIZE
      009A58 00 02            [ 2]    1     addw sp,#VSIZE 
      009A5A FD               [ 4] 1098 	ret
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
      001A62                       1109 term:
      001A62                       1110 	_vars VSIZE
      009A5B 20 70            [ 2]    1     sub sp,#VSIZE 
                                   1111 ; first factor 	
      009A5D CD 19 AD         [ 4] 1112 	call factor
      009A5D A1               [ 1] 1113 	tnz a 
      009A5E 84 26            [ 1] 1114 	jreq term_exit  
      001A6A                       1115 term01:	 ; check for  operator '*'|'/'|'%' 
      009A60 05 CD 98         [ 4] 1116 	call next_token
      009A63 4B 20            [ 1] 1117 	ld (MULOP,sp),a
      009A65 67 30            [ 1] 1118 	and a,#TK_GRP_MASK
      009A66 A1 20            [ 1] 1119 	cp a,#TK_GRP_MULT
      009A66 A1 05            [ 1] 1120 	jreq 1$
      009A68 26 05            [ 1] 1121 	ld a,#TK_INTGR
      001A77                       1122 	_unget_token 
      009A6A CD 99 FD 20 07   [ 1]    1      mov in,in.saved  
      009A6F 20 24            [ 2] 1123 	jra term_exit 
      001A7E                       1124 1$:	; got *|/|%
                                   1125 ;second factor
      009A6F A1 85 26         [ 4] 1126 	call factor
      009A72 08               [ 1] 1127 	tnz a 
      009A73 CD 98            [ 1] 1128 	jrne 2$ 
      009A75 41 16 35         [ 2] 1129 	jp syntax_error 
      009A76                       1130 2$: ; select operation 	
      009A76 F6 EE            [ 1] 1131 	ld a,(MULOP,sp) 
      009A78 01 20            [ 1] 1132 	cp a,#TK_MULT 
      009A7A 52 05            [ 1] 1133 	jrne 3$
                                   1134 ; '*' operator
      009A7B CD 02 66         [ 4] 1135 	call mul24 
      009A7B A1 03            [ 2] 1136 	jra term01
      009A7D 26 1D            [ 1] 1137 3$: cp a,#TK_DIV 
      009A7F 90 89            [ 1] 1138 	jrne 4$ 
                                   1139 ; '/' operator	
      009A81 89 CD 98         [ 4] 1140 	call div24 
      009A84 32 85            [ 2] 1141 	jra term01 
      001A9B                       1142 4$: ; '%' operator
      009A86 CD 93 D5         [ 4] 1143 	call mod24
      009A89 AB 05            [ 2] 1144 	jra term01 
      001AA0                       1145 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009A8B CD 9D            [ 1] 1146 	ld a,#TK_INTGR
      001AA2                       1147 term_exit:
      001AA2                       1148 	_drop VSIZE 
      009A8D 7A 5D            [ 2]    1     addw sp,#VSIZE 
      009A8F 26               [ 4] 1149 	ret 
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
      001AA5                       1160 expression:
      001AA5                       1161 	_vars VSIZE 
      009A90 04 90            [ 2]    1     sub sp,#VSIZE 
                                   1162 ; first term 	
      009A92 85 20 30         [ 4] 1163 	call term
      009A95 4D               [ 1] 1164 	tnz a 
      009A95 90 85            [ 1] 1165 	jreq 9$
      001AAD                       1166 1$:	; operator '+'|'-'
      009A97 CD 9D 40         [ 4] 1167 	call next_token
      009A9A 20 31            [ 1] 1168 	ld (OP,sp),a 
      009A9C A4 30            [ 1] 1169 	and a,#TK_GRP_MASK
      009A9C A1 82            [ 1] 1170 	cp a,#TK_GRP_ADD 
      009A9E 26 0E            [ 1] 1171 	jreq 2$ 
      001AB8                       1172 	_unget_token 
      009AA0 FE 72 5C 00 02   [ 1]    1      mov in,in.saved  
      009AA5 72 5C            [ 1] 1173 	ld a,#TK_INTGR
      009AA7 00 02            [ 2] 1174 	jra 9$ 
      001AC1                       1175 2$: ; second term 
      009AA9 FD 5F 02         [ 4] 1176 	call term
      009AAC 20               [ 1] 1177 	tnz a 
      009AAD 1F 03            [ 1] 1178 	jrne 3$
      009AAE CC 16 35         [ 2] 1179 	jp syntax_error
      001ACA                       1180 3$:
      009AAE A1 06            [ 1] 1181 	ld a,(OP,sp)
      009AB0 26 13            [ 1] 1182 	cp a,#TK_PLUS 
      009AB2 CD 9B            [ 1] 1183 	jrne 4$
                                   1184 ; '+' operator	
      009AB4 25 A6 07         [ 4] 1185 	call add24
      009AB7 CD 99            [ 2] 1186 	jra 1$ 
      001AD5                       1187 4$:	; '-' operator 
      009AB9 CF 90 F6         [ 4] 1188 	call sub24
      009ABC 93 EE            [ 2] 1189 	jra 1$
      001ADA                       1190 9$:
      001ADA                       1191 	_drop VSIZE 
      009ABE 01 72            [ 2]    1     addw sp,#VSIZE 
      009AC0 A9               [ 4] 1192 	ret 
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
      001ADD                       1203 relation: 
      001ADD                       1204 	_vars VSIZE
      009AC1 00 03            [ 2]    1     sub sp,#VSIZE 
      009AC3 20 08 A5         [ 4] 1205 	call expression
      009AC5 4D               [ 1] 1206 	tnz a 
      009AC5 55 00            [ 1] 1207 	jreq 9$ 
                                   1208 ; expect rel_op or leave 
      009AC7 03 00 02         [ 4] 1209 	call next_token 
      009ACA 4F 20            [ 1] 1210 	ld (RELOP,sp),a 
      009ACC 12 30            [ 1] 1211 	and a,#TK_GRP_MASK
      009ACD A1 30            [ 1] 1212 	cp a,#TK_GRP_RELOP 
      009ACD 0D 01            [ 1] 1213 	jreq 2$
      009ACF 27 03            [ 1] 1214 	ld a,#TK_INTGR 
      001AF2                       1215 	_unget_token 
      009AD1 CD 82 82 00 01   [ 1]    1      mov in,in.saved  
      009AD4 20 40            [ 2] 1216 	jra 9$ 
      001AF9                       1217 2$:	; expect another expression
      009AD4 72 A2 00         [ 4] 1218 	call expression
      009AD7 03               [ 1] 1219 	tnz a 
      009AD8 90 F7            [ 1] 1220 	jrne 3$
      009ADA 90 EF 01         [ 2] 1221 	jp syntax_error 
      001B02                       1222 3$: 
      009ADD A6 84 A5         [ 4] 1223 	call cp24 
      009ADF                       1224 	_xpop  
      009ADF 5B 01            [ 1]    1     ld a,(y)
      009AE1 81               [ 1]    2     ldw x,y 
      009AE2 EE 01            [ 2]    3     ldw x,(1,x)
      009AE2 52 01 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      009AE6 2D               [ 1] 1225 	tnz a 
      009AE7 4D 27            [ 1] 1226 	jrmi 4$
      009AE9 38 0C            [ 1] 1227 	jrne 5$
      009AEA 35 02 00 0E      [ 1] 1228 	mov acc8,#2 ; i1==i2
      009AEA CD 98            [ 2] 1229 	jra 6$ 
      001B19                       1230 4$: ; i1<i2
      009AEC 19 6B 01 A4      [ 1] 1231 	mov acc8,#4 
      009AF0 30 A1            [ 2] 1232 	jra 6$
      001B1F                       1233 5$: ; i1>i2
      009AF2 20 27 09 A6      [ 1] 1234 	mov acc8,#1  
      001B23                       1235 6$: ; 0=false, -1=true 
      009AF6 84               [ 1] 1236 	clrw x 
      009AF7 55 00 03         [ 1] 1237 	ld a, acc8  
      009AFA 00 02            [ 1] 1238 	and a,(RELOP,sp)
      009AFC 20 24            [ 1] 1239 	jreq 7$
      009AFE 53               [ 2] 1240 	cplw x 
      009AFE CD 9A            [ 1] 1241 	ld a,#255 
      001B2E                       1242 7$:	_xpush 
      009B00 2D 4D 26 03      [ 2]    1     subw y,#CELL_SIZE
      009B04 CC 96            [ 1]    2     ld (y),a 
      009B06 B5 EF 01         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009B07 A6 84            [ 1] 1243 	ld a,#TK_INTGR
      001B39                       1244 9$: 
      001B39                       1245 	_drop VSIZE
      009B07 7B 01            [ 2]    1     addw sp,#VSIZE 
      009B09 A1               [ 4] 1246 	ret 
                                   1247 
                                   1248 ;-------------------------------------------
                                   1249 ;  AND factor:  [NOT] relation | (condition)
                                   1250 ;  output:
                                   1251 ;     A      TK_INTGR|0
                                   1252 ;-------------------------------------------
                           000001  1253 	NOT_OP=1
      001B3C                       1254 and_factor:
      009B0A 20 26            [ 1] 1255 	push #0 
      009B0C 05 CD 82         [ 4] 1256 0$:	call next_token  
      009B0F E6               [ 1] 1257 	tnz a 
      009B10 20 D8            [ 1] 1258 	jreq 8$ 
      009B12 A1 21            [ 1] 1259 	cp a,#TK_NOT 
      009B14 26 05            [ 1] 1260 	jrne 1$ 
      009B16 CD 83            [ 1] 1261 	cpl (NOT_OP,sp)
      009B18 74 20            [ 2] 1262 	jra 0$ 
      001B4C                       1263 1$:	
      009B1A CF 06            [ 1] 1264 	cp a,#TK_LPAREN 
      009B1B 26 0A            [ 1] 1265 	jrne 2$
      009B1B CD 84 0E         [ 4] 1266 	call condition
      009B1E 20 CA            [ 1] 1267 	ld a,#TK_RPAREN 
      009B20 CD 19 4F         [ 4] 1268 	call expect
      009B20 A6 84            [ 2] 1269 	jra 3$
      009B22                       1270 2$: _unget_token 
      009B22 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009B25 CD 1A DD         [ 4] 1271 	call relation
      001B62                       1272 3$:
      009B25 52 01            [ 1] 1273 	tnz (NOT_OP,sp)
      009B27 CD 9A            [ 1] 1274 	jreq 8$ 
      009B29 E2 4D 27         [ 4] 1275 	call cpl24
      001B69                       1276 8$:
      001B69                       1277 	_drop 1  
      009B2C 2D 01            [ 2]    1     addw sp,#1 
      009B2D 81               [ 4] 1278     ret 
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
      001B6C                       1289 and_cond:
      009B2D CD 98 19         [ 4] 1290 	call and_factor
      009B30 6B               [ 1] 1291 	tnz a 
      009B31 01 A4            [ 1] 1292 	jreq 9$  
      009B33 30 A1 10         [ 4] 1293 1$: call next_token 
      009B36 27               [ 1] 1294 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009B37 09 55            [ 1] 1295 	jreq 6$ 
      009B39 00 03            [ 1] 1296 	cp a,#TK_AND 
      009B3B 00 02            [ 1] 1297 	jreq 3$
      001B7C                       1298 	_unget_token 
      009B3D A6 84 20 19 01   [ 1]    1      mov in,in.saved  
      009B41 20 38            [ 2] 1299 	jra 6$ 
      009B41 CD 9A E2         [ 4] 1300 3$:	call and_factor  
      009B44 4D               [ 1] 1301 	tnz a 
      009B45 26 03            [ 1] 1302 	jrne 4$
      009B47 CC 96 B5         [ 2] 1303 	jp syntax_error 
      009B4A                       1304 4$:	
      001B8C                       1305 	_xpop 
      009B4A 7B 01            [ 1]    1     ld a,(y)
      009B4C A1               [ 1]    2     ldw x,y 
      009B4D 10 26            [ 2]    3     ldw x,(1,x)
      009B4F 05 CD 81 EB      [ 2]    4     addw y,#CELL_SIZE 
      009B53 20 D8 0C         [ 1] 1306 	ld acc24,a 
      009B55 CF 00 0D         [ 2] 1307 	ldw acc16,x
      001B9B                       1308 	_xpop 
      009B55 CD 82            [ 1]    1     ld a,(y)
      009B57 08               [ 1]    2     ldw x,y 
      009B58 20 D3            [ 2]    3     ldw x,(1,x)
      009B5A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B5A 5B 01 81         [ 1] 1309 	and a,acc24 
      009B5D 02               [ 1] 1310 	rlwa x 
      009B5D 52 01 CD         [ 1] 1311 	and a,acc16 
      009B60 9B               [ 1] 1312 	rlwa x 
      009B61 25 4D 27         [ 1] 1313 	and a,acc8 
      009B64 54               [ 1] 1314 	rlwa x
      001BB0                       1315 	_xpush
      009B65 CD 98 19 6B      [ 2]    1     subw y,#CELL_SIZE
      009B69 01 A4            [ 1]    2     ld (y),a 
      009B6B 30 A1 30         [ 2]    3     ldw (1,y),x 
      009B6E 27 09            [ 2] 1316 	jra 1$  
      009B70 A6 84            [ 1] 1317 6$: ld a,#TK_INTGR 
      009B72 55               [ 4] 1318 9$:	ret 	 
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
      001BBE                       1332 condition:
      001BBE                       1333 	_vars VSIZE 
      009B73 00 03            [ 2]    1     sub sp,#VSIZE 
      009B75 00 02 20         [ 4] 1334 	call and_cond
      009B78 40               [ 1] 1335 	tnz a 
      009B79 27 69            [ 1] 1336 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      009B79 CD 9B 25         [ 4] 1337 1$:	call next_token 
      009B7C 4D 26            [ 1] 1338 	cp a,#TK_OR 
      009B7E 03 CC            [ 1] 1339 	jreq 2$
      009B80 96 B5            [ 1] 1340 	cp a,#TK_XOR
      009B82 27 07            [ 1] 1341 	jreq 2$ 
      001BD1                       1342 	_unget_token 
      009B82 CD 82 25 90 F6   [ 1]    1      mov in,in.saved  
      009B87 93 EE            [ 2] 1343 	jra 8$ 
      009B89 01 72            [ 1] 1344 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009B8B A9 00 03         [ 4] 1345 	call and_cond
      009B8E 4D 2B            [ 1] 1346 	cp a,#TK_INTGR 
      009B90 08 26            [ 1] 1347 	jreq 3$
      009B92 0C 35 02         [ 2] 1348 	jp syntax_error 
      001BE4                       1349 3$:	 
      001BE4                       1350 	_xpop  ; rigth arg 
      009B95 00 0F            [ 1]    1     ld a,(y)
      009B97 20               [ 1]    2     ldw x,y 
      009B98 0A 01            [ 2]    3     ldw x,(1,x)
      009B99 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B99 35 04 00         [ 1] 1351 	ld acc24,a 
      009B9C 0F 20 04         [ 2] 1352 	ldw acc16,x 
      009B9F                       1353 	_xpop  ; left arg  
      009B9F 35 01            [ 1]    1     ld a,(y)
      009BA1 00               [ 1]    2     ldw x,y 
      009BA2 0F 01            [ 2]    3     ldw x,(1,x)
      009BA3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009BA3 5F C6            [ 1] 1354 	ld (ATMP,sp),a 
      009BA5 00 0F            [ 1] 1355 	ld a,(OP,sp)
      009BA7 14 01            [ 1] 1356 	cp a,#TK_XOR 
      009BA9 27 03            [ 1] 1357 	jreq 5$ 
      001C04                       1358 4$: ; A:X OR acc24   
      009BAB 53 A6            [ 1] 1359 	ld a,(ATMP,sp)
      009BAD FF 72 A2         [ 1] 1360 	or a,acc24 
      009BB0 00               [ 1] 1361 	rlwa x 
      009BB1 03 90 F7         [ 1] 1362 	or a,acc16 
      009BB4 90               [ 1] 1363 	rlwa x 
      009BB5 EF 01 A6         [ 1] 1364 	or a,acc8 
      009BB8 84               [ 1] 1365 	rlwa x 
      009BB9 20 0E            [ 2] 1366 	jra 6$  
      001C14                       1367 5$: ; A:X XOR acc24 
      009BB9 5B 01            [ 1] 1368 	ld a,(ATMP,sp)
      009BBB 81 00 0C         [ 1] 1369 	xor a,acc24 
      009BBC 02               [ 1] 1370 	rlwa x 
      009BBC 4B 00 CD         [ 1] 1371 	xor a,acc16 
      009BBF 98               [ 1] 1372 	rlwa x 
      009BC0 19 4D 27         [ 1] 1373 	xor a,acc8 
      009BC3 25               [ 1] 1374 	rlwa x 
      001C22                       1375 6$: _xpush
      009BC4 A1 87 26 04      [ 2]    1     subw y,#CELL_SIZE
      009BC8 03 01            [ 1]    2     ld (y),a 
      009BCA 20 F2 01         [ 2]    3     ldw (1,y),x 
      009BCC 20 99            [ 2] 1376 	jra 1$ 
      009BCC A1 06            [ 1] 1377 8$:	ld a,#TK_INTGR 
      001C2F                       1378 9$:	_drop VSIZE 
      009BCE 26 0A            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009BD0 CD               [ 4] 1379 	ret 
                                   1380 
                                   1381 
                                   1382 ;--------------------------------------------
                                   1383 ; BASIC: HEX 
                                   1384 ; select hexadecimal base for integer print
                                   1385 ;---------------------------------------------
      001C32                       1386 hex_base:
      009BD1 9C 3E A6 07      [ 1] 1387 	mov base,#16 
      009BD5 CD               [ 4] 1388 	ret 
                                   1389 
                                   1390 ;--------------------------------------------
                                   1391 ; BASIC: DEC 
                                   1392 ; select decimal base for integer print
                                   1393 ;---------------------------------------------
      001C37                       1394 dec_base:
      009BD6 99 CF 20 08      [ 1] 1395 	mov base,#10
      009BDA 55               [ 4] 1396 	ret 
                                   1397 
                                   1398 ;------------------------
                                   1399 ; BASIC: FREE 
                                   1400 ; return free size in RAM 
                                   1401 ; output:
                                   1402 ;   A:x		size 
                                   1403 ;--------------------------
      001C3C                       1404 free:
      009BDB 00               [ 1] 1405 	clr a 
      009BDC 03 00 02         [ 2] 1406 	ldw x,#tib 
      009BDF CD 9B 5D 32      [ 2] 1407 	subw x,dvar_end 
      009BE2 81               [ 4] 1408 	ret 
                                   1409 
                                   1410 ;------------------------------
                                   1411 ; BASIC: SIZE 
                                   1412 ; command that print 
                                   1413 ; program start addres and size 
                                   1414 ;------------------------------
      001C45                       1415 cmd_size:
      009BE2 0D 01 27         [ 1] 1416 	push base 
      009BE5 03 CD 82         [ 2] 1417 	ldw x,#PROG_ADDR 
      009BE8 67 09 37         [ 4] 1418 	call puts 
      009BE9 CE 00 1B         [ 2] 1419 	ldw x,txtbgn     
      009BE9 5B 01 81 0A      [ 1] 1420 	mov base,#16 
      009BEC CD 17 E1         [ 4] 1421 	call prt_i16
      009BEC CD 9B BC         [ 1] 1422 	pop base 
      009BEF 4D 27 4B         [ 2] 1423 	ldw x,#PROG_SIZE 
      009BF2 CD 98 19         [ 4] 1424 	call puts 
      009BF5 4D 27 43         [ 2] 1425 	ldw x,txtend 
      009BF8 A1 88 27 07      [ 2] 1426 	subw x,txtbgn 
      009BFC 55 00 03         [ 4] 1427 	call prt_i16
      009BFF 00 02 20         [ 2] 1428 	ldw x,#STR_BYTES 
      009C02 38 CD 9B         [ 4] 1429 	call puts  
      009C05 BC               [ 4] 1430 	ret 
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
      001C72                       1440 ubound:
      009C06 4D 26 03         [ 4] 1441 	call free 
      009C09 CC 96            [ 1] 1442 	ld a,#CELL_SIZE 
      009C0B B5               [ 2] 1443 	div x,a 
      009C0C CF 00 20         [ 2] 1444 	ldw array_size,x
      009C0C 90               [ 1] 1445 	clr a 
      009C0D F6               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;-----------------------------
                                   1449 ; BASIC: LET var=expr 
                                   1450 ; variable assignement 
                                   1451 ; output:
                                   1452 ;   A 		TK_NONE 
                                   1453 ;-----------------------------
      001C7D                       1454 let::
      009C0E 93 EE 01         [ 4] 1455 	call next_token 
      009C11 72 A9            [ 1] 1456 	cp a,#TK_VAR 
      009C13 00 03            [ 1] 1457 	jreq let_var
      009C15 C7 00            [ 1] 1458 	cp a,#TK_ARRAY 
      009C17 0D CF            [ 1] 1459 	jreq  let_array
      009C19 00 0E 90         [ 2] 1460 	jp syntax_error
      001C8B                       1461 let_array:
      009C1C F6 93 EE         [ 4] 1462 	call get_array_element
      009C1F 01 72            [ 2] 1463 	jra let_eval 
      001C90                       1464 let_var:
      009C21 A9 00 03         [ 4] 1465 	call get_addr
      001C93                       1466 let_eval:
      009C24 C4 00 0D         [ 2] 1467 	ldw ptr16,x  ; variable address 
      009C27 02 C4 00         [ 4] 1468 	call next_token 
      009C2A 0E 02            [ 1] 1469 	cp a,#TK_EQUAL
      009C2C C4 00            [ 1] 1470 	jreq 1$
      009C2E 0F 02 72         [ 2] 1471 	jp syntax_error
      001CA0                       1472 1$:	
      009C31 A2 00 03         [ 4] 1473 	call condition   
      009C34 90 F7            [ 1] 1474 	cp a,#TK_INTGR 
      009C36 90 EF            [ 1] 1475 	jreq 2$
      009C38 01 20 B7         [ 2] 1476 	jp syntax_error
      001CAA                       1477 2$:	
      001CAA                       1478 	_xpop ; value 
      009C3B A6 84            [ 1]    1     ld a,(y)
      009C3D 81               [ 1]    2     ldw x,y 
      009C3E EE 01            [ 2]    3     ldw x,(1,x)
      009C3E 52 02 CD 9B      [ 2]    4     addw y,#CELL_SIZE 
      001CB3                       1479 3$:
      009C42 EC 4D 27 69      [ 4] 1480 	ld [ptr16],a
      009C46 CD 98 19 A1      [ 1] 1481 	inc ptr8  
      009C4A 89 27 0B A1      [ 5] 1482 	ldw [ptr16],x 
      009C4E 8A               [ 4] 1483 	ret 
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
      001CC0                       1494 get_value: ; -- i 
      009C4F 27               [ 1] 1495 	ld a,(x) ; record size 
      009C50 07 55            [ 1] 1496 	and a,#NAME_MAX_LEN
      009C52 00 03            [ 1] 1497 	sub a,#CELL_SIZE ; * value 
      009C54 00               [ 1] 1498 	push a 
      009C55 02 20            [ 1] 1499 	push #0 
      009C57 55 6B 02         [ 2] 1500 	addw x,(1,sp)
      009C5A CD               [ 1] 1501 	ld a,(x)
      009C5B 9B EC            [ 2] 1502 	ldw x,(1,x)
      001CCE                       1503 	_drop 2
      009C5D A1 84            [ 2]    1     addw sp,#2 
      009C5F 27               [ 4] 1504 	ret 
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
      001CD1                       1517 func_eefree:
      009C60 03 CC 96         [ 2] 1518 	ldw x,#EEPROM_BASE 
      009C63 B5 08 00 0E      [ 1] 1519 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009C64 A3 47 F8         [ 2] 1520     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009C64 90 F6            [ 1] 1521 	jruge 8$ ; no free space 
      009C66 93               [ 1] 1522 2$: ld a,(x)
      009C67 EE 01            [ 1] 1523 	jrne 3$
      009C69 72               [ 1] 1524 	incw x 
      009C6A A9 00 03 C7      [ 1] 1525 	dec acc8 
      009C6E 00 0D            [ 1] 1526 	jrne 2$
      009C70 CF 00 0E         [ 2] 1527 	subw x,#8 
      009C73 90 F6            [ 2] 1528 	jra 9$  
      009C75 93               [ 1] 1529 3$: ld a,(x)
      009C76 EE               [ 1] 1530 	incw x
      009C77 01               [ 1] 1531 	tnz a  
      009C78 72 A9            [ 1] 1532 	jrne 3$
      009C7A 00               [ 2] 1533 	decw x   
      009C7B 03 6B            [ 2] 1534 	jra 1$ 
      009C7D 01               [ 1] 1535 8$: clrw x ; no free space 
      009C7E 7B               [ 1] 1536 9$: clr a 
      009C7F 02 A1 8A         [ 2] 1537 	ldw free_eeprom,x ; save in system variable 
      009C82 27               [ 4] 1538 	ret 
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
      001CFA                       1563 search_name:
      009C83 10 89            [ 2] 1564 	pushw y 
      009C84                       1565 	_vars VSIZE
      009C84 7B 01            [ 2]    1     sub sp,#VSIZE 
      009C86 CA 00 0D 02      [ 1] 1566 	clr acc16 
      009C8A CA 00            [ 1] 1567 	ld (RECLEN,sp),a    
      009C8C 0E 02            [ 2] 1568 	ldw (NAMEPTR,sp),x
      009C8E CA 00 0F         [ 2] 1569 	ldw x,dvar_end 
      009C91 02 20            [ 2] 1570 	ldw (LIMIT,sp),x 
      009C93 0E CE 00 30      [ 2] 1571 	ldw y,dvar_bgn
      009C94 17 03            [ 2] 1572 1$:	ldw (WLKPTR,sp),y
      009C94 7B               [ 1] 1573 	ldw x,y 
      009C95 01 C8            [ 2] 1574 	cpw x, (LIMIT,sp) 
      009C97 00 0D            [ 1] 1575 	jruge 7$ ; no match found 
      009C99 02 C8            [ 1] 1576 	ld a,(y)
      009C9B 00 0E            [ 1] 1577 	and a,#NAME_MAX_LEN
      009C9D 02 C8            [ 1] 1578 	cp a,(RECLEN,sp)
      009C9F 00 0F            [ 1] 1579 	jrne 2$ 
      009CA1 02 72            [ 1] 1580 	incw y 
      009CA3 A2 00            [ 2] 1581 	ldw x,(NAMEPTR,sp)
      009CA5 03 90 F7         [ 4] 1582 	call strcmp
      009CA8 90 EF            [ 1] 1583 	jrne 8$ ; match found 
      001D27                       1584 2$: ; skip this one 	
      009CAA 01 20            [ 2] 1585 	ldW Y,(WLKPTR,sp)
      009CAC 99 A6            [ 1] 1586 	ld a,(y)
      009CAE 84 5B            [ 1] 1587 	and a,#NAME_MAX_LEN 
      009CB0 02 81 0E         [ 1] 1588 	ld acc8,a 
      009CB2 72 B9 00 0D      [ 2] 1589 	addw y,acc16 
      009CB2 35 10            [ 2] 1590 	jra 1$  
      001D36                       1591 7$: ; no match found 
      009CB4 00 0B            [ 1] 1592 	clr (WLKPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009CB6 81 04            [ 1] 1593 	clr (WLKPTR+1,sp)
      009CB7                       1594 8$: ; match found 
      009CB7 35 0A            [ 2] 1595 	ldw x,(WLKPTR,sp) ; record address 
      001D3C                       1596 9$:	_DROP VSIZE
      009CB9 00 0B            [ 2]    1     addw sp,#VSIZE 
      009CBB 81 85            [ 2] 1597 	popw y 
      009CBC 81               [ 4] 1598 	 ret 
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
      001D41                       1609 cmd_const:
      009CBC 4F AE 16 90 72   [ 2] 1610 	btjt flags,#FRUN,0$
      009CC1 B0 00            [ 1] 1611 	ld a,#ERR_RUN_ONLY
      009CC3 33 81 37         [ 2] 1612 	jp tb_error 
      009CC5                       1613 0$: 
      001D4B                       1614 	_vars VSIZE 
      009CC5 3B 00            [ 2]    1     sub sp,#VSIZE 
      009CC7 0B AE            [ 1] 1615 	ld a,#128 
      009CC9 9E B2            [ 1] 1616 	ld (RONLY,sp),a 
      009CCB CD 89            [ 1] 1617 	clr (REC_LEN,sp)
      009CCD B7 CE            [ 2] 1618 	jra cmd_dim2 ; shared code with cmd_dim  
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
      001D55                       1629 cmd_dim:
      009CCF 00 1C 35 10 00   [ 2] 1630 	btjt flags,#FRUN,cmd_dim1
      009CD4 0B CD            [ 1] 1631 	ld a,#ERR_RUN_ONLY
      009CD6 98 61 32         [ 2] 1632 	jp tb_error 
      001D5F                       1633 cmd_dim1:	
      001D5F                       1634 	_vars VSIZE
      009CD9 00 0B            [ 2]    1     sub sp,#VSIZE 
      009CDB AE 9E            [ 1] 1635 	clr (REC_LEN,sp )
      009CDD C4 CD            [ 1] 1636 	clr (RONLY,sp)
      001D65                       1637 cmd_dim2: 
      009CDF 89 B7 CE         [ 4] 1638 0$:	call next_token 
      009CE2 00 1E            [ 1] 1639 	cp a,#TK_LABEL  
      009CE4 72 B0            [ 1] 1640 	jreq 1$ 
      009CE6 00 1C CD         [ 2] 1641 	jp syntax_error 
      009CE9 98 61            [ 2] 1642 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009CEB AE 9E D5         [ 4] 1643 	call strlen
      009CEE CD 89            [ 1] 1644 	add a,#REC_XTRA_BYTES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009CF0 B7 81            [ 1] 1645 	ld (REC_LEN+1,sp),a
      009CF2 CD 17 B2         [ 4] 1646 	call skip_string 
      009CF2 CD 9C            [ 1] 1647 	ld a,(REC_LEN+1,sp)
      009CF4 BC A6            [ 2] 1648 	ldw x,(VAR_NAME,sp) 
      009CF6 03 62 CF         [ 4] 1649 	call search_name  
      009CF9 00               [ 2] 1650 	tnzw x 
      009CFA 21 4F            [ 1] 1651 	jreq 2$
      009CFC 81 08            [ 1] 1652 	ld a,#ERR_DUPLICATE
      009CFD CC 16 37         [ 2] 1653 	jp tb_error  
      009CFD CD 98 19         [ 2] 1654 2$:	ldw x,dvar_end 
      009D00 A1 85            [ 1] 1655 	ld a,(REC_LEN+1,sp)
      009D02 27 0C            [ 1] 1656 	or a,(RONLY,sp)
      009D04 A1               [ 1] 1657 	ld (x),a 
      009D05 05               [ 1] 1658 	incw x 
      009D06 27 03            [ 2] 1659 	pushw y 
      009D08 CC 96            [ 2] 1660 	ldw y,(VAR_NAME+2,sp)
      009D0A B5 13 71         [ 4] 1661 	call strcpy
      009D0B 90 85            [ 2] 1662 	popw y 
      009D0B CD               [ 2] 1663 	decw x
      009D0C 99 FD 20         [ 2] 1664 	addw x,(REC_LEN,sp)
      009D0F 03 00 32         [ 2] 1665 	ldw dvar_end,x 
      009D10 1D 00 03         [ 2] 1666 	subw x,#CELL_SIZE  
      009D10 CD               [ 1] 1667 	clr (x)
      009D11 98 41            [ 1] 1668 	clr (1,x)  
      009D13 6F 02            [ 1] 1669 	clr (2,x)
      009D13 CF 00 1A         [ 4] 1670 4$: call next_token 
      009D16 CD 98            [ 1] 1671 	cp a,#TK_COMMA 
      009D18 19 A1            [ 1] 1672 	jreq 0$ 
      009D1A 32 27            [ 1] 1673 	cp a,#TK_EQUAL 
      009D1C 03 CC            [ 1] 1674 	jrne 8$
                                   1675 ; initialize variable 
      009D1E 96 B5 BE         [ 4] 1676 	call condition 
      009D20 A1 84            [ 1] 1677 	cp a,#TK_INTGR
      009D20 CD 9C            [ 1] 1678 	jreq 5$
      009D22 3E A1 84         [ 2] 1679 	jp syntax_error
      009D25 27 03 CC         [ 2] 1680 5$: ldw x,dvar_end 
      009D28 96 B5 03         [ 2] 1681 	subw x,#CELL_SIZE 
      009D2A CF 00 19         [ 2] 1682 	ldw ptr16,x 
      001DC9                       1683 	_xpop 
      009D2A 90 F6            [ 1]    1     ld a,(y)
      009D2C 93               [ 1]    2     ldw x,y 
      009D2D EE 01            [ 2]    3     ldw x,(1,x)
      009D2F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D33 72 C7 00 19      [ 4] 1684 	ld [ptr16],a 
      009D33 72 C7 00 1A      [ 1] 1685 	inc ptr8 
      009D37 72 5C 00 1B      [ 5] 1686 	ldw [ptr16],x 
      009D3B 72 CF            [ 2] 1687 	jra 4$ 
      001DE0                       1688 8$:	
      001DE0                       1689 	_unget_token 	
      009D3D 00 1A 81 00 01   [ 1]    1      mov in,in.saved  
      009D40                       1690 	_drop VSIZE 
      009D40 F6 A4            [ 2]    1     addw sp,#VSIZE 
      009D42 0F A0 03         [ 4] 1691 	call ubound 
      009D45 88               [ 4] 1692 	ret 
                                   1693 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1694 
                                   1695 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1696 ; return program size 
                                   1697 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001DEB                       1698 prog_size:
      009D46 4B 00 72         [ 2] 1699 	ldw x,txtend 
      009D49 FB 01 F6 EE      [ 2] 1700 	subw x,txtbgn 
      009D4D 01               [ 4] 1701 	ret 
                                   1702 
                                   1703 ;----------------------------
                                   1704 ; print program information 
                                   1705 ;---------------------------
      001DF3                       1706 program_info: 
      009D4E 5B 02 81         [ 2] 1707 	ldw x,#PROG_ADDR 
      009D51 CD 09 37         [ 4] 1708 	call puts 
      009D51 AE 40 00         [ 2] 1709 	ldw x,txtbgn 
      009D54 35 08 00 0F      [ 1] 1710 	mov base,#16 
      009D58 A3 47 F8         [ 4] 1711 	call prt_i16
      009D5B 24 17 F6 26      [ 1] 1712 	mov base,#10  
      009D5F 0C 5C 72         [ 2] 1713 	ldw x,#PROG_SIZE
      009D62 5A 00 0F         [ 4] 1714 	call puts 
      009D65 26 F6 1D         [ 4] 1715 	call prog_size 
      009D68 00 08 20         [ 4] 1716 	call prt_i16 
      009D6B 09 F6 5C         [ 2] 1717 	ldw x,#STR_BYTES 
      009D6E 4D 26 FB         [ 4] 1718 	call puts
      009D71 5A 20 E0         [ 2] 1719 	ldw x,txtbgn
      009D74 5F 4F CF         [ 2] 1720 	cpw x,#app 
      009D77 00 25            [ 1] 1721 	jrult 2$
      009D79 81 1E 5C         [ 2] 1722 	ldw x,#FLASH_MEM 
      009D7A 20 03            [ 2] 1723 	jra 3$
      009D7A 90 89 52         [ 2] 1724 2$: ldw x,#RAM_MEM 	 
      009D7D 08 72 5F         [ 4] 1725 3$:	call puts 
      009D80 00 0E            [ 1] 1726 	ld a,#CR 
      009D82 6B 05 1F         [ 4] 1727 	call putc
      009D85 01               [ 4] 1728 	ret 
                                   1729 
      009D86 CE 00 33 1F 07 90 CE  1730 PROG_ADDR: .asciz "program address: "
             00 31 17 03 93 13 07
             24 20 90 F6
      009D98 A4 0F 11 05 26 09 90  1731 PROG_SIZE: .asciz ", program size: "
             5C 1E 01 CD 93 E0 26
             13 20 00
      009DA7 20 62 79 74 65 73 00  1732 STR_BYTES: .asciz " bytes" 
      009DA7 16 03 90 F6 A4 0F C7  1733 FLASH_MEM: .asciz " in FLASH memory" 
             00 0F 72 B9 00 0E 20
             D9 79 00
      009DB6 20 69 6E 20 52 41 4D  1734 RAM_MEM:   .asciz " in RAM memory" 
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
      001E7C                       1748 list:
      009DB6 0F 03 0F 04 05   [ 2] 1749 	btjf flags,#FRUN,0$
      009DBA A6 07            [ 1] 1750 	ld a,#ERR_CMD_ONLY
      009DBA 1E 03 5B         [ 2] 1751 	jp tb_error
      001E86                       1752 0$:	 
      009DBD 08 90 85         [ 4] 1753 	call prog_size 
      009DC0 81 01            [ 1] 1754 	jrugt 3$
      009DC1 81               [ 4] 1755 	ret 
      001E8C                       1756 3$: _vars VSIZE
      009DC1 72 00            [ 2]    1     sub sp,#VSIZE 
      009DC3 00 23 05         [ 2] 1757 	ldw x,txtbgn 
      009DC6 A6 06            [ 2] 1758 	ldw (LN_PTR,sp),x 
      009DC8 CC               [ 2] 1759 	ldw x,(x) 
      009DC9 96 B7            [ 2] 1760 	ldw (FIRST,sp),x ; list from first line 
      009DCB AE 7F FF         [ 2] 1761 	ldw x,#MAX_LINENO ; biggest line number 
      009DCB 52 05            [ 2] 1762 	ldw (LAST,sp),x 
      009DCD A6 80 6B         [ 4] 1763 	call arg_list
      009DD0 05               [ 1] 1764 	tnz a
      009DD1 0F 03            [ 1] 1765 	jreq list_loop 
      009DD3 20 10            [ 1] 1766 	cp a,#2 
      009DD5 27 07            [ 1] 1767 	jreq 4$
      009DD5 72 00            [ 1] 1768 	cp a,#1 
      009DD7 00 23            [ 1] 1769 	jreq first_line 
      009DD9 05 A6 06         [ 2] 1770 	jp syntax_error 
      009DDC CC               [ 2] 1771 4$:	popw x 
      009DDD 96 B7            [ 2] 1772 	ldw (LAST+2,sp),x 
      009DDF                       1773 first_line:
      009DDF 52               [ 2] 1774 	popw x
      009DE0 05 0F            [ 2] 1775 	ldw (FIRST,sp),x 
      001EB2                       1776 lines_skip:
      009DE2 03 0F 05         [ 2] 1777 	ldw x,txtbgn
      009DE5 1F 05            [ 2] 1778 2$:	ldw (LN_PTR,sp),x 
      009DE5 CD 98 19         [ 2] 1779 	cpw x,txtend 
      009DE8 A1 03            [ 1] 1780 	jrpl list_exit 
      009DEA 27               [ 2] 1781 	ldw x,(x) ;line# 
      009DEB 03 CC            [ 2] 1782 	cpw x,(FIRST,sp)
      009DED 96 B5            [ 1] 1783 	jrpl list_loop 
      009DEF 1F 01            [ 2] 1784 	ldw x,(LN_PTR,sp) 
      009DF1 CD 93            [ 1] 1785 	ld a,(2,x)
      009DF3 D5 AB 05         [ 1] 1786 	ld acc8,a 
      009DF6 6B 04 CD 98      [ 1] 1787 	clr acc16 
      009DFA 32 7B 04 1E      [ 2] 1788 	addw x,acc16
      009DFE 01 CD            [ 2] 1789 	jra 2$ 
                                   1790 ; print loop
      001ED2                       1791 list_loop:
      009E00 9D 7A            [ 2] 1792 	ldw x,(LN_PTR,sp)
      009E02 5D 27            [ 1] 1793 	ld a,(2,x) 
      009E04 05 A6 08         [ 4] 1794 	call prt_basic_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009E07 CC 96            [ 2] 1795 	ldw x,(LN_PTR,sp)
      009E09 B7 CE            [ 1] 1796 	ld a,(2,x)
      009E0B 00 33 7B         [ 1] 1797 	ld acc8,a 
      009E0E 04 1A 05 F7      [ 1] 1798 	clr acc16 
      009E12 5C 90 89 16      [ 2] 1799 	addw x,acc16
      009E16 03 CD 93         [ 2] 1800 	cpw x,txtend 
      009E19 F1 90            [ 1] 1801 	jrpl list_exit
      009E1B 85 5A            [ 2] 1802 	ldw (LN_PTR,sp),x
      009E1D 72               [ 2] 1803 	ldw x,(x)
      009E1E FB 03            [ 2] 1804 	cpw x,(LAST,sp)  
      009E20 CF 00            [ 1] 1805 	jrslt list_loop
      001EF4                       1806 list_exit:
      009E22 33 1D 00 03 7F   [ 1] 1807 	mov in,count 
      009E27 6F 01 6F         [ 2] 1808 	ldw x,#pad 
      009E2A 02 CD 98         [ 2] 1809 	ldw basicptr,x 
      001EFF                       1810 	_drop VSIZE 
      009E2D 19 A1            [ 2]    1     addw sp,#VSIZE 
      009E2F 08 27 B3         [ 4] 1811 	call program_info 
      009E32 A1               [ 4] 1812 	ret
                                   1813 
                                   1814 
                                   1815 ;--------------------------
                                   1816 ; BASIC: EDIT 
                                   1817 ;  copy program in FLASH 
                                   1818 ;  to RAM for edition 
                                   1819 ;-------------------------
      001F05                       1820 edit:
      009E33 32 26 2A         [ 4] 1821 	call qsign 
      009E36 CD 9C            [ 1] 1822 	jreq 1$ 
      009E38 3E A1 84         [ 2] 1823 	ldw x,#NOT_SAVED 
      009E3B 27 03 CC         [ 4] 1824 	call puts 
      009E3E 96               [ 4] 1825 	ret 
      001F11                       1826 1$: 
      009E3F B5 CE 00 33      [ 2] 1827 	ldw y,#app_sign ; source address 
      009E43 1D 00 03         [ 2] 1828     ldw x,app_size  
      009E46 CF 00 1A         [ 2] 1829 	addw x,#4 
      009E49 90 F6 93         [ 2] 1830 	ldw acc16,x  ; bytes to copy 
      009E4C EE 01 72         [ 2] 1831 	ldw x,#rsign ; destination address 
      009E4F A9 00 03         [ 4] 1832 	call move  
      009E52 72 C7 00         [ 2] 1833 	ldw x,#free_ram 
      009E55 1A 72 5C         [ 2] 1834 	ldw txtbgn,x 
      009E58 00 1B 72 CF      [ 2] 1835 	addw x,rsize  
      009E5C 00 1A 20         [ 2] 1836 	ldw txtend,x 
      009E5F CB               [ 4] 1837 	ret 
                                   1838 
      009E60 4E 6F 20 61 70 70 6C  1839 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1840 
                                   1841 
                                   1842 ;--------------------------
                                   1843 ; decompile line from token list
                                   1844 ; and print it. 
                                   1845 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1846 ;   A       stop at this position 
                                   1847 ;   X 		pointer at line
                                   1848 ; output:
                                   1849 ;   none 
                                   1850 ;--------------------------	
      001F49                       1851 prt_basic_line:
      009E60 55 00            [ 2] 1852 	pushw y 
      009E62 03 00 02         [ 1] 1853 	ld count,a 
      009E65 5B 05            [ 1] 1854 	ld a,(2,x)
      009E67 CD 9C F2         [ 1] 1855 	cp a,count 
      009E6A 81 03            [ 1] 1856 	jrpl 1$ 
      009E6B C7 00 03         [ 1] 1857 	ld count,a 
      009E6B CE 00 1E         [ 2] 1858 1$:	ldw basicptr,x 
      009E6E 72 B0 00 1C      [ 2] 1859 	ldw y,#tib  
      009E72 81 11 71         [ 4] 1860 	call decompile 
      009E73 CD 09 37         [ 4] 1861 	call puts 
      009E73 AE 9E            [ 1] 1862 	ld a,#CR 
      009E75 B2 CD 89         [ 4] 1863 	call putc 
      009E78 B7 CE            [ 2] 1864 	popw y 
      009E7A 00               [ 4] 1865 	ret 
                                   1866 
                                   1867 
                                   1868 ;---------------------------------
                                   1869 ; BASIC: PRINT|? arg_list 
                                   1870 ; print values from argument list
                                   1871 ;----------------------------------
                           000001  1872 	CCOMMA=1
                           000001  1873 	VSIZE=1
      001F6D                       1874 print:
      001F6D                       1875 	_vars VSIZE 
      009E7B 1C 35            [ 2]    1     sub sp,#VSIZE 
      001F6F                       1876 reset_comma:
      009E7D 10 00            [ 1] 1877 	clr (CCOMMA,sp)
      001F71                       1878 prt_loop:
      009E7F 0B CD 98         [ 4] 1879 	call next_token
      009E82 61 35            [ 1] 1880 	cp a,#CMD_END 
      009E84 0A 00            [ 1] 1881 	jrult 0$
      009E86 0B AE            [ 1] 1882 	cp a,#TK_COLON 
      009E88 9E C4            [ 1] 1883 	jreq 0$
      009E8A CD 89            [ 1] 1884 	cp a,#TK_CMD
      009E8C B7 CD            [ 1] 1885 	jrne 10$
      001F80                       1886 0$:
      001F80                       1887 	_unget_token 
      009E8E 9E 6B CD 98 61   [ 1]    1      mov in,in.saved  
      009E93 AE 9E            [ 2] 1888 	jra 8$ 
      001F87                       1889 10$:	
      009E95 D5 CD            [ 1] 1890 	cp a,#TK_QSTR
      009E97 89 B7            [ 1] 1891 	jreq 1$
      009E99 CE 00            [ 1] 1892 	cp a,#TK_CHAR 
      009E9B 1C A3            [ 1] 1893 	jreq 2$ 
      009E9D B6 04            [ 1] 1894 	cp a,#TK_CFUNC 
      009E9F 25 05            [ 1] 1895 	jreq 3$
      009EA1 AE 9E            [ 1] 1896 	cp a,#TK_COMMA 
      009EA3 DC 20            [ 1] 1897 	jreq 4$
      009EA5 03 AE            [ 1] 1898 	cp a,#TK_SHARP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009EA7 9E ED            [ 1] 1899 	jreq 5$
      009EA9 CD 89            [ 2] 1900 	jra 7$ 
      001F9D                       1901 1$:	; print string 
      009EAB B7 A6 0D         [ 4] 1902 	call puts
      009EAE CD               [ 1] 1903 	incw x
      009EAF 89 5A 81 70      [ 2] 1904 	subw x,basicptr 
      009EB3 72 6F 67         [ 2] 1905 	ldw in.w,x  
      009EB6 72 61            [ 2] 1906 	jra reset_comma
      001FAA                       1907 2$:	; print character 
      009EB8 6D 20 61         [ 4] 1908 	call get_char 
      009EBB 64 64 72         [ 4] 1909 	call putc 
      009EBE 65 73            [ 2] 1910 	jra reset_comma 
      001FB2                       1911 3$: ; print character function value  	
      001FB2                       1912 	_get_code_addr 
      009EC0 73               [ 2]    1         ldw x,(x)
      009EC1 3A 20 00 2C      [ 1]    2         inc in 
      009EC5 20 70 72 6F      [ 1]    3         inc in 
      009EC9 67               [ 4] 1913 	call (x)
      009ECA 72 61 6D         [ 4] 1914 	call putc
      009ECD 20 73            [ 2] 1915 	jra reset_comma 
      001FC1                       1916 4$: ; set comma state 
      009ECF 69 7A            [ 1] 1917 	cpl (CCOMMA,sp)
      009ED1 65 3A            [ 2] 1918 	jra prt_loop   
      001FC5                       1919 5$: ; # character must be followed by an integer   
      009ED3 20 00 20         [ 4] 1920 	call next_token
      009ED6 62 79            [ 1] 1921 	cp a,#TK_INTGR 
      009ED8 74 65            [ 1] 1922 	jreq 6$
      009EDA 73 00 20         [ 2] 1923 	jp syntax_error 
      001FCF                       1924 6$: ; set tab width
      009EDD 69 6E 20         [ 4] 1925 	call get_int24 
      009EE0 46               [ 1] 1926 	ld a,xl 
      009EE1 4C 41            [ 1] 1927 	and a,#15 
      009EE3 53 48 20         [ 1] 1928 	ld tab_width,a 
      009EE6 6D 65            [ 2] 1929 	jra reset_comma 
      001FDA                       1930 7$:	
      001FDA                       1931 	_unget_token 
      009EE8 6D 6F 72 79 00   [ 1]    1      mov in,in.saved  
      009EED 20 69 6E         [ 4] 1932 	call condition
      009EF0 20               [ 1] 1933 	tnz a 
      009EF1 52 41            [ 1] 1934 	jreq 8$    
      009EF3 4D 20 6D         [ 4] 1935     call print_top
      009EF6 65 6D            [ 2] 1936 	jra reset_comma 
      001FEA                       1937 8$:
      009EF8 6F 72            [ 1] 1938 	tnz (CCOMMA,sp)
      009EFA 79 00            [ 1] 1939 	jrne 9$
      009EFC A6 0D            [ 1] 1940 	ld a,#CR 
      009EFC 72 01 00         [ 4] 1941     call putc 
      001FF3                       1942 9$:	_drop VSIZE 
      009EFF 23 05            [ 2]    1     addw sp,#VSIZE 
      009F01 A6               [ 4] 1943 	ret 
                                   1944 
                                   1945 ;----------------------
                                   1946 ; 'save_context' and
                                   1947 ; 'rest_context' must be 
                                   1948 ; called at the same 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   1949 ; call stack depth 
                                   1950 ; i.e. SP must have the 
                                   1951 ; save value at  
                                   1952 ; entry point of both 
                                   1953 ; routine. 
                                   1954 ;---------------------
                           000004  1955 	CTXT_SIZE=4 ; size of saved data 
                                   1956 ;--------------------
                                   1957 ; save current BASIC
                                   1958 ; interpreter context 
                                   1959 ; on stack 
                                   1960 ;--------------------
      001FF6                       1961 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001FF6                       1962 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001FF6                       1963 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001FF6                       1964 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001FF6                       1965 save_context:
      009F02 07 CC 96         [ 2] 1966 	ldw x,basicptr 
      009F05 B7 03            [ 2] 1967 	ldw (BPTR,sp),x
      009F06 C6 00 01         [ 1] 1968 	ld a,in 
      009F06 CD 9E            [ 1] 1969 	ld (IN,sp),a
      009F08 6B 22 01         [ 1] 1970 	ld a,count 
      009F0B 81 52            [ 1] 1971 	ld (CNT,sp),a  
      009F0D 06               [ 4] 1972 	ret
                                   1973 
                                   1974 ;-----------------------
                                   1975 ; restore previously saved 
                                   1976 ; BASIC interpreter context 
                                   1977 ; from stack 
                                   1978 ;-------------------------
      002006                       1979 rest_context:
      009F0E CE 00            [ 2] 1980 	ldw x,(BPTR,sp)
      009F10 1C 1F 05         [ 2] 1981 	ldw basicptr,x 
      009F13 FE 1F            [ 1] 1982 	ld a,(IN,sp)
      009F15 01 AE 7F         [ 1] 1983 	ld in,a
      009F18 FF 1F            [ 1] 1984 	ld a,(CNT,sp)
      009F1A 03 CD 99         [ 1] 1985 	ld count,a  
      009F1D E1               [ 4] 1986 	ret
                                   1987 
                                   1988 
                                   1989 
                                   1990 ;------------------------------------------
                                   1991 ; BASIC: INPUT [string]var[,[string]var]
                                   1992 ; input value in variables 
                                   1993 ; [string] optionally can be used as prompt 
                                   1994 ;-----------------------------------------
                           000001  1995 	CX_BPTR=1
                           000003  1996 	CX_IN=3
                           000004  1997 	CX_CNT=4
                           000005  1998 	SKIP=5
                           000005  1999 	VSIZE=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      002016                       2000 input_var:
      009F1E 4D 27            [ 2] 2001 	pushw y 
      002018                       2002 	_vars VSIZE 
      009F20 31 A1            [ 2]    1     sub sp,#VSIZE 
      00201A                       2003 input_loop:
      009F22 02 27            [ 1] 2004 	clr (SKIP,sp)
      009F24 07 A1 01         [ 4] 2005 	call next_token 
      009F27 27 06            [ 1] 2006 	cp a,#TK_QSTR 
      009F29 CC 96            [ 1] 2007 	jrne 1$ 
      009F2B B5 85 1F         [ 4] 2008 	call puts 
      009F2E 05               [ 1] 2009 	incw x 
      009F2F 72 B0 00 04      [ 2] 2010 	subw x,basicptr 
      009F2F 85 1F 01         [ 2] 2011 	ldw in.w,x 
      009F32 03 05            [ 1] 2012 	cpl (SKIP,sp)
      009F32 CE 00 1C         [ 4] 2013 	call next_token 
      009F35 1F 05            [ 1] 2014 1$: cp a,#TK_VAR  
      009F37 C3 00            [ 1] 2015 	jreq 2$ 
      009F39 1E 2A 38         [ 2] 2016 	jp syntax_error
      009F3C FE 13 01         [ 4] 2017 2$:	call get_addr
      009F3F 2A 11 1E         [ 2] 2018 	ldw ptr16,x 
      009F42 05 E6            [ 1] 2019 	tnz (SKIP,sp)
      009F44 02 C7            [ 1] 2020 	jrne 21$ 
      009F46 00 0F 72         [ 4] 2021 	call var_name 
      009F49 5F 00 0E         [ 4] 2022 	call putc   
      00204A                       2023 21$:
      009F4C 72 BB            [ 1] 2024 	ld a,#':
      009F4E 00 0E 20         [ 4] 2025 	call putc 
      009F51 E3 1F F6         [ 4] 2026 	call save_context 
      009F52 72 5F 00 03      [ 1] 2027 	clr count  
      009F52 1E 05 E6         [ 4] 2028 	call readln 
      009F55 02 CD 9F         [ 2] 2029 	ldw x,#tib 
      009F58 C9 1E 05         [ 1] 2030 	push count
      009F5B E6 02            [ 1] 2031 	push #0 
      009F5D C7 00 0F         [ 2] 2032 	addw x,(1,sp)
      009F60 72               [ 1] 2033 	incw x 
      002065                       2034 	_drop 2 
      009F61 5F 00            [ 2]    1     addw sp,#2 
      009F63 0E 72 BB 00      [ 1] 2035 	clr in 
      009F67 0E C3 00         [ 4] 2036 	call get_token
      009F6A 1E 2A            [ 1] 2037 	cp a,#TK_INTGR
      009F6C 07 1F            [ 1] 2038 	jreq 3$ 
      009F6E 05 FE            [ 1] 2039 	cp a,#TK_MINUS
      009F70 13 03            [ 1] 2040 	jrne 22$
      009F72 2F DE B1         [ 4] 2041 	call get_token 
      009F74 A1 84            [ 1] 2042 	cp a,#TK_INTGR 
      009F74 55 00            [ 1] 2043 	jreq 23$
      00207D                       2044 22$:
      009F76 04 00 02         [ 4] 2045 	call rest_context 
      009F79 AE 16 E0         [ 2] 2046 	jp syntax_error
      002083                       2047 23$:
      009F7C CF 00 05         [ 4] 2048 	call neg_acc24	
      002086                       2049 3$: 
      009F7F 5B 06 CD         [ 1] 2050 	ld a,acc24 
      009F82 9E 73 81         [ 2] 2051 	ldw x,acc16 
      009F85 72 C7 00 19      [ 4] 2052 	ld [ptr16],a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009F85 CD A7 D5 27      [ 1] 2053 	inc ptr8  
      009F89 07 AE 9F B2      [ 5] 2054 	ldw [ptr16],x 
      009F8D CD 89 B7         [ 4] 2055 	call rest_context
      009F90 81 17 99         [ 4] 2056 	call next_token 
      009F91 A1 08            [ 1] 2057 	cp a,#TK_COMMA
      009F91 90 AE            [ 1] 2058 	jrne 4$ 
      009F93 B6 00 CE         [ 2] 2059 	jp input_loop
      0020A5                       2060 4$:
      009F96 B6 02            [ 1] 2061 	cp a,#TK_NONE 
      009F98 1C 00            [ 1] 2062 	jreq input_exit  
      009F9A 04 CF            [ 1] 2063 	cp a,#TK_COLON 
      009F9C 00 0E            [ 1] 2064     jreq input_exit 
      009F9E AE 00 8C         [ 2] 2065 	jp syntax_error 
      0020B0                       2066 input_exit:
      0020B0                       2067 	_drop VSIZE 
      009FA1 CD 94            [ 2]    1     addw sp,#VSIZE 
      009FA3 01 AE            [ 2] 2068 	popw y 
      009FA5 00               [ 4] 2069 	ret 
                                   2070 
                                   2071 
                                   2072 ;---------------------
                                   2073 ; BASIC: REM | ' 
                                   2074 ; skip comment to end of line 
                                   2075 ;---------------------- 
      0020B5                       2076 remark::
      009FA6 90 CF 00 1C 72   [ 1] 2077 	mov in,count 
      009FAB BB               [ 4] 2078  	ret 
                                   2079 
                                   2080 
                                   2081 ;---------------------
                                   2082 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2083 ; read in loop 'addr'  
                                   2084 ; apply & 'mask' to value 
                                   2085 ; loop while result==0.  
                                   2086 ; 'xor_mask' is used to 
                                   2087 ; invert the wait logic.
                                   2088 ; i.e. loop while not 0.
                                   2089 ;---------------------
                           000001  2090 	XMASK=1 
                           000002  2091 	MASK=2
                           000003  2092 	ADDR=3
                           000004  2093 	VSIZE=4
      0020BB                       2094 wait: 
      0020BB                       2095 	_vars VSIZE
      009FAC 00 8E            [ 2]    1     sub sp,#VSIZE 
      009FAE CF 00            [ 1] 2096 	clr (XMASK,sp) 
      009FB0 1E 81 4E         [ 4] 2097 	call arg_list 
      009FB3 6F 20            [ 1] 2098 	cp a,#2
      009FB5 61 70            [ 1] 2099 	jruge 0$
      009FB7 70 6C 69         [ 2] 2100 	jp syntax_error 
      009FBA 63 61            [ 1] 2101 0$:	cp a,#3
      009FBC 74 69            [ 1] 2102 	jrult 1$
      0020CD                       2103 	_xpop  ; xor mask 
      009FBE 6F 6E            [ 1]    1     ld a,(y)
      009FC0 20               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009FC1 73 61            [ 2]    3     ldw x,(1,x)
      009FC3 76 65 64 2E      [ 2]    4     addw y,#CELL_SIZE 
      009FC7 0A               [ 1] 2104 	ld a,xl 
      009FC8 00 01            [ 1] 2105 	ld (XMASK,sp),a 
      009FC9                       2106 1$: _xpop ; mask
      009FC9 90 89            [ 1]    1     ld a,(y)
      009FCB C7               [ 1]    2     ldw x,y 
      009FCC 00 04            [ 2]    3     ldw x,(1,x)
      009FCE E6 02 C1 00      [ 2]    4     addw y,#CELL_SIZE 
      009FD2 04               [ 1] 2107     ld a,xl  
      009FD3 2A 03            [ 1] 2108 	ld (MASK,sp),a 
      0020E5                       2109 	_xpop ; address 
      009FD5 C7 00            [ 1]    1     ld a,(y)
      009FD7 04               [ 1]    2     ldw x,y 
      009FD8 CF 00            [ 2]    3     ldw x,(1,x)
      009FDA 05 90 AE 16      [ 2]    4     addw y,#CELL_SIZE 
      009FDE 90               [ 1] 2110 2$:	ld a,(x)
      009FDF CD 91            [ 1] 2111 	and a,(MASK,sp)
      009FE1 F1 CD            [ 1] 2112 	xor a,(XMASK,sp)
      009FE3 89 B7            [ 1] 2113 	jreq 2$ 
      0020F5                       2114 	_drop VSIZE 
      009FE5 A6 0D            [ 2]    1     addw sp,#VSIZE 
      009FE7 CD               [ 4] 2115 	ret 
                                   2116 
                                   2117 ;---------------------
                                   2118 ; BASIC: BSET addr,mask
                                   2119 ; set bits at 'addr' corresponding 
                                   2120 ; to those of 'mask' that are at 1.
                                   2121 ; arguments:
                                   2122 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2123 ;   mask        mask|addr
                                   2124 ; output:
                                   2125 ;	none 
                                   2126 ;--------------------------
      0020F8                       2127 bit_set:
      009FE8 89 5A 90         [ 4] 2128 	call arg_list 
      009FEB 85 81            [ 1] 2129 	cp a,#2	 
      009FED 27 03            [ 1] 2130 	jreq 1$ 
      009FED 52 01 35         [ 2] 2131 	jp syntax_error
      009FEF                       2132 1$: 
      002102                       2133 	_xpop ; mask 
      009FEF 0F 01            [ 1]    1     ld a,(y)
      009FF1 93               [ 1]    2     ldw x,y 
      009FF1 CD 98            [ 2]    3     ldw x,(1,x)
      009FF3 19 A1 02 25      [ 2]    4     addw y,#CELL_SIZE 
      009FF7 08               [ 1] 2134 	ld a,xl
      009FF8 A1               [ 1] 2135 	push a  
      00210D                       2136 	_xpop ; addr  
      009FF9 0A 27            [ 1]    1     ld a,(y)
      009FFB 04               [ 1]    2     ldw x,y 
      009FFC A1 80            [ 2]    3     ldw x,(1,x)
      009FFE 26 07 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A000 84               [ 1] 2137 	pop a 
      00A000 55               [ 1] 2138 	or a,(x)
      00A001 00               [ 1] 2139 	ld (x),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00A002 03               [ 4] 2140 	ret 
                                   2141 
                                   2142 ;---------------------
                                   2143 ; BASIC: BRES addr,mask
                                   2144 ; reset bits at 'addr' corresponding 
                                   2145 ; to those of 'mask' that are at 1.
                                   2146 ; arguments:
                                   2147 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2148 ;   mask	    ~mask&*addr  
                                   2149 ; output:
                                   2150 ;	none 
                                   2151 ;--------------------------
      00211A                       2152 bit_reset:
      00A003 00 02 20         [ 4] 2153 	call arg_list 
      00A006 63 02            [ 1] 2154 	cp a,#2  
      00A007 27 03            [ 1] 2155 	jreq 1$ 
      00A007 A1 02 27         [ 2] 2156 	jp syntax_error
      002124                       2157 1$: 
      002124                       2158 	_xpop ; mask 
      00A00A 12 A1            [ 1]    1     ld a,(y)
      00A00C 04               [ 1]    2     ldw x,y 
      00A00D 27 1B            [ 2]    3     ldw x,(1,x)
      00A00F A1 82 27 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A013 A1               [ 1] 2159 	ld a,xl 
      00A014 08               [ 1] 2160 	cpl a
      00A015 27               [ 1] 2161 	push a  
      002130                       2162 	_xpop ; addr  
      00A016 2A A1            [ 1]    1     ld a,(y)
      00A018 09               [ 1]    2     ldw x,y 
      00A019 27 2A            [ 2]    3     ldw x,(1,x)
      00A01B 20 3D 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A01D 84               [ 1] 2163 	pop a 
      00A01D CD               [ 1] 2164 	and a,(x)
      00A01E 89               [ 1] 2165 	ld (x),a 
      00A01F B7               [ 4] 2166 	ret 
                                   2167 
                                   2168 ;---------------------
                                   2169 ; BASIC: BTOGL addr,mask
                                   2170 ; toggle bits at 'addr' corresponding 
                                   2171 ; to those of 'mask' that are at 1.
                                   2172 ; arguments:
                                   2173 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2174 ;   mask	    mask^*addr  
                                   2175 ; output:
                                   2176 ;	none 
                                   2177 ;--------------------------
      00213D                       2178 bit_toggle:
      00A020 5C 72 B0         [ 4] 2179 	call arg_list 
      00A023 00 05            [ 1] 2180 	cp a,#2 
      00A025 CF 00            [ 1] 2181 	jreq 1$ 
      00A027 01 20 C5         [ 2] 2182 	jp syntax_error
      00A02A                       2183 1$: _xpop ; mask 
      00A02A CD 98            [ 1]    1     ld a,(y)
      00A02C 5B               [ 1]    2     ldw x,y 
      00A02D CD 89            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00A02F 5A 20 BD 03      [ 2]    4     addw y,#CELL_SIZE 
      00A032 9F               [ 1] 2184 	ld a,xl
      00A032 FE               [ 1] 2185 	push a 
      002152                       2186 	_xpop  ; addr  
      00A033 72 5C            [ 1]    1     ld a,(y)
      00A035 00               [ 1]    2     ldw x,y 
      00A036 02 72            [ 2]    3     ldw x,(1,x)
      00A038 5C 00 02 FD      [ 2]    4     addw y,#CELL_SIZE 
      00A03C CD               [ 1] 2187 	pop a 
      00A03D 89               [ 1] 2188 	xor a,(x)
      00A03E 5A               [ 1] 2189 	ld (x),a 
      00A03F 20               [ 4] 2190 	ret 
                                   2191 
                                   2192 
                                   2193 ;---------------------
                                   2194 ; BASIC: BTEST(addr,bit)
                                   2195 ; return bit value at 'addr' 
                                   2196 ; bit is in range {0..7}.
                                   2197 ; arguments:
                                   2198 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2199 ;   bit 	    bit position {0..7}  
                                   2200 ; output:
                                   2201 ;	A:X       bit value  
                                   2202 ;--------------------------
      00215F                       2203 bit_test:
      00A040 AE 19 5C         [ 4] 2204 	call func_args 
      00A041 A1 02            [ 1] 2205 	cp a,#2
      00A041 03 01            [ 1] 2206 	jreq 0$
      00A043 20 AC 35         [ 2] 2207 	jp syntax_error
      00A045                       2208 0$:	
      002169                       2209 	_xpop 
      00A045 CD 98            [ 1]    1     ld a,(y)
      00A047 19               [ 1]    2     ldw x,y 
      00A048 A1 84            [ 2]    3     ldw x,(1,x)
      00A04A 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A04E B5               [ 1] 2210 	ld a,xl 
      00A04F A4 07            [ 1] 2211 	and a,#7
      00A04F CD               [ 1] 2212 	push a   
      00A050 98 4B            [ 1] 2213 	ld a,#1 
      00A052 9F A4            [ 1] 2214 1$: tnz (1,sp)
      00A054 0F C7            [ 1] 2215 	jreq 2$
      00A056 00               [ 1] 2216 	sll a 
      00A057 24 20            [ 1] 2217 	dec (1,sp)
      00A059 95 F7            [ 2] 2218 	jra 1$
      00A05A 6B 01            [ 1] 2219 2$: ld (1,sp),a  
      002183                       2220 	_xpop ; address  
      00A05A 55 00            [ 1]    1     ld a,(y)
      00A05C 03               [ 1]    2     ldw x,y 
      00A05D 00 02            [ 2]    3     ldw x,(1,x)
      00A05F CD 9C 3E 4D      [ 2]    4     addw y,#CELL_SIZE 
      00A063 27               [ 1] 2221 	pop a 
      00A064 05               [ 1] 2222 	and a,(x)
      00A065 CD 98            [ 1] 2223 	jreq 3$
      00A067 86 20            [ 1] 2224 	ld a,#1 
      00A069 85               [ 1] 2225 3$:	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00A06A 97               [ 1] 2226 	ld xl,a
      00A06A 0D               [ 1] 2227 	clr a  
      00A06B 01               [ 4] 2228 	ret
                                   2229 
                                   2230 ;--------------------
                                   2231 ; BASIC: POKE addr,byte
                                   2232 ; put a byte at addr 
                                   2233 ;--------------------
      002196                       2234 poke:
      00A06C 26 05 A6         [ 4] 2235 	call arg_list 
      00A06F 0D CD            [ 1] 2236 	cp a,#2
      00A071 89 5A            [ 1] 2237 	jreq 1$
      00A073 5B 01 81         [ 2] 2238 	jp syntax_error
      00A076                       2239 1$:	
      0021A0                       2240 	_xpop ; byte   
      00A076 CE 00            [ 1]    1     ld a,(y)
      00A078 05               [ 1]    2     ldw x,y 
      00A079 1F 03            [ 2]    3     ldw x,(1,x)
      00A07B C6 00 02 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A07F 05               [ 1] 2241     ld a,xl 
      00A080 C6               [ 1] 2242 	push a 
      0021AB                       2243 	_xpop ; address 
      00A081 00 04            [ 1]    1     ld a,(y)
      00A083 6B               [ 1]    2     ldw x,y 
      00A084 06 81            [ 2]    3     ldw x,(1,x)
      00A086 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A086 1E               [ 1] 2244 	pop a 
      00A087 03               [ 1] 2245 	ld (x),a 
      00A088 CF               [ 4] 2246 	ret 
                                   2247 
                                   2248 ;-----------------------
                                   2249 ; BASIC: PEEK(addr)
                                   2250 ; get the byte at addr 
                                   2251 ; input:
                                   2252 ;	none 
                                   2253 ; output:
                                   2254 ;	X 		value 
                                   2255 ;-----------------------
      0021B7                       2256 peek:
      00A089 00 05 7B         [ 4] 2257 	call func_args
      00A08C 05 C7            [ 1] 2258 	cp a,#1 
      00A08E 00 02            [ 1] 2259 	jreq 1$
      00A090 7B 06 C7         [ 2] 2260 	jp syntax_error
      0021C1                       2261 1$: _xpop ; address  
      00A093 00 04            [ 1]    1     ld a,(y)
      00A095 81               [ 1]    2     ldw x,y 
      00A096 EE 01            [ 2]    3     ldw x,(1,x)
      00A096 90 89 52 05      [ 2]    4     addw y,#CELL_SIZE 
      00A09A C7 00 18         [ 1] 2262 	ld farptr,a 
      00A09A 0F 05 CD         [ 2] 2263 	ldw ptr16,x 
      00A09D 98 19 A1 02      [ 5] 2264 	ldf a,[farptr]
      00A0A1 26               [ 1] 2265 	clrw x 
      00A0A2 10               [ 1] 2266 	ld xl,a 
      00A0A3 CD               [ 1] 2267 	clr a 
      00A0A4 89               [ 4] 2268 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2269 
                                   2270 ;---------------------------
                                   2271 ; BASIC IF expr : instructions
                                   2272 ; evaluate expr and if true 
                                   2273 ; execute instructions on same line. 
                                   2274 ;----------------------------
      0021D8                       2275 if: 
      00A0A5 B7 5C 72         [ 4] 2276 	call condition  
      0021DB                       2277 	_xpop 
      00A0A8 B0 00            [ 1]    1     ld a,(y)
      00A0AA 05               [ 1]    2     ldw x,y 
      00A0AB CF 00            [ 2]    3     ldw x,(1,x)
      00A0AD 01 03 05 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A0B1 98               [ 1] 2278 	tnz  a  
      00A0B2 19 A1            [ 1] 2279 	jrne 9$
      00A0B4 85               [ 2] 2280 	tnzw x 
      00A0B5 27 03            [ 1] 2281 	jrne 9$  
                                   2282 ;skip to next line
      00A0B7 CC 96 B5 CD 98   [ 1] 2283 	mov in,count
      0021EF                       2284 	_drop 2 
      00A0BC 41 CF            [ 2]    1     addw sp,#2 
      00A0BE 00 1A 0D         [ 2] 2285 	jp next_line
      00A0C1 05               [ 4] 2286 9$:	ret 
                                   2287 
                                   2288 ;------------------------
                                   2289 ; BASIC: FOR var=expr 
                                   2290 ; set variable to expression 
                                   2291 ; leave variable address 
                                   2292 ; on stack and set
                                   2293 ; FLOOP bit in 'flags'
                                   2294 ;-----------------
                           000001  2295 	RETL1=1 ; return address  
                           000003  2296 	FSTEP=3  ; variable increment int24
                           000006  2297 	LIMIT=6 ; loop limit, int24  
                           000009  2298 	CVAR=9   ; control variable 
                           00000B  2299 	INW=11   ;  in.w saved
                           00000D  2300 	BPTR=13 ; baseptr saved
                           00000D  2301 	VSIZE=13  
      0021F5                       2302 for: ; { -- var_addr }
      00A0C2 26               [ 2] 2303 	popw x ; call return address 
      0021F6                       2304 	_vars VSIZE 
      00A0C3 06 CD            [ 2]    1     sub sp,#VSIZE 
      00A0C5 91               [ 2] 2305 	pushw x  ; RETL1 
      00A0C6 E7 CD            [ 1] 2306 	ld a,#TK_VAR 
      00A0C8 89 5A 4F         [ 4] 2307 	call expect
      00A0CA CD 17 C1         [ 4] 2308 	call get_addr
      00A0CA A6 3A            [ 2] 2309 	ldw (CVAR,sp),x  ; control variable 
      00A0CC CD 89 5A         [ 4] 2310 	call let_eval 
      00A0CF CD A0 76 72      [ 1] 2311 	bset flags,#FLOOP 
      00A0D3 5F 00 04         [ 4] 2312 	call next_token 
      00A0D6 CD 8A            [ 1] 2313 	cp a,#TK_CMD 
      00A0D8 BC AE            [ 1] 2314 	jreq 1$
      00A0DA 16 90 3B         [ 2] 2315 	jp syntax_error
      002214                       2316 1$:  
      002214                       2317 	_get_code_addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00A0DD 00               [ 2]    1         ldw x,(x)
      00A0DE 04 4B 00 72      [ 1]    2         inc in 
      00A0E2 FB 01 5C 5B      [ 1]    3         inc in 
      00A0E6 02 72 5F         [ 2] 2318 	cpw x,#to   
      00A0E9 00 02            [ 1] 2319 	jreq to
      00A0EB CD 8F 31         [ 2] 2320 	jp syntax_error 
                                   2321 
                                   2322 ;-----------------------------------
                                   2323 ; BASIC: TO expr 
                                   2324 ; second part of FOR loop initilization
                                   2325 ; leave limit on stack and set 
                                   2326 ; FTO bit in 'flags'
                                   2327 ;-----------------------------------
      002225                       2328 to: ; { var_addr -- var_addr limit step }
      00A0EE A1 84 27 14 A1   [ 2] 2329 	btjt flags,#FLOOP,1$
      00A0F3 11 26 07         [ 2] 2330 	jp syntax_error
      00A0F6 CD 8F 31         [ 4] 2331 1$: call expression   
      00A0F9 A1 84            [ 1] 2332 	cp a,#TK_INTGR 
      00A0FB 27 06            [ 1] 2333 	jreq 2$ 
      00A0FD CC 16 35         [ 2] 2334 	jp syntax_error
      002237                       2335 2$: _xpop
      00A0FD CD A0            [ 1]    1     ld a,(y)
      00A0FF 86               [ 1]    2     ldw x,y 
      00A100 CC 96            [ 2]    3     ldw x,(1,x)
      00A102 B5 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A103 6B 06            [ 1] 2336 	ld (LIMIT,sp),a 
      00A103 CD 82            [ 2] 2337 	ldw (LIMIT+1,sp),x
      00A105 8A 17 99         [ 4] 2338 	call next_token
      00A106 A1 00            [ 1] 2339 	cp a,#TK_NONE  
      00A106 C6 00            [ 1] 2340 	jreq 4$ 
      00A108 0D CE            [ 1] 2341 	cp a,#TK_CMD
      00A10A 00 0E            [ 1] 2342 	jrne 3$
      00224F                       2343 	_get_code_addr
      00A10C 72               [ 2]    1         ldw x,(x)
      00A10D C7 00 1A 72      [ 1]    2         inc in 
      00A111 5C 00 1B 72      [ 1]    3         inc in 
      00A115 CF 00 1A         [ 2] 2344 	cpw x,#step 
      00A118 CD A0            [ 1] 2345 	jreq step
      00225D                       2346 3$:	
      00225D                       2347 	_unget_token   	 
      00A11A 86 CD 98 19 A1   [ 1]    1      mov in,in.saved  
      002262                       2348 4$:	
      00A11F 08 26            [ 1] 2349 	clr (FSTEP,sp) 
      00A121 03 CC A0         [ 2] 2350 	ldw x,#1   ; default step  
      00A124 9A 04            [ 2] 2351 	ldw (FSTEP+1,sp),x 
      00A125 20 2F            [ 2] 2352 	jra store_loop_addr 
                                   2353 
                                   2354 
                                   2355 ;----------------------------------
                                   2356 ; BASIC: STEP expr 
                                   2357 ; optional third par of FOR loop
                                   2358 ; initialization. 	
                                   2359 ;------------------------------------
      00226B                       2360 step: ; {var limit -- var limit step}
      00A125 A1 00 27 07 A1   [ 2] 2361 	btjt flags,#FLOOP,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00A12A 0A 27 03         [ 2] 2362 	jp syntax_error
      00A12D CC 96 B5         [ 4] 2363 1$: call expression 
      00A130 A1 84            [ 1] 2364 	cp a,#TK_INTGR
      00A130 5B 05            [ 1] 2365 	jreq 2$
      00A132 90 85 81         [ 2] 2366 	jp syntax_error
      00A135                       2367 2$:	
      00227D                       2368 	_xpop 
      00A135 55 00            [ 1]    1     ld a,(y)
      00A137 04               [ 1]    2     ldw x,y 
      00A138 00 02            [ 2]    3     ldw x,(1,x)
      00A13A 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A13B 6B 03            [ 1] 2369 	ld (FSTEP,sp),a 
      00A13B 52 04            [ 2] 2370 	ldw (FSTEP+1,sp),x ; step
                                   2371 ; if step < 0 decrement LIMIT 
      00A13D 0F               [ 1] 2372 	tnz a
      00A13E 01 CD            [ 1] 2373 	jrpl store_loop_addr 
      00A140 99 E1            [ 1] 2374 	ld a,(LIMIT,sp)
      00A142 A1 02            [ 2] 2375 	ldw x,(LIMIT+1,sp)
      00A144 24 03 CC         [ 2] 2376 	subw x,#1 
      00A147 96 B5            [ 1] 2377 	sbc a,#0 
      00A149 A1 03            [ 1] 2378 	ld (LIMIT,sp),a 
      00A14B 25 0C            [ 2] 2379 	ldw (LIMIT+1,sp),x 
                                   2380 ; leave loop back entry point on cstack 
                                   2381 ; cstack is 1 call deep from interpreter
      00229A                       2382 store_loop_addr:
      00A14D 90 F6 93         [ 2] 2383 	ldw x,basicptr
      00A150 EE 01            [ 2] 2384 	ldw (BPTR,sp),x 
      00A152 72 A9 00         [ 2] 2385 	ldw x,in.w 
      00A155 03 9F            [ 2] 2386 	ldw (INW,sp),x   
      00A157 6B 01 90 F6      [ 1] 2387 	bres flags,#FLOOP 
      00A15B 93 EE 01 72      [ 1] 2388 	inc loop_depth  
      00A15F A9               [ 4] 2389 	ret 
                                   2390 
                                   2391 ;--------------------------------
                                   2392 ; BASIC: NEXT var 
                                   2393 ; FOR loop control 
                                   2394 ; increment variable with step 
                                   2395 ; and compare with limit 
                                   2396 ; loop if threshold not crossed.
                                   2397 ; else stack. 
                                   2398 ; and decrement 'loop_depth' 
                                   2399 ;--------------------------------
      0022AD                       2400 next: ; {var limit step retl1 -- [var limit step ] }
      00A160 00 03 9F 6B      [ 1] 2401 	tnz loop_depth 
      00A164 02 90            [ 1] 2402 	jrne 1$ 
      00A166 F6 93 EE         [ 2] 2403 	jp syntax_error 
      0022B6                       2404 1$: 
      00A169 01 72            [ 1] 2405 	ld a,#TK_VAR 
      00A16B A9 00 03         [ 4] 2406 	call expect
      00A16E F6 14 02         [ 4] 2407 	call get_addr 
                                   2408 ; check for good variable after NEXT 	 
      00A171 18 01            [ 2] 2409 	cpw x,(CVAR,sp)
      00A173 27 F9            [ 1] 2410 	jreq 2$  
      00A175 5B 04 81         [ 2] 2411 	jp syntax_error ; not the good one 
      00A178                       2412 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A178 CD 99 E1         [ 2] 2413 	ldw ptr16,x 
                                   2414 	; increment variable 
      00A17B A1               [ 1] 2415 	ld a,(x)
      00A17C 02 27            [ 2] 2416 	ldw x,(1,x)  ; get var value 
      00A17E 03 CC 96         [ 2] 2417 	addw x,(FSTEP+1,sp) ; var+step 
      00A181 B5 03            [ 1] 2418 	adc a,(FSTEP,sp)
      00A182 72 C7 00 19      [ 4] 2419 	ld [ptr16],a
      00A182 90 F6 93 EE      [ 1] 2420 	inc ptr8  
      00A186 01 72 A9 00      [ 5] 2421 	ldw [ptr16],x 
      00A18A 03 9F 88         [ 1] 2422 	ld acc24,a 
      00A18D 90 F6 93         [ 2] 2423 	ldw acc16,x 
      00A190 EE 01            [ 1] 2424 	ld a,(LIMIT,sp)
      00A192 72 A9            [ 2] 2425 	ldw x,(LIMIT+1,sp)
      00A194 00 03 84 FA      [ 2] 2426 	subw x,acc16 
      00A198 F7 81 0C         [ 1] 2427 	sbc a,acc24
      00A19A 18 03            [ 1] 2428 	xor a,(FSTEP,sp)
      00A19A CD 99            [ 1] 2429 	xor a,#0x80
      00A19C E1 A1            [ 1] 2430 	jrmi loop_back  
      00A19E 02 27            [ 2] 2431 	jra loop_done   
                                   2432 ; check sign of STEP  
      00A1A0 03 CC            [ 1] 2433 	ld a,(FSTEP,sp)
      00A1A2 96 B5            [ 1] 2434 	jrpl 4$
                                   2435 ;negative step
      00A1A4 C6 00 0E         [ 1] 2436     ld a,acc8 
      00A1A4 90 F6            [ 1] 2437 	jrslt loop_back   
      00A1A6 93 EE            [ 2] 2438 	jra loop_done  
      002300                       2439 4$: ; positive step
      00A1A8 01 72 A9 00 03   [ 2] 2440 	btjt acc8,#7,loop_done 
      002305                       2441 loop_back:
      00A1AD 9F 43            [ 2] 2442 	ldw x,(BPTR,sp)
      00A1AF 88 90 F6         [ 2] 2443 	ldw basicptr,x 
      00A1B2 93 EE 01 72 A9   [ 2] 2444 	btjf flags,#FRUN,1$ 
      00A1B7 00 03            [ 1] 2445 	ld a,(2,x)
      00A1B9 84 F4 F7         [ 1] 2446 	ld count,a
      00A1BC 81 0B            [ 2] 2447 1$:	ldw x,(INW,sp)
      00A1BD CF 00 00         [ 2] 2448 	ldw in.w,x 
      00A1BD CD               [ 4] 2449 	ret 
      00231A                       2450 loop_done:
                                   2451 	; remove loop data from stack  
      00A1BE 99               [ 2] 2452 	popw x
      00231B                       2453 	_drop VSIZE 
      00A1BF E1 A1            [ 2]    1     addw sp,#VSIZE 
      00A1C1 02 27 03 CC      [ 1] 2454 	dec loop_depth 
      00A1C5 96               [ 2] 2455 	jp (x)
                                   2456 
                                   2457 ;----------------------------
                                   2458 ; called by goto/gosub
                                   2459 ; to get target line number 
                                   2460 ; output:
                                   2461 ;    x    line address 
                                   2462 ;---------------------------
      002322                       2463 get_target_line:
      00A1C6 B5 90 F6         [ 4] 2464 	call next_token  
      00A1C9 93 EE            [ 1] 2465 	cp a,#TK_INTGR
      00A1CB 01 72            [ 1] 2466 	jreq get_target_line_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00A1CD A9 00            [ 1] 2467 	cp a,#TK_LABEL 
      00A1CF 03 9F            [ 1] 2468 	jreq look_target_symbol 
      00A1D1 88 90 F6         [ 2] 2469 	jp syntax_error
                                   2470 ; the target is a line number 
                                   2471 ; search it. 
      002330                       2472 get_target_line_addr:
      00A1D4 93 EE            [ 2] 2473 	pushw y 
      00A1D6 01 72 A9         [ 4] 2474 	call get_int24 ; line # 
      00A1D9 00               [ 1] 2475 	clr a
      00A1DA 03 84 F8 F7      [ 2] 2476 	ldw y,basicptr 
      00A1DE 81 FE            [ 2] 2477 	ldw y,(y)
      00A1DF 90 89            [ 2] 2478 	pushw y 
      00A1DF CD 99            [ 2] 2479 	cpw x,(1,sp)
      002340                       2480 	_drop 2  
      00A1E1 DC A1            [ 2]    1     addw sp,#2 
      00A1E3 02 27            [ 1] 2481 	jrult 11$
      00A1E5 03               [ 1] 2482 	inc a 
      002345                       2483 11$: ; scan program for this line# 	
      00A1E6 CC 96 B5         [ 4] 2484 	call search_lineno  
      00A1E9 5D               [ 2] 2485 	tnzw x ; 0| line# address 
      00A1E9 90 F6            [ 1] 2486 	jrne 2$ 
      00A1EB 93 EE            [ 1] 2487 	ld a,#ERR_NO_LINE 
      00A1ED 01 72 A9         [ 2] 2488 	jp tb_error 
      00A1F0 00 03            [ 2] 2489 2$:	popw y  
      00A1F2 9F               [ 4] 2490 	ret 
                                   2491 
                                   2492 ; the GOTO|GOSUB target is a symbol.
                                   2493 ; output:
                                   2494 ;    X    line address|0 
      002353                       2495 look_target_symbol:
      00A1F3 A4 07            [ 2] 2496 	pushw y 
      00A1F5 88               [ 2] 2497 	pushw x 
      00A1F6 A6 01 0D         [ 4] 2498 	call skip_string 
      00A1F9 01 27 05 48      [ 1] 2499 	clr acc16 
      00A1FD 0A 01 20 F7      [ 2] 2500 	ldw y,txtbgn 
      00A201 6B 01 90         [ 1] 2501 1$:	ld a,(3,y) ; first TK_ID on line 
      00A204 F6 93            [ 1] 2502 	cp a,#TK_LABEL 
      00A206 EE 01            [ 1] 2503 	jreq 3$ 
      00A208 72 A9 00         [ 1] 2504 2$:	ld a,(2,y); line length 
      00A20B 03 84 F4         [ 1] 2505 	ld acc8,a 
      00A20E 27 02 A6 01      [ 2] 2506 	addw y,acc16 ;point to next line 
      00A212 5F 97 4F 81      [ 2] 2507 	cpw y,txtend 
      00A216 25 E9            [ 1] 2508 	jrult 1$
      00A216 CD 99            [ 1] 2509 	ld a,#ERR_BAD_VALUE
      00A218 E1 A1 02         [ 2] 2510 	jp tb_error 
      00237D                       2511 3$: ; found a TK_LABEL 
                                   2512 	; compare with GOTO|GOSUB target 
      00A21B 27 03            [ 2] 2513 	pushw y ; line address 
      00A21D CC 96 B5 04      [ 2] 2514 	addw y,#4 ; label string 
      00A220 1E 03            [ 2] 2515 	ldw x,(3,sp) ; target string 
      00A220 90 F6 93         [ 4] 2516 	call strcmp
      00A223 EE 01            [ 1] 2517 	jrne 4$
      00A225 72 A9            [ 2] 2518 	popw y 
      00A227 00 03            [ 2] 2519 	jra 2$ 
      00238E                       2520 4$: ; target found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00A229 9F               [ 2] 2521 	popw x ;  address line target  
      00238F                       2522 	_drop 2 ; target string 
      00A22A 88 90            [ 2]    1     addw sp,#2 
      00A22C F6 93            [ 2] 2523 	popw y 
      00A22E EE               [ 4] 2524 	ret
                                   2525 
                                   2526 
                                   2527 ;--------------------------------
                                   2528 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2529 ; selective goto or gosub 
                                   2530 ;--------------------------------
      002394                       2531 cmd_on:
      00A22F 01 72 A9 00 03   [ 2] 2532 	btjt flags,#FRUN,0$ 
      00A234 84 F7            [ 1] 2533 	ld a,#ERR_RUN_ONLY
      00A236 81 16 37         [ 2] 2534 	jp tb_error 
      00A237 CD 1A A5         [ 4] 2535 0$:	call expression 
      00A237 CD 99            [ 1] 2536 	cp a,#TK_INTGR
      00A239 DC A1            [ 1] 2537 	jreq 1$
      00A23B 01 27 03         [ 2] 2538 	jp syntax_error
      0023A8                       2539 1$: _xpop
      00A23E CC 96            [ 1]    1     ld a,(y)
      00A240 B5               [ 1]    2     ldw x,y 
      00A241 90 F6            [ 2]    3     ldw x,(1,x)
      00A243 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
                                   2540 ; the selector is the element indice 
                                   2541 ; in the list of arguments. {1..#elements} 
      00A247 A9               [ 1] 2542 	ld a,xl ; keep only bits 7..0
      00A248 00 03            [ 1] 2543 	jreq 9$ ; element # begin at 1. 
      00A24A C7               [ 1] 2544 	push a  ; selector  
      00A24B 00 19 CF         [ 4] 2545 	call next_token
      00A24E 00 1A            [ 1] 2546 	cp a,#TK_CMD 
      00A250 92 BC            [ 1] 2547 	jreq 2$ 
      00A252 00 19 5F         [ 2] 2548 	jp syntax_error 
      0023BF                       2549 2$: _get_code_addr
      00A255 97               [ 2]    1         ldw x,(x)
      00A256 4F 81 00 01      [ 1]    2         inc in 
      00A258 72 5C 00 01      [ 1]    3         inc in 
                                   2550 ;; must be a GOTO or GOSUB 
      00A258 CD 9C 3E         [ 2] 2551 	cpw x,#goto 
      00A25B 90 F6            [ 1] 2552 	jreq 4$
      00A25D 93 EE 01         [ 2] 2553 	cpw x,#gosub 
      00A260 72 A9            [ 1] 2554 	jreq 4$ 
      00A262 00 03 4D         [ 2] 2555 	jp syntax_error 
      0023D5                       2556 4$: 
      00A265 26               [ 1] 2557 	pop a 
      00A266 0D               [ 2] 2558 	pushw x ; save routine address 	
      00A267 5D               [ 1] 2559 	push a  ; selector  
      0023D8                       2560 5$: ; skip elements in list until selector==0 
      00A268 26 0A            [ 1] 2561 	dec (1,sp)
      00A26A 55 00            [ 1] 2562 	jreq 6$ 
                                   2563 ; can be a line# or a label 
      00A26C 04 00 02         [ 4] 2564 	call next_token 
      00A26F 5B 02            [ 1] 2565 	cp a,#TK_INTGR 
      00A271 CC 97            [ 1] 2566 	jreq 52$
      00A273 68 81            [ 1] 2567 	cp a,#TK_LABEL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A275 27 0D            [ 1] 2568 	jreq 54$
      00A275 85 52 0D         [ 2] 2569 	jp syntax_error 
      0023EA                       2570 52$: ; got a line number 
      00A278 89 A6 85         [ 1] 2571 	ld a,in ; skip over int24 value 
      00A27B CD 99            [ 1] 2572 	add a,#CELL_SIZE ; integer size  
      00A27D CF CD 98         [ 1] 2573 	ld in,a 
      00A280 41 1F            [ 2] 2574 	jra 56$
      00A282 09 CD 9D         [ 4] 2575 54$: call skip_string ; skip over label 	
      0023F7                       2576 56$: ; if another element comma present 
      00A285 13 72 14         [ 4] 2577 	call next_token
      00A288 00 23            [ 1] 2578 	cp a,#TK_COMMA 
      00A28A CD 98            [ 1] 2579 	jreq 5$ 
                                   2580 ; arg list exhausted, selector to big 
                                   2581 ; continue execution on next line 
      0023FE                       2582 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A28C 19 A1            [ 2]    1     addw sp,#3 
      00A28E 80 27            [ 2] 2583 	jra 9$
      002402                       2584 6$: ;at selected position  
      002402                       2585 	_drop 1 ; discard selector
      00A290 03 CC            [ 2]    1     addw sp,#1 
                                   2586 ; here only the routine address 
                                   2587 ; of GOTO|GOSUB is on stack 
      00A292 96 B5 22         [ 4] 2588     call get_target_line
      00A294 CF 00 19         [ 2] 2589 	ldw ptr16,x 	
      00A294 FE 72 5C 00 02   [ 1] 2590 	mov in,count ; move to end of line  
      00A299 72               [ 2] 2591 	popw x ; cmd address, GOTO||GOSUB 
      00A29A 5C 00 02         [ 2] 2592 	cpw x,#goto 
      00A29D A3 A2            [ 1] 2593 	jrne 7$ 
      00A29F A5 27 03         [ 2] 2594 	ldw x,ptr16 
      00A2A2 CC 96            [ 2] 2595 	jra jp_to_target
      00241A                       2596 7$: 
      00A2A4 B5 35            [ 2] 2597 	jra gosub_2 ; target in ptr16 
      00A2A5                       2598 9$: ; expr out of range skip to end of line
                                   2599     ; this will force a fall to next line  
      00A2A5 72 04 00 23 03   [ 1] 2600 	mov in,count
      002421                       2601 	_drop 2
      00A2AA CC 96            [ 2]    1     addw sp,#2 
      00A2AC B5 CD 9B         [ 2] 2602 	jp next_line  
                                   2603 
                                   2604 
                                   2605 ;------------------------
                                   2606 ; BASIC: GOTO line# 
                                   2607 ; jump to line# 
                                   2608 ; here cstack is 2 call deep from interpreter 
                                   2609 ;------------------------
      002426                       2610 goto:
      00A2AF 25 A1 84 27 03   [ 2] 2611 	btjt flags,#FRUN,goto_1  
      00A2B4 CC 96            [ 1] 2612 	ld a,#ERR_RUN_ONLY
      00A2B6 B5 90 F6         [ 2] 2613 	jp tb_error 
      002430                       2614 goto_1:
      00A2B9 93 EE 01         [ 4] 2615 	call get_target_line
      002433                       2616 jp_to_target:
      00A2BC 72 A9 00         [ 2] 2617 	ldw basicptr,x 
      00A2BF 03 6B            [ 1] 2618 	ld a,(2,x)
      00A2C1 06 1F 07         [ 1] 2619 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A2C4 CD 98 19 A1      [ 1] 2620 	mov in,#3 
      00A2C8 00               [ 4] 2621 	ret 
                                   2622 
                                   2623 
                                   2624 ;--------------------
                                   2625 ; BASIC: GOSUB line#
                                   2626 ; basic subroutine call
                                   2627 ; actual line# and basicptr 
                                   2628 ; are saved on cstack
                                   2629 ; here cstack is 2 call deep from interpreter 
                                   2630 ;--------------------
                           000001  2631 	RET_ADDR=1 ; subroutine return address 
                           000003  2632 	RET_BPTR=3 ; basicptr return point 
                           000005  2633 	RET_INW=5  ; in.w return point 
                           000004  2634 	VSIZE=4 
      002440                       2635 gosub:
      00A2C9 27 17 A1 80 26   [ 2] 2636 	btjt flags,#FRUN,gosub_1 
      00A2CE 0E FE            [ 1] 2637 	ld a,#ERR_RUN_ONLY
      00A2D0 72 5C 00         [ 2] 2638 	jp tb_error 
      00A2D3 02               [ 4] 2639 	ret 
      00244B                       2640 gosub_1:
      00A2D4 72 5C 00         [ 4] 2641 	call get_target_line 
      00A2D7 02 A3 A2         [ 2] 2642 	ldw ptr16,x
      002451                       2643 gosub_2: 
      00A2DA EB               [ 2] 2644 	popw x 
      002452                       2645 	_vars VSIZE  
      00A2DB 27 0E            [ 2]    1     sub sp,#VSIZE 
      00A2DD 89               [ 2] 2646 	pushw x ; RET_ADDR 
                                   2647 ; save BASIC subroutine return point.   
      00A2DD 55 00 03         [ 2] 2648 	ldw x,basicptr
      00A2E0 00 02            [ 2] 2649 	ldw (RET_BPTR,sp),x 
      00A2E2 CE 00 00         [ 2] 2650 	ldw x,in.w 
      00A2E2 0F 03            [ 2] 2651 	ldw (RET_INW,sp),x
      00A2E4 AE 00 01         [ 2] 2652 	ldw x,ptr16  
      00A2E7 1F 04            [ 2] 2653 	jra jp_to_target
                                   2654 
                                   2655 ;------------------------
                                   2656 ; BASIC: RETURN 
                                   2657 ; exit from BASIC subroutine 
                                   2658 ;------------------------
      002464                       2659 return:
      00A2E9 20 2F 00 22 05   [ 2] 2660 	btjt flags,#FRUN,0$ 
      00A2EB A6 06            [ 1] 2661 	ld a,#ERR_RUN_ONLY
      00A2EB 72 04 00         [ 2] 2662 	jp tb_error 
      00246E                       2663 0$:	
      00A2EE 23 03            [ 2] 2664 	ldw x,(RET_BPTR,sp) 
      00A2F0 CC 96 B5         [ 2] 2665 	ldw basicptr,x
      00A2F3 CD 9B            [ 1] 2666 	ld a,(2,x)
      00A2F5 25 A1 84         [ 1] 2667 	ld count,a  
      00A2F8 27 03            [ 2] 2668 	ldw x,(RET_INW,sp)
      00A2FA CC 96 B5         [ 2] 2669 	ldw in.w,x 
      00A2FD 85               [ 2] 2670 	popw x 
      00247E                       2671 	_drop VSIZE 
      00A2FD 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A2FF 93               [ 2] 2672 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                   2673 
                                   2674 
                                   2675 ;----------------------------------
                                   2676 ; BASIC: RUN
                                   2677 ; run BASIC program in RAM
                                   2678 ;----------------------------------- 
      002481                       2679 run: 
      00A300 EE 01 72 A9 00   [ 2] 2680 	btjf flags,#FRUN,0$  
      00A305 03               [ 1] 2681 	clr a 
      00A306 6B               [ 4] 2682 	ret
      002488                       2683 0$: 
      00A307 03 1F 04 4D 2A   [ 2] 2684 	btjf flags,#FBREAK,1$
      00248D                       2685 	_drop 2 
      00A30C 0D 7B            [ 2]    1     addw sp,#2 
      00A30E 06 1E 07         [ 4] 2686 	call rest_context
      002492                       2687 	_drop CTXT_SIZE 
      00A311 1D 00            [ 2]    1     addw sp,#CTXT_SIZE 
      00A313 01 A2 00 6B      [ 1] 2688 	bres flags,#FBREAK 
      00A317 06 1F 07 22      [ 1] 2689 	bset flags,#FRUN 
      00A31A CC 16 E0         [ 2] 2690 	jp interpreter 
      00A31A CE 00 05         [ 2] 2691 1$:	ldw x,txtbgn
      00A31D 1F 0D CE         [ 2] 2692 	cpw x,txtend 
      00A320 00 01            [ 1] 2693 	jrmi run_it 
      00A322 1F 0B 72         [ 2] 2694 	ldw x,#err_no_prog
      00A325 15 00 23         [ 4] 2695 	call puts 
      00A328 72 5C 00 20 81   [ 1] 2696 	mov in,count
      00A32D 81               [ 4] 2697 	ret 
      0024B3                       2698 run_it:	 
      0024B3                       2699 	_drop 2 ; drop return address 
      00A32D 72 5D            [ 2]    1     addw sp,#2 
      0024B5                       2700 run_it_02: 
      00A32F 00 20 26         [ 4] 2701     call ubound 
      00A332 03 CC 96         [ 4] 2702 	call clear_vars
                                   2703 ; initialize DIM variables pointers 
      00A335 B5 00 1D         [ 2] 2704 	ldw x,txtend 
      00A336 CF 00 30         [ 2] 2705 	ldw dvar_bgn,x 
      00A336 A6 85 CD         [ 2] 2706 	ldw dvar_end,x 	 
                                   2707 ; clear data pointer 
      00A339 99               [ 1] 2708 	clrw x 
      00A33A CF CD 98         [ 2] 2709 	ldw data_ptr,x 
      00A33D 41 13 09 27      [ 1] 2710 	clr data_ofs 
      00A341 03 CC 96 B5      [ 1] 2711 	clr data_len 
                                   2712 ; initialize BASIC pointer 
      00A345 CE 00 1B         [ 2] 2713 	ldw x,txtbgn 
      00A345 CF 00 1A         [ 2] 2714 	ldw basicptr,x 
      00A348 F6 EE            [ 1] 2715 	ld a,(2,x)
      00A34A 01 72 FB         [ 1] 2716 	ld count,a
      00A34D 04 19 03 72      [ 1] 2717 	mov in,#3	
      00A351 C7 00 1A 72      [ 1] 2718 	bset flags,#FRUN 
      00A355 5C 00 1B         [ 2] 2719 	jp interpreter 
                                   2720 
                                   2721 
                                   2722 ;----------------------
                                   2723 ; BASIC: END
                                   2724 ; end running program
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2725 ;---------------------- 
      0024E6                       2726 cmd_end: 
                                   2727 ; clean stack 
      00A358 72 CF 00         [ 2] 2728 	ldw x,#STACK_EMPTY
      00A35B 1A               [ 1] 2729 	ldw sp,x 
      00A35C C7 00 0D         [ 2] 2730 	jp warm_start
                                   2731 
                                   2732 ;---------------------------
                                   2733 ; BASIC: GET var 
                                   2734 ; receive a key in variable 
                                   2735 ; don't wait 
                                   2736 ;---------------------------
      0024ED                       2737 cmd_get:
      00A35F CF 00 0E         [ 4] 2738 	call next_token 
      00A362 7B 06            [ 1] 2739 	cp a,#TK_VAR 
      00A364 1E 07            [ 1] 2740 	jreq 0$
      00A366 72 B0 00         [ 2] 2741 	jp syntax_error 
      00A369 0E C2 00         [ 4] 2742 0$: call get_addr 
      00A36C 0D 18 03         [ 2] 2743 	ldw ptr16,x 
      00A36F A8 80 2B         [ 4] 2744 	call qgetc 
      00A372 12 20            [ 1] 2745 	jreq 2$
      00A374 25 7B 03         [ 4] 2746 	call getc  
      00A377 2A 07 C6 00      [ 4] 2747 2$: clr [ptr16]
      00A37B 0F 2F 07 20      [ 1] 2748 	inc ptr8 
      00A37F 1A 3F 00 19      [ 4] 2749 	clr [ptr16]
      00A380 72 5C 00 1A      [ 1] 2750 	inc ptr8 
      00A380 72 0E 00 0F      [ 4] 2751 	ld [ptr16],a 
      00A384 15               [ 4] 2752 	ret 
                                   2753 
                                   2754 
                                   2755 ;-----------------
                                   2756 ; 1 Khz beep 
                                   2757 ;-----------------
      00A385                       2758 beep_1khz:: 
      00A385 1E 0D            [ 2] 2759 	pushw y 
      00A387 CF 00 05         [ 2] 2760 	ldw x,#100
      00A38A 72 01 00 23      [ 2] 2761 	ldw y,#1000
      00A38E 05 E6            [ 2] 2762 	jra beep
                                   2763 
                                   2764 ;-----------------------
                                   2765 ; BASIC: TONE expr1,expr2
                                   2766 ; used TIMER2 channel 1
                                   2767 ; to produce a tone 
                                   2768 ; arguments:
                                   2769 ;    expr1   frequency 
                                   2770 ;    expr2   duration msec.
                                   2771 ;---------------------------
      002525                       2772 tone:
      00A390 02 C7            [ 2] 2773 	pushw y 
      00A392 00 04 1E         [ 4] 2774 	call arg_list 
      00A395 0B CF            [ 1] 2775 	cp a,#2 
      00A397 00 01            [ 1] 2776 	jreq 1$
      00A399 81 16 35         [ 2] 2777 	jp syntax_error 
      00A39A                       2778 1$: 
      002531                       2779 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A39A 85 5B            [ 1]    1     ld a,(y)
      00A39C 0D               [ 1]    2     ldw x,y 
      00A39D 72 5A            [ 2]    3     ldw x,(1,x)
      00A39F 00 20 FC 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3A2 89               [ 2] 2780 	pushw x ; duration 
      00253B                       2781 	_xpop ; frequency
      00A3A2 CD 98            [ 1]    1     ld a,(y)
      00A3A4 19               [ 1]    2     ldw x,y 
      00A3A5 A1 84            [ 2]    3     ldw x,(1,x)
      00A3A7 27 07 A1 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3AB 27 26            [ 1] 2782 	ldw y,x ; frequency 
      00A3AD CC               [ 2] 2783 	popw x  ; duration 
      002547                       2784 beep:  
      00A3AE 96               [ 2] 2785 	pushw x 
      00A3AF B5 F4 24         [ 2] 2786 	ldw x,#TIM2_CLK_FREQ
      00A3B0 65               [ 2] 2787 	divw x,y ; cntr=Fclk/freq 
                                   2788 ; round to nearest integer 
      00A3B0 90 89 CD 98      [ 2] 2789 	cpw y,#TIM2_CLK_FREQ/2
      00A3B4 4B 4F            [ 1] 2790 	jrmi 2$
      00A3B6 90               [ 1] 2791 	incw x 
      002553                       2792 2$:	 
      00A3B7 CE               [ 1] 2793 	ld a,xh 
      00A3B8 00 05 90         [ 1] 2794 	ld TIM2_ARRH,a 
      00A3BB FE               [ 1] 2795 	ld a,xl 
      00A3BC 90 89 13         [ 1] 2796 	ld TIM2_ARRL,a 
                                   2797 ; 50% duty cycle 
      00A3BF 01               [ 1] 2798 	ccf 
      00A3C0 5B               [ 2] 2799 	rrcw x 
      00A3C1 02               [ 1] 2800 	ld a,xh 
      00A3C2 25 01 4C         [ 1] 2801 	ld TIM2_CCR1H,a 
      00A3C5 9F               [ 1] 2802 	ld a,xl
      00A3C5 CD 8C 94         [ 1] 2803 	ld TIM2_CCR1L,a
      00A3C8 5D 26 05 A6      [ 1] 2804 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A3CC 05 CC 96 B7      [ 1] 2805 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A3D0 90 85 81 04      [ 1] 2806 	bset TIM2_EGR,#TIM2_EGR_UG
      00A3D3 85               [ 2] 2807 	popw x 
      00A3D3 90 89 89         [ 4] 2808 	call pause02
      00A3D6 CD 98 32 72      [ 1] 2809 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A3DA 5F 00 0E 90      [ 1] 2810 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A3DE CE 00            [ 2] 2811 	popw y 
      00A3E0 1C               [ 4] 2812 	ret 
                                   2813 
                                   2814 ;-------------------------------
                                   2815 ; BASIC: ADCON 0|1 [,divisor]  
                                   2816 ; disable/enanble ADC 
                                   2817 ;-------------------------------
                           000003  2818 	ONOFF=3 
                           000001  2819 	DIVSOR=1
                           000004  2820 	VSIZE=4 
      002580                       2821 power_adc:
      00A3E1 90 E6 03         [ 4] 2822 	call arg_list 
      00A3E4 A1 03            [ 1] 2823 	cp a,#2	
      00A3E6 27 15            [ 1] 2824 	jreq 1$
      00A3E8 90 E6            [ 1] 2825 	cp a,#1 
      00A3EA 02 C7            [ 1] 2826 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A3EC 00 0F 72         [ 2] 2827 	jp syntax_error 
      00A3EF B9               [ 1] 2828 0$:	clr a 
      00A3F0 00               [ 1] 2829 	clrw x
      002590                       2830 	_xpush   ; divisor  
      00A3F1 0E 90 C3 00      [ 2]    1     subw y,#CELL_SIZE
      00A3F5 1E 25            [ 1]    2     ld (y),a 
      00A3F7 E9 A6 0A         [ 2]    3     ldw (1,y),x 
      002599                       2831 1$: _at_next 
      00A3FA CC 96 B7         [ 1]    1     ld a,(3,y)
      00A3FD 93               [ 1]    2     ldw x,y 
      00A3FD 90 89            [ 2]    3     ldw x,(4,x)
      00A3FF 72               [ 2] 2832 	tnzw x 
      00A400 A9 00            [ 1] 2833 	jreq 2$ 
      0025A2                       2834 	_xpop
      00A402 04 1E            [ 1]    1     ld a,(y)
      00A404 03               [ 1]    2     ldw x,y 
      00A405 CD 93            [ 2]    3     ldw x,(1,x)
      00A407 E0 26 04 90      [ 2]    4     addw y,#CELL_SIZE 
      0025AB                       2835 	_xdrop  
      00A40B 85 20 DA 03      [ 2]    1     addw y,#CELL_SIZE 
      00A40E 9F               [ 1] 2836 	ld a,xl
      00A40E 85 5B            [ 1] 2837 	and a,#7
      00A410 02               [ 1] 2838 	swap a 
      00A411 90 85 81         [ 1] 2839 	ld ADC_CR1,a
      00A414 72 16 50 CA      [ 1] 2840 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A414 72 00 00 23      [ 1] 2841 	bset ADC_CR1,#ADC_CR1_ADON 
      0025BE                       2842 	_usec_dly 7 
      00A418 05 A6 06         [ 2]    1     ldw x,#(16*7-2)/4
      00A41B CC               [ 2]    2     decw x
      00A41C 96               [ 1]    3     nop 
      00A41D B7 CD            [ 1]    4     jrne .-4
      00A41F 9B 25            [ 2] 2843 	jra 3$
      00A421 A1 84 27 03      [ 1] 2844 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A425 CC 96 B5 90      [ 1] 2845 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0025CF                       2846 3$:	
      00A429 F6               [ 4] 2847 	ret
                                   2848 
                                   2849 ;-----------------------------
                                   2850 ; BASIC: ADCREAD (channel)
                                   2851 ; read adc channel {0..5}
                                   2852 ; output:
                                   2853 ;   A 		TK_INTGR 
                                   2854 ;   X 		value 
                                   2855 ;-----------------------------
      0025D0                       2856 analog_read:
      00A42A 93 EE 01         [ 4] 2857 	call func_args 
      00A42D 72 A9            [ 1] 2858 	cp a,#1 
      00A42F 00 03            [ 1] 2859 	jreq 1$
      00A431 9F 27 68         [ 2] 2860 	jp syntax_error
      0025DA                       2861 1$: _xpop 
      00A434 88 CD            [ 1]    1     ld a,(y)
      00A436 98               [ 1]    2     ldw x,y 
      00A437 19 A1            [ 2]    3     ldw x,(1,x)
      00A439 80 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A43D 96 B5 FE         [ 2] 2862 	cpw x,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A440 72 5C            [ 2] 2863 	jrule 2$
      00A442 00 02            [ 1] 2864 	ld a,#ERR_BAD_VALUE
      00A444 72 5C 00         [ 2] 2865 	jp tb_error 
      00A447 02               [ 1] 2866 2$: ld a,xl
      00A448 A3 A4 A6         [ 1] 2867 	ld acc8,a 
      00A44B 27 08            [ 1] 2868 	ld a,#5
      00A44D A3 A4 C0         [ 1] 2869 	sub a,acc8 
      00A450 27 03 CC         [ 1] 2870 	ld ADC_CSR,a
      00A453 96 B5 54 02      [ 1] 2871 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A455 72 10 54 01      [ 1] 2872 	bset ADC_CR1,#ADC_CR1_ADON
      00A455 84 89 88 00 FB   [ 2] 2873 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A458 CE 54 04         [ 2] 2874 	ldw x,ADC_DRH
      00A458 0A 01            [ 1] 2875 	ld a,#TK_INTGR
      00A45A 27               [ 4] 2876 	ret 
                                   2877 
                                   2878 ;-----------------------
                                   2879 ; BASIC: DREAD(pin)
                                   2880 ; Arduino pins 
                                   2881 ; read state of a digital pin 
                                   2882 ; pin# {0..15}
                                   2883 ; output:
                                   2884 ;    A 		TK_INTGR
                                   2885 ;    X      0|1 
                                   2886 ;-------------------------
                           000001  2887 	PINNO=1
                           000001  2888 	VSIZE=1
      00260C                       2889 digital_read:
      00260C                       2890 	_vars VSIZE 
      00A45B 26 CD            [ 2]    1     sub sp,#VSIZE 
      00A45D 98 19 A1         [ 4] 2891 	call func_args
      00A460 84 27            [ 1] 2892 	cp a,#1
      00A462 07 A1            [ 1] 2893 	jreq 1$
      00A464 03 27 0D         [ 2] 2894 	jp syntax_error
      002618                       2895 1$: _xpop 
      00A467 CC 96            [ 1]    1     ld a,(y)
      00A469 B5               [ 1]    2     ldw x,y 
      00A46A EE 01            [ 2]    3     ldw x,(1,x)
      00A46A C6 00 02 AB      [ 2]    4     addw y,#CELL_SIZE 
      00A46E 03 C7 00         [ 2] 2896 	cpw x,#15 
      00A471 02 20            [ 2] 2897 	jrule 2$
      00A473 03 CD            [ 1] 2898 	ld a,#ERR_BAD_VALUE
      00A475 98 32 37         [ 2] 2899 	jp tb_error 
      00A477 CD 2B 1C         [ 4] 2900 2$:	call select_pin 
      00A477 CD 98            [ 1] 2901 	ld (PINNO,sp),a
      00A479 19 A1            [ 1] 2902 	ld a,(GPIO_IDR,x)
      00A47B 08 27            [ 1] 2903 	tnz (PINNO,sp)
      00A47D DA 5B            [ 1] 2904 	jreq 8$
      00A47F 03               [ 1] 2905 3$: srl a 
      00A480 20 1A            [ 1] 2906 	dec (PINNO,sp)
      00A482 26 FB            [ 1] 2907 	jrne 3$ 
      00A482 5B 01            [ 1] 2908 8$: and a,#1 
      00A484 CD               [ 1] 2909 	clrw x 
      00A485 A3               [ 1] 2910 	ld xl,a 
      00A486 A2               [ 1] 2911 	clr a 
      002640                       2912 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A487 CF 00            [ 2]    1     addw sp,#VSIZE 
      00A489 1A               [ 4] 2913 	ret
                                   2914 
                                   2915 
                                   2916 ;-----------------------
                                   2917 ; BASIC: DWRITE pin,0|1
                                   2918 ; Arduino pins 
                                   2919 ; write to a digital pin 
                                   2920 ; pin# {0..15}
                                   2921 ; output:
                                   2922 ;    A 		TK_INTGR
                                   2923 ;    X      0|1 
                                   2924 ;-------------------------
                           000001  2925 	PINNO=1
                           000002  2926 	PINVAL=2
                           000002  2927 	VSIZE=2
      002643                       2928 digital_write:
      002643                       2929 	_vars VSIZE 
      00A48A 55 00            [ 2]    1     sub sp,#VSIZE 
      00A48C 04 00 02         [ 4] 2930 	call arg_list  
      00A48F 85 A3            [ 1] 2931 	cp a,#2 
      00A491 A4 A6            [ 1] 2932 	jreq 1$
      00A493 26 05 CE         [ 2] 2933 	jp syntax_error
      00264F                       2934 1$: _xpop 
      00A496 00 1A            [ 1]    1     ld a,(y)
      00A498 20               [ 1]    2     ldw x,y 
      00A499 19 01            [ 2]    3     ldw x,(1,x)
      00A49A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A49A 20               [ 1] 2935 	ld a,xl 
      00A49B 35 02            [ 1] 2936 	ld (PINVAL,sp),a
      00A49C                       2937 	_xpop 
      00A49C 55 00            [ 1]    1     ld a,(y)
      00A49E 04               [ 1]    2     ldw x,y 
      00A49F 00 02            [ 2]    3     ldw x,(1,x)
      00A4A1 5B 02 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A4A5 68 00 0F         [ 2] 2938 	cpw x,#15 
      00A4A6 23 05            [ 2] 2939 	jrule 2$
      00A4A6 72 00            [ 1] 2940 	ld a,#ERR_BAD_VALUE
      00A4A8 00 23 05         [ 2] 2941 	jp tb_error 
      00A4AB A6 06 CC         [ 4] 2942 2$:	call select_pin 
      00A4AE 96 B7            [ 1] 2943 	ld (PINNO,sp),a 
      00A4B0 A6 01            [ 1] 2944 	ld a,#1
      00A4B0 CD A3            [ 1] 2945 	tnz (PINNO,sp)
      00A4B2 A2 05            [ 1] 2946 	jreq 4$
      00A4B3 48               [ 1] 2947 3$: sll a
      00A4B3 CF 00            [ 1] 2948 	dec (PINNO,sp)
      00A4B5 05 E6            [ 1] 2949 	jrne 3$
      00A4B7 02 C7            [ 1] 2950 4$: tnz (PINVAL,sp)
      00A4B9 00 04            [ 1] 2951 	jrne 5$
      00A4BB 35               [ 1] 2952 	cpl a 
      00A4BC 03 00            [ 1] 2953 	and a,(GPIO_ODR,x)
      00A4BE 02 81            [ 2] 2954 	jra 8$
      00A4C0 EA 00            [ 1] 2955 5$: or a,(GPIO_ODR,x)
      00A4C0 72 00            [ 1] 2956 8$: ld (GPIO_ODR,x),a 
      00268B                       2957 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A4C2 00 23            [ 2]    1     addw sp,#VSIZE 
      00A4C4 06               [ 4] 2958 	ret
                                   2959 
                                   2960 
                                   2961 ;-----------------------
                                   2962 ; BASIC: STOP
                                   2963 ; stop progam execution  
                                   2964 ; without resetting pointers 
                                   2965 ; the program is resumed
                                   2966 ; with RUN 
                                   2967 ;-------------------------
      00268E                       2968 stop:
      00A4C5 A6 06 CC 96 B7   [ 2] 2969 	btjt flags,#FRUN,2$
      00A4CA 81               [ 1] 2970 	clr a
      00A4CB 81               [ 4] 2971 	ret 
      002695                       2972 2$:	 
                                   2973 ; create space on cstack to save context 
      00A4CB CD A3 A2         [ 2] 2974 	ldw x,#break_point 
      00A4CE CF 00 1A         [ 4] 2975 	call puts 
      00A4D1                       2976 	_drop 2 ;drop return address 
      00A4D1 85 52            [ 2]    1     addw sp,#2 
      00269D                       2977 	_vars CTXT_SIZE ; context size 
      00A4D3 04 89            [ 2]    1     sub sp,#CTXT_SIZE 
      00A4D5 CE 00 05         [ 4] 2978 	call save_context 
      00A4D8 1F 03 CE         [ 2] 2979 	ldw x,#tib 
      00A4DB 00 01 1F         [ 2] 2980 	ldw basicptr,x
      00A4DE 05               [ 1] 2981 	clr (x)
      00A4DF CE 00 1A 20      [ 1] 2982 	clr count  
      00A4E3 CF               [ 1] 2983 	clrw x 
      00A4E4 CF 00 00         [ 2] 2984 	ldw in.w,x
      00A4E4 72 00 00 23      [ 1] 2985 	bres flags,#FRUN 
      00A4E8 05 A6 06 CC      [ 1] 2986 	bset flags,#FBREAK
      00A4EC 96 B7 E0         [ 2] 2987 	jp interpreter 
      00A4EE 0A 62 72 65 61 6B 20  2988 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2989 
                                   2990 ;-----------------------
                                   2991 ; BASIC: NEW
                                   2992 ; from command line only 
                                   2993 ; free program memory
                                   2994 ; and clear variables 
                                   2995 ;------------------------
      0026DA                       2996 new: 
      00A4EE 1E 03 CF 00 05   [ 2] 2997 	btjf flags,#FRUN,0$ 
      00A4F3 E6               [ 4] 2998 	ret 
      0026E0                       2999 0$:	
      00A4F4 02 C7 00         [ 4] 3000 	call clear_basic 
      00A4F7 04               [ 4] 3001 	ret 
                                   3002 
                                   3003 ;-----------------------------------
                                   3004 ; BASIC: ERASE \E | \F 
                                   3005 ; erase all block in range from 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   3006 ;  'app_space' to FLASH end (0x20000)
                                   3007 ;  or all EEPROM 
                                   3008 ; that contains a non zero byte.  
                                   3009 ;-----------------------------------
                           000001  3010 	LIMIT=1 
                           000003  3011 	VSIZE = 3 
      0026E4                       3012 erase:
      00A4F8 1E 05 CF 00      [ 1] 3013 	clr farptr 
      0026E8                       3014 	_vars VSIZE 
      00A4FC 01 85            [ 2]    1     sub sp,#VSIZE 
      00A4FE 5B 04 FC         [ 4] 3015 	call next_token 
      00A501 A1 04            [ 1] 3016 	cp a,#TK_CHAR 
      00A501 72 01            [ 1] 3017 	jreq 0$ 
      00A503 00 23 02         [ 2] 3018 	jp syntax_error
      00A506 4F 81 DB         [ 4] 3019 0$: call get_char 
      00A508 A4 DF            [ 1] 3020 	and a,#0XDF 
      00A508 72 09            [ 1] 3021 	cp a,#'E
      00A50A 00 23            [ 1] 3022 	jrne 1$
      00A50C 12 5B 02         [ 2] 3023 	ldw x,#EEPROM_BASE 
      00A50F CD A0 86         [ 2] 3024 	ldw farptr+1,x 
      00A512 5B 04 72         [ 2] 3025 	ldw x,#EEPROM_END
      00A515 19               [ 1] 3026 	clr a 
      00A516 00 23            [ 2] 3027 	jra 3$ 
      00A518 72 10            [ 1] 3028 1$: cp a,#'F 
      00A51A 00 23            [ 1] 3029 	jreq 2$
      00A51C CC 97 60         [ 2] 3030 	ldw x,#err_bad_value
      00A51F CE 00 1C         [ 2] 3031 	jp tb_error
      002713                       3032 2$:
      00A522 C3 00 1E         [ 2] 3033 	ldw x,#app_space  
      00A525 2B 0C AE         [ 2] 3034 	ldw farptr+1,x 
      00A528 96 28            [ 1] 3035 	ld a,#(FLASH_END>>16)&0XFF 
      00A52A CD 89 B7         [ 2] 3036 	ldw x,#FLASH_END&0xffff
      00271E                       3037 3$:
      00A52D 55 00            [ 1] 3038 	ld (LIMIT,sp),a 
      00A52F 04 00            [ 2] 3039 	ldw (LIMIT+1,sp),x 
                                   3040  ; operation done from RAM
                                   3041  ; copy code to RAM in tib   
      00A531 02 81 D4         [ 4] 3042 	call move_erase_to_ram
      00A533                       3043 4$:	 
      00A533 5B 02 5A         [ 4] 3044     call scan_block 
      00A535 27 08            [ 1] 3045 	jreq 5$  ; block already erased 
      00A535 CD 9C            [ 1] 3046     ld a,#'E 
      00A537 F2 CD 94         [ 4] 3047     call putc 
      00A53A 45 CE 00         [ 4] 3048 	call block_erase   
                                   3049 ; this block is clean, next  
      00A53D 1E CF 00         [ 2] 3050 5$:	ldw x,#BLOCK_SIZE
      00A540 31 CF 00         [ 4] 3051 	call incr_farptr
                                   3052 ; check limit, 24 bit substraction  	
      00A543 33 5F            [ 1] 3053 	ld a,(LIMIT,sp)
      00A545 CF 00            [ 2] 3054 	ldw x,(LIMIT+1,sp)
      00A547 07 72 5F 00      [ 2] 3055 	subw x,farptr+1
      00A54B 09 72 5F         [ 1] 3056 	sbc a,farptr 
      00A54E 00 0A            [ 1] 3057 	jrugt 4$ 
      00A550 CE 00 1C         [ 4] 3058 9$: call clear_basic
      00A553 CF 00            [ 2] 3059 	ldw x,(LIMIT+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A555 05 E6 02         [ 2] 3060 	cpw x,#EEPROM_END
      00A558 C7 00            [ 1] 3061 	jrne 10$
      00A55A 04 35 03         [ 4] 3062 	call func_eefree 
      002752                       3063 10$:
      002752                       3064 	_drop VSIZE 
      00A55D 00 02            [ 2]    1     addw sp,#VSIZE 
      00A55F 72               [ 4] 3065 	ret 
                                   3066 	
                                   3067 
                                   3068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3069 ;  check for application signature 
                                   3070 ; output:
                                   3071 ;   Carry    0 app present 
                                   3072 ;            1 no app installed  
                                   3073 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002755                       3074 qsign: 
      00A560 10 00 23         [ 2] 3075 	ldw x,app_sign 
      00A563 CC 97 60         [ 2] 3076 	cpw x,SIGNATURE ; "TB" 
      00A566 81               [ 4] 3077 	ret 
                                   3078 
                                   3079 ;--------------------------------------
                                   3080 ;  fill write buffer 
                                   3081 ;  input:
                                   3082 ;    y  point to output buffer 
                                   3083 ;    x  point to source 
                                   3084 ;    a  bytes to write in buffer 
                                   3085 ;  output:
                                   3086 ;    y   += A 
                                   3087 ;    X   += A 
                                   3088 ;    A   0 
                                   3089 ;---------------------------------------
      00275C                       3090 fill_write_buffer:
      00A566 AE               [ 1] 3091 	push a 
      00A567 17               [ 1] 3092 	tnz a 
      00A568 FF 94            [ 1] 3093 	jreq 9$ 
      00A56A CC               [ 1] 3094 1$: ld a,(x)
      00A56B 97               [ 1] 3095 	incw x 
      00A56C 41 F7            [ 1] 3096 	ld (y),a 
      00A56D 90 5C            [ 1] 3097 	incw y 
      00A56D CD 98            [ 1] 3098 	dec (1,sp) 
      00A56F 19 A1            [ 1] 3099 	jrne 1$ 
      00A571 85               [ 1] 3100 9$:	pop a 
      00A572 27               [ 4] 3101     ret 	
                                   3102 
                                   3103 ;--------------------------------------
                                   3104 ;  fill pad buffer with zero 
                                   3105 ;  input:
                                   3106 ;	none 
                                   3107 ;  output:
                                   3108 ;    y     buffer address  
                                   3109 ;--------------------------------------
      00276C                       3110 clear_block_buffer:
      00A573 03               [ 1] 3111 	push a 
      00A574 CC 96 B5 CD      [ 2] 3112 	ldw y,#block_buffer 
      00A578 98 41            [ 2] 3113 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A57A CF 00            [ 1] 3114 	ld a,#BLOCK_SIZE   
      00A57C 1A CD            [ 1] 3115 1$:	clr (y)
      00A57E 89 63            [ 1] 3116 	incw y
      00A580 27               [ 1] 3117 	dec a  
      00A581 03 CD            [ 1] 3118 	jrne 1$ 	
      00A583 89 6A            [ 2] 3119 9$: popw y 
      00A585 72               [ 1] 3120 	pop a 			
      00A586 3F               [ 4] 3121 	ret 
                                   3122 
                                   3123 
                                   3124 ;---------------------------------------
                                   3125 ; BASIC: SAVE
                                   3126 ; write application from RAM to FLASH
                                   3127 ; at UFLASH address
                                   3128 ;--------------------------------------
                           000001  3129 	XTEMP=1
                           000003  3130 	COUNT=3  ; last count bytes written 
                           000004  3131 	CNT_LO=4 ; count low byte 
                           000005  3132 	TOWRITE=5 ; how bytes left to write  
                           000006  3133 	VSIZE=6 
      002780                       3134 save_app:
      00A587 00               [ 2] 3135 	pushw x 
      00A588 1A 72            [ 2] 3136 	pushw y 
      002783                       3137 	_vars VSIZE
      00A58A 5C 00            [ 2]    1     sub sp,#VSIZE 
      00A58C 1B 72 3F         [ 4] 3138 	call qsign 
      00A58F 00 1A            [ 1] 3139 	jrne 1$
      00A591 72 5C 00         [ 2] 3140 	ldw x,#CANT_DO 
      00A594 1B 72 C7         [ 4] 3141 	call puts 
      00A597 00 1A 81         [ 2] 3142 	jp 9$
      00A59A                       3143 1$: 
      00A59A 90 89 AE         [ 2] 3144 	ldw x,txtbgn
      00A59D 00 64 90         [ 2] 3145 	cpw x,txtend 
      00A5A0 AE 03            [ 1] 3146 	jrult 2$ 
      00A5A2 E8 20 22         [ 2] 3147 	ldw x,#NO_APP
      00A5A5 CD 09 37         [ 4] 3148 	call puts 
      00A5A5 90 89 CD         [ 2] 3149 	jp 9$
      0027A4                       3150 2$: 
                                   3151 ; block programming flash
                                   3152 ; must be done from RAM
                                   3153 ; moved in tib  
      00A5A8 99 E1 A1         [ 4] 3154 	call move_prg_to_ram
                                   3155 ; initialize farptr 
                                   3156 ; to app_sign address 
      00A5AB 02 27 03 CC      [ 1] 3157 	clr farptr 
      00A5AF 96 B5 80         [ 2] 3158 	ldw x,#app_sign 
      00A5B1 CF 00 19         [ 2] 3159 	ldw farptr+1,x
                                   3160 ; initialize local variables 
      00A5B1 90 F6 93         [ 4] 3161 	call prog_size
      00A5B4 EE 01            [ 2] 3162 	ldw (TOWRITE,sp),x
      00A5B6 72 A9            [ 1] 3163 	clr (COUNT,sp)
                                   3164 ; first bock 
                                   3165 ; containt signature 2 bytes 
                                   3166 ; and size 	2 bytes 
                                   3167 ; use Y as pointer to block_buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A5B8 00 03 89         [ 4] 3168 	call clear_block_buffer ; -- y=*block_buffer	
                                   3169 ; write signature
      00A5BB 90 F6 93         [ 2] 3170 	ldw x,SIGNATURE ; "BC" 
      00A5BE EE 01            [ 2] 3171 	ldw (y),x 
      00A5C0 72 A9 00 03      [ 2] 3172 	addw y,#2
      00A5C4 90 93            [ 2] 3173 	ldw x,(TOWRITE,sp)
      00A5C6 85 FF            [ 2] 3174 	ldw (y),x
      00A5C7 72 A9 00 02      [ 2] 3175 	addw y,#2   
      00A5C7 89 AE            [ 1] 3176 	ld a,#(BLOCK_SIZE-4)
      00A5C9 F4 24            [ 1] 3177 	ld (CNT_LO,sp),a 
      00A5CB 65 90 A3         [ 2] 3178 	cpw x,#(BLOCK_SIZE-4) 
      00A5CE 7A 12            [ 1] 3179 	jrugt 3$
      00A5D0 2B               [ 1] 3180 	ld a,xl 
      00A5D1 01 5C            [ 1] 3181 3$:	ld (CNT_LO,sp),a   
      00A5D3 CE 00 1B         [ 2] 3182 	ldw x,txtbgn 
      00A5D3 9E C7            [ 2] 3183 	ldw (XTEMP,sp),x 
      0027DD                       3184 32$: 
      00A5D5 53 0D            [ 2] 3185 	ldw x,(XTEMP,sp)
      00A5D7 9F C7            [ 1] 3186 	ld a,(CNT_LO,sp)
      00A5D9 53 0E 8C         [ 4] 3187 	call fill_write_buffer 
      00A5DC 56 9E            [ 2] 3188 	ldw (XTEMP,sp),x 
      00A5DE C7 53 0F         [ 2] 3189 	ldw x,#block_buffer
      00A5E1 9F C7 53         [ 4] 3190 	call write_buffer
      00A5E4 10 72 10         [ 2] 3191 	ldw x,#BLOCK_SIZE 
      00A5E7 53 08 72         [ 4] 3192 	call incr_farptr  
                                   3193 ; following blocks 
      00A5EA 10 53            [ 2] 3194 	ldw x,(XTEMP,sp)
      00A5EC 00 72 10         [ 2] 3195 	cpw x,txtend 
      00A5EF 53 04            [ 1] 3196 	jruge 9$ 
      00A5F1 85 CD            [ 2] 3197 	ldw x,(TOWRITE,sp)
      00A5F3 AA 59 72         [ 2] 3198 	subw x,(COUNT,sp)
      00A5F6 11 53            [ 2] 3199 	ldw (TOWRITE,sp),x 
      00A5F8 08 72            [ 1] 3200 	ld a,#BLOCK_SIZE 
      00A5FA 11 53 00         [ 2] 3201 	cpw x,#BLOCK_SIZE 
      00A5FD 90 85            [ 1] 3202 	jruge 4$ 
      00A5FF 81               [ 1] 3203 	ld a,xl 
      00A600 6B 04            [ 1] 3204 4$:	ld (CNT_LO,sp),a 
      00A600 CD 99 E1         [ 4] 3205 	call clear_block_buffer 
      00A603 A1 02            [ 2] 3206 	jra 32$ 
      00280F                       3207 9$:	_drop VSIZE 
      00A605 27 12            [ 2]    1     addw sp,#VSIZE 
      00A607 A1 01            [ 2] 3208     popw y 
      00A609 27               [ 2] 3209 	popw x 
      00A60A 03               [ 4] 3210 	ret 
                                   3211 
                                   3212 
      00A60B CC 96                 3213 SIGNATURE: .ascii "TB"
      00A60D B5 4F 5F 72 A2 00 03  3214 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             90 F7 90 EF 01 90 E6
             03 93 EE 04 5D 27 25
             90 F6 93 EE 01 72 A9
             00 03 72 A9 00 03 9F
             A4 07 4E C7 54 01 72
             16 50 CA 72 10 54 01
             AE 00 1B 5A 9D 26 FA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal  20-Bits]



             5C 46 20 62 65 66 6F
             72 65 00
      00A646 08 72 11 54 01 72 17  3215 NO_APP: .asciz "No application in RAM"
             50 CA 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3216 
                                   3217 ;---------------------
                                   3218 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3219 ; write 1 or more byte to FLASH or EEPROM
                                   3220 ; starting at address  
                                   3221 ; input:
                                   3222 ;   expr1  	is address 
                                   3223 ;   expr2,...,exprn   are bytes to write
                                   3224 ; output:
                                   3225 ;   none 
                                   3226 ;---------------------
      00A64F                       3227 write:
      00A64F 81 1A A5         [ 4] 3228 	call expression
      00A650 A1 84            [ 1] 3229 	cp a,#TK_INTGR 
      00A650 CD 99            [ 1] 3230 	jreq 0$
      00A652 DC A1 01         [ 2] 3231 	jp syntax_error
      002879                       3232 0$: _xpop 
      00A655 27 03            [ 1]    1     ld a,(y)
      00A657 CC               [ 1]    2     ldw x,y 
      00A658 96 B5            [ 2]    3     ldw x,(1,x)
      00A65A 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A65E 01 72 A9         [ 1] 3233 	ld farptr,a 
      00A661 00 03 A3         [ 2] 3234 	ldw ptr16,x 
      002888                       3235 1$:	
      00A664 00 05 23         [ 4] 3236 	call next_token 
      00A667 05 A6            [ 1] 3237 	cp a,#TK_COMMA 
      00A669 0A CC            [ 1] 3238 	jreq 2$ 
      00A66B 96 B7            [ 2] 3239 	jra 9$ ; no more data 
      00A66D 9F C7 00         [ 4] 3240 2$:	call next_token 
      00A670 0F A6            [ 1] 3241 	cp a,#TK_CHAR 
      00A672 05 C0            [ 1] 3242 	jreq 4$ 
      00A674 00 0F            [ 1] 3243 	cp a,#TK_QSTR
      00A676 C7 54            [ 1] 3244 	jreq 6$
      00289C                       3245 	_unget_token 
      00A678 00 72 16 54 02   [ 1]    1      mov in,in.saved  
      00A67D 72 10 54         [ 4] 3246 	call expression
      00A680 01 72            [ 1] 3247 	cp a,#TK_INTGR
      00A682 0F 54            [ 1] 3248 	jreq 3$
      00A684 00 FB CE         [ 2] 3249 	jp syntax_error
      0028AB                       3250 3$:	_xpop 
      00A687 54 04            [ 1]    1     ld a,(y)
      00A689 A6               [ 1]    2     ldw x,y 
      00A68A 84 81            [ 2]    3     ldw x,(1,x)
      00A68C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A68C 52               [ 1] 3251 	ld a,xl 
      00A68D 01               [ 1] 3252 	clrw x 
      00A68E CD 99 DC         [ 4] 3253 	call write_byte
      00A691 A1 01            [ 2] 3254 	jra 1$ 
      0028BB                       3255 4$: ; write character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A693 27               [ 1] 3256 	ld a,(x)
      00A694 03 CC 96 B5      [ 1] 3257 	inc in 
      00A698 90               [ 1] 3258 	clrw x 
      00A699 F6 93 EE         [ 4] 3259 	call write_byte 
      00A69C 01 72            [ 2] 3260 	jra 1$ 
      0028C6                       3261 6$: ; write string 
      00A69E A9               [ 2] 3262 	pushw x 
      00A69F 00               [ 1] 3263 	ld a,(x)
      00A6A0 03 A3 00 0F      [ 1] 3264 	inc in 
      00A6A4 23               [ 1] 3265 	clrw x 
      00A6A5 05 A6 0A         [ 4] 3266 	call write_byte 
      00A6A8 CC               [ 2] 3267 	popw x 
      00A6A9 96               [ 1] 3268 	ld a,(x)
      00A6AA B7 CD            [ 1] 3269 	jreq 1$
      00A6AC AB               [ 1] 3270 	incw x 
      00A6AD 9C 6B            [ 2] 3271 	jra 6$ 	
      0028D7                       3272 9$:
      00A6AF 01               [ 4] 3273 	ret 
                                   3274 
                                   3275 
                                   3276 ;---------------------
                                   3277 ;BASIC: CHAR(expr)
                                   3278 ; évaluate expression 
                                   3279 ; and take the 7 least 
                                   3280 ; bits as ASCII character
                                   3281 ; output: 
                                   3282 ; 	A char 
                                   3283 ;---------------------
      0028D8                       3284 func_char:
      00A6B0 E6 01 0D         [ 4] 3285 	call func_args 
      00A6B3 01 27            [ 1] 3286 	cp a,#1
      00A6B5 05 44            [ 1] 3287 	jreq 1$
      00A6B7 0A 01 26         [ 2] 3288 	jp syntax_error
      0028E2                       3289 1$:	_xpop
      00A6BA FB A4            [ 1]    1     ld a,(y)
      00A6BC 01               [ 1]    2     ldw x,y 
      00A6BD 5F 97            [ 2]    3     ldw x,(1,x)
      00A6BF 4F 5B 01 81      [ 2]    4     addw y,#CELL_SIZE 
      00A6C3 9F               [ 1] 3290 	ld a,xl
      00A6C3 52 02            [ 1] 3291 	and a,#0x7f 
      00A6C5 CD               [ 4] 3292 	ret
                                   3293 
                                   3294 ;---------------------
                                   3295 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3296 ; extract first character 
                                   3297 ; of string argument 
                                   3298 ; output:
                                   3299 ;    A:X    int24 
                                   3300 ;---------------------
      0028EF                       3301 ascii:
      00A6C6 99 E1            [ 1] 3302 	ld a,#TK_LPAREN
      00A6C8 A1 02 27         [ 4] 3303 	call expect 
      00A6CB 03 CC 96         [ 4] 3304 	call next_token 
      00A6CE B5 90            [ 1] 3305 	cp a,#TK_QSTR 
      00A6D0 F6 93            [ 1] 3306 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A6D2 EE 01            [ 1] 3307 	cp a,#TK_CHAR 
      00A6D4 72 A9            [ 1] 3308 	jreq 2$ 
      00A6D6 00 03            [ 1] 3309 	cp a,#TK_CFUNC 
      00A6D8 9F 6B            [ 1] 3310 	jreq 0$
      00A6DA 02 90 F6         [ 2] 3311 	jp syntax_error
      002906                       3312 0$: ; cfunc 
      00A6DD 93               [ 4] 3313 	call (x)
      00A6DE EE 01            [ 2] 3314 	jra 3$
      002909                       3315 1$: ; quoted string 
      00A6E0 72               [ 1] 3316 	ld a,(x)
      00A6E1 A9               [ 1] 3317 	push a  
      00A6E2 00 03 A3         [ 4] 3318 	call skip_string
      00A6E5 00               [ 1] 3319 	pop a  	
      00A6E6 0F 23            [ 2] 3320 	jra 3$ 
      002911                       3321 2$: ; character 
      00A6E8 05 A6 0A         [ 4] 3322 	call get_char 
      00A6EB CC               [ 1] 3323 3$:	clrw x 
      00A6EC 96               [ 1] 3324 	rlwa x   
      002916                       3325 4$:	_xpush  
      00A6ED B7 CD AB 9C      [ 2]    1     subw y,#CELL_SIZE
      00A6F1 6B 01            [ 1]    2     ld (y),a 
      00A6F3 A6 01 0D         [ 2]    3     ldw (1,y),x 
      00A6F6 01 27            [ 1] 3326 	ld a,#TK_RPAREN 
      00A6F8 05 48 0A         [ 4] 3327 	call expect
      002924                       3328 9$:	
      002924                       3329 	_xpop  
      00A6FB 01 26            [ 1]    1     ld a,(y)
      00A6FD FB               [ 1]    2     ldw x,y 
      00A6FE 0D 02            [ 2]    3     ldw x,(1,x)
      00A700 26 05 43 E4      [ 2]    4     addw y,#CELL_SIZE 
      00A704 00               [ 4] 3330 	ret 
                                   3331 
                                   3332 ;---------------------
                                   3333 ;BASIC: KEY
                                   3334 ; wait for a character 
                                   3335 ; received from STDIN 
                                   3336 ; input:
                                   3337 ;	none 
                                   3338 ; output:
                                   3339 ;	a	 character 
                                   3340 ;---------------------
      00292E                       3341 key:
      00A705 20 02 EA         [ 4] 3342 	call getc 
      00A708 00               [ 4] 3343 	ret
                                   3344 
                                   3345 ;----------------------
                                   3346 ; BASIC: QKEY
                                   3347 ; Return true if there 
                                   3348 ; is a character in 
                                   3349 ; waiting in STDIN 
                                   3350 ; input:
                                   3351 ;  none 
                                   3352 ; output:
                                   3353 ;   A     0|-1
                                   3354 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      002932                       3355 qkey:: 
      00A709 E7               [ 1] 3356 	clrw x 
      00A70A 00 5B 02         [ 1] 3357 	ld a,rx1_head
      00A70D 81 00 2F         [ 1] 3358 	sub a,rx1_tail 
      00A70E 27 03            [ 1] 3359 	jreq 9$ 
      00A70E 72               [ 2] 3360 	cplw x
      00A70F 00 00            [ 1] 3361 	ld a,#255    
      00293E                       3362 9$: 
      00A711 23               [ 4] 3363 	ret 
                                   3364 
                                   3365 ;---------------------
                                   3366 ; BASIC: GPIO(port,reg)
                                   3367 ; return gpio register address 
                                   3368 ; expr {PORTA..PORTI}
                                   3369 ; input:
                                   3370 ;   none 
                                   3371 ; output:
                                   3372 ;   A:X 	gpio register address
                                   3373 ;----------------------------
                                   3374 ;	N=PORT
                                   3375 ;	T=REG 
      00293F                       3376 gpio:
      00A712 02 4F 81         [ 4] 3377 	call func_args 
      00A715 A1 02            [ 1] 3378 	cp a,#2
      00A715 AE A7            [ 1] 3379 	jreq 1$
      00A717 3C CD 89         [ 2] 3380 	jp syntax_error  
      002949                       3381 1$:	_at_next 
      00A71A B7 5B 02         [ 1]    1     ld a,(3,y)
      00A71D 52               [ 1]    2     ldw x,y 
      00A71E 04 CD            [ 2]    3     ldw x,(4,x)
      00A720 A0 76 AE         [ 2] 3382 	cpw x,#PA_BASE 
      00A723 16 90            [ 1] 3383 	jrmi bad_port
      00A725 CF 00 05         [ 2] 3384 	cpw x,#PI_BASE+1 
      00A728 7F 72            [ 1] 3385 	jrpl bad_port
      00A72A 5F               [ 2] 3386 	pushw x 
      00295A                       3387 	_xpop
      00A72B 00 04            [ 1]    1     ld a,(y)
      00A72D 5F               [ 1]    2     ldw x,y 
      00A72E CF 00            [ 2]    3     ldw x,(1,x)
      00A730 01 72 11 00      [ 2]    4     addw y,#CELL_SIZE 
      00A734 23 72 18         [ 2] 3388 	addw x,(1,sp)
      002966                       3389 	_drop 2 
      00A737 00 23            [ 2]    1     addw sp,#2 
      00A739 CC               [ 1] 3390 	clr a 
      00A73A 97               [ 4] 3391 	ret
      00296A                       3392 bad_port:
      00A73B 60 0A            [ 1] 3393 	ld a,#ERR_BAD_VALUE
      00A73D 62 72 65         [ 2] 3394 	jp tb_error
                                   3395 
                                   3396 
                                   3397 ;-------------------------
                                   3398 ; BASIC: UFLASH 
                                   3399 ; return free flash address
                                   3400 ; align to BLOCK address 
                                   3401 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   3402 ;  none 
                                   3403 ; output:
                                   3404 ;	A		TK_INTGR
                                   3405 ;   xstack	free address 
                                   3406 ;---------------------------
      00296F                       3407 uflash:
      00A740 61 6B 20         [ 4] 3408 	call qsign 
      00A743 70 6F            [ 1] 3409 	jrne 1$
      00A745 69 6E 74         [ 2] 3410 	ldw x,#app_space 
      00A748 2C 20 52 55      [ 2] 3411 	addw x,app_size 
      00A74C 4E 20 74         [ 2] 3412 	addw x,#4
                                   3413 ; align on 128 bytes block 
      00A74F 6F 20 72         [ 2] 3414 	addw x,#BLOCK_SIZE 
      00A752 65               [ 1] 3415 	ld a,xl 
      00A753 73 75            [ 1] 3416 	and a,#0x80 
      00A755 6D               [ 1] 3417 	ld xl,a 
      00A756 65 2E            [ 2] 3418 	jra 2$
      00A758 0A 00 80         [ 2] 3419 1$:	ldw x,#app_space 
      00A75A                       3420 2$:
      00A75A 72               [ 1] 3421 	clr a 
      00A75B 01               [ 4] 3422 	ret 
                                   3423 
                                   3424 
                                   3425 ;---------------------
                                   3426 ; BASIC: USR(addr,arg)
                                   3427 ; execute a function written 
                                   3428 ; in binary code.
                                   3429 ; input:
                                   3430 ;   addr	routine address 
                                   3431 ;   arg 	is an argument
                                   3432 ;           it can be ignore 
                                   3433 ;           by cally. 
                                   3434 ; output:
                                   3435 ;   xstack 	value returned by cally  
                                   3436 ;---------------------
      00298C                       3437 usr:
      00A75C 00 23 01         [ 4] 3438 	call func_args 
      00A75F 81 02            [ 1] 3439 	cp a,#2
      00A760 27 03            [ 1] 3440 	jreq 1$  
      00A760 CD 94 ED         [ 2] 3441 	jp syntax_error 
      002996                       3442 1$: 
      002996                       3443 	_at_next ; A:X addr 
      00A763 81 E6 03         [ 1]    1     ld a,(3,y)
      00A764 93               [ 1]    2     ldw x,y 
      00A764 72 5F            [ 2]    3     ldw x,(4,x)
      00A766 00 19 52         [ 2] 3444 	ldw ptr16,X 
      00299F                       3445 	_xpop  ; arg 
      00A769 03 CD            [ 1]    1     ld a,(y)
      00A76B 98               [ 1]    2     ldw x,y 
      00A76C 19 A1            [ 2]    3     ldw x,(1,x)
      00A76E 04 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      0029A8                       3446 	_store_top ; overwrite addr 
      00A772 96 B5            [ 1]    1     ld (y),a 
      00A774 CD 98 5B         [ 2]    2     ldw (1,y),x     
      00A777 A4 DF A1 45      [ 6] 3447     call [ptr16]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A77B 26               [ 4] 3448 	ret 
                                   3449 
                                   3450 
                                   3451 ;------------------------------
                                   3452 ; BASIC: BYE 
                                   3453 ; halt mcu in its lowest power mode 
                                   3454 ; wait for reset or external interrupt
                                   3455 ; do a cold start on wakeup.
                                   3456 ;------------------------------
      0029B2                       3457 bye:
      00A77C 0C AE 40 00 CF   [ 2] 3458 	btjf UART1_SR,#UART_SR_TC,.
      00A781 00               [10] 3459 	halt
      00A782 1A AE 47         [ 2] 3460 	jp cold_start  
                                   3461 
                                   3462 ;----------------------------------
                                   3463 ; BASIC: SLEEP 
                                   3464 ; halt mcu until reset or external
                                   3465 ; interrupt.
                                   3466 ; Resume progam after SLEEP command
                                   3467 ;----------------------------------
      0029BB                       3468 sleep:
      00A785 FF 4F 20 15 A1   [ 2] 3469 	btjf UART1_SR,#UART_SR_TC,.
      00A78A 46 27 06 AE      [ 1] 3470 	bset flags,#FSLEEP
      00A78E 95               [10] 3471 	halt 
      00A78F D9               [ 4] 3472 	ret 
                                   3473 
                                   3474 ;-------------------------------
                                   3475 ; BASIC: PAUSE expr 
                                   3476 ; suspend execution for n msec.
                                   3477 ; input:
                                   3478 ;	none
                                   3479 ; output:
                                   3480 ;	none 
                                   3481 ;------------------------------
      0029C6                       3482 pause:
      00A790 CC 96 B7         [ 4] 3483 	call expression
      00A793 A1 84            [ 1] 3484 	cp a,#TK_INTGR
      00A793 AE B6            [ 1] 3485 	jreq 1$ 
      00A795 00 CF 00         [ 2] 3486 	jp syntax_error
      0029D0                       3487 1$: _xpop 
      00A798 1A A6            [ 1]    1     ld a,(y)
      00A79A 02               [ 1]    2     ldw x,y 
      00A79B AE 7F            [ 2]    3     ldw x,(1,x)
      00A79D FF A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A79E                       3488 pause02:
      00A79E 6B 01 1F         [ 2] 3489 	ldw timer,x 
      00A7A1 02 CD 87         [ 2] 3490 1$: ldw x,timer 
      00A7A4 54               [ 2] 3491 	tnzw x 
      00A7A5 27 03            [ 1] 3492 	jreq 2$
      00A7A5 CD               [10] 3493 	wfi 
      00A7A6 88 DA            [ 1] 3494 	jrne 1$
      0029E5                       3495 2$:	
      00A7A8 27               [ 4] 3496 	ret 
                                   3497 
                                   3498 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3499 ; BASIC: AWU expr
                                   3500 ; halt mcu for 'expr' milliseconds
                                   3501 ; use Auto wakeup peripheral
                                   3502 ; all oscillators stopped except LSI
                                   3503 ; range: 1ms - 511ms
                                   3504 ; input:
                                   3505 ;  none
                                   3506 ; output:
                                   3507 ;  none:
                                   3508 ;------------------------------
      0029E6                       3509 awu:
      00A7A9 08 A6 45         [ 4] 3510   call expression
      00A7AC CD 89            [ 1] 3511   cp a,#TK_INTGR
      00A7AE 5A CD            [ 1] 3512   jreq 1$
      00A7B0 87 D2 AE         [ 2] 3513   jp syntax_error
      0029F0                       3514 1$: _xpop 
      00A7B3 00 80            [ 1]    1     ld a,(y)
      00A7B5 CD               [ 1]    2     ldw x,y 
      00A7B6 88 CC            [ 2]    3     ldw x,(1,x)
      00A7B8 7B 01 1E 02      [ 2]    4     addw y,#CELL_SIZE 
      0029F9                       3515 awu02:
      00A7BC 72 B0 00         [ 2] 3516   cpw x,#5120
      00A7BF 1A C2            [ 1] 3517   jrmi 1$ 
      00A7C1 00 19 22 E0      [ 1] 3518   mov AWU_TBR,#15 
      00A7C5 CD 94            [ 1] 3519   ld a,#30
      00A7C7 ED               [ 2] 3520   div x,a
      00A7C8 1E 02            [ 1] 3521   ld a,#16
      00A7CA A3               [ 2] 3522   div x,a 
      00A7CB 47 FF            [ 2] 3523   jra 4$
      002A0A                       3524 1$: 
      00A7CD 26 03 CD         [ 2] 3525   cpw x,#2048
      00A7D0 9D 51            [ 1] 3526   jrmi 2$ 
      00A7D2 35 0E 50 F2      [ 1] 3527   mov AWU_TBR,#14
      00A7D2 5B 03            [ 1] 3528   ld a,#80
      00A7D4 81               [ 2] 3529   div x,a 
      00A7D5 20 10            [ 2] 3530   jra 4$   
      002A18                       3531 2$:
      00A7D5 CE B6 00 C3      [ 1] 3532   mov AWU_TBR,#7
      002A1C                       3533 3$:  
                                   3534 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A7D9 A8 95 81         [ 2] 3535   cpw x,#64 
      00A7DC 23 07            [ 2] 3536   jrule 4$ 
      00A7DC 88 4D 27 0A      [ 1] 3537   inc AWU_TBR 
      00A7E0 F6               [ 2] 3538   srlw x 
      00A7E1 5C 90            [ 2] 3539   jra 3$ 
      002A28                       3540 4$:
      00A7E3 F7               [ 1] 3541   ld a, xl
      00A7E4 90               [ 1] 3542   dec a 
      00A7E5 5C 0A            [ 1] 3543   jreq 5$
      00A7E7 01               [ 1] 3544   dec a 	
      002A2D                       3545 5$: 
      00A7E8 26 F6            [ 1] 3546   and a,#0x3e 
      00A7EA 84 81 F1         [ 1] 3547   ld AWU_APR,a 
      00A7EC 72 18 50 F0      [ 1] 3548   bset AWU_CSR,#AWU_CSR_AWUEN
      00A7EC 88               [10] 3549   halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3550 
      00A7ED 90               [ 4] 3551   ret 
                                   3552 
                                   3553 ;------------------------------
                                   3554 ; BASIC: TICKS
                                   3555 ; return msec ticks counter value 
                                   3556 ; input:
                                   3557 ; 	none 
                                   3558 ; output:
                                   3559 ;	X 		TK_INTGR
                                   3560 ;-------------------------------
      002A38                       3561 get_ticks:
      00A7EE AE 16 E0         [ 1] 3562 	ld a,ticks 
      00A7F1 90 89 A6         [ 2] 3563 	ldw x,ticks+1 
      00A7F4 80               [ 4] 3564 	ret 
                                   3565 
                                   3566 ;------------------------------
                                   3567 ; BASIC: ABS(expr)
                                   3568 ; return absolute value of expr.
                                   3569 ; input:
                                   3570 ;   none
                                   3571 ; output:
                                   3572 ;   xstack    positive int24 
                                   3573 ;-------------------------------
      002A3F                       3574 abs:
      00A7F5 90 7F 90         [ 4] 3575 	call func_args 
      00A7F8 5C 4A            [ 1] 3576 	cp a,#1 
      00A7FA 26 F9            [ 1] 3577 	jreq 0$ 
      00A7FC 90 85 84         [ 2] 3578 	jp syntax_error
      002A49                       3579 0$:  
      00A7FF 81 01 E0         [ 4] 3580 	call abs24 
      00A800                       3581 	_xpop 
      00A800 89 90            [ 1]    1     ld a,(y)
      00A802 89               [ 1]    2     ldw x,y 
      00A803 52 06            [ 2]    3     ldw x,(1,x)
      00A805 CD A7 D5 26      [ 2]    4     addw y,#CELL_SIZE 
      00A809 09               [ 4] 3582 	ret 
                                   3583 
                                   3584 ;------------------------------
                                   3585 ; BASIC: LSHIFT(expr1,expr2)
                                   3586 ; logical shift left expr1 by 
                                   3587 ; expr2 bits 
                                   3588 ; output:
                                   3589 ; 	A:x 	result 
                                   3590 ;------------------------------
      002A56                       3591 lshift:
      00A80A AE A8 97         [ 4] 3592 	call func_args
      00A80D CD 89            [ 1] 3593 	cp a,#2 
      00A80F B7 CC            [ 1] 3594 	jreq 1$
      00A811 A8 8F 35         [ 2] 3595 	jp syntax_error
      00A813                       3596 1$: _xpop 
      00A813 CE 00            [ 1]    1     ld a,(y)
      00A815 1C               [ 1]    2     ldw x,y 
      00A816 C3 00            [ 2]    3     ldw x,(1,x)
      00A818 1E 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A81C A8               [ 1] 3597 	ld a,xl 
      00A81D D9               [ 1] 3598 	push a      
      002A6B                       3599 	_xpop  ; T>A:X 
      00A81E CD 89            [ 1]    1     ld a,(y)
      00A820 B7               [ 1]    2     ldw x,y 
      00A821 CC A8            [ 2]    3     ldw x,(1,x)
      00A823 8F A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A824 0D 01            [ 1] 3600 	tnz (1,sp) 
      00A824 CD 87            [ 1] 3601 	jreq 4$
      00A826 94               [ 1] 3602 2$:	rcf 
      00A827 72               [ 2] 3603 	rlcw x 
      00A828 5F               [ 1] 3604 	rlc a 
      00A829 00 19            [ 1] 3605 	dec (1,sp) 
      00A82B AE B6            [ 1] 3606 	jrne 2$
      002A7F                       3607 4$: _drop 1 
      00A82D 00 CF            [ 2]    1     addw sp,#1 
      00A82F 00               [ 4] 3608 	ret
                                   3609 
                                   3610 ;------------------------------
                                   3611 ; BASIC: RSHIFT(expr1,expr2)
                                   3612 ; logical shift right expr1 by 
                                   3613 ; expr2 bits.
                                   3614 ; output:
                                   3615 ; 	A 		TK_INTGR
                                   3616 ;   X 		result 
                                   3617 ;------------------------------
      002A82                       3618 rshift:
      00A830 1A CD 9E         [ 4] 3619 	call func_args
      00A833 6B 1F            [ 1] 3620 	cp a,#2 
      00A835 05 0F            [ 1] 3621 	jreq 1$
      00A837 03 CD A7         [ 2] 3622 	jp syntax_error
      002A8C                       3623 1$: _xpop ; T>A:X
      00A83A EC CE            [ 1]    1     ld a,(y)
      00A83C A8               [ 1]    2     ldw x,y 
      00A83D 95 90            [ 2]    3     ldw x,(1,x)
      00A83F FF 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A843 02               [ 1] 3624     ld a,xl 
      00A844 1E               [ 1] 3625 	push a    
      002A97                       3626 	_xpop  
      00A845 05 90            [ 1]    1     ld a,(y)
      00A847 FF               [ 1]    2     ldw x,y 
      00A848 72 A9            [ 2]    3     ldw x,(1,x)
      00A84A 00 02 A6 7C      [ 2]    4     addw y,#CELL_SIZE 
      00A84E 6B 04            [ 1] 3627 	tnz (1,sp)
      00A850 A3 00            [ 1] 3628 	jreq 4$
      00A852 7C               [ 1] 3629 2$:	rcf 
      00A853 22               [ 1] 3630 	rrc a 
      00A854 01               [ 2] 3631 	rrcw x 
      00A855 9F 6B            [ 1] 3632 	dec (1,sp) 
      00A857 04 CE            [ 1] 3633 	jrne 2$
      002AAB                       3634 4$: _drop 1 
      00A859 00 1C            [ 2]    1     addw sp,#1 
      00A85B 1F               [ 4] 3635 	ret
                                   3636 
                                   3637 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3638 ; BASIC: FCPU integer
                                   3639 ; set CPU frequency 
                                   3640 ;-------------------------- 
                                   3641 
      002AAE                       3642 fcpu:
      00A85C 01 84            [ 1] 3643 	ld a,#TK_INTGR
      00A85D CD 19 4F         [ 4] 3644 	call expect 
      00A85D 1E 01 7B         [ 4] 3645 	call get_int24 
      00A860 04               [ 1] 3646 	ld a,xl 
      00A861 CD A7            [ 1] 3647 	and a,#7 
      00A863 DC 1F 01         [ 1] 3648 	ld CLK_CKDIVR,a 
      00A866 AE               [ 4] 3649 	ret 
                                   3650 
                                   3651 ;------------------------------
                                   3652 ; BASIC: PMODE pin#, mode 
                                   3653 ; Arduino pin. 
                                   3654 ; define pin as input or output
                                   3655 ; pin#: {0..15}
                                   3656 ; mode: INPUT|OUTPUT  
                                   3657 ;------------------------------
                           000001  3658 	PINNO=1
                           000001  3659 	VSIZE=1
      002ABD                       3660 pin_mode:
      002ABD                       3661 	_vars VSIZE 
      00A867 16 E0            [ 2]    1     sub sp,#VSIZE 
      00A869 CD 87 AE         [ 4] 3662 	call arg_list 
      00A86C AE 00            [ 1] 3663 	cp a,#2 
      00A86E 80 CD            [ 1] 3664 	jreq 1$
      00A870 88 CC 1E         [ 2] 3665 	jp syntax_error 
      002AC9                       3666 1$: _xpop 
      00A873 01 C3            [ 1]    1     ld a,(y)
      00A875 00               [ 1]    2     ldw x,y 
      00A876 1E 24            [ 2]    3     ldw x,(1,x)
      00A878 16 1E 05 72      [ 2]    4     addw y,#CELL_SIZE 
      00A87C F0 03 1F         [ 2] 3667 	ldw ptr16,x ; mode 
      002AD5                       3668 	_xpop ; Dx pin 
      00A87F 05 A6            [ 1]    1     ld a,(y)
      00A881 80               [ 1]    2     ldw x,y 
      00A882 A3 00            [ 2]    3     ldw x,(1,x)
      00A884 80 24 01 9F      [ 2]    4     addw y,#CELL_SIZE 
      00A888 6B 04 CD         [ 4] 3669 	call select_pin 
      00A88B A7 EC            [ 1] 3670 	ld (PINNO,sp),a  
      00A88D 20 CE            [ 1] 3671 	ld a,#1 
      00A88F 5B 06            [ 1] 3672 	tnz (PINNO,sp)
      00A891 90 85            [ 1] 3673 	jreq 4$
      00A893 85               [ 1] 3674 2$:	sll a 
      00A894 81 54            [ 1] 3675 	dec (PINNO,sp)
      00A896 42 43            [ 1] 3676 	jrne 2$ 
      00A898 61 6E            [ 1] 3677 	ld (PINNO,sp),a
      00A89A 27 74            [ 1] 3678 	ld a,(PINNO,sp)
      00A89C 20 66            [ 1] 3679 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A89E 6C 61            [ 1] 3680 	ld (GPIO_CR1,x),a 
      00A8A0 73 68            [ 1] 3681 4$:	ld a,#OUTP
      00A8A2 20 61 70         [ 1] 3682 	cp a,acc8 
      00A8A5 70 6C            [ 1] 3683 	jreq 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3684 ; input mode
                                   3685 ; disable external interrupt 
      00A8A7 69 63            [ 1] 3686 	ld a,(PINNO,sp)
      00A8A9 61               [ 1] 3687 	cpl a 
      00A8AA 74 69            [ 1] 3688 	and a,(GPIO_CR2,x)
      00A8AC 6F 6E            [ 1] 3689 	ld (GPIO_CR2,x),a 
                                   3690 ;clear bit in DDR for input mode 
      00A8AE 2C 20            [ 1] 3691 	ld a,(PINNO,sp)
      00A8B0 61               [ 1] 3692 	cpl a 
      00A8B1 6C 72            [ 1] 3693 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A8B3 65 61            [ 1] 3694 	ld (GPIO_DDR,x),a 
      00A8B5 64 79            [ 2] 3695 	jra 9$
      002B0D                       3696 6$: ;output mode  
      00A8B7 20 6F            [ 1] 3697 	ld a,(PINNO,sp)
      00A8B9 6E 65            [ 1] 3698 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A8BB 20 69            [ 1] 3699 	ld (GPIO_DDR,x),a 
      00A8BD 6E 20            [ 1] 3700 	ld a,(PINNO,sp)
      00A8BF 46 4C            [ 1] 3701 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A8C1 41 53            [ 1] 3702 	ld (GPIO_CR2,x),a 
      002B19                       3703 9$:	
      002B19                       3704 	_drop VSIZE 
      00A8C3 48 0A            [ 2]    1     addw sp,#VSIZE 
      00A8C5 75               [ 4] 3705 	ret
                                   3706 
                                   3707 ;------------------------
                                   3708 ; select Arduino pin 
                                   3709 ; input:
                                   3710 ;   X 	 {0..15} Arduino Dx 
                                   3711 ; output:
                                   3712 ;   A     stm8s208 pin 
                                   3713 ;   X     base address s208 GPIO port 
                                   3714 ;---------------------------
      002B1C                       3715 select_pin:
      00A8C6 73               [ 2] 3716 	sllw x 
      00A8C7 65 20 45         [ 2] 3717 	addw x,#arduino_to_8s208 
      00A8CA 52               [ 2] 3718 	ldw x,(x)
      00A8CB 41               [ 1] 3719 	ld a,xl 
      00A8CC 53               [ 1] 3720 	push a 
      00A8CD 45               [ 1] 3721 	swapw x 
      00A8CE 20 5C            [ 1] 3722 	ld a,#5 
      00A8D0 46               [ 4] 3723 	mul x,a 
      00A8D1 20 62 65         [ 2] 3724 	addw x,#GPIO_BASE 
      00A8D4 66               [ 1] 3725 	pop a 
      00A8D5 6F               [ 4] 3726 	ret 
                                   3727 ; translation from Arduino D0..D15 to stm8s208rb 
      002B2C                       3728 arduino_to_8s208:
      00A8D6 72 65                 3729 .byte 3,6 ; D0 
      00A8D8 00 4E                 3730 .byte 3,5 ; D1 
      00A8DA 6F 20                 3731 .byte 4,0 ; D2 
      00A8DC 61 70                 3732 .byte 2,1 ; D3
      00A8DE 70 6C                 3733 .byte 6,0 ; D4
      00A8E0 69 63                 3734 .byte 2,2 ; D5
      00A8E2 61 74                 3735 .byte 2,3 ; D6
      00A8E4 69 6F                 3736 .byte 3,1 ; D7
      00A8E6 6E 20                 3737 .byte 3,3 ; D8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A8E8 69 6E                 3738 .byte 2,4 ; D9
      00A8EA 20 52                 3739 .byte 4,5 ; D10
      00A8EC 41 4D                 3740 .byte 2,6 ; D11
      00A8EE 00 07                 3741 .byte 2,7 ; D12
      00A8EF 02 05                 3742 .byte 2,5 ; D13
      00A8EF CD 9B                 3743 .byte 4,2 ; D14
      00A8F1 25 A1                 3744 .byte 4,1 ; D15
                                   3745 
                                   3746 
                                   3747 ;------------------------------
                                   3748 ; BASIC: RND(expr)
                                   3749 ; return random number 
                                   3750 ; between 1 and expr inclusive
                                   3751 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3752 ; input:
                                   3753 ; 	none 
                                   3754 ; output:
                                   3755 ;	xstack 	random positive integer 
                                   3756 ;------------------------------
      002B4C                       3757 random:
      00A8F3 84 27 03         [ 4] 3758 	call func_args 
      00A8F6 CC 96            [ 1] 3759 	cp a,#1
      00A8F8 B5 90            [ 1] 3760 	jreq 1$
      00A8FA F6 93 EE         [ 2] 3761 	jp syntax_error
      002B56                       3762 1$:  
      002B56                       3763 	_xpop   
      00A8FD 01 72            [ 1]    1     ld a,(y)
      00A8FF A9               [ 1]    2     ldw x,y 
      00A900 00 03            [ 2]    3     ldw x,(1,x)
      00A902 C7 00 19 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A906 00               [ 2] 3764 	pushw x 
      00A907 1A               [ 1] 3765 	push a  
      00A908 A6 80            [ 1] 3766 	ld a,#0x80 
      00A908 CD 98            [ 1] 3767 	bcp a,(1,sp)
      00A90A 19 A1            [ 1] 3768 	jreq 2$
      00A90C 08 27            [ 1] 3769 	ld a,#ERR_BAD_VALUE
      00A90E 02 20 46         [ 2] 3770 	jp tb_error
      002B6C                       3771 2$: 
                                   3772 ; acc16=(x<<5)^x 
      00A911 CD 98 19         [ 2] 3773 	ldw x,seedx 
      00A914 A1               [ 2] 3774 	sllw x 
      00A915 04               [ 2] 3775 	sllw x 
      00A916 27               [ 2] 3776 	sllw x 
      00A917 23               [ 2] 3777 	sllw x 
      00A918 A1               [ 2] 3778 	sllw x 
      00A919 02               [ 1] 3779 	ld a,xh 
      00A91A 27 2A 55         [ 1] 3780 	xor a,seedx 
      00A91D 00 03 00         [ 1] 3781 	ld acc16,a 
      00A920 02               [ 1] 3782 	ld a,xl 
      00A921 CD 9B 25         [ 1] 3783 	xor a,seedx+1 
      00A924 A1 84 27         [ 1] 3784 	ld acc8,a 
                                   3785 ; seedx=seedy 
      00A927 03 CC 96         [ 2] 3786 	ldw x,seedy 
      00A92A B5 90 F6         [ 2] 3787 	ldw seedx,x  
                                   3788 ; seedy=seedy^(seedy>>1)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A92D 93 EE 01         [ 2] 3789 	ldw x,seedy 
      00A930 72               [ 2] 3790 	srlw x 
      00A931 A9               [ 1] 3791 	ld a,xh 
      00A932 00 03 9F         [ 1] 3792 	xor a,seedy 
      00A935 5F CD 87         [ 1] 3793 	ld seedy,a  
      00A938 F8               [ 1] 3794 	ld a,xl 
      00A939 20 CD 17         [ 1] 3795 	xor a,seedy+1 
      00A93B C7 00 17         [ 1] 3796 	ld seedy+1,a 
                                   3797 ; acc16>>3 
      00A93B F6 72 5C         [ 2] 3798 	ldw x,acc16 
      00A93E 00               [ 2] 3799 	srlw x 
      00A93F 02               [ 2] 3800 	srlw x 
      00A940 5F               [ 2] 3801 	srlw x 
                                   3802 ; x=acc16^x 
      00A941 CD               [ 1] 3803 	ld a,xh 
      00A942 87 F8 20         [ 1] 3804 	xor a,acc16 
      00A945 C2 00 0D         [ 1] 3805 	ld acc16,a 
      00A946 9F               [ 1] 3806 	ld a,xl 
      00A946 89 F6 72         [ 1] 3807 	xor a,acc8 
      00A949 5C 00 02         [ 1] 3808 	ld acc8,a 
                                   3809 ; seedy=acc16^seedy 
      00A94C 5F CD 87         [ 1] 3810 	xor a,seedy+1
      00A94F F8               [ 1] 3811 	ld xl,a 
      00A950 85 F6 27         [ 1] 3812 	ld a,acc16 
      00A953 B4 5C 20         [ 1] 3813 	xor a,seedy
      00A956 EF               [ 1] 3814 	ld xh,a 
      00A957 CF 00 16         [ 2] 3815 	ldw seedy,x 
                                   3816 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A957 81 00 15         [ 1] 3817 	ld a,seedx+1
      00A958 A4 7F            [ 1] 3818 	and a,#127
      002BC1                       3819 	_xpush 
      00A958 CD 99 DC A1      [ 2]    1     subw y,#CELL_SIZE
      00A95C 01 27            [ 1]    2     ld (y),a 
      00A95E 03 CC 96         [ 2]    3     ldw (1,y),x 
      00A961 B5               [ 1] 3820 	pop a 
      00A962 90               [ 2] 3821 	popw x 
      002BCC                       3822 	_xpush 
      00A963 F6 93 EE 01      [ 2]    1     subw y,#CELL_SIZE
      00A967 72 A9            [ 1]    2     ld (y),a 
      00A969 00 03 9F         [ 2]    3     ldw (1,y),x 
      00A96C A4 7F 81         [ 4] 3823 	call mod24 
      00A96F                       3824 	_xpop
      00A96F A6 06            [ 1]    1     ld a,(y)
      00A971 CD               [ 1]    2     ldw x,y 
      00A972 99 CF            [ 2]    3     ldw x,(1,x)
      00A974 CD 98 19 A1      [ 2]    4     addw y,#CELL_SIZE 
      00A978 02 27 0E         [ 2] 3825 	addw x,#1 
      00A97B A1 04            [ 1] 3826 	adc a,#0  
      00A97D 27               [ 4] 3827 	ret 
                                   3828 
                                   3829 ;---------------------------------
                                   3830 ; BASIC: WORDS 
                                   3831 ; affiche la listes des mots du
                                   3832 ; dictionnaire ainsi que le nombre
                                   3833 ; de mots.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3834 ;---------------------------------
                           000001  3835 	WLEN=1 ; word length
                           000002  3836 	LLEN=2 ; character sent to console
                           000003  3837 	WCNT=3 ; count words printed 
                           000003  3838 	VSIZE=3 
      002BE7                       3839 words:
      00A97E 12 A1            [ 2] 3840 	pushw y
      002BE9                       3841 	_vars VSIZE
      00A980 82 27            [ 2]    1     sub sp,#VSIZE 
      00A982 03 CC            [ 1] 3842 	clr (LLEN,sp)
      00A984 96 B5            [ 1] 3843 	clr (WCNT,sp)
      00A986 90 AE 33 BC      [ 2] 3844 	ldw y,#kword_dict+2
      00A986 FD               [ 1] 3845 0$:	ldw x,y
      00A987 20               [ 1] 3846 	ld a,(x)
      00A988 0B 0F            [ 1] 3847 	and a,#15 
      00A989 6B 01            [ 1] 3848 	ld (WLEN,sp),a 
      00A989 F6 88            [ 1] 3849 	inc (WCNT,sp)
      00A98B CD               [ 1] 3850 1$:	incw x 
      00A98C 98               [ 1] 3851 	ld a,(x)
      00A98D 32 84 20         [ 4] 3852 	call putc 
      00A990 03 02            [ 1] 3853 	inc (LLEN,sp)
      00A991 0A 01            [ 1] 3854 	dec (WLEN,sp)
      00A991 CD 98            [ 1] 3855 	jrne 1$
      00A993 5B 5F            [ 1] 3856 	ld a,#70
      00A995 02 72            [ 1] 3857 	cp a,(LLEN,sp)
      00A997 A2 00            [ 1] 3858 	jrmi 2$   
      00A999 03 90            [ 1] 3859 	ld a,#SPACE 
      00A99B F7 90 EF         [ 4] 3860 	call putc 
      00A99E 01 A6            [ 1] 3861 	inc (LLEN,sp) 
      00A9A0 07 CD            [ 2] 3862 	jra 3$
      00A9A2 99 CF            [ 1] 3863 2$: ld a,#CR 
      00A9A4 CD 08 DA         [ 4] 3864 	call putc 
      00A9A4 90 F6            [ 1] 3865 	clr (LLEN,sp)
      00A9A6 93 EE 01 72      [ 2] 3866 3$:	subw y,#2 
      00A9AA A9 00            [ 2] 3867 	ldw y,(y)
      00A9AC 03 81            [ 1] 3868 	jrne 0$ 
      00A9AE A6 0D            [ 1] 3869 	ld a,#CR 
      00A9AE CD 89 6A         [ 4] 3870 	call putc  
      00A9B1 81               [ 1] 3871 	clrw x 
      00A9B2 7B 03            [ 1] 3872 	ld a,(WCNT,sp)
      00A9B2 5F               [ 1] 3873 	ld xl,a 
      00A9B3 C6 00 2F         [ 4] 3874 	call prt_i16 
      00A9B6 C0 00 30         [ 2] 3875 	ldw x,#words_count_msg
      00A9B9 27 03 53         [ 4] 3876 	call puts 
      002C36                       3877 	_drop VSIZE 
      00A9BC A6 FF            [ 2]    1     addw sp,#VSIZE 
      00A9BE 90 85            [ 2] 3878 	popw y 
      00A9BE 81               [ 4] 3879 	ret 
      00A9BF 20 77 6F 72 64 73 20  3880 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3881 
                                   3882 
                                   3883 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3884 ; BASIC: TIMER expr 
                                   3885 ; initialize count down timer 
                                   3886 ;-----------------------------
      002C51                       3887 set_timer:
      00A9BF CD 99 DC         [ 4] 3888 	call arg_list
      00A9C2 A1 02            [ 1] 3889 	cp a,#1 
      00A9C4 27 03            [ 1] 3890 	jreq 1$
      00A9C6 CC 96 B5         [ 2] 3891 	jp syntax_error
      002C5B                       3892 1$: 
      002C5B                       3893 	_xpop  
      00A9C9 90 E6            [ 1]    1     ld a,(y)
      00A9CB 03               [ 1]    2     ldw x,y 
      00A9CC 93 EE            [ 2]    3     ldw x,(1,x)
      00A9CE 04 A3 50 00      [ 2]    4     addw y,#CELL_SIZE 
      00A9D2 2B 16 A3         [ 2] 3894 	ldw timer,x 
      00A9D5 50               [ 4] 3895 	ret 
                                   3896 
                                   3897 ;------------------------------
                                   3898 ; BASIC: TIMEOUT 
                                   3899 ; return state of timer 
                                   3900 ; output:
                                   3901 ;   A:X     0 not timeout 
                                   3902 ;   A:X     -1 timeout 
                                   3903 ;------------------------------
      002C68                       3904 timeout:
      00A9D6 29               [ 1] 3905 	clr a 
      00A9D7 2A 11 89         [ 2] 3906 	ldw x,timer 
      00A9DA 90 F6            [ 1] 3907 	jreq 1$
      00A9DC 93               [ 1] 3908 	clrw x
      00A9DD EE               [ 4] 3909 	ret  
      00A9DE 01               [ 1] 3910 1$:	cpl a
      00A9DF 72               [ 2] 3911 	cplw x 
      00A9E0 A9               [ 4] 3912 	ret 
                                   3913  	
                                   3914 
                                   3915 
                                   3916 
                                   3917 ;-----------------------------------
                                   3918 ; BASIC: IWDGEN expr1 
                                   3919 ; enable independant watchdog timer
                                   3920 ; expr1 is delay in multiple of 62.5µsec
                                   3921 ; expr1 -> {1..16383}
                                   3922 ;-----------------------------------
      002C73                       3923 enable_iwdg:
      00A9E1 00 03 72         [ 4] 3924 	call arg_list
      00A9E4 FB 01            [ 1] 3925 	cp a,#1 
      00A9E6 5B 02            [ 1] 3926 	jreq 1$
      00A9E8 4F 81 35         [ 2] 3927 	jp syntax_error 
      00A9EA                       3928 1$: _xpop  
      00A9EA A6 0A            [ 1]    1     ld a,(y)
      00A9EC CC               [ 1]    2     ldw x,y 
      00A9ED 96 B7            [ 2]    3     ldw x,(1,x)
      00A9EF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A9EF CD A7            [ 1] 3929 	push #0
      00A9F1 D5 26 13 AE      [ 1] 3930 	mov IWDG_KR,#IWDG_KEY_ENABLE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A9F5 B6               [ 1] 3931 	ld a,xh 
      00A9F6 00 72            [ 1] 3932 	and a,#0x3f
      00A9F8 BB               [ 1] 3933 	ld xh,a  
      00A9F9 B6 02 1C         [ 2] 3934 2$:	cpw x,#255
      00A9FC 00 04            [ 2] 3935 	jrule 3$
      00A9FE 1C 00            [ 1] 3936 	inc (1,sp)
      00AA00 80               [ 1] 3937 	rcf 
      00AA01 9F               [ 2] 3938 	rrcw x 
      00AA02 A4 80            [ 2] 3939 	jra 2$
      00AA04 97 20 03 AE      [ 1] 3940 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AA08 B6               [ 1] 3941 	pop a  
      00AA09 00 50 E1         [ 1] 3942 	ld IWDG_PR,a 
      00AA0A 9F               [ 1] 3943 	ld a,xl
      00AA0A 4F               [ 1] 3944 	dec a 
      00AA0B 81 55 50 E0      [ 1] 3945 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AA0C C7 50 E2         [ 1] 3946 	ld IWDG_RLR,a 
      00AA0C CD 99 DC A1      [ 1] 3947 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00AA10 02               [ 4] 3948 	ret 
                                   3949 
                                   3950 
                                   3951 ;-----------------------------------
                                   3952 ; BASIC: IWDGREF  
                                   3953 ; refresh independant watchdog count down 
                                   3954 ; timer before it reset MCU. 
                                   3955 ;-----------------------------------
      002CB1                       3956 refresh_iwdg:
      00AA11 27 03 CC 96      [ 1] 3957 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00AA15 B5               [ 4] 3958 	ret 
                                   3959 
                                   3960 
                                   3961 ;-------------------------------------
                                   3962 ; BASIC: LOG2(expr)
                                   3963 ; return logarithm base 2 of expr 
                                   3964 ; this is the position of most significant
                                   3965 ; bit set. 
                                   3966 ; input: 
                                   3967 ; output:
                                   3968 ;   A     TK_INTGR 
                                   3969 ;   xstack log2 
                                   3970 ;*********************************
      00AA16                       3971 log2:
      00AA16 90 E6 03         [ 4] 3972 	call func_args 
      00AA19 93 EE            [ 1] 3973 	cp a,#1 
      00AA1B 04 CF            [ 1] 3974 	jreq 1$
      00AA1D 00 1A 90         [ 2] 3975 	jp syntax_error 
      002CC0                       3976 1$: 
      002CC0                       3977 	_xpop    
      00AA20 F6 93            [ 1]    1     ld a,(y)
      00AA22 EE               [ 1]    2     ldw x,y 
      00AA23 01 72            [ 2]    3     ldw x,(1,x)
      00AA25 A9 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      00AA29 F7               [ 1] 3978 	tnz a
      00AA2A 90 EF            [ 1] 3979 	jrne 2$ 
      00AA2C 01               [ 2] 3980 	tnzw x 
      00AA2D 72 CD            [ 1] 3981 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00AA2F 00 1A            [ 1] 3982 	ld a,#ERR_BAD_VALUE
      00AA31 81 16 37         [ 2] 3983 	jp tb_error 
      00AA32 4B 18            [ 1] 3984 2$: push #24 
      00AA32 72               [ 2] 3985 3$: rlcw x 
      00AA33 0D               [ 1] 3986     rlc a 
      00AA34 52 30            [ 1] 3987 	jrc 4$
      00AA36 FB 8E            [ 1] 3988 	dec (1,sp) 
      00AA38 CC 81            [ 1] 3989 	jrne 3$
      00AA3A 35               [ 1] 3990 4$: clrw x 
      00AA3B 84               [ 1] 3991     pop a 
      00AA3B 72               [ 1] 3992 	dec a
      00AA3C 0D               [ 1] 3993 	rlwa x  
      002CE2                       3994 9$:	
      00AA3D 52               [ 4] 3995 	ret 
                                   3996 
                                   3997 ;-----------------------------------
                                   3998 ; BASIC: BIT(expr) 
                                   3999 ; expr ->{0..23}
                                   4000 ; return 2^expr 
                                   4001 ; output:
                                   4002 ;    A:X    2^expr 
                                   4003 ;-----------------------------------
      002CE3                       4004 bitmask:
      00AA3E 30 FB 72         [ 4] 4005     call func_args 
      00AA41 16 00            [ 1] 4006 	cp a,#1
      00AA43 23 8E            [ 1] 4007 	jreq 1$
      00AA45 81 16 35         [ 2] 4008 	jp syntax_error 
      00AA46                       4009 1$: _xpop 
      00AA46 CD 9B            [ 1]    1     ld a,(y)
      00AA48 25               [ 1]    2     ldw x,y 
      00AA49 A1 84            [ 2]    3     ldw x,(1,x)
      00AA4B 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00AA4F B5               [ 1] 4010 	ld a,xl 
      00AA50 90 F6 93         [ 2] 4011 	ldw x,#1 
      00AA53 EE 01            [ 1] 4012 	and a,#23
      00AA55 72 A9            [ 1] 4013 	jreq 9$
      00AA57 00               [ 1] 4014 	push a 
      00AA58 03               [ 1] 4015 	clr a 
      00AA59                       4016 2$: 
      00AA59 CF               [ 2] 4017 	slaw x 
      00AA5A 00               [ 1] 4018 	rlc a 	
      00AA5B 13 CE            [ 1] 4019 	dec (1,sp)
      00AA5D 00 13            [ 1] 4020 	jrne 2$ 
      002D06                       4021 4$:
      002D06                       4022     _drop 1 
      00AA5F 5D 27            [ 2]    1     addw sp,#1 
      00AA61 03               [ 4] 4023 9$:	ret 
                                   4024 
                                   4025 ;------------------------------
                                   4026 ; BASIC: DO 
                                   4027 ; initiate a DO ... UNTIL loop 
                                   4028 ;------------------------------
                           000003  4029 	DOLP_ADR=3 
                           000005  4030 	DOLP_INW=5
                           000004  4031 	VSIZE=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      002D09                       4032 do_loop:
      00AA62 8F               [ 2] 4033 	popw x 
      002D0A                       4034 	_vars VSIZE 
      00AA63 26 F7            [ 2]    1     sub sp,#VSIZE 
      00AA65 89               [ 2] 4035 	pushw x 
      00AA65 81 00 04         [ 2] 4036 	ldw x,basicptr 
      00AA66 1F 03            [ 2] 4037 	ldw (DOLP_ADR,sp),x
      00AA66 CD 9B 25         [ 2] 4038 	ldw x,in.w 
      00AA69 A1 84            [ 2] 4039 	ldw (DOLP_INW,sp),x
      00AA6B 27 03 CC 96      [ 1] 4040 	inc loop_depth 
      00AA6F B5               [ 4] 4041 	ret 
                                   4042 
                                   4043 ;--------------------------------
                                   4044 ; BASIC: UNTIL expr 
                                   4045 ; loop if exprssion is false 
                                   4046 ; else terminate loop
                                   4047 ;--------------------------------
      002D1C                       4048 until: 
      00AA70 90 F6 93 EE      [ 1] 4049 	tnz loop_depth 
      00AA74 01 72            [ 1] 4050 	jrne 1$ 
      00AA76 A9 00 03         [ 2] 4051 	jp syntax_error 
      00AA79                       4052 1$: 
      00AA79 A3 14 00         [ 4] 4053 	call condition  
      002D28                       4054 	_xpop 
      00AA7C 2B 0C            [ 1]    1     ld a,(y)
      00AA7E 35               [ 1]    2     ldw x,y 
      00AA7F 0F 50            [ 2]    3     ldw x,(1,x)
      00AA81 F2 A6 1E 62      [ 2]    4     addw y,#CELL_SIZE 
      00AA85 A6               [ 1] 4055 	tnz a 
      00AA86 10 62            [ 1] 4056 	jrne 9$ 
      00AA88 20               [ 2] 4057 	tnzw x 
      00AA89 1E 10            [ 1] 4058 	jrne 9$ 
      00AA8A 1E 03            [ 2] 4059 	ldw x,(DOLP_ADR,sp)
      00AA8A A3 08 00         [ 2] 4060 	ldw basicptr,x 
      00AA8D 2B 09            [ 1] 4061 	ld a,(2,x)
      00AA8F 35 0E 50         [ 1] 4062 	ld count,a 
      00AA92 F2 A6            [ 2] 4063 	ldw x,(DOLP_INW,sp)
      00AA94 50 62 20         [ 2] 4064 	ldw in.w,x 
      00AA97 10               [ 4] 4065 	ret 
      00AA98                       4066 9$:	; remove loop data from stack  
      00AA98 35               [ 2] 4067 	popw x
      002D48                       4068 	_drop VSIZE
      00AA99 07 50            [ 2]    1     addw sp,#VSIZE 
      00AA9B F2 5A 00 1F      [ 1] 4069 	dec loop_depth 
      00AA9C FC               [ 2] 4070 	jp (x)
                                   4071 
                                   4072 ;--------------------------
                                   4073 ; BASIC: PORTA...PORTI  
                                   4074 ;  return constant value 
                                   4075 ;  PORT  base address 
                                   4076 ;---------------------------
      002D4F                       4077 const_porta:
      00AA9C A3 00 40         [ 2] 4078 	ldw x,#PA_BASE 
      00AA9F 23               [ 1] 4079 	clr a 
      00AAA0 07               [ 4] 4080 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      002D54                       4081 const_portb:
      00AAA1 72 5C 50         [ 2] 4082 	ldw x,#PB_BASE 
      00AAA4 F2               [ 1] 4083 	clr a 
      00AAA5 54               [ 4] 4084 	ret 
      002D59                       4085 const_portc:
      00AAA6 20 F4 0A         [ 2] 4086 	ldw x,#PC_BASE 
      00AAA8 4F               [ 1] 4087 	clr a 
      00AAA8 9F               [ 4] 4088 	ret 
      002D5E                       4089 const_portd:
      00AAA9 4A 27 01         [ 2] 4090 	ldw x,#PD_BASE 
      00AAAC 4A               [ 1] 4091 	clr a 
      00AAAD 81               [ 4] 4092 	ret 
      002D63                       4093 const_porte:
      00AAAD A4 3E C7         [ 2] 4094 	ldw x,#PE_BASE 
      00AAB0 50               [ 1] 4095 	clr a 
      00AAB1 F1               [ 4] 4096 	ret 
      002D68                       4097 const_portf:
      00AAB2 72 18 50         [ 2] 4098 	ldw x,#PF_BASE 
      00AAB5 F0               [ 1] 4099 	clr a 
      00AAB6 8E               [ 4] 4100 	ret 
      002D6D                       4101 const_portg:
      00AAB7 81 50 1E         [ 2] 4102 	ldw x,#PG_BASE 
      00AAB8 4F               [ 1] 4103 	clr a 
      00AAB8 C6               [ 4] 4104 	ret 
      002D72                       4105 const_porti:
      00AAB9 00 10 CE         [ 2] 4106 	ldw x,#PI_BASE 
      00AABC 00               [ 1] 4107 	clr a 
      00AABD 11               [ 4] 4108 	ret 
                                   4109 
                                   4110 ;-------------------------------
                                   4111 ; following return constant 
                                   4112 ; related to GPIO register offset 
                                   4113 ;---------------------------------
      002D77                       4114 const_odr:
      00AABE 81               [ 1] 4115 	clr a 
      00AABF AE 00 00         [ 2] 4116 	ldw x,#GPIO_ODR
      00AABF CD               [ 4] 4117 	ret 
      002D7C                       4118 const_idr:
      00AAC0 99               [ 1] 4119 	clr a 
      00AAC1 DC A1 01         [ 2] 4120 	ldw x,#GPIO_IDR
      00AAC4 27               [ 4] 4121 	ret 
      002D81                       4122 const_ddr:
      00AAC5 03               [ 1] 4123 	clr a
      00AAC6 CC 96 B5         [ 2] 4124 	ldw x,#GPIO_DDR
      00AAC9 81               [ 4] 4125 	ret 
      002D86                       4126 const_cr1:
      00AAC9 CD               [ 1] 4127 	clr a 
      00AACA 82 60 90         [ 2] 4128 	ldw x,#GPIO_CR1
      00AACD F6               [ 4] 4129 	ret 
      002D8B                       4130 const_cr2:
      00AACE 93               [ 1] 4131 	clr a
      00AACF EE 01 72         [ 2] 4132 	ldw x,#GPIO_CR2
      00AAD2 A9               [ 4] 4133 	ret 
                                   4134 ;-------------------------
                                   4135 ; BASIC: POUT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   4136 ;  constant for port mode
                                   4137 ;  used by PMODE 
                                   4138 ;  to set pin as output
                                   4139 ;------------------------
      002D90                       4140 const_output:
      00AAD3 00               [ 1] 4141 	clr a 
      00AAD4 03 81 01         [ 2] 4142 	ldw x,#OUTP
      00AAD6 81               [ 4] 4143 	ret 
                                   4144 
                                   4145 ;-------------------------
                                   4146 ; BASIC: PINP 
                                   4147 ;  constant for port mode
                                   4148 ;  used by PMODE 
                                   4149 ;  to set pin as input
                                   4150 ;------------------------
      002D95                       4151 const_input:
      00AAD6 CD               [ 1] 4152 	clr a  
      00AAD7 99 DC A1         [ 2] 4153 	ldw x,#INP 
      00AADA 02               [ 4] 4154 	ret 
                                   4155 	
                                   4156 ;-----------------------
                                   4157 ; memory area constants
                                   4158 ;-----------------------
      002D9A                       4159 const_eeprom_base:
      00AADB 27               [ 1] 4160 	clr a  
      00AADC 03 CC 96         [ 2] 4161 	ldw x,#EEPROM_BASE 
      00AADF B5               [ 4] 4162 	ret 
                                   4163 
                                   4164 ;---------------------------
                                   4165 ; BASIC: DATA 
                                   4166 ; when the interpreter find 
                                   4167 ; a DATA line it skip it.
                                   4168 ;---------------------------
      002D9F                       4169 data:
      00AAE0 90 F6 93 EE 01   [ 1] 4170 	mov in,count 
      00AAE5 72               [ 4] 4171 	ret 
                                   4172 
                                   4173 ;------------------------------
                                   4174 ; check if it is a DATA line 
                                   4175 ; input: 
                                   4176 ;    X    line address 
                                   4177 ; output:
                                   4178 ;    Z    set if DATA line 
                                   4179 ;----------------------------
      002DA5                       4180 is_data_line:
      00AAE6 A9               [ 2] 4181 	pushw x 
      00AAE7 00 03            [ 1] 4182 	ld a,(3,x)
      00AAE9 9F 88            [ 1] 4183 	cp a,#TK_CMD 
      00AAEB 90 F6            [ 1] 4184 	jrne 9$
      00AAED 93 EE            [ 2] 4185 	ldw x,(4,x)
      00AAEF 01 72 A9         [ 2] 4186 	cpw x,#data  
      00AAF2 00               [ 2] 4187 9$: popw x 
      00AAF3 03               [ 4] 4188 	ret 
                                   4189 
                                   4190 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   4191 ; BASIC: RESTORE [line#]
                                   4192 ; set data_ptr to first data line
                                   4193 ; if no DATA found pointer set to
                                   4194 ; zero.
                                   4195 ; if a line# is given as argument 
                                   4196 ; a data line with that number 
                                   4197 ; is searched and the data pointer 
                                   4198 ; is set to it. If there is no 
                                   4199 ; data line with that number 
                                   4200 ; the program is interrupted. 
                                   4201 ;---------------------------------
      002DB3                       4202 restore:
      00AAF4 0D               [ 1] 4203 	clrw x 
      00AAF5 01 27 07         [ 2] 4204 	ldw data_ptr,x 
      00AAF8 98 59 49         [ 2] 4205 	ldw data_ofs,x 
      00AAFB 0A 01 26         [ 2] 4206 	ldw x,txtbgn 
      00AAFE F9 5B 01         [ 4] 4207 	call next_token 
      00AB01 81 84            [ 1] 4208 	cp a,#TK_INTGR
      00AB02 26 10            [ 1] 4209 	jrne 0$
      00AB02 CD 99 DC         [ 4] 4210 	call get_int24
      00AB05 A1 02            [ 2] 4211 	pushw y 
      00AB07 27               [ 1] 4212 	clr a 
      00AB08 03 CC 96         [ 4] 4213 	call search_lineno  
      00AB0B B5 90            [ 2] 4214 	popw y 
      00AB0D F6               [ 2] 4215 	tnzw x 
      00AB0E 93 EE            [ 1] 4216 	jrne set_data_pointer 
      00AB10 01 72            [ 2] 4217 	jra data_error 
      002DD4                       4218 0$:
      002DD4                       4219 	_unget_token  
      00AB12 A9 00 03 9F 88   [ 1]    1      mov in,in.saved  
                                   4220 ; search first DATA line 	
      00AB17 90 F6 93         [ 2] 4221 1$:	cpw x,txtend
      00AB1A EE 01            [ 1] 4222 	jruge data_error 
      002DDE                       4223 2$:	
      00AB1C 72 A9 00         [ 4] 4224 	call is_data_line 
      00AB1F 03 0D            [ 1] 4225 	jrne 4$
      00AB21 01 27 07         [ 4] 4226 4$:	call try_next_line 
      00AB24 98 46            [ 1] 4227 	jrne 4$ 
      00AB26 56               [ 4] 4228 	ret 
                                   4229 
                                   4230 ;---------------------
                                   4231 ; set data pointer 
                                   4232 ; variables at new line 
                                   4233 ; input:
                                   4234 ;    X    line address 
                                   4235 ;----------------------
      002DE9                       4236 set_data_pointer:
      00AB27 0A 01 26         [ 2] 4237 	ldw data_ptr,x
      00AB2A F9 5B            [ 1] 4238 	ld a,(2,x)
      00AB2C 01 81 09         [ 1] 4239 	ld data_len,a 
      00AB2E 35 06 00 08      [ 1] 4240 	mov data_ofs,#FIRST_DATA_ITEM
      00AB2E A6               [ 4] 4241 	ret 
                                   4242 
                                   4243 
                                   4244 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4245 ; at end of data line 
                                   4246 ; check if next line 
                                   4247 ; is a data line 
                                   4248 ; input:
                                   4249 ;    X   actual line address 
                                   4250 ;  
                                   4251 ;-------------------
      002DF6                       4252 try_next_line: 
      00AB2F 84 CD            [ 1] 4253 	ld a,(2,x)
      00AB31 99 CF CD         [ 1] 4254 	ld acc8,a 
      00AB34 98 4B 9F A4      [ 1] 4255 	clr acc16 
      00AB38 07 C7 50 C6      [ 2] 4256 	addw x,acc16 
      00AB3C 81 00 1D         [ 2] 4257 	cpw x,txtend 
      00AB3D 25 02            [ 1] 4258 	jrult 1$
      00AB3D 52 01            [ 2] 4259 	jra data_error 
      002E0A                       4260 1$:	
      00AB3F CD 99 E1         [ 4] 4261 	call is_data_line 
      00AB42 A1 02            [ 1] 4262 	jreq 2$
      00AB44 27 03            [ 1] 4263 	ld a,#1  
      00AB46 CC 96            [ 2] 4264 	jra 9$
      00AB48 B5 90 F6         [ 4] 4265 2$:	call set_data_pointer
      00AB4B 93               [ 1] 4266 	clr a  
      00AB4C EE               [ 4] 4267 9$:	ret 
      002E18                       4268 data_error:	
      00AB4D 01 72            [ 1] 4269     ld a,#ERR_NO_DATA 
      00AB4F A9 00 03         [ 2] 4270 	jp tb_error 
                                   4271 
                                   4272 
                                   4273 ;---------------------------------
                                   4274 ; BASIC: READ 
                                   4275 ; return next data item | 0 
                                   4276 ;---------------------------------
                           000001  4277 	CTX_BPTR=1 
                           000003  4278 	CTX_IN=3 
                           000004  4279 	CTX_COUNT=4 
                           000005  4280 	INT24=5
                           000007  4281 	VSIZE=7 
      002E1D                       4282 read:
      002E1D                       4283 	_vars  VSIZE 
      00AB52 CF 00            [ 2]    1     sub sp,#VSIZE 
      00AB54 1A 90 F6         [ 4] 4284 	call save_context
      002E22                       4285 read01:	
      00AB57 93 EE 01         [ 1] 4286 	ld a,data_ofs
      00AB5A 72 A9 00         [ 1] 4287 	cp a,data_len 
      00AB5D 03 CD            [ 1] 4288 	jreq 2$ ; end of line  
      002E2A                       4289 0$:
      00AB5F AB 9C 6B         [ 2] 4290 	ldw x,data_ptr 
      00AB62 01 A6 01         [ 2] 4291 	ldw basicptr,x 
      00AB65 0D 01 27 0D 48   [ 1] 4292 	mov in,data_ofs 
      00AB6A 0A 01 26 FB 6B   [ 1] 4293 	mov count,data_len  
      00AB6F 01 7B 01         [ 4] 4294 	call expression 
      00AB72 EA 03            [ 1] 4295 	cp a,#TK_INTGR 
      00AB74 E7 03            [ 1] 4296 	jreq 1$ 
      00AB76 A6 01 C1         [ 2] 4297 	jp syntax_error 
      002E44                       4298 1$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00AB79 00 0F 27         [ 4] 4299 	call next_token ; skip comma
      00AB7C 10 7B 01         [ 2] 4300 	ldw x,basicptr 
      00AB7F 43 E4 04         [ 2] 4301 	ldw data_ptr,x 
      00AB82 E7 04 7B 01 43   [ 1] 4302 	mov data_ofs,in 
      00AB87 E4 02 E7         [ 4] 4303 	call rest_context
      002E55                       4304 	_xpop 
      00AB8A 02 20            [ 1]    1     ld a,(y)
      00AB8C 0C               [ 1]    2     ldw x,y 
      00AB8D EE 01            [ 2]    3     ldw x,(1,x)
      00AB8D 7B 01 EA 02      [ 2]    4     addw y,#CELL_SIZE 
      002E5E                       4305 	_drop VSIZE 
      00AB91 E7 02            [ 2]    1     addw sp,#VSIZE 
      00AB93 7B               [ 4] 4306 	ret 
      002E61                       4307 2$: ; end of line reached 
                                   4308 	; try next line 
      00AB94 01 EA 04         [ 2] 4309 	ldw x,data_ptr  
      00AB97 E7 04 F6         [ 4] 4310 	call try_next_line
      00AB99 27 C1            [ 1] 4311 	jreq 0$ 
      00AB99 5B 01            [ 2] 4312 	jra data_error 
                                   4313 
                                   4314 ;---------------------------------
                                   4315 ; BASIC: SPIEN clkdiv, 0|1  
                                   4316 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4317 ; if clkdiv==-1 disable SPI
                                   4318 ; 0|1 -> disable|enable  
                                   4319 ;--------------------------------- 
                           000005  4320 SPI_CS_BIT=5
      002E6B                       4321 spi_enable:
      00AB9B 81 19 61         [ 4] 4322 	call arg_list 
      00AB9C A1 02            [ 1] 4323 	cp a,#2
      00AB9C 58 1C            [ 1] 4324 	jreq 1$
      00AB9E AB AC FE         [ 2] 4325 	jp syntax_error 
      002E75                       4326 1$: 
      00ABA1 9F 88 5E A6      [ 1] 4327 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00ABA5 05               [ 2] 4328 	popw x  
      00ABA6 42               [ 2] 4329 	tnzw x 
      00ABA7 1C 50            [ 1] 4330 	jreq spi_disable 
      00ABA9 00               [ 2] 4331 	popw x 
      00ABAA 84 81            [ 1] 4332 	ld a,#(1<<SPI_CR1_BR)
      00ABAC 42               [ 4] 4333 	mul x,a 
      00ABAC 03               [ 1] 4334 	ld a,xl 
      00ABAD 06 03 05         [ 1] 4335 	ld SPI_CR1,a 
                                   4336 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00ABB0 04 00 02 01      [ 1] 4337 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00ABB4 06 00 02 02      [ 1] 4338 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4339 ; configure SPI as master mode 0.	
      00ABB8 02 03 03 01      [ 1] 4340 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4341 ; ~CS line controlled by sofware 	
      00ABBC 03 03 02 04      [ 1] 4342 	bset SPI_CR2,#SPI_CR2_SSM 
      00ABC0 04 05 02 06      [ 1] 4343     bset SPI_CR2,#SPI_CR2_SSI 
                                   4344 ; enable SPI
      00ABC4 02 07 02 05      [ 1] 4345 	bset SPI_CR1,#SPI_CR1_SPE 	
      00ABC8 04               [ 4] 4346 	ret 
      002E9E                       4347 spi_disable:
      002E9E                       4348 	_drop #2; throw first argument.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00ABC9 02 04            [ 2]    1     addw sp,##2 
                                   4349 ; wait spi idle 
      00ABCB 01 82            [ 1] 4350 1$:	ld a,#0x82 
      00ABCC C4 52 03         [ 1] 4351 	and a,SPI_SR
      00ABCC CD 99            [ 1] 4352 	cp a,#2 
      00ABCE DC A1            [ 1] 4353 	jrne 1$
      00ABD0 01 27 03 CC      [ 1] 4354 	bres SPI_CR1,#SPI_CR1_SPE
      00ABD4 96 B5 50 C7      [ 1] 4355 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00ABD6 72 1B 50 16      [ 1] 4356 	bres PE_DDR,#SPI_CS_BIT 
      00ABD6 90               [ 4] 4357 	ret 
                                   4358 
      002EB6                       4359 spi_clear_error:
      00ABD7 F6 93            [ 1] 4360 	ld a,#0x78 
      00ABD9 EE 01 72         [ 1] 4361 	bcp a,SPI_SR 
      00ABDC A9 00            [ 1] 4362 	jreq 1$
      00ABDE 03 89 88 A6      [ 1] 4363 	clr SPI_SR 
      00ABE2 80               [ 4] 4364 1$: ret 
                                   4365 
      002EC2                       4366 spi_send_byte:
      00ABE3 15               [ 1] 4367 	push a 
      00ABE4 01 27 05         [ 4] 4368 	call spi_clear_error
      00ABE7 A6               [ 1] 4369 	pop a 
      00ABE8 0A CC 96 B7 FB   [ 2] 4370 	btjf SPI_SR,#SPI_SR_TXE,.
      00ABEC C7 52 04         [ 1] 4371 	ld SPI_DR,a
      00ABEC CE 00 15 58 58   [ 2] 4372 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00ABF1 58 58 58         [ 1] 4373 	ld a,SPI_DR 
      00ABF4 9E               [ 4] 4374 	ret 
                                   4375 
      002ED8                       4376 spi_rcv_byte:
      00ABF5 C8 00            [ 1] 4377 	ld a,#255
      00ABF7 15 C7 00 0E 9F   [ 2] 4378 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00ABFC C8 00 16         [ 1] 4379 	ld a,SPI_DR 
      00ABFF C7               [ 4] 4380 	ret
                                   4381 
                                   4382 ;------------------------------
                                   4383 ; BASIC: SPIWR byte [,byte]
                                   4384 ; write 1 or more byte
                                   4385 ;------------------------------
      002EE3                       4386 spi_write:
      00AC00 00 0F CE         [ 4] 4387 	call expression
      00AC03 00 17            [ 1] 4388 	cp a,#TK_INTGR 
      00AC05 CF 00            [ 1] 4389 	jreq 1$
      00AC07 15 CE 00         [ 2] 4390 	jp syntax_error 
      002EED                       4391 1$:	
      00AC0A 17               [ 1] 4392 	ld a,xl 
      00AC0B 54 9E C8         [ 4] 4393 	call spi_send_byte 
      00AC0E 00 17 C7         [ 4] 4394 	call next_token 
      00AC11 00 17            [ 1] 4395 	cp a,#TK_COMMA 
      00AC13 9F C8            [ 1] 4396 	jrne 2$ 
      00AC15 00 18            [ 2] 4397 	jra spi_write 
      00AC17 C7               [ 1] 4398 2$:	tnz a 
      00AC18 00 18            [ 1] 4399 	jreq 3$
      002EFD                       4400 	_unget_token  
      00AC1A CE 00 0E 54 54   [ 1]    1      mov in,in.saved  
      00AC1F 54               [ 4] 4401 3$:	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4402 
                                   4403 
                                   4404 ;-------------------------------
                                   4405 ; BASIC: SPIRD 	
                                   4406 ; read one byte from SPI 
                                   4407 ;-------------------------------
      002F03                       4408 spi_read:
      00AC20 9E C8 00         [ 4] 4409 	call spi_rcv_byte 
      00AC23 0E               [ 1] 4410 	clrw x 
      00AC24 C7               [ 1] 4411 	ld xl,a 
      00AC25 00               [ 1] 4412 	clr a  
      00AC26 0E               [ 4] 4413 	ret 
                                   4414 
                                   4415 ;------------------------------
                                   4416 ; BASIC: SPISEL 0|1 
                                   4417 ; set state of ~CS line
                                   4418 ; 0|1 deselect|select  
                                   4419 ;------------------------------
      002F0A                       4420 spi_select:
      00AC27 9F C8 00         [ 4] 4421 	call next_token 
      00AC2A 0F C7            [ 1] 4422 	cp a,#TK_INTGR 
      00AC2C 00 0F            [ 1] 4423 	jreq 1$
      00AC2E C8 00 18         [ 2] 4424 	jp syntax_error 
      00AC31 97               [ 2] 4425 1$: tnzw x  
      00AC32 C6 00            [ 1] 4426 	jreq cs_high 
      00AC34 0E C8 00 17      [ 1] 4427 	bres PE_ODR,#SPI_CS_BIT
      00AC38 95               [ 4] 4428 	ret 
      002F1C                       4429 cs_high: 
      00AC39 CF 00 17 C6      [ 1] 4430 	bset PE_ODR,#SPI_CS_BIT
      00AC3D 00               [ 4] 4431 	ret 
                                   4432 
                                   4433 ;-------------------------------
                                   4434 ; BASIC: PAD 
                                   4435 ; Return pad buffer address.
                                   4436 ;------------------------------
      002F21                       4437 pad_ref:
      00AC3E 16 A4 7F         [ 2] 4438 	ldw x,#pad 
      00AC41 72               [ 1] 4439 	clr a
      00AC42 A2               [ 4] 4440 	ret 
                                   4441 
                                   4442 ;****************************
                                   4443 ; expression stack 
                                   4444 ; manipulation routines
                                   4445 ;****************************
                                   4446 
                                   4447 ;-----------------------------
                                   4448 ; BASIC: PUSH expr|rel|cond 
                                   4449 ; push the result on xtack
                                   4450 ;-----------------------------
      002F26                       4451 xpush:
      00AC43 00 03 90         [ 4] 4452 	call condition 
      00AC46 F7               [ 4] 4453 	ret 
                                   4454 
                                   4455 ;------------------------------
                                   4456 ; BASIC: POP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4457 ; pop top of xstack 
                                   4458 ;------------------------------
      002F2A                       4459 xpop:
      002F2A                       4460 	_xpop 
      00AC47 90 EF            [ 1]    1     ld a,(y)
      00AC49 01               [ 1]    2     ldw x,y 
      00AC4A 84 85            [ 2]    3     ldw x,(1,x)
      00AC4C 72 A2 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AC50 90               [ 4] 4461 	ret 
                                   4462 
                                   4463 
                                   4464 ;------------------------------
                                   4465 ; BASIC: ALLOC expr 
                                   4466 ; allocate expr element on xtack 
                                   4467 ;-------------------------------
      002F34                       4468 xalloc: 
      00AC51 F7 90 EF         [ 4] 4469 	call expression 
      00AC54 01 CD            [ 1] 4470 	cp a,#TK_INTGR
      00AC56 84 0E            [ 1] 4471 	jreq 1$ 
      00AC58 90 F6 93         [ 2] 4472 	jp syntax_error
      002F3E                       4473 1$: _xpop 
      00AC5B EE 01            [ 1]    1     ld a,(y)
      00AC5D 72               [ 1]    2     ldw x,y 
      00AC5E A9 00            [ 2]    3     ldw x,(1,x)
      00AC60 03 1C 00 01      [ 2]    4     addw y,#CELL_SIZE 
      00AC64 A9               [ 1] 4474 	tnz a 
      00AC65 00 81            [ 1] 4475 	jreq 3$ 
      00AC67 A6 0A            [ 1] 4476 2$:	ld a,#ERR_BAD_VALUE
      00AC67 90 89 52         [ 2] 4477 	jp tb_error 
      00AC6A 03 0F 02         [ 2] 4478 3$: cpw x,#XSTACK_SIZE 
      00AC6D 0F 03            [ 1] 4479 	jrugt 2$
      00AC6F 90 AE            [ 1] 4480 	ld a,#CELL_SIZE 
      00AC71 B4               [ 4] 4481 	mul x,a 
      00AC72 3C 93 F6         [ 2] 4482 	ldw acc16,x 
      00AC75 A4 0F 6B 01      [ 2] 4483 	subw y,acc16 
      00AC79 0C 03 5C F6      [ 2] 4484 	cpw y,#xstack_full
      00AC7D CD 89            [ 1] 4485 	jrugt 9$
      00AC7F 5A 0C            [ 1] 4486 	ld a,#ERR_MEM_FULL
      00AC81 02 0A 01         [ 2] 4487 	jp tb_error 
      002F69                       4488 9$:	 
      00AC84 26               [ 4] 4489 	ret 
                                   4490 
                                   4491 
                                   4492 ;------------------------------
                                   4493 ;  BASIC DROP expr 
                                   4494 ;  expr in range {0..XSTACK_SIZE}
                                   4495 ;  discard n elements from xtack
                                   4496 ;------------------------------
      002F6A                       4497 xdrop:
      00AC85 F5 A6 46         [ 4] 4498 	call expression 
      00AC88 11 02            [ 1] 4499 	cp a,#TK_INTGR
      00AC8A 2B 09            [ 1] 4500 	jreq 1$ 
      00AC8C A6 20 CD         [ 2] 4501 	jp syntax_error 
      002F74                       4502 1$:	_xpop 
      00AC8F 89 5A            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00AC91 0C               [ 1]    2     ldw x,y 
      00AC92 02 20            [ 2]    3     ldw x,(1,x)
      00AC94 07 A6 0D CD      [ 2]    4     addw y,#CELL_SIZE 
      00AC98 89               [ 1] 4503 	ld a,xl 
      00AC99 5A 0F            [ 1] 4504 	and a,#0x1f 
      00AC9B 02               [ 1] 4505 	clrw x 
      00AC9C 72               [ 1] 4506 	ld xl,a 
      00AC9D A2 00            [ 1] 4507 	ld a,#CELL_SIZE 
      00AC9F 02               [ 4] 4508 	mul x,a 
      00ACA0 90 FE 26         [ 2] 4509 	ldw acc16,x  
      00ACA3 CF A6 0D CD      [ 2] 4510 	addw y,acc16 
      00ACA7 89 5A 5F 7B      [ 2] 4511 	cpw y,#XSTACK_EMPTY 
      00ACAB 03 97            [ 2] 4512 	jrule 9$
      00ACAD CD 98 61 AE      [ 2] 4513 	ldw y,#XSTACK_EMPTY 
      00ACB1 AC               [ 4] 4514 9$:	ret 
                                   4515 
                                   4516 ;-----------------------
                                   4517 ; check if value in A:X 
                                   4518 ; is inside xstack bound
                                   4519 ; output:
                                   4520 ;    X     slot address  
                                   4521 ;-----------------------
      002F97                       4522 xstack_bound:
      00ACB2 BB               [ 1] 4523 	tnz a 
      00ACB3 CD 89            [ 1] 4524 	jrne 8$ 
      00ACB5 B7 5B 03         [ 2] 4525 1$: cpw x,#XSTACK_SIZE 
      00ACB8 90 85            [ 1] 4526 	jrugt 8$
      00ACBA 81 20            [ 1] 4527 	ld a,#CELL_SIZE 
      00ACBC 77               [ 4] 4528 	mul x,a
      00ACBD 6F 72 64         [ 2] 4529 	ldw acc16,x 
      00ACC0 73               [ 1] 4530 	ldw x,y 
      00ACC1 20 69 6E 20      [ 2] 4531 	addw x,acc16 
      00ACC5 64 69 63         [ 2] 4532 	cpw x,#XSTACK_EMPTY 
      00ACC8 74 69            [ 1] 4533 	jruge 8$  
      00ACCA 6F               [ 4] 4534 	ret 
      00ACCB 6E 61            [ 1] 4535 8$: ld a,#ERR_BAD_VALUE
      00ACCD 72 79 0A         [ 2] 4536 	jp tb_error 
                                   4537 
                                   4538 ;-------------------------
                                   4539 ; BASIC: PUT expr, cond 
                                   4540 ; expr -> slot 
                                   4541 ; cond -> valut to put 
                                   4542 ; on xstack 
                                   4543 ;-------------------------
      002FB5                       4544 xput:
      00ACD0 00 19 61         [ 4] 4545 	call arg_list 
      00ACD1 A1 02            [ 1] 4546 	cp a,#2 
      00ACD1 CD 99            [ 1] 4547 	jreq 1$ 
      00ACD3 E1 A1 01         [ 2] 4548 0$:	jp syntax_error
      002FBF                       4549 1$: _xpop   ; value to put 
      00ACD6 27 03            [ 1]    1     ld a,(y)
      00ACD8 CC               [ 1]    2     ldw x,y 
      00ACD9 96 B5            [ 2]    3     ldw x,(1,x)
      00ACDB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00ACDB 90               [ 2] 4550 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00ACDC F6               [ 1] 4551 	push a 
      002FCA                       4552 	_xpop    ; slot 
      00ACDD 93 EE            [ 1]    1     ld a,(y)
      00ACDF 01               [ 1]    2     ldw x,y 
      00ACE0 72 A9            [ 2]    3     ldw x,(1,x)
      00ACE2 00 03 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00ACE6 13 81 97         [ 4] 4553 	call xstack_bound
      00ACE8 CF 00 19         [ 2] 4554     ldw ptr16,x 
      00ACE8 4F               [ 1] 4555 	pop a 
      00ACE9 CE               [ 2] 4556 	popw x 
      00ACEA 00 13 27 02      [ 4] 4557 	ld [ptr16],a 
      00ACEE 5F 81 43 53      [ 1] 4558 	inc ptr8 
      00ACF2 81 CF 00 19      [ 5] 4559 	ldw [ptr16],x 
      00ACF3 81               [ 4] 4560 	ret 
                                   4561 
                                   4562 ;------------------------
                                   4563 ; BASIC: PICK expr 
                                   4564 ; get nième element on 
                                   4565 ; xtack. 
                                   4566 ;-----------------------
      002FE8                       4567 xpick:
      00ACF3 CD 99 E1         [ 4] 4568 	call func_args 
      00ACF6 A1 01            [ 1] 4569 	cp a,#1 
      00ACF8 27 03            [ 1] 4570 	jreq 1$
      00ACFA CC 96 B5         [ 2] 4571 	jp syntax_error 
      002FF2                       4572 1$: _xpop 
      00ACFD 90 F6            [ 1]    1     ld a,(y)
      00ACFF 93               [ 1]    2     ldw x,y 
      00AD00 EE 01            [ 2]    3     ldw x,(1,x)
      00AD02 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AD06 4B 00 35         [ 4] 4573 	call xstack_bound
      00AD09 CC               [ 1] 4574     ld a,(x)
      00AD0A 50 E0            [ 2] 4575 	ldw x,(1,x)				
      00AD0C 9E               [ 4] 4576 	ret 
                                   4577 
                                   4578 
                                   4579 
                                   4580 ;------------------------------
                                   4581 ;      dictionary 
                                   4582 ; format:
                                   4583 ;   link:   2 bytes 
                                   4584 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4585 ;   cmd_name: 16 byte max 
                                   4586 ;   code_addr: 2 bytes 
                                   4587 ;------------------------------
                                   4588 	.macro _dict_entry len,name,code_addr 
                                   4589 	.word LINK 
                                   4590 	LINK=.
                                   4591 name:
                                   4592 	.byte len   	
                                   4593 	.ascii "name"
                                   4594 	.word code_addr  
                                   4595 	.endm 
                                   4596 
                           000000  4597 	LINK=0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4598 ; respect alphabetic order for BASIC names from Z-A
                                   4599 ; this sort order is for a cleaner WORDS cmd output. 	
      003002                       4600 kword_end:
      003002                       4601 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AD0D A4 3F                    1 	.word LINK 
                           003004     2 	LINK=.
      003004                          3 XOR:
      00AD0F 95                       4 	.byte 3+F_XOR   	
      00AD10 A3 00 FF                 5 	.ascii "XOR"
      00AD13 23 06                    6 	.word TK_XOR  
      00300A                       4602 	_dict_entry,5,WRITE,write  
      00AD15 0C 01                    1 	.word LINK 
                           00300C     2 	LINK=.
      00300C                          3 WRITE:
      00AD17 98                       4 	.byte 5   	
      00AD18 56 20 F5 35 55           5 	.ascii "WRITE"
      00AD1D 50 E0                    6 	.word write  
      003014                       4603 	_dict_entry,5,WORDS,words 
      00AD1F 84 C7                    1 	.word LINK 
                           003016     2 	LINK=.
      003016                          3 WORDS:
      00AD21 50                       4 	.byte 5   	
      00AD22 E1 9F 4A 35 55           5 	.ascii "WORDS"
      00AD27 50 E0                    6 	.word words  
      00301E                       4604 	_dict_entry 4,WAIT,wait 
      00AD29 C7 50                    1 	.word LINK 
                           003020     2 	LINK=.
      003020                          3 WAIT:
      00AD2B E2                       4 	.byte 4   	
      00AD2C 35 AA 50 E0              5 	.ascii "WAIT"
      00AD30 81 BB                    6 	.word wait  
      00AD31                       4605 	_dict_entry,3+F_IFUNC,USR,usr
      00AD31 35 AA                    1 	.word LINK 
                           003029     2 	LINK=.
      003029                          3 USR:
      00AD33 50                       4 	.byte 3+F_IFUNC   	
      00AD34 E0 81 52                 5 	.ascii "USR"
      00AD36 29 8C                    6 	.word usr  
      00302F                       4606 	_dict_entry,5,UNTIL,until 
      00AD36 CD 99                    1 	.word LINK 
                           003031     2 	LINK=.
      003031                          3 UNTIL:
      00AD38 DC                       4 	.byte 5   	
      00AD39 A1 01 27 03 CC           5 	.ascii "UNTIL"
      00AD3E 96 B5                    6 	.word until  
      00AD40                       4607 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00AD40 90 F6                    1 	.word LINK 
                           00303B     2 	LINK=.
      00303B                          3 UFLASH:
      00AD42 93                       4 	.byte 6+F_IFUNC   	
      00AD43 EE 01 72 A9 00 03        5 	.ascii "UFLASH"
      00AD49 4D 26                    6 	.word uflash  
      003044                       4608 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00AD4B 08 5D                    1 	.word LINK 
                           003046     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      003046                          3 UBOUND:
      00AD4D 26                       4 	.byte 6+F_IFUNC   	
      00AD4E 05 A6 0A CC 96 B7        5 	.ascii "UBOUND"
      00AD54 4B 18                    6 	.word ubound  
      00304F                       4609 	_dict_entry,4,TONE,tone  
      00AD56 59 49                    1 	.word LINK 
                           003051     2 	LINK=.
      003051                          3 TONE:
      00AD58 25                       4 	.byte 4   	
      00AD59 04 0A 01 26              5 	.ascii "TONE"
      00AD5D F8 5F                    6 	.word tone  
      003058                       4610 	_dict_entry,2,TO,to
      00AD5F 84 4A                    1 	.word LINK 
                           00305A     2 	LINK=.
      00305A                          3 TO:
      00AD61 02                       4 	.byte 2   	
      00AD62 54 4F                    5 	.ascii "TO"
      00AD62 81 25                    6 	.word to  
      00AD63                       4611 	_dict_entry,5,TIMER,set_timer
      00AD63 CD 99                    1 	.word LINK 
                           003061     2 	LINK=.
      003061                          3 TIMER:
      00AD65 DC                       4 	.byte 5   	
      00AD66 A1 01 27 03 CC           5 	.ascii "TIMER"
      00AD6B 96 B5                    6 	.word set_timer  
      003069                       4612 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AD6D 90 F6                    1 	.word LINK 
                           00306B     2 	LINK=.
      00306B                          3 TIMEOUT:
      00AD6F 93                       4 	.byte 7+F_IFUNC   	
      00AD70 EE 01 72 A9 00 03 9F     5 	.ascii "TIMEOUT"
      00AD77 AE 00                    6 	.word timeout  
      003075                       4613 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AD79 01 A4                    1 	.word LINK 
                           003077     2 	LINK=.
      003077                          3 TICKS:
      00AD7B 17                       4 	.byte 5+F_IFUNC   	
      00AD7C 27 0A 88 4F 53           5 	.ascii "TICKS"
      00AD80 2A 38                    6 	.word get_ticks  
      00307F                       4614 	_dict_entry,4,STOP,stop 
      00AD80 58 49                    1 	.word LINK 
                           003081     2 	LINK=.
      003081                          3 STOP:
      00AD82 0A                       4 	.byte 4   	
      00AD83 01 26 FA 50              5 	.ascii "STOP"
      00AD86 26 8E                    6 	.word stop  
      003088                       4615 	_dict_entry,4,STEP,step 
      00AD86 5B 01                    1 	.word LINK 
                           00308A     2 	LINK=.
      00308A                          3 STEP:
      00AD88 81                       4 	.byte 4   	
      00AD89 53 54 45 50              5 	.ascii "STEP"
      00AD89 85 52                    6 	.word step  
      003091                       4616 	_dict_entry,5,SPIWR,spi_write
      00AD8B 04 89                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



                           003093     2 	LINK=.
      003093                          3 SPIWR:
      00AD8D CE                       4 	.byte 5   	
      00AD8E 00 05 1F 03 CE           5 	.ascii "SPIWR"
      00AD93 00 01                    6 	.word spi_write  
      00309B                       4617 	_dict_entry,6,SPISEL,spi_select
      00AD95 1F 05                    1 	.word LINK 
                           00309D     2 	LINK=.
      00309D                          3 SPISEL:
      00AD97 72                       4 	.byte 6   	
      00AD98 5C 00 20 81 45 4C        5 	.ascii "SPISEL"
      00AD9C 2F 0A                    6 	.word spi_select  
      0030A6                       4618 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AD9C 72 5D                    1 	.word LINK 
                           0030A8     2 	LINK=.
      0030A8                          3 SPIRD:
      00AD9E 00                       4 	.byte 5+F_IFUNC   	
      00AD9F 20 26 03 CC 96           5 	.ascii "SPIRD"
      00ADA4 B5 03                    6 	.word spi_read  
      00ADA5                       4619 	_dict_entry,5,SPIEN,spi_enable 
      00ADA5 CD 9C                    1 	.word LINK 
                           0030B2     2 	LINK=.
      0030B2                          3 SPIEN:
      00ADA7 3E                       4 	.byte 5   	
      00ADA8 90 F6 93 EE 01           5 	.ascii "SPIEN"
      00ADAD 72 A9                    6 	.word spi_enable  
      0030BA                       4620 	_dict_entry,5,SLEEP,sleep 
      00ADAF 00 03                    1 	.word LINK 
                           0030BC     2 	LINK=.
      0030BC                          3 SLEEP:
      00ADB1 4D                       4 	.byte 5   	
      00ADB2 26 13 5D 26 10           5 	.ascii "SLEEP"
      00ADB7 1E 03                    6 	.word sleep  
      0030C4                       4621     _dict_entry,4,SIZE,cmd_size 
      00ADB9 CF 00                    1 	.word LINK 
                           0030C6     2 	LINK=.
      0030C6                          3 SIZE:
      00ADBB 05                       4 	.byte 4   	
      00ADBC E6 02 C7 00              5 	.ascii "SIZE"
      00ADC0 04 1E                    6 	.word cmd_size  
      0030CD                       4622 	_dict_entry,4,SAVE,save_app 
      00ADC2 05 CF                    1 	.word LINK 
                           0030CF     2 	LINK=.
      0030CF                          3 SAVE:
      00ADC4 00                       4 	.byte 4   	
      00ADC5 01 81 56 45              5 	.ascii "SAVE"
      00ADC7 27 80                    6 	.word save_app  
      0030D6                       4623 	_dict_entry 3,RUN,run
      00ADC7 85 5B                    1 	.word LINK 
                           0030D8     2 	LINK=.
      0030D8                          3 RUN:
      00ADC9 04                       4 	.byte 3   	
      00ADCA 72 5A 00                 5 	.ascii "RUN"
      00ADCD 20 FC                    6 	.word run  
      00ADCF                       4624 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00ADCF AE 50                    1 	.word LINK 
                           0030E0     2 	LINK=.
      0030E0                          3 RSHIFT:
      00ADD1 00                       4 	.byte 6+F_IFUNC   	
      00ADD2 4F 81 48 49 46 54        5 	.ascii "RSHIFT"
      00ADD4 2A 82                    6 	.word rshift  
      0030E9                       4625 	_dict_entry,3+F_IFUNC,RND,random 
      00ADD4 AE 50                    1 	.word LINK 
                           0030EB     2 	LINK=.
      0030EB                          3 RND:
      00ADD6 05                       4 	.byte 3+F_IFUNC   	
      00ADD7 4F 81 44                 5 	.ascii "RND"
      00ADD9 2B 4C                    6 	.word random  
      0030F1                       4626 	_dict_entry,6,RETURN,return 
      00ADD9 AE 50                    1 	.word LINK 
                           0030F3     2 	LINK=.
      0030F3                          3 RETURN:
      00ADDB 0A                       4 	.byte 6   	
      00ADDC 4F 81 54 55 52 4E        5 	.ascii "RETURN"
      00ADDE 24 64                    6 	.word return  
      0030FC                       4627 	_dict_entry,7,RESTORE,restore 
      00ADDE AE 50                    1 	.word LINK 
                           0030FE     2 	LINK=.
      0030FE                          3 RESTORE:
      00ADE0 0F                       4 	.byte 7   	
      00ADE1 4F 81 53 54 4F 52 45     5 	.ascii "RESTORE"
      00ADE3 2D B3                    6 	.word restore  
      003108                       4628 	_dict_entry 3,REM,remark 
      00ADE3 AE 50                    1 	.word LINK 
                           00310A     2 	LINK=.
      00310A                          3 REM:
      00ADE5 14                       4 	.byte 3   	
      00ADE6 4F 81 4D                 5 	.ascii "REM"
      00ADE8 20 B5                    6 	.word remark  
      003110                       4629 	_dict_entry,6,REBOOT,cold_start
      00ADE8 AE 50                    1 	.word LINK 
                           003112     2 	LINK=.
      003112                          3 REBOOT:
      00ADEA 19                       4 	.byte 6   	
      00ADEB 4F 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00ADED 00 B5                    6 	.word cold_start  
      00311B                       4630 	_dict_entry,4+F_IFUNC,READ,read  
      00ADED AE 50                    1 	.word LINK 
                           00311D     2 	LINK=.
      00311D                          3 READ:
      00ADEF 1E                       4 	.byte 4+F_IFUNC   	
      00ADF0 4F 81 41 44              5 	.ascii "READ"
      00ADF2 2E 1D                    6 	.word read  
      003124                       4631 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00ADF2 AE 50                    1 	.word LINK 
                           003126     2 	LINK=.
      003126                          3 QKEY:
      00ADF4 28                       4 	.byte 4+F_IFUNC   	
      00ADF5 4F 81 45 59              5 	.ascii "QKEY"
      00ADF7 29 32                    6 	.word qkey  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00312D                       4632 	_dict_entry,3,PUT,xput 
      00ADF7 4F AE                    1 	.word LINK 
                           00312F     2 	LINK=.
      00312F                          3 PUT:
      00ADF9 00                       4 	.byte 3   	
      00ADFA 00 81 54                 5 	.ascii "PUT"
      00ADFC 2F B5                    6 	.word xput  
      003135                       4633 	_dict_entry,4,PUSH,xpush   
      00ADFC 4F AE                    1 	.word LINK 
                           003137     2 	LINK=.
      003137                          3 PUSH:
      00ADFE 00                       4 	.byte 4   	
      00ADFF 01 81 53 48              5 	.ascii "PUSH"
      00AE01 2F 26                    6 	.word xpush  
      00313E                       4634 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AE01 4F AE                    1 	.word LINK 
                           003140     2 	LINK=.
      003140                          3 PORTI:
      00AE03 00                       4 	.byte 5+F_IFUNC   	
      00AE04 02 81 52 54 49           5 	.ascii "PORTI"
      00AE06 2D 72                    6 	.word const_porti  
      003148                       4635 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AE06 4F AE                    1 	.word LINK 
                           00314A     2 	LINK=.
      00314A                          3 PORTG:
      00AE08 00                       4 	.byte 5+F_IFUNC   	
      00AE09 03 81 52 54 47           5 	.ascii "PORTG"
      00AE0B 2D 6D                    6 	.word const_portg  
      003152                       4636 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AE0B 4F AE                    1 	.word LINK 
                           003154     2 	LINK=.
      003154                          3 PORTF:
      00AE0D 00                       4 	.byte 5+F_IFUNC   	
      00AE0E 04 81 52 54 46           5 	.ascii "PORTF"
      00AE10 2D 68                    6 	.word const_portf  
      00315C                       4637 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AE10 4F AE                    1 	.word LINK 
                           00315E     2 	LINK=.
      00315E                          3 PORTE:
      00AE12 00                       4 	.byte 5+F_IFUNC   	
      00AE13 01 81 52 54 45           5 	.ascii "PORTE"
      00AE15 2D 63                    6 	.word const_porte  
      003166                       4638 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AE15 4F AE                    1 	.word LINK 
                           003168     2 	LINK=.
      003168                          3 PORTD:
      00AE17 00                       4 	.byte 5+F_IFUNC   	
      00AE18 00 81 52 54 44           5 	.ascii "PORTD"
      00AE1A 2D 5E                    6 	.word const_portd  
      003170                       4639 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AE1A 4F AE                    1 	.word LINK 
                           003172     2 	LINK=.
      003172                          3 PORTC:
      00AE1C 40                       4 	.byte 5+F_IFUNC   	
      00AE1D 00 81 52 54 43           5 	.ascii "PORTC"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AE1F 2D 59                    6 	.word const_portc  
      00317A                       4640 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AE1F 55 00                    1 	.word LINK 
                           00317C     2 	LINK=.
      00317C                          3 PORTB:
      00AE21 04                       4 	.byte 5+F_IFUNC   	
      00AE22 00 02 81 54 42           5 	.ascii "PORTB"
      00AE25 2D 54                    6 	.word const_portb  
      003184                       4641 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AE25 89 E6                    1 	.word LINK 
                           003186     2 	LINK=.
      003186                          3 PORTA:
      00AE27 03                       4 	.byte 5+F_IFUNC   	
      00AE28 A1 80 26 05 EE           5 	.ascii "PORTA"
      00AE2D 04 A3                    6 	.word const_porta  
      00318E                       4642 	_dict_entry 5,PRINT,print 
      00AE2F AE 1F                    1 	.word LINK 
                           003190     2 	LINK=.
      003190                          3 PRINT:
      00AE31 85                       4 	.byte 5   	
      00AE32 81 52 49 4E 54           5 	.ascii "PRINT"
      00AE33 1F 6D                    6 	.word print  
      003198                       4643 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AE33 5F CF                    1 	.word LINK 
                           00319A     2 	LINK=.
      00319A                          3 POUT:
      00AE35 00                       4 	.byte 4+F_IFUNC   	
      00AE36 07 CF 00 09              5 	.ascii "POUT"
      00AE3A CE 00                    6 	.word const_output  
      0031A1                       4644 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AE3C 1C CD                    1 	.word LINK 
                           0031A3     2 	LINK=.
      0031A3                          3 POP:
      00AE3E 98                       4 	.byte 3+F_IFUNC   	
      00AE3F 19 A1 84                 5 	.ascii "POP"
      00AE42 26 10                    6 	.word xpop  
      0031A9                       4645 	_dict_entry,4,POKE,poke 
      00AE44 CD 98                    1 	.word LINK 
                           0031AB     2 	LINK=.
      0031AB                          3 POKE:
      00AE46 4B                       4 	.byte 4   	
      00AE47 90 89 4F CD              5 	.ascii "POKE"
      00AE4B 8C 94                    6 	.word poke  
      0031B2                       4646 	_dict_entry,5,PMODE,pin_mode 
      00AE4D 90 85                    1 	.word LINK 
                           0031B4     2 	LINK=.
      0031B4                          3 PMODE:
      00AE4F 5D                       4 	.byte 5   	
      00AE50 26 17 20 44 45           5 	.ascii "PMODE"
      00AE54 2A BD                    6 	.word pin_mode  
      0031BC                       4647 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AE54 55 00                    1 	.word LINK 
                           0031BE     2 	LINK=.
      0031BE                          3 PINP:
      00AE56 03                       4 	.byte 4+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AE57 00 02 C3 00              5 	.ascii "PINP"
      00AE5B 1E 24                    6 	.word const_input  
      0031C5                       4648 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AE5D 3A BE                    1 	.word LINK 
                           0031C7     2 	LINK=.
      00AE5E                          3 PICK:
      00AE5E CD                       4 	.byte 4+F_IFUNC   	
      00AE5F AE 25 26 00              5 	.ascii "PICK"
      00AE63 CD AE                    6 	.word xpick  
      0031CE                       4649 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AE65 76 26                    1 	.word LINK 
                           0031D0     2 	LINK=.
      0031D0                          3 PEEK:
      00AE67 FB                       4 	.byte 4+F_IFUNC   	
      00AE68 81 45 45 4B              5 	.ascii "PEEK"
      00AE69 21 B7                    6 	.word peek  
      0031D7                       4650 	_dict_entry,5,PAUSE,pause 
      00AE69 CF 00                    1 	.word LINK 
                           0031D9     2 	LINK=.
      0031D9                          3 PAUSE:
      00AE6B 07                       4 	.byte 5   	
      00AE6C E6 02 C7 00 0A           5 	.ascii "PAUSE"
      00AE71 35 06                    6 	.word pause  
      0031E1                       4651 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AE73 00 09                    1 	.word LINK 
                           0031E3     2 	LINK=.
      0031E3                          3 PAD:
      00AE75 81                       4 	.byte 3+F_IFUNC   	
      00AE76 50 41 44                 5 	.ascii "PAD"
      00AE76 E6 02                    6 	.word pad_ref  
      0031E9                       4652 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AE78 C7 00                    1 	.word LINK 
                           0031EB     2 	LINK=.
      0031EB                          3 OR:
      00AE7A 0F                       4 	.byte 2+F_OR   	
      00AE7B 72 5F                    5 	.ascii "OR"
      00AE7D 00 0E                    6 	.word TK_OR  
      0031F0                       4653 	_dict_entry,2,ON,cmd_on 
      00AE7F 72 BB                    1 	.word LINK 
                           0031F2     2 	LINK=.
      0031F2                          3 ON:
      00AE81 00                       4 	.byte 2   	
      00AE82 0E C3                    5 	.ascii "ON"
      00AE84 00 1E                    6 	.word cmd_on  
      0031F7                       4654 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AE86 25 02                    1 	.word LINK 
                           0031F9     2 	LINK=.
      0031F9                          3 ODR:
      00AE88 20                       4 	.byte 3+F_IFUNC   	
      00AE89 0E 44 52                 5 	.ascii "ODR"
      00AE8A 2D 77                    6 	.word const_odr  
      0031FF                       4655 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AE8A CD AE                    1 	.word LINK 
                           003201     2 	LINK=.
      003201                          3 NOT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AE8C 25                       4 	.byte 3+F_NOT   	
      00AE8D 27 04 A6                 5 	.ascii "NOT"
      00AE90 01 20                    6 	.word TK_NOT  
      003207                       4656 	_dict_entry,4,NEXT,next 
      00AE92 04 CD                    1 	.word LINK 
                           003209     2 	LINK=.
      003209                          3 NEXT:
      00AE94 AE                       4 	.byte 4   	
      00AE95 69 4F 81 54              5 	.ascii "NEXT"
      00AE98 22 AD                    6 	.word next  
      003210                       4657 	_dict_entry,3,NEW,new
      00AE98 A6 0C                    1 	.word LINK 
                           003212     2 	LINK=.
      003212                          3 NEW:
      00AE9A CC                       4 	.byte 3   	
      00AE9B 96 B7 57                 5 	.ascii "NEW"
      00AE9D 26 DA                    6 	.word new  
      003218                       4658 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AE9D 52 07                    1 	.word LINK 
                           00321A     2 	LINK=.
      00321A                          3 LSHIFT:
      00AE9F CD                       4 	.byte 6+F_IFUNC   	
      00AEA0 A0 76 48 49 46 54        5 	.ascii "LSHIFT"
      00AEA2 2A 56                    6 	.word lshift  
      003223                       4659 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AEA2 C6 00                    1 	.word LINK 
                           003225     2 	LINK=.
      003225                          3 LOG2:
      00AEA4 09                       4 	.byte 4+F_IFUNC   	
      00AEA5 C1 00 0A 27              5 	.ascii "LOG2"
      00AEA9 37 B6                    6 	.word log2  
      00AEAA                       4660 	_dict_entry 4,LIST,list
      00AEAA CE 00                    1 	.word LINK 
                           00322E     2 	LINK=.
      00322E                          3 LIST:
      00AEAC 07                       4 	.byte 4   	
      00AEAD CF 00 05 55              5 	.ascii "LIST"
      00AEB1 00 09                    6 	.word list  
      003235                       4661 	_dict_entry 3,LET,let 
      00AEB3 00 02                    1 	.word LINK 
                           003237     2 	LINK=.
      003237                          3 LET:
      00AEB5 55                       4 	.byte 3   	
      00AEB6 00 0A 00                 5 	.ascii "LET"
      00AEB9 04 CD                    6 	.word let  
      00323D                       4662 	_dict_entry,3+F_CFUNC,KEY,key 
      00AEBB 9B 25                    1 	.word LINK 
                           00323F     2 	LINK=.
      00323F                          3 KEY:
      00AEBD A1                       4 	.byte 3+F_CFUNC   	
      00AEBE 84 27 03                 5 	.ascii "KEY"
      00AEC1 CC 96                    6 	.word key  
      003245                       4663 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AEC3 B5 3F                    1 	.word LINK 
                           003247     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AEC4                          3 IWDGREF:
      00AEC4 CD                       4 	.byte 7   	
      00AEC5 98 19 CE 00 05 CF 00     5 	.ascii "IWDGREF"
      00AECC 07 55                    6 	.word refresh_iwdg  
      003251                       4664 	_dict_entry,6,IWDGEN,enable_iwdg
      00AECE 00 02                    1 	.word LINK 
                           003253     2 	LINK=.
      003253                          3 IWDGEN:
      00AED0 00                       4 	.byte 6   	
      00AED1 09 CD A0 86 90 F6        5 	.ascii "IWDGEN"
      00AED7 93 EE                    6 	.word enable_iwdg  
      00325C                       4665 	_dict_entry,5,INPUT,input_var  
      00AED9 01 72                    1 	.word LINK 
                           00325E     2 	LINK=.
      00325E                          3 INPUT:
      00AEDB A9                       4 	.byte 5   	
      00AEDC 00 03 5B 07 81           5 	.ascii "INPUT"
      00AEE1 20 16                    6 	.word input_var  
      003266                       4666 	_dict_entry,2,IF,if 
      00AEE1 CE 00                    1 	.word LINK 
                           003268     2 	LINK=.
      003268                          3 IF:
      00AEE3 07                       4 	.byte 2   	
      00AEE4 CD AE                    5 	.ascii "IF"
      00AEE6 76 27                    6 	.word if  
      00326D                       4667 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AEE8 C1 20                    1 	.word LINK 
                           00326F     2 	LINK=.
      00326F                          3 IDR:
      00AEEA AD                       4 	.byte 3+F_IFUNC   	
      00AEEB 49 44 52                 5 	.ascii "IDR"
      00AEEB CD 99                    6 	.word const_idr  
      003275                       4668 	_dict_entry,3,HEX,hex_base
      00AEED E1 A1                    1 	.word LINK 
                           003277     2 	LINK=.
      003277                          3 HEX:
      00AEEF 02                       4 	.byte 3   	
      00AEF0 27 03 CC                 5 	.ascii "HEX"
      00AEF3 96 B5                    6 	.word hex_base  
      00AEF5                       4669 	_dict_entry,4,GOTO,goto 
      00AEF5 72 12                    1 	.word LINK 
                           00327F     2 	LINK=.
      00327F                          3 GOTO:
      00AEF7 50                       4 	.byte 4   	
      00AEF8 C7 85 5D 27              5 	.ascii "GOTO"
      00AEFC 21 85                    6 	.word goto  
      003286                       4670 	_dict_entry,5,GOSUB,gosub 
      00AEFE A6 08                    1 	.word LINK 
                           003288     2 	LINK=.
      003288                          3 GOSUB:
      00AF00 42                       4 	.byte 5   	
      00AF01 9F C7 52 00 72           5 	.ascii "GOSUB"
      00AF06 1A 50                    6 	.word gosub  
      003290                       4671 	_dict_entry,3,GET,cmd_get 
      00AF08 14 72                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



                           003292     2 	LINK=.
      003292                          3 GET:
      00AF0A 1A                       4 	.byte 3   	
      00AF0B 50 16 72                 5 	.ascii "GET"
      00AF0E 14 52                    6 	.word cmd_get  
      003298                       4672 	_dict_entry,4+F_IFUNC,FREE,free
      00AF10 00 72                    1 	.word LINK 
                           00329A     2 	LINK=.
      00329A                          3 FREE:
      00AF12 12                       4 	.byte 4+F_IFUNC   	
      00AF13 52 01 72 10              5 	.ascii "FREE"
      00AF17 52 01                    6 	.word free  
      0032A1                       4673 	_dict_entry,3,FOR,for 
      00AF19 72 1C                    1 	.word LINK 
                           0032A3     2 	LINK=.
      0032A3                          3 FOR:
      00AF1B 52                       4 	.byte 3   	
      00AF1C 00 81 52                 5 	.ascii "FOR"
      00AF1E 21 F5                    6 	.word for  
      0032A9                       4674 	_dict_entry,4,FCPU,fcpu 
      00AF1E 5B 02                    1 	.word LINK 
                           0032AB     2 	LINK=.
      0032AB                          3 FCPU:
      00AF20 A6                       4 	.byte 4   	
      00AF21 82 C4 52 03              5 	.ascii "FCPU"
      00AF25 A1 02                    6 	.word fcpu  
      0032B2                       4675 	_dict_entry,5,ERASE,erase 
      00AF27 26 F7                    1 	.word LINK 
                           0032B4     2 	LINK=.
      0032B4                          3 ERASE:
      00AF29 72                       4 	.byte 5   	
      00AF2A 1D 52 00 72 13           5 	.ascii "ERASE"
      00AF2F 50 C7                    6 	.word erase  
      0032BC                       4676 	_dict_entry,3,END,cmd_end  
      00AF31 72 1B                    1 	.word LINK 
                           0032BE     2 	LINK=.
      0032BE                          3 END:
      00AF33 50                       4 	.byte 3   	
      00AF34 16 81 44                 5 	.ascii "END"
      00AF36 24 E6                    6 	.word cmd_end  
      0032C4                       4677 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AF36 A6 78                    1 	.word LINK 
                           0032C6     2 	LINK=.
      0032C6                          3 EEPROM:
      00AF38 C5                       4 	.byte 6+F_IFUNC   	
      00AF39 52 03 27 04 72 5F        5 	.ascii "EEPROM"
      00AF3F 52 03                    6 	.word const_eeprom_base  
      0032CF                       4678 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AF41 81 C6                    1 	.word LINK 
                           0032D1     2 	LINK=.
      00AF42                          3 EEFREE:
      00AF42 88                       4 	.byte 6+F_IFUNC   	
      00AF43 CD AF 36 84 72 03        5 	.ascii "EEFREE"
      00AF49 52 03                    6 	.word func_eefree  
      0032DA                       4679 	_dict_entry,4,EDIT,edit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AF4B FB C7                    1 	.word LINK 
                           0032DC     2 	LINK=.
      0032DC                          3 EDIT:
      00AF4D 52                       4 	.byte 4   	
      00AF4E 04 72 01 52              5 	.ascii "EDIT"
      00AF52 03 FB                    6 	.word edit  
      0032E3                       4680 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AF54 C6 52                    1 	.word LINK 
                           0032E5     2 	LINK=.
      0032E5                          3 DWRITE:
      00AF56 04                       4 	.byte 6+F_CMD   	
      00AF57 81 57 52 49 54 45        5 	.ascii "DWRITE"
      00AF58 26 43                    6 	.word digital_write  
      0032EE                       4681 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AF58 A6 FF                    1 	.word LINK 
                           0032F0     2 	LINK=.
      0032F0                          3 DROP:
      00AF5A 72                       4 	.byte 4   	
      00AF5B 01 52 03 E3              5 	.ascii "DROP"
      00AF5F C6 52                    6 	.word xdrop  
      0032F7                       4682 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AF61 04 81                    1 	.word LINK 
                           0032F9     2 	LINK=.
      00AF63                          3 DREAD:
      00AF63 CD                       4 	.byte 5+F_IFUNC   	
      00AF64 9B 25 A1 84 27           5 	.ascii "DREAD"
      00AF69 03 CC                    6 	.word digital_read  
      003301                       4683 	_dict_entry,2,DO,do_loop
      00AF6B 96 B5                    1 	.word LINK 
                           003303     2 	LINK=.
      00AF6D                          3 DO:
      00AF6D 9F                       4 	.byte 2   	
      00AF6E CD AF                    5 	.ascii "DO"
      00AF70 42 CD                    6 	.word do_loop  
      003308                       4684 	_dict_entry,3,DIM,cmd_dim 
      00AF72 98 19                    1 	.word LINK 
                           00330A     2 	LINK=.
      00330A                          3 DIM:
      00AF74 A1                       4 	.byte 3   	
      00AF75 08 26 02                 5 	.ascii "DIM"
      00AF78 20 E9                    6 	.word cmd_dim  
      003310                       4685 	_dict_entry,3,DEC,dec_base
      00AF7A 4D 27                    1 	.word LINK 
                           003312     2 	LINK=.
      003312                          3 DEC:
      00AF7C 05                       4 	.byte 3   	
      00AF7D 55 00 03                 5 	.ascii "DEC"
      00AF80 00 02                    6 	.word dec_base  
      003318                       4686 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AF82 81 12                    1 	.word LINK 
                           00331A     2 	LINK=.
      00AF83                          3 DDR:
      00AF83 CD                       4 	.byte 3+F_IFUNC   	
      00AF84 AF 58 5F                 5 	.ascii "DDR"
      00AF87 97 4F                    6 	.word const_ddr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      003320                       4687 	_dict_entry,4,DATA,data  
      00AF89 81 1A                    1 	.word LINK 
                           003322     2 	LINK=.
      00AF8A                          3 DATA:
      00AF8A CD                       4 	.byte 4   	
      00AF8B 98 19 A1 84              5 	.ascii "DATA"
      00AF8F 27 03                    6 	.word data  
      003329                       4688 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AF91 CC 96                    1 	.word LINK 
                           00332B     2 	LINK=.
      00332B                          3 CR2:
      00AF93 B5                       4 	.byte 3+F_IFUNC   	
      00AF94 5D 27 05                 5 	.ascii "CR2"
      00AF97 72 1B                    6 	.word const_cr2  
      003331                       4689 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AF99 50 14                    1 	.word LINK 
                           003333     2 	LINK=.
      003333                          3 CR1:
      00AF9B 81                       4 	.byte 3+F_IFUNC   	
      00AF9C 43 52 31                 5 	.ascii "CR1"
      00AF9C 72 1A                    6 	.word const_cr1  
      003339                       4690 	_dict_entry,5,CONST,cmd_const 
      00AF9E 50 14                    1 	.word LINK 
                           00333B     2 	LINK=.
      00333B                          3 CONST:
      00AFA0 81                       4 	.byte 5   	
      00AFA1 43 4F 4E 53 54           5 	.ascii "CONST"
      00AFA1 AE 16                    6 	.word cmd_const  
      003343                       4691 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AFA3 E0 4F                    1 	.word LINK 
                           003345     2 	LINK=.
      003345                          3 CHAR:
      00AFA5 81                       4 	.byte 4+F_CFUNC   	
      00AFA6 43 48 41 52              5 	.ascii "CHAR"
      00AFA6 CD 9C                    6 	.word func_char  
      00334C                       4692 	_dict_entry,3,BYE,bye 
      00AFA8 3E 81                    1 	.word LINK 
                           00334E     2 	LINK=.
      00AFAA                          3 BYE:
      00AFAA 90                       4 	.byte 3   	
      00AFAB F6 93 EE                 5 	.ascii "BYE"
      00AFAE 01 72                    6 	.word bye  
      003354                       4693 	_dict_entry,5,BTOGL,bit_toggle
      00AFB0 A9 00                    1 	.word LINK 
                           003356     2 	LINK=.
      003356                          3 BTOGL:
      00AFB2 03                       4 	.byte 5   	
      00AFB3 81 54 4F 47 4C           5 	.ascii "BTOGL"
      00AFB4 21 3D                    6 	.word bit_toggle  
      00335E                       4694 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AFB4 CD 9B                    1 	.word LINK 
                           003360     2 	LINK=.
      003360                          3 BTEST:
      00AFB6 25                       4 	.byte 5+F_IFUNC   	
      00AFB7 A1 84 27 03 CC           5 	.ascii "BTEST"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AFBC 96 B5                    6 	.word bit_test  
      003368                       4695 	_dict_entry,4,BSET,bit_set 
      00AFBE 90 F6                    1 	.word LINK 
                           00336A     2 	LINK=.
      00336A                          3 BSET:
      00AFC0 93                       4 	.byte 4   	
      00AFC1 EE 01 72 A9              5 	.ascii "BSET"
      00AFC5 00 03                    6 	.word bit_set  
      003371                       4696 	_dict_entry,4,BRES,bit_reset
      00AFC7 4D 27                    1 	.word LINK 
                           003373     2 	LINK=.
      003373                          3 BRES:
      00AFC9 05                       4 	.byte 4   	
      00AFCA A6 0A CC 96              5 	.ascii "BRES"
      00AFCE B7 A3                    6 	.word bit_reset  
      00337A                       4697 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AFD0 00 14                    1 	.word LINK 
                           00337C     2 	LINK=.
      00337C                          3 BIT:
      00AFD2 22                       4 	.byte 3+F_IFUNC   	
      00AFD3 F6 A6 03                 5 	.ascii "BIT"
      00AFD6 42 CF                    6 	.word bitmask  
      003382                       4698 	_dict_entry,3,AWU,awu 
      00AFD8 00 0E                    1 	.word LINK 
                           003384     2 	LINK=.
      003384                          3 AWU:
      00AFDA 72                       4 	.byte 3   	
      00AFDB B2 00 0E                 5 	.ascii "AWU"
      00AFDE 90 A3                    6 	.word awu  
      00338A                       4699 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AFE0 17 60                    1 	.word LINK 
                           00338C     2 	LINK=.
      00338C                          3 ASC:
      00AFE2 22                       4 	.byte 3+F_IFUNC   	
      00AFE3 05 A6 01                 5 	.ascii "ASC"
      00AFE6 CC 96                    6 	.word ascii  
      003392                       4700 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AFE8 B7 8C                    1 	.word LINK 
                           003394     2 	LINK=.
      00AFE9                          3 AND:
      00AFE9 81                       4 	.byte 3+F_AND   	
      00AFEA 41 4E 44                 5 	.ascii "AND"
      00AFEA CD 9B                    6 	.word TK_AND  
      00339A                       4701 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AFEC 25 A1                    1 	.word LINK 
                           00339C     2 	LINK=.
      00339C                          3 ALLOC:
      00AFEE 84                       4 	.byte 5   	
      00AFEF 27 03 CC 96 B5           5 	.ascii "ALLOC"
      00AFF4 90 F6                    6 	.word xalloc  
      0033A4                       4702 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AFF6 93 EE                    1 	.word LINK 
                           0033A6     2 	LINK=.
      0033A6                          3 ADCREAD:
      00AFF8 01                       4 	.byte 7+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AFF9 72 A9 00 03 9F A4 1F     5 	.ascii "ADCREAD"
      00B000 5F 97                    6 	.word analog_read  
      0033B0                       4703 	_dict_entry,5,ADCON,power_adc 
      00B002 A6 03                    1 	.word LINK 
                           0033B2     2 	LINK=.
      0033B2                          3 ADCON:
      00B004 42                       4 	.byte 5   	
      00B005 CF 00 0E 72 B9           5 	.ascii "ADCON"
      00B00A 00 0E                    6 	.word power_adc  
      0033BA                       4704 kword_dict::
      0033BA                       4705 	_dict_entry,3+F_IFUNC,ABS,abs
      00B00C 90 A3                    1 	.word LINK 
                           0033BC     2 	LINK=.
      0033BC                          3 ABS:
      00B00E 17                       4 	.byte 3+F_IFUNC   	
      00B00F 73 23 04                 5 	.ascii "ABS"
      00B012 90 AE                    6 	.word abs  
                                   4706 
                           000000  4707 INDIRECT=0 
                           000000  4708 .if INDIRECT 
                                   4709 ;comands and fonctions address table 	
                                   4710 code_addr::
                                   4711 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4712 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4713 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4714 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4715 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4716 	.word let,list,log2,lshift,next,new ; 40..47
                                   4717 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4718 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4719 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4720 	.word restore,return, random,rshift,run,free ; 72..79
                                   4721 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4722 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4723 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4724 	.word func_eefree,0 
                                   4725 .endif 
                                   4726 
                                   4727 
                                   4728 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
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
      00B014 17 73            [ 2]    1     sub sp,#VSIZE 
      00B016 81 27 10         [ 2]   32     ldw x,#LOOP_CNT
      00B017 1F 03            [ 2]   33     ldw (CNTR,sp),x  
      00B017 4D 26 16         [ 2]   34     ldw x,ticks 
      00B01A A3 00            [ 2]   35     ldw (T,sp),x
      0033CE                         36 1$: ; test add24 
      00B01C 14 22            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00B01E 11 A6 03         [ 2]   38     ldw x,#VAL1&0XFFFF
      00B021 42 CF 00         [ 1]   39     ld acc24,a 
      00B024 0E 93 72         [ 2]   40     ldw acc24+1,x  
      00B027 BB 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00B029 0E A3 17         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00B02C 73 24 01         [ 4]   43     call add24 
      00B02F 81 A6            [ 2]   44     ldw x,(CNTR,sp)
      00B031 0A CC 96         [ 2]   45     subw x,#1
      00B034 B7 03            [ 2]   46     ldw (CNTR,sp),x 
      00B035 26 E4            [ 1]   47     jrne 1$
      00B035 CD 99 E1         [ 4]   48     call prt_acc24
      00B038 A1 02            [ 1]   49     ld a,#SPACE 
      00B03A 27 03 CC         [ 4]   50     call putc 
      00B03D 96 B5 90         [ 2]   51     ldw x,ticks 
      00B040 F6 93 EE         [ 2]   52     subw x,(T,sp)
      00B043 01 72 A9         [ 4]   53     call prt_i16  
      00B046 00 03            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00B048 89 88 90         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00B04B F6 93 EE         [ 2]   58     ldw x,LOOP_CNT
      00B04E 01 72            [ 2]   59     ldw (CNTR,sp),x 
      00B050 A9 00 03         [ 2]   60     ldw x,ticks 
      00B053 CD B0            [ 2]   61     ldw (T,sp),x 
      00340A                         62 2$: 
      00B055 17 CF            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00B057 00 1A 84         [ 2]   64     ldw x,#VAL1&0XFFFF
      00B05A 85 72 C7         [ 1]   65     ld acc24,a 
      00B05D 00 1A 72         [ 2]   66     ldw acc24+1,x  
      00B060 5C 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00B062 1B 72 CF         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00B065 00 1A 81         [ 4]   69     call mul24 
      00B068 1E 03            [ 2]   70     ldw x,(CNTR,sp)
      00B068 CD 99 DC         [ 2]   71     subw x,#1
      00B06B A1 01            [ 2]   72     ldw (CNTR,sp),x 
      00B06D 27 03            [ 1]   73     jrne 2$ 
      00B06F CC 96 B5         [ 4]   74    call prt_acc24 
      00B072 90 F6            [ 1]   75    ld a,#SPACE 
      00B074 93 EE 01         [ 4]   76    call putc 
      00B077 72 A9 00         [ 2]   77     ldw x,ticks 
      00B07A 03 CD B0         [ 2]   78     subw x,(T,sp)
      00B07D 17 F6 EE         [ 4]   79     call prt_i16 
      00B080 01 81            [ 1]   80     ld a,#CR 
      00B082 CD 08 DA         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00B082 00 00 10         [ 2]   83     ldw x,LOOP_CNT
      00B084 1F 03            [ 2]   84     ldw (CNTR,sp),x 
      00B084 A3 58 4F         [ 2]   85     ldw x,ticks 
      00B087 52 00            [ 2]   86     ldw (T,sp),x 
      003446                         87 3$: 
      00B089 8A B0            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B08B 84 FF FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B08C C7 00 0C         [ 1]   90     ld acc24,a 
      00B08C 05 57 52         [ 2]   91     ldw acc24+1,x  
      00B08F 49 54            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B091 45 A8 EF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B094 B0 8C 66         [ 4]   94     call mul24 
      00B096 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00B096 05 57 4F         [ 2]   96     subw x,#1
      00B099 52 44            [ 2]   97     ldw (CNTR,sp),x 
      00B09B 53 AC            [ 1]   98     jrne 3$ 
      00B09D 67 B0 96         [ 4]   99     call prt_acc24    
      00B0A0 A6 20            [ 1]  100     ld a,#SPACE 
      00B0A0 04 57 41         [ 4]  101     call putc 
      00B0A3 49 54 A1         [ 2]  102     ldw x,ticks 
      00B0A6 3B B0 A0         [ 2]  103     subw x,(T,sp)
      00B0A9 CD 17 E1         [ 4]  104     call prt_i16 
      00B0A9 13 55            [ 1]  105     ld a,#CR 
      00B0AB 53 52 AA         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B0AE 0C B0 A9         [ 2]  108     ldw x,LOOP_CNT
      00B0B1 1F 03            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00B0B1 05 55 4E         [ 2]  110     ldw x,ticks 
      00B0B4 54 49            [ 2]  111     ldw (T,sp),x 
      003482                        112 4$:
      00B0B6 4C AD            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B0B8 9C B0 B1         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B0BB C7 00 0C         [ 1]  115     ld acc24,a 
      00B0BB 16 55 46         [ 2]  116     ldw acc24+1,x  
      00B0BE 4C 41            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B0C0 53 48 A9         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B0C3 EF B0 BB         [ 4]  119     call mul24 
      00B0C6 1E 03            [ 2]  120     ldw x,(CNTR,sp)
      00B0C6 16 55 42         [ 2]  121     subw x,#1
      00B0C9 4F 55            [ 2]  122     ldw (CNTR,sp),x 
      00B0CB 4E 44            [ 1]  123     jrne 4$ 
      00B0CD 9C F2 B0         [ 4]  124     call prt_acc24 
      00B0D0 C6 20            [ 1]  125     ld a,#SPACE 
      00B0D1 CD 08 DA         [ 4]  126     call putc 
      00B0D1 04 54 4F         [ 2]  127     ldw x,ticks 
      00B0D4 4E 45 A5         [ 2]  128     subw x,(T,sp)
      00B0D7 A5 B0 D1         [ 4]  129     call prt_i16 
      00B0DA A6 0D            [ 1]  130     ld a,#CR 
      00B0DA 02 54 4F         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B0DD A2 A5 B0         [ 2]  133     ldw x,LOOP_CNT
      00B0E0 DA 03            [ 2]  134     ldw (CNTR,sp),x 
      00B0E1 CE 00 0F         [ 2]  135     ldw x,ticks 
      00B0E1 05 54            [ 2]  136     ldw (T,sp),x 
      0034BE                        137 5$: 
      00B0E3 49 4D            [ 1]  138     ld a,#0xff
      00B0E5 45 52 AC         [ 2]  139     ldw x,#0xffff
      00B0E8 D1 B0 E1         [ 4]  140     call abs24 
      00B0EB C7 00 0C         [ 1]  141     ld acc24,a 
      00B0EB 17 54 49         [ 2]  142     ldw acc24+1,x
      00B0EE 4D 45            [ 2]  143     ldw x,(CNTR,sp)
      00B0F0 4F 55 54         [ 2]  144     subw x,#1
      00B0F3 AC E8            [ 2]  145     ldw (CNTR,sp),x 
      00B0F5 B0 EB            [ 1]  146     jrne 5$ 
      00B0F7 CD 17 F8         [ 4]  147     call prt_acc24 
      00B0F7 15 54            [ 1]  148     ld a,#SPACE 
      00B0F9 49 43 4B         [ 4]  149     call putc 
      00B0FC 53 AA B8         [ 2]  150     ldw x,ticks 
      00B0FF B0 F7 01         [ 2]  151     subw x,(T,sp)
      00B101 CD 17 E1         [ 4]  152     call prt_i16 
      0034E6                        153 6$:
      00B101 04 53            [ 1]  154     ld a,#CR 
      00B103 54 4F 50         [ 4]  155     call putc 
      00B106 A7 0E B1         [ 4]  156     call read_integer 
      00B109 01 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00B10A 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00B10A 04 53 54 45 50   [ 1]  159     mov farptr+2,acc8 
      00B10F A2 EB B1         [ 4]  160     call read_integer 
      00B112 0A 00 0C         [ 1]  161     ld a,acc24 
      00B113 CE 00 0D         [ 2]  162     ldw x,acc16 
      00B113 05 53 50 49 57   [ 1]  163     mov acc24,farptr 
      00B118 52 AF 63 B1 13   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00B11D 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00B11D 06 53 50         [ 4]  166     call div24 
      00B120 49               [ 1]  167     push a 
      00B121 53               [ 2]  168     pushw x 
      00B122 45 4C AF         [ 4]  169     call prt_acc24 
      00B125 8A B1            [ 1]  170     ld a,#SPACE 
      00B127 1D 08 DA         [ 4]  171     call putc 
      00B128 85               [ 2]  172     popw x
      00B128 15 53 50         [ 2]  173     ldw acc16,x  
      00B12B 49 52 44         [ 1]  174     pop acc24 
      00B12E AF 83 B1         [ 4]  175     call prt_acc24
      00B131 28 B8            [ 2]  176     jra 6$
      00B132                        177     _drop VSIZE 
      00B132 05 53            [ 2]    1     addw sp,#VSIZE 
      00B134 50               [ 4]  178     ret 
                                    179 
                                    180 
      003531                        181 read_integer:
      00B135 49 45            [ 1]  182     ld a,#'? 
      00B137 4E AE EB         [ 4]  183     call putc  
      00B13A B1 32 00 03      [ 1]  184 	clr count  
      00B13C CD 0A 3C         [ 4]  185 	call readln 
      00B13C 05 53 4C         [ 2]  186 	ldw x,#tib 
      00B13F 45 45 50         [ 1]  187 	push count
      00B142 AA 3B            [ 1]  188 	push #0 
      00B144 B1 3C 01         [ 2]  189 	addw x,(1,sp)
      00B146 5C               [ 1]  190 	incw x 
      003549                        191 	_drop 2 
      00B146 04 53            [ 2]    1     addw sp,#2 
      00B148 49 5A 45 9C      [ 1]  192 	clr in 
      00B14C C5 B1 46         [ 4]  193 	call get_token
      00B14F A1 84            [ 1]  194 	cp a,#TK_INTGR
      00B14F 04 53            [ 1]  195 	jreq 3$ 
      00B151 41 56            [ 1]  196 	cp a,#TK_MINUS
      00B153 45 A8 00         [ 4]  197 	call get_token 
      00B156 B1 4F            [ 1]  198 	cp a,#TK_INTGR 
      00B158 27 03            [ 1]  199 	jreq 2$
      00B158 03 52 55         [ 2]  200 	jp syntax_error
      003562                        201 2$:
      00B15B 4E A5 01         [ 4]  202 	call neg_acc24  	
      003565                        203 3$: 
      00B15E B1               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
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
      00B15F 58 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B160 00 00                   32 app_size: .word 0 
      003584                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0033BC R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0033B2 R
    ADCON_ID=  000002     |   4 ADCREAD    0033A6 R   |     ADCREAD_=  000004 
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
  4 ALLOC      00339C R   |   4 AND        003394 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        00338C R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   000149 R   |   4 AWU        003384 R
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
  4 BIT        00337C R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003373 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       00336A R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      003360 R
    BTEST_ID=  000010     |   4 BTOGL      003356 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        00334E R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002817 R
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
  4 CHAR       003345 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
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
    CODE_ADD=  000001     |     COMMA   =  00002C     |   4 CONST      00333B R
    CONST_ID=  0000B6     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        003333 R   |     CR1_IDX =  00001A     |   4 CR2        00332B R
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
  4 DATA       003322 R   |     DATA_IDX=  00001C     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        00331A R   |     DDR_IDX =  00001E     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        003312 R
    DEC_IDX =  000020     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   4 DIM        00330A R   |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         003303 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      0032F9 R
    DREAD_ID=  000024     |   4 DROP       0032F0 R   |   4 DWRITE     0032E5 R
    DWRITE_I=  000026     |   4 EDIT       0032DC R   |     EDIT_IDX=  000028 
  4 EEFREE     0032D1 R   |     EEFREE_I=  0000B8     |   4 EEPROM     0032C6 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_I=  00002A 
    EEPROM_S=  000800     |     EM      =  000019     |   4 END        0032BE R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      0032B4 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RD_O=  000011     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       0032AB R   |     FCPU_IDX=  000030 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001E5C R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        0032A3 R
    FOR_IDX =  000034     |   4 FREE       00329A R   |     FREE_IDX=  000088 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_AND   =  000080 
    F_CFUNC =  000020     |     F_CMD   =  000000     |     F_CONST =  000030 
    F_IFUNC =  000010     |     F_NOT   =  000070     |     F_OR    =  000090 
    F_XOR   =  0000A0     |   4 GET        003292 R   |     GET_IDX =  0000B4 
  4 GOSUB      003288 R   |     GOSUB_ID=  000036     |   4 GOTO       00327F R
    GOTO_IDX=  000038     |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        003277 R   |     HEX_IDX =  00003A     |     HOME    =  000082 
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
    I2C_OAR_=  000009     |     I2C_PECR=  00521E     |     I2C_READ=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1 =  005217     |     I2C_SR1_=  000003     |     I2C_SR1_=  000001 
    I2C_SR1_=  000002     |     I2C_SR1_=  000006     |     I2C_SR1_=  000000 
    I2C_SR1_=  000004     |     I2C_SR1_=  000007     |     I2C_SR2 =  005218 
    I2C_SR2_=  000002     |     I2C_SR2_=  000001     |     I2C_SR2_=  000000 
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   4 IDR        00326F R   |     IDR_IDX =  00003C 
  4 IF         003268 R   |     IF_IDX  =  00003E     |     IN      =  000005 
    INCR    =  000001     |     INDIRECT=  000000     |     INP     =  000000 
  4 INPUT      00325E R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
  4 IWDGEN     003253 R   |     IWDGEN_I=  000042     |   4 IWDGREF    003247 R
    IWDGREF_=  000044     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        00323F R
    KEY_END =  000083     |     KEY_IDX =  000046     |     KW_TYPE_=  0000F0 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        003237 R   |     LET_IDX =  000048     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |   4 LINK    =  0033BC R
  4 LIST       00322E R   |     LIST_IDX=  00004A     |     LL      =  000001 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  4 LOG2       003225 R   |     LOG_IDX =  00004C     |     LOOP_CNT=  002710 
  4 LSHIFT     00321A R   |     LSHIFT_I=  00004E     |     MAJOR   =  000002 
    MASK    =  000002     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000001     |     N1      =  000005     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NAME_MAX=  00000F 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        003212 R
    NEW_IDX =  000052     |   4 NEXT       003209 R   |     NEXT_IDX=  000050 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NLEN_MAS=  00000F     |     NOPT1   =  004802     |     NOPT2   =  004804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        003201 R   |     NOT_IDX =  0000F8     |     NOT_OP  =  000001 
  4 NOT_SAVE   001F32 R   |   4 NO_APP     002859 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        0031F9 R   |     ODR_IDX =  000054     |   4 ON         0031F2 R
    ONOFF   =  000003     |     ON_IDX  =  0000B2     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         0031EB R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        0031E3 R   |     PAD_IDX =  000056 
    PAD_SIZE=  000080     |   4 PAUSE      0031D9 R   |     PAUSE_ID=  000058 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       0031D0 R   |     PEEK_IDX=  00005C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   4 PICK       0031C7 R   |     PINNO   =  000001 
  4 PINP       0031BE R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      0031B4 R   |     PMODE_ID=  00005A     |   4 POKE       0031AB R
    POKE_IDX=  000060     |   4 POP        0031A3 R   |   4 PORTA      003186 R
  4 PORTB      00317C R   |   4 PORTC      003172 R   |   4 PORTD      003168 R
  4 PORTE      00315E R   |   4 PORTF      003154 R   |   4 PORTG      00314A R
  4 PORTI      003140 R   |   4 POUT       00319A R   |     POUT_IDX=  000062 
    PREV    =  000001     |   4 PRINT      003190 R   |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001E32 R   |   4 PROG_SIZ   001E44 R
    PRTA_IDX=  000066     |     PRTB_IDX=  000068     |     PRTC_IDX=  00006A 
    PRTD_IDX=  00006C     |     PRTE_IDX=  00006E     |     PRTF_IDX=  000070 
    PRTG_IDX=  000072     |     PRTI_IDX=  000074     |     PRT_IDX =  000064 
    PSIZE   =  00000B     |     PSTR    =  000003     |   4 PUSH       003137 R
  4 PUT        00312F R   |   4 QKEY       003126 R   |     QKEY_IDX=  000076 
    QSIGN   =  000005     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    001E6D R   |     RAM_SIZE=  001800     |     RBT_IDX =  00007A 
  4 READ       00311D R   |     READ_IDX=  000078     |   4 REBOOT     003112 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    RECLEN  =  000005     |     REC_LEN =  000003     |     REC_XTRA=  000005 
  4 REG_A      0004C7 R   |   4 REG_CC     0004CB R   |   4 REG_PC     0004BB R
  4 REG_SP     0004D0 R   |   4 REG_X      0004C3 R   |   4 REG_Y      0004BF R
    RELOP   =  000001     |   4 REM        00310A R   |     REM_IDX =  00007C 
  4 RESTORE    0030FE R   |     REST_IDX=  00007E     |     RETL1   =  000001 
  4 RETURN     0030F3 R   |     RET_ADDR=  000001     |     RET_BPTR=  000003 
    RET_IDX =  000080     |     RET_INW =  000005     |   4 RND        0030EB R
    RND_IDX =  000082     |     RONLY   =  000005     |     ROP     =  004800 
    RS      =  00001E     |   4 RSHIFT     0030E0 R   |     RSHIFT_I=  000084 
    RSIGN   =  000006     |     RST_SR  =  0050B3     |   4 RUN        0030D8 R
    RUN_IDX =  000086     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
    R_A     =  000001     |     R_CC    =  000009     |     R_PC    =  00000A 
    R_X     =  000002     |     R_Y     =  000004     |   4 SAVE       0030CF R
    SAVE_IDX=  000032     |     SAV_ACC1=  000006     |     SAV_ACC2=  000008 
    SAV_COUN=  00000A     |     SAV_IN  =  000009     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002815 R
  4 SIZE       0030C6 R   |     SIZE_IDX=  0000B0     |     SKIP    =  000005 
  4 SLEEP      0030BC R   |     SLEEP_ID=  00008A     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      0030B2 R
    SPIEN_ID=  00008E     |   4 SPIRD      0030A8 R   |     SPIRD_ID=  00008C 
  4 SPISEL     00309D R   |     SPISEL_I=  000090     |   4 SPIWR      003093 R
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
  4 STATES     00047E R   |   4 STEP       00308A R   |     STEP_IDX=  000094 
  4 STOP       003081 R   |     STOP_IDX=  000096     |     STR     =  000003 
  4 STR_BYTE   001E55 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
  4 SysCall    000012 R   |     T       =  000001     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      003077 R   |     TICKS_ID=  000098     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM3_CNT=  005328     |     TIM3_CNT=  005329     |     TIM3_CR1=  005320 
    TIM3_CR1=  000007     |     TIM3_CR1=  000000     |     TIM3_CR1=  000003 
    TIM3_CR1=  000001     |     TIM3_CR1=  000002     |     TIM3_EGR=  005324 
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    00306B R   |   4 TIMER      003061 R   |     TIMER_ID=  00009A 
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
    TMROUT_I=  00009C     |   4 TO         00305A R   |   4 TONE       003051 R
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
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     003046 R
    UBOUND_I=  0000A2     |   4 UBTN_Han   00005A R   |   4 UFLASH     00303B R
    UFLASH_I=  0000A4     |   4 UNTIL      003031 R   |     UNTIL_ID=  0000A6 
    US      =  00001F     |   4 USER_ABO   000062 R   |   4 USR        003029 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000A8     |   4 Uart1RxH   000868 R   |   4 UserButt   000036 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VAR_NAME=  000001 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       003020 R
    WAIT_IDX=  0000AA     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
    WLKPTR  =  000003     |   4 WORDS      003016 R   |     WORDS_ID=  0000AC 
  4 WRITE      00300C R   |     WRITE_ID=  0000AE     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        003004 R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  000014     |     XTEMP   =  000001     |     YSAVE   =  000004 
  4 abs        002A3F R   |   4 abs24      0001E0 R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000B96 R   |   4 add24      00016B R   |   4 add_char   001301 R
  4 add_spac   0010F9 R   |   4 analog_r   0025D0 R   |   4 and_cond   001B6C R
  4 and_fact   001B3C R   |   4 app        003584 R   |   4 app_sign   003580 R
  4 app_size   003582 R   |   4 app_spac   003580 GR  |   4 arduino_   002B2C R
  4 arg_list   001961 R   |   5 array_si   000020 R   |   4 ascii      0028EF R
  4 at_tst     000F6B R   |   4 atoi24     001883 GR  |   4 atoi_exi   0018F2 R
  4 awu        0029E6 R   |   4 awu02      0029F9 R   |   4 bad_port   00296A R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       002547 R
  4 beep_1kh   00251A GR  |   4 bin_exit   000DD2 R   |   4 bit_rese   00211A R
  4 bit_set    0020F8 R   |   4 bit_test   00215F R   |   4 bit_togg   00213D R
  4 bitmask    002CE3 R   |   4 bkslsh_t   000F18 R   |   4 bksp       000941 R
  2 block_bu   0016E0 GR  |   4 block_er   000752 R   |   4 break_po   0026BC R
  4 bye        0029B2 R   |   4 clear_ba   00146D R   |   4 clear_bl   00276C R
  4 clear_va   0013C5 R   |   4 clock_in   00007D R   |   4 cmd_cons   001D41 R
  4 cmd_dim    001D55 R   |   4 cmd_dim1   001D5F R   |   4 cmd_dim2   001D65 R
  4 cmd_end    0024E6 R   |   4 cmd_get    0024ED R   |   4 cmd_itf    0004EB R
  4 cmd_line   0016C4 R   |   4 cmd_name   001321 R   |   4 cmd_on     002394 R
  4 cmd_size   001C45 R   |   4 cold_sta   0000B5 R   |   4 colon_ts   000F3F R
  4 comma_ts   000F4A R   |   4 comp_msg   001614 R   |   4 compile    001065 GR
  4 conditio   001BBE R   |   4 const_cr   002D86 R   |   4 const_cr   002D8B R
  4 const_dd   002D81 R   |   4 const_ee   002D9A R   |   4 const_id   002D7C R
  4 const_in   002D95 R   |   4 const_od   002D77 R   |   4 const_ou   002D90 R
  4 const_po   002D4F R   |   4 const_po   002D54 R   |   4 const_po   002D59 R
  4 const_po   002D5E R   |   4 const_po   002D63 R   |   4 const_po   002D68 R
  4 const_po   002D6D R   |   4 const_po   002D72 R   |   4 convert_   000D42 R
  4 convert_   000905 R   |   4 copy_com   000FA0 R   |   5 count      000003 GR
  4 cp24       0001A5 R   |   4 cp24_ax    0001D7 R   |   4 cp_loop    001912 R
  4 cpl24      0001E7 R   |   4 cpy_cmd_   0010E1 R   |   4 cpy_quot   001121 R
  4 create_g   000C6C R   |   4 cs_high    002F1C R   |   4 dash_tst   000F60 R
  4 data       002D9F R   |   4 data_err   002E18 R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001C37 R
  4 decomp_l   0011B9 R   |   4 decompil   001171 GR  |   4 del_line   000C3F R
  4 delete_l   000A2E R   |   4 delete_n   000951 R   |   4 delete_u   0009F3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 digital_   00260C R   |   4 digital_   002643 R   |   4 div24      0002F4 R
  4 divu24_8   0002D6 R   |   4 do_loop    002D09 R   |   4 do_progr   000745 R
  4 dup24      00015C R   |   5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR
  4 edit       001F05 R   |   4 enable_i   002C73 R   |   4 eql_tst    000FEB R
  4 equal      001314 R   |   4 erase      0026E4 R   |   4 erase_ex   000776 R
  4 erase_fl   00076C R   |   4 err_bad_   001559 R   |   4 err_buf_   0015CF R
  4 err_cmd_   00151D R   |   4 err_div0   0014E2 R   |   4 err_dupl   001537 R
  4 err_math   0014C9 R   |   4 err_mem_   0014AE R   |   4 err_msg    00148A R
  4 err_no_a   001565 R   |   4 err_no_d   001598 R   |   4 err_no_f   0015BC R
  4 err_no_l   0014F1 R   |   4 err_no_p   0015A8 R   |   4 err_not_   001548 R
  4 err_over   0015DC R   |   4 err_read   0015E6 R   |   4 err_run_   001507 R
  4 err_synt   0014BB R   |   4 escaped    000D57 GR  |   4 expect     00194F R
  4 expressi   001AA5 R   |   4 factor     0019AD R   |   5 farptr     000018 R
  4 fcpu       002AAE R   |   4 fetchc     0005F2 R   |   4 fill_wri   00275C R
  4 final_te   000B8F R   |   4 first_li   001EAF R   |   5 flags      000022 GR
  4 for        0021F5 R   |   4 free       001C3C R   |   5 free_eep   000024 R
  7 free_ram   000090 R   |   4 func_arg   00195C R   |   4 func_cha   0028D8 R
  4 func_eef   001CD1 R   |   4 ge         001316 R   |   4 get_addr   0017C1 R
  4 get_arra   00197D R   |   4 get_char   0017DB R   |   4 get_esca   000911 R
  4 get_int2   0017CB R   |   4 get_targ   002322 R   |   4 get_targ   002330 R
  4 get_tick   002A38 R   |   4 get_toke   000EB1 GR  |   4 get_valu   001CC0 R
  4 getc       0008EA GR  |   4 gosub      002440 R   |   4 gosub_1    00244B R
  4 gosub_2    002451 R   |   4 goto       002426 R   |   4 goto_1     002430 R
  4 gpio       00293F R   |   4 gt         001312 R   |   4 gt_tst     000FF6 R
  4 hex_base   001C32 R   |   4 hex_dump   000632 R   |   4 if         0021D8 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   00084C R   |   4 input_ex   0020B0 R   |   4 input_lo   00201A R
  4 input_va   002016 R   |   4 insert_c   0009B0 R   |   4 insert_l   000C98 R
  4 insert_l   000D07 R   |   4 interp_l   001705 R   |   4 interpre   0016E0 R
  4 invalid    00055A R   |   4 invalid_   0005C8 R   |   4 is_alnum   000E05 GR
  4 is_alpha   000DEB GR  |   4 is_data_   002DA5 R   |   4 is_digit   000DFC GR
  4 is_symbo   000E0E R   |   4 itoa       00181E GR  |   4 itoa_loo   001840 R
  4 jp_to_ta   002433 R   |   4 key        00292E R   |   4 kword_di   0033BA GR
  4 kword_en   003002 R   |   4 le         00131B R   |   4 ledoff     0003BA R
  4 ledon      0003B5 R   |   4 ledtoggl   0003BF R   |   4 left_par   0003C8 R
  4 let        001C7D GR  |   4 let_arra   001C8B R   |   4 let_dvar   00173E R
  4 let_eval   001C93 R   |   4 let_var    001C90 R   |   4 lines_sk   001EB2 R
  4 list       001E7C R   |   4 list_exi   001EF4 R   |   4 list_loo   001ED2 R
  4 log2       002CB6 R   |   4 look_tar   002353 R   |   4 loop_bac   002305 R
  5 loop_dep   00001F R   |   4 loop_don   00231A R   |   4 lshift     002A56 R
  4 lt         001319 R   |   4 lt_tst     00101F R   |   4 mem_peek   000576 R
  4 mod24      00038E R   |   4 move       001381 GR  |   4 move_dow   0013A0 R
  4 move_era   0006D4 R   |   4 move_exi   0013C1 R   |   4 move_lef   000988 R
  4 move_loo   0013A5 R   |   4 move_prg   000714 R   |   4 move_rig   000996 R
  4 move_up    001392 R   |   4 mul24      000266 R   |   4 mul_char   001303 R
  4 mulu24_8   000227 R   |   4 nbr_tst    000EE4 R   |   4 ne         00131E R
  4 neg24      0001F0 R   |   4 neg_acc2   00020A R   |   4 neg_ax     000202 R
  4 new        0026DA R   |   4 next       0022AD R   |   4 next_lin   0016E8 R
  4 next_tok   001799 GR  |   4 no_match   001924 R   |   4 number     0005F8 R
  4 other      001048 R   |   4 overwrit   000BBB R   |   2 pad        0016E0 GR
  4 pad_ref    002F21 R   |   4 parse_ad   0004D5 R   |   4 parse_bi   000DB0 R
  4 parse_in   000D5F R   |   4 parse_ke   000E31 R   |   4 parse_qu   000D0A R
  4 parse_sy   000E19 R   |   4 pause      0029C6 R   |   4 pause02    0029D9 R
  4 peek       0021B7 R   |   4 peek_byt   000592 R   |   4 pin_mode   002ABD R
  4 plus_tst   000FBF R   |   4 poke       002196 R   |   4 power_ad   002580 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 prcnt_ts   000FE0 R   |   4 print      001F6D R   |   4 print_fa   0005D7 R
  4 print_he   000BF2 GR  |   4 print_re   000414 R   |   4 print_st   00056A R
  4 print_to   001806 R   |   4 prog_siz   001DEB R   |   4 program_   001DF3 R
  4 program_   0006EE R   |   4 program_   000714 R   |   4 prt_acc2   0017F8 R
  4 prt_basi   001F49 R   |   4 prt_i16    0017E1 R   |   4 prt_loop   001F71 R
  4 prt_peek   000397 GR  |   4 prt_reg1   0003F5 R   |   4 prt_reg8   0003D3 R
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       0008DA GR
  4 puts       000937 GR  |   4 qgetc      0008E3 GR  |   4 qkey       002932 GR
  4 qmark_ts   000F76 R   |   4 qsign      002755 R   |   4 random     002B4C R
  4 read       002E1D R   |   4 read01     002E22 R   |   4 read_int   003531 R
  4 readln     000A3C GR  |   4 readln_l   000A4B R   |   4 readln_q   000BD8 R
  4 refresh_   002CB1 R   |   4 relation   001ADD R   |   4 relop_st   001306 R
  4 remark     0020B5 GR  |   4 repl       000514 R   |   4 repl_exi   00053C R
  4 reset_co   001F6F R   |   4 rest_con   002006 R   |   4 restore    002DB3 R
  4 return     002464 R   |   4 right_al   00110F GR  |   4 row_alig   000831 R
  4 row_eras   0006A7 R   |   4 row_eras   0006D4 R   |   4 row_loop   000615 R
  4 rparnt_t   000F34 R   |   4 rshift     002A82 R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     001602 R   |   4 run        002481 R
  4 run_app    000127 R   |   4 run_it     0024B3 R   |   4 run_it_0   0024B5 R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_app   002780 R   |   4 save_con   001FF6 R   |   4 scan_blo   00085A R
  4 search_d   001904 GR  |   4 search_e   00194C R   |   4 search_l   000C14 GR
  4 search_l   000C23 R   |   4 search_n   001CFA R   |   4 search_n   001908 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002B1C R
  4 send_esc   00095F R   |   4 send_par   00096A R   |   4 set_data   002DE9 R
  4 set_time   002C51 R   |   4 sharp_ts   000F55 R   |   4 show_row   000603 R
  4 single_c   0012FC R   |   4 skip       000E9E R   |   4 skip_str   0017B2 R
  4 slash_ts   000FD5 R   |   4 sleep      0029BB R   |   4 software   0013D4 R
  4 spaces     0009A4 GR  |   4 spi_clea   002EB6 R   |   4 spi_disa   002E9E R
  4 spi_enab   002E6B R   |   4 spi_rcv_   002ED8 R   |   4 spi_read   002F03 R
  4 spi_sele   002F0A R   |   4 spi_send   002EC2 R   |   4 spi_writ   002EE3 R
  2 stack_fu   00179C GR  |   2 stack_un   001828 R   |   4 star_tst   000FCA R
  4 step       00226B R   |   4 stop       00268E R   |   4 store_lo   00229A R
  4 str_matc   001931 R   |   4 str_tst    000ED4 R   |   4 strcmp     001360 R
  4 strcpy     001371 GR  |   4 strlen     001355 GR  |   4 sub24      000188 R
  4 symb_loo   000E1A R   |   4 syntax_e   001635 GR  |   4 system_i   00141A R
  5 tab_widt   000023 GR  |   4 tb_error   001637 GR  |   4 term       001A62 R
  4 term01     001A6A R   |   4 term_exi   001AA2 R   |   4 test       0033C2 R
  4 test_p     000562 R   |   2 tib        001690 GR  |   4 tick_tst   000F8E R
  5 ticks      00000F R   |   4 timeout    002C68 R   |   5 timer      000012 GR
  4 timer2_i   000093 R   |   4 timer4_i   0000A0 R   |   4 tk_id      001625 R
  4 to         002225 R   |   4 to_eepro   00073D R   |   4 to_flash   000742 R
  4 to_hex_c   000C09 GR  |   4 to_upper   001877 GR  |   4 token_ch   00105E R
  4 token_ex   001062 R   |   4 tone       002525 R   |   4 try_next   002DF6 R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   0008EA GR
  4 uart1_in   000895 R   |   4 uart1_pu   0008DA GR  |   4 uart1_qg   0008E3 GR
  4 uart1_se   0008A5 R   |   4 ubound     001C72 R   |   4 uflash     00296F R
  4 unlock_e   000671 R   |   4 unlock_f   00068C R   |   4 until      002D1C R
  4 user_int   000049 R   |   4 usr        00298C R   |   4 var_name   001167 GR
  5 vars       000034 GR  |   4 wait       0020BB R   |   4 warm_ini   00144B R
  4 warm_sta   0016C1 R   |   4 words      002BE7 R   |   4 words_co   002C3B R
  4 write      00286F R   |   4 write_bl   0007F6 GR  |   4 write_bu   00072E R
  4 write_by   000778 R   |   4 write_ee   0007B4 R   |   4 write_ex   0007ED R
  4 write_fl   00079E R   |   4 write_nb   00081B R   |   4 xalloc     002F34 R
  4 xdrop      002F6A R   |   4 xpick      002FE8 R   |   4 xpop       002F2A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 xpush      002F26 R   |   4 xput       002FB5 R   |   4 xstack_b   002F97 R
  2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3584   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

