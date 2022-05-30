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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
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
      008050 82 00 89 1E             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      008096 CD 85 11         [ 4]  120 	call print_registers
      008099 CD 85 BC         [ 4]  121 	call cmd_itf
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
      0080E5 CD 89 ED         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 53         [ 2]  179 5$:	jp warm_start
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
      00818E CD 89 4B         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9D 78         [ 4]  280 	call func_eefree 
      0081A1 CD 9C AF         [ 4]  281 	call ubound 
      0081A4 CD 95 23         [ 4]  282 	call clear_basic
      0081A7 CD A5 DA         [ 4]  283 	call beep_1khz  
      0081AA CD 94 D0         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 15         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 53         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 01         [ 4]  293 	call warm_init
      0081BC AE B5 04         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B5 02      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 89 ED         [ 4]  299 	call puts 
      0081CF CD 9E A0         [ 4]  300 	call program_info 
      0081D2 CC A5 7E         [ 2]  301 	jp run_it_02  
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
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
                                    157 ;	xstack	    uint24_t 
                                    158 ;   a	        uint8_t
                                    159 ; output:
                                    160 ;   A:X     product 
                                    161 ;   acc32   overflow, bits 31..24 
                                    162 ;-------------------------------------
                                    163 ; local variables offset  on sp
                           000001   164 	U8   = 1 
                           000001   165     VSIZE=1 
      000226                        166 mulu24_8:
      008281 43               [ 1]  167     push a 
      008282 53 1C 00 01      [ 1]  168 	clr acc32
      008286 A9 00 81 0C      [ 1]  169     clr acc24  
                                    170 ; multiply top bits 7..0 * U8   	
      008289 90 E6 02         [ 1]  171     ld a,(2,Y) ; top least byte  
      008289 72               [ 1]  172     ld xl,a 
      00828A 53 00            [ 1]  173     ld a,(U8,sp)
      00828C 0D               [ 4]  174     mul x,a 
      00828D 72 53 00         [ 2]  175     ldw acc16,x 
                                    176 ; multiply top bits 15..8 * U8     
      008290 0E 72 53         [ 1]  177     ld a,(1,Y) ; top middle byte 
      008293 00               [ 1]  178     ld xl,a 
      008294 0F 72            [ 1]  179     ld a,(U8,sp) 
      008296 5C               [ 4]  180     mul x,a 
      008297 00 0F 26 0A      [ 2]  181     addw x,acc24
      00829B 72 5C 00 0E      [ 1]  182     rlc acc32 
      00829F 26 04 72         [ 2]  183     ldw acc24,x 
                                    184 ; multiply top bits 23..16 * 8 
      0082A2 5C 00            [ 1]  185     ld a,(Y)
      0082A4 0D               [ 1]  186     ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0082A5 81 01            [ 1]  187     ld a,(U8,sp)
      0082A6 42               [ 4]  188     mul x,a 
      0082A6 88 72 5F 00      [ 2]  189     addw x,acc32
      0082AA 0C               [ 1]  190     rlwa x 
      0082AB 72               [ 1]  191     tnz a 
      0082AC 5F 00            [ 1]  192     jreq 1$
      0082AE 0D 90            [ 1]  193     ld a,#ERR_OVERFLOW
      0082B0 E6 02 97         [ 2]  194     jp tb_error 
      00025E                        195 1$:
      0082B3 7B               [ 1]  196     ld a,xh  
      0082B4 01 42 CF         [ 2]  197     ldw x,acc16   
      000262                        198     _drop VSIZE 
      0082B7 00 0E            [ 2]    1     addw sp,#VSIZE 
      0082B9 90               [ 4]  199     ret
                                    200 
                                    201 
                                    202 ;-------------------------------
                                    203 ; mul24 i1 i2 -- i1*i2  
                                    204 ; multiply 24 bits integers 
                                    205 ;------------------------------
                           000001   206     PROD=1 
                           000004   207     PROD_SIGN=4
                           000005   208     N1=5
                           000007   209     VSIZE=7  
      000265                        210 mul24:
      000265                        211     _vars VSIZE
      0082BA E6 01            [ 2]    1     sub sp,#VSIZE 
      0082BC 97               [ 1]  212     clrw x 
      0082BD 7B 01            [ 2]  213     ldw (PROD,sp),x 
      0082BF 42 72            [ 2]  214     ldw (PROD+2,sp),x
      00026C                        215     _xpop 
      0082C1 BB 00            [ 1]    1     ld a,(y)
      0082C3 0D               [ 1]    2     ldw x,y 
      0082C4 72 59            [ 2]    3     ldw x,(1,x)
      0082C6 00 0C CF 00      [ 2]    4     addw y,#CELL_SIZE 
      0082CA 0D               [ 1]  216     tnz a 
      0082CB 90 F6            [ 1]  217     jrpl 0$
      0082CD 97 7B            [ 1]  218     cpl (PROD_SIGN,sp)
      0082CF 01 42 72         [ 4]  219     call neg_ax 
      00027D                        220 0$:    
      0082D2 BB 00            [ 1]  221     ld (N1,sp),a 
      0082D4 0C 02            [ 2]  222     ldw (N1+1,sp),x
      0082D6 4D 27            [ 1]  223     tnz (Y)
      0082D8 05 A6            [ 1]  224     jrpl 2$ 
      0082DA 10 CC            [ 1]  225     cpl (PROD_SIGN,sp) 
      0082DC 96 C9 EF         [ 4]  226     call neg24
      0082DE                        227 2$: 
      0082DE 9E CE            [ 1]  228     ld a,(N1+2,sp); least byte     
      0082E0 00 0E            [ 1]  229     jreq 4$
      0082E2 5B 01 81         [ 4]  230     call mulu24_8
      0082E5 4D               [ 1]  231     tnz a 
      0082E5 52 07            [ 1]  232     jrmi 8$ ; overflow  
      0082E7 5F 1F            [ 1]  233     ld (PROD,sp),a
      0082E9 01 1F            [ 2]  234     ldw (PROD+1,sp),x 
      000298                        235 4$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0082EB 03 90            [ 1]  236     ld a,(N1+1,sp); middle byte     
      0082ED F6 93            [ 1]  237     jreq 5$
      0082EF EE 01 72         [ 4]  238     call mulu24_8
      0082F2 A9               [ 1]  239     tnz a 
      0082F3 00 03            [ 1]  240     jrne 8$  ; overflow 
      0082F5 4D 2A 05         [ 2]  241     addw x,(PROD,sp)
      0082F8 03 04            [ 1]  242     jrv 8$ ; overflow
      0082FA CD 82            [ 2]  243     ldw (PROD,sp),x 
      0002A9                        244 5$:
      0082FC 81 05            [ 1]  245     ld a,(N1,sp) ; high byte 
      0082FD 27 10            [ 1]  246     jreq 6$
      0082FD 6B 05 1F         [ 4]  247     call mulu24_8
      008300 06               [ 1]  248     rrwa x 
      008301 90               [ 2]  249     tnzw x 
      008302 7D 2A            [ 1]  250     jrne 8$ ; overflow 
      008304 05               [ 1]  251     tnz a 
      008305 03 04            [ 1]  252     jrmi 8$ ; overflow 
      008307 CD 82            [ 1]  253     add a,(PROD,sp)
      008309 6F 01            [ 1]  254     ld (PROD,sp),a 
      00830A 29 13            [ 1]  255     jrv 8$ ; overflow 
      0002BD                        256 6$:
      00830A 7B 07            [ 1]  257     ld a,(PROD,sp)
      00830C 27 0A            [ 2]  258     ldw x,(PROD+1,sp)
      00830E CD 82            [ 1]  259     tnz (PROD_SIGN,sp)
      008310 A6 4D            [ 1]  260     jreq 9$
      008312 2B 3C 6B         [ 4]  261     call neg_ax 
      0002C8                        262 9$:
      0002C8                        263     _store_top 
      008315 01 1F            [ 1]    1     ld (y),a 
      008317 02 EF 01         [ 2]    2     ldw (1,y),x     
      008318                        264     _drop VSIZE 
      008318 7B 06            [ 2]    1     addw sp,#VSIZE 
      00831A 27               [ 4]  265     ret 
      0002D0                        266 8$: ; overflow
      00831B 0D CD            [ 1]  267     ld a,#ERR_OVERFLOW
      00831D 82 A6 4D         [ 2]  268     jp tb_error 
                                    269 
                                    270 ;-------------------------------------
                                    271 ; divide uint24_t by uint8_t
                                    272 ; input:
                                    273 ;	acc24	dividend
                                    274 ;   A 		divisor
                                    275 ; output:
                                    276 ;   acc24	quotient
                                    277 ;   A		remainder
                                    278 ;------------------------------------- 
                                    279 ; offset  on sp of arguments and locals
                           000001   280 	U8   = 1   ; divisor on stack
                           000001   281 	VSIZE =1
      0002D5                        282 divu24_8:
      008320 26               [ 2]  283 	pushw x ; save x
      008321 2E               [ 1]  284 	push a 
                                    285 	; ld dividend UU:MM bytes in X
      008322 72 FB 01         [ 2]  286 	ldw x,acc24
      008325 29 29            [ 1]  287 	ld a,(U8,SP) ; divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008327 1F               [ 2]  288 	div x,a ; UU:MM/U8
      008328 01               [ 1]  289 	push a  ;save remainder
      008329 CF 00 0C         [ 2]  290     ldw acc24,x ; quotient 
      008329 7B               [ 1]  291 	pop a
      00832A 05               [ 1]  292 	ld xh,a
      00832B 27 10 CD         [ 1]  293 	ld a,acc8
      00832E 82               [ 1]  294 	ld xl,a
      00832F A6 01            [ 1]  295 	ld a,(U8,sp) ; divisor
      008331 5D               [ 2]  296 	div x,a  ; R:LL/U8
      008332 26 1C            [ 1]  297 	ld (U8,sp),a ; save remainder
      008334 4D               [ 1]  298 	ld a,xl
      008335 2B 19 1B         [ 1]  299 	ld acc8,a
      008338 01               [ 1]  300 	pop a
      008339 6B               [ 2]  301 	popw x
      00833A 01               [ 4]  302 	ret
                                    303 
                                    304 
                                    305 ;-------------------------------
                                    306 ; div24 N/T   
                                    307 ; divide 24 bits integers
                                    308 ;  i1 i2 -- i1/i2 
                                    309 ;------------------------------
                           000001   310     DIVISOR=1
                           000004   311     CNTR=4
                           000005   312     QSIGN=5
                           000006   313     RSIGN=6 
                           000006   314     VSIZE=6 
      0002F3                        315 div24:
      0002F3                        316     _vars VSIZE 
      00833B 29 13            [ 2]    1     sub sp,#VSIZE 
      00833D 0F 06            [ 1]  317     clr (RSIGN,sp)
      00833D 7B 01            [ 1]  318     clr (QSIGN,sp)
      0002F9                        319     _xpop 
      00833F 1E 02            [ 1]    1     ld a,(y)
      008341 0D               [ 1]    2     ldw x,y 
      008342 04 27            [ 2]    3     ldw x,(1,x)
      008344 03 CD 82 81      [ 2]    4     addw y,#CELL_SIZE 
      008348 4D               [ 1]  320     tnz a 
      008348 90 F7            [ 1]  321     jrpl 0$ 
      00834A 90 EF            [ 1]  322     cpl (QSIGN,sp)
      00834C 01 5B 07         [ 4]  323     call neg_ax
      00030A                        324 0$:
      00834F 81 01            [ 1]  325     ld  (DIVISOR,sp),a
      008350 1F 02            [ 2]  326     ldw (DIVISOR+1,sp),x
      008350 A6 10            [ 1]  327     or a,(DIVISOR+1,sp)
      008352 CC 96            [ 1]  328     or a,(DIVISOR+2,sp)
      008354 C9 05            [ 1]  329     jrne 1$ 
      008355 A6 04            [ 1]  330     ld a,#ERR_DIV0 
      008355 89 88 CE         [ 2]  331     jp tb_error 
      000319                        332 1$: 
      000319                        333     _at_top
      008358 00 0D            [ 1]    1     ld a,(y)
      00835A 7B               [ 1]    2     ldw x,y 
      00835B 01 62            [ 2]    3     ldw x,(1,x)
      00835D 88               [ 1]  334     tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00835E CF 00            [ 1]  335     jrpl 2$
      008360 0D 84 95         [ 4]  336     call neg_ax
      008363 C6 00            [ 1]  337     cpl (QSIGN,sp)
      008365 0F 97            [ 1]  338     cpl (RSIGN,sp)
      000328                        339 2$: 
      008367 7B 01 62         [ 1]  340     ld acc24,a 
      00836A 6B 01 9F         [ 2]  341     ldw acc16,x 
      00836D C7 00            [ 1]  342     ld a,#24 
      00836F 0F 84            [ 1]  343     ld (CNTR,sp),a
      008371 85 81            [ 1]  344     ld a,(DIVISOR,sp)
      008373 1E 02            [ 2]  345     ldw x,(DIVISOR+1,sp)
      008373 52 06 0F         [ 4]  346     call cp24_ax ; A:X-acc24 ?
      008376 06 0F            [ 2]  347     jrule 22$ 
                                    348 ; quotient=0, remainder=divisor      
      008378 05 90 F6         [ 1]  349     ld a,acc24 
      00837B 93 EE 01         [ 2]  350     ldw x,acc16 
      00837E 72 A9 00 03      [ 1]  351     clr acc24 
      008382 4D 2A 05 03      [ 1]  352     clr acc16 
      008386 05 CD 82 81      [ 1]  353     clr acc8 
      00838A 20 2E            [ 2]  354     jra 6$
      00034F                        355 22$:     
      00838A 6B               [ 1]  356     clr a 
      00838B 01               [ 1]  357     clrw x 
      00838C 1F               [ 1]  358     rcf  
      000352                        359 3$: 
      00838D 02 1A 02 1A      [ 1]  360     rlc acc8 
      008391 03 26 05 A6      [ 1]  361     rlc acc16
      008395 04 CC 96 C9      [ 1]  362     rlc acc24 
      008399 59               [ 2]  363     rlcw x  
      008399 90               [ 1]  364     rlc a
      00839A F6 93 EE         [ 2]  365 4$: subw x,(DIVISOR+1,sp) 
      00839D 01 4D            [ 1]  366     sbc a,(DIVISOR,sp)
      00839F 2A 07            [ 1]  367     jrnc 5$
      0083A1 CD 82 81         [ 2]  368     addw x,(DIVISOR+1,sp)
      0083A4 03 05            [ 1]  369     adc a,(DIVISOR,sp)
      00036C                        370 5$: ; shift carry in QUOTIENT 
      0083A6 03               [ 1]  371     ccf
      0083A7 06 04            [ 1]  372     dec (CNTR,sp)
      0083A8 26 E1            [ 1]  373     jrne 3$ 
      0083A8 C7 00 0D CF      [ 1]  374     rlc acc8 
      0083AC 00 0E A6 18      [ 1]  375     rlc acc16 
      0083B0 6B 04 7B 01      [ 1]  376     rlc acc32 
      00037D                        377 6$:    
      0083B4 1E 02            [ 1]  378     ld (DIVISOR,sp),a 
      0083B6 CD 82            [ 2]  379     ldw (DIVISOR+1,sp),x 
      0083B8 56 23 14         [ 1]  380     ld a,acc24 
      0083BB C6 00 0D         [ 2]  381     ldw x,acc16 
      0083BE CE 00            [ 1]  382     tnz (QSIGN,sp)
      0083C0 0E 72            [ 1]  383     jreq 8$
      0083C2 5F 00 0D         [ 4]  384     call neg_ax 
      00038E                        385 8$: 
      00038E                        386     _store_top 
      0083C5 72 5F            [ 1]    1     ld (y),a 
      0083C7 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083CA 5F 00            [ 1]  387     ld a,(DIVISOR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      0083CC 0F 20            [ 2]  388     ldw x,(DIVSOR+1,sp)
      000397                        389 81$:
      0083CE 2E 06            [ 1]  390     tnz (RSIGN,sp)
      0083CF 27 03            [ 1]  391     jreq 9$
      0083CF 4F 5F 98         [ 4]  392     call neg_ax       
      0083D2                        393 9$: _drop VSIZE 
      0083D2 72 59            [ 2]    1     addw sp,#VSIZE 
      0083D4 00               [ 4]  394     ret 
                                    395 
                                    396 
                                    397 ;-------------------------------
                                    398 ; mod24 A:X % acc24 
                                    399 ; remainder 24 bits integers 
                                    400 ; input:
                                    401 ;    acc24   dividend 
                                    402 ;    A:X     divisor 
                                    403 ; output:
                                    404 ;    acc24   acc24 % A:X 
                                    405 ;------------------------------
      0003A1                        406 mod24:
      0083D5 0F 72 59         [ 4]  407     call div24 
      0003A4                        408     _store_top  ; replace quotient by remainder 
      0083D8 00 0E            [ 1]    1     ld (y),a 
      0083DA 72 59 00         [ 2]    2     ldw (1,y),x     
      0083DD 0D               [ 4]  409     ret 
                                    410 
                                    411 
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
      0003AA                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003AA                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003AA                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003AA                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003AA                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003AA                         37 prt_regs::
      0083DE 59 49 72         [ 2]   38 	ldw x,#regs_state 
      0083E1 F0 02 12         [ 4]   39 	call puts
                                     40 ; register PC
      0083E4 01 24            [ 2]   41 	ldw y,(1,sp)
      0083E6 05 72 FB         [ 2]   42 	ldw x,#REG_EPC 
      0083E9 02 19 01         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      0083EC 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      0083EC 8C 0A 04         [ 2]   46 	ldw x,#REG_CC 
      0083EF 26 E1 72         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      0083F2 59 00            [ 1]   49 	ld a,(R_A,sp)
      0083F4 0F 72 59         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0083F7 00 0E 72         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      0083FA 59 00            [ 2]   53 	ldw y,(R_X,sp)
      0083FC 0C 05 2A         [ 2]   54 	ldw x,#REG_X 
      0083FD CD 04 72         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      0083FD 6B 01            [ 2]   57 	ldw y,(R_Y,sp)
      0083FF 1F 02 C6         [ 2]   58 	ldw x,#REG_Y 
      008402 00 0D CE         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      008405 00 0E            [ 1]   61 	ldw y,sp
      008407 0D 05 27 03      [ 2]   62 	addw y,#6+ARG_OFS  
      00840B CD 82 81         [ 2]   63 	ldw x,#REG_SP
      00840E CD 04 72         [ 4]   64 	call prt_reg16
      00840E 90 F7            [ 1]   65 	ld a,#CR 
      008410 90 EF 01         [ 4]   66 	call putc
      008413 7B 01 1E         [ 4]   67 	call putc   
      008416 02               [ 4]   68 	ret 
                                     69 
                                     70 
      008417 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      000414                         81 prt_peek::
      008417 0D               [ 2]   82 	pushw x 
      008418 06 27 03 CD      [ 1]   83 	mov base,#16 
      00841C 82 81 5B         [ 4]   84 	call prt_i16  
      00841F 06 81            [ 1]   85 	ld a,#': 
      008421 CD 09 10         [ 4]   86 	call putc 
      008421 CD 83            [ 1]   87 	ld a,#SPACE 
      008423 73 90 F7         [ 4]   88 	call putc 
      008426 90               [ 2]   89 	popw x 
      008427 EF               [ 1]   90 	ld a,(x)
      008428 01               [ 1]   91 	clrw x 
      008429 81               [ 1]   92 	ld xl,a 
      00842A 35 0A 00 0A      [ 1]   93 	mov base,#10 
      00842A AE 84 6D         [ 4]   94 	call prt_i16 
      00842D CD               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      000432                        102 ledon:
      00842E 89 ED 16 01      [ 1]  103     bset PC_ODR,#LED2_BIT
      008432 AE               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      000437                        107 ledoff:
      008433 85 A1 CD 84      [ 1]  108     bres PC_ODR,#LED2_BIT 
      008437 F2               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      00043C                        112 ledtoggle:
      008438 7B 08            [ 1]  113     ld a,#LED2_MASK
      00843A AE 85 B2         [ 1]  114     xor a,PC_ODR
      00843D CD 84 D0         [ 1]  115     ld PC_ODR,a
      008440 7B               [ 4]  116     ret 
                                    117 
      000445                        118 left_paren:
      008441 07 AE            [ 1]  119 	ld a,#SPACE 
      008443 85 AE CD         [ 4]  120 	call putc
      008446 84 D0            [ 1]  121 	ld a,#'( 
      008448 16 05 AE         [ 4]  122 	call putc 	
      00844B 85               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      000450                        133 prt_reg8:
      00844C AA               [ 1]  134 	push a 
      00844D CD 84 F2         [ 4]  135 	call puts 
      008450 16 03            [ 1]  136 	ld a,(1,sp) 
      008452 AE               [ 1]  137 	clrw x 
      008453 85               [ 1]  138 	ld xl,a 
      008454 A6 CD 84 F2      [ 1]  139 	mov base,#16
      008458 90 96 72         [ 4]  140 	call prt_i16  
      00845B A9 00 08         [ 4]  141 	call left_paren 
      00845E AE               [ 1]  142 	pop a 
      00845F 85               [ 1]  143 	clrw x 
      008460 B7               [ 1]  144 	ld xl,a 
      008461 CD 84 F2 A6      [ 1]  145 	mov base,#10 
      008465 0D CD 89         [ 4]  146 	call prt_i16  
      008468 90 CD            [ 1]  147 	ld a,#') 
      00846A 89 90 81         [ 4]  148 	call putc
      00846D 0A               [ 4]  149 	ret
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
      000472                        159 prt_reg16: 
      00846E 72 65            [ 2]  160 	pushw y 
      008470 67 69 73         [ 4]  161 	call puts 
      008473 74 65            [ 2]  162 	ldw x,(1,sp) 
      008475 72 73 20 73      [ 1]  163 	mov base,#16 
      008479 74 61 74         [ 4]  164 	call prt_i16  
      00847C 65 0A 2D         [ 4]  165 	call left_paren 
      00847F 2D               [ 2]  166 	popw x 
      008480 2D 2D 2D 2D      [ 1]  167 	mov base,#10 
      008484 2D 2D 2D         [ 4]  168 	call prt_i16  
      008487 2D 2D            [ 1]  169 	ld a,#') 
      008489 2D 2D 2D         [ 4]  170 	call putc
      00848C 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      000491                        177 print_registers:
      00848D 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      008490 2D 2D 0A         [ 4]  179 	call puts
                                    180 ; print EPC 
      008493 00 05 21         [ 2]  181 	ldw x, #REG_EPC
      008494 CD 09 6D         [ 4]  182 	call puts 
      008494 89 35            [ 1]  183 	ld a, (11,sp)
      008496 10 00 0B         [ 1]  184 	ld acc8,a 
      008499 CD 98            [ 1]  185 	ld a, (10,sp) 
      00849B 16 A6 3A         [ 1]  186 	ld acc16,a 
      00849E CD 89            [ 1]  187 	ld a,(9,sp) 
      0084A0 90 A6 20         [ 1]  188 	ld acc24,a
      0084A3 CD               [ 1]  189 	clrw x  
      0084A4 89 90            [ 1]  190 	ld a,#16
      0084A6 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084A9 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084AC 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084AE CD 98 16         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084B1 81 05 26         [ 2]  197 	ldw x,#REG_Y
      0084B2 16 07            [ 2]  198 	ldw y, (7,sp)
      0084B2 72 1A 50         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084B5 0A 81 2E         [ 2]  201 	ldw x,#REG_A
      0084B7 7B 04            [ 1]  202 	ld a, (4,sp) 
      0084B7 72 1B 50         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084BA 0A 81 32         [ 2]  205 	ldw x,#REG_CC 
      0084BC 7B 03            [ 1]  206 	ld a, (3,sp) 
      0084BC A6 20 C8         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084BF 50 0A C7         [ 2]  209 	ldw x,#REG_SP
      0084C2 50 0A            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0084C4 81 A9 00 0C      [ 2]  211 	addw y,#12
      0084C5 CD 04 72         [ 4]  212 	call prt_reg16  
      0084C5 A6 20            [ 1]  213 	ld a,#'\n' 
      0084C7 CD 89 90         [ 4]  214 	call putc
      0084CA A6               [ 4]  215 	ret
                                    216 
      0084CB 28 CD 89 90 81 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0084D0 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      0084D0 88 CD 89 ED            219 REG_Y:   .asciz "\nY:" 
      0084D4 7B 01 5F 97            220 REG_X:   .asciz "\nX:"
      0084D8 35 10 00 0B            221 REG_A:   .asciz "\nA:" 
      0084DC CD 98 16 CD 84         222 REG_CC:  .asciz "\nCC:"
      0084E1 C5 84 5F 97 35         223 REG_SP:  .asciz "\nSP:"
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
      00053C                        235 cmd_itf:
      0084E6 0A 00            [ 2]  236 	sub sp,#VSIZE 
      0084E8 0B CD 98 16      [ 1]  237 	clr farptr 
      0084EC A6 29 CD 89      [ 1]  238 	clr farptr+1 
      0084F0 90 81 00 1A      [ 1]  239 	clr farptr+2  
      0084F2                        240 repl:
      0084F2 90 89            [ 1]  241 	ld a,#CR 
      0084F4 CD 89 ED         [ 4]  242 	call putc 
      0084F7 1E 01            [ 1]  243 	ld a,#'? 
      0084F9 35 10 00         [ 4]  244 	call putc
      0084FC 0B CD 98 16      [ 1]  245 	clr in.w 
      008500 CD 84 C5 85      [ 1]  246 	clr in 
      008504 35 0A 00         [ 4]  247 	call readln
      008507 0B CD 98 16      [ 2]  248 	ldw y,#tib  
      00850B A6 29            [ 1]  249 	ld a,(y)
      00850D CD 89            [ 1]  250 	jreq repl  
      00850F 90 81 00 01      [ 1]  251 	inc in 
      008511 CD 18 2C         [ 4]  252 	call to_upper 
      008511 AE 85            [ 1]  253 	cp a,#'Q 
      008513 64 CD            [ 1]  254 	jrne test_p
      000572                        255 repl_exit:
      008515 89 ED AE 85      [ 1]  256 	clr tib 
      008519 A1 CD 89 ED      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00851D 7B 0B C7 00      [ 1]  258 	clr in 
      00057E                        259 	_drop #VSIZE 	
      008521 0F 7B            [ 2]    1     addw sp,##VSIZE 
      008523 0A               [ 4]  260 	ret  
      000581                        261 invalid:
      008524 C7 00 0E         [ 2]  262 	ldw x,#invalid_cmd 
      008527 7B 09 C7         [ 4]  263 	call puts 
      00852A 00 0D            [ 2]  264 	jra repl 
      000589                        265 test_p:	
      00852C 5F A6            [ 1]  266     cp a,#'P 
      00852E 10 CD            [ 1]  267 	jreq mem_peek
      008530 98 2D            [ 1]  268     cp a,#'S 
      008532 AE 85            [ 1]  269 	jrne invalid 
      000591                        270 print_string:	
      008534 AA 16 05         [ 4]  271 	call get_token
      008537 CD 84            [ 1]  272 	cp a,#TK_INTGR 
      008539 F2 AE            [ 1]  273 	jrne invalid 
      00853B 85 A6 16         [ 4]  274 	call puts
      00853E 07 CD 84         [ 2]  275 	jp repl 	
      00059E                        276 mem_peek:
      008541 F2 AE            [ 1]  277 	ld a,#SPACE 
      008543 85 AE 7B         [ 4]  278 	call skip  	 
      008546 04 CD 84 D0      [ 2]  279 	addw y,in.w 
      00854A AE 85 B2         [ 2]  280 	ldw x,#pad 
      00854D 7B 03 CD         [ 4]  281 	call strcpy
      008550 84 D0 AE         [ 2]  282 	ldw x,#pad
      008553 85 B7 90         [ 4]  283 	call atoi24 	
      008556 96 72 A9         [ 1]  284 	ld a, acc24 
      008559 00 0C CD         [ 1]  285 	or a,acc16 
      00855C 84 F2 A6         [ 1]  286 	or a,acc8 
      00855F 0A CD            [ 1]  287 	jrne 1$ 
      008561 89 90            [ 2]  288 	jra peek_byte  
      008563 81 0A 52         [ 2]  289 1$:	ldw x,acc24 
      008566 65 67 69         [ 2]  290 	ldw farptr,x 
      008569 73 74 65         [ 1]  291 	ld a,acc8 
      00856C 72 73 20         [ 1]  292 	ld farptr+2,a 
      0005CC                        293 peek_byte:
      00856F 73 74 61         [ 4]  294 	call print_farptr 
      008572 74 65            [ 1]  295 	ld a,#8 
      008574 20 61            [ 1]  296 	ld (PSIZE,sp),a 
      008576 74               [ 1]  297 	clrw x 
      008577 20 61 62         [ 4]  298 1$:	call fetchc  
      00857A 6F               [ 2]  299 	pushw x 
      00857B 72 74 20         [ 1]  300 	ld acc8,a 
      00857E 70               [ 1]  301 	clrw x 
      00857F 6F 69 6E         [ 2]  302 	ldw acc24,x 
      008582 74 2E            [ 1]  303 	ld a,#16+128
      008584 0A 2D 2D         [ 4]  304 	call prt_acc24
      008587 2D               [ 2]  305 	popw x 
      008588 2D 2D            [ 1]  306 	dec (PSIZE,sp)
      00858A 2D 2D            [ 1]  307 	jrne 1$ 
      00858C 2D 2D            [ 1]  308 	ld a,#8 
      00858E 2D 2D 2D         [ 1]  309 	add a,farptr+2 
      008591 2D 2D 2D         [ 1]  310 	ld farptr+2,a
      008594 2D               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008595 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      008598 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      00859B 2D               [ 1]  314 	clr a 
      00859C 2D 2D 2D         [ 1]  315 	adc a,farptr 
      00859F 0A 00 45         [ 1]  316 	ld farptr,a 
      0085A2 50 43 3A         [ 2]  317 	jp repl  
                                    318 
      0085A5 00 0A 59 3A 00 0A 58   319 invalid_cmd: .asciz "not a command\n" 
             3A 00 0A 41 3A 00 0A
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      000611                        324 print_farptr:
      0085B4 43 3A 00         [ 1]  325 	ld a ,farptr+2 
      0085B7 0A 53 50         [ 1]  326 	ld acc8,a 
      0085BA 3A 00 18         [ 2]  327 	ldw x,farptr 
      0085BC CF 00 0C         [ 2]  328 	ldw acc24,x 
      0085BC 52               [ 1]  329 	clrw x 
      0085BD 01 72            [ 1]  330 	ld a,#16 
      0085BF 5F 00 19         [ 4]  331 	call prt_acc24
      0085C2 72 5F            [ 1]  332 	ld a,#SPACE 
      0085C4 00 1A 72         [ 4]  333 	call putc 
      0085C7 5F 00 1B         [ 4]  334 	call putc 
      0085CA 81               [ 4]  335 	ret
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
      00062C                        346 fetchc: ; @C
      0085CA A6 0D CD 89      [ 5]  347 	ldf a,([farptr],x)
      0085CE 90               [ 1]  348 	incw x
      0085CF A6               [ 4]  349 	ret
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
      000632                        360 number:
      0085D0 3F CD 89         [ 4]  361 	call get_token
      0085D3 90 72            [ 1]  362 	cp a,#TK_INTGR
      0085D5 5F 00            [ 1]  363 	jreq 1$
      0085D7 01 72 5F         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0085DA 00               [ 4]  365 1$:	ret
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
      00063D                        380 show_row:
      0085DB 02               [ 1]  381 	tnz a 
      0085DC CD 8A            [ 1]  382 	jrne 1$
      0085DE F2               [ 4]  383 	ret 
      000641                        384 1$:	
      0085DF 90               [ 2]  385 	pushw x  
      0085E0 AE               [ 1]  386 	push a 
      0085E1 16 68 90 F6      [ 1]  387 	mov tab_width,#4 
      0085E5 27 E3 72         [ 4]  388 	call prt_i16 
      0085E8 5C 00            [ 1]  389 	ld a,#SPACE  
      0085EA 02 CD 98         [ 4]  390 	call putc
      00064F                        391 row_loop:
      0085ED AC A1            [ 2]  392 	ldw x,(ADR,sp)
      0085EF 51               [ 1]  393 	ld a,(x)
      0085F0 26               [ 1]  394 	clrw x 
      0085F1 17               [ 1]  395 	ld xl,a 
      0085F2 CD 17 96         [ 4]  396 	call prt_i16 
      0085F2 72 5F            [ 2]  397 	ldw x,(ADR,sp)
      0085F4 16               [ 1]  398 	incw x 
      0085F5 68 72            [ 2]  399 	ldw (ADR,sp),x 
      0085F7 5F 00            [ 1]  400 	dec (CNT,sp)
      0085F9 04 72            [ 1]  401 	jrne row_loop
      000660                        402 	_drop VSIZE  		
      0085FB 5F 00            [ 2]    1     addw sp,#VSIZE 
      0085FD 02 5B 01 81      [ 1]  403 	mov tab_width,#4
      008601 A6 0D            [ 1]  404 	ld a,#CR 
      008601 AE 86 82         [ 4]  405 	call putc 
      008604 CD               [ 4]  406 	ret 
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



      00066C                        419 hex_dump:
      008605 89               [ 1]  420 	push a 
      00066D                        421 	_vars VSIZE
      008606 ED 20            [ 2]    1     sub sp,#VSIZE 
      008608 C1 00 0A         [ 1]  422 	ld a,base
      008609 6B 03            [ 1]  423 	ld (BASE,sp),a 
      008609 A1 50 27 11      [ 1]  424 	mov base,#16
      00860D A1 53 26         [ 1]  425 	ld a,tab_width 
      008610 F0 04            [ 1]  426 	ld (TABW,sp),a
      008611 A6 0D            [ 1]  427 	ld a,#CR 
      008611 CD 8F 67         [ 4]  428 	call putc 
      008614 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      008616 26 E9            [ 1]  430 	ld a,#16
      008618 CD 89 ED CC      [ 2]  431 	cpw y,#16
      00861C 85 CA            [ 1]  432 	jrpl 2$
      00861E 90 9F            [ 1]  433 	ld a,yl
      00068E                        434 2$: 	
      00861E A6 20 CD         [ 4]  435 	call show_row 
      008621 8F 54            [ 2]  436 	ldw y,(BCNT,sp) 
      008623 72 B9 00 01      [ 2]  437 	subw y,#16 
      008627 AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00862B 94 27            [ 1]  439 	jrpl 1$
      00862D AE 16            [ 1]  440 	ld a,(BASE,sp)
      00862F B8 CD 98         [ 1]  441 	ld base,a
      008632 B8 C6            [ 1]  442 	ld a,(TABW,sp)
      008634 00 0D CA         [ 1]  443 	ld tab_width,a 
      0006A7                        444 	_drop VSIZE
      008637 00 0E            [ 2]    1     addw sp,#VSIZE 
      008639 CA               [ 1]  445 	pop a 
      00863A 00               [ 4]  446 	ret 
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
      0006AB                         45 unlock_eeprom:
      00863B 0F 26 02 20 0C   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008640 CE 00 0D CF      [ 1]   47 	mov FLASH_CR2,#0 
      008644 00 19 C6 00      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      008648 0F C7 00 1B      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00864C 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00864C CD 86 91 A6 08   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008651 6B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006C6                         62 unlock_flash:
      008652 01 5F CD 86 AC   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008657 89 C7 00 0F      [ 1]   64 	mov FLASH_CR2,#0 
      00865B 5F CF 00 0D      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      00865F A6 90 CD 98      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008663 2D 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008667 26 EB A6 08 CB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00866C 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      0006E1                         76 row_erase:
      00866D 1B               [ 1]   77 	push a 
      00866E C7 00            [ 2]   78 	pushw y 
      008670 1B 4F C9 00      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      008674 1A C7 00 1A      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008678 4F               [ 1]   81 	clr a 
      008679 C9 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00867B 19 C7 00 19      [ 1]   83 	ldf ([farptr],y),a
      00867F CC 85            [ 1]   84     incw y
      008681 CA 6E 6F 74      [ 1]   85 	ldf ([farptr],y),a
      008685 20 61            [ 1]   86     incw y
      008687 20 63 6F 6D      [ 1]   87 	ldf ([farptr],y),a
      00868B 6D 61            [ 1]   88     incw y
      00868D 6E 64 0A 00      [ 1]   89 	ldf ([farptr],y),a
      008691 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      008691 C6 00            [ 2]   91 	popw y 
      008693 1B               [ 1]   92 	pop a 
      008694 C7               [ 4]   93 	ret
      00070E                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      00070E                         97 move_erase_to_ram:
      008695 00               [ 2]   98 	pushw x 
      008696 0F CE            [ 2]   99 	pushw y 
      008698 00 19 CF         [ 2]  100 	ldw x,#row_erase_end 
      00869B 00 0D 5F         [ 2]  101 	subw x,#row_erase
      00869E A6 10 CD         [ 2]  102 	ldw acc16,x 
      0086A1 98 2D A6         [ 2]  103 	ldw x,#tib 
      0086A4 20 CD 89 90      [ 2]  104 	ldw y,#row_erase 
      0086A8 CD 89 90         [ 4]  105 	call move
      0086AB 81 85            [ 2]  106 	popw y
      0086AC 85               [ 2]  107 	popw x
      0086AC 92               [ 4]  108 	ret 
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
      000728                        123 program_row:
      0086AD AF               [ 1]  124 	push a 
      0086AE 00 19            [ 2]  125 	pushw y 
      0086B0 5C 81            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086B2 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086B2 CD 8F 67 A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086B6 84 27            [ 1]  130 	clrw y 
      0086B8 03               [ 1]  131 1$:	ld a,(x)
      0086B9 CC 96 C7 81      [ 1]  132 	ldf ([farptr],y),a
      0086BD 5C               [ 1]  133 	incw x 
      0086BD 4D 26            [ 1]  134 	incw y 
      0086BF 01 81            [ 1]  135 	dec (BCNT,sp)
      0086C1 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0086C1 89 88 35 04 00   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      000748                        139 	_drop 1 
      0086C6 24 CD            [ 2]    1     addw sp,#1 
      0086C8 98 16            [ 2]  140 	popw y 
      0086CA A6               [ 1]  141 	pop a 
      0086CB 20               [ 4]  142 	ret 
      00074E                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      00074E                        149 move_prg_to_ram:
      0086CC CD               [ 2]  150 	pushw x 
      0086CD 89 90            [ 2]  151 	pushw y 
      0086CF AE 07 4E         [ 2]  152 	ldw x,#program_row_end 
      0086CF 1E 02 F6         [ 2]  153 	subw x,#program_row 
      0086D2 5F 97 CD         [ 2]  154 	ldw acc16,x ; bytes to move 
      0086D5 98 16 1E         [ 2]  155 	ldw x,#tib ; destination address 
      0086D8 02 5C 1F 02      [ 2]  156 	ldw y,#program_row ; source address 
      0086DC 0A 01 26         [ 4]  157 	call move
      0086DF EF 5B            [ 2]  158 	popw y 
      0086E1 03               [ 2]  159 	popw x  
      0086E2 35               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      000768                        169 write_buffer:
      0086E3 04               [ 2]  170 	pushw x 
      0086E4 00 24 A6 0D      [ 1]  171 	tnz farptr 
      0086E8 CD 89            [ 1]  172 	jrne to_flash 
      0086EA 90 81 19         [ 2]  173 	ldw x,farptr+1 
      0086EC A3 34 80         [ 2]  174 	cpw x,#app_space  
      0086EC 88 52            [ 1]  175 	jruge to_flash 
      000777                        176 to_eeprom:
      0086EE 04 C6 00         [ 4]  177 	call unlock_eeprom
      0086F1 0B 6B            [ 2]  178 	jra do_programming
      00077C                        179 to_flash:
      0086F3 03 35 10         [ 4]  180 	call unlock_flash
      00077F                        181 do_programming:
      0086F6 00               [ 2]  182 	popw x 
      0086F7 0B C6 00         [ 4]  183 	call tib
      0086FA 24 6B 04 A6      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0086FE 0D CD 89 90      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008702 17               [ 4]  186 	ret 
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
      00078C                        197 block_erase:
      008703 01               [ 2]  198 	pushw x 
      008704 A6 10 90         [ 1]  199 	ld a,farptr 
      008707 A3 00            [ 1]  200 	jrne erase_flash
      008709 10 2A 02         [ 2]  201 	ldw x,farptr+1
      00870C 90 9F 80         [ 2]  202 	cpw x,#app_space 
      00870E 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      00870E CD 86 BD         [ 4]  205 	call unlock_eeprom 
      008711 16 01 72         [ 4]  206 	call tib 
      008714 A2 00 10 90      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008718 A3 00            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007A6                        210 erase_flash:
      00871A 01 2A E5         [ 4]  211 	call unlock_flash 
      00871D 7B 03 C7         [ 4]  212 	call tib 
      008720 00 0B 7B 04      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007B0                        214 erase_exit: 
      008724 C7               [ 2]  215 	popw x 
      008725 00               [ 4]  216 	ret 
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
      0007B2                        232 write_byte:
      008726 24 5B            [ 2]  233 	pushw y
      0007B4                        234 	_vars VSIZE
      008728 04 84            [ 2]    1     sub sp,#VSIZE 
      00872A 81 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00872B 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00872B 72 06 50 5F      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      00872F 15 35 00 50      [ 1]  240 	tnz farptr 
      008733 5B 35            [ 1]  241 	jrne write_flash
      008735 FF 50 5C 35      [ 2]  242     cpw y,#app_space 	 
      008739 AE 50            [ 1]  243     jruge write_flash
      00873B 64 35 56 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      00873F 64 72            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      008741 07 50 5F FB      [ 2]  246 	cpw y,#OPTION_END 
      008745 81 51            [ 1]  247 	jrugt write_exit
      008746 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      0007D8                        250 write_flash:
      008746 72 02 50         [ 4]  251 	call unlock_flash 
      008749 5F               [ 1]  252 1$:	sim 
      00874A 15 35            [ 1]  253 	ld a,(BTW,sp)
      00874C 00 50 5B 35      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008750 FF 50 5C 35 56   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008755 50               [ 1]  256     rim 
      008756 62 35 AE 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00875A 62 72            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      0007EE                        260 write_eeprom:
      00875C 03 50 5F         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      00875F FB 81 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008761 2B 08            [ 1]  264 	jrmi 1$
      008761 88 90 89 35      [ 2]  265 	cpw y,#OPTION_END+1
      008765 20 50            [ 1]  266 	jrpl 1$
      008767 5B 35            [ 1]  267 	cpl (OPT,sp)
      0007FF                        268 1$: 
      008769 DF 50            [ 1]  269     tnz (OPT,sp)
      00876B 5C 4F            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      00876D 90 5F 91 A7      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      008771 00 19 90 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00080B                        274 2$: 
      008775 91 A7            [ 1]  275     ld a,(BTW,sp)
      008777 00 19 90 5C      [ 4]  276     ldf ([farptr],x),a
      00877B 91 A7            [ 1]  277     tnz (OPT,sp)
      00877D 00 19            [ 1]  278     jreq 3$
      00877F 90               [ 1]  279     incw x
      008780 5C 91            [ 1]  280     ld a,(BTW,sp)
      008782 A7               [ 1]  281     cpl a
      008783 00 19 72 05      [ 4]  282     ldf ([farptr],x),a
      008787 50 5F FB 90 85   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00878C 84 81 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      00878E                        285 write_exit:
      00878E                        286 	_drop VSIZE 
      00878E 89 90            [ 2]    1     addw sp,#VSIZE 
      008790 89 AE            [ 2]  287 	popw y
      008792 87               [ 4]  288     ret
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
      00082C                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      00082C                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      00082C                        309 write_block::
      008793 8E               [ 1]  310 	push a 
      00082D                        311 	_vars VSIZE
      008794 1D 87            [ 2]    1     sub sp,#VSIZE 
      008796 61 CF            [ 2]  312 	ldw (XSAVE,sp),x 
      008798 00 0E            [ 2]  313 	ldw x,(BSIZE,sp) 
      00879A AE 16            [ 1]  314 	jreq 9$
      00879C 68 90            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      00879E AE 87            [ 1]  316 	ld a,(y)
      0087A0 61 CD 94         [ 4]  317 	call write_byte 
      0087A3 37               [ 1]  318 	incw x 
      0087A4 90 85            [ 1]  319 	incw y 
      0087A6 85 81            [ 2]  320 	ldw (XSAVE,sp),x
      0087A8 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      0087A8 88               [ 2]  322 	decw x
      0087A9 90 89            [ 2]  323 	ldw (BSIZE,sp),x 
      0087AB 4B 80            [ 1]  324 	jrne 1$
      000848                        325 9$:
      0087AD 72 10            [ 2]  326 	ldw x,(XSAVE,sp)
      0087AF 50 5B 72         [ 4]  327 	call incr_farptr
      00084D                        328 	_drop VSIZE
      0087B2 11 50            [ 2]    1     addw sp,#VSIZE 
      0087B4 5C               [ 1]  329 	pop a 
      0087B5 90               [ 4]  330 	ret 
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
      000851                        347 write_nbytes:
      0087B6 5F F6            [ 2]  348 	pushw y
      0087B8 91               [ 1]  349 	push a 
      0087B9 A7 00            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0087BB 19               [ 1]  351 	clrw x 
      000857                        352 1$:  
      0087BC 5C 90            [ 1]  353 	ld a,(y)
      0087BE 5C 0A            [ 1]  354 	incw y
      0087C0 01 26 F4         [ 4]  355 	call write_byte 
      0087C3 72               [ 1]  356 	incw x 
      0087C4 05 50            [ 1]  357 	dec (1,sp)  
      0087C6 5F FB            [ 1]  358 	jrne 1$ 
      0087C8 5B               [ 1]  359 9$: pop a 
      0087C9 01 90            [ 2]  360 	popw y 
      0087CB 85               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      000867                        370 row_align:
      0087CC 84 81            [ 1]  371 	ld a,#0x7f 
      0087CE C4 00 1A         [ 1]  372 	and a,farptr+2 
      0087CE 27 13            [ 1]  373 	jreq 1$ 
      0087CE 89 90 89         [ 2]  374 	ldw x,farptr+1 
      0087D1 AE 87 CE         [ 2]  375 	addw x,#BLOCK_SIZE 
      0087D4 1D 87            [ 1]  376 	jrnc 0$
      0087D6 A8 CF 00 0E      [ 1]  377 	inc farptr 
      0087DA AE               [ 1]  378 0$: ld a,xl 
      0087DB 16 68            [ 1]  379 	and a,#0x80
      0087DD 90               [ 1]  380 	ld xl,a
      0087DE AE 87 A8         [ 2]  381 	ldw farptr+1,x  	
      0087E1 CD               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      000882                        390 incr_farptr:
      0087E2 94 37 90 85      [ 2]  391 	addw x,farptr+1 
      0087E6 85 81            [ 1]  392 	jrnc 1$
      0087E8 72 5C 00 18      [ 1]  393 	inc farptr 
      0087E8 89 72 5D         [ 2]  394 1$:	ldw farptr+1,x  
      0087EB 00               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      000890                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0087EC 19               [ 1]  406 	clrw x 
      0087ED 26 0D CE 00      [ 5]  407 1$: ldf a,([farptr],x) 
      0087F1 1A A3            [ 1]  408 	jrne 2$
      0087F3 B5               [ 1]  409 	incw x 
      0087F4 00 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
      0087F7 25 F4            [ 1]  411 	jrult 1$ 
      0087F7 CD               [ 4]  412 2$:	ret 
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
      00089E                         66 Uart1RxHandler: ; console receive char 
      0087F8 87 2B 20 03 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0087FC C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0087FC CD 87            [ 1]   69 	cp a,#CTRL_C 
      0087FE 46 06            [ 1]   70 	jrne 2$
      0087FF CD 09 10         [ 4]   71 	call putc 
      0087FF 85 CD 16         [ 2]   72 	jp user_interrupted
      0008B0                         73 2$:
      008802 68 72            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008804 13 50            [ 1]   75 	jrne 3$
      008806 5F 72 17         [ 2]   76 	jp cold_start 	
      008809 50               [ 1]   77 3$:	push a 
      00880A 5F 81            [ 1]   78 	ld a,#rx1_queue 
      00880C CB 00 2F         [ 1]   79 	add a,rx1_tail 
      00880C 89               [ 1]   80 	clrw x 
      00880D C6               [ 1]   81 	ld xl,a 
      00880E 00               [ 1]   82 	pop a 
      00880F 19               [ 1]   83 	ld (x),a 
      008810 26 14 CE         [ 1]   84 	ld a,rx1_tail 
      008813 00               [ 1]   85 	inc a 
      008814 1A A3            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008816 B5 00 24         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      008819 0C               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0008CB                         97 uart1_init:
      00881A CD 87 2B CD      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00881E 16 68 72 17      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008822 50 5F 20 0A      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008826 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      0008DB                        103 uart1_set_baud: 
      008826 CD               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008827 87 46            [ 1]  107 	ld a,#CLK_SWR_HSI
      008829 CD 16 68         [ 1]  108 	cp a,CLK_CMSR 
      00882C 72 13            [ 1]  109 	jreq 2$ 
      0008E3                        110 1$: ; 8 Mhz 	
      00882E 50 5F 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008830 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008830 85 81            [ 2]  113 	jra 3$
      008832                        114 2$: ; 16 Mhz 	
      008832 90 89 52 02      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008836 6B 01 0F 02      [ 1]  116 	mov UART1_BRR1,#0x08
      0008F5                        117 3$:
      00883A 90 CE 00 1A      [ 1]  118     clr UART1_DR
      00883E 72 5D 00 19      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008842 26 14 90 A3      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008846 B5 00 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00884B A3 40 00 25      [ 1]  122     clr rx1_head 
      00884F 57 90 A3 48      [ 1]  123 	clr rx1_tail
      008853 7F               [ 1]  124 	pop a  
      008854 22               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      000910                        133 putc:: ; console output always on UART1
      000910                        134 uart1_putc:: 
      008855 51 20 16 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008858 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008858 CD               [ 4]  137 	ret 
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
      000919                        148 qgetc::
      000919                        149 uart1_qgetc::
      008859 87 46 9B         [ 1]  150 	ld a,rx1_head 
      00885C 7B 01 92         [ 1]  151 	sub a,rx1_tail 
      00885F A7               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      000920                        161 getc:: ;console input
      000920                        162 uart1_getc::
      008860 00 19 72         [ 4]  163 	call uart1_qgetc
      008863 05 50            [ 1]  164 	jreq uart1_getc 
      008865 5F               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008866 FB 9A            [ 1]  167 	ld a,#rx1_queue
      008868 72 13 50         [ 1]  168 	add a,rx1_head 
      00886B 5F               [ 1]  169 	clrw x  
      00886C 20               [ 1]  170 	ld xl,a 
      00886D 39               [ 1]  171 	ld a,(x)
      00886E 88               [ 1]  172 	push a
      00886E CD 87 2B         [ 1]  173 	ld a,rx1_head 
      008871 90               [ 1]  174 	inc a 
      008872 A3 48            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008874 00 2B 08         [ 1]  176 	ld rx1_head,a 
      008877 90               [ 1]  177 	pop a  
      008878 A3               [ 2]  178 	popw x
      008879 48               [ 4]  179 	ret 
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
      00887A 80 2A 02 03 02 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      00887F                        207 get_escape:
      00887F 0D 02 27         [ 4]  208     call getc 
      008882 08 72            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      008884 1E 50            [ 1]  210     jreq 1$
      008886 5B               [ 1]  211     clr a
      008887 72               [ 4]  212     ret
      008888 1F 50 5C         [ 4]  213 1$: call getc 
      00888B AE 09 3B         [ 2]  214     ldw x,#convert_table
      000956                        215 2$:
      00888B 7B               [ 1]  216     cp a,(x)
      00888C 01 92            [ 1]  217     jreq 4$
      00888E A7 00 19         [ 2]  218     addw x,#2
      008891 0D               [ 1]  219     tnz (x)
      008892 02 27            [ 1]  220     jrne 2$
      008894 08               [ 1]  221     clr a
      008895 5C               [ 4]  222     ret 
      008896 7B               [ 1]  223 4$: incw x 
      008897 01               [ 1]  224     ld a,(x)
      008898 43 92            [ 1]  225     cp a,#SUP
      00889A A7 00            [ 1]  226     jrne 5$
      00889C 19               [ 1]  227     push a 
      00889D 72 05 50         [ 4]  228     call getc
      0088A0 5F               [ 1]  229     pop a 
      00096C                        230 5$:
      0088A1 FB               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      00096D                        241 puts::
      0088A2 72               [ 1]  242     ld a,(x)
      0088A3 0D 50            [ 1]  243 	jreq 1$
      0088A5 5F FB 10         [ 4]  244 	call putc 
      0088A7 5C               [ 1]  245 	incw x 
      0088A7 5B 02            [ 2]  246 	jra puts 
      0088A9 90               [ 4]  247 1$:	ret 
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
      000977                        258 bksp:
      0088AA 85 81            [ 1]  259 	ld a,#BS 
      0088AC CD 09 10         [ 4]  260 	call putc 
      0088AC 88 52            [ 1]  261 	ld a,#SPACE 
      0088AE 02 1F 01         [ 4]  262 	call putc 
      0088B1 1E 06            [ 1]  263 	ld a,#BS 
      0088B3 27 13 1E         [ 4]  264 	call putc 
      0088B6 01               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      000987                        274 delete_nchar:
      0088B7 90               [ 1]  275 	push a 
      0088B8 F6 CD            [ 1]  276 0$:	tnz (1,sp)
      0088BA 88 32            [ 1]  277 	jreq 1$
      0088BC 5C 90 5C         [ 4]  278 	call bksp 
      0088BF 1F 01            [ 1]  279 	dec (1,sp)
      0088C1 1E 06            [ 2]  280 	jra 0$
      0088C3 5A               [ 1]  281 1$:	pop a 
      0088C4 1F               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      000995                        290 send_escape:
      0088C5 06 26            [ 1]  291 	ld a,#ESC 
      0088C7 ED 09 10         [ 4]  292 	call putc 
      0088C8 A6 5B            [ 1]  293 	ld a,#'[
      0088C8 1E 01 CD         [ 4]  294 	call putc 
      0088CB 89               [ 4]  295 	ret 
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
      0009A0                        311 send_parameter:
      0088CC 02               [ 2]  312 	pushw x 
      0088CD 5B               [ 1]  313 	clrw x 
      0088CE 02               [ 1]  314 	ld xl,a 
      0088CF 84 81            [ 1]  315 	ld a,#10 
      0088D1 62               [ 2]  316 	div x,a 
      0088D1 90               [ 1]  317 	ld xh,a 
      0088D2 89               [ 1]  318 	ld a,xl
      0088D3 88               [ 1]  319     tnz a 
      0088D4 90 93            [ 1]  320     jreq 2$
      0088D6 5F 09            [ 1]  321 	cp a,#9 
      0088D7 23 02            [ 2]  322 	jrule 1$
      0088D7 90 F6            [ 1]  323 	ld a,#9
      0009B1                        324 1$:
      0088D9 90 5C            [ 1]  325 	add a,#'0 
      0088DB CD 88 32         [ 4]  326 	call putc
      0088DE 5C               [ 1]  327 2$:	ld a,xh 
      0088DF 0A 01            [ 1]  328 	add a,#'0
      0088E1 26 F4 84         [ 4]  329 	call putc 
      0088E4 90               [ 2]  330 	popw x 
      0088E5 85               [ 4]  331 	ret 
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
      0009BE                        344 move_left:
      0088E6 81               [ 1]  345 	push a 
      0088E7 CD 09 95         [ 4]  346 	call send_escape
      0088E7 A6               [ 1]  347     pop a
      0088E8 7F C4 00         [ 4]  348 	call send_parameter 
      0088EB 1B 27            [ 1]  349 	ld a,#'D 
      0088ED 13 CE 00         [ 4]  350 	call putc 
      0088F0 1A               [ 4]  351 	ret	
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



      0009CC                        362 move_right:
      0088F1 1C               [ 1]  363 	push a 
      0088F2 00 80 24         [ 4]  364 	call send_escape
      0088F5 04               [ 1]  365     pop a
      0088F6 72 5C 00         [ 4]  366 	call send_parameter 
      0088F9 19 9F            [ 1]  367 	ld a,#'C 
      0088FB A4 80 97         [ 4]  368 	call putc 
      0088FE CF               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      0009DA                        379 spaces::
      0088FF 00 1A            [ 1]  380 	ld a,#SPACE 
      008901 81               [ 2]  381 1$:	tnzw x
      008902 27 06            [ 1]  382 	jreq 9$
      008902 72 BB 00         [ 4]  383 	call putc 
      008905 1A               [ 2]  384 	decw x
      008906 24 04            [ 2]  385 	jra 1$
      0009E5                        386 9$: 
      008908 72               [ 4]  387 	ret 
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
      0009E6                        405 insert_char: 
      0009E6                        406 	_vars VSIZE 
      008909 5C 00            [ 2]    1     sub sp,#VSIZE 
      00890B 19 CF            [ 1]  407     ld (KCHAR,sp),a 
      00890D 00               [ 1]  408     ld a,xh 
      00890E 1A 81            [ 1]  409 	ld (IPOS,sp),a
      008910 9F               [ 1]  410     ld a,xl 
      008910 5F 92            [ 1]  411     ld (LLEN,sp),a  
      008912 AF               [ 1]  412     ldw x,y
      008913 00               [ 1]  413     incw x 
      008914 19 26            [ 1]  414     ld a,(LLEN,sp)
      008916 06 5C            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008918 A3               [ 1]  416     inc a 
      008919 00 80 25         [ 1]  417     ld acc8,a 
      00891C F4 81 00 0D      [ 1]  418     clr acc16
      00891E CD 13 B7         [ 4]  419     call move
      00891E 72 0B 52 30      [ 2]  420     ldw y,#tib 
      008922 27 C6            [ 1]  421     ld a,(IPOS,sp)
      008924 52 31 A1         [ 1]  422     ld acc8,a 
      008927 03 26 06 CD      [ 2]  423     addw y,acc16 
      00892B 89 90            [ 1]  424     ld a,(KCHAR,sp)
      00892D CC 80            [ 1]  425     ld (y),a
      00892F D7 5C            [ 1]  426     incw y  
      008930 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008930 A1 18 26         [ 4]  428     call move_left
      008933 03 CC 81         [ 2]  429     ldw x,#tib 
      008936 43 88 A6         [ 4]  430     call puts 
      008939 27 CB            [ 1]  431     ld a,(LLEN,sp)
      00893B 00 30            [ 1]  432     sub a,(IPOS,sp) 
      00893D 5F 97 84         [ 4]  433     call move_left 
      000A26                        434 	_drop VSIZE 
      008940 F7 C6            [ 2]    1     addw sp,#VSIZE 
      008942 00               [ 4]  435 	ret 
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
      000A29                        448 delete_under:
      000A29                        449 	_vars VSIZE 
      008943 30 4C            [ 2]    1     sub sp,#VSIZE 
      008945 A4 07            [ 1]  450     ld (LLEN,sp),a 
      008947 C7               [ 1]  451     ld a,xl 
      008948 00 30            [ 1]  452     ld (CPOS,sp),a 
      00894A 80               [ 1]  453     ldw x,y ; move destination
      00894B 90 5C            [ 1]  454     incw y  ; move source 
      00894B 72 1A            [ 1]  455     ld a,(LLEN,sp)
      00894D 50 02            [ 1]  456     sub a,(CPOS,sp)
      00894F 72               [ 1]  457     inc a ; move including zero at end.
      008950 1A 50 03         [ 1]  458     ld acc8,a 
      008953 72 1A 50 04      [ 1]  459     clr acc16 
      008957 72 14 50         [ 4]  460 	call move 
      00895A C7 AE 16 68      [ 2]  461     ldw y,#tib 
      00895B 7B 01            [ 1]  462     ld a,(CPOS,sp)
      00895B 88 A6 E1         [ 1]  463     ld acc8,a 
      00895E C1 50 C3 27      [ 2]  464     addw y,acc16 
      008962 0A               [ 1]  465     ldw x,y 
      008963 CD 09 6D         [ 4]  466     call puts 
      008963 35 05            [ 1]  467     ld a,#SPACE  
      008965 52 33 35         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      008968 04 52            [ 1]  469     ld a,(LLEN,sp)
      00896A 32 20            [ 1]  470     sub a,(CPOS,sp)
      00896C 08 09 BE         [ 4]  471     call move_left 
      00896D 0A 02            [ 1]  472     dec (LLEN,sp)
      000A61                        473 	_drop VSIZE 
      00896D 35 0B            [ 2]    1     addw sp,#VSIZE 
      00896F 52               [ 4]  474 	ret 
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
      000A64                        486 delete_line:
      008970 33 35 08         [ 4]  487     call send_escape
      008973 52 32            [ 1]  488 	ld a,#'2
      008975 CD 09 10         [ 4]  489 	call putc 
      008975 72 5F            [ 1]  490 	ld a,#'K 
      008977 52 31 35         [ 4]  491 	call putc 
      00897A 2C               [ 4]  492 	ret 
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
      000A72                        524 readln::
      00897B 52 35            [ 2]  525 	pushw y 
      000A74                        526 	_vars VSIZE 
      00897D 72 10            [ 2]    1     sub sp,#VSIZE 
      00897F 52               [ 1]  527 	clrw x 
      008980 35 72            [ 2]  528 	ldw (LL,sp),x 
      008982 0D 52            [ 2]  529 	ldw (CPOS,sp),x 
      008984 30 FB            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008986 72 5F 00 2F      [ 2]  531  	ldw y,#tib ; terminal input buffer
      000A81                        532 readln_loop:
      00898A 72 5F 00         [ 4]  533 	call getc
      00898D 30 84            [ 1]  534 	ld (RXCHAR,sp),a
      00898F 81 1B            [ 1]  535     cp a,#ESC 
      008990 26 05            [ 1]  536     jrne 0$
      008990 CD 09 47         [ 4]  537     call get_escape 
      008990 72 0F            [ 1]  538     ld (RXCHAR,sp),a 
      008992 52 30            [ 1]  539 0$:	cp a,#CR
      008994 FB C7            [ 1]  540 	jrne 1$
      008996 52 31 81         [ 2]  541 	jp readln_quit
      008999 A1 0A            [ 1]  542 1$:	cp a,#LF 
      008999 26 03            [ 1]  543 	jrne 2$ 
      008999 C6 00 2F         [ 2]  544 	jp readln_quit
      000A9D                        545 2$:
      00899C C0 00            [ 1]  546 	cp a,#BS
      00899E 30 81            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      0089A0 0D 03            [ 1]  549     tnz (CPOS,sp)
      0089A0 27 DC            [ 1]  550     jreq readln_loop 
      0089A0 CD 89            [ 1]  551     ld a,#1 
      0089A2 99 27 FB         [ 4]  552     call move_left
      0089A5 89 A6            [ 1]  553     dec (CPOS,sp)
      0089A7 27 CB            [ 2]  554     decw y 
      0089A9 00 2F            [ 1]  555     ld a,(CPOS,sp) 
      0089AB 5F 97 F6         [ 2]  556     jp 12$
      000AB3                        557 3$:
      0089AE 88 C6            [ 1]  558 	cp a,#CTRL_D
      0089B0 00 2F            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      0089B2 4C A4 07         [ 4]  561 	call delete_line 
      0089B5 C7 00            [ 1]  562     ld a,(CPOS,sp)
      0089B7 2F               [ 1]  563     inc a 
      0089B8 84 85 81         [ 4]  564     call move_left 
      0089BB 43 81            [ 1]  565 	ld a,#'> 
      0089BD 44 80 48         [ 4]  566 	call putc 
      0089C0 82 46 83 33      [ 2]  567 	ldw y,#tib
      0089C4 84 00            [ 1]  568 	clr (y)
      0089C6 00 02            [ 1]  569 	clr (LL,sp)
      0089C7 0F 03            [ 1]  570 	clr (CPOS,sp)
      0089C7 CD 89            [ 2]  571 	jra readln_loop
      000AD1                        572 4$:
      0089C9 A0 A1            [ 1]  573 	cp a,#CTRL_R 
      0089CB 5B 27            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      0089CD 02 4F            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0089CF 81 CD            [ 1]  577 	jrne readln_loop
      0089D1 89 A0 AE 89      [ 2]  578 	ldw y,#tib 
      0089D5 BB               [ 1]  579 	ldw x,y
      0089D6 CD 13 8B         [ 4]  580 	call strlen
      0089D6 F1               [ 1]  581 	tnz a  
      0089D7 27 08            [ 1]  582 	jreq readln_loop
      0089D9 1C 00            [ 1]  583 	ld (LL,sp),a 
      0089DB 02 7D            [ 1]  584     ld (CPOS,sp),a
      0089DD 26               [ 1]  585 	ldw x,y  
      0089DE F7 4F 81         [ 4]  586 	call puts
      0089E1 5C F6            [ 1]  587 	clr (LL_HB,sp)
      0089E3 A1 84 26         [ 2]  588 	addw y,(LL_HB,sp)
      0089E6 05 88            [ 2]  589 	jra readln_loop 
      000AF3                        590 5$:
      0089E8 CD 89            [ 1]  591 	cp a,#CTRL_E 
      0089EA A0 84            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      0089EC AE 16 68         [ 2]  594 	ldw x,#tib 
      0089EC 81 18 38         [ 4]  595 	call atoi24
      0089ED CE 00 0D         [ 2]  596 	ldw x,acc16
      0089ED F6 27 06         [ 4]  597 	call search_lineno
      0089F0 CD               [ 2]  598 	tnzw x 
      0089F1 89 90            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      0089F3 5C 20 F7         [ 2]  603 	jp readln_quit  
      000B09                        604 51$:
      0089F6 81 00 04         [ 2]  605 	ldw basicptr,x
      0089F7 E6 02            [ 1]  606 	ld a,(2,x)
      0089F7 A6 08 CD         [ 1]  607 	ld count,a 
      0089FA 89 90 A6 20      [ 2]  608 	ldw y,#tib 
      0089FE CD 89 90         [ 4]  609 	call decompile 
      008A01 A6 08            [ 1]  610 	clr (LL_HB,sp)
      008A03 CD 89            [ 1]  611 	ld a,#CR 
      008A05 90 81 10         [ 4]  612 	call putc 
      008A07 A6 3E            [ 1]  613 	ld a,#'>
      008A07 88 0D 01         [ 4]  614 	call putc
      008A0A 27 07 CD         [ 2]  615     ldw x,#tib  
      008A0D 89 F7 0A         [ 4]  616 	call strlen 
      008A10 01 20            [ 1]  617 	ld (LL,sp),a 
      008A12 F5 84 81         [ 4]  618 	call puts 
      008A15 90 93            [ 1]  619 	ldw y,x
      008A15 A6 1B            [ 1]  620     ld a,(LL,sp)
      008A17 CD 89            [ 1]  621     ld (CPOS,sp),a  
      008A19 90 A6 5B         [ 2]  622 	jp readln_loop
      000B38                        623 6$:
      008A1C CD 89            [ 1]  624 	cp a,#ARROW_RIGHT
      008A1E 90 81            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008A20 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008A20 89 5F            [ 1]  628     cp a,(LL,sp)
      008A22 97 A6            [ 1]  629     jrmi 61$
      008A24 0A 62 95         [ 2]  630     jp readln_loop 
      000B45                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008A27 9F 4D            [ 1]  632     ld a,#1 
      008A29 27 0B A1         [ 4]  633 	call move_right 
      008A2C 09 23            [ 1]  634 	inc (CPOS,sp)
      008A2E 02 A6            [ 1]  635     incw y 
      008A30 09 0A 81         [ 2]  636     jp readln_loop 
      008A31 A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008A31 AB 30            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008A33 CD 89            [ 1]  640 	tnz (CPOS,sp)
      008A35 90 9E            [ 1]  641 	jrne 71$
      008A37 AB 30 CD         [ 2]  642 	jp readln_loop
      000B5C                        643 71$:
      008A3A 89 90            [ 1]  644     ld a,#1 
      008A3C 85 81 BE         [ 4]  645 	call move_left 
      008A3E 0A 03            [ 1]  646 	dec (CPOS,sp)
      008A3E 88 CD            [ 2]  647     decw y 
      008A40 8A 15 84         [ 2]  648 	jp readln_loop 
      008A43 CD 8A            [ 1]  649 8$: cp a,#HOME  
      008A45 20 A6            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008A47 44 CD            [ 1]  652     ld a,(CPOS,sp)
      008A49 89 90 81         [ 4]  653     call move_left 
      008A4C 0F 03            [ 1]  654 	clr (CPOS,sp)
      008A4C 88 CD 8A 15      [ 2]  655     ldw y,#tib 
      008A50 84 CD 8A         [ 2]  656 	jp readln_loop  
      008A53 20 A6            [ 1]  657 9$: cp a,#KEY_END  
      008A55 43 CD            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008A57 89 90            [ 1]  660 	ld a,(CPOS,sp)
      008A59 81 02            [ 1]  661 	cp a,(LL,sp)
      008A5A 26 03            [ 1]  662 	jrne 91$
      008A5A A6 20 5D         [ 2]  663 	jp readln_loop 
      000B87                        664 91$:
      008A5D 27 06            [ 1]  665 	ld a,(LL,sp)
      008A5F CD 89            [ 1]  666 	sub a,(CPOS,sp)
      008A61 90 5A 20         [ 4]  667 	call move_right 
      008A64 F7 02            [ 1]  668 	ld a,(LL,sp)
      008A65 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008A65 81 AE 16 68      [ 2]  670     ldw y,#tib
      008A66 72 5F 00 0D      [ 1]  671     clr acc16 
      008A66 52 03 6B         [ 1]  672     ld acc8,a 
      008A69 02 9E 6B 01      [ 2]  673     addw y,acc16  
      008A6D 9F 6B 03         [ 2]  674 	jp readln_loop 
      008A70 93 5C            [ 1]  675 10$: cp a,#CTRL_O
      008A72 7B 03            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008A74 10 01            [ 1]  678 	cpl (OVRWR,sp)
      008A76 4C C7 00         [ 4]  679 	call beep_1khz
      008A79 0F 72 5F         [ 2]  680 	jp readln_loop 
      008A7C 00 0E            [ 1]  681 11$: cp a,#SUP 
      008A7E CD 94            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008A80 37 90            [ 1]  684     ld a,(CPOS,sp)
      008A82 AE 16            [ 1]  685     cp a,(LL,sp)
      008A84 68 7B            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      000BBA                        687 12$:
      008A86 01               [ 1]  688     ld xl,a    ; cursor position 
      008A87 C7 00            [ 1]  689     ld a,(LL,sp)  ; line length
      008A89 0F 72 B9         [ 4]  690     call delete_under
      008A8C 00 0E            [ 1]  691     dec (LLEN,sp)
      000BC2                        692 13$:
      008A8E 7B 02 90         [ 2]  693     jp readln_loop 
      000BC5                        694 final_test:
      008A91 F7 90            [ 1]  695 	cp a,#SPACE
      008A93 5C 7B            [ 1]  696 	jrpl accept_char
      008A95 01 CD 8A         [ 2]  697 	jp readln_loop
      000BCC                        698 accept_char:
      008A98 3E AE            [ 1]  699 	ld a,#TIB_SIZE-1
      008A9A 16 68            [ 1]  700 	cp a, (LL,sp)
      008A9C CD 89            [ 1]  701 	jrpl 1$
      008A9E ED 7B 03         [ 2]  702 	jp readln_loop
      008AA1 10 01            [ 1]  703 1$:	tnz (OVRWR,sp)
      008AA3 CD 8A            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008AA5 3E 5B            [ 1]  706     ld a,(CPOS,sp)
      008AA7 03 81            [ 1]  707     cp a,(LL,sp)
      008AA9 27 12            [ 1]  708     jreq overwrite
      008AA9 52 02            [ 1]  709     ld a,(LL,sp)
      008AAB 6B               [ 1]  710     ld xl,a 
      008AAC 02 9F            [ 1]  711     ld a,(CPOS,sp)
      008AAE 6B               [ 1]  712     ld xh,a
      008AAF 01 93            [ 1]  713     ld a,(RXCHAR,sp)
      008AB1 90 5C 7B         [ 4]  714     call insert_char
      008AB4 02 10            [ 1]  715     inc (LLEN,sp)
      008AB6 01 4C            [ 1]  716     inc (CPOS,sp)	
      008AB8 C7 00 0F         [ 2]  717     jp readln_loop 
      000BF1                        718 overwrite:
      008ABB 72 5F            [ 1]  719 	ld a,(RXCHAR,sp)
      008ABD 00 0E            [ 1]  720 	ld (y),a
      008ABF CD 94            [ 1]  721     incw y
      008AC1 37 90 AE         [ 4]  722     call putc 
      008AC4 16 68            [ 1]  723 	ld a,(CPOS,sp)
      008AC6 7B 01            [ 1]  724 	cp a,(LL,sp)
      008AC8 C7 00            [ 1]  725 	jrmi 1$
      008ACA 0F 72            [ 1]  726 	clr (y)
      008ACC B9 00            [ 1]  727 	inc (LL,sp)
      008ACE 0E 93            [ 1]  728     inc (CPOS,sp)
      008AD0 CD 89 ED         [ 2]  729 	jp readln_loop 
      000C09                        730 1$:	
      008AD3 A6 20            [ 1]  731 	inc (CPOS,sp)
      008AD5 CD 89 90         [ 2]  732 	jp readln_loop 
      000C0E                        733 readln_quit:
      008AD8 7B 02 10 01      [ 2]  734 	ldw y,#tib
      008ADC CD 8A            [ 1]  735     clr (LL_HB,sp) 
      008ADE 3E 0A 02         [ 2]  736     addw y,(LL_HB,sp)
      008AE1 5B 02            [ 1]  737     clr (y)
      008AE3 81 02            [ 1]  738 	ld a,(LL,sp)
      008AE4 C7 00 03         [ 1]  739 	ld count,a 
      008AE4 CD 8A            [ 1]  740 	ld a,#CR
      008AE6 15 A6 32         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      000C23                        742 	_drop VSIZE 
      008AE9 CD 89            [ 2]    1     addw sp,#VSIZE 
      008AEB 90 A6            [ 2]  743 	popw y 
      008AED 4B               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      000C28                        752 print_hex::
      008AEE CD               [ 1]  753 	push a 
      008AEF 89               [ 1]  754 	swap a 
      008AF0 90 81 3F         [ 4]  755 	call to_hex_char 
      008AF2 CD 09 10         [ 4]  756 	call putc 
      008AF2 90 89            [ 1]  757     ld a,(1,sp) 
      008AF4 52 04 5F         [ 4]  758 	call to_hex_char
      008AF7 1F 02 1F         [ 4]  759 	call putc
      008AFA 03 03            [ 1]  760 	ld a,#SPACE 
      008AFC 04 90 AE         [ 4]  761 	call putc 
      008AFF 16               [ 1]  762 	pop a 
      008B00 68               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008B01                        772 to_hex_char::
      008B01 CD 89            [ 1]  773 	and a,#15 
      008B03 A0 6B            [ 1]  774 	cp a,#9 
      008B05 01 A1            [ 2]  775 	jrule 1$ 
      008B07 1B 26            [ 1]  776 	add a,#7
      008B09 05 CD            [ 1]  777 1$: add a,#'0 
      008B0B 89               [ 4]  778 	ret 
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
      000C4A                         51 search_lineno::
      000C4A                         52 	_vars VSIZE
      008B0C C7 6B            [ 2]    1     sub sp,#VSIZE 
      008B0E 01 A1            [ 1]   53 	clr (LL,sp)
      008B10 0D 26 03 CC      [ 2]   54 	ldw y,txtbgn
      008B14 8C               [ 1]   55 	tnz a 
      008B15 8E A1            [ 1]   56 	jreq search_ln_loop
      008B17 0A 26 03 CC      [ 2]   57 	ldw y,basicptr 
      000C59                         58 search_ln_loop:
      008B1B 8C 8E 00 1D      [ 2]   59 	cpw y,txtend 
      008B1D 2A 10            [ 1]   60 	jrpl 8$
      008B1D A1 08            [ 1]   61 	cpw x,(y)
      008B1F 26 12            [ 1]   62 	jreq 9$
      008B21 0D 03            [ 1]   63 	jrmi 8$ 
      008B23 27 DC A6         [ 1]   64 	ld a,(2,y)
      008B26 01 CD            [ 1]   65 	ld (LB,sp),a 
      008B28 8A 3E 0A         [ 2]   66 	addw y,(LL,sp)
      008B2B 03 90            [ 2]   67 	jra search_ln_loop 
      000C6F                         68 8$: 
      008B2D 5A               [ 1]   69 	clrw x 	
      008B2E 7B               [ 1]   70 	exgw x,y 
      000C71                         71 9$: _drop VSIZE
      008B2F 03 CC            [ 2]    1     addw sp,#VSIZE 
      008B31 8C               [ 1]   72 	exgw x,y   
      008B32 3A               [ 4]   73 	ret 
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
      008B33                         83 del_line: 
      000C75                         84 	_vars VSIZE 
      008B33 A1 04            [ 2]    1     sub sp,#VSIZE 
      008B35 26 1A            [ 1]   85 	ld a,(2,x) ; line length
      008B37 CD 8A            [ 1]   86 	ld (LLEN+1,sp),a 
      008B39 E4 7B            [ 1]   87 	clr (LLEN,sp)
      008B3B 03 4C            [ 1]   88 	ldw y,x  
      008B3D CD 8A 3E         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B40 A6 3E            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B42 CD 89 90 90      [ 2]   91 	ldw y,txtend 
      008B46 AE 16 68         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B49 90 7F 0F 02      [ 2]   93 	ldw acc16,y 
      008B4D 0F 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B4F 20 B0 B7         [ 4]   95 	call move
      008B51 90 CE 00 1D      [ 2]   96 	ldw y,txtend 
      008B51 A1 12 26         [ 2]   97 	subw y,(LLEN,sp)
      008B54 1E 0D 02 26      [ 2]   98 	ldw txtend,y  
      000C9F                         99 	_drop VSIZE     
      008B58 A8 90            [ 2]    1     addw sp,#VSIZE 
      008B5A AE               [ 4]  100 	ret 
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
      000CA2                        115 create_gap:
      000CA2                        116 	_vars VSIZE
      008B5B 16 68            [ 2]    1     sub sp,#VSIZE 
      008B5D 93 CD            [ 2]  117 	ldw (SRC,sp),x 
      008B5F 94 0B            [ 2]  118 	ldw (LEN,sp),y 
      008B61 4D 27 9D 6B      [ 2]  119 	ldw acc16,y 
      008B65 02 6B            [ 1]  120 	ldw y,x ; SRC
      008B67 03 93 CD 89      [ 2]  121 	addw x,acc16  
      008B6B ED 0F            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008B6D 01 72 F9         [ 2]  124 	ldw x,txtend 
      008B70 01 20 8E         [ 2]  125 	subw x,(SRC,sp)
      008B73 CF 00 0D         [ 2]  126 	ldw acc16,x ; size to move
      008B73 A1 05            [ 2]  127 	ldw x,(DEST,sp) 
      008B75 26 41 AE         [ 4]  128 	call move
      008B78 16 68 CD         [ 2]  129 	ldw x,txtend
      008B7B 98 B8 CE         [ 2]  130 	addw x,(LEN,sp)
      008B7E 00 0E CD         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      000CCB                        132 9$:	_drop VSIZE 
      008B81 8C CA            [ 2]    1     addw sp,#VSIZE 
      008B83 5D               [ 4]  133 	ret 
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
      000CCE                        150 insert_line:
      000CCE                        151 	_vars VSIZE 
      008B84 26 03            [ 2]    1     sub sp,#VSIZE 
      008B86 CC 8C 8E         [ 2]  152 	ldw x,txtend  
      008B89 C3 00 1B         [ 2]  153 	cpw x,txtbgn 
      008B89 CF 00            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008B8B 05 E6 02         [ 2]  156 	ldw x,#2 
      008B8E C7 00 04 90      [ 4]  157 	ld a,([ptr16],x)
      008B92 AE 16            [ 1]  158 	cp a,#3
      008B94 68 CD            [ 1]  159 	jreq insert_ln_exit
      008B96 92               [ 1]  160 	clrw x 
      008B97 27               [ 1]  161 	ld xl,a
      008B98 0F 01            [ 2]  162 	ldw (LLEN,sp),x 
      008B9A A6 0D CD         [ 2]  163 	ldw x,txtbgn
      008B9D 89 90            [ 2]  164 	ldw (DEST,sp),x 
      008B9F A6 3E CD         [ 2]  165 	ldw x,txtend 
      008BA2 89 90            [ 2]  166 	jra 4$
      008BA4 AE 16 68 CD      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BA8 94 0B            [ 2]  169 	ldw (LINENO,sp),x 
      008BAA 6B 02 CD         [ 2]  170 	ldw x,#2 
      008BAD 89 ED 90 93      [ 4]  171 	ld a,([ptr16],x)
      008BB1 7B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BB2 02 6B            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BB4 03 CC            [ 2]  176 	ldw x,(LINENO,sp)
      008BB6 8B               [ 1]  177 	clr a 
      008BB7 01 0C 4A         [ 4]  178 	call search_lineno 
      008BB8 5D               [ 2]  179 	tnzw x 
      008BB8 A1 81            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008BBA 26 15            [ 2]  183 	ldw (DEST,sp),y 
      008BBC 7B 03            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008BBE 11 02            [ 2]  187 2$: ldw (DEST,sp),x 
      008BC0 2B 03 CC         [ 4]  188 	call del_line
      000D13                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008BC3 8B 01            [ 1]  192 	ld a,#3
      008BC5 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008BC5 A6 01            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008BC7 CD 8A            [ 2]  197 	ldw x,(DEST,sp)
      008BC9 4C 0C 03         [ 2]  198 	cpw x,txtend 
      008BCC 90 5C            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008BCE CC 8B            [ 2]  202 	ldw x,(DEST,sp)
      008BD0 01 A1            [ 2]  203 	ldw y,(LLEN,sp)
      008BD2 80 26 13         [ 4]  204 	call create_gap
      008BD5 0D 03            [ 2]  205 	jra 5$
      000D29                        206 4$: 
      008BD7 26 03 CC         [ 2]  207 	addw x,(LLEN,sp)
      008BDA 8B 01 1D         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008BDC 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008BDC A6 01 CD         [ 2]  211 	ldw acc16,x 
      008BDF 8A 3E 0A 03      [ 2]  212 	ldw y,#pad ;SRC 
      008BE3 90 5A            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008BE5 CC 8B 01         [ 4]  214 	call move 
      000D3D                        215 insert_ln_exit:	
      000D3D                        216 	_drop VSIZE
      008BE8 A1 82            [ 2]    1     addw sp,#VSIZE 
      008BEA 26               [ 4]  217 	ret
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
      000D40                        233 parse_quote: 
      000D40                        234 	_vars VSIZE 
      008BEB 0E 7B            [ 2]    1     sub sp,#VSIZE 
      008BED 03               [ 1]  235 	clr a
      008BEE CD 8A            [ 1]  236 1$:	ld (PREV,sp),a 
      000D45                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      008BF0 3E 0F 03         [ 4]  238 	ld a,([in.w],y)
      008BF3 90 AE            [ 1]  239 	jreq 6$
      008BF5 16 68 CC 8B      [ 1]  240 	inc in 
      008BF9 01 A1            [ 1]  241 	ld (CURR,sp),a 
      008BFB 83 26            [ 1]  242 	ld a,#'\
      008BFD 26 7B            [ 1]  243 	cp a, (PREV,sp)
      008BFF 03 11            [ 1]  244 	jrne 3$
      008C01 02 26            [ 1]  245 	clr (PREV,sp)
      008C03 03 CC            [ 1]  246 	ld a,(CURR,sp)
      008C05 8B 01            [ 4]  247 	callr convert_escape
      008C07 F7               [ 1]  248 	ld (x),a 
      008C07 7B               [ 1]  249 	incw x 
      008C08 02 10            [ 2]  250 	jra 2$
      000D60                        251 3$:
      008C0A 03 CD            [ 1]  252 	ld a,(CURR,sp)
      008C0C 8A 4C            [ 1]  253 	cp a,#'\'
      008C0E 7B 02            [ 1]  254 	jreq 1$
      008C10 6B 03            [ 1]  255 	cp a,#'"
      008C12 90 AE            [ 1]  256 	jreq 6$ 
      008C14 16               [ 1]  257 	ld (x),a 
      008C15 68               [ 1]  258 	incw x 
      008C16 72 5F            [ 2]  259 	jra 2$
      000D6E                        260 6$:
      008C18 00               [ 1]  261 	clr (x)
      008C19 0E               [ 1]  262 	incw x 
      008C1A C7 00            [ 1]  263 	ldw y,x 
      008C1C 0F               [ 1]  264 	clrw x 
      008C1D 72 B9            [ 1]  265 	ld a,#TK_QSTR  
      000D75                        266 	_drop VSIZE
      008C1F 00 0E            [ 2]    1     addw sp,#VSIZE 
      008C21 CC               [ 4]  267 	ret 
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
      000D78                        278 convert_escape:
      008C22 8B               [ 2]  279 	pushw x 
      008C23 01 A1 0F         [ 2]  280 	ldw x,#escaped 
      008C26 26               [ 1]  281 1$:	cp a,(x)
      008C27 08 03            [ 1]  282 	jreq 2$
      008C29 04               [ 1]  283 	tnz (x)
      008C2A CD A5            [ 1]  284 	jreq 3$
      008C2C DA               [ 1]  285 	incw x 
      008C2D CC 8B            [ 2]  286 	jra 1$
      008C2F 01 A1 84         [ 2]  287 2$: subw x,#escaped 
      008C32 26               [ 1]  288 	ld a,xl 
      008C33 11 7B            [ 1]  289 	add a,#7
      008C35 03               [ 2]  290 3$:	popw x 
      008C36 11               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    292 
      008C37 02 2A 08 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008C3A                        310 parse_integer: ; { -- n }
      008C3A 97               [ 2]  311 	pushw x 	
      008C3B 7B 02            [ 1]  312 	push #0 ; TCHAR
      008C3D CD 8A            [ 1]  313 	push #10 ; BASE=10
      008C3F A9 0A            [ 1]  314 	cp a,#'$
      008C41 02 04            [ 1]  315 	jrne 2$ 
      008C42                        316     _drop #1
      008C42 CC 8B            [ 2]    1     addw sp,##1 
      008C44 01 10            [ 1]  317 	push #16  ; BASE=16
      008C45 F7               [ 1]  318 2$:	ld (x),a 
      008C45 A1               [ 1]  319 	incw x 
      008C46 20 2A 03         [ 4]  320 	ld a,([in.w],y)
      008C49 CC 8B 01 01      [ 1]  321 	inc in 
      008C4C CD 18 2C         [ 4]  322 	call to_upper 
      008C4C A6 4F            [ 1]  323 	ld (TCHAR,sp),a 
      008C4E 11 02 2A         [ 4]  324 	call is_digit 
      008C51 03 CC            [ 1]  325 	jrc 2$
      008C53 8B 01            [ 1]  326 	ld a,#16 
      008C55 0D 04            [ 1]  327 	cp a,(BASE,sp)
      008C57 26 18            [ 1]  328 	jrne 3$ 
      008C59 7B 03            [ 1]  329 	ld a,(TCHAR,sp)
      008C5B 11 02            [ 1]  330 	cp a,#'A 
      008C5D 27 12            [ 1]  331 	jrmi 3$ 
      008C5F 7B 02            [ 1]  332 	cp a,#'G 
      008C61 97 7B            [ 1]  333 	jrmi 2$ 
      008C63 03 95 7B 01      [ 1]  334 3$: dec in 	
      008C67 CD               [ 1]  335     clr (x)
      008C68 8A 66            [ 2]  336 	ldw x,(XSAVE,sp)
      008C6A 0C 02 0C         [ 4]  337 	call atoi24
      008C6D 03 CC            [ 2]  338 	ldw y,(XSAVE,sp)
      008C6F 8B 01 0C         [ 1]  339 	ld a,acc24 
      008C71 90 F7            [ 1]  340 	ld (y),a 
      008C71 7B 01            [ 1]  341 	incw y  
      008C73 90 F7 90         [ 2]  342 	ldw x,acc16 
      008C76 5C CD            [ 2]  343 	ldw (y),x 
      008C78 89 90 7B 03      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      008C7C 11 02            [ 1]  345 	ld a,#TK_INTGR
      000DE3                        346 	_drop VSIZE  
      008C7E 2B 09            [ 2]    1     addw sp,#VSIZE 
      008C80 90               [ 4]  347 	ret 	
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
      000DE6                        364 parse_binary: ; { -- n }
      008C81 7F 0C            [ 1]  365 	push #0
      008C83 02 0C            [ 1]  366 	push #0
      008C85 03 CC            [ 1]  367 	push #0
      000DEC                        368 2$:	
      008C87 8B 01 00         [ 4]  369 	ld a,([in.w],y)
      008C89 72 5C 00 01      [ 1]  370 	inc in 
      008C89 0C 03            [ 1]  371 	cp a,#'0 
      008C8B CC 8B            [ 1]  372 	jreq 3$
      008C8D 01 31            [ 1]  373 	cp a,#'1 
      008C8E 27 02            [ 1]  374 	jreq 3$ 
      008C8E 90 AE            [ 2]  375 	jra bin_exit 
      008C90 16 68            [ 1]  376 3$: sub a,#'0 
      008C92 0F               [ 1]  377 	rrc a
      008C93 01 72            [ 1]  378 	rlc (BINARY+2,sp) 
      008C95 F9 01            [ 1]  379 	rlc (BINARY+1,sp)
      008C97 90 7F            [ 1]  380 	rlc (BINARY,sp) 
      008C99 7B 02            [ 2]  381 	jra 2$  
      000E08                        382 bin_exit:
      008C9B C7 00 04 A6      [ 1]  383 	dec in 
      008C9F 0D CD            [ 1]  384 	ldw y,x
      008CA1 89 90            [ 1]  385 	ld a,(BINARY,sp)
      008CA3 5B 04            [ 1]  386 	ld (y),a 
      008CA5 90 85            [ 1]  387 	incw y 
      008CA7 81 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008CA8 90 FF            [ 2]  389 	ldw (y),x 
      008CA8 88 4E CD 8C      [ 2]  390 	addw y,#2  
      008CAC BF CD            [ 1]  391 	ld a,#TK_INTGR 	
      000E1E                        392 	_drop VSIZE 
      008CAE 89 90            [ 2]    1     addw sp,#VSIZE 
      008CB0 7B               [ 4]  393 	ret
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
      000E21                        402 is_alpha::
      008CB1 01 CD            [ 1]  403 	cp a,#'A 
      008CB3 8C               [ 1]  404 	ccf 
      008CB4 BF CD            [ 1]  405 	jrnc 9$ 
      008CB6 89 90            [ 1]  406 	cp a,#'Z+1 
      008CB8 A6 20            [ 1]  407 	jrc 9$ 
      008CBA CD 89            [ 1]  408 	cp a,#'a 
      008CBC 90               [ 1]  409 	ccf 
      008CBD 84 81            [ 1]  410 	jrnc 9$
      008CBF A1 7B            [ 1]  411 	cp a,#'z+1
      008CBF A4               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E32                        421 is_digit::
      008CC0 0F A1            [ 1]  422 	cp a,#'0
      008CC2 09 23            [ 1]  423 	jrc 1$
      008CC4 02 AB            [ 1]  424     cp a,#'9+1
      008CC6 07               [ 1]  425 	ccf 
      008CC7 AB               [ 1]  426 1$:	ccf 
      008CC8 30               [ 4]  427     ret
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
      000E3B                        438 is_alnum::
      008CC9 81 0E 32         [ 4]  439 	call is_digit
      008CCA 25 03            [ 1]  440 	jrc 1$ 
      008CCA 52 02 0F         [ 4]  441 	call is_alpha
      008CCD 01               [ 4]  442 1$:	ret 
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



      000E44                        453 is_symbol_char: 
      008CCE 90 CE            [ 1]  454 	cp a,#'_ 
      008CD0 00 1C            [ 1]  455 	jrne 1$
      008CD2 4D               [ 1]  456 	scf 
      008CD3 27 04            [ 2]  457 	jra 9$ 
      008CD5 90 CE 00         [ 4]  458 1$:	call is_alnum 
      008CD8 05               [ 4]  459 9$: ret 
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
      008CD9                        473 parse_symbol:
      008CD9 90               [ 1]  474 	incw x ; keep space for TK_ID 
      000E50                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008CDA C3 00 1E         [ 4]  477 	call to_upper  
      008CDD 2A               [ 1]  478 	ld (x), a 
      008CDE 10               [ 1]  479 	incw x
      008CDF 90 F3 27         [ 4]  480 	ld a,([in.w],y)
      008CE2 0E 2B 0A 90      [ 1]  481 	inc in 
      008CE6 E6 02 6B         [ 4]  482 	call is_symbol_char 
      008CE9 02 72            [ 1]  483 	jrc symb_loop 
      008CEB F9               [ 1]  484 	clr (x)
      008CEC 01 20 EA 01      [ 1]  485 	dec in  
      008CEF 81               [ 4]  486 	ret 
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
      000E67                        502 parse_keyword: 
      008CEF 5F               [ 2]  503 	pushw x ; preserve *symbol 
      008CF0 51 5B 02         [ 4]  504 	call parse_symbol
      008CF3 51 81            [ 2]  505 	ldw x,(XFIRST,sp) 
      008CF5 E6 02            [ 1]  506 	ld a,(2,x)
      008CF5 52 04            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008CF7 E6 02            [ 1]  509 	ld a,(1,x) 
      008CF9 6B 02            [ 1]  510 	sub a,#'A 
      008CFB 0F 01 90         [ 2]  511 	ldw x,#3 
      008CFE 93               [ 4]  512 	mul x,a 
      008CFF 72 F9 01         [ 2]  513 	addw x,#vars 
      008D02 17 03            [ 1]  514 	ld a,#TK_VAR 
      008D04 90 CE            [ 2]  515 	jra 4$ 
      000E80                        516 2$: ; check for keyword, otherwise syntax error.
      000E80                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D06 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D09 F2 03            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D0B 90 CF            [ 1]  519 	incw y 
      008D0D 00 0E 16         [ 4]  520 	call search_dict
      008D10 03               [ 1]  521 	tnz a
      008D11 CD 94            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D13 37 90            [ 2]  525 	ldw y,(XFIRST,sp)
      008D15 CE 00            [ 1]  526 	ld a,#TK_LABEL 
      008D17 1E 72            [ 1]  527 	ld (y),a 
      008D19 F2 01            [ 1]  528 	incw y
      008D1B 90               [ 1]  529 	ldw x,y 
      008D1C CF 00 1E         [ 4]  530 	call strlen
      008D1F 5B 04            [ 1]  531 	cp a,#15 
      008D21 81 02            [ 2]  532 	jrule 22$ 
      008D22 A6 0F            [ 1]  533 	ld a,#15
      000E9F                        534 22$:	
      008D22 52               [ 1]  535 	push a 
      000EA0                        536 24$:
      008D23 06 1F            [ 1]  537     ld a,(y)
      008D25 03 17            [ 1]  538 	jreq 3$
      008D27 05 90            [ 1]  539 	incw y
      008D29 CF 00            [ 1]  540 	dec (1,sp) 
      008D2B 0E 90            [ 1]  541 	jrne 24$
      008D2D 93               [ 1]  542 	clr a 
      008D2E 72 BB            [ 1]  543 	ld (y),a 
      008D30 00 0E            [ 1]  544 3$: incw y 
      000EAF                        545 	_drop 1 
      008D32 1F 01            [ 2]    1     addw sp,#1 
      008D34 CE 00            [ 1]  546 	ld a,#TK_LABEL 
      008D36 1E               [ 1]  547 	clrw x 	
      008D37 72 F0            [ 2]  548 	jra 5$ 
      000EB6                        549 4$:	
      008D39 03 CF            [ 2]  550 	ldw y,(XFIRST,sp)
      008D3B 00 0E            [ 1]  551 	cp a,#TK_NOT 
      008D3D 1E 01            [ 1]  552 	jrmi 41$
      008D3F CD 94            [ 1]  553 	ld (y),a 
      008D41 37 CE            [ 1]  554 	incw y 
      008D43 00 1E            [ 2]  555 	jra 5$ 
      000EC2                        556 41$:	
      008D45 72 FB 05         [ 2]  557 	cpw x,#let  
      008D48 CF 00            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D4A 1E 5B            [ 1]  559 	ld (y),a 
      008D4C 06 81            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008D4E 90 FF            [ 2]  561 	ldw (y),x
      008D4E 52 08 CE 00      [ 2]  562 	addw y,#2  
      000ED1                        563 5$:	_drop VSIZE 
      008D52 1E C3            [ 2]    1     addw sp,#VSIZE 
      008D54 00               [ 4]  564 	ret  	
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
      000ED4                        575 skip:
      008D55 1C               [ 1]  576 	push a
      008D56 26 19 AE         [ 4]  577 1$:	ld a,([in.w],y)
      008D59 00 02            [ 1]  578 	jreq 2$
      008D5B 72 D6            [ 1]  579 	cp a,(C,sp)
      008D5D 00 1A            [ 1]  580 	jrne 2$
      008D5F A1 03 27 5A      [ 1]  581 	inc in
      008D63 5F 97            [ 2]  582 	jra 1$
      000EE4                        583 2$: _drop 1 
      008D65 1F 07            [ 2]    1     addw sp,#1 
      008D67 CE               [ 4]  584 	ret
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
      000EE7                        609 get_token:: 
      000EE7                        610 	_vars VSIZE
      008D68 00 1C            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000EE9                        616 0$: 
      008D6A 1F 01 CE 00      [ 2]  617 	ldw y,#tib    	
      008D6E 1E 20            [ 1]  618 	ld a,#SPACE
      008D70 38 72 CE         [ 4]  619 	call skip
      008D73 00 1A 1F 05 AE   [ 1]  620 	mov in.saved,in 
      008D78 00 02 72         [ 4]  621 	ld a,([in.w],y)
      008D7B D6 00            [ 1]  622 	jrne 1$
      008D7D 1A 97            [ 1]  623 	ldw y,x 
      008D7F 1F 07 1E         [ 2]  624 	jp token_exit ; end of line 
      008D82 05 4F CD 8C      [ 1]  625 1$:	inc in 
      008D86 CA 5D 26         [ 4]  626 	call to_upper 
      008D89 04 17            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F0A                        629 str_tst:  	
      000F0A                        630 	_case '"' nbr_tst
      008D8B 01 20            [ 1]    1 	ld a,#'"' 
      008D8D 05 1F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8F 01 CD            [ 1]    3 	jrne nbr_tst
      008D91 8C F5            [ 1]  631 	ld a,#TK_QSTR
      008D93 F7               [ 1]  632 	ld (x),a 
      008D93 A6               [ 1]  633 	incw x 
      008D94 03 11 08         [ 4]  634 	call parse_quote
      008D97 27 24 1E         [ 2]  635 	jp token_exit
      000F1A                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008D9A 01 C3            [ 1]  638 	ld a,#'$'
      008D9C 00 1E            [ 1]  639 	cp a,(TCHAR,sp) 
      008D9E 27 09            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DA0 1E 01            [ 1]  642 	ld a,#'&
      008DA2 16 07            [ 1]  643 	cp a,(TCHAR,sp)
      008DA4 CD 8D            [ 1]  644 	jrne 0$
      008DA6 22 20            [ 1]  645 	ld a,#TK_INTGR
      008DA8 06               [ 1]  646 	ld (x),a 
      008DA9 5C               [ 1]  647 	incw x 
      008DA9 72 FB 07         [ 4]  648 	call parse_binary ; expect binary integer 
      008DAC CF 00 1E         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DAF 1E 07            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DB1 CF 00 0E         [ 4]  652 	call is_digit
      008DB4 90 AE            [ 1]  653 	jrnc 3$
      008DB6 16 B8            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DB8 1E               [ 1]  655 	ld (x),a 
      008DB9 01               [ 1]  656 	incw x 
      008DBA CD 94            [ 1]  657 	ld a,(TCHAR,sp)
      008DBC 37 0D 95         [ 4]  658 	call parse_integer 
      008DBD CC 10 98         [ 2]  659 	jp token_exit 
      000F43                        660 3$: 
      000F43                        661 	_case '(' bkslsh_tst 
      008DBD 5B 08            [ 1]    1 	ld a,#'(' 
      008DBF 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC0 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008DC0 52 02            [ 1]  662 	ld a,#TK_LPAREN
      008DC2 4F 6B 01         [ 2]  663 	jp token_char   	
      008DC5                        664 bkslsh_tst: ; character token 
      000F4E                        665 	_case '\',rparnt_tst
      008DC5 91 D6            [ 1]    1 	ld a,#'\' 
      008DC7 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC9 24 72            [ 1]    3 	jrne rparnt_tst
      008DCB 5C 00            [ 1]  666 	ld a,#TK_CHAR 
      008DCD 02               [ 1]  667 	ld (x),a 
      008DCE 6B               [ 1]  668 	incw x 
      008DCF 02 A6 5C         [ 4]  669 	ld a,([in.w],y)
      008DD2 11               [ 1]  670 	ld (x),a 
      008DD3 01               [ 1]  671 	incw x
      008DD4 26 0A            [ 1]  672 	ldw y,x 	 
      008DD6 0F 01 7B 02      [ 1]  673 	inc in  
      008DDA AD               [ 1]  674 	clrw x 
      008DDB 1C               [ 1]  675 	ld xl,a 
      008DDC F7 5C            [ 1]  676 	ld a,#TK_CHAR 
      008DDE 20 E5 98         [ 2]  677 	jp token_exit 
      008DE0                        678 rparnt_tst:		
      000F6A                        679 	_case ')' colon_tst 
      008DE0 7B 02            [ 1]    1 	ld a,#')' 
      008DE2 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE4 27 DD            [ 1]    3 	jrne colon_tst
      008DE6 A1 22            [ 1]  680 	ld a,#TK_RPAREN 
      008DE8 27 04 F7         [ 2]  681 	jp token_char
      000F75                        682 colon_tst:
      000F75                        683 	_case ':' comma_tst 
      008DEB 5C 20            [ 1]    1 	ld a,#':' 
      008DED D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEE 26 05            [ 1]    3 	jrne comma_tst
      008DEE 7F 5C            [ 1]  684 	ld a,#TK_COLON 
      008DF0 90 93 5F         [ 2]  685 	jp token_char  
      000F80                        686 comma_tst:
      000F80                        687 	_case COMMA sharp_tst 
      008DF3 A6 02            [ 1]    1 	ld a,#COMMA 
      008DF5 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF7 81 05            [ 1]    3 	jrne sharp_tst
      008DF8 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008DF8 89 AE 8E         [ 2]  689 	jp token_char
      000F8B                        690 sharp_tst:
      000F8B                        691 	_case SHARP dash_tst 
      008DFB 0D F1            [ 1]    1 	ld a,#SHARP 
      008DFD 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFF 7D 27            [ 1]    3 	jrne dash_tst
      008E01 09 5C            [ 1]  692 	ld a,#TK_SHARP
      008E03 20 F7 1D         [ 2]  693 	jp token_char  	 	 
      000F96                        694 dash_tst: 	
      000F96                        695 	_case '-' at_tst 
      008E06 8E 0D            [ 1]    1 	ld a,#'-' 
      008E08 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0A 07 85            [ 1]    3 	jrne at_tst
      008E0C 81 61            [ 1]  696 	ld a,#TK_MINUS  
      008E0E 62 74 6E         [ 2]  697 	jp token_char 
      000FA1                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      000FA1                        699 	_case '@' qmark_tst 
      008E11 76 66            [ 1]    1 	ld a,#'@' 
      008E13 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E15 26 05            [ 1]    3 	jrne qmark_tst
      008E15 89 4B            [ 1]  700 	ld a,#TK_ARRAY 
      008E17 00 4B 0A         [ 2]  701 	jp token_char
      000FAC                        702 qmark_tst:
      000FAC                        703 	_case '?' tick_tst 
      008E1A A1 24            [ 1]    1 	ld a,#'?' 
      008E1C 26 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1E 5B 01            [ 1]    3 	jrne tick_tst
      008E20 4B 10            [ 1]  704 	ld a,#TK_CMD  
      008E22 F7               [ 1]  705 	ld (x),a 
      008E23 5C               [ 1]  706 	incw x 
      008E24 91 D6            [ 1]  707 	ldw y,x 
      008E26 01 72 5C         [ 2]  708 	ldw x,#print
      008E29 00 02            [ 2]  709 	ldw (y),x 
      008E2B CD 98 AC 6B      [ 2]  710 	addw y,#2
      008E2F 02 CD 8E         [ 2]  711 	jp token_exit
      000FC4                        712 tick_tst: ; comment 
      000FC4                        713 	_case TICK plus_tst 
      008E32 B2 25            [ 1]    1 	ld a,#TICK 
      008E34 ED A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E36 10 11            [ 1]    3 	jrne plus_tst
      008E38 01 26            [ 1]  714 	ld a,#TK_CMD
      008E3A 0A               [ 1]  715 	ld (x),a 
      008E3B 7B               [ 1]  716 	incw x
      008E3C 02 A1 41 2B      [ 2]  717 	ldw y,#remark 
      008E40 04               [ 2]  718 	ldw (x),y 
      008E41 A1 47 2B         [ 2]  719 	addw x,#2  
      000FD6                        720 copy_comment:
      008E44 DD 72 5A 00      [ 2]  721 	ldw y,#tib 
      008E48 02 7F 1E 03      [ 2]  722 	addw y,in.w
      008E4C CD 98            [ 2]  723 	pushw y 
      008E4E B8 16 03         [ 4]  724 	call strcpy
      008E51 C6 00 0D         [ 2]  725 	subw y,(1,sp)
      008E54 90 F7            [ 1]  726 	incw y ; strlen+1 
      008E56 90 5C            [ 2]  727 	ldw (1,sp),y 
      008E58 CE 00 0E         [ 2]  728 	addw x,(1,sp) 
      000FED                        729 	_drop 2 
      008E5B 90 FF            [ 2]    1     addw sp,#2 
      008E5D 72               [ 1]  730 	clr a 
      008E5E A9 00            [ 1]  731 	ldw y,x 
      008E60 02 A6 84         [ 2]  732 	jp token_exit 
      000FF5                        733 plus_tst:
      000FF5                        734 	_case '+' star_tst 
      008E63 5B 04            [ 1]    1 	ld a,#'+' 
      008E65 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E66 26 05            [ 1]    3 	jrne star_tst
      008E66 4B 00            [ 1]  735 	ld a,#TK_PLUS  
      008E68 4B 00 4B         [ 2]  736 	jp token_char 
      001000                        737 star_tst:
      001000                        738 	_case '*' slash_tst 
      008E6B 00 2A            [ 1]    1 	ld a,#'*' 
      008E6C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008E6C 91 D6            [ 1]    3 	jrne slash_tst
      008E6E 01 72            [ 1]  739 	ld a,#TK_MULT 
      008E70 5C 00 02         [ 2]  740 	jp token_char 
      00100B                        741 slash_tst: 
      00100B                        742 	_case '/' prcnt_tst 
      008E73 A1 30            [ 1]    1 	ld a,#'/' 
      008E75 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E77 A1 31            [ 1]    3 	jrne prcnt_tst
      008E79 27 02            [ 1]  743 	ld a,#TK_DIV 
      008E7B 20 0B A0         [ 2]  744 	jp token_char 
      001016                        745 prcnt_tst:
      001016                        746 	_case '%' eql_tst 
      008E7E 30 46            [ 1]    1 	ld a,#'%' 
      008E80 09 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008E82 09 02            [ 1]    3 	jrne eql_tst
      008E84 09 01            [ 1]  747 	ld a,#TK_MOD
      008E86 20 E4 94         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      008E88                        750 eql_tst:
      001021                        751 	_case '=' gt_tst 		
      008E88 72 5A            [ 1]    1 	ld a,#'=' 
      008E8A 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8C 90 93            [ 1]    3 	jrne gt_tst
      008E8E 7B 01            [ 1]  752 	ld a,#TK_EQUAL
      008E90 90 F7 90         [ 2]  753 	jp token_char 
      00102C                        754 gt_tst:
      00102C                        755 	_case '>' lt_tst 
      008E93 5C 1E            [ 1]    1 	ld a,#'>' 
      008E95 02 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008E97 FF 72            [ 1]    3 	jrne lt_tst
      008E99 A9 00            [ 1]  756 	ld a,#TK_GT 
      008E9B 02 A6            [ 1]  757 	ld (ATTRIB,sp),a 
      008E9D 84 5B 03         [ 4]  758 	ld a,([in.w],y)
      008EA0 81 5C 00 01      [ 1]  759 	inc in 
      008EA1 A1 3D            [ 1]  760 	cp a,#'=
      008EA1 A1 41            [ 1]  761 	jrne 1$
      008EA3 8C 24            [ 1]  762 	ld a,#TK_GE 
      008EA5 0B A1            [ 2]  763 	jra token_char  
      008EA7 5B 25            [ 1]  764 1$: cp a,#'<
      008EA9 07 A1            [ 1]  765 	jrne 2$
      008EAB 61 8C            [ 1]  766 	ld a,#TK_NE 
      008EAD 24 02            [ 2]  767 	jra token_char 
      008EAF A1 7B 81 01      [ 1]  768 2$: dec in
      008EB2 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      008EB2 A1 30            [ 2]  770 	jra token_char 	 
      001055                        771 lt_tst:
      001055                        772 	_case '<' other
      008EB4 25 03            [ 1]    1 	ld a,#'<' 
      008EB6 A1 3A            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB8 8C 8C            [ 1]    3 	jrne other
      008EBA 81 34            [ 1]  773 	ld a,#TK_LT 
      008EBB 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      008EBB CD 8E B2         [ 4]  775 	ld a,([in.w],y)
      008EBE 25 03 CD 8E      [ 1]  776 	inc in 
      008EC2 A1 81            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008EC4 26 04            [ 1]  778 	jrne 1$
      008EC4 A1 5F            [ 1]  779 	ld a,#TK_LE 
      008EC6 26 03            [ 2]  780 	jra token_char 
      008EC8 99 20            [ 1]  781 1$: cp a,#'>
      008ECA 03 CD            [ 1]  782 	jrne 2$
      008ECC 8E BB            [ 1]  783 	ld a,#TK_NE 
      008ECE 81 1E            [ 2]  784 	jra token_char 
      008ECF 72 5A 00 01      [ 1]  785 2$: dec in 
      008ECF 5C 02            [ 1]  786 	ld a,(ATTRIB,sp)
      008ED0 20 16            [ 2]  787 	jra token_char 	
      00107E                        788 other: ; not a special character 	 
      008ED0 CD 98            [ 1]  789 	ld a,(TCHAR,sp)
      008ED2 AC F7 5C         [ 4]  790 	call is_alpha 
      008ED5 91 D6            [ 1]  791 	jrc 30$ 
      008ED7 01 72 5C         [ 2]  792 	jp syntax_error 
      001088                        793 30$: 
      008EDA 00 02 CD         [ 4]  794 	call parse_keyword
      008EDD 8E C4 25         [ 2]  795 	cpw x,#remark 
      008EE0 EF 7F            [ 1]  796 	jrne token_exit 
      008EE2 72               [ 1]  797 	ldw x,y 
      008EE3 5A 00 02         [ 2]  798 	jp copy_comment 
      001094                        799 token_char:
      008EE6 81               [ 1]  800 	ld (x),a 
      008EE7 5C               [ 1]  801 	incw x
      008EE7 89 CD            [ 1]  802 	ldw y,x 
      001098                        803 token_exit:
      001098                        804 	_drop VSIZE 
      008EE9 8E CF            [ 2]    1     addw sp,#VSIZE 
      008EEB 1E               [ 4]  805 	ret
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
      00109B                        825 compile::
      008EEC 01 E6            [ 2]  826 	pushw y 
      00109D                        827 	_vars VSIZE 
      008EEE 02 26            [ 2]    1     sub sp,#VSIZE 
      008EF0 0F E6 01 A0 41   [ 1]  828 	mov basicptr,txtbgn
      008EF5 AE 00 03 42      [ 1]  829 	bset flags,#FCOMP 
      008EF9 1C 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      008EFB 31 A6 85         [ 2]  831 	ldw x,#0
      008EFE 20 36 B8         [ 2]  832 	ldw pad,x ; destination buffer 
      008F00 C7 16 BA         [ 1]  833 	ld pad+2,a ; count 
      008F00 AE B3 4E         [ 2]  834 	ldw x,#pad+3
      008F03 16 01 90 5C      [ 1]  835 	clr in 
      008F07 CD 99 3B         [ 4]  836 	call get_token
      008F0A 4D 26            [ 1]  837 	cp a,#TK_INTGR
      008F0C 29 16            [ 1]  838 	jrne 2$
      008F0E 01 A6 03         [ 2]  839 	cpw x,#1 
      008F11 90 F7            [ 1]  840 	jrpl 1$
      008F13 90 5C            [ 1]  841 	ld a,#ERR_BAD_VALUE
      008F15 93 CD 94         [ 2]  842 	jp tb_error
      008F18 0B A1 0F         [ 2]  843 1$:	ldw pad,x 
      008F1B 23 02 A6 0F      [ 2]  844 	ldw y,#pad+3 
      008F1F 90 A3 17 74      [ 2]  845 2$:	cpw y,#stack_full 
      008F1F 88 05            [ 1]  846 	jrult 3$
      008F20 A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      008F20 90 F6 27         [ 2]  848 	jp tb_error 
      0010DD                        849 3$:	
      008F23 09               [ 1]  850 	ldw x,y 
      008F24 90 5C 0A         [ 4]  851 	call get_token 
      008F27 01 26            [ 1]  852 	cp a,#TK_NONE 
      008F29 F6 4F            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      008F2B 90 F7 90 5C      [ 2]  855 	subw y,#pad
      008F2F 5B 01            [ 1]  856     ld a,yl
      008F31 A6 03 5F         [ 2]  857 	ldw x,#pad 
      008F34 20 1B 19         [ 2]  858 	ldw ptr16,x 
      008F36 E7 02            [ 1]  859 	ld (2,x),a 
      008F36 16               [ 2]  860 	ldw x,(x)
      008F37 01 A1            [ 1]  861 	jreq 10$
      008F39 87 2B 06         [ 4]  862 	call insert_line
      008F3C 90 F7 90 5C      [ 1]  863 	clr  count 
      008F40 20 0F            [ 2]  864 	jra  11$ 
      008F42                        865 10$: ; line# is zero 
      008F42 A3 9C BA         [ 2]  866 	ldw x,ptr16  
      008F45 27 0A 90         [ 2]  867 	ldw basicptr,x 
      008F48 F7 90            [ 1]  868 	ld a,(2,x)
      008F4A 5C 90 FF         [ 1]  869 	ld count,a 
      008F4D 72 A9 00 02      [ 1]  870 	mov in,#3 
      00110E                        871 11$:
      00110E                        872 	_drop VSIZE 
      008F51 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F53 81 1B 00 22      [ 1]  873 	bres flags,#FCOMP 
      008F54 90 85            [ 2]  874 	popw y 
      008F54 88               [ 4]  875 	ret 
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
      001117                         48 cpy_cmd_name:
      008F55 91               [ 2]   49 	tnzw x 
      008F56 D6 01            [ 1]   50 	jreq 10$
      008F58 27               [ 1]   51 	ld a,(x)
      008F59 0A               [ 1]   52 	incw x
      008F5A 11 01            [ 1]   53 	and a,#15  
      008F5C 26               [ 1]   54 	push a 
      008F5D 06 72            [ 1]   55     tnz (1,sp) 
      008F5F 5C 00            [ 1]   56 	jreq 9$
      008F61 02               [ 1]   57 1$:	ld a,(x)
      008F62 20 F1            [ 1]   58 	ld (y),a  
      008F64 5B               [ 1]   59 	incw x
      008F65 01 81            [ 1]   60 	incw y 
      008F67 0A 01            [ 1]   61 	dec (1,sp)	 
      008F67 52 02            [ 1]   62 	jrne 1$
      008F69 84               [ 1]   63 9$: pop a 
      00112E                         64 10$: 
      008F69 90               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00112F                         75 add_space:
      008F6A AE 16            [ 2]   76 	decw y 
      008F6C 68 A6            [ 1]   77 	ld a,(y)
      008F6E 20 CD            [ 1]   78 	incw y
      008F70 8F 54            [ 1]   79 	cp a,#') 
      008F72 55 00            [ 1]   80 	jreq 0$
      008F74 02 00 03         [ 4]   81 	call is_alnum 
      008F77 91 D6            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00113E                         83 0$: 
      008F79 01 26            [ 1]   84 	ld a,#SPACE 
      008F7B 05 90            [ 1]   85 	ld (y),a 
      008F7D 93 CC            [ 1]   86 	incw y 
      008F7F 91               [ 4]   87 1$: ret 
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
      001145                         99 right_align::
      008F80 18               [ 1]  100 	push a 
      008F81 72 5C            [ 1]  101 0$: ld a,(1,sp)
      008F83 00 02 CD         [ 1]  102 	cp a,tab_width 
      008F86 98 AC            [ 1]  103 	jrpl 1$
      008F88 6B 01            [ 1]  104 	ld a,#SPACE 
      008F8A 5A               [ 2]  105 	decw x
      008F8A A6               [ 1]  106 	ld (x),a  
      008F8B 22 11            [ 1]  107 	inc (1,sp)
      008F8D 01 26            [ 2]  108 	jra 0$ 
      008F8F 0A               [ 1]  109 1$: pop a 	
      008F90 A6               [ 4]  110 	ret 
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
      001157                        123 cpy_quote:
      008F91 02 F7            [ 1]  124 	ld a,#'"
      008F93 5C CD            [ 1]  125 	ld (y),a 
      008F95 8D C0            [ 1]  126 	incw y 
      008F97 CC               [ 2]  127 	pushw x 
      008F98 91 18 67         [ 4]  128 	call skip_string 
      008F9A 85               [ 2]  129 	popw x 
      008F9A A6               [ 1]  130 1$:	ld a,(x)
      008F9B 24 11            [ 1]  131 	jreq 9$
      008F9D 01               [ 1]  132 	incw x 
      008F9E 27 17            [ 1]  133 	cp a,#SPACE 
      008FA0 A6 26            [ 1]  134 	jrult 3$
      008FA2 11 01            [ 1]  135 	ld (y),a
      008FA4 26 0A            [ 1]  136 	incw y 
      008FA6 A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      008FA8 F7 5C            [ 1]  138 	jrne 1$ 
      001172                        139 2$:
      008FAA CD 8E            [ 1]  140 	ld (y),a
      008FAC 66 CC            [ 1]  141 	incw y  
      008FAE 91 18            [ 2]  142 	jra 1$
      008FB0 7B               [ 1]  143 3$: push a 
      008FB1 01 CD            [ 1]  144 	ld a,#'\
      008FB3 8E B2            [ 1]  145 	ld (y),a 
      008FB5 24 0C            [ 1]  146 	incw y  
      008FB7 A6               [ 1]  147 	pop a 
      008FB8 84 F7            [ 1]  148 	sub a,#7
      008FBA 5C 7B 01         [ 1]  149 	ld acc8,a 
      008FBD CD 8E 15 CC      [ 1]  150 	clr acc16
      008FC1 91               [ 2]  151 	pushw x
      008FC2 18 0D 8D         [ 2]  152 	ldw x,#escaped 
      008FC3 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      008FC3 A6               [ 1]  154 	ld a,(x)
      008FC4 28               [ 2]  155 	popw x
      008FC5 11 01            [ 2]  156 	jra 2$
      008FC7 26 05            [ 1]  157 9$: ld a,#'"
      008FC9 A6 06            [ 1]  158 	ld (y),a 
      008FCB CC 91            [ 1]  159 	incw y  
      008FCD 14               [ 1]  160 	incw x 
      008FCE 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      00119D                        171 var_name::
      008FCE A6 5C 11         [ 2]  172 		subw x,#vars 
      008FD1 01 26            [ 1]  173 		ld a,#3
      008FD3 16               [ 2]  174 		div x,a 
      008FD4 A6               [ 1]  175 		ld a,xl 
      008FD5 04 F7            [ 1]  176 		add a,#'A 
      008FD7 5C               [ 4]  177 		ret 
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
      0011A7                        195 decompile::
      0011A7                        196 	_vars VSIZE
      008FD8 91 D6            [ 2]    1     sub sp,#VSIZE 
      008FDA 01 F7 5C         [ 1]  197 	ld a,base
      008FDD 90 93            [ 1]  198 	ld (BASE_SAV,sp),a  
      008FDF 72 5C 00         [ 1]  199 	ld a,tab_width 
      008FE2 02 5F            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      008FE4 97 A6            [ 2]  201 	ldw (STR,sp),y   
      008FE6 04 CC 91 18      [ 5]  202 	ldw x,[basicptr] ; line number 
      008FEA 35 0A 00 0A      [ 1]  203 	mov base,#10
      008FEA A6 29 11 01      [ 1]  204 	mov tab_width,#5
      008FEE 26 05 A6 07      [ 1]  205 	clr acc24 
      008FF2 CC 91 14         [ 2]  206 	ldw acc16,x
      008FF5 4F               [ 1]  207 	clr a ; unsigned conversion 
      008FF5 A6 3A 11         [ 4]  208 	call itoa  
      008FF8 01 26 05         [ 4]  209 	call right_align 
      008FFB A6               [ 1]  210 	push a 
      008FFC 0A CC            [ 1]  211 1$:	ldw y,x ; source
      008FFE 91 14            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      009000 CD 13 A7         [ 4]  213 	call strcpy 
      009000 A6 2C            [ 1]  214 	clrw y 
      009002 11               [ 1]  215 	pop a 
      009003 01 26            [ 1]  216 	ld yl,a 
      009005 05 A6 08         [ 2]  217 	addw y,(STR,sp)
      009008 CC 91            [ 1]  218 	ld a,#SPACE 
      00900A 14 F7            [ 1]  219 	ld (y),a 
      00900B 90 5C            [ 1]  220 	incw y 
      00900B A6 23 11 01      [ 1]  221 	clr tab_width
      00900F 26 05 A6         [ 2]  222 	ldw x,#3
      009012 09 CC 91         [ 2]  223 	ldw in.w,x 
      0011EF                        224 decomp_loop:
      009015 14 89            [ 2]  225 	pushw y
      009016 CD 17 4E         [ 4]  226 	call next_token 
      009016 A6 2D            [ 2]  227 	popw y 
      009018 11               [ 1]  228 	tnz a  
      009019 01 26            [ 1]  229 	jrne 1$
      00901B 05 A6 11         [ 2]  230 	jp 20$
      00901E CC 91            [ 1]  231 1$:	jrmi 2$
      009020 14 12 8D         [ 2]  232 	jp 6$
      009021                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      009021 A6 40            [ 1]  234 	cp a,#TK_VAR 
      009023 11 01            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009025 26 05 A6         [ 4]  237 	call add_space
      009028 05 CC 91         [ 4]  238 	call get_addr   
      00902B 14 11 9D         [ 4]  239 	call var_name
      00902C 90 F7            [ 1]  240 	ld (y),a 
      00902C A6 3F            [ 1]  241 	incw y  
      00902E 11 01            [ 2]  242 	jra decomp_loop
      001214                        243 3$:
      009030 26 12            [ 1]  244 	cp a,#TK_INTGR
      009032 A6 80            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009034 F7 5C 90         [ 4]  247 	call get_int24 
      009037 93 AE A0         [ 1]  248 	ld acc24,a 
      00903A 36 90 FF         [ 2]  249 	ldw acc16,x 
      00903D 72 A9 00         [ 4]  250 	call add_space
      009040 02 CC            [ 2]  251 	pushw y 
      009042 91 18            [ 1]  252 	ld a,#255 ; signed conversion 
      009044 CD 17 D3         [ 4]  253 	call itoa  
      009044 A6 27            [ 2]  254 	ldw y,(1,sp) 
      009046 11               [ 1]  255 	push a 
      009047 01               [ 1]  256 	exgw x,y 
      009048 26 2B A6         [ 4]  257 	call strcpy 
      00904B 80 F7            [ 1]  258 	clrw y
      00904D 5C               [ 1]  259 	pop a  
      00904E 90 AE            [ 1]  260 	ld yl,a 
      009050 A1 7E FF         [ 2]  261 	addw y,(1,sp)
      00123A                        262 	_drop 2 
      009053 1C 00            [ 2]    1     addw sp,#2 
      009055 02 B1            [ 2]  263 	jra decomp_loop
      009056                        264 4$: ; dictionary keyword
      009056 90 AE            [ 1]  265 	cp a,#TK_NOT 
      009058 16 68            [ 1]  266 	jruge 50$ 
      00905A 72               [ 2]  267 	ldw x,(x)
      00905B B9 00 01 90      [ 1]  268 	inc in 
      00905F 89 CD 94 27      [ 1]  269 	inc in 
      009063 72 F2 01         [ 2]  270 	cpw x,#remark 
      009066 90 5C            [ 1]  271 	jrne 5$
      009068 17 01 72         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      00906B FB 01 5B         [ 4]  274 	call add_space
      00906E 02 4F            [ 1]  275 	ld a,#''
      009070 90 93            [ 1]  276 	ld (y),a 
      009072 CC 91            [ 1]  277 	incw y 
      00125C                        278 46$:
      009074 18 D6 00 00      [ 4]  279 	ld a,([in.w],x)
      009075 72 5C 00 01      [ 1]  280 	inc in  
      009075 A6 2B            [ 1]  281 	ld (y),a 
      009077 11 01            [ 1]  282 	incw y 
      009079 26 05 A6         [ 1]  283 	ld a,in 
      00907C 10 CC 91         [ 1]  284 	cp a,count 
      00907F 14 EC            [ 1]  285 	jrmi 46$
      009080 CC 13 1C         [ 2]  286 	jp 20$  
      009080 A6 2A 11         [ 2]  287 5$: cpw x,#let  
      009083 01 26            [ 1]  288 	jrne 54$
      009085 05 A6 20         [ 2]  289 	jp decomp_loop ; down display LET
      00127B                        290 50$:
      009088 CC               [ 1]  291 	clrw x 
      009089 91               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      00127D                        297 54$: ; insert command name 
      00908A 14 11 2F         [ 4]  298 	call add_space  
      00908B 90 89            [ 2]  299 	pushw y
      00908B A6 2F 11         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00908E 01 26            [ 2]  301 	popw y 
      009090 05 A6 21         [ 4]  302 	call cpy_cmd_name
      009093 CC 91 14         [ 2]  303 	jp decomp_loop 
      009096                        304 6$:
                                    305 ; label?
      009096 A6 25            [ 1]  306 	cp a,#TK_LABEL 
      009098 11 01            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      00909A 26 05            [ 1]  309 	ld a,#32 
      00909C A6 22            [ 1]  310 	ld (y),a 
      00909E CC 91            [ 1]  311 	incw y 
      001297                        312 61$:
      0090A0 14               [ 2]  313 	pushw x 
      0090A1 CD 17 67         [ 4]  314 	call skip_string 
      0090A1 A6               [ 2]  315 	popw x 
      00129C                        316 62$:	
      0090A2 3D               [ 1]  317 	ld a,(x)
      0090A3 11 01            [ 1]  318 	jreq 63$ 
      0090A5 26               [ 1]  319 	incw x  
      0090A6 05 A6            [ 1]  320 	ld (y),a 
      0090A8 32 CC            [ 1]  321 	incw y 
      0090AA 91 14            [ 2]  322 	jra 62$ 
      0090AC                        323 63$: 
      0090AC A6 3E            [ 1]  324 	ld a,#32 
      0090AE 11 01            [ 1]  325 	ld (y),a 
      0090B0 26 23            [ 1]  326 	incw y 
      0090B2 A6 31 6B         [ 2]  327 	jp decomp_loop
      0012AF                        328 64$:
      0090B5 02 91            [ 1]  329 	cp a,#TK_QSTR 
      0090B7 D6 01            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0090B9 72 5C 00         [ 4]  332 	call add_space
      0090BC 02 A1 3D         [ 4]  333 	call cpy_quote  
      0090BF 26 04 A6         [ 2]  334 	jp decomp_loop
      0012BC                        335 7$:
      0090C2 33 20            [ 1]  336 	cp a,#TK_CHAR 
      0090C4 4F A1            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      0090C6 3C 26 04         [ 4]  339 	call add_space 
      0090C9 A6 35            [ 1]  340 	ld a,#'\ 
      0090CB 20 47            [ 1]  341 	ld (y),a 
      0090CD 72 5A            [ 1]  342 	incw y
      0090CF 00               [ 1]  343 	ld a,(x)
      0090D0 02 7B 02 20      [ 1]  344 	inc in  
      0090D4 3F 06            [ 2]  345 	jra 81$
      0090D5 A1 0A            [ 1]  346 8$: cp a,#TK_COLON 
      0090D5 A6 3C            [ 1]  347 	jrne 9$
      0090D7 11 01            [ 1]  348 	ld a,#':
      0012D6                        349 81$:
      0090D9 26 23            [ 1]  350 	ld (y),a 
      0090DB A6 34            [ 1]  351 	incw y 
      0012DA                        352 82$:
      0090DD 6B 02 91         [ 2]  353 	jp decomp_loop
      0012DD                        354 9$: 
      0090E0 D6 01            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      0090E2 72 5C            [ 1]  356 	jrugt 10$ 
      0090E4 00 02            [ 1]  357 	sub a,#TK_ARRAY 
      0090E6 A1               [ 1]  358 	clrw x 
      0090E7 3D               [ 1]  359 	ld xl,a
      0090E8 26 04 A6         [ 2]  360 	addw x,#single_char 
      0090EB 36               [ 1]  361 	ld a,(x)
      0090EC 20 26            [ 2]  362 	jra 81$ 
      0012EB                        363 10$: 
      0090EE A1 3E            [ 1]  364 	cp a,#TK_MINUS 
      0090F0 26 04            [ 1]  365 	jrugt 11$
      0090F2 A6 35            [ 1]  366 	sub a,#TK_PLUS 
      0090F4 20               [ 1]  367 	clrw x 
      0090F5 1E               [ 1]  368 	ld xl,a 
      0090F6 72 5A 00         [ 2]  369 	addw x,#add_char 
      0090F9 02               [ 1]  370 	ld a,(x)
      0090FA 7B 02            [ 2]  371 	jra 81$
      0012F9                        372 11$:
      0090FC 20 16            [ 1]  373     cp a,#TK_MOD 
      0090FE 22 0A            [ 1]  374 	jrugt 12$
      0090FE 7B 01            [ 1]  375 	sub a,#TK_MULT
      009100 CD               [ 1]  376 	clrw x 
      009101 8E               [ 1]  377 	ld xl,a 
      009102 A1 25 03         [ 2]  378 	addw x,#mul_char
      009105 CC               [ 1]  379 	ld a,(x)
      009106 96 C7            [ 2]  380 	jra 81$
      009108                        381 12$:
      009108 CD 8E            [ 1]  382 	sub a,#TK_GT  
      00910A E7               [ 1]  383 	sll a 
      00910B A3               [ 1]  384 	clrw x 
      00910C A1               [ 1]  385 	ld xl,a 
      00910D 7E 26 08         [ 2]  386 	addw x,#relop_str 
      009110 93               [ 2]  387 	ldw x,(x)
      009111 CC               [ 1]  388 	ld a,(x)
      009112 90               [ 1]  389 	incw x 
      009113 56 F7            [ 1]  390 	ld (y),a
      009114 90 5C            [ 1]  391 	incw y 
      009114 F7               [ 1]  392 	ld a,(x)
      009115 5C 90            [ 1]  393 	jrne 81$
      009117 93 11 EF         [ 2]  394 	jp decomp_loop 
      009118                        395 20$: 
      009118 5B 02            [ 1]  396 	clr (y)
      00911A 81 03            [ 2]  397 	ldw x,(STR,sp)
      00911B 7B 01            [ 1]  398 	ld a,(BASE_SAV,sp)
      00911B 90 89 52         [ 1]  399 	ld base,a 
      00911E 02 55            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      009120 00 1C 00         [ 1]  401 	ld tab_width,a
      009123 05 72 1A         [ 2]  402 	subw y,(STR,sp) 
      009126 00 23            [ 1]  403 	ld a,yl 
      00132F                        404 	_drop VSIZE 
      009128 A6 00            [ 2]    1     addw sp,#VSIZE 
      00912A AE               [ 4]  405 	ret 
                                    406 
      00912B 00 00 CF 16 B8         407 single_char: .byte '@','(',')',',','#'
      009130 C7 16                  408 add_char: .byte '+','-'
      009132 BA AE 16               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009135 BB 72 5F 00 02 CD 8F   410 relop_str: .word gt,equal,ge,lt,ne,le 
             67 A1 84 26 11
      009141 A3 00                  411 gt: .asciz ">"
      009143 01 2A                  412 equal: .asciz "="
      009145 05 A6 0A               413 ge: .asciz ">="
      009148 CC 96                  414 lt: .asciz "<"
      00914A C9 CF 16               415 le: .asciz "<="
      00914D B8 90 AE               416 ne:  .asciz "<>"
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
      001357                        429 cmd_name:
      001357                        430 	_vars VSIZE 
      009150 16 BB            [ 2]    1     sub sp,#VSIZE 
      009152 90 A3 17 74      [ 1]  431 	clr acc16 
      009156 25 05            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      009158 A6 0F CC         [ 2]  433 	ldw x,#kword_dict	
      00915B 96 C9            [ 2]  434 1$:	ldw (LINK,sp),x
      00915D E6 02            [ 1]  435 	ld a,(2,x)
      00915D 93 CD            [ 1]  436 	and a,#15 
      00915F 8F 67 A1         [ 1]  437 	ld acc8,a 
      009162 00 26 ED         [ 2]  438 	addw x,#3
      009165 72 A2 16 B8      [ 2]  439 	addw x,acc16
      009169 90               [ 2]  440 	ldw x,(x) ; code address   
      00916A 9F AE            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      00916C 16 B8            [ 1]  442 	jreq 2$
      00916E CF 00            [ 2]  443 	ldw x,(LINK,sp)
      009170 1A               [ 2]  444 	ldw x,(x) 
      009171 E7 02 FE         [ 2]  445 	subw x,#2  
      009174 27 09            [ 1]  446 	jrne 1$
      009176 CD               [ 1]  447 	clr a 
      009177 8D               [ 1]  448 	clrw x 
      009178 4E 72            [ 2]  449 	jra 9$
      00917A 5F 00            [ 2]  450 2$: ldw x,(LINK,sp)
      00917C 04 20 0F         [ 2]  451 	addw x,#2 	
      00917F                        452 9$:	_drop VSIZE
      00917F CE 00            [ 2]    1     addw sp,#VSIZE 
      009181 1A               [ 4]  453 	ret
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
      00138B                        116 strlen::
      009182 CF               [ 2]  117 	pushw x 
      009183 00               [ 1]  118 	clr a
      009184 05               [ 1]  119 1$:	tnz (x) 
      009185 E6 02            [ 1]  120 	jreq 9$ 
      009187 C7               [ 1]  121 	inc a 
      009188 00               [ 1]  122 	incw x 
      009189 04 35            [ 2]  123 	jra 1$ 
      00918B 03               [ 2]  124 9$:	popw x 
      00918C 00               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      001396                        135 strcmp:
      00918D 02               [ 1]  136 	ld a,(x)
      00918E 27 0B            [ 1]  137 	jreq 5$ 
      00918E 5B 02            [ 1]  138 	cp a,(y) 
      009190 72 1B            [ 1]  139 	jrne 4$ 
      009192 00               [ 1]  140 	incw x 
      009193 23 90            [ 1]  141 	incw y 
      009195 85 81            [ 2]  142 	jra strcmp 
      009197                        143 4$: ; not same  
      009197 5D               [ 1]  144 	clr a 
      009198 27               [ 4]  145 	ret 
      0013A4                        146 5$: ; same 
      009199 14 F6            [ 1]  147 	ld a,#1 
      00919B 5C               [ 4]  148 	ret 
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
      0013A7                        159 strcpy::
      00919C A4               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00919D 0F               [ 2]  161 	pushw x 
      00919E 88 0D            [ 1]  162 1$: ld a,(y)
      0091A0 01 27            [ 1]  163 	jreq 9$ 
      0091A2 0A               [ 1]  164 	ld (x),a 
      0091A3 F6               [ 1]  165 	incw x 
      0091A4 90 F7            [ 1]  166 	incw y 
      0091A6 5C 90            [ 2]  167 	jra 1$ 
      0091A8 5C               [ 1]  168 9$:	clr (x)
      0091A9 0A               [ 2]  169 	popw x 
      0091AA 01               [ 1]  170 	pop a 
      0091AB 26               [ 4]  171 	ret 
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
      0013B7                        185 move::
      0091AC F6               [ 1]  186 	push a 
      0013B8                        187 	_vars VSIZE 
      0091AD 84 02            [ 2]    1     sub sp,#VSIZE 
      0091AE 0F 01            [ 1]  188 	clr (INCR,sp)
      0091AE 81 02            [ 1]  189 	clr (LB,sp)
      0091AF 90 89            [ 2]  190 	pushw y 
      0091AF 90 5A            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      0091B1 90 F6            [ 2]  192 	popw y 
      0091B3 90 5C            [ 1]  193 	jreq move_exit ; x==y 
      0091B5 A1 29            [ 1]  194 	jrmi move_down
      0013C8                        195 move_up: ; start from top address with incr=-1
      0091B7 27 05 CD 8E      [ 2]  196 	addw x,acc16
      0091BB BB 24 06 0D      [ 2]  197 	addw y,acc16
      0091BE 03 01            [ 1]  198 	cpl (INCR,sp)
      0091BE A6 20            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      0091C0 90 F7            [ 2]  200 	jra move_loop  
      0013D6                        201 move_down: ; start from bottom address with incr=1 
      0091C2 90               [ 2]  202     decw x 
      0091C3 5C 81            [ 2]  203 	decw y
      0091C5 0C 02            [ 1]  204 	inc (LB,sp) ; incr=1 
      0013DB                        205 move_loop:	
      0091C5 88 7B 01         [ 1]  206     ld a, acc16 
      0091C8 C1 00 24         [ 1]  207 	or a, acc8
      0091CB 2A 08            [ 1]  208 	jreq move_exit 
      0091CD A6 20 5A         [ 2]  209 	addw x,(INCR,sp)
      0091D0 F7 0C 01         [ 2]  210 	addw y,(INCR,sp) 
      0091D3 20 F1            [ 1]  211 	ld a,(y)
      0091D5 84               [ 1]  212 	ld (x),a 
      0091D6 81               [ 2]  213 	pushw x 
      0091D7 CE 00 0D         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0091D7 A6               [ 2]  215 	decw x 
      0091D8 22 90 F7         [ 2]  216 	ldw acc16,x 
      0091DB 90               [ 2]  217 	popw x 
      0091DC 5C 89            [ 2]  218 	jra move_loop
      0013F7                        219 move_exit:
      0013F7                        220 	_drop VSIZE
      0091DE CD 97            [ 2]    1     addw sp,#VSIZE 
      0091E0 E7               [ 1]  221 	pop a 
      0091E1 85               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      0013FB                        231 clear_vars:
      0091E2 F6               [ 2]  232 	pushw x 
      0091E3 27               [ 1]  233 	push a  
      0091E4 30 5C A1         [ 2]  234 	ldw x,#vars 
      0091E7 20 25            [ 1]  235 	ld a,#CELL_SIZE*26 
      0091E9 0E               [ 1]  236 1$:	clr (x)
      0091EA 90               [ 1]  237 	incw x 
      0091EB F7               [ 1]  238 	dec a 
      0091EC 90 5C            [ 1]  239 	jrne 1$
      0091EE A1               [ 1]  240 	pop a 
      0091EF 5C               [ 2]  241 	popw x 
      0091F0 26               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      0091F1 F0 0A 54 69 6E 79 20   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      0091F2                        253 system_information:
      0091F2 90 F7 90         [ 2]  254 	ldw x,#software 
      0091F5 5C 20 EA         [ 4]  255 	call puts 
      0091F8 88 A6            [ 1]  256 	ld a,#MAJOR 
      0091FA 5C 90 F7         [ 1]  257 	ld acc8,a 
      0091FD 90               [ 1]  258 	clrw x 
      0091FE 5C 84 A0         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009201 07 C7 00 0F      [ 1]  260 	clr tab_width  
      009205 72 5F 00 0E      [ 1]  261 	mov base, #10 
      009209 89 AE 8E         [ 4]  262 	call prt_acc24 
      00920C 0D 72            [ 1]  263 	ld a,#'.
      00920E BB 00 0E         [ 4]  264 	call putc 
      009211 F6 85            [ 1]  265 	ld a,#MINOR 
      009213 20 DD A6         [ 1]  266 	ld acc8,a 
      009216 22               [ 1]  267 	clrw x 
      009217 90 F7 90         [ 2]  268 	ldw acc24,x 
      00921A 5C 5C 81         [ 4]  269 	call prt_acc24
      00921D A6 0D            [ 1]  270 	ld a,#CR 
      00921D 1D 00 31         [ 4]  271 	call putc
                                    272 ;call test 
      009220 A6               [ 4]  273 	ret
                                    274 
      001481                        275 warm_init:
      009221 03 62 9F AB      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      009225 41 81 00 22      [ 1]  277 	clr flags 
      009227 72 5F 00 1F      [ 1]  278 	clr loop_depth 
      009227 52 04 C6 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      00922B 0B 6B 01 C6      [ 1]  280 	mov base,#10 
      00922F 00 24 6B         [ 2]  281 	ldw x,#0 
      009232 02 17 03         [ 2]  282 	ldw basicptr,x 
      009235 72 CE 00         [ 2]  283 	ldw in.w,x 
      009238 05 35 0A 00      [ 1]  284 	clr count
      00923C 0B               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      0014A3                        291 clear_basic:
      00923D 35               [ 2]  292 	pushw x 
      00923E 05 00 24 72      [ 1]  293 	clr count
      009242 5F 00 0D CF      [ 1]  294 	clr in  
      009246 00 0E 4F         [ 2]  295 	ldw x,#free_ram 
      009249 CD 98 53         [ 2]  296 	ldw txtbgn,x 
      00924C CD 91 C5         [ 2]  297 	ldw txtend,x 
      00924F 88 90 93         [ 4]  298 	call clear_vars 
      009252 1E               [ 2]  299 	popw x
      009253 04               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014BA                        305 err_msg:
      009254 CD 94 27 90 5F 84 90   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             97 72 F9 03 A6
      009260 20 90 F7 90 5C 72 5F   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             00 24 AE
      00926A 00 03 CF 00 01 D6 15   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             EA 15 FD
      00926F 16 0A                  309 	.word err_overflow 
                                    310 
      00926F 90 89 CD 97 CE 90 85   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  4D-Bits]



             66 75 6C 6C 0A 00
      009277 26 03 CC 93 9C 2B 03   312 err_syntax: .asciz "syntax error\n" 
             CC 93 0D 6F 72 0A 00
      009281 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      009281 A1 85 26 0F CD 91 AF   314 err_div0: .asciz "division by 0\n" 
             CD 97 F6 CD 92 1D 90
             F7
      009290 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      009294 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      009294 A1 84 26 26 CD 98 00   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 AF 90 89 A6 FF CD
             98 53 16 01 88
      0092AE 51 CD 94 27 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      0092BE 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0092BE A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      0092CA 02 A3 A1 7E 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 AF A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092DC 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092DC 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      0092F0 CC 93 9C A3 9C BA 26   324 err_no_fspace: .asciz "File system full.\n" 
             05 CC 92 6F 20 66 75
             6C 6C 2E 0A 00
      0092FB 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      0092FB 5F 97 65 72 66 6C 6F   326 err_overflow: .asciz "overflow\n" 
             77 0A 00
                                    327 
      0092FD 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0092FD CD 91 AF 90 89 CD 93   329 comp_msg: .asciz "\ncompile error, "
             D7 90 85 CD 91 97 CC
             92 6F 00
      00930D 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      001647                        332 syntax_error::
      00930D A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      001649                        335 tb_error::
      00930F 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      009314 F7               [ 1]  337 	push a 
      009315 90 5C 14         [ 2]  338 	ldw x, #rt_msg 
      009317 CD 09 6D         [ 4]  339 	call puts 
      009317 89               [ 1]  340 	pop a 
      009318 CD 97 E7         [ 2]  341 	ldw x, #err_msg 
      00931B 85 5F 00 0D      [ 1]  342 	clr acc16 
      00931C 48               [ 1]  343 	sll a
      00931C F6 27 07 5C      [ 1]  344 	rlc acc16  
      009320 90 F7 90         [ 1]  345 	ld acc8, a 
      009323 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      009326 FE               [ 2]  347 	ldw x,(x)
      009326 A6 20 90         [ 4]  348 	call puts
      009329 F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      00932C CC 92 6F         [ 1]  351 ld a,count 
      00932F 90 5F            [ 1]  352 clrw y 
      00932F A1 02            [ 1]  353 rlwa y  
      009331 26 09 CD         [ 4]  354 call hex_dump
      009334 91 AF CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      009337 91 D7 CC         [ 1]  357 	ld a,in 
      00933A 92 6F 92         [ 4]  358 	call prt_basic_line
      00933C AE 16 37         [ 2]  359 	ldw x,#tk_id 
      00933C A1 04 26         [ 4]  360 	call puts 
      00933F 10 CD 91         [ 1]  361 	ld a,in.saved 
      009342 AF               [ 1]  362 	clrw x 
      009343 A6               [ 1]  363 	ld xl,a 
      009344 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      009348 5C               [ 1]  365 	ld a,(x)
      009349 F6               [ 1]  366 	clrw x 
      00934A 72               [ 1]  367 	ld xl,a 
      00934B 5C 00 02         [ 4]  368 	call prt_i16
      00934E 20 06            [ 2]  369 	jra 6$
      00169A                        370 1$:	
      009350 A1               [ 1]  371 	push a 
      009351 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      009354 A6 3A 6D         [ 4]  373 	call puts 
      009356 84               [ 1]  374 	pop a 
      009356 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      009359 5C 5F 00 0D      [ 1]  376 	clr acc16 
      00935A 48               [ 1]  377 	sll a
      00935A CC 92 6F 0D      [ 1]  378 	rlc acc16  
      00935D C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00935D A1 09 22 0A      [ 2]  380 	addw x,acc16 
      009361 A0               [ 2]  381 	ldw x,(x)
      009362 05 5F 97         [ 4]  382 	call puts
      009365 1C 93 B2         [ 2]  383 	ldw x,#tib
      009368 F6 20 EB         [ 4]  384 	call puts 
      00936B A6 0D            [ 1]  385 	ld a,#CR 
      00936B A1 11 22         [ 4]  386 	call putc
      00936E 0A A0 10         [ 2]  387 	ldw x,in.w
      009371 5F 97 1C         [ 4]  388 	call spaces
      009374 93 B7            [ 1]  389 	ld a,#'^
      009376 F6 20 DD         [ 4]  390 	call putc 
      009379 AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      009379 A1               [ 1]  392     ldw sp,x
                                    393 
      0016D3                        394 warm_start:
      00937A 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      0016D6                        399 cmd_line: ; user interface 
      00937D A0 20            [ 1]  400 	ld a,#CR 
      00937F 5F 97 1C         [ 4]  401 	call putc 
      009382 93 B9            [ 1]  402 	ld a,#'> 
      009384 F6 20 CF         [ 4]  403 	call putc
      009387 CD 0A 72         [ 4]  404 	call readln
      009387 A0 31 48 5F      [ 1]  405 	tnz count 
      00938B 97 1C            [ 1]  406 	jreq cmd_line
      00938D 93 BC FE         [ 4]  407 	call compile
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
      009390 F6 5C 90 F7      [ 1]  421 	tnz count 
      009394 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016F2                        430 interpreter: 
      009396 F6 26 BD         [ 1]  431 	ld a,in 
      009399 CC 92 6F         [ 1]  432 	cp a,count 
      00939C 2B 1D            [ 1]  433 	jrmi interp_loop
      0016FA                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00939C 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      0093A1 01 C7 00         [ 2]  436 	ldw x,basicptr
      0093A4 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      0093A8 00 24 72         [ 2]  438 	cpw x,txtend 
      0093AB F2 03            [ 1]  439 	jrpl warm_start
      0093AD 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      0093B0 04 81            [ 1]  441 	ld a,(2,x)
      0093B2 40 28 29         [ 1]  442 	ld count,a 
      0093B5 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      001717                        444 interp_loop:
      0093B9 2A 2F 25         [ 4]  445 	call next_token
      0093BC 93 C8            [ 1]  446 	cp a,#TK_NONE 
      0093BE 93 CA            [ 1]  447 	jreq next_line 
      0093C0 93 CC            [ 1]  448 	cp a,#TK_CMD
      0093C2 93 CF            [ 1]  449 	jrne 1$
      001722                        450 	_get_code_addr
      0093C4 93               [ 2]    1         ldw x,(x)
      0093C5 D4 93 D1 3E      [ 1]    2         inc in 
      0093C9 00 3D 00 3E      [ 1]    3         inc in 
      0093CD 3D               [ 4]  451 	call(x)
      0093CE 00 3C            [ 2]  452 	jra interp_loop 
      00172E                        453 1$:	 
      0093D0 00 3C            [ 1]  454 	cp a,#TK_VAR
      0093D2 3D 00            [ 1]  455 	jrne 2$
      0093D4 3C 3E 00         [ 4]  456 	call let_var  
      0093D7 20 E0            [ 2]  457 	jra interp_loop 
      001737                        458 2$:	
      0093D7 52 04            [ 1]  459 	cp a,#TK_ARRAY 
      0093D9 72 5F            [ 1]  460 	jrne 3$
      0093DB 00 0E 1F         [ 4]  461 	call let_array 
      0093DE 01 AE            [ 2]  462 	jra interp_loop
      001740                        463 3$:	
      0093E0 B3 4C            [ 1]  464 	cp a,#TK_COLON 
      0093E2 1F 03            [ 1]  465 	jreq interp_loop
      0093E4 E6 02            [ 1]  466 4$: cp a,#TK_LABEL
      0093E6 A4 0F C7         [ 4]  467 	call skip_string 
      0093E9 00 0F            [ 2]  468 	jra interp_loop 
      0093EB 1C 00 03         [ 2]  469 5$:	jp syntax_error 
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
      00174E                        480 next_token::
                                    481 ;	clrw x 
      0093EE 72 BB 00         [ 1]  482 	ld a,in 
      0093F1 0E FE 13         [ 1]  483 	ld in.saved,a ; in case "_unget_token" needed 
                                    484 ; don't replace sub by "cp a,count" 
                                    485 ; if end of line must return with A=0   	
      0093F4 01 27 0C         [ 1]  486 	sub a,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0093F7 1E 03            [ 1]  487 	jreq 9$ ; end of line 
      001759                        488 0$: 
      0093F9 FE 1D 00         [ 2]  489 	ldw x,basicptr 
      0093FC 02 26 E3 4F      [ 2]  490 	addw x,in.w 
      009400 5F               [ 1]  491 	ld a,(x)
      009401 20               [ 1]  492 	incw x
      009402 05 1E 03 1C      [ 1]  493 	inc in   
      009406 00               [ 4]  494 9$: ret 
                                    495 
                                    496 ;-------------------------
                                    497 ;  skip .asciz in BASIC line 
                                    498 ;  name 
                                    499 ;  input:
                                    500 ;     x		* string 
                                    501 ;  output:
                                    502 ;     none 
                                    503 ;-------------------------
      001767                        504 skip_string:
      009407 02               [ 1]  505 	ld a,(x)
      009408 5B 04            [ 1]  506 	jreq 1$
      00940A 81               [ 1]  507 	incw x 
      000001 20 FA            [ 2]  508 	jra skip_string 
      000002 5C               [ 1]  509 1$: incw x 	
      000003 72 B0 00 04      [ 2]  510 	subw x,basicptr 
      000004 CF 00 00         [ 2]  511 	ldw in.w,x 
      000005 81               [ 4]  512 	ret 
                                    513 
                                    514 ;---------------------
                                    515 ; extract 16 bits  
                                    516 ; address from BASIC
                                    517 ; code 
                                    518 ; input:
                                    519 ;    X    *address
                                    520 ; output:
                                    521 ;    X    address 
                                    522 ;-------------------- 
      000007                        523 get_addr:
      000009 FE               [ 2]  524 	ldw x,(x)
      00000A 72 5C 00 01      [ 1]  525 	inc in 
      00000B 72 5C 00 01      [ 1]  526 	inc in 
      00000C 81               [ 4]  527 	ret 
                                    528 
                                    529 ;--------------------
                                    530 ; extract int24_t  
                                    531 ; value from BASIC 
                                    532 ; code 
                                    533 ; input:
                                    534 ;    X   *integer 
                                    535 ; output:
                                    536 ;    A:X   int24  
                                    537 ;--------------------
      00000D                        538 get_int24:
      00000E F6               [ 1]  539 	ld a,(x)
      00000F EE 01            [ 2]  540 	ldw x,(1,x)
                                    541 ; skip 3 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      000010 72 5C 00 01      [ 1]  542 	inc in 
      000013 72 5C 00 01      [ 1]  543 	inc in 
      000015 72 5C 00 01      [ 1]  544 	inc in 
      000017 81               [ 4]  545 	ret 
                                    546 
                                    547 ;-------------------------
                                    548 ; get character from 
                                    549 ; BASIC code 
                                    550 ; input:
                                    551 ;    X   *char 
                                    552 ; output:
                                    553 ;    A    char 
                                    554 ;-------------------------
      000019                        555 get_char:
      00001A F6               [ 1]  556 	ld a,(x)
      00001B 72 5C 00 01      [ 1]  557 	inc in  
      00001C 81               [ 4]  558     ret 
                                    559 
                                    560 ;-----------------------------------
                                    561 ; print a 16 bit integer 
                                    562 ; using variable 'base' as conversion
                                    563 ; format.
                                    564 ; input:
                                    565 ;    X       integer to print 
                                    566 ;   'base'    conversion base 
                                    567 ; output:
                                    568 ;   terminal  
                                    569 ;-----------------------------------
      00001E                        570 prt_i16:
      000020 72 5F 00 0C      [ 1]  571 	clr acc24 
      000021 CF 00 0D         [ 2]  572 	ldw acc16,x 
      000023 A6 10            [ 1]  573 	ld a,#16
      000024 C1 00 0A         [ 1]  574 	cp a,base
      000025 27 09            [ 1]  575 	jreq prt_acc24  
      000027 72 0F 00 0D 04   [ 2]  576 	btjf acc16,#7,prt_acc24
      00002F 72 53 00 0C      [ 1]  577 	cpl acc24 ; sign extend 
                                    578 	
                                    579 ;------------------------------------
                                    580 ; print integer in acc24 
                                    581 ; input:
                                    582 ;	acc24 		integer to print 
                                    583 ;	'base' 		numerical base for conversion 
                                    584 ;   'tab_width' field width 
                                    585 ;    A 			signed||unsigned conversion
                                    586 ;  output:
                                    587 ;    A          string length
                                    588 ;------------------------------------
      000030                        589 prt_acc24:
      000031 A6 FF            [ 1]  590 	ld a,#255  ; signed conversion  
      00007C CD 17 D3         [ 4]  591     call itoa  ; conversion entier en  .asciz
      00007C CD 11 45         [ 4]  592 	call right_align  
      00007E 88               [ 1]  593 	push a 
      000080 CD 09 6D         [ 4]  594 	call puts
      00940B 84               [ 1]  595 	pop a 
      00940B 89               [ 4]  596     ret	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    597 
                                    598 ;---------------------------------------
                                    599 ;  print value at xstack top 
                                    600 ;---------------------------------------
      0017BB                        601 print_top: 
      0017BB                        602 	_xpop 
      00940C 4F 7D            [ 1]    1     ld a,(y)
      00940E 27               [ 1]    2     ldw x,y 
      00940F 04 4C            [ 2]    3     ldw x,(1,x)
      009411 5C 20 F9 85      [ 2]    4     addw y,#CELL_SIZE 
      009415 81 00 0C         [ 1]  603 	ld acc24,a 
      009416 CF 00 0D         [ 2]  604 	ldw acc16,x 
      009416 F6 27 0B         [ 4]  605 	call prt_acc24 
      009419 90 F1            [ 1]  606 	ld a,#SPACE
      00941B 26 05 5C         [ 4]  607 	call putc 
      00941E 90               [ 4]  608 	ret 
                                    609 
                                    610 ;------------------------------------
                                    611 ; convert integer in acc24 to string
                                    612 ; input:
                                    613 ;   'base'	conversion base 
                                    614 ;	acc24	integer to convert
                                    615 ;   A       0=unsigned, else signed 
                                    616 ; output:
                                    617 ;   X  		pointer to first char of string
                                    618 ;   A       string length
                                    619 ;------------------------------------
                           000001   620 	SIGN=1  ; integer sign 
                           000002   621 	LEN=2 
                           000003   622 	PSTR=3
                           000004   623 	VSIZE=4 ;locals size
      0017D3                        624 itoa::
      0017D3                        625 	_vars VSIZE
      00941F 5C 20            [ 2]    1     sub sp,#VSIZE 
      009421 F4 02            [ 1]  626 	clr (LEN,sp) ; string length  
      009422 0F 01            [ 1]  627 	clr (SIGN,sp)    ; sign
      009422 4F               [ 1]  628 	tnz A
      009423 81 11            [ 1]  629 	jreq 1$ ; unsigned conversion  
      009424 C6 00 0A         [ 1]  630 	ld a,base 
      009424 A6 01            [ 1]  631 	cp a,#10
      009426 81 0A            [ 1]  632 	jrne 1$
                                    633 	; base 10 string display with negative sign if bit 23==1
      009427 72 0F 00 0C 05   [ 2]  634 	btjf acc24,#7,1$
      009427 88 89            [ 1]  635 	cpl (SIGN,sp)
      009429 90 F6 27         [ 4]  636 	call neg_acc24
      0017ED                        637 1$:
                                    638 ; initialize string pointer 
      00942C 06 F7 5C         [ 2]  639 	ldw x,#tib 
      00942F 90 5C 20         [ 2]  640 	addw x,#TIB_SIZE
      009432 F6               [ 2]  641 	decw x 
      009433 7F               [ 1]  642 	clr (x)
      0017F5                        643 itoa_loop:
      009434 85 84 81         [ 1]  644     ld a,base
                                    645 ;	ldw (PSTR,sp),x 
      009437 CD 02 D5         [ 4]  646     call divu24_8 ; acc24/A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    647 ;	ldw x,(PSTR,sp)
      009437 88 52            [ 1]  648     add a,#'0  ; remainder of division
      009439 02 0F            [ 1]  649     cp a,#'9+1
      00943B 01 0F            [ 1]  650     jrmi 2$
      00943D 02 90            [ 1]  651     add a,#7 
      001803                        652 2$:	
      00943F 89               [ 2]  653 	decw x
      009440 13               [ 1]  654     ld (x),a
      009441 01 90            [ 1]  655 	inc (LEN,sp)
                                    656 	; if acc24==0 conversion done
      009443 85 27 31         [ 1]  657 	ld a,acc24
      009446 2B 0E 0D         [ 1]  658 	or a,acc16
      009448 CA 00 0E         [ 1]  659 	or a,acc8
      009448 72 BB            [ 1]  660     jrne itoa_loop
                                    661 	;conversion done, next add '$' or '-' as required
      00944A 00 0E 72         [ 1]  662 	ld a,base 
      00944D B9 00            [ 1]  663 	cp a,#16
      00944F 0E 03            [ 1]  664 	jreq 8$
      009451 01 03            [ 1]  665 	ld a,(SIGN,sp)
      009453 02 20            [ 1]  666     jreq 10$
      009455 05 2D            [ 1]  667     ld a,#'-
      009456 20 02            [ 2]  668 	jra 9$ 
      001821                        669 8$:	
      009456 5A 90            [ 1]  670 	ld a,#'$ 
      009458 5A               [ 2]  671 9$: decw x
      009459 0C               [ 1]  672     ld (x),a
      00945A 02 02            [ 1]  673 	inc (LEN,sp)
      00945B                        674 10$:
      00945B C6 00            [ 1]  675 	ld a,(LEN,sp)
      001829                        676 	_drop VSIZE
      00945D 0E CA            [ 2]    1     addw sp,#VSIZE 
      00945F 00               [ 4]  677 	ret
                                    678 
                                    679 ;------------------------------------
                                    680 ; convert alpha to uppercase
                                    681 ; input:
                                    682 ;    a  character to convert
                                    683 ; output:
                                    684 ;    a  uppercase character
                                    685 ;------------------------------------
      00182C                        686 to_upper::
      009460 0F 27            [ 1]  687 	cp a,#'a
      009462 14 72            [ 1]  688 	jrpl 1$
      009464 FB               [ 4]  689 0$:	ret
      009465 01 72            [ 1]  690 1$: cp a,#'z	
      009467 F9 01            [ 1]  691 	jrugt 0$
      009469 90 F6            [ 1]  692 	sub a,#32
      00946B F7               [ 4]  693 	ret
                                    694 	
                                    695 ;------------------------------------
                                    696 ; convert pad content in integer
                                    697 ; input:
                                    698 ;    x		* .asciz to convert
                                    699 ; output:
                                    700 ;    acc24      int24_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    701 ;------------------------------------
                                    702 	; local variables
                           000001   703 	SIGN=1 ; 1 byte, 
                           000002   704 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   705 	TEMP=3 ; 1 byte, temporary storage
                           000004   706 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   707 	VSIZE=5 ; 5 bytes reserved for local storage
      001838                        708 atoi24::
      001838                        709 	_vars VSIZE
      00946C 89 CE            [ 2]    1     sub sp,#VSIZE 
      00946E 00 0E            [ 2]  710 	ldw (XTEMP,sp),x 
                                    711 ; conversion made on xstack 
      009470 5A               [ 1]  712 	clr a 
      009471 CF               [ 1]  713 	clrw x 
      00183E                        714 	_xpush 
      009472 00 0E 85 20      [ 2]    1     subw y,#CELL_SIZE
      009476 E4 F7            [ 1]    2     ld (y),a 
      009477 90 EF 01         [ 2]    3     ldw (1,y),x 
      009477 5B 02            [ 1]  715 	clr (SIGN,sp)
      009479 84 81            [ 1]  716 	ld a,#10
      00947B 6B 02            [ 1]  717 	ld (BASE,sp),a ; default base decimal
      00947B 89 88            [ 2]  718 	ldw x,(XTEMP,sp)
      00947D AE               [ 1]  719 	ld a,(x)
      00947E 00 31            [ 1]  720 	jreq 9$  ; completed if 0
      009480 A6 4E            [ 1]  721 	cp a,#'-
      009482 7F 5C            [ 1]  722 	jrne 1$
      009484 4A 26            [ 1]  723 	cpl (SIGN,sp)
      009486 FB 84            [ 2]  724 	jra 2$
      009488 85 81            [ 1]  725 1$: cp a,#'$
      00948A 0A 0A            [ 1]  726 	jrne 3$
      00948C 54 69            [ 1]  727 	ld a,#16
      00948E 6E 79            [ 1]  728 	ld (BASE,sp),a
      009490 20               [ 1]  729 2$:	incw x
      009491 42 41            [ 2]  730 	ldw (XTEMP,sp),x 
      009493 53               [ 1]  731 	ld a,(x)
      001866                        732 3$:	; char to digit 
      009494 49 43            [ 1]  733 	cp a,#'a
      009496 20 66            [ 1]  734 	jrmi 4$
      009498 6F 72            [ 1]  735 	sub a,#32
      00949A 20 53            [ 1]  736 4$:	cp a,#'0
      00949C 54 4D            [ 1]  737 	jrmi 9$
      00949E 38 0A            [ 1]  738 	sub a,#'0
      0094A0 43 6F            [ 1]  739 	cp a,#10
      0094A2 70 79            [ 1]  740 	jrmi 5$
      0094A4 72 69            [ 1]  741 	sub a,#7
      0094A6 67 68            [ 1]  742 	cp a,(BASE,sp)
      0094A8 74 2C            [ 1]  743 	jrpl 9$
      0094AA 20 4A            [ 1]  744 5$:	ld (TEMP,sp),a
      0094AC 61 63            [ 1]  745 	ld a,(BASE,sp)
      0094AE 71               [ 1]  746 	clrw x 
      0094AF 75               [ 1]  747 	rlwa x 
      001882                        748 	_xpush 
      0094B0 65 73 20 44      [ 2]    1     subw y,#CELL_SIZE
      0094B4 65 73            [ 1]    2     ld (y),a 
      0094B6 63 68 65         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0094B9 6E 65 73         [ 4]  749 	call mul24
      0094BC 20               [ 1]  750 	clrw x 
      0094BD 32 30            [ 1]  751 	ld a,(TEMP,sp)
      0094BF 31               [ 1]  752 	rlwa x 
      001892                        753 	_xpush 
      0094C0 39 2C 32 30      [ 2]    1     subw y,#CELL_SIZE
      0094C4 32 32            [ 1]    2     ld (y),a 
      0094C6 0A 76 65         [ 2]    3     ldw (1,y),x 
      0094C9 72 73 69         [ 4]  754 	call add24 
      0094CC 6F 6E            [ 2]  755 	ldw x,(XTEMP,sp)
      0094CE 20 00            [ 2]  756 	jra 2$
      0094D0 0D 01            [ 1]  757 9$:	tnz (SIGN,sp)
      0094D0 AE 94            [ 1]  758     jreq atoi_exit
      0094D2 8A CD 89         [ 4]  759     call neg24
      0018A9                        760 atoi_exit:
      0018A9                        761 	_xpop 
      0094D5 ED A6            [ 1]    1     ld a,(y)
      0094D7 02               [ 1]    2     ldw x,y 
      0094D8 C7 00            [ 2]    3     ldw x,(1,x)
      0094DA 0F 5F CF 00      [ 2]    4     addw y,#CELL_SIZE 
      0094DE 0D 72 5F         [ 1]  762 	ld acc24,a 
      0094E1 00 24 35         [ 2]  763 	ldw acc16,x  
      0018B8                        764 	_drop VSIZE
      0094E4 0A 00            [ 2]    1     addw sp,#VSIZE 
      0094E6 0B               [ 4]  765 	ret
                                    766 
                                    767 
                                    768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    769 ;;   TINY BASIC  operators,
                                    770 ;;   commands and functions 
                                    771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    772 
                                    773 ;---------------------------------
                                    774 ; dictionary search 
                                    775 ; input:
                                    776 ;	X 		dictionary entry point, name field  
                                    777 ;   y		.asciz name to search 
                                    778 ; output:
                                    779 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    780 ;  X		routine address|TK_OP 
                                    781 ;---------------------------------
                           000001   782 	NLEN=1 ; cmd length 
                           000002   783 	XSAVE=2
                           000004   784 	YSAVE=4
                           000005   785 	VSIZE=5 
      0018BB                        786 search_dict::
      0018BB                        787 	_vars VSIZE 
      0094E7 CD 98            [ 2]    1     sub sp,#VSIZE 
      0094E9 2D A6            [ 2]  788 	ldw (YSAVE,sp),y 
      0018BF                        789 search_next:
      0094EB 2E CD            [ 2]  790 	ldw (XSAVE,sp),x 
                                    791 ; get name length in dictionary	
      0094ED 89               [ 1]  792 	ld a,(x)
      0094EE 90 A6            [ 1]  793 	and a,#0xf 
      0094F0 00 C7            [ 1]  794 	ld (NLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0094F2 00 0F            [ 2]  795 	ldw y,(YSAVE,sp) ; name pointer 
      0094F4 5F               [ 1]  796 	incw x 
      0018C9                        797 cp_loop:
      0094F5 CF 00            [ 1]  798 	ld a,(y)
      0094F7 0D CD            [ 1]  799 	jreq str_match 
      0094F9 98 2D            [ 1]  800 	tnz (NLEN,sp)
      0094FB A6 0D            [ 1]  801 	jreq no_match  
      0094FD CD               [ 1]  802 	cp a,(x)
      0094FE 89 90            [ 1]  803 	jrne no_match 
      009500 81 5C            [ 1]  804 	incw y 
      009501 5C               [ 1]  805 	incw x
      009501 90 AE            [ 1]  806 	dec (NLEN,sp)
      009503 17 73            [ 2]  807 	jra cp_loop 
      0018DB                        808 no_match:
      009505 72 5F            [ 2]  809 	ldw x,(XSAVE,sp) 
      009507 00 23 72         [ 2]  810 	subw x,#2 ; move X to link field
      00950A 5F 00            [ 1]  811 	push #TK_NONE 
      00950C 20               [ 2]  812 	ldw x,(x) ; next word link 
      00950D 35               [ 1]  813 	pop a ; TK_NONE 
      00950E 04 00            [ 1]  814 	jreq search_exit  ; not found  
                                    815 ;try next 
      009510 24 35            [ 2]  816 	jra search_next
      0018E8                        817 str_match:
      009512 0A 00            [ 2]  818 	ldw x,(XSAVE,sp)
      009514 0B               [ 1]  819 	ld a,(X)
      009515 AE 00            [ 1]  820 	ld (NLEN,sp),a ; needed to test keyword type  
      009517 00 CF            [ 1]  821 	and a,#NLEN_MASK 
                                    822 ; move x to procedure address field 	
      009519 00               [ 1]  823 	inc a 
      00951A 05 CF 00         [ 1]  824 	ld acc8,a 
      00951D 01 72 5F 00      [ 1]  825 	clr acc16 
      009521 04 81 00 0D      [ 2]  826 	addw x,acc16 
      009523 FE               [ 2]  827 	ldw x,(x) ; routine address  
                                    828 ;determine keyword type bits 7:4 
      009523 89 72            [ 1]  829 	ld a,(NLEN,sp)
      009525 5F 00            [ 1]  830 	and a,#KW_TYPE_MASK 
      009527 04               [ 1]  831 	swap a 
      009528 72 5F            [ 1]  832 	add a,#128
      001903                        833 search_exit: 
      001903                        834 	_drop VSIZE 
      00952A 00 02            [ 2]    1     addw sp,#VSIZE 
      00952C AE               [ 4]  835 	ret 
                                    836 
                                    837 ;---------------------
                                    838 ; check if next token
                                    839 ;  is of expected type 
                                    840 ; input:
                                    841 ;   A 		 expected token attribute
                                    842 ;  ouput:
                                    843 ;   none     if fail call syntax_error 
                                    844 ;--------------------
      001906                        845 expect:
      00952D 00               [ 1]  846 	push a 
      00952E 80 CF 00         [ 4]  847 	call next_token 
      009531 1C CF            [ 1]  848 	cp a,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009533 00 1E            [ 1]  849 	jreq 1$
      009535 CD 94 7B         [ 2]  850 	jp syntax_error
      009538 85               [ 1]  851 1$: pop a 
      009539 81               [ 4]  852 	ret 
                                    853 
                                    854 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    855 ; parse arguments list 
                                    856 ; between ()
                                    857 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00953A                        858 func_args:
      00953A 00 00            [ 1]  859 	ld a,#TK_LPAREN 
      00953C 95 5C 95         [ 4]  860 	call expect 
                                    861 ; expected to continue in arg_list 
                                    862 ; caller must check for TK_RPAREN 
                                    863 
                                    864 ;-------------------------------
                                    865 ; parse embedded BASIC routines 
                                    866 ; arguments list.
                                    867 ; arg_list::=  expr[','expr]*
                                    868 ; all arguments are of int24_t type
                                    869 ; and pushed on stack 
                                    870 ; input:
                                    871 ;   none
                                    872 ; output:
                                    873 ;   xstack{n}   arguments pushed on xstack
                                    874 ;   A 	number of arguments pushed on xstack  
                                    875 ;--------------------------------
      001918                        876 arg_list:
      00953F 69 95            [ 1]  877 	push #0
      009541 77 95 90         [ 4]  878 1$:	call condition 
      009544 95               [ 1]  879 	tnz a 
      009545 9F 95            [ 1]  880 	jreq 7$  
      009547 B5 95            [ 1]  881 	inc (1,sp)
      009549 CB 95 E5         [ 4]  882 	call next_token 
      00954C 95 F6            [ 1]  883 	cp a,#TK_COMMA 
      00954E 96 07            [ 1]  884 	jreq 1$ 
      009550 96 13            [ 1]  885 	cp a,#TK_RPAREN
      009552 96 46            [ 1]  886 	jreq 7$
      00192D                        887 	_unget_token 
      009554 96 56 96 6A 96   [ 1]    1      mov in,in.saved  
      009559 7D               [ 1]  888 7$:	pop a  
      00955A 96               [ 4]  889 	ret 
                                    890 
                                    891 ;--------------------------------
                                    892 ;   BASIC commnands 
                                    893 ;--------------------------------
                                    894 
                                    895 ;--------------------------------
                                    896 ;  arithmetic and relational 
                                    897 ;  routines
                                    898 ;  operators precedence
                                    899 ;  highest to lowest
                                    900 ;  operators on same row have 
                                    901 ;  same precedence and are executed
                                    902 ;  from left to right.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    903 ;	'*','/','%'
                                    904 ;   '-','+'
                                    905 ;   '=','>','<','>=','<=','<>','><'
                                    906 ;   '<>' and '><' are equivalent for not equal.
                                    907 ;--------------------------------
                                    908 
                                    909 ;---------------------
                                    910 ; return array element
                                    911 ; address from @(expr)
                                    912 ; input:
                                    913 ;   A 		TK_ARRAY
                                    914 ; output:
                                    915 ;	X 		element address 
                                    916 ;----------------------
      001934                        917 get_array_element:
      00955B 8A 4D 65         [ 4]  918 	call func_args 
      00955E 6D 6F            [ 1]  919 	cp a,#1
      009560 72 79            [ 1]  920 	jreq 1$
      009562 20 66 75         [ 2]  921 	jp syntax_error
      00193E                        922 1$: _xpop 
      009565 6C 6C            [ 1]    1     ld a,(y)
      009567 0A               [ 1]    2     ldw x,y 
      009568 00 73            [ 2]    3     ldw x,(1,x)
      00956A 79 6E 74 61      [ 2]    4     addw y,#CELL_SIZE 
                                    923     ; ignore A, index < 65536 in any case 
                                    924 	; check for bounds 
      00956E 78 20 65         [ 2]  925 	cpw x,array_size 
      009571 72 72            [ 2]  926 	jrule 3$
                                    927 ; bounds {1..array_size}	
      009573 6F 72            [ 1]  928 2$: ld a,#ERR_BAD_VALUE 
      009575 0A 00 6D         [ 2]  929 	jp tb_error 
      009578 61               [ 2]  930 3$: tnzw  x
      009579 74 68            [ 1]  931 	jreq 2$ 
      00957B 20               [ 2]  932 	pushw x 
      00957C 6F               [ 2]  933 	sllw x 
      00957D 70 65 72         [ 2]  934 	addw x,(1,sp) ; index*size_of(int24)
      009580 61 74            [ 2]  935 	ldw (1,sp),x  
      009582 69 6F 6E         [ 2]  936 	ldw x,#tib ; array is below tib 
      009585 20 6F 76         [ 2]  937 	subw x,(1,sp)
      001961                        938 	_drop 2   
      009588 65 72            [ 2]    1     addw sp,#2 
      00958A 66               [ 4]  939 	ret 
                                    940 
                                    941 
                                    942 ;***********************************
                                    943 ;   expression parse,execute 
                                    944 ;***********************************
                                    945 ;-----------------------------------
                                    946 ; factor ::= ['+'|'-'|e]  var | @ |
                                    947 ;			 integer | function |
                                    948 ;			 '('relation')' 
                                    949 ; output:
                                    950 ;   A       token attribute 
                                    951 ;   xstack  value  
                                    952 ; ---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                           000001   953 	NEG=1
                           000001   954 	VSIZE=1
      001964                        955 factor:
      001964                        956 	_vars VSIZE 
      00958B 6C 6F            [ 2]    1     sub sp,#VSIZE 
      00958D 77 0A            [ 1]  957 	clr (NEG,sp)
      00958F 00 64 69         [ 4]  958 	call next_token
      009592 76               [ 1]  959 	tnz a 
      009593 69 73            [ 1]  960 	jrne 1$ 
      009595 69 6F 6E         [ 2]  961 	jp 22$ 
      009598 20 62            [ 1]  962 1$:	cp a,#TK_PLUS 
      00959A 79 20            [ 1]  963 	jreq 2$
      00959C 30 0A            [ 1]  964 	cp a,#TK_MINUS 
      00959E 00 69            [ 1]  965 	jrne 4$ 
      0095A0 6E 76            [ 1]  966 	cpl (NEG,sp)
      00197B                        967 2$:	
      0095A2 61 6C 69         [ 4]  968 	call next_token
      00197E                        969 4$:
      0095A5 64               [ 1]  970 	tnz a 
      0095A6 20 6C            [ 1]  971 	jrne 41$ 
      0095A8 69 6E 65         [ 2]  972 	jp syntax_error  
      001984                        973 41$:	
      0095AB 20 6E            [ 1]  974 	cp a,#TK_IFUNC 
      0095AD 75 6D            [ 1]  975 	jrne 5$ 
      001988                        976 	_get_code_addr 
      0095AF 62               [ 2]    1         ldw x,(x)
      0095B0 65 72 2E 0A      [ 1]    2         inc in 
      0095B4 00 72 75 6E      [ 1]    3         inc in 
      0095B8 20               [ 4]  977 	call (x); result in A:X  
      0095B9 74 69            [ 2]  978 	jra 18$ 
      001994                        979 5$:
      0095BB 6D 65            [ 1]  980 	cp a,#TK_INTGR
      0095BD 20 6F            [ 1]  981 	jrne 6$
      0095BF 6E 6C 79         [ 4]  982 	call get_int24 ; A:X
      0095C2 20 75            [ 2]  983 	jra 18$
      00199D                        984 6$:
      0095C4 73 61            [ 1]  985 	cp a,#TK_ARRAY
      0095C6 67 65            [ 1]  986 	jrne 7$
      0095C8 2E 0A 00         [ 4]  987 	call get_array_element
      0095CB 63 6F            [ 2]  988     jra 71$
      0019A6                        989 7$:
      0095CD 6D 6D            [ 1]  990 	cp a,#TK_VAR 
      0095CF 61 6E            [ 1]  991 	jrne 8$
      0095D1 64 20 6C         [ 4]  992 	call get_addr 
      0019AD                        993 71$: ; put value in A:X
      0095D4 69               [ 1]  994 	ld a,(x)
      0095D5 6E 65            [ 2]  995 	ldw x,(1,x)
      0095D7 20 6F            [ 2]  996 	jra 18$
      0019B2                        997 8$:
      0095D9 6E 6C            [ 1]  998 	cp a,#TK_LABEL 
      0095DB 79 20            [ 1]  999 	jrne 9$ 
      0095DD 75               [ 2] 1000 	pushw x 
      0095DE 73 61 67         [ 4] 1001 	call skip_string
      0095E1 65               [ 2] 1002 	popw x 
      0095E2 2E 0A 00         [ 4] 1003 	call search_const 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0095E5 64               [ 2] 1004 	tnzw x 
      0095E6 75 70            [ 1] 1005 	jreq 16$
      0095E8 6C 69 63         [ 4] 1006 	call get_const_value ; in A:X 
      0095EB 61 74            [ 2] 1007 	jra 18$
      0019C6                       1008 9$: 
      0095ED 65 20            [ 1] 1009 	cp a,#TK_CFUNC 
      0095EF 6E 61            [ 1] 1010 	jrne 12$
      0019CA                       1011 	_get_code_addr 
      0095F1 6D               [ 2]    1         ldw x,(x)
      0095F2 65 2E 0A 00      [ 1]    2         inc in 
      0095F6 46 69 6C 65      [ 1]    3         inc in 
      0095FA 20               [ 4] 1012 	call(x)
      0095FB 6E               [ 1] 1013 	clrw x 
      0095FC 6F               [ 1] 1014 	rlwa x  ; char>int24 in A:X 
      0095FD 74 20            [ 2] 1015 	jra 18$ 	 
      0019D8                       1016 12$:			
      0095FF 66 6F            [ 1] 1017 	cp a,#TK_LPAREN
      009601 75 6E            [ 1] 1018 	jrne 16$
      009603 64 2E 0A         [ 4] 1019 	call expression
      009606 00 62            [ 1] 1020 	ld a,#TK_RPAREN 
      009608 61 64 20         [ 4] 1021 	call expect
      0019E4                       1022 	_xpop 
      00960B 76 61            [ 1]    1     ld a,(y)
      00960D 6C               [ 1]    2     ldw x,y 
      00960E 75 65            [ 2]    3     ldw x,(1,x)
      009610 2E 0A 00 46      [ 2]    4     addw y,#CELL_SIZE 
      009614 69 6C            [ 2] 1023 	jra 18$	
      0019EF                       1024 16$:
      0019EF                       1025 	_unget_token 
      009616 65 20 69 6E 20   [ 1]    1      mov in,in.saved  
      00961B 65               [ 1] 1026 	clr a 
      00961C 78 74            [ 2] 1027 	jra 22$ 
      0019F7                       1028 18$: 
      00961E 65 6E            [ 1] 1029 	tnz (NEG,sp)
      009620 64 65            [ 1] 1030 	jreq 20$
      009622 64 20 6D         [ 4] 1031 	call neg_ax   
      0019FE                       1032 20$:
      0019FE                       1033 	_xpush 
      009625 65 6D 6F 72      [ 2]    1     subw y,#CELL_SIZE
      009629 79 2C            [ 1]    2     ld (y),a 
      00962B 20 63 61         [ 2]    3     ldw (1,y),x 
      00962E 6E 27            [ 1] 1034 	ld a,#TK_INTGR
      001A09                       1035 22$:
      001A09                       1036 	_drop VSIZE
      009630 74 20            [ 2]    1     addw sp,#VSIZE 
      009632 62               [ 4] 1037 	ret
                                   1038 
                                   1039 
                                   1040 ;-----------------------------------
                                   1041 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1042 ; output:
                                   1043 ;   A    	token attribute 
                                   1044 ;	xstack		value 
                                   1045 ;-----------------------------------
                           000001  1046 	MULOP=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                           000001  1047 	VSIZE=1
      001A0C                       1048 term:
      001A0C                       1049 	_vars VSIZE
      009633 65 20            [ 2]    1     sub sp,#VSIZE 
                                   1050 ; first factor 	
      009635 72 75 6E         [ 4] 1051 	call factor
      009638 20               [ 1] 1052 	tnz a 
      009639 66 72            [ 1] 1053 	jreq term_exit  
      001A14                       1054 term01:	 ; check for  operator '*'|'/'|'%' 
      00963B 6F 6D 20         [ 4] 1055 	call next_token
      00963E 74 68            [ 1] 1056 	ld (MULOP,sp),a
      009640 65 72            [ 1] 1057 	and a,#TK_GRP_MASK
      009642 65 2E            [ 1] 1058 	cp a,#TK_GRP_MULT
      009644 0A 00            [ 1] 1059 	jreq 1$
      009646 4E 6F            [ 1] 1060 	ld a,#TK_INTGR
      001A21                       1061 	_unget_token 
      009648 20 64 61 74 61   [ 1]    1      mov in,in.saved  
      00964D 20 66            [ 2] 1062 	jra term_exit 
      001A28                       1063 1$:	; got *|/|%
                                   1064 ;second factor
      00964F 6F 75 6E         [ 4] 1065 	call factor
      009652 64               [ 1] 1066 	tnz a 
      009653 2E 0A            [ 1] 1067 	jrne 2$ 
      009655 00 4E 6F         [ 2] 1068 	jp syntax_error 
      001A31                       1069 2$: ; select operation 	
      009658 20 70            [ 1] 1070 	ld a,(MULOP,sp) 
      00965A 72 6F            [ 1] 1071 	cp a,#TK_MULT 
      00965C 67 72            [ 1] 1072 	jrne 3$
                                   1073 ; '*' operator
      00965E 61 6D 20         [ 4] 1074 	call mul24 
      009661 69 6E            [ 2] 1075 	jra term01
      009663 20 52            [ 1] 1076 3$: cp a,#TK_DIV 
      009665 41 4D            [ 1] 1077 	jrne 4$ 
                                   1078 ; '/' operator	
      009667 21 0A 00         [ 4] 1079 	call div24 
      00966A 46 69            [ 2] 1080 	jra term01 
      001A45                       1081 4$: ; '%' operator
      00966C 6C 65 20         [ 4] 1082 	call mod24
      00966F 73 79            [ 2] 1083 	jra term01 
      001A4A                       1084 9$: 
      009671 73 74            [ 1] 1085 	ld a,#TK_INTGR
      001A4C                       1086 term_exit:
      001A4C                       1087 	_drop VSIZE 
      009673 65 6D            [ 2]    1     addw sp,#VSIZE 
      009675 20               [ 4] 1088 	ret 
                                   1089 
                                   1090 ;-------------------------------
                                   1091 ;  expr ::= term [['+'|'-'] term]*
                                   1092 ;  result range {-32768..32767}
                                   1093 ;  output:
                                   1094 ;   A    token attribute 
                                   1095 ;   xstack	 result    
                                   1096 ;-------------------------------
                           000001  1097 	OP=1 
                           000001  1098 	VSIZE=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001A4F                       1099 expression:
      001A4F                       1100 	_vars VSIZE 
      009676 66 75            [ 2]    1     sub sp,#VSIZE 
                                   1101 ; first term 	
      009678 6C 6C 2E         [ 4] 1102 	call term
      00967B 0A               [ 1] 1103 	tnz a 
      00967C 00 42            [ 1] 1104 	jreq 9$
      001A57                       1105 1$:	; operator '+'|'-'
      00967E 75 66 66         [ 4] 1106 	call next_token
      009681 65 72            [ 1] 1107 	ld (OP,sp),a 
      009683 20 66            [ 1] 1108 	and a,#TK_GRP_MASK
      009685 75 6C            [ 1] 1109 	cp a,#TK_GRP_ADD 
      009687 6C 0A            [ 1] 1110 	jreq 2$ 
      001A62                       1111 	_unget_token 
      009689 00 6F 76 65 72   [ 1]    1      mov in,in.saved  
      00968E 66 6C            [ 1] 1112 	ld a,#TK_INTGR
      009690 6F 77            [ 2] 1113 	jra 9$ 
      001A6B                       1114 2$: ; second term 
      009692 0A 00 0A         [ 4] 1115 	call term
      009695 72               [ 1] 1116 	tnz a 
      009696 75 6E            [ 1] 1117 	jrne 3$
      009698 20 74 69         [ 2] 1118 	jp syntax_error
      001A74                       1119 3$:
      00969B 6D 65            [ 1] 1120 	ld a,(OP,sp)
      00969D 20 65            [ 1] 1121 	cp a,#TK_PLUS 
      00969F 72 72            [ 1] 1122 	jrne 4$
                                   1123 ; '+' operator	
      0096A1 6F 72 2C         [ 4] 1124 	call add24
      0096A4 20 00            [ 2] 1125 	jra 1$ 
      001A7F                       1126 4$:	; '-' operator 
      0096A6 0A 63 6F         [ 4] 1127 	call sub24
      0096A9 6D 70            [ 2] 1128 	jra 1$
      001A84                       1129 9$:
      001A84                       1130 	_drop VSIZE 
      0096AB 69 6C            [ 2]    1     addw sp,#VSIZE 
      0096AD 65               [ 4] 1131 	ret 
                                   1132 
                                   1133 ;---------------------------------------------
                                   1134 ; rel ::= expr rel_op expr
                                   1135 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1136 ;  relation return  integer , zero is false 
                                   1137 ;  output:
                                   1138 ;	 xstack		value  
                                   1139 ;---------------------------------------------
                           000001  1140 	RELOP=1
                           000001  1141 	VSIZE=1 
      001A87                       1142 relation: 
      001A87                       1143 	_vars VSIZE
      0096AE 20 65            [ 2]    1     sub sp,#VSIZE 
      0096B0 72 72 6F         [ 4] 1144 	call expression
      0096B3 72               [ 1] 1145 	tnz a 
      0096B4 2C 20            [ 1] 1146 	jreq 9$ 
                                   1147 ; expect rel_op or leave 
      0096B6 00 6C 61         [ 4] 1148 	call next_token 
      0096B9 73 74            [ 1] 1149 	ld (RELOP,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      0096BB 20 74            [ 1] 1150 	and a,#TK_GRP_MASK
      0096BD 6F 6B            [ 1] 1151 	cp a,#TK_GRP_RELOP 
      0096BF 65 6E            [ 1] 1152 	jreq 2$
      0096C1 20 69            [ 1] 1153 	ld a,#TK_INTGR 
      001A9C                       1154 	_unget_token 
      0096C3 64 3A 20 00 01   [ 1]    1      mov in,in.saved  
      0096C7 20 40            [ 2] 1155 	jra 9$ 
      001AA3                       1156 2$:	; expect another expression
      0096C7 A6 02 4F         [ 4] 1157 	call expression
      0096C9 4D               [ 1] 1158 	tnz a 
      0096C9 72 0A            [ 1] 1159 	jrne 3$
      0096CB 00 23 4C         [ 2] 1160 	jp syntax_error 
      001AAC                       1161 3$: 
      0096CE 88 AE 96         [ 4] 1162 	call cp24 
      001AAF                       1163 	_xpop  
      0096D1 94 CD            [ 1]    1     ld a,(y)
      0096D3 89               [ 1]    2     ldw x,y 
      0096D4 ED 84            [ 2]    3     ldw x,(1,x)
      0096D6 AE 95 3A 72      [ 2]    4     addw y,#CELL_SIZE 
      0096DA 5F               [ 1] 1164 	tnz a 
      0096DB 00 0E            [ 1] 1165 	jrmi 4$
      0096DD 48 72            [ 1] 1166 	jrne 5$
      0096DF 59 00 0E C7      [ 1] 1167 	mov acc8,#2 ; i1==i2
      0096E3 00 0F            [ 2] 1168 	jra 6$ 
      001AC3                       1169 4$: ; i1<i2
      0096E5 72 BB 00 0E      [ 1] 1170 	mov acc8,#4 
      0096E9 FE CD            [ 2] 1171 	jra 6$
      001AC9                       1172 5$: ; i1>i2
      0096EB 89 ED CE 00      [ 1] 1173 	mov acc8,#1  
      001ACD                       1174 6$: ; 0=false, -1=true 
      0096EF 05               [ 1] 1175 	clrw x 
      0096F0 C6 00 04         [ 1] 1176 	ld a, acc8  
      0096F3 90 5F            [ 1] 1177 	and a,(RELOP,sp)
      0096F5 90 02            [ 1] 1178 	jreq 7$
      0096F7 CD               [ 2] 1179 	cplw x 
      0096F8 86 EC            [ 1] 1180 	ld a,#255 
      001AD8                       1181 7$:	_xpush 
      0096FA CE 00 05 C6      [ 2]    1     subw y,#CELL_SIZE
      0096FE 00 02            [ 1]    2     ld (y),a 
      009700 CD A0 12         [ 2]    3     ldw (1,y),x 
      009703 AE 96            [ 1] 1182 	ld a,#TK_INTGR
      001AE3                       1183 9$: 
      001AE3                       1184 	_drop VSIZE
      009705 B7 CD            [ 2]    1     addw sp,#VSIZE 
      009707 89               [ 4] 1185 	ret 
                                   1186 
                                   1187 ;-------------------------------------------
                                   1188 ;  AND factor:  [NOT] relation | (condition)
                                   1189 ;  output:
                                   1190 ;     A      TK_INTGR|0
                                   1191 ;-------------------------------------------
                           000001  1192 	NOT_OP=1
      001AE6                       1193 and_factor:
      009708 ED C6            [ 1] 1194 	push #0 
      00970A 00 03 5F         [ 4] 1195 0$:	call next_token  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00970D 97               [ 1] 1196 	tnz a 
      00970E 72 BB            [ 1] 1197 	jreq 8$ 
      009710 00 05            [ 1] 1198 	cp a,#TK_NOT 
      009712 F6 5F            [ 1] 1199 	jrne 1$ 
      009714 97 CD            [ 1] 1200 	cpl (NOT_OP,sp)
      009716 98 16            [ 2] 1201 	jra 0$ 
      001AF6                       1202 1$:	
      009718 20 35            [ 1] 1203 	cp a,#TK_LPAREN 
      00971A 26 0A            [ 1] 1204 	jrne 2$
      00971A 88 AE 96         [ 4] 1205 	call condition
      00971D A6 CD            [ 1] 1206 	ld a,#TK_RPAREN 
      00971F 89 ED 84         [ 4] 1207 	call expect
      009722 AE 95            [ 2] 1208 	jra 3$
      001B04                       1209 2$: _unget_token 
      009724 3A 72 5F 00 0E   [ 1]    1      mov in,in.saved  
      009729 48 72 59         [ 4] 1210 	call relation
      001B0C                       1211 3$:
      00972C 00 0E            [ 1] 1212 	tnz (NOT_OP,sp)
      00972E C7 00            [ 1] 1213 	jreq 8$ 
      009730 0F 72 BB         [ 4] 1214 	call cpl24
      001B13                       1215 8$:
      001B13                       1216 	_drop 1  
      009733 00 0E            [ 2]    1     addw sp,#1 
      009735 FE               [ 4] 1217     ret 
                                   1218 
                                   1219 
                                   1220 ;--------------------------------------------
                                   1221 ;  AND operator as priority over OR||XOR 
                                   1222 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1223 ;          
                                   1224 ;  output:
                                   1225 ;     A     TK_INTGR|0
                                   1226 ;    xtack   value 
                                   1227 ;--------------------------------------------
      001B16                       1228 and_cond:
      009736 CD 89 ED         [ 4] 1229 	call and_factor
      009739 AE               [ 1] 1230 	tnz a 
      00973A 16 68            [ 1] 1231 	jreq 9$  
      00973C CD 89 ED         [ 4] 1232 1$: call next_token 
      00973F A6               [ 1] 1233 	tnz a 
      009740 0D CD            [ 1] 1234 	jreq 6$ 
      009742 89 90            [ 1] 1235 	cp a,#TK_AND 
      009744 CE 00            [ 1] 1236 	jreq 3$
      001B26                       1237 	_unget_token 
      009746 01 CD 8A 5A A6   [ 1]    1      mov in,in.saved  
      00974B 5E CD            [ 2] 1238 	jra 6$ 
      00974D 89 90 AE         [ 4] 1239 3$:	call and_factor  
      009750 17               [ 1] 1240 	tnz a 
      009751 FF 94            [ 1] 1241 	jrne 4$
      009753 CC 16 47         [ 2] 1242 	jp syntax_error 
      001B36                       1243 4$:	
      001B36                       1244 	_xpop 
      009753 CD 95            [ 1]    1     ld a,(y)
      009755 01               [ 1]    2     ldw x,y 
      009756 EE 01            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009756 A6 0D CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00975A 90 A6 3E         [ 1] 1245 	ld acc24,a 
      00975D CD 89 90         [ 2] 1246 	ldw acc16,x
      001B45                       1247 	_xpop 
      009760 CD 8A            [ 1]    1     ld a,(y)
      009762 F2               [ 1]    2     ldw x,y 
      009763 72 5D            [ 2]    3     ldw x,(1,x)
      009765 00 04 27 ED      [ 2]    4     addw y,#CELL_SIZE 
      009769 CD 91 1B         [ 1] 1248 	and a,acc24 
      00976C 72               [ 1] 1249 	rlwa x 
      00976D 5D 00 04         [ 1] 1250 	and a,acc16 
      009770 27               [ 1] 1251 	rlwa x 
      009771 E4 00 0E         [ 1] 1252 	and a,acc8 
      009772 02               [ 1] 1253 	rlwa x
      001B5A                       1254 	_xpush
      009772 C6 00 02 C1      [ 2]    1     subw y,#CELL_SIZE
      009776 00 04            [ 1]    2     ld (y),a 
      009778 2B 1D 01         [ 2]    3     ldw (1,y),x 
      00977A 20 B7            [ 2] 1255 	jra 1$  
      00977A 72 01            [ 1] 1256 6$: ld a,#TK_INTGR 
      00977C 00               [ 4] 1257 9$:	ret 	 
                                   1258 
                                   1259 
                                   1260 ;--------------------------------------------
                                   1261 ; condition for IF and UNTIL 
                                   1262 ; operators: OR,XOR 
                                   1263 ; format:  and_cond [ OP and_cond ]* 
                                   1264 ; output:
                                   1265 ;    A        INTGR|0 
                                   1266 ;    xstack   value 
                                   1267 ;--------------------------------------------
                           000001  1268 	ATMP=1
                           000002  1269 	OP=2
                           000002  1270 	VSIZE=2 
      001B68                       1271 condition:
      001B68                       1272 	_vars VSIZE 
      00977D 23 D7            [ 2]    1     sub sp,#VSIZE 
      00977F CE 00 05         [ 4] 1273 	call and_cond
      009782 72               [ 1] 1274 	tnz a 
      009783 BB 00            [ 1] 1275 	jreq 9$ 
      009785 01 C3 00         [ 4] 1276 1$:	call next_token 
      009788 1E 2A            [ 1] 1277 	cp a,#TK_OR 
      00978A C8 CF            [ 1] 1278 	jreq 2$
      00978C 00 05            [ 1] 1279 	cp a,#TK_XOR
      00978E E6 02            [ 1] 1280 	jreq 2$ 
      001B7B                       1281 	_unget_token 
      009790 C7 00 04 35 03   [ 1]    1      mov in,in.saved  
      009795 00 02            [ 2] 1282 	jra 8$ 
      009797 6B 02            [ 1] 1283 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009797 CD 97 CE         [ 4] 1284 	call and_cond
      00979A A1 00            [ 1] 1285 	cp a,#TK_INTGR 
      00979C 27 DC            [ 1] 1286 	jreq 3$
      00979E A1 80 26         [ 2] 1287 	jp syntax_error 
      001B8E                       1288 3$:	 
      001B8E                       1289 	_xpop  ; rigth arg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0097A1 0C FE            [ 1]    1     ld a,(y)
      0097A3 72               [ 1]    2     ldw x,y 
      0097A4 5C 00            [ 2]    3     ldw x,(1,x)
      0097A6 02 72 5C 00      [ 2]    4     addw y,#CELL_SIZE 
      0097AA 02 FD 20         [ 1] 1290 	ld acc24,a 
      0097AD E9 00 0D         [ 2] 1291 	ldw acc16,x 
      0097AE                       1292 	_xpop  ; left arg  
      0097AE A1 85            [ 1]    1     ld a,(y)
      0097B0 26               [ 1]    2     ldw x,y 
      0097B1 05 CD            [ 2]    3     ldw x,(1,x)
      0097B3 9C CD 20 E0      [ 2]    4     addw y,#CELL_SIZE 
      0097B7 6B 01            [ 1] 1293 	ld (ATMP,sp),a 
      0097B7 A1 05            [ 1] 1294 	ld a,(OP,sp)
      0097B9 26 05            [ 1] 1295 	cp a,#TK_XOR 
      0097BB CD 9C            [ 1] 1296 	jreq 5$ 
      001BAE                       1297 4$: ; A:X OR acc24   
      0097BD C8 20            [ 1] 1298 	ld a,(ATMP,sp)
      0097BF D7 00 0C         [ 1] 1299 	or a,acc24 
      0097C0 02               [ 1] 1300 	rlwa x 
      0097C0 A1 0A 27         [ 1] 1301 	or a,acc16 
      0097C3 D3               [ 1] 1302 	rlwa x 
      0097C4 A1 03 CD         [ 1] 1303 	or a,acc8 
      0097C7 97               [ 1] 1304 	rlwa x 
      0097C8 E7 20            [ 2] 1305 	jra 6$  
      001BBE                       1306 5$: ; A:X XOR acc24 
      0097CA CC CC            [ 1] 1307 	ld a,(ATMP,sp)
      0097CC 96 C7 0C         [ 1] 1308 	xor a,acc24 
      0097CE 02               [ 1] 1309 	rlwa x 
      0097CE C6 00 02         [ 1] 1310 	xor a,acc16 
      0097D1 C7               [ 1] 1311 	rlwa x 
      0097D2 00 03 C0         [ 1] 1312 	xor a,acc8 
      0097D5 00               [ 1] 1313 	rlwa x 
      001BCC                       1314 6$: _xpush
      0097D6 04 27 0D 03      [ 2]    1     subw y,#CELL_SIZE
      0097D9 90 F7            [ 1]    2     ld (y),a 
      0097D9 CE 00 05         [ 2]    3     ldw (1,y),x 
      0097DC 72 BB            [ 2] 1315 	jra 1$ 
      0097DE 00 01            [ 1] 1316 8$:	ld a,#TK_INTGR 
      001BD9                       1317 9$:	_drop VSIZE 
      0097E0 F6 5C            [ 2]    1     addw sp,#VSIZE 
      0097E2 72               [ 4] 1318 	ret 
                                   1319 
                                   1320 
                                   1321 ;--------------------------------------------
                                   1322 ; BASIC: HEX 
                                   1323 ; select hexadecimal base for integer print
                                   1324 ;---------------------------------------------
      001BDC                       1325 hex_base:
      0097E3 5C 00 02 81      [ 1] 1326 	mov base,#16 
      0097E7 81               [ 4] 1327 	ret 
                                   1328 
                                   1329 ;--------------------------------------------
                                   1330 ; BASIC: DEC 
                                   1331 ; select decimal base for integer print
                                   1332 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      001BE1                       1333 dec_base:
      0097E7 F6 27 03 5C      [ 1] 1334 	mov base,#10
      0097EB 20               [ 4] 1335 	ret 
                                   1336 
                                   1337 ;------------------------
                                   1338 ; BASIC: FREE 
                                   1339 ; return free size in RAM 
                                   1340 ; output:
                                   1341 ;   A:x		size 
                                   1342 ;--------------------------
      001BE6                       1343 free:
      0097EC FA 5C            [ 2] 1344 	pushw y 
      0097EE 72               [ 1] 1345 	clr a 
      0097EF B0 00 05         [ 2] 1346 	ldw x,#tib 
      0097F2 CF 00 01 81      [ 2] 1347 	ldw y,txtend 
      0097F6 90 A3 34 80      [ 2] 1348 	cpw y,#app_space
      0097F6 FE 72            [ 1] 1349 	jrult 1$
      0097F8 5C 00 02         [ 2] 1350 	subw x,#free_ram 
      0097FB 72 5C            [ 2] 1351 	jra 2$ 
      001BFB                       1352 1$:	
      0097FD 00 02 81 1D      [ 2] 1353 	subw x,txtend
      009800 90 85            [ 2] 1354 2$:	popw y 
      009800 F6               [ 4] 1355 	ret 
                                   1356 
                                   1357 ;------------------------------
                                   1358 ; BASIC: SIZE 
                                   1359 ; command that print 
                                   1360 ; program start addres and size 
                                   1361 ;------------------------------
      001C02                       1362 cmd_size:
      009801 EE 01 72         [ 1] 1363 	push base 
      009804 5C 00 02         [ 2] 1364 	ldw x,#PROG_ADDR 
      009807 72 5C 00         [ 4] 1365 	call puts 
      00980A 02 72 5C         [ 2] 1366 	ldw x,txtbgn     
      00980D 00 02 81 0A      [ 1] 1367 	mov base,#16 
      009810 CD 17 96         [ 4] 1368 	call prt_i16
      009810 F6 72 5C         [ 1] 1369 	pop base 
      009813 00 02 81         [ 2] 1370 	ldw x,#PROG_SIZE 
      009816 CD 09 6D         [ 4] 1371 	call puts 
      009816 72 5F 00         [ 2] 1372 	ldw x,txtend 
      009819 0D CF 00 0E      [ 2] 1373 	subw x,txtbgn 
      00981D A6 10 C1         [ 4] 1374 	call prt_i16
      009820 00 0B 27         [ 2] 1375 	ldw x,#STR_BYTES 
      009823 09 72 0F         [ 4] 1376 	call puts  
      009826 00               [ 4] 1377 	ret 
                                   1378 
                                   1379 
                                   1380 ;------------------------
                                   1381 ; BASIC: UBOUND  
                                   1382 ; return array variable size 
                                   1383 ; and set 'array_size' variable 
                                   1384 ; output:
                                   1385 ;   A:X 	array_size
                                   1386 ;--------------------------
      001C2F                       1387 ubound:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009827 0E 04 72         [ 4] 1388 	call free 
      00982A 53 00            [ 1] 1389 	ld a,#CELL_SIZE 
      00982C 0D               [ 2] 1390 	div x,a 
      00982D CF 00 20         [ 2] 1391 	ldw array_size,x
      00982D A6               [ 1] 1392 	clr a 
      00982E FF               [ 4] 1393 	ret 
                                   1394 
                                   1395 ;-----------------------------
                                   1396 ; BASIC: LET var=expr 
                                   1397 ; variable assignement 
                                   1398 ; output:
                                   1399 ;   A 		TK_NONE 
                                   1400 ;-----------------------------
      001C3A                       1401 let::
      00982F CD 98 53         [ 4] 1402 	call next_token 
      009832 CD 91            [ 1] 1403 	cp a,#TK_VAR 
      009834 C5 88            [ 1] 1404 	jreq let_var
      009836 CD 89            [ 1] 1405 	cp a,#TK_ARRAY 
      009838 ED 84            [ 1] 1406 	jreq  let_array
      00983A 81 16 47         [ 2] 1407 	jp syntax_error
      00983B                       1408 let_array:
      00983B 90 F6 93         [ 4] 1409 	call get_array_element
      00983E EE 01            [ 2] 1410 	jra let_eval 
      001C4D                       1411 let_var:
      009840 72 A9 00         [ 4] 1412 	call get_addr
      001C50                       1413 let_eval:
      009843 03 C7 00         [ 2] 1414 	ldw ptr16,x  ; variable address 
      009846 0D CF 00         [ 4] 1415 	call next_token 
      009849 0E CD            [ 1] 1416 	cp a,#TK_EQUAL
      00984B 98 2D            [ 1] 1417 	jreq 1$
      00984D A6 20 CD         [ 2] 1418 	jp syntax_error
      001C5D                       1419 1$:	
      009850 89 90 81         [ 4] 1420 	call condition   
      009853 A1 84            [ 1] 1421 	cp a,#TK_INTGR 
      009853 52 04            [ 1] 1422 	jreq 2$
      009855 0F 02 0F         [ 2] 1423 	jp syntax_error
      001C67                       1424 2$:	
      001C67                       1425 	_xpop ; value 
      009858 01 4D            [ 1]    1     ld a,(y)
      00985A 27               [ 1]    2     ldw x,y 
      00985B 11 C6            [ 2]    3     ldw x,(1,x)
      00985D 00 0B A1 0A      [ 2]    4     addw y,#CELL_SIZE 
      001C70                       1426 3$:
      009861 26 0A 72 0F      [ 4] 1427 	ld [ptr16],a
      009865 00 0D 05 03      [ 1] 1428 	inc ptr8  
      009869 01 CD 82 89      [ 5] 1429 	ldw [ptr16],x 
      00986D 81               [ 4] 1430 	ret 
                                   1431 
                                   1432 
                                   1433 ;--------------------------
                                   1434 ; return constant value 
                                   1435 ; from it's record address
                                   1436 ; input:
                                   1437 ;	X	*const record 
                                   1438 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1439 ;   A:X   const  value
                                   1440 ;--------------------------
      001C7D                       1441 get_const_value: ; -- i 
      00986D AE               [ 1] 1442 	ld a,(x) ; record size 
      00986E 16 68            [ 1] 1443 	sub a,#3 ; * value 
      009870 1C               [ 1] 1444 	push a 
      009871 00 50            [ 1] 1445 	push #0 
      009873 5A 7F 01         [ 2] 1446 	addw x,(1,sp)
      009875 F6               [ 1] 1447 	ld a,(x)
      009875 C6 00            [ 2] 1448 	ldw x,(1,x)
      001C89                       1449 	_drop 2
      009877 0B CD            [ 2]    1     addw sp,#2 
      009879 83               [ 4] 1450 	ret 
                                   1451 
                                   1452 
                                   1453 ;--------------------------
                                   1454 ; list constants in EEPROM 
                                   1455 ; call when using LIST \C 
                                   1456 ;-------------------------
                           000001  1457 	COUNT=1
                           000003  1458 	YTEMP=3
                           000004  1459 	VSIZE=4 
      001C8C                       1460 list_const:
      00987A 55 AB            [ 2] 1461 	pushw y 
      001C8E                       1462 	_vars 4 
      00987C 30 A1            [ 2]    1     sub sp,#4 
      00987E 3A               [ 1] 1463 	clrw x 
      00987F 2B 02            [ 2] 1464 	ldw (COUNT,sp),x  
      009881 AB 07 40 00      [ 2] 1465 	ldw Y,#EEPROM_BASE 
      009883 90 C3 00 24      [ 2] 1466 1$:	cpw y,free_eeprom 
      009883 5A F7            [ 1] 1467 	jruge 9$
      009885 0C 02            [ 2] 1468     ldw (YTEMP,sp),y 
      009887 C6               [ 1] 1469 	ldw x,y
      009888 00               [ 1] 1470 	incw x 
      009889 0D CA 00         [ 4] 1471 	call puts  
      00988C 0E CA            [ 1] 1472 	ld a,#'= 
      00988E 00 0F 26         [ 4] 1473 	call putc 
      009891 E3 C6            [ 2] 1474 	ldw x,(YTEMP,sp)
      009893 00 0B A1         [ 4] 1475 	call get_const_value 
      009896 10 27 08         [ 1] 1476 	ld acc24,a 
      009899 7B 01 27         [ 2] 1477 	ldw acc16,x 
      00989C 0A A6 2D         [ 4] 1478 	call prt_acc24
      00989F 20 02            [ 1] 1479 	ld a,#CR 
      0098A1 CD 09 10         [ 4] 1480 	call putc 
      0098A1 A6 24            [ 2] 1481 	ldw x,(COUNT,sp)
      0098A3 5A               [ 1] 1482 	incw x 
      0098A4 F7 0C            [ 2] 1483 	ldw (COUNT,sp),x 
      0098A6 02 5F 00 0D      [ 1] 1484 	clr acc16 
      0098A7 16 03            [ 2] 1485 	ldw y,(YTEMP,sp)
      0098A7 7B 02            [ 1] 1486 	ld a,(y)
      0098A9 5B 04 81         [ 1] 1487 	ld acc8,a
      0098AC 72 B9 00 0D      [ 2] 1488 	addw y,acc16 
      0098AC A1 61            [ 2] 1489 	jra 1$ 
      001CD2                       1490 9$:	
      0098AE 2A 01            [ 2] 1491 	ldw x,(COUNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0098B0 81 A1 7A         [ 4] 1492 	call prt_i16 
      0098B3 22 FB A0         [ 2] 1493 	ldw x,#CONST_COUNT 
      0098B6 20 81 6D         [ 4] 1494 	call puts 
      0098B8                       1495 	_drop VSIZE 
      0098B8 52 05            [ 2]    1     addw sp,#VSIZE 
      0098BA 1F 04            [ 2] 1496 	popw y 
      0098BC 4F               [ 4] 1497 	ret 
                                   1498 
      0098BD 5F 72 A2 00 03 90 F7  1499 CONST_COUNT: .asciz " constants in EEPROM\n"
             90 EF 01 0F 01 A6 0A
             6B 02 1E 04 F6 27 50
             A1
                                   1500 
                                   1501 
                                   1502 ;--------------------------
                                   1503 ; BASIC: EEFREE 
                                   1504 ; eeprom_free 
                                   1505 ; search end of data  
                                   1506 ; in EEPROM 
                                   1507 ; input:
                                   1508 ;    none 
                                   1509 ; output:
                                   1510 ;    A:X     address free
                                   1511 ;-------------------------
      001CF8                       1512 func_eefree:
      0098D3 2D 26 04         [ 2] 1513 	ldw x,#EEPROM_BASE 
      0098D6 03 01 20 08      [ 1] 1514 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0098DA A1 24 26         [ 2] 1515     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0098DD 08 A6            [ 1] 1516 	jruge 8$ ; no free space 
      0098DF 10               [ 1] 1517 2$: ld a,(x)
      0098E0 6B 02            [ 1] 1518 	jrne 3$
      0098E2 5C               [ 1] 1519 	incw x 
      0098E3 1F 04 F6 0E      [ 1] 1520 	dec acc8 
      0098E6 26 F6            [ 1] 1521 	jrne 2$
      0098E6 A1 61 2B         [ 2] 1522 	subw x,#8 
      0098E9 02 A0            [ 2] 1523 	jra 9$  
      0098EB 20               [ 1] 1524 3$: ld a,(x)
      0098EC A1               [ 1] 1525 	incw x
      0098ED 30               [ 1] 1526 	tnz a  
      0098EE 2B 32            [ 1] 1527 	jrne 3$
      0098F0 A0               [ 2] 1528 	decw x   
      0098F1 30 A1            [ 2] 1529 	jra 1$ 
      0098F3 0A               [ 1] 1530 8$: clrw x ; no free space 
      0098F4 2B               [ 1] 1531 9$: clr a 
      0098F5 06 A0 07         [ 2] 1532 	ldw free_eeprom,x ; save in system variable 
      0098F8 11               [ 4] 1533 	ret 
                                   1534 
                           000005  1535 CONST_REC_XTRA_BYTES=5 
                                   1536 ;--------------------------
                                   1537 ; search constant name 
                                   1538 ; format of constant record  
                                   1539 ;   .byte record length 
                                   1540 ;         = strlen(name)+5 
                                   1541 ;   .asciz name (variable length)
                                   1542 ;   .int24 value (3 bytes )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   1543 ; a constant record use 7+ bytes
                                   1544 ; constants are saved in EEPROM  
                                   1545 ; input:
                                   1546 ;    X     *name
                                   1547 ; output:
                                   1548 ;    X     address|0
                                   1549 ; use:
                                   1550 ;   A,Y, acc16 
                                   1551 ;-------------------------
                           000001  1552 	NAMEPTR=1 ; target name pointer 
                           000003  1553 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1554 	RECLEN=5  ; record length of target
                           000005  1555 	VSIZE=5
      001D21                       1556 search_const:
      0098F9 02 2A            [ 2] 1557 	pushw y 
      001D23                       1558 	_vars VSIZE
      0098FB 26 6B            [ 2]    1     sub sp,#VSIZE 
      0098FD 03 7B 02 5F      [ 1] 1559 	clr acc16 
      009901 02 72 A2         [ 4] 1560 	call strlen 
      009904 00 03            [ 1] 1561 	add a,#CONST_REC_XTRA_BYTES
      009906 90 F7            [ 1] 1562 	ld (RECLEN,sp),a    
      009908 90 EF            [ 2] 1563 	ldw (NAMEPTR,sp),x
      00990A 01 CD 82 E5      [ 2] 1564 	ldw y,#EEPROM_BASE 
      00990E 5F 7B            [ 2] 1565 1$:	ldw x,(NAMEPTR,sp)
      009910 03 02            [ 2] 1566 	ldw (EEPTR,sp),y
      009912 72 A2 00 03      [ 2] 1567 	cpw y, free_eeprom 
      009916 90 F7            [ 1] 1568 	jruge 7$ ; no match found 
      009918 90 EF            [ 1] 1569 	ld a,(y)
      00991A 01 CD            [ 1] 1570 	cp a,(RECLEN,sp)
      00991C 81 EA            [ 1] 1571 	jrne 2$ 
      00991E 1E 04            [ 1] 1572 	incw y 
      009920 20 C0 0D         [ 4] 1573 	call strcmp
      009923 01 27            [ 1] 1574 	jrne 8$ ; match found 
      001D4D                       1575 2$: ; skip this one 	
      009925 03 CD            [ 2] 1576 	ldW Y,(EEPTR,sp)
      009927 82 6F            [ 1] 1577 	ld a,(y)
      009929 C7 00 0E         [ 1] 1578 	ld acc8,a 
      009929 90 F6 93 EE      [ 2] 1579 	addw y,acc16 
      00992D 01 72            [ 2] 1580 	jra 1$  
      001D5A                       1581 7$: ; no match found 
      00992F A9 00            [ 1] 1582 	clr (EEPTR,sp)
      009931 03 C7            [ 1] 1583 	clr (EEPTR+1,sp)
      001D5E                       1584 8$: ; match found 
      009933 00 0D            [ 2] 1585 	ldw x,(EEPTR,sp) ; record address 
      001D60                       1586 9$:	_DROP VSIZE
      009935 CF 00            [ 2]    1     addw sp,#VSIZE 
      009937 0E 5B            [ 2] 1587 	 popw y 
      009939 05               [ 4] 1588 	 ret 
                                   1589 
                                   1590 
                                   1591 ;--------------------------------------------
                                   1592 ; BASIC: CONST name=value [, name=value]*
                                   1593 ; define constant(s) saved in EEPROM
                                   1594 ;--------------------------------------------
                           000001  1595 	CNAME=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                           000003  1596 	BUFPTR=3
                           000005  1597 	RECLEN=5
                           000006  1598 	UPDATE=6
                           000007  1599 	YSAVE=7
                           000008  1600 	VSIZE=8 
      001D65                       1601 cmd_const:
      00993A 81 89            [ 2] 1602 	pushw y 
      00993B                       1603 	_vars VSIZE 
      00993B 52 05            [ 2]    1     sub sp,#VSIZE 
      00993D 17 04            [ 1] 1604 	clr (UPDATE,sp)
      00993F CD 17 4E         [ 4] 1605 	call next_token 
      00993F 1F 02            [ 1] 1606 	cp a,#TK_CHAR 
      009941 F6 A4            [ 1] 1607 	jrne 0$
      009943 0F 6B 01         [ 4] 1608 	call get_char 
      009946 16 04            [ 1] 1609 	and a,#0xDF 
      009948 5C 55            [ 1] 1610 	cp a,#'U 
      009949 26 08            [ 1] 1611 	jrne 1$
      009949 90 F6            [ 1] 1612 	cpl (UPDATE,sp)
      00994B 27 1B            [ 2] 1613 	jra const_loop 
      00994D 0D 01            [ 1] 1614 0$: cp a,#TK_LABEL 
      00994F 27 0A            [ 1] 1615 	jreq cloop_1
      009951 F1 26 07         [ 2] 1616 1$: jp syntax_error
      001D86                       1617 const_loop: 
      009954 90 5C            [ 1] 1618 	ld a,#TK_LABEL 
      009956 5C 0A 01         [ 4] 1619 	call expect  
      001D8B                       1620 cloop_1: 
      009959 20 EE            [ 2] 1621 	ldw (CNAME,sp),x ; *const_name
      00995B CD 17 67         [ 4] 1622 	call skip_string
      00995B 1E 02            [ 2] 1623 	ldw x,(CNAME,sp)
      00995D 1D 00 02         [ 4] 1624 	call strlen  
      009960 4B 00            [ 1] 1625 	add a,#CONST_REC_XTRA_BYTES 
      009962 FE 84            [ 1] 1626 	ld (RECLEN,sp),a 
                                   1627 ; copy name in buffer  
      009964 27 1D            [ 2] 1628 	ldw y,(CNAME,sp) 
      009966 20 D7 68         [ 2] 1629 	ldw x,#tib  
      009968 7B 05            [ 1] 1630 	ld a,(RECLEN,sp)
      009968 1E               [ 1] 1631 	ld (x),a 
      009969 02               [ 1] 1632 	incw x  
      00996A F6 6B 01         [ 4] 1633 	call strcpy 
      00996D A4 0F            [ 2] 1634 	ldw (BUFPTR,sp),x 
                                   1635 ; x not updated by strcpy 
                                   1636 ; BUFPTR must be incremented 
                                   1637 ; to point after name 
      00996F 4C               [ 1] 1638 	clrw x 
      009970 C7 00            [ 1] 1639 	ld a,(RECLEN,sp)
      009972 0F 72            [ 1] 1640 	sub a,#CONST_REC_XTRA_BYTES-1
      009974 5F               [ 1] 1641 	ld xl,a  
      009975 00 0E 72         [ 2] 1642 	addw x,(BUFPTR,sp)
      009978 BB 00            [ 2] 1643 	ldw (BUFPTR,sp),x 
      00997A 0E FE            [ 1] 1644 	ld a,#TK_EQUAL 
      00997C 7B 01 A4         [ 4] 1645 	call expect 
      00997F F0 4E            [ 2] 1646 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      009981 AB 80 4F         [ 4] 1647 	call expression 
      009983 A1 84            [ 1] 1648 	cp a,#TK_INTGR 
      009983 5B 05            [ 1] 1649 	jreq 5$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009985 81 16 47         [ 2] 1650 	jp syntax_error 
      009986                       1651 5$:	_xpop 
      009986 88 CD            [ 1]    1     ld a,(y)
      009988 97               [ 1]    2     ldw x,y 
      009989 CE 11            [ 2]    3     ldw x,(1,x)
      00998B 01 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00998F 96 C7            [ 2] 1652 	ldw (YSAVE,sp),y ; save xtack pointer 
      009991 84 81            [ 2] 1653 	ldw y,(BUFPTR,sp)
      009993 90 F7            [ 1] 1654 	ld (y),a 
      009993 A6 06 CD         [ 2] 1655 	ldw (1,y),x 
                                   1656 ; record completed in buffer 
                                   1657 ; check if constant already exist 
                                   1658 ; if exist and \U option then update  
      009996 99 86 00 18      [ 1] 1659 	clr farptr 
      009998 1E 01            [ 2] 1660 	ldw x,(CNAME,sp)
      009998 4B 00 CD         [ 4] 1661 	call search_const 
      00999B 9B               [ 2] 1662 	tnzw x 
      00999C E8 4D            [ 1] 1663 	jreq 6$ ; new constant  
      00999E 27 12            [ 1] 1664 	tnz (UPDATE,sp)
      0099A0 0C 01            [ 1] 1665 	jreq 8$ 
      0099A2 CD 97            [ 2] 1666 	jra 7$	
      001DE7                       1667 6$:	
      0099A4 CE A1 08         [ 2] 1668 	ldw x,free_eeprom  
      001DEA                       1669 7$:	
      0099A7 27 F1 A1         [ 2] 1670 	ldw farptr+1,x 
      0099AA 07 27 05         [ 2] 1671 	ldw x,#tib 
      0099AD 55 00            [ 1] 1672 	ld a,(RECLEN,sp)
      0099AF 03 00 02         [ 4] 1673 	call write_nbytes
      0099B2 84 81            [ 1] 1674 	tnz (UPDATE,sp)
      0099B4 26 0B            [ 1] 1675 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1676 ; update free_eeprom 
      0099B4 CD               [ 1] 1677 	clrw x 
      0099B5 99 93            [ 1] 1678 	ld a,(RECLEN,sp)
      0099B7 A1               [ 1] 1679 	ld xl,a 
      0099B8 01 27 03 CC      [ 2] 1680 	addw x,free_eeprom 
      0099BC 96 C7 90         [ 2] 1681 	ldw free_eeprom,x
      001E04                       1682 8$: ; check for next constant 
      0099BF F6 93 EE         [ 4] 1683 	call next_token 
      0099C2 01 72            [ 1] 1684 	cp a,#TK_COMMA 
      0099C4 A9 00            [ 1] 1685 	jrne 9$ ; no other constant 
      0099C6 03 C3 00         [ 2] 1686 	jp const_loop 
      001E0E                       1687 9$: 
      001E0E                       1688 	_unget_token    
      0099C9 21 23 05 A6 0A   [ 1]    1      mov in,in.saved  
      001E13                       1689 10$: 
      001E13                       1690 	_drop VSIZE 
      0099CE CC 96            [ 2]    1     addw sp,#VSIZE 
      0099D0 C9 5D            [ 2] 1691 	popw y ; restore xstack pointer 
      0099D2 27               [ 4] 1692 	ret 
                                   1693 
                                   1694 
                                   1695 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1696 ; return program size 
                                   1697 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E18                       1698 prog_size:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      0099D3 F8 89 58         [ 2] 1699 	ldw x,txtend 
      0099D6 72 FB 01 1F      [ 2] 1700 	subw x,txtbgn 
      0099DA 01               [ 4] 1701 	ret 
                                   1702 
                                   1703 ;----------------------------
                                   1704 ; print program information 
                                   1705 ;---------------------------
      001E20                       1706 program_info: 
      0099DB AE 16 68         [ 2] 1707 	ldw x,#PROG_ADDR 
      0099DE 72 F0 01         [ 4] 1708 	call puts 
      0099E1 5B 02 81         [ 2] 1709 	ldw x,txtbgn 
      0099E4 35 10 00 0A      [ 1] 1710 	mov base,#16 
      0099E4 52 01 0F         [ 4] 1711 	call prt_i16
      0099E7 01 CD 97 CE      [ 1] 1712 	mov base,#10  
      0099EB 4D 26 03         [ 2] 1713 	ldw x,#PROG_SIZE
      0099EE CC 9A 89         [ 4] 1714 	call puts 
      0099F1 A1 10 27         [ 4] 1715 	call prog_size 
      0099F4 06 A1 11         [ 4] 1716 	call prt_i16 
      0099F7 26 05 03         [ 2] 1717 	ldw x,#STR_BYTES 
      0099FA 01 09 6D         [ 4] 1718 	call puts
      0099FB CE 00 1B         [ 2] 1719 	ldw x,txtbgn
      0099FB CD 97 CE         [ 2] 1720 	cpw x,#app 
      0099FE 25 05            [ 1] 1721 	jrult 2$
      0099FE 4D 26 03         [ 2] 1722 	ldw x,#FLASH_MEM 
      009A01 CC 96            [ 2] 1723 	jra 3$
      009A03 C7 1E 9A         [ 2] 1724 2$: ldw x,#RAM_MEM 	 
      009A04 CD 09 6D         [ 4] 1725 3$:	call puts 
      009A04 A1 81            [ 1] 1726 	ld a,#CR 
      009A06 26 0C FE         [ 4] 1727 	call putc
      009A09 72               [ 4] 1728 	ret 
                                   1729 
      009A0A 5C 00 02 72 5C 00 02  1730 PROG_ADDR: .asciz "program address: "
             FD 20 63 64 72 65 73
             73 3A 20 00
      009A14 2C 20 70 72 6F 67 72  1731 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A14 A1 84 26 05 CD 98 00  1732 STR_BYTES: .asciz " bytes" 
      009A1B 20 5A 6E 20 46 4C 41  1733 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A1D 20 69 6E 20 52 41 4D  1734 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1735 
                                   1736 
                                   1737 ;----------------------------
                                   1738 ; BASIC: LIST [[start][,end]]
                                   1739 ; list program lines 
                                   1740 ; form start to end 
                                   1741 ; if empty argument list then 
                                   1742 ; list all.
                                   1743 ;----------------------------
                           000001  1744 	FIRST=1
                           000003  1745 	LAST=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                           000005  1746 	LN_PTR=5
                           000006  1747 	VSIZE=6 
      001EA9                       1748 list:
      009A1D A1 05 26 05 CD   [ 2] 1749 	btjf flags,#FRUN,0$
      009A22 99 B4            [ 1] 1750 	ld a,#ERR_CMD_ONLY
      009A24 20 07 49         [ 2] 1751 	jp tb_error
      009A26                       1752 0$:	 
      009A26 A1 85 26         [ 4] 1753 	call next_token 
      009A29 08 CD            [ 1] 1754 	cp a,#TK_CHAR 
      009A2B 97 F6            [ 1] 1755 	jrne 2$
      009A2D CD 17 90         [ 4] 1756 	call get_char 
      009A2D F6 EE            [ 1] 1757 	and a,#0xDF 
      009A2F 01 20            [ 1] 1758 	cp a,#'C 
      009A31 45 04            [ 1] 1759 	jrne 1$
      009A32 CD 1C 8C         [ 4] 1760 	call list_const
      009A32 A1               [ 4] 1761 	ret 
      009A33 03 26 10         [ 2] 1762 1$: jp syntax_error 
      001ECA                       1763 2$:	_unget_token 
      009A36 89 CD 97 E7 85   [ 1]    1      mov in,in.saved  
      009A3B CD 9D A1         [ 4] 1764 	call prog_size 
      009A3E 5D 27            [ 1] 1765 	jrugt 3$
      009A40 2E               [ 4] 1766 	ret 
      001ED5                       1767 3$: _vars VSIZE
      009A41 CD 9C            [ 2]    1     sub sp,#VSIZE 
      009A43 FD 20 31         [ 2] 1768 	ldw x,txtbgn 
      009A46 1F 05            [ 2] 1769 	ldw (LN_PTR,sp),x 
      009A46 A1               [ 2] 1770 	ldw x,(x) 
      009A47 82 26            [ 2] 1771 	ldw (FIRST,sp),x ; list from first line 
      009A49 0E FE 72         [ 2] 1772 	ldw x,#MAX_LINENO ; biggest line number 
      009A4C 5C 00            [ 2] 1773 	ldw (LAST,sp),x 
      009A4E 02 72 5C         [ 4] 1774 	call arg_list
      009A51 00               [ 1] 1775 	tnz a
      009A52 02 FD            [ 1] 1776 	jreq list_loop 
      009A54 5F 02            [ 1] 1777 	cp a,#2 
      009A56 20 1F            [ 1] 1778 	jreq 4$
      009A58 A1 01            [ 1] 1779 	cp a,#1 
      009A58 A1 06            [ 1] 1780 	jreq first_line 
      009A5A 26 13 CD         [ 2] 1781 	jp syntax_error 
      009A5D 9A               [ 2] 1782 4$:	popw x 
      009A5E CF A6            [ 2] 1783 	ldw (LAST+2,sp),x 
      001EF8                       1784 first_line:
      009A60 07               [ 2] 1785 	popw x
      009A61 CD 99            [ 2] 1786 	ldw (FIRST,sp),x 
      001EFB                       1787 lines_skip:
      009A63 86 90 F6         [ 2] 1788 	ldw x,txtbgn
      009A66 93 EE            [ 2] 1789 2$:	ldw (LN_PTR,sp),x 
      009A68 01 72 A9         [ 2] 1790 	cpw x,txtend 
      009A6B 00 03            [ 1] 1791 	jrpl list_exit 
      009A6D 20               [ 2] 1792 	ldw x,(x) ;line# 
      009A6E 08 01            [ 2] 1793 	cpw x,(FIRST,sp)
      009A6F 2A 11            [ 1] 1794 	jrpl list_loop 
      009A6F 55 00            [ 2] 1795 	ldw x,(LN_PTR,sp) 
      009A71 03 00            [ 1] 1796 	ld a,(2,x)
      009A73 02 4F 20         [ 1] 1797 	ld acc8,a 
      009A76 12 5F 00 0D      [ 1] 1798 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009A77 72 BB 00 0D      [ 2] 1799 	addw x,acc16
      009A77 0D 01            [ 2] 1800 	jra 2$ 
                                   1801 ; print loop
      001F1B                       1802 list_loop:
      009A79 27 03            [ 2] 1803 	ldw x,(LN_PTR,sp)
      009A7B CD 82            [ 1] 1804 	ld a,(2,x) 
      009A7D 81 1F 92         [ 4] 1805 	call prt_basic_line
      009A7E 1E 05            [ 2] 1806 	ldw x,(LN_PTR,sp)
      009A7E 72 A2            [ 1] 1807 	ld a,(2,x)
      009A80 00 03 90         [ 1] 1808 	ld acc8,a 
      009A83 F7 90 EF 01      [ 1] 1809 	clr acc16 
      009A87 A6 84 00 0D      [ 2] 1810 	addw x,acc16
      009A89 C3 00 1D         [ 2] 1811 	cpw x,txtend 
      009A89 5B 01            [ 1] 1812 	jrpl list_exit
      009A8B 81 05            [ 2] 1813 	ldw (LN_PTR,sp),x
      009A8C FE               [ 2] 1814 	ldw x,(x)
      009A8C 52 01            [ 2] 1815 	cpw x,(LAST,sp)  
      009A8E CD 99            [ 1] 1816 	jrslt list_loop
      001F3D                       1817 list_exit:
      009A90 E4 4D 27 38 01   [ 1] 1818 	mov in,count 
      009A94 AE 16 B8         [ 2] 1819 	ldw x,#pad 
      009A94 CD 97 CE         [ 2] 1820 	ldw basicptr,x 
      001F48                       1821 	_drop VSIZE 
      009A97 6B 01            [ 2]    1     addw sp,#VSIZE 
      009A99 A4 30 A1         [ 4] 1822 	call program_info 
      009A9C 20               [ 4] 1823 	ret
                                   1824 
                                   1825 
                                   1826 ;--------------------------
                                   1827 ; BASIC: EDIT 
                                   1828 ;  copy program in FLASH 
                                   1829 ;  to RAM for edition 
                                   1830 ;-------------------------
      001F4E                       1831 edit:
      009A9D 27 09 A6         [ 4] 1832 	call qsign 
      009AA0 84 55            [ 1] 1833 	jreq 1$ 
      009AA2 00 03 00         [ 2] 1834 	ldw x,#NOT_SAVED 
      009AA5 02 20 24         [ 4] 1835 	call puts 
      009AA8 81               [ 4] 1836 	ret 
      001F5A                       1837 1$: 
      009AA8 CD 99 E4 4D      [ 2] 1838 	ldw y,#app_sign ; source address 
      009AAC 26 03 CC         [ 2] 1839     ldw x,app_size  
      009AAF 96 C7 04         [ 2] 1840 	addw x,#4 
      009AB1 CF 00 0D         [ 2] 1841 	ldw acc16,x  ; bytes to copy 
      009AB1 7B 01 A1         [ 2] 1842 	ldw x,#rsign ; destination address 
      009AB4 20 26 05         [ 4] 1843 	call move  
      009AB7 CD 82 E5         [ 2] 1844 	ldw x,#free_ram 
      009ABA 20 D8 A1         [ 2] 1845 	ldw txtbgn,x 
      009ABD 21 26 05 CD      [ 2] 1846 	addw x,rsize  
      009AC1 83 73 20         [ 2] 1847 	ldw txtend,x 
      009AC4 CF               [ 4] 1848 	ret 
                                   1849 
      009AC5 4E 6F 20 61 70 70 6C  1850 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



             0A 00
                                   1851 
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
      001F92                       1862 prt_basic_line:
      009AC5 CD 84            [ 2] 1863 	pushw y 
      009AC7 21 20 CA         [ 1] 1864 	ld count,a 
      009ACA E6 02            [ 1] 1865 	ld a,(2,x)
      009ACA A6 84 03         [ 1] 1866 	cp a,count 
      009ACC 2A 03            [ 1] 1867 	jrpl 1$ 
      009ACC 5B 01 81         [ 1] 1868 	ld count,a 
      009ACF CF 00 04         [ 2] 1869 1$:	ldw basicptr,x 
      009ACF 52 01 CD 9A      [ 2] 1870 	ldw y,#tib  
      009AD3 8C 4D 27         [ 4] 1871 	call decompile 
      009AD6 2D 09 6D         [ 4] 1872 	call puts 
      009AD7 A6 0D            [ 1] 1873 	ld a,#CR 
      009AD7 CD 97 CE         [ 4] 1874 	call putc 
      009ADA 6B 01            [ 2] 1875 	popw y 
      009ADC A4               [ 4] 1876 	ret 
                                   1877 
                                   1878 
                                   1879 ;---------------------------------
                                   1880 ; BASIC: PRINT|? arg_list 
                                   1881 ; print values from argument list
                                   1882 ;----------------------------------
                           000001  1883 	CCOMMA=1
                           000001  1884 	VSIZE=1
      001FB6                       1885 print:
      001FB6                       1886 	_vars VSIZE 
      009ADD 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FB8                       1887 reset_comma:
      009ADF 10 27            [ 1] 1888 	clr (CCOMMA,sp)
      001FBA                       1889 prt_loop:
      009AE1 09 55 00         [ 4] 1890 	call next_token
      009AE4 03 00            [ 1] 1891 	cp a,#CMD_END 
      009AE6 02 A6            [ 1] 1892 	jrult 0$
      009AE8 84 20            [ 1] 1893 	cp a,#TK_COLON 
      009AEA 19 04            [ 1] 1894 	jreq 0$
      009AEB A1 80            [ 1] 1895 	cp a,#TK_CMD
      009AEB CD 9A            [ 1] 1896 	jrne 10$
      001FC9                       1897 0$:
      001FC9                       1898 	_unget_token 
      009AED 8C 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009AF2 96 C7            [ 2] 1899 	jra 8$ 
      009AF4                       1900 10$:	
      009AF4 7B 01            [ 1] 1901 	cp a,#TK_QSTR
      009AF6 A1 10            [ 1] 1902 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009AF8 26 05            [ 1] 1903 	cp a,#TK_CHAR 
      009AFA CD 81            [ 1] 1904 	jreq 2$ 
      009AFC EA 20            [ 1] 1905 	cp a,#TK_CFUNC 
      009AFE D8 1F            [ 1] 1906 	jreq 3$
      009AFF A1 08            [ 1] 1907 	cp a,#TK_COMMA 
      009AFF CD 82            [ 1] 1908 	jreq 4$
      009B01 07 20            [ 1] 1909 	cp a,#TK_SHARP 
      009B03 D3 2A            [ 1] 1910 	jreq 5$
      009B04 20 3D            [ 2] 1911 	jra 7$ 
      001FE6                       1912 1$:	; print string 
      009B04 5B 01 81         [ 4] 1913 	call puts
      009B07 5C               [ 1] 1914 	incw x
      009B07 52 01 CD 9A      [ 2] 1915 	subw x,basicptr 
      009B0B CF 4D 27         [ 2] 1916 	ldw in.w,x  
      009B0E 54 CD            [ 2] 1917 	jra reset_comma
      001FF3                       1918 2$:	; print character 
      009B10 97 CE 6B         [ 4] 1919 	call get_char 
      009B13 01 A4 30         [ 4] 1920 	call putc 
      009B16 A1 30            [ 2] 1921 	jra reset_comma 
      001FFB                       1922 3$: ; print character function value  	
      001FFB                       1923 	_get_code_addr 
      009B18 27               [ 2]    1         ldw x,(x)
      009B19 09 A6 84 55      [ 1]    2         inc in 
      009B1D 00 03 00 02      [ 1]    3         inc in 
      009B21 20               [ 4] 1924 	call (x)
      009B22 40 09 10         [ 4] 1925 	call putc
      009B23 20 AE            [ 2] 1926 	jra reset_comma 
      00200A                       1927 4$: ; set comma state 
      009B23 CD 9A            [ 1] 1928 	cpl (CCOMMA,sp)
      009B25 CF 4D            [ 2] 1929 	jra prt_loop   
      00200E                       1930 5$: ; # character must be followed by an integer   
      009B27 26 03 CC         [ 4] 1931 	call next_token
      009B2A 96 C7            [ 1] 1932 	cp a,#TK_INTGR 
      009B2C 27 03            [ 1] 1933 	jreq 6$
      009B2C CD 82 24         [ 2] 1934 	jp syntax_error 
      002018                       1935 6$: ; set tab width
      009B2F 90 F6 93         [ 4] 1936 	call get_int24 
      009B32 EE               [ 1] 1937 	ld a,xl 
      009B33 01 72            [ 1] 1938 	and a,#15 
      009B35 A9 00 03         [ 1] 1939 	ld tab_width,a 
      009B38 4D 2B            [ 2] 1940 	jra reset_comma 
      002023                       1941 7$:	
      002023                       1942 	_unget_token 
      009B3A 08 26 0C 35 02   [ 1]    1      mov in,in.saved  
      009B3F 00 0F 20         [ 4] 1943 	call condition
      009B42 0A               [ 1] 1944 	tnz a 
      009B43 27 05            [ 1] 1945 	jreq 8$    
      009B43 35 04 00         [ 4] 1946     call print_top
      009B46 0F 20            [ 2] 1947 	jra reset_comma 
      002033                       1948 8$:
      009B48 04 01            [ 1] 1949 	tnz (CCOMMA,sp)
      009B49 26 05            [ 1] 1950 	jrne 9$
      009B49 35 01            [ 1] 1951 	ld a,#CR 
      009B4B 00 0F 10         [ 4] 1952     call putc 
      009B4D                       1953 9$:	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009B4D 5F C6            [ 2]    1     addw sp,#VSIZE 
      009B4F 00               [ 4] 1954 	ret 
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
      00203F                       1972 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00203F                       1973 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00203F                       1974 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00203F                       1975 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00203F                       1976 save_context:
      009B50 0F 14 01         [ 2] 1977 	ldw x,basicptr 
      009B53 27 03            [ 2] 1978 	ldw (BPTR,sp),x
      009B55 53 A6 FF         [ 1] 1979 	ld a,in 
      009B58 72 A2            [ 1] 1980 	ld (IN,sp),a
      009B5A 00 03 90         [ 1] 1981 	ld a,count 
      009B5D F7 90            [ 1] 1982 	ld (CNT,sp),a  
      009B5F EF               [ 4] 1983 	ret
                                   1984 
                                   1985 ;-----------------------
                                   1986 ; restore previously saved 
                                   1987 ; BASIC interpreter context 
                                   1988 ; from stack 
                                   1989 ;-------------------------
      00204F                       1990 rest_context:
      009B60 01 A6            [ 2] 1991 	ldw x,(BPTR,sp)
      009B62 84 00 04         [ 2] 1992 	ldw basicptr,x 
      009B63 7B 05            [ 1] 1993 	ld a,(IN,sp)
      009B63 5B 01 81         [ 1] 1994 	ld in,a
      009B66 7B 06            [ 1] 1995 	ld a,(CNT,sp)
      009B66 4B 00 CD         [ 1] 1996 	ld count,a  
      009B69 97               [ 4] 1997 	ret
                                   1998 
                                   1999 
                                   2000 
                                   2001 ;------------------------------------------
                                   2002 ; BASIC: INPUT [string]var[,[string]var]
                                   2003 ; input value in variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2004 ; [string] optionally can be used as prompt 
                                   2005 ;-----------------------------------------
                           000001  2006 	CX_BPTR=1
                           000003  2007 	CX_IN=3
                           000004  2008 	CX_CNT=4
                           000005  2009 	SKIP=5
                           000005  2010 	VSIZE=5
      00205F                       2011 input_var:
      009B6A CE 4D            [ 2] 2012 	pushw y 
      002061                       2013 	_vars VSIZE 
      009B6C 27 25            [ 2]    1     sub sp,#VSIZE 
      002063                       2014 input_loop:
      009B6E A1 87            [ 1] 2015 	clr (SKIP,sp)
      009B70 26 04 03         [ 4] 2016 	call next_token 
      009B73 01 20            [ 1] 2017 	cp a,#TK_QSTR 
      009B75 F2 10            [ 1] 2018 	jrne 1$ 
      009B76 CD 09 6D         [ 4] 2019 	call puts 
      009B76 A1               [ 1] 2020 	incw x 
      009B77 06 26 0A CD      [ 2] 2021 	subw x,basicptr 
      009B7B 9B E8 A6         [ 2] 2022 	ldw in.w,x 
      009B7E 07 CD            [ 1] 2023 	cpl (SKIP,sp)
      009B80 99 86 20         [ 4] 2024 	call next_token 
      009B83 08 55            [ 1] 2025 1$: cp a,#TK_VAR  
      009B85 00 03            [ 1] 2026 	jreq 2$ 
      009B87 00 02 CD         [ 2] 2027 	jp syntax_error
      009B8A 9B 07 76         [ 4] 2028 2$:	call get_addr
      009B8C CF 00 19         [ 2] 2029 	ldw ptr16,x 
      009B8C 0D 01            [ 1] 2030 	tnz (SKIP,sp)
      009B8E 27 03            [ 1] 2031 	jrne 21$ 
      009B90 CD 82 66         [ 4] 2032 	call var_name 
      009B93 CD 09 10         [ 4] 2033 	call putc   
      002093                       2034 21$:
      009B93 5B 01            [ 1] 2035 	ld a,#':
      009B95 81 09 10         [ 4] 2036 	call putc 
      009B96 CD 20 3F         [ 4] 2037 	call save_context 
      009B96 CD 9B 66 4D      [ 1] 2038 	clr count  
      009B9A 27 4B CD         [ 4] 2039 	call readln 
      009B9D 97 CE 4D         [ 2] 2040 	ldw x,#tib 
      009BA0 27 43 A1         [ 1] 2041 	push count
      009BA3 88 27            [ 1] 2042 	push #0 
      009BA5 07 55 00         [ 2] 2043 	addw x,(1,sp)
      009BA8 03               [ 1] 2044 	incw x 
      0020AE                       2045 	_drop 2 
      009BA9 00 02            [ 2]    1     addw sp,#2 
      009BAB 20 38 CD 9B      [ 1] 2046 	clr in 
      009BAF 66 4D 26         [ 4] 2047 	call get_token
      009BB2 03 CC            [ 1] 2048 	cp a,#TK_INTGR
      009BB4 96 C7            [ 1] 2049 	jreq 3$ 
      009BB6 A1 11            [ 1] 2050 	cp a,#TK_MINUS
      009BB6 90 F6            [ 1] 2051 	jrne 22$
      009BB8 93 EE 01         [ 4] 2052 	call get_token 
      009BBB 72 A9            [ 1] 2053 	cp a,#TK_INTGR 
      009BBD 00 03            [ 1] 2054 	jreq 23$
      0020C6                       2055 22$:
      009BBF C7 00 0D         [ 4] 2056 	call rest_context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009BC2 CF 00 0E         [ 2] 2057 	jp syntax_error
      0020CC                       2058 23$:
      009BC5 90 F6 93         [ 4] 2059 	call neg_acc24	
      0020CF                       2060 3$: 
      009BC8 EE 01 72         [ 1] 2061 	ld a,acc24 
      009BCB A9 00 03         [ 2] 2062 	ldw x,acc16 
      009BCE C4 00 0D 02      [ 4] 2063 	ld [ptr16],a
      009BD2 C4 00 0E 02      [ 1] 2064 	inc ptr8  
      009BD6 C4 00 0F 02      [ 5] 2065 	ldw [ptr16],x 
      009BDA 72 A2 00         [ 4] 2066 	call rest_context
      009BDD 03 90 F7         [ 4] 2067 	call next_token 
      009BE0 90 EF            [ 1] 2068 	cp a,#TK_COMMA
      009BE2 01 20            [ 1] 2069 	jrne 4$ 
      009BE4 B7 A6 84         [ 2] 2070 	jp input_loop
      0020EE                       2071 4$:
      009BE7 81 00            [ 1] 2072 	cp a,#TK_NONE 
      009BE8 27 07            [ 1] 2073 	jreq input_exit  
      009BE8 52 02            [ 1] 2074 	cp a,#TK_COLON 
      009BEA CD 9B            [ 1] 2075     jreq input_exit 
      009BEC 96 4D 27         [ 2] 2076 	jp syntax_error 
      0020F9                       2077 input_exit:
      0020F9                       2078 	_drop VSIZE 
      009BEF 69 CD            [ 2]    1     addw sp,#VSIZE 
      009BF1 97 CE            [ 2] 2079 	popw y 
      009BF3 A1               [ 4] 2080 	ret 
                                   2081 
                                   2082 
                                   2083 ;---------------------
                                   2084 ; BASIC: REM | ' 
                                   2085 ; skip comment to end of line 
                                   2086 ;---------------------- 
      0020FE                       2087 remark::
      009BF4 89 27 0B A1 8A   [ 1] 2088 	mov in,count 
      009BF9 27               [ 4] 2089  	ret 
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
      002104                       2105 wait: 
      002104                       2106 	_vars VSIZE
      009BFA 07 55            [ 2]    1     sub sp,#VSIZE 
      009BFC 00 03            [ 1] 2107 	clr (XMASK,sp) 
      009BFE 00 02 20         [ 4] 2108 	call arg_list 
      009C01 55 6B            [ 1] 2109 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C03 02 CD            [ 1] 2110 	jruge 0$
      009C05 9B 96 A1         [ 2] 2111 	jp syntax_error 
      009C08 84 27            [ 1] 2112 0$:	cp a,#3
      009C0A 03 CC            [ 1] 2113 	jrult 1$
      002116                       2114 	_xpop  ; xor mask 
      009C0C 96 C7            [ 1]    1     ld a,(y)
      009C0E 93               [ 1]    2     ldw x,y 
      009C0E 90 F6            [ 2]    3     ldw x,(1,x)
      009C10 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      009C14 A9               [ 1] 2115 	ld a,xl 
      009C15 00 03            [ 1] 2116 	ld (XMASK,sp),a 
      002122                       2117 1$: _xpop ; mask
      009C17 C7 00            [ 1]    1     ld a,(y)
      009C19 0D               [ 1]    2     ldw x,y 
      009C1A CF 00            [ 2]    3     ldw x,(1,x)
      009C1C 0E 90 F6 93      [ 2]    4     addw y,#CELL_SIZE 
      009C20 EE               [ 1] 2118     ld a,xl  
      009C21 01 72            [ 1] 2119 	ld (MASK,sp),a 
      00212E                       2120 	_xpop ; address 
      009C23 A9 00            [ 1]    1     ld a,(y)
      009C25 03               [ 1]    2     ldw x,y 
      009C26 6B 01            [ 2]    3     ldw x,(1,x)
      009C28 7B 02 A1 8A      [ 2]    4     addw y,#CELL_SIZE 
      009C2C 27               [ 1] 2121 2$:	ld a,(x)
      009C2D 10 02            [ 1] 2122 	and a,(MASK,sp)
      009C2E 18 01            [ 1] 2123 	xor a,(XMASK,sp)
      009C2E 7B 01            [ 1] 2124 	jreq 2$ 
      00213E                       2125 	_drop VSIZE 
      009C30 CA 00            [ 2]    1     addw sp,#VSIZE 
      009C32 0D               [ 4] 2126 	ret 
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
      002141                       2138 bit_set:
      009C33 02 CA 00         [ 4] 2139 	call arg_list 
      009C36 0E 02            [ 1] 2140 	cp a,#2	 
      009C38 CA 00            [ 1] 2141 	jreq 1$ 
      009C3A 0F 02 20         [ 2] 2142 	jp syntax_error
      00214B                       2143 1$: 
      00214B                       2144 	_xpop ; mask 
      009C3D 0E F6            [ 1]    1     ld a,(y)
      009C3E 93               [ 1]    2     ldw x,y 
      009C3E 7B 01            [ 2]    3     ldw x,(1,x)
      009C40 C8 00 0D 02      [ 2]    4     addw y,#CELL_SIZE 
      009C44 C8               [ 1] 2145 	ld a,xl
      009C45 00               [ 1] 2146 	push a  
      002156                       2147 	_xpop ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009C46 0E 02            [ 1]    1     ld a,(y)
      009C48 C8               [ 1]    2     ldw x,y 
      009C49 00 0F            [ 2]    3     ldw x,(1,x)
      009C4B 02 72 A2 00      [ 2]    4     addw y,#CELL_SIZE 
      009C4F 03               [ 1] 2148 	pop a 
      009C50 90               [ 1] 2149 	or a,(x)
      009C51 F7               [ 1] 2150 	ld (x),a
      009C52 90               [ 4] 2151 	ret 
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
      002163                       2163 bit_reset:
      009C53 EF 01 20         [ 4] 2164 	call arg_list 
      009C56 99 A6            [ 1] 2165 	cp a,#2  
      009C58 84 5B            [ 1] 2166 	jreq 1$ 
      009C5A 02 81 47         [ 2] 2167 	jp syntax_error
      009C5C                       2168 1$: 
      00216D                       2169 	_xpop ; mask 
      009C5C 35 10            [ 1]    1     ld a,(y)
      009C5E 00               [ 1]    2     ldw x,y 
      009C5F 0B 81            [ 2]    3     ldw x,(1,x)
      009C61 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C61 35               [ 1] 2170 	ld a,xl 
      009C62 0A               [ 1] 2171 	cpl a
      009C63 00               [ 1] 2172 	push a  
      002179                       2173 	_xpop ; addr  
      009C64 0B 81            [ 1]    1     ld a,(y)
      009C66 93               [ 1]    2     ldw x,y 
      009C66 90 89            [ 2]    3     ldw x,(1,x)
      009C68 4F AE 16 68      [ 2]    4     addw y,#CELL_SIZE 
      009C6C 90               [ 1] 2174 	pop a 
      009C6D CE               [ 1] 2175 	and a,(x)
      009C6E 00               [ 1] 2176 	ld (x),a 
      009C6F 1E               [ 4] 2177 	ret 
                                   2178 
                                   2179 ;---------------------
                                   2180 ; BASIC: BTOGL addr,mask
                                   2181 ; toggle bits at 'addr' corresponding 
                                   2182 ; to those of 'mask' that are at 1.
                                   2183 ; arguments:
                                   2184 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2185 ;   mask	    mask^*addr  
                                   2186 ; output:
                                   2187 ;	none 
                                   2188 ;--------------------------
      002186                       2189 bit_toggle:
      009C70 90 A3 B5         [ 4] 2190 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009C73 00 25            [ 1] 2191 	cp a,#2 
      009C75 05 1D            [ 1] 2192 	jreq 1$ 
      009C77 00 80 20         [ 2] 2193 	jp syntax_error
      002190                       2194 1$: _xpop ; mask 
      009C7A 04 F6            [ 1]    1     ld a,(y)
      009C7B 93               [ 1]    2     ldw x,y 
      009C7B 72 B0            [ 2]    3     ldw x,(1,x)
      009C7D 00 1E 90 85      [ 2]    4     addw y,#CELL_SIZE 
      009C81 81               [ 1] 2195 	ld a,xl
      009C82 88               [ 1] 2196 	push a 
      00219B                       2197 	_xpop  ; addr  
      009C82 3B 00            [ 1]    1     ld a,(y)
      009C84 0B               [ 1]    2     ldw x,y 
      009C85 AE 9E            [ 2]    3     ldw x,(1,x)
      009C87 DF CD 89 ED      [ 2]    4     addw y,#CELL_SIZE 
      009C8B CE               [ 1] 2198 	pop a 
      009C8C 00               [ 1] 2199 	xor a,(x)
      009C8D 1C               [ 1] 2200 	ld (x),a 
      009C8E 35               [ 4] 2201 	ret 
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
      0021A8                       2214 bit_test:
      009C8F 10 00 0B         [ 4] 2215 	call func_args 
      009C92 CD 98            [ 1] 2216 	cp a,#2
      009C94 16 32            [ 1] 2217 	jreq 0$
      009C96 00 0B AE         [ 2] 2218 	jp syntax_error
      0021B2                       2219 0$:	
      0021B2                       2220 	_xpop 
      009C99 9E F1            [ 1]    1     ld a,(y)
      009C9B CD               [ 1]    2     ldw x,y 
      009C9C 89 ED            [ 2]    3     ldw x,(1,x)
      009C9E CE 00 1E 72      [ 2]    4     addw y,#CELL_SIZE 
      009CA2 B0               [ 1] 2221 	ld a,xl 
      009CA3 00 1C            [ 1] 2222 	and a,#7
      009CA5 CD               [ 1] 2223 	push a   
      009CA6 98 16            [ 1] 2224 	ld a,#1 
      009CA8 AE 9F            [ 1] 2225 1$: tnz (1,sp)
      009CAA 02 CD            [ 1] 2226 	jreq 2$
      009CAC 89               [ 1] 2227 	sll a 
      009CAD ED 81            [ 1] 2228 	dec (1,sp)
      009CAF 20 F7            [ 2] 2229 	jra 1$
      009CAF CD 9C            [ 1] 2230 2$: ld (1,sp),a  
      0021CC                       2231 	_xpop ; address  
      009CB1 66 A6            [ 1]    1     ld a,(y)
      009CB3 03               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009CB4 62 CF            [ 2]    3     ldw x,(1,x)
      009CB6 00 21 4F 81      [ 2]    4     addw y,#CELL_SIZE 
      009CBA 84               [ 1] 2232 	pop a 
      009CBA CD               [ 1] 2233 	and a,(x)
      009CBB 97 CE            [ 1] 2234 	jreq 3$
      009CBD A1 85            [ 1] 2235 	ld a,#1 
      009CBF 27               [ 1] 2236 3$:	clrw x 
      009CC0 0C               [ 1] 2237 	ld xl,a
      009CC1 A1               [ 1] 2238 	clr a  
      009CC2 05               [ 4] 2239 	ret
                                   2240 
                                   2241 ;--------------------
                                   2242 ; BASIC: POKE addr,byte
                                   2243 ; put a byte at addr 
                                   2244 ;--------------------
      0021DF                       2245 poke:
      009CC3 27 03 CC         [ 4] 2246 	call arg_list 
      009CC6 96 C7            [ 1] 2247 	cp a,#2
      009CC8 27 03            [ 1] 2248 	jreq 1$
      009CC8 CD 99 B4         [ 2] 2249 	jp syntax_error
      0021E9                       2250 1$:	
      0021E9                       2251 	_xpop ; byte   
      009CCB 20 03            [ 1]    1     ld a,(y)
      009CCD 93               [ 1]    2     ldw x,y 
      009CCD CD 97            [ 2]    3     ldw x,(1,x)
      009CCF F6 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CD0 9F               [ 1] 2252     ld a,xl 
      009CD0 CF               [ 1] 2253 	push a 
      0021F4                       2254 	_xpop ; address 
      009CD1 00 1A            [ 1]    1     ld a,(y)
      009CD3 CD               [ 1]    2     ldw x,y 
      009CD4 97 CE            [ 2]    3     ldw x,(1,x)
      009CD6 A1 32 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009CDA CC               [ 1] 2255 	pop a 
      009CDB 96               [ 1] 2256 	ld (x),a 
      009CDC C7               [ 4] 2257 	ret 
                                   2258 
                                   2259 ;-----------------------
                                   2260 ; BASIC: PEEK(addr)
                                   2261 ; get the byte at addr 
                                   2262 ; input:
                                   2263 ;	none 
                                   2264 ; output:
                                   2265 ;	X 		value 
                                   2266 ;-----------------------
      009CDD                       2267 peek:
      009CDD CD 9B E8         [ 4] 2268 	call func_args
      009CE0 A1 84            [ 1] 2269 	cp a,#1 
      009CE2 27 03            [ 1] 2270 	jreq 1$
      009CE4 CC 96 C7         [ 2] 2271 	jp syntax_error
      009CE7                       2272 1$: _xpop ; address  
      009CE7 90 F6            [ 1]    1     ld a,(y)
      009CE9 93               [ 1]    2     ldw x,y 
      009CEA EE 01            [ 2]    3     ldw x,(1,x)
      009CEC 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009CF0 C7 00 18         [ 1] 2273 	ld farptr,a 
      009CF0 72 C7 00         [ 2] 2274 	ldw ptr16,x 
      009CF3 1A 72 5C 00      [ 5] 2275 	ldf a,[farptr]
      009CF7 1B               [ 1] 2276 	clrw x 
      009CF8 72               [ 1] 2277 	ld xl,a 
      009CF9 CF               [ 1] 2278 	clr a 
      009CFA 00               [ 4] 2279 	ret 
                                   2280 
                                   2281 ;---------------------------
                                   2282 ; BASIC IF expr : instructions
                                   2283 ; evaluate expr and if true 
                                   2284 ; execute instructions on same line. 
                                   2285 ;----------------------------
      002221                       2286 if: 
      009CFB 1A 81 68         [ 4] 2287 	call condition  
      009CFD                       2288 	_xpop 
      009CFD F6 A0            [ 1]    1     ld a,(y)
      009CFF 03               [ 1]    2     ldw x,y 
      009D00 88 4B            [ 2]    3     ldw x,(1,x)
      009D02 00 72 FB 01      [ 2]    4     addw y,#CELL_SIZE 
      009D06 F6               [ 1] 2289 	tnz  a  
      009D07 EE 01            [ 1] 2290 	jrne 9$
      009D09 5B               [ 2] 2291 	tnzw x 
      009D0A 02 81            [ 1] 2292 	jrne 9$  
                                   2293 ;skip to next line
      009D0C 55 00 03 00 01   [ 1] 2294 	mov in,count
      002238                       2295 	_drop 2 
      009D0C 90 89            [ 2]    1     addw sp,#2 
      009D0E 52 04 5F         [ 2] 2296 	jp next_line
      009D11 1F               [ 4] 2297 9$:	ret 
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
      00223E                       2313 for: ; { -- var_addr }
      009D12 01               [ 2] 2314 	popw x ; call return address 
      00223F                       2315 	_vars VSIZE 
      009D13 90 AE            [ 2]    1     sub sp,#VSIZE 
      009D15 40               [ 2] 2316 	pushw x  ; RETL1 
      009D16 00 90            [ 1] 2317 	ld a,#TK_VAR 
      009D18 C3 00 25         [ 4] 2318 	call expect
      009D1B 24 35 17         [ 4] 2319 	call get_addr
      009D1E 03 93            [ 2] 2320 	ldw (CVAR,sp),x  ; control variable 
      009D20 5C CD 89         [ 4] 2321 	call let_eval 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D23 ED A6 3D CD      [ 1] 2322 	bset flags,#FLOOP 
      009D27 89 90 1E         [ 4] 2323 	call next_token 
      009D2A 03 CD            [ 1] 2324 	cp a,#TK_CMD 
      009D2C 9C FD            [ 1] 2325 	jreq 1$
      009D2E C7 00 0D         [ 2] 2326 	jp syntax_error
      00225D                       2327 1$:  
      00225D                       2328 	_get_code_addr
      009D31 CF               [ 2]    1         ldw x,(x)
      009D32 00 0E CD 98      [ 1]    2         inc in 
      009D36 2D A6 0D CD      [ 1]    3         inc in 
      009D3A 89 90 1E         [ 2] 2329 	cpw x,#to   
      009D3D 01 5C            [ 1] 2330 	jreq to
      009D3F 1F 01 72         [ 2] 2331 	jp syntax_error 
                                   2332 
                                   2333 ;-----------------------------------
                                   2334 ; BASIC: TO expr 
                                   2335 ; second part of FOR loop initilization
                                   2336 ; leave limit on stack and set 
                                   2337 ; FTO bit in 'flags'
                                   2338 ;-----------------------------------
      00226E                       2339 to: ; { var_addr -- var_addr limit step }
      009D42 5F 00 0E 16 03   [ 2] 2340 	btjt flags,#FLOOP,1$
      009D47 90 F6 C7         [ 2] 2341 	jp syntax_error
      009D4A 00 0F 72         [ 4] 2342 1$: call expression   
      009D4D B9 00            [ 1] 2343 	cp a,#TK_INTGR 
      009D4F 0E 20            [ 1] 2344 	jreq 2$ 
      009D51 C5 16 47         [ 2] 2345 	jp syntax_error
      009D52                       2346 2$: _xpop
      009D52 1E 01            [ 1]    1     ld a,(y)
      009D54 CD               [ 1]    2     ldw x,y 
      009D55 98 16            [ 2]    3     ldw x,(1,x)
      009D57 AE 9D 62 CD      [ 2]    4     addw y,#CELL_SIZE 
      009D5B 89 ED            [ 1] 2347 	ld (LIMIT,sp),a 
      009D5D 5B 04            [ 2] 2348 	ldw (LIMIT+1,sp),x
      009D5F 90 85 81         [ 4] 2349 	call next_token
      009D62 20 63            [ 1] 2350 	cp a,#TK_NONE  
      009D64 6F 6E            [ 1] 2351 	jreq 4$ 
      009D66 73 74            [ 1] 2352 	cp a,#TK_CMD
      009D68 61 6E            [ 1] 2353 	jrne 3$
      002298                       2354 	_get_code_addr
      009D6A 74               [ 2]    1         ldw x,(x)
      009D6B 73 20 69 6E      [ 1]    2         inc in 
      009D6F 20 45 45 50      [ 1]    3         inc in 
      009D73 52 4F 4D         [ 2] 2355 	cpw x,#step 
      009D76 0A 00            [ 1] 2356 	jreq step
      009D78                       2357 3$:	
      0022A6                       2358 	_unget_token   	 
      009D78 AE 40 00 35 08   [ 1]    1      mov in,in.saved  
      0022AB                       2359 4$:	
      009D7D 00 0F            [ 1] 2360 	clr (FSTEP,sp) 
      009D7F A3 47 F8         [ 2] 2361 	ldw x,#1   ; default step  
      009D82 24 17            [ 2] 2362 	ldw (FSTEP+1,sp),x 
      009D84 F6 26            [ 2] 2363 	jra store_loop_addr 
                                   2364 
                                   2365 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2366 ;----------------------------------
                                   2367 ; BASIC: STEP expr 
                                   2368 ; optional third par of FOR loop
                                   2369 ; initialization. 	
                                   2370 ;------------------------------------
      0022B4                       2371 step: ; {var limit -- var limit step}
      009D86 0C 5C 72 5A 00   [ 2] 2372 	btjt flags,#FLOOP,1$
      009D8B 0F 26 F6         [ 2] 2373 	jp syntax_error
      009D8E 1D 00 08         [ 4] 2374 1$: call expression 
      009D91 20 09            [ 1] 2375 	cp a,#TK_INTGR
      009D93 F6 5C            [ 1] 2376 	jreq 2$
      009D95 4D 26 FB         [ 2] 2377 	jp syntax_error
      0022C6                       2378 2$:	
      0022C6                       2379 	_xpop 
      009D98 5A 20            [ 1]    1     ld a,(y)
      009D9A E0               [ 1]    2     ldw x,y 
      009D9B 5F 4F            [ 2]    3     ldw x,(1,x)
      009D9D CF 00 25 81      [ 2]    4     addw y,#CELL_SIZE 
      009DA1 6B 03            [ 1] 2380 	ld (FSTEP,sp),a 
      009DA1 90 89            [ 2] 2381 	ldw (FSTEP+1,sp),x ; step
                                   2382 ; if step < 0 decrement LIMIT 
      009DA3 52               [ 1] 2383 	tnz a
      009DA4 05 72            [ 1] 2384 	jrpl store_loop_addr 
      009DA6 5F 00            [ 1] 2385 	ld a,(LIMIT,sp)
      009DA8 0E CD            [ 2] 2386 	ldw x,(LIMIT+1,sp)
      009DAA 94 0B AB         [ 2] 2387 	subw x,#1 
      009DAD 05 6B            [ 1] 2388 	sbc a,#0 
      009DAF 05 1F            [ 1] 2389 	ld (LIMIT,sp),a 
      009DB1 01 90            [ 2] 2390 	ldw (LIMIT+1,sp),x 
                                   2391 ; leave loop back entry point on cstack 
                                   2392 ; cstack is 1 call deep from interpreter
      0022E3                       2393 store_loop_addr:
      009DB3 AE 40 00         [ 2] 2394 	ldw x,basicptr
      009DB6 1E 01            [ 2] 2395 	ldw (BPTR,sp),x 
      009DB8 17 03 90         [ 2] 2396 	ldw x,in.w 
      009DBB C3 00            [ 2] 2397 	ldw (INW,sp),x   
      009DBD 25 24 1A 90      [ 1] 2398 	bres flags,#FLOOP 
      009DC1 F6 11 05 26      [ 1] 2399 	inc loop_depth  
      009DC5 07               [ 4] 2400 	ret 
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
      0022F6                       2411 next: ; {var limit step retl1 -- [var limit step ] }
      009DC6 90 5C CD 94      [ 1] 2412 	tnz loop_depth 
      009DCA 16 26            [ 1] 2413 	jrne 1$ 
      009DCC 11 16 47         [ 2] 2414 	jp syntax_error 
      009DCD                       2415 1$: 
      009DCD 16 03            [ 1] 2416 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009DCF 90 F6 C7         [ 4] 2417 	call expect
      009DD2 00 0F 72         [ 4] 2418 	call get_addr 
                                   2419 ; check for good variable after NEXT 	 
      009DD5 B9 00            [ 2] 2420 	cpw x,(CVAR,sp)
      009DD7 0E 20            [ 1] 2421 	jreq 2$  
      009DD9 DC 16 47         [ 2] 2422 	jp syntax_error ; not the good one 
      009DDA                       2423 2$: 
      009DDA 0F 03 0F         [ 2] 2424 	ldw ptr16,x 
                                   2425 	; increment variable 
      009DDD 04               [ 1] 2426 	ld a,(x)
      009DDE EE 01            [ 2] 2427 	ldw x,(1,x)  ; get var value 
      009DDE 1E 03 5B         [ 2] 2428 	addw x,(FSTEP+1,sp) ; var+step 
      009DE1 05 90            [ 1] 2429 	adc a,(FSTEP,sp)
      009DE3 85 81 00 19      [ 4] 2430 	ld [ptr16],a
      009DE5 72 5C 00 1A      [ 1] 2431 	inc ptr8  
      009DE5 90 89 52 08      [ 5] 2432 	ldw [ptr16],x 
      009DE9 0F 06 CD         [ 1] 2433 	ld acc24,a 
      009DEC 97 CE A1         [ 2] 2434 	ldw acc16,x 
      009DEF 04 26            [ 1] 2435 	ld a,(LIMIT,sp)
      009DF1 0D CD            [ 2] 2436 	ldw x,(LIMIT+1,sp)
      009DF3 98 10 A4 DF      [ 2] 2437 	subw x,acc16 
      009DF7 A1 55 26         [ 1] 2438 	sbc a,acc24
      009DFA 08 03            [ 1] 2439 	xor a,(FSTEP,sp)
      009DFC 06 20            [ 1] 2440 	xor a,#0x80
      009DFE 07 A1            [ 1] 2441 	jrmi loop_back  
      009E00 03 27            [ 2] 2442 	jra loop_done   
                                   2443 ; check sign of STEP  
      009E02 08 CC            [ 1] 2444 	ld a,(FSTEP,sp)
      009E04 96 C7            [ 1] 2445 	jrpl 4$
                                   2446 ;negative step
      009E06 C6 00 0E         [ 1] 2447     ld a,acc8 
      009E06 A6 03            [ 1] 2448 	jrslt loop_back   
      009E08 CD 99            [ 2] 2449 	jra loop_done  
      002349                       2450 4$: ; positive step
      009E0A 86 0E 00 0E 15   [ 2] 2451 	btjt acc8,#7,loop_done 
      009E0B                       2452 loop_back:
      009E0B 1F 01            [ 2] 2453 	ldw x,(BPTR,sp)
      009E0D CD 97 E7         [ 2] 2454 	ldw basicptr,x 
      009E10 1E 01 CD 94 0B   [ 2] 2455 	btjf flags,#FRUN,1$ 
      009E15 AB 05            [ 1] 2456 	ld a,(2,x)
      009E17 6B 05 16         [ 1] 2457 	ld count,a
      009E1A 01 AE            [ 2] 2458 1$:	ldw x,(INW,sp)
      009E1C 16 68 7B         [ 2] 2459 	ldw in.w,x 
      009E1F 05               [ 4] 2460 	ret 
      002363                       2461 loop_done:
                                   2462 	; remove loop data from stack  
      009E20 F7               [ 2] 2463 	popw x
      002364                       2464 	_drop VSIZE 
      009E21 5C CD            [ 2]    1     addw sp,#VSIZE 
      009E23 94 27 1F 03      [ 1] 2465 	dec loop_depth 
      009E27 5F               [ 2] 2466 	jp (x)
                                   2467 
                                   2468 ;----------------------------
                                   2469 ; called by goto/gosub
                                   2470 ; to get target line number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2471 ; output:
                                   2472 ;    x    line address 
                                   2473 ;---------------------------
      00236B                       2474 get_target_line:
      009E28 7B 05 A0         [ 4] 2475 	call next_token  
      009E2B 04 97            [ 1] 2476 	cp a,#TK_INTGR
      009E2D 72 FB            [ 1] 2477 	jreq get_target_line_addr 
      009E2F 03 1F            [ 1] 2478 	cp a,#TK_LABEL 
      009E31 03 A6            [ 1] 2479 	jreq look_target_symbol 
      009E33 32 CD 99         [ 2] 2480 	jp syntax_error
                                   2481 ; the target is a line number 
                                   2482 ; search it. 
      002379                       2483 get_target_line_addr:
      009E36 86 16            [ 2] 2484 	pushw y 
      009E38 07 CD 9A         [ 4] 2485 	call get_int24 ; line # 
      009E3B CF               [ 1] 2486 	clr a
      009E3C A1 84 27 03      [ 2] 2487 	ldw y,basicptr 
      009E40 CC 96            [ 2] 2488 	ldw y,(y)
      009E42 C7 90            [ 2] 2489 	pushw y 
      009E44 F6 93            [ 2] 2490 	cpw x,(1,sp)
      002389                       2491 	_drop 2  
      009E46 EE 01            [ 2]    1     addw sp,#2 
      009E48 72 A9            [ 1] 2492 	jrult 11$
      009E4A 00               [ 1] 2493 	inc a 
      00238E                       2494 11$: ; scan program for this line# 	
      009E4B 03 17 07         [ 4] 2495 	call search_lineno  
      009E4E 16               [ 2] 2496 	tnzw x ; 0| line# address 
      009E4F 03 90            [ 1] 2497 	jrne 2$ 
      009E51 F7 90            [ 1] 2498 	ld a,#ERR_NO_LINE 
      009E53 EF 01 72         [ 2] 2499 	jp tb_error 
      009E56 5F 00            [ 2] 2500 2$:	popw y  
      009E58 19               [ 4] 2501 	ret 
                                   2502 
                                   2503 ; the GOTO|GOSUB target is a symbol.
                                   2504 ; output:
                                   2505 ;    X    line address|0 
      00239C                       2506 look_target_symbol:
      009E59 1E 01            [ 2] 2507 	pushw y 
      009E5B CD               [ 2] 2508 	pushw x 
      009E5C 9D A1 5D 27      [ 1] 2509 	clr acc16 
      009E60 06 0D 06 27      [ 2] 2510 	ldw y,txtbgn 
      009E64 1F 20 03         [ 1] 2511 1$:	ld a,(3,y) ; first TK_ID on line 
      009E67 A1 03            [ 1] 2512 	cp a,#TK_LABEL 
      009E67 CE 00            [ 1] 2513 	jreq 3$ 
      009E69 25 E6 02         [ 1] 2514 2$:	ld a,(2,y); line length 
      009E6A C7 00 0E         [ 1] 2515 	ld acc8,a 
      009E6A CF 00 1A AE      [ 2] 2516 	addw y,acc16 ;point to next line 
      009E6E 16 68 7B 05      [ 2] 2517 	cpw y,txtend 
      009E72 CD 88            [ 1] 2518 	jrult 1$
      009E74 D1 0D            [ 1] 2519 	ld a,#ERR_BAD_VALUE
      009E76 06 26 0B         [ 2] 2520 	jp tb_error 
      0023C3                       2521 3$: ; found a TK_LABEL 
                                   2522 	; compare with GOTO|GOSUB target 
      009E79 5F 7B            [ 2] 2523 	pushw y ; line address 
      009E7B 05 97 72 BB      [ 2] 2524 	addw y,#4 ; label string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009E7F 00 25            [ 2] 2525 	ldw x,(3,sp) ; target string 
      009E81 CF 00 25         [ 4] 2526 	call strcmp
      009E84 26 04            [ 1] 2527 	jrne 4$
      009E84 CD 97            [ 2] 2528 	popw y 
      009E86 CE A1            [ 2] 2529 	jra 2$ 
      0023D4                       2530 4$: ; target found 
      009E88 08               [ 2] 2531 	popw x ;  address line target  
      0023D5                       2532 	_drop 2 ; target string 
      009E89 26 03            [ 2]    1     addw sp,#2 
      009E8B CC 9E            [ 2] 2533 	popw y 
      009E8D 06               [ 4] 2534 	ret
                                   2535 
                                   2536 
                                   2537 ;--------------------------------
                                   2538 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2539 ; selective goto or gosub 
                                   2540 ;--------------------------------
      009E8E                       2541 cmd_on:
      009E8E 55 00 03 00 02   [ 2] 2542 	btjt flags,#FRUN,0$ 
      009E93 A6 06            [ 1] 2543 	ld a,#ERR_RUN_ONLY
      009E93 5B 08 90         [ 2] 2544 	jp tb_error 
      009E96 85 81 4F         [ 4] 2545 0$:	call expression 
      009E98 A1 84            [ 1] 2546 	cp a,#TK_INTGR
      009E98 CE 00            [ 1] 2547 	jreq 1$
      009E9A 1E 72 B0         [ 2] 2548 	jp syntax_error
      0023EE                       2549 1$: _xpop
      009E9D 00 1C            [ 1]    1     ld a,(y)
      009E9F 81               [ 1]    2     ldw x,y 
      009EA0 EE 01            [ 2]    3     ldw x,(1,x)
      009EA0 AE 9E DF CD      [ 2]    4     addw y,#CELL_SIZE 
                                   2550 ; the selector is the element indice 
                                   2551 ; in the list of arguments. {1..#elements} 
      009EA4 89               [ 1] 2552 	ld a,xl ; keep only bits 7..0
      009EA5 ED CE            [ 1] 2553 	jreq 9$ ; element # begin at 1. 
      009EA7 00               [ 1] 2554 	push a  ; selector  
      009EA8 1C 35 10         [ 4] 2555 	call next_token
      009EAB 00 0B            [ 1] 2556 	cp a,#TK_CMD 
      009EAD CD 98            [ 1] 2557 	jreq 2$ 
      009EAF 16 35 0A         [ 2] 2558 	jp syntax_error 
      002405                       2559 2$: _get_code_addr
      009EB2 00               [ 2]    1         ldw x,(x)
      009EB3 0B AE 9E F1      [ 1]    2         inc in 
      009EB7 CD 89 ED CD      [ 1]    3         inc in 
                                   2560 ;; must be a GOTO or GOSUB 
      009EBB 9E 98 CD         [ 2] 2561 	cpw x,#goto 
      009EBE 98 16            [ 1] 2562 	jreq 4$
      009EC0 AE 9F 02         [ 2] 2563 	cpw x,#gosub 
      009EC3 CD 89            [ 1] 2564 	jreq 4$ 
      009EC5 ED CE 00         [ 2] 2565 	jp syntax_error 
      00241B                       2566 4$: 
      009EC8 1C               [ 1] 2567 	pop a 
      009EC9 A3               [ 2] 2568 	pushw x ; save routine address 	
      009ECA B5               [ 1] 2569 	push a  ; selector  
      00241E                       2570 5$: ; skip elements in list until selector==0 
      009ECB 04 25            [ 1] 2571 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009ECD 05 AE            [ 1] 2572 	jreq 6$ 
                                   2573 ; can be a line# or a label 
      009ECF 9F 09 20         [ 4] 2574 	call next_token 
      009ED2 03 AE            [ 1] 2575 	cp a,#TK_INTGR 
      009ED4 9F 1A            [ 1] 2576 	jreq 52$
      009ED6 CD 89            [ 1] 2577 	cp a,#TK_LABEL 
      009ED8 ED A6            [ 1] 2578 	jreq 54$
      009EDA 0D CD 89         [ 2] 2579 	jp syntax_error 
      002430                       2580 52$: ; got a line number 
      009EDD 90 81 70         [ 1] 2581 	ld a,in ; skip over int24 value 
      009EE0 72 6F            [ 1] 2582 	add a,#CELL_SIZE ; integer size  
      009EE2 67 72 61         [ 1] 2583 	ld in,a 
      009EE5 6D 20            [ 2] 2584 	jra 56$
      009EE7 61 64 64         [ 4] 2585 54$: call skip_string ; skip over label 	
      00243D                       2586 56$: ; if another element comma present 
      009EEA 72 65 73         [ 4] 2587 	call next_token
      009EED 73 3A            [ 1] 2588 	cp a,#TK_COMMA 
      009EEF 20 00            [ 1] 2589 	jreq 5$ 
                                   2590 ; arg list exhausted, selector to big 
                                   2591 ; continue execution on next line 
      002444                       2592 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EF1 2C 20            [ 2]    1     addw sp,#3 
      009EF3 70 72            [ 2] 2593 	jra 9$
      002448                       2594 6$: ;at selected position  
      002448                       2595 	_drop 1 ; discard selector
      009EF5 6F 67            [ 2]    1     addw sp,#1 
                                   2596 ; here only the routine address 
                                   2597 ; of GOTO|GOSUB is on stack 
      009EF7 72 61 6D         [ 4] 2598     call get_target_line
      009EFA 20 73 69         [ 2] 2599 	ldw ptr16,x 	
      009EFD 7A 65 3A 20 00   [ 1] 2600 	mov in,count ; move to end of line  
      009F02 20               [ 2] 2601 	popw x ; cmd address, GOTO||GOSUB 
      009F03 62 79 74         [ 2] 2602 	cpw x,#goto 
      009F06 65 73            [ 1] 2603 	jrne 7$ 
      009F08 00 20 69         [ 2] 2604 	ldw x,ptr16 
      009F0B 6E 20            [ 2] 2605 	jra jp_to_target
      002460                       2606 7$: 
      009F0D 46 4C            [ 2] 2607 	jra gosub_2 ; target in ptr16 
      002462                       2608 9$: ; expr out of range skip to end of line
                                   2609     ; this will force a fall to next line  
      009F0F 41 53 48 20 6D   [ 1] 2610 	mov in,count
      002467                       2611 	_drop 2
      009F14 65 6D            [ 2]    1     addw sp,#2 
      009F16 6F 72 79         [ 2] 2612 	jp next_line  
                                   2613 
                                   2614 
                                   2615 ;------------------------
                                   2616 ; BASIC: GOTO line# 
                                   2617 ; jump to line# 
                                   2618 ; here cstack is 2 call deep from interpreter 
                                   2619 ;------------------------
      00246C                       2620 goto:
      009F19 00 20 69 6E 20   [ 2] 2621 	btjt flags,#FRUN,goto_1  
      009F1E 52 41            [ 1] 2622 	ld a,#ERR_RUN_ONLY
      009F20 4D 20 6D         [ 2] 2623 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      002476                       2624 goto_1:
      009F23 65 6D 6F         [ 4] 2625 	call get_target_line
      002479                       2626 jp_to_target:
      009F26 72 79 00         [ 2] 2627 	ldw basicptr,x 
      009F29 E6 02            [ 1] 2628 	ld a,(2,x)
      009F29 72 01 00         [ 1] 2629 	ld count,a 
      009F2C 23 05 A6 07      [ 1] 2630 	mov in,#3 
      009F30 CC               [ 4] 2631 	ret 
                                   2632 
                                   2633 
                                   2634 ;--------------------
                                   2635 ; BASIC: GOSUB line#
                                   2636 ; basic subroutine call
                                   2637 ; actual line# and basicptr 
                                   2638 ; are saved on cstack
                                   2639 ; here cstack is 2 call deep from interpreter 
                                   2640 ;--------------------
                           000001  2641 	TARGET=1   ; target address 
                           000003  2642 	RET_ADDR=3 ; subroutine return address 
                           000005  2643 	RET_BPTR=5 ; basicptr return point 
                           000007  2644 	RET_INW=7  ; in.w return point 
                           000004  2645 	VSIZE=4  
      002486                       2646 gosub:
      009F31 96 C9 00 22 06   [ 2] 2647 	btjt flags,#FRUN,gosub_1 
      009F33 A6 06            [ 1] 2648 	ld a,#ERR_RUN_ONLY
      009F33 CD 97 CE         [ 2] 2649 	jp tb_error 
      009F36 A1               [ 4] 2650 	ret 
      002491                       2651 gosub_1:
      009F37 04 26 10         [ 4] 2652 	call get_target_line 
      009F3A CD 98 10         [ 2] 2653 	ldw ptr16,x 
      002497                       2654 gosub_2: 
      009F3D A4               [ 2] 2655 	popw x 
      002498                       2656 	_vars VSIZE  
      009F3E DF A1            [ 2]    1     sub sp,#VSIZE 
      009F40 43               [ 2] 2657 	pushw x ; RET_ADDR 
      009F41 26 04 CD         [ 2] 2658 	ldw x,ptr16 
      009F44 9D               [ 2] 2659 	pushw x ; TARGET
                                   2660 ; save BASIC subroutine return point.   
      009F45 0C 81 CC         [ 2] 2661 	ldw x,basicptr
      009F48 96 C7            [ 2] 2662 	ldw (RET_BPTR,sp),x 
      009F4A 55 00 03         [ 2] 2663 	ldw x,in.w 
      009F4D 00 02            [ 2] 2664 	ldw (RET_INW,sp),x
      009F4F CD               [ 2] 2665 	popw x 
      009F50 9E 98            [ 2] 2666 	jra jp_to_target
                                   2667 
                                   2668 ;------------------------
                                   2669 ; BASIC: RETURN 
                                   2670 ; exit from BASIC subroutine 
                                   2671 ;------------------------
                           000003  2672 	RET_BPTR=3 ; basicptr return point 
                           000005  2673 	RET_INW=5  ; in.w return point 
                           000004  2674 	VSIZE=4  
      0024AC                       2675 return:
      009F52 22 01 81 52 06   [ 2] 2676 	btjt flags,#FRUN,0$ 
      009F57 CE 00            [ 1] 2677 	ld a,#ERR_RUN_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009F59 1C 1F 05         [ 2] 2678 	jp tb_error 
      0024B6                       2679 0$:	
      009F5C FE 1F            [ 2] 2680 	ldw x,(RET_ADDR,sp) 
      009F5E 01 AE 7F         [ 2] 2681 	ldw basicptr,x
      009F61 FF 1F            [ 1] 2682 	ld a,(2,x)
      009F63 03 CD 99         [ 1] 2683 	ld count,a  
      009F66 98 4D            [ 2] 2684 	ldw x,(RET_INW,sp)
      009F68 27 31 A1         [ 2] 2685 	ldw in.w,x 
      009F6B 02               [ 2] 2686 	popw x 
      0024C6                       2687 	_drop VSIZE 
      009F6C 27 07            [ 2]    1     addw sp,#VSIZE 
      009F6E A1               [ 2] 2688 	pushw x
      009F6F 01               [ 4] 2689 	ret  
                                   2690 
                                   2691 ;----------------------------------
                                   2692 ; BASIC: RUN
                                   2693 ; run BASIC program in RAM
                                   2694 ;----------------------------------- 
      0024CA                       2695 run: 
      009F70 27 06 CC 96 C7   [ 2] 2696 	btjf flags,#FRUN,0$  
      009F75 85               [ 1] 2697 	clr a 
      009F76 1F               [ 4] 2698 	ret
      0024D1                       2699 0$: 
      009F77 05 09 00 22 12   [ 2] 2700 	btjf flags,#FBREAK,1$
      009F78                       2701 	_drop 2 
      009F78 85 1F            [ 2]    1     addw sp,#2 
      009F7A 01 20 4F         [ 4] 2702 	call rest_context
      009F7B                       2703 	_drop CTXT_SIZE 
      009F7B CE 00            [ 2]    1     addw sp,#CTXT_SIZE 
      009F7D 1C 1F 05 C3      [ 1] 2704 	bres flags,#FBREAK 
      009F81 00 1E 2A 38      [ 1] 2705 	bset flags,#FRUN 
      009F85 FE 13 01         [ 2] 2706 	jp interpreter 
      009F88 2A 11 1E         [ 2] 2707 1$:	ldw x,txtbgn
      009F8B 05 E6 02         [ 2] 2708 	cpw x,txtend 
      009F8E C7 00            [ 1] 2709 	jrmi run_it 
      009F90 0F 72 5F         [ 2] 2710 	ldw x,#err_no_prog
      009F93 00 0E 72         [ 4] 2711 	call puts 
      009F96 BB 00 0E 20 E3   [ 1] 2712 	mov in,count
      009F9B 81               [ 4] 2713 	ret 
      0024FC                       2714 run_it:	 
      0024FC                       2715 	_drop 2 ; drop return address 
      009F9B 1E 05            [ 2]    1     addw sp,#2 
      0024FE                       2716 run_it_02: 
      009F9D E6 02 CD         [ 4] 2717     call ubound 
      009FA0 A0 12 1E         [ 4] 2718 	call clear_vars 
                                   2719 ; clear data pointer 
      009FA3 05               [ 1] 2720 	clrw x 
      009FA4 E6 02 C7         [ 2] 2721 	ldw data_ptr,x 
      009FA7 00 0F 72 5F      [ 1] 2722 	clr data_ofs 
      009FAB 00 0E 72 BB      [ 1] 2723 	clr data_len 
                                   2724 ; initialize BASIC pointer 
      009FAF 00 0E C3         [ 2] 2725 	ldw x,txtbgn 
      009FB2 00 1E 2A         [ 2] 2726 	ldw basicptr,x 
      009FB5 07 1F            [ 1] 2727 	ld a,(2,x)
      009FB7 05 FE 13         [ 1] 2728 	ld count,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009FBA 03 2F DE 01      [ 1] 2729 	mov in,#3	
      009FBD 72 10 00 22      [ 1] 2730 	bset flags,#FRUN 
      009FBD 55 00 04         [ 2] 2731 	jp interpreter 
                                   2732 
                                   2733 
                                   2734 ;----------------------
                                   2735 ; BASIC: END
                                   2736 ; end running program
                                   2737 ;---------------------- 
      002526                       2738 cmd_end: 
                                   2739 ; clean stack 
      009FC0 00 02 AE         [ 2] 2740 	ldw x,#STACK_EMPTY
      009FC3 16               [ 1] 2741 	ldw sp,x 
      009FC4 B8 CF 00         [ 2] 2742 	jp warm_start
                                   2743 
                                   2744 ;---------------------------
                                   2745 ; BASIC: GET var 
                                   2746 ; receive a key in variable 
                                   2747 ; don't wait 
                                   2748 ;---------------------------
      00252D                       2749 cmd_get:
      009FC7 05 5B 06         [ 4] 2750 	call next_token 
      009FCA CD 9E            [ 1] 2751 	cp a,#TK_VAR 
      009FCC A0 81            [ 1] 2752 	jreq 0$
      009FCE CC 16 47         [ 2] 2753 	jp syntax_error 
      009FCE CD A8 15         [ 4] 2754 0$: call get_addr 
      009FD1 27 07 AE         [ 2] 2755 	ldw ptr16,x 
      009FD4 9F FB CD         [ 4] 2756 	call qgetc 
      009FD7 89 ED            [ 1] 2757 	jreq 2$
      009FD9 81 09 20         [ 4] 2758 	call getc  
      009FDA 72 3F 00 19      [ 4] 2759 2$: clr [ptr16]
      009FDA 90 AE B5 00      [ 1] 2760 	inc ptr8 
      009FDE CE B5 02 1C      [ 4] 2761 	clr [ptr16]
      009FE2 00 04 CF 00      [ 1] 2762 	inc ptr8 
      009FE6 0E AE 00 7C      [ 4] 2763 	ld [ptr16],a 
      009FEA CD               [ 4] 2764 	ret 
                                   2765 
                                   2766 
                                   2767 ;-----------------
                                   2768 ; 1 Khz beep 
                                   2769 ;-----------------
      00255A                       2770 beep_1khz:: 
      009FEB 94 37            [ 2] 2771 	pushw y 
      009FED AE 00 80         [ 2] 2772 	ldw x,#100
      009FF0 CF 00 1C 72      [ 2] 2773 	ldw y,#1000
      009FF4 BB 00            [ 2] 2774 	jra beep
                                   2775 
                                   2776 ;-----------------------
                                   2777 ; BASIC: TONE expr1,expr2
                                   2778 ; used TIMER2 channel 1
                                   2779 ; to produce a tone 
                                   2780 ; arguments:
                                   2781 ;    expr1   frequency 
                                   2782 ;    expr2   duration msec.
                                   2783 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      002565                       2784 tone:
      009FF6 7E CF            [ 2] 2785 	pushw y 
      009FF8 00 1E 81         [ 4] 2786 	call arg_list 
      009FFB 4E 6F            [ 1] 2787 	cp a,#2 
      009FFD 20 61            [ 1] 2788 	jreq 1$
      009FFF 70 70 6C         [ 2] 2789 	jp syntax_error 
      002571                       2790 1$: 
      002571                       2791 	_xpop 
      00A002 69 63            [ 1]    1     ld a,(y)
      00A004 61               [ 1]    2     ldw x,y 
      00A005 74 69            [ 2]    3     ldw x,(1,x)
      00A007 6F 6E 20 73      [ 2]    4     addw y,#CELL_SIZE 
      00A00B 61               [ 2] 2792 	pushw x ; duration 
      00257B                       2793 	_xpop ; frequency
      00A00C 76 65            [ 1]    1     ld a,(y)
      00A00E 64               [ 1]    2     ldw x,y 
      00A00F 2E 0A            [ 2]    3     ldw x,(1,x)
      00A011 00 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A012 90 93            [ 1] 2794 	ldw y,x ; frequency 
      00A012 90               [ 2] 2795 	popw x  ; duration 
      002587                       2796 beep:  
      00A013 89               [ 2] 2797 	pushw x 
      00A014 C7 00 04         [ 2] 2798 	ldw x,#TIM2_CLK_FREQ
      00A017 E6               [ 2] 2799 	divw x,y ; cntr=Fclk/freq 
                                   2800 ; round to nearest integer 
      00A018 02 C1 00 04      [ 2] 2801 	cpw y,#TIM2_CLK_FREQ/2
      00A01C 2A 03            [ 1] 2802 	jrmi 2$
      00A01E C7               [ 1] 2803 	incw x 
      002593                       2804 2$:	 
      00A01F 00               [ 1] 2805 	ld a,xh 
      00A020 04 CF 00         [ 1] 2806 	ld TIM2_ARRH,a 
      00A023 05               [ 1] 2807 	ld a,xl 
      00A024 90 AE 16         [ 1] 2808 	ld TIM2_ARRL,a 
                                   2809 ; 50% duty cycle 
      00A027 68               [ 1] 2810 	ccf 
      00A028 CD               [ 2] 2811 	rrcw x 
      00A029 92               [ 1] 2812 	ld a,xh 
      00A02A 27 CD 89         [ 1] 2813 	ld TIM2_CCR1H,a 
      00A02D ED               [ 1] 2814 	ld a,xl
      00A02E A6 0D CD         [ 1] 2815 	ld TIM2_CCR1L,a
      00A031 89 90 90 85      [ 1] 2816 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A035 81 10 53 00      [ 1] 2817 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A036 72 10 53 04      [ 1] 2818 	bset TIM2_EGR,#TIM2_EGR_UG
      00A036 52               [ 2] 2819 	popw x 
      00A037 01 29 F3         [ 4] 2820 	call pause02
      00A038 72 11 53 08      [ 1] 2821 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A038 0F 01 53 00      [ 1] 2822 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A03A 90 85            [ 2] 2823 	popw y 
      00A03A CD               [ 4] 2824 	ret 
                                   2825 
                                   2826 ;-------------------------------
                                   2827 ; BASIC: ADCON 0|1 [,divisor]  
                                   2828 ; disable/enanble ADC 
                                   2829 ;-------------------------------
                           000003  2830 	ONOFF=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                           000001  2831 	DIVSOR=1
                           000004  2832 	VSIZE=4 
      0025C0                       2833 power_adc:
      00A03B 97 CE A1         [ 4] 2834 	call arg_list 
      00A03E 02 25            [ 1] 2835 	cp a,#2	
      00A040 08 A1            [ 1] 2836 	jreq 1$
      00A042 0A 27            [ 1] 2837 	cp a,#1 
      00A044 04 A1            [ 1] 2838 	jreq 0$ 
      00A046 80 26 07         [ 2] 2839 	jp syntax_error 
      00A049 4F               [ 1] 2840 0$:	clr a 
      00A049 55               [ 1] 2841 	clrw x
      0025D0                       2842 	_xpush   ; divisor  
      00A04A 00 03 00 02      [ 2]    1     subw y,#CELL_SIZE
      00A04E 20 63            [ 1]    2     ld (y),a 
      00A050 90 EF 01         [ 2]    3     ldw (1,y),x 
      0025D9                       2843 1$: _at_next 
      00A050 A1 02 27         [ 1]    1     ld a,(3,y)
      00A053 12               [ 1]    2     ldw x,y 
      00A054 A1 04            [ 2]    3     ldw x,(4,x)
      00A056 27               [ 2] 2844 	tnzw x 
      00A057 1B A1            [ 1] 2845 	jreq 2$ 
      0025E2                       2846 	_xpop
      00A059 82 27            [ 1]    1     ld a,(y)
      00A05B 1F               [ 1]    2     ldw x,y 
      00A05C A1 08            [ 2]    3     ldw x,(1,x)
      00A05E 27 2A A1 09      [ 2]    4     addw y,#CELL_SIZE 
      0025EB                       2847 	_xdrop  
      00A062 27 2A 20 3D      [ 2]    1     addw y,#CELL_SIZE 
      00A066 9F               [ 1] 2848 	ld a,xl
      00A066 CD 89            [ 1] 2849 	and a,#7
      00A068 ED               [ 1] 2850 	swap a 
      00A069 5C 72 B0         [ 1] 2851 	ld ADC_CR1,a
      00A06C 00 05 CF 00      [ 1] 2852 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A070 01 20 C5 01      [ 1] 2853 	bset ADC_CR1,#ADC_CR1_ADON 
      00A073                       2854 	_usec_dly 7 
      00A073 CD 98 10         [ 2]    1     ldw x,#(16*7-2)/4
      00A076 CD               [ 2]    2     decw x
      00A077 89               [ 1]    3     nop 
      00A078 90 20            [ 1]    4     jrne .-4
      00A07A BD 08            [ 2] 2855 	jra 3$
      00A07B 72 11 54 01      [ 1] 2856 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A07B FE 72 5C 00      [ 1] 2857 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00260F                       2858 3$:	
      00A07F 02               [ 4] 2859 	ret
                                   2860 
                                   2861 ;-----------------------------
                                   2862 ; BASIC: ADCREAD (channel)
                                   2863 ; read adc channel {0..5}
                                   2864 ; output:
                                   2865 ;   A 		TK_INTGR 
                                   2866 ;   X 		value 
                                   2867 ;-----------------------------
      002610                       2868 analog_read:
      00A080 72 5C 00         [ 4] 2869 	call func_args 
      00A083 02 FD            [ 1] 2870 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A085 CD 89            [ 1] 2871 	jreq 1$
      00A087 90 20 AE         [ 2] 2872 	jp syntax_error
      00A08A                       2873 1$: _xpop 
      00A08A 03 01            [ 1]    1     ld a,(y)
      00A08C 20               [ 1]    2     ldw x,y 
      00A08D AC 01            [ 2]    3     ldw x,(1,x)
      00A08E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A08E CD 97 CE         [ 2] 2874 	cpw x,#5 
      00A091 A1 84            [ 2] 2875 	jrule 2$
      00A093 27 03            [ 1] 2876 	ld a,#ERR_BAD_VALUE
      00A095 CC 96 C7         [ 2] 2877 	jp tb_error 
      00A098 9F               [ 1] 2878 2$: ld a,xl
      00A098 CD 98 00         [ 1] 2879 	ld acc8,a 
      00A09B 9F A4            [ 1] 2880 	ld a,#5
      00A09D 0F C7 00         [ 1] 2881 	sub a,acc8 
      00A0A0 24 20 95         [ 1] 2882 	ld ADC_CSR,a
      00A0A3 72 16 54 02      [ 1] 2883 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0A3 55 00 03 00      [ 1] 2884 	bset ADC_CR1,#ADC_CR1_ADON
      00A0A7 02 CD 9B E8 4D   [ 2] 2885 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0AC 27 05 CD         [ 2] 2886 	ldw x,ADC_DRH
      00A0AF 98 3B            [ 1] 2887 	ld a,#TK_INTGR
      00A0B1 20               [ 4] 2888 	ret 
                                   2889 
                                   2890 ;-----------------------
                                   2891 ; BASIC: DREAD(pin)
                                   2892 ; Arduino pins 
                                   2893 ; read state of a digital pin 
                                   2894 ; pin# {0..15}
                                   2895 ; output:
                                   2896 ;    A 		TK_INTGR
                                   2897 ;    X      0|1 
                                   2898 ;-------------------------
                           000001  2899 	PINNO=1
                           000001  2900 	VSIZE=1
      00264C                       2901 digital_read:
      00264C                       2902 	_vars VSIZE 
      00A0B2 85 01            [ 2]    1     sub sp,#VSIZE 
      00A0B3 CD 19 13         [ 4] 2903 	call func_args
      00A0B3 0D 01            [ 1] 2904 	cp a,#1
      00A0B5 26 05            [ 1] 2905 	jreq 1$
      00A0B7 A6 0D CD         [ 2] 2906 	jp syntax_error
      002658                       2907 1$: _xpop 
      00A0BA 89 90            [ 1]    1     ld a,(y)
      00A0BC 5B               [ 1]    2     ldw x,y 
      00A0BD 01 81            [ 2]    3     ldw x,(1,x)
      00A0BF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0BF CE 00 05         [ 2] 2908 	cpw x,#15 
      00A0C2 1F 03            [ 2] 2909 	jrule 2$
      00A0C4 C6 00            [ 1] 2910 	ld a,#ERR_BAD_VALUE
      00A0C6 02 6B 05         [ 2] 2911 	jp tb_error 
      00A0C9 C6 00 04         [ 4] 2912 2$:	call select_pin 
      00A0CC 6B 06            [ 1] 2913 	ld (PINNO,sp),a
      00A0CE 81 01            [ 1] 2914 	ld a,(GPIO_IDR,x)
      00A0CF 0D 01            [ 1] 2915 	tnz (PINNO,sp)
      00A0CF 1E 03            [ 1] 2916 	jreq 8$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A0D1 CF               [ 1] 2917 3$: srl a 
      00A0D2 00 05            [ 1] 2918 	dec (PINNO,sp)
      00A0D4 7B 05            [ 1] 2919 	jrne 3$ 
      00A0D6 C7 00            [ 1] 2920 8$: and a,#1 
      00A0D8 02               [ 1] 2921 	clrw x 
      00A0D9 7B               [ 1] 2922 	ld xl,a 
      00A0DA 06               [ 1] 2923 	clr a 
      002680                       2924 	_drop VSIZE
      00A0DB C7 00            [ 2]    1     addw sp,#VSIZE 
      00A0DD 04               [ 4] 2925 	ret
                                   2926 
                                   2927 
                                   2928 ;-----------------------
                                   2929 ; BASIC: DWRITE pin,0|1
                                   2930 ; Arduino pins 
                                   2931 ; write to a digital pin 
                                   2932 ; pin# {0..15}
                                   2933 ; output:
                                   2934 ;    A 		TK_INTGR
                                   2935 ;    X      0|1 
                                   2936 ;-------------------------
                           000001  2937 	PINNO=1
                           000002  2938 	PINVAL=2
                           000002  2939 	VSIZE=2
      002683                       2940 digital_write:
      002683                       2941 	_vars VSIZE 
      00A0DE 81 02            [ 2]    1     sub sp,#VSIZE 
      00A0DF CD 19 18         [ 4] 2942 	call arg_list  
      00A0DF 90 89            [ 1] 2943 	cp a,#2 
      00A0E1 52 05            [ 1] 2944 	jreq 1$
      00A0E3 CC 16 47         [ 2] 2945 	jp syntax_error
      00268F                       2946 1$: _xpop 
      00A0E3 0F 05            [ 1]    1     ld a,(y)
      00A0E5 CD               [ 1]    2     ldw x,y 
      00A0E6 97 CE            [ 2]    3     ldw x,(1,x)
      00A0E8 A1 02 26 10      [ 2]    4     addw y,#CELL_SIZE 
      00A0EC CD               [ 1] 2947 	ld a,xl 
      00A0ED 89 ED            [ 1] 2948 	ld (PINVAL,sp),a
      00269B                       2949 	_xpop 
      00A0EF 5C 72            [ 1]    1     ld a,(y)
      00A0F1 B0               [ 1]    2     ldw x,y 
      00A0F2 00 05            [ 2]    3     ldw x,(1,x)
      00A0F4 CF 00 01 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0F8 05 CD 97         [ 2] 2950 	cpw x,#15 
      00A0FB CE A1            [ 2] 2951 	jrule 2$
      00A0FD 85 27            [ 1] 2952 	ld a,#ERR_BAD_VALUE
      00A0FF 03 CC 96         [ 2] 2953 	jp tb_error 
      00A102 C7 CD 97         [ 4] 2954 2$:	call select_pin 
      00A105 F6 CF            [ 1] 2955 	ld (PINNO,sp),a 
      00A107 00 1A            [ 1] 2956 	ld a,#1
      00A109 0D 05            [ 1] 2957 	tnz (PINNO,sp)
      00A10B 26 06            [ 1] 2958 	jreq 4$
      00A10D CD               [ 1] 2959 3$: sll a
      00A10E 92 1D            [ 1] 2960 	dec (PINNO,sp)
      00A110 CD 89            [ 1] 2961 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A112 90 02            [ 1] 2962 4$: tnz (PINVAL,sp)
      00A113 26 05            [ 1] 2963 	jrne 5$
      00A113 A6               [ 1] 2964 	cpl a 
      00A114 3A CD            [ 1] 2965 	and a,(GPIO_ODR,x)
      00A116 89 90            [ 2] 2966 	jra 8$
      00A118 CD A0            [ 1] 2967 5$: or a,(GPIO_ODR,x)
      00A11A BF 72            [ 1] 2968 8$: ld (GPIO_ODR,x),a 
      0026CB                       2969 	_drop VSIZE 
      00A11C 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A11E 04               [ 4] 2970 	ret
                                   2971 
                                   2972 
                                   2973 ;-----------------------
                                   2974 ; BASIC: STOP
                                   2975 ; stop progam execution  
                                   2976 ; without resetting pointers 
                                   2977 ; the program is resumed
                                   2978 ; with RUN 
                                   2979 ;-------------------------
      0026CE                       2980 stop:
      00A11F CD 8A F2 AE 16   [ 2] 2981 	btjt flags,#FRUN,2$
      00A124 68               [ 1] 2982 	clr a
      00A125 3B               [ 4] 2983 	ret 
      0026D5                       2984 2$:	 
                                   2985 ; create space on cstack to save context 
      00A126 00 04 4B         [ 2] 2986 	ldw x,#break_point 
      00A129 00 72 FB         [ 4] 2987 	call puts 
      0026DB                       2988 	_drop 2 ;drop return address 
      00A12C 01 5C            [ 2]    1     addw sp,#2 
      0026DD                       2989 	_vars CTXT_SIZE ; context size 
      00A12E 5B 02            [ 2]    1     sub sp,#CTXT_SIZE 
      00A130 72 5F 00         [ 4] 2990 	call save_context 
      00A133 02 CD 8F         [ 2] 2991 	ldw x,#tib 
      00A136 67 A1 84         [ 2] 2992 	ldw basicptr,x
      00A139 27               [ 1] 2993 	clr (x)
      00A13A 14 A1 11 26      [ 1] 2994 	clr count  
      00A13E 07               [ 1] 2995 	clrw x 
      00A13F CD 8F 67         [ 2] 2996 	ldw in.w,x
      00A142 A1 84 27 06      [ 1] 2997 	bres flags,#FRUN 
      00A146 72 18 00 22      [ 1] 2998 	bset flags,#FBREAK
      00A146 CD A0 CF         [ 2] 2999 	jp interpreter 
      00A149 CC 96 C7 65 61 6B 20  3000 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3001 
                                   3002 ;-----------------------
                                   3003 ; BASIC: NEW
                                   3004 ; from command line only 
                                   3005 ; free program memory
                                   3006 ; and clear variables 
                                   3007 ;------------------------
      00A14C                       3008 new: 
      00A14C CD 82 89 22 01   [ 2] 3009 	btjf flags,#FRUN,0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A14F 81               [ 4] 3010 	ret 
      002720                       3011 0$:	
      00A14F C6 00 0D         [ 4] 3012 	call clear_basic 
      00A152 CE               [ 4] 3013 	ret 
                                   3014 
                                   3015 ;-----------------------------------
                                   3016 ; BASIC: ERASE \E | \F 
                                   3017 ; erase all block in range from 
                                   3018 ;  'app_space' to FLASH end (0x20000)
                                   3019 ;  or all EEPROM 
                                   3020 ; that contains a non zero byte.  
                                   3021 ;-----------------------------------
                           000001  3022 	LIMIT=1 
                           000003  3023 	VSIZE = 3 
      002724                       3024 erase:
      00A153 00 0E 72 C7      [ 1] 3025 	clr farptr 
      002728                       3026 	_vars VSIZE 
      00A157 00 1A            [ 2]    1     sub sp,#VSIZE 
      00A159 72 5C 00         [ 4] 3027 	call next_token 
      00A15C 1B 72            [ 1] 3028 	cp a,#TK_CHAR 
      00A15E CF 00            [ 1] 3029 	jreq 0$ 
      00A160 1A CD A0         [ 2] 3030 	jp syntax_error
      00A163 CF CD 97         [ 4] 3031 0$: call get_char 
      00A166 CE A1            [ 1] 3032 	and a,#0XDF 
      00A168 08 26            [ 1] 3033 	cp a,#'E
      00A16A 03 CC            [ 1] 3034 	jrne 1$
      00A16C A0 E3 00         [ 2] 3035 	ldw x,#EEPROM_BASE 
      00A16E CF 00 19         [ 2] 3036 	ldw farptr+1,x 
      00A16E A1 00 27         [ 2] 3037 	ldw x,#EEPROM_END
      00A171 07               [ 1] 3038 	clr a 
      00A172 A1 0A            [ 2] 3039 	jra 3$ 
      00A174 27 03            [ 1] 3040 1$: cp a,#'F 
      00A176 CC 96            [ 1] 3041 	jreq 2$
      00A178 C7 15 87         [ 2] 3042 	ldw x,#err_bad_value
      00A179 CC 16 49         [ 2] 3043 	jp tb_error
      002753                       3044 2$:
      00A179 5B 05 90         [ 2] 3045 	ldw x,#app_space  
      00A17C 85 81 19         [ 2] 3046 	ldw farptr+1,x 
      00A17E A6 02            [ 1] 3047 	ld a,#(FLASH_END>>16)&0XFF 
      00A17E 55 00 04         [ 2] 3048 	ldw x,#FLASH_END&0xffff
      00275E                       3049 3$:
      00A181 00 02            [ 1] 3050 	ld (LIMIT,sp),a 
      00A183 81 02            [ 2] 3051 	ldw (LIMIT+1,sp),x 
                                   3052  ; operation done from RAM
                                   3053  ; copy code to RAM in tib   
      00A184 CD 07 0E         [ 4] 3054 	call move_erase_to_ram
      002765                       3055 4$:	 
      00A184 52 04 0F         [ 4] 3056     call scan_block 
      00A187 01 CD            [ 1] 3057 	jreq 5$  ; block already erased 
      00A189 99 98            [ 1] 3058     ld a,#'E 
      00A18B A1 02 24         [ 4] 3059     call putc 
      00A18E 03 CC 96         [ 4] 3060 	call block_erase   
                                   3061 ; this block is clean, next  
      00A191 C7 A1 03         [ 2] 3062 5$:	ldw x,#BLOCK_SIZE
      00A194 25 0C 90         [ 4] 3063 	call incr_farptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3064 ; check limit, 24 bit substraction  	
      00A197 F6 93            [ 1] 3065 	ld a,(LIMIT,sp)
      00A199 EE 01            [ 2] 3066 	ldw x,(LIMIT+1,sp)
      00A19B 72 A9 00 03      [ 2] 3067 	subw x,farptr+1
      00A19F 9F 6B 01         [ 1] 3068 	sbc a,farptr 
      00A1A2 90 F6            [ 1] 3069 	jrugt 4$ 
      00A1A4 93 EE 01         [ 4] 3070 9$: call clear_basic
      00A1A7 72 A9            [ 2] 3071 	ldw x,(LIMIT+1,sp)
      00A1A9 00 03 9F         [ 2] 3072 	cpw x,#EEPROM_END
      00A1AC 6B 02            [ 1] 3073 	jrne 10$
      00A1AE 90 F6 93         [ 4] 3074 	call func_eefree 
      002792                       3075 10$:
      002792                       3076 	_drop VSIZE 
      00A1B1 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A1B3 72               [ 4] 3077 	ret 
                                   3078 	
                                   3079 
                                   3080 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3081 ;  check for application signature 
                                   3082 ; output:
                                   3083 ;   Carry    0 app present 
                                   3084 ;            1 no app installed  
                                   3085 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002795                       3086 qsign: 
      00A1B4 A9 00 03         [ 2] 3087 	ldw x,app_sign 
      00A1B7 F6 14 02         [ 2] 3088 	cpw x,SIGNATURE ; "BC" 
      00A1BA 18               [ 4] 3089 	ret 
                                   3090 
                                   3091 ;--------------------------------------
                                   3092 ;  fill write buffer 
                                   3093 ;  input:
                                   3094 ;    y  point to output buffer 
                                   3095 ;    x  point to source 
                                   3096 ;    a  bytes to write in buffer 
                                   3097 ;  output:
                                   3098 ;    y   += A 
                                   3099 ;    X   += A 
                                   3100 ;    A   0 
                                   3101 ;---------------------------------------
      00279C                       3102 fill_write_buffer:
      00A1BB 01               [ 1] 3103 	push a 
      00A1BC 27               [ 1] 3104 	tnz a 
      00A1BD F9 5B            [ 1] 3105 	jreq 9$ 
      00A1BF 04               [ 1] 3106 1$: ld a,(x)
      00A1C0 81               [ 1] 3107 	incw x 
      00A1C1 90 F7            [ 1] 3108 	ld (y),a 
      00A1C1 CD 99            [ 1] 3109 	incw y 
      00A1C3 98 A1            [ 1] 3110 	dec (1,sp) 
      00A1C5 02 27            [ 1] 3111 	jrne 1$ 
      00A1C7 03               [ 1] 3112 9$:	pop a 
      00A1C8 CC               [ 4] 3113     ret 	
                                   3114 
                                   3115 ;--------------------------------------
                                   3116 ;  fill pad buffer with zero 
                                   3117 ;  input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3118 ;	none 
                                   3119 ;  output:
                                   3120 ;    y     buffer address  
                                   3121 ;--------------------------------------
      0027AC                       3122 clear_block_buffer:
      00A1C9 96               [ 1] 3123 	push a 
      00A1CA C7 AE 16 B8      [ 2] 3124 	ldw y,#block_buffer 
      00A1CB 90 89            [ 2] 3125 	pushw y
      00A1CB 90 F6            [ 1] 3126 	ld a,#BLOCK_SIZE   
      00A1CD 93 EE            [ 1] 3127 1$:	clr (y)
      00A1CF 01 72            [ 1] 3128 	incw y
      00A1D1 A9               [ 1] 3129 	dec a  
      00A1D2 00 03            [ 1] 3130 	jrne 1$ 	
      00A1D4 9F 88            [ 2] 3131 9$: popw y 
      00A1D6 90               [ 1] 3132 	pop a 			
      00A1D7 F6               [ 4] 3133 	ret 
                                   3134 
                                   3135 
                                   3136 ;---------------------------------------
                                   3137 ; BASIC: SAVE
                                   3138 ; write application from RAM to FLASH
                                   3139 ;--------------------------------------
                           000001  3140 	XTEMP=1
                           000003  3141 	COUNT=3  ; last count bytes written 
                           000004  3142 	CNT_LO=4 ; count low byte 
                           000005  3143 	TOWRITE=5 ; how bytes left to write  
                           000006  3144 	VSIZE=6 
      0027C0                       3145 save_app:
      00A1D8 93               [ 2] 3146 	pushw x 
      00A1D9 EE 01            [ 2] 3147 	pushw y 
      0027C3                       3148 	_vars VSIZE
      00A1DB 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A1DD 00 03 84         [ 4] 3149 	call qsign 
      00A1E0 FA F7            [ 1] 3150 	jrne 1$
      00A1E2 81 28 57         [ 2] 3151 	ldw x,#CANT_DO 
      00A1E3 CD 09 6D         [ 4] 3152 	call puts 
      00A1E3 CD 99 98         [ 2] 3153 	jp 9$
      0027D3                       3154 1$: 
      00A1E6 A1 02 27         [ 2] 3155 	ldw x,txtbgn
      00A1E9 03 CC 96         [ 2] 3156 	cpw x,txtend 
      00A1EC C7 09            [ 1] 3157 	jrult 2$ 
      00A1ED AE 28 99         [ 2] 3158 	ldw x,#NO_APP
      00A1ED 90 F6 93         [ 4] 3159 	call puts 
      00A1F0 EE 01 72         [ 2] 3160 	jp 9$
      0027E4                       3161 2$: 
                                   3162 ; block programming flash
                                   3163 ; must be done from RAM
                                   3164 ; moved in tib  
      00A1F3 A9 00 03         [ 4] 3165 	call move_prg_to_ram
                                   3166 ; initialize farptr 
                                   3167 ; to app_sign address 
      00A1F6 9F 43 88 90      [ 1] 3168 	clr farptr 
      00A1FA F6 93 EE         [ 2] 3169 	ldw x,#app_sign 
      00A1FD 01 72 A9         [ 2] 3170 	ldw farptr+1,x
                                   3171 ; initialize local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A200 00 03 84         [ 4] 3172 	call prog_size
      00A203 F4 F7            [ 2] 3173 	ldw (TOWRITE,sp),x
      00A205 81 03            [ 1] 3174 	clr (COUNT,sp)
                                   3175 ; first bock 
                                   3176 ; containt signature 2 bytes 
                                   3177 ; and size 	2 bytes 
                                   3178 ; use Y as pointer to block_buffer
      00A206 CD 27 AC         [ 4] 3179 	call clear_block_buffer ; -- y=*block_buffer	
                                   3180 ; write signature
      00A206 CD 99 98         [ 2] 3181 	ldw x,SIGNATURE ; "BC" 
      00A209 A1 02            [ 2] 3182 	ldw (y),x 
      00A20B 27 03 CC 96      [ 2] 3183 	addw y,#2
      00A20F C7 90            [ 2] 3184 	ldw x,(TOWRITE,sp)
      00A211 F6 93            [ 2] 3185 	ldw (y),x
      00A213 EE 01 72 A9      [ 2] 3186 	addw y,#2   
      00A217 00 03            [ 1] 3187 	ld a,#(BLOCK_SIZE-4)
      00A219 9F 88            [ 1] 3188 	ld (CNT_LO,sp),a 
      00A21B 90 F6 93         [ 2] 3189 	cpw x,#(BLOCK_SIZE-4) 
      00A21E EE 01            [ 1] 3190 	jrugt 3$
      00A220 72               [ 1] 3191 	ld a,xl 
      00A221 A9 00            [ 1] 3192 3$:	ld (CNT_LO,sp),a   
      00A223 03 84 F8         [ 2] 3193 	ldw x,txtbgn 
      00A226 F7 81            [ 2] 3194 	ldw (XTEMP,sp),x 
      00A228                       3195 32$: 
      00A228 CD 99            [ 2] 3196 	ldw x,(XTEMP,sp)
      00A22A 93 A1            [ 1] 3197 	ld a,(CNT_LO,sp)
      00A22C 02 27 03         [ 4] 3198 	call fill_write_buffer 
      00A22F CC 96            [ 2] 3199 	ldw (XTEMP,sp),x 
      00A231 C7 16 B8         [ 2] 3200 	ldw x,#block_buffer
      00A232 CD 07 68         [ 4] 3201 	call write_buffer
      00A232 90 F6 93         [ 2] 3202 	ldw x,#BLOCK_SIZE 
      00A235 EE 01 72         [ 4] 3203 	call incr_farptr  
                                   3204 ; following blocks 
      00A238 A9 00            [ 2] 3205 	ldw x,(XTEMP,sp)
      00A23A 03 9F A4         [ 2] 3206 	cpw x,txtend 
      00A23D 07 88            [ 1] 3207 	jruge 9$ 
      00A23F A6 01            [ 2] 3208 	ldw x,(TOWRITE,sp)
      00A241 0D 01 27         [ 2] 3209 	subw x,(COUNT,sp)
      00A244 05 48            [ 2] 3210 	ldw (TOWRITE,sp),x 
      00A246 0A 01            [ 1] 3211 	ld a,#BLOCK_SIZE 
      00A248 20 F7 6B         [ 2] 3212 	cpw x,#BLOCK_SIZE 
      00A24B 01 90            [ 1] 3213 	jruge 4$ 
      00A24D F6               [ 1] 3214 	ld a,xl 
      00A24E 93 EE            [ 1] 3215 4$:	ld (CNT_LO,sp),a 
      00A250 01 72 A9         [ 4] 3216 	call clear_block_buffer 
      00A253 00 03            [ 2] 3217 	jra 32$ 
      00284F                       3218 9$:	_drop VSIZE 
      00A255 84 F4            [ 2]    1     addw sp,#VSIZE 
      00A257 27 02            [ 2] 3219     popw y 
      00A259 A6               [ 2] 3220 	popw x 
      00A25A 01               [ 4] 3221 	ret 
                                   3222 
                                   3223 
      00A25B 5F 97                 3224 SIGNATURE: .ascii "BC"
      00A25D 4F 81 6E 27 74 20 66  3225 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A25F 4E 6F 20 61 70 70 6C  3226 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3227 
                                   3228 ;---------------------
                                   3229 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3230 ; write 1 or more byte to FLASH or EEPROM
                                   3231 ; starting at address  
                                   3232 ; input:
                                   3233 ;   expr1  	is address 
                                   3234 ;   expr2,...,exprn   are bytes to write
                                   3235 ; output:
                                   3236 ;   none 
                                   3237 ;---------------------
      0028AF                       3238 write:
      00A25F CD 99 98         [ 4] 3239 	call expression
      00A262 A1 02            [ 1] 3240 	cp a,#TK_INTGR 
      00A264 27 03            [ 1] 3241 	jreq 0$
      00A266 CC 96 C7         [ 2] 3242 	jp syntax_error
      00A269                       3243 0$: _xpop 
      00A269 90 F6            [ 1]    1     ld a,(y)
      00A26B 93               [ 1]    2     ldw x,y 
      00A26C EE 01            [ 2]    3     ldw x,(1,x)
      00A26E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A272 9F 88 90         [ 1] 3244 	ld farptr,a 
      00A275 F6 93 EE         [ 2] 3245 	ldw ptr16,x 
      0028C8                       3246 1$:	
      00A278 01 72 A9         [ 4] 3247 	call next_token 
      00A27B 00 03            [ 1] 3248 	cp a,#TK_COMMA 
      00A27D 84 F7            [ 1] 3249 	jreq 2$ 
      00A27F 81 20            [ 2] 3250 	jra 9$ ; no more data 
      00A280 CD 1A 4F         [ 4] 3251 2$:	call expression
      00A280 CD 99            [ 1] 3252 	cp a,#TK_INTGR
      00A282 93 A1            [ 1] 3253 	jreq 3$
      00A284 01 27 03         [ 2] 3254 	jp syntax_error
      0028DB                       3255 3$:	_xpop 
      00A287 CC 96            [ 1]    1     ld a,(y)
      00A289 C7               [ 1]    2     ldw x,y 
      00A28A 90 F6            [ 2]    3     ldw x,(1,x)
      00A28C 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A290 A9               [ 1] 3256 	ld a,xl 
      00A291 00               [ 1] 3257 	clrw x 
      00A292 03 C7 00         [ 4] 3258 	call write_byte
      00A295 19 CF 00         [ 2] 3259 	ldw x,#1 
      00A298 1A 92 BC         [ 4] 3260 	call incr_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A29B 00 19            [ 2] 3261 	jra 1$ 
      0028F1                       3262 9$:
      00A29D 5F               [ 4] 3263 	ret 
                                   3264 
                                   3265 
                                   3266 ;---------------------
                                   3267 ;BASIC: CHAR(expr)
                                   3268 ; évaluate expression 
                                   3269 ; and take the 7 least 
                                   3270 ; bits as ASCII character
                                   3271 ; output: 
                                   3272 ; 	A char 
                                   3273 ;---------------------
      0028F2                       3274 func_char:
      00A29E 97 4F 81         [ 4] 3275 	call func_args 
      00A2A1 A1 01            [ 1] 3276 	cp a,#1
      00A2A1 CD 9B            [ 1] 3277 	jreq 1$
      00A2A3 E8 90 F6         [ 2] 3278 	jp syntax_error
      0028FC                       3279 1$:	_xpop
      00A2A6 93 EE            [ 1]    1     ld a,(y)
      00A2A8 01               [ 1]    2     ldw x,y 
      00A2A9 72 A9            [ 2]    3     ldw x,(1,x)
      00A2AB 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2AF 0D               [ 1] 3280 	ld a,xl
      00A2B0 5D 26            [ 1] 3281 	and a,#0x7f 
      00A2B2 0A               [ 4] 3282 	ret
                                   3283 
                                   3284 ;---------------------
                                   3285 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3286 ; extract first character 
                                   3287 ; of string argument 
                                   3288 ; output:
                                   3289 ;    A:X    int24 
                                   3290 ;---------------------
      002909                       3291 ascii:
      00A2B3 55 00            [ 1] 3292 	ld a,#TK_LPAREN
      00A2B5 04 00 02         [ 4] 3293 	call expect 
      00A2B8 5B 02 CC         [ 4] 3294 	call next_token 
      00A2BB 97 7A            [ 1] 3295 	cp a,#TK_QSTR 
      00A2BD 81 0E            [ 1] 3296 	jreq 1$
      00A2BE A1 04            [ 1] 3297 	cp a,#TK_CHAR 
      00A2BE 85 52            [ 1] 3298 	jreq 2$ 
      00A2C0 0D 89            [ 1] 3299 	cp a,#TK_CFUNC 
      00A2C2 A6 85            [ 1] 3300 	jreq 0$
      00A2C4 CD 99 86         [ 2] 3301 	jp syntax_error
      002920                       3302 0$: ; cfunc 
      00A2C7 CD               [ 4] 3303 	call (x)
      00A2C8 97 F6            [ 2] 3304 	jra 3$
      002923                       3305 1$: ; quoted string 
      00A2CA 1F               [ 1] 3306 	ld a,(x)
      00A2CB 09               [ 1] 3307 	push a  
      00A2CC CD 9C D0         [ 4] 3308 	call skip_string
      00A2CF 72               [ 1] 3309 	pop a  	
      00A2D0 14 00            [ 2] 3310 	jra 3$ 
      00292B                       3311 2$: ; character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A2D2 23 CD 97         [ 4] 3312 	call get_char 
      00A2D5 CE               [ 1] 3313 3$:	clrw x 
      00A2D6 A1               [ 1] 3314 	rlwa x   
      002930                       3315 4$:	_xpush  
      00A2D7 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A2DB 96 C7            [ 1]    2     ld (y),a 
      00A2DD 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A2DD FE 72            [ 1] 3316 	ld a,#TK_RPAREN 
      00A2DF 5C 00 02         [ 4] 3317 	call expect
      00293E                       3318 9$:	
      00293E                       3319 	_xpop  
      00A2E2 72 5C            [ 1]    1     ld a,(y)
      00A2E4 00               [ 1]    2     ldw x,y 
      00A2E5 02 A3            [ 2]    3     ldw x,(1,x)
      00A2E7 A2 EE 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2EB CC               [ 4] 3320 	ret 
                                   3321 
                                   3322 ;---------------------
                                   3323 ;BASIC: KEY
                                   3324 ; wait for a character 
                                   3325 ; received from STDIN 
                                   3326 ; input:
                                   3327 ;	none 
                                   3328 ; output:
                                   3329 ;	a	 character 
                                   3330 ;---------------------
      002948                       3331 key:
      00A2EC 96 C7 20         [ 4] 3332 	call getc 
      00A2EE 81               [ 4] 3333 	ret
                                   3334 
                                   3335 ;----------------------
                                   3336 ; BASIC: QKEY
                                   3337 ; Return true if there 
                                   3338 ; is a character in 
                                   3339 ; waiting in STDIN 
                                   3340 ; input:
                                   3341 ;  none 
                                   3342 ; output:
                                   3343 ;   A     0|-1
                                   3344 ;-----------------------
      00294C                       3345 qkey:: 
      00A2EE 72               [ 1] 3346 	clrw x 
      00A2EF 04 00 23         [ 1] 3347 	ld a,rx1_head
      00A2F2 03 CC 96         [ 1] 3348 	sub a,rx1_tail 
      00A2F5 C7 CD            [ 1] 3349 	jreq 9$ 
      00A2F7 9A               [ 2] 3350 	cplw x
      00A2F8 CF A1            [ 1] 3351 	ld a,#255    
      002958                       3352 9$: 
      00A2FA 84               [ 4] 3353 	ret 
                                   3354 
                                   3355 ;---------------------
                                   3356 ; BASIC: GPIO(port,reg)
                                   3357 ; return gpio register address 
                                   3358 ; expr {PORTA..PORTI}
                                   3359 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3360 ;   none 
                                   3361 ; output:
                                   3362 ;   A:X 	gpio register address
                                   3363 ;----------------------------
                                   3364 ;	N=PORT
                                   3365 ;	T=REG 
      002959                       3366 gpio:
      00A2FB 27 03 CC         [ 4] 3367 	call func_args 
      00A2FE 96 C7            [ 1] 3368 	cp a,#2
      00A300 90 F6            [ 1] 3369 	jreq 1$
      00A302 93 EE 01         [ 2] 3370 	jp syntax_error  
      002963                       3371 1$:	_at_next 
      00A305 72 A9 00         [ 1]    1     ld a,(3,y)
      00A308 03               [ 1]    2     ldw x,y 
      00A309 6B 06            [ 2]    3     ldw x,(4,x)
      00A30B 1F 07 CD         [ 2] 3372 	cpw x,#PA_BASE 
      00A30E 97 CE            [ 1] 3373 	jrmi bad_port
      00A310 A1 00 27         [ 2] 3374 	cpw x,#PI_BASE+1 
      00A313 17 A1            [ 1] 3375 	jrpl bad_port
      00A315 80               [ 2] 3376 	pushw x 
      002974                       3377 	_xpop
      00A316 26 0E            [ 1]    1     ld a,(y)
      00A318 FE               [ 1]    2     ldw x,y 
      00A319 72 5C            [ 2]    3     ldw x,(1,x)
      00A31B 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A31F 00 02 A3         [ 2] 3378 	addw x,(1,sp)
      002980                       3379 	_drop 2 
      00A322 A3 34            [ 2]    1     addw sp,#2 
      00A324 27               [ 1] 3380 	clr a 
      00A325 0E               [ 4] 3381 	ret
      00A326                       3382 bad_port:
      00A326 55 00            [ 1] 3383 	ld a,#ERR_BAD_VALUE
      00A328 03 00 02         [ 2] 3384 	jp tb_error
                                   3385 
                                   3386 
                                   3387 ;-------------------------
                                   3388 ; BASIC: UFLASH 
                                   3389 ; return free flash address
                                   3390 ; input:
                                   3391 ;  none 
                                   3392 ; output:
                                   3393 ;	A		TK_INTGR
                                   3394 ;   xstack	free address 
                                   3395 ;---------------------------
      00A32B                       3396 uflash:
      00A32B 0F 03 AE         [ 4] 3397 	call qsign 
      00A32E 00 01            [ 1] 3398 	jrne 1$
      00A330 1F 04 20         [ 2] 3399 	ldw x,#app_space 
      00A333 2F BB 34 82      [ 2] 3400 	addw x,app_size 
      00A334 1C 00 04         [ 2] 3401 	addw x,#4
                                   3402 ; align on 128 bytes block 
      00A334 72 04 00         [ 2] 3403 	addw x,#BLOCK_SIZE 
      00A337 23               [ 1] 3404 	ld a,xl 
      00A338 03 CC            [ 1] 3405 	and a,#0x80 
      00A33A 96               [ 1] 3406 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A33B C7 CD            [ 2] 3407 	jra 2$
      00A33D 9A CF A1         [ 2] 3408 1$:	ldw x,#app_space 
      0029A4                       3409 2$:
      00A340 84               [ 1] 3410 	clr a 
      00A341 27               [ 4] 3411 	ret 
                                   3412 
                                   3413 
                                   3414 ;---------------------
                                   3415 ; BASIC: USR(addr,arg)
                                   3416 ; execute a function written 
                                   3417 ; in binary code.
                                   3418 ; input:
                                   3419 ;   addr	routine address 
                                   3420 ;   arg 	is an argument
                                   3421 ;           it can be ignore 
                                   3422 ;           by cally. 
                                   3423 ; output:
                                   3424 ;   xstack 	value returned by cally  
                                   3425 ;---------------------
      0029A6                       3426 usr:
      00A342 03 CC 96         [ 4] 3427 	call func_args 
      00A345 C7 02            [ 1] 3428 	cp a,#2
      00A346 27 03            [ 1] 3429 	jreq 1$  
      00A346 90 F6 93         [ 2] 3430 	jp syntax_error 
      0029B0                       3431 1$: 
      0029B0                       3432 	_at_next ; A:X addr 
      00A349 EE 01 72         [ 1]    1     ld a,(3,y)
      00A34C A9               [ 1]    2     ldw x,y 
      00A34D 00 03            [ 2]    3     ldw x,(4,x)
      00A34F 6B 03 1F         [ 2] 3433 	ldw ptr16,X 
      0029B9                       3434 	_xpop  ; arg 
      00A352 04 4D            [ 1]    1     ld a,(y)
      00A354 2A               [ 1]    2     ldw x,y 
      00A355 0D 7B            [ 2]    3     ldw x,(1,x)
      00A357 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      0029C2                       3435 	_store_top ; overwrite addr 
      00A35B 00 01            [ 1]    1     ld (y),a 
      00A35D A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A360 06 1F 07 19      [ 6] 3436     call [ptr16]
      00A363 81               [ 4] 3437 	ret 
                                   3438 
                                   3439 
                                   3440 ;------------------------------
                                   3441 ; BASIC: BYE 
                                   3442 ; halt mcu in its lowest power mode 
                                   3443 ; wait for reset or external interrupt
                                   3444 ; do a cold start on wakeup.
                                   3445 ;------------------------------
      0029CC                       3446 bye:
      00A363 CE 00 05 1F 0D   [ 2] 3447 	btjf UART1_SR,#UART_SR_TC,.
      00A368 CE               [10] 3448 	halt
      00A369 00 01 1F         [ 2] 3449 	jp cold_start  
                                   3450 
                                   3451 ;----------------------------------
                                   3452 ; BASIC: SLEEP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3453 ; halt mcu until reset or external
                                   3454 ; interrupt.
                                   3455 ; Resume progam after SLEEP command
                                   3456 ;----------------------------------
      0029D5                       3457 sleep:
      00A36C 0B 72 15 00 23   [ 2] 3458 	btjf UART1_SR,#UART_SR_TC,.
      00A371 72 5C 00 20      [ 1] 3459 	bset flags,#FSLEEP
      00A375 81               [10] 3460 	halt 
      00A376 81               [ 4] 3461 	ret 
                                   3462 
                                   3463 ;-------------------------------
                                   3464 ; BASIC: PAUSE expr 
                                   3465 ; suspend execution for n msec.
                                   3466 ; input:
                                   3467 ;	none
                                   3468 ; output:
                                   3469 ;	none 
                                   3470 ;------------------------------
      0029E0                       3471 pause:
      00A376 72 5D 00         [ 4] 3472 	call expression
      00A379 20 26            [ 1] 3473 	cp a,#TK_INTGR
      00A37B 03 CC            [ 1] 3474 	jreq 1$ 
      00A37D 96 C7 47         [ 2] 3475 	jp syntax_error
      00A37F                       3476 1$: _xpop 
      00A37F A6 85            [ 1]    1     ld a,(y)
      00A381 CD               [ 1]    2     ldw x,y 
      00A382 99 86            [ 2]    3     ldw x,(1,x)
      00A384 CD 97 F6 13      [ 2]    4     addw y,#CELL_SIZE 
      0029F3                       3477 pause02:
      00A388 09 27 03         [ 2] 3478 	ldw timer,x 
      00A38B CC 96 C7         [ 2] 3479 1$: ldw x,timer 
      00A38E 5D               [ 2] 3480 	tnzw x 
      00A38E CF 00            [ 1] 3481 	jreq 2$
      00A390 1A               [10] 3482 	wfi 
      00A391 F6 EE            [ 1] 3483 	jrne 1$
      0029FF                       3484 2$:	
      00A393 01               [ 4] 3485 	ret 
                                   3486 
                                   3487 ;------------------------------
                                   3488 ; BASIC: AWU expr
                                   3489 ; halt mcu for 'expr' milliseconds
                                   3490 ; use Auto wakeup peripheral
                                   3491 ; all oscillators stopped except LSI
                                   3492 ; range: 1ms - 511ms
                                   3493 ; input:
                                   3494 ;  none
                                   3495 ; output:
                                   3496 ;  none:
                                   3497 ;------------------------------
      002A00                       3498 awu:
      00A394 72 FB 04         [ 4] 3499   call expression
      00A397 19 03            [ 1] 3500   cp a,#TK_INTGR
      00A399 72 C7            [ 1] 3501   jreq 1$
      00A39B 00 1A 72         [ 2] 3502   jp syntax_error
      002A0A                       3503 1$: _xpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A39E 5C 00            [ 1]    1     ld a,(y)
      00A3A0 1B               [ 1]    2     ldw x,y 
      00A3A1 72 CF            [ 2]    3     ldw x,(1,x)
      00A3A3 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A13                       3504 awu02:
      00A3A7 0D CF 00         [ 2] 3505   cpw x,#5120
      00A3AA 0E 7B            [ 1] 3506   jrmi 1$ 
      00A3AC 06 1E 07 72      [ 1] 3507   mov AWU_TBR,#15 
      00A3B0 B0 00            [ 1] 3508   ld a,#30
      00A3B2 0E               [ 2] 3509   div x,a
      00A3B3 C2 00            [ 1] 3510   ld a,#16
      00A3B5 0D               [ 2] 3511   div x,a 
      00A3B6 18 03            [ 2] 3512   jra 4$
      002A24                       3513 1$: 
      00A3B8 A8 80 2B         [ 2] 3514   cpw x,#2048
      00A3BB 12 20            [ 1] 3515   jrmi 2$ 
      00A3BD 25 7B 03 2A      [ 1] 3516   mov AWU_TBR,#14
      00A3C1 07 C6            [ 1] 3517   ld a,#80
      00A3C3 00               [ 2] 3518   div x,a 
      00A3C4 0F 2F            [ 2] 3519   jra 4$   
      002A32                       3520 2$:
      00A3C6 07 20 1A F2      [ 1] 3521   mov AWU_TBR,#7
      00A3C9                       3522 3$:  
                                   3523 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3C9 72 0E 00         [ 2] 3524   cpw x,#64 
      00A3CC 0F 15            [ 2] 3525   jrule 4$ 
      00A3CE 72 5C 50 F2      [ 1] 3526   inc AWU_TBR 
      00A3CE 1E               [ 2] 3527   srlw x 
      00A3CF 0D CF            [ 2] 3528   jra 3$ 
      002A42                       3529 4$:
      00A3D1 00               [ 1] 3530   ld a, xl
      00A3D2 05               [ 1] 3531   dec a 
      00A3D3 72 01            [ 1] 3532   jreq 5$
      00A3D5 00               [ 1] 3533   dec a 	
      002A47                       3534 5$: 
      00A3D6 23 05            [ 1] 3535   and a,#0x3e 
      00A3D8 E6 02 C7         [ 1] 3536   ld AWU_APR,a 
      00A3DB 00 04 1E 0B      [ 1] 3537   bset AWU_CSR,#AWU_CSR_AWUEN
      00A3DF CF               [10] 3538   halt 
                                   3539 
      00A3E0 00               [ 4] 3540   ret 
                                   3541 
                                   3542 ;------------------------------
                                   3543 ; BASIC: TICKS
                                   3544 ; return msec ticks counter value 
                                   3545 ; input:
                                   3546 ; 	none 
                                   3547 ; output:
                                   3548 ;	X 		TK_INTGR
                                   3549 ;-------------------------------
      002A52                       3550 get_ticks:
      00A3E1 01 81 0F         [ 1] 3551 	ld a,ticks 
      00A3E3 CE 00 10         [ 2] 3552 	ldw x,ticks+1 
      00A3E3 85               [ 4] 3553 	ret 
                                   3554 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3555 ;------------------------------
                                   3556 ; BASIC: ABS(expr)
                                   3557 ; return absolute value of expr.
                                   3558 ; input:
                                   3559 ;   none
                                   3560 ; output:
                                   3561 ;   xstack    positive int24 
                                   3562 ;-------------------------------
      002A59                       3563 abs:
      00A3E4 5B 0D 72         [ 4] 3564 	call func_args 
      00A3E7 5A 00            [ 1] 3565 	cp a,#1 
      00A3E9 20 FC            [ 1] 3566 	jreq 0$ 
      00A3EB CC 16 47         [ 2] 3567 	jp syntax_error
      002A63                       3568 0$:  
      00A3EB CD 97 CE         [ 4] 3569 	call abs24 
      002A66                       3570 	_xpop 
      00A3EE A1 84            [ 1]    1     ld a,(y)
      00A3F0 27               [ 1]    2     ldw x,y 
      00A3F1 07 A1            [ 2]    3     ldw x,(1,x)
      00A3F3 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A3F7 96               [ 4] 3571 	ret 
                                   3572 
                                   3573 ;------------------------------
                                   3574 ; BASIC: LSHIFT(expr1,expr2)
                                   3575 ; logical shift left expr1 by 
                                   3576 ; expr2 bits 
                                   3577 ; output:
                                   3578 ; 	A 		TK_INTGR
                                   3579 ;   X 		result 
                                   3580 ;------------------------------
      002A70                       3581 lshift:
      00A3F8 C7 19 13         [ 4] 3582 	call func_args
      00A3F9 A1 02            [ 1] 3583 	cp a,#2 
      00A3F9 90 89            [ 1] 3584 	jreq 1$
      00A3FB CD 98 00         [ 2] 3585 	jp syntax_error
      002A7A                       3586 1$: _xpop 
      00A3FE 4F 90            [ 1]    1     ld a,(y)
      00A400 CE               [ 1]    2     ldw x,y 
      00A401 00 05            [ 2]    3     ldw x,(1,x)
      00A403 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A407 13 01            [ 1] 3587     ldw y,x    
      002A85                       3588 	_at_top  ; T@ 
      00A409 5B 02            [ 1]    1     ld a,(y)
      00A40B 25               [ 1]    2     ldw x,y 
      00A40C 01 4C            [ 2]    3     ldw x,(1,x)
      00A40E 90 5D            [ 2] 3589 	tnzw y 
      00A40E CD 8C            [ 1] 3590 	jreq 4$
      00A410 CA               [ 1] 3591 2$:	rcf 
      00A411 5D               [ 2] 3592 	rlcw x 
      00A412 26               [ 1] 3593 	rlc a 
      00A413 05 A6            [ 2] 3594 	decw y 
      00A415 05 CC            [ 1] 3595 	jrne 2$
      002A95                       3596 4$: _store_top  ; T! 
      00A417 96 C9            [ 1]    1     ld (y),a 
      00A419 90 85 81         [ 2]    2     ldw (1,y),x     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A41C A6 84            [ 1] 3597 	ld a,#TK_INTGR
      00A41C 90               [ 4] 3598 	ret
                                   3599 
                                   3600 ;------------------------------
                                   3601 ; BASIC: RSHIFT(expr1,expr2)
                                   3602 ; logical shift right expr1 by 
                                   3603 ; expr2 bits.
                                   3604 ; output:
                                   3605 ; 	A 		TK_INTGR
                                   3606 ;   X 		result 
                                   3607 ;------------------------------
      002A9D                       3608 rshift:
      00A41D 89 89 72         [ 4] 3609 	call func_args
      00A420 5F 00            [ 1] 3610 	cp a,#2 
      00A422 0E 90            [ 1] 3611 	jreq 1$
      00A424 CE 00 1C         [ 2] 3612 	jp syntax_error
      002AA7                       3613 1$: _xpop 
      00A427 90 E6            [ 1]    1     ld a,(y)
      00A429 03               [ 1]    2     ldw x,y 
      00A42A A1 03            [ 2]    3     ldw x,(1,x)
      00A42C 27 15 90 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A430 02 C7            [ 1] 3614     ldw y,x   
      002AB2                       3615 	_at_top  ; T@  
      00A432 00 0F            [ 1]    1     ld a,(y)
      00A434 72               [ 1]    2     ldw x,y 
      00A435 B9 00            [ 2]    3     ldw x,(1,x)
      00A437 0E 90            [ 2] 3616 	tnzw y 
      00A439 C3 00            [ 1] 3617 	jreq 4$
      00A43B 1E               [ 1] 3618 2$:	rcf 
      00A43C 25               [ 2] 3619 	rrcw x
      00A43D E9               [ 1] 3620 	rrc a  
      00A43E A6 0A            [ 2] 3621 	decw y 
      00A440 CC 96            [ 1] 3622 	jrne 2$
      002AC2                       3623 4$: _store_top  ; T! 
      00A442 C9 F7            [ 1]    1     ld (y),a 
      00A443 90 EF 01         [ 2]    2     ldw (1,y),x     
      00A443 90 89            [ 1] 3624 	ld a,#TK_INTGR
      00A445 72               [ 4] 3625 	ret
                                   3626 
                                   3627 ;--------------------------
                                   3628 ; BASIC: FCPU integer
                                   3629 ; set CPU frequency 
                                   3630 ;-------------------------- 
                                   3631 
      002ACA                       3632 fcpu:
      00A446 A9 00            [ 1] 3633 	ld a,#TK_INTGR
      00A448 04 1E 03         [ 4] 3634 	call expect 
      00A44B CD 94 16         [ 4] 3635 	call get_int24 
      00A44E 26               [ 1] 3636 	ld a,xl 
      00A44F 04 90            [ 1] 3637 	and a,#7 
      00A451 85 20 DA         [ 1] 3638 	ld CLK_CKDIVR,a 
      00A454 81               [ 4] 3639 	ret 
                                   3640 
                                   3641 ;------------------------------
                                   3642 ; BASIC: PMODE pin#, mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3643 ; Arduino pin. 
                                   3644 ; define pin as input or output
                                   3645 ; pin#: {0..15}
                                   3646 ; mode: INPUT|OUTPUT  
                                   3647 ;------------------------------
                           000001  3648 	PINNO=1
                           000001  3649 	VSIZE=1
      002AD9                       3650 pin_mode:
      002AD9                       3651 	_vars VSIZE 
      00A454 85 5B            [ 2]    1     sub sp,#VSIZE 
      00A456 02 90 85         [ 4] 3652 	call arg_list 
      00A459 81 02            [ 1] 3653 	cp a,#2 
      00A45A 27 03            [ 1] 3654 	jreq 1$
      00A45A 72 00 00         [ 2] 3655 	jp syntax_error 
      002AE5                       3656 1$: _xpop 
      00A45D 23 05            [ 1]    1     ld a,(y)
      00A45F A6               [ 1]    2     ldw x,y 
      00A460 06 CC            [ 2]    3     ldw x,(1,x)
      00A462 96 C9 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      00A466 CF A1 84         [ 2] 3657 	ldw ptr16,x ; mode 
      002AF1                       3658 	_xpop ; Dx pin 
      00A469 27 03            [ 1]    1     ld a,(y)
      00A46B CC               [ 1]    2     ldw x,y 
      00A46C 96 C7            [ 2]    3     ldw x,(1,x)
      00A46E 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A472 01 72 A9         [ 4] 3659 	call select_pin 
      00A475 00 03            [ 1] 3660 	ld (PINNO,sp),a  
      00A477 9F 27            [ 1] 3661 	ld a,#1 
      00A479 68 88            [ 1] 3662 	tnz (PINNO,sp)
      00A47B CD 97            [ 1] 3663 	jreq 4$
      00A47D CE               [ 1] 3664 2$:	sll a 
      00A47E A1 80            [ 1] 3665 	dec (PINNO,sp)
      00A480 27 03            [ 1] 3666 	jrne 2$ 
      00A482 CC 96            [ 1] 3667 	ld (PINNO,sp),a
      00A484 C7 FE            [ 1] 3668 	ld a,(PINNO,sp)
      00A486 72 5C            [ 1] 3669 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A488 00 02            [ 1] 3670 	ld (GPIO_CR1,x),a 
      00A48A 72 5C            [ 1] 3671 4$:	ld a,#OUTP
      00A48C 00 02 A3         [ 1] 3672 	cp a,acc8 
      00A48F A4 EC            [ 1] 3673 	jreq 6$
                                   3674 ; input mode
                                   3675 ; disable external interrupt 
      00A491 27 08            [ 1] 3676 	ld a,(PINNO,sp)
      00A493 A3               [ 1] 3677 	cpl a 
      00A494 A5 06            [ 1] 3678 	and a,(GPIO_CR2,x)
      00A496 27 03            [ 1] 3679 	ld (GPIO_CR2,x),a 
                                   3680 ;clear bit in DDR for input mode 
      00A498 CC 96            [ 1] 3681 	ld a,(PINNO,sp)
      00A49A C7               [ 1] 3682 	cpl a 
      00A49B E4 02            [ 1] 3683 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A49B 84 89            [ 1] 3684 	ld (GPIO_DDR,x),a 
      00A49D 88 0C            [ 2] 3685 	jra 9$
      00A49E                       3686 6$: ;output mode  
      00A49E 0A 01            [ 1] 3687 	ld a,(PINNO,sp)
      00A4A0 27 26            [ 1] 3688 	or a,(GPIO_DDR,x) ; bit==1 for output 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4A2 CD 97            [ 1] 3689 	ld (GPIO_DDR,x),a 
      00A4A4 CE A1            [ 1] 3690 	ld a,(PINNO,sp)
      00A4A6 84 27            [ 1] 3691 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4A8 07 A1            [ 1] 3692 	ld (GPIO_CR2,x),a 
      002B35                       3693 9$:	
      002B35                       3694 	_drop VSIZE 
      00A4AA 03 27            [ 2]    1     addw sp,#VSIZE 
      00A4AC 0D               [ 4] 3695 	ret
                                   3696 
                                   3697 ;------------------------
                                   3698 ; select Arduino pin 
                                   3699 ; input:
                                   3700 ;   X 	 {0..15} Arduino Dx 
                                   3701 ; output:
                                   3702 ;   A     stm8s208 pin 
                                   3703 ;   X     base address s208 GPIO port 
                                   3704 ;---------------------------
      002B38                       3705 select_pin:
      00A4AD CC               [ 2] 3706 	sllw x 
      00A4AE 96 C7 48         [ 2] 3707 	addw x,#arduino_to_8s208 
      00A4B0 FE               [ 2] 3708 	ldw x,(x)
      00A4B0 C6               [ 1] 3709 	ld a,xl 
      00A4B1 00               [ 1] 3710 	push a 
      00A4B2 02               [ 1] 3711 	swapw x 
      00A4B3 AB 03            [ 1] 3712 	ld a,#5 
      00A4B5 C7               [ 4] 3713 	mul x,a 
      00A4B6 00 02 20         [ 2] 3714 	addw x,#GPIO_BASE 
      00A4B9 03               [ 1] 3715 	pop a 
      00A4BA CD               [ 4] 3716 	ret 
                                   3717 ; translation from Arduino D0..D15 to stm8s208rb 
      002B48                       3718 arduino_to_8s208:
      00A4BB 97 E7                 3719 .byte 3,6 ; D0 
      00A4BD 03 05                 3720 .byte 3,5 ; D1 
      00A4BD CD 97                 3721 .byte 4,0 ; D2 
      00A4BF CE A1                 3722 .byte 2,1 ; D3
      00A4C1 08 27                 3723 .byte 6,0 ; D4
      00A4C3 DA 5B                 3724 .byte 2,2 ; D5
      00A4C5 03 20                 3725 .byte 2,3 ; D6
      00A4C7 1A 01                 3726 .byte 3,1 ; D7
      00A4C8 03 03                 3727 .byte 3,3 ; D8
      00A4C8 5B 01                 3728 .byte 2,4 ; D9
      00A4CA CD A3                 3729 .byte 4,5 ; D10
      00A4CC EB CF                 3730 .byte 2,6 ; D11
      00A4CE 00 1A                 3731 .byte 2,7 ; D12
      00A4D0 55 00                 3732 .byte 2,5 ; D13
      00A4D2 04 00                 3733 .byte 4,2 ; D14
      00A4D4 02 85                 3734 .byte 4,1 ; D15
                                   3735 
                                   3736 
                                   3737 ;------------------------------
                                   3738 ; BASIC: RND(expr)
                                   3739 ; return random number 
                                   3740 ; between 1 and expr inclusive
                                   3741 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3742 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



                                   3743 ; 	none 
                                   3744 ; output:
                                   3745 ;	xstack 	random positive integer 
                                   3746 ;------------------------------
      002B68                       3747 random:
      00A4D6 A3 A4 EC         [ 4] 3748 	call func_args 
      00A4D9 26 05            [ 1] 3749 	cp a,#1
      00A4DB CE 00            [ 1] 3750 	jreq 1$
      00A4DD 1A 20 19         [ 2] 3751 	jp syntax_error
      00A4E0                       3752 1$:  
      002B72                       3753 	_xpop   
      00A4E0 20 35            [ 1]    1     ld a,(y)
      00A4E2 93               [ 1]    2     ldw x,y 
      00A4E2 55 00            [ 2]    3     ldw x,(1,x)
      00A4E4 04 00 02 5B      [ 2]    4     addw y,#CELL_SIZE 
      00A4E8 02               [ 2] 3754 	pushw x 
      00A4E9 CC               [ 1] 3755 	push a  
      00A4EA 97 7A            [ 1] 3756 	ld a,#0x80 
      00A4EC 15 01            [ 1] 3757 	bcp a,(1,sp)
      00A4EC 72 00            [ 1] 3758 	jreq 2$
      00A4EE 00 23            [ 1] 3759 	ld a,#ERR_BAD_VALUE
      00A4F0 05 A6 06         [ 2] 3760 	jp tb_error
      002B88                       3761 2$: 
                                   3762 ; acc16=(x<<5)^x 
      00A4F3 CC 96 C9         [ 2] 3763 	ldw x,seedx 
      00A4F6 58               [ 2] 3764 	sllw x 
      00A4F6 CD               [ 2] 3765 	sllw x 
      00A4F7 A3               [ 2] 3766 	sllw x 
      00A4F8 EB               [ 2] 3767 	sllw x 
      00A4F9 58               [ 2] 3768 	sllw x 
      00A4F9 CF               [ 1] 3769 	ld a,xh 
      00A4FA 00 05 E6         [ 1] 3770 	xor a,seedx 
      00A4FD 02 C7 00         [ 1] 3771 	ld acc16,a 
      00A500 04               [ 1] 3772 	ld a,xl 
      00A501 35 03 00         [ 1] 3773 	xor a,seedx+1 
      00A504 02 81 0E         [ 1] 3774 	ld acc8,a 
                                   3775 ; seedx=seedy 
      00A506 CE 00 16         [ 2] 3776 	ldw x,seedy 
      00A506 72 00 00         [ 2] 3777 	ldw seedx,x  
                                   3778 ; seedy=seedy^(seedy>>1)
      00A509 23 06 A6         [ 2] 3779 	ldw x,seedy 
      00A50C 06               [ 2] 3780 	srlw x 
      00A50D CC               [ 1] 3781 	ld a,xh 
      00A50E 96 C9 81         [ 1] 3782 	xor a,seedy 
      00A511 C7 00 16         [ 1] 3783 	ld seedy,a  
      00A511 CD               [ 1] 3784 	ld a,xl 
      00A512 A3 EB CF         [ 1] 3785 	xor a,seedy+1 
      00A515 00 1A 17         [ 1] 3786 	ld seedy+1,a 
                                   3787 ; acc16>>3 
      00A517 CE 00 0D         [ 2] 3788 	ldw x,acc16 
      00A517 85               [ 2] 3789 	srlw x 
      00A518 52               [ 2] 3790 	srlw x 
      00A519 04               [ 2] 3791 	srlw x 
                                   3792 ; x=acc16^x 
      00A51A 89               [ 1] 3793 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A51B CE 00 1A         [ 1] 3794 	xor a,acc16 
      00A51E 89 CE 00         [ 1] 3795 	ld acc16,a 
      00A521 05               [ 1] 3796 	ld a,xl 
      00A522 1F 05 CE         [ 1] 3797 	xor a,acc8 
      00A525 00 01 1F         [ 1] 3798 	ld acc8,a 
                                   3799 ; seedy=acc16^seedy 
      00A528 07 85 20         [ 1] 3800 	xor a,seedy+1
      00A52B CD               [ 1] 3801 	ld xl,a 
      00A52C C6 00 0D         [ 1] 3802 	ld a,acc16 
      00A52C 72 00 00         [ 1] 3803 	xor a,seedy
      00A52F 23               [ 1] 3804 	ld xh,a 
      00A530 05 A6 06         [ 2] 3805 	ldw seedy,x 
                                   3806 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A533 CC 96 C9         [ 1] 3807 	ld a,seedx+1
      00A536 A4 7F            [ 1] 3808 	and a,#127
      002BDD                       3809 	_xpush 
      00A536 1E 03 CF 00      [ 2]    1     subw y,#CELL_SIZE
      00A53A 05 E6            [ 1]    2     ld (y),a 
      00A53C 02 C7 00         [ 2]    3     ldw (1,y),x 
      00A53F 04               [ 1] 3810 	pop a 
      00A540 1E               [ 2] 3811 	popw x 
      002BE8                       3812 	_xpush 
      00A541 05 CF 00 01      [ 2]    1     subw y,#CELL_SIZE
      00A545 85 5B            [ 1]    2     ld (y),a 
      00A547 04 89 81         [ 2]    3     ldw (1,y),x 
      00A54A CD 03 A1         [ 4] 3813 	call mod24 
      002BF4                       3814 	_xpop
      00A54A 72 01            [ 1]    1     ld a,(y)
      00A54C 00               [ 1]    2     ldw x,y 
      00A54D 23 02            [ 2]    3     ldw x,(1,x)
      00A54F 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A551 1C 00 01         [ 2] 3815 	addw x,#1 
      00A551 72 09            [ 1] 3816 	adc a,#0  
      00A553 00               [ 4] 3817 	ret 
                                   3818 
                                   3819 ;---------------------------------
                                   3820 ; BASIC: WORDS 
                                   3821 ; affiche la listes des mots du
                                   3822 ; dictionnaire ainsi que le nombre
                                   3823 ; de mots.
                                   3824 ;---------------------------------
                           000001  3825 	WLEN=1 ; word length
                           000002  3826 	LLEN=2 ; character sent to console
                           000003  3827 	WCNT=3 ; count words printed 
                           000003  3828 	VSIZE=3 
      002C03                       3829 words:
      00A554 23 12            [ 2] 3830 	pushw y
      002C05                       3831 	_vars VSIZE
      00A556 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A558 CD A0            [ 1] 3832 	clr (LLEN,sp)
      00A55A CF 5B            [ 1] 3833 	clr (WCNT,sp)
      00A55C 04 72 19 00      [ 2] 3834 	ldw y,#kword_dict+2
      00A560 23               [ 1] 3835 0$:	ldw x,y
      00A561 72               [ 1] 3836 	ld a,(x)
      00A562 10 00            [ 1] 3837 	and a,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A564 23 CC            [ 1] 3838 	ld (WLEN,sp),a 
      00A566 97 72            [ 1] 3839 	inc (WCNT,sp)
      00A568 CE               [ 1] 3840 1$:	incw x 
      00A569 00               [ 1] 3841 	ld a,(x)
      00A56A 1C C3 00         [ 4] 3842 	call putc 
      00A56D 1E 2B            [ 1] 3843 	inc (LLEN,sp)
      00A56F 0C AE            [ 1] 3844 	dec (WLEN,sp)
      00A571 96 56            [ 1] 3845 	jrne 1$
      00A573 CD 89            [ 1] 3846 	ld a,#70
      00A575 ED 55            [ 1] 3847 	cp a,(LLEN,sp)
      00A577 00 04            [ 1] 3848 	jrmi 2$   
      00A579 00 02            [ 1] 3849 	ld a,#SPACE 
      00A57B 81 09 10         [ 4] 3850 	call putc 
      00A57C 0C 02            [ 1] 3851 	inc (LLEN,sp) 
      00A57C 5B 02            [ 2] 3852 	jra 3$
      00A57E A6 0D            [ 1] 3853 2$: ld a,#CR 
      00A57E CD 9C AF         [ 4] 3854 	call putc 
      00A581 CD 94            [ 1] 3855 	clr (LLEN,sp)
      00A583 7B 5F CF 00      [ 2] 3856 3$:	subw y,#2 
      00A587 07 72            [ 2] 3857 	ldw y,(y)
      00A589 5F 00            [ 1] 3858 	jrne 0$ 
      00A58B 09 72            [ 1] 3859 	ld a,#CR 
      00A58D 5F 00 0A         [ 4] 3860 	call putc  
      00A590 CE               [ 1] 3861 	clrw x 
      00A591 00 1C            [ 1] 3862 	ld a,(WCNT,sp)
      00A593 CF               [ 1] 3863 	ld xl,a 
      00A594 00 05 E6         [ 4] 3864 	call prt_i16 
      00A597 02 C7 00         [ 2] 3865 	ldw x,#words_count_msg
      00A59A 04 35 03         [ 4] 3866 	call puts 
      002C52                       3867 	_drop VSIZE 
      00A59D 00 02            [ 2]    1     addw sp,#VSIZE 
      00A59F 72 10            [ 2] 3868 	popw y 
      00A5A1 00               [ 4] 3869 	ret 
      00A5A2 23 CC 97 72 64 73 20  3870 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3871 
                                   3872 
                                   3873 ;-----------------------------
                                   3874 ; BASIC: TIMER expr 
                                   3875 ; initialize count down timer 
                                   3876 ;-----------------------------
      00A5A6                       3877 set_timer:
      00A5A6 AE 17 FF         [ 4] 3878 	call arg_list
      00A5A9 94 CC            [ 1] 3879 	cp a,#1 
      00A5AB 97 53            [ 1] 3880 	jreq 1$
      00A5AD CC 16 47         [ 2] 3881 	jp syntax_error
      002C77                       3882 1$: 
      002C77                       3883 	_xpop  
      00A5AD CD 97            [ 1]    1     ld a,(y)
      00A5AF CE               [ 1]    2     ldw x,y 
      00A5B0 A1 85            [ 2]    3     ldw x,(1,x)
      00A5B2 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A5B6 C7 CD 97         [ 2] 3884 	ldw timer,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A5B9 F6               [ 4] 3885 	ret 
                                   3886 
                                   3887 ;------------------------------
                                   3888 ; BASIC: TIMEOUT 
                                   3889 ; return state of timer 
                                   3890 ; output:
                                   3891 ;   A:X     0 not timeout 
                                   3892 ;   A:X     -1 timeout 
                                   3893 ;------------------------------
      002C84                       3894 timeout:
      00A5BA CF               [ 1] 3895 	clr a 
      00A5BB 00 1A CD         [ 2] 3896 	ldw x,timer 
      00A5BE 89 99            [ 1] 3897 	jreq 1$
      00A5C0 27               [ 1] 3898 	clrw x
      00A5C1 03               [ 4] 3899 	ret  
      00A5C2 CD               [ 1] 3900 1$:	cpl a
      00A5C3 89               [ 2] 3901 	cplw x 
      00A5C4 A0               [ 4] 3902 	ret 
                                   3903  	
                                   3904 
                                   3905 
                                   3906 
                                   3907 ;-----------------------------------
                                   3908 ; BASIC: IWDGEN expr1 
                                   3909 ; enable independant watchdog timer
                                   3910 ; expr1 is delay in multiple of 62.5µsec
                                   3911 ; expr1 -> {1..16383}
                                   3912 ;-----------------------------------
      002C8F                       3913 enable_iwdg:
      00A5C5 72 3F 00         [ 4] 3914 	call arg_list
      00A5C8 1A 72            [ 1] 3915 	cp a,#1 
      00A5CA 5C 00            [ 1] 3916 	jreq 1$
      00A5CC 1B 72 3F         [ 2] 3917 	jp syntax_error 
      002C99                       3918 1$: _xpop  
      00A5CF 00 1A            [ 1]    1     ld a,(y)
      00A5D1 72               [ 1]    2     ldw x,y 
      00A5D2 5C 00            [ 2]    3     ldw x,(1,x)
      00A5D4 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5D8 1A 81            [ 1] 3919 	push #0
      00A5DA 35 CC 50 E0      [ 1] 3920 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A5DA 90               [ 1] 3921 	ld a,xh 
      00A5DB 89 AE            [ 1] 3922 	and a,#0x3f
      00A5DD 00               [ 1] 3923 	ld xh,a  
      00A5DE 64 90 AE         [ 2] 3924 2$:	cpw x,#255
      00A5E1 03 E8            [ 2] 3925 	jrule 3$
      00A5E3 20 22            [ 1] 3926 	inc (1,sp)
      00A5E5 98               [ 1] 3927 	rcf 
      00A5E5 90               [ 2] 3928 	rrcw x 
      00A5E6 89 CD            [ 2] 3929 	jra 2$
      00A5E8 99 98 A1 02      [ 1] 3930 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5EC 27               [ 1] 3931 	pop a  
      00A5ED 03 CC 96         [ 1] 3932 	ld IWDG_PR,a 
      00A5F0 C7               [ 1] 3933 	ld a,xl
      00A5F1 4A               [ 1] 3934 	dec a 
      00A5F1 90 F6 93 EE      [ 1] 3935 	mov IWDG_KR,#IWDG_KEY_ACCESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A5F5 01 72 A9         [ 1] 3936 	ld IWDG_RLR,a 
      00A5F8 00 03 89 90      [ 1] 3937 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A5FC F6               [ 4] 3938 	ret 
                                   3939 
                                   3940 
                                   3941 ;-----------------------------------
                                   3942 ; BASIC: IWDGREF  
                                   3943 ; refresh independant watchdog count down 
                                   3944 ; timer before it reset MCU. 
                                   3945 ;-----------------------------------
      002CCD                       3946 refresh_iwdg:
      00A5FD 93 EE 01 72      [ 1] 3947 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A601 A9               [ 4] 3948 	ret 
                                   3949 
                                   3950 
                                   3951 ;-------------------------------------
                                   3952 ; BASIC: LOG2(expr)
                                   3953 ; return logarithm base 2 of expr 
                                   3954 ; this is the position of most significant
                                   3955 ; bit set. 
                                   3956 ; input: 
                                   3957 ; output:
                                   3958 ;   A     TK_INTGR 
                                   3959 ;   xstack log2 
                                   3960 ;*********************************
      002CD2                       3961 log2:
      00A602 00 03 90         [ 4] 3962 	call func_args 
      00A605 93 85            [ 1] 3963 	cp a,#1 
      00A607 27 03            [ 1] 3964 	jreq 1$
      00A607 89 AE F4         [ 2] 3965 	jp syntax_error 
      002CDC                       3966 1$: 
      002CDC                       3967 	_xpop    
      00A60A 24 65            [ 1]    1     ld a,(y)
      00A60C 90               [ 1]    2     ldw x,y 
      00A60D A3 7A            [ 2]    3     ldw x,(1,x)
      00A60F 12 2B 01 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A613 4D               [ 1] 3968 	tnz a
      00A613 9E C7            [ 1] 3969 	jrne 2$ 
      00A615 53               [ 2] 3970 	tnzw x 
      00A616 0D 9F            [ 1] 3971 	jrne 2$
      00A618 C7 53            [ 1] 3972 	ld a,#ERR_BAD_VALUE
      00A61A 0E 8C 56         [ 2] 3973 	jp tb_error 
      00A61D 9E C7            [ 1] 3974 2$: push #24 
      00A61F 53               [ 2] 3975 3$: rlcw x 
      00A620 0F               [ 1] 3976     rlc a 
      00A621 9F C7            [ 1] 3977 	jrc 4$
      00A623 53 10            [ 1] 3978 	dec (1,sp) 
      00A625 72 10            [ 1] 3979 	jrne 3$
      00A627 53               [ 1] 3980 4$: clrw x 
      00A628 08               [ 1] 3981     pop a 
      00A629 72               [ 1] 3982 	dec a
      00A62A 10               [ 1] 3983 	rlwa x  
      002CFE                       3984 9$:	
      00A62B 53               [ 4] 3985 	ret 
                                   3986 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   3987 ;-----------------------------------
                                   3988 ; BASIC: BIT(expr) 
                                   3989 ; expr ->{0..23}
                                   3990 ; return 2^expr 
                                   3991 ; output:
                                   3992 ;    A:X    2^expr 
                                   3993 ;-----------------------------------
      002CFF                       3994 bitmask:
      00A62C 00 72 10         [ 4] 3995     call func_args 
      00A62F 53 04            [ 1] 3996 	cp a,#1
      00A631 85 CD            [ 1] 3997 	jreq 1$
      00A633 AA 73 72         [ 2] 3998 	jp syntax_error 
      002D09                       3999 1$: _xpop 
      00A636 11 53            [ 1]    1     ld a,(y)
      00A638 08               [ 1]    2     ldw x,y 
      00A639 72 11            [ 2]    3     ldw x,(1,x)
      00A63B 53 00 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00A63F 81               [ 1] 4000 	ld a,xl 
      00A640 AE 00 01         [ 2] 4001 	ldw x,#1 
      00A640 CD 99            [ 1] 4002 	and a,#23
      00A642 98 A1            [ 1] 4003 	jreq 9$
      00A644 02               [ 1] 4004 	push a 
      00A645 27               [ 1] 4005 	clr a 
      002D1C                       4006 2$: 
      00A646 12               [ 2] 4007 	slaw x 
      00A647 A1               [ 1] 4008 	rlc a 	
      00A648 01 27            [ 1] 4009 	dec (1,sp)
      00A64A 03 CC            [ 1] 4010 	jrne 2$ 
      002D22                       4011 4$:
      002D22                       4012     _drop 1 
      00A64C 96 C7            [ 2]    1     addw sp,#1 
      00A64E 4F               [ 4] 4013 9$:	ret 
                                   4014 
                                   4015 ;------------------------------
                                   4016 ; BASIC: DO 
                                   4017 ; initiate a DO ... UNTIL loop 
                                   4018 ;------------------------------
                           000003  4019 	DOLP_ADR=3 
                           000005  4020 	DOLP_INW=5
                           000004  4021 	VSIZE=4 
      002D25                       4022 do_loop:
      00A64F 5F               [ 2] 4023 	popw x 
      002D26                       4024 	_vars VSIZE 
      00A650 72 A2            [ 2]    1     sub sp,#VSIZE 
      00A652 00               [ 2] 4025 	pushw x 
      00A653 03 90 F7         [ 2] 4026 	ldw x,basicptr 
      00A656 90 EF            [ 2] 4027 	ldw (DOLP_ADR,sp),x
      00A658 01 90 E6         [ 2] 4028 	ldw x,in.w 
      00A65B 03 93            [ 2] 4029 	ldw (DOLP_INW,sp),x
      00A65D EE 04 5D 27      [ 1] 4030 	inc loop_depth 
      00A661 25               [ 4] 4031 	ret 
                                   4032 
                                   4033 ;--------------------------------
                                   4034 ; BASIC: UNTIL expr 
                                   4035 ; loop if exprssion is false 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4036 ; else terminate loop
                                   4037 ;--------------------------------
      002D38                       4038 until: 
      00A662 90 F6 93 EE      [ 1] 4039 	tnz loop_depth 
      00A666 01 72            [ 1] 4040 	jrne 1$ 
      00A668 A9 00 03         [ 2] 4041 	jp syntax_error 
      002D41                       4042 1$: 
      00A66B 72 A9 00         [ 4] 4043 	call condition  
      002D44                       4044 	_xpop 
      00A66E 03 9F            [ 1]    1     ld a,(y)
      00A670 A4               [ 1]    2     ldw x,y 
      00A671 07 4E            [ 2]    3     ldw x,(1,x)
      00A673 C7 54 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A677 16               [ 1] 4045 	tnz a 
      00A678 50 CA            [ 1] 4046 	jrne 9$ 
      00A67A 72               [ 2] 4047 	tnzw x 
      00A67B 10 54            [ 1] 4048 	jrne 9$ 
      00A67D 01 AE            [ 2] 4049 	ldw x,(DOLP_ADR,sp)
      00A67F 00 1B 5A         [ 2] 4050 	ldw basicptr,x 
      00A682 9D 26            [ 1] 4051 	ld a,(2,x)
      00A684 FA 20 08         [ 1] 4052 	ld count,a 
      00A687 72 11            [ 2] 4053 	ldw x,(DOLP_INW,sp)
      00A689 54 01 72         [ 2] 4054 	ldw in.w,x 
      00A68C 17               [ 4] 4055 	ret 
      002D63                       4056 9$:	; remove loop data from stack  
      00A68D 50               [ 2] 4057 	popw x
      002D64                       4058 	_drop VSIZE
      00A68E CA 04            [ 2]    1     addw sp,#VSIZE 
      00A68F 72 5A 00 1F      [ 1] 4059 	dec loop_depth 
      00A68F 81               [ 2] 4060 	jp (x)
                                   4061 
                                   4062 ;--------------------------
                                   4063 ; BASIC: PORTA...PORTI  
                                   4064 ;  return constant value 
                                   4065 ;  PORT  base address 
                                   4066 ;---------------------------
      00A690                       4067 const_porta:
      00A690 CD 99 93         [ 2] 4068 	ldw x,#PA_BASE 
      00A693 A1               [ 1] 4069 	clr a 
      00A694 01               [ 4] 4070 	ret 
      002D70                       4071 const_portb:
      00A695 27 03 CC         [ 2] 4072 	ldw x,#PB_BASE 
      00A698 96               [ 1] 4073 	clr a 
      00A699 C7               [ 4] 4074 	ret 
      002D75                       4075 const_portc:
      00A69A 90 F6 93         [ 2] 4076 	ldw x,#PC_BASE 
      00A69D EE               [ 1] 4077 	clr a 
      00A69E 01               [ 4] 4078 	ret 
      002D7A                       4079 const_portd:
      00A69F 72 A9 00         [ 2] 4080 	ldw x,#PD_BASE 
      00A6A2 03               [ 1] 4081 	clr a 
      00A6A3 A3               [ 4] 4082 	ret 
      002D7F                       4083 const_porte:
      00A6A4 00 05 23         [ 2] 4084 	ldw x,#PE_BASE 
      00A6A7 05               [ 1] 4085 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A6A8 A6               [ 4] 4086 	ret 
      002D84                       4087 const_portf:
      00A6A9 0A CC 96         [ 2] 4088 	ldw x,#PF_BASE 
      00A6AC C9               [ 1] 4089 	clr a 
      00A6AD 9F               [ 4] 4090 	ret 
      002D89                       4091 const_portg:
      00A6AE C7 00 0F         [ 2] 4092 	ldw x,#PG_BASE 
      00A6B1 A6               [ 1] 4093 	clr a 
      00A6B2 05               [ 4] 4094 	ret 
      002D8E                       4095 const_porth:
      00A6B3 C0 00 0F         [ 2] 4096 	ldw x,#PH_BASE 
      00A6B6 C7               [ 1] 4097 	clr a 
      00A6B7 54               [ 4] 4098 	ret 
      002D93                       4099 const_porti:
      00A6B8 00 72 16         [ 2] 4100 	ldw x,#PI_BASE 
      00A6BB 54               [ 1] 4101 	clr a 
      00A6BC 02               [ 4] 4102 	ret 
                                   4103 
                                   4104 ;-------------------------------
                                   4105 ; following return constant 
                                   4106 ; related to GPIO register offset 
                                   4107 ;---------------------------------
      002D98                       4108 const_odr:
      00A6BD 72               [ 1] 4109 	clr a 
      00A6BE 10 54 01         [ 2] 4110 	ldw x,#GPIO_ODR
      00A6C1 72               [ 4] 4111 	ret 
      002D9D                       4112 const_idr:
      00A6C2 0F               [ 1] 4113 	clr a 
      00A6C3 54 00 FB         [ 2] 4114 	ldw x,#GPIO_IDR
      00A6C6 CE               [ 4] 4115 	ret 
      002DA2                       4116 const_ddr:
      00A6C7 54               [ 1] 4117 	clr a
      00A6C8 04 A6 84         [ 2] 4118 	ldw x,#GPIO_DDR
      00A6CB 81               [ 4] 4119 	ret 
      00A6CC                       4120 const_cr1:
      00A6CC 52               [ 1] 4121 	clr a 
      00A6CD 01 CD 99         [ 2] 4122 	ldw x,#GPIO_CR1
      00A6D0 93               [ 4] 4123 	ret 
      002DAC                       4124 const_cr2:
      00A6D1 A1               [ 1] 4125 	clr a
      00A6D2 01 27 03         [ 2] 4126 	ldw x,#GPIO_CR2
      00A6D5 CC               [ 4] 4127 	ret 
                                   4128 ;-------------------------
                                   4129 ; BASIC: POUT 
                                   4130 ;  constant for port mode
                                   4131 ;  used by PMODE 
                                   4132 ;  to set pin as output
                                   4133 ;------------------------
      002DB1                       4134 const_output:
      00A6D6 96               [ 1] 4135 	clr a 
      00A6D7 C7 90 F6         [ 2] 4136 	ldw x,#OUTP
      00A6DA 93               [ 4] 4137 	ret 
                                   4138 
                                   4139 ;-------------------------
                                   4140 ; BASIC: PINP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4141 ;  constant for port mode
                                   4142 ;  used by PMODE 
                                   4143 ;  to set pin as input
                                   4144 ;------------------------
      002DB6                       4145 const_input:
      00A6DB EE               [ 1] 4146 	clr a  
      00A6DC 01 72 A9         [ 2] 4147 	ldw x,#INP 
      00A6DF 00               [ 4] 4148 	ret 
                                   4149 	
                                   4150 ;-----------------------
                                   4151 ; memory area constants
                                   4152 ;-----------------------
      002DBB                       4153 const_eeprom_base:
      00A6E0 03               [ 1] 4154 	clr a  
      00A6E1 A3 00 0F         [ 2] 4155 	ldw x,#EEPROM_BASE 
      00A6E4 23               [ 4] 4156 	ret 
                                   4157 
                                   4158 ;---------------------------
                                   4159 ; BASIC: DATA 
                                   4160 ; when the interpreter find 
                                   4161 ; a DATA line it skip it.
                                   4162 ;---------------------------
      002DC0                       4163 data:
      00A6E5 05 A6 0A CC 96   [ 1] 4164 	mov in,count 
      00A6EA C9               [ 4] 4165 	ret 
                                   4166 
                                   4167 ;------------------------------
                                   4168 ; check if it is a DATA line 
                                   4169 ; input: 
                                   4170 ;    X    line address 
                                   4171 ; output:
                                   4172 ;    Z    set if DATA line 
                                   4173 ;----------------------------
      002DC6                       4174 is_data_line:
      00A6EB CD               [ 2] 4175 	pushw x 
      00A6EC AB B8            [ 1] 4176 	ld a,(3,x)
      00A6EE 6B 01            [ 1] 4177 	cp a,#TK_CMD 
      00A6F0 E6 01            [ 1] 4178 	jrne 9$
      00A6F2 0D 01            [ 2] 4179 	ldw x,(4,x)
      00A6F4 27 05 44         [ 2] 4180 	cpw x,#data  
      00A6F7 0A               [ 2] 4181 9$: popw x 
      00A6F8 01               [ 4] 4182 	ret 
                                   4183 
                                   4184 ;---------------------------------
                                   4185 ; BASIC: RESTORE [line#]
                                   4186 ; set data_ptr to first data line
                                   4187 ; if no DATA found pointer set to
                                   4188 ; zero.
                                   4189 ; if a line# is given as argument 
                                   4190 ; a data line with that number 
                                   4191 ; is searched and the data pointer 
                                   4192 ; is set to it. If there is no 
                                   4193 ; data line with that number 
                                   4194 ; the program is interrupted. 
                                   4195 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      002DD4                       4196 restore:
      00A6F9 26               [ 1] 4197 	clrw x 
      00A6FA FB A4 01         [ 2] 4198 	ldw data_ptr,x 
      00A6FD 5F 97 4F         [ 2] 4199 	ldw data_ofs,x 
      00A700 5B 01 81         [ 2] 4200 	ldw x,txtbgn 
      00A703 CD 17 4E         [ 4] 4201 	call next_token 
      00A703 52 02            [ 1] 4202 	cp a,#TK_INTGR
      00A705 CD 99            [ 1] 4203 	jrne 0$
      00A707 98 A1 02         [ 4] 4204 	call get_int24
      00A70A 27 03            [ 2] 4205 	pushw y 
      00A70C CC               [ 1] 4206 	clr a 
      00A70D 96 C7 90         [ 4] 4207 	call search_lineno  
      00A710 F6 93            [ 2] 4208 	popw y 
      00A712 EE               [ 2] 4209 	tnzw x 
      00A713 01 72            [ 1] 4210 	jrne set_data_pointer 
      00A715 A9 00            [ 2] 4211 	jra data_error 
      002DF5                       4212 0$:
      002DF5                       4213 	_unget_token  
      00A717 03 9F 6B 02 90   [ 1]    1      mov in,in.saved  
                                   4214 ; search first DATA line 	
      00A71C F6 93 EE         [ 2] 4215 1$:	cpw x,txtend
      00A71F 01 72            [ 1] 4216 	jruge data_error 
      002DFF                       4217 2$:	
      00A721 A9 00 03         [ 4] 4218 	call is_data_line 
      00A724 A3 00            [ 1] 4219 	jrne 4$
      00A726 0F 23 05         [ 4] 4220 4$:	call try_next_line 
      00A729 A6 0A            [ 1] 4221 	jrne 4$ 
      00A72B CC               [ 4] 4222 	ret 
                                   4223 
                                   4224 ;---------------------
                                   4225 ; set data pointer 
                                   4226 ; variables at new line 
                                   4227 ; input:
                                   4228 ;    X    line address 
                                   4229 ;----------------------
      002E0A                       4230 set_data_pointer:
      00A72C 96 C9 CD         [ 2] 4231 	ldw data_ptr,x
      00A72F AB B8            [ 1] 4232 	ld a,(2,x)
      00A731 6B 01 A6         [ 1] 4233 	ld data_len,a 
      00A734 01 0D 01 27      [ 1] 4234 	mov data_ofs,#FIRST_DATA_ITEM
      00A738 05               [ 4] 4235 	ret 
                                   4236 
                                   4237 
                                   4238 ;--------------------
                                   4239 ; at end of data line 
                                   4240 ; check if next line 
                                   4241 ; is a data line 
                                   4242 ; input:
                                   4243 ;    X   actual line address 
                                   4244 ;  
                                   4245 ;-------------------
      002E17                       4246 try_next_line: 
      00A739 48 0A            [ 1] 4247 	ld a,(2,x)
      00A73B 01 26 FB         [ 1] 4248 	ld acc8,a 
      00A73E 0D 02 26 05      [ 1] 4249 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A742 43 E4 00 20      [ 2] 4250 	addw x,acc16 
      00A746 02 EA 00         [ 2] 4251 	cpw x,txtend 
      00A749 E7 00            [ 1] 4252 	jrult 1$
      00A74B 5B 02            [ 2] 4253 	jra data_error 
      002E2B                       4254 1$:	
      00A74D 81 2D C6         [ 4] 4255 	call is_data_line 
      00A74E 27 04            [ 1] 4256 	jreq 2$
      00A74E 72 00            [ 1] 4257 	ld a,#1  
      00A750 00 23            [ 2] 4258 	jra 9$
      00A752 02 4F 81         [ 4] 4259 2$:	call set_data_pointer
      00A755 4F               [ 1] 4260 	clr a  
      00A755 AE               [ 4] 4261 9$:	ret 
      002E39                       4262 data_error:	
      00A756 A7 7C            [ 1] 4263     ld a,#ERR_NO_DATA 
      00A758 CD 89 ED         [ 2] 4264 	jp tb_error 
                                   4265 
                                   4266 
                                   4267 ;---------------------------------
                                   4268 ; BASIC: READ 
                                   4269 ; return next data item | 0 
                                   4270 ;---------------------------------
                           000001  4271 	CTX_BPTR=1 
                           000003  4272 	CTX_IN=3 
                           000004  4273 	CTX_COUNT=4 
                           000005  4274 	INT24=5
                           000007  4275 	VSIZE=7 
      002E3E                       4276 read:
      002E3E                       4277 	_vars  VSIZE 
      00A75B 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A75D 52 04 CD         [ 4] 4278 	call save_context
      002E43                       4279 read01:	
      00A760 A0 BF AE         [ 1] 4280 	ld a,data_ofs
      00A763 16 68 CF         [ 1] 4281 	cp a,data_len 
      00A766 00 05            [ 1] 4282 	jreq 2$ ; end of line  
      002E4B                       4283 0$:
      00A768 7F 72 5F         [ 2] 4284 	ldw x,data_ptr 
      00A76B 00 04 5F         [ 2] 4285 	ldw basicptr,x 
      00A76E CF 00 01 72 11   [ 1] 4286 	mov in,data_ofs 
      00A773 00 23 72 18 00   [ 1] 4287 	mov count,data_len  
      00A778 23 CC 97         [ 4] 4288 	call expression 
      00A77B 72 0A            [ 1] 4289 	cp a,#TK_INTGR 
      00A77D 62 72            [ 1] 4290 	jreq 1$ 
      00A77F 65 61 6B         [ 2] 4291 	jp syntax_error 
      002E65                       4292 1$:
      00A782 20 70 6F         [ 4] 4293 	call next_token ; skip comma
      00A785 69 6E 74         [ 2] 4294 	ldw x,basicptr 
      00A788 2C 20 52         [ 2] 4295 	ldw data_ptr,x 
      00A78B 55 4E 20 74 6F   [ 1] 4296 	mov data_ofs,in 
      00A790 20 72 65         [ 4] 4297 	call rest_context
      002E76                       4298 	_xpop 
      00A793 73 75            [ 1]    1     ld a,(y)
      00A795 6D               [ 1]    2     ldw x,y 
      00A796 65 2E            [ 2]    3     ldw x,(1,x)
      00A798 0A 00 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A79A                       4299 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A79A 72 01            [ 2]    1     addw sp,#VSIZE 
      00A79C 00               [ 4] 4300 	ret 
      002E82                       4301 2$: ; end of line reached 
                                   4302 	; try next line 
      00A79D 23 01 81         [ 2] 4303 	ldw x,data_ptr  
      00A7A0 CD 2E 17         [ 4] 4304 	call try_next_line
      00A7A0 CD 95            [ 1] 4305 	jreq 0$ 
      00A7A2 23 81            [ 2] 4306 	jra data_error 
                                   4307 
                                   4308 ;---------------------------------
                                   4309 ; BASIC: SPIEN clkdiv, 0|1  
                                   4310 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4311 ; if clkdiv==-1 disable SPI
                                   4312 ; 0|1 -> disable|enable  
                                   4313 ;--------------------------------- 
                           000005  4314 SPI_CS_BIT=5
      00A7A4                       4315 spi_enable:
      00A7A4 72 5F 00         [ 4] 4316 	call arg_list 
      00A7A7 19 52            [ 1] 4317 	cp a,#2
      00A7A9 03 CD            [ 1] 4318 	jreq 1$
      00A7AB 97 CE A1         [ 2] 4319 	jp syntax_error 
      002E96                       4320 1$: 
      00A7AE 04 27 03 CC      [ 1] 4321 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7B2 96               [ 2] 4322 	popw x  
      00A7B3 C7               [ 2] 4323 	tnzw x 
      00A7B4 CD 98            [ 1] 4324 	jreq spi_disable 
      00A7B6 10               [ 2] 4325 	popw x 
      00A7B7 A4 DF            [ 1] 4326 	ld a,#(1<<SPI_CR1_BR)
      00A7B9 A1               [ 4] 4327 	mul x,a 
      00A7BA 45               [ 1] 4328 	ld a,xl 
      00A7BB 26 0C AE         [ 1] 4329 	ld SPI_CR1,a 
                                   4330 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7BE 40 00 CF 00      [ 1] 4331 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7C2 1A AE 47 FF      [ 1] 4332 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4333 ; configure SPI as master mode 0.	
      00A7C6 4F 20 15 A1      [ 1] 4334 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4335 ; ~CS line controlled by sofware 	
      00A7CA 46 27 06 AE      [ 1] 4336 	bset SPI_CR2,#SPI_CR2_SSM 
      00A7CE 96 07 CC 96      [ 1] 4337     bset SPI_CR2,#SPI_CR2_SSI 
                                   4338 ; enable SPI
      00A7D2 C9 1C 52 00      [ 1] 4339 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A7D3 81               [ 4] 4340 	ret 
      002EBF                       4341 spi_disable:
      002EBF                       4342 	_drop #2; throw first argument.
      00A7D3 AE B5            [ 2]    1     addw sp,##2 
                                   4343 ; wait spi idle 
      00A7D5 00 CF            [ 1] 4344 1$:	ld a,#0x82 
      00A7D7 00 1A A6         [ 1] 4345 	and a,SPI_SR
      00A7DA 02 AE            [ 1] 4346 	cp a,#2 
      00A7DC 7F FF            [ 1] 4347 	jrne 1$
      00A7DE 72 1D 52 00      [ 1] 4348 	bres SPI_CR1,#SPI_CR1_SPE
      00A7DE 6B 01 1F 02      [ 1] 4349 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A7E2 CD 87 8E 16      [ 1] 4350 	bres PE_DDR,#SPI_CS_BIT 
      00A7E5 81               [ 4] 4351 	ret 
                                   4352 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      002ED7                       4353 spi_clear_error:
      00A7E5 CD 89            [ 1] 4354 	ld a,#0x78 
      00A7E7 10 27 08         [ 1] 4355 	bcp a,SPI_SR 
      00A7EA A6 45            [ 1] 4356 	jreq 1$
      00A7EC CD 89 90 CD      [ 1] 4357 	clr SPI_SR 
      00A7F0 88               [ 4] 4358 1$: ret 
                                   4359 
      002EE3                       4360 spi_send_byte:
      00A7F1 0C               [ 1] 4361 	push a 
      00A7F2 AE 00 80         [ 4] 4362 	call spi_clear_error
      00A7F5 CD               [ 1] 4363 	pop a 
      00A7F6 89 02 7B 01 1E   [ 2] 4364 	btjf SPI_SR,#SPI_SR_TXE,.
      00A7FB 02 72 B0         [ 1] 4365 	ld SPI_DR,a
      00A7FE 00 1A C2 00 19   [ 2] 4366 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A803 22 E0 CD         [ 1] 4367 	ld a,SPI_DR 
      00A806 95               [ 4] 4368 	ret 
                                   4369 
      002EF9                       4370 spi_rcv_byte:
      00A807 23 1E            [ 1] 4371 	ld a,#255
      00A809 02 A3 47 FF 26   [ 2] 4372 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A80E 03 CD 9D         [ 1] 4373 	ld a,SPI_DR 
      00A811 78               [ 4] 4374 	ret
                                   4375 
                                   4376 ;------------------------------
                                   4377 ; BASIC: SPIWR byte [,byte]
                                   4378 ; write 1 or more byte
                                   4379 ;------------------------------
      00A812                       4380 spi_write:
      00A812 5B 03 81         [ 4] 4381 	call expression
      00A815 A1 84            [ 1] 4382 	cp a,#TK_INTGR 
      00A815 CE B5            [ 1] 4383 	jreq 1$
      00A817 00 C3 A8         [ 2] 4384 	jp syntax_error 
      002F0E                       4385 1$:	
      00A81A D5               [ 1] 4386 	ld a,xl 
      00A81B 81 2E E3         [ 4] 4387 	call spi_send_byte 
      00A81C CD 17 4E         [ 4] 4388 	call next_token 
      00A81C 88 4D            [ 1] 4389 	cp a,#TK_COMMA 
      00A81E 27 0A            [ 1] 4390 	jrne 2$ 
      00A820 F6 5C            [ 2] 4391 	jra spi_write 
      00A822 90               [ 1] 4392 2$:	tnz a 
      00A823 F7 90            [ 1] 4393 	jreq 3$
      002F1E                       4394 	_unget_token  
      00A825 5C 0A 01 26 F6   [ 1]    1      mov in,in.saved  
      00A82A 84               [ 4] 4395 3$:	ret 
                                   4396 
                                   4397 
                                   4398 ;-------------------------------
                                   4399 ; BASIC: SPIRD 	
                                   4400 ; read one byte from SPI 
                                   4401 ;-------------------------------
      002F24                       4402 spi_read:
      00A82B 81 2E F9         [ 4] 4403 	call spi_rcv_byte 
      00A82C 5F               [ 1] 4404 	clrw x 
      00A82C 88               [ 1] 4405 	ld xl,a 
      00A82D 90               [ 1] 4406 	clr a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A82E AE               [ 4] 4407 	ret 
                                   4408 
                                   4409 ;------------------------------
                                   4410 ; BASIC: SPISEL 0|1 
                                   4411 ; set state of ~CS line
                                   4412 ; 0|1 deselect|select  
                                   4413 ;------------------------------
      002F2B                       4414 spi_select:
      00A82F 16 B8 90         [ 4] 4415 	call next_token 
      00A832 89 A6            [ 1] 4416 	cp a,#TK_INTGR 
      00A834 80 90            [ 1] 4417 	jreq 1$
      00A836 7F 90 5C         [ 2] 4418 	jp syntax_error 
      00A839 4A               [ 2] 4419 1$: tnzw x  
      00A83A 26 F9            [ 1] 4420 	jreq cs_high 
      00A83C 90 85 84 81      [ 1] 4421 	bres PE_ODR,#SPI_CS_BIT
      00A840 81               [ 4] 4422 	ret 
      002F3D                       4423 cs_high: 
      00A840 89 90 89 52      [ 1] 4424 	bset PE_ODR,#SPI_CS_BIT
      00A844 06               [ 4] 4425 	ret 
                                   4426 
                                   4427 ;-------------------------------
                                   4428 ; BASIC: PAD 
                                   4429 ; Return pad buffer address.
                                   4430 ;------------------------------
      002F42                       4431 pad_ref:
      00A845 CD A8 15         [ 2] 4432 	ldw x,#pad 
      00A848 26               [ 1] 4433 	clr a
      00A849 09               [ 4] 4434 	ret 
                                   4435 
                                   4436 
                                   4437 ;------------------------------
                                   4438 ;      dictionary 
                                   4439 ; format:
                                   4440 ;   link:   2 bytes 
                                   4441 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4442 ;   cmd_name: 16 byte max 
                                   4443 ;   code_addr: 2 bytes 
                                   4444 ;------------------------------
                                   4445 	.macro _dict_entry len,name,code_addr 
                                   4446 	.word LINK 
                                   4447 	LINK=.
                                   4448 name:
                                   4449 	.byte len   	
                                   4450 	.ascii "name"
                                   4451 	.word code_addr  
                                   4452 	.endm 
                                   4453 
                           000000  4454 	LINK=0
                                   4455 ; respect alphabetic order for BASIC names from Z-A
                                   4456 ; this sort order is for a cleaner WORDS cmd output. 	
      002F47                       4457 kword_end:
      002F47                       4458 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00A84A AE A8                    1 	.word LINK 
                           002F49     2 	LINK=.
      002F49                          3 XOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A84C D7                       4 	.byte 3+F_XOR   	
      00A84D CD 89 ED                 5 	.ascii "XOR"
      00A850 CC A8                    6 	.word TK_XOR  
      002F4F                       4459 	_dict_entry,5,WRITE,write  
      00A852 CF 49                    1 	.word LINK 
                           002F51     2 	LINK=.
      00A853                          3 WRITE:
      00A853 CE                       4 	.byte 5   	
      00A854 00 1C C3 00 1E           5 	.ascii "WRITE"
      00A859 25 09                    6 	.word write  
      002F59                       4460 	_dict_entry,5,WORDS,words 
      00A85B AE A9                    1 	.word LINK 
                           002F5B     2 	LINK=.
      002F5B                          3 WORDS:
      00A85D 19                       4 	.byte 5   	
      00A85E CD 89 ED CC A8           5 	.ascii "WORDS"
      00A863 CF 03                    6 	.word words  
      00A864                       4461 	_dict_entry 4,WAIT,wait 
      00A864 CD 87                    1 	.word LINK 
                           002F65     2 	LINK=.
      002F65                          3 WAIT:
      00A866 CE                       4 	.byte 4   	
      00A867 72 5F 00 19              5 	.ascii "WAIT"
      00A86B AE B5                    6 	.word wait  
      002F6C                       4462 	_dict_entry,3+F_IFUNC,USR,usr
      00A86D 00 CF                    1 	.word LINK 
                           002F6E     2 	LINK=.
      002F6E                          3 USR:
      00A86F 00                       4 	.byte 3+F_IFUNC   	
      00A870 1A CD 9E                 5 	.ascii "USR"
      00A873 98 1F                    6 	.word usr  
      002F74                       4463 	_dict_entry,5,UNTIL,until 
      00A875 05 0F                    1 	.word LINK 
                           002F76     2 	LINK=.
      002F76                          3 UNTIL:
      00A877 03                       4 	.byte 5   	
      00A878 CD A8 2C CE A8           5 	.ascii "UNTIL"
      00A87D D5 90                    6 	.word until  
      002F7E                       4464 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A87F FF 72                    1 	.word LINK 
                           002F80     2 	LINK=.
      002F80                          3 UFLASH:
      00A881 A9                       4 	.byte 6+F_IFUNC   	
      00A882 00 02 1E 05 90 FF        5 	.ascii "UFLASH"
      00A888 72 A9                    6 	.word uflash  
      002F89                       4465 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00A88A 00 02                    1 	.word LINK 
                           002F8B     2 	LINK=.
      002F8B                          3 UBOUND:
      00A88C A6                       4 	.byte 6+F_IFUNC   	
      00A88D 7C 6B 04 A3 00 7C        5 	.ascii "UBOUND"
      00A893 22 01                    6 	.word ubound  
      002F94                       4466 	_dict_entry,4,TONE,tone  
      00A895 9F 6B                    1 	.word LINK 
                           002F96     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      002F96                          3 TONE:
      00A897 04                       4 	.byte 4   	
      00A898 CE 00 1C 1F              5 	.ascii "TONE"
      00A89C 01 65                    6 	.word tone  
      00A89D                       4467 	_dict_entry,2,TO,to
      00A89D 1E 01                    1 	.word LINK 
                           002F9F     2 	LINK=.
      002F9F                          3 TO:
      00A89F 7B                       4 	.byte 2   	
      00A8A0 04 CD                    5 	.ascii "TO"
      00A8A2 A8 1C                    6 	.word to  
      002FA4                       4468 	_dict_entry,5,TIMER,set_timer
      00A8A4 1F 01                    1 	.word LINK 
                           002FA6     2 	LINK=.
      002FA6                          3 TIMER:
      00A8A6 AE                       4 	.byte 5   	
      00A8A7 16 B8 CD 87 E8           5 	.ascii "TIMER"
      00A8AC AE 00                    6 	.word set_timer  
      002FAE                       4469 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A8AE 80 CD                    1 	.word LINK 
                           002FB0     2 	LINK=.
      002FB0                          3 TIMEOUT:
      00A8B0 89                       4 	.byte 7+F_IFUNC   	
      00A8B1 02 1E 01 C3 00 1E 24     5 	.ascii "TIMEOUT"
      00A8B8 16 1E                    6 	.word timeout  
      002FBA                       4470 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A8BA 05 72                    1 	.word LINK 
                           002FBC     2 	LINK=.
      002FBC                          3 TICKS:
      00A8BC F0                       4 	.byte 5+F_IFUNC   	
      00A8BD 03 1F 05 A6 80           5 	.ascii "TICKS"
      00A8C2 A3 00                    6 	.word get_ticks  
      002FC4                       4471 	_dict_entry,4,STOP,stop 
      00A8C4 80 24                    1 	.word LINK 
                           002FC6     2 	LINK=.
      002FC6                          3 STOP:
      00A8C6 01                       4 	.byte 4   	
      00A8C7 9F 6B 04 CD              5 	.ascii "STOP"
      00A8CB A8 2C                    6 	.word stop  
      002FCD                       4472 	_dict_entry,4,STEP,step 
      00A8CD 20 CE                    1 	.word LINK 
                           002FCF     2 	LINK=.
      002FCF                          3 STEP:
      00A8CF 5B                       4 	.byte 4   	
      00A8D0 06 90 85 85              5 	.ascii "STEP"
      00A8D4 81 42                    6 	.word step  
      002FD6                       4473 	_dict_entry,5,SPIWR,spi_write
      00A8D6 43 43                    1 	.word LINK 
                           002FD8     2 	LINK=.
      002FD8                          3 SPIWR:
      00A8D8 61                       4 	.byte 5   	
      00A8D9 6E 27 74 20 66           5 	.ascii "SPIWR"
      00A8DE 6C 61                    6 	.word spi_write  
      002FE0                       4474 	_dict_entry,6,SPISEL,spi_select
      00A8E0 73 68                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



                           002FE2     2 	LINK=.
      002FE2                          3 SPISEL:
      00A8E2 20                       4 	.byte 6   	
      00A8E3 61 70 70 6C 69 63        5 	.ascii "SPISEL"
      00A8E9 61 74                    6 	.word spi_select  
      002FEB                       4475 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00A8EB 69 6F                    1 	.word LINK 
                           002FED     2 	LINK=.
      002FED                          3 SPIRD:
      00A8ED 6E                       4 	.byte 5+F_IFUNC   	
      00A8EE 2C 20 61 6C 72           5 	.ascii "SPIRD"
      00A8F3 65 61                    6 	.word spi_read  
      002FF5                       4476 	_dict_entry,5,SPIEN,spi_enable 
      00A8F5 64 79                    1 	.word LINK 
                           002FF7     2 	LINK=.
      002FF7                          3 SPIEN:
      00A8F7 20                       4 	.byte 5   	
      00A8F8 6F 6E 65 20 69           5 	.ascii "SPIEN"
      00A8FD 6E 20                    6 	.word spi_enable  
      002FFF                       4477 	_dict_entry,5,SLEEP,sleep 
      00A8FF 46 4C                    1 	.word LINK 
                           003001     2 	LINK=.
      003001                          3 SLEEP:
      00A901 41                       4 	.byte 5   	
      00A902 53 48 0A 75 73           5 	.ascii "SLEEP"
      00A907 65 20                    6 	.word sleep  
      003009                       4478     _dict_entry,4,SIZE,cmd_size 
      00A909 45 52                    1 	.word LINK 
                           00300B     2 	LINK=.
      00300B                          3 SIZE:
      00A90B 41                       4 	.byte 4   	
      00A90C 53 45 20 5C              5 	.ascii "SIZE"
      00A910 46 20                    6 	.word cmd_size  
      003012                       4479 	_dict_entry,4,SAVE,save_app 
      00A912 62 65                    1 	.word LINK 
                           003014     2 	LINK=.
      003014                          3 SAVE:
      00A914 66                       4 	.byte 4   	
      00A915 6F 72 65 00              5 	.ascii "SAVE"
      00A919 4E 6F                    6 	.word save_app  
      00301B                       4480 	_dict_entry 3,RUN,run
      00A91B 20 61                    1 	.word LINK 
                           00301D     2 	LINK=.
      00301D                          3 RUN:
      00A91D 70                       4 	.byte 3   	
      00A91E 70 6C 69                 5 	.ascii "RUN"
      00A921 63 61                    6 	.word run  
      003023                       4481 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A923 74 69                    1 	.word LINK 
                           003025     2 	LINK=.
      003025                          3 RSHIFT:
      00A925 6F                       4 	.byte 6+F_IFUNC   	
      00A926 6E 20 69 6E 20 52        5 	.ascii "RSHIFT"
      00A92C 41 4D                    6 	.word rshift  
      00302E                       4482 	_dict_entry,3+F_IFUNC,RND,random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A92E 00 25                    1 	.word LINK 
                           003030     2 	LINK=.
      00A92F                          3 RND:
      00A92F CD                       4 	.byte 3+F_IFUNC   	
      00A930 9A CF A1                 5 	.ascii "RND"
      00A933 84 27                    6 	.word random  
      003036                       4483 	_dict_entry,6,RETURN,return 
      00A935 03 CC                    1 	.word LINK 
                           003038     2 	LINK=.
      003038                          3 RETURN:
      00A937 96                       4 	.byte 6   	
      00A938 C7 90 F6 93 EE 01        5 	.ascii "RETURN"
      00A93E 72 A9                    6 	.word return  
      003041                       4484 	_dict_entry,7,RESTORE,restore 
      00A940 00 03                    1 	.word LINK 
                           003043     2 	LINK=.
      003043                          3 RESTORE:
      00A942 C7                       4 	.byte 7   	
      00A943 00 19 CF 00 1A 52 45     5 	.ascii "RESTORE"
      00A948 2D D4                    6 	.word restore  
      00304D                       4485 	_dict_entry 3,REM,remark 
      00A948 CD 97                    1 	.word LINK 
                           00304F     2 	LINK=.
      00304F                          3 REM:
      00A94A CE                       4 	.byte 3   	
      00A94B A1 08 27                 5 	.ascii "REM"
      00A94E 02 20                    6 	.word remark  
      003055                       4486 	_dict_entry,6,REBOOT,cold_start
      00A950 20 CD                    1 	.word LINK 
                           003057     2 	LINK=.
      003057                          3 REBOOT:
      00A952 9A                       4 	.byte 6   	
      00A953 CF A1 84 27 03 CC        5 	.ascii "REBOOT"
      00A959 96 C7                    6 	.word cold_start  
      003060                       4487 	_dict_entry,4+F_IFUNC,READ,read  
      00A95B 90 F6                    1 	.word LINK 
                           003062     2 	LINK=.
      003062                          3 READ:
      00A95D 93                       4 	.byte 4+F_IFUNC   	
      00A95E EE 01 72 A9              5 	.ascii "READ"
      00A962 00 03                    6 	.word read  
      003069                       4488 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A964 9F 5F                    1 	.word LINK 
                           00306B     2 	LINK=.
      00306B                          3 QKEY:
      00A966 CD                       4 	.byte 4+F_IFUNC   	
      00A967 88 32 AE 00              5 	.ascii "QKEY"
      00A96B 01 CD                    6 	.word qkey  
      003072                       4489 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00A96D 89 02                    1 	.word LINK 
                           003074     2 	LINK=.
      003074                          3 PORTI:
      00A96F 20                       4 	.byte 5+F_IFUNC   	
      00A970 D7 4F 52 54 49           5 	.ascii "PORTI"
      00A971 2D 93                    6 	.word const_porti  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00307C                       4490 	_dict_entry,5+F_IFUNC,PORTH,const_porth 
      00A971 81 74                    1 	.word LINK 
                           00307E     2 	LINK=.
      00A972                          3 PORTH:
      00A972 CD                       4 	.byte 5+F_IFUNC   	
      00A973 99 93 A1 01 27           5 	.ascii "PORTH"
      00A978 03 CC                    6 	.word const_porth  
      003086                       4491 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00A97A 96 C7                    1 	.word LINK 
                           003088     2 	LINK=.
      003088                          3 PORTG:
      00A97C 90                       4 	.byte 5+F_IFUNC   	
      00A97D F6 93 EE 01 72           5 	.ascii "PORTG"
      00A982 A9 00                    6 	.word const_portg  
      003090                       4492 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00A984 03 9F                    1 	.word LINK 
                           003092     2 	LINK=.
      003092                          3 PORTF:
      00A986 A4                       4 	.byte 5+F_IFUNC   	
      00A987 7F 81 52 54 46           5 	.ascii "PORTF"
      00A989 2D 84                    6 	.word const_portf  
      00309A                       4493 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00A989 A6 06                    1 	.word LINK 
                           00309C     2 	LINK=.
      00309C                          3 PORTE:
      00A98B CD                       4 	.byte 5+F_IFUNC   	
      00A98C 99 86 CD 97 CE           5 	.ascii "PORTE"
      00A991 A1 02                    6 	.word const_porte  
      0030A4                       4494 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00A993 27 0E                    1 	.word LINK 
                           0030A6     2 	LINK=.
      0030A6                          3 PORTD:
      00A995 A1                       4 	.byte 5+F_IFUNC   	
      00A996 04 27 12 A1 82           5 	.ascii "PORTD"
      00A99B 27 03                    6 	.word const_portd  
      0030AE                       4495 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00A99D CC 96                    1 	.word LINK 
                           0030B0     2 	LINK=.
      0030B0                          3 PORTC:
      00A99F C7                       4 	.byte 5+F_IFUNC   	
      00A9A0 50 4F 52 54 43           5 	.ascii "PORTC"
      00A9A0 FD 20                    6 	.word const_portc  
      0030B8                       4496 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00A9A2 0B B0                    1 	.word LINK 
                           0030BA     2 	LINK=.
      00A9A3                          3 PORTB:
      00A9A3 F6                       4 	.byte 5+F_IFUNC   	
      00A9A4 88 CD 97 E7 84           5 	.ascii "PORTB"
      00A9A9 20 03                    6 	.word const_portb  
      00A9AB                       4497 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00A9AB CD 98                    1 	.word LINK 
                           0030C4     2 	LINK=.
      0030C4                          3 PORTA:
      00A9AD 10                       4 	.byte 5+F_IFUNC   	
      00A9AE 5F 02 72 A2 00           5 	.ascii "PORTA"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00A9B3 03 90                    6 	.word const_porta  
      0030CC                       4498 	_dict_entry 5,PRINT,print 
      00A9B5 F7 90                    1 	.word LINK 
                           0030CE     2 	LINK=.
      0030CE                          3 PRINT:
      00A9B7 EF                       4 	.byte 5   	
      00A9B8 01 A6 07 CD 99           5 	.ascii "PRINT"
      00A9BD 86 B6                    6 	.word print  
      00A9BE                       4499 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A9BE 90 F6                    1 	.word LINK 
                           0030D8     2 	LINK=.
      0030D8                          3 POUT:
      00A9C0 93                       4 	.byte 4+F_IFUNC   	
      00A9C1 EE 01 72 A9              5 	.ascii "POUT"
      00A9C5 00 03                    6 	.word const_output  
      0030DF                       4500 	_dict_entry,4,POKE,poke 
      00A9C7 81 D8                    1 	.word LINK 
                           0030E1     2 	LINK=.
      00A9C8                          3 POKE:
      00A9C8 CD                       4 	.byte 4   	
      00A9C9 89 A0 81 45              5 	.ascii "POKE"
      00A9CC 21 DF                    6 	.word poke  
      0030E8                       4501 	_dict_entry,5,PMODE,pin_mode 
      00A9CC 5F C6                    1 	.word LINK 
                           0030EA     2 	LINK=.
      0030EA                          3 PMODE:
      00A9CE 00                       4 	.byte 5   	
      00A9CF 2F C0 00 30 27           5 	.ascii "PMODE"
      00A9D4 03 53                    6 	.word pin_mode  
      0030F2                       4502 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A9D6 A6 FF                    1 	.word LINK 
                           0030F4     2 	LINK=.
      00A9D8                          3 PINP:
      00A9D8 81                       4 	.byte 4+F_IFUNC   	
      00A9D9 50 49 4E 50              5 	.ascii "PINP"
      00A9D9 CD 99                    6 	.word const_input  
      0030FB                       4503 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A9DB 93 A1                    1 	.word LINK 
                           0030FD     2 	LINK=.
      0030FD                          3 PEEK:
      00A9DD 02                       4 	.byte 4+F_IFUNC   	
      00A9DE 27 03 CC 96              5 	.ascii "PEEK"
      00A9E2 C7 90                    6 	.word peek  
      003104                       4504 	_dict_entry,5,PAUSE,pause 
      00A9E4 E6 03                    1 	.word LINK 
                           003106     2 	LINK=.
      003106                          3 PAUSE:
      00A9E6 93                       4 	.byte 5   	
      00A9E7 EE 04 A3 50 00           5 	.ascii "PAUSE"
      00A9EC 2B 16                    6 	.word pause  
      00310E                       4505 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A9EE A3 50                    1 	.word LINK 
                           003110     2 	LINK=.
      003110                          3 PAD:
      00A9F0 29                       4 	.byte 3+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00A9F1 2A 11 89                 5 	.ascii "PAD"
      00A9F4 90 F6                    6 	.word pad_ref  
      003116                       4506 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00A9F6 93 EE                    1 	.word LINK 
                           003118     2 	LINK=.
      003118                          3 OR:
      00A9F8 01                       4 	.byte 2+F_OR   	
      00A9F9 72 A9                    5 	.ascii "OR"
      00A9FB 00 03                    6 	.word TK_OR  
      00311D                       4507 	_dict_entry,2,ON,cmd_on 
      00A9FD 72 FB                    1 	.word LINK 
                           00311F     2 	LINK=.
      00311F                          3 ON:
      00A9FF 01                       4 	.byte 2   	
      00AA00 5B 02                    5 	.ascii "ON"
      00AA02 4F 81                    6 	.word cmd_on  
      00AA04                       4508 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AA04 A6 0A                    1 	.word LINK 
                           003126     2 	LINK=.
      003126                          3 ODR:
      00AA06 CC                       4 	.byte 3+F_IFUNC   	
      00AA07 96 C9 52                 5 	.ascii "ODR"
      00AA09 2D 98                    6 	.word const_odr  
      00312C                       4509 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AA09 CD A8                    1 	.word LINK 
                           00312E     2 	LINK=.
      00312E                          3 NOT:
      00AA0B 15                       4 	.byte 3+F_NOT   	
      00AA0C 26 13 AE                 5 	.ascii "NOT"
      00AA0F B5 00                    6 	.word TK_NOT  
      003134                       4510 	_dict_entry,4,NEXT,next 
      00AA11 72 BB                    1 	.word LINK 
                           003136     2 	LINK=.
      003136                          3 NEXT:
      00AA13 B5                       4 	.byte 4   	
      00AA14 02 1C 00 04              5 	.ascii "NEXT"
      00AA18 1C 00                    6 	.word next  
      00313D                       4511 	_dict_entry,3,NEW,new
      00AA1A 80 9F                    1 	.word LINK 
                           00313F     2 	LINK=.
      00313F                          3 NEW:
      00AA1C A4                       4 	.byte 3   	
      00AA1D 80 97 20                 5 	.ascii "NEW"
      00AA20 03 AE                    6 	.word new  
      003145                       4512 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AA22 B5 00                    1 	.word LINK 
                           003147     2 	LINK=.
      00AA24                          3 LSHIFT:
      00AA24 4F                       4 	.byte 6+F_IFUNC   	
      00AA25 81 53 48 49 46 54        5 	.ascii "LSHIFT"
      00AA26 2A 70                    6 	.word lshift  
      003150                       4513 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AA26 CD 99                    1 	.word LINK 
                           003152     2 	LINK=.
      003152                          3 LOG2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA28 93                       4 	.byte 4+F_IFUNC   	
      00AA29 A1 02 27 03              5 	.ascii "LOG2"
      00AA2D CC 96                    6 	.word log2  
      003159                       4514 	_dict_entry 4,LIST,list
      00AA2F C7 52                    1 	.word LINK 
                           00315B     2 	LINK=.
      00AA30                          3 LIST:
      00AA30 90                       4 	.byte 4   	
      00AA31 E6 03 93 EE              5 	.ascii "LIST"
      00AA35 04 CF                    6 	.word list  
      003162                       4515 	_dict_entry 3,LET,let 
      00AA37 00 1A                    1 	.word LINK 
                           003164     2 	LINK=.
      003164                          3 LET:
      00AA39 90                       4 	.byte 3   	
      00AA3A F6 93 EE                 5 	.ascii "LET"
      00AA3D 01 72                    6 	.word let  
      00316A                       4516 	_dict_entry,3+F_CFUNC,KEY,key 
      00AA3F A9 00                    1 	.word LINK 
                           00316C     2 	LINK=.
      00316C                          3 KEY:
      00AA41 03                       4 	.byte 3+F_CFUNC   	
      00AA42 90 F7 90                 5 	.ascii "KEY"
      00AA45 EF 01                    6 	.word key  
      003172                       4517 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AA47 72 CD                    1 	.word LINK 
                           003174     2 	LINK=.
      003174                          3 IWDGREF:
      00AA49 00                       4 	.byte 7   	
      00AA4A 1A 81 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AA4C 2C CD                    6 	.word refresh_iwdg  
      00317E                       4518 	_dict_entry,6,IWDGEN,enable_iwdg
      00AA4C 72 0D                    1 	.word LINK 
                           003180     2 	LINK=.
      003180                          3 IWDGEN:
      00AA4E 52                       4 	.byte 6   	
      00AA4F 30 FB 8E CC 81 43        5 	.ascii "IWDGEN"
      00AA55 2C 8F                    6 	.word enable_iwdg  
      003189                       4519 	_dict_entry,5,INPUT,input_var  
      00AA55 72 0D                    1 	.word LINK 
                           00318B     2 	LINK=.
      00318B                          3 INPUT:
      00AA57 52                       4 	.byte 5   	
      00AA58 30 FB 72 16 00           5 	.ascii "INPUT"
      00AA5D 23 8E                    6 	.word input_var  
      003193                       4520 	_dict_entry,2,IF,if 
      00AA5F 81 8B                    1 	.word LINK 
                           003195     2 	LINK=.
      00AA60                          3 IF:
      00AA60 CD                       4 	.byte 2   	
      00AA61 9A CF                    5 	.ascii "IF"
      00AA63 A1 84                    6 	.word if  
      00319A                       4521 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AA65 27 03                    1 	.word LINK 
                           00319C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00319C                          3 IDR:
      00AA67 CC                       4 	.byte 3+F_IFUNC   	
      00AA68 96 C7 90                 5 	.ascii "IDR"
      00AA6B F6 93                    6 	.word const_idr  
      0031A2                       4522 	_dict_entry,3,HEX,hex_base
      00AA6D EE 01                    1 	.word LINK 
                           0031A4     2 	LINK=.
      0031A4                          3 HEX:
      00AA6F 72                       4 	.byte 3   	
      00AA70 A9 00 03                 5 	.ascii "HEX"
      00AA73 1B DC                    6 	.word hex_base  
      0031AA                       4523 	_dict_entry,4,GOTO,goto 
      00AA73 CF 00                    1 	.word LINK 
                           0031AC     2 	LINK=.
      0031AC                          3 GOTO:
      00AA75 13                       4 	.byte 4   	
      00AA76 CE 00 13 5D              5 	.ascii "GOTO"
      00AA7A 27 03                    6 	.word goto  
      0031B3                       4524 	_dict_entry,5,GOSUB,gosub 
      00AA7C 8F 26                    1 	.word LINK 
                           0031B5     2 	LINK=.
      0031B5                          3 GOSUB:
      00AA7E F7                       4 	.byte 5   	
      00AA7F 47 4F 53 55 42           5 	.ascii "GOSUB"
      00AA7F 81 86                    6 	.word gosub  
      00AA80                       4525 	_dict_entry,3,GET,cmd_get 
      00AA80 CD 9A                    1 	.word LINK 
                           0031BF     2 	LINK=.
      0031BF                          3 GET:
      00AA82 CF                       4 	.byte 3   	
      00AA83 A1 84 27                 5 	.ascii "GET"
      00AA86 03 CC                    6 	.word cmd_get  
      0031C5                       4526 	_dict_entry,4+F_IFUNC,FREE,free
      00AA88 96 C7                    1 	.word LINK 
                           0031C7     2 	LINK=.
      0031C7                          3 FREE:
      00AA8A 90                       4 	.byte 4+F_IFUNC   	
      00AA8B F6 93 EE 01              5 	.ascii "FREE"
      00AA8F 72 A9                    6 	.word free  
      0031CE                       4527 	_dict_entry,3,FOR,for 
      00AA91 00 03                    1 	.word LINK 
                           0031D0     2 	LINK=.
      00AA93                          3 FOR:
      00AA93 A3                       4 	.byte 3   	
      00AA94 14 00 2B                 5 	.ascii "FOR"
      00AA97 0C 35                    6 	.word for  
      0031D6                       4528 	_dict_entry,4,FCPU,fcpu 
      00AA99 0F 50                    1 	.word LINK 
                           0031D8     2 	LINK=.
      0031D8                          3 FCPU:
      00AA9B F2                       4 	.byte 4   	
      00AA9C A6 1E 62 A6              5 	.ascii "FCPU"
      00AAA0 10 62                    6 	.word fcpu  
      0031DF                       4529 	_dict_entry,5,ERASE,erase 
      00AAA2 20 1E                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



                           0031E1     2 	LINK=.
      00AAA4                          3 ERASE:
      00AAA4 A3                       4 	.byte 5   	
      00AAA5 08 00 2B 09 35           5 	.ascii "ERASE"
      00AAAA 0E 50                    6 	.word erase  
      0031E9                       4530 	_dict_entry,3,END,cmd_end  
      00AAAC F2 A6                    1 	.word LINK 
                           0031EB     2 	LINK=.
      0031EB                          3 END:
      00AAAE 50                       4 	.byte 3   	
      00AAAF 62 20 10                 5 	.ascii "END"
      00AAB2 25 26                    6 	.word cmd_end  
      0031F1                       4531 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AAB2 35 07                    1 	.word LINK 
                           0031F3     2 	LINK=.
      0031F3                          3 EEPROM:
      00AAB4 50                       4 	.byte 6+F_IFUNC   	
      00AAB5 F2 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00AAB6 2D BB                    6 	.word const_eeprom_base  
      0031FC                       4532 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AAB6 A3 00                    1 	.word LINK 
                           0031FE     2 	LINK=.
      0031FE                          3 EEFREE:
      00AAB8 40                       4 	.byte 6+F_IFUNC   	
      00AAB9 23 07 72 5C 50 F2        5 	.ascii "EEFREE"
      00AABF 54 20                    6 	.word func_eefree  
      003207                       4533 	_dict_entry,4,EDIT,edit 
      00AAC1 F4 FE                    1 	.word LINK 
                           003209     2 	LINK=.
      00AAC2                          3 EDIT:
      00AAC2 9F                       4 	.byte 4   	
      00AAC3 4A 27 01 4A              5 	.ascii "EDIT"
      00AAC7 1F 4E                    6 	.word edit  
      003210                       4534 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AAC7 A4 3E                    1 	.word LINK 
                           003212     2 	LINK=.
      003212                          3 DWRITE:
      00AAC9 C7                       4 	.byte 6+F_CMD   	
      00AACA 50 F1 72 18 50 F0        5 	.ascii "DWRITE"
      00AAD0 8E 81                    6 	.word digital_write  
      00AAD2                       4535 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AAD2 C6 00                    1 	.word LINK 
                           00321D     2 	LINK=.
      00321D                          3 DREAD:
      00AAD4 10                       4 	.byte 5+F_IFUNC   	
      00AAD5 CE 00 11 81 44           5 	.ascii "DREAD"
      00AAD9 26 4C                    6 	.word digital_read  
      003225                       4536 	_dict_entry,2,DO,do_loop
      00AAD9 CD 99                    1 	.word LINK 
                           003227     2 	LINK=.
      003227                          3 DO:
      00AADB 93                       4 	.byte 2   	
      00AADC A1 01                    5 	.ascii "DO"
      00AADE 27 03                    6 	.word do_loop  
      00322C                       4537 	_dict_entry,3,DEC,dec_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AAE0 CC 96                    1 	.word LINK 
                           00322E     2 	LINK=.
      00322E                          3 DEC:
      00AAE2 C7                       4 	.byte 3   	
      00AAE3 44 45 43                 5 	.ascii "DEC"
      00AAE3 CD 82                    6 	.word dec_base  
      003234                       4538 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AAE5 5F 90                    1 	.word LINK 
                           003236     2 	LINK=.
      003236                          3 DDR:
      00AAE7 F6                       4 	.byte 3+F_IFUNC   	
      00AAE8 93 EE 01                 5 	.ascii "DDR"
      00AAEB 72 A9                    6 	.word const_ddr  
      00323C                       4539 	_dict_entry,4,DATA,data  
      00AAED 00 03                    1 	.word LINK 
                           00323E     2 	LINK=.
      00323E                          3 DATA:
      00AAEF 81                       4 	.byte 4   	
      00AAF0 44 41 54 41              5 	.ascii "DATA"
      00AAF0 CD 99                    6 	.word data  
      003245                       4540 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AAF2 93 A1                    1 	.word LINK 
                           003247     2 	LINK=.
      003247                          3 CR2:
      00AAF4 02                       4 	.byte 3+F_IFUNC   	
      00AAF5 27 03 CC                 5 	.ascii "CR2"
      00AAF8 96 C7                    6 	.word const_cr2  
      00324D                       4541 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AAFA 90 F6                    1 	.word LINK 
                           00324F     2 	LINK=.
      00324F                          3 CR1:
      00AAFC 93                       4 	.byte 3+F_IFUNC   	
      00AAFD EE 01 72                 5 	.ascii "CR1"
      00AB00 A9 00                    6 	.word const_cr1  
      003255                       4542 	_dict_entry,5,CONST,cmd_const 
      00AB02 03 90                    1 	.word LINK 
                           003257     2 	LINK=.
      003257                          3 CONST:
      00AB04 93                       4 	.byte 5   	
      00AB05 90 F6 93 EE 01           5 	.ascii "CONST"
      00AB0A 90 5D                    6 	.word cmd_const  
      00325F                       4543 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00AB0C 27 07                    1 	.word LINK 
                           003261     2 	LINK=.
      003261                          3 CHAR:
      00AB0E 98                       4 	.byte 4+F_CFUNC   	
      00AB0F 59 49 90 5A              5 	.ascii "CHAR"
      00AB13 26 F9                    6 	.word func_char  
      003268                       4544 	_dict_entry,3,BYE,bye 
      00AB15 90 F7                    1 	.word LINK 
                           00326A     2 	LINK=.
      00326A                          3 BYE:
      00AB17 90                       4 	.byte 3   	
      00AB18 EF 01 A6                 5 	.ascii "BYE"
      00AB1B 84 81                    6 	.word bye  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB1D                       4545 	_dict_entry,5,BTOGL,bit_toggle
      00AB1D CD 99                    1 	.word LINK 
                           003272     2 	LINK=.
      003272                          3 BTOGL:
      00AB1F 93                       4 	.byte 5   	
      00AB20 A1 02 27 03 CC           5 	.ascii "BTOGL"
      00AB25 96 C7                    6 	.word bit_toggle  
      00327A                       4546 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AB27 90 F6                    1 	.word LINK 
                           00327C     2 	LINK=.
      00327C                          3 BTEST:
      00AB29 93                       4 	.byte 5+F_IFUNC   	
      00AB2A EE 01 72 A9 00           5 	.ascii "BTEST"
      00AB2F 03 90                    6 	.word bit_test  
      003284                       4547 	_dict_entry,4,BSET,bit_set 
      00AB31 93 90                    1 	.word LINK 
                           003286     2 	LINK=.
      003286                          3 BSET:
      00AB33 F6                       4 	.byte 4   	
      00AB34 93 EE 01 90              5 	.ascii "BSET"
      00AB38 5D 27                    6 	.word bit_set  
      00328D                       4548 	_dict_entry,4,BRES,bit_reset
      00AB3A 07 98                    1 	.word LINK 
                           00328F     2 	LINK=.
      00328F                          3 BRES:
      00AB3C 56                       4 	.byte 4   	
      00AB3D 46 90 5A 26              5 	.ascii "BRES"
      00AB41 F9 90                    6 	.word bit_reset  
      003296                       4549 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AB43 F7 90                    1 	.word LINK 
                           003298     2 	LINK=.
      003298                          3 BIT:
      00AB45 EF                       4 	.byte 3+F_IFUNC   	
      00AB46 01 A6 84                 5 	.ascii "BIT"
      00AB49 81 FF                    6 	.word bitmask  
      00AB4A                       4550 	_dict_entry,3,AWU,awu 
      00AB4A A6 84                    1 	.word LINK 
                           0032A0     2 	LINK=.
      0032A0                          3 AWU:
      00AB4C CD                       4 	.byte 3   	
      00AB4D 99 86 CD                 5 	.ascii "AWU"
      00AB50 98 00                    6 	.word awu  
      0032A6                       4551 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AB52 9F A4                    1 	.word LINK 
                           0032A8     2 	LINK=.
      0032A8                          3 ASC:
      00AB54 07                       4 	.byte 3+F_IFUNC   	
      00AB55 C7 50 C6                 5 	.ascii "ASC"
      00AB58 81 09                    6 	.word ascii  
      00AB59                       4552 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AB59 52 01                    1 	.word LINK 
                           0032B0     2 	LINK=.
      0032B0                          3 AND:
      00AB5B CD                       4 	.byte 3+F_AND   	
      00AB5C 99 98 A1                 5 	.ascii "AND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00AB5F 02 27                    6 	.word TK_AND  
      0032B6                       4553 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AB61 03 CC                    1 	.word LINK 
                           0032B8     2 	LINK=.
      0032B8                          3 ADCREAD:
      00AB63 96                       4 	.byte 7+F_IFUNC   	
      00AB64 C7 90 F6 93 EE 01 72     5 	.ascii "ADCREAD"
      00AB6B A9 00                    6 	.word analog_read  
      0032C2                       4554 	_dict_entry,5,ADCON,power_adc 
      00AB6D 03 CF                    1 	.word LINK 
                           0032C4     2 	LINK=.
      0032C4                          3 ADCON:
      00AB6F 00                       4 	.byte 5   	
      00AB70 1A 90 F6 93 EE           5 	.ascii "ADCON"
      00AB75 01 72                    6 	.word power_adc  
      0032CC                       4555 kword_dict::
      0032CC                       4556 	_dict_entry,3+F_IFUNC,ABS,abs
      00AB77 A9 00                    1 	.word LINK 
                           0032CE     2 	LINK=.
      0032CE                          3 ABS:
      00AB79 03                       4 	.byte 3+F_IFUNC   	
      00AB7A CD AB B8                 5 	.ascii "ABS"
      00AB7D 6B 01                    6 	.word abs  
                                   4557 
                           000000  4558 INDIRECT=0 
                           000000  4559 .if INDIRECT 
                                   4560 ;comands and fonctions address table 	
                                   4561 code_addr::
                                   4562 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4563 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4564 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4565 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4566 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4567 	.word let,list,log2,lshift,next,new ; 40..47
                                   4568 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4569 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4570 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4571 	.word restore,return, random,rshift,run,free ; 72..79
                                   4572 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4573 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4574 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4575 	.word func_eefree,0 
                                   4576 .endif 
                                   4577 
                                   4578 
                                   4579 
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
      0032D4                         30 test:
      0032D4                         31     _vars VSIZE 
      00AB7F A6 01            [ 2]    1     sub sp,#VSIZE 
      00AB81 0D 01 27         [ 2]   32     ldw x,#LOOP_CNT
      00AB84 0D 48            [ 2]   33     ldw (CNTR,sp),x  
      00AB86 0A 01 26         [ 2]   34     ldw x,ticks 
      00AB89 FB 6B            [ 2]   35     ldw (T,sp),x
      0032E0                         36 1$: ; test add24 
      00AB8B 01 7B            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AB8D 01 EA 03         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AB90 E7 03 A6         [ 1]   39     ld acc24,a 
      00AB93 01 C1 00         [ 2]   40     ldw acc24+1,x  
      00AB96 0F 27            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AB98 10 7B 01         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AB9B 43 E4 04         [ 4]   43     call add24 
      00AB9E E7 04            [ 2]   44     ldw x,(CNTR,sp)
      00ABA0 7B 01 43         [ 2]   45     subw x,#1
      00ABA3 E4 02            [ 2]   46     ldw (CNTR,sp),x 
      00ABA5 E7 02            [ 1]   47     jrne 1$
      00ABA7 20 0C AD         [ 4]   48     call prt_acc24
      00ABA9 A6 20            [ 1]   49     ld a,#SPACE 
      00ABA9 7B 01 EA         [ 4]   50     call putc 
      00ABAC 02 E7 02         [ 2]   51     ldw x,ticks 
      00ABAF 7B 01 EA         [ 2]   52     subw x,(T,sp)
      00ABB2 04 E7 04         [ 4]   53     call prt_i16  
      00ABB5 A6 0D            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00ABB5 5B 01 81         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ABB8 CE 27 10         [ 2]   58     ldw x,LOOP_CNT
      00ABB8 58 1C            [ 2]   59     ldw (CNTR,sp),x 
      00ABBA AB C8 FE         [ 2]   60     ldw x,ticks 
      00ABBD 9F 88            [ 2]   61     ldw (T,sp),x 
      00331C                         62 2$: 
      00ABBF 5E A6            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ABC1 05 42 1C         [ 2]   64     ldw x,#VAL1&0XFFFF
      00ABC4 50 00 84         [ 1]   65     ld acc24,a 
      00ABC7 81 00 0D         [ 2]   66     ldw acc24+1,x  
      00ABC8 A6 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00ABC8 03 06 03         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00ABCB 05 04 00         [ 4]   69     call mul24 
      00ABCE 02 01            [ 2]   70     ldw x,(CNTR,sp)
      00ABD0 06 00 02         [ 2]   71     subw x,#1
      00ABD3 02 02            [ 2]   72     ldw (CNTR,sp),x 
      00ABD5 03 03            [ 1]   73     jrne 2$ 
      00ABD7 01 03 03         [ 4]   74    call prt_acc24 
      00ABDA 02 04            [ 1]   75    ld a,#SPACE 
      00ABDC 04 05 02         [ 4]   76    call putc 
      00ABDF 06 02 07         [ 2]   77     ldw x,ticks 
      00ABE2 02 05 04         [ 2]   78     subw x,(T,sp)
      00ABE5 02 04 01         [ 4]   79     call prt_i16 
      00ABE8 A6 0D            [ 1]   80     ld a,#CR 
      00ABE8 CD 99 93         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00ABEB A1 01 27         [ 2]   83     ldw x,LOOP_CNT
      00ABEE 03 CC            [ 2]   84     ldw (CNTR,sp),x 
      00ABF0 96 C7 0F         [ 2]   85     ldw x,ticks 
      00ABF2 1F 01            [ 2]   86     ldw (T,sp),x 
      003358                         87 3$: 
      00ABF2 90 F6            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00ABF4 93 EE 01         [ 2]   89     ldw x,#VAL1&0XFFFF
      00ABF7 72 A9 00         [ 1]   90     ld acc24,a 
      00ABFA 03 89 88         [ 2]   91     ldw acc24+1,x  
      00ABFD A6 80            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00ABFF 15 01 27         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AC02 05 A6 0A         [ 4]   94     call mul24 
      00AC05 CC 96            [ 2]   95     ldw x,(CNTR,sp)
      00AC07 C9 00 01         [ 2]   96     subw x,#1
      00AC08 1F 03            [ 2]   97     ldw (CNTR,sp),x 
      00AC08 CE 00            [ 1]   98     jrne 3$ 
      00AC0A 15 58 58         [ 4]   99     call prt_acc24    
      00AC0D 58 58            [ 1]  100     ld a,#SPACE 
      00AC0F 58 9E C8         [ 4]  101     call putc 
      00AC12 00 15 C7         [ 2]  102     ldw x,ticks 
      00AC15 00 0E 9F         [ 2]  103     subw x,(T,sp)
      00AC18 C8 00 16         [ 4]  104     call prt_i16 
      00AC1B C7 00            [ 1]  105     ld a,#CR 
      00AC1D 0F CE 00         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AC20 17 CF 00         [ 2]  108     ldw x,LOOP_CNT
      00AC23 15 CE            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AC25 00 17 54         [ 2]  110     ldw x,ticks 
      00AC28 9E C8            [ 2]  111     ldw (T,sp),x 
      003394                        112 4$:
      00AC2A 00 17            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AC2C C7 00 17         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AC2F 9F C8 00         [ 1]  115     ld acc24,a 
      00AC32 18 C7 00         [ 2]  116     ldw acc24+1,x  
      00AC35 18 CE            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AC37 00 0E 54         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AC3A 54 54 9E         [ 4]  119     call mul24 
      00AC3D C8 00            [ 2]  120     ldw x,(CNTR,sp)
      00AC3F 0E C7 00         [ 2]  121     subw x,#1
      00AC42 0E 9F            [ 2]  122     ldw (CNTR,sp),x 
      00AC44 C8 00            [ 1]  123     jrne 4$ 
      00AC46 0F C7 00         [ 4]  124     call prt_acc24 
      00AC49 0F C8            [ 1]  125     ld a,#SPACE 
      00AC4B 00 18 97         [ 4]  126     call putc 
      00AC4E C6 00 0E         [ 2]  127     ldw x,ticks 
      00AC51 C8 00 17         [ 2]  128     subw x,(T,sp)
      00AC54 95 CF 00         [ 4]  129     call prt_i16 
      00AC57 17 C6            [ 1]  130     ld a,#CR 
      00AC59 00 16 A4         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AC5C 7F 72 A2         [ 2]  133     ldw x,LOOP_CNT
      00AC5F 00 03            [ 2]  134     ldw (CNTR,sp),x 
      00AC61 90 F7 90         [ 2]  135     ldw x,ticks 
      00AC64 EF 01            [ 2]  136     ldw (T,sp),x 
      0033D0                        137 5$: 
      00AC66 84 85            [ 1]  138     ld a,#0xff
      00AC68 72 A2 00         [ 2]  139     ldw x,#0xffff
      00AC6B 03 90 F7         [ 4]  140     call abs24 
      00AC6E 90 EF 01         [ 1]  141     ld acc24,a 
      00AC71 CD 84 21         [ 2]  142     ldw acc24+1,x
      00AC74 90 F6            [ 2]  143     ldw x,(CNTR,sp)
      00AC76 93 EE 01         [ 2]  144     subw x,#1
      00AC79 72 A9            [ 2]  145     ldw (CNTR,sp),x 
      00AC7B 00 03            [ 1]  146     jrne 5$ 
      00AC7D 1C 00 01         [ 4]  147     call prt_acc24 
      00AC80 A9 00            [ 1]  148     ld a,#SPACE 
      00AC82 81 09 10         [ 4]  149     call putc 
      00AC83 CE 00 0F         [ 2]  150     ldw x,ticks 
      00AC83 90 89 52         [ 2]  151     subw x,(T,sp)
      00AC86 03 0F 02         [ 4]  152     call prt_i16 
      0033F8                        153 6$:
      00AC89 0F 03            [ 1]  154     ld a,#CR 
      00AC8B 90 AE B3         [ 4]  155     call putc 
      00AC8E 4E 93 F6         [ 4]  156     call read_integer 
      00AC91 A4 0F 6B 01 0C   [ 1]  157     mov farptr,acc24 
      00AC96 03 5C F6 CD 89   [ 1]  158     mov farptr+1,acc16 
      00AC9B 90 0C 02 0A 01   [ 1]  159     mov farptr+2,acc8 
      00ACA0 26 F5 A6         [ 4]  160     call read_integer 
      00ACA3 46 11 02         [ 1]  161     ld a,acc24 
      00ACA6 2B 09 A6         [ 2]  162     ldw x,acc16 
      00ACA9 20 CD 89 90 0C   [ 1]  163     mov acc24,farptr 
      00ACAE 02 20 07 A6 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ACB3 CD 89 90 0F 02   [ 1]  165     mov acc8,farptr+2 
      00ACB8 72 A2 00         [ 4]  166     call div24 
      00ACBB 02               [ 1]  167     push a 
      00ACBC 90               [ 2]  168     pushw x 
      00ACBD FE 26 CF         [ 4]  169     call prt_acc24 
      00ACC0 A6 0D            [ 1]  170     ld a,#SPACE 
      00ACC2 CD 89 90         [ 4]  171     call putc 
      00ACC5 5F               [ 2]  172     popw x
      00ACC6 7B 03 97         [ 2]  173     ldw acc16,x  
      00ACC9 CD 98 16         [ 1]  174     pop acc24 
      00ACCC AE AC D7         [ 4]  175     call prt_acc24
      00ACCF CD 89            [ 2]  176     jra 6$
      003440                        177     _drop VSIZE 
      00ACD1 ED 5B            [ 2]    1     addw sp,#VSIZE 
      00ACD3 03               [ 4]  178     ret 
                                    179 
                                    180 
      003443                        181 read_integer:
      00ACD4 90 85            [ 1]  182     ld a,#'? 
      00ACD6 81 20 77         [ 4]  183     call putc  
      00ACD9 6F 72 64 73      [ 1]  184 	clr count  
      00ACDD 20 69 6E         [ 4]  185 	call readln 
      00ACE0 20 64 69         [ 2]  186 	ldw x,#tib 
      00ACE3 63 74 69         [ 1]  187 	push count
      00ACE6 6F 6E            [ 1]  188 	push #0 
      00ACE8 61 72 79         [ 2]  189 	addw x,(1,sp)
      00ACEB 0A               [ 1]  190 	incw x 
      00345B                        191 	_drop 2 
      00ACEC 00 02            [ 2]    1     addw sp,#2 
      00ACED 72 5F 00 01      [ 1]  192 	clr in 
      00ACED CD 99 98         [ 4]  193 	call get_token
      00ACF0 A1 01            [ 1]  194 	cp a,#TK_INTGR
      00ACF2 27 03            [ 1]  195 	jreq 3$ 
      00ACF4 CC 96            [ 1]  196 	cp a,#TK_MINUS
      00ACF6 C7 0E E7         [ 4]  197 	call get_token 
      00ACF7 A1 84            [ 1]  198 	cp a,#TK_INTGR 
      00ACF7 90 F6            [ 1]  199 	jreq 2$
      00ACF9 93 EE 01         [ 2]  200 	jp syntax_error
      003474                        201 2$:
      00ACFC 72 A9 00         [ 4]  202 	call neg_acc24  	
      003477                        203 3$: 
      00ACFF 03               [ 4]  204     ret 
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
      003480                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003480                         30 app_space::
      00AD00 CF 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AD02 13 81                   32 app_size: .word 0 
      00AD04                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0032CE R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0032C4 R
    ADCON_ID=  000002     |   4 ADCREAD    0032B8 R   |     ADCREAD_=  000004 
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
  4 AND        0032B0 R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        0032A8 R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        0032A0 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        003298 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       00328F R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       003286 R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      00327C R   |     BTEST_ID=  000010 
  4 BTOGL      003272 R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        00326A R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002857 R
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
  4 CHAR       003261 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
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
    CNAME   =  000001     |     CNT     =  000006     |     CNTR    =  000003 
    CNT_LO  =  000004     |     CODE_ADD=  000001     |     COMMA   =  00002C 
  4 CONST      003257 R   |   4 CONST_CO   001CE2 R   |     CONST_ID=  0000B8 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CR1        00324F R   |     CR1_IDX =  00001A     |   4 CR2        003247 R
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
  4 DATA       00323E R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003236 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        00322E R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         003227 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      00321D R
    DREAD_ID=  000024     |   4 DWRITE     003212 R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       003209 R   |     EDIT_IDX=  000028     |   4 EEFREE     0031FE R
    EEFREE_I=  0000BA     |   4 EEPROM     0031F3 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        0031EB R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      0031E1 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       0031D8 R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001E89 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        0031D0 R   |     FOR_IDX =  000034 
  4 FREE       0031C7 R   |     FREE_IDX=  00008A     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        0031BF R   |     GET_IDX =  0000B6     |   4 GOSUB      0031B5 R
    GOSUB_ID=  000036     |   4 GOTO       0031AC R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        0031A4 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
  4 IDR        00319C R   |     IDR_IDX =  00003C     |   4 IF         003195 R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INDIRECT=  000000     |     INP     =  000000     |   4 INPUT      00318B R
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
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   4 IWDGEN     003180 R
    IWDGEN_I=  000042     |   4 IWDGREF    003174 R   |     IWDGREF_=  000044 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
    KCHAR   =  000002     |   4 KEY        00316C R   |     KEY_END =  000083 
    KEY_IDX =  000046     |     KW_TYPE_=  0000F0     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        003164 R
    LET_IDX =  000048     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  0032CE R   |   4 LIST       00315B R
    LIST_IDX=  00004A     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG2       003152 R
    LOG_IDX =  00004C     |     LOOP_CNT=  002710     |   4 LSHIFT     003147 R
    LSHIFT_I=  00004E     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000005     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        00313F R   |     NEW_IDX =  000052     |   4 NEXT       003136 R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        00312E R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |   4 NOT_SAVE   001F7B R   |   4 NO_APP     002899 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        003126 R   |     ODR_IDX =  000054 
  4 ON         00311F R   |     ONOFF   =  000003     |     ON_IDX  =  0000B4 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         003118 R
    OR_IDX  =  0000FC     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        003110 R
    PAD_IDX =  000056     |     PAD_SIZE=  000080     |   4 PAUSE      003106 R
    PAUSE_ID=  000058     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       0030FD R
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
  4 PINP       0030F4 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      0030EA R   |     PMODE_ID=  00005A     |   4 POKE       0030E1 R
    POKE_IDX=  000060     |   4 PORTA      0030C4 R   |   4 PORTB      0030BA R
  4 PORTC      0030B0 R   |   4 PORTD      0030A6 R   |   4 PORTE      00309C R
  4 PORTF      003092 R   |   4 PORTG      003088 R   |   4 PORTH      00307E R
  4 PORTI      003074 R   |   4 POUT       0030D8 R   |     POUT_IDX=  000062 
    PREV    =  000001     |   4 PRINT      0030CE R   |     PROD    =  000001 
    PROD_SIG=  000004     |   4 PROG_ADD   001E5F R   |   4 PROG_SIZ   001E71 R
    PRTA_IDX=  000066     |     PRTB_IDX=  000068     |     PRTC_IDX=  00006A 
    PRTD_IDX=  00006C     |     PRTE_IDX=  00006E     |     PRTF_IDX=  000070 
    PRTG_IDX=  000072     |     PRTH_IDX=  000074     |     PRTI_IDX=  000076 
    PRT_IDX =  000064     |     PSIZE   =  000001     |     PSTR    =  000003 
  4 QKEY       00306B R   |     QKEY_IDX=  000078     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001E9A R
    RAM_SIZE=  001800     |     RBT_IDX =  00007C     |   4 READ       003062 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    READ_IDX=  00007A     |   4 REBOOT     003057 R   |     RECLEN  =  000005 
  4 REG_A      00052E R   |   4 REG_CC     000532 R   |   4 REG_EPC    000521 R
  4 REG_SP     000537 R   |   4 REG_X      00052A R   |   4 REG_Y      000526 R
    RELOP   =  000001     |   4 REM        00304F R   |     REM_IDX =  00007E 
  4 RESTORE    003043 R   |     REST_IDX=  000080     |     RETL1   =  000001 
  4 RETURN     003038 R   |     RET_ADDR=  000003     |     RET_BPTR=  000003 
    RET_IDX =  000082     |     RET_INW =  000005     |   4 RND        003030 R
    RND_IDX =  000084     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     003025 R   |     RSHIFT_I=  000086     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        00301D R   |     RUN_IDX =  000088 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       003014 R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002855 R
  4 SIZE       00300B R   |     SIZE_IDX=  0000B2     |     SKIP    =  000005 
  4 SLEEP      003001 R   |     SLEEP_ID=  00008C     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      002FF7 R
    SPIEN_ID=  000090     |   4 SPIRD      002FED R   |     SPIRD_ID=  00008E 
  4 SPISEL     002FE2 R   |     SPISEL_I=  000092     |   4 SPIWR      002FD8 R
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
  4 STATES     0004E4 R   |   4 STEP       002FCF R   |     STEP_IDX=  000096 
  4 STOP       002FC6 R   |     STOP_IDX=  000098     |     STR     =  000003 
  4 STR_BYTE   001E82 R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TARGET  =  000001     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      002FBC R   |     TICKS_ID=  00009A     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    002FB0 R   |   4 TIMER      002FA6 R   |     TIMER_ID=  00009C 
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
    TMROUT_I=  00009E     |   4 TO         002F9F R   |   4 TONE       002F96 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     002F8B R   |     UBOUND_I=  0000A4     |   4 UBTN_Han   000068 R
  4 UFLASH     002F80 R   |     UFLASH_I=  0000A6     |   4 UNTIL      002F76 R
    UNTIL_ID=  0000A8     |     UPDATE  =  000006     |     US      =  00001F 
  4 USER_ABO   000070 R   |   4 USR        002F6E R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000AA 
  4 Uart1RxH   00089E R   |   4 UserButt   000044 R   |     VAL1    =  02FFFF 
    VAL2    =  00002A     |     VAL3    =  000003     |     VAL4    =  0005FF 
    VAL5    =  FFFFFFFD     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       002F65 R   |     WAIT_IDX=  0000AC     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   4 WORDS      002F5B R   |     WORDS_ID=  0000AE 
  4 WRITE      002F51 R   |     WRITE_ID=  0000B0     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        002F49 R
    XOR_IDX =  0000FE     |     XSAVE   =  000002     |     XSTACK_E=  001773 
    XSTACK_S=  00003C     |     XTEMP   =  000001     |     YSAVE   =  000007 
    YTEMP   =  000003     |   4 abs        002A59 R   |   4 abs24      0001DF R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000BCC R   |   4 add24      00016A R
  4 add_char   001337 R   |   4 add_spac   00112F R   |   4 analog_r   002610 R
  4 and_cond   001B16 R   |   4 and_fact   001AE6 R   |   4 app        003484 R
  4 app_sign   003480 R   |   4 app_size   003482 R   |   4 app_spac   003480 GR
  4 arduino_   002B48 R   |   4 arg_list   001918 R   |   5 array_si   000020 R
  4 ascii      002909 R   |   4 at_tst     000FA1 R   |   4 atoi24     001838 GR
  4 atoi_exi   0018A9 R   |   4 awu        002A00 R   |   4 awu02      002A13 R
  4 bad_port   002984 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       002587 R   |   4 beep_1kh   00255A GR  |   4 bin_exit   000E08 R
  4 bit_rese   002163 R   |   4 bit_set    002141 R   |   4 bit_test   0021A8 R
  4 bit_togg   002186 R   |   4 bitmask    002CFF R   |   4 bkslsh_t   000F4E R
  4 bksp       000977 R   |   2 block_bu   0016B8 GR  |   4 block_er   00078C R
  4 break_po   0026FC R   |   4 bye        0029CC R   |   4 clear_ba   0014A3 R
  4 clear_bl   0027AC R   |   4 clear_va   0013FB R   |   4 clock_in   00008B R
  4 cloop_1    001D8B R   |   4 cmd_cons   001D65 R   |   4 cmd_end    002526 R
  4 cmd_get    00252D R   |   4 cmd_itf    00053C R   |   4 cmd_line   0016D6 R
  4 cmd_name   001357 R   |   4 cmd_on     0023DA R   |   4 cmd_size   001C02 R
  4 cold_sta   0000C3 R   |   4 colon_ts   000F75 R   |   4 comma_ts   000F80 R
  4 comp_msg   001626 R   |   4 compile    00109B GR  |   4 conditio   001B68 R
  4 const_cr   002DA7 R   |   4 const_cr   002DAC R   |   4 const_dd   002DA2 R
  4 const_ee   002DBB R   |   4 const_id   002D9D R   |   4 const_in   002DB6 R
  4 const_lo   001D86 R   |   4 const_od   002D98 R   |   4 const_ou   002DB1 R
  4 const_po   002D6B R   |   4 const_po   002D70 R   |   4 const_po   002D75 R
  4 const_po   002D7A R   |   4 const_po   002D7F R   |   4 const_po   002D84 R
  4 const_po   002D89 R   |   4 const_po   002D8E R   |   4 const_po   002D93 R
  4 convert_   000D78 R   |   4 convert_   00093B R   |   4 copy_com   000FD6 R
  5 count      000003 GR  |   4 cp24       0001A4 R   |   4 cp24_ax    0001D6 R
  4 cp_loop    0018C9 R   |   4 cpl24      0001E6 R   |   4 cpy_cmd_   001117 R
  4 cpy_quot   001157 R   |   4 create_g   000CA2 R   |   4 cs_high    002F3D R
  4 dash_tst   000F96 R   |   4 data       002DC0 R   |   4 data_err   002E39 R
  5 data_len   000009 R   |   5 data_ofs   000008 R   |   5 data_ptr   000006 R
  4 dec_base   001BE1 R   |   4 decomp_l   0011EF R   |   4 decompil   0011A7 GR
  4 del_line   000C75 R   |   4 delete_l   000A64 R   |   4 delete_n   000987 R
  4 delete_u   000A29 R   |   4 digital_   00264C R   |   4 digital_   002683 R
  4 div24      0002F3 R   |   4 divu24_8   0002D5 R   |   4 do_loop    002D25 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 do_progr   00077F R   |   4 edit       001F4E R   |   4 enable_i   002C8F R
  4 eql_tst    001021 R   |   4 equal      00134A R   |   4 erase      002724 R
  4 erase_ex   0007B0 R   |   4 erase_fl   0007A6 R   |   4 err_bad_   001587 R
  4 err_buf_   0015FD R   |   4 err_cmd_   00154B R   |   4 err_div0   001510 R
  4 err_dupl   001565 R   |   4 err_math   0014F7 R   |   4 err_mem_   0014DC R
  4 err_msg    0014BA R   |   4 err_no_a   001593 R   |   4 err_no_d   0015C6 R
  4 err_no_f   0015EA R   |   4 err_no_l   00151F R   |   4 err_no_p   0015D6 R
  4 err_not_   001576 R   |   4 err_over   00160A R   |   4 err_run_   001535 R
  4 err_synt   0014E9 R   |   4 escaped    000D8D GR  |   4 expect     001906 R
  4 expressi   001A4F R   |   4 factor     001964 R   |   5 farptr     000018 R
  4 fcpu       002ACA R   |   4 fetchc     00062C R   |   4 fill_wri   00279C R
  4 final_te   000BC5 R   |   4 first_li   001EF8 R   |   5 flags      000022 GR
  4 for        00223E R   |   4 free       001BE6 R   |   5 free_eep   000024 R
  7 free_ram   000080 R   |   4 func_arg   001913 R   |   4 func_cha   0028F2 R
  4 func_eef   001CF8 R   |   4 ge         00134C R   |   4 get_addr   001776 R
  4 get_arra   001934 R   |   4 get_char   001790 R   |   4 get_cons   001C7D R
  4 get_esca   000947 R   |   4 get_int2   001780 R   |   4 get_targ   00236B R
  4 get_targ   002379 R   |   4 get_tick   002A52 R   |   4 get_toke   000EE7 GR
  4 getc       000920 GR  |   4 gosub      002486 R   |   4 gosub_1    002491 R
  4 gosub_2    002497 R   |   4 goto       00246C R   |   4 goto_1     002476 R
  4 gpio       002959 R   |   4 gt         001348 R   |   4 gt_tst     00102C R
  4 hex_base   001BDC R   |   4 hex_dump   00066C R   |   4 if         002221 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   000882 R   |   4 input_ex   0020F9 R   |   4 input_lo   002063 R
  4 input_va   00205F R   |   4 insert_c   0009E6 R   |   4 insert_l   000CCE R
  4 insert_l   000D3D R   |   4 interp_l   001717 R   |   4 interpre   0016F2 R
  4 invalid    000581 R   |   4 invalid_   000602 R   |   4 is_alnum   000E3B GR
  4 is_alpha   000E21 GR  |   4 is_data_   002DC6 R   |   4 is_digit   000E32 GR
  4 is_symbo   000E44 R   |   4 itoa       0017D3 GR  |   4 itoa_loo   0017F5 R
  4 jp_to_ta   002479 R   |   4 key        002948 R   |   4 kword_di   0032CC GR
  4 kword_en   002F47 R   |   4 le         001351 R   |   4 ledoff     000437 R
  4 ledon      000432 R   |   4 ledtoggl   00043C R   |   4 left_par   000445 R
  4 let        001C3A GR  |   4 let_arra   001C48 R   |   4 let_eval   001C50 R
  4 let_var    001C4D R   |   4 lines_sk   001EFB R   |   4 list       001EA9 R
  4 list_con   001C8C R   |   4 list_exi   001F3D R   |   4 list_loo   001F1B R
  4 log2       002CD2 R   |   4 look_tar   00239C R   |   4 loop_bac   00234E R
  5 loop_dep   00001F R   |   4 loop_don   002363 R   |   4 lshift     002A70 R
  4 lt         00134F R   |   4 lt_tst     001055 R   |   4 mem_peek   00059E R
  4 mod24      0003A1 R   |   4 move       0013B7 GR  |   4 move_dow   0013D6 R
  4 move_era   00070E R   |   4 move_exi   0013F7 R   |   4 move_lef   0009BE R
  4 move_loo   0013DB R   |   4 move_prg   00074E R   |   4 move_rig   0009CC R
  4 move_up    0013C8 R   |   4 mul24      000265 R   |   4 mul_char   001339 R
  4 mulu24_8   000226 R   |   4 nbr_tst    000F1A R   |   4 ne         001354 R
  4 neg24      0001EF R   |   4 neg_acc2   000209 R   |   4 neg_ax     000201 R
  4 new        00271A R   |   4 next       0022F6 R   |   4 next_lin   0016FA R
  4 next_tok   00174E GR  |   4 no_match   0018DB R   |   4 number     000632 R
  4 other      00107E R   |   4 overwrit   000BF1 R   |   2 pad        0016B8 GR
  4 pad_ref    002F42 R   |   4 parse_bi   000DE6 R   |   4 parse_in   000D95 R
  4 parse_ke   000E67 R   |   4 parse_qu   000D40 R   |   4 parse_sy   000E4F R
  4 pause      0029E0 R   |   4 pause02    0029F3 R   |   4 peek       002200 R
  4 peek_byt   0005CC R   |   4 pin_mode   002AD9 R   |   4 plus_tst   000FF5 R
  4 poke       0021DF R   |   4 power_ad   0025C0 R   |   4 prcnt_ts   001016 R
  4 print      001FB6 R   |   4 print_fa   000611 R   |   4 print_he   000C28 GR
  4 print_re   000491 R   |   4 print_st   000591 R   |   4 print_to   0017BB R
  4 prog_siz   001E18 R   |   4 program_   001E20 R   |   4 program_   000728 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 program_   00074E R   |   4 prt_acc2   0017AD R   |   4 prt_basi   001F92 R
  4 prt_i16    001796 R   |   4 prt_loop   001FBA R   |   4 prt_peek   000414 GR
  4 prt_reg1   000472 R   |   4 prt_reg8   000450 R   |   4 prt_regs   0003AA GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000910 GR
  4 puts       00096D GR  |   4 qgetc      000919 GR  |   4 qkey       00294C GR
  4 qmark_ts   000FAC R   |   4 qsign      002795 R   |   4 random     002B68 R
  4 read       002E3E R   |   4 read01     002E43 R   |   4 read_int   003443 R
  4 readln     000A72 GR  |   4 readln_l   000A81 R   |   4 readln_q   000C0E R
  4 refresh_   002CCD R   |   4 regs_sta   0003ED R   |   4 relation   001A87 R
  4 relop_st   00133C R   |   4 remark     0020FE GR  |   4 repl       00054A R
  4 repl_exi   000572 R   |   4 reset_co   001FB8 R   |   4 rest_con   00204F R
  4 restore    002DD4 R   |   4 return     0024AC R   |   4 right_al   001145 GR
  4 row_alig   000867 R   |   4 row_eras   0006E1 R   |   4 row_eras   00070E R
  4 row_loop   00064F R   |   4 rparnt_t   000F6A R   |   4 rshift     002A9D R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     001614 R
  4 run        0024CA R   |   4 run_app    000135 R   |   4 run_it     0024FC R
  4 run_it_0   0024FE R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027C0 R   |   4 save_con   00203F R
  4 scan_blo   000890 R   |   4 search_c   001D21 R   |   4 search_d   0018BB GR
  4 search_e   001903 R   |   4 search_l   000C4A GR  |   4 search_l   000C59 R
  4 search_n   0018BF R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002B38 R   |   4 send_esc   000995 R   |   4 send_par   0009A0 R
  4 set_data   002E0A R   |   4 set_time   002C6D R   |   4 sharp_ts   000F8B R
  4 show_row   00063D R   |   4 single_c   001332 R   |   4 skip       000ED4 R
  4 skip_str   001767 R   |   4 slash_ts   00100B R   |   4 sleep      0029D5 R
  4 software   00140A R   |   4 spaces     0009DA GR  |   4 spi_clea   002ED7 R
  4 spi_disa   002EBF R   |   4 spi_enab   002E8C R   |   4 spi_rcv_   002EF9 R
  4 spi_read   002F24 R   |   4 spi_sele   002F2B R   |   4 spi_send   002EE3 R
  4 spi_writ   002F04 R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   001000 R   |   4 step       0022B4 R   |   4 stop       0026CE R
  4 store_lo   0022E3 R   |   4 str_matc   0018E8 R   |   4 str_tst    000F0A R
  4 strcmp     001396 R   |   4 strcpy     0013A7 GR  |   4 strlen     00138B GR
  4 sub24      000187 R   |   4 symb_loo   000E50 R   |   4 syntax_e   001647 GR
  4 system_i   001450 R   |   5 tab_widt   000023 GR  |   4 tb_error   001649 GR
  4 term       001A0C R   |   4 term01     001A14 R   |   4 term_exi   001A4C R
  4 test       0032D4 R   |   4 test_p     000589 R   |   2 tib        001668 GR
  4 tick_tst   000FC4 R   |   5 ticks      00000F R   |   4 timeout    002C84 R
  5 timer      000012 GR  |   4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R
  4 tk_id      001637 R   |   4 to         00226E R   |   4 to_eepro   000777 R
  4 to_flash   00077C R   |   4 to_hex_c   000C3F GR  |   4 to_upper   00182C GR
  4 token_ch   001094 R   |   4 token_ex   001098 R   |   4 tone       002565 R
  4 try_next   002E17 R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   000920 GR  |   4 uart1_in   0008CB R   |   4 uart1_pu   000910 GR
  4 uart1_qg   000919 GR  |   4 uart1_se   0008DB R   |   4 ubound     001C2F R
  4 uflash     002989 R   |   4 unlock_e   0006AB R   |   4 unlock_f   0006C6 R
  4 until      002D38 R   |   4 user_int   000057 R   |   4 usr        0029A6 R
  4 var_name   00119D GR  |   5 vars       000030 GR  |   4 wait       002104 R
  4 warm_ini   001481 R   |   4 warm_sta   0016D3 R   |   4 words      002C03 R
  4 words_co   002C57 R   |   4 write      0028AF R   |   4 write_bl   00082C GR
  4 write_bu   000768 R   |   4 write_by   0007B2 R   |   4 write_ee   0007EE R
  4 write_ex   000827 R   |   4 write_fl   0007D8 R   |   4 write_nb   000851 R
  2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3484   flags    0
   5 DATA       size     7E   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

