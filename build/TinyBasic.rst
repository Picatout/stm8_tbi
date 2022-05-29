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
                           00003C    37         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
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
                                    169 ;---------------------------------------
                                    170 ;    xtack manipulation macros 
                                    171 ;    Y is used as xstack pointer  
                                    172 ;----------------------------------------
                                    173     ; pop in A:X from XSTACK 
                                    174     .macro _xpop 
                                    175     ld a,(y)
                                    176     ldw x,y 
                                    177     ldw x,(1,x)
                                    178     addw y,#CELL_SIZE 
                                    179     .endm 
                                    180 
                                    181     ; push A:X  to XSTACK 
                                    182     .macro _xpush 
                                    183     subw y,#CELL_SIZE
                                    184     ld (y),a 
                                    185     ldw (1,y),x 
                                    186     .endm 
                                    187 
                                    188     ; drop from XSTACK 
                                    189     .macro _xdrop 
                                    190     addw y,#CELL_SIZE 
                                    191     .endm 
                                    192 
                                    193     ; @T fetch top xstack 
                                    194     .macro _at_top
                                    195     ld a,(y)
                                    196     ldw x,y 
                                    197     ldw x,(1,x)
                                    198     .endm 
                                    199 
                                    200     ; @N  fetch next on xstack 
                                    201     .macro _at_next 
                                    202     ld a,(3,y)
                                    203     ldw x,y 
                                    204     ldw x,(4,x)
                                    205     .endm 
                                    206 
                                    207     ; !T put on top of xtack 
                                    208     .macro _store_top 
                                    209     ld (y),a 
                                    210     ldw (1,y),x     
                                    211     .endm 
                                    212 
                                    213     ; !N put next on xstack 
                                    214     .macro _store_next 
                                    215     ld (3,y),a 
                                    216     ldw (4,y),x 
                                    217     .endm 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
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
                           000074    83     PRTH_IDX=PRTG_IDX+2
                           000076    84     PRTI_IDX=PRTH_IDX+2
                           000078    85     QKEY_IDX=PRTI_IDX+2
                           00007A    86     READ_IDX=QKEY_IDX+2
                           00007C    87     RBT_IDX=READ_IDX+2  ; REBOOT
                           00007E    88 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           000080    89     REST_IDX=REM_IDX+2 ; RESTORE
                           000082    90     RET_IDX=REST_IDX+2  ; RETURN 
                           000084    91     RND_IDX=RET_IDX+2 ; RANDOM 
                           000086    92     RSHIFT_IDX=RND_IDX+2
                           000088    93     RUN_IDX=RSHIFT_IDX+2
                           00008A    94     FREE_IDX=RUN_IDX+2
                           00008C    95     SLEEP_IDX=FREE_IDX+2
                           00008E    96     SPIRD_IDX=SLEEP_IDX+2
                           000090    97     SPIEN_IDX=SPIRD_IDX+2
                           000092    98     SPISEL_IDX=SPIEN_IDX+2
                           000094    99     SPIWR_IDX=SPISEL_IDX+2
                           000096   100     STEP_IDX=SPIWR_IDX+2
                           000098   101     STOP_IDX=STEP_IDX+2
                           00009A   102     TICKS_IDX=STOP_IDX+2
                           00009C   103     TIMER_IDX=TICKS_IDX+2
                           00009E   104     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000A0   105     TO_IDX=TMROUT_IDX+2
                           0000A2   106     TONE_IDX=TO_IDX+2
                           0000A4   107     UBOUND_IDX=TONE_IDX+2
                           0000A6   108     UFLASH_IDX=UBOUND_IDX+2
                           0000A8   109     UNTIL_IDX=UFLASH_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000AA   110     USR_IDX=UNTIL_IDX+2
                           0000AC   111     WAIT_IDX=USR_IDX+2
                           0000AE   112     WORDS_IDX=WAIT_IDX+2
                           0000B0   113     WRITE_IDX=WORDS_IDX+2
                           0000B2   114     SIZE_IDX=WRITE_IDX+2 
                           0000B4   115     ON_IDX=SIZE_IDX+2 
                           0000B6   116     GET_IDX=ON_IDX+2
                           0000B8   117     CONST_IDX=GET_IDX+2
                           0000BA   118     EEFREE_IDX=CONST_IDX+2
                                    119      
                                    120     ; keep these 3 at end
                                    121     ; these have no entry in code_addr 
                           0000F8   122     NOT_IDX=248
                           0000FA   123     AND_IDX=250 
                           0000FC   124     OR_IDX=252 
                           0000FE   125     XOR_IDX=254    
                                    126 
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
      008050 82 00 89 4F             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      008092 72 12 00 23      [ 1]  119 	bset flags,#FTRAP 
      008096 CD 85 42         [ 4]  120 	call print_registers
      008099 CD 85 ED         [ 4]  121 	call cmd_itf
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
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
      0080E5 CD 8A 1E         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 AB         [ 2]  179 5$:	jp warm_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
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
      00818E CD 89 7C         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9D B2         [ 4]  280 	call func_eefree 
      0081A1 CD 9C E9         [ 4]  281 	call ubound 
      0081A4 CD 95 7B         [ 4]  282 	call clear_basic
      0081A7 CD A5 FC         [ 4]  283 	call beep_1khz  
      0081AA CD 95 28         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 37         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 AB         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 59         [ 4]  293 	call warm_init
      0081BC AE B6 04         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 02      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 1E         [ 4]  299 	call puts 
      0081CF CD 9E DA         [ 4]  300 	call program_info 
      0081D2 CC A5 A0         [ 2]  301 	jp run_it_02  
      0081D5 20 FE            [ 2]  302     jra .  
                                    303 
      0081D7 20 61 75 74 6F 20 72   304 AUTO_RUN: .asciz " auto run program\n"
             75 6E 20 70 72 6F 67
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal  72-Bits]



             72 61 6D 0A 00
                                    305 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
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
      00016A                         35 add24: ; ( i1 i2 -- i1 + i2 )
      00016A                         36     _xpop 
      0081E6 61 6D            [ 1]    1     ld a,(y)
      0081E8 0A               [ 1]    2     ldw x,y 
      0081E9 00 01            [ 2]    3     ldw x,(1,x)
      0081EA 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0081EA 90               [ 2]   37     pushw x  
      0081EB F6               [ 1]   38     push a  
      000175                         39     _at_top  
      0081EC 93 EE            [ 1]    1     ld a,(y)
      0081EE 01               [ 1]    2     ldw x,y 
      0081EF 72 A9            [ 2]    3     ldw x,(1,x)
      0081F1 00 03 89         [ 2]   40     addw x,(2,sp)
      0081F4 88 90            [ 1]   41     adc a, (1,sp)
      00017F                         42     _store_top 
      0081F6 F6 93            [ 1]    1     ld (y),a 
      0081F8 EE 01 72         [ 2]    2     ldw (1,y),x     
      000184                         43     _drop 3 
      0081FB FB 02            [ 2]    1     addw sp,#3 
      0081FD 19               [ 4]   44     ret 
                                     45 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                     46 ;-------------------------------
                                     47 ; sub24 A:X-acc24 
                                     48 ; subtract 24 bits integers 
                                     49 ;------------------------------
      000187                         50 sub24: ; (i1 i2 -- i1-i2 ) 
      000187                         51     _xpop 
      0081FE 01 90            [ 1]    1     ld a,(y)
      008200 F7               [ 1]    2     ldw x,y 
      008201 90 EF            [ 2]    3     ldw x,(1,x)
      008203 01 5B 03 81      [ 2]    4     addw y,#CELL_SIZE 
      008207 89               [ 2]   52     pushw x 
      008207 90               [ 1]   53     push  a
      000192                         54     _at_top  
      008208 F6 93            [ 1]    1     ld a,(y)
      00820A EE               [ 1]    2     ldw x,y 
      00820B 01 72            [ 2]    3     ldw x,(1,x)
      00820D A9 00 03         [ 2]   55     subw x,(2,sp) 
      008210 89 88            [ 1]   56     sbc a, (1,sp)
      00019C                         57     _store_top  
      008212 90 F6            [ 1]    1     ld (y),a 
      008214 93 EE 01         [ 2]    2     ldw (1,y),x     
      0001A1                         58     _drop 3 
      008217 72 F0            [ 2]    1     addw sp,#3 
      008219 02               [ 4]   59     ret 
                                     60 
                                     61 ;------------------------------
                                     62 ; cp24  i1 i2 -- 0x800000|0|0x010000
                                     63 ;------------------------------
      0001A4                         64 cp24:
      0001A4                         65     _xpop 
      00821A 12 01            [ 1]    1     ld a,(y)
      00821C 90               [ 1]    2     ldw x,y 
      00821D F7 90            [ 2]    3     ldw x,(1,x)
      00821F EF 01 5B 03      [ 2]    4     addw y,#CELL_SIZE 
      008223 81 00 0C         [ 1]   66     ld acc24,a 
      008224 CF 00 0D         [ 2]   67     ldw acc16,x
      0001B3                         68     _at_top 
      008224 90 F6            [ 1]    1     ld a,(y)
      008226 93               [ 1]    2     ldw x,y 
      008227 EE 01            [ 2]    3     ldw x,(1,x)
      008229 72 A9 00 03      [ 2]   69     subw x,acc16
      00822D C7 00 0D         [ 1]   70     sbc a,acc24
      008230 CF 00            [ 1]   71     jrslt 1$
      008232 0E 90            [ 1]   72     jrne 2$
      008234 F6               [ 2]   73     tnzw x 
      008235 93 EE            [ 1]   74     jrne 2$
      008237 01               [ 1]   75     clr a 
      008238 72 B0            [ 2]   76     jra 9$ 
      0001C9                         77 1$: ; i1 < i2 
      00823A 00 0E            [ 1]   78     ld a,#255
      00823C C2 00            [ 2]   79     jra 9$ 
      0001CD                         80 2$: ; i1 > i2 
      00823E 0D 2F            [ 1]   81     ld a,#1 
      008240 08               [ 1]   82 9$: clrw x
      0001D0                         83      _store_top 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008241 26 0A            [ 1]    1     ld (y),a 
      008243 5D 26 07         [ 2]    2     ldw (1,y),x     
      008246 4F               [ 4]   84     ret 
                                     85 
                                     86 ;-------------------------------
                                     87 ; cp24_ax 
                                     88 ; compare acc24 with A:X 
                                     89 ;-------------------------------
      0001D6                         90 cp24_ax:
      008247 20               [ 1]   91     push a 
      008248 06 00 0D         [ 2]   92     cpw x,acc16 
      008249 C2 00 0C         [ 1]   93     sbc a,acc24
      008249 A6               [ 1]   94     pop a 
      00824A FF               [ 4]   95     ret 
                                     96 
                                     97 
                                     98 ;-------------------------------
                                     99 ; abs24 
                                    100 ; abolute value of top  
                                    101 ;-------------------------------
      0001DF                        102 abs24: ; ( i -- u )
      00824B 20 02            [ 1]  103     ld a,(y)
      00824D A1 80            [ 1]  104     cp a,#0x80 
      00824D A6 01            [ 1]  105     jrpl neg24 ; negative integer
      00824F 5F               [ 4]  106     ret  
                                    107 
                                    108 ;----------------------------
                                    109 ;  one's compleement 
                                    110 ;----------------------------
      0001E6                        111 cpl24:  ; i -- ~i 
      008250 90 F7            [ 1]  112     cpl (y) 
      008252 90 EF 01         [ 1]  113     cpl (1,y)
      008255 81 63 02         [ 1]  114     cpl (2,y)
      008256 81               [ 4]  115     ret 
                                    116 
                                    117 ;----------------------------    
                                    118 ; two'2 complement of top  
                                    119 ;---------------------------
      0001EF                        120 neg24: ; (i -- -i )
      0001EF                        121     _at_top
      008256 88 C3            [ 1]    1     ld a,(y)
      008258 00               [ 1]    2     ldw x,y 
      008259 0E C2            [ 2]    3     ldw x,(1,x)
      00825B 00               [ 1]  122     cpl  a  
      00825C 0D               [ 2]  123     cplw x 
      00825D 84 81 01         [ 2]  124     addw x,#1
      00825F A9 00            [ 1]  125     adc a,#0
      0001FB                        126     _store_top  
      00825F 90 F6            [ 1]    1     ld (y),a 
      008261 A1 80 2A         [ 2]    2     ldw (1,y),x     
      008264 0A               [ 4]  127 9$: ret 
                                    128 
                                    129 ;-----------------------------
                                    130 ; negate integer in A:X 
                                    131 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000201                        132 neg_ax:
      008265 81               [ 1]  133     cpl  a  
      008266 53               [ 2]  134     cplw x 
      008266 90 73 90         [ 2]  135     addw x,#1
      008269 63 01            [ 1]  136     adc a,#0
      00826B 90               [ 4]  137     ret 
                                    138 
                                    139 ;------------------------------------
                                    140 ;  two's complement of acc24 
                                    141 ;-------------------------------------
      000209                        142 neg_acc24: ; 
      00826C 63 02 81 0C      [ 1]  143     cpl acc24 
      00826F 72 53 00 0D      [ 1]  144     cpl acc16 
      00826F 90 F6 93 EE      [ 1]  145     cpl acc8
      008273 01 43 53 1C      [ 1]  146     inc acc8 
      008277 00 01            [ 1]  147     jrne 9$
      008279 A9 00 90 F7      [ 1]  148     inc acc16 
      00827D 90 EF            [ 1]  149     jrne 9$
      00827F 01 81 00 0C      [ 1]  150     inc acc24 
      008281 81               [ 4]  151 9$: ret 
                                    152 
                                    153 
                                    154 ;--------------------------------------
                                    155 ; unsigned multiply uint24_t by uint8_t
                                    156 ; input:
                                    157 ;	acc24	uint24_t 
                                    158 ;   A		uint8_t
                                    159 ; output:
                                    160 ;   acc24   A*acc24
                                    161 ;      A    overflow, bits 31..24 
                                    162 ;-------------------------------------
                                    163 ; local variables offset  on sp
                           000001   164 	U8   = 1   ; A pushed on stack
                           000001   165 	VSIZE = 1 
      000226                        166 mulu24_8:
      008281 43               [ 2]  167 	pushw x    ; save X
                                    168 	; local variable
      008282 53               [ 1]  169 	push a     ; U8
      008283 1C 00 01 A9      [ 1]  170 	clr acc32 
                                    171 ; multiply bits 7..0 * U8   	
      008287 00 81 0D         [ 2]  172     ldw x,acc16 
      008289 42               [ 4]  173     mul x,a
      008289 72 53 00         [ 1]  174     ld a,acc16 
      00828C 0D 72 53         [ 2]  175     ldw acc16,x 
      00828F 00               [ 1]  176     ld xl,a
      008290 0E 72            [ 1]  177     ld a,(U8,sp) 
      008292 53               [ 4]  178     mul x,a 
      008293 00 0F 72         [ 1]  179     ld a,acc24 
      008296 5C 00 0F 26      [ 1]  180     clr acc24 
      00829A 0A 72 5C 00      [ 2]  181     addw x,acc24
      00829E 0E 26 04 72      [ 1]  182     rlc acc32 
      0082A2 5C 00 0D         [ 2]  183     ldw acc24,x 
      0082A5 81               [ 1]  184     ld xl,a 
      0082A6 7B 01            [ 1]  185     ld a,(U8,sp)
      0082A6 89               [ 4]  186     mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0082A7 88 72 5F 00      [ 2]  187     addw x,acc32 
      0082AB 0C CE 00         [ 2]  188     ldw acc32,x 
      0082AE 0E               [ 1]  189     ld a,xh 
      000258                        190     _drop 1 
      0082AF 42 C6            [ 2]    1     addw sp,#1 
      0082B1 00               [ 2]  191     popw x
      0082B2 0E               [ 4]  192     ret
                                    193 
                                    194 
                                    195 ;-------------------------------
                                    196 ; mul24 i1 i2 -- i1*i2  
                                    197 ; multiply 24 bits integers 
                                    198 ;------------------------------
                                    199     ; move N2 to acc24 
                                    200     .macro _mov_n2 
                                    201         ld a,(N2,sp) 
                                    202         ldw x,(N2+1,sp)
                                    203         ld acc24,a 
                                    204         ldw acc16,x 
                                    205     .endm 
                                    206 
                           000001   207     PROD=1 
                           000004   208     PROD_SIGN=4
                           000005   209     N1=5
                           000008   210     N2=8
                           00000A   211     VSIZE=10 
      00025C                        212 mul24:
      00025C                        213     _vars VSIZE
      0082B3 CF 00            [ 2]    1     sub sp,#VSIZE 
      0082B5 0E               [ 1]  214     clrw x 
      0082B6 97 7B            [ 2]  215     ldw (PROD,sp),x 
      0082B8 01 42            [ 2]  216     ldw (PROD+2,sp),x
      000263                        217     _xpop 
      0082BA C6 00            [ 1]    1     ld a,(y)
      0082BC 0D               [ 1]    2     ldw x,y 
      0082BD 72 5F            [ 2]    3     ldw x,(1,x)
      0082BF 00 0D 72 BB      [ 2]    4     addw y,#CELL_SIZE 
      0082C3 00               [ 1]  218     tnz a 
      0082C4 0D 72            [ 1]  219     jrpl 0$
      0082C6 59 00            [ 1]  220     cpl (PROD_SIGN,sp)
      0082C8 0C CF 00         [ 4]  221     call neg_ax 
      000274                        222 0$:    
      0082CB 0D 97            [ 1]  223     ld (N1,sp),a 
      0082CD 7B 01            [ 2]  224     ldw (N1+1,sp),x
      000278                        225     _at_top 
      0082CF 42 72            [ 1]    1     ld a,(y)
      0082D1 BB               [ 1]    2     ldw x,y 
      0082D2 00 0C            [ 2]    3     ldw x,(1,x)
      0082D4 CF               [ 1]  226     tnz a 
      0082D5 00 0C            [ 1]  227     jrpl 2$ 
      0082D7 9E 5B            [ 1]  228     cpl (PROD_SIGN,sp) 
      0082D9 01 85 81         [ 4]  229     call neg_ax
      0082DC                        230 2$:
      0082DC 52 0A            [ 1]  231     ld (N2,sp),a 
      0082DE 5F 1F            [ 2]  232     ldw (N2+1,sp),x    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0082E0 01 1F 03         [ 1]  233     ld acc24,a 
      0082E3 90 F6 93         [ 2]  234     ldw acc16,x 
      0082E6 EE 01            [ 1]  235     ld a,(N1+2,sp); least byte     
      0082E8 72 A9            [ 1]  236     jreq 4$
      0082EA 00 03 4D         [ 4]  237     call mulu24_8
      0082ED 2A               [ 1]  238     tnz a 
      0082EE 05 03            [ 1]  239     jrne 8$ ; overflow 
      0082F0 04 CD 82         [ 2]  240     ldw x,acc16  
      0082F3 81 00 0C         [ 1]  241     ld a,acc24
      0082F4 2B 58            [ 1]  242     jrmi 8$ ; overflow  
      0082F4 6B 05            [ 1]  243     ld (PROD,sp),a
      0082F6 1F 06            [ 2]  244     ldw (PROD+1,sp),x 
      0002A5                        245     _mov_n2 
      0082F8 90 F6            [ 1]    1         ld a,(N2,sp) 
      0082FA 93 EE            [ 2]    2         ldw x,(N2+1,sp)
      0082FC 01 4D 2A         [ 1]    3         ld acc24,a 
      0082FF 05 03 04         [ 2]    4         ldw acc16,x 
      0002AF                        246 4$:
      008302 CD 82            [ 1]  247     ld a,(N1+1,sp); middle byte     
      008304 81 1F            [ 1]  248     jreq 5$
      008305 CD 02 26         [ 4]  249     call mulu24_8
      008305 6B               [ 1]  250     tnz a 
      008306 08 1F            [ 1]  251     jrne 8$ ; overflow 
      008308 09 C7 00         [ 1]  252     ld a,acc24 
      00830B 0D CF            [ 1]  253     jrne 8$  ; overflow 
      00830D 00 0E 7B         [ 2]  254     ldw x,acc16  
      008310 07 27 1C         [ 2]  255     addw x,(PROD,sp)
      008313 CD 82            [ 1]  256     jrv 8$ ; overflow
      008315 A6 4D            [ 2]  257     ldw (PROD,sp),x 
      0002C8                        258     _mov_n2 
      008317 26 60            [ 1]    1         ld a,(N2,sp) 
      008319 CE 00            [ 2]    2         ldw x,(N2+1,sp)
      00831B 0E C6 00         [ 1]    3         ld acc24,a 
      00831E 0D 2B 58         [ 2]    4         ldw acc16,x 
      0002D2                        259 5$:
      008321 6B 01            [ 1]  260     ld a,(N1,sp) ; high byte 
      008323 1F 02            [ 1]  261     jreq 6$
      008325 7B 08 1E         [ 4]  262     call mulu24_8
      008328 09               [ 1]  263     tnz a 
      008329 C7 00            [ 1]  264     jrne 8$ ; overflow 
      00832B 0D CF 00         [ 2]  265     ldw x,acc24 
      00832E 0E 18            [ 1]  266     jrne 8$ ; overflow 
      00832F C6 00 0E         [ 1]  267     ld a,acc8 
      00832F 7B 06            [ 1]  268     jrmi 8$ ; overflow 
      008331 27 1F            [ 1]  269     add a,(PROD,sp)
      008333 CD 82            [ 1]  270     ld (PROD,sp),a 
      008335 A6 4D            [ 1]  271     jrv 8$ ; overflow 
      0002EC                        272 6$:
      008337 26 40            [ 1]  273     ld a,(PROD,sp)
      008339 C6 00            [ 2]  274     ldw x,(PROD+1,sp)
      00833B 0D 26            [ 1]  275     tnz (PROD_SIGN,sp)
      00833D 3B CE            [ 1]  276     jreq 9$
      00833F 00 0E 72         [ 4]  277     call neg_ax 
      008342 FB 01            [ 2]  278     jra 9$ 
      0002F9                        279 8$: ; overflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008344 29 33            [ 1]  280     ld a,#ERR_OVERFLOW
      008346 1F 01 7B         [ 2]  281     jp tb_error 
      0002FE                        282 9$:    
      0002FE                        283     _store_top 
      008349 08 1E            [ 1]    1     ld (y),a 
      00834B 09 C7 00         [ 2]    2     ldw (1,y),x     
      000303                        284     _drop VSIZE 
      00834E 0D CF            [ 2]    1     addw sp,#VSIZE 
      008350 00               [ 4]  285     ret 
                                    286 
                                    287 ;-------------------------------------
                                    288 ; divide uint24_t by uint8_t
                                    289 ; input:
                                    290 ;	acc24	dividend
                                    291 ;   A 		divisor
                                    292 ; output:
                                    293 ;   acc24	quotient
                                    294 ;   A		remainder
                                    295 ;------------------------------------- 
                                    296 ; offset  on sp of arguments and locals
                           000001   297 	U8   = 1   ; divisor on stack
                           000001   298 	VSIZE =1
      000306                        299 divu24_8:
      008351 0E               [ 2]  300 	pushw x ; save x
      008352 88               [ 1]  301 	push a 
                                    302 	; ld dividend UU:MM bytes in X
      008352 7B 05 27         [ 2]  303 	ldw x,acc24
      008355 16 CD            [ 1]  304 	ld a,(U8,SP) ; divisor
      008357 82               [ 2]  305 	div x,a ; UU:MM/U8
      008358 A6               [ 1]  306 	push a  ;save remainder
      008359 4D 26 1D         [ 2]  307     ldw acc24,x ; quotient 
      00835C CE               [ 1]  308 	pop a
      00835D 00               [ 1]  309 	ld xh,a
      00835E 0D 26 18         [ 1]  310 	ld a,acc8
      008361 C6               [ 1]  311 	ld xl,a
      008362 00 0F            [ 1]  312 	ld a,(U8,sp) ; divisor
      008364 2B               [ 2]  313 	div x,a  ; R:LL/U8
      008365 13 1B            [ 1]  314 	ld (U8,sp),a ; save remainder
      008367 01               [ 1]  315 	ld a,xl
      008368 6B 01 29         [ 1]  316 	ld acc8,a
      00836B 0D               [ 1]  317 	pop a
      00836C 85               [ 2]  318 	popw x
      00836C 7B               [ 4]  319 	ret
                                    320 
                                    321 
                                    322 ;-------------------------------
                                    323 ; div24 N/T   
                                    324 ; divide 24 bits integers
                                    325 ;  i1 i2 -- i1/i2 
                                    326 ;------------------------------
                           000001   327     DIVISOR=1
                           000004   328     CNTR=4
                           000005   329     QSIGN=5
                           000006   330     RSIGN=6 
                           000006   331     VSIZE=6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000324                        332 div24:
      000324                        333     _vars VSIZE 
      00836D 01 1E            [ 2]    1     sub sp,#VSIZE 
      00836F 02 0D            [ 1]  334     clr (RSIGN,sp)
      008371 04 27            [ 1]  335     clr (QSIGN,sp)
      00032A                        336     _xpop 
      008373 0A CD            [ 1]    1     ld a,(y)
      008375 82               [ 1]    2     ldw x,y 
      008376 81 20            [ 2]    3     ldw x,(1,x)
      008378 05 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      008379 4D               [ 1]  337     tnz a 
      008379 A6 10            [ 1]  338     jrpl 0$ 
      00837B CC 97            [ 1]  339     cpl (QSIGN,sp)
      00837D 21 02 01         [ 4]  340     call neg_ax
      00837E                        341 0$:
      00837E 90 F7            [ 1]  342     ld  (DIVISOR,sp),a
      008380 90 EF            [ 2]  343     ldw (DIVISOR+1,sp),x
      008382 01 5B            [ 1]  344     or a,(DIVISOR+1,sp)
      008384 0A 81            [ 1]  345     or a,(DIVISOR+2,sp)
      008386 26 05            [ 1]  346     jrne 1$ 
      008386 89 88            [ 1]  347     ld a,#ERR_DIV0 
      008388 CE 00 0D         [ 2]  348     jp tb_error 
      00034A                        349 1$: 
      00034A                        350     _at_top
      00838B 7B 01            [ 1]    1     ld a,(y)
      00838D 62               [ 1]    2     ldw x,y 
      00838E 88 CF            [ 2]    3     ldw x,(1,x)
      008390 00               [ 1]  351     tnz a 
      008391 0D 84            [ 1]  352     jrpl 2$
      008393 95 C6 00         [ 4]  353     call neg_ax
      008396 0F 97            [ 1]  354     cpl (QSIGN,sp)
      008398 7B 01            [ 1]  355     cpl (RSIGN,sp)
      000359                        356 2$: 
      00839A 62 6B 01         [ 1]  357     ld acc24,a 
      00839D 9F C7 00         [ 2]  358     ldw acc16,x 
      0083A0 0F 84            [ 1]  359     ld a,#24 
      0083A2 85 81            [ 1]  360     ld (CNTR,sp),a
      0083A4 7B 01            [ 1]  361     ld a,(DIVISOR,sp)
      0083A4 52 06            [ 2]  362     ldw x,(DIVISOR+1,sp)
      0083A6 0F 06 0F         [ 4]  363     call cp24_ax ; A:X-acc24 ?
      0083A9 05 90            [ 2]  364     jrule 22$ 
                                    365 ; quotient=0, remainder=divisor      
      0083AB F6 93 EE         [ 1]  366     ld a,acc24 
      0083AE 01 72 A9         [ 2]  367     ldw x,acc16 
      0083B1 00 03 4D 2A      [ 1]  368     clr acc24 
      0083B5 05 03 05 CD      [ 1]  369     clr acc16 
      0083B9 82 81 00 0E      [ 1]  370     clr acc8 
      0083BB 20 2E            [ 2]  371     jra 6$
      000380                        372 22$:     
      0083BB 6B               [ 1]  373     clr a 
      0083BC 01               [ 1]  374     clrw x 
      0083BD 1F               [ 1]  375     rcf  
      000383                        376 3$: 
      0083BE 02 1A 02 1A      [ 1]  377     rlc acc8 
      0083C2 03 26 05 A6      [ 1]  378     rlc acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0083C6 04 CC 97 21      [ 1]  379     rlc acc24 
      0083CA 59               [ 2]  380     rlcw x  
      0083CA 90               [ 1]  381     rlc a
      0083CB F6 93 EE         [ 2]  382 4$: subw x,(DIVISOR+1,sp) 
      0083CE 01 4D            [ 1]  383     sbc a,(DIVISOR,sp)
      0083D0 2A 07            [ 1]  384     jrnc 5$
      0083D2 CD 82 81         [ 2]  385     addw x,(DIVISOR+1,sp)
      0083D5 03 05            [ 1]  386     adc a,(DIVISOR,sp)
      00039D                        387 5$: ; shift carry in QUOTIENT 
      0083D7 03               [ 1]  388     ccf
      0083D8 06 04            [ 1]  389     dec (CNTR,sp)
      0083D9 26 E1            [ 1]  390     jrne 3$ 
      0083D9 C7 00 0D CF      [ 1]  391     rlc acc8 
      0083DD 00 0E A6 18      [ 1]  392     rlc acc16 
      0083E1 6B 04 7B 01      [ 1]  393     rlc acc32 
      0003AE                        394 6$:    
      0083E5 1E 02            [ 1]  395     ld (DIVISOR,sp),a 
      0083E7 CD 82            [ 2]  396     ldw (DIVISOR+1,sp),x 
      0083E9 56 23 14         [ 1]  397     ld a,acc24 
      0083EC C6 00 0D         [ 2]  398     ldw x,acc16 
      0083EF CE 00            [ 1]  399     tnz (QSIGN,sp)
      0083F1 0E 72            [ 1]  400     jreq 8$
      0083F3 5F 00 0D         [ 4]  401     call neg_ax 
      0003BF                        402 8$: 
      0003BF                        403     _store_top 
      0083F6 72 5F            [ 1]    1     ld (y),a 
      0083F8 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083FB 5F 00            [ 1]  404     ld a,(DIVISOR,sp)
      0083FD 0F 20            [ 2]  405     ldw x,(DIVSOR+1,sp)
      0003C8                        406 81$:
      0083FF 2E 06            [ 1]  407     tnz (RSIGN,sp)
      008400 27 03            [ 1]  408     jreq 9$
      008400 4F 5F 98         [ 4]  409     call neg_ax       
      008403                        410 9$: _drop VSIZE 
      008403 72 59            [ 2]    1     addw sp,#VSIZE 
      008405 00               [ 4]  411     ret 
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
      0003D2                        423 mod24:
      008406 0F 72 59         [ 4]  424     call div24 
      0003D5                        425     _store_top  ; replace quotient by remainder 
      008409 00 0E            [ 1]    1     ld (y),a 
      00840B 72 59 00         [ 2]    2     ldw (1,y),x     
      00840E 0D               [ 4]  426     ret 
                                    427 
                                    428 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
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
      0003DB                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003DB                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003DB                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003DB                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003DB                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003DB                         37 prt_regs::
      00840F 59 49 72         [ 2]   38 	ldw x,#regs_state 
      008412 F0 02 12         [ 4]   39 	call puts
                                     40 ; register PC
      008415 01 24            [ 2]   41 	ldw y,(1,sp)
      008417 05 72 FB         [ 2]   42 	ldw x,#REG_EPC 
      00841A 02 19 01         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      00841D 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      00841D 8C 0A 04         [ 2]   46 	ldw x,#REG_CC 
      008420 26 E1 72         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      008423 59 00            [ 1]   49 	ld a,(R_A,sp)
      008425 0F 72 59         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008428 00 0E 72         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      00842B 59 00            [ 2]   53 	ldw y,(R_X,sp)
      00842D 0C 05 5B         [ 2]   54 	ldw x,#REG_X 
      00842E CD 04 A3         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      00842E 6B 01            [ 2]   57 	ldw y,(R_Y,sp)
      008430 1F 02 C6         [ 2]   58 	ldw x,#REG_Y 
      008433 00 0D CE         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      008436 00 0E            [ 1]   61 	ldw y,sp
      008438 0D 05 27 03      [ 2]   62 	addw y,#6+ARG_OFS  
      00843C CD 82 81         [ 2]   63 	ldw x,#REG_SP
      00843F CD 04 A3         [ 4]   64 	call prt_reg16
      00843F 90 F7            [ 1]   65 	ld a,#CR 
      008441 90 EF 01         [ 4]   66 	call putc
      008444 7B 01 1E         [ 4]   67 	call putc   
      008447 02               [ 4]   68 	ret 
                                     69 
                                     70 
      008448 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      000445                         81 prt_peek::
      008448 0D               [ 2]   82 	pushw x 
      008449 06 27 03 CD      [ 1]   83 	mov base,#16 
      00844D 82 81 5B         [ 4]   84 	call prt_i16  
      008450 06 81            [ 1]   85 	ld a,#': 
      008452 CD 09 41         [ 4]   86 	call putc 
      008452 CD 83            [ 1]   87 	ld a,#SPACE 
      008454 A4 90 F7         [ 4]   88 	call putc 
      008457 90               [ 2]   89 	popw x 
      008458 EF               [ 1]   90 	ld a,(x)
      008459 01               [ 1]   91 	clrw x 
      00845A 81               [ 1]   92 	ld xl,a 
      00845B 35 0A 00 0A      [ 1]   93 	mov base,#10 
      00845B AE 84 9E         [ 4]   94 	call prt_i16 
      00845E CD               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      000463                        102 ledon:
      00845F 8A 1E 16 01      [ 1]  103     bset PC_ODR,#LED2_BIT
      008463 AE               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      000468                        107 ledoff:
      008464 85 D2 CD 85      [ 1]  108     bres PC_ODR,#LED2_BIT 
      008468 23               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      00046D                        112 ledtoggle:
      008469 7B 08            [ 1]  113     ld a,#LED2_MASK
      00846B AE 85 E3         [ 1]  114     xor a,PC_ODR
      00846E CD 85 01         [ 1]  115     ld PC_ODR,a
      008471 7B               [ 4]  116     ret 
                                    117 
      000476                        118 left_paren:
      008472 07 AE            [ 1]  119 	ld a,#SPACE 
      008474 85 DF CD         [ 4]  120 	call putc
      008477 85 01            [ 1]  121 	ld a,#'( 
      008479 16 05 AE         [ 4]  122 	call putc 	
      00847C 85               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      000481                        133 prt_reg8:
      00847D DB               [ 1]  134 	push a 
      00847E CD 85 23         [ 4]  135 	call puts 
      008481 16 03            [ 1]  136 	ld a,(1,sp) 
      008483 AE               [ 1]  137 	clrw x 
      008484 85               [ 1]  138 	ld xl,a 
      008485 D7 CD 85 23      [ 1]  139 	mov base,#16
      008489 90 96 72         [ 4]  140 	call prt_i16  
      00848C A9 00 08         [ 4]  141 	call left_paren 
      00848F AE               [ 1]  142 	pop a 
      008490 85               [ 1]  143 	clrw x 
      008491 E8               [ 1]  144 	ld xl,a 
      008492 CD 85 23 A6      [ 1]  145 	mov base,#10 
      008496 0D CD 89         [ 4]  146 	call prt_i16  
      008499 C1 CD            [ 1]  147 	ld a,#') 
      00849B 89 C1 81         [ 4]  148 	call putc
      00849E 0A               [ 4]  149 	ret
                                    150 
                                    151 ;--------------------------------
                                    152 ; print 16 bits register 
                                    153 ; input:
                                    154 ;   X   point register name 
                                    155 ;   Y   register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                    156 ; output:
                                    157 ;  none
                                    158 ;--------------------------------
      0004A3                        159 prt_reg16: 
      00849F 72 65            [ 2]  160 	pushw y 
      0084A1 67 69 73         [ 4]  161 	call puts 
      0084A4 74 65            [ 2]  162 	ldw x,(1,sp) 
      0084A6 72 73 20 73      [ 1]  163 	mov base,#16 
      0084AA 74 61 74         [ 4]  164 	call prt_i16  
      0084AD 65 0A 2D         [ 4]  165 	call left_paren 
      0084B0 2D               [ 2]  166 	popw x 
      0084B1 2D 2D 2D 2D      [ 1]  167 	mov base,#10 
      0084B5 2D 2D 2D         [ 4]  168 	call prt_i16  
      0084B8 2D 2D            [ 1]  169 	ld a,#') 
      0084BA 2D 2D 2D         [ 4]  170 	call putc
      0084BD 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      0004C2                        177 print_registers:
      0084BE 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      0084C1 2D 2D 0A         [ 4]  179 	call puts
                                    180 ; print EPC 
      0084C4 00 05 52         [ 2]  181 	ldw x, #REG_EPC
      0084C5 CD 09 9E         [ 4]  182 	call puts 
      0084C5 89 35            [ 1]  183 	ld a, (11,sp)
      0084C7 10 00 0B         [ 1]  184 	ld acc8,a 
      0084CA CD 98            [ 1]  185 	ld a, (10,sp) 
      0084CC 75 A6 3A         [ 1]  186 	ld acc16,a 
      0084CF CD 89            [ 1]  187 	ld a,(9,sp) 
      0084D1 C1 A6 20         [ 1]  188 	ld acc24,a
      0084D4 CD               [ 1]  189 	clrw x  
      0084D5 89 C1            [ 1]  190 	ld a,#16
      0084D7 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084DA 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084DD 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084DF CD 98 75         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084E2 81 05 57         [ 2]  197 	ldw x,#REG_Y
      0084E3 16 07            [ 2]  198 	ldw y, (7,sp)
      0084E3 72 1A 50         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084E6 0A 81 5F         [ 2]  201 	ldw x,#REG_A
      0084E8 7B 04            [ 1]  202 	ld a, (4,sp) 
      0084E8 72 1B 50         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084EB 0A 81 63         [ 2]  205 	ldw x,#REG_CC 
      0084ED 7B 03            [ 1]  206 	ld a, (3,sp) 
      0084ED A6 20 C8         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084F0 50 0A C7         [ 2]  209 	ldw x,#REG_SP
      0084F3 50 0A            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084F5 81 A9 00 0C      [ 2]  211 	addw y,#12
      0084F6 CD 04 A3         [ 4]  212 	call prt_reg16  
      0084F6 A6 20            [ 1]  213 	ld a,#'\n' 
      0084F8 CD 89 C1         [ 4]  214 	call putc
      0084FB A6               [ 4]  215 	ret
                                    216 
      0084FC 28 CD 89 C1 81 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008501 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      008501 88 CD 8A 1E            219 REG_Y:   .asciz "\nY:" 
      008505 7B 01 5F 97            220 REG_X:   .asciz "\nX:"
      008509 35 10 00 0B            221 REG_A:   .asciz "\nA:" 
      00850D CD 98 75 CD 84         222 REG_CC:  .asciz "\nCC:"
      008512 F6 84 5F 97 35         223 REG_SP:  .asciz "\nSP:"
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
      00056D                        235 cmd_itf:
      008517 0A 00            [ 2]  236 	sub sp,#VSIZE 
      008519 0B CD 98 75      [ 1]  237 	clr farptr 
      00851D A6 29 CD 89      [ 1]  238 	clr farptr+1 
      008521 C1 81 00 1A      [ 1]  239 	clr farptr+2  
      008523                        240 repl:
      008523 90 89            [ 1]  241 	ld a,#CR 
      008525 CD 8A 1E         [ 4]  242 	call putc 
      008528 1E 01            [ 1]  243 	ld a,#'? 
      00852A 35 10 00         [ 4]  244 	call putc
      00852D 0B CD 98 75      [ 1]  245 	clr in.w 
      008531 CD 84 F6 85      [ 1]  246 	clr in 
      008535 35 0A 00         [ 4]  247 	call readln
      008538 0B CD 98 75      [ 2]  248 	ldw y,#tib  
      00853C A6 29            [ 1]  249 	ld a,(y)
      00853E CD 89            [ 1]  250 	jreq repl  
      008540 C1 81 00 01      [ 1]  251 	inc in 
      008542 CD 18 8B         [ 4]  252 	call to_upper 
      008542 AE 85            [ 1]  253 	cp a,#'Q 
      008544 95 CD            [ 1]  254 	jrne test_p
      0005A3                        255 repl_exit:
      008546 8A 1E AE 85      [ 1]  256 	clr tib 
      00854A D2 CD 8A 1E      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00854E 7B 0B C7 00      [ 1]  258 	clr in 
      0005AF                        259 	_drop #VSIZE 	
      008552 0F 7B            [ 2]    1     addw sp,##VSIZE 
      008554 0A               [ 4]  260 	ret  
      0005B2                        261 invalid:
      008555 C7 00 0E         [ 2]  262 	ldw x,#invalid_cmd 
      008558 7B 09 C7         [ 4]  263 	call puts 
      00855B 00 0D            [ 2]  264 	jra repl 
      0005BA                        265 test_p:	
      00855D 5F A6            [ 1]  266     cp a,#'P 
      00855F 10 CD            [ 1]  267 	jreq mem_peek
      008561 98 8C            [ 1]  268     cp a,#'S 
      008563 AE 85            [ 1]  269 	jrne invalid 
      0005C2                        270 print_string:	
      008565 DB 16 05         [ 4]  271 	call get_token
      008568 CD 85            [ 1]  272 	cp a,#TK_INTGR 
      00856A 23 AE            [ 1]  273 	jrne invalid 
      00856C 85 D7 16         [ 4]  274 	call puts
      00856F 07 CD 85         [ 2]  275 	jp repl 	
      0005CF                        276 mem_peek:
      008572 23 AE            [ 1]  277 	ld a,#SPACE 
      008574 85 DF 7B         [ 4]  278 	call skip  	 
      008577 04 CD 85 01      [ 2]  279 	addw y,in.w 
      00857B AE 85 E3         [ 2]  280 	ldw x,#pad 
      00857E 7B 03 CD         [ 4]  281 	call strcpy
      008581 85 01 AE         [ 2]  282 	ldw x,#pad
      008584 85 E8 90         [ 4]  283 	call atoi24 	
      008587 96 72 A9         [ 1]  284 	ld a, acc24 
      00858A 00 0C CD         [ 1]  285 	or a,acc16 
      00858D 85 23 A6         [ 1]  286 	or a,acc8 
      008590 0A CD            [ 1]  287 	jrne 1$ 
      008592 89 C1            [ 2]  288 	jra peek_byte  
      008594 81 0A 52         [ 2]  289 1$:	ldw x,acc24 
      008597 65 67 69         [ 2]  290 	ldw farptr,x 
      00859A 73 74 65         [ 1]  291 	ld a,acc8 
      00859D 72 73 20         [ 1]  292 	ld farptr+2,a 
      0005FD                        293 peek_byte:
      0085A0 73 74 61         [ 4]  294 	call print_farptr 
      0085A3 74 65            [ 1]  295 	ld a,#8 
      0085A5 20 61            [ 1]  296 	ld (PSIZE,sp),a 
      0085A7 74               [ 1]  297 	clrw x 
      0085A8 20 61 62         [ 4]  298 1$:	call fetchc  
      0085AB 6F               [ 2]  299 	pushw x 
      0085AC 72 74 20         [ 1]  300 	ld acc8,a 
      0085AF 70               [ 1]  301 	clrw x 
      0085B0 6F 69 6E         [ 2]  302 	ldw acc24,x 
      0085B3 74 2E            [ 1]  303 	ld a,#16+128
      0085B5 0A 2D 2D         [ 4]  304 	call prt_acc24
      0085B8 2D               [ 2]  305 	popw x 
      0085B9 2D 2D            [ 1]  306 	dec (PSIZE,sp)
      0085BB 2D 2D            [ 1]  307 	jrne 1$ 
      0085BD 2D 2D            [ 1]  308 	ld a,#8 
      0085BF 2D 2D 2D         [ 1]  309 	add a,farptr+2 
      0085C2 2D 2D 2D         [ 1]  310 	ld farptr+2,a
      0085C5 2D               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0085C6 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      0085C9 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      0085CC 2D               [ 1]  314 	clr a 
      0085CD 2D 2D 2D         [ 1]  315 	adc a,farptr 
      0085D0 0A 00 45         [ 1]  316 	ld farptr,a 
      0085D3 50 43 3A         [ 2]  317 	jp repl  
                                    318 
      0085D6 00 0A 59 3A 00 0A 58   319 invalid_cmd: .asciz "not a command\n" 
             3A 00 0A 41 3A 00 0A
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      000642                        324 print_farptr:
      0085E5 43 3A 00         [ 1]  325 	ld a ,farptr+2 
      0085E8 0A 53 50         [ 1]  326 	ld acc8,a 
      0085EB 3A 00 18         [ 2]  327 	ldw x,farptr 
      0085ED CF 00 0C         [ 2]  328 	ldw acc24,x 
      0085ED 52               [ 1]  329 	clrw x 
      0085EE 01 72            [ 1]  330 	ld a,#16 
      0085F0 5F 00 19         [ 4]  331 	call prt_acc24
      0085F3 72 5F            [ 1]  332 	ld a,#SPACE 
      0085F5 00 1A 72         [ 4]  333 	call putc 
      0085F8 5F 00 1B         [ 4]  334 	call putc 
      0085FB 81               [ 4]  335 	ret
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
      00065D                        346 fetchc: ; @C
      0085FB A6 0D CD 89      [ 5]  347 	ldf a,([farptr],x)
      0085FF C1               [ 1]  348 	incw x
      008600 A6               [ 4]  349 	ret
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
      000663                        360 number:
      008601 3F CD 89         [ 4]  361 	call get_token
      008604 C1 72            [ 1]  362 	cp a,#TK_INTGR
      008606 5F 00            [ 1]  363 	jreq 1$
      008608 01 72 5F         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00860B 00               [ 4]  365 1$:	ret
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
      00066E                        380 show_row:
      00860C 02               [ 1]  381 	tnz a 
      00860D CD 8B            [ 1]  382 	jrne 1$
      00860F 23               [ 4]  383 	ret 
      000672                        384 1$:	
      008610 90               [ 2]  385 	pushw x  
      008611 AE               [ 1]  386 	push a 
      008612 16 68 90 F6      [ 1]  387 	mov tab_width,#4 
      008616 27 E3 72         [ 4]  388 	call prt_i16 
      008619 5C 00            [ 1]  389 	ld a,#SPACE  
      00861B 02 CD 99         [ 4]  390 	call putc
      000680                        391 row_loop:
      00861E 0B A1            [ 2]  392 	ldw x,(ADR,sp)
      008620 51               [ 1]  393 	ld a,(x)
      008621 26               [ 1]  394 	clrw x 
      008622 17               [ 1]  395 	ld xl,a 
      008623 CD 17 F5         [ 4]  396 	call prt_i16 
      008623 72 5F            [ 2]  397 	ldw x,(ADR,sp)
      008625 16               [ 1]  398 	incw x 
      008626 68 72            [ 2]  399 	ldw (ADR,sp),x 
      008628 5F 00            [ 1]  400 	dec (CNT,sp)
      00862A 04 72            [ 1]  401 	jrne row_loop
      000691                        402 	_drop VSIZE  		
      00862C 5F 00            [ 2]    1     addw sp,#VSIZE 
      00862E 02 5B 01 81      [ 1]  403 	mov tab_width,#4
      008632 A6 0D            [ 1]  404 	ld a,#CR 
      008632 AE 86 B3         [ 4]  405 	call putc 
      008635 CD               [ 4]  406 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00069D                        419 hex_dump:
      008636 8A               [ 1]  420 	push a 
      00069E                        421 	_vars VSIZE
      008637 1E 20            [ 2]    1     sub sp,#VSIZE 
      008639 C1 00 0A         [ 1]  422 	ld a,base
      00863A 6B 03            [ 1]  423 	ld (BASE,sp),a 
      00863A A1 50 27 11      [ 1]  424 	mov base,#16
      00863E A1 53 26         [ 1]  425 	ld a,tab_width 
      008641 F0 04            [ 1]  426 	ld (TABW,sp),a
      008642 A6 0D            [ 1]  427 	ld a,#CR 
      008642 CD 8F 98         [ 4]  428 	call putc 
      008645 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      008647 26 E9            [ 1]  430 	ld a,#16
      008649 CD 8A 1E CC      [ 2]  431 	cpw y,#16
      00864D 85 FB            [ 1]  432 	jrpl 2$
      00864F 90 9F            [ 1]  433 	ld a,yl
      0006BF                        434 2$: 	
      00864F A6 20 CD         [ 4]  435 	call show_row 
      008652 8F 85            [ 2]  436 	ldw y,(BCNT,sp) 
      008654 72 B9 00 01      [ 2]  437 	subw y,#16 
      008658 AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00865C 94 7F            [ 1]  439 	jrpl 1$
      00865E AE 16            [ 1]  440 	ld a,(BASE,sp)
      008660 B8 CD 99         [ 1]  441 	ld base,a
      008663 17 C6            [ 1]  442 	ld a,(TABW,sp)
      008665 00 0D CA         [ 1]  443 	ld tab_width,a 
      0006D8                        444 	_drop VSIZE
      008668 00 0E            [ 2]    1     addw sp,#VSIZE 
      00866A CA               [ 1]  445 	pop a 
      00866B 00               [ 4]  446 	ret 
                                    447 
                                    448 .endif ; DEBUG 
                                    449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
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
      0006DC                         45 unlock_eeprom:
      00866C 0F 26 02 20 0C   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008671 CE 00 0D CF      [ 1]   47 	mov FLASH_CR2,#0 
      008675 00 19 C6 00      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008679 0F C7 00 1B      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00867D 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00867D CD 86 C2 A6 08   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008682 6B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006F7                         62 unlock_flash:
      008683 01 5F CD 86 DD   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008688 89 C7 00 0F      [ 1]   64 	mov FLASH_CR2,#0 
      00868C 5F CF 00 0D      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008690 A6 90 CD 98      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008694 8C 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008698 26 EB A6 08 CB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00869D 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      000712                         76 row_erase:
      00869E 1B               [ 1]   77 	push a 
      00869F C7 00            [ 2]   78 	pushw y 
      0086A1 1B 4F C9 00      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0086A5 1A C7 00 1A      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0086A9 4F               [ 1]   81 	clr a 
      0086AA C9 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0086AC 19 C7 00 19      [ 1]   83 	ldf ([farptr],y),a
      0086B0 CC 85            [ 1]   84     incw y
      0086B2 FB 6E 6F 74      [ 1]   85 	ldf ([farptr],y),a
      0086B6 20 61            [ 1]   86     incw y
      0086B8 20 63 6F 6D      [ 1]   87 	ldf ([farptr],y),a
      0086BC 6D 61            [ 1]   88     incw y
      0086BE 6E 64 0A 00      [ 1]   89 	ldf ([farptr],y),a
      0086C2 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0086C2 C6 00            [ 2]   91 	popw y 
      0086C4 1B               [ 1]   92 	pop a 
      0086C5 C7               [ 4]   93 	ret
      00073F                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      00073F                         97 move_erase_to_ram:
      0086C6 00               [ 2]   98 	pushw x 
      0086C7 0F CE            [ 2]   99 	pushw y 
      0086C9 00 19 CF         [ 2]  100 	ldw x,#row_erase_end 
      0086CC 00 0D 5F         [ 2]  101 	subw x,#row_erase
      0086CF A6 10 CD         [ 2]  102 	ldw acc16,x 
      0086D2 98 8C A6         [ 2]  103 	ldw x,#tib 
      0086D5 20 CD 89 C1      [ 2]  104 	ldw y,#row_erase 
      0086D9 CD 89 C1         [ 4]  105 	call move
      0086DC 81 85            [ 2]  106 	popw y
      0086DD 85               [ 2]  107 	popw x
      0086DD 92               [ 4]  108 	ret 
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
      000759                        123 program_row:
      0086DE AF               [ 1]  124 	push a 
      0086DF 00 19            [ 2]  125 	pushw y 
      0086E1 5C 81            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086E3 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086E3 CD 8F 98 A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086E7 84 27            [ 1]  130 	clrw y 
      0086E9 03               [ 1]  131 1$:	ld a,(x)
      0086EA CC 97 1F 81      [ 1]  132 	ldf ([farptr],y),a
      0086EE 5C               [ 1]  133 	incw x 
      0086EE 4D 26            [ 1]  134 	incw y 
      0086F0 01 81            [ 1]  135 	dec (BCNT,sp)
      0086F2 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0086F2 89 88 35 04 00   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000779                        139 	_drop 1 
      0086F7 24 CD            [ 2]    1     addw sp,#1 
      0086F9 98 75            [ 2]  140 	popw y 
      0086FB A6               [ 1]  141 	pop a 
      0086FC 20               [ 4]  142 	ret 
      00077F                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      00077F                        149 move_prg_to_ram:
      0086FD CD               [ 2]  150 	pushw x 
      0086FE 89 C1            [ 2]  151 	pushw y 
      008700 AE 07 7F         [ 2]  152 	ldw x,#program_row_end 
      008700 1E 02 F6         [ 2]  153 	subw x,#program_row 
      008703 5F 97 CD         [ 2]  154 	ldw acc16,x ; bytes to move 
      008706 98 75 1E         [ 2]  155 	ldw x,#tib ; destination address 
      008709 02 5C 1F 02      [ 2]  156 	ldw y,#program_row ; source address 
      00870D 0A 01 26         [ 4]  157 	call move
      008710 EF 5B            [ 2]  158 	popw y 
      008712 03               [ 2]  159 	popw x  
      008713 35               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000799                        169 write_buffer:
      008714 04               [ 2]  170 	pushw x 
      008715 00 24 A6 0D      [ 1]  171 	tnz farptr 
      008719 CD 89            [ 1]  172 	jrne to_flash 
      00871B C1 81 19         [ 2]  173 	ldw x,farptr+1 
      00871D A3 35 80         [ 2]  174 	cpw x,#app_space  
      00871D 88 52            [ 1]  175 	jruge to_flash 
      0007A8                        176 to_eeprom:
      00871F 04 C6 00         [ 4]  177 	call unlock_eeprom
      008722 0B 6B            [ 2]  178 	jra do_programming
      0007AD                        179 to_flash:
      008724 03 35 10         [ 4]  180 	call unlock_flash
      0007B0                        181 do_programming:
      008727 00               [ 2]  182 	popw x 
      008728 0B C6 00         [ 4]  183 	call tib
      00872B 24 6B 04 A6      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00872F 0D CD 89 C1      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008733 17               [ 4]  186 	ret 
                                    187 
                                    188 
                                    189 ;-----------------------------------
                                    190 ; erase flash or EEPROM block
                                    191 ; a block is 128 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                    192 ; input:
                                    193 ;   farptr  address row begin
                                    194 ; output:
                                    195 ;   none
                                    196 ;--------------------------------------
      0007BD                        197 block_erase:
      008734 01               [ 2]  198 	pushw x 
      008735 A6 10 90         [ 1]  199 	ld a,farptr 
      008738 A3 00            [ 1]  200 	jrne erase_flash
      00873A 10 2A 02         [ 2]  201 	ldw x,farptr+1
      00873D 90 9F 80         [ 2]  202 	cpw x,#app_space 
      00873F 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      00873F CD 86 EE         [ 4]  205 	call unlock_eeprom 
      008742 16 01 72         [ 4]  206 	call tib 
      008745 A2 00 10 90      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008749 A3 00            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007D7                        210 erase_flash:
      00874B 01 2A E5         [ 4]  211 	call unlock_flash 
      00874E 7B 03 C7         [ 4]  212 	call tib 
      008751 00 0B 7B 04      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007E1                        214 erase_exit: 
      008755 C7               [ 2]  215 	popw x 
      008756 00               [ 4]  216 	ret 
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
      0007E3                        232 write_byte:
      008757 24 5B            [ 2]  233 	pushw y
      0007E5                        234 	_vars VSIZE
      008759 04 84            [ 2]    1     sub sp,#VSIZE 
      00875B 81 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00875C 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00875C 72 06 50 5F      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008760 15 35 00 50      [ 1]  240 	tnz farptr 
      008764 5B 35            [ 1]  241 	jrne write_flash
      008766 FF 50 5C 35      [ 2]  242     cpw y,#app_space 	 
      00876A AE 50            [ 1]  243     jruge write_flash
      00876C 64 35 56 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      008770 64 72            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      008772 07 50 5F FB      [ 2]  246 	cpw y,#OPTION_END 
      008776 81 51            [ 1]  247 	jrugt write_exit
      008777 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      000809                        250 write_flash:
      008777 72 02 50         [ 4]  251 	call unlock_flash 
      00877A 5F               [ 1]  252 1$:	sim 
      00877B 15 35            [ 1]  253 	ld a,(BTW,sp)
      00877D 00 50 5B 35      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008781 FF 50 5C 35 56   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008786 50               [ 1]  256     rim 
      008787 62 35 AE 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00878B 62 72            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      00081F                        260 write_eeprom:
      00878D 03 50 5F         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008790 FB 81 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008792 2B 08            [ 1]  264 	jrmi 1$
      008792 88 90 89 35      [ 2]  265 	cpw y,#OPTION_END+1
      008796 20 50            [ 1]  266 	jrpl 1$
      008798 5B 35            [ 1]  267 	cpl (OPT,sp)
      000830                        268 1$: 
      00879A DF 50            [ 1]  269     tnz (OPT,sp)
      00879C 5C 4F            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      00879E 90 5F 91 A7      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      0087A2 00 19 90 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00083C                        274 2$: 
      0087A6 91 A7            [ 1]  275     ld a,(BTW,sp)
      0087A8 00 19 90 5C      [ 4]  276     ldf ([farptr],x),a
      0087AC 91 A7            [ 1]  277     tnz (OPT,sp)
      0087AE 00 19            [ 1]  278     jreq 3$
      0087B0 90               [ 1]  279     incw x
      0087B1 5C 91            [ 1]  280     ld a,(BTW,sp)
      0087B3 A7               [ 1]  281     cpl a
      0087B4 00 19 72 05      [ 4]  282     ldf ([farptr],x),a
      0087B8 50 5F FB 90 85   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0087BD 84 81 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0087BF                        285 write_exit:
      0087BF                        286 	_drop VSIZE 
      0087BF 89 90            [ 2]    1     addw sp,#VSIZE 
      0087C1 89 AE            [ 2]  287 	popw y
      0087C3 87               [ 4]  288     ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                    300 ;	X 		after last byte written 
                                    301 ;   Y 		after last byte read 
                                    302 ;  farptr   point after block
                                    303 ;---------------------------------------------
      00085D                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00085D                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      00085D                        309 write_block::
      0087C4 BF               [ 1]  310 	push a 
      00085E                        311 	_vars VSIZE
      0087C5 1D 87            [ 2]    1     sub sp,#VSIZE 
      0087C7 92 CF            [ 2]  312 	ldw (XSAVE,sp),x 
      0087C9 00 0E            [ 2]  313 	ldw x,(BSIZE,sp) 
      0087CB AE 16            [ 1]  314 	jreq 9$
      0087CD 68 90            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      0087CF AE 87            [ 1]  316 	ld a,(y)
      0087D1 92 CD 94         [ 4]  317 	call write_byte 
      0087D4 8F               [ 1]  318 	incw x 
      0087D5 90 85            [ 1]  319 	incw y 
      0087D7 85 81            [ 2]  320 	ldw (XSAVE,sp),x
      0087D9 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      0087D9 88               [ 2]  322 	decw x
      0087DA 90 89            [ 2]  323 	ldw (BSIZE,sp),x 
      0087DC 4B 80            [ 1]  324 	jrne 1$
      000879                        325 9$:
      0087DE 72 10            [ 2]  326 	ldw x,(XSAVE,sp)
      0087E0 50 5B 72         [ 4]  327 	call incr_farptr
      00087E                        328 	_drop VSIZE
      0087E3 11 50            [ 2]    1     addw sp,#VSIZE 
      0087E5 5C               [ 1]  329 	pop a 
      0087E6 90               [ 4]  330 	ret 
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
      000882                        347 write_nbytes:
      0087E7 5F F6            [ 2]  348 	pushw y
      0087E9 91               [ 1]  349 	push a 
      0087EA A7 00            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0087EC 19               [ 1]  351 	clrw x 
      000888                        352 1$:  
      0087ED 5C 90            [ 1]  353 	ld a,(y)
      0087EF 5C 0A            [ 1]  354 	incw y
      0087F1 01 26 F4         [ 4]  355 	call write_byte 
      0087F4 72               [ 1]  356 	incw x 
      0087F5 05 50            [ 1]  357 	dec (1,sp)  
      0087F7 5F FB            [ 1]  358 	jrne 1$ 
      0087F9 5B               [ 1]  359 9$: pop a 
      0087FA 01 90            [ 2]  360 	popw y 
      0087FC 85               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      000898                        370 row_align:
      0087FD 84 81            [ 1]  371 	ld a,#0x7f 
      0087FF C4 00 1A         [ 1]  372 	and a,farptr+2 
      0087FF 27 13            [ 1]  373 	jreq 1$ 
      0087FF 89 90 89         [ 2]  374 	ldw x,farptr+1 
      008802 AE 87 FF         [ 2]  375 	addw x,#BLOCK_SIZE 
      008805 1D 87            [ 1]  376 	jrnc 0$
      008807 D9 CF 00 0E      [ 1]  377 	inc farptr 
      00880B AE               [ 1]  378 0$: ld a,xl 
      00880C 16 68            [ 1]  379 	and a,#0x80
      00880E 90               [ 1]  380 	ld xl,a
      00880F AE 87 D9         [ 2]  381 	ldw farptr+1,x  	
      008812 CD               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      0008B3                        390 incr_farptr:
      008813 94 8F 90 85      [ 2]  391 	addw x,farptr+1 
      008817 85 81            [ 1]  392 	jrnc 1$
      008819 72 5C 00 18      [ 1]  393 	inc farptr 
      008819 89 72 5D         [ 2]  394 1$:	ldw farptr+1,x  
      00881C 00               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      0008C1                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00881D 19               [ 1]  406 	clrw x 
      00881E 26 0D CE 00      [ 5]  407 1$: ldf a,([farptr],x) 
      008822 1A A3            [ 1]  408 	jrne 2$
      008824 B6               [ 1]  409 	incw x 
      008825 00 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
      008828 25 F4            [ 1]  411 	jrult 1$ 
      008828 CD               [ 4]  412 2$:	ret 
                                    413 
                                    414 
                                    415 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
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
      0008CF                         66 Uart1RxHandler: ; console receive char 
      008829 87 5C 20 03 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      00882D C6 52 31         [ 1]   68 	ld a,UART1_DR 
      00882D CD 87            [ 1]   69 	cp a,#CTRL_C 
      00882F 77 06            [ 1]   70 	jrne 2$
      008830 CD 09 41         [ 4]   71 	call putc 
      008830 85 CD 16         [ 2]   72 	jp user_interrupted
      0008E1                         73 2$:
      008833 68 72            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008835 13 50            [ 1]   75 	jrne 3$
      008837 5F 72 17         [ 2]   76 	jp cold_start 	
      00883A 50               [ 1]   77 3$:	push a 
      00883B 5F 81            [ 1]   78 	ld a,#rx1_queue 
      00883D CB 00 2F         [ 1]   79 	add a,rx1_tail 
      00883D 89               [ 1]   80 	clrw x 
      00883E C6               [ 1]   81 	ld xl,a 
      00883F 00               [ 1]   82 	pop a 
      008840 19               [ 1]   83 	ld (x),a 
      008841 26 14 CE         [ 1]   84 	ld a,rx1_tail 
      008844 00               [ 1]   85 	inc a 
      008845 1A A3            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008847 B6 00 24         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00884A 0C               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0008FC                         97 uart1_init:
      00884B CD 87 5C CD      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00884F 16 68 72 17      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008853 50 5F 20 0A      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008857 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00090C                        103 uart1_set_baud: 
      008857 CD               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008858 87 77            [ 1]  107 	ld a,#CLK_SWR_HSI
      00885A CD 16 68         [ 1]  108 	cp a,CLK_CMSR 
      00885D 72 13            [ 1]  109 	jreq 2$ 
      000914                        110 1$: ; 8 Mhz 	
      00885F 50 5F 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008861 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008861 85 81            [ 2]  113 	jra 3$
      008863                        114 2$: ; 16 Mhz 	
      008863 90 89 52 02      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008867 6B 01 0F 02      [ 1]  116 	mov UART1_BRR1,#0x08
      000926                        117 3$:
      00886B 90 CE 00 1A      [ 1]  118     clr UART1_DR
      00886F 72 5D 00 19      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008873 26 14 90 A3      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008877 B6 00 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00887C A3 40 00 25      [ 1]  122     clr rx1_head 
      008880 57 90 A3 48      [ 1]  123 	clr rx1_tail
      008884 7F               [ 1]  124 	pop a  
      008885 22               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      000941                        133 putc:: ; console output always on UART1
      000941                        134 uart1_putc:: 
      008886 51 20 16 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008889 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008889 CD               [ 4]  137 	ret 
                                    138 
                                    139 
                                    140 ;---------------------------------
                                    141 ; Query for character in rx1_queue
                                    142 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                    143 ;   none 
                                    144 ; output:
                                    145 ;   A     0 no charcter available
                                    146 ;   Z     1 no character available
                                    147 ;---------------------------------
      00094A                        148 qgetc::
      00094A                        149 uart1_qgetc::
      00888A 87 77 9B         [ 1]  150 	ld a,rx1_head 
      00888D 7B 01 92         [ 1]  151 	sub a,rx1_tail 
      008890 A7               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      000951                        161 getc:: ;console input
      000951                        162 uart1_getc::
      008891 00 19 72         [ 4]  163 	call uart1_qgetc
      008894 05 50            [ 1]  164 	jreq uart1_getc 
      008896 5F               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008897 FB 9A            [ 1]  167 	ld a,#rx1_queue
      008899 72 13 50         [ 1]  168 	add a,rx1_head 
      00889C 5F               [ 1]  169 	clrw x  
      00889D 20               [ 1]  170 	ld xl,a 
      00889E 39               [ 1]  171 	ld a,(x)
      00889F 88               [ 1]  172 	push a
      00889F CD 87 5C         [ 1]  173 	ld a,rx1_head 
      0088A2 90               [ 1]  174 	inc a 
      0088A3 A3 48            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0088A5 00 2B 08         [ 1]  176 	ld rx1_head,a 
      0088A8 90               [ 1]  177 	pop a  
      0088A9 A3               [ 2]  178 	popw x
      0088AA 48               [ 4]  179 	ret 
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
      0088AB 80 2A 02 03 02 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
             83 33 84 00 00
                                    195 
                                    196 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
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
      0088B0                        207 get_escape:
      0088B0 0D 02 27         [ 4]  208     call getc 
      0088B3 08 72            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0088B5 1E 50            [ 1]  210     jreq 1$
      0088B7 5B               [ 1]  211     clr a
      0088B8 72               [ 4]  212     ret
      0088B9 1F 50 5C         [ 4]  213 1$: call getc 
      0088BC AE 09 6C         [ 2]  214     ldw x,#convert_table
      000987                        215 2$:
      0088BC 7B               [ 1]  216     cp a,(x)
      0088BD 01 92            [ 1]  217     jreq 4$
      0088BF A7 00 19         [ 2]  218     addw x,#2
      0088C2 0D               [ 1]  219     tnz (x)
      0088C3 02 27            [ 1]  220     jrne 2$
      0088C5 08               [ 1]  221     clr a
      0088C6 5C               [ 4]  222     ret 
      0088C7 7B               [ 1]  223 4$: incw x 
      0088C8 01               [ 1]  224     ld a,(x)
      0088C9 43 92            [ 1]  225     cp a,#SUP
      0088CB A7 00            [ 1]  226     jrne 5$
      0088CD 19               [ 1]  227     push a 
      0088CE 72 05 50         [ 4]  228     call getc
      0088D1 5F               [ 1]  229     pop a 
      00099D                        230 5$:
      0088D2 FB               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00099E                        241 puts::
      0088D3 72               [ 1]  242     ld a,(x)
      0088D4 0D 50            [ 1]  243 	jreq 1$
      0088D6 5F FB 41         [ 4]  244 	call putc 
      0088D8 5C               [ 1]  245 	incw x 
      0088D8 5B 02            [ 2]  246 	jra puts 
      0088DA 90               [ 4]  247 1$:	ret 
                                    248 
                                    249 
                                    250 ;---------------------------
                                    251 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                    252 ; of cursor on terminal 
                                    253 ; input:
                                    254 ;   none 
                                    255 ; output:
                                    256 ;	none 
                                    257 ;---------------------------
      0009A8                        258 bksp:
      0088DB 85 81            [ 1]  259 	ld a,#BS 
      0088DD CD 09 41         [ 4]  260 	call putc 
      0088DD 88 52            [ 1]  261 	ld a,#SPACE 
      0088DF 02 1F 01         [ 4]  262 	call putc 
      0088E2 1E 06            [ 1]  263 	ld a,#BS 
      0088E4 27 13 1E         [ 4]  264 	call putc 
      0088E7 01               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0009B8                        274 delete_nchar:
      0088E8 90               [ 1]  275 	push a 
      0088E9 F6 CD            [ 1]  276 0$:	tnz (1,sp)
      0088EB 88 63            [ 1]  277 	jreq 1$
      0088ED 5C 90 5C         [ 4]  278 	call bksp 
      0088F0 1F 01            [ 1]  279 	dec (1,sp)
      0088F2 1E 06            [ 2]  280 	jra 0$
      0088F4 5A               [ 1]  281 1$:	pop a 
      0088F5 1F               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0009C6                        290 send_escape:
      0088F6 06 26            [ 1]  291 	ld a,#ESC 
      0088F8 ED 09 41         [ 4]  292 	call putc 
      0088F9 A6 5B            [ 1]  293 	ld a,#'[
      0088F9 1E 01 CD         [ 4]  294 	call putc 
      0088FC 89               [ 4]  295 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                    307 ; 	A {0..99} 
                                    308 ; output:
                                    309 ;   none 
                                    310 ;---------------------
      0009D1                        311 send_parameter:
      0088FD 33               [ 2]  312 	pushw x 
      0088FE 5B               [ 1]  313 	clrw x 
      0088FF 02               [ 1]  314 	ld xl,a 
      008900 84 81            [ 1]  315 	ld a,#10 
      008902 62               [ 2]  316 	div x,a 
      008902 90               [ 1]  317 	ld xh,a 
      008903 89               [ 1]  318 	ld a,xl
      008904 88               [ 1]  319     tnz a 
      008905 90 93            [ 1]  320     jreq 2$
      008907 5F 09            [ 1]  321 	cp a,#9 
      008908 23 02            [ 2]  322 	jrule 1$
      008908 90 F6            [ 1]  323 	ld a,#9
      0009E2                        324 1$:
      00890A 90 5C            [ 1]  325 	add a,#'0 
      00890C CD 88 63         [ 4]  326 	call putc
      00890F 5C               [ 1]  327 2$:	ld a,xh 
      008910 0A 01            [ 1]  328 	add a,#'0
      008912 26 F4 84         [ 4]  329 	call putc 
      008915 90               [ 2]  330 	popw x 
      008916 85               [ 4]  331 	ret 
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
      0009EF                        344 move_left:
      008917 81               [ 1]  345 	push a 
      008918 CD 09 C6         [ 4]  346 	call send_escape
      008918 A6               [ 1]  347     pop a
      008919 7F C4 00         [ 4]  348 	call send_parameter 
      00891C 1B 27            [ 1]  349 	ld a,#'D 
      00891E 13 CE 00         [ 4]  350 	call putc 
      008921 1A               [ 4]  351 	ret	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0009FD                        362 move_right:
      008922 1C               [ 1]  363 	push a 
      008923 00 80 24         [ 4]  364 	call send_escape
      008926 04               [ 1]  365     pop a
      008927 72 5C 00         [ 4]  366 	call send_parameter 
      00892A 19 9F            [ 1]  367 	ld a,#'C 
      00892C A4 80 97         [ 4]  368 	call putc 
      00892F CF               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      000A0B                        379 spaces::
      008930 00 1A            [ 1]  380 	ld a,#SPACE 
      008932 81               [ 2]  381 1$:	tnzw x
      008933 27 06            [ 1]  382 	jreq 9$
      008933 72 BB 00         [ 4]  383 	call putc 
      008936 1A               [ 2]  384 	decw x
      008937 24 04            [ 2]  385 	jra 1$
      000A16                        386 9$: 
      008939 72               [ 4]  387 	ret 
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
      000A17                        405 insert_char: 
      000A17                        406 	_vars VSIZE 
      00893A 5C 00            [ 2]    1     sub sp,#VSIZE 
      00893C 19 CF            [ 1]  407     ld (KCHAR,sp),a 
      00893E 00               [ 1]  408     ld a,xh 
      00893F 1A 81            [ 1]  409 	ld (IPOS,sp),a
      008941 9F               [ 1]  410     ld a,xl 
      008941 5F 92            [ 1]  411     ld (LLEN,sp),a  
      008943 AF               [ 1]  412     ldw x,y
      008944 00               [ 1]  413     incw x 
      008945 19 26            [ 1]  414     ld a,(LLEN,sp)
      008947 06 5C            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008949 A3               [ 1]  416     inc a 
      00894A 00 80 25         [ 1]  417     ld acc8,a 
      00894D F4 81 00 0D      [ 1]  418     clr acc16
      00894F CD 14 0F         [ 4]  419     call move
      00894F 72 0B 52 30      [ 2]  420     ldw y,#tib 
      008953 27 C6            [ 1]  421     ld a,(IPOS,sp)
      008955 52 31 A1         [ 1]  422     ld acc8,a 
      008958 03 26 06 CD      [ 2]  423     addw y,acc16 
      00895C 89 C1            [ 1]  424     ld a,(KCHAR,sp)
      00895E CC 80            [ 1]  425     ld (y),a
      008960 D7 5C            [ 1]  426     incw y  
      008961 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008961 A1 18 26         [ 4]  428     call move_left
      008964 03 CC 81         [ 2]  429     ldw x,#tib 
      008967 43 88 A6         [ 4]  430     call puts 
      00896A 27 CB            [ 1]  431     ld a,(LLEN,sp)
      00896C 00 30            [ 1]  432     sub a,(IPOS,sp) 
      00896E 5F 97 84         [ 4]  433     call move_left 
      000A57                        434 	_drop VSIZE 
      008971 F7 C6            [ 2]    1     addw sp,#VSIZE 
      008973 00               [ 4]  435 	ret 
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
      000A5A                        448 delete_under:
      000A5A                        449 	_vars VSIZE 
      008974 30 4C            [ 2]    1     sub sp,#VSIZE 
      008976 A4 07            [ 1]  450     ld (LLEN,sp),a 
      008978 C7               [ 1]  451     ld a,xl 
      008979 00 30            [ 1]  452     ld (CPOS,sp),a 
      00897B 80               [ 1]  453     ldw x,y ; move destination
      00897C 90 5C            [ 1]  454     incw y  ; move source 
      00897C 72 1A            [ 1]  455     ld a,(LLEN,sp)
      00897E 50 02            [ 1]  456     sub a,(CPOS,sp)
      008980 72               [ 1]  457     inc a ; move including zero at end.
      008981 1A 50 03         [ 1]  458     ld acc8,a 
      008984 72 1A 50 04      [ 1]  459     clr acc16 
      008988 72 14 50         [ 4]  460 	call move 
      00898B C7 AE 16 68      [ 2]  461     ldw y,#tib 
      00898C 7B 01            [ 1]  462     ld a,(CPOS,sp)
      00898C 88 A6 E1         [ 1]  463     ld acc8,a 
      00898F C1 50 C3 27      [ 2]  464     addw y,acc16 
      008993 0A               [ 1]  465     ldw x,y 
      008994 CD 09 9E         [ 4]  466     call puts 
      008994 35 05            [ 1]  467     ld a,#SPACE  
      008996 52 33 35         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008999 04 52            [ 1]  469     ld a,(LLEN,sp)
      00899B 32 20            [ 1]  470     sub a,(CPOS,sp)
      00899D 08 09 EF         [ 4]  471     call move_left 
      00899E 0A 02            [ 1]  472     dec (LLEN,sp)
      000A92                        473 	_drop VSIZE 
      00899E 35 0B            [ 2]    1     addw sp,#VSIZE 
      0089A0 52               [ 4]  474 	ret 
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
      000A95                        486 delete_line:
      0089A1 33 35 08         [ 4]  487     call send_escape
      0089A4 52 32            [ 1]  488 	ld a,#'2
      0089A6 CD 09 41         [ 4]  489 	call putc 
      0089A6 72 5F            [ 1]  490 	ld a,#'K 
      0089A8 52 31 35         [ 4]  491 	call putc 
      0089AB 2C               [ 4]  492 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                           000004   523 	VSIZE=4 
      000AA3                        524 readln::
      0089AC 52 35            [ 2]  525 	pushw y 
      000AA5                        526 	_vars VSIZE 
      0089AE 72 10            [ 2]    1     sub sp,#VSIZE 
      0089B0 52               [ 1]  527 	clrw x 
      0089B1 35 72            [ 2]  528 	ldw (LL,sp),x 
      0089B3 0D 52            [ 2]  529 	ldw (CPOS,sp),x 
      0089B5 30 FB            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      0089B7 72 5F 00 2F      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000AB2                        532 readln_loop:
      0089BB 72 5F 00         [ 4]  533 	call getc
      0089BE 30 84            [ 1]  534 	ld (RXCHAR,sp),a
      0089C0 81 1B            [ 1]  535     cp a,#ESC 
      0089C1 26 05            [ 1]  536     jrne 0$
      0089C1 CD 09 78         [ 4]  537     call get_escape 
      0089C1 72 0F            [ 1]  538     ld (RXCHAR,sp),a 
      0089C3 52 30            [ 1]  539 0$:	cp a,#CR
      0089C5 FB C7            [ 1]  540 	jrne 1$
      0089C7 52 31 81         [ 2]  541 	jp readln_quit
      0089CA A1 0A            [ 1]  542 1$:	cp a,#LF 
      0089CA 26 03            [ 1]  543 	jrne 2$ 
      0089CA C6 00 2F         [ 2]  544 	jp readln_quit
      000ACE                        545 2$:
      0089CD C0 00            [ 1]  546 	cp a,#BS
      0089CF 30 81            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      0089D1 0D 03            [ 1]  549     tnz (CPOS,sp)
      0089D1 27 DC            [ 1]  550     jreq readln_loop 
      0089D1 CD 89            [ 1]  551     ld a,#1 
      0089D3 CA 27 FB         [ 4]  552     call move_left
      0089D6 89 A6            [ 1]  553     dec (CPOS,sp)
      0089D8 27 CB            [ 2]  554     decw y 
      0089DA 00 2F            [ 1]  555     ld a,(CPOS,sp) 
      0089DC 5F 97 F6         [ 2]  556     jp 12$
      000AE4                        557 3$:
      0089DF 88 C6            [ 1]  558 	cp a,#CTRL_D
      0089E1 00 2F            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      0089E3 4C A4 07         [ 4]  561 	call delete_line 
      0089E6 C7 00            [ 1]  562     ld a,(CPOS,sp)
      0089E8 2F               [ 1]  563     inc a 
      0089E9 84 85 81         [ 4]  564     call move_left 
      0089EC 43 81            [ 1]  565 	ld a,#'> 
      0089EE 44 80 48         [ 4]  566 	call putc 
      0089F1 82 46 83 33      [ 2]  567 	ldw y,#tib
      0089F5 84 00            [ 1]  568 	clr (y)
      0089F7 00 02            [ 1]  569 	clr (LL,sp)
      0089F8 0F 03            [ 1]  570 	clr (CPOS,sp)
      0089F8 CD 89            [ 2]  571 	jra readln_loop
      000B02                        572 4$:
      0089FA D1 A1            [ 1]  573 	cp a,#CTRL_R 
      0089FC 5B 27            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      0089FE 02 4F            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008A00 81 CD            [ 1]  577 	jrne readln_loop
      008A02 89 D1 AE 89      [ 2]  578 	ldw y,#tib 
      008A06 EC               [ 1]  579 	ldw x,y
      008A07 CD 13 E3         [ 4]  580 	call strlen
      008A07 F1               [ 1]  581 	tnz a  
      008A08 27 08            [ 1]  582 	jreq readln_loop
      008A0A 1C 00            [ 1]  583 	ld (LL,sp),a 
      008A0C 02 7D            [ 1]  584     ld (CPOS,sp),a
      008A0E 26               [ 1]  585 	ldw x,y  
      008A0F F7 4F 81         [ 4]  586 	call puts
      008A12 5C F6            [ 1]  587 	clr (LL_HB,sp)
      008A14 A1 84 26         [ 2]  588 	addw y,(LL_HB,sp)
      008A17 05 88            [ 2]  589 	jra readln_loop 
      000B24                        590 5$:
      008A19 CD 89            [ 1]  591 	cp a,#CTRL_E 
      008A1B D1 84            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008A1D AE 16 68         [ 2]  594 	ldw x,#tib 
      008A1D 81 18 97         [ 4]  595 	call atoi24
      008A1E CE 00 0D         [ 2]  596 	ldw x,acc16
      008A1E F6 27 06         [ 4]  597 	call search_lineno
      008A21 CD               [ 2]  598 	tnzw x 
      008A22 89 C1            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008A24 5C 20 F7         [ 2]  603 	jp readln_quit  
      000B3A                        604 51$:
      008A27 81 00 04         [ 2]  605 	ldw basicptr,x
      008A28 E6 02            [ 1]  606 	ld a,(2,x)
      008A28 A6 08 CD         [ 1]  607 	ld count,a 
      008A2B 89 C1 A6 20      [ 2]  608 	ldw y,#tib 
      008A2F CD 89 C1         [ 4]  609 	call decompile 
      008A32 A6 08            [ 1]  610 	clr (LL_HB,sp)
      008A34 CD 89            [ 1]  611 	ld a,#CR 
      008A36 C1 81 41         [ 4]  612 	call putc 
      008A38 A6 3E            [ 1]  613 	ld a,#'>
      008A38 88 0D 01         [ 4]  614 	call putc
      008A3B 27 07 CD         [ 2]  615     ldw x,#tib  
      008A3E 8A 28 0A         [ 4]  616 	call strlen 
      008A41 01 20            [ 1]  617 	ld (LL,sp),a 
      008A43 F5 84 81         [ 4]  618 	call puts 
      008A46 90 93            [ 1]  619 	ldw y,x
      008A46 A6 1B            [ 1]  620     ld a,(LL,sp)
      008A48 CD 89            [ 1]  621     ld (CPOS,sp),a  
      008A4A C1 A6 5B         [ 2]  622 	jp readln_loop
      000B69                        623 6$:
      008A4D CD 89            [ 1]  624 	cp a,#ARROW_RIGHT
      008A4F C1 81            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A51 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008A51 89 5F            [ 1]  628     cp a,(LL,sp)
      008A53 97 A6            [ 1]  629     jrmi 61$
      008A55 0A 62 95         [ 2]  630     jp readln_loop 
      000B76                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008A58 9F 4D            [ 1]  632     ld a,#1 
      008A5A 27 0B A1         [ 4]  633 	call move_right 
      008A5D 09 23            [ 1]  634 	inc (CPOS,sp)
      008A5F 02 A6            [ 1]  635     incw y 
      008A61 09 0A B2         [ 2]  636     jp readln_loop 
      008A62 A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A62 AB 30            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A64 CD 89            [ 1]  640 	tnz (CPOS,sp)
      008A66 C1 9E            [ 1]  641 	jrne 71$
      008A68 AB 30 CD         [ 2]  642 	jp readln_loop
      000B8D                        643 71$:
      008A6B 89 C1            [ 1]  644     ld a,#1 
      008A6D 85 81 EF         [ 4]  645 	call move_left 
      008A6F 0A 03            [ 1]  646 	dec (CPOS,sp)
      008A6F 88 CD            [ 2]  647     decw y 
      008A71 8A 46 84         [ 2]  648 	jp readln_loop 
      008A74 CD 8A            [ 1]  649 8$: cp a,#HOME  
      008A76 51 A6            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A78 44 CD            [ 1]  652     ld a,(CPOS,sp)
      008A7A 89 C1 81         [ 4]  653     call move_left 
      008A7D 0F 03            [ 1]  654 	clr (CPOS,sp)
      008A7D 88 CD 8A 46      [ 2]  655     ldw y,#tib 
      008A81 84 CD 8A         [ 2]  656 	jp readln_loop  
      008A84 51 A6            [ 1]  657 9$: cp a,#KEY_END  
      008A86 43 CD            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A88 89 C1            [ 1]  660 	ld a,(CPOS,sp)
      008A8A 81 02            [ 1]  661 	cp a,(LL,sp)
      008A8B 26 03            [ 1]  662 	jrne 91$
      008A8B A6 20 5D         [ 2]  663 	jp readln_loop 
      000BB8                        664 91$:
      008A8E 27 06            [ 1]  665 	ld a,(LL,sp)
      008A90 CD 89            [ 1]  666 	sub a,(CPOS,sp)
      008A92 C1 5A 20         [ 4]  667 	call move_right 
      008A95 F7 02            [ 1]  668 	ld a,(LL,sp)
      008A96 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008A96 81 AE 16 68      [ 2]  670     ldw y,#tib
      008A97 72 5F 00 0D      [ 1]  671     clr acc16 
      008A97 52 03 6B         [ 1]  672     ld acc8,a 
      008A9A 02 9E 6B 01      [ 2]  673     addw y,acc16  
      008A9E 9F 6B 03         [ 2]  674 	jp readln_loop 
      008AA1 93 5C            [ 1]  675 10$: cp a,#CTRL_O
      008AA3 7B 03            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008AA5 10 01            [ 1]  678 	cpl (OVRWR,sp)
      008AA7 4C C7 00         [ 4]  679 	call beep_1khz
      008AAA 0F 72 5F         [ 2]  680 	jp readln_loop 
      008AAD 00 0E            [ 1]  681 11$: cp a,#SUP 
      008AAF CD 94            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008AB1 8F 90            [ 1]  684     ld a,(CPOS,sp)
      008AB3 AE 16            [ 1]  685     cp a,(LL,sp)
      008AB5 68 7B            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      000BEB                        687 12$:
      008AB7 01               [ 1]  688     ld xl,a    ; cursor position 
      008AB8 C7 00            [ 1]  689     ld a,(LL,sp)  ; line length
      008ABA 0F 72 B9         [ 4]  690     call delete_under
      008ABD 00 0E            [ 1]  691     dec (LLEN,sp)
      000BF3                        692 13$:
      008ABF 7B 02 90         [ 2]  693     jp readln_loop 
      000BF6                        694 final_test:
      008AC2 F7 90            [ 1]  695 	cp a,#SPACE
      008AC4 5C 7B            [ 1]  696 	jrpl accept_char
      008AC6 01 CD 8A         [ 2]  697 	jp readln_loop
      000BFD                        698 accept_char:
      008AC9 6F AE            [ 1]  699 	ld a,#TIB_SIZE-1
      008ACB 16 68            [ 1]  700 	cp a, (LL,sp)
      008ACD CD 8A            [ 1]  701 	jrpl 1$
      008ACF 1E 7B 03         [ 2]  702 	jp readln_loop
      008AD2 10 01            [ 1]  703 1$:	tnz (OVRWR,sp)
      008AD4 CD 8A            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008AD6 6F 5B            [ 1]  706     ld a,(CPOS,sp)
      008AD8 03 81            [ 1]  707     cp a,(LL,sp)
      008ADA 27 12            [ 1]  708     jreq overwrite
      008ADA 52 02            [ 1]  709     ld a,(LL,sp)
      008ADC 6B               [ 1]  710     ld xl,a 
      008ADD 02 9F            [ 1]  711     ld a,(CPOS,sp)
      008ADF 6B               [ 1]  712     ld xh,a
      008AE0 01 93            [ 1]  713     ld a,(RXCHAR,sp)
      008AE2 90 5C 7B         [ 4]  714     call insert_char
      008AE5 02 10            [ 1]  715     inc (LLEN,sp)
      008AE7 01 4C            [ 1]  716     inc (CPOS,sp)	
      008AE9 C7 00 0F         [ 2]  717     jp readln_loop 
      000C22                        718 overwrite:
      008AEC 72 5F            [ 1]  719 	ld a,(RXCHAR,sp)
      008AEE 00 0E            [ 1]  720 	ld (y),a
      008AF0 CD 94            [ 1]  721     incw y
      008AF2 8F 90 AE         [ 4]  722     call putc 
      008AF5 16 68            [ 1]  723 	ld a,(CPOS,sp)
      008AF7 7B 01            [ 1]  724 	cp a,(LL,sp)
      008AF9 C7 00            [ 1]  725 	jrmi 1$
      008AFB 0F 72            [ 1]  726 	clr (y)
      008AFD B9 00            [ 1]  727 	inc (LL,sp)
      008AFF 0E 93            [ 1]  728     inc (CPOS,sp)
      008B01 CD 8A 1E         [ 2]  729 	jp readln_loop 
      000C3A                        730 1$:	
      008B04 A6 20            [ 1]  731 	inc (CPOS,sp)
      008B06 CD 89 C1         [ 2]  732 	jp readln_loop 
      000C3F                        733 readln_quit:
      008B09 7B 02 10 01      [ 2]  734 	ldw y,#tib
      008B0D CD 8A            [ 1]  735     clr (LL_HB,sp) 
      008B0F 6F 0A 02         [ 2]  736     addw y,(LL_HB,sp)
      008B12 5B 02            [ 1]  737     clr (y)
      008B14 81 02            [ 1]  738 	ld a,(LL,sp)
      008B15 C7 00 03         [ 1]  739 	ld count,a 
      008B15 CD 8A            [ 1]  740 	ld a,#CR
      008B17 46 A6 32         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      000C54                        742 	_drop VSIZE 
      008B1A CD 89            [ 2]    1     addw sp,#VSIZE 
      008B1C C1 A6            [ 2]  743 	popw y 
      008B1E 4B               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000C59                        752 print_hex::
      008B1F CD               [ 1]  753 	push a 
      008B20 89               [ 1]  754 	swap a 
      008B21 C1 81 70         [ 4]  755 	call to_hex_char 
      008B23 CD 09 41         [ 4]  756 	call putc 
      008B23 90 89            [ 1]  757     ld a,(1,sp) 
      008B25 52 04 5F         [ 4]  758 	call to_hex_char
      008B28 1F 02 1F         [ 4]  759 	call putc
      008B2B 03 03            [ 1]  760 	ld a,#SPACE 
      008B2D 04 90 AE         [ 4]  761 	call putc 
      008B30 16               [ 1]  762 	pop a 
      008B31 68               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008B32                        772 to_hex_char::
      008B32 CD 89            [ 1]  773 	and a,#15 
      008B34 D1 6B            [ 1]  774 	cp a,#9 
      008B36 01 A1            [ 2]  775 	jrule 1$ 
      008B38 1B 26            [ 1]  776 	add a,#7
      008B3A 05 CD            [ 1]  777 1$: add a,#'0 
      008B3C 89               [ 4]  778 	ret 
                                    779 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
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
      000C7B                         51 search_lineno::
      000C7B                         52 	_vars VSIZE
      008B3D F8 6B            [ 2]    1     sub sp,#VSIZE 
      008B3F 01 A1            [ 1]   53 	clr (LL,sp)
      008B41 0D 26 03 CC      [ 2]   54 	ldw y,txtbgn
      008B45 8C               [ 1]   55 	tnz a 
      008B46 BF A1            [ 1]   56 	jreq search_ln_loop
      008B48 0A 26 03 CC      [ 2]   57 	ldw y,basicptr 
      000C8A                         58 search_ln_loop:
      008B4C 8C BF 00 1D      [ 2]   59 	cpw y,txtend 
      008B4E 2A 10            [ 1]   60 	jrpl 8$
      008B4E A1 08            [ 1]   61 	cpw x,(y)
      008B50 26 12            [ 1]   62 	jreq 9$
      008B52 0D 03            [ 1]   63 	jrmi 8$ 
      008B54 27 DC A6         [ 1]   64 	ld a,(2,y)
      008B57 01 CD            [ 1]   65 	ld (LB,sp),a 
      008B59 8A 6F 0A         [ 2]   66 	addw y,(LL,sp)
      008B5C 03 90            [ 2]   67 	jra search_ln_loop 
      000CA0                         68 8$: 
      008B5E 5A               [ 1]   69 	clrw x 	
      008B5F 7B               [ 1]   70 	exgw x,y 
      000CA2                         71 9$: _drop VSIZE
      008B60 03 CC            [ 2]    1     addw sp,#VSIZE 
      008B62 8C               [ 1]   72 	exgw x,y   
      008B63 6B               [ 4]   73 	ret 
                                     74 
                                     75 ;-------------------------------------
                                     76 ; delete line at addr
                                     77 ; input:
                                     78 ;   X 		addr of line i.e DEST for move 
                                     79 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           000001    80 	LLEN=1
                           000003    81 	SRC=3
                           000004    82 	VSIZE=4
      008B64                         83 del_line: 
      000CA6                         84 	_vars VSIZE 
      008B64 A1 04            [ 2]    1     sub sp,#VSIZE 
      008B66 26 1A            [ 1]   85 	ld a,(2,x) ; line length
      008B68 CD 8B            [ 1]   86 	ld (LLEN+1,sp),a 
      008B6A 15 7B            [ 1]   87 	clr (LLEN,sp)
      008B6C 03 4C            [ 1]   88 	ldw y,x  
      008B6E CD 8A 6F         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B71 A6 3E            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B73 CD 89 C1 90      [ 2]   91 	ldw y,txtend 
      008B77 AE 16 68         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B7A 90 7F 0F 02      [ 2]   93 	ldw acc16,y 
      008B7E 0F 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B80 20 B0 0F         [ 4]   95 	call move
      008B82 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008B82 A1 12 26         [ 2]   97 	subw y,(LLEN,sp)
      008B85 1E 0D 02 26      [ 2]   98 	ldw txtend,y  
      000CD0                         99 	_drop VSIZE     
      008B89 A8 90            [ 2]    1     addw sp,#VSIZE 
      008B8B AE               [ 4]  100 	ret 
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
      000CD3                        115 create_gap:
      000CD3                        116 	_vars VSIZE
      008B8C 16 68            [ 2]    1     sub sp,#VSIZE 
      008B8E 93 CD            [ 2]  117 	ldw (SRC,sp),x 
      008B90 94 63            [ 2]  118 	ldw (LEN,sp),y 
      008B92 4D 27 9D 6B      [ 2]  119 	ldw acc16,y 
      008B96 02 6B            [ 1]  120 	ldw y,x ; SRC
      008B98 03 93 CD 8A      [ 2]  121 	addw x,acc16  
      008B9C 1E 0F            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B9E 01 72 F9         [ 2]  124 	ldw x,txtend 
      008BA1 01 20 8E         [ 2]  125 	subw x,(SRC,sp)
      008BA4 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      008BA4 A1 05            [ 2]  127 	ldw x,(DEST,sp) 
      008BA6 26 41 AE         [ 4]  128 	call move
      008BA9 16 68 CD         [ 2]  129 	ldw x,txtend
      008BAC 99 17 CE         [ 2]  130 	addw x,(LEN,sp)
      008BAF 00 0E CD         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      000CFC                        132 9$:	_drop VSIZE 
      008BB2 8C FB            [ 2]    1     addw sp,#VSIZE 
      008BB4 5D               [ 4]  133 	ret 
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
      000CFF                        150 insert_line:
      000CFF                        151 	_vars VSIZE 
      008BB5 26 03            [ 2]    1     sub sp,#VSIZE 
      008BB7 CC 8C BF         [ 2]  152 	ldw x,txtend  
      008BBA C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008BBA CF 00            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BBC 05 E6 02         [ 2]  156 	ldw x,#2 
      008BBF C7 00 04 90      [ 4]  157 	ld a,([ptr16],x)
      008BC3 AE 16            [ 1]  158 	cp a,#3
      008BC5 68 CD            [ 1]  159 	jreq insert_ln_exit
      008BC7 92               [ 1]  160 	clrw x 
      008BC8 79               [ 1]  161 	ld xl,a
      008BC9 0F 01            [ 2]  162 	ldw (LLEN,sp),x 
      008BCB A6 0D CD         [ 2]  163 	ldw x,txtbgn
      008BCE 89 C1            [ 2]  164 	ldw (DEST,sp),x 
      008BD0 A6 3E CD         [ 2]  165 	ldw x,txtend 
      008BD3 89 C1            [ 2]  166 	jra 4$
      008BD5 AE 16 68 CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BD9 94 63            [ 2]  169 	ldw (LINENO,sp),x 
      008BDB 6B 02 CD         [ 2]  170 	ldw x,#2 
      008BDE 8A 1E 90 93      [ 4]  171 	ld a,([ptr16],x)
      008BE2 7B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BE3 02 6B            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BE5 03 CC            [ 2]  176 	ldw x,(LINENO,sp)
      008BE7 8B               [ 1]  177 	clr a 
      008BE8 32 0C 7B         [ 4]  178 	call search_lineno 
      008BE9 5D               [ 2]  179 	tnzw x 
      008BE9 A1 81            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BEB 26 15            [ 2]  183 	ldw (DEST,sp),y 
      008BED 7B 03            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BEF 11 02            [ 2]  187 2$: ldw (DEST,sp),x 
      008BF1 2B 03 CC         [ 4]  188 	call del_line
      000D44                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BF4 8B 32            [ 1]  192 	ld a,#3
      008BF6 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008BF6 A6 01            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BF8 CD 8A            [ 2]  197 	ldw x,(DEST,sp)
      008BFA 7D 0C 03         [ 2]  198 	cpw x,txtend 
      008BFD 90 5C            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BFF CC 8B            [ 2]  202 	ldw x,(DEST,sp)
      008C01 32 A1            [ 2]  203 	ldw y,(LLEN,sp)
      008C03 80 26 13         [ 4]  204 	call create_gap
      008C06 0D 03            [ 2]  205 	jra 5$
      000D5A                        206 4$: 
      008C08 26 03 CC         [ 2]  207 	addw x,(LLEN,sp)
      008C0B 8B 32 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008C0D 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008C0D A6 01 CD         [ 2]  211 	ldw acc16,x 
      008C10 8A 6F 0A 03      [ 2]  212 	ldw y,#pad ;SRC 
      008C14 90 5A            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008C16 CC 8B 32         [ 4]  214 	call move 
      000D6E                        215 insert_ln_exit:	
      000D6E                        216 	_drop VSIZE
      008C19 A1 82            [ 2]    1     addw sp,#VSIZE 
      008C1B 26               [ 4]  217 	ret
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
      000D71                        233 parse_quote: 
      000D71                        234 	_vars VSIZE 
      008C1C 0E 7B            [ 2]    1     sub sp,#VSIZE 
      008C1E 03               [ 1]  235 	clr a
      008C1F CD 8A            [ 1]  236 1$:	ld (PREV,sp),a 
      000D76                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008C21 6F 0F 03         [ 4]  238 	ld a,([in.w],y)
      008C24 90 AE            [ 1]  239 	jreq 6$
      008C26 16 68 CC 8B      [ 1]  240 	inc in 
      008C2A 32 A1            [ 1]  241 	ld (CURR,sp),a 
      008C2C 83 26            [ 1]  242 	ld a,#'\
      008C2E 26 7B            [ 1]  243 	cp a, (PREV,sp)
      008C30 03 11            [ 1]  244 	jrne 3$
      008C32 02 26            [ 1]  245 	clr (PREV,sp)
      008C34 03 CC            [ 1]  246 	ld a,(CURR,sp)
      008C36 8B 32            [ 4]  247 	callr convert_escape
      008C38 F7               [ 1]  248 	ld (x),a 
      008C38 7B               [ 1]  249 	incw x 
      008C39 02 10            [ 2]  250 	jra 2$
      000D91                        251 3$:
      008C3B 03 CD            [ 1]  252 	ld a,(CURR,sp)
      008C3D 8A 7D            [ 1]  253 	cp a,#'\'
      008C3F 7B 02            [ 1]  254 	jreq 1$
      008C41 6B 03            [ 1]  255 	cp a,#'"
      008C43 90 AE            [ 1]  256 	jreq 6$ 
      008C45 16               [ 1]  257 	ld (x),a 
      008C46 68               [ 1]  258 	incw x 
      008C47 72 5F            [ 2]  259 	jra 2$
      000D9F                        260 6$:
      008C49 00               [ 1]  261 	clr (x)
      008C4A 0E               [ 1]  262 	incw x 
      008C4B C7 00            [ 1]  263 	ldw y,x 
      008C4D 0F               [ 1]  264 	clrw x 
      008C4E 72 B9            [ 1]  265 	ld a,#TK_QSTR  
      000DA6                        266 	_drop VSIZE
      008C50 00 0E            [ 2]    1     addw sp,#VSIZE 
      008C52 CC               [ 4]  267 	ret 
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
      000DA9                        278 convert_escape:
      008C53 8B               [ 2]  279 	pushw x 
      008C54 32 A1 0F         [ 2]  280 	ldw x,#escaped 
      008C57 26               [ 1]  281 1$:	cp a,(x)
      008C58 08 03            [ 1]  282 	jreq 2$
      008C5A 04               [ 1]  283 	tnz (x)
      008C5B CD A5            [ 1]  284 	jreq 3$
      008C5D FC               [ 1]  285 	incw x 
      008C5E CC 8B            [ 2]  286 	jra 1$
      008C60 32 A1 84         [ 2]  287 2$: subw x,#escaped 
      008C63 26               [ 1]  288 	ld a,xl 
      008C64 11 7B            [ 1]  289 	add a,#7
      008C66 03               [ 2]  290 3$:	popw x 
      008C67 11               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    292 
      008C68 02 2A 08 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008C6B                        310 parse_integer: ; { -- n }
      008C6B 97               [ 2]  311 	pushw x 	
      008C6C 7B 02            [ 1]  312 	push #0 ; TCHAR
      008C6E CD 8A            [ 1]  313 	push #10 ; BASE=10
      008C70 DA 0A            [ 1]  314 	cp a,#'$
      008C72 02 04            [ 1]  315 	jrne 2$ 
      008C73                        316     _drop #1
      008C73 CC 8B            [ 2]    1     addw sp,##1 
      008C75 32 10            [ 1]  317 	push #16  ; BASE=16
      008C76 F7               [ 1]  318 2$:	ld (x),a 
      008C76 A1               [ 1]  319 	incw x 
      008C77 20 2A 03         [ 4]  320 	ld a,([in.w],y)
      008C7A CC 8B 32 01      [ 1]  321 	inc in 
      008C7D CD 18 8B         [ 4]  322 	call to_upper 
      008C7D A6 4F            [ 1]  323 	ld (TCHAR,sp),a 
      008C7F 11 02 2A         [ 4]  324 	call is_digit 
      008C82 03 CC            [ 1]  325 	jrc 2$
      008C84 8B 32            [ 1]  326 	ld a,#16 
      008C86 0D 04            [ 1]  327 	cp a,(BASE,sp)
      008C88 26 18            [ 1]  328 	jrne 3$ 
      008C8A 7B 03            [ 1]  329 	ld a,(TCHAR,sp)
      008C8C 11 02            [ 1]  330 	cp a,#'A 
      008C8E 27 12            [ 1]  331 	jrmi 3$ 
      008C90 7B 02            [ 1]  332 	cp a,#'G 
      008C92 97 7B            [ 1]  333 	jrmi 2$ 
      008C94 03 95 7B 01      [ 1]  334 3$: dec in 	
      008C98 CD               [ 1]  335     clr (x)
      008C99 8A 97            [ 2]  336 	ldw x,(XSAVE,sp)
      008C9B 0C 02 0C         [ 4]  337 	call atoi24
      008C9E 03 CC            [ 1]  338 	ldw y,x
      008CA0 8B 32 0C         [ 1]  339 	ld a,acc24 
      008CA2 90 F7            [ 1]  340 	ld (y),a 
      008CA2 7B 01            [ 1]  341 	incw y  
      008CA4 90 F7 90         [ 2]  342 	ldw x,acc16 
      008CA7 5C CD            [ 2]  343 	ldw (y),x 
      008CA9 89 C1 7B 03      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008CAD 11 02            [ 1]  345 	ld a,#TK_INTGR
      000E14                        346 	_drop VSIZE  
      008CAF 2B 09            [ 2]    1     addw sp,#VSIZE 
      008CB1 90               [ 4]  347 	ret 	
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
      000E17                        364 parse_binary: ; { -- n }
      008CB2 7F 0C            [ 1]  365 	push #0
      008CB4 02 0C            [ 1]  366 	push #0
      008CB6 03 CC            [ 1]  367 	push #0
      000E1D                        368 2$:	
      008CB8 8B 32 00         [ 4]  369 	ld a,([in.w],y)
      008CBA 72 5C 00 01      [ 1]  370 	inc in 
      008CBA 0C 03            [ 1]  371 	cp a,#'0 
      008CBC CC 8B            [ 1]  372 	jreq 3$
      008CBE 32 31            [ 1]  373 	cp a,#'1 
      008CBF 27 02            [ 1]  374 	jreq 3$ 
      008CBF 90 AE            [ 2]  375 	jra bin_exit 
      008CC1 16 68            [ 1]  376 3$: sub a,#'0 
      008CC3 0F               [ 1]  377 	rrc a
      008CC4 01 72            [ 1]  378 	rlc (BINARY+2,sp) 
      008CC6 F9 01            [ 1]  379 	rlc (BINARY+1,sp)
      008CC8 90 7F            [ 1]  380 	rlc (BINARY,sp) 
      008CCA 7B 02            [ 2]  381 	jra 2$  
      000E39                        382 bin_exit:
      008CCC C7 00 04 A6      [ 1]  383 	dec in 
      008CD0 0D CD            [ 1]  384 	ldw y,x
      008CD2 89 C1            [ 1]  385 	ld a,(BINARY,sp)
      008CD4 5B 04            [ 1]  386 	ld (y),a 
      008CD6 90 85            [ 1]  387 	incw y 
      008CD8 81 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CD9 90 FF            [ 2]  389 	ldw (y),x 
      008CD9 88 4E CD 8C      [ 2]  390 	addw y,#2  
      008CDD F0 CD            [ 1]  391 	ld a,#TK_INTGR 	
      000E4F                        392 	_drop VSIZE 
      008CDF 89 C1            [ 2]    1     addw sp,#VSIZE 
      008CE1 7B               [ 4]  393 	ret
                                    394 
                                    395 ;-------------------------------------
                                    396 ; check if A is a letter 
                                    397 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    398 ;   A 			character to test 
                                    399 ; output:
                                    400 ;   C flag      1 true, 0 false 
                                    401 ;-------------------------------------
      000E52                        402 is_alpha::
      008CE2 01 CD            [ 1]  403 	cp a,#'A 
      008CE4 8C               [ 1]  404 	ccf 
      008CE5 F0 CD            [ 1]  405 	jrnc 9$ 
      008CE7 89 C1            [ 1]  406 	cp a,#'Z+1 
      008CE9 A6 20            [ 1]  407 	jrc 9$ 
      008CEB CD 89            [ 1]  408 	cp a,#'a 
      008CED C1               [ 1]  409 	ccf 
      008CEE 84 81            [ 1]  410 	jrnc 9$
      008CF0 A1 7B            [ 1]  411 	cp a,#'z+1
      008CF0 A4               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E63                        421 is_digit::
      008CF1 0F A1            [ 1]  422 	cp a,#'0
      008CF3 09 23            [ 1]  423 	jrc 1$
      008CF5 02 AB            [ 1]  424     cp a,#'9+1
      008CF7 07               [ 1]  425 	ccf 
      008CF8 AB               [ 1]  426 1$:	ccf 
      008CF9 30               [ 4]  427     ret
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
      000E6C                        438 is_alnum::
      008CFA 81 0E 63         [ 4]  439 	call is_digit
      008CFB 25 03            [ 1]  440 	jrc 1$ 
      008CFB 52 02 0F         [ 4]  441 	call is_alpha
      008CFE 01               [ 4]  442 1$:	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      000E75                        453 is_symbol_char: 
      008CFF 90 CE            [ 1]  454 	cp a,#'_ 
      008D01 00 1C            [ 1]  455 	jrne 1$
      008D03 4D               [ 1]  456 	scf 
      008D04 27 04            [ 2]  457 	jra 9$ 
      008D06 90 CE 00         [ 4]  458 1$:	call is_alnum 
      008D09 05               [ 4]  459 9$: ret 
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
      008D0A                        473 parse_symbol:
      008D0A 90               [ 1]  474 	incw x ; keep space for TK_ID 
      000E81                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008D0B C3 00 1E         [ 4]  477 	call to_upper  
      008D0E 2A               [ 1]  478 	ld (x), a 
      008D0F 10               [ 1]  479 	incw x
      008D10 90 F3 27         [ 4]  480 	ld a,([in.w],y)
      008D13 0E 2B 0A 90      [ 1]  481 	inc in 
      008D17 E6 02 6B         [ 4]  482 	call is_symbol_char 
      008D1A 02 72            [ 1]  483 	jrc symb_loop 
      008D1C F9               [ 1]  484 	clr (x)
      008D1D 01 20 EA 01      [ 1]  485 	dec in  
      008D20 81               [ 4]  486 	ret 
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
      000E98                        502 parse_keyword: 
      008D20 5F               [ 2]  503 	pushw x ; preserve *symbol 
      008D21 51 5B 02         [ 4]  504 	call parse_symbol
      008D24 51 81            [ 2]  505 	ldw x,(XFIRST,sp) 
      008D26 E6 02            [ 1]  506 	ld a,(2,x)
      008D26 52 04            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008D28 E6 02            [ 1]  509 	ld a,(1,x) 
      008D2A 6B 02            [ 1]  510 	sub a,#'A 
      008D2C 0F 01 90         [ 2]  511 	ldw x,#3 
      008D2F 93               [ 4]  512 	mul x,a 
      008D30 72 F9 01         [ 2]  513 	addw x,#vars 
      008D33 17 03            [ 1]  514 	ld a,#TK_VAR 
      008D35 90 CE            [ 2]  515 	jra 4$ 
      000EB1                        516 2$: ; check for keyword, otherwise syntax error.
      000EB1                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D37 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D3A F2 03            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D3C 90 CF            [ 1]  519 	incw y 
      008D3E 00 0E 16         [ 4]  520 	call search_dict
      008D41 03               [ 1]  521 	tnz a
      008D42 CD 94            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D44 8F 90            [ 2]  525 	ldw y,(XFIRST,sp)
      008D46 CE 00            [ 1]  526 	ld a,#TK_LABEL 
      008D48 1E 72            [ 1]  527 	ld (y),a 
      008D4A F2 01            [ 1]  528 	incw y
      008D4C 90               [ 1]  529 	ldw x,y 
      008D4D CF 00 1E         [ 4]  530 	call strlen
      008D50 5B 04            [ 1]  531 	cp a,#15 
      008D52 81 02            [ 2]  532 	jrule 22$ 
      008D53 A6 0F            [ 1]  533 	ld a,#15
      000ED0                        534 22$:	
      008D53 52               [ 1]  535 	push a 
      000ED1                        536 24$:
      008D54 06 1F            [ 1]  537     ld a,(y)
      008D56 03 17            [ 1]  538 	jreq 3$
      008D58 05 90            [ 1]  539 	incw y
      008D5A CF 00            [ 1]  540 	dec (1,sp) 
      008D5C 0E 90            [ 1]  541 	jrne 24$
      008D5E 93               [ 1]  542 	clr a 
      008D5F 72 BB            [ 1]  543 	ld (y),a 
      008D61 00 0E            [ 1]  544 3$: incw y 
      000EE0                        545 	_drop 1 
      008D63 1F 01            [ 2]    1     addw sp,#1 
      008D65 CE 00            [ 1]  546 	ld a,#TK_LABEL 
      008D67 1E               [ 1]  547 	clrw x 	
      008D68 72 F0            [ 2]  548 	jra 5$ 
      000EE7                        549 4$:	
      008D6A 03 CF            [ 2]  550 	ldw y,(XFIRST,sp)
      008D6C 00 0E            [ 1]  551 	cp a,#TK_NOT 
      008D6E 1E 01            [ 1]  552 	jrmi 41$
      008D70 CD 94            [ 1]  553 	ld (y),a 
      008D72 8F CE            [ 1]  554 	incw y 
      008D74 00 1E            [ 2]  555 	jra 5$ 
      000EF3                        556 41$:	
      008D76 72 FB 05         [ 2]  557 	cpw x,#LET_IDX 
      008D79 CF 00            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D7B 1E 5B            [ 1]  559 	ld (y),a 
      008D7D 06 81            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008D7F 90 FF            [ 2]  561 	ldw (y),x
      008D7F 52 08 CE 00      [ 2]  562 	addw y,#2  
      000F02                        563 5$:	_drop VSIZE 
      008D83 1E C3            [ 2]    1     addw sp,#VSIZE 
      008D85 00               [ 4]  564 	ret  	
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
      000F05                        575 skip:
      008D86 1C               [ 1]  576 	push a
      008D87 26 19 AE         [ 4]  577 1$:	ld a,([in.w],y)
      008D8A 00 02            [ 1]  578 	jreq 2$
      008D8C 72 D6            [ 1]  579 	cp a,(C,sp)
      008D8E 00 1A            [ 1]  580 	jrne 2$
      008D90 A1 03 27 5A      [ 1]  581 	inc in
      008D94 5F 97            [ 2]  582 	jra 1$
      000F15                        583 2$: _drop 1 
      008D96 1F 07            [ 2]    1     addw sp,#1 
      008D98 CE               [ 4]  584 	ret
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
      000F18                        609 get_token:: 
      000F18                        610 	_vars VSIZE
      008D99 00 1C            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000F1A                        616 0$: 
      008D9B 1F 01 CE 00      [ 2]  617 	ldw y,#tib    	
      008D9F 1E 20            [ 1]  618 	ld a,#SPACE
      008DA1 38 72 CE         [ 4]  619 	call skip
      008DA4 00 1A 1F 05 AE   [ 1]  620 	mov in.saved,in 
      008DA9 00 02 72         [ 4]  621 	ld a,([in.w],y)
      008DAC D6 00            [ 1]  622 	jrne 1$
      008DAE 1A 97            [ 1]  623 	ldw y,x 
      008DB0 1F 07 1E         [ 2]  624 	jp token_exit ; end of line 
      008DB3 05 4F CD 8C      [ 1]  625 1$:	inc in 
      008DB7 FB 5D 26         [ 4]  626 	call to_upper 
      008DBA 04 17            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F3B                        629 str_tst:  	
      000F3B                        630 	_case '"' nbr_tst
      008DBC 01 20            [ 1]    1 	ld a,#'"' 
      008DBE 05 1F            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC0 01 CD            [ 1]    3 	jrne nbr_tst
      008DC2 8D 26            [ 1]  631 	ld a,#TK_QSTR
      008DC4 F7               [ 1]  632 	ld (x),a 
      008DC4 A6               [ 1]  633 	incw x 
      008DC5 03 11 08         [ 4]  634 	call parse_quote
      008DC8 27 24 1E         [ 2]  635 	jp token_exit
      000F4B                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008DCB 01 C3            [ 1]  638 	ld a,#'$'
      008DCD 00 1E            [ 1]  639 	cp a,(TCHAR,sp) 
      008DCF 27 09            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DD1 1E 01            [ 1]  642 	ld a,#'&
      008DD3 16 07            [ 1]  643 	cp a,(TCHAR,sp)
      008DD5 CD 8D            [ 1]  644 	jrne 0$
      008DD7 53 20            [ 1]  645 	ld a,#TK_INTGR
      008DD9 06               [ 1]  646 	ld (x),a 
      008DDA 5C               [ 1]  647 	incw x 
      008DDA 72 FB 07         [ 4]  648 	call parse_binary ; expect binary integer 
      008DDD CF 00 1E         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DE0 1E 07            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DE2 CF 00 0E         [ 4]  652 	call is_digit
      008DE5 90 AE            [ 1]  653 	jrnc 3$
      008DE7 16 B8            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DE9 1E               [ 1]  655 	ld (x),a 
      008DEA 01               [ 1]  656 	incw x 
      008DEB CD 94            [ 1]  657 	ld a,(TCHAR,sp)
      008DED 8F 0D C6         [ 4]  658 	call parse_integer 
      008DEE CC 10 C9         [ 2]  659 	jp token_exit 
      000F74                        660 3$: 
      000F74                        661 	_case '(' bkslsh_tst 
      008DEE 5B 08            [ 1]    1 	ld a,#'(' 
      008DF0 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF1 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008DF1 52 02            [ 1]  662 	ld a,#TK_LPAREN
      008DF3 4F 6B 01         [ 2]  663 	jp token_char   	
      008DF6                        664 bkslsh_tst: ; character token 
      000F7F                        665 	_case '\',rparnt_tst
      008DF6 91 D6            [ 1]    1 	ld a,#'\' 
      008DF8 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFA 24 72            [ 1]    3 	jrne rparnt_tst
      008DFC 5C 00            [ 1]  666 	ld a,#TK_CHAR 
      008DFE 02               [ 1]  667 	ld (x),a 
      008DFF 6B               [ 1]  668 	incw x 
      008E00 02 A6 5C         [ 4]  669 	ld a,([in.w],y)
      008E03 11               [ 1]  670 	ld (x),a 
      008E04 01               [ 1]  671 	incw x
      008E05 26 0A            [ 1]  672 	ldw y,x 	 
      008E07 0F 01 7B 02      [ 1]  673 	inc in  
      008E0B AD               [ 1]  674 	clrw x 
      008E0C 1C               [ 1]  675 	ld xl,a 
      008E0D F7 5C            [ 1]  676 	ld a,#TK_CHAR 
      008E0F 20 E5 C9         [ 2]  677 	jp token_exit 
      008E11                        678 rparnt_tst:		
      000F9B                        679 	_case ')' colon_tst 
      008E11 7B 02            [ 1]    1 	ld a,#')' 
      008E13 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E15 27 DD            [ 1]    3 	jrne colon_tst
      008E17 A1 22            [ 1]  680 	ld a,#TK_RPAREN 
      008E19 27 04 F7         [ 2]  681 	jp token_char
      000FA6                        682 colon_tst:
      000FA6                        683 	_case ':' comma_tst 
      008E1C 5C 20            [ 1]    1 	ld a,#':' 
      008E1E D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1F 26 05            [ 1]    3 	jrne comma_tst
      008E1F 7F 5C            [ 1]  684 	ld a,#TK_COLON 
      008E21 90 93 5F         [ 2]  685 	jp token_char  
      000FB1                        686 comma_tst:
      000FB1                        687 	_case COMMA sharp_tst 
      008E24 A6 02            [ 1]    1 	ld a,#COMMA 
      008E26 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E28 81 05            [ 1]    3 	jrne sharp_tst
      008E29 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008E29 89 AE 8E         [ 2]  689 	jp token_char
      000FBC                        690 sharp_tst:
      000FBC                        691 	_case SHARP dash_tst 
      008E2C 3E F1            [ 1]    1 	ld a,#SHARP 
      008E2E 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E30 7D 27            [ 1]    3 	jrne dash_tst
      008E32 09 5C            [ 1]  692 	ld a,#TK_SHARP
      008E34 20 F7 1D         [ 2]  693 	jp token_char  	 	 
      000FC7                        694 dash_tst: 	
      000FC7                        695 	_case '-' at_tst 
      008E37 8E 3E            [ 1]    1 	ld a,#'-' 
      008E39 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3B 07 85            [ 1]    3 	jrne at_tst
      008E3D 81 61            [ 1]  696 	ld a,#TK_MINUS  
      008E3F 62 74 6E         [ 2]  697 	jp token_char 
      000FD2                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      000FD2                        699 	_case '@' qmark_tst 
      008E42 76 66            [ 1]    1 	ld a,#'@' 
      008E44 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E46 26 05            [ 1]    3 	jrne qmark_tst
      008E46 89 4B            [ 1]  700 	ld a,#TK_ARRAY 
      008E48 00 4B 0A         [ 2]  701 	jp token_char
      000FDD                        702 qmark_tst:
      000FDD                        703 	_case '?' tick_tst 
      008E4B A1 24            [ 1]    1 	ld a,#'?' 
      008E4D 26 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4F 5B 01            [ 1]    3 	jrne tick_tst
      008E51 4B 10            [ 1]  704 	ld a,#TK_CMD  
      008E53 F7               [ 1]  705 	ld (x),a 
      008E54 5C               [ 1]  706 	incw x 
      008E55 91 D6            [ 1]  707 	ldw y,x 
      008E57 01 72 5C         [ 2]  708 	ldw x,#PRT_IDX 
      008E5A 00 02            [ 2]  709 	ldw (y),x 
      008E5C CD 99 0B 6B      [ 2]  710 	addw y,#2
      008E60 02 CD 8E         [ 2]  711 	jp token_exit
      000FF5                        712 tick_tst: ; comment 
      000FF5                        713 	_case TICK plus_tst 
      008E63 E3 25            [ 1]    1 	ld a,#TICK 
      008E65 ED A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E67 10 11            [ 1]    3 	jrne plus_tst
      008E69 01 26            [ 1]  714 	ld a,#TK_CMD
      008E6B 0A               [ 1]  715 	ld (x),a 
      008E6C 7B               [ 1]  716 	incw x
      008E6D 02 A1 41 2B      [ 2]  717 	ldw y,#REM_IDX
      008E71 04               [ 2]  718 	ldw (x),y 
      008E72 A1 47 2B         [ 2]  719 	addw x,#2  
      001007                        720 copy_comment:
      008E75 DD 72 5A 00      [ 2]  721 	ldw y,#tib 
      008E79 02 7F 1E 03      [ 2]  722 	addw y,in.w
      008E7D CD 99            [ 2]  723 	pushw y 
      008E7F 17 90 93         [ 4]  724 	call strcpy
      008E82 C6 00 0D         [ 2]  725 	subw y,(1,sp)
      008E85 90 F7            [ 1]  726 	incw y ; strlen+1 
      008E87 90 5C            [ 2]  727 	ldw (1,sp),y 
      008E89 CE 00 0E         [ 2]  728 	addw x,(1,sp) 
      00101E                        729 	_drop 2 
      008E8C 90 FF            [ 2]    1     addw sp,#2 
      008E8E 72               [ 1]  730 	clr a 
      008E8F A9 00            [ 1]  731 	ldw y,x 
      008E91 02 A6 84         [ 2]  732 	jp token_exit 
      001026                        733 plus_tst:
      001026                        734 	_case '+' star_tst 
      008E94 5B 04            [ 1]    1 	ld a,#'+' 
      008E96 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E97 26 05            [ 1]    3 	jrne star_tst
      008E97 4B 00            [ 1]  735 	ld a,#TK_PLUS  
      008E99 4B 00 4B         [ 2]  736 	jp token_char 
      001031                        737 star_tst:
      001031                        738 	_case '*' slash_tst 
      008E9C 00 2A            [ 1]    1 	ld a,#'*' 
      008E9D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      008E9D 91 D6            [ 1]    3 	jrne slash_tst
      008E9F 01 72            [ 1]  739 	ld a,#TK_MULT 
      008EA1 5C 00 02         [ 2]  740 	jp token_char 
      00103C                        741 slash_tst: 
      00103C                        742 	_case '/' prcnt_tst 
      008EA4 A1 30            [ 1]    1 	ld a,#'/' 
      008EA6 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA8 A1 31            [ 1]    3 	jrne prcnt_tst
      008EAA 27 02            [ 1]  743 	ld a,#TK_DIV 
      008EAC 20 0B A0         [ 2]  744 	jp token_char 
      001047                        745 prcnt_tst:
      001047                        746 	_case '%' eql_tst 
      008EAF 30 46            [ 1]    1 	ld a,#'%' 
      008EB1 09 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB3 09 02            [ 1]    3 	jrne eql_tst
      008EB5 09 01            [ 1]  747 	ld a,#TK_MOD
      008EB7 20 E4 C5         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      008EB9                        750 eql_tst:
      001052                        751 	_case '=' gt_tst 		
      008EB9 72 5A            [ 1]    1 	ld a,#'=' 
      008EBB 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBD 90 93            [ 1]    3 	jrne gt_tst
      008EBF 7B 01            [ 1]  752 	ld a,#TK_EQUAL
      008EC1 90 F7 90         [ 2]  753 	jp token_char 
      00105D                        754 gt_tst:
      00105D                        755 	_case '>' lt_tst 
      008EC4 5C 1E            [ 1]    1 	ld a,#'>' 
      008EC6 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC8 FF 72            [ 1]    3 	jrne lt_tst
      008ECA A9 00            [ 1]  756 	ld a,#TK_GT 
      008ECC 02 A6            [ 1]  757 	ld (ATTRIB,sp),a 
      008ECE 84 5B 03         [ 4]  758 	ld a,([in.w],y)
      008ED1 81 5C 00 01      [ 1]  759 	inc in 
      008ED2 A1 3D            [ 1]  760 	cp a,#'=
      008ED2 A1 41            [ 1]  761 	jrne 1$
      008ED4 8C 24            [ 1]  762 	ld a,#TK_GE 
      008ED6 0B A1            [ 2]  763 	jra token_char  
      008ED8 5B 25            [ 1]  764 1$: cp a,#'<
      008EDA 07 A1            [ 1]  765 	jrne 2$
      008EDC 61 8C            [ 1]  766 	ld a,#TK_NE 
      008EDE 24 02            [ 2]  767 	jra token_char 
      008EE0 A1 7B 81 01      [ 1]  768 2$: dec in
      008EE3 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      008EE3 A1 30            [ 2]  770 	jra token_char 	 
      001086                        771 lt_tst:
      001086                        772 	_case '<' other
      008EE5 25 03            [ 1]    1 	ld a,#'<' 
      008EE7 A1 3A            [ 1]    2 	cp a,(TCHAR,sp) 
      008EE9 8C 8C            [ 1]    3 	jrne other
      008EEB 81 34            [ 1]  773 	ld a,#TK_LT 
      008EEC 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      008EEC CD 8E E3         [ 4]  775 	ld a,([in.w],y)
      008EEF 25 03 CD 8E      [ 1]  776 	inc in 
      008EF3 D2 81            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008EF5 26 04            [ 1]  778 	jrne 1$
      008EF5 A1 5F            [ 1]  779 	ld a,#TK_LE 
      008EF7 26 03            [ 2]  780 	jra token_char 
      008EF9 99 20            [ 1]  781 1$: cp a,#'>
      008EFB 03 CD            [ 1]  782 	jrne 2$
      008EFD 8E EC            [ 1]  783 	ld a,#TK_NE 
      008EFF 81 1E            [ 2]  784 	jra token_char 
      008F00 72 5A 00 01      [ 1]  785 2$: dec in 
      008F00 5C 02            [ 1]  786 	ld a,(ATTRIB,sp)
      008F01 20 16            [ 2]  787 	jra token_char 	
      0010AF                        788 other: ; not a special character 	 
      008F01 CD 99            [ 1]  789 	ld a,(TCHAR,sp)
      008F03 0B F7 5C         [ 4]  790 	call is_alpha 
      008F06 91 D6            [ 1]  791 	jrc 30$ 
      008F08 01 72 5C         [ 2]  792 	jp syntax_error 
      0010B9                        793 30$: 
      008F0B 00 02 CD         [ 4]  794 	call parse_keyword
      008F0E 8E F5 25         [ 2]  795 	cpw x,#REM_IDX 
      008F11 EF 7F            [ 1]  796 	jrne token_exit 
      008F13 72               [ 1]  797 	ldw x,y 
      008F14 5A 00 02         [ 2]  798 	jp copy_comment 
      0010C5                        799 token_char:
      008F17 81               [ 1]  800 	ld (x),a 
      008F18 5C               [ 1]  801 	incw x
      008F18 89 CD            [ 1]  802 	ldw y,x 
      0010C9                        803 token_exit:
      0010C9                        804 	_drop VSIZE 
      008F1A 8F 00            [ 2]    1     addw sp,#VSIZE 
      008F1C 1E               [ 4]  805 	ret
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
      0010CC                        825 compile::
      008F1D 01 E6            [ 2]  826 	pushw y 
      0010CE                        827 	_vars VSIZE 
      008F1F 02 26            [ 2]    1     sub sp,#VSIZE 
      008F21 0F E6 01 A0 41   [ 1]  828 	mov basicptr,txtbgn
      008F26 AE 00 03 42      [ 1]  829 	bset flags,#FCOMP 
      008F2A 1C 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F2C 31 A6 85         [ 2]  831 	ldw x,#0
      008F2F 20 36 B8         [ 2]  832 	ldw pad,x ; destination buffer 
      008F31 C7 16 BA         [ 1]  833 	ld pad+2,a ; count 
      008F31 AE B3 70         [ 2]  834 	ldw x,#pad+3
      008F34 16 01 90 5C      [ 1]  835 	clr in 
      008F38 CD 99 81         [ 4]  836 	call get_token
      008F3B 4D 26            [ 1]  837 	cp a,#TK_INTGR
      008F3D 29 16            [ 1]  838 	jrne 2$
      008F3F 01 A6 03         [ 2]  839 	cpw x,#1 
      008F42 90 F7            [ 1]  840 	jrpl 1$
      008F44 90 5C            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F46 93 CD 94         [ 2]  842 	jp tb_error
      008F49 63 A1 0F         [ 2]  843 1$:	ldw pad,x 
      008F4C 23 02 A6 0F      [ 2]  844 	ldw y,#pad+3 
      008F50 90 A3 17 74      [ 2]  845 2$:	cpw y,#stack_full 
      008F50 88 05            [ 1]  846 	jrult 3$
      008F51 A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F51 90 F6 27         [ 2]  848 	jp tb_error 
      00110E                        849 3$:	
      008F54 09               [ 1]  850 	ldw x,y 
      008F55 90 5C 0A         [ 4]  851 	call get_token 
      008F58 01 26            [ 1]  852 	cp a,#TK_NONE 
      008F5A F6 4F            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F5C 90 F7 90 5C      [ 2]  855 	subw y,#pad
      008F60 5B 01            [ 1]  856     ld a,yl
      008F62 A6 03 5F         [ 2]  857 	ldw x,#pad 
      008F65 20 1B 19         [ 2]  858 	ldw ptr16,x 
      008F67 E7 02            [ 1]  859 	ld (2,x),a 
      008F67 16               [ 2]  860 	ldw x,(x)
      008F68 01 A1            [ 1]  861 	jreq 10$
      008F6A 87 2B 06         [ 4]  862 	call insert_line
      008F6D 90 F7 90 5C      [ 1]  863 	clr  count 
      008F71 20 0F            [ 2]  864 	jra  11$ 
      008F73                        865 10$: ; line# is zero 
      008F73 A3 00 48         [ 2]  866 	ldw x,ptr16  
      008F76 27 0A 90         [ 2]  867 	ldw basicptr,x 
      008F79 F7 90            [ 1]  868 	ld a,(2,x)
      008F7B 5C 90 FF         [ 1]  869 	ld count,a 
      008F7E 72 A9 00 02      [ 1]  870 	mov in,#3 
      00113F                        871 11$:
      00113F                        872 	_drop VSIZE 
      008F82 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F84 81 1B 00 22      [ 1]  873 	bres flags,#FCOMP 
      008F85 90 85            [ 2]  874 	popw y 
      008F85 88               [ 4]  875 	ret 
                                    876 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
      001148                         48 cpy_cmd_name:
      008F86 91               [ 2]   49 	tnzw x 
      008F87 D6 01            [ 1]   50 	jreq 10$
      008F89 27               [ 1]   51 	ld a,(x)
      008F8A 0A               [ 1]   52 	incw x
      008F8B 11 01            [ 1]   53 	and a,#15  
      008F8D 26               [ 1]   54 	push a 
      008F8E 06 72            [ 1]   55     tnz (1,sp) 
      008F90 5C 00            [ 1]   56 	jreq 9$
      008F92 02               [ 1]   57 1$:	ld a,(x)
      008F93 20 F1            [ 1]   58 	ld (y),a  
      008F95 5B               [ 1]   59 	incw x
      008F96 01 81            [ 1]   60 	incw y 
      008F98 0A 01            [ 1]   61 	dec (1,sp)	 
      008F98 52 02            [ 1]   62 	jrne 1$
      008F9A 84               [ 1]   63 9$: pop a 
      00115F                         64 10$: 
      008F9A 90               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      001160                         75 add_space:
      008F9B AE 16            [ 2]   76 	decw y 
      008F9D 68 A6            [ 1]   77 	ld a,(y)
      008F9F 20 CD            [ 1]   78 	incw y
      008FA1 8F 85            [ 1]   79 	cp a,#') 
      008FA3 55 00            [ 1]   80 	jreq 0$
      008FA5 02 00 03         [ 4]   81 	call is_alnum 
      008FA8 91 D6            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00116F                         83 0$: 
      008FAA 01 26            [ 1]   84 	ld a,#SPACE 
      008FAC 05 90            [ 1]   85 	ld (y),a 
      008FAE 93 CC            [ 1]   86 	incw y 
      008FB0 91               [ 4]   87 1$: ret 
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
      001176                         99 right_align::
      008FB1 49               [ 1]  100 	push a 
      008FB2 72 5C            [ 1]  101 0$: ld a,(1,sp)
      008FB4 00 02 CD         [ 1]  102 	cp a,tab_width 
      008FB7 99 0B            [ 1]  103 	jrpl 1$
      008FB9 6B 01            [ 1]  104 	ld a,#SPACE 
      008FBB 5A               [ 2]  105 	decw x
      008FBB A6               [ 1]  106 	ld (x),a  
      008FBC 22 11            [ 1]  107 	inc (1,sp)
      008FBE 01 26            [ 2]  108 	jra 0$ 
      008FC0 0A               [ 1]  109 1$: pop a 	
      008FC1 A6               [ 4]  110 	ret 
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
      001188                        123 cpy_quote:
      008FC2 02 F7            [ 1]  124 	ld a,#'"
      008FC4 5C CD            [ 1]  125 	ld (y),a 
      008FC6 8D F1            [ 1]  126 	incw y 
      008FC8 CC               [ 2]  127 	pushw x 
      008FC9 91 49 C6         [ 4]  128 	call skip_string 
      008FCB 85               [ 2]  129 	popw x 
      008FCB A6               [ 1]  130 1$:	ld a,(x)
      008FCC 24 11            [ 1]  131 	jreq 9$
      008FCE 01               [ 1]  132 	incw x 
      008FCF 27 17            [ 1]  133 	cp a,#SPACE 
      008FD1 A6 26            [ 1]  134 	jrult 3$
      008FD3 11 01            [ 1]  135 	ld (y),a
      008FD5 26 0A            [ 1]  136 	incw y 
      008FD7 A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FD9 F7 5C            [ 1]  138 	jrne 1$ 
      0011A3                        139 2$:
      008FDB CD 8E            [ 1]  140 	ld (y),a
      008FDD 97 CC            [ 1]  141 	incw y  
      008FDF 91 49            [ 2]  142 	jra 1$
      008FE1 7B               [ 1]  143 3$: push a 
      008FE2 01 CD            [ 1]  144 	ld a,#'\
      008FE4 8E E3            [ 1]  145 	ld (y),a 
      008FE6 24 0C            [ 1]  146 	incw y  
      008FE8 A6               [ 1]  147 	pop a 
      008FE9 84 F7            [ 1]  148 	sub a,#7
      008FEB 5C 7B 01         [ 1]  149 	ld acc8,a 
      008FEE CD 8E 46 CC      [ 1]  150 	clr acc16
      008FF2 91               [ 2]  151 	pushw x
      008FF3 49 0D BE         [ 2]  152 	ldw x,#escaped 
      008FF4 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      008FF4 A6               [ 1]  154 	ld a,(x)
      008FF5 28               [ 2]  155 	popw x
      008FF6 11 01            [ 2]  156 	jra 2$
      008FF8 26 05            [ 1]  157 9$: ld a,#'"
      008FFA A6 06            [ 1]  158 	ld (y),a 
      008FFC CC 91            [ 1]  159 	incw y  
      008FFE 45               [ 1]  160 	incw x 
      008FFF 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011CE                        171 var_name::
      008FFF A6 5C 11         [ 2]  172 		subw x,#vars 
      009002 01 26            [ 1]  173 		ld a,#3
      009004 16               [ 2]  174 		div x,a 
      009005 A6               [ 1]  175 		ld a,xl 
      009006 04 F7            [ 1]  176 		add a,#'A 
      009008 5C               [ 4]  177 		ret 
                                    178 
                                    179 ;-----------------------------
                                    180 ; return cmd  idx from its 
                                    181 ; code address 
                                    182 ; input:
                                    183 ;   X      code address 
                                    184 ; output:
                                    185 ;   X      cmd_idx
                                    186 ;-----------------------------
      0011D8                        187 get_cmd_idx:
      009009 91 D6            [ 2]  188 	pushw y
      00900B 01 F7 5C 90      [ 2]  189 	ldw y,#code_addr 
      00900F 93 72 5C 00      [ 2]  190 	ldw ptr16,y 
      009013 02 5F            [ 1]  191 	clrw y 
      009015 97 A6 04         [ 5]  192 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009018 CC 91            [ 1]  193 	jreq 3$ 
      00901A 49 5C            [ 1]  194 	incw y 
      00901B 91 D6 19         [ 4]  195 	ld a,([ptr16],y)
      00901B A6 29            [ 1]  196 	incw y
      00901D 11 01 26         [ 4]  197 	or a,([ptr16],y)	
      009020 05 A6            [ 1]  198 	jrne 1$
      009022 07               [ 1]  199 3$: ldw x,y 
      009023 CC 91            [ 2]  200 	popw y 
      009025 45               [ 4]  201 	ret
                                    202 
                                    203 
                                    204 ;-------------------------------------
                                    205 ; decompile tokens list 
                                    206 ; to original text line 
                                    207 ; input:
                                    208 ;   [basicptr]  pointer at line 
                                    209 ;   Y           output buffer
                                    210 ; output:
                                    211 ;   A           length 
                                    212 ;   Y           after string  
                                    213 ;------------------------------------
                           000001   214 	BASE_SAV=1
                           000002   215 	WIDTH_SAV=2
                           000003   216 	STR=3
                           000004   217 	VSIZE=4 
      009026                        218 decompile::
      0011F9                        219 	_vars VSIZE
      009026 A6 3A            [ 2]    1     sub sp,#VSIZE 
      009028 11 01 26         [ 1]  220 	ld a,base
      00902B 05 A6            [ 1]  221 	ld (BASE_SAV,sp),a  
      00902D 0A CC 91         [ 1]  222 	ld a,tab_width 
      009030 45 02            [ 1]  223 	ld (WIDTH_SAV,sp),a 
      009031 17 03            [ 2]  224 	ldw (STR,sp),y   
      009031 A6 2C 11 01      [ 5]  225 	ldw x,[basicptr] ; line number 
      009035 26 05 A6 08      [ 1]  226 	mov base,#10
      009039 CC 91 45 23      [ 1]  227 	mov tab_width,#5
      00903C 72 5F 00 0C      [ 1]  228 	clr acc24 
      00903C A6 23 11         [ 2]  229 	ldw acc16,x
      00903F 01               [ 1]  230 	clr a ; unsigned conversion 
      009040 26 05 A6         [ 4]  231 	call itoa  
      009043 09 CC 91         [ 4]  232 	call right_align 
      009046 45               [ 1]  233 	push a 
      009047 90 93            [ 1]  234 1$:	ldw y,x ; source
      009047 A6 2D            [ 2]  235 	ldw x,(STR+1,sp) ; destination
      009049 11 01 26         [ 4]  236 	call strcpy 
      00904C 05 A6            [ 1]  237 	clrw y 
      00904E 11               [ 1]  238 	pop a 
      00904F CC 91            [ 1]  239 	ld yl,a 
      009051 45 F9 03         [ 2]  240 	addw y,(STR,sp)
      009052 A6 20            [ 1]  241 	ld a,#SPACE 
      009052 A6 40            [ 1]  242 	ld (y),a 
      009054 11 01            [ 1]  243 	incw y 
      009056 26 05 A6 05      [ 1]  244 	clr tab_width
      00905A CC 91 45         [ 2]  245 	ldw x,#3
      00905D CF 00 00         [ 2]  246 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      001241                        247 decomp_loop:
      00905D A6 3F            [ 2]  248 	pushw y
      00905F 11 01 26         [ 4]  249 	call next_token 
      009062 12 A6            [ 2]  250 	popw y 
      009064 80               [ 1]  251 	tnz a  
      009065 F7 5C            [ 1]  252 	jrne 1$
      009067 90 93 AE         [ 2]  253 	jp 20$
      00906A 00 64            [ 1]  254 1$:	jrmi 2$
      00906C 90 FF 72         [ 2]  255 	jp 6$
      001253                        256 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00906F A9 00            [ 1]  257 	cp a,#TK_VAR 
      009071 02 CC            [ 1]  258 	jrne 3$
                                    259 ;; TK_VAR 
      009073 91 49 60         [ 4]  260 	call add_space
      009075 CD 17 D5         [ 4]  261 	call get_addr   
      009075 A6 27 11         [ 4]  262 	call var_name
      009078 01 26            [ 1]  263 	ld (y),a 
      00907A 2B A6            [ 1]  264 	incw y  
      00907C 80 F7            [ 2]  265 	jra decomp_loop
      001266                        266 3$:
      00907E 5C 90            [ 1]  267 	cp a,#TK_INTGR
      009080 AE 00            [ 1]  268 	jrne 4$
                                    269 ;; TK_INTGR
      009082 7E FF 1C         [ 4]  270 	call get_int24 
      009085 00 02 0C         [ 1]  271 	ld acc24,a 
      009087 CF 00 0D         [ 2]  272 	ldw acc16,x 
      009087 90 AE 16         [ 4]  273 	call add_space
      00908A 68 72            [ 2]  274 	pushw y 
      00908C B9 00            [ 1]  275 	ld a,#255 ; signed conversion 
      00908E 01 90 89         [ 4]  276 	call itoa  
      009091 CD 94            [ 2]  277 	ldw y,(1,sp) 
      009093 7F               [ 1]  278 	push a 
      009094 72               [ 1]  279 	exgw x,y 
      009095 F2 01 90         [ 4]  280 	call strcpy 
      009098 5C 17            [ 1]  281 	clrw y
      00909A 01               [ 1]  282 	pop a  
      00909B 72 FB            [ 1]  283 	ld yl,a 
      00909D 01 5B 02         [ 2]  284 	addw y,(1,sp)
      00128C                        285 	_drop 2 
      0090A0 4F 90            [ 2]    1     addw sp,#2 
      0090A2 93 CC            [ 2]  286 	jra decomp_loop
      001290                        287 4$: ; dictionary keyword
      0090A4 91 49            [ 1]  288 	cp a,#TK_NOT 
      0090A6 24 39            [ 1]  289 	jruge 50$ 
      0090A6 A6               [ 2]  290 	ldw x,(x)
      0090A7 2B 11 01 26      [ 1]  291 	inc in 
      0090AB 05 A6 10 CC      [ 1]  292 	inc in 
      0090AF 91 45 7E         [ 2]  293 	cpw x,#REM_IDX
      0090B1 26 23            [ 1]  294 	jrne 5$
      0090B1 A6 2A 11         [ 2]  295 	ldw x,basicptr 
                                    296 ; copy comment to buffer 
      0090B4 01 26 05         [ 4]  297 	call add_space
      0090B7 A6 20            [ 1]  298 	ld a,#''
      0090B9 CC 91            [ 1]  299 	ld (y),a 
      0090BB 45 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0090BC                        301 46$:
      0090BC A6 2F 11 01      [ 4]  302 	ld a,([in.w],x)
      0090C0 26 05 A6 21      [ 1]  303 	inc in  
      0090C4 CC 91            [ 1]  304 	ld (y),a 
      0090C6 45 5C            [ 1]  305 	incw y 
      0090C7 C6 00 01         [ 1]  306 	ld a,in 
      0090C7 A6 25 11         [ 1]  307 	cp a,count 
      0090CA 01 26            [ 1]  308 	jrmi 46$
      0090CC 05 A6 22         [ 2]  309 	jp 20$  
      0090CF CC 91 45         [ 2]  310 5$: cpw x,#LET_IDX 
      0090D2 26 0B            [ 1]  311 	jrne 54$
      0090D2 A6 3D 11         [ 2]  312 	jp decomp_loop ; down display LET
      0012CD                        313 50$:
      0090D5 01               [ 1]  314 	clrw x 
      0090D6 26 05            [ 1]  315 	sub a,#TK_NOT  
      0090D8 A6               [ 1]  316 	sll a 
      0090D9 32               [ 1]  317 	ld xl,a 
      0090DA CC 91 45         [ 2]  318 	addw x,#NOT_IDX
      0090DD                        319 54$: ; insert command name 
      0090DD A6 3E 11         [ 4]  320 	call add_space  
      0090E0 01 26            [ 2]  321 	pushw y
      0090E2 23 A6 31         [ 4]  322 	call cmd_name
      0090E5 6B 02            [ 2]  323 	popw y 
      0090E7 91 D6 01         [ 4]  324 	call cpy_cmd_name
      0090EA 72 5C 00         [ 2]  325 	jp decomp_loop 
      0012E5                        326 6$:
                                    327 ; label?
      0090ED 02 A1            [ 1]  328 	cp a,#TK_LABEL 
      0090EF 3D 26            [ 1]  329 	jrne 64$
                                    330 ; copy label string to output buffer   	
      0090F1 04 A6            [ 1]  331 	ld a,#32 
      0090F3 33 20            [ 1]  332 	ld (y),a 
      0090F5 4F A1            [ 1]  333 	incw y 
      0012EF                        334 61$:
      0090F7 3C               [ 2]  335 	pushw x 
      0090F8 26 04 A6         [ 4]  336 	call skip_string 
      0090FB 35               [ 2]  337 	popw x 
      0012F4                        338 62$:	
      0090FC 20               [ 1]  339 	ld a,(x)
      0090FD 47 72            [ 1]  340 	jreq 63$ 
      0090FF 5A               [ 1]  341 	incw x  
      009100 00 02            [ 1]  342 	ld (y),a 
      009102 7B 02            [ 1]  343 	incw y 
      009104 20 3F            [ 2]  344 	jra 62$ 
      009106                        345 63$: 
      009106 A6 3C            [ 1]  346 	ld a,#32 
      009108 11 01            [ 1]  347 	ld (y),a 
      00910A 26 23            [ 1]  348 	incw y 
      00910C A6 34 6B         [ 2]  349 	jp decomp_loop
      001307                        350 64$:
      00910F 02 91            [ 1]  351 	cp a,#TK_QSTR 
      009111 D6 01            [ 1]  352 	jrne 7$
                                    353 ;; TK_QSTR
      009113 72 5C 00         [ 4]  354 	call add_space
      009116 02 A1 3D         [ 4]  355 	call cpy_quote  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009119 26 04 A6         [ 2]  356 	jp decomp_loop
      001314                        357 7$:
      00911C 36 20            [ 1]  358 	cp a,#TK_CHAR 
      00911E 26 A1            [ 1]  359 	jrne 8$
                                    360 ;; TK_CHAR
      009120 3E 26 04         [ 4]  361 	call add_space 
      009123 A6 35            [ 1]  362 	ld a,#'\ 
      009125 20 1E            [ 1]  363 	ld (y),a 
      009127 72 5A            [ 1]  364 	incw y
      009129 00               [ 1]  365 	ld a,(x)
      00912A 02 7B 02 20      [ 1]  366 	inc in  
      00912E 16 06            [ 2]  367 	jra 81$
      00912F A1 0A            [ 1]  368 8$: cp a,#TK_COLON 
      00912F 7B 01            [ 1]  369 	jrne 9$
      009131 CD 8E            [ 1]  370 	ld a,#':
      00132E                        371 81$:
      009133 D2 25            [ 1]  372 	ld (y),a 
      009135 03 CC            [ 1]  373 	incw y 
      001332                        374 82$:
      009137 97 1F 41         [ 2]  375 	jp decomp_loop
      009139                        376 9$: 
      009139 CD 8F            [ 1]  377 	cp a,#TK_SHARP
      00913B 18 A3            [ 1]  378 	jrugt 10$ 
      00913D 00 7E            [ 1]  379 	sub a,#TK_ARRAY 
      00913F 26               [ 1]  380 	clrw x 
      009140 08               [ 1]  381 	ld xl,a
      009141 93 CC 90         [ 2]  382 	addw x,#single_char 
      009144 87               [ 1]  383 	ld a,(x)
      009145 20 EB            [ 2]  384 	jra 81$ 
      001343                        385 10$: 
      009145 F7 5C            [ 1]  386 	cp a,#TK_MINUS 
      009147 90 93            [ 1]  387 	jrugt 11$
      009149 A0 10            [ 1]  388 	sub a,#TK_PLUS 
      009149 5B               [ 1]  389 	clrw x 
      00914A 02               [ 1]  390 	ld xl,a 
      00914B 81 13 8F         [ 2]  391 	addw x,#add_char 
      00914C F6               [ 1]  392 	ld a,(x)
      00914C 90 89            [ 2]  393 	jra 81$
      001351                        394 11$:
      00914E 52 02            [ 1]  395     cp a,#TK_MOD 
      009150 55 00            [ 1]  396 	jrugt 12$
      009152 1C 00            [ 1]  397 	sub a,#TK_MULT
      009154 05               [ 1]  398 	clrw x 
      009155 72               [ 1]  399 	ld xl,a 
      009156 1A 00 23         [ 2]  400 	addw x,#mul_char
      009159 A6               [ 1]  401 	ld a,(x)
      00915A 00 AE            [ 2]  402 	jra 81$
      00135F                        403 12$:
      00915C 00 00            [ 1]  404 	sub a,#TK_GT  
      00915E CF               [ 1]  405 	sll a 
      00915F 16               [ 1]  406 	clrw x 
      009160 B8               [ 1]  407 	ld xl,a 
      009161 C7 16 BA         [ 2]  408 	addw x,#relop_str 
      009164 AE               [ 2]  409 	ldw x,(x)
      009165 16               [ 1]  410 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009166 BB               [ 1]  411 	incw x 
      009167 72 5F            [ 1]  412 	ld (y),a
      009169 00 02            [ 1]  413 	incw y 
      00916B CD               [ 1]  414 	ld a,(x)
      00916C 8F 98            [ 1]  415 	jrne 81$
      00916E A1 84 26         [ 2]  416 	jp decomp_loop 
      001374                        417 20$: 
      009171 11 A3            [ 1]  418 	clr (y)
      009173 00 01            [ 2]  419 	ldw x,(STR,sp)
      009175 2A 05            [ 1]  420 	ld a,(BASE_SAV,sp)
      009177 A6 0A CC         [ 1]  421 	ld base,a 
      00917A 97 21            [ 1]  422 	ld a,(WIDTH_SAV,sp)
      00917C CF 16 B8         [ 1]  423 	ld tab_width,a
      00917F 90 AE 16         [ 2]  424 	subw y,(STR,sp) 
      009182 BB 90            [ 1]  425 	ld a,yl 
      001387                        426 	_drop VSIZE 
      009184 A3 17            [ 2]    1     addw sp,#VSIZE 
      009186 74               [ 4]  427 	ret 
                                    428 
      009187 25 05 A6 0F CC         429 single_char: .byte '@','(',')',',','#'
      00918C 97 21                  430 add_char: .byte '+','-'
      00918E 2A 2F 25               431 mul_char: .byte '*','/','%'
      00918E 93 CD 8F 98 A1 00 26   432 relop_str: .word gt,equal,ge,lt,ne,le 
             ED 72 A2 16 B8
      00919A 90 9F                  433 gt: .asciz ">"
      00919C AE 16                  434 equal: .asciz "="
      00919E B8 CF 00               435 ge: .asciz ">="
      0091A1 1A E7                  436 lt: .asciz "<"
      0091A3 02 FE 27               437 le: .asciz "<="
      0091A6 09 CD 8D               438 ne:  .asciz "<>"
                                    439 
                                    440 ;----------------------------------
                                    441 ; search in kword_dict name
                                    442 ; from its execution address 
                                    443 ; input:
                                    444 ;   X       	cmd_index 
                                    445 ; output:
                                    446 ;   X 			cstr*  | 0 
                                    447 ;--------------------------------
                           000001   448 	CMDX=1 
                           000003   449 	LINK=3 
                           000004   450 	VSIZE=4
      0013AF                        451 cmd_name:
      0013AF                        452 	_vars VSIZE 
      0091A9 7F 72            [ 2]    1     sub sp,#VSIZE 
      0091AB 5F 00 04 20      [ 1]  453 	clr acc16 
      0091AF 0F 01            [ 2]  454 	ldw (CMDX,sp),x  
      0091B0 AE 32 EE         [ 2]  455 	ldw x,#kword_dict	
      0091B0 CE 00            [ 2]  456 1$:	ldw (LINK,sp),x
      0091B2 1A CF            [ 1]  457 	ld a,(2,x)
      0091B4 00 05            [ 1]  458 	and a,#15 
      0091B6 E6 02 C7         [ 1]  459 	ld acc8,a 
      0091B9 00 04 35         [ 2]  460 	addw x,#3
      0091BC 03 00 02 0D      [ 2]  461 	addw x,acc16
      0091BF FE               [ 2]  462 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091BF 5B 02            [ 2]  463 	cpw x,(CMDX,sp)
      0091C1 72 1B            [ 1]  464 	jreq 2$
      0091C3 00 23            [ 2]  465 	ldw x,(LINK,sp)
      0091C5 90               [ 2]  466 	ldw x,(x) 
      0091C6 85 81 02         [ 2]  467 	subw x,#2  
      0091C8 26 E3            [ 1]  468 	jrne 1$
      0091C8 5D               [ 1]  469 	clr a 
      0091C9 27               [ 1]  470 	clrw x 
      0091CA 14 F6            [ 2]  471 	jra 9$
      0091CC 5C A4            [ 2]  472 2$: ldw x,(LINK,sp)
      0091CE 0F 88 0D         [ 2]  473 	addw x,#2 	
      0013E0                        474 9$:	_drop VSIZE
      0091D1 01 27            [ 2]    1     addw sp,#VSIZE 
      0091D3 0A               [ 4]  475 	ret
                                    476 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
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
      0013E3                        116 strlen::
      0091D4 F6               [ 2]  117 	pushw x 
      0091D5 90               [ 1]  118 	clr a
      0091D6 F7               [ 1]  119 1$:	tnz (x) 
      0091D7 5C 90            [ 1]  120 	jreq 9$ 
      0091D9 5C               [ 1]  121 	inc a 
      0091DA 0A               [ 1]  122 	incw x 
      0091DB 01 26            [ 2]  123 	jra 1$ 
      0091DD F6               [ 2]  124 9$:	popw x 
      0091DE 84               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0091DF                        135 strcmp:
      0091DF 81               [ 1]  136 	ld a,(x)
      0091E0 27 0B            [ 1]  137 	jreq 5$ 
      0091E0 90 5A            [ 1]  138 	cp a,(y) 
      0091E2 90 F6            [ 1]  139 	jrne 4$ 
      0091E4 90               [ 1]  140 	incw x 
      0091E5 5C A1            [ 1]  141 	incw y 
      0091E7 29 27            [ 2]  142 	jra strcmp 
      0013FA                        143 4$: ; not same  
      0091E9 05               [ 1]  144 	clr a 
      0091EA CD               [ 4]  145 	ret 
      0013FC                        146 5$: ; same 
      0091EB 8E EC            [ 1]  147 	ld a,#1 
      0091ED 24               [ 4]  148 	ret 
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
      0013FF                        159 strcpy::
      0091EE 06               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091EF 89               [ 2]  161 	pushw x 
      0091EF A6 20            [ 1]  162 1$: ld a,(y)
      0091F1 90 F7            [ 1]  163 	jreq 9$ 
      0091F3 90               [ 1]  164 	ld (x),a 
      0091F4 5C               [ 1]  165 	incw x 
      0091F5 81 5C            [ 1]  166 	incw y 
      0091F6 20 F6            [ 2]  167 	jra 1$ 
      0091F6 88               [ 1]  168 9$:	clr (x)
      0091F7 7B               [ 2]  169 	popw x 
      0091F8 01               [ 1]  170 	pop a 
      0091F9 C1               [ 4]  171 	ret 
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
                           000001   182 	INCR=1 ; incrament high byte 
                           000002   183 	LB=2 ; increment low byte 
                           000002   184 	VSIZE=2
      00140F                        185 move::
      0091FA 00               [ 1]  186 	push a 
      001410                        187 	_vars VSIZE 
      0091FB 24 2A            [ 2]    1     sub sp,#VSIZE 
      0091FD 08 A6            [ 1]  188 	clr (INCR,sp)
      0091FF 20 5A            [ 1]  189 	clr (LB,sp)
      009201 F7 0C            [ 2]  190 	pushw y 
      009203 01 20            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009205 F1 84            [ 2]  192 	popw y 
      009207 81 31            [ 1]  193 	jreq move_exit ; x==y 
      009208 2B 0E            [ 1]  194 	jrmi move_down
      001420                        195 move_up: ; start from top address with incr=-1
      009208 A6 22 90 F7      [ 2]  196 	addw x,acc16
      00920C 90 5C 89 CD      [ 2]  197 	addw y,acc16
      009210 98 46            [ 1]  198 	cpl (INCR,sp)
      009212 85 F6            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009214 27 30            [ 2]  200 	jra move_loop  
      00142E                        201 move_down: ; start from bottom address with incr=1 
      009216 5C               [ 2]  202     decw x 
      009217 A1 20            [ 2]  203 	decw y
      009219 25 0E            [ 1]  204 	inc (LB,sp) ; incr=1 
      001433                        205 move_loop:	
      00921B 90 F7 90         [ 1]  206     ld a, acc16 
      00921E 5C A1 5C         [ 1]  207 	or a, acc8
      009221 26 F0            [ 1]  208 	jreq move_exit 
      009223 72 FB 01         [ 2]  209 	addw x,(INCR,sp)
      009223 90 F7 90         [ 2]  210 	addw y,(INCR,sp) 
      009226 5C 20            [ 1]  211 	ld a,(y)
      009228 EA               [ 1]  212 	ld (x),a 
      009229 88               [ 2]  213 	pushw x 
      00922A A6 5C 90         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00922D F7               [ 2]  215 	decw x 
      00922E 90 5C 84         [ 2]  216 	ldw acc16,x 
      009231 A0               [ 2]  217 	popw x 
      009232 07 C7            [ 2]  218 	jra move_loop
      00144F                        219 move_exit:
      00144F                        220 	_drop VSIZE
      009234 00 0F            [ 2]    1     addw sp,#VSIZE 
      009236 72               [ 1]  221 	pop a 
      009237 5F               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001453                        231 clear_vars:
      009238 00               [ 2]  232 	pushw x 
      009239 0E               [ 1]  233 	push a  
      00923A 89 AE 8E         [ 2]  234 	ldw x,#vars 
      00923D 3E 72            [ 1]  235 	ld a,#CELL_SIZE*26 
      00923F BB               [ 1]  236 1$:	clr (x)
      009240 00               [ 1]  237 	incw x 
      009241 0E               [ 1]  238 	dec a 
      009242 F6 85            [ 1]  239 	jrne 1$
      009244 20               [ 1]  240 	pop a 
      009245 DD               [ 2]  241 	popw x 
      009246 A6               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009247 22 90 F7 90 5C 5C 81   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      00924E                        253 system_information:
      00924E 1D 00 31         [ 2]  254 	ldw x,#software 
      009251 A6 03 62         [ 4]  255 	call puts 
      009254 9F AB            [ 1]  256 	ld a,#MAJOR 
      009256 41 81 0E         [ 1]  257 	ld acc8,a 
      009258 5F               [ 1]  258 	clrw x 
      009258 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00925B AE B3 76 90      [ 1]  260 	clr tab_width  
      00925F CF 00 1A 90      [ 1]  261 	mov base, #10 
      009263 5F 91 D3         [ 4]  262 	call prt_acc24 
      009266 1A 27            [ 1]  263 	ld a,#'.
      009268 0C 90 5C         [ 4]  264 	call putc 
      00926B 91 D6            [ 1]  265 	ld a,#MINOR 
      00926D 1A 90 5C         [ 1]  266 	ld acc8,a 
      009270 91               [ 1]  267 	clrw x 
      009271 DA 1A 26         [ 2]  268 	ldw acc24,x 
      009274 EF 93 90         [ 4]  269 	call prt_acc24
      009277 85 81            [ 1]  270 	ld a,#CR 
      009279 CD 09 41         [ 4]  271 	call putc
                                    272 ;call test 
      009279 52               [ 4]  273 	ret
                                    274 
      0014D9                        275 warm_init:
      00927A 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00927E 6B 01 C6 00      [ 1]  277 	clr flags 
      009282 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009286 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      00928A 05 35 0A 00      [ 1]  280 	mov base,#10 
      00928E 0B 35 05         [ 2]  281 	ldw x,#0 
      009291 00 24 72         [ 2]  282 	ldw basicptr,x 
      009294 5F 00 0D         [ 2]  283 	ldw in.w,x 
      009297 CF 00 0E 4F      [ 1]  284 	clr count
      00929B CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      0014FB                        291 clear_basic:
      00929C 98               [ 2]  292 	pushw x 
      00929D B2 CD 91 F6      [ 1]  293 	clr count
      0092A1 88 90 93 1E      [ 1]  294 	clr in  
      0092A5 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092A8 7F 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092AB 84 90 97         [ 2]  297 	ldw txtend,x 
      0092AE 72 F9 03         [ 4]  298 	call clear_vars 
      0092B1 A6               [ 2]  299 	popw x
      0092B2 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001512                        305 err_msg:
      0092B3 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092BF 00 01 15 A3 15 BD 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CE 15 DF
      0092C1 15 EB 16 1E 16 2E 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             42 16 55
      0092C1 90 89                  309 	.word err_overflow 
                                    310 
      0092C3 CD 98 20 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092CB CC 93 F4 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0092D3 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092D3 A1 85 26 0F CD 91 E0   314 err_div0: .asciz "division by 0\n" 
             CD 98 55 CD 92 4E 90
             F7
      0092E2 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092E6 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092E6 A1 84 26 26 CD 98 5F   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 E0 90 89 A6 FF CD
             98 B2 16 01 88
      009300 51 CD 94 7F 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      009310 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      009310 A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      00931C 02 A3 00 7E 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 E0 A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      00932E 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      00932E 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      009342 CC 93 F4 A3 00 48 26   324 err_no_fspace: .asciz "File system full.\n" 
             0B CC 92 C1 20 66 75
             6C 6C 2E 0A 00
      00934D 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      00934D 5F A0 87 48 97 1C 00   326 err_overflow: .asciz "overflow\n" 
             F8 0A 00
                                    327 
      009355 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009355 CD 91 E0 90 89 CD 94   329 comp_msg: .asciz "\ncompile error, "
             2F 90 85 CD 91 C8 CC
             92 C1 00
      009365 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      00169F                        332 syntax_error::
      009365 A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      0016A1                        335 tb_error::
      009367 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      00936C F7               [ 1]  337 	push a 
      00936D 90 5C 6C         [ 2]  338 	ldw x, #rt_msg 
      00936F CD 09 9E         [ 4]  339 	call puts 
      00936F 89               [ 1]  340 	pop a 
      009370 CD 98 46         [ 2]  341 	ldw x, #err_msg 
      009373 85 5F 00 0D      [ 1]  342 	clr acc16 
      009374 48               [ 1]  343 	sll a
      009374 F6 27 07 5C      [ 1]  344 	rlc acc16  
      009378 90 F7 90         [ 1]  345 	ld acc8, a 
      00937B 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      00937E FE               [ 2]  347 	ldw x,(x)
      00937E A6 20 90         [ 4]  348 	call puts
      009381 F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      009384 CC 92 C1         [ 1]  351 ld a,count 
      009387 90 5F            [ 1]  352 clrw y 
      009387 A1 02            [ 1]  353 rlwa y  
      009389 26 09 CD         [ 4]  354 call hex_dump
      00938C 91 E0 CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      00938F 92 08 CC         [ 1]  357 	ld a,in 
      009392 92 C1 CC         [ 4]  358 	call prt_basic_line
      009394 AE 16 8F         [ 2]  359 	ldw x,#tk_id 
      009394 A1 04 26         [ 4]  360 	call puts 
      009397 10 CD 91         [ 1]  361 	ld a,in.saved 
      00939A E0               [ 1]  362 	clrw x 
      00939B A6               [ 1]  363 	ld xl,a 
      00939C 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      0093A0 5C               [ 1]  365 	ld a,(x)
      0093A1 F6               [ 1]  366 	clrw x 
      0093A2 72               [ 1]  367 	ld xl,a 
      0093A3 5C 00 02         [ 4]  368 	call prt_i16
      0093A6 20 06            [ 2]  369 	jra 6$
      0016F2                        370 1$:	
      0093A8 A1               [ 1]  371 	push a 
      0093A9 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      0093AC A6 3A 9E         [ 4]  373 	call puts 
      0093AE 84               [ 1]  374 	pop a 
      0093AE 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      0093B1 5C 5F 00 0D      [ 1]  376 	clr acc16 
      0093B2 48               [ 1]  377 	sll a
      0093B2 CC 92 C1 0D      [ 1]  378 	rlc acc16  
      0093B5 C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093B5 A1 09 22 0A      [ 2]  380 	addw x,acc16 
      0093B9 A0               [ 2]  381 	ldw x,(x)
      0093BA 05 5F 97         [ 4]  382 	call puts
      0093BD 1C 94 0A         [ 2]  383 	ldw x,#tib
      0093C0 F6 20 EB         [ 4]  384 	call puts 
      0093C3 A6 0D            [ 1]  385 	ld a,#CR 
      0093C3 A1 11 22         [ 4]  386 	call putc
      0093C6 0A A0 10         [ 2]  387 	ldw x,in.w
      0093C9 5F 97 1C         [ 4]  388 	call spaces
      0093CC 94 0F            [ 1]  389 	ld a,#'^
      0093CE F6 20 DD         [ 4]  390 	call putc 
      0093D1 AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093D1 A1               [ 1]  392     ldw sp,x
                                    393 
      00172B                        394 warm_start:
      0093D2 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      00172E                        399 cmd_line: ; user interface 
      0093D5 A0 20            [ 1]  400 	ld a,#CR 
      0093D7 5F 97 1C         [ 4]  401 	call putc 
      0093DA 94 11            [ 1]  402 	ld a,#'> 
      0093DC F6 20 CF         [ 4]  403 	call putc
      0093DF CD 0A A3         [ 4]  404 	call readln
      0093DF A0 31 48 5F      [ 1]  405 	tnz count 
      0093E3 97 1C            [ 1]  406 	jreq cmd_line
      0093E5 94 14 FE         [ 4]  407 	call compile
                                    408 ;;;;;;;;;;;;;;;;;;;;;;	
                                    409 ;pushw y 
                                    410 ;ldw x,txtbgn  
                                    411 ;ldw y,txtend
                                    412 ;ldw acc16,x   
                                    413 ;subw y,acc16 
                                    414 ;call hex_dump
                                    415 ;popw y 
                                    416 ;;;;;;;;;;;;;;;;;;;;;;
                                    417 
                                    418 ; if text begin with a line number
                                    419 ; the compiler set count to zero    
                                    420 ; so code is not interpreted
      0093E8 F6 5C 90 F7      [ 1]  421 	tnz count 
      0093EC 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00174A                        430 interpreter: 
      0093EE F6 26 BD         [ 1]  431 	ld a,in 
      0093F1 CC 92 C1         [ 1]  432 	cp a,count 
      0093F4 2B 1D            [ 1]  433 	jrmi interp_loop
      001752                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      0093F4 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      0093F9 01 C7 00         [ 2]  436 	ldw x,basicptr
      0093FC 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      009400 00 24 72         [ 2]  438 	cpw x,txtend 
      009403 F2 03            [ 1]  439 	jrpl warm_start
      009405 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      009408 04 81            [ 1]  441 	ld a,(2,x)
      00940A 40 28 29         [ 1]  442 	ld count,a 
      00940D 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      00176F                        444 interp_loop:
      009411 2A 2F 25         [ 4]  445 	call next_token
      009414 94 20            [ 1]  446 	cp a,#TK_NONE 
      009416 94 22            [ 1]  447 	jreq next_line 
      009418 94 24            [ 1]  448 	cp a,#TK_CMD
      00941A 94 27            [ 1]  449 	jrne 1$
      00941C 94 2C 94         [ 4]  450 	call get_code_addr
      00941F 29               [ 4]  451 	call (x) 
      009420 3E 00            [ 2]  452 	jra interp_loop 
      001780                        453 1$:	 
      009422 3D 00            [ 1]  454 	cp a,#TK_VAR
      009424 3E 3D            [ 1]  455 	jrne 2$
      009426 00 3C 00         [ 4]  456 	call let_var  
      009429 3C 3D            [ 2]  457 	jra interp_loop 
      001789                        458 2$:	
      00942B 00 3C            [ 1]  459 	cp a,#TK_ARRAY 
      00942D 3E 00            [ 1]  460 	jrne 3$
      00942F CD 1C 82         [ 4]  461 	call let_array 
      00942F 52 04            [ 2]  462 	jra interp_loop
      001792                        463 3$:	
      009431 72 5F            [ 1]  464 	cp a,#TK_COLON 
      009433 00 0E            [ 1]  465 	jreq interp_loop
      009435 1F 01            [ 1]  466 4$: cp a,#TK_LABEL
      009437 AE B3 6E         [ 4]  467 	call skip_string 
      00943A 1F 03            [ 2]  468 	jra interp_loop 
      00943C E6 02 A4         [ 2]  469 5$:	jp syntax_error 
                                    470 
                                    471 ;--------------------------
                                    472 ; extract next token from
                                    473 ; token list 
                                    474 ; basicptr -> base address 
                                    475 ; in  -> offset in list array 
                                    476 ; output:
                                    477 ;   A 		token attribute
                                    478 ;   X 		*token_value 
                                    479 ;----------------------------------------
      0017A0                        480 next_token::
                                    481 ;	clrw x 
      00943F 0F C7 00         [ 1]  482 	ld a,in 
      009442 0F 1C 00         [ 1]  483 	ld in.saved,a ; in case "_unget_token" needed 
                                    484 ; don't replace sub by "cp a,count" 
                                    485 ; if end of line must return with A=0   	
      009445 03 72 BB         [ 1]  486 	sub a,count 
      009448 00 0E            [ 1]  487 	jreq 9$ ; end of line 
      0017AB                        488 0$: 
      00944A FE 13 01         [ 2]  489 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00944D 27 0C 1E 03      [ 2]  490 	addw x,in.w 
      009451 FE               [ 1]  491 	ld a,(x)
      009452 1D               [ 1]  492 	incw x
      009453 00 02 26 E3      [ 1]  493 	inc in   
      009457 4F               [ 4]  494 9$: ret 
                                    495 
                                    496 ;------------------------
                                    497 ; get cmd and function 
                                    498 ; code address 
                                    499 ; input:
                                    500 ;    X   * cmd|func index 
                                    501 ;        in code_addr table 
                                    502 ;------------------------
      0017B9                        503 get_code_addr:
      009458 5F               [ 2]  504 	ldw x,(x)
      009459 20 05 1E         [ 2]  505 	ldw x,(code_addr,x)
      00945C 03 1C 00 02      [ 1]  506 	inc in 
      009460 5B 04 81 01      [ 1]  507 	inc in 
      000001 81               [ 4]  508 	ret
                                    509 
                                    510 ;-------------------------
                                    511 ;  skip .asciz in BASIC line 
                                    512 ;  name 
                                    513 ;  input:
                                    514 ;     x		* string 
                                    515 ;  output:
                                    516 ;     none 
                                    517 ;-------------------------
      000002                        518 skip_string:
      000003 F6               [ 1]  519 	ld a,(x)
      000004 27 03            [ 1]  520 	jreq 1$
      000005 5C               [ 1]  521 	incw x 
      000007 20 FA            [ 2]  522 	jra skip_string 
      000009 5C               [ 1]  523 1$: incw x 	
      00000A 72 B0 00 04      [ 2]  524 	subw x,basicptr 
      00000B CF 00 00         [ 2]  525 	ldw in.w,x 
      00000C 81               [ 4]  526 	ret 
                                    527 
                                    528 ;---------------------
                                    529 ; extract 16 bits  
                                    530 ; address from BASIC
                                    531 ; code 
                                    532 ; input:
                                    533 ;    X    *address
                                    534 ; output:
                                    535 ;    X    address 
                                    536 ;-------------------- 
      00000D                        537 get_addr:
      00000E FE               [ 2]  538 	ldw x,(x)
      00000F 72 5C 00 01      [ 1]  539 	inc in 
      000010 72 5C 00 01      [ 1]  540 	inc in 
      000013 81               [ 4]  541 	ret 
                                    542 
                                    543 ;--------------------
                                    544 ; extract int24_t  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    545 ; value from BASIC 
                                    546 ; code 
                                    547 ; input:
                                    548 ;    X   *integer 
                                    549 ; output:
                                    550 ;    A:X   int24  
                                    551 ;--------------------
      000015                        552 get_int24:
      000017 F6               [ 1]  553 	ld a,(x)
      000019 EE 01            [ 2]  554 	ldw x,(1,x)
                                    555 ; skip 3 bytes 
      00001A 72 5C 00 01      [ 1]  556 	inc in 
      00001B 72 5C 00 01      [ 1]  557 	inc in 
      00001C 72 5C 00 01      [ 1]  558 	inc in 
      00001E 81               [ 4]  559 	ret 
                                    560 
                                    561 ;-------------------------
                                    562 ; get character from 
                                    563 ; BASIC code 
                                    564 ; input:
                                    565 ;    X   *char 
                                    566 ; output:
                                    567 ;    A    char 
                                    568 ;-------------------------
      000020                        569 get_char:
      000021 F6               [ 1]  570 	ld a,(x)
      000023 72 5C 00 01      [ 1]  571 	inc in  
      000024 81               [ 4]  572     ret 
                                    573 
                                    574 ;-----------------------------------
                                    575 ; print a 16 bit integer 
                                    576 ; using variable 'base' as conversion
                                    577 ; format.
                                    578 ; input:
                                    579 ;    X       integer to print 
                                    580 ;   'base'    conversion base 
                                    581 ; output:
                                    582 ;   terminal  
                                    583 ;-----------------------------------
      000025                        584 prt_i16:
      000027 72 5F 00 0C      [ 1]  585 	clr acc24 
      00002F CF 00 0D         [ 2]  586 	ldw acc16,x 
      000030 A6 10            [ 1]  587 	ld a,#16
      000031 C1 00 0A         [ 1]  588 	cp a,base
      00007C 27 09            [ 1]  589 	jreq prt_acc24  
      00007C 72 0F 00 0D 04   [ 2]  590 	btjf acc16,#7,prt_acc24
      00007E 72 53 00 0C      [ 1]  591 	cpl acc24 ; sign extend 
                                    592 	
                                    593 ;------------------------------------
                                    594 ; print integer in acc24 
                                    595 ; input:
                                    596 ;	acc24 		integer to print 
                                    597 ;	'base' 		numerical base for conversion 
                                    598 ;   'tab_width' field width 
                                    599 ;    A 			signed||unsigned conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    600 ;  output:
                                    601 ;    A          string length
                                    602 ;------------------------------------
      000080                        603 prt_acc24:
      009463 A6 FF            [ 1]  604 	ld a,#255  ; signed conversion  
      009463 89 4F 7D         [ 4]  605     call itoa  ; conversion entier en  .asciz
      009466 27 04 4C         [ 4]  606 	call right_align  
      009469 5C               [ 1]  607 	push a 
      00946A 20 F9 85         [ 4]  608 	call puts
      00946D 81               [ 1]  609 	pop a 
      00946E 81               [ 4]  610     ret	
                                    611 
                                    612 ;---------------------------------------
                                    613 ;  print value at xstack top 
                                    614 ;---------------------------------------
      00181A                        615 print_top: 
      00181A                        616 	_xpop 
      00946E F6 27            [ 1]    1     ld a,(y)
      009470 0B               [ 1]    2     ldw x,y 
      009471 90 F1            [ 2]    3     ldw x,(1,x)
      009473 26 05 5C 90      [ 2]    4     addw y,#CELL_SIZE 
      009477 5C 20 F4         [ 1]  617 	ld acc24,a 
      00947A CF 00 0D         [ 2]  618 	ldw acc16,x 
      00947A 4F 81 0C         [ 4]  619 	call prt_acc24 
      00947C A6 20            [ 1]  620 	ld a,#SPACE
      00947C A6 01 81         [ 4]  621 	call putc 
      00947F 81               [ 4]  622 	ret 
                                    623 
                                    624 ;------------------------------------
                                    625 ; convert integer in acc24 to string
                                    626 ; input:
                                    627 ;   'base'	conversion base 
                                    628 ;	acc24	integer to convert
                                    629 ;   A       0=unsigned, else signed 
                                    630 ; output:
                                    631 ;   X  		pointer to first char of string
                                    632 ;   A       string length
                                    633 ;------------------------------------
                           000001   634 	SIGN=1  ; integer sign 
                           000002   635 	LEN=2 
                           000003   636 	PSTR=3
                           000004   637 	VSIZE=4 ;locals size
      001832                        638 itoa::
      001832                        639 	_vars VSIZE
      00947F 88 89            [ 2]    1     sub sp,#VSIZE 
      009481 90 F6            [ 1]  640 	clr (LEN,sp) ; string length  
      009483 27 06            [ 1]  641 	clr (SIGN,sp)    ; sign
      009485 F7               [ 1]  642 	tnz A
      009486 5C 90            [ 1]  643 	jreq 1$ ; unsigned conversion  
      009488 5C 20 F6         [ 1]  644 	ld a,base 
      00948B 7F 85            [ 1]  645 	cp a,#10
      00948D 84 81            [ 1]  646 	jrne 1$
                                    647 	; base 10 string display with negative sign if bit 23==1
      00948F 72 0F 00 0C 05   [ 2]  648 	btjf acc24,#7,1$
      00948F 88 52            [ 1]  649 	cpl (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009491 02 0F 01         [ 4]  650 	call neg_acc24
      00184C                        651 1$:
                                    652 ; initialize string pointer 
      009494 0F 02 90         [ 2]  653 	ldw x,#tib 
      009497 89 13 01         [ 2]  654 	addw x,#TIB_SIZE
      00949A 90               [ 2]  655 	decw x 
      00949B 85               [ 1]  656 	clr (x)
      001854                        657 itoa_loop:
      00949C 27 31 2B         [ 1]  658     ld a,base
                                    659 ;	ldw (PSTR,sp),x 
      00949F 0E 03 06         [ 4]  660     call divu24_8 ; acc24/A 
                                    661 ;	ldw x,(PSTR,sp)
      0094A0 AB 30            [ 1]  662     add a,#'0  ; remainder of division
      0094A0 72 BB            [ 1]  663     cp a,#'9+1
      0094A2 00 0E            [ 1]  664     jrmi 2$
      0094A4 72 B9            [ 1]  665     add a,#7 
      001862                        666 2$:	
      0094A6 00               [ 2]  667 	decw x
      0094A7 0E               [ 1]  668     ld (x),a
      0094A8 03 01            [ 1]  669 	inc (LEN,sp)
                                    670 	; if acc24==0 conversion done
      0094AA 03 02 20         [ 1]  671 	ld a,acc24
      0094AD 05 00 0D         [ 1]  672 	or a,acc16
      0094AE CA 00 0E         [ 1]  673 	or a,acc8
      0094AE 5A 90            [ 1]  674     jrne itoa_loop
                                    675 	;conversion done, next add '$' or '-' as required
      0094B0 5A 0C 02         [ 1]  676 	ld a,base 
      0094B3 A1 10            [ 1]  677 	cp a,#16
      0094B3 C6 00            [ 1]  678 	jreq 8$
      0094B5 0E CA            [ 1]  679 	ld a,(SIGN,sp)
      0094B7 00 0F            [ 1]  680     jreq 10$
      0094B9 27 14            [ 1]  681     ld a,#'-
      0094BB 72 FB            [ 2]  682 	jra 9$ 
      001880                        683 8$:	
      0094BD 01 72            [ 1]  684 	ld a,#'$ 
      0094BF F9               [ 2]  685 9$: decw x
      0094C0 01               [ 1]  686     ld (x),a
      0094C1 90 F6            [ 1]  687 	inc (LEN,sp)
      001886                        688 10$:
      0094C3 F7 89            [ 1]  689 	ld a,(LEN,sp)
      001888                        690 	_drop VSIZE
      0094C5 CE 00            [ 2]    1     addw sp,#VSIZE 
      0094C7 0E               [ 4]  691 	ret
                                    692 
                                    693 ;------------------------------------
                                    694 ; convert alpha to uppercase
                                    695 ; input:
                                    696 ;    a  character to convert
                                    697 ; output:
                                    698 ;    a  uppercase character
                                    699 ;------------------------------------
      00188B                        700 to_upper::
      0094C8 5A CF            [ 1]  701 	cp a,#'a
      0094CA 00 0E            [ 1]  702 	jrpl 1$
      0094CC 85               [ 4]  703 0$:	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094CD 20 E4            [ 1]  704 1$: cp a,#'z	
      0094CF 22 FB            [ 1]  705 	jrugt 0$
      0094CF 5B 02            [ 1]  706 	sub a,#32
      0094D1 84               [ 4]  707 	ret
                                    708 	
                                    709 ;------------------------------------
                                    710 ; convert pad content in integer
                                    711 ; input:
                                    712 ;    x		* .asciz to convert
                                    713 ; output:
                                    714 ;    acc24      int24_t
                                    715 ;------------------------------------
                                    716 	; local variables
                           000001   717 	SIGN=1 ; 1 byte, 
                           000002   718 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   719 	TEMP=3 ; 1 byte, temporary storage
                           000003   720 	VSIZE=3 ; 3 bytes reserved for local storage
      001897                        721 atoi24::
      0094D2 81               [ 2]  722 	pushw x 
      0094D3                        723 	_vars VSIZE
      0094D3 89 88            [ 2]    1     sub sp,#VSIZE 
                                    724 	; acc24=0 
      0094D5 AE 00 31 A6      [ 1]  725 	clr acc24    
      0094D9 4E 7F 5C 4A      [ 1]  726 	clr acc16
      0094DD 26 FB 84 85      [ 1]  727 	clr acc8 
      0094E1 81 0A            [ 1]  728 	clr (SIGN,sp)
      0094E3 0A 54            [ 1]  729 	ld a,#10
      0094E5 69 6E            [ 1]  730 	ld (BASE,sp),a ; default base decimal
      0094E7 79               [ 1]  731 	ld a,(x)
      0094E8 20 42            [ 1]  732 	jreq 9$  ; completed if 0
      0094EA 41 53            [ 1]  733 	cp a,#'-
      0094EC 49 43            [ 1]  734 	jrne 1$
      0094EE 20 66            [ 1]  735 	cpl (SIGN,sp)
      0094F0 6F 72            [ 2]  736 	jra 2$
      0094F2 20 53            [ 1]  737 1$: cp a,#'$
      0094F4 54 4D            [ 1]  738 	jrne 3$
      0094F6 38 0A            [ 1]  739 	ld a,#16
      0094F8 43 6F            [ 1]  740 	ld (BASE,sp),a
      0094FA 70               [ 1]  741 2$:	incw x
      0094FB 79               [ 1]  742 	ld a,(x)
      0018C1                        743 3$:	
      0094FC 72 69            [ 1]  744 	cp a,#'a
      0094FE 67 68            [ 1]  745 	jrmi 4$
      009500 74 2C            [ 1]  746 	sub a,#32
      009502 20 4A            [ 1]  747 4$:	cp a,#'0
      009504 61 63            [ 1]  748 	jrmi 9$
      009506 71 75            [ 1]  749 	sub a,#'0
      009508 65 73            [ 1]  750 	cp a,#10
      00950A 20 44            [ 1]  751 	jrmi 5$
      00950C 65 73            [ 1]  752 	sub a,#7
      00950E 63 68            [ 1]  753 	cp a,(BASE,sp)
      009510 65 6E            [ 1]  754 	jrpl 9$
      009512 65 73            [ 1]  755 5$:	ld (TEMP,sp),a
      009514 20 32            [ 1]  756 	ld a,(BASE,sp)
      009516 30 31 39         [ 4]  757 	call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009519 2C 32            [ 1]  758 	ld a,(TEMP,sp)
      00951B 30 32 32         [ 1]  759 	add a,acc24+2
      00951E 0A 76 65         [ 1]  760 	ld acc24+2,a
      009521 72               [ 1]  761 	clr a
      009522 73 69 6F         [ 1]  762 	adc a,acc24+1
      009525 6E 20 00         [ 1]  763 	ld acc24+1,a
      009528 4F               [ 1]  764 	clr a
      009528 AE 94 E2         [ 1]  765 	adc a,acc24
      00952B CD 8A 1E         [ 1]  766 	ld acc24,a
      00952E A6 02            [ 2]  767 	jra 2$
      009530 C7 00            [ 1]  768 9$:	tnz (SIGN,sp)
      009532 0F 5F            [ 1]  769     jreq atoi_exit
      009534 CF 00 0D         [ 4]  770     call neg_acc24
      0018FD                        771 atoi_exit: 
      0018FD                        772 	_drop VSIZE
      009537 72 5F            [ 2]    1     addw sp,#VSIZE 
      009539 00               [ 2]  773 	popw x ; restore x
      00953A 24               [ 4]  774 	ret
                                    775 
                                    776 
                                    777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    778 ;;   TINY BASIC  operators,
                                    779 ;;   commands and functions 
                                    780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    781 
                                    782 ;---------------------------------
                                    783 ; dictionary search 
                                    784 ; input:
                                    785 ;	X 		dictionary entry point, name field  
                                    786 ;   y		.asciz name to search 
                                    787 ; output:
                                    788 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    789 ;  X		cmd_index
                                    790 ;---------------------------------
                           000001   791 	NLEN=1 ; cmd length 
                           000002   792 	XSAVE=2
                           000004   793 	YSAVE=4
                           000005   794 	VSIZE=5 
      001901                        795 search_dict::
      001901                        796 	_vars VSIZE 
      00953B 35 0A            [ 2]    1     sub sp,#VSIZE 
      00953D 00 0B            [ 2]  797 	ldw (YSAVE,sp),y 
      001905                        798 search_next:
      00953F CD 98            [ 2]  799 	ldw (XSAVE,sp),x 
                                    800 ; get name length in dictionary	
      009541 8C               [ 1]  801 	ld a,(x)
      009542 A6 2E            [ 1]  802 	and a,#0xf 
      009544 CD 89            [ 1]  803 	ld (NLEN,sp),a  
      009546 C1 A6            [ 2]  804 	ldw y,(YSAVE,sp) ; name pointer 
      009548 00               [ 1]  805 	incw x 
      00190F                        806 cp_loop:
      009549 C7 00            [ 1]  807 	ld a,(y)
      00954B 0F 5F            [ 1]  808 	jreq str_match 
      00954D CF 00            [ 1]  809 	tnz (NLEN,sp)
      00954F 0D CD            [ 1]  810 	jreq no_match  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009551 98               [ 1]  811 	cp a,(x)
      009552 8C A6            [ 1]  812 	jrne no_match 
      009554 0D CD            [ 1]  813 	incw y 
      009556 89               [ 1]  814 	incw x
      009557 C1 81            [ 1]  815 	dec (NLEN,sp)
      009559 20 EE            [ 2]  816 	jra cp_loop 
      001921                        817 no_match:
      009559 90 AE            [ 2]  818 	ldw x,(XSAVE,sp) 
      00955B 17 73 72         [ 2]  819 	subw x,#2 ; move X to link field
      00955E 5F 00            [ 1]  820 	push #TK_NONE 
      009560 23               [ 2]  821 	ldw x,(x) ; next word link 
      009561 72               [ 1]  822 	pop a ; TK_NONE 
      009562 5F 00            [ 1]  823 	jreq search_exit  ; not found  
                                    824 ;try next 
      009564 20 35            [ 2]  825 	jra search_next
      00192E                        826 str_match:
      009566 04 00            [ 2]  827 	ldw x,(XSAVE,sp)
      009568 24               [ 1]  828 	ld a,(X)
      009569 35 0A            [ 1]  829 	ld (NLEN,sp),a ; needed to test keyword type  
      00956B 00 0B            [ 1]  830 	and a,#NLEN_MASK 
                                    831 ; move x to procedure address field 	
      00956D AE               [ 1]  832 	inc a 
      00956E 00 00 CF         [ 1]  833 	ld acc8,a 
      009571 00 05 CF 00      [ 1]  834 	clr acc16 
      009575 01 72 5F 00      [ 2]  835 	addw x,acc16 
      009579 04               [ 2]  836 	ldw x,(x) ; routine index  
                                    837 ;determine keyword type bits 7:4 
      00957A 81 01            [ 1]  838 	ld a,(NLEN,sp)
      00957B A4 F0            [ 1]  839 	and a,#KW_TYPE_MASK 
      00957B 89               [ 1]  840 	swap a 
      00957C 72 5F            [ 1]  841 	add a,#128
      001949                        842 search_exit: 
      001949                        843 	_drop VSIZE 
      00957E 00 04            [ 2]    1     addw sp,#VSIZE 
      009580 72               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------
                                    847 ; check if next token
                                    848 ;  is of expected type 
                                    849 ; input:
                                    850 ;   A 		 expected token attribute
                                    851 ;  ouput:
                                    852 ;   none     if fail call syntax_error 
                                    853 ;--------------------
      00194C                        854 expect:
      009581 5F               [ 1]  855 	push a 
      009582 00 02 AE         [ 4]  856 	call next_token 
      009585 00 80            [ 1]  857 	cp a,(1,sp)
      009587 CF 00            [ 1]  858 	jreq 1$
      009589 1C CF 00         [ 2]  859 	jp syntax_error
      00958C 1E               [ 1]  860 1$: pop a 
      00958D CD               [ 4]  861 	ret 
                                    862 
                                    863 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    864 ; parse arguments list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    865 ; between ()
                                    866 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001959                        867 func_args:
      00958E 94 D3            [ 1]  868 	ld a,#TK_LPAREN 
      009590 85 81 4C         [ 4]  869 	call expect 
                                    870 ; expected to continue in arg_list 
                                    871 ; caller must check for TK_RPAREN 
                                    872 
                                    873 ;-------------------------------
                                    874 ; parse embedded BASIC routines 
                                    875 ; arguments list.
                                    876 ; arg_list::=  expr[','expr]*
                                    877 ; all arguments are of int24_t type
                                    878 ; and pushed on stack 
                                    879 ; input:
                                    880 ;   none
                                    881 ; output:
                                    882 ;   xstack{n}   arguments pushed on xstack
                                    883 ;   A 	number of arguments pushed on xstack  
                                    884 ;--------------------------------
      009592                        885 arg_list:
      009592 00 00            [ 1]  886 	push #0
      009594 95 B4 95         [ 4]  887 1$:	call condition 
      009597 C1               [ 1]  888 	tnz a 
      009598 95 CF            [ 1]  889 	jreq 7$  
      00959A 95 E8            [ 1]  890 	inc (1,sp)
      00959C 95 F7 96         [ 4]  891 	call next_token 
      00959F 0D 96            [ 1]  892 	cp a,#TK_COMMA 
      0095A1 23 96            [ 1]  893 	jreq 1$ 
      0095A3 3D 96            [ 1]  894 	cp a,#TK_RPAREN
      0095A5 4E 96            [ 1]  895 	jreq 7$
      001973                        896 	_unget_token 
      0095A7 5F 96 6B 96 9E   [ 1]    1      mov in,in.saved  
      0095AC 96               [ 1]  897 7$:	pop a  
      0095AD AE               [ 4]  898 	ret 
                                    899 
                                    900 ;--------------------------------
                                    901 ;   BASIC commnands 
                                    902 ;--------------------------------
                                    903 
                                    904 ;--------------------------------
                                    905 ;  arithmetic and relational 
                                    906 ;  routines
                                    907 ;  operators precedence
                                    908 ;  highest to lowest
                                    909 ;  operators on same row have 
                                    910 ;  same precedence and are executed
                                    911 ;  from left to right.
                                    912 ;	'*','/','%'
                                    913 ;   '-','+'
                                    914 ;   '=','>','<','>=','<=','<>','><'
                                    915 ;   '<>' and '><' are equivalent for not equal.
                                    916 ;--------------------------------
                                    917 
                                    918 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    919 ; return array element
                                    920 ; address from @(expr)
                                    921 ; input:
                                    922 ;   A 		TK_ARRAY
                                    923 ; output:
                                    924 ;	X 		element address 
                                    925 ;----------------------
      00197A                        926 get_array_element:
      0095AE 96 C2 96         [ 4]  927 	call func_args 
      0095B1 D5 96            [ 1]  928 	cp a,#1
      0095B3 E2 4D            [ 1]  929 	jreq 1$
      0095B5 65 6D 6F         [ 2]  930 	jp syntax_error
      001984                        931 1$: _xpop 
      0095B8 72 79            [ 1]    1     ld a,(y)
      0095BA 20               [ 1]    2     ldw x,y 
      0095BB 66 75            [ 2]    3     ldw x,(1,x)
      0095BD 6C 6C 0A 00      [ 2]    4     addw y,#CELL_SIZE 
                                    932     ; ignore A, index < 65536 in any case 
                                    933 	; check for bounds 
      0095C1 73 79 6E         [ 2]  934 	cpw x,array_size 
      0095C4 74 61            [ 2]  935 	jrule 3$
                                    936 ; bounds {1..array_size}	
      0095C6 78 20            [ 1]  937 2$: ld a,#ERR_BAD_VALUE 
      0095C8 65 72 72         [ 2]  938 	jp tb_error 
      0095CB 6F               [ 2]  939 3$: tnzw  x
      0095CC 72 0A            [ 1]  940 	jreq 2$ 
      0095CE 00               [ 2]  941 	pushw x 
      0095CF 6D               [ 2]  942 	sllw x 
      0095D0 61 74 68         [ 2]  943 	addw x,(1,sp) ; index*size_of(int24)
      0095D3 20 6F            [ 2]  944 	ldw (1,sp),x  
      0095D5 70 65 72         [ 2]  945 	ldw x,#tib ; array is below tib 
      0095D8 61 74 69         [ 2]  946 	subw x,(1,sp)
      0019A7                        947 	_drop 2   
      0095DB 6F 6E            [ 2]    1     addw sp,#2 
      0095DD 20               [ 4]  948 	ret 
                                    949 
                                    950 
                                    951 ;***********************************
                                    952 ;   expression parse,execute 
                                    953 ;***********************************
                                    954 ;-----------------------------------
                                    955 ; factor ::= ['+'|'-'|e]  var | @ |
                                    956 ;			 integer | function |
                                    957 ;			 '('relation')' 
                                    958 ; output:
                                    959 ;   A       token attribute 
                                    960 ;   xstack  value  
                                    961 ; ---------------------------------
                           000001   962 	NEG=1
                           000001   963 	VSIZE=1
      0019AA                        964 factor:
      0019AA                        965 	_vars VSIZE 
      0095DE 6F 76            [ 2]    1     sub sp,#VSIZE 
      0095E0 65 72            [ 1]  966 	clr (NEG,sp)
      0095E2 66 6C 6F         [ 4]  967 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0095E5 77               [ 1]  968 	tnz a 
      0095E6 0A 00            [ 1]  969 	jrne 1$ 
      0095E8 64 69 76         [ 2]  970 	jp 22$ 
      0095EB 69 73            [ 1]  971 1$:	cp a,#TK_PLUS 
      0095ED 69 6F            [ 1]  972 	jreq 2$
      0095EF 6E 20            [ 1]  973 	cp a,#TK_MINUS 
      0095F1 62 79            [ 1]  974 	jrne 4$ 
      0095F3 20 30            [ 1]  975 	cpl (NEG,sp)
      0019C1                        976 2$:	
      0095F5 0A 00 69         [ 4]  977 	call next_token
      0019C4                        978 4$:
      0095F8 6E               [ 1]  979 	tnz a 
      0095F9 76 61            [ 1]  980 	jrne 41$ 
      0095FB 6C 69 64         [ 2]  981 	jp syntax_error  
      0019CA                        982 41$:	
      0095FE 20 6C            [ 1]  983 	cp a,#TK_IFUNC 
      009600 69 6E            [ 1]  984 	jrne 5$ 
      009602 65 20 6E         [ 4]  985 	call get_code_addr 
      009605 75               [ 4]  986 	call (x); result in A:X  
      009606 6D 62            [ 2]  987 	jra 18$ 
      0019D4                        988 5$:
      009608 65 72            [ 1]  989 	cp a,#TK_INTGR
      00960A 2E 0A            [ 1]  990 	jrne 6$
      00960C 00 72 75         [ 4]  991 	call get_int24 ; A:X
      00960F 6E 20            [ 2]  992 	jra 18$
      0019DD                        993 6$:
      009611 74 69            [ 1]  994 	cp a,#TK_ARRAY
      009613 6D 65            [ 1]  995 	jrne 7$
      009615 20 6F 6E         [ 4]  996 	call get_array_element
      009618 6C 79            [ 2]  997     jra 71$
      0019E6                        998 7$:
      00961A 20 75            [ 1]  999 	cp a,#TK_VAR 
      00961C 73 61            [ 1] 1000 	jrne 8$
      00961E 67 65 2E         [ 4] 1001 	call get_addr 
      0019ED                       1002 71$: ; put value in A:X
      009621 0A               [ 1] 1003 	ld a,(x)
      009622 00 63            [ 2] 1004 	ldw x,(1,x)
      009624 6F 6D            [ 2] 1005 	jra 18$
      0019F2                       1006 8$:
      009626 6D 61            [ 1] 1007 	cp a,#TK_LABEL 
      009628 6E 64            [ 1] 1008 	jrne 9$ 
      00962A 20               [ 2] 1009 	pushw x 
      00962B 6C 69 6E         [ 4] 1010 	call skip_string
      00962E 65               [ 2] 1011 	popw x 
      00962F 20 6F 6E         [ 4] 1012 	call search_const 
      009632 6C               [ 2] 1013 	tnzw x 
      009633 79 20            [ 1] 1014 	jreq 16$
      009635 75 73 61         [ 4] 1015 	call get_const_value ; in A:X 
      009638 67 65            [ 2] 1016 	jra 18$
      001A06                       1017 9$: 
      00963A 2E 0A            [ 1] 1018 	cp a,#TK_CFUNC 
      00963C 00 64            [ 1] 1019 	jrne 12$
      00963E 75 70 6C         [ 4] 1020 	call get_code_addr 
      009641 69               [ 4] 1021 	call(x)
      009642 63               [ 1] 1022 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009643 61               [ 1] 1023 	rlwa x  ; char>int24 in A:X 
      009644 74 65            [ 2] 1024 	jra 18$ 	 
      001A12                       1025 12$:			
      009646 20 6E            [ 1] 1026 	cp a,#TK_LPAREN
      009648 61 6D            [ 1] 1027 	jrne 16$
      00964A 65 2E 0A         [ 4] 1028 	call expression
      00964D 00 46            [ 1] 1029 	ld a,#TK_RPAREN 
      00964F 69 6C 65         [ 4] 1030 	call expect
      001A1E                       1031 	_xpop 
      009652 20 6E            [ 1]    1     ld a,(y)
      009654 6F               [ 1]    2     ldw x,y 
      009655 74 20            [ 2]    3     ldw x,(1,x)
      009657 66 6F 75 6E      [ 2]    4     addw y,#CELL_SIZE 
      00965B 64 2E            [ 2] 1032 	jra 18$	
      001A29                       1033 16$:
      001A29                       1034 	_unget_token 
      00965D 0A 00 62 61 64   [ 1]    1      mov in,in.saved  
      009662 20               [ 1] 1035 	clr a 
      009663 76 61            [ 2] 1036 	jra 22$ 
      001A31                       1037 18$: 
      009665 6C 75            [ 1] 1038 	tnz (NEG,sp)
      009667 65 2E            [ 1] 1039 	jreq 20$
      009669 0A 00 46         [ 4] 1040 	call neg_ax   
      001A38                       1041 20$:
      001A38                       1042 	_xpush 
      00966C 69 6C 65 20      [ 2]    1     subw y,#CELL_SIZE
      009670 69 6E            [ 1]    2     ld (y),a 
      009672 20 65 78         [ 2]    3     ldw (1,y),x 
      009675 74 65            [ 1] 1043 	ld a,#TK_INTGR
      001A43                       1044 22$:
      001A43                       1045 	_drop VSIZE
      009677 6E 64            [ 2]    1     addw sp,#VSIZE 
      009679 65               [ 4] 1046 	ret
                                   1047 
                                   1048 
                                   1049 ;-----------------------------------
                                   1050 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1051 ; output:
                                   1052 ;   A    	token attribute 
                                   1053 ;	xstack		value 
                                   1054 ;-----------------------------------
                           000001  1055 	MULOP=1
                           000001  1056 	VSIZE=1
      001A46                       1057 term:
      001A46                       1058 	_vars VSIZE
      00967A 64 20            [ 2]    1     sub sp,#VSIZE 
                                   1059 ; first factor 	
      00967C 6D 65 6D         [ 4] 1060 	call factor
      00967F 6F               [ 1] 1061 	tnz a 
      009680 72 79            [ 1] 1062 	jreq term_exit  
      001A4E                       1063 term01:	 ; check for  operator '*'|'/'|'%' 
      009682 2C 20 63         [ 4] 1064 	call next_token
      009685 61 6E            [ 1] 1065 	ld (MULOP,sp),a
      009687 27 74            [ 1] 1066 	and a,#TK_GRP_MASK
      009689 20 62            [ 1] 1067 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00968B 65 20            [ 1] 1068 	jreq 1$
      00968D 72 75            [ 1] 1069 	ld a,#TK_INTGR
      001A5B                       1070 	_unget_token 
      00968F 6E 20 66 72 6F   [ 1]    1      mov in,in.saved  
      009694 6D 20            [ 2] 1071 	jra term_exit 
      001A62                       1072 1$:	; got *|/|%
                                   1073 ;second factor
      009696 74 68 65         [ 4] 1074 	call factor
      009699 72               [ 1] 1075 	tnz a 
      00969A 65 2E            [ 1] 1076 	jrne 2$ 
      00969C 0A 00 4E         [ 2] 1077 	jp syntax_error 
      001A6B                       1078 2$: ; select operation 	
      00969F 6F 20            [ 1] 1079 	ld a,(MULOP,sp) 
      0096A1 64 61            [ 1] 1080 	cp a,#TK_MULT 
      0096A3 74 61            [ 1] 1081 	jrne 3$
                                   1082 ; '*' operator
      0096A5 20 66 6F         [ 4] 1083 	call mul24 
      0096A8 75 6E            [ 2] 1084 	jra term01
      0096AA 64 2E            [ 1] 1085 3$: cp a,#TK_DIV 
      0096AC 0A 00            [ 1] 1086 	jrne 4$ 
                                   1087 ; '/' operator	
      0096AE 4E 6F 20         [ 4] 1088 	call div24 
      0096B1 70 72            [ 2] 1089 	jra term01 
      001A7F                       1090 4$: ; '%' operator
      0096B3 6F 67 72         [ 4] 1091 	call mod24
      0096B6 61 6D            [ 2] 1092 	jra term01 
      001A84                       1093 9$: 
      0096B8 20 69            [ 1] 1094 	ld a,#TK_INTGR
      001A86                       1095 term_exit:
      001A86                       1096 	_drop VSIZE 
      0096BA 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096BC 52               [ 4] 1097 	ret 
                                   1098 
                                   1099 ;-------------------------------
                                   1100 ;  expr ::= term [['+'|'-'] term]*
                                   1101 ;  result range {-32768..32767}
                                   1102 ;  output:
                                   1103 ;   A    token attribute 
                                   1104 ;   xstack	 result    
                                   1105 ;-------------------------------
                           000001  1106 	OP=1 
                           000001  1107 	VSIZE=1 
      001A89                       1108 expression:
      001A89                       1109 	_vars VSIZE 
      0096BD 41 4D            [ 2]    1     sub sp,#VSIZE 
                                   1110 ; first term 	
      0096BF 21 0A 00         [ 4] 1111 	call term
      0096C2 46               [ 1] 1112 	tnz a 
      0096C3 69 6C            [ 1] 1113 	jreq 9$
      001A91                       1114 1$:	; operator '+'|'-'
      0096C5 65 20 73         [ 4] 1115 	call next_token
      0096C8 79 73            [ 1] 1116 	ld (OP,sp),a 
      0096CA 74 65            [ 1] 1117 	and a,#TK_GRP_MASK
      0096CC 6D 20            [ 1] 1118 	cp a,#TK_GRP_ADD 
      0096CE 66 75            [ 1] 1119 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001A9C                       1120 	_unget_token 
      0096D0 6C 6C 2E 0A 00   [ 1]    1      mov in,in.saved  
      0096D5 42 75            [ 1] 1121 	ld a,#TK_INTGR
      0096D7 66 66            [ 2] 1122 	jra 9$ 
      001AA5                       1123 2$: ; second term 
      0096D9 65 72 20         [ 4] 1124 	call term
      0096DC 66               [ 1] 1125 	tnz a 
      0096DD 75 6C            [ 1] 1126 	jrne 3$
      0096DF 6C 0A 00         [ 2] 1127 	jp syntax_error
      001AAE                       1128 3$:
      0096E2 6F 76            [ 1] 1129 	ld a,(OP,sp)
      0096E4 65 72            [ 1] 1130 	cp a,#TK_PLUS 
      0096E6 66 6C            [ 1] 1131 	jrne 4$
                                   1132 ; '+' operator	
      0096E8 6F 77 0A         [ 4] 1133 	call add24
      0096EB 00 0A            [ 2] 1134 	jra 1$ 
      001AB9                       1135 4$:	; '-' operator 
      0096ED 72 75 6E         [ 4] 1136 	call sub24
      0096F0 20 74            [ 2] 1137 	jra 1$
      001ABE                       1138 9$:
      001ABE                       1139 	_drop VSIZE 
      0096F2 69 6D            [ 2]    1     addw sp,#VSIZE 
      0096F4 65               [ 4] 1140 	ret 
                                   1141 
                                   1142 ;---------------------------------------------
                                   1143 ; rel ::= expr rel_op expr
                                   1144 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1145 ;  relation return  integer , zero is false 
                                   1146 ;  output:
                                   1147 ;	 xstack		value  
                                   1148 ;---------------------------------------------
                           000001  1149 	RELOP=1
                           000001  1150 	VSIZE=1 
      001AC1                       1151 relation: 
      001AC1                       1152 	_vars VSIZE
      0096F5 20 65            [ 2]    1     sub sp,#VSIZE 
      0096F7 72 72 6F         [ 4] 1153 	call expression
      0096FA 72               [ 1] 1154 	tnz a 
      0096FB 2C 20            [ 1] 1155 	jreq 9$ 
                                   1156 ; expect rel_op or leave 
      0096FD 00 0A 63         [ 4] 1157 	call next_token 
      009700 6F 6D            [ 1] 1158 	ld (RELOP,sp),a 
      009702 70 69            [ 1] 1159 	and a,#TK_GRP_MASK
      009704 6C 65            [ 1] 1160 	cp a,#TK_GRP_RELOP 
      009706 20 65            [ 1] 1161 	jreq 2$
      009708 72 72            [ 1] 1162 	ld a,#TK_INTGR 
      001AD6                       1163 	_unget_token 
      00970A 6F 72 2C 20 00   [ 1]    1      mov in,in.saved  
      00970F 6C 61            [ 2] 1164 	jra 9$ 
      001ADD                       1165 2$:	; expect another expression
      009711 73 74 20         [ 4] 1166 	call expression
      009714 74               [ 1] 1167 	tnz a 
      009715 6F 6B            [ 1] 1168 	jrne 3$
      009717 65 6E 20         [ 2] 1169 	jp syntax_error 
      001AE6                       1170 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00971A 69 64 3A         [ 4] 1171 	call cp24 
      001AE9                       1172 	_xpop  
      00971D 20 00            [ 1]    1     ld a,(y)
      00971F 93               [ 1]    2     ldw x,y 
      00971F A6 02            [ 2]    3     ldw x,(1,x)
      009721 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009721 72               [ 1] 1173 	tnz a 
      009722 0A 00            [ 1] 1174 	jrmi 4$
      009724 23 4C            [ 1] 1175 	jrne 5$
      009726 88 AE 96 EC      [ 1] 1176 	mov acc8,#2 ; i1==i2
      00972A CD 8A            [ 2] 1177 	jra 6$ 
      001AFD                       1178 4$: ; i1<i2
      00972C 1E 84 AE 95      [ 1] 1179 	mov acc8,#4 
      009730 92 72            [ 2] 1180 	jra 6$
      001B03                       1181 5$: ; i1>i2
      009732 5F 00 0E 48      [ 1] 1182 	mov acc8,#1  
      001B07                       1183 6$: ; 0=false, -1=true 
      009736 72               [ 1] 1184 	clrw x 
      009737 59 00 0E         [ 1] 1185 	ld a, acc8  
      00973A C7 00            [ 1] 1186 	and a,(RELOP,sp)
      00973C 0F 72            [ 1] 1187 	jreq 7$
      00973E BB               [ 2] 1188 	cplw x 
      00973F 00 0E            [ 1] 1189 	ld a,#255 
      001B12                       1190 7$:	_xpush 
      009741 FE CD 8A 1E      [ 2]    1     subw y,#CELL_SIZE
      009745 CE 00            [ 1]    2     ld (y),a 
      009747 05 C6 00         [ 2]    3     ldw (1,y),x 
      00974A 04 90            [ 1] 1191 	ld a,#TK_INTGR
      001B1D                       1192 9$: 
      001B1D                       1193 	_drop VSIZE
      00974C 5F 90            [ 2]    1     addw sp,#VSIZE 
      00974E 02               [ 4] 1194 	ret 
                                   1195 
                                   1196 ;-------------------------------------------
                                   1197 ;  AND factor:  [NOT] relation | (condition)
                                   1198 ;  output:
                                   1199 ;     A      TK_INTGR|0
                                   1200 ;-------------------------------------------
                           000001  1201 	NOT_OP=1
      001B20                       1202 and_factor:
      00974F CD 87            [ 1] 1203 	push #0 
      009751 1D CE 00         [ 4] 1204 0$:	call next_token  
      009754 05               [ 1] 1205 	tnz a 
      009755 C6 00            [ 1] 1206 	jreq 8$ 
      009757 02 CD            [ 1] 1207 	cp a,#TK_NOT 
      009759 A0 4C            [ 1] 1208 	jrne 1$ 
      00975B AE 97            [ 1] 1209 	cpl (NOT_OP,sp)
      00975D 0F CD            [ 2] 1210 	jra 0$ 
      001B30                       1211 1$:	
      00975F 8A 1E            [ 1] 1212 	cp a,#TK_LPAREN 
      009761 C6 00            [ 1] 1213 	jrne 2$
      009763 03 5F 97         [ 4] 1214 	call condition
      009766 72 BB            [ 1] 1215 	ld a,#TK_RPAREN 
      009768 00 05 F6         [ 4] 1216 	call expect
      00976B 5F 97            [ 2] 1217 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      001B3E                       1218 2$: _unget_token 
      00976D CD 98 75 20 35   [ 1]    1      mov in,in.saved  
      009772 CD 1A C1         [ 4] 1219 	call relation
      001B46                       1220 3$:
      009772 88 AE            [ 1] 1221 	tnz (NOT_OP,sp)
      009774 96 FE            [ 1] 1222 	jreq 8$ 
      009776 CD 8A 1E         [ 4] 1223 	call cpl24
      001B4D                       1224 8$:
      001B4D                       1225 	_drop 1  
      009779 84 AE            [ 2]    1     addw sp,#1 
      00977B 95               [ 4] 1226     ret 
                                   1227 
                                   1228 
                                   1229 ;--------------------------------------------
                                   1230 ;  AND operator as priority over OR||XOR 
                                   1231 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1232 ;          
                                   1233 ;  output:
                                   1234 ;     A     TK_INTGR|0
                                   1235 ;    xtack   value 
                                   1236 ;--------------------------------------------
      001B50                       1237 and_cond:
      00977C 92 72 5F         [ 4] 1238 	call and_factor
      00977F 00               [ 1] 1239 	tnz a 
      009780 0E 48            [ 1] 1240 	jreq 9$  
      009782 72 59 00         [ 4] 1241 1$: call next_token 
      009785 0E               [ 1] 1242 	tnz a 
      009786 C7 00            [ 1] 1243 	jreq 6$ 
      009788 0F 72            [ 1] 1244 	cp a,#TK_AND 
      00978A BB 00            [ 1] 1245 	jreq 3$
      001B60                       1246 	_unget_token 
      00978C 0E FE CD 8A 1E   [ 1]    1      mov in,in.saved  
      009791 AE 16            [ 2] 1247 	jra 6$ 
      009793 68 CD 8A         [ 4] 1248 3$:	call and_factor  
      009796 1E               [ 1] 1249 	tnz a 
      009797 A6 0D            [ 1] 1250 	jrne 4$
      009799 CD 89 C1         [ 2] 1251 	jp syntax_error 
      001B70                       1252 4$:	
      001B70                       1253 	_xpop 
      00979C CE 00            [ 1]    1     ld a,(y)
      00979E 01               [ 1]    2     ldw x,y 
      00979F CD 8A            [ 2]    3     ldw x,(1,x)
      0097A1 8B A6 5E CD      [ 2]    4     addw y,#CELL_SIZE 
      0097A5 89 C1 AE         [ 1] 1254 	ld acc24,a 
      0097A8 17 FF 94         [ 2] 1255 	ldw acc16,x
      0097AB                       1256 	_xpop 
      0097AB CD 95            [ 1]    1     ld a,(y)
      0097AD 59               [ 1]    2     ldw x,y 
      0097AE EE 01            [ 2]    3     ldw x,(1,x)
      0097AE A6 0D CD 89      [ 2]    4     addw y,#CELL_SIZE 
      0097B2 C1 A6 3E         [ 1] 1257 	and a,acc24 
      0097B5 CD               [ 1] 1258 	rlwa x 
      0097B6 89 C1 CD         [ 1] 1259 	and a,acc16 
      0097B9 8B               [ 1] 1260 	rlwa x 
      0097BA 23 72 5D         [ 1] 1261 	and a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      0097BD 00               [ 1] 1262 	rlwa x
      001B94                       1263 	_xpush
      0097BE 04 27 ED CD      [ 2]    1     subw y,#CELL_SIZE
      0097C2 91 4C            [ 1]    2     ld (y),a 
      0097C4 72 5D 00         [ 2]    3     ldw (1,y),x 
      0097C7 04 27            [ 2] 1264 	jra 1$  
      0097C9 E4 84            [ 1] 1265 6$: ld a,#TK_INTGR 
      0097CA 81               [ 4] 1266 9$:	ret 	 
                                   1267 
                                   1268 
                                   1269 ;--------------------------------------------
                                   1270 ; condition for IF and UNTIL 
                                   1271 ; operators: OR,XOR 
                                   1272 ; format:  and_cond [ OP and_cond ]* 
                                   1273 ; output:
                                   1274 ;    A        INTGR|0 
                                   1275 ;    xstack   value 
                                   1276 ;--------------------------------------------
                           000001  1277 	ATMP=1
                           000002  1278 	OP=2
                           000002  1279 	VSIZE=2 
      001BA2                       1280 condition:
      001BA2                       1281 	_vars VSIZE 
      0097CA C6 00            [ 2]    1     sub sp,#VSIZE 
      0097CC 02 C1 00         [ 4] 1282 	call and_cond
      0097CF 04               [ 1] 1283 	tnz a 
      0097D0 2B 1D            [ 1] 1284 	jreq 9$ 
      0097D2 CD 17 A0         [ 4] 1285 1$:	call next_token 
      0097D2 72 01            [ 1] 1286 	cp a,#TK_OR 
      0097D4 00 23            [ 1] 1287 	jreq 2$
      0097D6 D7 CE            [ 1] 1288 	cp a,#TK_XOR
      0097D8 00 05            [ 1] 1289 	jreq 2$ 
      001BB5                       1290 	_unget_token 
      0097DA 72 BB 00 01 C3   [ 1]    1      mov in,in.saved  
      0097DF 00 1E            [ 2] 1291 	jra 8$ 
      0097E1 2A C8            [ 1] 1292 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097E3 CF 00 05         [ 4] 1293 	call and_cond
      0097E6 E6 02            [ 1] 1294 	cp a,#TK_INTGR 
      0097E8 C7 00            [ 1] 1295 	jreq 3$
      0097EA 04 35 03         [ 2] 1296 	jp syntax_error 
      001BC8                       1297 3$:	 
      001BC8                       1298 	_xpop  ; rigth arg 
      0097ED 00 02            [ 1]    1     ld a,(y)
      0097EF 93               [ 1]    2     ldw x,y 
      0097EF CD 98            [ 2]    3     ldw x,(1,x)
      0097F1 20 A1 00 27      [ 2]    4     addw y,#CELL_SIZE 
      0097F5 DC A1 80         [ 1] 1299 	ld acc24,a 
      0097F8 26 06 CD         [ 2] 1300 	ldw acc16,x 
      001BD7                       1301 	_xpop  ; left arg  
      0097FB 98 39            [ 1]    1     ld a,(y)
      0097FD FD               [ 1]    2     ldw x,y 
      0097FE 20 EF            [ 2]    3     ldw x,(1,x)
      009800 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009800 A1 85            [ 1] 1302 	ld (ATMP,sp),a 
      009802 26 05            [ 1] 1303 	ld a,(OP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009804 CD 9D            [ 1] 1304 	cp a,#TK_XOR 
      009806 07 20            [ 1] 1305 	jreq 5$ 
      001BE8                       1306 4$: ; A:X OR acc24   
      009808 E6 01            [ 1] 1307 	ld a,(ATMP,sp)
      009809 CA 00 0C         [ 1] 1308 	or a,acc24 
      009809 A1               [ 1] 1309 	rlwa x 
      00980A 05 26 05         [ 1] 1310 	or a,acc16 
      00980D CD               [ 1] 1311 	rlwa x 
      00980E 9D 02 20         [ 1] 1312 	or a,acc8 
      009811 DD               [ 1] 1313 	rlwa x 
      009812 20 0E            [ 2] 1314 	jra 6$  
      001BF8                       1315 5$: ; A:X XOR acc24 
      009812 A1 0A            [ 1] 1316 	ld a,(ATMP,sp)
      009814 27 D9 A1         [ 1] 1317 	xor a,acc24 
      009817 03               [ 1] 1318 	rlwa x 
      009818 CD 98 46         [ 1] 1319 	xor a,acc16 
      00981B 20               [ 1] 1320 	rlwa x 
      00981C D2 CC 97         [ 1] 1321 	xor a,acc8 
      00981F 1F               [ 1] 1322 	rlwa x 
      009820                       1323 6$: _xpush
      009820 C6 00 02 C7      [ 2]    1     subw y,#CELL_SIZE
      009824 00 03            [ 1]    2     ld (y),a 
      009826 C0 00 04         [ 2]    3     ldw (1,y),x 
      009829 27 0D            [ 2] 1324 	jra 1$ 
      00982B A6 84            [ 1] 1325 8$:	ld a,#TK_INTGR 
      001C13                       1326 9$:	_drop VSIZE 
      00982B CE 00            [ 2]    1     addw sp,#VSIZE 
      00982D 05               [ 4] 1327 	ret 
                                   1328 
                                   1329 
                                   1330 ;--------------------------------------------
                                   1331 ; BASIC: HEX 
                                   1332 ; select hexadecimal base for integer print
                                   1333 ;---------------------------------------------
      001C16                       1334 hex_base:
      00982E 72 BB 00 01      [ 1] 1335 	mov base,#16 
      009832 F6               [ 4] 1336 	ret 
                                   1337 
                                   1338 ;--------------------------------------------
                                   1339 ; BASIC: DEC 
                                   1340 ; select decimal base for integer print
                                   1341 ;---------------------------------------------
      001C1B                       1342 dec_base:
      009833 5C 72 5C 00      [ 1] 1343 	mov base,#10
      009837 02               [ 4] 1344 	ret 
                                   1345 
                                   1346 ;------------------------
                                   1347 ; BASIC: FREE 
                                   1348 ; return free size in RAM 
                                   1349 ; output:
                                   1350 ;   A:x		size 
                                   1351 ;--------------------------
      001C20                       1352 free:
      009838 81 89            [ 2] 1353 	pushw y 
      009839 4F               [ 1] 1354 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009839 FE DE B3         [ 2] 1355 	ldw x,#tib 
      00983C 76 72 5C 00      [ 2] 1356 	ldw y,txtend 
      009840 02 72 5C 00      [ 2] 1357 	cpw y,#app_space
      009844 02 81            [ 1] 1358 	jrult 1$
      009846 1D 00 80         [ 2] 1359 	subw x,#free_ram 
      009846 F6 27            [ 2] 1360 	jra 2$ 
      001C35                       1361 1$:	
      009848 03 5C 20 FA      [ 2] 1362 	subw x,txtend
      00984C 5C 72            [ 2] 1363 2$:	popw y 
      00984E B0               [ 4] 1364 	ret 
                                   1365 
                                   1366 ;------------------------------
                                   1367 ; BASIC: SIZE 
                                   1368 ; command that print 
                                   1369 ; program start addres and size 
                                   1370 ;------------------------------
      001C3C                       1371 cmd_size:
      00984F 00 05 CF         [ 1] 1372 	push base 
      009852 00 01 81         [ 2] 1373 	ldw x,#PROG_ADDR 
      009855 CD 09 9E         [ 4] 1374 	call puts 
      009855 FE 72 5C         [ 2] 1375 	ldw x,txtbgn     
      009858 00 02 72 5C      [ 1] 1376 	mov base,#16 
      00985C 00 02 81         [ 4] 1377 	call prt_i16
      00985F 32 00 0A         [ 1] 1378 	pop base 
      00985F F6 EE 01         [ 2] 1379 	ldw x,#PROG_SIZE 
      009862 72 5C 00         [ 4] 1380 	call puts 
      009865 02 72 5C         [ 2] 1381 	ldw x,txtend 
      009868 00 02 72 5C      [ 2] 1382 	subw x,txtbgn 
      00986C 00 02 81         [ 4] 1383 	call prt_i16
      00986F AE 1E BC         [ 2] 1384 	ldw x,#STR_BYTES 
      00986F F6 72 5C         [ 4] 1385 	call puts  
      009872 00               [ 4] 1386 	ret 
                                   1387 
                                   1388 
                                   1389 ;------------------------
                                   1390 ; BASIC: UBOUND  
                                   1391 ; return array variable size 
                                   1392 ; and set 'array_size' variable 
                                   1393 ; output:
                                   1394 ;   A:X 	array_size
                                   1395 ;--------------------------
      001C69                       1396 ubound:
      009873 02 81 20         [ 4] 1397 	call free 
      009875 A6 03            [ 1] 1398 	ld a,#CELL_SIZE 
      009875 72               [ 2] 1399 	div x,a 
      009876 5F 00 0D         [ 2] 1400 	ldw array_size,x
      009879 CF               [ 1] 1401 	clr a 
      00987A 00               [ 4] 1402 	ret 
                                   1403 
                                   1404 ;-----------------------------
                                   1405 ; BASIC: LET var=expr 
                                   1406 ; variable assignement 
                                   1407 ; output:
                                   1408 ;   A 		TK_NONE 
                                   1409 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      001C74                       1410 let::
      00987B 0E A6 10         [ 4] 1411 	call next_token 
      00987E C1 00            [ 1] 1412 	cp a,#TK_VAR 
      009880 0B 27            [ 1] 1413 	jreq let_var
      009882 09 72            [ 1] 1414 	cp a,#TK_ARRAY 
      009884 0F 00            [ 1] 1415 	jreq  let_array
      009886 0E 04 72         [ 2] 1416 	jp syntax_error
      001C82                       1417 let_array:
      009889 53 00 0D         [ 4] 1418 	call get_array_element
      00988C 20 03            [ 2] 1419 	jra let_eval 
      001C87                       1420 let_var:
      00988C A6 FF CD         [ 4] 1421 	call get_addr
      001C8A                       1422 let_eval:
      00988F 98 B2 CD         [ 2] 1423 	ldw ptr16,x  ; variable address 
      009892 91 F6 88         [ 4] 1424 	call next_token 
      009895 CD 8A            [ 1] 1425 	cp a,#TK_EQUAL
      009897 1E 84            [ 1] 1426 	jreq 1$
      009899 81 16 9F         [ 2] 1427 	jp syntax_error
      00989A                       1428 1$:	
      00989A 90 F6 93         [ 4] 1429 	call condition   
      00989D EE 01            [ 1] 1430 	cp a,#TK_INTGR 
      00989F 72 A9            [ 1] 1431 	jreq 2$
      0098A1 00 03 C7         [ 2] 1432 	jp syntax_error
      001CA1                       1433 2$:	
      001CA1                       1434 	_xpop ; value 
      0098A4 00 0D            [ 1]    1     ld a,(y)
      0098A6 CF               [ 1]    2     ldw x,y 
      0098A7 00 0E            [ 2]    3     ldw x,(1,x)
      0098A9 CD 98 8C A6      [ 2]    4     addw y,#CELL_SIZE 
      001CAA                       1435 3$:
      0098AD 20 CD 89 C1      [ 4] 1436 	ld [ptr16],a
      0098B1 81 5C 00 1A      [ 1] 1437 	inc ptr8  
      0098B2 72 CF 00 19      [ 5] 1438 	ldw [ptr16],x 
      0098B2 52               [ 4] 1439 	ret 
                                   1440 
                                   1441 
                                   1442 ;--------------------------
                                   1443 ; return constant value 
                                   1444 ; from it's record address
                                   1445 ; input:
                                   1446 ;	X	*const record 
                                   1447 ; output:
                                   1448 ;   A:X   const  value
                                   1449 ;--------------------------
      001CB7                       1450 get_const_value: ; -- i 
      0098B3 04               [ 1] 1451 	ld a,(x) ; record size 
      0098B4 0F 02            [ 1] 1452 	sub a,#3 ; * value 
      0098B6 0F               [ 1] 1453 	push a 
      0098B7 01 4D            [ 1] 1454 	push #0 
      0098B9 27 11 C6         [ 2] 1455 	addw x,(1,sp)
      0098BC 00               [ 1] 1456 	ld a,(x)
      0098BD 0B A1            [ 2] 1457 	ldw x,(1,x)
      001CC3                       1458 	_drop 2
      0098BF 0A 26            [ 2]    1     addw sp,#2 
      0098C1 0A               [ 4] 1459 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1460 
                                   1461 
                                   1462 ;--------------------------
                                   1463 ; list constants in EEPROM 
                                   1464 ; call when using LIST \C 
                                   1465 ;-------------------------
                           000001  1466 	COUNT=1
                           000003  1467 	YTEMP=3
                           000004  1468 	VSIZE=4 
      001CC6                       1469 list_const:
      0098C2 72 0F            [ 2] 1470 	pushw y 
      001CC8                       1471 	_vars 4 
      0098C4 00 0D            [ 2]    1     sub sp,#4 
      0098C6 05               [ 1] 1472 	clrw x 
      0098C7 03 01            [ 2] 1473 	ldw (COUNT,sp),x  
      0098C9 CD 82 89 00      [ 2] 1474 	ldw Y,#EEPROM_BASE 
      0098CC 90 C3 00 24      [ 2] 1475 1$:	cpw y,free_eeprom 
      0098CC AE 16            [ 1] 1476 	jruge 9$
      0098CE 68 1C            [ 2] 1477     ldw (YTEMP,sp),y 
      0098D0 00               [ 1] 1478 	ldw x,y
      0098D1 50               [ 1] 1479 	incw x 
      0098D2 5A 7F 9E         [ 4] 1480 	call puts  
      0098D4 A6 3D            [ 1] 1481 	ld a,#'= 
      0098D4 C6 00 0B         [ 4] 1482 	call putc 
      0098D7 CD 83            [ 2] 1483 	ldw x,(YTEMP,sp)
      0098D9 86 AB 30         [ 4] 1484 	call get_const_value 
      0098DC A1 3A 2B         [ 1] 1485 	ld acc24,a 
      0098DF 02 AB 07         [ 2] 1486 	ldw acc16,x 
      0098E2 CD 18 0C         [ 4] 1487 	call prt_acc24
      0098E2 5A F7            [ 1] 1488 	ld a,#CR 
      0098E4 0C 02 C6         [ 4] 1489 	call putc 
      0098E7 00 0D            [ 2] 1490 	ldw x,(COUNT,sp)
      0098E9 CA               [ 1] 1491 	incw x 
      0098EA 00 0E            [ 2] 1492 	ldw (COUNT,sp),x 
      0098EC CA 00 0F 26      [ 1] 1493 	clr acc16 
      0098F0 E3 C6            [ 2] 1494 	ldw y,(YTEMP,sp)
      0098F2 00 0B            [ 1] 1495 	ld a,(y)
      0098F4 A1 10 27         [ 1] 1496 	ld acc8,a
      0098F7 08 7B 01 27      [ 2] 1497 	addw y,acc16 
      0098FB 0A A6            [ 2] 1498 	jra 1$ 
      001D0C                       1499 9$:	
      0098FD 2D 20            [ 2] 1500 	ldw x,(COUNT,sp)
      0098FF 02 17 F5         [ 4] 1501 	call prt_i16 
      009900 AE 1D 1C         [ 2] 1502 	ldw x,#CONST_COUNT 
      009900 A6 24 5A         [ 4] 1503 	call puts 
      001D17                       1504 	_drop VSIZE 
      009903 F7 0C            [ 2]    1     addw sp,#VSIZE 
      009905 02 85            [ 2] 1505 	popw y 
      009906 81               [ 4] 1506 	ret 
                                   1507 
      009906 7B 02 5B 04 81 74 61  1508 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1509 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   1510 
                                   1511 ;--------------------------
                                   1512 ; BASIC: EEFREE 
                                   1513 ; eeprom_free 
                                   1514 ; search end of data  
                                   1515 ; in EEPROM 
                                   1516 ; input:
                                   1517 ;    none 
                                   1518 ; output:
                                   1519 ;    A:X     address free
                                   1520 ;-------------------------
      00990B                       1521 func_eefree:
      00990B A1 61 2A         [ 2] 1522 	ldw x,#EEPROM_BASE 
      00990E 01 81 A1 7A      [ 1] 1523 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009912 22 FB A0         [ 2] 1524     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009915 20 81            [ 1] 1525 	jruge 8$ ; no free space 
      009917 F6               [ 1] 1526 2$: ld a,(x)
      009917 89 52            [ 1] 1527 	jrne 3$
      009919 03               [ 1] 1528 	incw x 
      00991A 72 5F 00 0D      [ 1] 1529 	dec acc8 
      00991E 72 5F            [ 1] 1530 	jrne 2$
      009920 00 0E 72         [ 2] 1531 	subw x,#8 
      009923 5F 00            [ 2] 1532 	jra 9$  
      009925 0F               [ 1] 1533 3$: ld a,(x)
      009926 0F               [ 1] 1534 	incw x
      009927 01               [ 1] 1535 	tnz a  
      009928 A6 0A            [ 1] 1536 	jrne 3$
      00992A 6B               [ 2] 1537 	decw x   
      00992B 02 F6            [ 2] 1538 	jra 1$ 
      00992D 27               [ 1] 1539 8$: clrw x ; no free space 
      00992E 47               [ 1] 1540 9$: clr a 
      00992F A1 2D 26         [ 2] 1541 	ldw free_eeprom,x ; save in system variable 
      009932 04               [ 4] 1542 	ret 
                                   1543 
                           000005  1544 CONST_REC_XTRA_BYTES=5 
                                   1545 ;--------------------------
                                   1546 ; search constant name 
                                   1547 ; format of constant record  
                                   1548 ;   .byte record length 
                                   1549 ;         = strlen(name)+5 
                                   1550 ;   .asciz name (variable length)
                                   1551 ;   .int24 value (3 bytes )
                                   1552 ; a constant record use 7+ bytes
                                   1553 ; constants are saved in EEPROM  
                                   1554 ; input:
                                   1555 ;    X     *name
                                   1556 ; output:
                                   1557 ;    X     address|0
                                   1558 ; use:
                                   1559 ;   A,Y, acc16 
                                   1560 ;-------------------------
                           000001  1561 	NAMEPTR=1 ; target name pointer 
                           000003  1562 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1563 	RECLEN=5  ; record length of target
                           000005  1564 	VSIZE=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      001D5B                       1565 search_const:
      009933 03 01            [ 2] 1566 	pushw y 
      001D5D                       1567 	_vars VSIZE
      009935 20 08            [ 2]    1     sub sp,#VSIZE 
      009937 A1 24 26 06      [ 1] 1568 	clr acc16 
      00993B A6 10 6B         [ 4] 1569 	call strlen 
      00993E 02 5C            [ 1] 1570 	add a,#CONST_REC_XTRA_BYTES
      009940 F6 05            [ 1] 1571 	ld (RECLEN,sp),a    
      009941 1F 01            [ 2] 1572 	ldw (NAMEPTR,sp),x
      009941 A1 61 2B 02      [ 2] 1573 	ldw y,#EEPROM_BASE 
      009945 A0 20            [ 2] 1574 1$:	ldw x,(NAMEPTR,sp)
      009947 A1 30            [ 2] 1575 	ldw (EEPTR,sp),y
      009949 2B 2B A0 30      [ 2] 1576 	cpw y, free_eeprom 
      00994D A1 0A            [ 1] 1577 	jruge 7$ ; no match found 
      00994F 2B 06            [ 1] 1578 	ld a,(y)
      009951 A0 07            [ 1] 1579 	cp a,(RECLEN,sp)
      009953 11 02            [ 1] 1580 	jrne 2$ 
      009955 2A 1F            [ 1] 1581 	incw y 
      009957 6B 03 7B         [ 4] 1582 	call strcmp
      00995A 02 CD            [ 1] 1583 	jrne 8$ ; match found 
      001D87                       1584 2$: ; skip this one 	
      00995C 82 A6            [ 2] 1585 	ldW Y,(EEPTR,sp)
      00995E 7B 03            [ 1] 1586 	ld a,(y)
      009960 CB 00 0F         [ 1] 1587 	ld acc8,a 
      009963 C7 00 0F 4F      [ 2] 1588 	addw y,acc16 
      009967 C9 00            [ 2] 1589 	jra 1$  
      001D94                       1590 7$: ; no match found 
      009969 0E C7            [ 1] 1591 	clr (EEPTR,sp)
      00996B 00 0E            [ 1] 1592 	clr (EEPTR+1,sp)
      001D98                       1593 8$: ; match found 
      00996D 4F C9            [ 2] 1594 	ldw x,(EEPTR,sp) ; record address 
      001D9A                       1595 9$:	_DROP VSIZE
      00996F 00 0D            [ 2]    1     addw sp,#VSIZE 
      009971 C7 00            [ 2] 1596 	 popw y 
      009973 0D               [ 4] 1597 	 ret 
                                   1598 
                                   1599 
                                   1600 ;--------------------------------------------
                                   1601 ; BASIC: CONST name=value [, name=value]*
                                   1602 ; define constant(s) saved in EEPROM
                                   1603 ;--------------------------------------------
                           000001  1604 	CNAME=1 
                           000003  1605 	BUFPTR=3
                           000005  1606 	RECLEN=5
                           000006  1607 	UPDATE=6
                           000007  1608 	YSAVE=7
                           000008  1609 	VSIZE=8 
      001D9F                       1610 cmd_const:
      009974 20 C9            [ 2] 1611 	pushw y 
      001DA1                       1612 	_vars VSIZE 
      009976 0D 01            [ 2]    1     sub sp,#VSIZE 
      009978 27 03            [ 1] 1613 	clr (UPDATE,sp)
      00997A CD 82 89         [ 4] 1614 	call next_token 
      00997D A1 04            [ 1] 1615 	cp a,#TK_CHAR 
      00997D 5B 03            [ 1] 1616 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00997F 85 81 EF         [ 4] 1617 	call get_char 
      009981 A4 DF            [ 1] 1618 	and a,#0xDF 
      009981 52 05            [ 1] 1619 	cp a,#'U 
      009983 17 04            [ 1] 1620 	jrne 1$
      009985 03 06            [ 1] 1621 	cpl (UPDATE,sp)
      009985 1F 02            [ 2] 1622 	jra const_loop 
      009987 F6 A4            [ 1] 1623 0$: cp a,#TK_LABEL 
      009989 0F 6B            [ 1] 1624 	jreq cloop_1
      00998B 01 16 04         [ 2] 1625 1$: jp syntax_error
      001DC0                       1626 const_loop: 
      00998E 5C 03            [ 1] 1627 	ld a,#TK_LABEL 
      00998F CD 19 4C         [ 4] 1628 	call expect  
      001DC5                       1629 cloop_1: 
      00998F 90 F6            [ 2] 1630 	ldw (CNAME,sp),x ; *const_name
      009991 27 1B 0D         [ 4] 1631 	call skip_string
      009994 01 27            [ 2] 1632 	ldw x,(CNAME,sp)
      009996 0A F1 26         [ 4] 1633 	call strlen  
      009999 07 90            [ 1] 1634 	add a,#CONST_REC_XTRA_BYTES 
      00999B 5C 5C            [ 1] 1635 	ld (RECLEN,sp),a 
                                   1636 ; copy name in buffer  
      00999D 0A 01            [ 2] 1637 	ldw y,(CNAME,sp) 
      00999F 20 EE 68         [ 2] 1638 	ldw x,#tib  
      0099A1 7B 05            [ 1] 1639 	ld a,(RECLEN,sp)
      0099A1 1E               [ 1] 1640 	ld (x),a 
      0099A2 02               [ 1] 1641 	incw x  
      0099A3 1D 00 02         [ 4] 1642 	call strcpy 
      0099A6 4B 00            [ 2] 1643 	ldw (BUFPTR,sp),x 
                                   1644 ; x not updated by strcpy 
                                   1645 ; BUFPTR must be incremented 
                                   1646 ; to point after name 
      0099A8 FE               [ 1] 1647 	clrw x 
      0099A9 84 27            [ 1] 1648 	ld a,(RECLEN,sp)
      0099AB 1D 20            [ 1] 1649 	sub a,#CONST_REC_XTRA_BYTES-1
      0099AD D7               [ 1] 1650 	ld xl,a  
      0099AE 72 FB 03         [ 2] 1651 	addw x,(BUFPTR,sp)
      0099AE 1E 02            [ 2] 1652 	ldw (BUFPTR,sp),x 
      0099B0 F6 6B            [ 1] 1653 	ld a,#TK_EQUAL 
      0099B2 01 A4 0F         [ 4] 1654 	call expect 
      0099B5 4C C7            [ 2] 1655 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099B7 00 0F 72         [ 4] 1656 	call expression 
      0099BA 5F 00            [ 1] 1657 	cp a,#TK_INTGR 
      0099BC 0E 72            [ 1] 1658 	jreq 5$ 
      0099BE BB 00 0E         [ 2] 1659 	jp syntax_error 
      001DFD                       1660 5$:	_xpop 
      0099C1 FE 7B            [ 1]    1     ld a,(y)
      0099C3 01               [ 1]    2     ldw x,y 
      0099C4 A4 F0            [ 2]    3     ldw x,(1,x)
      0099C6 4E AB 80 03      [ 2]    4     addw y,#CELL_SIZE 
      0099C9 17 07            [ 2] 1661 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099C9 5B 05            [ 2] 1662 	ldw y,(BUFPTR,sp)
      0099CB 81 F7            [ 1] 1663 	ld (y),a 
      0099CC 90 EF 01         [ 2] 1664 	ldw (1,y),x 
                                   1665 ; record completed in buffer 
                                   1666 ; check if constant already exist 
                                   1667 ; if exist and \U option then update  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099CC 88 CD 98 20      [ 1] 1668 	clr farptr 
      0099D0 11 01            [ 2] 1669 	ldw x,(CNAME,sp)
      0099D2 27 03 CC         [ 4] 1670 	call search_const 
      0099D5 97               [ 2] 1671 	tnzw x 
      0099D6 1F 84            [ 1] 1672 	jreq 6$ ; new constant  
      0099D8 81 06            [ 1] 1673 	tnz (UPDATE,sp)
      0099D9 27 1F            [ 1] 1674 	jreq 8$ 
      0099D9 A6 06            [ 2] 1675 	jra 7$	
      001E21                       1676 6$:	
      0099DB CD 99 CC         [ 2] 1677 	ldw x,free_eeprom  
      0099DE                       1678 7$:	
      0099DE 4B 00 CD         [ 2] 1679 	ldw farptr+1,x 
      0099E1 9C 22 4D         [ 2] 1680 	ldw x,#tib 
      0099E4 27 12            [ 1] 1681 	ld a,(RECLEN,sp)
      0099E6 0C 01 CD         [ 4] 1682 	call write_nbytes
      0099E9 98 20            [ 1] 1683 	tnz (UPDATE,sp)
      0099EB A1 08            [ 1] 1684 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1685 ; update free_eeprom 
      0099ED 27               [ 1] 1686 	clrw x 
      0099EE F1 A1            [ 1] 1687 	ld a,(RECLEN,sp)
      0099F0 07               [ 1] 1688 	ld xl,a 
      0099F1 27 05 55 00      [ 2] 1689 	addw x,free_eeprom 
      0099F5 03 00 02         [ 2] 1690 	ldw free_eeprom,x
      001E3E                       1691 8$: ; check for next constant 
      0099F8 84 81 A0         [ 4] 1692 	call next_token 
      0099FA A1 08            [ 1] 1693 	cp a,#TK_COMMA 
      0099FA CD 99            [ 1] 1694 	jrne 9$ ; no other constant 
      0099FC D9 A1 01         [ 2] 1695 	jp const_loop 
      001E48                       1696 9$: 
      001E48                       1697 	_unget_token    
      0099FF 27 03 CC 97 1F   [ 1]    1      mov in,in.saved  
      001E4D                       1698 10$: 
      001E4D                       1699 	_drop VSIZE 
      009A04 90 F6            [ 2]    1     addw sp,#VSIZE 
      009A06 93 EE            [ 2] 1700 	popw y ; restore xstack pointer 
      009A08 01               [ 4] 1701 	ret 
                                   1702 
                                   1703 
                                   1704 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1705 ; return program size 
                                   1706 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E52                       1707 prog_size:
      009A09 72 A9 00         [ 2] 1708 	ldw x,txtend 
      009A0C 03 C3 00 21      [ 2] 1709 	subw x,txtbgn 
      009A10 23               [ 4] 1710 	ret 
                                   1711 
                                   1712 ;----------------------------
                                   1713 ; print program information 
                                   1714 ;---------------------------
      001E5A                       1715 program_info: 
      009A11 05 A6 0A         [ 2] 1716 	ldw x,#PROG_ADDR 
      009A14 CC 97 21         [ 4] 1717 	call puts 
      009A17 5D 27 F8         [ 2] 1718 	ldw x,txtbgn 
      009A1A 89 58 72 FB      [ 1] 1719 	mov base,#16 
      009A1E 01 1F 01         [ 4] 1720 	call prt_i16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A21 AE 16 68 72      [ 1] 1721 	mov base,#10  
      009A25 F0 01 5B         [ 2] 1722 	ldw x,#PROG_SIZE
      009A28 02 81 9E         [ 4] 1723 	call puts 
      009A2A CD 1E 52         [ 4] 1724 	call prog_size 
      009A2A 52 01 0F         [ 4] 1725 	call prt_i16 
      009A2D 01 CD 98         [ 2] 1726 	ldw x,#STR_BYTES 
      009A30 20 4D 26         [ 4] 1727 	call puts
      009A33 03 CC 9A         [ 2] 1728 	ldw x,txtbgn
      009A36 C3 A1 10         [ 2] 1729 	cpw x,#app 
      009A39 27 06            [ 1] 1730 	jrult 2$
      009A3B A1 11 26         [ 2] 1731 	ldw x,#FLASH_MEM 
      009A3E 05 03            [ 2] 1732 	jra 3$
      009A40 01 1E D4         [ 2] 1733 2$: ldw x,#RAM_MEM 	 
      009A41 CD 09 9E         [ 4] 1734 3$:	call puts 
      009A41 CD 98            [ 1] 1735 	ld a,#CR 
      009A43 20 09 41         [ 4] 1736 	call putc
      009A44 81               [ 4] 1737 	ret 
                                   1738 
      009A44 4D 26 03 CC 97 1F 6D  1739 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A4A 2C 20 70 72 6F 67 72  1740 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A4A A1 81 26 06 CD 98 39  1741 STR_BYTES: .asciz " bytes" 
      009A51 FD 20 5D 20 46 4C 41  1742 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A54 20 69 6E 20 52 41 4D  1743 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1744 
                                   1745 
                                   1746 ;----------------------------
                                   1747 ; BASIC: LIST [[start][,end]]
                                   1748 ; list program lines 
                                   1749 ; form start to end 
                                   1750 ; if empty argument list then 
                                   1751 ; list all.
                                   1752 ;----------------------------
                           000001  1753 	FIRST=1
                           000003  1754 	LAST=3 
                           000005  1755 	LN_PTR=5
                           000006  1756 	VSIZE=6 
      001EE3                       1757 list:
      009A54 A1 84 26 05 CD   [ 2] 1758 	btjf flags,#FRUN,0$
      009A59 98 5F            [ 1] 1759 	ld a,#ERR_CMD_ONLY
      009A5B 20 54 A1         [ 2] 1760 	jp tb_error
      009A5D                       1761 0$:	 
      009A5D A1 05 26         [ 4] 1762 	call next_token 
      009A60 05 CD            [ 1] 1763 	cp a,#TK_CHAR 
      009A62 99 FA            [ 1] 1764 	jrne 2$
      009A64 20 07 EF         [ 4] 1765 	call get_char 
      009A66 A4 DF            [ 1] 1766 	and a,#0xDF 
      009A66 A1 85            [ 1] 1767 	cp a,#'C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009A68 26 08            [ 1] 1768 	jrne 1$
      009A6A CD 98 55         [ 4] 1769 	call list_const
      009A6D 81               [ 4] 1770 	ret 
      009A6D F6 EE 01         [ 2] 1771 1$: jp syntax_error 
      001F04                       1772 2$:	_unget_token 
      009A70 20 3F 02 00 01   [ 1]    1      mov in,in.saved  
      009A72 CD 1E 52         [ 4] 1773 	call prog_size 
      009A72 A1 03            [ 1] 1774 	jrugt 3$
      009A74 26               [ 4] 1775 	ret 
      001F0F                       1776 3$: _vars VSIZE
      009A75 10 89            [ 2]    1     sub sp,#VSIZE 
      009A77 CD 98 46         [ 2] 1777 	ldw x,txtbgn 
      009A7A 85 CD            [ 2] 1778 	ldw (LN_PTR,sp),x 
      009A7C 9D               [ 2] 1779 	ldw x,(x) 
      009A7D DB 5D            [ 2] 1780 	ldw (FIRST,sp),x ; list from first line 
      009A7F 27 28 CD         [ 2] 1781 	ldw x,#MAX_LINENO ; biggest line number 
      009A82 9D 37            [ 2] 1782 	ldw (LAST,sp),x 
      009A84 20 2B 5E         [ 4] 1783 	call arg_list
      009A86 4D               [ 1] 1784 	tnz a
      009A86 A1 82            [ 1] 1785 	jreq list_loop 
      009A88 26 08            [ 1] 1786 	cp a,#2 
      009A8A CD 98            [ 1] 1787 	jreq 4$
      009A8C 39 FD            [ 1] 1788 	cp a,#1 
      009A8E 5F 02            [ 1] 1789 	jreq first_line 
      009A90 20 1F 9F         [ 2] 1790 	jp syntax_error 
      009A92 85               [ 2] 1791 4$:	popw x 
      009A92 A1 06            [ 2] 1792 	ldw (LAST+2,sp),x 
      001F32                       1793 first_line:
      009A94 26               [ 2] 1794 	popw x
      009A95 13 CD            [ 2] 1795 	ldw (FIRST,sp),x 
      001F35                       1796 lines_skip:
      009A97 9B 09 A6         [ 2] 1797 	ldw x,txtbgn
      009A9A 07 CD            [ 2] 1798 2$:	ldw (LN_PTR,sp),x 
      009A9C 99 CC 90         [ 2] 1799 	cpw x,txtend 
      009A9F F6 93            [ 1] 1800 	jrpl list_exit 
      009AA1 EE               [ 2] 1801 	ldw x,(x) ;line# 
      009AA2 01 72            [ 2] 1802 	cpw x,(FIRST,sp)
      009AA4 A9 00            [ 1] 1803 	jrpl list_loop 
      009AA6 03 20            [ 2] 1804 	ldw x,(LN_PTR,sp) 
      009AA8 08 02            [ 1] 1805 	ld a,(2,x)
      009AA9 C7 00 0E         [ 1] 1806 	ld acc8,a 
      009AA9 55 00 03 00      [ 1] 1807 	clr acc16 
      009AAD 02 4F 20 12      [ 2] 1808 	addw x,acc16
      009AB1 20 E3            [ 2] 1809 	jra 2$ 
                                   1810 ; print loop
      001F55                       1811 list_loop:
      009AB1 0D 01            [ 2] 1812 	ldw x,(LN_PTR,sp)
      009AB3 27 03            [ 1] 1813 	ld a,(2,x) 
      009AB5 CD 82 81         [ 4] 1814 	call prt_basic_line
      009AB8 1E 05            [ 2] 1815 	ldw x,(LN_PTR,sp)
      009AB8 72 A2            [ 1] 1816 	ld a,(2,x)
      009ABA 00 03 90         [ 1] 1817 	ld acc8,a 
      009ABD F7 90 EF 01      [ 1] 1818 	clr acc16 
      009AC1 A6 84 00 0D      [ 2] 1819 	addw x,acc16
      009AC3 C3 00 1D         [ 2] 1820 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009AC3 5B 01            [ 1] 1821 	jrpl list_exit
      009AC5 81 05            [ 2] 1822 	ldw (LN_PTR,sp),x
      009AC6 FE               [ 2] 1823 	ldw x,(x)
      009AC6 52 01            [ 2] 1824 	cpw x,(LAST,sp)  
      009AC8 CD 9A            [ 1] 1825 	jrslt list_loop
      001F77                       1826 list_exit:
      009ACA 2A 4D 27 38 01   [ 1] 1827 	mov in,count 
      009ACE AE 16 B8         [ 2] 1828 	ldw x,#pad 
      009ACE CD 98 20         [ 2] 1829 	ldw basicptr,x 
      001F82                       1830 	_drop VSIZE 
      009AD1 6B 01            [ 2]    1     addw sp,#VSIZE 
      009AD3 A4 30 A1         [ 4] 1831 	call program_info 
      009AD6 20               [ 4] 1832 	ret
                                   1833 
                                   1834 
                                   1835 ;--------------------------
                                   1836 ; BASIC: EDIT 
                                   1837 ;  copy program in FLASH 
                                   1838 ;  to RAM for edition 
                                   1839 ;-------------------------
      001F88                       1840 edit:
      009AD7 27 09 A6         [ 4] 1841 	call qsign 
      009ADA 84 55            [ 1] 1842 	jreq 1$ 
      009ADC 00 03 00         [ 2] 1843 	ldw x,#NOT_SAVED 
      009ADF 02 20 24         [ 4] 1844 	call puts 
      009AE2 81               [ 4] 1845 	ret 
      001F94                       1846 1$: 
      009AE2 CD 9A 2A 4D      [ 2] 1847 	ldw y,#app_sign ; source address 
      009AE6 26 03 CC         [ 2] 1848     ldw x,app_size  
      009AE9 97 1F 04         [ 2] 1849 	addw x,#4 
      009AEB CF 00 0D         [ 2] 1850 	ldw acc16,x  ; bytes to copy 
      009AEB 7B 01 A1         [ 2] 1851 	ldw x,#rsign ; destination address 
      009AEE 20 26 05         [ 4] 1852 	call move  
      009AF1 CD 82 DC         [ 2] 1853 	ldw x,#free_ram 
      009AF4 20 D8 A1         [ 2] 1854 	ldw txtbgn,x 
      009AF7 21 26 05 CD      [ 2] 1855 	addw x,rsize  
      009AFB 83 A4 20         [ 2] 1856 	ldw txtend,x 
      009AFE CF               [ 4] 1857 	ret 
                                   1858 
      009AFF 4E 6F 20 61 70 70 6C  1859 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1860 
                                   1861 
                                   1862 ;--------------------------
                                   1863 ; decompile line from token list
                                   1864 ; and print it. 
                                   1865 ; input:
                                   1866 ;   A       stop at this position 
                                   1867 ;   X 		pointer at line
                                   1868 ; output:
                                   1869 ;   none 
                                   1870 ;--------------------------	
      001FCC                       1871 prt_basic_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009AFF CD 84            [ 2] 1872 	pushw y 
      009B01 52 20 CA         [ 1] 1873 	ld count,a 
      009B04 E6 02            [ 1] 1874 	ld a,(2,x)
      009B04 A6 84 03         [ 1] 1875 	cp a,count 
      009B06 2A 03            [ 1] 1876 	jrpl 1$ 
      009B06 5B 01 81         [ 1] 1877 	ld count,a 
      009B09 CF 00 04         [ 2] 1878 1$:	ldw basicptr,x 
      009B09 52 01 CD 9A      [ 2] 1879 	ldw y,#tib  
      009B0D C6 4D 27         [ 4] 1880 	call decompile 
      009B10 2D 09 9E         [ 4] 1881 	call puts 
      009B11 A6 0D            [ 1] 1882 	ld a,#CR 
      009B11 CD 98 20         [ 4] 1883 	call putc 
      009B14 6B 01            [ 2] 1884 	popw y 
      009B16 A4               [ 4] 1885 	ret 
                                   1886 
                                   1887 
                                   1888 ;---------------------------------
                                   1889 ; BASIC: PRINT|? arg_list 
                                   1890 ; print values from argument list
                                   1891 ;----------------------------------
                           000001  1892 	CCOMMA=1
                           000001  1893 	VSIZE=1
      001FF0                       1894 print:
      001FF0                       1895 	_vars VSIZE 
      009B17 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FF2                       1896 reset_comma:
      009B19 10 27            [ 1] 1897 	clr (CCOMMA,sp)
      001FF4                       1898 prt_loop:
      009B1B 09 55 00         [ 4] 1899 	call next_token
      009B1E 03 00            [ 1] 1900 	cp a,#CMD_END 
      009B20 02 A6            [ 1] 1901 	jrult 0$
      009B22 84 20            [ 1] 1902 	cp a,#TK_COLON 
      009B24 19 04            [ 1] 1903 	jreq 0$
      009B25 A1 80            [ 1] 1904 	cp a,#TK_CMD
      009B25 CD 9A            [ 1] 1905 	jrne 10$
      002003                       1906 0$:
      002003                       1907 	_unget_token 
      009B27 C6 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009B2C 97 1F            [ 2] 1908 	jra 8$ 
      009B2E                       1909 10$:	
      009B2E 7B 01            [ 1] 1910 	cp a,#TK_QSTR
      009B30 A1 10            [ 1] 1911 	jreq 1$
      009B32 26 05            [ 1] 1912 	cp a,#TK_CHAR 
      009B34 CD 81            [ 1] 1913 	jreq 2$ 
      009B36 EA 20            [ 1] 1914 	cp a,#TK_CFUNC 
      009B38 D8 1F            [ 1] 1915 	jreq 3$
      009B39 A1 08            [ 1] 1916 	cp a,#TK_COMMA 
      009B39 CD 82            [ 1] 1917 	jreq 4$
      009B3B 07 20            [ 1] 1918 	cp a,#TK_SHARP 
      009B3D D3 24            [ 1] 1919 	jreq 5$
      009B3E 20 37            [ 2] 1920 	jra 7$ 
      002020                       1921 1$:	; print string 
      009B3E 5B 01 81         [ 4] 1922 	call puts
      009B41 5C               [ 1] 1923 	incw x
      009B41 52 01 CD 9B      [ 2] 1924 	subw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B45 09 4D 27         [ 2] 1925 	ldw in.w,x  
      009B48 54 CD            [ 2] 1926 	jra reset_comma
      00202D                       1927 2$:	; print character 
      009B4A 98 20 6B         [ 4] 1928 	call get_char 
      009B4D 01 A4 30         [ 4] 1929 	call putc 
      009B50 A1 30            [ 2] 1930 	jra reset_comma 
      002035                       1931 3$: ; print character function value  	
      009B52 27 09 A6         [ 4] 1932 	call get_code_addr 
      009B55 84               [ 4] 1933 	call (x)
      009B56 55 00 03         [ 4] 1934 	call putc
      009B59 00 02            [ 2] 1935 	jra reset_comma 
      00203E                       1936 4$: ; set comma state 
      009B5B 20 40            [ 1] 1937 	cpl (CCOMMA,sp)
      009B5D 20 B2            [ 2] 1938 	jra prt_loop   
      002042                       1939 5$: ; # character must be followed by an integer   
      009B5D CD 9B 09         [ 4] 1940 	call next_token
      009B60 4D 26            [ 1] 1941 	cp a,#TK_INTGR 
      009B62 03 CC            [ 1] 1942 	jreq 6$
      009B64 97 1F 9F         [ 2] 1943 	jp syntax_error 
      009B66                       1944 6$: ; set tab width
      009B66 CD 82 24         [ 4] 1945 	call get_int24 
      009B69 90               [ 1] 1946 	ld a,xl 
      009B6A F6 93            [ 1] 1947 	and a,#15 
      009B6C EE 01 72         [ 1] 1948 	ld tab_width,a 
      009B6F A9 00            [ 2] 1949 	jra reset_comma 
      002057                       1950 7$:	
      002057                       1951 	_unget_token 
      009B71 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B76 0C 35 02         [ 4] 1952 	call condition
      009B79 00               [ 1] 1953 	tnz a 
      009B7A 0F 20            [ 1] 1954 	jreq 8$    
      009B7C 0A 18 1A         [ 4] 1955     call print_top
      009B7D 20 8B            [ 2] 1956 	jra reset_comma 
      002067                       1957 8$:
      009B7D 35 04            [ 1] 1958 	tnz (CCOMMA,sp)
      009B7F 00 0F            [ 1] 1959 	jrne 9$
      009B81 20 04            [ 1] 1960 	ld a,#CR 
      009B83 CD 09 41         [ 4] 1961     call putc 
      002070                       1962 9$:	_drop VSIZE 
      009B83 35 01            [ 2]    1     addw sp,#VSIZE 
      009B85 00               [ 4] 1963 	ret 
                                   1964 
                                   1965 ;----------------------
                                   1966 ; 'save_context' and
                                   1967 ; 'rest_context' must be 
                                   1968 ; called at the same 
                                   1969 ; call stack depth 
                                   1970 ; i.e. SP must have the 
                                   1971 ; save value at  
                                   1972 ; entry point of both 
                                   1973 ; routine. 
                                   1974 ;---------------------
                           000004  1975 	CTXT_SIZE=4 ; size of saved data 
                                   1976 ;--------------------
                                   1977 ; save current BASIC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   1978 ; interpreter context 
                                   1979 ; on stack 
                                   1980 ;--------------------
      002073                       1981 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002073                       1982 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002073                       1983 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002073                       1984 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002073                       1985 save_context:
      009B86 0F 00 04         [ 2] 1986 	ldw x,basicptr 
      009B87 1F 03            [ 2] 1987 	ldw (BPTR,sp),x
      009B87 5F C6 00         [ 1] 1988 	ld a,in 
      009B8A 0F 14            [ 1] 1989 	ld (IN,sp),a
      009B8C 01 27 03         [ 1] 1990 	ld a,count 
      009B8F 53 A6            [ 1] 1991 	ld (CNT,sp),a  
      009B91 FF               [ 4] 1992 	ret
                                   1993 
                                   1994 ;-----------------------
                                   1995 ; restore previously saved 
                                   1996 ; BASIC interpreter context 
                                   1997 ; from stack 
                                   1998 ;-------------------------
      002083                       1999 rest_context:
      009B92 72 A2            [ 2] 2000 	ldw x,(BPTR,sp)
      009B94 00 03 90         [ 2] 2001 	ldw basicptr,x 
      009B97 F7 90            [ 1] 2002 	ld a,(IN,sp)
      009B99 EF 01 A6         [ 1] 2003 	ld in,a
      009B9C 84 06            [ 1] 2004 	ld a,(CNT,sp)
      009B9D C7 00 03         [ 1] 2005 	ld count,a  
      009B9D 5B               [ 4] 2006 	ret
                                   2007 
                                   2008 
                                   2009 
                                   2010 ;------------------------------------------
                                   2011 ; BASIC: INPUT [string]var[,[string]var]
                                   2012 ; input value in variables 
                                   2013 ; [string] optionally can be used as prompt 
                                   2014 ;-----------------------------------------
                           000001  2015 	CX_BPTR=1
                           000003  2016 	CX_IN=3
                           000004  2017 	CX_CNT=4
                           000005  2018 	SKIP=5
                           000005  2019 	VSIZE=5
      002093                       2020 input_var:
      009B9E 01 81            [ 2] 2021 	pushw y 
      009BA0                       2022 	_vars VSIZE 
      009BA0 4B 00            [ 2]    1     sub sp,#VSIZE 
      002097                       2023 input_loop:
      009BA2 CD 98            [ 1] 2024 	clr (SKIP,sp)
      009BA4 20 4D 27         [ 4] 2025 	call next_token 
      009BA7 25 A1            [ 1] 2026 	cp a,#TK_QSTR 
      009BA9 87 26            [ 1] 2027 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009BAB 04 03 01         [ 4] 2028 	call puts 
      009BAE 20               [ 1] 2029 	incw x 
      009BAF F2 B0 00 04      [ 2] 2030 	subw x,basicptr 
      009BB0 CF 00 00         [ 2] 2031 	ldw in.w,x 
      009BB0 A1 06            [ 1] 2032 	cpl (SKIP,sp)
      009BB2 26 0A CD         [ 4] 2033 	call next_token 
      009BB5 9C 22            [ 1] 2034 1$: cp a,#TK_VAR  
      009BB7 A6 07            [ 1] 2035 	jreq 2$ 
      009BB9 CD 99 CC         [ 2] 2036 	jp syntax_error
      009BBC 20 08 55         [ 4] 2037 2$:	call get_addr
      009BBF 00 03 00         [ 2] 2038 	ldw ptr16,x 
      009BC2 02 CD            [ 1] 2039 	tnz (SKIP,sp)
      009BC4 9B 41            [ 1] 2040 	jrne 21$ 
      009BC6 CD 11 CE         [ 4] 2041 	call var_name 
      009BC6 0D 01 27         [ 4] 2042 	call putc   
      0020C7                       2043 21$:
      009BC9 03 CD            [ 1] 2044 	ld a,#':
      009BCB 82 66 41         [ 4] 2045 	call putc 
      009BCD CD 20 73         [ 4] 2046 	call save_context 
      009BCD 5B 01 81 03      [ 1] 2047 	clr count  
      009BD0 CD 0A A3         [ 4] 2048 	call readln 
      009BD0 CD 9B A0         [ 2] 2049 	ldw x,#tib 
      009BD3 4D 27 4B         [ 1] 2050 	push count
      009BD6 CD 98            [ 1] 2051 	push #0 
      009BD8 20 4D 27         [ 2] 2052 	addw x,(1,sp)
      009BDB 43               [ 1] 2053 	incw x 
      0020E2                       2054 	_drop 2 
      009BDC A1 88            [ 2]    1     addw sp,#2 
      009BDE 27 07 55 00      [ 1] 2055 	clr in 
      009BE2 03 00 02         [ 4] 2056 	call get_token
      009BE5 20 38            [ 1] 2057 	cp a,#TK_INTGR
      009BE7 CD 9B            [ 1] 2058 	jreq 3$ 
      009BE9 A0 4D            [ 1] 2059 	cp a,#TK_MINUS
      009BEB 26 03            [ 1] 2060 	jrne 22$
      009BED CC 97 1F         [ 4] 2061 	call get_token 
      009BF0 A1 84            [ 1] 2062 	cp a,#TK_INTGR 
      009BF0 90 F6            [ 1] 2063 	jreq 23$
      0020FA                       2064 22$:
      009BF2 93 EE 01         [ 4] 2065 	call rest_context 
      009BF5 72 A9 00         [ 2] 2066 	jp syntax_error
      002100                       2067 23$:
      009BF8 03 C7 00         [ 4] 2068 	call neg_acc24	
      002103                       2069 3$: 
      009BFB 0D CF 00         [ 1] 2070 	ld a,acc24 
      009BFE 0E 90 F6         [ 2] 2071 	ldw x,acc16 
      009C01 93 EE 01 72      [ 4] 2072 	ld [ptr16],a
      009C05 A9 00 03 C4      [ 1] 2073 	inc ptr8  
      009C09 00 0D 02 C4      [ 5] 2074 	ldw [ptr16],x 
      009C0D 00 0E 02         [ 4] 2075 	call rest_context
      009C10 C4 00 0F         [ 4] 2076 	call next_token 
      009C13 02 72            [ 1] 2077 	cp a,#TK_COMMA
      009C15 A2 00            [ 1] 2078 	jrne 4$ 
      009C17 03 90 F7         [ 2] 2079 	jp input_loop
      002122                       2080 4$:
      009C1A 90 EF            [ 1] 2081 	cp a,#TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009C1C 01 20            [ 1] 2082 	jreq input_exit  
      009C1E B7 A6            [ 1] 2083 	cp a,#TK_COLON 
      009C20 84 81            [ 1] 2084     jreq input_exit 
      009C22 CC 16 9F         [ 2] 2085 	jp syntax_error 
      00212D                       2086 input_exit:
      00212D                       2087 	_drop VSIZE 
      009C22 52 02            [ 2]    1     addw sp,#VSIZE 
      009C24 CD 9B            [ 2] 2088 	popw y 
      009C26 D0               [ 4] 2089 	ret 
                                   2090 
                                   2091 
                                   2092 ;---------------------
                                   2093 ; BASIC: REM | ' 
                                   2094 ; skip comment to end of line 
                                   2095 ;---------------------- 
      002132                       2096 remark::
      009C27 4D 27 69 CD 98   [ 1] 2097 	mov in,count 
      009C2C 20               [ 4] 2098  	ret 
                                   2099 
                                   2100 
                                   2101 ;---------------------
                                   2102 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2103 ; read in loop 'addr'  
                                   2104 ; apply & 'mask' to value 
                                   2105 ; loop while result==0.  
                                   2106 ; 'xor_mask' is used to 
                                   2107 ; invert the wait logic.
                                   2108 ; i.e. loop while not 0.
                                   2109 ;---------------------
                           000001  2110 	XMASK=1 
                           000002  2111 	MASK=2
                           000003  2112 	ADDR=3
                           000004  2113 	VSIZE=4
      002138                       2114 wait: 
      002138                       2115 	_vars VSIZE
      009C2D A1 89            [ 2]    1     sub sp,#VSIZE 
      009C2F 27 0B            [ 1] 2116 	clr (XMASK,sp) 
      009C31 A1 8A 27         [ 4] 2117 	call arg_list 
      009C34 07 55            [ 1] 2118 	cp a,#2
      009C36 00 03            [ 1] 2119 	jruge 0$
      009C38 00 02 20         [ 2] 2120 	jp syntax_error 
      009C3B 55 6B            [ 1] 2121 0$:	cp a,#3
      009C3D 02 CD            [ 1] 2122 	jrult 1$
      00214A                       2123 	_xpop  ; xor mask 
      009C3F 9B D0            [ 1]    1     ld a,(y)
      009C41 A1               [ 1]    2     ldw x,y 
      009C42 84 27            [ 2]    3     ldw x,(1,x)
      009C44 03 CC 97 1F      [ 2]    4     addw y,#CELL_SIZE 
      009C48 9F               [ 1] 2124 	ld a,xl 
      009C48 90 F6            [ 1] 2125 	ld (XMASK,sp),a 
      002156                       2126 1$: _xpop ; mask
      009C4A 93 EE            [ 1]    1     ld a,(y)
      009C4C 01               [ 1]    2     ldw x,y 
      009C4D 72 A9            [ 2]    3     ldw x,(1,x)
      009C4F 00 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C53 0D               [ 1] 2127     ld a,xl  
      009C54 CF 00            [ 1] 2128 	ld (MASK,sp),a 
      002162                       2129 	_xpop ; address 
      009C56 0E 90            [ 1]    1     ld a,(y)
      009C58 F6               [ 1]    2     ldw x,y 
      009C59 93 EE            [ 2]    3     ldw x,(1,x)
      009C5B 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      009C5F 03               [ 1] 2130 2$:	ld a,(x)
      009C60 6B 01            [ 1] 2131 	and a,(MASK,sp)
      009C62 7B 02            [ 1] 2132 	xor a,(XMASK,sp)
      009C64 A1 8A            [ 1] 2133 	jreq 2$ 
      002172                       2134 	_drop VSIZE 
      009C66 27 10            [ 2]    1     addw sp,#VSIZE 
      009C68 81               [ 4] 2135 	ret 
                                   2136 
                                   2137 ;---------------------
                                   2138 ; BASIC: BSET addr,mask
                                   2139 ; set bits at 'addr' corresponding 
                                   2140 ; to those of 'mask' that are at 1.
                                   2141 ; arguments:
                                   2142 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2143 ;   mask        mask|addr
                                   2144 ; output:
                                   2145 ;	none 
                                   2146 ;--------------------------
      002175                       2147 bit_set:
      009C68 7B 01 CA         [ 4] 2148 	call arg_list 
      009C6B 00 0D            [ 1] 2149 	cp a,#2	 
      009C6D 02 CA            [ 1] 2150 	jreq 1$ 
      009C6F 00 0E 02         [ 2] 2151 	jp syntax_error
      00217F                       2152 1$: 
      00217F                       2153 	_xpop ; mask 
      009C72 CA 00            [ 1]    1     ld a,(y)
      009C74 0F               [ 1]    2     ldw x,y 
      009C75 02 20            [ 2]    3     ldw x,(1,x)
      009C77 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C78 9F               [ 1] 2154 	ld a,xl
      009C78 7B               [ 1] 2155 	push a  
      00218A                       2156 	_xpop ; addr  
      009C79 01 C8            [ 1]    1     ld a,(y)
      009C7B 00               [ 1]    2     ldw x,y 
      009C7C 0D 02            [ 2]    3     ldw x,(1,x)
      009C7E C8 00 0E 02      [ 2]    4     addw y,#CELL_SIZE 
      009C82 C8               [ 1] 2157 	pop a 
      009C83 00               [ 1] 2158 	or a,(x)
      009C84 0F               [ 1] 2159 	ld (x),a
      009C85 02               [ 4] 2160 	ret 
                                   2161 
                                   2162 ;---------------------
                                   2163 ; BASIC: BRES addr,mask
                                   2164 ; reset bits at 'addr' corresponding 
                                   2165 ; to those of 'mask' that are at 1.
                                   2166 ; arguments:
                                   2167 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2168 ;   mask	    ~mask&*addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   2169 ; output:
                                   2170 ;	none 
                                   2171 ;--------------------------
      002197                       2172 bit_reset:
      009C86 72 A2 00         [ 4] 2173 	call arg_list 
      009C89 03 90            [ 1] 2174 	cp a,#2  
      009C8B F7 90            [ 1] 2175 	jreq 1$ 
      009C8D EF 01 20         [ 2] 2176 	jp syntax_error
      0021A1                       2177 1$: 
      0021A1                       2178 	_xpop ; mask 
      009C90 99 A6            [ 1]    1     ld a,(y)
      009C92 84               [ 1]    2     ldw x,y 
      009C93 5B 02            [ 2]    3     ldw x,(1,x)
      009C95 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C96 9F               [ 1] 2179 	ld a,xl 
      009C96 35               [ 1] 2180 	cpl a
      009C97 10               [ 1] 2181 	push a  
      0021AD                       2182 	_xpop ; addr  
      009C98 00 0B            [ 1]    1     ld a,(y)
      009C9A 81               [ 1]    2     ldw x,y 
      009C9B EE 01            [ 2]    3     ldw x,(1,x)
      009C9B 35 0A 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009C9F 81               [ 1] 2183 	pop a 
      009CA0 F4               [ 1] 2184 	and a,(x)
      009CA0 90               [ 1] 2185 	ld (x),a 
      009CA1 89               [ 4] 2186 	ret 
                                   2187 
                                   2188 ;---------------------
                                   2189 ; BASIC: BTOGL addr,mask
                                   2190 ; toggle bits at 'addr' corresponding 
                                   2191 ; to those of 'mask' that are at 1.
                                   2192 ; arguments:
                                   2193 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2194 ;   mask	    mask^*addr  
                                   2195 ; output:
                                   2196 ;	none 
                                   2197 ;--------------------------
      0021BA                       2198 bit_toggle:
      009CA2 4F AE 16         [ 4] 2199 	call arg_list 
      009CA5 68 90            [ 1] 2200 	cp a,#2 
      009CA7 CE 00            [ 1] 2201 	jreq 1$ 
      009CA9 1E 90 A3         [ 2] 2202 	jp syntax_error
      0021C4                       2203 1$: _xpop ; mask 
      009CAC B6 00            [ 1]    1     ld a,(y)
      009CAE 25               [ 1]    2     ldw x,y 
      009CAF 05 1D            [ 2]    3     ldw x,(1,x)
      009CB1 00 80 20 04      [ 2]    4     addw y,#CELL_SIZE 
      009CB5 9F               [ 1] 2204 	ld a,xl
      009CB5 72               [ 1] 2205 	push a 
      0021CF                       2206 	_xpop  ; addr  
      009CB6 B0 00            [ 1]    1     ld a,(y)
      009CB8 1E               [ 1]    2     ldw x,y 
      009CB9 90 85            [ 2]    3     ldw x,(1,x)
      009CBB 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CBC 84               [ 1] 2207 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CBC 3B               [ 1] 2208 	xor a,(x)
      009CBD 00               [ 1] 2209 	ld (x),a 
      009CBE 0B               [ 4] 2210 	ret 
                                   2211 
                                   2212 
                                   2213 ;---------------------
                                   2214 ; BASIC: BTEST(addr,bit)
                                   2215 ; return bit value at 'addr' 
                                   2216 ; bit is in range {0..7}.
                                   2217 ; arguments:
                                   2218 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2219 ;   bit 	    bit position {0..7}  
                                   2220 ; output:
                                   2221 ;	A:X       bit value  
                                   2222 ;--------------------------
      0021DC                       2223 bit_test:
      009CBF AE 9F 19         [ 4] 2224 	call func_args 
      009CC2 CD 8A            [ 1] 2225 	cp a,#2
      009CC4 1E CE            [ 1] 2226 	jreq 0$
      009CC6 00 1C 35         [ 2] 2227 	jp syntax_error
      0021E6                       2228 0$:	
      0021E6                       2229 	_xpop 
      009CC9 10 00            [ 1]    1     ld a,(y)
      009CCB 0B               [ 1]    2     ldw x,y 
      009CCC CD 98            [ 2]    3     ldw x,(1,x)
      009CCE 75 32 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009CD2 AE               [ 1] 2230 	ld a,xl 
      009CD3 9F 2B            [ 1] 2231 	and a,#7
      009CD5 CD               [ 1] 2232 	push a   
      009CD6 8A 1E            [ 1] 2233 	ld a,#1 
      009CD8 CE 00            [ 1] 2234 1$: tnz (1,sp)
      009CDA 1E 72            [ 1] 2235 	jreq 2$
      009CDC B0               [ 1] 2236 	sll a 
      009CDD 00 1C            [ 1] 2237 	dec (1,sp)
      009CDF CD 98            [ 2] 2238 	jra 1$
      009CE1 75 AE            [ 1] 2239 2$: ld (1,sp),a  
      002200                       2240 	_xpop ; address  
      009CE3 9F 3C            [ 1]    1     ld a,(y)
      009CE5 CD               [ 1]    2     ldw x,y 
      009CE6 8A 1E            [ 2]    3     ldw x,(1,x)
      009CE8 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CE9 84               [ 1] 2241 	pop a 
      009CE9 CD               [ 1] 2242 	and a,(x)
      009CEA 9C A0            [ 1] 2243 	jreq 3$
      009CEC A6 03            [ 1] 2244 	ld a,#1 
      009CEE 62               [ 1] 2245 3$:	clrw x 
      009CEF CF               [ 1] 2246 	ld xl,a
      009CF0 00               [ 1] 2247 	clr a  
      009CF1 21               [ 4] 2248 	ret
                                   2249 
                                   2250 ;--------------------
                                   2251 ; BASIC: POKE addr,byte
                                   2252 ; put a byte at addr 
                                   2253 ;--------------------
      002213                       2254 poke:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009CF2 4F 81 5E         [ 4] 2255 	call arg_list 
      009CF4 A1 02            [ 1] 2256 	cp a,#2
      009CF4 CD 98            [ 1] 2257 	jreq 1$
      009CF6 20 A1 85         [ 2] 2258 	jp syntax_error
      00221D                       2259 1$:	
      00221D                       2260 	_xpop ; byte   
      009CF9 27 0C            [ 1]    1     ld a,(y)
      009CFB A1               [ 1]    2     ldw x,y 
      009CFC 05 27            [ 2]    3     ldw x,(1,x)
      009CFE 03 CC 97 1F      [ 2]    4     addw y,#CELL_SIZE 
      009D02 9F               [ 1] 2261     ld a,xl 
      009D02 CD               [ 1] 2262 	push a 
      002228                       2263 	_xpop ; address 
      009D03 99 FA            [ 1]    1     ld a,(y)
      009D05 20               [ 1]    2     ldw x,y 
      009D06 03 01            [ 2]    3     ldw x,(1,x)
      009D07 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D07 CD               [ 1] 2264 	pop a 
      009D08 98               [ 1] 2265 	ld (x),a 
      009D09 55               [ 4] 2266 	ret 
                                   2267 
                                   2268 ;-----------------------
                                   2269 ; BASIC: PEEK(addr)
                                   2270 ; get the byte at addr 
                                   2271 ; input:
                                   2272 ;	none 
                                   2273 ; output:
                                   2274 ;	X 		value 
                                   2275 ;-----------------------
      009D0A                       2276 peek:
      009D0A CF 00 1A         [ 4] 2277 	call func_args
      009D0D CD 98            [ 1] 2278 	cp a,#1 
      009D0F 20 A1            [ 1] 2279 	jreq 1$
      009D11 32 27 03         [ 2] 2280 	jp syntax_error
      00223E                       2281 1$: _xpop ; address  
      009D14 CC 97            [ 1]    1     ld a,(y)
      009D16 1F               [ 1]    2     ldw x,y 
      009D17 EE 01            [ 2]    3     ldw x,(1,x)
      009D17 CD 9C 22 A1      [ 2]    4     addw y,#CELL_SIZE 
      009D1B 84 27 03         [ 1] 2282 	ld farptr,a 
      009D1E CC 97 1F         [ 2] 2283 	ldw ptr16,x 
      009D21 92 BC 00 18      [ 5] 2284 	ldf a,[farptr]
      009D21 90               [ 1] 2285 	clrw x 
      009D22 F6               [ 1] 2286 	ld xl,a 
      009D23 93               [ 1] 2287 	clr a 
      009D24 EE               [ 4] 2288 	ret 
                                   2289 
                                   2290 ;---------------------------
                                   2291 ; BASIC IF expr : instructions
                                   2292 ; evaluate expr and if true 
                                   2293 ; execute instructions on same line. 
                                   2294 ;----------------------------
      002255                       2295 if: 
      009D25 01 72 A9         [ 4] 2296 	call condition  
      002258                       2297 	_xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009D28 00 03            [ 1]    1     ld a,(y)
      009D2A 93               [ 1]    2     ldw x,y 
      009D2A 72 C7            [ 2]    3     ldw x,(1,x)
      009D2C 00 1A 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      009D30 00               [ 1] 2298 	tnz  a  
      009D31 1B 72            [ 1] 2299 	jrne 9$
      009D33 CF               [ 2] 2300 	tnzw x 
      009D34 00 1A            [ 1] 2301 	jrne 9$  
                                   2302 ;skip to next line
      009D36 81 00 03 00 01   [ 1] 2303 	mov in,count
      009D37                       2304 	_drop 2 
      009D37 F6 A0            [ 2]    1     addw sp,#2 
      009D39 03 88 4B         [ 2] 2305 	jp next_line
      009D3C 00               [ 4] 2306 9$:	ret 
                                   2307 
                                   2308 ;------------------------
                                   2309 ; BASIC: FOR var=expr 
                                   2310 ; set variable to expression 
                                   2311 ; leave variable address 
                                   2312 ; on stack and set
                                   2313 ; FLOOP bit in 'flags'
                                   2314 ;-----------------
                           000001  2315 	RETL1=1 ; return address  
                           000003  2316 	FSTEP=3  ; variable increment int24
                           000006  2317 	LIMIT=6 ; loop limit, int24  
                           000009  2318 	CVAR=9   ; control variable 
                           00000B  2319 	INW=11   ;  in.w saved
                           00000D  2320 	BPTR=13 ; baseptr saved
                           00000D  2321 	VSIZE=13  
      002272                       2322 for: ; { -- var_addr }
      009D3D 72               [ 2] 2323 	popw x ; call return address 
      002273                       2324 	_vars VSIZE 
      009D3E FB 01            [ 2]    1     sub sp,#VSIZE 
      009D40 F6               [ 2] 2325 	pushw x  ; RETL1 
      009D41 EE 01            [ 1] 2326 	ld a,#TK_VAR 
      009D43 5B 02 81         [ 4] 2327 	call expect
      009D46 CD 17 D5         [ 4] 2328 	call get_addr
      009D46 90 89            [ 2] 2329 	ldw (CVAR,sp),x  ; control variable 
      009D48 52 04 5F         [ 4] 2330 	call let_eval 
      009D4B 1F 01 90 AE      [ 1] 2331 	bset flags,#FLOOP 
      009D4F 40 00 90         [ 4] 2332 	call next_token 
      009D52 C3 00            [ 1] 2333 	cp a,#TK_CMD 
      009D54 25 24            [ 1] 2334 	jreq 1$
      009D56 35 17 03         [ 2] 2335 	jp syntax_error
      002291                       2336 1$:  
      009D59 93 5C CD         [ 4] 2337 	call get_code_addr
      009D5C 8A 1E A6         [ 2] 2338 	cpw x,#to   
      009D5F 3D CD            [ 1] 2339 	jreq to
      009D61 89 C1 1E         [ 2] 2340 	jp syntax_error 
                                   2341 
                                   2342 ;-----------------------------------
                                   2343 ; BASIC: TO expr 
                                   2344 ; second part of FOR loop initilization
                                   2345 ; leave limit on stack and set 
                                   2346 ; FTO bit in 'flags'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                   2347 ;-----------------------------------
      00229C                       2348 to: ; { var_addr -- var_addr limit step }
      009D64 03 CD 9D 37 C7   [ 2] 2349 	btjt flags,#FLOOP,1$
      009D69 00 0D CF         [ 2] 2350 	jp syntax_error
      009D6C 00 0E CD         [ 4] 2351 1$: call expression   
      009D6F 98 8C            [ 1] 2352 	cp a,#TK_INTGR 
      009D71 A6 0D            [ 1] 2353 	jreq 2$ 
      009D73 CD 89 C1         [ 2] 2354 	jp syntax_error
      0022AE                       2355 2$: _xpop
      009D76 1E 01            [ 1]    1     ld a,(y)
      009D78 5C               [ 1]    2     ldw x,y 
      009D79 1F 01            [ 2]    3     ldw x,(1,x)
      009D7B 72 5F 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      009D7F 16 03            [ 1] 2356 	ld (LIMIT,sp),a 
      009D81 90 F6            [ 2] 2357 	ldw (LIMIT+1,sp),x
      009D83 C7 00 0F         [ 4] 2358 	call next_token
      009D86 72 B9            [ 1] 2359 	cp a,#TK_NONE  
      009D88 00 0E            [ 1] 2360 	jreq 4$ 
      009D8A 20 C5            [ 1] 2361 	cp a,#TK_CMD
      009D8C 26 08            [ 1] 2362 	jrne 3$
      009D8C 1E 01 CD         [ 4] 2363 	call get_code_addr
      009D8F 98 75 AE         [ 2] 2364 	cpw x,#step 
      009D92 9D 9C            [ 1] 2365 	jreq step
      0022CE                       2366 3$:	
      0022CE                       2367 	_unget_token   	 
      009D94 CD 8A 1E 5B 04   [ 1]    1      mov in,in.saved  
      0022D3                       2368 4$:	
      009D99 90 85            [ 1] 2369 	clr (FSTEP,sp) 
      009D9B 81 20 63         [ 2] 2370 	ldw x,#1   ; default step  
      009D9E 6F 6E            [ 2] 2371 	ldw (FSTEP+1,sp),x 
      009DA0 73 74            [ 2] 2372 	jra store_loop_addr 
                                   2373 
                                   2374 
                                   2375 ;----------------------------------
                                   2376 ; BASIC: STEP expr 
                                   2377 ; optional third par of FOR loop
                                   2378 ; initialization. 	
                                   2379 ;------------------------------------
      0022DC                       2380 step: ; {var limit -- var limit step}
      009DA2 61 6E 74 73 20   [ 2] 2381 	btjt flags,#FLOOP,1$
      009DA7 69 6E 20         [ 2] 2382 	jp syntax_error
      009DAA 45 45 50         [ 4] 2383 1$: call expression 
      009DAD 52 4F            [ 1] 2384 	cp a,#TK_INTGR
      009DAF 4D 0A            [ 1] 2385 	jreq 2$
      009DB1 00 16 9F         [ 2] 2386 	jp syntax_error
      009DB2                       2387 2$:	
      0022EE                       2388 	_xpop 
      009DB2 AE 40            [ 1]    1     ld a,(y)
      009DB4 00               [ 1]    2     ldw x,y 
      009DB5 35 08            [ 2]    3     ldw x,(1,x)
      009DB7 00 0F A3 47      [ 2]    4     addw y,#CELL_SIZE 
      009DBB F8 24            [ 1] 2389 	ld (FSTEP,sp),a 
      009DBD 17 F6            [ 2] 2390 	ldw (FSTEP+1,sp),x ; step
                                   2391 ; if step < 0 decrement LIMIT 
      009DBF 26               [ 1] 2392 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009DC0 0C 5C            [ 1] 2393 	jrpl store_loop_addr 
      009DC2 72 5A            [ 1] 2394 	ld a,(LIMIT,sp)
      009DC4 00 0F            [ 2] 2395 	ldw x,(LIMIT+1,sp)
      009DC6 26 F6 1D         [ 2] 2396 	subw x,#1 
      009DC9 00 08            [ 1] 2397 	sbc a,#0 
      009DCB 20 09            [ 1] 2398 	ld (LIMIT,sp),a 
      009DCD F6 5C            [ 2] 2399 	ldw (LIMIT+1,sp),x 
                                   2400 ; leave loop back entry point on cstack 
                                   2401 ; cstack is 1 call deep from interpreter
      00230B                       2402 store_loop_addr:
      009DCF 4D 26 FB         [ 2] 2403 	ldw x,basicptr
      009DD2 5A 20            [ 2] 2404 	ldw (BPTR,sp),x 
      009DD4 E0 5F 4F         [ 2] 2405 	ldw x,in.w 
      009DD7 CF 00            [ 2] 2406 	ldw (INW,sp),x   
      009DD9 25 81 00 22      [ 1] 2407 	bres flags,#FLOOP 
      009DDB 72 5C 00 1F      [ 1] 2408 	inc loop_depth  
      009DDB 90               [ 4] 2409 	ret 
                                   2410 
                                   2411 ;--------------------------------
                                   2412 ; BASIC: NEXT var 
                                   2413 ; FOR loop control 
                                   2414 ; increment variable with step 
                                   2415 ; and compare with limit 
                                   2416 ; loop if threshold not crossed.
                                   2417 ; else stack. 
                                   2418 ; and decrement 'loop_depth' 
                                   2419 ;--------------------------------
      00231E                       2420 next: ; {var limit step retl1 -- [var limit step ] }
      009DDC 89 52 05 72      [ 1] 2421 	tnz loop_depth 
      009DE0 5F 00            [ 1] 2422 	jrne 1$ 
      009DE2 0E CD 94         [ 2] 2423 	jp syntax_error 
      002327                       2424 1$: 
      009DE5 63 AB            [ 1] 2425 	ld a,#TK_VAR 
      009DE7 05 6B 05         [ 4] 2426 	call expect
      009DEA 1F 01 90         [ 4] 2427 	call get_addr 
                                   2428 ; check for good variable after NEXT 	 
      009DED AE 40            [ 2] 2429 	cpw x,(CVAR,sp)
      009DEF 00 1E            [ 1] 2430 	jreq 2$  
      009DF1 01 17 03         [ 2] 2431 	jp syntax_error ; not the good one 
      002336                       2432 2$: 
      009DF4 90 C3 00         [ 2] 2433 	ldw ptr16,x 
                                   2434 	; increment variable 
      009DF7 25               [ 1] 2435 	ld a,(x)
      009DF8 24 1A            [ 2] 2436 	ldw x,(1,x)  ; get var value 
      009DFA 90 F6 11         [ 2] 2437 	addw x,(FSTEP+1,sp) ; var+step 
      009DFD 05 26            [ 1] 2438 	adc a,(FSTEP,sp)
      009DFF 07 90 5C CD      [ 4] 2439 	ld [ptr16],a
      009E03 94 6E 26 11      [ 1] 2440 	inc ptr8  
      009E07 72 CF 00 19      [ 5] 2441 	ldw [ptr16],x 
      009E07 16 03 90         [ 1] 2442 	ld acc24,a 
      009E0A F6 C7 00         [ 2] 2443 	ldw acc16,x 
      009E0D 0F 72            [ 1] 2444 	ld a,(LIMIT,sp)
      009E0F B9 00            [ 2] 2445 	ldw x,(LIMIT+1,sp)
      009E11 0E 20 DC 0D      [ 2] 2446 	subw x,acc16 
      009E14 C2 00 0C         [ 1] 2447 	sbc a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009E14 0F 03            [ 1] 2448 	xor a,(FSTEP,sp)
      009E16 0F 04            [ 1] 2449 	xor a,#0x80
      009E18 2B 12            [ 1] 2450 	jrmi loop_back  
      009E18 1E 03            [ 2] 2451 	jra loop_done   
                                   2452 ; check sign of STEP  
      009E1A 5B 05            [ 1] 2453 	ld a,(FSTEP,sp)
      009E1C 90 85            [ 1] 2454 	jrpl 4$
                                   2455 ;negative step
      009E1E 81 00 0E         [ 1] 2456     ld a,acc8 
      009E1F 2F 07            [ 1] 2457 	jrslt loop_back   
      009E1F 90 89            [ 2] 2458 	jra loop_done  
      002371                       2459 4$: ; positive step
      009E21 52 08 0F 06 CD   [ 2] 2460 	btjt acc8,#7,loop_done 
      002376                       2461 loop_back:
      009E26 98 20            [ 2] 2462 	ldw x,(BPTR,sp)
      009E28 A1 04 26         [ 2] 2463 	ldw basicptr,x 
      009E2B 0D CD 98 6F A4   [ 2] 2464 	btjf flags,#FRUN,1$ 
      009E30 DF A1            [ 1] 2465 	ld a,(2,x)
      009E32 55 26 08         [ 1] 2466 	ld count,a
      009E35 03 06            [ 2] 2467 1$:	ldw x,(INW,sp)
      009E37 20 07 A1         [ 2] 2468 	ldw in.w,x 
      009E3A 03               [ 4] 2469 	ret 
      00238B                       2470 loop_done:
                                   2471 	; remove loop data from stack  
      009E3B 27               [ 2] 2472 	popw x
      00238C                       2473 	_drop VSIZE 
      009E3C 08 CC            [ 2]    1     addw sp,#VSIZE 
      009E3E 97 1F 00 1F      [ 1] 2474 	dec loop_depth 
      009E40 FC               [ 2] 2475 	jp (x)
                                   2476 
                                   2477 ;----------------------------
                                   2478 ; called by goto/gosub
                                   2479 ; to get target line number 
                                   2480 ; output:
                                   2481 ;    x    line address 
                                   2482 ;---------------------------
      002393                       2483 get_target_line:
      009E40 A6 03 CD         [ 4] 2484 	call next_token  
      009E43 99 CC            [ 1] 2485 	cp a,#TK_INTGR
      009E45 27 07            [ 1] 2486 	jreq get_target_line_addr 
      009E45 1F 01            [ 1] 2487 	cp a,#TK_LABEL 
      009E47 CD 98            [ 1] 2488 	jreq look_target_symbol 
      009E49 46 1E 01         [ 2] 2489 	jp syntax_error
                                   2490 ; the target is a line number 
                                   2491 ; search it. 
      0023A1                       2492 get_target_line_addr:
      009E4C CD 94            [ 2] 2493 	pushw y 
      009E4E 63 AB 05         [ 4] 2494 	call get_int24 ; line # 
      009E51 6B               [ 1] 2495 	clr a
      009E52 05 16 01 AE      [ 2] 2496 	ldw y,basicptr 
      009E56 16 68            [ 2] 2497 	ldw y,(y)
      009E58 7B 05            [ 2] 2498 	pushw y 
      009E5A F7 5C            [ 2] 2499 	cpw x,(1,sp)
      0023B1                       2500 	_drop 2  
      009E5C CD 94            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009E5E 7F 1F            [ 1] 2501 	jrult 11$
      009E60 03               [ 1] 2502 	inc a 
      0023B6                       2503 11$: ; scan program for this line# 	
      009E61 5F 7B 05         [ 4] 2504 	call search_lineno  
      009E64 A0               [ 2] 2505 	tnzw x ; 0| line# address 
      009E65 04 97            [ 1] 2506 	jrne 2$ 
      009E67 72 FB            [ 1] 2507 	ld a,#ERR_NO_LINE 
      009E69 03 1F 03         [ 2] 2508 	jp tb_error 
      009E6C A6 32            [ 2] 2509 2$:	popw y  
      009E6E CD               [ 4] 2510 	ret 
                                   2511 
                                   2512 ; the GOTO|GOSUB target is a symbol.
                                   2513 ; output:
                                   2514 ;    X    line address|0 
      0023C4                       2515 look_target_symbol:
      009E6F 99 CC            [ 2] 2516 	pushw y 
      009E71 16               [ 2] 2517 	pushw x 
      009E72 07 CD 9B 09      [ 1] 2518 	clr acc16 
      009E76 A1 84 27 03      [ 2] 2519 	ldw y,txtbgn 
      009E7A CC 97 1F         [ 1] 2520 1$:	ld a,(3,y) ; first TK_ID on line 
      009E7D 90 F6            [ 1] 2521 	cp a,#TK_LABEL 
      009E7F 93 EE            [ 1] 2522 	jreq 3$ 
      009E81 01 72 A9         [ 1] 2523 2$:	ld a,(2,y); line length 
      009E84 00 03 17         [ 1] 2524 	ld acc8,a 
      009E87 07 16 03 90      [ 2] 2525 	addw y,acc16 ;point to next line 
      009E8B F7 90 EF 01      [ 2] 2526 	cpw y,txtend 
      009E8F 72 5F            [ 1] 2527 	jrult 1$
      009E91 00 19            [ 1] 2528 	ld a,#ERR_BAD_VALUE
      009E93 1E 01 CD         [ 2] 2529 	jp tb_error 
      0023EB                       2530 3$: ; found a TK_LABEL 
                                   2531 	; compare with GOTO|GOSUB target 
      009E96 9D DB            [ 2] 2532 	pushw y ; line address 
      009E98 5D 27 06 0D      [ 2] 2533 	addw y,#4 ; label string 
      009E9C 06 27            [ 2] 2534 	ldw x,(3,sp) ; target string 
      009E9E 1F 20 03         [ 4] 2535 	call strcmp
      009EA1 26 04            [ 1] 2536 	jrne 4$
      009EA1 CE 00            [ 2] 2537 	popw y 
      009EA3 25 DA            [ 2] 2538 	jra 2$ 
      009EA4                       2539 4$: ; target found 
      009EA4 CF               [ 2] 2540 	popw x ;  address line target  
      0023FD                       2541 	_drop 2 ; target string 
      009EA5 00 1A            [ 2]    1     addw sp,#2 
      009EA7 AE 16            [ 2] 2542 	popw y 
      009EA9 68               [ 4] 2543 	ret
                                   2544 
                                   2545 
                                   2546 ;--------------------------------
                                   2547 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2548 ; selective goto or gosub 
                                   2549 ;--------------------------------
      002402                       2550 cmd_on:
      009EAA 7B 05 CD 89 02   [ 2] 2551 	btjt flags,#FRUN,0$ 
      009EAF 0D 06            [ 1] 2552 	ld a,#ERR_RUN_ONLY
      009EB1 26 0B 5F         [ 2] 2553 	jp tb_error 
      009EB4 7B 05 97         [ 4] 2554 0$:	call expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009EB7 72 BB            [ 1] 2555 	cp a,#TK_INTGR
      009EB9 00 25            [ 1] 2556 	jreq 1$
      009EBB CF 00 25         [ 2] 2557 	jp syntax_error
      009EBE                       2558 1$: _xpop
      009EBE CD 98            [ 1]    1     ld a,(y)
      009EC0 20               [ 1]    2     ldw x,y 
      009EC1 A1 08            [ 2]    3     ldw x,(1,x)
      009EC3 26 03 CC 9E      [ 2]    4     addw y,#CELL_SIZE 
                                   2559 ; the selector is the element indice 
                                   2560 ; in the list of arguments. {1..#elements} 
      009EC7 40               [ 1] 2561 	ld a,xl ; keep only bits 7..0
      009EC8 27 62            [ 1] 2562 	jreq 9$ ; element # begin at 1. 
      009EC8 55               [ 1] 2563 	push a  ; selector  
      009EC9 00 03 00         [ 4] 2564 	call next_token
      009ECC 02 80            [ 1] 2565 	cp a,#TK_CMD 
      009ECD 27 03            [ 1] 2566 	jreq 2$ 
      009ECD 5B 08 90         [ 2] 2567 	jp syntax_error 
      009ED0 85 81 B9         [ 4] 2568 2$: call get_code_addr
                                   2569 ;; must be a GOTO or GOSUB 
      009ED2 A3 24 8E         [ 2] 2570 	cpw x,#goto 
      009ED2 CE 00            [ 1] 2571 	jreq 4$
      009ED4 1E 72 B0         [ 2] 2572 	cpw x,#gosub 
      009ED7 00 1C            [ 1] 2573 	jreq 4$ 
      009ED9 81 16 9F         [ 2] 2574 	jp syntax_error 
      009EDA                       2575 4$: 
      009EDA AE               [ 1] 2576 	pop a 
      009EDB 9F               [ 2] 2577 	pushw x ; save routine address 	
      009EDC 19               [ 1] 2578 	push a  ; selector  
      002440                       2579 5$: ; skip elements in list until selector==0 
      009EDD CD 8A            [ 1] 2580 	dec (1,sp)
      009EDF 1E CE            [ 1] 2581 	jreq 6$ 
                                   2582 ; can be a line# or a label 
      009EE1 00 1C 35         [ 4] 2583 	call next_token 
      009EE4 10 00            [ 1] 2584 	cp a,#TK_INTGR 
      009EE6 0B CD            [ 1] 2585 	jreq 52$
      009EE8 98 75            [ 1] 2586 	cp a,#TK_LABEL 
      009EEA 35 0A            [ 1] 2587 	jreq 54$
      009EEC 00 0B AE         [ 2] 2588 	jp syntax_error 
      002452                       2589 52$: ; got a line number 
      009EEF 9F 2B CD         [ 1] 2590 	ld a,in ; skip over int24 value 
      009EF2 8A 1E            [ 1] 2591 	add a,#CELL_SIZE ; integer size  
      009EF4 CD 9E D2         [ 1] 2592 	ld in,a 
      009EF7 CD 98            [ 2] 2593 	jra 56$
      009EF9 75 AE 9F         [ 4] 2594 54$: call skip_string ; skip over label 	
      00245F                       2595 56$: ; if another element comma present 
      009EFC 3C CD 8A         [ 4] 2596 	call next_token
      009EFF 1E CE            [ 1] 2597 	cp a,#TK_COMMA 
      009F01 00 1C            [ 1] 2598 	jreq 5$ 
                                   2599 ; arg list exhausted, selector to big 
                                   2600 ; continue execution on next line 
      002466                       2601 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F03 A3 B6            [ 2]    1     addw sp,#3 
      009F05 04 25            [ 2] 2602 	jra 9$
      00246A                       2603 6$: ;at selected position  
      00246A                       2604 	_drop 1 ; discard selector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009F07 05 AE            [ 2]    1     addw sp,#1 
                                   2605 ; here only the routine address 
                                   2606 ; of GOTO|GOSUB is on stack 
      009F09 9F 43 20         [ 4] 2607     call get_target_line
      009F0C 03 AE 9F         [ 2] 2608 	ldw ptr16,x 	
      009F0F 54 CD 8A 1E A6   [ 1] 2609 	mov in,count ; move to end of line  
      009F14 0D               [ 2] 2610 	popw x ; cmd address, GOTO||GOSUB 
      009F15 CD 89 C1         [ 2] 2611 	cpw x,#goto 
      009F18 81 70            [ 1] 2612 	jrne 7$ 
      009F1A 72 6F 67         [ 2] 2613 	ldw x,ptr16 
      009F1D 72 61            [ 2] 2614 	jra jp_to_target
      002482                       2615 7$: 
      009F1F 6D 20            [ 2] 2616 	jra gosub_2 ; target in ptr16 
      002484                       2617 9$: ; expr out of range skip to end of line
                                   2618     ; this will force a fall to next line  
      009F21 61 64 64 72 65   [ 1] 2619 	mov in,count
      002489                       2620 	_drop 2
      009F26 73 73            [ 2]    1     addw sp,#2 
      009F28 3A 20 00         [ 2] 2621 	jp next_line  
                                   2622 
                                   2623 
                                   2624 ;------------------------
                                   2625 ; BASIC: GOTO line# 
                                   2626 ; jump to line# 
                                   2627 ; here cstack is 2 call deep from interpreter 
                                   2628 ;------------------------
      00248E                       2629 goto:
      009F2B 2C 20 70 72 6F   [ 2] 2630 	btjt flags,#FRUN,goto_1  
      009F30 67 72            [ 1] 2631 	ld a,#ERR_RUN_ONLY
      009F32 61 6D 20         [ 2] 2632 	jp tb_error 
      002498                       2633 goto_1:
      009F35 73 69 7A         [ 4] 2634 	call get_target_line
      00249B                       2635 jp_to_target:
      009F38 65 3A 20         [ 2] 2636 	ldw basicptr,x 
      009F3B 00 20            [ 1] 2637 	ld a,(2,x)
      009F3D 62 79 74         [ 1] 2638 	ld count,a 
      009F40 65 73 00 20      [ 1] 2639 	mov in,#3 
      009F44 69               [ 4] 2640 	ret 
                                   2641 
                                   2642 
                                   2643 ;--------------------
                                   2644 ; BASIC: GOSUB line#
                                   2645 ; basic subroutine call
                                   2646 ; actual line# and basicptr 
                                   2647 ; are saved on cstack
                                   2648 ; here cstack is 2 call deep from interpreter 
                                   2649 ;--------------------
                           000001  2650 	TARGET=1   ; target address 
                           000003  2651 	RET_ADDR=3 ; subroutine return address 
                           000005  2652 	RET_BPTR=5 ; basicptr return point 
                           000007  2653 	RET_INW=7  ; in.w return point 
                           000004  2654 	VSIZE=4  
      0024A8                       2655 gosub:
      009F45 6E 20 46 4C 41   [ 2] 2656 	btjt flags,#FRUN,gosub_1 
      009F4A 53 48            [ 1] 2657 	ld a,#ERR_RUN_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      009F4C 20 6D 65         [ 2] 2658 	jp tb_error 
      009F4F 6D               [ 4] 2659 	ret 
      0024B3                       2660 gosub_1:
      009F50 6F 72 79         [ 4] 2661 	call get_target_line 
      009F53 00 20 69         [ 2] 2662 	ldw ptr16,x 
      0024B9                       2663 gosub_2: 
      009F56 6E               [ 2] 2664 	popw x 
      0024BA                       2665 	_vars VSIZE  
      009F57 20 52            [ 2]    1     sub sp,#VSIZE 
      009F59 41               [ 2] 2666 	pushw x ; RET_ADDR 
      009F5A 4D 20 6D         [ 2] 2667 	ldw x,ptr16 
      009F5D 65               [ 2] 2668 	pushw x ; TARGET
                                   2669 ; save BASIC subroutine return point.   
      009F5E 6D 6F 72         [ 2] 2670 	ldw x,basicptr
      009F61 79 00            [ 2] 2671 	ldw (RET_BPTR,sp),x 
      009F63 CE 00 00         [ 2] 2672 	ldw x,in.w 
      009F63 72 01            [ 2] 2673 	ldw (RET_INW,sp),x
      009F65 00               [ 2] 2674 	popw x 
      009F66 23 05            [ 2] 2675 	jra jp_to_target
                                   2676 
                                   2677 ;------------------------
                                   2678 ; BASIC: RETURN 
                                   2679 ; exit from BASIC subroutine 
                                   2680 ;------------------------
                           000003  2681 	RET_BPTR=3 ; basicptr return point 
                           000005  2682 	RET_INW=5  ; in.w return point 
                           000004  2683 	VSIZE=4  
      0024CE                       2684 return:
      009F68 A6 07 CC 97 21   [ 2] 2685 	btjt flags,#FRUN,0$ 
      009F6D A6 06            [ 1] 2686 	ld a,#ERR_RUN_ONLY
      009F6D CD 98 20         [ 2] 2687 	jp tb_error 
      0024D8                       2688 0$:	
      009F70 A1 04            [ 2] 2689 	ldw x,(RET_ADDR,sp) 
      009F72 26 10 CD         [ 2] 2690 	ldw basicptr,x
      009F75 98 6F            [ 1] 2691 	ld a,(2,x)
      009F77 A4 DF A1         [ 1] 2692 	ld count,a  
      009F7A 43 26            [ 2] 2693 	ldw x,(RET_INW,sp)
      009F7C 04 CD 9D         [ 2] 2694 	ldw in.w,x 
      009F7F 46               [ 2] 2695 	popw x 
      0024E8                       2696 	_drop VSIZE 
      009F80 81 CC            [ 2]    1     addw sp,#VSIZE 
      009F82 97               [ 2] 2697 	pushw x
      009F83 1F               [ 4] 2698 	ret  
                                   2699 
                                   2700 ;----------------------------------
                                   2701 ; BASIC: RUN
                                   2702 ; run BASIC program in RAM
                                   2703 ;----------------------------------- 
      0024EC                       2704 run: 
      009F84 55 00 03 00 02   [ 2] 2705 	btjf flags,#FRUN,0$  
      009F89 CD               [ 1] 2706 	clr a 
      009F8A 9E               [ 4] 2707 	ret
      0024F3                       2708 0$: 
      009F8B D2 22 01 81 52   [ 2] 2709 	btjf flags,#FBREAK,1$
      0024F8                       2710 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009F90 06 CE            [ 2]    1     addw sp,#2 
      009F92 00 1C 1F         [ 4] 2711 	call rest_context
      0024FD                       2712 	_drop CTXT_SIZE 
      009F95 05 FE            [ 2]    1     addw sp,#CTXT_SIZE 
      009F97 1F 01 AE 7F      [ 1] 2713 	bres flags,#FBREAK 
      009F9B FF 1F 03 CD      [ 1] 2714 	bset flags,#FRUN 
      009F9F 99 DE 4D         [ 2] 2715 	jp interpreter 
      009FA2 27 31 A1         [ 2] 2716 1$:	ldw x,txtbgn
      009FA5 02 27 07         [ 2] 2717 	cpw x,txtend 
      009FA8 A1 01            [ 1] 2718 	jrmi run_it 
      009FAA 27 06 CC         [ 2] 2719 	ldw x,#err_no_prog
      009FAD 97 1F 85         [ 4] 2720 	call puts 
      009FB0 1F 05 03 00 01   [ 1] 2721 	mov in,count
      009FB2 81               [ 4] 2722 	ret 
      00251E                       2723 run_it:	 
      00251E                       2724 	_drop 2 ; drop return address 
      009FB2 85 1F            [ 2]    1     addw sp,#2 
      002520                       2725 run_it_02: 
      009FB4 01 1C 69         [ 4] 2726     call ubound 
      009FB5 CD 14 53         [ 4] 2727 	call clear_vars 
                                   2728 ; clear data pointer 
      009FB5 CE               [ 1] 2729 	clrw x 
      009FB6 00 1C 1F         [ 2] 2730 	ldw data_ptr,x 
      009FB9 05 C3 00 1E      [ 1] 2731 	clr data_ofs 
      009FBD 2A 38 FE 13      [ 1] 2732 	clr data_len 
                                   2733 ; initialize BASIC pointer 
      009FC1 01 2A 11         [ 2] 2734 	ldw x,txtbgn 
      009FC4 1E 05 E6         [ 2] 2735 	ldw basicptr,x 
      009FC7 02 C7            [ 1] 2736 	ld a,(2,x)
      009FC9 00 0F 72         [ 1] 2737 	ld count,a
      009FCC 5F 00 0E 72      [ 1] 2738 	mov in,#3	
      009FD0 BB 00 0E 20      [ 1] 2739 	bset flags,#FRUN 
      009FD4 E3 17 4A         [ 2] 2740 	jp interpreter 
                                   2741 
                                   2742 
                                   2743 ;----------------------
                                   2744 ; BASIC: END
                                   2745 ; end running program
                                   2746 ;---------------------- 
      009FD5                       2747 cmd_end: 
                                   2748 ; clean stack 
      009FD5 1E 05 E6         [ 2] 2749 	ldw x,#STACK_EMPTY
      009FD8 02               [ 1] 2750 	ldw sp,x 
      009FD9 CD A0 4C         [ 2] 2751 	jp warm_start
                                   2752 
                                   2753 ;---------------------------
                                   2754 ; BASIC: GET var 
                                   2755 ; receive a key in variable 
                                   2756 ; don't wait 
                                   2757 ;---------------------------
      00254F                       2758 cmd_get:
      009FDC 1E 05 E6         [ 4] 2759 	call next_token 
      009FDF 02 C7            [ 1] 2760 	cp a,#TK_VAR 
      009FE1 00 0F            [ 1] 2761 	jreq 0$
      009FE3 72 5F 00         [ 2] 2762 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009FE6 0E 72 BB         [ 4] 2763 0$: call get_addr 
      009FE9 00 0E C3         [ 2] 2764 	ldw ptr16,x 
      009FEC 00 1E 2A         [ 4] 2765 	call qgetc 
      009FEF 07 1F            [ 1] 2766 	jreq 2$
      009FF1 05 FE 13         [ 4] 2767 	call getc  
      009FF4 03 2F DE 19      [ 4] 2768 2$: clr [ptr16]
      009FF7 72 5C 00 1A      [ 1] 2769 	inc ptr8 
      009FF7 55 00 04 00      [ 4] 2770 	clr [ptr16]
      009FFB 02 AE 16 B8      [ 1] 2771 	inc ptr8 
      009FFF CF 00 05 5B      [ 4] 2772 	ld [ptr16],a 
      00A003 06               [ 4] 2773 	ret 
                                   2774 
                                   2775 
                                   2776 ;-----------------
                                   2777 ; 1 Khz beep 
                                   2778 ;-----------------
      00257C                       2779 beep_1khz:: 
      00A004 CD 9E            [ 2] 2780 	pushw y 
      00A006 DA 81 64         [ 2] 2781 	ldw x,#100
      00A008 90 AE 03 E8      [ 2] 2782 	ldw y,#1000
      00A008 CD A8            [ 2] 2783 	jra beep
                                   2784 
                                   2785 ;-----------------------
                                   2786 ; BASIC: TONE expr1,expr2
                                   2787 ; used TIMER2 channel 1
                                   2788 ; to produce a tone 
                                   2789 ; arguments:
                                   2790 ;    expr1   frequency 
                                   2791 ;    expr2   duration msec.
                                   2792 ;---------------------------
      002587                       2793 tone:
      00A00A 37 27            [ 2] 2794 	pushw y 
      00A00C 07 AE A0         [ 4] 2795 	call arg_list 
      00A00F 35 CD            [ 1] 2796 	cp a,#2 
      00A011 8A 1E            [ 1] 2797 	jreq 1$
      00A013 81 16 9F         [ 2] 2798 	jp syntax_error 
      00A014                       2799 1$: 
      002593                       2800 	_xpop 
      00A014 90 AE            [ 1]    1     ld a,(y)
      00A016 B6               [ 1]    2     ldw x,y 
      00A017 00 CE            [ 2]    3     ldw x,(1,x)
      00A019 B6 02 1C 00      [ 2]    4     addw y,#CELL_SIZE 
      00A01D 04               [ 2] 2801 	pushw x ; duration 
      00259D                       2802 	_xpop ; frequency
      00A01E CF 00            [ 1]    1     ld a,(y)
      00A020 0E               [ 1]    2     ldw x,y 
      00A021 AE 00            [ 2]    3     ldw x,(1,x)
      00A023 7C CD 94 8F      [ 2]    4     addw y,#CELL_SIZE 
      00A027 AE 00            [ 1] 2803 	ldw y,x ; frequency 
      00A029 80               [ 2] 2804 	popw x  ; duration 
      0025A9                       2805 beep:  
      00A02A CF               [ 2] 2806 	pushw x 
      00A02B 00 1C 72         [ 2] 2807 	ldw x,#TIM2_CLK_FREQ
      00A02E BB               [ 2] 2808 	divw x,y ; cntr=Fclk/freq 
                                   2809 ; round to nearest integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A02F 00 7E CF 00      [ 2] 2810 	cpw y,#TIM2_CLK_FREQ/2
      00A033 1E 81            [ 1] 2811 	jrmi 2$
      00A035 4E               [ 1] 2812 	incw x 
      0025B5                       2813 2$:	 
      00A036 6F               [ 1] 2814 	ld a,xh 
      00A037 20 61 70         [ 1] 2815 	ld TIM2_ARRH,a 
      00A03A 70               [ 1] 2816 	ld a,xl 
      00A03B 6C 69 63         [ 1] 2817 	ld TIM2_ARRL,a 
                                   2818 ; 50% duty cycle 
      00A03E 61               [ 1] 2819 	ccf 
      00A03F 74               [ 2] 2820 	rrcw x 
      00A040 69               [ 1] 2821 	ld a,xh 
      00A041 6F 6E 20         [ 1] 2822 	ld TIM2_CCR1H,a 
      00A044 73               [ 1] 2823 	ld a,xl
      00A045 61 76 65         [ 1] 2824 	ld TIM2_CCR1L,a
      00A048 64 2E 0A 00      [ 1] 2825 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A04C 72 10 53 00      [ 1] 2826 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A04C 90 89 C7 00      [ 1] 2827 	bset TIM2_EGR,#TIM2_EGR_UG
      00A050 04               [ 2] 2828 	popw x 
      00A051 E6 02 C1         [ 4] 2829 	call pause02
      00A054 00 04 2A 03      [ 1] 2830 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A058 C7 00 04 CF      [ 1] 2831 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A05C 00 05            [ 2] 2832 	popw y 
      00A05E 90               [ 4] 2833 	ret 
                                   2834 
                                   2835 ;-------------------------------
                                   2836 ; BASIC: ADCON 0|1 [,divisor]  
                                   2837 ; disable/enanble ADC 
                                   2838 ;-------------------------------
                           000003  2839 	ONOFF=3 
                           000001  2840 	DIVSOR=1
                           000004  2841 	VSIZE=4 
      0025E2                       2842 power_adc:
      00A05F AE 16 68         [ 4] 2843 	call arg_list 
      00A062 CD 92            [ 1] 2844 	cp a,#2	
      00A064 79 CD            [ 1] 2845 	jreq 1$
      00A066 8A 1E            [ 1] 2846 	cp a,#1 
      00A068 A6 0D            [ 1] 2847 	jreq 0$ 
      00A06A CD 89 C1         [ 2] 2848 	jp syntax_error 
      00A06D 90               [ 1] 2849 0$:	clr a 
      00A06E 85               [ 1] 2850 	clrw x
      0025F2                       2851 	_xpush   ; divisor  
      00A06F 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A070 90 F7            [ 1]    2     ld (y),a 
      00A070 52 01 01         [ 2]    3     ldw (1,y),x 
      00A072                       2852 1$: _at_next 
      00A072 0F 01 03         [ 1]    1     ld a,(3,y)
      00A074 93               [ 1]    2     ldw x,y 
      00A074 CD 98            [ 2]    3     ldw x,(4,x)
      00A076 20               [ 2] 2853 	tnzw x 
      00A077 A1 02            [ 1] 2854 	jreq 2$ 
      002604                       2855 	_xpop
      00A079 25 08            [ 1]    1     ld a,(y)
      00A07B A1               [ 1]    2     ldw x,y 
      00A07C 0A 27            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A07E 04 A1 80 26      [ 2]    4     addw y,#CELL_SIZE 
      00260D                       2856 	_xdrop  
      00A082 07 A9 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A083 9F               [ 1] 2857 	ld a,xl
      00A083 55 00            [ 1] 2858 	and a,#7
      00A085 03               [ 1] 2859 	swap a 
      00A086 00 02 20         [ 1] 2860 	ld ADC_CR1,a
      00A089 5D 16 50 CA      [ 1] 2861 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A08A 72 10 54 01      [ 1] 2862 	bset ADC_CR1,#ADC_CR1_ADON 
      002620                       2863 	_usec_dly 7 
      00A08A A1 02 27         [ 2]    1     ldw x,#(16*7-2)/4
      00A08D 12               [ 2]    2     decw x
      00A08E A1               [ 1]    3     nop 
      00A08F 04 27            [ 1]    4     jrne .-4
      00A091 1B A1            [ 2] 2864 	jra 3$
      00A093 82 27 1F A1      [ 1] 2865 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A097 08 27 24 A1      [ 1] 2866 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002631                       2867 3$:	
      00A09B 09               [ 4] 2868 	ret
                                   2869 
                                   2870 ;-----------------------------
                                   2871 ; BASIC: ADCREAD (channel)
                                   2872 ; read adc channel {0..5}
                                   2873 ; output:
                                   2874 ;   A 		TK_INTGR 
                                   2875 ;   X 		value 
                                   2876 ;-----------------------------
      002632                       2877 analog_read:
      00A09C 27 24 20         [ 4] 2878 	call func_args 
      00A09F 37 01            [ 1] 2879 	cp a,#1 
      00A0A0 27 03            [ 1] 2880 	jreq 1$
      00A0A0 CD 8A 1E         [ 2] 2881 	jp syntax_error
      00263C                       2882 1$: _xpop 
      00A0A3 5C 72            [ 1]    1     ld a,(y)
      00A0A5 B0               [ 1]    2     ldw x,y 
      00A0A6 00 05            [ 2]    3     ldw x,(1,x)
      00A0A8 CF 00 01 20      [ 2]    4     addw y,#CELL_SIZE 
      00A0AC C5 00 05         [ 2] 2883 	cpw x,#5 
      00A0AD 23 05            [ 2] 2884 	jrule 2$
      00A0AD CD 98            [ 1] 2885 	ld a,#ERR_BAD_VALUE
      00A0AF 6F CD 89         [ 2] 2886 	jp tb_error 
      00A0B2 C1               [ 1] 2887 2$: ld a,xl
      00A0B3 20 BD 0E         [ 1] 2888 	ld acc8,a 
      00A0B5 A6 05            [ 1] 2889 	ld a,#5
      00A0B5 CD 98 39         [ 1] 2890 	sub a,acc8 
      00A0B8 FD CD 89         [ 1] 2891 	ld ADC_CSR,a
      00A0BB C1 20 B4 02      [ 1] 2892 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0BE 72 10 54 01      [ 1] 2893 	bset ADC_CR1,#ADC_CR1_ADON
      00A0BE 03 01 20 B2 FB   [ 2] 2894 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0C2 CE 54 04         [ 2] 2895 	ldw x,ADC_DRH
      00A0C2 CD 98            [ 1] 2896 	ld a,#TK_INTGR
      00A0C4 20               [ 4] 2897 	ret 
                                   2898 
                                   2899 ;-----------------------
                                   2900 ; BASIC: DREAD(pin)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2901 ; Arduino pins 
                                   2902 ; read state of a digital pin 
                                   2903 ; pin# {0..15}
                                   2904 ; output:
                                   2905 ;    A 		TK_INTGR
                                   2906 ;    X      0|1 
                                   2907 ;-------------------------
                           000001  2908 	PINNO=1
                           000001  2909 	VSIZE=1
      00266E                       2910 digital_read:
      00266E                       2911 	_vars VSIZE 
      00A0C5 A1 84            [ 2]    1     sub sp,#VSIZE 
      00A0C7 27 03 CC         [ 4] 2912 	call func_args
      00A0CA 97 1F            [ 1] 2913 	cp a,#1
      00A0CC 27 03            [ 1] 2914 	jreq 1$
      00A0CC CD 98 5F         [ 2] 2915 	jp syntax_error
      00267A                       2916 1$: _xpop 
      00A0CF 9F A4            [ 1]    1     ld a,(y)
      00A0D1 0F               [ 1]    2     ldw x,y 
      00A0D2 C7 00            [ 2]    3     ldw x,(1,x)
      00A0D4 24 20 9B 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0D7 A3 00 0F         [ 2] 2917 	cpw x,#15 
      00A0D7 55 00            [ 2] 2918 	jrule 2$
      00A0D9 03 00            [ 1] 2919 	ld a,#ERR_BAD_VALUE
      00A0DB 02 CD 9C         [ 2] 2920 	jp tb_error 
      00A0DE 22 4D 27         [ 4] 2921 2$:	call select_pin 
      00A0E1 05 CD            [ 1] 2922 	ld (PINNO,sp),a
      00A0E3 98 9A            [ 1] 2923 	ld a,(GPIO_IDR,x)
      00A0E5 20 8B            [ 1] 2924 	tnz (PINNO,sp)
      00A0E7 27 05            [ 1] 2925 	jreq 8$
      00A0E7 0D               [ 1] 2926 3$: srl a 
      00A0E8 01 26            [ 1] 2927 	dec (PINNO,sp)
      00A0EA 05 A6            [ 1] 2928 	jrne 3$ 
      00A0EC 0D CD            [ 1] 2929 8$: and a,#1 
      00A0EE 89               [ 1] 2930 	clrw x 
      00A0EF C1               [ 1] 2931 	ld xl,a 
      00A0F0 5B               [ 1] 2932 	clr a 
      0026A2                       2933 	_drop VSIZE
      00A0F1 01 81            [ 2]    1     addw sp,#VSIZE 
      00A0F3 81               [ 4] 2934 	ret
                                   2935 
                                   2936 
                                   2937 ;-----------------------
                                   2938 ; BASIC: DWRITE pin,0|1
                                   2939 ; Arduino pins 
                                   2940 ; write to a digital pin 
                                   2941 ; pin# {0..15}
                                   2942 ; output:
                                   2943 ;    A 		TK_INTGR
                                   2944 ;    X      0|1 
                                   2945 ;-------------------------
                           000001  2946 	PINNO=1
                           000002  2947 	PINVAL=2
                           000002  2948 	VSIZE=2
      0026A5                       2949 digital_write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      0026A5                       2950 	_vars VSIZE 
      00A0F3 CE 00            [ 2]    1     sub sp,#VSIZE 
      00A0F5 05 1F 03         [ 4] 2951 	call arg_list  
      00A0F8 C6 00            [ 1] 2952 	cp a,#2 
      00A0FA 02 6B            [ 1] 2953 	jreq 1$
      00A0FC 05 C6 00         [ 2] 2954 	jp syntax_error
      0026B1                       2955 1$: _xpop 
      00A0FF 04 6B            [ 1]    1     ld a,(y)
      00A101 06               [ 1]    2     ldw x,y 
      00A102 81 01            [ 2]    3     ldw x,(1,x)
      00A103 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A103 1E               [ 1] 2956 	ld a,xl 
      00A104 03 CF            [ 1] 2957 	ld (PINVAL,sp),a
      0026BD                       2958 	_xpop 
      00A106 00 05            [ 1]    1     ld a,(y)
      00A108 7B               [ 1]    2     ldw x,y 
      00A109 05 C7            [ 2]    3     ldw x,(1,x)
      00A10B 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
      00A10F C7 00 04         [ 2] 2959 	cpw x,#15 
      00A112 81 05            [ 2] 2960 	jrule 2$
      00A113 A6 0A            [ 1] 2961 	ld a,#ERR_BAD_VALUE
      00A113 90 89 52         [ 2] 2962 	jp tb_error 
      00A116 05 2B 5A         [ 4] 2963 2$:	call select_pin 
      00A117 6B 01            [ 1] 2964 	ld (PINNO,sp),a 
      00A117 0F 05            [ 1] 2965 	ld a,#1
      00A119 CD 98            [ 1] 2966 	tnz (PINNO,sp)
      00A11B 20 A1            [ 1] 2967 	jreq 4$
      00A11D 02               [ 1] 2968 3$: sll a
      00A11E 26 10            [ 1] 2969 	dec (PINNO,sp)
      00A120 CD 8A            [ 1] 2970 	jrne 3$
      00A122 1E 5C            [ 1] 2971 4$: tnz (PINVAL,sp)
      00A124 72 B0            [ 1] 2972 	jrne 5$
      00A126 00               [ 1] 2973 	cpl a 
      00A127 05 CF            [ 1] 2974 	and a,(GPIO_ODR,x)
      00A129 00 01            [ 2] 2975 	jra 8$
      00A12B 03 05            [ 1] 2976 5$: or a,(GPIO_ODR,x)
      00A12D CD 98            [ 1] 2977 8$: ld (GPIO_ODR,x),a 
      0026ED                       2978 	_drop VSIZE 
      00A12F 20 A1            [ 2]    1     addw sp,#VSIZE 
      00A131 85               [ 4] 2979 	ret
                                   2980 
                                   2981 
                                   2982 ;-----------------------
                                   2983 ; BASIC: STOP
                                   2984 ; stop progam execution  
                                   2985 ; without resetting pointers 
                                   2986 ; the program is resumed
                                   2987 ; with RUN 
                                   2988 ;-------------------------
      0026F0                       2989 stop:
      00A132 27 03 CC 97 1F   [ 2] 2990 	btjt flags,#FRUN,2$
      00A137 CD               [ 1] 2991 	clr a
      00A138 98               [ 4] 2992 	ret 
      0026F7                       2993 2$:	 
                                   2994 ; create space on cstack to save context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A139 55 CF 00         [ 2] 2995 	ldw x,#break_point 
      00A13C 1A 0D 05         [ 4] 2996 	call puts 
      0026FD                       2997 	_drop 2 ;drop return address 
      00A13F 26 06            [ 2]    1     addw sp,#2 
      0026FF                       2998 	_vars CTXT_SIZE ; context size 
      00A141 CD 92            [ 2]    1     sub sp,#CTXT_SIZE 
      00A143 4E CD 89         [ 4] 2999 	call save_context 
      00A146 C1 16 68         [ 2] 3000 	ldw x,#tib 
      00A147 CF 00 04         [ 2] 3001 	ldw basicptr,x
      00A147 A6               [ 1] 3002 	clr (x)
      00A148 3A CD 89 C1      [ 1] 3003 	clr count  
      00A14C CD               [ 1] 3004 	clrw x 
      00A14D A0 F3 72         [ 2] 3005 	ldw in.w,x
      00A150 5F 00 04 CD      [ 1] 3006 	bres flags,#FRUN 
      00A154 8B 23 AE 16      [ 1] 3007 	bset flags,#FBREAK
      00A158 68 3B 00         [ 2] 3008 	jp interpreter 
      00A15B 04 4B 00 72 FB 01 5C  3009 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5B 02 72 5F 00 02 CD
             8F 98 A1 84 27 14 A1
             11 26 07 CD 8F 98 A1
             84 27
                                   3010 
                                   3011 ;-----------------------
                                   3012 ; BASIC: NEW
                                   3013 ; from command line only 
                                   3014 ; free program memory
                                   3015 ; and clear variables 
                                   3016 ;------------------------
      00273C                       3017 new: 
      00A179 06 01 00 22 01   [ 2] 3018 	btjf flags,#FRUN,0$ 
      00A17A 81               [ 4] 3019 	ret 
      002742                       3020 0$:	
      00A17A CD A1 03         [ 4] 3021 	call clear_basic 
      00A17D CC               [ 4] 3022 	ret 
                                   3023 
                                   3024 ;-----------------------------------
                                   3025 ; BASIC: ERASE \E | \F 
                                   3026 ; erase all block in range from 
                                   3027 ;  'app_space' to FLASH end (0x20000)
                                   3028 ;  or all EEPROM 
                                   3029 ; that contains a non zero byte.  
                                   3030 ;-----------------------------------
                           000001  3031 	LIMIT=1 
                           000003  3032 	VSIZE = 3 
      002746                       3033 erase:
      00A17E 97 1F 00 18      [ 1] 3034 	clr farptr 
      00A180                       3035 	_vars VSIZE 
      00A180 CD 82            [ 2]    1     sub sp,#VSIZE 
      00A182 89 17 A0         [ 4] 3036 	call next_token 
      00A183 A1 04            [ 1] 3037 	cp a,#TK_CHAR 
      00A183 C6 00            [ 1] 3038 	jreq 0$ 
      00A185 0D CE 00         [ 2] 3039 	jp syntax_error
      00A188 0E 72 C7         [ 4] 3040 0$: call get_char 
      00A18B 00 1A            [ 1] 3041 	and a,#0XDF 
      00A18D 72 5C            [ 1] 3042 	cp a,#'E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A18F 00 1B            [ 1] 3043 	jrne 1$
      00A191 72 CF 00         [ 2] 3044 	ldw x,#EEPROM_BASE 
      00A194 1A CD A1         [ 2] 3045 	ldw farptr+1,x 
      00A197 03 CD 98         [ 2] 3046 	ldw x,#EEPROM_END
      00A19A 20               [ 1] 3047 	clr a 
      00A19B A1 08            [ 2] 3048 	jra 3$ 
      00A19D 26 03            [ 1] 3049 1$: cp a,#'F 
      00A19F CC A1            [ 1] 3050 	jreq 2$
      00A1A1 17 15 DF         [ 2] 3051 	ldw x,#err_bad_value
      00A1A2 CC 16 A1         [ 2] 3052 	jp tb_error
      002775                       3053 2$:
      00A1A2 A1 00 27         [ 2] 3054 	ldw x,#app_space  
      00A1A5 07 A1 0A         [ 2] 3055 	ldw farptr+1,x 
      00A1A8 27 03            [ 1] 3056 	ld a,#(FLASH_END>>16)&0XFF 
      00A1AA CC 97 1F         [ 2] 3057 	ldw x,#FLASH_END&0xffff
      00A1AD                       3058 3$:
      00A1AD 5B 05            [ 1] 3059 	ld (LIMIT,sp),a 
      00A1AF 90 85            [ 2] 3060 	ldw (LIMIT+1,sp),x 
                                   3061  ; operation done from RAM
                                   3062  ; copy code to RAM in tib   
      00A1B1 81 07 3F         [ 4] 3063 	call move_erase_to_ram
      00A1B2                       3064 4$:	 
      00A1B2 55 00 04         [ 4] 3065     call scan_block 
      00A1B5 00 02            [ 1] 3066 	jreq 5$  ; block already erased 
      00A1B7 81 45            [ 1] 3067     ld a,#'E 
      00A1B8 CD 09 41         [ 4] 3068     call putc 
      00A1B8 52 04 0F         [ 4] 3069 	call block_erase   
                                   3070 ; this block is clean, next  
      00A1BB 01 CD 99         [ 2] 3071 5$:	ldw x,#BLOCK_SIZE
      00A1BE DE A1 02         [ 4] 3072 	call incr_farptr
                                   3073 ; check limit, 24 bit substraction  	
      00A1C1 24 03            [ 1] 3074 	ld a,(LIMIT,sp)
      00A1C3 CC 97            [ 2] 3075 	ldw x,(LIMIT+1,sp)
      00A1C5 1F A1 03 25      [ 2] 3076 	subw x,farptr+1
      00A1C9 0C 90 F6         [ 1] 3077 	sbc a,farptr 
      00A1CC 93 EE            [ 1] 3078 	jrugt 4$ 
      00A1CE 01 72 A9         [ 4] 3079 9$: call clear_basic
      00A1D1 00 03            [ 2] 3080 	ldw x,(LIMIT+1,sp)
      00A1D3 9F 6B 01         [ 2] 3081 	cpw x,#EEPROM_END
      00A1D6 90 F6            [ 1] 3082 	jrne 10$
      00A1D8 93 EE 01         [ 4] 3083 	call func_eefree 
      0027B4                       3084 10$:
      0027B4                       3085 	_drop VSIZE 
      00A1DB 72 A9            [ 2]    1     addw sp,#VSIZE 
      00A1DD 00               [ 4] 3086 	ret 
                                   3087 	
                                   3088 
                                   3089 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3090 ;  check for application signature 
                                   3091 ; output:
                                   3092 ;   Carry    0 app present 
                                   3093 ;            1 no app installed  
                                   3094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B7                       3095 qsign: 
      00A1DE 03 9F 6B         [ 2] 3096 	ldw x,app_sign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1E1 02 90 F6         [ 2] 3097 	cpw x,SIGNATURE ; "BC" 
      00A1E4 93               [ 4] 3098 	ret 
                                   3099 
                                   3100 ;--------------------------------------
                                   3101 ;  fill write buffer 
                                   3102 ;  input:
                                   3103 ;    y  point to output buffer 
                                   3104 ;    x  point to source 
                                   3105 ;    a  bytes to write in buffer 
                                   3106 ;  output:
                                   3107 ;    y   += A 
                                   3108 ;    X   += A 
                                   3109 ;    A   0 
                                   3110 ;---------------------------------------
      0027BE                       3111 fill_write_buffer:
      00A1E5 EE               [ 1] 3112 	push a 
      00A1E6 01               [ 1] 3113 	tnz a 
      00A1E7 72 A9            [ 1] 3114 	jreq 9$ 
      00A1E9 00               [ 1] 3115 1$: ld a,(x)
      00A1EA 03               [ 1] 3116 	incw x 
      00A1EB F6 14            [ 1] 3117 	ld (y),a 
      00A1ED 02 18            [ 1] 3118 	incw y 
      00A1EF 01 27            [ 1] 3119 	dec (1,sp) 
      00A1F1 F9 5B            [ 1] 3120 	jrne 1$ 
      00A1F3 04               [ 1] 3121 9$:	pop a 
      00A1F4 81               [ 4] 3122     ret 	
                                   3123 
                                   3124 ;--------------------------------------
                                   3125 ;  fill pad buffer with zero 
                                   3126 ;  input:
                                   3127 ;	none 
                                   3128 ;  output:
                                   3129 ;    y     buffer address  
                                   3130 ;--------------------------------------
      00A1F5                       3131 clear_block_buffer:
      00A1F5 CD               [ 1] 3132 	push a 
      00A1F6 99 DE A1 02      [ 2] 3133 	ldw y,#block_buffer 
      00A1FA 27 03            [ 2] 3134 	pushw y
      00A1FC CC 97            [ 1] 3135 	ld a,#BLOCK_SIZE   
      00A1FE 1F 7F            [ 1] 3136 1$:	clr (y)
      00A1FF 90 5C            [ 1] 3137 	incw y
      00A1FF 90               [ 1] 3138 	dec a  
      00A200 F6 93            [ 1] 3139 	jrne 1$ 	
      00A202 EE 01            [ 2] 3140 9$: popw y 
      00A204 72               [ 1] 3141 	pop a 			
      00A205 A9               [ 4] 3142 	ret 
                                   3143 
                                   3144 
                                   3145 ;---------------------------------------
                                   3146 ; BASIC: SAVE
                                   3147 ; write application from RAM to FLASH
                                   3148 ;--------------------------------------
                           000001  3149 	XTEMP=1
                           000003  3150 	COUNT=3  ; last count bytes written 
                           000004  3151 	CNT_LO=4 ; count low byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                           000005  3152 	TOWRITE=5 ; how bytes left to write  
                           000006  3153 	VSIZE=6 
      0027E2                       3154 save_app:
      00A206 00               [ 2] 3155 	pushw x 
      00A207 03 9F            [ 2] 3156 	pushw y 
      0027E5                       3157 	_vars VSIZE
      00A209 88 90            [ 2]    1     sub sp,#VSIZE 
      00A20B F6 93 EE         [ 4] 3158 	call qsign 
      00A20E 01 72            [ 1] 3159 	jrne 1$
      00A210 A9 00 03         [ 2] 3160 	ldw x,#CANT_DO 
      00A213 84 FA F7         [ 4] 3161 	call puts 
      00A216 81 28 71         [ 2] 3162 	jp 9$
      00A217                       3163 1$: 
      00A217 CD 99 DE         [ 2] 3164 	ldw x,txtbgn
      00A21A A1 02 27         [ 2] 3165 	cpw x,txtend 
      00A21D 03 CC            [ 1] 3166 	jrult 2$ 
      00A21F 97 1F BB         [ 2] 3167 	ldw x,#NO_APP
      00A221 CD 09 9E         [ 4] 3168 	call puts 
      00A221 90 F6 93         [ 2] 3169 	jp 9$
      002806                       3170 2$: 
                                   3171 ; block programming flash
                                   3172 ; must be done from RAM
                                   3173 ; moved in tib  
      00A224 EE 01 72         [ 4] 3174 	call move_prg_to_ram
                                   3175 ; initialize farptr 
                                   3176 ; to app_sign address 
      00A227 A9 00 03 9F      [ 1] 3177 	clr farptr 
      00A22B 43 88 90         [ 2] 3178 	ldw x,#app_sign 
      00A22E F6 93 EE         [ 2] 3179 	ldw farptr+1,x
                                   3180 ; initialize local variables 
      00A231 01 72 A9         [ 4] 3181 	call prog_size
      00A234 00 03            [ 2] 3182 	ldw (TOWRITE,sp),x
      00A236 84 F4            [ 1] 3183 	clr (COUNT,sp)
                                   3184 ; first bock 
                                   3185 ; containt signature 2 bytes 
                                   3186 ; and size 	2 bytes 
                                   3187 ; use Y as pointer to block_buffer
      00A238 F7 81 CE         [ 4] 3188 	call clear_block_buffer ; -- y=*block_buffer	
                                   3189 ; write signature
      00A23A CE 28 77         [ 2] 3190 	ldw x,SIGNATURE ; "BC" 
      00A23A CD 99            [ 2] 3191 	ldw (y),x 
      00A23C DE A1 02 27      [ 2] 3192 	addw y,#2
      00A240 03 CC            [ 2] 3193 	ldw x,(TOWRITE,sp)
      00A242 97 1F            [ 2] 3194 	ldw (y),x
      00A244 90 F6 93 EE      [ 2] 3195 	addw y,#2   
      00A248 01 72            [ 1] 3196 	ld a,#(BLOCK_SIZE-4)
      00A24A A9 00            [ 1] 3197 	ld (CNT_LO,sp),a 
      00A24C 03 9F 88         [ 2] 3198 	cpw x,#(BLOCK_SIZE-4) 
      00A24F 90 F6            [ 1] 3199 	jrugt 3$
      00A251 93               [ 1] 3200 	ld a,xl 
      00A252 EE 01            [ 1] 3201 3$:	ld (CNT_LO,sp),a   
      00A254 72 A9 00         [ 2] 3202 	ldw x,txtbgn 
      00A257 03 84            [ 2] 3203 	ldw (XTEMP,sp),x 
      00283F                       3204 32$: 
      00A259 F8 F7            [ 2] 3205 	ldw x,(XTEMP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A25B 81 04            [ 1] 3206 	ld a,(CNT_LO,sp)
      00A25C CD 27 BE         [ 4] 3207 	call fill_write_buffer 
      00A25C CD 99            [ 2] 3208 	ldw (XTEMP,sp),x 
      00A25E D9 A1 02         [ 2] 3209 	ldw x,#block_buffer
      00A261 27 03 CC         [ 4] 3210 	call write_buffer
      00A264 97 1F 80         [ 2] 3211 	ldw x,#BLOCK_SIZE 
      00A266 CD 08 B3         [ 4] 3212 	call incr_farptr  
                                   3213 ; following blocks 
      00A266 90 F6            [ 2] 3214 	ldw x,(XTEMP,sp)
      00A268 93 EE 01         [ 2] 3215 	cpw x,txtend 
      00A26B 72 A9            [ 1] 3216 	jruge 9$ 
      00A26D 00 03            [ 2] 3217 	ldw x,(TOWRITE,sp)
      00A26F 9F A4 07         [ 2] 3218 	subw x,(COUNT,sp)
      00A272 88 A6            [ 2] 3219 	ldw (TOWRITE,sp),x 
      00A274 01 0D            [ 1] 3220 	ld a,#BLOCK_SIZE 
      00A276 01 27 05         [ 2] 3221 	cpw x,#BLOCK_SIZE 
      00A279 48 0A            [ 1] 3222 	jruge 4$ 
      00A27B 01               [ 1] 3223 	ld a,xl 
      00A27C 20 F7            [ 1] 3224 4$:	ld (CNT_LO,sp),a 
      00A27E 6B 01 90         [ 4] 3225 	call clear_block_buffer 
      00A281 F6 93            [ 2] 3226 	jra 32$ 
      002871                       3227 9$:	_drop VSIZE 
      00A283 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A285 72 A9            [ 2] 3228     popw y 
      00A287 00               [ 2] 3229 	popw x 
      00A288 03               [ 4] 3230 	ret 
                                   3231 
                                   3232 
      00A289 84 F4                 3233 SIGNATURE: .ascii "BC"
      00A28B 27 02 A6 01 5F 97 4F  3234 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             81 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A293 4E 6F 20 61 70 70 6C  3235 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3236 
                                   3237 ;---------------------
                                   3238 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3239 ; write 1 or more byte to FLASH or EEPROM
                                   3240 ; starting at address  
                                   3241 ; input:
                                   3242 ;   expr1  	is address 
                                   3243 ;   expr2,...,exprn   are bytes to write
                                   3244 ; output:
                                   3245 ;   none 
                                   3246 ;---------------------
      0028D1                       3247 write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A293 CD 99 DE         [ 4] 3248 	call expression
      00A296 A1 02            [ 1] 3249 	cp a,#TK_INTGR 
      00A298 27 03            [ 1] 3250 	jreq 0$
      00A29A CC 97 1F         [ 2] 3251 	jp syntax_error
      00A29D                       3252 0$: _xpop 
      00A29D 90 F6            [ 1]    1     ld a,(y)
      00A29F 93               [ 1]    2     ldw x,y 
      00A2A0 EE 01            [ 2]    3     ldw x,(1,x)
      00A2A2 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2A6 9F 88 90         [ 1] 3253 	ld farptr,a 
      00A2A9 F6 93 EE         [ 2] 3254 	ldw ptr16,x 
      0028EA                       3255 1$:	
      00A2AC 01 72 A9         [ 4] 3256 	call next_token 
      00A2AF 00 03            [ 1] 3257 	cp a,#TK_COMMA 
      00A2B1 84 F7            [ 1] 3258 	jreq 2$ 
      00A2B3 81 20            [ 2] 3259 	jra 9$ ; no more data 
      00A2B4 CD 1A 89         [ 4] 3260 2$:	call expression
      00A2B4 CD 99            [ 1] 3261 	cp a,#TK_INTGR
      00A2B6 D9 A1            [ 1] 3262 	jreq 3$
      00A2B8 01 27 03         [ 2] 3263 	jp syntax_error
      0028FD                       3264 3$:	_xpop 
      00A2BB CC 97            [ 1]    1     ld a,(y)
      00A2BD 1F               [ 1]    2     ldw x,y 
      00A2BE 90 F6            [ 2]    3     ldw x,(1,x)
      00A2C0 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2C4 A9               [ 1] 3265 	ld a,xl 
      00A2C5 00               [ 1] 3266 	clrw x 
      00A2C6 03 C7 00         [ 4] 3267 	call write_byte
      00A2C9 19 CF 00         [ 2] 3268 	ldw x,#1 
      00A2CC 1A 92 BC         [ 4] 3269 	call incr_farptr 
      00A2CF 00 19            [ 2] 3270 	jra 1$ 
      002913                       3271 9$:
      00A2D1 5F               [ 4] 3272 	ret 
                                   3273 
                                   3274 
                                   3275 ;---------------------
                                   3276 ;BASIC: CHAR(expr)
                                   3277 ; évaluate expression 
                                   3278 ; and take the 7 least 
                                   3279 ; bits as ASCII character
                                   3280 ; output: 
                                   3281 ; 	A char 
                                   3282 ;---------------------
      002914                       3283 char:
      00A2D2 97 4F 81         [ 4] 3284 	call func_args 
      00A2D5 A1 01            [ 1] 3285 	cp a,#1
      00A2D5 CD 9C            [ 1] 3286 	jreq 1$
      00A2D7 22 90 F6         [ 2] 3287 	jp syntax_error
      00291E                       3288 1$:	_xpop
      00A2DA 93 EE            [ 1]    1     ld a,(y)
      00A2DC 01               [ 1]    2     ldw x,y 
      00A2DD 72 A9            [ 2]    3     ldw x,(1,x)
      00A2DF 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2E3 0D               [ 1] 3289 	ld a,xl
      00A2E4 5D 26            [ 1] 3290 	and a,#0x7f 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A2E6 0A               [ 4] 3291 	ret
                                   3292 
                                   3293 ;---------------------
                                   3294 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3295 ; extract first character 
                                   3296 ; of string argument 
                                   3297 ; output:
                                   3298 ;    A:X    int24 
                                   3299 ;---------------------
      00292B                       3300 ascii:
      00A2E7 55 00            [ 1] 3301 	ld a,#TK_LPAREN
      00A2E9 04 00 02         [ 4] 3302 	call expect 
      00A2EC 5B 02 CC         [ 4] 3303 	call next_token 
      00A2EF 97 D2            [ 1] 3304 	cp a,#TK_QSTR 
      00A2F1 81 0E            [ 1] 3305 	jreq 1$
      00A2F2 A1 04            [ 1] 3306 	cp a,#TK_CHAR 
      00A2F2 85 52            [ 1] 3307 	jreq 2$ 
      00A2F4 0D 89            [ 1] 3308 	cp a,#TK_CFUNC 
      00A2F6 A6 85            [ 1] 3309 	jreq 0$
      00A2F8 CD 99 CC         [ 2] 3310 	jp syntax_error
      002942                       3311 0$: ; cfunc 
      00A2FB CD               [ 4] 3312 	call (x)
      00A2FC 98 55            [ 2] 3313 	jra 3$
      002945                       3314 1$: ; quoted string 
      00A2FE 1F               [ 1] 3315 	ld a,(x)
      00A2FF 09               [ 1] 3316 	push a  
      00A300 CD 9D 0A         [ 4] 3317 	call skip_string
      00A303 72               [ 1] 3318 	pop a  	
      00A304 14 00            [ 2] 3319 	jra 3$ 
      00294D                       3320 2$: ; character 
      00A306 23 CD 98         [ 4] 3321 	call get_char 
      00A309 20               [ 1] 3322 3$:	clrw x 
      00A30A A1               [ 1] 3323 	rlwa x   
      002952                       3324 4$:	_xpush  
      00A30B 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A30F 97 1F            [ 1]    2     ld (y),a 
      00A311 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A311 CD 98            [ 1] 3325 	ld a,#TK_RPAREN 
      00A313 39 A3 A3         [ 4] 3326 	call expect
      002960                       3327 9$:	
      002960                       3328 	_xpop  
      00A316 1C 27            [ 1]    1     ld a,(y)
      00A318 03               [ 1]    2     ldw x,y 
      00A319 CC 97            [ 2]    3     ldw x,(1,x)
      00A31B 1F A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A31C 81               [ 4] 3329 	ret 
                                   3330 
                                   3331 ;---------------------
                                   3332 ;BASIC: KEY
                                   3333 ; wait for a character 
                                   3334 ; received from STDIN 
                                   3335 ; input:
                                   3336 ;	none 
                                   3337 ; output:
                                   3338 ;	a	 character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3339 ;---------------------
      00296A                       3340 key:
      00A31C 72 04 00         [ 4] 3341 	call getc 
      00A31F 23               [ 4] 3342 	ret
                                   3343 
                                   3344 ;----------------------
                                   3345 ; BASIC: QKEY
                                   3346 ; Return true if there 
                                   3347 ; is a character in 
                                   3348 ; waiting in STDIN 
                                   3349 ; input:
                                   3350 ;  none 
                                   3351 ; output:
                                   3352 ;   A     0|-1
                                   3353 ;-----------------------
      00296E                       3354 qkey:: 
      00A320 03               [ 1] 3355 	clrw x 
      00A321 CC 97 1F         [ 1] 3356 	ld a,rx1_head
      00A324 CD 9B 09         [ 1] 3357 	sub a,rx1_tail 
      00A327 A1 84            [ 1] 3358 	jreq 9$ 
      00A329 27               [ 2] 3359 	cplw x
      00A32A 03 CC            [ 1] 3360 	ld a,#255    
      00297A                       3361 9$: 
      00A32C 97               [ 4] 3362 	ret 
                                   3363 
                                   3364 ;---------------------
                                   3365 ; BASIC: GPIO(port,reg)
                                   3366 ; return gpio register address 
                                   3367 ; expr {PORTA..PORTI}
                                   3368 ; input:
                                   3369 ;   none 
                                   3370 ; output:
                                   3371 ;   A:X 	gpio register address
                                   3372 ;----------------------------
                                   3373 ;	N=PORT
                                   3374 ;	T=REG 
      00297B                       3375 gpio:
      00A32D 1F 90 F6         [ 4] 3376 	call func_args 
      00A330 93 EE            [ 1] 3377 	cp a,#2
      00A332 01 72            [ 1] 3378 	jreq 1$
      00A334 A9 00 03         [ 2] 3379 	jp syntax_error  
      002985                       3380 1$:	_at_next 
      00A337 6B 06 1F         [ 1]    1     ld a,(3,y)
      00A33A 07               [ 1]    2     ldw x,y 
      00A33B CD 98            [ 2]    3     ldw x,(4,x)
      00A33D 20 A1 00         [ 2] 3381 	cpw x,#PA_BASE 
      00A340 27 11            [ 1] 3382 	jrmi bad_port
      00A342 A1 80 26         [ 2] 3383 	cpw x,#PI_BASE+1 
      00A345 08 CD            [ 1] 3384 	jrpl bad_port
      00A347 98               [ 2] 3385 	pushw x 
      002996                       3386 	_xpop
      00A348 39 A3            [ 1]    1     ld a,(y)
      00A34A A3               [ 1]    2     ldw x,y 
      00A34B 5C 27            [ 2]    3     ldw x,(1,x)
      00A34D 0E A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A34E 72 FB 01         [ 2] 3387 	addw x,(1,sp)
      0029A2                       3388 	_drop 2 
      00A34E 55 00            [ 2]    1     addw sp,#2 
      00A350 03               [ 1] 3389 	clr a 
      00A351 00               [ 4] 3390 	ret
      0029A6                       3391 bad_port:
      00A352 02 0A            [ 1] 3392 	ld a,#ERR_BAD_VALUE
      00A353 CC 16 A1         [ 2] 3393 	jp tb_error
                                   3394 
                                   3395 
                                   3396 ;-------------------------
                                   3397 ; BASIC: UFLASH 
                                   3398 ; return free flash address
                                   3399 ; input:
                                   3400 ;  none 
                                   3401 ; output:
                                   3402 ;	A		TK_INTGR
                                   3403 ;   xstack	free address 
                                   3404 ;---------------------------
      0029AB                       3405 uflash:
      00A353 0F 03 AE         [ 4] 3406 	call qsign 
      00A356 00 01            [ 1] 3407 	jrne 1$
      00A358 1F 04 20         [ 2] 3408 	ldw x,#app_space 
      00A35B 2F BB 35 82      [ 2] 3409 	addw x,app_size 
      00A35C 1C 00 04         [ 2] 3410 	addw x,#4
                                   3411 ; align on 128 bytes block 
      00A35C 72 04 00         [ 2] 3412 	addw x,#BLOCK_SIZE 
      00A35F 23               [ 1] 3413 	ld a,xl 
      00A360 03 CC            [ 1] 3414 	and a,#0x80 
      00A362 97               [ 1] 3415 	ld xl,a 
      00A363 1F CD            [ 2] 3416 	jra 2$
      00A365 9B 09 A1         [ 2] 3417 1$:	ldw x,#app_space 
      0029C6                       3418 2$:
      00A368 84               [ 1] 3419 	clr a 
      00A369 27               [ 4] 3420 	ret 
                                   3421 
                                   3422 
                                   3423 ;---------------------
                                   3424 ; BASIC: USR(addr,arg)
                                   3425 ; execute a function written 
                                   3426 ; in binary code.
                                   3427 ; input:
                                   3428 ;   addr	routine address 
                                   3429 ;   arg 	is an argument
                                   3430 ;           it can be ignore 
                                   3431 ;           by cally. 
                                   3432 ; output:
                                   3433 ;   xstack 	value returned by cally  
                                   3434 ;---------------------
      0029C8                       3435 usr:
      00A36A 03 CC 97         [ 4] 3436 	call func_args 
      00A36D 1F 02            [ 1] 3437 	cp a,#2
      00A36E 27 03            [ 1] 3438 	jreq 1$  
      00A36E 90 F6 93         [ 2] 3439 	jp syntax_error 
      0029D2                       3440 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      0029D2                       3441 	_at_next ; A:X addr 
      00A371 EE 01 72         [ 1]    1     ld a,(3,y)
      00A374 A9               [ 1]    2     ldw x,y 
      00A375 00 03            [ 2]    3     ldw x,(4,x)
      00A377 6B 03 1F         [ 2] 3442 	ldw ptr16,X 
      0029DB                       3443 	_xpop  ; arg 
      00A37A 04 4D            [ 1]    1     ld a,(y)
      00A37C 2A               [ 1]    2     ldw x,y 
      00A37D 0D 7B            [ 2]    3     ldw x,(1,x)
      00A37F 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      0029E4                       3444 	_store_top ; overwrite addr 
      00A383 00 01            [ 1]    1     ld (y),a 
      00A385 A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A388 06 1F 07 19      [ 6] 3445     call [ptr16]
      00A38B 81               [ 4] 3446 	ret 
                                   3447 
                                   3448 
                                   3449 ;------------------------------
                                   3450 ; BASIC: BYE 
                                   3451 ; halt mcu in its lowest power mode 
                                   3452 ; wait for reset or external interrupt
                                   3453 ; do a cold start on wakeup.
                                   3454 ;------------------------------
      0029EE                       3455 bye:
      00A38B CE 00 05 1F 0D   [ 2] 3456 	btjf UART1_SR,#UART_SR_TC,.
      00A390 CE               [10] 3457 	halt
      00A391 00 01 1F         [ 2] 3458 	jp cold_start  
                                   3459 
                                   3460 ;----------------------------------
                                   3461 ; BASIC: SLEEP 
                                   3462 ; halt mcu until reset or external
                                   3463 ; interrupt.
                                   3464 ; Resume progam after SLEEP command
                                   3465 ;----------------------------------
      0029F7                       3466 sleep:
      00A394 0B 72 15 00 23   [ 2] 3467 	btjf UART1_SR,#UART_SR_TC,.
      00A399 72 5C 00 20      [ 1] 3468 	bset flags,#FSLEEP
      00A39D 81               [10] 3469 	halt 
      00A39E 81               [ 4] 3470 	ret 
                                   3471 
                                   3472 ;-------------------------------
                                   3473 ; BASIC: PAUSE expr 
                                   3474 ; suspend execution for n msec.
                                   3475 ; input:
                                   3476 ;	none
                                   3477 ; output:
                                   3478 ;	none 
                                   3479 ;------------------------------
      002A02                       3480 pause:
      00A39E 72 5D 00         [ 4] 3481 	call expression
      00A3A1 20 26            [ 1] 3482 	cp a,#TK_INTGR
      00A3A3 03 CC            [ 1] 3483 	jreq 1$ 
      00A3A5 97 1F 9F         [ 2] 3484 	jp syntax_error
      00A3A7                       3485 1$: _xpop 
      00A3A7 A6 85            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A3A9 CD               [ 1]    2     ldw x,y 
      00A3AA 99 CC            [ 2]    3     ldw x,(1,x)
      00A3AC CD 98 55 13      [ 2]    4     addw y,#CELL_SIZE 
      002A15                       3486 pause02:
      00A3B0 09 27 03         [ 2] 3487 	ldw timer,x 
      00A3B3 CC 97 1F         [ 2] 3488 1$: ldw x,timer 
      00A3B6 5D               [ 2] 3489 	tnzw x 
      00A3B6 CF 00            [ 1] 3490 	jreq 2$
      00A3B8 1A               [10] 3491 	wfi 
      00A3B9 F6 EE            [ 1] 3492 	jrne 1$
      002A21                       3493 2$:	
      00A3BB 01               [ 4] 3494 	ret 
                                   3495 
                                   3496 ;------------------------------
                                   3497 ; BASIC: AWU expr
                                   3498 ; halt mcu for 'expr' milliseconds
                                   3499 ; use Auto wakeup peripheral
                                   3500 ; all oscillators stopped except LSI
                                   3501 ; range: 1ms - 511ms
                                   3502 ; input:
                                   3503 ;  none
                                   3504 ; output:
                                   3505 ;  none:
                                   3506 ;------------------------------
      002A22                       3507 awu:
      00A3BC 72 FB 04         [ 4] 3508   call expression
      00A3BF 19 03            [ 1] 3509   cp a,#TK_INTGR
      00A3C1 72 C7            [ 1] 3510   jreq 1$
      00A3C3 00 1A 72         [ 2] 3511   jp syntax_error
      002A2C                       3512 1$: _xpop 
      00A3C6 5C 00            [ 1]    1     ld a,(y)
      00A3C8 1B               [ 1]    2     ldw x,y 
      00A3C9 72 CF            [ 2]    3     ldw x,(1,x)
      00A3CB 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A35                       3513 awu02:
      00A3CF 0D CF 00         [ 2] 3514   cpw x,#5120
      00A3D2 0E 7B            [ 1] 3515   jrmi 1$ 
      00A3D4 06 1E 07 72      [ 1] 3516   mov AWU_TBR,#15 
      00A3D8 B0 00            [ 1] 3517   ld a,#30
      00A3DA 0E               [ 2] 3518   div x,a
      00A3DB C2 00            [ 1] 3519   ld a,#16
      00A3DD 0D               [ 2] 3520   div x,a 
      00A3DE 18 03            [ 2] 3521   jra 4$
      002A46                       3522 1$: 
      00A3E0 A8 80 2B         [ 2] 3523   cpw x,#2048
      00A3E3 12 20            [ 1] 3524   jrmi 2$ 
      00A3E5 25 7B 03 2A      [ 1] 3525   mov AWU_TBR,#14
      00A3E9 07 C6            [ 1] 3526   ld a,#80
      00A3EB 00               [ 2] 3527   div x,a 
      00A3EC 0F 2F            [ 2] 3528   jra 4$   
      002A54                       3529 2$:
      00A3EE 07 20 1A F2      [ 1] 3530   mov AWU_TBR,#7
      00A3F1                       3531 3$:  
                                   3532 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3F1 72 0E 00         [ 2] 3533   cpw x,#64 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A3F4 0F 15            [ 2] 3534   jrule 4$ 
      00A3F6 72 5C 50 F2      [ 1] 3535   inc AWU_TBR 
      00A3F6 1E               [ 2] 3536   srlw x 
      00A3F7 0D CF            [ 2] 3537   jra 3$ 
      002A64                       3538 4$:
      00A3F9 00               [ 1] 3539   ld a, xl
      00A3FA 05               [ 1] 3540   dec a 
      00A3FB 72 01            [ 1] 3541   jreq 5$
      00A3FD 00               [ 1] 3542   dec a 	
      002A69                       3543 5$: 
      00A3FE 23 05            [ 1] 3544   and a,#0x3e 
      00A400 E6 02 C7         [ 1] 3545   ld AWU_APR,a 
      00A403 00 04 1E 0B      [ 1] 3546   bset AWU_CSR,#AWU_CSR_AWUEN
      00A407 CF               [10] 3547   halt 
                                   3548 
      00A408 00               [ 4] 3549   ret 
                                   3550 
                                   3551 ;------------------------------
                                   3552 ; BASIC: TICKS
                                   3553 ; return msec ticks counter value 
                                   3554 ; input:
                                   3555 ; 	none 
                                   3556 ; output:
                                   3557 ;	X 		TK_INTGR
                                   3558 ;-------------------------------
      002A74                       3559 get_ticks:
      00A409 01 81 0F         [ 1] 3560 	ld a,ticks 
      00A40B CE 00 10         [ 2] 3561 	ldw x,ticks+1 
      00A40B 85               [ 4] 3562 	ret 
                                   3563 
                                   3564 ;------------------------------
                                   3565 ; BASIC: ABS(expr)
                                   3566 ; return absolute value of expr.
                                   3567 ; input:
                                   3568 ;   none
                                   3569 ; output:
                                   3570 ;   xstack    positive int24 
                                   3571 ;-------------------------------
      002A7B                       3572 abs:
      00A40C 5B 0D 72         [ 4] 3573 	call func_args 
      00A40F 5A 00            [ 1] 3574 	cp a,#1 
      00A411 20 FC            [ 1] 3575 	jreq 0$ 
      00A413 CC 16 9F         [ 2] 3576 	jp syntax_error
      002A85                       3577 0$:  
      00A413 CD 98 20         [ 4] 3578 	call abs24 
      002A88                       3579 	_xpop 
      00A416 A1 84            [ 1]    1     ld a,(y)
      00A418 27               [ 1]    2     ldw x,y 
      00A419 07 A1            [ 2]    3     ldw x,(1,x)
      00A41B 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A41F 97               [ 4] 3580 	ret 
                                   3581 
                                   3582 ;------------------------------
                                   3583 ; BASIC: LSHIFT(expr1,expr2)
                                   3584 ; logical shift left expr1 by 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3585 ; expr2 bits 
                                   3586 ; output:
                                   3587 ; 	A 		TK_INTGR
                                   3588 ;   X 		result 
                                   3589 ;------------------------------
      002A92                       3590 lshift:
      00A420 1F 19 59         [ 4] 3591 	call func_args
      00A421 A1 02            [ 1] 3592 	cp a,#2 
      00A421 90 89            [ 1] 3593 	jreq 1$
      00A423 CD 98 5F         [ 2] 3594 	jp syntax_error
      002A9C                       3595 1$: _xpop 
      00A426 4F 90            [ 1]    1     ld a,(y)
      00A428 CE               [ 1]    2     ldw x,y 
      00A429 00 05            [ 2]    3     ldw x,(1,x)
      00A42B 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A42F 13 01            [ 1] 3596     ldw y,x    
      002AA7                       3597 	_at_top  ; T@ 
      00A431 5B 02            [ 1]    1     ld a,(y)
      00A433 25               [ 1]    2     ldw x,y 
      00A434 01 4C            [ 2]    3     ldw x,(1,x)
      00A436 90 5D            [ 2] 3598 	tnzw y 
      00A436 CD 8C            [ 1] 3599 	jreq 4$
      00A438 FB               [ 1] 3600 2$:	rcf 
      00A439 5D               [ 2] 3601 	rlcw x 
      00A43A 26               [ 1] 3602 	rlc a 
      00A43B 05 A6            [ 2] 3603 	decw y 
      00A43D 05 CC            [ 1] 3604 	jrne 2$
      002AB7                       3605 4$: _store_top  ; T! 
      00A43F 97 21            [ 1]    1     ld (y),a 
      00A441 90 85 81         [ 2]    2     ldw (1,y),x     
      00A444 A6 84            [ 1] 3606 	ld a,#TK_INTGR
      00A444 90               [ 4] 3607 	ret
                                   3608 
                                   3609 ;------------------------------
                                   3610 ; BASIC: RSHIFT(expr1,expr2)
                                   3611 ; logical shift right expr1 by 
                                   3612 ; expr2 bits.
                                   3613 ; output:
                                   3614 ; 	A 		TK_INTGR
                                   3615 ;   X 		result 
                                   3616 ;------------------------------
      002ABF                       3617 rshift:
      00A445 89 89 72         [ 4] 3618 	call func_args
      00A448 5F 00            [ 1] 3619 	cp a,#2 
      00A44A 0E 90            [ 1] 3620 	jreq 1$
      00A44C CE 00 1C         [ 2] 3621 	jp syntax_error
      002AC9                       3622 1$: _xpop 
      00A44F 90 E6            [ 1]    1     ld a,(y)
      00A451 03               [ 1]    2     ldw x,y 
      00A452 A1 03            [ 2]    3     ldw x,(1,x)
      00A454 27 15 90 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A458 02 C7            [ 1] 3623     ldw y,x   
      002AD4                       3624 	_at_top  ; T@  
      00A45A 00 0F            [ 1]    1     ld a,(y)
      00A45C 72               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A45D B9 00            [ 2]    3     ldw x,(1,x)
      00A45F 0E 90            [ 2] 3625 	tnzw y 
      00A461 C3 00            [ 1] 3626 	jreq 4$
      00A463 1E               [ 1] 3627 2$:	rcf 
      00A464 25               [ 2] 3628 	rrcw x
      00A465 E9               [ 1] 3629 	rrc a  
      00A466 A6 0A            [ 2] 3630 	decw y 
      00A468 CC 97            [ 1] 3631 	jrne 2$
      002AE4                       3632 4$: _store_top  ; T! 
      00A46A 21 F7            [ 1]    1     ld (y),a 
      00A46B 90 EF 01         [ 2]    2     ldw (1,y),x     
      00A46B 90 89            [ 1] 3633 	ld a,#TK_INTGR
      00A46D 72               [ 4] 3634 	ret
                                   3635 
                                   3636 ;--------------------------
                                   3637 ; BASIC: FCPU integer
                                   3638 ; set CPU frequency 
                                   3639 ;-------------------------- 
                                   3640 
      002AEC                       3641 fcpu:
      00A46E A9 00            [ 1] 3642 	ld a,#TK_INTGR
      00A470 04 1E 03         [ 4] 3643 	call expect 
      00A473 CD 94 6E         [ 4] 3644 	call get_int24 
      00A476 26               [ 1] 3645 	ld a,xl 
      00A477 04 90            [ 1] 3646 	and a,#7 
      00A479 85 20 DA         [ 1] 3647 	ld CLK_CKDIVR,a 
      00A47C 81               [ 4] 3648 	ret 
                                   3649 
                                   3650 ;------------------------------
                                   3651 ; BASIC: PMODE pin#, mode 
                                   3652 ; Arduino pin. 
                                   3653 ; define pin as input or output
                                   3654 ; pin#: {0..15}
                                   3655 ; mode: INPUT|OUTPUT  
                                   3656 ;------------------------------
                           000001  3657 	PINNO=1
                           000001  3658 	VSIZE=1
      002AFB                       3659 pin_mode:
      002AFB                       3660 	_vars VSIZE 
      00A47C 85 5B            [ 2]    1     sub sp,#VSIZE 
      00A47E 02 90 85         [ 4] 3661 	call arg_list 
      00A481 81 02            [ 1] 3662 	cp a,#2 
      00A482 27 03            [ 1] 3663 	jreq 1$
      00A482 72 00 00         [ 2] 3664 	jp syntax_error 
      002B07                       3665 1$: _xpop 
      00A485 23 05            [ 1]    1     ld a,(y)
      00A487 A6               [ 1]    2     ldw x,y 
      00A488 06 CC            [ 2]    3     ldw x,(1,x)
      00A48A 97 21 CD 9B      [ 2]    4     addw y,#CELL_SIZE 
      00A48E 09 A1 84         [ 2] 3666 	ldw ptr16,x ; mode 
      002B13                       3667 	_xpop ; Dx pin 
      00A491 27 03            [ 1]    1     ld a,(y)
      00A493 CC               [ 1]    2     ldw x,y 
      00A494 97 1F            [ 2]    3     ldw x,(1,x)
      00A496 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A49A 01 72 A9         [ 4] 3668 	call select_pin 
      00A49D 00 03            [ 1] 3669 	ld (PINNO,sp),a  
      00A49F 9F 27            [ 1] 3670 	ld a,#1 
      00A4A1 62 88            [ 1] 3671 	tnz (PINNO,sp)
      00A4A3 CD 98            [ 1] 3672 	jreq 4$
      00A4A5 20               [ 1] 3673 2$:	sll a 
      00A4A6 A1 80            [ 1] 3674 	dec (PINNO,sp)
      00A4A8 27 03            [ 1] 3675 	jrne 2$ 
      00A4AA CC 97            [ 1] 3676 	ld (PINNO,sp),a
      00A4AC 1F CD            [ 1] 3677 	ld a,(PINNO,sp)
      00A4AE 98 39            [ 1] 3678 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4B0 A3 A5            [ 1] 3679 	ld (GPIO_CR1,x),a 
      00A4B2 0E 27            [ 1] 3680 4$:	ld a,#OUTP
      00A4B4 08 A3 A5         [ 1] 3681 	cp a,acc8 
      00A4B7 28 27            [ 1] 3682 	jreq 6$
                                   3683 ; input mode
                                   3684 ; disable external interrupt 
      00A4B9 03 CC            [ 1] 3685 	ld a,(PINNO,sp)
      00A4BB 97               [ 1] 3686 	cpl a 
      00A4BC 1F 04            [ 1] 3687 	and a,(GPIO_CR2,x)
      00A4BD E7 04            [ 1] 3688 	ld (GPIO_CR2,x),a 
                                   3689 ;clear bit in DDR for input mode 
      00A4BD 84 89            [ 1] 3690 	ld a,(PINNO,sp)
      00A4BF 88               [ 1] 3691 	cpl a 
      00A4C0 E4 02            [ 1] 3692 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4C0 0A 01            [ 1] 3693 	ld (GPIO_DDR,x),a 
      00A4C2 27 26            [ 2] 3694 	jra 9$
      002B4B                       3695 6$: ;output mode  
      00A4C4 CD 98            [ 1] 3696 	ld a,(PINNO,sp)
      00A4C6 20 A1            [ 1] 3697 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4C8 84 27            [ 1] 3698 	ld (GPIO_DDR,x),a 
      00A4CA 07 A1            [ 1] 3699 	ld a,(PINNO,sp)
      00A4CC 03 27            [ 1] 3700 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4CE 0D CC            [ 1] 3701 	ld (GPIO_CR2,x),a 
      002B57                       3702 9$:	
      002B57                       3703 	_drop VSIZE 
      00A4D0 97 1F            [ 2]    1     addw sp,#VSIZE 
      00A4D2 81               [ 4] 3704 	ret
                                   3705 
                                   3706 ;------------------------
                                   3707 ; select Arduino pin 
                                   3708 ; input:
                                   3709 ;   X 	 {0..15} Arduino Dx 
                                   3710 ; output:
                                   3711 ;   A     stm8s208 pin 
                                   3712 ;   X     base address s208 GPIO port 
                                   3713 ;---------------------------
      002B5A                       3714 select_pin:
      00A4D2 C6               [ 2] 3715 	sllw x 
      00A4D3 00 02 AB         [ 2] 3716 	addw x,#arduino_to_8s208 
      00A4D6 03               [ 2] 3717 	ldw x,(x)
      00A4D7 C7               [ 1] 3718 	ld a,xl 
      00A4D8 00               [ 1] 3719 	push a 
      00A4D9 02               [ 1] 3720 	swapw x 
      00A4DA 20 03            [ 1] 3721 	ld a,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4DC CD               [ 4] 3722 	mul x,a 
      00A4DD 98 46 00         [ 2] 3723 	addw x,#GPIO_BASE 
      00A4DF 84               [ 1] 3724 	pop a 
      00A4DF CD               [ 4] 3725 	ret 
                                   3726 ; translation from Arduino D0..D15 to stm8s208rb 
      002B6A                       3727 arduino_to_8s208:
      00A4E0 98 20                 3728 .byte 3,6 ; D0 
      00A4E2 A1 08                 3729 .byte 3,5 ; D1 
      00A4E4 27 DA                 3730 .byte 4,0 ; D2 
      00A4E6 5B 03                 3731 .byte 2,1 ; D3
      00A4E8 20 1A                 3732 .byte 6,0 ; D4
      00A4EA 02 02                 3733 .byte 2,2 ; D5
      00A4EA 5B 01                 3734 .byte 2,3 ; D6
      00A4EC CD A4                 3735 .byte 3,1 ; D7
      00A4EE 13 CF                 3736 .byte 3,3 ; D8
      00A4F0 00 1A                 3737 .byte 2,4 ; D9
      00A4F2 55 00                 3738 .byte 4,5 ; D10
      00A4F4 04 00                 3739 .byte 2,6 ; D11
      00A4F6 02 85                 3740 .byte 2,7 ; D12
      00A4F8 A3 A5                 3741 .byte 2,5 ; D13
      00A4FA 0E 26                 3742 .byte 4,2 ; D14
      00A4FC 05 CE                 3743 .byte 4,1 ; D15
                                   3744 
                                   3745 
                                   3746 ;------------------------------
                                   3747 ; BASIC: RND(expr)
                                   3748 ; return random number 
                                   3749 ; between 1 and expr inclusive
                                   3750 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3751 ; input:
                                   3752 ; 	none 
                                   3753 ; output:
                                   3754 ;	xstack 	random positive integer 
                                   3755 ;------------------------------
      002B8A                       3756 random:
      00A4FE 00 1A 20         [ 4] 3757 	call func_args 
      00A501 19 01            [ 1] 3758 	cp a,#1
      00A502 27 03            [ 1] 3759 	jreq 1$
      00A502 20 35 9F         [ 2] 3760 	jp syntax_error
      00A504                       3761 1$:  
      002B94                       3762 	_xpop   
      00A504 55 00            [ 1]    1     ld a,(y)
      00A506 04               [ 1]    2     ldw x,y 
      00A507 00 02            [ 2]    3     ldw x,(1,x)
      00A509 5B 02 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A50D D2               [ 2] 3763 	pushw x 
      00A50E 88               [ 1] 3764 	push a  
      00A50E 72 00            [ 1] 3765 	ld a,#0x80 
      00A510 00 23            [ 1] 3766 	bcp a,(1,sp)
      00A512 05 A6            [ 1] 3767 	jreq 2$
      00A514 06 CC            [ 1] 3768 	ld a,#ERR_BAD_VALUE
      00A516 97 21 A1         [ 2] 3769 	jp tb_error
      00A518                       3770 2$: 
                                   3771 ; acc16=(x<<5)^x 
      00A518 CD A4 13         [ 2] 3772 	ldw x,seedx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A51B 58               [ 2] 3773 	sllw x 
      00A51B CF               [ 2] 3774 	sllw x 
      00A51C 00               [ 2] 3775 	sllw x 
      00A51D 05               [ 2] 3776 	sllw x 
      00A51E E6               [ 2] 3777 	sllw x 
      00A51F 02               [ 1] 3778 	ld a,xh 
      00A520 C7 00 04         [ 1] 3779 	xor a,seedx 
      00A523 35 03 00         [ 1] 3780 	ld acc16,a 
      00A526 02               [ 1] 3781 	ld a,xl 
      00A527 81 00 15         [ 1] 3782 	xor a,seedx+1 
      00A528 C7 00 0E         [ 1] 3783 	ld acc8,a 
                                   3784 ; seedx=seedy 
      00A528 72 00 00         [ 2] 3785 	ldw x,seedy 
      00A52B 23 06 A6         [ 2] 3786 	ldw seedx,x  
                                   3787 ; seedy=seedy^(seedy>>1)
      00A52E 06 CC 97         [ 2] 3788 	ldw x,seedy 
      00A531 21               [ 2] 3789 	srlw x 
      00A532 81               [ 1] 3790 	ld a,xh 
      00A533 C8 00 16         [ 1] 3791 	xor a,seedy 
      00A533 CD A4 13         [ 1] 3792 	ld seedy,a  
      00A536 CF               [ 1] 3793 	ld a,xl 
      00A537 00 1A 17         [ 1] 3794 	xor a,seedy+1 
      00A539 C7 00 17         [ 1] 3795 	ld seedy+1,a 
                                   3796 ; acc16>>3 
      00A539 85 52 04         [ 2] 3797 	ldw x,acc16 
      00A53C 89               [ 2] 3798 	srlw x 
      00A53D CE               [ 2] 3799 	srlw x 
      00A53E 00               [ 2] 3800 	srlw x 
                                   3801 ; x=acc16^x 
      00A53F 1A               [ 1] 3802 	ld a,xh 
      00A540 89 CE 00         [ 1] 3803 	xor a,acc16 
      00A543 05 1F 05         [ 1] 3804 	ld acc16,a 
      00A546 CE               [ 1] 3805 	ld a,xl 
      00A547 00 01 1F         [ 1] 3806 	xor a,acc8 
      00A54A 07 85 20         [ 1] 3807 	ld acc8,a 
                                   3808 ; seedy=acc16^seedy 
      00A54D CD 00 17         [ 1] 3809 	xor a,seedy+1
      00A54E 97               [ 1] 3810 	ld xl,a 
      00A54E 72 00 00         [ 1] 3811 	ld a,acc16 
      00A551 23 05 A6         [ 1] 3812 	xor a,seedy
      00A554 06               [ 1] 3813 	ld xh,a 
      00A555 CC 97 21         [ 2] 3814 	ldw seedy,x 
                                   3815 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A558 C6 00 15         [ 1] 3816 	ld a,seedx+1
      00A558 1E 03            [ 1] 3817 	and a,#127
      002BFF                       3818 	_xpush 
      00A55A CF 00 05 E6      [ 2]    1     subw y,#CELL_SIZE
      00A55E 02 C7            [ 1]    2     ld (y),a 
      00A560 00 04 1E         [ 2]    3     ldw (1,y),x 
      00A563 05               [ 1] 3819 	pop a 
      00A564 CF               [ 2] 3820 	popw x 
      002C0A                       3821 	_xpush 
      00A565 00 01 85 5B      [ 2]    1     subw y,#CELL_SIZE
      00A569 04 89            [ 1]    2     ld (y),a 
      00A56B 81 EF 01         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A56C CD 03 D2         [ 4] 3822 	call mod24 
      002C16                       3823 	_xpop
      00A56C 72 01            [ 1]    1     ld a,(y)
      00A56E 00               [ 1]    2     ldw x,y 
      00A56F 23 02            [ 2]    3     ldw x,(1,x)
      00A571 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A573 1C 00 01         [ 2] 3824 	addw x,#1 
      00A573 72 09            [ 1] 3825 	adc a,#0  
      00A575 00               [ 4] 3826 	ret 
                                   3827 
                                   3828 ;---------------------------------
                                   3829 ; BASIC: WORDS 
                                   3830 ; affiche la listes des mots du
                                   3831 ; dictionnaire ainsi que le nombre
                                   3832 ; de mots.
                                   3833 ;---------------------------------
                           000001  3834 	WLEN=1 ; word length
                           000002  3835 	LLEN=2 ; character sent to console
                           000003  3836 	WCNT=3 ; count words printed 
                           000003  3837 	VSIZE=3 
      002C25                       3838 words:
      00A576 23 12            [ 2] 3839 	pushw y
      002C27                       3840 	_vars VSIZE
      00A578 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A57A CD A1            [ 1] 3841 	clr (LLEN,sp)
      00A57C 03 5B            [ 1] 3842 	clr (WCNT,sp)
      00A57E 04 72 19 00      [ 2] 3843 	ldw y,#kword_dict+2
      00A582 23               [ 1] 3844 0$:	ldw x,y
      00A583 72               [ 1] 3845 	ld a,(x)
      00A584 10 00            [ 1] 3846 	and a,#15 
      00A586 23 CC            [ 1] 3847 	ld (WLEN,sp),a 
      00A588 97 CA            [ 1] 3848 	inc (WCNT,sp)
      00A58A CE               [ 1] 3849 1$:	incw x 
      00A58B 00               [ 1] 3850 	ld a,(x)
      00A58C 1C C3 00         [ 4] 3851 	call putc 
      00A58F 1E 2B            [ 1] 3852 	inc (LLEN,sp)
      00A591 0C AE            [ 1] 3853 	dec (WLEN,sp)
      00A593 96 AE            [ 1] 3854 	jrne 1$
      00A595 CD 8A            [ 1] 3855 	ld a,#70
      00A597 1E 55            [ 1] 3856 	cp a,(LLEN,sp)
      00A599 00 04            [ 1] 3857 	jrmi 2$   
      00A59B 00 02            [ 1] 3858 	ld a,#SPACE 
      00A59D 81 09 41         [ 4] 3859 	call putc 
      00A59E 0C 02            [ 1] 3860 	inc (LLEN,sp) 
      00A59E 5B 02            [ 2] 3861 	jra 3$
      00A5A0 A6 0D            [ 1] 3862 2$: ld a,#CR 
      00A5A0 CD 9C E9         [ 4] 3863 	call putc 
      00A5A3 CD 94            [ 1] 3864 	clr (LLEN,sp)
      00A5A5 D3 5F CF 00      [ 2] 3865 3$:	subw y,#2 
      00A5A9 07 72            [ 2] 3866 	ldw y,(y)
      00A5AB 5F 00            [ 1] 3867 	jrne 0$ 
      00A5AD 09 72            [ 1] 3868 	ld a,#CR 
      00A5AF 5F 00 0A         [ 4] 3869 	call putc  
      00A5B2 CE               [ 1] 3870 	clrw x 
      00A5B3 00 1C            [ 1] 3871 	ld a,(WCNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A5B5 CF               [ 1] 3872 	ld xl,a 
      00A5B6 00 05 E6         [ 4] 3873 	call prt_i16 
      00A5B9 02 C7 00         [ 2] 3874 	ldw x,#words_count_msg
      00A5BC 04 35 03         [ 4] 3875 	call puts 
      002C74                       3876 	_drop VSIZE 
      00A5BF 00 02            [ 2]    1     addw sp,#VSIZE 
      00A5C1 72 10            [ 2] 3877 	popw y 
      00A5C3 00               [ 4] 3878 	ret 
      00A5C4 23 CC 97 CA 64 73 20  3879 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3880 
                                   3881 
                                   3882 ;-----------------------------
                                   3883 ; BASIC: TIMER expr 
                                   3884 ; initialize count down timer 
                                   3885 ;-----------------------------
      00A5C8                       3886 set_timer:
      00A5C8 AE 17 FF         [ 4] 3887 	call arg_list
      00A5CB 94 CC            [ 1] 3888 	cp a,#1 
      00A5CD 97 AB            [ 1] 3889 	jreq 1$
      00A5CF CC 16 9F         [ 2] 3890 	jp syntax_error
      002C99                       3891 1$: 
      002C99                       3892 	_xpop  
      00A5CF CD 98            [ 1]    1     ld a,(y)
      00A5D1 20               [ 1]    2     ldw x,y 
      00A5D2 A1 85            [ 2]    3     ldw x,(1,x)
      00A5D4 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A5D8 1F CD 98         [ 2] 3893 	ldw timer,x 
      00A5DB 55               [ 4] 3894 	ret 
                                   3895 
                                   3896 ;------------------------------
                                   3897 ; BASIC: TIMEOUT 
                                   3898 ; return state of timer 
                                   3899 ; output:
                                   3900 ;   A:X     0 not timeout 
                                   3901 ;   A:X     -1 timeout 
                                   3902 ;------------------------------
      002CA6                       3903 timeout:
      00A5DC CF               [ 1] 3904 	clr a 
      00A5DD 00 1A CD         [ 2] 3905 	ldw x,timer 
      00A5E0 89 CA            [ 1] 3906 	jreq 1$
      00A5E2 27               [ 1] 3907 	clrw x
      00A5E3 03               [ 4] 3908 	ret  
      00A5E4 CD               [ 1] 3909 1$:	cpl a
      00A5E5 89               [ 2] 3910 	cplw x 
      00A5E6 D1               [ 4] 3911 	ret 
                                   3912  	
                                   3913 
                                   3914 
                                   3915 
                                   3916 ;-----------------------------------
                                   3917 ; BASIC: IWDGEN expr1 
                                   3918 ; enable independant watchdog timer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3919 ; expr1 is delay in multiple of 62.5µsec
                                   3920 ; expr1 -> {1..16383}
                                   3921 ;-----------------------------------
      002CB1                       3922 enable_iwdg:
      00A5E7 72 3F 00         [ 4] 3923 	call arg_list
      00A5EA 1A 72            [ 1] 3924 	cp a,#1 
      00A5EC 5C 00            [ 1] 3925 	jreq 1$
      00A5EE 1B 72 3F         [ 2] 3926 	jp syntax_error 
      002CBB                       3927 1$: _xpop  
      00A5F1 00 1A            [ 1]    1     ld a,(y)
      00A5F3 72               [ 1]    2     ldw x,y 
      00A5F4 5C 00            [ 2]    3     ldw x,(1,x)
      00A5F6 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5FA 1A 81            [ 1] 3928 	push #0
      00A5FC 35 CC 50 E0      [ 1] 3929 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A5FC 90               [ 1] 3930 	ld a,xh 
      00A5FD 89 AE            [ 1] 3931 	and a,#0x3f
      00A5FF 00               [ 1] 3932 	ld xh,a  
      00A600 64 90 AE         [ 2] 3933 2$:	cpw x,#255
      00A603 03 E8            [ 2] 3934 	jrule 3$
      00A605 20 22            [ 1] 3935 	inc (1,sp)
      00A607 98               [ 1] 3936 	rcf 
      00A607 90               [ 2] 3937 	rrcw x 
      00A608 89 CD            [ 2] 3938 	jra 2$
      00A60A 99 DE A1 02      [ 1] 3939 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A60E 27               [ 1] 3940 	pop a  
      00A60F 03 CC 97         [ 1] 3941 	ld IWDG_PR,a 
      00A612 1F               [ 1] 3942 	ld a,xl
      00A613 4A               [ 1] 3943 	dec a 
      00A613 90 F6 93 EE      [ 1] 3944 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A617 01 72 A9         [ 1] 3945 	ld IWDG_RLR,a 
      00A61A 00 03 89 90      [ 1] 3946 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A61E F6               [ 4] 3947 	ret 
                                   3948 
                                   3949 
                                   3950 ;-----------------------------------
                                   3951 ; BASIC: IWDGREF  
                                   3952 ; refresh independant watchdog count down 
                                   3953 ; timer before it reset MCU. 
                                   3954 ;-----------------------------------
      002CEF                       3955 refresh_iwdg:
      00A61F 93 EE 01 72      [ 1] 3956 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A623 A9               [ 4] 3957 	ret 
                                   3958 
                                   3959 
                                   3960 ;-------------------------------------
                                   3961 ; BASIC: LOG2(expr)
                                   3962 ; return logarithm base 2 of expr 
                                   3963 ; this is the position of most significant
                                   3964 ; bit set. 
                                   3965 ; input: 
                                   3966 ; output:
                                   3967 ;   A     TK_INTGR 
                                   3968 ;   xstack log2 
                                   3969 ;*********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      002CF4                       3970 log2:
      00A624 00 03 90         [ 4] 3971 	call func_args 
      00A627 93 85            [ 1] 3972 	cp a,#1 
      00A629 27 03            [ 1] 3973 	jreq 1$
      00A629 89 AE F4         [ 2] 3974 	jp syntax_error 
      002CFE                       3975 1$: 
      002CFE                       3976 	_xpop    
      00A62C 24 65            [ 1]    1     ld a,(y)
      00A62E 90               [ 1]    2     ldw x,y 
      00A62F A3 7A            [ 2]    3     ldw x,(1,x)
      00A631 12 2B 01 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A635 4D               [ 1] 3977 	tnz a
      00A635 9E C7            [ 1] 3978 	jrne 2$ 
      00A637 53               [ 2] 3979 	tnzw x 
      00A638 0D 9F            [ 1] 3980 	jrne 2$
      00A63A C7 53            [ 1] 3981 	ld a,#ERR_BAD_VALUE
      00A63C 0E 8C 56         [ 2] 3982 	jp tb_error 
      00A63F 9E C7            [ 1] 3983 2$: push #24 
      00A641 53               [ 2] 3984 3$: rlcw x 
      00A642 0F               [ 1] 3985     rlc a 
      00A643 9F C7            [ 1] 3986 	jrc 4$
      00A645 53 10            [ 1] 3987 	dec (1,sp) 
      00A647 72 10            [ 1] 3988 	jrne 3$
      00A649 53               [ 1] 3989 4$: clrw x 
      00A64A 08               [ 1] 3990     pop a 
      00A64B 72               [ 1] 3991 	dec a
      00A64C 10               [ 1] 3992 	rlwa x  
      002D20                       3993 9$:	
      00A64D 53               [ 4] 3994 	ret 
                                   3995 
                                   3996 ;-----------------------------------
                                   3997 ; BASIC: BIT(expr) 
                                   3998 ; expr ->{0..23}
                                   3999 ; return 2^expr 
                                   4000 ; output:
                                   4001 ;    A:X    2^expr 
                                   4002 ;-----------------------------------
      002D21                       4003 bitmask:
      00A64E 00 72 10         [ 4] 4004     call func_args 
      00A651 53 04            [ 1] 4005 	cp a,#1
      00A653 85 CD            [ 1] 4006 	jreq 1$
      00A655 AA 95 72         [ 2] 4007 	jp syntax_error 
      002D2B                       4008 1$: _xpop 
      00A658 11 53            [ 1]    1     ld a,(y)
      00A65A 08               [ 1]    2     ldw x,y 
      00A65B 72 11            [ 2]    3     ldw x,(1,x)
      00A65D 53 00 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00A661 81               [ 1] 4009 	ld a,xl 
      00A662 AE 00 01         [ 2] 4010 	ldw x,#1 
      00A662 CD 99            [ 1] 4011 	and a,#23
      00A664 DE A1            [ 1] 4012 	jreq 9$
      00A666 02               [ 1] 4013 	push a 
      00A667 27               [ 1] 4014 	clr a 
      002D3E                       4015 2$: 
      00A668 12               [ 2] 4016 	slaw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A669 A1               [ 1] 4017 	rlc a 	
      00A66A 01 27            [ 1] 4018 	dec (1,sp)
      00A66C 03 CC            [ 1] 4019 	jrne 2$ 
      002D44                       4020 4$:
      002D44                       4021     _drop 1 
      00A66E 97 1F            [ 2]    1     addw sp,#1 
      00A670 4F               [ 4] 4022 9$:	ret 
                                   4023 
                                   4024 ;------------------------------
                                   4025 ; BASIC: DO 
                                   4026 ; initiate a DO ... UNTIL loop 
                                   4027 ;------------------------------
                           000003  4028 	DOLP_ADR=3 
                           000005  4029 	DOLP_INW=5
                           000004  4030 	VSIZE=4 
      002D47                       4031 do_loop:
      00A671 5F               [ 2] 4032 	popw x 
      002D48                       4033 	_vars VSIZE 
      00A672 72 A2            [ 2]    1     sub sp,#VSIZE 
      00A674 00               [ 2] 4034 	pushw x 
      00A675 03 90 F7         [ 2] 4035 	ldw x,basicptr 
      00A678 90 EF            [ 2] 4036 	ldw (DOLP_ADR,sp),x
      00A67A 01 90 E6         [ 2] 4037 	ldw x,in.w 
      00A67D 03 93            [ 2] 4038 	ldw (DOLP_INW,sp),x
      00A67F EE 04 5D 27      [ 1] 4039 	inc loop_depth 
      00A683 25               [ 4] 4040 	ret 
                                   4041 
                                   4042 ;--------------------------------
                                   4043 ; BASIC: UNTIL expr 
                                   4044 ; loop if exprssion is false 
                                   4045 ; else terminate loop
                                   4046 ;--------------------------------
      002D5A                       4047 until: 
      00A684 90 F6 93 EE      [ 1] 4048 	tnz loop_depth 
      00A688 01 72            [ 1] 4049 	jrne 1$ 
      00A68A A9 00 03         [ 2] 4050 	jp syntax_error 
      002D63                       4051 1$: 
      00A68D 72 A9 00         [ 4] 4052 	call condition  
      002D66                       4053 	_xpop 
      00A690 03 9F            [ 1]    1     ld a,(y)
      00A692 A4               [ 1]    2     ldw x,y 
      00A693 07 4E            [ 2]    3     ldw x,(1,x)
      00A695 C7 54 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A699 16               [ 1] 4054 	tnz a 
      00A69A 50 CA            [ 1] 4055 	jrne 9$ 
      00A69C 72               [ 2] 4056 	tnzw x 
      00A69D 10 54            [ 1] 4057 	jrne 9$ 
      00A69F 01 AE            [ 2] 4058 	ldw x,(DOLP_ADR,sp)
      00A6A1 00 1B 5A         [ 2] 4059 	ldw basicptr,x 
      00A6A4 9D 26            [ 1] 4060 	ld a,(2,x)
      00A6A6 FA 20 08         [ 1] 4061 	ld count,a 
      00A6A9 72 11            [ 2] 4062 	ldw x,(DOLP_INW,sp)
      00A6AB 54 01 72         [ 2] 4063 	ldw in.w,x 
      00A6AE 17               [ 4] 4064 	ret 
      002D85                       4065 9$:	; remove loop data from stack  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A6AF 50               [ 2] 4066 	popw x
      002D86                       4067 	_drop VSIZE
      00A6B0 CA 04            [ 2]    1     addw sp,#VSIZE 
      00A6B1 72 5A 00 1F      [ 1] 4068 	dec loop_depth 
      00A6B1 81               [ 2] 4069 	jp (x)
                                   4070 
                                   4071 ;--------------------------
                                   4072 ; BASIC: PORTA...PORTI  
                                   4073 ;  return constant value 
                                   4074 ;  PORT  base address 
                                   4075 ;---------------------------
      00A6B2                       4076 const_porta:
      00A6B2 CD 99 D9         [ 2] 4077 	ldw x,#PA_BASE 
      00A6B5 A1               [ 1] 4078 	clr a 
      00A6B6 01               [ 4] 4079 	ret 
      002D92                       4080 const_portb:
      00A6B7 27 03 CC         [ 2] 4081 	ldw x,#PB_BASE 
      00A6BA 97               [ 1] 4082 	clr a 
      00A6BB 1F               [ 4] 4083 	ret 
      002D97                       4084 const_portc:
      00A6BC 90 F6 93         [ 2] 4085 	ldw x,#PC_BASE 
      00A6BF EE               [ 1] 4086 	clr a 
      00A6C0 01               [ 4] 4087 	ret 
      002D9C                       4088 const_portd:
      00A6C1 72 A9 00         [ 2] 4089 	ldw x,#PD_BASE 
      00A6C4 03               [ 1] 4090 	clr a 
      00A6C5 A3               [ 4] 4091 	ret 
      002DA1                       4092 const_porte:
      00A6C6 00 05 23         [ 2] 4093 	ldw x,#PE_BASE 
      00A6C9 05               [ 1] 4094 	clr a 
      00A6CA A6               [ 4] 4095 	ret 
      002DA6                       4096 const_portf:
      00A6CB 0A CC 97         [ 2] 4097 	ldw x,#PF_BASE 
      00A6CE 21               [ 1] 4098 	clr a 
      00A6CF 9F               [ 4] 4099 	ret 
      002DAB                       4100 const_portg:
      00A6D0 C7 00 0F         [ 2] 4101 	ldw x,#PG_BASE 
      00A6D3 A6               [ 1] 4102 	clr a 
      00A6D4 05               [ 4] 4103 	ret 
      002DB0                       4104 const_porth:
      00A6D5 C0 00 0F         [ 2] 4105 	ldw x,#PH_BASE 
      00A6D8 C7               [ 1] 4106 	clr a 
      00A6D9 54               [ 4] 4107 	ret 
      002DB5                       4108 const_porti:
      00A6DA 00 72 16         [ 2] 4109 	ldw x,#PI_BASE 
      00A6DD 54               [ 1] 4110 	clr a 
      00A6DE 02               [ 4] 4111 	ret 
                                   4112 
                                   4113 ;-------------------------------
                                   4114 ; following return constant 
                                   4115 ; related to GPIO register offset 
                                   4116 ;---------------------------------
      002DBA                       4117 const_odr:
      00A6DF 72               [ 1] 4118 	clr a 
      00A6E0 10 54 01         [ 2] 4119 	ldw x,#GPIO_ODR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A6E3 72               [ 4] 4120 	ret 
      002DBF                       4121 const_idr:
      00A6E4 0F               [ 1] 4122 	clr a 
      00A6E5 54 00 FB         [ 2] 4123 	ldw x,#GPIO_IDR
      00A6E8 CE               [ 4] 4124 	ret 
      002DC4                       4125 const_ddr:
      00A6E9 54               [ 1] 4126 	clr a
      00A6EA 04 A6 84         [ 2] 4127 	ldw x,#GPIO_DDR
      00A6ED 81               [ 4] 4128 	ret 
      00A6EE                       4129 const_cr1:
      00A6EE 52               [ 1] 4130 	clr a 
      00A6EF 01 CD 99         [ 2] 4131 	ldw x,#GPIO_CR1
      00A6F2 D9               [ 4] 4132 	ret 
      002DCE                       4133 const_cr2:
      00A6F3 A1               [ 1] 4134 	clr a
      00A6F4 01 27 03         [ 2] 4135 	ldw x,#GPIO_CR2
      00A6F7 CC               [ 4] 4136 	ret 
                                   4137 ;-------------------------
                                   4138 ; BASIC: POUT 
                                   4139 ;  constant for port mode
                                   4140 ;  used by PMODE 
                                   4141 ;  to set pin as output
                                   4142 ;------------------------
      002DD3                       4143 const_output:
      00A6F8 97               [ 1] 4144 	clr a 
      00A6F9 1F 90 F6         [ 2] 4145 	ldw x,#OUTP
      00A6FC 93               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;-------------------------
                                   4149 ; BASIC: PINP 
                                   4150 ;  constant for port mode
                                   4151 ;  used by PMODE 
                                   4152 ;  to set pin as input
                                   4153 ;------------------------
      002DD8                       4154 const_input:
      00A6FD EE               [ 1] 4155 	clr a  
      00A6FE 01 72 A9         [ 2] 4156 	ldw x,#INP 
      00A701 00               [ 4] 4157 	ret 
                                   4158 	
                                   4159 ;-----------------------
                                   4160 ; memory area constants
                                   4161 ;-----------------------
      002DDD                       4162 const_eeprom_base:
      00A702 03               [ 1] 4163 	clr a  
      00A703 A3 00 0F         [ 2] 4164 	ldw x,#EEPROM_BASE 
      00A706 23               [ 4] 4165 	ret 
                                   4166 
                                   4167 ;---------------------------
                                   4168 ; BASIC: DATA 
                                   4169 ; when the interpreter find 
                                   4170 ; a DATA line it skip it.
                                   4171 ;---------------------------
      002DE2                       4172 data:
      00A707 05 A6 0A CC 97   [ 1] 4173 	mov in,count 
      00A70C 21               [ 4] 4174 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4175 
                                   4176 ;------------------------------
                                   4177 ; check if it is a DATA line 
                                   4178 ; input: 
                                   4179 ;    X    line address 
                                   4180 ; output:
                                   4181 ;    Z    set if DATA line 
                                   4182 ;----------------------------
      002DE8                       4183 is_data_line:
      00A70D CD               [ 2] 4184 	pushw x 
      00A70E AB DA            [ 1] 4185 	ld a,(3,x)
      00A710 6B 01            [ 1] 4186 	cp a,#TK_CMD 
      00A712 E6 01            [ 1] 4187 	jrne 9$
      00A714 0D 01            [ 2] 4188 	ldw x,(4,x)
      00A716 27 05 44         [ 2] 4189 	cpw x,#DATA_IDX  
      00A719 0A               [ 2] 4190 9$: popw x 
      00A71A 01               [ 4] 4191 	ret 
                                   4192 
                                   4193 ;---------------------------------
                                   4194 ; BASIC: RESTORE [line#]
                                   4195 ; set data_ptr to first data line
                                   4196 ; if no DATA found pointer set to
                                   4197 ; zero.
                                   4198 ; if a line# is given as argument 
                                   4199 ; a data line with that number 
                                   4200 ; is searched and the data pointer 
                                   4201 ; is set to it. If there is no 
                                   4202 ; data line with that number 
                                   4203 ; the program is interrupted. 
                                   4204 ;---------------------------------
      002DF6                       4205 restore:
      00A71B 26               [ 1] 4206 	clrw x 
      00A71C FB A4 01         [ 2] 4207 	ldw data_ptr,x 
      00A71F 5F 97 4F         [ 2] 4208 	ldw data_ofs,x 
      00A722 5B 01 81         [ 2] 4209 	ldw x,txtbgn 
      00A725 CD 17 A0         [ 4] 4210 	call next_token 
      00A725 52 02            [ 1] 4211 	cp a,#TK_INTGR
      00A727 CD 99            [ 1] 4212 	jrne 0$
      00A729 DE A1 02         [ 4] 4213 	call get_int24
      00A72C 27 03            [ 2] 4214 	pushw y 
      00A72E CC               [ 1] 4215 	clr a 
      00A72F 97 1F 90         [ 4] 4216 	call search_lineno  
      00A732 F6 93            [ 2] 4217 	popw y 
      00A734 EE               [ 2] 4218 	tnzw x 
      00A735 01 72            [ 1] 4219 	jrne set_data_pointer 
      00A737 A9 00            [ 2] 4220 	jra data_error 
      002E17                       4221 0$:
      002E17                       4222 	_unget_token  
      00A739 03 9F 6B 02 90   [ 1]    1      mov in,in.saved  
                                   4223 ; search first DATA line 	
      00A73E F6 93 EE         [ 2] 4224 1$:	cpw x,txtend
      00A741 01 72            [ 1] 4225 	jruge data_error 
      002E21                       4226 2$:	
      00A743 A9 00 03         [ 4] 4227 	call is_data_line 
      00A746 A3 00            [ 1] 4228 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A748 0F 23 05         [ 4] 4229 4$:	call try_next_line 
      00A74B A6 0A            [ 1] 4230 	jrne 4$ 
      00A74D CC               [ 4] 4231 	ret 
                                   4232 
                                   4233 ;---------------------
                                   4234 ; set data pointer 
                                   4235 ; variables at new line 
                                   4236 ; input:
                                   4237 ;    X    line address 
                                   4238 ;----------------------
      002E2C                       4239 set_data_pointer:
      00A74E 97 21 CD         [ 2] 4240 	ldw data_ptr,x
      00A751 AB DA            [ 1] 4241 	ld a,(2,x)
      00A753 6B 01 A6         [ 1] 4242 	ld data_len,a 
      00A756 01 0D 01 27      [ 1] 4243 	mov data_ofs,#FIRST_DATA_ITEM
      00A75A 05               [ 4] 4244 	ret 
                                   4245 
                                   4246 
                                   4247 ;--------------------
                                   4248 ; at end of data line 
                                   4249 ; check if next line 
                                   4250 ; is a data line 
                                   4251 ; input:
                                   4252 ;    X   actual line address 
                                   4253 ;  
                                   4254 ;-------------------
      002E39                       4255 try_next_line: 
      00A75B 48 0A            [ 1] 4256 	ld a,(2,x)
      00A75D 01 26 FB         [ 1] 4257 	ld acc8,a 
      00A760 0D 02 26 05      [ 1] 4258 	clr acc16 
      00A764 43 E4 00 20      [ 2] 4259 	addw x,acc16 
      00A768 02 EA 00         [ 2] 4260 	cpw x,txtend 
      00A76B E7 00            [ 1] 4261 	jrult 1$
      00A76D 5B 02            [ 2] 4262 	jra data_error 
      002E4D                       4263 1$:	
      00A76F 81 2D E8         [ 4] 4264 	call is_data_line 
      00A770 27 04            [ 1] 4265 	jreq 2$
      00A770 72 00            [ 1] 4266 	ld a,#1  
      00A772 00 23            [ 2] 4267 	jra 9$
      00A774 02 4F 81         [ 4] 4268 2$:	call set_data_pointer
      00A777 4F               [ 1] 4269 	clr a  
      00A777 AE               [ 4] 4270 9$:	ret 
      002E5B                       4271 data_error:	
      00A778 A7 9E            [ 1] 4272     ld a,#ERR_NO_DATA 
      00A77A CD 8A 1E         [ 2] 4273 	jp tb_error 
                                   4274 
                                   4275 
                                   4276 ;---------------------------------
                                   4277 ; BASIC: READ 
                                   4278 ; return next data item | 0 
                                   4279 ;---------------------------------
                           000001  4280 	CTX_BPTR=1 
                           000003  4281 	CTX_IN=3 
                           000004  4282 	CTX_COUNT=4 
                           000005  4283 	INT24=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                           000007  4284 	VSIZE=7 
      002E60                       4285 read:
      002E60                       4286 	_vars  VSIZE 
      00A77D 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A77F 52 04 CD         [ 4] 4287 	call save_context
      002E65                       4288 read01:	
      00A782 A0 F3 AE         [ 1] 4289 	ld a,data_ofs
      00A785 16 68 CF         [ 1] 4290 	cp a,data_len 
      00A788 00 05            [ 1] 4291 	jreq 2$ ; end of line  
      002E6D                       4292 0$:
      00A78A 7F 72 5F         [ 2] 4293 	ldw x,data_ptr 
      00A78D 00 04 5F         [ 2] 4294 	ldw basicptr,x 
      00A790 CF 00 01 72 11   [ 1] 4295 	mov in,data_ofs 
      00A795 00 23 72 18 00   [ 1] 4296 	mov count,data_len  
      00A79A 23 CC 97         [ 4] 4297 	call expression 
      00A79D CA 0A            [ 1] 4298 	cp a,#TK_INTGR 
      00A79F 62 72            [ 1] 4299 	jreq 1$ 
      00A7A1 65 61 6B         [ 2] 4300 	jp syntax_error 
      002E87                       4301 1$:
      00A7A4 20 70 6F         [ 4] 4302 	call next_token ; skip comma
      00A7A7 69 6E 74         [ 2] 4303 	ldw x,basicptr 
      00A7AA 2C 20 52         [ 2] 4304 	ldw data_ptr,x 
      00A7AD 55 4E 20 74 6F   [ 1] 4305 	mov data_ofs,in 
      00A7B2 20 72 65         [ 4] 4306 	call rest_context
      002E98                       4307 	_xpop 
      00A7B5 73 75            [ 1]    1     ld a,(y)
      00A7B7 6D               [ 1]    2     ldw x,y 
      00A7B8 65 2E            [ 2]    3     ldw x,(1,x)
      00A7BA 0A 00 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A7BC                       4308 	_drop VSIZE 
      00A7BC 72 01            [ 2]    1     addw sp,#VSIZE 
      00A7BE 00               [ 4] 4309 	ret 
      002EA4                       4310 2$: ; end of line reached 
                                   4311 	; try next line 
      00A7BF 23 01 81         [ 2] 4312 	ldw x,data_ptr  
      00A7C2 CD 2E 39         [ 4] 4313 	call try_next_line
      00A7C2 CD 95            [ 1] 4314 	jreq 0$ 
      00A7C4 7B 81            [ 2] 4315 	jra data_error 
                                   4316 
                                   4317 ;---------------------------------
                                   4318 ; BASIC: SPIEN clkdiv, 0|1  
                                   4319 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4320 ; if clkdiv==-1 disable SPI
                                   4321 ; 0|1 -> disable|enable  
                                   4322 ;--------------------------------- 
                           000005  4323 SPI_CS_BIT=5
      00A7C6                       4324 spi_enable:
      00A7C6 72 5F 00         [ 4] 4325 	call arg_list 
      00A7C9 19 52            [ 1] 4326 	cp a,#2
      00A7CB 03 CD            [ 1] 4327 	jreq 1$
      00A7CD 98 20 A1         [ 2] 4328 	jp syntax_error 
      002EB8                       4329 1$: 
      00A7D0 04 27 03 CC      [ 1] 4330 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7D4 97               [ 2] 4331 	popw x  
      00A7D5 1F               [ 2] 4332 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A7D6 CD 98            [ 1] 4333 	jreq spi_disable 
      00A7D8 6F               [ 2] 4334 	popw x 
      00A7D9 A4 DF            [ 1] 4335 	ld a,#(1<<SPI_CR1_BR)
      00A7DB A1               [ 4] 4336 	mul x,a 
      00A7DC 45               [ 1] 4337 	ld a,xl 
      00A7DD 26 0C AE         [ 1] 4338 	ld SPI_CR1,a 
                                   4339 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7E0 40 00 CF 00      [ 1] 4340 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7E4 1A AE 47 FF      [ 1] 4341 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4342 ; configure SPI as master mode 0.	
      00A7E8 4F 20 15 A1      [ 1] 4343 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4344 ; ~CS line controlled by sofware 	
      00A7EC 46 27 06 AE      [ 1] 4345 	bset SPI_CR2,#SPI_CR2_SSM 
      00A7F0 96 5F CC 97      [ 1] 4346     bset SPI_CR2,#SPI_CR2_SSI 
                                   4347 ; enable SPI
      00A7F4 21 1C 52 00      [ 1] 4348 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A7F5 81               [ 4] 4349 	ret 
      002EE1                       4350 spi_disable:
      002EE1                       4351 	_drop #2; throw first argument.
      00A7F5 AE B6            [ 2]    1     addw sp,##2 
                                   4352 ; wait spi idle 
      00A7F7 00 CF            [ 1] 4353 1$:	ld a,#0x82 
      00A7F9 00 1A A6         [ 1] 4354 	and a,SPI_SR
      00A7FC 02 AE            [ 1] 4355 	cp a,#2 
      00A7FE 7F FF            [ 1] 4356 	jrne 1$
      00A800 72 1D 52 00      [ 1] 4357 	bres SPI_CR1,#SPI_CR1_SPE
      00A800 6B 01 1F 02      [ 1] 4358 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A804 CD 87 BF 16      [ 1] 4359 	bres PE_DDR,#SPI_CS_BIT 
      00A807 81               [ 4] 4360 	ret 
                                   4361 
      002EF9                       4362 spi_clear_error:
      00A807 CD 89            [ 1] 4363 	ld a,#0x78 
      00A809 41 27 08         [ 1] 4364 	bcp a,SPI_SR 
      00A80C A6 45            [ 1] 4365 	jreq 1$
      00A80E CD 89 C1 CD      [ 1] 4366 	clr SPI_SR 
      00A812 88               [ 4] 4367 1$: ret 
                                   4368 
      002F05                       4369 spi_send_byte:
      00A813 3D               [ 1] 4370 	push a 
      00A814 AE 00 80         [ 4] 4371 	call spi_clear_error
      00A817 CD               [ 1] 4372 	pop a 
      00A818 89 33 7B 01 1E   [ 2] 4373 	btjf SPI_SR,#SPI_SR_TXE,.
      00A81D 02 72 B0         [ 1] 4374 	ld SPI_DR,a
      00A820 00 1A C2 00 19   [ 2] 4375 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A825 22 E0 CD         [ 1] 4376 	ld a,SPI_DR 
      00A828 95               [ 4] 4377 	ret 
                                   4378 
      002F1B                       4379 spi_rcv_byte:
      00A829 7B 1E            [ 1] 4380 	ld a,#255
      00A82B 02 A3 47 FF 26   [ 2] 4381 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A830 03 CD 9D         [ 1] 4382 	ld a,SPI_DR 
      00A833 B2               [ 4] 4383 	ret
                                   4384 
                                   4385 ;------------------------------
                                   4386 ; BASIC: SPIWR byte [,byte]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4387 ; write 1 or more byte
                                   4388 ;------------------------------
      00A834                       4389 spi_write:
      00A834 5B 03 81         [ 4] 4390 	call expression
      00A837 A1 84            [ 1] 4391 	cp a,#TK_INTGR 
      00A837 CE B6            [ 1] 4392 	jreq 1$
      00A839 00 C3 A8         [ 2] 4393 	jp syntax_error 
      002F30                       4394 1$:	
      00A83C F7               [ 1] 4395 	ld a,xl 
      00A83D 81 2F 05         [ 4] 4396 	call spi_send_byte 
      00A83E CD 17 A0         [ 4] 4397 	call next_token 
      00A83E 88 4D            [ 1] 4398 	cp a,#TK_COMMA 
      00A840 27 0A            [ 1] 4399 	jrne 2$ 
      00A842 F6 5C            [ 2] 4400 	jra spi_write 
      00A844 90               [ 1] 4401 2$:	tnz a 
      00A845 F7 90            [ 1] 4402 	jreq 3$
      002F40                       4403 	_unget_token  
      00A847 5C 0A 01 26 F6   [ 1]    1      mov in,in.saved  
      00A84C 84               [ 4] 4404 3$:	ret 
                                   4405 
                                   4406 
                                   4407 ;-------------------------------
                                   4408 ; BASIC: SPIRD 	
                                   4409 ; read one byte from SPI 
                                   4410 ;-------------------------------
      002F46                       4411 spi_read:
      00A84D 81 2F 1B         [ 4] 4412 	call spi_rcv_byte 
      00A84E 5F               [ 1] 4413 	clrw x 
      00A84E 88               [ 1] 4414 	ld xl,a 
      00A84F 90               [ 1] 4415 	clr a  
      00A850 AE               [ 4] 4416 	ret 
                                   4417 
                                   4418 ;------------------------------
                                   4419 ; BASIC: SPISEL 0|1 
                                   4420 ; set state of ~CS line
                                   4421 ; 0|1 deselect|select  
                                   4422 ;------------------------------
      002F4D                       4423 spi_select:
      00A851 16 B8 90         [ 4] 4424 	call next_token 
      00A854 89 A6            [ 1] 4425 	cp a,#TK_INTGR 
      00A856 80 90            [ 1] 4426 	jreq 1$
      00A858 7F 90 5C         [ 2] 4427 	jp syntax_error 
      00A85B 4A               [ 2] 4428 1$: tnzw x  
      00A85C 26 F9            [ 1] 4429 	jreq cs_high 
      00A85E 90 85 84 81      [ 1] 4430 	bres PE_ODR,#SPI_CS_BIT
      00A862 81               [ 4] 4431 	ret 
      002F5F                       4432 cs_high: 
      00A862 89 90 89 52      [ 1] 4433 	bset PE_ODR,#SPI_CS_BIT
      00A866 06               [ 4] 4434 	ret 
                                   4435 
                                   4436 ;-------------------------------
                                   4437 ; BASIC: PAD 
                                   4438 ; Return pad buffer address.
                                   4439 ;------------------------------
      002F64                       4440 pad_ref:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A867 CD A8 37         [ 2] 4441 	ldw x,#pad 
      00A86A 26               [ 1] 4442 	clr a
      00A86B 09               [ 4] 4443 	ret 
                                   4444 
                                   4445 
                                   4446 ;------------------------------
                                   4447 ;      dictionary 
                                   4448 ; format:
                                   4449 ;   link:   2 bytes 
                                   4450 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4451 ;   cmd_name: 16 byte max 
                                   4452 ;   cmd_index: 2 bytes 
                                   4453 ;------------------------------
                                   4454 	.macro _dict_entry len,name,cmd_idx 
                                   4455 	.word LINK 
                                   4456 	LINK=.
                                   4457 name:
                                   4458 	.byte len   	
                                   4459 	.ascii "name"
                                   4460 	.word cmd_idx 
                                   4461 	.endm 
                                   4462 
                           000000  4463 	LINK=0
                                   4464 ; respect alphabetic order for BASIC names from Z-A
                                   4465 ; this sort order is for a cleaner WORDS cmd output. 	
      002F69                       4466 kword_end:
      002F69                       4467 	_dict_entry,3+F_XOR,XOR,XOR_IDX ; xor operator
      00A86C AE A8                    1 	.word LINK 
                           002F6B     2 	LINK=.
      002F6B                          3 XOR:
      00A86E F9                       4 	.byte 3+F_XOR   	
      00A86F CD 8A 1E                 5 	.ascii "XOR"
      00A872 CC A8                    6 	.word XOR_IDX 
      002F71                       4468 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A874 F1 6B                    1 	.word LINK 
                           002F73     2 	LINK=.
      00A875                          3 WRITE:
      00A875 CE                       4 	.byte 5   	
      00A876 00 1C C3 00 1E           5 	.ascii "WRITE"
      00A87B 25 09                    6 	.word WRITE_IDX 
      002F7B                       4469 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A87D AE A9                    1 	.word LINK 
                           002F7D     2 	LINK=.
      002F7D                          3 WORDS:
      00A87F 3B                       4 	.byte 5   	
      00A880 CD 8A 1E CC A8           5 	.ascii "WORDS"
      00A885 F1 AE                    6 	.word WORDS_IDX 
      00A886                       4470 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A886 CD 87                    1 	.word LINK 
                           002F87     2 	LINK=.
      002F87                          3 WAIT:
      00A888 FF                       4 	.byte 4   	
      00A889 72 5F 00 19              5 	.ascii "WAIT"
      00A88D AE B6                    6 	.word WAIT_IDX 
      002F8E                       4471 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A88F 00 CF                    1 	.word LINK 
                           002F90     2 	LINK=.
      002F90                          3 USR:
      00A891 00                       4 	.byte 3+F_IFUNC   	
      00A892 1A CD 9E                 5 	.ascii "USR"
      00A895 D2 1F                    6 	.word USR_IDX 
      002F96                       4472 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A897 05 0F                    1 	.word LINK 
                           002F98     2 	LINK=.
      002F98                          3 UNTIL:
      00A899 03                       4 	.byte 5   	
      00A89A CD A8 4E CE A8           5 	.ascii "UNTIL"
      00A89F F7 90                    6 	.word UNTIL_IDX 
      002FA0                       4473 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A8A1 FF 72                    1 	.word LINK 
                           002FA2     2 	LINK=.
      002FA2                          3 UFLASH:
      00A8A3 A9                       4 	.byte 6+F_IFUNC   	
      00A8A4 00 02 1E 05 90 FF        5 	.ascii "UFLASH"
      00A8AA 72 A9                    6 	.word UFLASH_IDX 
      002FAB                       4474 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A8AC 00 02                    1 	.word LINK 
                           002FAD     2 	LINK=.
      002FAD                          3 UBOUND:
      00A8AE A6                       4 	.byte 6+F_IFUNC   	
      00A8AF 7C 6B 04 A3 00 7C        5 	.ascii "UBOUND"
      00A8B5 22 01                    6 	.word UBOUND_IDX 
      002FB6                       4475 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A8B7 9F 6B                    1 	.word LINK 
                           002FB8     2 	LINK=.
      002FB8                          3 TONE:
      00A8B9 04                       4 	.byte 4   	
      00A8BA CE 00 1C 1F              5 	.ascii "TONE"
      00A8BE 01 A2                    6 	.word TONE_IDX 
      00A8BF                       4476 	_dict_entry,2,TO,TO_IDX;to
      00A8BF 1E 01                    1 	.word LINK 
                           002FC1     2 	LINK=.
      002FC1                          3 TO:
      00A8C1 7B                       4 	.byte 2   	
      00A8C2 04 CD                    5 	.ascii "TO"
      00A8C4 A8 3E                    6 	.word TO_IDX 
      002FC6                       4477 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A8C6 1F 01                    1 	.word LINK 
                           002FC8     2 	LINK=.
      002FC8                          3 TIMER:
      00A8C8 AE                       4 	.byte 5   	
      00A8C9 16 B8 CD 88 19           5 	.ascii "TIMER"
      00A8CE AE 00                    6 	.word TIMER_IDX 
      002FD0                       4478 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A8D0 80 CD                    1 	.word LINK 
                           002FD2     2 	LINK=.
      002FD2                          3 TIMEOUT:
      00A8D2 89                       4 	.byte 7+F_IFUNC   	
      00A8D3 33 1E 01 C3 00 1E 24     5 	.ascii "TIMEOUT"
      00A8DA 16 1E                    6 	.word TMROUT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      002FDC                       4479 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A8DC 05 72                    1 	.word LINK 
                           002FDE     2 	LINK=.
      002FDE                          3 TICKS:
      00A8DE F0                       4 	.byte 5+F_IFUNC   	
      00A8DF 03 1F 05 A6 80           5 	.ascii "TICKS"
      00A8E4 A3 00                    6 	.word TICKS_IDX 
      002FE6                       4480 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A8E6 80 24                    1 	.word LINK 
                           002FE8     2 	LINK=.
      002FE8                          3 STOP:
      00A8E8 01                       4 	.byte 4   	
      00A8E9 9F 6B 04 CD              5 	.ascii "STOP"
      00A8ED A8 4E                    6 	.word STOP_IDX 
      002FEF                       4481 	_dict_entry,4,STEP,STEP_IDX;step 
      00A8EF 20 CE                    1 	.word LINK 
                           002FF1     2 	LINK=.
      002FF1                          3 STEP:
      00A8F1 5B                       4 	.byte 4   	
      00A8F2 06 90 85 85              5 	.ascii "STEP"
      00A8F6 81 42                    6 	.word STEP_IDX 
      002FF8                       4482 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A8F8 43 43                    1 	.word LINK 
                           002FFA     2 	LINK=.
      002FFA                          3 SPIWR:
      00A8FA 61                       4 	.byte 5   	
      00A8FB 6E 27 74 20 66           5 	.ascii "SPIWR"
      00A900 6C 61                    6 	.word SPIWR_IDX 
      003002                       4483 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A902 73 68                    1 	.word LINK 
                           003004     2 	LINK=.
      003004                          3 SPISEL:
      00A904 20                       4 	.byte 6   	
      00A905 61 70 70 6C 69 63        5 	.ascii "SPISEL"
      00A90B 61 74                    6 	.word SPISEL_IDX 
      00300D                       4484 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A90D 69 6F                    1 	.word LINK 
                           00300F     2 	LINK=.
      00300F                          3 SPIRD:
      00A90F 6E                       4 	.byte 5+F_IFUNC   	
      00A910 2C 20 61 6C 72           5 	.ascii "SPIRD"
      00A915 65 61                    6 	.word SPIRD_IDX 
      003017                       4485 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A917 64 79                    1 	.word LINK 
                           003019     2 	LINK=.
      003019                          3 SPIEN:
      00A919 20                       4 	.byte 5   	
      00A91A 6F 6E 65 20 69           5 	.ascii "SPIEN"
      00A91F 6E 20                    6 	.word SPIEN_IDX 
      003021                       4486 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A921 46 4C                    1 	.word LINK 
                           003023     2 	LINK=.
      003023                          3 SLEEP:
      00A923 41                       4 	.byte 5   	
      00A924 53 48 0A 75 73           5 	.ascii "SLEEP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A929 65 20                    6 	.word SLEEP_IDX 
      00302B                       4487     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A92B 45 52                    1 	.word LINK 
                           00302D     2 	LINK=.
      00302D                          3 SIZE:
      00A92D 41                       4 	.byte 4   	
      00A92E 53 45 20 5C              5 	.ascii "SIZE"
      00A932 46 20                    6 	.word SIZE_IDX 
      003034                       4488 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A934 62 65                    1 	.word LINK 
                           003036     2 	LINK=.
      003036                          3 SAVE:
      00A936 66                       4 	.byte 4   	
      00A937 6F 72 65 00              5 	.ascii "SAVE"
      00A93B 4E 6F                    6 	.word SAVE_IDX 
      00303D                       4489 	_dict_entry 3,RUN,RUN_IDX;run
      00A93D 20 61                    1 	.word LINK 
                           00303F     2 	LINK=.
      00303F                          3 RUN:
      00A93F 70                       4 	.byte 3   	
      00A940 70 6C 69                 5 	.ascii "RUN"
      00A943 63 61                    6 	.word RUN_IDX 
      003045                       4490 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A945 74 69                    1 	.word LINK 
                           003047     2 	LINK=.
      003047                          3 RSHIFT:
      00A947 6F                       4 	.byte 6+F_IFUNC   	
      00A948 6E 20 69 6E 20 52        5 	.ascii "RSHIFT"
      00A94E 41 4D                    6 	.word RSHIFT_IDX 
      003050                       4491 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A950 00 47                    1 	.word LINK 
                           003052     2 	LINK=.
      00A951                          3 RND:
      00A951 CD                       4 	.byte 3+F_IFUNC   	
      00A952 9B 09 A1                 5 	.ascii "RND"
      00A955 84 27                    6 	.word RND_IDX 
      003058                       4492 	_dict_entry,6,RETURN,RET_IDX;return 
      00A957 03 CC                    1 	.word LINK 
                           00305A     2 	LINK=.
      00305A                          3 RETURN:
      00A959 97                       4 	.byte 6   	
      00A95A 1F 90 F6 93 EE 01        5 	.ascii "RETURN"
      00A960 72 A9                    6 	.word RET_IDX 
      003063                       4493 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A962 00 03                    1 	.word LINK 
                           003065     2 	LINK=.
      003065                          3 RESTORE:
      00A964 C7                       4 	.byte 7   	
      00A965 00 19 CF 00 1A 52 45     5 	.ascii "RESTORE"
      00A96A 00 80                    6 	.word REST_IDX 
      00306F                       4494 	_dict_entry 3,REM,REM_IDX;remark 
      00A96A CD 98                    1 	.word LINK 
                           003071     2 	LINK=.
      003071                          3 REM:
      00A96C 20                       4 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A96D A1 08 27                 5 	.ascii "REM"
      00A970 02 20                    6 	.word REM_IDX 
      003077                       4495 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A972 20 CD                    1 	.word LINK 
                           003079     2 	LINK=.
      003079                          3 REBOOT:
      00A974 9B                       4 	.byte 6   	
      00A975 09 A1 84 27 03 CC        5 	.ascii "REBOOT"
      00A97B 97 1F                    6 	.word RBT_IDX 
      003082                       4496 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A97D 90 F6                    1 	.word LINK 
                           003084     2 	LINK=.
      003084                          3 READ:
      00A97F 93                       4 	.byte 4+F_IFUNC   	
      00A980 EE 01 72 A9              5 	.ascii "READ"
      00A984 00 03                    6 	.word READ_IDX 
      00308B                       4497 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A986 9F 5F                    1 	.word LINK 
                           00308D     2 	LINK=.
      00308D                          3 QKEY:
      00A988 CD                       4 	.byte 4+F_IFUNC   	
      00A989 88 63 AE 00              5 	.ascii "QKEY"
      00A98D 01 CD                    6 	.word QKEY_IDX 
      003094                       4498 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A98F 89 33                    1 	.word LINK 
                           003096     2 	LINK=.
      003096                          3 PORTI:
      00A991 20                       4 	.byte 5+F_IFUNC   	
      00A992 D7 4F 52 54 49           5 	.ascii "PORTI"
      00A993 00 76                    6 	.word PRTI_IDX 
      00309E                       4499 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A993 81 96                    1 	.word LINK 
                           0030A0     2 	LINK=.
      00A994                          3 PORTH:
      00A994 CD                       4 	.byte 5+F_IFUNC   	
      00A995 99 D9 A1 01 27           5 	.ascii "PORTH"
      00A99A 03 CC                    6 	.word PRTH_IDX 
      0030A8                       4500 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A99C 97 1F                    1 	.word LINK 
                           0030AA     2 	LINK=.
      0030AA                          3 PORTG:
      00A99E 90                       4 	.byte 5+F_IFUNC   	
      00A99F F6 93 EE 01 72           5 	.ascii "PORTG"
      00A9A4 A9 00                    6 	.word PRTG_IDX 
      0030B2                       4501 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A9A6 03 9F                    1 	.word LINK 
                           0030B4     2 	LINK=.
      0030B4                          3 PORTF:
      00A9A8 A4                       4 	.byte 5+F_IFUNC   	
      00A9A9 7F 81 52 54 46           5 	.ascii "PORTF"
      00A9AB 00 70                    6 	.word PRTF_IDX 
      0030BC                       4502 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00A9AB A6 06                    1 	.word LINK 
                           0030BE     2 	LINK=.
      0030BE                          3 PORTE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9AD CD                       4 	.byte 5+F_IFUNC   	
      00A9AE 99 CC CD 98 20           5 	.ascii "PORTE"
      00A9B3 A1 02                    6 	.word PRTE_IDX 
      0030C6                       4503 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00A9B5 27 0E                    1 	.word LINK 
                           0030C8     2 	LINK=.
      0030C8                          3 PORTD:
      00A9B7 A1                       4 	.byte 5+F_IFUNC   	
      00A9B8 04 27 12 A1 82           5 	.ascii "PORTD"
      00A9BD 27 03                    6 	.word PRTD_IDX 
      0030D0                       4504 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00A9BF CC 97                    1 	.word LINK 
                           0030D2     2 	LINK=.
      0030D2                          3 PORTC:
      00A9C1 1F                       4 	.byte 5+F_IFUNC   	
      00A9C2 50 4F 52 54 43           5 	.ascii "PORTC"
      00A9C2 FD 20                    6 	.word PRTC_IDX 
      0030DA                       4505 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00A9C4 0B D2                    1 	.word LINK 
                           0030DC     2 	LINK=.
      00A9C5                          3 PORTB:
      00A9C5 F6                       4 	.byte 5+F_IFUNC   	
      00A9C6 88 CD 98 46 84           5 	.ascii "PORTB"
      00A9CB 20 03                    6 	.word PRTB_IDX 
      00A9CD                       4506 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00A9CD CD 98                    1 	.word LINK 
                           0030E6     2 	LINK=.
      0030E6                          3 PORTA:
      00A9CF 6F                       4 	.byte 5+F_IFUNC   	
      00A9D0 5F 02 72 A2 00           5 	.ascii "PORTA"
      00A9D5 03 90                    6 	.word PRTA_IDX 
      0030EE                       4507 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A9D7 F7 90                    1 	.word LINK 
                           0030F0     2 	LINK=.
      0030F0                          3 PRINT:
      00A9D9 EF                       4 	.byte 5   	
      00A9DA 01 A6 07 CD 99           5 	.ascii "PRINT"
      00A9DF CC 64                    6 	.word PRT_IDX 
      00A9E0                       4508 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A9E0 90 F6                    1 	.word LINK 
                           0030FA     2 	LINK=.
      0030FA                          3 POUT:
      00A9E2 93                       4 	.byte 4+F_IFUNC   	
      00A9E3 EE 01 72 A9              5 	.ascii "POUT"
      00A9E7 00 03                    6 	.word POUT_IDX 
      003101                       4509 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A9E9 81 FA                    1 	.word LINK 
                           003103     2 	LINK=.
      00A9EA                          3 POKE:
      00A9EA CD                       4 	.byte 4   	
      00A9EB 89 D1 81 45              5 	.ascii "POKE"
      00A9EE 00 60                    6 	.word POKE_IDX 
      00310A                       4510 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A9EE 5F C6                    1 	.word LINK 
                           00310C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00310C                          3 PMODE:
      00A9F0 00                       4 	.byte 5   	
      00A9F1 2F C0 00 30 27           5 	.ascii "PMODE"
      00A9F6 03 53                    6 	.word PMODE_IDX 
      003114                       4511 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A9F8 A6 FF                    1 	.word LINK 
                           003116     2 	LINK=.
      00A9FA                          3 PINP:
      00A9FA 81                       4 	.byte 4+F_IFUNC   	
      00A9FB 50 49 4E 50              5 	.ascii "PINP"
      00A9FB CD 99                    6 	.word PINP_IDX 
      00311D                       4512 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A9FD D9 A1                    1 	.word LINK 
                           00311F     2 	LINK=.
      00311F                          3 PEEK:
      00A9FF 02                       4 	.byte 4+F_IFUNC   	
      00AA00 27 03 CC 97              5 	.ascii "PEEK"
      00AA04 1F 90                    6 	.word PEEK_IDX 
      003126                       4513 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AA06 E6 03                    1 	.word LINK 
                           003128     2 	LINK=.
      003128                          3 PAUSE:
      00AA08 93                       4 	.byte 5   	
      00AA09 EE 04 A3 50 00           5 	.ascii "PAUSE"
      00AA0E 2B 16                    6 	.word PAUSE_IDX 
      003130                       4514 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AA10 A3 50                    1 	.word LINK 
                           003132     2 	LINK=.
      003132                          3 PAD:
      00AA12 29                       4 	.byte 3+F_IFUNC   	
      00AA13 2A 11 89                 5 	.ascii "PAD"
      00AA16 90 F6                    6 	.word PAD_IDX 
      003138                       4515 	_dict_entry,2+F_OR,OR,OR_IDX; OR operator 
      00AA18 93 EE                    1 	.word LINK 
                           00313A     2 	LINK=.
      00313A                          3 OR:
      00AA1A 01                       4 	.byte 2+F_OR   	
      00AA1B 72 A9                    5 	.ascii "OR"
      00AA1D 00 03                    6 	.word OR_IDX 
      00313F                       4516 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA1F 72 FB                    1 	.word LINK 
                           003141     2 	LINK=.
      003141                          3 ON:
      00AA21 01                       4 	.byte 2   	
      00AA22 5B 02                    5 	.ascii "ON"
      00AA24 4F 81                    6 	.word ON_IDX 
      00AA26                       4517 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA26 A6 0A                    1 	.word LINK 
                           003148     2 	LINK=.
      003148                          3 ODR:
      00AA28 CC                       4 	.byte 3+F_IFUNC   	
      00AA29 97 21 52                 5 	.ascii "ODR"
      00AA2B 00 54                    6 	.word ODR_IDX 
      00314E                       4518 	_dict_entry,3+F_NOT,NOT,NOT_IDX;NOT operator
      00AA2B CD A8                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           003150     2 	LINK=.
      003150                          3 NOT:
      00AA2D 37                       4 	.byte 3+F_NOT   	
      00AA2E 26 13 AE                 5 	.ascii "NOT"
      00AA31 B6 00                    6 	.word NOT_IDX 
      003156                       4519 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA33 72 BB                    1 	.word LINK 
                           003158     2 	LINK=.
      003158                          3 NEXT:
      00AA35 B6                       4 	.byte 4   	
      00AA36 02 1C 00 04              5 	.ascii "NEXT"
      00AA3A 1C 00                    6 	.word NEXT_IDX 
      00315F                       4520 	_dict_entry,3,NEW,NEW_IDX;new
      00AA3C 80 9F                    1 	.word LINK 
                           003161     2 	LINK=.
      003161                          3 NEW:
      00AA3E A4                       4 	.byte 3   	
      00AA3F 80 97 20                 5 	.ascii "NEW"
      00AA42 03 AE                    6 	.word NEW_IDX 
      003167                       4521 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA44 B6 00                    1 	.word LINK 
                           003169     2 	LINK=.
      00AA46                          3 LSHIFT:
      00AA46 4F                       4 	.byte 6+F_IFUNC   	
      00AA47 81 53 48 49 46 54        5 	.ascii "LSHIFT"
      00AA48 00 4E                    6 	.word LSHIFT_IDX 
      003172                       4522 	_dict_entry,4+F_IFUNC,LOG2,LOG_IDX;log2 
      00AA48 CD 99                    1 	.word LINK 
                           003174     2 	LINK=.
      003174                          3 LOG2:
      00AA4A D9                       4 	.byte 4+F_IFUNC   	
      00AA4B A1 02 27 03              5 	.ascii "LOG2"
      00AA4F CC 97                    6 	.word LOG_IDX 
      00317B                       4523 	_dict_entry 4,LIST,LIST_IDX;list
      00AA51 1F 74                    1 	.word LINK 
                           00317D     2 	LINK=.
      00AA52                          3 LIST:
      00AA52 90                       4 	.byte 4   	
      00AA53 E6 03 93 EE              5 	.ascii "LIST"
      00AA57 04 CF                    6 	.word LIST_IDX 
      003184                       4524 	_dict_entry 3,LET,LET_IDX;let 
      00AA59 00 1A                    1 	.word LINK 
                           003186     2 	LINK=.
      003186                          3 LET:
      00AA5B 90                       4 	.byte 3   	
      00AA5C F6 93 EE                 5 	.ascii "LET"
      00AA5F 01 72                    6 	.word LET_IDX 
      00318C                       4525 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AA61 A9 00                    1 	.word LINK 
                           00318E     2 	LINK=.
      00318E                          3 KEY:
      00AA63 03                       4 	.byte 3+F_CFUNC   	
      00AA64 90 F7 90                 5 	.ascii "KEY"
      00AA67 EF 01                    6 	.word KEY_IDX 
      003194                       4526 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA69 72 CD                    1 	.word LINK 
                           003196     2 	LINK=.
      003196                          3 IWDGREF:
      00AA6B 00                       4 	.byte 7   	
      00AA6C 1A 81 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AA6E 00 44                    6 	.word IWDGREF_IDX 
      0031A0                       4527 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AA6E 72 0D                    1 	.word LINK 
                           0031A2     2 	LINK=.
      0031A2                          3 IWDGEN:
      00AA70 52                       4 	.byte 6   	
      00AA71 30 FB 8E CC 81 43        5 	.ascii "IWDGEN"
      00AA77 00 42                    6 	.word IWDGEN_IDX 
      0031AB                       4528 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AA77 72 0D                    1 	.word LINK 
                           0031AD     2 	LINK=.
      0031AD                          3 INPUT:
      00AA79 52                       4 	.byte 5   	
      00AA7A 30 FB 72 16 00           5 	.ascii "INPUT"
      00AA7F 23 8E                    6 	.word INPUT_IDX 
      0031B5                       4529 	_dict_entry,2,IF,IF_IDX;if 
      00AA81 81 AD                    1 	.word LINK 
                           0031B7     2 	LINK=.
      00AA82                          3 IF:
      00AA82 CD                       4 	.byte 2   	
      00AA83 9B 09                    5 	.ascii "IF"
      00AA85 A1 84                    6 	.word IF_IDX 
      0031BC                       4530 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AA87 27 03                    1 	.word LINK 
                           0031BE     2 	LINK=.
      0031BE                          3 IDR:
      00AA89 CC                       4 	.byte 3+F_IFUNC   	
      00AA8A 97 1F 90                 5 	.ascii "IDR"
      00AA8D F6 93                    6 	.word IDR_IDX 
      0031C4                       4531 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AA8F EE 01                    1 	.word LINK 
                           0031C6     2 	LINK=.
      0031C6                          3 HEX:
      00AA91 72                       4 	.byte 3   	
      00AA92 A9 00 03                 5 	.ascii "HEX"
      00AA95 00 3A                    6 	.word HEX_IDX 
      0031CC                       4532 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AA95 CF 00                    1 	.word LINK 
                           0031CE     2 	LINK=.
      0031CE                          3 GOTO:
      00AA97 13                       4 	.byte 4   	
      00AA98 CE 00 13 5D              5 	.ascii "GOTO"
      00AA9C 27 03                    6 	.word GOTO_IDX 
      0031D5                       4533 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AA9E 8F 26                    1 	.word LINK 
                           0031D7     2 	LINK=.
      0031D7                          3 GOSUB:
      00AAA0 F7                       4 	.byte 5   	
      00AAA1 47 4F 53 55 42           5 	.ascii "GOSUB"
      00AAA1 81 36                    6 	.word GOSUB_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAA2                       4534 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AAA2 CD 9B                    1 	.word LINK 
                           0031E1     2 	LINK=.
      0031E1                          3 GET:
      00AAA4 09                       4 	.byte 3   	
      00AAA5 A1 84 27                 5 	.ascii "GET"
      00AAA8 03 CC                    6 	.word GET_IDX 
      0031E7                       4535 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AAAA 97 1F                    1 	.word LINK 
                           0031E9     2 	LINK=.
      0031E9                          3 FREE:
      00AAAC 90                       4 	.byte 4+F_IFUNC   	
      00AAAD F6 93 EE 01              5 	.ascii "FREE"
      00AAB1 72 A9                    6 	.word FREE_IDX 
      0031F0                       4536 	_dict_entry,3,FOR,FOR_IDX;for 
      00AAB3 00 03                    1 	.word LINK 
                           0031F2     2 	LINK=.
      00AAB5                          3 FOR:
      00AAB5 A3                       4 	.byte 3   	
      00AAB6 14 00 2B                 5 	.ascii "FOR"
      00AAB9 0C 35                    6 	.word FOR_IDX 
      0031F8                       4537 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AABB 0F 50                    1 	.word LINK 
                           0031FA     2 	LINK=.
      0031FA                          3 FCPU:
      00AABD F2                       4 	.byte 4   	
      00AABE A6 1E 62 A6              5 	.ascii "FCPU"
      00AAC2 10 62                    6 	.word FCPU_IDX 
      003201                       4538 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AAC4 20 1E                    1 	.word LINK 
                           003203     2 	LINK=.
      00AAC6                          3 ERASE:
      00AAC6 A3                       4 	.byte 5   	
      00AAC7 08 00 2B 09 35           5 	.ascii "ERASE"
      00AACC 0E 50                    6 	.word ERASE_IDX 
      00320B                       4539 	_dict_entry,3,END,END_IDX;cmd_end  
      00AACE F2 A6                    1 	.word LINK 
                           00320D     2 	LINK=.
      00320D                          3 END:
      00AAD0 50                       4 	.byte 3   	
      00AAD1 62 20 10                 5 	.ascii "END"
      00AAD4 00 2C                    6 	.word END_IDX 
      003213                       4540 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AAD4 35 07                    1 	.word LINK 
                           003215     2 	LINK=.
      003215                          3 EEPROM:
      00AAD6 50                       4 	.byte 6+F_IFUNC   	
      00AAD7 F2 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00AAD8 00 2A                    6 	.word EEPROM_IDX 
      00321E                       4541 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AAD8 A3 00                    1 	.word LINK 
                           003220     2 	LINK=.
      003220                          3 EEFREE:
      00AADA 40                       4 	.byte 6+F_IFUNC   	
      00AADB 23 07 72 5C 50 F2        5 	.ascii "EEFREE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAE1 54 20                    6 	.word EEFREE_IDX 
      003229                       4542 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AAE3 F4 20                    1 	.word LINK 
                           00322B     2 	LINK=.
      00AAE4                          3 EDIT:
      00AAE4 9F                       4 	.byte 4   	
      00AAE5 4A 27 01 4A              5 	.ascii "EDIT"
      00AAE9 00 28                    6 	.word EDIT_IDX 
      003232                       4543 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AAE9 A4 3E                    1 	.word LINK 
                           003234     2 	LINK=.
      003234                          3 DWRITE:
      00AAEB C7                       4 	.byte 6+F_CMD   	
      00AAEC 50 F1 72 18 50 F0        5 	.ascii "DWRITE"
      00AAF2 8E 81                    6 	.word DWRITE_IDX 
      00AAF4                       4544 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AAF4 C6 00                    1 	.word LINK 
                           00323F     2 	LINK=.
      00323F                          3 DREAD:
      00AAF6 10                       4 	.byte 5+F_IFUNC   	
      00AAF7 CE 00 11 81 44           5 	.ascii "DREAD"
      00AAFB 00 24                    6 	.word DREAD_IDX 
      003247                       4545 	_dict_entry,2,DO,DO_IDX;do_loop
      00AAFB CD 99                    1 	.word LINK 
                           003249     2 	LINK=.
      003249                          3 DO:
      00AAFD D9                       4 	.byte 2   	
      00AAFE A1 01                    5 	.ascii "DO"
      00AB00 27 03                    6 	.word DO_IDX 
      00324E                       4546 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AB02 CC 97                    1 	.word LINK 
                           003250     2 	LINK=.
      003250                          3 DEC:
      00AB04 1F                       4 	.byte 3   	
      00AB05 44 45 43                 5 	.ascii "DEC"
      00AB05 CD 82                    6 	.word DEC_IDX 
      003256                       4547 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AB07 5F 90                    1 	.word LINK 
                           003258     2 	LINK=.
      003258                          3 DDR:
      00AB09 F6                       4 	.byte 3+F_IFUNC   	
      00AB0A 93 EE 01                 5 	.ascii "DDR"
      00AB0D 72 A9                    6 	.word DDR_IDX 
      00325E                       4548 	_dict_entry,4,DATA,DATA_IDX;data  
      00AB0F 00 03                    1 	.word LINK 
                           003260     2 	LINK=.
      003260                          3 DATA:
      00AB11 81                       4 	.byte 4   	
      00AB12 44 41 54 41              5 	.ascii "DATA"
      00AB12 CD 99                    6 	.word DATA_IDX 
      003267                       4549 	_dict_entry,3+F_IFUNC,CR2,CR2_IDX;const_cr2 
      00AB14 D9 A1                    1 	.word LINK 
                           003269     2 	LINK=.
      003269                          3 CR2:
      00AB16 02                       4 	.byte 3+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AB17 27 03 CC                 5 	.ascii "CR2"
      00AB1A 97 1F                    6 	.word CR2_IDX 
      00326F                       4550 	_dict_entry,3+F_IFUNC,CR1,CR1_IDX;const_cr1 
      00AB1C 90 F6                    1 	.word LINK 
                           003271     2 	LINK=.
      003271                          3 CR1:
      00AB1E 93                       4 	.byte 3+F_IFUNC   	
      00AB1F EE 01 72                 5 	.ascii "CR1"
      00AB22 A9 00                    6 	.word CR1_IDX 
      003277                       4551 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB24 03 90                    1 	.word LINK 
                           003279     2 	LINK=.
      003279                          3 CONST:
      00AB26 93                       4 	.byte 5   	
      00AB27 90 F6 93 EE 01           5 	.ascii "CONST"
      00AB2C 90 5D                    6 	.word CONST_IDX 
      003281                       4552 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB2E 27 07                    1 	.word LINK 
                           003283     2 	LINK=.
      003283                          3 CHAR:
      00AB30 98                       4 	.byte 4+F_CFUNC   	
      00AB31 59 49 90 5A              5 	.ascii "CHAR"
      00AB35 26 F9                    6 	.word CHAR_IDX 
      00328A                       4553 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AB37 90 F7                    1 	.word LINK 
                           00328C     2 	LINK=.
      00328C                          3 BYE:
      00AB39 90                       4 	.byte 3   	
      00AB3A EF 01 A6                 5 	.ascii "BYE"
      00AB3D 84 81                    6 	.word BYE_IDX 
      00AB3F                       4554 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AB3F CD 99                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 BTOGL:
      00AB41 D9                       4 	.byte 5   	
      00AB42 A1 02 27 03 CC           5 	.ascii "BTOGL"
      00AB47 97 1F                    6 	.word BTOGL_IDX 
      00329C                       4555 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AB49 90 F6                    1 	.word LINK 
                           00329E     2 	LINK=.
      00329E                          3 BTEST:
      00AB4B 93                       4 	.byte 5+F_IFUNC   	
      00AB4C EE 01 72 A9 00           5 	.ascii "BTEST"
      00AB51 03 90                    6 	.word BTEST_IDX 
      0032A6                       4556 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AB53 93 90                    1 	.word LINK 
                           0032A8     2 	LINK=.
      0032A8                          3 BSET:
      00AB55 F6                       4 	.byte 4   	
      00AB56 93 EE 01 90              5 	.ascii "BSET"
      00AB5A 5D 27                    6 	.word BSET_IDX 
      0032AF                       4557 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AB5C 07 98                    1 	.word LINK 
                           0032B1     2 	LINK=.
      0032B1                          3 BRES:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB5E 56                       4 	.byte 4   	
      00AB5F 46 90 5A 26              5 	.ascii "BRES"
      00AB63 F9 90                    6 	.word BRES_IDX 
      0032B8                       4558 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AB65 F7 90                    1 	.word LINK 
                           0032BA     2 	LINK=.
      0032BA                          3 BIT:
      00AB67 EF                       4 	.byte 3+F_IFUNC   	
      00AB68 01 A6 84                 5 	.ascii "BIT"
      00AB6B 81 0A                    6 	.word BIT_IDX 
      00AB6C                       4559 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AB6C A6 84                    1 	.word LINK 
                           0032C2     2 	LINK=.
      0032C2                          3 AWU:
      00AB6E CD                       4 	.byte 3   	
      00AB6F 99 CC CD                 5 	.ascii "AWU"
      00AB72 98 5F                    6 	.word AWU_IDX 
      0032C8                       4560 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AB74 9F A4                    1 	.word LINK 
                           0032CA     2 	LINK=.
      0032CA                          3 ASC:
      00AB76 07                       4 	.byte 3+F_IFUNC   	
      00AB77 C7 50 C6                 5 	.ascii "ASC"
      00AB7A 81 06                    6 	.word ASC_IDX 
      00AB7B                       4561 	_dict_entry,3+F_AND,AND,AND_IDX ; AND operator 
      00AB7B 52 01                    1 	.word LINK 
                           0032D2     2 	LINK=.
      0032D2                          3 AND:
      00AB7D CD                       4 	.byte 3+F_AND   	
      00AB7E 99 DE A1                 5 	.ascii "AND"
      00AB81 02 27                    6 	.word AND_IDX 
      0032D8                       4562 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AB83 03 CC                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 ADCREAD:
      00AB85 97                       4 	.byte 7+F_IFUNC   	
      00AB86 1F 90 F6 93 EE 01 72     5 	.ascii "ADCREAD"
      00AB8D A9 00                    6 	.word ADCREAD_IDX 
      0032E4                       4563 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AB8F 03 CF                    1 	.word LINK 
                           0032E6     2 	LINK=.
      0032E6                          3 ADCON:
      00AB91 00                       4 	.byte 5   	
      00AB92 1A 90 F6 93 EE           5 	.ascii "ADCON"
      00AB97 01 72                    6 	.word ADCON_IDX 
      0032EE                       4564 kword_dict::
      0032EE                       4565 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AB99 A9 00                    1 	.word LINK 
                           0032F0     2 	LINK=.
      0032F0                          3 ABS:
      00AB9B 03                       4 	.byte 3+F_IFUNC   	
      00AB9C CD AB DA                 5 	.ascii "ABS"
      00AB9F 6B 01                    6 	.word ABS_IDX 
                                   4566 
                                   4567 ;comands and fonctions address table 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      0032F6                       4568 code_addr::
      00ABA1 A6 01 0D 01 27 0D 48  4569 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             0A 01 26 FB 6B
      00ABAD 01 7B 01 EA 03 E7 03  4570 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             A6 01 C1 00 0F 27 10
      00ABBB 7B 01 43 E4 04 E7 04  4571 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             7B 01 43 E4 02 E7 02
      00ABC9 20 0C 2D DD 25 48 27  4572 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
             46 2A EC 27 E2 22 72
             24 A8 24 8E
      00ABCB 1C 16 2D BF 22 55 20  4573 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
             93 2C B1 2C EF 29 6A
      00ABCB 7B 01 EA 02 E7 02 7B  4574 	.word let,list,log2,lshift,next,new ; 40..47
             01 EA 04 E7 04
      00ABD7 2D BA 2F 64 2A 02 2A  4575 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             FB 22 34 2D D8
      00ABD7 5B 01 81 D3 1F F0 2D  4576 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             8D 2D 92 2D 97 2D 9C
             2D A1
      00ABDA 2D A6 2D AB 2D B0 2D  4577 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             B5 29 6E 2E 60 00 C3
             21 32
      00ABDA 58 1C AB EA FE 9F 88  4578 	.word restore,return, random,rshift,run,free ; 72..79
             5E A6 05 42 1C
      00ABE6 50 00 84 81 2E AE 2F  4579 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             4D 2F 26 22 DC 26 F0
             2A 74
      00ABEA 2C 8F 2C A6 22 9C 25  4580 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             87 1C 69 29 AB 2D 5A
             29 C8
      00ABEA 03 06 03 05 04 00 02  4581 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             01 06 00 02 02 02 03
      00ABF8 03 01 03 03           4582 	.word func_eefree,0 
                                   4583 
                                   4584 
                                   4585 
                                   4586 
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
      0033B4                         30 test:
      0033B4                         31     _vars VSIZE 
      00ABFC 02 04            [ 2]    1     sub sp,#VSIZE 
      00ABFE 04 05 02         [ 2]   32     ldw x,#LOOP_CNT
      00AC01 06 02            [ 2]   33     ldw (CNTR,sp),x  
      00AC03 07 02 05         [ 2]   34     ldw x,ticks 
      00AC06 04 02            [ 2]   35     ldw (T,sp),x
      0033C0                         36 1$: ; test add24 
      00AC08 04 01            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC0A AE FF FF         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC0A CD 99 D9         [ 1]   39     ld acc24,a 
      00AC0D A1 01 27         [ 2]   40     ldw acc24+1,x  
      00AC10 03 CC            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC12 97 1F FF         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC14 CD 01 6A         [ 4]   43     call add24 
      00AC14 90 F6            [ 2]   44     ldw x,(CNTR,sp)
      00AC16 93 EE 01         [ 2]   45     subw x,#1
      00AC19 72 A9            [ 2]   46     ldw (CNTR,sp),x 
      00AC1B 00 03            [ 1]   47     jrne 1$
      00AC1D 89 88 A6         [ 4]   48     call prt_acc24
      00AC20 80 15            [ 1]   49     ld a,#SPACE 
      00AC22 01 27 05         [ 4]   50     call putc 
      00AC25 A6 0A CC         [ 2]   51     ldw x,ticks 
      00AC28 97 21 01         [ 2]   52     subw x,(T,sp)
      00AC2A CD 17 F5         [ 4]   53     call prt_i16  
      00AC2A CE 00            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AC2C 15 58 58         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AC2F 58 58 58         [ 2]   58     ldw x,LOOP_CNT
      00AC32 9E C8            [ 2]   59     ldw (CNTR,sp),x 
      00AC34 00 15 C7         [ 2]   60     ldw x,ticks 
      00AC37 00 0E            [ 2]   61     ldw (T,sp),x 
      0033FC                         62 2$: 
      00AC39 9F C8            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AC3B 00 16 C7         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AC3E 00 0F CE         [ 1]   65     ld acc24,a 
      00AC41 00 17 CF         [ 2]   66     ldw acc24+1,x  
      00AC44 00 15            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AC46 CE 00 17         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AC49 54 9E C8         [ 4]   69     call mul24 
      00AC4C 00 17            [ 2]   70     ldw x,(CNTR,sp)
      00AC4E C7 00 17         [ 2]   71     subw x,#1
      00AC51 9F C8            [ 2]   72     ldw (CNTR,sp),x 
      00AC53 00 18            [ 1]   73     jrne 2$ 
      00AC55 C7 00 18         [ 4]   74    call prt_acc24 
      00AC58 CE 00            [ 1]   75    ld a,#SPACE 
      00AC5A 0E 54 54         [ 4]   76    call putc 
      00AC5D 54 9E C8         [ 2]   77     ldw x,ticks 
      00AC60 00 0E C7         [ 2]   78     subw x,(T,sp)
      00AC63 00 0E 9F         [ 4]   79     call prt_i16 
      00AC66 C8 00            [ 1]   80     ld a,#CR 
      00AC68 0F C7 00         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AC6B 0F C8 00         [ 2]   83     ldw x,LOOP_CNT
      00AC6E 18 97            [ 2]   84     ldw (CNTR,sp),x 
      00AC70 C6 00 0E         [ 2]   85     ldw x,ticks 
      00AC73 C8 00            [ 2]   86     ldw (T,sp),x 
      003438                         87 3$: 
      00AC75 17 95            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AC77 CF 00 17         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AC7A C6 00 16         [ 1]   90     ld acc24,a 
      00AC7D A4 7F 72         [ 2]   91     ldw acc24+1,x  
      00AC80 A2 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AC82 03 90 F7         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AC85 90 EF 01         [ 4]   94     call mul24 
      00AC88 84 85            [ 2]   95     ldw x,(CNTR,sp)
      00AC8A 72 A2 00         [ 2]   96     subw x,#1
      00AC8D 03 90            [ 2]   97     ldw (CNTR,sp),x 
      00AC8F F7 90            [ 1]   98     jrne 3$ 
      00AC91 EF 01 CD         [ 4]   99     call prt_acc24    
      00AC94 84 52            [ 1]  100     ld a,#SPACE 
      00AC96 90 F6 93         [ 4]  101     call putc 
      00AC99 EE 01 72         [ 2]  102     ldw x,ticks 
      00AC9C A9 00 03         [ 2]  103     subw x,(T,sp)
      00AC9F 1C 00 01         [ 4]  104     call prt_i16 
      00ACA2 A9 00            [ 1]  105     ld a,#CR 
      00ACA4 81 09 41         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00ACA5 CE 27 10         [ 2]  108     ldw x,LOOP_CNT
      00ACA5 90 89            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00ACA7 52 03 0F         [ 2]  110     ldw x,ticks 
      00ACAA 02 0F            [ 2]  111     ldw (T,sp),x 
      003474                        112 4$:
      00ACAC 03 90            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00ACAE AE B3 70         [ 2]  114     ldw x,#VAL1&0XFFFF
      00ACB1 93 F6 A4         [ 1]  115     ld acc24,a 
      00ACB4 0F 6B 01         [ 2]  116     ldw acc24+1,x  
      00ACB7 0C 03            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ACB9 5C F6 CD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ACBC 89 C1 0C         [ 4]  119     call mul24 
      00ACBF 02 0A            [ 2]  120     ldw x,(CNTR,sp)
      00ACC1 01 26 F5         [ 2]  121     subw x,#1
      00ACC4 A6 46            [ 2]  122     ldw (CNTR,sp),x 
      00ACC6 11 02            [ 1]  123     jrne 4$ 
      00ACC8 2B 09 A6         [ 4]  124     call prt_acc24 
      00ACCB 20 CD            [ 1]  125     ld a,#SPACE 
      00ACCD 89 C1 0C         [ 4]  126     call putc 
      00ACD0 02 20 07         [ 2]  127     ldw x,ticks 
      00ACD3 A6 0D CD         [ 2]  128     subw x,(T,sp)
      00ACD6 89 C1 0F         [ 4]  129     call prt_i16 
      00ACD9 02 72            [ 1]  130     ld a,#CR 
      00ACDB A2 00 02         [ 4]  131     call putc 
                                    132 ; test abs24 
      00ACDE 90 FE 26         [ 2]  133     ldw x,LOOP_CNT
      00ACE1 CF A6            [ 2]  134     ldw (CNTR,sp),x 
      00ACE3 0D CD 89         [ 2]  135     ldw x,ticks 
      00ACE6 C1 5F            [ 2]  136     ldw (T,sp),x 
      0034B0                        137 5$: 
      00ACE8 7B 03            [ 1]  138     ld a,#0xff
      00ACEA 97 CD 98         [ 2]  139     ldw x,#0xffff
      00ACED 75 AE AC         [ 4]  140     call abs24 
      00ACF0 F9 CD 8A         [ 1]  141     ld acc24,a 
      00ACF3 1E 5B 03         [ 2]  142     ldw acc24+1,x
      00ACF6 90 85            [ 2]  143     ldw x,(CNTR,sp)
      00ACF8 81 20 77         [ 2]  144     subw x,#1
      00ACFB 6F 72            [ 2]  145     ldw (CNTR,sp),x 
      00ACFD 64 73            [ 1]  146     jrne 5$ 
      00ACFF 20 69 6E         [ 4]  147     call prt_acc24 
      00AD02 20 64            [ 1]  148     ld a,#SPACE 
      00AD04 69 63 74         [ 4]  149     call putc 
      00AD07 69 6F 6E         [ 2]  150     ldw x,ticks 
      00AD0A 61 72 79         [ 2]  151     subw x,(T,sp)
      00AD0D 0A 00 F5         [ 4]  152     call prt_i16 
      00AD0F                        153 6$:
      00AD0F CD 99            [ 1]  154     ld a,#CR 
      00AD11 DE A1 01         [ 4]  155     call putc 
      00AD14 27 03 CC         [ 4]  156     call read_integer 
      00AD17 97 1F 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AD19 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00AD19 90 F6 93 EE 01   [ 1]  159     mov farptr+2,acc8 
      00AD1E 72 A9 00         [ 4]  160     call read_integer 
      00AD21 03 CF 00         [ 1]  161     ld a,acc24 
      00AD24 13 81 0D         [ 2]  162     ldw x,acc16 
      00AD26 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00AD26 4F CE 00 13 27   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AD2B 02 5F 81 43 53   [ 1]  165     mov acc8,farptr+2 
      00AD30 81 03 24         [ 4]  166     call div24 
      00AD31 88               [ 1]  167     push a 
      00AD31 CD               [ 2]  168     pushw x 
      00AD32 99 DE A1         [ 4]  169     call prt_acc24 
      00AD35 01 27            [ 1]  170     ld a,#SPACE 
      00AD37 03 CC 97         [ 4]  171     call putc 
      00AD3A 1F               [ 2]  172     popw x
      00AD3B 90 F6 93         [ 2]  173     ldw acc16,x  
      00AD3E EE 01 72         [ 1]  174     pop acc24 
      00AD41 A9 00 03         [ 4]  175     call prt_acc24
      00AD44 4B 00            [ 2]  176     jra 6$
      003520                        177     _drop VSIZE 
      00AD46 35 CC            [ 2]    1     addw sp,#VSIZE 
      00AD48 50               [ 4]  178     ret 
                                    179 
                                    180 
      003523                        181 read_integer:
      00AD49 E0 9E            [ 1]  182     ld a,#'? 
      00AD4B A4 3F 95         [ 4]  183     call putc  
      00AD4E A3 00 FF 23      [ 1]  184 	clr count  
      00AD52 06 0C 01         [ 4]  185 	call readln 
      00AD55 98 56 20         [ 2]  186 	ldw x,#tib 
      00AD58 F5 35 55         [ 1]  187 	push count
      00AD5B 50 E0            [ 1]  188 	push #0 
      00AD5D 84 C7 50         [ 2]  189 	addw x,(1,sp)
      00AD60 E1               [ 1]  190 	incw x 
      00353B                        191 	_drop 2 
      00AD61 9F 4A            [ 2]    1     addw sp,#2 
      00AD63 35 55 50 E0      [ 1]  192 	clr in 
      00AD67 C7 50 E2         [ 4]  193 	call get_token
      00AD6A 35 AA            [ 1]  194 	cp a,#TK_INTGR
      00AD6C 50 E0            [ 1]  195 	jreq 3$ 
      00AD6E 81 11            [ 1]  196 	cp a,#TK_MINUS
      00AD6F CD 0F 18         [ 4]  197 	call get_token 
      00AD6F 35 AA            [ 1]  198 	cp a,#TK_INTGR 
      00AD71 50 E0            [ 1]  199 	jreq 2$
      00AD73 81 16 9F         [ 2]  200 	jp syntax_error
      00AD74                        201 2$:
      00AD74 CD 99 D9         [ 4]  202 	call neg_acc24  	
      003557                        203 3$: 
      00AD77 A1               [ 4]  204     ret 
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
      00AD78 01 27                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AD7A 03 CC                   32 app_size: .word 0 
      003584                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



                                      1     .area CODE 
                                      2 
      003584                          3  square:
      003584                          4    _at_top  
      00AD7C 97 1F            [ 1]    1     ld a,(y)
      00AD7E 93               [ 1]    2     ldw x,y 
      00AD7E 90 F6            [ 2]    3     ldw x,(1,x)
      003589                          5    _xpush 
      00AD80 93 EE 01 72      [ 2]    1     subw y,#CELL_SIZE
      00AD84 A9 00            [ 1]    2     ld (y),a 
      00AD86 03 4D 26         [ 2]    3     ldw (1,y),x 
      00AD89 08 5D 26         [ 4]    6    call mul24 
      00AD8C 05               [ 4]    7    ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
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
  4 AND        0032D2 R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032CA R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        0032C2 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        0032BA R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       0032B1 R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       0032A8 R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      00329E R   |     BTEST_ID=  000010 
  4 BTOGL      003294 R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        00328C R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002879 R
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
  4 CHAR       003283 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMDX    =  000001 
    CMD_END =  000002     |     CNAME   =  000001     |     CNT     =  000006 
    CNTR    =  000003     |     CNT_LO  =  000004     |     COMMA   =  00002C 
  4 CONST      003279 R   |   4 CONST_CO   001D1C R   |     CONST_ID=  0000B8 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        003271 R   |     CR1_IDX =  00001A     |   4 CR2        003269 R
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
  4 DATA       003260 R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003258 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        003250 R   |     DEC_IDX =  000020     |     DEST    =  000001 
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
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      00323F R
    DREAD_ID=  000024     |   4 DWRITE     003234 R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       00322B R   |     EDIT_IDX=  000028     |   4 EEFREE     003220 R
    EEFREE_I=  0000BA     |   4 EEPROM     003215 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        00320D R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003203 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       0031FA R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001EC3 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        0031F2 R   |     FOR_IDX =  000034 
  4 FREE       0031E9 R   |     FREE_IDX=  00008A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        0031E1 R   |     GET_IDX =  0000B6     |   4 GOSUB      0031D7 R
    GOSUB_ID=  000036     |   4 GOTO       0031CE R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0031C6 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
  4 IDR        0031BE R   |     IDR_IDX =  00003C     |   4 IF         0031B7 R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      0031AD R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     0031A2 R   |     IWDGEN_I=  000042 
  4 IWDGREF    003196 R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        00318E R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        003186 R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0032F0 R   |   4 LIST       00317D R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       003174 R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     003169 R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    N2      =  000008     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        003161 R   |     NEW_IDX =  000052     |   4 NEXT       003158 R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        003150 R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |   4 NOT_SAVE   001FB5 R   |   4 NO_APP     0028BB R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        003148 R   |     ODR_IDX =  000054 
  4 ON         003141 R   |     ONOFF   =  000003     |     ON_IDX  =  0000B4 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         00313A R
    OR_IDX  =  0000FC     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        003132 R
    PAD_IDX =  000056     |     PAD_SIZE=  000080     |   4 PAUSE      003128 R
    PAUSE_ID=  000058     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       00311F R
    PEEK_IDX=  00005C     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  4 PINP       003116 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      00310C R   |     PMODE_ID=  00005A     |   4 POKE       003103 R
    POKE_IDX=  000060     |   4 PORTA      0030E6 R   |   4 PORTB      0030DC R
  4 PORTC      0030D2 R   |   4 PORTD      0030C8 R   |   4 PORTE      0030BE R
  4 PORTF      0030B4 R   |   4 PORTG      0030AA R   |   4 PORTH      0030A0 R
  4 PORTI      003096 R   |   4 POUT       0030FA R   |     POUT_IDX=  000062 
    PREV    =  000001     |   4 PRINT      0030F0 R   |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001E99 R   |   4 PROG_SIZ   001EAB R
    PRTA_IDX=  000066     |     PRTB_IDX=  000068     |     PRTC_IDX=  00006A 
    PRTD_IDX=  00006C     |     PRTE_IDX=  00006E     |     PRTF_IDX=  000070 
    PRTG_IDX=  000072     |     PRTH_IDX=  000074     |     PRTI_IDX=  000076 
    PRT_IDX =  000064     |     PSIZE   =  000001     |     PSTR    =  000003 
  4 QKEY       00308D R   |     QKEY_IDX=  000078     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001ED4 R
    RAM_SIZE=  001800     |     RBT_IDX =  00007C     |   4 READ       003084 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    READ_IDX=  00007A     |   4 REBOOT     003079 R   |     RECLEN  =  000005 
  4 REG_A      00055F R   |   4 REG_CC     000563 R   |   4 REG_EPC    000552 R
  4 REG_SP     000568 R   |   4 REG_X      00055B R   |   4 REG_Y      000557 R
    RELOP   =  000001     |   4 REM        003071 R   |     REM_IDX =  00007E 
  4 RESTORE    003065 R   |     REST_IDX=  000080     |     RETL1   =  000001 
  4 RETURN     00305A R   |     RET_ADDR=  000003     |     RET_BPTR=  000003 
    RET_IDX =  000082     |     RET_INW =  000005     |   4 RND        003052 R
    RND_IDX =  000084     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003047 R   |     RSHIFT_I=  000086     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00303F R   |     RUN_IDX =  000088 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       003036 R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002877 R
  4 SIZE       00302D R   |     SIZE_IDX=  0000B2     |     SKIP    =  000005 
  4 SLEEP      003023 R   |     SLEEP_ID=  00008C     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003019 R
    SPIEN_ID=  000090     |   4 SPIRD      00300F R   |     SPIRD_ID=  00008E 
  4 SPISEL     003004 R   |     SPISEL_I=  000092     |   4 SPIWR      002FFA R
    SPIWR_ID=  000094     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
  4 STATES     000515 R   |   4 STEP       002FF1 R   |     STEP_IDX=  000096 
  4 STOP       002FE8 R   |     STOP_IDX=  000098     |     STR     =  000003 
  4 STR_BYTE   001EBC R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TARGET  =  000001     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      002FDE R   |     TICKS_ID=  00009A     |     TIM1_ARR=  005262 
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
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    002FD2 R   |   4 TIMER      002FC8 R   |     TIMER_ID=  00009C 
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
    TMROUT_I=  00009E     |   4 TO         002FC1 R   |   4 TONE       002FB8 R
    TONE_IDX=  0000A2     |     TOWRITE =  000005     |     TO_IDX  =  0000A0 
  4 Timer4Up   000021 R   |   4 TrapHand   000012 R   |     U8      =  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     002FAD R   |     UBOUND_I=  0000A4     |   4 UBTN_Han   000068 R
  4 UFLASH     002FA2 R   |     UFLASH_I=  0000A6     |   4 UNTIL      002F98 R
    UNTIL_ID=  0000A8     |     UPDATE  =  000006     |     US      =  00001F 
  4 USER_ABO   000070 R   |   4 USR        002F90 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000AA 
  4 Uart1RxH   0008CF R   |   4 UserButt   000044 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       002F87 R   |     WAIT_IDX=  0000AC     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   4 WORDS      002F7D R   |     WORDS_ID=  0000AE 
  4 WRITE      002F73 R   |     WRITE_ID=  0000B0     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        002F6B R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  00003C     |     XTEMP   =  000001     |     YSAVE   =  000007 
    YTEMP   =  000003     |   4 abs        002A7B R   |   4 abs24      0001DF R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BFD R   |   4 add24      00016A R
  4 add_char   00138F R   |   4 add_spac   001160 R   |   4 analog_r   002632 R
  4 and_cond   001B50 R   |   4 and_fact   001B20 R   |   4 app        003584 R
  4 app_sign   003580 R   |   4 app_size   003582 R   |   4 app_spac   003580 GR
  4 arduino_   002B6A R   |   4 arg_list   00195E R   |   5 array_si   000020 R
  4 ascii      00292B R   |   4 at_tst     000FD2 R   |   4 atoi24     001897 GR
  4 atoi_exi   0018FD R   |   4 awu        002A22 R   |   4 awu02      002A35 R
  4 bad_port   0029A6 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       0025A9 R   |   4 beep_1kh   00257C GR  |   4 bin_exit   000E39 R
  4 bit_rese   002197 R   |   4 bit_set    002175 R   |   4 bit_test   0021DC R
  4 bit_togg   0021BA R   |   4 bitmask    002D21 R   |   4 bkslsh_t   000F7F R
  4 bksp       0009A8 R   |   2 block_bu   0016B8 GR  |   4 block_er   0007BD R
  4 break_po   00271E R   |   4 bye        0029EE R   |   4 char       002914 R
  4 clear_ba   0014FB R   |   4 clear_bl   0027CE R   |   4 clear_va   001453 R
  4 clock_in   00008B R   |   4 cloop_1    001DC5 R   |   4 cmd_cons   001D9F R
  4 cmd_end    002548 R   |   4 cmd_get    00254F R   |   4 cmd_itf    00056D R
  4 cmd_line   00172E R   |   4 cmd_name   0013AF R   |   4 cmd_on     002402 R
  4 cmd_size   001C3C R   |   4 code_add   0032F6 GR  |   4 cold_sta   0000C3 R
  4 colon_ts   000FA6 R   |   4 comma_ts   000FB1 R   |   4 comp_msg   00167E R
  4 compile    0010CC GR  |   4 conditio   001BA2 R   |   4 const_cr   002DC9 R
  4 const_cr   002DCE R   |   4 const_dd   002DC4 R   |   4 const_ee   002DDD R
  4 const_id   002DBF R   |   4 const_in   002DD8 R   |   4 const_lo   001DC0 R
  4 const_od   002DBA R   |   4 const_ou   002DD3 R   |   4 const_po   002D8D R
  4 const_po   002D92 R   |   4 const_po   002D97 R   |   4 const_po   002D9C R
  4 const_po   002DA1 R   |   4 const_po   002DA6 R   |   4 const_po   002DAB R
  4 const_po   002DB0 R   |   4 const_po   002DB5 R   |   4 convert_   000DA9 R
  4 convert_   00096C R   |   4 copy_com   001007 R   |   5 count      000003 GR
  4 cp24       0001A4 R   |   4 cp24_ax    0001D6 R   |   4 cp_loop    00190F R
  4 cpl24      0001E6 R   |   4 cpy_cmd_   001148 R   |   4 cpy_quot   001188 R
  4 create_g   000CD3 R   |   4 cs_high    002F5F R   |   4 dash_tst   000FC7 R
  4 data       002DE2 R   |   4 data_err   002E5B R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001C1B R
  4 decomp_l   001241 R   |   4 decompil   0011F9 GR  |   4 del_line   000CA6 R
  4 delete_l   000A95 R   |   4 delete_n   0009B8 R   |   4 delete_u   000A5A R
  4 digital_   00266E R   |   4 digital_   0026A5 R   |   4 div24      000324 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 divu24_8   000306 R   |   4 do_loop    002D47 R   |   4 do_progr   0007B0 R
  4 edit       001F88 R   |   4 enable_i   002CB1 R   |   4 eql_tst    001052 R
  4 equal      0013A2 R   |   4 erase      002746 R   |   4 erase_ex   0007E1 R
  4 erase_fl   0007D7 R   |   4 err_bad_   0015DF R   |   4 err_buf_   001655 R
  4 err_cmd_   0015A3 R   |   4 err_div0   001568 R   |   4 err_dupl   0015BD R
  4 err_math   00154F R   |   4 err_mem_   001534 R   |   4 err_msg    001512 R
  4 err_no_a   0015EB R   |   4 err_no_d   00161E R   |   4 err_no_f   001642 R
  4 err_no_l   001577 R   |   4 err_no_p   00162E R   |   4 err_not_   0015CE R
  4 err_over   001662 R   |   4 err_run_   00158D R   |   4 err_synt   001541 R
  4 escaped    000DBE GR  |   4 expect     00194C R   |   4 expressi   001A89 R
  4 factor     0019AA R   |   5 farptr     000018 R   |   4 fcpu       002AEC R
  4 fetchc     00065D R   |   4 fill_wri   0027BE R   |   4 final_te   000BF6 R
  4 first_li   001F32 R   |   5 flags      000022 GR  |   4 for        002272 R
  4 free       001C20 R   |   5 free_eep   000024 R   |   7 free_ram   000080 R
  4 func_arg   001959 R   |   4 func_eef   001D32 R   |   4 ge         0013A4 R
  4 get_addr   0017D5 R   |   4 get_arra   00197A R   |   4 get_char   0017EF R
  4 get_cmd_   0011D8 R   |   4 get_code   0017B9 R   |   4 get_cons   001CB7 R
  4 get_esca   000978 R   |   4 get_int2   0017DF R   |   4 get_targ   002393 R
  4 get_targ   0023A1 R   |   4 get_tick   002A74 R   |   4 get_toke   000F18 GR
  4 getc       000951 GR  |   4 gosub      0024A8 R   |   4 gosub_1    0024B3 R
  4 gosub_2    0024B9 R   |   4 goto       00248E R   |   4 goto_1     002498 R
  4 gpio       00297B R   |   4 gt         0013A0 R   |   4 gt_tst     00105D R
  4 hex_base   001C16 R   |   4 hex_dump   00069D R   |   4 if         002255 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   0008B3 R   |   4 input_ex   00212D R   |   4 input_lo   002097 R
  4 input_va   002093 R   |   4 insert_c   000A17 R   |   4 insert_l   000CFF R
  4 insert_l   000D6E R   |   4 interp_l   00176F R   |   4 interpre   00174A R
  4 invalid    0005B2 R   |   4 invalid_   000633 R   |   4 is_alnum   000E6C GR
  4 is_alpha   000E52 GR  |   4 is_data_   002DE8 R   |   4 is_digit   000E63 GR
  4 is_symbo   000E75 R   |   4 itoa       001832 GR  |   4 itoa_loo   001854 R
  4 jp_to_ta   00249B R   |   4 key        00296A R   |   4 kword_di   0032EE GR
  4 kword_en   002F69 R   |   4 le         0013A9 R   |   4 ledoff     000468 R
  4 ledon      000463 R   |   4 ledtoggl   00046D R   |   4 left_par   000476 R
  4 let        001C74 GR  |   4 let_arra   001C82 R   |   4 let_eval   001C8A R
  4 let_var    001C87 R   |   4 lines_sk   001F35 R   |   4 list       001EE3 R
  4 list_con   001CC6 R   |   4 list_exi   001F77 R   |   4 list_loo   001F55 R
  4 log2       002CF4 R   |   4 look_tar   0023C4 R   |   4 loop_bac   002376 R
  5 loop_dep   00001F R   |   4 loop_don   00238B R   |   4 lshift     002A92 R
  4 lt         0013A7 R   |   4 lt_tst     001086 R   |   4 mem_peek   0005CF R
  4 mod24      0003D2 R   |   4 move       00140F GR  |   4 move_dow   00142E R
  4 move_era   00073F R   |   4 move_exi   00144F R   |   4 move_lef   0009EF R
  4 move_loo   001433 R   |   4 move_prg   00077F R   |   4 move_rig   0009FD R
  4 move_up    001420 R   |   4 mul24      00025C R   |   4 mul_char   001391 R
  4 mulu24_8   000226 R   |   4 nbr_tst    000F4B R   |   4 ne         0013AC R
  4 neg24      0001EF R   |   4 neg_acc2   000209 R   |   4 neg_ax     000201 R
  4 new        00273C R   |   4 next       00231E R   |   4 next_lin   001752 R
  4 next_tok   0017A0 GR  |   4 no_match   001921 R   |   4 number     000663 R
  4 other      0010AF R   |   4 overwrit   000C22 R   |   2 pad        0016B8 GR
  4 pad_ref    002F64 R   |   4 parse_bi   000E17 R   |   4 parse_in   000DC6 R
  4 parse_ke   000E98 R   |   4 parse_qu   000D71 R   |   4 parse_sy   000E80 R
  4 pause      002A02 R   |   4 pause02    002A15 R   |   4 peek       002234 R
  4 peek_byt   0005FD R   |   4 pin_mode   002AFB R   |   4 plus_tst   001026 R
  4 poke       002213 R   |   4 power_ad   0025E2 R   |   4 prcnt_ts   001047 R
  4 print      001FF0 R   |   4 print_fa   000642 R   |   4 print_he   000C59 GR
  4 print_re   0004C2 R   |   4 print_st   0005C2 R   |   4 print_to   00181A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

  4 prog_siz   001E52 R   |   4 program_   001E5A R   |   4 program_   000759 R
  4 program_   00077F R   |   4 prt_acc2   00180C R   |   4 prt_basi   001FCC R
  4 prt_i16    0017F5 R   |   4 prt_loop   001FF4 R   |   4 prt_peek   000445 GR
  4 prt_reg1   0004A3 R   |   4 prt_reg8   000481 R   |   4 prt_regs   0003DB GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000941 GR
  4 puts       00099E GR  |   4 qgetc      00094A GR  |   4 qkey       00296E GR
  4 qmark_ts   000FDD R   |   4 qsign      0027B7 R   |   4 random     002B8A R
  4 read       002E60 R   |   4 read01     002E65 R   |   4 read_int   003523 R
  4 readln     000AA3 GR  |   4 readln_l   000AB2 R   |   4 readln_q   000C3F R
  4 refresh_   002CEF R   |   4 regs_sta   00041E R   |   4 relation   001AC1 R
  4 relop_st   001394 R   |   4 remark     002132 GR  |   4 repl       00057B R
  4 repl_exi   0005A3 R   |   4 reset_co   001FF2 R   |   4 rest_con   002083 R
  4 restore    002DF6 R   |   4 return     0024CE R   |   4 right_al   001176 GR
  4 row_alig   000898 R   |   4 row_eras   000712 R   |   4 row_eras   00073F R
  4 row_loop   000680 R   |   4 rparnt_t   000F9B R   |   4 rshift     002ABF R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     00166C R
  4 run        0024EC R   |   4 run_app    000135 R   |   4 run_it     00251E R
  4 run_it_0   002520 R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027E2 R   |   4 save_con   002073 R
  4 scan_blo   0008C1 R   |   4 search_c   001D5B R   |   4 search_d   001901 GR
  4 search_e   001949 R   |   4 search_l   000C7B GR  |   4 search_l   000C8A R
  4 search_n   001905 R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002B5A R   |   4 send_esc   0009C6 R   |   4 send_par   0009D1 R
  4 set_data   002E2C R   |   4 set_time   002C8F R   |   4 sharp_ts   000FBC R
  4 show_row   00066E R   |   4 single_c   00138A R   |   4 skip       000F05 R
  4 skip_str   0017C6 R   |   4 slash_ts   00103C R   |   4 sleep      0029F7 R
  4 software   001462 R   |   4 spaces     000A0B GR  |   4 spi_clea   002EF9 R
  4 spi_disa   002EE1 R   |   4 spi_enab   002EAE R   |   4 spi_rcv_   002F1B R
  4 spi_read   002F46 R   |   4 spi_sele   002F4D R   |   4 spi_send   002F05 R
  4 spi_writ   002F26 R   |   4 square     003584 R   |   2 stack_fu   001774 GR
  2 stack_un   001800 R   |   4 star_tst   001031 R   |   4 step       0022DC R
  4 stop       0026F0 R   |   4 store_lo   00230B R   |   4 str_matc   00192E R
  4 str_tst    000F3B R   |   4 strcmp     0013EE R   |   4 strcpy     0013FF GR
  4 strlen     0013E3 GR  |   4 sub24      000187 R   |   4 symb_loo   000E81 R
  4 syntax_e   00169F GR  |   4 system_i   0014A8 R   |   5 tab_widt   000023 GR
  4 tb_error   0016A1 GR  |   4 term       001A46 R   |   4 term01     001A4E R
  4 term_exi   001A86 R   |   4 test       0033B4 R   |   4 test_p     0005BA R
  2 tib        001668 GR  |   4 tick_tst   000FF5 R   |   5 ticks      00000F R
  4 timeout    002CA6 R   |   5 timer      000012 GR  |   4 timer2_i   0000A1 R
  4 timer4_i   0000AE R   |   4 tk_id      00168F R   |   4 to         00229C R
  4 to_eepro   0007A8 R   |   4 to_flash   0007AD R   |   4 to_hex_c   000C70 GR
  4 to_upper   00188B GR  |   4 token_ch   0010C5 R   |   4 token_ex   0010C9 R
  4 tone       002587 R   |   4 try_next   002E39 R   |   5 txtbgn     00001B GR
  5 txtend     00001D GR  |   4 uart1_ge   000951 GR  |   4 uart1_in   0008FC R
  4 uart1_pu   000941 GR  |   4 uart1_qg   00094A GR  |   4 uart1_se   00090C R
  4 ubound     001C69 R   |   4 uflash     0029AB R   |   4 unlock_e   0006DC R
  4 unlock_f   0006F7 R   |   4 until      002D5A R   |   4 user_int   000057 R
  4 usr        0029C8 R   |   4 var_name   0011CE GR  |   5 vars       000030 GR
  4 wait       002138 R   |   4 warm_ini   0014D9 R   |   4 warm_sta   00172B R
  4 words      002C25 R   |   4 words_co   002C79 R   |   4 write      0028D1 R
  4 write_bl   00085D GR  |   4 write_bu   000799 R   |   4 write_by   0007E3 R
  4 write_ee   00081F R   |   4 write_ex   000858 R   |   4 write_fl   000809 R
  4 write_nb   000882 R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3596   flags    0
   5 DATA       size     7E   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

