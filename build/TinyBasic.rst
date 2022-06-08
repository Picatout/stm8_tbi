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
      008050 82 00 88 EC             74 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      0080D7 CD 89 BB         [ 4]  164 	call puts 
      0080DA                        165 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  166     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  167     ldw sp,x
      0080DE 9A               [ 1]  168 	rim 
      0080DF CC 97 63         [ 2]  169 5$:	jp warm_start
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
      008180 CD 89 19         [ 4]  263 	call uart1_init
                                    264 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  265     bset PE_CR2,#USR_BTN_BIT 
                                    266 ; display system information
      008187 9A               [ 1]  267 	rim ; enable interrupts 
      008188 72 5C 00 18      [ 1]  268 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  269 	inc seedx+1 
      008190 CD 9D 73         [ 4]  270 	call func_eefree 
      008193 CD 9D 14         [ 4]  271 	call ubound 
      008196 CD 94 F1         [ 4]  272 	call clear_basic
      008199 CD A5 F6         [ 4]  273 	call beep_1khz  
      00819C CD 94 9E         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for application in flash memory 
      00819F AE B7 80         [ 2]  277 	ldw x,#app_space
      0081A2 CD A8 92         [ 4]  278 	call qsign 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 63         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
                                    282 ; run application in FLASH|EEPROM 
      0081AA 90 CE 17 73      [ 2]  283 	ldw y,XSTACK_EMPTY
      0081AE CD 94 CF         [ 4]  284 	call warm_init
      0081B1 AE B7 84         [ 2]  285 	ldw x,#app 
      0081B4 CF 00 1C         [ 2]  286 	ldw txtbgn,x
      0081B7 72 BB B7 82      [ 2]  287 	addw x,app_size 
      0081BB CF 00 1E         [ 2]  288 	ldw txtend,x 
      0081BE AE 81 CC         [ 2]  289 	ldw x,#AUTO_RUN 
      0081C1 CD 89 BB         [ 4]  290 	call puts 
      0081C4 CD 9E 95         [ 4]  291 	call program_info 
      0081C7 CC A5 91         [ 2]  292 	jp run_it_02  
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
      0082DF CC 96 D9         [ 2]  208     jp tb_error 
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



      008356 CC 96 D9         [ 2]  282     jp tb_error 
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
      00839A CC 96 D9         [ 2]  348     jp tb_error 
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
      00841F CD 98 83         [ 4]   51 	call prt_i16  
      008422 A6 3A            [ 1]   52 	ld a,#': 
      008424 CD 89 5E         [ 4]   53 	call putc 
      008427 A6 20            [ 1]   54 	ld a,#SPACE 
      008429 CD 89 5E         [ 4]   55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00842C 85               [ 2]   56 	popw x 
      00842D F6               [ 1]   57 	ld a,(x)
      00842E 5F               [ 1]   58 	clrw x 
      00842F 97               [ 1]   59 	ld xl,a 
      008430 35 0A 00 0B      [ 1]   60 	mov base,#10 
      008434 CD 98 83         [ 4]   61 	call prt_i16 
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
      00844D CD 89 5E         [ 4]   87 	call putc
      008450 A6 28            [ 1]   88 	ld a,#'( 
      008452 CD 89 5E         [ 4]   89 	call putc 	
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
      008457 CD 89 BB         [ 4]  102 	call puts 
      00845A 7B 01            [ 1]  103 	ld a,(1,sp) 
      00845C 5F               [ 1]  104 	clrw x 
      00845D 97               [ 1]  105 	ld xl,a 
      00845E 35 10 00 0B      [ 1]  106 	mov base,#16
      008462 CD 98 83         [ 4]  107 	call prt_i16  
      008465 CD 84 4B         [ 4]  108 	call left_paren 
      008468 84               [ 1]  109 	pop a 
      008469 5F               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00846A 97               [ 1]  111 	ld xl,a 
      00846B 35 0A 00 0B      [ 1]  112 	mov base,#10 
      00846F CD 98 83         [ 4]  113 	call prt_i16  
      008472 A6 29            [ 1]  114 	ld a,#') 
      008474 CD 89 5E         [ 4]  115 	call putc
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
      00847A CD 89 BB         [ 4]  128 	call puts 
      00847D 1E 01            [ 2]  129 	ldw x,(1,sp) 
      00847F 35 10 00 0B      [ 1]  130 	mov base,#16 
      008483 CD 98 83         [ 4]  131 	call prt_i16  
      008486 CD 84 4B         [ 4]  132 	call left_paren 
      008489 85               [ 2]  133 	popw x 
      00848A 35 0A 00 0B      [ 1]  134 	mov base,#10 
      00848E CD 98 83         [ 4]  135 	call prt_i16  
      008491 A6 29            [ 1]  136 	ld a,#') 
      008493 CD 89 5E         [ 4]  137 	call putc
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
      0084AD CD 89 BB         [ 4]  163 	call puts
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
      0084EA CD 89 5E         [ 4]  191 	call putc
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
      00855A CD 8F 22         [ 4]  219 	call skip  	 
      00855D 72 B9 00 01      [ 2]  220 	addw y,in.w 
      008561 AE 16 E0         [ 2]  221 	ldw x,#pad 
      008564 CD 93 F5         [ 4]  222 	call strcpy
      008567 AE 16 E0         [ 2]  223 	ldw x,#pad
      00856A CD 99 25         [ 4]  224 	call atoi24 	
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
      008599 CD 89 5E         [ 4]  263 	call putc 
      00859C A6 3F            [ 1]  264 	ld a,#'? 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00859E CD 89 5E         [ 4]  265 	call putc
      0085A1 72 5F 00 01      [ 1]  266 	clr in.w 
      0085A5 72 5F 00 02      [ 1]  267 	clr in 
      0085A9 CD 8A C0         [ 4]  268 	call readln
      0085AC 90 AE 16 90      [ 2]  269 	ldw y,#tib  
      0085B0 90 F6            [ 1]  270 	ld a,(y)
      0085B2 27 E3            [ 1]  271 	jreq repl  
      0085B4 72 5C 00 02      [ 1]  272 	inc in 
      0085B8 CD 99 19         [ 4]  273 	call to_upper 
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
      0085E0 CD 89 BB         [ 4]  294 	call puts 
      0085E3 20 B2            [ 2]  295 	jra repl 
      0085E5                        296 test_p:	
      0085E5 A1 50            [ 1]  297     cp a,#'P 
      0085E7 27 10            [ 1]  298 	jreq mem_peek
      0085E9 A1 53            [ 1]  299     cp a,#'S 
      0085EB 26 F0            [ 1]  300 	jrne invalid 
      0085ED                        301 print_string:
      0085ED CD 85 58         [ 4]  302 	call parse_addr 	
      0085F0 CE 00 0E         [ 2]  303 	ldw x,acc16
      0085F3 CD 89 BB         [ 4]  304 	call puts
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
      00862A CD 98 9A         [ 4]  328 	call prt_acc24
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
      008669 CD 98 9A         [ 4]  355 	call prt_acc24
      00866C A6 20            [ 1]  356 	ld a,#SPACE 
      00866E CD 89 5E         [ 4]  357 	call putc 
      008671 CD 89 5E         [ 4]  358 	call putc 
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
      00867B CD 8F 35         [ 4]  385 	call get_token
      00867E A1 84            [ 1]  386 	cp a,#TK_INTGR
      008680 27 03            [ 1]  387 	jreq 1$
      008682 CC 96 D7         [ 2]  388 	jp syntax_error
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
      008690 CD 98 83         [ 4]  412 	call prt_i16 
      008693 A6 20            [ 1]  413 	ld a,#SPACE  
      008695 CD 89 5E         [ 4]  414 	call putc
      008698                        415 row_loop:
      008698 1E 02            [ 2]  416 	ldw x,(ADR,sp)
      00869A F6               [ 1]  417 	ld a,(x)
      00869B 5F               [ 1]  418 	clrw x 
      00869C 97               [ 1]  419 	ld xl,a 
      00869D CD 98 83         [ 4]  420 	call prt_i16 
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
      0086B1 CD 89 5E         [ 4]  429 	call putc 
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
      0086C8 CD 89 5E         [ 4]  452 	call putc 
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
      00876A CD 94 05         [ 4]  105 	call move
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
      0087AA CD 94 05         [ 4]  157 	call move
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
      0087BB A3 B7 80         [ 2]  174 	cpw x,#app_space  
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
      0087DE A3 B7 80         [ 2]  202 	cpw x,#app_space 
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
      00880D 90 A3 B7 80      [ 2]  242     cpw y,#app_space 	 
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
      008871 CD 88 D0         [ 4]  287 	call incr_farptr
      008874 5F               [ 1]  288 	clrw x 
      0007F5                        289 	_drop VSIZE 
      008875 5B 02            [ 2]    1     addw sp,#VSIZE 
      008877 90 85            [ 2]  290 	popw y
      008879 81               [ 4]  291     ret
                                    292 
                                    293 ;--------------------------------------------
                                    294 ; write a data block to eeprom or flash 
                                    295 ; the block must be erased before 
                                    296 ; using this routine.
                                    297 ; input:
                                    298 ;   Y        source address   
                                    299 ;   X        array index  destination  farptr[x]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                    300 ;   BSIZE    block size bytes 
                                    301 ;   farptr   write address , byte* 
                                    302 ; output:
                                    303 ;	X 		after last byte written 
                                    304 ;   Y 		after last byte read 
                                    305 ;  farptr   point after block
                                    306 ;---------------------------------------------
      00887A                        307 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      0007FA                        308 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    309 	; local var 
                           000001   310 	XSAVE=1 
                           000002   311 	VSIZE=2 
      0007FA                        312 write_block::
      00887A 88               [ 1]  313 	push a 
      0007FB                        314 	_vars VSIZE
      00887B 52 02            [ 2]    1     sub sp,#VSIZE 
      00887D 1F 01            [ 2]  315 	ldw (XSAVE,sp),x 
      00887F 1E 06            [ 2]  316 	ldw x,(BSIZE,sp) 
      008881 27 13            [ 1]  317 	jreq 9$
      008883 1E 01            [ 2]  318 1$:	ldw x,(XSAVE,sp)
      008885 90 F6            [ 1]  319 	ld a,(y)
      008887 CD 87 FB         [ 4]  320 	call write_byte 
      00888A 5C               [ 1]  321 	incw x 
      00888B 90 5C            [ 1]  322 	incw y 
      00888D 1F 01            [ 2]  323 	ldw (XSAVE,sp),x
      00888F 1E 06            [ 2]  324 	ldw x,(BSIZE,sp)
      008891 5A               [ 2]  325 	decw x
      008892 1F 06            [ 2]  326 	ldw (BSIZE,sp),x 
      008894 26 ED            [ 1]  327 	jrne 1$
      008896                        328 9$:
      008896 1E 01            [ 2]  329 	ldw x,(XSAVE,sp)
      008898 CD 88 D0         [ 4]  330 	call incr_farptr
      00081B                        331 	_drop VSIZE
      00889B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00889D 84               [ 1]  332 	pop a 
      00889E 81               [ 4]  333 	ret 
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
      00889F                        350 write_nbytes:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00889F 90 89            [ 2]  351 	pushw y
      0088A1 88               [ 1]  352 	push a 
      0088A2 90 93            [ 1]  353 	ldw y,x
      0088A4 5F               [ 1]  354 	clrw x 
      0088A5                        355 1$:  
      0088A5 90 F6            [ 1]  356 	ld a,(y)
      0088A7 90 5C            [ 1]  357 	incw y
      0088A9 CD 87 FB         [ 4]  358 	call write_byte 
      0088AC 5C               [ 1]  359 	incw x 
      0088AD 0A 01            [ 1]  360 	dec (1,sp)  
      0088AF 26 F4            [ 1]  361 	jrne 1$ 
      0088B1 84               [ 1]  362 9$: pop a 
      0088B2 90 85            [ 2]  363 	popw y 
      0088B4 81               [ 4]  364 	ret 
                                    365 
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    367 ;;;  flash memory operations
                                    368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    369 
                                    370 ;--------------------------
                                    371 ; align farptr to BLOCK_SIZE 
                                    372 ;---------------------------
      0088B5                        373 row_align:
      0088B5 A6 7F            [ 1]  374 	ld a,#0x7f 
      0088B7 C4 00 1B         [ 1]  375 	and a,farptr+2 
      0088BA 27 13            [ 1]  376 	jreq 1$ 
      0088BC CE 00 1A         [ 2]  377 	ldw x,farptr+1 
      0088BF 1C 00 80         [ 2]  378 	addw x,#BLOCK_SIZE 
      0088C2 24 04            [ 1]  379 	jrnc 0$
      0088C4 72 5C 00 19      [ 1]  380 	inc farptr 
      0088C8 9F               [ 1]  381 0$: ld a,xl 
      0088C9 A4 80            [ 1]  382 	and a,#0x80
      0088CB 97               [ 1]  383 	ld xl,a
      0088CC CF 00 1A         [ 2]  384 	ldw farptr+1,x  	
      0088CF 81               [ 4]  385 1$:	ret
                                    386 
                                    387 ;--------------------
                                    388 ; input:
                                    389 ;   X     increment 
                                    390 ; output:
                                    391 ;   farptr  incremented 
                                    392 ;---------------------
      0088D0                        393 incr_farptr:
      0088D0 72 BB 00 1A      [ 2]  394 	addw x,farptr+1 
      0088D4 24 04            [ 1]  395 	jrnc 1$
      0088D6 72 5C 00 19      [ 1]  396 	inc farptr 
      0088DA CF 00 1A         [ 2]  397 1$:	ldw farptr+1,x  
      0088DD 81               [ 4]  398 	ret 
                                    399 
                                    400 ;-----------------------------------
                                    401 ; scan block for non zero byte 
                                    402 ; block are 128 bytes 
                                    403 ; input:
                                    404 ;    farptr     address block  
                                    405 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                    406 ;     A     0 cleared, other not cleared  
                                    407 ;-----------------------------------
      0088DE                        408 scan_block:
      0088DE 5F               [ 1]  409 	clrw x 
      0088DF 92 AF 00 19      [ 5]  410 1$: ldf a,([farptr],x) 
      0088E3 26 06            [ 1]  411 	jrne 2$
      0088E5 5C               [ 1]  412 	incw x 
      0088E6 A3 00 80         [ 2]  413 	cpw x,#BLOCK_SIZE 
      0088E9 25 F4            [ 1]  414 	jrult 1$ 
      0088EB 81               [ 4]  415 2$:	ret 
                                    416 
                                    417 
                                    418 
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
      0088EC                         66 Uart1RxHandler: ; console receive char 
      0088EC 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0088F1 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0088F4 A1 03            [ 1]   69 	cp a,#CTRL_C 
      0088F6 26 06            [ 1]   70 	jrne 2$
      0088F8 CD 89 5E         [ 4]   71 	call putc 
      0088FB CC 80 C9         [ 2]   72 	jp user_interrupted
      0088FE                         73 2$:
      0088FE A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008900 26 03            [ 1]   75 	jrne 3$
      008902 CC 81 35         [ 2]   76 	jp cold_start 	
      008905 88               [ 1]   77 3$:	push a 
      008906 A6 27            [ 1]   78 	ld a,#rx1_queue 
      008908 CB 00 30         [ 1]   79 	add a,rx1_tail 
      00890B 5F               [ 1]   80 	clrw x 
      00890C 97               [ 1]   81 	ld xl,a 
      00890D 84               [ 1]   82 	pop a 
      00890E F7               [ 1]   83 	ld (x),a 
      00890F C6 00 30         [ 1]   84 	ld a,rx1_tail 
      008912 4C               [ 1]   85 	inc a 
      008913 A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      008915 C7 00 30         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      008918 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008919                         97 uart1_init:
      008919 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      00891D 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008921 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      008925 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008929                        103 uart1_set_baud: 
      008929 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00892A A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      00892C C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      00892F 27 0A            [ 1]  109 	jreq 2$ 
      008931                        110 1$: ; 8 Mhz 	
      008931 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008935 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008939 20 08            [ 2]  113 	jra 3$
      00893B                        114 2$: ; 16 Mhz 	
      00893B 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00893F 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      008943                        117 3$:
      008943 72 5F 52 31      [ 1]  118     clr UART1_DR
      008947 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00894B 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00894F 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      008954 72 5F 00 2F      [ 1]  122     clr rx1_head 
      008958 72 5F 00 30      [ 1]  123 	clr rx1_tail
      00895C 84               [ 1]  124 	pop a  
      00895D 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      00895E                        133 putc:: ; console output always on UART1
      00895E                        134 uart1_putc:: 
      00895E 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      008963 C7 52 31         [ 1]  136 	ld UART1_DR,a 
      008966 81               [ 4]  137 	ret 
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
      008967                        148 qgetc::
      008967                        149 uart1_qgetc::
      008967 C6 00 2F         [ 1]  150 	ld a,rx1_head 
      00896A C0 00 30         [ 1]  151 	sub a,rx1_tail 
      00896D 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      00896E                        161 getc:: ;console input
      00896E                        162 uart1_getc::
      00896E CD 89 67         [ 4]  163 	call uart1_qgetc
      008971 27 FB            [ 1]  164 	jreq uart1_getc 
      008973 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      008974 A6 27            [ 1]  167 	ld a,#rx1_queue
      008976 CB 00 2F         [ 1]  168 	add a,rx1_head 
      008979 5F               [ 1]  169 	clrw x  
      00897A 97               [ 1]  170 	ld xl,a 
      00897B F6               [ 1]  171 	ld a,(x)
      00897C 88               [ 1]  172 	push a
      00897D C6 00 2F         [ 1]  173 	ld a,rx1_head 
      008980 4C               [ 1]  174 	inc a 
      008981 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      008983 C7 00 2F         [ 1]  176 	ld rx1_head,a 
      008986 84               [ 1]  177 	pop a  
      008987 85               [ 2]  178 	popw x
      008988 81               [ 4]  179 	ret 
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
      008989 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      008995                        207 get_escape:
      008995 CD 89 6E         [ 4]  208     call getc 
      008998 A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      00899A 27 02            [ 1]  210     jreq 1$
      00899C 4F               [ 1]  211     clr a
      00899D 81               [ 4]  212     ret
      00899E CD 89 6E         [ 4]  213 1$: call getc 
      0089A1 AE 89 89         [ 2]  214     ldw x,#convert_table
      0089A4                        215 2$:
      0089A4 F1               [ 1]  216     cp a,(x)
      0089A5 27 08            [ 1]  217     jreq 4$
      0089A7 1C 00 02         [ 2]  218     addw x,#2
      0089AA 7D               [ 1]  219     tnz (x)
      0089AB 26 F7            [ 1]  220     jrne 2$
      0089AD 4F               [ 1]  221     clr a
      0089AE 81               [ 4]  222     ret 
      0089AF 5C               [ 1]  223 4$: incw x 
      0089B0 F6               [ 1]  224     ld a,(x)
      0089B1 A1 84            [ 1]  225     cp a,#SUP
      0089B3 26 05            [ 1]  226     jrne 5$
      0089B5 88               [ 1]  227     push a 
      0089B6 CD 89 6E         [ 4]  228     call getc
      0089B9 84               [ 1]  229     pop a 
      0089BA                        230 5$:
      0089BA 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089BB                        241 puts::
      0089BB F6               [ 1]  242     ld a,(x)
      0089BC 27 06            [ 1]  243 	jreq 1$
      0089BE CD 89 5E         [ 4]  244 	call putc 
      0089C1 5C               [ 1]  245 	incw x 
      0089C2 20 F7            [ 2]  246 	jra puts 
      0089C4 81               [ 4]  247 1$:	ret 
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
      0089C5                        258 bksp:
      0089C5 A6 08            [ 1]  259 	ld a,#BS 
      0089C7 CD 89 5E         [ 4]  260 	call putc 
      0089CA A6 20            [ 1]  261 	ld a,#SPACE 
      0089CC CD 89 5E         [ 4]  262 	call putc 
      0089CF A6 08            [ 1]  263 	ld a,#BS 
      0089D1 CD 89 5E         [ 4]  264 	call putc 
      0089D4 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0089D5                        274 delete_nchar:
      0089D5 88               [ 1]  275 	push a 
      0089D6 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0089D8 27 07            [ 1]  277 	jreq 1$
      0089DA CD 89 C5         [ 4]  278 	call bksp 
      0089DD 0A 01            [ 1]  279 	dec (1,sp)
      0089DF 20 F5            [ 2]  280 	jra 0$
      0089E1 84               [ 1]  281 1$:	pop a 
      0089E2 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0089E3                        290 send_escape:
      0089E3 A6 1B            [ 1]  291 	ld a,#ESC 
      0089E5 CD 89 5E         [ 4]  292 	call putc 
      0089E8 A6 5B            [ 1]  293 	ld a,#'[
      0089EA CD 89 5E         [ 4]  294 	call putc 
      0089ED 81               [ 4]  295 	ret 
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
      0089EE                        311 send_parameter:
      0089EE 89               [ 2]  312 	pushw x 
      0089EF 5F               [ 1]  313 	clrw x 
      0089F0 97               [ 1]  314 	ld xl,a 
      0089F1 A6 0A            [ 1]  315 	ld a,#10 
      0089F3 62               [ 2]  316 	div x,a 
      0089F4 95               [ 1]  317 	ld xh,a 
      0089F5 9F               [ 1]  318 	ld a,xl
      0089F6 4D               [ 1]  319     tnz a 
      0089F7 27 0B            [ 1]  320     jreq 2$
      0089F9 A1 09            [ 1]  321 	cp a,#9 
      0089FB 23 02            [ 2]  322 	jrule 1$
      0089FD A6 09            [ 1]  323 	ld a,#9
      0089FF                        324 1$:
      0089FF AB 30            [ 1]  325 	add a,#'0 
      008A01 CD 89 5E         [ 4]  326 	call putc
      008A04 9E               [ 1]  327 2$:	ld a,xh 
      008A05 AB 30            [ 1]  328 	add a,#'0
      008A07 CD 89 5E         [ 4]  329 	call putc 
      008A0A 85               [ 2]  330 	popw x 
      008A0B 81               [ 4]  331 	ret 
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
      008A0C                        344 move_left:
      008A0C 88               [ 1]  345 	push a 
      008A0D CD 89 E3         [ 4]  346 	call send_escape
      008A10 84               [ 1]  347     pop a
      008A11 CD 89 EE         [ 4]  348 	call send_parameter 
      008A14 A6 44            [ 1]  349 	ld a,#'D 
      008A16 CD 89 5E         [ 4]  350 	call putc 
      008A19 81               [ 4]  351 	ret	
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



      008A1A                        362 move_right:
      008A1A 88               [ 1]  363 	push a 
      008A1B CD 89 E3         [ 4]  364 	call send_escape
      008A1E 84               [ 1]  365     pop a
      008A1F CD 89 EE         [ 4]  366 	call send_parameter 
      008A22 A6 43            [ 1]  367 	ld a,#'C 
      008A24 CD 89 5E         [ 4]  368 	call putc 
      008A27 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A28                        379 spaces::
      008A28 A6 20            [ 1]  380 	ld a,#SPACE 
      008A2A 5D               [ 2]  381 1$:	tnzw x
      008A2B 27 06            [ 1]  382 	jreq 9$
      008A2D CD 89 5E         [ 4]  383 	call putc 
      008A30 5A               [ 2]  384 	decw x
      008A31 20 F7            [ 2]  385 	jra 1$
      008A33                        386 9$: 
      008A33 81               [ 4]  387 	ret 
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
      008A34                        405 insert_char: 
      0009B4                        406 	_vars VSIZE 
      008A34 52 03            [ 2]    1     sub sp,#VSIZE 
      008A36 6B 02            [ 1]  407     ld (KCHAR,sp),a 
      008A38 9E               [ 1]  408     ld a,xh 
      008A39 6B 01            [ 1]  409 	ld (IPOS,sp),a
      008A3B 9F               [ 1]  410     ld a,xl 
      008A3C 6B 03            [ 1]  411     ld (LLEN,sp),a  
      008A3E 93               [ 1]  412     ldw x,y
      008A3F 5C               [ 1]  413     incw x 
      008A40 7B 03            [ 1]  414     ld a,(LLEN,sp)
      008A42 10 01            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      008A44 4C               [ 1]  416     inc a 
      008A45 C7 00 0F         [ 1]  417     ld acc8,a 
      008A48 72 5F 00 0E      [ 1]  418     clr acc16
      008A4C CD 94 05         [ 4]  419     call move
      008A4F 90 AE 16 90      [ 2]  420     ldw y,#tib 
      008A53 7B 01            [ 1]  421     ld a,(IPOS,sp)
      008A55 C7 00 0F         [ 1]  422     ld acc8,a 
      008A58 72 B9 00 0E      [ 2]  423     addw y,acc16 
      008A5C 7B 02            [ 1]  424     ld a,(KCHAR,sp)
      008A5E 90 F7            [ 1]  425     ld (y),a
      008A60 90 5C            [ 1]  426     incw y  
      008A62 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008A64 CD 8A 0C         [ 4]  428     call move_left
      008A67 AE 16 90         [ 2]  429     ldw x,#tib 
      008A6A CD 89 BB         [ 4]  430     call puts 
      008A6D 7B 03            [ 1]  431     ld a,(LLEN,sp)
      008A6F 10 01            [ 1]  432     sub a,(IPOS,sp) 
      008A71 CD 8A 0C         [ 4]  433     call move_left 
      0009F4                        434 	_drop VSIZE 
      008A74 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A76 81               [ 4]  435 	ret 
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
      008A77                        448 delete_under:
      0009F7                        449 	_vars VSIZE 
      008A77 52 02            [ 2]    1     sub sp,#VSIZE 
      008A79 6B 02            [ 1]  450     ld (LLEN,sp),a 
      008A7B 9F               [ 1]  451     ld a,xl 
      008A7C 6B 01            [ 1]  452     ld (CPOS,sp),a 
      008A7E 93               [ 1]  453     ldw x,y ; move destination
      008A7F 90 5C            [ 1]  454     incw y  ; move source 
      008A81 7B 02            [ 1]  455     ld a,(LLEN,sp)
      008A83 10 01            [ 1]  456     sub a,(CPOS,sp)
      008A85 4C               [ 1]  457     inc a ; move including zero at end.
      008A86 C7 00 0F         [ 1]  458     ld acc8,a 
      008A89 72 5F 00 0E      [ 1]  459     clr acc16 
      008A8D CD 94 05         [ 4]  460 	call move 
      008A90 90 AE 16 90      [ 2]  461     ldw y,#tib 
      008A94 7B 01            [ 1]  462     ld a,(CPOS,sp)
      008A96 C7 00 0F         [ 1]  463     ld acc8,a 
      008A99 72 B9 00 0E      [ 2]  464     addw y,acc16 
      008A9D 93               [ 1]  465     ldw x,y 
      008A9E CD 89 BB         [ 4]  466     call puts 
      008AA1 A6 20            [ 1]  467     ld a,#SPACE  
      008AA3 CD 89 5E         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008AA6 7B 02            [ 1]  469     ld a,(LLEN,sp)
      008AA8 10 01            [ 1]  470     sub a,(CPOS,sp)
      008AAA CD 8A 0C         [ 4]  471     call move_left 
      008AAD 0A 02            [ 1]  472     dec (LLEN,sp)
      000A2F                        473 	_drop VSIZE 
      008AAF 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AB1 81               [ 4]  474 	ret 
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
      008AB2                        486 delete_line:
      008AB2 CD 89 E3         [ 4]  487     call send_escape
      008AB5 A6 32            [ 1]  488 	ld a,#'2
      008AB7 CD 89 5E         [ 4]  489 	call putc 
      008ABA A6 4B            [ 1]  490 	ld a,#'K 
      008ABC CD 89 5E         [ 4]  491 	call putc 
      008ABF 81               [ 4]  492 	ret 
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
      008AC0                        524 readln::
      008AC0 90 89            [ 2]  525 	pushw y 
      000A42                        526 	_vars VSIZE 
      008AC2 52 04            [ 2]    1     sub sp,#VSIZE 
      008AC4 5F               [ 1]  527 	clrw x 
      008AC5 1F 02            [ 2]  528 	ldw (LL,sp),x 
      008AC7 1F 03            [ 2]  529 	ldw (CPOS,sp),x 
      008AC9 03 04            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008ACB 90 AE 16 90      [ 2]  531  	ldw y,#tib ; terminal input buffer
      008ACF                        532 readln_loop:
      008ACF CD 89 6E         [ 4]  533 	call getc
      008AD2 6B 01            [ 1]  534 	ld (RXCHAR,sp),a
      008AD4 A1 1B            [ 1]  535     cp a,#ESC 
      008AD6 26 05            [ 1]  536     jrne 0$
      008AD8 CD 89 95         [ 4]  537     call get_escape 
      008ADB 6B 01            [ 1]  538     ld (RXCHAR,sp),a 
      008ADD A1 0D            [ 1]  539 0$:	cp a,#CR
      008ADF 26 03            [ 1]  540 	jrne 1$
      008AE1 CC 8C 5C         [ 2]  541 	jp readln_quit
      008AE4 A1 0A            [ 1]  542 1$:	cp a,#LF 
      008AE6 26 03            [ 1]  543 	jrne 2$ 
      008AE8 CC 8C 5C         [ 2]  544 	jp readln_quit
      008AEB                        545 2$:
      008AEB A1 08            [ 1]  546 	cp a,#BS
      008AED 26 12            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      008AEF 0D 03            [ 1]  549     tnz (CPOS,sp)
      008AF1 27 DC            [ 1]  550     jreq readln_loop 
      008AF3 A6 01            [ 1]  551     ld a,#1 
      008AF5 CD 8A 0C         [ 4]  552     call move_left
      008AF8 0A 03            [ 1]  553     dec (CPOS,sp)
      008AFA 90 5A            [ 2]  554     decw y 
      008AFC 7B 03            [ 1]  555     ld a,(CPOS,sp) 
      008AFE CC 8C 08         [ 2]  556     jp 12$
      008B01                        557 3$:
      008B01 A1 04            [ 1]  558 	cp a,#CTRL_D
      008B03 26 1A            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      008B05 CD 8A B2         [ 4]  561 	call delete_line 
      008B08 7B 03            [ 1]  562     ld a,(CPOS,sp)
      008B0A 4C               [ 1]  563     inc a 
      008B0B CD 8A 0C         [ 4]  564     call move_left 
      008B0E A6 3E            [ 1]  565 	ld a,#'> 
      008B10 CD 89 5E         [ 4]  566 	call putc 
      008B13 90 AE 16 90      [ 2]  567 	ldw y,#tib
      008B17 90 7F            [ 1]  568 	clr (y)
      008B19 0F 02            [ 1]  569 	clr (LL,sp)
      008B1B 0F 03            [ 1]  570 	clr (CPOS,sp)
      008B1D 20 B0            [ 2]  571 	jra readln_loop
      008B1F                        572 4$:
      008B1F A1 12            [ 1]  573 	cp a,#CTRL_R 
      008B21 26 1E            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      008B23 0D 02            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008B25 26 A8            [ 1]  577 	jrne readln_loop
      008B27 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008B2B 93               [ 1]  579 	ldw x,y
      008B2C CD 93 D9         [ 4]  580 	call strlen
      008B2F 4D               [ 1]  581 	tnz a  
      008B30 27 9D            [ 1]  582 	jreq readln_loop
      008B32 6B 02            [ 1]  583 	ld (LL,sp),a 
      008B34 6B 03            [ 1]  584     ld (CPOS,sp),a
      008B36 93               [ 1]  585 	ldw x,y  
      008B37 CD 89 BB         [ 4]  586 	call puts
      008B3A 0F 01            [ 1]  587 	clr (LL_HB,sp)
      008B3C 72 F9 01         [ 2]  588 	addw y,(LL_HB,sp)
      008B3F 20 8E            [ 2]  589 	jra readln_loop 
      008B41                        590 5$:
      008B41 A1 05            [ 1]  591 	cp a,#CTRL_E 
      008B43 26 41            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008B45 AE 16 90         [ 2]  594 	ldw x,#tib 
      008B48 CD 99 25         [ 4]  595 	call atoi24
      008B4B CE 00 0E         [ 2]  596 	ldw x,acc16
      008B4E CD 8C 98         [ 4]  597 	call search_lineno
      008B51 5D               [ 2]  598 	tnzw x 
      008B52 26 03            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008B54 CC 8C 5C         [ 2]  603 	jp readln_quit  
      008B57                        604 51$:
      008B57 CF 00 05         [ 2]  605 	ldw basicptr,x
      008B5A E6 02            [ 1]  606 	ld a,(2,x)
      008B5C C7 00 04         [ 1]  607 	ld count,a 
      008B5F 90 AE 16 90      [ 2]  608 	ldw y,#tib 
      008B63 CD 91 F5         [ 4]  609 	call decompile 
      008B66 0F 01            [ 1]  610 	clr (LL_HB,sp)
      008B68 A6 0D            [ 1]  611 	ld a,#CR 
      008B6A CD 89 5E         [ 4]  612 	call putc 
      008B6D A6 3E            [ 1]  613 	ld a,#'>
      008B6F CD 89 5E         [ 4]  614 	call putc
      008B72 AE 16 90         [ 2]  615     ldw x,#tib  
      008B75 CD 93 D9         [ 4]  616 	call strlen 
      008B78 6B 02            [ 1]  617 	ld (LL,sp),a 
      008B7A CD 89 BB         [ 4]  618 	call puts 
      008B7D 90 93            [ 1]  619 	ldw y,x
      008B7F 7B 02            [ 1]  620     ld a,(LL,sp)
      008B81 6B 03            [ 1]  621     ld (CPOS,sp),a  
      008B83 CC 8A CF         [ 2]  622 	jp readln_loop
      008B86                        623 6$:
      008B86 A1 81            [ 1]  624 	cp a,#ARROW_RIGHT
      008B88 26 15            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008B8A 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008B8C 11 02            [ 1]  628     cp a,(LL,sp)
      008B8E 2B 03            [ 1]  629     jrmi 61$
      008B90 CC 8A CF         [ 2]  630     jp readln_loop 
      008B93                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B93 A6 01            [ 1]  632     ld a,#1 
      008B95 CD 8A 1A         [ 4]  633 	call move_right 
      008B98 0C 03            [ 1]  634 	inc (CPOS,sp)
      008B9A 90 5C            [ 1]  635     incw y 
      008B9C CC 8A CF         [ 2]  636     jp readln_loop 
      008B9F A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008BA1 26 13            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008BA3 0D 03            [ 1]  640 	tnz (CPOS,sp)
      008BA5 26 03            [ 1]  641 	jrne 71$
      008BA7 CC 8A CF         [ 2]  642 	jp readln_loop
      008BAA                        643 71$:
      008BAA A6 01            [ 1]  644     ld a,#1 
      008BAC CD 8A 0C         [ 4]  645 	call move_left 
      008BAF 0A 03            [ 1]  646 	dec (CPOS,sp)
      008BB1 90 5A            [ 2]  647     decw y 
      008BB3 CC 8A CF         [ 2]  648 	jp readln_loop 
      008BB6 A1 82            [ 1]  649 8$: cp a,#HOME  
      008BB8 26 0E            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008BBA 7B 03            [ 1]  652     ld a,(CPOS,sp)
      008BBC CD 8A 0C         [ 4]  653     call move_left 
      008BBF 0F 03            [ 1]  654 	clr (CPOS,sp)
      008BC1 90 AE 16 90      [ 2]  655     ldw y,#tib 
      008BC5 CC 8A CF         [ 2]  656 	jp readln_loop  
      008BC8 A1 83            [ 1]  657 9$: cp a,#KEY_END  
      008BCA 26 26            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008BCC 7B 03            [ 1]  660 	ld a,(CPOS,sp)
      008BCE 11 02            [ 1]  661 	cp a,(LL,sp)
      008BD0 26 03            [ 1]  662 	jrne 91$
      008BD2 CC 8A CF         [ 2]  663 	jp readln_loop 
      008BD5                        664 91$:
      008BD5 7B 02            [ 1]  665 	ld a,(LL,sp)
      008BD7 10 03            [ 1]  666 	sub a,(CPOS,sp)
      008BD9 CD 8A 1A         [ 4]  667 	call move_right 
      008BDC 7B 02            [ 1]  668 	ld a,(LL,sp)
      008BDE 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008BE0 90 AE 16 90      [ 2]  670     ldw y,#tib
      008BE4 72 5F 00 0E      [ 1]  671     clr acc16 
      008BE8 C7 00 0F         [ 1]  672     ld acc8,a 
      008BEB 72 B9 00 0E      [ 2]  673     addw y,acc16  
      008BEF CC 8A CF         [ 2]  674 	jp readln_loop 
      008BF2 A1 0F            [ 1]  675 10$: cp a,#CTRL_O
      008BF4 26 08            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008BF6 03 04            [ 1]  678 	cpl (OVRWR,sp)
      008BF8 CD A5 F6         [ 4]  679 	call beep_1khz
      008BFB CC 8A CF         [ 2]  680 	jp readln_loop 
      008BFE A1 84            [ 1]  681 11$: cp a,#SUP 
      008C00 26 11            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008C02 7B 03            [ 1]  684     ld a,(CPOS,sp)
      008C04 11 02            [ 1]  685     cp a,(LL,sp)
      008C06 2A 08            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008C08                        687 12$:
      008C08 97               [ 1]  688     ld xl,a    ; cursor position 
      008C09 7B 02            [ 1]  689     ld a,(LL,sp)  ; line length
      008C0B CD 8A 77         [ 4]  690     call delete_under
      008C0E 0A 02            [ 1]  691     dec (LLEN,sp)
      008C10                        692 13$:
      008C10 CC 8A CF         [ 2]  693     jp readln_loop 
      008C13                        694 final_test:
      008C13 A1 20            [ 1]  695 	cp a,#SPACE
      008C15 2A 03            [ 1]  696 	jrpl accept_char
      008C17 CC 8A CF         [ 2]  697 	jp readln_loop
      008C1A                        698 accept_char:
      008C1A A6 4F            [ 1]  699 	ld a,#TIB_SIZE-1
      008C1C 11 02            [ 1]  700 	cp a, (LL,sp)
      008C1E 2A 03            [ 1]  701 	jrpl 1$
      008C20 CC 8A CF         [ 2]  702 	jp readln_loop
      008C23 0D 04            [ 1]  703 1$:	tnz (OVRWR,sp)
      008C25 26 18            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008C27 7B 03            [ 1]  706     ld a,(CPOS,sp)
      008C29 11 02            [ 1]  707     cp a,(LL,sp)
      008C2B 27 12            [ 1]  708     jreq overwrite
      008C2D 7B 02            [ 1]  709     ld a,(LL,sp)
      008C2F 97               [ 1]  710     ld xl,a 
      008C30 7B 03            [ 1]  711     ld a,(CPOS,sp)
      008C32 95               [ 1]  712     ld xh,a
      008C33 7B 01            [ 1]  713     ld a,(RXCHAR,sp)
      008C35 CD 8A 34         [ 4]  714     call insert_char
      008C38 0C 02            [ 1]  715     inc (LLEN,sp)
      008C3A 0C 03            [ 1]  716     inc (CPOS,sp)	
      008C3C CC 8A CF         [ 2]  717     jp readln_loop 
      008C3F                        718 overwrite:
      008C3F 7B 01            [ 1]  719 	ld a,(RXCHAR,sp)
      008C41 90 F7            [ 1]  720 	ld (y),a
      008C43 90 5C            [ 1]  721     incw y
      008C45 CD 89 5E         [ 4]  722     call putc 
      008C48 7B 03            [ 1]  723 	ld a,(CPOS,sp)
      008C4A 11 02            [ 1]  724 	cp a,(LL,sp)
      008C4C 2B 09            [ 1]  725 	jrmi 1$
      008C4E 90 7F            [ 1]  726 	clr (y)
      008C50 0C 02            [ 1]  727 	inc (LL,sp)
      008C52 0C 03            [ 1]  728     inc (CPOS,sp)
      008C54 CC 8A CF         [ 2]  729 	jp readln_loop 
      008C57                        730 1$:	
      008C57 0C 03            [ 1]  731 	inc (CPOS,sp)
      008C59 CC 8A CF         [ 2]  732 	jp readln_loop 
      008C5C                        733 readln_quit:
      008C5C 90 AE 16 90      [ 2]  734 	ldw y,#tib
      008C60 0F 01            [ 1]  735     clr (LL_HB,sp) 
      008C62 72 F9 01         [ 2]  736     addw y,(LL_HB,sp)
      008C65 90 7F            [ 1]  737     clr (y)
      008C67 7B 02            [ 1]  738 	ld a,(LL,sp)
      008C69 C7 00 04         [ 1]  739 	ld count,a 
      008C6C A6 0D            [ 1]  740 	ld a,#CR
      008C6E CD 89 5E         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      000BF1                        742 	_drop VSIZE 
      008C71 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C73 90 85            [ 2]  743 	popw y 
      008C75 81               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      008C76                        752 print_hex::
      008C76 88               [ 1]  753 	push a 
      008C77 4E               [ 1]  754 	swap a 
      008C78 CD 8C 8D         [ 4]  755 	call to_hex_char 
      008C7B CD 89 5E         [ 4]  756 	call putc 
      008C7E 7B 01            [ 1]  757     ld a,(1,sp) 
      008C80 CD 8C 8D         [ 4]  758 	call to_hex_char
      008C83 CD 89 5E         [ 4]  759 	call putc
      008C86 A6 20            [ 1]  760 	ld a,#SPACE 
      008C88 CD 89 5E         [ 4]  761 	call putc 
      008C8B 84               [ 1]  762 	pop a 
      008C8C 81               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008C8D                        772 to_hex_char::
      008C8D A4 0F            [ 1]  773 	and a,#15 
      008C8F A1 09            [ 1]  774 	cp a,#9 
      008C91 23 02            [ 2]  775 	jrule 1$ 
      008C93 AB 07            [ 1]  776 	add a,#7
      008C95 AB 30            [ 1]  777 1$: add a,#'0 
      008C97 81               [ 4]  778 	ret 
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
      008C98                         51 search_lineno::
      000C18                         52 	_vars VSIZE
      008C98 52 02            [ 2]    1     sub sp,#VSIZE 
      008C9A 0F 01            [ 1]   53 	clr (LL,sp)
      008C9C 90 CE 00 1C      [ 2]   54 	ldw y,txtbgn
      008CA0 4D               [ 1]   55 	tnz a 
      008CA1 27 04            [ 1]   56 	jreq search_ln_loop
      008CA3 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008CA7                         58 search_ln_loop:
      008CA7 90 C3 00 1E      [ 2]   59 	cpw y,txtend 
      008CAB 2A 10            [ 1]   60 	jrpl 8$
      008CAD 90 F3            [ 1]   61 	cpw x,(y)
      008CAF 27 0E            [ 1]   62 	jreq 9$
      008CB1 2B 0A            [ 1]   63 	jrmi 8$ 
      008CB3 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CB6 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CB8 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008CBB 20 EA            [ 2]   67 	jra search_ln_loop 
      008CBD                         68 8$: 
      008CBD 5F               [ 1]   69 	clrw x 	
      008CBE 51               [ 1]   70 	exgw x,y 
      000C3F                         71 9$: _drop VSIZE
      008CBF 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CC1 51               [ 1]   72 	exgw x,y   
      008CC2 81               [ 4]   73 	ret 
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
      008CC3                         83 del_line: 
      000C43                         84 	_vars VSIZE 
      008CC3 52 04            [ 2]    1     sub sp,#VSIZE 
      008CC5 E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008CC7 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008CC9 0F 01            [ 1]   87 	clr (LLEN,sp)
      008CCB 90 93            [ 1]   88 	ldw y,x  
      008CCD 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008CD0 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008CD2 90 CE 00 1E      [ 2]   91 	ldw y,txtend 
      008CD6 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008CD9 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008CDD 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008CDF CD 94 05         [ 4]   95 	call move
      008CE2 90 CE 00 1E      [ 2]   96 	ldw y,txtend 
      008CE6 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008CE9 90 CF 00 1E      [ 2]   98 	ldw txtend,y  
      000C6D                         99 	_drop VSIZE     
      008CED 5B 04            [ 2]    1     addw sp,#VSIZE 
      008CEF 81               [ 4]  100 	ret 
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
      008CF0                        115 create_gap:
      000C70                        116 	_vars VSIZE
      008CF0 52 06            [ 2]    1     sub sp,#VSIZE 
      008CF2 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008CF4 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008CF6 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008CFA 90 93            [ 1]  120 	ldw y,x ; SRC
      008CFC 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008D00 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008D02 CE 00 1E         [ 2]  124 	ldw x,txtend 
      008D05 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008D08 CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D0B 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D0D CD 94 05         [ 4]  128 	call move
      008D10 CE 00 1E         [ 2]  129 	ldw x,txtend
      008D13 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D16 CF 00 1E         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      000C99                        132 9$:	_drop VSIZE 
      008D19 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D1B 81               [ 4]  133 	ret 
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
      008D1C                        150 insert_line:
      000C9C                        151 	_vars VSIZE 
      008D1C 52 08            [ 2]    1     sub sp,#VSIZE 
      008D1E CE 00 1E         [ 2]  152 	ldw x,txtend  
      008D21 C3 00 1C         [ 2]  153 	cpw x,txtbgn 
      008D24 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D26 AE 00 02         [ 2]  156 	ldw x,#2 
      008D29 72 D6 00 1A      [ 4]  157 	ld a,([ptr16],x)
      008D2D A1 03            [ 1]  158 	cp a,#3
      008D2F 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D31 5F               [ 1]  160 	clrw x 
      008D32 97               [ 1]  161 	ld xl,a
      008D33 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D35 CE 00 1C         [ 2]  163 	ldw x,txtbgn
      008D38 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D3A CE 00 1E         [ 2]  165 	ldw x,txtend 
      008D3D 20 38            [ 2]  166 	jra 4$
      008D3F 72 CE 00 1A      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D43 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D45 AE 00 02         [ 2]  170 	ldw x,#2 
      008D48 72 D6 00 1A      [ 4]  171 	ld a,([ptr16],x)
      008D4C 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D4D 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D4F 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D51 4F               [ 1]  177 	clr a 
      008D52 CD 8C 98         [ 4]  178 	call search_lineno 
      008D55 5D               [ 2]  179 	tnzw x 
      008D56 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D58 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D5A 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008D5C 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008D5E CD 8C C3         [ 4]  188 	call del_line
      008D61                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008D61 A6 03            [ 1]  192 	ld a,#3
      008D63 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008D65 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008D67 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008D69 C3 00 1E         [ 2]  198 	cpw x,txtend 
      008D6C 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008D6E 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008D70 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008D72 CD 8C F0         [ 4]  204 	call create_gap
      008D75 20 06            [ 2]  205 	jra 5$
      008D77                        206 4$: 
      008D77 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008D7A CF 00 1E         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008D7D 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008D7F CF 00 0E         [ 2]  211 	ldw acc16,x 
      008D82 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      008D86 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008D88 CD 94 05         [ 4]  214 	call move 
      008D8B                        215 insert_ln_exit:	
      000D0B                        216 	_drop VSIZE
      008D8B 5B 08            [ 2]    1     addw sp,#VSIZE 
      008D8D 81               [ 4]  217 	ret
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
      008D8E                        233 parse_quote: 
      000D0E                        234 	_vars VSIZE 
      008D8E 52 02            [ 2]    1     sub sp,#VSIZE 
      008D90 4F               [ 1]  235 	clr a
      008D91 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008D93                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008D93 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008D96 27 24            [ 1]  239 	jreq 6$
      008D98 72 5C 00 02      [ 1]  240 	inc in 
      008D9C 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008D9E A6 5C            [ 1]  242 	ld a,#'\
      008DA0 11 01            [ 1]  243 	cp a, (PREV,sp)
      008DA2 26 0A            [ 1]  244 	jrne 3$
      008DA4 0F 01            [ 1]  245 	clr (PREV,sp)
      008DA6 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008DA8 AD 1C            [ 4]  247 	callr convert_escape
      008DAA F7               [ 1]  248 	ld (x),a 
      008DAB 5C               [ 1]  249 	incw x 
      008DAC 20 E5            [ 2]  250 	jra 2$
      008DAE                        251 3$:
      008DAE 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DB0 A1 5C            [ 1]  253 	cp a,#'\'
      008DB2 27 DD            [ 1]  254 	jreq 1$
      008DB4 A1 22            [ 1]  255 	cp a,#'"
      008DB6 27 04            [ 1]  256 	jreq 6$ 
      008DB8 F7               [ 1]  257 	ld (x),a 
      008DB9 5C               [ 1]  258 	incw x 
      008DBA 20 D7            [ 2]  259 	jra 2$
      008DBC                        260 6$:
      008DBC 7F               [ 1]  261 	clr (x)
      008DBD 5C               [ 1]  262 	incw x 
      008DBE 90 93            [ 1]  263 	ldw y,x 
      008DC0 5F               [ 1]  264 	clrw x 
      008DC1 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D43                        266 	_drop VSIZE
      008DC3 5B 02            [ 2]    1     addw sp,#VSIZE 
      008DC5 81               [ 4]  267 	ret 
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
      008DC6                        278 convert_escape:
      008DC6 89               [ 2]  279 	pushw x 
      008DC7 AE 8D DB         [ 2]  280 	ldw x,#escaped 
      008DCA F1               [ 1]  281 1$:	cp a,(x)
      008DCB 27 06            [ 1]  282 	jreq 2$
      008DCD 7D               [ 1]  283 	tnz (x)
      008DCE 27 09            [ 1]  284 	jreq 3$
      008DD0 5C               [ 1]  285 	incw x 
      008DD1 20 F7            [ 2]  286 	jra 1$
      008DD3 1D 8D DB         [ 2]  287 2$: subw x,#escaped 
      008DD6 9F               [ 1]  288 	ld a,xl 
      008DD7 AB 07            [ 1]  289 	add a,#7
      008DD9 85               [ 2]  290 3$:	popw x 
      008DDA 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    292 
      008DDB 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008DE3                        310 parse_integer: ; { -- n }
      008DE3 89               [ 2]  311 	pushw x 	
      008DE4 4B 00            [ 1]  312 	push #0 ; TCHAR
      008DE6 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008DE8 A1 24            [ 1]  314 	cp a,#'$
      008DEA 26 04            [ 1]  315 	jrne 2$ 
      000D6C                        316     _drop #1
      008DEC 5B 01            [ 2]    1     addw sp,##1 
      008DEE 4B 10            [ 1]  317 	push #16  ; BASE=16
      008DF0 F7               [ 1]  318 2$:	ld (x),a 
      008DF1 5C               [ 1]  319 	incw x 
      008DF2 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008DF5 72 5C 00 02      [ 1]  321 	inc in 
      008DF9 CD 99 19         [ 4]  322 	call to_upper 
      008DFC 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008DFE CD 8E 80         [ 4]  324 	call is_digit 
      008E01 25 ED            [ 1]  325 	jrc 2$
      008E03 A6 10            [ 1]  326 	ld a,#16 
      008E05 11 01            [ 1]  327 	cp a,(BASE,sp)
      008E07 26 0A            [ 1]  328 	jrne 3$ 
      008E09 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E0B A1 41            [ 1]  330 	cp a,#'A 
      008E0D 2B 04            [ 1]  331 	jrmi 3$ 
      008E0F A1 47            [ 1]  332 	cp a,#'G 
      008E11 2B DD            [ 1]  333 	jrmi 2$ 
      008E13 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E17 7F               [ 1]  335     clr (x)
      008E18 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E1A CD 99 25         [ 4]  337 	call atoi24
      008E1D 16 03            [ 2]  338 	ldw y,(XSAVE,sp)
      008E1F C6 00 0D         [ 1]  339 	ld a,acc24 
      008E22 90 F7            [ 1]  340 	ld (y),a 
      008E24 90 5C            [ 1]  341 	incw y  
      008E26 CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E29 90 FF            [ 2]  343 	ldw (y),x 
      008E2B 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008E2F A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DB1                        346 	_drop VSIZE  
      008E31 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E33 81               [ 4]  347 	ret 	
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
      008E34                        364 parse_binary: ; { -- n }
      008E34 4B 00            [ 1]  365 	push #0
      008E36 4B 00            [ 1]  366 	push #0
      008E38 4B 00            [ 1]  367 	push #0
      008E3A                        368 2$:	
      008E3A 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E3D 72 5C 00 02      [ 1]  370 	inc in 
      008E41 A1 30            [ 1]  371 	cp a,#'0 
      008E43 27 06            [ 1]  372 	jreq 3$
      008E45 A1 31            [ 1]  373 	cp a,#'1 
      008E47 27 02            [ 1]  374 	jreq 3$ 
      008E49 20 0B            [ 2]  375 	jra bin_exit 
      008E4B A0 30            [ 1]  376 3$: sub a,#'0 
      008E4D 46               [ 1]  377 	rrc a
      008E4E 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E50 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E52 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E54 20 E4            [ 2]  381 	jra 2$  
      008E56                        382 bin_exit:
      008E56 72 5A 00 02      [ 1]  383 	dec in 
      008E5A 90 93            [ 1]  384 	ldw y,x
      008E5C 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008E5E 90 F7            [ 1]  386 	ld (y),a 
      008E60 90 5C            [ 1]  387 	incw y 
      008E62 1E 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008E64 90 FF            [ 2]  389 	ldw (y),x 
      008E66 72 A9 00 02      [ 2]  390 	addw y,#2  
      008E6A A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000DEC                        392 	_drop VSIZE 
      008E6C 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E6E 81               [ 4]  393 	ret
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
      008E6F                        402 is_alpha::
      008E6F A1 41            [ 1]  403 	cp a,#'A 
      008E71 8C               [ 1]  404 	ccf 
      008E72 24 0B            [ 1]  405 	jrnc 9$ 
      008E74 A1 5B            [ 1]  406 	cp a,#'Z+1 
      008E76 25 07            [ 1]  407 	jrc 9$ 
      008E78 A1 61            [ 1]  408 	cp a,#'a 
      008E7A 8C               [ 1]  409 	ccf 
      008E7B 24 02            [ 1]  410 	jrnc 9$
      008E7D A1 7B            [ 1]  411 	cp a,#'z+1
      008E7F 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008E80                        421 is_digit::
      008E80 A1 30            [ 1]  422 	cp a,#'0
      008E82 25 03            [ 1]  423 	jrc 1$
      008E84 A1 3A            [ 1]  424     cp a,#'9+1
      008E86 8C               [ 1]  425 	ccf 
      008E87 8C               [ 1]  426 1$:	ccf 
      008E88 81               [ 4]  427     ret
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
      008E89                        438 is_alnum::
      008E89 CD 8E 80         [ 4]  439 	call is_digit
      008E8C 25 03            [ 1]  440 	jrc 1$ 
      008E8E CD 8E 6F         [ 4]  441 	call is_alpha
      008E91 81               [ 4]  442 1$:	ret 
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



      008E92                        453 is_symbol_char: 
      008E92 A1 5F            [ 1]  454 	cp a,#'_ 
      008E94 26 03            [ 1]  455 	jrne 1$
      008E96 99               [ 1]  456 	scf 
      008E97 20 03            [ 2]  457 	jra 9$ 
      008E99 CD 8E 89         [ 4]  458 1$:	call is_alnum 
      008E9C 81               [ 4]  459 9$: ret 
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
      008E9D                        473 parse_symbol:
      008E9D 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008E9E                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008E9E CD 99 19         [ 4]  477 	call to_upper  
      008EA1 F7               [ 1]  478 	ld (x), a 
      008EA2 5C               [ 1]  479 	incw x
      008EA3 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008EA6 72 5C 00 02      [ 1]  481 	inc in 
      008EAA CD 8E 92         [ 4]  482 	call is_symbol_char 
      008EAD 25 EF            [ 1]  483 	jrc symb_loop 
      008EAF 7F               [ 1]  484 	clr (x)
      008EB0 72 5A 00 02      [ 1]  485 	dec in  
      008EB4 81               [ 4]  486 	ret 
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
      008EB5                        502 parse_keyword: 
      008EB5 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EB6 CD 8E 9D         [ 4]  504 	call parse_symbol
      008EB9 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008EBB E6 02            [ 1]  506 	ld a,(2,x)
      008EBD 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008EBF E6 01            [ 1]  509 	ld a,(1,x) 
      008EC1 A0 41            [ 1]  510 	sub a,#'A 
      008EC3 AE 00 03         [ 2]  511 	ldw x,#3 
      008EC6 42               [ 4]  512 	mul x,a 
      008EC7 1C 00 35         [ 2]  513 	addw x,#vars 
      008ECA A6 85            [ 1]  514 	ld a,#TK_VAR 
      008ECC 20 36            [ 2]  515 	jra 4$ 
      008ECE                        516 2$: ; check for keyword, otherwise syntax error.
      000E4E                        517 	_ldx_dict kword_dict ; dictionary entry point
      008ECE AE B5 59         [ 2]    1     ldw x,#kword_dict+2
      008ED1 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008ED3 90 5C            [ 1]  519 	incw y 
      008ED5 CD 99 A6         [ 4]  520 	call search_dict
      008ED8 4D               [ 1]  521 	tnz a
      008ED9 26 29            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008EDB 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008EDD A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008EDF 90 F7            [ 1]  527 	ld (y),a 
      008EE1 90 5C            [ 1]  528 	incw y
      008EE3 93               [ 1]  529 	ldw x,y 
      008EE4 CD 93 D9         [ 4]  530 	call strlen
      008EE7 A1 0F            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008EE9 23 02            [ 2]  532 	jrule 22$ 
      008EEB A6 0F            [ 1]  533 	ld a,#NAME_MAX_LEN 
      008EED                        534 22$:	
      008EED 88               [ 1]  535 	push a 
      008EEE                        536 24$:
      008EEE 90 F6            [ 1]  537     ld a,(y)
      008EF0 27 09            [ 1]  538 	jreq 3$
      008EF2 90 5C            [ 1]  539 	incw y
      008EF4 0A 01            [ 1]  540 	dec (1,sp) 
      008EF6 26 F6            [ 1]  541 	jrne 24$
      008EF8 4F               [ 1]  542 	clr a 
      008EF9 90 F7            [ 1]  543 	ld (y),a 
      008EFB 90 5C            [ 1]  544 3$: incw y 
      000E7D                        545 	_drop 1 
      008EFD 5B 01            [ 2]    1     addw sp,#1 
      008EFF A6 03            [ 1]  546 	ld a,#TK_LABEL 
      008F01 5F               [ 1]  547 	clrw x 
      008F02 20 1B            [ 2]  548 	jra 5$ 
      008F04                        549 4$:	
      008F04 16 01            [ 2]  550 	ldw y,(XFIRST,sp)
      008F06 A1 87            [ 1]  551 	cp a,#TK_NOT 
      008F08 2B 06            [ 1]  552 	jrmi 41$
      008F0A 90 F7            [ 1]  553 	ld (y),a 
      008F0C 90 5C            [ 1]  554 	incw y 
      008F0E 20 0F            [ 2]  555 	jra 5$ 
      008F10                        556 41$:	
      008F10 A3 9D 1F         [ 2]  557 	cpw x,#let  
      008F13 27 0A            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008F15 90 F7            [ 1]  559 	ld (y),a 
      008F17 90 5C            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008F19 90 FF            [ 2]  561 	ldw (y),x
      008F1B 72 A9 00 02      [ 2]  562 	addw y,#2  
      000E9F                        563 5$:	_drop VSIZE 
      008F1F 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F21 81               [ 4]  564 	ret  	
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
      008F22                        575 skip:
      008F22 88               [ 1]  576 	push a
      008F23 91 D6 01         [ 4]  577 1$:	ld a,([in.w],y)
      008F26 27 0A            [ 1]  578 	jreq 2$
      008F28 11 01            [ 1]  579 	cp a,(C,sp)
      008F2A 26 06            [ 1]  580 	jrne 2$
      008F2C 72 5C 00 02      [ 1]  581 	inc in
      008F30 20 F1            [ 2]  582 	jra 1$
      000EB2                        583 2$: _drop 1 
      008F32 5B 01            [ 2]    1     addw sp,#1 
      008F34 81               [ 4]  584 	ret
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
      008F35                        609 get_token:: 
      000EB5                        610 	_vars VSIZE
      008F35 52 02            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      008F37                        616 0$: 
      008F37 90 AE 16 90      [ 2]  617 	ldw y,#tib    	
      008F3B A6 20            [ 1]  618 	ld a,#SPACE
      008F3D CD 8F 22         [ 4]  619 	call skip
      008F40 55 00 02 00 03   [ 1]  620 	mov in.saved,in 
      008F45 91 D6 01         [ 4]  621 	ld a,([in.w],y)
      008F48 26 05            [ 1]  622 	jrne 1$
      008F4A 90 93            [ 1]  623 	ldw y,x 
      008F4C CC 90 E6         [ 2]  624 	jp token_exit ; end of line 
      008F4F 72 5C 00 02      [ 1]  625 1$:	inc in 
      008F53 CD 99 19         [ 4]  626 	call to_upper 
      008F56 6B 01            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      008F58                        629 str_tst:  	
      000ED8                        630 	_case '"' nbr_tst
      008F58 A6 22            [ 1]    1 	ld a,#'"' 
      008F5A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F5C 26 0A            [ 1]    3 	jrne nbr_tst
      008F5E A6 02            [ 1]  631 	ld a,#TK_QSTR
      008F60 F7               [ 1]  632 	ld (x),a 
      008F61 5C               [ 1]  633 	incw x 
      008F62 CD 8D 8E         [ 4]  634 	call parse_quote
      008F65 CC 90 E6         [ 2]  635 	jp token_exit
      008F68                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008F68 A6 24            [ 1]  638 	ld a,#'$'
      008F6A 11 01            [ 1]  639 	cp a,(TCHAR,sp) 
      008F6C 27 17            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008F6E A6 26            [ 1]  642 	ld a,#'&
      008F70 11 01            [ 1]  643 	cp a,(TCHAR,sp)
      008F72 26 0A            [ 1]  644 	jrne 0$
      008F74 A6 84            [ 1]  645 	ld a,#TK_INTGR
      008F76 F7               [ 1]  646 	ld (x),a 
      008F77 5C               [ 1]  647 	incw x 
      008F78 CD 8E 34         [ 4]  648 	call parse_binary ; expect binary integer 
      008F7B CC 90 E6         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008F7E 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008F80 CD 8E 80         [ 4]  652 	call is_digit
      008F83 24 0C            [ 1]  653 	jrnc 3$
      008F85 A6 84            [ 1]  654 1$:	ld a,#TK_INTGR 
      008F87 F7               [ 1]  655 	ld (x),a 
      008F88 5C               [ 1]  656 	incw x 
      008F89 7B 01            [ 1]  657 	ld a,(TCHAR,sp)
      008F8B CD 8D E3         [ 4]  658 	call parse_integer 
      008F8E CC 90 E6         [ 2]  659 	jp token_exit 
      008F91                        660 3$: 
      000F11                        661 	_case '(' bkslsh_tst 
      008F91 A6 28            [ 1]    1 	ld a,#'(' 
      008F93 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F95 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008F97 A6 06            [ 1]  662 	ld a,#TK_LPAREN
      008F99 CC 90 E2         [ 2]  663 	jp token_char   	
      008F9C                        664 bkslsh_tst: ; character token 
      000F1C                        665 	_case '\',rparnt_tst
      008F9C A6 5C            [ 1]    1 	ld a,#'\' 
      008F9E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FA0 26 16            [ 1]    3 	jrne rparnt_tst
      008FA2 A6 04            [ 1]  666 	ld a,#TK_CHAR 
      008FA4 F7               [ 1]  667 	ld (x),a 
      008FA5 5C               [ 1]  668 	incw x 
      008FA6 91 D6 01         [ 4]  669 	ld a,([in.w],y)
      008FA9 F7               [ 1]  670 	ld (x),a 
      008FAA 5C               [ 1]  671 	incw x
      008FAB 90 93            [ 1]  672 	ldw y,x 	 
      008FAD 72 5C 00 02      [ 1]  673 	inc in  
      008FB1 5F               [ 1]  674 	clrw x 
      008FB2 97               [ 1]  675 	ld xl,a 
      008FB3 A6 04            [ 1]  676 	ld a,#TK_CHAR 
      008FB5 CC 90 E6         [ 2]  677 	jp token_exit 
      008FB8                        678 rparnt_tst:		
      000F38                        679 	_case ')' colon_tst 
      008FB8 A6 29            [ 1]    1 	ld a,#')' 
      008FBA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FBC 26 05            [ 1]    3 	jrne colon_tst
      008FBE A6 07            [ 1]  680 	ld a,#TK_RPAREN 
      008FC0 CC 90 E2         [ 2]  681 	jp token_char
      008FC3                        682 colon_tst:
      000F43                        683 	_case ':' comma_tst 
      008FC3 A6 3A            [ 1]    1 	ld a,#':' 
      008FC5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FC7 26 05            [ 1]    3 	jrne comma_tst
      008FC9 A6 0A            [ 1]  684 	ld a,#TK_COLON 
      008FCB CC 90 E2         [ 2]  685 	jp token_char  
      008FCE                        686 comma_tst:
      000F4E                        687 	_case COMMA sharp_tst 
      008FCE A6 2C            [ 1]    1 	ld a,#COMMA 
      008FD0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FD2 26 05            [ 1]    3 	jrne sharp_tst
      008FD4 A6 08            [ 1]  688 	ld a,#TK_COMMA
      008FD6 CC 90 E2         [ 2]  689 	jp token_char
      008FD9                        690 sharp_tst:
      000F59                        691 	_case SHARP dash_tst 
      008FD9 A6 23            [ 1]    1 	ld a,#SHARP 
      008FDB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FDD 26 05            [ 1]    3 	jrne dash_tst
      008FDF A6 09            [ 1]  692 	ld a,#TK_SHARP
      008FE1 CC 90 E2         [ 2]  693 	jp token_char  	 	 
      008FE4                        694 dash_tst: 	
      000F64                        695 	_case '-' at_tst 
      008FE4 A6 2D            [ 1]    1 	ld a,#'-' 
      008FE6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FE8 26 05            [ 1]    3 	jrne at_tst
      008FEA A6 11            [ 1]  696 	ld a,#TK_MINUS  
      008FEC CC 90 E2         [ 2]  697 	jp token_char 
      008FEF                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      000F6F                        699 	_case '@' qmark_tst 
      008FEF A6 40            [ 1]    1 	ld a,#'@' 
      008FF1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FF3 26 05            [ 1]    3 	jrne qmark_tst
      008FF5 A6 05            [ 1]  700 	ld a,#TK_ARRAY 
      008FF7 CC 90 E2         [ 2]  701 	jp token_char
      008FFA                        702 qmark_tst:
      000F7A                        703 	_case '?' tick_tst 
      008FFA A6 3F            [ 1]    1 	ld a,#'?' 
      008FFC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FFE 26 12            [ 1]    3 	jrne tick_tst
      009000 A6 80            [ 1]  704 	ld a,#TK_CMD  
      009002 F7               [ 1]  705 	ld (x),a 
      009003 5C               [ 1]  706 	incw x 
      009004 90 93            [ 1]  707 	ldw y,x 
      009006 AE A0 0C         [ 2]  708 	ldw x,#print
      009009 90 FF            [ 2]  709 	ldw (y),x 
      00900B 72 A9 00 02      [ 2]  710 	addw y,#2
      00900F CC 90 E6         [ 2]  711 	jp token_exit
      009012                        712 tick_tst: ; comment 
      000F92                        713 	_case TICK plus_tst 
      009012 A6 27            [ 1]    1 	ld a,#TICK 
      009014 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009016 26 2B            [ 1]    3 	jrne plus_tst
      009018 A6 80            [ 1]  714 	ld a,#TK_CMD
      00901A F7               [ 1]  715 	ld (x),a 
      00901B 5C               [ 1]  716 	incw x
      00901C 90 AE A1 54      [ 2]  717 	ldw y,#remark 
      009020 FF               [ 2]  718 	ldw (x),y 
      009021 1C 00 02         [ 2]  719 	addw x,#2  
      009024                        720 copy_comment:
      009024 90 AE 16 90      [ 2]  721 	ldw y,#tib 
      009028 72 B9 00 01      [ 2]  722 	addw y,in.w
      00902C 90 89            [ 2]  723 	pushw y 
      00902E CD 93 F5         [ 4]  724 	call strcpy
      009031 72 F2 01         [ 2]  725 	subw y,(1,sp)
      009034 90 5C            [ 1]  726 	incw y ; strlen+1 
      009036 17 01            [ 2]  727 	ldw (1,sp),y 
      009038 72 FB 01         [ 2]  728 	addw x,(1,sp) 
      000FBB                        729 	_drop 2 
      00903B 5B 02            [ 2]    1     addw sp,#2 
      00903D 4F               [ 1]  730 	clr a 
      00903E 90 93            [ 1]  731 	ldw y,x 
      009040 CC 90 E6         [ 2]  732 	jp token_exit 
      009043                        733 plus_tst:
      000FC3                        734 	_case '+' star_tst 
      009043 A6 2B            [ 1]    1 	ld a,#'+' 
      009045 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009047 26 05            [ 1]    3 	jrne star_tst
      009049 A6 10            [ 1]  735 	ld a,#TK_PLUS  
      00904B CC 90 E2         [ 2]  736 	jp token_char 
      00904E                        737 star_tst:
      000FCE                        738 	_case '*' slash_tst 
      00904E A6 2A            [ 1]    1 	ld a,#'*' 
      009050 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009052 26 05            [ 1]    3 	jrne slash_tst
      009054 A6 20            [ 1]  739 	ld a,#TK_MULT 
      009056 CC 90 E2         [ 2]  740 	jp token_char 
      009059                        741 slash_tst: 
      000FD9                        742 	_case '/' prcnt_tst 
      009059 A6 2F            [ 1]    1 	ld a,#'/' 
      00905B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00905D 26 05            [ 1]    3 	jrne prcnt_tst
      00905F A6 21            [ 1]  743 	ld a,#TK_DIV 
      009061 CC 90 E2         [ 2]  744 	jp token_char 
      009064                        745 prcnt_tst:
      000FE4                        746 	_case '%' eql_tst 
      009064 A6 25            [ 1]    1 	ld a,#'%' 
      009066 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009068 26 05            [ 1]    3 	jrne eql_tst
      00906A A6 22            [ 1]  747 	ld a,#TK_MOD
      00906C CC 90 E2         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      00906F                        750 eql_tst:
      000FEF                        751 	_case '=' gt_tst 		
      00906F A6 3D            [ 1]    1 	ld a,#'=' 
      009071 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009073 26 05            [ 1]    3 	jrne gt_tst
      009075 A6 32            [ 1]  752 	ld a,#TK_EQUAL
      009077 CC 90 E2         [ 2]  753 	jp token_char 
      00907A                        754 gt_tst:
      000FFA                        755 	_case '>' lt_tst 
      00907A A6 3E            [ 1]    1 	ld a,#'>' 
      00907C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00907E 26 23            [ 1]    3 	jrne lt_tst
      009080 A6 31            [ 1]  756 	ld a,#TK_GT 
      009082 6B 02            [ 1]  757 	ld (ATTRIB,sp),a 
      009084 91 D6 01         [ 4]  758 	ld a,([in.w],y)
      009087 72 5C 00 02      [ 1]  759 	inc in 
      00908B A1 3D            [ 1]  760 	cp a,#'=
      00908D 26 04            [ 1]  761 	jrne 1$
      00908F A6 33            [ 1]  762 	ld a,#TK_GE 
      009091 20 4F            [ 2]  763 	jra token_char  
      009093 A1 3C            [ 1]  764 1$: cp a,#'<
      009095 26 04            [ 1]  765 	jrne 2$
      009097 A6 35            [ 1]  766 	ld a,#TK_NE 
      009099 20 47            [ 2]  767 	jra token_char 
      00909B 72 5A 00 02      [ 1]  768 2$: dec in
      00909F 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      0090A1 20 3F            [ 2]  770 	jra token_char 	 
      0090A3                        771 lt_tst:
      001023                        772 	_case '<' other
      0090A3 A6 3C            [ 1]    1 	ld a,#'<' 
      0090A5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      0090A7 26 23            [ 1]    3 	jrne other
      0090A9 A6 34            [ 1]  773 	ld a,#TK_LT 
      0090AB 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      0090AD 91 D6 01         [ 4]  775 	ld a,([in.w],y)
      0090B0 72 5C 00 02      [ 1]  776 	inc in 
      0090B4 A1 3D            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      0090B6 26 04            [ 1]  778 	jrne 1$
      0090B8 A6 36            [ 1]  779 	ld a,#TK_LE 
      0090BA 20 26            [ 2]  780 	jra token_char 
      0090BC A1 3E            [ 1]  781 1$: cp a,#'>
      0090BE 26 04            [ 1]  782 	jrne 2$
      0090C0 A6 35            [ 1]  783 	ld a,#TK_NE 
      0090C2 20 1E            [ 2]  784 	jra token_char 
      0090C4 72 5A 00 02      [ 1]  785 2$: dec in 
      0090C8 7B 02            [ 1]  786 	ld a,(ATTRIB,sp)
      0090CA 20 16            [ 2]  787 	jra token_char 	
      0090CC                        788 other: ; not a special character 	 
      0090CC 7B 01            [ 1]  789 	ld a,(TCHAR,sp)
      0090CE CD 8E 6F         [ 4]  790 	call is_alpha 
      0090D1 25 03            [ 1]  791 	jrc 30$ 
      0090D3 CC 96 D7         [ 2]  792 	jp syntax_error 
      0090D6                        793 30$: 
      0090D6 CD 8E B5         [ 4]  794 	call parse_keyword
      0090D9 A3 A1 54         [ 2]  795 	cpw x,#remark 
      0090DC 26 08            [ 1]  796 	jrne token_exit 
      0090DE 93               [ 1]  797 	ldw x,y 
      0090DF CC 90 24         [ 2]  798 	jp copy_comment 
      0090E2                        799 token_char:
      0090E2 F7               [ 1]  800 	ld (x),a 
      0090E3 5C               [ 1]  801 	incw x
      0090E4 90 93            [ 1]  802 	ldw y,x 
      0090E6                        803 token_exit:
      001066                        804 	_drop VSIZE 
      0090E6 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090E8 81               [ 4]  805 	ret
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
      0090E9                        825 compile::
      0090E9 90 89            [ 2]  826 	pushw y 
      00106B                        827 	_vars VSIZE 
      0090EB 52 02            [ 2]    1     sub sp,#VSIZE 
      0090ED 55 00 1C 00 05   [ 1]  828 	mov basicptr,txtbgn
      0090F2 72 1A 00 23      [ 1]  829 	bset flags,#FCOMP 
      0090F6 A6 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      0090F8 AE 00 00         [ 2]  831 	ldw x,#0
      0090FB CF 16 E0         [ 2]  832 	ldw pad,x ; destination buffer 
      0090FE C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      009101 AE 16 E3         [ 2]  834 	ldw x,#pad+3
      009104 72 5F 00 02      [ 1]  835 	clr in 
      009108 CD 8F 35         [ 4]  836 	call get_token
      00910B A1 84            [ 1]  837 	cp a,#TK_INTGR
      00910D 26 11            [ 1]  838 	jrne 2$
      00910F A3 00 01         [ 2]  839 	cpw x,#1 
      009112 2A 05            [ 1]  840 	jrpl 1$
      009114 A6 0A            [ 1]  841 	ld a,#ERR_BAD_VALUE
      009116 CC 96 D9         [ 2]  842 	jp tb_error
      009119 CF 16 E0         [ 2]  843 1$:	ldw pad,x 
      00911C 90 AE 16 E3      [ 2]  844 	ldw y,#pad+3 
      009120 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      009124 25 05            [ 1]  846 	jrult 3$
      009126 A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      009128 CC 96 D9         [ 2]  848 	jp tb_error 
      00912B                        849 3$:	
      00912B 93               [ 1]  850 	ldw x,y 
      00912C CD 8F 35         [ 4]  851 	call get_token 
      00912F A1 00            [ 1]  852 	cp a,#TK_NONE 
      009131 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      009133 72 A2 16 E0      [ 2]  855 	subw y,#pad
      009137 90 9F            [ 1]  856     ld a,yl
      009139 AE 16 E0         [ 2]  857 	ldw x,#pad 
      00913C CF 00 1A         [ 2]  858 	ldw ptr16,x 
      00913F E7 02            [ 1]  859 	ld (2,x),a 
      009141 FE               [ 2]  860 	ldw x,(x)
      009142 27 09            [ 1]  861 	jreq 10$
      009144 CD 8D 1C         [ 4]  862 	call insert_line
      009147 72 5F 00 04      [ 1]  863 	clr  count 
      00914B 20 0F            [ 2]  864 	jra  11$ 
      00914D                        865 10$: ; line# is zero 
      00914D CE 00 1A         [ 2]  866 	ldw x,ptr16  
      009150 CF 00 05         [ 2]  867 	ldw basicptr,x 
      009153 E6 02            [ 1]  868 	ld a,(2,x)
      009155 C7 00 04         [ 1]  869 	ld count,a 
      009158 35 03 00 02      [ 1]  870 	mov in,#3 
      00915C                        871 11$:
      0010DC                        872 	_drop VSIZE 
      00915C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00915E 72 1B 00 23      [ 1]  873 	bres flags,#FCOMP 
      009162 90 85            [ 2]  874 	popw y 
      009164 81               [ 4]  875 	ret 
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
      009165                         48 cpy_cmd_name:
      009165 5D               [ 2]   49 	tnzw x 
      009166 27 14            [ 1]   50 	jreq 10$
      009168 F6               [ 1]   51 	ld a,(x)
      009169 5C               [ 1]   52 	incw x
      00916A A4 0F            [ 1]   53 	and a,#15  
      00916C 88               [ 1]   54 	push a 
      00916D 0D 01            [ 1]   55     tnz (1,sp) 
      00916F 27 0A            [ 1]   56 	jreq 9$
      009171 F6               [ 1]   57 1$:	ld a,(x)
      009172 90 F7            [ 1]   58 	ld (y),a  
      009174 5C               [ 1]   59 	incw x
      009175 90 5C            [ 1]   60 	incw y 
      009177 0A 01            [ 1]   61 	dec (1,sp)	 
      009179 26 F6            [ 1]   62 	jrne 1$
      00917B 84               [ 1]   63 9$: pop a 
      00917C                         64 10$: 
      00917C 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00917D                         75 add_space:
      00917D 90 5A            [ 2]   76 	decw y 
      00917F 90 F6            [ 1]   77 	ld a,(y)
      009181 90 5C            [ 1]   78 	incw y
      009183 A1 29            [ 1]   79 	cp a,#') 
      009185 27 05            [ 1]   80 	jreq 0$
      009187 CD 8E 89         [ 4]   81 	call is_alnum 
      00918A 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00918C                         83 0$: 
      00918C A6 20            [ 1]   84 	ld a,#SPACE 
      00918E 90 F7            [ 1]   85 	ld (y),a 
      009190 90 5C            [ 1]   86 	incw y 
      009192 81               [ 4]   87 1$: ret 
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
      009193                         99 right_align::
      009193 88               [ 1]  100 	push a 
      009194 7B 01            [ 1]  101 0$: ld a,(1,sp)
      009196 C1 00 24         [ 1]  102 	cp a,tab_width 
      009199 2A 08            [ 1]  103 	jrpl 1$
      00919B A6 20            [ 1]  104 	ld a,#SPACE 
      00919D 5A               [ 2]  105 	decw x
      00919E F7               [ 1]  106 	ld (x),a  
      00919F 0C 01            [ 1]  107 	inc (1,sp)
      0091A1 20 F1            [ 2]  108 	jra 0$ 
      0091A3 84               [ 1]  109 1$: pop a 	
      0091A4 81               [ 4]  110 	ret 
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
      0091A5                        123 cpy_quote:
      0091A5 A6 22            [ 1]  124 	ld a,#'"
      0091A7 90 F7            [ 1]  125 	ld (y),a 
      0091A9 90 5C            [ 1]  126 	incw y 
      0091AB 89               [ 2]  127 	pushw x 
      0091AC CD 98 54         [ 4]  128 	call skip_string 
      0091AF 85               [ 2]  129 	popw x 
      0091B0 F6               [ 1]  130 1$:	ld a,(x)
      0091B1 27 30            [ 1]  131 	jreq 9$
      0091B3 5C               [ 1]  132 	incw x 
      0091B4 A1 20            [ 1]  133 	cp a,#SPACE 
      0091B6 25 0E            [ 1]  134 	jrult 3$
      0091B8 90 F7            [ 1]  135 	ld (y),a
      0091BA 90 5C            [ 1]  136 	incw y 
      0091BC A1 5C            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      0091BE 26 F0            [ 1]  138 	jrne 1$ 
      0091C0                        139 2$:
      0091C0 90 F7            [ 1]  140 	ld (y),a
      0091C2 90 5C            [ 1]  141 	incw y  
      0091C4 20 EA            [ 2]  142 	jra 1$
      0091C6 88               [ 1]  143 3$: push a 
      0091C7 A6 5C            [ 1]  144 	ld a,#'\
      0091C9 90 F7            [ 1]  145 	ld (y),a 
      0091CB 90 5C            [ 1]  146 	incw y  
      0091CD 84               [ 1]  147 	pop a 
      0091CE A0 07            [ 1]  148 	sub a,#7
      0091D0 C7 00 0F         [ 1]  149 	ld acc8,a 
      0091D3 72 5F 00 0E      [ 1]  150 	clr acc16
      0091D7 89               [ 2]  151 	pushw x
      0091D8 AE 8D DB         [ 2]  152 	ldw x,#escaped 
      0091DB 72 BB 00 0E      [ 2]  153 	addw x,acc16 
      0091DF F6               [ 1]  154 	ld a,(x)
      0091E0 85               [ 2]  155 	popw x
      0091E1 20 DD            [ 2]  156 	jra 2$
      0091E3 A6 22            [ 1]  157 9$: ld a,#'"
      0091E5 90 F7            [ 1]  158 	ld (y),a 
      0091E7 90 5C            [ 1]  159 	incw y  
      0091E9 5C               [ 1]  160 	incw x 
      0091EA 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0091EB                        171 var_name::
      0091EB 1D 00 35         [ 2]  172 		subw x,#vars 
      0091EE A6 03            [ 1]  173 		ld a,#3
      0091F0 62               [ 2]  174 		div x,a 
      0091F1 9F               [ 1]  175 		ld a,xl 
      0091F2 AB 41            [ 1]  176 		add a,#'A 
      0091F4 81               [ 4]  177 		ret 
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
      0091F5                        195 decompile::
      001175                        196 	_vars VSIZE
      0091F5 52 04            [ 2]    1     sub sp,#VSIZE 
      0091F7 C6 00 0B         [ 1]  197 	ld a,base
      0091FA 6B 01            [ 1]  198 	ld (BASE_SAV,sp),a  
      0091FC C6 00 24         [ 1]  199 	ld a,tab_width 
      0091FF 6B 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      009201 17 03            [ 2]  201 	ldw (STR,sp),y   
      009203 72 CE 00 05      [ 5]  202 	ldw x,[basicptr] ; line number 
      009207 35 0A 00 0B      [ 1]  203 	mov base,#10
      00920B 35 05 00 24      [ 1]  204 	mov tab_width,#5
      00920F 72 5F 00 0D      [ 1]  205 	clr acc24 
      009213 CF 00 0E         [ 2]  206 	ldw acc16,x
      009216 4F               [ 1]  207 	clr a ; unsigned conversion 
      009217 CD 98 C0         [ 4]  208 	call itoa  
      00921A CD 91 93         [ 4]  209 	call right_align 
      00921D 88               [ 1]  210 	push a 
      00921E 90 93            [ 1]  211 1$:	ldw y,x ; source
      009220 1E 04            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      009222 CD 93 F5         [ 4]  213 	call strcpy 
      009225 90 5F            [ 1]  214 	clrw y 
      009227 84               [ 1]  215 	pop a 
      009228 90 97            [ 1]  216 	ld yl,a 
      00922A 72 F9 03         [ 2]  217 	addw y,(STR,sp)
      00922D A6 20            [ 1]  218 	ld a,#SPACE 
      00922F 90 F7            [ 1]  219 	ld (y),a 
      009231 90 5C            [ 1]  220 	incw y 
      009233 72 5F 00 24      [ 1]  221 	clr tab_width
      009237 AE 00 03         [ 2]  222 	ldw x,#3
      00923A CF 00 01         [ 2]  223 	ldw in.w,x 
      00923D                        224 decomp_loop:
      00923D 90 89            [ 2]  225 	pushw y
      00923F CD 98 3B         [ 4]  226 	call next_token 
      009242 90 85            [ 2]  227 	popw y 
      009244 4D               [ 1]  228 	tnz a  
      009245 26 03            [ 1]  229 	jrne 1$
      009247 CC 93 6A         [ 2]  230 	jp 20$
      00924A 2B 03            [ 1]  231 1$:	jrmi 2$
      00924C CC 92 DB         [ 2]  232 	jp 6$
      00924F                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      00924F A1 85            [ 1]  234 	cp a,#TK_VAR 
      009251 26 0F            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      009253 CD 91 7D         [ 4]  237 	call add_space
      009256 CD 98 63         [ 4]  238 	call get_addr   
      009259 CD 91 EB         [ 4]  239 	call var_name
      00925C 90 F7            [ 1]  240 	ld (y),a 
      00925E 90 5C            [ 1]  241 	incw y  
      009260 20 DB            [ 2]  242 	jra decomp_loop
      009262                        243 3$:
      009262 A1 84            [ 1]  244 	cp a,#TK_INTGR
      009264 26 26            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009266 CD 98 6D         [ 4]  247 	call get_int24 
      009269 C7 00 0D         [ 1]  248 	ld acc24,a 
      00926C CF 00 0E         [ 2]  249 	ldw acc16,x 
      00926F CD 91 7D         [ 4]  250 	call add_space
      009272 90 89            [ 2]  251 	pushw y 
      009274 A6 FF            [ 1]  252 	ld a,#255 ; signed conversion 
      009276 CD 98 C0         [ 4]  253 	call itoa  
      009279 16 01            [ 2]  254 	ldw y,(1,sp) 
      00927B 88               [ 1]  255 	push a 
      00927C 51               [ 1]  256 	exgw x,y 
      00927D CD 93 F5         [ 4]  257 	call strcpy 
      009280 90 5F            [ 1]  258 	clrw y
      009282 84               [ 1]  259 	pop a  
      009283 90 97            [ 1]  260 	ld yl,a 
      009285 72 F9 01         [ 2]  261 	addw y,(1,sp)
      001208                        262 	_drop 2 
      009288 5B 02            [ 2]    1     addw sp,#2 
      00928A 20 B1            [ 2]  263 	jra decomp_loop
      00928C                        264 4$: ; dictionary keyword
      00928C A1 87            [ 1]  265 	cp a,#TK_NOT 
      00928E 24 39            [ 1]  266 	jruge 50$ 
      009290 FE               [ 2]  267 	ldw x,(x)
      009291 72 5C 00 02      [ 1]  268 	inc in 
      009295 72 5C 00 02      [ 1]  269 	inc in 
      009299 A3 A1 54         [ 2]  270 	cpw x,#remark 
      00929C 26 23            [ 1]  271 	jrne 5$
      00929E CE 00 05         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      0092A1 CD 91 7D         [ 4]  274 	call add_space
      0092A4 A6 27            [ 1]  275 	ld a,#''
      0092A6 90 F7            [ 1]  276 	ld (y),a 
      0092A8 90 5C            [ 1]  277 	incw y 
      0092AA                        278 46$:
      0092AA 72 D6 00 01      [ 4]  279 	ld a,([in.w],x)
      0092AE 72 5C 00 02      [ 1]  280 	inc in  
      0092B2 90 F7            [ 1]  281 	ld (y),a 
      0092B4 90 5C            [ 1]  282 	incw y 
      0092B6 C6 00 02         [ 1]  283 	ld a,in 
      0092B9 C1 00 04         [ 1]  284 	cp a,count 
      0092BC 2B EC            [ 1]  285 	jrmi 46$
      0092BE CC 93 6A         [ 2]  286 	jp 20$  
      0092C1 A3 9D 1F         [ 2]  287 5$: cpw x,#let  
      0092C4 26 05            [ 1]  288 	jrne 54$
      0092C6 CC 92 3D         [ 2]  289 	jp decomp_loop ; down display LET
      0092C9                        290 50$:
      0092C9 5F               [ 1]  291 	clrw x 
      0092CA 97               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      0092CB                        297 54$: ; insert command name 
      0092CB CD 91 7D         [ 4]  298 	call add_space  
      0092CE 90 89            [ 2]  299 	pushw y
      0092D0 CD 93 A5         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0092D3 90 85            [ 2]  301 	popw y 
      0092D5 CD 91 65         [ 4]  302 	call cpy_cmd_name
      0092D8 CC 92 3D         [ 2]  303 	jp decomp_loop 
      0092DB                        304 6$:
                                    305 ; label?
      0092DB A1 03            [ 1]  306 	cp a,#TK_LABEL 
      0092DD 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0092DF A6 20            [ 1]  309 	ld a,#32 
      0092E1 90 F7            [ 1]  310 	ld (y),a 
      0092E3 90 5C            [ 1]  311 	incw y 
      0092E5                        312 61$:
      0092E5 89               [ 2]  313 	pushw x 
      0092E6 CD 98 54         [ 4]  314 	call skip_string 
      0092E9 85               [ 2]  315 	popw x 
      0092EA                        316 62$:	
      0092EA F6               [ 1]  317 	ld a,(x)
      0092EB 27 07            [ 1]  318 	jreq 63$ 
      0092ED 5C               [ 1]  319 	incw x  
      0092EE 90 F7            [ 1]  320 	ld (y),a 
      0092F0 90 5C            [ 1]  321 	incw y 
      0092F2 20 F6            [ 2]  322 	jra 62$ 
      0092F4                        323 63$: 
      0092F4 A6 20            [ 1]  324 	ld a,#32 
      0092F6 90 F7            [ 1]  325 	ld (y),a 
      0092F8 90 5C            [ 1]  326 	incw y 
      0092FA CC 92 3D         [ 2]  327 	jp decomp_loop
      0092FD                        328 64$:
      0092FD A1 02            [ 1]  329 	cp a,#TK_QSTR 
      0092FF 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      009301 CD 91 7D         [ 4]  332 	call add_space
      009304 CD 91 A5         [ 4]  333 	call cpy_quote  
      009307 CC 92 3D         [ 2]  334 	jp decomp_loop
      00930A                        335 7$:
      00930A A1 04            [ 1]  336 	cp a,#TK_CHAR 
      00930C 26 10            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      00930E CD 91 7D         [ 4]  339 	call add_space 
      009311 A6 5C            [ 1]  340 	ld a,#'\ 
      009313 90 F7            [ 1]  341 	ld (y),a 
      009315 90 5C            [ 1]  342 	incw y
      009317 F6               [ 1]  343 	ld a,(x)
      009318 72 5C 00 02      [ 1]  344 	inc in  
      00931C 20 06            [ 2]  345 	jra 81$
      00931E A1 0A            [ 1]  346 8$: cp a,#TK_COLON 
      009320 26 09            [ 1]  347 	jrne 9$
      009322 A6 3A            [ 1]  348 	ld a,#':
      009324                        349 81$:
      009324 90 F7            [ 1]  350 	ld (y),a 
      009326 90 5C            [ 1]  351 	incw y 
      009328                        352 82$:
      009328 CC 92 3D         [ 2]  353 	jp decomp_loop
      00932B                        354 9$: 
      00932B A1 09            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00932D 22 0A            [ 1]  356 	jrugt 10$ 
      00932F A0 05            [ 1]  357 	sub a,#TK_ARRAY 
      009331 5F               [ 1]  358 	clrw x 
      009332 97               [ 1]  359 	ld xl,a
      009333 1C 93 80         [ 2]  360 	addw x,#single_char 
      009336 F6               [ 1]  361 	ld a,(x)
      009337 20 EB            [ 2]  362 	jra 81$ 
      009339                        363 10$: 
      009339 A1 11            [ 1]  364 	cp a,#TK_MINUS 
      00933B 22 0A            [ 1]  365 	jrugt 11$
      00933D A0 10            [ 1]  366 	sub a,#TK_PLUS 
      00933F 5F               [ 1]  367 	clrw x 
      009340 97               [ 1]  368 	ld xl,a 
      009341 1C 93 85         [ 2]  369 	addw x,#add_char 
      009344 F6               [ 1]  370 	ld a,(x)
      009345 20 DD            [ 2]  371 	jra 81$
      009347                        372 11$:
      009347 A1 22            [ 1]  373     cp a,#TK_MOD 
      009349 22 0A            [ 1]  374 	jrugt 12$
      00934B A0 20            [ 1]  375 	sub a,#TK_MULT
      00934D 5F               [ 1]  376 	clrw x 
      00934E 97               [ 1]  377 	ld xl,a 
      00934F 1C 93 87         [ 2]  378 	addw x,#mul_char
      009352 F6               [ 1]  379 	ld a,(x)
      009353 20 CF            [ 2]  380 	jra 81$
      009355                        381 12$:
      009355 A0 31            [ 1]  382 	sub a,#TK_GT  
      009357 48               [ 1]  383 	sll a 
      009358 5F               [ 1]  384 	clrw x 
      009359 97               [ 1]  385 	ld xl,a 
      00935A 1C 93 8A         [ 2]  386 	addw x,#relop_str 
      00935D FE               [ 2]  387 	ldw x,(x)
      00935E F6               [ 1]  388 	ld a,(x)
      00935F 5C               [ 1]  389 	incw x 
      009360 90 F7            [ 1]  390 	ld (y),a
      009362 90 5C            [ 1]  391 	incw y 
      009364 F6               [ 1]  392 	ld a,(x)
      009365 26 BD            [ 1]  393 	jrne 81$
      009367 CC 92 3D         [ 2]  394 	jp decomp_loop 
      00936A                        395 20$: 
      00936A 90 7F            [ 1]  396 	clr (y)
      00936C 1E 03            [ 2]  397 	ldw x,(STR,sp)
      00936E 7B 01            [ 1]  398 	ld a,(BASE_SAV,sp)
      009370 C7 00 0B         [ 1]  399 	ld base,a 
      009373 7B 02            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      009375 C7 00 24         [ 1]  401 	ld tab_width,a
      009378 72 F2 03         [ 2]  402 	subw y,(STR,sp) 
      00937B 90 9F            [ 1]  403 	ld a,yl 
      0012FD                        404 	_drop VSIZE 
      00937D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00937F 81               [ 4]  405 	ret 
                                    406 
      009380 40 28 29 2C 23         407 single_char: .byte '@','(',')',',','#'
      009385 2B 2D                  408 add_char: .byte '+','-'
      009387 2A 2F 25               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00938A 93 96 93 98 93 9A 93   410 relop_str: .word gt,equal,ge,lt,ne,le 
             9D 93 A2 93 9F
      009396 3E 00                  411 gt: .asciz ">"
      009398 3D 00                  412 equal: .asciz "="
      00939A 3E 3D 00               413 ge: .asciz ">="
      00939D 3C 00                  414 lt: .asciz "<"
      00939F 3C 3D 00               415 le: .asciz "<="
      0093A2 3C 3E 00               416 ne:  .asciz "<>"
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
      0093A5                        429 cmd_name:
      001325                        430 	_vars VSIZE 
      0093A5 52 04            [ 2]    1     sub sp,#VSIZE 
      0093A7 72 5F 00 0E      [ 1]  431 	clr acc16 
      0093AB 1F 01            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      0093AD AE B5 57         [ 2]  433 	ldw x,#kword_dict	
      0093B0 1F 03            [ 2]  434 1$:	ldw (LINK,sp),x
      0093B2 E6 02            [ 1]  435 	ld a,(2,x)
      0093B4 A4 0F            [ 1]  436 	and a,#15 
      0093B6 C7 00 0F         [ 1]  437 	ld acc8,a 
      0093B9 1C 00 03         [ 2]  438 	addw x,#3
      0093BC 72 BB 00 0E      [ 2]  439 	addw x,acc16
      0093C0 FE               [ 2]  440 	ldw x,(x) ; code address   
      0093C1 13 01            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      0093C3 27 0C            [ 1]  442 	jreq 2$
      0093C5 1E 03            [ 2]  443 	ldw x,(LINK,sp)
      0093C7 FE               [ 2]  444 	ldw x,(x) 
      0093C8 1D 00 02         [ 2]  445 	subw x,#2  
      0093CB 26 E3            [ 1]  446 	jrne 1$
      0093CD 4F               [ 1]  447 	clr a 
      0093CE 5F               [ 1]  448 	clrw x 
      0093CF 20 05            [ 2]  449 	jra 9$
      0093D1 1E 03            [ 2]  450 2$: ldw x,(LINK,sp)
      0093D3 1C 00 02         [ 2]  451 	addw x,#2 	
      001356                        452 9$:	_drop VSIZE
      0093D6 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093D8 81               [ 4]  453 	ret
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
      0093D9                        118 strlen::
      0093D9 89               [ 2]  119 	pushw x 
      0093DA 4F               [ 1]  120 	clr a
      0093DB 7D               [ 1]  121 1$:	tnz (x) 
      0093DC 27 04            [ 1]  122 	jreq 9$ 
      0093DE 4C               [ 1]  123 	inc a 
      0093DF 5C               [ 1]  124 	incw x 
      0093E0 20 F9            [ 2]  125 	jra 1$ 
      0093E2 85               [ 2]  126 9$:	popw x 
      0093E3 81               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      0093E4                        137 strcmp:
      0093E4 F6               [ 1]  138 	ld a,(x)
      0093E5 27 0B            [ 1]  139 	jreq 5$ 
      0093E7 90 F1            [ 1]  140 	cp a,(y) 
      0093E9 26 05            [ 1]  141 	jrne 4$ 
      0093EB 5C               [ 1]  142 	incw x 
      0093EC 90 5C            [ 1]  143 	incw y 
      0093EE 20 F4            [ 2]  144 	jra strcmp 
      0093F0                        145 4$: ; not same  
      0093F0 4F               [ 1]  146 	clr a 
      0093F1 81               [ 4]  147 	ret 
      0093F2                        148 5$: ; same 
      0093F2 A6 01            [ 1]  149 	ld a,#1 
      0093F4 81               [ 4]  150 	ret 
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



      0093F5                        161 strcpy::
      0093F5 88               [ 1]  162 	push a 
      0093F6 89               [ 2]  163 	pushw x 
      0093F7 90 F6            [ 1]  164 1$: ld a,(y)
      0093F9 27 06            [ 1]  165 	jreq 9$ 
      0093FB F7               [ 1]  166 	ld (x),a 
      0093FC 5C               [ 1]  167 	incw x 
      0093FD 90 5C            [ 1]  168 	incw y 
      0093FF 20 F6            [ 2]  169 	jra 1$ 
      009401 7F               [ 1]  170 9$:	clr (x)
      009402 85               [ 2]  171 	popw x 
      009403 84               [ 1]  172 	pop a 
      009404 81               [ 4]  173 	ret 
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
      009405                        187 move::
      009405 88               [ 1]  188 	push a 
      001386                        189 	_vars VSIZE 
      009406 52 02            [ 2]    1     sub sp,#VSIZE 
      009408 0F 01            [ 1]  190 	clr (INCR,sp)
      00940A 0F 02            [ 1]  191 	clr (LB,sp)
      00940C 90 89            [ 2]  192 	pushw y 
      00940E 13 01            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      009410 90 85            [ 2]  194 	popw y 
      009412 27 31            [ 1]  195 	jreq move_exit ; x==y 
      009414 2B 0E            [ 1]  196 	jrmi move_down
      009416                        197 move_up: ; start from top address with incr=-1
      009416 72 BB 00 0E      [ 2]  198 	addw x,acc16
      00941A 72 B9 00 0E      [ 2]  199 	addw y,acc16
      00941E 03 01            [ 1]  200 	cpl (INCR,sp)
      009420 03 02            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      009422 20 05            [ 2]  202 	jra move_loop  
      009424                        203 move_down: ; start from bottom address with incr=1 
      009424 5A               [ 2]  204     decw x 
      009425 90 5A            [ 2]  205 	decw y
      009427 0C 02            [ 1]  206 	inc (LB,sp) ; incr=1 
      009429                        207 move_loop:	
      009429 C6 00 0E         [ 1]  208     ld a, acc16 
      00942C CA 00 0F         [ 1]  209 	or a, acc8
      00942F 27 14            [ 1]  210 	jreq move_exit 
      009431 72 FB 01         [ 2]  211 	addw x,(INCR,sp)
      009434 72 F9 01         [ 2]  212 	addw y,(INCR,sp) 
      009437 90 F6            [ 1]  213 	ld a,(y)
      009439 F7               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00943A 89               [ 2]  215 	pushw x 
      00943B CE 00 0E         [ 2]  216 	ldw x,acc16 
      00943E 5A               [ 2]  217 	decw x 
      00943F CF 00 0E         [ 2]  218 	ldw acc16,x 
      009442 85               [ 2]  219 	popw x 
      009443 20 E4            [ 2]  220 	jra move_loop
      009445                        221 move_exit:
      0013C5                        222 	_drop VSIZE
      009445 5B 02            [ 2]    1     addw sp,#VSIZE 
      009447 84               [ 1]  223 	pop a 
      009448 81               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      009449                        233 clear_vars:
      009449 89               [ 2]  234 	pushw x 
      00944A 88               [ 1]  235 	push a  
      00944B AE 00 35         [ 2]  236 	ldw x,#vars 
      00944E A6 4E            [ 1]  237 	ld a,#CELL_SIZE*26 
      009450 7F               [ 1]  238 1$:	clr (x)
      009451 5C               [ 1]  239 	incw x 
      009452 4A               [ 1]  240 	dec a 
      009453 26 FB            [ 1]  241 	jrne 1$
      009455 84               [ 1]  242 	pop a 
      009456 85               [ 2]  243 	popw x 
      009457 81               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      009458 0A 0A 54 69 6E 79 20   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      00949E                        255 system_information:
      00949E AE 94 58         [ 2]  256 	ldw x,#software 
      0094A1 CD 89 BB         [ 4]  257 	call puts 
      0094A4 A6 02            [ 1]  258 	ld a,#MAJOR 
      0094A6 C7 00 0F         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0094A9 5F               [ 1]  260 	clrw x 
      0094AA CF 00 0D         [ 2]  261 	ldw acc24,x
      0094AD 72 5F 00 24      [ 1]  262 	clr tab_width  
      0094B1 35 0A 00 0B      [ 1]  263 	mov base, #10 
      0094B5 CD 98 9A         [ 4]  264 	call prt_acc24 
      0094B8 A6 2E            [ 1]  265 	ld a,#'.
      0094BA CD 89 5E         [ 4]  266 	call putc 
      0094BD A6 00            [ 1]  267 	ld a,#MINOR 
      0094BF C7 00 0F         [ 1]  268 	ld acc8,a 
      0094C2 5F               [ 1]  269 	clrw x 
      0094C3 CF 00 0D         [ 2]  270 	ldw acc24,x 
      0094C6 CD 98 9A         [ 4]  271 	call prt_acc24
      0094C9 A6 0D            [ 1]  272 	ld a,#CR 
      0094CB CD 89 5E         [ 4]  273 	call putc
                                    274 ;call test 
      0094CE 81               [ 4]  275 	ret
                                    276 
      0094CF                        277 warm_init:
      0094CF 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      0094D3 72 5F 00 23      [ 1]  279 	clr flags 
      0094D7 72 5F 00 20      [ 1]  280 	clr loop_depth 
      0094DB 35 04 00 24      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      0094DF 35 0A 00 0B      [ 1]  282 	mov base,#10 
      0094E3 AE 00 00         [ 2]  283 	ldw x,#0 
      0094E6 CF 00 05         [ 2]  284 	ldw basicptr,x 
      0094E9 CF 00 01         [ 2]  285 	ldw in.w,x 
      0094EC 72 5F 00 04      [ 1]  286 	clr count
      0094F0 81               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      0094F1                        293 clear_basic:
      0094F1 89               [ 2]  294 	pushw x 
      0094F2 72 5F 00 04      [ 1]  295 	clr count
      0094F6 72 5F 00 02      [ 1]  296 	clr in  
      0094FA AE 00 90         [ 2]  297 	ldw x,#free_ram 
      0094FD CF 00 1C         [ 2]  298 	ldw txtbgn,x 
      009500 CF 00 1E         [ 2]  299 	ldw txtend,x 
      009503 CF 00 31         [ 2]  300 	ldw dvar_bgn,x 
      009506 CF 00 33         [ 2]  301 	ldw dvar_end,x 
      009509 CD 94 49         [ 4]  302 	call clear_vars 
      00950C 85               [ 2]  303 	popw x
      00950D 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00950E                        309 err_msg:
      00950E 00 00 95 34 95 41 95   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             4F 95 68 95 77
      00951A 95 8D 95 A3 95 BD 95   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CE 95 DF
      009524 95 EB 96 1E 96 2E 96   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal  42-Bits]



             C2 15 D5
      00952C 96 55 96 62 96 6C      313 	.word err_overflow,err_read_only,err_not_program  
                                    314 
      009532 96 88 4D 65 6D 6F 72   315 err_mem_full: .asciz "Memory full\n" 
             79 20 66 75 6C 6C
      00953F 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      00954D 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      009566 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      009575 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      00958B 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      0095A1 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      0095BB 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      0095CC 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      0095DD 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      0095E9 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      00961C 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      00962C 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      009640 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      009653 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
      009660 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00966A 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
      009686 0A 00 6E 6F 20 70 72   332 err_not_program: .asciz "no program at this address\n"
             6F 67 72 61 6D 20 61
             74 20 74 68 69 73 20
             61 64 64 72 65 73 73
                                    333 
                                    334 ;-------------------------------------
      0096A2 0A 00 0A 72 75 6E 20   335 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      0096B4 20 00 0A 63 6F 6D 70   336 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      0096C5 20 00 6C 61 73 74 20   337 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    338 
      001657                        339 syntax_error::
      0096D5 20 00            [ 1]  340 	ld a,#ERR_SYNTAX 
                                    341 
      0096D7                        342 tb_error::
      0096D7 A6 02 00 22 4C   [ 2]  343 	btjt flags,#FCOMP,1$
      0096D9 88               [ 1]  344 	push a 
      0096D9 72 0A 00         [ 2]  345 	ldw x, #rt_msg 
      0096DC 23 4C 88         [ 4]  346 	call puts 
      0096DF AE               [ 1]  347 	pop a 
      0096E0 96 A4 CD         [ 2]  348 	ldw x, #err_msg 
      0096E3 89 BB 84 AE      [ 1]  349 	clr acc16 
      0096E7 95               [ 1]  350 	sll a
      0096E8 0E 72 5F 00      [ 1]  351 	rlc acc16  
      0096EC 0E 48 72         [ 1]  352 	ld acc8, a 
      0096EF 59 00 0E C7      [ 2]  353 	addw x,acc16 
      0096F3 00               [ 2]  354 	ldw x,(x)
      0096F4 0F 72 BB         [ 4]  355 	call puts
      0096F7 00 0E FE         [ 2]  356 	ldw x,basicptr 
                           000001   357 .if DEBUG 
      0096FA CD 89 BB         [ 1]  358 ld a,count 
      0096FD CE 00            [ 1]  359 clrw y 
      0096FF 05 C6            [ 1]  360 rlwa y  
      009701 00 04 90         [ 4]  361 call hex_dump
      009704 5F 90 02         [ 2]  362 ldw x,basicptr
                                    363 .endif 
      009707 CD 86 B5         [ 1]  364 	ld a,in 
      00970A CE 00 05         [ 4]  365 	call prt_basic_line
      00970D C6 00 02         [ 2]  366 	ldw x,#tk_id 
      009710 CD 9F E8         [ 4]  367 	call puts 
      009713 AE 96 C7         [ 1]  368 	ld a,in.saved 
      009716 CD               [ 1]  369 	clrw x 
      009717 89               [ 1]  370 	ld xl,a 
      009718 BB C6 00 03      [ 2]  371 	addw x,basicptr 
      00971C 5F               [ 1]  372 	ld a,(x)
      00971D 97               [ 1]  373 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00971E 72               [ 1]  374 	ld xl,a 
      00971F BB 00 05         [ 4]  375 	call prt_i16
      009722 F6 5F            [ 2]  376 	jra 6$
      0016AA                        377 1$:	
      009724 97               [ 1]  378 	push a 
      009725 CD 98 83         [ 2]  379 	ldw x,#comp_msg
      009728 20 35 3B         [ 4]  380 	call puts 
      00972A 84               [ 1]  381 	pop a 
      00972A 88 AE 96         [ 2]  382 	ldw x, #err_msg 
      00972D B6 CD 89 BB      [ 1]  383 	clr acc16 
      009731 84               [ 1]  384 	sll a
      009732 AE 95 0E 72      [ 1]  385 	rlc acc16  
      009736 5F 00 0E         [ 1]  386 	ld acc8, a 
      009739 48 72 59 00      [ 2]  387 	addw x,acc16 
      00973D 0E               [ 2]  388 	ldw x,(x)
      00973E C7 00 0F         [ 4]  389 	call puts
      009741 72 BB 00         [ 2]  390 	ldw x,#tib
      009744 0E FE CD         [ 4]  391 	call puts 
      009747 89 BB            [ 1]  392 	ld a,#CR 
      009749 AE 16 90         [ 4]  393 	call putc
      00974C CD 89 BB         [ 2]  394 	ldw x,in.w
      00974F A6 0D CD         [ 4]  395 	call spaces
      009752 89 5E            [ 1]  396 	ld a,#'^
      009754 CE 00 01         [ 4]  397 	call putc 
      009757 CD 8A 28         [ 2]  398 6$: ldw x,#STACK_EMPTY 
      00975A A6               [ 1]  399     ldw sp,x
                                    400 
      0016E3                        401 warm_start:
      00975B 5E CD 89         [ 4]  402 	call warm_init
                                    403 ;----------------------------
                                    404 ;   BASIC interpreter
                                    405 ;----------------------------
      0016E6                        406 cmd_line: ; user interface 
      00975E 5E AE            [ 1]  407 	ld a,#CR 
      009760 17 FF 94         [ 4]  408 	call putc 
      009763 A6 3E            [ 1]  409 	ld a,#'> 
      009763 CD 94 CF         [ 4]  410 	call putc
      009766 CD 0A 40         [ 4]  411 	call readln
      009766 A6 0D CD 89      [ 1]  412 	tnz count 
      00976A 5E A6            [ 1]  413 	jreq cmd_line
      00976C 3E CD 89         [ 4]  414 	call compile
                                    415 ;;;;;;;;;;;;;;;;;;;;;;	
                                    416 ;pushw y 
                                    417 ;ldw x,txtbgn  
                                    418 ;ldw y,txtend
                                    419 ;ldw acc16,x   
                                    420 ;subw y,acc16 
                                    421 ;call hex_dump
                                    422 ;popw y 
                                    423 ;;;;;;;;;;;;;;;;;;;;;;
                                    424 
                                    425 ; if text begin with a line number
                                    426 ; the compiler set count to zero    
                                    427 ; so code is not interpreted
      00976F 5E CD 8A C0      [ 1]  428 	tnz count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009773 72 5D            [ 1]  429 	jreq cmd_line
                                    430 	
                                    431 ; if direct command 
                                    432 ; it's ready to interpret 
                                    433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    434 ;; This is the interpreter loop
                                    435 ;; for each BASIC code line. 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001702                        437 interpreter: 
      009775 00 04 27         [ 1]  438 	ld a,in 
      009778 ED CD 90         [ 1]  439 	cp a,count 
      00977B E9 72            [ 1]  440 	jrmi interp_loop
      00170A                        441 next_line:
      00977D 5D 00 04 27 E4   [ 2]  442 	btjf flags, #FRUN, cmd_line
      009782 CE 00 04         [ 2]  443 	ldw x,basicptr
      009782 C6 00 02 C1      [ 2]  444 	addw x,in.w 
      009786 00 04 2B         [ 2]  445 	cpw x,txtend 
      009789 1D C8            [ 1]  446 	jrpl warm_start
      00978A CF 00 04         [ 2]  447 	ldw basicptr,x ; start of next line  
      00978A 72 01            [ 1]  448 	ld a,(2,x)
      00978C 00 23 D7         [ 1]  449 	ld count,a 
      00978F CE 00 05 72      [ 1]  450 	mov in,#3 ; skip first 3 bytes of line 
      001727                        451 interp_loop:
      009793 BB 00 01         [ 4]  452 	call next_token
      009796 C3 00            [ 1]  453 	cp a,#TK_NONE 
      009798 1E 2A            [ 1]  454 	jreq next_line 
      00979A C8 CF            [ 1]  455 	cp a,#TK_CMD
      00979C 00 05            [ 1]  456 	jrne 1$
      001732                        457 	_get_code_addr
      00979E E6               [ 2]    1         ldw x,(x)
      00979F 02 C7 00 04      [ 1]    2         inc in 
      0097A3 35 03 00 02      [ 1]    3         inc in 
      0097A7 FD               [ 4]  458 	call(x)
      0097A7 CD 98            [ 2]  459 	jra interp_loop 
      00173E                        460 1$:	 
      0097A9 3B A1            [ 1]  461 	cp a,#TK_VAR
      0097AB 00 27            [ 1]  462 	jrne 2$
      0097AD DC A1 80         [ 4]  463 	call let_var  
      0097B0 26 0C            [ 2]  464 	jra interp_loop 
      001747                        465 2$:	
      0097B2 FE 72            [ 1]  466 	cp a,#TK_ARRAY 
      0097B4 5C 00            [ 1]  467 	jrne 3$
      0097B6 02 72 5C         [ 4]  468 	call let_array 
      0097B9 00 02            [ 2]  469 	jra interp_loop
      001750                        470 3$:	
      0097BB FD 20            [ 1]  471 	cp a,#TK_LABEL
      0097BD E9 05            [ 1]  472 	jrne 4$
      0097BE CD 17 60         [ 4]  473 	call let_dvar  
      0097BE A1 85            [ 2]  474 	jra interp_loop 
      001759                        475 4$: 
      0097C0 26 05            [ 1]  476 	cp a,#TK_COLON 
      0097C2 CD 9D            [ 1]  477 	jreq interp_loop
      0097C4 32 20 E0         [ 2]  478 5$:	jp syntax_error 
                                    479 
                                    480 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                    481 ;----------------------
                                    482 ; when a label is met 
                                    483 ; at interp_loop
                                    484 ; it may be a variable 
                                    485 ; assignement to DIM 
                                    486 ; variable 
                                    487 ;----------------------
                           000001   488 	VAR_NAME=1 
                           000003   489 	REC_LEN=3
                           000004   490 	VSIZE=4 
      0097C7                        491 let_dvar:
      001760                        492 	_vars VSIZE 
      0097C7 A1 05            [ 2]    1     sub sp,#VSIZE 
      0097C9 26 05            [ 2]  493 	ldw (VAR_NAME,sp),x
      0097CB CD 9D            [ 1]  494 	clr (REC_LEN,sp) 
      0097CD 2D 20 D7         [ 4]  495 	call skip_string 
      0097D0 CE 00 04         [ 2]  496 	ldw x,basicptr 
      0097D0 A1 03 26 05      [ 2]  497 	addw x,in.w 
      0097D4 CD               [ 1]  498 	ld a,(x)
      0097D5 97 E0            [ 1]  499 	cp a,#TK_EQUAL 
      0097D7 20 CE            [ 1]  500 	jrne 9$ 
                                    501 ; dvar assignment 
      0097D9 72 5C 00 01      [ 1]  502 	inc in  
      0097D9 A1 0A 27         [ 4]  503 	call condition  
      0097DC CA CC            [ 1]  504 	cp a,#TK_INTGR 
      0097DE 96 D7            [ 1]  505 	jreq 1$ 
      0097E0 CC 16 57         [ 2]  506 0$:	jp syntax_error 
      001783                        507 1$: 
      0097E0 52 04            [ 2]  508 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      0097E2 1F 01 0F         [ 4]  509 	call strlen 
      0097E5 03 CD            [ 1]  510 	add a,#REC_XTRA_BYTES
      0097E7 98 54            [ 1]  511 	ld (REC_LEN+1,sp),a 
      0097E9 CE 00 05         [ 4]  512 	call search_name 
      0097EC 72               [ 2]  513 	tnzw x 
      0097ED BB 00            [ 1]  514 	jreq 0$ 
      0097EF 01               [ 1]  515 	ld a,(x)
      0097F0 F6 A1            [ 1]  516 	jrpl 2$
      0097F2 32 26            [ 1]  517 	ld a,#ERR_RD_ONLY 
      0097F4 43 72 5C         [ 2]  518 	jp tb_error 
      00179A                        519 2$:
      0097F7 00 02 CD         [ 2]  520 	addw x,(REC_LEN,sp)
      0097FA 9C 60 A1         [ 2]  521 	subw x,#CELL_SIZE 
      0097FD 84 27 03         [ 2]  522 	ldw ptr16,x
      0017A3                        523 	_xpop 
      009800 CC 96            [ 1]    1     ld a,(y)
      009802 D7               [ 1]    2     ldw x,y 
      009803 EE 01            [ 2]    3     ldw x,(1,x)
      009803 1E 01 CD 93      [ 2]    4     addw y,#CELL_SIZE 
      009807 D9 AB 05 6B      [ 4]  524 	ld [ptr16],a 
      00980B 04 CD 9D 9C      [ 1]  525 	inc ptr8 
      00980F 5D 27 EE F6      [ 5]  526 	ldw [ptr16],x 
      0017B8                        527 9$: _drop VSIZE 	
      009813 2A 05            [ 2]    1     addw sp,#VSIZE 
      009815 A6               [ 4]  528 	ret 
                                    529 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    530 
                                    531 ;--------------------------
                                    532 ; extract next token from
                                    533 ; token list 
                                    534 ; basicptr -> base address 
                                    535 ; in  -> offset in list array 
                                    536 ; output:
                                    537 ;   A 		token attribute
                                    538 ;   X 		*token_value 
                                    539 ;----------------------------------------
      0017BB                        540 next_token::
                                    541 ;	clrw x 
      009816 11 CC 96         [ 1]  542 	ld a,in 
      009819 D9 00 02         [ 1]  543 	ld in.saved,a ; in case "_unget_token" needed 
                                    544 ; don't replace sub by "cp a,count" 
                                    545 ; if end of line must return with A=0   	
      00981A C0 00 03         [ 1]  546 	sub a,count 
      00981A 72 FB            [ 1]  547 	jreq 9$ ; end of line 
      0017C6                        548 0$: 
      00981C 03 1D 00         [ 2]  549 	ldw x,basicptr 
      00981F 03 CF 00 1A      [ 2]  550 	addw x,in.w 
      009823 90               [ 1]  551 	ld a,(x)
      009824 F6               [ 1]  552 	incw x
      009825 93 EE 01 72      [ 1]  553 	inc in   
      009829 A9               [ 4]  554 9$: ret 
                                    555 
                                    556 ;-------------------------
                                    557 ;  skip .asciz in BASIC line 
                                    558 ;  name 
                                    559 ;  input:
                                    560 ;     x		* string 
                                    561 ;  output:
                                    562 ;     none 
                                    563 ;-------------------------
      0017D4                        564 skip_string:
      00982A 00               [ 1]  565 	ld a,(x)
      00982B 03 72            [ 1]  566 	jreq 1$
      00982D C7               [ 1]  567 	incw x 
      00982E 00 1A            [ 2]  568 	jra skip_string 
      009830 72               [ 1]  569 1$: incw x 	
      009831 5C 00 1B 72      [ 2]  570 	subw x,basicptr 
      009835 CF 00 1A         [ 2]  571 	ldw in.w,x 
      009838 5B               [ 4]  572 	ret 
                                    573 
                                    574 ;---------------------
                                    575 ; extract 16 bits  
                                    576 ; address from BASIC
                                    577 ; code 
                                    578 ; input:
                                    579 ;    X    *address
                                    580 ; output:
                                    581 ;    X    address 
                                    582 ;-------------------- 
      0017E3                        583 get_addr:
      009839 04               [ 2]  584 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00983A 81 5C 00 01      [ 1]  585 	inc in 
      00983B 72 5C 00 01      [ 1]  586 	inc in 
      00983B C6               [ 4]  587 	ret 
                                    588 
                                    589 ;--------------------
                                    590 ; extract int24_t  
                                    591 ; value from BASIC 
                                    592 ; code 
                                    593 ; input:
                                    594 ;    X   *integer 
                                    595 ; output:
                                    596 ;    A:X   int24  
                                    597 ;--------------------
      0017ED                        598 get_int24:
      00983C 00               [ 1]  599 	ld a,(x)
      00983D 02 C7            [ 2]  600 	ldw x,(1,x)
                                    601 ; skip 3 bytes 
      00983F 00 03 C0 00      [ 1]  602 	inc in 
      009843 04 27 0D 01      [ 1]  603 	inc in 
      009846 72 5C 00 01      [ 1]  604 	inc in 
      009846 CE               [ 4]  605 	ret 
                                    606 
                                    607 ;-------------------------
                                    608 ; get character from 
                                    609 ; BASIC code 
                                    610 ; input:
                                    611 ;    X   *char 
                                    612 ; output:
                                    613 ;    A    char 
                                    614 ;-------------------------
      0017FD                        615 get_char:
      009847 00               [ 1]  616 	ld a,(x)
      009848 05 72 BB 00      [ 1]  617 	inc in  
      00984C 01               [ 4]  618     ret 
                                    619 
                                    620 ;-----------------------------------
                                    621 ; print a 16 bit integer 
                                    622 ; using variable 'base' as conversion
                                    623 ; format.
                                    624 ; input:
                                    625 ;    X       integer to print 
                                    626 ;   'base'    conversion base 
                                    627 ; output:
                                    628 ;   terminal  
                                    629 ;-----------------------------------
      001803                        630 prt_i16:
      00984D F6 5C 72 5C      [ 1]  631 	clr acc24 
      009851 00 02 81         [ 2]  632 	ldw acc16,x 
      009854 A6 10            [ 1]  633 	ld a,#16
      009854 F6 27 03         [ 1]  634 	cp a,base
      009857 5C 20            [ 1]  635 	jreq prt_acc24  
      009859 FA 5C 72 B0 00   [ 2]  636 	btjf acc16,#7,prt_acc24
      00985E 05 CF 00 01      [ 1]  637 	cpl acc24 ; sign extend 
                                    638 	
                                    639 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    640 ; print integer in acc24 
                                    641 ; input:
                                    642 ;	acc24 		integer to print 
                                    643 ;	'base' 		numerical base for conversion 
                                    644 ;   'tab_width' field width 
                                    645 ;    A 			signed||unsigned conversion
                                    646 ;  output:
                                    647 ;    A          string length
                                    648 ;------------------------------------
      00181A                        649 prt_acc24:
      009862 81 FF            [ 1]  650 	ld a,#255  ; signed conversion  
      009863 CD 18 40         [ 4]  651     call itoa  ; conversion entier en  .asciz
      009863 FE 72 5C         [ 4]  652 	call right_align  
      009866 00               [ 1]  653 	push a 
      009867 02 72 5C         [ 4]  654 	call puts
      00986A 00               [ 1]  655 	pop a 
      00986B 02               [ 4]  656     ret	
                                    657 
                                    658 ;---------------------------------------
                                    659 ;  print value at xstack top 
                                    660 ;---------------------------------------
      001828                        661 print_top: 
      001828                        662 	_xpop 
      00986C 81 F6            [ 1]    1     ld a,(y)
      00986D 93               [ 1]    2     ldw x,y 
      00986D F6 EE            [ 2]    3     ldw x,(1,x)
      00986F 01 72 5C 00      [ 2]    4     addw y,#CELL_SIZE 
      009873 02 72 5C         [ 1]  663 	ld acc24,a 
      009876 00 02 72         [ 2]  664 	ldw acc16,x 
      009879 5C 00 02         [ 4]  665 	call prt_acc24 
      00987C 81 20            [ 1]  666 	ld a,#SPACE
      00987D CD 08 DE         [ 4]  667 	call putc 
      00987D F6               [ 4]  668 	ret 
                                    669 
                                    670 ;------------------------------------
                                    671 ; convert integer in acc24 to string
                                    672 ; input:
                                    673 ;   'base'	conversion base 
                                    674 ;	acc24	integer to convert
                                    675 ;   A       0=unsigned, else signed 
                                    676 ; output:
                                    677 ;   X  		pointer to first char of string
                                    678 ;   A       string length
                                    679 ;------------------------------------
                           000001   680 	SIGN=1  ; integer sign 
                           000002   681 	LEN=2 
                           000003   682 	PSTR=3
                           000004   683 	VSIZE=4 ;locals size
      001840                        684 itoa::
      001840                        685 	_vars VSIZE
      00987E 72 5C            [ 2]    1     sub sp,#VSIZE 
      009880 00 02            [ 1]  686 	clr (LEN,sp) ; string length  
      009882 81 01            [ 1]  687 	clr (SIGN,sp)    ; sign
      009883 4D               [ 1]  688 	tnz A
      009883 72 5F            [ 1]  689 	jreq 1$ ; unsigned conversion  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009885 00 0D CF         [ 1]  690 	ld a,base 
      009888 00 0E            [ 1]  691 	cp a,#10
      00988A A6 10            [ 1]  692 	jrne 1$
                                    693 	; base 10 string display with negative sign if bit 23==1
      00988C C1 00 0B 27 09   [ 2]  694 	btjf acc24,#7,1$
      009891 72 0F            [ 1]  695 	cpl (SIGN,sp)
      009893 00 0E 04         [ 4]  696 	call neg_acc24
      00185A                        697 1$:
                                    698 ; initialize string pointer 
      009896 72 53 00         [ 2]  699 	ldw x,#tib 
      009899 0D 00 50         [ 2]  700 	addw x,#TIB_SIZE
      00989A 5A               [ 2]  701 	decw x 
      00989A A6               [ 1]  702 	clr (x)
      001862                        703 itoa_loop:
      00989B FF CD 98         [ 1]  704     ld a,base
      00989E C0 CD 91         [ 4]  705     call divu24_8 ; acc24/A 
      0098A1 93 88            [ 1]  706     add a,#'0  ; remainder of division
      0098A3 CD 89            [ 1]  707     cp a,#'9+1
      0098A5 BB 84            [ 1]  708     jrmi 2$
      0098A7 81 07            [ 1]  709     add a,#7 
      0098A8                        710 2$:	
      0098A8 90               [ 2]  711 	decw x
      0098A9 F6               [ 1]  712     ld (x),a
      0098AA 93 EE            [ 1]  713 	inc (LEN,sp)
                                    714 	; if acc24==0 conversion done
      0098AC 01 72 A9         [ 1]  715 	ld a,acc24
      0098AF 00 03 C7         [ 1]  716 	or a,acc16
      0098B2 00 0D CF         [ 1]  717 	or a,acc8
      0098B5 00 0E            [ 1]  718     jrne itoa_loop
                                    719 	;conversion done, next add '$' or '-' as required
      0098B7 CD 98 9A         [ 1]  720 	ld a,base 
      0098BA A6 20            [ 1]  721 	cp a,#16
      0098BC CD 89            [ 1]  722 	jreq 8$
      0098BE 5E 81            [ 1]  723 	ld a,(SIGN,sp)
      0098C0 27 0A            [ 1]  724     jreq 10$
      0098C0 52 04            [ 1]  725     ld a,#'-
      0098C2 0F 02            [ 2]  726 	jra 9$ 
      00188E                        727 8$:	
      0098C4 0F 01            [ 1]  728 	ld a,#'$ 
      0098C6 4D               [ 2]  729 9$: decw x
      0098C7 27               [ 1]  730     ld (x),a
      0098C8 11 C6            [ 1]  731 	inc (LEN,sp)
      001894                        732 10$:
      0098CA 00 0B            [ 1]  733 	ld a,(LEN,sp)
      001896                        734 	_drop VSIZE
      0098CC A1 0A            [ 2]    1     addw sp,#VSIZE 
      0098CE 26               [ 4]  735 	ret
                                    736 
                                    737 ;------------------------------------
                                    738 ; convert alpha to uppercase
                                    739 ; input:
                                    740 ;    a  character to convert
                                    741 ; output:
                                    742 ;    a  uppercase character
                                    743 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      001899                        744 to_upper::
      0098CF 0A 72            [ 1]  745 	cp a,#'a
      0098D1 0F 00            [ 1]  746 	jrpl 1$
      0098D3 0D               [ 4]  747 0$:	ret
      0098D4 05 03            [ 1]  748 1$: cp a,#'z	
      0098D6 01 CD            [ 1]  749 	jrugt 0$
      0098D8 82 8D            [ 1]  750 	sub a,#32
      0098DA 81               [ 4]  751 	ret
                                    752 	
                                    753 ;------------------------------------
                                    754 ; convert pad content in integer
                                    755 ; input:
                                    756 ;    x		* .asciz to convert
                                    757 ; output:
                                    758 ;    acc24      int24_t
                                    759 ;------------------------------------
                                    760 	; local variables
                           000001   761 	SIGN=1 ; 1 byte, 
                           000002   762 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   763 	TEMP=3 ; 1 byte, temporary storage
                           000004   764 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   765 	VSIZE=5 ; 5 bytes reserved for local storage
      0018A5                        766 atoi24::
      0018A5                        767 	_vars VSIZE
      0098DA AE 16            [ 2]    1     sub sp,#VSIZE 
      0098DC 90 1C            [ 2]  768 	ldw (XTEMP,sp),x 
                                    769 ; conversion made on xstack 
      0098DE 00               [ 1]  770 	clr a 
      0098DF 50               [ 1]  771 	clrw x 
      0018AB                        772 	_xpush 
      0098E0 5A 7F 00 03      [ 2]    1     subw y,#CELL_SIZE
      0098E2 90 F7            [ 1]    2     ld (y),a 
      0098E2 C6 00 0B         [ 2]    3     ldw (1,y),x 
      0098E5 CD 83            [ 1]  773 	clr (SIGN,sp)
      0098E7 59 AB            [ 1]  774 	ld a,#10
      0098E9 30 A1            [ 1]  775 	ld (BASE,sp),a ; default base decimal
      0098EB 3A 2B            [ 2]  776 	ldw x,(XTEMP,sp)
      0098ED 02               [ 1]  777 	ld a,(x)
      0098EE AB 07            [ 1]  778 	jreq 9$  ; completed if 0
      0098F0 A1 2D            [ 1]  779 	cp a,#'-
      0098F0 5A F7            [ 1]  780 	jrne 1$
      0098F2 0C 02            [ 1]  781 	cpl (SIGN,sp)
      0098F4 C6 00            [ 2]  782 	jra 2$
      0098F6 0D CA            [ 1]  783 1$: cp a,#'$
      0098F8 00 0E            [ 1]  784 	jrne 3$
      0098FA CA 00            [ 1]  785 	ld a,#16
      0098FC 0F 26            [ 1]  786 	ld (BASE,sp),a
      0098FE E3               [ 1]  787 2$:	incw x
      0098FF C6 00            [ 2]  788 	ldw (XTEMP,sp),x 
      009901 0B               [ 1]  789 	ld a,(x)
      0018D3                        790 3$:	; char to digit 
      009902 A1 10            [ 1]  791 	cp a,#'a
      009904 27 08            [ 1]  792 	jrmi 4$
      009906 7B 01            [ 1]  793 	sub a,#32
      009908 27 0A            [ 1]  794 4$:	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00990A A6 2D            [ 1]  795 	jrmi 9$
      00990C 20 02            [ 1]  796 	sub a,#'0
      00990E A1 0A            [ 1]  797 	cp a,#10
      00990E A6 24            [ 1]  798 	jrmi 5$
      009910 5A F7            [ 1]  799 	sub a,#7
      009912 0C 02            [ 1]  800 	cp a,(BASE,sp)
      009914 2A 24            [ 1]  801 	jrpl 9$
      009914 7B 02            [ 1]  802 5$:	ld (TEMP,sp),a
      009916 5B 04            [ 1]  803 	ld a,(BASE,sp)
      009918 81 02 2A         [ 4]  804 	call mulu24_8
      009919                        805 	_xpush 
      009919 A1 61 2A 01      [ 2]    1     subw y,#CELL_SIZE
      00991D 81 A1            [ 1]    2     ld (y),a 
      00991F 7A 22 FB         [ 2]    3     ldw (1,y),x 
      009922 A0               [ 1]  806 	clrw x 
      009923 20 81            [ 1]  807 	ld a,(TEMP,sp)
      009925 02               [ 1]  808 	rlwa x 
      0018FD                        809 	_xpush 
      009925 52 05 1F 04      [ 2]    1     subw y,#CELL_SIZE
      009929 4F 5F            [ 1]    2     ld (y),a 
      00992B 72 A2 00         [ 2]    3     ldw (1,y),x 
      00992E 03 90 F7         [ 4]  810 	call add24 
      009931 90 EF            [ 2]  811 	ldw x,(XTEMP,sp)
      009933 01 0F            [ 2]  812 	jra 2$
      009935 01 A6            [ 1]  813 9$:	tnz (SIGN,sp)
      009937 0A 6B            [ 1]  814     jreq atoi_exit
      009939 02 1E 04         [ 4]  815     call neg24
      001914                        816 atoi_exit:
      001914                        817 	_xpop 
      00993C F6 27            [ 1]    1     ld a,(y)
      00993E 4E               [ 1]    2     ldw x,y 
      00993F A1 2D            [ 2]    3     ldw x,(1,x)
      009941 26 04 03 01      [ 2]    4     addw y,#CELL_SIZE 
      009945 20 08 A1         [ 1]  818 	ld acc24,a 
      009948 24 26 08         [ 2]  819 	ldw acc16,x  
      001923                        820 	_drop VSIZE
      00994B A6 10            [ 2]    1     addw sp,#VSIZE 
      00994D 6B               [ 4]  821 	ret
                                    822 
                                    823 
                                    824 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    825 ;;   TINY BASIC  operators,
                                    826 ;;   commands and functions 
                                    827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    828 
                                    829 ;---------------------------------
                                    830 ; dictionary search 
                                    831 ; input:
                                    832 ;	X 		dictionary entry point, name field  
                                    833 ;   y		.asciz name to search 
                                    834 ; output:
                                    835 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    836 ;  X		routine address|TK_OP 
                                    837 ;---------------------------------
                           000001   838 	NLEN=1 ; cmd length 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                           000002   839 	XSAVE=2
                           000004   840 	YSAVE=4
                           000005   841 	VSIZE=5 
      001926                        842 search_dict::
      001926                        843 	_vars VSIZE 
      00994E 02 5C            [ 2]    1     sub sp,#VSIZE 
      009950 1F 04            [ 2]  844 	ldw (YSAVE,sp),y 
      00192A                        845 search_next:
      009952 F6 02            [ 2]  846 	ldw (XSAVE,sp),x 
                                    847 ; get name length in dictionary	
      009953 F6               [ 1]  848 	ld a,(x)
      009953 A1 61            [ 1]  849 	and a,#0xf 
      009955 2B 02            [ 1]  850 	ld (NLEN,sp),a  
      009957 A0 20            [ 2]  851 	ldw y,(YSAVE,sp) ; name pointer 
      009959 A1               [ 1]  852 	incw x 
      001934                        853 cp_loop:
      00995A 30 2B            [ 1]  854 	ld a,(y)
      00995C 30 A0            [ 1]  855 	jreq str_match 
      00995E 30 A1            [ 1]  856 	tnz (NLEN,sp)
      009960 0A 2B            [ 1]  857 	jreq no_match  
      009962 06               [ 1]  858 	cp a,(x)
      009963 A0 07            [ 1]  859 	jrne no_match 
      009965 11 02            [ 1]  860 	incw y 
      009967 2A               [ 1]  861 	incw x
      009968 24 6B            [ 1]  862 	dec (NLEN,sp)
      00996A 03 7B            [ 2]  863 	jra cp_loop 
      001946                        864 no_match:
      00996C 02 CD            [ 2]  865 	ldw x,(XSAVE,sp) 
      00996E 82 AA 72         [ 2]  866 	subw x,#2 ; move X to link field
      009971 A2 00            [ 1]  867 	push #TK_NONE 
      009973 03               [ 2]  868 	ldw x,(x) ; next word link 
      009974 90               [ 1]  869 	pop a ; TK_NONE 
      009975 F7 90            [ 1]  870 	jreq search_exit  ; not found  
                                    871 ;try next 
      009977 EF 01            [ 2]  872 	jra search_next
      001953                        873 str_match:
      009979 5F 7B            [ 2]  874 	ldw x,(XSAVE,sp)
      00997B 03               [ 1]  875 	ld a,(X)
      00997C 02 72            [ 1]  876 	ld (NLEN,sp),a ; needed to test keyword type  
      00997E A2 00            [ 1]  877 	and a,#NLEN_MASK 
                                    878 ; move x to procedure address field 	
      009980 03               [ 1]  879 	inc a 
      009981 90 F7 90         [ 1]  880 	ld acc8,a 
      009984 EF 01 CD 81      [ 1]  881 	clr acc16 
      009988 EE 1E 04 20      [ 2]  882 	addw x,acc16 
      00998C C2               [ 2]  883 	ldw x,(x) ; routine address  
                                    884 ;determine keyword type bits 7:4 
      00998D 0D 01            [ 1]  885 	ld a,(NLEN,sp)
      00998F 27 03            [ 1]  886 	and a,#KW_TYPE_MASK 
      009991 CD               [ 1]  887 	swap a 
      009992 82 73            [ 1]  888 	add a,#128
      009994                        889 search_exit: 
      00196E                        890 	_drop VSIZE 
      009994 90 F6            [ 2]    1     addw sp,#VSIZE 
      009996 93               [ 4]  891 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    892 
                                    893 ;---------------------
                                    894 ; check if next token
                                    895 ;  is of expected type 
                                    896 ; input:
                                    897 ;   A 		 expected token attribute
                                    898 ;  ouput:
                                    899 ;   none     if fail call syntax_error 
                                    900 ;--------------------
      001971                        901 expect:
      009997 EE               [ 1]  902 	push a 
      009998 01 72 A9         [ 4]  903 	call next_token 
      00999B 00 03            [ 1]  904 	cp a,(1,sp)
      00999D C7 00            [ 1]  905 	jreq 1$
      00999F 0D CF 00         [ 2]  906 	jp syntax_error
      0099A2 0E               [ 1]  907 1$: pop a 
      0099A3 5B               [ 4]  908 	ret 
                                    909 
                                    910 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    911 ; parse arguments list 
                                    912 ; between ()
                                    913 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00197E                        914 func_args:
      0099A4 05 81            [ 1]  915 	ld a,#TK_LPAREN 
      0099A6 CD 19 71         [ 4]  916 	call expect 
                                    917 ; expected to continue in arg_list 
                                    918 ; caller must check for TK_RPAREN 
                                    919 
                                    920 ;-------------------------------
                                    921 ; parse embedded BASIC routines 
                                    922 ; arguments list.
                                    923 ; arg_list::=  expr[','expr]*
                                    924 ; all arguments are of int24_t type
                                    925 ; and pushed on stack 
                                    926 ; input:
                                    927 ;   none
                                    928 ; output:
                                    929 ;   xstack{n}   arguments pushed on xstack
                                    930 ;   A 	number of arguments pushed on xstack  
                                    931 ;--------------------------------
      001983                        932 arg_list:
      0099A6 52 05            [ 1]  933 	push #0
      0099A8 17 04 E0         [ 4]  934 1$:	call condition 
      0099AA 4D               [ 1]  935 	tnz a 
      0099AA 1F 02            [ 1]  936 	jreq 7$  
      0099AC F6 A4            [ 1]  937 	inc (1,sp)
      0099AE 0F 6B 01         [ 4]  938 	call next_token 
      0099B1 16 04            [ 1]  939 	cp a,#TK_COMMA 
      0099B3 5C F1            [ 1]  940 	jreq 1$ 
      0099B4 A1 07            [ 1]  941 	cp a,#TK_RPAREN
      0099B4 90 F6            [ 1]  942 	jreq 7$
      001998                        943 	_unget_token 
      0099B6 27 1B 0D 01 27   [ 1]    1      mov in,in.saved  
      0099BB 0A               [ 1]  944 7$:	pop a  
      0099BC F1               [ 4]  945 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    946 
                                    947 ;--------------------------------
                                    948 ;   BASIC commnands 
                                    949 ;--------------------------------
                                    950 
                                    951 ;--------------------------------
                                    952 ;  arithmetic and relational 
                                    953 ;  routines
                                    954 ;  operators precedence
                                    955 ;  highest to lowest
                                    956 ;  operators on same row have 
                                    957 ;  same precedence and are executed
                                    958 ;  from left to right.
                                    959 ;	'*','/','%'
                                    960 ;   '-','+'
                                    961 ;   '=','>','<','>=','<=','<>','><'
                                    962 ;   '<>' and '><' are equivalent for not equal.
                                    963 ;--------------------------------
                                    964 
                                    965 ;---------------------
                                    966 ; return array element
                                    967 ; address from @(expr)
                                    968 ; input:
                                    969 ;   A 		TK_ARRAY
                                    970 ; output:
                                    971 ;	X 		element address 
                                    972 ;----------------------
      00199F                        973 get_array_element:
      0099BD 26 07 90         [ 4]  974 	call func_args 
      0099C0 5C 5C            [ 1]  975 	cp a,#1
      0099C2 0A 01            [ 1]  976 	jreq 1$
      0099C4 20 EE 57         [ 2]  977 	jp syntax_error
      0099C6                        978 1$: _xpop 
      0099C6 1E 02            [ 1]    1     ld a,(y)
      0099C8 1D               [ 1]    2     ldw x,y 
      0099C9 00 02            [ 2]    3     ldw x,(1,x)
      0099CB 4B 00 FE 84      [ 2]    4     addw y,#CELL_SIZE 
                                    979     ; ignore A, index < 65536 in any case 
                                    980 	; check for bounds 
      0099CF 27 1D 20         [ 2]  981 	cpw x,array_size 
      0099D2 D7 05            [ 2]  982 	jrule 3$
                                    983 ; bounds {1..array_size}	
      0099D3 A6 0A            [ 1]  984 2$: ld a,#ERR_BAD_VALUE 
      0099D3 1E 02 F6         [ 2]  985 	jp tb_error 
      0099D6 6B               [ 2]  986 3$: tnzw  x
      0099D7 01 A4            [ 1]  987 	jreq 2$ 
      0099D9 0F               [ 2]  988 	pushw x 
      0099DA 4C               [ 2]  989 	sllw x 
      0099DB C7 00 0F         [ 2]  990 	addw x,(1,sp) ; index*size_of(int24)
      0099DE 72 5F            [ 2]  991 	ldw (1,sp),x  
      0099E0 00 0E 72         [ 2]  992 	ldw x,#tib ; array is below tib 
      0099E3 BB 00 0E         [ 2]  993 	subw x,(1,sp)
      0019CC                        994 	_drop 2   
      0099E6 FE 7B            [ 2]    1     addw sp,#2 
      0099E8 01               [ 4]  995 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                    996 
                                    997 
                                    998 ;***********************************
                                    999 ;   expression parse,execute 
                                   1000 ;***********************************
                                   1001 ;-----------------------------------
                                   1002 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1003 ;			 integer | function |
                                   1004 ;			 '('relation')' 
                                   1005 ; output:
                                   1006 ;   A       token attribute 
                                   1007 ;   xstack  value  
                                   1008 ; ---------------------------------
                           000001  1009 	NEG=1
                           000001  1010 	VSIZE=1
      0019CF                       1011 factor:
      0019CF                       1012 	_vars VSIZE 
      0099E9 A4 F0            [ 2]    1     sub sp,#VSIZE 
      0099EB 4E AB            [ 1] 1013 	clr (NEG,sp)
      0099ED 80 17 BB         [ 4] 1014 	call next_token
      0099EE 4D               [ 1] 1015 	tnz a 
      0099EE 5B 05            [ 1] 1016 	jrne 1$ 
      0099F0 81 1A 81         [ 2] 1017 	jp 22$ 
      0099F1 A1 10            [ 1] 1018 1$:	cp a,#TK_PLUS 
      0099F1 88 CD            [ 1] 1019 	jreq 2$
      0099F3 98 3B            [ 1] 1020 	cp a,#TK_MINUS 
      0099F5 11 01            [ 1] 1021 	jrne 4$ 
      0099F7 27 03            [ 1] 1022 	cpl (NEG,sp)
      0019E6                       1023 2$:	
      0099F9 CC 96 D7         [ 4] 1024 	call next_token
      0019E9                       1025 4$:
      0099FC 84               [ 1] 1026 	tnz a 
      0099FD 81 03            [ 1] 1027 	jrne 41$ 
      0099FE CC 16 57         [ 2] 1028 	jp syntax_error  
      0019EF                       1029 41$:	
      0099FE A6 06            [ 1] 1030 	cp a,#TK_IFUNC 
      009A00 CD 99            [ 1] 1031 	jrne 5$ 
      0019F3                       1032 	_get_code_addr 
      009A02 F1               [ 2]    1         ldw x,(x)
      009A03 72 5C 00 01      [ 1]    2         inc in 
      009A03 4B 00 CD 9C      [ 1]    3         inc in 
      009A07 60               [ 4] 1033 	call (x); result in A:X  
      009A08 4D 27            [ 2] 1034 	jra 18$ 
      0019FF                       1035 5$:
      009A0A 12 0C            [ 1] 1036 	cp a,#TK_INTGR
      009A0C 01 CD            [ 1] 1037 	jrne 6$
      009A0E 98 3B A1         [ 4] 1038 	call get_int24 ; A:X
      009A11 08 27            [ 2] 1039 	jra 18$
      001A08                       1040 6$:
      009A13 F1 A1            [ 1] 1041 	cp a,#TK_ARRAY
      009A15 07 27            [ 1] 1042 	jrne 7$
      009A17 05 55 00         [ 4] 1043 	call get_array_element
      009A1A 03 00            [ 2] 1044     jra 71$
      001A11                       1045 7$:
      009A1C 02 84            [ 1] 1046 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009A1E 81 08            [ 1] 1047 	jrne 8$
      009A1F CD 17 E3         [ 4] 1048 	call get_addr 
      001A18                       1049 71$: ; put value in A:X
      009A1F CD               [ 1] 1050 	ld a,(x)
      009A20 99 FE            [ 2] 1051 	ldw x,(1,x)
      009A22 A1 01            [ 2] 1052 	jra 18$
      001A1D                       1053 8$:
      009A24 27 03            [ 1] 1054 	cp a,#TK_LABEL 
      009A26 CC 96            [ 1] 1055 	jrne 9$
      009A28 D7 90            [ 2] 1056 	pushw y  
      009A2A F6               [ 2] 1057 	pushw x 
      009A2B 93 EE 01         [ 4] 1058 	call skip_string
      009A2E 72               [ 2] 1059 	popw x  
      009A2F A9 00 03         [ 4] 1060 	call strlen 
      009A32 C3 00            [ 1] 1061 	add a,#REC_XTRA_BYTES
      009A34 21 23 05         [ 4] 1062 	call search_name
      009A37 A6               [ 2] 1063 	tnzw x 
      009A38 0A CC            [ 1] 1064 	jrne 82$ 
      009A3A 96 D9            [ 2] 1065 	popw y 
      009A3C 5D 27            [ 2] 1066 	jra 16$
      001A37                       1067 82$:
      009A3E F8 89            [ 2] 1068 	popw y   
      009A40 58 72 FB         [ 4] 1069 	call get_value ; in A:X 
      009A43 01 1F            [ 2] 1070 	jra 18$
      001A3E                       1071 9$: 
      009A45 01 AE            [ 1] 1072 	cp a,#TK_CFUNC 
      009A47 16 90            [ 1] 1073 	jrne 12$
      001A42                       1074 	_get_code_addr 
      009A49 72               [ 2]    1         ldw x,(x)
      009A4A F0 01 5B 02      [ 1]    2         inc in 
      009A4E 81 5C 00 01      [ 1]    3         inc in 
      009A4F FD               [ 4] 1075 	call(x)
      009A4F 52               [ 1] 1076 	clrw x 
      009A50 01               [ 1] 1077 	rlwa x  ; char>int24 in A:X 
      009A51 0F 01            [ 2] 1078 	jra 18$ 	 
      001A50                       1079 12$:			
      009A53 CD 98            [ 1] 1080 	cp a,#TK_LPAREN
      009A55 3B 4D            [ 1] 1081 	jrne 16$
      009A57 26 03 CC         [ 4] 1082 	call expression
      009A5A 9B 01            [ 1] 1083 	ld a,#TK_RPAREN 
      009A5C A1 10 27         [ 4] 1084 	call expect
      001A5C                       1085 	_xpop 
      009A5F 06 A1            [ 1]    1     ld a,(y)
      009A61 11               [ 1]    2     ldw x,y 
      009A62 26 05            [ 2]    3     ldw x,(1,x)
      009A64 03 01 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009A66 20 08            [ 2] 1086 	jra 18$	
      001A67                       1087 16$:
      001A67                       1088 	_unget_token 
      009A66 CD 98 3B 00 01   [ 1]    1      mov in,in.saved  
      009A69 4F               [ 1] 1089 	clr a 
      009A69 4D 26            [ 2] 1090 	jra 22$ 
      001A6F                       1091 18$: 
      009A6B 03 CC            [ 1] 1092 	tnz (NEG,sp)
      009A6D 96 D7            [ 1] 1093 	jreq 20$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009A6F CD 02 05         [ 4] 1094 	call neg_ax   
      001A76                       1095 20$:
      001A76                       1096 	_xpush 
      009A6F A1 81 26 0C      [ 2]    1     subw y,#CELL_SIZE
      009A73 FE 72            [ 1]    2     ld (y),a 
      009A75 5C 00 02         [ 2]    3     ldw (1,y),x 
      009A78 72 5C            [ 1] 1097 	ld a,#TK_INTGR
      001A81                       1098 22$:
      001A81                       1099 	_drop VSIZE
      009A7A 00 02            [ 2]    1     addw sp,#VSIZE 
      009A7C FD               [ 4] 1100 	ret
                                   1101 
                                   1102 
                                   1103 ;-----------------------------------
                                   1104 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1105 ; output:
                                   1106 ;   A    	token attribute 
                                   1107 ;	xstack		value 
                                   1108 ;-----------------------------------
                           000001  1109 	MULOP=1
                           000001  1110 	VSIZE=1
      001A84                       1111 term:
      001A84                       1112 	_vars VSIZE
      009A7D 20 70            [ 2]    1     sub sp,#VSIZE 
                                   1113 ; first factor 	
      009A7F CD 19 CF         [ 4] 1114 	call factor
      009A7F A1               [ 1] 1115 	tnz a 
      009A80 84 26            [ 1] 1116 	jreq term_exit  
      001A8C                       1117 term01:	 ; check for  operator '*'|'/'|'%' 
      009A82 05 CD 98         [ 4] 1118 	call next_token
      009A85 6D 20            [ 1] 1119 	ld (MULOP,sp),a
      009A87 67 30            [ 1] 1120 	and a,#TK_GRP_MASK
      009A88 A1 20            [ 1] 1121 	cp a,#TK_GRP_MULT
      009A88 A1 05            [ 1] 1122 	jreq 1$
      009A8A 26 05            [ 1] 1123 	ld a,#TK_INTGR
      001A99                       1124 	_unget_token 
      009A8C CD 9A 1F 20 07   [ 1]    1      mov in,in.saved  
      009A91 20 24            [ 2] 1125 	jra term_exit 
      001AA0                       1126 1$:	; got *|/|%
                                   1127 ;second factor
      009A91 A1 85 26         [ 4] 1128 	call factor
      009A94 08               [ 1] 1129 	tnz a 
      009A95 CD 98            [ 1] 1130 	jrne 2$ 
      009A97 63 16 57         [ 2] 1131 	jp syntax_error 
      009A98                       1132 2$: ; select operation 	
      009A98 F6 EE            [ 1] 1133 	ld a,(MULOP,sp) 
      009A9A 01 20            [ 1] 1134 	cp a,#TK_MULT 
      009A9C 52 05            [ 1] 1135 	jrne 3$
                                   1136 ; '*' operator
      009A9D CD 02 69         [ 4] 1137 	call mul24 
      009A9D A1 03            [ 2] 1138 	jra term01
      009A9F 26 1D            [ 1] 1139 3$: cp a,#TK_DIV 
      009AA1 90 89            [ 1] 1140 	jrne 4$ 
                                   1141 ; '/' operator	
      009AA3 89 CD 98         [ 4] 1142 	call div24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009AA6 54 85            [ 2] 1143 	jra term01 
      001ABD                       1144 4$: ; '%' operator
      009AA8 CD 93 D9         [ 4] 1145 	call mod24
      009AAB AB 05            [ 2] 1146 	jra term01 
      001AC2                       1147 9$: 
      009AAD CD 9D            [ 1] 1148 	ld a,#TK_INTGR
      001AC4                       1149 term_exit:
      001AC4                       1150 	_drop VSIZE 
      009AAF 9C 5D            [ 2]    1     addw sp,#VSIZE 
      009AB1 26               [ 4] 1151 	ret 
                                   1152 
                                   1153 ;-------------------------------
                                   1154 ;  expr ::= term [['+'|'-'] term]*
                                   1155 ;  result range {-32768..32767}
                                   1156 ;  output:
                                   1157 ;   A    token attribute 
                                   1158 ;   xstack	 result    
                                   1159 ;-------------------------------
                           000001  1160 	OP=1 
                           000001  1161 	VSIZE=1 
      001AC7                       1162 expression:
      001AC7                       1163 	_vars VSIZE 
      009AB2 04 90            [ 2]    1     sub sp,#VSIZE 
                                   1164 ; first term 	
      009AB4 85 20 30         [ 4] 1165 	call term
      009AB7 4D               [ 1] 1166 	tnz a 
      009AB7 90 85            [ 1] 1167 	jreq 9$
      001ACF                       1168 1$:	; operator '+'|'-'
      009AB9 CD 9D 62         [ 4] 1169 	call next_token
      009ABC 20 31            [ 1] 1170 	ld (OP,sp),a 
      009ABE A4 30            [ 1] 1171 	and a,#TK_GRP_MASK
      009ABE A1 82            [ 1] 1172 	cp a,#TK_GRP_ADD 
      009AC0 26 0E            [ 1] 1173 	jreq 2$ 
      001ADA                       1174 	_unget_token 
      009AC2 FE 72 5C 00 02   [ 1]    1      mov in,in.saved  
      009AC7 72 5C            [ 1] 1175 	ld a,#TK_INTGR
      009AC9 00 02            [ 2] 1176 	jra 9$ 
      001AE3                       1177 2$: ; second term 
      009ACB FD 5F 02         [ 4] 1178 	call term
      009ACE 20               [ 1] 1179 	tnz a 
      009ACF 1F 03            [ 1] 1180 	jrne 3$
      009AD0 CC 16 57         [ 2] 1181 	jp syntax_error
      001AEC                       1182 3$:
      009AD0 A1 06            [ 1] 1183 	ld a,(OP,sp)
      009AD2 26 13            [ 1] 1184 	cp a,#TK_PLUS 
      009AD4 CD 9B            [ 1] 1185 	jrne 4$
                                   1186 ; '+' operator	
      009AD6 47 A6 07         [ 4] 1187 	call add24
      009AD9 CD 99            [ 2] 1188 	jra 1$ 
      001AF7                       1189 4$:	; '-' operator 
      009ADB F1 90 F6         [ 4] 1190 	call sub24
      009ADE 93 EE            [ 2] 1191 	jra 1$
      001AFC                       1192 9$:
      001AFC                       1193 	_drop VSIZE 
      009AE0 01 72            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      009AE2 A9               [ 4] 1194 	ret 
                                   1195 
                                   1196 ;---------------------------------------------
                                   1197 ; rel ::= expr rel_op expr
                                   1198 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1199 ;  relation return  integer , zero is false 
                                   1200 ;  output:
                                   1201 ;	 xstack		value  
                                   1202 ;---------------------------------------------
                           000001  1203 	RELOP=1
                           000001  1204 	VSIZE=1 
      001AFF                       1205 relation: 
      001AFF                       1206 	_vars VSIZE
      009AE3 00 03            [ 2]    1     sub sp,#VSIZE 
      009AE5 20 08 C7         [ 4] 1207 	call expression
      009AE7 4D               [ 1] 1208 	tnz a 
      009AE7 55 00            [ 1] 1209 	jreq 9$ 
                                   1210 ; expect rel_op or leave 
      009AE9 03 00 02         [ 4] 1211 	call next_token 
      009AEC 4F 20            [ 1] 1212 	ld (RELOP,sp),a 
      009AEE 12 30            [ 1] 1213 	and a,#TK_GRP_MASK
      009AEF A1 30            [ 1] 1214 	cp a,#TK_GRP_RELOP 
      009AEF 0D 01            [ 1] 1215 	jreq 2$
      009AF1 27 03            [ 1] 1216 	ld a,#TK_INTGR 
      001B14                       1217 	_unget_token 
      009AF3 CD 82 85 00 01   [ 1]    1      mov in,in.saved  
      009AF6 20 40            [ 2] 1218 	jra 9$ 
      001B1B                       1219 2$:	; expect another expression
      009AF6 72 A2 00         [ 4] 1220 	call expression
      009AF9 03               [ 1] 1221 	tnz a 
      009AFA 90 F7            [ 1] 1222 	jrne 3$
      009AFC 90 EF 01         [ 2] 1223 	jp syntax_error 
      001B24                       1224 3$: 
      009AFF A6 84 A8         [ 4] 1225 	call cp24 
      009B01                       1226 	_xpop  
      009B01 5B 01            [ 1]    1     ld a,(y)
      009B03 81               [ 1]    2     ldw x,y 
      009B04 EE 01            [ 2]    3     ldw x,(1,x)
      009B04 52 01 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      009B08 4F               [ 1] 1227 	tnz a 
      009B09 4D 27            [ 1] 1228 	jrmi 4$
      009B0B 38 0C            [ 1] 1229 	jrne 5$
      009B0C 35 02 00 0E      [ 1] 1230 	mov acc8,#2 ; i1==i2
      009B0C CD 98            [ 2] 1231 	jra 6$ 
      001B3B                       1232 4$: ; i1<i2
      009B0E 3B 6B 01 A4      [ 1] 1233 	mov acc8,#4 
      009B12 30 A1            [ 2] 1234 	jra 6$
      001B41                       1235 5$: ; i1>i2
      009B14 20 27 09 A6      [ 1] 1236 	mov acc8,#1  
      001B45                       1237 6$: ; 0=false, -1=true 
      009B18 84               [ 1] 1238 	clrw x 
      009B19 55 00 03         [ 1] 1239 	ld a, acc8  
      009B1C 00 02            [ 1] 1240 	and a,(RELOP,sp)
      009B1E 20 24            [ 1] 1241 	jreq 7$
      009B20 53               [ 2] 1242 	cplw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009B20 CD 9A            [ 1] 1243 	ld a,#255 
      001B50                       1244 7$:	_xpush 
      009B22 4F 4D 26 03      [ 2]    1     subw y,#CELL_SIZE
      009B26 CC 96            [ 1]    2     ld (y),a 
      009B28 D7 EF 01         [ 2]    3     ldw (1,y),x 
      009B29 A6 84            [ 1] 1245 	ld a,#TK_INTGR
      001B5B                       1246 9$: 
      001B5B                       1247 	_drop VSIZE
      009B29 7B 01            [ 2]    1     addw sp,#VSIZE 
      009B2B A1               [ 4] 1248 	ret 
                                   1249 
                                   1250 ;-------------------------------------------
                                   1251 ;  AND factor:  [NOT] relation | (condition)
                                   1252 ;  output:
                                   1253 ;     A      TK_INTGR|0
                                   1254 ;-------------------------------------------
                           000001  1255 	NOT_OP=1
      001B5E                       1256 and_factor:
      009B2C 20 26            [ 1] 1257 	push #0 
      009B2E 05 CD 82         [ 4] 1258 0$:	call next_token  
      009B31 E9               [ 1] 1259 	tnz a 
      009B32 20 D8            [ 1] 1260 	jreq 8$ 
      009B34 A1 21            [ 1] 1261 	cp a,#TK_NOT 
      009B36 26 05            [ 1] 1262 	jrne 1$ 
      009B38 CD 83            [ 1] 1263 	cpl (NOT_OP,sp)
      009B3A 77 20            [ 2] 1264 	jra 0$ 
      001B6E                       1265 1$:	
      009B3C CF 06            [ 1] 1266 	cp a,#TK_LPAREN 
      009B3D 26 0A            [ 1] 1267 	jrne 2$
      009B3D CD 84 11         [ 4] 1268 	call condition
      009B40 20 CA            [ 1] 1269 	ld a,#TK_RPAREN 
      009B42 CD 19 71         [ 4] 1270 	call expect
      009B42 A6 84            [ 2] 1271 	jra 3$
      009B44                       1272 2$: _unget_token 
      009B44 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009B47 CD 1A FF         [ 4] 1273 	call relation
      001B84                       1274 3$:
      009B47 52 01            [ 1] 1275 	tnz (NOT_OP,sp)
      009B49 CD 9B            [ 1] 1276 	jreq 8$ 
      009B4B 04 4D 27         [ 4] 1277 	call cpl24
      001B8B                       1278 8$:
      001B8B                       1279 	_drop 1  
      009B4E 2D 01            [ 2]    1     addw sp,#1 
      009B4F 81               [ 4] 1280     ret 
                                   1281 
                                   1282 
                                   1283 ;--------------------------------------------
                                   1284 ;  AND operator as priority over OR||XOR 
                                   1285 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1286 ;          
                                   1287 ;  output:
                                   1288 ;     A     TK_INTGR|0
                                   1289 ;    xtack   value 
                                   1290 ;--------------------------------------------
      001B8E                       1291 and_cond:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009B4F CD 98 3B         [ 4] 1292 	call and_factor
      009B52 6B               [ 1] 1293 	tnz a 
      009B53 01 A4            [ 1] 1294 	jreq 9$  
      009B55 30 A1 10         [ 4] 1295 1$: call next_token 
      009B58 27               [ 1] 1296 	tnz a 
      009B59 09 55            [ 1] 1297 	jreq 6$ 
      009B5B 00 03            [ 1] 1298 	cp a,#TK_AND 
      009B5D 00 02            [ 1] 1299 	jreq 3$
      001B9E                       1300 	_unget_token 
      009B5F A6 84 20 19 01   [ 1]    1      mov in,in.saved  
      009B63 20 38            [ 2] 1301 	jra 6$ 
      009B63 CD 9B 04         [ 4] 1302 3$:	call and_factor  
      009B66 4D               [ 1] 1303 	tnz a 
      009B67 26 03            [ 1] 1304 	jrne 4$
      009B69 CC 96 D7         [ 2] 1305 	jp syntax_error 
      009B6C                       1306 4$:	
      001BAE                       1307 	_xpop 
      009B6C 7B 01            [ 1]    1     ld a,(y)
      009B6E A1               [ 1]    2     ldw x,y 
      009B6F 10 26            [ 2]    3     ldw x,(1,x)
      009B71 05 CD 81 EE      [ 2]    4     addw y,#CELL_SIZE 
      009B75 20 D8 0C         [ 1] 1308 	ld acc24,a 
      009B77 CF 00 0D         [ 2] 1309 	ldw acc16,x
      001BBD                       1310 	_xpop 
      009B77 CD 82            [ 1]    1     ld a,(y)
      009B79 0B               [ 1]    2     ldw x,y 
      009B7A 20 D3            [ 2]    3     ldw x,(1,x)
      009B7C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B7C 5B 01 81         [ 1] 1311 	and a,acc24 
      009B7F 02               [ 1] 1312 	rlwa x 
      009B7F 52 01 CD         [ 1] 1313 	and a,acc16 
      009B82 9B               [ 1] 1314 	rlwa x 
      009B83 47 4D 27         [ 1] 1315 	and a,acc8 
      009B86 54               [ 1] 1316 	rlwa x
      001BD2                       1317 	_xpush
      009B87 CD 98 3B 6B      [ 2]    1     subw y,#CELL_SIZE
      009B8B 01 A4            [ 1]    2     ld (y),a 
      009B8D 30 A1 30         [ 2]    3     ldw (1,y),x 
      009B90 27 09            [ 2] 1318 	jra 1$  
      009B92 A6 84            [ 1] 1319 6$: ld a,#TK_INTGR 
      009B94 55               [ 4] 1320 9$:	ret 	 
                                   1321 
                                   1322 
                                   1323 ;--------------------------------------------
                                   1324 ; condition for IF and UNTIL 
                                   1325 ; operators: OR,XOR 
                                   1326 ; format:  and_cond [ OP and_cond ]* 
                                   1327 ; output:
                                   1328 ;    A        INTGR|0 
                                   1329 ;    xstack   value 
                                   1330 ;--------------------------------------------
                           000001  1331 	ATMP=1
                           000002  1332 	OP=2
                           000002  1333 	VSIZE=2 
      001BE0                       1334 condition:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001BE0                       1335 	_vars VSIZE 
      009B95 00 03            [ 2]    1     sub sp,#VSIZE 
      009B97 00 02 20         [ 4] 1336 	call and_cond
      009B9A 40               [ 1] 1337 	tnz a 
      009B9B 27 69            [ 1] 1338 	jreq 9$ 
      009B9B CD 9B 47         [ 4] 1339 1$:	call next_token 
      009B9E 4D 26            [ 1] 1340 	cp a,#TK_OR 
      009BA0 03 CC            [ 1] 1341 	jreq 2$
      009BA2 96 D7            [ 1] 1342 	cp a,#TK_XOR
      009BA4 27 07            [ 1] 1343 	jreq 2$ 
      001BF3                       1344 	_unget_token 
      009BA4 CD 82 28 90 F6   [ 1]    1      mov in,in.saved  
      009BA9 93 EE            [ 2] 1345 	jra 8$ 
      009BAB 01 72            [ 1] 1346 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009BAD A9 00 03         [ 4] 1347 	call and_cond
      009BB0 4D 2B            [ 1] 1348 	cp a,#TK_INTGR 
      009BB2 08 26            [ 1] 1349 	jreq 3$
      009BB4 0C 35 02         [ 2] 1350 	jp syntax_error 
      001C06                       1351 3$:	 
      001C06                       1352 	_xpop  ; rigth arg 
      009BB7 00 0F            [ 1]    1     ld a,(y)
      009BB9 20               [ 1]    2     ldw x,y 
      009BBA 0A 01            [ 2]    3     ldw x,(1,x)
      009BBB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009BBB 35 04 00         [ 1] 1353 	ld acc24,a 
      009BBE 0F 20 04         [ 2] 1354 	ldw acc16,x 
      009BC1                       1355 	_xpop  ; left arg  
      009BC1 35 01            [ 1]    1     ld a,(y)
      009BC3 00               [ 1]    2     ldw x,y 
      009BC4 0F 01            [ 2]    3     ldw x,(1,x)
      009BC5 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009BC5 5F C6            [ 1] 1356 	ld (ATMP,sp),a 
      009BC7 00 0F            [ 1] 1357 	ld a,(OP,sp)
      009BC9 14 01            [ 1] 1358 	cp a,#TK_XOR 
      009BCB 27 03            [ 1] 1359 	jreq 5$ 
      001C26                       1360 4$: ; A:X OR acc24   
      009BCD 53 A6            [ 1] 1361 	ld a,(ATMP,sp)
      009BCF FF 72 A2         [ 1] 1362 	or a,acc24 
      009BD2 00               [ 1] 1363 	rlwa x 
      009BD3 03 90 F7         [ 1] 1364 	or a,acc16 
      009BD6 90               [ 1] 1365 	rlwa x 
      009BD7 EF 01 A6         [ 1] 1366 	or a,acc8 
      009BDA 84               [ 1] 1367 	rlwa x 
      009BDB 20 0E            [ 2] 1368 	jra 6$  
      001C36                       1369 5$: ; A:X XOR acc24 
      009BDB 5B 01            [ 1] 1370 	ld a,(ATMP,sp)
      009BDD 81 00 0C         [ 1] 1371 	xor a,acc24 
      009BDE 02               [ 1] 1372 	rlwa x 
      009BDE 4B 00 CD         [ 1] 1373 	xor a,acc16 
      009BE1 98               [ 1] 1374 	rlwa x 
      009BE2 3B 4D 27         [ 1] 1375 	xor a,acc8 
      009BE5 25               [ 1] 1376 	rlwa x 
      001C44                       1377 6$: _xpush
      009BE6 A1 87 26 04      [ 2]    1     subw y,#CELL_SIZE
      009BEA 03 01            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009BEC 20 F2 01         [ 2]    3     ldw (1,y),x 
      009BEE 20 99            [ 2] 1378 	jra 1$ 
      009BEE A1 06            [ 1] 1379 8$:	ld a,#TK_INTGR 
      001C51                       1380 9$:	_drop VSIZE 
      009BF0 26 0A            [ 2]    1     addw sp,#VSIZE 
      009BF2 CD               [ 4] 1381 	ret 
                                   1382 
                                   1383 
                                   1384 ;--------------------------------------------
                                   1385 ; BASIC: HEX 
                                   1386 ; select hexadecimal base for integer print
                                   1387 ;---------------------------------------------
      001C54                       1388 hex_base:
      009BF3 9C 60 A6 07      [ 1] 1389 	mov base,#16 
      009BF7 CD               [ 4] 1390 	ret 
                                   1391 
                                   1392 ;--------------------------------------------
                                   1393 ; BASIC: DEC 
                                   1394 ; select decimal base for integer print
                                   1395 ;---------------------------------------------
      001C59                       1396 dec_base:
      009BF8 99 F1 20 08      [ 1] 1397 	mov base,#10
      009BFC 55               [ 4] 1398 	ret 
                                   1399 
                                   1400 ;------------------------
                                   1401 ; BASIC: FREE 
                                   1402 ; return free size in RAM 
                                   1403 ; output:
                                   1404 ;   A:x		size 
                                   1405 ;--------------------------
      001C5E                       1406 free:
      009BFD 00               [ 1] 1407 	clr a 
      009BFE 03 00 02         [ 2] 1408 	ldw x,#tib 
      009C01 CD 9B 7F 32      [ 2] 1409 	subw x,dvar_end 
      009C04 81               [ 4] 1410 	ret 
                                   1411 
                                   1412 ;------------------------------
                                   1413 ; BASIC: SIZE 
                                   1414 ; command that print 
                                   1415 ; program start addres and size 
                                   1416 ;------------------------------
      001C67                       1417 cmd_size:
      009C04 0D 01 27         [ 1] 1418 	push base 
      009C07 03 CD 82         [ 2] 1419 	ldw x,#PROG_ADDR 
      009C0A 6A 09 3B         [ 4] 1420 	call puts 
      009C0B CE 00 1B         [ 2] 1421 	ldw x,txtbgn     
      009C0B 5B 01 81 0A      [ 1] 1422 	mov base,#16 
      009C0E CD 18 03         [ 4] 1423 	call prt_i16
      009C0E CD 9B DE         [ 1] 1424 	pop base 
      009C11 4D 27 4B         [ 2] 1425 	ldw x,#PROG_SIZE 
      009C14 CD 98 3B         [ 4] 1426 	call puts 
      009C17 4D 27 43         [ 2] 1427 	ldw x,txtend 
      009C1A A1 88 27 07      [ 2] 1428 	subw x,txtbgn 
      009C1E 55 00 03         [ 4] 1429 	call prt_i16
      009C21 00 02 20         [ 2] 1430 	ldw x,#STR_BYTES 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009C24 38 CD 9B         [ 4] 1431 	call puts  
      009C27 DE               [ 4] 1432 	ret 
                                   1433 
                                   1434 
                                   1435 ;------------------------
                                   1436 ; BASIC: UBOUND  
                                   1437 ; return array variable size 
                                   1438 ; and set 'array_size' variable 
                                   1439 ; output:
                                   1440 ;   A:X 	array_size
                                   1441 ;--------------------------
      001C94                       1442 ubound:
      009C28 4D 26 03         [ 4] 1443 	call free 
      009C2B CC 96            [ 1] 1444 	ld a,#CELL_SIZE 
      009C2D D7               [ 2] 1445 	div x,a 
      009C2E CF 00 20         [ 2] 1446 	ldw array_size,x
      009C2E 90               [ 1] 1447 	clr a 
      009C2F F6               [ 4] 1448 	ret 
                                   1449 
                                   1450 ;-----------------------------
                                   1451 ; BASIC: LET var=expr 
                                   1452 ; variable assignement 
                                   1453 ; output:
                                   1454 ;   A 		TK_NONE 
                                   1455 ;-----------------------------
      001C9F                       1456 let::
      009C30 93 EE 01         [ 4] 1457 	call next_token 
      009C33 72 A9            [ 1] 1458 	cp a,#TK_VAR 
      009C35 00 03            [ 1] 1459 	jreq let_var
      009C37 C7 00            [ 1] 1460 	cp a,#TK_ARRAY 
      009C39 0D CF            [ 1] 1461 	jreq  let_array
      009C3B 00 0E 90         [ 2] 1462 	jp syntax_error
      001CAD                       1463 let_array:
      009C3E F6 93 EE         [ 4] 1464 	call get_array_element
      009C41 01 72            [ 2] 1465 	jra let_eval 
      001CB2                       1466 let_var:
      009C43 A9 00 03         [ 4] 1467 	call get_addr
      001CB5                       1468 let_eval:
      009C46 C4 00 0D         [ 2] 1469 	ldw ptr16,x  ; variable address 
      009C49 02 C4 00         [ 4] 1470 	call next_token 
      009C4C 0E 02            [ 1] 1471 	cp a,#TK_EQUAL
      009C4E C4 00            [ 1] 1472 	jreq 1$
      009C50 0F 02 72         [ 2] 1473 	jp syntax_error
      001CC2                       1474 1$:	
      009C53 A2 00 03         [ 4] 1475 	call condition   
      009C56 90 F7            [ 1] 1476 	cp a,#TK_INTGR 
      009C58 90 EF            [ 1] 1477 	jreq 2$
      009C5A 01 20 B7         [ 2] 1478 	jp syntax_error
      001CCC                       1479 2$:	
      001CCC                       1480 	_xpop ; value 
      009C5D A6 84            [ 1]    1     ld a,(y)
      009C5F 81               [ 1]    2     ldw x,y 
      009C60 EE 01            [ 2]    3     ldw x,(1,x)
      009C60 52 02 CD 9C      [ 2]    4     addw y,#CELL_SIZE 
      001CD5                       1481 3$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009C64 0E 4D 27 69      [ 4] 1482 	ld [ptr16],a
      009C68 CD 98 3B A1      [ 1] 1483 	inc ptr8  
      009C6C 89 27 0B A1      [ 5] 1484 	ldw [ptr16],x 
      009C70 8A               [ 4] 1485 	ret 
                                   1486 
                                   1487 
                                   1488 ;--------------------------
                                   1489 ; return constant/dvar value 
                                   1490 ; from it's record address
                                   1491 ; input:
                                   1492 ;	X	*const record 
                                   1493 ; output:
                                   1494 ;   A:X   const  value
                                   1495 ;--------------------------
      001CE2                       1496 get_value: ; -- i 
      009C71 27               [ 1] 1497 	ld a,(x) ; record size 
      009C72 07 55            [ 1] 1498 	and a,#NAME_MAX_LEN
      009C74 00 03            [ 1] 1499 	sub a,#CELL_SIZE ; * value 
      009C76 00               [ 1] 1500 	push a 
      009C77 02 20            [ 1] 1501 	push #0 
      009C79 55 6B 02         [ 2] 1502 	addw x,(1,sp)
      009C7C CD               [ 1] 1503 	ld a,(x)
      009C7D 9C 0E            [ 2] 1504 	ldw x,(1,x)
      001CF0                       1505 	_drop 2
      009C7F A1 84            [ 2]    1     addw sp,#2 
      009C81 27               [ 4] 1506 	ret 
                                   1507 
                                   1508 
                                   1509 ;--------------------------
                                   1510 ; BASIC: EEFREE 
                                   1511 ; eeprom_free 
                                   1512 ; search end of data  
                                   1513 ; in EEPROM 
                                   1514 ; input:
                                   1515 ;    none 
                                   1516 ; output:
                                   1517 ;    A:X     address free
                                   1518 ;-------------------------
      001CF3                       1519 func_eefree:
      009C82 03 CC 96         [ 2] 1520 	ldw x,#EEPROM_BASE 
      009C85 D7 08 00 0E      [ 1] 1521 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009C86 A3 47 F8         [ 2] 1522     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009C86 90 F6            [ 1] 1523 	jruge 8$ ; no free space 
      009C88 93               [ 1] 1524 2$: ld a,(x)
      009C89 EE 01            [ 1] 1525 	jrne 3$
      009C8B 72               [ 1] 1526 	incw x 
      009C8C A9 00 03 C7      [ 1] 1527 	dec acc8 
      009C90 00 0D            [ 1] 1528 	jrne 2$
      009C92 CF 00 0E         [ 2] 1529 	subw x,#8 
      009C95 90 F6            [ 2] 1530 	jra 9$  
      009C97 93               [ 1] 1531 3$: ld a,(x)
      009C98 EE               [ 1] 1532 	incw x
      009C99 01               [ 1] 1533 	tnz a  
      009C9A 72 A9            [ 1] 1534 	jrne 3$
      009C9C 00               [ 2] 1535 	decw x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009C9D 03 6B            [ 2] 1536 	jra 1$ 
      009C9F 01               [ 1] 1537 8$: clrw x ; no free space 
      009CA0 7B               [ 1] 1538 9$: clr a 
      009CA1 02 A1 8A         [ 2] 1539 	ldw free_eeprom,x ; save in system variable 
      009CA4 27               [ 4] 1540 	ret 
                                   1541 
                           000005  1542 REC_XTRA_BYTES=5 
                                   1543 ;--------------------------
                                   1544 ; search constant/dim_var name 
                                   1545 ; format of record  
                                   1546 ;   .byte record length 
                                   1547 ;         = strlen(name)+5 
                                   1548 ;   .asciz name (variable length)
                                   1549 ;   .int24 value (3 bytes )
                                   1550 ; a constant record use 7+ bytes
                                   1551 ; constants are saved in EEPROM  
                                   1552 ; input:
                                   1553 ;    A     record_len 
                                   1554 ;    X     *name
                                   1555 ; output:
                                   1556 ;    X     address|0
                                   1557 ; use:
                                   1558 ;   A,Y, acc16 
                                   1559 ;-------------------------
                           000001  1560 	NAMEPTR=1 ; target name pointer 
                           000003  1561 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1562 	RECLEN=5  ; record length of target
                           000007  1563 	LIMIT=7   ; search area limit 
                           000008  1564 	VSIZE=8  
      001D1C                       1565 search_name:
      009CA5 10 89            [ 2] 1566 	pushw y 
      009CA6                       1567 	_vars VSIZE
      009CA6 7B 01            [ 2]    1     sub sp,#VSIZE 
      009CA8 CA 00 0D 02      [ 1] 1568 	clr acc16 
      009CAC CA 00            [ 1] 1569 	ld (RECLEN,sp),a    
      009CAE 0E 02            [ 2] 1570 	ldw (NAMEPTR,sp),x
      009CB0 CA 00 0F         [ 2] 1571 	ldw x,dvar_end 
      009CB3 02 20            [ 2] 1572 	ldw (LIMIT,sp),x 
      009CB5 0E CE 00 30      [ 2] 1573 	ldw y,dvar_bgn
      009CB6 17 03            [ 2] 1574 1$:	ldw (WLKPTR,sp),y
      009CB6 7B               [ 1] 1575 	ldw x,y 
      009CB7 01 C8            [ 2] 1576 	cpw x, (LIMIT,sp) 
      009CB9 00 0D            [ 1] 1577 	jruge 7$ ; no match found 
      009CBB 02 C8            [ 1] 1578 	ld a,(y)
      009CBD 00 0E            [ 1] 1579 	and a,#NAME_MAX_LEN
      009CBF 02 C8            [ 1] 1580 	cp a,(RECLEN,sp)
      009CC1 00 0F            [ 1] 1581 	jrne 2$ 
      009CC3 02 72            [ 1] 1582 	incw y 
      009CC5 A2 00            [ 2] 1583 	ldw x,(NAMEPTR,sp)
      009CC7 03 90 F7         [ 4] 1584 	call strcmp
      009CCA 90 EF            [ 1] 1585 	jrne 8$ ; match found 
      001D49                       1586 2$: ; skip this one 	
      009CCC 01 20            [ 2] 1587 	ldW Y,(WLKPTR,sp)
      009CCE 99 A6            [ 1] 1588 	ld a,(y)
      009CD0 84 5B            [ 1] 1589 	and a,#NAME_MAX_LEN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009CD2 02 81 0E         [ 1] 1590 	ld acc8,a 
      009CD4 72 B9 00 0D      [ 2] 1591 	addw y,acc16 
      009CD4 35 10            [ 2] 1592 	jra 1$  
      001D58                       1593 7$: ; no match found 
      009CD6 00 0B            [ 1] 1594 	clr (WLKPTR,sp)
      009CD8 81 04            [ 1] 1595 	clr (WLKPTR+1,sp)
      009CD9                       1596 8$: ; match found 
      009CD9 35 0A            [ 2] 1597 	ldw x,(WLKPTR,sp) ; record address 
      001D5E                       1598 9$:	_DROP VSIZE
      009CDB 00 0B            [ 2]    1     addw sp,#VSIZE 
      009CDD 81 85            [ 2] 1599 	popw y 
      009CDE 81               [ 4] 1600 	 ret 
                                   1601 
                                   1602 ;--------------------------------------------
                                   1603 ; BASIC: CONST name=value [, name=value]*
                                   1604 ; define constant(s) saved in EEPROM
                                   1605 ; share most of his code with cmd_dim 
                                   1606 ;--------------------------------------------
                           000001  1607 	VAR_NAME=1 
                           000003  1608 	REC_LEN=3
                           000005  1609 	RONLY=5
                           000005  1610 	VSIZE=5
      001D63                       1611 cmd_const:
      009CDE 4F AE 16 90 72   [ 2] 1612 	btjt flags,#FRUN,0$
      009CE3 B0 00            [ 1] 1613 	ld a,#ERR_RUN_ONLY
      009CE5 33 81 59         [ 2] 1614 	jp tb_error 
      009CE7                       1615 0$: 
      001D6D                       1616 	_vars VSIZE 
      009CE7 3B 00            [ 2]    1     sub sp,#VSIZE 
      009CE9 0B AE            [ 1] 1617 	ld a,#128 
      009CEB 9E D4            [ 1] 1618 	ld (RONLY,sp),a 
      009CED CD 89            [ 1] 1619 	clr (REC_LEN,sp)
      009CEF BB CE            [ 2] 1620 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1621 
                                   1622 ;---------------------------------
                                   1623 ; BASIC: DIM var_name [var_name]* 
                                   1624 ; create named variables at end 
                                   1625 ; of BASIC program. 
                                   1626 ; These variables are initialized 
                                   1627 ; to 0. 
                                   1628 ; record format same ast CONST 
                                   1629 ; but r/w because stored in RAM 
                                   1630 ;---------------------------------
      001D77                       1631 cmd_dim:
      009CF1 00 1C 35 10 00   [ 2] 1632 	btjt flags,#FRUN,cmd_dim1
      009CF6 0B CD            [ 1] 1633 	ld a,#ERR_RUN_ONLY
      009CF8 98 83 32         [ 2] 1634 	jp tb_error 
      001D81                       1635 cmd_dim1:	
      001D81                       1636 	_vars VSIZE
      009CFB 00 0B            [ 2]    1     sub sp,#VSIZE 
      009CFD AE 9E            [ 1] 1637 	clr (REC_LEN,sp )
      009CFF E6 CD            [ 1] 1638 	clr (RONLY,sp)
      001D87                       1639 cmd_dim2: 
      009D01 89 BB CE         [ 4] 1640 0$:	call next_token 
      009D04 00 1E            [ 1] 1641 	cp a,#TK_LABEL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009D06 72 B0            [ 1] 1642 	jreq 1$ 
      009D08 00 1C CD         [ 2] 1643 	jp syntax_error 
      009D0B 98 83            [ 2] 1644 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009D0D AE 9E F7         [ 4] 1645 	call strlen
      009D10 CD 89            [ 1] 1646 	add a,#REC_XTRA_BYTES
      009D12 BB 81            [ 1] 1647 	ld (REC_LEN+1,sp),a
      009D14 CD 17 D4         [ 4] 1648 	call skip_string 
      009D14 CD 9C            [ 1] 1649 	ld a,(REC_LEN+1,sp)
      009D16 DE A6            [ 2] 1650 	ldw x,(VAR_NAME,sp) 
      009D18 03 62 CF         [ 4] 1651 	call search_name  
      009D1B 00               [ 2] 1652 	tnzw x 
      009D1C 21 4F            [ 1] 1653 	jreq 2$
      009D1E 81 08            [ 1] 1654 	ld a,#ERR_DUPLICATE
      009D1F CC 16 59         [ 2] 1655 	jp tb_error  
      009D1F CD 98 3B         [ 2] 1656 2$:	ldw x,dvar_end 
      009D22 A1 85            [ 1] 1657 	ld a,(REC_LEN+1,sp)
      009D24 27 0C            [ 1] 1658 	or a,(RONLY,sp)
      009D26 A1               [ 1] 1659 	ld (x),a 
      009D27 05               [ 1] 1660 	incw x 
      009D28 27 03            [ 2] 1661 	pushw y 
      009D2A CC 96            [ 2] 1662 	ldw y,(VAR_NAME+2,sp)
      009D2C D7 13 75         [ 4] 1663 	call strcpy
      009D2D 90 85            [ 2] 1664 	popw y 
      009D2D CD               [ 2] 1665 	decw x
      009D2E 9A 1F 20         [ 2] 1666 	addw x,(REC_LEN,sp)
      009D31 03 00 32         [ 2] 1667 	ldw dvar_end,x 
      009D32 1D 00 03         [ 2] 1668 	subw x,#CELL_SIZE  
      009D32 CD               [ 1] 1669 	clr (x)
      009D33 98 63            [ 1] 1670 	clr (1,x)  
      009D35 6F 02            [ 1] 1671 	clr (2,x)
      009D35 CF 00 1A         [ 4] 1672 4$: call next_token 
      009D38 CD 98            [ 1] 1673 	cp a,#TK_COMMA 
      009D3A 3B A1            [ 1] 1674 	jreq 0$ 
      009D3C 32 27            [ 1] 1675 	cp a,#TK_EQUAL 
      009D3E 03 CC            [ 1] 1676 	jrne 8$
                                   1677 ; initialize variable 
      009D40 96 D7 E0         [ 4] 1678 	call condition 
      009D42 A1 84            [ 1] 1679 	cp a,#TK_INTGR
      009D42 CD 9C            [ 1] 1680 	jreq 5$
      009D44 60 A1 84         [ 2] 1681 	jp syntax_error
      009D47 27 03 CC         [ 2] 1682 5$: ldw x,dvar_end 
      009D4A 96 D7 03         [ 2] 1683 	subw x,#CELL_SIZE 
      009D4C CF 00 19         [ 2] 1684 	ldw ptr16,x 
      001DEB                       1685 	_xpop 
      009D4C 90 F6            [ 1]    1     ld a,(y)
      009D4E 93               [ 1]    2     ldw x,y 
      009D4F EE 01            [ 2]    3     ldw x,(1,x)
      009D51 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D55 72 C7 00 19      [ 4] 1686 	ld [ptr16],a 
      009D55 72 C7 00 1A      [ 1] 1687 	inc ptr8 
      009D59 72 5C 00 1B      [ 5] 1688 	ldw [ptr16],x 
      009D5D 72 CF            [ 2] 1689 	jra 4$ 
      001E02                       1690 8$:	
      001E02                       1691 	_unget_token 	
      009D5F 00 1A 81 00 01   [ 1]    1      mov in,in.saved  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009D62                       1692 	_drop VSIZE 
      009D62 F6 A4            [ 2]    1     addw sp,#VSIZE 
      009D64 0F A0 03         [ 4] 1693 	call ubound 
      009D67 88               [ 4] 1694 	ret 
                                   1695 
                                   1696 
                                   1697 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1698 ; return program size 
                                   1699 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E0D                       1700 prog_size:
      009D68 4B 00 72         [ 2] 1701 	ldw x,txtend 
      009D6B FB 01 F6 EE      [ 2] 1702 	subw x,txtbgn 
      009D6F 01               [ 4] 1703 	ret 
                                   1704 
                                   1705 ;----------------------------
                                   1706 ; print program information 
                                   1707 ;---------------------------
      001E15                       1708 program_info: 
      009D70 5B 02 81         [ 2] 1709 	ldw x,#PROG_ADDR 
      009D73 CD 09 3B         [ 4] 1710 	call puts 
      009D73 AE 40 00         [ 2] 1711 	ldw x,txtbgn 
      009D76 35 08 00 0F      [ 1] 1712 	mov base,#16 
      009D7A A3 47 F8         [ 4] 1713 	call prt_i16
      009D7D 24 17 F6 26      [ 1] 1714 	mov base,#10  
      009D81 0C 5C 72         [ 2] 1715 	ldw x,#PROG_SIZE
      009D84 5A 00 0F         [ 4] 1716 	call puts 
      009D87 26 F6 1D         [ 4] 1717 	call prog_size 
      009D8A 00 08 20         [ 4] 1718 	call prt_i16 
      009D8D 09 F6 5C         [ 2] 1719 	ldw x,#STR_BYTES 
      009D90 4D 26 FB         [ 4] 1720 	call puts
      009D93 5A 20 E0         [ 2] 1721 	ldw x,txtbgn
      009D96 5F 4F CF         [ 2] 1722 	cpw x,#app 
      009D99 00 25            [ 1] 1723 	jrult 2$
      009D9B 81 1E 7E         [ 2] 1724 	ldw x,#FLASH_MEM 
      009D9C 20 03            [ 2] 1725 	jra 3$
      009D9C 90 89 52         [ 2] 1726 2$: ldw x,#RAM_MEM 	 
      009D9F 08 72 5F         [ 4] 1727 3$:	call puts 
      009DA2 00 0E            [ 1] 1728 	ld a,#CR 
      009DA4 6B 05 1F         [ 4] 1729 	call putc
      009DA7 01               [ 4] 1730 	ret 
                                   1731 
      009DA8 CE 00 33 1F 07 90 CE  1732 PROG_ADDR: .asciz "program address: "
             00 31 17 03 93 13 07
             24 20 90 F6
      009DBA A4 0F 11 05 26 09 90  1733 PROG_SIZE: .asciz ", program size: "
             5C 1E 01 CD 93 E4 26
             13 20 00
      009DC9 20 62 79 74 65 73 00  1734 STR_BYTES: .asciz " bytes" 
      009DC9 16 03 90 F6 A4 0F C7  1735 FLASH_MEM: .asciz " in FLASH memory" 
             00 0F 72 B9 00 0E 20
             D9 79 00
      009DD8 20 69 6E 20 52 41 4D  1736 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1737 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   1738 
                                   1739 ;----------------------------
                                   1740 ; BASIC: LIST [[start][,end]]
                                   1741 ; list program lines 
                                   1742 ; form start to end 
                                   1743 ; if empty argument list then 
                                   1744 ; list all.
                                   1745 ;----------------------------
                           000001  1746 	FIRST=1
                           000003  1747 	LAST=3 
                           000005  1748 	LN_PTR=5
                           000006  1749 	VSIZE=6 
      001E9E                       1750 list:
      009DD8 0F 03 0F 04 05   [ 2] 1751 	btjf flags,#FRUN,0$
      009DDC A6 07            [ 1] 1752 	ld a,#ERR_CMD_ONLY
      009DDC 1E 03 5B         [ 2] 1753 	jp tb_error
      001EA8                       1754 0$:	 
      009DDF 08 90 85         [ 4] 1755 	call prog_size 
      009DE2 81 01            [ 1] 1756 	jrugt 3$
      009DE3 81               [ 4] 1757 	ret 
      001EAE                       1758 3$: _vars VSIZE
      009DE3 72 00            [ 2]    1     sub sp,#VSIZE 
      009DE5 00 23 05         [ 2] 1759 	ldw x,txtbgn 
      009DE8 A6 06            [ 2] 1760 	ldw (LN_PTR,sp),x 
      009DEA CC               [ 2] 1761 	ldw x,(x) 
      009DEB 96 D9            [ 2] 1762 	ldw (FIRST,sp),x ; list from first line 
      009DED AE 7F FF         [ 2] 1763 	ldw x,#MAX_LINENO ; biggest line number 
      009DED 52 05            [ 2] 1764 	ldw (LAST,sp),x 
      009DEF A6 80 6B         [ 4] 1765 	call arg_list
      009DF2 05               [ 1] 1766 	tnz a
      009DF3 0F 03            [ 1] 1767 	jreq list_loop 
      009DF5 20 10            [ 1] 1768 	cp a,#2 
      009DF7 27 07            [ 1] 1769 	jreq 4$
      009DF7 72 00            [ 1] 1770 	cp a,#1 
      009DF9 00 23            [ 1] 1771 	jreq first_line 
      009DFB 05 A6 06         [ 2] 1772 	jp syntax_error 
      009DFE CC               [ 2] 1773 4$:	popw x 
      009DFF 96 D9            [ 2] 1774 	ldw (LAST+2,sp),x 
      009E01                       1775 first_line:
      009E01 52               [ 2] 1776 	popw x
      009E02 05 0F            [ 2] 1777 	ldw (FIRST,sp),x 
      001ED4                       1778 lines_skip:
      009E04 03 0F 05         [ 2] 1779 	ldw x,txtbgn
      009E07 1F 05            [ 2] 1780 2$:	ldw (LN_PTR,sp),x 
      009E07 CD 98 3B         [ 2] 1781 	cpw x,txtend 
      009E0A A1 03            [ 1] 1782 	jrpl list_exit 
      009E0C 27               [ 2] 1783 	ldw x,(x) ;line# 
      009E0D 03 CC            [ 2] 1784 	cpw x,(FIRST,sp)
      009E0F 96 D7            [ 1] 1785 	jrpl list_loop 
      009E11 1F 01            [ 2] 1786 	ldw x,(LN_PTR,sp) 
      009E13 CD 93            [ 1] 1787 	ld a,(2,x)
      009E15 D9 AB 05         [ 1] 1788 	ld acc8,a 
      009E18 6B 04 CD 98      [ 1] 1789 	clr acc16 
      009E1C 54 7B 04 1E      [ 2] 1790 	addw x,acc16
      009E20 01 CD            [ 2] 1791 	jra 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   1792 ; print loop
      001EF4                       1793 list_loop:
      009E22 9D 9C            [ 2] 1794 	ldw x,(LN_PTR,sp)
      009E24 5D 27            [ 1] 1795 	ld a,(2,x) 
      009E26 05 A6 08         [ 4] 1796 	call prt_basic_line
      009E29 CC 96            [ 2] 1797 	ldw x,(LN_PTR,sp)
      009E2B D9 CE            [ 1] 1798 	ld a,(2,x)
      009E2D 00 33 7B         [ 1] 1799 	ld acc8,a 
      009E30 04 1A 05 F7      [ 1] 1800 	clr acc16 
      009E34 5C 90 89 16      [ 2] 1801 	addw x,acc16
      009E38 03 CD 93         [ 2] 1802 	cpw x,txtend 
      009E3B F5 90            [ 1] 1803 	jrpl list_exit
      009E3D 85 5A            [ 2] 1804 	ldw (LN_PTR,sp),x
      009E3F 72               [ 2] 1805 	ldw x,(x)
      009E40 FB 03            [ 2] 1806 	cpw x,(LAST,sp)  
      009E42 CF 00            [ 1] 1807 	jrslt list_loop
      001F16                       1808 list_exit:
      009E44 33 1D 00 03 7F   [ 1] 1809 	mov in,count 
      009E49 6F 01 6F         [ 2] 1810 	ldw x,#pad 
      009E4C 02 CD 98         [ 2] 1811 	ldw basicptr,x 
      001F21                       1812 	_drop VSIZE 
      009E4F 3B A1            [ 2]    1     addw sp,#VSIZE 
      009E51 08 27 B3         [ 4] 1813 	call program_info 
      009E54 A1               [ 4] 1814 	ret
                                   1815 
                                   1816 
                                   1817 ;--------------------------
                                   1818 ; BASIC: EDIT addr 
                                   1819 ;  copy program in FLASH 
                                   1820 ;  to RAM for edition 
                                   1821 ;-------------------------
      001F27                       1822 edit:
      009E55 32 26 2A         [ 4] 1823 	call next_token 
      009E58 CD 9C            [ 1] 1824 	cp a,#TK_INTGR
      009E5A 60 A1            [ 1] 1825 	jreq 0$ 
      009E5C 84 27 03         [ 2] 1826 	jp syntax_error 
      009E5F CC 96 D7         [ 4] 1827 0$: call get_int24
      009E62 CE 00 33         [ 4] 1828 	call is_program_addr
      009E65 1D 00            [ 1] 1829 	jreq 1$ 
      009E67 03 CF 00         [ 2] 1830 	ldw x,#ERR_NO_PROGRAM
      009E6A 1A 90 F6         [ 2] 1831 	jp tb_error 
      009E6D 93 EE            [ 2] 1832 1$: pushw y 
      009E6F 01 72            [ 1] 1833 	ldw y,x ; source address 
      009E71 A9 00 03         [ 2] 1834     subw x,#4 
      009E74 72 C7            [ 2] 1835 	ldw x,(2,x) ; program size 
      009E76 00 1A 72         [ 2] 1836 	addw x,#4 
      009E79 5C 00 1B         [ 2] 1837 	ldw acc16,x  ; bytes to copy 
      009E7C 72 CF 00         [ 2] 1838 	ldw x,#rsign ; destination address 
      009E7F 1A 20 CB 04      [ 2] 1839 	subw y,#4 
      009E82 CD 13 85         [ 4] 1840 	call move  
      009E82 55 00 03         [ 2] 1841 	ldw x,#free_ram 
      009E85 00 02 5B         [ 2] 1842 	ldw txtbgn,x 
      009E88 05 CD 9D 14      [ 2] 1843 	addw x,rsize  
      009E8C 81 00 1D         [ 2] 1844 	ldw txtend,x
      009E8D 90 85            [ 2] 1845 	popw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009E8D CE               [ 4] 1846 	ret 
                                   1847 
                                   1848 ;--------------------------
                                   1849 ; decompile line from token list
                                   1850 ; and print it. 
                                   1851 ; input:
                                   1852 ;   A       stop at this position 
                                   1853 ;   X 		pointer at line
                                   1854 ; output:
                                   1855 ;   none 
                                   1856 ;--------------------------	
      001F68                       1857 prt_basic_line:
      009E8E 00 1E            [ 2] 1858 	pushw y 
      009E90 72 B0 00         [ 1] 1859 	ld count,a 
      009E93 1C 81            [ 1] 1860 	ld a,(2,x)
      009E95 C1 00 03         [ 1] 1861 	cp a,count 
      009E95 AE 9E            [ 1] 1862 	jrpl 1$ 
      009E97 D4 CD 89         [ 1] 1863 	ld count,a 
      009E9A BB CE 00         [ 2] 1864 1$:	ldw basicptr,x 
      009E9D 1C 35 10 00      [ 2] 1865 	ldw y,#tib  
      009EA1 0B CD 98         [ 4] 1866 	call decompile 
      009EA4 83 35 0A         [ 4] 1867 	call puts 
      009EA7 00 0B            [ 1] 1868 	ld a,#CR 
      009EA9 AE 9E E6         [ 4] 1869 	call putc 
      009EAC CD 89            [ 2] 1870 	popw y 
      009EAE BB               [ 4] 1871 	ret 
                                   1872 
                                   1873 
                                   1874 ;---------------------------------
                                   1875 ; BASIC: PRINT|? arg_list 
                                   1876 ; print values from argument list
                                   1877 ;----------------------------------
                           000001  1878 	CCOMMA=1
                           000001  1879 	VSIZE=1
      001F8C                       1880 print:
      001F8C                       1881 	_vars VSIZE 
      009EAF CD 9E            [ 2]    1     sub sp,#VSIZE 
      001F8E                       1882 reset_comma:
      009EB1 8D CD            [ 1] 1883 	clr (CCOMMA,sp)
      001F90                       1884 prt_loop:
      009EB3 98 83 AE         [ 4] 1885 	call next_token
      009EB6 9E F7            [ 1] 1886 	cp a,#CMD_END 
      009EB8 CD 89            [ 1] 1887 	jrult 0$
      009EBA BB CE            [ 1] 1888 	cp a,#TK_COLON 
      009EBC 00 1C            [ 1] 1889 	jreq 0$
      009EBE A3 B7            [ 1] 1890 	cp a,#TK_CMD
      009EC0 84 25            [ 1] 1891 	jrne 10$
      001F9F                       1892 0$:
      001F9F                       1893 	_unget_token 
      009EC2 05 AE 9E FE 20   [ 1]    1      mov in,in.saved  
      009EC7 03 AE            [ 2] 1894 	jra 8$ 
      001FA6                       1895 10$:	
      009EC9 9F 0F            [ 1] 1896 	cp a,#TK_QSTR
      009ECB CD 89            [ 1] 1897 	jreq 1$
      009ECD BB A6            [ 1] 1898 	cp a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009ECF 0D CD            [ 1] 1899 	jreq 2$ 
      009ED1 89 5E            [ 1] 1900 	cp a,#TK_CFUNC 
      009ED3 81 70            [ 1] 1901 	jreq 3$
      009ED5 72 6F            [ 1] 1902 	cp a,#TK_COMMA 
      009ED7 67 72            [ 1] 1903 	jreq 4$
      009ED9 61 6D            [ 1] 1904 	cp a,#TK_SHARP 
      009EDB 20 61            [ 1] 1905 	jreq 5$
      009EDD 64 64            [ 2] 1906 	jra 7$ 
      001FBC                       1907 1$:	; print string 
      009EDF 72 65 73         [ 4] 1908 	call puts
      009EE2 73               [ 1] 1909 	incw x
      009EE3 3A 20 00 2C      [ 2] 1910 	subw x,basicptr 
      009EE7 20 70 72         [ 2] 1911 	ldw in.w,x  
      009EEA 6F 67            [ 2] 1912 	jra reset_comma
      001FC9                       1913 2$:	; print character 
      009EEC 72 61 6D         [ 4] 1914 	call get_char 
      009EEF 20 73 69         [ 4] 1915 	call putc 
      009EF2 7A 65            [ 2] 1916 	jra reset_comma 
      001FD1                       1917 3$: ; print character function value  	
      001FD1                       1918 	_get_code_addr 
      009EF4 3A               [ 2]    1         ldw x,(x)
      009EF5 20 00 20 62      [ 1]    2         inc in 
      009EF9 79 74 65 73      [ 1]    3         inc in 
      009EFD 00               [ 4] 1919 	call (x)
      009EFE 20 69 6E         [ 4] 1920 	call putc
      009F01 20 46            [ 2] 1921 	jra reset_comma 
      001FE0                       1922 4$: ; set comma state 
      009F03 4C 41            [ 1] 1923 	cpl (CCOMMA,sp)
      009F05 53 48            [ 2] 1924 	jra prt_loop   
      001FE4                       1925 5$: ; # character must be followed by an integer   
      009F07 20 6D 65         [ 4] 1926 	call next_token
      009F0A 6D 6F            [ 1] 1927 	cp a,#TK_INTGR 
      009F0C 72 79            [ 1] 1928 	jreq 6$
      009F0E 00 20 69         [ 2] 1929 	jp syntax_error 
      001FEE                       1930 6$: ; set tab width
      009F11 6E 20 52         [ 4] 1931 	call get_int24 
      009F14 41               [ 1] 1932 	ld a,xl 
      009F15 4D 20            [ 1] 1933 	and a,#15 
      009F17 6D 65 6D         [ 1] 1934 	ld tab_width,a 
      009F1A 6F 72            [ 2] 1935 	jra reset_comma 
      001FF9                       1936 7$:	
      001FF9                       1937 	_unget_token 
      009F1C 79 00 02 00 01   [ 1]    1      mov in,in.saved  
      009F1E CD 1B E0         [ 4] 1938 	call condition
      009F1E 72               [ 1] 1939 	tnz a 
      009F1F 01 00            [ 1] 1940 	jreq 8$    
      009F21 23 05 A6         [ 4] 1941     call print_top
      009F24 07 CC            [ 2] 1942 	jra reset_comma 
      002009                       1943 8$:
      009F26 96 D9            [ 1] 1944 	tnz (CCOMMA,sp)
      009F28 26 05            [ 1] 1945 	jrne 9$
      009F28 CD 9E            [ 1] 1946 	ld a,#CR 
      009F2A 8D 22 01         [ 4] 1947     call putc 
      002012                       1948 9$:	_drop VSIZE 
      009F2D 81 52            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009F2F 06               [ 4] 1949 	ret 
                                   1950 
                                   1951 ;----------------------
                                   1952 ; 'save_context' and
                                   1953 ; 'rest_context' must be 
                                   1954 ; called at the same 
                                   1955 ; call stack depth 
                                   1956 ; i.e. SP must have the 
                                   1957 ; save value at  
                                   1958 ; entry point of both 
                                   1959 ; routine. 
                                   1960 ;---------------------
                           000004  1961 	CTXT_SIZE=4 ; size of saved data 
                                   1962 ;--------------------
                                   1963 ; save current BASIC
                                   1964 ; interpreter context 
                                   1965 ; on stack 
                                   1966 ;--------------------
      002015                       1967 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002015                       1968 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002015                       1969 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002015                       1970 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002015                       1971 save_context:
      009F30 CE 00 1C         [ 2] 1972 	ldw x,basicptr 
      009F33 1F 05            [ 2] 1973 	ldw (BPTR,sp),x
      009F35 FE 1F 01         [ 1] 1974 	ld a,in 
      009F38 AE 7F            [ 1] 1975 	ld (IN,sp),a
      009F3A FF 1F 03         [ 1] 1976 	ld a,count 
      009F3D CD 9A            [ 1] 1977 	ld (CNT,sp),a  
      009F3F 03               [ 4] 1978 	ret
                                   1979 
                                   1980 ;-----------------------
                                   1981 ; restore previously saved 
                                   1982 ; BASIC interpreter context 
                                   1983 ; from stack 
                                   1984 ;-------------------------
      002025                       1985 rest_context:
      009F40 4D 27            [ 2] 1986 	ldw x,(BPTR,sp)
      009F42 31 A1 02         [ 2] 1987 	ldw basicptr,x 
      009F45 27 07            [ 1] 1988 	ld a,(IN,sp)
      009F47 A1 01 27         [ 1] 1989 	ld in,a
      009F4A 06 CC            [ 1] 1990 	ld a,(CNT,sp)
      009F4C 96 D7 85         [ 1] 1991 	ld count,a  
      009F4F 1F               [ 4] 1992 	ret
                                   1993 
                                   1994 
                                   1995 
                                   1996 ;------------------------------------------
                                   1997 ; BASIC: INPUT [string]var[,[string]var]
                                   1998 ; input value in variables 
                                   1999 ; [string] optionally can be used as prompt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                   2000 ;-----------------------------------------
                           000001  2001 	CX_BPTR=1
                           000003  2002 	CX_IN=3
                           000004  2003 	CX_CNT=4
                           000005  2004 	SKIP=5
                           000005  2005 	VSIZE=5
      002035                       2006 input_var:
      009F50 05 89            [ 2] 2007 	pushw y 
      009F51                       2008 	_vars VSIZE 
      009F51 85 1F            [ 2]    1     sub sp,#VSIZE 
      002039                       2009 input_loop:
      009F53 01 05            [ 1] 2010 	clr (SKIP,sp)
      009F54 CD 17 BB         [ 4] 2011 	call next_token 
      009F54 CE 00            [ 1] 2012 	cp a,#TK_QSTR 
      009F56 1C 1F            [ 1] 2013 	jrne 1$ 
      009F58 05 C3 00         [ 4] 2014 	call puts 
      009F5B 1E               [ 1] 2015 	incw x 
      009F5C 2A 38 FE 13      [ 2] 2016 	subw x,basicptr 
      009F60 01 2A 11         [ 2] 2017 	ldw in.w,x 
      009F63 1E 05            [ 1] 2018 	cpl (SKIP,sp)
      009F65 E6 02 C7         [ 4] 2019 	call next_token 
      009F68 00 0F            [ 1] 2020 1$: cp a,#TK_VAR  
      009F6A 72 5F            [ 1] 2021 	jreq 2$ 
      009F6C 00 0E 72         [ 2] 2022 	jp syntax_error
      009F6F BB 00 0E         [ 4] 2023 2$:	call get_addr
      009F72 20 E3 19         [ 2] 2024 	ldw ptr16,x 
      009F74 0D 05            [ 1] 2025 	tnz (SKIP,sp)
      009F74 1E 05            [ 1] 2026 	jrne 21$ 
      009F76 E6 02 CD         [ 4] 2027 	call var_name 
      009F79 9F E8 1E         [ 4] 2028 	call putc   
      002069                       2029 21$:
      009F7C 05 E6            [ 1] 2030 	ld a,#':
      009F7E 02 C7 00         [ 4] 2031 	call putc 
      009F81 0F 72 5F         [ 4] 2032 	call save_context 
      009F84 00 0E 72 BB      [ 1] 2033 	clr count  
      009F88 00 0E C3         [ 4] 2034 	call readln 
      009F8B 00 1E 2A         [ 2] 2035 	ldw x,#tib 
      009F8E 07 1F 05         [ 1] 2036 	push count
      009F91 FE 13            [ 1] 2037 	push #0 
      009F93 03 2F DE         [ 2] 2038 	addw x,(1,sp)
      009F96 5C               [ 1] 2039 	incw x 
      002084                       2040 	_drop 2 
      009F96 55 00            [ 2]    1     addw sp,#2 
      009F98 04 00 02 AE      [ 1] 2041 	clr in 
      009F9C 16 E0 CF         [ 4] 2042 	call get_token
      009F9F 00 05            [ 1] 2043 	cp a,#TK_INTGR
      009FA1 5B 06            [ 1] 2044 	jreq 3$ 
      009FA3 CD 9E            [ 1] 2045 	cp a,#TK_MINUS
      009FA5 95 81            [ 1] 2046 	jrne 22$
      009FA7 CD 0E B5         [ 4] 2047 	call get_token 
      009FA7 CD 98            [ 1] 2048 	cp a,#TK_INTGR 
      009FA9 3B A1            [ 1] 2049 	jreq 23$
      00209C                       2050 22$:
      009FAB 84 27 03         [ 4] 2051 	call rest_context 
      009FAE CC 96 D7         [ 2] 2052 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      0020A2                       2053 23$:
      009FB1 CD 98 6D         [ 4] 2054 	call neg_acc24	
      0020A5                       2055 3$: 
      009FB4 CD A5 20         [ 1] 2056 	ld a,acc24 
      009FB7 27 06 AE         [ 2] 2057 	ldw x,acc16 
      009FBA 00 12 CC 96      [ 4] 2058 	ld [ptr16],a
      009FBE D9 90 89 90      [ 1] 2059 	inc ptr8  
      009FC2 93 1D 00 04      [ 5] 2060 	ldw [ptr16],x 
      009FC6 EE 02 1C         [ 4] 2061 	call rest_context
      009FC9 00 04 CF         [ 4] 2062 	call next_token 
      009FCC 00 0E            [ 1] 2063 	cp a,#TK_COMMA
      009FCE AE 00            [ 1] 2064 	jrne 4$ 
      009FD0 8C 72 A2         [ 2] 2065 	jp input_loop
      0020C4                       2066 4$:
      009FD3 00 04            [ 1] 2067 	cp a,#TK_NONE 
      009FD5 CD 94            [ 1] 2068 	jreq input_exit  
      009FD7 05 AE            [ 1] 2069 	cp a,#TK_COLON 
      009FD9 00 90            [ 1] 2070     jreq input_exit 
      009FDB CF 00 1C         [ 2] 2071 	jp syntax_error 
      0020CF                       2072 input_exit:
      0020CF                       2073 	_drop VSIZE 
      009FDE 72 BB            [ 2]    1     addw sp,#VSIZE 
      009FE0 00 8E            [ 2] 2074 	popw y 
      009FE2 CF               [ 4] 2075 	ret 
                                   2076 
                                   2077 
                                   2078 ;---------------------
                                   2079 ; BASIC: REM | ' 
                                   2080 ; skip comment to end of line 
                                   2081 ;---------------------- 
      0020D4                       2082 remark::
      009FE3 00 1E 90 85 81   [ 1] 2083 	mov in,count 
      009FE8 81               [ 4] 2084  	ret 
                                   2085 
                                   2086 
                                   2087 ;---------------------
                                   2088 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2089 ; read in loop 'addr'  
                                   2090 ; apply & 'mask' to value 
                                   2091 ; loop while result==0.  
                                   2092 ; 'xor_mask' is used to 
                                   2093 ; invert the wait logic.
                                   2094 ; i.e. loop while not 0.
                                   2095 ;---------------------
                           000001  2096 	XMASK=1 
                           000002  2097 	MASK=2
                           000003  2098 	ADDR=3
                           000004  2099 	VSIZE=4
      0020DA                       2100 wait: 
      0020DA                       2101 	_vars VSIZE
      009FE8 90 89            [ 2]    1     sub sp,#VSIZE 
      009FEA C7 00            [ 1] 2102 	clr (XMASK,sp) 
      009FEC 04 E6 02         [ 4] 2103 	call arg_list 
      009FEF C1 00            [ 1] 2104 	cp a,#2
      009FF1 04 2A            [ 1] 2105 	jruge 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009FF3 03 C7 00         [ 2] 2106 	jp syntax_error 
      009FF6 04 CF            [ 1] 2107 0$:	cp a,#3
      009FF8 00 05            [ 1] 2108 	jrult 1$
      0020EC                       2109 	_xpop  ; xor mask 
      009FFA 90 AE            [ 1]    1     ld a,(y)
      009FFC 16               [ 1]    2     ldw x,y 
      009FFD 90 CD            [ 2]    3     ldw x,(1,x)
      009FFF 91 F5 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      00A003 BB               [ 1] 2110 	ld a,xl 
      00A004 A6 0D            [ 1] 2111 	ld (XMASK,sp),a 
      0020F8                       2112 1$: _xpop ; mask
      00A006 CD 89            [ 1]    1     ld a,(y)
      00A008 5E               [ 1]    2     ldw x,y 
      00A009 90 85            [ 2]    3     ldw x,(1,x)
      00A00B 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A00C 9F               [ 1] 2113     ld a,xl  
      00A00C 52 01            [ 1] 2114 	ld (MASK,sp),a 
      00A00E                       2115 	_xpop ; address 
      00A00E 0F 01            [ 1]    1     ld a,(y)
      00A010 93               [ 1]    2     ldw x,y 
      00A010 CD 98            [ 2]    3     ldw x,(1,x)
      00A012 3B A1 02 25      [ 2]    4     addw y,#CELL_SIZE 
      00A016 08               [ 1] 2116 2$:	ld a,(x)
      00A017 A1 0A            [ 1] 2117 	and a,(MASK,sp)
      00A019 27 04            [ 1] 2118 	xor a,(XMASK,sp)
      00A01B A1 80            [ 1] 2119 	jreq 2$ 
      002114                       2120 	_drop VSIZE 
      00A01D 26 07            [ 2]    1     addw sp,#VSIZE 
      00A01F 81               [ 4] 2121 	ret 
                                   2122 
                                   2123 ;---------------------
                                   2124 ; BASIC: BSET addr,mask
                                   2125 ; set bits at 'addr' corresponding 
                                   2126 ; to those of 'mask' that are at 1.
                                   2127 ; arguments:
                                   2128 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2129 ;   mask        mask|addr
                                   2130 ; output:
                                   2131 ;	none 
                                   2132 ;--------------------------
      002117                       2133 bit_set:
      00A01F 55 00 03         [ 4] 2134 	call arg_list 
      00A022 00 02            [ 1] 2135 	cp a,#2	 
      00A024 20 63            [ 1] 2136 	jreq 1$ 
      00A026 CC 16 57         [ 2] 2137 	jp syntax_error
      002121                       2138 1$: 
      002121                       2139 	_xpop ; mask 
      00A026 A1 02            [ 1]    1     ld a,(y)
      00A028 27               [ 1]    2     ldw x,y 
      00A029 12 A1            [ 2]    3     ldw x,(1,x)
      00A02B 04 27 1B A1      [ 2]    4     addw y,#CELL_SIZE 
      00A02F 82               [ 1] 2140 	ld a,xl
      00A030 27               [ 1] 2141 	push a  
      00212C                       2142 	_xpop ; addr  
      00A031 1F A1            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00A033 08               [ 1]    2     ldw x,y 
      00A034 27 2A            [ 2]    3     ldw x,(1,x)
      00A036 A1 09 27 2A      [ 2]    4     addw y,#CELL_SIZE 
      00A03A 20               [ 1] 2143 	pop a 
      00A03B 3D               [ 1] 2144 	or a,(x)
      00A03C F7               [ 1] 2145 	ld (x),a
      00A03C CD               [ 4] 2146 	ret 
                                   2147 
                                   2148 ;---------------------
                                   2149 ; BASIC: BRES addr,mask
                                   2150 ; reset bits at 'addr' corresponding 
                                   2151 ; to those of 'mask' that are at 1.
                                   2152 ; arguments:
                                   2153 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2154 ;   mask	    ~mask&*addr  
                                   2155 ; output:
                                   2156 ;	none 
                                   2157 ;--------------------------
      002139                       2158 bit_reset:
      00A03D 89 BB 5C         [ 4] 2159 	call arg_list 
      00A040 72 B0            [ 1] 2160 	cp a,#2  
      00A042 00 05            [ 1] 2161 	jreq 1$ 
      00A044 CF 00 01         [ 2] 2162 	jp syntax_error
      002143                       2163 1$: 
      002143                       2164 	_xpop ; mask 
      00A047 20 C5            [ 1]    1     ld a,(y)
      00A049 93               [ 1]    2     ldw x,y 
      00A049 CD 98            [ 2]    3     ldw x,(1,x)
      00A04B 7D CD 89 5E      [ 2]    4     addw y,#CELL_SIZE 
      00A04F 20               [ 1] 2165 	ld a,xl 
      00A050 BD               [ 1] 2166 	cpl a
      00A051 88               [ 1] 2167 	push a  
      00214F                       2168 	_xpop ; addr  
      00A051 FE 72            [ 1]    1     ld a,(y)
      00A053 5C               [ 1]    2     ldw x,y 
      00A054 00 02            [ 2]    3     ldw x,(1,x)
      00A056 72 5C 00 02      [ 2]    4     addw y,#CELL_SIZE 
      00A05A FD               [ 1] 2169 	pop a 
      00A05B CD               [ 1] 2170 	and a,(x)
      00A05C 89               [ 1] 2171 	ld (x),a 
      00A05D 5E               [ 4] 2172 	ret 
                                   2173 
                                   2174 ;---------------------
                                   2175 ; BASIC: BTOGL addr,mask
                                   2176 ; toggle bits at 'addr' corresponding 
                                   2177 ; to those of 'mask' that are at 1.
                                   2178 ; arguments:
                                   2179 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2180 ;   mask	    mask^*addr  
                                   2181 ; output:
                                   2182 ;	none 
                                   2183 ;--------------------------
      00215C                       2184 bit_toggle:
      00A05E 20 AE 83         [ 4] 2185 	call arg_list 
      00A060 A1 02            [ 1] 2186 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00A060 03 01            [ 1] 2187 	jreq 1$ 
      00A062 20 AC 57         [ 2] 2188 	jp syntax_error
      00A064                       2189 1$: _xpop ; mask 
      00A064 CD 98            [ 1]    1     ld a,(y)
      00A066 3B               [ 1]    2     ldw x,y 
      00A067 A1 84            [ 2]    3     ldw x,(1,x)
      00A069 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A06D D7               [ 1] 2190 	ld a,xl
      00A06E 88               [ 1] 2191 	push a 
      002171                       2192 	_xpop  ; addr  
      00A06E CD 98            [ 1]    1     ld a,(y)
      00A070 6D               [ 1]    2     ldw x,y 
      00A071 9F A4            [ 2]    3     ldw x,(1,x)
      00A073 0F C7 00 24      [ 2]    4     addw y,#CELL_SIZE 
      00A077 20               [ 1] 2193 	pop a 
      00A078 95               [ 1] 2194 	xor a,(x)
      00A079 F7               [ 1] 2195 	ld (x),a 
      00A079 55               [ 4] 2196 	ret 
                                   2197 
                                   2198 
                                   2199 ;---------------------
                                   2200 ; BASIC: BTEST(addr,bit)
                                   2201 ; return bit value at 'addr' 
                                   2202 ; bit is in range {0..7}.
                                   2203 ; arguments:
                                   2204 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2205 ;   bit 	    bit position {0..7}  
                                   2206 ; output:
                                   2207 ;	A:X       bit value  
                                   2208 ;--------------------------
      00217E                       2209 bit_test:
      00A07A 00 03 00         [ 4] 2210 	call func_args 
      00A07D 02 CD            [ 1] 2211 	cp a,#2
      00A07F 9C 60            [ 1] 2212 	jreq 0$
      00A081 4D 27 05         [ 2] 2213 	jp syntax_error
      002188                       2214 0$:	
      002188                       2215 	_xpop 
      00A084 CD 98            [ 1]    1     ld a,(y)
      00A086 A8               [ 1]    2     ldw x,y 
      00A087 20 85            [ 2]    3     ldw x,(1,x)
      00A089 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A089 0D               [ 1] 2216 	ld a,xl 
      00A08A 01 26            [ 1] 2217 	and a,#7
      00A08C 05               [ 1] 2218 	push a   
      00A08D A6 0D            [ 1] 2219 	ld a,#1 
      00A08F CD 89            [ 1] 2220 1$: tnz (1,sp)
      00A091 5E 5B            [ 1] 2221 	jreq 2$
      00A093 01               [ 1] 2222 	sll a 
      00A094 81 01            [ 1] 2223 	dec (1,sp)
      00A095 20 F7            [ 2] 2224 	jra 1$
      00A095 CE 00            [ 1] 2225 2$: ld (1,sp),a  
      0021A2                       2226 	_xpop ; address  
      00A097 05 1F            [ 1]    1     ld a,(y)
      00A099 03               [ 1]    2     ldw x,y 
      00A09A C6 00            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00A09C 02 6B 05 C6      [ 2]    4     addw y,#CELL_SIZE 
      00A0A0 00               [ 1] 2227 	pop a 
      00A0A1 04               [ 1] 2228 	and a,(x)
      00A0A2 6B 06            [ 1] 2229 	jreq 3$
      00A0A4 81 01            [ 1] 2230 	ld a,#1 
      00A0A5 5F               [ 1] 2231 3$:	clrw x 
      00A0A5 1E               [ 1] 2232 	ld xl,a
      00A0A6 03               [ 1] 2233 	clr a  
      00A0A7 CF               [ 4] 2234 	ret
                                   2235 
                                   2236 ;--------------------
                                   2237 ; BASIC: POKE addr,byte
                                   2238 ; put a byte at addr 
                                   2239 ;--------------------
      0021B5                       2240 poke:
      00A0A8 00 05 7B         [ 4] 2241 	call arg_list 
      00A0AB 05 C7            [ 1] 2242 	cp a,#2
      00A0AD 00 02            [ 1] 2243 	jreq 1$
      00A0AF 7B 06 C7         [ 2] 2244 	jp syntax_error
      0021BF                       2245 1$:	
      0021BF                       2246 	_xpop ; byte   
      00A0B2 00 04            [ 1]    1     ld a,(y)
      00A0B4 81               [ 1]    2     ldw x,y 
      00A0B5 EE 01            [ 2]    3     ldw x,(1,x)
      00A0B5 90 89 52 05      [ 2]    4     addw y,#CELL_SIZE 
      00A0B9 9F               [ 1] 2247     ld a,xl 
      00A0B9 0F               [ 1] 2248 	push a 
      0021CA                       2249 	_xpop ; address 
      00A0BA 05 CD            [ 1]    1     ld a,(y)
      00A0BC 98               [ 1]    2     ldw x,y 
      00A0BD 3B A1            [ 2]    3     ldw x,(1,x)
      00A0BF 02 26 10 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A0C3 89               [ 1] 2250 	pop a 
      00A0C4 BB               [ 1] 2251 	ld (x),a 
      00A0C5 5C               [ 4] 2252 	ret 
                                   2253 
                                   2254 ;-----------------------
                                   2255 ; BASIC: PEEK(addr)
                                   2256 ; get the byte at addr 
                                   2257 ; input:
                                   2258 ;	none 
                                   2259 ; output:
                                   2260 ;	X 		value 
                                   2261 ;-----------------------
      0021D6                       2262 peek:
      00A0C6 72 B0 00         [ 4] 2263 	call func_args
      00A0C9 05 CF            [ 1] 2264 	cp a,#1 
      00A0CB 00 01            [ 1] 2265 	jreq 1$
      00A0CD 03 05 CD         [ 2] 2266 	jp syntax_error
      0021E0                       2267 1$: _xpop ; address  
      00A0D0 98 3B            [ 1]    1     ld a,(y)
      00A0D2 A1               [ 1]    2     ldw x,y 
      00A0D3 85 27            [ 2]    3     ldw x,(1,x)
      00A0D5 03 CC 96 D7      [ 2]    4     addw y,#CELL_SIZE 
      00A0D9 CD 98 63         [ 1] 2268 	ld farptr,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00A0DC CF 00 1A         [ 2] 2269 	ldw ptr16,x 
      00A0DF 0D 05 26 06      [ 5] 2270 	ldf a,[farptr]
      00A0E3 CD               [ 1] 2271 	clrw x 
      00A0E4 91               [ 1] 2272 	ld xl,a 
      00A0E5 EB               [ 1] 2273 	clr a 
      00A0E6 CD               [ 4] 2274 	ret 
                                   2275 
                                   2276 ;---------------------------
                                   2277 ; BASIC IF expr : instructions
                                   2278 ; evaluate expr and if true 
                                   2279 ; execute instructions on same line. 
                                   2280 ;----------------------------
      0021F7                       2281 if: 
      00A0E7 89 5E E0         [ 4] 2282 	call condition  
      00A0E9                       2283 	_xpop 
      00A0E9 A6 3A            [ 1]    1     ld a,(y)
      00A0EB CD               [ 1]    2     ldw x,y 
      00A0EC 89 5E            [ 2]    3     ldw x,(1,x)
      00A0EE CD A0 95 72      [ 2]    4     addw y,#CELL_SIZE 
      00A0F2 5F               [ 1] 2284 	tnz  a  
      00A0F3 00 04            [ 1] 2285 	jrne 9$
      00A0F5 CD               [ 2] 2286 	tnzw x 
      00A0F6 8A C0            [ 1] 2287 	jrne 9$  
                                   2288 ;skip to next line
      00A0F8 AE 16 90 3B 00   [ 1] 2289 	mov in,count
      00220E                       2290 	_drop 2 
      00A0FD 04 4B            [ 2]    1     addw sp,#2 
      00A0FF 00 72 FB         [ 2] 2291 	jp next_line
      00A102 01               [ 4] 2292 9$:	ret 
                                   2293 
                                   2294 ;------------------------
                                   2295 ; BASIC: FOR var=expr 
                                   2296 ; set variable to expression 
                                   2297 ; leave variable address 
                                   2298 ; on stack and set
                                   2299 ; FLOOP bit in 'flags'
                                   2300 ;-----------------
                           000001  2301 	RETL1=1 ; return address  
                           000003  2302 	FSTEP=3  ; variable increment int24
                           000006  2303 	LIMIT=6 ; loop limit, int24  
                           000009  2304 	CVAR=9   ; control variable 
                           00000B  2305 	INW=11   ;  in.w saved
                           00000D  2306 	BPTR=13 ; baseptr saved
                           00000D  2307 	VSIZE=13  
      002214                       2308 for: ; { -- var_addr }
      00A103 5C               [ 2] 2309 	popw x ; call return address 
      002215                       2310 	_vars VSIZE 
      00A104 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A106 72               [ 2] 2311 	pushw x  ; RETL1 
      00A107 5F 00            [ 1] 2312 	ld a,#TK_VAR 
      00A109 02 CD 8F         [ 4] 2313 	call expect
      00A10C 35 A1 84         [ 4] 2314 	call get_addr
      00A10F 27 14            [ 2] 2315 	ldw (CVAR,sp),x  ; control variable 
      00A111 A1 11 26         [ 4] 2316 	call let_eval 
      00A114 07 CD 8F 35      [ 1] 2317 	bset flags,#FLOOP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00A118 A1 84 27         [ 4] 2318 	call next_token 
      00A11B 06 80            [ 1] 2319 	cp a,#TK_CMD 
      00A11C 27 03            [ 1] 2320 	jreq 1$
      00A11C CD A0 A5         [ 2] 2321 	jp syntax_error
      002233                       2322 1$:  
      002233                       2323 	_get_code_addr
      00A11F CC               [ 2]    1         ldw x,(x)
      00A120 96 D7 00 01      [ 1]    2         inc in 
      00A122 72 5C 00 01      [ 1]    3         inc in 
      00A122 CD 82 8D         [ 2] 2324 	cpw x,#to   
      00A125 27 03            [ 1] 2325 	jreq to
      00A125 C6 00 0D         [ 2] 2326 	jp syntax_error 
                                   2327 
                                   2328 ;-----------------------------------
                                   2329 ; BASIC: TO expr 
                                   2330 ; second part of FOR loop initilization
                                   2331 ; leave limit on stack and set 
                                   2332 ; FTO bit in 'flags'
                                   2333 ;-----------------------------------
      002244                       2334 to: ; { var_addr -- var_addr limit step }
      00A128 CE 00 0E 72 C7   [ 2] 2335 	btjt flags,#FLOOP,1$
      00A12D 00 1A 72         [ 2] 2336 	jp syntax_error
      00A130 5C 00 1B         [ 4] 2337 1$: call expression   
      00A133 72 CF            [ 1] 2338 	cp a,#TK_INTGR 
      00A135 00 1A            [ 1] 2339 	jreq 2$ 
      00A137 CD A0 A5         [ 2] 2340 	jp syntax_error
      002256                       2341 2$: _xpop
      00A13A CD 98            [ 1]    1     ld a,(y)
      00A13C 3B               [ 1]    2     ldw x,y 
      00A13D A1 08            [ 2]    3     ldw x,(1,x)
      00A13F 26 03 CC A0      [ 2]    4     addw y,#CELL_SIZE 
      00A143 B9 06            [ 1] 2342 	ld (LIMIT,sp),a 
      00A144 1F 07            [ 2] 2343 	ldw (LIMIT+1,sp),x
      00A144 A1 00 27         [ 4] 2344 	call next_token
      00A147 07 A1            [ 1] 2345 	cp a,#TK_NONE  
      00A149 0A 27            [ 1] 2346 	jreq 4$ 
      00A14B 03 CC            [ 1] 2347 	cp a,#TK_CMD
      00A14D 96 D7            [ 1] 2348 	jrne 3$
      00A14F                       2349 	_get_code_addr
      00A14F 5B               [ 2]    1         ldw x,(x)
      00A150 05 90 85 81      [ 1]    2         inc in 
      00A154 72 5C 00 01      [ 1]    3         inc in 
      00A154 55 00 04         [ 2] 2350 	cpw x,#step 
      00A157 00 02            [ 1] 2351 	jreq step
      00227C                       2352 3$:	
      00227C                       2353 	_unget_token   	 
      00A159 81 00 02 00 01   [ 1]    1      mov in,in.saved  
      00A15A                       2354 4$:	
      00A15A 52 04            [ 1] 2355 	clr (FSTEP,sp) 
      00A15C 0F 01 CD         [ 2] 2356 	ldw x,#1   ; default step  
      00A15F 9A 03            [ 2] 2357 	ldw (FSTEP+1,sp),x 
      00A161 A1 02            [ 2] 2358 	jra store_loop_addr 
                                   2359 
                                   2360 
                                   2361 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                                   2362 ; BASIC: STEP expr 
                                   2363 ; optional third par of FOR loop
                                   2364 ; initialization. 	
                                   2365 ;------------------------------------
      00228A                       2366 step: ; {var limit -- var limit step}
      00A163 24 03 CC 96 D7   [ 2] 2367 	btjt flags,#FLOOP,1$
      00A168 A1 03 25         [ 2] 2368 	jp syntax_error
      00A16B 0C 90 F6         [ 4] 2369 1$: call expression 
      00A16E 93 EE            [ 1] 2370 	cp a,#TK_INTGR
      00A170 01 72            [ 1] 2371 	jreq 2$
      00A172 A9 00 03         [ 2] 2372 	jp syntax_error
      00229C                       2373 2$:	
      00229C                       2374 	_xpop 
      00A175 9F 6B            [ 1]    1     ld a,(y)
      00A177 01               [ 1]    2     ldw x,y 
      00A178 90 F6            [ 2]    3     ldw x,(1,x)
      00A17A 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A17E A9 00            [ 1] 2375 	ld (FSTEP,sp),a 
      00A180 03 9F            [ 2] 2376 	ldw (FSTEP+1,sp),x ; step
                                   2377 ; if step < 0 decrement LIMIT 
      00A182 6B               [ 1] 2378 	tnz a
      00A183 02 90            [ 1] 2379 	jrpl store_loop_addr 
      00A185 F6 93            [ 1] 2380 	ld a,(LIMIT,sp)
      00A187 EE 01            [ 2] 2381 	ldw x,(LIMIT+1,sp)
      00A189 72 A9 00         [ 2] 2382 	subw x,#1 
      00A18C 03 F6            [ 1] 2383 	sbc a,#0 
      00A18E 14 02            [ 1] 2384 	ld (LIMIT,sp),a 
      00A190 18 01            [ 2] 2385 	ldw (LIMIT+1,sp),x 
                                   2386 ; leave loop back entry point on cstack 
                                   2387 ; cstack is 1 call deep from interpreter
      0022B9                       2388 store_loop_addr:
      00A192 27 F9 5B         [ 2] 2389 	ldw x,basicptr
      00A195 04 81            [ 2] 2390 	ldw (BPTR,sp),x 
      00A197 CE 00 00         [ 2] 2391 	ldw x,in.w 
      00A197 CD 9A            [ 2] 2392 	ldw (INW,sp),x   
      00A199 03 A1 02 27      [ 1] 2393 	bres flags,#FLOOP 
      00A19D 03 CC 96 D7      [ 1] 2394 	inc loop_depth  
      00A1A1 81               [ 4] 2395 	ret 
                                   2396 
                                   2397 ;--------------------------------
                                   2398 ; BASIC: NEXT var 
                                   2399 ; FOR loop control 
                                   2400 ; increment variable with step 
                                   2401 ; and compare with limit 
                                   2402 ; loop if threshold not crossed.
                                   2403 ; else stack. 
                                   2404 ; and decrement 'loop_depth' 
                                   2405 ;--------------------------------
      0022CC                       2406 next: ; {var limit step retl1 -- [var limit step ] }
      00A1A1 90 F6 93 EE      [ 1] 2407 	tnz loop_depth 
      00A1A5 01 72            [ 1] 2408 	jrne 1$ 
      00A1A7 A9 00 03         [ 2] 2409 	jp syntax_error 
      0022D5                       2410 1$: 
      00A1AA 9F 88            [ 1] 2411 	ld a,#TK_VAR 
      00A1AC 90 F6 93         [ 4] 2412 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A1AF EE 01 72         [ 4] 2413 	call get_addr 
                                   2414 ; check for good variable after NEXT 	 
      00A1B2 A9 00            [ 2] 2415 	cpw x,(CVAR,sp)
      00A1B4 03 84            [ 1] 2416 	jreq 2$  
      00A1B6 FA F7 81         [ 2] 2417 	jp syntax_error ; not the good one 
      00A1B9                       2418 2$: 
      00A1B9 CD 9A 03         [ 2] 2419 	ldw ptr16,x 
                                   2420 	; increment variable 
      00A1BC A1               [ 1] 2421 	ld a,(x)
      00A1BD 02 27            [ 2] 2422 	ldw x,(1,x)  ; get var value 
      00A1BF 03 CC 96         [ 2] 2423 	addw x,(FSTEP+1,sp) ; var+step 
      00A1C2 D7 03            [ 1] 2424 	adc a,(FSTEP,sp)
      00A1C3 72 C7 00 19      [ 4] 2425 	ld [ptr16],a
      00A1C3 90 F6 93 EE      [ 1] 2426 	inc ptr8  
      00A1C7 01 72 A9 00      [ 5] 2427 	ldw [ptr16],x 
      00A1CB 03 9F 43         [ 1] 2428 	ld acc24,a 
      00A1CE 88 90 F6         [ 2] 2429 	ldw acc16,x 
      00A1D1 93 EE            [ 1] 2430 	ld a,(LIMIT,sp)
      00A1D3 01 72            [ 2] 2431 	ldw x,(LIMIT+1,sp)
      00A1D5 A9 00 03 84      [ 2] 2432 	subw x,acc16 
      00A1D9 F4 F7 81         [ 1] 2433 	sbc a,acc24
      00A1DC 18 03            [ 1] 2434 	xor a,(FSTEP,sp)
      00A1DC CD 9A            [ 1] 2435 	xor a,#0x80
      00A1DE 03 A1            [ 1] 2436 	jrmi loop_back  
      00A1E0 02 27            [ 2] 2437 	jra loop_done   
                                   2438 ; check sign of STEP  
      00A1E2 03 CC            [ 1] 2439 	ld a,(FSTEP,sp)
      00A1E4 96 D7            [ 1] 2440 	jrpl 4$
                                   2441 ;negative step
      00A1E6 90 F6 93         [ 1] 2442     ld a,acc8 
      00A1E9 EE 01            [ 1] 2443 	jrslt loop_back   
      00A1EB 72 A9            [ 2] 2444 	jra loop_done  
      00231F                       2445 4$: ; positive step
      00A1ED 00 03 9F 88 90   [ 2] 2446 	btjt acc8,#7,loop_done 
      002324                       2447 loop_back:
      00A1F2 F6 93            [ 2] 2448 	ldw x,(BPTR,sp)
      00A1F4 EE 01 72         [ 2] 2449 	ldw basicptr,x 
      00A1F7 A9 00 03 84 F8   [ 2] 2450 	btjf flags,#FRUN,1$ 
      00A1FC F7 81            [ 1] 2451 	ld a,(2,x)
      00A1FE C7 00 03         [ 1] 2452 	ld count,a
      00A1FE CD 99            [ 2] 2453 1$:	ldw x,(INW,sp)
      00A200 FE A1 02         [ 2] 2454 	ldw in.w,x 
      00A203 27               [ 4] 2455 	ret 
      002339                       2456 loop_done:
                                   2457 	; remove loop data from stack  
      00A204 03               [ 2] 2458 	popw x
      00233A                       2459 	_drop VSIZE 
      00A205 CC 96            [ 2]    1     addw sp,#VSIZE 
      00A207 D7 5A 00 1F      [ 1] 2460 	dec loop_depth 
      00A208 FC               [ 2] 2461 	jp (x)
                                   2462 
                                   2463 ;----------------------------
                                   2464 ; called by goto/gosub
                                   2465 ; to get target line number 
                                   2466 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2467 ;    x    line address 
                                   2468 ;---------------------------
      002341                       2469 get_target_line:
      00A208 90 F6 93         [ 4] 2470 	call next_token  
      00A20B EE 01            [ 1] 2471 	cp a,#TK_INTGR
      00A20D 72 A9            [ 1] 2472 	jreq get_target_line_addr 
      00A20F 00 03            [ 1] 2473 	cp a,#TK_LABEL 
      00A211 9F A4            [ 1] 2474 	jreq look_target_symbol 
      00A213 07 88 A6         [ 2] 2475 	jp syntax_error
                                   2476 ; the target is a line number 
                                   2477 ; search it. 
      00234F                       2478 get_target_line_addr:
      00A216 01 0D            [ 2] 2479 	pushw y 
      00A218 01 27 05         [ 4] 2480 	call get_int24 ; line # 
      00A21B 48               [ 1] 2481 	clr a
      00A21C 0A 01 20 F7      [ 2] 2482 	ldw y,basicptr 
      00A220 6B 01            [ 2] 2483 	ldw y,(y)
      00A222 90 F6            [ 2] 2484 	pushw y 
      00A224 93 EE            [ 2] 2485 	cpw x,(1,sp)
      00235F                       2486 	_drop 2  
      00A226 01 72            [ 2]    1     addw sp,#2 
      00A228 A9 00            [ 1] 2487 	jrult 11$
      00A22A 03               [ 1] 2488 	inc a 
      002364                       2489 11$: ; scan program for this line# 	
      00A22B 84 F4 27         [ 4] 2490 	call search_lineno  
      00A22E 02               [ 2] 2491 	tnzw x ; 0| line# address 
      00A22F A6 01            [ 1] 2492 	jrne 2$ 
      00A231 5F 97            [ 1] 2493 	ld a,#ERR_NO_LINE 
      00A233 4F 81 59         [ 2] 2494 	jp tb_error 
      00A235 90 85            [ 2] 2495 2$:	popw y  
      00A235 CD               [ 4] 2496 	ret 
                                   2497 
                                   2498 ; the GOTO|GOSUB target is a symbol.
                                   2499 ; output:
                                   2500 ;    X    line address|0 
      002372                       2501 look_target_symbol:
      00A236 9A 03            [ 2] 2502 	pushw y 
      00A238 A1               [ 2] 2503 	pushw x 
      00A239 02 27 03         [ 4] 2504 	call skip_string 
      00A23C CC 96 D7 0D      [ 1] 2505 	clr acc16 
      00A23F 90 CE 00 1B      [ 2] 2506 	ldw y,txtbgn 
      00A23F 90 F6 93         [ 1] 2507 1$:	ld a,(3,y) ; first TK_ID on line 
      00A242 EE 01            [ 1] 2508 	cp a,#TK_LABEL 
      00A244 72 A9            [ 1] 2509 	jreq 3$ 
      00A246 00 03 9F         [ 1] 2510 2$:	ld a,(2,y); line length 
      00A249 88 90 F6         [ 1] 2511 	ld acc8,a 
      00A24C 93 EE 01 72      [ 2] 2512 	addw y,acc16 ;point to next line 
      00A250 A9 00 03 84      [ 2] 2513 	cpw y,txtend 
      00A254 F7 81            [ 1] 2514 	jrult 1$
      00A256 A6 0A            [ 1] 2515 	ld a,#ERR_BAD_VALUE
      00A256 CD 99 FE         [ 2] 2516 	jp tb_error 
      00239C                       2517 3$: ; found a TK_LABEL 
                                   2518 	; compare with GOTO|GOSUB target 
      00A259 A1 01            [ 2] 2519 	pushw y ; line address 
      00A25B 27 03 CC 96      [ 2] 2520 	addw y,#4 ; label string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00A25F D7 90            [ 2] 2521 	ldw x,(3,sp) ; target string 
      00A261 F6 93 EE         [ 4] 2522 	call strcmp
      00A264 01 72            [ 1] 2523 	jrne 4$
      00A266 A9 00            [ 2] 2524 	popw y 
      00A268 03 C7            [ 2] 2525 	jra 2$ 
      0023AD                       2526 4$: ; target found 
      00A26A 00               [ 2] 2527 	popw x ;  address line target  
      0023AE                       2528 	_drop 2 ; target string 
      00A26B 19 CF            [ 2]    1     addw sp,#2 
      00A26D 00 1A            [ 2] 2529 	popw y 
      00A26F 92               [ 4] 2530 	ret
                                   2531 
                                   2532 
                                   2533 ;--------------------------------
                                   2534 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2535 ; selective goto or gosub 
                                   2536 ;--------------------------------
      0023B3                       2537 cmd_on:
      00A270 BC 00 19 5F 97   [ 2] 2538 	btjt flags,#FRUN,0$ 
      00A275 4F 81            [ 1] 2539 	ld a,#ERR_RUN_ONLY
      00A277 CC 16 59         [ 2] 2540 	jp tb_error 
      00A277 CD 9C 60         [ 4] 2541 0$:	call expression 
      00A27A 90 F6            [ 1] 2542 	cp a,#TK_INTGR
      00A27C 93 EE            [ 1] 2543 	jreq 1$
      00A27E 01 72 A9         [ 2] 2544 	jp syntax_error
      0023C7                       2545 1$: _xpop
      00A281 00 03            [ 1]    1     ld a,(y)
      00A283 4D               [ 1]    2     ldw x,y 
      00A284 26 0D            [ 2]    3     ldw x,(1,x)
      00A286 5D 26 0A 55      [ 2]    4     addw y,#CELL_SIZE 
                                   2546 ; the selector is the element indice 
                                   2547 ; in the list of arguments. {1..#elements} 
      00A28A 00               [ 1] 2548 	ld a,xl ; keep only bits 7..0
      00A28B 04 00            [ 1] 2549 	jreq 9$ ; element # begin at 1. 
      00A28D 02               [ 1] 2550 	push a  ; selector  
      00A28E 5B 02 CC         [ 4] 2551 	call next_token
      00A291 97 8A            [ 1] 2552 	cp a,#TK_CMD 
      00A293 81 03            [ 1] 2553 	jreq 2$ 
      00A294 CC 16 57         [ 2] 2554 	jp syntax_error 
      0023DE                       2555 2$: _get_code_addr
      00A294 85               [ 2]    1         ldw x,(x)
      00A295 52 0D 89 A6      [ 1]    2         inc in 
      00A299 85 CD 99 F1      [ 1]    3         inc in 
                                   2556 ;; must be a GOTO or GOSUB 
      00A29D CD 98 63         [ 2] 2557 	cpw x,#goto 
      00A2A0 1F 09            [ 1] 2558 	jreq 4$
      00A2A2 CD 9D 35         [ 2] 2559 	cpw x,#gosub 
      00A2A5 72 14            [ 1] 2560 	jreq 4$ 
      00A2A7 00 23 CD         [ 2] 2561 	jp syntax_error 
      0023F4                       2562 4$: 
      00A2AA 98               [ 1] 2563 	pop a 
      00A2AB 3B               [ 2] 2564 	pushw x ; save routine address 	
      00A2AC A1               [ 1] 2565 	push a  ; selector  
      0023F7                       2566 5$: ; skip elements in list until selector==0 
      00A2AD 80 27            [ 1] 2567 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A2AF 03 CC            [ 1] 2568 	jreq 6$ 
                                   2569 ; can be a line# or a label 
      00A2B1 96 D7 BB         [ 4] 2570 	call next_token 
      00A2B3 A1 84            [ 1] 2571 	cp a,#TK_INTGR 
      00A2B3 FE 72            [ 1] 2572 	jreq 52$
      00A2B5 5C 00            [ 1] 2573 	cp a,#TK_LABEL 
      00A2B7 02 72            [ 1] 2574 	jreq 54$
      00A2B9 5C 00 02         [ 2] 2575 	jp syntax_error 
      002409                       2576 52$: ; got a line number 
      00A2BC A3 A2 C4         [ 1] 2577 	ld a,in ; skip over int24 value 
      00A2BF 27 03            [ 1] 2578 	add a,#CELL_SIZE ; integer size  
      00A2C1 CC 96 D7         [ 1] 2579 	ld in,a 
      00A2C4 20 03            [ 2] 2580 	jra 56$
      00A2C4 72 04 00         [ 4] 2581 54$: call skip_string ; skip over label 	
      002416                       2582 56$: ; if another element comma present 
      00A2C7 23 03 CC         [ 4] 2583 	call next_token
      00A2CA 96 D7            [ 1] 2584 	cp a,#TK_COMMA 
      00A2CC CD 9B            [ 1] 2585 	jreq 5$ 
                                   2586 ; arg list exhausted, selector to big 
                                   2587 ; continue execution on next line 
      00241D                       2588 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A2CE 47 A1            [ 2]    1     addw sp,#3 
      00A2D0 84 27            [ 2] 2589 	jra 9$
      002421                       2590 6$: ;at selected position  
      002421                       2591 	_drop 1 ; discard selector
      00A2D2 03 CC            [ 2]    1     addw sp,#1 
                                   2592 ; here only the routine address 
                                   2593 ; of GOTO|GOSUB is on stack 
      00A2D4 96 D7 90         [ 4] 2594     call get_target_line
      00A2D7 F6 93 EE         [ 2] 2595 	ldw ptr16,x 	
      00A2DA 01 72 A9 00 03   [ 1] 2596 	mov in,count ; move to end of line  
      00A2DF 6B               [ 2] 2597 	popw x ; cmd address, GOTO||GOSUB 
      00A2E0 06 1F 07         [ 2] 2598 	cpw x,#goto 
      00A2E3 CD 98            [ 1] 2599 	jrne 7$ 
      00A2E5 3B A1 00         [ 2] 2600 	ldw x,ptr16 
      00A2E8 27 17            [ 2] 2601 	jra jp_to_target
      002439                       2602 7$: 
      00A2EA A1 80            [ 2] 2603 	jra gosub_2 ; target in ptr16 
      00243B                       2604 9$: ; expr out of range skip to end of line
                                   2605     ; this will force a fall to next line  
      00A2EC 26 0E FE 72 5C   [ 1] 2606 	mov in,count
      002440                       2607 	_drop 2
      00A2F1 00 02            [ 2]    1     addw sp,#2 
      00A2F3 72 5C 00         [ 2] 2608 	jp next_line  
                                   2609 
                                   2610 
                                   2611 ;------------------------
                                   2612 ; BASIC: GOTO line# 
                                   2613 ; jump to line# 
                                   2614 ; here cstack is 2 call deep from interpreter 
                                   2615 ;------------------------
      002445                       2616 goto:
      00A2F6 02 A3 A3 0A 27   [ 2] 2617 	btjt flags,#FRUN,goto_1  
      00A2FB 0E 06            [ 1] 2618 	ld a,#ERR_RUN_ONLY
      00A2FC CC 16 59         [ 2] 2619 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00244F                       2620 goto_1:
      00A2FC 55 00 03         [ 4] 2621 	call get_target_line
      002452                       2622 jp_to_target:
      00A2FF 00 02 04         [ 2] 2623 	ldw basicptr,x 
      00A301 E6 02            [ 1] 2624 	ld a,(2,x)
      00A301 0F 03 AE         [ 1] 2625 	ld count,a 
      00A304 00 01 1F 04      [ 1] 2626 	mov in,#3 
      00A308 20               [ 4] 2627 	ret 
                                   2628 
                                   2629 
                                   2630 ;--------------------
                                   2631 ; BASIC: GOSUB line#
                                   2632 ; basic subroutine call
                                   2633 ; actual line# and basicptr 
                                   2634 ; are saved on cstack
                                   2635 ; here cstack is 2 call deep from interpreter 
                                   2636 ;--------------------
                           000001  2637 	RET_ADDR=1 ; subroutine return address 
                           000003  2638 	RET_BPTR=3 ; basicptr return point 
                           000005  2639 	RET_INW=5  ; in.w return point 
                           000004  2640 	VSIZE=4 
      00245F                       2641 gosub:
      00A309 2F 00 00 22 06   [ 2] 2642 	btjt flags,#FRUN,gosub_1 
      00A30A A6 06            [ 1] 2643 	ld a,#ERR_RUN_ONLY
      00A30A 72 04 00         [ 2] 2644 	jp tb_error 
      00A30D 23               [ 4] 2645 	ret 
      00246A                       2646 gosub_1:
      00A30E 03 CC 96         [ 4] 2647 	call get_target_line 
      00A311 D7 CD 9B         [ 2] 2648 	ldw ptr16,x
      002470                       2649 gosub_2: 
      00A314 47               [ 2] 2650 	popw x 
      002471                       2651 	_vars VSIZE  
      00A315 A1 84            [ 2]    1     sub sp,#VSIZE 
      00A317 27               [ 2] 2652 	pushw x ; RET_ADDR 
                                   2653 ; save BASIC subroutine return point.   
      00A318 03 CC 96         [ 2] 2654 	ldw x,basicptr
      00A31B D7 03            [ 2] 2655 	ldw (RET_BPTR,sp),x 
      00A31C CE 00 00         [ 2] 2656 	ldw x,in.w 
      00A31C 90 F6            [ 2] 2657 	ldw (RET_INW,sp),x
      00A31E 93 EE 01         [ 2] 2658 	ldw x,ptr16  
      00A321 72 A9            [ 2] 2659 	jra jp_to_target
                                   2660 
                                   2661 ;------------------------
                                   2662 ; BASIC: RETURN 
                                   2663 ; exit from BASIC subroutine 
                                   2664 ;------------------------
      002483                       2665 return:
      00A323 00 03 6B 03 1F   [ 2] 2666 	btjt flags,#FRUN,0$ 
      00A328 04 4D            [ 1] 2667 	ld a,#ERR_RUN_ONLY
      00A32A 2A 0D 7B         [ 2] 2668 	jp tb_error 
      00248D                       2669 0$:	
      00A32D 06 1E            [ 2] 2670 	ldw x,(RET_BPTR,sp) 
      00A32F 07 1D 00         [ 2] 2671 	ldw basicptr,x
      00A332 01 A2            [ 1] 2672 	ld a,(2,x)
      00A334 00 6B 06         [ 1] 2673 	ld count,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A337 1F 07            [ 2] 2674 	ldw x,(RET_INW,sp)
      00A339 CF 00 00         [ 2] 2675 	ldw in.w,x 
      00A339 CE               [ 2] 2676 	popw x 
      00249D                       2677 	_drop VSIZE 
      00A33A 00 05            [ 2]    1     addw sp,#VSIZE 
      00A33C 1F               [ 2] 2678 	jp (x)
                                   2679 
                                   2680 
                                   2681 ;---------------------------------
                                   2682 ; check if A:X contain the address 
                                   2683 ; of a program in FLASH 
                                   2684 ; output:
                                   2685 ;     Z    set is progam 
                                   2686 ;----------------------------------
      0024A0                       2687 is_program_addr:
      00A33D 0D               [ 1] 2688 	tnz a 
      00A33E CE 00            [ 1] 2689 	jrne 9$
      00A340 01 1F 0B         [ 2] 2690 	cpw x,#app_space 
      00A343 72 15            [ 1] 2691 	jrult 8$
      00A345 00               [ 2] 2692 	pushw x 
      00A346 23 72 5C         [ 2] 2693 	subw x,#4 
      00A349 00 20 81         [ 4] 2694 	call qsign 
      00A34C 85               [ 2] 2695 	popw x 
      00A34C 72 5D            [ 1] 2696 	jreq 9$ 
      00A34E 00               [ 1] 2697 8$:	cpl a ; clr Z bit  
      00A34F 20               [ 4] 2698 9$:	ret 
                                   2699 
                                   2700 ;----------------------------------
                                   2701 ; BASIC: RUN [addr]
                                   2702 ; run BASIC program in RAM
                                   2703 ;----------------------------------- 
      0024B4                       2704 run: 
      00A350 26 03 CC 96 D7   [ 2] 2705 	btjf flags,#FRUN,0$  
      00A355 4F               [ 1] 2706 	clr a 
      00A355 A6               [ 4] 2707 	ret
      0024BB                       2708 0$: ; check for STOP condition 
      00A356 85 CD 99 F1 CD   [ 2] 2709 	btjf flags,#FBREAK,1$
      0024C0                       2710 	_drop 2 
      00A35B 98 63            [ 2]    1     addw sp,#2 
      00A35D 13 09 27         [ 4] 2711 	call rest_context
      0024C5                       2712 	_drop CTXT_SIZE 
      00A360 03 CC            [ 2]    1     addw sp,#CTXT_SIZE 
      00A362 96 D7 00 22      [ 1] 2713 	bres flags,#FBREAK 
      00A364 72 10 00 22      [ 1] 2714 	bset flags,#FRUN 
      00A364 CF 00 1A         [ 2] 2715 	jp interpreter 
      0024D2                       2716 1$:	; check for address option 
      00A367 F6 EE 01         [ 4] 2717 	call next_token 
      00A36A 72 FB            [ 1] 2718 	cp a,#TK_INTGR
      00A36C 04 19            [ 1] 2719 	jrne 3$
      00A36E 03 72 C7         [ 4] 2720 	call get_int24 
      00A371 00 1A 72         [ 4] 2721 	call is_program_addr
      00A374 5C 00            [ 1] 2722 	jreq 2$
      00A376 1B 72            [ 1] 2723 	ld a,#ERR_NO_PROGRAM
      00A378 CF 00 1A         [ 2] 2724 	jp tb_error 
      00A37B C7 00 0D         [ 2] 2725 2$: ldw txtbgn,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00A37E CF 00 0E         [ 2] 2726 	subw x,#2 
      00A381 7B               [ 2] 2727 	ldw x,(x)
      00A382 06 1E 07 72      [ 2] 2728 	addw x,txtbgn 
      00A386 B0 00 0E         [ 2] 2729 	ldw txtend,x 
      00A389 C2 00            [ 2] 2730 	jra run_it 	
      0024F6                       2731 3$:	_unget_token 
      00A38B 0D 18 03 A8 80   [ 1]    1      mov in,in.saved  
      00A390 2B 12 20         [ 2] 2732 	ldw x,txtbgn
      00A393 25 7B 03         [ 2] 2733 	cpw x,txtend 
      00A396 2A 07            [ 1] 2734 	jrmi run_it 
      00A398 C6 00 0F         [ 2] 2735 	ldw x,#err_no_prog
      00A39B 2F 07 20         [ 4] 2736 	call puts 
      00A39E 1A 00 03 00 01   [ 1] 2737 	mov in,count
      00A39F 81               [ 4] 2738 	ret 
      00250F                       2739 run_it:	 
      00250F                       2740 	_drop 2 ; drop return address 
      00A39F 72 0E            [ 2]    1     addw sp,#2 
      002511                       2741 run_it_02: 
      00A3A1 00 0F 15         [ 4] 2742     call ubound 
      00A3A4 CD 13 C9         [ 4] 2743 	call clear_vars
                                   2744 ; initialize DIM variables pointers 
      00A3A4 1E 0D CF         [ 2] 2745 	ldw x,txtend 
      00A3A7 00 05 72         [ 2] 2746 	ldw dvar_bgn,x 
      00A3AA 01 00 23         [ 2] 2747 	ldw dvar_end,x 	 
                                   2748 ; clear data pointer 
      00A3AD 05               [ 1] 2749 	clrw x 
      00A3AE E6 02 C7         [ 2] 2750 	ldw data_ptr,x 
      00A3B1 00 04 1E 0B      [ 1] 2751 	clr data_ofs 
      00A3B5 CF 00 01 81      [ 1] 2752 	clr data_len 
                                   2753 ; initialize BASIC pointer 
      00A3B9 CE 00 1B         [ 2] 2754 	ldw x,txtbgn 
      00A3B9 85 5B 0D         [ 2] 2755 	ldw basicptr,x 
      00A3BC 72 5A            [ 1] 2756 	ld a,(2,x)
      00A3BE 00 20 FC         [ 1] 2757 	ld count,a
      00A3C1 35 03 00 01      [ 1] 2758 	mov in,#3	
      00A3C1 CD 98 3B A1      [ 1] 2759 	bset flags,#FRUN 
      00A3C5 84 27 07         [ 2] 2760 	jp interpreter 
                                   2761 
                                   2762 
                                   2763 ;----------------------
                                   2764 ; BASIC: END
                                   2765 ; end running program
                                   2766 ;---------------------- 
      002542                       2767 cmd_end: 
                                   2768 ; clean stack 
      00A3C8 A1 03 27         [ 2] 2769 	ldw x,#STACK_EMPTY
      00A3CB 26               [ 1] 2770 	ldw sp,x 
      00A3CC CC 96 D7         [ 2] 2771 	jp warm_start
                                   2772 
                                   2773 ;---------------------------
                                   2774 ; BASIC: GET var 
                                   2775 ; receive a key in variable 
                                   2776 ; don't wait 
                                   2777 ;---------------------------
      00A3CF                       2778 cmd_get:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A3CF 90 89 CD         [ 4] 2779 	call next_token 
      00A3D2 98 6D            [ 1] 2780 	cp a,#TK_VAR 
      00A3D4 4F 90            [ 1] 2781 	jreq 0$
      00A3D6 CE 00 05         [ 2] 2782 	jp syntax_error 
      00A3D9 90 FE 90         [ 4] 2783 0$: call get_addr 
      00A3DC 89 13 01         [ 2] 2784 	ldw ptr16,x 
      00A3DF 5B 02 25         [ 4] 2785 	call qgetc 
      00A3E2 01 4C            [ 1] 2786 	jreq 2$
      00A3E4 CD 08 EE         [ 4] 2787 	call getc  
      00A3E4 CD 8C 98 5D      [ 4] 2788 2$: clr [ptr16]
      00A3E8 26 05 A6 05      [ 1] 2789 	inc ptr8 
      00A3EC CC 96 D9 90      [ 4] 2790 	clr [ptr16]
      00A3F0 85 81 00 1A      [ 1] 2791 	inc ptr8 
      00A3F2 72 C7 00 19      [ 4] 2792 	ld [ptr16],a 
      00A3F2 90               [ 4] 2793 	ret 
                                   2794 
                                   2795 
                                   2796 ;-----------------
                                   2797 ; 1 Khz beep 
                                   2798 ;-----------------
      002576                       2799 beep_1khz:: 
      00A3F3 89 89            [ 2] 2800 	pushw y 
      00A3F5 CD 98 54         [ 2] 2801 	ldw x,#100
      00A3F8 72 5F 00 0E      [ 2] 2802 	ldw y,#1000
      00A3FC 90 CE            [ 2] 2803 	jra beep
                                   2804 
                                   2805 ;-----------------------
                                   2806 ; BASIC: TONE expr1,expr2
                                   2807 ; used TIMER2 channel 1
                                   2808 ; to produce a tone 
                                   2809 ; arguments:
                                   2810 ;    expr1   frequency 
                                   2811 ;    expr2   duration msec.
                                   2812 ;---------------------------
      002581                       2813 tone:
      00A3FE 00 1C            [ 2] 2814 	pushw y 
      00A400 90 E6 03         [ 4] 2815 	call arg_list 
      00A403 A1 03            [ 1] 2816 	cp a,#2 
      00A405 27 15            [ 1] 2817 	jreq 1$
      00A407 90 E6 02         [ 2] 2818 	jp syntax_error 
      00258D                       2819 1$: 
      00258D                       2820 	_xpop 
      00A40A C7 00            [ 1]    1     ld a,(y)
      00A40C 0F               [ 1]    2     ldw x,y 
      00A40D 72 B9            [ 2]    3     ldw x,(1,x)
      00A40F 00 0E 90 C3      [ 2]    4     addw y,#CELL_SIZE 
      00A413 00               [ 2] 2821 	pushw x ; duration 
      002597                       2822 	_xpop ; frequency
      00A414 1E 25            [ 1]    1     ld a,(y)
      00A416 E9               [ 1]    2     ldw x,y 
      00A417 A6 0A            [ 2]    3     ldw x,(1,x)
      00A419 CC 96 D9 03      [ 2]    4     addw y,#CELL_SIZE 
      00A41C 90 93            [ 1] 2823 	ldw y,x ; frequency 
      00A41C 90               [ 2] 2824 	popw x  ; duration 
      0025A3                       2825 beep:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A41D 89               [ 2] 2826 	pushw x 
      00A41E 72 A9 00         [ 2] 2827 	ldw x,#TIM2_CLK_FREQ
      00A421 04               [ 2] 2828 	divw x,y ; cntr=Fclk/freq 
                                   2829 ; round to nearest integer 
      00A422 1E 03 CD 93      [ 2] 2830 	cpw y,#TIM2_CLK_FREQ/2
      00A426 E4 26            [ 1] 2831 	jrmi 2$
      00A428 04               [ 1] 2832 	incw x 
      0025AF                       2833 2$:	 
      00A429 90               [ 1] 2834 	ld a,xh 
      00A42A 85 20 DA         [ 1] 2835 	ld TIM2_ARRH,a 
      00A42D 9F               [ 1] 2836 	ld a,xl 
      00A42D 85 5B 02         [ 1] 2837 	ld TIM2_ARRL,a 
                                   2838 ; 50% duty cycle 
      00A430 90               [ 1] 2839 	ccf 
      00A431 85               [ 2] 2840 	rrcw x 
      00A432 81               [ 1] 2841 	ld a,xh 
      00A433 C7 53 0F         [ 1] 2842 	ld TIM2_CCR1H,a 
      00A433 72               [ 1] 2843 	ld a,xl
      00A434 00 00 23         [ 1] 2844 	ld TIM2_CCR1L,a
      00A437 05 A6 06 CC      [ 1] 2845 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A43B 96 D9 CD 9B      [ 1] 2846 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A43F 47 A1 84 27      [ 1] 2847 	bset TIM2_EGR,#TIM2_EGR_UG
      00A443 03               [ 2] 2848 	popw x 
      00A444 CC 96 D7         [ 4] 2849 	call pause02
      00A447 90 F6 93 EE      [ 1] 2850 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A44B 01 72 A9 00      [ 1] 2851 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A44F 03 9F            [ 2] 2852 	popw y 
      00A451 27               [ 4] 2853 	ret 
                                   2854 
                                   2855 ;-------------------------------
                                   2856 ; BASIC: ADCON 0|1 [,divisor]  
                                   2857 ; disable/enanble ADC 
                                   2858 ;-------------------------------
                           000003  2859 	ONOFF=3 
                           000001  2860 	DIVSOR=1
                           000004  2861 	VSIZE=4 
      0025DC                       2862 power_adc:
      00A452 68 88 CD         [ 4] 2863 	call arg_list 
      00A455 98 3B            [ 1] 2864 	cp a,#2	
      00A457 A1 80            [ 1] 2865 	jreq 1$
      00A459 27 03            [ 1] 2866 	cp a,#1 
      00A45B CC 96            [ 1] 2867 	jreq 0$ 
      00A45D D7 FE 72         [ 2] 2868 	jp syntax_error 
      00A460 5C               [ 1] 2869 0$:	clr a 
      00A461 00               [ 1] 2870 	clrw x
      0025EC                       2871 	_xpush   ; divisor  
      00A462 02 72 5C 00      [ 2]    1     subw y,#CELL_SIZE
      00A466 02 A3            [ 1]    2     ld (y),a 
      00A468 A4 C5 27         [ 2]    3     ldw (1,y),x 
      0025F5                       2872 1$: _at_next 
      00A46B 08 A3 A4         [ 1]    1     ld a,(3,y)
      00A46E DF               [ 1]    2     ldw x,y 
      00A46F 27 03            [ 2]    3     ldw x,(4,x)
      00A471 CC               [ 2] 2873 	tnzw x 
      00A472 96 D7            [ 1] 2874 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A474                       2875 	_xpop
      00A474 84 89            [ 1]    1     ld a,(y)
      00A476 88               [ 1]    2     ldw x,y 
      00A477 EE 01            [ 2]    3     ldw x,(1,x)
      00A477 0A 01 27 26      [ 2]    4     addw y,#CELL_SIZE 
      002607                       2876 	_xdrop  
      00A47B CD 98 3B A1      [ 2]    1     addw y,#CELL_SIZE 
      00A47F 84               [ 1] 2877 	ld a,xl
      00A480 27 07            [ 1] 2878 	and a,#7
      00A482 A1               [ 1] 2879 	swap a 
      00A483 03 27 0D         [ 1] 2880 	ld ADC_CR1,a
      00A486 CC 96 D7 CA      [ 1] 2881 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A489 72 10 54 01      [ 1] 2882 	bset ADC_CR1,#ADC_CR1_ADON 
      00261A                       2883 	_usec_dly 7 
      00A489 C6 00 02         [ 2]    1     ldw x,#(16*7-2)/4
      00A48C AB               [ 2]    2     decw x
      00A48D 03               [ 1]    3     nop 
      00A48E C7 00            [ 1]    4     jrne .-4
      00A490 02 20            [ 2] 2884 	jra 3$
      00A492 03 CD 98 54      [ 1] 2885 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A496 72 17 50 CA      [ 1] 2886 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00262B                       2887 3$:	
      00A496 CD               [ 4] 2888 	ret
                                   2889 
                                   2890 ;-----------------------------
                                   2891 ; BASIC: ADCREAD (channel)
                                   2892 ; read adc channel {0..5}
                                   2893 ; output:
                                   2894 ;   A 		TK_INTGR 
                                   2895 ;   X 		value 
                                   2896 ;-----------------------------
      00262C                       2897 analog_read:
      00A497 98 3B A1         [ 4] 2898 	call func_args 
      00A49A 08 27            [ 1] 2899 	cp a,#1 
      00A49C DA 5B            [ 1] 2900 	jreq 1$
      00A49E 03 20 1A         [ 2] 2901 	jp syntax_error
      00A4A1                       2902 1$: _xpop 
      00A4A1 5B 01            [ 1]    1     ld a,(y)
      00A4A3 CD               [ 1]    2     ldw x,y 
      00A4A4 A3 C1            [ 2]    3     ldw x,(1,x)
      00A4A6 CF 00 1A 55      [ 2]    4     addw y,#CELL_SIZE 
      00A4AA 00 04 00         [ 2] 2903 	cpw x,#5 
      00A4AD 02 85            [ 2] 2904 	jrule 2$
      00A4AF A3 A4            [ 1] 2905 	ld a,#ERR_BAD_VALUE
      00A4B1 C5 26 05         [ 2] 2906 	jp tb_error 
      00A4B4 CE               [ 1] 2907 2$: ld a,xl
      00A4B5 00 1A 20         [ 1] 2908 	ld acc8,a 
      00A4B8 19 05            [ 1] 2909 	ld a,#5
      00A4B9 C0 00 0E         [ 1] 2910 	sub a,acc8 
      00A4B9 20 35 00         [ 1] 2911 	ld ADC_CSR,a
      00A4BB 72 16 54 02      [ 1] 2912 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A4BB 55 00 04 00      [ 1] 2913 	bset ADC_CR1,#ADC_CR1_ADON
      00A4BF 02 5B 02 CC 97   [ 2] 2914 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A4C4 8A 54 04         [ 2] 2915 	ldw x,ADC_DRH
      00A4C5 A6 84            [ 1] 2916 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00A4C5 72               [ 4] 2917 	ret 
                                   2918 
                                   2919 ;-----------------------
                                   2920 ; BASIC: DREAD(pin)
                                   2921 ; Arduino pins 
                                   2922 ; read state of a digital pin 
                                   2923 ; pin# {0..15}
                                   2924 ; output:
                                   2925 ;    A 		TK_INTGR
                                   2926 ;    X      0|1 
                                   2927 ;-------------------------
                           000001  2928 	PINNO=1
                           000001  2929 	VSIZE=1
      002668                       2930 digital_read:
      002668                       2931 	_vars VSIZE 
      00A4C6 00 00            [ 2]    1     sub sp,#VSIZE 
      00A4C8 23 05 A6         [ 4] 2932 	call func_args
      00A4CB 06 CC            [ 1] 2933 	cp a,#1
      00A4CD 96 D9            [ 1] 2934 	jreq 1$
      00A4CF CC 16 57         [ 2] 2935 	jp syntax_error
      002674                       2936 1$: _xpop 
      00A4CF CD A3            [ 1]    1     ld a,(y)
      00A4D1 C1               [ 1]    2     ldw x,y 
      00A4D2 EE 01            [ 2]    3     ldw x,(1,x)
      00A4D2 CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A4D6 02 C7 00         [ 2] 2937 	cpw x,#15 
      00A4D9 04 35            [ 2] 2938 	jrule 2$
      00A4DB 03 00            [ 1] 2939 	ld a,#ERR_BAD_VALUE
      00A4DD 02 81 59         [ 2] 2940 	jp tb_error 
      00A4DF CD 2C 31         [ 4] 2941 2$:	call select_pin 
      00A4DF 72 00            [ 1] 2942 	ld (PINNO,sp),a
      00A4E1 00 23            [ 1] 2943 	ld a,(GPIO_IDR,x)
      00A4E3 06 A6            [ 1] 2944 	tnz (PINNO,sp)
      00A4E5 06 CC            [ 1] 2945 	jreq 8$
      00A4E7 96               [ 1] 2946 3$: srl a 
      00A4E8 D9 81            [ 1] 2947 	dec (PINNO,sp)
      00A4EA 26 FB            [ 1] 2948 	jrne 3$ 
      00A4EA CD A3            [ 1] 2949 8$: and a,#1 
      00A4EC C1               [ 1] 2950 	clrw x 
      00A4ED CF               [ 1] 2951 	ld xl,a 
      00A4EE 00               [ 1] 2952 	clr a 
      00269C                       2953 	_drop VSIZE
      00A4EF 1A 01            [ 2]    1     addw sp,#VSIZE 
      00A4F0 81               [ 4] 2954 	ret
                                   2955 
                                   2956 
                                   2957 ;-----------------------
                                   2958 ; BASIC: DWRITE pin,0|1
                                   2959 ; Arduino pins 
                                   2960 ; write to a digital pin 
                                   2961 ; pin# {0..15}
                                   2962 ; output:
                                   2963 ;    A 		TK_INTGR
                                   2964 ;    X      0|1 
                                   2965 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                           000001  2966 	PINNO=1
                           000002  2967 	PINVAL=2
                           000002  2968 	VSIZE=2
      00269F                       2969 digital_write:
      00269F                       2970 	_vars VSIZE 
      00A4F0 85 52            [ 2]    1     sub sp,#VSIZE 
      00A4F2 04 89 CE         [ 4] 2971 	call arg_list  
      00A4F5 00 05            [ 1] 2972 	cp a,#2 
      00A4F7 1F 03            [ 1] 2973 	jreq 1$
      00A4F9 CE 00 01         [ 2] 2974 	jp syntax_error
      0026AB                       2975 1$: _xpop 
      00A4FC 1F 05            [ 1]    1     ld a,(y)
      00A4FE CE               [ 1]    2     ldw x,y 
      00A4FF 00 1A            [ 2]    3     ldw x,(1,x)
      00A501 20 CF 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A503 9F               [ 1] 2976 	ld a,xl 
      00A503 72 00            [ 1] 2977 	ld (PINVAL,sp),a
      0026B7                       2978 	_xpop 
      00A505 00 23            [ 1]    1     ld a,(y)
      00A507 05               [ 1]    2     ldw x,y 
      00A508 A6 06            [ 2]    3     ldw x,(1,x)
      00A50A CC 96 D9 03      [ 2]    4     addw y,#CELL_SIZE 
      00A50D A3 00 0F         [ 2] 2979 	cpw x,#15 
      00A50D 1E 03            [ 2] 2980 	jrule 2$
      00A50F CF 00            [ 1] 2981 	ld a,#ERR_BAD_VALUE
      00A511 05 E6 02         [ 2] 2982 	jp tb_error 
      00A514 C7 00 04         [ 4] 2983 2$:	call select_pin 
      00A517 1E 05            [ 1] 2984 	ld (PINNO,sp),a 
      00A519 CF 00            [ 1] 2985 	ld a,#1
      00A51B 01 85            [ 1] 2986 	tnz (PINNO,sp)
      00A51D 5B 04            [ 1] 2987 	jreq 4$
      00A51F FC               [ 1] 2988 3$: sll a
      00A520 0A 01            [ 1] 2989 	dec (PINNO,sp)
      00A520 4D 26            [ 1] 2990 	jrne 3$
      00A522 10 A3            [ 1] 2991 4$: tnz (PINVAL,sp)
      00A524 B7 80            [ 1] 2992 	jrne 5$
      00A526 25               [ 1] 2993 	cpl a 
      00A527 0A 89            [ 1] 2994 	and a,(GPIO_ODR,x)
      00A529 1D 00            [ 2] 2995 	jra 8$
      00A52B 04 CD            [ 1] 2996 5$: or a,(GPIO_ODR,x)
      00A52D A8 92            [ 1] 2997 8$: ld (GPIO_ODR,x),a 
      0026E7                       2998 	_drop VSIZE 
      00A52F 85 27            [ 2]    1     addw sp,#VSIZE 
      00A531 01               [ 4] 2999 	ret
                                   3000 
                                   3001 
                                   3002 ;-----------------------
                                   3003 ; BASIC: STOP
                                   3004 ; stop progam execution  
                                   3005 ; without resetting pointers 
                                   3006 ; the program is resumed
                                   3007 ; with RUN 
                                   3008 ;-------------------------
      0026EA                       3009 stop:
      00A532 43 81 00 22 02   [ 2] 3010 	btjt flags,#FRUN,2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A534 4F               [ 1] 3011 	clr a
      00A534 72               [ 4] 3012 	ret 
      0026F1                       3013 2$:	 
                                   3014 ; create space on cstack to save context 
      00A535 01 00 23         [ 2] 3015 	ldw x,#break_point 
      00A538 02 4F 81         [ 4] 3016 	call puts 
      00A53B                       3017 	_drop 2 ;drop return address 
      00A53B 72 09            [ 2]    1     addw sp,#2 
      0026F9                       3018 	_vars CTXT_SIZE ; context size 
      00A53D 00 23            [ 2]    1     sub sp,#CTXT_SIZE 
      00A53F 12 5B 02         [ 4] 3019 	call save_context 
      00A542 CD A0 A5         [ 2] 3020 	ldw x,#tib 
      00A545 5B 04 72         [ 2] 3021 	ldw basicptr,x
      00A548 19               [ 1] 3022 	clr (x)
      00A549 00 23 72 10      [ 1] 3023 	clr count  
      00A54D 00               [ 1] 3024 	clrw x 
      00A54E 23 CC 97         [ 2] 3025 	ldw in.w,x
      00A551 82 11 00 22      [ 1] 3026 	bres flags,#FRUN 
      00A552 72 18 00 22      [ 1] 3027 	bset flags,#FBREAK
      00A552 CD 98 3B         [ 2] 3028 	jp interpreter 
      00A555 A1 84 26 1D CD 98 6D  3029 break_point: .asciz "\nbreak point, RUN to resume.\n"
             CD A5 20 27 05 A6 12
             CC 96 D9 CF 00 1C 1D
             00 02 FE 72 BB 00 1C
             CF 00
                                   3030 
                                   3031 ;-----------------------
                                   3032 ; BASIC: NEW
                                   3033 ; from command line only 
                                   3034 ; free program memory
                                   3035 ; and clear variables 
                                   3036 ;------------------------
      002736                       3037 new: 
      00A573 1E 20 19 55 00   [ 2] 3038 	btjf flags,#FRUN,0$ 
      00A578 03               [ 4] 3039 	ret 
      00273C                       3040 0$:	
      00A579 00 02 CE         [ 4] 3041 	call clear_basic 
      00A57C 00               [ 4] 3042 	ret 
                                   3043 
                                   3044 ;-----------------------------------
                                   3045 ; erase program at specified address
                                   3046 ; keep signature and size fields. 
                                   3047 ; signature replaced by "XX"
                                   3048 ; input:
                                   3049 ;    X    address 
                                   3050 ;-----------------------------------
                           000001  3051 	ADDR=1    ; program address
                           000003  3052 	PRG_SIZE=3    ; program size 
                           000005  3053 	BLOCKS=5 ; blocks to erase 
                           000006  3054 	VSIZE=6
      002740                       3055 erase_program:
      00A57D 1C C3 00         [ 4] 3056 	call get_int24
      00A580 1E 2B 0C         [ 4] 3057 	call is_program_addr 
      00A583 AE 96            [ 1] 3058 	jrne 9$
      00A585 2E CD 89         [ 4] 3059 	call move_erase_to_ram
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A588 BB 55 00 04      [ 1] 3060 	clr farptr 
      00274F                       3061 	_vars VSIZE 
      00A58C 00 02            [ 2]    1     sub sp,#VSIZE 
      00A58E 81 00 04         [ 2] 3062 1$:	subw x,#4 
      00A58F 1F 01            [ 2] 3063 	ldw (ADDR,sp),x
      00A58F 5B 02            [ 2] 3064 	ldw x,(2,x)
      00A591 1F 03            [ 2] 3065 	ldw (PRG_SIZE,sp),x
      00A591 CD 9D            [ 1] 3066 	ld a,#BLOCK_SIZE 
      00A593 14               [ 2] 3067 	div x,a 
      00A594 CD               [ 1] 3068 	tnz a 
      00A595 94 49            [ 1] 3069 	jreq 2$ 
      00A597 CE               [ 1] 3070 	incw x 
      00A598 00 1E            [ 2] 3071 2$:	ldw (BLOCKS,sp),x 
      00A59A CF 00            [ 2] 3072 	ldw x,(ADDR,sp)
      00A59C 31 CF 00         [ 2] 3073 	ldw ptr16,x 
      00A59F 33 5F CF         [ 4] 3074 3$:	call block_erase
      00A5A2 00 07 72         [ 2] 3075 	ldw x,#BLOCK_SIZE 
      00A5A5 5F 00 09         [ 4] 3076 	call incr_farptr
      00A5A8 72 5F            [ 2] 3077 	ldw x,(BLOCKS,sp)
      00A5AA 00               [ 2] 3078 	decw x 
      00A5AB 0A CE            [ 2] 3079 	ldw (BLOCKS,sp),x 
      00A5AD 00 1C            [ 1] 3080 	jrne 3$ 
                                   3081 ; write XX and size at addr 
      00A5AF CF 00            [ 2] 3082 	ldw x,(ADDR,sp)
      00A5B1 05 E6 02         [ 2] 3083 	ldw ptr16,x 
      00A5B4 C7 00            [ 1] 3084 	ld a,#'X 
      00A5B6 04               [ 1] 3085 	clrw x 
      00A5B7 35 03 00         [ 4] 3086 	call write_byte 
      00A5BA 02 72 10         [ 4] 3087 	call write_byte 
      00A5BD 00 23            [ 1] 3088 	ld a,(PRG_SIZE,sp)
      00A5BF CC 97 82         [ 4] 3089 	call write_byte 
      00A5C2 7B 04            [ 1] 3090 	ld a,(PRG_SIZE+1,sp)
      00A5C2 AE 17 FF         [ 4] 3091 	call write_byte 
      002790                       3092 	_drop VSIZE 
      00A5C5 94 CC            [ 2]    1     addw sp,#VSIZE 
      002792                       3093 9$:	
      00A5C7 97               [ 4] 3094 	ret 
                                   3095 
                                   3096 ;-----------------------------------
                                   3097 ; BASIC: ERASE \E | \F || address
                                   3098 ; erase all block in range from 
                                   3099 ;  'app_space' to FLASH end (0x27fff)
                                   3100 ;  or all EEPROM 
                                   3101 ; that contains a non zero byte. 
                                   3102 ; if the argument is an address  
                                   3103 ; mark the program at this address 
                                   3104 ; as erased. Erase the blocks 
                                   3105 ; replace signature by 'XX' and 
                                   3106 ; keep size field.  
                                   3107 ;-----------------------------------
                           000001  3108 	LIMIT=1 
                           000003  3109 	VSIZE = 3 
      002793                       3110 erase:
      00A5C8 63 01 00 22 05   [ 2] 3111 	btjf flags,#FRUN,eras0
      00A5C9 A6 07            [ 1] 3112 	ld a,#ERR_CMD_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A5C9 CD 98 3B         [ 2] 3113 	jp tb_error 
      00279D                       3114 eras0:	
      00A5CC A1 85 27 03      [ 1] 3115 	clr farptr 
      00A5D0 CC 96 D7         [ 4] 3116 	call next_token
      00A5D3 CD 98            [ 1] 3117 	cp a,#TK_INTGR
      00A5D5 63 CF            [ 1] 3118 	jreq erase_program  
      0027A8                       3119 	_vars VSIZE 
      00A5D7 00 1A            [ 2]    1     sub sp,#VSIZE 
      00A5D9 CD 89            [ 1] 3120 	cp a,#TK_CHAR 
      00A5DB 67 27            [ 1] 3121 	jreq 0$ 
      00A5DD 03 CD 89         [ 2] 3122 	jp syntax_error
      00A5E0 6E 72 3F         [ 4] 3123 0$: call get_char 
      00A5E3 00 1A            [ 1] 3124 	and a,#0XDF 
      00A5E5 72 5C            [ 1] 3125 	cp a,#'E
      00A5E7 00 1B            [ 1] 3126 	jrne 1$
      00A5E9 72 3F 00         [ 2] 3127 	ldw x,#EEPROM_BASE 
      00A5EC 1A 72 5C         [ 2] 3128 	ldw farptr+1,x 
      00A5EF 00 1B 72         [ 2] 3129 	ldw x,#EEPROM_END
      00A5F2 C7               [ 1] 3130 	clr a 
      00A5F3 00 1A            [ 2] 3131 	jra 3$ 
      00A5F5 81 46            [ 1] 3132 1$: cp a,#'F 
      00A5F6 27 06            [ 1] 3133 	jreq 2$
      00A5F6 90 89 AE         [ 2] 3134 	ldw x,#err_bad_value
      00A5F9 00 64 90         [ 2] 3135 	jp tb_error
      0027D0                       3136 2$:
      00A5FC AE 03 E8         [ 2] 3137 	ldw x,#app_space  
      00A5FF 20 22 19         [ 2] 3138 	ldw farptr+1,x 
      00A601 A6 02            [ 1] 3139 	ld a,#(FLASH_END>>16)&0XFF 
      00A601 90 89 CD         [ 2] 3140 	ldw x,#FLASH_END&0xffff
      0027DB                       3141 3$:
      00A604 9A 03            [ 1] 3142 	ld (LIMIT,sp),a 
      00A606 A1 02            [ 2] 3143 	ldw (LIMIT+1,sp),x 
                                   3144 ; operation done from RAM
                                   3145 ; copy code to RAM in tib   
      00A608 27 03 CC         [ 4] 3146 	call move_erase_to_ram
      0027E2                       3147 4$:	 
      00A60B 96 D7 5E         [ 4] 3148     call scan_block 
      00A60D 27 08            [ 1] 3149 	jreq 5$  ; block already erased 
      00A60D 90 F6            [ 1] 3150     ld a,#'E 
      00A60F 93 EE 01         [ 4] 3151     call putc 
      00A612 72 A9 00         [ 4] 3152 	call block_erase   
                                   3153 ; this block is clean, next  
      00A615 03 89 90         [ 2] 3154 5$:	ldw x,#BLOCK_SIZE
      00A618 F6 93 EE         [ 4] 3155 	call incr_farptr
                                   3156 ; check limit, 24 bit substraction  	
      00A61B 01 72            [ 1] 3157 	ld a,(LIMIT,sp)
      00A61D A9 00            [ 2] 3158 	ldw x,(LIMIT+1,sp)
      00A61F 03 90 93 85      [ 2] 3159 	subw x,farptr+1
      00A623 C2 00 18         [ 1] 3160 	sbc a,farptr 
      00A623 89 AE            [ 1] 3161 	jrugt 4$ 
      00A625 F4 24 65         [ 4] 3162 9$: call clear_basic
      00A628 90 A3            [ 2] 3163 	ldw x,(LIMIT+1,sp)
      00A62A 7A 12 2B         [ 2] 3164 	cpw x,#EEPROM_END
      00A62D 01 5C            [ 1] 3165 	jrne 10$
      00A62F CD 1C F3         [ 4] 3166 	call func_eefree 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00280F                       3167 10$:
      00280F                       3168 	_drop VSIZE 
      00A62F 9E C7            [ 2]    1     addw sp,#VSIZE 
      00A631 53               [ 4] 3169 	ret 
                                   3170 	
                                   3171 
                                   3172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3173 ;  check for application signature 
                                   3174 ; input:
                                   3175 ;	x       address to check 
                                   3176 ; output:
                                   3177 ;   Z      1  signature present 
                                   3178 ;          0 not app signature  
                                   3179 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002812                       3180 qsign: 
      00A632 0D               [ 2] 3181 	pushw x 
      00A633 9F               [ 2] 3182 	ldw x,(x)
      00A634 C7 53 0E         [ 2] 3183 	cpw x,SIGNATURE ; "TB" 
      00A637 8C               [ 2] 3184 	popw x 
      00A638 56               [ 4] 3185 	ret 
                                   3186 
                                   3187 ;--------------------------------------
                                   3188 ;  fill write buffer 
                                   3189 ;  input:
                                   3190 ;    y  point to output buffer 
                                   3191 ;    x  point to source 
                                   3192 ;    a  bytes to write in buffer 
                                   3193 ;  output:
                                   3194 ;    y   += A 
                                   3195 ;    X   += A 
                                   3196 ;    A   0 
                                   3197 ;---------------------------------------
      002819                       3198 fill_write_buffer:
      00A639 9E               [ 1] 3199 	push a 
      00A63A C7               [ 1] 3200 	tnz a 
      00A63B 53 0F            [ 1] 3201 	jreq 9$ 
      00A63D 9F               [ 1] 3202 1$: ld a,(x)
      00A63E C7               [ 1] 3203 	incw x 
      00A63F 53 10            [ 1] 3204 	ld (y),a 
      00A641 72 10            [ 1] 3205 	incw y 
      00A643 53 08            [ 1] 3206 	dec (1,sp) 
      00A645 72 10            [ 1] 3207 	jrne 1$ 
      00A647 53               [ 1] 3208 9$:	pop a 
      00A648 00               [ 4] 3209     ret 	
                                   3210 
                                   3211 ;--------------------------------------
                                   3212 ;  fill pad buffer with zero 
                                   3213 ;  input:
                                   3214 ;	none 
                                   3215 ;  output:
                                   3216 ;    y     buffer address  
                                   3217 ;--------------------------------------
      002829                       3218 clear_block_buffer:
      00A649 72               [ 1] 3219 	push a 
      00A64A 10 53 04 85      [ 2] 3220 	ldw y,#block_buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A64E CD AB            [ 2] 3221 	pushw y
      00A650 6E 72            [ 1] 3222 	ld a,#BLOCK_SIZE   
      00A652 11 53            [ 1] 3223 1$:	clr (y)
      00A654 08 72            [ 1] 3224 	incw y
      00A656 11               [ 1] 3225 	dec a  
      00A657 53 00            [ 1] 3226 	jrne 1$ 	
      00A659 90 85            [ 2] 3227 9$: popw y 
      00A65B 81               [ 1] 3228 	pop a 			
      00A65C 81               [ 4] 3229 	ret 
                                   3230 
                                   3231 
                                   3232 ;---------------------------------------
                                   3233 ; BASIC: SAVE
                                   3234 ; write application from RAM to FLASH
                                   3235 ; at UFLASH address
                                   3236 ;--------------------------------------
                           000001  3237 	XTEMP=1
                           000003  3238 	COUNT=3  ; last count bytes written 
                           000004  3239 	CNT_LO=4 ; count low byte 
                           000005  3240 	TOWRITE=5 ; how bytes left to write  
                           000006  3241 	VSIZE=6 
      00283D                       3242 save_app:
      00A65C CD               [ 2] 3243 	pushw x 
      00A65D 9A 03            [ 2] 3244 	pushw y 
      002840                       3245 	_vars VSIZE
      00A65F A1 02            [ 2]    1     sub sp,#VSIZE 
      00A661 27 12 A1         [ 4] 3246 	call prog_size 
      00A664 01 27            [ 1] 3247 	jrne 0$ 
      00A666 03 CC 96         [ 2] 3248 	ldw x,#NO_APP
      00A669 D7 4F 5F         [ 4] 3249 	call puts 
      00A66C 72 A2 00         [ 2] 3250 	jp 9$
      00A66F 03 90            [ 2] 3251 0$:	ldw (TOWRITE,sp),x ; program size
      00A671 F7 90 EF         [ 4] 3252 	call uflash
      00A674 01 90 E6 03      [ 1] 3253 	clr farptr 
      00A678 93 EE 04         [ 2] 3254 	ldw ptr16,x 
      00A67B 5D 27 25         [ 2] 3255 	ldw x,#0xFFFF
      00A67E 90 F6 93 EE      [ 2] 3256 	subw x,ptr16 ; free flash 
      00A682 01 72 A9         [ 2] 3257 	subw x,#4 ; signature and size field 
      00A685 00 03            [ 2] 3258 	cpw x,(TOWRITE,sp)
      00A687 72 A9            [ 1] 3259 	jruge 1$
      00A689 00 03 9F         [ 2] 3260 	ldw x,#CANT_DO 
      00A68C A4 07 4E         [ 4] 3261 	call puts 
      00A68F C7 54 01         [ 2] 3262 	jp 9$
      002873                       3263 1$: 
                                   3264 ; block programming flash
                                   3265 ; must be done from RAM
                                   3266 ; moved in tib  
      00A692 72 16 50         [ 4] 3267 	call move_prg_to_ram
                                   3268 ; initialize written bytes count  
      00A695 CA 72            [ 1] 3269 	clr (COUNT,sp)
                                   3270 ; first bock 
                                   3271 ; containt signature 2 bytes 
                                   3272 ; and size 	2 bytes 
                                   3273 ; use Y as pointer to block_buffer
      00A697 10 54 01         [ 4] 3274 	call clear_block_buffer ; -- y=*block_buffer	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3275 ; write signature
      00A69A AE 00 1B         [ 2] 3276 	ldw x,SIGNATURE ; "TB" 
      00A69D 5A 9D            [ 2] 3277 	ldw (y),x 
      00A69F 26 FA 20 08      [ 2] 3278 	addw y,#2
      00A6A3 72 11            [ 2] 3279 	ldw x,(TOWRITE,sp)
      00A6A5 54 01            [ 2] 3280 	ldw (y),x
      00A6A7 72 17 50 CA      [ 2] 3281 	addw y,#2   
      00A6AB A6 7C            [ 1] 3282 	ld a,#(BLOCK_SIZE-4)
      00A6AB 81 00 7C         [ 2] 3283 	cpw x,#(BLOCK_SIZE-4) 
      00A6AC 22 01            [ 1] 3284 	jrugt 3$
      00A6AC CD               [ 1] 3285 	ld a,xl 
      00A6AD 99 FE            [ 1] 3286 3$:	ld (CNT_LO,sp),a   
      00A6AF A1 01 27         [ 2] 3287 	ldw x,txtbgn 
      00A6B2 03 CC            [ 2] 3288 	ldw (XTEMP,sp),x 
      00289B                       3289 32$: 
      00A6B4 96 D7            [ 2] 3290 	ldw x,(XTEMP,sp)
      00A6B6 90 F6            [ 1] 3291 	ld a,(CNT_LO,sp)
      00A6B8 93 EE 01         [ 4] 3292 	call fill_write_buffer 
      00A6BB 72 A9            [ 2] 3293 	ldw (XTEMP,sp),x 
      00A6BD 00 03 A3         [ 2] 3294 	ldw x,#block_buffer
      00A6C0 00 05 23         [ 4] 3295 	call write_buffer
      00A6C3 05 A6 0A         [ 2] 3296 	ldw x,#BLOCK_SIZE 
      00A6C6 CC 96 D9         [ 4] 3297 	call incr_farptr  
                                   3298 ; following blocks 
      00A6C9 9F C7            [ 2] 3299 	ldw x,(XTEMP,sp)
      00A6CB 00 0F A6         [ 2] 3300 	cpw x,txtend 
      00A6CE 05 C0            [ 1] 3301 	jruge 9$ 
      00A6D0 00 0F            [ 2] 3302 	ldw x,(TOWRITE,sp)
      00A6D2 C7 54 00         [ 2] 3303 	subw x,(COUNT,sp)
      00A6D5 72 16            [ 2] 3304 	ldw (TOWRITE,sp),x 
      00A6D7 54 02            [ 1] 3305 	ld a,#BLOCK_SIZE 
      00A6D9 72 10 54         [ 2] 3306 	cpw x,#BLOCK_SIZE 
      00A6DC 01 72            [ 1] 3307 	jruge 4$ 
      00A6DE 0F               [ 1] 3308 	ld a,xl 
      00A6DF 54 00            [ 1] 3309 4$:	ld (CNT_LO,sp),a 
      00A6E1 FB CE 54         [ 4] 3310 	call clear_block_buffer 
      00A6E4 04 A6            [ 2] 3311 	jra 32$ 
      0028CD                       3312 9$:	_drop VSIZE 
      00A6E6 84 81            [ 2]    1     addw sp,#VSIZE 
      00A6E8 90 85            [ 2] 3313     popw y 
      00A6E8 52               [ 2] 3314 	popw x 
      00A6E9 01               [ 4] 3315 	ret 
                                   3316 
                                   3317 
      00A6EA CD 99                 3318 SIGNATURE: .ascii "TB"
      00A6EC FE A1                 3319 ERASED: .ascii "XX" 
      00A6EE 01 27 03 CC 96 D7 90  3320 CANT_DO: .asciz "Can't save application, not enough free FLASH\n"
             F6 93 EE 01 72 A9 00
             03 A3 00 0F 23 05 A6
             0A CC 96 D9 CD AC B1
             6B 01 E6 01 0D 01 27
             05 44 0A 01 26 FB A4
             01 5F 97 4F 5B
      00A71D 01 81 20 61 70 70 6C  3321 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



             20 69 6E 20 52 41 4D
             00
                                   3322 
                                   3323 ;---------------------
                                   3324 ; check if there is 
                                   3325 ; an erase program 
                                   3326 ; at this address 
                                   3327 ; input:
                                   3328 ;    X    address 
                                   3329 ; output:
                                   3330 ;    Z    Set=erased program 
                                   3331 ;--------------------
      00A71F                       3332 is_erased:
      00A71F 52               [ 2] 3333 	pushw x 
      00A720 02               [ 2] 3334 	ldw x,(x)
      00A721 CD 9A 03         [ 2] 3335 	cpw x,ERASED 
      00A724 A1               [ 2] 3336 	popw x 
      00A725 02               [ 4] 3337 	ret 
                                   3338 
                                   3339 ;---------------------
                                   3340 ; BASIC: DIR 
                                   3341 ; list programs saved 
                                   3342 ; in flash 
                                   3343 ;--------------------
                           000001  3344 	XTEMP=1 
      002923                       3345 cmd_dir:
      00A726 27 03 CC         [ 2] 3346 	ldw x,#app_space 
      00A729 96               [ 2] 3347 	pushw x 
      002927                       3348 1$: 
      00A72A D7 90 F6         [ 4] 3349 	call qsign 
      00A72D 93 EE            [ 1] 3350 	jrne 4$
      00A72F 01 72 A9         [ 2] 3351 	addw x,#4
      00A732 00 03 9F 6B      [ 1] 3352 	mov base,#16
      00A736 02 90 F6         [ 4] 3353 	call prt_i16
      00A739 93 EE            [ 1] 3354 	ld a,#SPACE 
      00A73B 01 72 A9         [ 4] 3355 	call putc 
      00A73E 00 03            [ 2] 3356 	ldw x,(1,sp)
      00A740 A3 00            [ 2] 3357 	ldw x,(2,x)
      00A742 0F 23 05 A6      [ 1] 3358 	mov base,#10 
      00A746 0A CC 96         [ 4] 3359 	call prt_i16 
      00A749 D9 CD AC         [ 2] 3360 	ldw x,#STR_BYTES
      00A74C B1 6B 01         [ 4] 3361 	call puts
      00A74F A6 01            [ 1] 3362 	ld a,#', 
      00A751 0D 01 27         [ 4] 3363 	call putc
      00A754 05 48            [ 2] 3364 	ldw x,(1,sp)
      00A756 0A 01 26         [ 2] 3365 	addw x,#10
      00A759 FB 0D 02         [ 4] 3366 	call puts 
      00A75C 26 05            [ 1] 3367 	ld a,#CR 
      00A75E 43 E4 00         [ 4] 3368 	call putc
      00A761 20 02            [ 2] 3369 	ldw x,(1,sp)
      00A763 EA 00 E7         [ 2] 3370 3$:	ldw acc16,x 
      00A766 00 5B            [ 2] 3371 	ldw x,(2,x)
      00A768 02 81 00 0D      [ 2] 3372 	addw x,acc16 
      00A76A 1C 00 04         [ 2] 3373 	addw x,#4 
      00A76A 72 00 00         [ 2] 3374 	addw x,#BLOCK_SIZE-1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A76D 23               [ 1] 3375 	ld a,xl 
      00A76E 02 4F            [ 1] 3376 	and a,#128 
      00A770 81               [ 1] 3377 	ld xl,a 
      00A771 1F 01            [ 2] 3378 	ldw (1,sp),x 
      00A771 AE A7            [ 2] 3379 	jra 1$
      002977                       3380 4$: ; check if it is an erased program 
      00A773 98 CD 89         [ 4] 3381 	call is_erased 
      00A776 BB 5B            [ 1] 3382 	jreq 3$ 
      00297C                       3383 8$: ; done 
      00297C                       3384 	_drop 2 
      00A778 02 52            [ 2]    1     addw sp,#2 
      00A77A 04               [ 4] 3385 	ret 
                                   3386 
                                   3387 ;---------------------
                                   3388 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3389 ; write 1 or more byte to FLASH or EEPROM
                                   3390 ; starting at address  
                                   3391 ; input:
                                   3392 ;   expr1  	is address 
                                   3393 ;   expr2,...,exprn   are bytes to write
                                   3394 ; output:
                                   3395 ;   none 
                                   3396 ;---------------------
      00297F                       3397 write:
      00A77B CD A0 95         [ 4] 3398 	call expression
      00A77E AE 16            [ 1] 3399 	cp a,#TK_INTGR 
      00A780 90 CF            [ 1] 3400 	jreq 0$
      00A782 00 05 7F         [ 2] 3401 	jp syntax_error
      002989                       3402 0$: _xpop 
      00A785 72 5F            [ 1]    1     ld a,(y)
      00A787 00               [ 1]    2     ldw x,y 
      00A788 04 5F            [ 2]    3     ldw x,(1,x)
      00A78A CF 00 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A78E 11 00 23         [ 1] 3403 	ld farptr,a 
      00A791 72 18 00         [ 2] 3404 	ldw ptr16,x 
      002998                       3405 1$:	
      00A794 23 CC 97         [ 4] 3406 	call next_token 
      00A797 82 0A            [ 1] 3407 	cp a,#TK_COMMA 
      00A799 62 72            [ 1] 3408 	jreq 2$ 
      00A79B 65 61            [ 2] 3409 	jra 9$ ; no more data 
      00A79D 6B 20 70         [ 4] 3410 2$:	call next_token 
      00A7A0 6F 69            [ 1] 3411 	cp a,#TK_CHAR 
      00A7A2 6E 74            [ 1] 3412 	jreq 4$ 
      00A7A4 2C 20            [ 1] 3413 	cp a,#TK_QSTR
      00A7A6 52 55            [ 1] 3414 	jreq 6$
      0029AC                       3415 	_unget_token 
      00A7A8 4E 20 74 6F 20   [ 1]    1      mov in,in.saved  
      00A7AD 72 65 73         [ 4] 3416 	call expression
      00A7B0 75 6D            [ 1] 3417 	cp a,#TK_INTGR
      00A7B2 65 2E            [ 1] 3418 	jreq 3$
      00A7B4 0A 00 57         [ 2] 3419 	jp syntax_error
      00A7B6                       3420 3$:	_xpop 
      00A7B6 72 01            [ 1]    1     ld a,(y)
      00A7B8 00               [ 1]    2     ldw x,y 
      00A7B9 23 01            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A7BB 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A7BC 9F               [ 1] 3421 	ld a,xl 
      00A7BC CD               [ 1] 3422 	clrw x 
      00A7BD 94 F1 81         [ 4] 3423 	call write_byte
      00A7C0 20 CD            [ 2] 3424 	jra 1$ 
      0029CB                       3425 4$: ; write character 
      00A7C0 CD               [ 1] 3426 	ld a,(x)
      00A7C1 98 6D CD A5      [ 1] 3427 	inc in 
      00A7C5 20               [ 1] 3428 	clrw x 
      00A7C6 26 4A CD         [ 4] 3429 	call write_byte 
      00A7C9 87 57            [ 2] 3430 	jra 1$ 
      0029D6                       3431 6$: ; write string 
      00A7CB 72               [ 2] 3432 	pushw x 
      00A7CC 5F               [ 1] 3433 	ld a,(x)
      00A7CD 00 19 52 06      [ 1] 3434 	inc in 
      00A7D1 1D               [ 1] 3435 	clrw x 
      00A7D2 00 04 1F         [ 4] 3436 	call write_byte 
      00A7D5 01               [ 2] 3437 	popw x 
      00A7D6 EE               [ 1] 3438 	ld a,(x)
      00A7D7 02 1F            [ 1] 3439 	jreq 1$
      00A7D9 03               [ 1] 3440 	incw x 
      00A7DA A6 80            [ 2] 3441 	jra 6$ 	
      0029E7                       3442 9$:
      00A7DC 62               [ 4] 3443 	ret 
                                   3444 
                                   3445 
                                   3446 ;---------------------
                                   3447 ;BASIC: CHAR(expr)
                                   3448 ; évaluate expression 
                                   3449 ; and take the 7 least 
                                   3450 ; bits as ASCII character
                                   3451 ; output: 
                                   3452 ; 	A char 
                                   3453 ;---------------------
      0029E8                       3454 func_char:
      00A7DD 4D 27 01         [ 4] 3455 	call func_args 
      00A7E0 5C 1F            [ 1] 3456 	cp a,#1
      00A7E2 05 1E            [ 1] 3457 	jreq 1$
      00A7E4 01 CF 00         [ 2] 3458 	jp syntax_error
      0029F2                       3459 1$:	_xpop
      00A7E7 1A CD            [ 1]    1     ld a,(y)
      00A7E9 87               [ 1]    2     ldw x,y 
      00A7EA D5 AE            [ 2]    3     ldw x,(1,x)
      00A7EC 00 80 CD 88      [ 2]    4     addw y,#CELL_SIZE 
      00A7F0 D0               [ 1] 3460 	ld a,xl
      00A7F1 1E 05            [ 1] 3461 	and a,#0x7f 
      00A7F3 5A               [ 4] 3462 	ret
                                   3463 
                                   3464 ;---------------------
                                   3465 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3466 ; extract first character 
                                   3467 ; of string argument 
                                   3468 ; output:
                                   3469 ;    A:X    int24 
                                   3470 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      0029FF                       3471 ascii:
      00A7F4 1F 05            [ 1] 3472 	ld a,#TK_LPAREN
      00A7F6 26 F0 1E         [ 4] 3473 	call expect 
      00A7F9 01 CF 00         [ 4] 3474 	call next_token 
      00A7FC 1A A6            [ 1] 3475 	cp a,#TK_QSTR 
      00A7FE 58 5F            [ 1] 3476 	jreq 1$
      00A800 CD 87            [ 1] 3477 	cp a,#TK_CHAR 
      00A802 FB CD            [ 1] 3478 	jreq 2$ 
      00A804 87 FB            [ 1] 3479 	cp a,#TK_CFUNC 
      00A806 7B 03            [ 1] 3480 	jreq 0$
      00A808 CD 87 FB         [ 2] 3481 	jp syntax_error
      002A16                       3482 0$: ; cfunc 
      00A80B 7B               [ 4] 3483 	call (x)
      00A80C 04 CD            [ 2] 3484 	jra 3$
      002A19                       3485 1$: ; quoted string 
      00A80E 87               [ 1] 3486 	ld a,(x)
      00A80F FB               [ 1] 3487 	push a  
      00A810 5B 06 D4         [ 4] 3488 	call skip_string
      00A812 84               [ 1] 3489 	pop a  	
      00A812 81 03            [ 2] 3490 	jra 3$ 
      00A813                       3491 2$: ; character 
      00A813 72 01 00         [ 4] 3492 	call get_char 
      00A816 23               [ 1] 3493 3$:	clrw x 
      00A817 05               [ 1] 3494 	rlwa x   
      002A26                       3495 4$:	_xpush  
      00A818 A6 07 CC 96      [ 2]    1     subw y,#CELL_SIZE
      00A81C D9 F7            [ 1]    2     ld (y),a 
      00A81D 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A81D 72 5F            [ 1] 3496 	ld a,#TK_RPAREN 
      00A81F 00 19 CD         [ 4] 3497 	call expect
      002A34                       3498 9$:	
      002A34                       3499 	_xpop  
      00A822 98 3B            [ 1]    1     ld a,(y)
      00A824 A1               [ 1]    2     ldw x,y 
      00A825 84 27            [ 2]    3     ldw x,(1,x)
      00A827 98 52 03 A1      [ 2]    4     addw y,#CELL_SIZE 
      00A82B 04               [ 4] 3500 	ret 
                                   3501 
                                   3502 ;---------------------
                                   3503 ;BASIC: KEY
                                   3504 ; wait for a character 
                                   3505 ; received from STDIN 
                                   3506 ; input:
                                   3507 ;	none 
                                   3508 ; output:
                                   3509 ;	a	 character 
                                   3510 ;---------------------
      002A3E                       3511 key:
      00A82C 27 03 CC         [ 4] 3512 	call getc 
      00A82F 96               [ 4] 3513 	ret
                                   3514 
                                   3515 ;----------------------
                                   3516 ; BASIC: QKEY
                                   3517 ; Return true if there 
                                   3518 ; is a character in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3519 ; waiting in STDIN 
                                   3520 ; input:
                                   3521 ;  none 
                                   3522 ; output:
                                   3523 ;   A     0|-1
                                   3524 ;-----------------------
      002A42                       3525 qkey:: 
      00A830 D7               [ 1] 3526 	clrw x 
      00A831 CD 98 7D         [ 1] 3527 	ld a,rx1_head
      00A834 A4 DF A1         [ 1] 3528 	sub a,rx1_tail 
      00A837 45 26            [ 1] 3529 	jreq 9$ 
      00A839 0C               [ 2] 3530 	cplw x
      00A83A AE 40            [ 1] 3531 	ld a,#255    
      002A4E                       3532 9$: 
      00A83C 00               [ 4] 3533 	ret 
                                   3534 
                                   3535 ;---------------------
                                   3536 ; BASIC: GPIO(port,reg)
                                   3537 ; return gpio register address 
                                   3538 ; expr {PORTA..PORTI}
                                   3539 ; input:
                                   3540 ;   none 
                                   3541 ; output:
                                   3542 ;   A:X 	gpio register address
                                   3543 ;----------------------------
                                   3544 ;	N=PORT
                                   3545 ;	T=REG 
      002A4F                       3546 gpio:
      00A83D CF 00 1A         [ 4] 3547 	call func_args 
      00A840 AE 47            [ 1] 3548 	cp a,#2
      00A842 FF 4F            [ 1] 3549 	jreq 1$
      00A844 20 15 A1         [ 2] 3550 	jp syntax_error  
      002A59                       3551 1$:	_at_next 
      00A847 46 27 06         [ 1]    1     ld a,(3,y)
      00A84A AE               [ 1]    2     ldw x,y 
      00A84B 95 DF            [ 2]    3     ldw x,(4,x)
      00A84D CC 96 D9         [ 2] 3552 	cpw x,#PA_BASE 
      00A850 2B 16            [ 1] 3553 	jrmi bad_port
      00A850 AE B7 80         [ 2] 3554 	cpw x,#PI_BASE+1 
      00A853 CF 00            [ 1] 3555 	jrpl bad_port
      00A855 1A               [ 2] 3556 	pushw x 
      002A6A                       3557 	_xpop
      00A856 A6 02            [ 1]    1     ld a,(y)
      00A858 AE               [ 1]    2     ldw x,y 
      00A859 7F FF            [ 2]    3     ldw x,(1,x)
      00A85B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A85B 6B 01 1F         [ 2] 3558 	addw x,(1,sp)
      002A76                       3559 	_drop 2 
      00A85E 02 CD            [ 2]    1     addw sp,#2 
      00A860 87               [ 1] 3560 	clr a 
      00A861 57               [ 4] 3561 	ret
      00A862                       3562 bad_port:
      00A862 CD 88            [ 1] 3563 	ld a,#ERR_BAD_VALUE
      00A864 DE 27 08         [ 2] 3564 	jp tb_error
                                   3565 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3566 
                                   3567 ;-------------------------
                                   3568 ; BASIC: UFLASH 
                                   3569 ; return free flash address
                                   3570 ; scan all block starting at 
                                   3571 ; app_space and return 
                                   3572 ; address of first free block 
                                   3573 ; below extended memory.  
                                   3574 ; return 0 if no free block 
                                   3575 ; input:
                                   3576 ;  none 
                                   3577 ; output:
                                   3578 ;	A:X		FLASH free address
                                   3579 ;---------------------------
      002A7F                       3580 uflash:
      00A867 A6 45 CD 89      [ 1] 3581 	clr farptr 
      00A86B 5E CD 87         [ 2] 3582 	ldw x,#app_space 
      00A86E D5               [ 2] 3583 	pushw x 
      00A86F AE 00 80         [ 2] 3584 1$:	ldw ptr16,x 
      00A872 CD 88 D0         [ 4] 3585 	call scan_block 
      00A875 7B 01            [ 1] 3586 	jreq 8$
      00A877 1E 02            [ 2] 3587 	ldw x,(1,sp)
      00A879 72 B0 00         [ 2] 3588 	addw x,#BLOCK_SIZE 
      00A87C 1A C2            [ 1] 3589 	jreq 7$ 
      00A87E 00 19            [ 2] 3590 	ldw (1,sp),x 
      00A880 22 E0            [ 2] 3591 	jra 1$ 
      002A9A                       3592 7$: ; no free block 
      00A882 CD 94            [ 1] 3593 	clr (1,sp) 
      00A884 F1 1E            [ 1] 3594 	clr (2,sp)
      00A886 02               [ 2] 3595 8$: popw x 
      00A887 A3               [ 1] 3596 	clr a 
      00A888 47               [ 4] 3597 	ret 
                                   3598 
                                   3599 
                                   3600 ;---------------------
                                   3601 ; BASIC: USR(addr,arg)
                                   3602 ; execute a function written 
                                   3603 ; in binary code.
                                   3604 ; input:
                                   3605 ;   addr	routine address 
                                   3606 ;   arg 	is an argument
                                   3607 ;           it can be ignore 
                                   3608 ;           by cally. 
                                   3609 ; output:
                                   3610 ;   xstack 	value returned by cally  
                                   3611 ;---------------------
      002AA1                       3612 usr:
      00A889 FF 26 03         [ 4] 3613 	call func_args 
      00A88C CD 9D            [ 1] 3614 	cp a,#2
      00A88E 73 03            [ 1] 3615 	jreq 1$  
      00A88F CC 16 57         [ 2] 3616 	jp syntax_error 
      002AAB                       3617 1$: 
      002AAB                       3618 	_at_next ; A:X addr 
      00A88F 5B 03 81         [ 1]    1     ld a,(3,y)
      00A892 93               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A892 89 FE            [ 2]    3     ldw x,(4,x)
      00A894 C3 A9 53         [ 2] 3619 	ldw ptr16,X 
      002AB4                       3620 	_xpop  ; arg 
      00A897 85 81            [ 1]    1     ld a,(y)
      00A899 93               [ 1]    2     ldw x,y 
      00A899 88 4D            [ 2]    3     ldw x,(1,x)
      00A89B 27 0A F6 5C      [ 2]    4     addw y,#CELL_SIZE 
      002ABD                       3621 	_store_top ; overwrite addr 
      00A89F 90 F7            [ 1]    1     ld (y),a 
      00A8A1 90 5C 0A         [ 2]    2     ldw (1,y),x     
      00A8A4 01 26 F6 84      [ 6] 3622     call [ptr16]
      00A8A8 81               [ 4] 3623 	ret 
                                   3624 
                                   3625 
                                   3626 ;------------------------------
                                   3627 ; BASIC: BYE 
                                   3628 ; halt mcu in its lowest power mode 
                                   3629 ; wait for reset or external interrupt
                                   3630 ; do a cold start on wakeup.
                                   3631 ;------------------------------
      00A8A9                       3632 bye:
      00A8A9 88 90 AE 16 E0   [ 2] 3633 	btjf UART1_SR,#UART_SR_TC,.
      00A8AE 90               [10] 3634 	halt
      00A8AF 89 A6 80         [ 2] 3635 	jp cold_start  
                                   3636 
                                   3637 ;----------------------------------
                                   3638 ; BASIC: SLEEP 
                                   3639 ; halt mcu until reset or external
                                   3640 ; interrupt.
                                   3641 ; Resume progam after SLEEP command
                                   3642 ;----------------------------------
      002AD0                       3643 sleep:
      00A8B2 90 7F 90 5C 4A   [ 2] 3644 	btjf UART1_SR,#UART_SR_TC,.
      00A8B7 26 F9 90 85      [ 1] 3645 	bset flags,#FSLEEP
      00A8BB 84               [10] 3646 	halt 
      00A8BC 81               [ 4] 3647 	ret 
                                   3648 
                                   3649 ;-------------------------------
                                   3650 ; BASIC: PAUSE expr 
                                   3651 ; suspend execution for n msec.
                                   3652 ; input:
                                   3653 ;	none
                                   3654 ; output:
                                   3655 ;	none 
                                   3656 ;------------------------------
      00A8BD                       3657 pause:
      00A8BD 89 90 89         [ 4] 3658 	call expression
      00A8C0 52 06            [ 1] 3659 	cp a,#TK_INTGR
      00A8C2 CD 9E            [ 1] 3660 	jreq 1$ 
      00A8C4 8D 26 09         [ 2] 3661 	jp syntax_error
      002AE5                       3662 1$: _xpop 
      00A8C7 AE A9            [ 1]    1     ld a,(y)
      00A8C9 86               [ 1]    2     ldw x,y 
      00A8CA CD 89            [ 2]    3     ldw x,(1,x)
      00A8CC BB CC A9 4D      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      002AEE                       3663 pause02:
      00A8D0 1F 05 CD         [ 2] 3664 	ldw timer,x 
      00A8D3 AA FF 72         [ 2] 3665 1$: ldw x,timer 
      00A8D6 5F               [ 2] 3666 	tnzw x 
      00A8D7 00 19            [ 1] 3667 	jreq 2$
      00A8D9 CF               [10] 3668 	wfi 
      00A8DA 00 1A            [ 1] 3669 	jrne 1$
      002AFA                       3670 2$:	
      00A8DC AE               [ 4] 3671 	ret 
                                   3672 
                                   3673 ;------------------------------
                                   3674 ; BASIC: AWU expr
                                   3675 ; halt mcu for 'expr' milliseconds
                                   3676 ; use Auto wakeup peripheral
                                   3677 ; all oscillators stopped except LSI
                                   3678 ; range: 1ms - 511ms
                                   3679 ; input:
                                   3680 ;  none
                                   3681 ; output:
                                   3682 ;  none:
                                   3683 ;------------------------------
      002AFB                       3684 awu:
      00A8DD FF FF 72         [ 4] 3685   call expression
      00A8E0 B0 00            [ 1] 3686   cp a,#TK_INTGR
      00A8E2 1A 1D            [ 1] 3687   jreq 1$
      00A8E4 00 04 13         [ 2] 3688   jp syntax_error
      002B05                       3689 1$: _xpop 
      00A8E7 05 24            [ 1]    1     ld a,(y)
      00A8E9 09               [ 1]    2     ldw x,y 
      00A8EA AE A9            [ 2]    3     ldw x,(1,x)
      00A8EC 57 CD 89 BB      [ 2]    4     addw y,#CELL_SIZE 
      002B0E                       3690 awu02:
      00A8F0 CC A9 4D         [ 2] 3691   cpw x,#5120
      00A8F3 2B 0C            [ 1] 3692   jrmi 1$ 
      00A8F3 CD 87 97 0F      [ 1] 3693   mov AWU_TBR,#15 
      00A8F7 03 CD            [ 1] 3694   ld a,#30
      00A8F9 A8               [ 2] 3695   div x,a
      00A8FA A9 CE            [ 1] 3696   ld a,#16
      00A8FC A9               [ 2] 3697   div x,a 
      00A8FD 53 90            [ 2] 3698   jra 4$
      002B1F                       3699 1$: 
      00A8FF FF 72 A9         [ 2] 3700   cpw x,#2048
      00A902 00 02            [ 1] 3701   jrmi 2$ 
      00A904 1E 05 90 FF      [ 1] 3702   mov AWU_TBR,#14
      00A908 72 A9            [ 1] 3703   ld a,#80
      00A90A 00               [ 2] 3704   div x,a 
      00A90B 02 A6            [ 2] 3705   jra 4$   
      002B2D                       3706 2$:
      00A90D 7C A3 00 7C      [ 1] 3707   mov AWU_TBR,#7
      002B31                       3708 3$:  
                                   3709 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A911 22 01 9F         [ 2] 3710   cpw x,#64 
      00A914 6B 04            [ 2] 3711   jrule 4$ 
      00A916 CE 00 1C 1F      [ 1] 3712   inc AWU_TBR 
      00A91A 01               [ 2] 3713   srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A91B 20 F4            [ 2] 3714   jra 3$ 
      002B3D                       3715 4$:
      00A91B 1E               [ 1] 3716   ld a, xl
      00A91C 01               [ 1] 3717   dec a 
      00A91D 7B 04            [ 1] 3718   jreq 5$
      00A91F CD               [ 1] 3719   dec a 	
      002B42                       3720 5$: 
      00A920 A8 99            [ 1] 3721   and a,#0x3e 
      00A922 1F 01 AE         [ 1] 3722   ld AWU_APR,a 
      00A925 16 E0 CD 87      [ 1] 3723   bset AWU_CSR,#AWU_CSR_AWUEN
      00A929 B1               [10] 3724   halt 
                                   3725 
      00A92A AE               [ 4] 3726   ret 
                                   3727 
                                   3728 ;------------------------------
                                   3729 ; BASIC: TICKS
                                   3730 ; return msec ticks counter value 
                                   3731 ; input:
                                   3732 ; 	none 
                                   3733 ; output:
                                   3734 ;	X 		TK_INTGR
                                   3735 ;-------------------------------
      002B4D                       3736 get_ticks:
      00A92B 00 80 CD         [ 1] 3737 	ld a,ticks 
      00A92E 88 D0 1E         [ 2] 3738 	ldw x,ticks+1 
      00A931 01               [ 4] 3739 	ret 
                                   3740 
                                   3741 ;------------------------------
                                   3742 ; BASIC: ABS(expr)
                                   3743 ; return absolute value of expr.
                                   3744 ; input:
                                   3745 ;   none
                                   3746 ; output:
                                   3747 ;   xstack    positive int24 
                                   3748 ;-------------------------------
      002B54                       3749 abs:
      00A932 C3 00 1E         [ 4] 3750 	call func_args 
      00A935 24 16            [ 1] 3751 	cp a,#1 
      00A937 1E 05            [ 1] 3752 	jreq 0$ 
      00A939 72 F0 03         [ 2] 3753 	jp syntax_error
      002B5E                       3754 0$:  
      00A93C 1F 05 A6         [ 4] 3755 	call abs24 
      002B61                       3756 	_xpop 
      00A93F 80 A3            [ 1]    1     ld a,(y)
      00A941 00               [ 1]    2     ldw x,y 
      00A942 80 24            [ 2]    3     ldw x,(1,x)
      00A944 01 9F 6B 04      [ 2]    4     addw y,#CELL_SIZE 
      00A948 CD               [ 4] 3757 	ret 
                                   3758 
                                   3759 ;------------------------------
                                   3760 ; BASIC: LSHIFT(expr1,expr2)
                                   3761 ; logical shift left expr1 by 
                                   3762 ; expr2 bits 
                                   3763 ; output:
                                   3764 ; 	A:x 	result 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3765 ;------------------------------
      002B6B                       3766 lshift:
      00A949 A8 A9 20         [ 4] 3767 	call func_args
      00A94C CE 5B            [ 1] 3768 	cp a,#2 
      00A94E 06 90            [ 1] 3769 	jreq 1$
      00A950 85 85 81         [ 2] 3770 	jp syntax_error
      002B75                       3771 1$: _xpop 
      00A953 54 42            [ 1]    1     ld a,(y)
      00A955 58               [ 1]    2     ldw x,y 
      00A956 58 43            [ 2]    3     ldw x,(1,x)
      00A958 61 6E 27 74      [ 2]    4     addw y,#CELL_SIZE 
      00A95C 20               [ 1] 3772 	ld a,xl 
      00A95D 73               [ 1] 3773 	push a      
      002B80                       3774 	_xpop  ; T>A:X 
      00A95E 61 76            [ 1]    1     ld a,(y)
      00A960 65               [ 1]    2     ldw x,y 
      00A961 20 61            [ 2]    3     ldw x,(1,x)
      00A963 70 70 6C 69      [ 2]    4     addw y,#CELL_SIZE 
      00A967 63 61            [ 1] 3775 	tnz (1,sp) 
      00A969 74 69            [ 1] 3776 	jreq 4$
      00A96B 6F               [ 1] 3777 2$:	rcf 
      00A96C 6E               [ 2] 3778 	rlcw x 
      00A96D 2C               [ 1] 3779 	rlc a 
      00A96E 20 6E            [ 1] 3780 	dec (1,sp) 
      00A970 6F 74            [ 1] 3781 	jrne 2$
      002B94                       3782 4$: _drop 1 
      00A972 20 65            [ 2]    1     addw sp,#1 
      00A974 6E               [ 4] 3783 	ret
                                   3784 
                                   3785 ;------------------------------
                                   3786 ; BASIC: RSHIFT(expr1,expr2)
                                   3787 ; logical shift right expr1 by 
                                   3788 ; expr2 bits.
                                   3789 ; output:
                                   3790 ; 	A 		TK_INTGR
                                   3791 ;   X 		result 
                                   3792 ;------------------------------
      002B97                       3793 rshift:
      00A975 6F 75 67         [ 4] 3794 	call func_args
      00A978 68 20            [ 1] 3795 	cp a,#2 
      00A97A 66 72            [ 1] 3796 	jreq 1$
      00A97C 65 65 20         [ 2] 3797 	jp syntax_error
      002BA1                       3798 1$: _xpop ; T>A:X
      00A97F 46 4C            [ 1]    1     ld a,(y)
      00A981 41               [ 1]    2     ldw x,y 
      00A982 53 48            [ 2]    3     ldw x,(1,x)
      00A984 0A 00 4E 6F      [ 2]    4     addw y,#CELL_SIZE 
      00A988 20               [ 1] 3799     ld a,xl 
      00A989 61               [ 1] 3800 	push a    
      002BAC                       3801 	_xpop  
      00A98A 70 70            [ 1]    1     ld a,(y)
      00A98C 6C               [ 1]    2     ldw x,y 
      00A98D 69 63            [ 2]    3     ldw x,(1,x)
      00A98F 61 74 69 6F      [ 2]    4     addw y,#CELL_SIZE 
      00A993 6E 20            [ 1] 3802 	tnz (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A995 69 6E            [ 1] 3803 	jreq 4$
      00A997 20               [ 1] 3804 2$:	rcf 
      00A998 52               [ 1] 3805 	rrc a 
      00A999 41               [ 2] 3806 	rrcw x 
      00A99A 4D 00            [ 1] 3807 	dec (1,sp) 
      00A99C 26 F9            [ 1] 3808 	jrne 2$
      002BC0                       3809 4$: _drop 1 
      00A99C 89 FE            [ 2]    1     addw sp,#1 
      00A99E C3               [ 4] 3810 	ret
                                   3811 
                                   3812 ;--------------------------
                                   3813 ; BASIC: FCPU integer
                                   3814 ; set CPU frequency 
                                   3815 ;-------------------------- 
                                   3816 
      002BC3                       3817 fcpu:
      00A99F A9 55            [ 1] 3818 	ld a,#TK_INTGR
      00A9A1 85 81 71         [ 4] 3819 	call expect 
      00A9A3 CD 17 ED         [ 4] 3820 	call get_int24 
      00A9A3 AE               [ 1] 3821 	ld a,xl 
      00A9A4 B7 80            [ 1] 3822 	and a,#7 
      00A9A6 89 50 C6         [ 1] 3823 	ld CLK_CKDIVR,a 
      00A9A7 81               [ 4] 3824 	ret 
                                   3825 
                                   3826 ;------------------------------
                                   3827 ; BASIC: PMODE pin#, mode 
                                   3828 ; Arduino pin. 
                                   3829 ; define pin as input or output
                                   3830 ; pin#: {0..15}
                                   3831 ; mode: INPUT|OUTPUT  
                                   3832 ;------------------------------
                           000001  3833 	PINNO=1
                           000001  3834 	VSIZE=1
      002BD2                       3835 pin_mode:
      002BD2                       3836 	_vars VSIZE 
      00A9A7 CD A8            [ 2]    1     sub sp,#VSIZE 
      00A9A9 92 26 4B         [ 4] 3837 	call arg_list 
      00A9AC 1C 00            [ 1] 3838 	cp a,#2 
      00A9AE 04 35            [ 1] 3839 	jreq 1$
      00A9B0 10 00 0B         [ 2] 3840 	jp syntax_error 
      002BDE                       3841 1$: _xpop 
      00A9B3 CD 98            [ 1]    1     ld a,(y)
      00A9B5 83               [ 1]    2     ldw x,y 
      00A9B6 A6 20            [ 2]    3     ldw x,(1,x)
      00A9B8 CD 89 5E 1E      [ 2]    4     addw y,#CELL_SIZE 
      00A9BC 01 EE 02         [ 2] 3842 	ldw ptr16,x ; mode 
      002BEA                       3843 	_xpop ; Dx pin 
      00A9BF 35 0A            [ 1]    1     ld a,(y)
      00A9C1 00               [ 1]    2     ldw x,y 
      00A9C2 0B CD            [ 2]    3     ldw x,(1,x)
      00A9C4 98 83 AE 9E      [ 2]    4     addw y,#CELL_SIZE 
      00A9C8 F7 CD 89         [ 4] 3844 	call select_pin 
      00A9CB BB A6            [ 1] 3845 	ld (PINNO,sp),a  
      00A9CD 2C CD            [ 1] 3846 	ld a,#1 
      00A9CF 89 5E            [ 1] 3847 	tnz (PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A9D1 1E 01            [ 1] 3848 	jreq 4$
      00A9D3 1C               [ 1] 3849 2$:	sll a 
      00A9D4 00 0A            [ 1] 3850 	dec (PINNO,sp)
      00A9D6 CD 89            [ 1] 3851 	jrne 2$ 
      00A9D8 BB A6            [ 1] 3852 	ld (PINNO,sp),a
      00A9DA 0D CD            [ 1] 3853 	ld a,(PINNO,sp)
      00A9DC 89 5E            [ 1] 3854 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A9DE 1E 01            [ 1] 3855 	ld (GPIO_CR1,x),a 
      00A9E0 CF 00            [ 1] 3856 4$:	ld a,#OUTP
      00A9E2 0E EE 02         [ 1] 3857 	cp a,acc8 
      00A9E5 72 BB            [ 1] 3858 	jreq 6$
                                   3859 ; input mode
                                   3860 ; disable external interrupt 
      00A9E7 00 0E            [ 1] 3861 	ld a,(PINNO,sp)
      00A9E9 1C               [ 1] 3862 	cpl a 
      00A9EA 00 04            [ 1] 3863 	and a,(GPIO_CR2,x)
      00A9EC 1C 00            [ 1] 3864 	ld (GPIO_CR2,x),a 
                                   3865 ;clear bit in DDR for input mode 
      00A9EE 7F 9F            [ 1] 3866 	ld a,(PINNO,sp)
      00A9F0 A4               [ 1] 3867 	cpl a 
      00A9F1 80 97            [ 1] 3868 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A9F3 1F 01            [ 1] 3869 	ld (GPIO_DDR,x),a 
      00A9F5 20 B0            [ 2] 3870 	jra 9$
      00A9F7                       3871 6$: ;output mode  
      00A9F7 CD A9            [ 1] 3872 	ld a,(PINNO,sp)
      00A9F9 9C 27            [ 1] 3873 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A9FB E4 02            [ 1] 3874 	ld (GPIO_DDR,x),a 
      00A9FC 7B 01            [ 1] 3875 	ld a,(PINNO,sp)
      00A9FC 5B 02            [ 1] 3876 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A9FE 81 04            [ 1] 3877 	ld (GPIO_CR2,x),a 
      00A9FF                       3878 9$:	
      002C2E                       3879 	_drop VSIZE 
      00A9FF CD 9B            [ 2]    1     addw sp,#VSIZE 
      00AA01 47               [ 4] 3880 	ret
                                   3881 
                                   3882 ;------------------------
                                   3883 ; select Arduino pin 
                                   3884 ; input:
                                   3885 ;   X 	 {0..15} Arduino Dx 
                                   3886 ; output:
                                   3887 ;   A     stm8s208 pin 
                                   3888 ;   X     base address s208 GPIO port 
                                   3889 ;---------------------------
      002C31                       3890 select_pin:
      00AA02 A1               [ 2] 3891 	sllw x 
      00AA03 84 27 03         [ 2] 3892 	addw x,#arduino_to_8s208 
      00AA06 CC               [ 2] 3893 	ldw x,(x)
      00AA07 96               [ 1] 3894 	ld a,xl 
      00AA08 D7               [ 1] 3895 	push a 
      00AA09 90               [ 1] 3896 	swapw x 
      00AA0A F6 93            [ 1] 3897 	ld a,#5 
      00AA0C EE               [ 4] 3898 	mul x,a 
      00AA0D 01 72 A9         [ 2] 3899 	addw x,#GPIO_BASE 
      00AA10 00               [ 1] 3900 	pop a 
      00AA11 03               [ 4] 3901 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3902 ; translation from Arduino D0..D15 to stm8s208rb 
      002C41                       3903 arduino_to_8s208:
      00AA12 C7 00                 3904 .byte 3,6 ; D0 
      00AA14 19 CF                 3905 .byte 3,5 ; D1 
      00AA16 00 1A                 3906 .byte 4,0 ; D2 
      00AA18 02 01                 3907 .byte 2,1 ; D3
      00AA18 CD 98                 3908 .byte 6,0 ; D4
      00AA1A 3B A1                 3909 .byte 2,2 ; D5
      00AA1C 08 27                 3910 .byte 2,3 ; D6
      00AA1E 02 20                 3911 .byte 3,1 ; D7
      00AA20 46 CD                 3912 .byte 3,3 ; D8
      00AA22 98 3B                 3913 .byte 2,4 ; D9
      00AA24 A1 04                 3914 .byte 4,5 ; D10
      00AA26 27 23                 3915 .byte 2,6 ; D11
      00AA28 A1 02                 3916 .byte 2,7 ; D12
      00AA2A 27 2A                 3917 .byte 2,5 ; D13
      00AA2C 55 00                 3918 .byte 4,2 ; D14
      00AA2E 03 00                 3919 .byte 4,1 ; D15
                                   3920 
                                   3921 
                                   3922 ;------------------------------
                                   3923 ; BASIC: RND(expr)
                                   3924 ; return random number 
                                   3925 ; between 1 and expr inclusive
                                   3926 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3927 ; input:
                                   3928 ; 	none 
                                   3929 ; output:
                                   3930 ;	xstack 	random positive integer 
                                   3931 ;------------------------------
      002C61                       3932 random:
      00AA30 02 CD 9B         [ 4] 3933 	call func_args 
      00AA33 47 A1            [ 1] 3934 	cp a,#1
      00AA35 84 27            [ 1] 3935 	jreq 1$
      00AA37 03 CC 96         [ 2] 3936 	jp syntax_error
      002C6B                       3937 1$:  
      002C6B                       3938 	_xpop   
      00AA3A D7 90            [ 1]    1     ld a,(y)
      00AA3C F6               [ 1]    2     ldw x,y 
      00AA3D 93 EE            [ 2]    3     ldw x,(1,x)
      00AA3F 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00AA43 03               [ 2] 3939 	pushw x 
      00AA44 9F               [ 1] 3940 	push a  
      00AA45 5F CD            [ 1] 3941 	ld a,#0x80 
      00AA47 87 FB            [ 1] 3942 	bcp a,(1,sp)
      00AA49 20 CD            [ 1] 3943 	jreq 2$
      00AA4B A6 0A            [ 1] 3944 	ld a,#ERR_BAD_VALUE
      00AA4B F6 72 5C         [ 2] 3945 	jp tb_error
      002C81                       3946 2$: 
                                   3947 ; acc16=(x<<5)^x 
      00AA4E 00 02 5F         [ 2] 3948 	ldw x,seedx 
      00AA51 CD               [ 2] 3949 	sllw x 
      00AA52 87               [ 2] 3950 	sllw x 
      00AA53 FB               [ 2] 3951 	sllw x 
      00AA54 20               [ 2] 3952 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00AA55 C2               [ 2] 3953 	sllw x 
      00AA56 9E               [ 1] 3954 	ld a,xh 
      00AA56 89 F6 72         [ 1] 3955 	xor a,seedx 
      00AA59 5C 00 02         [ 1] 3956 	ld acc16,a 
      00AA5C 5F               [ 1] 3957 	ld a,xl 
      00AA5D CD 87 FB         [ 1] 3958 	xor a,seedx+1 
      00AA60 85 F6 27         [ 1] 3959 	ld acc8,a 
                                   3960 ; seedx=seedy 
      00AA63 B4 5C 20         [ 2] 3961 	ldw x,seedy 
      00AA66 EF 00 14         [ 2] 3962 	ldw seedx,x  
                                   3963 ; seedy=seedy^(seedy>>1)
      00AA67 CE 00 16         [ 2] 3964 	ldw x,seedy 
      00AA67 81               [ 2] 3965 	srlw x 
      00AA68 9E               [ 1] 3966 	ld a,xh 
      00AA68 CD 99 FE         [ 1] 3967 	xor a,seedy 
      00AA6B A1 01 27         [ 1] 3968 	ld seedy,a  
      00AA6E 03               [ 1] 3969 	ld a,xl 
      00AA6F CC 96 D7         [ 1] 3970 	xor a,seedy+1 
      00AA72 90 F6 93         [ 1] 3971 	ld seedy+1,a 
                                   3972 ; acc16>>3 
      00AA75 EE 01 72         [ 2] 3973 	ldw x,acc16 
      00AA78 A9               [ 2] 3974 	srlw x 
      00AA79 00               [ 2] 3975 	srlw x 
      00AA7A 03               [ 2] 3976 	srlw x 
                                   3977 ; x=acc16^x 
      00AA7B 9F               [ 1] 3978 	ld a,xh 
      00AA7C A4 7F 81         [ 1] 3979 	xor a,acc16 
      00AA7F C7 00 0D         [ 1] 3980 	ld acc16,a 
      00AA7F A6               [ 1] 3981 	ld a,xl 
      00AA80 06 CD 99         [ 1] 3982 	xor a,acc8 
      00AA83 F1 CD 98         [ 1] 3983 	ld acc8,a 
                                   3984 ; seedy=acc16^seedy 
      00AA86 3B A1 02         [ 1] 3985 	xor a,seedy+1
      00AA89 27               [ 1] 3986 	ld xl,a 
      00AA8A 0E A1 04         [ 1] 3987 	ld a,acc16 
      00AA8D 27 12 A1         [ 1] 3988 	xor a,seedy
      00AA90 82               [ 1] 3989 	ld xh,a 
      00AA91 27 03 CC         [ 2] 3990 	ldw seedy,x 
                                   3991 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00AA94 96 D7 15         [ 1] 3992 	ld a,seedx+1
      00AA96 A4 7F            [ 1] 3993 	and a,#127
      002CD6                       3994 	_xpush 
      00AA96 FD 20 0B 03      [ 2]    1     subw y,#CELL_SIZE
      00AA99 90 F7            [ 1]    2     ld (y),a 
      00AA99 F6 88 CD         [ 2]    3     ldw (1,y),x 
      00AA9C 98               [ 1] 3995 	pop a 
      00AA9D 54               [ 2] 3996 	popw x 
      002CE1                       3997 	_xpush 
      00AA9E 84 20 03 03      [ 2]    1     subw y,#CELL_SIZE
      00AAA1 90 F7            [ 1]    2     ld (y),a 
      00AAA1 CD 98 7D         [ 2]    3     ldw (1,y),x 
      00AAA4 5F 02 72         [ 4] 3998 	call mod24 
      002CED                       3999 	_xpop
      00AAA7 A2 00            [ 1]    1     ld a,(y)
      00AAA9 03               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00AAAA 90 F7            [ 2]    3     ldw x,(1,x)
      00AAAC 90 EF 01 A6      [ 2]    4     addw y,#CELL_SIZE 
      00AAB0 07 CD 99         [ 2] 4000 	addw x,#1 
      00AAB3 F1 00            [ 1] 4001 	adc a,#0  
      00AAB4 81               [ 4] 4002 	ret 
                                   4003 
                                   4004 ;---------------------------------
                                   4005 ; BASIC: WORDS 
                                   4006 ; affiche la listes des mots du
                                   4007 ; dictionnaire ainsi que le nombre
                                   4008 ; de mots.
                                   4009 ;---------------------------------
                           000001  4010 	WLEN=1 ; word length
                           000002  4011 	LLEN=2 ; character sent to console
                           000003  4012 	WCNT=3 ; count words printed 
                           000003  4013 	VSIZE=3 
      002CFC                       4014 words:
      00AAB4 90 F6            [ 2] 4015 	pushw y
      002CFE                       4016 	_vars VSIZE
      00AAB6 93 EE            [ 2]    1     sub sp,#VSIZE 
      00AAB8 01 72            [ 1] 4017 	clr (LLEN,sp)
      00AABA A9 00            [ 1] 4018 	clr (WCNT,sp)
      00AABC 03 81 34 D9      [ 2] 4019 	ldw y,#kword_dict+2
      00AABE 93               [ 1] 4020 0$:	ldw x,y
      00AABE CD               [ 1] 4021 	ld a,(x)
      00AABF 89 6E            [ 1] 4022 	and a,#15 
      00AAC1 81 01            [ 1] 4023 	ld (WLEN,sp),a 
      00AAC2 0C 03            [ 1] 4024 	inc (WCNT,sp)
      00AAC2 5F               [ 1] 4025 1$:	incw x 
      00AAC3 C6               [ 1] 4026 	ld a,(x)
      00AAC4 00 2F C0         [ 4] 4027 	call putc 
      00AAC7 00 30            [ 1] 4028 	inc (LLEN,sp)
      00AAC9 27 03            [ 1] 4029 	dec (WLEN,sp)
      00AACB 53 A6            [ 1] 4030 	jrne 1$
      00AACD FF 46            [ 1] 4031 	ld a,#70
      00AACE 11 02            [ 1] 4032 	cp a,(LLEN,sp)
      00AACE 81 09            [ 1] 4033 	jrmi 2$   
      00AACF A6 20            [ 1] 4034 	ld a,#SPACE 
      00AACF CD 99 FE         [ 4] 4035 	call putc 
      00AAD2 A1 02            [ 1] 4036 	inc (LLEN,sp) 
      00AAD4 27 03            [ 2] 4037 	jra 3$
      00AAD6 CC 96            [ 1] 4038 2$: ld a,#CR 
      00AAD8 D7 90 E6         [ 4] 4039 	call putc 
      00AADB 03 93            [ 1] 4040 	clr (LLEN,sp)
      00AADD EE 04 A3 50      [ 2] 4041 3$:	subw y,#2 
      00AAE1 00 2B            [ 2] 4042 	ldw y,(y)
      00AAE3 16 A3            [ 1] 4043 	jrne 0$ 
      00AAE5 50 29            [ 1] 4044 	ld a,#CR 
      00AAE7 2A 11 89         [ 4] 4045 	call putc  
      00AAEA 90               [ 1] 4046 	clrw x 
      00AAEB F6 93            [ 1] 4047 	ld a,(WCNT,sp)
      00AAED EE               [ 1] 4048 	ld xl,a 
      00AAEE 01 72 A9         [ 4] 4049 	call prt_i16 
      00AAF1 00 03 72         [ 2] 4050 	ldw x,#words_count_msg
      00AAF4 FB 01 5B         [ 4] 4051 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      002D4B                       4052 	_drop VSIZE 
      00AAF7 02 4F            [ 2]    1     addw sp,#VSIZE 
      00AAF9 81 85            [ 2] 4053 	popw y 
      00AAFA 81               [ 4] 4054 	ret 
      00AAFA A6 0A CC 96 D9 73 20  4055 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   4056 
                                   4057 
                                   4058 ;-----------------------------
                                   4059 ; BASIC: TIMER expr 
                                   4060 ; initialize count down timer 
                                   4061 ;-----------------------------
      00AAFF                       4062 set_timer:
      00AAFF 72 5F 00         [ 4] 4063 	call arg_list
      00AB02 19 AE            [ 1] 4064 	cp a,#1 
      00AB04 B7 80            [ 1] 4065 	jreq 1$
      00AB06 89 CF 00         [ 2] 4066 	jp syntax_error
      002D70                       4067 1$: 
      002D70                       4068 	_xpop  
      00AB09 1A CD            [ 1]    1     ld a,(y)
      00AB0B 88               [ 1]    2     ldw x,y 
      00AB0C DE 27            [ 2]    3     ldw x,(1,x)
      00AB0E 0F 1E 01 1C      [ 2]    4     addw y,#CELL_SIZE 
      00AB12 00 80 27         [ 2] 4069 	ldw timer,x 
      00AB15 04               [ 4] 4070 	ret 
                                   4071 
                                   4072 ;------------------------------
                                   4073 ; BASIC: TIMEOUT 
                                   4074 ; return state of timer 
                                   4075 ; output:
                                   4076 ;   A:X     0 not timeout 
                                   4077 ;   A:X     -1 timeout 
                                   4078 ;------------------------------
      002D7D                       4079 timeout:
      00AB16 1F               [ 1] 4080 	clr a 
      00AB17 01 20 ED         [ 2] 4081 	ldw x,timer 
      00AB1A 27 02            [ 1] 4082 	jreq 1$
      00AB1A 0F               [ 1] 4083 	clrw x
      00AB1B 01               [ 4] 4084 	ret  
      00AB1C 0F               [ 1] 4085 1$:	cpl a
      00AB1D 02               [ 2] 4086 	cplw x 
      00AB1E 85               [ 4] 4087 	ret 
                                   4088  	
                                   4089 
                                   4090 
                                   4091 
                                   4092 ;-----------------------------------
                                   4093 ; BASIC: IWDGEN expr1 
                                   4094 ; enable independant watchdog timer
                                   4095 ; expr1 is delay in multiple of 62.5µsec
                                   4096 ; expr1 -> {1..16383}
                                   4097 ;-----------------------------------
      002D88                       4098 enable_iwdg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00AB1F 4F 81 83         [ 4] 4099 	call arg_list
      00AB21 A1 01            [ 1] 4100 	cp a,#1 
      00AB21 CD 99            [ 1] 4101 	jreq 1$
      00AB23 FE A1 02         [ 2] 4102 	jp syntax_error 
      002D92                       4103 1$: _xpop  
      00AB26 27 03            [ 1]    1     ld a,(y)
      00AB28 CC               [ 1]    2     ldw x,y 
      00AB29 96 D7            [ 2]    3     ldw x,(1,x)
      00AB2B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AB2B 90 E6            [ 1] 4104 	push #0
      00AB2D 03 93 EE 04      [ 1] 4105 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00AB31 CF               [ 1] 4106 	ld a,xh 
      00AB32 00 1A            [ 1] 4107 	and a,#0x3f
      00AB34 90               [ 1] 4108 	ld xh,a  
      00AB35 F6 93 EE         [ 2] 4109 2$:	cpw x,#255
      00AB38 01 72            [ 2] 4110 	jrule 3$
      00AB3A A9 00            [ 1] 4111 	inc (1,sp)
      00AB3C 03               [ 1] 4112 	rcf 
      00AB3D 90               [ 2] 4113 	rrcw x 
      00AB3E F7 90            [ 2] 4114 	jra 2$
      00AB40 EF 01 72 CD      [ 1] 4115 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AB44 00               [ 1] 4116 	pop a  
      00AB45 1A 81 E1         [ 1] 4117 	ld IWDG_PR,a 
      00AB47 9F               [ 1] 4118 	ld a,xl
      00AB47 72               [ 1] 4119 	dec a 
      00AB48 0D 52 30 FB      [ 1] 4120 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AB4C 8E CC 81         [ 1] 4121 	ld IWDG_RLR,a 
      00AB4F 35 AA 50 E0      [ 1] 4122 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00AB50 81               [ 4] 4123 	ret 
                                   4124 
                                   4125 
                                   4126 ;-----------------------------------
                                   4127 ; BASIC: IWDGREF  
                                   4128 ; refresh independant watchdog count down 
                                   4129 ; timer before it reset MCU. 
                                   4130 ;-----------------------------------
      002DC6                       4131 refresh_iwdg:
      00AB50 72 0D 52 30      [ 1] 4132 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00AB54 FB               [ 4] 4133 	ret 
                                   4134 
                                   4135 
                                   4136 ;-------------------------------------
                                   4137 ; BASIC: LOG2(expr)
                                   4138 ; return logarithm base 2 of expr 
                                   4139 ; this is the position of most significant
                                   4140 ; bit set. 
                                   4141 ; input: 
                                   4142 ; output:
                                   4143 ;   A     TK_INTGR 
                                   4144 ;   xstack log2 
                                   4145 ;*********************************
      002DCB                       4146 log2:
      00AB55 72 16 00         [ 4] 4147 	call func_args 
      00AB58 23 8E            [ 1] 4148 	cp a,#1 
      00AB5A 81 03            [ 1] 4149 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00AB5B CC 16 57         [ 2] 4150 	jp syntax_error 
      002DD5                       4151 1$: 
      002DD5                       4152 	_xpop    
      00AB5B CD 9B            [ 1]    1     ld a,(y)
      00AB5D 47               [ 1]    2     ldw x,y 
      00AB5E A1 84            [ 2]    3     ldw x,(1,x)
      00AB60 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00AB64 D7               [ 1] 4153 	tnz a
      00AB65 90 F6            [ 1] 4154 	jrne 2$ 
      00AB67 93               [ 2] 4155 	tnzw x 
      00AB68 EE 01            [ 1] 4156 	jrne 2$
      00AB6A 72 A9            [ 1] 4157 	ld a,#ERR_BAD_VALUE
      00AB6C 00 03 59         [ 2] 4158 	jp tb_error 
      00AB6E 4B 18            [ 1] 4159 2$: push #24 
      00AB6E CF               [ 2] 4160 3$: rlcw x 
      00AB6F 00               [ 1] 4161     rlc a 
      00AB70 13 CE            [ 1] 4162 	jrc 4$
      00AB72 00 13            [ 1] 4163 	dec (1,sp) 
      00AB74 5D 27            [ 1] 4164 	jrne 3$
      00AB76 03               [ 1] 4165 4$: clrw x 
      00AB77 8F               [ 1] 4166     pop a 
      00AB78 26               [ 1] 4167 	dec a
      00AB79 F7               [ 1] 4168 	rlwa x  
      00AB7A                       4169 9$:	
      00AB7A 81               [ 4] 4170 	ret 
                                   4171 
                                   4172 ;-----------------------------------
                                   4173 ; BASIC: BIT(expr) 
                                   4174 ; expr ->{0..23}
                                   4175 ; return 2^expr 
                                   4176 ; output:
                                   4177 ;    A:X    2^expr 
                                   4178 ;-----------------------------------
      00AB7B                       4179 bitmask:
      00AB7B CD 9B 47         [ 4] 4180     call func_args 
      00AB7E A1 84            [ 1] 4181 	cp a,#1
      00AB80 27 03            [ 1] 4182 	jreq 1$
      00AB82 CC 96 D7         [ 2] 4183 	jp syntax_error 
      002E02                       4184 1$: _xpop 
      00AB85 90 F6            [ 1]    1     ld a,(y)
      00AB87 93               [ 1]    2     ldw x,y 
      00AB88 EE 01            [ 2]    3     ldw x,(1,x)
      00AB8A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AB8E 9F               [ 1] 4185 	ld a,xl 
      00AB8E A3 14 00         [ 2] 4186 	ldw x,#1 
      00AB91 2B 0C            [ 1] 4187 	and a,#23
      00AB93 35 0F            [ 1] 4188 	jreq 9$
      00AB95 50               [ 1] 4189 	push a 
      00AB96 F2               [ 1] 4190 	clr a 
      002E15                       4191 2$: 
      00AB97 A6               [ 2] 4192 	slaw x 
      00AB98 1E               [ 1] 4193 	rlc a 	
      00AB99 62 A6            [ 1] 4194 	dec (1,sp)
      00AB9B 10 62            [ 1] 4195 	jrne 2$ 
      002E1B                       4196 4$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      002E1B                       4197     _drop 1 
      00AB9D 20 1E            [ 2]    1     addw sp,#1 
      00AB9F 81               [ 4] 4198 9$:	ret 
                                   4199 
                                   4200 ;------------------------------
                                   4201 ; BASIC: DO 
                                   4202 ; initiate a DO ... UNTIL loop 
                                   4203 ;------------------------------
                           000003  4204 	DOLP_ADR=3 
                           000005  4205 	DOLP_INW=5
                           000004  4206 	VSIZE=4 
      002E1E                       4207 do_loop:
      00AB9F A3               [ 2] 4208 	popw x 
      002E1F                       4209 	_vars VSIZE 
      00ABA0 08 00            [ 2]    1     sub sp,#VSIZE 
      00ABA2 2B               [ 2] 4210 	pushw x 
      00ABA3 09 35 0E         [ 2] 4211 	ldw x,basicptr 
      00ABA6 50 F2            [ 2] 4212 	ldw (DOLP_ADR,sp),x
      00ABA8 A6 50 62         [ 2] 4213 	ldw x,in.w 
      00ABAB 20 10            [ 2] 4214 	ldw (DOLP_INW,sp),x
      00ABAD 72 5C 00 1F      [ 1] 4215 	inc loop_depth 
      00ABAD 35               [ 4] 4216 	ret 
                                   4217 
                                   4218 ;--------------------------------
                                   4219 ; BASIC: UNTIL expr 
                                   4220 ; loop if exprssion is false 
                                   4221 ; else terminate loop
                                   4222 ;--------------------------------
      002E31                       4223 until: 
      00ABAE 07 50 F2 1F      [ 1] 4224 	tnz loop_depth 
      00ABB1 26 03            [ 1] 4225 	jrne 1$ 
      00ABB1 A3 00 40         [ 2] 4226 	jp syntax_error 
      002E3A                       4227 1$: 
      00ABB4 23 07 72         [ 4] 4228 	call condition  
      002E3D                       4229 	_xpop 
      00ABB7 5C 50            [ 1]    1     ld a,(y)
      00ABB9 F2               [ 1]    2     ldw x,y 
      00ABBA 54 20            [ 2]    3     ldw x,(1,x)
      00ABBC F4 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00ABBD 4D               [ 1] 4230 	tnz a 
      00ABBD 9F 4A            [ 1] 4231 	jrne 9$ 
      00ABBF 27               [ 2] 4232 	tnzw x 
      00ABC0 01 4A            [ 1] 4233 	jrne 9$ 
      00ABC2 1E 03            [ 2] 4234 	ldw x,(DOLP_ADR,sp)
      00ABC2 A4 3E C7         [ 2] 4235 	ldw basicptr,x 
      00ABC5 50 F1            [ 1] 4236 	ld a,(2,x)
      00ABC7 72 18 50         [ 1] 4237 	ld count,a 
      00ABCA F0 8E            [ 2] 4238 	ldw x,(DOLP_INW,sp)
      00ABCC 81 00 00         [ 2] 4239 	ldw in.w,x 
      00ABCD 81               [ 4] 4240 	ret 
      002E5C                       4241 9$:	; remove loop data from stack  
      00ABCD C6               [ 2] 4242 	popw x
      002E5D                       4243 	_drop VSIZE
      00ABCE 00 10            [ 2]    1     addw sp,#VSIZE 
      00ABD0 CE 00 11 81      [ 1] 4244 	dec loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00ABD4 FC               [ 2] 4245 	jp (x)
                                   4246 
                                   4247 ;--------------------------
                                   4248 ; BASIC: PORTA...PORTI  
                                   4249 ;  return constant value 
                                   4250 ;  PORT  base address 
                                   4251 ;---------------------------
      002E64                       4252 const_porta:
      00ABD4 CD 99 FE         [ 2] 4253 	ldw x,#PA_BASE 
      00ABD7 A1               [ 1] 4254 	clr a 
      00ABD8 01               [ 4] 4255 	ret 
      002E69                       4256 const_portb:
      00ABD9 27 03 CC         [ 2] 4257 	ldw x,#PB_BASE 
      00ABDC 96               [ 1] 4258 	clr a 
      00ABDD D7               [ 4] 4259 	ret 
      00ABDE                       4260 const_portc:
      00ABDE CD 82 63         [ 2] 4261 	ldw x,#PC_BASE 
      00ABE1 90               [ 1] 4262 	clr a 
      00ABE2 F6               [ 4] 4263 	ret 
      002E73                       4264 const_portd:
      00ABE3 93 EE 01         [ 2] 4265 	ldw x,#PD_BASE 
      00ABE6 72               [ 1] 4266 	clr a 
      00ABE7 A9               [ 4] 4267 	ret 
      002E78                       4268 const_porte:
      00ABE8 00 03 81         [ 2] 4269 	ldw x,#PE_BASE 
      00ABEB 4F               [ 1] 4270 	clr a 
      00ABEB CD               [ 4] 4271 	ret 
      002E7D                       4272 const_portf:
      00ABEC 99 FE A1         [ 2] 4273 	ldw x,#PF_BASE 
      00ABEF 02               [ 1] 4274 	clr a 
      00ABF0 27               [ 4] 4275 	ret 
      002E82                       4276 const_portg:
      00ABF1 03 CC 96         [ 2] 4277 	ldw x,#PG_BASE 
      00ABF4 D7               [ 1] 4278 	clr a 
      00ABF5 90               [ 4] 4279 	ret 
      002E87                       4280 const_porti:
      00ABF6 F6 93 EE         [ 2] 4281 	ldw x,#PI_BASE 
      00ABF9 01               [ 1] 4282 	clr a 
      00ABFA 72               [ 4] 4283 	ret 
                                   4284 
                                   4285 ;-------------------------------
                                   4286 ; following return constant 
                                   4287 ; related to GPIO register offset 
                                   4288 ;---------------------------------
      002E8C                       4289 const_odr:
      00ABFB A9               [ 1] 4290 	clr a 
      00ABFC 00 03 9F         [ 2] 4291 	ldw x,#GPIO_ODR
      00ABFF 88               [ 4] 4292 	ret 
      002E91                       4293 const_idr:
      00AC00 90               [ 1] 4294 	clr a 
      00AC01 F6 93 EE         [ 2] 4295 	ldw x,#GPIO_IDR
      00AC04 01               [ 4] 4296 	ret 
      002E96                       4297 const_ddr:
      00AC05 72               [ 1] 4298 	clr a
      00AC06 A9 00 03         [ 2] 4299 	ldw x,#GPIO_DDR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00AC09 0D               [ 4] 4300 	ret 
      002E9B                       4301 const_cr1:
      00AC0A 01               [ 1] 4302 	clr a 
      00AC0B 27 07 98         [ 2] 4303 	ldw x,#GPIO_CR1
      00AC0E 59               [ 4] 4304 	ret 
      002EA0                       4305 const_cr2:
      00AC0F 49               [ 1] 4306 	clr a
      00AC10 0A 01 26         [ 2] 4307 	ldw x,#GPIO_CR2
      00AC13 F9               [ 4] 4308 	ret 
                                   4309 ;-------------------------
                                   4310 ; BASIC: POUT 
                                   4311 ;  constant for port mode
                                   4312 ;  used by PMODE 
                                   4313 ;  to set pin as output
                                   4314 ;------------------------
      002EA5                       4315 const_output:
      00AC14 5B               [ 1] 4316 	clr a 
      00AC15 01 81 01         [ 2] 4317 	ldw x,#OUTP
      00AC17 81               [ 4] 4318 	ret 
                                   4319 
                                   4320 ;-------------------------
                                   4321 ; BASIC: PINP 
                                   4322 ;  constant for port mode
                                   4323 ;  used by PMODE 
                                   4324 ;  to set pin as input
                                   4325 ;------------------------
      002EAA                       4326 const_input:
      00AC17 CD               [ 1] 4327 	clr a  
      00AC18 99 FE A1         [ 2] 4328 	ldw x,#INP 
      00AC1B 02               [ 4] 4329 	ret 
                                   4330 	
                                   4331 ;-----------------------
                                   4332 ; memory area constants
                                   4333 ;-----------------------
      002EAF                       4334 const_eeprom_base:
      00AC1C 27               [ 1] 4335 	clr a  
      00AC1D 03 CC 96         [ 2] 4336 	ldw x,#EEPROM_BASE 
      00AC20 D7               [ 4] 4337 	ret 
                                   4338 
                                   4339 ;---------------------------
                                   4340 ; BASIC: DATA 
                                   4341 ; when the interpreter find 
                                   4342 ; a DATA line it skip it.
                                   4343 ;---------------------------
      002EB4                       4344 data:
      00AC21 90 F6 93 EE 01   [ 1] 4345 	mov in,count 
      00AC26 72               [ 4] 4346 	ret 
                                   4347 
                                   4348 ;------------------------------
                                   4349 ; check if it is a DATA line 
                                   4350 ; input: 
                                   4351 ;    X    line address 
                                   4352 ; output:
                                   4353 ;    Z    set if DATA line 
                                   4354 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      002EBA                       4355 is_data_line:
      00AC27 A9               [ 2] 4356 	pushw x 
      00AC28 00 03            [ 1] 4357 	ld a,(3,x)
      00AC2A 9F 88            [ 1] 4358 	cp a,#TK_CMD 
      00AC2C 90 F6            [ 1] 4359 	jrne 9$
      00AC2E 93 EE            [ 2] 4360 	ldw x,(4,x)
      00AC30 01 72 A9         [ 2] 4361 	cpw x,#data  
      00AC33 00               [ 2] 4362 9$: popw x 
      00AC34 03               [ 4] 4363 	ret 
                                   4364 
                                   4365 ;---------------------------------
                                   4366 ; BASIC: RESTORE [line#]
                                   4367 ; set data_ptr to first data line
                                   4368 ; if no DATA found pointer set to
                                   4369 ; zero.
                                   4370 ; if a line# is given as argument 
                                   4371 ; a data line with that number 
                                   4372 ; is searched and the data pointer 
                                   4373 ; is set to it. If there is no 
                                   4374 ; data line with that number 
                                   4375 ; the program is interrupted. 
                                   4376 ;---------------------------------
      002EC8                       4377 restore:
      00AC35 0D               [ 1] 4378 	clrw x 
      00AC36 01 27 07         [ 2] 4379 	ldw data_ptr,x 
      00AC39 98 46 56         [ 2] 4380 	ldw data_ofs,x 
      00AC3C 0A 01 26         [ 2] 4381 	ldw x,txtbgn 
      00AC3F F9 5B 01         [ 4] 4382 	call next_token 
      00AC42 81 84            [ 1] 4383 	cp a,#TK_INTGR
      00AC43 26 10            [ 1] 4384 	jrne 0$
      00AC43 A6 84 CD         [ 4] 4385 	call get_int24
      00AC46 99 F1            [ 2] 4386 	pushw y 
      00AC48 CD               [ 1] 4387 	clr a 
      00AC49 98 6D 9F         [ 4] 4388 	call search_lineno  
      00AC4C A4 07            [ 2] 4389 	popw y 
      00AC4E C7               [ 2] 4390 	tnzw x 
      00AC4F 50 C6            [ 1] 4391 	jrne set_data_pointer 
      00AC51 81 44            [ 2] 4392 	jra data_error 
      00AC52                       4393 0$:
      002EE9                       4394 	_unget_token  
      00AC52 52 01 CD 9A 03   [ 1]    1      mov in,in.saved  
                                   4395 ; search first DATA line 	
      00AC57 A1 02 27         [ 2] 4396 1$:	cpw x,txtend
      00AC5A 03 CC            [ 1] 4397 	jruge data_error 
      002EF3                       4398 2$:	
      00AC5C 96 D7 90         [ 4] 4399 	call is_data_line 
      00AC5F F6 93            [ 1] 4400 	jrne 4$
      00AC61 EE 01 72         [ 4] 4401 4$:	call try_next_line 
      00AC64 A9 00            [ 1] 4402 	jrne 4$ 
      00AC66 03               [ 4] 4403 	ret 
                                   4404 
                                   4405 ;---------------------
                                   4406 ; set data pointer 
                                   4407 ; variables at new line 
                                   4408 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



                                   4409 ;    X    line address 
                                   4410 ;----------------------
      002EFE                       4411 set_data_pointer:
      00AC67 CF 00 1A         [ 2] 4412 	ldw data_ptr,x
      00AC6A 90 F6            [ 1] 4413 	ld a,(2,x)
      00AC6C 93 EE 01         [ 1] 4414 	ld data_len,a 
      00AC6F 72 A9 00 03      [ 1] 4415 	mov data_ofs,#FIRST_DATA_ITEM
      00AC73 CD               [ 4] 4416 	ret 
                                   4417 
                                   4418 
                                   4419 ;--------------------
                                   4420 ; at end of data line 
                                   4421 ; check if next line 
                                   4422 ; is a data line 
                                   4423 ; input:
                                   4424 ;    X   actual line address 
                                   4425 ;  
                                   4426 ;-------------------
      002F0B                       4427 try_next_line: 
      00AC74 AC B1            [ 1] 4428 	ld a,(2,x)
      00AC76 6B 01 A6         [ 1] 4429 	ld acc8,a 
      00AC79 01 0D 01 27      [ 1] 4430 	clr acc16 
      00AC7D 0D 48 0A 01      [ 2] 4431 	addw x,acc16 
      00AC81 26 FB 6B         [ 2] 4432 	cpw x,txtend 
      00AC84 01 7B            [ 1] 4433 	jrult 1$
      00AC86 01 EA            [ 2] 4434 	jra data_error 
      002F1F                       4435 1$:	
      00AC88 03 E7 03         [ 4] 4436 	call is_data_line 
      00AC8B A6 01            [ 1] 4437 	jreq 2$
      00AC8D C1 00            [ 1] 4438 	ld a,#1  
      00AC8F 0F 27            [ 2] 4439 	jra 9$
      00AC91 10 7B 01         [ 4] 4440 2$:	call set_data_pointer
      00AC94 43               [ 1] 4441 	clr a  
      00AC95 E4               [ 4] 4442 9$:	ret 
      002F2D                       4443 data_error:	
      00AC96 04 E7            [ 1] 4444     ld a,#ERR_NO_DATA 
      00AC98 04 7B 01         [ 2] 4445 	jp tb_error 
                                   4446 
                                   4447 
                                   4448 ;---------------------------------
                                   4449 ; BASIC: READ 
                                   4450 ; return next data item | 0 
                                   4451 ;---------------------------------
                           000001  4452 	CTX_BPTR=1 
                           000003  4453 	CTX_IN=3 
                           000004  4454 	CTX_COUNT=4 
                           000005  4455 	INT24=5
                           000007  4456 	VSIZE=7 
      002F32                       4457 read:
      002F32                       4458 	_vars  VSIZE 
      00AC9B 43 E4            [ 2]    1     sub sp,#VSIZE 
      00AC9D 02 E7 02         [ 4] 4459 	call save_context
      002F37                       4460 read01:	
      00ACA0 20 0C 08         [ 1] 4461 	ld a,data_ofs
      00ACA2 C1 00 09         [ 1] 4462 	cp a,data_len 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00ACA2 7B 01            [ 1] 4463 	jreq 2$ ; end of line  
      002F3F                       4464 0$:
      00ACA4 EA 02 E7         [ 2] 4465 	ldw x,data_ptr 
      00ACA7 02 7B 01         [ 2] 4466 	ldw basicptr,x 
      00ACAA EA 04 E7 04 01   [ 1] 4467 	mov in,data_ofs 
      00ACAE 55 00 09 00 03   [ 1] 4468 	mov count,data_len  
      00ACAE 5B 01 81         [ 4] 4469 	call expression 
      00ACB1 A1 84            [ 1] 4470 	cp a,#TK_INTGR 
      00ACB1 58 1C            [ 1] 4471 	jreq 1$ 
      00ACB3 AC C1 FE         [ 2] 4472 	jp syntax_error 
      002F59                       4473 1$:
      00ACB6 9F 88 5E         [ 4] 4474 	call next_token ; skip comma
      00ACB9 A6 05 42         [ 2] 4475 	ldw x,basicptr 
      00ACBC 1C 50 00         [ 2] 4476 	ldw data_ptr,x 
      00ACBF 84 81 01 00 08   [ 1] 4477 	mov data_ofs,in 
      00ACC1 CD 20 25         [ 4] 4478 	call rest_context
      002F6A                       4479 	_xpop 
      00ACC1 03 06            [ 1]    1     ld a,(y)
      00ACC3 03               [ 1]    2     ldw x,y 
      00ACC4 05 04            [ 2]    3     ldw x,(1,x)
      00ACC6 00 02 01 06      [ 2]    4     addw y,#CELL_SIZE 
      002F73                       4480 	_drop VSIZE 
      00ACCA 00 02            [ 2]    1     addw sp,#VSIZE 
      00ACCC 02               [ 4] 4481 	ret 
      002F76                       4482 2$: ; end of line reached 
                                   4483 	; try next line 
      00ACCD 02 03 03         [ 2] 4484 	ldw x,data_ptr  
      00ACD0 01 03 03         [ 4] 4485 	call try_next_line
      00ACD3 02 04            [ 1] 4486 	jreq 0$ 
      00ACD5 04 05            [ 2] 4487 	jra data_error 
                                   4488 
                                   4489 ;---------------------------------
                                   4490 ; BASIC: SPIEN clkdiv, 0|1  
                                   4491 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4492 ; if clkdiv==-1 disable SPI
                                   4493 ; 0|1 -> disable|enable  
                                   4494 ;--------------------------------- 
                           000005  4495 SPI_CS_BIT=5
      002F80                       4496 spi_enable:
      00ACD7 02 06 02         [ 4] 4497 	call arg_list 
      00ACDA 07 02            [ 1] 4498 	cp a,#2
      00ACDC 05 04            [ 1] 4499 	jreq 1$
      00ACDE 02 04 01         [ 2] 4500 	jp syntax_error 
      00ACE1                       4501 1$: 
      00ACE1 CD 99 FE A1      [ 1] 4502 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00ACE5 01               [ 2] 4503 	popw x  
      00ACE6 27               [ 2] 4504 	tnzw x 
      00ACE7 03 CC            [ 1] 4505 	jreq spi_disable 
      00ACE9 96               [ 2] 4506 	popw x 
      00ACEA D7 08            [ 1] 4507 	ld a,#(1<<SPI_CR1_BR)
      00ACEB 42               [ 4] 4508 	mul x,a 
      00ACEB 90               [ 1] 4509 	ld a,xl 
      00ACEC F6 93 EE         [ 1] 4510 	ld SPI_CR1,a 
                                   4511 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00ACEF 01 72 A9 00      [ 1] 4512 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00ACF3 03 89 88 A6      [ 1] 4513 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4514 ; configure SPI as master mode 0.	
      00ACF7 80 15 01 27      [ 1] 4515 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4516 ; ~CS line controlled by sofware 	
      00ACFB 05 A6 0A CC      [ 1] 4517 	bset SPI_CR2,#SPI_CR2_SSM 
      00ACFF 96 D9 52 01      [ 1] 4518     bset SPI_CR2,#SPI_CR2_SSI 
                                   4519 ; enable SPI
      00AD01 72 1C 52 00      [ 1] 4520 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AD01 CE               [ 4] 4521 	ret 
      002FB3                       4522 spi_disable:
      002FB3                       4523 	_drop #2; throw first argument.
      00AD02 00 15            [ 2]    1     addw sp,##2 
                                   4524 ; wait spi idle 
      00AD04 58 58            [ 1] 4525 1$:	ld a,#0x82 
      00AD06 58 58 58         [ 1] 4526 	and a,SPI_SR
      00AD09 9E C8            [ 1] 4527 	cp a,#2 
      00AD0B 00 15            [ 1] 4528 	jrne 1$
      00AD0D C7 00 0E 9F      [ 1] 4529 	bres SPI_CR1,#SPI_CR1_SPE
      00AD11 C8 00 16 C7      [ 1] 4530 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00AD15 00 0F CE 00      [ 1] 4531 	bres PE_DDR,#SPI_CS_BIT 
      00AD19 17               [ 4] 4532 	ret 
                                   4533 
      002FCB                       4534 spi_clear_error:
      00AD1A CF 00            [ 1] 4535 	ld a,#0x78 
      00AD1C 15 CE 00         [ 1] 4536 	bcp a,SPI_SR 
      00AD1F 17 54            [ 1] 4537 	jreq 1$
      00AD21 9E C8 00 17      [ 1] 4538 	clr SPI_SR 
      00AD25 C7               [ 4] 4539 1$: ret 
                                   4540 
      002FD7                       4541 spi_send_byte:
      00AD26 00               [ 1] 4542 	push a 
      00AD27 17 9F C8         [ 4] 4543 	call spi_clear_error
      00AD2A 00               [ 1] 4544 	pop a 
      00AD2B 18 C7 00 18 CE   [ 2] 4545 	btjf SPI_SR,#SPI_SR_TXE,.
      00AD30 00 0E 54         [ 1] 4546 	ld SPI_DR,a
      00AD33 54 54 9E C8 00   [ 2] 4547 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AD38 0E C7 00         [ 1] 4548 	ld a,SPI_DR 
      00AD3B 0E               [ 4] 4549 	ret 
                                   4550 
      002FED                       4551 spi_rcv_byte:
      00AD3C 9F C8            [ 1] 4552 	ld a,#255
      00AD3E 00 0F C7 00 0F   [ 2] 4553 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00AD43 C8 00 18         [ 1] 4554 	ld a,SPI_DR 
      00AD46 97               [ 4] 4555 	ret
                                   4556 
                                   4557 ;------------------------------
                                   4558 ; BASIC: SPIWR byte [,byte]
                                   4559 ; write 1 or more byte
                                   4560 ;------------------------------
      002FF8                       4561 spi_write:
      00AD47 C6 00 0E         [ 4] 4562 	call expression
      00AD4A C8 00            [ 1] 4563 	cp a,#TK_INTGR 
      00AD4C 17 95            [ 1] 4564 	jreq 1$
      00AD4E CF 00 17         [ 2] 4565 	jp syntax_error 
      003002                       4566 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00AD51 C6               [ 1] 4567 	ld a,xl 
      00AD52 00 16 A4         [ 4] 4568 	call spi_send_byte 
      00AD55 7F 72 A2         [ 4] 4569 	call next_token 
      00AD58 00 03            [ 1] 4570 	cp a,#TK_COMMA 
      00AD5A 90 F7            [ 1] 4571 	jrne 2$ 
      00AD5C 90 EF            [ 2] 4572 	jra spi_write 
      00AD5E 01               [ 1] 4573 2$:	tnz a 
      00AD5F 84 85            [ 1] 4574 	jreq 3$
      003012                       4575 	_unget_token  
      00AD61 72 A2 00 03 90   [ 1]    1      mov in,in.saved  
      00AD66 F7               [ 4] 4576 3$:	ret 
                                   4577 
                                   4578 
                                   4579 ;-------------------------------
                                   4580 ; BASIC: SPIRD 	
                                   4581 ; read one byte from SPI 
                                   4582 ;-------------------------------
      003018                       4583 spi_read:
      00AD67 90 EF 01         [ 4] 4584 	call spi_rcv_byte 
      00AD6A CD               [ 1] 4585 	clrw x 
      00AD6B 84               [ 1] 4586 	ld xl,a 
      00AD6C 11               [ 1] 4587 	clr a  
      00AD6D 90               [ 4] 4588 	ret 
                                   4589 
                                   4590 ;------------------------------
                                   4591 ; BASIC: SPISEL 0|1 
                                   4592 ; set state of ~CS line
                                   4593 ; 0|1 deselect|select  
                                   4594 ;------------------------------
      00301F                       4595 spi_select:
      00AD6E F6 93 EE         [ 4] 4596 	call next_token 
      00AD71 01 72            [ 1] 4597 	cp a,#TK_INTGR 
      00AD73 A9 00            [ 1] 4598 	jreq 1$
      00AD75 03 1C 00         [ 2] 4599 	jp syntax_error 
      00AD78 01               [ 2] 4600 1$: tnzw x  
      00AD79 A9 00            [ 1] 4601 	jreq cs_high 
      00AD7B 81 1B 50 14      [ 1] 4602 	bres PE_ODR,#SPI_CS_BIT
      00AD7C 81               [ 4] 4603 	ret 
      003031                       4604 cs_high: 
      00AD7C 90 89 52 03      [ 1] 4605 	bset PE_ODR,#SPI_CS_BIT
      00AD80 0F               [ 4] 4606 	ret 
                                   4607 
                                   4608 ;-------------------------------
                                   4609 ; BASIC: PAD 
                                   4610 ; Return pad buffer address.
                                   4611 ;------------------------------
      003036                       4612 pad_ref:
      00AD81 02 0F 03         [ 2] 4613 	ldw x,#pad 
      00AD84 90               [ 1] 4614 	clr a
      00AD85 AE               [ 4] 4615 	ret 
                                   4616 
                                   4617 ;****************************
                                   4618 ; expression stack 
                                   4619 ; manipulation routines
                                   4620 ;****************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4621 
                                   4622 ;-----------------------------
                                   4623 ; BASIC: PUSH expr|rel|cond 
                                   4624 ; push the result on xtack
                                   4625 ;-----------------------------
      00303B                       4626 xpush:
      00AD86 B5 59 93         [ 4] 4627 	call condition 
      00AD89 F6               [ 4] 4628 	ret 
                                   4629 
                                   4630 ;------------------------------
                                   4631 ; BASIC: POP 
                                   4632 ; pop top of xstack 
                                   4633 ;------------------------------
      00303F                       4634 xpop:
      00303F                       4635 	_xpop 
      00AD8A A4 0F            [ 1]    1     ld a,(y)
      00AD8C 6B               [ 1]    2     ldw x,y 
      00AD8D 01 0C            [ 2]    3     ldw x,(1,x)
      00AD8F 03 5C F6 CD      [ 2]    4     addw y,#CELL_SIZE 
      00AD93 89               [ 4] 4636 	ret 
                                   4637 
                                   4638 
                                   4639 ;------------------------------
                                   4640 ; BASIC: ALLOC expr 
                                   4641 ; allocate expr element on xtack 
                                   4642 ;-------------------------------
      003049                       4643 xalloc: 
      00AD94 5E 0C 02         [ 4] 4644 	call expression 
      00AD97 0A 01            [ 1] 4645 	cp a,#TK_INTGR
      00AD99 26 F5            [ 1] 4646 	jreq 1$ 
      00AD9B A6 46 11         [ 2] 4647 	jp syntax_error
      003053                       4648 1$: _xpop 
      00AD9E 02 2B            [ 1]    1     ld a,(y)
      00ADA0 09               [ 1]    2     ldw x,y 
      00ADA1 A6 20            [ 2]    3     ldw x,(1,x)
      00ADA3 CD 89 5E 0C      [ 2]    4     addw y,#CELL_SIZE 
      00ADA7 02               [ 1] 4649 	tnz a 
      00ADA8 20 07            [ 1] 4650 	jreq 3$ 
      00ADAA A6 0D            [ 1] 4651 2$:	ld a,#ERR_BAD_VALUE
      00ADAC CD 89 5E         [ 2] 4652 	jp tb_error 
      00ADAF 0F 02 72         [ 2] 4653 3$: cpw x,#XSTACK_SIZE 
      00ADB2 A2 00            [ 1] 4654 	jrugt 2$
      00ADB4 02 90            [ 1] 4655 	ld a,#CELL_SIZE 
      00ADB6 FE               [ 4] 4656 	mul x,a 
      00ADB7 26 CF A6         [ 2] 4657 	ldw acc16,x 
      00ADBA 0D CD 89 5E      [ 2] 4658 	subw y,acc16 
      00ADBE 5F 7B 03 97      [ 2] 4659 	cpw y,#xstack_full
      00ADC2 CD 98            [ 1] 4660 	jrugt 9$
      00ADC4 83 AE            [ 1] 4661 	ld a,#ERR_MEM_FULL
      00ADC6 AD D0 CD         [ 2] 4662 	jp tb_error 
      00307E                       4663 9$:	 
      00ADC9 89               [ 4] 4664 	ret 
                                   4665 
                                   4666 
                                   4667 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4668 ;  BASIC DROP expr 
                                   4669 ;  expr in range {0..XSTACK_SIZE}
                                   4670 ;  discard n elements from xtack
                                   4671 ;------------------------------
      00307F                       4672 xdrop:
      00ADCA BB 5B 03         [ 4] 4673 	call expression 
      00ADCD 90 85            [ 1] 4674 	cp a,#TK_INTGR
      00ADCF 81 20            [ 1] 4675 	jreq 1$ 
      00ADD1 77 6F 72         [ 2] 4676 	jp syntax_error 
      003089                       4677 1$:	_xpop 
      00ADD4 64 73            [ 1]    1     ld a,(y)
      00ADD6 20               [ 1]    2     ldw x,y 
      00ADD7 69 6E            [ 2]    3     ldw x,(1,x)
      00ADD9 20 64 69 63      [ 2]    4     addw y,#CELL_SIZE 
      00ADDD 74               [ 1] 4678 	ld a,xl 
      00ADDE 69 6F            [ 1] 4679 	and a,#0x1f 
      00ADE0 6E               [ 1] 4680 	clrw x 
      00ADE1 61               [ 1] 4681 	ld xl,a 
      00ADE2 72 79            [ 1] 4682 	ld a,#CELL_SIZE 
      00ADE4 0A               [ 4] 4683 	mul x,a 
      00ADE5 00 00 0D         [ 2] 4684 	ldw acc16,x  
      00ADE6 72 B9 00 0D      [ 2] 4685 	addw y,acc16 
      00ADE6 CD 9A 03 A1      [ 2] 4686 	cpw y,#XSTACK_EMPTY 
      00ADEA 01 27            [ 2] 4687 	jrule 9$
      00ADEC 03 CC 96 D7      [ 2] 4688 	ldw y,#XSTACK_EMPTY 
      00ADF0 81               [ 4] 4689 9$:	ret 
                                   4690 
                                   4691 ;-----------------------
                                   4692 ; check if value in A:X 
                                   4693 ; is inside xstack bound
                                   4694 ; output:
                                   4695 ;    X     slot address  
                                   4696 ;-----------------------
      0030AC                       4697 xstack_bound:
      00ADF0 90               [ 1] 4698 	tnz a 
      00ADF1 F6 93            [ 1] 4699 	jrne 8$ 
      00ADF3 EE 01 72         [ 2] 4700 1$: cpw x,#XSTACK_SIZE 
      00ADF6 A9 00            [ 1] 4701 	jrugt 8$
      00ADF8 03 CF            [ 1] 4702 	ld a,#CELL_SIZE 
      00ADFA 00               [ 4] 4703 	mul x,a
      00ADFB 13 81 0D         [ 2] 4704 	ldw acc16,x 
      00ADFD 93               [ 1] 4705 	ldw x,y 
      00ADFD 4F CE 00 13      [ 2] 4706 	addw x,acc16 
      00AE01 27 02 5F         [ 2] 4707 	cpw x,#XSTACK_EMPTY 
      00AE04 81 43            [ 1] 4708 	jruge 8$  
      00AE06 53               [ 4] 4709 	ret 
      00AE07 81 0A            [ 1] 4710 8$: ld a,#ERR_BAD_VALUE
      00AE08 CC 16 59         [ 2] 4711 	jp tb_error 
                                   4712 
                                   4713 ;-------------------------
                                   4714 ; BASIC: PUT expr, cond 
                                   4715 ; expr -> slot 
                                   4716 ; cond -> valut to put 
                                   4717 ; on xstack 
                                   4718 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      0030CA                       4719 xput:
      00AE08 CD 9A 03         [ 4] 4720 	call arg_list 
      00AE0B A1 01            [ 1] 4721 	cp a,#2 
      00AE0D 27 03            [ 1] 4722 	jreq 1$ 
      00AE0F CC 96 D7         [ 2] 4723 0$:	jp syntax_error
      0030D4                       4724 1$: _xpop   ; value to put 
      00AE12 90 F6            [ 1]    1     ld a,(y)
      00AE14 93               [ 1]    2     ldw x,y 
      00AE15 EE 01            [ 2]    3     ldw x,(1,x)
      00AE17 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AE1B 4B               [ 2] 4725 	pushw x 
      00AE1C 00               [ 1] 4726 	push a 
      0030DF                       4727 	_xpop    ; slot 
      00AE1D 35 CC            [ 1]    1     ld a,(y)
      00AE1F 50               [ 1]    2     ldw x,y 
      00AE20 E0 9E            [ 2]    3     ldw x,(1,x)
      00AE22 A4 3F 95 A3      [ 2]    4     addw y,#CELL_SIZE 
      00AE26 00 FF 23         [ 4] 4728 	call xstack_bound
      00AE29 06 0C 01         [ 2] 4729     ldw ptr16,x 
      00AE2C 98               [ 1] 4730 	pop a 
      00AE2D 56               [ 2] 4731 	popw x 
      00AE2E 20 F5 35 55      [ 4] 4732 	ld [ptr16],a 
      00AE32 50 E0 84 C7      [ 1] 4733 	inc ptr8 
      00AE36 50 E1 9F 4A      [ 5] 4734 	ldw [ptr16],x 
      00AE3A 35               [ 4] 4735 	ret 
                                   4736 
                                   4737 ;------------------------
                                   4738 ; BASIC: PICK expr 
                                   4739 ; get nième element on 
                                   4740 ; xtack. 
                                   4741 ;-----------------------
      0030FD                       4742 xpick:
      00AE3B 55 50 E0         [ 4] 4743 	call func_args 
      00AE3E C7 50            [ 1] 4744 	cp a,#1 
      00AE40 E2 35            [ 1] 4745 	jreq 1$
      00AE42 AA 50 E0         [ 2] 4746 	jp syntax_error 
      003107                       4747 1$: _xpop 
      00AE45 81 F6            [ 1]    1     ld a,(y)
      00AE46 93               [ 1]    2     ldw x,y 
      00AE46 35 AA            [ 2]    3     ldw x,(1,x)
      00AE48 50 E0 81 03      [ 2]    4     addw y,#CELL_SIZE 
      00AE4B CD 30 AC         [ 4] 4748 	call xstack_bound
      00AE4B CD               [ 1] 4749     ld a,(x)
      00AE4C 99 FE            [ 2] 4750 	ldw x,(1,x)				
      00AE4E A1               [ 4] 4751 	ret 
                                   4752 
                                   4753 
                                   4754 
                                   4755 ;------------------------------
                                   4756 ;      dictionary 
                                   4757 ; format:
                                   4758 ;   link:   2 bytes 
                                   4759 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4760 ;   cmd_name: 16 byte max 
                                   4761 ;   code_addr: 2 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



                                   4762 ;------------------------------
                                   4763 	.macro _dict_entry len,name,code_addr 
                                   4764 	.word LINK 
                                   4765 	LINK=.
                                   4766 name:
                                   4767 	.byte len   	
                                   4768 	.ascii "name"
                                   4769 	.word code_addr  
                                   4770 	.endm 
                                   4771 
                           000000  4772 	LINK=0
                                   4773 ; respect alphabetic order for BASIC names from Z-A
                                   4774 ; this sort order is for a cleaner WORDS cmd output. 	
      003117                       4775 kword_end:
      003117                       4776 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AE4F 01 27                    1 	.word LINK 
                           003119     2 	LINK=.
      003119                          3 XOR:
      00AE51 03                       4 	.byte 3+F_XOR   	
      00AE52 CC 96 D7                 5 	.ascii "XOR"
      00AE55 00 8A                    6 	.word TK_XOR  
      00311F                       4777 	_dict_entry,5,WRITE,write  
      00AE55 90 F6                    1 	.word LINK 
                           003121     2 	LINK=.
      003121                          3 WRITE:
      00AE57 93                       4 	.byte 5   	
      00AE58 EE 01 72 A9 00           5 	.ascii "WRITE"
      00AE5D 03 4D                    6 	.word write  
      003129                       4778 	_dict_entry,5,WORDS,words 
      00AE5F 26 08                    1 	.word LINK 
                           00312B     2 	LINK=.
      00312B                          3 WORDS:
      00AE61 5D                       4 	.byte 5   	
      00AE62 26 05 A6 0A CC           5 	.ascii "WORDS"
      00AE67 96 D9                    6 	.word words  
      003133                       4779 	_dict_entry 4,WAIT,wait 
      00AE69 4B 18                    1 	.word LINK 
                           003135     2 	LINK=.
      003135                          3 WAIT:
      00AE6B 59                       4 	.byte 4   	
      00AE6C 49 25 04 0A              5 	.ascii "WAIT"
      00AE70 01 26                    6 	.word wait  
      00313C                       4780 	_dict_entry,3+F_IFUNC,USR,usr
      00AE72 F8 5F                    1 	.word LINK 
                           00313E     2 	LINK=.
      00313E                          3 USR:
      00AE74 84                       4 	.byte 3+F_IFUNC   	
      00AE75 4A 02 52                 5 	.ascii "USR"
      00AE77 2A A1                    6 	.word usr  
      003144                       4781 	_dict_entry,5,UNTIL,until 
      00AE77 81 3E                    1 	.word LINK 
                           003146     2 	LINK=.
      00AE78                          3 UNTIL:
      00AE78 CD                       4 	.byte 5   	
      00AE79 99 FE A1 01 27           5 	.ascii "UNTIL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AE7E 03 CC                    6 	.word until  
      00314E                       4782 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00AE80 96 D7                    1 	.word LINK 
                           003150     2 	LINK=.
      003150                          3 UFLASH:
      00AE82 90                       4 	.byte 6+F_IFUNC   	
      00AE83 F6 93 EE 01 72 A9        5 	.ascii "UFLASH"
      00AE89 00 03                    6 	.word uflash  
      003159                       4783 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00AE8B 9F AE                    1 	.word LINK 
                           00315B     2 	LINK=.
      00315B                          3 UBOUND:
      00AE8D 00                       4 	.byte 6+F_IFUNC   	
      00AE8E 01 A4 17 27 0A 88        5 	.ascii "UBOUND"
      00AE94 4F 94                    6 	.word ubound  
      00AE95                       4784 	_dict_entry,4,TONE,tone  
      00AE95 58 49                    1 	.word LINK 
                           003166     2 	LINK=.
      003166                          3 TONE:
      00AE97 0A                       4 	.byte 4   	
      00AE98 01 26 FA 45              5 	.ascii "TONE"
      00AE9B 25 81                    6 	.word tone  
      00316D                       4785 	_dict_entry,2,TO,to
      00AE9B 5B 01                    1 	.word LINK 
                           00316F     2 	LINK=.
      00316F                          3 TO:
      00AE9D 81                       4 	.byte 2   	
      00AE9E 54 4F                    5 	.ascii "TO"
      00AE9E 85 52                    6 	.word to  
      003174                       4786 	_dict_entry,5,TIMER,set_timer
      00AEA0 04 89                    1 	.word LINK 
                           003176     2 	LINK=.
      003176                          3 TIMER:
      00AEA2 CE                       4 	.byte 5   	
      00AEA3 00 05 1F 03 CE           5 	.ascii "TIMER"
      00AEA8 00 01                    6 	.word set_timer  
      00317E                       4787 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AEAA 1F 05                    1 	.word LINK 
                           003180     2 	LINK=.
      003180                          3 TIMEOUT:
      00AEAC 72                       4 	.byte 7+F_IFUNC   	
      00AEAD 5C 00 20 81 4F 55 54     5 	.ascii "TIMEOUT"
      00AEB1 2D 7D                    6 	.word timeout  
      00318A                       4788 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AEB1 72 5D                    1 	.word LINK 
                           00318C     2 	LINK=.
      00318C                          3 TICKS:
      00AEB3 00                       4 	.byte 5+F_IFUNC   	
      00AEB4 20 26 03 CC 96           5 	.ascii "TICKS"
      00AEB9 D7 4D                    6 	.word get_ticks  
      00AEBA                       4789 	_dict_entry,4,STOP,stop 
      00AEBA CD 9C                    1 	.word LINK 
                           003196     2 	LINK=.
      003196                          3 STOP:
      00AEBC 60                       4 	.byte 4   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00AEBD 90 F6 93 EE              5 	.ascii "STOP"
      00AEC1 01 72                    6 	.word stop  
      00319D                       4790 	_dict_entry,4,STEP,step 
      00AEC3 A9 00                    1 	.word LINK 
                           00319F     2 	LINK=.
      00319F                          3 STEP:
      00AEC5 03                       4 	.byte 4   	
      00AEC6 4D 26 13 5D              5 	.ascii "STEP"
      00AECA 26 10                    6 	.word step  
      0031A6                       4791 	_dict_entry,5,SPIWR,spi_write
      00AECC 1E 03                    1 	.word LINK 
                           0031A8     2 	LINK=.
      0031A8                          3 SPIWR:
      00AECE CF                       4 	.byte 5   	
      00AECF 00 05 E6 02 C7           5 	.ascii "SPIWR"
      00AED4 00 04                    6 	.word spi_write  
      0031B0                       4792 	_dict_entry,6,SPISEL,spi_select
      00AED6 1E 05                    1 	.word LINK 
                           0031B2     2 	LINK=.
      0031B2                          3 SPISEL:
      00AED8 CF                       4 	.byte 6   	
      00AED9 00 01 81 53 45 4C        5 	.ascii "SPISEL"
      00AEDC 30 1F                    6 	.word spi_select  
      0031BB                       4793 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AEDC 85 5B                    1 	.word LINK 
                           0031BD     2 	LINK=.
      0031BD                          3 SPIRD:
      00AEDE 04                       4 	.byte 5+F_IFUNC   	
      00AEDF 72 5A 00 20 FC           5 	.ascii "SPIRD"
      00AEE4 30 18                    6 	.word spi_read  
      0031C5                       4794 	_dict_entry,5,SPIEN,spi_enable 
      00AEE4 AE 50                    1 	.word LINK 
                           0031C7     2 	LINK=.
      0031C7                          3 SPIEN:
      00AEE6 00                       4 	.byte 5   	
      00AEE7 4F 81 49 45 4E           5 	.ascii "SPIEN"
      00AEE9 2F 80                    6 	.word spi_enable  
      0031CF                       4795 	_dict_entry,5,SLEEP,sleep 
      00AEE9 AE 50                    1 	.word LINK 
                           0031D1     2 	LINK=.
      0031D1                          3 SLEEP:
      00AEEB 05                       4 	.byte 5   	
      00AEEC 4F 81 45 45 50           5 	.ascii "SLEEP"
      00AEEE 2A D0                    6 	.word sleep  
      0031D9                       4796     _dict_entry,4,SIZE,cmd_size 
      00AEEE AE 50                    1 	.word LINK 
                           0031DB     2 	LINK=.
      0031DB                          3 SIZE:
      00AEF0 0A                       4 	.byte 4   	
      00AEF1 4F 81 5A 45              5 	.ascii "SIZE"
      00AEF3 1C 67                    6 	.word cmd_size  
      0031E2                       4797 	_dict_entry,4,SAVE,save_app 
      00AEF3 AE 50                    1 	.word LINK 
                           0031E4     2 	LINK=.
      0031E4                          3 SAVE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AEF5 0F                       4 	.byte 4   	
      00AEF6 4F 81 56 45              5 	.ascii "SAVE"
      00AEF8 28 3D                    6 	.word save_app  
      0031EB                       4798 	_dict_entry 3,RUN,run
      00AEF8 AE 50                    1 	.word LINK 
                           0031ED     2 	LINK=.
      0031ED                          3 RUN:
      00AEFA 14                       4 	.byte 3   	
      00AEFB 4F 81 4E                 5 	.ascii "RUN"
      00AEFD 24 B4                    6 	.word run  
      0031F3                       4799 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AEFD AE 50                    1 	.word LINK 
                           0031F5     2 	LINK=.
      0031F5                          3 RSHIFT:
      00AEFF 19                       4 	.byte 6+F_IFUNC   	
      00AF00 4F 81 48 49 46 54        5 	.ascii "RSHIFT"
      00AF02 2B 97                    6 	.word rshift  
      0031FE                       4800 	_dict_entry,3+F_IFUNC,RND,random 
      00AF02 AE 50                    1 	.word LINK 
                           003200     2 	LINK=.
      003200                          3 RND:
      00AF04 1E                       4 	.byte 3+F_IFUNC   	
      00AF05 4F 81 44                 5 	.ascii "RND"
      00AF07 2C 61                    6 	.word random  
      003206                       4801 	_dict_entry,6,RETURN,return 
      00AF07 AE 50                    1 	.word LINK 
                           003208     2 	LINK=.
      003208                          3 RETURN:
      00AF09 28                       4 	.byte 6   	
      00AF0A 4F 81 54 55 52 4E        5 	.ascii "RETURN"
      00AF0C 24 83                    6 	.word return  
      003211                       4802 	_dict_entry,7,RESTORE,restore 
      00AF0C 4F AE                    1 	.word LINK 
                           003213     2 	LINK=.
      003213                          3 RESTORE:
      00AF0E 00                       4 	.byte 7   	
      00AF0F 00 81 53 54 4F 52 45     5 	.ascii "RESTORE"
      00AF11 2E C8                    6 	.word restore  
      00321D                       4803 	_dict_entry 3,REM,remark 
      00AF11 4F AE                    1 	.word LINK 
                           00321F     2 	LINK=.
      00321F                          3 REM:
      00AF13 00                       4 	.byte 3   	
      00AF14 01 81 4D                 5 	.ascii "REM"
      00AF16 20 D4                    6 	.word remark  
      003225                       4804 	_dict_entry,6,REBOOT,cold_start
      00AF16 4F AE                    1 	.word LINK 
                           003227     2 	LINK=.
      003227                          3 REBOOT:
      00AF18 00                       4 	.byte 6   	
      00AF19 02 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00AF1B 00 B5                    6 	.word cold_start  
      003230                       4805 	_dict_entry,4+F_IFUNC,READ,read  
      00AF1B 4F AE                    1 	.word LINK 
                           003232     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      003232                          3 READ:
      00AF1D 00                       4 	.byte 4+F_IFUNC   	
      00AF1E 03 81 41 44              5 	.ascii "READ"
      00AF20 2F 32                    6 	.word read  
      003239                       4806 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AF20 4F AE                    1 	.word LINK 
                           00323B     2 	LINK=.
      00323B                          3 QKEY:
      00AF22 00                       4 	.byte 4+F_IFUNC   	
      00AF23 04 81 45 59              5 	.ascii "QKEY"
      00AF25 2A 42                    6 	.word qkey  
      003242                       4807 	_dict_entry,3,PUT,xput 
      00AF25 4F AE                    1 	.word LINK 
                           003244     2 	LINK=.
      003244                          3 PUT:
      00AF27 00                       4 	.byte 3   	
      00AF28 01 81 54                 5 	.ascii "PUT"
      00AF2A 30 CA                    6 	.word xput  
      00324A                       4808 	_dict_entry,4,PUSH,xpush   
      00AF2A 4F AE                    1 	.word LINK 
                           00324C     2 	LINK=.
      00324C                          3 PUSH:
      00AF2C 00                       4 	.byte 4   	
      00AF2D 00 81 53 48              5 	.ascii "PUSH"
      00AF2F 30 3B                    6 	.word xpush  
      003253                       4809 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AF2F 4F AE                    1 	.word LINK 
                           003255     2 	LINK=.
      003255                          3 PORTI:
      00AF31 40                       4 	.byte 5+F_IFUNC   	
      00AF32 00 81 52 54 49           5 	.ascii "PORTI"
      00AF34 2E 87                    6 	.word const_porti  
      00325D                       4810 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AF34 55 00                    1 	.word LINK 
                           00325F     2 	LINK=.
      00325F                          3 PORTG:
      00AF36 04                       4 	.byte 5+F_IFUNC   	
      00AF37 00 02 81 54 47           5 	.ascii "PORTG"
      00AF3A 2E 82                    6 	.word const_portg  
      003267                       4811 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AF3A 89 E6                    1 	.word LINK 
                           003269     2 	LINK=.
      003269                          3 PORTF:
      00AF3C 03                       4 	.byte 5+F_IFUNC   	
      00AF3D A1 80 26 05 EE           5 	.ascii "PORTF"
      00AF42 04 A3                    6 	.word const_portf  
      003271                       4812 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AF44 AF 34                    1 	.word LINK 
                           003273     2 	LINK=.
      003273                          3 PORTE:
      00AF46 85                       4 	.byte 5+F_IFUNC   	
      00AF47 81 4F 52 54 45           5 	.ascii "PORTE"
      00AF48 2E 78                    6 	.word const_porte  
      00327B                       4813 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AF48 5F CF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           00327D     2 	LINK=.
      00327D                          3 PORTD:
      00AF4A 00                       4 	.byte 5+F_IFUNC   	
      00AF4B 07 CF 00 09 CE           5 	.ascii "PORTD"
      00AF50 00 1C                    6 	.word const_portd  
      003285                       4814 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AF52 CD 98                    1 	.word LINK 
                           003287     2 	LINK=.
      003287                          3 PORTC:
      00AF54 3B                       4 	.byte 5+F_IFUNC   	
      00AF55 A1 84 26 10 CD           5 	.ascii "PORTC"
      00AF5A 98 6D                    6 	.word const_portc  
      00328F                       4815 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AF5C 90 89                    1 	.word LINK 
                           003291     2 	LINK=.
      003291                          3 PORTB:
      00AF5E 4F                       4 	.byte 5+F_IFUNC   	
      00AF5F CD 8C 98 90 85           5 	.ascii "PORTB"
      00AF64 5D 26                    6 	.word const_portb  
      003299                       4816 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AF66 17 20                    1 	.word LINK 
                           00329B     2 	LINK=.
      00329B                          3 PORTA:
      00AF68 44                       4 	.byte 5+F_IFUNC   	
      00AF69 50 4F 52 54 41           5 	.ascii "PORTA"
      00AF69 55 00                    6 	.word const_porta  
      0032A3                       4817 	_dict_entry 5,PRINT,print 
      00AF6B 03 00                    1 	.word LINK 
                           0032A5     2 	LINK=.
      0032A5                          3 PRINT:
      00AF6D 02                       4 	.byte 5   	
      00AF6E C3 00 1E 24 3A           5 	.ascii "PRINT"
      00AF73 1F 8C                    6 	.word print  
      0032AD                       4818 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AF73 CD AF                    1 	.word LINK 
                           0032AF     2 	LINK=.
      0032AF                          3 POUT:
      00AF75 3A                       4 	.byte 4+F_IFUNC   	
      00AF76 26 00 CD AF              5 	.ascii "POUT"
      00AF7A 8B 26                    6 	.word const_output  
      0032B6                       4819 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AF7C FB 81                    1 	.word LINK 
                           0032B8     2 	LINK=.
      00AF7E                          3 POP:
      00AF7E CF                       4 	.byte 3+F_IFUNC   	
      00AF7F 00 07 E6                 5 	.ascii "POP"
      00AF82 02 C7                    6 	.word xpop  
      0032BE                       4820 	_dict_entry,4,POKE,poke 
      00AF84 00 0A                    1 	.word LINK 
                           0032C0     2 	LINK=.
      0032C0                          3 POKE:
      00AF86 35                       4 	.byte 4   	
      00AF87 06 00 09 81              5 	.ascii "POKE"
      00AF8B 21 B5                    6 	.word poke  
      0032C7                       4821 	_dict_entry,5,PMODE,pin_mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AF8B E6 02                    1 	.word LINK 
                           0032C9     2 	LINK=.
      0032C9                          3 PMODE:
      00AF8D C7                       4 	.byte 5   	
      00AF8E 00 0F 72 5F 00           5 	.ascii "PMODE"
      00AF93 0E 72                    6 	.word pin_mode  
      0032D1                       4822 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AF95 BB 00                    1 	.word LINK 
                           0032D3     2 	LINK=.
      0032D3                          3 PINP:
      00AF97 0E                       4 	.byte 4+F_IFUNC   	
      00AF98 C3 00 1E 25              5 	.ascii "PINP"
      00AF9C 02 20                    6 	.word const_input  
      0032DA                       4823 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AF9E 0E D3                    1 	.word LINK 
                           0032DC     2 	LINK=.
      00AF9F                          3 PICK:
      00AF9F CD                       4 	.byte 4+F_IFUNC   	
      00AFA0 AF 3A 27 04              5 	.ascii "PICK"
      00AFA4 A6 01                    6 	.word xpick  
      0032E3                       4824 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AFA6 20 04                    1 	.word LINK 
                           0032E5     2 	LINK=.
      0032E5                          3 PEEK:
      00AFA8 CD                       4 	.byte 4+F_IFUNC   	
      00AFA9 AF 7E 4F 81              5 	.ascii "PEEK"
      00AFAD 21 D6                    6 	.word peek  
      0032EC                       4825 	_dict_entry,5,PAUSE,pause 
      00AFAD A6 0C                    1 	.word LINK 
                           0032EE     2 	LINK=.
      0032EE                          3 PAUSE:
      00AFAF CC                       4 	.byte 5   	
      00AFB0 96 D9 55 53 45           5 	.ascii "PAUSE"
      00AFB2 2A DB                    6 	.word pause  
      0032F6                       4826 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AFB2 52 07                    1 	.word LINK 
                           0032F8     2 	LINK=.
      0032F8                          3 PAD:
      00AFB4 CD                       4 	.byte 3+F_IFUNC   	
      00AFB5 A0 95 44                 5 	.ascii "PAD"
      00AFB7 30 36                    6 	.word pad_ref  
      0032FE                       4827 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AFB7 C6 00                    1 	.word LINK 
                           003300     2 	LINK=.
      003300                          3 OR:
      00AFB9 09                       4 	.byte 2+F_OR   	
      00AFBA C1 00                    5 	.ascii "OR"
      00AFBC 0A 27                    6 	.word TK_OR  
      003305                       4828 	_dict_entry,2,ON,cmd_on 
      00AFBE 37 00                    1 	.word LINK 
                           003307     2 	LINK=.
      00AFBF                          3 ON:
      00AFBF CE                       4 	.byte 2   	
      00AFC0 00 07                    5 	.ascii "ON"
      00AFC2 CF 00                    6 	.word cmd_on  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00330C                       4829 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AFC4 05 55                    1 	.word LINK 
                           00330E     2 	LINK=.
      00330E                          3 ODR:
      00AFC6 00                       4 	.byte 3+F_IFUNC   	
      00AFC7 09 00 02                 5 	.ascii "ODR"
      00AFCA 55 00                    6 	.word const_odr  
      003314                       4830 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AFCC 0A 00                    1 	.word LINK 
                           003316     2 	LINK=.
      003316                          3 NOT:
      00AFCE 04                       4 	.byte 3+F_NOT   	
      00AFCF CD 9B 47                 5 	.ascii "NOT"
      00AFD2 A1 84                    6 	.word TK_NOT  
      00331C                       4831 	_dict_entry,4,NEXT,next 
      00AFD4 27 03                    1 	.word LINK 
                           00331E     2 	LINK=.
      00331E                          3 NEXT:
      00AFD6 CC                       4 	.byte 4   	
      00AFD7 96 D7 58 54              5 	.ascii "NEXT"
      00AFD9 22 CC                    6 	.word next  
      003325                       4832 	_dict_entry,3,NEW,new
      00AFD9 CD 98                    1 	.word LINK 
                           003327     2 	LINK=.
      003327                          3 NEW:
      00AFDB 3B                       4 	.byte 3   	
      00AFDC CE 00 05                 5 	.ascii "NEW"
      00AFDF CF 00                    6 	.word new  
      00332D                       4833 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AFE1 07 55                    1 	.word LINK 
                           00332F     2 	LINK=.
      00332F                          3 LSHIFT:
      00AFE3 00                       4 	.byte 6+F_IFUNC   	
      00AFE4 02 00 09 CD A0 A5        5 	.ascii "LSHIFT"
      00AFEA 90 F6                    6 	.word lshift  
      003338                       4834 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AFEC 93 EE                    1 	.word LINK 
                           00333A     2 	LINK=.
      00333A                          3 LOG2:
      00AFEE 01                       4 	.byte 4+F_IFUNC   	
      00AFEF 72 A9 00 03              5 	.ascii "LOG2"
      00AFF3 5B 07                    6 	.word log2  
      003341                       4835 	_dict_entry 4,LIST,list
      00AFF5 81 3A                    1 	.word LINK 
                           003343     2 	LINK=.
      00AFF6                          3 LIST:
      00AFF6 CE                       4 	.byte 4   	
      00AFF7 00 07 CD AF              5 	.ascii "LIST"
      00AFFB 8B 27                    6 	.word list  
      00334A                       4836 	_dict_entry 3,LET,let 
      00AFFD C1 20                    1 	.word LINK 
                           00334C     2 	LINK=.
      00334C                          3 LET:
      00AFFF AD                       4 	.byte 3   	
      00B000 4C 45 54                 5 	.ascii "LET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00B000 CD 9A                    6 	.word let  
      003352                       4837 	_dict_entry,3+F_CFUNC,KEY,key 
      00B002 03 A1                    1 	.word LINK 
                           003354     2 	LINK=.
      003354                          3 KEY:
      00B004 02                       4 	.byte 3+F_CFUNC   	
      00B005 27 03 CC                 5 	.ascii "KEY"
      00B008 96 D7                    6 	.word key  
      00B00A                       4838 	_dict_entry,7,IWDGREF,refresh_iwdg
      00B00A 72 12                    1 	.word LINK 
                           00335C     2 	LINK=.
      00335C                          3 IWDGREF:
      00B00C 50                       4 	.byte 7   	
      00B00D C7 85 5D 27 21 85 A6     5 	.ascii "IWDGREF"
      00B014 08 42                    6 	.word refresh_iwdg  
      003366                       4839 	_dict_entry,6,IWDGEN,enable_iwdg
      00B016 9F C7                    1 	.word LINK 
                           003368     2 	LINK=.
      003368                          3 IWDGEN:
      00B018 52                       4 	.byte 6   	
      00B019 00 72 1A 50 14 72        5 	.ascii "IWDGEN"
      00B01F 1A 50                    6 	.word enable_iwdg  
      003371                       4840 	_dict_entry,5,INPUT,input_var  
      00B021 16 72                    1 	.word LINK 
                           003373     2 	LINK=.
      003373                          3 INPUT:
      00B023 14                       4 	.byte 5   	
      00B024 52 00 72 12 52           5 	.ascii "INPUT"
      00B029 01 72                    6 	.word input_var  
      00337B                       4841 	_dict_entry,2,IF,if 
      00B02B 10 52                    1 	.word LINK 
                           00337D     2 	LINK=.
      00337D                          3 IF:
      00B02D 01                       4 	.byte 2   	
      00B02E 72 1C                    5 	.ascii "IF"
      00B030 52 00                    6 	.word if  
      003382                       4842 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00B032 81 7D                    1 	.word LINK 
                           003384     2 	LINK=.
      00B033                          3 IDR:
      00B033 5B                       4 	.byte 3+F_IFUNC   	
      00B034 02 A6 82                 5 	.ascii "IDR"
      00B037 C4 52                    6 	.word const_idr  
      00338A                       4843 	_dict_entry,3,HEX,hex_base
      00B039 03 A1                    1 	.word LINK 
                           00338C     2 	LINK=.
      00338C                          3 HEX:
      00B03B 02                       4 	.byte 3   	
      00B03C 26 F7 72                 5 	.ascii "HEX"
      00B03F 1D 52                    6 	.word hex_base  
      003392                       4844 	_dict_entry,4,GOTO,goto 
      00B041 00 72                    1 	.word LINK 
                           003394     2 	LINK=.
      003394                          3 GOTO:
      00B043 13                       4 	.byte 4   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00B044 50 C7 72 1B              5 	.ascii "GOTO"
      00B048 50 16                    6 	.word goto  
      00339B                       4845 	_dict_entry,5,GOSUB,gosub 
      00B04A 81 94                    1 	.word LINK 
                           00339D     2 	LINK=.
      00B04B                          3 GOSUB:
      00B04B A6                       4 	.byte 5   	
      00B04C 78 C5 52 03 27           5 	.ascii "GOSUB"
      00B051 04 72                    6 	.word gosub  
      0033A5                       4846 	_dict_entry,3,GET,cmd_get 
      00B053 5F 52                    1 	.word LINK 
                           0033A7     2 	LINK=.
      0033A7                          3 GET:
      00B055 03                       4 	.byte 3   	
      00B056 81 45 54                 5 	.ascii "GET"
      00B057 25 49                    6 	.word cmd_get  
      0033AD                       4847 	_dict_entry,4+F_IFUNC,FREE,free
      00B057 88 CD                    1 	.word LINK 
                           0033AF     2 	LINK=.
      0033AF                          3 FREE:
      00B059 B0                       4 	.byte 4+F_IFUNC   	
      00B05A 4B 84 72 03              5 	.ascii "FREE"
      00B05E 52 03                    6 	.word free  
      0033B6                       4848 	_dict_entry,3,FOR,for 
      00B060 FB C7                    1 	.word LINK 
                           0033B8     2 	LINK=.
      0033B8                          3 FOR:
      00B062 52                       4 	.byte 3   	
      00B063 04 72 01                 5 	.ascii "FOR"
      00B066 52 03                    6 	.word for  
      0033BE                       4849 	_dict_entry,4,FCPU,fcpu 
      00B068 FB C6                    1 	.word LINK 
                           0033C0     2 	LINK=.
      0033C0                          3 FCPU:
      00B06A 52                       4 	.byte 4   	
      00B06B 04 81 50 55              5 	.ascii "FCPU"
      00B06D 2B C3                    6 	.word fcpu  
      0033C7                       4850 	_dict_entry,5,ERASE,erase 
      00B06D A6 FF                    1 	.word LINK 
                           0033C9     2 	LINK=.
      0033C9                          3 ERASE:
      00B06F 72                       4 	.byte 5   	
      00B070 01 52 03 E3 C6           5 	.ascii "ERASE"
      00B075 52 04                    6 	.word erase  
      0033D1                       4851 	_dict_entry,3,END,cmd_end  
      00B077 81 C9                    1 	.word LINK 
                           0033D3     2 	LINK=.
      00B078                          3 END:
      00B078 CD                       4 	.byte 3   	
      00B079 9B 47 A1                 5 	.ascii "END"
      00B07C 84 27                    6 	.word cmd_end  
      0033D9                       4852 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00B07E 03 CC                    1 	.word LINK 
                           0033DB     2 	LINK=.
      0033DB                          3 EEPROM:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00B080 96                       4 	.byte 6+F_IFUNC   	
      00B081 D7 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00B082 2E AF                    6 	.word const_eeprom_base  
      0033E4                       4853 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00B082 9F CD                    1 	.word LINK 
                           0033E6     2 	LINK=.
      0033E6                          3 EEFREE:
      00B084 B0                       4 	.byte 6+F_IFUNC   	
      00B085 57 CD 98 3B A1 08        5 	.ascii "EEFREE"
      00B08B 26 02                    6 	.word func_eefree  
      0033EF                       4854 	_dict_entry,4,EDIT,edit 
      00B08D 20 E9                    1 	.word LINK 
                           0033F1     2 	LINK=.
      0033F1                          3 EDIT:
      00B08F 4D                       4 	.byte 4   	
      00B090 27 05 55 00              5 	.ascii "EDIT"
      00B094 03 00                    6 	.word edit  
      0033F8                       4855 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00B096 02 81                    1 	.word LINK 
                           0033FA     2 	LINK=.
      00B098                          3 DWRITE:
      00B098 CD                       4 	.byte 6+F_CMD   	
      00B099 B0 6D 5F 97 4F 81        5 	.ascii "DWRITE"
      00B09F 26 9F                    6 	.word digital_write  
      003403                       4856 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00B09F CD 98                    1 	.word LINK 
                           003405     2 	LINK=.
      003405                          3 DROP:
      00B0A1 3B                       4 	.byte 4   	
      00B0A2 A1 84 27 03              5 	.ascii "DROP"
      00B0A6 CC 96                    6 	.word xdrop  
      00340C                       4857 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00B0A8 D7 5D                    1 	.word LINK 
                           00340E     2 	LINK=.
      00340E                          3 DREAD:
      00B0AA 27                       4 	.byte 5+F_IFUNC   	
      00B0AB 05 72 1B 50 14           5 	.ascii "DREAD"
      00B0B0 81 68                    6 	.word digital_read  
      00B0B1                       4858 	_dict_entry,2,DO,do_loop
      00B0B1 72 1A                    1 	.word LINK 
                           003418     2 	LINK=.
      003418                          3 DO:
      00B0B3 50                       4 	.byte 2   	
      00B0B4 14 81                    5 	.ascii "DO"
      00B0B6 2E 1E                    6 	.word do_loop  
      00341D                       4859 	_dict_entry,3,DIR,cmd_dir
      00B0B6 AE 16                    1 	.word LINK 
                           00341F     2 	LINK=.
      00341F                          3 DIR:
      00B0B8 E0                       4 	.byte 3   	
      00B0B9 4F 81 52                 5 	.ascii "DIR"
      00B0BB 29 23                    6 	.word cmd_dir  
      003425                       4860 	_dict_entry,3,DIM,cmd_dim 
      00B0BB CD 9C                    1 	.word LINK 
                           003427     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      003427                          3 DIM:
      00B0BD 60                       4 	.byte 3   	
      00B0BE 81 49 4D                 5 	.ascii "DIM"
      00B0BF 1D 77                    6 	.word cmd_dim  
      00342D                       4861 	_dict_entry,3,DEC,dec_base
      00B0BF 90 F6                    1 	.word LINK 
                           00342F     2 	LINK=.
      00342F                          3 DEC:
      00B0C1 93                       4 	.byte 3   	
      00B0C2 EE 01 72                 5 	.ascii "DEC"
      00B0C5 A9 00                    6 	.word dec_base  
      003435                       4862 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00B0C7 03 81                    1 	.word LINK 
                           003437     2 	LINK=.
      00B0C9                          3 DDR:
      00B0C9 CD                       4 	.byte 3+F_IFUNC   	
      00B0CA 9B 47 A1                 5 	.ascii "DDR"
      00B0CD 84 27                    6 	.word const_ddr  
      00343D                       4863 	_dict_entry,4,DATA,data  
      00B0CF 03 CC                    1 	.word LINK 
                           00343F     2 	LINK=.
      00343F                          3 DATA:
      00B0D1 96                       4 	.byte 4   	
      00B0D2 D7 90 F6 93              5 	.ascii "DATA"
      00B0D6 EE 01                    6 	.word data  
      003446                       4864 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00B0D8 72 A9                    1 	.word LINK 
                           003448     2 	LINK=.
      003448                          3 CR2:
      00B0DA 00                       4 	.byte 3+F_IFUNC   	
      00B0DB 03 4D 27                 5 	.ascii "CR2"
      00B0DE 05 A6                    6 	.word const_cr2  
      00344E                       4865 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00B0E0 0A CC                    1 	.word LINK 
                           003450     2 	LINK=.
      003450                          3 CR1:
      00B0E2 96                       4 	.byte 3+F_IFUNC   	
      00B0E3 D9 A3 00                 5 	.ascii "CR1"
      00B0E6 14 22                    6 	.word const_cr1  
      003456                       4866 	_dict_entry,5,CONST,cmd_const 
      00B0E8 F6 A6                    1 	.word LINK 
                           003458     2 	LINK=.
      003458                          3 CONST:
      00B0EA 03                       4 	.byte 5   	
      00B0EB 42 CF 00 0E 72           5 	.ascii "CONST"
      00B0F0 B2 00                    6 	.word cmd_const  
      003460                       4867 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00B0F2 0E 90                    1 	.word LINK 
                           003462     2 	LINK=.
      003462                          3 CHAR:
      00B0F4 A3                       4 	.byte 4+F_CFUNC   	
      00B0F5 17 60 22 05              5 	.ascii "CHAR"
      00B0F9 A6 01                    6 	.word func_char  
      003469                       4868 	_dict_entry,3,BYE,bye 
      00B0FB CC 96                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



                           00346B     2 	LINK=.
      00346B                          3 BYE:
      00B0FD D9                       4 	.byte 3   	
      00B0FE 42 59 45                 5 	.ascii "BYE"
      00B0FE 81 C7                    6 	.word bye  
      00B0FF                       4869 	_dict_entry,5,BTOGL,bit_toggle
      00B0FF CD 9B                    1 	.word LINK 
                           003473     2 	LINK=.
      003473                          3 BTOGL:
      00B101 47                       4 	.byte 5   	
      00B102 A1 84 27 03 CC           5 	.ascii "BTOGL"
      00B107 96 D7                    6 	.word bit_toggle  
      00347B                       4870 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00B109 90 F6                    1 	.word LINK 
                           00347D     2 	LINK=.
      00347D                          3 BTEST:
      00B10B 93                       4 	.byte 5+F_IFUNC   	
      00B10C EE 01 72 A9 00           5 	.ascii "BTEST"
      00B111 03 9F                    6 	.word bit_test  
      003485                       4871 	_dict_entry,4,BSET,bit_set 
      00B113 A4 1F                    1 	.word LINK 
                           003487     2 	LINK=.
      003487                          3 BSET:
      00B115 5F                       4 	.byte 4   	
      00B116 97 A6 03 42              5 	.ascii "BSET"
      00B11A CF 00                    6 	.word bit_set  
      00348E                       4872 	_dict_entry,4,BRES,bit_reset
      00B11C 0E 72                    1 	.word LINK 
                           003490     2 	LINK=.
      003490                          3 BRES:
      00B11E B9                       4 	.byte 4   	
      00B11F 00 0E 90 A3              5 	.ascii "BRES"
      00B123 17 73                    6 	.word bit_reset  
      003497                       4873 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00B125 23 04                    1 	.word LINK 
                           003499     2 	LINK=.
      003499                          3 BIT:
      00B127 90                       4 	.byte 3+F_IFUNC   	
      00B128 AE 17 73                 5 	.ascii "BIT"
      00B12B 81 F8                    6 	.word bitmask  
      00B12C                       4874 	_dict_entry,3,AWU,awu 
      00B12C 4D 26                    1 	.word LINK 
                           0034A1     2 	LINK=.
      0034A1                          3 AWU:
      00B12E 16                       4 	.byte 3   	
      00B12F A3 00 14                 5 	.ascii "AWU"
      00B132 22 11                    6 	.word awu  
      0034A7                       4875 	_dict_entry,3+F_IFUNC,ASC,ascii
      00B134 A6 03                    1 	.word LINK 
                           0034A9     2 	LINK=.
      0034A9                          3 ASC:
      00B136 42                       4 	.byte 3+F_IFUNC   	
      00B137 CF 00 0E                 5 	.ascii "ASC"
      00B13A 93 72                    6 	.word ascii  
      0034AF                       4876 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00B13C BB 00                    1 	.word LINK 
                           0034B1     2 	LINK=.
      0034B1                          3 AND:
      00B13E 0E                       4 	.byte 3+F_AND   	
      00B13F A3 17 73                 5 	.ascii "AND"
      00B142 24 01                    6 	.word TK_AND  
      0034B7                       4877 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00B144 81 A6                    1 	.word LINK 
                           0034B9     2 	LINK=.
      0034B9                          3 ALLOC:
      00B146 0A                       4 	.byte 5   	
      00B147 CC 96 D9 4F 43           5 	.ascii "ALLOC"
      00B14A 30 49                    6 	.word xalloc  
      0034C1                       4878 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00B14A CD 9A                    1 	.word LINK 
                           0034C3     2 	LINK=.
      0034C3                          3 ADCREAD:
      00B14C 03                       4 	.byte 7+F_IFUNC   	
      00B14D A1 02 27 03 CC 96 D7     5 	.ascii "ADCREAD"
      00B154 90 F6                    6 	.word analog_read  
      0034CD                       4879 	_dict_entry,5,ADCON,power_adc 
      00B156 93 EE                    1 	.word LINK 
                           0034CF     2 	LINK=.
      0034CF                          3 ADCON:
      00B158 01                       4 	.byte 5   	
      00B159 72 A9 00 03 89           5 	.ascii "ADCON"
      00B15E 88 90                    6 	.word power_adc  
      0034D7                       4880 kword_dict::
      0034D7                       4881 	_dict_entry,3+F_IFUNC,ABS,abs
      00B160 F6 93                    1 	.word LINK 
                           0034D9     2 	LINK=.
      0034D9                          3 ABS:
      00B162 EE                       4 	.byte 3+F_IFUNC   	
      00B163 01 72 A9                 5 	.ascii "ABS"
      00B166 00 03                    6 	.word abs  
                                   4882 
                           000000  4883 INDIRECT=0 
                           000000  4884 .if INDIRECT 
                                   4885 ;comands and fonctions address table 	
                                   4886 code_addr::
                                   4887 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4888 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4889 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4890 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4891 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4892 	.word let,list,log2,lshift,next,new ; 40..47
                                   4893 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4894 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4895 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4896 	.word restore,return, random,rshift,run,free ; 72..79
                                   4897 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4898 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4899 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4900 	.word func_eefree,0 
                                   4901 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



                                   4902 
                                   4903 
                                   4904 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
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
      0034DF                         30 test:
      0034DF                         31     _vars VSIZE 
      00B168 CD B1            [ 2]    1     sub sp,#VSIZE 
      00B16A 2C CF 00         [ 2]   32     ldw x,#LOOP_CNT
      00B16D 1A 84            [ 2]   33     ldw (CNTR,sp),x  
      00B16F 85 72 C7         [ 2]   34     ldw x,ticks 
      00B172 00 1A            [ 2]   35     ldw (T,sp),x
      0034EB                         36 1$: ; test add24 
      00B174 72 5C            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00B176 00 1B 72         [ 2]   38     ldw x,#VAL1&0XFFFF
      00B179 CF 00 1A         [ 1]   39     ld acc24,a 
      00B17C 81 00 0D         [ 2]   40     ldw acc24+1,x  
      00B17D A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00B17D CD 99 FE         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00B180 A1 01 27         [ 4]   43     call add24 
      00B183 03 CC            [ 2]   44     ldw x,(CNTR,sp)
      00B185 96 D7 90         [ 2]   45     subw x,#1
      00B188 F6 93            [ 2]   46     ldw (CNTR,sp),x 
      00B18A EE 01            [ 1]   47     jrne 1$
      00B18C 72 A9 00         [ 4]   48     call prt_acc24
      00B18F 03 CD            [ 1]   49     ld a,#SPACE 
      00B191 B1 2C F6         [ 4]   50     call putc 
      00B194 EE 01 81         [ 2]   51     ldw x,ticks 
      00B197 72 F0 01         [ 2]   52     subw x,(T,sp)
      00B197 00 00 03         [ 4]   53     call prt_i16  
      00B199 A6 0D            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00B199 A3 58 4F         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00B19C 52 00 8A         [ 2]   58     ldw x,LOOP_CNT
      00B19F B1 99            [ 2]   59     ldw (CNTR,sp),x 
      00B1A1 CE 00 0F         [ 2]   60     ldw x,ticks 
      00B1A1 05 57            [ 2]   61     ldw (T,sp),x 
      003527                         62 2$: 
      00B1A3 52 49            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00B1A5 54 45 A9         [ 2]   64     ldw x,#VAL1&0XFFFF
      00B1A8 FF B1 A1         [ 1]   65     ld acc24,a 
      00B1AB CF 00 0D         [ 2]   66     ldw acc24+1,x  
      00B1AB 05 57            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00B1AD 4F 52 44         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00B1B0 53 AD 7C         [ 4]   69     call mul24 
      00B1B3 B1 AB            [ 2]   70     ldw x,(CNTR,sp)
      00B1B5 1D 00 01         [ 2]   71     subw x,#1
      00B1B5 04 57            [ 2]   72     ldw (CNTR,sp),x 
      00B1B7 41 49            [ 1]   73     jrne 2$ 
      00B1B9 54 A1 5A         [ 4]   74    call prt_acc24 
      00B1BC B1 B5            [ 1]   75    ld a,#SPACE 
      00B1BE CD 08 DE         [ 4]   76    call putc 
      00B1BE 13 55 53         [ 2]   77     ldw x,ticks 
      00B1C1 52 AB 21         [ 2]   78     subw x,(T,sp)
      00B1C4 B1 BE 03         [ 4]   79     call prt_i16 
      00B1C6 A6 0D            [ 1]   80     ld a,#CR 
      00B1C6 05 55 4E         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00B1C9 54 49 4C         [ 2]   83     ldw x,LOOP_CNT
      00B1CC AE B1            [ 2]   84     ldw (CNTR,sp),x 
      00B1CE B1 C6 0F         [ 2]   85     ldw x,ticks 
      00B1D0 1F 01            [ 2]   86     ldw (T,sp),x 
      003563                         87 3$: 
      00B1D0 16 55            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B1D2 46 4C 41         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B1D5 53 48 AA         [ 1]   90     ld acc24,a 
      00B1D8 FF B1 D0         [ 2]   91     ldw acc24+1,x  
      00B1DB A6 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B1DB 16 55 42         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B1DE 4F 55 4E         [ 4]   94     call mul24 
      00B1E1 44 9D            [ 2]   95     ldw x,(CNTR,sp)
      00B1E3 14 B1 DB         [ 2]   96     subw x,#1
      00B1E6 1F 03            [ 2]   97     ldw (CNTR,sp),x 
      00B1E6 04 54            [ 1]   98     jrne 3$ 
      00B1E8 4F 4E 45         [ 4]   99     call prt_acc24    
      00B1EB A6 01            [ 1]  100     ld a,#SPACE 
      00B1ED B1 E6 DE         [ 4]  101     call putc 
      00B1EF CE 00 0F         [ 2]  102     ldw x,ticks 
      00B1EF 02 54 4F         [ 2]  103     subw x,(T,sp)
      00B1F2 A2 C4 B1         [ 4]  104     call prt_i16 
      00B1F5 EF 0D            [ 1]  105     ld a,#CR 
      00B1F6 CD 08 DE         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B1F6 05 54 49         [ 2]  108     ldw x,LOOP_CNT
      00B1F9 4D 45            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00B1FB 52 AD E6         [ 2]  110     ldw x,ticks 
      00B1FE B1 F6            [ 2]  111     ldw (T,sp),x 
      00B200                        112 4$:
      00B200 17 54            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B202 49 4D 45         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B205 4F 55 54         [ 1]  115     ld acc24,a 
      00B208 AD FD B2         [ 2]  116     ldw acc24+1,x  
      00B20B 00 FF            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B20C AE FF FD         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B20C 15 54 49         [ 4]  119     call mul24 
      00B20F 43 4B            [ 2]  120     ldw x,(CNTR,sp)
      00B211 53 AB CD         [ 2]  121     subw x,#1
      00B214 B2 0C            [ 2]  122     ldw (CNTR,sp),x 
      00B216 26 E4            [ 1]  123     jrne 4$ 
      00B216 04 53 54         [ 4]  124     call prt_acc24 
      00B219 4F 50            [ 1]  125     ld a,#SPACE 
      00B21B A7 6A B2         [ 4]  126     call putc 
      00B21E 16 00 0F         [ 2]  127     ldw x,ticks 
      00B21F 72 F0 01         [ 2]  128     subw x,(T,sp)
      00B21F 04 53 54         [ 4]  129     call prt_i16 
      00B222 45 50            [ 1]  130     ld a,#CR 
      00B224 A3 0A B2         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B227 1F 27 10         [ 2]  133     ldw x,LOOP_CNT
      00B228 1F 03            [ 2]  134     ldw (CNTR,sp),x 
      00B228 05 53 50         [ 2]  135     ldw x,ticks 
      00B22B 49 57            [ 2]  136     ldw (T,sp),x 
      0035DB                        137 5$: 
      00B22D 52 B0            [ 1]  138     ld a,#0xff
      00B22F 78 B2 28         [ 2]  139     ldw x,#0xffff
      00B232 CD 01 E3         [ 4]  140     call abs24 
      00B232 06 53 50         [ 1]  141     ld acc24,a 
      00B235 49 53 45         [ 2]  142     ldw acc24+1,x
      00B238 4C B0            [ 2]  143     ldw x,(CNTR,sp)
      00B23A 9F B2 32         [ 2]  144     subw x,#1
      00B23D 1F 03            [ 2]  145     ldw (CNTR,sp),x 
      00B23D 15 53            [ 1]  146     jrne 5$ 
      00B23F 50 49 52         [ 4]  147     call prt_acc24 
      00B242 44 B0            [ 1]  148     ld a,#SPACE 
      00B244 98 B2 3D         [ 4]  149     call putc 
      00B247 CE 00 0F         [ 2]  150     ldw x,ticks 
      00B247 05 53 50         [ 2]  151     subw x,(T,sp)
      00B24A 49 45 4E         [ 4]  152     call prt_i16 
      003603                        153 6$:
      00B24D B0 00            [ 1]  154     ld a,#CR 
      00B24F B2 47 DE         [ 4]  155     call putc 
      00B251 CD 36 4E         [ 4]  156     call read_integer 
      00B251 05 53 4C 45 45   [ 1]  157     mov farptr,acc24 
      00B256 50 AB 50 B2 51   [ 1]  158     mov farptr+1,acc16 
      00B25B 55 00 0E 00 1A   [ 1]  159     mov farptr+2,acc8 
      00B25B 04 53 49         [ 4]  160     call read_integer 
      00B25E 5A 45 9C         [ 1]  161     ld a,acc24 
      00B261 E7 B2 5B         [ 2]  162     ldw x,acc16 
      00B264 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00B264 04 53 41 56 45   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00B269 A8 BD B2 64 0E   [ 1]  165     mov acc8,farptr+2 
      00B26D CD 02 F7         [ 4]  166     call div24 
      00B26D 03               [ 1]  167     push a 
      00B26E 52               [ 2]  168     pushw x 
      00B26F 55 4E A5         [ 4]  169     call prt_acc24 
      00B272 34 B2            [ 1]  170     ld a,#SPACE 
      00B274 6D 08 DE         [ 4]  171     call putc 
      00B275 85               [ 2]  172     popw x
      00B275 16 52 53         [ 2]  173     ldw acc16,x  
      00B278 48 49 46         [ 1]  174     pop acc24 
      00B27B 54 AC 17         [ 4]  175     call prt_acc24
      00B27E B2 75            [ 2]  176     jra 6$
      00B280                        177     _drop VSIZE 
      00B280 13 52            [ 2]    1     addw sp,#VSIZE 
      00B282 4E               [ 4]  178     ret 
                                    179 
                                    180 
      00364E                        181 read_integer:
      00B283 44 AC            [ 1]  182     ld a,#'? 
      00B285 E1 B2 80         [ 4]  183     call putc  
      00B288 72 5F 00 03      [ 1]  184 	clr count  
      00B288 06 52 45         [ 4]  185 	call readln 
      00B28B 54 55 52         [ 2]  186 	ldw x,#tib 
      00B28E 4E A5 03         [ 1]  187 	push count
      00B291 B2 88            [ 1]  188 	push #0 
      00B293 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00B293 07               [ 1]  190 	incw x 
      003666                        191 	_drop 2 
      00B294 52 45            [ 2]    1     addw sp,#2 
      00B296 53 54 4F 52      [ 1]  192 	clr in 
      00B29A 45 AF 48         [ 4]  193 	call get_token
      00B29D B2 93            [ 1]  194 	cp a,#TK_INTGR
      00B29F 27 0F            [ 1]  195 	jreq 3$ 
      00B29F 03 52            [ 1]  196 	cp a,#TK_MINUS
      00B2A1 45 4D A1         [ 4]  197 	call get_token 
      00B2A4 54 B2            [ 1]  198 	cp a,#TK_INTGR 
      00B2A6 9F 03            [ 1]  199 	jreq 2$
      00B2A7 CC 16 57         [ 2]  200 	jp syntax_error
      00367F                        201 2$:
      00B2A7 06 52 45         [ 4]  202 	call neg_acc24  	
      003682                        203 3$: 
      00B2AA 42               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
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
      00B2AB 4F 4F                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B2AD 54 81                   32 app_size: .word 0 
      003704                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0034D9 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0034CF R
    ADCON_ID=  000002     |   4 ADCREAD    0034C3 R   |     ADCREAD_=  000004 
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
  4 ALLOC      0034B9 R   |   4 AND        0034B1 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        0034A9 R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   00014C R   |   4 AWU        0034A1 R
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
  4 BIT        003499 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCKS  =  000005     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000D 
  4 BRES       003490 R   |     BRES_IDX=  00000C     |     BS      =  000008 
  4 BSET       003487 R   |     BSET_IDX=  00000E     |     BSIZE   =  000006 
  4 BTEST      00347D R   |     BTEST_ID=  000010     |   4 BTOGL      003473 R
    BTOGL_ID=  000012     |     BTW     =  000001     |   4 BYE        00346B R
    BYE_IDX =  000014     |     C       =  000001     |     CAN     =  000018 
  4 CANT_DO    0028D7 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
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
    CFG_GCR_=  000000     |   4 CHAR       003462 R   |     CHAR_IDX=  000016 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
    CMD_END =  000002     |     CNT     =  000006     |     CNTR    =  000003 
    CNT_LO  =  000004     |     CODE_ADD=  000001     |     COMMA   =  00002C 
  4 CONST      003458 R   |     CONST_ID=  0000B6     |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        003450 R   |     CR1_IDX =  00001A 
  4 CR2        003448 R   |     CR2_IDX =  000018     |     CTRL_A  =  000001 
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
    CX_IN   =  000003     |   4 DATA       00343F R   |     DATA_IDX=  00001C 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        003437 R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        00342F R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   4 DIM        003427 R
  4 DIR        00341F R   |     DIVISOR =  000001     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  4 DO         003418 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
    DO_IDX  =  000022     |   4 DREAD      00340E R   |     DREAD_ID=  000024 
  4 DROP       003405 R   |   4 DWRITE     0033FA R   |     DWRITE_I=  000026 
  4 EDIT       0033F1 R   |     EDIT_IDX=  000028     |   4 EEFREE     0033E6 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    EEFREE_I=  0000B8     |   4 EEPROM     0033DB R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EM      =  000019     |   4 END        0033D3 R   |     END_IDX =  00002C 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      0033C9 R   |   4 ERASED     0028D5 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_NO_P=  000012 
    ERR_OVER=  000010     |     ERR_RD_O=  000011     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       0033C0 R
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
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   001E7E R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        0033B8 R   |     FOR_IDX =  000034     |   4 FREE       0033AF R
    FREE_IDX=  000088     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_AND   =  000080     |     F_CFUNC =  000020     |     F_CMD   =  000000 
    F_CONST =  000030     |     F_IFUNC =  000010     |     F_NOT   =  000070 
    F_OR    =  000090     |     F_XOR   =  0000A0     |   4 GET        0033A7 R
    GET_IDX =  0000B4     |   4 GOSUB      00339D R   |     GOSUB_ID=  000036 
  4 GOTO       003394 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        00338C R   |     HEX_IDX =  00003A 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003384 R
    IDR_IDX =  00003C     |   4 IF         00337D R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INDIRECT=  000000 
    INP     =  000000     |   4 INPUT      003373 R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     003368 R   |     IWDGEN_I=  000042 
  4 IWDGREF    00335C R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        003354 R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        00334C R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0034D9 R   |   4 LIST       003343 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       00333A R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     00332F R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NAME_MAX=  00000F     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        003327 R   |     NEW_IDX =  000052     |   4 NEXT       00331E R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        003316 R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |   4 NO_APP     002906 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        00330E R   |     ODR_IDX =  000054     |   4 ON         003307 R
    ONOFF   =  000003     |     ON_IDX  =  0000B2     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         003300 R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        0032F8 R   |     PAD_IDX =  000056 
    PAD_SIZE=  000080     |   4 PAUSE      0032EE R   |     PAUSE_ID=  000058 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       0032E5 R   |     PEEK_IDX=  00005C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   4 PICK       0032DC R   |     PINNO   =  000001 
  4 PINP       0032D3 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      0032C9 R   |     PMODE_ID=  00005A     |   4 POKE       0032C0 R
    POKE_IDX=  000060     |   4 POP        0032B8 R   |   4 PORTA      00329B R
  4 PORTB      003291 R   |   4 PORTC      003287 R   |   4 PORTD      00327D R
  4 PORTE      003273 R   |   4 PORTF      003269 R   |   4 PORTG      00325F R
  4 PORTI      003255 R   |   4 POUT       0032AF R   |     POUT_IDX=  000062 
    PREV    =  000001     |     PRG_SIZE=  000003     |   4 PRINT      0032A5 R
    PROD    =  000001     |     PROD_SIG=  000004     |   4 PROG_ADD   001E54 R
  4 PROG_SIZ   001E66 R   |     PRTA_IDX=  000066     |     PRTB_IDX=  000068 
    PRTC_IDX=  00006A     |     PRTD_IDX=  00006C     |     PRTE_IDX=  00006E 
    PRTF_IDX=  000070     |     PRTG_IDX=  000072     |     PRTI_IDX=  000074 
    PRT_IDX =  000064     |     PSIZE   =  00000B     |     PSTR    =  000003 
  4 PUSH       00324C R   |   4 PUT        003244 R   |   4 QKEY       00323B R
    QKEY_IDX=  000076     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001E8F R   |     RAM_SIZE=  001800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    RBT_IDX =  00007A     |   4 READ       003232 R   |     READ_IDX=  000078 
  4 REBOOT     003227 R   |     RECLEN  =  000005     |     REC_LEN =  000003 
    REC_XTRA=  000005     |   4 REG_A      0004CA R   |   4 REG_CC     0004CE R
  4 REG_PC     0004BE R   |   4 REG_SP     0004D3 R   |   4 REG_X      0004C6 R
  4 REG_Y      0004C2 R   |     RELOP   =  000001     |   4 REM        00321F R
    REM_IDX =  00007C     |   4 RESTORE    003213 R   |     REST_IDX=  00007E 
    RETL1   =  000001     |   4 RETURN     003208 R   |     RET_ADDR=  000001 
    RET_BPTR=  000003     |     RET_IDX =  000080     |     RET_INW =  000005 
  4 RND        003200 R   |     RND_IDX =  000082     |     RONLY   =  000005 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     0031F5 R
    RSHIFT_I=  000084     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        0031ED R   |     RUN_IDX =  000086     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000001     |     R_CC    =  000009 
    R_PC    =  00000A     |     R_X     =  000002     |     R_Y     =  000004 
  4 SAVE       0031E4 R   |     SAVE_IDX=  000032     |     SAV_ACC1=  000006 
    SAV_ACC2=  000008     |     SAV_COUN=  00000A     |     SAV_IN  =  000009 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   0028D3 R   |   4 SIZE       0031DB R   |     SIZE_IDX=  0000B0 
    SKIP    =  000005     |   4 SLEEP      0031D1 R   |     SLEEP_ID=  00008A 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      0031C7 R   |     SPIEN_ID=  00008E     |   4 SPIRD      0031BD R
    SPIRD_ID=  00008C     |   4 SPISEL     0031B2 R   |     SPISEL_I=  000090 
  4 SPIWR      0031A8 R   |     SPIWR_ID=  000092     |     SPI_CR1 =  005200 
    SPI_CR1_=  000003     |     SPI_CR1_=  000000     |     SPI_CR1_=  000001 
    SPI_CR1_=  000007     |     SPI_CR1_=  000002     |     SPI_CR1_=  000006 
    SPI_CR2 =  005201     |     SPI_CR2_=  000007     |     SPI_CR2_=  000006 
    SPI_CR2_=  000005     |     SPI_CR2_=  000004     |     SPI_CR2_=  000002 
    SPI_CR2_=  000000     |     SPI_CR2_=  000001     |     SPI_CRCP=  005205 
    SPI_CS_B=  000005     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  00008C     |   4 STATES     000481 R   |   4 STEP       00319F R
    STEP_IDX=  000094     |   4 STOP       003196 R   |     STOP_IDX=  000096 
    STR     =  000003     |   4 STR_BYTE   001E77 R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |   4 SysCall    000012 R   |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      00318C R   |     TICKS_ID=  000098 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
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
    TIM4_SR_=  000000     |   4 TIMEOUT    003180 R   |   4 TIMER      003176 R
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
    TK_XOR  =  00008A     |     TMROUT_I=  00009C     |   4 TO         00316F R
  4 TONE       003166 R   |     TONE_IDX=  0000A0     |     TOWRITE =  000005 
    TO_IDX  =  00009E     |   4 Timer4Up   000013 R   |     U8      =  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     00315B R   |     UBOUND_I=  0000A2     |   4 UBTN_Han   00005A R
  4 UFLASH     003150 R   |     UFLASH_I=  0000A4     |   4 UNTIL      003146 R
    UNTIL_ID=  0000A6     |     US      =  00001F     |   4 USER_ABO   000062 R
  4 USR        00313E R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000A8     |   4 Uart1RxH   00086C R
  4 UserButt   000036 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VAR_NAME=  000001     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       003135 R   |     WAIT_IDX=  0000AA     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |     WLKPTR  =  000003     |   4 WORDS      00312B R
    WORDS_ID=  0000AC     |   4 WRITE      003121 R   |     WRITE_ID=  0000AE 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        003119 R   |     XOR_IDX =  0000FE     |     XSAVE   =  000002 
    XSTACK_E=  001773     |     XSTACK_S=  000014     |     XTEMP   =  000001 
    YSAVE   =  000004     |   4 abs        002B54 R   |   4 abs24      0001E3 R
  5 acc16      00000D GR  |   5 acc24      00000C GR  |   5 acc32      00000B GR
  5 acc8       00000E GR  |   4 accept_c   000B9A R   |   4 add24      00016E R
  4 add_char   001305 R   |   4 add_spac   0010FD R   |   4 analog_r   00262C R
  4 and_cond   001B8E R   |   4 and_fact   001B5E R   |   4 app        003704 R
  4 app_sign   003700 R   |   4 app_size   003702 R   |   4 app_spac   003700 GR
  4 arduino_   002C41 R   |   4 arg_list   001983 R   |   5 array_si   000020 R
  4 ascii      0029FF R   |   4 at_tst     000F6F R   |   4 atoi24     0018A5 GR
  4 atoi_exi   001914 R   |   4 awu        002AFB R   |   4 awu02      002B0E R
  4 bad_port   002A7A R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       0025A3 R   |   4 beep_1kh   002576 GR  |   4 bin_exit   000DD6 R
  4 bit_rese   002139 R   |   4 bit_set    002117 R   |   4 bit_test   00217E R
  4 bit_togg   00215C R   |   4 bitmask    002DF8 R   |   4 bkslsh_t   000F1C R
  4 bksp       000945 R   |   2 block_bu   0016E0 GR  |   4 block_er   000755 R
  4 break_po   002718 R   |   4 bye        002AC7 R   |   4 clear_ba   001471 R
  4 clear_bl   002829 R   |   4 clear_va   0013C9 R   |   4 clock_in   00007D R
  4 cmd_cons   001D63 R   |   4 cmd_dim    001D77 R   |   4 cmd_dim1   001D81 R
  4 cmd_dim2   001D87 R   |   4 cmd_dir    002923 R   |   4 cmd_end    002542 R
  4 cmd_get    002549 R   |   4 cmd_itf    0004EE R   |   4 cmd_line   0016E6 R
  4 cmd_name   001325 R   |   4 cmd_on     0023B3 R   |   4 cmd_size   001C67 R
  4 cold_sta   0000B5 R   |   4 colon_ts   000F43 R   |   4 comma_ts   000F4E R
  4 comp_msg   001636 R   |   4 compile    001069 GR  |   4 conditio   001BE0 R
  4 const_cr   002E9B R   |   4 const_cr   002EA0 R   |   4 const_dd   002E96 R
  4 const_ee   002EAF R   |   4 const_id   002E91 R   |   4 const_in   002EAA R
  4 const_od   002E8C R   |   4 const_ou   002EA5 R   |   4 const_po   002E64 R
  4 const_po   002E69 R   |   4 const_po   002E6E R   |   4 const_po   002E73 R
  4 const_po   002E78 R   |   4 const_po   002E7D R   |   4 const_po   002E82 R
  4 const_po   002E87 R   |   4 convert_   000D46 R   |   4 convert_   000909 R
  4 copy_com   000FA4 R   |   5 count      000003 GR  |   4 cp24       0001A8 R
  4 cp24_ax    0001DA R   |   4 cp_loop    001934 R   |   4 cpl24      0001EA R
  4 cpy_cmd_   0010E5 R   |   4 cpy_quot   001125 R   |   4 create_g   000C70 R
  4 cs_high    003031 R   |   4 dash_tst   000F64 R   |   4 data       002EB4 R
  4 data_err   002F2D R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001C59 R   |   4 decomp_l   0011BD R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

  4 decompil   001175 GR  |   4 del_line   000C43 R   |   4 delete_l   000A32 R
  4 delete_n   000955 R   |   4 delete_u   0009F7 R   |   4 digital_   002668 R
  4 digital_   00269F R   |   4 div24      0002F7 R   |   4 divu24_8   0002D9 R
  4 do_loop    002E1E R   |   4 do_progr   000748 R   |   4 dup24      00015F R
  5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR  |   4 edit       001F27 R
  4 enable_i   002D88 R   |   4 eql_tst    000FEF R   |   4 equal      001318 R
  4 eras0      00279D R   |   4 erase      002793 R   |   4 erase_ex   000779 R
  4 erase_fl   00076F R   |   4 erase_pr   002740 R   |   4 err_bad_   00155F R
  4 err_buf_   0015D5 R   |   4 err_cmd_   001523 R   |   4 err_div0   0014E8 R
  4 err_dupl   00153D R   |   4 err_math   0014CF R   |   4 err_mem_   0014B4 R
  4 err_msg    00148E R   |   4 err_no_a   00156B R   |   4 err_no_d   00159E R
  4 err_no_f   0015C2 R   |   4 err_no_l   0014F7 R   |   4 err_no_p   0015AE R
  4 err_not_   00154E R   |   4 err_not_   001608 R   |   4 err_over   0015E2 R
  4 err_read   0015EC R   |   4 err_run_   00150D R   |   4 err_synt   0014C1 R
  4 escaped    000D5B GR  |   4 expect     001971 R   |   4 expressi   001AC7 R
  4 factor     0019CF R   |   5 farptr     000018 R   |   4 fcpu       002BC3 R
  4 fetchc     0005F5 R   |   4 fill_wri   002819 R   |   4 final_te   000B93 R
  4 first_li   001ED1 R   |   5 flags      000022 GR  |   4 for        002214 R
  4 free       001C5E R   |   5 free_eep   000024 R   |   7 free_ram   000090 R
  4 func_arg   00197E R   |   4 func_cha   0029E8 R   |   4 func_eef   001CF3 R
  4 ge         00131A R   |   4 get_addr   0017E3 R   |   4 get_arra   00199F R
  4 get_char   0017FD R   |   4 get_esca   000915 R   |   4 get_int2   0017ED R
  4 get_targ   002341 R   |   4 get_targ   00234F R   |   4 get_tick   002B4D R
  4 get_toke   000EB5 GR  |   4 get_valu   001CE2 R   |   4 getc       0008EE GR
  4 gosub      00245F R   |   4 gosub_1    00246A R   |   4 gosub_2    002470 R
  4 goto       002445 R   |   4 goto_1     00244F R   |   4 gpio       002A4F R
  4 gt         001316 R   |   4 gt_tst     000FFA R   |   4 hex_base   001C54 R
  4 hex_dump   000635 R   |   4 if         0021F7 R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   000850 R
  4 input_ex   0020CF R   |   4 input_lo   002039 R   |   4 input_va   002035 R
  4 insert_c   0009B4 R   |   4 insert_l   000C9C R   |   4 insert_l   000D0B R
  4 interp_l   001727 R   |   4 interpre   001702 R   |   4 invalid    00055D R
  4 invalid_   0005CB R   |   4 is_alnum   000E09 GR  |   4 is_alpha   000DEF GR
  4 is_data_   002EBA R   |   4 is_digit   000E00 GR  |   4 is_erase   00291C R
  4 is_progr   0024A0 R   |   4 is_symbo   000E12 R   |   4 itoa       001840 GR
  4 itoa_loo   001862 R   |   4 jp_to_ta   002452 R   |   4 key        002A3E R
  4 kword_di   0034D7 GR  |   4 kword_en   003117 R   |   4 le         00131F R
  4 ledoff     0003BD R   |   4 ledon      0003B8 R   |   4 ledtoggl   0003C2 R
  4 left_par   0003CB R   |   4 let        001C9F GR  |   4 let_arra   001CAD R
  4 let_dvar   001760 R   |   4 let_eval   001CB5 R   |   4 let_var    001CB2 R
  4 lines_sk   001ED4 R   |   4 list       001E9E R   |   4 list_exi   001F16 R
  4 list_loo   001EF4 R   |   4 log2       002DCB R   |   4 look_tar   002372 R
  4 loop_bac   002324 R   |   5 loop_dep   00001F R   |   4 loop_don   002339 R
  4 lshift     002B6B R   |   4 lt         00131D R   |   4 lt_tst     001023 R
  4 mem_peek   000579 R   |   4 mod24      000391 R   |   4 move       001385 GR
  4 move_dow   0013A4 R   |   4 move_era   0006D7 R   |   4 move_exi   0013C5 R
  4 move_lef   00098C R   |   4 move_loo   0013A9 R   |   4 move_prg   000717 R
  4 move_rig   00099A R   |   4 move_up    001396 R   |   4 mul24      000269 R
  4 mul_char   001307 R   |   4 mulu24_8   00022A R   |   4 nbr_tst    000EE8 R
  4 ne         001322 R   |   4 neg24      0001F3 R   |   4 neg_acc2   00020D R
  4 neg_ax     000205 R   |   4 new        002736 R   |   4 next       0022CC R
  4 next_lin   00170A R   |   4 next_tok   0017BB GR  |   4 no_match   001946 R
  4 number     0005FB R   |   4 other      00104C R   |   4 overwrit   000BBF R
  2 pad        0016E0 GR  |   4 pad_ref    003036 R   |   4 parse_ad   0004D8 R
  4 parse_bi   000DB4 R   |   4 parse_in   000D63 R   |   4 parse_ke   000E35 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

  4 parse_qu   000D0E R   |   4 parse_sy   000E1D R   |   4 pause      002ADB R
  4 pause02    002AEE R   |   4 peek       0021D6 R   |   4 peek_byt   000595 R
  4 pin_mode   002BD2 R   |   4 plus_tst   000FC3 R   |   4 poke       0021B5 R
  4 power_ad   0025DC R   |   4 prcnt_ts   000FE4 R   |   4 print      001F8C R
  4 print_fa   0005DA R   |   4 print_he   000BF6 GR  |   4 print_re   000417 R
  4 print_st   00056D R   |   4 print_to   001828 R   |   4 prog_siz   001E0D R
  4 program_   001E15 R   |   4 program_   0006F1 R   |   4 program_   000717 R
  4 prt_acc2   00181A R   |   4 prt_basi   001F68 R   |   4 prt_i16    001803 R
  4 prt_loop   001F90 R   |   4 prt_peek   00039A GR  |   4 prt_reg1   0003F8 R
  4 prt_reg8   0003D6 R   |   5 ptr16      000019 GR  |   5 ptr8       00001A R
  4 putc       0008DE GR  |   4 puts       00093B GR  |   4 qgetc      0008E7 GR
  4 qkey       002A42 GR  |   4 qmark_ts   000F7A R   |   4 qsign      002812 R
  4 random     002C61 R   |   4 read       002F32 R   |   4 read01     002F37 R
  4 read_int   00364E R   |   4 readln     000A40 GR  |   4 readln_l   000A4F R
  4 readln_q   000BDC R   |   4 refresh_   002DC6 R   |   4 relation   001AFF R
  4 relop_st   00130A R   |   4 remark     0020D4 GR  |   4 repl       000517 R
  4 repl_exi   00053F R   |   4 reset_co   001F8E R   |   4 rest_con   002025 R
  4 restore    002EC8 R   |   4 return     002483 R   |   4 right_al   001113 GR
  4 row_alig   000835 R   |   4 row_eras   0006AA R   |   4 row_eras   0006D7 R
  4 row_loop   000618 R   |   4 rparnt_t   000F38 R   |   4 rshift     002B97 R
  7 rsign      00008C R   |   7 rsize      00008E R   |   4 rt_msg     001624 R
  4 run        0024B4 R   |   4 run_app    00012A R   |   4 run_it     00250F R
  4 run_it_0   002511 R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   00283D R   |   4 save_con   002015 R
  4 scan_blo   00085E R   |   4 search_d   001926 GR  |   4 search_e   00196E R
  4 search_l   000C18 GR  |   4 search_l   000C27 R   |   4 search_n   001D1C R
  4 search_n   00192A R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002C31 R   |   4 send_esc   000963 R   |   4 send_par   00096E R
  4 set_data   002EFE R   |   4 set_time   002D66 R   |   4 sharp_ts   000F59 R
  4 show_row   000606 R   |   4 single_c   001300 R   |   4 skip       000EA2 R
  4 skip_str   0017D4 R   |   4 slash_ts   000FD9 R   |   4 sleep      002AD0 R
  4 software   0013D8 R   |   4 spaces     0009A8 GR  |   4 spi_clea   002FCB R
  4 spi_disa   002FB3 R   |   4 spi_enab   002F80 R   |   4 spi_rcv_   002FED R
  4 spi_read   003018 R   |   4 spi_sele   00301F R   |   4 spi_send   002FD7 R
  4 spi_writ   002FF8 R   |   2 stack_fu   00179C GR  |   2 stack_un   001828 R
  4 star_tst   000FCE R   |   4 step       00228A R   |   4 stop       0026EA R
  4 store_lo   0022B9 R   |   4 str_matc   001953 R   |   4 str_tst    000ED8 R
  4 strcmp     001364 R   |   4 strcpy     001375 GR  |   4 strlen     001359 GR
  4 sub24      00018B R   |   4 symb_loo   000E1E R   |   4 syntax_e   001657 GR
  4 system_i   00141E R   |   5 tab_widt   000023 GR  |   4 tb_error   001659 GR
  4 term       001A84 R   |   4 term01     001A8C R   |   4 term_exi   001AC4 R
  4 test       0034DF R   |   4 test_p     000565 R   |   2 tib        001690 GR
  4 tick_tst   000F92 R   |   5 ticks      00000F R   |   4 timeout    002D7D R
  5 timer      000012 GR  |   4 timer2_i   000093 R   |   4 timer4_i   0000A0 R
  4 tk_id      001647 R   |   4 to         002244 R   |   4 to_eepro   000740 R
  4 to_flash   000745 R   |   4 to_hex_c   000C0D GR  |   4 to_upper   001899 GR
  4 token_ch   001062 R   |   4 token_ex   001066 R   |   4 tone       002581 R
  4 try_next   002F0B R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   0008EE GR  |   4 uart1_in   000899 R   |   4 uart1_pu   0008DE GR
  4 uart1_qg   0008E7 GR  |   4 uart1_se   0008A9 R   |   4 ubound     001C94 R
  4 uflash     002A7F R   |   4 unlock_e   000674 R   |   4 unlock_f   00068F R
  4 until      002E31 R   |   4 user_int   000049 R   |   4 usr        002AA1 R
  4 var_name   00116B GR  |   5 vars       000034 GR  |   4 wait       0020DA R
  4 warm_ini   00144F R   |   4 warm_sta   0016E3 R   |   4 words      002CFC R
  4 words_co   002D50 R   |   4 write      00297F R   |   4 write_bl   0007FA GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

  4 write_bu   000731 R   |   4 write_by   00077B R   |   4 write_ee   0007B7 R
  4 write_ex   0007F0 R   |   4 write_fl   0007A1 R   |   4 write_nb   00081F R
  4 xalloc     003049 R   |   4 xdrop      00307F R   |   4 xpick      0030FD R
  4 xpop       00303F R   |   4 xpush      00303B R   |   4 xput       0030CA R
  4 xstack_b   0030AC R   |   2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
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

