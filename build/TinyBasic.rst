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
      0080DF CC 97 94         [ 2]  169 5$:	jp warm_start
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
      008190 CD 9D A7         [ 4]  270 	call func_eefree 
      008193 CD 9D 48         [ 4]  271 	call ubound 
      008196 CD 95 1E         [ 4]  272 	call clear_basic
      008199 CD A6 4B         [ 4]  273 	call beep_1khz  
      00819C CD 94 CB         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for autorun application
      00819F CE 40 00         [ 2]  277 	ldw x,EEPROM_BASE 
      0081A2 C3 B2 60         [ 2]  278 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 94         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
      0081AA 4F               [ 1]  282 	clr a 
      0081AB CE 40 02         [ 2]  283 	ldw x,EEPROM_BASE+2
      0081AE CD A5 51         [ 4]  284 	call is_program_addr 
      0081B1 27 03            [ 1]  285 	jreq 1$
      0081B3 CC 97 94         [ 2]  286 	jp warm_start
      0081B6                        287 1$:	
                                    288 ; run application in FLASH|EEPROM 
      0081B6 90 CE 17 73      [ 2]  289 	ldw y,XSTACK_EMPTY
      0081BA CD 94 FC         [ 4]  290 	call warm_init
      0081BD CE 40 02         [ 2]  291 	ldw x,EEPROM_BASE+2 
      0081C0 CF 00 1C         [ 2]  292 	ldw txtbgn,x
      0081C3 1D 00 02         [ 2]  293 	subw x,#2 
      0081C6 FE               [ 2]  294 	ldw x,(x)
      0081C7 72 BB 00 1C      [ 2]  295 	addw x,txtbgn 
      0081CB CF 00 1E         [ 2]  296 	ldw txtend,x 
      0081CE AE 81 DC         [ 2]  297 	ldw x,#AUTO_RUN 
      0081D1 CD 89 DC         [ 4]  298 	call puts 
      0081D4 CD 9E C9         [ 4]  299 	call program_info 
      0081D7 CC A5 C1         [ 2]  300 	jp run_it_02  
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
      0082F0 97 0A 03         [ 4]  240     call neg24
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
      008368 0A 05            [ 1]  346     jrne 1$ 
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
      0083AC 0A 01            [ 1]  385     sbc a,(DIVISOR,sp)
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
      0083E2 CD 18 37         [ 4]   51 	call prt_i16  
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
      008417 CD 18 37         [ 4]  107 	call prt_i16  
      008417 0D 06 27         [ 4]  108 	call left_paren 
      00841A 03               [ 1]  109 	pop a 
      00841B CD               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00841C 82               [ 1]  111 	ld xl,a 
      00841D 95 5B 06 81      [ 1]  112 	mov base,#10 
      008421 CD 18 37         [ 4]  113 	call prt_i16  
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
      008431 B7 A6 3A         [ 4]  132 	call left_paren 
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
      008445 98 B7            [ 1]  155 	ld (R_A,sp),a 
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
      008474 B7 CD            [ 1]  183 	ld a, (R_CC,sp) 
      008476 84 5B 84         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      008479 5F 97 35         [ 2]  186 	ldw x,#REG_SP
      00847C 0A 00            [ 1]  187 	ldw y,sp 
      00847E 0B CD 98 B7      [ 2]  188 	addw y,#(VSIZE+3)
      008482 A6 29 CD         [ 4]  189 	call prt_reg16  
      008485 89 7F            [ 1]  190 	ld a,#'\n' 
      008487 81 08 FF         [ 4]  191 	call putc
      008488 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      008488 90 89            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      00848A CD 89 DC         [ 1]  194 	ld acc24,a 
      00848D 1E 01 35         [ 2]  195 	ldw acc16,x 
      008490 10 00            [ 1]  196 	ld a,(R_A,sp)
      008492 0B CD            [ 2]  197 	ldw x,(R_X,sp)
      008494 98 B7            [ 2]  198 	ldw y,(R_Y,sp)
      00048D                        199 	_drop VSIZE
      008496 CD 84            [ 2]    1     addw sp,#VSIZE 
      008498 5B               [ 1]  200 	pop cc   	
      008499 85               [ 4]  201 	ret
                                    202 
      00849A 35 0A 00 0B CD 98 B7   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
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
      00856A CD 8F 4F         [ 2]  313 1$:	ldw x,acc24 
      00856D 72 B9 00         [ 2]  314 	ldw farptr,x 
      008570 01 AE 16         [ 1]  315 	ld a,acc8 
      008573 E0 CD 94         [ 1]  316 	ld farptr+2,a 
      0005A5                        317 peek_byte:
      008576 22 AE 16         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008579 E0 CD            [ 1]  319 	ld a,#8 
      00857B 99 59            [ 1]  320 	ld (PSIZE,sp),a 
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
      0085BE 16 90 90         [ 4]  358 	call putc 
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
      0085C8 CD 99 4D         [ 4]  385 	call get_token
      0085CB A1 51            [ 1]  386 	cp a,#TK_INTGR
      0085CD 26 26            [ 1]  387 	jreq 1$
      0085CF CC 16 88         [ 2]  388 	jp syntax_error
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
      008639 90 CD 98 CE      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
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
      008678 10 CD 98 CE      [ 1]   87 	ldf ([farptr],y),a
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
      00868B CD 8F 62         [ 2]  102 	ldw acc16,x 
      00868E A1 84 27         [ 2]  103 	ldw x,#tib 
      008691 03 CC 97 08      [ 2]  104 	ldw y,#row_erase 
      008695 81 13 B2         [ 4]  105 	call move
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
      0086A2 B7 A6            [ 1]  130 	clrw y 
      0086A4 20               [ 1]  131 1$:	ld a,(x)
      0086A5 CD 89 7F 18      [ 1]  132 	ldf ([farptr],y),a
      0086A8 5C               [ 1]  133 	incw x 
      0086A8 1E 02            [ 1]  134 	incw y 
      0086AA F6 5F            [ 1]  135 	dec (BCNT,sp)
      0086AC 97 CD            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0086AE 98 B7 1E 02 5C   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
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
      0086C5 AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
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
      008704 CD 16 90         [ 4]  206 	call tib 
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
      008774 16 90 90 AE 87   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      000800                        285 write_exit:
      008779 3A               [ 1]  286 	incw x 
      00877A CD 94 32         [ 4]  287 	call incr_farptr
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
      0087B5 90 90            [ 2]  363 	popw y 
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
      0087BA CD 94 32         [ 1]  375 	and a,farptr+2 
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
      0087D9 CD 16 90         [ 2]  413 	cpw x,#BLOCK_SIZE 
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
      0087F8 90 72 17         [ 4]   79 	call clear_autorun
      0087FB 50 5F 20         [ 2]   80 	jp cold_start 
      00089F                         81 4$:
      0087FE 0A               [ 1]   82 	push a 
      0087FF A6 26            [ 1]   83 	ld a,#rx1_queue 
      0087FF CD 87 1F         [ 1]   84 	add a,rx1_tail 
      008802 CD               [ 1]   85 	clrw x 
      008803 16               [ 1]   86 	ld xl,a 
      008804 90               [ 1]   87 	pop a 
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
      00891F CD 13 B2         [ 4]  429     call move
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
      008936 CD A9 4C         [ 4]  440     call puts 
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
      008952 CD 13 B2         [ 4]  470 	call move 
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
      008A0C 89 7F 81 90      [ 2]  622 	ldw y,#tib 
      008A0F CD 11 A2         [ 4]  623 	call decompile 
      008A0F 89 5F            [ 1]  624 	clr (LL_HB,sp)
      008A11 97 A6            [ 1]  625 	ld a,#CR 
      008A13 0A 62 95         [ 4]  626 	call putc 
      008A16 9F 4D            [ 1]  627 	ld a,#'>
      008A18 27 0B A1         [ 4]  628 	call putc
      008A1B 09 23 02         [ 2]  629     ldw x,#tib  
      008A1E A6 09 86         [ 4]  630 	call strlen 
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
      008A6E 94 32            [ 1]  679 	ld a,(LL,sp)
      008A70 90 AE            [ 1]  680 	sub a,(CPOS,sp)
      008A72 16 90 7B         [ 4]  681 	call move_right 
      008A75 01 C7            [ 1]  682 	ld a,(LL,sp)
      008A77 00 0F            [ 1]  683 	ld (CPOS,sp),a
      008A79 72 B9 00 0E      [ 2]  684     ldw y,#tib
      008A7D 7B 02 90 F7      [ 1]  685     clr acc16 
      008A81 90 5C 7B         [ 1]  686     ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008A84 01 CD 8A 2D      [ 2]  687     addw y,acc16  
      008A88 AE 16 90         [ 2]  688 	jp readln_loop 
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
      008AB0 32 90            [ 1]  713 	ld a,#TIB_SIZE-1
      008AB2 AE 16            [ 1]  714 	cp a, (LL,sp)
      008AB4 90 7B            [ 1]  715 	jrpl 1$
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
      008AED AE 16 90 90      [ 2]  748 	ldw y,#tib
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
      008B37 90 90            [ 1]   61 	cpw x,(y)
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
      008B4B 90 93            [ 2]    1     sub sp,#VSIZE 
      008B4D CD 94            [ 1]   85 	ld a,(2,x) ; line length
      008B4F 06 4D            [ 1]   86 	ld (LLEN+1,sp),a 
      008B51 27 9D            [ 1]   87 	clr (LLEN,sp)
      008B53 6B 02            [ 1]   88 	ldw y,x  
      008B55 6B 03 93         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B58 CD 89            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B5A DC 0F 01 72      [ 2]   91 	ldw y,txtend 
      008B5E F9 01 20         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B61 8E CF 00 0D      [ 2]   93 	ldw acc16,y 
      008B62 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B62 A1 05 26         [ 4]   95 	call move
      008B65 4D AE 16 90      [ 2]   96 	ldw y,txtend 
      008B69 17 05 16         [ 2]   97 	subw y,(LLEN,sp)
      008B6C 07 CD 99 59      [ 2]   98 	ldw txtend,y  
      000C9A                         99 	_drop VSIZE     
      008B70 16 05            [ 2]    1     addw sp,#VSIZE 
      008B72 4F               [ 4]  100 	ret 
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
      008B73 CD 8C            [ 2]    1     sub sp,#VSIZE 
      008B75 C5 5D            [ 2]  117 	ldw (SRC,sp),x 
      008B77 26 0B            [ 2]  118 	ldw (LEN,sp),y 
      008B79 0F 02 90 AE      [ 2]  119 	ldw acc16,y 
      008B7D 16 90            [ 1]  120 	ldw y,x ; SRC
      008B7F 90 7F CC 8C      [ 2]  121 	addw x,acc16  
      008B83 89 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B84 CE 00 1D         [ 2]  124 	ldw x,txtend 
      008B84 CF 00 05         [ 2]  125 	subw x,(SRC,sp)
      008B87 E6 02 C7         [ 2]  126 	ldw acc16,x ; size to move
      008B8A 00 03            [ 2]  127 	ldw x,(DEST,sp) 
      008B8C 90 AE 16         [ 4]  128 	call move
      008B8F 90 CD 92         [ 2]  129 	ldw x,txtend
      008B92 22 0F 01         [ 2]  130 	addw x,(LEN,sp)
      008B95 A6 0D CD         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      000CC6                        132 9$:	_drop VSIZE 
      008B98 89 7F            [ 2]    1     addw sp,#VSIZE 
      008B9A A6               [ 4]  133 	ret 
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
      008B9B 3E CD            [ 2]    1     sub sp,#VSIZE 
      008B9D 89 7F AE         [ 2]  152 	ldw x,txtend  
      008BA0 16 90 CD         [ 2]  153 	cpw x,txtbgn 
      008BA3 94 06            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BA5 6B 02 CD         [ 2]  156 	ldw x,#2 
      008BA8 89 DC 90 93      [ 4]  157 	ld a,([ptr16],x)
      008BAC 7B 02            [ 1]  158 	cp a,#3
      008BAE 6B 03            [ 1]  159 	jreq insert_ln_exit
      008BB0 CC               [ 1]  160 	clrw x 
      008BB1 8A               [ 1]  161 	ld xl,a
      008BB2 F0 07            [ 2]  162 	ldw (LLEN,sp),x 
      008BB3 CE 00 1B         [ 2]  163 	ldw x,txtbgn
      008BB3 A1 81            [ 2]  164 	ldw (DEST,sp),x 
      008BB5 26 15 7B         [ 2]  165 	ldw x,txtend 
      008BB8 03 11            [ 2]  166 	jra 4$
      008BBA 02 2B 03 CC      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BBE 8A F0            [ 2]  169 	ldw (LINENO,sp),x 
      008BC0 AE 00 02         [ 2]  170 	ldw x,#2 
      008BC0 A6 01 CD 8A      [ 4]  171 	ld a,([ptr16],x)
      008BC4 3B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BC5 0C 03            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BC7 90 5C            [ 2]  176 	ldw x,(LINENO,sp)
      008BC9 CC               [ 1]  177 	clr a 
      008BCA 8A F0 A1         [ 4]  178 	call search_lineno 
      008BCD 80               [ 2]  179 	tnzw x 
      008BCE 26 13            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BD0 0D 03            [ 2]  183 	ldw (DEST,sp),y 
      008BD2 26 03            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BD4 CC 8A            [ 2]  187 2$: ldw (DEST,sp),x 
      008BD6 F0 0C 70         [ 4]  188 	call del_line
      008BD7                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BD7 A6 01            [ 1]  192 	ld a,#3
      008BD9 CD 8A            [ 1]  193 	cp a,(LLEN+1,sp)
      008BDB 2D 0A            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BDD 03 90            [ 2]  197 	ldw x,(DEST,sp)
      008BDF 5A CC 8A         [ 2]  198 	cpw x,txtend 
      008BE2 F0 A1            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BE4 82 26            [ 2]  202 	ldw x,(DEST,sp)
      008BE6 0E 7B            [ 2]  203 	ldw y,(LLEN,sp)
      008BE8 03 CD 8A         [ 4]  204 	call create_gap
      008BEB 2D 0F            [ 2]  205 	jra 5$
      000D24                        206 4$: 
      008BED 03 90 AE         [ 2]  207 	addw x,(LLEN,sp)
      008BF0 16 90 CC         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008BF3 8A F0            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008BF5 A1 83 26         [ 2]  211 	ldw acc16,x 
      008BF8 26 7B 03 11      [ 2]  212 	ldw y,#pad ;SRC 
      008BFC 02 26            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008BFE 03 CC 8A         [ 4]  214 	call move 
      000D38                        215 insert_ln_exit:	
      000D38                        216 	_drop VSIZE
      008C01 F0 08            [ 2]    1     addw sp,#VSIZE 
      008C02 81               [ 4]  217 	ret
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
      008C02 7B 02            [ 2]    1     sub sp,#VSIZE 
      008C04 10               [ 1]  235 	clr a
      008C05 03 CD            [ 1]  236 1$:	ld (PREV,sp),a 
      000D40                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      008C07 8A 3B 7B         [ 4]  238 	ld a,([in.w],y)
      008C0A 02 6B            [ 1]  239 	jreq 6$
      008C0C 03 90 AE 16      [ 1]  240 	inc in 
      008C10 90 72            [ 1]  241 	ld (CURR,sp),a 
      008C12 5F 00            [ 1]  242 	ld a,#'\
      008C14 0E C7            [ 1]  243 	cp a, (PREV,sp)
      008C16 00 0F            [ 1]  244 	jrne 3$
      008C18 72 B9            [ 1]  245 	clr (PREV,sp)
      008C1A 00 0E            [ 1]  246 	ld a,(CURR,sp)
      008C1C CC 8A            [ 4]  247 	callr convert_escape
      008C1E F0               [ 1]  248 	ld (x),a 
      008C1F A1               [ 1]  249 	incw x 
      008C20 0F 26            [ 2]  250 	jra 2$
      000D5B                        251 3$:
      008C22 08 03            [ 1]  252 	ld a,(CURR,sp)
      008C24 04 CD            [ 1]  253 	cp a,#'\'
      008C26 A6 4B            [ 1]  254 	jreq 1$
      008C28 CC 8A            [ 1]  255 	cp a,#'"
      008C2A F0 A1            [ 1]  256 	jreq 6$ 
      008C2C 84               [ 1]  257 	ld (x),a 
      008C2D 26               [ 1]  258 	incw x 
      008C2E 11 7B            [ 2]  259 	jra 2$
      000D69                        260 6$:
      008C30 03               [ 1]  261 	clr (x)
      008C31 11               [ 1]  262 	incw x 
      008C32 02 2A            [ 1]  263 	ldw y,x 
      008C34 08               [ 1]  264 	clrw x 
      008C35 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D70                        266 	_drop VSIZE
      008C35 97 7B            [ 2]    1     addw sp,#VSIZE 
      008C37 02               [ 4]  267 	ret 
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
      008C38 CD               [ 2]  279 	pushw x 
      008C39 8A 98 0A         [ 2]  280 	ldw x,#escaped 
      008C3C 02               [ 1]  281 1$:	cp a,(x)
      008C3D 27 06            [ 1]  282 	jreq 2$
      008C3D CC               [ 1]  283 	tnz (x)
      008C3E 8A F0            [ 1]  284 	jreq 3$
      008C40 5C               [ 1]  285 	incw x 
      008C40 A1 20            [ 2]  286 	jra 1$
      008C42 2A 03 CC         [ 2]  287 2$: subw x,#escaped 
      008C45 8A               [ 1]  288 	ld a,xl 
      008C46 F0 07            [ 1]  289 	add a,#7
      008C47 85               [ 2]  290 3$:	popw x 
      008C47 A6               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    292 
      008C48 4F 11 02 2A 03 CC 8A   293 escaped:: .asciz "abtnvfr"
             F0
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
      000D90                        310 parse_integer: ; { -- n }
      008C50 0D               [ 2]  311 	pushw x 	
      008C51 04 26            [ 1]  312 	push #0 ; TCHAR
      008C53 18 7B            [ 1]  313 	push #10 ; BASE=10
      008C55 03 11            [ 1]  314 	cp a,#'$
      008C57 02 27            [ 1]  315 	jrne 2$ 
      000D99                        316     _drop #1
      008C59 12 7B            [ 2]    1     addw sp,##1 
      008C5B 02 97            [ 1]  317 	push #16  ; BASE=16
      008C5D 7B               [ 1]  318 2$:	ld (x),a 
      008C5E 03               [ 1]  319 	incw x 
      008C5F 95 7B 01         [ 4]  320 	ld a,([in.w],y)
      008C62 CD 8A 55 0C      [ 1]  321 	inc in 
      008C66 02 0C 03         [ 4]  322 	call to_upper 
      008C69 CC 8A            [ 1]  323 	ld (TCHAR,sp),a 
      008C6B F0 0E 2D         [ 4]  324 	call is_digit 
      008C6C 25 ED            [ 1]  325 	jrc 2$
      008C6C 7B 01            [ 1]  326 	ld a,#16 
      008C6E 90 F7            [ 1]  327 	cp a,(BASE,sp)
      008C70 90 5C            [ 1]  328 	jrne 3$ 
      008C72 CD 89            [ 1]  329 	ld a,(TCHAR,sp)
      008C74 7F 7B            [ 1]  330 	cp a,#'A 
      008C76 03 11            [ 1]  331 	jrmi 3$ 
      008C78 02 2B            [ 1]  332 	cp a,#'G 
      008C7A 09 90            [ 1]  333 	jrmi 2$ 
      008C7C 7F 0C 02 0C      [ 1]  334 3$: dec in 	
      008C80 03               [ 1]  335     clr (x)
      008C81 CC 8A            [ 2]  336 	ldw x,(XSAVE,sp)
      008C83 F0 18 D9         [ 4]  337 	call atoi24
      008C84 16 03            [ 2]  338 	ldw y,(XSAVE,sp)
      008C84 0C 03 CC         [ 1]  339 	ld a,acc24 
      008C87 8A F0            [ 1]  340 	ld (y),a 
      008C89 90 5C            [ 1]  341 	incw y  
      008C89 90 AE 16         [ 2]  342 	ldw x,acc16 
      008C8C 90 0F            [ 2]  343 	ldw (y),x 
      008C8E 01 72 F9 01      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      008C92 90 7F            [ 1]  345 	ld a,#TK_INTGR
      000DDE                        346 	_drop VSIZE  
      008C94 7B 02            [ 2]    1     addw sp,#VSIZE 
      008C96 C7               [ 4]  347 	ret 	
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
      008C97 00 03            [ 1]  365 	push #0
      008C99 A6 0D            [ 1]  366 	push #0
      008C9B CD 89            [ 1]  367 	push #0
      000DE7                        368 2$:	
      008C9D 7F 5B 06         [ 4]  369 	ld a,([in.w],y)
      008CA0 90 85 81 01      [ 1]  370 	inc in 
      008CA3 A1 30            [ 1]  371 	cp a,#'0 
      008CA3 88 4E            [ 1]  372 	jreq 3$
      008CA5 CD 8C            [ 1]  373 	cp a,#'1 
      008CA7 BA CD            [ 1]  374 	jreq 3$ 
      008CA9 89 7F            [ 2]  375 	jra bin_exit 
      008CAB 7B 01            [ 1]  376 3$: sub a,#'0 
      008CAD CD               [ 1]  377 	rrc a
      008CAE 8C BA            [ 1]  378 	rlc (BINARY+2,sp) 
      008CB0 CD 89            [ 1]  379 	rlc (BINARY+1,sp)
      008CB2 7F A6            [ 1]  380 	rlc (BINARY,sp) 
      008CB4 20 CD            [ 2]  381 	jra 2$  
      000E03                        382 bin_exit:
      008CB6 89 7F 84 81      [ 1]  383 	dec in 
      008CBA 90 93            [ 1]  384 	ldw y,x
      008CBA A4 0F            [ 1]  385 	ld a,(BINARY,sp)
      008CBC A1 09            [ 1]  386 	ld (y),a 
      008CBE 23 02            [ 1]  387 	incw y 
      008CC0 AB 07            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CC2 AB 30            [ 2]  389 	ldw (y),x 
      008CC4 81 A9 00 02      [ 2]  390 	addw y,#2  
      008CC5 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000E19                        392 	_drop VSIZE 
      008CC5 52 02            [ 2]    1     addw sp,#VSIZE 
      008CC7 0F               [ 4]  393 	ret
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
      000E1C                        402 is_alpha::
      008CC8 01 90            [ 1]  403 	cp a,#'A 
      008CCA CE               [ 1]  404 	ccf 
      008CCB 00 1C            [ 1]  405 	jrnc 9$ 
      008CCD 4D 27            [ 1]  406 	cp a,#'Z+1 
      008CCF 04 90            [ 1]  407 	jrc 9$ 
      008CD1 CE 00            [ 1]  408 	cp a,#'a 
      008CD3 05               [ 1]  409 	ccf 
      008CD4 24 02            [ 1]  410 	jrnc 9$
      008CD4 90 C3            [ 1]  411 	cp a,#'z+1
      008CD6 00               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E2D                        421 is_digit::
      008CD7 1E 2A            [ 1]  422 	cp a,#'0
      008CD9 10 90            [ 1]  423 	jrc 1$
      008CDB F3 27            [ 1]  424     cp a,#'9+1
      008CDD 0E               [ 1]  425 	ccf 
      008CDE 2B               [ 1]  426 1$:	ccf 
      008CDF 0A               [ 4]  427     ret
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
      008CE0 90 E6 02         [ 4]  439 	call is_digit
      008CE3 6B 02            [ 1]  440 	jrc 1$ 
      008CE5 72 F9 01         [ 4]  441 	call is_alpha
      008CE8 20               [ 4]  442 1$:	ret 
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



      000E3F                        453 is_symbol_char: 
      008CE9 EA 5F            [ 1]  454 	cp a,#'_ 
      008CEA 26 03            [ 1]  455 	jrne 1$
      008CEA 5F               [ 1]  456 	scf 
      008CEB 51 5B            [ 2]  457 	jra 9$ 
      008CED 02 51 81         [ 4]  458 1$:	call is_alnum 
      008CF0 81               [ 4]  459 9$: ret 
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
      000E4A                        473 parse_symbol:
      008CF0 52               [ 1]  474 	incw x ; keep space for TK_ID 
      000E4B                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008CF1 04 E6 02         [ 4]  477 	call to_upper  
      008CF4 6B               [ 1]  478 	ld (x), a 
      008CF5 02               [ 1]  479 	incw x
      008CF6 0F 01 90         [ 4]  480 	ld a,([in.w],y)
      008CF9 93 72 F9 01      [ 1]  481 	inc in 
      008CFD 17 03 90         [ 4]  482 	call is_symbol_char 
      008D00 CE 00            [ 1]  483 	jrc symb_loop 
      008D02 1E               [ 1]  484 	clr (x)
      008D03 72 F2 03 90      [ 1]  485 	dec in  
      008D07 CF               [ 4]  486 	ret 
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
      008D08 00               [ 2]  503 	pushw x ; preserve *symbol 
      008D09 0E 16 03         [ 4]  504 	call parse_symbol
      008D0C CD 94            [ 2]  505 	ldw x,(XFIRST,sp) 
      008D0E 32 90            [ 1]  506 	ld a,(2,x)
      008D10 CE 00            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008D12 1E 72            [ 1]  509 	ld a,(1,x) 
      008D14 F2 01            [ 1]  510 	sub a,#'A 
      008D16 90 CF 00         [ 2]  511 	ldw x,#3 
      008D19 1E               [ 4]  512 	mul x,a 
      008D1A 5B 04 81         [ 2]  513 	addw x,#vars 
      008D1D A6 85            [ 1]  514 	ld a,#TK_VAR 
      008D1D 52 06            [ 2]  515 	jra 4$ 
      000E7B                        516 2$: ; check for keyword, otherwise syntax error.
      000E7B                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D1F 1F 03 17         [ 2]    1     ldw x,#kword_dict+2
      008D22 05 90            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D24 CF 00            [ 1]  519 	incw y 
      008D26 0E 90 93         [ 4]  520 	call search_dict
      008D29 72               [ 1]  521 	tnz a
      008D2A BB 00            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D2C 0E 1F            [ 2]  525 	ldw y,(XFIRST,sp)
      008D2E 01 CE            [ 1]  526 	ld a,#TK_LABEL 
      008D30 00 1E            [ 1]  527 	ld (y),a 
      008D32 72 F0            [ 1]  528 	incw y
      008D34 03               [ 1]  529 	ldw x,y 
      008D35 CF 00 0E         [ 4]  530 	call strlen
      008D38 1E 01            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008D3A CD 94            [ 2]  532 	jrule 22$ 
      008D3C 32 CE            [ 1]  533 	ld a,#NAME_MAX_LEN 
      000E9A                        534 22$:	
      008D3E 00               [ 1]  535 	push a 
      000E9B                        536 24$:
      008D3F 1E 72            [ 1]  537     ld a,(y)
      008D41 FB 05            [ 1]  538 	jreq 3$
      008D43 CF 00            [ 1]  539 	incw y
      008D45 1E 5B            [ 1]  540 	dec (1,sp) 
      008D47 06 81            [ 1]  541 	jrne 24$
      008D49 4F               [ 1]  542 	clr a 
      008D49 52 08            [ 1]  543 	ld (y),a 
      008D4B CE 00            [ 1]  544 3$: incw y 
      000EAA                        545 	_drop 1 
      008D4D 1E C3            [ 2]    1     addw sp,#1 
      008D4F 00 1C            [ 1]  546 	ld a,#TK_LABEL 
      008D51 26               [ 1]  547 	clrw x 
      008D52 19 AE            [ 2]  548 	jra 5$ 
      000EB1                        549 4$:	
      008D54 00 02            [ 2]  550 	ldw y,(XFIRST,sp)
      008D56 72 D6            [ 1]  551 	cp a,#TK_NOT 
      008D58 00 1A            [ 1]  552 	jrmi 41$
      008D5A A1 03            [ 1]  553 	ld (y),a 
      008D5C 27 5A            [ 1]  554 	incw y 
      008D5E 5F 97            [ 2]  555 	jra 5$ 
      000EBD                        556 41$:	
      008D60 1F 07 CE         [ 2]  557 	cpw x,#let  
      008D63 00 1C            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D65 1F 01            [ 1]  559 	ld (y),a 
      008D67 CE 00            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008D69 1E 20            [ 2]  561 	ldw (y),x
      008D6B 38 72 CE 00      [ 2]  562 	addw y,#2  
      000ECC                        563 5$:	_drop VSIZE 
      008D6F 1A 1F            [ 2]    1     addw sp,#VSIZE 
      008D71 05               [ 4]  564 	ret  	
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
      008D72 AE               [ 1]  576 	push a
      008D73 00 02 72         [ 4]  577 1$:	ld a,([in.w],y)
      008D76 D6 00            [ 1]  578 	jreq 2$
      008D78 1A 97            [ 1]  579 	cp a,(C,sp)
      008D7A 1F 07            [ 1]  580 	jrne 2$
      008D7C 1E 05 4F CD      [ 1]  581 	inc in
      008D80 8C C5            [ 2]  582 	jra 1$
      000EDF                        583 2$: _drop 1 
      008D82 5D 26            [ 2]    1     addw sp,#1 
      008D84 04               [ 4]  584 	ret
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
      008D85 17 01            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000EE4                        616 0$: 
      008D87 20 05 1F 01      [ 2]  617 	ldw y,#tib    	
      008D8B CD 8C            [ 1]  618 	ld a,#SPACE
      008D8D F0 0E CF         [ 4]  619 	call skip
      008D8E 55 00 01 00 03   [ 1]  620 	mov in.saved,in 
      008D8E A6 03 11         [ 4]  621 	ld a,([in.w],y)
      008D91 08 27            [ 1]  622 	jrne 1$
      008D93 24 1E            [ 1]  623 	ldw y,x 
      008D95 01 C3 00         [ 2]  624 	jp token_exit ; end of line 
      008D98 1E 27 09 1E      [ 1]  625 1$:	inc in 
      008D9C 01 16 07         [ 4]  626 	call to_upper 
      008D9F CD 8D            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F05                        629 str_tst:  	
      000F05                        630 	_case '"' nbr_tst
      008DA1 1D 20            [ 1]    1 	ld a,#'"' 
      008DA3 06 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA4 26 0A            [ 1]    3 	jrne nbr_tst
      008DA4 72 FB            [ 1]  631 	ld a,#TK_QSTR
      008DA6 07               [ 1]  632 	ld (x),a 
      008DA7 CF               [ 1]  633 	incw x 
      008DA8 00 1E 1E         [ 4]  634 	call parse_quote
      008DAB 07 CF 00         [ 2]  635 	jp token_exit
      000F15                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008DAE 0E 90            [ 1]  638 	ld a,#'$'
      008DB0 AE 16            [ 1]  639 	cp a,(TCHAR,sp) 
      008DB2 E0 1E            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DB4 01 CD            [ 1]  642 	ld a,#'&
      008DB6 94 32            [ 1]  643 	cp a,(TCHAR,sp)
      008DB8 26 0A            [ 1]  644 	jrne 0$
      008DB8 5B 08            [ 1]  645 	ld a,#TK_INTGR
      008DBA 81               [ 1]  646 	ld (x),a 
      008DBB 5C               [ 1]  647 	incw x 
      008DBB 52 02 4F         [ 4]  648 	call parse_binary ; expect binary integer 
      008DBE 6B 01 93         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DC0 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DC0 91 D6 01         [ 4]  652 	call is_digit
      008DC3 27 24            [ 1]  653 	jrnc 3$
      008DC5 72 5C            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DC7 00               [ 1]  655 	ld (x),a 
      008DC8 02               [ 1]  656 	incw x 
      008DC9 6B 02            [ 1]  657 	ld a,(TCHAR,sp)
      008DCB A6 5C 11         [ 4]  658 	call parse_integer 
      008DCE 01 26 0A         [ 2]  659 	jp token_exit 
      000F3E                        660 3$: 
      000F3E                        661 	_case '(' bkslsh_tst 
      008DD1 0F 01            [ 1]    1 	ld a,#'(' 
      008DD3 7B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD5 AD 1C            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      008DD7 F7 5C            [ 1]  662 	ld a,#TK_LPAREN
      008DD9 20 E5 8F         [ 2]  663 	jp token_char   	
      008DDB                        664 bkslsh_tst: ; character token 
      000F49                        665 	_case '\',rparnt_tst
      008DDB 7B 02            [ 1]    1 	ld a,#'\' 
      008DDD A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDF 27 DD            [ 1]    3 	jrne rparnt_tst
      008DE1 A1 22            [ 1]  666 	ld a,#TK_CHAR 
      008DE3 27               [ 1]  667 	ld (x),a 
      008DE4 04               [ 1]  668 	incw x 
      008DE5 F7 5C 20         [ 4]  669 	ld a,([in.w],y)
      008DE8 D7               [ 1]  670 	ld (x),a 
      008DE9 5C               [ 1]  671 	incw x
      008DE9 7F 5C            [ 1]  672 	ldw y,x 	 
      008DEB 90 93 5F A6      [ 1]  673 	inc in  
      008DEF 02               [ 1]  674 	clrw x 
      008DF0 5B               [ 1]  675 	ld xl,a 
      008DF1 02 81            [ 1]  676 	ld a,#TK_CHAR 
      008DF3 CC 10 93         [ 2]  677 	jp token_exit 
      000F65                        678 rparnt_tst:		
      000F65                        679 	_case ')' colon_tst 
      008DF3 89 AE            [ 1]    1 	ld a,#')' 
      008DF5 8E 08            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF7 F1 27            [ 1]    3 	jrne colon_tst
      008DF9 06 7D            [ 1]  680 	ld a,#TK_RPAREN 
      008DFB 27 09 5C         [ 2]  681 	jp token_char
      000F70                        682 colon_tst:
      000F70                        683 	_case ':' comma_tst 
      008DFE 20 F7            [ 1]    1 	ld a,#':' 
      008E00 1D 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008E02 08 9F            [ 1]    3 	jrne comma_tst
      008E04 AB 07            [ 1]  684 	ld a,#TK_COLON 
      008E06 85 81 61         [ 2]  685 	jp token_char  
      000F7B                        686 comma_tst:
      000F7B                        687 	_case COMMA sharp_tst 
      008E09 62 74            [ 1]    1 	ld a,#COMMA 
      008E0B 6E 76            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0D 66 72            [ 1]    3 	jrne sharp_tst
      008E0F 00 08            [ 1]  688 	ld a,#TK_COMMA
      008E10 CC 10 8F         [ 2]  689 	jp token_char
      000F86                        690 sharp_tst:
      000F86                        691 	_case SHARP dash_tst 
      008E10 89 4B            [ 1]    1 	ld a,#SHARP 
      008E12 00 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E14 0A A1            [ 1]    3 	jrne dash_tst
      008E16 24 26            [ 1]  692 	ld a,#TK_SHARP
      008E18 04 5B 01         [ 2]  693 	jp token_char  	 	 
      000F91                        694 dash_tst: 	
      000F91                        695 	_case '-' at_tst 
      008E1B 4B 10            [ 1]    1 	ld a,#'-' 
      008E1D F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1F 91 D6            [ 1]    3 	jrne at_tst
      008E21 01 72            [ 1]  696 	ld a,#TK_MINUS  
      008E23 5C 00 02         [ 2]  697 	jp token_char 
      000F9C                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      000F9C                        699 	_case '@' qmark_tst 
      008E26 CD 99            [ 1]    1 	ld a,#'@' 
      008E28 4D 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2A 02 CD            [ 1]    3 	jrne qmark_tst
      008E2C 8E AD            [ 1]  700 	ld a,#TK_ARRAY 
      008E2E 25 ED A6         [ 2]  701 	jp token_char
      000FA7                        702 qmark_tst:
      000FA7                        703 	_case '?' tick_tst 
      008E31 10 11            [ 1]    1 	ld a,#'?' 
      008E33 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008E35 0A 7B            [ 1]    3 	jrne tick_tst
      008E37 02 A1            [ 1]  704 	ld a,#TK_CMD  
      008E39 41               [ 1]  705 	ld (x),a 
      008E3A 2B               [ 1]  706 	incw x 
      008E3B 04 A1            [ 1]  707 	ldw y,x 
      008E3D 47 2B DD         [ 2]  708 	ldw x,#print
      008E40 72 5A            [ 2]  709 	ldw (y),x 
      008E42 00 02 7F 1E      [ 2]  710 	addw y,#2
      008E46 03 CD 99         [ 2]  711 	jp token_exit
      000FBF                        712 tick_tst: ; comment 
      000FBF                        713 	_case TICK plus_tst 
      008E49 59 16            [ 1]    1 	ld a,#TICK 
      008E4B 03 C6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4D 00 0D            [ 1]    3 	jrne plus_tst
      008E4F 90 F7            [ 1]  714 	ld a,#TK_CMD
      008E51 90               [ 1]  715 	ld (x),a 
      008E52 5C               [ 1]  716 	incw x
      008E53 CE 00 0E 90      [ 2]  717 	ldw y,#remark 
      008E57 FF               [ 2]  718 	ldw (x),y 
      008E58 72 A9 00         [ 2]  719 	addw x,#2  
      000FD1                        720 copy_comment:
      008E5B 02 A6 84 5B      [ 2]  721 	ldw y,#tib 
      008E5F 04 81 00 00      [ 2]  722 	addw y,in.w
      008E61 90 89            [ 2]  723 	pushw y 
      008E61 4B 00 4B         [ 4]  724 	call strcpy
      008E64 00 4B 00         [ 2]  725 	subw y,(1,sp)
      008E67 90 5C            [ 1]  726 	incw y ; strlen+1 
      008E67 91 D6            [ 2]  727 	ldw (1,sp),y 
      008E69 01 72 5C         [ 2]  728 	addw x,(1,sp) 
      000FE8                        729 	_drop 2 
      008E6C 00 02            [ 2]    1     addw sp,#2 
      008E6E A1               [ 1]  730 	clr a 
      008E6F 30 27            [ 1]  731 	ldw y,x 
      008E71 06 A1 31         [ 2]  732 	jp token_exit 
      000FF0                        733 plus_tst:
      000FF0                        734 	_case '+' star_tst 
      008E74 27 02            [ 1]    1 	ld a,#'+' 
      008E76 20 0B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E78 A0 30            [ 1]    3 	jrne star_tst
      008E7A 46 09            [ 1]  735 	ld a,#TK_PLUS  
      008E7C 03 09 02         [ 2]  736 	jp token_char 
      000FFB                        737 star_tst:
      000FFB                        738 	_case '*' slash_tst 
      008E7F 09 01            [ 1]    1 	ld a,#'*' 
      008E81 20 E4            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008E83 26 05            [ 1]    3 	jrne slash_tst
      008E83 72 5A            [ 1]  739 	ld a,#TK_MULT 
      008E85 00 02 90         [ 2]  740 	jp token_char 
      001006                        741 slash_tst: 
      001006                        742 	_case '/' prcnt_tst 
      008E88 93 7B            [ 1]    1 	ld a,#'/' 
      008E8A 01 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8C F7 90            [ 1]    3 	jrne prcnt_tst
      008E8E 5C 1E            [ 1]  743 	ld a,#TK_DIV 
      008E90 02 90 FF         [ 2]  744 	jp token_char 
      001011                        745 prcnt_tst:
      001011                        746 	_case '%' eql_tst 
      008E93 72 A9            [ 1]    1 	ld a,#'%' 
      008E95 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E97 A6 84            [ 1]    3 	jrne eql_tst
      008E99 5B 03            [ 1]  747 	ld a,#TK_MOD
      008E9B 81 10 8F         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      008E9C                        750 eql_tst:
      00101C                        751 	_case '=' gt_tst 		
      008E9C A1 41            [ 1]    1 	ld a,#'=' 
      008E9E 8C 24            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA0 0B A1            [ 1]    3 	jrne gt_tst
      008EA2 5B 25            [ 1]  752 	ld a,#TK_EQUAL
      008EA4 07 A1 61         [ 2]  753 	jp token_char 
      001027                        754 gt_tst:
      001027                        755 	_case '>' lt_tst 
      008EA7 8C 24            [ 1]    1 	ld a,#'>' 
      008EA9 02 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      008EAB 7B 81            [ 1]    3 	jrne lt_tst
      008EAD A6 31            [ 1]  756 	ld a,#TK_GT 
      008EAD A1 30            [ 1]  757 	ld (ATTRIB,sp),a 
      008EAF 25 03 A1         [ 4]  758 	ld a,([in.w],y)
      008EB2 3A 8C 8C 81      [ 1]  759 	inc in 
      008EB6 A1 3D            [ 1]  760 	cp a,#'=
      008EB6 CD 8E            [ 1]  761 	jrne 1$
      008EB8 AD 25            [ 1]  762 	ld a,#TK_GE 
      008EBA 03 CD            [ 2]  763 	jra token_char  
      008EBC 8E 9C            [ 1]  764 1$: cp a,#'<
      008EBE 81 04            [ 1]  765 	jrne 2$
      008EBF A6 35            [ 1]  766 	ld a,#TK_NE 
      008EBF A1 5F            [ 2]  767 	jra token_char 
      008EC1 26 03 99 20      [ 1]  768 2$: dec in
      008EC5 03 CD            [ 1]  769 	ld a,(ATTRIB,sp)
      008EC7 8E B6            [ 2]  770 	jra token_char 	 
      001050                        771 lt_tst:
      001050                        772 	_case '<' other
      008EC9 81 3C            [ 1]    1 	ld a,#'<' 
      008ECA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ECA 5C 23            [ 1]    3 	jrne other
      008ECB A6 34            [ 1]  773 	ld a,#TK_LT 
      008ECB CD 99            [ 1]  774 	ld (ATTRIB,sp),a 
      008ECD 4D F7 5C         [ 4]  775 	ld a,([in.w],y)
      008ED0 91 D6 01 72      [ 1]  776 	inc in 
      008ED4 5C 00            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008ED6 02 CD            [ 1]  778 	jrne 1$
      008ED8 8E BF            [ 1]  779 	ld a,#TK_LE 
      008EDA 25 EF            [ 2]  780 	jra token_char 
      008EDC 7F 72            [ 1]  781 1$: cp a,#'>
      008EDE 5A 00            [ 1]  782 	jrne 2$
      008EE0 02 81            [ 1]  783 	ld a,#TK_NE 
      008EE2 20 1E            [ 2]  784 	jra token_char 
      008EE2 89 CD 8E CA      [ 1]  785 2$: dec in 
      008EE6 1E 01            [ 1]  786 	ld a,(ATTRIB,sp)
      008EE8 E6 02            [ 2]  787 	jra token_char 	
      001079                        788 other: ; not a special character 	 
      008EEA 26 0F            [ 1]  789 	ld a,(TCHAR,sp)
      008EEC E6 01 A0         [ 4]  790 	call is_alpha 
      008EEF 41 AE            [ 1]  791 	jrc 30$ 
      008EF1 00 03 42         [ 2]  792 	jp syntax_error 
      001083                        793 30$: 
      008EF4 1C 00 36         [ 4]  794 	call parse_keyword
      008EF7 A6 85 20         [ 2]  795 	cpw x,#remark 
      008EFA 36 08            [ 1]  796 	jrne token_exit 
      008EFB 93               [ 1]  797 	ldw x,y 
      008EFB AE B6 FC         [ 2]  798 	jp copy_comment 
      00108F                        799 token_char:
      008EFE 16               [ 1]  800 	ld (x),a 
      008EFF 01               [ 1]  801 	incw x
      008F00 90 5C            [ 1]  802 	ldw y,x 
      001093                        803 token_exit:
      001093                        804 	_drop VSIZE 
      008F02 CD 99            [ 2]    1     addw sp,#VSIZE 
      008F04 DA               [ 4]  805 	ret
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
      008F05 4D 26            [ 2]  826 	pushw y 
      001098                        827 	_vars VSIZE 
      008F07 29 16            [ 2]    1     sub sp,#VSIZE 
      008F09 01 A6 03 90 F7   [ 1]  828 	mov basicptr,txtbgn
      008F0E 90 5C 93 CD      [ 1]  829 	bset flags,#FCOMP 
      008F12 94 06            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008F14 A1 0F 23         [ 2]  831 	ldw x,#0
      008F17 02 A6 0F         [ 2]  832 	ldw pad,x ; destination buffer 
      008F1A C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      008F1A 88 16 E3         [ 2]  834 	ldw x,#pad+3
      008F1B 72 5F 00 01      [ 1]  835 	clr in 
      008F1B 90 F6 27         [ 4]  836 	call get_token
      008F1E 09 90            [ 1]  837 	cp a,#TK_INTGR
      008F20 5C 0A            [ 1]  838 	jrne 2$
      008F22 01 26 F6         [ 2]  839 	cpw x,#1 
      008F25 4F 90            [ 1]  840 	jrpl 1$
      008F27 F7 90            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F29 5C 5B 01         [ 2]  842 	jp tb_error
      008F2C A6 03 5F         [ 2]  843 1$:	ldw pad,x 
      008F2F 20 1B 16 E3      [ 2]  844 	ldw y,#pad+3 
      008F31 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      008F31 16 01            [ 1]  846 	jrult 3$
      008F33 A1 87            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F35 2B 06 90         [ 2]  848 	jp tb_error 
      0010D8                        849 3$:	
      008F38 F7               [ 1]  850 	ldw x,y 
      008F39 90 5C 20         [ 4]  851 	call get_token 
      008F3C 0F 00            [ 1]  852 	cp a,#TK_NONE 
      008F3D 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F3D A3 9D 53 27      [ 2]  855 	subw y,#pad
      008F41 0A 90            [ 1]  856     ld a,yl
      008F43 F7 90 5C         [ 2]  857 	ldw x,#pad 
      008F46 90 FF 72         [ 2]  858 	ldw ptr16,x 
      008F49 A9 00            [ 1]  859 	ld (2,x),a 
      008F4B 02               [ 2]  860 	ldw x,(x)
      008F4C 5B 02            [ 1]  861 	jreq 10$
      008F4E 81 0C C9         [ 4]  862 	call insert_line
      008F4F 72 5F 00 02      [ 1]  863 	clr  count 
      008F4F 88 91            [ 2]  864 	jra  11$ 
      0010FA                        865 10$: ; line# is zero 
      008F51 D6 01 27         [ 2]  866 	ldw x,ptr16  
      008F54 0A 11 01         [ 2]  867 	ldw basicptr,x 
      008F57 26 06            [ 1]  868 	ld a,(2,x)
      008F59 72 5C 00         [ 1]  869 	ld count,a 
      008F5C 02 20 F1 5B      [ 1]  870 	mov in,#3 
      001109                        871 11$:
      001109                        872 	_drop VSIZE 
      008F60 01 81            [ 2]    1     addw sp,#VSIZE 
      008F62 72 1B 00 22      [ 1]  873 	bres flags,#FCOMP 
      008F62 52 02            [ 2]  874 	popw y 
      008F64 81               [ 4]  875 	ret 
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
      001112                         48 cpy_cmd_name:
      008F64 90               [ 2]   49 	tnzw x 
      008F65 AE 16            [ 1]   50 	jreq 10$
      008F67 90               [ 1]   51 	ld a,(x)
      008F68 A6               [ 1]   52 	incw x
      008F69 20 CD            [ 1]   53 	and a,#15  
      008F6B 8F               [ 1]   54 	push a 
      008F6C 4F 55            [ 1]   55     tnz (1,sp) 
      008F6E 00 02            [ 1]   56 	jreq 9$
      008F70 00               [ 1]   57 1$:	ld a,(x)
      008F71 04 91            [ 1]   58 	ld (y),a  
      008F73 D6               [ 1]   59 	incw x
      008F74 01 26            [ 1]   60 	incw y 
      008F76 05 90            [ 1]   61 	dec (1,sp)	 
      008F78 93 CC            [ 1]   62 	jrne 1$
      008F7A 91               [ 1]   63 9$: pop a 
      001129                         64 10$: 
      008F7B 13               [ 4]   65 	ret	
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
      008F7C 72 5C            [ 2]   76 	decw y 
      008F7E 00 02            [ 1]   77 	ld a,(y)
      008F80 CD 99            [ 1]   78 	incw y
      008F82 4D 6B            [ 1]   79 	cp a,#') 
      008F84 01 05            [ 1]   80 	jreq 0$
      008F85 CD 0E 36         [ 4]   81 	call is_alnum 
      008F85 A6 22            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      001139                         83 0$: 
      008F87 11 01            [ 1]   84 	ld a,#SPACE 
      008F89 26 0A            [ 1]   85 	ld (y),a 
      008F8B A6 02            [ 1]   86 	incw y 
      008F8D F7               [ 4]   87 1$: ret 
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
      008F8E 5C               [ 1]  100 	push a 
      008F8F CD 8D            [ 1]  101 0$: ld a,(1,sp)
      008F91 BB CC 91         [ 1]  102 	cp a,tab_width 
      008F94 13 08            [ 1]  103 	jrpl 1$
      008F95 A6 20            [ 1]  104 	ld a,#SPACE 
      008F95 A6               [ 2]  105 	decw x
      008F96 24               [ 1]  106 	ld (x),a  
      008F97 11 01            [ 1]  107 	inc (1,sp)
      008F99 27 17            [ 2]  108 	jra 0$ 
      008F9B A6               [ 1]  109 1$: pop a 	
      008F9C 26               [ 4]  110 	ret 
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
      008F9D 11 01            [ 1]  124 	ld a,#'"
      008F9F 26 0A            [ 1]  125 	ld (y),a 
      008FA1 A6 84            [ 1]  126 	incw y 
      008FA3 F7               [ 2]  127 	pushw x 
      008FA4 5C CD 8E         [ 4]  128 	call skip_string 
      008FA7 61               [ 2]  129 	popw x 
      008FA8 CC               [ 1]  130 1$:	ld a,(x)
      008FA9 91 13            [ 1]  131 	jreq 9$
      008FAB 7B               [ 1]  132 	incw x 
      008FAC 01 CD            [ 1]  133 	cp a,#SPACE 
      008FAE 8E AD            [ 1]  134 	jrult 3$
      008FB0 24 0C            [ 1]  135 	ld (y),a
      008FB2 A6 84            [ 1]  136 	incw y 
      008FB4 F7 5C            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      008FB6 7B 01            [ 1]  138 	jrne 1$ 
      00116D                        139 2$:
      008FB8 CD 8E            [ 1]  140 	ld (y),a
      008FBA 10 CC            [ 1]  141 	incw y  
      008FBC 91 13            [ 2]  142 	jra 1$
      008FBE 88               [ 1]  143 3$: push a 
      008FBE A6 28            [ 1]  144 	ld a,#'\
      008FC0 11 01            [ 1]  145 	ld (y),a 
      008FC2 26 05            [ 1]  146 	incw y  
      008FC4 A6               [ 1]  147 	pop a 
      008FC5 06 CC            [ 1]  148 	sub a,#7
      008FC7 91 0F 0E         [ 1]  149 	ld acc8,a 
      008FC9 72 5F 00 0D      [ 1]  150 	clr acc16
      008FC9 A6               [ 2]  151 	pushw x
      008FCA 5C 11 01         [ 2]  152 	ldw x,#escaped 
      008FCD 26 16 A6 04      [ 2]  153 	addw x,acc16 
      008FD1 F7               [ 1]  154 	ld a,(x)
      008FD2 5C               [ 2]  155 	popw x
      008FD3 91 D6            [ 2]  156 	jra 2$
      008FD5 01 F7            [ 1]  157 9$: ld a,#'"
      008FD7 5C 90            [ 1]  158 	ld (y),a 
      008FD9 93 72            [ 1]  159 	incw y  
      008FDB 5C               [ 1]  160 	incw x 
      008FDC 00               [ 4]  161 	ret
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
      008FDD 02 5F 97         [ 2]  172 		subw x,#vars 
      008FE0 A6 04            [ 1]  173 		ld a,#3
      008FE2 CC               [ 2]  174 		div x,a 
      008FE3 91               [ 1]  175 		ld a,xl 
      008FE4 13 41            [ 1]  176 		add a,#'A 
      008FE5 81               [ 4]  177 		ret 
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
      0011A2                        195 decompile::
      0011A2                        196 	_vars VSIZE
      008FE5 A6 29            [ 2]    1     sub sp,#VSIZE 
      008FE7 11 01 26         [ 1]  197 	ld a,base
      008FEA 05 A6            [ 1]  198 	ld (BASE_SAV,sp),a  
      008FEC 07 CC 91         [ 1]  199 	ld a,tab_width 
      008FEF 0F 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      008FF0 17 03            [ 2]  201 	ldw (STR,sp),y   
      008FF0 A6 3A 11 01      [ 5]  202 	ldw x,[basicptr] ; line number 
      008FF4 26 05 A6 0A      [ 1]  203 	mov base,#10
      008FF8 CC 91 0F 23      [ 1]  204 	mov tab_width,#5
      008FFB 72 5F 00 0C      [ 1]  205 	clr acc24 
      008FFB A6 2C 11         [ 2]  206 	ldw acc16,x
      008FFE 01               [ 1]  207 	clr a ; unsigned conversion 
      008FFF 26 05 A6         [ 4]  208 	call itoa  
      009002 08 CC 91         [ 4]  209 	call right_align 
      009005 0F               [ 1]  210 	push a 
      009006 90 93            [ 1]  211 1$:	ldw y,x ; source
      009006 A6 23            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      009008 11 01 26         [ 4]  213 	call strcpy 
      00900B 05 A6            [ 1]  214 	clrw y 
      00900D 09               [ 1]  215 	pop a 
      00900E CC 91            [ 1]  216 	ld yl,a 
      009010 0F F9 03         [ 2]  217 	addw y,(STR,sp)
      009011 A6 20            [ 1]  218 	ld a,#SPACE 
      009011 A6 2D            [ 1]  219 	ld (y),a 
      009013 11 01            [ 1]  220 	incw y 
      009015 26 05 A6 11      [ 1]  221 	clr tab_width
      009019 CC 91 0F         [ 2]  222 	ldw x,#3
      00901C CF 00 00         [ 2]  223 	ldw in.w,x 
      0011EA                        224 decomp_loop:
      00901C A6 40            [ 2]  225 	pushw y
      00901E 11 01 26         [ 4]  226 	call next_token 
      009021 05 A6            [ 2]  227 	popw y 
      009023 05               [ 1]  228 	tnz a  
      009024 CC 91            [ 1]  229 	jrne 1$
      009026 0F 13 17         [ 2]  230 	jp 20$
      009027 2B 03            [ 1]  231 1$:	jrmi 2$
      009027 A6 3F 11         [ 2]  232 	jp 6$
      0011FC                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00902A 01 26            [ 1]  234 	cp a,#TK_VAR 
      00902C 12 A6            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      00902E 80 F7 5C         [ 4]  237 	call add_space
      009031 90 93 AE         [ 4]  238 	call get_addr   
      009034 A0 3D 90         [ 4]  239 	call var_name
      009037 FF 72            [ 1]  240 	ld (y),a 
      009039 A9 00            [ 1]  241 	incw y  
      00903B 02 CC            [ 2]  242 	jra decomp_loop
      00120F                        243 3$:
      00903D 91 13            [ 1]  244 	cp a,#TK_INTGR
      00903F 26 26            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00903F A6 27 11         [ 4]  247 	call get_int24 
      009042 01 26 2B         [ 1]  248 	ld acc24,a 
      009045 A6 80 F7         [ 2]  249 	ldw acc16,x 
      009048 5C 90 AE         [ 4]  250 	call add_space
      00904B A1 85            [ 2]  251 	pushw y 
      00904D FF 1C            [ 1]  252 	ld a,#255 ; signed conversion 
      00904F 00 02 74         [ 4]  253 	call itoa  
      009051 16 01            [ 2]  254 	ldw y,(1,sp) 
      009051 90               [ 1]  255 	push a 
      009052 AE               [ 1]  256 	exgw x,y 
      009053 16 90 72         [ 4]  257 	call strcpy 
      009056 B9 00            [ 1]  258 	clrw y
      009058 01               [ 1]  259 	pop a  
      009059 90 89            [ 1]  260 	ld yl,a 
      00905B CD 94 22         [ 2]  261 	addw y,(1,sp)
      001235                        262 	_drop 2 
      00905E 72 F2            [ 2]    1     addw sp,#2 
      009060 01 90            [ 2]  263 	jra decomp_loop
      001239                        264 4$: ; dictionary keyword
      009062 5C 17            [ 1]  265 	cp a,#TK_NOT 
      009064 01 72            [ 1]  266 	jruge 50$ 
      009066 FB               [ 2]  267 	ldw x,(x)
      009067 01 5B 02 4F      [ 1]  268 	inc in 
      00906B 90 93 CC 91      [ 1]  269 	inc in 
      00906F 13 21 05         [ 2]  270 	cpw x,#remark 
      009070 26 23            [ 1]  271 	jrne 5$
      009070 A6 2B 11         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      009073 01 26 05         [ 4]  274 	call add_space
      009076 A6 10            [ 1]  275 	ld a,#''
      009078 CC 91            [ 1]  276 	ld (y),a 
      00907A 0F 5C            [ 1]  277 	incw y 
      00907B                        278 46$:
      00907B A6 2A 11 01      [ 4]  279 	ld a,([in.w],x)
      00907F 26 05 A6 20      [ 1]  280 	inc in  
      009083 CC 91            [ 1]  281 	ld (y),a 
      009085 0F 5C            [ 1]  282 	incw y 
      009086 C6 00 01         [ 1]  283 	ld a,in 
      009086 A6 2F 11         [ 1]  284 	cp a,count 
      009089 01 26            [ 1]  285 	jrmi 46$
      00908B 05 A6 21         [ 2]  286 	jp 20$  
      00908E CC 91 0F         [ 2]  287 5$: cpw x,#let  
      009091 26 05            [ 1]  288 	jrne 54$
      009091 A6 25 11         [ 2]  289 	jp decomp_loop ; down display LET
      001276                        290 50$:
      009094 01               [ 1]  291 	clrw x 
      009095 26               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      001278                        297 54$: ; insert command name 
      009096 05 A6 22         [ 4]  298 	call add_space  
      009099 CC 91            [ 2]  299 	pushw y
      00909B 0F 13 52         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00909C 90 85            [ 2]  301 	popw y 
      00909C A6 3D 11         [ 4]  302 	call cpy_cmd_name
      00909F 01 26 05         [ 2]  303 	jp decomp_loop 
      001288                        304 6$:
                                    305 ; label?
      0090A2 A6 32            [ 1]  306 	cp a,#TK_LABEL 
      0090A4 CC 91            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0090A6 0F 20            [ 1]  309 	ld a,#32 
      0090A7 90 F7            [ 1]  310 	ld (y),a 
      0090A7 A6 3E            [ 1]  311 	incw y 
      001292                        312 61$:
      0090A9 11               [ 2]  313 	pushw x 
      0090AA 01 26 23         [ 4]  314 	call skip_string 
      0090AD A6               [ 2]  315 	popw x 
      001297                        316 62$:	
      0090AE 31               [ 1]  317 	ld a,(x)
      0090AF 6B 02            [ 1]  318 	jreq 63$ 
      0090B1 91               [ 1]  319 	incw x  
      0090B2 D6 01            [ 1]  320 	ld (y),a 
      0090B4 72 5C            [ 1]  321 	incw y 
      0090B6 00 02            [ 2]  322 	jra 62$ 
      0012A1                        323 63$: 
      0090B8 A1 3D            [ 1]  324 	ld a,#32 
      0090BA 26 04            [ 1]  325 	ld (y),a 
      0090BC A6 33            [ 1]  326 	incw y 
      0090BE 20 4F A1         [ 2]  327 	jp decomp_loop
      0012AA                        328 64$:
      0090C1 3C 26            [ 1]  329 	cp a,#TK_QSTR 
      0090C3 04 A6            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0090C5 35 20 47         [ 4]  332 	call add_space
      0090C8 72 5A 00         [ 4]  333 	call cpy_quote  
      0090CB 02 7B 02         [ 2]  334 	jp decomp_loop
      0012B7                        335 7$:
      0090CE 20 3F            [ 1]  336 	cp a,#TK_CHAR 
      0090D0 26 10            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      0090D0 A6 3C 11         [ 4]  339 	call add_space 
      0090D3 01 26            [ 1]  340 	ld a,#'\ 
      0090D5 23 A6            [ 1]  341 	ld (y),a 
      0090D7 34 6B            [ 1]  342 	incw y
      0090D9 02               [ 1]  343 	ld a,(x)
      0090DA 91 D6 01 72      [ 1]  344 	inc in  
      0090DE 5C 00            [ 2]  345 	jra 81$
      0090E0 02 A1            [ 1]  346 8$: cp a,#TK_COLON 
      0090E2 3D 26            [ 1]  347 	jrne 9$
      0090E4 04 A6            [ 1]  348 	ld a,#':
      0012D1                        349 81$:
      0090E6 36 20            [ 1]  350 	ld (y),a 
      0090E8 26 A1            [ 1]  351 	incw y 
      0012D5                        352 82$:
      0090EA 3E 26 04         [ 2]  353 	jp decomp_loop
      0012D8                        354 9$: 
      0090ED A6 35            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0090EF 20 1E            [ 1]  356 	jrugt 10$ 
      0090F1 72 5A            [ 1]  357 	sub a,#TK_ARRAY 
      0090F3 00               [ 1]  358 	clrw x 
      0090F4 02               [ 1]  359 	ld xl,a
      0090F5 7B 02 20         [ 2]  360 	addw x,#single_char 
      0090F8 16               [ 1]  361 	ld a,(x)
      0090F9 20 EB            [ 2]  362 	jra 81$ 
      0012E6                        363 10$: 
      0090F9 7B 01            [ 1]  364 	cp a,#TK_MINUS 
      0090FB CD 8E            [ 1]  365 	jrugt 11$
      0090FD 9C 25            [ 1]  366 	sub a,#TK_PLUS 
      0090FF 03               [ 1]  367 	clrw x 
      009100 CC               [ 1]  368 	ld xl,a 
      009101 97 08 32         [ 2]  369 	addw x,#add_char 
      009103 F6               [ 1]  370 	ld a,(x)
      009103 CD 8E            [ 2]  371 	jra 81$
      0012F4                        372 11$:
      009105 E2 A3            [ 1]  373     cp a,#TK_MOD 
      009107 A1 85            [ 1]  374 	jrugt 12$
      009109 26 08            [ 1]  375 	sub a,#TK_MULT
      00910B 93               [ 1]  376 	clrw x 
      00910C CC               [ 1]  377 	ld xl,a 
      00910D 90 51 34         [ 2]  378 	addw x,#mul_char
      00910F F6               [ 1]  379 	ld a,(x)
      00910F F7 5C            [ 2]  380 	jra 81$
      001302                        381 12$:
      009111 90 93            [ 1]  382 	sub a,#TK_GT  
      009113 48               [ 1]  383 	sll a 
      009113 5B               [ 1]  384 	clrw x 
      009114 02               [ 1]  385 	ld xl,a 
      009115 81 13 37         [ 2]  386 	addw x,#relop_str 
      009116 FE               [ 2]  387 	ldw x,(x)
      009116 90               [ 1]  388 	ld a,(x)
      009117 89               [ 1]  389 	incw x 
      009118 52 02            [ 1]  390 	ld (y),a
      00911A 55 00            [ 1]  391 	incw y 
      00911C 1C               [ 1]  392 	ld a,(x)
      00911D 00 05            [ 1]  393 	jrne 81$
      00911F 72 1A 00         [ 2]  394 	jp decomp_loop 
      001317                        395 20$: 
      009122 23 A6            [ 1]  396 	clr (y)
      009124 00 AE            [ 2]  397 	ldw x,(STR,sp)
      009126 00 00            [ 1]  398 	ld a,(BASE_SAV,sp)
      009128 CF 16 E0         [ 1]  399 	ld base,a 
      00912B C7 16            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      00912D E2 AE 16         [ 1]  401 	ld tab_width,a
      009130 E3 72 5F         [ 2]  402 	subw y,(STR,sp) 
      009133 00 02            [ 1]  403 	ld a,yl 
      00132A                        404 	_drop VSIZE 
      009135 CD 8F            [ 2]    1     addw sp,#VSIZE 
      009137 62               [ 4]  405 	ret 
                                    406 
      009138 A1 84 26 11 A3         407 single_char: .byte '@','(',')',',','#'
      00913D 00 01                  408 add_char: .byte '+','-'
      00913F 2A 05 A6               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009142 0A CC 97 0A CF 16 E0   410 relop_str: .word gt,equal,ge,lt,ne,le 
             90 AE 16 E3 90
      00914E A3 17                  411 gt: .asciz ">"
      009150 60 25                  412 equal: .asciz "="
      009152 05 A6 0F               413 ge: .asciz ">="
      009155 CC 97                  414 lt: .asciz "<"
      009157 0A 3D 00               415 le: .asciz "<="
      009158 3C 3E 00               416 ne:  .asciz "<>"
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
      009158 93 CD            [ 2]    1     sub sp,#VSIZE 
      00915A 8F 62 A1 00      [ 1]  431 	clr acc16 
      00915E 26 ED            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009160 72 A2 16         [ 2]  433 	ldw x,#kword_dict	
      009163 E0 90            [ 2]  434 1$:	ldw (LINK,sp),x
      009165 9F AE            [ 1]  435 	ld a,(2,x)
      009167 16 E0            [ 1]  436 	and a,#15 
      009169 CF 00 1A         [ 1]  437 	ld acc8,a 
      00916C E7 02 FE         [ 2]  438 	addw x,#3
      00916F 27 09 CD 8D      [ 2]  439 	addw x,acc16
      009173 49               [ 2]  440 	ldw x,(x) ; code address   
      009174 72 5F            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      009176 00 03            [ 1]  442 	jreq 2$
      009178 20 0F            [ 2]  443 	ldw x,(LINK,sp)
      00917A FE               [ 2]  444 	ldw x,(x) 
      00917A CE 00 1A         [ 2]  445 	subw x,#2  
      00917D CF 00            [ 1]  446 	jrne 1$
      00917F 05               [ 1]  447 	clr a 
      009180 E6               [ 1]  448 	clrw x 
      009181 02 C7            [ 2]  449 	jra 9$
      009183 00 03            [ 2]  450 2$: ldw x,(LINK,sp)
      009185 35 03 00         [ 2]  451 	addw x,#2 	
      001383                        452 9$:	_drop VSIZE
      009188 02 04            [ 2]    1     addw sp,#VSIZE 
      009189 81               [ 4]  453 	ret
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
      001386                        120 strlen::
      009189 5B               [ 2]  121 	pushw x 
      00918A 02               [ 1]  122 	clr a
      00918B 72               [ 1]  123 1$:	tnz (x) 
      00918C 1B 00            [ 1]  124 	jreq 9$ 
      00918E 23               [ 1]  125 	inc a 
      00918F 90               [ 1]  126 	incw x 
      009190 85 81            [ 2]  127 	jra 1$ 
      009192 85               [ 2]  128 9$:	popw x 
      009192 5D               [ 4]  129 	ret 
                                    130 
                                    131 ;------------------------------------
                                    132 ; compare 2 strings
                                    133 ; input:
                                    134 ;   X 		char* first string 
                                    135 ;   Y       char* second string 
                                    136 ; output:
                                    137 ;   A 		0 not == |1 ==  
                                    138 ;-------------------------------------
      001391                        139 strcmp:
      009193 27               [ 1]  140 	ld a,(x)
      009194 14 F6            [ 1]  141 	jreq 5$ 
      009196 5C A4            [ 1]  142 	cp a,(y) 
      009198 0F 88            [ 1]  143 	jrne 4$ 
      00919A 0D               [ 1]  144 	incw x 
      00919B 01 27            [ 1]  145 	incw y 
      00919D 0A F6            [ 2]  146 	jra strcmp 
      00139D                        147 4$: ; not same  
      00919F 90               [ 1]  148 	clr a 
      0091A0 F7               [ 4]  149 	ret 
      00139F                        150 5$: ; same 
      0091A1 5C 90            [ 1]  151 	ld a,#1 
      0091A3 5C               [ 4]  152 	ret 
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
      0013A2                        163 strcpy::
      0091A4 0A               [ 1]  164 	push a 
      0091A5 01               [ 2]  165 	pushw x 
      0091A6 26 F6            [ 1]  166 1$: ld a,(y)
      0091A8 84 06            [ 1]  167 	jreq 9$ 
      0091A9 F7               [ 1]  168 	ld (x),a 
      0091A9 81               [ 1]  169 	incw x 
      0091AA 90 5C            [ 1]  170 	incw y 
      0091AA 90 5A            [ 2]  171 	jra 1$ 
      0091AC 90               [ 1]  172 9$:	clr (x)
      0091AD F6               [ 2]  173 	popw x 
      0091AE 90               [ 1]  174 	pop a 
      0091AF 5C               [ 4]  175 	ret 
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
      0013B2                        189 move::
      0091B0 A1               [ 1]  190 	push a 
      0013B3                        191 	_vars VSIZE 
      0091B1 29 27            [ 2]    1     sub sp,#VSIZE 
      0091B3 05 CD            [ 1]  192 	clr (INCR,sp)
      0091B5 8E B6            [ 1]  193 	clr (LB,sp)
      0091B7 24 06            [ 2]  194 	pushw y 
      0091B9 13 01            [ 2]  195 	cpw x,(1,sp) ; compare DEST to SRC 
      0091B9 A6 20            [ 2]  196 	popw y 
      0091BB 90 F7            [ 1]  197 	jreq move_exit ; x==y 
      0091BD 90 5C            [ 1]  198 	jrmi move_down
      0013C3                        199 move_up: ; start from top address with incr=-1
      0091BF 81 BB 00 0D      [ 2]  200 	addw x,acc16
      0091C0 72 B9 00 0D      [ 2]  201 	addw y,acc16
      0091C0 88 7B            [ 1]  202 	cpl (INCR,sp)
      0091C2 01 C1            [ 1]  203 	cpl (LB,sp)   ; increment = -1 
      0091C4 00 24            [ 2]  204 	jra move_loop  
      0013D1                        205 move_down: ; start from bottom address with incr=1 
      0091C6 2A               [ 2]  206     decw x 
      0091C7 08 A6            [ 2]  207 	decw y
      0091C9 20 5A            [ 1]  208 	inc (LB,sp) ; incr=1 
      0013D6                        209 move_loop:	
      0091CB F7 0C 01         [ 1]  210     ld a, acc16 
      0091CE 20 F1 84         [ 1]  211 	or a, acc8
      0091D1 81 14            [ 1]  212 	jreq move_exit 
      0091D2 72 FB 01         [ 2]  213 	addw x,(INCR,sp)
      0091D2 A6 22 90         [ 2]  214 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0091D5 F7 90            [ 1]  215 	ld a,(y)
      0091D7 5C               [ 1]  216 	ld (x),a 
      0091D8 89               [ 2]  217 	pushw x 
      0091D9 CD 98 88         [ 2]  218 	ldw x,acc16 
      0091DC 85               [ 2]  219 	decw x 
      0091DD F6 27 30         [ 2]  220 	ldw acc16,x 
      0091E0 5C               [ 2]  221 	popw x 
      0091E1 A1 20            [ 2]  222 	jra move_loop
      0013F2                        223 move_exit:
      0013F2                        224 	_drop VSIZE
      0091E3 25 0E            [ 2]    1     addw sp,#VSIZE 
      0091E5 90               [ 1]  225 	pop a 
      0091E6 F7               [ 4]  226 	ret 	
                                    227 
                                    228 ;------------------------------------
                                    229 ;  set all variables to zero 
                                    230 ; input:
                                    231 ;   none 
                                    232 ; output:
                                    233 ;	none
                                    234 ;------------------------------------
      0013F6                        235 clear_vars:
      0091E7 90               [ 2]  236 	pushw x 
      0091E8 5C               [ 1]  237 	push a  
      0091E9 A1 5C 26         [ 2]  238 	ldw x,#vars 
      0091EC F0 4E            [ 1]  239 	ld a,#CELL_SIZE*26 
      0091ED 7F               [ 1]  240 1$:	clr (x)
      0091ED 90               [ 1]  241 	incw x 
      0091EE F7               [ 1]  242 	dec a 
      0091EF 90 5C            [ 1]  243 	jrne 1$
      0091F1 20               [ 1]  244 	pop a 
      0091F2 EA               [ 2]  245 	popw x 
      0091F3 88               [ 4]  246 	ret 
                                    247 
                                    248 
                                    249 ;-----------------------
                                    250 ;  display system 
                                    251 ;  information 
                                    252 ;-----------------------
                           000002   253 	MAJOR=2
                           000000   254 	MINOR=0 
      0091F4 A6 5C 90 F7 90 5C 84   255 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             A0 07 C7 00 0F 72 5F
             00 0E 89 AE 8E 08 72
             BB 00 0E F6 85 20 DD
             A6 22 90 F7 90 5C 5C
             81 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    256 
      009218                        257 system_information:
      009218 1D 00 36         [ 2]  258 	ldw x,#software 
      00921B A6 03 62         [ 4]  259 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00921E 9F AB            [ 1]  260 	ld a,#MAJOR 
      009220 41 81 0E         [ 1]  261 	ld acc8,a 
      009222 5F               [ 1]  262 	clrw x 
      009222 52 04 C6         [ 2]  263 	ldw acc24,x
      009225 00 0B 6B 01      [ 1]  264 	clr tab_width  
      009229 C6 00 24 6B      [ 1]  265 	mov base, #10 
      00922D 02 17 03         [ 4]  266 	call prt_acc24 
      009230 72 CE            [ 1]  267 	ld a,#'.
      009232 00 05 35         [ 4]  268 	call putc 
      009235 0A 00            [ 1]  269 	ld a,#MINOR 
      009237 0B 35 05         [ 1]  270 	ld acc8,a 
      00923A 00               [ 1]  271 	clrw x 
      00923B 24 72 5F         [ 2]  272 	ldw acc24,x 
      00923E 00 0D CF         [ 4]  273 	call prt_acc24
      009241 00 0E            [ 1]  274 	ld a,#CR 
      009243 4F CD 98         [ 4]  275 	call putc
                                    276 ;call test 
      009246 F4               [ 4]  277 	ret
                                    278 
      00147C                        279 warm_init:
      009247 CD 91 C0 88      [ 2]  280 	ldw y,#XSTACK_EMPTY  
      00924B 90 93 1E 04      [ 1]  281 	clr flags 
      00924F CD 94 22 90      [ 1]  282 	clr loop_depth 
      009253 5F 84 90 97      [ 1]  283 	mov tab_width,#TAB_WIDTH 
      009257 72 F9 03 A6      [ 1]  284 	mov base,#10 
      00925B 20 90 F7         [ 2]  285 	ldw x,#0 
      00925E 90 5C 72         [ 2]  286 	ldw basicptr,x 
      009261 5F 00 24         [ 2]  287 	ldw in.w,x 
      009264 AE 00 03 CF      [ 1]  288 	clr count
      009268 00               [ 4]  289 	ret 
                                    290 
                                    291 ;---------------------------
                                    292 ; reset BASIC text variables 
                                    293 ; and clear variables 
                                    294 ;---------------------------
      00149E                        295 clear_basic:
      009269 01               [ 2]  296 	pushw x 
      00926A 72 5F 00 02      [ 1]  297 	clr count
      00926A 90 89 CD 98      [ 1]  298 	clr in  
      00926E 6F 90 85         [ 2]  299 	ldw x,#free_ram 
      009271 4D 26 03         [ 2]  300 	ldw txtbgn,x 
      009274 CC 93 97         [ 2]  301 	ldw txtend,x 
      009277 2B 03 CC         [ 2]  302 	ldw dvar_bgn,x 
      00927A 93 08 32         [ 2]  303 	ldw dvar_end,x 
      00927C CD 13 F6         [ 4]  304 	call clear_vars 
      00927C A1 85 26 0F      [ 1]  305 	clr chain_level 
      009280 CD               [ 2]  306 	popw x
      009281 91               [ 4]  307 	ret 
                                    308 
                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;;   Tiny BASIC error messages     ;;
                                    311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014BF                        312 err_msg:
      009282 AA CD 98 97 CD 92 18   313 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             90 F7 90 5C 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00928E DB 3E 15 54 15 6E 15   314 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             7F 15 90
      00928F 15 9C 15 CF 15 DF 15   315 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             F3 16 06
      00928F A1 84 26 26 CD 98      316 	.word err_overflow,err_read_only,err_not_program  
                                    317 
      009295 A1 C7 00 0D CF 00 0E   318 err_mem_full: .asciz "Memory full\n" 
             CD 91 AA 90 89 A6
      0092A2 FF CD 98 F4 16 01 88   319 err_syntax: .asciz "syntax error\n" 
             51 CD 94 22 90 5F 84
      0092B0 90 97 72 F9 01 5B 02   320 err_math_ovf: .asciz "math operation overflow\n"
             20 B1 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092B9 64 69 76 69 73 69 6F   321 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0092B9 A1 87 24 39 FE 72 5C   322 err_no_line: .asciz "invalid line number.\n"
             00 02 72 5C 00 02 A3
             A1 85 26 23 CE 00 05
             CD
      0092CF 91 AA A6 27 90 F7 90   323 err_run_only: .asciz "run time only usage.\n" 
             5C 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092D7 63 6F 6D 6D 61 6E 64   324 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0092D7 72 D6 00 01 72 5C 00   325 err_duplicate: .asciz "duplicate name.\n"
             02 90 F7 90 5C C6 00
             02 C1 00
      0092E8 03 2B EC CC 93 97 A3   326 err_not_file: .asciz "File not found.\n"
             9D 53 26 05 CC 92 6A
             2E 0A 00
      0092F6 62 61 64 20 76 61 6C   327 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0092F6 5F 97 6C 65 20 69 6E   328 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092F8 4E 6F 20 64 61 74 61   329 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092F8 CD 91 AA 90 89 CD 93   330 err_no_prog: .asciz "No program in RAM!\n"
             D2 90 85 CD 91 92 CC
             92 6A 4D 21 0A 00
      009308 46 69 6C 65 20 73 79   331 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      009308 A1 03 26 1E A6 20 90   332 err_buf_full: .asciz "Buffer full\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal  F7-Bits]



             66 75 6C 6C 0A 00
      009310 90 5C 65 72 66 6C 6F   333 err_overflow: .asciz "overflow\n" 
             77 0A 00
      009312 63 6F 6E 73 74 61 6E   334 err_read_only: .asciz "constant can't be modified\n"
             74 20 63 61 6E 27 74
             20 62 65 20 6D 6F 64
             69 66 69 65 64 0A 00
      009312 89 CD 98 88 85 6F 67   335 err_not_program: .asciz "no program at this address\n"
             72 61 6D 20 61 74 20
             74 68 69 73 20 61 64
             64 72 65 73 73 0A 00
                                    336 
                                    337 ;-------------------------------------
      009317 0A 72 75 6E 20 74 69   338 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
      009317 F6 27 07 5C 90 F7 90   339 comp_msg: .asciz "\ncompile error, "
             5C 20 F6 72 72 6F 72
             2C 20 00
      009321 6C 61 73 74 20 74 6F   340 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    341 
      001688                        342 syntax_error::
      009321 A6 20            [ 1]  343 	ld a,#ERR_SYNTAX 
                                    344 
      00168A                        345 tb_error::
      009323 90 F7 90 5C CC   [ 2]  346 	btjt flags,#FCOMP,1$
      009328 92               [ 1]  347 	push a 
      009329 6A 16 55         [ 2]  348 	ldw x, #rt_msg 
      00932A CD 09 5C         [ 4]  349 	call puts 
      00932A A1               [ 1]  350 	pop a 
      00932B 02 26 09         [ 2]  351 	ldw x, #err_msg 
      00932E CD 91 AA CD      [ 1]  352 	clr acc16 
      009332 91               [ 1]  353 	sll a
      009333 D2 CC 92 6A      [ 1]  354 	rlc acc16  
      009337 C7 00 0E         [ 1]  355 	ld acc8, a 
      009337 A1 04 26 10      [ 2]  356 	addw x,acc16 
      00933B CD               [ 2]  357 	ldw x,(x)
      00933C 91 AA A6         [ 4]  358 	call puts
      00933F 5C 90 F7         [ 2]  359 	ldw x,basicptr 
                           000001   360 .if DEBUG 
      009342 90 5C F6         [ 1]  361 ld a,count 
      009345 72 5C            [ 1]  362 clrw y 
      009347 00 02            [ 1]  363 rlwa y  
      009349 20 06 A1         [ 4]  364 call hex_dump
      00934C 0A 26 09         [ 2]  365 ldw x,basicptr
                                    366 .endif 
      00934F A6 3A 01         [ 1]  367 	ld a,in 
      009351 CD 1F 99         [ 4]  368 	call prt_basic_line
      009351 90 F7 90         [ 2]  369 	ldw x,#tk_id 
      009354 5C 09 5C         [ 4]  370 	call puts 
      009355 C6 00 03         [ 1]  371 	ld a,in.saved 
      009355 CC               [ 1]  372 	clrw x 
      009356 92               [ 1]  373 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009357 6A BB 00 04      [ 2]  374 	addw x,basicptr 
      009358 F6               [ 1]  375 	ld a,(x)
      009358 A1               [ 1]  376 	clrw x 
      009359 09               [ 1]  377 	ld xl,a 
      00935A 22 0A A0         [ 4]  378 	call prt_i16
      00935D 05 5F            [ 2]  379 	jra 6$
      0016DB                        380 1$:	
      00935F 97               [ 1]  381 	push a 
      009360 1C 93 AD         [ 2]  382 	ldw x,#comp_msg
      009363 F6 20 EB         [ 4]  383 	call puts 
      009366 84               [ 1]  384 	pop a 
      009366 A1 11 22         [ 2]  385 	ldw x, #err_msg 
      009369 0A A0 10 5F      [ 1]  386 	clr acc16 
      00936D 97               [ 1]  387 	sll a
      00936E 1C 93 B2 F6      [ 1]  388 	rlc acc16  
      009372 20 DD 0E         [ 1]  389 	ld acc8, a 
      009374 72 BB 00 0D      [ 2]  390 	addw x,acc16 
      009374 A1               [ 2]  391 	ldw x,(x)
      009375 22 22 0A         [ 4]  392 	call puts
      009378 A0 20 5F         [ 2]  393 	ldw x,#tib
      00937B 97 1C 93         [ 4]  394 	call puts 
      00937E B4 F6            [ 1]  395 	ld a,#CR 
      009380 20 CF FF         [ 4]  396 	call putc
      009382 CE 00 00         [ 2]  397 	ldw x,in.w
      009382 A0 31 48         [ 4]  398 	call spaces
      009385 5F 97            [ 1]  399 	ld a,#'^
      009387 1C 93 B7         [ 4]  400 	call putc 
      00938A FE F6 5C         [ 2]  401 6$: ldw x,#STACK_EMPTY 
      00938D 90               [ 1]  402     ldw sp,x
                                    403 
      001714                        404 warm_start:
      00938E F7 90 5C         [ 4]  405 	call warm_init
                                    406 ;----------------------------
                                    407 ;   BASIC interpreter
                                    408 ;----------------------------
      001717                        409 cmd_line: ; user interface 
      009391 F6 26            [ 1]  410 	ld a,#CR 
      009393 BD CC 92         [ 4]  411 	call putc 
      009396 6A 3E            [ 1]  412 	ld a,#'> 
      009397 CD 08 FF         [ 4]  413 	call putc
      009397 90 7F 1E         [ 4]  414 	call readln
      00939A 03 7B 01 C7      [ 1]  415 	tnz count 
      00939E 00 0B            [ 1]  416 	jreq cmd_line
      0093A0 7B 02 C7         [ 4]  417 	call compile
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
      0093A3 00 24 72 F2      [ 1]  431 	tnz count 
      0093A7 03 90            [ 1]  432 	jreq cmd_line
                                    433 	
                                    434 ; if direct command 
                                    435 ; it's ready to interpret 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;; This is the interpreter loop
                                    438 ;; for each BASIC code line. 
                                    439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001733                        440 interpreter: 
      0093A9 9F 5B 04         [ 1]  441 	ld a,in 
      0093AC 81 40 28         [ 1]  442 	cp a,count 
      0093AF 29 2C            [ 1]  443 	jrmi interp_loop
      00173B                        444 next_line:
      0093B1 23 2B 2D 2A 2F   [ 2]  445 	btjf flags, #FRUN, cmd_line
      0093B6 25 93 C3         [ 2]  446 	ldw x,basicptr
      0093B9 93 C5 93 C7      [ 2]  447 	addw x,in.w 
      0093BD 93 CA 93         [ 2]  448 	cpw x,txtend 
      0093C0 CF 93            [ 1]  449 	jrmi 0$
      0093C2 CC 3E 00         [ 4]  450 	call cmd_end 
      0093C5 3D 00 3E         [ 2]  451 0$:	ldw basicptr,x ; start of next line  
      0093C8 3D 00            [ 1]  452 	ld a,(2,x)
      0093CA 3C 00 3C         [ 1]  453 	ld count,a 
      0093CD 3D 00 3C 3E      [ 1]  454 	mov in,#3 ; skip first 3 bytes of line 
      00175B                        455 interp_loop:
      0093D1 00 17 EF         [ 4]  456 	call next_token
      0093D2 A1 00            [ 1]  457 	cp a,#TK_NONE 
      0093D2 52 04            [ 1]  458 	jreq next_line 
      0093D4 72 5F            [ 1]  459 	cp a,#TK_CMD
      0093D6 00 0E            [ 1]  460 	jrne 1$
      001766                        461 	_get_code_addr
      0093D8 1F               [ 2]    1         ldw x,(x)
      0093D9 01 AE B6 FA      [ 1]    2         inc in 
      0093DD 1F 03 E6 02      [ 1]    3         inc in 
      0093E1 A4               [ 4]  462 	call(x)
      0093E2 0F C7            [ 2]  463 	jra interp_loop 
      001772                        464 1$:	 
      0093E4 00 0F            [ 1]  465 	cp a,#TK_VAR
      0093E6 1C 00            [ 1]  466 	jrne 2$
      0093E8 03 72 BB         [ 4]  467 	call let_var  
      0093EB 00 0E            [ 2]  468 	jra interp_loop 
      00177B                        469 2$:	
      0093ED FE 13            [ 1]  470 	cp a,#TK_ARRAY 
      0093EF 01 27            [ 1]  471 	jrne 3$
      0093F1 0C 1E 03         [ 4]  472 	call let_array 
      0093F4 FE 1D            [ 2]  473 	jra interp_loop
      001784                        474 3$:	
      0093F6 00 02            [ 1]  475 	cp a,#TK_LABEL
      0093F8 26 E3            [ 1]  476 	jrne 4$
      0093FA 4F 5F 20         [ 4]  477 	call let_dvar  
      0093FD 05 1E            [ 2]  478 	jra interp_loop 
      00178D                        479 4$: 
      0093FF 03 1C            [ 1]  480 	cp a,#TK_COLON 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      009401 00 02            [ 1]  481 	jreq interp_loop
      009403 5B 04 81         [ 2]  482 5$:	jp syntax_error 
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
      000007 CD 18 08         [ 4]  499 	call skip_string 
      000009 CE 00 04         [ 2]  500 	ldw x,basicptr 
      00000A 72 BB 00 00      [ 2]  501 	addw x,in.w 
      00000B F6               [ 1]  502 	ld a,(x)
      00000C A1 32            [ 1]  503 	cp a,#TK_EQUAL 
      00000D 26 43            [ 1]  504 	jrne 9$ 
                                    505 ; dvar assignment 
      00000E 72 5C 00 01      [ 1]  506 	inc in  
      00000F CD 1C 14         [ 4]  507 	call condition  
      000010 A1 84            [ 1]  508 	cp a,#TK_INTGR 
      000013 27 03            [ 1]  509 	jreq 1$ 
      000015 CC 16 88         [ 2]  510 0$:	jp syntax_error 
      000017                        511 1$: 
      000019 1E 01            [ 2]  512 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      00001A CD 13 86         [ 4]  513 	call strlen 
      00001B AB 05            [ 1]  514 	add a,#REC_XTRA_BYTES
      00001C 6B 04            [ 1]  515 	ld (REC_LEN+1,sp),a 
      00001E CD 1D 50         [ 4]  516 	call search_name 
      000020 5D               [ 2]  517 	tnzw x 
      000021 27 EE            [ 1]  518 	jreq 0$ 
      000023 F6               [ 1]  519 	ld a,(x)
      000024 2A 05            [ 1]  520 	jrpl 2$
      000025 A6 11            [ 1]  521 	ld a,#ERR_RD_ONLY 
      000027 CC 16 8A         [ 2]  522 	jp tb_error 
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
      009406 72 5C 00 1A      [ 1]  529 	inc ptr8 
      009406 89 4F 7D 27      [ 5]  530 	ldw [ptr16],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0017EC                        531 9$: _drop VSIZE 	
      00940A 04 4C            [ 2]    1     addw sp,#VSIZE 
      00940C 5C               [ 4]  532 	ret 
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
      0017EF                        544 next_token::
                                    545 ;	clrw x 
      00940D 20 F9 85         [ 1]  546 	ld a,in 
      009410 81 00 03         [ 1]  547 	ld in.saved,a ; in case "_unget_token" needed 
                                    548 ; don't replace sub by "cp a,count" 
                                    549 ; if end of line must return with A=0   	
      009411 C0 00 02         [ 1]  550 	sub a,count 
      009411 F6 27            [ 1]  551 	jreq 9$ ; end of line 
      0017FA                        552 0$: 
      009413 0B 90 F1         [ 2]  553 	ldw x,basicptr 
      009416 26 05 5C 90      [ 2]  554 	addw x,in.w 
      00941A 5C               [ 1]  555 	ld a,(x)
      00941B 20               [ 1]  556 	incw x
      00941C F4 5C 00 01      [ 1]  557 	inc in   
      00941D 81               [ 4]  558 9$: ret 
                                    559 
                                    560 ;-------------------------
                                    561 ;  skip .asciz in BASIC line 
                                    562 ;  name 
                                    563 ;  input:
                                    564 ;     x		* string 
                                    565 ;  output:
                                    566 ;     none 
                                    567 ;-------------------------
      001808                        568 skip_string:
      00941D 4F               [ 1]  569 	ld a,(x)
      00941E 81 03            [ 1]  570 	jreq 1$
      00941F 5C               [ 1]  571 	incw x 
      00941F A6 01            [ 2]  572 	jra skip_string 
      009421 81               [ 1]  573 1$: incw x 	
      009422 72 B0 00 04      [ 2]  574 	subw x,basicptr 
      009422 88 89 90         [ 2]  575 	ldw in.w,x 
      009425 F6               [ 4]  576 	ret 
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
      001817                        587 get_addr:
      009426 27               [ 2]  588 	ldw x,(x)
      009427 06 F7 5C 90      [ 1]  589 	inc in 
      00942B 5C 20 F6 7F      [ 1]  590 	inc in 
      00942F 85               [ 4]  591 	ret 
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
      001821                        602 get_int24:
      009430 84               [ 1]  603 	ld a,(x)
      009431 81 01            [ 2]  604 	ldw x,(1,x)
                                    605 ; skip 3 bytes 
      009432 72 5C 00 01      [ 1]  606 	inc in 
      009432 88 52 02 0F      [ 1]  607 	inc in 
      009436 01 0F 02 90      [ 1]  608 	inc in 
      00943A 89               [ 4]  609 	ret 
                                    610 
                                    611 ;-------------------------
                                    612 ; get character from 
                                    613 ; BASIC code 
                                    614 ; input:
                                    615 ;    X   *char 
                                    616 ; output:
                                    617 ;    A    char 
                                    618 ;-------------------------
      001831                        619 get_char:
      00943B 13               [ 1]  620 	ld a,(x)
      00943C 01 90 85 27      [ 1]  621 	inc in  
      009440 31               [ 4]  622     ret 
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
      001837                        634 prt_i16:
      009441 2B 0E 00 0C      [ 1]  635 	clr acc24 
      009443 CF 00 0D         [ 2]  636 	ldw acc16,x 
      009443 72 BB            [ 1]  637 	ld a,#16
      009445 00 0E 72         [ 1]  638 	cp a,base
      009448 B9 00            [ 1]  639 	jreq prt_acc24  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00944A 0E 03 01 03 02   [ 2]  640 	btjf acc16,#7,prt_acc24
      00944F 20 05 00 0C      [ 1]  641 	cpl acc24 ; sign extend 
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
      009451                        653 prt_acc24:
      009451 5A 90            [ 1]  654 	ld a,#255  ; signed conversion  
      009453 5A 0C 02         [ 4]  655     call itoa  ; conversion entier en  .asciz
      009456 CD 11 40         [ 4]  656 	call right_align  
      009456 C6               [ 1]  657 	push a 
      009457 00 0E CA         [ 4]  658 	call puts
      00945A 00               [ 1]  659 	pop a 
      00945B 0F               [ 4]  660     ret	
                                    661 
                                    662 ;---------------------------------------
                                    663 ;  print value at xstack top 
                                    664 ;---------------------------------------
      00185C                        665 print_top: 
      00185C                        666 	_xpop 
      00945C 27 14            [ 1]    1     ld a,(y)
      00945E 72               [ 1]    2     ldw x,y 
      00945F FB 01            [ 2]    3     ldw x,(1,x)
      009461 72 F9 01 90      [ 2]    4     addw y,#CELL_SIZE 
      009465 F6 F7 89         [ 1]  667 	ld acc24,a 
      009468 CE 00 0E         [ 2]  668 	ldw acc16,x 
      00946B 5A CF 00         [ 4]  669 	call prt_acc24 
      00946E 0E 85            [ 1]  670 	ld a,#SPACE
      009470 20 E4 FF         [ 4]  671 	call putc 
      009472 81               [ 4]  672 	ret 
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
      001874                        688 itoa::
      001874                        689 	_vars VSIZE
      009472 5B 02            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009474 84 81            [ 1]  690 	clr (LEN,sp) ; string length  
      009476 0F 01            [ 1]  691 	clr (SIGN,sp)    ; sign
      009476 89               [ 1]  692 	tnz A
      009477 88 AE            [ 1]  693 	jreq 1$ ; unsigned conversion  
      009479 00 36 A6         [ 1]  694 	ld a,base 
      00947C 4E 7F            [ 1]  695 	cp a,#10
      00947E 5C 4A            [ 1]  696 	jrne 1$
                                    697 	; base 10 string display with negative sign if bit 23==1
      009480 26 FB 84 85 81   [ 2]  698 	btjf acc24,#7,1$
      009485 0A 0A            [ 1]  699 	cpl (SIGN,sp)
      009487 54 69 6E         [ 4]  700 	call neg_acc24
      00188E                        701 1$:
                                    702 ; initialize string pointer 
      00948A 79 20 42         [ 2]  703 	ldw x,#tib 
      00948D 41 53 49         [ 2]  704 	addw x,#TIB_SIZE
      009490 43               [ 2]  705 	decw x 
      009491 20               [ 1]  706 	clr (x)
      001896                        707 itoa_loop:
      009492 66 6F 72         [ 1]  708     ld a,base
      009495 20 53 54         [ 4]  709     call divu24_8 ; acc24/A 
      009498 4D 38            [ 1]  710     add a,#'0  ; remainder of division
      00949A 0A 43            [ 1]  711     cp a,#'9+1
      00949C 6F 70            [ 1]  712     jrmi 2$
      00949E 79 72            [ 1]  713     add a,#7 
      0018A4                        714 2$:	
      0094A0 69               [ 2]  715 	decw x
      0094A1 67               [ 1]  716     ld (x),a
      0094A2 68 74            [ 1]  717 	inc (LEN,sp)
                                    718 	; if acc24==0 conversion done
      0094A4 2C 20 4A         [ 1]  719 	ld a,acc24
      0094A7 61 63 71         [ 1]  720 	or a,acc16
      0094AA 75 65 73         [ 1]  721 	or a,acc8
      0094AD 20 44            [ 1]  722     jrne itoa_loop
                                    723 	;conversion done, next add '$' or '-' as required
      0094AF 65 73 63         [ 1]  724 	ld a,base 
      0094B2 68 65            [ 1]  725 	cp a,#16
      0094B4 6E 65            [ 1]  726 	jreq 8$
      0094B6 73 20            [ 1]  727 	ld a,(SIGN,sp)
      0094B8 32 30            [ 1]  728     jreq 10$
      0094BA 31 39            [ 1]  729     ld a,#'-
      0094BC 2C 32            [ 2]  730 	jra 9$ 
      0018C2                        731 8$:	
      0094BE 30 32            [ 1]  732 	ld a,#'$ 
      0094C0 32               [ 2]  733 9$: decw x
      0094C1 0A               [ 1]  734     ld (x),a
      0094C2 76 65            [ 1]  735 	inc (LEN,sp)
      0018C8                        736 10$:
      0094C4 72 73            [ 1]  737 	ld a,(LEN,sp)
      0018CA                        738 	_drop VSIZE
      0094C6 69 6F            [ 2]    1     addw sp,#VSIZE 
      0094C8 6E               [ 4]  739 	ret
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
      0018CD                        748 to_upper::
      0094C9 20 00            [ 1]  749 	cp a,#'a
      0094CB 2A 01            [ 1]  750 	jrpl 1$
      0094CB AE               [ 4]  751 0$:	ret
      0094CC 94 85            [ 1]  752 1$: cp a,#'z	
      0094CE CD 89            [ 1]  753 	jrugt 0$
      0094D0 DC A6            [ 1]  754 	sub a,#32
      0094D2 02               [ 4]  755 	ret
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
      0018D9                        771 atoi24::
      0018D9                        772 	_vars VSIZE
      0094D3 C7 00            [ 2]    1     sub sp,#VSIZE 
      0094D5 0F 5F            [ 2]  773 	ldw (XTEMP,sp),x 
                                    774 ; conversion made on xstack 
      0094D7 CF               [ 1]  775 	clr a 
      0094D8 00               [ 1]  776 	clrw x 
      0018DF                        777 	_xpush 
      0094D9 0D 72 5F 00      [ 2]    1     subw y,#CELL_SIZE
      0094DD 24 35            [ 1]    2     ld (y),a 
      0094DF 0A 00 0B         [ 2]    3     ldw (1,y),x 
      0094E2 CD 98            [ 1]  778 	clr (SIGN,sp)
      0094E4 CE A6            [ 1]  779 	ld a,#10
      0094E6 2E CD            [ 1]  780 	ld (BASE,sp),a ; default base decimal
      0094E8 89 7F            [ 2]  781 	ldw x,(XTEMP,sp)
      0094EA A6               [ 1]  782 	ld a,(x)
      0094EB 00 C7            [ 1]  783 	jreq 9$  ; completed if 0
      0094ED 00 0F            [ 1]  784 	cp a,#'-
      0094EF 5F CF            [ 1]  785 	jrne 1$
      0094F1 00 0D            [ 1]  786 	cpl (SIGN,sp)
      0094F3 CD 98            [ 2]  787 	jra 2$
      0094F5 CE A6            [ 1]  788 1$: cp a,#'$
      0094F7 0D CD            [ 1]  789 	jrne 3$
      0094F9 89 7F            [ 1]  790 	ld a,#16
      0094FB 81 02            [ 1]  791 	ld (BASE,sp),a
      0094FC 5C               [ 1]  792 2$:	incw x
      0094FC 90 AE            [ 2]  793 	ldw (XTEMP,sp),x 
      0094FE 17               [ 1]  794 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      001907                        795 3$:	; char to digit 
      0094FF 73 72            [ 1]  796 	cp a,#'a
      009501 5F 00            [ 1]  797 	jrmi 4$
      009503 23 72            [ 1]  798 	sub a,#32
      009505 5F 00            [ 1]  799 4$:	cp a,#'0
      009507 20 35            [ 1]  800 	jrmi 9$
      009509 04 00            [ 1]  801 	sub a,#'0
      00950B 24 35            [ 1]  802 	cp a,#10
      00950D 0A 00            [ 1]  803 	jrmi 5$
      00950F 0B AE            [ 1]  804 	sub a,#7
      009511 00 00            [ 1]  805 	cp a,(BASE,sp)
      009513 CF 00            [ 1]  806 	jrpl 9$
      009515 05 CF            [ 1]  807 5$:	ld (TEMP,sp),a
      009517 00 01            [ 1]  808 	ld a,(BASE,sp)
      009519 72 5F 00         [ 4]  809 	call mulu24_8
      001924                        810 	_xpush 
      00951C 03 81 00 03      [ 2]    1     subw y,#CELL_SIZE
      00951E 90 F7            [ 1]    2     ld (y),a 
      00951E 89 72 5F         [ 2]    3     ldw (1,y),x 
      009521 00               [ 1]  811 	clrw x 
      009522 03 72            [ 1]  812 	ld a,(TEMP,sp)
      009524 5F               [ 1]  813 	rlwa x 
      001931                        814 	_xpush 
      009525 00 02 AE 00      [ 2]    1     subw y,#CELL_SIZE
      009529 90 CF            [ 1]    2     ld (y),a 
      00952B 00 1C CF         [ 2]    3     ldw (1,y),x 
      00952E 00 1E CF         [ 4]  815 	call add24 
      009531 00 31            [ 2]  816 	ldw x,(XTEMP,sp)
      009533 CF 00            [ 2]  817 	jra 2$
      009535 33 CD            [ 1]  818 9$:	tnz (SIGN,sp)
      009537 94 76            [ 1]  819     jreq atoi_exit
      009539 72 5F 00         [ 4]  820     call neg24
      001948                        821 atoi_exit:
      001948                        822 	_xpop 
      00953C 35 85            [ 1]    1     ld a,(y)
      00953E 81               [ 1]    2     ldw x,y 
      00953F EE 01            [ 2]    3     ldw x,(1,x)
      00953F 00 00 95 65      [ 2]    4     addw y,#CELL_SIZE 
      009543 95 72 95         [ 1]  823 	ld acc24,a 
      009546 80 95 99         [ 2]  824 	ldw acc16,x  
      001957                        825 	_drop VSIZE
      009549 95 A8            [ 2]    1     addw sp,#VSIZE 
      00954B 95               [ 4]  826 	ret
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
      00195A                        847 search_dict::
      00195A                        848 	_vars VSIZE 
      00954C BE 95            [ 2]    1     sub sp,#VSIZE 
      00954E D4 95            [ 2]  849 	ldw (YSAVE,sp),y 
      00195E                        850 search_next:
      009550 EE 95            [ 2]  851 	ldw (XSAVE,sp),x 
                                    852 ; get name length in dictionary	
      009552 FF               [ 1]  853 	ld a,(x)
      009553 96 10            [ 1]  854 	and a,#0xf 
      009555 96 1C            [ 1]  855 	ld (NLEN,sp),a  
      009557 96 4F            [ 2]  856 	ldw y,(YSAVE,sp) ; name pointer 
      009559 96               [ 1]  857 	incw x 
      001968                        858 cp_loop:
      00955A 5F 96            [ 1]  859 	ld a,(y)
      00955C 73 96            [ 1]  860 	jreq str_match 
      00955E 86 96            [ 1]  861 	tnz (NLEN,sp)
      009560 93 96            [ 1]  862 	jreq no_match  
      009562 9D               [ 1]  863 	cp a,(x)
      009563 96 B9            [ 1]  864 	jrne no_match 
      009565 4D 65            [ 1]  865 	incw y 
      009567 6D               [ 1]  866 	incw x
      009568 6F 72            [ 1]  867 	dec (NLEN,sp)
      00956A 79 20            [ 2]  868 	jra cp_loop 
      00197A                        869 no_match:
      00956C 66 75            [ 2]  870 	ldw x,(XSAVE,sp) 
      00956E 6C 6C 0A         [ 2]  871 	subw x,#2 ; move X to link field
      009571 00 73            [ 1]  872 	push #TK_NONE 
      009573 79               [ 2]  873 	ldw x,(x) ; next word link 
      009574 6E               [ 1]  874 	pop a ; TK_NONE 
      009575 74 61            [ 1]  875 	jreq search_exit  ; not found  
                                    876 ;try next 
      009577 78 20            [ 2]  877 	jra search_next
      001987                        878 str_match:
      009579 65 72            [ 2]  879 	ldw x,(XSAVE,sp)
      00957B 72               [ 1]  880 	ld a,(X)
      00957C 6F 72            [ 1]  881 	ld (NLEN,sp),a ; needed to test keyword type  
      00957E 0A 00            [ 1]  882 	and a,#NLEN_MASK 
                                    883 ; move x to procedure address field 	
      009580 6D               [ 1]  884 	inc a 
      009581 61 74 68         [ 1]  885 	ld acc8,a 
      009584 20 6F 70 65      [ 1]  886 	clr acc16 
      009588 72 61 74 69      [ 2]  887 	addw x,acc16 
      00958C 6F               [ 2]  888 	ldw x,(x) ; routine address  
                                    889 ;determine keyword type bits 7:4 
      00958D 6E 20            [ 1]  890 	ld a,(NLEN,sp)
      00958F 6F 76            [ 1]  891 	and a,#KW_TYPE_MASK 
      009591 65               [ 1]  892 	swap a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      009592 72 66            [ 1]  893 	add a,#128
      0019A2                        894 search_exit: 
      0019A2                        895 	_drop VSIZE 
      009594 6C 6F            [ 2]    1     addw sp,#VSIZE 
      009596 77               [ 4]  896 	ret 
                                    897 
                                    898 ;---------------------
                                    899 ; check if next token
                                    900 ;  is of expected type 
                                    901 ; input:
                                    902 ;   A 		 expected token attribute
                                    903 ;  ouput:
                                    904 ;   none     if fail call syntax_error 
                                    905 ;--------------------
      0019A5                        906 expect:
      009597 0A               [ 1]  907 	push a 
      009598 00 64 69         [ 4]  908 	call next_token 
      00959B 76 69            [ 1]  909 	cp a,(1,sp)
      00959D 73 69            [ 1]  910 	jreq 1$
      00959F 6F 6E 20         [ 2]  911 	jp syntax_error
      0095A2 62               [ 1]  912 1$: pop a 
      0095A3 79               [ 4]  913 	ret 
                                    914 
                                    915 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    916 ; parse arguments list 
                                    917 ; between ()
                                    918 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019B2                        919 func_args:
      0095A4 20 30            [ 1]  920 	ld a,#TK_LPAREN 
      0095A6 0A 00 69         [ 4]  921 	call expect 
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
      0019B7                        937 arg_list:
      0095A9 6E 76            [ 1]  938 	push #0
      0095AB 61 6C 69         [ 4]  939 1$:	call condition 
      0095AE 64               [ 1]  940 	tnz a 
      0095AF 20 6C            [ 1]  941 	jreq 7$  
      0095B1 69 6E            [ 1]  942 	inc (1,sp)
      0095B3 65 20 6E         [ 4]  943 	call next_token 
      0095B6 75 6D            [ 1]  944 	cp a,#TK_COMMA 
      0095B8 62 65            [ 1]  945 	jreq 1$ 
      0095BA 72 2E            [ 1]  946 	cp a,#TK_RPAREN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0095BC 0A 00            [ 1]  947 	jreq 7$
      0019CC                        948 	_unget_token 
      0095BE 72 75 6E 20 74   [ 1]    1      mov in,in.saved  
      0095C3 69               [ 1]  949 7$:	pop a  
      0095C4 6D               [ 4]  950 	ret 
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
      0019D3                        978 get_array_element:
      0095C5 65 20 6F         [ 4]  979 	call func_args 
      0095C8 6E 6C            [ 1]  980 	cp a,#1
      0095CA 79 20            [ 1]  981 	jreq 1$
      0095CC 75 73 61         [ 2]  982 	jp syntax_error
      0019DD                        983 1$: _xpop 
      0095CF 67 65            [ 1]    1     ld a,(y)
      0095D1 2E               [ 1]    2     ldw x,y 
      0095D2 0A 00            [ 2]    3     ldw x,(1,x)
      0095D4 63 6F 6D 6D      [ 2]    4     addw y,#CELL_SIZE 
                                    984     ; ignore A, index < 65536 in any case 
                                    985 	; check for bounds 
      0095D8 61 6E 64         [ 2]  986 	cpw x,array_size 
      0095DB 20 6C            [ 2]  987 	jrule 3$
                                    988 ; bounds {1..array_size}	
      0095DD 69 6E            [ 1]  989 2$: ld a,#ERR_BAD_VALUE 
      0095DF 65 20 6F         [ 2]  990 	jp tb_error 
      0095E2 6E               [ 2]  991 3$: tnzw  x
      0095E3 6C 79            [ 1]  992 	jreq 2$ 
      0095E5 20               [ 2]  993 	pushw x 
      0095E6 75               [ 2]  994 	sllw x 
      0095E7 73 61 67         [ 2]  995 	addw x,(1,sp) ; index*size_of(int24)
      0095EA 65 2E            [ 2]  996 	ldw (1,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0095EC 0A 00 64         [ 2]  997 	ldw x,#tib ; array is below tib 
      0095EF 75 70 6C         [ 2]  998 	subw x,(1,sp)
      001A00                        999 	_drop 2   
      0095F2 69 63            [ 2]    1     addw sp,#2 
      0095F4 61               [ 4] 1000 	ret 
                                   1001 
                                   1002 
                                   1003 ;***********************************
                                   1004 ;   expression parse,execute 
                                   1005 ;***********************************
                                   1006 ;-----------------------------------
                                   1007 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1008 ;			 integer | function |
                                   1009 ;			 '('relation')' 
                                   1010 ; output:
                                   1011 ;   A       token attribute 
                                   1012 ;   xstack  value  
                                   1013 ; ---------------------------------
                           000001  1014 	NEG=1
                           000001  1015 	VSIZE=1
      001A03                       1016 factor:
      001A03                       1017 	_vars VSIZE 
      0095F5 74 65            [ 2]    1     sub sp,#VSIZE 
      0095F7 20 6E            [ 1] 1018 	clr (NEG,sp)
      0095F9 61 6D 65         [ 4] 1019 	call next_token
      0095FC 2E               [ 1] 1020 	tnz a 
      0095FD 0A 00            [ 1] 1021 	jrne 1$ 
      0095FF 46 69 6C         [ 2] 1022 	jp 22$ 
      009602 65 20            [ 1] 1023 1$:	cp a,#TK_PLUS 
      009604 6E 6F            [ 1] 1024 	jreq 2$
      009606 74 20            [ 1] 1025 	cp a,#TK_MINUS 
      009608 66 6F            [ 1] 1026 	jrne 4$ 
      00960A 75 6E            [ 1] 1027 	cpl (NEG,sp)
      001A1A                       1028 2$:	
      00960C 64 2E 0A         [ 4] 1029 	call next_token
      001A1D                       1030 4$:
      00960F 00               [ 1] 1031 	tnz a 
      009610 62 61            [ 1] 1032 	jrne 41$ 
      009612 64 20 76         [ 2] 1033 	jp syntax_error  
      001A23                       1034 41$:	
      009615 61 6C            [ 1] 1035 	cp a,#TK_IFUNC 
      009617 75 65            [ 1] 1036 	jrne 5$ 
      001A27                       1037 	_get_code_addr 
      009619 2E               [ 2]    1         ldw x,(x)
      00961A 0A 00 46 69      [ 1]    2         inc in 
      00961E 6C 65 20 69      [ 1]    3         inc in 
      009622 6E               [ 4] 1038 	call (x); result in A:X  
      009623 20 65            [ 2] 1039 	jra 18$ 
      001A33                       1040 5$:
      009625 78 74            [ 1] 1041 	cp a,#TK_INTGR
      009627 65 6E            [ 1] 1042 	jrne 6$
      009629 64 65 64         [ 4] 1043 	call get_int24 ; A:X
      00962C 20 6D            [ 2] 1044 	jra 18$
      001A3C                       1045 6$:
      00962E 65 6D            [ 1] 1046 	cp a,#TK_ARRAY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009630 6F 72            [ 1] 1047 	jrne 7$
      009632 79 2C 20         [ 4] 1048 	call get_array_element
      009635 63 61            [ 2] 1049     jra 71$
      001A45                       1050 7$:
      009637 6E 27            [ 1] 1051 	cp a,#TK_VAR 
      009639 74 20            [ 1] 1052 	jrne 8$
      00963B 62 65 20         [ 4] 1053 	call get_addr 
      001A4C                       1054 71$: ; put value in A:X
      00963E 72               [ 1] 1055 	ld a,(x)
      00963F 75 6E            [ 2] 1056 	ldw x,(1,x)
      009641 20 66            [ 2] 1057 	jra 18$
      001A51                       1058 8$:
      009643 72 6F            [ 1] 1059 	cp a,#TK_LABEL 
      009645 6D 20            [ 1] 1060 	jrne 9$
      009647 74 68            [ 2] 1061 	pushw y  
      009649 65               [ 2] 1062 	pushw x 
      00964A 72 65 2E         [ 4] 1063 	call skip_string
      00964D 0A               [ 2] 1064 	popw x  
      00964E 00 4E 6F         [ 4] 1065 	call strlen 
      009651 20 64            [ 1] 1066 	add a,#REC_XTRA_BYTES
      009653 61 74 61         [ 4] 1067 	call search_name
      009656 20               [ 2] 1068 	tnzw x 
      009657 66 6F            [ 1] 1069 	jrne 82$ 
      009659 75 6E            [ 2] 1070 	popw y 
      00965B 64 2E            [ 2] 1071 	jra 16$
      001A6B                       1072 82$:
      00965D 0A 00            [ 2] 1073 	popw y   
      00965F 4E 6F 20         [ 4] 1074 	call get_value ; in A:X 
      009662 70 72            [ 2] 1075 	jra 18$
      001A72                       1076 9$: 
      009664 6F 67            [ 1] 1077 	cp a,#TK_CFUNC 
      009666 72 61            [ 1] 1078 	jrne 12$
      001A76                       1079 	_get_code_addr 
      009668 6D               [ 2]    1         ldw x,(x)
      009669 20 69 6E 20      [ 1]    2         inc in 
      00966D 52 41 4D 21      [ 1]    3         inc in 
      009671 0A               [ 4] 1080 	call(x)
      009672 00               [ 1] 1081 	clrw x 
      009673 46               [ 1] 1082 	rlwa x  ; char>int24 in A:X 
      009674 69 6C            [ 2] 1083 	jra 18$ 	 
      001A84                       1084 12$:			
      009676 65 20            [ 1] 1085 	cp a,#TK_LPAREN
      009678 73 79            [ 1] 1086 	jrne 16$
      00967A 73 74 65         [ 4] 1087 	call expression
      00967D 6D 20            [ 1] 1088 	ld a,#TK_RPAREN 
      00967F 66 75 6C         [ 4] 1089 	call expect
      001A90                       1090 	_xpop 
      009682 6C 2E            [ 1]    1     ld a,(y)
      009684 0A               [ 1]    2     ldw x,y 
      009685 00 42            [ 2]    3     ldw x,(1,x)
      009687 75 66 66 65      [ 2]    4     addw y,#CELL_SIZE 
      00968B 72 20            [ 2] 1091 	jra 18$	
      001A9B                       1092 16$:
      001A9B                       1093 	_unget_token 
      00968D 66 75 6C 6C 0A   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009692 00               [ 1] 1094 	clr a 
      009693 6F 76            [ 2] 1095 	jra 22$ 
      001AA3                       1096 18$: 
      009695 65 72            [ 1] 1097 	tnz (NEG,sp)
      009697 66 6C            [ 1] 1098 	jreq 20$
      009699 6F 77 0A         [ 4] 1099 	call neg_ax   
      001AAA                       1100 20$:
      001AAA                       1101 	_xpush 
      00969C 00 63 6F 6E      [ 2]    1     subw y,#CELL_SIZE
      0096A0 73 74            [ 1]    2     ld (y),a 
      0096A2 61 6E 74         [ 2]    3     ldw (1,y),x 
      0096A5 20 63            [ 1] 1102 	ld a,#TK_INTGR
      001AB5                       1103 22$:
      001AB5                       1104 	_drop VSIZE
      0096A7 61 6E            [ 2]    1     addw sp,#VSIZE 
      0096A9 27               [ 4] 1105 	ret
                                   1106 
                                   1107 
                                   1108 ;-----------------------------------
                                   1109 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1110 ; output:
                                   1111 ;   A    	token attribute 
                                   1112 ;	xstack		value 
                                   1113 ;-----------------------------------
                           000001  1114 	MULOP=1
                           000001  1115 	VSIZE=1
      001AB8                       1116 term:
      001AB8                       1117 	_vars VSIZE
      0096AA 74 20            [ 2]    1     sub sp,#VSIZE 
                                   1118 ; first factor 	
      0096AC 62 65 20         [ 4] 1119 	call factor
      0096AF 6D               [ 1] 1120 	tnz a 
      0096B0 6F 64            [ 1] 1121 	jreq term_exit  
      001AC0                       1122 term01:	 ; check for  operator '*'|'/'|'%' 
      0096B2 69 66 69         [ 4] 1123 	call next_token
      0096B5 65 64            [ 1] 1124 	ld (MULOP,sp),a
      0096B7 0A 00            [ 1] 1125 	and a,#TK_GRP_MASK
      0096B9 6E 6F            [ 1] 1126 	cp a,#TK_GRP_MULT
      0096BB 20 70            [ 1] 1127 	jreq 1$
      0096BD 72 6F            [ 1] 1128 	ld a,#TK_INTGR
      001ACD                       1129 	_unget_token 
      0096BF 67 72 61 6D 20   [ 1]    1      mov in,in.saved  
      0096C4 61 74            [ 2] 1130 	jra term_exit 
      001AD4                       1131 1$:	; got *|/|%
                                   1132 ;second factor
      0096C6 20 74 68         [ 4] 1133 	call factor
      0096C9 69               [ 1] 1134 	tnz a 
      0096CA 73 20            [ 1] 1135 	jrne 2$ 
      0096CC 61 64 64         [ 2] 1136 	jp syntax_error 
      001ADD                       1137 2$: ; select operation 	
      0096CF 72 65            [ 1] 1138 	ld a,(MULOP,sp) 
      0096D1 73 73            [ 1] 1139 	cp a,#TK_MULT 
      0096D3 0A 00            [ 1] 1140 	jrne 3$
                                   1141 ; '*' operator
      0096D5 0A 72 75         [ 4] 1142 	call mul24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0096D8 6E 20            [ 2] 1143 	jra term01
      0096DA 74 69            [ 1] 1144 3$: cp a,#TK_DIV 
      0096DC 6D 65            [ 1] 1145 	jrne 4$ 
                                   1146 ; '/' operator	
      0096DE 20 65 72         [ 4] 1147 	call div24 
      0096E1 72 6F            [ 2] 1148 	jra term01 
      001AF1                       1149 4$: ; '%' operator
      0096E3 72 2C 20         [ 4] 1150 	call mod24
      0096E6 00 0A            [ 2] 1151 	jra term01 
      001AF6                       1152 9$: 
      0096E8 63 6F            [ 1] 1153 	ld a,#TK_INTGR
      001AF8                       1154 term_exit:
      001AF8                       1155 	_drop VSIZE 
      0096EA 6D 70            [ 2]    1     addw sp,#VSIZE 
      0096EC 69               [ 4] 1156 	ret 
                                   1157 
                                   1158 ;-------------------------------
                                   1159 ;  expr ::= term [['+'|'-'] term]*
                                   1160 ;  result range {-32768..32767}
                                   1161 ;  output:
                                   1162 ;   A    token attribute 
                                   1163 ;   xstack	 result    
                                   1164 ;-------------------------------
                           000001  1165 	OP=1 
                           000001  1166 	VSIZE=1 
      001AFB                       1167 expression:
      001AFB                       1168 	_vars VSIZE 
      0096ED 6C 65            [ 2]    1     sub sp,#VSIZE 
                                   1169 ; first term 	
      0096EF 20 65 72         [ 4] 1170 	call term
      0096F2 72               [ 1] 1171 	tnz a 
      0096F3 6F 72            [ 1] 1172 	jreq 9$
      001B03                       1173 1$:	; operator '+'|'-'
      0096F5 2C 20 00         [ 4] 1174 	call next_token
      0096F8 6C 61            [ 1] 1175 	ld (OP,sp),a 
      0096FA 73 74            [ 1] 1176 	and a,#TK_GRP_MASK
      0096FC 20 74            [ 1] 1177 	cp a,#TK_GRP_ADD 
      0096FE 6F 6B            [ 1] 1178 	jreq 2$ 
      001B0E                       1179 	_unget_token 
      009700 65 6E 20 69 64   [ 1]    1      mov in,in.saved  
      009705 3A 20            [ 1] 1180 	ld a,#TK_INTGR
      009707 00 19            [ 2] 1181 	jra 9$ 
      009708                       1182 2$: ; second term 
      009708 A6 02 B8         [ 4] 1183 	call term
      00970A 4D               [ 1] 1184 	tnz a 
      00970A 72 0A            [ 1] 1185 	jrne 3$
      00970C 00 23 4C         [ 2] 1186 	jp syntax_error
      001B20                       1187 3$:
      00970F 88 AE            [ 1] 1188 	ld a,(OP,sp)
      009711 96 D5            [ 1] 1189 	cp a,#TK_PLUS 
      009713 CD 89            [ 1] 1190 	jrne 4$
                                   1191 ; '+' operator	
      009715 DC 84 AE         [ 4] 1192 	call add24
      009718 95 3F            [ 2] 1193 	jra 1$ 
      001B2B                       1194 4$:	; '-' operator 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00971A 72 5F 00         [ 4] 1195 	call sub24
      00971D 0E 48            [ 2] 1196 	jra 1$
      001B30                       1197 9$:
      001B30                       1198 	_drop VSIZE 
      00971F 72 59            [ 2]    1     addw sp,#VSIZE 
      009721 00               [ 4] 1199 	ret 
                                   1200 
                                   1201 ;---------------------------------------------
                                   1202 ; rel ::= expr rel_op expr
                                   1203 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1204 ;  relation return  integer , zero is false 
                                   1205 ;  output:
                                   1206 ;	 xstack		value  
                                   1207 ;---------------------------------------------
                           000001  1208 	RELOP=1
                           000001  1209 	VSIZE=1 
      001B33                       1210 relation: 
      001B33                       1211 	_vars VSIZE
      009722 0E C7            [ 2]    1     sub sp,#VSIZE 
      009724 00 0F 72         [ 4] 1212 	call expression
      009727 BB               [ 1] 1213 	tnz a 
      009728 00 0E            [ 1] 1214 	jreq 9$ 
                                   1215 ; expect rel_op or leave 
      00972A FE CD 89         [ 4] 1216 	call next_token 
      00972D DC CE            [ 1] 1217 	ld (RELOP,sp),a 
      00972F 00 05            [ 1] 1218 	and a,#TK_GRP_MASK
      009731 C6 00            [ 1] 1219 	cp a,#TK_GRP_RELOP 
      009733 03 90            [ 1] 1220 	jreq 2$
      009735 5F 90            [ 1] 1221 	ld a,#TK_INTGR 
      001B48                       1222 	_unget_token 
      009737 02 CD 86 C5 CE   [ 1]    1      mov in,in.saved  
      00973C 00 05            [ 2] 1223 	jra 9$ 
      001B4F                       1224 2$:	; expect another expression
      00973E C6 00 02         [ 4] 1225 	call expression
      009741 CD               [ 1] 1226 	tnz a 
      009742 A0 19            [ 1] 1227 	jrne 3$
      009744 AE 96 F8         [ 2] 1228 	jp syntax_error 
      001B58                       1229 3$: 
      009747 CD 89 DC         [ 4] 1230 	call cp24 
      001B5B                       1231 	_xpop  
      00974A C6 00            [ 1]    1     ld a,(y)
      00974C 04               [ 1]    2     ldw x,y 
      00974D 5F 97            [ 2]    3     ldw x,(1,x)
      00974F 72 BB 00 05      [ 2]    4     addw y,#CELL_SIZE 
      009753 F6               [ 1] 1232 	tnz a 
      009754 5F 97            [ 1] 1233 	jrmi 4$
      009756 CD 98            [ 1] 1234 	jrne 5$
      009758 B7 20 35 0E      [ 1] 1235 	mov acc8,#2 ; i1==i2
      00975B 20 0A            [ 2] 1236 	jra 6$ 
      001B6F                       1237 4$: ; i1<i2
      00975B 88 AE 96 E7      [ 1] 1238 	mov acc8,#4 
      00975F CD 89            [ 2] 1239 	jra 6$
      001B75                       1240 5$: ; i1>i2
      009761 DC 84 AE 95      [ 1] 1241 	mov acc8,#1  
      001B79                       1242 6$: ; 0=false, -1=true 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009765 3F               [ 1] 1243 	clrw x 
      009766 72 5F 00         [ 1] 1244 	ld a, acc8  
      009769 0E 48            [ 1] 1245 	and a,(RELOP,sp)
      00976B 72 59            [ 1] 1246 	jreq 7$
      00976D 00               [ 2] 1247 	cplw x 
      00976E 0E C7            [ 1] 1248 	ld a,#255 
      001B84                       1249 7$:	_xpush 
      009770 00 0F 72 BB      [ 2]    1     subw y,#CELL_SIZE
      009774 00 0E            [ 1]    2     ld (y),a 
      009776 FE CD 89         [ 2]    3     ldw (1,y),x 
      009779 DC AE            [ 1] 1250 	ld a,#TK_INTGR
      001B8F                       1251 9$: 
      001B8F                       1252 	_drop VSIZE
      00977B 16 90            [ 2]    1     addw sp,#VSIZE 
      00977D CD               [ 4] 1253 	ret 
                                   1254 
                                   1255 ;-------------------------------------------
                                   1256 ;  AND factor:  [NOT] relation | (condition)
                                   1257 ;  output:
                                   1258 ;     A      TK_INTGR|0
                                   1259 ;-------------------------------------------
                           000001  1260 	NOT_OP=1
      001B92                       1261 and_factor:
      00977E 89 DC            [ 1] 1262 	push #0 
      009780 A6 0D CD         [ 4] 1263 0$:	call next_token  
      009783 89               [ 1] 1264 	tnz a 
      009784 7F CE            [ 1] 1265 	jreq 8$ 
      009786 00 01            [ 1] 1266 	cp a,#TK_NOT 
      009788 CD 8A            [ 1] 1267 	jrne 1$ 
      00978A 49 A6            [ 1] 1268 	cpl (NOT_OP,sp)
      00978C 5E CD            [ 2] 1269 	jra 0$ 
      001BA2                       1270 1$:	
      00978E 89 7F            [ 1] 1271 	cp a,#TK_LPAREN 
      009790 AE 17            [ 1] 1272 	jrne 2$
      009792 FF 94 14         [ 4] 1273 	call condition
      009794 A6 07            [ 1] 1274 	ld a,#TK_RPAREN 
      009794 CD 94 FC         [ 4] 1275 	call expect
      009797 20 08            [ 2] 1276 	jra 3$
      001BB0                       1277 2$: _unget_token 
      009797 A6 0D CD 89 7F   [ 1]    1      mov in,in.saved  
      00979C A6 3E CD         [ 4] 1278 	call relation
      001BB8                       1279 3$:
      00979F 89 7F            [ 1] 1280 	tnz (NOT_OP,sp)
      0097A1 CD 8A            [ 1] 1281 	jreq 8$ 
      0097A3 E1 72 5D         [ 4] 1282 	call cpl24
      001BBF                       1283 8$:
      001BBF                       1284 	_drop 1  
      0097A6 00 03            [ 2]    1     addw sp,#1 
      0097A8 27               [ 4] 1285     ret 
                                   1286 
                                   1287 
                                   1288 ;--------------------------------------------
                                   1289 ;  AND operator as priority over OR||XOR 
                                   1290 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1291 ;          
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                   1292 ;  output:
                                   1293 ;     A     TK_INTGR|0
                                   1294 ;    xtack   value 
                                   1295 ;--------------------------------------------
      001BC2                       1296 and_cond:
      0097A9 ED CD 91         [ 4] 1297 	call and_factor
      0097AC 16               [ 1] 1298 	tnz a 
      0097AD 72 5D            [ 1] 1299 	jreq 9$  
      0097AF 00 03 27         [ 4] 1300 1$: call next_token 
      0097B2 E4               [ 1] 1301 	tnz a 
      0097B3 27 43            [ 1] 1302 	jreq 6$ 
      0097B3 C6 00            [ 1] 1303 	cp a,#TK_AND 
      0097B5 02 C1            [ 1] 1304 	jreq 3$
      001BD2                       1305 	_unget_token 
      0097B7 00 03 2B 20 01   [ 1]    1      mov in,in.saved  
      0097BB 20 38            [ 2] 1306 	jra 6$ 
      0097BB 72 01 00         [ 4] 1307 3$:	call and_factor  
      0097BE 23               [ 1] 1308 	tnz a 
      0097BF D7 CE            [ 1] 1309 	jrne 4$
      0097C1 00 05 72         [ 2] 1310 	jp syntax_error 
      001BE2                       1311 4$:	
      001BE2                       1312 	_xpop 
      0097C4 BB 00            [ 1]    1     ld a,(y)
      0097C6 01               [ 1]    2     ldw x,y 
      0097C7 C3 00            [ 2]    3     ldw x,(1,x)
      0097C9 1E 2B 03 CD      [ 2]    4     addw y,#CELL_SIZE 
      0097CD A5 F2 CF         [ 1] 1313 	ld acc24,a 
      0097D0 00 05 E6         [ 2] 1314 	ldw acc16,x
      001BF1                       1315 	_xpop 
      0097D3 02 C7            [ 1]    1     ld a,(y)
      0097D5 00               [ 1]    2     ldw x,y 
      0097D6 03 35            [ 2]    3     ldw x,(1,x)
      0097D8 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      0097DB C4 00 0C         [ 1] 1316 	and a,acc24 
      0097DB CD               [ 1] 1317 	rlwa x 
      0097DC 98 6F A1         [ 1] 1318 	and a,acc16 
      0097DF 00               [ 1] 1319 	rlwa x 
      0097E0 27 D9 A1         [ 1] 1320 	and a,acc8 
      0097E3 80               [ 1] 1321 	rlwa x
      001C06                       1322 	_xpush
      0097E4 26 0C FE 72      [ 2]    1     subw y,#CELL_SIZE
      0097E8 5C 00            [ 1]    2     ld (y),a 
      0097EA 02 72 5C         [ 2]    3     ldw (1,y),x 
      0097ED 00 02            [ 2] 1323 	jra 1$  
      0097EF FD 20            [ 1] 1324 6$: ld a,#TK_INTGR 
      0097F1 E9               [ 4] 1325 9$:	ret 	 
                                   1326 
                                   1327 
                                   1328 ;--------------------------------------------
                                   1329 ; condition for IF and UNTIL 
                                   1330 ; operators: OR,XOR 
                                   1331 ; format:  and_cond [ OP and_cond ]* 
                                   1332 ; output:
                                   1333 ;    A        INTGR|0 
                                   1334 ;    xstack   value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



                                   1335 ;--------------------------------------------
                           000001  1336 	ATMP=1
                           000002  1337 	OP=2
                           000002  1338 	VSIZE=2 
      0097F2                       1339 condition:
      001C14                       1340 	_vars VSIZE 
      0097F2 A1 85            [ 2]    1     sub sp,#VSIZE 
      0097F4 26 05 CD         [ 4] 1341 	call and_cond
      0097F7 9D               [ 1] 1342 	tnz a 
      0097F8 66 20            [ 1] 1343 	jreq 9$ 
      0097FA E0 17 EF         [ 4] 1344 1$:	call next_token 
      0097FB A1 89            [ 1] 1345 	cp a,#TK_OR 
      0097FB A1 05            [ 1] 1346 	jreq 2$
      0097FD 26 05            [ 1] 1347 	cp a,#TK_XOR
      0097FF CD 9D            [ 1] 1348 	jreq 2$ 
      001C27                       1349 	_unget_token 
      009801 61 20 D7 00 01   [ 1]    1      mov in,in.saved  
      009804 20 55            [ 2] 1350 	jra 8$ 
      009804 A1 03            [ 1] 1351 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009806 26 05 CD         [ 4] 1352 	call and_cond
      009809 98 14            [ 1] 1353 	cp a,#TK_INTGR 
      00980B 20 CE            [ 1] 1354 	jreq 3$
      00980D CC 16 88         [ 2] 1355 	jp syntax_error 
      001C3A                       1356 3$:	 
      001C3A                       1357 	_xpop  ; rigth arg 
      00980D A1 0A            [ 1]    1     ld a,(y)
      00980F 27               [ 1]    2     ldw x,y 
      009810 CA CC            [ 2]    3     ldw x,(1,x)
      009812 97 08 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009814 C7 00 0C         [ 1] 1358 	ld acc24,a 
      009814 52 04 1F         [ 2] 1359 	ldw acc16,x 
      001C49                       1360 	_xpop  ; left arg  
      009817 01 0F            [ 1]    1     ld a,(y)
      009819 03               [ 1]    2     ldw x,y 
      00981A CD 98            [ 2]    3     ldw x,(1,x)
      00981C 88 CE 00 05      [ 2]    4     addw y,#CELL_SIZE 
      009820 72 BB            [ 1] 1361 	ld (ATMP,sp),a 
      009822 00 01            [ 1] 1362 	ld a,(OP,sp)
      009824 F6 A1            [ 1] 1363 	cp a,#TK_XOR 
      009826 32 26            [ 1] 1364 	jreq 5$ 
      001C5A                       1365 4$: ; A:X OR acc24   
      009828 43 72            [ 1] 1366 	ld a,(ATMP,sp)
      00982A 5C 00 02         [ 1] 1367 	or a,acc24 
      00982D CD               [ 1] 1368 	rlwa x 
      00982E 9C 94 A1         [ 1] 1369 	or a,acc16 
      009831 84               [ 1] 1370 	rlwa x 
      009832 27 03 CC         [ 1] 1371 	or a,acc8 
      009835 97               [ 1] 1372 	rlwa x 
      009836 08 0E            [ 2] 1373 	jra 6$  
      009837                       1374 5$: ; A:X XOR acc24 
      009837 1E 01            [ 1] 1375 	ld a,(ATMP,sp)
      009839 CD 94 06         [ 1] 1376 	xor a,acc24 
      00983C AB               [ 1] 1377 	rlwa x 
      00983D 05 6B 04         [ 1] 1378 	xor a,acc16 
      009840 CD               [ 1] 1379 	rlwa x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009841 9D D0 5D         [ 1] 1380 	xor a,acc8 
      009844 27               [ 1] 1381 	rlwa x 
      001C78                       1382 6$: _xpush
      009845 EE F6 2A 05      [ 2]    1     subw y,#CELL_SIZE
      009849 A6 11            [ 1]    2     ld (y),a 
      00984B CC 97 0A         [ 2]    3     ldw (1,y),x 
      00984E 20 99            [ 2] 1383 	jra 1$ 
      00984E 72 FB            [ 1] 1384 8$:	ld a,#TK_INTGR 
      001C85                       1385 9$:	_drop VSIZE 
      009850 03 1D            [ 2]    1     addw sp,#VSIZE 
      009852 00               [ 4] 1386 	ret 
                                   1387 
                                   1388 
                                   1389 ;--------------------------------------------
                                   1390 ; BASIC: HEX 
                                   1391 ; select hexadecimal base for integer print
                                   1392 ;---------------------------------------------
      001C88                       1393 hex_base:
      009853 03 CF 00 1A      [ 1] 1394 	mov base,#16 
      009857 90               [ 4] 1395 	ret 
                                   1396 
                                   1397 ;--------------------------------------------
                                   1398 ; BASIC: DEC 
                                   1399 ; select decimal base for integer print
                                   1400 ;---------------------------------------------
      001C8D                       1401 dec_base:
      009858 F6 93 EE 01      [ 1] 1402 	mov base,#10
      00985C 72               [ 4] 1403 	ret 
                                   1404 
                                   1405 ;------------------------
                                   1406 ; BASIC: FREE 
                                   1407 ; return free size in RAM 
                                   1408 ; output:
                                   1409 ;   A:x		size 
                                   1410 ;--------------------------
      001C92                       1411 free:
      00985D A9               [ 1] 1412 	clr a 
      00985E 00 03 72         [ 2] 1413 	ldw x,#tib 
      009861 C7 00 1A 72      [ 2] 1414 	subw x,dvar_end 
      009865 5C               [ 4] 1415 	ret 
                                   1416 
                                   1417 ;------------------------------
                                   1418 ; BASIC: SIZE 
                                   1419 ; command that print 
                                   1420 ; program start addres and size 
                                   1421 ;------------------------------
      001C9B                       1422 cmd_size:
      009866 00 1B 72         [ 1] 1423 	push base 
      009869 CF 00 1A         [ 2] 1424 	ldw x,#PROG_ADDR 
      00986C 5B 04 81         [ 4] 1425 	call puts 
      00986F CE 00 1B         [ 2] 1426 	ldw x,txtbgn     
      00986F C6 00 02 C7      [ 1] 1427 	mov base,#16 
      009873 00 04 C0         [ 4] 1428 	call prt_i16
      009876 00 03 27         [ 1] 1429 	pop base 
      009879 0D 1E 9A         [ 2] 1430 	ldw x,#PROG_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00987A CD 09 5C         [ 4] 1431 	call puts 
      00987A CE 00 05         [ 2] 1432 	ldw x,txtend 
      00987D 72 BB 00 01      [ 2] 1433 	subw x,txtbgn 
      009881 F6 5C 72         [ 4] 1434 	call prt_i16
      009884 5C 00 02         [ 2] 1435 	ldw x,#STR_BYTES 
      009887 81 09 5C         [ 4] 1436 	call puts  
      009888 81               [ 4] 1437 	ret 
                                   1438 
                                   1439 
                                   1440 ;------------------------
                                   1441 ; BASIC: UBOUND  
                                   1442 ; return array variable size 
                                   1443 ; and set 'array_size' variable 
                                   1444 ; output:
                                   1445 ;   A:X 	array_size
                                   1446 ;--------------------------
      001CC8                       1447 ubound:
      009888 F6 27 03         [ 4] 1448 	call free 
      00988B 5C 20            [ 1] 1449 	ld a,#CELL_SIZE 
      00988D FA               [ 2] 1450 	div x,a 
      00988E 5C 72 B0         [ 2] 1451 	ldw array_size,x
      009891 00               [ 1] 1452 	clr a 
      009892 05               [ 4] 1453 	ret 
                                   1454 
                                   1455 ;-----------------------------
                                   1456 ; BASIC: LET var=expr 
                                   1457 ; variable assignement 
                                   1458 ; output:
                                   1459 ;   A 		TK_NONE 
                                   1460 ;-----------------------------
      001CD3                       1461 let::
      009893 CF 00 01         [ 4] 1462 	call next_token 
      009896 81 85            [ 1] 1463 	cp a,#TK_VAR 
      009897 27 0C            [ 1] 1464 	jreq let_var
      009897 FE 72            [ 1] 1465 	cp a,#TK_ARRAY 
      009899 5C 00            [ 1] 1466 	jreq  let_array
      00989B 02 72 5C         [ 2] 1467 	jp syntax_error
      001CE1                       1468 let_array:
      00989E 00 02 81         [ 4] 1469 	call get_array_element
      0098A1 20 03            [ 2] 1470 	jra let_eval 
      001CE6                       1471 let_var:
      0098A1 F6 EE 01         [ 4] 1472 	call get_addr
      001CE9                       1473 let_eval:
      0098A4 72 5C 00         [ 2] 1474 	ldw ptr16,x  ; variable address 
      0098A7 02 72 5C         [ 4] 1475 	call next_token 
      0098AA 00 02            [ 1] 1476 	cp a,#TK_EQUAL
      0098AC 72 5C            [ 1] 1477 	jreq 1$
      0098AE 00 02 81         [ 2] 1478 	jp syntax_error
      0098B1                       1479 1$:	
      0098B1 F6 72 5C         [ 4] 1480 	call condition   
      0098B4 00 02            [ 1] 1481 	cp a,#TK_INTGR 
      0098B6 81 03            [ 1] 1482 	jreq 2$
      0098B7 CC 16 88         [ 2] 1483 	jp syntax_error
      001D00                       1484 2$:	
      001D00                       1485 	_xpop ; value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0098B7 72 5F            [ 1]    1     ld a,(y)
      0098B9 00               [ 1]    2     ldw x,y 
      0098BA 0D CF            [ 2]    3     ldw x,(1,x)
      0098BC 00 0E A6 10      [ 2]    4     addw y,#CELL_SIZE 
      001D09                       1486 3$:
      0098C0 C1 00 0B 27      [ 4] 1487 	ld [ptr16],a
      0098C4 09 72 0F 00      [ 1] 1488 	inc ptr8  
      0098C8 0E 04 72 53      [ 5] 1489 	ldw [ptr16],x 
      0098CC 00               [ 4] 1490 	ret 
                                   1491 
                                   1492 
                                   1493 ;--------------------------
                                   1494 ; return constant/dvar value 
                                   1495 ; from it's record address
                                   1496 ; input:
                                   1497 ;	X	*const record 
                                   1498 ; output:
                                   1499 ;   A:X   const  value
                                   1500 ;--------------------------
      001D16                       1501 get_value: ; -- i 
      0098CD 0D               [ 1] 1502 	ld a,(x) ; record size 
      0098CE A4 0F            [ 1] 1503 	and a,#NAME_MAX_LEN
      0098CE A6 FF            [ 1] 1504 	sub a,#CELL_SIZE ; * value 
      0098D0 CD               [ 1] 1505 	push a 
      0098D1 98 F4            [ 1] 1506 	push #0 
      0098D3 CD 91 C0         [ 2] 1507 	addw x,(1,sp)
      0098D6 88               [ 1] 1508 	ld a,(x)
      0098D7 CD 89            [ 2] 1509 	ldw x,(1,x)
      001D24                       1510 	_drop 2
      0098D9 DC 84            [ 2]    1     addw sp,#2 
      0098DB 81               [ 4] 1511 	ret 
                                   1512 
                                   1513 
                                   1514 ;--------------------------
                                   1515 ; BASIC: EEFREE 
                                   1516 ; eeprom_free 
                                   1517 ; search end of data  
                                   1518 ; in EEPROM 
                                   1519 ; input:
                                   1520 ;    none 
                                   1521 ; output:
                                   1522 ;    A:X     address free
                                   1523 ;-------------------------
      0098DC                       1524 func_eefree:
      0098DC 90 F6 93         [ 2] 1525 	ldw x,#EEPROM_BASE 
      0098DF EE 01 72 A9      [ 1] 1526 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0098E3 00 03 C7         [ 2] 1527     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0098E6 00 0D            [ 1] 1528 	jruge 8$ ; no free space 
      0098E8 CF               [ 1] 1529 2$: ld a,(x)
      0098E9 00 0E            [ 1] 1530 	jrne 3$
      0098EB CD               [ 1] 1531 	incw x 
      0098EC 98 CE A6 20      [ 1] 1532 	dec acc8 
      0098F0 CD 89            [ 1] 1533 	jrne 2$
      0098F2 7F 81 08         [ 2] 1534 	subw x,#8 
      0098F4 20 09            [ 2] 1535 	jra 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      0098F4 52               [ 1] 1536 3$: ld a,(x)
      0098F5 04               [ 1] 1537 	incw x
      0098F6 0F               [ 1] 1538 	tnz a  
      0098F7 02 0F            [ 1] 1539 	jrne 3$
      0098F9 01               [ 2] 1540 	decw x   
      0098FA 4D 27            [ 2] 1541 	jra 1$ 
      0098FC 11               [ 1] 1542 8$: clrw x ; no free space 
      0098FD C6               [ 1] 1543 9$: clr a 
      0098FE 00 0B A1         [ 2] 1544 	ldw free_eeprom,x ; save in system variable 
      009901 0A               [ 4] 1545 	ret 
                                   1546 
                           000005  1547 REC_XTRA_BYTES=5 
                                   1548 ;--------------------------
                                   1549 ; search constant/dim_var name 
                                   1550 ; format of record  
                                   1551 ;   .byte record length 
                                   1552 ;         = strlen(name)+5 
                                   1553 ;   .asciz name (variable length)
                                   1554 ;   .int24 value (3 bytes )
                                   1555 ; a constant record use 7+ bytes
                                   1556 ; constants are saved in EEPROM  
                                   1557 ; input:
                                   1558 ;    A     record_len 
                                   1559 ;    X     *name
                                   1560 ; output:
                                   1561 ;    X     address|0
                                   1562 ; use:
                                   1563 ;   A,Y, acc16 
                                   1564 ;-------------------------
                           000001  1565 	NAMEPTR=1 ; target name pointer 
                           000003  1566 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1567 	RECLEN=5  ; record length of target
                           000007  1568 	LIMIT=7   ; search area limit 
                           000008  1569 	VSIZE=8  
      001D50                       1570 search_name:
      009902 26 0A            [ 2] 1571 	pushw y 
      001D52                       1572 	_vars VSIZE
      009904 72 0F            [ 2]    1     sub sp,#VSIZE 
      009906 00 0D 05 03      [ 1] 1573 	clr acc16 
      00990A 01 CD            [ 1] 1574 	ld (RECLEN,sp),a    
      00990C 82 9D            [ 2] 1575 	ldw (NAMEPTR,sp),x
      00990E CE 00 32         [ 2] 1576 	ldw x,dvar_end 
      00990E AE 16            [ 2] 1577 	ldw (LIMIT,sp),x 
      009910 90 1C 00 50      [ 2] 1578 	ldw y,dvar_bgn
      009914 5A 7F            [ 2] 1579 1$:	ldw (WLKPTR,sp),y
      009916 93               [ 1] 1580 	ldw x,y 
      009916 C6 00            [ 2] 1581 	cpw x, (LIMIT,sp) 
      009918 0B CD            [ 1] 1582 	jruge 7$ ; no match found 
      00991A 83 69            [ 1] 1583 	ld a,(y)
      00991C AB 30            [ 1] 1584 	and a,#NAME_MAX_LEN
      00991E A1 3A            [ 1] 1585 	cp a,(RECLEN,sp)
      009920 2B 02            [ 1] 1586 	jrne 2$ 
      009922 AB 07            [ 1] 1587 	incw y 
      009924 1E 01            [ 2] 1588 	ldw x,(NAMEPTR,sp)
      009924 5A F7 0C         [ 4] 1589 	call strcmp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009927 02 C6            [ 1] 1590 	jrne 8$ ; match found 
      001D7D                       1591 2$: ; skip this one 	
      009929 00 0D            [ 2] 1592 	ldW Y,(WLKPTR,sp)
      00992B CA 00            [ 1] 1593 	ld a,(y)
      00992D 0E CA            [ 1] 1594 	and a,#NAME_MAX_LEN 
      00992F 00 0F 26         [ 1] 1595 	ld acc8,a 
      009932 E3 C6 00 0B      [ 2] 1596 	addw y,acc16 
      009936 A1 10            [ 2] 1597 	jra 1$  
      001D8C                       1598 7$: ; no match found 
      009938 27 08            [ 1] 1599 	clr (WLKPTR,sp)
      00993A 7B 01            [ 1] 1600 	clr (WLKPTR+1,sp)
      001D90                       1601 8$: ; match found 
      00993C 27 0A            [ 2] 1602 	ldw x,(WLKPTR,sp) ; record address 
      001D92                       1603 9$:	_DROP VSIZE
      00993E A6 2D            [ 2]    1     addw sp,#VSIZE 
      009940 20 02            [ 2] 1604 	popw y 
      009942 81               [ 4] 1605 	 ret 
                                   1606 
                                   1607 ;--------------------------------------------
                                   1608 ; BASIC: CONST name=value [, name=value]*
                                   1609 ; define constant(s) saved in EEPROM
                                   1610 ; share most of his code with cmd_dim 
                                   1611 ;--------------------------------------------
                           000001  1612 	VAR_NAME=1 
                           000003  1613 	REC_LEN=3
                           000005  1614 	RONLY=5
                           000005  1615 	VSIZE=5
      001D97                       1616 cmd_const:
      009942 A6 24 5A F7 0C   [ 2] 1617 	btjt flags,#FRUN,0$
      009947 02 06            [ 1] 1618 	ld a,#ERR_RUN_ONLY
      009948 CC 16 8A         [ 2] 1619 	jp tb_error 
      001DA1                       1620 0$: 
      001DA1                       1621 	_vars VSIZE 
      009948 7B 02            [ 2]    1     sub sp,#VSIZE 
      00994A 5B 04            [ 1] 1622 	ld a,#128 
      00994C 81 05            [ 1] 1623 	ld (RONLY,sp),a 
      00994D 0F 03            [ 1] 1624 	clr (REC_LEN,sp)
      00994D A1 61            [ 2] 1625 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1626 
                                   1627 ;---------------------------------
                                   1628 ; BASIC: DIM var_name [var_name]* 
                                   1629 ; create named variables at end 
                                   1630 ; of BASIC program. 
                                   1631 ; These variables are initialized 
                                   1632 ; to 0. 
                                   1633 ; record format same ast CONST 
                                   1634 ; but r/w because stored in RAM 
                                   1635 ;---------------------------------
      001DAB                       1636 cmd_dim:
      00994F 2A 01 81 A1 7A   [ 2] 1637 	btjt flags,#FRUN,cmd_dim1
      009954 22 FB            [ 1] 1638 	ld a,#ERR_RUN_ONLY
      009956 A0 20 81         [ 2] 1639 	jp tb_error 
      009959                       1640 cmd_dim1:	
      001DB5                       1641 	_vars VSIZE
      009959 52 05            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00995B 1F 04            [ 1] 1642 	clr (REC_LEN,sp )
      00995D 4F 5F            [ 1] 1643 	clr (RONLY,sp)
      001DBB                       1644 cmd_dim2: 
      00995F 72 A2 00         [ 4] 1645 0$:	call next_token 
      009962 03 90            [ 1] 1646 	cp a,#TK_LABEL  
      009964 F7 90            [ 1] 1647 	jreq 1$ 
      009966 EF 01 0F         [ 2] 1648 	jp syntax_error 
      009969 01 A6            [ 2] 1649 1$: ldw (VAR_NAME,sp),x ; name pointer 
      00996B 0A 6B 02         [ 4] 1650 	call strlen
      00996E 1E 04            [ 1] 1651 	add a,#REC_XTRA_BYTES
      009970 F6 27            [ 1] 1652 	ld (REC_LEN+1,sp),a
      009972 4E A1 2D         [ 4] 1653 	call skip_string 
      009975 26 04            [ 1] 1654 	ld a,(REC_LEN+1,sp)
      009977 03 01            [ 2] 1655 	ldw x,(VAR_NAME,sp) 
      009979 20 08 A1         [ 4] 1656 	call search_name  
      00997C 24               [ 2] 1657 	tnzw x 
      00997D 26 08            [ 1] 1658 	jreq 2$
      00997F A6 10            [ 1] 1659 	ld a,#ERR_DUPLICATE
      009981 6B 02 5C         [ 2] 1660 	jp tb_error  
      009984 1F 04 F6         [ 2] 1661 2$:	ldw x,dvar_end 
      009987 7B 04            [ 1] 1662 	ld a,(REC_LEN+1,sp)
      009987 A1 61            [ 1] 1663 	or a,(RONLY,sp)
      009989 2B               [ 1] 1664 	ld (x),a 
      00998A 02               [ 1] 1665 	incw x 
      00998B A0 20            [ 2] 1666 	pushw y 
      00998D A1 30            [ 2] 1667 	ldw y,(VAR_NAME+2,sp)
      00998F 2B 30 A0         [ 4] 1668 	call strcpy
      009992 30 A1            [ 2] 1669 	popw y 
      009994 0A               [ 2] 1670 	decw x
      009995 2B 06 A0         [ 2] 1671 	addw x,(REC_LEN,sp)
      009998 07 11 02         [ 2] 1672 	ldw dvar_end,x 
      00999B 2A 24 6B         [ 2] 1673 	subw x,#CELL_SIZE  
      00999E 03               [ 1] 1674 	clr (x)
      00999F 7B 02            [ 1] 1675 	clr (1,x)  
      0099A1 CD 82            [ 1] 1676 	clr (2,x)
      0099A3 BA 72 A2         [ 4] 1677 4$: call next_token 
      0099A6 00 03            [ 1] 1678 	cp a,#TK_COMMA 
      0099A8 90 F7            [ 1] 1679 	jreq 0$ 
      0099AA 90 EF            [ 1] 1680 	cp a,#TK_EQUAL 
      0099AC 01 5F            [ 1] 1681 	jrne 8$
                                   1682 ; initialize variable 
      0099AE 7B 03 02         [ 4] 1683 	call condition 
      0099B1 72 A2            [ 1] 1684 	cp a,#TK_INTGR
      0099B3 00 03            [ 1] 1685 	jreq 5$
      0099B5 90 F7 90         [ 2] 1686 	jp syntax_error
      0099B8 EF 01 CD         [ 2] 1687 5$: ldw x,dvar_end 
      0099BB 81 FE 1E         [ 2] 1688 	subw x,#CELL_SIZE 
      0099BE 04 20 C2         [ 2] 1689 	ldw ptr16,x 
      001E1F                       1690 	_xpop 
      0099C1 0D 01            [ 1]    1     ld a,(y)
      0099C3 27               [ 1]    2     ldw x,y 
      0099C4 03 CD            [ 2]    3     ldw x,(1,x)
      0099C6 82 83 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0099C8 72 C7 00 19      [ 4] 1691 	ld [ptr16],a 
      0099C8 90 F6 93 EE      [ 1] 1692 	inc ptr8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0099CC 01 72 A9 00      [ 5] 1693 	ldw [ptr16],x 
      0099D0 03 C7            [ 2] 1694 	jra 4$ 
      001E36                       1695 8$:	
      001E36                       1696 	_unget_token 	
      0099D2 00 0D CF 00 0E   [ 1]    1      mov in,in.saved  
      001E3B                       1697 	_drop VSIZE 
      0099D7 5B 05            [ 2]    1     addw sp,#VSIZE 
      0099D9 81 1C C8         [ 4] 1698 	call ubound 
      0099DA 81               [ 4] 1699 	ret 
                                   1700 
                                   1701 
                                   1702 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1703 ; return program size 
                                   1704 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E41                       1705 prog_size:
      0099DA 52 05 17         [ 2] 1706 	ldw x,txtend 
      0099DD 04 B0 00 1B      [ 2] 1707 	subw x,txtbgn 
      0099DE 81               [ 4] 1708 	ret 
                                   1709 
                                   1710 ;----------------------------
                                   1711 ; print program information 
                                   1712 ;---------------------------
      001E49                       1713 program_info: 
      0099DE 1F 02 F6         [ 2] 1714 	ldw x,#PROG_ADDR 
      0099E1 A4 0F 6B         [ 4] 1715 	call puts 
      0099E4 01 16 04         [ 2] 1716 	ldw x,txtbgn 
      0099E7 5C 10 00 0A      [ 1] 1717 	mov base,#16 
      0099E8 CD 18 37         [ 4] 1718 	call prt_i16
      0099E8 90 F6 27 1B      [ 1] 1719 	mov base,#10  
      0099EC 0D 01 27         [ 2] 1720 	ldw x,#PROG_SIZE
      0099EF 0A F1 26         [ 4] 1721 	call puts 
      0099F2 07 90 5C         [ 4] 1722 	call prog_size 
      0099F5 5C 0A 01         [ 4] 1723 	call prt_i16 
      0099F8 20 EE AB         [ 2] 1724 	ldw x,#STR_BYTES 
      0099FA CD 09 5C         [ 4] 1725 	call puts
      0099FA 1E 02 1D         [ 2] 1726 	ldw x,txtbgn
      0099FD 00 02 4B         [ 2] 1727 	cpw x,#app 
      009A00 00 FE            [ 1] 1728 	jrult 2$
      009A02 84 27 1D         [ 2] 1729 	ldw x,#FLASH_MEM 
      009A05 20 D7            [ 2] 1730 	jra 3$
      009A07 AE 1E C3         [ 2] 1731 2$: ldw x,#RAM_MEM 	 
      009A07 1E 02 F6         [ 4] 1732 3$:	call puts 
      009A0A 6B 01            [ 1] 1733 	ld a,#CR 
      009A0C A4 0F 4C         [ 4] 1734 	call putc
      009A0F C7               [ 4] 1735 	ret 
                                   1736 
      009A10 00 0F 72 5F 00 0E 72  1737 PROG_ADDR: .asciz "program address: "
             BB 00 0E FE 7B 01 A4
             F0 4E AB 80
      009A22 2C 20 70 72 6F 67 72  1738 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A22 5B 05 81 74 65 73 00  1739 STR_BYTES: .asciz " bytes" 
      009A25 20 69 6E 20 46 4C 41  1740 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



             72 79 00
      009A25 88 CD 98 6F 11 01 27  1741 RAM_MEM:   .asciz " in RAM memory" 
             03 CC 97 08 84 81 79
             00
                                   1742 
                                   1743 
                                   1744 ;----------------------------
                                   1745 ; BASIC: LIST [[start][,end]]
                                   1746 ; list program lines 
                                   1747 ; form start to end 
                                   1748 ; if empty argument list then 
                                   1749 ; list all.
                                   1750 ;----------------------------
                           000001  1751 	FIRST=1
                           000003  1752 	LAST=3 
                           000005  1753 	LN_PTR=5
                           000006  1754 	VSIZE=6 
      009A32                       1755 list:
      009A32 A6 06 CD 9A 25   [ 2] 1756 	btjf flags,#FRUN,0$
      009A37 A6 07            [ 1] 1757 	ld a,#ERR_CMD_ONLY
      009A37 4B 00 CD         [ 2] 1758 	jp tb_error
      001EDC                       1759 0$:	 
      009A3A 9C 94 4D         [ 4] 1760 	call prog_size 
      009A3D 27 12            [ 1] 1761 	jrugt 3$
      009A3F 0C               [ 4] 1762 	ret 
      001EE2                       1763 3$: _vars VSIZE
      009A40 01 CD            [ 2]    1     sub sp,#VSIZE 
      009A42 98 6F A1         [ 2] 1764 	ldw x,txtbgn 
      009A45 08 27            [ 2] 1765 	ldw (LN_PTR,sp),x 
      009A47 F1               [ 2] 1766 	ldw x,(x) 
      009A48 A1 07            [ 2] 1767 	ldw (FIRST,sp),x ; list from first line 
      009A4A 27 05 55         [ 2] 1768 	ldw x,#MAX_LINENO ; biggest line number 
      009A4D 00 04            [ 2] 1769 	ldw (LAST,sp),x 
      009A4F 00 02 84         [ 4] 1770 	call arg_list
      009A52 81               [ 1] 1771 	tnz a
      009A53 27 31            [ 1] 1772 	jreq list_loop 
      009A53 CD 9A            [ 1] 1773 	cp a,#2 
      009A55 32 A1            [ 1] 1774 	jreq 4$
      009A57 01 27            [ 1] 1775 	cp a,#1 
      009A59 03 CC            [ 1] 1776 	jreq first_line 
      009A5B 97 08 90         [ 2] 1777 	jp syntax_error 
      009A5E F6               [ 2] 1778 4$:	popw x 
      009A5F 93 EE            [ 2] 1779 	ldw (LAST+2,sp),x 
      001F05                       1780 first_line:
      009A61 01               [ 2] 1781 	popw x
      009A62 72 A9            [ 2] 1782 	ldw (FIRST,sp),x 
      001F08                       1783 lines_skip:
      009A64 00 03 C3         [ 2] 1784 	ldw x,txtbgn
      009A67 00 21            [ 2] 1785 2$:	ldw (LN_PTR,sp),x 
      009A69 23 05 A6         [ 2] 1786 	cpw x,txtend 
      009A6C 0A CC            [ 1] 1787 	jrpl list_exit 
      009A6E 97               [ 2] 1788 	ldw x,(x) ;line# 
      009A6F 0A 5D            [ 2] 1789 	cpw x,(FIRST,sp)
      009A71 27 F8            [ 1] 1790 	jrpl list_loop 
      009A73 89 58            [ 2] 1791 	ldw x,(LN_PTR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009A75 72 FB            [ 1] 1792 	ld a,(2,x)
      009A77 01 1F 01         [ 1] 1793 	ld acc8,a 
      009A7A AE 16 90 72      [ 1] 1794 	clr acc16 
      009A7E F0 01 5B 02      [ 2] 1795 	addw x,acc16
      009A82 81 E3            [ 2] 1796 	jra 2$ 
                                   1797 ; print loop
      009A83                       1798 list_loop:
      009A83 52 01            [ 2] 1799 	ldw x,(LN_PTR,sp)
      009A85 0F 01            [ 1] 1800 	ld a,(2,x) 
      009A87 CD 98 6F         [ 4] 1801 	call prt_basic_line
      009A8A 4D 26            [ 2] 1802 	ldw x,(LN_PTR,sp)
      009A8C 03 CC            [ 1] 1803 	ld a,(2,x)
      009A8E 9B 35 A1         [ 1] 1804 	ld acc8,a 
      009A91 10 27 06 A1      [ 1] 1805 	clr acc16 
      009A95 11 26 05 03      [ 2] 1806 	addw x,acc16
      009A99 01 00 1D         [ 2] 1807 	cpw x,txtend 
      009A9A 2A 07            [ 1] 1808 	jrpl list_exit
      009A9A CD 98            [ 2] 1809 	ldw (LN_PTR,sp),x
      009A9C 6F               [ 2] 1810 	ldw x,(x)
      009A9D 13 03            [ 2] 1811 	cpw x,(LAST,sp)  
      009A9D 4D 26            [ 1] 1812 	jrslt list_loop
      001F4A                       1813 list_exit:
      009A9F 03 CC 97 08 01   [ 1] 1814 	mov in,count 
      009AA3 AE 16 E0         [ 2] 1815 	ldw x,#pad 
      009AA3 A1 81 26         [ 2] 1816 	ldw basicptr,x 
      001F55                       1817 	_drop VSIZE 
      009AA6 0C FE            [ 2]    1     addw sp,#VSIZE 
      009AA8 72 5C 00         [ 4] 1818 	call program_info 
      009AAB 02               [ 4] 1819 	ret
                                   1820 
                                   1821 
                                   1822 ;--------------------------
                                   1823 ; BASIC: EDIT label 
                                   1824 ;  copy program in FLASH 
                                   1825 ;  to RAM for edition 
                                   1826 ;-------------------------
      001F5B                       1827 cmd_edit:
      009AAC 72 5C            [ 1] 1828 	ld a,#TK_LABEL 
      009AAE 00 02 FD         [ 4] 1829 	call expect  
      009AB1 20               [ 2] 1830 	pushw x 
      009AB2 70 18 08         [ 4] 1831 	call skip_string
      009AB3 85               [ 2] 1832 	popw x 
      009AB3 A1 84 26         [ 4] 1833 	call search_program 
      009AB6 05 CD            [ 1] 1834     jrne 1$ 
      009AB8 98 A1 20         [ 2] 1835 	ldw x,#ERR_NO_PROGRAM
      009ABB 67 16 8A         [ 2] 1836 	jp tb_error 
      009ABC 90 89            [ 2] 1837 1$: pushw y 
      009ABC A1 05            [ 1] 1838 	ldw y,x ; source address 
      009ABE 26 05 CD         [ 2] 1839 	subw x,#4
      009AC1 9A 53            [ 2] 1840 	ldw x,(2,x) ; program size 
      009AC3 20 07 04         [ 2] 1841 	addw x,#4 
      009AC5 CF 00 0D         [ 2] 1842 	ldw acc16,x  ; bytes to copy 
      009AC5 A1 85 26         [ 2] 1843 	ldw x,#rsign ; destination address 
      009AC8 08 CD 98 97      [ 2] 1844 	subw y,#4 
      009ACC CD 13 B2         [ 4] 1845 	call move  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009ACC F6 EE 01         [ 2] 1846 	ldw x,#free_ram 
      009ACF 20 52 1B         [ 2] 1847 	ldw txtbgn,x 
      009AD1 72 BB 00 8E      [ 2] 1848 	addw x,rsize  
      009AD1 A1 03 26         [ 2] 1849 	ldw txtend,x
      009AD4 1D 90            [ 2] 1850 	popw y  
      009AD6 89               [ 4] 1851 	ret 
                                   1852 
                                   1853 ;--------------------------
                                   1854 ; decompile line from token list
                                   1855 ; and print it. 
                                   1856 ; input:
                                   1857 ;   A       stop at this position 
                                   1858 ;   X 		pointer at line
                                   1859 ; output:
                                   1860 ;   none 
                                   1861 ;--------------------------	
      001F99                       1862 prt_basic_line:
      009AD7 89 CD            [ 2] 1863 	pushw y 
      009AD9 98 88 85         [ 1] 1864 	ld count,a 
      009ADC CD 94            [ 1] 1865 	ld a,(2,x)
      009ADE 06 AB 05         [ 1] 1866 	cp a,count 
      009AE1 CD 9D            [ 1] 1867 	jrpl 1$ 
      009AE3 D0 5D 26         [ 1] 1868 	ld count,a 
      009AE6 04 90 85         [ 2] 1869 1$:	ldw basicptr,x 
      009AE9 20 30 16 90      [ 2] 1870 	ldw y,#tib  
      009AEB CD 11 A2         [ 4] 1871 	call decompile 
      009AEB 90 85 CD         [ 4] 1872 	call puts 
      009AEE 9D 96            [ 1] 1873 	ld a,#CR 
      009AF0 20 31 FF         [ 4] 1874 	call putc 
      009AF2 90 85            [ 2] 1875 	popw y 
      009AF2 A1               [ 4] 1876 	ret 
                                   1877 
                                   1878 
                                   1879 ;---------------------------------
                                   1880 ; BASIC: PRINT|? arg_list 
                                   1881 ; print values from argument list
                                   1882 ;----------------------------------
                           000001  1883 	CCOMMA=1
                           000001  1884 	VSIZE=1
      001FBD                       1885 print:
      001FBD                       1886 	_vars VSIZE 
      009AF3 82 26            [ 2]    1     sub sp,#VSIZE 
      001FBF                       1887 reset_comma:
      009AF5 0E FE            [ 1] 1888 	clr (CCOMMA,sp)
      001FC1                       1889 prt_loop:
      009AF7 72 5C 00         [ 4] 1890 	call next_token
      009AFA 02 72            [ 1] 1891 	cp a,#CMD_END 
      009AFC 5C 00            [ 1] 1892 	jrult 0$
      009AFE 02 FD            [ 1] 1893 	cp a,#TK_COLON 
      009B00 5F 02            [ 1] 1894 	jreq 0$
      009B02 20 1F            [ 1] 1895 	cp a,#TK_CMD
      009B04 26 07            [ 1] 1896 	jrne 10$
      001FD0                       1897 0$:
      001FD0                       1898 	_unget_token 
      009B04 A1 06 26 13 CD   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009B09 9B 7B            [ 2] 1899 	jra 8$ 
      001FD7                       1900 10$:	
      009B0B A6 07            [ 1] 1901 	cp a,#TK_QSTR
      009B0D CD 9A            [ 1] 1902 	jreq 1$
      009B0F 25 90            [ 1] 1903 	cp a,#TK_CHAR 
      009B11 F6 93            [ 1] 1904 	jreq 2$ 
      009B13 EE 01            [ 1] 1905 	cp a,#TK_CFUNC 
      009B15 72 A9            [ 1] 1906 	jreq 3$
      009B17 00 03            [ 1] 1907 	cp a,#TK_COMMA 
      009B19 20 08            [ 1] 1908 	jreq 4$
      009B1B A1 09            [ 1] 1909 	cp a,#TK_SHARP 
      009B1B 55 00            [ 1] 1910 	jreq 5$
      009B1D 04 00            [ 2] 1911 	jra 7$ 
      001FED                       1912 1$:	; print string 
      009B1F 02 4F 20         [ 4] 1913 	call puts
      009B22 12               [ 1] 1914 	incw x
      009B23 72 B0 00 04      [ 2] 1915 	subw x,basicptr 
      009B23 0D 01 27         [ 2] 1916 	ldw in.w,x  
      009B26 03 CD            [ 2] 1917 	jra reset_comma
      001FFA                       1918 2$:	; print character 
      009B28 82 95 31         [ 4] 1919 	call get_char 
      009B2A CD 08 FF         [ 4] 1920 	call putc 
      009B2A 72 A2            [ 2] 1921 	jra reset_comma 
      002002                       1922 3$: ; print character function value  	
      002002                       1923 	_get_code_addr 
      009B2C 00               [ 2]    1         ldw x,(x)
      009B2D 03 90 F7 90      [ 1]    2         inc in 
      009B31 EF 01 A6 84      [ 1]    3         inc in 
      009B35 FD               [ 4] 1924 	call (x)
      009B35 5B 01 81         [ 4] 1925 	call putc
      009B38 20 AE            [ 2] 1926 	jra reset_comma 
      002011                       1927 4$: ; set comma state 
      009B38 52 01            [ 1] 1928 	cpl (CCOMMA,sp)
      009B3A CD 9A            [ 2] 1929 	jra prt_loop   
      002015                       1930 5$: ; # character must be followed by an integer   
      009B3C 83 4D 27         [ 4] 1931 	call next_token
      009B3F 38 84            [ 1] 1932 	cp a,#TK_INTGR 
      009B40 27 03            [ 1] 1933 	jreq 6$
      009B40 CD 98 6F         [ 2] 1934 	jp syntax_error 
      00201F                       1935 6$: ; set tab width
      009B43 6B 01 A4         [ 4] 1936 	call get_int24 
      009B46 30               [ 1] 1937 	ld a,xl 
      009B47 A1 20            [ 1] 1938 	and a,#15 
      009B49 27 09 A6         [ 1] 1939 	ld tab_width,a 
      009B4C 84 55            [ 2] 1940 	jra reset_comma 
      00202A                       1941 7$:	
      00202A                       1942 	_unget_token 
      009B4E 00 04 00 02 20   [ 1]    1      mov in,in.saved  
      009B53 24 1C 14         [ 4] 1943 	call condition
      009B54 4D               [ 1] 1944 	tnz a 
      009B54 CD 9A            [ 1] 1945 	jreq 8$    
      009B56 83 4D 26         [ 4] 1946     call print_top
      009B59 03 CC            [ 2] 1947 	jra reset_comma 
      00203A                       1948 8$:
      009B5B 97 08            [ 1] 1949 	tnz (CCOMMA,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009B5D 26 05            [ 1] 1950 	jrne 9$
      009B5D 7B 01            [ 1] 1951 	ld a,#CR 
      009B5F A1 20 26         [ 4] 1952     call putc 
      002043                       1953 9$:	_drop VSIZE 
      009B62 05 CD            [ 2]    1     addw sp,#VSIZE 
      009B64 82               [ 4] 1954 	ret 
                                   1955 
                                   1956 ;----------------------
                                   1957 ; 'save_context' and
                                   1958 ; 'rest_context' must be 
                                   1959 ; called at the same 
                                   1960 ; call stack depth 
                                   1961 ; i.e. SP must have the 
                                   1962 ; save value at  
                                   1963 ; entry point of both 
                                   1964 ; routine. 
                                   1965 ;---------------------
                           000004  1966 	CTXT_SIZE=4 ; size of saved data 
                                   1967 ;--------------------
                                   1968 ; save current BASIC
                                   1969 ; interpreter context 
                                   1970 ; on stack 
                                   1971 ;--------------------
      002046                       1972 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002046                       1973 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002046                       1974 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002046                       1975 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002046                       1976 save_context:
      009B65 F9 20 D8         [ 2] 1977 	ldw x,basicptr 
      009B68 A1 21            [ 2] 1978 	ldw (BPTR,sp),x
      009B6A 26 05 CD         [ 1] 1979 	ld a,in 
      009B6D 83 87            [ 1] 1980 	ld (IN,sp),a
      009B6F 20 CF 02         [ 1] 1981 	ld a,count 
      009B71 6B 06            [ 1] 1982 	ld (CNT,sp),a  
      009B71 CD               [ 4] 1983 	ret
                                   1984 
                                   1985 ;-----------------------
                                   1986 ; restore previously saved 
                                   1987 ; BASIC interpreter context 
                                   1988 ; from stack 
                                   1989 ;-------------------------
      002056                       1990 rest_context:
      009B72 84 21            [ 2] 1991 	ldw x,(BPTR,sp)
      009B74 20 CA 04         [ 2] 1992 	ldw basicptr,x 
      009B76 7B 05            [ 1] 1993 	ld a,(IN,sp)
      009B76 A6 84 01         [ 1] 1994 	ld in,a
      009B78 7B 06            [ 1] 1995 	ld a,(CNT,sp)
      009B78 5B 01 81         [ 1] 1996 	ld count,a  
      009B7B 81               [ 4] 1997 	ret
                                   1998 
                                   1999 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   2000 
                                   2001 ;------------------------------------------
                                   2002 ; BASIC: INPUT [string]var[,[string]var]
                                   2003 ; input value in variables 
                                   2004 ; [string] optionally can be used as prompt 
                                   2005 ;-----------------------------------------
                           000001  2006 	CX_BPTR=1
                           000003  2007 	CX_IN=3
                           000004  2008 	CX_CNT=4
                           000005  2009 	SKIP=5
                           000005  2010 	VSIZE=5
      002066                       2011 input_var:
      009B7B 52 01            [ 2] 2012 	pushw y 
      002068                       2013 	_vars VSIZE 
      009B7D CD 9B            [ 2]    1     sub sp,#VSIZE 
      00206A                       2014 input_loop:
      009B7F 38 4D            [ 1] 2015 	clr (SKIP,sp)
      009B81 27 2D EF         [ 4] 2016 	call next_token 
      009B83 A1 02            [ 1] 2017 	cp a,#TK_QSTR 
      009B83 CD 98            [ 1] 2018 	jrne 1$ 
      009B85 6F 6B 01         [ 4] 2019 	call puts 
      009B88 A4               [ 1] 2020 	incw x 
      009B89 30 A1 10 27      [ 2] 2021 	subw x,basicptr 
      009B8D 09 55 00         [ 2] 2022 	ldw in.w,x 
      009B90 04 00            [ 1] 2023 	cpl (SKIP,sp)
      009B92 02 A6 84         [ 4] 2024 	call next_token 
      009B95 20 19            [ 1] 2025 1$: cp a,#TK_VAR  
      009B97 27 03            [ 1] 2026 	jreq 2$ 
      009B97 CD 9B 38         [ 2] 2027 	jp syntax_error
      009B9A 4D 26 03         [ 4] 2028 2$:	call get_addr
      009B9D CC 97 08         [ 2] 2029 	ldw ptr16,x 
      009BA0 0D 05            [ 1] 2030 	tnz (SKIP,sp)
      009BA0 7B 01            [ 1] 2031 	jrne 21$ 
      009BA2 A1 10 26         [ 4] 2032 	call var_name 
      009BA5 05 CD 81         [ 4] 2033 	call putc   
      00209A                       2034 21$:
      009BA8 FE 20            [ 1] 2035 	ld a,#':
      009BAA D8 08 FF         [ 4] 2036 	call putc 
      009BAB CD 20 46         [ 4] 2037 	call save_context 
      009BAB CD 82 1B 20      [ 1] 2038 	clr count  
      009BAF D3 0A 61         [ 4] 2039 	call readln 
      009BB0 AE 16 90         [ 2] 2040 	ldw x,#tib 
      009BB0 5B 01 81         [ 1] 2041 	push count
      009BB3 4B 00            [ 1] 2042 	push #0 
      009BB3 52 01 CD         [ 2] 2043 	addw x,(1,sp)
      009BB6 9B               [ 1] 2044 	incw x 
      0020B5                       2045 	_drop 2 
      009BB7 7B 4D            [ 2]    1     addw sp,#2 
      009BB9 27 54 CD 98      [ 1] 2046 	clr in 
      009BBD 6F 6B 01         [ 4] 2047 	call get_token
      009BC0 A4 30            [ 1] 2048 	cp a,#TK_INTGR
      009BC2 A1 30            [ 1] 2049 	jreq 3$ 
      009BC4 27 09            [ 1] 2050 	cp a,#TK_MINUS
      009BC6 A6 84            [ 1] 2051 	jrne 22$
      009BC8 55 00 04         [ 4] 2052 	call get_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009BCB 00 02            [ 1] 2053 	cp a,#TK_INTGR 
      009BCD 20 40            [ 1] 2054 	jreq 23$
      009BCF                       2055 22$:
      009BCF CD 9B 7B         [ 4] 2056 	call rest_context 
      009BD2 4D 26 03         [ 2] 2057 	jp syntax_error
      0020D3                       2058 23$:
      009BD5 CC 97 08         [ 4] 2059 	call neg_acc24	
      009BD8                       2060 3$: 
      009BD8 CD 82 38         [ 1] 2061 	ld a,acc24 
      009BDB 90 F6 93         [ 2] 2062 	ldw x,acc16 
      009BDE EE 01 72 A9      [ 4] 2063 	ld [ptr16],a
      009BE2 00 03 4D 2B      [ 1] 2064 	inc ptr8  
      009BE6 08 26 0C 35      [ 5] 2065 	ldw [ptr16],x 
      009BEA 02 00 0F         [ 4] 2066 	call rest_context
      009BED 20 0A EF         [ 4] 2067 	call next_token 
      009BEF A1 08            [ 1] 2068 	cp a,#TK_COMMA
      009BEF 35 04            [ 1] 2069 	jrne 4$ 
      009BF1 00 0F 20         [ 2] 2070 	jp input_loop
      0020F5                       2071 4$:
      009BF4 04 00            [ 1] 2072 	cp a,#TK_NONE 
      009BF5 27 07            [ 1] 2073 	jreq input_exit  
      009BF5 35 01            [ 1] 2074 	cp a,#TK_COLON 
      009BF7 00 0F            [ 1] 2075     jreq input_exit 
      009BF9 CC 16 88         [ 2] 2076 	jp syntax_error 
      002100                       2077 input_exit:
      002100                       2078 	_drop VSIZE 
      009BF9 5F C6            [ 2]    1     addw sp,#VSIZE 
      009BFB 00 0F            [ 2] 2079 	popw y 
      009BFD 14               [ 4] 2080 	ret 
                                   2081 
                                   2082 
                                   2083 ;---------------------
                                   2084 ; BASIC: REM | ' 
                                   2085 ; skip comment to end of line 
                                   2086 ;---------------------- 
      002105                       2087 remark::
      009BFE 01 27 03 53 A6   [ 1] 2088 	mov in,count 
      009C03 FF               [ 4] 2089  	ret 
                                   2090 
                                   2091 
                                   2092 ;---------------------
                                   2093 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2094 ; read in loop 'addr'  
                                   2095 ; apply & 'mask' to value 
                                   2096 ; loop while result==0.  
                                   2097 ; 'xor_mask' is used to 
                                   2098 ; invert the wait logic.
                                   2099 ; i.e. loop while not 0.
                                   2100 ;---------------------
                           000001  2101 	XMASK=1 
                           000002  2102 	MASK=2
                           000003  2103 	ADDR=3
                           000004  2104 	VSIZE=4
      00210B                       2105 wait: 
      00210B                       2106 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009C04 72 A2            [ 2]    1     sub sp,#VSIZE 
      009C06 00 03            [ 1] 2107 	clr (XMASK,sp) 
      009C08 90 F7 90         [ 4] 2108 	call arg_list 
      009C0B EF 01            [ 1] 2109 	cp a,#2
      009C0D A6 84            [ 1] 2110 	jruge 0$
      009C0F CC 16 88         [ 2] 2111 	jp syntax_error 
      009C0F 5B 01            [ 1] 2112 0$:	cp a,#3
      009C11 81 0C            [ 1] 2113 	jrult 1$
      009C12                       2114 	_xpop  ; xor mask 
      009C12 4B 00            [ 1]    1     ld a,(y)
      009C14 CD               [ 1]    2     ldw x,y 
      009C15 98 6F            [ 2]    3     ldw x,(1,x)
      009C17 4D 27 25 A1      [ 2]    4     addw y,#CELL_SIZE 
      009C1B 87               [ 1] 2115 	ld a,xl 
      009C1C 26 04            [ 1] 2116 	ld (XMASK,sp),a 
      002129                       2117 1$: _xpop ; mask
      009C1E 03 01            [ 1]    1     ld a,(y)
      009C20 20               [ 1]    2     ldw x,y 
      009C21 F2 01            [ 2]    3     ldw x,(1,x)
      009C22 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C22 A1               [ 1] 2118     ld a,xl  
      009C23 06 26            [ 1] 2119 	ld (MASK,sp),a 
      002135                       2120 	_xpop ; address 
      009C25 0A CD            [ 1]    1     ld a,(y)
      009C27 9C               [ 1]    2     ldw x,y 
      009C28 94 A6            [ 2]    3     ldw x,(1,x)
      009C2A 07 CD 9A 25      [ 2]    4     addw y,#CELL_SIZE 
      009C2E 20               [ 1] 2121 2$:	ld a,(x)
      009C2F 08 55            [ 1] 2122 	and a,(MASK,sp)
      009C31 00 04            [ 1] 2123 	xor a,(XMASK,sp)
      009C33 00 02            [ 1] 2124 	jreq 2$ 
      002145                       2125 	_drop VSIZE 
      009C35 CD 9B            [ 2]    1     addw sp,#VSIZE 
      009C37 B3               [ 4] 2126 	ret 
                                   2127 
                                   2128 ;---------------------
                                   2129 ; BASIC: BSET addr,mask
                                   2130 ; set bits at 'addr' corresponding 
                                   2131 ; to those of 'mask' that are at 1.
                                   2132 ; arguments:
                                   2133 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2134 ;   mask        mask|addr
                                   2135 ; output:
                                   2136 ;	none 
                                   2137 ;--------------------------
      009C38                       2138 bit_set:
      009C38 0D 01 27         [ 4] 2139 	call arg_list 
      009C3B 03 CD            [ 1] 2140 	cp a,#2	 
      009C3D 82 7A            [ 1] 2141 	jreq 1$ 
      009C3F CC 16 88         [ 2] 2142 	jp syntax_error
      002152                       2143 1$: 
      002152                       2144 	_xpop ; mask 
      009C3F 5B 01            [ 1]    1     ld a,(y)
      009C41 81               [ 1]    2     ldw x,y 
      009C42 EE 01            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009C42 CD 9C 12 4D      [ 2]    4     addw y,#CELL_SIZE 
      009C46 27               [ 1] 2145 	ld a,xl
      009C47 4B               [ 1] 2146 	push a  
      00215D                       2147 	_xpop ; addr  
      009C48 CD 98            [ 1]    1     ld a,(y)
      009C4A 6F               [ 1]    2     ldw x,y 
      009C4B 4D 27            [ 2]    3     ldw x,(1,x)
      009C4D 43 A1 88 27      [ 2]    4     addw y,#CELL_SIZE 
      009C51 07               [ 1] 2148 	pop a 
      009C52 55               [ 1] 2149 	or a,(x)
      009C53 00               [ 1] 2150 	ld (x),a
      009C54 04               [ 4] 2151 	ret 
                                   2152 
                                   2153 ;---------------------
                                   2154 ; BASIC: BRES addr,mask
                                   2155 ; reset bits at 'addr' corresponding 
                                   2156 ; to those of 'mask' that are at 1.
                                   2157 ; arguments:
                                   2158 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2159 ;   mask	    ~mask&*addr  
                                   2160 ; output:
                                   2161 ;	none 
                                   2162 ;--------------------------
      00216A                       2163 bit_reset:
      009C55 00 02 20         [ 4] 2164 	call arg_list 
      009C58 38 CD            [ 1] 2165 	cp a,#2  
      009C5A 9C 12            [ 1] 2166 	jreq 1$ 
      009C5C 4D 26 03         [ 2] 2167 	jp syntax_error
      002174                       2168 1$: 
      002174                       2169 	_xpop ; mask 
      009C5F CC 97            [ 1]    1     ld a,(y)
      009C61 08               [ 1]    2     ldw x,y 
      009C62 EE 01            [ 2]    3     ldw x,(1,x)
      009C62 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      009C66 01               [ 1] 2170 	ld a,xl 
      009C67 72               [ 1] 2171 	cpl a
      009C68 A9               [ 1] 2172 	push a  
      002180                       2173 	_xpop ; addr  
      009C69 00 03            [ 1]    1     ld a,(y)
      009C6B C7               [ 1]    2     ldw x,y 
      009C6C 00 0D            [ 2]    3     ldw x,(1,x)
      009C6E CF 00 0E 90      [ 2]    4     addw y,#CELL_SIZE 
      009C72 F6               [ 1] 2174 	pop a 
      009C73 93               [ 1] 2175 	and a,(x)
      009C74 EE               [ 1] 2176 	ld (x),a 
      009C75 01               [ 4] 2177 	ret 
                                   2178 
                                   2179 ;---------------------
                                   2180 ; BASIC: BTOGL addr,mask
                                   2181 ; toggle bits at 'addr' corresponding 
                                   2182 ; to those of 'mask' that are at 1.
                                   2183 ; arguments:
                                   2184 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2185 ;   mask	    mask^*addr  
                                   2186 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2187 ;	none 
                                   2188 ;--------------------------
      00218D                       2189 bit_toggle:
      009C76 72 A9 00         [ 4] 2190 	call arg_list 
      009C79 03 C4            [ 1] 2191 	cp a,#2 
      009C7B 00 0D            [ 1] 2192 	jreq 1$ 
      009C7D 02 C4 00         [ 2] 2193 	jp syntax_error
      002197                       2194 1$: _xpop ; mask 
      009C80 0E 02            [ 1]    1     ld a,(y)
      009C82 C4               [ 1]    2     ldw x,y 
      009C83 00 0F            [ 2]    3     ldw x,(1,x)
      009C85 02 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      009C89 03               [ 1] 2195 	ld a,xl
      009C8A 90               [ 1] 2196 	push a 
      0021A2                       2197 	_xpop  ; addr  
      009C8B F7 90            [ 1]    1     ld a,(y)
      009C8D EF               [ 1]    2     ldw x,y 
      009C8E 01 20            [ 2]    3     ldw x,(1,x)
      009C90 B7 A6 84 81      [ 2]    4     addw y,#CELL_SIZE 
      009C94 84               [ 1] 2198 	pop a 
      009C94 52               [ 1] 2199 	xor a,(x)
      009C95 02               [ 1] 2200 	ld (x),a 
      009C96 CD               [ 4] 2201 	ret 
                                   2202 
                                   2203 
                                   2204 ;---------------------
                                   2205 ; BASIC: BTEST(addr,bit)
                                   2206 ; return bit value at 'addr' 
                                   2207 ; bit is in range {0..7}.
                                   2208 ; arguments:
                                   2209 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2210 ;   bit 	    bit position {0..7}  
                                   2211 ; output:
                                   2212 ;	A:X       bit value  
                                   2213 ;--------------------------
      0021AF                       2214 bit_test:
      009C97 9C 42 4D         [ 4] 2215 	call func_args 
      009C9A 27 69            [ 1] 2216 	cp a,#2
      009C9C CD 98            [ 1] 2217 	jreq 0$
      009C9E 6F A1 89         [ 2] 2218 	jp syntax_error
      0021B9                       2219 0$:	
      0021B9                       2220 	_xpop 
      009CA1 27 0B            [ 1]    1     ld a,(y)
      009CA3 A1               [ 1]    2     ldw x,y 
      009CA4 8A 27            [ 2]    3     ldw x,(1,x)
      009CA6 07 55 00 04      [ 2]    4     addw y,#CELL_SIZE 
      009CAA 00               [ 1] 2221 	ld a,xl 
      009CAB 02 20            [ 1] 2222 	and a,#7
      009CAD 55               [ 1] 2223 	push a   
      009CAE 6B 02            [ 1] 2224 	ld a,#1 
      009CB0 CD 9C            [ 1] 2225 1$: tnz (1,sp)
      009CB2 42 A1            [ 1] 2226 	jreq 2$
      009CB4 84               [ 1] 2227 	sll a 
      009CB5 27 03            [ 1] 2228 	dec (1,sp)
      009CB7 CC 97            [ 2] 2229 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009CB9 08 01            [ 1] 2230 2$: ld (1,sp),a  
      009CBA                       2231 	_xpop ; address  
      009CBA 90 F6            [ 1]    1     ld a,(y)
      009CBC 93               [ 1]    2     ldw x,y 
      009CBD EE 01            [ 2]    3     ldw x,(1,x)
      009CBF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CC3 C7               [ 1] 2232 	pop a 
      009CC4 00               [ 1] 2233 	and a,(x)
      009CC5 0D CF            [ 1] 2234 	jreq 3$
      009CC7 00 0E            [ 1] 2235 	ld a,#1 
      009CC9 90               [ 1] 2236 3$:	clrw x 
      009CCA F6               [ 1] 2237 	ld xl,a
      009CCB 93               [ 1] 2238 	clr a  
      009CCC EE               [ 4] 2239 	ret
                                   2240 
                                   2241 ;--------------------
                                   2242 ; BASIC: POKE addr,byte
                                   2243 ; put a byte at addr 
                                   2244 ;--------------------
      0021E6                       2245 poke:
      009CCD 01 72 A9         [ 4] 2246 	call arg_list 
      009CD0 00 03            [ 1] 2247 	cp a,#2
      009CD2 6B 01            [ 1] 2248 	jreq 1$
      009CD4 7B 02 A1         [ 2] 2249 	jp syntax_error
      0021F0                       2250 1$:	
      0021F0                       2251 	_xpop ; byte   
      009CD7 8A 27            [ 1]    1     ld a,(y)
      009CD9 10               [ 1]    2     ldw x,y 
      009CDA EE 01            [ 2]    3     ldw x,(1,x)
      009CDA 7B 01 CA 00      [ 2]    4     addw y,#CELL_SIZE 
      009CDE 0D               [ 1] 2252     ld a,xl 
      009CDF 02               [ 1] 2253 	push a 
      0021FB                       2254 	_xpop ; address 
      009CE0 CA 00            [ 1]    1     ld a,(y)
      009CE2 0E               [ 1]    2     ldw x,y 
      009CE3 02 CA            [ 2]    3     ldw x,(1,x)
      009CE5 00 0F 02 20      [ 2]    4     addw y,#CELL_SIZE 
      009CE9 0E               [ 1] 2255 	pop a 
      009CEA F7               [ 1] 2256 	ld (x),a 
      009CEA 7B               [ 4] 2257 	ret 
                                   2258 
                                   2259 ;-----------------------
                                   2260 ; BASIC: PEEK(addr)
                                   2261 ; get the byte at addr 
                                   2262 ; input:
                                   2263 ;	none 
                                   2264 ; output:
                                   2265 ;	X 		value 
                                   2266 ;-----------------------
      002207                       2267 peek:
      009CEB 01 C8 00         [ 4] 2268 	call func_args
      009CEE 0D 02            [ 1] 2269 	cp a,#1 
      009CF0 C8 00            [ 1] 2270 	jreq 1$
      009CF2 0E 02 C8         [ 2] 2271 	jp syntax_error
      002211                       2272 1$: _xpop ; address  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009CF5 00 0F            [ 1]    1     ld a,(y)
      009CF7 02               [ 1]    2     ldw x,y 
      009CF8 72 A2            [ 2]    3     ldw x,(1,x)
      009CFA 00 03 90 F7      [ 2]    4     addw y,#CELL_SIZE 
      009CFE 90 EF 01         [ 1] 2273 	ld farptr,a 
      009D01 20 99 A6         [ 2] 2274 	ldw ptr16,x 
      009D04 84 5B 02 81      [ 5] 2275 	ldf a,[farptr]
      009D08 5F               [ 1] 2276 	clrw x 
      009D08 35               [ 1] 2277 	ld xl,a 
      009D09 10               [ 1] 2278 	clr a 
      009D0A 00               [ 4] 2279 	ret 
                                   2280 
                                   2281 ;---------------------------
                                   2282 ; BASIC IF expr : instructions
                                   2283 ; evaluate expr and if true 
                                   2284 ; execute instructions on same line. 
                                   2285 ;----------------------------
      002228                       2286 if: 
      009D0B 0B 81 14         [ 4] 2287 	call condition  
      009D0D                       2288 	_xpop 
      009D0D 35 0A            [ 1]    1     ld a,(y)
      009D0F 00               [ 1]    2     ldw x,y 
      009D10 0B 81            [ 2]    3     ldw x,(1,x)
      009D12 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D12 4F               [ 1] 2289 	tnz  a  
      009D13 AE 16            [ 1] 2290 	jrne 9$
      009D15 90               [ 2] 2291 	tnzw x 
      009D16 72 B0            [ 1] 2292 	jrne 9$  
                                   2293 ;skip to next line
      009D18 00 33 81 00 01   [ 1] 2294 	mov in,count
      009D1B                       2295 	_drop 2 
      009D1B 3B 00            [ 2]    1     addw sp,#2 
      009D1D 0B AE 9F         [ 2] 2296 	jp next_line
      009D20 08               [ 4] 2297 9$:	ret 
                                   2298 
                                   2299 ;------------------------
                                   2300 ; BASIC: FOR var=expr 
                                   2301 ; set variable to expression 
                                   2302 ; leave variable address 
                                   2303 ; on stack and set
                                   2304 ; FLOOP bit in 'flags'
                                   2305 ;-----------------
                           000001  2306 	RETL1=1 ; return address  
                           000003  2307 	FSTEP=3  ; variable increment int24
                           000006  2308 	LIMIT=6 ; loop limit, int24  
                           000009  2309 	CVAR=9   ; control variable 
                           00000B  2310 	INW=11   ;  in.w saved
                           00000D  2311 	BPTR=13 ; baseptr saved
                           00000D  2312 	VSIZE=13  
      002245                       2313 for: ; { -- var_addr }
      009D21 CD               [ 2] 2314 	popw x ; call return address 
      002246                       2315 	_vars VSIZE 
      009D22 89 DC            [ 2]    1     sub sp,#VSIZE 
      009D24 CE               [ 2] 2316 	pushw x  ; RETL1 
      009D25 00 1C            [ 1] 2317 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009D27 35 10 00         [ 4] 2318 	call expect
      009D2A 0B CD 98         [ 4] 2319 	call get_addr
      009D2D B7 32            [ 2] 2320 	ldw (CVAR,sp),x  ; control variable 
      009D2F 00 0B AE         [ 4] 2321 	call let_eval 
      009D32 9F 1A CD 89      [ 1] 2322 	bset flags,#FLOOP 
      009D36 DC CE 00         [ 4] 2323 	call next_token 
      009D39 1E 72            [ 1] 2324 	cp a,#TK_CMD 
      009D3B B0 00            [ 1] 2325 	jreq 1$
      009D3D 1C CD 98         [ 2] 2326 	jp syntax_error
      002264                       2327 1$:  
      002264                       2328 	_get_code_addr
      009D40 B7               [ 2]    1         ldw x,(x)
      009D41 AE 9F 2B CD      [ 1]    2         inc in 
      009D45 89 DC 81 01      [ 1]    3         inc in 
      009D48 A3 22 75         [ 2] 2329 	cpw x,#to   
      009D48 CD 9D            [ 1] 2330 	jreq to
      009D4A 12 A6 03         [ 2] 2331 	jp syntax_error 
                                   2332 
                                   2333 ;-----------------------------------
                                   2334 ; BASIC: TO expr 
                                   2335 ; second part of FOR loop initilization
                                   2336 ; leave limit on stack and set 
                                   2337 ; FTO bit in 'flags'
                                   2338 ;-----------------------------------
      002275                       2339 to: ; { var_addr -- var_addr limit step }
      009D4D 62 CF 00 21 4F   [ 2] 2340 	btjt flags,#FLOOP,1$
      009D52 81 16 88         [ 2] 2341 	jp syntax_error
      009D53 CD 1A FB         [ 4] 2342 1$: call expression   
      009D53 CD 98            [ 1] 2343 	cp a,#TK_INTGR 
      009D55 6F A1            [ 1] 2344 	jreq 2$ 
      009D57 85 27 0C         [ 2] 2345 	jp syntax_error
      002287                       2346 2$: _xpop
      009D5A A1 05            [ 1]    1     ld a,(y)
      009D5C 27               [ 1]    2     ldw x,y 
      009D5D 03 CC            [ 2]    3     ldw x,(1,x)
      009D5F 97 08 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D61 6B 06            [ 1] 2347 	ld (LIMIT,sp),a 
      009D61 CD 9A            [ 2] 2348 	ldw (LIMIT+1,sp),x
      009D63 53 20 03         [ 4] 2349 	call next_token
      009D66 A1 00            [ 1] 2350 	cp a,#TK_NONE  
      009D66 CD 98            [ 1] 2351 	jreq 4$ 
      009D68 97 80            [ 1] 2352 	cp a,#TK_CMD
      009D69 26 0E            [ 1] 2353 	jrne 3$
      00229F                       2354 	_get_code_addr
      009D69 CF               [ 2]    1         ldw x,(x)
      009D6A 00 1A CD 98      [ 1]    2         inc in 
      009D6E 6F A1 32 27      [ 1]    3         inc in 
      009D72 03 CC 97         [ 2] 2355 	cpw x,#step 
      009D75 08 0E            [ 1] 2356 	jreq step
      009D76                       2357 3$:	
      0022AD                       2358 	_unget_token   	 
      009D76 CD 9C 94 A1 84   [ 1]    1      mov in,in.saved  
      0022B2                       2359 4$:	
      009D7B 27 03            [ 1] 2360 	clr (FSTEP,sp) 
      009D7D CC 97 08         [ 2] 2361 	ldw x,#1   ; default step  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009D80 1F 04            [ 2] 2362 	ldw (FSTEP+1,sp),x 
      009D80 90 F6            [ 2] 2363 	jra store_loop_addr 
                                   2364 
                                   2365 
                                   2366 ;----------------------------------
                                   2367 ; BASIC: STEP expr 
                                   2368 ; optional third par of FOR loop
                                   2369 ; initialization. 	
                                   2370 ;------------------------------------
      0022BB                       2371 step: ; {var limit -- var limit step}
      009D82 93 EE 01 72 A9   [ 2] 2372 	btjt flags,#FLOOP,1$
      009D87 00 03 88         [ 2] 2373 	jp syntax_error
      009D89 CD 1A FB         [ 4] 2374 1$: call expression 
      009D89 72 C7            [ 1] 2375 	cp a,#TK_INTGR
      009D8B 00 1A            [ 1] 2376 	jreq 2$
      009D8D 72 5C 00         [ 2] 2377 	jp syntax_error
      0022CD                       2378 2$:	
      0022CD                       2379 	_xpop 
      009D90 1B 72            [ 1]    1     ld a,(y)
      009D92 CF               [ 1]    2     ldw x,y 
      009D93 00 1A            [ 2]    3     ldw x,(1,x)
      009D95 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D96 6B 03            [ 1] 2380 	ld (FSTEP,sp),a 
      009D96 F6 A4            [ 2] 2381 	ldw (FSTEP+1,sp),x ; step
                                   2382 ; if step < 0 decrement LIMIT 
      009D98 0F               [ 1] 2383 	tnz a
      009D99 A0 03            [ 1] 2384 	jrpl store_loop_addr 
      009D9B 88 4B            [ 1] 2385 	ld a,(LIMIT,sp)
      009D9D 00 72            [ 2] 2386 	ldw x,(LIMIT+1,sp)
      009D9F FB 01 F6         [ 2] 2387 	subw x,#1 
      009DA2 EE 01            [ 1] 2388 	sbc a,#0 
      009DA4 5B 02            [ 1] 2389 	ld (LIMIT,sp),a 
      009DA6 81 07            [ 2] 2390 	ldw (LIMIT+1,sp),x 
                                   2391 ; leave loop back entry point on cstack 
                                   2392 ; cstack is 1 call deep from interpreter
      009DA7                       2393 store_loop_addr:
      009DA7 AE 40 00         [ 2] 2394 	ldw x,basicptr
      009DAA 35 08            [ 2] 2395 	ldw (BPTR,sp),x 
      009DAC 00 0F A3         [ 2] 2396 	ldw x,in.w 
      009DAF 47 F8            [ 2] 2397 	ldw (INW,sp),x   
      009DB1 24 17 F6 26      [ 1] 2398 	bres flags,#FLOOP 
      009DB5 0C 5C 72 5A      [ 1] 2399 	inc loop_depth  
      009DB9 00               [ 4] 2400 	ret 
                                   2401 
                                   2402 ;--------------------------------
                                   2403 ; BASIC: NEXT var 
                                   2404 ; FOR loop control 
                                   2405 ; increment variable with step 
                                   2406 ; and compare with limit 
                                   2407 ; loop if threshold not crossed.
                                   2408 ; else stack. 
                                   2409 ; and decrement 'loop_depth' 
                                   2410 ;--------------------------------
      0022FD                       2411 next: ; {var limit step retl1 -- [var limit step ] }
      009DBA 0F 26 F6 1D      [ 1] 2412 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009DBE 00 08            [ 1] 2413 	jrne 1$ 
      009DC0 20 09 F6         [ 2] 2414 	jp syntax_error 
      002306                       2415 1$: 
      009DC3 5C 4D            [ 1] 2416 	ld a,#TK_VAR 
      009DC5 26 FB 5A         [ 4] 2417 	call expect
      009DC8 20 E0 5F         [ 4] 2418 	call get_addr 
                                   2419 ; check for good variable after NEXT 	 
      009DCB 4F CF            [ 2] 2420 	cpw x,(CVAR,sp)
      009DCD 00 25            [ 1] 2421 	jreq 2$  
      009DCF 81 16 88         [ 2] 2422 	jp syntax_error ; not the good one 
      009DD0                       2423 2$: 
      009DD0 90 89 52         [ 2] 2424 	ldw ptr16,x 
                                   2425 	; increment variable 
      009DD3 08               [ 1] 2426 	ld a,(x)
      009DD4 72 5F            [ 2] 2427 	ldw x,(1,x)  ; get var value 
      009DD6 00 0E 6B         [ 2] 2428 	addw x,(FSTEP+1,sp) ; var+step 
      009DD9 05 1F            [ 1] 2429 	adc a,(FSTEP,sp)
      009DDB 01 CE 00 33      [ 4] 2430 	ld [ptr16],a
      009DDF 1F 07 90 CE      [ 1] 2431 	inc ptr8  
      009DE3 00 31 17 03      [ 5] 2432 	ldw [ptr16],x 
      009DE7 93 13 07         [ 1] 2433 	ld acc24,a 
      009DEA 24 20 90         [ 2] 2434 	ldw acc16,x 
      009DED F6 A4            [ 1] 2435 	ld a,(LIMIT,sp)
      009DEF 0F 11            [ 2] 2436 	ldw x,(LIMIT+1,sp)
      009DF1 05 26 09 90      [ 2] 2437 	subw x,acc16 
      009DF5 5C 1E 01         [ 1] 2438 	sbc a,acc24
      009DF8 CD 94            [ 1] 2439 	xor a,(FSTEP,sp)
      009DFA 11 26            [ 1] 2440 	xor a,#0x80
      009DFC 13 12            [ 1] 2441 	jrmi loop_back  
      009DFD 20 25            [ 2] 2442 	jra loop_done   
                                   2443 ; check sign of STEP  
      009DFD 16 03            [ 1] 2444 	ld a,(FSTEP,sp)
      009DFF 90 F6            [ 1] 2445 	jrpl 4$
                                   2446 ;negative step
      009E01 A4 0F C7         [ 1] 2447     ld a,acc8 
      009E04 00 0F            [ 1] 2448 	jrslt loop_back   
      009E06 72 B9            [ 2] 2449 	jra loop_done  
      002350                       2450 4$: ; positive step
      009E08 00 0E 20 D9 15   [ 2] 2451 	btjt acc8,#7,loop_done 
      009E0C                       2452 loop_back:
      009E0C 0F 03            [ 2] 2453 	ldw x,(BPTR,sp)
      009E0E 0F 04 04         [ 2] 2454 	ldw basicptr,x 
      009E10 72 01 00 22 05   [ 2] 2455 	btjf flags,#FRUN,1$ 
      009E10 1E 03            [ 1] 2456 	ld a,(2,x)
      009E12 5B 08 90         [ 1] 2457 	ld count,a
      009E15 85 81            [ 2] 2458 1$:	ldw x,(INW,sp)
      009E17 CF 00 00         [ 2] 2459 	ldw in.w,x 
      009E17 72               [ 4] 2460 	ret 
      00236A                       2461 loop_done:
                                   2462 	; remove loop data from stack  
      009E18 00               [ 2] 2463 	popw x
      00236B                       2464 	_drop VSIZE 
      009E19 00 23            [ 2]    1     addw sp,#VSIZE 
      009E1B 05 A6 06 CC      [ 1] 2465 	dec loop_depth 
      009E1F 97               [ 2] 2466 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2467 
                                   2468 ;----------------------------
                                   2469 ; called by goto/gosub
                                   2470 ; to get target line number 
                                   2471 ; output:
                                   2472 ;    x    line address 
                                   2473 ;---------------------------
      002372                       2474 get_target_line:
      009E20 0A 17 EF         [ 4] 2475 	call next_token  
      009E21 A1 84            [ 1] 2476 	cp a,#TK_INTGR
      009E21 52 05            [ 1] 2477 	jreq get_target_line_addr 
      009E23 A6 80            [ 1] 2478 	cp a,#TK_LABEL 
      009E25 6B 05            [ 1] 2479 	jreq look_target_symbol 
      009E27 0F 03 20         [ 2] 2480 	jp syntax_error
                                   2481 ; the target is a line number 
                                   2482 ; search it. 
      002380                       2483 get_target_line_addr:
      009E2A 10 89            [ 2] 2484 	pushw y 
      009E2B CD 18 21         [ 4] 2485 	call get_int24 ; line # 
      009E2B 72               [ 1] 2486 	clr a
      009E2C 00 00 23 05      [ 2] 2487 	ldw y,basicptr 
      009E30 A6 06            [ 2] 2488 	ldw y,(y)
      009E32 CC 97            [ 2] 2489 	pushw y 
      009E34 0A 01            [ 2] 2490 	cpw x,(1,sp)
      009E35                       2491 	_drop 2  
      009E35 52 05            [ 2]    1     addw sp,#2 
      009E37 0F 03            [ 1] 2492 	jrult 11$
      009E39 0F               [ 1] 2493 	inc a 
      002395                       2494 11$: ; scan program for this line# 	
      009E3A 05 0C 45         [ 4] 2495 	call search_lineno  
      009E3B 5D               [ 2] 2496 	tnzw x ; 0| line# address 
      009E3B CD 98            [ 1] 2497 	jrne 2$ 
      009E3D 6F A1            [ 1] 2498 	ld a,#ERR_NO_LINE 
      009E3F 03 27 03         [ 2] 2499 	jp tb_error 
      009E42 CC 97            [ 2] 2500 2$:	popw y  
      009E44 08               [ 4] 2501 	ret 
                                   2502 
                                   2503 ; the GOTO|GOSUB target is a symbol.
                                   2504 ; output:
                                   2505 ;    X    line address|0 
      0023A3                       2506 look_target_symbol:
      009E45 1F 01            [ 2] 2507 	pushw y 
      009E47 CD               [ 2] 2508 	pushw x 
      009E48 94 06 AB         [ 4] 2509 	call skip_string 
      009E4B 05 6B 04 CD      [ 1] 2510 	clr acc16 
      009E4F 98 88 7B 04      [ 2] 2511 	ldw y,txtbgn 
      009E53 1E 01 CD         [ 1] 2512 1$:	ld a,(3,y) ; first TK_ID on line 
      009E56 9D D0            [ 1] 2513 	cp a,#TK_LABEL 
      009E58 5D 27            [ 1] 2514 	jreq 3$ 
      009E5A 05 A6 08         [ 1] 2515 2$:	ld a,(2,y); line length 
      009E5D CC 97 0A         [ 1] 2516 	ld acc8,a 
      009E60 CE 00 33 7B      [ 2] 2517 	addw y,acc16 ;point to next line 
      009E64 04 1A 05 F7      [ 2] 2518 	cpw y,txtend 
      009E68 5C 90            [ 1] 2519 	jrult 1$
      009E6A 89 16            [ 1] 2520 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009E6C 03 CD 94         [ 2] 2521 	jp tb_error 
      0023CD                       2522 3$: ; found a TK_LABEL 
                                   2523 	; compare with GOTO|GOSUB target 
      009E6F 22 90            [ 2] 2524 	pushw y ; line address 
      009E71 85 5A 72 FB      [ 2] 2525 	addw y,#4 ; label string 
      009E75 03 CF            [ 2] 2526 	ldw x,(3,sp) ; target string 
      009E77 00 33 1D         [ 4] 2527 	call strcmp
      009E7A 00 03            [ 1] 2528 	jrne 4$
      009E7C 7F 6F            [ 2] 2529 	popw y 
      009E7E 01 6F            [ 2] 2530 	jra 2$ 
      0023DE                       2531 4$: ; target found 
      009E80 02               [ 2] 2532 	popw x ;  address line target  
      0023DF                       2533 	_drop 2 ; target string 
      009E81 CD 98            [ 2]    1     addw sp,#2 
      009E83 6F A1            [ 2] 2534 	popw y 
      009E85 08               [ 4] 2535 	ret
                                   2536 
                                   2537 
                                   2538 ;--------------------------------
                                   2539 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2540 ; selective goto or gosub 
                                   2541 ;--------------------------------
      0023E4                       2542 cmd_on:
      009E86 27 B3 A1 32 26   [ 2] 2543 	btjt flags,#FRUN,0$ 
      009E8B 2A CD            [ 1] 2544 	ld a,#ERR_RUN_ONLY
      009E8D 9C 94 A1         [ 2] 2545 	jp tb_error 
      009E90 84 27 03         [ 4] 2546 0$:	call expression 
      009E93 CC 97            [ 1] 2547 	cp a,#TK_INTGR
      009E95 08 CE            [ 1] 2548 	jreq 1$
      009E97 00 33 1D         [ 2] 2549 	jp syntax_error
      0023F8                       2550 1$: _xpop
      009E9A 00 03            [ 1]    1     ld a,(y)
      009E9C CF               [ 1]    2     ldw x,y 
      009E9D 00 1A            [ 2]    3     ldw x,(1,x)
      009E9F 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
                                   2551 ; the selector is the element indice 
                                   2552 ; in the list of arguments. {1..#elements} 
      009EA3 01               [ 1] 2553 	ld a,xl ; keep only bits 7..0
      009EA4 72 A9            [ 1] 2554 	jreq 9$ ; element # begin at 1. 
      009EA6 00               [ 1] 2555 	push a  ; selector  
      009EA7 03 72 C7         [ 4] 2556 	call next_token
      009EAA 00 1A            [ 1] 2557 	cp a,#TK_CMD 
      009EAC 72 5C            [ 1] 2558 	jreq 2$ 
      009EAE 00 1B 72         [ 2] 2559 	jp syntax_error 
      00240F                       2560 2$: _get_code_addr
      009EB1 CF               [ 2]    1         ldw x,(x)
      009EB2 00 1A 20 CB      [ 1]    2         inc in 
      009EB6 72 5C 00 01      [ 1]    3         inc in 
                                   2561 ;; must be a GOTO or GOSUB 
      009EB6 55 00 04         [ 2] 2562 	cpw x,#goto 
      009EB9 00 02            [ 1] 2563 	jreq 4$
      009EBB 5B 05 CD         [ 2] 2564 	cpw x,#gosub 
      009EBE 9D 48            [ 1] 2565 	jreq 4$ 
      009EC0 81 16 88         [ 2] 2566 	jp syntax_error 
      009EC1                       2567 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009EC1 CE               [ 1] 2568 	pop a 
      009EC2 00               [ 2] 2569 	pushw x ; save routine address 	
      009EC3 1E               [ 1] 2570 	push a  ; selector  
      002428                       2571 5$: ; skip elements in list until selector==0 
      009EC4 72 B0            [ 1] 2572 	dec (1,sp)
      009EC6 00 1C            [ 1] 2573 	jreq 6$ 
                                   2574 ; can be a line# or a label 
      009EC8 81 17 EF         [ 4] 2575 	call next_token 
      009EC9 A1 84            [ 1] 2576 	cp a,#TK_INTGR 
      009EC9 AE 9F            [ 1] 2577 	jreq 52$
      009ECB 08 CD            [ 1] 2578 	cp a,#TK_LABEL 
      009ECD 89 DC            [ 1] 2579 	jreq 54$
      009ECF CE 00 1C         [ 2] 2580 	jp syntax_error 
      00243A                       2581 52$: ; got a line number 
      009ED2 35 10 00         [ 1] 2582 	ld a,in ; skip over int24 value 
      009ED5 0B CD            [ 1] 2583 	add a,#CELL_SIZE ; integer size  
      009ED7 98 B7 35         [ 1] 2584 	ld in,a 
      009EDA 0A 00            [ 2] 2585 	jra 56$
      009EDC 0B AE 9F         [ 4] 2586 54$: call skip_string ; skip over label 	
      002447                       2587 56$: ; if another element comma present 
      009EDF 1A CD 89         [ 4] 2588 	call next_token
      009EE2 DC CD            [ 1] 2589 	cp a,#TK_COMMA 
      009EE4 9E C1            [ 1] 2590 	jreq 5$ 
                                   2591 ; arg list exhausted, selector to big 
                                   2592 ; continue execution on next line 
      00244E                       2593 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EE6 CD 98            [ 2]    1     addw sp,#3 
      009EE8 B7 AE            [ 2] 2594 	jra 9$
      002452                       2595 6$: ;at selected position  
      002452                       2596 	_drop 1 ; discard selector
      009EEA 9F 2B            [ 2]    1     addw sp,#1 
                                   2597 ; here only the routine address 
                                   2598 ; of GOTO|GOSUB is on stack 
      009EEC CD 89 DC         [ 4] 2599     call get_target_line
      009EEF CE 00 1C         [ 2] 2600 	ldw ptr16,x 	
      009EF2 A3 B9 04 25 05   [ 1] 2601 	mov in,count ; move to end of line  
      009EF7 AE               [ 2] 2602 	popw x ; cmd address, GOTO||GOSUB 
      009EF8 9F 32 20         [ 2] 2603 	cpw x,#goto 
      009EFB 03 AE            [ 1] 2604 	jrne 7$ 
      009EFD 9F 43 CD         [ 2] 2605 	ldw x,ptr16 
      009F00 89 DC            [ 2] 2606 	jra jp_to_target
      00246A                       2607 7$: 
      009F02 A6 0D            [ 2] 2608 	jra gosub_2 ; target in ptr16 
      00246C                       2609 9$: ; expr out of range skip to end of line
                                   2610     ; this will force a fall to next line  
      009F04 CD 89 7F 81 70   [ 1] 2611 	mov in,count
      002471                       2612 	_drop 2
      009F09 72 6F            [ 2]    1     addw sp,#2 
      009F0B 67 72 61         [ 2] 2613 	jp next_line  
                                   2614 
                                   2615 
                                   2616 ;------------------------
                                   2617 ; BASIC: GOTO line# 
                                   2618 ; jump to line# 
                                   2619 ; here cstack is 2 call deep from interpreter 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                   2620 ;------------------------
      002476                       2621 goto:
      009F0E 6D 20 61 64 64   [ 2] 2622 	btjt flags,#FRUN,goto_1  
      009F13 72 65            [ 1] 2623 	ld a,#ERR_RUN_ONLY
      009F15 73 73 3A         [ 2] 2624 	jp tb_error 
      002480                       2625 goto_1:
      009F18 20 00 2C         [ 4] 2626 	call get_target_line
      002483                       2627 jp_to_target:
      009F1B 20 70 72         [ 2] 2628 	ldw basicptr,x 
      009F1E 6F 67            [ 1] 2629 	ld a,(2,x)
      009F20 72 61 6D         [ 1] 2630 	ld count,a 
      009F23 20 73 69 7A      [ 1] 2631 	mov in,#3 
      009F27 65               [ 4] 2632 	ret 
                                   2633 
                                   2634 
                                   2635 ;--------------------
                                   2636 ; BASIC: GOSUB line#
                                   2637 ; basic subroutine call
                                   2638 ; actual line# and basicptr 
                                   2639 ; are saved on cstack
                                   2640 ; here cstack is 2 call deep from interpreter 
                                   2641 ;--------------------
                           000001  2642 	RET_ADDR=1 ; subroutine return address 
                           000003  2643 	RET_BPTR=3 ; basicptr return point 
                           000005  2644 	RET_INW=5  ; in.w return point 
                           000004  2645 	VSIZE=4 
      002490                       2646 gosub:
      009F28 3A 20 00 20 62   [ 2] 2647 	btjt flags,#FRUN,gosub_1 
      009F2D 79 74            [ 1] 2648 	ld a,#ERR_RUN_ONLY
      009F2F 65 73 00         [ 2] 2649 	jp tb_error 
      009F32 20               [ 4] 2650 	ret 
      00249B                       2651 gosub_1:
      009F33 69 6E 20         [ 4] 2652 	call get_target_line 
      009F36 46 4C 41         [ 2] 2653 	ldw ptr16,x
      0024A1                       2654 gosub_2: 
      009F39 53               [ 2] 2655 	popw x 
      0024A2                       2656 	_vars VSIZE  
      009F3A 48 20            [ 2]    1     sub sp,#VSIZE 
      009F3C 6D               [ 2] 2657 	pushw x ; RET_ADDR 
                                   2658 ; save BASIC subroutine return point.   
      009F3D 65 6D 6F         [ 2] 2659 	ldw x,basicptr
      009F40 72 79            [ 2] 2660 	ldw (RET_BPTR,sp),x 
      009F42 00 20 69         [ 2] 2661 	ldw x,in.w 
      009F45 6E 20            [ 2] 2662 	ldw (RET_INW,sp),x
      009F47 52 41 4D         [ 2] 2663 	ldw x,ptr16  
      009F4A 20 6D            [ 2] 2664 	jra jp_to_target
                                   2665 
                                   2666 ;------------------------
                                   2667 ; BASIC: RETURN 
                                   2668 ; exit from BASIC subroutine 
                                   2669 ;------------------------
      0024B4                       2670 return:
      009F4C 65 6D 6F 72 79   [ 2] 2671 	btjt flags,#FRUN,0$ 
      009F51 00 06            [ 1] 2672 	ld a,#ERR_RUN_ONLY
      009F52 CC 16 8A         [ 2] 2673 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      0024BE                       2674 0$:	
      009F52 72 01            [ 2] 2675 	ldw x,(RET_BPTR,sp) 
      009F54 00 23 05         [ 2] 2676 	ldw basicptr,x
      009F57 A6 07            [ 1] 2677 	ld a,(2,x)
      009F59 CC 97 0A         [ 1] 2678 	ld count,a  
      009F5C 1E 05            [ 2] 2679 	ldw x,(RET_INW,sp)
      009F5C CD 9E C1         [ 2] 2680 	ldw in.w,x 
      009F5F 22               [ 2] 2681 	popw x 
      0024CE                       2682 	_drop VSIZE 
      009F60 01 81            [ 2]    1     addw sp,#VSIZE 
      009F62 52               [ 2] 2683 	jp (x)
                                   2684 
                                   2685 
                                   2686 ;---------------------------------
                                   2687 ; check if A:X contain the address 
                                   2688 ; of a program in FLASH 
                                   2689 ; output:
                                   2690 ;     Z    set is progam 
                                   2691 ;----------------------------------
      0024D1                       2692 is_program_addr:
      009F63 06               [ 1] 2693 	tnz a 
      009F64 CE 00            [ 1] 2694 	jrne 9$
      009F66 1C 1F 05         [ 2] 2695 	cpw x,#app_space 
      009F69 FE 1F            [ 1] 2696 	jrult 8$
      009F6B 01               [ 2] 2697 	pushw x 
      009F6C AE 7F FF         [ 4] 2698 	call qsign 
      009F6F 1F               [ 2] 2699 	popw x 
      009F70 03 CD            [ 1] 2700 	jreq 9$ 
      009F72 9A               [ 1] 2701 8$:	cpl a ; clr Z bit  
      009F73 37               [ 4] 2702 9$:	ret 
                                   2703 
                                   2704 ;----------------------------------
                                   2705 ; BASIC: RUN [label]
                                   2706 ; run BASIC program in RAM
                                   2707 ;----------------------------------- 
      0024E2                       2708 cmd_run: 
      009F74 4D 27 31 A1 02   [ 2] 2709 	btjf flags,#FRUN,0$  
      009F79 27               [ 1] 2710 	clr a 
      009F7A 07               [ 4] 2711 	ret
      0024E9                       2712 0$: ; check for STOP condition 
      009F7B A1 01 27 06 CC   [ 2] 2713 	btjf flags,#FBREAK,1$
      0024EE                       2714 	_drop 2 
      009F80 97 08            [ 2]    1     addw sp,#2 
      009F82 85 1F 05         [ 4] 2715 	call rest_context
      009F85                       2716 	_drop CTXT_SIZE 
      009F85 85 1F            [ 2]    1     addw sp,#CTXT_SIZE 
      009F87 01 19 00 22      [ 1] 2717 	bres flags,#FBREAK 
      009F88 72 10 00 22      [ 1] 2718 	bset flags,#FRUN 
      009F88 CE 00 1C         [ 2] 2719 	jp interpreter 
      002500                       2720 1$:	; check for label option 
      009F8B 1F 05 C3         [ 4] 2721 	call next_token 
      009F8E 00 1E            [ 1] 2722 	cp a,#TK_LABEL 
      009F90 2A 38            [ 1] 2723 	jrne 3$
      009F92 FE               [ 2] 2724 	pushw x 
      009F93 13 01 2A         [ 4] 2725 	call skip_string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009F96 11               [ 2] 2726 	popw x  
      009F97 1E 05 E6         [ 4] 2727 	call search_program
      009F9A 02 C7            [ 1] 2728 	jrne 2$
      009F9C 00 0F            [ 1] 2729 	ld a,#ERR_NO_PROGRAM
      009F9E 72 5F 00         [ 2] 2730 	jp tb_error 
      009FA1 0E 72 BB         [ 2] 2731 2$: ldw txtbgn,x 
      009FA4 00 0E 20         [ 2] 2732 	subw x,#2 
      009FA7 E3               [ 2] 2733 	ldw x,(x)
      009FA8 72 BB 00 1B      [ 2] 2734 	addw x,txtbgn 
      009FA8 1E 05 E6         [ 2] 2735 	ldw txtend,x 
      009FAB 02 CD            [ 2] 2736 	jra run_it 	
      002526                       2737 3$:	_unget_token 
      009FAD A0 19 1E 05 E6   [ 1]    1      mov in,in.saved  
      009FB2 02 C7 00         [ 2] 2738 	ldw x,txtbgn
      009FB5 0F 72 5F         [ 2] 2739 	cpw x,txtend 
      009FB8 00 0E            [ 1] 2740 	jrmi run_it 
      009FBA 72 BB 00         [ 2] 2741 	ldw x,#err_no_prog
      009FBD 0E C3 00         [ 4] 2742 	call puts 
      009FC0 1E 2A 07 1F 05   [ 1] 2743 	mov in,count
      009FC5 FE               [ 4] 2744 	ret 
      00253F                       2745 run_it:	 
      00253F                       2746 	_drop 2 ; drop return address 
      009FC6 13 03            [ 2]    1     addw sp,#2 
      002541                       2747 run_it_02: 
      009FC8 2F DE C8         [ 4] 2748     call ubound 
      009FCA CD 13 F6         [ 4] 2749 	call clear_vars
                                   2750 ; initialize DIM variables pointers 
      009FCA 55 00 03         [ 2] 2751 	ldw x,txtend 
      009FCD 00 02 AE         [ 2] 2752 	ldw dvar_bgn,x 
      009FD0 16 E0 CF         [ 2] 2753 	ldw dvar_end,x 	 
                                   2754 ; clear data pointer 
      009FD3 00               [ 1] 2755 	clrw x 
      009FD4 05 5B 06         [ 2] 2756 	ldw data_ptr,x 
      009FD7 CD 9E C9 81      [ 1] 2757 	clr data_ofs 
      009FDB 72 5F 00 09      [ 1] 2758 	clr data_len 
                                   2759 ; initialize BASIC pointer 
      009FDB A6 03 CD         [ 2] 2760 	ldw x,txtbgn 
      009FDE 9A 25 89         [ 2] 2761 	ldw basicptr,x 
      009FE1 CD 98            [ 1] 2762 	ld a,(2,x)
      009FE3 88 85 CD         [ 1] 2763 	ld count,a
      009FE6 B2 62 26 06      [ 1] 2764 	mov in,#3	
      009FEA AE 00 12 CC      [ 1] 2765 	bset flags,#FRUN 
      009FEE 97 0A 90         [ 2] 2766 	jp interpreter 
                                   2767 
                                   2768 
                                   2769 ;----------------------
                                   2770 ; BASIC: END
                                   2771 ; end running program
                                   2772 ;---------------------- 
                           000001  2773 	CHAIN_BP=1 
                           000003  2774 	CHAIN_IN=3
                           000005  2775 	CHAIN_TXTBGN=5
                           000007  2776 	CHAIN_TXTEND=7
                           000008  2777 	CHAIN_CNTX_SIZE=8  
      002572                       2778 cmd_end: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      002572                       2779 	_drop 2 ; no need for return address 
      009FF1 89 90            [ 2]    1     addw sp,#2 
                                   2780 ; check for chained program 
      009FF3 93 1D 00 04      [ 1] 2781 	tnz chain_level
      009FF7 EE 02            [ 1] 2782 	jreq 8$
                                   2783 ; restore chain context 
      009FF9 1C 00 04 CF      [ 1] 2784 	dec chain_level 
      009FFD 00 0E            [ 2] 2785 	ldw x,(CHAIN_BP,sp) ; chain saved basicptr 
      009FFF AE 00 8C         [ 2] 2786 	ldw basicptr,x 
      00A002 72 A2            [ 2] 2787 	ldw x,(CHAIN_IN,sp) ; chain saved in and count  
      00A004 00 04 CD         [ 2] 2788 	ldw in,x 
      00A007 94 32            [ 2] 2789 	ldw x,(CHAIN_TXTBGN,sp)
      00A009 AE 00 90         [ 2] 2790 	ldw txtbgn,x 
      00A00C CF 00            [ 2] 2791 	ldw x,(CHAIN_TXTEND,sp)
      00A00E 1C 72 BB         [ 2] 2792 	ldw txtend,x 
      002592                       2793 	_drop CHAIN_CNTX_SIZE ; CHAIN saved data size  
      00A011 00 8E            [ 2]    1     addw sp,#CHAIN_CNTX_SIZE 
      00A013 CF 00 1E         [ 2] 2794 	jp interp_loop
      002597                       2795 8$: ; clean stack 
      00A016 90 85 81         [ 2] 2796 	ldw x,#STACK_EMPTY
      00A019 94               [ 1] 2797 	ldw sp,x 
      00A019 90 89 C7         [ 2] 2798 	jp warm_start
                                   2799 
                                   2800 ;---------------------------
                                   2801 ; BASIC: GET var 
                                   2802 ; receive a key in variable 
                                   2803 ; don't wait 
                                   2804 ;---------------------------
      00259E                       2805 cmd_get:
      00A01C 00 03 E6         [ 4] 2806 	call next_token 
      00A01F 02 C1            [ 1] 2807 	cp a,#TK_VAR 
      00A021 00 03            [ 1] 2808 	jreq 0$
      00A023 2A 03 C7         [ 2] 2809 	jp syntax_error 
      00A026 00 03 CF         [ 4] 2810 0$: call get_addr 
      00A029 00 05 90         [ 2] 2811 	ldw ptr16,x 
      00A02C AE 16 90         [ 4] 2812 	call qgetc 
      00A02F CD 92            [ 1] 2813 	jreq 2$
      00A031 22 CD 89         [ 4] 2814 	call getc  
      00A034 DC A6 0D CD      [ 4] 2815 2$: clr [ptr16]
      00A038 89 7F 90 85      [ 1] 2816 	inc ptr8 
      00A03C 81 3F 00 19      [ 4] 2817 	clr [ptr16]
      00A03D 72 5C 00 1A      [ 1] 2818 	inc ptr8 
      00A03D 52 01 00 19      [ 4] 2819 	ld [ptr16],a 
      00A03F 81               [ 4] 2820 	ret 
                                   2821 
                                   2822 
                                   2823 ;-----------------
                                   2824 ; 1 Khz beep 
                                   2825 ;-----------------
      0025CB                       2826 beep_1khz:: 
      00A03F 0F 01            [ 2] 2827 	pushw y 
      00A041 AE 00 64         [ 2] 2828 	ldw x,#100
      00A041 CD 98 6F A1      [ 2] 2829 	ldw y,#1000
      00A045 02 25            [ 2] 2830 	jra beep
                                   2831 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2832 ;-----------------------
                                   2833 ; BASIC: TONE expr1,expr2
                                   2834 ; used TIMER2 channel 1
                                   2835 ; to produce a tone 
                                   2836 ; arguments:
                                   2837 ;    expr1   frequency 
                                   2838 ;    expr2   duration msec.
                                   2839 ;---------------------------
      0025D6                       2840 tone:
      00A047 08 A1            [ 2] 2841 	pushw y 
      00A049 0A 27 04         [ 4] 2842 	call arg_list 
      00A04C A1 80            [ 1] 2843 	cp a,#2 
      00A04E 26 07            [ 1] 2844 	jreq 1$
      00A050 CC 16 88         [ 2] 2845 	jp syntax_error 
      0025E2                       2846 1$: 
      0025E2                       2847 	_xpop 
      00A050 55 00            [ 1]    1     ld a,(y)
      00A052 04               [ 1]    2     ldw x,y 
      00A053 00 02            [ 2]    3     ldw x,(1,x)
      00A055 20 63 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A057 89               [ 2] 2848 	pushw x ; duration 
      0025EC                       2849 	_xpop ; frequency
      00A057 A1 02            [ 1]    1     ld a,(y)
      00A059 27               [ 1]    2     ldw x,y 
      00A05A 12 A1            [ 2]    3     ldw x,(1,x)
      00A05C 04 27 1B A1      [ 2]    4     addw y,#CELL_SIZE 
      00A060 82 27            [ 1] 2850 	ldw y,x ; frequency 
      00A062 1F               [ 2] 2851 	popw x  ; duration 
      0025F8                       2852 beep:  
      00A063 A1               [ 2] 2853 	pushw x 
      00A064 08 27 2A         [ 2] 2854 	ldw x,#TIM2_CLK_FREQ
      00A067 A1               [ 2] 2855 	divw x,y ; cntr=Fclk/freq 
                                   2856 ; round to nearest integer 
      00A068 09 27 2A 20      [ 2] 2857 	cpw y,#TIM2_CLK_FREQ/2
      00A06C 3D 01            [ 1] 2858 	jrmi 2$
      00A06D 5C               [ 1] 2859 	incw x 
      002604                       2860 2$:	 
      00A06D CD               [ 1] 2861 	ld a,xh 
      00A06E 89 DC 5C         [ 1] 2862 	ld TIM2_ARRH,a 
      00A071 72               [ 1] 2863 	ld a,xl 
      00A072 B0 00 05         [ 1] 2864 	ld TIM2_ARRL,a 
                                   2865 ; 50% duty cycle 
      00A075 CF               [ 1] 2866 	ccf 
      00A076 00               [ 2] 2867 	rrcw x 
      00A077 01               [ 1] 2868 	ld a,xh 
      00A078 20 C5 0F         [ 1] 2869 	ld TIM2_CCR1H,a 
      00A07A 9F               [ 1] 2870 	ld a,xl
      00A07A CD 98 B1         [ 1] 2871 	ld TIM2_CCR1L,a
      00A07D CD 89 7F 20      [ 1] 2872 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A081 BD 10 53 00      [ 1] 2873 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A082 72 10 53 04      [ 1] 2874 	bset TIM2_EGR,#TIM2_EGR_UG
      00A082 FE               [ 2] 2875 	popw x 
      00A083 72 5C 00         [ 4] 2876 	call pause02
      00A086 02 72 5C 00      [ 1] 2877 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A08A 02 FD CD 89      [ 1] 2878 	bres TIM2_CR1,#TIM2_CR1_CEN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A08E 7F 20            [ 2] 2879 	popw y 
      00A090 AE               [ 4] 2880 	ret 
                                   2881 
                                   2882 ;-------------------------------
                                   2883 ; BASIC: ADCON 0|1 [,divisor]  
                                   2884 ; disable/enanble ADC 
                                   2885 ;-------------------------------
                           000003  2886 	ONOFF=3 
                           000001  2887 	DIVSOR=1
                           000004  2888 	VSIZE=4 
      00A091                       2889 power_adc:
      00A091 03 01 20         [ 4] 2890 	call arg_list 
      00A094 AC 02            [ 1] 2891 	cp a,#2	
      00A095 27 12            [ 1] 2892 	jreq 1$
      00A095 CD 98            [ 1] 2893 	cp a,#1 
      00A097 6F A1            [ 1] 2894 	jreq 0$ 
      00A099 84 27 03         [ 2] 2895 	jp syntax_error 
      00A09C CC               [ 1] 2896 0$:	clr a 
      00A09D 97               [ 1] 2897 	clrw x
      002641                       2898 	_xpush   ; divisor  
      00A09E 08 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A09F 90 F7            [ 1]    2     ld (y),a 
      00A09F CD 98 A1         [ 2]    3     ldw (1,y),x 
      00264A                       2899 1$: _at_next 
      00A0A2 9F A4 0F         [ 1]    1     ld a,(3,y)
      00A0A5 C7               [ 1]    2     ldw x,y 
      00A0A6 00 24            [ 2]    3     ldw x,(4,x)
      00A0A8 20               [ 2] 2900 	tnzw x 
      00A0A9 95 25            [ 1] 2901 	jreq 2$ 
      00A0AA                       2902 	_xpop
      00A0AA 55 00            [ 1]    1     ld a,(y)
      00A0AC 04               [ 1]    2     ldw x,y 
      00A0AD 00 02            [ 2]    3     ldw x,(1,x)
      00A0AF CD 9C 94 4D      [ 2]    4     addw y,#CELL_SIZE 
      00265C                       2903 	_xdrop  
      00A0B3 27 05 CD 98      [ 2]    1     addw y,#CELL_SIZE 
      00A0B7 DC               [ 1] 2904 	ld a,xl
      00A0B8 20 85            [ 1] 2905 	and a,#7
      00A0BA 4E               [ 1] 2906 	swap a 
      00A0BA 0D 01 26         [ 1] 2907 	ld ADC_CR1,a
      00A0BD 05 A6 0D CD      [ 1] 2908 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0C1 89 7F 5B 01      [ 1] 2909 	bset ADC_CR1,#ADC_CR1_ADON 
      00266F                       2910 	_usec_dly 7 
      00A0C5 81 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      00A0C6 5A               [ 2]    2     decw x
      00A0C6 CE               [ 1]    3     nop 
      00A0C7 00 05            [ 1]    4     jrne .-4
      00A0C9 1F 03            [ 2] 2911 	jra 3$
      00A0CB C6 00 02 6B      [ 1] 2912 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0CF 05 C6 00 03      [ 1] 2913 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002680                       2914 3$:	
      00A0D3 6B               [ 4] 2915 	ret
                                   2916 
                                   2917 ;-----------------------------
                                   2918 ; BASIC: ADCREAD (channel)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   2919 ; read adc channel {0..5}
                                   2920 ; output:
                                   2921 ;   A 		TK_INTGR 
                                   2922 ;   X 		value 
                                   2923 ;-----------------------------
      002681                       2924 analog_read:
      00A0D4 06 81 B2         [ 4] 2925 	call func_args 
      00A0D6 A1 01            [ 1] 2926 	cp a,#1 
      00A0D6 1E 03            [ 1] 2927 	jreq 1$
      00A0D8 CF 00 05         [ 2] 2928 	jp syntax_error
      00268B                       2929 1$: _xpop 
      00A0DB 7B 05            [ 1]    1     ld a,(y)
      00A0DD C7               [ 1]    2     ldw x,y 
      00A0DE 00 02            [ 2]    3     ldw x,(1,x)
      00A0E0 7B 06 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A0E4 03 81 05         [ 2] 2930 	cpw x,#5 
      00A0E6 23 05            [ 2] 2931 	jrule 2$
      00A0E6 90 89            [ 1] 2932 	ld a,#ERR_BAD_VALUE
      00A0E8 52 05 8A         [ 2] 2933 	jp tb_error 
      00A0EA 9F               [ 1] 2934 2$: ld a,xl
      00A0EA 0F 05 CD         [ 1] 2935 	ld acc8,a 
      00A0ED 98 6F            [ 1] 2936 	ld a,#5
      00A0EF A1 02 26         [ 1] 2937 	sub a,acc8 
      00A0F2 10 CD 89         [ 1] 2938 	ld ADC_CSR,a
      00A0F5 DC 5C 72 B0      [ 1] 2939 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0F9 00 05 CF 00      [ 1] 2940 	bset ADC_CR1,#ADC_CR1_ADON
      00A0FD 01 03 05 CD 98   [ 2] 2941 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A102 6F A1 85         [ 2] 2942 	ldw x,ADC_DRH
      00A105 27 03            [ 1] 2943 	ld a,#TK_INTGR
      00A107 CC               [ 4] 2944 	ret 
                                   2945 
                                   2946 ;-----------------------
                                   2947 ; BASIC: DREAD(pin)
                                   2948 ; Arduino pins 
                                   2949 ; read state of a digital pin 
                                   2950 ; pin# {0..15}
                                   2951 ; output:
                                   2952 ;    A 		TK_INTGR
                                   2953 ;    X      0|1 
                                   2954 ;-------------------------
                           000001  2955 	PINNO=1
                           000001  2956 	VSIZE=1
      0026BD                       2957 digital_read:
      0026BD                       2958 	_vars VSIZE 
      00A108 97 08            [ 2]    1     sub sp,#VSIZE 
      00A10A CD 98 97         [ 4] 2959 	call func_args
      00A10D CF 00            [ 1] 2960 	cp a,#1
      00A10F 1A 0D            [ 1] 2961 	jreq 1$
      00A111 05 26 06         [ 2] 2962 	jp syntax_error
      0026C9                       2963 1$: _xpop 
      00A114 CD 92            [ 1]    1     ld a,(y)
      00A116 18               [ 1]    2     ldw x,y 
      00A117 CD 89            [ 2]    3     ldw x,(1,x)
      00A119 7F A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A11A A3 00 0F         [ 2] 2964 	cpw x,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A11A A6 3A            [ 2] 2965 	jrule 2$
      00A11C CD 89            [ 1] 2966 	ld a,#ERR_BAD_VALUE
      00A11E 7F CD A0         [ 2] 2967 	jp tb_error 
      00A121 C6 72 5F         [ 4] 2968 2$:	call select_pin 
      00A124 00 03            [ 1] 2969 	ld (PINNO,sp),a
      00A126 CD 8A            [ 1] 2970 	ld a,(GPIO_IDR,x)
      00A128 E1 AE            [ 1] 2971 	tnz (PINNO,sp)
      00A12A 16 90            [ 1] 2972 	jreq 8$
      00A12C 3B               [ 1] 2973 3$: srl a 
      00A12D 00 03            [ 1] 2974 	dec (PINNO,sp)
      00A12F 4B 00            [ 1] 2975 	jrne 3$ 
      00A131 72 FB            [ 1] 2976 8$: and a,#1 
      00A133 01               [ 1] 2977 	clrw x 
      00A134 5C               [ 1] 2978 	ld xl,a 
      00A135 5B               [ 1] 2979 	clr a 
      0026F1                       2980 	_drop VSIZE
      00A136 02 72            [ 2]    1     addw sp,#VSIZE 
      00A138 5F               [ 4] 2981 	ret
                                   2982 
                                   2983 
                                   2984 ;-----------------------
                                   2985 ; BASIC: DWRITE pin,0|1
                                   2986 ; Arduino pins 
                                   2987 ; write to a digital pin 
                                   2988 ; pin# {0..15}
                                   2989 ; output:
                                   2990 ;    A 		TK_INTGR
                                   2991 ;    X      0|1 
                                   2992 ;-------------------------
                           000001  2993 	PINNO=1
                           000002  2994 	PINVAL=2
                           000002  2995 	VSIZE=2
      0026F4                       2996 digital_write:
      0026F4                       2997 	_vars VSIZE 
      00A139 00 02            [ 2]    1     sub sp,#VSIZE 
      00A13B CD 8F 62         [ 4] 2998 	call arg_list  
      00A13E A1 84            [ 1] 2999 	cp a,#2 
      00A140 27 14            [ 1] 3000 	jreq 1$
      00A142 A1 11 26         [ 2] 3001 	jp syntax_error
      002700                       3002 1$: _xpop 
      00A145 07 CD            [ 1]    1     ld a,(y)
      00A147 8F               [ 1]    2     ldw x,y 
      00A148 62 A1            [ 2]    3     ldw x,(1,x)
      00A14A 84 27 06 03      [ 2]    4     addw y,#CELL_SIZE 
      00A14D 9F               [ 1] 3003 	ld a,xl 
      00A14D CD A0            [ 1] 3004 	ld (PINVAL,sp),a
      00270C                       3005 	_xpop 
      00A14F D6 CC            [ 1]    1     ld a,(y)
      00A151 97               [ 1]    2     ldw x,y 
      00A152 08 01            [ 2]    3     ldw x,(1,x)
      00A153 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A153 CD 82 9D         [ 2] 3006 	cpw x,#15 
      00A156 23 05            [ 2] 3007 	jrule 2$
      00A156 C6 00            [ 1] 3008 	ld a,#ERR_BAD_VALUE
      00A158 0D CE 00         [ 2] 3009 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A15B 0E 72 C7         [ 4] 3010 2$:	call select_pin 
      00A15E 00 1A            [ 1] 3011 	ld (PINNO,sp),a 
      00A160 72 5C            [ 1] 3012 	ld a,#1
      00A162 00 1B            [ 1] 3013 	tnz (PINNO,sp)
      00A164 72 CF            [ 1] 3014 	jreq 4$
      00A166 00               [ 1] 3015 3$: sll a
      00A167 1A CD            [ 1] 3016 	dec (PINNO,sp)
      00A169 A0 D6            [ 1] 3017 	jrne 3$
      00A16B CD 98            [ 1] 3018 4$: tnz (PINVAL,sp)
      00A16D 6F A1            [ 1] 3019 	jrne 5$
      00A16F 08               [ 1] 3020 	cpl a 
      00A170 26 03            [ 1] 3021 	and a,(GPIO_ODR,x)
      00A172 CC A0            [ 2] 3022 	jra 8$
      00A174 EA 00            [ 1] 3023 5$: or a,(GPIO_ODR,x)
      00A175 E7 00            [ 1] 3024 8$: ld (GPIO_ODR,x),a 
      00273C                       3025 	_drop VSIZE 
      00A175 A1 00            [ 2]    1     addw sp,#VSIZE 
      00A177 27               [ 4] 3026 	ret
                                   3027 
                                   3028 
                                   3029 ;-----------------------
                                   3030 ; BASIC: STOP
                                   3031 ; stop progam execution  
                                   3032 ; without resetting pointers 
                                   3033 ; the program is resumed
                                   3034 ; with RUN 
                                   3035 ;-------------------------
      00273F                       3036 stop:
      00A178 07 A1 0A 27 03   [ 2] 3037 	btjt flags,#FRUN,2$
      00A17D CC               [ 1] 3038 	clr a
      00A17E 97               [ 4] 3039 	ret 
      002746                       3040 2$:	 
                                   3041 ; create space on cstack to save context 
      00A17F 08 27 6D         [ 2] 3042 	ldw x,#break_point 
      00A180 CD 09 5C         [ 4] 3043 	call puts 
      00274C                       3044 	_drop 2 ;drop return address 
      00A180 5B 05            [ 2]    1     addw sp,#2 
      00274E                       3045 	_vars CTXT_SIZE ; context size 
      00A182 90 85            [ 2]    1     sub sp,#CTXT_SIZE 
      00A184 81 20 46         [ 4] 3046 	call save_context 
      00A185 AE 16 90         [ 2] 3047 	ldw x,#tib 
      00A185 55 00 03         [ 2] 3048 	ldw basicptr,x
      00A188 00               [ 1] 3049 	clr (x)
      00A189 02 81 00 02      [ 1] 3050 	clr count  
      00A18B 5F               [ 1] 3051 	clrw x 
      00A18B 52 04 0F         [ 2] 3052 	ldw in.w,x
      00A18E 01 CD 9A 37      [ 1] 3053 	bres flags,#FRUN 
      00A192 A1 02 24 03      [ 1] 3054 	bset flags,#FBREAK
      00A196 CC 97 08         [ 2] 3055 	jp interpreter 
      00A199 A1 03 25 0C 90 F6 93  3056 break_point: .asciz "\nbreak point, RUN to resume.\n"
             EE 01 72 A9 00 03 9F
             6B 01 90 F6 93 EE 01
             72 A9 00 03 9F 6B 02
             90 F6
                                   3057 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   3058 ;-----------------------
                                   3059 ; BASIC: NEW
                                   3060 ; from command line only 
                                   3061 ; free program memory
                                   3062 ; and clear variables 
                                   3063 ;------------------------
      00278B                       3064 new: 
      00A1B7 93 EE 01 72 A9   [ 2] 3065 	btjf flags,#FRUN,0$ 
      00A1BC 00               [ 4] 3066 	ret 
      002791                       3067 0$:	
      00A1BD 03 F6 14         [ 4] 3068 	call clear_basic 
      00A1C0 02               [ 4] 3069 	ret 
                                   3070 
                                   3071 ;-----------------------------------
                                   3072 ; erase program at specified address
                                   3073 ; keep signature and size fields. 
                                   3074 ; signature replaced by "XX"
                                   3075 ; input:
                                   3076 ;    X    address 
                                   3077 ;-----------------------------------
                           000001  3078 	ADDR=1    ; program address
                           000003  3079 	PRG_SIZE=3    ; program size 
                           000005  3080 	BLOCKS=5 ; blocks to erase 
                           000006  3081 	VSIZE=6
      002795                       3082 erase_program:
      00A1C1 18               [ 2] 3083 	pushw x 
      00A1C2 01 27 F9         [ 4] 3084 	call skip_string 
      00A1C5 5B               [ 2] 3085 	popw x 
      00A1C6 04 81 E2         [ 4] 3086 	call search_program 
      00A1C8 27 4A            [ 1] 3087 	jreq 9$
      00A1C8 CD 9A 37         [ 4] 3088 	call move_erase_to_ram
      00A1CB A1 02 27 03      [ 1] 3089 	clr farptr 
      0027A6                       3090 	_vars VSIZE 
      00A1CF CC 97            [ 2]    1     sub sp,#VSIZE 
      00A1D1 08 00 04         [ 2] 3091 1$:	subw x,#4 
      00A1D2 1F 01            [ 2] 3092 	ldw (ADDR,sp),x
      00A1D2 90 F6            [ 2] 3093 	ldw x,(2,x)
      00A1D4 93 EE            [ 2] 3094 	ldw (PRG_SIZE,sp),x
      00A1D6 01 72            [ 1] 3095 	ld a,#BLOCK_SIZE 
      00A1D8 A9               [ 2] 3096 	div x,a 
      00A1D9 00               [ 1] 3097 	tnz a 
      00A1DA 03 9F            [ 1] 3098 	jreq 2$ 
      00A1DC 88               [ 1] 3099 	incw x 
      00A1DD 90 F6            [ 2] 3100 2$:	ldw (BLOCKS,sp),x 
      00A1DF 93 EE            [ 2] 3101 	ldw x,(ADDR,sp)
      00A1E1 01 72 A9         [ 2] 3102 	ldw ptr16,x 
      00A1E4 00 03 84         [ 4] 3103 3$:	call block_erase
      00A1E7 FA F7 81         [ 2] 3104 	ldw x,#BLOCK_SIZE 
      00A1EA CD 08 60         [ 4] 3105 	call incr_farptr
      00A1EA CD 9A            [ 2] 3106 	ldw x,(BLOCKS,sp)
      00A1EC 37               [ 2] 3107 	decw x 
      00A1ED A1 02            [ 2] 3108 	ldw (BLOCKS,sp),x 
      00A1EF 27 03            [ 1] 3109 	jrne 3$ 
                                   3110 ; write XX and size at addr 
      00A1F1 CC 97            [ 2] 3111 	ldw x,(ADDR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A1F3 08 00 19         [ 2] 3112 	ldw ptr16,x 
      00A1F4 A6 58            [ 1] 3113 	ld a,#'X 
      00A1F4 90               [ 1] 3114 	clrw x 
      00A1F5 F6 93 EE         [ 4] 3115 	call write_byte 
      00A1F8 01 72 A9         [ 4] 3116 	call write_byte 
      00A1FB 00 03            [ 1] 3117 	ld a,(PRG_SIZE,sp)
      00A1FD 9F 43 88         [ 4] 3118 	call write_byte 
      00A200 90 F6            [ 1] 3119 	ld a,(PRG_SIZE+1,sp)
      00A202 93 EE 01         [ 4] 3120 	call write_byte 
      0027E7                       3121 	_drop VSIZE 
      00A205 72 A9            [ 2]    1     addw sp,#VSIZE 
      0027E9                       3122 9$:	
      00A207 00               [ 4] 3123 	ret 
                                   3124 
                                   3125 ;-----------------------------------
                                   3126 ; BASIC: ERASE \E | \F || address
                                   3127 ; erase all block in range from 
                                   3128 ;  'app_space' to FLASH end (0x27fff)
                                   3129 ;  or all EEPROM 
                                   3130 ; that contains a non zero byte. 
                                   3131 ; if the argument is an address  
                                   3132 ; mark the program at this address 
                                   3133 ; as erased. Erase the blocks 
                                   3134 ; replace signature by 'XX' and 
                                   3135 ; keep size field.  
                                   3136 ;-----------------------------------
                           000001  3137 	LIMIT=1 
                           000003  3138 	VSIZE = 3 
      0027EA                       3139 cmd_erase:
      00A208 03 84 F4 F7 81   [ 2] 3140 	btjf flags,#FRUN,eras0
      00A20D A6 07            [ 1] 3141 	ld a,#ERR_CMD_ONLY
      00A20D CD 9A 37         [ 2] 3142 	jp tb_error 
      0027F4                       3143 eras0:	
      00A210 A1 02 27 03      [ 1] 3144 	clr farptr 
      00A214 CC 97 08         [ 4] 3145 	call next_token
      00A217 90 F6            [ 1] 3146 	cp a,#TK_LABEL 
      00A219 93 EE            [ 1] 3147 	jreq erase_program  
      0027FF                       3148 	_vars VSIZE 
      00A21B 01 72            [ 2]    1     sub sp,#VSIZE 
      00A21D A9 00            [ 1] 3149 	cp a,#TK_CHAR 
      00A21F 03 9F            [ 1] 3150 	jreq 0$ 
      00A221 88 90 F6         [ 2] 3151 	jp syntax_error
      00A224 93 EE 01         [ 4] 3152 0$: call get_char 
      00A227 72 A9            [ 1] 3153 	and a,#0XDF 
      00A229 00 03            [ 1] 3154 	cp a,#'E
      00A22B 84 F8            [ 1] 3155 	jrne 1$
      00A22D F7 81 00         [ 2] 3156 	ldw x,#EEPROM_BASE 
      00A22F CF 00 19         [ 2] 3157 	ldw farptr+1,x 
      00A22F CD 9A 32         [ 2] 3158 	ldw x,#EEPROM_END
      00A232 A1               [ 1] 3159 	clr a 
      00A233 02 27            [ 2] 3160 	jra 3$ 
      00A235 03 CC            [ 1] 3161 1$: cp a,#'F 
      00A237 97 08            [ 1] 3162 	jreq 2$
      00A239 AE 15 90         [ 2] 3163 	ldw x,#err_bad_value
      00A239 90 F6 93         [ 2] 3164 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      002827                       3165 2$:
      00A23C EE 01 72         [ 2] 3166 	ldw x,#app_space  
      00A23F A9 00 03         [ 2] 3167 	ldw farptr+1,x 
      00A242 9F A4            [ 1] 3168 	ld a,#(FLASH_END>>16)&0XFF 
      00A244 07 88 A6         [ 2] 3169 	ldw x,#FLASH_END&0xffff
      002832                       3170 3$:
      00A247 01 0D            [ 1] 3171 	ld (LIMIT,sp),a 
      00A249 01 27            [ 2] 3172 	ldw (LIMIT+1,sp),x 
                                   3173 ; operation done from RAM
                                   3174 ; copy code to RAM in tib   
      00A24B 05 48 0A         [ 4] 3175 	call move_erase_to_ram
      002839                       3176 4$:	 
      00A24E 01 20 F7         [ 4] 3177     call scan_block 
      00A251 6B 01            [ 1] 3178 	jreq 5$  ; block already erased 
      00A253 90 F6            [ 1] 3179     ld a,#'E 
      00A255 93 EE 01         [ 4] 3180     call putc 
      00A258 72 A9 00         [ 4] 3181 	call block_erase   
                                   3182 ; this block is clean, next  
      00A25B 03 84 F4         [ 2] 3183 5$:	ldw x,#BLOCK_SIZE
      00A25E 27 02 A6         [ 4] 3184 	call incr_farptr
                                   3185 ; check limit, 24 bit substraction  	
      00A261 01 5F            [ 1] 3186 	ld a,(LIMIT,sp)
      00A263 97 4F            [ 2] 3187 	ldw x,(LIMIT+1,sp)
      00A265 81 B0 00 19      [ 2] 3188 	subw x,farptr+1
      00A266 C2 00 18         [ 1] 3189 	sbc a,farptr 
      00A266 CD 9A            [ 1] 3190 	jrugt 4$ 
      00A268 37 A1 02         [ 4] 3191 9$: call clear_basic
      00A26B 27 03            [ 2] 3192 	ldw x,(LIMIT+1,sp)
      00A26D CC 97 08         [ 2] 3193 	cpw x,#EEPROM_END
      00A270 26 03            [ 1] 3194 	jrne 10$
      00A270 90 F6 93         [ 4] 3195 	call func_eefree 
      002866                       3196 10$:
      002866                       3197 	_drop VSIZE 
      00A273 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A275 72               [ 4] 3198 	ret 
                                   3199 	
                                   3200 
                                   3201 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3202 ;  check for application signature 
                                   3203 ; input:
                                   3204 ;	x       address to check 
                                   3205 ; output:
                                   3206 ;   Z      1  signature present 
                                   3207 ;          0 not app signature  
                                   3208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002869                       3209 qsign: 
      00A276 A9               [ 2] 3210 	pushw x 
                                   3211 ; align to block 
      00A277 00               [ 1] 3212 	ld a,xl 
      00A278 03 9F            [ 1] 3213 	and a,#BLOCK_SIZE 
      00A27A 88               [ 1] 3214 	ld xl,a 
      00A27B 90               [ 2] 3215 	ldw x,(x)
      00A27C F6 93 EE         [ 2] 3216 	cpw x,SIGNATURE ; "TB" 
      00A27F 01               [ 2] 3217 	popw x 
      00A280 72               [ 4] 3218 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3219 
                                   3220 ;--------------------------------------
                                   3221 ;  fill write buffer 
                                   3222 ;  input:
                                   3223 ;    y  point to output buffer 
                                   3224 ;    x  point to source 
                                   3225 ;    a  bytes to write in buffer 
                                   3226 ;  output:
                                   3227 ;    y   += A 
                                   3228 ;    X   += A 
                                   3229 ;    A   0 
                                   3230 ;---------------------------------------
      002874                       3231 fill_write_buffer:
      00A281 A9               [ 1] 3232 	push a 
      00A282 00               [ 1] 3233 	tnz a 
      00A283 03 84            [ 1] 3234 	jreq 9$ 
      00A285 F7               [ 1] 3235 1$: ld a,(x)
      00A286 81               [ 1] 3236 	incw x 
      00A287 90 F7            [ 1] 3237 	ld (y),a 
      00A287 CD 9A            [ 1] 3238 	incw y 
      00A289 32 A1            [ 1] 3239 	dec (1,sp) 
      00A28B 01 27            [ 1] 3240 	jrne 1$ 
      00A28D 03               [ 1] 3241 9$:	pop a 
      00A28E CC               [ 4] 3242     ret 	
                                   3243 
                                   3244 ;--------------------------------------
                                   3245 ;  fill pad buffer with zero 
                                   3246 ;  input:
                                   3247 ;	none 
                                   3248 ;  output:
                                   3249 ;    y     buffer address  
                                   3250 ;--------------------------------------
      002884                       3251 clear_block_buffer:
      00A28F 97               [ 1] 3252 	push a 
      00A290 08 90 F6 93      [ 2] 3253 	ldw y,#block_buffer 
      00A294 EE 01            [ 2] 3254 	pushw y
      00A296 72 A9            [ 1] 3255 	ld a,#BLOCK_SIZE   
      00A298 00 03            [ 1] 3256 1$:	clr (y)
      00A29A C7 00            [ 1] 3257 	incw y
      00A29C 19               [ 1] 3258 	dec a  
      00A29D CF 00            [ 1] 3259 	jrne 1$ 	
      00A29F 1A 92            [ 2] 3260 9$: popw y 
      00A2A1 BC               [ 1] 3261 	pop a 			
      00A2A2 00               [ 4] 3262 	ret 
                                   3263 
                                   3264 
                                   3265 ;----------------------------------
                                   3266 ;  search  a free space space that 
                                   3267 ;  fit program size 
                                   3268 ; input:
                                   3269 ;    X    program size 
                                   3270 ; output:
                                   3271 ;    X    address | 0 
                                   3272 ;------------------------------------
                           000001  3273 	PG_SIZE=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                           000002  3274 	VSIZE=2 
      002898                       3275 search_fit:
      00A2A3 19               [ 2] 3276 	pushw x; PG_SIZE 
      00A2A4 5F 97 4F         [ 2] 3277 	ldw x,#app_space 
      00A2A7 81 29 85         [ 4] 3278 1$:	call is_erased 
      00A2A8 27 0D            [ 1] 3279 	jreq 4$
      00A2A8 CD               [ 1] 3280 	ld a,(x)
      00A2A9 9C 94            [ 1] 3281 	or a,(1,x)
      00A2AB 90 F6            [ 1] 3282 	jreq 9$ ; free space 
      00A2AD 93 EE 01         [ 4] 3283 2$:	call skip_to_next
      00A2B0 72               [ 2] 3284 	tnzw x 
      00A2B1 A9 00            [ 1] 3285 	jrne 1$
      00A2B3 03 4D            [ 2] 3286 	jra 9$
      0028AE                       3287 4$: ; erased program 
                                   3288     ; does it fit? 
      00A2B5 26 0D 5D         [ 2] 3289 	ldw acc16,x 
      00A2B8 26 0A            [ 2] 3290 	ldw x,(2,x) ; size erased program
                                   3291 ; top multiple of BLOCK_SIZE 
      00A2BA 55 00 03         [ 2] 3292 	addw x,#4 
      00A2BD 00 02 5B         [ 2] 3293 	addw x,#BLOCK_SIZE-1 
      00A2C0 02               [ 1] 3294 	ld a,xl 
      00A2C1 CC 97            [ 1] 3295 	and a,#BLOCK_SIZE 
      00A2C3 BB               [ 1] 3296 	ld xl,a  
      00A2C4 81 01            [ 2] 3297 	cpw x,(1,sp) ; size program to save 
      00A2C5 24 05            [ 1] 3298 	jruge 8$   ; fit 
      00A2C5 85 52 0D         [ 2] 3299 	ldw x,acc16 
      00A2C8 89 A6            [ 2] 3300 	jra 2$ 
      00A2CA 85 CD 9A         [ 2] 3301 8$: ldw x,acc16 ; fit in this one 	
      0028C9                       3302 9$:	_drop VSIZE 
      00A2CD 25 CD            [ 2]    1     addw sp,#VSIZE 
      00A2CF 98               [ 4] 3303 	ret  
                                   3304 
                                   3305 ;-------------------------
                                   3306 ; erase header and 
                                   3307 ; size fields 
                                   3308 ; input: 
                                   3309 ;    X    program address 
                                   3310 ; output:
                                   3311 ;    X    unchanged 
                                   3312 ;-------------------------
                           000001  3313 	COUNT=1 
      0028CC                       3314 erase_header:
      00A2D0 97               [ 2] 3315 	pushw x 
      00A2D1 1F 09            [ 1] 3316 	push #4 ; COUNT 
      00A2D3 CD 9D 69 72      [ 1] 3317 	clr farptr 
      00A2D7 14 00 23         [ 2] 3318 	ldw ptr16,x 
      00A2DA CD               [ 1] 3319 	clr a 
      00A2DB 98               [ 1] 3320 	clrw x 
      00A2DC 6F A1 80         [ 4] 3321 1$:	call write_byte 
      00A2DF 27 03            [ 1] 3322 	dec (COUNT,sp)
      00A2E1 CC 97            [ 1] 3323 	jrne 1$
      0028DF                       3324 	_drop 1 
      00A2E3 08 01            [ 2]    1     addw sp,#1 
      00A2E4 85               [ 2] 3325 	popw x 
      00A2E4 FE 72 5C         [ 2] 3326 	ldw ptr16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A2E7 00               [ 4] 3327 	ret 
                                   3328 
                                   3329 ;---------------------------------------
                                   3330 ; BASIC: SAVE
                                   3331 ; write application from RAM to FLASH
                                   3332 ; at UFLASH address
                                   3333 ;--------------------------------------
                           000001  3334 	XTEMP=1
                           000003  3335 	COUNT=3  ; last count bytes written 
                           000004  3336 	CNT_LO=4 ; count low byte 
                           000005  3337 	TOWRITE=5 ; how bytes left to write  
                           000006  3338 	VSIZE=6 
      0028E6                       3339 cmd_save:
      00A2E8 02               [ 2] 3340 	pushw x 
      00A2E9 72 5C            [ 2] 3341 	pushw y 
      0028E9                       3342 	_vars VSIZE
      00A2EB 00 02            [ 2]    1     sub sp,#VSIZE 
      00A2ED A3 A2 F5         [ 4] 3343 	call prog_size 
      00A2F0 27 03            [ 1] 3344 	jrne 0$ 
      00A2F2 CC 97 08         [ 2] 3345 	jp 9$ ; no program to save 
      00A2F5 1F 05            [ 2] 3346 0$:	ldw (TOWRITE,sp),x ; program size
      00A2F5 72 04 00 23      [ 1] 3347 	clr farptr 
      00A2F9 03 CC 97         [ 4] 3348 	call search_fit
      00A2FC 08 CD 9B         [ 2] 3349 	ldw ptr16,x 
      00A2FF 7B A1 84         [ 2] 3350 	ldw x,#0xFFFF
      00A302 27 03 CC 97      [ 2] 3351 	subw x,ptr16 ; free flash 
      00A306 08 90 F6         [ 2] 3352 	subw x,#4 ; signature and size field 
      00A309 93 EE            [ 2] 3353 	cpw x,(TOWRITE,sp)
      00A30B 01 72            [ 1] 3354 	jruge 1$
      00A30D A9 00            [ 1] 3355 	ld a,#ERR_MEM_FULL
      00A30F 03 6B 06         [ 2] 3356 	jp tb_error 
      002912                       3357 1$: ; check if header bytes are zero's 
      00A312 1F 07 CD         [ 2] 3358 	ldw x,ptr16 
      00A315 98               [ 1] 3359 	ld a,(x)
      00A316 6F A1            [ 1] 3360 	or a,(1,x)
      00A318 00 27            [ 1] 3361 	or a,(2,x)
      00A31A 17 A1            [ 1] 3362 	or a,(3,x)
      00A31C 80 26            [ 1] 3363 	jreq 2$
      00A31E 0E FE 72         [ 4] 3364 	call erase_header ; preserve X and farptr 
      002921                       3365 2$: 
                                   3366 ; block programming flash
                                   3367 ; must be done from RAM
                                   3368 ; moved in tib  
      00A321 5C 00 02         [ 4] 3369 	call move_prg_to_ram
                                   3370 ; initialize written bytes count  
      00A324 72 5C            [ 1] 3371 	clr (COUNT,sp)
                                   3372 ; first bock 
                                   3373 ; containt signature 2 bytes 
                                   3374 ; and size 	2 bytes 
                                   3375 ; use Y as pointer to block_buffer
      00A326 00 02 A3         [ 4] 3376 	call clear_block_buffer ; -- y=*block_buffer	
                                   3377 ; write signature
      00A329 A3 3B 27         [ 2] 3378 	ldw x,SIGNATURE ; "TB" 
      00A32C 0E FF            [ 2] 3379 	ldw (y),x 
      00A32D 72 A9 00 02      [ 2] 3380 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A32D 55 00            [ 2] 3381 	ldw x,(TOWRITE,sp)
      00A32F 04 00            [ 2] 3382 	ldw (y),x
      00A331 02 A9 00 02      [ 2] 3383 	addw y,#2   
      00A332 A6 7C            [ 1] 3384 	ld a,#(BLOCK_SIZE-4)
      00A332 0F 03 AE         [ 2] 3385 	cpw x,#(BLOCK_SIZE-4) 
      00A335 00 01            [ 1] 3386 	jrugt 3$
      00A337 1F               [ 1] 3387 	ld a,xl 
      00A338 04 20            [ 1] 3388 3$:	ld (CNT_LO,sp),a   
      00A33A 2F 00 1B         [ 2] 3389 	ldw x,txtbgn 
      00A33B 1F 01            [ 2] 3390 	ldw (XTEMP,sp),x 
      002949                       3391 32$: 
      00A33B 72 04            [ 2] 3392 	ldw x,(XTEMP,sp)
      00A33D 00 23            [ 1] 3393 	ld a,(CNT_LO,sp)
      00A33F 03 CC 97         [ 4] 3394 	call fill_write_buffer 
      00A342 08 CD            [ 2] 3395 	ldw (XTEMP,sp),x 
      00A344 9B 7B A1         [ 2] 3396 	ldw x,#block_buffer
      00A347 84 27 03         [ 4] 3397 	call write_buffer
      00A34A CC 97 08         [ 2] 3398 	ldw x,#BLOCK_SIZE 
      00A34D CD 08 60         [ 4] 3399 	call incr_farptr  
                                   3400 ; following blocks 
      00A34D 90 F6            [ 2] 3401 	ldw x,(XTEMP,sp)
      00A34F 93 EE 01         [ 2] 3402 	cpw x,txtend 
      00A352 72 A9            [ 1] 3403 	jruge 9$ 
      00A354 00 03            [ 2] 3404 	ldw x,(TOWRITE,sp)
      00A356 6B 03 1F         [ 2] 3405 	subw x,(COUNT,sp)
      00A359 04 4D            [ 2] 3406 	ldw (TOWRITE,sp),x 
      00A35B 2A 0D            [ 1] 3407 	ld a,#BLOCK_SIZE 
      00A35D 7B 06 1E         [ 2] 3408 	cpw x,#BLOCK_SIZE 
      00A360 07 1D            [ 1] 3409 	jruge 4$ 
      00A362 00               [ 1] 3410 	ld a,xl 
      00A363 01 A2            [ 1] 3411 4$:	ld (CNT_LO,sp),a 
      00A365 00 6B 06         [ 4] 3412 	call clear_block_buffer 
      00A368 1F 07            [ 2] 3413 	jra 32$ 
      00A36A                       3414 9$:	_drop VSIZE 
      00A36A CE 00            [ 2]    1     addw sp,#VSIZE 
      00A36C 05 1F            [ 2] 3415     popw y 
      00A36E 0D               [ 2] 3416 	popw x 
      00A36F CE               [ 4] 3417 	ret 
                                   3418 
      00A370 00 01                 3419 SIGNATURE: .ascii "TB"
      00A372 1F 0B                 3420 ERASED: .ascii "XX" 
                                   3421 
                                   3422 ;---------------------
                                   3423 ; check if there is 
                                   3424 ; an erased program 
                                   3425 ; at this address 
                                   3426 ; input:
                                   3427 ;    X    address 
                                   3428 ; output:
                                   3429 ;    Z    Set=erased program 
                                   3430 ;--------------------
      002985                       3431 is_erased:
      00A374 72               [ 2] 3432 	pushw x 
                                   3433 ; align to BLOCK 
      00A375 15               [ 1] 3434 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A376 00 23            [ 1] 3435 	and a,#BLOCK_SIZE 
      00A378 72               [ 1] 3436 	ld xl,a 
      00A379 5C               [ 2] 3437 	ldw x,(x)
      00A37A 00 20 81         [ 2] 3438 	cpw x,ERASED 
      00A37D 85               [ 2] 3439 	popw x 
      00A37D 72               [ 4] 3440 	ret 
                                   3441 
                                   3442 ;----------------------------
                                   3443 ;  skip to next program
                                   3444 ;  block 
                                   3445 ; input:
                                   3446 ;    X   actual program addr
                                   3447 ; output:
                                   3448 ;    X   next block 
                                   3449 ;        after program 
                                   3450 ;----------------------------
      002990                       3451 skip_to_next:
                                   3452 ; align to block 
      00A37E 5D               [ 1] 3453 	ld a,xl 
      00A37F 00 20            [ 1] 3454 	and a,#BLOCK_SIZE 
      00A381 26               [ 1] 3455 	ld xl,a 
      00A382 03 CC 97         [ 2] 3456 	ldw acc16,x 
      00A385 08 02            [ 2] 3457 	ldw x,(2,x)
      00A386 72 BB 00 0D      [ 2] 3458 	addw x,acc16 ; blk_addr+prg_size 
      00A386 A6 85 CD         [ 2] 3459 	addw x,#4 ; +header fields 
                                   3460 ; align to next block 
      00A389 9A 25 CD         [ 2] 3461 	addw x,#BLOCK_SIZE-1 
      00A38C 98               [ 1] 3462 	ld a,xl 
      00A38D 97 13            [ 1] 3463 	and a,#0x80 
      00A38F 09               [ 1] 3464 	ld xl,a  
      00A390 27               [ 4] 3465 	ret 
                                   3466 
                                   3467 
                                   3468 ;---------------------
                                   3469 ; BASIC: DIR 
                                   3470 ; list programs saved 
                                   3471 ; in flash 
                                   3472 ;--------------------
                           000001  3473 	XTEMP=1 
      0029A8                       3474 cmd_dir:
      00A391 03 CC 97         [ 2] 3475 	ldw x,#app_space 
      00A394 08               [ 2] 3476 	pushw x 
      00A395                       3477 1$: 
      00A395 CF 00 1A         [ 4] 3478 	call qsign 
      00A398 F6 EE            [ 1] 3479 	jrne 4$
      00A39A 01 72 FB         [ 2] 3480 	addw x,#4
      00A39D 04 19 03 72      [ 1] 3481 	mov base,#16
      00A3A1 C7 00 1A         [ 4] 3482 	call prt_i16
      00A3A4 72 5C            [ 1] 3483 	ld a,#SPACE 
      00A3A6 00 1B 72         [ 4] 3484 	call putc 
      00A3A9 CF 00            [ 2] 3485 	ldw x,(1,sp)
      00A3AB 1A C7            [ 2] 3486 	ldw x,(2,x)
      00A3AD 00 0D CF 00      [ 1] 3487 	mov base,#10  
      00A3B1 0E 7B 06         [ 4] 3488 	call prt_i16 
      00A3B4 1E 07 72         [ 2] 3489 	ldw x,#STR_BYTES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A3B7 B0 00 0E         [ 4] 3490 	call puts
      00A3BA C2 00            [ 1] 3491 	ld a,#', 
      00A3BC 0D 18 03         [ 4] 3492 	call putc
      00A3BF A8 80            [ 2] 3493 	ldw x,(1,sp)
      00A3C1 2B 12 20         [ 2] 3494 	addw x,#8
      00A3C4 25 7B 03         [ 4] 3495 	call puts 
      00A3C7 2A 07            [ 1] 3496 	ld a,#CR 
      00A3C9 C6 00 0F         [ 4] 3497 	call putc
      00A3CC 2F 07            [ 2] 3498 	ldw x,(1,sp)
      00A3CE 20 1A 90         [ 4] 3499 3$:	call skip_to_next
      00A3D0 1F 01            [ 2] 3500 	ldw (1,sp),x 
      00A3D0 72 0E            [ 2] 3501 	jra 1$
      0029EC                       3502 4$: ; check if it is an erased program 
      00A3D2 00 0F 15         [ 4] 3503 	call is_erased 
      00A3D5 27 F4            [ 1] 3504 	jreq 3$ 
      0029F1                       3505 8$: ; done 
      0029F1                       3506 	_drop 2 
      00A3D5 1E 0D            [ 2]    1     addw sp,#2 
      00A3D7 CF               [ 4] 3507 	ret 
                                   3508 
                                   3509 ;---------------------
                                   3510 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3511 ; write 1 or more byte to FLASH or EEPROM
                                   3512 ; starting at address  
                                   3513 ; input:
                                   3514 ;   expr1  	is address 
                                   3515 ;   expr2,...,exprn   are bytes to write
                                   3516 ; output:
                                   3517 ;   none 
                                   3518 ;---------------------
      0029F4                       3519 write:
      00A3D8 00 05 72         [ 4] 3520 	call expression
      00A3DB 01 00            [ 1] 3521 	cp a,#TK_INTGR 
      00A3DD 23 05            [ 1] 3522 	jreq 0$
      00A3DF E6 02 C7         [ 2] 3523 	jp syntax_error
      0029FE                       3524 0$: _xpop 
      00A3E2 00 03            [ 1]    1     ld a,(y)
      00A3E4 1E               [ 1]    2     ldw x,y 
      00A3E5 0B CF            [ 2]    3     ldw x,(1,x)
      00A3E7 00 01 81 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3EA C7 00 18         [ 1] 3525 	ld farptr,a 
      00A3EA 85 5B 0D         [ 2] 3526 	ldw ptr16,x 
      002A0D                       3527 1$:	
      00A3ED 72 5A 00         [ 4] 3528 	call next_token 
      00A3F0 20 FC            [ 1] 3529 	cp a,#TK_COMMA 
      00A3F2 27 02            [ 1] 3530 	jreq 2$ 
      00A3F2 CD 98            [ 2] 3531 	jra 9$ ; no more data 
      00A3F4 6F A1 84         [ 4] 3532 2$:	call next_token 
      00A3F7 27 07            [ 1] 3533 	cp a,#TK_CHAR 
      00A3F9 A1 03            [ 1] 3534 	jreq 4$ 
      00A3FB 27 26            [ 1] 3535 	cp a,#TK_QSTR
      00A3FD CC 97            [ 1] 3536 	jreq 6$
      002A21                       3537 	_unget_token 
      00A3FF 08 00 03 00 01   [ 1]    1      mov in,in.saved  
      00A400 CD 1A FB         [ 4] 3538 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A400 90 89            [ 1] 3539 	cp a,#TK_INTGR
      00A402 CD 98            [ 1] 3540 	jreq 3$
      00A404 A1 4F 90         [ 2] 3541 	jp syntax_error
      002A30                       3542 3$:	_xpop 
      00A407 CE 00            [ 1]    1     ld a,(y)
      00A409 05               [ 1]    2     ldw x,y 
      00A40A 90 FE            [ 2]    3     ldw x,(1,x)
      00A40C 90 89 13 01      [ 2]    4     addw y,#CELL_SIZE 
      00A410 5B               [ 1] 3543 	ld a,xl 
      00A411 02               [ 1] 3544 	clrw x 
      00A412 25 01 4C         [ 4] 3545 	call write_byte
      00A415 20 CD            [ 2] 3546 	jra 1$ 
      002A40                       3547 4$: ; write character 
      00A415 CD               [ 1] 3548 	ld a,(x)
      00A416 8C C5 5D 26      [ 1] 3549 	inc in 
      00A41A 05               [ 1] 3550 	clrw x 
      00A41B A6 05 CC         [ 4] 3551 	call write_byte 
      00A41E 97 0A            [ 2] 3552 	jra 1$ 
      002A4B                       3553 6$: ; write string 
      00A420 90               [ 2] 3554 	pushw x 
      00A421 85               [ 1] 3555 	ld a,(x)
      00A422 81 5C 00 01      [ 1] 3556 	inc in 
      00A423 5F               [ 1] 3557 	clrw x 
      00A423 90 89 89         [ 4] 3558 	call write_byte 
      00A426 CD               [ 2] 3559 	popw x 
      00A427 98               [ 1] 3560 	ld a,(x)
      00A428 88 72            [ 1] 3561 	jreq 1$
      00A42A 5F               [ 1] 3562 	incw x 
      00A42B 00 0E            [ 2] 3563 	jra 6$ 	
      002A5C                       3564 9$:
      00A42D 90               [ 4] 3565 	ret 
                                   3566 
                                   3567 
                                   3568 ;---------------------
                                   3569 ;BASIC: CHAR(expr)
                                   3570 ; évaluate expression 
                                   3571 ; and take the 7 least 
                                   3572 ; bits as ASCII character
                                   3573 ; output: 
                                   3574 ; 	A char 
                                   3575 ;---------------------
      002A5D                       3576 func_char:
      00A42E CE 00 1C         [ 4] 3577 	call func_args 
      00A431 90 E6            [ 1] 3578 	cp a,#1
      00A433 03 A1            [ 1] 3579 	jreq 1$
      00A435 03 27 15         [ 2] 3580 	jp syntax_error
      002A67                       3581 1$:	_xpop
      00A438 90 E6            [ 1]    1     ld a,(y)
      00A43A 02               [ 1]    2     ldw x,y 
      00A43B C7 00            [ 2]    3     ldw x,(1,x)
      00A43D 0F 72 B9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A441 0E               [ 1] 3582 	ld a,xl
      00A442 90 C3            [ 1] 3583 	and a,#0x7f 
      00A444 00               [ 4] 3584 	ret
                                   3585 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3586 ;---------------------
                                   3587 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3588 ; extract first character 
                                   3589 ; of string argument 
                                   3590 ; output:
                                   3591 ;    A:X    int24 
                                   3592 ;---------------------
      002A74                       3593 ascii:
      00A445 1E 25            [ 1] 3594 	ld a,#TK_LPAREN
      00A447 E9 A6 0A         [ 4] 3595 	call expect 
      00A44A CC 97 0A         [ 4] 3596 	call next_token 
      00A44D A1 02            [ 1] 3597 	cp a,#TK_QSTR 
      00A44D 90 89            [ 1] 3598 	jreq 1$
      00A44F 72 A9            [ 1] 3599 	cp a,#TK_CHAR 
      00A451 00 04            [ 1] 3600 	jreq 2$ 
      00A453 1E 03            [ 1] 3601 	cp a,#TK_CFUNC 
      00A455 CD 94            [ 1] 3602 	jreq 0$
      00A457 11 26 04         [ 2] 3603 	jp syntax_error
      002A8B                       3604 0$: ; cfunc 
      00A45A 90               [ 4] 3605 	call (x)
      00A45B 85 20            [ 2] 3606 	jra 3$
      002A8E                       3607 1$: ; quoted string 
      00A45D DA               [ 1] 3608 	ld a,(x)
      00A45E 88               [ 1] 3609 	push a  
      00A45E 85 5B 02         [ 4] 3610 	call skip_string
      00A461 90               [ 1] 3611 	pop a  	
      00A462 85 81            [ 2] 3612 	jra 3$ 
      00A464                       3613 2$: ; character 
      00A464 72 00 00         [ 4] 3614 	call get_char 
      00A467 23               [ 1] 3615 3$:	clrw x 
      00A468 05               [ 1] 3616 	rlwa x   
      002A9B                       3617 4$:	_xpush  
      00A469 A6 06 CC 97      [ 2]    1     subw y,#CELL_SIZE
      00A46D 0A CD            [ 1]    2     ld (y),a 
      00A46F 9B 7B A1         [ 2]    3     ldw (1,y),x 
      00A472 84 27            [ 1] 3618 	ld a,#TK_RPAREN 
      00A474 03 CC 97         [ 4] 3619 	call expect
      002AA9                       3620 9$:	
      002AA9                       3621 	_xpop  
      00A477 08 90            [ 1]    1     ld a,(y)
      00A479 F6               [ 1]    2     ldw x,y 
      00A47A 93 EE            [ 2]    3     ldw x,(1,x)
      00A47C 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A480 03               [ 4] 3622 	ret 
                                   3623 
                                   3624 ;---------------------
                                   3625 ;BASIC: KEY
                                   3626 ; wait for a character 
                                   3627 ; received from STDIN 
                                   3628 ; input:
                                   3629 ;	none 
                                   3630 ; output:
                                   3631 ;	a	 character 
                                   3632 ;---------------------
      002AB3                       3633 key:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A481 9F 27 68         [ 4] 3634 	call getc 
      00A484 88               [ 4] 3635 	ret
                                   3636 
                                   3637 ;----------------------
                                   3638 ; BASIC: QKEY
                                   3639 ; Return true if there 
                                   3640 ; is a character in 
                                   3641 ; waiting in STDIN 
                                   3642 ; input:
                                   3643 ;  none 
                                   3644 ; output:
                                   3645 ;   A     0|-1
                                   3646 ;-----------------------
      002AB7                       3647 qkey:: 
      00A485 CD               [ 1] 3648 	clrw x 
      00A486 98 6F A1         [ 1] 3649 	ld a,rx1_head
      00A489 80 27 03         [ 1] 3650 	sub a,rx1_tail 
      00A48C CC 97            [ 1] 3651 	jreq 9$ 
      00A48E 08               [ 2] 3652 	cplw x
      00A48F FE 72            [ 1] 3653 	ld a,#255    
      002AC3                       3654 9$: 
      00A491 5C               [ 4] 3655 	ret 
                                   3656 
                                   3657 ;---------------------
                                   3658 ; BASIC: GPIO(port,reg)
                                   3659 ; return gpio register address 
                                   3660 ; expr {PORTA..PORTI}
                                   3661 ; input:
                                   3662 ;   none 
                                   3663 ; output:
                                   3664 ;   A:X 	gpio register address
                                   3665 ;----------------------------
                                   3666 ;	N=PORT
                                   3667 ;	T=REG 
      002AC4                       3668 gpio:
      00A492 00 02 72         [ 4] 3669 	call func_args 
      00A495 5C 00            [ 1] 3670 	cp a,#2
      00A497 02 A3            [ 1] 3671 	jreq 1$
      00A499 A4 F6 27         [ 2] 3672 	jp syntax_error  
      002ACE                       3673 1$:	_at_next 
      00A49C 08 A3 A5         [ 1]    1     ld a,(3,y)
      00A49F 10               [ 1]    2     ldw x,y 
      00A4A0 27 03            [ 2]    3     ldw x,(4,x)
      00A4A2 CC 97 08         [ 2] 3674 	cpw x,#PA_BASE 
      00A4A5 2B 16            [ 1] 3675 	jrmi bad_port
      00A4A5 84 89 88         [ 2] 3676 	cpw x,#PI_BASE+1 
      00A4A8 2A 11            [ 1] 3677 	jrpl bad_port
      00A4A8 0A               [ 2] 3678 	pushw x 
      002ADF                       3679 	_xpop
      00A4A9 01 27            [ 1]    1     ld a,(y)
      00A4AB 26               [ 1]    2     ldw x,y 
      00A4AC CD 98            [ 2]    3     ldw x,(1,x)
      00A4AE 6F A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      00A4B2 07 A1 03         [ 2] 3680 	addw x,(1,sp)
      002AEB                       3681 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A4B5 27 0D            [ 2]    1     addw sp,#2 
      00A4B7 CC               [ 1] 3682 	clr a 
      00A4B8 97               [ 4] 3683 	ret
      002AEF                       3684 bad_port:
      00A4B9 08 0A            [ 1] 3685 	ld a,#ERR_BAD_VALUE
      00A4BA CC 16 8A         [ 2] 3686 	jp tb_error
                                   3687 
                                   3688 
                                   3689 ;-------------------------
                                   3690 ; BASIC: UFLASH 
                                   3691 ; return free flash address
                                   3692 ; scan all block starting at 
                                   3693 ; app_space and return 
                                   3694 ; address of first free block 
                                   3695 ; below extended memory.  
                                   3696 ; return 0 if no free block 
                                   3697 ; input:
                                   3698 ;  none 
                                   3699 ; output:
                                   3700 ;	A:X		FLASH free address
                                   3701 ;---------------------------
      002AF4                       3702 uflash:
      00A4BA C6 00 02 AB      [ 1] 3703 	clr farptr 
      00A4BE 03 C7 00         [ 2] 3704 	ldw x,#app_space 
      00A4C1 02               [ 2] 3705 	pushw x 
      00A4C2 20 03 CD         [ 2] 3706 1$:	ldw ptr16,x 
      00A4C5 98 88 6E         [ 4] 3707 	call scan_block 
      00A4C7 27 0F            [ 1] 3708 	jreq 8$
      00A4C7 CD 98            [ 2] 3709 	ldw x,(1,sp)
      00A4C9 6F A1 08         [ 2] 3710 	addw x,#BLOCK_SIZE 
      00A4CC 27 DA            [ 1] 3711 	jreq 7$ 
      00A4CE 5B 03            [ 2] 3712 	ldw (1,sp),x 
      00A4D0 20 1A            [ 2] 3713 	jra 1$ 
      00A4D2                       3714 7$: ; no free block 
      00A4D2 5B 01            [ 1] 3715 	clr (1,sp) 
      00A4D4 CD A3            [ 1] 3716 	clr (2,sp)
      00A4D6 F2               [ 2] 3717 8$: popw x 
      00A4D7 CF               [ 1] 3718 	clr a 
      00A4D8 00               [ 4] 3719 	ret 
                                   3720 
                                   3721 
                                   3722 ;---------------------
                                   3723 ; BASIC: USR(addr,arg)
                                   3724 ; execute a function written 
                                   3725 ; in binary code.
                                   3726 ; input:
                                   3727 ;   addr	routine address 
                                   3728 ;   arg 	is an argument
                                   3729 ;           it can be ignore 
                                   3730 ;           by cally. 
                                   3731 ; output:
                                   3732 ;   xstack 	value returned by cally  
                                   3733 ;---------------------
      002B16                       3734 usr:
      00A4D9 1A 55 00         [ 4] 3735 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A4DC 03 00            [ 1] 3736 	cp a,#2
      00A4DE 02 85            [ 1] 3737 	jreq 1$  
      00A4E0 A3 A4 F6         [ 2] 3738 	jp syntax_error 
      002B20                       3739 1$: 
      002B20                       3740 	_at_next ; A:X addr 
      00A4E3 26 05 CE         [ 1]    1     ld a,(3,y)
      00A4E6 00               [ 1]    2     ldw x,y 
      00A4E7 1A 20            [ 2]    3     ldw x,(4,x)
      00A4E9 19 00 19         [ 2] 3741 	ldw ptr16,X 
      00A4EA                       3742 	_xpop  ; arg 
      00A4EA 20 35            [ 1]    1     ld a,(y)
      00A4EC 93               [ 1]    2     ldw x,y 
      00A4EC 55 00            [ 2]    3     ldw x,(1,x)
      00A4EE 03 00 02 5B      [ 2]    4     addw y,#CELL_SIZE 
      002B32                       3743 	_store_top ; overwrite addr 
      00A4F2 02 CC            [ 1]    1     ld (y),a 
      00A4F4 97 BB 01         [ 2]    2     ldw (1,y),x     
      00A4F6 72 CD 00 19      [ 6] 3744     call [ptr16]
      00A4F6 72               [ 4] 3745 	ret 
                                   3746 
                                   3747 
                                   3748 ;------------------------------
                                   3749 ; BASIC: BYE 
                                   3750 ; halt mcu in its lowest power mode 
                                   3751 ; wait for reset or external interrupt
                                   3752 ; do a cold start on wakeup.
                                   3753 ;------------------------------
      002B3C                       3754 bye:
      00A4F7 00 00 23 05 A6   [ 2] 3755 	btjf UART1_SR,#UART_SR_TC,.
      00A4FC 06               [10] 3756 	halt
      00A4FD CC 97 0A         [ 2] 3757 	jp cold_start  
                                   3758 
                                   3759 ;----------------------------------
                                   3760 ; BASIC: SLEEP 
                                   3761 ; halt mcu until reset or external
                                   3762 ; interrupt.
                                   3763 ; Resume progam after SLEEP command
                                   3764 ;----------------------------------
      00A500                       3765 sleep:
      00A500 CD A3 F2 30 FB   [ 2] 3766 	btjf UART1_SR,#UART_SR_TC,.
      00A503 72 16 00 22      [ 1] 3767 	bset flags,#FSLEEP
      00A503 CF               [10] 3768 	halt 
      00A504 00               [ 4] 3769 	ret 
                                   3770 
                                   3771 ;-------------------------------
                                   3772 ; BASIC: PAUSE expr 
                                   3773 ; suspend execution for n msec.
                                   3774 ; input:
                                   3775 ;	none
                                   3776 ; output:
                                   3777 ;	none 
                                   3778 ;------------------------------
      002B50                       3779 pause:
      00A505 05 E6 02         [ 4] 3780 	call expression
      00A508 C7 00            [ 1] 3781 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A50A 03 35            [ 1] 3782 	jreq 1$ 
      00A50C 03 00 02         [ 2] 3783 	jp syntax_error
      002B5A                       3784 1$: _xpop 
      00A50F 81 F6            [ 1]    1     ld a,(y)
      00A510 93               [ 1]    2     ldw x,y 
      00A510 72 00            [ 2]    3     ldw x,(1,x)
      00A512 00 23 06 A6      [ 2]    4     addw y,#CELL_SIZE 
      002B63                       3785 pause02:
      00A516 06 CC 97         [ 2] 3786 	ldw timer,x 
      00A519 0A 81 12         [ 2] 3787 1$: ldw x,timer 
      00A51B 5D               [ 2] 3788 	tnzw x 
      00A51B CD A3            [ 1] 3789 	jreq 2$
      00A51D F2               [10] 3790 	wfi 
      00A51E CF 00            [ 1] 3791 	jrne 1$
      002B6F                       3792 2$:	
      00A520 1A               [ 4] 3793 	ret 
                                   3794 
                                   3795 ;------------------------------
                                   3796 ; BASIC: AWU expr
                                   3797 ; halt mcu for 'expr' milliseconds
                                   3798 ; use Auto wakeup peripheral
                                   3799 ; all oscillators stopped except LSI
                                   3800 ; range: 1ms - 511ms
                                   3801 ; input:
                                   3802 ;  none
                                   3803 ; output:
                                   3804 ;  none:
                                   3805 ;------------------------------
      00A521                       3806 awu:
      00A521 85 52 04         [ 4] 3807   call expression
      00A524 89 CE            [ 1] 3808   cp a,#TK_INTGR
      00A526 00 05            [ 1] 3809   jreq 1$
      00A528 1F 03 CE         [ 2] 3810   jp syntax_error
      002B7A                       3811 1$: _xpop 
      00A52B 00 01            [ 1]    1     ld a,(y)
      00A52D 1F               [ 1]    2     ldw x,y 
      00A52E 05 CE            [ 2]    3     ldw x,(1,x)
      00A530 00 1A 20 CF      [ 2]    4     addw y,#CELL_SIZE 
      00A534                       3812 awu02:
      00A534 72 00 00         [ 2] 3813   cpw x,#5120
      00A537 23 05            [ 1] 3814   jrmi 1$ 
      00A539 A6 06 CC 97      [ 1] 3815   mov AWU_TBR,#15 
      00A53D 0A 1E            [ 1] 3816   ld a,#30
      00A53E 62               [ 2] 3817   div x,a
      00A53E 1E 03            [ 1] 3818   ld a,#16
      00A540 CF               [ 2] 3819   div x,a 
      00A541 00 05            [ 2] 3820   jra 4$
      002B94                       3821 1$: 
      00A543 E6 02 C7         [ 2] 3822   cpw x,#2048
      00A546 00 03            [ 1] 3823   jrmi 2$ 
      00A548 1E 05 CF 00      [ 1] 3824   mov AWU_TBR,#14
      00A54C 01 85            [ 1] 3825   ld a,#80
      00A54E 5B               [ 2] 3826   div x,a 
      00A54F 04 FC            [ 2] 3827   jra 4$   
      00A551                       3828 2$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A551 4D 26 0D A3      [ 1] 3829   mov AWU_TBR,#7
      002BA6                       3830 3$:  
                                   3831 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A555 B9 00 25         [ 2] 3832   cpw x,#64 
      00A558 07 89            [ 2] 3833   jrule 4$ 
      00A55A CD A8 E9 85      [ 1] 3834   inc AWU_TBR 
      00A55E 27               [ 2] 3835   srlw x 
      00A55F 01 43            [ 2] 3836   jra 3$ 
      002BB2                       3837 4$:
      00A561 81               [ 1] 3838   ld a, xl
      00A562 4A               [ 1] 3839   dec a 
      00A562 72 01            [ 1] 3840   jreq 5$
      00A564 00               [ 1] 3841   dec a 	
      002BB7                       3842 5$: 
      00A565 23 02            [ 1] 3843   and a,#0x3e 
      00A567 4F 81 F1         [ 1] 3844   ld AWU_APR,a 
      00A569 72 18 50 F0      [ 1] 3845   bset AWU_CSR,#AWU_CSR_AWUEN
      00A569 72               [10] 3846   halt 
                                   3847 
      00A56A 09               [ 4] 3848   ret 
                                   3849 
                                   3850 ;------------------------------
                                   3851 ; BASIC: TICKS
                                   3852 ; return msec ticks counter value 
                                   3853 ; input:
                                   3854 ; 	none 
                                   3855 ; output:
                                   3856 ;	X 		TK_INTGR
                                   3857 ;-------------------------------
      002BC2                       3858 get_ticks:
      00A56B 00 23 12         [ 1] 3859 	ld a,ticks 
      00A56E 5B 02 CD         [ 2] 3860 	ldw x,ticks+1 
      00A571 A0               [ 4] 3861 	ret 
                                   3862 
                                   3863 ;------------------------------
                                   3864 ; BASIC: ABS(expr)
                                   3865 ; return absolute value of expr.
                                   3866 ; input:
                                   3867 ;   none
                                   3868 ; output:
                                   3869 ;   xstack    positive int24 
                                   3870 ;-------------------------------
      002BC9                       3871 abs:
      00A572 D6 5B 04         [ 4] 3872 	call func_args 
      00A575 72 19            [ 1] 3873 	cp a,#1 
      00A577 00 23            [ 1] 3874 	jreq 0$ 
      00A579 72 10 00         [ 2] 3875 	jp syntax_error
      002BD3                       3876 0$:  
      00A57C 23 CC 97         [ 4] 3877 	call abs24 
      002BD6                       3878 	_xpop 
      00A57F B3 F6            [ 1]    1     ld a,(y)
      00A580 93               [ 1]    2     ldw x,y 
      00A580 CD 98            [ 2]    3     ldw x,(1,x)
      00A582 6F A1 03 26      [ 2]    4     addw y,#CELL_SIZE 
      00A586 1F               [ 4] 3879 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3880 
                                   3881 ;------------------------------
                                   3882 ; BASIC: LSHIFT(expr1,expr2)
                                   3883 ; logical shift left expr1 by 
                                   3884 ; expr2 bits 
                                   3885 ; output:
                                   3886 ; 	A:x 	result 
                                   3887 ;------------------------------
      002BE0                       3888 lshift:
      00A587 89 CD 98         [ 4] 3889 	call func_args
      00A58A 88 85            [ 1] 3890 	cp a,#2 
      00A58C CD B2            [ 1] 3891 	jreq 1$
      00A58E 62 26 05         [ 2] 3892 	jp syntax_error
      002BEA                       3893 1$: _xpop 
      00A591 A6 12            [ 1]    1     ld a,(y)
      00A593 CC               [ 1]    2     ldw x,y 
      00A594 97 0A            [ 2]    3     ldw x,(1,x)
      00A596 CF 00 1C 1D      [ 2]    4     addw y,#CELL_SIZE 
      00A59A 00               [ 1] 3894 	ld a,xl 
      00A59B 02               [ 1] 3895 	push a      
      002BF5                       3896 	_xpop  ; T>A:X 
      00A59C FE 72            [ 1]    1     ld a,(y)
      00A59E BB               [ 1]    2     ldw x,y 
      00A59F 00 1C            [ 2]    3     ldw x,(1,x)
      00A5A1 CF 00 1E 20      [ 2]    4     addw y,#CELL_SIZE 
      00A5A5 19 55            [ 1] 3897 	tnz (1,sp) 
      00A5A7 00 04            [ 1] 3898 	jreq 4$
      00A5A9 00               [ 1] 3899 2$:	rcf 
      00A5AA 02               [ 2] 3900 	rlcw x 
      00A5AB CE               [ 1] 3901 	rlc a 
      00A5AC 00 1C            [ 1] 3902 	dec (1,sp) 
      00A5AE C3 00            [ 1] 3903 	jrne 2$
      002C09                       3904 4$: _drop 1 
      00A5B0 1E 2B            [ 2]    1     addw sp,#1 
      00A5B2 0C               [ 4] 3905 	ret
                                   3906 
                                   3907 ;------------------------------
                                   3908 ; BASIC: RSHIFT(expr1,expr2)
                                   3909 ; logical shift right expr1 by 
                                   3910 ; expr2 bits.
                                   3911 ; output:
                                   3912 ; 	A 		TK_INTGR
                                   3913 ;   X 		result 
                                   3914 ;------------------------------
      002C0C                       3915 rshift:
      00A5B3 AE 96 5F         [ 4] 3916 	call func_args
      00A5B6 CD 89            [ 1] 3917 	cp a,#2 
      00A5B8 DC 55            [ 1] 3918 	jreq 1$
      00A5BA 00 03 00         [ 2] 3919 	jp syntax_error
      002C16                       3920 1$: _xpop ; T>A:X
      00A5BD 02 81            [ 1]    1     ld a,(y)
      00A5BF 93               [ 1]    2     ldw x,y 
      00A5BF 5B 02            [ 2]    3     ldw x,(1,x)
      00A5C1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A5C1 CD               [ 1] 3921     ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A5C2 9D               [ 1] 3922 	push a    
      002C21                       3923 	_xpop  
      00A5C3 48 CD            [ 1]    1     ld a,(y)
      00A5C5 94               [ 1]    2     ldw x,y 
      00A5C6 76 CE            [ 2]    3     ldw x,(1,x)
      00A5C8 00 1E CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5CC 31 CF            [ 1] 3924 	tnz (1,sp)
      00A5CE 00 33            [ 1] 3925 	jreq 4$
      00A5D0 5F               [ 1] 3926 2$:	rcf 
      00A5D1 CF               [ 1] 3927 	rrc a 
      00A5D2 00               [ 2] 3928 	rrcw x 
      00A5D3 07 72            [ 1] 3929 	dec (1,sp) 
      00A5D5 5F 00            [ 1] 3930 	jrne 2$
      002C35                       3931 4$: _drop 1 
      00A5D7 09 72            [ 2]    1     addw sp,#1 
      00A5D9 5F               [ 4] 3932 	ret
                                   3933 
                                   3934 ;--------------------------
                                   3935 ; BASIC: FCPU integer
                                   3936 ; set CPU frequency 
                                   3937 ;-------------------------- 
                                   3938 
      002C38                       3939 fcpu:
      00A5DA 00 0A            [ 1] 3940 	ld a,#TK_INTGR
      00A5DC CE 00 1C         [ 4] 3941 	call expect 
      00A5DF CF 00 05         [ 4] 3942 	call get_int24 
      00A5E2 E6               [ 1] 3943 	ld a,xl 
      00A5E3 02 C7            [ 1] 3944 	and a,#7 
      00A5E5 00 03 35         [ 1] 3945 	ld CLK_CKDIVR,a 
      00A5E8 03               [ 4] 3946 	ret 
                                   3947 
                                   3948 ;------------------------------
                                   3949 ; BASIC: PMODE pin#, mode 
                                   3950 ; Arduino pin. 
                                   3951 ; define pin as input or output
                                   3952 ; pin#: {0..15}
                                   3953 ; mode: INPUT|OUTPUT  
                                   3954 ;------------------------------
                           000001  3955 	PINNO=1
                           000001  3956 	VSIZE=1
      002C47                       3957 pin_mode:
      002C47                       3958 	_vars VSIZE 
      00A5E9 00 02            [ 2]    1     sub sp,#VSIZE 
      00A5EB 72 10 00         [ 4] 3959 	call arg_list 
      00A5EE 23 CC            [ 1] 3960 	cp a,#2 
      00A5F0 97 B3            [ 1] 3961 	jreq 1$
      00A5F2 CC 16 88         [ 2] 3962 	jp syntax_error 
      002C53                       3963 1$: _xpop 
      00A5F2 5B 02            [ 1]    1     ld a,(y)
      00A5F4 72               [ 1]    2     ldw x,y 
      00A5F5 5D 00            [ 2]    3     ldw x,(1,x)
      00A5F7 35 27 1D 72      [ 2]    4     addw y,#CELL_SIZE 
      00A5FB 5A 00 35         [ 2] 3964 	ldw ptr16,x ; mode 
      002C5F                       3965 	_xpop ; Dx pin 
      00A5FE 1E 01            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A600 CF               [ 1]    2     ldw x,y 
      00A601 00 05            [ 2]    3     ldw x,(1,x)
      00A603 1E 03 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00A607 02 1E 05         [ 4] 3966 	call select_pin 
      00A60A CF 00            [ 1] 3967 	ld (PINNO,sp),a  
      00A60C 1C 1E            [ 1] 3968 	ld a,#1 
      00A60E 07 CF            [ 1] 3969 	tnz (PINNO,sp)
      00A610 00 1E            [ 1] 3970 	jreq 4$
      00A612 5B               [ 1] 3971 2$:	sll a 
      00A613 08 CC            [ 1] 3972 	dec (PINNO,sp)
      00A615 97 DB            [ 1] 3973 	jrne 2$ 
      00A617 6B 01            [ 1] 3974 	ld (PINNO,sp),a
      00A617 AE 17            [ 1] 3975 	ld a,(PINNO,sp)
      00A619 FF 94            [ 1] 3976 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A61B CC 97            [ 1] 3977 	ld (GPIO_CR1,x),a 
      00A61D 94 01            [ 1] 3978 4$:	ld a,#OUTP
      00A61E C1 00 0E         [ 1] 3979 	cp a,acc8 
      00A61E CD 98            [ 1] 3980 	jreq 6$
                                   3981 ; input mode
                                   3982 ; disable external interrupt 
      00A620 6F A1            [ 1] 3983 	ld a,(PINNO,sp)
      00A622 85               [ 1] 3984 	cpl a 
      00A623 27 03            [ 1] 3985 	and a,(GPIO_CR2,x)
      00A625 CC 97            [ 1] 3986 	ld (GPIO_CR2,x),a 
                                   3987 ;clear bit in DDR for input mode 
      00A627 08 CD            [ 1] 3988 	ld a,(PINNO,sp)
      00A629 98               [ 1] 3989 	cpl a 
      00A62A 97 CF            [ 1] 3990 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A62C 00 1A            [ 1] 3991 	ld (GPIO_DDR,x),a 
      00A62E CD 89            [ 2] 3992 	jra 9$
      002C97                       3993 6$: ;output mode  
      00A630 88 27            [ 1] 3994 	ld a,(PINNO,sp)
      00A632 03 CD            [ 1] 3995 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A634 89 8F            [ 1] 3996 	ld (GPIO_DDR,x),a 
      00A636 72 3F            [ 1] 3997 	ld a,(PINNO,sp)
      00A638 00 1A            [ 1] 3998 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A63A 72 5C            [ 1] 3999 	ld (GPIO_CR2,x),a 
      002CA3                       4000 9$:	
      002CA3                       4001 	_drop VSIZE 
      00A63C 00 1B            [ 2]    1     addw sp,#VSIZE 
      00A63E 72               [ 4] 4002 	ret
                                   4003 
                                   4004 ;------------------------
                                   4005 ; select Arduino pin 
                                   4006 ; input:
                                   4007 ;   X 	 {0..15} Arduino Dx 
                                   4008 ; output:
                                   4009 ;   A     stm8s208 pin 
                                   4010 ;   X     base address s208 GPIO port 
                                   4011 ;---------------------------
      002CA6                       4012 select_pin:
      00A63F 3F               [ 2] 4013 	sllw x 
      00A640 00 1A 72         [ 2] 4014 	addw x,#arduino_to_8s208 
      00A643 5C               [ 2] 4015 	ldw x,(x)
      00A644 00               [ 1] 4016 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A645 1B               [ 1] 4017 	push a 
      00A646 72               [ 1] 4018 	swapw x 
      00A647 C7 00            [ 1] 4019 	ld a,#5 
      00A649 1A               [ 4] 4020 	mul x,a 
      00A64A 81 50 00         [ 2] 4021 	addw x,#GPIO_BASE 
      00A64B 84               [ 1] 4022 	pop a 
      00A64B 90               [ 4] 4023 	ret 
                                   4024 ; translation from Arduino D0..D15 to stm8s208rb 
      002CB6                       4025 arduino_to_8s208:
      00A64C 89 AE                 4026 .byte 3,6 ; D0 
      00A64E 00 64                 4027 .byte 3,5 ; D1 
      00A650 90 AE                 4028 .byte 4,0 ; D2 
      00A652 03 E8                 4029 .byte 2,1 ; D3
      00A654 20 22                 4030 .byte 6,0 ; D4
      00A656 02 02                 4031 .byte 2,2 ; D5
      00A656 90 89                 4032 .byte 2,3 ; D6
      00A658 CD 9A                 4033 .byte 3,1 ; D7
      00A65A 37 A1                 4034 .byte 3,3 ; D8
      00A65C 02 27                 4035 .byte 2,4 ; D9
      00A65E 03 CC                 4036 .byte 4,5 ; D10
      00A660 97 08                 4037 .byte 2,6 ; D11
      00A662 02 07                 4038 .byte 2,7 ; D12
      00A662 90 F6                 4039 .byte 2,5 ; D13
      00A664 93 EE                 4040 .byte 4,2 ; D14
      00A666 01 72                 4041 .byte 4,1 ; D15
                                   4042 
                                   4043 
                                   4044 ;------------------------------
                                   4045 ; BASIC: RND(expr)
                                   4046 ; return random number 
                                   4047 ; between 1 and expr inclusive
                                   4048 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4049 ; input:
                                   4050 ; 	none 
                                   4051 ; output:
                                   4052 ;	xstack 	random positive integer 
                                   4053 ;------------------------------
      002CD6                       4054 random:
      00A668 A9 00 03         [ 4] 4055 	call func_args 
      00A66B 89 90            [ 1] 4056 	cp a,#1
      00A66D F6 93            [ 1] 4057 	jreq 1$
      00A66F EE 01 72         [ 2] 4058 	jp syntax_error
      002CE0                       4059 1$:  
      002CE0                       4060 	_xpop   
      00A672 A9 00            [ 1]    1     ld a,(y)
      00A674 03               [ 1]    2     ldw x,y 
      00A675 90 93            [ 2]    3     ldw x,(1,x)
      00A677 85 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A678 89               [ 2] 4061 	pushw x 
      00A678 89               [ 1] 4062 	push a  
      00A679 AE F4            [ 1] 4063 	ld a,#0x80 
      00A67B 24 65            [ 1] 4064 	bcp a,(1,sp)
      00A67D 90 A3            [ 1] 4065 	jreq 2$
      00A67F 7A 12            [ 1] 4066 	ld a,#ERR_BAD_VALUE
      00A681 2B 01 5C         [ 2] 4067 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A684                       4068 2$: 
                                   4069 ; acc16=(x<<5)^x 
      00A684 9E C7 53         [ 2] 4070 	ldw x,seedx 
      00A687 0D               [ 2] 4071 	sllw x 
      00A688 9F               [ 2] 4072 	sllw x 
      00A689 C7               [ 2] 4073 	sllw x 
      00A68A 53               [ 2] 4074 	sllw x 
      00A68B 0E               [ 2] 4075 	sllw x 
      00A68C 8C               [ 1] 4076 	ld a,xh 
      00A68D 56 9E C7         [ 1] 4077 	xor a,seedx 
      00A690 53 0F 9F         [ 1] 4078 	ld acc16,a 
      00A693 C7               [ 1] 4079 	ld a,xl 
      00A694 53 10 72         [ 1] 4080 	xor a,seedx+1 
      00A697 10 53 08         [ 1] 4081 	ld acc8,a 
                                   4082 ; seedx=seedy 
      00A69A 72 10 53         [ 2] 4083 	ldw x,seedy 
      00A69D 00 72 10         [ 2] 4084 	ldw seedx,x  
                                   4085 ; seedy=seedy^(seedy>>1)
      00A6A0 53 04 85         [ 2] 4086 	ldw x,seedy 
      00A6A3 CD               [ 2] 4087 	srlw x 
      00A6A4 AB               [ 1] 4088 	ld a,xh 
      00A6A5 E3 72 11         [ 1] 4089 	xor a,seedy 
      00A6A8 53 08 72         [ 1] 4090 	ld seedy,a  
      00A6AB 11               [ 1] 4091 	ld a,xl 
      00A6AC 53 00 90         [ 1] 4092 	xor a,seedy+1 
      00A6AF 85 81 17         [ 1] 4093 	ld seedy+1,a 
                                   4094 ; acc16>>3 
      00A6B1 CE 00 0D         [ 2] 4095 	ldw x,acc16 
      00A6B1 CD               [ 2] 4096 	srlw x 
      00A6B2 9A               [ 2] 4097 	srlw x 
      00A6B3 37               [ 2] 4098 	srlw x 
                                   4099 ; x=acc16^x 
      00A6B4 A1               [ 1] 4100 	ld a,xh 
      00A6B5 02 27 12         [ 1] 4101 	xor a,acc16 
      00A6B8 A1 01 27         [ 1] 4102 	ld acc16,a 
      00A6BB 03               [ 1] 4103 	ld a,xl 
      00A6BC CC 97 08         [ 1] 4104 	xor a,acc8 
      00A6BF 4F 5F 72         [ 1] 4105 	ld acc8,a 
                                   4106 ; seedy=acc16^seedy 
      00A6C2 A2 00 03         [ 1] 4107 	xor a,seedy+1
      00A6C5 90               [ 1] 4108 	ld xl,a 
      00A6C6 F7 90 EF         [ 1] 4109 	ld a,acc16 
      00A6C9 01 90 E6         [ 1] 4110 	xor a,seedy
      00A6CC 03               [ 1] 4111 	ld xh,a 
      00A6CD 93 EE 04         [ 2] 4112 	ldw seedy,x 
                                   4113 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A6D0 5D 27 25         [ 1] 4114 	ld a,seedx+1
      00A6D3 90 F6            [ 1] 4115 	and a,#127
      002D4B                       4116 	_xpush 
      00A6D5 93 EE 01 72      [ 2]    1     subw y,#CELL_SIZE
      00A6D9 A9 00            [ 1]    2     ld (y),a 
      00A6DB 03 72 A9         [ 2]    3     ldw (1,y),x 
      00A6DE 00               [ 1] 4117 	pop a 
      00A6DF 03               [ 2] 4118 	popw x 
      002D56                       4119 	_xpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A6E0 9F A4 07 4E      [ 2]    1     subw y,#CELL_SIZE
      00A6E4 C7 54            [ 1]    2     ld (y),a 
      00A6E6 01 72 16         [ 2]    3     ldw (1,y),x 
      00A6E9 50 CA 72         [ 4] 4120 	call mod24 
      002D62                       4121 	_xpop
      00A6EC 10 54            [ 1]    1     ld a,(y)
      00A6EE 01               [ 1]    2     ldw x,y 
      00A6EF AE 00            [ 2]    3     ldw x,(1,x)
      00A6F1 1B 5A 9D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A6F5 FA 20 08         [ 2] 4122 	addw x,#1 
      00A6F8 72 11            [ 1] 4123 	adc a,#0  
      00A6FA 54               [ 4] 4124 	ret 
                                   4125 
                                   4126 ;---------------------------------
                                   4127 ; BASIC: WORDS 
                                   4128 ; affiche la listes des mots du
                                   4129 ; dictionnaire ainsi que le nombre
                                   4130 ; de mots.
                                   4131 ;---------------------------------
                           000001  4132 	WLEN=1 ; word length
                           000002  4133 	LLEN=2 ; character sent to console
                           000003  4134 	WCNT=3 ; count words printed 
                           000003  4135 	VSIZE=3 
      002D71                       4136 words:
      00A6FB 01 72            [ 2] 4137 	pushw y
      002D73                       4138 	_vars VSIZE
      00A6FD 17 50            [ 2]    1     sub sp,#VSIZE 
      00A6FF CA 02            [ 1] 4139 	clr (LLEN,sp)
      00A700 0F 03            [ 1] 4140 	clr (WCNT,sp)
      00A700 81 AE 36 7C      [ 2] 4141 	ldw y,#kword_dict+2
      00A701 93               [ 1] 4142 0$:	ldw x,y
      00A701 CD               [ 1] 4143 	ld a,(x)
      00A702 9A 32            [ 1] 4144 	and a,#15 
      00A704 A1 01            [ 1] 4145 	ld (WLEN,sp),a 
      00A706 27 03            [ 1] 4146 	inc (WCNT,sp)
      00A708 CC               [ 1] 4147 1$:	incw x 
      00A709 97               [ 1] 4148 	ld a,(x)
      00A70A 08 90 F6         [ 4] 4149 	call putc 
      00A70D 93 EE            [ 1] 4150 	inc (LLEN,sp)
      00A70F 01 72            [ 1] 4151 	dec (WLEN,sp)
      00A711 A9 00            [ 1] 4152 	jrne 1$
      00A713 03 A3            [ 1] 4153 	ld a,#70
      00A715 00 05            [ 1] 4154 	cp a,(LLEN,sp)
      00A717 23 05            [ 1] 4155 	jrmi 2$   
      00A719 A6 0A            [ 1] 4156 	ld a,#SPACE 
      00A71B CC 97 0A         [ 4] 4157 	call putc 
      00A71E 9F C7            [ 1] 4158 	inc (LLEN,sp) 
      00A720 00 0F            [ 2] 4159 	jra 3$
      00A722 A6 05            [ 1] 4160 2$: ld a,#CR 
      00A724 C0 00 0F         [ 4] 4161 	call putc 
      00A727 C7 54            [ 1] 4162 	clr (LLEN,sp)
      00A729 00 72 16 54      [ 2] 4163 3$:	subw y,#2 
      00A72D 02 72            [ 2] 4164 	ldw y,(y)
      00A72F 10 54            [ 1] 4165 	jrne 0$ 
      00A731 01 72            [ 1] 4166 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A733 0F 54 00         [ 4] 4167 	call putc  
      00A736 FB               [ 1] 4168 	clrw x 
      00A737 CE 54            [ 1] 4169 	ld a,(WCNT,sp)
      00A739 04               [ 1] 4170 	ld xl,a 
      00A73A A6 84 81         [ 4] 4171 	call prt_i16 
      00A73D AE 2D C5         [ 2] 4172 	ldw x,#words_count_msg
      00A73D 52 01 CD         [ 4] 4173 	call puts 
      002DC0                       4174 	_drop VSIZE 
      00A740 9A 32            [ 2]    1     addw sp,#VSIZE 
      00A742 A1 01            [ 2] 4175 	popw y 
      00A744 27               [ 4] 4176 	ret 
      00A745 03 CC 97 08 90 F6 93  4177 words_count_msg: .asciz " words in dictionary\n"
             EE 01 72 A9 00 03 A3
             00 0F 23 05 A6 0A CC
             97
                                   4178 
                                   4179 
                                   4180 ;-----------------------------
                                   4181 ; BASIC: TIMER expr 
                                   4182 ; initialize count down timer 
                                   4183 ;-----------------------------
      002DDB                       4184 set_timer:
      00A75B 0A CD AD         [ 4] 4185 	call arg_list
      00A75E 26 6B            [ 1] 4186 	cp a,#1 
      00A760 01 E6            [ 1] 4187 	jreq 1$
      00A762 01 0D 01         [ 2] 4188 	jp syntax_error
      002DE5                       4189 1$: 
      002DE5                       4190 	_xpop  
      00A765 27 05            [ 1]    1     ld a,(y)
      00A767 44               [ 1]    2     ldw x,y 
      00A768 0A 01            [ 2]    3     ldw x,(1,x)
      00A76A 26 FB A4 01      [ 2]    4     addw y,#CELL_SIZE 
      00A76E 5F 97 4F         [ 2] 4191 	ldw timer,x 
      00A771 5B               [ 4] 4192 	ret 
                                   4193 
                                   4194 ;------------------------------
                                   4195 ; BASIC: TIMEOUT 
                                   4196 ; return state of timer 
                                   4197 ; output:
                                   4198 ;   A:X     0 not timeout 
                                   4199 ;   A:X     -1 timeout 
                                   4200 ;------------------------------
      002DF2                       4201 timeout:
      00A772 01               [ 1] 4202 	clr a 
      00A773 81 00 12         [ 2] 4203 	ldw x,timer 
      00A774 27 02            [ 1] 4204 	jreq 1$
      00A774 52               [ 1] 4205 	clrw x
      00A775 02               [ 4] 4206 	ret  
      00A776 CD               [ 1] 4207 1$:	cpl a
      00A777 9A               [ 2] 4208 	cplw x 
      00A778 37               [ 4] 4209 	ret 
                                   4210  	
                                   4211 
                                   4212 
                                   4213 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4214 ;-----------------------------------
                                   4215 ; BASIC: IWDGEN expr1 
                                   4216 ; enable independant watchdog timer
                                   4217 ; expr1 is delay in multiple of 62.5µsec
                                   4218 ; expr1 -> {1..16383}
                                   4219 ;-----------------------------------
      002DFD                       4220 enable_iwdg:
      00A779 A1 02 27         [ 4] 4221 	call arg_list
      00A77C 03 CC            [ 1] 4222 	cp a,#1 
      00A77E 97 08            [ 1] 4223 	jreq 1$
      00A780 90 F6 93         [ 2] 4224 	jp syntax_error 
      002E07                       4225 1$: _xpop  
      00A783 EE 01            [ 1]    1     ld a,(y)
      00A785 72               [ 1]    2     ldw x,y 
      00A786 A9 00            [ 2]    3     ldw x,(1,x)
      00A788 03 9F 6B 02      [ 2]    4     addw y,#CELL_SIZE 
      00A78C 90 F6            [ 1] 4226 	push #0
      00A78E 93 EE 01 72      [ 1] 4227 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A792 A9               [ 1] 4228 	ld a,xh 
      00A793 00 03            [ 1] 4229 	and a,#0x3f
      00A795 A3               [ 1] 4230 	ld xh,a  
      00A796 00 0F 23         [ 2] 4231 2$:	cpw x,#255
      00A799 05 A6            [ 2] 4232 	jrule 3$
      00A79B 0A CC            [ 1] 4233 	inc (1,sp)
      00A79D 97               [ 1] 4234 	rcf 
      00A79E 0A               [ 2] 4235 	rrcw x 
      00A79F CD AD            [ 2] 4236 	jra 2$
      00A7A1 26 6B 01 A6      [ 1] 4237 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7A5 01               [ 1] 4238 	pop a  
      00A7A6 0D 01 27         [ 1] 4239 	ld IWDG_PR,a 
      00A7A9 05               [ 1] 4240 	ld a,xl
      00A7AA 48               [ 1] 4241 	dec a 
      00A7AB 0A 01 26 FB      [ 1] 4242 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7AF 0D 02 26         [ 1] 4243 	ld IWDG_RLR,a 
      00A7B2 05 43 E4 00      [ 1] 4244 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A7B6 20               [ 4] 4245 	ret 
                                   4246 
                                   4247 
                                   4248 ;-----------------------------------
                                   4249 ; BASIC: IWDGREF  
                                   4250 ; refresh independant watchdog count down 
                                   4251 ; timer before it reset MCU. 
                                   4252 ;-----------------------------------
      002E3B                       4253 refresh_iwdg:
      00A7B7 02 EA 00 E7      [ 1] 4254 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A7BB 00               [ 4] 4255 	ret 
                                   4256 
                                   4257 
                                   4258 ;-------------------------------------
                                   4259 ; BASIC: LOG2(expr)
                                   4260 ; return logarithm base 2 of expr 
                                   4261 ; this is the position of most significant
                                   4262 ; bit set. 
                                   4263 ; input: 
                                   4264 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4265 ;   A     TK_INTGR 
                                   4266 ;   xstack log2 
                                   4267 ;*********************************
      002E40                       4268 log2:
      00A7BC 5B 02 81         [ 4] 4269 	call func_args 
      00A7BF A1 01            [ 1] 4270 	cp a,#1 
      00A7BF 72 00            [ 1] 4271 	jreq 1$
      00A7C1 00 23 02         [ 2] 4272 	jp syntax_error 
      002E4A                       4273 1$: 
      002E4A                       4274 	_xpop    
      00A7C4 4F 81            [ 1]    1     ld a,(y)
      00A7C6 93               [ 1]    2     ldw x,y 
      00A7C6 AE A7            [ 2]    3     ldw x,(1,x)
      00A7C8 ED CD 89 DC      [ 2]    4     addw y,#CELL_SIZE 
      00A7CC 5B               [ 1] 4275 	tnz a
      00A7CD 02 52            [ 1] 4276 	jrne 2$ 
      00A7CF 04               [ 2] 4277 	tnzw x 
      00A7D0 CD A0            [ 1] 4278 	jrne 2$
      00A7D2 C6 AE            [ 1] 4279 	ld a,#ERR_BAD_VALUE
      00A7D4 16 90 CF         [ 2] 4280 	jp tb_error 
      00A7D7 00 05            [ 1] 4281 2$: push #24 
      00A7D9 7F               [ 2] 4282 3$: rlcw x 
      00A7DA 72               [ 1] 4283     rlc a 
      00A7DB 5F 00            [ 1] 4284 	jrc 4$
      00A7DD 03 5F            [ 1] 4285 	dec (1,sp) 
      00A7DF CF 00            [ 1] 4286 	jrne 3$
      00A7E1 01               [ 1] 4287 4$: clrw x 
      00A7E2 72               [ 1] 4288     pop a 
      00A7E3 11               [ 1] 4289 	dec a
      00A7E4 00               [ 1] 4290 	rlwa x  
      002E6C                       4291 9$:	
      00A7E5 23               [ 4] 4292 	ret 
                                   4293 
                                   4294 ;-----------------------------------
                                   4295 ; BASIC: BIT(expr) 
                                   4296 ; expr ->{0..23}
                                   4297 ; return 2^expr 
                                   4298 ; output:
                                   4299 ;    A:X    2^expr 
                                   4300 ;-----------------------------------
      002E6D                       4301 bitmask:
      00A7E6 72 18 00         [ 4] 4302     call func_args 
      00A7E9 23 CC            [ 1] 4303 	cp a,#1
      00A7EB 97 B3            [ 1] 4304 	jreq 1$
      00A7ED 0A 62 72         [ 2] 4305 	jp syntax_error 
      002E77                       4306 1$: _xpop 
      00A7F0 65 61            [ 1]    1     ld a,(y)
      00A7F2 6B               [ 1]    2     ldw x,y 
      00A7F3 20 70            [ 2]    3     ldw x,(1,x)
      00A7F5 6F 69 6E 74      [ 2]    4     addw y,#CELL_SIZE 
      00A7F9 2C               [ 1] 4307 	ld a,xl 
      00A7FA 20 52 55         [ 2] 4308 	ldw x,#1 
      00A7FD 4E 20            [ 1] 4309 	and a,#23
      00A7FF 74 6F            [ 1] 4310 	jreq 9$
      00A801 20               [ 1] 4311 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A802 72               [ 1] 4312 	clr a 
      002E8A                       4313 2$: 
      00A803 65               [ 2] 4314 	slaw x 
      00A804 73               [ 1] 4315 	rlc a 	
      00A805 75 6D            [ 1] 4316 	dec (1,sp)
      00A807 65 2E            [ 1] 4317 	jrne 2$ 
      002E90                       4318 4$:
      002E90                       4319     _drop 1 
      00A809 0A 00            [ 2]    1     addw sp,#1 
      00A80B 81               [ 4] 4320 9$:	ret 
                                   4321 
                                   4322 ;------------------------------
                                   4323 ; BASIC: DO 
                                   4324 ; initiate a DO ... UNTIL loop 
                                   4325 ;------------------------------
                           000003  4326 	DOLP_ADR=3 
                           000005  4327 	DOLP_INW=5
                           000004  4328 	VSIZE=4 
      002E93                       4329 do_loop:
      00A80B 72               [ 2] 4330 	popw x 
      002E94                       4331 	_vars VSIZE 
      00A80C 01 00            [ 2]    1     sub sp,#VSIZE 
      00A80E 23               [ 2] 4332 	pushw x 
      00A80F 01 81 04         [ 2] 4333 	ldw x,basicptr 
      00A811 1F 03            [ 2] 4334 	ldw (DOLP_ADR,sp),x
      00A811 CD 95 1E         [ 2] 4335 	ldw x,in.w 
      00A814 81 05            [ 2] 4336 	ldw (DOLP_INW,sp),x
      00A815 72 5C 00 1F      [ 1] 4337 	inc loop_depth 
      00A815 89               [ 4] 4338 	ret 
                                   4339 
                                   4340 ;--------------------------------
                                   4341 ; BASIC: UNTIL expr 
                                   4342 ; loop if exprssion is false 
                                   4343 ; else terminate loop
                                   4344 ;--------------------------------
      002EA6                       4345 until: 
      00A816 CD 98 88 85      [ 1] 4346 	tnz loop_depth 
      00A81A CD B2            [ 1] 4347 	jrne 1$ 
      00A81C 62 27 4A         [ 2] 4348 	jp syntax_error 
      002EAF                       4349 1$: 
      00A81F CD 87 67         [ 4] 4350 	call condition  
      002EB2                       4351 	_xpop 
      00A822 72 5F            [ 1]    1     ld a,(y)
      00A824 00               [ 1]    2     ldw x,y 
      00A825 19 52            [ 2]    3     ldw x,(1,x)
      00A827 06 1D 00 04      [ 2]    4     addw y,#CELL_SIZE 
      00A82B 1F               [ 1] 4352 	tnz a 
      00A82C 01 EE            [ 1] 4353 	jrne 9$ 
      00A82E 02               [ 2] 4354 	tnzw x 
      00A82F 1F 03            [ 1] 4355 	jrne 9$ 
      00A831 A6 80            [ 2] 4356 	ldw x,(DOLP_ADR,sp)
      00A833 62 4D 27         [ 2] 4357 	ldw basicptr,x 
      00A836 01 5C            [ 1] 4358 	ld a,(2,x)
      00A838 1F 05 1E         [ 1] 4359 	ld count,a 
      00A83B 01 CF            [ 2] 4360 	ldw x,(DOLP_INW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A83D 00 1A CD         [ 2] 4361 	ldw in.w,x 
      00A840 87               [ 4] 4362 	ret 
      002ED1                       4363 9$:	; remove loop data from stack  
      00A841 E5               [ 2] 4364 	popw x
      002ED2                       4365 	_drop VSIZE
      00A842 AE 00            [ 2]    1     addw sp,#VSIZE 
      00A844 80 CD 88 E0      [ 1] 4366 	dec loop_depth 
      00A848 1E               [ 2] 4367 	jp (x)
                                   4368 
                                   4369 ;--------------------------
                                   4370 ; BASIC: PORTA...PORTI  
                                   4371 ;  return constant value 
                                   4372 ;  PORT  base address 
                                   4373 ;---------------------------
      002ED9                       4374 const_porta:
      00A849 05 5A 1F         [ 2] 4375 	ldw x,#PA_BASE 
      00A84C 05               [ 1] 4376 	clr a 
      00A84D 26               [ 4] 4377 	ret 
      002EDE                       4378 const_portb:
      00A84E F0 1E 01         [ 2] 4379 	ldw x,#PB_BASE 
      00A851 CF               [ 1] 4380 	clr a 
      00A852 00               [ 4] 4381 	ret 
      002EE3                       4382 const_portc:
      00A853 1A A6 58         [ 2] 4383 	ldw x,#PC_BASE 
      00A856 5F               [ 1] 4384 	clr a 
      00A857 CD               [ 4] 4385 	ret 
      002EE8                       4386 const_portd:
      00A858 88 0B CD         [ 2] 4387 	ldw x,#PD_BASE 
      00A85B 88               [ 1] 4388 	clr a 
      00A85C 0B               [ 4] 4389 	ret 
      002EED                       4390 const_porte:
      00A85D 7B 03 CD         [ 2] 4391 	ldw x,#PE_BASE 
      00A860 88               [ 1] 4392 	clr a 
      00A861 0B               [ 4] 4393 	ret 
      002EF2                       4394 const_portf:
      00A862 7B 04 CD         [ 2] 4395 	ldw x,#PF_BASE 
      00A865 88               [ 1] 4396 	clr a 
      00A866 0B               [ 4] 4397 	ret 
      002EF7                       4398 const_portg:
      00A867 5B 06 1E         [ 2] 4399 	ldw x,#PG_BASE 
      00A869 4F               [ 1] 4400 	clr a 
      00A869 81               [ 4] 4401 	ret 
      00A86A                       4402 const_porti:
      00A86A 72 01 00         [ 2] 4403 	ldw x,#PI_BASE 
      00A86D 23               [ 1] 4404 	clr a 
      00A86E 05               [ 4] 4405 	ret 
                                   4406 
                                   4407 ;-------------------------------
                                   4408 ; following return constant 
                                   4409 ; related to GPIO register offset 
                                   4410 ;---------------------------------
      002F01                       4411 const_odr:
      00A86F A6               [ 1] 4412 	clr a 
      00A870 07 CC 97         [ 2] 4413 	ldw x,#GPIO_ODR
      00A873 0A               [ 4] 4414 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A874                       4415 const_idr:
      00A874 72               [ 1] 4416 	clr a 
      00A875 5F 00 19         [ 2] 4417 	ldw x,#GPIO_IDR
      00A878 CD               [ 4] 4418 	ret 
      002F0B                       4419 const_ddr:
      00A879 98               [ 1] 4420 	clr a
      00A87A 6F A1 03         [ 2] 4421 	ldw x,#GPIO_DDR
      00A87D 27               [ 4] 4422 	ret 
      002F10                       4423 const_cr1:
      00A87E 96               [ 1] 4424 	clr a 
      00A87F 52 03 A1         [ 2] 4425 	ldw x,#GPIO_CR1
      00A882 04               [ 4] 4426 	ret 
      002F15                       4427 const_cr2:
      00A883 27               [ 1] 4428 	clr a
      00A884 03 CC 97         [ 2] 4429 	ldw x,#GPIO_CR2
      00A887 08               [ 4] 4430 	ret 
                                   4431 ;-------------------------
                                   4432 ; BASIC: POUT 
                                   4433 ;  constant for port mode
                                   4434 ;  used by PMODE 
                                   4435 ;  to set pin as output
                                   4436 ;------------------------
      002F1A                       4437 const_output:
      00A888 CD               [ 1] 4438 	clr a 
      00A889 98 B1 A4         [ 2] 4439 	ldw x,#OUTP
      00A88C DF               [ 4] 4440 	ret 
                                   4441 
                                   4442 ;-------------------------
                                   4443 ; BASIC: PINP 
                                   4444 ;  constant for port mode
                                   4445 ;  used by PMODE 
                                   4446 ;  to set pin as input
                                   4447 ;------------------------
      002F1F                       4448 const_input:
      00A88D A1               [ 1] 4449 	clr a  
      00A88E 45 26 0C         [ 2] 4450 	ldw x,#INP 
      00A891 AE               [ 4] 4451 	ret 
                                   4452 	
                                   4453 ;-----------------------
                                   4454 ; memory area constants
                                   4455 ;-----------------------
      002F24                       4456 const_eeprom_base:
      00A892 40               [ 1] 4457 	clr a  
      00A893 00 CF 00         [ 2] 4458 	ldw x,#EEPROM_BASE 
      00A896 1A               [ 4] 4459 	ret 
                                   4460 
                                   4461 ;---------------------------
                                   4462 ; BASIC: DATA 
                                   4463 ; when the interpreter find 
                                   4464 ; a DATA line it skip it.
                                   4465 ;---------------------------
      002F29                       4466 data:
      00A897 AE 47 FF 4F 20   [ 1] 4467 	mov in,count 
      00A89C 15               [ 4] 4468 	ret 
                                   4469 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                                   4470 ;------------------------------
                                   4471 ; check if it is a DATA line 
                                   4472 ; input: 
                                   4473 ;    X    line address 
                                   4474 ; output:
                                   4475 ;    Z    set if DATA line 
                                   4476 ;----------------------------
      002F2F                       4477 is_data_line:
      00A89D A1               [ 2] 4478 	pushw x 
      00A89E 46 27            [ 1] 4479 	ld a,(3,x)
      00A8A0 06 AE            [ 1] 4480 	cp a,#TK_CMD 
      00A8A2 96 10            [ 1] 4481 	jrne 9$
      00A8A4 CC 97            [ 2] 4482 	ldw x,(4,x)
      00A8A6 0A 2F 29         [ 2] 4483 	cpw x,#data  
      00A8A7 85               [ 2] 4484 9$: popw x 
      00A8A7 AE               [ 4] 4485 	ret 
                                   4486 
                                   4487 ;---------------------------------
                                   4488 ; BASIC: RESTORE [line#]
                                   4489 ; set data_ptr to first data line
                                   4490 ; if no DATA found pointer set to
                                   4491 ; zero.
                                   4492 ; if a line# is given as argument 
                                   4493 ; a data line with that number 
                                   4494 ; is searched and the data pointer 
                                   4495 ; is set to it. If there is no 
                                   4496 ; data line with that number 
                                   4497 ; the program is interrupted. 
                                   4498 ;---------------------------------
      002F3D                       4499 restore:
      00A8A8 B9               [ 1] 4500 	clrw x 
      00A8A9 00 CF 00         [ 2] 4501 	ldw data_ptr,x 
      00A8AC 1A A6 02         [ 2] 4502 	ldw data_ofs,x 
      00A8AF AE 7F FF         [ 2] 4503 	ldw x,txtbgn 
      00A8B2 CD 17 EF         [ 4] 4504 	call next_token 
      00A8B2 6B 01            [ 1] 4505 	cp a,#TK_INTGR
      00A8B4 1F 02            [ 1] 4506 	jrne 0$
      00A8B6 CD 87 67         [ 4] 4507 	call get_int24
      00A8B9 90 89            [ 2] 4508 	pushw y 
      00A8B9 CD               [ 1] 4509 	clr a 
      00A8BA 88 EE 27         [ 4] 4510 	call search_lineno  
      00A8BD 08 A6            [ 2] 4511 	popw y 
      00A8BF 45               [ 2] 4512 	tnzw x 
      00A8C0 CD 89            [ 1] 4513 	jrne set_data_pointer 
      00A8C2 7F CD            [ 2] 4514 	jra data_error 
      002F5E                       4515 0$:
      002F5E                       4516 	_unget_token  
      00A8C4 87 E5 AE 00 80   [ 1]    1      mov in,in.saved  
                                   4517 ; search first DATA line 	
      00A8C9 CD 88 E0         [ 2] 4518 1$:	cpw x,txtend
      00A8CC 7B 01            [ 1] 4519 	jruge data_error 
      002F68                       4520 2$:	
      00A8CE 1E 02 72         [ 4] 4521 	call is_data_line 
      00A8D1 B0 00            [ 1] 4522 	jrne 4$
      00A8D3 1A C2 00         [ 4] 4523 4$:	call try_next_line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A8D6 19 22            [ 1] 4524 	jrne 4$ 
      00A8D8 E0               [ 4] 4525 	ret 
                                   4526 
                                   4527 ;---------------------
                                   4528 ; set data pointer 
                                   4529 ; variables at new line 
                                   4530 ; input:
                                   4531 ;    X    line address 
                                   4532 ;----------------------
      002F73                       4533 set_data_pointer:
      00A8D9 CD 95 1E         [ 2] 4534 	ldw data_ptr,x
      00A8DC 1E 02            [ 1] 4535 	ld a,(2,x)
      00A8DE A3 47 FF         [ 1] 4536 	ld data_len,a 
      00A8E1 26 03 CD 9D      [ 1] 4537 	mov data_ofs,#FIRST_DATA_ITEM
      00A8E5 A7               [ 4] 4538 	ret 
                                   4539 
                                   4540 
                                   4541 ;--------------------
                                   4542 ; at end of data line 
                                   4543 ; check if next line 
                                   4544 ; is a data line 
                                   4545 ; input:
                                   4546 ;    X   actual line address 
                                   4547 ;  
                                   4548 ;-------------------
      00A8E6                       4549 try_next_line: 
      00A8E6 5B 03            [ 1] 4550 	ld a,(2,x)
      00A8E8 81 00 0E         [ 1] 4551 	ld acc8,a 
      00A8E9 72 5F 00 0D      [ 1] 4552 	clr acc16 
      00A8E9 89 9F A4 80      [ 2] 4553 	addw x,acc16 
      00A8ED 97 FE C3         [ 2] 4554 	cpw x,txtend 
      00A8F0 AA 01            [ 1] 4555 	jrult 1$
      00A8F2 85 81            [ 2] 4556 	jra data_error 
      00A8F4                       4557 1$:	
      00A8F4 88 4D 27         [ 4] 4558 	call is_data_line 
      00A8F7 0A F6            [ 1] 4559 	jreq 2$
      00A8F9 5C 90            [ 1] 4560 	ld a,#1  
      00A8FB F7 90            [ 2] 4561 	jra 9$
      00A8FD 5C 0A 01         [ 4] 4562 2$:	call set_data_pointer
      00A900 26               [ 1] 4563 	clr a  
      00A901 F6               [ 4] 4564 9$:	ret 
      002FA2                       4565 data_error:	
      00A902 84 81            [ 1] 4566     ld a,#ERR_NO_DATA 
      00A904 CC 16 8A         [ 2] 4567 	jp tb_error 
                                   4568 
                                   4569 
                                   4570 ;---------------------------------
                                   4571 ; BASIC: READ 
                                   4572 ; return next data item | 0 
                                   4573 ;---------------------------------
                           000001  4574 	CTX_BPTR=1 
                           000003  4575 	CTX_IN=3 
                           000004  4576 	CTX_COUNT=4 
                           000005  4577 	INT24=5
                           000007  4578 	VSIZE=7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      002FA7                       4579 read:
      002FA7                       4580 	_vars  VSIZE 
      00A904 88 90            [ 2]    1     sub sp,#VSIZE 
      00A906 AE 16 E0         [ 4] 4581 	call save_context
      002FAC                       4582 read01:	
      00A909 90 89 A6         [ 1] 4583 	ld a,data_ofs
      00A90C 80 90 7F         [ 1] 4584 	cp a,data_len 
      00A90F 90 5C            [ 1] 4585 	jreq 2$ ; end of line  
      002FB4                       4586 0$:
      00A911 4A 26 F9         [ 2] 4587 	ldw x,data_ptr 
      00A914 90 85 84         [ 2] 4588 	ldw basicptr,x 
      00A917 81 00 08 00 01   [ 1] 4589 	mov in,data_ofs 
      00A918 55 00 09 00 02   [ 1] 4590 	mov count,data_len  
      00A918 89 AE B9         [ 4] 4591 	call expression 
      00A91B 00 CD            [ 1] 4592 	cp a,#TK_INTGR 
      00A91D AA 05            [ 1] 4593 	jreq 1$ 
      00A91F 27 0D F6         [ 2] 4594 	jp syntax_error 
      002FCE                       4595 1$:
      00A922 EA 01 27         [ 4] 4596 	call next_token ; skip comma
      00A925 23 CD AA         [ 2] 4597 	ldw x,basicptr 
      00A928 10 5D 26         [ 2] 4598 	ldw data_ptr,x 
      00A92B F0 20 1B 00 08   [ 1] 4599 	mov data_ofs,in 
      00A92E CD 20 56         [ 4] 4600 	call rest_context
      002FDF                       4601 	_xpop 
      00A92E CF 00            [ 1]    1     ld a,(y)
      00A930 0E               [ 1]    2     ldw x,y 
      00A931 EE 02            [ 2]    3     ldw x,(1,x)
      00A933 1C 00 04 1C      [ 2]    4     addw y,#CELL_SIZE 
      002FE8                       4602 	_drop VSIZE 
      00A937 00 7F            [ 2]    1     addw sp,#VSIZE 
      00A939 9F               [ 4] 4603 	ret 
      002FEB                       4604 2$: ; end of line reached 
                                   4605 	; try next line 
      00A93A A4 80 97         [ 2] 4606 	ldw x,data_ptr  
      00A93D 13 01 24         [ 4] 4607 	call try_next_line
      00A940 05 CE            [ 1] 4608 	jreq 0$ 
      00A942 00 0E            [ 2] 4609 	jra data_error 
                                   4610 
                                   4611 ;---------------------------------
                                   4612 ; BASIC: SPIEN clkdiv, 0|1  
                                   4613 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4614 ; if clkdiv==-1 disable SPI
                                   4615 ; 0|1 -> disable|enable  
                                   4616 ;--------------------------------- 
                           000005  4617 SPI_CS_BIT=5
      002FF5                       4618 spi_enable:
      00A944 20 E0 CE         [ 4] 4619 	call arg_list 
      00A947 00 0E            [ 1] 4620 	cp a,#2
      00A949 5B 02            [ 1] 4621 	jreq 1$
      00A94B 81 16 88         [ 2] 4622 	jp syntax_error 
      00A94C                       4623 1$: 
      00A94C 89 4B 04 72      [ 1] 4624 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A950 5F               [ 2] 4625 	popw x  
      00A951 00               [ 2] 4626 	tnzw x 
      00A952 19 CF            [ 1] 4627 	jreq spi_disable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A954 00               [ 2] 4628 	popw x 
      00A955 1A 4F            [ 1] 4629 	ld a,#(1<<SPI_CR1_BR)
      00A957 5F               [ 4] 4630 	mul x,a 
      00A958 CD               [ 1] 4631 	ld a,xl 
      00A959 88 0B 0A         [ 1] 4632 	ld SPI_CR1,a 
                                   4633 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A95C 01 26 F9 5B      [ 1] 4634 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A960 01 85 CF 00      [ 1] 4635 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4636 ; configure SPI as master mode 0.	
      00A964 1A 81 52 00      [ 1] 4637 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4638 ; ~CS line controlled by sofware 	
      00A966 72 12 52 01      [ 1] 4639 	bset SPI_CR2,#SPI_CR2_SSM 
      00A966 89 90 89 52      [ 1] 4640     bset SPI_CR2,#SPI_CR2_SSI 
                                   4641 ; enable SPI
      00A96A 06 CD 9E C1      [ 1] 4642 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A96E 26               [ 4] 4643 	ret 
      003028                       4644 spi_disable:
      003028                       4645 	_drop #2; throw first argument.
      00A96F 03 CC            [ 2]    1     addw sp,##2 
                                   4646 ; wait spi idle 
      00A971 A9 FB            [ 1] 4647 1$:	ld a,#0x82 
      00A973 1F 05 72         [ 1] 4648 	and a,SPI_SR
      00A976 5F 00            [ 1] 4649 	cp a,#2 
      00A978 19 CD            [ 1] 4650 	jrne 1$
      00A97A A9 18 CF 00      [ 1] 4651 	bres SPI_CR1,#SPI_CR1_SPE
      00A97E 1A AE FF FF      [ 1] 4652 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A982 72 B0 00 1A      [ 1] 4653 	bres PE_DDR,#SPI_CS_BIT 
      00A986 1D               [ 4] 4654 	ret 
                                   4655 
      003040                       4656 spi_clear_error:
      00A987 00 04            [ 1] 4657 	ld a,#0x78 
      00A989 13 05 24         [ 1] 4658 	bcp a,SPI_SR 
      00A98C 05 A6            [ 1] 4659 	jreq 1$
      00A98E 01 CC 97 0A      [ 1] 4660 	clr SPI_SR 
      00A992 81               [ 4] 4661 1$: ret 
                                   4662 
      00304C                       4663 spi_send_byte:
      00A992 CE               [ 1] 4664 	push a 
      00A993 00 1A F6         [ 4] 4665 	call spi_clear_error
      00A996 EA               [ 1] 4666 	pop a 
      00A997 01 EA 02 EA 03   [ 2] 4667 	btjf SPI_SR,#SPI_SR_TXE,.
      00A99C 27 03 CD         [ 1] 4668 	ld SPI_DR,a
      00A99F A9 4C 52 03 FB   [ 2] 4669 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A9A1 C6 52 04         [ 1] 4670 	ld a,SPI_DR 
      00A9A1 CD               [ 4] 4671 	ret 
                                   4672 
      003062                       4673 spi_rcv_byte:
      00A9A2 87 A7            [ 1] 4674 	ld a,#255
      00A9A4 0F 03 CD A9 04   [ 2] 4675 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A9A9 CE AA 01         [ 1] 4676 	ld a,SPI_DR 
      00A9AC 90               [ 4] 4677 	ret
                                   4678 
                                   4679 ;------------------------------
                                   4680 ; BASIC: SPIWR byte [,byte]
                                   4681 ; write 1 or more byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



                                   4682 ;------------------------------
      00306D                       4683 spi_write:
      00A9AD FF 72 A9         [ 4] 4684 	call expression
      00A9B0 00 02            [ 1] 4685 	cp a,#TK_INTGR 
      00A9B2 1E 05            [ 1] 4686 	jreq 1$
      00A9B4 90 FF 72         [ 2] 4687 	jp syntax_error 
      003077                       4688 1$:	
      00A9B7 A9               [ 1] 4689 	ld a,xl 
      00A9B8 00 02 A6         [ 4] 4690 	call spi_send_byte 
      00A9BB 7C A3 00         [ 4] 4691 	call next_token 
      00A9BE 7C 22            [ 1] 4692 	cp a,#TK_COMMA 
      00A9C0 01 9F            [ 1] 4693 	jrne 2$ 
      00A9C2 6B 04            [ 2] 4694 	jra spi_write 
      00A9C4 CE               [ 1] 4695 2$:	tnz a 
      00A9C5 00 1C            [ 1] 4696 	jreq 3$
      003087                       4697 	_unget_token  
      00A9C7 1F 01 03 00 01   [ 1]    1      mov in,in.saved  
      00A9C9 81               [ 4] 4698 3$:	ret 
                                   4699 
                                   4700 
                                   4701 ;-------------------------------
                                   4702 ; BASIC: SPIRD 	
                                   4703 ; read one byte from SPI 
                                   4704 ;-------------------------------
      00308D                       4705 spi_read:
      00A9C9 1E 01 7B         [ 4] 4706 	call spi_rcv_byte 
      00A9CC 04               [ 1] 4707 	clrw x 
      00A9CD CD               [ 1] 4708 	ld xl,a 
      00A9CE A8               [ 1] 4709 	clr a  
      00A9CF F4               [ 4] 4710 	ret 
                                   4711 
                                   4712 ;------------------------------
                                   4713 ; BASIC: SPISEL 0|1 
                                   4714 ; set state of ~CS line
                                   4715 ; 0|1 deselect|select  
                                   4716 ;------------------------------
      003094                       4717 spi_select:
      00A9D0 1F 01 AE         [ 4] 4718 	call next_token 
      00A9D3 16 E0            [ 1] 4719 	cp a,#TK_INTGR 
      00A9D5 CD 87            [ 1] 4720 	jreq 1$
      00A9D7 C1 AE 00         [ 2] 4721 	jp syntax_error 
      00A9DA 80               [ 2] 4722 1$: tnzw x  
      00A9DB CD 88            [ 1] 4723 	jreq cs_high 
      00A9DD E0 1E 01 C3      [ 1] 4724 	bres PE_ODR,#SPI_CS_BIT
      00A9E1 00               [ 4] 4725 	ret 
      0030A6                       4726 cs_high: 
      00A9E2 1E 24 16 1E      [ 1] 4727 	bset PE_ODR,#SPI_CS_BIT
      00A9E6 05               [ 4] 4728 	ret 
                                   4729 
                                   4730 ;-------------------------------
                                   4731 ; BASIC: PAD 
                                   4732 ; Return pad buffer address.
                                   4733 ;------------------------------
      0030AB                       4734 pad_ref:
      00A9E7 72 F0 03         [ 2] 4735 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A9EA 1F               [ 1] 4736 	clr a
      00A9EB 05               [ 4] 4737 	ret 
                                   4738 
                                   4739 ;****************************
                                   4740 ; expression stack 
                                   4741 ; manipulation routines
                                   4742 ;****************************
                                   4743 
                                   4744 ;-----------------------------
                                   4745 ; BASIC: PUSH expr|rel|cond 
                                   4746 ; push the result on xtack
                                   4747 ;-----------------------------
      0030B0                       4748 xpush:
      00A9EC A6 80 A3         [ 4] 4749 	call condition 
      00A9EF 00               [ 4] 4750 	ret 
                                   4751 
                                   4752 ;------------------------------
                                   4753 ; BASIC: POP 
                                   4754 ; pop top of xstack 
                                   4755 ;------------------------------
      0030B4                       4756 xpop:
      0030B4                       4757 	_xpop 
      00A9F0 80 24            [ 1]    1     ld a,(y)
      00A9F2 01               [ 1]    2     ldw x,y 
      00A9F3 9F 6B            [ 2]    3     ldw x,(1,x)
      00A9F5 04 CD A9 04      [ 2]    4     addw y,#CELL_SIZE 
      00A9F9 20               [ 4] 4758 	ret 
                                   4759 
                                   4760 
                                   4761 ;------------------------------
                                   4762 ; BASIC: ALLOC expr 
                                   4763 ; allocate expr element on xtack 
                                   4764 ;-------------------------------
      0030BE                       4765 xalloc: 
      00A9FA CE 5B 06         [ 4] 4766 	call expression 
      00A9FD 90 85            [ 1] 4767 	cp a,#TK_INTGR
      00A9FF 85 81            [ 1] 4768 	jreq 1$ 
      00AA01 54 42 58         [ 2] 4769 	jp syntax_error
      0030C8                       4770 1$: _xpop 
      00AA04 58 F6            [ 1]    1     ld a,(y)
      00AA05 93               [ 1]    2     ldw x,y 
      00AA05 89 9F            [ 2]    3     ldw x,(1,x)
      00AA07 A4 80 97 FE      [ 2]    4     addw y,#CELL_SIZE 
      00AA0B C3               [ 1] 4771 	tnz a 
      00AA0C AA 03            [ 1] 4772 	jreq 3$ 
      00AA0E 85 81            [ 1] 4773 2$:	ld a,#ERR_BAD_VALUE
      00AA10 CC 16 8A         [ 2] 4774 	jp tb_error 
      00AA10 9F A4 80         [ 2] 4775 3$: cpw x,#XSTACK_SIZE 
      00AA13 97 CF            [ 1] 4776 	jrugt 2$
      00AA15 00 0E            [ 1] 4777 	ld a,#CELL_SIZE 
      00AA17 EE               [ 4] 4778 	mul x,a 
      00AA18 02 72 BB         [ 2] 4779 	ldw acc16,x 
      00AA1B 00 0E 1C 00      [ 2] 4780 	subw y,acc16 
      00AA1F 04 1C 00 7F      [ 2] 4781 	cpw y,#xstack_full
      00AA23 9F A4            [ 1] 4782 	jrugt 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AA25 80 97            [ 1] 4783 	ld a,#ERR_MEM_FULL
      00AA27 81 16 8A         [ 2] 4784 	jp tb_error 
      00AA28                       4785 9$:	 
      00AA28 AE               [ 4] 4786 	ret 
                                   4787 
                                   4788 
                                   4789 ;------------------------------
                                   4790 ;  BASIC DROP expr 
                                   4791 ;  expr in range {0..XSTACK_SIZE}
                                   4792 ;  discard n elements from xtack
                                   4793 ;------------------------------
      0030F4                       4794 xdrop:
      00AA29 B9 00 89         [ 4] 4795 	call expression 
      00AA2C A1 84            [ 1] 4796 	cp a,#TK_INTGR
      00AA2C CD A8            [ 1] 4797 	jreq 1$ 
      00AA2E E9 26 3B         [ 2] 4798 	jp syntax_error 
      0030FE                       4799 1$:	_xpop 
      00AA31 1C 00            [ 1]    1     ld a,(y)
      00AA33 04               [ 1]    2     ldw x,y 
      00AA34 35 10            [ 2]    3     ldw x,(1,x)
      00AA36 00 0B CD 98      [ 2]    4     addw y,#CELL_SIZE 
      00AA3A B7               [ 1] 4800 	ld a,xl 
      00AA3B A6 20            [ 1] 4801 	and a,#0x1f 
      00AA3D CD               [ 1] 4802 	clrw x 
      00AA3E 89               [ 1] 4803 	ld xl,a 
      00AA3F 7F 1E            [ 1] 4804 	ld a,#CELL_SIZE 
      00AA41 01               [ 4] 4805 	mul x,a 
      00AA42 EE 02 35         [ 2] 4806 	ldw acc16,x  
      00AA45 0A 00 0B CD      [ 2] 4807 	addw y,acc16 
      00AA49 98 B7 AE 9F      [ 2] 4808 	cpw y,#XSTACK_EMPTY 
      00AA4D 2B CD            [ 2] 4809 	jrule 9$
      00AA4F 89 DC A6 2C      [ 2] 4810 	ldw y,#XSTACK_EMPTY 
      00AA53 CD               [ 4] 4811 9$:	ret 
                                   4812 
                                   4813 ;-----------------------
                                   4814 ; check if value in A:X 
                                   4815 ; is inside xstack bound
                                   4816 ; output:
                                   4817 ;    X     slot address  
                                   4818 ;-----------------------
      003121                       4819 xstack_bound:
      00AA54 89               [ 1] 4820 	tnz a 
      00AA55 7F 1E            [ 1] 4821 	jrne 8$ 
      00AA57 01 1C 00         [ 2] 4822 1$: cpw x,#XSTACK_SIZE 
      00AA5A 08 CD            [ 1] 4823 	jrugt 8$
      00AA5C 89 DC            [ 1] 4824 	ld a,#CELL_SIZE 
      00AA5E A6               [ 4] 4825 	mul x,a
      00AA5F 0D CD 89         [ 2] 4826 	ldw acc16,x 
      00AA62 7F               [ 1] 4827 	ldw x,y 
      00AA63 1E 01 CD AA      [ 2] 4828 	addw x,acc16 
      00AA67 10 1F 01         [ 2] 4829 	cpw x,#XSTACK_EMPTY 
      00AA6A 20 C0            [ 1] 4830 	jruge 8$  
      00AA6C 81               [ 4] 4831 	ret 
      00AA6C CD AA            [ 1] 4832 8$: ld a,#ERR_BAD_VALUE
      00AA6E 05 27 F4         [ 2] 4833 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



                                   4834 
                                   4835 ;-------------------------
                                   4836 ; BASIC: PUT expr, cond 
                                   4837 ; expr -> slot 
                                   4838 ; cond -> valut to put 
                                   4839 ; on xstack 
                                   4840 ;-------------------------
      00AA71                       4841 xput:
      00AA71 5B 02 81         [ 4] 4842 	call arg_list 
      00AA74 A1 02            [ 1] 4843 	cp a,#2 
      00AA74 CD 9B            [ 1] 4844 	jreq 1$ 
      00AA76 7B A1 84         [ 2] 4845 0$:	jp syntax_error
      003149                       4846 1$: _xpop   ; value to put 
      00AA79 27 03            [ 1]    1     ld a,(y)
      00AA7B CC               [ 1]    2     ldw x,y 
      00AA7C 97 08            [ 2]    3     ldw x,(1,x)
      00AA7E 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00AA82 01               [ 2] 4847 	pushw x 
      00AA83 72               [ 1] 4848 	push a 
      003154                       4849 	_xpop    ; slot 
      00AA84 A9 00            [ 1]    1     ld a,(y)
      00AA86 03               [ 1]    2     ldw x,y 
      00AA87 C7 00            [ 2]    3     ldw x,(1,x)
      00AA89 19 CF 00 1A      [ 2]    4     addw y,#CELL_SIZE 
      00AA8D CD 31 21         [ 4] 4850 	call xstack_bound
      00AA8D CD 98 6F         [ 2] 4851     ldw ptr16,x 
      00AA90 A1               [ 1] 4852 	pop a 
      00AA91 08               [ 2] 4853 	popw x 
      00AA92 27 02 20 46      [ 4] 4854 	ld [ptr16],a 
      00AA96 CD 98 6F A1      [ 1] 4855 	inc ptr8 
      00AA9A 04 27 23 A1      [ 5] 4856 	ldw [ptr16],x 
      00AA9E 02               [ 4] 4857 	ret 
                                   4858 
                                   4859 ;------------------------
                                   4860 ; BASIC: PICK expr 
                                   4861 ; get nième element on 
                                   4862 ; xtack. 
                                   4863 ;-----------------------
      003172                       4864 xpick:
      00AA9F 27 2A 55         [ 4] 4865 	call func_args 
      00AAA2 00 04            [ 1] 4866 	cp a,#1 
      00AAA4 00 02            [ 1] 4867 	jreq 1$
      00AAA6 CD 9B 7B         [ 2] 4868 	jp syntax_error 
      00317C                       4869 1$: _xpop 
      00AAA9 A1 84            [ 1]    1     ld a,(y)
      00AAAB 27               [ 1]    2     ldw x,y 
      00AAAC 03 CC            [ 2]    3     ldw x,(1,x)
      00AAAE 97 08 90 F6      [ 2]    4     addw y,#CELL_SIZE 
      00AAB2 93 EE 01         [ 4] 4870 	call xstack_bound
      00AAB5 72               [ 1] 4871     ld a,(x)
      00AAB6 A9 00            [ 2] 4872 	ldw x,(1,x)				
      00AAB8 03               [ 4] 4873 	ret 
                                   4874 
                                   4875 
                                   4876 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



                                   4877 ; BASIC: AUTORUN \C | label  
                                   4878 ;  \C -> cancel autorun 
                                   4879 ;  addr -> register an 
                                   4880 ;    autorun program 
                                   4881 ;    this program execute at 
                                   4882 ;     reset/boot 
                                   4883 ;----------------------------
      00318C                       4884 cmd_auto_run:
      00AAB9 9F 5F CD         [ 4] 4885 	call next_token 
      00AABC 88 0B            [ 1] 4886 	cp a,#TK_LABEL 
      00AABE 20 CD            [ 1] 4887 	jreq 1$ 
      00AAC0 A1 04            [ 1] 4888 	cp a,#TK_CHAR 
      00AAC0 F6 72            [ 1] 4889 	jrne 0$ 
      00AAC2 5C               [ 1] 4890 	ld a,(x)
      00AAC3 00 02 5F CD      [ 1] 4891 	inc in 
      00AAC7 88 0B            [ 1] 4892 	and a,#0xDF 
      00AAC9 20 C2            [ 1] 4893 	cp a,#'C 
      00AACB 26 07            [ 1] 4894 	jrne 0$ 
      00AACB 89 F6 72         [ 2] 4895 	ldw x,#EEPROM_BASE 
      00AACE 5C 00 02         [ 4] 4896 	call erase_header
      00AAD1 5F               [ 4] 4897 	ret 
      00AAD2 CD 88 0B         [ 2] 4898 0$:	jp syntax_error
      00AAD5 85               [ 2] 4899 1$:	pushw x 
      00AAD6 F6 27 B4         [ 4] 4900 	call skip_string
      00AAD9 5C               [ 2] 4901 	popw x 
      00AADA 20 EF E2         [ 4] 4902 	call search_program
      00AADC 26 05            [ 1] 4903 	jrne 2$ 
      00AADC 81 0A            [ 1] 4904 	ld a,#ERR_BAD_VALUE
      00AADD CC 16 8A         [ 2] 4905 	jp tb_error 
      00AADD CD               [ 2] 4906 2$: pushw x 
      00AADE 9A 32 A1 01      [ 1] 4907 	clr farptr 
      00AAE2 27 03 CC         [ 2] 4908 	ldw x,#EEPROM_BASE
      00AAE5 97 08 90         [ 2] 4909 	ldw ptr16,x 
      00AAE8 F6 93 EE         [ 1] 4910 	ld a,AR_SIGN 
      00AAEB 01               [ 1] 4911 	clrw x 	 
      00AAEC 72 A9 00         [ 4] 4912 	call write_byte
      00AAEF 03 9F A4         [ 1] 4913 	ld a,AR_SIGN+1
      00AAF2 7F 81 8B         [ 4] 4914 	call write_byte 
      00AAF4 7B 01            [ 1] 4915 	ld a,(1,sp)
      00AAF4 A6 06 CD         [ 4] 4916 	call write_byte 
      00AAF7 9A 25            [ 1] 4917 	ld a,(2,sp)
      00AAF9 CD 98 6F         [ 4] 4918 	call write_byte 
      0031DD                       4919 	_drop 2 
      00AAFC A1 02            [ 2]    1     addw sp,#2 
      00AAFE 27               [ 4] 4920 	ret 
                                   4921 
      00AAFF 0E A1                 4922 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4923 
                                   4924 ;-------------------------------
                                   4925 ; search a program in flash 
                                   4926 ; memory with a label at first 
                                   4927 ; that correspond to name 
                                   4928 ; pointed by X 
                                   4929 ; input:
                                   4930 ;    x      *name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



                                   4931 ; output: 
                                   4932 ;    X     prog_addr|0
                                   4933 ;-------------------------------
                           000001  4934 	WLKPTR=1 
                           000003  4935 	PNAME=3
                           000005  4936 	LIMIT=5
                           000007  4937 	YSAVE=7
                           000006  4938 	VSIZE=6 
      0031E2                       4939 search_program:
      00AB01 04 27            [ 2] 4940 	pushw y 
      0031E4                       4941 	_vars VSIZE 
      00AB03 12 A1            [ 2]    1     sub sp,#VSIZE 
      00AB05 82 27            [ 2] 4942 	ldw (PNAME,sp),x 
      00AB07 03 CC 97         [ 4] 4943 	call uflash 
      00AB0A 08 05            [ 2] 4944 	ldw (LIMIT,sp),x 
      00AB0B AE 38 80         [ 2] 4945 	ldw x,#app_space 
      00AB0B FD 20            [ 2] 4946 1$:	ldw (WLKPTR,sp),x  
      00AB0D 0B               [ 1] 4947 	clr a 
      00AB0E CD 24 D1         [ 4] 4948 	call is_program_addr
      00AB0E F6 88            [ 1] 4949 	jrne 4$
      00AB10 CD 98 88         [ 2] 4950 	addw x,#7 
      00AB13 84               [ 1] 4951 	ld a,(x)
      00AB14 20 03            [ 1] 4952 	cp a,#TK_LABEL 
      00AB16 26 08            [ 1] 4953 	jrne 4$ 
      00AB16 CD               [ 1] 4954 	incw x 
      00AB17 98 B1            [ 2] 4955 	ldw y,(PNAME,sp)
      00AB19 5F 02 72         [ 4] 4956 	call strcmp
      00AB1C A2 00            [ 1] 4957 	jrne 6$
      003208                       4958 4$: 
      00AB1E 03 90 F7         [ 4] 4959 	call skip_to_next
      00AB21 90 EF            [ 2] 4960 	cpw x,(LIMIT,sp)
      00AB23 01 A6            [ 1] 4961 	jrult 1$
      00AB25 07               [ 1] 4962 	clrw x 
      00AB26 CD 9A            [ 2] 4963 	jra 8$
      003212                       4964 6$: ; found label 
      00AB28 25 01            [ 2] 4965 	ldw x,(WLKPTR,sp)
      00AB29 1C 00 04         [ 2] 4966 	addw x,#4 	
      003217                       4967 8$:	
      003217                       4968 	_drop VSIZE  
      00AB29 90 F6            [ 2]    1     addw sp,#VSIZE 
      00AB2B 93 EE            [ 2] 4969 	popw y 
      00AB2D 01               [ 4] 4970 	ret 
                                   4971 
                                   4972 
                                   4973 ;-------------------------------
                                   4974 ; BASIC: CHAIN label [, line#]
                                   4975 ; Execute another program like it 
                                   4976 ; is a sub-routine. When the 
                                   4977 ; called program terminate 
                                   4978 ; execution continue at caller 
                                   4979 ; after CHAIN command. 
                                   4980 ; if a line# is given, the 
                                   4981 ; chained program start execution 
                                   4982 ; at this line#.
                                   4983 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           000003  4984 	CHAIN_LN=3 
                           000005  4985 	CHAIN_ADDR=5 
                           000007  4986 	CHAIN_BP=7
                           000009  4987 	CHAIN_IN=9
                           00000A  4988 	CHAIN_COUNT=10 
                           00000B  4989 	CHAIN_TXTBGN=11 
                           00000D  4990 	CHAIN_TXTEND=13 
                           00000C  4991 	VSIZE=12 
                           000004  4992 	DISCARD=4 
      00321C                       4993 cmd_chain:
      00AB2E 72               [ 2] 4994 	popw x 
      00321D                       4995 	_vars VSIZE 
      00AB2F A9 00            [ 2]    1     sub sp,#VSIZE 
      00AB31 03               [ 2] 4996 	pushw x
      00AB32 81 03            [ 1] 4997 	clr (CHAIN_LN,sp) 
      00AB33 0F 04            [ 1] 4998 	clr (CHAIN_LN+1,sp)  
      00AB33 CD 89            [ 1] 4999 	ld a,#TK_LABEL 
      00AB35 8F 81 A5         [ 4] 5000 	call expect 
      00AB37 89               [ 2] 5001 	pushw x 
      00AB37 5F C6 00         [ 4] 5002 	call skip_string
      00AB3A 2F               [ 2] 5003 	popw x 
      00AB3B C0 00 30         [ 4] 5004 	call search_program 
      00AB3E 27               [ 2] 5005 	tnzw x  
      00AB3F 03 53            [ 1] 5006 	jrne 1$ 
      00AB41 A6 FF            [ 1] 5007 0$:	ld a,#ERR_BAD_VALUE
      00AB43 CC 16 8A         [ 2] 5008 	jp tb_error 
      00AB43 81 05            [ 2] 5009 1$: ldw (CHAIN_ADDR,sp), x ; program addr 
      00AB44 CD 17 EF         [ 4] 5010     call next_token 
      00AB44 CD 9A            [ 1] 5011 	cp a,#TK_COMMA 
      00AB46 32 A1            [ 1] 5012 	jrne 4$
      00AB48 02 27            [ 1] 5013 	ld a,#TK_INTGR
      00AB4A 03 CC 97         [ 4] 5014 	call expect 
      00AB4D 08 90 E6         [ 4] 5015 	call get_int24 
      00AB50 03 93            [ 2] 5016 	ldw (CHAIN_LN,sp),x
      00AB52 EE 04            [ 2] 5017 	jra 6$ 
      00324E                       5018 4$: _unget_token 
      00AB54 A3 50 00 2B 16   [ 1]    1      mov in,in.saved  
      003253                       5019 6$: ; save chain context 
      00AB59 A3 50 29         [ 2] 5020 	ldw x,basicptr 
      00AB5C 2A 11            [ 2] 5021 	ldw (CHAIN_BP,sp),x 
      00AB5E 89 90 F6         [ 2] 5022 	ldw x,in
      00AB61 93 EE            [ 2] 5023 	ldw (CHAIN_IN,sp),x
      00AB63 01 72 A9         [ 2] 5024 	ldw x,txtbgn 
      00AB66 00 03            [ 2] 5025 	ldw (CHAIN_TXTBGN,sp),x
      00AB68 72 FB 01         [ 2] 5026 	ldw x,txtend 
      00AB6B 5B 02            [ 2] 5027 	ldw (CHAIN_TXTEND,sp),x  
                                   5028 ; set chained program context 	
      00AB6D 4F 81            [ 2] 5029 	ldw x,(CHAIN_ADDR,sp)
      00AB6F CF 00 04         [ 2] 5030 	ldw basicptr,x 
      00AB6F A6 0A CC         [ 2] 5031 	ldw txtbgn,x 
      00AB72 97 0A 02         [ 2] 5032 	subw x,#2
      00AB74 FE               [ 2] 5033 	ldw x,(x)
      00AB74 72 5F 00         [ 2] 5034 	addw x,(CHAIN_ADDR,sp)
      00AB77 19 AE B9         [ 2] 5035 	ldw txtend,x  
      00AB7A 00 89            [ 2] 5036 	ldw x,(CHAIN_ADDR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AB7C CF 00            [ 1] 5037 	ld a,(2,x)
      00AB7E 1A CD 88         [ 1] 5038 	ld count,a 
      00AB81 EE 27 0F 1E      [ 1] 5039 	mov in,#3 
      00AB85 01 1C            [ 2] 5040 	ldw x,(CHAIN_LN,sp)
      00AB87 00               [ 2] 5041 	tnzw x 
      00AB88 80 27            [ 1] 5042 	jreq 8$ 
      00AB8A 04 1F            [ 2] 5043 	pushw y
      00AB8C 01               [ 1] 5044 	clr a  
      00AB8D 20 ED 45         [ 4] 5045 	call search_lineno
      00AB8F 90 85            [ 2] 5046 	popw y 
      00AB8F 0F               [ 2] 5047 	tnzw x 
      00AB90 01 0F            [ 1] 5048 	jreq 0$ 
      00AB92 02 85 4F         [ 2] 5049 	ldw basicptr,x 
      00AB95 81 02            [ 1] 5050 	ld a,(2,x)
      00AB96 C7 00 02         [ 1] 5051 	ld count,a 
      00AB96 CD 9A 32 A1      [ 1] 5052 8$: inc chain_level
      00AB9A 02               [ 2] 5053 	popw x 
      0032A1                       5054 	_drop DISCARD
      00AB9B 27 03            [ 2]    1     addw sp,#DISCARD 
      00AB9D CC               [ 2] 5055 	jp (x)
                                   5056 
                                   5057 
                                   5058 ;------------------------------
                                   5059 ;      dictionary 
                                   5060 ; format:
                                   5061 ;   link:   2 bytes 
                                   5062 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   5063 ;   cmd_name: 16 byte max 
                                   5064 ;   code_addr: 2 bytes 
                                   5065 ;------------------------------
                                   5066 	.macro _dict_entry len,name,code_addr 
                                   5067 	.word LINK 
                                   5068 	LINK=.
                                   5069 name:
                                   5070 	.byte len   	
                                   5071 	.ascii "name"
                                   5072 	.word code_addr  
                                   5073 	.endm 
                                   5074 
                           000000  5075 	LINK=0
                                   5076 ; respect alphabetic order for BASIC names from Z-A
                                   5077 ; this sort order is for a cleaner WORDS cmd output. 	
      0032A4                       5078 kword_end:
      0032A4                       5079 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AB9E 97 08                    1 	.word LINK 
                           0032A6     2 	LINK=.
      00ABA0                          3 XOR:
      00ABA0 90                       4 	.byte 3+F_XOR   	
      00ABA1 E6 03 93                 5 	.ascii "XOR"
      00ABA4 EE 04                    6 	.word TK_XOR  
      0032AC                       5080 	_dict_entry,5,WRITE,write  
      00ABA6 CF 00                    1 	.word LINK 
                           0032AE     2 	LINK=.
      0032AE                          3 WRITE:
      00ABA8 1A                       4 	.byte 5   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00ABA9 90 F6 93 EE 01           5 	.ascii "WRITE"
      00ABAE 72 A9                    6 	.word write  
      0032B6                       5081 	_dict_entry,5,WORDS,words 
      00ABB0 00 03                    1 	.word LINK 
                           0032B8     2 	LINK=.
      0032B8                          3 WORDS:
      00ABB2 90                       4 	.byte 5   	
      00ABB3 F7 90 EF 01 72           5 	.ascii "WORDS"
      00ABB8 CD 00                    6 	.word words  
      0032C0                       5082 	_dict_entry 4,WAIT,wait 
      00ABBA 1A 81                    1 	.word LINK 
                           0032C2     2 	LINK=.
      00ABBC                          3 WAIT:
      00ABBC 72                       4 	.byte 4   	
      00ABBD 0D 52 30 FB              5 	.ascii "WAIT"
      00ABC1 8E CC                    6 	.word wait  
      0032C9                       5083 	_dict_entry,3+F_IFUNC,USR,usr
      00ABC3 81 35                    1 	.word LINK 
                           0032CB     2 	LINK=.
      00ABC5                          3 USR:
      00ABC5 72                       4 	.byte 3+F_IFUNC   	
      00ABC6 0D 52 30                 5 	.ascii "USR"
      00ABC9 FB 72                    6 	.word usr  
      0032D1                       5084 	_dict_entry,5,UNTIL,until 
      00ABCB 16 00                    1 	.word LINK 
                           0032D3     2 	LINK=.
      0032D3                          3 UNTIL:
      00ABCD 23                       4 	.byte 5   	
      00ABCE 8E 81 54 49 4C           5 	.ascii "UNTIL"
      00ABD0 2E A6                    6 	.word until  
      0032DB                       5085 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ABD0 CD 9B                    1 	.word LINK 
                           0032DD     2 	LINK=.
      0032DD                          3 UFLASH:
      00ABD2 7B                       4 	.byte 6+F_IFUNC   	
      00ABD3 A1 84 27 03 CC 97        5 	.ascii "UFLASH"
      00ABD9 08 90                    6 	.word uflash  
      0032E6                       5086 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ABDB F6 93                    1 	.word LINK 
                           0032E8     2 	LINK=.
      0032E8                          3 UBOUND:
      00ABDD EE                       4 	.byte 6+F_IFUNC   	
      00ABDE 01 72 A9 00 03 44        5 	.ascii "UBOUND"
      00ABE3 1C C8                    6 	.word ubound  
      0032F1                       5087 	_dict_entry,4,TONE,tone  
      00ABE3 CF 00                    1 	.word LINK 
                           0032F3     2 	LINK=.
      0032F3                          3 TONE:
      00ABE5 13                       4 	.byte 4   	
      00ABE6 CE 00 13 5D              5 	.ascii "TONE"
      00ABEA 27 03                    6 	.word tone  
      0032FA                       5088 	_dict_entry,2,TO,to
      00ABEC 8F 26                    1 	.word LINK 
                           0032FC     2 	LINK=.
      0032FC                          3 TO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00ABEE F7                       4 	.byte 2   	
      00ABEF 54 4F                    5 	.ascii "TO"
      00ABEF 81 75                    6 	.word to  
      00ABF0                       5089 	_dict_entry,5,TIMER,set_timer
      00ABF0 CD 9B                    1 	.word LINK 
                           003303     2 	LINK=.
      003303                          3 TIMER:
      00ABF2 7B                       4 	.byte 5   	
      00ABF3 A1 84 27 03 CC           5 	.ascii "TIMER"
      00ABF8 97 08                    6 	.word set_timer  
      00330B                       5090 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00ABFA 90 F6                    1 	.word LINK 
                           00330D     2 	LINK=.
      00330D                          3 TIMEOUT:
      00ABFC 93                       4 	.byte 7+F_IFUNC   	
      00ABFD EE 01 72 A9 00 03 54     5 	.ascii "TIMEOUT"
      00AC03 2D F2                    6 	.word timeout  
      003317                       5091 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AC03 A3 14                    1 	.word LINK 
                           003319     2 	LINK=.
      003319                          3 TICKS:
      00AC05 00                       4 	.byte 5+F_IFUNC   	
      00AC06 2B 0C 35 0F 50           5 	.ascii "TICKS"
      00AC0B F2 A6                    6 	.word get_ticks  
      003321                       5092 	_dict_entry,4,STOP,stop 
      00AC0D 1E 62                    1 	.word LINK 
                           003323     2 	LINK=.
      003323                          3 STOP:
      00AC0F A6                       4 	.byte 4   	
      00AC10 10 62 20 1E              5 	.ascii "STOP"
      00AC14 27 3F                    6 	.word stop  
      00332A                       5093 	_dict_entry,4,STEP,step 
      00AC14 A3 08                    1 	.word LINK 
                           00332C     2 	LINK=.
      00332C                          3 STEP:
      00AC16 00                       4 	.byte 4   	
      00AC17 2B 09 35 0E              5 	.ascii "STEP"
      00AC1B 50 F2                    6 	.word step  
      003333                       5094 	_dict_entry,5,SPIWR,spi_write
      00AC1D A6 50                    1 	.word LINK 
                           003335     2 	LINK=.
      003335                          3 SPIWR:
      00AC1F 62                       4 	.byte 5   	
      00AC20 20 10 49 57 52           5 	.ascii "SPIWR"
      00AC22 30 6D                    6 	.word spi_write  
      00333D                       5095 	_dict_entry,6,SPISEL,spi_select
      00AC22 35 07                    1 	.word LINK 
                           00333F     2 	LINK=.
      00333F                          3 SPISEL:
      00AC24 50                       4 	.byte 6   	
      00AC25 F2 50 49 53 45 4C        5 	.ascii "SPISEL"
      00AC26 30 94                    6 	.word spi_select  
      003348                       5096 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AC26 A3 00                    1 	.word LINK 
                           00334A     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00334A                          3 SPIRD:
      00AC28 40                       4 	.byte 5+F_IFUNC   	
      00AC29 23 07 72 5C 50           5 	.ascii "SPIRD"
      00AC2E F2 54                    6 	.word spi_read  
      003352                       5097 	_dict_entry,5,SPIEN,spi_enable 
      00AC30 20 F4                    1 	.word LINK 
                           003354     2 	LINK=.
      00AC32                          3 SPIEN:
      00AC32 9F                       4 	.byte 5   	
      00AC33 4A 27 01 4A 4E           5 	.ascii "SPIEN"
      00AC37 2F F5                    6 	.word spi_enable  
      00335C                       5098 	_dict_entry,5,SLEEP,sleep 
      00AC37 A4 3E                    1 	.word LINK 
                           00335E     2 	LINK=.
      00335E                          3 SLEEP:
      00AC39 C7                       4 	.byte 5   	
      00AC3A 50 F1 72 18 50           5 	.ascii "SLEEP"
      00AC3F F0 8E                    6 	.word sleep  
      003366                       5099     _dict_entry,4,SIZE,cmd_size 
      00AC41 81 5E                    1 	.word LINK 
                           003368     2 	LINK=.
      00AC42                          3 SIZE:
      00AC42 C6                       4 	.byte 4   	
      00AC43 00 10 CE 00              5 	.ascii "SIZE"
      00AC47 11 81                    6 	.word cmd_size  
      00AC49                       5100 	_dict_entry,4,SAVE,cmd_save 
      00AC49 CD 9A                    1 	.word LINK 
                           003371     2 	LINK=.
      003371                          3 SAVE:
      00AC4B 32                       4 	.byte 4   	
      00AC4C A1 01 27 03              5 	.ascii "SAVE"
      00AC50 CC 97                    6 	.word cmd_save  
      003378                       5101 	_dict_entry 3,RUN,cmd_run
      00AC52 08 71                    1 	.word LINK 
                           00337A     2 	LINK=.
      00AC53                          3 RUN:
      00AC53 CD                       4 	.byte 3   	
      00AC54 82 73 90                 5 	.ascii "RUN"
      00AC57 F6 93                    6 	.word cmd_run  
      003380                       5102 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AC59 EE 01                    1 	.word LINK 
                           003382     2 	LINK=.
      003382                          3 RSHIFT:
      00AC5B 72                       4 	.byte 6+F_IFUNC   	
      00AC5C A9 00 03 81 46 54        5 	.ascii "RSHIFT"
      00AC60 2C 0C                    6 	.word rshift  
      00338B                       5103 	_dict_entry,3+F_IFUNC,RND,random 
      00AC60 CD 9A                    1 	.word LINK 
                           00338D     2 	LINK=.
      00338D                          3 RND:
      00AC62 32                       4 	.byte 3+F_IFUNC   	
      00AC63 A1 02 27                 5 	.ascii "RND"
      00AC66 03 CC                    6 	.word random  
      003393                       5104 	_dict_entry,6,RETURN,return 
      00AC68 97 08                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



                           003395     2 	LINK=.
      003395                          3 RETURN:
      00AC6A 90                       4 	.byte 6   	
      00AC6B F6 93 EE 01 72 A9        5 	.ascii "RETURN"
      00AC71 00 03                    6 	.word return  
      00339E                       5105 	_dict_entry,7,RESTORE,restore 
      00AC73 9F 88                    1 	.word LINK 
                           0033A0     2 	LINK=.
      0033A0                          3 RESTORE:
      00AC75 90                       4 	.byte 7   	
      00AC76 F6 93 EE 01 72 A9 00     5 	.ascii "RESTORE"
      00AC7D 03 0D                    6 	.word restore  
      0033AA                       5106 	_dict_entry 3,REM,remark 
      00AC7F 01 27                    1 	.word LINK 
                           0033AC     2 	LINK=.
      0033AC                          3 REM:
      00AC81 07                       4 	.byte 3   	
      00AC82 98 59 49                 5 	.ascii "REM"
      00AC85 0A 01                    6 	.word remark  
      0033B2                       5107 	_dict_entry,6,REBOOT,cold_start
      00AC87 26 F9                    1 	.word LINK 
                           0033B4     2 	LINK=.
      0033B4                          3 REBOOT:
      00AC89 5B                       4 	.byte 6   	
      00AC8A 01 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00AC8C 00 B5                    6 	.word cold_start  
      0033BD                       5108 	_dict_entry,4+F_IFUNC,READ,read  
      00AC8C CD 9A                    1 	.word LINK 
                           0033BF     2 	LINK=.
      0033BF                          3 READ:
      00AC8E 32                       4 	.byte 4+F_IFUNC   	
      00AC8F A1 02 27 03              5 	.ascii "READ"
      00AC93 CC 97                    6 	.word read  
      0033C6                       5109 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AC95 08 90                    1 	.word LINK 
                           0033C8     2 	LINK=.
      0033C8                          3 QKEY:
      00AC97 F6                       4 	.byte 4+F_IFUNC   	
      00AC98 93 EE 01 72              5 	.ascii "QKEY"
      00AC9C A9 00                    6 	.word qkey  
      0033CF                       5110 	_dict_entry,3,PUT,xput 
      00AC9E 03 9F                    1 	.word LINK 
                           0033D1     2 	LINK=.
      0033D1                          3 PUT:
      00ACA0 88                       4 	.byte 3   	
      00ACA1 90 F6 93                 5 	.ascii "PUT"
      00ACA4 EE 01                    6 	.word xput  
      0033D7                       5111 	_dict_entry,4,PUSH,xpush   
      00ACA6 72 A9                    1 	.word LINK 
                           0033D9     2 	LINK=.
      0033D9                          3 PUSH:
      00ACA8 00                       4 	.byte 4   	
      00ACA9 03 0D 01 27              5 	.ascii "PUSH"
      00ACAD 07 98                    6 	.word xpush  
      0033E0                       5112 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00ACAF 46 56                    1 	.word LINK 
                           0033E2     2 	LINK=.
      0033E2                          3 PORTI:
      00ACB1 0A                       4 	.byte 5+F_IFUNC   	
      00ACB2 01 26 F9 5B 01           5 	.ascii "PORTI"
      00ACB7 81 FC                    6 	.word const_porti  
      00ACB8                       5113 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00ACB8 A6 84                    1 	.word LINK 
                           0033EC     2 	LINK=.
      0033EC                          3 PORTG:
      00ACBA CD                       4 	.byte 5+F_IFUNC   	
      00ACBB 9A 25 CD 98 A1           5 	.ascii "PORTG"
      00ACC0 9F A4                    6 	.word const_portg  
      0033F4                       5114 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00ACC2 07 C7                    1 	.word LINK 
                           0033F6     2 	LINK=.
      0033F6                          3 PORTF:
      00ACC4 50                       4 	.byte 5+F_IFUNC   	
      00ACC5 C6 81 52 54 46           5 	.ascii "PORTF"
      00ACC7 2E F2                    6 	.word const_portf  
      0033FE                       5115 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00ACC7 52 01                    1 	.word LINK 
                           003400     2 	LINK=.
      003400                          3 PORTE:
      00ACC9 CD                       4 	.byte 5+F_IFUNC   	
      00ACCA 9A 37 A1 02 27           5 	.ascii "PORTE"
      00ACCF 03 CC                    6 	.word const_porte  
      003408                       5116 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00ACD1 97 08                    1 	.word LINK 
                           00340A     2 	LINK=.
      00340A                          3 PORTD:
      00ACD3 90                       4 	.byte 5+F_IFUNC   	
      00ACD4 F6 93 EE 01 72           5 	.ascii "PORTD"
      00ACD9 A9 00                    6 	.word const_portd  
      003412                       5117 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00ACDB 03 CF                    1 	.word LINK 
                           003414     2 	LINK=.
      003414                          3 PORTC:
      00ACDD 00                       4 	.byte 5+F_IFUNC   	
      00ACDE 1A 90 F6 93 EE           5 	.ascii "PORTC"
      00ACE3 01 72                    6 	.word const_portc  
      00341C                       5118 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00ACE5 A9 00                    1 	.word LINK 
                           00341E     2 	LINK=.
      00341E                          3 PORTB:
      00ACE7 03                       4 	.byte 5+F_IFUNC   	
      00ACE8 CD AD 26 6B 01           5 	.ascii "PORTB"
      00ACED A6 01                    6 	.word const_portb  
      003426                       5119 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00ACEF 0D 01                    1 	.word LINK 
                           003428     2 	LINK=.
      003428                          3 PORTA:
      00ACF1 27                       4 	.byte 5+F_IFUNC   	
      00ACF2 0D 48 0A 01 26           5 	.ascii "PORTA"
      00ACF7 FB 6B                    6 	.word const_porta  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      003430                       5120 	_dict_entry 5,PRINT,print 
      00ACF9 01 7B                    1 	.word LINK 
                           003432     2 	LINK=.
      003432                          3 PRINT:
      00ACFB 01                       4 	.byte 5   	
      00ACFC EA 03 E7 03 A6           5 	.ascii "PRINT"
      00AD01 01 C1                    6 	.word print  
      00343A                       5121 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AD03 00 0F                    1 	.word LINK 
                           00343C     2 	LINK=.
      00343C                          3 POUT:
      00AD05 27                       4 	.byte 4+F_IFUNC   	
      00AD06 10 7B 01 43              5 	.ascii "POUT"
      00AD0A E4 04                    6 	.word const_output  
      003443                       5122 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AD0C E7 04                    1 	.word LINK 
                           003445     2 	LINK=.
      003445                          3 POP:
      00AD0E 7B                       4 	.byte 3+F_IFUNC   	
      00AD0F 01 43 E4                 5 	.ascii "POP"
      00AD12 02 E7                    6 	.word xpop  
      00344B                       5123 	_dict_entry,4,POKE,poke 
      00AD14 02 20                    1 	.word LINK 
                           00344D     2 	LINK=.
      00344D                          3 POKE:
      00AD16 0C                       4 	.byte 4   	
      00AD17 50 4F 4B 45              5 	.ascii "POKE"
      00AD17 7B 01                    6 	.word poke  
      003454                       5124 	_dict_entry,5,PMODE,pin_mode 
      00AD19 EA 02                    1 	.word LINK 
                           003456     2 	LINK=.
      003456                          3 PMODE:
      00AD1B E7                       4 	.byte 5   	
      00AD1C 02 7B 01 EA 04           5 	.ascii "PMODE"
      00AD21 E7 04                    6 	.word pin_mode  
      00AD23                       5125 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AD23 5B 01                    1 	.word LINK 
                           003460     2 	LINK=.
      003460                          3 PINP:
      00AD25 81                       4 	.byte 4+F_IFUNC   	
      00AD26 50 49 4E 50              5 	.ascii "PINP"
      00AD26 58 1C                    6 	.word const_input  
      003467                       5126 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AD28 AD 36                    1 	.word LINK 
                           003469     2 	LINK=.
      003469                          3 PICK:
      00AD2A FE                       4 	.byte 4+F_IFUNC   	
      00AD2B 9F 88 5E A6              5 	.ascii "PICK"
      00AD2F 05 42                    6 	.word xpick  
      003470                       5127 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AD31 1C 50                    1 	.word LINK 
                           003472     2 	LINK=.
      003472                          3 PEEK:
      00AD33 00                       4 	.byte 4+F_IFUNC   	
      00AD34 84 81 45 4B              5 	.ascii "PEEK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AD36 22 07                    6 	.word peek  
      003479                       5128 	_dict_entry,5,PAUSE,pause 
      00AD36 03 06                    1 	.word LINK 
                           00347B     2 	LINK=.
      00347B                          3 PAUSE:
      00AD38 03                       4 	.byte 5   	
      00AD39 05 04 00 02 01           5 	.ascii "PAUSE"
      00AD3E 06 00                    6 	.word pause  
      003483                       5129 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AD40 02 02                    1 	.word LINK 
                           003485     2 	LINK=.
      003485                          3 PAD:
      00AD42 02                       4 	.byte 3+F_IFUNC   	
      00AD43 03 03 01                 5 	.ascii "PAD"
      00AD46 03 03                    6 	.word pad_ref  
      00348B                       5130 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AD48 02 04                    1 	.word LINK 
                           00348D     2 	LINK=.
      00348D                          3 OR:
      00AD4A 04                       4 	.byte 2+F_OR   	
      00AD4B 05 02                    5 	.ascii "OR"
      00AD4D 06 02                    6 	.word TK_OR  
      003492                       5131 	_dict_entry,2,ON,cmd_on 
      00AD4F 07 02                    1 	.word LINK 
                           003494     2 	LINK=.
      003494                          3 ON:
      00AD51 05                       4 	.byte 2   	
      00AD52 04 02                    5 	.ascii "ON"
      00AD54 04 01                    6 	.word cmd_on  
      00AD56                       5132 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AD56 CD 9A                    1 	.word LINK 
                           00349B     2 	LINK=.
      00349B                          3 ODR:
      00AD58 32                       4 	.byte 3+F_IFUNC   	
      00AD59 A1 01 27                 5 	.ascii "ODR"
      00AD5C 03 CC                    6 	.word const_odr  
      0034A1                       5133 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AD5E 97 08                    1 	.word LINK 
                           0034A3     2 	LINK=.
      00AD60                          3 NOT:
      00AD60 90                       4 	.byte 3+F_NOT   	
      00AD61 F6 93 EE                 5 	.ascii "NOT"
      00AD64 01 72                    6 	.word TK_NOT  
      0034A9                       5134 	_dict_entry,4,NEXT,next 
      00AD66 A9 00                    1 	.word LINK 
                           0034AB     2 	LINK=.
      0034AB                          3 NEXT:
      00AD68 03                       4 	.byte 4   	
      00AD69 89 88 A6 80              5 	.ascii "NEXT"
      00AD6D 15 01                    6 	.word next  
      0034B2                       5135 	_dict_entry,3,NEW,new
      00AD6F 27 05                    1 	.word LINK 
                           0034B4     2 	LINK=.
      0034B4                          3 NEW:
      00AD71 A6                       4 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AD72 0A CC 97                 5 	.ascii "NEW"
      00AD75 0A 8B                    6 	.word new  
      00AD76                       5136 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AD76 CE 00                    1 	.word LINK 
                           0034BC     2 	LINK=.
      0034BC                          3 LSHIFT:
      00AD78 15                       4 	.byte 6+F_IFUNC   	
      00AD79 58 58 58 58 58 9E        5 	.ascii "LSHIFT"
      00AD7F C8 00                    6 	.word lshift  
      0034C5                       5137 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AD81 15 C7                    1 	.word LINK 
                           0034C7     2 	LINK=.
      0034C7                          3 LOG2:
      00AD83 00                       4 	.byte 4+F_IFUNC   	
      00AD84 0E 9F C8 00              5 	.ascii "LOG2"
      00AD88 16 C7                    6 	.word log2  
      0034CE                       5138 	_dict_entry 4,LIST,list
      00AD8A 00 0F                    1 	.word LINK 
                           0034D0     2 	LINK=.
      0034D0                          3 LIST:
      00AD8C CE                       4 	.byte 4   	
      00AD8D 00 17 CF 00              5 	.ascii "LIST"
      00AD91 15 CE                    6 	.word list  
      0034D7                       5139 	_dict_entry 3,LET,let 
      00AD93 00 17                    1 	.word LINK 
                           0034D9     2 	LINK=.
      0034D9                          3 LET:
      00AD95 54                       4 	.byte 3   	
      00AD96 9E C8 00                 5 	.ascii "LET"
      00AD99 17 C7                    6 	.word let  
      0034DF                       5140 	_dict_entry,3+F_CFUNC,KEY,key 
      00AD9B 00 17                    1 	.word LINK 
                           0034E1     2 	LINK=.
      0034E1                          3 KEY:
      00AD9D 9F                       4 	.byte 3+F_CFUNC   	
      00AD9E C8 00 18                 5 	.ascii "KEY"
      00ADA1 C7 00                    6 	.word key  
      0034E7                       5141 	_dict_entry,7,IWDGREF,refresh_iwdg
      00ADA3 18 CE                    1 	.word LINK 
                           0034E9     2 	LINK=.
      0034E9                          3 IWDGREF:
      00ADA5 00                       4 	.byte 7   	
      00ADA6 0E 54 54 54 9E C8 00     5 	.ascii "IWDGREF"
      00ADAD 0E C7                    6 	.word refresh_iwdg  
      0034F3                       5142 	_dict_entry,6,IWDGEN,enable_iwdg
      00ADAF 00 0E                    1 	.word LINK 
                           0034F5     2 	LINK=.
      0034F5                          3 IWDGEN:
      00ADB1 9F                       4 	.byte 6   	
      00ADB2 C8 00 0F C7 00 0F        5 	.ascii "IWDGEN"
      00ADB8 C8 00                    6 	.word enable_iwdg  
      0034FE                       5143 	_dict_entry,5,INPUT,input_var  
      00ADBA 18 97                    1 	.word LINK 
                           003500     2 	LINK=.
      003500                          3 INPUT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ADBC C6                       4 	.byte 5   	
      00ADBD 00 0E C8 00 17           5 	.ascii "INPUT"
      00ADC2 95 CF                    6 	.word input_var  
      003508                       5144 	_dict_entry,2,IF,if 
      00ADC4 00 17                    1 	.word LINK 
                           00350A     2 	LINK=.
      00350A                          3 IF:
      00ADC6 C6                       4 	.byte 2   	
      00ADC7 00 16                    5 	.ascii "IF"
      00ADC9 A4 7F                    6 	.word if  
      00350F                       5145 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00ADCB 72 A2                    1 	.word LINK 
                           003511     2 	LINK=.
      003511                          3 IDR:
      00ADCD 00                       4 	.byte 3+F_IFUNC   	
      00ADCE 03 90 F7                 5 	.ascii "IDR"
      00ADD1 90 EF                    6 	.word const_idr  
      003517                       5146 	_dict_entry,3,HEX,hex_base
      00ADD3 01 84                    1 	.word LINK 
                           003519     2 	LINK=.
      003519                          3 HEX:
      00ADD5 85                       4 	.byte 3   	
      00ADD6 72 A2 00                 5 	.ascii "HEX"
      00ADD9 03 90                    6 	.word hex_base  
      00351F                       5147 	_dict_entry,4,GOTO,goto 
      00ADDB F7 90                    1 	.word LINK 
                           003521     2 	LINK=.
      003521                          3 GOTO:
      00ADDD EF                       4 	.byte 4   	
      00ADDE 01 CD 84 21              5 	.ascii "GOTO"
      00ADE2 90 F6                    6 	.word goto  
      003528                       5148 	_dict_entry,5,GOSUB,gosub 
      00ADE4 93 EE                    1 	.word LINK 
                           00352A     2 	LINK=.
      00352A                          3 GOSUB:
      00ADE6 01                       4 	.byte 5   	
      00ADE7 72 A9 00 03 1C           5 	.ascii "GOSUB"
      00ADEC 00 01                    6 	.word gosub  
      003532                       5149 	_dict_entry,3,GET,cmd_get 
      00ADEE A9 00                    1 	.word LINK 
                           003534     2 	LINK=.
      003534                          3 GET:
      00ADF0 81                       4 	.byte 3   	
      00ADF1 47 45 54                 5 	.ascii "GET"
      00ADF1 90 89                    6 	.word cmd_get  
      00353A                       5150 	_dict_entry,4+F_IFUNC,FREE,free
      00ADF3 52 03                    1 	.word LINK 
                           00353C     2 	LINK=.
      00353C                          3 FREE:
      00ADF5 0F                       4 	.byte 4+F_IFUNC   	
      00ADF6 02 0F 03 90              5 	.ascii "FREE"
      00ADFA AE B6                    6 	.word free  
      003543                       5151 	_dict_entry,3,FOR,for 
      00ADFC FC 93                    1 	.word LINK 
                           003545     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      003545                          3 FOR:
      00ADFE F6                       4 	.byte 3   	
      00ADFF A4 0F 6B                 5 	.ascii "FOR"
      00AE02 01 0C                    6 	.word for  
      00354B                       5152 	_dict_entry,4,FCPU,fcpu 
      00AE04 03 5C                    1 	.word LINK 
                           00354D     2 	LINK=.
      00354D                          3 FCPU:
      00AE06 F6                       4 	.byte 4   	
      00AE07 CD 89 7F 0C              5 	.ascii "FCPU"
      00AE0B 02 0A                    6 	.word fcpu  
      003554                       5153 	_dict_entry,5,ERASE,cmd_erase 
      00AE0D 01 26                    1 	.word LINK 
                           003556     2 	LINK=.
      003556                          3 ERASE:
      00AE0F F5                       4 	.byte 5   	
      00AE10 A6 46 11 02 2B           5 	.ascii "ERASE"
      00AE15 09 A6                    6 	.word cmd_erase  
      00355E                       5154 	_dict_entry,3,END,cmd_end  
      00AE17 20 CD                    1 	.word LINK 
                           003560     2 	LINK=.
      003560                          3 END:
      00AE19 89                       4 	.byte 3   	
      00AE1A 7F 0C 02                 5 	.ascii "END"
      00AE1D 20 07                    6 	.word cmd_end  
      003566                       5155 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AE1F A6 0D                    1 	.word LINK 
                           003568     2 	LINK=.
      003568                          3 EEPROM:
      00AE21 CD                       4 	.byte 6+F_IFUNC   	
      00AE22 89 7F 0F 02 72 A2        5 	.ascii "EEPROM"
      00AE28 00 02                    6 	.word const_eeprom_base  
      003571                       5156 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AE2A 90 FE                    1 	.word LINK 
                           003573     2 	LINK=.
      003573                          3 EEFREE:
      00AE2C 26                       4 	.byte 6+F_IFUNC   	
      00AE2D CF A6 0D CD 89 7F        5 	.ascii "EEFREE"
      00AE33 5F 7B                    6 	.word func_eefree  
      00357C                       5157 	_dict_entry,4,EDIT,cmd_edit 
      00AE35 03 97                    1 	.word LINK 
                           00357E     2 	LINK=.
      00357E                          3 EDIT:
      00AE37 CD                       4 	.byte 4   	
      00AE38 98 B7 AE AE              5 	.ascii "EDIT"
      00AE3C 45 CD                    6 	.word cmd_edit  
      003585                       5158 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AE3E 89 DC                    1 	.word LINK 
                           003587     2 	LINK=.
      003587                          3 DWRITE:
      00AE40 5B                       4 	.byte 6+F_CMD   	
      00AE41 03 90 85 81 20 77        5 	.ascii "DWRITE"
      00AE47 6F 72                    6 	.word digital_write  
      003590                       5159 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AE49 64 73                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



                           003592     2 	LINK=.
      003592                          3 DROP:
      00AE4B 20                       4 	.byte 4   	
      00AE4C 69 6E 20 64              5 	.ascii "DROP"
      00AE50 69 63                    6 	.word xdrop  
      003599                       5160 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AE52 74 69                    1 	.word LINK 
                           00359B     2 	LINK=.
      00359B                          3 DREAD:
      00AE54 6F                       4 	.byte 5+F_IFUNC   	
      00AE55 6E 61 72 79 0A           5 	.ascii "DREAD"
      00AE5A 00 BD                    6 	.word digital_read  
      00AE5B                       5161 	_dict_entry,2,DO,do_loop
      00AE5B CD 9A                    1 	.word LINK 
                           0035A5     2 	LINK=.
      0035A5                          3 DO:
      00AE5D 37                       4 	.byte 2   	
      00AE5E A1 01                    5 	.ascii "DO"
      00AE60 27 03                    6 	.word do_loop  
      0035AA                       5162 	_dict_entry,3,DIR,cmd_dir
      00AE62 CC 97                    1 	.word LINK 
                           0035AC     2 	LINK=.
      0035AC                          3 DIR:
      00AE64 08                       4 	.byte 3   	
      00AE65 44 49 52                 5 	.ascii "DIR"
      00AE65 90 F6                    6 	.word cmd_dir  
      0035B2                       5163 	_dict_entry,3,DIM,cmd_dim 
      00AE67 93 EE                    1 	.word LINK 
                           0035B4     2 	LINK=.
      0035B4                          3 DIM:
      00AE69 01                       4 	.byte 3   	
      00AE6A 72 A9 00                 5 	.ascii "DIM"
      00AE6D 03 CF                    6 	.word cmd_dim  
      0035BA                       5164 	_dict_entry,3,DEC,dec_base
      00AE6F 00 13                    1 	.word LINK 
                           0035BC     2 	LINK=.
      0035BC                          3 DEC:
      00AE71 81                       4 	.byte 3   	
      00AE72 44 45 43                 5 	.ascii "DEC"
      00AE72 4F CE                    6 	.word dec_base  
      0035C2                       5165 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AE74 00 13                    1 	.word LINK 
                           0035C4     2 	LINK=.
      0035C4                          3 DDR:
      00AE76 27                       4 	.byte 3+F_IFUNC   	
      00AE77 02 5F 81                 5 	.ascii "DDR"
      00AE7A 43 53                    6 	.word const_ddr  
      0035CA                       5166 	_dict_entry,4,DATA,data  
      00AE7C 81 C4                    1 	.word LINK 
                           0035CC     2 	LINK=.
      00AE7D                          3 DATA:
      00AE7D CD                       4 	.byte 4   	
      00AE7E 9A 37 A1 01              5 	.ascii "DATA"
      00AE82 27 03                    6 	.word data  
      0035D3                       5167 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00AE84 CC 97                    1 	.word LINK 
                           0035D5     2 	LINK=.
      0035D5                          3 CR2:
      00AE86 08                       4 	.byte 3+F_IFUNC   	
      00AE87 90 F6 93                 5 	.ascii "CR2"
      00AE8A EE 01                    6 	.word const_cr2  
      0035DB                       5168 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AE8C 72 A9                    1 	.word LINK 
                           0035DD     2 	LINK=.
      0035DD                          3 CR1:
      00AE8E 00                       4 	.byte 3+F_IFUNC   	
      00AE8F 03 4B 00                 5 	.ascii "CR1"
      00AE92 35 CC                    6 	.word const_cr1  
      0035E3                       5169 	_dict_entry,5,CONST,cmd_const 
      00AE94 50 E0                    1 	.word LINK 
                           0035E5     2 	LINK=.
      0035E5                          3 CONST:
      00AE96 9E                       4 	.byte 5   	
      00AE97 A4 3F 95 A3 00           5 	.ascii "CONST"
      00AE9C FF 23                    6 	.word cmd_const  
      0035ED                       5170 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AE9E 06 0C                    1 	.word LINK 
                           0035EF     2 	LINK=.
      0035EF                          3 CHAR:
      00AEA0 01                       4 	.byte 4+F_CFUNC   	
      00AEA1 98 56 20 F5              5 	.ascii "CHAR"
      00AEA5 35 55                    6 	.word func_char  
      0035F6                       5171 	_dict_entry,5,CHAIN,cmd_chain
      00AEA7 50 E0                    1 	.word LINK 
                           0035F8     2 	LINK=.
      0035F8                          3 CHAIN:
      00AEA9 84                       4 	.byte 5   	
      00AEAA C7 50 E1 9F 4A           5 	.ascii "CHAIN"
      00AEAF 35 55                    6 	.word cmd_chain  
      003600                       5172 	_dict_entry,3,BYE,bye 
      00AEB1 50 E0                    1 	.word LINK 
                           003602     2 	LINK=.
      003602                          3 BYE:
      00AEB3 C7                       4 	.byte 3   	
      00AEB4 50 E2 35                 5 	.ascii "BYE"
      00AEB7 AA 50                    6 	.word bye  
      003608                       5173 	_dict_entry,5,BTOGL,bit_toggle
      00AEB9 E0 81                    1 	.word LINK 
                           00360A     2 	LINK=.
      00AEBB                          3 BTOGL:
      00AEBB 35                       4 	.byte 5   	
      00AEBC AA 50 E0 81 4C           5 	.ascii "BTOGL"
      00AEC0 21 8D                    6 	.word bit_toggle  
      003612                       5174 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AEC0 CD 9A                    1 	.word LINK 
                           003614     2 	LINK=.
      003614                          3 BTEST:
      00AEC2 32                       4 	.byte 5+F_IFUNC   	
      00AEC3 A1 01 27 03 CC           5 	.ascii "BTEST"
      00AEC8 97 08                    6 	.word bit_test  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



      00AECA                       5175 	_dict_entry,4,BSET,bit_set 
      00AECA 90 F6                    1 	.word LINK 
                           00361E     2 	LINK=.
      00361E                          3 BSET:
      00AECC 93                       4 	.byte 4   	
      00AECD EE 01 72 A9              5 	.ascii "BSET"
      00AED1 00 03                    6 	.word bit_set  
      003625                       5176 	_dict_entry,4,BRES,bit_reset
      00AED3 4D 26                    1 	.word LINK 
                           003627     2 	LINK=.
      003627                          3 BRES:
      00AED5 08                       4 	.byte 4   	
      00AED6 5D 26 05 A6              5 	.ascii "BRES"
      00AEDA 0A CC                    6 	.word bit_reset  
      00362E                       5177 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AEDC 97 0A                    1 	.word LINK 
                           003630     2 	LINK=.
      003630                          3 BIT:
      00AEDE 4B                       4 	.byte 3+F_IFUNC   	
      00AEDF 18 59 49                 5 	.ascii "BIT"
      00AEE2 25 04                    6 	.word bitmask  
      003636                       5178 	_dict_entry,3,AWU,awu 
      00AEE4 0A 01                    1 	.word LINK 
                           003638     2 	LINK=.
      003638                          3 AWU:
      00AEE6 26                       4 	.byte 3   	
      00AEE7 F8 5F 84                 5 	.ascii "AWU"
      00AEEA 4A 02                    6 	.word awu  
      00AEEC                       5179 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AEEC 81 38                    1 	.word LINK 
                           003640     2 	LINK=.
      00AEED                          3 AUTORUN:
      00AEED CD                       4 	.byte 7   	
      00AEEE 9A 32 A1 01 27 03 CC     5 	.ascii "AUTORUN"
      00AEF5 97 08                    6 	.word cmd_auto_run  
      00364A                       5180 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AEF7 90 F6                    1 	.word LINK 
                           00364C     2 	LINK=.
      00364C                          3 ASC:
      00AEF9 93                       4 	.byte 3+F_IFUNC   	
      00AEFA EE 01 72                 5 	.ascii "ASC"
      00AEFD A9 00                    6 	.word ascii  
      003652                       5181 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AEFF 03 9F                    1 	.word LINK 
                           003654     2 	LINK=.
      003654                          3 AND:
      00AF01 AE                       4 	.byte 3+F_AND   	
      00AF02 00 01 A4                 5 	.ascii "AND"
      00AF05 17 27                    6 	.word TK_AND  
      00365A                       5182 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AF07 0A 88                    1 	.word LINK 
                           00365C     2 	LINK=.
      00365C                          3 ALLOC:
      00AF09 4F                       4 	.byte 5   	
      00AF0A 41 4C 4C 4F 43           5 	.ascii "ALLOC"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00AF0A 58 49                    6 	.word xalloc  
      003664                       5183 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AF0C 0A 01                    1 	.word LINK 
                           003666     2 	LINK=.
      003666                          3 ADCREAD:
      00AF0E 26                       4 	.byte 7+F_IFUNC   	
      00AF0F FA 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00AF10 26 81                    6 	.word analog_read  
      003670                       5184 	_dict_entry,5,ADCON,power_adc 
      00AF10 5B 01                    1 	.word LINK 
                           003672     2 	LINK=.
      003672                          3 ADCON:
      00AF12 81                       4 	.byte 5   	
      00AF13 41 44 43 4F 4E           5 	.ascii "ADCON"
      00AF13 85 52                    6 	.word power_adc  
      00367A                       5185 kword_dict::
      00367A                       5186 	_dict_entry,3+F_IFUNC,ABS,abs
      00AF15 04 89                    1 	.word LINK 
                           00367C     2 	LINK=.
      00367C                          3 ABS:
      00AF17 CE                       4 	.byte 3+F_IFUNC   	
      00AF18 00 05 1F                 5 	.ascii "ABS"
      00AF1B 03 CE                    6 	.word abs  
                                   5187 
                                   5188 
                                   5189 
                                   5190 
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
      003682                         30 test:
      003682                         31     _vars VSIZE 
      00AF1D 00 01            [ 2]    1     sub sp,#VSIZE 
      00AF1F 1F 05 72         [ 2]   32     ldw x,#LOOP_CNT
      00AF22 5C 00            [ 2]   33     ldw (CNTR,sp),x  
      00AF24 20 81 0F         [ 2]   34     ldw x,ticks 
      00AF26 1F 01            [ 2]   35     ldw (T,sp),x
      00368E                         36 1$: ; test add24 
      00AF26 72 5D            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AF28 00 20 26         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AF2B 03 CC 97         [ 1]   39     ld acc24,a 
      00AF2E 08 00 0D         [ 2]   40     ldw acc24+1,x  
      00AF2F A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AF2F CD 9C 94         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AF32 90 F6 93         [ 4]   43     call add24 
      00AF35 EE 01            [ 2]   44     ldw x,(CNTR,sp)
      00AF37 72 A9 00         [ 2]   45     subw x,#1
      00AF3A 03 4D            [ 2]   46     ldw (CNTR,sp),x 
      00AF3C 26 13            [ 1]   47     jrne 1$
      00AF3E 5D 26 10         [ 4]   48     call prt_acc24
      00AF41 1E 03            [ 1]   49     ld a,#SPACE 
      00AF43 CF 00 05         [ 4]   50     call putc 
      00AF46 E6 02 C7         [ 2]   51     ldw x,ticks 
      00AF49 00 03 1E         [ 2]   52     subw x,(T,sp)
      00AF4C 05 CF 00         [ 4]   53     call prt_i16  
      00AF4F 01 81            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]



      00AF51 CD 08 FF         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AF51 85 5B 04         [ 2]   58     ldw x,LOOP_CNT
      00AF54 72 5A            [ 2]   59     ldw (CNTR,sp),x 
      00AF56 00 20 FC         [ 2]   60     ldw x,ticks 
      00AF59 1F 01            [ 2]   61     ldw (T,sp),x 
      0036CA                         62 2$: 
      00AF59 AE 50            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AF5B 00 4F 81         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AF5E C7 00 0C         [ 1]   65     ld acc24,a 
      00AF5E AE 50 05         [ 2]   66     ldw acc24+1,x  
      00AF61 4F 81            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AF63 AE 00 2A         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AF63 AE 50 0A         [ 4]   69     call mul24 
      00AF66 4F 81            [ 2]   70     ldw x,(CNTR,sp)
      00AF68 1D 00 01         [ 2]   71     subw x,#1
      00AF68 AE 50            [ 2]   72     ldw (CNTR,sp),x 
      00AF6A 0F 4F            [ 1]   73     jrne 2$ 
      00AF6C 81 18 4E         [ 4]   74    call prt_acc24 
      00AF6D A6 20            [ 1]   75    ld a,#SPACE 
      00AF6D AE 50 14         [ 4]   76    call putc 
      00AF70 4F 81 0F         [ 2]   77     ldw x,ticks 
      00AF72 72 F0 01         [ 2]   78     subw x,(T,sp)
      00AF72 AE 50 19         [ 4]   79     call prt_i16 
      00AF75 4F 81            [ 1]   80     ld a,#CR 
      00AF77 CD 08 FF         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AF77 AE 50 1E         [ 2]   83     ldw x,LOOP_CNT
      00AF7A 4F 81            [ 2]   84     ldw (CNTR,sp),x 
      00AF7C CE 00 0F         [ 2]   85     ldw x,ticks 
      00AF7C AE 50            [ 2]   86     ldw (T,sp),x 
      003706                         87 3$: 
      00AF7E 28 4F            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AF80 81 FF FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AF81 C7 00 0C         [ 1]   90     ld acc24,a 
      00AF81 4F AE 00         [ 2]   91     ldw acc24+1,x  
      00AF84 00 81            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AF86 AE 05 FF         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AF86 4F AE 00         [ 4]   94     call mul24 
      00AF89 01 81            [ 2]   95     ldw x,(CNTR,sp)
      00AF8B 1D 00 01         [ 2]   96     subw x,#1
      00AF8B 4F AE            [ 2]   97     ldw (CNTR,sp),x 
      00AF8D 00 02            [ 1]   98     jrne 3$ 
      00AF8F 81 18 4E         [ 4]   99     call prt_acc24    
      00AF90 A6 20            [ 1]  100     ld a,#SPACE 
      00AF90 4F AE 00         [ 4]  101     call putc 
      00AF93 03 81 0F         [ 2]  102     ldw x,ticks 
      00AF95 72 F0 01         [ 2]  103     subw x,(T,sp)
      00AF95 4F AE 00         [ 4]  104     call prt_i16 
      00AF98 04 81            [ 1]  105     ld a,#CR 
      00AF9A CD 08 FF         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AF9A 4F AE 00         [ 2]  108     ldw x,LOOP_CNT
      00AF9D 01 81            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]



      00AF9F CE 00 0F         [ 2]  110     ldw x,ticks 
      00AF9F 4F AE            [ 2]  111     ldw (T,sp),x 
      003742                        112 4$:
      00AFA1 00 00            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AFA3 81 FF FF         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AFA4 C7 00 0C         [ 1]  115     ld acc24,a 
      00AFA4 4F AE 40         [ 2]  116     ldw acc24+1,x  
      00AFA7 00 81            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AFA9 AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AFA9 55 00 03         [ 4]  119     call mul24 
      00AFAC 00 02            [ 2]  120     ldw x,(CNTR,sp)
      00AFAE 81 00 01         [ 2]  121     subw x,#1
      00AFAF 1F 03            [ 2]  122     ldw (CNTR,sp),x 
      00AFAF 89 E6            [ 1]  123     jrne 4$ 
      00AFB1 03 A1 80         [ 4]  124     call prt_acc24 
      00AFB4 26 05            [ 1]  125     ld a,#SPACE 
      00AFB6 EE 04 A3         [ 4]  126     call putc 
      00AFB9 AF A9 85         [ 2]  127     ldw x,ticks 
      00AFBC 81 F0 01         [ 2]  128     subw x,(T,sp)
      00AFBD CD 18 37         [ 4]  129     call prt_i16 
      00AFBD 5F CF            [ 1]  130     ld a,#CR 
      00AFBF 00 07 CF         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AFC2 00 09 CE         [ 2]  133     ldw x,LOOP_CNT
      00AFC5 00 1C            [ 2]  134     ldw (CNTR,sp),x 
      00AFC7 CD 98 6F         [ 2]  135     ldw x,ticks 
      00AFCA A1 84            [ 2]  136     ldw (T,sp),x 
      00377E                        137 5$: 
      00AFCC 26 10            [ 1]  138     ld a,#0xff
      00AFCE CD 98 A1         [ 2]  139     ldw x,#0xffff
      00AFD1 90 89 4F         [ 4]  140     call abs24 
      00AFD4 CD 8C C5         [ 1]  141     ld acc24,a 
      00AFD7 90 85 5D         [ 2]  142     ldw acc24+1,x
      00AFDA 26 17            [ 2]  143     ldw x,(CNTR,sp)
      00AFDC 20 44 01         [ 2]  144     subw x,#1
      00AFDE 1F 03            [ 2]  145     ldw (CNTR,sp),x 
      00AFDE 55 00            [ 1]  146     jrne 5$ 
      00AFE0 04 00 02         [ 4]  147     call prt_acc24 
      00AFE3 C3 00            [ 1]  148     ld a,#SPACE 
      00AFE5 1E 24 3A         [ 4]  149     call putc 
      00AFE8 CE 00 0F         [ 2]  150     ldw x,ticks 
      00AFE8 CD AF AF         [ 2]  151     subw x,(T,sp)
      00AFEB 26 00 CD         [ 4]  152     call prt_i16 
      0037A6                        153 6$:
      00AFEE B0 00            [ 1]  154     ld a,#CR 
      00AFF0 26 FB 81         [ 4]  155     call putc 
      00AFF3 CD 37 F1         [ 4]  156     call read_integer 
      00AFF3 CF 00 07 E6 02   [ 1]  157     mov farptr,acc24 
      00AFF8 C7 00 0A 35 06   [ 1]  158     mov farptr+1,acc16 
      00AFFD 00 09 81 00 1A   [ 1]  159     mov farptr+2,acc8 
      00B000 CD 37 F1         [ 4]  160     call read_integer 
      00B000 E6 02 C7         [ 1]  161     ld a,acc24 
      00B003 00 0F 72         [ 2]  162     ldw x,acc16 
      00B006 5F 00 0E 72 BB   [ 1]  163     mov acc24,farptr 
      00B00B 00 0E C3 00 1E   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]



      00B010 25 02 20 0E 0E   [ 1]  165     mov acc8,farptr+2 
      00B014 CD 03 07         [ 4]  166     call div24 
      00B014 CD               [ 1]  167     push a 
      00B015 AF               [ 2]  168     pushw x 
      00B016 AF 27 04         [ 4]  169     call prt_acc24 
      00B019 A6 01            [ 1]  170     ld a,#SPACE 
      00B01B 20 04 CD         [ 4]  171     call putc 
      00B01E AF               [ 2]  172     popw x
      00B01F F3 4F 81         [ 2]  173     ldw acc16,x  
      00B022 32 00 0C         [ 1]  174     pop acc24 
      00B022 A6 0C CC         [ 4]  175     call prt_acc24
      00B025 97 0A            [ 2]  176     jra 6$
      00B027                        177     _drop VSIZE 
      00B027 52 07            [ 2]    1     addw sp,#VSIZE 
      00B029 CD               [ 4]  178     ret 
                                    179 
                                    180 
      0037F1                        181 read_integer:
      00B02A A0 C6            [ 1]  182     ld a,#'? 
      00B02C CD 08 FF         [ 4]  183     call putc  
      00B02C C6 00 09 C1      [ 1]  184 	clr count  
      00B030 00 0A 27         [ 4]  185 	call readln 
      00B033 37 16 90         [ 2]  186 	ldw x,#tib 
      00B034 3B 00 02         [ 1]  187 	push count
      00B034 CE 00            [ 1]  188 	push #0 
      00B036 07 CF 00         [ 2]  189 	addw x,(1,sp)
      00B039 05               [ 1]  190 	incw x 
      003809                        191 	_drop 2 
      00B03A 55 00            [ 2]    1     addw sp,#2 
      00B03C 09 00 02 55      [ 1]  192 	clr in 
      00B040 00 0A 00         [ 4]  193 	call get_token
      00B043 03 CD            [ 1]  194 	cp a,#TK_INTGR
      00B045 9B 7B            [ 1]  195 	jreq 3$ 
      00B047 A1 84            [ 1]  196 	cp a,#TK_MINUS
      00B049 27 03 CC         [ 4]  197 	call get_token 
      00B04C 97 08            [ 1]  198 	cp a,#TK_INTGR 
      00B04E 27 03            [ 1]  199 	jreq 2$
      00B04E CD 98 6F         [ 2]  200 	jp syntax_error
      003822                        201 2$:
      00B051 CE 00 05         [ 4]  202 	call neg_acc24  	
      003825                        203 3$: 
      00B054 CF               [ 4]  204     ret 
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
      00B055 00 07                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B057 55 00                   32 app_size: .word 0 
      003884                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00367C R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003672 R
    ADCON_ID=  000002     |   4 ADCREAD    003666 R   |     ADCREAD_=  000004 
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
  4 ALLOC      00365C R   |   4 AND        003654 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 AR_SIGN    0031E0 R   |   4 ASC        00364C R   |     ASC_IDX =  000006 
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTORUN    003640 R
  4 AUTO_RUN   00015C R   |   4 AWU        003638 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        003630 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003627 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       00361E R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      003614 R
    BTEST_ID=  000010     |   4 BTOGL      00360A R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        003602 R   |     BYE_IDX =  000014 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAIN      0035F8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    CHAIN_AD=  000005     |     CHAIN_BP=  000007     |     CHAIN_CN=  000008 
    CHAIN_CO=  00000A     |     CHAIN_IN=  000009     |     CHAIN_LN=  000003 
    CHAIN_TX=  00000B     |     CHAIN_TX=  00000D     |   4 CHAR       0035EF R
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
    COMMA   =  00002C     |   4 CONST      0035E5 R   |     CONST_ID=  0000B6 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CR1        0035DD R
    CR1_IDX =  00001A     |   4 CR2        0035D5 R   |     CR2_IDX =  000018 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0035CC R
    DATA_IDX=  00001C     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        0035C4 R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        0035BC R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        0035B4 R   |   4 DIR        0035AC R   |     DISCARD =  000004 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         0035A5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      00359B R   |     DREAD_ID=  000024     |   4 DROP       003592 R
  4 DWRITE     003587 R   |     DWRITE_I=  000026     |   4 EDIT       00357E R
    EDIT_IDX=  000028     |   4 EEFREE     003573 R   |     EEFREE_I=  0000B8 
  4 EEPROM     003568 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        003560 R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      003556 R
  4 ERASED     002983 R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_NO_P=  000012     |     ERR_OVER=  000010 
    ERR_RD_O=  000011     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   4 FCPU       00354D R   |     FCPU_IDX=  000030 
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
    FLASH_IA=  000000     |   4 FLASH_ME   001EB2 R   |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   4 FOR        003545 R
    FOR_IDX =  000034     |   4 FREE       00353C R   |     FREE_IDX=  000088 
    FRUN    =  000000     |     FS      =  00001C     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_AND   =  000080 
    F_CFUNC =  000020     |     F_CMD   =  000000     |     F_CONST =  000030 
    F_IFUNC =  000010     |     F_NOT   =  000070     |     F_OR    =  000090 
    F_XOR   =  0000A0     |   4 GET        003534 R   |     GET_IDX =  0000B4 
  4 GOSUB      00352A R   |     GOSUB_ID=  000036     |   4 GOTO       003521 R
    GOTO_IDX=  000038     |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        003519 R   |     HEX_IDX =  00003A     |     HOME    =  000082 
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
    I2C_WRIT=  000000     |   4 IDR        003511 R   |     IDR_IDX =  00003C 
  4 IF         00350A R   |     IF_IDX  =  00003E     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   4 INPUT      003500 R
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
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     0034F5 R
    IWDGEN_I=  000042     |   4 IWDGREF    0034E9 R   |     IWDGREF_=  000044 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        0034E1 R   |     KEY_END =  000083 
    KEY_IDX =  000046     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        0034D9 R
    LET_IDX =  000048     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   4 LINK    =  00367C R   |   4 LIST       0034D0 R
    LIST_IDX=  00004A     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       0034C7 R
    LOG_IDX =  00004C     |     LOOP_CNT=  002710     |   4 LSHIFT     0034BC R
    LSHIFT_I=  00004E     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000005     |     NAFR    =  004804     |     NAK     =  000015 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

    NAMEPTR =  000001     |     NAME_MAX=  00000F     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        0034B4 R   |     NEW_IDX =  000052 
  4 NEXT       0034AB R   |     NEXT_IDX=  000050     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NLEN_MAS=  00000F 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        0034A3 R
    NOT_IDX =  0000F8     |     NOT_OP  =  000001     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        00349B R   |     ODR_IDX =  000054     |   4 ON         003494 R
    ONOFF   =  000003     |     ON_IDX  =  0000B2     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         00348D R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        003485 R   |     PAD_IDX =  000056 
    PAD_SIZE=  000080     |   4 PAUSE      00347B R   |     PAUSE_ID=  000058 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       003472 R   |     PEEK_IDX=  00005C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PG_SIZE =  000001 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   4 PICK       003469 R
    PINNO   =  000001     |   4 PINP       003460 R   |     PINP_IDX=  00005E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      003456 R   |     PMODE_ID=  00005A 
    PNAME   =  000003     |   4 POKE       00344D R   |     POKE_IDX=  000060 
  4 POP        003445 R   |   4 PORTA      003428 R   |   4 PORTB      00341E R
  4 PORTC      003414 R   |   4 PORTD      00340A R   |   4 PORTE      003400 R
  4 PORTF      0033F6 R   |   4 PORTG      0033EC R   |   4 PORTI      0033E2 R
  4 POUT       00343C R   |     POUT_IDX=  000062     |     PREV    =  000001 
    PRG_SIZE=  000003     |   4 PRINT      003432 R   |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001E88 R   |   4 PROG_SIZ   001E9A R
    PRTA_IDX=  000066     |     PRTB_IDX=  000068     |     PRTC_IDX=  00006A 
    PRTD_IDX=  00006C     |     PRTE_IDX=  00006E     |     PRTF_IDX=  000070 
    PRTG_IDX=  000072     |     PRTI_IDX=  000074     |     PRT_IDX =  000064 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    PSIZE   =  00000B     |     PSTR    =  000003     |   4 PUSH       0033D9 R
  4 PUT        0033D1 R   |   4 QKEY       0033C8 R   |     QKEY_IDX=  000076 
    QSIGN   =  000005     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
  4 RAM_MEM    001EC3 R   |     RAM_SIZE=  001800     |     RBT_IDX =  00007A 
  4 READ       0033BF R   |     READ_IDX=  000078     |   4 REBOOT     0033B4 R
    RECLEN  =  000005     |     REC_LEN =  000003     |     REC_XTRA=  000005 
  4 REG_A      0004DA R   |   4 REG_CC     0004DE R   |   4 REG_PC     0004CE R
  4 REG_SP     0004E3 R   |   4 REG_X      0004D6 R   |   4 REG_Y      0004D2 R
    RELOP   =  000001     |   4 REM        0033AC R   |     REM_IDX =  00007C 
  4 RESTORE    0033A0 R   |     REST_IDX=  00007E     |     RETL1   =  000001 
  4 RETURN     003395 R   |     RET_ADDR=  000001     |     RET_BPTR=  000003 
    RET_IDX =  000080     |     RET_INW =  000005     |   4 RND        00338D R
    RND_IDX =  000082     |     RONLY   =  000005     |     ROP     =  004800 
    RS      =  00001E     |   4 RSHIFT     003382 R   |     RSHIFT_I=  000084 
    RSIGN   =  000006     |     RST_SR  =  0050B3     |   4 RUN        00337A R
    RUN_IDX =  000086     |     RXCHAR  =  000001     |     RX_QUEUE=  000008 
    R_A     =  000001     |     R_CC    =  000009     |     R_PC    =  00000A 
    R_X     =  000002     |     R_Y     =  000004     |   4 SAVE       003371 R
    SAVE_IDX=  000032     |     SAV_ACC1=  000006     |     SAV_ACC2=  000008 
    SAV_COUN=  00000A     |     SAV_IN  =  000009     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002981 R
  4 SIZE       003368 R   |     SIZE_IDX=  0000B0     |     SKIP    =  000005 
  4 SLEEP      00335E R   |     SLEEP_ID=  00008A     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003354 R
    SPIEN_ID=  00008E     |   4 SPIRD      00334A R   |     SPIRD_ID=  00008C 
  4 SPISEL     00333F R   |     SPISEL_I=  000090     |   4 SPIWR      003335 R
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
  4 STATES     000491 R   |   4 STEP       00332C R   |     STEP_IDX=  000094 
  4 STOP       003323 R   |     STOP_IDX=  000096     |     STR     =  000003 
  4 STR_BYTE   001EAB R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
  4 SysCall    000012 R   |     T       =  000001     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      003319 R   |     TICKS_ID=  000098     |     TIM1_ARR=  005262 
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
  4 TIMEOUT    00330D R   |   4 TIMER      003303 R   |     TIMER_ID=  00009A 
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
    TMROUT_I=  00009C     |   4 TO         0032FC R   |   4 TONE       0032F3 R
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
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     0032E8 R
    UBOUND_I=  0000A2     |   4 UBTN_Han   00005A R   |   4 UFLASH     0032DD R
    UFLASH_I=  0000A4     |   4 UNTIL      0032D3 R   |     UNTIL_ID=  0000A6 
    US      =  00001F     |   4 USER_ABO   000062 R   |   4 USR        0032CB R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000A8     |   4 Uart1RxH   00087C R   |   4 UserButt   000036 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VAR_NAME=  000001 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       0032C2 R
    WAIT_IDX=  0000AA     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
    WLKPTR  =  000001     |   4 WORDS      0032B8 R   |     WORDS_ID=  0000AC 
  4 WRITE      0032AE R   |     WRITE_ID=  0000AE     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        0032A6 R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  000014     |     XTEMP   =  000001     |     YSAVE   =  000007 
    YTEMP   =  000005     |   4 abs        002BC9 R   |   4 abs24      0001F3 R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BC7 R   |   4 add24      00017E R
  4 add_char   001332 R   |   4 add_spac   00112A R   |   4 analog_r   002681 R
  4 and_cond   001BC2 R   |   4 and_fact   001B92 R   |   4 app        003884 R
  4 app_sign   003880 R   |   4 app_size   003882 R   |   4 app_spac   003880 GR
  4 arduino_   002CB6 R   |   4 arg_list   0019B7 R   |   5 array_si   000020 R
  4 ascii      002A74 R   |   4 at_tst     000F9C R   |   4 atoi24     0018D9 GR
  4 atoi_exi   001948 R   |   4 awu        002B70 R   |   4 awu02      002B83 R
  4 bad_port   002AEF R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       0025F8 R   |   4 beep_1kh   0025CB GR  |   4 bin_exit   000E03 R
  4 bit_rese   00216A R   |   4 bit_set    002148 R   |   4 bit_test   0021AF R
  4 bit_togg   00218D R   |   4 bitmask    002E6D R   |   4 bkslsh_t   000F49 R
  4 bksp       000966 R   |   2 block_bu   0016E0 GR  |   4 block_er   000765 R
  4 break_po   00276D R   |   4 bye        002B3C R   |   5 chain_le   000034 R
  4 clear_au   0008B3 R   |   4 clear_ba   00149E R   |   4 clear_bl   002884 R
  4 clear_va   0013F6 R   |   4 clock_in   00007D R   |   4 cmd_auto   00318C R
  4 cmd_chai   00321C R   |   4 cmd_cons   001D97 R   |   4 cmd_dim    001DAB R
  4 cmd_dim1   001DB5 R   |   4 cmd_dim2   001DBB R   |   4 cmd_dir    0029A8 R
  4 cmd_edit   001F5B R   |   4 cmd_end    002572 R   |   4 cmd_eras   0027EA R
  4 cmd_get    00259E R   |   4 cmd_itf    0004FE R   |   4 cmd_line   001717 R
  4 cmd_name   001352 R   |   4 cmd_on     0023E4 R   |   4 cmd_run    0024E2 R
  4 cmd_save   0028E6 R   |   4 cmd_size   001C9B R   |   4 cold_sta   0000B5 R
  4 colon_ts   000F70 R   |   4 comma_ts   000F7B R   |   4 comp_msg   001667 R
  4 compile    001096 GR  |   4 conditio   001C14 R   |   4 const_cr   002F10 R
  4 const_cr   002F15 R   |   4 const_dd   002F0B R   |   4 const_ee   002F24 R
  4 const_id   002F06 R   |   4 const_in   002F1F R   |   4 const_od   002F01 R
  4 const_ou   002F1A R   |   4 const_po   002ED9 R   |   4 const_po   002EDE R
  4 const_po   002EE3 R   |   4 const_po   002EE8 R   |   4 const_po   002EED R
  4 const_po   002EF2 R   |   4 const_po   002EF7 R   |   4 const_po   002EFC R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Symbol Table

  4 convert_   000D73 R   |   4 convert_   00092A R   |   4 copy_com   000FD1 R
  5 count      000002 GR  |   4 cp24       0001B8 R   |   4 cp24_ax    0001EA R
  4 cp_loop    001968 R   |   4 cpl24      0001FA R   |   4 cpy_cmd_   001112 R
  4 cpy_quot   001152 R   |   4 create_g   000C9D R   |   4 cs_high    0030A6 R
  4 dash_tst   000F91 R   |   4 data       002F29 R   |   4 data_err   002FA2 R
  5 data_len   000009 R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 dec_base   001C8D R   |   4 decomp_l   0011EA R   |   4 decompil   0011A2 GR
  4 del_line   000C70 R   |   4 delete_l   000A53 R   |   4 delete_n   000976 R
  4 delete_u   000A18 R   |   4 digital_   0026BD R   |   4 digital_   0026F4 R
  4 div24      000307 R   |   4 divu24_8   0002E9 R   |   4 do_loop    002E93 R
  4 do_progr   000758 R   |   4 dup24      00016F R   |   5 dvar_bgn   000030 GR
  5 dvar_end   000032 GR  |   4 enable_i   002DFD R   |   4 eql_tst    00101C R
  4 equal      001345 R   |   4 eras0      0027F4 R   |   4 erase_ex   000789 R
  4 erase_fl   00077F R   |   4 erase_he   0028CC R   |   4 erase_pr   002795 R
  4 err_bad_   001590 R   |   4 err_buf_   001606 R   |   4 err_cmd_   001554 R
  4 err_div0   001519 R   |   4 err_dupl   00156E R   |   4 err_math   001500 R
  4 err_mem_   0014E5 R   |   4 err_msg    0014BF R   |   4 err_no_a   00159C R
  4 err_no_d   0015CF R   |   4 err_no_f   0015F3 R   |   4 err_no_l   001528 R
  4 err_no_p   0015DF R   |   4 err_not_   00157F R   |   4 err_not_   001639 R
  4 err_over   001613 R   |   4 err_read   00161D R   |   4 err_run_   00153E R
  4 err_synt   0014F2 R   |   4 escaped    000D88 GR  |   4 expect     0019A5 R
  4 expressi   001AFB R   |   4 factor     001A03 R   |   5 farptr     000018 R
  4 fcpu       002C38 R   |   4 fetchc     000605 R   |   4 fill_wri   002874 R
  4 final_te   000BC0 R   |   4 first_li   001F05 R   |   5 flags      000022 GR
  4 for        002245 R   |   4 free       001C92 R   |   5 free_eep   000024 R
  7 free_ram   000090 R   |   4 func_arg   0019B2 R   |   4 func_cha   002A5D R
  4 func_eef   001D27 R   |   4 ge         001347 R   |   4 get_addr   001817 R
  4 get_arra   0019D3 R   |   4 get_char   001831 R   |   4 get_esca   000936 R
  4 get_int2   001821 R   |   4 get_targ   002372 R   |   4 get_targ   002380 R
  4 get_tick   002BC2 R   |   4 get_toke   000EE2 GR  |   4 get_valu   001D16 R
  4 getc       00090F GR  |   4 gosub      002490 R   |   4 gosub_1    00249B R
  4 gosub_2    0024A1 R   |   4 goto       002476 R   |   4 goto_1     002480 R
  4 gpio       002AC4 R   |   4 gt         001343 R   |   4 gt_tst     001027 R
  4 hex_base   001C88 R   |   4 hex_dump   000645 R   |   4 if         002228 R
  5 in         000001 GR  |   5 in.saved   000003 GR  |   5 in.w       000000 GR
  4 incr_far   000860 R   |   4 input_ex   002100 R   |   4 input_lo   00206A R
  4 input_va   002066 R   |   4 insert_c   0009D5 R   |   4 insert_l   000CC9 R
  4 insert_l   000D38 R   |   4 interp_l   00175B R   |   4 interpre   001733 R
  4 invalid    00056D R   |   4 invalid_   0005DB R   |   4 is_alnum   000E36 GR
  4 is_alpha   000E1C GR  |   4 is_data_   002F2F R   |   4 is_digit   000E2D GR
  4 is_erase   002985 R   |   4 is_progr   0024D1 R   |   4 is_symbo   000E3F R
  4 itoa       001874 GR  |   4 itoa_loo   001896 R   |   4 jp_to_ta   002483 R
  4 key        002AB3 R   |   4 kword_di   00367A GR  |   4 kword_en   0032A4 R
  4 le         00134C R   |   4 ledoff     0003CD R   |   4 ledon      0003C8 R
  4 ledtoggl   0003D2 R   |   4 left_par   0003DB R   |   4 let        001CD3 GR
  4 let_arra   001CE1 R   |   4 let_dvar   001794 R   |   4 let_eval   001CE9 R
  4 let_var    001CE6 R   |   4 lines_sk   001F08 R   |   4 list       001ED2 R
  4 list_exi   001F4A R   |   4 list_loo   001F28 R   |   4 log2       002E40 R
  4 look_tar   0023A3 R   |   4 loop_bac   002355 R   |   5 loop_dep   00001F R
  4 loop_don   00236A R   |   4 lshift     002BE0 R   |   4 lt         00134A R
  4 lt_tst     001050 R   |   4 mem_peek   000589 R   |   4 mod24      0003A1 R
  4 move       0013B2 GR  |   4 move_dow   0013D1 R   |   4 move_era   0006E7 R
  4 move_exi   0013F2 R   |   4 move_lef   0009AD R   |   4 move_loo   0013D6 R
  4 move_prg   000727 R   |   4 move_rig   0009BB R   |   4 move_up    0013C3 R
  4 mul24      000279 R   |   4 mul_char   001334 R   |   4 mulu24_8   00023A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 251.
Hexadecimal [24-Bits]

Symbol Table

  4 nbr_tst    000F15 R   |   4 ne         00134F R   |   4 neg24      000203 R
  4 neg_acc2   00021D R   |   4 neg_ax     000215 R   |   4 new        00278B R
  4 next       0022FD R   |   4 next_lin   00173B R   |   4 next_tok   0017EF GR
  4 no_match   00197A R   |   4 number     00060B R   |   4 other      001079 R
  4 overwrit   000BEC R   |   2 pad        0016E0 GR  |   4 pad_ref    0030AB R
  4 parse_ad   0004E8 R   |   4 parse_bi   000DE1 R   |   4 parse_in   000D90 R
  4 parse_ke   000E62 R   |   4 parse_qu   000D3B R   |   4 parse_sy   000E4A R
  4 pause      002B50 R   |   4 pause02    002B63 R   |   4 peek       002207 R
  4 peek_byt   0005A5 R   |   4 pin_mode   002C47 R   |   4 plus_tst   000FF0 R
  4 poke       0021E6 R   |   4 power_ad   002631 R   |   4 prcnt_ts   001011 R
  4 print      001FBD R   |   4 print_fa   0005EA R   |   4 print_he   000C23 GR
  4 print_re   000427 R   |   4 print_st   00057D R   |   4 print_to   00185C R
  4 prog_siz   001E41 R   |   4 program_   001E49 R   |   4 program_   000701 R
  4 program_   000727 R   |   4 prt_acc2   00184E R   |   4 prt_basi   001F99 R
  4 prt_i16    001837 R   |   4 prt_loop   001FC1 R   |   4 prt_peek   0003AA GR
  4 prt_reg1   000408 R   |   4 prt_reg8   0003E6 R   |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       0008FF GR  |   4 puts       00095C GR
  4 qgetc      000908 GR  |   4 qkey       002AB7 GR  |   4 qmark_ts   000FA7 R
  4 qsign      002869 R   |   4 random     002CD6 R   |   4 read       002FA7 R
  4 read01     002FAC R   |   4 read_int   0037F1 R   |   4 readln     000A61 GR
  4 readln_l   000A70 R   |   4 readln_q   000C09 R   |   4 refresh_   002E3B R
  4 relation   001B33 R   |   4 relop_st   001337 R   |   4 remark     002105 GR
  4 repl       000527 R   |   4 repl_exi   00054F R   |   4 reset_co   001FBF R
  4 rest_con   002056 R   |   4 restore    002F3D R   |   4 return     0024B4 R
  4 right_al   001140 GR  |   4 row_alig   000845 R   |   4 row_eras   0006BA R
  4 row_eras   0006E7 R   |   4 row_loop   000628 R   |   4 rparnt_t   000F65 R
  4 rshift     002C0C R   |   7 rsign      00008C R   |   7 rsize      00008E R
  4 rt_msg     001655 R   |   4 run_app    00012A R   |   4 run_it     00253F R
  4 run_it_0   002541 R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_con   002046 R   |   4 scan_blo   00086E R
  4 search_d   00195A GR  |   4 search_e   0019A2 R   |   4 search_f   002898 R
  4 search_l   000C45 GR  |   4 search_l   000C54 R   |   4 search_n   001D50 R
  4 search_n   00195E R   |   4 search_p   0031E2 R   |   5 seedx      000014 R
  5 seedy      000016 R   |   4 select_p   002CA6 R   |   4 send_esc   000984 R
  4 send_par   00098F R   |   4 set_data   002F73 R   |   4 set_time   002DDB R
  4 sharp_ts   000F86 R   |   4 show_row   000616 R   |   4 single_c   00132D R
  4 skip       000ECF R   |   4 skip_str   001808 R   |   4 skip_to_   002990 R
  4 slash_ts   001006 R   |   4 sleep      002B45 R   |   4 software   001405 R
  4 spaces     0009C9 GR  |   4 spi_clea   003040 R   |   4 spi_disa   003028 R
  4 spi_enab   002FF5 R   |   4 spi_rcv_   003062 R   |   4 spi_read   00308D R
  4 spi_sele   003094 R   |   4 spi_send   00304C R   |   4 spi_writ   00306D R
  2 stack_fu   00179C GR  |   2 stack_un   001828 R   |   4 star_tst   000FFB R
  4 step       0022BB R   |   4 stop       00273F R   |   4 store_lo   0022EA R
  4 str_matc   001987 R   |   4 str_tst    000F05 R   |   4 strcmp     001391 R
  4 strcpy     0013A2 GR  |   4 strlen     001386 GR  |   4 sub24      00019B R
  4 symb_loo   000E4B R   |   4 syntax_e   001688 GR  |   4 system_i   00144B R
  5 tab_widt   000023 GR  |   4 tb_error   00168A GR  |   4 term       001AB8 R
  4 term01     001AC0 R   |   4 term_exi   001AF8 R   |   4 test       003682 R
  4 test_p     000575 R   |   2 tib        001690 GR  |   4 tick_tst   000FBF R
  5 ticks      00000F R   |   4 timeout    002DF2 R   |   5 timer      000012 GR
  4 timer2_i   000093 R   |   4 timer4_i   0000A0 R   |   4 tk_id      001678 R
  4 to         002275 R   |   4 to_eepro   000750 R   |   4 to_flash   000755 R
  4 to_hex_c   000C3A GR  |   4 to_upper   0018CD GR  |   4 token_ch   00108F R
  4 token_ex   001093 R   |   4 tone       0025D6 R   |   4 try_next   002F80 R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   00090F GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 252.
Hexadecimal [24-Bits]

Symbol Table

  4 uart1_in   0008BA R   |   4 uart1_pu   0008FF GR  |   4 uart1_qg   000908 GR
  4 uart1_se   0008CA R   |   4 ubound     001CC8 R   |   4 uflash     002AF4 R
  4 unlock_e   000684 R   |   4 unlock_f   00069F R   |   4 until      002EA6 R
  4 user_int   000049 R   |   4 usr        002B16 R   |   4 var_name   001198 GR
  5 vars       000035 GR  |   4 wait       00210B R   |   4 warm_ini   00147C R
  4 warm_sta   001714 R   |   4 words      002D71 R   |   4 words_co   002DC5 R
  4 write      0029F4 R   |   4 write_bl   00080A GR  |   4 write_bu   000741 R
  4 write_by   00078B R   |   4 write_ee   0007C7 R   |   4 write_ex   000800 R
  4 write_fl   0007B1 R   |   4 write_nb   00082F R   |   4 xalloc     0030BE R
  4 xdrop      0030F4 R   |   4 xpick      003172 R   |   4 xpop       0030B4 R
  4 xpush      0030B0 R   |   4 xput       00313F R   |   4 xstack_b   003121 R
  2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

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

